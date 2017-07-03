Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4F72E60765
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jul 2017 19:24:39 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id z6so26795014pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jul 2017 12:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=u1y6QooyRkkDtoN1fh5oPB2AHWjrPXhXalSucMp0vSc=;
	b=ruR4sdAHXLcpBk5X0+2sIS9KG9svCrxWda4OJW57fHIltXYXGE/u80k72z2Dkkjj6Z
	kA56VCD3Mk/rKWya1RkEy9dVpzb1SvKNwBSR72Pmt4VcLjtlEviU3xnef8jtfEmLSWH4
	3wQ+9GOUnPoe4SC1HkrDJ5jS7vz2oU1Uu8K/aSyNFluxAIT9PF5HsuLcnzJ9wjMvj3Ss
	kuIxxlh2xRIbO6qIWWNAuf3qx/Y9L2vWGfr4eDNtGiwiUWn/U0S1wq1yyT3XA9GSgdUJ
	yRZNRo6oGKDaM/kg9EDvLfDybf+TMtBOgDqYKy2B4vSesZzCDQcnaU0yABDdGwIEHoPt
	e8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u1y6QooyRkkDtoN1fh5oPB2AHWjrPXhXalSucMp0vSc=;
	b=Diw4gmCrsdnQUewjqJOMaPcGg/3z2gvtlplGEAmjHtyBgr8BQRcoHIzshz9ItHKA92
	vaKrQqjWLrOT6dlnweN3jjzxPoFNGYTxiyluF1sPCHgl/teM2V34OrHYag2x2CxeLZ68
	sgFEJuX+Y9Xe7lfUmWirauM+UYo2ut+SBKH9DY1vqtXl1WWZU2Nw/dZ5byjKOE4+F1LU
	rptGEAO8X4EfS2PxzdA/Xfaf6RoHenUcjHAMo73AlGCt/We+Lgy6KWjmwa128eFRlEkM
	MrW5EpuMcmQx8axNOfk/Q8SCYJIw+9/bhmGt7js0Y6lcXZbGDyoFzVr5y4h5I5w83tGj
	FZBw==
X-Gm-Message-State: AIVw113eR5kKS1AzGUyhv45Ix/lzh5ErCf9QqCJ7B9QdakwEkd+B/jIz
	n5OBTel+LgobihS/
X-Received: by 10.84.232.72 with SMTP id f8mr12023391pln.87.1499109880801;
	Mon, 03 Jul 2017 12:24:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	70sm36837061pft.104.2017.07.03.12.24.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 12:24:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jul 2017 12:24:32 -0700
Message-Id: <20170703192432.38081-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-browser][PATCH] firefox: Fix Build QA error compile-host-path
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jul 2017 19:24:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../firefox/firefox/remove_AC_PATH_XTRA.patch      | 59 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_45.9.0esr.bb       |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/remove_AC_PATH_XTRA.patch

diff --git a/recipes-mozilla/firefox/firefox/remove_AC_PATH_XTRA.patch b/recipes-mozilla/firefox/firefox/remove_AC_PATH_XTRA.patch
new file mode 100644
index 0000000..69d297e
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/remove_AC_PATH_XTRA.patch
@@ -0,0 +1,59 @@
+Drop unused X_* flags.
+
+There are actually causing harm doing cross builds since they are picking
+up $includedir which  is /usr/include and pouring that into CFLAGS in
+case of cairo, which ends up referening to build host's include paths
+
+Luckily, we have a QA check to catch such issues
+
+ERROR: firefox-45.9.0esr-r0 do_package_qa: QA Issue: firefox: The compile log indicates that host include and/or library paths were used.
+         Please check the log '/mnt/a/oe/build/tmp/work/corei7-64-bec-linux/firefox/45.9.0esr-r0/temp/log.do_compile' for more information. [compile-host-path]
+
+This patch fixes it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: firefox-45.9.0esr/configure
+===================================================================
+--- firefox-45.9.0esr.orig/configure
++++ firefox-45.9.0esr/configure
+@@ -30605,10 +30605,6 @@ sed 's/$/,/' >> $CONFIG_STATUS <<EOF
+     (''' MACOS_SDK_DIR ''', r''' $MACOS_SDK_DIR ''')
+     (''' MACOS_PRIVATE_FRAMEWORKS_DIR ''', r''' $MACOS_PRIVATE_FRAMEWORKS_DIR ''')
+     (''' GMAKE ''', r''' $GMAKE ''')
+-    (''' X_CFLAGS ''', r''' $X_CFLAGS ''')
+-    (''' X_PRE_LIBS ''', r''' $X_PRE_LIBS ''')
+-    (''' X_LIBS ''', r''' $X_LIBS ''')
+-    (''' X_EXTRA_LIBS ''', r''' $X_EXTRA_LIBS ''')
+     (''' SOLARIS_SUNPRO_CC ''', r''' $SOLARIS_SUNPRO_CC ''')
+     (''' SOLARIS_SUNPRO_CXX ''', r''' $SOLARIS_SUNPRO_CXX ''')
+     (''' MOZ_THUMB2 ''', r''' $MOZ_THUMB2 ''')
+Index: firefox-45.9.0esr/js/src/configure
+===================================================================
+--- firefox-45.9.0esr.orig/js/src/configure
++++ firefox-45.9.0esr/js/src/configure
+@@ -17188,10 +17188,6 @@ sed 's/$/,/' >> $CONFIG_STATUS <<EOF
+     (''' MACOSX_DEPLOYMENT_TARGET ''', r''' $MACOSX_DEPLOYMENT_TARGET ''')
+     (''' MACOS_SDK_DIR ''', r''' $MACOS_SDK_DIR ''')
+     (''' GMAKE ''', r''' $GMAKE ''')
+-    (''' X_CFLAGS ''', r''' $X_CFLAGS ''')
+-    (''' X_PRE_LIBS ''', r''' $X_PRE_LIBS ''')
+-    (''' X_LIBS ''', r''' $X_LIBS ''')
+-    (''' X_EXTRA_LIBS ''', r''' $X_EXTRA_LIBS ''')
+     (''' MOZILLA_SYMBOLVERSION ''', r''' $MOZILLA_SYMBOLVERSION ''')
+     (''' JS_SHELL_NAME ''', r''' $JS_SHELL_NAME ''')
+     (''' JS_CONFIG_NAME ''', r''' $JS_CONFIG_NAME ''')
+Index: firefox-45.9.0esr/gfx/cairo/cairo/src/moz.build
+===================================================================
+--- firefox-45.9.0esr.orig/gfx/cairo/cairo/src/moz.build
++++ firefox-45.9.0esr/gfx/cairo/cairo/src/moz.build
+@@ -246,9 +246,6 @@ if CONFIG['MOZ_WIDGET_TOOLKIT'] == 'qt':
+     CFLAGS += CONFIG['MOZ_QT_CFLAGS']
+     CXXFLAGS += CONFIG['MOZ_QT_CFLAGS']
+ 
+-if CONFIG['MOZ_X11']:
+-    CFLAGS += CONFIG['XCFLAGS']
+-
+ if CONFIG['MOZ_ENABLE_CAIRO_FT']:
+     CFLAGS += CONFIG['CAIRO_FT_CFLAGS']
+     CXXFLAGS += CONFIG['CAIRO_FT_CFLAGS']
diff --git a/recipes-mozilla/firefox/firefox_45.9.0esr.bb b/recipes-mozilla/firefox/firefox_45.9.0esr.bb
index 54d1713..812652e 100644
--- a/recipes-mozilla/firefox/firefox_45.9.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.9.0esr.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://0002-use-pkg-config-to-find-nspr.patch \
            file://0003-do-not-link-against-crmf-library-it-is-not-there.patch \
            file://gcc7.patch \
+           file://remove_AC_PATH_XTRA.patch \
 "
 
 SRC_URI[archive.md5sum] = "f4d83c5150fc5085db20d71862497eb8"
-- 
2.13.2



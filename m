Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id F36B26AD09
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 03:27:23 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id la4so13810058vcb.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 20:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ong+K+Myti43/PIiOoEhWaDVZLAnxKT28JP175VpwYE=;
	b=va2SY7Gt6CyrENPVQm6d+pFveYWeJeikZOFUZ/1HTr7HC64VvKalsaxrlIq08Cgfvi
	OUT154oZsvXD00OPWUK+A6S+69TuGxHESBPtmpbxXcKJsc81MMak6hF33ywCkGUrI+gv
	c0y2EEoBPt3I3XXlUGua+Qd/O26Bc0N7ztnOzvoxqL+He/Bw+5VPTFqmnPTfQR1C6sPq
	ctVugF8LojgtR87Kcfpvd5g7khTHh0TrIlLnVHSn/pkYoqUrObfd0Q6W6QJVTvEf0QMX
	+mo1PkjzSteHMxSXba1SY3LPl1dWGR9MWzdqFN0lF49HFIsa1MOo2GDhjEX45+F8Nqjt
	t2Rw==
X-Received: by 10.52.38.105 with SMTP id f9mr29404510vdk.17.1405999644605;
	Mon, 21 Jul 2014 20:27:24 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id g9sm9330800vec.16.2014.07.21.20.27.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jul 2014 20:27:23 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jul 2014 20:27:02 -0700
Message-Id: <1405999622-6867-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-multimedia][PATCH] vlc: add PACKAGECONFIG for postproc, patch for postproc header check
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jul 2014 03:27:26 -0000

* Built with libav 9.13 and stand-alone libpostproc
* Although postproc is enable=auto, let's leave it disabled by default

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc          |  1 +
 .../vlc/vlc/0005-libpostproc-header-check.patch         | 17 +++++++++++++++++
 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb     |  1 +
 3 files changed, 19 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index c188771..88605df 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -49,6 +49,7 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[live555] = "--enable-live555,--disable-live555,live555"
 PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
 PACKAGECONFIG[mkv] = "--enable-mkv,--disable-mkv,libmatroska libebml"
+PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc,libpostproc"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch
new file mode 100644
index 0000000..2d84ffd
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch
@@ -0,0 +1,17 @@
+* Also look for postprocess.h under libpostproc/
+
+Upstream-status: Pending
+
+Index: vlc-2.1.4/configure.ac
+===================================================================
+--- vlc-2.1.4.orig/configure.ac
++++ vlc-2.1.4/configure.ac
+@@ -2444,7 +2444,7 @@ then
+       VLC_SAVE_FLAGS
+       CPPFLAGS="${CPPFLAGS} ${POSTPROC_CFLAGS}"
+       CFLAGS="${CFLAGS} ${POSTPROC_CFLAGS}"
+-      AC_CHECK_HEADERS(postproc/postprocess.h)
++      AC_CHECK_HEADERS(postproc/postprocess.h,[],[AC_CHECK_HEADERS(libpostproc/postprocess.h)])
+       VLC_ADD_PLUGIN([postproc])
+       VLC_ADD_LIBS([postproc],[$POSTPROC_LIBS $AVUTIL_LIBS])
+       VLC_ADD_CFLAGS([postproc],[$POSTPROC_CFLAGS $AVUTIL_CFLAGS])
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
index f9be48d..b4047d3 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-enable-subdir-objects.patch \
             file://0002-glibc-does-not-provide-strlcpy.patch \
             file://0003-use-am-path-libgcrypt.patch \
             file://0004-modules-gui-qt4-out-of-tree-build.patch \
+            file://0005-libpostproc-header-check.patch \
 "
 
 SRC_URI[md5sum] = "7ed67d22f7425011078772bfc62ac222"
-- 
1.9.3



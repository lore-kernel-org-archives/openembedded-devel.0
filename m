Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxMST-000568-Gx
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2013 19:51:15 +0100
Received: by mail-pb0-f43.google.com with SMTP id jt11so2103923pbb.30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2013 10:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=gRW4Z5YfkYxL4nj+Sz9qlT008LKT4/JJNIR9zpnA9vU=;
	b=aR8lZB4RWweAx79MEhkAJwPFv7ZUxCiyQ7DVWCfT6wKiDAw8dIUuWOuC8mKRgusPky
	syD6Xzlt14NZ+5mru413MhQTe16NV75tsIguXOBGElTB6Rj/Vu9E5nOB7eRVTuqwzLtx
	qXv4gXfMpxoIC8rjOAx8BsqNk18a83HLic+l8SW590mzmmvoDNKu7EvrYa3NvUnSwttU
	r0v8WuMwE+CP8A7Jx/inDTOjtfm2jT/KF8Ebm1tYhbNw9fuLSyDXTqhOPIvEAEc1BYSY
	lyqtli3U07OK40UUU8/eI70+PnrgTDqZz8ftVD2ll5LOjnCTsBNEGq5Y3EItLXf41shb
	fuiw==
X-Received: by 10.66.78.1 with SMTP id x1mr49547473paw.2.1358793331879;
	Mon, 21 Jan 2013 10:35:31 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vq4sm9096196pbc.67.2013.01.21.10.35.30
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 10:35:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2013 10:35:20 -0800
Message-Id: <1358793321-11181-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-kde][PATCH 1/2] qt4-native, qt4-x11-free: Rename bbappends to match current OE-Core recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 18:51:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 README                                           |    3 ++-
 recipes-misc-support/qt4-native_4.8.3.bbappend   |    8 --------
 recipes-misc-support/qt4-native_4.8.4.bbappend   |    8 ++++++++
 recipes-misc-support/qt4-x11-free_4.8.3.bbappend |   12 ------------
 recipes-misc-support/qt4-x11-free_4.8.4.bbappend |   12 ++++++++++++
 5 files changed, 22 insertions(+), 21 deletions(-)
 delete mode 100644 recipes-misc-support/qt4-native_4.8.3.bbappend
 create mode 100644 recipes-misc-support/qt4-native_4.8.4.bbappend
 delete mode 100644 recipes-misc-support/qt4-x11-free_4.8.3.bbappend
 create mode 100644 recipes-misc-support/qt4-x11-free_4.8.4.bbappend

diff --git a/README b/README
index a6164c9..0635e10 100644
--- a/README
+++ b/README
@@ -9,6 +9,7 @@ Samuel Stirtzel <s.stirtzel@googlemail.com>
 
 Contributors:
 Copyright 2012 - Kai Kang
+Copyright 2013 - Khem Raj
 Copyright 2012 - Koen Kooi
 Copyright 2012 - Robert Yang
 Copyright 2011, 2012 - Samuel Stirtzel
@@ -46,4 +47,4 @@ FAQ / Troubleshooting:
   Q: How to report bugs / request features?
   A: Send your bugreports / feature requests to the openembedded-developer mailing list.
      Include the [meta-kde] tag in the subject for easier readability.
-     You can find the mailing list here: http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
\ No newline at end of file
+     You can find the mailing list here: http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
diff --git a/recipes-misc-support/qt4-native_4.8.3.bbappend b/recipes-misc-support/qt4-native_4.8.3.bbappend
deleted file mode 100644
index 5b04eb4..0000000
--- a/recipes-misc-support/qt4-native_4.8.3.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-# Needed by kdelibs4-native
-DEPENDS += "openssl-native"
-
-EXTRA_OECONF += "-no-pch -no-sm -openssl"
-
-TOBUILD += "src/phonon"
-
-PRINC := "${@int(PRINC) + 1}"
\ No newline at end of file
diff --git a/recipes-misc-support/qt4-native_4.8.4.bbappend b/recipes-misc-support/qt4-native_4.8.4.bbappend
new file mode 100644
index 0000000..5b04eb4
--- /dev/null
+++ b/recipes-misc-support/qt4-native_4.8.4.bbappend
@@ -0,0 +1,8 @@
+# Needed by kdelibs4-native
+DEPENDS += "openssl-native"
+
+EXTRA_OECONF += "-no-pch -no-sm -openssl"
+
+TOBUILD += "src/phonon"
+
+PRINC := "${@int(PRINC) + 1}"
\ No newline at end of file
diff --git a/recipes-misc-support/qt4-x11-free_4.8.3.bbappend b/recipes-misc-support/qt4-x11-free_4.8.3.bbappend
deleted file mode 100644
index 32a6f27..0000000
--- a/recipes-misc-support/qt4-x11-free_4.8.3.bbappend
+++ /dev/null
@@ -1,12 +0,0 @@
-#This will add reduced visibility to some exports on Qt, otherwise KDE plugins will fail
-QT_CONFIG_FLAGS_append = " --reduce-exports"
-
-# Build OpenGL/ES support if available
-QT_GLFLAGS_omap3 = "-opengl es2 "
-DEPENDS_append_omap3 = " libgles-omap3"
-DEPENDS_append_ti33x = " libgles-omap3"
-
-# Needed by kdelibs
-QT_DISTRO_FLAGS = "-accessibility -sm"
-
-PRINC := "${@int(PRINC) + 3}"
diff --git a/recipes-misc-support/qt4-x11-free_4.8.4.bbappend b/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
new file mode 100644
index 0000000..32a6f27
--- /dev/null
+++ b/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
@@ -0,0 +1,12 @@
+#This will add reduced visibility to some exports on Qt, otherwise KDE plugins will fail
+QT_CONFIG_FLAGS_append = " --reduce-exports"
+
+# Build OpenGL/ES support if available
+QT_GLFLAGS_omap3 = "-opengl es2 "
+DEPENDS_append_omap3 = " libgles-omap3"
+DEPENDS_append_ti33x = " libgles-omap3"
+
+# Needed by kdelibs
+QT_DISTRO_FLAGS = "-accessibility -sm"
+
+PRINC := "${@int(PRINC) + 3}"
-- 
1.7.9.5




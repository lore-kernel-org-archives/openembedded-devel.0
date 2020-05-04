Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web11.731.1588567689102860726
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 May 2020 21:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@alistair23.me header.s=fm1 header.b=05Mezj5b;
 spf=none, err=permanent DNS error (domain: alistair23.me, ip: 64.147.123.19, mailfrom: alistair@alistair23.me)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 6FD08606;
	Mon,  4 May 2020 00:48:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 04 May 2020 00:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=tFWoTLuId1gpO215hPAsXO+jdD
	tK7fdcQ0OoWyUDKp0=; b=05Mezj5bTwbfnEx5ceIlooiTp+kqVjSeUux73UPAYW
	5S+apsc1m3Q6uUS9yKeozwPCZopigZ9mTq8hjj+svgXaX+9jybEEXmgPRmFSIEHQ
	uEGrTpapC7wRWWSOTI5gxsmsojx18Lvl86TVohvMgmIaOcI370KVbqdJgBRHBJR3
	8bqWli2FwGD+C+sDz8QFQX6a0ZMPo3abDVB3oesNOGYB6uBjjjBUnPLSf1lQZ+XO
	axOYsbv29FnZS+AAGsYHTuvDFXHJR2a1QKxq0eVEh2g22/VWjnVwCAhRopkXghUp
	CO2WiC7ZYy+VmSB5eylUnFBi5tn7dmkRKGrDFVZP2mtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tFWoTLuId1gpO215h
	PAsXO+jdDtK7fdcQ0OoWyUDKp0=; b=WYami58itVUPaOVjYon6ea51AoZEzO60o
	XcXuXE0F6ECTrHHDjrHYS+oyI3/LpWzU8/1lJ6fKwGUrrcxCVRYf7qvJ/CrJLD1B
	2cJkPWcfOwepoXUpl4FJd9Fd9E5zkqOxpg9iyERMYEv1bopn1UJwaSEbuyhY9NRm
	JnIGa2+xVKwdpf9XHPhN62lXYhDukILV2FDq3B899edwWSYbAjT/uMNp8a9J6mwL
	muYM0Jil2TyHYrS8qhAhMEm/1tPgHNN0FlBjCnINN/3xFyLnpnhm5Qot0rxO7swo
	oQS2WMSpMREdF0fIpc7KQIErkEAuA9DZBZfDwl9hDGPbn2e8u6yVA==
X-ME-Sender: <xms:h56vXqFqW1_ETVkpGXnna-up77sVNMqlXCQJ4141HX3JoOuvkldg_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeefgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepieevhfeijeelleefle
    fhvdeukeejleffheekieduheefueefiedvueduffdutdefnecuffhomhgrihhnpehgvggr
    nhihrdhorhhgnecukfhppeejfedrleefrdekgedrvddtkeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgr
    ihhrvdefrdhmvg
X-ME-Proxy: <xmx:h56vXs4ILG_GK0D_Xfb2btNzIuAVRt4dyhMryk9VMSezWmECJDuChA>
    <xmx:h56vXqe6XB_GCC5VALbXXwSnW2IKLrdI7g9CzW63kQSrlFmIk0E4Vg>
    <xmx:h56vXv67xwFXzbCVWGa-TJ1R3u35N1mYp980EELgUwYCFW9VajjVqg>
    <xmx:iJ6vXt_WaRW7FCoWK6XhNAR6UnbF7zQpAlAHNr7je_oS93n9V31kcQ>
Received: from alistair-xps-14z.alistair23.me (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 36C14328005E;
	Mon,  4 May 2020 00:48:07 -0400 (EDT)
From: "Alistair" <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Cc: Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 1/2] geany-plugins: Support libgit2 version 1.0
Date: Sun,  3 May 2020 21:48:01 -0700
Message-Id: <20200504044802.1902288-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 ...preprocessor-conditionals-compatible.patch | 55 +++++++++++++++++++
 .../geany/geany-plugins_1.36.bb               |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0002-Make-libgit2-version-preprocessor-conditionals-compatible.patch

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0002-Make-libgit2-version-preprocessor-conditionals-compatible.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0002-Make-libgit2-version-preprocessor-conditionals-compatible.patch
new file mode 100644
index 000000000..25e5ac4ea
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany-plugins/0002-Make-libgit2-version-preprocessor-conditionals-compatible.patch
@@ -0,0 +1,55 @@
+From 9497d829e1b207eb83575dc6f617feecfb89bc16 Mon Sep 17 00:00:00 2001
+From: Dominik Schmidt <dominik@schm1dt.ch>
+Date: Sun, 23 Feb 2020 19:15:30 +0100
+Subject: [PATCH] Make libgit2 version preprocessor conditionals compatible
+ with libgit2-0.99
+
+LIBGIT2_SOVERSION is defined as string literal, e.g. "0.99",
+from libgit2-0.99 and beyond. Arithmetic checks against this
+variable whill hence fail. This patch switches the checks to
+compare against the LIBGIT2_VER_* family, which should be more stable.
+---
+ git-changebar/src/gcb-plugin.c | 6 +++---
+ workbench/src/plugin_main.c    | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/git-changebar/src/gcb-plugin.c b/git-changebar/src/gcb-plugin.c
+index b7083199..a911815f 100644
+--- a/git-changebar/src/gcb-plugin.c
++++ b/git-changebar/src/gcb-plugin.c
+@@ -32,11 +32,11 @@
+ #include <geany.h>
+ #include <document.h>
+ 
+-#if ! defined (LIBGIT2_SOVERSION) || LIBGIT2_SOVERSION < 22
++#if ! defined (LIBGIT2_VER_MINOR) || ( (LIBGIT2_VER_MAJOR == 0) && (LIBGIT2_VER_MINOR < 22) )
+ # define git_libgit2_init     git_threads_init
+ # define git_libgit2_shutdown git_threads_shutdown
+ #endif
+-#if ! defined (LIBGIT2_SOVERSION) || LIBGIT2_SOVERSION < 23
++#if ! defined (LIBGIT2_VER_MINOR) || ( (LIBGIT2_VER_MAJOR == 0) && (LIBGIT2_VER_MINOR < 23) )
+ /* 0.23 added @p binary_cb */
+ # define git_diff_buffers(old_buffer, old_len, old_as_path, \
+                           new_buffer, new_len, new_as_path, options, \
+@@ -45,7 +45,7 @@
+                     new_buffer, new_len, new_as_path, options, \
+                     file_cb, hunk_cb, line_cb, payload)
+ #endif
+-#if ! defined (LIBGIT2_SOVERSION) || LIBGIT2_SOVERSION < 28
++#if ! defined (LIBGIT2_VER_MINOR) || ( (LIBGIT2_VER_MAJOR == 0) && (LIBGIT2_VER_MINOR < 28) )
+ # define git_buf_dispose  git_buf_free
+ # define git_error_last   giterr_last
+ #endif
+diff --git a/workbench/src/plugin_main.c b/workbench/src/plugin_main.c
+index 6fa6fc84..25ecdf6d 100644
+--- a/workbench/src/plugin_main.c
++++ b/workbench/src/plugin_main.c
+@@ -36,7 +36,7 @@
+ #include "tm_control.h"
+ 
+ 
+-#if ! defined (LIBGIT2_SOVERSION) || LIBGIT2_SOVERSION < 22
++#if ! defined (LIBGIT2_VER_MINOR) || ( (LIBGIT2_VER_MAJOR == 0) && (LIBGIT2_VER_MINOR < 22))
+ # define git_libgit2_init     git_threads_init
+ # define git_libgit2_shutdown git_threads_shutdown
+ #endif
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
index a6a0b17dd..3cf260573 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
@@ -31,6 +31,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = " \
     https://plugins.geany.org/${BPN}/${BP}.tar.bz2 \
     file://0001-Use-pkg-config-to-find-gpgme.patch \
+    file://0002-Make-libgit2-version-preprocessor-conditionals-compatible.patch \
 "
 SRC_URI[md5sum] = "91fb4634953702f914d9105da7048a33"
 SRC_URI[sha256sum] = "ebe18dd699292174622e8cb8745b020ada8a5be3b604ab980af36e8518df7ce6"
-- 
2.26.2


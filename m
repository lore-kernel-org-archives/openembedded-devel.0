Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 141057FBC1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 10:52:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4734zn70xfz7x
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 11:52:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572432774;
	bh=jYOIT7Wf5v9wFYWsGpgdspCRJAESP8MnI3GZfD9tjqw=;
	h=From:To:Subject:Date:From;
	b=eVKBuhsWIUaERNuH/OR1sTmGrK/bTEY0wN/+FLbOe0ULZTL+8cs46pl+Rj6a21Syl
	v3iuoXVbBu76Bdg/lZz7m6BmmQO7ZPHxWv/BZDiFrnXhBzdE/6qOV1Wga5wQtAyljZ
	coF1/NMWTC3FrdppXxhnM3N9/Cnq761KQHgOMT96pdAljTqM2yOmUjKYCm2hpplXp3
	6ROJ/dS3KF6MzqdVuI3bWi03AhIUEB7tq2q76ALh3Q54HfuoeeJvgv6iQ+Y7Dro4+p
	Lypy3yWDRruetrv+VD4yWPSgpp4kxSclf+jTn82CeXSZ1clfxR3MbwNUDcb9ZKtk2F
	c+UjRksCojP2Y5SLXjij9Sq6QDmgJfQBzyKoRRK4j7C8UY76vmK1n71wCs8SYVXcuM
	PXrAogh5blV7/7LEEVOpB1nRtHGRy9pI+BWSZaMCUGN+5CPdO12vqr+63hx2UryrxT
	Op88pakO6NwaKQsnlhgwB4S90yADaVR5QTqz4EdeQIyO/JamkdJK99q+4fzX8FVH6b
	wjydKHa0dfYjGUFVHQPysn/rNmm2rnxvPBo4smDV8ZSIHmgJywOgYjOlycYaM6jvjq
	6FUHH9s8P5MgAGwRzjiUnWSBgNtQvN3A3HkMCMEiju6y387aOBaUgNzotwJuAY9TJ/
	P5GTBPgfY5b+wLflSxbdOvyk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2019 12:52:50 +0200
Message-Id: <20191030105252.17982-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libmicrohttpd: Upgrade 0.9.66 -> 0.9.67
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
X-List-Received-Date: Wed, 30 Oct 2019 10:52:54 -0000

Backported patch removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../fix-build-with-older-gnutls.patch         | 32 -------------------
 ...ttpd_0.9.66.bb => libmicrohttpd_0.9.67.bb} |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/fix-build-with-older-gnutls.patch
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.66.bb => libmicrohttpd_0.9.67.bb} (83%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/fix-build-with-older-gnutls.patch b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/fix-build-with-older-gnutls.patch
deleted file mode 100644
index 61a7ac0a6..000000000
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/fix-build-with-older-gnutls.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b84ee1fa41c53c43aa7ed1583c36af5cb7c77a0f Mon Sep 17 00:00:00 2001
-From: Christian Grothoff <christian@grothoff.org>
-Date: Fri, 2 Aug 2019 15:43:44 +0200
-Subject: trying to fix #5806
-
-Upstream-Status: Backport from 0.9.67 [https://git.gnunet.org/libmicrohttpd.git/commit/?id=b84ee1fa41c53c43aa7ed1583c36af5cb7c77a0f]
-
----
- src/microhttpd/daemon.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/microhttpd/daemon.c b/src/microhttpd/daemon.c
-index bf01ba9b..a8fc98c6 100644
---- a/src/microhttpd/daemon.c
-+++ b/src/microhttpd/daemon.c
-@@ -2536,7 +2536,12 @@ internal_add_connection (struct MHD_Daemon *daemon,
-   else
-     {
- #ifdef HTTPS_SUPPORT
--      gnutls_init_flags_t flags;
-+#if (GNUTLS_VERSION_NUMBER+0 >= 0x030500)
-+      gnutls_init_flags_t
-+#else
-+      unsigned int
-+#endif
-+        flags;
- 
-       flags = GNUTLS_SERVER;
- #if (GNUTLS_VERSION_NUMBER+0 >= 0x030402)
--- 
-cgit v1.2.1
-
diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.66.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.67.bb
similarity index 83%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.66.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.67.bb
index 6b5417004..c400462e0 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.66.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.67.bb
@@ -7,10 +7,9 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz \
-    file://fix-build-with-older-gnutls.patch \
 "
-SRC_URI[md5sum] = "ce4050e75cc40d68506e2b403e1a76f9"
-SRC_URI[sha256sum] = "4e66d4db1574f4912fbd2690d10d227cc9cc56df6a10aa8f4fc2da75cea7ab1b"
+SRC_URI[md5sum] = "e28e04e3d3eca62f5754efb844d17812"
+SRC_URI[sha256sum] = "7e1f852723d099d4827d7ebde4d02dd00fd8da62149526fdb9fae058c5a60495"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.17.1



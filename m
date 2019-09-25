Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6497E26B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:15:08 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id b24so5126047wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xWVR7dTipIEI3m0qkShv/EIPrthTu9M4z30/iu2m13U=;
	b=sMyw3VJzSuH4eT6XKyItA7MS+KFPARqHStIgCmGaw5bzwoSlH4BxIwbzZL8qKEiJIm
	A++PghC0el26r7zSuQykitn1t7N5yvYfFvzr4i1hSP382u0FKTTP4fZUiYRO3wENVAAm
	fO4iyWSVL6UpmuVbri1LETlK5+hxt39jXE/vXQcYVXXwtOEGAwsWK5FakSxUhGYux3Qz
	EEM0DPGJxh6xazXYTOp1Acfe11zysaKBN8Ws2SY81V9PZrtg0iKBOMlQfzvWuahP9A/P
	WnahO/kGXnwRMWrATJgdsquTcaBRfSDvi7niZu1Oi0ITwklX8FdkcLQOklY3MuFojlVH
	n+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xWVR7dTipIEI3m0qkShv/EIPrthTu9M4z30/iu2m13U=;
	b=o6R4l4cm6/qvIHMh6ix/2H3Q29Vyyjab/PyvS20+in7nk24po6tYG4RZTJ3lN3bXcC
	iRt9//xi+TPHuds9r2nC9N8vM1XMSMGwjyCrj5/ViF92L+4jp2JJ/Dbw64wAQ/ezf/mN
	gKw8dK9fCtK7VQfw95m4w8JtnxHmJUdUq5hP+YUJZVaMKDCI/HFdvtbvC7YlPnhjWelq
	dz01gEaiiLfmhVrZtKTmKISw+0JIVR9c2PbAyUf35su2W3o/zDcNskVfrzy02qraTNUP
	k8QlyTbQ/yI7ZrXE1s7JLBvq/9xGY+pXtp6AhZyxcz5RAnHOHP24Gi2nKjG3fS9VoM+d
	GhSQ==
X-Gm-Message-State: APjAAAXjsHHbqjSXpJUsP7y2Q8bOXFZagmKHpXv34QrBZCCjOfUVHhKW
	TZ7rb40Y1XoT14dEctA20TUGOpUH8+s=
X-Google-Smtp-Source: APXvYqwwkUJo5vlY0K9FS2C0waHpj0yyiz9QOxDDYJXq4s4I0NKtGdI7+tDGUufwZOTRhXLu2SipKw==
X-Received: by 2002:a1c:4946:: with SMTP id w67mr8078881wma.131.1569420908650; 
	Wed, 25 Sep 2019 07:15:08 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id u4sm5325575wmg.41.2019.09.25.07.15.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Sep 2019 07:15:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 14:14:58 +0000
Message-Id: <20190925141458.970-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libmicrohttpd: backport the fix for building with older gnutls
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
X-List-Received-Date: Wed, 25 Sep 2019 14:15:08 -0000

* with gnutls from meta-gplv2 libmicrohttpd fails to build now:
  libmicrohttpd-0.9.66/src/microhttpd/daemon.c:2539:7: error: unknown type name 'gnutls_init_flags_t'; did you mean 'gnutls_pin_flag_t'?
    2539 |       gnutls_init_flags_t flags;
  backport the fix from master branch

* see https://bugs.gnunet.org/view.php?id=5806

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../fix-build-with-older-gnutls.patch         | 32 +++++++++++++++++++
 .../libmicrohttpd/libmicrohttpd_0.9.66.bb     |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/fix-build-with-older-gnutls.patch

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/fix-build-with-older-gnutls.patch b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/fix-build-with-older-gnutls.patch
new file mode 100644
index 0000000000..61a7ac0a60
--- /dev/null
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/fix-build-with-older-gnutls.patch
@@ -0,0 +1,32 @@
+From b84ee1fa41c53c43aa7ed1583c36af5cb7c77a0f Mon Sep 17 00:00:00 2001
+From: Christian Grothoff <christian@grothoff.org>
+Date: Fri, 2 Aug 2019 15:43:44 +0200
+Subject: trying to fix #5806
+
+Upstream-Status: Backport from 0.9.67 [https://git.gnunet.org/libmicrohttpd.git/commit/?id=b84ee1fa41c53c43aa7ed1583c36af5cb7c77a0f]
+
+---
+ src/microhttpd/daemon.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/microhttpd/daemon.c b/src/microhttpd/daemon.c
+index bf01ba9b..a8fc98c6 100644
+--- a/src/microhttpd/daemon.c
++++ b/src/microhttpd/daemon.c
+@@ -2536,7 +2536,12 @@ internal_add_connection (struct MHD_Daemon *daemon,
+   else
+     {
+ #ifdef HTTPS_SUPPORT
+-      gnutls_init_flags_t flags;
++#if (GNUTLS_VERSION_NUMBER+0 >= 0x030500)
++      gnutls_init_flags_t
++#else
++      unsigned int
++#endif
++        flags;
+ 
+       flags = GNUTLS_SERVER;
+ #if (GNUTLS_VERSION_NUMBER+0 >= 0x030402)
+-- 
+cgit v1.2.1
+
diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.66.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.66.bb
index 7d349b94e4..6b54170049 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.66.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.66.bb
@@ -6,7 +6,9 @@ SECTION = "net"
 
 DEPENDS = "file"
 
-SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz \
+    file://fix-build-with-older-gnutls.patch \
+"
 SRC_URI[md5sum] = "ce4050e75cc40d68506e2b403e1a76f9"
 SRC_URI[sha256sum] = "4e66d4db1574f4912fbd2690d10d227cc9cc56df6a10aa8f4fc2da75cea7ab1b"
 
-- 
2.17.1



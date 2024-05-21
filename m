Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4ECC41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.3051.1716315037293518616
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N05AE+jy;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ee38966529so775525ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315036; x=1716919836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ph62RPNzT3pA5eTxOETUoZvKpUOvL0lzcHDkRUdSDc=;
        b=N05AE+jy+cPF1Efwm04CCZ+96r3+lL+ZnMoSQhNg1hqxSy+wOPOSKvel3wmguc5TMK
         5Jbrqz5EbIAK6L/Dn/teHUTGgIM/wcFxfMZPBjDhPNxuWzX11PBwFo+pZUw74dahPcCv
         d4s4T/JSN253A5Lp6lskW4UAKIvhcE6UsvD1udi8GteiYOE9aVVw/wJuN+U9ypFVvEeu
         ytFdl+0DJxbSszNTWAk8wQG7kXiFUUTF8y76iO6b2ImbBeKmJBMvDvsriAwoxvFk2l1S
         2wc9UEqABB1c050HXeN3aknwlh5vKi6eydv/6xiY4kZetSU8N9oO8gw1PxbjpZbr5n/c
         iSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315036; x=1716919836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ph62RPNzT3pA5eTxOETUoZvKpUOvL0lzcHDkRUdSDc=;
        b=vQYpp3dwCnewUT4DdQTErKw/5gUYP5G8/tqHVikQaZozpnjJbQPxZYZPUK/UGgbAO5
         +Whnsq308Y7fvOZWnvVNIXEuY0cZwdif9u0+oxGBPgYBXp9qJ3EPyq4gG59yfppMKKid
         Sr6uOi5FpZjRHS/2nB053fiXKwqaK6U0o5qXxxusy9qZUbz0T3edvRAkQqZyqZ7znc52
         cRkUh0tNhH3fj0JOchyyXUOQQx/X5EeSXowySYFe78QCJuosTPQDP+T3EgiXsYjiQYvU
         y2cYLEVU9Gthn8axYYtjwSTNihomuFlR9Dhg8ZvY73Q5WnZILqnmIE1r+SCTjVKcjKKB
         y6ig==
X-Gm-Message-State: AOJu0Ywn8iEeqthiNH+vRu+pu6EX5dN+w167n9JiLtf+p92IPqc9S4QJ
	P7PMb1TbePV3HrFR80T85hkYwxjS3+qdrXOiIE1c+59suN5mIpDzj2AjEkBMe2w=
X-Google-Smtp-Source: AGHT+IGdiFfVOB8q0pLo8vXHZQWdjPm+pme73PSnp0vqJeH71tmiefpKmoqTm2oXrAg/4jB7qFBDxQ==
X-Received: by 2002:a17:903:1c4:b0:1f3:2d7:feb8 with SMTP id d9443c01a7336-1f302d80812mr83601215ad.10.1716315036407;
        Tue, 21 May 2024 11:10:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][meta-oe][ 10/22] nbd: Upgrade to 3.26.1
Date: Tue, 21 May 2024 11:10:11 -0700
Message-ID: <20240521181024.426176-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110459

Backport a build fix when using --disable-manpages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...8b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch | 50 +++++++++++++++++++
 .../recipes-support/nbd/nbd_3.24.bb           | 20 --------
 .../recipes-support/nbd/nbd_3.26.1.bb         | 22 ++++++++
 3 files changed, 72 insertions(+), 20 deletions(-)
 create mode 100644 meta-networking/recipes-support/nbd/nbd/f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch
 delete mode 100644 meta-networking/recipes-support/nbd/nbd_3.24.bb
 create mode 100644 meta-networking/recipes-support/nbd/nbd_3.26.1.bb

diff --git a/meta-networking/recipes-support/nbd/nbd/f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch b/meta-networking/recipes-support/nbd/nbd/f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch
new file mode 100644
index 0000000000..716ded55be
--- /dev/null
+++ b/meta-networking/recipes-support/nbd/nbd/f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch
@@ -0,0 +1,50 @@
+From f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c Mon Sep 17 00:00:00 2001
+From: Dave Jones <dave.jones@canonical.com>
+Date: Thu, 14 Mar 2024 11:13:05 +0000
+Subject: [PATCH] Fix the check & no cases of enable_manpages
+
+Currently, running "configure --disable-manpages" while docbook2man *is*
+installed results in the error "don't know what to do here" when it
+should disable manpages.
+
+There also appears to be a missing conditional at the start of the line;
+there's closing un-matched ]) at the end of the line. Still, at this
+point the check can be done in pure shell; no need for AC macros. I've
+also removed the confusing m4_divert_text call on the check case. Not
+sure why that was there, but it appears unnecessary.
+
+Upstream-Status: Backport [https://github.com/NetworkBlockDevice/nbd/commit/f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -328,7 +328,7 @@ AC_MSG_CHECKING([whether man pages are r
+ AC_ARG_ENABLE([manpages],
+ 	AS_HELP_STRING([--disable-manpages], [Do not install man pages]),
+ 	[],
+-	[: m4_divert_text([DEFAULTS], [enable_manpages=check])]
++	[enable_manpages=check]
+ )
+ AC_MSG_RESULT([$enable_manpages])
+ 
+@@ -337,9 +337,14 @@ AS_IF([test "x$enable_manpages" != "xno"
+ 	])
+ AS_IF([test "x$enable_manpages" = "xyes" -a "x$DB2M" = "x"], [
+        AC_MSG_ERROR([docbook2man not found, but is required to build manpages])
+-	],
+-      [test "x$DB2M" != "x"], [enable_manpages=yes],
+-       [AC_MSG_ERROR([don't know what to do here])])
++	])
++if test "x$enable_manpages" = "xcheck"; then
++	if test "x$DB2M" = "x"; then
++		enable_manpages=no
++	else
++		enable_manpages=yes
++	fi
++fi
+ AC_MSG_CHECKING([whether to build manpages])
+ AC_MSG_RESULT([$enable_manpages])
+ 
diff --git a/meta-networking/recipes-support/nbd/nbd_3.24.bb b/meta-networking/recipes-support/nbd/nbd_3.24.bb
deleted file mode 100644
index da9f829523..0000000000
--- a/meta-networking/recipes-support/nbd/nbd_3.24.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Network Block Device"
-HOMEPAGE = "http://nbd.sourceforge.net"
-SECTION = "net"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS = "autoconf-archive bison-native glib-2.0 libnl"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "a6d9e7bbc311a2ed07ef84a58b82b5dd"
-SRC_URI[sha256sum] = "6877156d23a7b33f75eee89d2f5c2c91c542afc3cdcb636dea5a88539a58d10c"
-
-inherit autotools pkgconfig
-
-PACKAGES = "${PN}-client ${PN}-dbg ${PN}-doc ${PN}-server ${PN}-trdump ${PN}-trplay"
-
-FILES:${PN}-client = "${sbindir}/${BPN}-client"
-FILES:${PN}-server = "${bindir}/${BPN}-server"
-FILES:${PN}-trdump = "${bindir}/${BPN}-trdump"
-FILES:${PN}-trplay = "${bindir}/${BPN}-trplay"
diff --git a/meta-networking/recipes-support/nbd/nbd_3.26.1.bb b/meta-networking/recipes-support/nbd/nbd_3.26.1.bb
new file mode 100644
index 0000000000..15d5f8b36b
--- /dev/null
+++ b/meta-networking/recipes-support/nbd/nbd_3.26.1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Network Block Device user-space tools (TCP version)"
+HOMEPAGE = "https://github.com/NetworkBlockDevice/nbd"
+SECTION = "net"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "autoconf-archive bison-native glib-2.0 libnl zlib bison-native"
+
+SRC_URI = "https://github.com/NetworkBlockDevice/${BPN}/releases/download/${BP}/${BP}.tar.xz \
+           file://f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch"
+SRC_URI[sha256sum] = "f0cf509fa5b20b1a07f7904eb637e9b47d3e30b6ed6f00075af5d8b701c78fef"
+
+inherit autotools pkgconfig systemd
+
+EXTRA_OECONF += "--enable-syslog --enable-lfs --disable-manpages"
+
+PACKAGES = "${PN}-client ${PN}-dbg ${PN}-doc ${PN}-server ${PN}-trdump ${PN}-trplay"
+
+FILES:${PN}-client = "${sbindir}/${BPN}-client"
+FILES:${PN}-server = "${bindir}/${BPN}-server"
+FILES:${PN}-trdump = "${bindir}/${BPN}-trdump"
+FILES:${PN}-trplay = "${bindir}/${BPN}-trplay"
-- 
2.45.1



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B71F433EB
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:09 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7037.1776318666112126199
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pS/g/rrh;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c55e3858cso6336540c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318665; x=1776923465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxsij0KHrIgFzmpjuxJHnGfTzjsselypp4tRgUt+adk=;
        b=pS/g/rrhmxyFiSz4N+pUrDApeXDIYKX4OoVVUcsU0Hfmfo8dKGnjIu1cDNIywxi9DA
         Jl3eWM1dhuudWeS6skGAbnOX3pz9GZ8JZh9Qd1Ui1amohdFtRQiFXv6Nw2gzbidst1Ry
         2kTBbyXWUGjNWmN/5hzIzEQkp+owgvadvmi/vkLTJgs9rxR7bfGvrtumddI1hFtK6+C2
         tEicYz1bGEqv7wTLl1stmdbPBmfApwRuKHKkEZ1rwbKlfsAUs6cbnTyS5orUVSsIPci6
         Bua5B0WJXY2B/49vKKSAM5DSahzg4jG19IkgXyppNKdMMVrhZPd+sekdGO79Tjqi2pKs
         g+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318665; x=1776923465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sxsij0KHrIgFzmpjuxJHnGfTzjsselypp4tRgUt+adk=;
        b=X/wHbao8RW0Apb3Zhk6X9vm1gWTQKDfTfYfomnglFWw6E+qS25n/ptUip03sKd+qFo
         srB4GUnst6ogGwTJiGCXjyPDPhDP+DHrAVQIa0//h0q84NpFyRu17L9GuTysAuScQjvw
         JmzW7y82QawZOQMtfmkOCH9VtNMyIxYE56K6rTsNnbini9kY/SswSB5YixOxDqjeC9XA
         tOn+yiVSTVUy1JvgmtoH7+XBVx2GbQJwTK+L6PLTq2pQvtJrZV5ZmkNDFt/wWr9MkL82
         mpKAYQ1uDQlPlyAAe+kTfeEZaKiwUOmjs4YeBbbuqBjCtmTVZ7G/xu7AV9cxZXgqeTPf
         XMlA==
X-Gm-Message-State: AOJu0Yyv2Ypc86Ekbt2ApaiOKkge3wnhGuS/skOXYRCZfZT3xqik2RV3
	IFtlSp0KrdGUivxb6Uz8SzilzOactu0RNtzqUWQGN4c+lPcUQ4yzSx+IyPraFq5H
X-Gm-Gg: AeBDiet5aQss3/lpMIPyHZ+NqzAZenIo3xDKQJ81ZqfM6J3DhOQAn33P6d9Xj345DMx
	7dKY6wimPSvS8RT4TnAeJ54K3OcRTGxWn4yykBe/PtQxI+zvqmJrXQadTGe47CEMcpLmZAr2d/J
	5cwXkkzYfUXC4vMmHhDxPkmqNAQI9o0ma+/YBhyeU7lbPW1S1Wgx9oHpJWjFG2C6xjsNXSii2HJ
	XBPo4pgcP2JrM4BA8w0UuKgJJFc1HGAIeuElgGjL5Eez5fix0FJZ8PpxKo7g+K1IOM4Qe5IO0xB
	drkodcM8rcK8YnhB9kXijKGukTbTIlz5N9vuSLF4amtwaLODkSiyYDk3lMOF8Cp4WwvvoaefXQq
	8c7ndGkSoOPBlu0CItoYNRcxHiQgrpqABGyvHqloHsujn0PnLEYNfrBm6yCUI1sB8bUdRhLJJi4
	u0rhgMannG6SrrJ/htqYDalK21Ksb85qz+aclxazfEfjgWfNZLuZh6L9ViIv9nmzYxlutFtuvEX
	C2Yu/IMLFiLJHTvgGLg1W/kZsAvtgC35zh3wN6eJMj71ynn6C21ALdpe0GFaK6kZPrqD6RSWCFA
	HruQo3GjiKspprAjkh5JsuTtj6U9vlM7YiAyGbXhCrme8aa5wdI=
X-Received: by 2002:a05:7022:6629:b0:12a:b932:81d2 with SMTP id a92af1059eb24-12c34eedbcamr13946522c88.21.1776318665085;
        Wed, 15 Apr 2026 22:51:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/18] libvarlink: Fix build with C23 support in glibc
Date: Wed, 15 Apr 2026 22:50:44 -0700
Message-ID: <20260416055058.792189-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126383

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...use-const-for-strchr-return-pointers.patch | 96 +++++++++++++++++++
 .../libvarlink/libvarlink_24.0.1.bb           |  4 +-
 2 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libvarlink/libvarlink/0001-transport-tool-use-const-for-strchr-return-pointers.patch

diff --git a/meta-oe/recipes-support/libvarlink/libvarlink/0001-transport-tool-use-const-for-strchr-return-pointers.patch b/meta-oe/recipes-support/libvarlink/libvarlink/0001-transport-tool-use-const-for-strchr-return-pointers.patch
new file mode 100644
index 0000000000..348dc88838
--- /dev/null
+++ b/meta-oe/recipes-support/libvarlink/libvarlink/0001-transport-tool-use-const-for-strchr-return-pointers.patch
@@ -0,0 +1,96 @@
+From 27e4f4504b3c60356b9507e926aae2b82ba47275 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 15 Apr 2026 11:10:01 -0700
+Subject: [PATCH] transport,tool: use const for strchr return pointers
+
+Fixes errors seen after c23 implemented in glibc
+
+lib/transport-device.c:13:14: error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
+   13 |         parm = strchr(address, ';');
+      |              ^ ~~~~~~~~~~~~~~~~~~~~
+1 error generated.
+
+Upstream-Status: Submitted [https://github.com/varlink/libvarlink/pull/85]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ lib/transport-device.c | 2 +-
+ lib/transport-tcp.c    | 4 ++--
+ lib/transport-unix.c   | 2 +-
+ tool/command-format.c  | 2 +-
+ tool/command-info.c    | 2 +-
+ 5 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/lib/transport-device.c b/lib/transport-device.c
+index 0b8cec5..205eac4 100644
+--- a/lib/transport-device.c
++++ b/lib/transport-device.c
+@@ -7,7 +7,7 @@
+ #include <fcntl.h>
+
+ static int strip_parameters(const char *address, char **devicep) {
+-        char *parm;
++        const char *parm;
+         _cleanup_(freep) char *device = NULL;
+
+         parm = strchr(address, ';');
+diff --git a/lib/transport-tcp.c b/lib/transport-tcp.c
+index 92a0e7b..fff2379 100644
+--- a/lib/transport-tcp.c
++++ b/lib/transport-tcp.c
+@@ -10,7 +10,7 @@
+ #include <sys/socket.h>
+
+ static int strip_parameters(const char *address, char **hostp) {
+-        char *parm;
++        const char *parm;
+         _cleanup_(freep) char *host = NULL;
+
+         parm = strchr(address, ';');
+@@ -34,7 +34,7 @@ static void freeaddrinfop(struct addrinfo **ai) {
+ static int resolve_addrinfo(const char *address, struct addrinfo **resultp) {
+         _cleanup_(freep) char *host = NULL;
+         char *endptr;
+-        char *port;
++        const char *port;
+         struct addrinfo hints = {
+                 .ai_family = AF_UNSPEC,
+                 .ai_socktype = SOCK_STREAM,
+diff --git a/lib/transport-unix.c b/lib/transport-unix.c
+index 5dc3853..2414b29 100644
+--- a/lib/transport-unix.c
++++ b/lib/transport-unix.c
+@@ -10,7 +10,7 @@
+ #include <unistd.h>
+
+ static int strip_parameters(const char *address, char **pathp) {
+-        char *parm;
++        const char *parm;
+         _cleanup_(freep) char *path = NULL;
+
+         parm = strchr(address, ';');
+diff --git a/tool/command-format.c b/tool/command-format.c
+index 6932bc4..0f5ef8c 100644
+--- a/tool/command-format.c
++++ b/tool/command-format.c
+@@ -155,7 +155,7 @@ static long format_run(Cli *UNUSED(cli), int argc, char **argv) {
+ static long format_complete(Cli *cli, int argc, char **UNUSED(argv), const char *current) {
+         _cleanup_(freep) char *prefix = NULL;
+         DIR *dir;
+-        char *p;
++        const char *p;
+
+         if (argc != 1)
+                 return 0;
+diff --git a/tool/command-info.c b/tool/command-info.c
+index 571b6fd..9d252f7 100644
+--- a/tool/command-info.c
++++ b/tool/command-info.c
+@@ -137,7 +137,7 @@ static long info_run(Cli *cli, int argc, char **argv) {
+ static long info_complete(Cli *UNUSED(cli), int argc, char **UNUSED(argv), const char *current) {
+         _cleanup_(freep) char *prefix = NULL;
+         DIR *dir;
+-        char *p;
++        const char *p;
+
+         if (argc != 1)
+                 return 0;
diff --git a/meta-oe/recipes-support/libvarlink/libvarlink_24.0.1.bb b/meta-oe/recipes-support/libvarlink/libvarlink_24.0.1.bb
index de2f30c487..1d1419a878 100644
--- a/meta-oe/recipes-support/libvarlink/libvarlink_24.0.1.bb
+++ b/meta-oe/recipes-support/libvarlink/libvarlink_24.0.1.bb
@@ -6,7 +6,9 @@ SECION = "devel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"

-SRC_URI = "git://github.com/varlink/libvarlink.git;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/varlink/libvarlink.git;protocol=https;branch=master;tag=v${PV} \
+           file://0001-transport-tool-use-const-for-strchr-return-pointers.patch \
+          "
 SRCREV = "2ad4ec7ca62e148dbf0ad98646ec68c2e7e8a88e"

 inherit meson bash-completion lib_package


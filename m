Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20185F433EC
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:09 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6937.1776318664584985878
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ndOgySIQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c637089ccso1336327c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318664; x=1776923464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFT8LsySwGar10cP+q18Q7aYGfIHKUAd8v9u3qgQeJA=;
        b=ndOgySIQdO6/crex0Ooxyc2OEpUgXjJef+AD4C7f9VUiGEV6CxMzmtiVoEZe/clixN
         6dJsNKgcOATUN55H+aJ37ZdLdjlCs8Vh90ZjuDBwAC/Yh3azi6ShN0GGIq9Wu5hmNGJx
         hyzhnkqJnoLqkv2PYq2Tb0ePbDV07BKUWpQ2Dq31axkWSjIS9OrBJ7YVNrVMQUZ0UVb9
         HXrZJwu64qQEFOL84ld9dmULq8dQNt3pc4kwonIJtOBwESJWXKLBvOaR0KgpHlL44/KQ
         m8rfiflTFlNv1jPv9YcuL4fqpv9EqOj4dc3WYKq16Dn0ZpisNBvak70IIELSy8+D88Lm
         BHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318664; x=1776923464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sFT8LsySwGar10cP+q18Q7aYGfIHKUAd8v9u3qgQeJA=;
        b=eSumd6UzTGW03U6EXLvHg0b7YSD8oLG9XoObNYzCQaoVmZeycLE+KudlmWDlVZ4JX9
         eR4Uw+fc2KLPLUvWGeQnd20u4U2GKpx53iQ11LtNG4mbtqfjr0HPw13/dGmb52dMrKv4
         33NEfeoYNlxcoPq7qkIoSzfyjsAUtHiXWGTXFw5oAP4p4r8fASed3NaccOiMUvRI8USx
         lAbSGTWcTeKIkzQWnzv5l6z7jboBmOlmcLkc9OCyV8ZNnZ7Y3AuODdpb3p+Sz/sieKdI
         S9R7B4Wz88DvTMED/epWeEKaMxLcTgXyHvhw3HE694J5flQStBO0j62R03HRPkhjin1i
         g37g==
X-Gm-Message-State: AOJu0YzyXfqA1hXxDMgSbQUqCp6jglzMrdAEUX6l09sqm9qXLRFikmKV
	EdnttBVPQ9twndLL0ahMDYkp/SaTWtoC86O6EwAf1YnvkUKq0dPjnsBOsnfjKQ3b
X-Gm-Gg: AeBDietujnblt88lWucg1WsaJRZulACq5K9uivxoSfI8pgm5t3FuJsk53BWatTwFztk
	m26f8p9HiAXndoqj6oIOPIcrYAhqkAFig4Iahhag0X/jcEyM/u/gWGHDdFIEwib+qNx/H/g0Qu4
	TKVhUDghyXvVBj1TCUgJltaFYbl/SXBRmh8E53HGhDb3z3azhSPiOA+0OJ+LiKUuAQ9wAZMakOY
	9QTBLQX0nXbhDj1R66uqqrD7udkhz+PMUQjSqXaTlj6fZmBMpd+GxN9RjP+824woUaTG9arbgam
	8ny+E4v8kiaEK/c0ph+6Tq77GZidrw9AQMs2coVYMOxzxm4I3w4TrFXdlzfHSwrGL0kKkDV0e6n
	dCq5tBW59/b90kJouAPkwuCqN7ZPC6nMy2XEK5UHlj/pJJJJKd8WiX6TCgiGyO5xRVFfsamCeFI
	3OK/5IdtavxLDJuGxYjEZ3xm8DrE8zYQkHL/h9t372C14g3XXCSiGQAaeZgWVekzvp4QDLowqHT
	MLSHxIo5lmuKw/aUkbTGm7+UeDdCGhBE/UV9Na289CVEK9w5KfPXpXJL5I1xqv67F6xx3aFhAgM
	06othjtg3EyTElE2W5DE/3ulCjfJJlDlydy62tMQsQ/7frOEeP3eXjBh+qvy9A==
X-Received: by 2002:a05:7022:fe08:b0:12c:2e07:3fd with SMTP id a92af1059eb24-12c34f17e74mr15709319c88.32.1776318663606;
        Wed, 15 Apr 2026 22:51:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/18] systemd-netlogd: Upgrade to 1.4.5 release
Date: Wed, 15 Apr 2026 22:50:43 -0700
Message-ID: <20260416055058.792189-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126382

Fix build on 32-bit with 64-bit time_t
Fix build with C23 on

For full details:
https://github.com/systemd/systemd-netlogd/releases/tag/v1.4.5

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...tness-for-pointer-variables-to-refer.patch | 60 +++++++++++++++++++
 ...logd_1.4.4.bb => systemd-netlogd_1.4.5.bb} |  6 +-
 2 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/systemd-netlogd/systemd-netlogd/0001-Fix-const-correctness-for-pointer-variables-to-refer.patch
 rename meta-oe/recipes-support/systemd-netlogd/{systemd-netlogd_1.4.4.bb => systemd-netlogd_1.4.5.bb} (83%)

diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd/0001-Fix-const-correctness-for-pointer-variables-to-refer.patch b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd/0001-Fix-const-correctness-for-pointer-variables-to-refer.patch
new file mode 100644
index 0000000000..190baff606
--- /dev/null
+++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd/0001-Fix-const-correctness-for-pointer-variables-to-refer.patch
@@ -0,0 +1,60 @@
+From 515e23b37ad1400bfb73797771c4f0fd78655328 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 15 Apr 2026 10:52:05 -0700
+Subject: [PATCH] Fix const-correctness for pointer variables to referred
+ strings
+
+Mark pointer variables 'e' as 'const char *' in
+config_parse_netlog_remote_address,file_in_same_dir, and
+socket_address_parse, since they point to memory they do not
+own or modify.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd-netlogd/pull/148]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/netlog/netlog-conf.c | 2 +-
+ src/share/path-util.c    | 3 ++-
+ src/share/socket-util.c  | 3 ++-
+ 3 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/netlog/netlog-conf.c b/src/netlog/netlog-conf.c
+index a4cf0da..59bdd23 100644
+--- a/src/netlog/netlog-conf.c
++++ b/src/netlog/netlog-conf.c
+@@ -22,7 +22,7 @@ int config_parse_netlog_remote_address(const char *unit,
+                                        void *data,
+                                        void *userdata) {
+         Manager *m = userdata;
+-        char *e;
++        const char *e;
+         int r;
+
+         assert(filename);
+diff --git a/src/share/path-util.c b/src/share/path-util.c
+index dda7ec6..ad6f24a 100644
+--- a/src/share/path-util.c
++++ b/src/share/path-util.c
+@@ -327,7 +327,8 @@ bool path_is_safe(const char *p) {
+ }
+
+ char *file_in_same_dir(const char *path, const char *filename) {
+-        char *e, *ret;
++        const char *e;
++        char *ret;
+         size_t k;
+
+         assert(path);
+diff --git a/src/share/socket-util.c b/src/share/socket-util.c
+index ae33338..5a6284b 100644
+--- a/src/share/socket-util.c
++++ b/src/share/socket-util.c
+@@ -33,7 +33,8 @@
+ #include "util.h"
+
+ int socket_address_parse(SocketAddress *a, const char *s) {
+-        char *e, *n;
++        const char *e;
++        char *n;
+         unsigned u;
+         int r;
+
diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.5.bb
similarity index 83%
rename from meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
rename to meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.5.bb
index 019098fdf7..c52940ec70 100644
--- a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
+++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.5.bb
@@ -3,8 +3,10 @@ SUMMARY = "Forwards messages from the journal to other hosts over the network us
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"

-SRC_URI = "git://github.com/systemd/systemd-netlogd.git;protocol=https;branch=main"
-SRCREV = "b03cc3b1a75048c7cf19467d8918a4b7320767e6"
+SRC_URI = "git://github.com/systemd/systemd-netlogd.git;protocol=https;branch=main;tag=v${PV} \
+           file://0001-Fix-const-correctness-for-pointer-variables-to-refer.patch \
+		  "
+SRCREV = "20534091417686d1185acb3f29e93944d8663c4b"

 inherit meson systemd pkgconfig useradd features_check



Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5E3E9A04B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 21:07:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1681.1771448815811923023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 13:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QzTuBgpc;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48375f10628so1863165e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 13:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448814; x=1772053614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=97BLJSPdqtD4FoWDsXXr/mhc6Q5KszMjAFgxBLCRQ4w=;
        b=QzTuBgpc8LuqU3r6cFETL0Ehx1ioUWbONuKyltmhRRPT8JqIK1FMxjGs0muFf3B6Rq
         R+4HaUK/j5Sf69+O28/al8xQxcAcEl7npCq431y+zaAq26MTibafdTENXZ6Qd17Uc3pB
         ltiqHg7XIdJ+1OTo1h4s2IRx1Pee3pgXmU/CUhrhvXyheWlpwX+w9poPbmPV41bvO5qe
         M58W+fZe/ewrjEeH2nHY51RwgyVqJpmGyH9Se7c4aVU0OHR5RiuTPfRdTjHRAcf8tYf9
         RTS1fiIBkTx5VmtZwzfuMn04QskYqoxt/F9X+23NxhP5cXVnHMeztC3I6NYZY3RleGxv
         VsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448814; x=1772053614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97BLJSPdqtD4FoWDsXXr/mhc6Q5KszMjAFgxBLCRQ4w=;
        b=Up0O58PW+z1XTyH9j8vXX5dpKnj2hxpHvxI8C6WGtZFt84JXNs5nZ57mAU5rbB7HtS
         1taEB+KEM7H3ZBTeINYzIU9xQvBBDgzQUjOGz+wXU4MEhdWqru9SaLqqVwKYkYnLbWRo
         8n+i3KSk30NARUEDQfqDeq5nYyqyHS8H+F1WrNwQb7q0+bMnOIP1Baw+npAa0Dw0I/xx
         RRzqFOR6CMzm3/pgPopo0U1scxbbOZcx8vl5Tb9dyIpYWu47owUr5GugOBFtayoHqhCI
         ltifPWCJ5T6Z1aN5B040YjN0NWO7PJEJBCKTf3fnrSsEiYI4VQ1RpFIP/SD+uQD+PsAv
         gAtg==
X-Gm-Message-State: AOJu0YxZKrmSlJlnZIJYqOlG8jWAjyEz+tLhw3OZD890OpHtNjOXsG2B
	wseyePbf3U6BJidB9LJ0LpEJZEPZEG2mICcEC2ZQnhf4H0aa1E/JmlkqDSMsSg==
X-Gm-Gg: AZuq6aJ/DPxc+YKmnfkfKGALWdqnDI2IrZ+SLiLrJwn4FVugZ/3umLD2EiIa/BQ06r2
	FTyojwIlUdQG4Ucj2/Hxtg4QjDHOdPbskAxJHTcnfNW9pT19NwUwjC7GxdEfpkRtgO1FX8F/xXw
	EtqkmC8aoHd66pluE2Fret6U/Ya6PkMSJrlGp8epJKVEdJlYigO15HmTKxQpMCGnzcieuR8EjLW
	eO6EoOd8rUH2/AGzvgHqrb4k+8iYtTuQG/LDdlCorW/yY4SM9jPExa71OReBHF6ocj09o/aXABB
	AgFt3veszxgMPh/NVXQjZukKljrNt282Jt1FJ3SOYGDASjsoGgHr9SNKaGWSKVX3kzuboU1yvM0
	HGfmPg7CfToqGiiMsrHawy4eK4XB46CRKONZHxeF/x1MqON7cWzRo85hbqOCfr2CmOJ0G6hHkiu
	fE+EcUeMleVpSNd8Lyumzj
X-Received: by 2002:a05:600c:4744:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-4839e66d920mr7105895e9.34.1771448813779;
        Wed, 18 Feb 2026 13:06:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a78c89sm431044325e9.5.2026.02.18.13.06.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 13:06:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] sessreg: upgrade 1.1.3 -> 1.1.4
Date: Wed, 18 Feb 2026 22:06:52 +0100
Message-ID: <20260218210652.2618392-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 21:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124496

Drop 0001-Makefile.am-Error-Fix.patch - the error doesn't seem
to happen anymore.

License-Update: Removed the words "All rights reserved" from Oracle
copyright notices.

Shortlog:
Remove "All rights reserved" from Oracle copyright notices
meson: Add option to build with meson
Add --help and --version options
Improve man page formatting
man pages: fix warnings from `mandoc -T lint` and `groff -rCHECKSTYLE=10`

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sessreg/0001-Makefile.am-Error-Fix.patch  | 33 -------------------
 .../{sessreg_1.1.3.bb => sessreg_1.1.4.bb}    |  6 ++--
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
 rename meta-oe/recipes-graphics/xorg-app/{sessreg_1.1.3.bb => sessreg_1.1.4.bb} (56%)

diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch b/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
deleted file mode 100644
index bfda2dfe71..0000000000
--- a/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 088bb4cef2c93bef312b076a8c7a3c798cbf2f19 Mon Sep 17 00:00:00 2001
-From: daicy <daicy@cn.fujitsu.com>
-Date: Tue, 8 Dec 2015 11:45:01 +0900
-Subject: [PATCH] Makefile.am: Error Fix
-
-Do not compile man dir since error always occur.
- | sed: file filenames.sed line 3: unterminated `s' command
- | make[2]: *** [sessreg.1] Error 1
-It is not a good way.But can remove it from SKIP_RECIPE.
-
-Upstream-Status: Pending
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index cddffd0..94f7048 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -18,7 +18,7 @@
- #  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
- #  PERFORMANCE OF THIS SOFTWARE.
- 
--SUBDIRS = man
-+#SUBDIRS = man
- bin_PROGRAMS = sessreg
- 
- AM_CFLAGS = $(CWARNFLAGS) $(SESSREG_CFLAGS)
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.3.bb b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.4.bb
similarity index 56%
rename from meta-oe/recipes-graphics/xorg-app/sessreg_1.1.3.bb
rename to meta-oe/recipes-graphics/xorg-app/sessreg_1.1.4.bb
index 33ab22cde4..4c71130759 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.4.bb
@@ -2,10 +2,10 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 
 SUMMARY = "a simple program for managing utmp/wtmp entries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d938a70c8280c265a1ccd2954365d185"
-SRC_URI += "file://0001-Makefile.am-Error-Fix.patch"
+LIC_FILES_CHKSUM = "file://COPYING;md5=82cc7e3245e8b11a5259108ba5b7e3dc"
+
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "022acd5de8077dddc4f919961f79e102ecd5f3228a333681af5cd0e7344facc2"
+SRC_URI[sha256sum] = "4e85b52f4f65a93449753bfb00ceb5d77f3317e24d07dc23147f2f116c785350"
 
 CFLAGS:append:libc-musl = " -D_WTMPX_FILE=WTMP_FILE -D_PATH_WTMPX=_PATH_WTMP -D_UTMPX_FILE=UTMP_FILE -D_PATH_UTMPX=_PATH_UTMP "
 


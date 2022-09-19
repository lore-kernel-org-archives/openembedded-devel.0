Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F9DC6FA95
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:58 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.19185.1663590828359382457
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h4CoThxL;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id h21so20429213qta.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=NqwnAJspODwFcCPKWqAho17V2IFuuMSkefPsoZofWhQ=;
        b=h4CoThxLEPxXIPb3mlCQ9IIbb+eH/spmsF9L1V/AL26eE8ou+gLZAH3rPIi5VEz68H
         Z7Sz1bReMCe1I1amOqkn2V8MfzhlMY38KoicovTt5BxZ6sCFpODHp3C4Fd5ITNOqSkZL
         W1lzAztmceBFFINScjFFAJBvjNcUuUqsluvOJXU5IIjzUvfFifjcXBWGawv0aI4XK2lP
         Ytf/OhsPquk3Usb88huyw9r7HyB7NxJOYbXSDow0wGXKEW3wzpENPukjYc+l4VU2eYCZ
         Uo1AqslWzr4x/FMMbrCdnlOe2sLzknRXguh7MevXveScWPT3fyq6/zqqm3cawqSZC6i4
         HZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=NqwnAJspODwFcCPKWqAho17V2IFuuMSkefPsoZofWhQ=;
        b=AVk2M3O+a2IdpZs48f9sRhm3xXazurcOeclgsGWquXePs7/YJVIDjwVNoR0egOQEuh
         jHyfzH24k3Tu4XOoEqCBWJmHoSOigM4hF58vfu4BzHQzFVGWkMyJ6dmXvQo3inpar1ap
         VbLv6HskzuIc2AZ7lL4M7uwxROyZtRzdyaUCCpTfLajhISfcefC2BimdqXzQZ3rG0Cus
         SLvr2UT5IB98NcaemI/At27usQTqW5a96VpcDgmtE0JQ4bdOoLe3+VbwIJGlD/FOjaHq
         CwNM8E4KYVo3oHaobsyI76i1cqfukQKYttIa2rZ/SCUWDn/yUoalILa0rrw7fguWfjVL
         2k7A==
X-Gm-Message-State: ACrzQf1Jc5WypTkEx42/zr1kK/Ufy4QkB7Uo5WppCdVWxkRSeOJwVDtK
	q/NT0GMgJ72FWKxuFEGRXRsOAk2C/GU=
X-Google-Smtp-Source: 
 AMsMyM7hL6aHbaQUKO/bPBWAk1rz/RW0ZZ1yUUpYVyDmyqVfSHwT0Z/LNmZBORC5gs3Bw7Gj5rtvUA==
X-Received: by 2002:a05:622a:11c2:b0:343:69d:65b2 with SMTP id
 n2-20020a05622a11c200b00343069d65b2mr14696067qtk.491.1663590827090;
        Mon, 19 Sep 2022 05:33:47 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 04/11] ntpsec: Add -D_GNU_SOURCE and fix building with
 devtool
Date: Mon, 19 Sep 2022 08:33:31 -0400
Message-Id: 
 <9f1013ba4555257989b640d3c37bf2f322a1a311.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663590728.git.akuster808@gmail.com>
References: <cover.1663590728.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98855

From: Khem Raj <raj.khem@gmail.com>

wscript detects .git directory and if its present them invokes git
describe --dirty which does not work on the devtool created git
repository, since its synthesized.

Add GNU_SOURCE define to get strptime() definition

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 375be9fd60e22fb60b53d664983cb70d26d8a288)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...01-wscript-Widen-the-search-for-tags.patch | 29 +++++++++++++++++++
 .../recipes-support/ntpsec/ntpsec_1.2.1.bb    |  6 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Widen-the-search-for-tags.patch

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Widen-the-search-for-tags.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Widen-the-search-for-tags.patch
new file mode 100644
index 0000000000..98c62eed49
--- /dev/null
+++ b/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Widen-the-search-for-tags.patch
@@ -0,0 +1,29 @@
+From 9a7dead72f41e79979625c9bdef2fb638427d3d6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 Aug 2022 20:54:17 -0700
+Subject: [PATCH] wscript: Widen the search for tags
+
+Default is to look for annotated tags, howveer when using devtool we
+create our own git tree from release tarballs which will have tags but
+they are not annotated, therefore broaden the search to include all tags
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ wscript | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index 879ded1..dff835d 100644
+--- a/wscript
++++ b/wscript
+@@ -177,7 +177,7 @@ def configure(ctx):
+     if build_desc:
+         build_desc = ' ' + build_desc
+     if ctx.env.BIN_GIT:
+-        cmd = ctx.env.BIN_GIT + shlex.split("describe --dirty")
++        cmd = ctx.env.BIN_GIT + shlex.split("describe --tags --dirty")
+         git_short_hash = ctx.cmd_and_log(cmd).strip()
+         git_short_hash = '-'.join(git_short_hash.split('-')[1:])
+ 
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
index 3efac7d983..bed0e2e108 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
@@ -16,7 +16,9 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-ntpd-ntp_sandbox.c-allow-clone3-for-glibc-2.34-in-se.patch \
            file://0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch \
            file://0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch \
-           file://volatiles.ntpsec"
+           file://volatiles.ntpsec \
+           file://0001-wscript-Widen-the-search-for-tags.patch \
+           "
 
 SRC_URI[sha256sum] = "f2684835116c80b8f21782a5959a805ba3c44e3a681dd6c17c7cb00cc242c27a"
 
@@ -54,7 +56,7 @@ export PYTAG = "cpython${@ d.getVar('PYTHON_BASEVERSION').replace('.', '')}"
 export pyext_PATTERN = "%s.so"
 export PYTHON_LDFLAGS = "-lpthread -ldl"
 
-CFLAGS:append = " -I${PYTHON_INCLUDE_DIR}"
+CFLAGS:append = " -I${PYTHON_INCLUDE_DIR} -D_GNU_SOURCE"
 
 EXTRA_OECONF = "--cross-compiler='${CC}' \
                 --cross-cflags='${CFLAGS}' \
-- 
2.25.1



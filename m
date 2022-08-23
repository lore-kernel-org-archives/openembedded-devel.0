Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E4DC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 16:51:26 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.286.1661273485563926323
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mxhx5z3R;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id bf22so14507308pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=0cXOoVyTkVxIbUmCzAecHNYFxaLdwbU6tn9i69r7Qqk=;
        b=mxhx5z3RbdlmA8xXaCLB1vZ8ZgZk8bKbdoFbRWt1NUSsPOBvEdmTPX5A1R5hF8giAq
         hOvCtbvQPSnP62yXK51TomtdtkPHtPp0ybcscL3xZq7WOO67070Khnk5z92BsFkWOO/8
         l1bYGzEnHqORqckkC8nw6q0MEWOOewjPEwBTP8uADGN7CzNJ3SsbhBdJ4UZ32OfjUGgd
         8rSWZOIbkoIw5J+nqeNEYNXg0RA5LOSNysfzzbozKuSmM5d7dkPzFQ1eo0I5rS7RPW5k
         WxFJc3FbBfjTCwrZTGJ8E/73CivwpoPFaX/B+yrMqk1z+oawpH1wnxKlJkhqai3HRmVN
         Q8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=0cXOoVyTkVxIbUmCzAecHNYFxaLdwbU6tn9i69r7Qqk=;
        b=k7+NcX9f843QBtwFiUoZWkdE4SVlDyIMztCW6+nHpgdjRuk+YNVOIBlQuejQQGzhTv
         ZqWk+sa3hYPg2mtQB02Im0O2VwlzykxLdmpWcMjU/DIAqvgd0L+/OcpIgJ/lARlNZp8q
         YHQqBtgdS8XwgZHtDqBcAJNU4t0ZoJN//riSvExPjANDfBB/3aNbePbHUWFk19btACci
         TSPqy3A3oNSttNMX2O2H5uURK2/rY1aAM80PhHHl3UO81ORWA6HVPjO/2vSPR9FLUYHP
         dOOeVfhajM+I+TwW8QH8720w8s8MqdW/YqPhMxV5K/njT2OE5FQ/rp0Snb703yuZpb77
         5tjw==
X-Gm-Message-State: ACgBeo0tAD+MnDAAL6H/2EG/gS1XlQTErWF0+LJSh5Bji6BaRgWWdbDj
	sbBlJpFTWm2VxK8d8H6n8GjTZP9ZOgy2Kg==
X-Google-Smtp-Source: 
 AA6agR4OTDcZOXkNKJOMPzlSBHE7OuAxHzpGqIJ9xsGWWy3fmIAGEAsWJe8wGsE+Z45L10eWPJTDbw==
X-Received: by 2002:a17:90a:150f:b0:1fb:aee:cd2a with SMTP id
 l15-20020a17090a150f00b001fb0aeecd2amr4134527pja.47.1661273484706;
        Tue, 23 Aug 2022 09:51:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q18-20020a170902f35200b0016be834d54asm10596856ple.306.2022.08.23.09.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 09:51:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/4] ntpsec: Add -D_GNU_SOURCE and fix
 building with devtool
Date: Tue, 23 Aug 2022 09:51:19 -0700
Message-Id: <20220823165122.3248107-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 16:51:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98393

wscript detects .git directory and if its present them invokes git
describe --dirty which does not work on the devtool created git
repository, since its synthesized.

Add GNU_SOURCE define to get strptime() definition

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
index cd8b396f19..e975f903f9 100644
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
 
@@ -56,7 +58,7 @@ export PYTAG = "cpython${@ d.getVar('PYTHON_BASEVERSION').replace('.', '')}"
 export pyext_PATTERN = "%s.so"
 export PYTHON_LDFLAGS = "-lpthread -ldl"
 
-CFLAGS:append = " -I${PYTHON_INCLUDE_DIR}"
+CFLAGS:append = " -I${PYTHON_INCLUDE_DIR} -D_GNU_SOURCE"
 
 EXTRA_OECONF = "--cross-compiler='${CC}' \
                 --cross-cflags='${CFLAGS}' \
-- 
2.37.2



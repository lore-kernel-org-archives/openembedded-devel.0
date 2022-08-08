Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06800C3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:19 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.25910.1659968718539934302
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YYQKVn/5;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id p125so4705994pfp.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+kQSOMazC6n9XCFmvcsU86RvZVKozFF7JZUdGX2IbK0=;
        b=YYQKVn/5nfnatWWxMXU/X/lmFVmOCWx/40X5y+87keqs/oQ4CR/TRmmc8CGSzyFI/+
         CYOmUbNkbg5K1Wof60B3fLO9OMmNdWekTHuC1/4KlNWQ4NK7vzNgwhrivAGh8aIMuj8/
         MibDRMCgfhCJdOzZyFCaTjE9JC2ob4cFVntkHsh7lkVIaxfKC+H7EgEdgVAi5TqgzKU4
         y6TiCDsohcMGQ1X8UcZG+MZPdPCNuMv7rAcHdl34vAPoiF1taocvzi2kyzbEiarzPtXp
         rYF/XlhbscqdqxymmoHty67dquif0oYBh00VJbOYO4uGTFShjz7acrW7Zpe2bhIv58qF
         Q2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+kQSOMazC6n9XCFmvcsU86RvZVKozFF7JZUdGX2IbK0=;
        b=ObLAV5wXJTbCxq6B1y6OZ3EszurcmKmIs7jyLS3VhvCUv+0MCTYbISVJuvI7rCMt4C
         qAG9DU0fPWJQBrijSId0n1u5iu5ysHr8tVqwJAu5ZEU2/73W6c4ORNzj02VY9cvLrJm6
         iVCu2uqT4Pq8C0vbvwmm3KH0bSqMlJy9387nZ7JoEgBcXpyrArNgq9ZjSOb6FdvIphji
         gh8gFTZgRkoASVpQzu+fBJ5PRmFm8mRuBemKZpq71vfZjd8d0JrXIuPLO9dy7aS65nEB
         uRD+tkD7Bsf0ImAy2Lo3Byk9lN5nnilyIif1XojzJmBUzobgJ1NW8Yn/iPbhjjFL2Pqq
         Sy/A==
X-Gm-Message-State: ACgBeo1jYYKKOjIE+VFacXrBFTcmkpaRpLBNSOFLnEHbHf3AxYRL9uha
	0cdz0T2jBoqMDaa7w/6acfWl+gnWImg=
X-Google-Smtp-Source: 
 AA6agR6/fp/tGAi95PaTFBZjdUQF9J1B8vBxm+CFp7iwLv04IGs2rxgxZ/T/9zd/O29eRCfg9Xj0mg==
X-Received: by 2002:a63:8543:0:b0:41b:f0b2:ab0 with SMTP id
 u64-20020a638543000000b0041bf0b20ab0mr15504936pgd.248.1659968717298;
        Mon, 08 Aug 2022 07:25:17 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.25.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:25:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 11/13] apache2: Fix the buildpaths issue
Date: Mon,  8 Aug 2022 07:22:50 -0700
Message-Id: 
 <78e65e77992252f0d348f5a7d3a8f86313ed1beb.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98171

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
   WARNING: apache2-2.4.54-r0 do_package_qa: QA Issue: File /usr/src/debug/apache2/2.4.54-r0/build/server/exports.c in package apache2-src contains reference to TMPDIR [buildpaths]

Before the patch:
  # cat ./build/server/exports.c
  [snip]
  #include "mpm_fdqueue.h"

  const void *ap_ugly_hack = NULL;

  /*
   * /buildarea/build/tmp-glibc/work/core2-32-wrs-linux/apache2/2.4.54-r0/httpd-2.4.54/include/ap_expr.h
   */
  const void *ap_hack_ap_expr_exec = (const void *)ap_expr_exec;
  [snip]

After the patch:
  # cat ./build/server/exports.c
  [snip]
  #include "mpm_fdqueue.h"

  const void *ap_ugly_hack = NULL;

  /*
   * ap_expr.h
   */
  const void *ap_hack_ap_expr_exec = (const void *)ap_expr_exec;
  [snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4f2025e8d2f1626e97f7e9e675ce3c7d45477807)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...make_exports.awk-not-expose-the-path.patch | 32 +++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.54.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0001-make_exports.awk-not-expose-the-path.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-make_exports.awk-not-expose-the-path.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-make_exports.awk-not-expose-the-path.patch
new file mode 100644
index 0000000000..78f23f0f2d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0001-make_exports.awk-not-expose-the-path.patch
@@ -0,0 +1,32 @@
+From 5b5eae9cdf3bae91756c717349f2f33a31888f24 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 3 Aug 2022 12:35:16 +0800
+Subject: [PATCH] make_exports.awk: not expose the path
+
+Don't print the full path in the comment line.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ build/make_exports.awk | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/build/make_exports.awk b/build/make_exports.awk
+index 1cf0568..44d93c5 100644
+--- a/build/make_exports.awk
++++ b/build/make_exports.awk
+@@ -47,7 +47,9 @@ function push(line) {
+ 
+ function do_output() {
+     printf("/*\n")
+-    printf(" * %s\n", FILENAME)
++    file = FILENAME
++    sub("([^/]*[/])*", "", file)
++    printf(" * %s\n", file)
+     printf(" */\n")
+     
+     for (i = 0; i < stackptr; i++) {
+-- 
+2.25.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
index 4b0ed2f622..37d498f52e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
@@ -15,6 +15,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
+           file://0001-make_exports.awk-not-expose-the-path.patch \
           "
 
 SRC_URI:append:class-target = " \
-- 
2.25.1



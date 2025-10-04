Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF20ECAC5BB
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 18:39:38 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.15029.1759603172126228024
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 11:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M9zyNVf0;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso7896058a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 11:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759603170; x=1760207970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pCfnlKaya8+N54tm3zyLhAkXMfHrb2JIY2kenHMU1rQ=;
        b=M9zyNVf0Gmd8hSSkXKWL6kuWBOB3peyxyMYLDMIAWCCmFmU6itu8RLoAluQu2pVPUG
         hJGduj2MvmImcjQlWDJka5WNsdlSYnZCpiGbBccqwiZlt+RLwbXmj/6WPT4TZhBHFDR4
         QyeMnqwlyKTVcKdG2cjl/5kK+lGN0nihCvKlJjpvjVdRRjMsSAI7D27SeTFAo0G+E1B4
         MMH1LUPl7Cyf4ycfyGCj9jl/MXL/dMoiKBFHeFKaAhqE6bvA5FTS8eXpVj6COq4/lNxk
         Q6n+so0eG/nAuejGzgdm+3wJ1qUSFNJiw6epsiFBYJPRUKUrZowpIzPUpPhdWYAIeMwV
         Hwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759603170; x=1760207970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCfnlKaya8+N54tm3zyLhAkXMfHrb2JIY2kenHMU1rQ=;
        b=jlR1Rdxsg6LHWbPW0LVCCgZZxb8Rax9QN4inaLEdh1zGYN3bj20qzIL/onqSSaHVVH
         x5JaQuz/crtoM973qLAgY+v7ew0mqw6VKrGNiC+37v1PidT8teNIZQHUY9s0mI8blQZn
         LPiN+UDiEWZPLu7k4ZJ8WnBf+V7uI0FYR+35AFXWXPe48EYaQbsEhEwv8EZQ/0/TVGIE
         yQ3dCgnqBUBb5qMcsLb543mS9WjFbG9//tenkyzLstQuo4gum3gTNvx0d8au7mjhcsWa
         TUu34S/zxQ3vFcoOCbMw694LWHTpc7oy+bmvCHFuJBdyKoE60zvzbz9vQyGfGQUrsx/H
         NGCA==
X-Gm-Message-State: AOJu0Yx32Ca6vawz6tqxsbxsTOLis5sCsvm51qWdRzcnm8B636dSTvGz
	+di8rWGB3LlfDEb9/Um2EyJXTYvW1YVpSigbkCYNqIxV5pHjMkkgFE5ExCtEyQ==
X-Gm-Gg: ASbGncsX4dCR/JJlD45IkCnXjzY6/IZE6jVgxXWXPCym39Mwy/DjQlOpA2m3BiA6UjG
	Xif6m+P5h+rAznFeOWlNaigcN6Gt6NONbGmz4JRTIs1vNxtUNATDU1l7fLvxPTOcgZbzzlol9VX
	rDfcw7ZKYY3rlgRye+SQvXizNou4GvVcAoUEx+fAv/wN/2p66y/wp1cJZUExTeKhsYME08zalif
	3R2c8gRDXy39WJe5IG0REvNfduXpup77yUxcgqlVPddkZVLIDR/i3nwz6QhVZ79hU0Br7V/n/QJ
	snapynF/mxilLKcl/ij+BuZ5Nzi6vox4PGhhA21tYqI57FUOARqhOHgc7x+0+F2M+ndWAQczjI2
	nUdSWjl/rpXmwB6sXlp8i+rK8/bUbFD45l5k7uarw5MbaHOg1gZhyTjQ=
X-Google-Smtp-Source: AGHT+IHZwRK7A6ytXXYcY50dI+UoNGayOYuad8rZwx3zhBTmMMqKyNeZgcNW++qvftFA4zF4CDmjcA==
X-Received: by 2002:a05:6402:5252:b0:62e:ebb4:e6e0 with SMTP id 4fb4d7f45d1cf-638fcb674ebmr8577319a12.1.1759603170331;
        Sat, 04 Oct 2025 11:39:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6394ba637fasm4022507a12.33.2025.10.04.11.39.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 11:39:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][walnascar][PATCH] apache2: patch CVE-2025-54090
Date: Sat,  4 Oct 2025 20:39:28 +0200
Message-ID: <20251004183928.2967614-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 18:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120235

https://nvd.nist.gov/vuln/detail/CVE-2025-54090

A bug in Apache HTTP Server 2.4.64 results in all "RewriteCond expr ..." tests evaluating as "true".

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../apache2/apache2/CVE-2025-54090.patch      | 40 +++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.64.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2025-54090.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2025-54090.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2025-54090.patch
new file mode 100644
index 0000000000..54ae450a5f
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2025-54090.patch
@@ -0,0 +1,40 @@
+From 8abb3d06b23975705ebcf4bf4476464fd0b9bd0b Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Mon, 21 Jul 2025 11:12:44 +0000
+Subject: [PATCH] fix `rewritecond expr` regression in 2.4.64
+
+  *) SECURITY: CVE-2025-54090: Apache HTTP Server: 'RewriteCond expr'
+     always evaluates to true in 2.4.64 (cve.mitre.org)
+     A bug in Apache HTTP Server 2.4.64 results in all "RewriteCond
+     expr ..." tests evaluating as "true".
+     Users are recommended to upgrade to version 2.4.65, which fixes
+     the issue.
+
+
+Reviewed By: covener, ylavic, gbechis, jorton
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1927361 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2025-54090
+Upstream-Status: Backport [https://github.com/apache/httpd/commit/8abb3d06b23975705ebcf4bf4476464fd0b9bd0b]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ modules/mappers/mod_rewrite.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/modules/mappers/mod_rewrite.c b/modules/mappers/mod_rewrite.c
+index f9fcd61400f..ae0ceda0508 100644
+--- a/modules/mappers/mod_rewrite.c
++++ b/modules/mappers/mod_rewrite.c
+@@ -4276,8 +4276,9 @@ static cond_return_type apply_rewrite_cond(rewritecond_entry *p, rewrite_ctx *ct
+                 rc = COND_RC_NOMATCH;
+             }
+             else {
+-                rc = COND_RC_MATCH;
++                rc = (rc > 0) ? COND_RC_MATCH : COND_RC_NOMATCH;
+             }
++
+             /* update briRC backref info */
+             if (rc && !(p->flags & CONDFLAG_NOTMATCH)) {
+                 ctx->briRC.source = source;
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
index 5830568746..b2cfcebc49 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
@@ -16,6 +16,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
            file://0001-make_exports.awk-not-expose-the-path.patch \
+           file://CVE-2025-54090.patch \
           "
 
 SRC_URI:append:class-target = " \


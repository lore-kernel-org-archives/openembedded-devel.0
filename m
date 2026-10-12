Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25699CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:45 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5090.1791839437730951090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GRLop0kF;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac397836fbso162319a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839437; x=1792444237; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IHZMYifF5YIf54LpMRTrtfIxEQZb5vTJwqmhYAklHYo=;
        b=GRLop0kFLMGBfSsf/Co9kAZk5koShJL+niw1ytyZ5sseopn5hSnIug0w0TiWJBQcVH
         TTVLSMt/LMz/HK/mMBGkdUQ+UlEbUvxacDu1mNJmF6fvK0MV2s7aAdMkOHke0LaXvshs
         FuH15QNz3kwdunVVa0dtNtX3EY0tcORAzzUAqGKxfuMp3BfmJUYjwdQ0mKOe9MmZhkOj
         aS3EUgcrZo9XwoimxObekrWonEyPd3kHtaQVo5K5xnlddvGY4RMdkmjR9UiaW9VNs7Iv
         Zcam6twAEdVntRroP3crnNIWefj5Vx2i6CQF5fWS9NS1r2sOHGnvhYeCX8YTpX3mm61h
         Q7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839437; x=1792444237;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHZMYifF5YIf54LpMRTrtfIxEQZb5vTJwqmhYAklHYo=;
        b=JjUbhxbbtvMZHtlCWlQ4jYSdsz78TkILLWKzymjgaTltS/3BqsRt9/3YYOY/88JHQ7
         v7sdvUlKXrjjVWpsEnJUp3xjLbKHAEa0Ilfsv3tC8xau6wL2k8GfBcLX+r6CflpvJtsX
         uZjkNt93x9ng28os4w8Qrbgin/J3Z3Bavj4Y/5Fz2P8+YqpKNd2LSh2udDGEyJsil7AV
         sjhK5jy4yiAchScP4DB5VFN0IVnP0xsxIu+XRUhNZ0ZgjQy9lUMbTURMr9ov/KI8fgU0
         Vdz2gmk7TzOakeH+F3dd1Oxsmip3308p+ndMxMtFe01BmI5oKJeXLi+XLPga6tbSITHC
         XiGg==
X-Gm-Message-State: AFq9FYKkb7YRHkEcUAv6deX0CnJyQW3nQq4FfwEwgU3HieV2k4TcogRN
	nf5JTCYssKjghNTQScuXWwwVeAiAC1gBqazZmdej2ELZs+OWcOWekRXfQS9EQ79p
X-Gm-Gg: AYBFou1n890Zv67yO2C7BaTIE6nvuDNEcviawMb24sfV5uwJBKLvfFHbQ2vm8Jpc3AO
	Q1mbWt6IFAkjWUVySIyhzT9RhKJiWa27LtrmZmhnYADWzSpksTcInOe8nWHRxgyeztpK19MaMhI
	/hOx5nGuCEznYu0VeL7sH8JLyAm08JcNCoRmHsLXjAyBZvqfCznRJA1ktZchumgMHLiWNv5gV5t
	xx0SF+bBwwmvsEmtDyF84tK/QAOWr1PtT3RQmTIJQTQdGldZDDJANxKOIxGHD0jJ647lR4mrG4j
	ACJaNzZorjwomNLfgtpIiP4rbAdup3pnuG2Y6+UuGStT54dyORCN3xuy50W0egFfvZrYJaBIiEx
	+vipHZE3wUNOcF+l9vBruL7hUd8OUYlKbCvQZIGmqUB0oE2sIG7OV8+1lTM5QhNxo4Um9NRO1qw
	ptobxRk3PUMmKR/KBceZ023EZQBqf4MQAIb8HQNPYqGmkVa4YRruQ5srP7nnSrV0AddOYYUmt/x
	iFU7oJidnVVLOS2jJnXbIbRRmseaalFPEIDf04=
X-Received: by 2002:a17:90b:5346:b0:3ab:17b6:9a91 with SMTP id 98e67ed59e1d1-3ab3a747313mr8642095a91.32.1791839437089;
        Mon, 12 Oct 2026 14:10:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 8/43] dool: patch CVE-2026-56652
Date: Tue, 13 Oct 2026 10:09:32 +1300
Message-ID: <20261012211009.3352822-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130778

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-56652

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 53bbf2771b13ae1d2c856975ea8f8712b329cb30)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../dool/dool/CVE-2026-56652.patch            | 35 +++++++++++++++++++
 meta-oe/recipes-support/dool/dool_1.3.8.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56652.patch

diff --git a/meta-oe/recipes-support/dool/dool/CVE-2026-56652.patch b/meta-oe/recipes-support/dool/dool/CVE-2026-56652.patch
new file mode 100644
index 00000000000..c6806ae0c56
--- /dev/null
+++ b/meta-oe/recipes-support/dool/dool/CVE-2026-56652.patch
@@ -0,0 +1,35 @@
+From d20ba041a0f4968fdbc2745827f9af676339924f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20Majchrowicz?= <sectroyer@gmail.com>
+Date: Thu, 18 Jun 2026 19:20:30 +0200
+Subject: [PATCH] Refuse symlinked devel log files
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Michał Majchrowicz <sectroyer@gmail.com>
+(cherry picked from commit 259fe40c7fa519020ef7a3f8ef8d61586b72ecc3)
+
+CVE: CVE-2026-56652
+Upstream-Status: Backport [https://github.com/scottchiefbaker/dool/commit/259fe40c7fa519020ef7a3f8ef8d61586b72ecc3]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ dool | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/dool b/dool
+index fc1015d..2df407d 100755
+--- a/dool
++++ b/dool
+@@ -2132,7 +2132,11 @@ def devel_log(msg):
+     if not DEBUG_FH:
+         log_file = "/tmp/dool-devel.log"
+         print("Writing devel log: '%s'" % log_file)
+-        DEBUG_FH = open(log_file, "w", 1)
++        flags = os.O_WRONLY | os.O_CREAT | os.O_TRUNC
++        if hasattr(os, 'O_NOFOLLOW'):
++            flags |= os.O_NOFOLLOW
++        fd = os.open(log_file, flags, 0o600)
++        DEBUG_FH = os.fdopen(fd, "w", 1)
+ 
+         # Print out the header line for the devel log
+         DEBUG_FH.write("|Time          |Since Prev |Description|\n");
diff --git a/meta-oe/recipes-support/dool/dool_1.3.8.bb b/meta-oe/recipes-support/dool/dool_1.3.8.bb
index 5118eadad69..06484c54752 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.8.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.8.bb
@@ -11,6 +11,7 @@ RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell pyth
 
 SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=next;protocol=https;tag=v${PV} \
            file://CVE-2026-56651.patch \
+           file://CVE-2026-56652.patch \
 "
 
 SRCREV = "b74503e2dfbca8ef01c284d40aa77dc82be308b9"


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6633CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:26 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32803.1792043005700355153
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EzdpP3FA;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e6038cebefso36454955ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043005; x=1792647805; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90drzaRUZo1OEMOCEJ42r70WwBOEd3go3cPz5bMURXQ=;
        b=EzdpP3FAdxxdXtOCTQ1QIQjDK1pan2BJJmLxVHo7G8JLdfX6IH59bYmCXpH4wa1Gvj
         FGlyUnq+bS1+Cokd1qgom9K9OL5HUZ4M9F5lw1Eiw75hX4+VPGYShyLr/AWvBDm94VT7
         Xc7O3vJF/vDUI+R1GdeAUjEwEx1CIgl91HMeSf+REM+IAVk4we8YBiaT/OsFAR1SYnB7
         4IibsAbEqwFw2RpWrueg5kJoA9RhzvAF+INc+CMrEwmJB7ejr239yxSBtoX/z0wKPKvn
         8Rrbe1m4+45Zq/5uaT9TqKPQ4SVLt9Mrb2SqfaDfU1l8QDrcJ6fAlowQanIuskiNR/+x
         5m4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043005; x=1792647805;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90drzaRUZo1OEMOCEJ42r70WwBOEd3go3cPz5bMURXQ=;
        b=IlVSmxmmBR4oHXJ2v7Gp3CDh/f7F8/S+Vc1EcPyG0OZWEIhvljCPeD5APOsYnjXWaQ
         +9QnAxyJ87Rw41PnE8b81It7LIJAHOHfrOVHuHdjdiGxQ5DnHDDNHW6yEY9vZZaJ0WYm
         G3ua0xnBzAp2HqyhapOWsSjEjnDxHdypgZ0o7zidIB0YfCblTrCeuf0SuBFLnXKPX7zS
         nhBCz+5TidbwfOmXX8sltlJYXzG2z4yN8X9/JDGrqDFzMQ7a+qvoMIwOa0i/KS8zd2Zh
         9Akt8BY8SrslDR6JPhpP0pnZG5VWgpFsIILjuayDmYJYTxkea1veXNvRh7kwl2g2XJnm
         4FtQ==
X-Gm-Message-State: AFq9FYLpCy8JExkA275L1MsBnnoyKOBGEx6E226cbjQvpUWxyCIBc4Y9
	P35m7u8e5E1zOjQojf23xbuXFNhJw8sLRPMz9y4x/Q+qewJ2iG3aDQ50LrlCfQ==
X-Gm-Gg: AYBFou0d3m1xgtA0692XoL9RqUdML6DfR7sfKNB8tk0/wZemLiqeoVjvujwqSKw3JwS
	S9RcLpdotQAfhhtnd01iwKq5cB4kNPxnY8ghYfrciYzqE9MerlTlOdykTeTBg376u1pDvpD6q8Z
	B5n3OQn9RPj6NBDqCXZRJwxGNH1jU9wmihVftjIdu8RneO/brg3TqGCKzCycGGYdF9I8Wt9vb1E
	hqhiQnvxlfK1oSkN8LOcYLf0Va/TKLrWe38tEoEVILnjwq8AE97yzz7m/JA2pm0hek/oXfdIjUx
	flImd4qS84vk2TH/gxfPzY7yeaM5kL0BbZ41/9X1YmTq8Pg6t/+JUwisfIYMFNETiIDy+rtn37a
	7AUK2HqEYkn/TQx5wfzJ+o00lEW3o6PbtQge0IdsMNFQL1WvS+lAOMWyFALR2k32RF1Jg9kyutz
	YHP6RCQGbsZ9ztq0LXTvGv0wzy3kdq2XQjdiKR8xq0AxOW5iiosR6ki/PeQGfe2ViKNmnvFrct3
	oORm68uZ3gIIU2hTywt2t76wA==
X-Received: by 2002:a17:902:e744:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e842cef77amr167027055ad.60.1792043004927;
        Wed, 14 Oct 2026 22:43:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 17/82] dool: patch CVE-2026-56652
Date: Thu, 15 Oct 2026 18:41:05 +1300
Message-ID: <63363b3ec9c5e6ceaad1a0669d9a2af73c917146.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130937

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
index 0000000000..c6806ae0c5
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
index 5118eadad6..06484c5475 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.8.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.8.bb
@@ -11,6 +11,7 @@ RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell pyth
 
 SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=next;protocol=https;tag=v${PV} \
            file://CVE-2026-56651.patch \
+           file://CVE-2026-56652.patch \
 "
 
 SRCREV = "b74503e2dfbca8ef01c284d40aa77dc82be308b9"


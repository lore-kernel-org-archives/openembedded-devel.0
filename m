Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD54C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:46 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9046.1788343544824035419
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XFfmbEe/;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39927410578so1605359a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343544; x=1788948344; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cyhuJzR9tpyIrcVpxZE/T8XLLTSJEu2KdUKtFnLTKcg=;
        b=XFfmbEe/TCXtGDTjbhMOMvIqHvtaJS9LUTcPSJ8lsfgD7FqoV/rj+DmZ1LfFr8vwXB
         GpjX1q71p4YNVVhu8GeLCGZW4XZG06v5CMyNk97KahJT9x/w554wm/3mnKgqF8Mg4T5e
         4LdDnnwnTXQ5qN6LjQS6GO0JHF/ckN6yKKEXhYWQXg4T9kDDYPfWct9PzeVroOloHKyW
         8uwtzR+0nY4ZxZqu08IOrTwmoMzPCCUIJXG5oUgE9VDDV0SsVVkNn13kscZC5SlmQP34
         Ut4uMKhdid9TkyAauA7CMrK1/Q4uy+EpDzHwCrlogxsjJ9u9MqYV/uXL+pmWoS7M4KIL
         Okcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343544; x=1788948344;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyhuJzR9tpyIrcVpxZE/T8XLLTSJEu2KdUKtFnLTKcg=;
        b=YSYuAEAV+9EkfEW47f/fC5nRP8ffm2PsyzHgc6+kWrn5a0Tc6oW/B0PYM9V/xEUBbm
         9M9qtnD6++5jgtMaSwD16tvL0BcE6NaaUKYkuw9E5sulIt7U+0GMFy00tktt5ELXyCGj
         4mXcfIzOCgqKnIw5OLUN+Pu4dXxittzaz3GCe4rdTQyqH721o68Vxl4K7I2Lx5tn/7bO
         IzMN8sd0a6lQIn0JwrukNZbAInyMfwgRzdK8q7NyqX0oQkDP66otVTucVyMdXElLQs3h
         D88mg6sKB+/hiYmOai0ruKk39121urxoujJfi4iYfOL1hAg0JCHRtoC81WrJtvH4I2dY
         ACwA==
X-Gm-Message-State: AFuF++lY5illboo+OdtrfL68CrZVK+oxGUrJBSogPfFLg806YNXRo/KB
	KJwLHtkg6MLVc9mXaN0dX4EAMS536qhfj0kRnZuRAvmc7FsIa1dUjy+B9bW2D8vP
X-Gm-Gg: AYBFou32n/y3dV2fAR0plnOPw8gRsNUM+yuOLojlKsia6nunhuoSpTOcGfxYWcHaPPZ
	YVTiNAkyLXp7edGRtiTQy0oknKrGqFSXODCqhdvhRlmLcOXpJugvPJ2P0YTJbHLDlxz6Yyyr5sr
	ca2lXf5nyjVn9Sbwq/mEtxSKXRCU0+Gy5jsG3hU+63nL7RlSbplhggTr+QNIKDHffM+LuvmizoV
	5+YxkICB6fT5xGtODj55utvV6t7FUM5hjwgBXibkAtR2poFgYMSxISVn62Aj2ixy3AlwAOuBO7z
	elL1cbwI13Wc/GuM61ZZssmSomfFD4JbIs/ABcDGFJAAaUne7KPOrE76cxw3cNws7cDQuLYVa39
	WVIduEg9SxR8OjtcuOuxucGwuR89l4XPAaUfPdCAuWl5vL493DLU3oJjEGZqIyqD2s9ZQUX0+Dc
	UAHw13+h7uuGRwB8H8+ibAoRuq/92PU5BcicwngYfRB00Bcdh1rmDZD16QaE1OjJn7XxFxfii0
X-Received: by 2002:a17:90b:4407:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39aee219427mr5412151a91.18.1788343544101;
        Wed, 02 Sep 2026 03:05:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 10/28] dool: patch CVE-2026-56652
Date: Wed,  2 Sep 2026 22:04:52 +1200
Message-ID: <20260902100511.2105916-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129641

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-56652

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
index 787bdab4f2..2ab20a12e0 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.8.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.8.bb
@@ -11,6 +11,7 @@ RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell pyth
 
 SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=next;protocol=https;tag=v${PV} \
            file://CVE-2026-56651.patch \
+           file://CVE-2026-56652.patch \
 "
 
 SRCREV = "b74503e2dfbca8ef01c284d40aa77dc82be308b9"


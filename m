Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63509CA9ED6
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:43 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3485.1791763836484240230
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Th6HXyaa;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-890d52c7c7bso1138703b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763836; x=1792368636; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IHZMYifF5YIf54LpMRTrtfIxEQZb5vTJwqmhYAklHYo=;
        b=Th6HXyaa69jPiq8vQVlgyHghWHrP7TxirjEK7wZ3kvLiwmUTZX1JBRbaRgHbK3ZImg
         JFeM/KhiUfuusvNpacWF1OLi+PiW8Zwlt3bLSCPk4pzNcAn8NABSEP7yuc/kaUzl2VUL
         dgpT3H25NC4s7DCB5a5fQ4wZ+XZgDwrsMuWycnGwdZdKVXfP3pQBJ2e9Uqr1D+mXibch
         WXySmvm3Ljoj/d0hLLIH++Q3RyNjtDM1dneYC35hvBGc9ugLOG0CItgxTVxJpZ3cZOWk
         Q7y72BQGirvaG5T92yiYETgTZYRov0NnODoFyf/DLw0GwR1Zt2st4FUno2TP26OervJ2
         vb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763836; x=1792368636;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHZMYifF5YIf54LpMRTrtfIxEQZb5vTJwqmhYAklHYo=;
        b=PyHo2BwALY2gbPbnuuB5r2tfPVRexa6O963xGPw+6v5Rx3OlGMuFnOoETVt997AKav
         4sYPzKd68KXwJSEEzZimPWVNkcw5sWYoUL+yuXoQ/OdWL3gLSGK8rzlDlqc9wzvKI2IO
         M/iuyfBi3KoybBRca5CvMJ+MKbuqUIcZfIwwl9JmCJyZSkqOcqlzT+FfK6aSrnFj3uVa
         2qjgoXhfNupubx/aykvDZ8DRVg1FZQM4avNdxJVuQivuxA6hPP3WOtPd7FQPqU77sx1J
         yJjGVKcIFTOITVUYIbIxXFhZThaZFwCcGqQ6TPRGVuw7fU4DTe4fYhH+BuyuBgYviVWU
         wORg==
X-Gm-Message-State: AFq9FYK0lxVzjUqrTlt1P44wmWVswzNyAayjg4BSb50HF8ST6kTti61a
	WUMQO1uDcm8GV42+v1YFux0ITKK9jDSF1HsZCnB06c3zdh4ZrV4+/B4jSmcVAg==
X-Gm-Gg: AYBFou1MCvPuSEa9gcse6alfsT/TsrXT4ciLLtyauGIOqovcwCcJslCJStzchSOqjVH
	ZaYcs5TxSVQgmsOLhmtBnhlRmXVDVIzgc03lYx0ILE1zbPVjjInl7lexTDW6VsF50v7qvU7L/nv
	EBLwECAz1erbCZkE6579RV63mD5MoUDBXxVo3x+6fpfSqSoSD60XkKXFfhJDoJnkkEvo8vED7c/
	LaCKUY6TqIshESRLA/Z+8xwxZDzKvGEJIsXVFz1KMQTTJFaDkZLcGQq+spr7GLdDZk3XVhZv1zH
	Xx96uwIEidLaff6nVjJSeJzTvVaq5B4oigOCy3Xd0Um0AmLnhY312G4swLh++k/GlDzb39/DOU4
	YejfbQlugk6Yv96xENS6P5GRZTRg9G8718X2s9FjfMHBQuZKWu1rs7o2AOojxsTrydWweyRmeTX
	MwVcMvrH+UcCRsKA9pq/W/Lo6MLAdgYLgG/RDQef7GliAzrRdn1CjzBtoBZ+GLA/KPENnKkOnKN
	wn7vsizwt7KT3jaf9Y8JjTcowW3m2kS8YclkO0=
X-Received: by 2002:a17:90b:380a:b0:39e:6a7f:1dc6 with SMTP id 98e67ed59e1d1-3ab3a99ded9mr7573860a91.34.1791763835728;
        Sun, 11 Oct 2026 17:10:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 8/28] dool: patch CVE-2026-56652
Date: Mon, 12 Oct 2026 13:09:46 +1300
Message-ID: <20261012001007.2541673-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130733

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


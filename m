Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99004CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 20:45:15 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.921.1759524313354726791
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 13:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k0qgJdt2;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-78af9ebe337so1949638b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 13:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759524312; x=1760129112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVNvf0AS86z0F5/CoKrvWNP3UP6U1Xa+kIxZrmPkLy8=;
        b=k0qgJdt2XtNFqAw+fHSL03o5Iz5NmztJ/AKEcTHLzWoanRFkgbW171lvDnJaak2vvE
         w5AjFEgd+ccOTcNo2zwjsSAOJoZUvakd1P24QxKoK7NXDT2jYqSRVnMsb8t1rUYVdhL5
         B+KDhUzULgLy/tggQ9XCegr9iHyH4HOnXG8/AY5pcDPAfubwEbsG/TXg7CA2rJJMDz5H
         /okjY+PkZFX2zoYbfb18YDud1ZvMbkqAuoO5yJxcBI9UUr+pC3t/QwA3kFfRcIcg1yCm
         s+ob9nbM6dKelBXLzQ4hFHFVpRoKlP9KDUHHMVhSG3om0+gs5FYKQPfhb3hptSn3/Oqh
         wRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759524312; x=1760129112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVNvf0AS86z0F5/CoKrvWNP3UP6U1Xa+kIxZrmPkLy8=;
        b=vCRfPg6KZ0nZDFdVxwOyp/467w7SKJiLssxUH6znPsJj9GgTQ0MdlKY9FiLg3av32Y
         7EJxaItUe6Nbkvdn3Uc4g5ggOLPUsqKMUkgNKwrU0XN53SedV6DUNpoWBLvma/4G89yv
         mBWSAFRrHq4XdMZAUs3ujq0QadyWu+Hz48yR6UwHLSyUIkRYgHa6GBjExuDt8SJLfZ3k
         5j2yAcB+e5exDjYnF0qlVVLOz9/5tBhFQW6PaZY4lk/Hn64IrGPtCPSzeK+SQdyy0ZZo
         gECNdcHaSxvIMeXmO+7QZiZdOEXsaUCvlNA2zKGF2Ce8z5o6FnraLzdgmls1CQ/9Wh1j
         KAbg==
X-Gm-Message-State: AOJu0Yw3AeIY6xOE9HeGvSv7JaB8KfHmvcjursMC5ObNsyYl72Iw6GUV
	A8KIGDk0q0mtjl/8cLfLTiRspn2BXT+w6qiV9ERBuORmLhj1iFGGDC0LMpix6A==
X-Gm-Gg: ASbGnctfFvkeWrKVpSOaArbzR4HGwKL0nhsFL11hoe0lBNyZXeXe8Gxhd3uVGN6BqPc
	E1Aqi4Bo0jSIAZapCsFXNr0g+0RjcJrJ9MC/fZK1GEQA+BXtMN6JLk0bOLfUjzeWucZezTvHkGS
	isRpRXgI6rSBijnRGAzBEJWxLafJ31JcblmHmQXfvYEKcCAFkBnEUVy4ktjFJtAh5qV8dZVwgep
	sRb1fyuSlRdk4PqEmabytTnWFo+aTaQhRFQGZ383Z7tFm+0yXUBIybs+UDbwxQwe3SVKmdhlOAi
	DNmu3OeWdnSzwVAznFDQv/+VmrnfqQ+ta+vLOpBJkusyP82Sk7P4L7/3ML2ZUw8tpfDrw1+I5AT
	Aa3nZxM6ebY1Ku9BC6TU/xO7VJlk+hESfV2nHVHod5JicW7aZi3e7Ch5TClA7Jngc0+HEz2k=
X-Google-Smtp-Source: AGHT+IHw96raDTSQy4zzevwfW9QPoGeI5u+V46yRaO/shIzJ2Atjps6TdfS7YLSWcs7Hr39qYCMb4A==
X-Received: by 2002:a05:6a00:b49:b0:77f:4f3f:bfda with SMTP id d2e1a72fcca58-78c98dfccfcmr5017497b3a.31.1759524312494;
        Fri, 03 Oct 2025 13:45:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206e809sm5720965b3a.71.2025.10.03.13.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 13:45:12 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 1/3] zlog: fix CVE-2024-22857
Date: Sat,  4 Oct 2025 09:44:47 +1300
Message-ID: <20251003204459.273748-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 20:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120225

Backport a fix from upstream
https://github.com/HardySimpson/zlog/commit/c47f781a9f1e9604f5201e27d046d925d0d48ac4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...E-2024-22857-buffer-overflow-patched.patch | 31 +++++++++++++++++++
 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb  |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/zlog/zlog/0001-CVE-2024-22857-buffer-overflow-patched.patch

diff --git a/meta-oe/recipes-extended/zlog/zlog/0001-CVE-2024-22857-buffer-overflow-patched.patch b/meta-oe/recipes-extended/zlog/zlog/0001-CVE-2024-22857-buffer-overflow-patched.patch
new file mode 100644
index 0000000000..1f11b07216
--- /dev/null
+++ b/meta-oe/recipes-extended/zlog/zlog/0001-CVE-2024-22857-buffer-overflow-patched.patch
@@ -0,0 +1,31 @@
+From bffbd94a0807efbab0f449b13d622d3cffa224a4 Mon Sep 17 00:00:00 2001
+From: Ali Raza <elirazamumtaz@gmail.com>
+Date: Thu, 29 Feb 2024 11:36:25 +0500
+Subject: [PATCH] CVE-2024-22857: buffer overflow patched
+
+CVE: CVE-2024-22857
+Upstream-Status: Backport [https://github.com/HardySimpson/zlog/commit/c47f781a9f1e9604f5201e27d046d925d0d48ac4]
+
+(cherry picked from commit c47f781a9f1e9604f5201e27d046d925d0d48ac4)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/rule.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/rule.c b/src/rule.c
+index ae3d74f..38d3fdc 100644
+--- a/src/rule.c
++++ b/src/rule.c
+@@ -866,8 +866,10 @@ zlog_rule_t *zlog_rule_new(char *line,
+ 		}
+ 		break;
+ 	case '$' :
+-		sscanf(file_path + 1, "%s", a_rule->record_name);
+-			
++		// read only MAXLEN_PATH characters from the file_path + 1
++		strncpy(a_rule->record_name, file_path + 1, MAXLEN_PATH);
++		a_rule->record_name[MAXLEN_PATH] = '\0';
++		
+ 		if (file_limit) {  /* record path exists */
+ 			p = strchr(file_limit, '"');
+ 			if (!p) {
diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
index b75802f09f..86a465d285 100644
--- a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
@@ -4,7 +4,9 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRCREV = "dc2c284664757fce6ef8f96f8b3ab667a53ef489"
-SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https"
+SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https \
+           file://0001-CVE-2024-22857-buffer-overflow-patched.patch \
+           "
 
 S = "${WORKDIR}/git"
 


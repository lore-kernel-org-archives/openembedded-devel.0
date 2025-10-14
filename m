Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DF3CCD195
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:36 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.322.1760475275186070365
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SQSB4vD7;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b62e7221351so4753043a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475274; x=1761080074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI1rn/ZUvgVNkGCXi9630AQ9Xsj3nH6f8JtWqRRoiKY=;
        b=SQSB4vD7bInXXmQkGZHmuaHrn6QT3+XU+heGgOVq6gP3oKb5s1Bz21a7B/r2JTYghl
         UC0RuS4mqYDuLBicdz1M8OD5RhfWU56WQb9j/e86sIl+WqMS9MT5vkfeJzfvzJY7UpAL
         Wk4SKReXSAxBvS8kZiwCAYIikKrWSIZ4sDO2wz2zCdBkBLS+/iCSRvfvew7YFx3rXI7r
         uenGhn9wsYhW/zBgfXeUPEYeoq6u6+5OB5xn5uhNqtOeK7YDeZ0+pbmXWDr7dFsTbGFj
         JVF5dKyxw4ZabJQxMCte/f3ibVdEL2hPSNCkJPIbb+sNq2yS4qBVRqYcnAGLCmvpzg2b
         bIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475274; x=1761080074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CI1rn/ZUvgVNkGCXi9630AQ9Xsj3nH6f8JtWqRRoiKY=;
        b=EHst2UmYdJ2NPcR0i1l+MnbEKRNygkoXU6JQRKwdf5wq2jQFJ3WNouGC9BavaGtsgM
         lqMzpvvhms6eGjfAiZXU+mFCHBOwJ4715oom25iG9WDxcYoGcYF5o80/vfq+uSx5Iny/
         KEUtZ5pTDq1XRx3bG5GZW3cQVMexjiToNda+f/+V2TuAb5/RVNmNec5XNsvwRsC/3W8k
         lRFnl+BmjuBBpCClYD4SrUSSz0aJxMDEjMl0WWcA6673GriHho8i9m3nZVhIVYi/RPEC
         iFxe+WaM6EwCYbilxuTf2LAW8NkDHr3hyk2XrMRaWdAAcYoclcuZAjTMaBSEicEKTAZJ
         B9rQ==
X-Gm-Message-State: AOJu0YxkZ8EA2PNUV8m8Jv6zyhq4lc0J7lSv1Doeto/L93eAXdUOISXV
	jpRk5IFilhDREQpbOigoRjGRt8JKIIJa/19LW+3BWk/GpxHoVRnAfETxauefOw==
X-Gm-Gg: ASbGncvc1wyN9s4V+VHH4SGs4ly4Jbva0l+SM2D2PsOHaEi+dayiiCKevGgwpm//iH4
	3tuQBEc2l2ONj+zHZx3WtyOWlu2dYxuj2h49IzpOaRQuj9Ni4w4ad3elBN8ApfoyvvTIa+XfDCg
	CC8q4nOjTVHxfz8XmIvoVwoyOsGdX+Bf0NKWXuc4EICOKZhc6iDsFUGgYAcZIFZZrAzIUwjbf4b
	B80bYycUYoBesoiLfs1crbmZZNvxcg0DzODu8JrpNU7Q6GiGn1InlxJlEpT5MctL3VWlB0pbaE0
	P7x0OGCCLy6t7Sqes+GACRix4d9QcbLhH8ySi7MACaKIwRFtZZnFEOOgy5UCOW11xkpefkh1cLG
	LyD7NAM3GcRQ4+PSEeW/2KPDO3PS46RsXeSsEuag6Zi0iU0AIwrDdE0p57r+EsO+0nA==
X-Google-Smtp-Source: AGHT+IGut4CH3+z4dL8f7DMln0EQo4iz1TXckFYyXDKLDVdqXIVDRG0p1sn3SC0j6NwUsuCoIbNKqQ==
X-Received: by 2002:a17:903:3c30:b0:270:ea84:324a with SMTP id d9443c01a7336-290272c1898mr341305185ad.38.1760475274466;
        Tue, 14 Oct 2025 13:54:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:34 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 11/18] zlog: fix CVE-2024-22857
Date: Wed, 15 Oct 2025 09:53:54 +1300
Message-ID: <20251014205402.1487867-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120644

Backport a fix from upstream
https://github.com/HardySimpson/zlog/commit/c47f781a9f1e9604f5201e27d046d925d0d48ac4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit dead2a0070f640d782f64a1ed45b0aa539a131c6)
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
 


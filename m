Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18077CCD196
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:18 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.3576.1760484795608929192
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SaSzyop9;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3369dcfef12so6651394a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484795; x=1761089595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI1rn/ZUvgVNkGCXi9630AQ9Xsj3nH6f8JtWqRRoiKY=;
        b=SaSzyop96n9lf1ZsYdVSPRjIMS1Dh7CD0GtmoI4mit4xj5OaiSf4oONmWIwr0R/Pa1
         sQKxNiBAD/V65akVpYxhqZyiu8b9xzZtKB2qAQPCaxD+HnD7ucfc/ojMzjv6KUwXuiij
         JUgRZiUxNVHC//ZMCzmvolw0lrtNDwnTn2sEJEaF7Rj0mRs/l03ywdo1YQhJGLdltrdb
         vvjale2lBTspxsQlueDi1rM1A/G/BRZOYZQa/Emk/rdakXGrRLGieIVuxJovtXVyFMCg
         eJMjUfnaVSQZIyS9DhX6Q98bQmt7ZrpqX7QYkvI8RGCZegkxpYBwFfUZhZTspzHBJqIx
         7exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484795; x=1761089595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CI1rn/ZUvgVNkGCXi9630AQ9Xsj3nH6f8JtWqRRoiKY=;
        b=Ki4H+ArwsSDM2sa5tKAWxIWqCAqEKXWQ42s0QGaHZDMZJ5o8jN5Bn3tDMgYbG7HKKr
         RgGKkE3pyCWThb9SPG6IZy86bKM6+on83JkPd0NX/Yw+I5AxsZqsF2KIAKa9gTQX67gb
         8YIo04nm9zS+/zCrP0WowlGlDiOWJxWVcRv73W0DJnyobTtcYCft+AntZw7SozSuuR1u
         KGtCgAkIbThKZkJB7NKBq7juxX7N+BGPXKQ6gexmvBHUJLhuId7aWfhuEnGF40cih4ZE
         VLH1n4A6RuU/Eq92NOt5BWTDr4WH2dA9I3u9WmLr2zUBMpmTzw1RwZuaCecfVmb86Loi
         Gg3w==
X-Gm-Message-State: AOJu0YyYI7PiExXVIYtwJMW0mXcKM8IS4k9BYe2ii6GScPe+bNIN62DA
	X1dGsiXUhlpLCw4PUCVBnyG0sWZNCdlBZTmQoQ0OAuoW8Sr3Pt/Zgf+fWaKm/g==
X-Gm-Gg: ASbGncsN2r28TfXhoehK7Jj8qnM6GEjOHoKCVoQ/s4828t+7JEiA0VJ3zrYu0VhGJc4
	MLtZt05/Tr67iY+QKSiqn7Qy73IB93CS5Zb4/hOXtZQLx9gtPWsGJTeIQwwfkze4atHa7NHY9KN
	AjNH9FG26TB5tLPLgJ6n+0CPW2HKuh/HayOz7Og7PZOIK3wnPrm7Plzcq+VBgE1w4BcUWd+C4Fq
	SA2rlwqYRgDufOQQRhXZRmwOibcGXjcFLcJ629xET01fS1rvZArc3HnhQIjIrvt/B5VsOGa3pFV
	Trj210S3JO4tEoIVRJpWLPX3j1VKLM7Ia7HAMT2aSUgNfVp4QlPncSGW9nzotLjK6f4fOTd3zc2
	NCVqFwzI11cYfBY5sApig6fzQaCnGVJBK0x8wdBbVbogrrY7ngpo3v04=
X-Google-Smtp-Source: AGHT+IFSRimUceZXmxQFh9SPhjWhjxnm/ToOWLDi8zGeWnURqBq3/+tZYqOxW/TPmSkiZaAK7W7PCw==
X-Received: by 2002:a17:90b:4a52:b0:332:84c1:31de with SMTP id 98e67ed59e1d1-33b513ced6emr33349667a91.25.1760484794809;
        Tue, 14 Oct 2025 16:33:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:14 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 11/18] zlog: fix CVE-2024-22857
Date: Wed, 15 Oct 2025 12:32:22 +1300
Message-ID: <20251014233233.304125-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120670

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
 


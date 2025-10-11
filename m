Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB74CCD187
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 02:23:21 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.3800.1760149399918155026
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 19:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RBzEuDIT;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-781010ff051so1909703b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 19:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760149399; x=1760754199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bHBmHkIkwiEE2YzgxqLksOFJPpsJ8B3TC35MBHp/mIo=;
        b=RBzEuDITmiWCURKgUpBsaHY9GwOAwuaYz/Tuvt5TRcN6NpR4UkHZKFa3H1hEX0WVnP
         kcFR1ys7GE7T3j1/0k2/YVMO+GnZSk8cAgiGPUjos9A4UGV+rlvhPbswVl0RQ6CnqqSN
         MVXg6lJUfTpsPSWvA3RDvEvAy7KuVYknhx1YwULlnKwnG2FNtMyckoCUSz2Hb4aadrxC
         8rGJyY6UobZIhDM+3lTrmF6NVPnknvBfBCdFD5/Pt9NDhGeznOZZR6t6N/3Lpy86rJH5
         osRY3ywGTngT3Dd0San3nwI2kVsQjd7QB1RAJ/Taq3EB0PSBb2+TlG6CyeIBaVGV0dTD
         OtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760149399; x=1760754199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHBmHkIkwiEE2YzgxqLksOFJPpsJ8B3TC35MBHp/mIo=;
        b=fIaeFissVbR1JvERolpK8UFXLI+xYBJrz35JT4tO+8XKgm4yN2mV+1Te7Sp+SH8EEF
         ohL2rQ2Sqr+GtOXNWan2/yKW4FFh0Az20KFh4rQgHUyy+QGc6pzBBskxr+v8xuFpFtmq
         KLJ9pfc1z764oeg8XgNnBMG/mffX6gpW3Pzl4G9fHIublphigRvGOdf4nM5T7MEl3n9Q
         l3As+O74WWG81HAGMl7rBl0ZDTre9bfmKCEtfWS8Juu/0b69RUt13NmxE0t8LTHsidgV
         KqOCqAFmq902HquYVRwyN1xHS695G7L6o/BfgZuKx2L5JiM5noDuyaa80XA2/NjaKojU
         L+XQ==
X-Gm-Message-State: AOJu0YyU/XD0wB13QNZBiK4HPdqiK1Gd3TPCFoZwm9FBQswpqonWuIrD
	VLQxbNnLf88E+6FOASKApySnSBIQYzbTnyNHO0OhZIXmhsdyPIU9jsIHk+AIyASL
X-Gm-Gg: ASbGncuo/ICkjZKiY7lzhCYNm/UaUZZYTDoQ3FnJshLjqBl1sVoBM44pW4Gdi0gRyh9
	y+vjyEj7ppEhsyvc7Amjsrc499rR/9XqQPcz4s9SYNbZQwlm74XWowLM1d/2PokfaWA4BUY+jkH
	kDJmksWU4i7RsXRNlYgBps+w2+l8AZe2Wqcp1Zn8DmfpmMWUtEGkBelkxxpme+ItTPyycFlcYEU
	1NUuPSZ1JSRzQSVoz8S4LcdomZ7kXOvOZnptgz5bcgXHioyNyKRTsIYpXpKfLVeTX12otB16DIk
	6bB3IwcAmTvaG2cK4Rgo1Dg9OhiCySCHzY7hVXFSdC+WVhth6+lyTGSlWZK57PzypoK3NUOk3So
	ZBey5ZtCLWKNA1sU0eHHQotb2i9f6SspFysHRSWeEFQ==
X-Google-Smtp-Source: AGHT+IHMtzgWndn55kXzUPdeEADDeOawJW1n2jxT5ji0qvMdLWqak47WSLDbMBdbO3uYjnLXRi2fEA==
X-Received: by 2002:a05:6a21:33a6:b0:32a:6d26:fb5a with SMTP id adf61e73a8af0-32da80b8305mr18092175637.4.1760149398798;
        Fri, 10 Oct 2025 19:23:18 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::4a63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060b66sm4471890b3a.8.2025.10.10.19.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 19:23:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ryan Eatmon <reatmon@ti.com>
Subject: [meta-oe][PATCH] pm-qa: Do not let find command recurse into .pc folder
Date: Fri, 10 Oct 2025 19:23:16 -0700
Message-ID: <20251011022316.1436523-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 02:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120489

find, the way it is used will also list c files in
special directories like .pc, which is created by quilt
for managing patches and is the default PATCHTOOL

Ignore this directory during find operation.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ryan Eatmon <reatmon@ti.com>
---
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index f792415037..3c123f9294 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -19,8 +19,8 @@ SRC_URI = " \
 CFLAGS += "-pthread"
 
 do_compile () {
-    # Find all the .c files in this project and build them.
-    for x in `find . -name "*.c"`
+    # Find all the .c files in this project skip any directory named .pc and build them.
+    for x in `find . -path '*/.pc' -prune -o -type f -name '*.c' -print`
     do
         util=`echo ${x} | sed s/.c$//`
         oe_runmake ${util}
@@ -32,7 +32,7 @@ do_install () {
     install -d ${D}${libdir}/${BPN}
 
     # Install the compiled binaries that were built in the previous step
-    for x in `find . -name "*.c"`
+    for x in `find . -path '*/.pc' -prune -o -type f -name '*.c' -print`
     do
         util=`echo ${x} | sed s/.c$//`
         util_basename=`basename ${util}`


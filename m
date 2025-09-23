Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2658ECAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.14116.1758625601187431565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=htC/3Uyw;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b2e173b8364so297186966b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625599; x=1759230399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPoDYiVBYkgOehu+zqFg5nMUatfwOZ3bJSx5Sp+0/nM=;
        b=htC/3UywvtLi7fOVkysKSB72Hq6Fq76IglXwlK31VPFJYeBc8XNnq/vtz7VlvdzW4D
         jXod4ggC+uLzvMxFcL6KR774mUPk5SnMX6W/rTP8KSxzCknYhlkDSDHezpW5llMPLMB3
         /IfkiDoATqoc8APHps90F3LlgZ/ydOKHC5qsm93P3NDBKYKzIA7uhSSxiIrXMNHIVVvF
         dULb3FqRqqXa5yxgFP26jVDuJ9Iezk5aqg+SbI4bO47KiabxNLK6++I0VSeORnysLDmF
         jokvKDXZpE0RZdP6C6ErG8OoI59/Apue6GclRFBlhFxOy2+iDHgC6/w+TqQglaKC2u9Z
         Q9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625599; x=1759230399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPoDYiVBYkgOehu+zqFg5nMUatfwOZ3bJSx5Sp+0/nM=;
        b=SWLTa6J+ECoMChwi0EYZ5hnqxhXUz62FCsbXiaNyV6/bZ1Cue1gKWyuiOKLWTWywqp
         BHyp8Zld92S6V/hb8thc4WJOP/YUzuq5ig08uHmWNFiQmk5WFz8aDgHE1/2CZ56pD7U2
         xDkCPYwhfu9imvr5UwbH0h0fLIu0c/K1YrQE4sBKeoijtylYw4jL+1TbAF24YEIabhl8
         cq8xoPWGMryJLZS6wL40MrxnOuCS0uTuFdKr7Vij5ZUXtBI+1+7GN4o+r6ry7MxiaXCa
         Z3ravcsC+tqiAXNqyd+R1qnxam6B1xr55xYrdcH3SQIGuz35Dwmhdn5V20PcpzyEv37A
         eRcA==
X-Gm-Message-State: AOJu0YyJzLvQyeM9ILzmkTvC1o5i1wTwXo9xwzJtIGXy1hw+cG6w9s5r
	3CaWHATkr78y276bQvF1DeVLy9/K7JyRBJFqXUT0pgU2pnmTfaD2n93RunPw3A==
X-Gm-Gg: ASbGncslD7WxoK/FOfvADn/3gnKJY9YPVRP5XusxHqFMFm1Il2G32g1FNtXDvrFkk+k
	qSj0ppk6esLhgnXlK2VYy0HpEKWBRqG2MzZ/a0AtRGbZ/F+6PZdaCR5xq9yInYuf+ClplOfjC8P
	F9t5gebIpx4M9igACrXK3jUmsqrxLj4cf2nrLyBtxOsuAGAGW/xNheorDaz3owo6ea8EXYt9PBd
	Z/9k0bSt/G8GTcDk4IycE1vD4TCmdZsTHvO1F+53kmETWDaQv0krUWLBtuc7dUag+GOmsUSnz5x
	JCsvTDeFtKR0LmRQJGHqtOEZiQy0k8H/45B6BmBU1+pq8Jdwcs2BY1zuutGZFSkz+m6TqoTRc4P
	iKI4hl3MN9lXBZuTxJLnu
X-Google-Smtp-Source: AGHT+IEj4aS0AEKrc2RkWp4PatPILyDauv2rmyid6naijiWZua+OWz+tlZxf1xBBkDuT0mjySQV3qA==
X-Received: by 2002:a17:907:928e:b0:b2e:34f1:9dbb with SMTP id a640c23a62f3a-b30263b88e7mr210409166b.5.1758625599451;
        Tue, 23 Sep 2025 04:06:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 03/22] fatresize: set correct LICENSE
Date: Tue, 23 Sep 2025 13:06:17 +0200
Message-ID: <20250923110636.3413021-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119667

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 86980f2df271c4a798efe9fc40023b2db6911f47)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
index 1ca8bb3fe9..592f05b854 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Resize FAT partitions using libparted"
 SECTION = "console/tools"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https;branch=master \


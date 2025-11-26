Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF11AD111A3
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 20:49:41 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3853.1764190172065735421
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 12:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f4tFRNe4;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297e982506fso2431145ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 12:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190171; x=1764794971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXWMADRhBXGs5GRe/wgTnuOXRJDO5NTq9FZ4i0U7lhU=;
        b=f4tFRNe46nfPLIBA+nT2+4M3Rht2JhAqCTx7mUodFwCQ3fFgWlndvZXSYfAQn8Gkwd
         wzZNq3eJSmyKaTEiGQeGhUIA5rujQIWMvQ7Xdu91yMpRGamjvydZV97OC1wiBgeWez9o
         rn1KZxI9nvT6Xmx3LxSlz1N6V2WVPvvnUEUqpnN+GKVg20qsNo7kAaJSJSto7W+XzRes
         cOhMbxpnuTGQeqeg/FyVVZQk/Hg9H5Uyk/Suni3xHhbBW/clSYzCed5xxuilHFjv6Wqu
         VRb0AayUA2CVpY/Tal36QsNpQw5zvYuzZ7ZkHRe+ODdwMTDUh0icHm7gL+ikE27BGVWh
         Hg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190171; x=1764794971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sXWMADRhBXGs5GRe/wgTnuOXRJDO5NTq9FZ4i0U7lhU=;
        b=O61gU7Clr7wim39of8tHhNtW44kv0GWXlk5K7ehL43TdJfroh7/wuwlkoMfUbq3NKX
         brhfV9Cx1yQcsJ3Kiy/khkeOkGIIY9Miy7IGuX3BnBBWPS8+UAkzC5Q07Et6ZeKKiTGw
         kL+3LWTx3Rm40ysI+SEpmeLXkBTCeNrCkao9cZvGQ2QSGqPnQXNh4YV9VmSPthW3Mnq+
         yCOlkipnUIpFmKmALQl0In3KRphqtiKxWs3ieoF/Q4ZZiq3Js0Rils6V9EXzDLfnz39e
         kB944vQnWpoO/lg6fQSZQ8cs2acJ2PI9VDlLVLrtNYckl1gYzeyLqGB9Tnr1KeKcuDUm
         8iZA==
X-Gm-Message-State: AOJu0Yx1JbMlRpVy5Izwk6xxNn76v1ttWf4qwdXsuhmJ4cCgjHscVm+P
	eky4IYtC+6az6l+mMyN5rV+dVrwk9+03ykRrCfwL8e8TeHlnoVO0wDhtNMio9A==
X-Gm-Gg: ASbGnct30x20nfWRYnOBTslZ9Jeqkm6TZOtN23OwI8bBYedcGoYsY1+qVwvFLMA0UCo
	zhop6Sc9OH1ioPwtA6exUBn6O0BuMTxoJeZBX0afRunZs0HYu7WbePni+VIApjzxVlz/jIjMq3M
	05uIGhjlCjUlkbIQsZphLNJP5Z3LnYxpyNWduIjnRlvVaBepCI9XyiwRdA4CtH0GNM34VZHDQlt
	EoLBPmuk0G2n5hw36RU1zj2UYNEvtb0p+z/zDbboa8QsTZ0cQB2mIll/FHcl7YaRIvYSiqGjMIv
	AULHbGSxz1aOa/OzpeGdftLzGNSvmKSjPlrgYNGhT4UFcjf+5vhGrOfeFfOVDHQM6RNbOYqRzkj
	kWofxpqKchC3ALrdTriLzncxy7/EOx5D4DWSxgjHwdaSve8SwYlxT5RMyIS09o+VnkJ2YOoLu7+
	ecYxNn4stjbpxs2Dtutx/wYQM=
X-Google-Smtp-Source: AGHT+IEPAofCsYbkdwKpiIhvm3Cq6sggfRt+GOnx9with7R4ZqGn0BXEwErKJqJqOMQeNjkK75Nkpw==
X-Received: by 2002:a17:902:e943:b0:295:82d0:9ba2 with SMTP id d9443c01a7336-29b6be86caemr230438775ad.1.1764190171339;
        Wed, 26 Nov 2025 12:49:31 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111016sm202443635ad.6.2025.11.26.12.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 12:49:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][whinlatter][PATCH 7/9] cockpit: set correct CVE_PRODUCT
Date: Thu, 27 Nov 2025 09:48:44 +1300
Message-ID: <20251126204847.1969339-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
References: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 20:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122089

From: Gyorgy Sarvari <skandigraun@gmail.com>

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit af4df551eec582844a8b56154117915ace1596cd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb
index 4726386f6c..f84b1c4c34 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb
@@ -197,3 +197,5 @@ do_install:append() {
         done
     fi
 }
+
+CVE_PRODUCT = "cockpit-project:cockpit"


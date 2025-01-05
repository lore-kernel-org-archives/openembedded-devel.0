Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAABE7719E
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:17 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.48450.1736119451070745957
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EsFrvwNb;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e46c6547266so17144433276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119450; x=1736724250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFJNjseVFesjgntcFd7CCLXiFkw7BrCCGay50HKR4s4=;
        b=EsFrvwNbvzNaJdhg9GKQHL7XqkF+5vHMDx88+xFN32VIsebgW+O/3qlQXGBpouQfF8
         ZCJxlnW6RfWNKgN7NhckNvhnDGfXn5RQ0k6aMou4HGbl8KW4tyGMj9M/fEDrv1K7q1of
         LwxEiPzBVypxDvnfK2qrJQxeWDkjSwGS5C8PlwY5qMkMeBLsnNOaBGh0c//MF3DeEBzj
         hjWczmNlB0q5pakPGt/ihFnWe8qRBM8eTECDn3BQ8ERjgdidjo9pBrtSP8ubQQPQPYTm
         BEbBP+2aegasuDI0Uhs6kJu+FBQrIQS3nWSCD0NGVWFi3dqmWOZ91PaxmMrOFB7CmHJg
         xgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119450; x=1736724250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFJNjseVFesjgntcFd7CCLXiFkw7BrCCGay50HKR4s4=;
        b=pm+6LyTJanMdbqQp0hkVgr5M63ZVv82NZrrkvmROimNuW1HHykUcEdQb+QnnfX2LxB
         ZiN3J+cAncJUkXIwYhAU4wWalbC1B6UfE6RQGFStKPJk+6lYcZa370QUC/00r6Nsk4Bm
         i+QJiat3QsqHY8VnrP/cr5M31T1U2NGQUggezHPKwdCr39kGQppwkkZLt6e1/fE96nhg
         7SGWDOijghMbqVNzZv1VvImaezHea4DSj8DVIPXiYRAU1hZ9NmiBigvG9JHjqLUbwegm
         0uo+eNESv2a9C8HQ7/cKikzZox4pe99LQ97UOTxuGeGCtYO5oeUIlG+poR4ay7j64Orm
         K0vQ==
X-Gm-Message-State: AOJu0YwNNTVmNyaRb9zGOYX+AqIOhXnqIFnHk0PYNKPPoifFBE8WSAum
	TRndg2dSs+4NYipXjVRVrMahzKx4aiQebakpD3YXESN3Shyly5Xdg/KvQGst
X-Gm-Gg: ASbGncuqPLOqYPvNLXfIwufZ5101QGceLtAZ9tnRPBWIinzqmZxYBB9RPijD1R71cqF
	ACAvD5gMVriBXTW5HGbf0sF06uBdjn18EK3VZ8xVugROdGW3TjVi8GTZmP+jcC+SLRPjZ5sUjD2
	MOkKuM6XcXTCd/71im/fErsKTDme1Qxpmi7huRedw51QJNeGAA2Uf5aWgvasoerxORo2IeU1ApF
	8B1Sp0LMkPK1jsixGHZPu6w5oHOetHl+64M5XGe/AyMwjxRKEZt6c8KcPIhR2CLi3NtOQ==
X-Google-Smtp-Source: AGHT+IEqgfsPLFwww/k3D9nXbn8K/wCk2Oxq9ApcjMeG8RTWBvMTCObkntKqPwhaFj+Bkk6+etmd3g==
X-Received: by 2002:a05:6902:1708:b0:e3a:235a:4da3 with SMTP id 3f1490d57ef6-e538c263781mr43588068276.24.1736119450199;
        Sun, 05 Jan 2025 15:24:10 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 17/24] redis: ignore CVE-2022-0543
Date: Sun,  5 Jan 2025 18:23:50 -0500
Message-ID: <20250105232358.1502946-17-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114647

From: Peter Marko <peter.marko@siemens.com>

This is Debian-specific CVE.
NVD tracks this CVE as version-less.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 87a1bcc14985dcb00081f7434697ff7576c8302f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.5.bb b/meta-oe/recipes-extended/redis/redis_7.2.5.bb
index 930c1cd9a3..ee67f8ae95 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.5.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.5.bb
@@ -70,3 +70,4 @@ INITSCRIPT_PARAMS = "defaults 87"
 SYSTEMD_SERVICE:${PN} = "redis.service"
 
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
+CVE_STATUS[CVE-2022-0543] = "not-applicable-platform: Debian-specific CVE"
-- 
2.43.0



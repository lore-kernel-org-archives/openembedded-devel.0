Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B875BC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 06:36:59 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48904.1786430211839865521
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 23:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o9K8kVgD;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2749653b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 23:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786430211; x=1787035011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSGXkVwSvVLS2Sdt8ARsz6STdrWsBLscackxvOlBsHw=;
        b=o9K8kVgDfEITkHqZNzlymSyUSH5JU772imYrw3ZEmiY4Tto9TAIIIdtz65QBxLv2Xp
         41lo9XPyKM7iRlzAk49iK09CFD+oZRyFpfD8hE+eqVuDpzuM9aIwh2pWRkHp/FRu69Zo
         m1yhp6fcgD2Vzkr5RtqUnig82W3O1qfJpFc0aCuCCO3TUV3TsIWIcqT3vcBFRsNE1z5M
         puWiW9jdiGidWtAKhb4nWDiLzKuqDE4y75V17JPjc3LxZ/i+KyeQwmu1aEEgzPjtv/kg
         46o8pXzw1YdK8268j+ARVyVts51mEOwXdReBP53twmm6iPbxj37N9DYEVoglfDA+rhN5
         j7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430211; x=1787035011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSGXkVwSvVLS2Sdt8ARsz6STdrWsBLscackxvOlBsHw=;
        b=NcuVdmnnh9CAYmh5n3s5oCX9q3VEp8yLOpchFJBA28CiBKt7lOshTT8TmuZV11AYIY
         pwMY5MEHJ5gthu8JigZ1CHpL+rbsdBNoQbkNQgdbe+/F2vEu9UyrsQEs/VNPumttOb8m
         cj0SWK06Cz/h5SqS+sLwJ7kYC+mk49SzOWXi/i6oR0ym353C6vvwW01kaYr5pB/THe6f
         PinhRyDb7GD/ctBUgUh4A+Asx9HpTxcma9ONF/BXIqome4Z7cf/sDqjEk618WNX2TH1f
         wLrMeIVumyI9OeQMORWcnLci+IsnvWCxZfPV6WZK+Xvvtzh1Ai5a7x1PnXLy8D2f2NQ5
         07bA==
X-Gm-Message-State: AOJu0YySztWzm/CG4ZDs5ivxG42KJzDHaBTobE9aSdsGnBxE/UWqrRAG
	6QYskYmY4Ol6Q2zOnq5shPnLk47mcoWnvcBjb+8zm1LvHEjmUoBSIUB4rvm5LTDo
X-Gm-Gg: AR+sD13/43iibtQBNIrbqVErEdEPnB34+HhTL4oMZdro7H+lWB+pzo0S//XpFvS6xeb
	8PSxkcNtKFhhfPn4bTz/5ijm8Gb0J/5XnMUS1lA1slLBCuosLcoA6T1pcq7lm2wy+sjPbCSExLT
	87N5fd5TRf6Y/f7BrnczIJGrmfdX49TjDogoypA/jlEvOHqMNbiULUDIJfAjYzYsfb0N6ZDt12c
	iNNVv8M5/IiukPYXQhkbbr9Ye3T1U1PnBByLKLAxkxUfc4gLkdDkzo1P1NwnpHVNkIUrpXPESSc
	BDslOSTQ/HYaBKa+bKYkCpHCS3TVySalYLRrz3p1Bq3lvT8iEkjeels499xYNwHgORmtbSlKjbb
	7lqTcmC/NqDd2phhrdI2bxs/zax3lqQh/weKx1xUHw7UqIjOJ2qO/TX+bjYtwVkcdK/DkyhWL+7
	ynTXJCTIQJxCHqV7+ZQ+aP17e6wWDBWBFmTOdUPGOr7PPYOOJsBaHeO9x3nV+WTRLmTwKe0Ctd3
	nCPpm46CfZs
X-Received: by 2002:a05:6a00:6088:b0:84e:2722:5da4 with SMTP id d2e1a72fcca58-84fa882d15dmr1026338b3a.20.1786430211055;
        Mon, 10 Aug 2026 23:36:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa952841dsm154852b3a.30.2026.08.10.23.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:36:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 1/6] swagger-ui: upgrade 5.32.11 -> 5.32.12
Date: Tue, 11 Aug 2026 18:36:38 +1200
Message-ID: <20260811063643.152169-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 06:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128916

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also updated branch in the SRC_URI.

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.12

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{swagger-ui_5.32.11.bb => swagger-ui_5.32.12.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.11.bb => swagger-ui_5.32.12.bb} (85%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb
similarity index 85%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb
index 19000d6f35..bfeb75f6ca 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb
@@ -10,9 +10,9 @@ SECTION = "net"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "414a60c9a40408d37821297682b8a190a840a79b"
+SRCREV = "9b5acf38723108ac816dcb7303897e87f933ac4e"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 


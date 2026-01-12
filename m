Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C74D277EB
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 10:21:22 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30291.1768213273015117079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 02:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eZa0+8DF;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so3263169f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 02:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768213271; x=1768818071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uWHLQ45gqES+LZE1hLw+RqPKZ7RVPI16BAQ5b33vZoo=;
        b=eZa0+8DFBbfk4UCS3Hhx7/ezywDluuxSj6Jn8JPTaH1usPRDG1MMNVeeJXfATcroYB
         3B7giYftg2hsu9+LisRffOD+3k8pxarF4aAjJ2MXYV02ieZITz7fRPxFt36guc3P21rB
         5iI1hKRVLj02lsHF+OJXQAbB0AvV4BbfW8eTYRq4j9/xlE9UzyiRqE9AJsgeBkDJNbZ/
         F+ivqxINbAj+i94LAnqhHR4bslVJOw0KjHy7wuR/KbQywvwwV/aszfRAfVHnyXCXjPIx
         pDjdRVuCkA8O3BQtES5YI0t4QL/t9UwupJ8baBMYyQilh/k/lufxVmlW9w1XhrKRb1zT
         m8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213271; x=1768818071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWHLQ45gqES+LZE1hLw+RqPKZ7RVPI16BAQ5b33vZoo=;
        b=QZB/NovXndFPjZiDUPQAqy4O9oPLixTww2PntgbTCyEwao3+KjCx9bBigpFAzhI/DW
         Hg/aEY/AHLUrpQAn5Hp1yT5sE5zserB7UTvCJXYWFtf4sTx8fmUOuqfCcstwavC8XaBE
         KaEYU19twaI6k9myw324gs4d0u2OByT0IZk6FBvF11pgtCJ7fAMhOZ70wUDMQf3MI69x
         /7pZzKT05HQ+bxpX/MFeTl7n5IH6gPyzJigdjvDkuQdLIo4Y9slVXDGfN3N4ZWjTY8QK
         P5/I/npLytPPn5NqVoS9QcU/AwN3TSoWLG9giOWinbLkmrfahXx6AeKIyJjr2kxkU6Kd
         GQRg==
X-Gm-Message-State: AOJu0Yy+VJvQ92Ch7LZk5wFIX2cDJu9KMoORjacRxJGsTk87VKv8CDZ7
	iifr3ClkMtAB76eHOPmKvn6YTwlGc4cETd1CuNnHLRK7g13EiKILh/a3kQJg1w==
X-Gm-Gg: AY/fxX5fYOx0KNMLzUvzQSBE0xLGNe2hd3WSAD77vb8Mf2grlc6Fl5SwG3ZJ2yFDpKN
	IeYS9ZidkvRMiY5Y+C0lMF884ih/nhXUnragdVvoSRwZxJiNcDCOLhsDpcdTh9PJu/j2wxR1Gkc
	gFPI3UKh5vnZlwULWQvARtSO1yv0Sj+oViW5WWRbl6TZC0Iu7feg4YmltYOAKRYXArBKVDo/J9T
	LlW4p9UVdM6v5ggk82AnT4kq/CbsLfs6AZqGigDe9m64fAhKPQRPOGhcT58z8b3FYd8AHVpMqGk
	jqq+1Igmn2UZK4X6X7Z2/tuLLT3npdhmI8enxetBIOIxNhiGQzm2vXMYlCRIOXI7b3TEmLCUyrm
	qev2pNMJXDPzuFytvF5EzzoCaChQlmE9jE8zw3ysTBlE6gJ3qMQYJVzXtCECs1HWSGdtkvcb4nZ
	dsFrOTxvjX
X-Google-Smtp-Source: AGHT+IGwsbqhCZSg6AhwQJFO0Lvp1YDZi1jWdth9zLZNU8ERG3PSRsDIvAYzL3h3LPhG62uTDW2D+A==
X-Received: by 2002:a05:6000:2584:b0:42f:ba09:aa7c with SMTP id ffacd0b85a97d-432c3765636mr24060795f8f.54.1768213271045;
        Mon, 12 Jan 2026 02:21:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm38112342f8f.36.2026.01.12.02.21.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:21:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] influxdb: ignore CVE-2024-30896
Date: Mon, 12 Jan 2026 11:21:04 +0100
Message-ID: <20260112102106.453902-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 10:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123374

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

As mentioned in the comment[1], vulnerability is in
/api/v2/authorizations API which only exists in 2.x, 1.x is not affected.

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30896

[1] https://github.com/influxdata/influxdb/issues/24797#issuecomment-2514690740

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 5dd5644c4c..d8279492ac 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -70,3 +70,4 @@ RDEPENDS:${PN} = "bash"
 RDEPENDS:${PN}-dev = "bash"
 
 CVE_STATUS[CVE-2019-10329] = "cpe-incorrect: Version does not match and only the Jenkins plugin is affected."
+CVE_STATUS[CVE-2024-30896] = "not-applicable-config: vulnerability only exists in version 2.x"


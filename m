Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE4FD116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 14:48:30 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23375.1764600504415066183
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 06:48:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lW5e3Kq3;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: skandigraun@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59578e38613so3003866e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 06:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764600502; x=1765205302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5sl1CIoObHg9aEeD4OOJp/THKiSCH3G8y8dSLGOhkY=;
        b=lW5e3Kq34E70FM5PJnxNcoce9xILjvYkJIpi6xsgulM2X58FtHwjCyDn6+UZwFCIql
         cPWCJDc95Po+OUKBY3UcAvxhSWq7s4oEteILodbEgLSNa35QWGRgiZ5Xk6DU+J5GEcJe
         EZBRMkdtgr6Ba+ZTHVLmGVGH6dAQ5OXWbDa7qEJ5rUFIqldIrODsKxx/juZ3b+efBiMq
         W8oOkWQtLrKWJ7McgO/SuzjImFBq1D3X2noTs80dpJI2nxzh7GmLycp08KuzOXn99jTn
         mOMvLjUqCJGzRr1hAeHNolS7Nnv/wjSfK1sGOVneps7Lm8qb1Crv3Y8Caf+bhzI/A28/
         8ddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764600502; x=1765205302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5sl1CIoObHg9aEeD4OOJp/THKiSCH3G8y8dSLGOhkY=;
        b=t8Lndd1ZuUUDxY7IlteS5cEs5BRpCPXuTJRTLjOMr8g7ksvPSDLRHd70KRtV+UU5IG
         wkQPGN97iWu4v8Krq1EiApqP8DXcqgRMepeyioRnsHoUZPxE1a03nKW1veQ6lp4BDIc4
         paEKW/plfpGCtxfB4UgpqK1SXVbvqB5BP8p6juJnBxX2bV9W2zgNmA/zFXpXGjjJiL9B
         Ogk0BT+lkA/G2ucN+fanqu9v0JtLbfkrWJ1FYvkwGan4lei+RAWnhyqv/rOmvMvygOH6
         RbrPYXJiK9DnVwrm4wq/GLExwbwYfzv/9fX5DveIscRQMiKpBrKA3PHMiToGQ3bgkqNw
         pmJg==
X-Gm-Message-State: AOJu0Yw/RPCw6gcIQsfI+oTwSEdUJE0qeYQEES1u6jN7hJp2JI2qwutC
	niO/MfPv32gplw3bYO1dGS59AnvvjKiyzEKDpPN631D1V7K7ycN05yS2BxcifA==
X-Gm-Gg: ASbGnct3crQXuXJ3wf4qseCMPvyyaMNKSOWXf37s5Tq7gkbqyys6TsNO6vqm3NO2Yo8
	ic1yrGezLIZRTMOrGhMDPd2141q0lPQPolcOibeuSdqmVm++nBPXkfSZwe8Z+tPASHK82sp0vHe
	KA2w/WiK0J12njaQN79rrpxWcLc8uKjJ2VpWc/bZlsa+bWZEUBNGF/QPvfsN/7CsBRaZCiRFo8H
	5GwOsgd+Saglt5Zqhh2zdhm53FFt6ThZFW5V8joL3Q60zeF6qqykWJUMWlXU44uHX+vhzYk+mN2
	FdYKkM16yxS+CieJFEzRAgAgGWsDUs3dzXKu+oZHcx0Pb2TJFspLFwkebfj7acWV5K4+3NZGaYb
	JYj5Dt4rc5jF/PRIQ1aOtmd0yUb8kOtb7xeVEd6crerYy2KMxccXCwPpW1/0u+vKp+ckavXEqFG
	UZ1Y8ZamWT
X-Google-Smtp-Source: AGHT+IH/HhId/JO7fzkFFB0e1xaEe2FBa12+KWuli9BlOS5/DJpjDewUMgY1E7KrwVEmYpyBnN0xeg==
X-Received: by 2002:a05:6512:3c9a:b0:593:1220:81ad with SMTP id 2adb3069b0e04-596b505c9e6mr9525093e87.29.1764600502262;
        Mon, 01 Dec 2025 06:48:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b1082sm3718113e87.29.2025.12.01.06.48.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:48:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-12-01
Date: Mon,  1 Dec 2025 15:48:20 +0100
Message-ID: <20251201144820.2687367-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 14:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122214

List of all open CVEs (56, out of which new this week: 0):

 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
 - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
 - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
 - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
 - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
 - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
 - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
 - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
 - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - tigervnc: CVE-2023-6377: https://nvd.nist.gov/vuln/detail/CVE-2023-6377
 - tigervnc: CVE-2023-6478: https://nvd.nist.gov/vuln/detail/CVE-2023-6478
 - tigervnc: CVE-2025-26594: https://nvd.nist.gov/vuln/detail/CVE-2025-26594
 - tigervnc: CVE-2025-26595: https://nvd.nist.gov/vuln/detail/CVE-2025-26595
 - tigervnc: CVE-2025-26596: https://nvd.nist.gov/vuln/detail/CVE-2025-26596
 - tigervnc: CVE-2025-26597: https://nvd.nist.gov/vuln/detail/CVE-2025-26597
 - tigervnc: CVE-2025-26598: https://nvd.nist.gov/vuln/detail/CVE-2025-26598
 - tigervnc: CVE-2025-26599: https://nvd.nist.gov/vuln/detail/CVE-2025-26599
 - tigervnc: CVE-2025-26600: https://nvd.nist.gov/vuln/detail/CVE-2025-26600
 - tigervnc: CVE-2025-26601: https://nvd.nist.gov/vuln/detail/CVE-2025-26601
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
 - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
 - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
 - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
 - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
 - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
 - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
 - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
 - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
 - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
 - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
 - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
 - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
 - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
 - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
 - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
 - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258

====================

Removed this week (20): 

 - cockpit: CVE-2018-15538: https://nvd.nist.gov/vuln/detail/CVE-2018-15538
 - cockpit: CVE-2018-15539: https://nvd.nist.gov/vuln/detail/CVE-2018-15539
 - cockpit: CVE-2018-15540: https://nvd.nist.gov/vuln/detail/CVE-2018-15540
 - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
 - python3-django: CVE-2025-64458: https://nvd.nist.gov/vuln/detail/CVE-2025-64458
 - python3-django: CVE-2025-64459: https://nvd.nist.gov/vuln/detail/CVE-2025-64459
 - tigervnc: CVE-2014-8241: https://nvd.nist.gov/vuln/detail/CVE-2014-8241
 - xrdp: CVE-2022-23468: https://nvd.nist.gov/vuln/detail/CVE-2022-23468
 - xrdp: CVE-2022-23477: https://nvd.nist.gov/vuln/detail/CVE-2022-23477
 - xrdp: CVE-2022-23478: https://nvd.nist.gov/vuln/detail/CVE-2022-23478
 - xrdp: CVE-2022-23479: https://nvd.nist.gov/vuln/detail/CVE-2022-23479
 - xrdp: CVE-2022-23480: https://nvd.nist.gov/vuln/detail/CVE-2022-23480
 - xrdp: CVE-2022-23481: https://nvd.nist.gov/vuln/detail/CVE-2022-23481
 - xrdp: CVE-2022-23482: https://nvd.nist.gov/vuln/detail/CVE-2022-23482
 - xrdp: CVE-2022-23483: https://nvd.nist.gov/vuln/detail/CVE-2022-23483
 - xrdp: CVE-2022-23484: https://nvd.nist.gov/vuln/detail/CVE-2022-23484
 - xrdp: CVE-2022-23493: https://nvd.nist.gov/vuln/detail/CVE-2022-23493
 - xrdp: CVE-2023-40184: https://nvd.nist.gov/vuln/detail/CVE-2023-40184
 - xrdp: CVE-2023-42822: https://nvd.nist.gov/vuln/detail/CVE-2023-42822
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917


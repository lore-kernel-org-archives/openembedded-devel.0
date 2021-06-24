Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web12.1607.1624500088601033201
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 19:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dq0sxrfq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624500086; i=@fujitsu.com;
	bh=e4g+YuVl0AIirWRqGbB5yFiTUUco5CE+f9djndZLlaA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dq0sxrfqKeOuRlEezxFfdkiU37GzdcqhQ60TscM/OXUMCpSkxwZl/UIo88vK6IKLk
	 9NmBG4i4xVpeE3JNvLveK0lR68lQP6e0sVdBlPcYomQFIxE9g2UL2wHCNEJbSffktO
	 oJrZwfXq2aWof/s3QmzyvBrKMrNqdZ6e4G0pu4OHudISZbXztnEHWnQkpUfTvN1xEd
	 01PWOrQRnRG/2D7kRIgl3WdcmOCK56CNePdKm8002JzgFyFwhqZi4nDKHcbT3wfrGz
	 gR6ckG5N4T0T+CZ5PGnguaGgupbh+FjA2VWou8K/TO+t1JoUOKpPT5ARz3UZKckyyp
	 vCUkqk3PykmGw==
Received: from [100.112.198.210] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 41/01-64908-677E3D06; Thu, 24 Jun 2021 02:01:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqlv6/HK
  CQe9VXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePVws1MBd0cFdu/dLM1MK5m72Lk4hASmM0k
  ceTmEjYIZw+jRMempUAZTg42AV2Jc4/XgtkiAvoSS2fvYQaxhQWsJd5PvsoCYrMIqEpsbN/AC
  mLzCnhILL67BKxeQkBBYsrD98wQcUGJkzOfgNUzC0hIHHzxAijOAVSjKDF7ujxEeYXEjBnb2C
  Yw8sxC0jELSccCRqZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hpYWuobGBnqJVbpJeqmluuWpxSW
  6hnqJ5cV6xZW5yTkpenmpJZsYgWGUUnCsaQfjydcf9A4xSnIwKYnylrZfThDiS8pPqcxILM6I
  LyrNSS0+xCjDwaEkwSvxDCgnWJSanlqRlpkDDGmYtAQHj5IIr+UToDRvcUFibnFmOkTqFKOil
  Djv46dACQGQREZpHlwbLI4uMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmbQOZwpOZVwI3/R
  XQYiagxQq/L4IsLklESEk1MEU2pIYw7n/OwHazUFvAZ/+O14dTfs1q2b9k+oVbl6WfdLxP2Tr
  5B1vY40P7nvLuLv95bd8XnTB/vtLT8gfusZ0Ulv5zfU6+8nKR8s3lq+e48TxelbFOfYOY4Plz
  yyv2+fyJNF3OK12gmSMvaBv4btd7dXZ1YcYAZn6W7a+6Yj9ypJT94DfklJTaI2m7r+UMl9Gvj
  /s7PFXtVjffPiUvdD+Us+41xxWV1E8WWQsOP1BNzSw4EajuuUntEN8q+Y8dkyd+8eiYOf1Wbt
  YDzQf7Fe32r7RuZbTv2WNy+oug2avd0fc7iqY8LfbnVoxf1Hj52vfSUL41z1OnHNa99MLjU4P
  3nOpLn1c6M7zU5z+yO0GJpTgj0VCLuag4EQB4ON7OHgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-291.messagelabs.com!1624500085!97083!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14985 invoked from network); 24 Jun 2021 02:01:25 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-17.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 02:01:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O21PZW028426
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 03:01:25 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 03:01:23 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] satyr: upgrade 0.37 -> 0.38
Date: Thu, 24 Jun 2021 10:01:16 +0800
Message-ID: <1624500076-82566-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-support/satyr/{satyr_0.37.bb => satyr_0.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/satyr/{satyr_0.37.bb => satyr_0.38.bb} (94%)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.37.bb b/meta-oe/recipes-support/satyr/satyr_0.38.bb
similarity index 94%
rename from meta-oe/recipes-support/satyr/satyr_0.37.bb
rename to meta-oe/recipes-support/satyr/satyr_0.38.bb
index 4630eb0210..d01ea42bd2 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.37.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.38.bb
@@ -10,7 +10,7 @@ inherit autotools-brokensep python3native pkgconfig
 SRC_URI = "git://github.com/abrt/satyr.git \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
 "
-SRCREV = "4a7d0a31cdeee23bb13739f57926188a795bdf25"
+SRCREV = "ad0030f071b7ce7eb748eca3c31cb381038e2b21"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.25.1


Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web08.3841.1617859021660242472
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rUKTUDmx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617859019; i=@fujitsu.com;
	bh=orO2vShn91GBxF9fLhZOvOOXcEjiZi8B+6cjkZq+NtM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rUKTUDmxX4vaeN4jgfCjxMRv7oRT7NdVNa/rk0A/2Q31Z1R2VCjRHFQIWq0UaWLQv
	 whfMdlwjbfT7OXynxvU5n316GMd5Vjw/2WeqHchM41O1Jcqwd1KmQO0HxOWdtknun3
	 KCmdWJjHAuw2TIDq5jl0gnwBoU4fk7HqM92UH7FqBqDo2Kpweoc4CzyQkOjbGxjK8f
	 Mbpl+J9Pq3ejyqpXeWXnigl8VYwwIn0EqwHVd1M4+w0V/+8uD2+Fr6iCcLvuk/cgLz
	 ewJmz8n52/Yf/+jRDNdfAr9GhK6geelcUPL4LRjLXIk9AdXdlW/b0KJijnIygt2Zkj
	 y4lYpkPrnC7/Q==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 52/5F-23163-BC19E606; Thu, 08 Apr 2021 05:16:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MRqntqYl6
  CweNzNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bdRe+ZCn6xV7xoP8TawDibvYuRk0NIYCuT
  xMspql2MXED2cUaJT4fus4Ek2AR0JDpedLOA2CIC+hJLZ+9hBrGFBTwkLvw6ANbMIqAicblpN
  iOIzSvgJnF93T+wGgkBBYkpD98zQ8QFJU7OfAI2h1lAQuLgixdQNYoS23eeYYGwqyTOzv7CNI
  GRZxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNY1A7L0Eqt0k/RSS3WTU/NKihKBknq
  J5cV6xZW5yTkpenmpJZsYgWGUUsjGtYPx6esPeocYJTmYlER57Z7kJgjxJeWnVGYkFmfEF5Xm
  pBYfYpTh4FCS4L3QlpcgJFiUmp5akZaZAwxpmLQEB4+SCK8cMKyFeIsLEnOLM9MhUqcYwzner
  F2yiJnjLZhsu3cXSLaDyZkLDq5m5pgFJu+3HwKSD0CkEEtefl6qlDivdC/QOAGQcRmleXDLYD
  F7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwL8sEoCk8mXklcDe9AjqXCejckoO5IOeWJCK
  kpBqYtC6fS7gZcphjkdsJhixf3u703dMfT+Ffxr0uh2XzTYsLapd/Nc7fojOhwVzBJvXejPnf
  Um9aLnjVcceK5XnQxj3/c3wSQuxb8mZl2lh/OPjXc91k56c65mqs9j+ySrmiTzbluwSf2dV5p
  Kbihs+G83f4sxPKjz49+mbLfh7pZCO38t1h072+zvt49Vnng+o9kf2LPh5a/q28Y7+S3u3H+x
  rqHjoYVn5zf83BsfZtfKR96i1m431/DbZ5ikrubZx5kudUdV+dwDv7fm2uXyeubhBlWdxxPiN
  af/PZM2wSx6MOPZrx998iebOZM5RKV6xx32XN3sOa5vHORC6Oj+vKOc93Kjyaa/dHHnDIPJpe
  p8RSnJFoqMVcVJwIAMw9UE1UAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-245.messagelabs.com!1617859018!835060!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7115 invoked from network); 8 Apr 2021 05:16:58 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-17.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:16:58 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385GwHJ023226
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Apr 2021 06:16:58 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:16:56 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.25.4 -> 1.25.5
Date: Fri, 9 Apr 2021 01:16:49 +0800
Message-ID: <1617902209-5023-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.25.4.bb => nbdkit_1.25.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.25.4.bb => nbdkit_1.25.5.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.4.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.5.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.25.4.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.25.5.bb
index 37f6a8b76..a6070ccf8 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.25.4.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https \
 "
 
-SRCREV = "7b04baeb1858fa04f5f4e0d6f2d23bef706e80da"
+SRCREV = "c828c6d48ff6b69454cad98054a1920d03c4b4c7"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


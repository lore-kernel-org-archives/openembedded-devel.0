Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB01C6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 06:13:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.13396.1678428835717894831
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 22:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mzsA7rIR;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678428834; i=@fujitsu.com;
	bh=lEMKfhKu8w7k8MRj2Xozyoz3tl29dnYsNX+1NCT0R84=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mzsA7rIRxyNZ8BJ+eui67gMupEfQfbG4yymfEOGFNOoqOFWbTk1Hq26WED02j77+O
	 jm2b18GqaRFeyeL/ltW1pIOveQ1uwj8yTmTvC05ctEV+E9hjC028hjVdbro4r1lqmT
	 VbaxxlWzE/L7v+zD2Ii19vQKGUmwGlvaoIq8Y/R7rn5QFCT46b4N32ndwjX4GbN+Cf
	 IiKCVbUvC7THwSIlz1lmE/MZ8cXvjRfjR0sFf7DyrYdoNA0kHLN3xgbxKwPhKgm8dj
	 RGpC8TbBEyW17Eor9YBq+Ps640zaIFcszT1tww3elijLN4VS5f2AQovQE8PIezZ9om
	 UJHEwLIIOBpyQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8OxWXfhKa4
  Ug3M3xCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxPqxYxFmwSrfi49SljA+NWoS5GLg4hgQeM
  ErdOrmbvYuQEci4zSfxeEg9h72GUeLykDMRmE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  F5hAW+J/p3tTCA2i4CqxJFfh1lAbF4BR4k5R/eB9UoIKEhMefgerJdTwEmiZ+IpVohdjhJXT3
  5ngqgXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoWpxaVJZapGusl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KX
  l1qyiREYuCnFasI7GL/0/tU7xCjJwaQkyqucypUixJeUn1KZkVicEV9UmpNafIhRhoNDSYJ37
  wmgnGBRanpqRVpmDjCKYNISHDxKIrysO4DSvMUFibnFmekQqVOMuhzt27sOMAux5OXnpUqJ87
  IeByoSACnKKM2DGwGL6EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHklQC7hycwrgdv0Cug
  IJqAjdm3hADmiJBEhJdXAVLx5n8SSZbNWnN+dFfQ5qXpPgOOjKN/beyOev8j6XJASzyi7/5tX
  7h9BS+cn3XUbVsmpvvO+VvvjsN6PJxqt+eGu8XtyBD/6nln5qvrcG6lX72Lmb998/d/S3UH6E
  yaf8+JmrJdiyyxf/3Daeq2EUynv3j9lXOaoEmpiYBB8QD2owmrp7prXmR1y7fNf6jB1/znbYj
  QtIy2eY0WLt8AZa/uEqc+u/13/JLHEaxMrT2/rvd8ONWafN697Uxk6e4uT19pnLb83OcUJhOz
  6yPqGxcok0mrSfSfW+yfUo5huf6vadb35akpOwefLb7jWhIr2397R2xj+UrLDt9vyRMLyQuYF
  b95PXvrcbt7X1TIyKUosxRmJhlrMRcWJAJNU0jNjAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1678428833!628278!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19057 invoked from network); 10 Mar 2023 06:13:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 06:13:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 19BA27B
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:53 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 0D5EB73
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 06:13:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 03/11] stunnel: upgrade 5.67 -> 5.69
Date: Fri, 10 Mar 2023 14:13:30 +0800
Message-ID: <1678428812-7622-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678428812-7622-1-git-send-email-wangmy@fujitsu.com>
References: <1678428812-7622-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101475

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
==========
* New features
  - Improved logging performance with the "output" option.
  - Improved file read performance on the WIN32 platform.
  - DH and kDHEPSK ciphersuites removed from FIPS defaults.
  - Set the LimitNOFILE ulimit in stunnel.service to allow
    for up to 10,000 concurrent clients.
  - Added the new 'CAengine' service-level option
    to load a trusted CA certificate from an engine.
  - Added requesting client certificates in server
    mode with 'CApath' besides 'CAfile'.
  - Improved file read performance.
  - Improved logging performance.
* Bugfixes
  - Fixed the "CApath" option on the WIN32 platform by
    applying https://github.com/openssl/openssl/pull/20312.
  - Fixed stunnel.spec used for building rpm packages.
  - Fixed tests on some OSes and architectures by merging
    Debian 07-tests-errmsg.patch (thx to Peter Pentchev).
  - Fixed EWOULDBLOCK errors in protocol negotiation.
  - Fixed handling TLS errors in protocol negotiation.
  - Prevented following fatal TLS alerts with TCP resets.
  - Improved OpenSSL initialization on WIN32.
  - Improved testing suite stability.
* Security bugfixes
  - OpenSSL DLLs updated to version 3.0.8.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stunnel/{stunnel_5.67.bb => stunnel_5.69.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.67.bb => stunnel_5.69.bb} (87%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.67.bb b/meta-networking/recipes-support/stunnel/stunnel_5.69.bb
similarity index 87%
rename from meta-networking/recipes-support/stunnel/stunnel_5.67.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.69.bb
index db535e735..816152973 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.67.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.69.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-sta
 HOMEPAGE = "https://www.stunnel.org/"
 SECTION = "net"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=d8a2866ad5ebf3a2d2ce27279472875a"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=b4988f33f70b383b3011c4ede0a679ce"
 
 DEPENDS = "autoconf-archive libnsl2 openssl"
 
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "3086939ee6407516c59b0ba3fbf555338f9d52f459bcab6337c0f00e91ea8456"
+SRC_URI[sha256sum] = "1ff7d9f30884c75b98c8a0a4e1534fa79adcada2322635e6787337b4e38fdb81"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.34.1



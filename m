Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BCBC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:52:32 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web12.30717.1632747150969265254
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 05:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xi8cVZG6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632747149; i=@fujitsu.com;
	bh=U5S5302zcBZRUnmnG9GzTI71Y73sCa2jLA4h60izUSE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xi8cVZG6saEUsZ//u5nlXzoxssybZ9VI0eBbHDJPe1+gH/do29bxke+eWn0SYy+tD
	 NWgHW3JB54qFXIQwlsxWdtqLtE6XBD/MiCcxj7Y3Tik47xydjVELl7p9rczelb/Vbi
	 QSD/FacviyAbbHhG3pLLPlt+ITwQZDgz6jurk9hKNOwJIClFgRMfWbMsEUgbe9UWtY
	 krbHMivDmLi3/6H5llYKOFUbZH2JAgCXhDR8wCvShiRbgBrnGSUR+er7wRmy+Ok61x
	 dSe57jn3YPMn+fnEBMAKLEIPLX73PGldrs5HLZtTdLpJHhXl4BzUbiMPb5U9KZ3Mwt
	 Oib6XwtSK2Eeg==
Received: from [100.113.3.182] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 1E/6C-29868-C8EB1516;
 Mon, 27 Sep 2021 12:52:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRotuzLzD
  R4H+ThsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHwcytLwXPuii0dV5gbGI9ydTFycQgJzGaS
  WHfmBhuEc4JRYl/rbZYuRk4ONgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYe9i5OAQFvCQ6
  N8TCxJmEVCVuNf4mw3E5hVwkljftgKsVUJAQWLKw/fMEHFBiZMzn7BAjJGQOPjiBTNEjaLE7M
  vNLBB2hcSsWW1MExh5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBxdQwMDXUNDY11DXVNDvcQq3US
  91FLd5NS8kqJEoKReYnmxXnFlbnJOil5easkmRmB4pRQyGu9gPPj6g94hRkkOJiVR3pC1gYlC
  fEn5KZUZicUZ8UWlOanFhxhlODiUJHhn7AHKCRalpqdWpGXmAEMdJi3BwaMkwsuxFyjNW1yQm
  FucmQ6ROsWoKCXOawCSEABJZJTmwbXB4usSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHebJ
  ApPJl5JXDTXwEtZgJaXDspAGRxSSJCSqqBaU3N7363K+eE6teb398z8eSaCskWed5vydmvXhW
  ecyzek7N06iz97KMSc31qdXvCet0Dt16urhFe5SEcq/g2a6qKKsvpWSc2OynvKY48anSL406B
  QcB7DanWC9qf36qeul7G4XSvSS61vbtlveVj1dP9U76rZJg8CHJl2+r9r4C98/nhWV/v/UuO6
  zi7IvmdTvRdrkW8evw/1Wvq2x7ZSJ+smV+w9e7fb2s11az+llopFJxePNGU4wpLb+/O2SmZCw
  W85zvmGy47l/K5vVjY32u/pDe3RjzLEwPpowoer7Y0rJWK+rToP/+fZyKtR3lCfjeffhSYlfl
  wzUkTrTre3S51l0vEJnFw3VvOcUdPiaU4I9FQi7moOBEAst4OtCoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-232.messagelabs.com!1632747148!414471!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17664 invoked from network); 27 Sep 2021 12:52:28 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 12:52:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18RCqI1T007977
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 13:52:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 13:52:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] smcroute: upgrade 2.4.4 -> 2.5.3
Date: Mon, 27 Sep 2021 20:52:05 +0800
Message-ID: <1632747129-70797-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 12:52:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93142

v2.5.3 Changes
New tests to verify add/del of IPv4/IPv6 routes in kernel MFC
Fixes
Fix #166: build warning with gcc 10.2.1: "comparison is always true due to limited range of data type"
Fix build warning with --disable-mrdisc configure option
Fix #167: cannot remove routes added with smcroutectl add, only affects add/del at runtime with smcroutectl, not .conf reload
Fix #168: build problem on Debian/kFreeBSD, used wrong queue.h

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../smcroute/{smcroute_2.4.4.bb => smcroute_2.5.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/smcroute/{smcroute_2.4.4.bb => smcroute_2.5.3.bb} (89%)

diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.4.4.bb b/meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb
similarity index 89%
rename from meta-networking/recipes-support/smcroute/smcroute_2.4.4.bb
rename to meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb
index 0b63f79aca..f226f23af8 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.4.4.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.3.bb
@@ -5,7 +5,7 @@ SECTION = "net"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "a8e5847e5f7e411be424f9b52a6cdf9d2ed4aeb5"
+SRCREV = "d998043dc39cb763c9adec3eda3cc8b1d79f444c"
 SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



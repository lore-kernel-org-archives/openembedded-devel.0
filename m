Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7EAC47095
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.7006.1649901607859953046
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nAGjzR14;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649901606; i=@fujitsu.com;
	bh=kk/YjzMLdvC5I5zfUVXpx4jkW8UvCqhNRkluEzl1CqY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nAGjzR14+FN3OZ0A28+3se/PDjkZw5eRAUIyxKeXHfIG1SBzjYbnBieLKFoopCMck
	 tU+tVwn70VncVHTObMomgq/15IjhfTkBCXwh1naQv/CfJ+st4fT31JJE0H9y8QSvuo
	 XCeAnZ2qQejEhTyj9oMULbopkSIkwgc/RWgpW7f4heahovJjaafKHmf78IpKKuUvGc
	 c2U1kWAXcCrDa6G1DZrkCEe1q9obm0/0fLJL5o3Py9k8lpRXwFDhvAY8tWT7SK3AWS
	 0P0ubnw696g4RdKiZAJewDRSr6bLG0U5A7J2Cewb9b06kJl2FGZtfaCvB1P2J3mIfd
	 wuzTTJ1kwZfOA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8ORqKvaEJ5
  kMP2TvMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrG94y9jwUuOin/HOpgbGCdzdDFycggJPGGU
  eHxVGsK+wCQxf49VFyMXkH2AUaLjyg8WkASbgK7Eix+LwWwRAX2JpbP3MIPYwgI+Eod3TAOzW
  QRUJdp3bAar4RXwkJh9axobiC0hoCAx5eF7Zoi4oMTJmU/AapgFJCQOvngBFOcAqlGUmD1dHq
  K8QuL14UvMELaaxNVzm5gnMPLNQtI9C0n3AkamVYxWSUWZ6RkluYmZObqGBga6hoamuiZAlqF
  eYpVuol5qqW55anGJLpBbXqyXWlysV1yZm5yTopeXWrKJERh4KcUsqTsY+/p+6h1ilORgUhLl
  zTIMTxLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwZtSB5QTLEpNT61Iy8wBRgFMWoKDR0mEt6kGK
  M1bXJCYW5yZDpE6xagoJc67E6RPACSRUZoH1waLvEuMslLCvIwMDAxCPAWpRbmZJajyrxjFOR
  iVhHmng0zhycwrgZv+CmgxE9Dib6tCQRaXJCKkpBqY1PjVDyaLnV218adkVL/+np5XDfc8knZ
  Oe5eg7uZqNktilWdsZNS210rr9lUWtBduc7ac1bnr/IRHXnn3z+Z/Om6sfqVcN/zOursaxhyT
  vs5Ydeepm/6eym6+UHvV7Lyc2acuH7x3952DNp9xdGC6y8oDfD8i17e4pa45E+sh92Hm63Pv2
  ZiOL3NbZmxxj18hrNxgYsSjV3knJ1/etilnf21z0hKF2nltj0JrWEUY78/LTfycwp407/cT9e
  atW7ou569ha2nkj5/kvf/xh7eXu85l1l/7pfJo6kyHnu9L1h/YvnXRpLdepkx3LlfFOea7GNh
  /9OX4+inR+sA9gag9n/g8nz7M/nTuSvDGGf9nfVFiKc5INNRiLipOBABgzyxINwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1649901605!20860!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14115 invoked from network); 14 Apr 2022 02:00:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 02:00:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 058BE100181
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:00:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DE75910018E
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:00:04 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 02:59:58 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pylint: upgrade 2.13.2 -> 2.13.5
Date: Thu, 14 Apr 2022 09:59:19 +0800
Message-ID: <1649901559-13954-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96631

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pylint_2.13.2.bb => python3-pylint_2.13.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_2.13.2.bb => python3-pylint_2.13.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.13.2.bb b/meta-python/recipes-devtools/python/python3-pylint_2.13.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pylint_2.13.2.bb
rename to meta-python/recipes-devtools/python/python3-pylint_2.13.5.bb
index 9c699f8f2f..f64d976b46 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.13.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI[sha256sum] = "0c6dd0e53e6e17f2d0d62660905f3868611e734e9d9b310dc651a4b9f3dc70da"
+SRC_URI[sha256sum] = "dab221658368c7a05242e673c275c488670144123f4bd262b2777249c1c0de9b"
 
 inherit pypi setuptools3
 
-- 
2.25.1



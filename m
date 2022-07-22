Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD4CC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 02:11:13 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.3507.1658455871495671304
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 19:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L+PGOFa/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658455869; i=@fujitsu.com;
	bh=CkWWUHOlgALghtw1uUrUOfSW0zGQtCeAUNxp9YSTvuw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=L+PGOFa/WgvjJptJCzvZqWavGQoRM7jH19ny1bc38Wdzlqr48BE+/mzOyvNti0xBN
	 xAeWma3iJ+0ZMLL44hGQHslbXwTLq6nJp64is8W50HbV3xNINOD9T0n+OjMauI/V4o
	 2z2OjDRH25Ube6L8xuXBO/y91odO6LiTeFRPDyF+CIygqZmIU+qzNoE5Rg5dBZMkY4
	 RJMv4BJ8rdUy9TrOx/S+hqLOBtmc7dBDEMOI15STkgujZgFuCTewaM/P8hhCL6m2u/
	 OujPzcDKMZ5qP6VRnVukceqAryTnFt0rrNRdHGEyZtvykf3BJTvm4tRqOhOQ+PYFQJ
	 0UjrmUYIJJ+Hw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpGvLfiv
  J4OYpNouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP0+sPsBUe4KrpvTmNsYLzC2cXIySEk8JBR
  4t2n8i5GLiD7CpPEkc9LWCCcPYwSWy6vYgGpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAV2LCxN9gNSwCqhKnPy9nA7F5BZwkDtz7wghiSwgoSEx5+B6sl1PAWeLOj6NsEFc4Sc
  ybsJYRol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkarpKLM9IyS3MTMHF1DAwNdQ0NTXSBpaqKXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYxCnFDLN2MM7q+6l3iFGSg0lJlHffpJtJQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR4T7DdShISLEpNT61Iy8wBRhRMWoKDR0mE1+ILUCtvcUFibnFmOkTqFKMux8yvbQeYhV
  jy8vNSpcR5lUBmCIAUZZTmwY2ARfclRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8bSxAU3g
  y80rgNr0COoIJ6Ahz8xsgR5QkIqSkGphMJcT2vpv/V3b74VstL8XLnU6seqBrzrSPbxK3zf5z
  vAmeW94uyeMWjIrg/OF90Jyl6EJQUXpv4a0jKmLRp/auafDpsX+X2xC3L/Tjw/0icWaXbmQZV
  0pEG7PvE7eSdPisdn3/2Yvr135+VuXqnHf++L4IpsRjNyOOJwf61lyo1XvD6humw3h6gYnEj1
  XxGwpUP3Pn6z3xfzNDgLGxUWgf/6t/WbzPqw7/P3Kl+6q41DuFgt3l4TsV1i4z2/aOberPWXv
  c3Zz/Pb7ZNT9i68uYpppu98mP29Rlandq31qYyCCbJWj6NkDKX+8Bu6/koRmS50/zSVedYo7j
  0Ba1SBQ9uNHsutEEFrekz0/vmiqxFGckGmoxFxUnAgDNJZ4aaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1658455868!839373!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23067 invoked from network); 22 Jul 2022 02:11:09 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 02:11:09 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B62161B5
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:11:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AA09E1AE
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:11:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 03:11:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 3.5.0 -> 4.0.0
Date: Fri, 22 Jul 2022 10:10:50 +0800
Message-ID: <1658455850-26888-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658455850-26888-1-git-send-email-wangmy@fujitsu.com>
References: <1658455850-26888-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 02:11:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97942

Changelog:
=========
* Fix remaining logic to support Python 3.6/7
* Drop python3.6/3.7 support in testing runtime
* Add Python3 zed unit tests
* Update master for stable/yoga

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-stevedore_3.5.0.bb => python3-stevedore_4.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_3.5.0.bb => python3-stevedore_4.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_4.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_4.0.0.bb
index 8d345e66e5..46c6d831aa 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_4.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "f40253887d8712eaa2bb0ea3830374416736dc8ec0e22f5a65092c1174c44335"
+SRC_URI[sha256sum] = "f82cc99a1ff552310d19c379827c2c64dd9f85a38bcd5559db2470161867b786"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.25.1



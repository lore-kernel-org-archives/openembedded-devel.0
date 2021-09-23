Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.586.1632375099728136471
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 22:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JDB5UbQn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632375097; i=@fujitsu.com;
	bh=RlqgyedQHGseGPpci6Qm3ur2aSULHSMmnWUcvvjq6CY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JDB5UbQnPR1DCbFkS0hYCccHUb2BG3wkrDLU2z84URtzEVg1KFAiidZUA1t0TF2d2
	 WYwsji7Aj2s8mWyIQ/MonNiYTz7PKeEUUGW59uFM3FrF5MrH5wy4ebQmTvxhtXkzSI
	 U4OQnY3fQ3aEg7MmISZLhzBIjH8lYHwyl0tcwJMk3akBvFZlol+aGWpPMS/anE1fJ7
	 eWbn/GKyNEviplFmXFp6UQQfkMX8U3d7/BxVS9kbhF/3wlb61+xA6hERVhGtNF0mM7
	 4QV65MdCQxYjzR8hXpioiQBtW4RfjysF2ZA0uShrVj0OBlw5hZ1TqmQLN/GJSFK23j
	 sWhUdbNeEUKuA==
Received: from [100.112.195.149] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id B2/12-02979-9311C416; Thu, 23 Sep 2021 05:31:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqmsp6JN
  oMHeHpMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFw0QHGgoMcFf8e/2JuYHzK3sXIxSEkMJtJ
  Yte8vYwQzh5GiY7mvUxdjJwcbAK6Eucer2UHsUUE9CWWzt7DDGILCzhLdP84CVbDIqAqsXPTQ
  bA4r4CHxMFTi8FsCQEFiSkP30PFBSVOznzCAmIzC0hIHHzxAijOAVSjKDF7ujxEeYXE68OXmC
  cw8sxC0jELSccCRqZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hpZAbGKil1ilm6iXWqpbnlpcomu
  ol1herFdcmZuck6KXl1qyiREYRikFBybsYNz/+oPeIUZJDiYlUd50AZ9EIb6k/JTKjMTijPii
  0pzU4kOMMhwcShK8Z/iBcoJFqempFWmZOcCQhklLcPAoifAqcAOleYsLEnOLM9MhUqcYFaXEe
  U1BZgqAJDJK8+DaYHF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7x6Q7TyZeSVw018BLW
  YCWsy/0gNkcUkiQkqqgUm2Jce54cnpSwzfl/1fYl12N1Rn/rOEt8o6Z+xVJgVcmnXlgVvD7Jw
  jnfuu2zwJNczfHHpqb7ZkodXuh4svSvov73NhbtavOCT8U/DjRBE79bvP6xyb9y3b5V7tdKxG
  4vrRFinvm2ekn+ncS7eXPPSU99zb19u/nN7r4LFBaeqRS+L7Dn4oeT7751alpyIxPl9MeJR+c
  Wu+/q8jbndD5ma515KHF4Qb/9wxC3ha+fZkcsuNquA9hrwbGyLCdvRelPpQ+e31R2/X5DrX+l
  01RY567bwPJGyMPu6WMVsZ19oT9Ni22XFTRn96COPUazfWzHyn1rQoO4CP/3T9x7gLLYE87bX
  GPlHvLWYlPZn3rEWJpTgj0VCLuag4EQC9eeufHgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-265.messagelabs.com!1632375097!48256!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10359 invoked from network); 23 Sep 2021 05:31:37 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-22.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Sep 2021 05:31:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18N5VbUx003122
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 06:31:37 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 23 Sep 2021 06:31:35 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] span-lite: upgrade 0.10.0 -> 0.10.1
Date: Thu, 23 Sep 2021 22:31:29 +0800
Message-ID: <1632407489-15626-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Release 0.10.1 fixes https://github.com/martinmoene/span-lite/issues/71.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../span-lite/{span-lite_0.10.0.bb => span-lite_0.10.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/span-lite/{span-lite_0.10.0.bb => span-lite_0.10.1.bb} (86%)

diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.10.0.bb b/meta-oe/recipes-support/span-lite/span-lite_0.10.1.bb
similarity index 86%
rename from meta-oe/recipes-support/span-lite/span-lite_0.10.0.bb
rename to meta-oe/recipes-support/span-lite/span-lite_0.10.1.bb
index 4cf0dee112..15ba099826 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_0.10.0.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.10.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI += "git://github.com/martinmoene/span-lite"
-SRCREV = "2987dd8d3b8fe7c861e3c3f879234cc1c412f03f"
+SRCREV = "da49b231a25600b4431e00b564a6a20be95c1108"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


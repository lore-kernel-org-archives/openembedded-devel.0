Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web11.2184.1617244110856142694
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xmS4sau2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617244109; i=@fujitsu.com;
	bh=cznytIj4CuBt3Dj2dT5jH+b1VYXYlJVIpW6jg+GyltM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xmS4sau2zIjwMjDgM6+e1FK3RVuMLnVeQzhHuyvMLqY30VWBgwGdgBBanQdadtPEc
	 sbppEqfOueiFhm++XsdOIHKfj8y9IrgXiTBk3zcu35TrqUwwv5/n0klPzeqSfpGxO1
	 H2bz1LcsxRxxY5XnioQyBRjLAIqvlOdbKRpCIfps4yP7cY+KFrhHlfWw/mois1VbmY
	 +BqdNcYRkpsj+gFbicpYLj1S7xzbHRGjbNKZkxB8ynlIxFvLCMwklZZdWRNElr0mIZ
	 vCF90hAYhCz2HPZUqocnRR+x1IgZGufDR/TBB2qcOXq0ERwIwogqjibai3L3gvNVr5
	 W9n48i4+6b99w==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id E6/E2-41911-CCF25606; Thu, 01 Apr 2021 02:28:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqntGPzX
  BYOJkHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP17+nMBZvYK7rOCjYw3mbrYuTiEBLYyiRx
  q/UfM4RznFFi0+q/rF2MnBxsAjoSHS+6WUBsEQF9iaWz9zCD2MICVhJr7+1iB7FZBFQk9m78C
  2bzCrhL/Gj5zQZiSwgoSEx5+J4ZIi4ocXLmE7A5zAISEgdfvGCGqFGU2L7zDAuEXSVxdvYXpg
  mMPLOQtMxC0rKAkWkVo0VSUWZ6RkluYmaOrqGBga6hobGuka6poV5ilW6iXmqpbnJqXklRIlB
  SL7G8WK+4Mjc5J0UvL7VkEyMwjFIKmYx3MF57/UHvEKMkB5OSKO+UaSkJQnxJ+SmVGYnFGfFF
  pTmpxYcYZTg4lCR4XYCBKSRYlJqeWpGWmQMMaZi0BAePkgivjQZQmre4IDG3ODMdInWKUVFKn
  JdLDyghAJLIKM2Da4PF0SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwyIFN4MvNK4Ka/Al
  rMBLT4yqNEkMUliQgpqQamBcd+PHA1/eW0otKCq97UdNbHr6esefTXf2062PSh0lBhps0vtpZ
  T3MpVeb9uvbbJ7PXY2Bz1d9Y3R/HSljLhx9P2yli38L+Y0nD5ae6KE8vPseseuzpbelKlj5jX
  MdN1U5UlK+OkbPZaro4WnVbZHW1a2ZTAvlPYpcaZIePOoTVZ0yTXH30wa+HMXIV+/52FV3xOT
  +bIu8kv9C7ra/BiUWtbgeW/T2QqvL19cR3zvJ0OfX+3G5wSz/0lnubdb20sMnsvkxbTv5yyO5
  uXruuYLuOq/cSb44TNdQu/uY69onOTlkYWtP/9eWpBRVc2+8vvZ0U3hjoblZ3rLvv7c5Hi/NX
  3FpobfHkwmW2h1dtXSizFGYmGWsxFxYkAfwA10h4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-31.tower-228.messagelabs.com!1617244108!437272!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16177 invoked from network); 1 Apr 2021 02:28:28 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-31.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 02:28:28 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1312SR8T026587
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 03:28:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 03:28:26 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fbgrab: upgrade 1.4 -> 1.5
Date: Thu, 1 Apr 2021 10:28:20 +0800
Message-ID: <1617244100-91881-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-graphics/fbgrab/{fbgrab_1.4.bb => fbgrab_1.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/fbgrab/{fbgrab_1.4.bb => fbgrab_1.5.bb} (89%)

diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.4.bb b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
similarity index 89%
rename from meta-oe/recipes-graphics/fbgrab/fbgrab_1.4.bb
rename to meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
index a1294b98a..419881d5c 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.4.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 DEPENDS = "libpng zlib"
 SRC_URI = "git://github.com/GunnarMonell/fbgrab.git;protocol=https"
 
-SRCREV = "74373aafc0b496e67642562d86eac6b858a31f24"
+SRCREV = "f43ce6d5ce48fb01360eaa7c4a92c2573a1d02f8"
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
-- 
2.25.1


Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02A2C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 07:24:22 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.8740.1642663461846260206
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 23:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YVEUY5U+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642663460; i=@fujitsu.com;
	bh=A2GLTDTMv1iDUHKS9wKleQZkeZJ42TIRsaZJ9iDUqRo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YVEUY5U+uM33DsvghF+vp/hbmtV63vwmmJgMoPhedXtmV2coYfks6BF/ZNC9G/T6E
	 is8AWmgr8cLhIffG+74TlAtz0SwW+8XepdhwYIZjJRs9R4SjYPHHq865GPb9h558cG
	 qtiAZxCYrOhJSInbBGEMb10tzQRC2P2ld1SoFpedgGYkAZ5hc3JtAPOyao8FSTUK+6
	 kqQ59veSNAd35d6statHDHOjFaM4kelFYn7iwyczieGqX2H/aC/cDBsieo/1uCU5DT
	 1kLDjDlHVYk9gwlsRCi4Wcxrl5g47nJChvvFAVxCm4tkMMeTNDogGM3HGeko0cYN3z
	 VD62hF6hOgWIw==
Received: from [100.115.1.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id B6/3B-14524-32E09E16;
 Thu, 20 Jan 2022 07:24:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRVeJ72W
  iwaybZhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b0R+eYCmZzVrxbbNHAuI2ji5GTQ0hgJpPE
  qhemXYxcQPZJRokdxxcwgSTYBNQlHt98zQhiiwjoSyydvYcZxGYWUJXovriGHcQWFoiQ2LN6M
  Vg9C1D87I2dYPW8Au4SvX2rWEFsCQEFiSkP34P1cgp4SLw6uoQZYrG7xI9TW6DqBSVOznzCAj
  FfQuLgixfMEL1KEidWfGSCsCskXh++xDyBkX8WkpZZSFoWMDKtYrRKKspMzyjJTczM0TU0MNA
  1NDTVNdQ1MjTXS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMiUYsabOxhb
  +37qHWKU5GBSEuW9yPYyUYgvKT+lMiOxOCO+qDQntfgQowwHh5IEbwkPUE6wKDU9tSItMwcYH
  TBpCQ4eJRHeFyBp3uKCxNzizHSI1ClGRSlxXn5eoIQASCKjNA+uDRaRlxhlpYR5GRkYGIR4Cl
  KLcjNLUOVfMYpzMCoJ87qATOHJzCuBm/4KaDET0OL+Z89AFpckIqSkGpg472XpGPXNeVjC+OX
  guzcNv3dtmeL34bv6l99+NVzbmdVfOzj9fKTk1nWLNeHJRfcJf7YwlS2+u3zi7onNfD/0z0bd
  OymUVd+/Ik6VR9UkdMnczSxhrDvr0pvmJdQVyKa9kQzbejLfo9ji/4E5lXUv+Bb9/rY6vETv1
  KYPjxTuZ9aHnn9W81zafRVflUudVW+4V5/t7TKN240hr86vvJj1cp+jkX+ZxoGtTzTm+J/4/N
  DtbZHk8UPOH4Vddrl2pGxlfjG9YN1DM6cbTqunClqfOhp8U0te95be1X36DH+z1z/691xoik8
  T+9WNK4+dE5Nn7pm+iZWnbCP3xz1H1Bm+Ce47HH1ss66X0+tVAc1mSizFGYmGWsxFxYkAv5d4
  sEMDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1642663458!57176!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25861 invoked from network); 20 Jan 2022 07:24:18 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Jan 2022 07:24:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20K7ODbF014069
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:24:18 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 20 Jan 2022 07:24:13 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 4/5] [oe] [meta-python] [PATCH] python3-engineio: upgrade
 4.3.0 -> 4.3.1
Date: Thu, 20 Jan 2022 15:22:23 +0800
Message-ID: <1642663344-16829-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642663344-16829-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1642663344-16829-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jan 2022 07:24:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94953

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
Fix support for Sanic v21.9.0 and up
Include example code in flake8 pass
Remove unused __version__ constant #262

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-engineio_4.3.0.bb => python3-engineio_4.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.3.0.bb => python3-engineio_4.3.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.3.0.bb b/meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-engineio_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb
index 95edb860ac..a16306effb 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "fed35eeacfa21f53f1fc05ef0cadd65a50780364da3a2be7650eb92f928fdb11"
+SRC_URI[sha256sum] = "6e1d26977ffefe3b7da1b5df7a8750aedc7686da8201cd90daf36693db122489"
-- 
2.25.1



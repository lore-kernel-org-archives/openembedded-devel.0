Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F72C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 05:25:09 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web08.7644.1635312307535873541
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 22:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RXbIcnUe;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635312305; i=@fujitsu.com;
	bh=RSVmCkl85iwUNHrEMmX+bdDm9ArE3tYdsx7WSNvM6RQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RXbIcnUeRPOQIC/66TS2VP8U3RShpyjvqy9JLAZ/o37CXsbFvzUgjutm5xPe9kWQq
	 6+d4aoNCN4TXLKqFaRPLy0Lld2RxrlJwwhMtbC1uAlGSpIzsRyh6MFyHRoc/4OAPF9
	 t7PcOE75xWj5+dhktv7NtSK1uqBeH+wiIkAZkPzKq5iB8lS/snKIqD0oXUs3CLaHvo
	 Vz8QkdMTaGP97dCZQ0IY3zMciz++4sVADtC509I5ynhqfSAt9HKdrk/04CLKsGvet1
	 WXHdYpBZnX0HUwIodyqi+E4KPnn9igNnMt5wqDqgTPTMNi5jjYYG69NCmLDe1Sx4mG
	 bOXGoXct660xA==
Received: from [100.112.192.69] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 90/F3-17143-0B2E8716;
 Wed, 27 Oct 2021 05:25:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0d3wqCL
  R4Ms2ZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePEb/mCf5wV3f0fmBoYmzm7GLk4hARmM0n0
  rHzNAuGcYJRYM+EFaxcjJwebgI5Ex4tuFhBbREBfYunsPcwgtrBAkERnxxd2EJtFQFXi3f5OM
  JtXwEPiTOcVsHoJAQWJKQ/fM0PEBSVOznwCFmcWkJA4+OIFM0SNosT2nWeg6iskXh++xDyBkW
  cWkpZZSFoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTSNbQEYhMTvcQq3US91FLd8tTiEl1DvcT
  yYr3iytzknBS9vNSSTYzAMEopODBhB+P+1x/0DjFKcjApifL6bqtIFOJLyk+pzEgszogvKs1J
  LT7EKMPBoSTBqwAMTCHBotT01Iq0zBxgSMOkJTh4lER4DR4ApXmLCxJzizPTIVKnGBWlxHnv3
  QRKCIAkMkrz4NpgcXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvP5DxPJl5JXDTXwEtZg
  JazKwEtrgkESEl1cB0Ybes4VFBm/7oybPifn4Oz3HpynYONr4wgdkmfWku2zH3q1d/h15Z7rZ
  6hYDggSMW3u/ubj3U0jC/x0/kSCsjy4X1XHnScz7vuCt/ZtfzJcLMLT7/9jM823ey9iC78haD
  guWZX42snbeFHOad+l+1QzPZxr2DL6iWW4dN2vW2UKao79NqnuvFUgyCPec2SbUxJLGnyx2vc
  mpS3ve7SeW/w6zzYm6Zs28Vhq80W6D1u9npQXBH4qovc3sefxeqaRd4lFJza079imc/Dofsft
  Pe+aTwnSLzAUnTB1ZCt8zu5xed1FV7ckZo3lGzDYusT7zcH/5LtEJ6s8N9Pe76vX+MbjXefrT
  mpZaWnkxX+AslluKMREMt5qLiRACVmfKwHgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-271.messagelabs.com!1635312303!466193!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16042 invoked from network); 27 Oct 2021 05:25:04 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-13.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Oct 2021 05:25:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19R5P3pi032494
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:25:03 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 06:25:02 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-robotframework: upgrade 4.1.1 ->
 4.1.2
Date: Thu, 28 Oct 2021 01:24:58 +0800
Message-ID: <1635355498-112258-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 05:25:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93619

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...robotframework_4.1.1.bb => python3-robotframework_4.1.2.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.1.1.bb => python3-robotframework_4.1.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_4.1.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.1.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-robotframework_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_4.1.2.bb
index d715f3513..0c3de5da7 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_4.1.2.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "663f84c177b2fa9b3b782939e31637a057a33f3a4b29067812f1259b7f4bad35"
+SRC_URI[sha256sum] = "7ea2454b847cfcb211e2906743c5c4a868ab096ab4ce1547ab102d91fb224443"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
@@ -26,4 +26,5 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-profile \
 "
-- 
2.25.1



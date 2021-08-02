Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.15518.1627875581329454520
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 20:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y+oEHEFx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627875579; i=@fujitsu.com;
	bh=QimpTWpgTc9ybuYuGbJI762yVy4FLQ+5vBH26t6FEAI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=y+oEHEFxAXju3AWp81jeAwEckyH9pK4mb/PVn9dJNrhvTDJ2i7GqCawXqgc0jLvwC
	 GQ5u74M+EsVuqHH5D7KzhaBlcjwrQoAGdq/WFZOONgbWyGHEz49H70p+dQSwLwGinm
	 vMftx15YamVvmV2AeevO8g8UytAgmmxB0jKr8dv6fPO9MaPigb2HHDqMgjUEyEb1qy
	 iBwdGtpGuXeh1gA+Ozu/qBSgC72Q/3NP1yb6ZI+Yr6hPgj2idgiq8XxOPMxn4KmrSV
	 32sXZSdxknLaIMaBkjBAUgvtaTXrTBom4trkIfcHQfo+ZkSIPDLczE2+dCN3Ja6STp
	 qNUrQSN9q75yg==
Received: from [100.113.7.195] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 3A/4C-29101-BF867016; Mon, 02 Aug 2021 03:39:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYovsrgz3
  RoGuyicXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtG0xbxgEm/F9IO3GBsYz3J3MXJxCAnMYpKY
  f7KVDcI5zihx68lM1i5GTg42AR2JjhfdLCC2iIC+xNLZe5hBbGEBV4m+zQfYQGwWARWJjkdr2
  bsYOTh4BdwljtxwAAlLCChITHn4HqycV0BQ4uTMJ2BjmAUkJA6+eMEMUaMosX3nGRYIu0Li9e
  FLzBMYeWYhaZmFpGUBI9MqRsukosz0jJLcxMwcXUMDA11DQ2Ndc10jUyO9xCrdJL3UUt3k1Ly
  SokSgrF5iebFecWVuck6KXl5qySZGYBilFLL/2cF4/fUHvUOMkhxMSqK8IW0siUJ8SfkplRmJ
  xRnxRaU5qcWHGGU4OJQkeM3T2ROFBItS01Mr0jJzgCENk5bg4FES4Z2ZBpTmLS5IzC3OTIdIn
  WJUlBLnnQrSJwCSyCjNg2uDxdElRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK880HG82Tmlc
  BNfwW0mAlo8dQMVpDFJYkIKakGpu4zB6tfH3NY8i5KSX7HCya+7QZi/5VWLdbOnfS+nL/7SvH
  +S8mLH1g69B38s2TXv6ch8ZzSxmVBJnoWU1z1FeXYnt9jdF+1KtCjNu9w7irevWyrNhXOtZz/
  6Mhik0UCLz/XWT/4emqJ2w8V6UhOg+t6oVPuRl4JN721WvP25R966385Xtm/Wi0wU1ntCuuFd
  ZOWzZ5w29XdanXOLK/8n5q2k3v2+xwNitlR/8a1zipG0OKb6OLTk39w/hFIYfONrOhdwxYy3X
  NbX1rs7zlsOouFr6pLPU6aqqnflnZl64+UeLenajan1A1qEk7/MtEJMe9llbyfcWL2uZNq/6p
  ks/UuPbv+zy+H46XedRu+EiWW4oxEQy3mouJEACuMIqMeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-245.messagelabs.com!1627875578!291108!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27399 invoked from network); 2 Aug 2021 03:39:38 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-16.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Aug 2021 03:39:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1723dbbF030163
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 04:39:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 2 Aug 2021 04:39:35 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-smbus: upgrade 4.2 -> 4.3
Date: Mon, 2 Aug 2021 11:39:29 +0800
Message-ID: <1627875569-34385-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

4.3 (2021-07-22)
  decode-dimms: Attempt to decode LPDDR3 modules
  eeprom, eepromer: Removed the tools in favor of eeprog
  i2cdetect: Sort the bus list by number
  i2cdump: Add range support to I2C block mode
           Deprecate SMBus block mode
  i2cget: Add support for I2C block read
          Add support for SMBus block read
  i2ctransfer: Reverted check for returned length from driver

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-smbus_4.2.bb => python3-smbus_4.3.bb}     | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-smbus_4.2.bb => python3-smbus_4.3.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.2.bb b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-smbus_4.2.bb
rename to meta-python/recipes-devtools/python/python3-smbus_4.3.bb
index 862a547c00..e2fd20fc00 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
@@ -1,11 +1,9 @@
 SUMMARY = "Set of i2c tools for linux - Python module"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=18;md5=46e424fb045901ab25e0f92c28c80055"
-PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz "
-SRC_URI[md5sum] = "d6861c89521f2a2773e19edadb2befee"
-SRC_URI[sha256sum] = "7de18ed890e111fa54ab7ea896804d5faa4d1f0462a258aad9fbb7a8cc6b60cc"
+SRC_URI[sha256sum] = "eec464e42301d93586cbeca3845ed61bff40f560670e5b35baec57301d438148"
 
 DEPENDS += "i2c-tools"
 
-- 
2.25.1


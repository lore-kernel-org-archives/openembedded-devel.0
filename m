Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web11.15377.1627875010171672769
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 20:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y4cLyZeB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627875007; i=@fujitsu.com;
	bh=U09ZkOG0zqxHsb4GajGE6qSpRR8yWNPiS2xwoczfCLk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=y4cLyZeBANVSfM0AQPRGfGg0+1SBOC3q20kX1eKRXzWWUZtxzcprgz4TK4ezBEUqC
	 2O2Z5Ugo0qLibd20OM2gwwVaFvlJ60uzVLaX0V7/+RatdmGlA37CQETNlohbFThYKC
	 KU5rbswjlbWu/SmzbiNjYYdLvGgAs67MDHwsvPJKGhPVGJH38bZI2yw8oRH/jzj7zK
	 V6i9FZqo1c7JO5KQ23v0XnN+/v6QhlQrDs7tDXPnhZuNxxOrPXpGc7MZrQzc1Ap7HU
	 IQAASuI4b+mR0c3IjS5tyFOcOECKqZ4nMgSRgIojnxPHkuZtmhfT4Q0/8Dzolbmo6/
	 epScEBD4UFqwg==
Received: from [100.113.7.195] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 5E/01-29721-FB667016; Mon, 02 Aug 2021 03:30:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYqrsvjT3
  R4O0Dc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPHnv1MBYu4K74tWcbYwLiYq4uRk0NIYBaT
  xKSVwhD2bkaJuzNTQWw2AV2Jc4/XsoPYIgL6Ektn72EGsYUFPCUev1jDAmKzCKhIHN32mxHE5
  hXwkLi/YC2YLSGgIDHl4XtmiLigxMmZT8DqmQUkJA6+eAEU5wCqUZSYPV0eorxC4vXhS8wTGH
  lmIemYhaRjASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0NjXTMgSy+xSjdJL7VUNzk1r6QoESipl1h
  erFdcmZuck6KXl1qyiREYQimFbFw7GJ++/qB3iFGSg0lJlDekjSVRiC8pP6UyI7E4I76oNCe1
  +BCjDAeHkgSvbyp7opBgUWp6akVaZg4wnGHSEhw8SiIQad7igsTc4sx0iNQpRkUpcd6TKUAJA
  ZBERmkeXBsshi4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuYtABnPk5lXAjf9FdBiJqDFUz
  NYQRaXJCKkpBqYbkeWPRa56q3RPW/1Oq7SZO1/Z6alX4h1OX1MZe6B73fCDk0NbX7uctyCRU4
  s6/YNOZVH2rrR1x5NVU4SC6ycNSV7ZZmZqOb/eaKNGV+Lb7uddHTdEfdBNN2v0GWxTKHFRv2j
  ihob2U1WnLkRuF3mY7ps34lJvTO6DhhJ1Ja+38F38ny1ZHDUd/nV80XXimRK/n8dZ/D45OzFv
  mVKH4I7V2x67u5+8dYFv1MK7hOsHJawqptcebP0RKLxPqdL8xY6iaZYBlk0L2PYdFkguEoypT
  vyn3id0581zG3+iYUeqdfzL61n9T4T+uxplpzfg5fWr0zf15t03Sx+f4C9+lfqy+RJ849KzuD
  naa+408KixFKckWioxVxUnAgAYpQZChwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-238.messagelabs.com!1627875006!234652!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3532 invoked from network); 2 Aug 2021 03:30:06 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Aug 2021 03:30:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1723U6WS028323
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 04:30:06 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 2 Aug 2021 04:30:04 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cbor2: upgrade 5.4.0 -> 5.4.1
Date: Mon, 2 Aug 2021 11:29:58 +0800
Message-ID: <1627874998-94940-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Added new feature stringrefs, which makes repetitive dictionary structures more compact. Use with care since support for this is rare in other CBOR implementations.

This release includes some bugfixes around decoding invalid data, which may improve security on decoding untrusted data.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-cbor2_5.4.0.bb => python3-cbor2_5.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.4.0.bb => python3-cbor2_5.4.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.4.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.4.1.bb
index b791588b42..ba015a8188 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.1.bb
@@ -4,7 +4,7 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "a7926f7244b08c413f1a4fa71a81aa256771c75bdf1a4fd77308547a2d63dd48"
+SRC_URI[sha256sum] = "a8bf432f6cb595f50aeb8fed2a4aa3b3f7caa7f135fb57e4378eaa39242feac9"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


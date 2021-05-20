Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.5796.1621501804864264604
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 02:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dOASbeaB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621501802; i=@fujitsu.com;
	bh=5k7dQFlqpisiA7ApBwWcc7FlwS1D154CDAiZr4+bECo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dOASbeaBMXNVV94AsGh5bPLA/v41BtnQL3wAJcxZfhLcTS7N32OsFOlrBzgXogu2P
	 sYslkC28S7ITwGQgGQfwNLchmk8WGTpNIAplLEIW3tzblV78dwS9NRemRnGTRNBqQk
	 5wEzd4el1RfkhQ3fLWGO45Gi4d7h7MJNPjYVJroS7dddRdQeokzwmze7ZDMFXSXAPP
	 k/xSmU6dL4kbpqJx4vipTuaXx8Jzcl/vf8IENC4JC8TA2po0GYekM7Y5HRgFlr2/7F
	 ucJMfeomQLAyptQxsVCG3WfDaVKiwYMo8LjaPJKNGSCfhqvynR5I/fDtTHo+LoveOh
	 cVFSeVcwwGDRg==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 4A/80-15146-A6726A06; Thu, 20 May 2021 09:10:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqpulviz
  B4NMVFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPi6mfMBSe5KuY0NLE2MF7i7GLk4hASmM0k
  sWLHNBYI5wSjxMUps4EcTg42AR2JjhfdYLaIgL7E0tl7mLsYOTiEBQIkurZLgZgsAqoSH/aVg
  lTwCrhLdC65wARiSwgoSEx5+J4ZIi4ocXLmE7ApzAISEgdfvGCGqFGU2L7zDAuEXSExY8Y2tg
  mMPLOQtMxC0rKAkWkVo2VSUWZ6RkluYmaOrqGBga6hobGuua6RsaFeYpVukl5qqW5yal5JUSJ
  QVi+xvFivuDI3OSdFLy+1ZBMjMIxSCtmf72Bc9eaD3iFGSQ4mJVFes/uLEoT4kvJTKjMSizPi
  i0pzUosPMcpwcChJ8IoAA1NIsCg1PbUiLTMHGNIwaQkOHiURXm5ZoDRvcUFibnFmOkTqFKOil
  DjvO1WghABIIqM0D64NFkeXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzTlYDmsKTmVcCN/
  0V0GImoMX/GxeBLC5JREhJNTA5ae5MENE3atc6f24Hv1HWzRkJC4/9zFxwqqD2QunzveJ2vFe
  UT3++amrCcaVUq6H34n0tQ9uW6Z+n/TP+bPxS9UjXBh+HmfpahsYpE9tjMpjnHE6wvaUq8/rv
  1vIdgcx9iX991D6+vrn1p+0V06elmcuZ5l4QvHZF//zR8iVeQYpTNaZG6W/KvhBSVCOsbbG7W
  Tp36jVXi4xLr2eq7N8WIbfyVdmNNe81rl6a8iDPL3S14Ne/D1MCRS10D9SuyVrx4Z9JT6oxr2
  mH99cN/7N9qryuH2vZtld3p4WVjMWj9zz/4359qy1p/rT66KnHGyw/f17gGbz72I1FU8LTa15
  vPyL+LH39CS7by7XO4ZcnKLEUZyQaajEXFScCAPjHfPYeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-245.messagelabs.com!1621501801!265501!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13470 invoked from network); 20 May 2021 09:10:02 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 09:10:01 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K9A1Ew005110
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 10:10:01 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 10:09:59 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-itsdangerous: upgrade 2.0.0 -> 2.0.1
Date: Thu, 20 May 2021 17:09:51 +0800
Message-ID: <1621501791-17488-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...on3-itsdangerous_2.0.0.bb => python3-itsdangerous_2.0.1.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-itsdangerous_2.0.0.bb => python3-itsdangerous_2.0.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_2.0.0.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_2.0.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-itsdangerous_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-itsdangerous_2.0.1.bb
index ddcc5d9dd4..f8f2fbdaa1 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_2.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4cda9a0ebd516714f360b0e9418cfb37"
 
-SRC_URI[sha256sum] = "99b1053ccce68066dfc0b4465ef8779027e6d577377c8270e21a3d6289cac111"
+SRC_URI[sha256sum] = "9e724d68fc22902a1435351f84c3fb8623f303fffcc566a4cb952df8c572cff0"
 
 inherit pypi setuptools3
 
@@ -13,4 +13,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-simplejson \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-json \
 "
-- 
2.25.1


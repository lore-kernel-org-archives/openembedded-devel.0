Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.2889.1626416960347332344
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 23:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=K83EEELB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626416958; i=@fujitsu.com;
	bh=mAsKCa/payviiECMS2YKyPiAJ9G6xaPRg9xcMxsMGRY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=K83EEELB8XmLCKd2TjEh/6kUCpyt3cC19Ow6+wXzdNM7gjZkYe61jtdn5LktA9iOI
	 AUuNctyJe9ojrCqtCB3JeKZk2Na29PVyVUWobG7u1K7JUYEYWp0SrJsO2zxs8yzXZ8
	 NuIfEV6fhRmPiekSqXp+9DyRghsIyqVTHcVqccSIoU9FnHOUWua/y2PiaJwiGdmFLF
	 TUZtqGEgnekSfWuOdMcCrLa2lY4ToCfR/CuDGbut6v7a4WFE3O6Z5b/ByfpE1NJ8gi
	 oE/zvQT4quTX+FBXJfGBr/lI0Pe/1m1swT5LnxUQ1jCQjFWCzs7X9I7xkEjiVr58YD
	 vZDKyGb1DhV7A==
Received: from [100.112.199.200] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id D7/B6-03155-E3721F06; Fri, 16 Jul 2021 06:29:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxRddW/WO
  CwZYPlhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aLSaeYCpq4K6bOeMDUwPifs4uRi0NIYBuT
  xKJja9i6GDmBnL2MEg2PdUBsNgFdiXOP17KD2CIC+hJLZ+9hBrGFBfwk2tdPAqtnEVCVaOiaA
  BTn4OAV8JQ4/0cIJCwhoCAx5eF7sHJeAUGJkzOfsIDYzEDl3UeeMkHY8hLNW2eDtUoIKErMni
  4P0VopsWdWP9MERt5ZSLpnIemehaR7ASPzKkbzpKLM9IyS3MTMHF1DAwNdQ0MjXUNLS11DC73
  EKt0kvdRS3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwIBLKTgutIPxzesPeocYJTmYlER5L3/+
  kCDEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtdT4WOCkGBRanpqRVpmDjD4YdISHDxKIrxqIGne4
  oLE3OLMdIjUKcZwjjdrlyxi5ngLJtvu3QWS7WBy5oKDq5k5ZoHJ++2HgOQDECnEkpeflyolzj
  tVFWicAMi4jNI8uGWw6L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3uRLQFJ7MvBK4m14
  BncsEdK72mrcg55YkIqSkGpis+hcr7xHd/HYHl+zrIDdfZ9b5N2eeY7aZ1Po68qlV+JO+zsOP
  ud8cWR9Qv2Lzs9UR5dFPD+5q85c7ZFNzIiyW7fzfuFUVS9sUF9dfmdyX5R51l+vdeYbEhrgd6
  nc5olK25sybasn/+vo59q18vx1ehtwrOrVly61dmyzzZAWLO0pVI/lLLieU9ajlGNX+/rp8/W
  Lh9XmL7SvXnpwbveXrf6EIsVmz1W9XMyUbsT++urxb9WX9jASnKeZzr2YEqskf/1D29r3qNvW
  mVysMJk1y0ItUnvGvij9k6vrHUbobtrsGTBf0T2Xj2rFwrc25qzLTVgTdqk4Pv2DoruUytSmH
  47692gkFK8ttaopLumOUWIozEg21mIuKEwHm67G6aQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-287.messagelabs.com!1626416957!72554!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6210 invoked from network); 16 Jul 2021 06:29:17 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jul 2021 06:29:17 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16G6THU4030146
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 07:29:17 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 16 Jul 2021 07:29:15 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.143 -> 2.4.144
Date: Fri, 16 Jul 2021 14:29:11 +0800
Message-ID: <1626416951-107506-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

v2.4.144 (2021-06-07)
---------------------

Changes
~~~~~~~
- Bump version. [Rapha=C3=ABl Vinot]
- Bump object templates. [Rapha=C3=ABl Vinot]
- Bump deps. [Rapha=C3=ABl Vinot]
- Bump deps. [Rapha=C3=ABl Vinot]
- Bump deps. [Rapha=C3=ABl Vinot]

Other
~~~~~
- Fix misp API response content parsing. [Silvian I]

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pymisp_2.4.143.bb =3D> python3-pymisp_2.4.144.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.143.bb =3D> python3-pymisp_2.4.144.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.143.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.144.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.143.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.144.bb
index 1e3ef27a79..1e97b27aed 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.143.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.144.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI =3D "git://github.com/MISP/PyMISP.git;protocol=3Dhttps;branch=3Dmain"
-SRCREV =3D "c2e9663765e83f1a4aa70099546bec653ed770e7"
+SRCREV =3D "7dbaf665d9288f2a2692bee3d6207bb6abe3c51f"
 S =3D "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.25.1


Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web10.4671.1623390451298801670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 22:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vlAsrsLS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623390448; i=@fujitsu.com;
	bh=hB//8dJ+Pg5I1hjS52XQWWUmWMj5xNO3aIbl2uTVr+M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vlAsrsLSOotjBi7uILGNJbowIwmPquFDVnNwWfbCH5aL6LH+0P+bdtWTagQMELeCl
	 MD/Kvw6Dm3JwOF1LEAFOu3CZ6+TxFsPSDu3raN1xCjaSneqz6FZsKTXs9sFTntgLCZ
	 1Rc/UGaZesIBQq4LUwh32GbjHcHT4LeOmUZAJN6wjpezMp7Avm6xRluDeRiG2bLVFW
	 maVk/cL9A7xrg4tdBPI56aDMPcIvlIlgfa13cW0Pl+RjlYqrwqAJL/BIuszuaS6xDV
	 TXQRKaPONagS8/cvaLPmzWDfgARHaYzFHGNz9cPTmCDzyBAmk2Cm+c+sV3Dp0rTb8H
	 830vD2HXUSgvg==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 48/24-62504-0F8F2C06; Fri, 11 Jun 2021 05:47:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8MRqvvmx6E
  Eg69/TC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozv33cwF6xjq/h44TlzA+Mz1i5GLg4hgdlM
  Ev0tbxkhnBOMEmdndbJ0MXJysAnoSHS86AazRQT0JZbO3sPcxcjBISzgJrH5iAmIySKgKvHuh
  wNIBa+Au8SN38fYQGwJAQWJKQ/fM0PEBSVOznwCNoVZQELi4IsXzBA1ihLbd55hgbArJGbM2M
  Y2gZFnFpKWWUhaFjAyrWI0TyrKTM8oyU3MzNE1NDDQNTQ00jW0NNM1M9FLrNJN0kst1S1PLS7
  RNdRLLC/WK67MTc5J0ctLLdnECAyhlIIjDjsY77/+oHeIUZKDSUmUd8rdQwlCfEn5KZUZicUZ
  8UWlOanFhxhlODiUJHiPvAfKCRalpqdWpGXmAMMZJi3BwaMkwpv3GSjNW1yQmFucmQ6ROsVoz
  /Fm7ZJFzBxt9+4CyZkLDq5m5rjffmg1sxBLXn5eqpQ4rzAwgoQEQNoySvPghsLi7xKjrJQwLy
  MDA4MQT0FqUW5mCar8K0ZxDkYlYd7b34Gm8GTmlcDtfgV0FhPQWcwaYGeVJCKkpBqYnJS0ZVc
  qz1Vznc27omqNJZPT846akjLHoJeOb1Vj3+ausbEy546yzexgt1X+3VV6VNNdT31Dp8GXHOl3
  sb/OLVm+78gVtqsiKYc//FJmvDI/vUcop7E5q8ZA/35QedCDb5lMKuHWO2UimkUnsUi9LevML
  LZbfkz3eVSymm5vkXGleXt+yGv2iug92abt3GFLv8rOvbh0zc4X2Q4XtLvT98hpuVrOvH1qU/
  kvveTlcy8wH9me6CJXKqo5nyW38+/Sdj7fun7TBx8iwv/t+rXhs+6V8/f2HbvR5Gn9nMPI5uc
  C5hcpLuWZmea2V366nT9XrOu1OePN96fLhHw6teQn8VzZvqY3sOnftDcRj5VYijMSDbWYi4oT
  AY4N/UA6AwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-291.messagelabs.com!1623390436!55658!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19280 invoked from network); 11 Jun 2021 05:47:22 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-11.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jun 2021 05:47:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15B5lD0A014348
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 06:47:16 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 11 Jun 2021 06:47:11 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] opencl-clhpp: upgrade 2.0.13 -> 2.0.14
Date: Fri, 11 Jun 2021 13:47:04 +0800
Message-ID: <1623390424-49011-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-core/opencl/opencl-clhpp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
index 0148c0c2e0..5f2618dcb2 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
@@ -6,8 +6,8 @@ SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-PV = "2.0.13+git${SRCPV}"
-SRCREV = "b230a96b61e9e35b8da1565893d74380646e03c8"
+PV = "2.0.14+git${SRCPV}"
+SRCREV = "89d843beba559f65e4a77833fcf8604e874a3371"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.2680.1615858978664599942
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 18:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.113.4.174] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id F0/9F-38008-F1D00506; Tue, 16 Mar 2021 01:42:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1ZXnDUg
  weDtbzOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzfiz4DhjwTL2imnfe9kaGM+zdTFycQgJzGSS
  2NW+iRXC2c0oMf/7BOYuRk4ONgEDif1nL7CD2CIC+hJLZ+8BiwsL2EocOHiXEcRmEVCVeHT5H
  xOIzSvgJfF1exMLiC0hoCAx5eF7Zoi4oMTJmU/A4swCEhIHX7wAinMA1ShKzJ4uD1FeKTH3zU
  KmCYw8s5B0zELSsYCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhsa65rpGpkV5ilW6SXmqpbnJqXkl
  RIlBWL7G8WK+4Mjc5J0UvL7VkEyMwkFIK2f/sYLz++oPeIUZJDiYlUV4/5oAEIb6k/JTKjMTi
  jPii0pzU4kOMMhwcShK8x7iBcoJFqempFWmZOcCghklLcPAoifD+BEnzFhck5hZnpkOkTjEqS
  onz2oEkBEASGaV5cG2wSLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZjXGGQKT2ZeCdz0V0
  CLmYAWG0r7gSwuSURISTUw8fPcfvRgodqZmYr/HWRZnDWzBFls678levpdZ7BU5lDR+rf/Rrn
  yesWO/dPyDYPulNSf9ylUefbkG1NR/fOCQ2yhc3T67h5Y36OdeefiXktbhuIZb49oMBU/P7fn
  ja0P47WLhZp5uUxHC2rvT5LJY5YQYRQuXfJC0++l/56dDzT/RtxWfc8f/LZs1ryUX65FS6Yte
  3Tk2vmH/Vc/ZTf3+C2pv5Jc9CjyXsRvNbWL08QbhUsYmjgknkfoMDw/cbn+j3lB5a7AlIUvoz
  7u6A5fs/QYj1O05nRlnv54lX2fO++vzFjQx9F2VtE+5sGD+yV1yxZ8PjX3gNvG+P++YY+iHM3
  eXv8yMcdbyutb7mEjJZbijERDLeai4kQA8JtvTh8DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-245.messagelabs.com!1615858974!2347747!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17326 invoked from network); 16 Mar 2021 01:42:55 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-17.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2021 01:42:55 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12G1gsSs029395
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 01:42:54 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 01:42:53 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] openocd: upgrade 0.10 -> 0.11
Date: Tue, 16 Mar 2021 18:42:39 +0800
Message-ID: <1615891359-3431-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 05e06a25d5..85add50b6c 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -12,12 +12,12 @@ SRC_URI = " \
 "
 
 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "d46f28c2ea2611f5fbbc679a5eed253d3dcd2fe3"
+SRCREV_openocd = "f342aac0845a69d591ad39a025d74e9c765f6420"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
 SRCREV_jimtcl = "0aa0fb4e3a38d38a49de9eb585d93d63a370dcf6"
 SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
 
-PV = "0.10+gitr${SRCPV}"
+PV = "0.11+gitr${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep gettext
-- 
2.25.1


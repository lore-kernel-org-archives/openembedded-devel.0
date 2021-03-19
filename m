Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web12.475.1616117731446401122
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 18:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 13/D5-42970-1EFF3506; Fri, 19 Mar 2021 01:35:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI0X34Pzj
  B4M1hNouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPiwc9sBUc4K5avOs7WwPiKo4uRi0NIYAuT
  xMaL3YwQzh5GiTXHf7J1MXJysAkYSOw/e4EdxBYR0JdYOnsPM4gtLOAk8XTSU9YuRg4OFgFVi
  Y0/5UDCvALeEp1fZrKC2BICChJTHr5nhogLSpyc+YQFxGYWkJA4+OIFM0irhICixOzp8hBmlc
  SRmWoTGHlmIWmYhaRhASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNLU10jQ1O9xCrdRL3UUt3
  y1OISXUO9xPJiveLK3OScFL281JJNjMAQSik4fH0H463XH/QOMUpyMCmJ8h79HZwgxJeUn1KZ
  kVicEV9UmpNafIhRhoNDSYJX5R9QTrAoNT21Ii0zBxjOMGkJDh4lEd4ff4HSvMUFibnFmekQq
  VOMilLivOkgfQIgiYzSPLg2WAxdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM6wgyhSczrw
  Ru+iugxUxAiyP4g0AWlyQipKQamBinri4LFxaszPn7IzZGW2mz1rEZb9QeVZ/I86qK4DVW115
  ZfdV0/ZyHDz680lhReO6o2/zn8uIrAnQkKy4YXX1bzH4y6c+etgCW3fVLt3oybV7F0h3WrP8q
  Ns7/eamgsuB8Dx2PJUWFT+qWbr1narpXcHH1z/tHln2Vfz9fcOrkjYfO5Sm8+DEvRKr/yZV3t
  qyLv7P0G24Jv3lp/a5KG8M37ytuO0460bNP45tMzmdvlgS7V/FzpEKa78wJVV72yJjF0ubsE7
  4DG1a86f/FUm2ybYGdpP/Uo64JnJpxD5NYXOrkKrKUD0xKDfZl3h2QkuBfXLgrVWRNv0L5vpZ
  V/+IMeWJ3nD91i7E0QDuqXomlOCPRUIu5qDgRAMXmIXccAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-31.tower-265.messagelabs.com!1616117728!167143!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19303 invoked from network); 19 Mar 2021 01:35:29 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-31.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Mar 2021 01:35:29 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12J1ZLKS018009
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Mar 2021 01:35:28 GMT
Received: from localhost.localdomain (10.167.225.35) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 19 Mar 2021 01:35:20 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cryptsetup: upgrade 2.3.4 -> 2.3.5
Date: Fri, 19 Mar 2021 18:35:06 +0800
Message-ID: <1616150106-59351-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.3.4.bb => cryptsetup_2.3.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.4.bb => cryptsetup_2.3.5.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.4.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.4.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
index f53bd8523..5faaada4b 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.4.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
@@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "911272e73181fdc850bb4d25103a9f83"
-SRC_URI[sha256sum] = "9d16eebb96b53b514778e813019b8dd15fea9fec5aafde9fae5febf59df83773"
+SRC_URI[md5sum] = "408620e0df577ec04108ec0bc2b91dee"
+SRC_URI[sha256sum] = "ced9946f444d132536daf92fc8aca4277638a3c2d96e20540b2bae4d36fd70c1"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1


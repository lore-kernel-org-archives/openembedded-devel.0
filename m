Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web11.12380.1631112394908869201
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HFDG4k9Q;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631112392; i=@fujitsu.com;
	bh=YBNZmaUcmbi9ipg7FFK4jphF/HQDZuL7y2vxgCA9JIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HFDG4k9QR4/ooBDeNFTjAJYUwo+JR8SfMmLZx768kgIM8qtlsVXkTdKux4vPs1E+0
	 jd9Ljp3tlC/gdK3ywJLWJcL9diZfbS2u4Amoi10oEuLL6w1aM2jdQRUKwPEyj+RYxg
	 M2j/LuHMWNuh99hCIdsfIEQ9PhTPDyeXJwlCNivJ0QZJyhJmx/1YTRPe5ieXBku3uH
	 a2RoxwzAezUUAx9pMI8QlHMpMnDxNiHvvgpMj94HdIC9ZYNH3dQd3GaEI7Vgd1oaDK
	 VhoRxzgjN7/+M3fcoBKyY8ztsBBkwkzmMYH0yBgrNJB2ANSOSdGm+PcJsZ0+tAb+c8
	 VQ+RKIofLWFaA==
Received: from [100.112.195.172] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id D7/B2-14609-8CCC8316; Wed, 08 Sep 2021 14:46:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxVffEGYt
  Eg7tvhCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxvS0oKbnNVfJ62g6WB8RtnFyMXh5DALCaJ
  a5vvsEI4xxklfh96wd7FyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi989YDXCAh4SzfOPM
  oHYLEDxtb0bWboYOTh4BZwkPv0SBQlLCChITHn4HqyVU8BZYs70NrBWIaCSXzd/MoLYvAKCEi
  dnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYJjDyz0LSMgtJywJGplWM5klFmekZJbmJmTm
  6hgYGuoaGRrqGlia6ZmZ6iVW6iXqppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIGhmFJwyGkH
  4/vXH/QOMUpyMCmJ8u7abZEoxJeUn1KZkVicEV9UmpNafIhRhoNDSYJX8xRQTrAoNT21Ii0zB
  xgXMGkJDh4lEV6nI0Bp3uKCxNzizHSI1ClGRSlx3rmngRICIImM0jy4NlgsXmKUlRLmZWRgYB
  DiKUgtys0sQZV/xSjOwagkzPsEZApPZl4J3PRXQIuZgBa3PTQBWVySiJCSamCazjxDXrlo8gf
  /pF/fL3k9O8tht7BjHe/MmkPvFerSwqM+Gb9WU3g3595nYcX6qCaPYyFGW1f9MO1lFMtgtZbb
  kWme+Kiz4RTTgeWMG+/s/5vlFKy9/k/o3mdHfsfO/N7HsZMpKP/kdUnpM8eEv1Z2qlyqnHNp3
  /Sms+4Xl3O9XS0t9+KI7KXYG5O8vBmFGo1++V7o+ih+4LrBZQUBl5X6cYerb9fHLkhIzHjO48
  TAVfukR2zhpWnxnmtcuxt2pAT63ai78bele6Kw574NGZ+E82YIuq//rhlzLOFFxL4Ph3VLdm1
  8tERgR+H9KUUGu5s2zjAOEvshOjOt0zVA8m93ospcJ8u1b2VySxmXXzRSYinOSDTUYi4qTgQA
  zZg7a0ADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-267.messagelabs.com!1631112391!54482!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22217 invoked from network); 8 Sep 2021 14:46:32 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-22.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Sep 2021 14:46:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 188EkVDP016694
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 15:46:31 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 8 Sep 2021 15:46:30 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lockfile-progs: upgrade 0.1.18 -> 0.1.19
Date: Wed, 8 Sep 2021 22:46:02 +0800
Message-ID: <1631112363-19399-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631112363-19399-1-git-send-email-wangmy@fujitsu.com>
References: <1631112363-19399-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{lockfile-progs_0.1.18.bb => lockfile-progs_0.1.19.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/lockfile-progs/{lockfile-progs_0.1.18.bb => lockfile-progs_0.1.19.bb} (85%)

diff --git a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.19.bb
similarity index 85%
rename from meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb
rename to meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.19.bb
index a82f10b919..df88afa310 100644
--- a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb
+++ b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.19.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 DEPENDS = "liblockfile"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.gz"
-SRC_URI[md5sum] = "4eb83bdf88016db836b7cc09591fb0f3"
-SRC_URI[sha256sum] = "a42995a4b97e6188efc90fcc1a761163c4b2cff5c81b936f85c84301ddb05ce6"
+SRC_URI[sha256sum] = "2c5704b01c8f474f82921780e4592a927b2bf6a6d7616354a6c5d7cd5664857e"
 
 do_compile() {
     oe_runmake CFLAGS=' -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables'
-- 
2.25.1


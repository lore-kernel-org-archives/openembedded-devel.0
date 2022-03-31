Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31756C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 08:14:42 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.4612.1648714480307131226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 01:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ELStkQEd;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648714478; i=@fujitsu.com;
	bh=WlFeWV+sJseyQl71Vq2eO2MeWmU6rkGgEYJ2JKdtniw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ELStkQEdv4eY66L2LmJjwhvh9f7esx/NGn3KTiwmaB0qd3CwkKDiL03FvSMLhuuXI
	 DVl1b8RvQj7jmj10swdJmJRoMb+ytFRaJyPCFt17FoSWCB4OLHDn+r2to2USfnYtkD
	 7NqSIrSLy8go0ryg8WkdXYehnn8QKFYShYs7VCAOQq1VgH6jtAvLl/rFnHUWMuN2HI
	 9jK72eWXz+0U/Gpo3xF4qR0nya3q0l1UJ72NBbhS+joEiZ01bI0weGTcOqPrP1G9Ey
	 j8WXwcfqlXVMnk7yO8CnLes7gIks5W2JYxxPBe18hXxQ8M7RpalLGPxg9BaNPneZ9b
	 LnP7Lk4Cq8kBQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MRovsuyTX
  J4OACFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP+rXdsBXu5KtadOsvUwNjL2cXIxSEkMJtJ
  4s3DLywQzklGia+vP7B1MXJysAmoSzy++ZoRxBYR0JdYOnsPM4jNLKAq0X1xDTuILSwQIXFg6
  g+wOAtQfNa752A2r4C7xNUpP1hAbAkBBYkpD98DxTk4OAU8JLa0OIOEhYBKpv3ZBlUuKHFy5h
  MWiPESEgdfvGCGaFWSOLHiIxOEXSHx+vAl5gmM/LOQtMxC0rKAkWkVo11SUWZ6RkluYmaOrqG
  Bga6hoamumYWuoYmxXmKVbqJeaqlucmpeSVEiUFovsbxYL7W4WK+4Mjc5J0UvL7VkEyMwNFOK
  Xfp3MN7v+6l3iFGSg0lJlNcpwDVJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvHTDYhQSLUtNTK
  9Iyc4BxApOW4OBREuF1BEnzFhck5hZnpkOkTjEqSonz+iYCJQRAEhmleXBtsNi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmYNwNkPE9mXgnc9FdAi5mAFtc9dgRZXJKIkJJqYDLLufLgW5X
  CTcnvzSKhu7WrBK9Zx+RIuRybtcq/4NDZsGVZ3C+PlLbe/BLuWf//7TcfHkXPTzx72Z68nbBD
  9MMStYyIIwdmR8QbdHBOVuXt3LHrjf7syYcSE89F6hkxGDFx3v2yfY1l8/YlXbXdYqZXNFZ/V
  Dxm73HpkfHsiCnzdVvehc/1Ptc1xXyDxcmC2rKq4885l30p2xfpemFtT8XBWuMTWmocG5atNW
  7SKr1SKxpt/+pqzkzpl/+W3r+75lKBvW0DT0C+bLOE9752uUsbSmvm1PFyHsyeHz1H//fr19f
  rkmWErRYVzWC438D3VzHy8ME+44NJHRf5fy+wv8w2IZiz6PzigL6NK6tFFJVYijMSDbWYi4oT
  AZ6e0u1IAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-532.messagelabs.com!1648714477!90527!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21016 invoked from network); 31 Mar 2022 08:14:38 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 Mar 2022 08:14:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22V8EWnX009516
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:14:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 31 Mar 2022 09:14:30 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 5/5] [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.44.0
 -> 1.45.0
Date: Thu, 31 Mar 2022 16:13:28 +0800
Message-ID: <1648714408-12048-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648714408-12048-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1648714408-12048-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 08:14:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96291

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-grpcio_1.44.0.bb => python3-grpcio_1.45.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.44.0.bb => python3-grpcio_1.45.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.44.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.44.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb
index ffa009d7b7..ca55a7f091 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.44.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://0001-absl-always-use-asm-sgidefs.h.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
 "
-SRC_URI[sha256sum] = "4bae1c99896045d3062ab95478411c8d5a52cb84b91a1517312629fa6cfeb50e"
+SRC_URI[sha256sum] = "ff2c8b965b0fc25cf281961aa46619c10900543effe3f806ef818231c40aaff3"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1



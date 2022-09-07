Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FAEC6FA83
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 11:25:04 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.6499.1662549898385161310
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 04:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x1Z7CSSg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662549896; i=@fujitsu.com;
	bh=JbZPWglOSETuXlkCxHgeD6Ufw8jyznu/4C7D9/PH2is=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=x1Z7CSSgzSNDUsyPo8aWipCmKJwOLGGHExlqdlWxynmJ9PLrhtkRqd1hCjwJnJvLY
	 qdqJwYAfuYUygHZ4saFxWXokk81zk1Lnqh4SbYY3yZmaD/SphvHdDSsy9Fz+sV75uI
	 HV0E/FlUh8Ku/nEzEd3tKKwfxl2mna3H56eNcN4Py2OZKy+BvPaeV+2LSQQineG2dg
	 QiJX82Ln0nGAJG48KVZN+9VbEEEDvPos+sTBQ368oS+k4LVRcOFwc8aHHVYn8rg1f+
	 8uGqMhhJ6EGC9VAsExH5BjYQk9Jc6aJerbGfEEKETWjgC7fAs5Sm2YOpJ2ZXKoDymC
	 0RCxy7evGLA1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8MxSbe9XiL
  Z4OsRXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP5pAPMBf85K+40nmFsYLzC0cXIxSEk8IRR
  4sb5XnYI5zqTxKrHDWwQzm5Gidm3tgFlODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48bsHr
  EZYwEfi/IuZbCA2C1D88PdFjCA2r4CTxLQJH8BsCQEFiSkP34P1cgo4S8xvWQE2UwioZvvs/U
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKicbph5ggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGG2SijLTM0pyEzNzdA0NDHQNDU11Lc11DY0t9RKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yor
  c5NzUvTyUks2MQJDOaU4sXsH4+p9v/QOMUpyMCmJ8sZ5SSQL8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuCVqgHKCRalpqdWpGXmAOMKJi3BwaMkwvusFijNW1yQmFucmQ6ROsWoyzHza9sBZiGWvP
  y8VClx3rMgRQIgRRmleXAjYDF+iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwL0Md0BSezLw
  SuE2vgI5gAjpia6A4yBEliQgpqQamUg7WKc0LHrbsXFz67Njr4uIpV4VNDHeEfJr6aUts8X57
  qXVRInvUX79UuBP0wU1v3bJFb/ODfzBYM+yomyeQwCrVfviE0tfHG7PPn1md9OGiZ8stNW+jQ
  8s+HrbwE84J9Fu1fulffRYhz7s26yTl3iX+LJO4eMpg6fdGtl077rLW/db+sfnpiTf5qr7Nn9
  rFk75OzhP5XNFdYB66XrExLqZNQkba1nU/03GFeuGS905r/n7IvrH23c/+Y0J2d6c4/t+R7ux
  +qdhtXdEGh89PpSe+LxQ23PSzOsDlyIT2CbVpy/9KS04Q8n0dOknWUvGn+w+BNAbbx+qLdHhl
  BJ/xTXQy/pL7PfQgs1/fY+EEJZbijERDLeai4kQAP6av42wDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1662549895!86566!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23183 invoked from network); 7 Sep 2022 11:24:55 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Sep 2022 11:24:55 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 197E11000DC
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:24:55 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0A228100078
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:24:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 7 Sep 2022 12:24:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.48.0 -> 1.48.1
Date: Wed, 7 Sep 2022 19:24:28 +0800
Message-ID: <1662549869-17948-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662549869-17948-1-git-send-email-wangmy@fujitsu.com>
References: <1662549869-17948-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 11:25:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98687

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.48.0.bb => python3-grpcio_1.48.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.48.0.bb => python3-grpcio_1.48.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.48.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.48.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.48.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.48.1.bb
index a16b88093a..b2ca35154e 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.48.1.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
 "
-SRC_URI[sha256sum] = "eaf4bb73819863440727195411ab3b5c304f6663625e66f348e91ebe0a039306"
+SRC_URI[sha256sum] = "660217eccd2943bf23ea9a36e2a292024305aec04bf747fbcff1f5032b83610e"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1



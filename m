Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E9AC433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 04:02:14 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web08.7579.1636516932562381185
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 20:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Eo1XgnJ+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636516930; i=@fujitsu.com;
	bh=0kNzMON9czE3/Udr50BySgLBv+/wSS+A5ZVYMIBIO1A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Eo1XgnJ+TZdfW8phg4FTdgkkvw6+jXrJBO9UZzDlg+SFBY8Tbu60AP8wcOXQWyNsH
	 CDAQtpgEPeID7hq17DjdpkA/doFMFwumE/OpICvrIkUGzfoTLTRBuBhwdkwa+kMIJn
	 WonUFkJ/YfNt5J1P3lPMCaPWa/kv0pGnMOV0rVxSHTD22mfeeWnygPzK2O61yco5xS
	 qHA1P1YhqCuGMoPG5wzo/7czVz/5et2SrJvNTUR2k/ZOYdN5b0fAUMG0AI8rMfCxzt
	 hjs7MY6mh0lkOi7U3GdXi3Q4jNbMQrwTPh8hNd14hwKL2cwLIG7dz40YbAFAFcVEe6
	 Okh8/7sKAARvA==
Received: from [100.112.196.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 3A/82-08711-1444B816;
 Wed, 10 Nov 2021 04:02:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqOvo0p1
  ocHURn8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFsyxL2gnVcFdMm3GRvYNzH2cXIxSEk8IRR
  4u7Dp0wQzgUmiQWH97BAOCcYJa6fmczcxcjJwSagJjH91g1WEFtEQF9i6ew9YHFmARWJF7972
  EFsYQFPiQ0TVwDZHBwsAqoSu2eZgoR5BZwkzk2/yQRiSwgoSEx5+J4ZIi4ocXLmExaIMRISB1
  +8YIaoUZSYfbmZBcKukJg1qw2qV03i6rlNzBMY+WchaZ+FpH0BI9MqRvOkosz0jJLcxMwcXUM
  DA11DQyNdQ0szXTMTvcQq3SS91FLd8tTiEl1DvcTyYr3iytzknBS9vNSSTYzAcEwpOOKwg/H+
  6w96hxglOZiURHkPCHUnCvEl5adUZiQWZ8QXleakFh9ilOHgUJLgTXcCygkWpaanVqRl5gBjA
  yYtwcGjJMLb7AyU5i0uSMwtzkyHSJ1iVJQS5/UBSQiAJDJK8+DaYPF4iVFWSpiXkYGBQYinIL
  UoN7MEVf4VozgHo5Iw7xlHoCk8mXklcNNfAS1mAlp88Es7yOKSRISUVANTXrVcK0+Ly8+zHJN
  ld31l5lzk0H5mp4fKe8//az5ZPEoPtrlg9yXIP8X/zp+8Y/6MvG6L+9RvPc5rOPhOVthz2gGz
  b5Fmqbs77nOs/Vr9yOfjwofPXpxr6b0Z9Jfz1fLFR1/m/w9WlPJWLb46xfxG8Zn56rX3OK+UL
  HotfErooMucv6cXqVcmXqpd8lIlQGF3a4zWX2mDmIu9C7Q4VkTGW87UPXDV3mDJ5Mdud68/k2
  i4fI/nwfmnQuerZlw+t8/2Vc+stxGvNn1V+rBuYavoteL53oVpeQqRRiKLte869hwN50jbxld
  wfLaV1MWXfRW/NWU4dY4JrpVONuITe6wVVDm7lTElI2zpf4+UhbHhSizFGYmGWsxFxYkARHDE
  ckIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-285.messagelabs.com!1636516929!76001!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15999 invoked from network); 10 Nov 2021 04:02:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Nov 2021 04:02:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BEC1210023E
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:02:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B1D5E10022A
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:02:08 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 10 Nov 2021 04:01:46 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aenum: upgrade 3.1.2 -> 3.1.3
Date: Wed, 10 Nov 2021 12:01:34 +0800
Message-ID: <1636516897-63008-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 04:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93896

3.1.3
=====

rename `aenum.property` to `aenum.enum_property` (`aenum.property still exists,
but was too easily confused with the built-in property)

fix `enum_property` to work with `_init_` attributes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aenum_3.1.2.bb => python3-aenum_3.1.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.1.2.bb => python3-aenum_3.1.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.2.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-aenum_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.3.bb
index ce58c5ef49..ad7d363192 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "806dd4791298e19daff2cdfe7be3ae6d931d0d03097973f802b3ea55066f62dd"
+SRC_URI[sha256sum] = "1d494e4d3b3e3e95389aee420203d945776d2430ee9a3d4f162e267b3a7ec3a6"
 
 inherit pypi setuptools3
 
-- 
2.25.1



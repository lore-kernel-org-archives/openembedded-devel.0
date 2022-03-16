Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF61C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:33:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.22605.1647419592275531045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AXGnppaF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419590; i=@fujitsu.com;
	bh=MihxYeZK/IXwbyIMQCd7JW2XqdbkORbUPTy3YVsvRjQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AXGnppaFTFyt3b+oK1mshoR8cOCeOvZUo9arUKYUp2Ls3whg/1Q2uJyXMRLG8b/6j
	 BKPu1/LRW5cnu4p+InuO2O6yps6qLEDRwR1HDR8P8BFior7mS0i/RV94NtvORbFg0s
	 ERnXWgydbdZAIe2rGH6KrkY9iyawUuJi3+J0Fvk19IohrRseKG/0QrKkW6CTjJfYP9
	 kLmmrvgCFXy0dHueh01yh7GzbyP1ButTrkR9Q5dI+xug0fcvn64Y/s9o7+dixQ9U37
	 DEg3z0PhxstYxhDIGvpAo1aVP8wirS13IP8uAGLsB6IE7o00J88n3zE8GEAc9Ol27B
	 ovVp80FEDpdOQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqHt0gWG
  SwZNj1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aBiZ/YC35zVuz6uIatgXEGZxcjF4eQwBNG
  iZlbf7FCOBeYJNZ297JBOCcYJfpXdQJlODnYBNQkpt+6AWaLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYW8Jb4/mcuWJxFQFVi49ctLCA2r4CTRNeU32C2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZo
  gaRYnZl5uh6iskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itEoqykzPKMlNzMzRNTQw0DU
  0NNU11TUyNtZLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMy5Ri1pc7GKf3
  /dQ7xCjJwaQkynt+pmGSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne3XOAcoJFqempFWmZOcAYg
  UlLcPAoifC6zgNK8xYXJOYWZ6ZDpE4xKkqJ8zKA9AmAJDJK8+DaYHF5iVFWSpiXkYGBQYinIL
  UoN7MEVf4VozgHo5Iwr80MoCk8mXklcNNfAS1mAlo8T1oPZHFJIkJKqoGp4ZQxo/60XE0VAeM
  TUyTT/ja7Nd04uP7HmiX8bUq791XFmqT/P2Q04Xc6V7XbjYjs9wIerf1H21zdmaPUVm1+/jrl
  9PvGql2SjSyNvsftdqlOacovm/k2KqIgzXRNab6xzNT9Bx8q+P0W31EkGDxDdILJn5WRVV9LP
  2d5n7mSG3rZkCXzlP/9+zKd/vtLXt2zydgqt6+i3PKb+bMnT2JdVM9afMifEhBk9ytWTIlZz/
  KDCNfGOdq6j+o3HzB+bBhWlKjM02wvOr/o0lZDZ8akzUIPyqp/SSYt0zhsWnwoySgyof1uV5P
  l9u4NfV6LO+T19qjyLw01+2qqon7ow8OZH1O2qTlZdrk955z0X4mlOCPRUIu5qDgRAJyzUXlG
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1647419589!9421!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18802 invoked from network); 16 Mar 2022 08:33:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:33:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 69B59100194
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:33:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 385E6100196
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:33:09 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:32:54 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libiec61850: upgrade 1.5.0 -> 1.5.1
Date: Wed, 16 Mar 2022 16:32:38 +0800
Message-ID: <1647419561-81555-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:33:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96008

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libiec61850/{libiec61850_1.5.0.bb => libiec61850_1.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.5.0.bb => libiec61850_1.5.1.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.0.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.0.bb
rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
index 13e0250fa6..11050e2050 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.0.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
@@ -13,7 +13,7 @@ SECTION = "console/network"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "swig-native python3"
-SRCREV = "fcefc746fea286aeaa40d2f62240216da81c85e5"
+SRCREV = "210cf30897631fe2006ac50483caf8fd616622a2"
 
 SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
            file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
-- 
2.25.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF85C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 11:56:54 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.8946.1647950213488131358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NNPrGtab;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647950211; i=@fujitsu.com;
	bh=FgLBoFZ6AY64KYF5EDgC7KuWpgv8SasNKxiK/tkwx3Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NNPrGtabplofly0dVEmzDKNMvJyzTInVAVbeeAiNgj2UO37TvQ8UbOuT3jDk7lctK
	 Pn44N7XmRIZd5Xgzv8/pr6dPMMeFHAZ1M8JA30qT1OT/jWJ75oNJT3GProWesxdktd
	 J3RmObb/rjWM+Qcl8qmfC31MUrMAV//uwvfwzNBTCYPl12u5f/O0VCEc+V7A6FuumL
	 ziRbBZWiyCwOH7svOFMJAWNgxXNn3Ehk66OwvpJvWQcFh5dF8tasa8F6fFRfLJLnHz
	 GC/bv03k2uaiNLWu51goHIU4a5nKU++w0JKMjjsGPUI7n21YCh69P1ZDyeXrvOHTZ+
	 UAZyjpUGGGNrw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxSbd5p2W
  SwcR5zBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bv17dMBe2cFY/uJzUwruLoYuTiEBJ4wihx
  ZlYrG4RzgUniyqefLF2MnEDOHkaJvSslQGw2ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBTwk3k7/ygZiswioSkxveQYW5xVwlFh8/TRYr4SAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxjtkooy0zNKchMzc3QNDQx
  0DQ1Ndc2BlIGFXmKVbqJeaqlucmpeSVEiUFovsbxYL7W4WK+4Mjc5J0UvL7VkEyMwNFOK3XJ2
  MH7s+6l3iFGSg0lJlFd8uWWSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne9duBcoJFqempFWmZO
  cA4gUlLcPAoifD+3QCU5i0uSMwtzkyHSJ1iVJQS543aAZQQAElklObBtcFi8xKjrJQwLyMDA4
  MQT0FqUW5mCar8K0ZxDkYlYd48kCk8mXklcNNfAS1mAlqsz2oGsrgkESEl1cC04lWjpPRp6Z1
  /X0Yd2Rni8u259z//SXtEZnuEKi79dCJVSOjTqcvFsTHqYjXtWXvWpU0oX7b9LfP3q7vrumde
  zz1uoDo76dkLoUMnPpy5bxUTO0Ow5bbPcsYl3JxySZH/0gS0X8h3rRb+8/T6Ahdf09hNxTfvv
  nl317hVcSvf/C/hhhln3Hfa7Y8o9tMUmMua5Z1Q+UqcVcClyMXM5//KgCa/I1NENJTfLU1vMm
  ox5Nw5//Q3oRtrth2v6vNXd+85YOp28cbztat0w46cTNOMtninJx8lKPfGk8/LzNSszybN49Y
  7hi+xNWw3Nni/4dx3XVz58bFQ1UWTvVV//jpyoZlzhvY+VVeRFXnlAhuUWIozEg21mIuKEwFx
  UuSoSAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-528.messagelabs.com!1647950210!27455!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19591 invoked from network); 22 Mar 2022 11:56:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 11:56:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 92F22100354
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:56:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8641D100445
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:56:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 11:56:39 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH v2] metacity: upgrade 3.42.0 -> 3.44.0
Date: Tue, 22 Mar 2022 19:56:25 +0800
Message-ID: <1647950188-5858-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 11:56:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96138

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../metacity/{metacity_3.42.0.bb => metacity_3.44.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.42.0.bb => metacity_3.44.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.42.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.44.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.42.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.44.0.bb
index 8baf2bc62b..b6708552ac 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.42.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.44.0.bb
@@ -23,7 +23,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-SRC_URI[archive.sha256sum] = "d89d679dcfed9b5eef18f06e2dcb33a7ab543d53b358fa89ce65593c231eeebc"
+SRC_URI[archive.sha256sum] = "19c3c5d79d2171f45baa0f632cc8995f8607bf1231a16014439bac9ba165a7c0"
 SRC_URI += "file://0001-drop-zenity-detection.patch"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
-- 
2.25.1



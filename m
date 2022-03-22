Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2875C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 00:09:33 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web08.3628.1647907772790567417
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 17:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xesj/PvT;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647907771; i=@fujitsu.com;
	bh=RlHJ57MUqqBFwZbLuo6+LTOWBaP56ie07JstHRtb9hM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xesj/PvTPpw8EPjs2AgnjNp8NHWA/VhtpSFGxGlDz9VE8qKUFQFkf6flHAE0b/mK2
	 QVvRbTkQBgcRZHSE+N7h9M0gPGSjlgAyrJa/1PSiGK0SDp0ajjPuXG645U92JljqOZ
	 f1qN9bBM4I8QUFyJ3aPh696epsAtIMT2sHLCiZMtY7HjzmoO95iJzMV4UGo3QkWiY8
	 NHj22y3LTDXxyJDdP6tAv73jMOJg0dLPI+ASxKQDATrBnzc4DXj0Nyu7EV9+z5S9UL
	 s1MHh5H8Iwo69onnUAx8zJpLv3TrYA5MYvxorP8hOVC3Bn0jk483jeOo3fSQ14K746
	 eRgw/4HqDEQJQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MxRXeXsGW
  SwfnJ3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b8b8fZCp5wVHx/fIytgbGZo4uRi0NIYCaT
  xKUrSxkhnD2MEisnXGHrYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHnYQW1jAQeLJm
  lZGEJtFQFWi9eQUsF5eAUeJ3ZeegNkSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+YIWoUJWZfbm
  aBsCskZs1qY5rAyDsLScssJC0LGJlWMVolFWWmZ5TkJmbm6BoaGOgaGprqAkkjY73EKt1EvdR
  S3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMAgSylmqN7B+L/3p94hRkkOJiVR3hcPLZKE
  +JLyUyozEosz4otKc1KLDzHKcHAoSfCKClomCQkWpaanVqRl5gADHiYtwcGjJMLL/wGolbe4I
  DG3ODMdInWKUVFKnPevEFCfAEgiozQPrg0WZZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCf
  MuBtnOk5lXAjf9FdBiJqDF+qxmIItLEhFSUg1MSgxCbnNVKy5qqVX+quuclbXWXe3TPo+bDDH
  lFke3XU6fxG4+7brSr1/FNnIZHOkdzsrXV51Y8NPn/eGkvrWdFt/jZxoE6EQ2e3+00Ln3Y5X3
  9c2ZDtkKb5hMNy7psL6+ryCrKtjl/aIdK7M+Wi68Nilikk7dFYU9a9NZlONOzsg23XZfY+oS4
  ScHfpdP2n/1mce1rCeTFn09cPHF53q/J79eWV8I2RFzJdf7peOvjaqrJmtt56ub4JRySCJ+1v
  mgRM2aure1TEKW7SZpvBcOyN/ya9+qcWHSsS9O/r/WGxX89Wt+nv9yg8YpzX168n3fnb/NCF+
  UdEs19qXevUV7QnXFeuq1Umsv6vBI7udOU2Ipzkg01GIuKk4EALxFnnotAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-585.messagelabs.com!1647907769!228690!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11601 invoked from network); 22 Mar 2022 00:09:30 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-20.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 00:09:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22M09OE2005185
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 00:09:29 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 00:09:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gjs: upgrade 1.71.1 -> 1.72.0
Date: Tue, 22 Mar 2022 08:09:10 +0800
Message-ID: <1647907753-1930-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 00:09:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96116

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.71.1.bb => gjs_1.72.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.71.1.bb => gjs_1.72.0.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.71.1.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.72.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.71.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.72.0.bb
index 9c3d441d1b..9e6fc45db3 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.71.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.72.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "mozjs-91"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "f15ad0d45a7d31a1ac4e07479038c0536713cca3c5492ca2f2731c04a3a5f1e9"
+SRC_URI[archive.sha256sum] = "3ef0caf716e3920dd61f7748f6d56e476cc0fc18351ad0548e7df1a0ab9bdcad"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.25.1



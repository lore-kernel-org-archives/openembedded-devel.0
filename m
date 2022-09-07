Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E32AC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 11:24:04 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.6514.1662549843580194819
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 04:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F3L8+aKs;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662549841; i=@fujitsu.com;
	bh=QPql+ChTpydULRW4w+jarVML4zw2vEo1yns6IHHUGYQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=F3L8+aKsO45Ul3HBISqPgjGLGY2s6QydfyI2re8R0Q3Zq4kk5JY3HTyneLG1dz1pV
	 OnmdzSH3vUiH9Y4WDNCtptZ83nJVdLfhrmwPJOHJyWWc714xLigU+32BT8bGkYrnOj
	 uUS7b5envwF6MEYImDB5OdFwvhBfXBzTwKhprDTRoaSPELmJ6OrtqzZ/uzI7ufK0cn
	 2w4umqgomeW3jrIO9FdpQgv3ME5EtzyDaN+PfPQIxuEBOl+VTk66ws+KAsqZQw2icJ
	 V4XFZGDSIG0Cq2hO1UFuEYWyKKjsGJdBP9UwYQYQYovt3hvgQIhOI6vuxNT3xJTVSH
	 M3qANakrw00fA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSTewXiL
  ZYOJyJYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePrvBvMBRO5Kl51+TYw7ufsYuTkEBJ4wijR
  tUmqi5ELyL7OJPHsfwMLhLObUeLh+vtMIFVsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC8RJNH46DVbPAhRvaXgPVs8r4CTR37+NEcSWEFCQmPLwPVgvp4CzxNa5/9kgrnCSOD5hPR
  NEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtConH6ISYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRqukosz0jJLcxMwcXUMDA11DQ1NdA10jE2O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzk
  nBS9vNSSTYzAEE4pZvi8g3FB30+9Q4ySHExKorxxXhLJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4pWqAcoJFqempFWmZOcB4gklLcPAoifA+qwVK8xYXJOYWZ6ZDpE4xKkqJ854FSQiAJDJK8+
  DaYDF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwL0Md0BSezLwSuOmvgBYzAS3eGigOsrg
  kESEl1cBU9nrXVmO3iemTi7vvix6U2eTr/UrgvUfb1suhfwJEYp9kHrmS0DE5SbtKlkVxwqSe
  q1cYFJY0CMaXml77wVT5m2n7lg0/BJWbBBf2XQmI+rt4e+vb33n31mgXHPF3ypLz92Dn0Z154
  YRJ0copf9Y4HCgWSXHS9puw7Hm+tHtS/PWUTBOed+tn2v5pzpKTYeDrXlm9Kv1k/alvUka8xW
  c/nci95ruG4dXHGXmbfUz/xq9OCxaZEBw4dfaPgmP91lN+7znkESnWp2c8L/kx6+mJslx/U3X
  Z3rmf+Ltk+Rze6Z9Pb1l0aPcmC3X2KD/LM2vktBbsT33ceZxvxSYTibB1ftH6x7h/BzyP+NeT
  JBqlxFKckWioxVxUnAgAPuv5KlwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1662549841!482697!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23506 invoked from network); 7 Sep 2022 11:24:01 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Sep 2022 11:24:01 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2F5761000C2
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:24:01 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 23017100078
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:24:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 7 Sep 2022 12:23:59 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.57.0 -> 2.58.0
Date: Wed, 7 Sep 2022 19:23:19 +0800
Message-ID: <1662549799-17908-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662549799-17908-1-git-send-email-wangmy@fujitsu.com>
References: <1662549799-17908-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 11:24:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98685

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.57.0.bb => python3-google-api-python-client_2.58.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.57.0.bb => python3-google-api-python-client_2.58.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.57.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.58.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.57.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.58.0.bb
index fdbad826bd..e473c7b82f 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.57.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.58.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "ec4412545b0c5978a833bb03993a46121ad2c700f32af0cba23f8439b3f5fb02"
+SRC_URI[sha256sum] = "3af6a181763a8cb18f2b9d973760ba32e4fe2af09e4ce06626ff6a53777c33fa"
 
 inherit pypi setuptools3
 
-- 
2.25.1



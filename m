Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA982C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:10:29 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.18071.1658916620211285208
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tRTrcIr8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658916618; i=@fujitsu.com;
	bh=rJR/EE3FOhzL78Nog75teIQr/iAM9nvd3ldGOeYmQ8A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tRTrcIr8zmuAPWaz1kF1x3IyU41uC5Fs0m50+yM0QVF4Q/8wB8h8/8wc9rJKyPi85
	 JCciWhz4nG580uEvEAAws8vCXMVkD1SybBxS2MYaGLYCVq/brw85BxkV/RgTt14VK/
	 ZitsK8vUVbTvlYJSaRAnsH+k8FnUqe54lvPMMp3FQ4JufmfoX2cjNeNNb7BCzBbfQK
	 IhAXR9PBgFIms9heM6EUjovSiay6w/arXTT7G7EJjDvcPNkquSA2h/8K98BljSt6gK
	 h48dPdD0NifsEdlQGx2jU6hNsie0qa9IA1DXBICabxp1oyr3xYaLO8hX0ZLrBR10bA
	 4tv7IwgGmJD2g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORpMvF/zD
  JYO9WDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNFxz6Wgg0cFbuWdbA3MF5n72Lk4hASeMgo
  8f5oKxuEc4VJ4sL6eawQzklGiZOTrjF1MXJysAmoSzy++ZoRxBYR0JdYOnsPM4jNLKAq0X1xD
  TuILSzgIfF4wj0gm4ODBSi+5XQoSJhXwE1i6s4JYGMkBBQkpjx8zwxSwingLrFloyhIWAiopP
  XAFiaIckGJkzOfsEBMl5A4+OIFM0SrksSJFR+hxlRIvD58CSquJnH13CbmCYyCs5C0z0LSvoC
  RaRWjVVJRZnpGSW5iZo6uoYGBrqGhqa6prpGRuV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFl
  bnJOil5easkmRmAIpxSzPt7BuKbvp94hRkkOJiVRXve3D5KE+JLyUyozEosz4otKc1KLDzHKc
  HAoSfDu5XiYJCRYlJqeWpGWmQOMJ5i0BAePkghvMi9Qmre4IDG3ODMdInWKUZdj5te2A8xCLH
  n5ealS4rx3QYoEQIoySvPgRsBi+xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4HkCk8mXk
  lcJteAR3BBHTEFoUHIEeUJCKkpBqYmBK06q2yrDeJsW1a8snqkbuumXGfsap5geuGLvFp5mo2
  747Necd6vL1A86FTbtylCAeb8j0NmmVZbxZwFn+8qF3W8EWWq6Ho4spzUyp8Djru93984UzV3
  K07ll/o3XQsdWbAj+4i+Xq/8svCP+4fjk9raTxhWZuo3PvP7lLiPqZbL5+9zTn0b85Pj0qZ6/
  LL5nN4u61JuvfdXv6Dn841/yDhRRN2i5zYnnw6fP8lMY0bS36WXMudxn6DQ/Sld0u5n9T2tNq
  JJ5fxMqY9luhm3Xws7+zz2C72JxO2WdxQYJ02U+Pu19UbkvOUSw84axWkLD277/3ly/nR2Ude
  vPHsSm9UjzXzOuq9XMk+SuusEktxRqKhFnNRcSIAgBRh/GgDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1658916617!1197331!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27078 invoked from network); 27 Jul 2022 10:10:18 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 10:10:18 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B87391B5
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:10:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AB9741B2
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:10:17 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 11:10:16 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mypy: upgrade 0.961 -> 0.971
Date: Wed, 27 Jul 2022 18:10:03 +0800
Message-ID: <1658916605-9446-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658916605-9446-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1658916605-9446-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 10:10:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98005

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-mypy_0.961.bb => python3-mypy_0.971.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_0.961.bb => python3-mypy_0.971.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.961.bb b/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_0.961.bb
rename to meta-python/recipes-devtools/python/python3-mypy_0.971.bb
index 02f7cce4ca..31fcb06c9e 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.961.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "mypy"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f730d56cb924d371c26b8eaddeea3cc07d78ff51c521c6d04899ac6904b75492"
+SRC_URI[sha256sum] = "40b0f21484238269ae6a57200c807d80debc6459d444c0489a102d7c6a75fa56"
 
 BBCLASSEXTEND = "native"
 
-- 
2.25.1



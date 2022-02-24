Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E82C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 06:00:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.7156.1645682432482019802
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 22:00:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Eu6qyFWc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645682430; i=@fujitsu.com;
	bh=LCMBz1y8/+YEKikSrT2kR2++XQYnGsEmyvpX/9fkxQY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Eu6qyFWcLskixHsbhxUS7qfE6clWNsvEBnoOOipafNTmTOzxLdCi1z9CbuKbeS6Eq
	 vZ0G/hgo/pdUE6c67s/qPhPT2ZP2p775joevOHP3TOquIn3eQ9X0A5PsFadydvXPHv
	 ru76w8FJzD3r/f36j5j/5T8VDyx0WjcF8Rk2ITiYP6/64hw/yysiomSYilZmQmbnNE
	 lO+K9f0XSgLhAP6zemcCXTvbCH9PQBv9PRcQHuLbgxxtCtvu00UYNTfeXxTBGTGxCa
	 c4q04lJHjkPnd/bJ70Rbf/+dKgbJ+xlZrFS5yaAFpq0n33tnUsP4tN2REkbQRXGfJD
	 XEdSCvc6t/Hnw==
Received: from [100.115.7.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id F9/FB-12986-EFE17126;
 Thu, 24 Feb 2022 06:00:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MRovtPTjz
  JYFszq8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF37mHWgtlcFVf3XGRsYFzF2cXIxSEkMJNJ
  Yt+J/0wQzklGiZ9Xr7F2MXJysAmoSzy++ZoRxBYR0JdYOnsPM4jNLKAq0X1xDTuILSwQKXF6y
  mIwmwUo/nfTGbB6XgF3iRUTpoPFJQQUJKY8fM8MEReUODnzCQvEHAmJgy9eMEPUKEmcWPGRCc
  KukHh9+BLzBEbeWUhaZiFpWcDItIrRKqkoMz2jJDcxM0fX0MBA19DQVNdA18jEWC+xSjdRL7V
  Utzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzDIUooZPu9gXND3U+8QoyQHk5IorySzeJIQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCV4TGaCcYFFqempFWmYOMOBh0hIcPEoivM94gNK8xQWJu
  cWZ6RCpU4yKUuK8fbJACQGQREZpHlwbLMouMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmfQ
  MyhSczrwRu+iugxUxAiw3ixUAWlyQipKQamCYE+a449+jvr5/17s0vK7yfu1y0lmPyFrofdPW
  eVpIMx4cJkmrlK3l1fnVFqipcDwv4YHB3a0q2udHKlaY2h3LSFtS9uLS9SJT3H//+x9fFWTrD
  1lR/WLVoj9M9D0MHD9XzD99O56vxYrWZcXuLp7qMz15FXV5BxjVTmv22O6Sd3fl6TuGvI1fur
  7j9nCkxP1NGfuaT4ilWSofiV4k3uSW9YHNVXyrwwOiwYFPO3uSXut6sMdO1XGYzdDGE1Nfnn+
  HIjnMvsTHcwXZO+G/ipz3HPOPMy5Qrj+9lcD+6ccnVYo0s9b93q7zmTVUw37flQ6fmq5ZKyxq
  fplr9lXpPMk6+kxPL0t8h8vPmhE8flFiKMxINtZiLihMB8znely0DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1645682429!84253!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19268 invoked from network); 24 Feb 2022 06:00:30 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Feb 2022 06:00:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21O60MY0000540
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 06:00:29 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Thu, 24 Feb 2022 06:00:21 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/2] [oe] [meta-python] [PATCH] python3-imageio: upgrade
 2.15.0 -> 2.16.0
Date: Thu, 24 Feb 2022 14:00:56 +0800
Message-ID: <1645682457-31192-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 06:00:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95494

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
-Fix
Read metadata of current frame when iterating + APNG fast path
-Feature
Improps and immeta
-Other
Dedicated namespaces for APIs

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-imageio_2.15.0.bb => python3-imageio_2.16.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.15.0.bb => python3-imageio_2.16.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.15.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.16.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.15.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.16.0.bb
index e3462ee44a..04d5b9c95e 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.16.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
-SRC_URI[sha256sum] = "d0d7abb4e5c4044c06fc573233489c4a25582698f93ca94f7bd70b6f4ab172ec"
+SRC_URI[sha256sum] = "7f7d8d8e1eb6f8bb1d15e0dd93bee3f72026a4c3b96e9c690e42f403f7bdea3e"
 
 inherit pypi setuptools3
 
-- 
2.25.1



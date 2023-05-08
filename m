Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC23C7EE2D
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:25:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.103913.1683541533569013352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J9GQ2xMa;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541531; i=@fujitsu.com;
	bh=K6lgKSbFtJ+ddFPV0nbY/o5/006cW+firzvXYYx7fYY=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=J9GQ2xMaQBX+Y2u0siCwzwbLCcPw9mRMX+ix1MixaJFOP6eA9JDpSw8Y0W14Q90ue
	 u86xhtIdfEsYRuG7TWLhAtYoq51SU720/ed9lPqvGXTWvJV5+snK2AsFSqcc5xG1w8
	 TV+vO9hB6JyIkQEY5vtKZxDZIawSdOHwE8pbKcJh7krRd+0g2uaPAJmXyufTTG5zXS
	 yQr0KWxG4v/GEC2vlnvMAbsjyFMMtrfCOurCU4IimV8HmT0+t22G2nCjsrtTH3mvso
	 FFf2U+AfejVJ8+vgmIiTbOHRnkjg5b05KCFJ591/IwbE0pxn+mLILpIt43Sn28Z9XE
	 j2KpHGVX0ebhQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRWlGSWpSXmKPExsViZ8ORpCt9LiL
  F4MAvZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePZyzeMBfc5Kv53L2VvYGzh6GLk4hAS2Mgo
  8fLhThYIZxqTxNKpC5m6GDk52AQkJKbvPckOYosI6Ep8/DCXEcRmFlCRmDH5CFiNsICHxKN/6
  8FqWARUJU58ucYCYvMKOEn0bJgHFpcQUJCY8vA9M4StJnH13CbmCYxcCxgZVjGaFacWlaUW6Z
  roJRVlpmeU5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEejmlOOH
  HDsabO//qHWKU5GBSEuU1PRiWIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC1+V0RIqQYFFqempF
  WmYOMOBg0hIcPEoivLJHgNK8xQWJucWZ6RCpU4yKUuK8W88AJQRAEhmleXBtsCC/xCgrJczLy
  MDAIMRTkFqUm1mCKv+KUZyDUUmYN+0s0BSezLwSuOmvgBYzAS32vxwOsrgkESEl1cBUyH/M/Y
  PXa37/Xyfaj1qfrt+bGOWy7rJPQZ/mWl5OOQe2BWvWPp197sHDZwtmHWmuYb5jzRXVpZQ2n/F
  dde/3Z4sOr1ft69velFUaoFM+w57RYpnhN+VlVkYyaRmXFeJS4q5e0WL/mX8/8JnB/aQLb9ON
  VdO2KuuusZEMdv9ZeHPnnjARqQ5FFuWXM1oe/+L4Wy3F23vl7FKD1Mh6HXHfBe/qax4+s+F4v
  IWHvYRxQVrg6j+bWLq3H4tbrbhSW2lWTqjIX8W7m3aUnJluOjUxZUPN+beF7M1FhVF3X65qND
  tn3sOe93httm/5x+I9CfWXrl/mv7W6QidghrRNCJv8MkGXPHvhe4n/mTZz7lJiKc5INNRiLip
  OBACpqfJz7QIAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1683541530!498612!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7786 invoked from network); 8 May 2023 10:25:31 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:25:31 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 803D31D4;
	Mon,  8 May 2023 11:25:30 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A7E8D1D2;
	Mon,  8 May 2023 11:25:29 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.2.0 -> 6.3.0
Date: Mon,  8 May 2023 18:25:18 +0800
Message-Id: <1683541521-25835-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102432

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.2.0.bb => python3-web3_6.3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.2.0.bb => python3-web3_6.3.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.2.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_6.2.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
index 8e09cabbbe..3c617b2163 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "7695ee81162c644de0dfd0f5372f96a73be557b46365d218f581ca10197c6389"
+SRC_URI[sha256sum] = "d13f17d18eaacd87f7d233b4b2c70d1579b39573628b71ec996adfcd4dac9cab"
 
 inherit pypi setuptools3
 
-- 
2.34.1



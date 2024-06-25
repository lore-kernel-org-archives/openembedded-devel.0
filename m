Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF38C3065C
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:25 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.167235.1719305840617764541
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=do7qKWHi;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305840; x=1750841840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xhen7UwiEVw6JMI4UgiT6lpo/F24srdPX18m1jLOPEc=;
  b=do7qKWHicUgEZXT57u00wFmGY9qvovDpwHybQ+4ZmNOiDZg7amNgrWk2
   wqYx2oWof9GZGiuhUjyGMh95PIwQlLv8ZwkBaNUbmRPFGOGzH+Uky1Awx
   yTUvzPI8gzxwSEnJnEAZko1HDb2Nd+8tkPRLUk4WNSwTzHF1xT/EPeCvq
   IMRKqecCKGGunxJHGgfDeu1/8jC/fHPbYrFuQCq++bXUA5B4m0KWglJTa
   S/kx6LN0R+K7088yoRae47l7dckovD6o3X9rEU/Q+xPwra5ev42U3fR2q
   rWtXwlmLhWV7h8Enm6GK2YOwTKcbhEqySeteu5ZkpSb6VgrCnsmTtL7dp
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164960064"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164960064"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:18 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 78308D6473
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BEC6439FD5
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C7D72007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0C1A31A0002;
	Tue, 25 Jun 2024 16:57:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/57] python3-google-auth: upgrade 2.29.0 -> 2.30.0
Date: Tue, 25 Jun 2024 16:56:04 +0800
Message-Id: <1719305790-11484-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--3.934400-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yaoXHZz/dXlx9v33UW8WNYA9k3nicjx0THig
	8HCMVVLu8MdX6WBaNTQolL5A4P3oN7ejROPl/CmSuLt50vtxBA4LwteD+QnyUKMQi364g884g7p
	FKYaundT7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBCE2NlBjIjcUJ52LFhfM6tr/U
	Mw7Cm/1+LzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUUWcuRfDA0pdQSAZCxbS6fzbAX
	je7nA70ipAlSNvWbUjV57qOkzzGdkW8KRN/fuUejEpBKkTCIZnCarJwlc3XD7wbolXv9cUu7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111044

From: Wang Mingyu <wangmy@fujitsu.com>

Features
--------
- Add WebAuthn plugin component to handle WebAuthn get assertion request
- ECP Provider drop cryptography requirement
- Enable webauthn plugin for security keys

Bug Fixes
----------
- Fix id_token iam endpoint for non-gdu service credentials
- Makes default token_url universe aware

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.29.0.bb => python3-google-auth_2.30.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.29.0.bb => python3-google-auth_2.30.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.29.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.30.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.29.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.30.0.bb
index e8d438df0..c51be1650 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.29.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.30.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "672dff332d073227550ffc7457868ac4218d6c500b155fe6cc17d2b13602c360"
+SRC_URI[sha256sum] = "ab630a1320f6720909ad76a7dbdb6841cdf5c66b328d690027e4867bdfb16688"
 
 SRC_URI += " \
         file://run-ptest \
-- 
2.34.1



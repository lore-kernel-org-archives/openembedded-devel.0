Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CC9C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 04:15:27 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.64824.1679544923279151943
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 21:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Etxaljl0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679544921; i=@fujitsu.com;
	bh=YZYCABol7TBb4AELjKvr2/y9ONKfDqQi6iZJ40+BKAU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Etxaljl0mPa67LH+dpy3HwcXP79GgmXALOK7Ol/VA0GHpav++je5Cd8KZDVQ8q70j
	 b9VCRxsMgjxbGRYTNVRuIVx4kh8e5Qul0VhYaEXT8xs3QFsfnzXjS5HyMUiqZL8JiN
	 tkil+4cz8yKmlGUdMV4DS/wb6nTlXL3xb/TYQbJ8aarpiuUCaC6cRJ/xYyqs1InC7h
	 +TbNU60962oRyv586Bjk2i/gaQyCdqe1tmLAtuEWw5gI9ys/HJnG0GAPf9kI692FhD
	 v0grpPPl/9Q7NL0WdM+QWTbRW+mhifghNx7I3n8Drsc0KhgGKdqdj/vtqJYFw8FUg4
	 iw9c6qDODVh0g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSTfiknS
  KQdcaY4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePVr6NsBQs4Kh4v/s/SwHiEvYuRi0NI4Amj
  xM5bW5ggnOtMEvuvPoXK7GGUmLJnPVCGk4NNQErixv3/bCC2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhAXeJ9pZvLCA2i4CqxOm5a8BsXgEnic/HnjKC2BICChJTHr4H6+UUcJaYO6kbzBYCqmlZ08
  sMUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukGicfogJwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itGsOLWoLLVI19BAL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0Uv
  L7VkEyMwfFOKGZN3MF7t+6t3iFGSg0lJlFciVDpFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvz
  kWgnGBRanpqRVpmDjCWYNISHDxKIrxzDwKleYsLEnOLM9MhUqcYFaXEeWNB+gRAEhmleXBtsP
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYd8Z5oCk8mXklcNNfAS1mAlocN0MCZHFJIkJ
  KqoGJ8fOVq0sv8swqNYqvfGjvkvL5QVzIbcbb+7KuJ1zcv5Un/6GB4x3Dwxtf/Pn0MVm45cGz
  jT0bLrDfPFb2Yufv6OwtidUbHUSCArce5Hq7c+L70Buq0qdNurh3flo7f2taukWo64eDgfXMM
  i9/84btvbC42OZ5yFy+rScW1Jn+Dp/Etvvq3QlK73Z7l8mv14zb8fNasttuKQnVlGOrjJ1OnC
  zh1PTt4BBbF6FytvG0gMnKuDlvT0q67zrMfUT2pHqg8INPGdJ5G6bMWq2//b9t3o5S0y03NpR
  4vBJ8dPWr1O/sDyn2K3kCntjmfJy+pnf5zetVK3cXbFQtlfywSsPgqdj8/Yqx4iqPdWyvv2s8
  d1mJpTgj0VCLuag4EQD4BgYgWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1679544920!170250!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32653 invoked from network); 23 Mar 2023 04:15:20 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 04:15:20 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 72C191000EE
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:20 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6656A1000E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 04:15:18 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-apt: upgrade 2.5.2 -> 2.5.3
Date: Thu, 23 Mar 2023 12:14:40 +0800
Message-ID: <1679544881-19951-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679544881-19951-1-git-send-email-wangmy@fujitsu.com>
References: <1679544881-19951-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101645

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-apt_2.5.2.bb => python3-apt_2.5.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-apt_2.5.2.bb => python3-apt_2.5.3.bb} (90%)

diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.5.2.bb b/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
similarity index 90%
rename from meta-oe/recipes-devtools/python/python3-apt_2.5.2.bb
rename to meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
index d95c60f81..1d54b9f6a 100644
--- a/meta-oe/recipes-devtools/python/python3-apt_2.5.2.bb
+++ b/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 SRC_URI = "git://salsa.debian.org/apt-team/python-apt.git;protocol=https;branch=main"
 
-SRCREV = "e78d37eec72fe3afd28db17d5ea7a705bb4e3ce9"
+SRCREV = "3252935b6224b3bd2e2250894b9559b47c61b2e1"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



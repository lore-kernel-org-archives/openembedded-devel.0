Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AE8D7833F
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8203.1733185015403613953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s8qNLjBP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185023; x=1764721023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gRgxMkx1Rs+WSpHEpfwgh95jeX1v+jpQIgxyjBcf3oY=;
  b=s8qNLjBPLCu/eSYy1EWbqIwNCyeAPd5/bLcQ0bRsfpRM7GNmgHx9T4/7
   Ud68eg5lYTUcRIUUCPH431x/eE9crQCS6b4IJ2PEdpGGAIr0N1KTm3j/v
   hIxi7f+zfkAIjj3outxfEh0KEqc/3eQn3cEyejidOkhBEbzjj0FBMzXEs
   elZjUSeb0XuFZN7oJdUXnxcCsdP9QtFCbWRsz6JbsXH8OhpIBd8t1dQ94
   fT+LMuXb8mxjifkn8FmP6LilTVvvpvFc5sjEPf4sIHJmbN0eTnOYnSjmg
   TgdNNYteGwjWvGx5gzY8gH0BCoEfbTkYaoxjmacMobElp5ryI1Iymus7m
   A==;
X-CSE-ConnectionGUID: jM+/pJgCTA6eNfK6Z/Grow==
X-CSE-MsgGUID: 18QnAA1MSVSCZron+ZUOQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="170368335"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="170368335"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:02 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 92F4ADC691
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 69D3AD73CD
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EFDA96CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 906DF1A0003;
	Tue,  3 Dec 2024 08:16:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/34] python3-portalocker: upgrade 2.10.1 -> 3.0.0
Date: Tue,  3 Dec 2024 08:16:29 +0800
Message-Id: <1733184999-27041-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10-1.806400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrzoS4pqkGrkN0z1Vq9LTccL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIdYoCuk2yPknlxuQ3RkCmi6s+uS4/lX/BVRY
	T0tQvAINOIxXamh4YJxwqA126/qR4NFp2ATPCuo/Lwmj0GP9BTCKAbSEVBIwH+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114165

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Completely modernized portalocker build system and added fully strict pyright
  and mypy compliance with ruff formatting and checking.
- Dropped support for deprecated Python versions, only 3.9 and up are supported now.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...thon3-portalocker_2.10.1.bb => python3-portalocker_3.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_2.10.1.bb => python3-portalocker_3.0.0.bb} (89%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.1.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.0.0.bb
similarity index 89%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.1.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.0.0.bb
index 8c03398ed1..6bdef37482 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.1.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=152634da660a374ca18c0734ed07c63c"
 
-SRC_URI[sha256sum] = "ef1bf844e878ab08aee7e40184156e1151f228f103aa5c6bd0724cc330960f8f"
+SRC_URI[sha256sum] = "21f535de2e7a82c94c130c054adb5c7421d480d5619d61073996e2f89bcb879b"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1



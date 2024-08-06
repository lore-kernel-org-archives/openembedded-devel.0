Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33643C531DA
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2884.1722934017995171001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W34tLQXP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934023; x=1754470023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HXVDz8ca/CQpvKAcI17OuP76QIIPBrPwJWaECA26EXo=;
  b=W34tLQXPVPvN8N4HEVLCQY/fRqLvIoFE+kH+e4GYlDnynmTUOZuMk9WK
   Hhky5pjU1F3LmxvIZ0ovTMl5YEwb2dIPf8O1dZxxv1tmX5oKSMm02yao3
   MPm3+PiMopE7BORjt4RkpqPWh4ctBFA7+UOhmB8naW9dzoOIMD/b2I2iZ
   VpkNMrkoUVUGO9RHQfuRwG+DCESWxougN+6pi2hZJwBwOOaLphbYsZGzA
   8oH0S/Jh3ht+baRsy+UJ4ejloobjUZYXlq41wK9xOhHaa5V4YrEOx2PGz
   81AxcoV1VwjOcbyOoMGPWGKTRYtaRNcOI6J+iN6fo1HaG0ea/3gXKXpdT
   g==;
X-CSE-ConnectionGUID: mY2lp69+S2ikX4hktQR7gA==
X-CSE-MsgGUID: pA0XWQqmRXCyzcBccGFWsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="148811727"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="148811727"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DF137C68E8
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 363B5CFBB4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BA80420050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 69EBB1A0002;
	Tue,  6 Aug 2024 16:46:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/60] python3-pyfanotify: upgrade 0.2.2 -> 0.3.0
Date: Tue,  6 Aug 2024 16:46:15 +0800
Message-Id: <1722933994-32549-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.159800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZOjf3A4DTYuF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrUJTNVBrU3p4fLM7fZrm17sg5XhBS0TCc0sJrNWIOb+BHva/kmnspb0qRc
	WsP6s7YI15cXFiPN19cPIJJtJFzHtplN88nOES3R0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111556

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyfanotify_0.2.2.bb => python3-pyfanotify_0.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyfanotify_0.2.2.bb => python3-pyfanotify_0.3.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.2.bb b/meta-python/recipes-devtools/python/python3-pyfanotify_0.3.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyfanotify_0.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pyfanotify_0.3.0.bb
index 292ceab2e..214e80635 100644
--- a/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfanotify_0.3.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=636a36c9df04efcfacf839b8866d9a37"
 
 SRC_URI += "file://0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch"
-SRC_URI[sha256sum] = "90219aa9f8b78fa732f24aa7b21c7bb6ac97a6eb47f1763c899b8194e23af1df"
+SRC_URI[sha256sum] = "95ee17caec25436e10d59d5d45e28d2dc659819cc6de55f29fcbdcd5ee2fa8d3"
 
 inherit pypi setuptools3
 
-- 
2.34.1



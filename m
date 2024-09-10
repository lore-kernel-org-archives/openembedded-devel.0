Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832ADEDE9B1
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.18597.1725959013737955438
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q35uCYYp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959014; x=1757495014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=h6rdzoYwpE+Dt+q7eIWjlIrakla44+dHHYYKwi4MCcQ=;
  b=q35uCYYpAthGfeQLiBWK/nqrILHmDaWOaS0YIT3CmDMnYodvDdPqkBjg
   UicIGvO2/KXCXBEwL3UZYzdP3PRewbDiJgJr75uuOmcuzb9406jI59GHl
   SgHJDcxMdKUsTwmFIDnJCg8MJTbtFfCXv7ekk0sykUov/GplVH4Vwiu/U
   EI6q0A1GzL8qePJFaZOcqkrmwn+NJ7C0y4JFAvhvlkM3yC3lGbBnkcCrS
   e8MioBl283c3KUwQ9Jt4Kw3jvwtqjxFzJqeE1SbqBVqqdHK6zI4AE8vyG
   jSig7GyrAP7zUHr+A8C1Ev/PA4LsWbvz273Hqhhg7q5MpqyflfKOYhBvo
   A==;
X-CSE-ConnectionGUID: Qw2TlvKgQYupIWFoPBNMAg==
X-CSE-MsgGUID: 1nR+jYbkTtOgp6wYurXtuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173214182"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173214182"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:32 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B0B95D4256
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E818AD8B61
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 762C16BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 28A1C1A000B;
	Tue, 10 Sep 2024 17:03:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/42] python3-pulsectl: upgrade 24.4.0 -> 24.8.0
Date: Tue, 10 Sep 2024 17:02:54 +0800
Message-Id: <1725958990-5719-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrSnuE7RkWASZDC4HJkDXDgqNaZLPnMQQefCbaDbTqG9iST60a4mJ9SIWfi
	a0LXdodABG8iY4Q+tpo1IiLxG3XbeLmE2yxjzITh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112212

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pulsectl_24.4.0.bb => python3-pulsectl_24.8.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_24.4.0.bb => python3-pulsectl_24.8.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_24.4.0.bb b/meta-python/recipes-devtools/python/python3-pulsectl_24.8.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_24.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_24.8.0.bb
index 3bc15bb08..580d41d0c 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_24.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_24.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "697ed50e7d452e78678ae38e2ab935843008bec448955283cd0fb362867e3165"
+SRC_URI[sha256sum] = "b051506d0d73d3cc4357cefd3de17bb859d7ecf004e994b0f7cfa87851bc7156"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.34.1



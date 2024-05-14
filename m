Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B92C27C43
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.10792.1715677842681277931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sxF+q8yr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677843; x=1747213843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=T4PCB/xMfNqHFOIlJGpAvcJhzE7SxrERvdWLXI5kXBQ=;
  b=sxF+q8yrGRea5OhzSIeqVZVbKwJ6FOiSMDkYYjpFq9vRoIGIeGJUChBe
   F5BvOONgsB6p/LoIA9xej0Bny3ykwCgipStzPE/Bn9hcYm232kzK71rcs
   7qwiD3l8yjI6rO3wliDIjQt73xUReyQpazvOa7qCrugdWvLoRRzuqWETJ
   U23a7mKNadtQqEnukZUZNuK3W6uE9goh69X3YgTS595rWBmWaCmUCzVGw
   eB+UMHCZG900+1KQMJm7eWGWZ96ThLMSLKsfH3HGgS1i7PVizKDdbsHU6
   DJxzMPwQpKjOot4XwSWZyxGTs4gMYxwZojKlAZM9Ww82/EYFQEfby5Z9F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="158534881"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="158534881"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:42 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BF57E8FBF
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C50FD52FD
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DC346BB7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AFDBF1A000C;
	Tue, 14 May 2024 17:10:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/44] python3-virtualenv: upgrade 20.26.0 -> 20.26.1
Date: Tue, 14 May 2024 17:10:12 +0800
Message-Id: <1715677817-2223-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzB+/zX4wvEsLUTS
	38fpc3DYWnkwAyoHF6PqbJuyrz7lHUk8EqWZ8JVEcGMJgRPXQvrniKXAqIY74a0nMVDc+0CO0mR
	1zc7fs9iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110383

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 fix PATH-based Python discovery on Windows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.26.0.bb => python3-virtualenv_20.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.26.0.bb => python3-virtualenv_20.26.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.26.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.26.1.bb
index 55f7f4611..ceb5f30ab 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "ec25a9671a5102c8d2657f62792a27b48f016664c6873f6beed3800008577210"
+SRC_URI[sha256sum] = "604bfdceaeece392802e6ae48e69cec49168b9c5f4a44e483963f9242eb0e78b"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1



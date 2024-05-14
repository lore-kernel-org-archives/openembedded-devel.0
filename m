Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4ABC27C5F
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.10791.1715677840073324735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hprtskct;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677841; x=1747213841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=d6rnvgG+t2q+PJCE9E0hCcg849osfqi/CAhO/ruK1EE=;
  b=hprtskctdPm3/bhuEgH+QVeAz6qe3Xm+1VU+ypoeNEy6N0aHwABojmfv
   /Wor8jrQaJISWmKlb+GRmkJ8hj7z7ITdkCsaTLXDHDm6kMiT+eANwtG9+
   vgZytKI0UMQlqEIk6xA6v2vD/YW745a4uiQAVzBOxh2Ms659VwiVoaKUH
   Zr8keWROS1NY/ek8gK8RtfhwtvcN0cBegotVrGt/+ErtbUMqiSZw4r8f6
   Dp+zM9rlRRIXR/XAGAg23kDBxjyalz800TP+JQucO0vSsqZA3+MI0Kh4G
   hyf5jHW25EXmM5eH84B0ytNKGKWD3mL3v+pfiGkPL9NxozTGkshpEGDtj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="158143143"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="158143143"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:38 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F3F45C3F90
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33DB8D3F2C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BCF4E20076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6A6ED1A000B;
	Tue, 14 May 2024 17:10:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/44] python3-marshmallow: upgrade 3.21.1 -> 3.21.2
Date: Tue, 14 May 2024 17:10:01 +0800
Message-Id: <1715677817-2223-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-0.134100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfMYI3VZ1fpPn76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzc3HRTVImOBLhfJ
	+Ja0uVR6baHXOFwu6REtV6bC/gJUG6bF3OWvvzhH9T/kpmNq53xj46rlWudQ6lEMpI/TKHVnkh9
	iTkQOCEiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110372

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Allow timestamp 0 in fields.DateTime

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-marshmallow_3.21.1.bb => python3-marshmallow_3.21.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.21.1.bb => python3-marshmallow_3.21.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.21.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.21.2.bb
index bf1d8dd29..11351230c 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.21.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "4e65e9e0d80fc9e609574b9983cf32579f305c718afb30d7233ab818571768c3"
+SRC_URI[sha256sum] = "82408deadd8b33d56338d2182d455db632c6313aa2af61916672146bb32edc56"
 
 inherit python_flit_core pypi ptest
 
-- 
2.34.1



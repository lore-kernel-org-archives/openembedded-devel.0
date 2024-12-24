Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837E8C02189
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.30504.1735032439941691626
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UzZ6yCaN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032441; x=1766568441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XbqRTx8iDwXHeqLM23gvukty89ms7tYqiOL3L/FisMA=;
  b=UzZ6yCaNpEN+6frNhpa0KpB3xD13JbFrkB72e0h9zd7+BGMeeYJitLVi
   oW8mV6YfJOunNuzmzcEO35o3xozhvCvv0cYkOp0MKA2KCbfYrz6Ou62Ge
   RinuP0PQNKZr82Lb4sL9CH8jPpLMIZZ7KrrneqPBD2YdYOkSjd44Jz2IM
   f7Q8HUh2cqe5XMq9wJwUHg0ALEIRACAPqXaAGJjdFF5BPoy6i1UxY0r2k
   HgQ5XmtBOlnirLmZw7JCNqJbYc2crUNktzKYFxAByulknilPg+YB9NSUd
   eIahKROeW1vZb8HnxmUH9j9Z5hFOW9ovW3TdoUj1hpJcxt/RbZGLoo444
   g==;
X-CSE-ConnectionGUID: II8sCI4ISxCzFgfEFAzoeg==
X-CSE-MsgGUID: gEFmuvqvTWWYcs+y4/HuZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184809903"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184809903"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id ECF0CDBB80
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C0EAED6FEB
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5733C20071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 008F91A0071;
	Tue, 24 Dec 2024 17:27:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/67] python3-cantools: upgrade 39.4.13 -> 40.0.0
Date: Tue, 24 Dec 2024 17:26:06 +0800
Message-Id: <1735032421-13513-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.515900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrJ4cwIYL6Kud9MesWtSDfsv4Q
	R/7oUDJy4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzmwAc+i+8n/hIUc
	j30DNjS1eUrxWfDsWLcO+OyXafo127kgZNSj7QnQ7W92TWMo3p+BsO0uOxzVpHNFujktz+W7Up5
	fbC18yfiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114484

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- When parsing DBC, use long names in SignalGroup.signal_names to match Signal.name
- Raise Minimum Python Version to 3.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_39.4.13.bb => python3-cantools_40.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_39.4.13.bb => python3-cantools_40.0.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.4.13.bb b/meta-python/recipes-devtools/python/python3-cantools_40.0.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_39.4.13.bb
rename to meta-python/recipes-devtools/python/python3-cantools_40.0.0.bb
index fa9447b918..285cf1a12d 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.4.13.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_40.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "ad84fb561f5ab20ccd2a45b7fcb29093008f6c8981c9f636f2d94613ed37c3d1"
+SRC_URI[sha256sum] = "5b2d2d7c501ed8903bbc8104e288cef4c29dee6f58bb662bc74bd8be03d59ac2"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0



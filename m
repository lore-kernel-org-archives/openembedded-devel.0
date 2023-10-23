Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFF1C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:33:15 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.136300.1698103992775925455
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="136742644"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="136742644"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:33:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 31576D63C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:32:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66906D3F01
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:32:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F36F2005A580;
	Tue, 24 Oct 2023 08:32:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-simplejson: upgrade 3.19.1 -> 3.19.2
Date: Tue, 24 Oct 2023 07:32:35 +0800
Message-Id: <1698103955-31625-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10--1.048900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrK2GKtdiFmTly7J/20Uor5GRI
	etAazjIt4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054zP3WYNhkszl1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrYxWqC+Pt4RVtVR+6D5Gjfj7OQy5lRA1mwe7B1z3LJbEACFIW+7BdDoedgFYC8tyYvKt4
	zA75r/nLSpPp+sHshxxsLu6KKUHZx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105693

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* Updated test & build matrix to include Python 3.12 and use
  GitHub Actions as a Trusted Publisher (OIDC)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-simplejson_3.19.1.bb => python3-simplejson_3.19.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.19.1.bb => python3-simplejson_3.19.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.19.1.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.19.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.19.1.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.19.2.bb
index 1fb31a3a3a..91f6b35b32 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.19.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "6277f60848a7d8319d27d2be767a7546bc965535b28070e310b3a9af90604a4c"
+SRC_URI[sha256sum] = "9eb442a2442ce417801c912df68e1f6ccfcd41577ae7274953ab3ad24ef7d82c"
 
 inherit pypi setuptools3
 
-- 
2.34.1



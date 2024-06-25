Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64793C30653
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.167244.1719305852975534140
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YVn8ublM;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305854; x=1750841854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VIm6/G+I+a2K9qCVUgDEKXnJHDRJklKBY2iVkHi22GM=;
  b=YVn8ublMliIgxOnZpQcdPi0e7CrIOqQBITRORca2dEIcvvxbf+BU67Lb
   T2BQ992yR55alddA5u/n5ZrsXNpPRiD4cYWIgjoglqvN/AV4Z6FV40lNM
   WA6i3BzMcK38nTIhr5VS2ErA1Y8eFwmdlL/v1Gt9kelIlr8dzCHkkc7wo
   S8ASnaqa+dcRjXnMYQ3I80h9O9YRJYBu7ZdKH8aunLPVqRTA4UdjcGG3A
   Ee266VtjIelxBTn3y/H3AHFRGRDsUyjdDOmBuI5w1iBGgOVHse02LVYcw
   lZhvz88BIbQFQI0gJD3xodEHImU6V+vGpgd8QXHYQX/E8FDPgVpnB97of
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152254731"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152254731"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4E08C9442
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 135AED3F1D
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 92E0F2007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 412CD1A000C;
	Tue, 25 Jun 2024 16:57:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/57] python3-responses: upgrade 0.25.0 -> 0.25.3
Date: Tue, 25 Jun 2024 16:56:21 +0800
Message-Id: <1719305790-11484-48-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--1.691700-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mr5sPqcQkI8puVDBAppAT/pRM8
	+aSWc/4YQh0b9U3KO4O0GMio4US5bx7nDYy2/WAD9k5nZzZVBSAxVUWGXs3C83hh5KUdlgWiyxs
	v6nTa6368B2XPfPGvpg3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXtLALfOrPJxRpEX
	AOzwbtMeLzNWBegCW2wgn7iDBesS3fd+P6wwCt85Rncg/kBNofz5QBgDhdb2hbRUjcPX9z5BWUQ
	f2w42YXXA62Avqm6em/KZ2gfPYFmnSIefYbotLZMj6U8Jgel1GEeK/jmrbQ8pGK5pFQkuRN/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111060

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fixed 'recorder' not saving and loading response headers with yaml files.
* Mulligan on 0.25.1 to run release pipeline correctly.
* Added 'matchers.body_matcher' for matching string request bodies.
* Fixed tests failures during RPM package builds.
* Fix mocked HEAD responses that have 'Content-Length' set.
* Fixed error messages when matches fail: inputs are not sorted or reformatted.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-responses_0.25.0.bb => python3-responses_0.25.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-responses_0.25.0.bb => python3-responses_0.25.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-responses_0.25.0.bb b/meta-python/recipes-devtools/python/python3-responses_0.25.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-responses_0.25.0.bb
rename to meta-python/recipes-devtools/python/python3-responses_0.25.3.bb
index f4b59c750..50835883d 100644
--- a/meta-python/recipes-devtools/python/python3-responses_0.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-responses_0.25.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e601511a8517f4daf688a8eb95be7a2"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "01ae6a02b4f34e39bffceb0fc6786b67a25eae919c6368d05eabc8d9576c2a66"
+SRC_URI[sha256sum] = "617b9247abd9ae28313d57a75880422d55ec63c29d33d629697590a034358dba"
 
 RDEPENDS:${PN} += " \
 	python3-mock \
-- 
2.34.1



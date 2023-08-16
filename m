Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1536DC001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:50:36 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.151938.1692150626605797971
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107044807"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107044807"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:50:24 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 70C75DA68D
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:50:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A228CD9471
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:50:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2752B21D167;
	Wed, 16 Aug 2023 10:50:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tox: upgrade 4.6.4 -> 4.8.0
Date: Wed, 16 Aug 2023 09:50:09 +0800
Message-Id: <1692150609-5950-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10-4.309100-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrelWD1+Z2pWeawtBEBljY2ZOu
	v4LVY2bF3pdoV72Pca8fc60DKktRRoR7tpKGAI1hHWRJEfGP5nlWeosqrJexbxPiIPO2d8g50EF
	5bRA2V8ohf5SaZLASRw3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3vsWi
	BRDS9X2IGQRIwjTl3iKI5/U0OcIj6tYv/FAmebjp4CIKY/Hg3AWQy9YC5qGvwvM/mydp5vVCq2r
	l3dzGQ1SAWZAceinWZR3v+vxJ8AqXyaUazGAQz06fNOn657ZThV/WtNOtOrWOuqbMtRdJaJzsaZ
	Bprcgt5DR+/efQYfPKSwVyl9ASohMRz9DWDwl39T8kIhOa6FLuhls0Ue1sh0+XjeI9Ygkw/HBNP
	v3tVqDw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104400

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Features
--------
* --override can now take options in the form of foo+=bar which will append
  bar to the end of an existing list/dict, rather than replacing it. (#3087)
* Make –hashseed default to PYTHONHASHSEED, if defined 
  The main motivation for this is to able to set the hash seed when building the
  documentation with “tox -e docs”, and thus avoid embedding a random value in
  the tox documentation for –help. This caused documentation builds to fail to
  build reproducibly. (#2942)

Bugfixes
----------
* Update a regular expression in tests to match the exception message in both
  Python 3.12 and older. (#3065)

Improved Documentation
------------------------
* Fix broken links

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.6.4.bb => python3-tox_4.8.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.6.4.bb => python3-tox_4.8.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.6.4.bb b/meta-python/recipes-devtools/python/python3-tox_4.8.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.6.4.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.8.0.bb
index a8215a91bf..ab69d2119b 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.8.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "5e2ad8845764706170d3dcaac171704513cc8a725655219acb62fe4380bdadda"
+SRC_URI[sha256sum] = "2adacf435b12ccf10b9dfa9975d8ec0afd7cbae44d300463140d2117b968037b"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1



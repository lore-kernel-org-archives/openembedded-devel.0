Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE16C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:51:55 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.6918.1704721906056026964
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:51:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="124859012"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="124859012"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:51:43 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 91ADCDCC15
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:51:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 82213BDA54
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:51:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BF00202D4B74
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:51:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C2B2B1A0072;
	Mon,  8 Jan 2024 21:51:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pdm: upgrade 2.11.1 -> 2.11.2
Date: Mon,  8 Jan 2024 21:49:49 +0800
Message-Id: <1704721789-30860-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--4.668600-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysKQkPoOQdlQ5gU
	Ly4zAbFB+l1YtaXbEaEyl/VpOQJNJePKx9xigCZhWCjDJRYeAZ1s3nDs8bPg3UDM9hRIPPFMAy7
	Fge6wFltG2rHDHK0oTmTxPD9nAddZPXdZx1sZHpA/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bqSdDmDK09MpiExNx1Upv4V4HMSQIKmdGW9OepgphdNGVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDXSWl+NGKKHpEPLywlp9rXHWiLRnVps9Ak93bqTJqYQCIXlBbWb6RF++bnx
	PyqrqVXWHBpjPdasQ+Ra8xbIoU8XSJ3UwY2+cr3o4DGSOCid9FPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108158

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix a KeyError raised when resolving a URL dependency without package name given.
-pdm update --update-eager can hit InconsistentCandidate error when dependency
 is included both through default dependencies and extra.
-pdm install should not warn when overwriting its own symlinks on install/update.
-Fix a bug that candidates without local version are rejected when the local
 version is pinned.
-Add maturin as a compatible build backend in the docs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.11.1.bb => python3-pdm_2.11.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.11.1.bb => python3-pdm_2.11.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.11.1.bb b/meta-python/recipes-devtools/python/python3-pdm_2.11.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.11.2.bb
index 5ff6ffc9e..f8a593c2b 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.11.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "b10bc4e5394856f1639ddc9bc754d9c26323ec5b828a135c6ed35f935b054b83"
+SRC_URI[sha256sum] = "5b31255c48d4aca596c73fb872a82848cbe8ff92f008712a9a264455247063ee"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1



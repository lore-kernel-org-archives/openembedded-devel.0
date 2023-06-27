Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F174CC001B3
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:24 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7508.1687850063027547518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101719698"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101719698"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DF9ADDC60
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:18 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 42310D9471
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:17 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 589C288C9E;
	Tue, 27 Jun 2023 16:14:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-h5py: upgrade 3.8.0 -> 3.9.0
Date: Tue, 27 Jun 2023 15:12:10 +0800
Message-Id: <1687849939-19941-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10-1.025100-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrKQNhMboqZlp3de2OoBqgwuIj
	0uEwk0o6O+yvYL/BOfFYOsVwJE0bVz879zET5UZxSCtgxgcsrMrYUDvAr2Y/111OAfq6beiuve7
	lipYRMOL0YXQzpNvE/Dzhyc0ROyJb3huBcHFqgEtg/IrbTV5uG7cDdFQ3mmWj0/tWY/sOuvr1LU
	ghmjVzq7wHZc988a+mDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4Ixtofra
	Cyyl8ERgZBEjCNOXeKCtIT5k+duPjsE6PWVyEks3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTKYOc
	jnHaFYKOhzOa6g8KrdrffFiWS/I3bLj1Ez7F9x6jZz00Otlyg2ms9to+Y5sMWk/ruJqk46xQtrC
	E126Aomld5UFKInj5nvO99BQQuOr6aE8CTb2COh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEV
	M/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103604

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
New features
------------
- New out argument to read_direct_chunk() to allow passing the output buffer
- The objects from Dataset.asstr() and Dataset.astype() now implement the
  __array__() method (PR 2269). This speeds up access for functions that
  support it, such as np.asarray().
- Validate key types when creating groups and attributes, giving better error
  messages when invalid types are used (PR 2266).

Bug fixes
----------
- Group.__contains__ and Group.get now use the default link access property
  list systematically (PR 2244).
- Removed various calls to the deprecated numpy.product function
- Fix the IPython tab-completion integration in IPython 8.12
- Replacing attributes with AttributeManager.create() now deletes the old
  attributes before creating the new one, rather than using a temporary name
  and renaming the new attribute (PR 2274). 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-h5py_3.8.0.bb => python3-h5py_3.9.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.8.0.bb => python3-h5py_3.9.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.8.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.9.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-h5py_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.9.0.bb
index 3436444695..834bb031ca 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.9.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "6fead82f0c4000cf38d53f9c030780d81bfa0220218aee13b90b7701c937d95f"
+SRC_URI[sha256sum] = "e604db6521c1e367c6bd7fad239c847f53cc46646f2d2651372d05ae5e95f817"
 
 SRC_URI += "file://0001-setup_build.py-avoid-absolute-path.patch"
 
-- 
2.34.1



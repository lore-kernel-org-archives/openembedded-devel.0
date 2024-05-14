Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4933C27C51
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:52 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.10756.1715677840920283919
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QlgHHEvg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677843; x=1747213843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=X43VRkeap4k1/ihFa7lhlNGV8cSW2sO3g3pm10/+hXg=;
  b=QlgHHEvga1UCCU+4f4nSlZOUOhO5GbfWWc944RRV6dC91BE2S4fBIamc
   aiSafFeOghoFOWb0S0tj0pax2P9UAXp9zHKSQ9voRM6CMImLHNj5HnhuI
   qlMiEUC3AGC4x7LwWYyuQ2/Hrkck7LohX3/bmVRjVgmQK0ulsEwyP/+uI
   rcJC5uxwExKnRz6+bZ6HuRE9oNQr4CfcQiVBji9O1U2BJ4oKfB4shr+q9
   waTEVpnVmWWR/6N0vzp83EUI/KQU9TkidOHivWu68n85JiGwELU9fqZVY
   tn5QvBGwrWJ+aBUyTDbe2p9lrD8HNWNkF6JhkyRoVbMlqvv29BbonHXF2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="160257836"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="160257836"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:40 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 64FA9D648A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 635F0BF4AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E21706BB7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8FA401A000C;
	Tue, 14 May 2024 17:10:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/44] python3-nocaselist: upgrade 2.0.0 -> 2.0.2
Date: Tue, 14 May 2024 17:10:04 +0800
Message-Id: <1715677817-2223-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--3.488600-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yXtNecKMjy32F430d3dMHkbX1cRD6e4P5ICn
	q9qtGcvVWRXM1BNPHVP/HDP3Cg6YwbodLR4phi1Gs/Hes76OTZCoY3JCxWmLzHtzXL7lPwD/oHq
	HHTeoLjfP4H0W6YJcNw3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3vZzn
	Xqu/Oqu0NtOnQntmypmD7EwRGvQ1l4HMSQIKmdGW9OepgphdNGVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDVMVyeJoGsk4E23CrRsPkQnO0GIexHZWYlIEfaLGNJTv16Udsl4HhxeMBwl
	6QTP5SruQ+5bVnQViW/Nam1eVWXAyAOsbsCCCW6AcjH79gRLW1PJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110379

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
=========
- Fixed incorrect formatting of package description on Pypi by setting the
  correct content type in setup.py.
- Fixed safety issues up to 2024-05-04.
- Test: Removed setup.py based installs from "make installtest", since one
  of them started installing a pre-release of a package on an unsupported
  Python version. The recommendation has been for a while now to no longer use
- Docs: Added RTD config file .readthedocs.yaml
- In the Github Actions test workflow for Python 3.6 and 3.7, changed
  macos-latest back to macos-12 because macos-latest got upgraded from macOS
  12 to macOS 14 which no longer supports these Python versions.
- Test: Fixed issues resulting from removal of support for pytest.warns(None)
 in pytest version 8.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-nocaselist_2.0.0.bb => python3-nocaselist_2.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_2.0.0.bb => python3-nocaselist_2.0.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_2.0.0.bb b/meta-python/recipes-devtools/python/python3-nocaselist_2.0.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-nocaselist_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_2.0.2.bb
index 2ad42247d..913b8ac5e 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_2.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "456aa000c6777c5d21b029c52e532f94328d4fb4f15ad2a4dd3dd62db30b3892"
+SRC_URI[sha256sum] = "32708b700a1a53133e6bb5cc53332c9775b0c7c959a5f9725793171fd2f4c8a5"
 
 inherit pypi setuptools3
 
-- 
2.34.1



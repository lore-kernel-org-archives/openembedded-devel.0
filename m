Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B82C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:37:34 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.28407.1701160648815723975
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="120644041"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="120644041"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:37:27 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3485FD9D92
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:37:24 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 59643D600C
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:37:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3CC428418A;
	Tue, 28 Nov 2023 17:37:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pexpect: upgrade 4.8.0 -> 4.9.0
Date: Tue, 28 Nov 2023 16:36:43 +0800
Message-Id: <1701160603-28318-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10-2.156300-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyY5nVpihxiw7iR
	FJnWDxklN/cuMNJ8XfZFbebZCnXEXH2U5seg64uOEhGH3CRdKUXOhLimqQauQzABh2rVVNejHGp
	23bat06DWPKk1jTC1pjQwA+44CwCTGDQZKrJmqLo8o3fwIs8rQeTAXNPNyDOEIMYstsSWV71eBh
	h3au63WN1oYLFibAlwDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZe0sAt86s8nFGCQP
	hwcEhYnMjUwCpb+CccBjdk4ZVMC/61i/8UCZ5uOngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSqb
	xBgG0w5uZrB+7Sgenb9SaSRmgLVCPW/REYRjWtEkNwhCOHZREBXhcVBxcg+Ks9RzlI3BPnNBi56
	xglQUgrz5aWZ/wFwEsuz6H6U42sGCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107084

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add support for Python 3.12
-Clean up temporary files after UnicodeTests
-Add Python 3.5, 3.6 and 3.12.0-rc.1 to test matrix
-Set prompt correctly for zsh
-Add zsh convenience function to replwrap module
-Rework async unittests to rely on unittest.IsolatedAsyncioTestCase
-Make test_expect.py work on POSIX systems that are not Linux based
-Add support for socket, which allows sockets to be used crossplatform
-Update async to work on newer versions of python
-Remove deprecated RSAAuthentication option (SSHv1)
-Multiple CI fixes
-Use Github Actions for CI
-Remove pytest-capturelog from testing requirements
-Fix usage for Solaris
-Fix threading for new versions of python
-Fix documentation builds for use with Sphinx 3
-Use sys.executable for tests and wrapper, allowing the calling python executable to be used instead
-Update documentation about Wexpect
-Added project urls to setup.py
-Provide examples for how to use Pexpect and Pyte
-Coerce compiled regex patterns type according to spawn encoding
-Several doc updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pexpect_4.8.0.bb => python3-pexpect_4.9.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pexpect_4.8.0.bb => python3-pexpect_4.9.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
index ed2540608..6ee5b25bd 100644
--- a/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
 
 SRC_URI += "file://0001-FSM.py-change-shebang-from-python-to-python3.patch"
 
-SRC_URI[md5sum] = "153eb25184249d6a85fde9acf4804085"
-SRC_URI[sha256sum] = "fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c"
+SRC_URI[sha256sum] = "ee7d41123f3c9911050ea2c2dac107568dc43b2d3b0c7557a33212c398ead30f"
 
 inherit pypi setuptools3
 
-- 
2.34.1



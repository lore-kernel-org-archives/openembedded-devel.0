Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BF2CD12A1
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:55 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.39360.1711983105928809504
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fS30GcX4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983107; x=1743519107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OsSIppz22KLJVYP4yg1oQ+WD/nG4Q2UCBJwc6aGXkwo=;
  b=fS30GcX4GljA/f2UByqm0jTZR/XHcmuS4sxDhxzsSyDrAD51OUKZCFUf
   9932xGYvcu86aHzMf5C+0bkl5zZ4q8xTtA/KNa4efitLaxjfp+qd5bpUA
   ncwYLh4coRmsnHoing1pfotB0sUmd5dkupgV1/qADcr4TKJs8Sq0/5XIW
   ssJ8SNXlkGgbBO+YbdxvfQTLFBw9YcdpYAVX/5z5wPfXqxaxPUY58MsvG
   Uo2n5THJ8j9vXCNP+xbXuz51eQM7U+ld02Xuyzuay/BmdfYsMfurGI7oS
   Mxpj/3bHjWRLfDdrz6ZvMw89KNMe03JIm4KFhVLY0ucxAMfQQyjVW9W6Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="154246621"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="154246621"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:44 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 931FAE853B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CB408CF7C2
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5108B20093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 07BA01A000A;
	Mon,  1 Apr 2024 22:51:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/47] python3-pywbemtools: upgrade 1.2.0 -> 1.2.1
Date: Mon,  1 Apr 2024 22:51:05 +0800
Message-Id: <1711983079-16849-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--7.008200-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yUIIxwDaU5mrC//1TMV5chNcvdqWtCoykjnG
	P45AxioibYrLH2KRF5Hxk5wM/pTh1q0L8k+oKf2Mv0DcGXX8NxVr2qJoNIuCjQvrbFcH4G2rOxf
	QLcsk9qhoj7nB4dv1WEh3sqroFDg8DvX2Sk47fs8Fxov+3JYvYwNTuIWZ3z/FIiqlmO0FgHstbE
	BnKg+1LaIYNMF0ULvte+dbUwwNs/jv1ItBfIbu0BxA1AKmVGTOVBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOMKPrF7dK57On7C0ZgG5FLil6ppmExqcYlIOV
	A+gJRdKxfbhqGxLk+4Ay6p60ZV62fJ5/bZ6npdg7AFczfjr/7N9qGxiAaEMyIXSbq3FN6OlnrgA
	ux3cxDrD9zf96fH5eqnY+8z/LVng=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109751

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Increased minimum version of pywbem to 1.6.3 to pick up fixes
-Fixed use of pytest.warns(None)
-Resolved pylint issue on using max()
-Test: Upgraded GitHub Actions plugins to use node.js 20
-Development: Fixed dependency issue with safety 3.0.0 by pinning it
-Added RTD default config file
-Test py27hang with subprocess32 package pywbemlistener py27 tests disabled (#1341)
-Split safety run into separate make target and moved to end of test
-Test: Circumvented a pip-check-reqs issue by excluding its version 2.5.0
-Fixed PyYAML install issue due to Cython 3
-Circumvented removal of Python 2.7 from setup-python
-Set limit in requirements.txt to not use click-repl 0.3.0.
-Added package level to .done files
-Commits on May 28, 2023
-Add .safety-policy.yaml file.
-Limits on use of urllib3 to < version 2.0.
-Fixed coveralls issues with KeyError and HTTP 422 Unprocessable Entity

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pywbemtools_1.2.0.bb => python3-pywbemtools_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_1.2.0.bb => python3-pywbemtools_1.2.1.bb} (89%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.1.bb
similarity index 89%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.1.bb
index 89c05c2a6..c0a5368d1 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "921fb57ea2ae3ae2806e18895bb0457697f27221b345c8b05afa4cb304a7f939"
+SRC_URI[sha256sum] = "d2ad6c383490ddb3bbb0f737d23a07c7e8c345df65f8309bc554d8455cc913dc"
 
 inherit pypi setuptools3
 
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433E2C04FFE
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:32 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.6684.1714628970871473534
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U5XV7U/T;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628970; x=1746164970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0/8tOkZWh0jdmKlf+wxUViiQSTJzJTAolMHcJzjGT8U=;
  b=U5XV7U/TlVVZ9qG+p9OjL8rAMZ/9pdIRkPQJSw3X9ZGvl84lDED4KWZa
   2EQ2UQeSWbDxt5fhInfBeKS4uOIUKiFJy02+Rlqex58DoADcV/eYwFFeg
   QRmS6lkQWG7IBYQoK9uSnGchtts26hd7kXURP1VaAPWGhZic2uKixeNkq
   HFlFWbvl7ueVj/z0QzqL9HfWPLTmpIlRL62sl+OOWgHe+9Ewlo6GVHArr
   OYmlvny5NXw3Ozjc5UUJQZIah1YXXMe8INgMC4nXaA6wOtoU54BTHTLNj
   vvuyxxA6hfH6/gYInHGobL5EZCzcFAinGKL7z7DoXHfAU+OXa9s0XBriE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="136054198"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="136054198"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:28 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 54266D4C24
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 53C31E0C30
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9B722008BCDC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:24 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 873C21A0002;
	Thu,  2 May 2024 13:49:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/30] python3-ipython: upgrade 8.23.0 -> 8.24.0
Date: Thu,  2 May 2024 10:48:10 -0400
Message-Id: <20240502144829.241208-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-2.808400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrHLMdyB+LKtyZtziFUn+D+Xk4
	FaM3SiKeB35JUm0KMAANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w75Cs
	eIbMaQ/Wwv9qvfa7hhhuEaiMzfGrdQWLJeWonMo3hzb77xfeJUjcSBPAJmlijcF3lxQuIbFWl3n
	ZLo5wdiUv68X8FhVyxbjBuldNvkMkoq97WSHdFjfupJaud1uZCfRs6uIbkFVw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110219

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- pytest 8 compatibility
- typing-extension now needs 4.6 or newer. It was already the case, but not explicated.
- Attempt to speed running code under debugger in some cases.
- Multiple fixes to documentation for ipyparallel, simple_prompt and emacs
- Maintenance and cleanup of debugger

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.23.0.bb => python3-ipython_8.24.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.23.0.bb => python3-ipython_8.24.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.23.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.24.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.23.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.24.0.bb
index ebfd14722..23060f3d6 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.24.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "7468edaf4f6de3e1b912e57f66c241e6fd3c7099f2ec2136e239e142e800274d"
+SRC_URI[sha256sum] = "010db3f8a728a578bb641fdd06c063b9fb8e96a9464c63aec6310fbcb5e80501"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.34.1



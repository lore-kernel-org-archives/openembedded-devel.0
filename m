Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA74FD5F66
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 04:03:41 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98851.1775621018485666498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 21:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I5AJcdDl;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775621018; x=1807157018;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ia6jaSQVVO7gSbl2HzeZPc33N552Ad8KoCm6P2Sw8Qs=;
  b=I5AJcdDl2ivtJcNnyDdUV8ApUNikNaSsrQwH8ZCZKeKFb5RdOHeC4gLz
   Gl+TtFhdvANHLSo55iHFnOuUN2dG5CmOM6bKsBHv7BD4rCrkKAWMi/LlP
   71G+nr63ILb/jrEpS/1IaExtc/pQk42Vj3lH+bvr1VirvzTKAC8HtKD6n
   rg2PyYTfIByULMeTnTxCenmLB58JwefxJfXIJGioJezRb/mOONaBQ7gX3
   JB29Jx+uZnQYSSV5APMdePp6EkQSmzj+uJmOum6fRRlV+wbtBzJmA1hyE
   /7Tkwu6qC1SrGsYQya8a4XuYfUXr9a15v5A9Y9lqjq+myFSBYKxeB9WqS
   g==;
X-CSE-ConnectionGUID: vWjNE+N+Rrq/5DrMeeDu8A==
X-CSE-MsgGUID: THWbyqmSRYuuSqAg0LfJxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="223683811"
X-IronPort-AV: E=Sophos;i="6.23,166,1770562800"; 
   d="scan'208";a="223683811"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 13:03:36 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B10111002BA9
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:36 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 692B218002F4
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:36 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 277B88214FA
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:33 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-legacy-cgi: upgrade 2.6.2 -> 2.6.4
Date: Wed,  8 Apr 2026 12:03:27 +0800
Message-ID: <20260408040331.22227-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 04:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126092

Add do_install function to resolve following issue.
  python3-legacy-cgi-2.6.4-r0 do_package_qa: QA Issue: /usr/lib/python3.14/site-packages/.pc/0001-cgi.py-fixup-interpreter-according-to-OE.patch/cgi.py contained in package python3-legacy-cgi requires /usr/local/bin/python, but no providers found in RDEPENDS:python3-legacy-cgi? [file-rdeps]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...3-legacy-cgi_2.6.2.bb => python3-legacy-cgi_2.6.4.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-legacy-cgi_2.6.2.bb => python3-legacy-cgi_2.6.4.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.2.bb b/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.4.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.2.bb
rename to meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.4.bb
index 2b2840ae14..85328ed951 100644
--- a/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4b8801e752a2c70ac41a5f9aa243f766"
 
 PYPI_PACKAGE = "legacy_cgi"
 
-inherit python_poetry_core pypi
+inherit python_poetry_core pypi python_hatchling
 
 SRC_URI += "\
     file://0001-cgi.py-fixup-interpreter-according-to-OE.patch \
@@ -15,8 +15,13 @@ DEPENDS += "\
     ${PYTHON_PN}-setuptools-scm-native \
 "
 
+# Add this function to solve package QA Issue
+do_install:append() {
+        rm ${D}${PYTHON_SITEPACKAGES_DIR}/.pc -rf
+}
+
 #RDEPENDS:${PN} = "python3-core"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "9952471ceb304043b104c22d00b4f333cac27a6abe446d8a528fc437cf13c85f"
+SRC_URI[sha256sum] = "abb9dfc7835772f7c9317977c63253fd22a7484b5c9bbcdca60a29dcce97c577"
-- 
2.43.0



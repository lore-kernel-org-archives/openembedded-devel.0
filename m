Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F73AE7E35D
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 09:31:58 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8148.1775208715670212498
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 02:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ctbgEmXX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775208716; x=1806744716;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J5QQDJkLo6AsHfZXX/9xUab/eGYhPJ+SUitjzoeqF+4=;
  b=ctbgEmXXcMyzDhK5lY7WsiqeDwNl55MqrtywYaPW6gq/eRNU+on5D3cr
   3YnIDrOKdQ9bd70R6W8sRLKFKevn6JXFxUojtneyOr/U7FG1d2CLXNEOT
   Nov8bJOLe+CBQkaB4bkX5MqH3Ib9bz4J3pp+k7Hd41kPhkqMp8LY6SgH0
   a4fFVYpCNcGInkYib2lMJJx9dVkG9qVxTnRICaeHar+nMcenkxdXBbo/4
   IJePVwfY0nwRofTeLaXGBPXxVKSAYdiQOpzvQGN0YjW3zZ/XvWls3VINh
   XsGUxtl9ugURTSmS8Cy+9ahxu3Z+4vyvdNZ7VwidQvv5qYU/kEFUHurco
   Q==;
X-CSE-ConnectionGUID: eFgu1iuCS8OV0lwVm9t8JA==
X-CSE-MsgGUID: ANQrzkm8Rk2STUrvBX/BHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="224354299"
X-IronPort-AV: E=Sophos;i="6.23,157,1770562800"; 
   d="scan'208";a="224354299"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 18:31:54 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DEE10157E
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Apr 2026 09:31:53 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8EDBF1C00973
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Apr 2026 09:31:53 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5AC591003F5A
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Apr 2026 09:31:51 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-configargparse: upgrade 1.7.3 -> 1.7.5
Date: Fri,  3 Apr 2026 17:31:47 +0800
Message-ID: <20260403093147.16509-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 09:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125982

Changelog: Slightly simplified PyPI deployment workflow via setuptools-scm

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...figargparse_1.7.3.bb => python3-configargparse_1.7.5.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.7.3.bb => python3-configargparse_1.7.5.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.7.3.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.7.3.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb
index 6715abab3a..49df56d75b 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb
@@ -3,12 +3,14 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "76dd1a51145fb7ca82621ee08cd38ec0c6316fe27a38b9137b75667d1116399e"
+SRC_URI[sha256sum] = "e3f9a7bb6be34d66b2e3c4a2f58e3045f8dfae47b0dc039f87bcfaa0f193fb0f"
 
 PYPI_PACKAGE = "configargparse"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-setuptools-scm-native"
 
 PACKAGECONFIG ?= "yaml"
 PACKAGECONFIG[yaml] = ",,,python3-pyyaml"
-- 
2.43.0



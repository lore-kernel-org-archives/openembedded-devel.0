Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A6DCA1010
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8051.1756890208805506403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SidjFKHN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890211; x=1788426211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ur3DVSOGFplSiZAOuJkTeNnQbaIrFqJoEIhh/7R1Za8=;
  b=SidjFKHN4Tk/9gvgUI5UkgfB+MCOEUO7CAy1RW8qXsNXORJEwPJpLv63
   x0rvzC0XKJ8Mb3yCVnu0agp3FGeJ7KbwffPBTqR27W132uwHdV1aamCGS
   3B89UtXKo4PCA+Vt4CrRugrCFyspBD+hXm6e5MkDOL+KRk1w/v3fREx5U
   2M4ScG6R9dXQMRIGw0lXpYbvNNpcdpzZW8OCKYFBl43ziAadS+DChmeVj
   +0AIOq9UjoSFu0P8nyOkm90UGSvcwHhspH2nIJO4Y4mLR95tZbR1kVI+e
   pWDQd70SnaU0/QEHc7bv7LvKjwtiOT7NJNSHcCkgkNrY2OYerZU7IS6hm
   Q==;
X-CSE-ConnectionGUID: Q3PVeCozQy2ZZCmN6rMn2w==
X-CSE-MsgGUID: sRnuB6gbSoSi5pgxFEwEBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211455886"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211455886"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:28 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 82226C00354
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:27 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 3CF2D1412323
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:27 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 4156C1003105
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 639981A0078;
	Wed,  3 Sep 2025 17:03:22 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/56] dool: upgrade 1.3.4 -> 1.3.6
Date: Wed,  3 Sep 2025 17:02:26 +0800
Message-ID: <20250903090317.2002-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119204

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add plugin for LNET (Lustre Network)
- Fix readpipe function and update plugins for Python3
- Fix empty row for the first iteration of --top-io
- Include plugin path and source code in error tracebacks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/dool/{dool_1.3.4.bb => dool_1.3.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/dool/{dool_1.3.4.bb => dool_1.3.6.bb} (89%)

diff --git a/meta-oe/recipes-support/dool/dool_1.3.4.bb b/meta-oe/recipes-support/dool/dool_1.3.6.bb
similarity index 89%
rename from meta-oe/recipes-support/dool/dool_1.3.4.bb
rename to meta-oe/recipes-support/dool/dool_1.3.6.bb
index d18f5c8b01..074c8928b3 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.4.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.6.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
 DEPENDS += "asciidoc-native xmlto-native"
 RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"
 
-SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=https;tag=v${PV} \
           "
 
-SRCREV = "5068abef0a960c173a91e84a45e7fea1b0a802c0"
+SRCREV = "a52e710f74aad0eae46c5aafdb137070b4c00fe3"
 
 
 do_install() {
-- 
2.43.0



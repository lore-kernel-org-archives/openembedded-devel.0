Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A7B937D6B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 07:42:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,356,1559491200"; d="scan'208";a="73134864"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2019 15:42:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 716144CDFCE1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 15:42:26 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019 15:42:25 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Aug 2019 15:41:44 +0800
Message-ID: <20190807074144.31016-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 716144CDFCE1.A9B5D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-markupsafe: upgrade 1.0 -> 1.1.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Aug 2019 07:42:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

License file changed LICENSE -> LICENSE.rst
Changes of license file as follows:

* Copyright (c) 2010 by Armin Ronacher and contributors.  See AUTHORS
  for more details.

  Some rights reserved.
  ->
  Copyright 2010 Pallets

* Redistribution and use in source and binary forms of the software as well
  as documentation, with or without modification, are permitted provided
  that the following conditions are met:
  ->
  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:

* The names of the contributors may not be used to endorse or
  promote products derived from this software without specific
  prior written permission.
  ->
  Neither the name of the copyright holder nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-markupsafe.inc           | 6 +++---
 .../python/{python-markupsafe_1.0.bb => python-markupsafe_1.1.1.bb} | 0
 .../{python3-markupsafe_1.0.bb => python3-markupsafe_1.1.1.bb}      | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-markupsafe_1.0.bb => python-markupsafe_1.1.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-markupsafe_1.0.bb => python3-markupsafe_1.1.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/meta-python/recipes-devtools/python/python-markupsafe.inc
index 437a60c..33d63b3 100644
--- a/meta-python/recipes-devtools/python/python-markupsafe.inc
+++ b/meta-python/recipes-devtools/python/python-markupsafe.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
 HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c6d1adcf45d69359f256c1cea3254127"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[md5sum] = "2fcedc9284d50e577b5192e8e3578355"
-SRC_URI[sha256sum] = "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"
+SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
+SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-markupsafe_1.0.bb b/meta-python/recipes-devtools/python/python-markupsafe_1.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-markupsafe_1.0.bb
rename to meta-python/recipes-devtools/python/python-markupsafe_1.1.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-markupsafe_1.0.bb b/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-markupsafe_1.0.bb
rename to meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
-- 
2.7.4





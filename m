Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABE2C001DE
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 20:57:03 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.29700.1686862620750240033
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 13:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tmtK1wH4;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FKut7Q009464;
	Thu, 15 Jun 2023 15:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686862615;
	bh=u5phCEtemCS2DADIc8dNhMtzmWHoQbbCB6P6eUeMnlU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tmtK1wH4ofPVUgoFbpR+7v6C0wJ1nfqvZaBZaODhpCvqy7QxUKQOLY5Z0VOcoMmqh
	 ERD8LD4vq4AJOEaqLqQ9Pcb1XrNOJk6UuLup8IVNUOzV8AwYIu2sABe05zl/XPBRHS
	 Mr19VHFQ9Y2EszM+tzcEZRIwSUdkj1ivSA1bLO4c=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FKutb7117337
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 15:56:55 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 15:56:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 15:56:55 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FKutXk012389;
	Thu, 15 Jun 2023 15:56:55 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <afd@ti.com>, <denis@denix.org>
CC: <Openembedded-devel@lists.openembedded.org>,
        Ross Burton
	<ross.burton@arm.com>
Subject: [meta-oe][kirkstone][PATCH 5/6] khronos-cts: fix build when python3-build-native is present
Date: Thu, 15 Jun 2023 15:56:36 -0500
Message-ID: <20230615205637.724348-6-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615205637.724348-1-rs@ti.com>
References: <20230615205637.724348-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 20:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103329

From: Ross Burton <ross.burton@arm.com>

This recipe has a python script which *appends* a local directory to
sys.path and then tries to include a local module called build.  However
if python3-build-native is present that is included instead.

Fix by prepending the local directory to sys.path instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../vk-gl-cts/files/gen-framework-path.patch  | 20 +++++++++++++++++++
 .../vk-gl-cts/khronos-cts.inc                 |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
new file mode 100644
index 000000000..8a8d8d2c3
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
@@ -0,0 +1,20 @@
+Prepend instead of append to the module search path, as this script needs to use
+the local module build, not the host module build.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/external/vulkancts/scripts/gen_framework.py b/external/vulkancts/scripts/gen_framework.py
+index 83c5329ce..10e720910 100755
+--- a/external/vulkancts/scripts/gen_framework.py
++++ b/external/vulkancts/scripts/gen_framework.py
+@@ -33 +33 @@ from collections import OrderedDict
+-sys.path.append(os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
++sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
+diff --git a/external/vulkancts/scripts/gen_framework_c.py b/external/vulkancts/scripts/gen_framework_c.py
+index 95587e642..84b878cb2 100644
+--- a/external/vulkancts/scripts/gen_framework_c.py
++++ b/external/vulkancts/scripts/gen_framework_c.py
+@@ -28 +28 @@ import re
+-sys.path.append(os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
++sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 65ce7d6fc..4fd32d93c 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -10,6 +10,7 @@ SRC_URI = "\
         git://github.com/open-source-parsers/jsoncpp.git;protocol=https;destsuffix=git/external/jsoncpp/src;name=jsoncpp;branch=master \
         git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;destsuffix=git/external/vulkan-docs/src;name=vulkan-docs;branch=main \
         https://raw.githubusercontent.com/baldurk/renderdoc/fcdea67879fa1991e56cf7734ce0ce27866b665f/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
+        file://gen-framework-path.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.41.0



Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE7C7F990
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 08:16:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78056705"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 16:16:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C0B944B6EC6D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 16:08:05 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 16:16:13 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 16:16:41 +0800
Message-ID: <20191108081641.12122-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: C0B944B6EC6D.A9F8B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-smbus: upgrade 4.0 -> 4.1
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
X-List-Received-Date: Fri, 08 Nov 2019 08:16:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Changed contact and address.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-smbus.inc        | 6 +++---
 .../python/{python-smbus_4.0.bb => python-smbus_4.1.bb}     | 0
 .../python/{python3-smbus_4.0.bb => python3-smbus_4.1.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-smbus_4.0.bb => python-smbus_4.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-smbus_4.0.bb => python3-smbus_4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-smbus.inc b/meta-python/recipes-devtools/python/python-smbus.inc
index f472a57f4..8ba1ab2b8 100644
--- a/meta-python/recipes-devtools/python/python-smbus.inc
+++ b/meta-python/recipes-devtools/python/python-smbus.inc
@@ -1,11 +1,11 @@
 SUMMARY = "Set of i2c tools for linux - Python module"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=17;md5=fa24df321a520ff8e10f203425ab9fa8"
+LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=18;md5=46e424fb045901ab25e0f92c28c80055"
 PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz "
-SRC_URI[md5sum] = "d92a288d70f306d3895e3a7e9c14c9aa"
-SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62f2054bb39f19961d67e0c91610f071ca403"
+SRC_URI[md5sum] = "3536237a6b51fb10caacdc3b8a496237"
+SRC_URI[sha256sum] = "ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a014e0073"
 
 DEPENDS += "i2c-tools"
 
diff --git a/meta-python/recipes-devtools/python/python-smbus_4.0.bb b/meta-python/recipes-devtools/python/python-smbus_4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-smbus_4.0.bb
rename to meta-python/recipes-devtools/python/python-smbus_4.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.0.bb b/meta-python/recipes-devtools/python/python3-smbus_4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-smbus_4.0.bb
rename to meta-python/recipes-devtools/python/python3-smbus_4.1.bb
-- 
2.20.1





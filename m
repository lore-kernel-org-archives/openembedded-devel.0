Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D6B2B7FA33
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 06:53:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78052313"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 14:53:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0D7694CE19F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 14:45:16 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 14:53:22 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 14:53:52 +0800
Message-ID: <20191108065352.17874-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0D7694CE19F6.AC933
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-paho-mqtt: upgrade 1.4.0 -> 1.5.0
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
X-List-Received-Date: Fri, 08 Nov 2019 06:53:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-paho-mqtt.inc      | 4 ++--
 .../{python-paho-mqtt_1.4.0.bb => python-paho-mqtt_1.5.0.bb}  | 0
 ...{python3-paho-mqtt_1.4.0.bb => python3-paho-mqtt_1.5.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.4.0.bb => python-paho-mqtt_1.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.4.0.bb => python3-paho-mqtt_1.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
index 66943ed6c..0a0e61084 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -8,8 +8,8 @@ SRCNAME = "paho-mqtt"
 
 inherit pypi
 
-SRC_URI[md5sum] = "e3ac29cd5dc247a01083a2a8f3fddd08"
-SRC_URI[sha256sum] = "e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79"
+SRC_URI[md5sum] = "45e80d9b8066a8d0ba1ecfffe271bd3d"
+SRC_URI[sha256sum] = "e3d286198baaea195c8b3bc221941d25a3ab0e1507fc1779bdb7473806394be4"
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.4.0.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.4.0.bb
rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.4.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
-- 
2.20.1





Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 74E776C515
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 01:59:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 17:59:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,263,1539673200"; d="scan'208";a="106677421"
Received: from hchaw-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.171.138])
	by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2018 17:59:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Nov 2018 14:59:10 +1300
Message-Id: <e6423c745f307059e2637a6437fda307f3d4894d.1542851853.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1542851853.git.paul.eggleton@linux.intel.com>
References: <cover.1542851853.git.paul.eggleton@linux.intel.com>
Subject: [meta-python][PATCH 2/2] python*-paho-mqtt: upgrade to 1.4.0
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
X-List-Received-Date: Thu, 22 Nov 2018 01:59:33 -0000

1.4.0 is primarily a bugfix release, see here for details:

https://github.com/eclipse/paho.mqtt.python/blob/v1.4.0/ChangeLog.txt

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-paho-mqtt.inc     | 5 +++--
 .../{python-paho-mqtt_1.3.1.bb => python-paho-mqtt_1.4.0.bb} | 0
 ...python3-paho-mqtt_1.3.1.bb => python3-paho-mqtt_1.4.0.bb} | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.3.1.bb => python-paho-mqtt_1.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.3.1.bb => python3-paho-mqtt_1.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
index f834e6fd87..66943ed6ce 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc \
 SRCNAME = "paho-mqtt"
 
 inherit pypi
-SRC_URI[md5sum] = "2cc27d8b369700b1fc99325add0dadd2"
-SRC_URI[sha256sum] = "31911f6031de306c27ed79dc77b690d7c55b0dcb0f0434ca34ec6361d0371122"
+
+SRC_URI[md5sum] = "e3ac29cd5dc247a01083a2a8f3fddd08"
+SRC_URI[sha256sum] = "e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79"
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb
rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.1.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_1.4.0.bb
-- 
2.17.2



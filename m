Return-Path: <maciej.borzecki@open-rnd.pl>
X-Greylist: delayed 724 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Jul 2015 14:30:08 UTC
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 717C0607BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:30:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 2F2A5426EB1;
	Fri, 10 Jul 2015 16:18:03 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Tim Orling <TicoTimo@gmail.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Brendan Le Foll <brendan.le.foll@intel.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jul 2015 16:17:55 +0200
Message-Id: <1436537875-665-4-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1436537875-665-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1436537875-665-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-python][PATCH 3/3] python-paho-mqtt: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jul 2015 14:30:10 -0000

Add recipe for python-paho-mqtt, a MQTT 3.1 client library.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 .../recipes-devtools/python/python-paho-mqtt_1.1.bb       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
new file mode 100644
index 0000000000000000000000000000000000000000..faadcec1b3fdb264cb774aee85230cac2708b4d0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "MQTT version 3.1/3.1.1 client library"
+LICENSE = "EPL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc"
+SRCNAME = "paho-mqtt"
+
+inherit pypi
+
+RDEPENDS_${PN} = "\
+               python-math \
+               python-io \
+               python-threading \
+"
+
+SRC_URI[md5sum] = "a6407b74eb5e5411e157be1de5c11366"
+SRC_URI[sha256sum] = "0f7a629efe6e3a2c61b59d3550aa9f2c4529b5689a65fde45e6f1ac36b9a261e"
-- 
1.9.3



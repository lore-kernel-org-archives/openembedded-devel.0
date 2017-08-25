Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 94A777806E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 03:47:01 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 24 Aug 2017 20:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,423,1498546800"; d="scan'208";a="122432192"
Received: from beecheek-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.140])
	by orsmga004.jf.intel.com with ESMTP; 24 Aug 2017 20:47:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Aug 2017 15:46:26 +1200
Message-Id: <8fa8e493475e7a261aa75ee0652218d272c00e39.1503632758.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503632758.git.paul.eggleton@linux.intel.com>
References: <cover.1503632758.git.paul.eggleton@linux.intel.com>
Subject: [meta-python][PATCH 1/2] python-paho-mqtt: licensing improvements
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
X-List-Received-Date: Fri, 25 Aug 2017 03:47:01 -0000

* Make LICENSE more accurate - it's dual licensed
* Include the actual license text files in LIC_FILES_CHKSUM

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-paho-mqtt.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
index 531fdf7..6cbde74 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -1,6 +1,9 @@
 SUMMARY = "MQTT version 3.1/3.1.1 client library"
-LICENSE = "EPL-1.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc"
+LICENSE = "EPL-1.0 | EDL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc \
+                    file://epl-v10;md5=8d383c379e91d20ba18a52c3e7d3a979 \
+                    file://edl-v10;md5=c09f121939f063aeb5235972be8c722c \
+"
 SRCNAME = "paho-mqtt"
 
 inherit pypi
-- 
2.9.5



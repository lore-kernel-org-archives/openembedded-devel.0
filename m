Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 60FEB783A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 03:47:04 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 24 Aug 2017 20:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,423,1498546800"; d="scan'208";a="122432206"
Received: from beecheek-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.140])
	by orsmga004.jf.intel.com with ESMTP; 24 Aug 2017 20:47:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Aug 2017 15:46:27 +1200
Message-Id: <66e9dbc5db329448c756cf59d2a00273e99382ba.1503632758.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503632758.git.paul.eggleton@linux.intel.com>
References: <cover.1503632758.git.paul.eggleton@linux.intel.com>
Subject: [meta-python][PATCH 2/2] python-paho-mqtt: fix downloading during do_compile
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
X-List-Received-Date: Fri, 25 Aug 2017 03:47:04 -0000

During do_compile if setup.py finds that pytest-runner - which is
declared as a setup dependency in setup.py - isn't available it was
attempting to download it from pypi, which is problematic if you are
behind a proxy because the environment for do_compile isn't set up for
that. Add an appropriate native dependency to prevent this situation.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-paho-mqtt.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
index 6cbde74..ad1ce6a 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -10,6 +10,8 @@ inherit pypi
 SRC_URI[md5sum] = "b9338236e2836e8579ef140956189cc4"
 SRC_URI[sha256sum] = "2c9ef5494cfc1e41a9fff6544c5a2cd59ea5d401d9119a06ecf7fad6a2ffeb93"
 
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
 RDEPENDS_${PN} = "\
                ${PYTHON_PN}-math \
                ${PYTHON_PN}-io \
-- 
2.9.5



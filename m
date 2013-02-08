Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3kNr-0001nX-E5
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 10:36:40 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Feb 2013 01:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,628,1355126400"; d="scan'208";a="282551370"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by orsmga002.jf.intel.com with ESMTP; 08 Feb 2013 01:20:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 09:20:40 +0000
Message-Id: <343a84e82b1974badf12346be206dfd0eb521e0b.1360315212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360315212.git.paul.eggleton@linux.intel.com>
References: <cover.1360315212.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360315212.git.paul.eggleton@linux.intel.com>
References: <cover.1360315212.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/2] libyaml: update to 0.1.4 and tweak
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 09:36:41 -0000

* Update to 0.1.4
* Set SUMMARY instead of DESCRIPTION
* Drop PR

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../libyaml/{libyaml_0.1.3.bb => libyaml_0.1.4.bb}              |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/libyaml/{libyaml_0.1.3.bb => libyaml_0.1.4.bb} (54%)

diff --git a/meta-oe/recipes-support/libyaml/libyaml_0.1.3.bb b/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
similarity index 54%
rename from meta-oe/recipes-support/libyaml/libyaml_0.1.3.bb
rename to meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
index 702ed55..04c6f77 100644
--- a/meta-oe/recipes-support/libyaml/libyaml_0.1.3.bb
+++ b/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
@@ -1,13 +1,12 @@
-DESCRIPTION = "LibYAML is a YAML parser and emitter written in C."
+SUMMARY = "LibYAML is a YAML parser and emitter written in C."
 HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
 SECTION = "libs/devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
-PR="r0"
 
 SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz;name=libyaml"
-SRC_URI[libyaml.md5sum] = "b8ab9064e8e0330423fe640de76608cd"
-SRC_URI[libyaml.sha256sum] = "a8bbad7e5250b3735126b7e3bd9f6fce9db19d6be7cc13abad17a24b59ec144a"
+SRC_URI[libyaml.md5sum] = "36c852831d02cf90508c29852361d01b"
+SRC_URI[libyaml.sha256sum] = "7bf81554ae5ab2d9b6977da398ea789722e0db75b86bffdaeb4e66d961de6a37"
 
 S = "${WORKDIR}/yaml-${PV}"
 
-- 
1.7.10.4




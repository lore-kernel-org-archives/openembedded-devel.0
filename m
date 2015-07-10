Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 709DA6017E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:30:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id C9A81427261;
	Fri, 10 Jul 2015 16:18:02 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Tim Orling <TicoTimo@gmail.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Brendan Le Foll <brendan.le.foll@intel.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jul 2015 16:17:53 +0200
Message-Id: <1436537875-665-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1436537875-665-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1436537875-665-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-python][PATCH 1/3] python-daemonize: add recipe
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

Adding recipe for python-daemonize, a library that enables running the
Python a daemon process on Unix-like systems.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 .../recipes-devtools/python/python-daemonize_2.3.1.bb    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-daemonize_2.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-daemonize_2.3.1.bb b/meta-python/recipes-devtools/python/python-daemonize_2.3.1.bb
new file mode 100644
index 0000000000000000000000000000000000000000..2fc9e633a2934db00d0b216e3f2cac59a89ae26e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-daemonize_2.3.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Library to enable your code run as a daemon process on Unix-like systems"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=13e982bf1b7b164b9d6d1665dac83873"
+SRCNAME = "daemonize"
+
+inherit pypi
+
+RDEPENDS_${PN} = "\
+               python-fcntl \
+               python-unixadmin \
+               python-logging \
+               python-resource \
+"
+
+SRC_URI[md5sum] = "f0d401a0a501ba9d36e516ea89146eb2"
+SRC_URI[sha256sum] = "6fa43b56c293ff8bb180008fe47ed49f7d006cdeb0eaa84f157249800d3194d4"
-- 
1.9.3



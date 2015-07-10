Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD626017E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 14:30:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 04276427070;
	Fri, 10 Jul 2015 16:18:02 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Tim Orling <TicoTimo@gmail.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Brendan Le Foll <brendan.le.foll@intel.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jul 2015 16:17:54 +0200
Message-Id: <1436537875-665-3-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1436537875-665-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1436537875-665-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-python][PATCH 2/3] python-sparts: add recipe
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

Adding recipe for python-sparts, a library for rapid service
prototyping.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 .../recipes-devtools/python/python-sparts_0.7.2.bb | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-sparts_0.7.2.bb

diff --git a/meta-python/recipes-devtools/python/python-sparts_0.7.2.bb b/meta-python/recipes-devtools/python/python-sparts_0.7.2.bb
new file mode 100644
index 0000000000000000000000000000000000000000..d11b0b486aad3d8bd5429f00824df71f969fc7c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sparts_0.7.2.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Library for rapid service prototyping with minimal boilerplate"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0c1554636a564da3baf037ac652fc831"
+SRCNAME = "sparts"
+
+SRC_URI = "git://github.com/facebook/sparts.git"
+SRCREV = "128cf9c2f82b00cb2d8648033970870c73641f02"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "\
+               python-subprocess \
+               python-six \
+               python-argparse \
+               python-re \
+               python-shell \
+               python-threading \
+               python-logging \
+               python-unixadmin \
+               python-distutils \
+               python-daemonize \
+               python-futures \
+"
-- 
1.9.3



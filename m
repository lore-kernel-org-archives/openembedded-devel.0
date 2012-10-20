Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TPXO7-0007sK-15
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 13:38:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2012 04:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,621,1344236400"; d="scan'208";a="230035372"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.100])
	by orsmga002.jf.intel.com with ESMTP; 20 Oct 2012 04:25:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Oct 2012 12:25:15 +0100
Message-Id: <1350732316-5310-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] initial collectd recipe
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
X-List-Received-Date: Sat, 20 Oct 2012 11:38:43 -0000

Based on initial version by Koen Kooi <koen@beagleboard.org>
Currently broken - attempts to rerun configure during do_compile.
---
 .../recipes-extended/collectd/collectd_5.1.0.bb    |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd_5.1.0.bb

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.1.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.1.0.bb
new file mode 100644
index 0000000..e4008c5
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd_5.1.0.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "collectd is a daemon which collects system performance statistics periodically and provides mechanisms to store the values in a variety of ways, for example in RRD files."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "rrdtool curl mysql5 net-snmp libpcap libxml2 yajl libgcrypt libtool"
+
+SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2"
+SRC_URI[md5sum] = "141570150b4608c0c567330f6f146e0f"
+SRC_URI[sha256sum] = "521d4be7df5bc1124b7b9ea88227e95839a5f7c1b704a5bde0f60f058ec6eecb"
+
+inherit autotools pythonnative
+
+# Floatingpoint layout, architecture dependent 
+# 'nothing', 'endianflip' or 'intswap'
+FPLAYOUT ?= "--with-fp-layout=nothing"
+
+EXTRA_OECONF = " \
+        ${FPLAYOUT} \
+        --disable-perl \
+        --with-libgcrypt=${STAGING_BINDIR_CROSS}/libgcrypt-config \
+"
+
+# 'compile' from libtool is missing in sysroots (${datadir}/libtool/config/compile)
+do_configure() {
+        aclocal
+	export GCRYPT_LDFLAGS=" "
+	oe_runconf
+}
+
-- 
1.7.9.5




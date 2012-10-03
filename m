Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJSe0-0002CC-RD
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 19:22:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Oct 2012 10:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,528,1344236400"; d="scan'208";a="230100573"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.52])
	by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2012 10:08:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2012 18:08:25 +0100
Message-Id: <6190260bea64aa19834ce468a67d5251ded08259.1349283829.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349283829.git.paul.eggleton@linux.intel.com>
References: <cover.1349283829.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349283829.git.paul.eggleton@linux.intel.com>
References: <cover.1349283829.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH v2 4/4] xdebug: add new recipe
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
X-List-Received-Date: Wed, 03 Oct 2012 17:22:01 -0000

Add new recipe for the Xdebug PHP debugger/profiler.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb |   34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb
new file mode 100644
index 0000000..48e1f8e
--- /dev/null
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Debugging and profiling extension for PHP"
+LICENSE = "Xdebug"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34df3a274aa12b795417c65634c07f16"
+
+DEPENDS = "modphp"
+
+PR = "r0"
+
+SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
+
+SRC_URI[md5sum] = "5e5c467e920240c20f165687d7ac3709"
+SRC_URI[sha256sum] = "11d340eb7f87909a596bac054cc927df757dc2fc7c90b50a832c30e9bf84c9ad"
+
+inherit autotools
+
+EXTRA_OECONF += "--enable-xdebug -with-php-config=${STAGING_BINDIR_CROSS}/php-config"
+
+do_configure() {
+	${STAGING_BINDIR_CROSS}/phpize
+
+	# Running autoreconf as autotools_do_configure would do here
+	# breaks the libtool configuration resulting in a failure later
+	# in do_compile. It's possible this may be fixable, however the
+	# easiest course of action for the moment is to avoid doing that.
+	oe_runconf
+}
+
+do_install() {
+	oe_runmake install INSTALL_ROOT=${D}
+}
+
+FILES_${PN} += "${libdir}/php5/extensions/*/*.so"
+FILES_${PN}-dbg += "${libdir}/php5/extensions/*/.debug"
+
-- 
1.7.9.5




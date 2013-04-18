Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USimp-0006Xw-Ea
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 08:57:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2013 23:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,499,1363158000"; d="scan'208";a="324173612"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.215])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2013 23:39:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Apr 2013 07:39:38 +0100
Message-Id: <d8dd70f64cd156606e99ce7790fc8524a060f435.1366267106.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366267106.git.paul.eggleton@linux.intel.com>
References: <cover.1366267106.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366267106.git.paul.eggleton@linux.intel.com>
References: <cover.1366267106.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe, meta-webserver][PATCH 2/2] nostromo: move to meta-webserver and tweak
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
X-List-Received-Date: Thu, 18 Apr 2013 06:57:58 -0000

* Add SUMMARY
* Move SRC_URI checksums next to SRC_URI

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...0001-GNUmakefile-add-possibility-to-override-variables.patch |    0
 .../recipes-httpd}/nostromo/files/nhttpd.conf                   |    0
 .../recipes-httpd}/nostromo/files/nostromo                      |    0
 .../recipes-httpd}/nostromo/files/volatiles                     |    0
 .../recipes-httpd}/nostromo/nostromo_1.9.5.bb                   |    7 ++++---
 5 files changed, 4 insertions(+), 3 deletions(-)
 rename {meta-oe/recipes-extended => meta-webserver/recipes-httpd}/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch (100%)
 rename {meta-oe/recipes-extended => meta-webserver/recipes-httpd}/nostromo/files/nhttpd.conf (100%)
 rename {meta-oe/recipes-extended => meta-webserver/recipes-httpd}/nostromo/files/nostromo (100%)
 rename {meta-oe/recipes-extended => meta-webserver/recipes-httpd}/nostromo/files/volatiles (100%)
 rename {meta-oe/recipes-extended => meta-webserver/recipes-httpd}/nostromo/nostromo_1.9.5.bb (97%)

diff --git a/meta-oe/recipes-extended/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch b/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
similarity index 100%
rename from meta-oe/recipes-extended/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
rename to meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
diff --git a/meta-oe/recipes-extended/nostromo/files/nhttpd.conf b/meta-webserver/recipes-httpd/nostromo/files/nhttpd.conf
similarity index 100%
rename from meta-oe/recipes-extended/nostromo/files/nhttpd.conf
rename to meta-webserver/recipes-httpd/nostromo/files/nhttpd.conf
diff --git a/meta-oe/recipes-extended/nostromo/files/nostromo b/meta-webserver/recipes-httpd/nostromo/files/nostromo
similarity index 100%
rename from meta-oe/recipes-extended/nostromo/files/nostromo
rename to meta-webserver/recipes-httpd/nostromo/files/nostromo
diff --git a/meta-oe/recipes-extended/nostromo/files/volatiles b/meta-webserver/recipes-httpd/nostromo/files/volatiles
similarity index 100%
rename from meta-oe/recipes-extended/nostromo/files/volatiles
rename to meta-webserver/recipes-httpd/nostromo/files/volatiles
diff --git a/meta-oe/recipes-extended/nostromo/nostromo_1.9.5.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
similarity index 97%
rename from meta-oe/recipes-extended/nostromo/nostromo_1.9.5.bb
rename to meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
index fa9645a..e66676e 100644
--- a/meta-oe/recipes-extended/nostromo/nostromo_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
@@ -1,3 +1,4 @@
+SUMMARY = "A simple, fast and secure HTTP server"
 HOMEPAGE = "http://www.nazgul.ch/dev_nostromo.html"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/nhttpd/main.c;beginline=2;endline=14;md5=e5ec3fa723b29b7d59d205afd8d36938"
@@ -9,6 +10,9 @@ SRC_URI = "http://www.nazgul.ch/dev/${PN}-${PV}.tar.gz \
            file://nostromo \
 "
 
+SRC_URI[md5sum] = "dc6cfd6b5aae04c370c7f818fa7bde55"
+SRC_URI[sha256sum] = "5f62578285e02449406b46cf06a7888fe3dc4a90bedf58cc18523bad62f6b914"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 DEPENDS = "openssl"
@@ -45,7 +49,4 @@ do_install() {
     chown -R www-data:www-data ${D}/${localstatedir}/nostromo ${D}/${localstatedir}/log/nostromo ${D}/${localstatedir}/run/nostromo
 }
 
-SRC_URI[md5sum] = "dc6cfd6b5aae04c370c7f818fa7bde55"
-SRC_URI[sha256sum] = "5f62578285e02449406b46cf06a7888fe3dc4a90bedf58cc18523bad62f6b914"
-
 CONFFILES_${PN} += "/var/nostromo/conf/mimes ${sysconfdir}/nhttpd.conf"
-- 
1.7.10.4




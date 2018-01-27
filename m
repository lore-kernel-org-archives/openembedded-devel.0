Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 98C677888F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 09:29:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jan 2018 01:29:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,421,1511856000"; d="scan'208";a="13446863"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 27 Jan 2018 01:29:32 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jan 2018 01:29:03 -0800
Message-Id: <20180127092903.17475-3-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180127092903.17475-1-timothy.t.orling@linux.intel.com>
References: <20180127092903.17475-1-timothy.t.orling@linux.intel.com>
Subject: [meta-perl][PATCH 3/3] libmime-types-perl: upgrade 2.14 -> 2.17
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
X-List-Received-Date: Sat, 27 Jan 2018 09:29:30 -0000

* Fix RDEPENDS
* Install bin/collect-types

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...types-perl_2.14.bb => libmime-types-perl_2.17.bb} | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.14.bb => libmime-types-perl_2.17.bb} (61%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.14.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
similarity index 61%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.14.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
index ade0a062a..414753030 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.14.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
@@ -14,13 +14,29 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "c1b9b7dea40fbb96c0e0048d10d66268"
-SRC_URI[sha256sum] = "4049cf0fc05205893f25fdbe07d1ab12bfc72259517db2c3348c1d1059730070"
+SRC_URI[md5sum] = "6f1441addab947137bac92c379a47ba3"
+SRC_URI[sha256sum] = "e04ed7d42f1ff3150a303805f2689c28f80b92c511784d4641cb7f040d3e8ff6"
 
 S = "${WORKDIR}/MIME-Types-${PV}"
 
 inherit cpan ptest
 
+RDEPENDS_${PN} = "\
+    perl-module-base \
+    perl-module-file-basename \
+    perl-module-file-spec \
+    perl-module-overload \
+"
+
+RDEPENDS_${PN}-ptest = "perl-module-lib perl-module-test-more"
+#RSUGGESTS_${PN}-ptest = "libmojo-base-perl"
+
+do_install () {
+    cpan_do_install
+    install -d ${D}${bindir}
+    install -m 755 ${S}/bin/collect-types ${D}${bindir}/collect-types
+}
+
 do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
-- 
2.13.6



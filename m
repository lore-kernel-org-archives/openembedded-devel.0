Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C8E237E502
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 18:44:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 11:44:09 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga007.jf.intel.com with ESMTP; 02 Jun 2019 11:44:09 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 11:43:14 -0700
Message-Id: <20190602184318.71277-9-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
References: <20190602184318.71277-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 09/13] libhtml-tagset-perl: add recipe for v3.20
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
X-List-Received-Date: Sun, 02 Jun 2019 18:44:08 -0000
Content-Transfer-Encoding: 8bit

This module contains data tables useful in dealing with HTML.
It provides no functions or methods.

This is a dependency for libhtml-paser-perl.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libhtml/libhtml-tagset-perl_3.20.bb       | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
new file mode 100644
index 0000000000..d6483cc5fc
--- /dev/null
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
@@ -0,0 +1,29 @@
+SUMMARY = "HTML::Tageset -  data tables useful in parsing HTML"
+DESCRIPTION = "This module contains several data tables useful in various \
+kinds of HTML parsing operations."
+HOMEPAGE = "https://metacpan.org/release/HTML-Tagset"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://README;beginline=62;endline=66;md5=aa91eed6adfe182d2af676954f06a7c9"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PE/PETDANCE/HTML-Tagset-${PV}.tar.gz"
+SRC_URI[md5sum] = "d2bfa18fe1904df7f683e96611e87437"
+SRC_URI[sha256sum] = "adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2"
+
+S = "${WORKDIR}/HTML-Tagset-${PV}"
+
+
+inherit cpan ptest-perl
+
+
+RDEPENDS_${PN} += "perl-module-strict perl-module-vars"
+
+RDEPENDS_${PN}-ptest += "perl-module-test"
+
+do_install_prepend() {
+    # requires "-T" (taint) command line option
+    rm -rf ${B}/t/pod.t
+}
+
+BBCLASSEXTEND = "native"
-- 
2.20.1



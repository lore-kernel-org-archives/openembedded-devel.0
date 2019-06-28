Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 06E9A7EA55
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:00:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 21:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="246055510"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 21:53:17 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 21:52:25 -0700
Message-Id: <22f7d4cbabcf01245da4cd75f742f8b5f9a61dd8.1561696450.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 9/9] libunicode-linebreak-perl: upgrade 2017.004 -> 2019.001; enable ptest
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
X-List-Received-Date: Fri, 28 Jun 2019 05:00:20 -0000
Content-Transfer-Encoding: 8bit

* Update HOMEPAGE
* Use CPAN_MIRROR in SRC_URI
* Add to RDEPENDS, not overwrite
* Add runtime and ptest dependencies
* Add RPROVIDES

License-Update: update copyright year; only use lines which apply to license and copyright

Upstream release notes:

019.001  Sat Dec 29
! Makefile.PL
  - GH PR#4: Added timeout to wget call in Makefile.PL by J. Bargsten.
  - CPAN RT#125079: Installation stuck after a wget.
    Fixed by changing scheme from ftp to https.
! lib/Text/LineFold.pm
! t/04fold.t
  - Fix: Text::LineFold: new() & config() did not allow multiple Prep option
! t/01break.t
! t/02hangul.t
! t/03ns.t
! t/04fold.t
! t/05urgent.t
! t/06context.t
! t/07sea.t
! t/08partial.t
! t/09uri.t
! t/11format.t
! t/12fold2.t
! t/13flowedsp.t
! t/14sea_al.t
! t/15array.t
! t/16regex.t
! t/17prop.t
! t/18currency.t
  - CPAN RT #120535: Fails tests when no "." in @INC.

2018.012  Sat Dec 29 2018

2018.003  Thu Mar 29 2018
! Makefile.PL.sombok
  - CPAN RT#120370: Build fails with recent EUMM and some make variants.
    Patch by Alexandr Ciornii.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libunicode-linebreak-perl_2017.004.bb     | 26 ---------
 .../libunicode-linebreak-perl_2019.001.bb     | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 26 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2017.004.bb
 create mode 100644 meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb

diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2017.004.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2017.004.bb
deleted file mode 100644
index 5ccb411fa5..0000000000
--- a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2017.004.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Unicode::LineBreak - UAX #14 Unicode Line Breaking Algorithm."
-DESCRIPTION = "Unicode::LineBreak performs Line Breaking Algorithm described in Unicode \
-Standard Annex #14 [UAX #14]. East_Asian_Width informative property \
-defined by Annex #11 [UAX #11] will be concerned to determine breaking \
-positions."
-SECTION = "libs"
-
-HOMEPAGE = "http://search.cpan.org/~nezumi/Unicode-LineBreak-${PV}/"
-
-LICENSE = "Artistic-1.0 | GPLv1+"
-LIC_FILES_CHKSUM = "file://README;md5=77241abd74fec561b3f3de1b44c0241b"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/Unicode-LineBreak-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "de7672227922260ac92d20bbad29660b"
-SRC_URI[sha256sum] = "655bc3c4cb60ad0770d97816716cfe322f24e602c70e595f5941dfa02c40cb76"
-
-S = "${WORKDIR}/Unicode-LineBreak-${PV}"
-
-DEPENDS = "libsombok3 libmime-charset-perl"
-
-RDEPENDS_${PN} = "libsombok3 libmime-charset-perl"
-
-inherit cpan
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
new file mode 100644
index 0000000000..304b375777
--- /dev/null
+++ b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
@@ -0,0 +1,55 @@
+SUMMARY = "Unicode::LineBreak - UAX #14 Unicode Line Breaking Algorithm."
+DESCRIPTION = "Unicode::LineBreak performs Line Breaking Algorithm described in Unicode \
+Standard Annex #14 [UAX #14]. East_Asian_Width informative property \
+defined by Annex #11 [UAX #11] will be concerned to determine breaking \
+positions."
+SECTION = "libs"
+
+HOMEPAGE = "https://metacpan.org/release/Unicode-LineBreak"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=5;endline=9;md5=b5e8b1099b86b86fbc315b50484231ab"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/Unicode-LineBreak-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "003d6da7a13700e069afed9238c864b9"
+SRC_URI[sha256sum] = "486762e4cacddcc77b13989f979a029f84630b8175e7fef17989e157d4b6318a"
+
+S = "${WORKDIR}/Unicode-LineBreak-${PV}"
+
+DEPENDS = "libsombok3 libmime-charset-perl"
+
+inherit cpan ptest-perl
+
+do_install_ptest() {
+    cp -r ${B}/test-data ${D}${PTEST_PATH}
+    chown -R root:root ${D}${PTEST_PATH}
+}
+
+RDEPENDS_${PN} += " \
+    libmime-charset-perl \
+    libsombok3 \
+    perl-module-carp \
+    perl-module-constant \
+    perl-module-encode \
+    perl-module-exporter \
+    perl-module-overload \
+    perl-module-strict \
+    perl-module-vars \
+    perl-module-warnings \
+    perl-module-xsloader \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    perl-module-findbin \
+    perl-module-lib \
+    perl-module-strict \
+    perl-module-test-more \
+"
+
+RPROVIDES_${PN} += " \
+    libtext-linefold-perl \
+    libunicode-gcstring-perl \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1



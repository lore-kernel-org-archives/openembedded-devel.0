Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88E136C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 04:52:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 21:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,426,1557212400"; d="scan'208";a="246055439"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 21:52:49 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 21:52:17 -0700
Message-Id: <8573d1190e820db0753da1a80972bd0188b7b29a.1561696450.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 1/9] libencode-perl: upgrade 2.94 -> 3.01; enable ptest
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
X-List-Received-Date: Fri, 28 Jun 2019 04:52:48 -0000
Content-Transfer-Encoding: 8bit

* Clean-up whitespace
* Add ptest dependencies

License-Update: Only use license lines from META.json

Upstream release notes:

3.01 $ $Date: 2019/03/13 00:26:18 $
! Encode.xs
  patched: Warning: Use of uninitialized value in subroutine entry
  https://github.com/dankogai/p5-encode/issues/139#issuecomment-459765852
! Encode/encode.h
  Pulled: Fix compile error and warning
  https://github.com/dankogai/p5-encode/pull/138

3.00 2019/01/31
! Encode.pm
  VERSION bumped to 3.00 to make PAUSE happy

2.100 2019/01/31 04:26:40
!  Encode.xs MANIFEST
+  t/xml.t
  Pulled: Do not access SV* buffer if we have not called SvPV_force()
  https://github.com/dankogai/p5-encode/pull/137
! MANIFEST
  remove utf8messages.t which is already deleted from the repository.

2.99 2019/01/21 03:13:35
! Unicode/Unicode.xs Unicode/Unicode.pm
  VERSION++'ed as Perl core needed.
  https://github.com/dankogai/p5-encode/issues/136
! encengine.c
  Pulled: protect do_encode from NULL dst
  https://github.com/dankogai/p5-encode/pull/135

2.98 2018/04/22 09:02:00
! Encode.pm Encode.xs Encode/encode.h Unicode/Unicode.xs encengine.c
t/decode.t t/enc_eucjp.t t/utf8messages.t t/utf8warnings.t
- t/utf8messages.t
+ t/utf32warnings.t
  Pulled: Introduce new Encode check flag Encode::ONLY_PRAGMA_WARNINGS
  https://github.com/dankogai/p5-encode/pull/134
2.98 2018/04/22 09:02:00
! t/truncated_utf8.t
  Resolved: RT125131: truncated_utf8.t TODO test pass in blead
  https://rt.cpan.org/Ticket/Display.html?id=125131
! Encode.xs
  Pulled: Remove XS functions _bytes_to_utf8() and _utf8_to_bytes()
  https://github.com/dankogai/p5-encode/pull/133
! Unicode/Unicode.xs
  Pulled: Automatically compute length in attr() macro
  https://github.com/dankogai/p5-encode/pull/132
! Encode.xs
  Pulled: Fix compile warnings on 64bit MS VS2017
  https://github.com/dankogai/p5-encode/pull/131

2.97 2018/02/21 12:14:33
! Encode.xs
  Pulled: New perls that fixes
    https://github.com/dankogai/p5-encode/issues/129
    https://rt.cpan.org/Ticket/Display.html?id=124399
  https://github.com/dankogai/p5-encode/pull/130

2.96 2018/02/11 05:35:26
! Encode.pm encoding.pm Unicode/Unicode.pm
  VERSION++ to make bleadperl happy
  <CADED=K4v5WQ3R7+aTu1xV4q2RcZFT=jriZubqfrHe7PZrgRmDA@mail.gmail.com>

2.95 2018/02/08 00:26:15
! Encode.pm Encode.xs Encode/encode.h Unicode/Unicode.pm
  Unicode/Unicode.xs encengine.c
  Pulled: new perls
  https://github.com/dankogai/p5-encode/pull/128

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../libencode/libencode-perl_2.94.bb          |  68 -----------
 .../libencode/libencode-perl_3.01.bb          | 106 ++++++++++++++++++
 2 files changed, 106 insertions(+), 68 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libencode/libencode-perl_2.94.bb
 create mode 100644 meta-perl/recipes-perl/libencode/libencode-perl_3.01.bb

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_2.94.bb b/meta-perl/recipes-perl/libencode/libencode-perl_2.94.bb
deleted file mode 100644
index 9861c56e05..0000000000
--- a/meta-perl/recipes-perl/libencode/libencode-perl_2.94.bb
+++ /dev/null
@@ -1,68 +0,0 @@
-# NOTE:
-#    You should use perl-module-encode rather than this package
-#    unless you specifically need a version newer than what is
-#    provided by perl.
-
-SUMMARY = "Encode - character encodings"
-DESCRIPTION = "The \"Encode\" module provides the interfaces between \
-Perl's strings and the rest of the system.  Perl strings are sequences \
-of characters."
-
-AUTHOR = "Dan Kogai <dankogai+cpan@gmail.com>"
-HOMEPAGE = "https://metacpan.org/release/Encode"
-SECTION = "lib"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://META.json;md5=d8e909447b983532b2b460c830e7a7e4"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[md5sum] = "f995e0eb9e52d01ed57abe835bf3ccb6"
-SRC_URI[sha256sum] = "acb3a4af5e3ee38f94de8baa7454e0b836a0649e7ac4180f28dfca439ad60cff"
-
-UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
-
-S = "${WORKDIR}/Encode-${PV}"
-
-inherit cpan
-
-#  file /usr/bin/enc2xs from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
-#  file /usr/bin/encguess from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
-#  file /usr/bin/piconv from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
-RCONFLICTS_${PN} = "perl-misc"
-
-RDEPENDS_${PN} += " perl-module-bytes \
-                    perl-module-constant \
-                    perl-module-parent \
-                    perl-module-storable \
-                    perl-module-xsloader \
-"
-
-RPROVIDES_${PN} += "libencode-alias-perl \
-                    libencode-byte-perl \
-                    libencode-cjkconstants-perl \
-                    libencode-cn-perl \
-                    libencode-cn-hz-perl \
-                    libencode-config-perl \
-                    libencode-ebcdic-perl \
-                    libencode-encoder-perl \
-                    libencode-encoding-perl \
-                    libencode-gsm0338-perl \
-                    libencode-guess-perl \
-                    libencode-jp-perl \
-                    libencode-jp-h2z-perl \
-                    libencode-jp-jis7-perl \
-                    libencode-kr-perl \
-                    libencode-kr-2022_kr-perl \
-                    libencode-mime-header-perl \
-                    libencode-mime-name-perl \
-                    libencode-symbol-perl \
-                    libencode-tw-perl \
-                    libencode-unicode-perl \
-                    libencode-unicode-utf7-perl \
-                    libencoding-perl \
-                    libencode-internal-perl \
-                    libencode-mime-header-iso_2022_jp-perl \
-                    libencode-utf8-perl \
-                    libencode-utf_ebcdic-perl \
-                    "
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.01.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.01.bb
new file mode 100644
index 0000000000..be3a296832
--- /dev/null
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.01.bb
@@ -0,0 +1,106 @@
+# NOTE:
+#    You should use perl-module-encode rather than this package
+#    unless you specifically need a version newer than what is
+#    provided by perl.
+
+SUMMARY = "Encode - character encodings"
+DESCRIPTION = "The \"Encode\" module provides the interfaces between \
+Perl's strings and the rest of the system.  Perl strings are sequences \
+of characters."
+
+AUTHOR = "Dan Kogai <dankogai+cpan@gmail.com>"
+HOMEPAGE = "https://metacpan.org/release/Encode"
+SECTION = "lib"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
+SRC_URI[md5sum] = "b0524ca1535ff6956cf1ff696616c94a"
+SRC_URI[sha256sum] = "d4555f570491648dbbd602bce7966672834b4c8f45acaa6757de474fca3a4d87"
+
+UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
+
+S = "${WORKDIR}/Encode-${PV}"
+
+inherit cpan ptest-perl
+
+do_install_prepend() {
+    # Requires "-T" (taint) option on command line
+    rm -rf ${B}/t/taint.t
+    # Circular dependency of perl-module-open on perl-module-encode
+    # and we cannot load perl-module-encode because we are providing
+    # an alternative
+    rm -rf ${B}/t/use-Encode-Alias.t
+}
+
+do_install_ptest() {
+    mkdir ${D}${PTEST_PATH}/bin
+    cp -r ${B}/bin/piconv ${D}${PTEST_PATH}/bin
+    cp -r ${B}/blib ${D}${PTEST_PATH}
+    chown -R root:root ${D}${PTEST_PATH}
+}
+
+#  file /usr/bin/enc2xs from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
+#  file /usr/bin/encguess from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
+#  file /usr/bin/piconv from install of perl-misc-5.24.1-r0.i586 conflicts with file from package libencode-perl-2.94-r0.i586
+RCONFLICTS_${PN} = "perl-misc perl-module-encode"
+
+RDEPENDS_${PN} += " \
+    perl-module-bytes \
+    perl-module-constant \
+    perl-module-parent \
+    perl-module-storable \
+    perl-module-xsloader \
+    "
+
+RPROVIDES_${PN} += " \
+    libencode-alias-perl \
+    libencode-byte-perl \
+    libencode-cjkconstants-perl \
+    libencode-cn-perl \
+    libencode-cn-hz-perl \
+    libencode-config-perl \
+    libencode-ebcdic-perl \
+    libencode-encoder-perl \
+    libencode-encoding-perl \
+    libencode-gsm0338-perl \
+    libencode-guess-perl \
+    libencode-jp-perl \
+    libencode-jp-h2z-perl \
+    libencode-jp-jis7-perl \
+    libencode-kr-perl \
+    libencode-kr-2022_kr-perl \
+    libencode-mime-header-perl \
+    libencode-mime-name-perl \
+    libencode-symbol-perl \
+    libencode-tw-perl \
+    libencode-unicode-perl \
+    libencode-unicode-utf7-perl \
+    libencoding-perl \
+    libencode-internal-perl \
+    libencode-mime-header-iso_2022_jp-perl \
+    libencode-utf8-perl \
+    libencode-utf_ebcdic-perl \
+    "
+
+RDEPENDS_${PN}-ptest += " \
+    perl-module-blib \
+    perl-module-charnames \
+    perl-module-file-compare \
+    perl-module-file-copy \
+    perl-module-filehandle \
+    perl-module-findbin \
+    perl-module-integer \
+    perl-module-io-select \
+    perl-module-ipc-open3 \
+    perl-module-mime-base64 \
+    perl-module-perlio \
+    perl-module-perlio-encoding \
+    perl-module-perlio-scalar \
+    perl-module-test-more \
+    perl-module-tie-scalar \
+    perl-module-unicore \
+    perl-module-utf8 \
+    "
+
+BBCLASSEXTEND = "native"
-- 
2.20.1



Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32EE365F2A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:17:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7E9HmDB006937
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Aug 2014 02:17:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 14 Aug 2014 02:17:48 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Thu, 14 Aug 2014 17:13:30 +0800
Message-ID: <1408007615-23880-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1408007615-23880-1-git-send-email-kai.kang@windriver.com>
References: <1408007615-23880-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/6] libdigest-sha1-perl: add recipe
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
X-List-Received-Date: Thu, 14 Aug 2014 09:17:49 -0000
Content-Type: text/plain

Add recipe for libdigest-sha1-perl and enable create -ptest sub-package.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-perl/recipes-perl/libdigest/files/run-ptest   | 16 ++++++++++++++
 .../libdigest/libdigest-sha1-perl_2.13.bb          | 25 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libdigest/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb

diff --git a/meta-perl/recipes-perl/libdigest/files/run-ptest b/meta-perl/recipes-perl/libdigest/files/run-ptest
new file mode 100644
index 0000000..c9f9ca9
--- /dev/null
+++ b/meta-perl/recipes-perl/libdigest/files/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+for case in `find t -type f -name '*.t'`; do
+    perl $case >$case.output 2>&1
+    ret=$?
+    cat $case.output
+    if [ $ret -ne 0 ]; then
+        echo "FAIL: ${case%.t}"
+    elif grep -i 'SKIP' $case.output; then
+        echo "SKIP: ${case%.t}"
+    else
+        echo "PASS: ${case%.t}"
+    fi
+
+    rm -f $case.output
+done
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
new file mode 100644
index 0000000..0371ea6
--- /dev/null
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Perl interface to the SHA-1 algorithm "
+DESCRIPTION = "Digest::SHA1 - Perl interface to the SHA-1 algorithm"
+HOMEPAGE = "http://search.cpan.org/~gaas/Digest-SHA1-2.13/"
+SECTION = "libs"
+
+LICENSE = "Artistic-1.0|GPLv1+"
+LIC_FILES_CHKSUM = "file://README;beginline=10;endline=14;md5=ff5867ebb4bc1103a7a416aef2fce00a"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
+           file://run-ptest \
+          "
+SRC_URI[md5sum] = "bd22388f268434f2b24f64e28bf1aa35"
+SRC_URI[sha256sum] = "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc"
+
+S = "${WORKDIR}/Digest-SHA1-${PV}"
+
+inherit cpan ptest
+
+do_install_ptest () {
+    cp -r ${B}/t ${D}${PTEST_PATH}
+}
+
+BBCLASSEXTEND="native"
+
+FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/Digest/SHA1/.debug/"
-- 
1.9.1



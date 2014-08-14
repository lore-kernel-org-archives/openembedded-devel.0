Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77D1F70A4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 07:54:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7E7sHLN001819
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 00:54:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 14 Aug 2014 00:54:16 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Aug 2014 15:49:55 +0800
Message-ID: <1408002596-9778-5-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1408002596-9778-1-git-send-email-kai.kang@windriver.com>
References: <1408002596-9778-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 5/6] libio-socket-ssl-perl: add recipe
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
X-List-Received-Date: Thu, 14 Aug 2014 07:54:17 -0000
Content-Type: text/plain

Add recipe for libio-socket-ssl-perl. Inherit ptest to enable build
-ptest sub-package and add file 'run-ptest'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-perl/recipes-perl/libio/files/run-ptest       | 16 ++++++++
 .../libio/libio-socket-ssl-perl_1.997.bb           | 45 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libio/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb

diff --git a/meta-perl/recipes-perl/libio/files/run-ptest b/meta-perl/recipes-perl/libio/files/run-ptest
new file mode 100644
index 0000000..1c008b5
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/files/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+for case in `find t -type f -name '*.t'`; do
+	perl $case >$case.output 2>&1
+	ret=$?
+	cat $case.output
+	if [ $ret -ne 0 ]; then
+		echo "FAIL: ${case%.t}"
+	elif grep -i 'SKIP' $case.output; then
+		echo "SKIP: ${case%.t}"
+	else
+		echo "PASS: ${case%.t}"
+	fi
+
+	rm -f $case.output
+done
diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
new file mode 100644
index 0000000..3eaea92
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Perl library for transparent SSL"
+DESCRIPTION = "This module is a true drop-in replacement for IO::Socket::INET that \
+uses SSL to encrypt data before it is transferred to a remote server \
+or client. IO::Socket::SSL supports all the extra features that one \
+needs to write a full-featured SSL client or server application: \
+multiple SSL contexts, cipher selection, certificate verification, and \
+SSL version selection. As an extra bonus, it works perfectly with \
+mod_perl."
+HOMEPAGE = "http://search.cpan.org/dist/IO-Socket-SSL/"
+SECTION = "libs"
+
+LICENSE = "Artistic-1.0|GPLv1+"
+LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
+
+RDEPENDS_${PN} += "perl-module-scalar-util libnet-ssleay-perl"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
+           file://run-ptest \
+          "
+SRC_URI[md5sum] = "2a6268bb42da81e69d1c1feb2fcb0eea"
+SRC_URI[sha256sum] = "acdb67b5b63aea5b7e70c3e4c70a16128810329592b63753a38c794aff76a1dd"
+
+S = "${WORKDIR}/IO-Socket-SSL-${PV}"
+
+inherit cpan ptest
+
+PACKAGE_ARCH = "all"
+
+do_install_append () {
+        mkdir -p ${D}${docdir}/${PN}/
+        cp ${S}/BUGS ${D}${docdir}/${PN}/
+        cp ${S}/Changes ${D}${docdir}/${PN}/
+        cp ${S}/README ${D}${docdir}/${PN}/
+        cp -pRP ${S}/docs ${D}${docdir}/${PN}/
+        cp -pRP ${S}/certs ${D}${docdir}/${PN}/
+        cp -pRP ${S}/example ${D}${docdir}/${PN}/
+        cp -pRP ${S}/util ${D}${docdir}/${PN}/
+}
+
+do_install_ptest () {
+	cp -r ${B}/t ${D}${PTEST_PATH}
+	cp -r ${B}/certs ${D}${PTEST_PATH}
+}
+
+BBCLASSEXTEND = "native"
-- 
1.9.1



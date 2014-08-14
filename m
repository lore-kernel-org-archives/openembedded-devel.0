Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F71460CFC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 07:54:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7E7sFIw006063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 00:54:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 14 Aug 2014 00:54:15 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Aug 2014 15:49:54 +0800
Message-ID: <1408002596-9778-4-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1408002596-9778-1-git-send-email-kai.kang@windriver.com>
References: <1408002596-9778-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 4/6] libnet-ssleay-perl: add recipe
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

Add recipe for libnet-ssleay-perl. Inherit ptest to enable build
-ptest sub-package and add file 'run-ptest'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-perl/recipes-perl/libnet/files/run-ptest      | 16 ++++++++
 .../recipes-perl/libnet/libnet-ssleay-perl_1.65.bb | 43 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libnet/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb

diff --git a/meta-perl/recipes-perl/libnet/files/run-ptest b/meta-perl/recipes-perl/libnet/files/run-ptest
new file mode 100644
index 0000000..1c008b5
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/files/run-ptest
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
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
new file mode 100644
index 0000000..8e4ba2a
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Net::SSLeay - Perl extension for using OpenSSL"
+DESCRIPTION = "This module offers some high level convenience functions for accessing \
+web pages on SSL servers (for symmetry, same API is offered for \
+accessing http servers, too), a sslcat() function for writing your own \
+clients, and finally access to the SSL api of SSLeay/OpenSSL package \
+so you can write servers or clients for more complicated applications."
+HOMEPAGE = "http://search.cpan.org/dist/Net-SSLeay/"
+SECTION = "libs"
+
+LICENSE = "OpenSSL"
+LIC_FILES_CHKSUM = "file://README;beginline=274;endline=294;md5=49f415984b387be999ee2ad0e5c692fe"
+
+DEPENDS = "openssl zlib"
+RDEPENDS_${PN} += " \
+	perl-module-carp \
+	perl-module-errno \
+	perl-module-extutils-makemaker \
+	perl-module-mime-base64 \
+	perl-module-socket \
+	"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
+           file://run-ptest \
+          "
+SRC_URI[md5sum] = "19600c036e9e0bbfbf9157f083e40755"
+SRC_URI[sha256sum] = "2fb1371120b85f018944d95736c107163f04ba56b6029c0709a2c3d6247b9c06"
+
+S = "${WORKDIR}/Net-SSLeay-${PV}"
+
+inherit cpan ptest
+
+EXTRA_CPANFLAGS = "LIBS='-L=${libdir} -L=${base_libdir}' \
+              INC=-I=${includedir} \
+              'EXTRALIBS=-lssl -lcrypto -lz' \
+              'LDLOADLIBS=-lssl -lcrypto -lz'"
+
+do_install_ptest() {
+	cp -r ${B}/t ${D}${PTEST_PATH}
+}
+
+BBCLASSEXTEND = "native"
+
+FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/Net/SSLeay/.debug/"
-- 
1.9.1



Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77DE470BF9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 07:54:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7E7sEjg001812
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 00:54:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 14 Aug 2014 00:54:14 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Aug 2014 15:49:53 +0800
Message-ID: <1408002596-9778-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1408002596-9778-1-git-send-email-kai.kang@windriver.com>
References: <1408002596-9778-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 3/6] libauthen-sasl-perl: add recipe
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

Add recipe for libauthen-sasl-perl. Inherit ptest to enable build -ptest
sub-package and add file 'run-ptest'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-perl/recipes-perl/libauthen/files/run-ptest   | 16 ++++++++++++
 .../libauthen/libauthen-sasl-perl_2.16.bb          | 30 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libauthen/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb

diff --git a/meta-perl/recipes-perl/libauthen/files/run-ptest b/meta-perl/recipes-perl/libauthen/files/run-ptest
new file mode 100644
index 0000000..1c008b5
--- /dev/null
+++ b/meta-perl/recipes-perl/libauthen/files/run-ptest
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
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
new file mode 100644
index 0000000..361bdf1
--- /dev/null
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
@@ -0,0 +1,30 @@
+SUMMARY = "SASL Authentication framework for Perl"
+DESCRIPTION = "SASL is a generic mechanism for authentication used by several network \
+protocols. Authen::SASL provides an implementation framework that all \
+protocols should be able to share."
+HOMEPAGE = "http://search.cpan.org/dist/Authen-SASL/"
+SECTION = "libs"
+
+LICENSE = "Artistic-1.0|GPL-1.0+"
+LIC_FILES_CHKSUM = "file://lib/Authen/SASL/Perl.pm;beginline=1;endline=3;md5=17123315bbcda19f484c07227594a609"
+
+DEPENDS = "perl"
+RDEPENDS_${PN} = "libdigest-hmac-perl"
+
+SRC_URI = "http://www.cpan.org/authors/id/G/GB/GBARR/Authen-SASL-${PV}.tar.gz \
+           file://run-ptest \
+          "
+SRC_URI[md5sum] = "7c03a689d4c689e5a9e2f18a1c586b2f"
+SRC_URI[sha256sum] = "6614fa7518f094f853741b63c73f3627168c5d3aca89b1d02b1016dc32854e09"
+
+S = "${WORKDIR}/Authen-SASL-${PV}"
+
+inherit cpan ptest
+
+do_install_ptest () {
+    cp -r ${B}/t ${D}${PTEST_PATH}
+}
+
+PACKAGE_ARCH = "all"
+BBCLASSEXTEND = "native"
+
-- 
1.9.1



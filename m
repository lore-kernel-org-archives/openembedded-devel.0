Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC2D470BE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:17:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7E9HuZd015927
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Aug 2014 02:17:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 14 Aug 2014 02:17:55 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Thu, 14 Aug 2014 17:13:35 +0800
Message-ID: <1408007615-23880-7-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1408007615-23880-1-git-send-email-kai.kang@windriver.com>
References: <1408007615-23880-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/6] libmime-types-perl: add recipe
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
X-List-Received-Date: Thu, 14 Aug 2014 09:17:57 -0000
Content-Type: text/plain

Add recipe for libmime-types-perl. Enable to create ptest sub-package at
same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-perl/recipes-perl/libmime/files/run-ptest     | 16 +++++++++++++
 .../libmime/libmime-types-perl_2.04.bb             | 26 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmime/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libmime/libmime-types-perl_2.04.bb

diff --git a/meta-perl/recipes-perl/libmime/files/run-ptest b/meta-perl/recipes-perl/libmime/files/run-ptest
new file mode 100644
index 0000000..c9f9ca9
--- /dev/null
+++ b/meta-perl/recipes-perl/libmime/files/run-ptest
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
diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.04.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.04.bb
new file mode 100644
index 0000000..ef53029
--- /dev/null
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.04.bb
@@ -0,0 +1,26 @@
+SUMMARY = "MIME::Types - Definition of MIME types"
+DESCRIPTION = "MIME types are used in MIME compliant lines, for instance \
+as part of e-mail and HTTP traffic, to indicate the type of content which \
+is transmitted. Sometimes real knowledge about a mime-type is need.\
+\n\
+This module maintains a set of MIME::Type objects, which each describe \
+one known mime type."
+HOMEPAGE = "http://search.cpan.org/~markov/MIME-Types-${PV}"
+SECTION = "libraries"
+
+LICENSE = "Artistic-1.0|GPLv1+"
+LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
+           file://run-ptest \
+          "
+SRC_URI[md5sum] = "e292bbf7756bb4999407f3f660697168"
+SRC_URI[sha256sum] = "22b6069d372d587b1f2ecc6d0aaf50fb5c64920caed8c214b9884e64538acc8f"
+
+S = "${WORKDIR}/MIME-Types-${PV}"
+
+inherit cpan ptest
+
+do_install_ptest () {
+    cp -r ${B}/t ${D}${PTEST_PATH}
+}
-- 
1.9.1



Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DCD077C99
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 08:22:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3Q8MLn5023728
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 01:22:24 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Apr 2017 01:22:19 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Apr 2017 16:22:03 +0800
Message-ID: <ec23318a870e5056cd1c4c484dbd1faa048eace2.1493194374.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493194374.git.jackie.huang@windriver.com>
References: <cover.1493194374.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 4/8 v2] libdata-hexdump-perl: add new recipe
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
X-List-Received-Date: Wed, 26 Apr 2017 08:22:23 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Data::HexDump - Hexadecial Dumper module for perl.

It's required by libauthen-radius-perl.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-perl/recipes-perl/libdata/files/run-ptest     | 16 +++++++++++
 .../libdata/libdata-hexdump-perl_0.02.bb           | 33 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libdata/files/run-ptest
 create mode 100644 meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb

diff --git a/meta-perl/recipes-perl/libdata/files/run-ptest b/meta-perl/recipes-perl/libdata/files/run-ptest
new file mode 100644
index 000000000..c9f9ca94d
--- /dev/null
+++ b/meta-perl/recipes-perl/libdata/files/run-ptest
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
diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
new file mode 100644
index 000000000..6ab5a4204
--- /dev/null
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Data::HexDump - Hexadecial Dumper"
+DESCRIPTION = "Dump in hexadecimal the content of a scalar. The result \
+is returned in a string. Each line of the result consists of the offset \
+in the source in the leftmost column of each line, followed by one or \
+more columns of data from the source in hexadecimal. The rightmost column \
+of each line shows the printable characters \
+(all others are shown as single dots).\
+"
+
+HOMEPAGE = "http://search.cpan.org/~ftassin/Data-HexDump-0.02/lib/Data/HexDump.pm"
+SECTION = "libs"
+
+LICENSE = "Artistic-1.0"
+LIC_FILES_CHKSUM = "file://lib/Data/HexDump.pm;beginline=215;endline=217;md5=bf1cd9373f8d1f85fe091ee069a480e9"
+
+DEPENDS = "perl"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FT/FTASSIN/Data-HexDump-${PV}.tar.gz \
+           file://run-ptest \
+"
+SRC_URI[md5sum] = "467b7183d1062ab4a502b50c34e7d67f"
+SRC_URI[sha256sum] = "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb17454d03535cd9be70"
+
+S = "${WORKDIR}/Data-HexDump-${PV}"
+
+inherit cpan ptest
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/t
+    install -m 0755 ${B}/t/* ${D}${PTEST_PATH}/t
+}
+
+BBCLASSEXTEND = "native"
-- 
2.11.0



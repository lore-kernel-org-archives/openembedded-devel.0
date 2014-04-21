Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C97A7609B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 09:13:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3L9D3RA025981
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 02:13:03 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 21 Apr 2014 02:13:02 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 17:13:01 +0800
Message-ID: <1398071581-22628-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2] mariadb: add perl and perl modules to RDEPENDS
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
X-List-Received-Date: Mon, 21 Apr 2014 09:13:09 -0000
Content-Type: text/plain

Perl and perl modules don't be installed in small image, but mariadb-server, mariadb-client
and mariadb-leftovers need them in runtime, so we add them to RDEPENDS.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
index 37a0f0c..861a9b8 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
@@ -116,6 +116,19 @@ FILES_${PN} = " "
 RDEPENDS_${PN} = "${PN}-client ${PN}-server"
 ALLOW_EMPTY_${PN} = "1"
 
+RDEPENDS_${PN}-client = "perl perl-module-getopt-long perl-module-file-temp \
+    perl-module-fcntl perl-module-sys-hostname perl-module-ipc-open3 \
+    perl-module-exporter"
+RDEPENDS_${PN}-server = "perl perl-module-getopt-long perl-module-data-dumper \
+    perl-module-file-basename perl-module-file-path perl-module-sys-hostname \
+    perl-module-file-copy perl-module-file-temp perl-module-posix"
+RDEPENDS_${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-module-getopt-long \
+    perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-module-threads \
+    perl-module-threads-shared perl-module-io-socket perl-module-sys-hostname perl-module-file-copy \
+    perl-module-file-spec perl-module-file-find perl-module-file-basename perl-module-file-path \
+    perl-module-constant perl-module-lib perl-module-file-temp perl-module-file-spec-functions \
+    perl-module-io-socket-inet perl-module-io-select"
+
 FILES_libmysqlclient = "\
     ${libdir}/libmysqlclient.so.* \
     ${libdir}/plugin/*.so.*"
-- 
1.7.9.5



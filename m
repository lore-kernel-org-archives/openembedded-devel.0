Return-Path: <dingo@movis.dk>
Received: from sabrina (0904ds6-noe.0.fullrate.dk [89.150.185.1])
	by mail.openembedded.org (Postfix) with ESMTP id EA04A6AFB5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 12:17:09 +0000 (UTC)
Received: by sabrina (Postfix, from userid 1000)
	id 00EFF1C40155; Mon, 19 Aug 2013 14:16:48 +0200 (CEST)
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Aug 2013 14:16:38 +0200
Message-Id: <1376914598-18054-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] perl-module-common-sense: added, perl-module-json-xs: added
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
X-List-Received-Date: Mon, 19 Aug 2013 12:17:10 -0000

Added JSON::XS and it's dependency common::sense
My apologies for any previous malformatted commits.

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../perl-module-common-sense_3.6.bb                   |   17 +++++++++++++++++
 .../perl-module-json-xs/perl-module-json-xs_2.34.bb   |   17 +++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-perl/recipes-perl/perl-module-common-sense/perl-module-common-sense_3.6.bb
 create mode 100644 meta-perl/recipes-perl/perl-module-json-xs/perl-module-json-xs_2.34.bb

diff --git a/meta-perl/recipes-perl/perl-module-common-sense/perl-module-common-sense_3.6.bb b/meta-perl/recipes-perl/perl-module-common-sense/perl-module-common-sense_3.6.bb
new file mode 100644
index 0000000..4373cfc
--- /dev/null
+++ b/meta-perl/recipes-perl/perl-module-common-sense/perl-module-common-sense_3.6.bb
@@ -0,0 +1,17 @@
+SUMMARY = "common::sense - save a tree AND a kitten, use common::sense!"
+AUTHOR = "Marc Lehmann"
+HOMEPAGE = "http://search.cpan.org/~mlehmann/common-sense-3.6/sense.pm.PL"
+SECTION = "cpan"
+LICENSE = "GPLv1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=043dba8b278e1db1b0ef93f30140b02b"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/common-sense-3.6.tar.gz"
+SRC_URI[md5sum] = "9332e9fe85b0bce8c287a0429d164809"
+SRC_URI[sha256sum] = "86e2c2e109a7dd4bc5441757e729d7d622da125c6e14607a78fb56e057b86b5a"
+
+S = "${WORKDIR}/common-sense-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
+
diff --git a/meta-perl/recipes-perl/perl-module-json-xs/perl-module-json-xs_2.34.bb b/meta-perl/recipes-perl/perl-module-json-xs/perl-module-json-xs_2.34.bb
new file mode 100644
index 0000000..cb69e8c
--- /dev/null
+++ b/meta-perl/recipes-perl/perl-module-json-xs/perl-module-json-xs_2.34.bb
@@ -0,0 +1,17 @@
+SUMMARY = "JSON::XS - JSON serialising/deserialising, done correctly and fast"
+AUTHOR = "Marc Lehmann <schmorp@schmorp.de>"
+HOMEPAGE = "https://metacpan.org/module/JSON::XS"
+SECTION = "cpan"
+LICENSE = "GPLv1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=043dba8b278e1db1b0ef93f30140b02b"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/JSON-XS-2.34.tar.gz"
+SRC_URI[md5sum] = "dda3c03335665cdeff91c37a269b833b"
+SRC_URI[sha256sum] = "a62fdf2777b9ae206aef382dbb62c9a126ce2ceef0229edacee3f6a9c78900ea"
+
+S = "${WORKDIR}/JSON-XS-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
+
-- 
1.7.10.4



Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C93156B602
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 04:35:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7C4ZohV010760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2013 21:35:51 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 11 Aug 2013 21:35:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Aug 2013 12:35:39 +0800
Message-ID: <84692d835f62f98c31b812786e840f5f2faefbd2.1376281943.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376281943.git.hongxu.jia@windriver.com>
References: <cover.1376281943.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-cpan 2/3] libdbi-perl: add version 1.628
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
X-List-Received-Date: Mon, 12 Aug 2013 04:35:51 -0000
Content-Type: text/plain

The DBI is a database access module for the Perl programming language.
It defines a set of methods, variables, and conventions that provide
a consistent database interface, independent of the actual database
being used.
             |<- Scope of DBI ->|
                  .-.   .--------------.   .-------------.
  .-------.       | |---| XYZ Driver   |---| XYZ Engine  |
  | Perl  |       | |   `--------------'   `-------------'
  | script|  |A|  |D|   .--------------.   .-------------.
  | using |--|P|--|B|---|Oracle Driver |---|Oracle Engine|
  | DBI   |  |I|  |I|   `--------------'   `-------------'
  | API   |       | |...
  |methods|       | |... Other drivers
  `-------'       | |...
                  `-'

[YOCTO #4128]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-perl/libdb/libdbi-perl_1.628.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 recipes-perl/libdb/libdbi-perl_1.628.bb

diff --git a/recipes-perl/libdb/libdbi-perl_1.628.bb b/recipes-perl/libdb/libdbi-perl_1.628.bb
new file mode 100644
index 0000000..38bdf61
--- /dev/null
+++ b/recipes-perl/libdb/libdbi-perl_1.628.bb
@@ -0,0 +1,26 @@
+SUMMARY = "The Perl Database Interface"
+DESCRIPTION = "DBI is a database access Application Programming Interface \
+(API) for the Perl Language. The DBI API Specification defines a set \
+of functions, variables and conventions that provide a consistent \
+database interface independent of the actual database being used. \
+"
+HOMEPAGE = "http://search.cpan.org/dist/DBI/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+RDEPENDS_${PN} = " perl-module-carp \
+                   perl-module-exporter \
+                   perl-module-exporter-heavy \
+                   perl-module-dynaloader \
+"
+
+LIC_FILES_CHKSUM = "file://DBI.pm;beginline=8147;endline=8151;md5=7d9e154a9ca3c093d2422f7c692d5861"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
+SRC_URI[md5sum] = "4273f8cc6ee3979ce448c7eb3f8a6a5a"
+SRC_URI[sha256sum] = "46c834f4ba1b28c8d8a2db8095835a67fc69a9585761523aea3a74437a969b52"
+
+S = "${WORKDIR}/DBI-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.1.2



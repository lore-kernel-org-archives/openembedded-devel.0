Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 50A9F708A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 02:19:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6U2JT1o015449
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 19:19:29 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 29 Jul 2014 19:19:24 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Jul 2014 10:19:27 +0800
Message-ID: <1406686767-18013-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH v3][meta-perl] libxml-filter-buffertext-perl: add recipe
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
X-List-Received-Date: Wed, 30 Jul 2014 02:19:30 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../libxml/libxml-filter-buffertext-perl_1.01.bb   |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb

diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
new file mode 100644
index 0000000..77dd616
--- /dev/null
+++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
@@ -0,0 +1,25 @@
+SUMMARY = "XML::Filter::BufferText - Filter to put all characters() in one event"
+DESCRIPTION = "\
+The XML::Filter::BufferText module is a very simple filter.  One common \
+cause of grief (and programmer error) is that XML parsers aren't required \
+to provide character events in one chunk.  They can, but are not forced \
+to, and most don't.  This filter does the trivial but oft-repeated task \
+of putting all characters into a single event. \
+"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPLv1+"
+HOMEPAGE = "http://search.cpan.org/dist/XML-Filter-BufferText/"
+DEPENDS += "libxml-sax-perl-native"
+RDEPENDS_${PN} += "libxml-sax-perl"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RB/RBERJON/XML-Filter-BufferText-${PV}.tar.gz"
+SRC_URI[md5sum] = "2992c0387632583b966ab9c965b25512"
+SRC_URI[sha256sum] = "8fd2126d3beec554df852919f4739e689202cbba6a17506e9b66ea165841a75c"
+
+LIC_FILES_CHKSUM = "file://BufferText.pm;beginline=88;endline=90;md5=497aa6d79cc84c3d769a2a0016bee928"
+
+S = "${WORKDIR}/XML-Filter-BufferText-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4



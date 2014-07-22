Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7D0765E48
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:06:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6M76mDB009072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:06:48 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 00:06:48 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Jul 2014 15:06:53 +0800
Message-ID: <1406012813-21233-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH v2][meta-perl] libxml-sax-writer-perl: add recipe
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
X-List-Received-Date: Tue, 22 Jul 2014 07:06:48 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../libxml/libxml-sax-writer-perl_0.54.bb          |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb

diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
new file mode 100644
index 0000000..52458e4
--- /dev/null
+++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
@@ -0,0 +1,25 @@
+SUMMARY = "XML::SAX::Writer - SAX2 Writer"
+DESCRIPTION = "\
+XML::SAX::Writer helps to serialize SAX2 representations of XML documents to \
+strings, files, and other flat representations. It handles charset encodings, \
+XML escaping conventions, and so forth. It is still considered alpha, \
+although it has been put to limited use in settings such as XML::LibXML and \
+the AxKit XML Application Server. \
+"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPLv1+"
+HOMEPAGE = "http://search.cpan.org/dist/XML-SAX-Writer/"
+DEPENDS += "libxml-filter-buffertext-perl-native"
+RDEPENDS_${PN} += "libxml-filter-buffertext-perl"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
+SRC_URI[md5sum] = "383139d76418a82b9800dc4f8b568891"
+SRC_URI[sha256sum] = "a1b4d959aed8f8337523c4cef4b431e56e619c795dc6f99a868548952101cf3d"
+
+LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=d41d8cd98f00b204e9800998ecf8427e"
+
+S = "${WORKDIR}/XML-SAX-Writer-${PV}"
+
+inherit cpan allarch
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4



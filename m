Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3DFB6FF76
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:28:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8N9SQCd016893
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 02:28:26 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 23 Sep 2016 02:28:25 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Sep 2016 17:24:47 +0800
Message-ID: <1474622687-10511-4-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1474622687-10511-1-git-send-email-mingli.yu@windriver.com>
References: <1474622687-10511-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 3/3] libdbd-mysql-perl: add new recipe
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
X-List-Received-Date: Fri, 23 Sep 2016 09:28:24 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add new recipe libdbd-mysql-perl as mariadb-server
  rdepends on it

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../perl/libdbd-mysql-perl_4.036.bb                | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.036.bb

diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.036.bb b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.036.bb
new file mode 100644
index 0000000..f5dbef2
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.036.bb
@@ -0,0 +1,25 @@
+SUMMARY = "A Perl DBI driver for MySQL"
+DESCRIPTION = "DBD::mysql is the Perl5 Database Interface driver for \
+the MySQL database. In other words: DBD::mysql is an interface between \
+the Perl programming language and the MySQL programming API that comes \
+with the MySQL relational database management system. Most functions \
+provided by this programming API are supported. Some rarely used \
+functions are missing, mainly because no-one ever requested them. \
+"
+HOMEPAGE = "http://search.cpan.org/~michielb/DBD-mysql-4.036/lib/DBD/mysql.pm"
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+DEPENDS += "libdbi-perl-native libmysqlclient"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d0a06964340e5c0cde88b7af611f755c"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MICHIELB/DBD-mysql-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "fdee1d8dc4ae54bc6cb7cd5a3f3d3342"
+SRC_URI[sha256sum] = "5c48a823f86b8110ccb6504c6176ca248b52f56829dd4548bc39c3509f4154cf"
+
+S = "${WORKDIR}/DBD-mysql-${PV}"
+
+inherit cpan
-- 
2.8.1



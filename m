Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3DDE960686
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:55:19 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 27 Aug 2013 09:55:15 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id BAB7528B66D;
	Tue, 27 Aug 2013 09:55:15 +0200 (CEST)
From: <maxin.john@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Aug 2013 09:55:14 +0200
Message-ID: <1377590114-39545-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: paul.eggleton@linux.intel.com
Subject: [meta-oe] [PATCH v2] log4cplus: add recipe
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
X-List-Received-Date: Tue, 27 Aug 2013 07:55:19 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

log4cplus provides a simple C++ logging API for log management.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../recipes-devtools/log4cplus/log4cplus_1.1.1.bb    |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
new file mode 100644
index 0000000..e0ae1e6
--- /dev/null
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "log4cplus provides a simple C++ logging API for log management"
+SECTION = "libs"
+HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
+BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://INSTALL;md5=fd3fffde3e364ca1fb46c81b741a766a"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/log4cplus/log4cplus-stable/${PV}/log4cplus-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "104bd6dd07ee71bc52ee9adca4d4d5fc"
+SRC_URI[sha256sum] = "96905e763fc6f1e3a854c3d1964c21e877de909bdddd0aed99806c62a68be838"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND += "native"
-- 
1.7.10.4



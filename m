Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1THo2b-0007bu-90
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Sep 2012 05:48:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8T3ZcWP014571
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2012 20:35:38 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Fri, 28 Sep 2012 20:35:37 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 29 Sep 2012 11:35:36 +0800
Message-ID: <1348889736-6462-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [meta-oe][PATCH v2] iw: update to 3.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Sep 2012 03:48:33 -0000
Content-Type: text/plain

iw: update to 3.6

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-connectivity/iw/iw_3.6.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/iw/iw_3.6.bb

diff --git a/meta-oe/recipes-connectivity/iw/iw_3.6.bb b/meta-oe/recipes-connectivity/iw/iw_3.6.bb
new file mode 100644
index 0000000..42a43c3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iw/iw_3.6.bb
@@ -0,0 +1,23 @@
+SUMMARY = "nl80211 based CLI configuration utility for wireless devices"
+DESCRIPTION = "iw is a new nl80211 based CLI configuration utility for \
+wireless devices. It supports almost all new drivers that have been added \
+to the kernel recently. "
+HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
+SECTION = "base"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
+
+DEPENDS = "libnl pkgconfig"
+
+SRC_URI = "http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
+           file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
+          "
+
+SRC_URI[md5sum] = "1c18bfbbc8773629e5e8ac733a39540c"
+SRC_URI[sha256sum] = "df11036ac11df31f44083da962a6e9c74bdea7c01c596c4b5840f948cdb6c857"
+
+EXTRA_OEMAKE = ""
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
-- 
1.7.4




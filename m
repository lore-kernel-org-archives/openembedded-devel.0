Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TL6vX-00026p-I7
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Oct 2012 08:34:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q986Lnq1002194
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Oct 2012 23:21:49 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sun, 7 Oct 2012 23:21:48 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Oct 2012 14:21:47 +0800
Message-ID: <1349677307-6317-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Subject: [PATCH] iw: update to 3.6
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
X-List-Received-Date: Mon, 08 Oct 2012 06:34:56 -0000
Content-Type: text/plain

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../iw/{iw_3.2.bb => iw_3.6.bb}                    |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/iw/{iw_3.2.bb => iw_3.6.bb} (50%)

diff --git a/meta-oe/recipes-connectivity/iw/iw_3.2.bb b/meta-oe/recipes-connectivity/iw/iw_3.6.bb
similarity index 50%
rename from meta-oe/recipes-connectivity/iw/iw_3.2.bb
rename to meta-oe/recipes-connectivity/iw/iw_3.6.bb
index 65e7c8f..42a43c3 100644
--- a/meta-oe/recipes-connectivity/iw/iw_3.2.bb
+++ b/meta-oe/recipes-connectivity/iw/iw_3.6.bb
@@ -1,21 +1,22 @@
-DESCRIPTION = "nl80211 based CLI configuration utility for wireless devices"
+SUMMARY = "nl80211 based CLI configuration utility for wireless devices"
+DESCRIPTION = "iw is a new nl80211 based CLI configuration utility for \
+wireless devices. It supports almost all new drivers that have been added \
+to the kernel recently. "
 HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
 SECTION = "base"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
 
-PR = "r1"
-
 DEPENDS = "libnl pkgconfig"
 
 SRC_URI = "http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
            file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
           "
 
-SRC_URI[md5sum] = "80615c972a287dcd50890735469b0d1c"
-SRC_URI[sha256sum] = "370edabe6f73cc55be77a7502a3a25d23ec2aea900ae4ca3cec19d55bf8bdb12"
+SRC_URI[md5sum] = "1c18bfbbc8773629e5e8ac733a39540c"
+SRC_URI[sha256sum] = "df11036ac11df31f44083da962a6e9c74bdea7c01c596c4b5840f948cdb6c857"
 
-CFLAGS += "-DCONFIG_LIBNL30"
+EXTRA_OEMAKE = ""
 
 do_install() {
 	oe_runmake DESTDIR=${D} install
-- 
1.7.4




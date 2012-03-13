Received: from asmtpout023.mac.com ([17.148.16.98])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.zauner@me.com>) id 1S7X9b-0000oD-SY
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Mar 2012 20:13:05 +0100
Received: from localhost.localdomain
	(p5B0A23D2.dip.t-dialin.net [91.10.35.210]) by asmtp023.mac.com
	(Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit
	(built Aug
	10 2011)) with ESMTPSA id <0M0U005N24UJUZ20@asmtp023.mac.com> for
	openembedded-devel@lists.openembedded.org; Tue,
	13 Mar 2012 18:04:04 +0000 (GMT)
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.6.7498,1.0.260,0.0.0000
	definitions=2012-03-13_05:2012-03-13, 2012-03-13,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=4 phishscore=0 bulkscore=0 adultscore=0
	classifier=spam
	adjust=0 reason=mlx scancount=1 engine=6.0.2-1012030000
	definitions=main-1203130175
From: Daniel Zauner <daniel.zauner@me.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Mar 2012 19:03:51 +0100
Message-id: <1331661831-1684-1-git-send-email-daniel.zauner@me.com>
X-Mailer: git-send-email 1.7.2.5
In-reply-to: <20120313175009.GA12674@bill-the-cat>
References: <20120313175009.GA12674@bill-the-cat>
Subject: [PATCH v3][2011.03-maintenance] Changed the Source-URI from (currently?) dead openmoko SVN-Server to new git-repository at git.yoctoproject.org
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
X-List-Received-Date: Tue, 13 Mar 2012 19:13:05 -0000
Content-transfer-encoding: 7BIT

Signed-off-by: Daniel Zauner <daniel.zauner@me.com>
---
 .../{opkg-utils_svn.bb => opkg-utils_git.bb}       |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)
 rename recipes/opkg-utils/{opkg-utils_svn.bb => opkg-utils_git.bb} (68%)

diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_git.bb
similarity index 68%
rename from recipes/opkg-utils/opkg-utils_svn.bb
rename to recipes/opkg-utils/opkg-utils_git.bb
index 6b8d3ea..6adc7c1 100644
--- a/recipes/opkg-utils/opkg-utils_svn.bb
+++ b/recipes/opkg-utils/opkg-utils_git.bb
@@ -2,17 +2,19 @@ DESCRIPTION = "OPKG Package Manager Utilities"
 SECTION = "base"
 HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
 PRIORITY = "optional"
+LICENSE = "GPLv2"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "4747"
-PV = "0.1.8+svnr${SRCPV}"
-PR = "r6"
+SRCREV = "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
+PV = "0.1.8+gitr${SRCPV}"
+PR = "r0"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
+SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
            file://index-ignore-filenotfound.patch \
+           file://arfile_header_split.patch \
            file://mtime-int.patch"
 
-S = "${WORKDIR}/opkg-utils"
+S = "${WORKDIR}/git"
 
 # Avoid circular dependencies from package_ipk.bbclass
 PACKAGES_virtclass-native = ""
-- 
1.7.2.5




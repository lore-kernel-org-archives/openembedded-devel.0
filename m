Return-Path: <eajames@linux.ibm.com>
X-Greylist: delayed 2568 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Oct 2018 19:10:44 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by mail.openembedded.org (Postfix) with ESMTP id 3213C7198A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 19:10:44 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w99IJrFe066701 for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Oct 2018 14:27:57 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2n0wustsp8-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 14:27:56 -0400
Received: from localhost
	by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <openembedded-devel@lists.openembedded.org> from
	<eajames@linux.ibm.com>; Tue, 9 Oct 2018 14:27:55 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
	by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 9 Oct 2018 14:27:53 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
	[9.57.199.111])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	w99IRqlq36634872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 9 Oct 2018 18:27:52 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DBD2AC059;
	Tue,  9 Oct 2018 14:27:01 -0400 (EDT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8E54AC05B;
	Tue,  9 Oct 2018 14:27:00 -0400 (EDT)
Received: from oc6728276242.ibm.com (unknown [9.80.233.74])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue,  9 Oct 2018 14:27:00 -0400 (EDT)
From: Eddie James <eajames@linux.ibm.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2018 13:27:50 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18100918-2213-0000-0000-00000300A99C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009849; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000268; SDB=6.01100251; UDB=6.00569240;
	IPR=6.00880299; 
	MB=3.00023684; MTD=3.00000008; XFM=3.00000015; UTC=2018-10-09 18:27:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18100918-2214-0000-0000-00005BD659DE
Message-Id: <1539109670-43001-1-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-10-09_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1810090175
Subject: [meta-oe][PATCH] libvncserver: Update to latest version
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
X-List-Received-Date: Tue, 09 Oct 2018 19:10:45 -0000

The latest release of libvncserver is almost two years old. A number of
security fixes and enhancements have recently been committed. Since the repo
is stable, point the recipe to the latest commit.

libvncserver switched from autotools to cmake, so update the recipe as
necessary, and add PACKAGECONFIG options to allow a more minimal build and
install.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../libvncserver/libvncserver_0.9.11.bb            | 25 ----------------------
 .../libvncserver/libvncserver_git.bb               | 23 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 25 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
deleted file mode 100644
index 38dac06..0000000
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "library for easy implementation of a RDP/VNC server"
-HOMEPAGE = "https://libvnc.github.io"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
-
-DEPENDS += "zlib libsdl jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
-PACKAGECONFIG[systemd] = ",,systemd"
-
-RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
-
-inherit distro_features_check autotools binconfig pkgconfig
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "https://github.com/LibVNC/libvncserver/archive/LibVNCServer-${PV}.tar.gz"
-SRC_URI[md5sum] = "7f06104d5c009813e95142932c4ddb06"
-SRC_URI[sha256sum] = "193d630372722a532136fd25c5326b2ca1a636cbb8bf9bb115ef869c804d2894"
-
-S = "${WORKDIR}/${BPN}-LibVNCServer-${PV}"
-
-TARGET_LDFLAGS += "-lgcrypt"
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
new file mode 100644
index 0000000..9fb2c09
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "library for easy implementation of a RDP/VNC server"
+HOMEPAGE = "https://libvnc.github.io"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
+
+PACKAGECONFIG ??= "gcrypt gnutls jpeg png ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl zlib"
+PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
+PACKAGECONFIG[gnutls] = ",,gnutls"
+PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
+PACKAGECONFIG[openssl] = ",,openssl"
+PACKAGECONFIG[png] = ",-DWITH_PNG=OFF,libpng,libpng"
+PACKAGECONFIG[systemd] = ",,systemd"
+PACKAGECONFIG[sdl] = ",,libsdl2"
+PACKAGECONFIG[zlib] = ",,zlib"
+
+inherit cmake
+
+SRC_URI = "git://github.com/LibVNC/libvncserver"
+SRCREV = "7b1ef0ffc4815cab9a96c7278394152bdc89dc4d"
+
+S = "${WORKDIR}/git"
-- 
2.7.4



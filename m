Received: from ams-iport-4.cisco.com ([144.254.224.147])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1Svmml-0006eo-5s
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 12:01:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=2066; q=dns/txt;
	s=iport; t=1343641777; x=1344851377;
	h=from:to:cc:subject:date:message-id;
	bh=k6/e+Pb4H0dqUpyc7iq8wvx/ULhtemzjjxNZNfdqTcA=;
	b=hWU7vXdTDmNri2M+ChjWiWJ0fEZn57dWghUo2rmes/BooJWvLFc0/c4+
	ljZE8w90MuerSCHyu0NvNy7AmhMtDN1koGIhAFajB1VoLMrqSyTFLoAca
	lucbH390xCVkccKEJ/XCURbfAjdl32yLAbhmoD5UYziui0ae4fmzkjI9y o=;
X-IronPort-AV: E=Sophos;i="4.77,679,1336348800"; 
   d="scan'208";a="7002046"
Received: from ams-core-2.cisco.com ([144.254.72.75])
	by ams-iport-4.cisco.com with ESMTP; 30 Jul 2012 09:49:35 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id q6U9nZsk027006;
	Mon, 30 Jul 2012 09:49:35 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jul 2012 11:49:33 +0200
Message-Id: <1343641773-16593-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] recipes-devtools/autoconf-archive: new recipes for autoconf-archive
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
X-List-Received-Date: Mon, 30 Jul 2012 10:01:11 -0000

Add a new recipes which provides autoconf-archive 2012.04.07. This gives quite a few m4 files,
which might be useful in toolchains.
---
 .../autoconf-archive/autoconf-archive.inc          |   15 +++++++++++++++
 .../autoconf-archive_2012.04.07.bb                 |   14 ++++++++++++++
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
 create mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb

diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
new file mode 100644
index 0000000..e8785f4
--- /dev/null
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
@@ -0,0 +1,15 @@
+LICENSE = "GPLv3"
+HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
+SECTION = "devel"
+
+DEPENDS += "m4-native"
+DEPENDS_virtclass-native = "m4-native gnu-config-native"
+DEPENDS_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
+
+RDEPENDS_${PN} = "m4 gnu-config"
+RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
+RDEPENDS_${PN}_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
+
+inherit autotools
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
new file mode 100644
index 0000000..c96723f
--- /dev/null
+++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
@@ -0,0 +1,14 @@
+require autoconf-archive.inc
+
+PR = "r0"
+
+PARALLEL_MAKE = ""
+
+LICENSE = "GPLv2 & GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI[md5sum] = "e842c5b9fae021007bd70550362e5e80"
+SRC_URI[sha256sum] = "040b443bf68efd52fbfcb294b556bfbbbfe432db78445ca25e0cfe2e88f96a14"
+
+EXTRA_OECONF += "ac_cv_path_M4=m4"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.8.6




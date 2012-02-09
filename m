Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1Rvb4V-0001bN-Jy
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 21:58:27 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id DA3A1D413
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2012 21:20:44 +0100 (CET)
X-SENDER-IP: [83.227.57.213]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArtWAFYqNE9T4znVPGdsb2JhbABDiVqmBRkBAQEBNzSBcgFRAQojGBhqCi2Hf60gAYYRjF8BCQcWgyOBPIMdBJUwkmM
X-IronPort-AV: E=Sophos;i="4.73,392,1325458800"; d="scan'208";a="266609530"
Received: from c-d539e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.213])
	by ipb1.telenor.se with ESMTP; 09 Feb 2012 21:20:44 +0100
From: ulf@emagii.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Feb 2012 21:20:43 +0100
Message-Id: <1328818845-11049-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH 1/3] bluez4: Add version to 4.98
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
X-List-Received-Date: Thu, 09 Feb 2012 20:58:27 -0000

From: Ulf Samuelsson <ulf@emagii.com>

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 recipes/bluez/bluez4_4.98.bb |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bluez/bluez4_4.98.bb

diff --git a/recipes/bluez/bluez4_4.98.bb b/recipes/bluez/bluez4_4.98.bb
new file mode 100644
index 0000000..e1f371e
--- /dev/null
+++ b/recipes/bluez/bluez4_4.98.bb
@@ -0,0 +1,30 @@
+require bluez4.inc
+
+SRC_URI = "\
+  ${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-${PV}.tar.gz \
+  file://bluetooth.conf \
+"
+SRC_URI[md5sum] = "362864b716950baa04797de735fc237b"
+SRC_URI[sha256sum] = "9a5b655bada7c7a1921cb3bac83b8a32bbe49893e4c7a1377cdc1b0d35f7d233"
+
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_angstrom = "1"
+
+DEPENDS += "libsndfile1"
+
+PR = "${INC_PR}.0"
+
+# Not all distros have a recent enough udev
+BTUDEV = " --disable-udevrules"
+BTUDEV_angstrom = " --enable-udevrules"
+BTUDEV_shr = " --enable-udevrules"
+
+EXTRA_OECONF += "${BTUDEV}"
+do_configure_append(){
+	echo "#define LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE" >> ${S}/config.h
+}
+
+FILES_${PN}-dbg += "\
+  ${base_libdir}/udev/.debug \
+  ${libdir}/*/.debug \
+"
-- 
1.7.4.1




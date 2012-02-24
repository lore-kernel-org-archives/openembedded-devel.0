Received: from pd95cbf07.dip0.t-ipconnect.de ([217.92.191.7] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1S0xUz-0003yX-VF
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 16:55:58 +0100
Received: by localhost (Postfix, from userid 1000)
	id C509BC2CBC; Fri, 24 Feb 2012 16:47:34 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 16:47:20 +0100
Message-Id: <b2ca6d3b61969d9d95ac4c589c8946bfad932551.1330097955.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <c0d07af8a377e188decbae614de96fcf1e78af91.1330097955.git.sledz@dresearch-fe.de>
References: <c0d07af8a377e188decbae614de96fcf1e78af91.1330097955.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1330097955.git.sledz@dresearch-fe.de>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 3/7] bluez4: Add version 4.95
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
X-List-Received-Date: Fri, 24 Feb 2012 15:55:58 -0000

From: Vita Preskovsky <vitap@ti.com>

Signed-off-by: Vita Preskovsky <vitap@ti.com>
Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/bluez/bluez4_4.95.bb |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bluez/bluez4_4.95.bb

diff --git a/recipes/bluez/bluez4_4.95.bb b/recipes/bluez/bluez4_4.95.bb
new file mode 100644
index 0000000..290dff6
--- /dev/null
+++ b/recipes/bluez/bluez4_4.95.bb
@@ -0,0 +1,30 @@
+require bluez4.inc
+
+SRC_URI = "\
+  ${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-${PV}.tar.gz \
+  file://bluetooth.conf \
+"
+SRC_URI[md5sum] = "341294b2849a04a4afff5c96bfbf30b2"
+SRC_URI[sha256sum] = "d6ea9de410fc2bcd2620d709c2202893b218e2e6a55c3c0ce6bebd27fa4120f6"
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
1.7.7




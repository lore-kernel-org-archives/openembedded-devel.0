Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vita.preskovsky@gmail.com>) id 1RDYPz-0008I1-KC
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 11:14:35 +0200
Received: by gyg8 with SMTP id 8so6378688gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4JDz6GIoV4uXp4GKc0xPkD8oWYwdQ0eC2e1ni9TTzPM=;
	b=aKmg3yNnEMzAQ1I3+/v3jwBwjkcEsbU4zk2t4SJqN8tnxPrDFsYVEmCBuMZml3v6bo
	49a9Ew22yYoBiam2QMFz+fG4OBYKi7T0ADLwgXUayNyPBD3f4r4ZrkoBOSrAp2bI2kR8
	Ig4a8x2Yc9KUVIg7en0InCXxTM62AcSA0vtG0=
Received: by 10.236.165.102 with SMTP id d66mr3993059yhl.2.1318324133978;
	Tue, 11 Oct 2011 02:08:53 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id l42sm30336495yhj.12.2011.10.11.02.08.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 02:08:53 -0700 (PDT)
From: Vita Preskovsky <vita.preskovsky@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2011 11:08:42 +0200
Message-Id: <1318324122-16951-1-git-send-email-vitap@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] bluez4_4.95.bb: new recipe for building bluez-4.95
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
X-List-Received-Date: Tue, 11 Oct 2011 09:14:35 -0000

Signed-off-by: Vita Preskovsky <vitap@ti.com>
---
 recipes/bluez/bluez4_4.95.bb |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bluez/bluez4_4.95.bb

diff --git a/recipes/bluez/bluez4_4.95.bb b/recipes/bluez/bluez4_4.95.bb
new file mode 100644
index 0000000..a682d6a
--- /dev/null
+++ b/recipes/bluez/bluez4_4.95.bb
@@ -0,0 +1,30 @@
+require bluez4.inc
+SRC_URI = "\
+  http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
+  file://bluetooth.conf \
+"
+
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
1.7.0.4




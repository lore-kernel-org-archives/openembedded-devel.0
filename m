Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vita.preskovsky@gmail.com>) id 1RPyRk-00070a-Tv
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 16:27:45 +0100
Received: by yenq7 with SMTP id q7so178667yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 07:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=36hMZZuyhTM2++dGAOjylMVZM4TIhP2CSBNt1ztimgY=;
	b=aA4hwRKrLdrIOrOxA2WDr7+NeRJKaj/j3UrMYmZrDOZU0r5pAgfUFut2HBjmvmbY5R
	jRlcjP9ccqcFajgiUJFswICcfP/LEBlivciG0FARPbgSihofCa8NSkH+wCI55S31YA/e
	SKKipenY6mmuLKC8+4Nyw/fzNqoi62LNnPlcg=
Received: by 10.146.179.31 with SMTP id b31mr2594623yaf.38.1321284081880;
	Mon, 14 Nov 2011 07:21:21 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k3sm62054496ann.0.2011.11.14.07.21.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 07:21:18 -0800 (PST)
From: Vita Preskovsky <vita.preskovsky@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Nov 2011 17:20:45 +0200
Message-Id: <1321284045-13726-1-git-send-email-vitap@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] bluez4: Add version 4.95 Signed-off-by: Vita Preskovsky <vitap@ti.com> Adds new recipe that builds bluez-4.95 package
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
X-List-Received-Date: Mon, 14 Nov 2011 15:27:45 -0000

 Second version of the patch adresses comments made by community 
 members. Checked on angstrom, version 2011.09.
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
1.7.0.4




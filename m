Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PLPjf-00006y-5s
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 01:30:52 +0100
Received: by pwi8 with SMTP id 8so141351pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 16:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=5qnbzTK6zka81T/7ViCmOhX/bqvX+PPAWbAZDDmYJ+4=;
	b=C/VBwQqVOiPbLrD4/IJhE9kETjC3zXhALGsM3qyfQt62HoMS6dZPLwhDAZKQRd77Yt
	0CmCFxFOdTQqCsa2l1rJge5moCONhuI45sSRN4T6EoOfu4F4B6L+1v4CDirHyXF6pzVt
	mkakTFbXc8UeVqqzyENPKDL7XCGL0Eeg+1tmA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=bcIHDV2OOEffJxR7bgT2Jvz96s5nEPN62/mpFR5n78mDreB3m9Bdy+fV7jT2LzRtkW
	+rBZ6nmSRG3hjwYhy0Vj7cDtqxJ1AIiUa4W6yJHvaQCYqZbSAiidjrAHQS0gaKUhwgHw
	cqBB/NIthhVwni9f3tnpSpj8E6qTnY9Gs9/Pg=
Received: by 10.142.239.10 with SMTP id m10mr39356wfh.202.1290644974877;
	Wed, 24 Nov 2010 16:29:34 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id y42sm131496wfd.10.2010.11.24.16.29.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 24 Nov 2010 16:29:34 -0800 (PST)
Message-ID: <4CEDADE6.10809@gmail.com>
Date: Thu, 25 Nov 2010 10:59:26 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Remove use of ipkg{,-collateral,-link}.
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
X-List-Received-Date: Thu, 25 Nov 2010 00:30:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

No one should be using these any longer.
 * Opkg conflicts with ipkg.
 * There is opkg, opkg-collateral and ipkg-utils contains ipkg-link.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/images/openprotium-image.bb |    2 +-
 recipes/images/opie-image-16mb.bb   |    1 -
 recipes/images/x11-jvm-image.bb     |    3 ---
 recipes/opkg/opkg-ipkg-compat.bb    |   19 -------------------
 recipes/opkg/opkg.inc               |    3 ++-
 recipes/tasks/task-openprotium.bb   |    3 +--
 recipes/tasks/task-sdk-sbox-gpe.bb  |    3 +--
 recipes/tasks/task-shr-feed.bb      |    3 +--
 8 files changed, 6 insertions(+), 31 deletions(-)
 delete mode 100644 recipes/opkg/opkg-ipkg-compat.bb

diff --git a/recipes/images/openprotium-image.bb b/recipes/images/openprotium-image.bb
index 0f64ba2..3c31a80 100644
--- a/recipes/images/openprotium-image.bb
+++ b/recipes/images/openprotium-image.bb
@@ -22,7 +22,7 @@ IMAGE_PREPROCESS_COMMAND += "echo /dev/md >> ${IMAGE_ROOTFS}/etc/udev/mount.blac
 IMAGE_PREPROCESS_COMMAND += "echo /dev/hd >> ${IMAGE_ROOTFS}/etc/udev/mount.blacklist;"
 IMAGE_PREPROCESS_COMMAND += "echo /dev/mtd3		0x30000		0x10000		0x10000 > ${IMAGE_ROOTFS}/etc/fw_env.config;"
 
-ROOTFS_POSTPROCESS_COMMAND += "ipkg-cl ${IPKG_ARGS} -force-depends \
+ROOTFS_POSTPROCESS_COMMAND += "opkg-cl ${IPKG_ARGS} -force-depends \
                                 remove ${PACKAGE_REMOVE};"
 
 inherit image concatenated-image
diff --git a/recipes/images/opie-image-16mb.bb b/recipes/images/opie-image-16mb.bb
index b4a0e03..8569e95 100644
--- a/recipes/images/opie-image-16mb.bb
+++ b/recipes/images/opie-image-16mb.bb
@@ -4,7 +4,6 @@ DEPENDS = "task-boot task-opie-16mb"
 
 ANGSTROM_EXTRA_INSTALL ?= ""
 IMAGE_INSTALL = "task-boot \
-                    ipkg ipkg-collateral \
                     dropbear \
                     task-opie-16mb-base \
                     task-opie-16mb-applets \
diff --git a/recipes/images/x11-jvm-image.bb b/recipes/images/x11-jvm-image.bb
index fd0e5f0..9fed202 100644
--- a/recipes/images/x11-jvm-image.bb
+++ b/recipes/images/x11-jvm-image.bb
@@ -19,9 +19,6 @@ ADD_JVM = "\
     jamvm \
     cacao "
 
-ADD_OTHER = "\
-    ipkg "
-
 IMAGE_INSTALL = "\
     ${XSERVER} \
     task-base-extended \
diff --git a/recipes/opkg/opkg-ipkg-compat.bb b/recipes/opkg/opkg-ipkg-compat.bb
deleted file mode 100644
index 837b02c..0000000
--- a/recipes/opkg/opkg-ipkg-compat.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Files to make opkg and ipkg coexist"
-RDEPENDS_${PN} = "opkg ipkg ipkg-collateral"
-
-PR = "r1"
-PACKAGE_ARCH = "all"
-
-do_compile() {
-	:
-}
-
-
-do_install () {
-	install -d ${D}${sysconfdir}
-	install -d ${D}/var/lib/ipkg
-	ln -sf ${sysconfdir}/ipkg.conf ${D}${sysconfdir}/opkg.conf
-	ln -sf ${sysconfdir}/ipkg/ ${D}${sysconfdir}/opkg
-	ln -sf /var/lib/ipkg ${D}/var/lib/ipkg
-}
-
diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index ae1622a..0d84626 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -4,7 +4,8 @@ SECTION = "base"
 LICENSE = "GPLv2"
 SRCREV = ${OPKG_SRCREV}
 PV = "0.1.8+svnr${SRCPV}"
-INC_PR = "r2"
+CONFLICTS = "ipkg"
+INC_PR = "r3"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 	   file://configure \
diff --git a/recipes/tasks/task-openprotium.bb b/recipes/tasks/task-openprotium.bb
index 1cfc740..796d8c0 100644
--- a/recipes/tasks/task-openprotium.bb
+++ b/recipes/tasks/task-openprotium.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Basic image for openprotium"
 HOMEPAGE = "http://www.openprotium.org"
 ALLOW_EMPTY = "1"
-PR = "r3"
+PR = "r4"
 
 inherit task
 DISTRO_SSH_DAEMON ?= "dropbear"
@@ -36,7 +36,6 @@ RDEPENDS_${PN} = " kernel \
 	update-modules \
 	module-init-tools \  
 	modutils-initscripts \
-	ipkg-collateral ipkg ipkg-link \
 	portmap \
 	util-linux-ng-blkid \
 	mdadm \
diff --git a/recipes/tasks/task-sdk-sbox-gpe.bb b/recipes/tasks/task-sdk-sbox-gpe.bb
index 8daca11..315bddb 100644
--- a/recipes/tasks/task-sdk-sbox-gpe.bb
+++ b/recipes/tasks/task-sdk-sbox-gpe.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "SDK task for Scratchbox rootstraps incuding GPE/GTK bits"
-PR = "r1"
+PR = "r2"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
@@ -11,7 +11,6 @@ RDEPENDS_${PN} = "\
     gdk-pixbuf-loader-xpm \
     intltool \
     intltool-dev \
-    ipkg \
     ipkg-utils \
     gettext-dev \
     pkgconfig-dev \
diff --git a/recipes/tasks/task-shr-feed.bb b/recipes/tasks/task-shr-feed.bb
index 2e5106a..5be3eff 100644
--- a/recipes/tasks/task-shr-feed.bb
+++ b/recipes/tasks/task-shr-feed.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "SHR Feed"
-PR = "r84"
+PR = "r85"
 PV = "1.0"
 LICENSE = "GPL"
 
@@ -79,7 +79,6 @@ RDEPENDS_${PN} += "\
 		mtpaint \
 		telepathy-python \
 		intone-video \
-		ipkg-link \
 		ipkg-utils \
 		mysql \
 		fltk-chess \
-- 
1.7.1




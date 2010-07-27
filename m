Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OddyP-0001Od-DR
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 08:49:15 +0200
Received: by iwn34 with SMTP id 34so3565436iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 23:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=lTFuExR3r2s3pt16S+hlLIpuWnSa9DxLSCIjgDBNqX8=;
	b=Qh4ZIYcLsJEX7aPuMj92xX4n/dCFRiP/RwSEEpX3IYYQIL3J6CDFmTc82QAVGjpA89
	eySSrNb8FBsW9ZBck01/yaSJXGjAbF0f10bYrfHua7pEsEhYYPjmwixng+5GZzwDolC3
	kikmDOro1yc3EdjC13Znr8laqW/roXTai/OFg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PUZz8ghFRjfQq/YRCFBYjOByJzPunkxaPCdVJJwcBttfwpZ6dOnUEYpU1jG4JHOS0N
	mSLgAjlKgFai77CaNvpyogiO6gZvm6yY+0JaKQQpnUhahlmBMoZqfQSuP1q6bmZJDH4t
	wYo+OetzZkV55tRlpo1gpoqHq3N1m2MZELAnI=
Received: by 10.231.33.67 with SMTP id g3mr9572546ibd.31.1280213333696;
	Mon, 26 Jul 2010 23:48:53 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n20sm4506941ibe.5.2010.07.26.23.48.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Jul 2010 23:48:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 23:48:35 -0700
Message-Id: <1280213315-5513-9-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
References: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 8/8] recipes: Replace ${PN} override with pn-${PN} for PACKAGE_ARCH
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
X-List-Received-Date: Tue, 27 Jul 2010 06:49:15 -0000

* Needed to get CURRENT_TARGET_SYS to evaluate correctly in bitbake.conf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/fbreader/fbreader_0.8.2a.bb              |    2 +-
 recipes/freesmartphone/frameworkd_git.bb         |    2 +-
 recipes/miniinit/miniinit.bb                     |    2 +-
 recipes/mipl-mipv6/mipv6_1.1-v2.4.26.bb          |    2 +-
 recipes/mipl-mipv6/mipv6_2.0.2.bb                |    2 +-
 recipes/obsolete/shr/alsa-scenarii-shr_git.bb    |    2 +-
 recipes/openmoko2/openmoko-alsa-scenarios_svn.bb |    2 +-
 recipes/shadow/shadow.inc                        |    2 +-
 recipes/shr/frameworkd-config-shr_git.bb         |    2 +-
 recipes/sysvinit/sysvinit_2.86.bb                |    2 +-
 recipes/tasks/task-x11.bb                        |    2 +-
 recipes/usb-gadget-mode/usb-gadget-mode.bb       |    2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes/fbreader/fbreader_0.8.2a.bb b/recipes/fbreader/fbreader_0.8.2a.bb
index 50e27c5..c1a2480 100644
--- a/recipes/fbreader/fbreader_0.8.2a.bb
+++ b/recipes/fbreader/fbreader_0.8.2a.bb
@@ -8,7 +8,7 @@ PR = "r7"
 
 # The RESOLUTION is defined at compile time which makes
 # this package MACHINE specific.
-PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
 
 SRC_URI = "http://www.fbreader.org/obsolete/fbreader-sources-${PV}.tgz \
 	   file://fbreader-0.8.2a_buildsys_oe.patch \
diff --git a/recipes/freesmartphone/frameworkd_git.bb b/recipes/freesmartphone/frameworkd_git.bb
index e47e665..4690e24 100644
--- a/recipes/freesmartphone/frameworkd_git.bb
+++ b/recipes/freesmartphone/frameworkd_git.bb
@@ -78,7 +78,7 @@ RRECOMMENDS_${PN} += "\
 "
 
 PACKAGES =+ "${PN}-config"
-PACKAGE_ARCH_${PN}-config = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN}-config = "${MACHINE_ARCH}"
 
 # machine specific stuff, should ideally be elsewhere
 # - recommend MUXer on platforms that require one
diff --git a/recipes/miniinit/miniinit.bb b/recipes/miniinit/miniinit.bb
index 054c1bd..e6986a7 100644
--- a/recipes/miniinit/miniinit.bb
+++ b/recipes/miniinit/miniinit.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 
 # SERIAL_CONSOLE is generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
-PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
 
 SRC_URI = "file://rcS file://inittab"
 
diff --git a/recipes/mipl-mipv6/mipv6_1.1-v2.4.26.bb b/recipes/mipl-mipv6/mipv6_1.1-v2.4.26.bb
index 913a388..d977589 100644
--- a/recipes/mipl-mipv6/mipv6_1.1-v2.4.26.bb
+++ b/recipes/mipl-mipv6/mipv6_1.1-v2.4.26.bb
@@ -6,7 +6,7 @@ DEPENDS = "virtual/kernel"
 LICENSE = "GPL"
 CFLAGS =+ "-I${S}/include -I${STAGING_KERNEL_DIR}/include"
 
-PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
 
 PR ="r3"
 
diff --git a/recipes/mipl-mipv6/mipv6_2.0.2.bb b/recipes/mipl-mipv6/mipv6_2.0.2.bb
index ae20101..0549ae2 100644
--- a/recipes/mipl-mipv6/mipv6_2.0.2.bb
+++ b/recipes/mipl-mipv6/mipv6_2.0.2.bb
@@ -19,7 +19,7 @@ do_install() {
         oe_runmake sbindir="${D}${sbindir}" initdir="${D}${sysconfdir}/init.d" mandir="${D}${mandir}" docdir="${D}${docdir}/mobile-ip6" NETWORK_MIP6_CONF="${D}${sysconfdir}" install
 }
 
-PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
 
 
 SRC_URI[md5sum] = "2cf58dca0ab3c38223e25dbecba8ed37"
diff --git a/recipes/obsolete/shr/alsa-scenarii-shr_git.bb b/recipes/obsolete/shr/alsa-scenarii-shr_git.bb
index 35bf569..ab3e083 100644
--- a/recipes/obsolete/shr/alsa-scenarii-shr_git.bb
+++ b/recipes/obsolete/shr/alsa-scenarii-shr_git.bb
@@ -17,7 +17,7 @@ do_install() {
     install -m 644 ${S}/stereoout.state ${D}${sysconfdir}/asound.state
 }
 
-PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
 
 FILES_${PN} += "${datadir}/shr"
 
diff --git a/recipes/openmoko2/openmoko-alsa-scenarios_svn.bb b/recipes/openmoko2/openmoko-alsa-scenarios_svn.bb
index 315ea4d..7014919 100644
--- a/recipes/openmoko2/openmoko-alsa-scenarios_svn.bb
+++ b/recipes/openmoko2/openmoko-alsa-scenarios_svn.bb
@@ -20,6 +20,6 @@ do_install() {
     install -m 644 ${S}/stereoout.state ${D}${sysconfdir}/asound.state
 }
 
-PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
 
 FILES_${PN} += "${datadir}/openmoko"
diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
index 3d4886a..0b850d1 100644
--- a/recipes/shadow/shadow.inc
+++ b/recipes/shadow/shadow.inc
@@ -11,7 +11,7 @@ LICENSE = "BSD"
 SECTION = "base"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
 
 INC_PR = "r16"
 
diff --git a/recipes/shr/frameworkd-config-shr_git.bb b/recipes/shr/frameworkd-config-shr_git.bb
index bc7284f..cf2a534 100644
--- a/recipes/shr/frameworkd-config-shr_git.bb
+++ b/recipes/shr/frameworkd-config-shr_git.bb
@@ -60,7 +60,7 @@ do_install_append() {
         install -m 0644 ${CONF_PATH}/*.wav ${D}${datadir}/sounds/
 }
 
-PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
 
 # - add wmiconfig for wireless configuration
 RDEPENDS_${PN}_append_om-gta02 = " wmiconfig"
diff --git a/recipes/sysvinit/sysvinit_2.86.bb b/recipes/sysvinit/sysvinit_2.86.bb
index 40c642a..d75cb32 100644
--- a/recipes/sysvinit/sysvinit_2.86.bb
+++ b/recipes/sysvinit/sysvinit_2.86.bb
@@ -6,7 +6,7 @@ PR = "r58"
 
 # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
-PACKAGE_ARCH_${PN}-inittab = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN}-inittab = "${MACHINE_ARCH}"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
diff --git a/recipes/tasks/task-x11.bb b/recipes/tasks/task-x11.bb
index 77e281e..a70bb15 100644
--- a/recipes/tasks/task-x11.bb
+++ b/recipes/tasks/task-x11.bb
@@ -25,7 +25,7 @@ XSERVER_COMMON ?= "xserver-kdrive-common"
 XSERVER_COMMON_shr = "xserver-common"
 
 # This is also the reason why we have to make this package machine specific :/
-PACKAGE_ARCH_${PN}-server = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN}-server = "${MACHINE_ARCH}"
 
 RDEPENDS_${PN}-server = "\
   ${XSERVER} \
diff --git a/recipes/usb-gadget-mode/usb-gadget-mode.bb b/recipes/usb-gadget-mode/usb-gadget-mode.bb
index aa0f76e..d7fbb35 100644
--- a/recipes/usb-gadget-mode/usb-gadget-mode.bb
+++ b/recipes/usb-gadget-mode/usb-gadget-mode.bb
@@ -37,5 +37,5 @@ pkg_postrm_${PN}() {
 	update-rc.d -f usb-gadget remove
 }
 
-PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
 
-- 
1.7.1




Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PpXh5-0000ML-07
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 04:04:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 603CF314DA85;
	Wed, 16 Feb 2011 04:03:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Qixm4a7o4UvU; Wed, 16 Feb 2011 04:03:26 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 4A243314D70D;
	Wed, 16 Feb 2011 04:03:25 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 16 Feb 2011 03:03:24 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 03:03:24 +0000
Message-Id: <1297825404-20674-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] wpa-supplicant-0.7.3: use MACHINE_ARCH
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
X-List-Received-Date: Wed, 16 Feb 2011 03:04:43 -0000

* Because of madwifi, wpa-supplicant depends on COMBINED_FEATURES.
  Thus, PACKAGE_ARCH must be set to MACHINE_ARCH.
* Use INC_PR and bump it.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Stefan Schmidt <stefan@datenfreihafen.org>
---
 recipes/wpa-supplicant/wpa-supplicant-0.7.inc  |    3 +++
 recipes/wpa-supplicant/wpa-supplicant_0.7.3.bb |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
index e01d1ef..b4e996a 100644
--- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://wpa_supplicant.c;beginline=1;endline=17;md5=acdc5a4b0d6345f21f136eace747260e"
 DEPENDS = "gnutls dbus libnl2 openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
+INC_PR = "r5"
 
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://defconfig \
@@ -80,6 +81,8 @@ do_install () {
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
 }
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 pkg_postinst_wpa-supplicant () {
 	# can't do this offline
 	if [ "x$D" != "x" ]; then
diff --git a/recipes/wpa-supplicant/wpa-supplicant_0.7.3.bb b/recipes/wpa-supplicant/wpa-supplicant_0.7.3.bb
index 03bd937..60a4791 100644
--- a/recipes/wpa-supplicant/wpa-supplicant_0.7.3.bb
+++ b/recipes/wpa-supplicant/wpa-supplicant_0.7.3.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-0.7.inc
 
-PR = "r4"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
 SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"
-- 
1.7.2.3




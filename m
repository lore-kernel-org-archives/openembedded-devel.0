Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Pnsah-0001py-6o
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 13:59:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id F3F83314D877;
	Fri, 11 Feb 2011 13:58:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 4JkY86vKP0wI; Fri, 11 Feb 2011 13:58:04 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id BA66E314D9FF;
	Fri, 11 Feb 2011 13:58:03 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 11 Feb 2011 12:58:03 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 12:57:59 +0000
Message-Id: <1297429080-3986-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297429080-3986-1-git-send-email-obi@opendreambox.org>
References: <1297429080-3986-1-git-send-email-obi@opendreambox.org>
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH 4/5] wpa-supplicant-0.7.3: enable madwifi support
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
X-List-Received-Date: Fri, 11 Feb 2011 12:59:15 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/wpa-supplicant/wpa-supplicant-0.7.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
index ca7751c..f64eb79 100644
--- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -6,7 +6,7 @@ LICENSE = "GPLv2 | BSD"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://../README;md5=54cfc88015d3ce83f7156e63c6bb1738 \
                     file://wpa_supplicant.c;beginline=1;endline=17;md5=acdc5a4b0d6345f21f136eace747260e"
-DEPENDS = "gnutls dbus libnl2"
+DEPENDS = "gnutls dbus libnl2 ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
@@ -31,6 +31,10 @@ FILES_${PN} += " /usr/share/dbus-1/system-services/*"
 
 do_configure () {
 	install -m 0755 ${WORKDIR}/defconfig .config
+	if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0, d)}" = "1" ]; then
+		echo "CONFIG_DRIVER_MADWIFI=y" >> .config
+		echo "CFLAGS += -I${STAGING_INCDIR}/madwifi-ng" >> .config
+	fi
 }
 
 do_compile () {
-- 
1.7.2.3




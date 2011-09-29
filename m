Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@sgh.dk>) id 1R9GcL-000149-Tw
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Sep 2011 15:25:37 +0200
Received: from koontz.dkode.lgs-net.com ([10.115.0.215]) by mail.mikrofyn.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 29 Sep 2011 15:25:17 +0200
From: =?UTF-8?q?A=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Sep 2011 15:19:10 +0200
Message-Id: <1317302350-8193-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-OriginalArrivalTime: 29 Sep 2011 13:25:17.0750 (UTC)
	FILETIME=[3AC68D60:01CC7EAB]
Subject: [PATCH] wpa-supplicant: Fix wpa-supplicant not exiting.
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
X-List-Received-Date: Thu, 29 Sep 2011 13:25:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Søren Holm <sgh@sgh.dk>

woa-supplicant keps running if conenction to a network fails
getting an ip. ifup will then not call the post-down-script.

The solution is to add the script to down-sripts.
---
 recipes/wpa-supplicant/wpa-supplicant-0.7.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
index 722f5fa..9be28ba 100644
--- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://wpa_supplicant.c;beginline=1;endline=17;md5=acdc5a4b0d6345f21f136eace747260e"
 DEPENDS = "gnutls dbus libnl openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
-INC_PR = "r7"
+INC_PR = "r8"
 
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://defconfig \
@@ -71,6 +71,7 @@ do_install () {
 	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
 	cd ${D}${sysconfdir}/network/ && \
 	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
+	ln -sf ../if-pre-up.d/wpa-supplicant if-down.d/wpa-supplicant
 
 	install -d ${D}/etc/default/volatiles
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
-- 
1.7.4.1




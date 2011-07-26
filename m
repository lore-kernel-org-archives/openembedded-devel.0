Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlcPH-0001cA-25
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 09:50:23 +0200
Received: by wwi18 with SMTP id 18so157215wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 00:46:10 -0700 (PDT)
Received: by 10.217.3.17 with SMTP id q17mr1221314wes.107.1311666370046;
	Tue, 26 Jul 2011 00:46:10 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id j54sm129451wed.23.2011.07.26.00.46.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jul 2011 00:46:08 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jul 2011 09:46:02 +0200
Message-Id: <1311666362-4023-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFCv2 meta-efl] e(fl).bbclass: don't override PACKAGES, but add to it
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
X-List-Received-Date: Tue, 26 Jul 2011 07:50:23 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-efl/classes/e.bbclass   |    6 +++---
 meta-efl/classes/efl.bbclass |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass
index 88a1f6a..c803399 100644
--- a/meta-efl/classes/e.bbclass
+++ b/meta-efl/classes/e.bbclass
@@ -18,9 +18,9 @@ do_configure_append() {
 export CURL_CONFIG = "${STAGING_BINDIR_CROSS}/curl-config"
 export FREETYPE_CONFIG = "${STAGING_BINDIR_CROSS}/freetype-config"
 
-# This construction is stupid, someone with more E knowledge should change it to =+ or something
-# And it's in efl.bbclass as well....
-PACKAGES = "${PN}-dbg ${PN}-themes ${PN} ${PN}-dev ${PN}-doc ${PN}-lib ${PN}-static"
+PACKAGES =+ "${PN}-themes"
+PACKAGES += "${PN}-lib"
+
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 FILES_${PN}-themes = "${datadir}/${PN}/themes ${datadir}/${PN}/data ${datadir}/${PN}/fonts ${datadir}/${PN}/pointers ${datadir}/${PN}/images ${datadir}/${PN}/users ${datadir}/${PN}/images ${datadir}/${PN}/styles"
 FILES_${PN}-dev += "${includedir} ${libdir}/lib*.so"
diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
index 2dc6fc2..f90dc1c 100644
--- a/meta-efl/classes/efl.bbclass
+++ b/meta-efl/classes/efl.bbclass
@@ -19,8 +19,8 @@ do_install_prepend () {
 	done
 }
 
-# This construction is stupid, someone with more E knowledge should change it to =+ or something
-PACKAGES = "${PN}-dbg ${PN} ${PN}-themes ${PN}-dev ${PN}-doc ${PN}-tests ${PN}-static"
+PACKAGES =+ "${PN}-themes"
+PACKAGES += "${PN}-tests"
 
 FILES_${PN} = "${libdir}/*.so.* \
                ${libdir}/edje/modules/${PN}/*/module.so \
-- 
1.6.6.1




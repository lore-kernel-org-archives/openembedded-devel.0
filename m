Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlbZu-0008F3-QM
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 08:57:18 +0200
Received: by wwi18 with SMTP id 18so121103wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 23:53:06 -0700 (PDT)
Received: by 10.227.11.137 with SMTP id t9mr4864601wbt.9.1311663185813;
	Mon, 25 Jul 2011 23:53:05 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fp3sm146576wbb.30.2011.07.25.23.53.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 23:53:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jul 2011 08:52:57 +0200
Message-Id: <1311663177-19331-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC meta-efl] e(fl).bbclass: don't override PACKAGES, but add to it
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
X-List-Received-Date: Tue, 26 Jul 2011 06:57:19 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-efl/classes/e.bbclass   |    6 +++---
 meta-efl/classes/efl.bbclass |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass
index 88a1f6a..ebf1da8 100644
--- a/meta-efl/classes/e.bbclass
+++ b/meta-efl/classes/e.bbclass
@@ -18,9 +18,9 @@ do_configure_append() {
 export CURL_CONFIG = "${STAGING_BINDIR_CROSS}/curl-config"
 export FREETYPE_CONFIG = "${STAGING_BINDIR_CROSS}/freetype-config"
 
-# This construction is stupid, someone with more E knowledge should change it to =+ or something
-# And it's in efl.bbclass as well....
-PACKAGES = "${PN}-dbg ${PN}-themes ${PN} ${PN}-dev ${PN}-doc ${PN}-lib ${PN}-static"
+PACKAGES =+ "${PN}-themes"
+PACKAGES += "${PN}-lib ${PN}-tests"
+
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 FILES_${PN}-themes = "${datadir}/${PN}/themes ${datadir}/${PN}/data ${datadir}/${PN}/fonts ${datadir}/${PN}/pointers ${datadir}/${PN}/images ${datadir}/${PN}/users ${datadir}/${PN}/images ${datadir}/${PN}/styles"
 FILES_${PN}-dev += "${includedir} ${libdir}/lib*.so"
diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
index 2dc6fc2..c831439 100644
--- a/meta-efl/classes/efl.bbclass
+++ b/meta-efl/classes/efl.bbclass
@@ -19,8 +19,8 @@ do_install_prepend () {
 	done
 }
 
-# This construction is stupid, someone with more E knowledge should change it to =+ or something
-PACKAGES = "${PN}-dbg ${PN} ${PN}-themes ${PN}-dev ${PN}-doc ${PN}-tests ${PN}-static"
+PACKAGES =+ "${PN}-themes"
+PACKAGES += "${PN}-lib ${PN}-tests"
 
 FILES_${PN} = "${libdir}/*.so.* \
                ${libdir}/edje/modules/${PN}/*/module.so \
-- 
1.6.6.1




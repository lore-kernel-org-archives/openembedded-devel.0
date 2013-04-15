Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1URmxW-00021H-H7
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 19:12:55 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 01964D2284
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 18:54:39 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2013 18:55:14 +0200
Message-Id: <1366044914-28257-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] gpsd: s/gpsd-dev/${PN}-dev to make bitbake happy
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
X-List-Received-Date: Mon, 15 Apr 2013 17:12:57 -0000

WARNING: Variable key FILES_${PN}-dev (${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig ${datadir}/aclocal ${base_libdir}/*.o ${libdir}/${BPN}/*.la ${base_libdir}/*.la) replaces original key FILES_gpsd-dev ( ${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc).

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index e98d795..ceb700a 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -91,7 +91,7 @@ pkg_postrm_${PN}-conf() {
 
 PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
 
-FILES_gpsd-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc"
+FILES_${PN}-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc"
 
 FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
 
-- 
1.8.1.2




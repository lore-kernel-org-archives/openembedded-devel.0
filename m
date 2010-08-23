Received: from evil.bitcloner.org ([62.2.86.239])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1OnWdN-0002MT-Sb
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 15:00:21 +0200
Received: from frbg-5d84e9b4.pool.mediaways.net ([93.132.233.180])
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(envelope-from <betheg@bitcloner.org>) id 1OnWcu-0000bg-9M
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 14:59:48 +0200
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Aug 2010 14:59:18 +0200
Message-Id: <1282568358-20599-1-git-send-email-betheg@bitcloner.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 62.2.86.239
X-SA-Exim-Mail-From: betheg@bitcloner.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libesmtp_1.0.4.bb: fix the installed but not shipped in any package warning.
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
X-List-Received-Date: Mon, 23 Aug 2010 13:00:21 -0000

  * add esmtp-plugins/*.la to -dev package
  * add esmtp-plugins/*.a to -static package
  * move libesmtp-config to the -dev package


Signed-off-by: Michael Kurz <betheg@bitcloner.org>
---
 recipes/libesmtp/libesmtp_1.0.4.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/libesmtp/libesmtp_1.0.4.bb b/recipes/libesmtp/libesmtp_1.0.4.bb
index 72b678b..fb03f86 100644
--- a/recipes/libesmtp/libesmtp_1.0.4.bb
+++ b/recipes/libesmtp/libesmtp_1.0.4.bb
@@ -12,7 +12,10 @@ inherit autotools binconfig
 
 EXTRA_OECONF = "--disable-isoc --with-openssl=${STAGING_LIBDIR}/.."
 
-FILES_libesmtp_append = " ${libdir}/esmtp-plugins/*.so"
+FILES_${PN} = "${libdir}/lib*${SOLIBS} \
+		${libdir}/esmtp-plugins/*${SOLIBSDEV}"
+FILES_${PN}-dev  += "${libdir}/esmtp-plugins/*.la"
+FILES_${PN}-static += "${libdir}/esmtp-plugins/*.a"
 FILES_${PN}-dbg += "${libdir}/esmtp-plugins/.debug/"
 
 SRC_URI[md5sum] = "8b4e8a794adc46268f0c6a0b3fb79486"
-- 
1.7.1




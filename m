Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PANvd-00080c-SW
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 16:22:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 3EF89314A274
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:20:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id kD2w0bnXLOXr
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:20:46 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id CAC013149FCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 16:20:45 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 14:20:45 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 14:20:45 +0000
Message-Id: <1288016445-30478-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4CBEC95F.1000807@opendreambox.org>
References: <4CBEC95F.1000807@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] lib_package.bbclass: fix packaging of static libs, inherit binconfig
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
X-List-Received-Date: Mon, 25 Oct 2010 14:22:25 -0000

* Package ${libdir}/*.a and /lib/*.a into ${PN}-static instead of ${PN}-dev
* Although it packaged ${bindir}/*-config into FILES_${PN}-dev, it did
  not include the required mangling applied by binconfig.bbclass.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 classes/lib_package.bbclass |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/classes/lib_package.bbclass b/classes/lib_package.bbclass
index 82c9370..7e72dc8 100644
--- a/classes/lib_package.bbclass
+++ b/classes/lib_package.bbclass
@@ -1,10 +1,11 @@
+inherit binconfig
+
 PACKAGES += "${PN}-bin"
 
-FILES_${PN} = "${libexecdir} ${libdir}/lib*${SOLIBS} \
-	    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-	    ${base_libdir}/*${SOLIBS} \
-	    ${datadir}/${PN} ${libdir}/${PN}"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-		${libdir}/*.a ${libdir}/pkgconfig /lib/*.a /lib/*.o \
-		${datadir}/aclocal ${bindir}/*-config"
-FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
+FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_libdir}/*${SOLIBS} \
+            ${datadir}/${PN} ${libdir}/${PN}/*"
+
+FILES_${PN}-bin = "${bindir}/* ${sbindir}/* \
+                ${base_bindir}/* ${base_sbindir}/*"
-- 
1.7.1




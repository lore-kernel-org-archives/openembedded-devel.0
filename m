Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PHmTe-0004nr-CQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 00:59:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 61D4E314AB8B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 00:58:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id GmtS1W1+vzTs
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 00:58:11 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 6ACDB314A4C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 00:58:10 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sun, 14 Nov 2010 23:58:10 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Nov 2010 23:58:10 +0000
Message-Id: <1289779090-11342-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] lib_package.bbclass: fix packaging of static libs
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
X-List-Received-Date: Sun, 14 Nov 2010 23:59:20 -0000

* Package ${libdir}/*.a and /lib/*.a into ${PN}-static instead of ${PN}-dev

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* v2: don't inherit binconfig

 classes/lib_package.bbclass |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/classes/lib_package.bbclass b/classes/lib_package.bbclass
index 82c9370..2635b6f 100644
--- a/classes/lib_package.bbclass
+++ b/classes/lib_package.bbclass
@@ -1,10 +1,9 @@
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




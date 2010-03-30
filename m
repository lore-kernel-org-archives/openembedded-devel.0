Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1NwacN-0001HV-IX
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 14:32:28 +0200
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id 4660F6821F;
	Tue, 30 Mar 2010 16:28:58 +0400 (MSD)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1NwaSl-0005pc-OB; Tue, 30 Mar 2010 16:22:31 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Mar 2010 16:22:30 +0400
Message-Id: <1269951751-22396-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
X-Altell-MailScanner-ID: 4660F6821F.0693B
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] openssl: deal with unpackaged /usr/lib/ssl files
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
X-List-Received-Date: Tue, 30 Mar 2010 12:32:28 -0000

Config file is accessed directly from libcrypto, so belongs to
libcrypto package.

openssl-misc is a new package that contains CA management scripts.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/openssl/openssl.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index 9b71cac..329c661 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -8,7 +8,7 @@ S = "${WORKDIR}/openssl-${PV}"
 
 inherit siteinfo
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 AR_append = " r"
 CFLAG = "${@base_conditional('SITEINFO_ENDIANESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
@@ -22,9 +22,10 @@ export DIRS = "crypto ssl apps"
 export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
 
-PACKAGES =+ "libcrypto libssl"
-FILES_libcrypto = "${libdir}/libcrypto.so.*"
+PACKAGES =+ "libcrypto libssl ${PN}-misc"
+FILES_libcrypto = "${libdir}/libcrypto.so.* ${libdir}/ssl/openssl.cnf"
 FILES_libssl = "${libdir}/libssl.so.*"
+FILES_${PN}-misc = "${libdir}/ssl/misc"
 
 do_configure () {
 	cd util
-- 
1.5.6.5




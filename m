Received: from dd19416.kasserver.com ([85.13.139.185])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1UPg5q-0000GY-NZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 23:29:02 +0200
Received: from localhost.localdomain (blfd-4d0831b4.pool.mediaWays.net
	[77.8.49.180])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 8FBA91840235;
	Tue,  9 Apr 2013 23:11:23 +0200 (CEST)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Apr 2013 23:11:01 +0200
Message-Id: <1365541861-10672-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1364997019-23273-1-git-send-email-stefan@herbrechtsmeier.net>
References: <1364997019-23273-1-git-send-email-stefan@herbrechtsmeier.net>
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH V2] cryptsetup: Update to latest version and use openssl as crypto backend
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
X-List-Received-Date: Tue, 09 Apr 2013 21:29:13 -0000

Cryptsetup with the command luksOpen failed with the error message:
device-mapper: status ioctl failed: Permission denied

The error comes from libgcrypt with drops root privileges if it is
linked with libcap support [1]. Update cryptsetup to latest version,
add PACKAGECONFIG for crypto backend selection (openssl / gcrypt)
and change the default crypto backend to openssl as libgcrypt states
the drop root privileges behaviour as a feature [2].

The license was updated to GPLv2 with OpenSSL exception.

Update the RRECOMMENDS to be conistent with the package names.

[1] http://code.google.com/p/cryptsetup/issues/detail?id=47
[2] https://bugs.g10code.com/gnupg/issue1181

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 .../{cryptsetup_1.1.3.bb => cryptsetup_1.6.1.bb}   |   37 +++++++++++++-------
 1 file changed, 25 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.1.3.bb => cryptsetup_1.6.1.bb} (21%)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
similarity index 21%
rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
index 254f563..438d394 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
@@ -1,18 +1,31 @@
-DESCRIPTION = "Setup virtual encryption devices under dm-crypt Linux"
+SUMMARY = "Manage plain dm-crypt and LUKS encrypted volumes"
+DESCRIPTION = "Cryptsetup is used to conveniently setup dm-crypt managed \
+device-mapper mappings. These include plain dm-crypt volumes and \
+LUKS volumes. The difference is that LUKS uses a metadata header \
+and can hence offer more features than plain dm-crypt. On the other \
+hand, the header is visible and vulnerable to damage."
 HOMEPAGE = "http://code.google.com/p/cryptsetup/"
 SECTION = "console"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
+
+DEPENDS = "util-linux lvm2 popt"
 
-DEPENDS = "util-linux lvm2 libgcrypt popt"
-RRECOMMENDS_${PN} = "kernel-module-aes \
-                     kernel-module-dm-crypt \
-                     kernel-module-md5 \
-                     kernel-module-cbc \
-                     kernel-module-sha256 \
-                    "
 SRC_URI = "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2"
-SRC_URI[md5sum] = "318a64470861ea5b92a52f2014f1e7c1"
-SRC_URI[sha256sum] = "9c8e68a272f6d9cfb6cd65cc0743f4c44a2096c61f74e0602bf40208b5e69c0a"
+SRC_URI[md5sum] = "f374d11e3b0e7ca0f805756fd02e34ff"
+SRC_URI[sha256sum] = "baf36e663c03eb6440482d91c486d61ed47ce5c9268ad04c18ca09082755149c"
 
 inherit autotools gettext
+
+# Use openssl because libgcrypt drops root privileges
+# if libgcrypt is linked with libcap support
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[openssl] = "--with-crypto_backend=openssl,,openssl"
+PACKAGECONFIG[gcrypt] = "--with-crypto_backend=gcrypt,,libgcrypt"
+
+RRECOMMENDS_${PN} = "kernel-module-aes-generic \
+                     kernel-module-dm-crypt \
+                     kernel-module-md5 \
+                     kernel-module-cbc \
+                     kernel-module-sha256-generic \
+                     "
-- 
1.7.9.5




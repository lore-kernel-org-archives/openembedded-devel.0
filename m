Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RUda9-0006DZ-7Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 13:11:41 +0100
Received: by wwf22 with SMTP id 22so5638954wwf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 04:05:01 -0800 (PST)
Received: by 10.216.132.224 with SMTP id o74mr969779wei.53.1322395498687;
	Sun, 27 Nov 2011 04:04:58 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id x8sm13101669wix.17.2011.11.27.04.04.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Nov 2011 04:04:57 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Nov 2011 13:04:53 +0100
Message-Id: <1322395493-30396-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] digitemp: fix QA issues:
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
X-List-Received-Date: Sun, 27 Nov 2011 12:11:41 -0000

* missing SRC_URI checksums
* GNU_HASH QA errors:
	WARNING: QA Issue: No GNU_HASH in the elf binary: '/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/digitemp-3.6.0-r2/packages-split/digitemp/usr/sbin/digitemp_DS9097U'
	WARNING: QA Issue: No GNU_HASH in the elf binary: '/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/digitemp-3.6.0-r2/packages-split/digitemp/usr/sbin/digitemp_DS9097'
* $(uname -s) access

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb b/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
index 395e56a..0ac8fa3 100644
--- a/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
+++ b/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
@@ -4,14 +4,18 @@ DEPENDS = "libusb1"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.digitemp.com/software/linux/digitemp-${PV}.tar.gz \
            file://makefile-fix.patch"
+SRC_URI[md5sum] = "9be2e48db37920f21925ae6e88f83b84"
+SRC_URI[sha256sum] = "14cfc584cd3714fe8c9a2cdc8388be49e08b5e395d95e6bcd11d4410e2505ca2"
 
-inherit autotools
-
-EXTRA_OEMAKE = "ds9097 ds9097u"
+EXTRA_OEMAKE = "ds9097 ds9097u \
+                SYSTYPE='Linux' \
+               "
+# Fix GNU_HASH QA errors
+TARGET_CC_ARCH += "${CFLAGS} ${LDFLAGS}"
 
 do_configure() {
     rm -f digitemp_*
-- 
1.7.2.5




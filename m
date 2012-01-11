Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Rl4oF-0002dV-Vq
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jan 2012 21:30:12 +0100
Received: from [192.168.2.78] (helo=localhost.localdomain)
	by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1Rl5E1-0005f4-6a; Wed, 11 Jan 2012 21:56:49 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jan 2012 21:21:59 +0100
Message-Id: <1326313319-4579-1-git-send-email-florian.boor@kernelconcepts.de>
X-Mailer: git-send-email 1.7.2.5
Cc: Florian Boor <florian@kernelconcepts.de>
Subject: [PATCH] libusb1: Depend on libxml2
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
X-List-Received-Date: Wed, 11 Jan 2012 20:30:12 -0000

From: Florian Boor <florian@kernelconcepts.de>

Without libxml2 we get an error like this:
+ cp -r $TMPDIR/sysroots/netbookpro/usr/share/aclocal/. $TMPDIR/work/armv5te-oe-linux-gnueabi/libusb1-1.0.8-r2/libusb-1.0.8/aclocal-copy/
cp: cannot stat `$TMPDIR/sysroots/netbookpro/usr/share/aclocal/./libxml.m4': No such file or directory

Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>
---
 meta/recipes-support/libusb/libusb1_1.0.8.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.8.bb b/meta/recipes-support/libusb/libusb1_1.0.8.bb
index 8873de7..9af24b4 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.8.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.8.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Userspace library to access USB (version 1.0)"
 HOMEPAGE = "http://libusb.sf.net"
 BUGTRACKER = "http://www.libusb.org/report"
 SECTION = "libs"
+DEPENDS = "libxml2"
 
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-- 
1.7.2.5




Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rjhk8-0006FE-Hc
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jan 2012 02:40:18 +0100
Received: (qmail invoked by alias); 08 Jan 2012 01:32:50 -0000
Received: from p5B0A1340.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.19.64]
	by mail.gmx.net (mp065) with SMTP; 08 Jan 2012 02:32:50 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX195HLgaieh5ZF+AP2YsPzHaVdhKfhfUpoK/Bl0q1/
	RaRyg8PhJVDXlI
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Jan 2012 02:33:54 +0100
Message-Id: <1325986434-2020-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe] udisks: add sytemd to DEPENDS
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
X-List-Received-Date: Sun, 08 Jan 2012 01:40:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If systemd was not yet build, udisks configure caused systemd files not being
build so udisks-sytemd package was empty. On do_rootfs we got:
| Collected errors:
|  * opkg_install_cmd: Cannot install package udisks-systemd.

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index c3e2664..0e330fa 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A storage daemon that implements well-defined D-Bus interfaces th
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
 
-DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
+DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0 systemd"
 # optional dependencies: device-mapper parted
 
 SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
@@ -12,7 +12,7 @@ SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
 SRC_URI[udisks.md5sum] = "86c63b2b5484f2060499a052b5b6256b"
 SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools systemd
 
-- 
1.7.4.4




Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7878976FF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 07:51:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8H7pU7d021711
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:51:30 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 17 Sep 2015 00:51:30 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Sep 2015 03:51:26 -0400
Message-ID: <9233fcf1444ffe2b881ef15f8027f08ce59b8727.1442475733.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1442475733.git.wenzong.fan@windriver.com>
References: <cover.1442475733.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 v2][meta-initramfs] dracut: install modules to /usr/lib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Sep 2015 07:51:30 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The dracut modules will be installed to /usr/lib64 while building 64bit
targets with multilib enabled, this causes runtime errors:

  dracut: Cannot find /usr/lib/dracut/dracut-functions.sh.
  dracut: Are you running from a git checkout?
  dracut: Try passing -l as an argument to /usr/bin/dracut

The dracut modules, 50-dracut.install and 51-dracut-rescue.install must
be installed to /usr/lib as Fedora 20 does.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index 3be78ed..8733d54 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--prefix=${prefix} \
-                --libdir=${libdir} \
+                --libdir=${prefix}/lib \
                 --datadir=${datadir} \
                 --sysconfdir=${sysconfdir} \
                 --sbindir=${sbindir} \
@@ -28,6 +28,8 @@ EXTRA_OECONF = "--prefix=${prefix} \
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,,systemd"
 
+EXTRA_OEMAKE += 'libdir=${prefix}/lib'
+
 do_configure() {
     ./configure ${EXTRA_OECONF}
 }
@@ -40,9 +42,12 @@ PACKAGES =+ "${PN}-bash-completion"
 
 FILES_${PN}-bash-completion = "${datadir}/bash-completion"
 
-FILES_${PN} += " ${libdir}/kernel \
+FILES_${PN} += "${prefix}/lib/kernel \
+                ${prefix}/lib/dracut \
                 ${systemd_unitdir} \
                "
+FILES_${PN}-dbg += "${prefix}/lib/dracut/.debug"
+
 CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
 
 RDEPENDS_${PN} = "findutils cpio util-linux-blkid util-linux-getopt bash ldd"
-- 
1.9.1



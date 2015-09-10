Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB5EA76AC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 07:26:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8A7Q7Nv027299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 00:26:07 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 10 Sep 2015 00:26:07 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Sep 2015 03:26:03 -0400
Message-ID: <d3f90d1e80c9db274e5d021e5e7973e6fb22a7e6.1441869690.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1441869690.git.wenzong.fan@windriver.com>
References: <cover.1441869690.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2][meta-initramfs] dracut: RDEPEND on systemd optionally
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
X-List-Received-Date: Thu, 10 Sep 2015 07:26:07 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

Use PACKAGECONFIG to depend on systemd optionally.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index b7d88fd..3a72251 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -13,9 +13,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
 
 S = "${WORKDIR}/git"
 
-inherit distro_features_check
-REQUIRED_DISTRO_FEATURES = "systemd"
-
 EXTRA_OECONF = "--prefix=${prefix} \
                 --libdir=${libdir} \
                 --datadir=${datadir} \
@@ -25,7 +22,7 @@ EXTRA_OECONF = "--prefix=${prefix} \
                 --bindir=${bindir} \
                 --includedir=${includedir} \
                 --localstatedir=${localstatedir} \
-                --systemdsystemunitdir=${systemd_unitdir}/system"
+               "
 
 do_configure() {
     ./configure ${EXTRA_OECONF}
@@ -44,9 +41,13 @@ FILES_${PN} += " ${libdir}/kernel \
                "
 CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
 
-RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux-getopt bash ldd"
+RDEPENDS_${PN} = "findutils cpio util-linux-blkid util-linux-getopt bash ldd"
 RDEPENDS_${PN}-bash-completion = "bash-completion"
 
+# RDEPEND on systemd optionally
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,,systemd"
+
 # This could be optimized a bit, but let's avoid non-booting systems :)
 RRECOMMENDS_${PN} = " \
                      kernel-modules \
-- 
1.9.1



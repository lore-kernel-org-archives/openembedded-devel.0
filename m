Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED4177246
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 09:15:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u869FJGb008356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Sep 2016 02:15:19 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 6 Sep 2016 02:15:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Sep 2016 05:15:15 -0400
Message-ID: <6f2b25d00c6cdfbafa49e5d5b3e2802279556200.1473153229.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1473153229.git.hongxu.jia@windriver.com>
References: <cover.1473153229.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] add PACKAGECONFIG for lvm thin provisioning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Sep 2016 09:15:20 -0000
Content-Type: text/plain

The thin provisioning tools is runtime dependency,
so disable build time detection.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index e2feeb3..d66daf8 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,10 +18,13 @@ S = "${WORKDIR}/LVM2.${PV}"
 
 inherit autotools-brokensep pkgconfig systemd
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+                   thin-provisioning-tools \
+"
 
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
 
 # Unset user/group to unbreak install.
 EXTRA_OECONF = "--with-user= \
@@ -38,6 +41,11 @@ EXTRA_OECONF = "--with-user= \
                 --with-udev-prefix= \
                 --with-usrlibdir=${libdir} \
                 --with-systemdsystemunitdir=${systemd_system_unitdir} \
+                --disable-thin_check_needs_check \
+                --with-thin-check=${sbindir}/thin_check \
+                --with-thin-dump=${sbindir}/thin_dump \
+                --with-thin-repair=${sbindir}/thin_repair \
+                --with-thin-restore=${sbindir}/thin_restore \
 "
 
 CACHED_CONFIGUREVARS += "MODPROBE_CMD=${base_sbindir}/modprobe"
@@ -66,6 +74,6 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 FILES_${PN} += "${libdir}/device-mapper/*.so ${base_libdir}/udev"
 FILES_${PN}-dbg += "${libdir}/device-mapper/.debug"
 
-RDEPENDS_${PN} = "bash thin-provisioning-tools"
+RDEPENDS_${PN} = "bash"
 
 CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
-- 
2.8.1



Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00DA473D27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 08:36:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8E8axV7023214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 01:37:00 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 14 Sep 2015 01:36:59 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Sep 2015 16:31:15 +0800
Message-ID: <1442219475-21489-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] lvm2: install initscript or systemd unit service conditionally
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
X-List-Received-Date: Mon, 14 Sep 2015 08:37:00 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Issue: LIN8-854

install systemd unit files and modify them only when DISTRO_FEATURE
systemd is enabled, otherwise do_install failed due to no
blk-availability.service file
   sed: can't read tmp/work/armv5e-wrs-linux-gnueabi/lvm2/2.02.125-r0/image/lib/systemd/system/blk-availability.service: No such file or directory

install the initscript when init is not systemd

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 2b2d8ed..cc70246 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -39,8 +39,14 @@ do_install_append() {
     # Install machine specific configuration file
     install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
     sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
-    oe_runmake 'DESTDIR=${D}' install install_systemd_units
-    sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_unitdir}/system/blk-availability.service
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        oe_runmake 'DESTDIR=${D}' install install_systemd_units
+        sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_unitdir}/system/blk-availability.service
+    else
+        oe_runmake 'DESTDIR=${D}' install install_initscripts
+        mv ${D}${sysconfdir}/rc.d/init.d ${D}${sysconfdir}/init.d
+        rm -rf ${D}${sysconfdir}/rc.d
+    fi
 }
 
 SYSTEMD_PACKAGES = "${PN}"
-- 
1.9.1



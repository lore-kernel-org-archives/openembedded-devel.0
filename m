Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 328A96AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 03:22:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9A3MmRq008496
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Oct 2014 20:22:49 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 9 Oct 2014 20:22:48 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Oct 2014 23:22:45 -0400
Message-ID: <8340c52b05b08faa77445dca83a15f3df0687b79.1412910727.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1412910727.git.wenzong.fan@windriver.com>
References: <cover.1412910727.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1][meta-networking] ntp: fix path to driftfile
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
X-List-Received-Date: Fri, 10 Oct 2014 03:22:55 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Default path to driftfile is "/etc/ntp.drift", that doesn't work since
ntp daemon is always started with "ntp" user. It should be created at
the home directory of "ntp" which is "/var/lib/ntp/".

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-networking/recipes-support/ntp/ntp.inc |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index f55a39a..f685274 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -53,6 +53,7 @@ PACKAGECONFIG[debug] = "--enable-debugging,--disable-debugging"
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
     install -m 644 ${WORKDIR}/ntp.conf ${D}${sysconfdir}
+    sed -i 's!/etc/ntp.drift!/var/lib/ntp/drift!g' ${D}${sysconfdir}/ntp.conf
     install -m 755 ${WORKDIR}/ntpd ${D}${sysconfdir}/init.d
     install -d ${D}${bindir}
     install -m 755 ${WORKDIR}/ntpdate ${D}${bindir}/ntpdate-sync
@@ -72,6 +73,18 @@ do_install_append() {
     install -m 644 ${WORKDIR}/ntpdate.default ${D}${sysconfdir}/default/ntpdate
     install -m 0644 ${WORKDIR}/sntp ${D}${sysconfdir}/default/
 
+    # Create tmpfiles
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}/${sysconfdir}/default/volatiles
+        echo "d ntp ntp 0755 /var/lib/ntp none" \
+            > ${D}/${sysconfdir}/default/volatiles/99_ntpd
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d /var/lib/ntp 0755 ntp ntp -" \
+            > ${D}${sysconfdir}/tmpfiles.d/99-ntpd.conf
+    fi
+
     install -d ${D}/${sysconfdir}/network/if-up.d
     ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
 
@@ -112,6 +125,8 @@ RSUGGESTS_${PN} = "iana-etc"
 
 FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
     ${systemd_unitdir}/ntp-units.d/60-ntpd.list \
+    ${sysconfdir}/default/volatiles \
+    ${sysconfdir}/tmpfiles.d \
 "
 FILES_${PN}-tickadj = "${sbindir}/tickadj"
 FILES_${PN}-utils = "${sbindir}"
-- 
1.7.9.5



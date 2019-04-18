Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62D237D22D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 01:36:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3I1ZgWn004579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 18:35:52 -0700
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 17 Apr 2019 18:35:32 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Apr 2019 09:35:29 +0800
Message-ID: <1555551329-3477-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-networking][PATCH] openhpi: fix failure of ptest case ohpi_035
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
X-List-Received-Date: Thu, 18 Apr 2019 01:36:02 -0000
Content-Type: text/plain

Install missing openhpi.conf to ptest directory to fix failure of ptest
case ohpi_035:

(process:3559): openhpid-CRITICAL **: 08:41:04.036:
../../openhpi-3.8.0/openhpid/conf.c:623: Configuration file
'../../../../openhpi-3.8.0/openhpid/t/ohpi/openhpi.conf' could not be
opened.
FAIL: ohpi_035

Also chage the configure files mode from 755 to 644.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index ca9130d..14cc3d8 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -70,10 +70,10 @@ export DISTRO
 
 do_install_append () {
     install -m 0755 -d ${D}${sysconfdir}/${BPN}
-    install -m 0755 ${S}/openhpiclient.conf.example ${D}${sysconfdir}/${BPN}/openhpiclient.conf
-    install -m 0700 ${S}/openhpi.conf.example ${D}${sysconfdir}/${BPN}/openhpi.conf
-    install -m 0755 ${S}/simulation.data.example ${D}${sysconfdir}/${BPN}/simulation.data
-    install -m 0755 ${S}/test_agent.data.example ${D}${sysconfdir}/${BPN}/test_agent.data
+    install -m 0644 ${S}/openhpiclient.conf.example ${D}${sysconfdir}/${BPN}/openhpiclient.conf
+    install -m 0600 ${S}/openhpi.conf.example ${D}${sysconfdir}/${BPN}/openhpi.conf
+    install -m 0644 ${S}/simulation.data.example ${D}${sysconfdir}/${BPN}/simulation.data
+    install -m 0644 ${S}/test_agent.data.example ${D}${sysconfdir}/${BPN}/test_agent.data
     install -m 0755 ${WORKDIR}/openhpi.init ${D}${sysconfdir}/init.d/openhpid
 
     install -d ${D}${systemd_unitdir}/system
@@ -105,6 +105,9 @@ do_install_ptest () {
         sed -i "s/^Makefile:/MM:/g" ${x};
     done;
 
+    install -m 644 ${S}/openhpid/t/ohpi/openhpi.conf ${D}${PTEST_PATH}/openhpid/t/ohpi/
+    sed -i "s:OPENHPI_CONF=[^ ]*:OPENHPI_CONF=./openhpi.conf:g" ${D}${PTEST_PATH}/openhpid/t/ohpi/Makefile
+
     mkdir -p ${D}${PTEST_PATH}/plugins/watchdog/
     cp -L ${D}/${libdir}/${BPN}/libwatchdog.so ${D}${PTEST_PATH}/plugins/watchdog/
     cp -L ${D}/${libdir}/${BPN}/libsimulator.so ${D}${PTEST_PATH}/plugins/watchdog/
-- 
2.7.4



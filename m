Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A34187C786
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 06:22:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1L6MOqo018222
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 22:22:25 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 22:22:24 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Feb 2019 14:22:23 +0800
Message-ID: <1550730143-282331-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lvm2: fix lvm2-monitor.service startup failed
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
X-List-Received-Date: Thu, 21 Feb 2019 06:22:24 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Issue:
vm2-monitor.service: Failed to create lvm2-monitor.service/start:
Unit lvm2-lvmetad.socket not found

lvmetad have been removed by upstream, but this part is missed,
backport fix from upstream

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...toring-service-shouldn-t-refer-to-lvmetad.patch | 31 ++++++++++++++++++++++
 meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb       |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch

diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch
new file mode 100644
index 0000000..4eeac1c
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch
@@ -0,0 +1,31 @@
+From b922f4a4e7e1c6c64a235bae4c575540bc4a12df Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 21 Feb 2019 14:00:34 +0800
+Subject: [PATCH] lvm2-monitoring service shouldn't refer to lvmetad
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=lvm2.git;
+a=commit;h=df2fa88e631b13f0f2cfff4aeab80f12bd93ab72]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ scripts/lvm2_monitoring_systemd_red_hat.service.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/lvm2_monitoring_systemd_red_hat.service.in b/scripts/lvm2_monitoring_systemd_red_hat.service.in
+index 2b87479..3282a95 100644
+--- a/scripts/lvm2_monitoring_systemd_red_hat.service.in
++++ b/scripts/lvm2_monitoring_systemd_red_hat.service.in
+@@ -1,8 +1,8 @@
+ [Unit]
+ Description=Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling
+ Documentation=man:dmeventd(8) man:lvcreate(8) man:lvchange(8) man:vgchange(8)
+-Requires=dm-event.socket lvm2-lvmetad.socket
+-After=dm-event.socket dm-event.service lvm2-lvmetad.socket lvm2-activation.service lvm2-lvmetad.service tmp.mount
++Requires=dm-event.socket
++After=dm-event.socket dm-event.service lvm2-activation.service tmp.mount
+ Before=local-fs-pre.target
+ DefaultDependencies=no
+ Conflicts=shutdown.target
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb
index b28acf1..c38c381 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb
@@ -2,7 +2,9 @@ require lvm2.inc
 
 SRCREV = "913c28917e62577a2ef67152b2e5159237503dda"
 
-SRC_URI += "file://0001-explicitly-do-not-install-libdm.patch"
+SRC_URI += "file://0001-explicitly-do-not-install-libdm.patch \
+            file://0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch \
+           "
 
 DEPENDS += "autoconf-archive-native"
 
-- 
2.7.4



Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1756373306
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 03:53:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97179542"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jun 2015 11:57:40 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5H3ps2G001423
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 11:51:55 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Jun 2015 11:53:39 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jun 2015 11:53:05 +0800
Message-ID: <1434513185-1604-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [meta-networking][PATCH] quagga: bug fix
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
X-List-Received-Date: Wed, 17 Jun 2015 03:53:31 -0000
Content-Type: text/plain

The bug is: after the service stopped,the pid file still exists.
So modidy the service files.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-protocols/quagga/files/bgpd.service   | 4 +++-
 meta-networking/recipes-protocols/quagga/files/ospf6d.service | 4 +++-
 meta-networking/recipes-protocols/quagga/files/ospfd.service  | 4 +++-
 meta-networking/recipes-protocols/quagga/files/ripd.service   | 4 +++-
 meta-networking/recipes-protocols/quagga/files/ripngd.service | 4 +++-
 meta-networking/recipes-protocols/quagga/files/zebra.service  | 4 +++-
 meta-networking/recipes-protocols/quagga/quagga.inc           | 2 ++
 7 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/files/bgpd.service b/meta-networking/recipes-protocols/quagga/files/bgpd.service
index 164c817..76f9f61 100644
--- a/meta-networking/recipes-protocols/quagga/files/bgpd.service
+++ b/meta-networking/recipes-protocols/quagga/files/bgpd.service
@@ -7,7 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/bgpd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/bgpd -d $bgpd_options -f /etc/quagga/bgpd.conf
+PIDFile=@localstatedir@/run/quagga/bgpd.pid
+ExecStart=@SBINDIR@/bgpd -d $bgpd_options -f @SYSCONFDIR@/quagga/bgpd.conf
+ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/bgpd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ospf6d.service b/meta-networking/recipes-protocols/quagga/files/ospf6d.service
index 4b8ebf8..a2e493b 100644
--- a/meta-networking/recipes-protocols/quagga/files/ospf6d.service
+++ b/meta-networking/recipes-protocols/quagga/files/ospf6d.service
@@ -7,7 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ospf6d.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/ospf6d -d $ospf6d_options -f /etc/quagga/ospf6d.conf
+PIDFile=@localstatedir@/run/quagga/ospf6d.pid
+ExecStart=@SBINDIR@/ospf6d -d $ospf6d_options -f @SYSCONFDIR@/quagga/ospf6d.conf
+ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ospf6d.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ospfd.service b/meta-networking/recipes-protocols/quagga/files/ospfd.service
index f9f5031..0c62cbc 100644
--- a/meta-networking/recipes-protocols/quagga/files/ospfd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ospfd.service
@@ -7,7 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ospfd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/ospfd -d $ospfd_options -f /etc/quagga/ospfd.conf
+PIDFile=@localstatedir@/run/quagga/ospfd.pid
+ExecStart=@SBINDIR@/ospfd -d $ospfd_options -f @SYSCONFDIR@/quagga/ospfd.conf
+ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ospfd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ripd.service b/meta-networking/recipes-protocols/quagga/files/ripd.service
index 5dfd28b..1d20389 100644
--- a/meta-networking/recipes-protocols/quagga/files/ripd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ripd.service
@@ -7,7 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ripd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/ripd -d $ripd_options -f /etc/quagga/ripd.conf
+PIDFile=@localstatedir@/run/quagga/ripd.pid
+ExecStart=@SBINDIR@/ripd -d $ripd_options -f @SYSCONFDIR@/quagga/ripd.conf
+ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ripd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ripngd.service b/meta-networking/recipes-protocols/quagga/files/ripngd.service
index 72562d5..0355ad1 100644
--- a/meta-networking/recipes-protocols/quagga/files/ripngd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ripngd.service
@@ -7,7 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ripngd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/ripngd -d $ripngd_options -f /etc/quagga/ripngd.conf
+PIDFile=@localstatedir@/run/quagga/ripngd.pid
+ExecStart=@SBINDIR@/ripngd -d $ripngd_options -f @SYSCONFDIR@/quagga/ripngd.conf
+ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ripngd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/zebra.service b/meta-networking/recipes-protocols/quagga/files/zebra.service
index afdd9e5..e4fb6c8 100644
--- a/meta-networking/recipes-protocols/quagga/files/zebra.service
+++ b/meta-networking/recipes-protocols/quagga/files/zebra.service
@@ -7,8 +7,10 @@ ConditionPathExists=@SYSCONFDIR@/quagga/zebra.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
+PIDFile=@localstatedir@/run/quagga/zebra.pid
 ExecStartPre=@BASE_SBINDIR@/ip route flush proto zebra
-ExecStart=@SBINDIR@/zebra -d $zebra_options -f /etc/quagga/zebra.conf
+ExecStart=@SBINDIR@/zebra -d $zebra_options -f @SYSCONFDIR@/quagga/zebra.conf
+ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/zebra.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 071e8d4..2f0b515 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -145,6 +145,8 @@ do_install () {
     sed -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
         -e 's,@SYSCONFDIR@,${sysconfdir},g' \
         -e 's,@SBINDIR@,${sbindir},g' \
+        -e 's,@base_bindir@,${base_bindir},g' \
+        -e 's,@localstatedir@,${localstatedir},g' \
         -i ${D}${systemd_unitdir}/system/*.service
 }
 
-- 
1.8.4.2



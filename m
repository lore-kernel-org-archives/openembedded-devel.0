Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1E357F645
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 12:53:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9HCrqwB019285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 05:53:52 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 17 Oct 2019 05:53:51 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Oct 2019 08:53:51 -0400
Message-ID: <20191017125351.501-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.18.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] quagga: fix PIDFile path for service files
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
X-List-Received-Date: Thu, 17 Oct 2019 12:53:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Multiple quagga service files are causing the following type of message to
appear during boot:

/lib/systemd/system/zebra.service:10: PIDFile= references a path below legacy
directory /var/run/, updating /var/run/quagga/zebra.pid → /run/quagga/zebra.pid;
please update the unit file accordingly.

Update the service files included as part of the recipe to use /run instead of
/var/run as the PIDFile path.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-networking/recipes-protocols/quagga/files/bgpd.service   | 4 ++--
 meta-networking/recipes-protocols/quagga/files/ospf6d.service | 4 ++--
 meta-networking/recipes-protocols/quagga/files/ospfd.service  | 4 ++--
 meta-networking/recipes-protocols/quagga/files/ripd.service   | 4 ++--
 meta-networking/recipes-protocols/quagga/files/ripngd.service | 4 ++--
 meta-networking/recipes-protocols/quagga/files/zebra.service  | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/files/bgpd.service b/meta-networking/recipes-protocols/quagga/files/bgpd.service
index 76f9f61e7..c1021fbd7 100644
--- a/meta-networking/recipes-protocols/quagga/files/bgpd.service
+++ b/meta-networking/recipes-protocols/quagga/files/bgpd.service
@@ -7,9 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/bgpd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/bgpd.pid
+PIDFile=/run/quagga/bgpd.pid
 ExecStart=@SBINDIR@/bgpd -d $bgpd_options -f @SYSCONFDIR@/quagga/bgpd.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/bgpd.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/bgpd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ospf6d.service b/meta-networking/recipes-protocols/quagga/files/ospf6d.service
index a2e493b42..99d0e6dca 100644
--- a/meta-networking/recipes-protocols/quagga/files/ospf6d.service
+++ b/meta-networking/recipes-protocols/quagga/files/ospf6d.service
@@ -7,9 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ospf6d.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/ospf6d.pid
+PIDFile=/run/quagga/ospf6d.pid
 ExecStart=@SBINDIR@/ospf6d -d $ospf6d_options -f @SYSCONFDIR@/quagga/ospf6d.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ospf6d.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/ospf6d.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ospfd.service b/meta-networking/recipes-protocols/quagga/files/ospfd.service
index 0c62cbce5..fe8343be1 100644
--- a/meta-networking/recipes-protocols/quagga/files/ospfd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ospfd.service
@@ -7,9 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ospfd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/ospfd.pid
+PIDFile=/run/quagga/ospfd.pid
 ExecStart=@SBINDIR@/ospfd -d $ospfd_options -f @SYSCONFDIR@/quagga/ospfd.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ospfd.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/ospfd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ripd.service b/meta-networking/recipes-protocols/quagga/files/ripd.service
index 1d20389e8..7af65ca8a 100644
--- a/meta-networking/recipes-protocols/quagga/files/ripd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ripd.service
@@ -7,9 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ripd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/ripd.pid
+PIDFile=/run/quagga/ripd.pid
 ExecStart=@SBINDIR@/ripd -d $ripd_options -f @SYSCONFDIR@/quagga/ripd.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ripd.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/ripd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/ripngd.service b/meta-networking/recipes-protocols/quagga/files/ripngd.service
index 0355ad12a..9305f86be 100644
--- a/meta-networking/recipes-protocols/quagga/files/ripngd.service
+++ b/meta-networking/recipes-protocols/quagga/files/ripngd.service
@@ -7,9 +7,9 @@ ConditionPathExists=@SYSCONFDIR@/quagga/ripngd.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/ripngd.pid
+PIDFile=/run/quagga/ripngd.pid
 ExecStart=@SBINDIR@/ripngd -d $ripngd_options -f @SYSCONFDIR@/quagga/ripngd.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/ripngd.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/ripngd.pid
 Restart=on-abort
 
 [Install]
diff --git a/meta-networking/recipes-protocols/quagga/files/zebra.service b/meta-networking/recipes-protocols/quagga/files/zebra.service
index e4fb6c808..e34af7242 100644
--- a/meta-networking/recipes-protocols/quagga/files/zebra.service
+++ b/meta-networking/recipes-protocols/quagga/files/zebra.service
@@ -7,10 +7,10 @@ ConditionPathExists=@SYSCONFDIR@/quagga/zebra.conf
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/default/quagga
-PIDFile=@localstatedir@/run/quagga/zebra.pid
+PIDFile=/run/quagga/zebra.pid
 ExecStartPre=@BASE_SBINDIR@/ip route flush proto zebra
 ExecStart=@SBINDIR@/zebra -d $zebra_options -f @SYSCONFDIR@/quagga/zebra.conf
-ExecStopPost=@base_bindir@/rm -rf @localstatedir@/run/quagga/zebra.pid
+ExecStopPost=@base_bindir@/rm -rf /run/quagga/zebra.pid
 Restart=on-abort
 
 [Install]
-- 
2.18.1



Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1N7nPs-0005C5-7O
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 10:53:40 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 61E221406D; Tue, 10 Nov 2009 10:52:19 +0100 (CET)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2009 10:38:58 +0100
Message-Id: <20091110095219.61E221406D@mzh.zlo.nu>
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/3] Get rid of useless bash dependency in the linux client script.
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
X-List-Received-Date: Tue, 10 Nov 2009 09:53:40 -0000

---
 recipes/dhcp/dhcp_3.0.1.bb                   |    3 ++-
 recipes/dhcp/dhcp_3.0.2.bb                   |    3 ++-
 recipes/dhcp/dhcp_3.1.2p1.bb                 |    3 ++-
 recipes/dhcp/files/useless-use-of-bash.patch |    8 ++++++++
 4 files changed, 14 insertions(+), 3 deletions(-)
 create mode 100644 recipes/dhcp/files/useless-use-of-bash.patch

diff --git a/recipes/dhcp/dhcp_3.0.1.bb b/recipes/dhcp/dhcp_3.0.1.bb
index 7d55dc3..2deee26 100644
--- a/recipes/dhcp/dhcp_3.0.1.bb
+++ b/recipes/dhcp/dhcp_3.0.1.bb
@@ -2,10 +2,11 @@ SECTION = "console/network"
 DESCRIPTION = "Internet Software Consortium DHCP package"
 HOMEPAGE = "http://www.isc.org/"
 LICENSE = "BSD"
-PR = "r3"
+PR = "r4"
 SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-3.0-history/dhcp-${PV}.tar.gz \
 	   file://noattrmode.patch;patch=1 \
 	   file://fixincludes.patch;patch=1 \
+	   file://useless-use-of-bash.patch;patch=1 \
 	   file://init-relay file://default-relay \
 	   file://init-server file://default-server \
 	   file://dhclient.conf file://dhcpd.conf"
diff --git a/recipes/dhcp/dhcp_3.0.2.bb b/recipes/dhcp/dhcp_3.0.2.bb
index 9934590..3c3c742 100644
--- a/recipes/dhcp/dhcp_3.0.2.bb
+++ b/recipes/dhcp/dhcp_3.0.2.bb
@@ -3,10 +3,11 @@ require dhcp3.inc
 SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-3.0-history/dhcp-${PV}.tar.gz \
 	   file://noattrmode.patch;patch=1 \
 	   file://fixincludes.patch;patch=1 \
+	   file://useless-use-of-bash.patch;patch=1 \
 	   file://dhclient-script-exit-status.dpatch;patch=1 \
 	   file://dhcp-3.0.3-dhclient-dbus.patch;patch=1;pnum=0 \
 	   file://init-relay file://default-relay \
 	   file://init-server file://default-server \
 	   file://dhclient.conf file://dhcpd.conf"
 
-PR = "${INC_PR}"
+PR = "${INC_PR}.0"
diff --git a/recipes/dhcp/dhcp_3.1.2p1.bb b/recipes/dhcp/dhcp_3.1.2p1.bb
index e57fb01..4900a49 100644
--- a/recipes/dhcp/dhcp_3.1.2p1.bb
+++ b/recipes/dhcp/dhcp_3.1.2p1.bb
@@ -2,10 +2,11 @@ require dhcp3.inc
 
 SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-3.1-history/dhcp-${PV}.tar.gz \
 	   file://fixincludes.patch;patch=1 \
+	   file://useless-use-of-bash.patch;patch=1 \
 	   file://dhclient-script-exit-status.dpatch;patch=1 \
 	   file://dhcp-3.0.3-dhclient-dbus.patch;patch=1;pnum=0 \
 	   file://init-relay file://default-relay \
 	   file://init-server file://default-server \
 	   file://dhclient.conf file://dhcpd.conf"
 
-PR = "${INC_PR}"
+PR = "${INC_PR}.0"
diff --git a/recipes/dhcp/files/useless-use-of-bash.patch b/recipes/dhcp/files/useless-use-of-bash.patch
new file mode 100644
index 0000000..6628fe7
--- /dev/null
+++ b/recipes/dhcp/files/useless-use-of-bash.patch
@@ -0,0 +1,8 @@
+--- dhcp-3.0.2p1/client/scripts/linux	2006-07-22 04:24:16.000000000 +0200
++++ dhcp-3.0.2p1/client/scripts/linux	2009-11-03 17:51:55.000000000 +0100
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ # dhclient-script for Linux. Dan Halbert, March, 1997.
+ # Updated for Linux 2.[12] by Brian J. Murrell, January 1999.
+ # No guarantees about this. I'm a novice at the details of Linux
-- 
1.6.3.1




Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id F3A2C6A49F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Jun 2013 22:36:00 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ujzpc-0002sA-9G for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jun 2013 00:35:56 +0200
Received: from tfitzsim-lnx.cisco.com ([161.44.225.6])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jun 2013 00:35:56 +0200
Received: from fitzsim by tfitzsim-lnx.cisco.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jun 2013 00:35:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Thomas Fitzsimmons <fitzsim@cisco.com>
Date: Tue, 04 Jun 2013 18:36:28 -0400
Message-ID: <m6pg8v2p8pw3.fsf@cisco.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: tfitzsim-lnx.cisco.com
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1.50 (gnu/linux)
Cancel-Lock: sha1:04pxoAwq2xvz/y8iI9GkNx6awcw=
Subject: [meta-networking][PATCH v2] net-snmp: Backport fix for NETSNMP_NO_SYSTEMD typos
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
X-List-Received-Date: Tue, 04 Jun 2013 22:36:01 -0000
Content-Type: text/plain

Added Signed-off-by for backport patch refresh.  Bumped PR.

Signed-off-by: Thomas Fitzsimmons <fitzsim@cisco.com>
---
 .../net-snmp/net-snmp/systemd-support.patch        |    6 ++++--
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.bb   |    2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
index 18955f2..e19153b 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
@@ -7,12 +7,14 @@ fef6cddfdb94da1a6b1fb768af62918b80f11fd3
 0641e43c694c485cbbffef0556efc4641bd3ff50
 76530a89f1c8bbd0b63acce63e10d5d4812a1a16 (conflict resolved)
 bf108d7f1354f6276fc43c129963f2c49b9fc242
+3692875172352f72cf3afd0d35f355e83d7e421b
 74412748067c685e1d8ab6ed3bcc3ca9c2774844
 86132e3f1e6ef7b4e0b96d8fa24e37c81b71b0e0
 63557cf8986a33dba1d4429b583a901361052c4f
 
 Upstream-Status: Backport
 
+Signed-off-by: Thomas Fitzsimmons <fitzsim@cisco.com>
 diff --git a/README.systemd b/README.systemd
 new file mode 100644
 index 0000000..f731851
@@ -89,10 +91,10 @@ index b177d5b..08bdfc7 100644
  #endif
  
  #ifndef WIN32
-+#ifndef NETSNMP_NO_SYSYSTEMD
++#ifndef NETSNMP_NO_SYSTEMD
 +    /* check if systemd has sockets for us and don't close them */
 +    prepared_sockets = netsnmp_sd_listen_fds(0);
-+#endif /* NETSNMP_NO_SYSYSTEMD */
++#endif /* NETSNMP_NO_SYSTEMD */
 +
      /*
       * close all non-standard file descriptors we may have
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
index 4c3939a..d21995a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5
 
 DEPENDS = "openssl libnl pciutils"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://init \
         file://snmpd.conf \
-- 
1.6.0.6




Return-Path: <Rongqing.Li@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA3B6A9F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2013 02:23:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7G2NrWt007634
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 22:23:53 -0400 (EDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 15 Aug 2013 19:23:52 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe.macdonald@windriver.com>
Date: Fri, 16 Aug 2013 10:23:59 +0800
Message-ID: <1376619839-23232-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-networking] quagga: two fixes
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
X-List-Received-Date: Fri, 16 Aug 2013 02:23:54 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

1. quagga should depend on iproute2, since ip from busybox is not sufficient
2. fix a typOS(should chmod, not chown)

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index f5489c6..89b9f7a 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -5,7 +5,7 @@ Unix platforms, particularly FreeBSD, Linux, Solaris and NetBSD. \
 Quagga is a fork of GNU Zebra which was developed by Kunihiro \
 Ishiguro. The Quagga tree aims to build a more involved community \
 around Quagga than the current centralised model of GNU Zebra."
-HOMEPAGE = "http://www.quagga.net/"
+HOMEPAGE = "http://www.nongnu.org/quagga/"
 SECTION = "network"
 LICENSE = "GPL-2.0 & LGPL-2.0"
 DEPENDS = "readline ncurses perl-native"
@@ -17,6 +17,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
 
 INC_PR = "r2"
 
+# the "ip" command from busybox is not sufficient (flush by protocol flushes all routes)
+RDEPENDS_${PN} += "iproute2"
+
 QUAGGASUBDIR = ""
 # ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
 # versions and leave it empty for recent versions.
@@ -128,11 +131,11 @@ pkg_postinst_${PN} () {
     if [ "x$D" != "x" ] ; then
         exit 1
     fi
-    for f in bgpd babeld isisd ospfd ripngd zebra ripd ospf6d; do touch ${sysconfdir}/quagga/$f.conf; done
+    for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; do touch ${sysconfdir}/quagga/$f.conf; done
     chown quagga:quaggavty ${sysconfdir}/quagga
     chown quagga:quagga ${sysconfdir}/quagga/*.conf
     chmod 750 ${sysconfdir}/quagga
-    chown 640 ${sysconfdir}/quagga/*.conf
+    chmod 640 ${sysconfdir}/quagga/*.conf
     if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
         ${sysconfdir}/init.d/populate-volatile.sh update
     fi
-- 
1.7.10.4



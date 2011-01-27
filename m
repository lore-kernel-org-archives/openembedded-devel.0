Received: from hera.xen.prgmr.com ([66.220.0.89])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rphillips@hera.xen.prgmr.com>) id 1PiUZ4-0008ER-Nt
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 17:19:19 +0100
Received: by hera.xen.prgmr.com (Postfix, from userid 1000)
	id 616E16E0126; Thu, 27 Jan 2011 08:10:58 -0800 (PST)
From: Ryan D Phillips <ryan_d_phillips@dell.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jan 2011 08:10:45 -0800
Message-Id: <1296144645-16120-1-git-send-email-ryan_d_phillips@dell.com>
X-Mailer: git-send-email 1.7.3
Subject: [PATCH] bind: Add DISTRO_FEATURES support for ipv6
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
X-List-Received-Date: Thu, 27 Jan 2011 16:19:19 -0000

Signed-off-by: Ryan D Phillips <ryan_d_phillips@dell.com>
---
 recipes/bind/bind_9.3.1.bb    |    6 ++++--
 recipes/bind/bind_9.3.4-P1.bb |    6 ++++--
 recipes/bind/bind_9.3.5-P1.bb |    6 ++++--
 recipes/bind/bind_9.3.6.bb    |    7 +++++--
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/recipes/bind/bind_9.3.1.bb b/recipes/bind/bind_9.3.1.bb
index 268253e..11d4c71 100644
--- a/recipes/bind/bind_9.3.1.bb
+++ b/recipes/bind/bind_9.3.1.bb
@@ -1,7 +1,7 @@
 DEPENDS = "openssl"
 RPEDENDS = ""
 DESCRIPTION = "ISC Internet Domain Name Server"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.isc.org/isc/bind9/9.3.1/bind-9.3.1.tar.gz \
            file://lib_dns_Makefile.in.patch \
@@ -9,7 +9,9 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/9.3.1/bind-9.3.1.tar.gz \
 	   file://conf.patch \
 	   "
 
-EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr"
+EXTRA_OECONF = "--with-randomdev=/dev/random --disable-threads \
+                --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr \
+                ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '--enable-ipv6=no', d)}"
 inherit autotools update-rc.d
 
 INITSCRIPT_NAME = "bind"
diff --git a/recipes/bind/bind_9.3.4-P1.bb b/recipes/bind/bind_9.3.4-P1.bb
index 70c261e..f8ae48f 100644
--- a/recipes/bind/bind_9.3.4-P1.bb
+++ b/recipes/bind/bind_9.3.4-P1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ISC Internet Domain Name Server"
 SECTION = "console/network"
 HOMEPAGE = "http://www.isc.org/sw/bind/"
 LICENSE = "BSD"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "openssl"
 
@@ -12,7 +12,9 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/9.3.4-P1/bind-9.3.4-P1.tar.gz \
 	   file://so_bsdcompat.patch \
 	   "
 
-EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr"
+EXTRA_OECONF = "--with-randomdev=/dev/random --disable-threads \
+                --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr \
+                ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '--enable-ipv6=no', d)}"
 inherit autotools update-rc.d
 
 INITSCRIPT_NAME = "bind"
diff --git a/recipes/bind/bind_9.3.5-P1.bb b/recipes/bind/bind_9.3.5-P1.bb
index bb98261..f573e57 100644
--- a/recipes/bind/bind_9.3.5-P1.bb
+++ b/recipes/bind/bind_9.3.5-P1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ISC Internet Domain Name Server"
 SECTION = "console/network"
 HOMEPAGE = "http://www.isc.org/sw/bind/"
 LICENSE = "BSD"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "openssl"
 
@@ -12,7 +12,9 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/9.3.5-P1/bind-9.3.5-P1.tar.gz \
 	   file://so_bsdcompat.patch \
 	   "
 
-EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr"
+EXTRA_OECONF = "--with-randomdev=/dev/random --disable-threads \
+                --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr \
+                ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '--enable-ipv6=no', d)}"
 inherit autotools update-rc.d
 
 INITSCRIPT_NAME = "bind"
diff --git a/recipes/bind/bind_9.3.6.bb b/recipes/bind/bind_9.3.6.bb
index b10d6e8..2ea37f9 100644
--- a/recipes/bind/bind_9.3.6.bb
+++ b/recipes/bind/bind_9.3.6.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ISC Internet Domain Name Server"
 SECTION = "console/network"
 HOMEPAGE = "http://www.isc.org/sw/bind/"
 LICENSE = "BSD"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "openssl"
 
@@ -11,7 +11,10 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${PN}-${PV}.tar.gz \
 	   file://configure.in.patch \
 	   "
 
-EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr --disable-devpoll --disable-epoll"
+EXTRA_OECONF = "--with-randomdev=/dev/random --disable-threads \
+                --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr --disable-devpoll \
+                --disable-epoll \
+                ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '--enable-ipv6=no', d)}"
 inherit autotools update-rc.d
 
 INITSCRIPT_NAME = "bind"
-- 
1.7.2.3




Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RdFXq-0003G0-6F
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 07:20:54 +0100
Received: from mail145-ch1-R.bigfish.com (10.43.68.248) by
	CH1EHSOBE014.bigfish.com (10.43.70.64) with Microsoft SMTP Server id
	14.1.225.23; Wed, 21 Dec 2011 05:58:34 +0000
Received: from mail145-ch1 (localhost [127.0.0.1])	by
	mail145-ch1-R.bigfish.com (Postfix) with ESMTP id 5E703400124	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:59:04 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(z98bRz936eKzz1202hzz8275ch8275bh8275dhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail145-ch1 (localhost.localdomain [127.0.0.1]) by mail145-ch1
	(MessageSwitch) id 1324447144208846_2063;
	Wed, 21 Dec 2011 05:59:04 +0000 (UTC)
Received: from CH1EHSMHS012.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.240])	by mail145-ch1.bigfish.com (Postfix) with ESMTP id
	2E2DA300045	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:59:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS012.bigfish.com
	(10.43.70.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 21 Dec 2011 05:58:33 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Tue, 20 Dec 2011 23:58:41 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBL5wYWY015654;
	Tue, 20 Dec 2011 23:58:40 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Dec 2011 14:01:41 +0800
Message-ID: <1324447304-4874-4-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324447304-4874-1-git-send-email-b19537@freescale.com>
References: <1324447304-4874-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v3 meta-oe 4/7] ipsec-tools: add version 0.7.2
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
X-List-Received-Date: Wed, 21 Dec 2011 06:20:54 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    IPsec-Tools is a port of KAME's IPsec utilities to the Linux IPsec
    implementation.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../ipsec-tools/files/ipsec-tools-install.patch    |   14 +++++
 .../recipes-support/ipsec-tools/ipsec-tools.inc    |   51 ++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.7.2.bb               |    7 +++
 3 files changed, 72 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
 create mode 100644 meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc
 create mode 100644 meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb

diff --git a/meta-oe/recipes-support/ipsec-tools/files/ipsec-tools-install.patch b/meta-oe/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
new file mode 100644
index 0000000..6b9c39b
--- /dev/null
+++ b/meta-oe/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
@@ -0,0 +1,14 @@
+Taken from pld-linux.org:
+http://cvs.pld-linux.org/cgi-bin/cvsweb.cgi/packages/ipsec-tools/ipsec-tools-install.patch
+
+--- ipsec-tools-0.7.2/src/racoon/Makefile.am~	2008-07-23 13:48:40.000000000 +0200
++++ ipsec-tools-0.7.2/src/racoon/Makefile.am	2009-07-04 01:43:48.148433975 +0200
+@@ -3,7 +3,7 @@
+ sbin_PROGRAMS = racoon racoonctl plainrsa-gen
+ noinst_PROGRAMS = eaytest
+ include_racoon_HEADERS = racoonctl.h var.h vmbuf.h misc.h gcmalloc.h admin.h \
+-	schedule.h sockmisc.h vmbuf.h isakmp_var.h isakmp.h isakmp_xauth.h \
++	schedule.h sockmisc.h isakmp_var.h isakmp.h isakmp_xauth.h \
+ 	isakmp_cfg.h isakmp_unity.h ipsec_doi.h evt.h
+ lib_LTLIBRARIES = libracoon.la
+ 
diff --git a/meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc b/meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc
new file mode 100644
index 0000000..caf2b0b
--- /dev/null
+++ b/meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc
@@ -0,0 +1,51 @@
+DESCRIPTION = "IPsec-Tools is a port of KAME's IPsec utilities to the \
+Linux-2.6 IPsec implementation."
+HOMEPAGE = "http://ipsec-tools.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "BSD"
+DEPENDS = "virtual/kernel openssl readline flex"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/ipsec-tools/ipsec-tools-${PV}.tar.bz2;name=ipsec-tools-${PV}"
+
+inherit autotools
+
+# Options:
+#  --enable-adminport      enable admin port
+#  --enable-rc5            enable RC5 encryption (patented)
+#  --enable-idea enable IDEA encryption (patented)
+#  --enable-gssapi         enable GSS-API authentication
+#  --enable-hybrid         enable hybrid, both mode-cfg and xauth support
+#  --enable-frag           enable IKE fragmentation payload support
+#  --enable-stats          enable statistics logging function
+#  --enable-dpd            enable dead peer detection
+#  --enable-samode-unspec  enable to use unspecified a mode of SA
+#  --disable-ipv6          disable ipv6 support
+#  --enable-natt           enable NAT-Traversal (yes/no/kernel)
+#  --enable-natt-versions=list    list of supported NAT-T versions delimited by coma.
+#  --with-kernel-headers=/lib/modules/<uname>/build/include
+#                          where your Linux Kernel headers are installed
+#  --with-readline         support readline input (yes by default)
+#  --with-flex             use directiory (default: no)
+#  --with-flexlib=<LIB>    specify flex library.
+#  --with-openssl=DIR      specify OpenSSL directory
+#  --with-libradius=DIR    specify libradius path (like/usr/pkg)
+#  --with-libpam=DIR       specify libpam path (like/usr/pkg)
+#
+# Note: if you give it the actual kernel headers it won't build, it actually
+# needs to point at the linux-libc-headers version of the kernel headers.
+#
+EXTRA_OECONF = "--with-kernel-headers=${STAGING_INCDIR} \
+                --with-readline \
+                --with-openssl=${STAGING_LIBDIR}/.. \
+                --without-libradius \
+                --without-gssapi \
+                --without-libpam \
+		--disable-security-context"
+
+# See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=530527
+CFLAGS += "-fno-strict-aliasing"
+
+# Sometimes it attempts to use y.tab.c before it is actually
+# generated. Note that the failure case is very rare, but it does
+# happen.
+PARALLEL_MAKE = ""
diff --git a/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb b/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
new file mode 100644
index 0000000..270d77e
--- /dev/null
+++ b/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
@@ -0,0 +1,7 @@
+require ipsec-tools.inc
+
+LIC_FILES_CHKSUM = "file://Makefile.in;endline=14;md5=c73d05590728997bfbab5c671ed38366"
+
+SRC_URI += "file://ipsec-tools-install.patch"
+SRC_URI[ipsec-tools-0.7.2.md5sum] = "72861f005746ee27984b2ee715ecc629"
+SRC_URI[ipsec-tools-0.7.2.sha256sum] = "08722ff6c62de3e042fef337454f03622a79053108d6dcc686c9c854f9f9e031"
-- 
1.7.0.4





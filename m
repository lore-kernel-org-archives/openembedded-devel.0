Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1U1Dwc-0005bx-PE
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2013 11:34:07 +0100
Received: from mail94-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.23; Fri, 1 Feb 2013 10:03:17 +0000
Received: from mail94-tx2 (localhost [127.0.0.1])	by mail94-tx2-R.bigfish.com
	(Postfix) with ESMTP id 3012C360213	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:03:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h1155h)
Received: from mail94-tx2 (localhost.localdomain [127.0.0.1]) by mail94-tx2
	(MessageSwitch) id 1359712995331339_29721;
	Fri,  1 Feb 2013 10:03:15 +0000 (UTC)
Received: from TX2EHSMHS014.bigfish.com (unknown [10.9.14.245])	by
	mail94-tx2.bigfish.com (Postfix) with ESMTP id 4BD6F12004A	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:03:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS014.bigfish.com
	(10.9.99.114) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 1 Feb 2013 10:03:14 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 1 Feb 2013 10:03:02 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r11A2o9c030747;	Fri, 1 Feb 2013 03:03:00 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Feb 2013 18:02:48 +0800
Message-ID: <1359712968-22554-5-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1359712968-22554-1-git-send-email-b28495@freescale.com>
References: <1359712968-22554-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [meta-java][for denzil] 4/4] openjdk-6: Remove the Xp header and library configure checks
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
X-List-Received-Date: Fri, 01 Feb 2013 10:34:46 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Xp isn't used anymore by recent jdk versions.
Reference: http://icedtea.classpath.org/hg/icedtea7/raw-rev/a9324fa05b9d

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 ...the-autoconf-Xp-header-and-library-checks.patch |   21 ++++++++++++++++++++
 recipes-core/openjdk/openjdk-6-common.inc          |    3 +-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 recipes-core/openjdk/openjdk-6-6b24/Remove-the-autoconf-Xp-header-and-library-checks.patch

diff --git a/recipes-core/openjdk/openjdk-6-6b24/Remove-the-autoconf-Xp-header-and-library-checks.patch b/recipes-core/openjdk/openjdk-6-6b24/Remove-the-autoconf-Xp-header-and-library-checks.patch
new file mode 100644
index 0000000..98a5a7c
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-6-6b24/Remove-the-autoconf-Xp-header-and-library-checks.patch
@@ -0,0 +1,21 @@
+diff --git a/configure.ac b/configure.ac
+index bd95501..8c7178c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -218,16 +218,6 @@ fi
+ AC_SUBST(XT_CFLAGS)
+ AC_SUBST(XT_LIBS)
+ 
+-dnl Check for libXp headers and libraries.
+-PKG_CHECK_MODULES(XP, xp,[XP_FOUND=yes],[XP_FOUND=no])
+-if test "x${XP_FOUND}" = xno
+-then
+-  AC_MSG_ERROR([Could not find Xp - \
+-  Try installing libXp-devel.])
+-fi
+-AC_SUBST(XP_CFLAGS)
+-AC_SUBST(XP_LIBS)
+-
+ dnl Check for libX11 headers and libraries.
+ PKG_CHECK_MODULES(X11, x11,[X11_FOUND=yes],[X11_FOUND=no])
+ if test "x${X11_FOUND}" = xno
diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index 5990de7..35aee9d 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -10,7 +10,7 @@ ICEDTEA = "icedtea6-${ICEDTEA_VERSION}"
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
 
-INC_PR = "r22"
+INC_PR = "r23"
 
 SRC_URI = "\
   ${ICEDTEA_URI} \
@@ -23,6 +23,7 @@ SRC_URI = "\
   ${OEPATCHES} \
   ${ICEDTEAPATCHES} \
   file://jvm.cfg \
+  file://Remove-the-autoconf-Xp-header-and-library-checks.patch \
   "
 
 JDKPN = "openjdk-6"
-- 
1.7.5.4





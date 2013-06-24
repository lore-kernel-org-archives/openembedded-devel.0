Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id EF5156AD79
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 03:11:12 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so10375024pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2013 20:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RM9EPfsRlSi6OXbX+X86p8iKZZUGOnnbXRk9kwjlAN4=;
	b=bmx0d18B8sNwPxxTz73VawO3+qYoGTLmlf6cNtAMO7ZwKXzNdvLux7u6wlC8AUlYms
	7PebWKPcgC8w8a60npBho02wpBdEAljV9fQmCDfoP0EvKCFdzhFMTc1rTv/s6OWgOSvK
	MC2dsXOVSuNMAMtVIbco6bHIITomOc73+aITiaort4R1GQgledjo30JtlXbcO5fInzLJ
	ZQ6gJGhdUgMENqilPWdSfpKnb3yi3Pubxd3INUErsmK04PiaPL3/tVyvgrRKX59ba6vX
	ajuDZ+fO8ns4aF33cyiTKyzMBlxj03JrwGq3fnZG68EDiPUbKWXHwqnF4xiq+8ulXVIu
	gXIA==
X-Received: by 10.68.241.104 with SMTP id wh8mr22015093pbc.36.1372043474290;
	Sun, 23 Jun 2013 20:11:14 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id pq5sm15892506pbc.7.2013.06.23.20.11.13
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Jun 2013 20:11:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Jun 2013 20:10:56 -0700
Message-Id: <1372043456-22739-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH] netcat-openbsd: Update to 1.105
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
X-List-Received-Date: Mon, 24 Jun 2013 03:11:13 -0000

Add the missing dependency on libbsd
it was not building otherwise. libbsd recipes for OE-Core
has been ported please wait until they are applied

| netcat.c:99:24: fatal error: bsd/stdlib.h: No such file or directory
|  #include <bsd/stdlib.h>
|                         ^
| compilation terminated.
| make: *** [netcat.o] Error 1
| make: *** Waiting for unfinished jobs....
| socks.c:41:32: fatal error: bsd/readpassphrase.h: No such file or directory
|  #include <bsd/readpassphrase.h>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/netcat/netcat-openbsd_1.105.bb |   31 +++++++++++++++++++
 .../recipes-support/netcat/netcat-openbsd_1.89.bb  |   32 --------------------
 2 files changed, 31 insertions(+), 32 deletions(-)
 create mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
 delete mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
new file mode 100644
index 0000000..8f6cc54
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -0,0 +1,31 @@
+require netcat.inc
+DESCRIPTION = "OpenBSD Netcat"
+HOMEPAGE = "http://ftp.debian.org"
+LICENSE = "BSD-3-Clause"
+
+DEPENDS += "glib-2.0 libbsd"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
+           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7.debian.tar.gz;name=netcat-patch"
+
+SRC_URI[netcat.md5sum] = "7e67b22f1ad41a1b7effbb59ff28fca1"
+SRC_URI[netcat.sha256sum] = "40653fe66c1516876b61b07e093d826e2a5463c5d994f1b7e6ce328f3edb211e"
+SRC_URI[netcat-patch.md5sum] = "e914f8eb7eda5c75c679dd77787ac76b"
+SRC_URI[netcat-patch.sha256sum] = "eee759327ffea293e81d0dde67921b7fcfcad279ffd7a2c9d037bbc8f882b363"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+do_configure[noexec] = "1"
+
+do_compile() {
+    cd ${S}
+    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; done < ${WORKDIR}/debian/patches/series
+    pkgrel=4
+    oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
+}
+ALTERNATIVE_PRIORITY = "50"
diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
deleted file mode 100644
index 0a30de6..0000000
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-require netcat.inc
-DESCRIPTION = "OpenBSD Netcat"
-HOMEPAGE = "http://ftp.debian.org"
-LICENSE = "BSD-3-Clause"
-PR = "r2"
-
-DEPENDS += "glib-2.0"
-
-SRC_URI = "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89.orig.tar.gz;name=netcat \
-           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz;name=netcat-patch"
-
-SRC_URI[netcat.md5sum] = "7238ce15aae43069e96ba7faf03f153e"
-SRC_URI[netcat.sha256sum] = "72e844dde8a2a7cba61971d493758dbea9ef0b164bccef15fd4a36490dc77f2b"
-SRC_URI[netcat-patch.md5sum] = "00c65aa22243b76998174c733cbb64cc"
-SRC_URI[netcat-patch.sha256sum] = "d5b6b2bd9788114bdcfbb71acad0263720b4fdc41529e287adf451b8610f84f1"
-
-S = "${WORKDIR}/${BPN}-${PV}.orig"
-
-do_configure[noexec] = "1"
-
-do_compile() {
-    cd ${S}
-    while read line; do patch -p1 <debian/patches/$line; done <debian/patches/series
-    pkgrel=4
-    oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
-}
-ALTERNATIVE_PRIORITY = "50"
-- 
1.7.9.5



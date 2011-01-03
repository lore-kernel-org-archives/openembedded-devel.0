Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mwatkins.ti@gmail.com>) id 1PZoEg-0001GV-Lt
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 18:30:23 +0100
Received: by ywi6 with SMTP id 6so5649492ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 09:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=mqh/z6dsaLJaTbMu/wQjgHr6uU5t7S3Z0hrrF0ECT9E=;
	b=VpCUwuMmfXwUPPJ92b0UFXANV/oicFTU+tVxPQZRc1deWdtVk75R1I2LY+Y9tcRU89
	3hzz+abPGUvTC8V12vsbGTfM2UcSx1M+xsF1rQ6bvYU22CGHNdbrL0S80Cph/ix8LwHp
	cWb57zCFphCUsCpa6OpjB321aP02DoHMqtbzk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ad81J6e7PGAprcIxz82ReN+odcVwKAtYGhZ1L5m9TgRX7FH7X0ORYnxlbkYqNq1kU6
	nRh9lMtLWGqxrioYJHBFfIGWWl81NyTgJRf9v8fpaPg4ye76Ih0d4ufOySPjZKQkFg8V
	vTyyEsUWfSal9FWSgGPKIwce+9gf2Tnb1zT7k=
Received: by 10.90.28.5 with SMTP id b5mr12759701agb.61.1294075788553;
	Mon, 03 Jan 2011 09:29:48 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x31sm28386908ana.29.2011.01.03.09.29.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 09:29:47 -0800 (PST)
From: Melissa Watkins <mwatkins.ti@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 07:46:12 -0600
Message-Id: <1294062372-16433-1-git-send-email-m-watkins@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Melissa Watkins <m-watkins@ti.com>
Subject: [PATCH] ti-pru-sw: Update SRC_REV
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
X-List-Received-Date: Mon, 03 Jan 2011 17:30:23 -0000

For the ti-pru-sw-examples, ti-pru-sw-app-loader, ti-pru-sw-edma-driver,
ti-pru-sw-edma-library:

* Bump PR
* Update SRC_REV

Signed-off-by: Melissa Watkins <m-watkins@ti.com>
---
 recipes/ti/ti-pru-sw-app-loader_1.00.00.bb   |    4 ++--
 recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb  |    2 +-
 recipes/ti/ti-pru-sw-edma-library_1.00.00.bb |    4 ++--
 recipes/ti/ti-pru-sw-examples_1.00.00.bb     |    4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
index 6b7514d..394862e 100644
--- a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "PRU sw application loader"
 HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE = "BSD"
-PR = "r1+svnr${SRCPV}"
+PR = "r2+svnr${SRCPV}"
 
 COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "20"
+SRCREV = "21"
 S = "${WORKDIR}/trunk/app_loader"
 
 do_compile () {
diff --git a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
index b975d78..8b1cd0c 100644
--- a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "20"
+SRCREV = "21"
 S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/module"
 
 PACKAGE_STRIP = "no"
diff --git a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
index cb517de..3dc6154 100644
--- a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "eDMA library for use by PRU sw example applications"
 HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE = "BSD"
-PR = "r2+svnr${SRCPV}"
+PR = "r3+svnr${SRCPV}"
 
 DEPENDS += "virtual/kernel ti-pru-sw-edma-driver"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "20"
+SRCREV = "21"
 S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/interface"
 
 do_compile () {
diff --git a/recipes/ti/ti-pru-sw-examples_1.00.00.bb b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
index 5df6c6e..2f70241 100644
--- a/recipes/ti/ti-pru-sw-examples_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE = "BSD"
 DEPENDS += "ti-pru-sw-app-loader ti-pru-sw-edma-library"
 RDEPENDS += "ti-pru-sw-edma-driver kernel-module-uio-pru"
-PR = "r2+svnr${SRCPV}"
+PR = "r3+svnr${SRCPV}"
 
 COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "20"
+SRCREV = "21"
 S = "${WORKDIR}/trunk"
 
 do_compile () {
-- 
1.7.0.4




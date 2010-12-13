Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwatkins.ti@gmail.com>) id 1PSBwj-0002VM-D1
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 18:12:21 +0100
Received: by mail-gx0-f179.google.com with SMTP id 21so3994673gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 09:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=tj1ObCQwZL1xLfercD195QrwhY3Yfe00Rocm1cJAAsc=;
	b=UN+ShZuBeXKVPosGzu9xGsDwl+pDXWYDWDJJADJPIpMNzCw3lDQhsmwEbbsrzTCFTO
	Mbb6Q3HODyCXVln3nD88syXm7Pqo5G2YcMADZ2cjPGu/C9zZgMMhHGO1+aA1v1j/2XAF
	Lxm0KcpGRwoPoGtqoKm7fKqhQCeewB7sC6abw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=EyjoduaNO0Hsaq0RMuaGzifmMcuN8Lql54rLaS4KCUjMMXPkr/yg/s8J7aU762dcMb
	VbQKllfArzefvKMfb61kwSl4dK/VurqMDjb044MX5yoViHcFYrnd5caQYD2ja/bkdE0Q
	uMdWlfQEy3T2l3vGsilZl+ydUwG4FXyW63QGs=
Received: by 10.91.38.6 with SMTP id q6mr5452612agj.8.1292260247973;
	Mon, 13 Dec 2010 09:10:47 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id 2sm326187anw.18.2010.12.13.09.10.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Dec 2010 09:10:47 -0800 (PST)
From: Melissa Watkins <mwatkins.ti@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Dec 2010 07:20:20 -0600
Message-Id: <1292246420-5969-1-git-send-email-m-watkins@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.161.179
X-SA-Exim-Mail-From: mwatkins.ti@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00, DATE_IN_PAST_03_06, 
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Melissa Watkins <m-watkins@ti.com>, Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 4/4] ti-pru-sw-examples: fix package run-time dependencies
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
X-List-Received-Date: Mon, 13 Dec 2010 17:12:21 -0000

* This package depends on the ti-pru-sw-edma-driver and
  kernel-module-uio-pru modules at run-tim.  Added these packages
  to the RDEPENDS.
* Bump PR
* Update SRC_REV
* Update COMPATIBLE_MACHINE

Signed-off-by: Melissa Watkins <m-watkins@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/ti-pru-sw-examples_1.00.00.bb |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)
 mode change 100755 => 100644 recipes/ti/ti-pru-sw-examples_1.00.00.bb

diff --git a/recipes/ti/ti-pru-sw-examples_1.00.00.bb b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
old mode 100755
new mode 100644
index a9239f8..02c3376
--- a/recipes/ti/ti-pru-sw-examples_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
@@ -1,14 +1,15 @@
 DESCRIPTION = "PRU sw example applications"
 HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE = "BSD"
-DEPENDS = "ti-pru-sw-app-loader ti-pru-sw-edma-library"
-PR = "r0+svnr${SRCPV}"
+DEPENDS += "ti-pru-sw-app-loader ti-pru-sw-edma-library"
+RDEPENDS += "ti-pru-sw-edma-driver kernel-module-uio-pru"
+PR = "r1+svnr${SRCPV}"
 
-COMPATIBLE_MACHINE = "omapl138|am180x-evm"
+COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "18"
+SRCREV = "20"
 S = "${WORKDIR}/trunk"
 
 do_compile () {
-- 
1.7.0.4




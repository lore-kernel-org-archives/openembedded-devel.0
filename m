Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwatkins.ti@gmail.com>) id 1PSBwV-0002VM-M6
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 18:12:08 +0100
Received: by mail-gx0-f179.google.com with SMTP id 21so3994673gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 09:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Y93/iwMSmT8XJes0e5BHZ8ZDng6AIV2H2wjyCXX+rsE=;
	b=ZYyfSq48STjROeHj/Fzh3ujTbSuBz/BphV9qx+X1JIoX9svguM3IHVpUgfh5L20CUY
	QamHI7I2B0fMc/7aRZGf2odvf3+ysEK+R+Dw6si5LHl394ZTu8HuQYlkYGrjBlTV1Y/9
	UuCiAX791vIhW1wTvTOlazuXli1wLoSNY7aCg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=aA0Pzz9mAwwp5Y76ReM/z4nPxJGxXoHNRgic96MRdGq5z9u3YxokNbHZszWdggXxFU
	Nhk7+n+QAGwqvVMNwHQjKXeGD40VJ/wlQRm7/XgUwSDkh+xqGIyGiFHnlf4a4ZG9ltnK
	gXkICkFA6fWq4aZ2AeJSq4W8GA09zSAV2OSkw=
Received: by 10.150.189.16 with SMTP id m16mr5609748ybf.321.1292260234275;
	Mon, 13 Dec 2010 09:10:34 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p32sm2290565ybk.8.2010.12.13.09.10.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Dec 2010 09:10:33 -0800 (PST)
From: Melissa Watkins <mwatkins.ti@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Dec 2010 07:20:06 -0600
Message-Id: <1292246406-5937-1-git-send-email-m-watkins@ti.com>
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
Subject: [PATCH 3/4] ti-pru-sw-edma-library: fix package dependencies
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
X-List-Received-Date: Mon, 13 Dec 2010 17:12:08 -0000

* This package is not installed on the target system but only
  staged for use by other packages.  Therefore it does not need
  an RDEPENDS entry.
* The package does DEPEND on the ti-pru-sw-edma-driver being
  built prior to building.
* Bump the PR
* Update SRC_REV
* Update COMPATIBLE_MACHINE

Signed-off-by: Melissa Watkins <m-watkins@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/ti-pru-sw-edma-library_1.00.00.bb |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
index 76d0bdc..128d79d 100644
--- a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
@@ -1,17 +1,16 @@
 DESCRIPTION = "eDMA library for use by PRU sw example applications"
 HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE = "BSD"
-PR = "r0+svnr${SRCPV}"
+PR = "r1+svnr${SRCPV}"
 
-RDEPENDS_${PN} += "ti-pru-sw-edma-driver"
-DEPENDS += "virtual/kernel"
+DEPENDS += "virtual/kernel ti-pru-sw-edma-driver"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-COMPATIBLE_MACHINE = "omapl138|am180x-evm|am181x-evm"
+COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "18"
+SRCREV = "20"
 S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/interface"
 
 do_compile () {
-- 
1.7.0.4




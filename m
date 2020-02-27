Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id D3226608AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 01:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E4EF40BFD;
	Thu, 27 Feb 2020 01:49:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6TCMMEl5TLyl; Thu, 27 Feb 2020 01:49:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 652C440A13;
	Thu, 27 Feb 2020 01:49:21 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 23CE4172FDE;
	Wed, 26 Feb 2020 20:49:21 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Feb 2020 20:49:21 -0500
Message-Id: <1582768161-22966-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2] can-utils: update to v2020.02.04
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2020 01:49:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

https://github.com/linux-can/can-utils/releases/tag/v2020.02.04

This version is required to build against kernel > 5.2

While at it, drop redundant DESCRIPTION and branch=master

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - also drop SRCPV while pointing to exact release commit

 meta-oe/recipes-extended/socketcan/can-utils_git.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index e2609d4..5193688 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -1,17 +1,15 @@
 SUMMARY = "Linux CAN network development utilities"
-DESCRIPTION = "Linux CAN network development"
 LICENSE = "GPLv2 & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
 
 DEPENDS = "libsocketcan"
 
-SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master"
+SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git"
 
-SRCREV = "665d8699ebe728bf48e63e8ae58d2482db72f954"
+SRCREV = "da65fdfe0d1986625ee00af0b56ae17ec132e700"
 
-PV = "0.0+gitr${SRCPV}"
+PV = "2020.02.04"
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-
-- 
2.7.4



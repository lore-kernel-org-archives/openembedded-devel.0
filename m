Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 42CCE65C88
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 01:27:38 +0000 (UTC)
Received: by igkb16 with SMTP id b16so41977778igk.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 17:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KeJLTGTOSmL8DIWowHKDOC8HyEFjaAI5jUQgv+EvcPQ=;
	b=XEQgQ4qyAf1jvDkD99r/mKolOQeqiCOZ3BjQyv6QU6LKiMS73yN5dCzoulrTnq0rCU
	Vw/l7LDAvaSxlghzF00jHOuWR7dJ6lx1M6nn+MZSt5HfE55lffvoVKqyZiwqYBjRrVJV
	gFiORiOZaxtZWPKMD3wtTB2QDf5H74xt2koP9p/ahM+2Diy5GRV1L4f2r0hAHM2LqU2o
	F5bObGCG2J0SOUgtpDubHeJ1AU2sAM9r65x+et7YfXRlpd1N9vQ9qcMDjERQ9f/R5zZS
	L/xpVi2BfzS7hJn99gtKeDHJBg3b9l8Aatxu+Zx5Xl2Ki2gNGl7Soj7WJcvZFT5d5iGM
	So1g==
X-Received: by 10.43.14.10 with SMTP id po10mr786594icb.64.1425518859526;
	Wed, 04 Mar 2015 17:27:39 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205]) by mx.google.com with ESMTPSA id
	gz4sm11804305igb.19.2015.03.04.17.27.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Mar 2015 17:27:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 01:27:33 +0000
Message-Id: <1425518853-20124-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425518853-20124-1-git-send-email-raj.khem@gmail.com>
References: <1425518853-20124-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] lirc: Recommend to have lirc-plugins at runtime
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
X-List-Received-Date: Thu, 05 Mar 2015 01:27:39 -0000

This fixes the initialization errors where it cant find
the default drivers which are in plugins package

Change-Id: I5440fa09f8548069ac75ccb1521542cb8e054eb4
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/lirc/lirc.inc      | 2 +-
 meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/lirc/lirc.inc b/meta-oe/recipes-connectivity/lirc/lirc.inc
index 9a10c32..57a1f7d 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc.inc
+++ b/meta-oe/recipes-connectivity/lirc/lirc.inc
@@ -6,7 +6,7 @@ DESCRIPTION_append_lirc-nslu2example = " This package contains a working config
 HOMEPAGE = "http://www.lirc.org"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-DEPENDS = "alsa-lib libftdi"
+DEPENDS = "alsa-lib libftdi libusb1"
 PRIORITY = "optional"
 
 SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2"
diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
index 24374c1..11b532a 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
+++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
@@ -40,10 +40,10 @@ do_install_append() {
 
 PACKAGES =+ "${PN}-contrib ${PN}-exec ${PN}-plugins ${PN}-python"
 
-RDEPENDS_${PN}-exec = "lirc"
+RDEPENDS_${PN}-exec = "${PN}"
 RDEPENDS_${PN}-python = "python"
 
-RRECOMMENDS_lirc = "lirc-exec"
+RRECOMMENDS_lirc = "${PN}-exec ${PN}-plugins"
 
 FILES_${PN}-plugins = "${libdir}/lirc/plugins/*.so ${datadir}/lirc/configs"
 FILES_${PN}-contrib = "${datadir}/lirc/contrib"
-- 
2.1.4



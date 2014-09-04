Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id E14B2710C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:48:14 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bj1so19279686pad.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iRIIlh5wNOxZ4TwPBfUYX4x6S9X7LSjBA0Q0/6LD5m8=;
	b=jDHxLlo+ZFHciPilsUV6mz6Dcncywah01KXRKd1gOIh+9NIcyejW4rte3Zw9xQPh6K
	ELmeNrXcmnH9tMZXJsdYmdM9qz6vEfhKYE397vW6v+cICqc+sdTkt9Y4Jjb1n9NxsG8m
	rkiHRqQmtkVW+6Fe0ym7asqsnM3pQmVB5/Cn+D2WdvLAKjwrxL6MFovLcJ/jRFoJCeto
	U3C9+I3KSK1ffdZ6AR3qbndX5X3uJnie1la+Gwr95pE2N+S/tQyYh9IctX/YygBTh98u
	Nrs9mjr3bM3DU8nWS+vBd6n/0MvGPr+KfYqVeJPyU/XRfGRsCqm/kOq/uRyMEaJADJgJ
	AlZQ==
X-Received: by 10.70.102.129 with SMTP id fo1mr5905649pdb.14.1409816893318;
	Thu, 04 Sep 2014 00:48:13 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id oy9sm895174pdb.54.2014.09.04.00.48.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Sep 2014 00:48:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Sep 2014 00:51:57 -0700
Message-Id: <1409817117-25303-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH V2 2/6] ckermit: Update recipe ckermit_301.bb -> ckermit_302.bb
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
X-List-Received-Date: Thu, 04 Sep 2014 07:48:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/ckermit/{ckermit_301.bb => ckermit_302.bb}   | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/ckermit/{ckermit_301.bb => ckermit_302.bb} (90%)

diff --git a/meta-oe/recipes-support/ckermit/ckermit_301.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
similarity index 90%
rename from meta-oe/recipes-support/ckermit/ckermit_301.bb
rename to meta-oe/recipes-support/ckermit/ckermit_302.bb
index b255f5e..32a6c03 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_301.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -7,7 +7,11 @@ HOMEPAGE = "http://www.columbia.edu/kermit/"
 SECTION = "console/network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=932ca542d6c6cb8a59a0bcd76ab67cc3"
-SRC_URI = "ftp://kermit.columbia.edu/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
+
+SRC_URI = "ftp://ftp.kermitproject.org/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
+SRC_URI[md5sum] = "eac4dbf18b45775e4cdee5a7c74762b0"
+SRC_URI[sha256sum] = "0d5f2cd12bdab9401b4c836854ebbf241675051875557783c332a6a40dac0711"
+
 
 export CC2 = "${CC}"
 export BINDIR = "${bindir}"
@@ -52,6 +56,3 @@ do_install () {
     rm ${D}${BINDIR}/kermit-sshsub
     (cd ${D}${BINDIR} && ln -s ${BINDIR}/kermit kermit-sshusb)
 }
-
-SRC_URI[md5sum] = "59e80f909edf305933af8e0348dcc5d7"
-SRC_URI[sha256sum] = "9793eb125f8936b079c6d7e5c3d2ff885cfedc07f9d2dd1e7db928e3029a211a"
-- 
2.1.0



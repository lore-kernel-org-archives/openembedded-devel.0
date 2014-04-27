Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0841B65D05
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 05:01:55 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id uo5so4635936pbc.32
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yTw8QkuOrMIzT6MV8o9LUhhNLm6vH6NdGaqcZ63yO0Q=;
	b=ejhAd40vb0P53JYJX9DFIkOOfd6EvMFCt79LlOgajCEpUNIkIV0SR+Y6fN29LxB3Kp
	iPyQQuvajHckxrWZScrWnWEW0Bx66Aj4bhkf0wBynJbwiu8UCoZSBNbICrFWLYXRA5gL
	tdB7UQcE2AqRgj/kuy7GcQpN+5Mbse1nC5dfLIMWUbCzETQk+1P/3fkUTJ2pdfvPewzD
	AxRmLeT421HbhjxjV2ILh+W+7B2SNEqFnaThYiAz7+PSJL3ONPCIlerlZiT2Xp50/sFa
	GMq+2mvg7MN50fYlZE0LHv/P9+suFLpyngslqFWfEG24Ulr2bDCRnGtCLpV6NDpNi/rA
	Zp9g==
X-Received: by 10.68.197.8 with SMTP id iq8mr1500387pbc.124.1398574916754;
	Sat, 26 Apr 2014 22:01:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	id10sm26117504pbc.35.2014.04.26.22.01.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 22:01:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 22:03:33 -0700
Message-Id: <1398575015-5506-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH V2 07/21] bonnie++, lmbench, obex-data-server, samba, sg3-utils: Do not do out-of-tree builds
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
X-List-Received-Date: Sun, 27 Apr 2014 05:02:00 -0000

These recipes are not ready yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb          |    2 +-
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb         |    2 +-
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb |    2 +-
 meta-oe/recipes-connectivity/samba/samba.inc                |    2 +-
 meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb         |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
index 828d762..f8a23d7 100644
--- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
 SRC_URI[md5sum] = "750aa5b5051263a99c6c195888c74968"
 SRC_URI[sha256sum] = "cb3866116634bf65760b6806be4afa7e24a1cad6f145c876df8721f01ba2e2cb"
 
-inherit autotools
+inherit autotools-brokensep
 
 SCRIPTS = "bon_csv2html bon_csv2txt"
 EXES = "bonnie++ zcav"
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 267f75e..41db150 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYING-2;md5=8e9aee2ccc75d61d107e43794a25cdf9"
 
-inherit autotools
+inherit autotools-brokensep
 
 PR = "r2"
 
diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index e781985..f12941e 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz"
 SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
 SRC_URI[sha256sum] = "b399465ddbd6d0217abedd9411d9d74a820effa0a6a142adc448268d3920094f"
 
-inherit autotools
+inherit autotools-brokensep
 
 FILES_${PN} += "${datadir}/dbus-1/"
 
diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 59c6712..39fc814 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -12,7 +12,7 @@ SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
 
 S = "${WORKDIR}/samba-${PV}/source"
 
-inherit autotools update-rc.d
+inherit autotools-brokensep update-rc.d
 
 SAMBAMMAP = "no"
 SAMBAMMAP_libc-glibc = "yes"
diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
index beee36c..36c13a4 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
@@ -12,6 +12,6 @@ SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
 SRC_URI[md5sum] = "e532a3d6648c422347f6d84cac469263"
 SRC_URI[sha256sum] = "d7d3a8b4b698e2c17c8f16bb876946720260d4d659d471c5d7c12ce652ba38f1"
 
-inherit autotools
+inherit autotools-brokensep
 
 S = "${WORKDIR}/sg3_utils-${PV}"
-- 
1.7.10.4



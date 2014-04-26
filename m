Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 58BDA65D15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:44 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so4307007pdi.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=504zLkkWw+R7m8PLwnSe0bz4umvc0eNyeLnETBboJsE=;
	b=TUyhzgNTAsqhhKSCXbpJUssX4VIieAzCTdbFmGciKicfGOBtmlBwu+Y9kuyVo9e/AN
	O3UeGpkHtD5p6VztiLpeIfWuFCeTif2fs+C/4mKDP3zQ5acz1kdeSeBC9GXB+xDHB4eE
	kVABcHqVaV1CquJT7JKcecG0waVunU80PPAuVVr/FyYisnXXrAMAFu+x4JwNjysM7Z7x
	EvuBnKGGkHfjf9wVJAf3Hn4CFXHxag6MJGUv8NJ8LwsXPALEx1s8r/wzR+eliwkFhT7W
	aIzkWPyGUidqDyO4e9JeE113xtHoyYjSAQ+DOXpWncngtXcdU7Ntfvk98nIN8oKIm2GF
	xWLw==
X-Received: by 10.68.134.101 with SMTP id pj5mr19795171pbb.62.1398544365684;
	Sat, 26 Apr 2014 13:32:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:30 -0700
Message-Id: <1398544484-27299-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/21] bonnie++, lmbench, obex-data-server, samba, sg3-utils: Do not do out-of-tree builds
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:44 -0000

These recipes are not ready yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb          |    2 +-
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb         |    2 +-
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb |    2 +-
 meta-oe/recipes-connectivity/samba/samba.inc                |    2 +-
 meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb         |    5 +++--
 5 files changed, 7 insertions(+), 6 deletions(-)

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
index beee36c..fd11ce8 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
@@ -8,10 +8,11 @@ SECTION = "console/admin"
 LICENSE = "GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
 
-SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
+SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
+          "
 SRC_URI[md5sum] = "e532a3d6648c422347f6d84cac469263"
 SRC_URI[sha256sum] = "d7d3a8b4b698e2c17c8f16bb876946720260d4d659d471c5d7c12ce652ba38f1"
 
-inherit autotools
+inherit autotools-brokensep
 
 S = "${WORKDIR}/sg3_utils-${PV}"
-- 
1.7.10.4



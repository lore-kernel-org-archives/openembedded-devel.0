Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id A71EA65D59
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Sep 2014 06:45:50 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id g10so1973120pdj.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Sep 2014 23:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+0QutS2yxJpBY73GQkl81r2NgMoHmpYycVwej/mOfS8=;
	b=rpElCRItan32ER85viux7DZgLRCHzE+Tpu1DHbU4dihaUdN6y3pK8eEIGWEo9KJyHf
	3YTwDKYaL6WJH+ekvoxkvmLXhfVVEpJtfksOLFZfliHWhAMKtkLB07ClV7ZPJ9XiVd9j
	TaguXuL+OVa38WP6USdCGDcA08Gc6Oi/SKszH0JofLQYi6/oEqSK5HxQ9ZvDDiAUtHYy
	MmjmulS8T5rhmV/gRLi1SfUu+qITZjxMXP9ibKUhbdvB2WXgrfrl4CXTnO8bSfOhBFg4
	ZfOYD+fBZCBelbR9A2GUyUgHH6RzwaAif1PqWrNBOnmSq1l1ldDPMPY7vRJLbhEzBAbr
	j0Tw==
X-Received: by 10.67.5.40 with SMTP id cj8mr1791783pad.137.1411281951877;
	Sat, 20 Sep 2014 23:45:51 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id mw1sm2510524pdb.13.2014.09.20.23.45.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 20 Sep 2014 23:45:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Sep 2014 23:48:59 -0700
Message-Id: <1411282139-8785-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH] packagegroups: Move inheriting packagegroup below PACKAGE_ARCH assignment
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
X-List-Received-Date: Sun, 21 Sep 2014 06:45:55 -0000

Fixes errors

sets PACKAGE_ARCH before inherit packagegroup

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb | 5 +++--
 meta-oe/recipes-core/packagegroups/packagegroup-boot.bb  | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 08db943..9412df2 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -7,12 +7,13 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 
 PR = "r13"
 
-inherit packagegroup
-
+#
 # packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
 #
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 # Poke extra recomendations into the list using your machine.conf
 #
 MACHINE_EXTRA_RRECOMMENDS ?= ""
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index 3b634f3..ae7e989 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -4,12 +4,13 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 
 PR = "r58"
 
-inherit packagegroup
-
+#
 # packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
 #
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit packagegroup
+
 #
 # those ones can be set in machine config to supply packages needed to get machine booting
 #
-- 
2.1.0



Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1AA6E498
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 18:36:27 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kp14so8022229pab.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 10:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vNQNb7rpuHVlVwBNyhsjBczHYMuiSE6h0pjTSgxJo1I=;
	b=cmlDZXHJpjOQFWsI1hInsxw+v6yKX3XY4roX0My11+IzbShhALQ4o/7+mB+Zmx2ZQC
	kNqZezULSlukVnk34/0B0Li2Wcss1qN1mbb4kgVojg7yhK98RbzRe73pFAWIlUX7F4hp
	rUfvs3UxcH/LLGgHKjQQbOyQc3kGCBlM5pRkcqjzxQ1OWQ7a06vTY6F8H4ZbZGekZG3A
	Hs9Z0eV08BjiYQcMN2AJIc61j1z6om5/9MQweeQj3byz/TpLptbP1dki28ApW8aQfFNd
	IJw8PabJ3nzCLx0tqrzH1BcNRlyCmPpxuc2hmShj7LcUis3eB57olKzITQA12+vCci2c
	/hFg==
X-Received: by 10.68.229.164 with SMTP id sr4mr45597567pbc.82.1392143788529;
	Tue, 11 Feb 2014 10:36:28 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	tu3sm141398465pab.1.2014.02.11.10.36.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Feb 2014 10:36:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Feb 2014 10:36:52 -0800
Message-Id: <1392143812-27800-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] ltp-ddt: Fix build break with newer kernels
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
X-List-Received-Date: Tue, 11 Feb 2014 18:36:27 -0000

We need to point KERNEL_INC at include-generic otherwise
we end up with errors like

|                  from src/parser/st_i2c_parser.c:42:
|
/home/kraj/work/angstrom-2013.12/build/tmp-angstrom_v2013_12-eglibc/sysroots/beaglebone/usr/src/kernel/include/linux/wait.h:8:25:
fatal error: asm/current.h: No such file or directory
|  #include <asm/current.h>
|                          ^
| compilation terminated.
| make[2]: *** [i2c_tests] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
index c6ddf3d..da81964 100644
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
@@ -12,7 +12,7 @@ inherit autotools
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "5fba3d42f126ce13333fb7d0412d729b753ee5a4"
+SRCREV = "46e8aa7d0dd095300709309301e1c79f0003df40"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
@@ -25,7 +25,7 @@ EXTRA_OEMAKE_append = " \
     prefix=${LTPROOT} \
     CROSS_COMPILE=${HOST_PREFIX} \
     SKIP_IDCHECK=1 \
-    KERNEL_INC=${STAGING_KERNEL_DIR}/include \
+    KERNEL_INC=${STAGING_KERNEL_DIR}/include-generic \
     KERNEL_USR_INC=${STAGING_INCDIR} \
     ALSA_INCPATH=${STAGING_INCDIR} \
     ALSA_LIBPATH=${STAGING_LIBDIR} \
-- 
1.7.10.4



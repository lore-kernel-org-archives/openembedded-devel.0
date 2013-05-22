Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id D0BD960420
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 02:18:38 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc17so1212612pbc.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 19:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=nAT+DEUETiHzNPfXG9GE55ZnlEu5Cs733fyyHM85k9Q=;
	b=mS2pOJvjPric/8sR/PLm9y7giG+IwJyMq4vDNqKQ/WQKgdIa1shmSgp0hFLitfPAb3
	HrpSeLMQMWiSDKE0GXWC8Hvd4zzGmFl77vg9/eTImSwq/co/wa8QH0DcY3mB0BQdodBu
	GEq2Ct/WRG9SqpKmUHwjE2BONAVfflOQ+aV0LiyxzGbHimR5WpWPu1sEgNdnSzUz5oe/
	5AsOIOGVg8//tS2IizRz7zXmI1Q9rYeWCbjZpF2ho4U59j7lT9N7jcVaCwMj7E/f1SKr
	AVHaorxRMh5/uIOpkPvz+hks570WHPmbh+J8gTNNQ8dBOz4MMMPgF34KUv3OXN6+IUJv
	wnzA==
X-Received: by 10.68.180.67 with SMTP id dm3mr5461135pbc.110.1369189120006;
	Tue, 21 May 2013 19:18:40 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id 10sm5004849pbr.45.2013.05.21.19.18.38
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 May 2013 19:18:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 May 2013 19:16:49 -0700
Message-Id: <1369189009-18847-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-handheld][PATCH] ezxd: Add LIC_FILES_CHKSUM to recipe and -fPIC to CFLAGS
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
X-List-Received-Date: Wed, 22 May 2013 02:18:38 -0000

This recipe has been failing to build. With this patch
it now builds. build tested for beaglebone

Signed-off-by: Khem Raj <raj.khem@gmail.com>
CC: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 recipes-bsp/ezx/ezxd_svn.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/ezx/ezxd_svn.bb b/recipes-bsp/ezx/ezxd_svn.bb
index 6dbcd0f..7b69454 100644
--- a/recipes-bsp/ezx/ezxd_svn.bb
+++ b/recipes-bsp/ezx/ezxd_svn.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "Open implementation of motorola's tapisrv, replaces opentapi"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+"
 SECTION = "devel"
 AUTHOR = "Daniel Ribeiro"
 
 SRCREV = "2513"
 PV = "0.0+svnr${SRCPV}"
 PR = "r4"
-
+LIC_FILES_CHKSUM = "file://plugin.c;endline=19;md5=16da36fbb577507b411368f133ce2067"
 SRC_URI = "svn://svn.openezx.org/trunk/src/userspace/;module=ezxd;protocol=http \
            file://ezxd.init \
           "
@@ -18,9 +18,9 @@ INITSCRIPT_PARAMS = "start 00 S ."
 
 S = "${WORKDIR}/${PN}"
 
-CFLAGS_append = " -DDEBUG " 
+CFLAGS_append = " -DDEBUG -fPIC " 
 
-TARGET_CC_ARCH += "${LDFLAGS}"
+TARGET_CC_ARCH += "${LDFLAGS} -fPIC"
 
 do_configure() {
         # Comment out both CC and CROSS definitions
-- 
1.7.9.5



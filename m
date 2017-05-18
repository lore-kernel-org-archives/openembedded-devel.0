Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82C0871A71
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 02:13:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4I2Dib4025682
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 17 May 2017 19:13:44 -0700
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 17 May 2017 19:13:44 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 May 2017 22:07:01 -0400
Message-ID: <20170518020701.2773-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][V2 patch] rrdtool: allow configuration to disable nls
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
X-List-Received-Date: Thu, 18 May 2017 02:13:46 -0000
Content-Type: text/plain

When building rrdtool for a 'tiny' distro, that does not have native
language support (NLS) in glibc, configure fails with the error:
   autoreconf: failed to run autopoint: No such file or directory
Autopoint is part of gettext but without NLS support we populate the
sysroot with gettext-minimal-native rather then the full set of
gettext executables. This version does not install autopoint, nor
should it.

Tell autoreconf to skip the check for the autopoint script
regardless of NLS support and use the USE_NLS varible
to conditionally enable NLS support.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
index db2df28a0..3ccefb995 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
@@ -22,7 +22,7 @@ BBCLASSEXTEND = "native"
 SYSTEMD_PACKAGES = "rrdcached"
 SYSTEMD_SERVICE_rrdcached = "rrdcached.socket rrdcached.service"
 
-EXTRA_AUTORECONF = "-I m4"
+EXTRA_AUTORECONF = "-I m4 --exclude=autopoint"
 
 PACKAGECONFIG ??= "python perl ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
@@ -49,6 +49,7 @@ EXTRA_OECONF = " \
     --disable-lua \
     --disable-tcl \
     --disable-rpath \
+    --enable-nls=${USE_NLS} \
 "
 
 export STAGING_LIBDIR
-- 
2.11.0



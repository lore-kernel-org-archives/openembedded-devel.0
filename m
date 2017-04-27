Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C43977ABA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 06:35:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3R6ZiKd024265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 23:35:45 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Apr 2017 23:35:44 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Apr 2017 14:37:44 +0800
Message-ID: <1493275064-7998-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] xfsdump: upgrade to 3.1.6 and remove from blacklist
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
X-List-Received-Date: Thu, 27 Apr 2017 06:35:45 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

The 3.1.4 doesn't work with xfsprogs 4.7:
| inv_files.o: In function `inv_dirpath':
|xfsdump-3.1.4/invutil/inv_files.c:53: undefined reference to `ASSERT'
| inv_files.o: In function `inv_fstab':
|xfsdump-3.1.4/invutil/inv_files.c:60: undefined reference to `ASSERT'
| inv_files.o: In function `inv_lockfile':
|xfsdump-3.1.4/invutil/inv_files.c:67: undefined reference to `ASSERT'
| inv_files.o: In function `inv_basepath':
|xfsdump-3.1.4/invutil/inv_files.c:74: undefined reference to `ASSERT'
| collect2: error: ld returned 1 exit status
| make[2]: *** [../include/buildrules:33: xfsinvutil] Error 1

Upgrade to 3.1.6, and remove it from blacklist.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-utils/xfsdump/{xfsdump_3.1.4.bb => xfsdump_3.1.6.bb}    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.1.4.bb => xfsdump_3.1.6.bb} (79%)

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
similarity index 79%
rename from meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
index d5ad0b0b2..fac9d47e8 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
@@ -13,8 +13,8 @@ DEPENDS = "xfsprogs attr"
 SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz \
     file://remove-install-as-user.patch \
 "
-SRC_URI[md5sum] = "a8b1761be5feb363131e7b506639ad4c"
-SRC_URI[sha256sum] = "570eafd0721515bdd79cb0e295b701d49cdf81e71a0a0ff0df6d4c5cc1960943"
+SRC_URI[md5sum] = "50353cd4f4b435685955363e6044f4d1"
+SRC_URI[sha256sum] = "7f78c11ca527477d90e5e62b0778f3ad96f2b71c19173044e9aca9515fff42d0"
 
 inherit autotools-brokensep
 
@@ -34,5 +34,3 @@ do_install () {
     oe_runmake install
     oe_runmake install-dev
 }
-
-PNBLACKLIST[xfsdump] ?= "Depends on broken xfsprogs - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.11.0



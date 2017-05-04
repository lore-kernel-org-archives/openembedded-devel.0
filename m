Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFD1777B6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 10:05:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v44A5XRg015667
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 May 2017 03:05:33 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 4 May 2017 03:05:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 May 2017 18:05:30 +0800
Message-ID: <20170504100531.21451-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH V2 1/2] xfsdump: 3.1.4 -> 3.1.6
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
X-List-Received-Date: Thu, 04 May 2017 10:05:32 -0000
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

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-utils/xfsdump/{xfsdump_3.1.4.bb => xfsdump_3.1.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.1.4.bb => xfsdump_3.1.6.bb} (89%)

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
similarity index 89%
rename from meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
index d5ad0b0b2..8f942ba7c 100644
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
 
-- 
2.11.0



Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA4A77B96
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 10:05:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v44A5ZsC029738
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 May 2017 03:05:35 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 4 May 2017 03:05:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 May 2017 18:05:31 +0800
Message-ID: <20170504100531.21451-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170504100531.21451-1-Qi.Chen@windriver.com>
References: <20170504100531.21451-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH V2 2/2] xfsdump: fix do_configure failure and remove from blacklist
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
X-List-Received-Date: Thu, 04 May 2017 10:05:34 -0000
Content-Type: text/plain

Add '-D_FILE_OFFSET_BITS=64' to CFLAGS to fix the following do_configure
error.

  FATAL ERROR: cannot find a valid <xfs/xfs.h> header file.

Although -D_FILE_OFFSET_BITS=64 has already been defined in
include/builddefs.in, it only affects the compile process, leaving configure
process unaware of this value.

Remove from blacklist as the configure failure has been fixed by this patch.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
index 8f942ba7c..ecc746829 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
@@ -22,6 +22,8 @@ PARALLEL_MAKE = ""
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gettext] = "--enable-gettext=yes,--enable-gettext=no,gettext"
 
+CFLAGS += "-D_FILE_OFFSET_BITS=64"
+
 EXTRA_OEMAKE += "'LIBTOOL=${HOST_SYS}-libtool' V=1"
 
 do_configure () {
@@ -34,5 +36,3 @@ do_install () {
     oe_runmake install
     oe_runmake install-dev
 }
-
-PNBLACKLIST[xfsdump] ?= "Depends on broken xfsprogs - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.11.0



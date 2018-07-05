Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7288A789EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 06:22:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w656M43n007876
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Jul 2018 23:22:04 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 4 Jul 2018 23:22:03 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Jul 2018 14:22:00 +0800
Message-ID: <1530771721-20959-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-filesystems][PATCH 1/2] xfsdump: upgrade 3.1.7 -> 3.1.8
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
X-List-Received-Date: Thu, 05 Jul 2018 06:22:03 -0000
Content-Type: text/plain

Drop musl related patches since they had been merged upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../files/0001-Include-fcntl.h-for-O_EXCL.patch    |  28 -----
 ...-c99-defined-int64_t-instead-of-__int64_t.patch |  28 -----
 .../0002-Replace-__uint32_t-with-uint32_t.patch    | 122 ---------------------
 .../0003-replace-use-of-SIGCLD-with-SIGCHLD.patch  |  40 -------
 .../files/0004-include-limit.h-for-PATH_MAX.patch  |  29 -----
 ...-types.h-for-u_int32_t-in-attr-attributes.patch |  27 -----
 .../xfsdump/{xfsdump_3.1.7.bb => xfsdump_3.1.8.bb} |  10 +-
 7 files changed, 2 insertions(+), 282 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0001-Include-fcntl.h-for-O_EXCL.patch
 delete mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-Use-c99-defined-int64_t-instead-of-__int64_t.patch
 delete mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0002-Replace-__uint32_t-with-uint32_t.patch
 delete mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0003-replace-use-of-SIGCLD-with-SIGCHLD.patch
 delete mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0004-include-limit.h-for-PATH_MAX.patch
 delete mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0005-include-sys-types.h-for-u_int32_t-in-attr-attributes.patch
 rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.1.7.bb => xfsdump_3.1.8.bb} (69%)

diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0001-Include-fcntl.h-for-O_EXCL.patch b/meta-filesystems/recipes-utils/xfsdump/files/0001-Include-fcntl.h-for-O_EXCL.patch
deleted file mode 100644
index 660468d..0000000
--- a/meta-filesystems/recipes-utils/xfsdump/files/0001-Include-fcntl.h-for-O_EXCL.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 8cf48da5f645dd7bbb1ccbeab5bb0964f40f17f7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 23:18:47 -0700
-Subject: [PATCH 1/5] Include fcntl.h for O_EXCL
-
-Fix
-error: 'O_CREAT' undeclared (first use in this function)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- invutil/invidx.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/invutil/invidx.c b/invutil/invidx.c
-index 67efdf7..325a9a1 100644
---- a/invutil/invidx.c
-+++ b/invutil/invidx.c
-@@ -27,6 +27,7 @@
- #include <sys/stat.h>
- #include <string.h>
- #include <uuid/uuid.h>
-+#include <fcntl.h>
- 
- #include "types.h"
- #include "mlog.h"
--- 
-2.13.2
-
diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-Use-c99-defined-int64_t-instead-of-__int64_t.patch b/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-Use-c99-defined-int64_t-instead-of-__int64_t.patch
deleted file mode 100644
index 1fe1bde..0000000
--- a/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-Use-c99-defined-int64_t-instead-of-__int64_t.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f1e822d546e08cc195eaeb38ca172bd0c3800aa9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Sep 2017 07:48:48 -0700
-Subject: [PATCH] xfsdump: Use c99 defined int64_t instead of __int64_t
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- common/hsmapi.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/common/hsmapi.c b/common/hsmapi.c
-index 6054773..0709dbe 100644
---- a/common/hsmapi.c
-+++ b/common/hsmapi.c
-@@ -585,7 +585,7 @@ HsmModifyExtentMap(
- 	struct getbmapx	*bmap)
- {
- 	dmf_f_ctxt_t	*dmf_f_ctxtp = (dmf_f_ctxt_t *)contextp;
--	__int64_t	length;
-+	int64_t		length;
- 
- 	if (bmap[0].bmv_entries <= 0) {
- 		return 1;	/* caller must already be at EOF */
--- 
-2.14.1
-
diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0002-Replace-__uint32_t-with-uint32_t.patch b/meta-filesystems/recipes-utils/xfsdump/files/0002-Replace-__uint32_t-with-uint32_t.patch
deleted file mode 100644
index ed3e0a9..0000000
--- a/meta-filesystems/recipes-utils/xfsdump/files/0002-Replace-__uint32_t-with-uint32_t.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From f76d2142905f0e5bd830d5d576c235af1171c6ac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 23:23:31 -0700
-Subject: [PATCH 2/5] Replace __uint32_t with uint32_t
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- common/content_inode.h | 4 ++--
- doc/xfsdump.html       | 8 ++++----
- inventory/inv_oref.h   | 2 +-
- inventory/inv_priv.h   | 4 ++--
- inventory/inventory.h  | 2 +-
- 5 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/common/content_inode.h b/common/content_inode.h
-index a69a9a0..6936e05 100644
---- a/common/content_inode.h
-+++ b/common/content_inode.h
-@@ -191,10 +191,10 @@ typedef struct bstat bstat_t;
-  * and using two 16bit values to hold new 32bit projid was choosen
-  * to retain compatibility with "old" filesystems).
-  */
--static inline __uint32_t
-+static inline uint32_t
- bstat_projid(struct bstat *bs)
- {
--        return (__uint32_t)bs->bs_projid_hi << 16 | bs->bs_projid_lo;
-+        return (uint32_t)bs->bs_projid_hi << 16 | bs->bs_projid_lo;
- }
- 
- 
-diff --git a/doc/xfsdump.html b/doc/xfsdump.html
-index 9c6722e..f85128f 100644
---- a/doc/xfsdump.html
-+++ b/doc/xfsdump.html
-@@ -1935,7 +1935,7 @@ The files are constructed like so:
- <pre>
- typedef struct invt_counter {
-     INVT_COUNTER_FIELDS
--        __uint32_t    ic_vernum;/* on disk version number for posterity */\
-+        uint32_t    ic_vernum;/* on disk version number for posterity */\
-         u_int         ic_curnum;/* number of sessions/invindices recorded \
-                                    so far */                              \
-         u_int         ic_maxnum;/* maximum number of sessions/inv_indices \
-@@ -1975,7 +1975,7 @@ typedef struct invt_fstab {
- <pre>
- typedef struct invt_counter {
-     INVT_COUNTER_FIELDS
--        __uint32_t    ic_vernum;/* on disk version number for posterity */\
-+        uint32_t    ic_vernum;/* on disk version number for posterity */\
-         u_int         ic_curnum;/* number of sessions/invindices recorded \
-                                    so far */                              \
-         u_int         ic_maxnum;/* maximum number of sessions/inv_indices \
-@@ -2012,7 +2012,7 @@ typedef struct invt_entry {
- <pre>
- typedef struct invt_sescounter {
-     INVT_COUNTER_FIELDS
--        __uint32_t    ic_vernum;/* on disk version number for posterity */\
-+        uint32_t    ic_vernum;/* on disk version number for posterity */\
-         u_int         ic_curnum;/* number of sessions/invindices recorded \
-                                    so far */                              \
-         u_int         ic_maxnum;/* maximum number of sessions/inv_indices \
-@@ -2034,7 +2034,7 @@ typedef struct invt_seshdr {
-     off64_t    sh_streams_off; /* offset to start of the set of
-                                   stream hdrs */
-     time_t     sh_time;        /* time of the dump */
--    __uint32_t sh_flag;        /* for misc flags */
-+    uint32_t sh_flag;        /* for misc flags */
-     u_char     sh_level;       /* dump level */
-     u_char     sh_pruned;      /* pruned by invutil flag */
-     char       sh_padding[22];
-diff --git a/inventory/inv_oref.h b/inventory/inv_oref.h
-index e16684d..38303a4 100644
---- a/inventory/inv_oref.h
-+++ b/inventory/inv_oref.h
-@@ -46,7 +46,7 @@
- 
- 
- 
--typedef __uint32_t	invt_objtype_t;
-+typedef uint32_t	invt_objtype_t;
- 
- #define INVT_LOCKED		0x0001
- 
-diff --git a/inventory/inv_priv.h b/inventory/inv_priv.h
-index 1690271..364ffbc 100644
---- a/inventory/inv_priv.h
-+++ b/inventory/inv_priv.h
-@@ -120,7 +120,7 @@ typedef struct invt_seshdr {
- 	off64_t		sh_streams_off; /* offset to start of the set of 
- 					   stream hdrs */
- 	time32_t	sh_time;        /* time of the dump */
--	__uint32_t	sh_flag;        /* for misc flags */
-+	uint32_t	sh_flag;        /* for misc flags */
- 	u_char		sh_level;       /* dump level */
- 	u_char		sh_pruned;      /* pruned by invutil flag */
- 	char		sh_padding[22];
-@@ -184,7 +184,7 @@ typedef struct invt_entry {
- 
- /* Cheap Inheritance, and an attempt to avoid a nested type */
- #define INVT_COUNTER_FIELDS  \
--        __uint32_t    ic_vernum;/* on disk version number for posterity */\
-+        uint32_t    ic_vernum;/* on disk version number for posterity */\
- 	uint	      ic_curnum;/* number of sessions/invindices recorded \
- 				   so far */				  \
- 	uint	      ic_maxnum;/* maximum number of sessions/inv_indices \
-diff --git a/inventory/inventory.h b/inventory/inventory.h
-index 134b9ba..c1d7403 100644
---- a/inventory/inventory.h
-+++ b/inventory/inventory.h
-@@ -43,7 +43,7 @@
- /* length of labels, mntpts, etc */
- #define INV_STRLEN              GLOBAL_HDR_STRING_SZ
- 
--typedef __uint32_t		inv_version_t;
-+typedef uint32_t		inv_version_t;
- 
- /* This is the general inventory version. 
-  */
--- 
-2.13.2
-
diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0003-replace-use-of-SIGCLD-with-SIGCHLD.patch b/meta-filesystems/recipes-utils/xfsdump/files/0003-replace-use-of-SIGCLD-with-SIGCHLD.patch
deleted file mode 100644
index 31303d8..0000000
--- a/meta-filesystems/recipes-utils/xfsdump/files/0003-replace-use-of-SIGCLD-with-SIGCHLD.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From fcc0cf15a309947103a0695b8a1f4865b820eb5c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 23:26:03 -0700
-Subject: [PATCH 3/5] replace use of SIGCLD with SIGCHLD
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- common/main.c    | 2 +-
- doc/xfsdump.html | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/common/main.c b/common/main.c
-index 3848499..faa66ee 100644
---- a/common/main.c
-+++ b/common/main.c
-@@ -2225,7 +2225,7 @@ static sig_printmap_t sig_printmap[ ] = {
- 	{SIGTERM,	"SIGTERM"},
- 	{SIGUSR1,	"SIGUSR1"},
- 	{SIGUSR2,	"SIGUSR2"},
--	{SIGCLD,	"SIGCLD"},
-+	{SIGCHLD,	"SIGCHLD"},
- 	{SIGPWR,	"SIGPWR"},
- 	{SIGURG,	"SIGURG"},
- 	{SIGPOLL,	"SIGPOLL"},
-diff --git a/doc/xfsdump.html b/doc/xfsdump.html
-index f85128f..d96f037 100644
---- a/doc/xfsdump.html
-+++ b/doc/xfsdump.html
-@@ -334,7 +334,7 @@ the ring buffer. It ignores signals and does not terminate until it
- receives a RING_OP_DIE message. It then exits 0.
- <p>
- The main process sleeps waiting for any of its children to die
--(ie. waiting for a SIGCLD). All children that it cares about (stream
-+(ie. waiting for a SIGCHLD). All children that it cares about (stream
- managers and ring buffer slaves) are registered through the child
- manager abstraction. When a child dies wait status and other info is
- stored with its entry in the child manager. main() ignores the deaths
--- 
-2.13.2
-
diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0004-include-limit.h-for-PATH_MAX.patch b/meta-filesystems/recipes-utils/xfsdump/files/0004-include-limit.h-for-PATH_MAX.patch
deleted file mode 100644
index 62ea15b..0000000
--- a/meta-filesystems/recipes-utils/xfsdump/files/0004-include-limit.h-for-PATH_MAX.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 98c7d96f0f2c6eddf60aa4a1a08d7d4467645930 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 23:28:10 -0700
-Subject: [PATCH 4/5] include limit.h for PATH_MAX
-
-fixed
-var.c:42:12: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'RAND_MAX'?
-  char path[PATH_MAX];`
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- dump/var.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/dump/var.c b/dump/var.c
-index 645caab..8156d37 100644
---- a/dump/var.c
-+++ b/dump/var.c
-@@ -16,6 +16,7 @@
-  * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-  */
- 
-+#include <limits.h>
- #include <unistd.h>
- #include <stdlib.h>
- #include <sys/stat.h>
--- 
-2.13.2
-
diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0005-include-sys-types.h-for-u_int32_t-in-attr-attributes.patch b/meta-filesystems/recipes-utils/xfsdump/files/0005-include-sys-types.h-for-u_int32_t-in-attr-attributes.patch
deleted file mode 100644
index fb6e467..0000000
--- a/meta-filesystems/recipes-utils/xfsdump/files/0005-include-sys-types.h-for-u_int32_t-in-attr-attributes.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d95f494de1aa8123c74170ffebaed8ea89649da2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 23:33:44 -0700
-Subject: [PATCH 5/5] include sys/types.h for u_int32_t in attr/attributes.h
-
-error: unknown type name 'u_int32_t'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- restore/content.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/restore/content.c b/restore/content.c
-index 7c4a81f..1d5de1b 100644
---- a/restore/content.c
-+++ b/restore/content.c
-@@ -24,6 +24,7 @@
- #include <sys/param.h>
- #include <sys/stat.h>
- #include <sys/ioctl.h>
-+#include <sys/types.h>
- #include <attr/attributes.h>
- #include <xfs/handle.h>
- #include <time.h>
--- 
-2.13.2
-
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.7.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
similarity index 69%
rename from meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.7.bb
rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
index 39f1189..54ab30c 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.7.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.8.bb
@@ -12,15 +12,9 @@ DEPENDS = "xfsprogs attr"
 
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://remove-install-as-user.patch \
-           file://0001-Include-fcntl.h-for-O_EXCL.patch \
-           file://0002-Replace-__uint32_t-with-uint32_t.patch \
-           file://0003-replace-use-of-SIGCLD-with-SIGCHLD.patch \
-           file://0004-include-limit.h-for-PATH_MAX.patch \
-           file://0005-include-sys-types.h-for-u_int32_t-in-attr-attributes.patch \
-           file://0001-xfsdump-Use-c99-defined-int64_t-instead-of-__int64_t.patch \
            "
-SRC_URI[md5sum] = "c6e91f2ac8b76c796db2d236f5ca5947"
-SRC_URI[sha256sum] = "99e6d4df257ebc6d29ca9e970ca20672c2ea03481ad949bc68f98de3e4d56dce"
+SRC_URI[md5sum] = "84d3bc287b4a2bb5d16b2320a47049a7"
+SRC_URI[sha256sum] = "ed14e67ae5b273c2698e767b43a46f033d361e540fe13feaaf9b110ee0edc585"
 
 inherit autotools-brokensep
 
-- 
2.7.4



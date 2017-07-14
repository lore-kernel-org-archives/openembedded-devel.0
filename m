Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id E0C7778225
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:35:08 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id t186so49585343pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 11:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RaEHEEaKdSkfHOf5safLGa24f6oHS1ZbOhQXV7mmoro=;
	b=FSo9EHzeo1PZpU+KN45JHgEKJ5uPziplRJunaptDueNyL9uOLoa2dsIoudQFwsDTTO
	Cc6b1k8nLkQq1m0RAIgny+VCarSa7ASsFUUExWCDHdlLC62+EnmsHZLz0tno9FTvJhxN
	Dn7OqcuifBvLHWBt3qhGKau7QhrVaE8MxzrcfQG7Ig1SkahODcpz5sVH4fCbniVVL1no
	2fqVt3SnFaqxZgDbMupUBgjkcE3gCm/DTezpOPyyvsVyOPos0E+Xdoz9EUDTrrn/f0CO
	hhb05OD58kFbXhs8U/5b6/UNFX+PQNfgnQb0ooqIJCTqsayAnFF0uI524n2V/eavPk+Y
	gv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RaEHEEaKdSkfHOf5safLGa24f6oHS1ZbOhQXV7mmoro=;
	b=dRg3MxftrjCWoDpAI2yUt3dIQVJXRqqWMzzCChQIL0Dc2p9dMJ8KZFZEB7ZmNAZc4H
	rd88pNCV5INxzVZBpJxI/EEGAjuXiMyJeCWX5njbIng+nQg5jAYyCveEwE7udEtl0nPA
	Y3gj+qHZXMGlF+5Ons+lS4i6nqRU25Sdl/hfz0hfggFv5lVg+3hhACqKdBgiQoPQpUe3
	F7bkB5gr7ronL4ZhH2JHvXHv2eqb0TWcGhUH4wK8oaahz65WSPUvBWGQrm05N37SW2Eg
	9c27FGwVZgotjMi1l+itJxmC/CGuncRRmDFCZOzMT7SMWLfzzwFKUuRs5zQkyw7ziC2M
	r4xA==
X-Gm-Message-State: AIVw110hcEQjqHTz0KTJAuTVGY8h/FFk8bSwSlrpWE3TSJnX0uv7bgIX
	ph3yvUaGS3zIFYzs
X-Received: by 10.98.73.65 with SMTP id w62mr6667566pfa.61.1500057309343;
	Fri, 14 Jul 2017 11:35:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	70sm18639581pft.104.2017.07.14.11.35.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 11:35:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 11:34:52 -0700
Message-Id: <20170714183456.22548-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170714183456.22548-1-raj.khem@gmail.com>
References: <20170714183456.22548-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 2/6] xfsdump: Fix build with musl
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
X-List-Received-Date: Fri, 14 Jul 2017 18:35:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Include-fcntl.h-for-O_EXCL.patch    |  28 +++++
 .../0002-Replace-__uint32_t-with-uint32_t.patch    | 122 +++++++++++++++++++++
 .../0003-replace-use-of-SIGCLD-with-SIGCHLD.patch  |  40 +++++++
 .../files/0004-include-limit.h-for-PATH_MAX.patch  |  29 +++++
 ...-types.h-for-u_int32_t-in-attr-attributes.patch |  27 +++++
 .../recipes-utils/xfsdump/xfsdump_3.1.6.bb         |   9 +-
 6 files changed, 253 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0001-Include-fcntl.h-for-O_EXCL.patch
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0002-Replace-__uint32_t-with-uint32_t.patch
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0003-replace-use-of-SIGCLD-with-SIGCHLD.patch
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0004-include-limit.h-for-PATH_MAX.patch
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0005-include-sys-types.h-for-u_int32_t-in-attr-attributes.patch

diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0001-Include-fcntl.h-for-O_EXCL.patch b/meta-filesystems/recipes-utils/xfsdump/files/0001-Include-fcntl.h-for-O_EXCL.patch
new file mode 100644
index 000000000..660468d73
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/files/0001-Include-fcntl.h-for-O_EXCL.patch
@@ -0,0 +1,28 @@
+From 8cf48da5f645dd7bbb1ccbeab5bb0964f40f17f7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 23:18:47 -0700
+Subject: [PATCH 1/5] Include fcntl.h for O_EXCL
+
+Fix
+error: 'O_CREAT' undeclared (first use in this function)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ invutil/invidx.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/invutil/invidx.c b/invutil/invidx.c
+index 67efdf7..325a9a1 100644
+--- a/invutil/invidx.c
++++ b/invutil/invidx.c
+@@ -27,6 +27,7 @@
+ #include <sys/stat.h>
+ #include <string.h>
+ #include <uuid/uuid.h>
++#include <fcntl.h>
+ 
+ #include "types.h"
+ #include "mlog.h"
+-- 
+2.13.2
+
diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0002-Replace-__uint32_t-with-uint32_t.patch b/meta-filesystems/recipes-utils/xfsdump/files/0002-Replace-__uint32_t-with-uint32_t.patch
new file mode 100644
index 000000000..ed3e0a9e9
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/files/0002-Replace-__uint32_t-with-uint32_t.patch
@@ -0,0 +1,122 @@
+From f76d2142905f0e5bd830d5d576c235af1171c6ac Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 23:23:31 -0700
+Subject: [PATCH 2/5] Replace __uint32_t with uint32_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ common/content_inode.h | 4 ++--
+ doc/xfsdump.html       | 8 ++++----
+ inventory/inv_oref.h   | 2 +-
+ inventory/inv_priv.h   | 4 ++--
+ inventory/inventory.h  | 2 +-
+ 5 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/common/content_inode.h b/common/content_inode.h
+index a69a9a0..6936e05 100644
+--- a/common/content_inode.h
++++ b/common/content_inode.h
+@@ -191,10 +191,10 @@ typedef struct bstat bstat_t;
+  * and using two 16bit values to hold new 32bit projid was choosen
+  * to retain compatibility with "old" filesystems).
+  */
+-static inline __uint32_t
++static inline uint32_t
+ bstat_projid(struct bstat *bs)
+ {
+-        return (__uint32_t)bs->bs_projid_hi << 16 | bs->bs_projid_lo;
++        return (uint32_t)bs->bs_projid_hi << 16 | bs->bs_projid_lo;
+ }
+ 
+ 
+diff --git a/doc/xfsdump.html b/doc/xfsdump.html
+index 9c6722e..f85128f 100644
+--- a/doc/xfsdump.html
++++ b/doc/xfsdump.html
+@@ -1935,7 +1935,7 @@ The files are constructed like so:
+ <pre>
+ typedef struct invt_counter {
+     INVT_COUNTER_FIELDS
+-        __uint32_t    ic_vernum;/* on disk version number for posterity */\
++        uint32_t    ic_vernum;/* on disk version number for posterity */\
+         u_int         ic_curnum;/* number of sessions/invindices recorded \
+                                    so far */                              \
+         u_int         ic_maxnum;/* maximum number of sessions/inv_indices \
+@@ -1975,7 +1975,7 @@ typedef struct invt_fstab {
+ <pre>
+ typedef struct invt_counter {
+     INVT_COUNTER_FIELDS
+-        __uint32_t    ic_vernum;/* on disk version number for posterity */\
++        uint32_t    ic_vernum;/* on disk version number for posterity */\
+         u_int         ic_curnum;/* number of sessions/invindices recorded \
+                                    so far */                              \
+         u_int         ic_maxnum;/* maximum number of sessions/inv_indices \
+@@ -2012,7 +2012,7 @@ typedef struct invt_entry {
+ <pre>
+ typedef struct invt_sescounter {
+     INVT_COUNTER_FIELDS
+-        __uint32_t    ic_vernum;/* on disk version number for posterity */\
++        uint32_t    ic_vernum;/* on disk version number for posterity */\
+         u_int         ic_curnum;/* number of sessions/invindices recorded \
+                                    so far */                              \
+         u_int         ic_maxnum;/* maximum number of sessions/inv_indices \
+@@ -2034,7 +2034,7 @@ typedef struct invt_seshdr {
+     off64_t    sh_streams_off; /* offset to start of the set of
+                                   stream hdrs */
+     time_t     sh_time;        /* time of the dump */
+-    __uint32_t sh_flag;        /* for misc flags */
++    uint32_t sh_flag;        /* for misc flags */
+     u_char     sh_level;       /* dump level */
+     u_char     sh_pruned;      /* pruned by invutil flag */
+     char       sh_padding[22];
+diff --git a/inventory/inv_oref.h b/inventory/inv_oref.h
+index e16684d..38303a4 100644
+--- a/inventory/inv_oref.h
++++ b/inventory/inv_oref.h
+@@ -46,7 +46,7 @@
+ 
+ 
+ 
+-typedef __uint32_t	invt_objtype_t;
++typedef uint32_t	invt_objtype_t;
+ 
+ #define INVT_LOCKED		0x0001
+ 
+diff --git a/inventory/inv_priv.h b/inventory/inv_priv.h
+index 1690271..364ffbc 100644
+--- a/inventory/inv_priv.h
++++ b/inventory/inv_priv.h
+@@ -120,7 +120,7 @@ typedef struct invt_seshdr {
+ 	off64_t		sh_streams_off; /* offset to start of the set of 
+ 					   stream hdrs */
+ 	time32_t	sh_time;        /* time of the dump */
+-	__uint32_t	sh_flag;        /* for misc flags */
++	uint32_t	sh_flag;        /* for misc flags */
+ 	u_char		sh_level;       /* dump level */
+ 	u_char		sh_pruned;      /* pruned by invutil flag */
+ 	char		sh_padding[22];
+@@ -184,7 +184,7 @@ typedef struct invt_entry {
+ 
+ /* Cheap Inheritance, and an attempt to avoid a nested type */
+ #define INVT_COUNTER_FIELDS  \
+-        __uint32_t    ic_vernum;/* on disk version number for posterity */\
++        uint32_t    ic_vernum;/* on disk version number for posterity */\
+ 	uint	      ic_curnum;/* number of sessions/invindices recorded \
+ 				   so far */				  \
+ 	uint	      ic_maxnum;/* maximum number of sessions/inv_indices \
+diff --git a/inventory/inventory.h b/inventory/inventory.h
+index 134b9ba..c1d7403 100644
+--- a/inventory/inventory.h
++++ b/inventory/inventory.h
+@@ -43,7 +43,7 @@
+ /* length of labels, mntpts, etc */
+ #define INV_STRLEN              GLOBAL_HDR_STRING_SZ
+ 
+-typedef __uint32_t		inv_version_t;
++typedef uint32_t		inv_version_t;
+ 
+ /* This is the general inventory version. 
+  */
+-- 
+2.13.2
+
diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0003-replace-use-of-SIGCLD-with-SIGCHLD.patch b/meta-filesystems/recipes-utils/xfsdump/files/0003-replace-use-of-SIGCLD-with-SIGCHLD.patch
new file mode 100644
index 000000000..31303d8fa
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/files/0003-replace-use-of-SIGCLD-with-SIGCHLD.patch
@@ -0,0 +1,40 @@
+From fcc0cf15a309947103a0695b8a1f4865b820eb5c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 23:26:03 -0700
+Subject: [PATCH 3/5] replace use of SIGCLD with SIGCHLD
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ common/main.c    | 2 +-
+ doc/xfsdump.html | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/common/main.c b/common/main.c
+index 3848499..faa66ee 100644
+--- a/common/main.c
++++ b/common/main.c
+@@ -2225,7 +2225,7 @@ static sig_printmap_t sig_printmap[ ] = {
+ 	{SIGTERM,	"SIGTERM"},
+ 	{SIGUSR1,	"SIGUSR1"},
+ 	{SIGUSR2,	"SIGUSR2"},
+-	{SIGCLD,	"SIGCLD"},
++	{SIGCHLD,	"SIGCHLD"},
+ 	{SIGPWR,	"SIGPWR"},
+ 	{SIGURG,	"SIGURG"},
+ 	{SIGPOLL,	"SIGPOLL"},
+diff --git a/doc/xfsdump.html b/doc/xfsdump.html
+index f85128f..d96f037 100644
+--- a/doc/xfsdump.html
++++ b/doc/xfsdump.html
+@@ -334,7 +334,7 @@ the ring buffer. It ignores signals and does not terminate until it
+ receives a RING_OP_DIE message. It then exits 0.
+ <p>
+ The main process sleeps waiting for any of its children to die
+-(ie. waiting for a SIGCLD). All children that it cares about (stream
++(ie. waiting for a SIGCHLD). All children that it cares about (stream
+ managers and ring buffer slaves) are registered through the child
+ manager abstraction. When a child dies wait status and other info is
+ stored with its entry in the child manager. main() ignores the deaths
+-- 
+2.13.2
+
diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0004-include-limit.h-for-PATH_MAX.patch b/meta-filesystems/recipes-utils/xfsdump/files/0004-include-limit.h-for-PATH_MAX.patch
new file mode 100644
index 000000000..62ea15b86
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/files/0004-include-limit.h-for-PATH_MAX.patch
@@ -0,0 +1,29 @@
+From 98c7d96f0f2c6eddf60aa4a1a08d7d4467645930 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 23:28:10 -0700
+Subject: [PATCH 4/5] include limit.h for PATH_MAX
+
+fixed
+var.c:42:12: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'RAND_MAX'?
+  char path[PATH_MAX];`
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dump/var.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dump/var.c b/dump/var.c
+index 645caab..8156d37 100644
+--- a/dump/var.c
++++ b/dump/var.c
+@@ -16,6 +16,7 @@
+  * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+  */
+ 
++#include <limits.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <sys/stat.h>
+-- 
+2.13.2
+
diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0005-include-sys-types.h-for-u_int32_t-in-attr-attributes.patch b/meta-filesystems/recipes-utils/xfsdump/files/0005-include-sys-types.h-for-u_int32_t-in-attr-attributes.patch
new file mode 100644
index 000000000..fb6e467c9
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/files/0005-include-sys-types.h-for-u_int32_t-in-attr-attributes.patch
@@ -0,0 +1,27 @@
+From d95f494de1aa8123c74170ffebaed8ea89649da2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 23:33:44 -0700
+Subject: [PATCH 5/5] include sys/types.h for u_int32_t in attr/attributes.h
+
+error: unknown type name 'u_int32_t'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ restore/content.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/restore/content.c b/restore/content.c
+index 7c4a81f..1d5de1b 100644
+--- a/restore/content.c
++++ b/restore/content.c
+@@ -24,6 +24,7 @@
+ #include <sys/param.h>
+ #include <sys/stat.h>
+ #include <sys/ioctl.h>
++#include <sys/types.h>
+ #include <attr/attributes.h>
+ #include <xfs/handle.h>
+ #include <time.h>
+-- 
+2.13.2
+
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
index ecc746829..d1033cff1 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
@@ -11,8 +11,13 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=15c832894d10ddd00dfcf57bee490ecc"
 DEPENDS = "xfsprogs attr"
 
 SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz \
-    file://remove-install-as-user.patch \
-"
+           file://remove-install-as-user.patch \
+           file://0001-Include-fcntl.h-for-O_EXCL.patch \
+           file://0002-Replace-__uint32_t-with-uint32_t.patch \
+           file://0003-replace-use-of-SIGCLD-with-SIGCHLD.patch \
+           file://0004-include-limit.h-for-PATH_MAX.patch \
+           file://0005-include-sys-types.h-for-u_int32_t-in-attr-attributes.patch \
+           "
 SRC_URI[md5sum] = "50353cd4f4b435685955363e6044f4d1"
 SRC_URI[sha256sum] = "7f78c11ca527477d90e5e62b0778f3ad96f2b71c19173044e9aca9515fff42d0"
 
-- 
2.13.3



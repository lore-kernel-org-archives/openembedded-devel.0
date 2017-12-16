Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id CCDF8786F4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Dec 2017 01:15:53 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id ED2962804D6; Fri, 15 Dec 2017 17:18:26 -0800 (PST)
Date: Fri, 15 Dec 2017 17:18:26 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20171216011826.GO27580@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-networking] [PATCH] cifs-utils: mount.cifs should build without samba dependency
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
X-List-Received-Date: Sat, 16 Dec 2017 01:15:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

fix following build error when cifsidmap and cifsacl are turned off
in PACKAGECONFIG :

| In file included from ../git/mount.cifs.c:64:0:
| ../git/data_blob.h:26:10: fatal error: talloc.h: No such file or directory

cifs-utils 3.7 had an unneeded header creep into mount.cifs source
that pulled in samba headers. This has been cleaned up already
in cifs-utils master, so apply (trivial) upstream patch to fix this
compile error.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 .../recipes-support/cifs/cifs-utils_git.bb         |  4 ++-
 ...001-mount.cifs-Remove-data_blob.h-include.patch | 32 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/cifs/files/0001-mount.cifs-Remove-data_blob.h-include.patch

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index 3ca5b78..198e3ef 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 PV = "6.7"
 
 SRCREV = "8101a07871f185c7044fa2ca221b282ab4607c8b"
-SRC_URI = "git://git.samba.org/cifs-utils.git"
+SRC_URI = "git://git.samba.org/cifs-utils.git \
+           file://0001-mount.cifs-Remove-data_blob.h-include.patch \
+          "
 
 S = "${WORKDIR}/git"
 DEPENDS += "libtalloc"
diff --git a/meta-networking/recipes-support/cifs/files/0001-mount.cifs-Remove-data_blob.h-include.patch b/meta-networking/recipes-support/cifs/files/0001-mount.cifs-Remove-data_blob.h-include.patch
new file mode 100644
index 0000000..07f2a57
--- /dev/null
+++ b/meta-networking/recipes-support/cifs/files/0001-mount.cifs-Remove-data_blob.h-include.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Backport
+Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
+
+From 272d523a57a4e8791d625a479128613be5e401f5 Mon Sep 17 00:00:00 2001
+From: Thomas Witt <pyromaniac@exherbo.org>
+Date: Wed, 15 Mar 2017 20:20:44 +0000
+Subject: [PATCH] mount.cifs: Remove data_blob.h include
+
+data_blob.h includes talloc.h from libtalloc, but that is only marked as
+a dependency for cifs.upcall. No symbols from that header are used by
+cifs.mount, so remove it to avoid the libtalloc dependency
+
+Signed-off-by: Thomas Witt <pyromaniac@exherbo.org>
+---
+ mount.cifs.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/mount.cifs.c b/mount.cifs.c
+index 13b71ef..2612feb 100644
+--- a/mount.cifs.c
++++ b/mount.cifs.c
+@@ -61,7 +61,6 @@
+ #include "mount.h"
+ #include "util.h"
+ #include "resolve_host.h"
+-#include "data_blob.h"
+ 
+ #ifndef MS_MOVE 
+ #define MS_MOVE 8192 
+-- 
+1.9.4
+
-- 
1.9.4



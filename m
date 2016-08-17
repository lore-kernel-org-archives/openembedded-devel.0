Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B98F6FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 20:22:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7HKMFVD002612
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:22:15 -0700
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Aug 2016 13:22:14 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Aug 2016 13:22:14 -0700
Message-ID: <1471465334-32622-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] yp-tools: fix compile errors
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
X-List-Received-Date: Wed, 17 Aug 2016 20:22:15 -0000
Content-Type: text/plain

Fix two fatal warnings.  The cast error only
occurs for some architectures.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../nis/yp-tools/alignment-cheat.patch             |   58 ++++++++++++++++++++
 .../recipes-support/nis/yp-tools_3.3.bb            |    3 +-
 2 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch

diff --git a/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch b/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch
new file mode 100644
index 0000000..856e42e
--- /dev/null
+++ b/meta-networking/recipes-support/nis/yp-tools/alignment-cheat.patch
@@ -0,0 +1,58 @@
+yp-tools: avoid fatal cast warning
+
+The way casting is done, we will get a fatal alignment warning on some
+architectures.  This patch cheats our way around this.
+
+We also eliminate an unused constant which causes a fatal warning.
+
+Upstream-status: Pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+
+--- a/lib/do_ypcall.c
++++ b/lib/do_ypcall.c
+@@ -44,7 +44,9 @@ struct dom_binding
+ typedef struct dom_binding dom_binding;
+ 
+ static const struct timeval RPCTIMEOUT = {25, 0};
++#if 0
+ static const struct timeval UDPTIMEOUT = {5, 0};
++#endif
+ static int const MAXTRIES = 2;
+ static pthread_mutex_t ypbindlist_lock = PTHREAD_MUTEX_INITIALIZER;
+ static dom_binding *ypbindlist = NULL;
+@@ -381,7 +383,7 @@ __ypclnt_call (u_long prog, xdrproc_t xa
+ 
+ int
+ do_ypcall (const char *domain, u_long prog, xdrproc_t xargs,
+-	   caddr_t req, xdrproc_t xres, caddr_t resp)
++	   caddr_t req, xdrproc_t xres, void *resp)
+ {
+   dom_binding *ydb;
+   int status;
+@@ -450,9 +452,9 @@ do_ypcall (const char *domain, u_long pr
+ /* Like do_ypcall, but translate the status value if necessary.  */
+ int
+ do_ypcall_tr (const char *domain, u_long prog, xdrproc_t xargs,
+-	      caddr_t req, xdrproc_t xres, caddr_t resp)
++	      caddr_t req, xdrproc_t xres, void *resp)
+ {
+-  int status = do_ypcall (domain, prog, xargs, req, xres, resp);
++  int status = do_ypcall (domain, prog, xargs, req, xres, (void *) resp);
+   if (status == YPERR_SUCCESS)
+     /* We cast to ypresp_val although the pointer could also be of
+        type ypresp_key_val or ypresp_master or ypresp_order or
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -17,8 +17,8 @@
+ #define _INTERNAL_H_
+ 
+ extern int do_ypcall (const char *domain, u_long prog, xdrproc_t xargs,
+-		      caddr_t req, xdrproc_t xres, caddr_t resp);
++		      caddr_t req, xdrproc_t xres, void *resp);
+ extern int do_ypcall_tr (const char *domain, u_long prog, xdrproc_t xargs,
+-			 caddr_t req, xdrproc_t xres, caddr_t resp);
++			 caddr_t req, xdrproc_t xres, void *resp);
+ extern int yp_maplist (const char *, struct ypmaplist **);
+ #endif
diff --git a/meta-networking/recipes-support/nis/yp-tools_3.3.bb b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
index b89f0b8..69217fa 100644
--- a/meta-networking/recipes-support/nis/yp-tools_3.3.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_3.3.bb
@@ -11,11 +11,10 @@ ypwhich, yppasswd, domainname, nisdomainname \
 and ypdomainname. \
 "
 
-PNBLACKLIST[yp-tools] ?= "BROKEN: fails to build for qemuarm."
-
 SRC_URI = "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
            file://domainname.service \
            file://yp-tools-ipv4-ipv6-Provide-an-in-place-version-of-mapv4v6addr.patch \
+           file://alignment-cheat.patch \
 "
 SRC_URI[md5sum] = "acebeecc11a73fb8097503670344834c"
 SRC_URI[sha256sum] = "812be817df3d4c25813552be336c6c6ad5aedaf65611b81af3ad9f98fb3c2e50"
-- 
1.7.9.5



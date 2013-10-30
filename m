Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E21896D478
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 18:45:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9UIjhZ3007203
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2013 11:45:43 -0700 (PDT)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 30 Oct 2013 11:45:42 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe@deserted.net>
Date: Wed, 30 Oct 2013 14:45:54 -0400
Message-ID: <1383158754-446-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [meta-networking][PATCH v2] cyrus-sasl: ensure size_t is defined for use by sasl.h
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
X-List-Received-Date: Wed, 30 Oct 2013 18:45:45 -0000
Content-Type: text/plain

While making use of the cyrus-sasl library an external application
will most likely include sasl.h which will cause compilation failures
if steps haven't been taken to define size_t. This should not be the
responsibility of the application building against the sasl library
but rather handled already in sasl.h. Here we ensure sasl.h has the
proper includes to have size_t defined before it is used.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

v2 changes:
* using upstream patch. Posix I believe says to use sys/types.h
  but in any case stddef.h works fine.

* removed PR addition + bump

* added upstream status line

 ...l.h-include-stddef.h-for-size_t-on-NetBSD.patch | 31 ++++++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch
new file mode 100644
index 0000000..ecbab84
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch
@@ -0,0 +1,31 @@
+From 92d72789c811b0d55f624a8bac5ccc4412f5996e Mon Sep 17 00:00:00 2001
+From: Ken Murchison <murch@andrew.cmu.edu>
+Date: Thu, 20 Dec 2012 18:14:50 -0500
+Subject: [PATCH] sasl.h: #include <stddef.h> for size_t on NetBSD
+
+This patch was imported from git://git.cyrusimap.org/cyrus-sasl
+commit 67a188693796a14e3a76ac603104807fbbfddfc4
+
+Upstream-Status: Backport
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ include/sasl.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/sasl.h b/include/sasl.h
+index fef4d51..8b8a63f 100755
+--- a/include/sasl.h
++++ b/include/sasl.h
+@@ -121,6 +121,8 @@
+ #ifndef SASL_H
+ #define SASL_H 1
+ 
++#include <stddef.h>  /* For size_t */
++
+ /* Keep in sync with win32/common.mak */
+ #define SASL_VERSION_MAJOR 2
+ #define SASL_VERSION_MINOR 1
+-- 
+1.8.3.2
+
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index f05ab85..2abaee2 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -9,6 +9,7 @@ SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
 	   file://Fix-hardcoded-libdir.patch \
 	   file://debian_patches_0009_sasldb_al.diff \
 	   file://debian_patches_0014_avoid_pic_overwrite.diff \
+	   file://sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch \
 	   "
 
 inherit autotools pkgconfig useradd
-- 
1.8.3.2



Return-Path: <asselsm@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id D769B6AE37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 03:49:08 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id u18so493737qcx.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 20:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=dCPidsxjoX7qbwrFZJNJk8zKYOiszLUpYEEfTqmEv14=;
	b=jEIXph+7eMmt8WAYIWM9AXlOKwXLKy2HHXmjW3YrvvVYk/j0HeHjgsFCI6408PEsdN
	or7MqEZ2wI2TdOQUBGx95LnaI9Z3IrZTxXcAygN0c2GWQoEe8QoyQ/Ydpa3FttrWDWEM
	cIAFZAsZZNg3RD6RW27k4JCJzFQutAVlnw7FRQOBLWGFDRNDl3lHHM45WmPoUEQr1557
	hrdf2dJROAP6sjNoZ2rldNQFjv/OB/g7EYa3u3V/fQ7a385h6PIRX0p0rAmupeIzWweu
	SpXANDL1S/0s8H5TfkYDIOQq/BsEVwchlv9Y77oVJ0V3T3vNNvYsAri15NqTeO9TlF7j
	9/DA==
X-Received: by 10.49.61.9 with SMTP id l9mr3966190qer.64.1383104950529;
	Tue, 29 Oct 2013 20:49:10 -0700 (PDT)
Received: from localhost (198-84-204-234.cpe.teksavvy.com. [198.84.204.234])
	by mx.google.com with ESMTPSA id n7sm72932677qai.1.2013.10.29.20.49.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Oct 2013 20:49:10 -0700 (PDT)
From: Mark Asselstine <asselsm@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe@deserted.net
Date: Tue, 29 Oct 2013 23:50:36 -0400
Message-Id: <1383105036-21256-1-git-send-email-asselsm@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-networking][PATCH] cyrus-sasl: ensure size_t is defined for use by sasl.h
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
X-List-Received-Date: Wed, 30 Oct 2013 03:49:09 -0000

While making use of the cyrus-sasl library an external application
will most likely include sasl.h which will cause compilation failures
if steps haven't been taken to define size_t. This should not be the
responsibility of the application building against the sasl library
but rather handled already in sasl.h. Here we ensure sasl.h has the
proper includes to have size_t defined before it is used.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 ...clude-sasl.h-needs-to-include-sys-types.h.patch | 37 ++++++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |  3 ++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/include-sasl.h-needs-to-include-sys-types.h.patch

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/include-sasl.h-needs-to-include-sys-types.h.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/include-sasl.h-needs-to-include-sys-types.h.patch
new file mode 100644
index 0000000..ac47b4f
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/include-sasl.h-needs-to-include-sys-types.h.patch
@@ -0,0 +1,37 @@
+From 471b4436a69917fba7c44e366b0393cebc3dace6 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <asselsm@gmail.com>
+Date: Tue, 29 Oct 2013 23:07:26 -0400
+Subject: [PATCH] include: sasl.h needs to include sys/types.h
+
+size_t is used in sasl.h yet sys/types.h is neither included directly
+or indirectly. This causes build errors if you try to build something
+against the sasl library where .c files including sasl.h haven't
+included sys/types.h or defined size_t on their own. Similar to this
+one:
+
+In file included from rpc/virnetsaslcontext.h:24:0,
+                 from rpc/virnetsaslcontext.c:25:
+../poky/x86-64/tmp/sysroots/qemux86-64/usr/include/sasl/sasl.h:230:38: error: unknown type name 'size_t'
+ typedef void *sasl_realloc_t(void *, size_t);
+
+Signed-off-by: Mark Asselstine <asselsm@gmail.com>
+---
+ include/sasl.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/sasl.h b/include/sasl.h
+index fef4d51..36b2553 100755
+--- a/include/sasl.h
++++ b/include/sasl.h
+@@ -130,6 +130,8 @@
+ #define SASL_VERSION_FULL ((SASL_VERSION_MAJOR << 16) |\
+       (SASL_VERSION_MINOR << 8) | SASL_VERSION_STEP)
+ 
++#include <sys/types.h>
++
+ #include "prop.h"
+ 
+ /*************
+-- 
+1.8.1.2
+
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index f05ab85..5899291 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -4,11 +4,14 @@ DEPENDS = "openssl virtual/db"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
 
+PR = "r1"
+
 SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
 	   file://avoid-to-call-AC_TRY_RUN.patch \
 	   file://Fix-hardcoded-libdir.patch \
 	   file://debian_patches_0009_sasldb_al.diff \
 	   file://debian_patches_0014_avoid_pic_overwrite.diff \
+	   file://include-sasl.h-needs-to-include-sys-types.h.patch \
 	   "
 
 inherit autotools pkgconfig useradd
-- 
1.8.1.2



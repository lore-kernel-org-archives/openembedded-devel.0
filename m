Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4A3D78995
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 03:27:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P3RnQe000555
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:27:49 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 24 Jul 2018 20:27:48 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jul 2018 11:27:31 +0800
Message-ID: <1532489252-246963-10-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
References: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-networking] libtevent: upgrade 0.9.36 -> 0.9.37
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
X-List-Received-Date: Wed, 25 Jul 2018 03:27:48 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...001-libtevent-fix-musl-libc-compile-error.patch | 32 ++++++++++++++++++++++
 .../{libtevent_0.9.36.bb => libtevent_0.9.37.bb}   |  5 ++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/libtevent/libtevent/0001-libtevent-fix-musl-libc-compile-error.patch
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.36.bb => libtevent_0.9.37.bb} (88%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent/0001-libtevent-fix-musl-libc-compile-error.patch b/meta-networking/recipes-support/libtevent/libtevent/0001-libtevent-fix-musl-libc-compile-error.patch
new file mode 100644
index 0000000..e3aeda9
--- /dev/null
+++ b/meta-networking/recipes-support/libtevent/libtevent/0001-libtevent-fix-musl-libc-compile-error.patch
@@ -0,0 +1,32 @@
+From 7ba1de909c587b6773a39ba9f6f9890987f35b24 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 11:30:53 +0800
+Subject: [PATCH] libtevent: fix musl libc compile error
+
+libldb depend on libtevent,  build libldb with musl libc,
+will report error:
+tevent.h:1440:8: error: unknown type name 'pid_t'; did you mean 'div_t'?
+
+add missing headers to fix it.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tevent.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tevent.h b/tevent.h
+index aa6fe0d..2572696 100644
+--- a/tevent.h
++++ b/tevent.h
+@@ -32,6 +32,8 @@
+ #include <talloc.h>
+ #include <sys/time.h>
+ #include <stdbool.h>
++#include <sys/stat.h>
++#include <sys/types.h>
+ 
+ struct tevent_context;
+ struct tevent_ops;
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.37.bb
similarity index 88%
rename from meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.9.37.bb
index c91b221..ee8b7fd 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.37.bb
@@ -8,11 +8,12 @@ RDEPENDS_python-tevent = "python"
 
 SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
            file://options-0.9.36.patch \
+           file://0001-libtevent-fix-musl-libc-compile-error.patch \
 "
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b85a"
 
-SRC_URI[md5sum] = "87d67bca75b231814435c47bec0aff8a"
-SRC_URI[sha256sum] = "bd2b6be3fd1601ed7f176e99111e322c57d58e425cc149ee80c7dd4fed263b4c"
+SRC_URI[md5sum] = "6859cd4081fdb2a76b1cb4bf1c803a59"
+SRC_URI[sha256sum] = "168345ed65eac03785cf77b95238e7dc66cbb473a42811693a6b0916e5dae7e0"
 
 inherit waf-samba
 
-- 
2.7.4



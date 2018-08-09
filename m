Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 239B378E7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 05:17:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w795HAS4020535
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Aug 2018 22:17:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 8 Aug 2018 22:16:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Aug 2018 13:16:47 +0800
Message-ID: <1533791809-371521-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533791809-371521-1-git-send-email-changqing.li@windriver.com>
References: <1533791809-371521-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] oprofile: upgrade 1.2.0 -> 1.3.0
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
X-List-Received-Date: Thu, 09 Aug 2018 05:17:29 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile.inc       |  1 -
 .../0001-fix-musl-libc-compile-error.patch         | 30 ----------------------
 meta-oe/recipes-kernel/oprofile/oprofile_1.2.0.bb  | 10 --------
 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb  | 10 ++++++++
 4 files changed, 10 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0001-fix-musl-libc-compile-error.patch
 delete mode 100644 meta-oe/recipes-kernel/oprofile/oprofile_1.2.0.bb
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile.inc b/meta-oe/recipes-kernel/oprofile/oprofile.inc
index dabc30b..349e2bf 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile.inc
+++ b/meta-oe/recipes-kernel/oprofile/oprofile.inc
@@ -30,7 +30,6 @@ UPSTREAM_CHECK_REGEX = "oprofile-(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/oprofile/files/oprofile/"
 
 SRC_URI_append_libc-musl = " file://musl.patch \
-                             file://0001-fix-musl-libc-compile-error.patch \
 "
 
 inherit autotools pkgconfig ptest
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-fix-musl-libc-compile-error.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0001-fix-musl-libc-compile-error.patch
deleted file mode 100644
index c21a105..0000000
--- a/meta-oe/recipes-kernel/oprofile/oprofile/0001-fix-musl-libc-compile-error.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 512f1b3a4727a3a18f8fa55f196eedcacdd4a872 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 18 Jul 2018 13:01:03 +0800
-Subject: [PATCH] fix musl libc compile error
-
-use op_basename instead of basename to fix below error:
-../../oprofile-1.2.0/pp/oparchive.cpp:264:20: error: 'basename'
-was not declared in this scope
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- pp/oparchive.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pp/oparchive.cpp b/pp/oparchive.cpp
-index 6221e14..274152b 100644
---- a/pp/oparchive.cpp
-+++ b/pp/oparchive.cpp
-@@ -261,7 +261,7 @@ int oparchive(options::spec const & spec)
- 		/* determine the session name of sample file */
- 		int offset = sample_name.find('{');
- 		string base_samples_dir = sample_name.substr(0, offset-1);
--		string session = basename(base_samples_dir.c_str());
-+		string session = op_basename(base_samples_dir.c_str());
- 		/* Get rid of the the archive_path from the name */
- 		string sample_base = sample_name.substr(offset);
- 		string sample_archive_file = dest_samples_dir + "/" + session + "/" + sample_base;
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.2.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.2.0.bb
deleted file mode 100644
index e85e805..0000000
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.2.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require oprofile.inc
-
-DEPENDS += "virtual/kernel"
-DEPENDS_append_powerpc64 = " libpfm4"
-
-SRC_URI[md5sum] = "4fcd3920984dcb607314b2e225086c3a"
-SRC_URI[sha256sum] = "eb95f98c40b7d0ee29b45fba3565d9f8381747528aa6b6159e37d4fa0c8ca57d"
-
-S = "${WORKDIR}/oprofile-${PV}"
-
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
new file mode 100644
index 0000000..1dc535e
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
@@ -0,0 +1,10 @@
+require oprofile.inc
+
+DEPENDS += "virtual/kernel"
+DEPENDS_append_powerpc64 = " libpfm4"
+
+SRC_URI[md5sum] = "bd998df5521ebedae31e71cd3fb6200b"
+SRC_URI[sha256sum] = "95ded8bde1ec39922f0af015981a67aec63e025a501e4dc04cd65d38f73647e6"
+
+S = "${WORKDIR}/oprofile-${PV}"
+
-- 
2.7.4



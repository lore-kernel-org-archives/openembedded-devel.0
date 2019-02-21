Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDC457CB45
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 02:02:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1L22XRm021793
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 18:02:43 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 18:02:22 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Feb 2019 10:02:15 +0800
Message-ID: <1550714538-415016-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550714538-415016-1-git-send-email-changqing.li@windriver.com>
References: <1550714538-415016-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] smartmontools: upgrade 6.6 -> 7.0
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
X-List-Received-Date: Thu, 21 Feb 2019 02:02:52 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...p-Use-realpath-BSD-POSIX-instead-of-canon.patch | 28 ----------------------
 .../{smartmontools_6.6.bb => smartmontools_7.0.bb} |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/smartmontools/files/0001-os_linux.cpp-Use-realpath-BSD-POSIX-instead-of-canon.patch
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_6.6.bb => smartmontools_7.0.bb} (89%)

diff --git a/meta-oe/recipes-extended/smartmontools/files/0001-os_linux.cpp-Use-realpath-BSD-POSIX-instead-of-canon.patch b/meta-oe/recipes-extended/smartmontools/files/0001-os_linux.cpp-Use-realpath-BSD-POSIX-instead-of-canon.patch
deleted file mode 100644
index 91e64d2..0000000
--- a/meta-oe/recipes-extended/smartmontools/files/0001-os_linux.cpp-Use-realpath-BSD-POSIX-instead-of-canon.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f28aa188e5b0ea85369febe657b8807b8025038b Mon Sep 17 00:00:00 2001
-From: chrfranke <authors@smartmontools.org>
-Date: Wed, 8 Nov 2017 06:15:50 +0000
-Subject: [PATCH] os_linux.cpp: Use 'realpath()' (BSD, POSIX) instead of
- 'canonicalize_file_name()' (GNU extension). This fixes build on systems with
- musl libc (#921).
-
-git-svn-id: http://svn.code.sf.net/p/smartmontools/code/trunk@4603 4ea69e1a-61f1-4043-bf83-b5c94c648137
-
-Upstream-Status: Backport [https://www.smartmontools.org/ticket/921]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- os_linux.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/os_linux.cpp b/os_linux.cpp
-index 134d5bc..935f9c7 100644
---- a/os_linux.cpp
-+++ b/os_linux.cpp
-@@ -3176,7 +3176,7 @@ static bool is_hpsa(const char * name)
- {
-   char path[128];
-   snprintf(path, sizeof(path), "/sys/block/%s/device", name);
--  char * syshostpath = canonicalize_file_name(path);
-+  char * syshostpath = realpath(name, (char *)0);
-   if (!syshostpath)
-     return false;
- 
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.6.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_7.0.bb
similarity index 89%
rename from meta-oe/recipes-extended/smartmontools/smartmontools_6.6.bb
rename to meta-oe/recipes-extended/smartmontools/smartmontools_7.0.bb
index c77c105..d984566 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.6.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_7.0.bb
@@ -16,15 +16,14 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
            file://initd.smartd \
            file://smartmontools.default \
            file://smartd.service \
-           file://0001-os_linux.cpp-Use-realpath-BSD-POSIX-instead-of-canon.patch \
            "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'libcap-ng selinux', d)}"
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
-SRC_URI[md5sum] = "9ae2c6e7131cd2813edcc65cbe5f223f"
-SRC_URI[sha256sum] = "51f43d0fb064fccaf823bbe68cf0d317d0895ff895aa353b3339a3b316a53054"
+SRC_URI[md5sum] = "b2a80e4789af23d67dfe1e88a997abbf"
+SRC_URI[sha256sum] = "e5e1ac2786bc87fdbd6f92d0ee751b799fbb3e1a09c0a6a379f9eb64b3e8f61c"
 
 inherit autotools update-rc.d systemd
 
-- 
2.7.4



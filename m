Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4DD7C047
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:39:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI7dmMn016783
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 23:39:48 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:39:48 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Dec 2018 15:38:40 +0800
Message-ID: <908c1892a59d3cfa25d8fa4ca66a90958190b950.1545037250.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1545037250.git.hongxu.jia@windriver.com>
References: <cover.1545037250.git.hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 6/8] usermode: 1.112 -> 1.113
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
X-List-Received-Date: Tue, 18 Dec 2018 07:39:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Drop backported patches
- 0001-Missing-n-in-translated-string.patch
- 0001-Include-sys-sysmacros.h-for-major-minor.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...1-Include-sys-sysmacros.h-for-major-minor.patch | 25 -------------------
 .../0001-Missing-n-in-translated-string.patch      | 28 ----------------------
 .../{usermode_1.112.bb => usermode_1.113.bb}       |  6 ++---
 3 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-Include-sys-sysmacros.h-for-major-minor.patch
 delete mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-Missing-n-in-translated-string.patch
 rename meta-gnome/recipes-support/usermode/{usermode_1.112.bb => usermode_1.113.bb} (79%)

diff --git a/meta-gnome/recipes-support/usermode/usermode/0001-Include-sys-sysmacros.h-for-major-minor.patch b/meta-gnome/recipes-support/usermode/usermode/0001-Include-sys-sysmacros.h-for-major-minor.patch
deleted file mode 100644
index 277f6e2..0000000
--- a/meta-gnome/recipes-support/usermode/usermode/0001-Include-sys-sysmacros.h-for-major-minor.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 75539659396b18110d5a52a8a32845254b4d8eca Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Aug 2018 18:25:47 -0700
-Subject: [PATCH] Include sys/sysmacros.h for major/minor
-
-usermount.c:238: undefined reference to `major'
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- usermount.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/usermount.c b/usermount.c
-index 4107027..21ef77f 100644
---- a/usermount.c
-+++ b/usermount.c
-@@ -40,6 +40,7 @@
- #include <sys/stat.h>
- #include <sys/time.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <errno.h>
- #include <glob.h>
- #include <libintl.h>
diff --git a/meta-gnome/recipes-support/usermode/usermode/0001-Missing-n-in-translated-string.patch b/meta-gnome/recipes-support/usermode/usermode/0001-Missing-n-in-translated-string.patch
deleted file mode 100644
index 9db700e..0000000
--- a/meta-gnome/recipes-support/usermode/usermode/0001-Missing-n-in-translated-string.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 7cbc6441cd06e0c0bb51ac37c8f22b0fd51f12f2 Mon Sep 17 00:00:00 2001
-From: Jiri Kucera <jkucera@redhat.com>
-Date: Wed, 11 Apr 2018 17:13:44 +0200
-Subject: [PATCH] Missing \n in translated string
-
-Upstream-Status: Backport
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- po/tr.po | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/po/tr.po b/po/tr.po
-index 84e5021..a28e947 100644
---- a/po/tr.po
-+++ b/po/tr.po
-@@ -408,7 +408,7 @@ msgstr "Grafik pencere açılamadı ve uçbirim denetimi bulunamadı.\n"
- #: ../../po/../userpasswd.c:37
- #, c-format
- msgid "Unexpected command-line arguments\n"
--msgstr "Beklenmeyen komut satırı argümanları"
-+msgstr "Beklenmeyen komut satırı argümanları\n"
- 
- #: ../../po/../userinfo.c:411
- #, c-format
--- 
-2.7.4
-
diff --git a/meta-gnome/recipes-support/usermode/usermode_1.112.bb b/meta-gnome/recipes-support/usermode/usermode_1.113.bb
similarity index 79%
rename from meta-gnome/recipes-support/usermode/usermode_1.112.bb
rename to meta-gnome/recipes-support/usermode/usermode_1.113.bb
index 82ccf3e..0527836 100644
--- a/meta-gnome/recipes-support/usermode/usermode_1.112.bb
+++ b/meta-gnome/recipes-support/usermode/usermode_1.113.bb
@@ -16,11 +16,9 @@ DEPENDS = "libuser ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '',
 SRC_URI = "https://releases.pagure.org/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-fix-compile-failure-against-musl-C-library.patch \
            file://0001-Makefile.am-Link-with-libm-for-powl-API.patch \
-           file://0001-Missing-n-in-translated-string.patch \
-           file://0001-Include-sys-sysmacros.h-for-major-minor.patch \
            "
-SRC_URI[md5sum] = "a766a9f7600f573fb6de4655d4162196"
-SRC_URI[sha256sum] = "37c4d667209da14082c08df6e48fe955d1532efebd5322f13f94683c6cc10370"
+SRC_URI[md5sum] = "eadfbff18578b645096b6fa61854b41d"
+SRC_URI[sha256sum] = "99fbfd248b411ed0e7c44d1957b0ecde699b5a968a4db5d37228e82e7b1ba092"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-- 
2.7.4



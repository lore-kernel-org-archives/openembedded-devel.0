Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0D59C74852
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 09:50:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 02:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,400,1517904000"; d="scan'208";a="44486601"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.235])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2018 02:50:34 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Apr 2018 17:50:12 +0800
Message-Id: <1522749016-17637-2-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522749016-17637-1-git-send-email-anuj.mittal@intel.com>
References: <1522749016-17637-1-git-send-email-anuj.mittal@intel.com>
Subject: [meta-oe][PATCH 1/5] php: move patches to a single directory
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
X-List-Received-Date: Tue, 03 Apr 2018 09:50:34 -0000

Having two directories with version numbers just leads to unnecessary
churn everytime there's a version update.

We can have all patches in one single directory and differentiate b/w
specific version by prefix php5-/php7-

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         | 56 ----------------------
 .../0001-Add-lpthread-to-link.patch                |  0
 .../0001-Specify-tag-with-libtool.patch            |  0
 .../php/{php-7.1.9 => php}/CVE-2017-16642.patch    |  0
 .../php/{php-7.1.9 => php}/CVE-2018-5711.patch     |  0
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         |  0
 6 files changed, 56 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php-5.6.33/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
 rename meta-oe/recipes-devtools/php/{php-5.6.33 => php}/0001-Add-lpthread-to-link.patch (100%)
 rename meta-oe/recipes-devtools/php/{php-7.1.9 => php}/0001-Specify-tag-with-libtool.patch (100%)
 rename meta-oe/recipes-devtools/php/{php-7.1.9 => php}/CVE-2017-16642.patch (100%)
 rename meta-oe/recipes-devtools/php/{php-7.1.9 => php}/CVE-2018-5711.patch (100%)
 rename meta-oe/recipes-devtools/php/{php-7.1.9 => php}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)

diff --git a/meta-oe/recipes-devtools/php/php-5.6.33/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-5.6.33/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
deleted file mode 100644
index 39c334f..0000000
--- a/meta-oe/recipes-devtools/php/php-5.6.33/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-[PATCH] config.m4: change AC_TRY_RUN to AC_TRY_LINK
-
-Upstream-Status: Pending
-
-AC_TRY_RUN is not suitable for cross-compile
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- ext/fileinfo/config.m4 | 31 ++++++-------------------------
- 1 file changed, 6 insertions(+), 25 deletions(-)
-
-diff --git a/ext/fileinfo/config.m4 b/ext/fileinfo/config.m4
-index 7e98d62..8a8ea0e 100644
---- a/ext/fileinfo/config.m4
-+++ b/ext/fileinfo/config.m4
-@@ -14,31 +14,12 @@ if test "$PHP_FILEINFO" != "no"; then
-     libmagic/readcdf.c libmagic/softmagic.c"
- 
-   AC_MSG_CHECKING([for strcasestr])
--  AC_TRY_RUN([
--#include <string.h>
--#include <strings.h>
--#include <stdlib.h>
--
--int main(void)
--{
--        char *s0, *s1, *ret;
--
--        s0 = (char *) malloc(42);
--        s1 = (char *) malloc(8);
--
--        memset(s0, 'X', 42);
--        s0[24] = 'Y';
--        s0[26] = 'Z';
--        s0[41] = '\0';
--        memset(s1, 'x', 8);
--        s1[0] = 'y';
--        s1[2] = 'Z';
--        s1[7] = '\0';
--
--        ret = strcasestr(s0, s1);
--
--        return !(NULL != ret);
--}
-+  AC_TRY_COMPILE([
-+     #include <string.h>
-+     #include <strings.h>
-+     #include <stdlib.h>
-+  ],[
-+     strcasestr(NULL, NULL);
-   ],[
-     dnl using the platform implementation
-     AC_MSG_RESULT(yes)
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/php/php-5.6.33/0001-Add-lpthread-to-link.patch b/meta-oe/recipes-devtools/php/php/0001-Add-lpthread-to-link.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-5.6.33/0001-Add-lpthread-to-link.patch
rename to meta-oe/recipes-devtools/php/php/0001-Add-lpthread-to-link.patch
diff --git a/meta-oe/recipes-devtools/php/php-7.1.9/0001-Specify-tag-with-libtool.patch b/meta-oe/recipes-devtools/php/php/0001-Specify-tag-with-libtool.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-7.1.9/0001-Specify-tag-with-libtool.patch
rename to meta-oe/recipes-devtools/php/php/0001-Specify-tag-with-libtool.patch
diff --git a/meta-oe/recipes-devtools/php/php-7.1.9/CVE-2017-16642.patch b/meta-oe/recipes-devtools/php/php/CVE-2017-16642.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-7.1.9/CVE-2017-16642.patch
rename to meta-oe/recipes-devtools/php/php/CVE-2017-16642.patch
diff --git a/meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5711.patch b/meta-oe/recipes-devtools/php/php/CVE-2018-5711.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5711.patch
rename to meta-oe/recipes-devtools/php/php/CVE-2018-5711.patch
diff --git a/meta-oe/recipes-devtools/php/php-7.1.9/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-7.1.9/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
-- 
2.7.4



Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6DF78947
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:00:14 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 61-v6so242462plf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 21:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tEPL7fEIFfKkKaDewp54WFx5SEVwn5HPdrUhV8jiZKg=;
	b=Tk6uWwF4E3zsI2mh86SLqIZfPRymoRoEU0C9iBCMxPSa3cxmyP3LVuOvD+cIMcFDXy
	84wKiM/jpCCJQIHATC6HF13ff7oob5k24f3kGduMSBUUFimIgg4ETY9BMwfUUnLeaANH
	1fp4CMDx/8G78RKqlqOZ+qY+GlTs9zYXPNKr03TDz6Y9W5stD59JADILTFt+IpGfGhFJ
	fhUKk5+pepvSR1jZoOsKyoFi4bTcg06ndYNpWeDXKpEZuqJ5NJBfZagy0/O4u9b2kvUO
	u3bSwbHxOqdD2h6B45tUbOC1aoEZ48X8MnpgZ9lxn4COu85NpmnhNGD2YpMCR1Wh9jdR
	nGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tEPL7fEIFfKkKaDewp54WFx5SEVwn5HPdrUhV8jiZKg=;
	b=Hrw8sSSMfPE88R141LuXmXUBR6B8iko/tiOoHVFxdQITlrs89B6+IAjAXTfqmJhAOE
	IG4H8Llz2HEWNYoo/M58UwLda3/d8lZ+KMn14aPDnybbJEF1okKe24Rh52OzWlb85XZo
	dDV5PGx21BxbIrRljTFZGJc6LJT9ODBkL+GKPznfUTTy+Vhcy5eHP6qe4BaBqe+qJilg
	86qGFBJqUJKYPuf9/ZS1Ufe9JKtHU2kzmdcT93MwYtV2U964U6knbelQfImVDxIWbKnl
	EEIz7EpyBQy5p9RHV+AS+jxYcPeBVWgKejNG0c5i6I8yadDb1cIUefO62svfE6tXfg/L
	xaDA==
X-Gm-Message-State: AElRT7FCPIk6NmfI8rQa58DJ78QwwfdTrUAKq8L2toG+XEJ86GSIsX7Z
	7R8O6vHWlidWT6kI2Lo8I/+V1A==
X-Google-Smtp-Source: AG47ELsDKxu4jyUKm1RACdxUnYNwxzS8d6umuRYOCp9YpGVHcomup0W24utdJ6QOOIr7O3xcZT9wXw==
X-Received: by 2002:a17:902:6a89:: with SMTP id
	n9-v6mr15048143plk.51.1521518415980; 
	Mon, 19 Mar 2018 21:00:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	m9sm927862pff.143.2018.03.19.21.00.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 21:00:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 20:59:59 -0700
Message-Id: <20180320040000.29408-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180320040000.29408-1-raj.khem@gmail.com>
References: <20180320040000.29408-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/6] libqb: Upgrade to 1.0.3
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
X-List-Received-Date: Tue, 20 Mar 2018 04:00:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop upstreamed patch
Backport another patch to fix out of tree build regression

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Remove-runtime-check-for-CLOCK_MONOTONIC.patch | 43 -----------------
 ...onfigure-script-neglecting-re-enable-out-.patch | 56 ++++++++++++++++++++++
 .../libqb/{libqb_1.0.2.bb => libqb_1.0.3.bb}       |  6 ++-
 3 files changed, 60 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
 create mode 100644 meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-neglecting-re-enable-out-.patch
 rename meta-oe/recipes-extended/libqb/{libqb_1.0.2.bb => libqb_1.0.3.bb} (77%)

diff --git a/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch b/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
deleted file mode 100644
index 28bc5c07d..000000000
--- a/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e6fbad0c122ba8e87b67a9e2447505adcaafe204 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 29 Mar 2017 16:31:38 -0700
-Subject: [PATCH] Remove runtime check for CLOCK_MONOTONIC
-
-Does not work during cross compile
-
-use a compile-time check to detect whether the
-monotonic clock is available. This check can run just fine when we are
-cross-compiling.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fa13ae6..f4f0f46 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -175,9 +175,17 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
-                  )
- 
- AC_MSG_CHECKING(for a working clock_getres(CLOCK_MONOTONIC, &ts))
--AC_RUN_IFELSE([AC_LANG_PROGRAM(
-+AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
- [[#include <time.h>]],
--[[struct timespec ts; if(clock_getres(CLOCK_MONOTONIC, &ts)) return -1;]])],
-+[[
-+#include <unistd.h>
-+int main() {
-+#if !(defined(_POSIX_MONOTONIC_CLOCK) && _POSIX_MONOTONIC_CLOCK >= 0 && defined(CLOCK_MONOTONIC))
-+        #error No monotonic clock
-+#endif
-+    return 0;
-+
-+]])],
-                     [
-                       AC_MSG_RESULT([yes])
-                       AC_DEFINE_UNQUOTED([HAVE_CLOCK_GETRES_MONOTONIC], 1, [Define to 1 if clock_getres(CLOCK_MONOTONIC, &ts) works])
--- 
-2.12.1
-
diff --git a/meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-neglecting-re-enable-out-.patch b/meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-neglecting-re-enable-out-.patch
new file mode 100644
index 000000000..c82f3bf01
--- /dev/null
+++ b/meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-neglecting-re-enable-out-.patch
@@ -0,0 +1,56 @@
+From 73d2aea33e32272bac693550e8a3b0e3ad89707f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jan=20Pokorn=C3=BD?= <jpokorny@redhat.com>
+Date: Tue, 26 Dec 2017 00:02:26 +0100
+Subject: [PATCH] build: fix configure script neglecting, re-enable out-of-tree
+ builds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+For the former, a prototype and the final code got (hm, mysteriously)
+intertwisted.  For the latter, I am clearly guilty of (rare, anyway)
+testing of the out-of-tree builds only with libqb-already-system-wide
+scenario, which is rather shortsighted.
+
+Thanks Fabio and his ci.kronosnet.org project for spotting that.
+
+X-mas-present-for: Fabio M. Di Nitto <fdinitto@redhat.com>
+Signed-off-by: Jan Pokorný <jpokorny@redhat.com>
+---
+Upstream-Status: Backport
+
+ configure.ac    | 2 +-
+ lib/Makefile.am | 4 +++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9900310..f9761cc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -710,7 +710,7 @@ if test "x${GCC}" = xyes; then
+ 			                      | grep __stop___verbose | cut -d" " -f 3)
+ 			 test "${verbose_start_addr}" = "${verbose_stop_addr}" \
+ 			   && gcc_has_attribute_section_visible=no \
+-			   || { verbose_start_type=$(${READELF} -s backup \
++			   || { verbose_start_type=$(${READELF} -s "conftest${shrext_cmds}" \
+ 			                             | sed -n '/__start___verbose/{s/^\s*//p;q}' \
+ 			                             | tr -s ' ' \
+ 			                             | cut -d" " -f6)
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 6ca6b15..b035f0b 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -101,7 +101,9 @@ endif
+ endif
+ 
+ qblog_script.ld: %.ld: %.ld.in
+-	$(AM_V_GEN)$(CPP) -xc -I$(top_srcdir)/include -D_GNU_SOURCE -C -P $< \
++	$(AM_V_GEN)$(CPP) -C -D_GNU_SOURCE -P \
++	  -I$(top_srcdir)/include -I$(top_builddir)/include \
++	  -xc $< \
+ 	  | sed -n "/$$(sed -n '/^[^#]/{s/[*\/]/\\&/g;p;q;}' $<)/,$$ p" \
+ 	  > $@
+ 
+-- 
+2.16.2
+
diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.2.bb b/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
similarity index 77%
rename from meta-oe/recipes-extended/libqb/libqb_1.0.2.bb
rename to meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
index 574f6601c..73cea5e39 100644
--- a/meta-oe/recipes-extended/libqb/libqb_1.0.2.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
@@ -11,12 +11,14 @@ inherit autotools pkgconfig
 
 PV .= "+git${SRCPV}"
 
-SRCREV = "608de6d59a3de0eef0fbcbd8f284acbc018daa9a"
+# v1.0.3
+SRCREV = "28dff090c74b6ba8609c4797294a5afe3fe73987"
 SRC_URI = "git://github.com/ClusterLabs/${BPN}.git \
-           file://0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch \
+           file://0001-build-fix-configure-script-neglecting-re-enable-out-.patch \
           "
 S = "${WORKDIR}/git"
 
+CFLAGS += "-pthread -D_REENTRANT"
 do_configure_prepend() {
     ( cd ${S}
     ${S}/autogen.sh )
-- 
2.16.2



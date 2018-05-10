Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4962675045
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 05:06:00 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id f7-v6so594217plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 22:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZpOneoXuZzletfB5+0bSaH3TyWazQxcIApe8JnxNLTI=;
	b=sf+hyJprMS5WNsruVvE7G+iOOu4MgVSE+jCs6lTZ+ISOw2r651lrn5IA4hJAu1ewlP
	46xVf8UBu5zapKTTBgdlONQL1TxJTWBts6AUbi/80SU/bulm/ERNYmVoR1FoWmM1ktrz
	MV4+ZA/XD5e0+y2FGQL3XprR2pnvbxm6fk/HBNPZGolv5qWaFjBHPdpXpCXdQmsWo3y0
	/j/ElbUjbfKqTOoKdPqdFwRdMBXjE93wY6NYppmMkt7tToGV+UsRvlrsWRIboqb+VNqJ
	UT5nftKmEz85nA5olPCtkmOGazE521Cwt816Ovpv00ux8XPmJG3SO75vtrG9vNaqDpi0
	qrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZpOneoXuZzletfB5+0bSaH3TyWazQxcIApe8JnxNLTI=;
	b=YxArnnaEMYmms2XxobDhgfo31IGj010yQdvC8/Kz2vsgVnfr10X8ZuyyMUkhZegO+C
	bBiLbHjtB3lk4fm3hfxZBQwvHgJWrok/t3OO5e2eDtYLZcqku1bqaKm36WyPP5OQBLNL
	mEwC6oI62kLogM5f+U+W1qVTSBaJm3WlHnprXXPe4y3oP+lsPcOY0ng9+fGwOOdquCIy
	2+f5zGdjBhJoTrYIwURSnEoAn+vJzTmxXfrSP+jh1FW+jWVVWM509DDprS41z13qssS0
	KFoqNlpqggqh6oI5zLJair6D74ue5jbCyWGg15SyJrEvSAwQ8OzRDtpocPQopJWnWr7Z
	/SSQ==
X-Gm-Message-State: ALQs6tBFmAwQRg558A6lonQ5ko9pxdEGouCCLrF7yYdoR4n9ZamNWD2Z
	n61SKwv7v53mglnHeMagriFhSg==
X-Google-Smtp-Source: AB8JxZpUNG2FwYc1z9xD/lFiYvRbPMbwQ+PwxGR6cpz1nIrLmiUDjy1RLjCrOSnYdB+GVKA0MLoSyA==
X-Received: by 2002:a17:902:548f:: with SMTP id
	e15-v6mr42444506pli.314.1525928761562; 
	Wed, 09 May 2018 22:06:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	q8sm52405418pfh.26.2018.05.09.22.06.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 22:06:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 22:05:56 -0700
Message-Id: <20180510050556.36344-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH] collectd: Upgrade to 5.8.0
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
X-List-Received-Date: Thu, 10 May 2018 05:06:01 -0000

Fix build with gcc8 along the way
Forward port existing patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-conditionally-check-libvirt.patch    | 33 ++++----
 ...for-Wno-error-format-truncation-comp.patch | 32 +++-----
 .../0005-Disable-new-gcc8-warnings.patch      | 65 +++++++++++++++
 .../collectd/collectd/no-gcrypt-badpath.patch | 80 +++++++++----------
 .../{collectd_5.7.2.bb => collectd_5.8.0.bb}  |  9 ++-
 5 files changed, 135 insertions(+), 84 deletions(-)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch
 rename meta-oe/recipes-extended/collectd/{collectd_5.7.2.bb => collectd_5.8.0.bb} (93%)

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch b/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch
index 1ceacd8c40..5ee75cb4de 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch
@@ -1,28 +1,31 @@
-[PATCH] conditionally check libvirt
+From 385bf1c2ec57942e17ee529e57eef0dcd99904e6 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Tue, 1 Sep 2015 17:00:33 +0800
+Subject: [PATCH] [PATCH] conditionally check libvirt
 
 Upstream-Statue: Pending
 
 check if libvirt is available only when a user wants to use libvirt
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
- configure.ac | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
+ configure.ac | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
 
-Index: collectd-5.7.1/configure.ac
-===================================================================
---- collectd-5.7.1.orig/configure.ac
-+++ collectd-5.7.1/configure.ac
-@@ -5556,12 +5556,14 @@ else
- 	with_libxml2="no (pkg-config doesn't know libxml-2.0)"
+diff --git a/configure.ac b/configure.ac
+index 101d6f9f..a7eca97d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -5758,11 +5758,14 @@ else
+   with_libxml2="no (pkg-config doesn't know libxml-2.0)"
  fi
  
 -$PKG_CONFIG --exists libvirt 2>/dev/null
--if test "$?" = "0"
--then
--	with_libvirt="yes"
+-if test $? = 0; then
+-  with_libvirt="yes"
 -else
--	with_libvirt="no (pkg-config doesn't know libvirt)"
+-  with_libvirt="no (pkg-config doesn't know libvirt)"
 +if test "x$enable_libvirt" = "xyes"; then
 +	$PKG_CONFIG --exists libvirt 2>/dev/null
 +	if test "$?" = "0"
@@ -32,5 +35,5 @@ Index: collectd-5.7.1/configure.ac
 +		with_libvirt="no (pkg-config doesn't know libvirt)"
 +	fi
  fi
- if test "x$with_libxml2" = "xyes"
- then
+ 
+ if test "x$with_libxml2" = "xyes"; then
diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch b/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
index 5069a639c1..d2c7268005 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
@@ -1,4 +1,4 @@
-From b459c55e4968321e5a82272cb39aa69d4054990f Mon Sep 17 00:00:00 2001
+From b0a64db90a24469e36978c748417ebe456b34d59 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Apr 2017 11:54:57 -0700
 Subject: [PATCH] configure: Check for -Wno-error=format-truncation compiler
@@ -14,35 +14,26 @@ client.c:834:23: error: '%s' directive output may be truncated writing up to 102
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
- configure.ac                |  3 +-
- m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 76 insertions(+), 1 deletion(-)
+ configure.ac                |  1 +
+ m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 75 insertions(+)
  create mode 100644 m4/ax_check_compile_flag.m4
 
 diff --git a/configure.ac b/configure.ac
-index 8854542..edb8cfb 100644
+index a7eca97d..560eb988 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4,7 +4,6 @@ AC_INIT([collectd],[m4_esyscmd(./version-gen.sh)])
- AC_CONFIG_SRCDIR(src/target_set.c)
- AC_CONFIG_HEADERS(src/config.h)
- AC_CONFIG_AUX_DIR([libltdl/config])
--
- dnl older automake's default of ARFLAGS=cru is noisy on newer binutils;
- dnl we don't really need the 'u' even in older toolchains.  Then there is
- dnl older libtool, which spelled it AR_FLAGS
-@@ -6688,6 +6687,8 @@ then
-         AM_CFLAGS="$AM_CFLAGS -Werror"
-         AM_CXXFLAGS="$AM_CXXFLAGS -Werror"
+@@ -6794,6 +6794,7 @@ if test "x$enable_werror" != "xno"; then
+   AM_CFLAGS="$AM_CFLAGS -Werror"
+   AM_CXXFLAGS="$AM_CXXFLAGS -Werror"
  fi
 +AX_CHECK_COMPILE_FLAG([-Werror -Werror=format-truncation],[AM_CFLAGS="$AM_CFLAGS -Wno-error=format-truncation" AM_CXXFLAGS="$AM_CXXFLAGS -Wno-error=format-truncation"])
-+
+ 
  AC_SUBST([AM_CFLAGS])
  AC_SUBST([AM_CXXFLAGS])
- 
 diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
 new file mode 100644
-index 0000000..dcabb92
+index 00000000..dcabb92a
 --- /dev/null
 +++ b/m4/ax_check_compile_flag.m4
 @@ -0,0 +1,74 @@
@@ -120,6 +111,3 @@ index 0000000..dcabb92
 +  [m4_default([$3], :)])
 +AS_VAR_POPDEF([CACHEVAR])dnl
 +])dnl AX_CHECK_COMPILE_FLAGS
--- 
-2.13.4
-
diff --git a/meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch b/meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch
new file mode 100644
index 0000000000..b12690b327
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch
@@ -0,0 +1,65 @@
+From d65e48b68076d5b304e6d865967003ae1fea0e6c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 May 2018 21:45:38 -0700
+Subject: [PATCH] Disable new gcc8 warnings
+
+GCC seems to be not able to detect the checks for size are
+already in place
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/collectd/collectd/pull/2768]
+ src/libcollectdclient/network_parse.c | 7 +++++++
+ src/write_sensu.c                     | 7 +++++++
+ 2 files changed, 14 insertions(+)
+
+diff --git a/src/libcollectdclient/network_parse.c b/src/libcollectdclient/network_parse.c
+index 2365ab0a..79e6ed96 100644
+--- a/src/libcollectdclient/network_parse.c
++++ b/src/libcollectdclient/network_parse.c
+@@ -163,6 +163,11 @@ static int parse_int(void *payload, size_t payload_size, uint64_t *out) {
+   return 0;
+ }
+ 
++#pragma GCC diagnostic push
++#if __GNUC__ == 8
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
++#endif
++
+ static int parse_string(void *payload, size_t payload_size, char *out,
+                         size_t out_size) {
+   char *in = payload;
+@@ -175,6 +180,8 @@ static int parse_string(void *payload, size_t payload_size, char *out,
+   return 0;
+ }
+ 
++#pragma GCC diagnostic pop
++
+ static int parse_identifier(uint16_t type, void *payload, size_t payload_size,
+                             lcc_value_list_t *state) {
+   char buf[LCC_NAME_LEN];
+diff --git a/src/write_sensu.c b/src/write_sensu.c
+index ce23e654..63e1f599 100644
+--- a/src/write_sensu.c
++++ b/src/write_sensu.c
+@@ -569,6 +569,11 @@ static char *sensu_value_to_json(struct sensu_host const *host, /* {{{ */
+   return ret_str;
+ } /* }}} char *sensu_value_to_json */
+ 
++#pragma GCC diagnostic push
++#if __GNUC__ == 8
++#pragma GCC diagnostic ignored "-Wstringop-overflow"
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
++#endif
+ /*
+  * Uses replace_str2() implementation from
+  * http://creativeandcritical.net/str-replace-c/
+@@ -631,6 +636,8 @@ static char *replace_str(const char *str, const char *old, /* {{{ */
+   return ret;
+ } /* }}} char *replace_str */
+ 
++#pragma GCC diagnostic pop
++
+ static char *replace_json_reserved(const char *message) /* {{{ */
+ {
+   char *msg = replace_str(message, "\\", "\\\\");
diff --git a/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch b/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
index 1fde6a0711..f12b16cb91 100644
--- a/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
@@ -1,43 +1,37 @@
-Index: collectd-5.7.1/configure.ac
-===================================================================
---- collectd-5.7.1.orig/configure.ac
-+++ collectd-5.7.1/configure.ac
-@@ -2305,7 +2305,7 @@ AC_ARG_WITH(libgcrypt, [AS_HELP_STRING([
- 	 with_libgcrypt="yes"
-  else if test -f "$withval/bin/gcrypt-config" && test -x "$withval/bin/gcrypt-config"
-  then
--	 with_libgcrypt_config="$withval/bin/gcrypt-config"
-+	 with_libgcrypt_config="$withval/bin/pkg-config"
- 	 with_libgcrypt="yes"
-  else if test -d "$withval"
-  then
-@@ -2313,12 +2313,12 @@ AC_ARG_WITH(libgcrypt, [AS_HELP_STRING([
- 	 GCRYPT_LDFLAGS="$GCRYPT_LDFLAGS -L$withval/lib"
- 	 with_libgcrypt="yes"
-  else
--	 with_libgcrypt_config="gcrypt-config"
-+	 with_libgcrypt_config="pkg-config"
- 	 with_libgcrypt="$withval"
-  fi; fi; fi
- ],
- [
-- with_libgcrypt_config="libgcrypt-config"
-+ with_libgcrypt_config="pkg-config"
-  with_libgcrypt="yes"
- ])
- 
-@@ -2326,12 +2326,12 @@ if test "x$with_libgcrypt" = "xyes" && t
- then
- 	if test "x$GCRYPT_CPPFLAGS" = "x"
- 	then
--		GCRYPT_CPPFLAGS=`"$with_libgcrypt_config" --cflags 2>/dev/null`
-+		GCRYPT_CPPFLAGS=`"$with_libgcrypt_config" --cflags libgcrypt 2>/dev/null`
- 	fi
- 
- 	if test "x$GCRYPT_LIBS" = "x"
- 	then
--		GCRYPT_LIBS=`"$with_libgcrypt_config" --libs 2>/dev/null`
-+		GCRYPT_LIBS=`"$with_libgcrypt_config" --lib libgcrypt 2>/dev/null`
- 	fi
- fi
- 
+From d9b954bd9d0b084d9a1f5159a9f0c45802a51809 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Mon, 22 Apr 2013 16:28:16 +0000
+
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e869a6a0..101d6f9f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2514,20 +2514,20 @@ AC_ARG_WITH([libgcrypt],
+     if test -f "$withval" && test -x "$withval"; then
+       with_libgcrypt_config="$withval"
+       with_libgcrypt="yes"
+-    else if test -f "$withval/bin/gcrypt-config" && test -x "$withval/bin/gcrypt-config"; then
+-      with_libgcrypt_config="$withval/bin/gcrypt-config"
++    else if test -f "$withval/bin/pkg-config" && test -x "$withval/bin/pkg-config"; then
++      with_libgcrypt_config="$withval/bin/pkg-config"
+       with_libgcrypt="yes"
+     else if test -d "$withval"; then
+       GCRYPT_CPPFLAGS="$GCRYPT_CPPFLAGS -I$withval/include"
+       GCRYPT_LDFLAGS="$GCRYPT_LDFLAGS -L$withval/lib"
+       with_libgcrypt="yes"
+     else
+-      with_libgcrypt_config="gcrypt-config"
++      with_libgcrypt_config="pkg-config"
+       with_libgcrypt="$withval"
+     fi; fi; fi
+   ],
+   [
+-    with_libgcrypt_config="libgcrypt-config"
++    with_libgcrypt_config="libpkg-config"
+     with_libgcrypt="yes"
+   ]
+ )
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.7.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.8.0.bb
similarity index 93%
rename from meta-oe/recipes-extended/collectd/collectd_5.7.2.bb
rename to meta-oe/recipes-extended/collectd/collectd_5.8.0.bb
index c156ea19c9..92b619e227 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.7.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.8.0.bb
@@ -12,9 +12,10 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://0001-conditionally-check-libvirt.patch \
            file://0001-fix-to-build-with-glibc-2.25.patch \
            file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
-"
-SRC_URI[md5sum] = "5da2b69c286a064db35c6cc1e758b039"
-SRC_URI[sha256sum] = "9d20a0221569a8d6b80bbc52b86e5e84965f5bafdbf5dfc3790e0fed0763e592"
+           file://0005-Disable-new-gcc8-warnings.patch \
+           "
+SRC_URI[md5sum] = "a841159323624f18bf03198e9f5aa364"
+SRC_URI[sha256sum] = "b06ff476bbf05533cb97ae6749262cc3c76c9969f032bd8496690084ddeb15c9"
 
 inherit autotools pythonnative update-rc.d pkgconfig systemd
 
@@ -62,7 +63,7 @@ do_install_append() {
     sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/collectd
     sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/collectd
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/collectd
-
+    install -Dm 0640 ${B}/src/collectd.conf ${D}${sysconfdir}/collectd.conf
     # Fix configuration file to allow collectd to start up
     sed -i 's!^#FQDNLookup[ \t]*true!FQDNLookup   false!g' ${D}${sysconfdir}/collectd.conf
 
-- 
2.17.0



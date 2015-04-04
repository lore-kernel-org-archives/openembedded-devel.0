Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id A839873CF6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Apr 2015 16:24:19 +0000 (UTC)
Received: by pactp5 with SMTP id tp5so149152102pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2015 09:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=F57BkoLA/Ebmnhg522Yzl+JW45d18PGMYeZ15neu+uI=;
	b=sAXk+pGPGqLlRJJ/RHtElpYYrHYDGrLkgKIeSYOnQK8vHh9MwLIzTC+XC5M59uTn3l
	RvqWSpz7ggovD/Aj88cxKGvozUt0QqiSHN5XA9LMwKvKUc3Be42ap5bJrP8L7xlk3grW
	BTGeF69iZTsEJyU/wviF5+jvK5Sbcwfj/eA6DZcRP7y3HFK3Qs1eP0iv6Vy55c1/kiyu
	OZzG2A/qi/+owTtOyRn64eRmeVdsV3PLak5pcRjmY9l3GhksfJdwkM/THIAj55Rhks3h
	rFoyyPxirhXxSykBAKyDkiXCSZStUyejEfN7J7Cv20XRvJkWCZo9il8imhD0p08vcutB
	aCXA==
X-Received: by 10.66.160.197 with SMTP id xm5mr13367073pab.51.1428164660494;
	Sat, 04 Apr 2015 09:24:20 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id eo1sm6618896pbd.36.2015.04.04.09.24.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 Apr 2015 09:24:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Apr 2015 09:24:11 -0700
Message-Id: <ebc4e4e79c42f56272630b213dbdf9b41f1a1958.1428164164.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1428164164.git.akuster808@gmail.com>
References: <cover.1428164164.git.akuster808@gmail.com>
In-Reply-To: <cover.1428164164.git.akuster808@gmail.com>
References: <cover.1428164164.git.akuster808@gmail.com>
Subject: [PATCH 1/2] ruby: package update to verison 2.2.1
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
X-List-Received-Date: Sat, 04 Apr 2015 16:24:19 -0000

LIC_FILES_CHKSUM changes:
BDSL: update copyright notice with "2013"
GPL: update to GPLv2
LEGAL: added license info for ccan files

dropped patches since they are now incorperated.

several security fixes included:
CVE-2014-2525
CVE-2014-0160
CVE-2014-2734
CVE-2014-8080
CVE-2014-8090

for addional information:
http://svn.ruby-lang.org/repos/ruby/tags/v2_2_1/ChangeLog

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/ruby.inc           |   8 +-
 ...onf-hardcode-wide-getaddr-info-test-outco.patch |  26 --
 .../ruby/ruby/remove-the-dependency-on-dir.patch   |  37 ---
 .../ruby/ruby/ruby-1.9.3-always-use-i386.patch     |  11 -
 .../ruby/ruby-1.9.3-custom-rubygems-location.patch |  86 ------
 .../ruby/ruby-1.9.3-disable-versioned-paths.patch  | 149 -----------
 .../ruby/ruby/ruby-1.9.3-install-cross.patch       |  16 --
 .../ruby/ruby/ruby-1.9.3-mkmf-verbose.patch        |  11 -
 .../ruby-1.9.3-rubygems-1.8.11-uninstaller.patch   |  76 ------
 ...kmf.rb-fix-race-conditions-at-install-ext.patch |  31 ---
 .../ruby/rubygems-1.8.11-binary-extensions.patch   | 296 ---------------------
 .../ruby/{ruby_1.9.3-p547.bb => ruby_2.2.1.bb}     |  23 +-
 12 files changed, 9 insertions(+), 761 deletions(-)
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch
 rename meta-ruby/recipes-devtools/ruby/{ruby_1.9.3-p547.bb => ruby_2.2.1.bb} (52%)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc b/meta-ruby/recipes-devtools/ruby/ruby.inc
index 7702869..ba60191 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby.inc
+++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
@@ -9,16 +9,14 @@ SECTION = "devel/ruby"
 LICENSE = "Ruby | BSD | GPLv2"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=837b32593517ae48b9c3b5c87a5d288c \
-    file://BSDL;md5=3949e007205deef714bd225e1ee4a8ea \
-    file://GPL;md5=393a5ca445f6965873eca0259a17f833 \
-    file://LEGAL;md5=3ce1fae39fe573b818c0af162bce6579 \
+    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
+    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
+    file://LEGAL;md5=c440adb575ba4e6e2344c2630b6a5584\
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
 DEPENDS_class-native = "libyaml-native"
 
-INC_PR = "r1"
-
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://extmk.patch \
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch b/meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
deleted file mode 100644
index 712602a..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 9341293e71c03fe606edc9157bf1e13e3dd5b507 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 17 Dec 2010 11:35:38 +0100
-Subject: [PATCH] socket extconf: hardcode wide-getaddr info test outcome to true
-
-Without this the socket extension doesn't build correctly
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- ext/socket/extconf.rb |    5 +++++
- 1 file changed, 5 insertions(+)
-
---- a/ext/socket/extconf.rb
-+++ b/ext/socket/extconf.rb
-@@ -356,6 +356,11 @@
-   exit(EXIT_FAILURE);
- }
- EOF
-+
-+# Ignore the actual result of the above test and assume that
-+# everything is OK.
-+getaddr_info_ok = true
-+
- if ipv6 and not getaddr_info_ok
-   abort <<EOS
- 
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch b/meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
deleted file mode 100644
index a4ac3ea..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-remove a duplicate dependency
-
-Upstream-status: Pending
-
-The install-rb-default dependency is as below:
-
-pre-install-rb-default:
-	mkdir -p $(RUBYLIBDIR)/bigdecimal
-
-install-rb-default: pre-install-rb-default $(RUBYLIBDIR)/bigdecimal
-
-In fact, dependency on $(RUBYLIBDIR)/bigdecimal is duplicate, and not rule
-for $(RUBYLIBDIR)/bigdecimal, once $(RUBYLIBDIR)/bigdecimal is checked before
-pre-install-rb-default, the below error will happen
-	*** No rule to make target `../../.ext/common/yaml', needed by `install-rb-default'.  Stop
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- lib/mkmf.rb |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/mkmf.rb b/lib/mkmf.rb
-index 1f5ed76..556684c 100644
---- a/lib/mkmf.rb
-+++ b/lib/mkmf.rb
-@@ -2054,7 +2054,7 @@ static: $(STATIC_LIB)#{$extout ? " install-rb" : ""}
-       end
-       for f in files
-         dest = "#{dir}/#{File.basename(f)}"
--        mfile.print("install-rb#{sfx}: #{dest} #{dir}\n")
-+        mfile.print("install-rb#{sfx}: #{dest}\n")
-         mfile.print("#{dest}: #{f}\n")
-         mfile.print("\t$(Q) $(#{$extout ? 'COPY' : 'INSTALL_DATA'}) #{f} $(@D#{sep})\n")
-         if defined?($installed_list) and !$extout
--- 
-1.7.10.4
-
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch
deleted file mode 100644
index f5a8c3d..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-always-use-i386.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/configure.in.orig	2011-10-18 08:56:21.587594685 +0200
-+++ b/configure.in	2011-10-18 08:56:59.751593321 +0200
-@@ -2935,6 +2935,8 @@
- configure_args=$ac_configure_args
- AC_SUBST(configure_args)dnl
- 
-+target_cpu=`echo $target_cpu | sed s/i.86/i386/`
-+
- if test "${universal_binary-no}" = yes ; then
-     arch="universal-${target_os}"
-     AC_CACHE_CHECK(whether __ARCHITECTURE__ is available, rb_cv_architecture_available,
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch
deleted file mode 100644
index e11febc..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-custom-rubygems-location.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 279a693ce4ef3a887ce8d4fa59e0f2616a14d91a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
-Date: Fri, 11 Nov 2011 13:14:45 +0100
-Subject: [PATCH] Allow to install RubyGems into custom location, outside of
- Ruby tree.
-
----
- configure.in      |    8 ++++++++
- tool/mkconfig.rb  |    1 +
- tool/rbinstall.rb |    9 +++++++++
- version.c         |    4 ++++
- 4 files changed, 22 insertions(+)
-
---- a/configure.in
-+++ b/configure.in
-@@ -2801,6 +2801,13 @@
-     dir="${VENDOR_DIR}"
- done
- 
-+AC_ARG_WITH(rubygemsdir,
-+           AS_HELP_STRING([--with-rubygemsdir=DIR], [custom rubygems directory]),
-+            [rubygemsdir=$withval])
-+if test "$rubygemsdir" != ""; then
-+    AC_DEFINE_UNQUOTED(RUBYGEMS_DIR,"$rubygemsdir")
-+fi
-+
- if test "${LOAD_RELATIVE+set}"; then
-     AC_DEFINE_UNQUOTED(LOAD_RELATIVE, $LOAD_RELATIVE)
-     RUBY_EXEC_PREFIX=""
-@@ -2921,6 +2928,7 @@
- AC_SUBST(rubyhdrdir)dnl
- AC_SUBST(sitehdrdir)dnl
- AC_SUBST(vendorhdrdir)dnl
-+AC_SUBST(rubygemsdir)dnl
- 
- AC_ARG_WITH(opt-dir,
- 	AS_HELP_STRING([--with-opt-dir=DIR], [add optional headers and libraries DIR]))
---- a/tool/mkconfig.rb
-+++ b/tool/mkconfig.rb
-@@ -78,6 +78,7 @@
-     when /^RUBY_SO_NAME$/; next if $so_name
-     when /^arch$/; if val.empty? then val = arch else arch = val end
-     when /^sitearch/; val = '$(arch)' if val.empty?
-+    when /^rubygemsdir/; next if val.empty?
-     end
-     case val
-     when /^\$\(ac_\w+\)$/; next
---- a/tool/rbinstall.rb
-+++ b/tool/rbinstall.rb
-@@ -300,6 +300,7 @@
- sitearchlibdir = CONFIG["sitearchdir"]
- vendorlibdir = CONFIG["vendorlibdir"]
- vendorarchlibdir = CONFIG["vendorarchdir"]
-+rubygemsdir = CONFIG["rubygemsdir"]
- mandir = CONFIG["mandir"]
- capidir = CONFIG["docdir"]
- configure_args = Shellwords.shellwords(CONFIG["configure_args"])
-@@ -487,7 +488,15 @@
- install?(:local, :comm, :lib) do
-   prepare "library scripts", rubylibdir
-   noinst = %w[README* *.txt *.rdoc]
-+  noinst += %w[*ubygems.rb rubygems/ datadir.rb] if rubygemsdir
-   install_recursive(File.join(srcdir, "lib"), rubylibdir, :no_install => noinst, :mode => $data_mode)
-+  if rubygemsdir
-+    noinst = %w[obsolete.rb]
-+    install_recursive(File.join(srcdir, "lib", "rubygems"), File.join(rubygemsdir, "rubygems"), :mode => $data_mode)
-+    install_recursive(File.join(srcdir, "lib", "rbconfig"), File.join(rubygemsdir, "rbconfig"), :no_install => noinst, :mode => $data_mode)
-+    install(File.join(srcdir, "lib", "ubygems.rb"), File.join(rubygemsdir, "ubygems.rb"), :mode => $data_mode)
-+    install(File.join(srcdir, "lib", "rubygems.rb"), File.join(rubygemsdir, "rubygems.rb"), :mode => $data_mode)
-+  end
- end
- 
- install?(:local, :arch, :lib) do
---- a/version.c
-+++ b/version.c
-@@ -97,6 +97,10 @@
- #endif
- #endif
- 
-+#ifdef RUBYGEMS_DIR
-+    RUBYGEMS_DIR "\0"
-+#endif
-+
-     RUBY_LIB "\0"
- #ifdef RUBY_THIN_ARCHLIB
-     RUBY_THIN_ARCHLIB "\0"
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch
deleted file mode 100644
index 6d0c5e1..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-disable-versioned-paths.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From fa1a50ad10814f724b8713865dc222724cb955ab Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
-Date: Thu, 25 Aug 2011 14:33:51 +0200
-Subject: [PATCH] Allow to disable versioned paths.
-
----
- configure.in     |   11 +++++++++++
- tool/mkconfig.rb |    9 ++++++---
- version.c        |   10 ++++++++++
- 3 files changed, 27 insertions(+), 3 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index e742e74..86cb68f 100644
---- a/configure.in
-+++ b/configure.in
-@@ -2963,6 +2963,17 @@ else
- fi
- AC_SUBST(USE_RUBYGEMS)
- 
-+AC_ARG_ENABLE(versioned-paths,
-+	AS_HELP_STRING([--disable-versioned-paths], [disable paths with version number]),
-+	[enable_versioned_paths="$enableval"], [enable_versioned_paths=yes])
-+if test x"$enable_versioned_paths" = xno; then
-+    AC_DEFINE(DISABLE_VERSIONED_PATHS, 1)
-+    USE_VERSIONED_PATHS=NO
-+else
-+    USE_VERSIONED_PATHS=YES
-+fi
-+AC_SUBST(USE_VERSIONED_PATHS)
-+
- arch_hdrdir="${EXTOUT}/include/${arch}/ruby"
- AS_MKDIR_P("${arch_hdrdir}")
- config_h="${arch_hdrdir}/config.h"
-diff --git a/tool/mkconfig.rb b/tool/mkconfig.rb
-index a2221f0..47d8c8f 100755
---- a/tool/mkconfig.rb
-+++ b/tool/mkconfig.rb
-@@ -42,6 +42,7 @@ v_others = []
- vars = {}
- continued_name = nil
- continued_line = nil
-+path_version = "/$(ruby_version)"
- File.foreach "config.status" do |line|
-   next if /^#/ =~ line
-   name = nil
-@@ -138,6 +139,8 @@ File.foreach "config.status" do |line|
-     case name
-     when "ruby_version"
-       version = val[/\A"(.*)"\z/, 1]
-+    when /^USE_VERSIONED_PATHS$/
-+      path_version = nil if /NO/ =~ val
-     end
-   end
- #  break if /^CEOF/
-@@ -203,15 +206,15 @@ end
- print(*v_fast)
- print(*v_others)
- print <<EOS
--  CONFIG["rubylibdir"] = "$(rubylibprefix)/$(ruby_version)"
-+  CONFIG["rubylibdir"] = "$(rubylibprefix)#{path_version}"
-   CONFIG["archdir"] = "$(rubylibdir)/$(arch)"
- EOS
- print <<EOS unless v_disabled["sitedir"]
--  CONFIG["sitelibdir"] = "$(sitedir)/$(ruby_version)"
-+  CONFIG["sitelibdir"] = "$(sitedir)#{path_version}"
-   CONFIG["sitearchdir"] = "$(sitelibdir)/$(sitearch)"
- EOS
- print <<EOS unless v_disabled["vendordir"]
--  CONFIG["vendorlibdir"] = "$(vendordir)/$(ruby_version)"
-+  CONFIG["vendorlibdir"] = "$(vendordir)#{path_version}"
-   CONFIG["vendorarchdir"] = "$(vendorlibdir)/$(sitearch)"
- EOS
- print <<EOS
-diff --git a/version.c b/version.c
-index 59d4e5e..641dc33 100644
---- a/version.c
-+++ b/version.c
-@@ -38,9 +38,15 @@
- #define RUBY_VENDOR_LIB RUBY_LIB_PREFIX"/vendor_ruby"
- #endif
- 
-+#ifdef DISABLE_VERSIONED_PATHS
-+#define RUBY_LIB                    RUBY_LIB_PREFIX
-+#define RUBY_SITE_LIB2              RUBY_SITE_LIB
-+#define RUBY_VENDOR_LIB2            RUBY_VENDOR_LIB
-+#else
- #define RUBY_LIB                    RUBY_LIB_PREFIX  "/"RUBY_LIB_VERSION
- #define RUBY_SITE_LIB2              RUBY_SITE_LIB    "/"RUBY_LIB_VERSION
- #define RUBY_VENDOR_LIB2            RUBY_VENDOR_LIB  "/"RUBY_LIB_VERSION
-+#endif
- #define RUBY_ARCHLIB                RUBY_LIB         "/"RUBY_ARCH
- #define RUBY_SITE_ARCHLIB           RUBY_SITE_LIB2   "/"RUBY_SITEARCH
- #define RUBY_VENDOR_ARCHLIB         RUBY_VENDOR_LIB2 "/"RUBY_SITEARCH
-@@ -75,8 +81,10 @@ const char ruby_initial_load_paths[] =
-     RUBY_SITE_THIN_ARCHLIB "\0"
- #endif
-     RUBY_SITE_ARCHLIB "\0"
-+#ifndef DISABLE_VERSIONED_PATHS
-     RUBY_SITE_LIB "\0"
- #endif
-+#endif
- 
- #ifndef NO_RUBY_VENDOR_LIB
-     RUBY_VENDOR_LIB2 "\0"
-@@ -84,8 +92,10 @@ const char ruby_initial_load_paths[] =
-     RUBY_VENDOR_THIN_ARCHLIB "\0"
- #endif
-     RUBY_VENDOR_ARCHLIB "\0"
-+#ifndef DISABLE_VERSIONED_PATHS
-     RUBY_VENDOR_LIB "\0"
- #endif
-+#endif
- 
-     RUBY_LIB "\0"
- #ifdef RUBY_THIN_ARCHLIB
--- 
-1.7.7.3
-diff --git a/lib/rdoc/ri/paths.rb b/lib/rdoc/ri/paths.rb
-index a3c65bf..0575730 100644
---- a/lib/rdoc/ri/paths.rb
-+++ b/lib/rdoc/ri/paths.rb
-@@ -11,9 +11,9 @@ module RDoc::RI::Paths
-   version = RbConfig::CONFIG['ruby_version']
- 
-   base    = if RbConfig::CONFIG.key? 'ridir' then
--              File.join RbConfig::CONFIG['ridir'], version
-+              File.join [RbConfig::CONFIG['ridir'], RbConfig::CONFIG['USE_VERSIONED_PATHS'] == 'YES' ? version : nil].compact
-             else
--              File.join RbConfig::CONFIG['datadir'], 'ri', version
-+              File.join [RbConfig::CONFIG['datadir'], 'ri', RbConfig::CONFIG['USE_VERSIONED_PATHS'] == 'YES' ? version : nil].compact
-             end
- 
-   SYSDIR  = File.join base, "system"
-diff --git a/tool/rbinstall.rb b/tool/rbinstall.rb
-index cec8c9f..fed14d2 100755
---- a/tool/rbinstall.rb
-+++ b/tool/rbinstall.rb
-@@ -379,7 +379,7 @@ end
- 
- install?(:doc, :rdoc) do
-   if $rdocdir
--    ridatadir = File.join(CONFIG['ridir'], CONFIG['ruby_version'], "system")
-+    ridatadir = File.join([CONFIG['ridir'], RbConfig::CONFIG['USE_VERSIONED_PATHS'] == 'YES' ? version : nil, "system"].compact)
-     prepare "rdoc", ridatadir
-     install_recursive($rdocdir, ridatadir, :mode => $data_mode)
-   end
--- 
-1.7.6
-
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch
deleted file mode 100644
index 9515ece..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-install-cross.patch
+++ /dev/null
@@ -1,16 +0,0 @@
----
- Makefile.in |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -210,7 +210,8 @@
- 	@$(RM) fake.rb fake-rbconfig.rb
- 	$(INSTALL_DATA) $(arch_hdrdir)/ruby/config.h $(XRUBY_RUBYHDRDIR)/$(arch)/ruby
- 	$(INSTALL_DATA) $(top_srcdir)/include/ruby/win32.h $(XRUBY_RUBYHDRDIR)/ruby
--	$(INSTALL_DATA) $(LIBRUBY) $(LIBRUBY_A) $(XRUBY_RUBYLIBDIR)/$(arch)
-+	$(INSTALL_DATA) $(LIBRUBY) $(XRUBY_RUBYLIBDIR)/$(arch)
-+	$(INSTALL_DATA) $(LIBRUBY_A) $(XRUBY_RUBYLIBDIR)/$(arch)
- 	$(INSTALL_PROGRAM) $(LIBRUBY_SO) $(XRUBY_RUBYLIBDIR)/$(arch)
- 
- Makefile:	$(srcdir)/Makefile.in $(srcdir)/enc/Makefile.in
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch
deleted file mode 100644
index 7da66c8..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-mkmf-verbose.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- ruby-1.9.3-p0/lib/mkmf.rb.debug	2011-08-11 15:07:37.000000000 +0900
-+++ ruby-1.9.3-p0/lib/mkmf.rb	2012-01-29 21:34:17.000000000 +0900
-@@ -1638,7 +1638,7 @@
- SHELL = /bin/sh
- 
- # V=0 quiet, V=1 verbose.  other values don't work.
--V = 0
-+V = 1
- Q1 = $(V:1=)
- Q = $(Q1:0=@)
- n=$(NULLCMD)
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch
deleted file mode 100644
index af1cff2..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-rubygems-1.8.11-uninstaller.patch
+++ /dev/null
@@ -1,76 +0,0 @@
---- ruby-1.9.3-p0/lib/rubygems/uninstaller.rb.orig	2011-10-31 10:22:36.321579483 +0100
-+++ ruby-1.9.3-p0/lib/rubygems/uninstaller.rb	2011-10-31 10:34:25.563626119 +0100
-@@ -51,15 +51,14 @@
-     @bin_dir           = options[:bin_dir]
-     @format_executable = options[:format_executable]
- 
-+    if options[:force]
-+      @force_all = true
-+      @force_ignore = true
-+    end
-+
-     # only add user directory if install_dir is not set
-     @user_install = false
-     @user_install = options[:user_install] unless options[:install_dir]
--
--    if @user_install then
--      Gem.use_paths Gem.user_dir, @gem_home
--    else
--      Gem.use_paths @gem_home
--    end
-   end
- 
-   ##
-@@ -69,10 +68,24 @@
-   def uninstall
-     list = Gem::Specification.find_all_by_name(@gem, @version)
- 
-+    list, other_repo_specs = list.partition do |spec|
-+      @gem_home == spec.base_dir or
-+      (@user_install and spec.base_dir == Gem.user_dir)
-+    end
-+
-     if list.empty? then
--      raise Gem::InstallError, "gem #{@gem.inspect} is not installed"
-+      raise Gem::InstallError, "gem #{@gem.inspect} is not installed" if
-+        other_repo_specs.empty?
-+
-+      other_repos = other_repo_specs.map { |spec| spec.base_dir }.uniq
-+
-+      message = ["#{@gem} is not installed in GEM_HOME, try:"]
-+      message.concat other_repos.map { |repo|
-+        "\tgem uninstall -i #{repo} #{@gem}"
-+      }
- 
--    elsif list.size > 1 and @force_all then
-+      raise Gem::InstallError, message.join("\n")
-+    elsif @force_all then
-       remove_all list
- 
-     elsif list.size > 1 then
-@@ -250,12 +263,10 @@
-     msg << "\t#{spec.full_name}"
- 
-     spec.dependent_gems.each do |dep_spec, dep, satlist|
--      msg <<
--        ("#{dep_spec.name}-#{dep_spec.version} depends on " +
--         "[#{dep.name} (#{dep.requirement})]")
-+      msg << "#{dep_spec.name}-#{dep_spec.version} depends on #{dep}"
-     end
- 
--    msg << 'If you remove this gems, one or more dependencies will not be met.'
-+    msg << 'If you remove this gem, one or more dependencies will not be met.'
-     msg << 'Continue with Uninstall?'
-     return ask_yes_no(msg.join("\n"), true)
-   end
-
---- ruby-1.9.3-p0/test/rubygems/test_gem_uninstaller.rb.orig	2011-11-03 08:58:31.411272176 +0100
-+++ ruby-1.9.3-p0/test/rubygems/test_gem_uninstaller.rb	2011-11-03 08:58:43.010272351 +0100
-@@ -225,7 +225,7 @@
- 
-     uninstaller = Gem::Uninstaller.new('a')
- 
--    use_ui Gem::MockGemUi.new("2\n") do
-+    use_ui Gem::MockGemUi.new("2\ny\n") do
-       uninstaller.uninstall
-     end
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch
deleted file mode 100644
index 5ac5d54..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Subject: [PATCH] mkmf.rb: fix race conditions at install-ext
-
-Upstream-Status: backport
-
-* lib/mkmf.rb (create_makefile): fix race conditions at install-ext.
-  target files need to depend on destination directory timestamp
-  files, not phony trgets.
-
-git-svn-id: svn+ssh://ci.ruby-lang.org/ruby/trunk@36863 b2dd03c8-39d4-4d8f-98ff-823fe69b080e
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- lib/mkmf.rb | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/mkmf.rb b/lib/mkmf.rb
-index 556684c..a277354 100644
---- a/lib/mkmf.rb
-+++ b/lib/mkmf.rb
-@@ -2055,7 +2055,7 @@ static: $(STATIC_LIB)#{$extout ? " install-rb" : ""}
-       for f in files
-         dest = "#{dir}/#{File.basename(f)}"
-         mfile.print("install-rb#{sfx}: #{dest}\n")
--        mfile.print("#{dest}: #{f}\n")
-+        mfile.print("#{dest}: #{f} #{timestamp_file(dir)}\n")
-         mfile.print("\t$(Q) $(#{$extout ? 'COPY' : 'INSTALL_DATA'}) #{f} $(@D#{sep})\n")
-         if defined?($installed_list) and !$extout
-           mfile.print("\t@echo #{dest}>>$(INSTALLED_LIST)\n")
---
-2.0.0
-
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch b/meta-ruby/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch
deleted file mode 100644
index 5a3bfb4..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/rubygems-1.8.11-binary-extensions.patch
+++ /dev/null
@@ -1,296 +0,0 @@
-From 5a37a3489491a33f2e7011043fbbcd9a765e1777 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
-Date: Thu, 3 Nov 2011 16:43:05 +0100
-Subject: [PATCH 1/6] Add dedicate extensions folder into $LOAD_PATH.
-
----
- lib/rubygems/specification.rb |   37 ++++++++++++++++++++++++++++++-------
- 1 files changed, 30 insertions(+), 7 deletions(-)
-
-diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 97db19e..263e7d3 100644
---- a/lib/rubygems/specification.rb
-+++ b/lib/rubygems/specification.rb
-@@ -843,6 +843,12 @@ class Gem::Specification
-       File.join full_gem_path, path
-     end
- 
-+    unless extensions.empty?
-+      paths += require_paths.map do |path|
-+        File.join ext_dir, path
-+      end
-+    end
-+
-     # gem directories must come after -I and ENV['RUBYLIB']
-     insert_index = Gem.load_path_insert_index
- 
-@@ -954,16 +960,16 @@ class Gem::Specification
- 
-   def contains_requirable_file? file
-     root = full_gem_path
-+    ext = ext_dir
-+
-+    require_paths.any? do |lib|
-+      base = ["#{root}/#{lib}/#{file}"]
-+      base << "#{ext}/#{lib}/#{file}" unless extensions.empty?
- 
--    require_paths.each do |lib|
--      base = "#{root}/#{lib}/#{file}"
--      Gem.suffixes.each do |suf|
--        path = "#{base}#{suf}"
--        return true if File.file? path
-+      base.any? do |path|
-+        Gem.suffixes.any? { |suf| File.file? "#{path}#{suf}" }
-       end
-     end
--
--    return false
-   end
- 
-   ##
-@@ -1273,6 +1279,23 @@ class Gem::Specification
-   end
- 
-   ##
-+  # Returns the full path to this spec's ext directory.
-+  # eg: /usr/local/lib/ruby/1.8/exts/mygem-1.0
-+
-+  def ext_dir
-+    @gem_dir ||= File.expand_path File.join(exts_dir, full_name)
-+  end
-+
-+  ##
-+  # Returns the full path to the exts directory containing this spec's
-+  # gem directory. eg: /usr/local/lib/ruby/1.8/exts
-+
-+  def exts_dir
-+    # TODO: this logic seems terribly broken, but tests fail if just base_dir
-+    @exts_dir ||= File.join(loaded_from && base_dir || Gem.dir, "exts")
-+  end
-+
-+  ##
-   # Deprecated and ignored, defaults to true.
-   #
-   # Formerly used to indicate this gem was RDoc-capable.
--- 
-1.7.7.3
-
-
-From 671e4285bf9db948bc5f054d7d3d931cdd7a17f8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
-Date: Wed, 16 Nov 2011 13:26:48 +0100
-Subject: [PATCH 2/6] Use spec's ext dir for extension installation.
-
----
- lib/rubygems/installer.rb     |    2 +-
- lib/rubygems/specification.rb |    7 +++----
- 2 files changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/lib/rubygems/installer.rb b/lib/rubygems/installer.rb
-index 74d803d..0063c7f 100644
---- a/lib/rubygems/installer.rb
-+++ b/lib/rubygems/installer.rb
-@@ -499,7 +499,7 @@ TEXT
-   def build_extensions
-     return if spec.extensions.empty?
-     say "Building native extensions.  This could take a while..."
--    dest_path = File.join gem_dir, spec.require_paths.first
-+    dest_path = spec.ext_dir
-     ran_rake = false # only run rake once
- 
-     spec.extensions.each do |extension|
-diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 263e7d3..d31b93b 100644
---- a/lib/rubygems/specification.rb
-+++ b/lib/rubygems/specification.rb
-@@ -1283,16 +1283,15 @@ class Gem::Specification
-   # eg: /usr/local/lib/ruby/1.8/exts/mygem-1.0
- 
-   def ext_dir
--    @gem_dir ||= File.expand_path File.join(exts_dir, full_name)
-+    @ext_dir ||= File.join exts_dir, full_name, require_paths.first
-   end
- 
-   ##
-   # Returns the full path to the exts directory containing this spec's
--  # gem directory. eg: /usr/local/lib/ruby/1.8/exts
-+  # gem directory. eg: /usr/local/lib/ruby/1.8/gems
- 
-   def exts_dir
--    # TODO: this logic seems terribly broken, but tests fail if just base_dir
--    @exts_dir ||= File.join(loaded_from && base_dir || Gem.dir, "exts")
-+    @exts_dir ||= gems_dir
-   end
- 
-   ##
--- 
-1.7.7.3
-
-
-From 11b4a0cbadd8b1d3320f838881aa60feb6f848e7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
-Date: Wed, 16 Nov 2011 14:52:16 +0100
-Subject: [PATCH 3/6] Simplify the extending of $LOAD_PATH for binary gems.
-
----
- lib/rubygems/specification.rb |   11 +++++------
- 1 files changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index d31b93b..e65ea2d 100644
---- a/lib/rubygems/specification.rb
-+++ b/lib/rubygems/specification.rb
-@@ -843,11 +843,7 @@ class Gem::Specification
-       File.join full_gem_path, path
-     end
- 
--    unless extensions.empty?
--      paths += require_paths.map do |path|
--        File.join ext_dir, path
--      end
--    end
-+    paths << ext_dir unless extensions.empty? || paths.include?(ext_dir)
- 
-     # gem directories must come after -I and ENV['RUBYLIB']
-     insert_index = Gem.load_path_insert_index
-@@ -1291,7 +1287,10 @@ class Gem::Specification
-   # gem directory. eg: /usr/local/lib/ruby/1.8/gems
- 
-   def exts_dir
--    @exts_dir ||= gems_dir
-+    @exts_dir ||= begin
-+      dirs = Gem.default_dirs.detect {|location, paths| paths[:gem_dir] == base_dir}
-+      dirs ? File.join(dirs.last[:ext_dir], 'exts') : gems_dir
-+    end
-   end
- 
-   ##
--- 
-1.7.7.3
-
-
-From 5d46cd2b1ac9517a9cbcfa430261e62bb3a376b8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
-Date: Fri, 9 Dec 2011 16:31:04 +0100
-Subject: [PATCH 4/6] Fix the binary extension search path construction.
-
----
- lib/rubygems/installer.rb     |    2 +-
- lib/rubygems/specification.rb |    4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/lib/rubygems/installer.rb b/lib/rubygems/installer.rb
-index 0063c7f..83b8fd5 100644
---- a/lib/rubygems/installer.rb
-+++ b/lib/rubygems/installer.rb
-@@ -499,7 +499,7 @@ TEXT
-   def build_extensions
-     return if spec.extensions.empty?
-     say "Building native extensions.  This could take a while..."
--    dest_path = spec.ext_dir
-+    dest_path = File.join spec.ext_dir, spec.require_paths.first
-     ran_rake = false # only run rake once
- 
-     spec.extensions.each do |extension|
-diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index e65ea2d..8be2ade 100644
---- a/lib/rubygems/specification.rb
-+++ b/lib/rubygems/specification.rb
-@@ -843,7 +843,7 @@ class Gem::Specification
-       File.join full_gem_path, path
-     end
- 
--    paths << ext_dir unless extensions.empty? || paths.include?(ext_dir)
-+    paths << File.join(ext_dir, require_paths.first) unless extensions.empty? || (ext_dir == full_gem_path)
- 
-     # gem directories must come after -I and ENV['RUBYLIB']
-     insert_index = Gem.load_path_insert_index
-@@ -1279,7 +1279,7 @@ class Gem::Specification
-   # eg: /usr/local/lib/ruby/1.8/exts/mygem-1.0
- 
-   def ext_dir
--    @ext_dir ||= File.join exts_dir, full_name, require_paths.first
-+    @ext_dir ||= File.join exts_dir, full_name
-   end
- 
-   ##
--- 
-1.7.7.3
-
-
-From 6229583633802b45e5a3e5689ab9077347cd9ef7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
-Date: Tue, 13 Dec 2011 12:14:54 +0100
-Subject: [PATCH 5/6] Remove binary extensions during uninstall.
-
----
- lib/rubygems/uninstaller.rb |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/lib/rubygems/uninstaller.rb b/lib/rubygems/uninstaller.rb
-index cc32ea4..94d78e0 100644
---- a/lib/rubygems/uninstaller.rb
-+++ b/lib/rubygems/uninstaller.rb
-@@ -213,6 +213,7 @@ class Gem::Uninstaller
-       File.writable?(spec.base_dir)
- 
-     FileUtils.rm_rf spec.full_gem_path
-+    FileUtils.rm_rf spec.ext_dir
- 
-     # TODO: should this be moved to spec?... I vote eww (also exists in docmgr)
-     old_platform_name = [spec.name,
--- 
-1.7.7.3
-
-
-From bc40e1b9f60a9a04456e3504ffe6ee600b6da269 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?V=C3=ADt=20Ondruch?= <vondruch@redhat.com>
-Date: Tue, 13 Dec 2011 14:27:14 +0100
-Subject: [PATCH 6/6] Avoid dependency on customized operating_system.rb.
-
----
- lib/rubygems/defaults.rb      |   11 +++++++++++
- lib/rubygems/specification.rb |    5 +----
- 2 files changed, 12 insertions(+), 4 deletions(-)
-
-diff --git a/lib/rubygems/defaults.rb b/lib/rubygems/defaults.rb
-index 20b4198..6d8711f 100644
---- a/lib/rubygems/defaults.rb
-+++ b/lib/rubygems/defaults.rb
-@@ -87,6 +87,17 @@ module Gem
-   end
- 
-   ##
-+  # Returns binary extensions dir for specified RubyGems base dir or nil
-+  # if such directory cannot be determined.
-+  #
-+  # By default, the binary extensions are located side by side with their
-+  # Ruby counterparts, therefore nil is returned
-+
-+  def self.default_ext_dir_for base_dir
-+    nil
-+  end
-+
-+  ##
-   # The default system-wide source info cache directory
- 
-   def self.default_system_source_cache_dir
-diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 8be2ade..f54210a 100644
---- a/lib/rubygems/specification.rb
-+++ b/lib/rubygems/specification.rb
-@@ -1287,10 +1287,7 @@ class Gem::Specification
-   # gem directory. eg: /usr/local/lib/ruby/1.8/gems
- 
-   def exts_dir
--    @exts_dir ||= begin
--      dirs = Gem.default_dirs.detect {|location, paths| paths[:gem_dir] == base_dir}
--      dirs ? File.join(dirs.last[:ext_dir], 'exts') : gems_dir
--    end
-+    @exts_dir ||= Gem.default_ext_dir_for(base_dir) || gems_dir
-   end
- 
-   ##
--- 
-1.7.7.3
-
diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb b/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
similarity index 52%
rename from meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
rename to meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
index 834cb71..29f2291 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
@@ -1,20 +1,7 @@
 require ruby.inc
-PR = "${INC_PR}.0"
-
-SRC_URI += "\
-    file://0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch \
-    file://ruby-1.9.3-always-use-i386.patch \
-    file://ruby-1.9.3-disable-versioned-paths.patch \
-    file://ruby-1.9.3-rubygems-1.8.11-uninstaller.patch \
-    file://ruby-1.9.3-custom-rubygems-location.patch \
-    file://rubygems-1.8.11-binary-extensions.patch \
-    file://ruby-1.9.3-mkmf-verbose.patch \
-    file://ruby-1.9.3-install-cross.patch \
-    file://remove-the-dependency-on-dir.patch \
-    file://ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch \
-"
-SRC_URI[md5sum] = "7531f9b1b35b16f3eb3d7bea786babfd"
-SRC_URI[sha256sum] = "9ba118e4aba04c430bc4d5efb09b31a0277e101c9fd2ef3b80b9c684d7ae57a1"
+
+SRC_URI[md5sum] = "b49fc67a834e4f77249eb73eecffb1c9"
+SRC_URI[sha256sum] = "5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27ab746e6c7819ab28"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
@@ -23,6 +10,7 @@ UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
+PACKAGECONFIG[gpm] = "--with-gmp=yes, --with-gmp=no, gmp"
 
 EXTRA_OECONF = "\
     --enable-wide-getaddrinfo \
@@ -45,6 +33,7 @@ FILES_${PN} += "${datadir}/rubygems \
 
 FILES_${PN}-dbg += "${libdir}/ruby/*/.debug \
                     ${libdir}/ruby/*/*/.debug \
-                    ${libdir}/ruby/*/*/*/.debug"
+                    ${libdir}/ruby/*/*/*/.debug \
+                    ${libdir}/ruby/*/*/*/*/.debug"
 
 BBCLASSEXTEND = "native"
-- 
2.3.5



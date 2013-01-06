Received: from mail-yh0-f43.google.com ([209.85.213.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tryhd-0004Wp-5k
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 23:28:40 +0100
Received: by mail-yh0-f43.google.com with SMTP id 27so1031765yhr.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 14:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=XCgImgOMHw1STaQgFtqB694btKqIpwafOj8/K5JafRU=;
	b=cPh46KK6E9LLbynN7Efn+JeoEgNxQiQ29UwJf4MgPOC6GGHKx3Axa/TfixL/uFxnxu
	v+mHGtpaJL+ehydMbuui9EPgcGfJAw9aIwVRq+cnZMOl+xYrqULlUIaYD+x0FSbnOWH+
	YtKRoCC8L3yVnlKAD9oE7nGFstRwFWsCr31vY4cJzDHbQBz7hu3IJr/OYeFsYl9efFO1
	njrol8pJASlgKGlWcL0kLQzREas4T3T5Da6ziWQbXtx5myaA/5Azhcj5CIwY5vheJ8vM
	Tv5weYLtgulIdmxj7iD2/KHavgNtAlyL4NbxHJBiF/MBduYFWN31jaNAXFvTRQQTnX5w
	g3ZA==
X-Received: by 10.236.52.7 with SMTP id d7mr10676045yhc.42.1357510396186;
	Sun, 06 Jan 2013 14:13:16 -0800 (PST)
Received: from localhost.localdomain ([187.23.158.26])
	by mx.google.com with ESMTPS id x9sm64284375yhl.17.2013.01.06.14.13.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 14:13:14 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 20:12:58 -0200
Message-Id: <1357510379-14744-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1357510379-14744-1-git-send-email-otavio@ossystems.com.br>
References: <1357510379-14744-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-browser][PATCH 2/3] firefox: Update to 10.0.11esr
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Jan 2013 22:28:41 -0000
X-List-Received-Date: Sun, 06 Jan 2013 22:28:41 -0000

This updates the recipe in sync with Debian 10.0.11esr-1 package.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-mozilla/firefox/firefox/configure.patch    | 5662 ++++++++++++++++++--
 ...Add-a-2-minutes-timeout-on-xpcshell-tests.patch |    2 +-
 ...-preferences-directory-for-applications-p.patch |    2 +-
 .../Add-soname-to-appropriate-libraries.patch      |    4 +-
 ...com-being-excluded-from-linked-libraries-.patch |    2 +-
 ...-sessionstore-data-to-keep-windows-out-of.patch |    4 +-
 ...Use-Preprocessor.py-filters-in-defines-an.patch |  117 +
 ...things-during-configure-when-using-libxul.patch |    8 +-
 ...me-detection-of-2-bytes-wchar_t-and-char1.patch |    2 +-
 .../Don-t-build-example-component.patch            |    2 +-
 ...-out-when-run-time-libsqlite-is-older-tha.patch |    2 +-
 .../Don-t-install-system-profile.patch             |    2 +-
 ...ter-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch |    6 +-
 ...sition-to-etc-appname-searchplugins-more-.patch |   73 +
 ...em-libjpeg-libpng-and-zlib-version-checki.patch |    4 +-
 ...shell-when-running-make-install-from-js-s.patch |    6 +-
 ...sing-nanojit-and-.tbl-headers-from-js-src.patch |    8 +-
 ...bution-search-plugins-from-etc-appname-se.patch |   50 +
 ...ble-for-xulrunner-base-version-in-various.patch |   10 +-
 .../firefox/firefox/firefox.gcc-4.7.patch          |   57 -
 ...-with-mesa-assuming-users-will-have-updat.patch |   26 +
 ...Try-getting-general.useragent.locale-as-a.patch |   41 +
 ...Disable-dead-symbol-removal-when-failing-.patch |   22 -
 ...Block-OpenGL-1-drivers-explicitly-to-stee.patch |   69 +
 ...TreePanel.jsm-uses-a-resource-url-that-ou.patch |   22 -
 ...Fix-for-error-ftruncate-was-not-declared-.patch |   26 +
 ...Try-creating-a-named-cursor-before-a-bitm.patch |   85 +
 ...Don-t-crash-an-app-using-libxul-because-o.patch |   23 +
 ...Bump-required-libvpx-version-to-1.0.0.-r-.patch |    4 +-
 ...gcc-4.7-build-failures-missing-headers-.-.patch |   52 +
 ...Allow-to-build-with-system-python-ply-lib.patch |   82 +
 ...Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch |   24 +
 ...Block-the-Nouveau-3D-driver-as-it-s-insta.patch |   56 +
 ...fix-build-failures-with-Clang-and-GCC-4.7.patch |   76 +
 ...47322-Fix-jemalloc-mmap-wrapper-for-s390x.patch |   25 +
 ...Only-export-TabMessageUtils.h-in-mozilla-.patch |   49 +
 ...sts-using-CurProcD-where-GreD-should-be-u.patch |    8 +-
 ...ent-libraries-with-their-real-path-to-avo.patch |   23 +
 ...-launch-applications-set-in-HOME-.mailcap.patch |    2 +-
 ...a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch |  351 ++
 ...hich-phishing-shavar-to-use-depending-on-.patch |   12 +-
 ...pa-ia64-s390-and-sparc-defines-in-ipc-chr.patch |   61 -
 .../Add-xptcall-support-for-SH4-processors.patch   |    2 +-
 ...Use-a-pool-size-of-16kB-on-ia64-for-bump-.patch |   22 -
 ...LDRH-STRH-LDRSB-STRSB-are-supported-on-AR.patch |   49 -
 ...Reimplement-NS_InvokeByIndex-in-C-on-S390.patch |   74 -
 ...Don-t-require-16-bytes-alignment-for-VMFr.patch |    2 +-
 ...-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch |    2 +-
 ...Fix-build-failure-on-platforms-without-YA.patch |    4 +-
 ...Avoid-invalid-conversion-from-const-size_.patch |    4 +-
 ...Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch |    2 +-
 ...Crash-on-s390x-nsXPCComponents-AttachNewC.patch |   78 +
 ...Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch |    2 +-
 ...Properly-align-XPCLazyCallContext-mData.-.patch |   40 +
 ...-Linux-failure-to-build-because-of-ipc-ch.patch |    2 +-
 .../firefox/firefox/porting/Revert-bz-164580.patch |   34 -
 ...-disable-extensions-in-system-directories.patch |   21 +
 ....locale.matchOS-and-report-the-locale-cor.patch |    2 +-
 ...ral.useragent.locale-prefs-from-firefox-..patch |    4 +-
 .../firefox/prefs/Set-DPI-to-system-settings.patch |    6 +-
 .../Set-javascript.options.showInConsole.patch     |    6 +-
 recipes-mozilla/firefox/firefox/vendor.js          |    2 +
 .../{firefox_10.0.2.bb => firefox_10.0.11esr.bb}   |   36 +-
 63 files changed, 6606 insertions(+), 950 deletions(-)
 create mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch
 create mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Handle-transition-to-etc-appname-searchplugins-more-.patch
 create mode 100644 recipes-mozilla/firefox/firefox/debian-hacks/Load-distribution-search-plugins-from-etc-appname-se.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/firefox.gcc-4.7.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-690682-Disable-dead-symbol-removal-when-failing-.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-703633-TreePanel.jsm-uses-a-resource-url-that-ou.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch
 create mode 100644 recipes-mozilla/firefox/firefox/fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Add-mips-hppa-ia64-s390-and-sparc-defines-in-ipc-chr.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-680917-Use-a-pool-size-of-16kB-on-ia64-for-bump-.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-694533-LDRH-STRH-LDRSB-STRSB-are-supported-on-AR.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-696393-Reimplement-NS_InvokeByIndex-in-C-on-S390.patch
 create mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch
 create mode 100644 recipes-mozilla/firefox/firefox/porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch
 delete mode 100644 recipes-mozilla/firefox/firefox/porting/Revert-bz-164580.patch
 create mode 100644 recipes-mozilla/firefox/firefox/prefs/Don-t-auto-disable-extensions-in-system-directories.patch
 rename recipes-mozilla/firefox/{firefox_10.0.2.bb => firefox_10.0.11esr.bb} (74%)

diff --git a/recipes-mozilla/firefox/firefox/configure.patch b/recipes-mozilla/firefox/firefox/configure.patch
index d835dfe..966b728 100644
--- a/recipes-mozilla/firefox/firefox/configure.patch
+++ b/recipes-mozilla/firefox/firefox/configure.patch
@@ -1,8 +1,4588 @@
 diff --git a/configure b/configure
-index b8e7773..67ba888 100755
+index 4855c99..a5282b6 100755
 --- a/configure
 +++ b/configure
-@@ -13173,6 +13173,7 @@ fi
+@@ -54,6 +54,8 @@ ac_help="$ac_help
+                               600: Windows Vista
+                               601: Windows 7"
+ ac_help="$ac_help
++  --with-system-ply       Use system installed python ply library"
++ac_help="$ac_help
+   --enable-macos-target=VER (default=10.5)
+                           Set the minimum MacOS version needed at runtime"
+ ac_help="$ac_help
+@@ -998,7 +1000,7 @@ else { echo "configure: error: can not run $ac_config_sub" 1>&2; exit 1; }
+ fi
+ 
+ echo $ac_n "checking host system type""... $ac_c" 1>&6
+-echo "configure:1002: checking host system type" >&5
++echo "configure:1004: checking host system type" >&5
+ 
+ host_alias=$host
+ case "$host_alias" in
+@@ -1019,7 +1021,7 @@ host_os=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
+ echo "$ac_t""$host" 1>&6
+ 
+ echo $ac_n "checking target system type""... $ac_c" 1>&6
+-echo "configure:1023: checking target system type" >&5
++echo "configure:1025: checking target system type" >&5
+ 
+ target_alias=$target
+ case "$target_alias" in
+@@ -1037,7 +1039,7 @@ target_os=`echo $target | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
+ echo "$ac_t""$target" 1>&6
+ 
+ echo $ac_n "checking build system type""... $ac_c" 1>&6
+-echo "configure:1041: checking build system type" >&5
++echo "configure:1043: checking build system type" >&5
+ 
+ build_alias=$build
+ case "$build_alias" in
+@@ -1117,7 +1119,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1121: checking for $ac_word" >&5
++echo "configure:1123: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_AWK'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1247,7 +1249,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1251: checking for $ac_word" >&5
++echo "configure:1253: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_PERL'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1405,7 +1407,7 @@ case "$target" in
+ 
+     if test -z "$android_toolchain" ; then
+         echo $ac_n "checking for android toolchain directory""... $ac_c" 1>&6
+-echo "configure:1409: checking for android toolchain directory" >&5
++echo "configure:1411: checking for android toolchain directory" >&5
+ 
+         kernel_name=`uname -s | tr "[:upper:]" "[:lower:]"`
+ 
+@@ -1425,7 +1427,7 @@ echo "configure:1409: checking for android toolchain directory" >&5
+ 
+     if test -z "$android_platform" ; then
+         echo $ac_n "checking for android platform directory""... $ac_c" 1>&6
+-echo "configure:1429: checking for android platform directory" >&5
++echo "configure:1431: checking for android platform directory" >&5
+ 
+         android_platform="$android_ndk"/build/platforms/android-"$android_version"/arch-"$target_cpu"
+ 
+@@ -1497,7 +1499,7 @@ EOF
+     # Extract the first word of "objcopy", so it can be a program name with args.
+ set dummy objcopy; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1501: checking for $ac_word" >&5
++echo "configure:1503: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_OBJCOPY'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1554,13 +1556,13 @@ if test -n "$CROSS_COMPILE" -a "$target" != "$host"; then
+     _SAVE_LDFLAGS="$LDFLAGS"
+ 
+     echo $ac_n "checking for host c compiler""... $ac_c" 1>&6
+-echo "configure:1558: checking for host c compiler" >&5
++echo "configure:1560: checking for host c compiler" >&5
+     for ac_prog in $HOST_CC gcc cc /usr/ucb/cc cl icc
+ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1564: checking for $ac_word" >&5
++echo "configure:1566: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_HOST_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1595,13 +1597,13 @@ test -n "$HOST_CC" || HOST_CC=""""
+     fi
+     echo "$ac_t""$HOST_CC" 1>&6
+     echo $ac_n "checking for host c++ compiler""... $ac_c" 1>&6
+-echo "configure:1599: checking for host c++ compiler" >&5
++echo "configure:1601: checking for host c++ compiler" >&5
+     for ac_prog in $HOST_CXX $CCC c++ g++ gcc CC cxx cc++ cl icc
+ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1605: checking for $ac_word" >&5
++echo "configure:1607: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_HOST_CXX'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1653,7 +1655,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1657: checking for $ac_word" >&5
++echo "configure:1659: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_HOST_RANLIB'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1688,7 +1690,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1692: checking for $ac_word" >&5
++echo "configure:1694: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_HOST_AR'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1723,16 +1725,16 @@ test -n "$HOST_AR" || HOST_AR="ar"
+     LDFLAGS="$HOST_LDFLAGS"
+ 
+     echo $ac_n "checking whether the host c compiler ($HOST_CC $HOST_CFLAGS $HOST_LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:1727: checking whether the host c compiler ($HOST_CC $HOST_CFLAGS $HOST_LDFLAGS) works" >&5
++echo "configure:1729: checking whether the host c compiler ($HOST_CC $HOST_CFLAGS $HOST_LDFLAGS) works" >&5
+     cat > conftest.$ac_ext <<EOF
+-#line 1729 "configure"
++#line 1731 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return(0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:1736: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:1738: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_prog_hostcc_works=1 echo "$ac_t""yes" 1>&6
+ else
+@@ -1747,16 +1749,16 @@ rm -f conftest*
+     CFLAGS="$HOST_CXXFLAGS"
+ 
+     echo $ac_n "checking whether the host c++ compiler ($HOST_CXX $HOST_CXXFLAGS $HOST_LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:1751: checking whether the host c++ compiler ($HOST_CXX $HOST_CXXFLAGS $HOST_LDFLAGS) works" >&5
++echo "configure:1753: checking whether the host c++ compiler ($HOST_CXX $HOST_CXXFLAGS $HOST_LDFLAGS) works" >&5
+     cat > conftest.$ac_ext <<EOF
+-#line 1753 "configure"
++#line 1755 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return(0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:1760: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:1762: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_prog_hostcxx_works=1 echo "$ac_t""yes" 1>&6
+ else
+@@ -1785,7 +1787,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1789: checking for $ac_word" >&5
++echo "configure:1791: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1819,7 +1821,7 @@ test -n "$CC" || CC=":"
+     # Extract the first word of "gcc", so it can be a program name with args.
+ set dummy gcc; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1823: checking for $ac_word" >&5
++echo "configure:1825: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1849,7 +1851,7 @@ if test -z "$CC"; then
+   # Extract the first word of "cc", so it can be a program name with args.
+ set dummy cc; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1853: checking for $ac_word" >&5
++echo "configure:1855: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1900,7 +1902,7 @@ fi
+       # Extract the first word of "cl", so it can be a program name with args.
+ set dummy cl; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:1904: checking for $ac_word" >&5
++echo "configure:1906: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1932,7 +1934,7 @@ fi
+ fi
+ 
+ echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:1936: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
++echo "configure:1938: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
+ 
+ ac_ext=c
+ # CFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+@@ -1943,12 +1945,12 @@ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ cat > conftest.$ac_ext << EOF
+ 
+-#line 1947 "configure"
++#line 1949 "configure"
+ #include "confdefs.h"
+ 
+ main(){return(0);}
+ EOF
+-if { (eval echo configure:1952: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:1954: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+   if (./conftest; exit) 2>/dev/null; then
+@@ -1974,12 +1976,12 @@ if test $ac_cv_prog_cc_works = no; then
+   { echo "configure: error: installation or configuration problem: C compiler cannot create executables." 1>&2; exit 1; }
+ fi
+ echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
+-echo "configure:1978: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
++echo "configure:1980: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
+ echo "$ac_t""$ac_cv_prog_cc_cross" 1>&6
+ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ echo $ac_n "checking whether we are using GNU C""... $ac_c" 1>&6
+-echo "configure:1983: checking whether we are using GNU C" >&5
++echo "configure:1985: checking whether we are using GNU C" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_gcc'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -1988,7 +1990,7 @@ else
+   yes;
+ #endif
+ EOF
+-if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:1992: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
++if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:1994: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
+   ac_cv_prog_gcc=yes
+ else
+   ac_cv_prog_gcc=no
+@@ -2007,7 +2009,7 @@ ac_test_CFLAGS="${CFLAGS+set}"
+ ac_save_CFLAGS="$CFLAGS"
+ CFLAGS=
+ echo $ac_n "checking whether ${CC-cc} accepts -g""... $ac_c" 1>&6
+-echo "configure:2011: checking whether ${CC-cc} accepts -g" >&5
++echo "configure:2013: checking whether ${CC-cc} accepts -g" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_cc_g'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2043,7 +2045,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2047: checking for $ac_word" >&5
++echo "configure:2049: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CXX'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2079,7 +2081,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2083: checking for $ac_word" >&5
++echo "configure:2085: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CXX'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2111,7 +2113,7 @@ test -n "$CXX" || CXX="gcc"
+ 
+ 
+ echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:2115: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
++echo "configure:2117: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
+ 
+ ac_ext=C
+ # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+@@ -2122,12 +2124,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ cat > conftest.$ac_ext << EOF
+ 
+-#line 2126 "configure"
++#line 2128 "configure"
+ #include "confdefs.h"
+ 
+ int main(){return(0);}
+ EOF
+-if { (eval echo configure:2131: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:2133: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cxx_works=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+   if (./conftest; exit) 2>/dev/null; then
+@@ -2153,12 +2155,12 @@ if test $ac_cv_prog_cxx_works = no; then
+   { echo "configure: error: installation or configuration problem: C++ compiler cannot create executables." 1>&2; exit 1; }
+ fi
+ echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
+-echo "configure:2157: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
++echo "configure:2159: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
+ echo "$ac_t""$ac_cv_prog_cxx_cross" 1>&6
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ echo $ac_n "checking whether we are using GNU C++""... $ac_c" 1>&6
+-echo "configure:2162: checking whether we are using GNU C++" >&5
++echo "configure:2164: checking whether we are using GNU C++" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_gxx'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2167,7 +2169,7 @@ else
+   yes;
+ #endif
+ EOF
+-if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:2171: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
++if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:2173: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
+   ac_cv_prog_gxx=yes
+ else
+   ac_cv_prog_gxx=no
+@@ -2186,7 +2188,7 @@ ac_test_CXXFLAGS="${CXXFLAGS+set}"
+ ac_save_CXXFLAGS="$CXXFLAGS"
+ CXXFLAGS=
+ echo $ac_n "checking whether ${CXX-g++} accepts -g""... $ac_c" 1>&6
+-echo "configure:2190: checking whether ${CXX-g++} accepts -g" >&5
++echo "configure:2192: checking whether ${CXX-g++} accepts -g" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_cxx_g'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2227,7 +2229,7 @@ for ac_declaration in \
+    'void exit (int);'
+ do
+   cat > conftest.$ac_ext <<EOF
+-#line 2231 "configure"
++#line 2233 "configure"
+ #include "confdefs.h"
+ #include <stdlib.h>
+ $ac_declaration
+@@ -2235,7 +2237,7 @@ int main() {
+ exit (42);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:2239: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:2241: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -2245,14 +2247,14 @@ else
+ fi
+ rm -f conftest*
+   cat > conftest.$ac_ext <<EOF
+-#line 2249 "configure"
++#line 2251 "configure"
+ #include "confdefs.h"
+ $ac_declaration
+ int main() {
+ exit (42);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:2256: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:2258: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   break
+ else
+@@ -2281,7 +2283,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2285: checking for $ac_word" >&5
++echo "configure:2287: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_RANLIB'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2316,7 +2318,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2320: checking for $ac_word" >&5
++echo "configure:2322: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_AR'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2351,7 +2353,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2355: checking for $ac_word" >&5
++echo "configure:2357: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_AS'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2405,7 +2407,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2409: checking for $ac_word" >&5
++echo "configure:2411: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_LD'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2440,7 +2442,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2444: checking for $ac_word" >&5
++echo "configure:2446: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_STRIP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2475,7 +2477,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2479: checking for $ac_word" >&5
++echo "configure:2481: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_WINDRES'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2513,7 +2515,7 @@ else
+     # Extract the first word of "gcc", so it can be a program name with args.
+ set dummy gcc; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2517: checking for $ac_word" >&5
++echo "configure:2519: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2543,7 +2545,7 @@ if test -z "$CC"; then
+   # Extract the first word of "cc", so it can be a program name with args.
+ set dummy cc; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2547: checking for $ac_word" >&5
++echo "configure:2549: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2594,7 +2596,7 @@ fi
+       # Extract the first word of "cl", so it can be a program name with args.
+ set dummy cl; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2598: checking for $ac_word" >&5
++echo "configure:2600: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CC'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2626,7 +2628,7 @@ fi
+ fi
+ 
+ echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:2630: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
++echo "configure:2632: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) works" >&5
+ 
+ ac_ext=c
+ # CFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+@@ -2637,12 +2639,12 @@ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ cat > conftest.$ac_ext << EOF
+ 
+-#line 2641 "configure"
++#line 2643 "configure"
+ #include "confdefs.h"
+ 
+ main(){return(0);}
+ EOF
+-if { (eval echo configure:2646: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:2648: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+   if (./conftest; exit) 2>/dev/null; then
+@@ -2668,12 +2670,12 @@ if test $ac_cv_prog_cc_works = no; then
+   { echo "configure: error: installation or configuration problem: C compiler cannot create executables." 1>&2; exit 1; }
+ fi
+ echo $ac_n "checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
+-echo "configure:2672: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
++echo "configure:2674: checking whether the C compiler ($CC $CFLAGS $LDFLAGS) is a cross-compiler" >&5
+ echo "$ac_t""$ac_cv_prog_cc_cross" 1>&6
+ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ echo $ac_n "checking whether we are using GNU C""... $ac_c" 1>&6
+-echo "configure:2677: checking whether we are using GNU C" >&5
++echo "configure:2679: checking whether we are using GNU C" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_gcc'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2682,7 +2684,7 @@ else
+   yes;
+ #endif
+ EOF
+-if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:2686: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
++if { ac_try='${CC-cc} -E conftest.c'; { (eval echo configure:2688: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
+   ac_cv_prog_gcc=yes
+ else
+   ac_cv_prog_gcc=no
+@@ -2701,7 +2703,7 @@ ac_test_CFLAGS="${CFLAGS+set}"
+ ac_save_CFLAGS="$CFLAGS"
+ CFLAGS=
+ echo $ac_n "checking whether ${CC-cc} accepts -g""... $ac_c" 1>&6
+-echo "configure:2705: checking whether ${CC-cc} accepts -g" >&5
++echo "configure:2707: checking whether ${CC-cc} accepts -g" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_cc_g'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2737,7 +2739,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2741: checking for $ac_word" >&5
++echo "configure:2743: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_CXX'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2769,7 +2771,7 @@ test -n "$CXX" || CXX="gcc"
+ 
+ 
+ echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works""... $ac_c" 1>&6
+-echo "configure:2773: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
++echo "configure:2775: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) works" >&5
+ 
+ ac_ext=C
+ # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+@@ -2780,12 +2782,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ cat > conftest.$ac_ext << EOF
+ 
+-#line 2784 "configure"
++#line 2786 "configure"
+ #include "confdefs.h"
+ 
+ int main(){return(0);}
+ EOF
+-if { (eval echo configure:2789: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:2791: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cxx_works=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+   if (./conftest; exit) 2>/dev/null; then
+@@ -2811,12 +2813,12 @@ if test $ac_cv_prog_cxx_works = no; then
+   { echo "configure: error: installation or configuration problem: C++ compiler cannot create executables." 1>&2; exit 1; }
+ fi
+ echo $ac_n "checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler""... $ac_c" 1>&6
+-echo "configure:2815: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
++echo "configure:2817: checking whether the C++ compiler ($CXX $CXXFLAGS $LDFLAGS) is a cross-compiler" >&5
+ echo "$ac_t""$ac_cv_prog_cxx_cross" 1>&6
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ echo $ac_n "checking whether we are using GNU C++""... $ac_c" 1>&6
+-echo "configure:2820: checking whether we are using GNU C++" >&5
++echo "configure:2822: checking whether we are using GNU C++" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_gxx'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2825,7 +2827,7 @@ else
+   yes;
+ #endif
+ EOF
+-if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:2829: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
++if { ac_try='${CXX-g++} -E conftest.C'; { (eval echo configure:2831: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } | egrep yes >/dev/null 2>&1; then
+   ac_cv_prog_gxx=yes
+ else
+   ac_cv_prog_gxx=no
+@@ -2844,7 +2846,7 @@ ac_test_CXXFLAGS="${CXXFLAGS+set}"
+ ac_save_CXXFLAGS="$CXXFLAGS"
+ CXXFLAGS=
+ echo $ac_n "checking whether ${CXX-g++} accepts -g""... $ac_c" 1>&6
+-echo "configure:2848: checking whether ${CXX-g++} accepts -g" >&5
++echo "configure:2850: checking whether ${CXX-g++} accepts -g" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_cxx_g'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2885,7 +2887,7 @@ for ac_declaration in \
+    'void exit (int);'
+ do
+   cat > conftest.$ac_ext <<EOF
+-#line 2889 "configure"
++#line 2891 "configure"
+ #include "confdefs.h"
+ #include <stdlib.h>
+ $ac_declaration
+@@ -2893,7 +2895,7 @@ int main() {
+ exit (42);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:2897: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:2899: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -2903,14 +2905,14 @@ else
+ fi
+ rm -f conftest*
+   cat > conftest.$ac_ext <<EOF
+-#line 2907 "configure"
++#line 2909 "configure"
+ #include "confdefs.h"
+ $ac_declaration
+ int main() {
+ exit (42);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:2914: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:2916: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   break
+ else
+@@ -2929,7 +2931,7 @@ fi
+     # Extract the first word of "ranlib", so it can be a program name with args.
+ set dummy ranlib; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2933: checking for $ac_word" >&5
++echo "configure:2935: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_RANLIB'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -2961,7 +2963,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:2965: checking for $ac_word" >&5
++echo "configure:2967: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_AS'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3015,7 +3017,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:3019: checking for $ac_word" >&5
++echo "configure:3021: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_AR'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3050,7 +3052,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:3054: checking for $ac_word" >&5
++echo "configure:3056: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_LD'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3085,7 +3087,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:3089: checking for $ac_word" >&5
++echo "configure:3091: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_STRIP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3120,7 +3122,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:3124: checking for $ac_word" >&5
++echo "configure:3126: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_WINDRES'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3268,7 +3270,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:3272: checking for $ac_word" >&5
++echo "configure:3274: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_MIDL'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3310,14 +3312,14 @@ ac_link='${CC-cc} -o conftest${ac_exeext} $CFLAGS $CPPFLAGS $LDFLAGS conftest.$a
+ cross_compiling=$ac_cv_prog_cc_cross
+ 
+         cat > conftest.$ac_ext <<EOF
+-#line 3314 "configure"
++#line 3316 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+ int main() {
+  printf("Hello World\n"); 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3321: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:3323: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -3335,14 +3337,14 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+         cat > conftest.$ac_ext <<EOF
+-#line 3339 "configure"
++#line 3341 "configure"
+ #include "confdefs.h"
+ #include <new.h>
+ int main() {
+  unsigned *test = new unsigned(42); 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3346: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:3348: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -3473,7 +3475,7 @@ EOF
+         _MIDL_REV_VERSION=`echo ${_MIDL_FULL_VERSION} | $AWK -F\. '{ print $3 }'`
+         # Add flags if necessary
+         echo $ac_n "checking for midl flags""... $ac_c" 1>&6
+-echo "configure:3477: checking for midl flags" >&5
++echo "configure:3479: checking for midl flags" >&5
+         case "$target" in
+         i*86-*)
+             if test \( "$_MIDL_MAJOR_VERSION" = "7" -a "$_MIDL_MINOR_VERSION" = "00" -a "$_MIDL_REV_VERSION" = "0499" \); then
+@@ -3500,19 +3502,19 @@ echo "configure:3477: checking for midl flags" >&5
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:3504: checking for $ac_hdr" >&5
++echo "configure:3506: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 3509 "configure"
++#line 3511 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3516: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:3518: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -3544,7 +3546,7 @@ EOF
+             # This is done because the Windows 7 beta SDK reports its
+             # NTDDI_MAXVER to be 0x06000100 instead of 0x06010000, as it should
+             echo $ac_n "checking for highest Windows version supported by this SDK""... $ac_c" 1>&6
+-echo "configure:3548: checking for highest Windows version supported by this SDK" >&5
++echo "configure:3550: checking for highest Windows version supported by this SDK" >&5
+ if eval "test \"`echo '$''{'ac_cv_winsdk_maxver'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3574,19 +3576,19 @@ echo "$ac_t""$ac_cv_winsdk_maxver" 1>&6
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:3578: checking for $ac_hdr" >&5
++echo "configure:3580: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 3583 "configure"
++#line 3585 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3590: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:3592: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -3623,7 +3625,7 @@ EOF
+         unset _MSVC_VER_FILTER
+ 
+         echo $ac_n "checking for std::_Throw""... $ac_c" 1>&6
+-echo "configure:3627: checking for std::_Throw" >&5
++echo "configure:3629: checking for std::_Throw" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_std__Throw'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3639,14 +3641,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
+                 _SAVE_CXXFLAGS="$CXXFLAGS"
+                 CXXFLAGS="${CXXFLAGS} -D_HAS_EXCEPTIONS=0"
+                 cat > conftest.$ac_ext <<EOF
+-#line 3643 "configure"
++#line 3645 "configure"
+ #include "confdefs.h"
+ #include <exception>
+ int main() {
+ std::_Throw(std::exception()); return 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3650: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:3652: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_have_std__Throw="yes"
+ else
+@@ -3671,7 +3673,7 @@ echo "$ac_t""$ac_cv_have_std__Throw" 1>&6
+ 
+         if test "$ac_cv_have_std__Throw" = "yes"; then
+             echo $ac_n "checking for |class __declspec(dllimport) exception| bug""... $ac_c" 1>&6
+-echo "configure:3675: checking for |class __declspec(dllimport) exception| bug" >&5
++echo "configure:3677: checking for |class __declspec(dllimport) exception| bug" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_dllimport_exception_bug'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3687,14 +3689,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
+                     _SAVE_CXXFLAGS="$CXXFLAGS"
+                     CXXFLAGS="${CXXFLAGS} -D_HAS_EXCEPTIONS=0"
+                     cat > conftest.$ac_ext <<EOF
+-#line 3691 "configure"
++#line 3693 "configure"
+ #include "confdefs.h"
+ #include <vector>
+ int main() {
+ std::vector<int> v; return v.at(1);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3698: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:3700: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_have_dllimport_exception_bug="no"
+ else
+@@ -3726,7 +3728,7 @@ EOF
+             fi
+         else
+             echo $ac_n "checking for overridable _RAISE""... $ac_c" 1>&6
+-echo "configure:3730: checking for overridable _RAISE" >&5
++echo "configure:3732: checking for overridable _RAISE" >&5
+ if eval "test \"`echo '$''{'ac_cv_have__RAISE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -3742,7 +3744,7 @@ cross_compiling=$ac_cv_prog_cxx_cross
+                     _SAVE_CXXFLAGS="$CXXFLAGS"
+                     CXXFLAGS="${CXXFLAGS} -D_HAS_EXCEPTIONS=0"
+                     cat > conftest.$ac_ext <<EOF
+-#line 3746 "configure"
++#line 3748 "configure"
+ #include "confdefs.h"
+ #include <xstddef>
+                                     #undef _RAISE
+@@ -3753,7 +3755,7 @@ int main() {
+ std::vector<int> v; return v.at(1);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3757: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:3759: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_have__RAISE="no"
+ else
+@@ -3795,9 +3797,9 @@ EOF
+         _W32API_MAJOR_VERSION=`echo $W32API_VERSION | $AWK -F\. '{ print $1 }'`
+         _W32API_MINOR_VERSION=`echo $W32API_VERSION | $AWK -F\. '{ print $2 }'`
+         echo $ac_n "checking for w32api version >= $W32API_VERSION""... $ac_c" 1>&6
+-echo "configure:3799: checking for w32api version >= $W32API_VERSION" >&5
++echo "configure:3801: checking for w32api version >= $W32API_VERSION" >&5
+         cat > conftest.$ac_ext <<EOF
+-#line 3801 "configure"
++#line 3803 "configure"
+ #include "confdefs.h"
+ #include <w32api.h>
+ int main() {
+@@ -3809,7 +3811,7 @@ int main() {
+             
+ ; return 0; }
+ EOF
+-if { (eval echo configure:3813: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:3815: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+    res=yes 
+ else
+@@ -3825,7 +3827,7 @@ rm -f conftest*
+         fi
+         # Check windres version
+         echo $ac_n "checking for windres version >= $WINDRES_VERSION""... $ac_c" 1>&6
+-echo "configure:3829: checking for windres version >= $WINDRES_VERSION" >&5
++echo "configure:3831: checking for windres version >= $WINDRES_VERSION" >&5
+         _WINDRES_VERSION=`${WINDRES} --version 2>&1 | grep -i windres 2>/dev/null | $AWK '{ print $3 }'`
+         echo "$ac_t""$_WINDRES_VERSION" 1>&6
+         _WINDRES_MAJOR_VERSION=`echo $_WINDRES_VERSION | $AWK -F\. '{ print $1 }'`
+@@ -3864,7 +3866,7 @@ EOF
+     # If the maximum version supported by this SDK is lower than the target
+     # version, error out
+     echo $ac_n "checking for Windows SDK being recent enough""... $ac_c" 1>&6
+-echo "configure:3868: checking for Windows SDK being recent enough" >&5
++echo "configure:3870: checking for Windows SDK being recent enough" >&5
+     if $PERL -e "exit(0x$MOZ_WINSDK_TARGETVER > $MOZ_WINSDK_MAXVER)"; then
+         echo "$ac_t"""yes"" 1>&6
+     else
+@@ -3893,7 +3895,7 @@ EOF
+ esac
+ 
+ echo $ac_n "checking how to run the C preprocessor""... $ac_c" 1>&6
+-echo "configure:3897: checking how to run the C preprocessor" >&5
++echo "configure:3899: checking how to run the C preprocessor" >&5
+ # On Suns, sometimes $CPP names a directory.
+ if test -n "$CPP" && test -d "$CPP"; then
+   CPP=
+@@ -3908,13 +3910,13 @@ else
+   # On the NeXT, cc -E runs the code through the compiler's parser,
+   # not just through cpp.
+   cat > conftest.$ac_ext <<EOF
+-#line 3912 "configure"
++#line 3914 "configure"
+ #include "confdefs.h"
+ #include <assert.h>
+ Syntax Error
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3918: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3920: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   :
+@@ -3925,13 +3927,13 @@ else
+   rm -rf conftest*
+   CPP="${CC-cc} -E -traditional-cpp"
+   cat > conftest.$ac_ext <<EOF
+-#line 3929 "configure"
++#line 3931 "configure"
+ #include "confdefs.h"
+ #include <assert.h>
+ Syntax Error
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3935: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3937: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   :
+@@ -3942,13 +3944,13 @@ else
+   rm -rf conftest*
+   CPP="${CC-cc} -nologo -E"
+   cat > conftest.$ac_ext <<EOF
+-#line 3946 "configure"
++#line 3948 "configure"
+ #include "confdefs.h"
+ #include <assert.h>
+ Syntax Error
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3952: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3954: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   :
+@@ -3973,7 +3975,7 @@ fi
+ echo "$ac_t""$CPP" 1>&6
+ 
+ echo $ac_n "checking how to run the C++ preprocessor""... $ac_c" 1>&6
+-echo "configure:3977: checking how to run the C++ preprocessor" >&5
++echo "configure:3979: checking how to run the C++ preprocessor" >&5
+ if test -z "$CXXCPP"; then
+ if eval "test \"`echo '$''{'ac_cv_prog_CXXCPP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -3986,12 +3988,12 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
+ cross_compiling=$ac_cv_prog_cxx_cross
+   CXXCPP="${CXX-g++} -E"
+   cat > conftest.$ac_ext <<EOF
+-#line 3990 "configure"
++#line 3992 "configure"
+ #include "confdefs.h"
+ #include <stdlib.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:3995: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:3997: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   :
+@@ -4068,7 +4070,7 @@ fi # COMPILE_ENVIRONMENT
+ # SVR4 /usr/ucb/install, which tries to use the nonexistent group "staff"
+ # ./install, which can be erroneously created by make from ./install.sh.
+ echo $ac_n "checking for a BSD compatible install""... $ac_c" 1>&6
+-echo "configure:4072: checking for a BSD compatible install" >&5
++echo "configure:4074: checking for a BSD compatible install" >&5
+ if test -z "$INSTALL"; then
+ if eval "test \"`echo '$''{'ac_cv_path_install'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -4121,7 +4123,7 @@ test -z "$INSTALL_SCRIPT" && INSTALL_SCRIPT='${INSTALL_PROGRAM}'
+ test -z "$INSTALL_DATA" && INSTALL_DATA='${INSTALL} -m 644'
+ 
+ echo $ac_n "checking whether ln -s works""... $ac_c" 1>&6
+-echo "configure:4125: checking whether ln -s works" >&5
++echo "configure:4127: checking whether ln -s works" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_LN_S'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4144,7 +4146,7 @@ fi
+ 
+ if test -z "$TINDERBOX_SKIP_PERL_VERSION_CHECK"; then
+ echo $ac_n "checking for minimum required perl version >= $PERL_VERSION""... $ac_c" 1>&6
+-echo "configure:4148: checking for minimum required perl version >= $PERL_VERSION" >&5
++echo "configure:4150: checking for minimum required perl version >= $PERL_VERSION" >&5
+ _perl_version=`PERL_VERSION=$PERL_VERSION $PERL -e 'print "$]"; if ($] >= $ENV{PERL_VERSION}) { exit(0); } else { exit(1); }' 2>&5`
+ _perl_res=$?
+ echo "$ac_t""$_perl_version" 1>&6
+@@ -4155,7 +4157,7 @@ fi
+ fi
+ 
+ echo $ac_n "checking for full perl installation""... $ac_c" 1>&6
+-echo "configure:4159: checking for full perl installation" >&5
++echo "configure:4161: checking for full perl installation" >&5
+ _perl_archlib=`$PERL -e 'use Config; if ( -d $Config{archlib} ) { exit(0); } else { exit(1); }' 2>&5`
+ _perl_res=$?
+ if test "$_perl_res" != 0; then
+@@ -4170,7 +4172,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4174: checking for $ac_word" >&5
++echo "configure:4176: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_PYTHON'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4222,6 +4224,25 @@ if test -z "$PYTHON"; then
+     { echo "configure: error: python was not found in \$PATH" 1>&2; exit 1; }
+ fi
+ 
++# Check whether --with-system-ply or --without-system-ply was given.
++if test "${with_system_ply+set}" = set; then
++  withval="$with_system_ply"
++  if test "$withval" = "yes"; then
++    if $PYTHON -c 'import ply' 2>&5; then
++         MOZ_SYSTEM_PLY=1
++     else
++         { echo "configure: error: python ply library is not found but --with-system-ply was requested" 1>&2; exit 1; }
++     fi
++  elif test "$withval" = "no"; then
++    :
++  else
++    { echo "configure: error: Option, system-ply, does not take an argument ($withval)." 1>&2; exit 1; }
++  fi
++fi
++
++
++
++
+ if test -z "$COMPILE_ENVIRONMENT"; then
+     NSINSTALL_BIN='$(PYTHON) $(topsrcdir)/config/nsinstall.py'
+ fi
+@@ -4230,7 +4251,7 @@ fi
+  # Extract the first word of "doxygen", so it can be a program name with args.
+ set dummy doxygen; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4234: checking for $ac_word" >&5
++echo "configure:4255: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_DOXYGEN'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4279,7 +4300,7 @@ fi
+  # Extract the first word of "autoconf", so it can be a program name with args.
+ set dummy autoconf; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4283: checking for $ac_word" >&5
++echo "configure:4304: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_AUTOCONF'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4330,7 +4351,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4334: checking for $ac_word" >&5
++echo "configure:4355: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_UNZIP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4386,7 +4407,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4390: checking for $ac_word" >&5
++echo "configure:4411: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_ZIP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4440,7 +4461,7 @@ fi
+  # Extract the first word of "makedepend", so it can be a program name with args.
+ set dummy makedepend; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4444: checking for $ac_word" >&5
++echo "configure:4465: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_SYSTEM_MAKEDEPEND'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4488,7 +4509,7 @@ fi
+  # Extract the first word of "xargs", so it can be a program name with args.
+ set dummy xargs; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4492: checking for $ac_word" >&5
++echo "configure:4513: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_XARGS'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4540,7 +4561,7 @@ fi
+  # Extract the first word of "rpmbuild", so it can be a program name with args.
+ set dummy rpmbuild; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4544: checking for $ac_word" >&5
++echo "configure:4565: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_RPMBUILD'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4613,7 +4634,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4617: checking for $ac_word" >&5
++echo "configure:4638: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_PBBUILD'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4665,7 +4686,7 @@ done
+              # Extract the first word of "sdp", so it can be a program name with args.
+ set dummy sdp; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4669: checking for $ac_word" >&5
++echo "configure:4690: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_SDP'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4786,7 +4807,7 @@ tools are selected during the Xcode/Developer Tools installation." 1>&2; exit 1;
+ 
+   
+   echo $ac_n "checking for valid compiler/Mac OS X SDK combination""... $ac_c" 1>&6
+-echo "configure:4790: checking for valid compiler/Mac OS X SDK combination" >&5
++echo "configure:4811: checking for valid compiler/Mac OS X SDK combination" >&5
+   ac_ext=C
+ # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+ ac_cpp='$CXXCPP $CPPFLAGS'
+@@ -4795,14 +4816,14 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+   cat > conftest.$ac_ext <<EOF
+-#line 4799 "configure"
++#line 4820 "configure"
+ #include "confdefs.h"
+ #include <new>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:4806: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:4827: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   result=yes
+ else
+@@ -4829,7 +4850,7 @@ fi
+ fi # COMPILE_ENVIRONMENT
+ 
+ echo $ac_n "checking whether the C compiler is clang older than version 2.9""... $ac_c" 1>&6
+-echo "configure:4833: checking whether the C compiler is clang older than version 2.9" >&5
++echo "configure:4854: checking whether the C compiler is clang older than version 2.9" >&5
+ 
+ ac_ext=c
+ # CFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+@@ -4839,7 +4860,7 @@ ac_link='${CC-cc} -o conftest${ac_exeext} $CFLAGS $CPPFLAGS $LDFLAGS conftest.$a
+ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ cat > conftest.$ac_ext <<EOF
+-#line 4843 "configure"
++#line 4864 "configure"
+ #include "confdefs.h"
+ 
+ #if defined(__clang__)
+@@ -4852,7 +4873,7 @@ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:4856: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:4877: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   result="no"
+ else
+@@ -4874,7 +4895,7 @@ if test "$result" = "yes"; then
+   MOZ_NO_THEORA_ASM=1
+ fi
+ echo $ac_n "checking bad gcc versions""... $ac_c" 1>&6
+-echo "configure:4878: checking bad gcc versions" >&5
++echo "configure:4899: checking bad gcc versions" >&5
+ if `$CC --version | grep -q "Apple Inc. build 5658"`; then
+   echo "$ac_t""Apple build 5658" 1>&6
+   MOZ_NO_THEORA_ASM=1
+@@ -4901,7 +4922,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4905: checking for $ac_word" >&5
++echo "configure:4926: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_GMAKE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -4957,7 +4978,7 @@ do
+ # Extract the first word of "$ac_prog", so it can be a program name with args.
+ set dummy $ac_prog; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:4961: checking for $ac_word" >&5
++echo "configure:4982: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_GMAKE'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -5020,7 +5041,7 @@ if test "$COMPILE_ENVIRONMENT"; then
+ # Uses ac_ vars as temps to allow command line to override cache and checks.
+ # --without-x overrides everything else, but does not touch the cache.
+ echo $ac_n "checking for X""... $ac_c" 1>&6
+-echo "configure:5024: checking for X" >&5
++echo "configure:5045: checking for X" >&5
+ 
+ # Check whether --with-x or --without-x was given.
+ if test "${with_x+set}" = set; then
+@@ -5082,12 +5103,12 @@ if test "$ac_x_includes" = NO; then
+ 
+   # First, try using that file with no special directory specified.
+ cat > conftest.$ac_ext <<EOF
+-#line 5086 "configure"
++#line 5107 "configure"
+ #include "confdefs.h"
+ #include <$x_direct_test_include>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:5091: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:5112: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -5156,14 +5177,14 @@ if test "$ac_x_libraries" = NO; then
+   ac_save_LIBS="$LIBS"
+   LIBS="-l$x_direct_test_library $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5160 "configure"
++#line 5181 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ ${x_direct_test_function}()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5167: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5188: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   LIBS="$ac_save_LIBS"
+ # We can link X programs with no special library path.
+@@ -5269,17 +5290,17 @@ else
+     case "`(uname -sr) 2>/dev/null`" in
+     "SunOS 5"*)
+       echo $ac_n "checking whether -R must be followed by a space""... $ac_c" 1>&6
+-echo "configure:5273: checking whether -R must be followed by a space" >&5
++echo "configure:5294: checking whether -R must be followed by a space" >&5
+       ac_xsave_LIBS="$LIBS"; LIBS="$LIBS -R$x_libraries"
+       cat > conftest.$ac_ext <<EOF
+-#line 5276 "configure"
++#line 5297 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5283: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5304: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_R_nospace=yes
+ else
+@@ -5295,14 +5316,14 @@ rm -f conftest*
+       else
+ 	LIBS="$ac_xsave_LIBS -R $x_libraries"
+ 	cat > conftest.$ac_ext <<EOF
+-#line 5299 "configure"
++#line 5320 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5306: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5327: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_R_space=yes
+ else
+@@ -5334,7 +5355,7 @@ rm -f conftest*
+     # libraries were built with DECnet support.  And karl@cs.umb.edu says
+     # the Alpha needs dnet_stub (dnet does not exist).
+     echo $ac_n "checking for dnet_ntoa in -ldnet""... $ac_c" 1>&6
+-echo "configure:5338: checking for dnet_ntoa in -ldnet" >&5
++echo "configure:5359: checking for dnet_ntoa in -ldnet" >&5
+ ac_lib_var=`echo dnet'_'dnet_ntoa | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5342,7 +5363,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-ldnet  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5346 "configure"
++#line 5367 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5353,7 +5374,7 @@ int main() {
+ dnet_ntoa()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5357: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5378: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5375,7 +5396,7 @@ fi
+ 
+     if test $ac_cv_lib_dnet_dnet_ntoa = no; then
+       echo $ac_n "checking for dnet_ntoa in -ldnet_stub""... $ac_c" 1>&6
+-echo "configure:5379: checking for dnet_ntoa in -ldnet_stub" >&5
++echo "configure:5400: checking for dnet_ntoa in -ldnet_stub" >&5
+ ac_lib_var=`echo dnet_stub'_'dnet_ntoa | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5383,7 +5404,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-ldnet_stub  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5387 "configure"
++#line 5408 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5394,7 +5415,7 @@ int main() {
+ dnet_ntoa()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5398: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5419: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5423,12 +5444,12 @@ fi
+     # The nsl library prevents programs from opening the X display
+     # on Irix 5.2, according to dickey@clark.net.
+     echo $ac_n "checking for gethostbyname""... $ac_c" 1>&6
+-echo "configure:5427: checking for gethostbyname" >&5
++echo "configure:5448: checking for gethostbyname" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_gethostbyname'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 5432 "configure"
++#line 5453 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char gethostbyname(); below.  */
+@@ -5451,7 +5472,7 @@ gethostbyname();
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5455: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5476: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_gethostbyname=yes"
+ else
+@@ -5472,7 +5493,7 @@ fi
+ 
+     if test $ac_cv_func_gethostbyname = no; then
+       echo $ac_n "checking for gethostbyname in -lnsl""... $ac_c" 1>&6
+-echo "configure:5476: checking for gethostbyname in -lnsl" >&5
++echo "configure:5497: checking for gethostbyname in -lnsl" >&5
+ ac_lib_var=`echo nsl'_'gethostbyname | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5480,7 +5501,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lnsl  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5484 "configure"
++#line 5505 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5491,7 +5512,7 @@ int main() {
+ gethostbyname()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5495: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5516: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5521,12 +5542,12 @@ fi
+     # -lsocket must be given before -lnsl if both are needed.
+     # We assume that if connect needs -lnsl, so does gethostbyname.
+     echo $ac_n "checking for connect""... $ac_c" 1>&6
+-echo "configure:5525: checking for connect" >&5
++echo "configure:5546: checking for connect" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_connect'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 5530 "configure"
++#line 5551 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char connect(); below.  */
+@@ -5549,7 +5570,7 @@ connect();
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5553: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5574: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_connect=yes"
+ else
+@@ -5570,7 +5591,7 @@ fi
+ 
+     if test $ac_cv_func_connect = no; then
+       echo $ac_n "checking for connect in -lsocket""... $ac_c" 1>&6
+-echo "configure:5574: checking for connect in -lsocket" >&5
++echo "configure:5595: checking for connect in -lsocket" >&5
+ ac_lib_var=`echo socket'_'connect | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5578,7 +5599,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lsocket $X_EXTRA_LIBS $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5582 "configure"
++#line 5603 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5589,7 +5610,7 @@ int main() {
+ connect()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5593: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5614: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5613,12 +5634,12 @@ fi
+ 
+     # gomez@mi.uni-erlangen.de says -lposix is necessary on A/UX.
+     echo $ac_n "checking for remove""... $ac_c" 1>&6
+-echo "configure:5617: checking for remove" >&5
++echo "configure:5638: checking for remove" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_remove'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 5622 "configure"
++#line 5643 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char remove(); below.  */
+@@ -5641,7 +5662,7 @@ remove();
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5645: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5666: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_remove=yes"
+ else
+@@ -5662,7 +5683,7 @@ fi
+ 
+     if test $ac_cv_func_remove = no; then
+       echo $ac_n "checking for remove in -lposix""... $ac_c" 1>&6
+-echo "configure:5666: checking for remove in -lposix" >&5
++echo "configure:5687: checking for remove in -lposix" >&5
+ ac_lib_var=`echo posix'_'remove | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5670,7 +5691,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lposix  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5674 "configure"
++#line 5695 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5681,7 +5702,7 @@ int main() {
+ remove()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5685: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5706: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5705,12 +5726,12 @@ fi
+ 
+     # BSDI BSD/OS 2.1 needs -lipc for XOpenDisplay.
+     echo $ac_n "checking for shmat""... $ac_c" 1>&6
+-echo "configure:5709: checking for shmat" >&5
++echo "configure:5730: checking for shmat" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_shmat'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 5714 "configure"
++#line 5735 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char shmat(); below.  */
+@@ -5733,7 +5754,7 @@ shmat();
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5737: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5758: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_shmat=yes"
+ else
+@@ -5754,7 +5775,7 @@ fi
+ 
+     if test $ac_cv_func_shmat = no; then
+       echo $ac_n "checking for shmat in -lipc""... $ac_c" 1>&6
+-echo "configure:5758: checking for shmat in -lipc" >&5
++echo "configure:5779: checking for shmat in -lipc" >&5
+ ac_lib_var=`echo ipc'_'shmat | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5762,7 +5783,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lipc  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5766 "configure"
++#line 5787 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5773,7 +5794,7 @@ int main() {
+ shmat()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5777: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5798: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -5806,7 +5827,7 @@ fi
+   # libraries we check for below, so use a different variable.
+   #  --interran@uluru.Stanford.EDU, kb@cs.umb.edu.
+   echo $ac_n "checking for IceConnectionNumber in -lICE""... $ac_c" 1>&6
+-echo "configure:5810: checking for IceConnectionNumber in -lICE" >&5
++echo "configure:5831: checking for IceConnectionNumber in -lICE" >&5
+ ac_lib_var=`echo ICE'_'IceConnectionNumber | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -5814,7 +5835,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lICE $X_EXTRA_LIBS $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 5818 "configure"
++#line 5839 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -5825,7 +5846,7 @@ int main() {
+ IceConnectionNumber()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:5829: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:5850: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -6220,14 +6241,14 @@ no)
+     _SAVE_CFLAGS="$CFLAGS"
+     CFLAGS="$arch_flag"
+     cat > conftest.$ac_ext <<EOF
+-#line 6224 "configure"
++#line 6245 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return sizeof(__thumb2__);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6231: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6252: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   MOZ_THUMB2=1
+ else
+@@ -6296,16 +6317,16 @@ if test -n "$all_flags"; then
+     _SAVE_CFLAGS="$CFLAGS"
+     CFLAGS="$all_flags"
+     echo $ac_n "checking whether the chosen combination of compiler flags ($all_flags) works""... $ac_c" 1>&6
+-echo "configure:6300: checking whether the chosen combination of compiler flags ($all_flags) works" >&5
++echo "configure:6321: checking whether the chosen combination of compiler flags ($all_flags) works" >&5
+     cat > conftest.$ac_ext <<EOF
+-#line 6302 "configure"
++#line 6323 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6309: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6330: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   echo "$ac_t""yes" 1>&6
+ else
+@@ -6328,18 +6349,18 @@ fi
+ 
+ if test "$CPU_ARCH" = "arm"; then
+   echo $ac_n "checking for ARM SIMD support in compiler""... $ac_c" 1>&6
+-echo "configure:6332: checking for ARM SIMD support in compiler" >&5
++echo "configure:6353: checking for ARM SIMD support in compiler" >&5
+   # We try to link so that this also fails when
+   # building with LTO.
+   cat > conftest.$ac_ext <<EOF
+-#line 6336 "configure"
++#line 6357 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ asm("uqadd8 r1, r1, r2");
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6343: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:6364: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   result="yes"
+ else
+@@ -6359,18 +6380,18 @@ EOF
+   fi
+ 
+   echo $ac_n "checking for ARM NEON support in compiler""... $ac_c" 1>&6
+-echo "configure:6363: checking for ARM NEON support in compiler" >&5
++echo "configure:6384: checking for ARM NEON support in compiler" >&5
+   # We try to link so that this also fails when
+   # building with LTO.
+   cat > conftest.$ac_ext <<EOF
+-#line 6367 "configure"
++#line 6388 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ asm(".fpu neon\n vadd.i8 d0, d0, d0");
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6374: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:6395: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   result="yes"
+ else
+@@ -6521,7 +6542,7 @@ if test "$GNU_CXX"; then
+     _USE_CPP_INCLUDE_FLAG=1
+ 
+     echo $ac_n "checking whether the compiler supports -Wno-invalid-offsetof""... $ac_c" 1>&6
+-echo "configure:6525: checking whether the compiler supports -Wno-invalid-offsetof" >&5
++echo "configure:6546: checking whether the compiler supports -Wno-invalid-offsetof" >&5
+ if eval "test \"`echo '$''{'ac_has_wno_invalid_offsetof'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -6537,14 +6558,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
+             _SAVE_CXXFLAGS="$CXXFLAGS"
+             CXXFLAGS="$CXXFLAGS ${_COMPILER_PREFIX}-Wno-invalid-offsetof"
+             cat > conftest.$ac_ext <<EOF
+-#line 6541 "configure"
++#line 6562 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return(0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6548: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6569: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_has_wno_invalid_offsetof="yes"
+ else
+@@ -6571,7 +6592,7 @@ echo "$ac_t""$ac_has_wno_invalid_offsetof" 1>&6
+     fi
+ 
+     echo $ac_n "checking whether the compiler supports -Wno-variadic-macros""... $ac_c" 1>&6
+-echo "configure:6575: checking whether the compiler supports -Wno-variadic-macros" >&5
++echo "configure:6596: checking whether the compiler supports -Wno-variadic-macros" >&5
+ if eval "test \"`echo '$''{'ac_has_wno_variadic_macros'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -6587,14 +6608,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
+             _SAVE_CXXFLAGS="$CXXFLAGS"
+             CXXFLAGS="$CXXFLAGS ${_COMPILER_PREFIX}-Wno-variadic-macros"
+             cat > conftest.$ac_ext <<EOF
+-#line 6591 "configure"
++#line 6612 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return(0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6598: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6619: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_has_wno_variadic_macros="yes"
+ else
+@@ -6621,7 +6642,7 @@ echo "$ac_t""$ac_has_wno_variadic_macros" 1>&6
+     fi
+ 
+     echo $ac_n "checking whether the compiler supports -Werror=return-type""... $ac_c" 1>&6
+-echo "configure:6625: checking whether the compiler supports -Werror=return-type" >&5
++echo "configure:6646: checking whether the compiler supports -Werror=return-type" >&5
+ if eval "test \"`echo '$''{'ac_has_werror_return_type'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -6637,14 +6658,14 @@ cross_compiling=$ac_cv_prog_cxx_cross
+             _SAVE_CXXFLAGS="$CXXFLAGS"
+             CXXFLAGS="$CXXFLAGS -Werror=return-type"
+             cat > conftest.$ac_ext <<EOF
+-#line 6641 "configure"
++#line 6662 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return(0);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6648: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6669: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_has_werror_return_type="yes"
+ else
+@@ -6680,7 +6701,7 @@ MKSHLIB_UNFORCE_ALL=
+ if test "$COMPILE_ENVIRONMENT"; then
+ if test "$GNU_CC"; then
+   echo $ac_n "checking whether ld has archive extraction flags""... $ac_c" 1>&6
+-echo "configure:6684: checking whether ld has archive extraction flags" >&5
++echo "configure:6705: checking whether ld has archive extraction flags" >&5
+   if eval "test \"`echo '$''{'ac_cv_mkshlib_force_and_unforce'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -6697,14 +6718,14 @@ LOOP_INPUT
+       LDFLAGS=$force
+       LIBS=$unforce
+       cat > conftest.$ac_ext <<EOF
+-#line 6701 "configure"
++#line 6722 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6708: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:6729: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_mkshlib_force_and_unforce=$line; break
+ else
+@@ -6737,7 +6758,7 @@ configure_static_assert_macros='
+ '
+ 
+ echo $ac_n "checking that static assertion macros used in autoconf tests work""... $ac_c" 1>&6
+-echo "configure:6741: checking that static assertion macros used in autoconf tests work" >&5
++echo "configure:6762: checking that static assertion macros used in autoconf tests work" >&5
+ if eval "test \"`echo '$''{'ac_cv_static_assertion_macros_work'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -6751,14 +6772,14 @@ cross_compiling=$ac_cv_prog_cc_cross
+ 
+   ac_cv_static_assertion_macros_work="yes"
+   cat > conftest.$ac_ext <<EOF
+-#line 6755 "configure"
++#line 6776 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+ CONFIGURE_STATIC_ASSERT(1)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6762: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6783: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -6768,14 +6789,14 @@ else
+ fi
+ rm -f conftest*
+   cat > conftest.$ac_ext <<EOF
+-#line 6772 "configure"
++#line 6793 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+ CONFIGURE_STATIC_ASSERT(0)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6779: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6800: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_static_assertion_macros_work="no"
+ else
+@@ -6791,14 +6812,14 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+   cat > conftest.$ac_ext <<EOF
+-#line 6795 "configure"
++#line 6816 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+ CONFIGURE_STATIC_ASSERT(1)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6802: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6823: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -6808,14 +6829,14 @@ else
+ fi
+ rm -f conftest*
+   cat > conftest.$ac_ext <<EOF
+-#line 6812 "configure"
++#line 6833 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+ CONFIGURE_STATIC_ASSERT(0)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6819: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6840: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_static_assertion_macros_work="no"
+ else
+@@ -6849,16 +6870,16 @@ ac_link='${CC-cc} -o conftest${ac_exeext} $CFLAGS $CPPFLAGS $LDFLAGS conftest.$a
+ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ echo $ac_n "checking for 64-bit OS""... $ac_c" 1>&6
+-echo "configure:6853: checking for 64-bit OS" >&5
++echo "configure:6874: checking for 64-bit OS" >&5
+ cat > conftest.$ac_ext <<EOF
+-#line 6855 "configure"
++#line 6876 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+ CONFIGURE_STATIC_ASSERT(sizeof(void*) == 8)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6862: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6883: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   result="yes"
+ else
+@@ -6929,19 +6950,19 @@ fi
+ if test -n "$MOZ_VALGRIND"; then
+        ac_safe=`echo "valgrind/valgrind.h" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for valgrind/valgrind.h""... $ac_c" 1>&6
+-echo "configure:6933: checking for valgrind/valgrind.h" >&5
++echo "configure:6954: checking for valgrind/valgrind.h" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 6938 "configure"
++#line 6959 "configure"
+ #include "confdefs.h"
+ #include <valgrind/valgrind.h>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:6945: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:6966: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -7129,7 +7150,7 @@ case "$host" in
+ esac
+ 
+ echo $ac_n "checking for Python version >= $PYTHON_VERSION but not 3.x""... $ac_c" 1>&6
+-echo "configure:7133: checking for Python version >= $PYTHON_VERSION but not 3.x" >&5
++echo "configure:7154: checking for Python version >= $PYTHON_VERSION but not 3.x" >&5
+ 
+ $PYTHON -c "import sys; sys.exit(sys.version[:3] < sys.argv[1] or sys.version[:2] != '2.')" $PYTHON_VERSION
+ _python_res=$?
+@@ -7207,9 +7228,9 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+             echo $ac_n "checking for IBM XLC/C++ compiler version >= 9.0.0.7""... $ac_c" 1>&6
+-echo "configure:7211: checking for IBM XLC/C++ compiler version >= 9.0.0.7" >&5
++echo "configure:7232: checking for IBM XLC/C++ compiler version >= 9.0.0.7" >&5
+             cat > conftest.$ac_ext <<EOF
+-#line 7213 "configure"
++#line 7234 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -7218,7 +7239,7 @@ int main() {
+                  #endif
+ ; return 0; }
+ EOF
+-if { (eval echo configure:7222: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:7243: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   _BAD_COMPILER=
+ else
+@@ -7256,19 +7277,19 @@ cross_compiling=$ac_cv_prog_cc_cross
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:7260: checking for $ac_hdr" >&5
++echo "configure:7281: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 7265 "configure"
++#line 7286 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:7272: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:7293: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -7335,12 +7356,12 @@ EOF
+     STRIP="$STRIP -x -S"
+     # Check whether we're targeting OS X or iOS
+     echo $ac_n "checking for iOS target""... $ac_c" 1>&6
+-echo "configure:7339: checking for iOS target" >&5
++echo "configure:7360: checking for iOS target" >&5
+ if eval "test \"`echo '$''{'ac_cv_ios_target'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 7344 "configure"
++#line 7365 "configure"
+ #include "confdefs.h"
+ #include <TargetConditionals.h>
+ #if !(TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
+@@ -7350,7 +7371,7 @@ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:7354: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:7375: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_ios_target="yes"
+ else
+@@ -7397,18 +7418,18 @@ EOF
+         echo "Skipping -dead_strip because DTrace is enabled. See bug 403132."
+     else
+                 echo $ac_n "checking for -dead_strip option to ld""... $ac_c" 1>&6
+-echo "configure:7401: checking for -dead_strip option to ld" >&5
++echo "configure:7422: checking for -dead_strip option to ld" >&5
+         _SAVE_LDFLAGS=$LDFLAGS
+         LDFLAGS="$LDFLAGS -Wl,-dead_strip"
+         cat > conftest.$ac_ext <<EOF
+-#line 7405 "configure"
++#line 7426 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+ return 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:7412: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:7433: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   _HAVE_DEAD_STRIP=1
+ else
+@@ -7731,19 +7752,19 @@ EOF
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:7735: checking for $ac_hdr" >&5
++echo "configure:7756: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 7740 "configure"
++#line 7761 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:7747: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:7768: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -7904,19 +7925,19 @@ EOF
+     _DEFINES_CXXFLAGS="$_DEFINES_CXXFLAGS -Uunix -U__unix -U__unix__"
+ 
+     echo $ac_n "checking for __declspec(dllexport)""... $ac_c" 1>&6
+-echo "configure:7908: checking for __declspec(dllexport)" >&5
++echo "configure:7929: checking for __declspec(dllexport)" >&5
+ if eval "test \"`echo '$''{'ac_os2_declspec'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 7913 "configure"
++#line 7934 "configure"
+ #include "confdefs.h"
+ __declspec(dllexport) void ac_os2_declspec(void) {}
+ int main() {
+ return 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:7920: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:7941: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_os2_declspec="yes"
+ else
+@@ -7958,14 +7979,14 @@ EOF
+            _SAVE_LDFLAGS=$LDFLAGS
+            LDFLAGS="-M /usr/lib/ld/map.noexstk $LDFLAGS"
+            cat > conftest.$ac_ext <<EOF
+-#line 7962 "configure"
++#line 7983 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+ int main() {
+ printf("Hello World\n");
+ ; return 0; }
+ EOF
+-if { (eval echo configure:7969: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:7990: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   :
+ else
+   echo "configure: failed program was:" >&5
+@@ -7993,7 +8014,7 @@ rm -f conftest*
+        CC_VERSION=`$CC -V 2>&1 | grep '^cc:' 2>/dev/null | $AWK -F\: '{ print $2 }'`
+        CXX_VERSION=`$CXX -V 2>&1 | grep '^CC:' 2>/dev/null | $AWK -F\: '{ print $2 }'`
+        echo $ac_n "checking for Sun C++ compiler version >= 5.9""... $ac_c" 1>&6
+-echo "configure:7997: checking for Sun C++ compiler version >= 5.9" >&5
++echo "configure:8018: checking for Sun C++ compiler version >= 5.9" >&5
+        
+        ac_ext=C
+ # CXXFLAGS is not in ac_cpp because -g, -O, etc. are not valid cpp options.
+@@ -8003,7 +8024,7 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+        cat > conftest.$ac_ext <<EOF
+-#line 8007 "configure"
++#line 8028 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -8012,7 +8033,7 @@ int main() {
+            #endif
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8016: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8037: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   _BAD_COMPILER=
+ else
+@@ -8029,7 +8050,7 @@ rm -f conftest*
+            _res="yes"
+        fi
+        cat > conftest.$ac_ext <<EOF
+-#line 8033 "configure"
++#line 8054 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -8038,7 +8059,7 @@ int main() {
+            #endif
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8042: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8063: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   _ABOVE_SS12U1=
+ else
+@@ -8166,12 +8187,12 @@ fi
+ 
+ if test -z "$SKIP_COMPILER_CHECKS"; then
+ echo $ac_n "checking for ANSI C header files""... $ac_c" 1>&6
+-echo "configure:8170: checking for ANSI C header files" >&5
++echo "configure:8191: checking for ANSI C header files" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_stdc'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8175 "configure"
++#line 8196 "configure"
+ #include "confdefs.h"
+ #include <stdlib.h>
+ #include <stdarg.h>
+@@ -8179,7 +8200,7 @@ else
+ #include <float.h>
+ EOF
+ ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
+-{ (eval echo configure:8183: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:8204: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+ ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
+ if test -z "$ac_err"; then
+   rm -rf conftest*
+@@ -8196,7 +8217,7 @@ rm -f conftest*
+ if test $ac_cv_header_stdc = yes; then
+   # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
+ cat > conftest.$ac_ext <<EOF
+-#line 8200 "configure"
++#line 8221 "configure"
+ #include "confdefs.h"
+ #include <string.h>
+ EOF
+@@ -8214,7 +8235,7 @@ fi
+ if test $ac_cv_header_stdc = yes; then
+   # ISC 2.0.2 stdlib.h does not declare free, contrary to ANSI.
+ cat > conftest.$ac_ext <<EOF
+-#line 8218 "configure"
++#line 8239 "configure"
+ #include "confdefs.h"
+ #include <stdlib.h>
+ EOF
+@@ -8235,7 +8256,7 @@ if test "$cross_compiling" = yes; then
+   :
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8239 "configure"
++#line 8260 "configure"
+ #include "confdefs.h"
+ #include <ctype.h>
+ #define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
+@@ -8246,7 +8267,7 @@ if (XOR (islower (i), ISLOWER (i)) || toupper (i) != TOUPPER (i)) exit(2);
+ exit (0); }
+ 
+ EOF
+-if { (eval echo configure:8250: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:8271: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   :
+ else
+@@ -8270,12 +8291,12 @@ EOF
+ fi
+ 
+ echo $ac_n "checking for working const""... $ac_c" 1>&6
+-echo "configure:8274: checking for working const" >&5
++echo "configure:8295: checking for working const" >&5
+ if eval "test \"`echo '$''{'ac_cv_c_const'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8279 "configure"
++#line 8300 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -8324,7 +8345,7 @@ ccp = (char const *const *) p;
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8328: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8349: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_c_const=yes
+ else
+@@ -8345,12 +8366,12 @@ EOF
+ fi
+ 
+ echo $ac_n "checking for mode_t""... $ac_c" 1>&6
+-echo "configure:8349: checking for mode_t" >&5
++echo "configure:8370: checking for mode_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_type_mode_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8354 "configure"
++#line 8375 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #if STDC_HEADERS
+@@ -8378,12 +8399,12 @@ EOF
+ fi
+ 
+ echo $ac_n "checking for off_t""... $ac_c" 1>&6
+-echo "configure:8382: checking for off_t" >&5
++echo "configure:8403: checking for off_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_type_off_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8387 "configure"
++#line 8408 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #if STDC_HEADERS
+@@ -8411,12 +8432,12 @@ EOF
+ fi
+ 
+ echo $ac_n "checking for pid_t""... $ac_c" 1>&6
+-echo "configure:8415: checking for pid_t" >&5
++echo "configure:8436: checking for pid_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_type_pid_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8420 "configure"
++#line 8441 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #if STDC_HEADERS
+@@ -8444,12 +8465,12 @@ EOF
+ fi
+ 
+ echo $ac_n "checking for size_t""... $ac_c" 1>&6
+-echo "configure:8448: checking for size_t" >&5
++echo "configure:8469: checking for size_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_type_size_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8453 "configure"
++#line 8474 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #if STDC_HEADERS
+@@ -8484,12 +8505,12 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ echo $ac_n "checking for __stdcall""... $ac_c" 1>&6
+-echo "configure:8488: checking for __stdcall" >&5
++echo "configure:8509: checking for __stdcall" >&5
+ if eval "test \"`echo '$''{'ac_cv___stdcall'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8493 "configure"
++#line 8514 "configure"
+ #include "confdefs.h"
+ template <typename Method> struct foo;
+                   template <> struct foo<void (*)()> {};
+@@ -8498,7 +8519,7 @@ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8502: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8523: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv___stdcall=true
+ else
+@@ -8527,12 +8548,12 @@ ac_link='${CC-cc} -o conftest${ac_exeext} $CFLAGS $CPPFLAGS $LDFLAGS conftest.$a
+ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ echo $ac_n "checking for ssize_t""... $ac_c" 1>&6
+-echo "configure:8531: checking for ssize_t" >&5
++echo "configure:8552: checking for ssize_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_type_ssize_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8536 "configure"
++#line 8557 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -8540,7 +8561,7 @@ int main() {
+ ssize_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8544: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8565: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_type_ssize_t=true
+ else
+@@ -8562,12 +8583,12 @@ else
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for st_blksize in struct stat""... $ac_c" 1>&6
+-echo "configure:8566: checking for st_blksize in struct stat" >&5
++echo "configure:8587: checking for st_blksize in struct stat" >&5
+ if eval "test \"`echo '$''{'ac_cv_struct_st_blksize'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8571 "configure"
++#line 8592 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #include <sys/stat.h>
+@@ -8575,7 +8596,7 @@ int main() {
+ struct stat s; s.st_blksize;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8579: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8600: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_struct_st_blksize=yes
+ else
+@@ -8596,12 +8617,12 @@ EOF
+ fi
+ 
+ echo $ac_n "checking for siginfo_t""... $ac_c" 1>&6
+-echo "configure:8600: checking for siginfo_t" >&5
++echo "configure:8621: checking for siginfo_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_siginfo_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8605 "configure"
++#line 8626 "configure"
+ #include "confdefs.h"
+ #define _POSIX_C_SOURCE 199506L
+                   #include <signal.h>
+@@ -8609,7 +8630,7 @@ int main() {
+ siginfo_t* info;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8613: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8634: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_siginfo_t=true
+ else
+@@ -8632,12 +8653,12 @@ else
+ fi
+ 
+ echo $ac_n "checking for int16_t""... $ac_c" 1>&6
+-echo "configure:8636: checking for int16_t" >&5
++echo "configure:8657: checking for int16_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_int16_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8641 "configure"
++#line 8662 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -8645,7 +8666,7 @@ int main() {
+ int16_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8649: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8670: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_int16_t=true
+ else
+@@ -8667,12 +8688,12 @@ else
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for int32_t""... $ac_c" 1>&6
+-echo "configure:8671: checking for int32_t" >&5
++echo "configure:8692: checking for int32_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_int32_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8676 "configure"
++#line 8697 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -8680,7 +8701,7 @@ int main() {
+ int32_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8684: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8705: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_int32_t=true
+ else
+@@ -8702,12 +8723,12 @@ else
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for int64_t""... $ac_c" 1>&6
+-echo "configure:8706: checking for int64_t" >&5
++echo "configure:8727: checking for int64_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_int64_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8711 "configure"
++#line 8732 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -8715,7 +8736,7 @@ int main() {
+ int64_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8719: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8740: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_int64_t=true
+ else
+@@ -8737,12 +8758,12 @@ else
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for int64""... $ac_c" 1>&6
+-echo "configure:8741: checking for int64" >&5
++echo "configure:8762: checking for int64" >&5
+ if eval "test \"`echo '$''{'ac_cv_int64'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8746 "configure"
++#line 8767 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -8750,7 +8771,7 @@ int main() {
+ int64 foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8754: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8775: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_int64=true
+ else
+@@ -8772,12 +8793,12 @@ else
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for uint""... $ac_c" 1>&6
+-echo "configure:8776: checking for uint" >&5
++echo "configure:8797: checking for uint" >&5
+ if eval "test \"`echo '$''{'ac_cv_uint'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8781 "configure"
++#line 8802 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -8785,7 +8806,7 @@ int main() {
+ uint foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8789: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8810: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_uint=true
+ else
+@@ -8807,12 +8828,12 @@ else
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for uint_t""... $ac_c" 1>&6
+-echo "configure:8811: checking for uint_t" >&5
++echo "configure:8832: checking for uint_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_uint_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8816 "configure"
++#line 8837 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -8820,7 +8841,7 @@ int main() {
+ uint_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8824: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8845: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_uint_t=true
+ else
+@@ -8842,12 +8863,12 @@ else
+   echo "$ac_t""no" 1>&6
+ fi
+ echo $ac_n "checking for uint16_t""... $ac_c" 1>&6
+-echo "configure:8846: checking for uint16_t" >&5
++echo "configure:8867: checking for uint16_t" >&5
+ if eval "test \"`echo '$''{'ac_cv_uint16_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8851 "configure"
++#line 8872 "configure"
+ #include "confdefs.h"
+ #include <stdio.h>
+                   #include <sys/types.h>
+@@ -8855,7 +8876,7 @@ int main() {
+ uint16_t foo = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8859: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8880: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_uint16_t=true
+ else
+@@ -8886,12 +8907,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ 
+ echo $ac_n "checking for uname.domainname""... $ac_c" 1>&6
+-echo "configure:8890: checking for uname.domainname" >&5
++echo "configure:8911: checking for uname.domainname" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_uname_domainname_field'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8895 "configure"
++#line 8916 "configure"
+ #include "confdefs.h"
+ #include <sys/utsname.h>
+ int main() {
+@@ -8899,7 +8920,7 @@ int main() {
+             (void)uname(res);  if (res != 0) { domain = res->domainname; } 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8903: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8924: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_have_uname_domainname_field=true
+ else
+@@ -8923,12 +8944,12 @@ else
+ fi
+ 
+ echo $ac_n "checking for uname.__domainname""... $ac_c" 1>&6
+-echo "configure:8927: checking for uname.__domainname" >&5
++echo "configure:8948: checking for uname.__domainname" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_uname_us_domainname_field'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 8932 "configure"
++#line 8953 "configure"
+ #include "confdefs.h"
+ #include <sys/utsname.h>
+ int main() {
+@@ -8936,7 +8957,7 @@ int main() {
+             (void)uname(res);  if (res != 0) { domain = res->__domainname; } 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:8940: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:8961: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_have_uname_us_domainname_field=true
+ else
+@@ -8996,19 +9017,19 @@ if test "$GNU_CXX"; then
+     if test -z "$_MOZ_USE_RTTI"; then
+         CXXFLAGS="$CXXFLAGS $_MOZ_RTTI_FLAGS"
+         echo $ac_n "checking for gcc c++0x headers bug without rtti""... $ac_c" 1>&6
+-echo "configure:9000: checking for gcc c++0x headers bug without rtti" >&5
++echo "configure:9021: checking for gcc c++0x headers bug without rtti" >&5
+ if eval "test \"`echo '$''{'ac_cv_cxx0x_headers_bug'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9005 "configure"
++#line 9026 "configure"
+ #include "confdefs.h"
+ #include <memory>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9012: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9033: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cxx0x_headers_bug="no"
+ else
+@@ -9029,12 +9050,12 @@ echo "$ac_t""$ac_cv_cxx0x_headers_bug" 1>&6
+ fi
+ 
+ echo $ac_n "checking for usable char16_t (2 bytes, unsigned)""... $ac_c" 1>&6
+-echo "configure:9033: checking for usable char16_t (2 bytes, unsigned)" >&5
++echo "configure:9054: checking for usable char16_t (2 bytes, unsigned)" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_usable_char16_t'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9038 "configure"
++#line 9059 "configure"
+ #include "confdefs.h"
+ $configure_static_assert_macros
+ int main() {
+@@ -9045,7 +9066,7 @@ CONFIGURE_STATIC_ASSERT(sizeof(char16_t) == 2);
+                      CONFIGURE_STATIC_ASSERT(u'\xFFFF' > u'\x0')
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9049: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9070: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_have_usable_char16_t="yes"
+ else
+@@ -9070,12 +9091,12 @@ fi
+ 
+ 
+ echo $ac_n "checking for usable wchar_t (2 bytes, unsigned)""... $ac_c" 1>&6
+-echo "configure:9074: checking for usable wchar_t (2 bytes, unsigned)" >&5
++echo "configure:9095: checking for usable wchar_t (2 bytes, unsigned)" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_usable_wchar_v2'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9079 "configure"
++#line 9100 "configure"
+ #include "confdefs.h"
+ #include <stddef.h>
+                      $configure_static_assert_macros
+@@ -9084,7 +9105,7 @@ CONFIGURE_STATIC_ASSERT(sizeof(wchar_t) == 2);
+                      CONFIGURE_STATIC_ASSERT((wchar_t)-1 > (wchar_t) 0)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9088: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9109: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_have_usable_wchar_v2="yes"
+ else
+@@ -9109,12 +9130,12 @@ elif test "$ac_cv_have_usable_char16_t" != "yes"; then
+     CXXFLAGS="$CXXFLAGS -fshort-wchar"
+ 
+     echo $ac_n "checking for compiler -fshort-wchar option""... $ac_c" 1>&6
+-echo "configure:9113: checking for compiler -fshort-wchar option" >&5
++echo "configure:9134: checking for compiler -fshort-wchar option" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_usable_wchar_option_v2'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9118 "configure"
++#line 9139 "configure"
+ #include "confdefs.h"
+ #include <stddef.h>
+                       $configure_static_assert_macros
+@@ -9123,7 +9144,7 @@ CONFIGURE_STATIC_ASSERT(sizeof(wchar_t) == 2);
+                       CONFIGURE_STATIC_ASSERT((wchar_t)-1 > (wchar_t) 0)
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9127: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:9148: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_have_usable_wchar_option_v2="yes"
+ else
+@@ -9166,7 +9187,7 @@ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ if test "$GNU_CC"; then
+   echo $ac_n "checking for visibility(hidden) attribute""... $ac_c" 1>&6
+-echo "configure:9170: checking for visibility(hidden) attribute" >&5
++echo "configure:9191: checking for visibility(hidden) attribute" >&5
+ if eval "test \"`echo '$''{'ac_cv_visibility_hidden'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -9191,7 +9212,7 @@ EOF
+ 
+ 
+     echo $ac_n "checking for visibility(default) attribute""... $ac_c" 1>&6
+-echo "configure:9195: checking for visibility(default) attribute" >&5
++echo "configure:9216: checking for visibility(default) attribute" >&5
+ if eval "test \"`echo '$''{'ac_cv_visibility_default'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -9216,7 +9237,7 @@ EOF
+ 
+ 
+       echo $ac_n "checking for visibility pragma support""... $ac_c" 1>&6
+-echo "configure:9220: checking for visibility pragma support" >&5
++echo "configure:9241: checking for visibility pragma support" >&5
+ if eval "test \"`echo '$''{'ac_cv_visibility_pragma'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -9241,7 +9262,7 @@ fi
+ echo "$ac_t""$ac_cv_visibility_pragma" 1>&6
+       if test "$ac_cv_visibility_pragma" = "yes"; then
+         echo $ac_n "checking For gcc visibility bug with class-level attributes (GCC bug 26905)""... $ac_c" 1>&6
+-echo "configure:9245: checking For gcc visibility bug with class-level attributes (GCC bug 26905)" >&5
++echo "configure:9266: checking For gcc visibility bug with class-level attributes (GCC bug 26905)" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_visibility_class_bug'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -9269,7 +9290,7 @@ fi
+ echo "$ac_t""$ac_cv_have_visibility_class_bug" 1>&6
+ 
+         echo $ac_n "checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)""... $ac_c" 1>&6
+-echo "configure:9273: checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)" >&5
++echo "configure:9294: checking For x86_64 gcc visibility bug with builtins (GCC bug 20297)" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_visibility_builtin_bug'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -9323,7 +9344,7 @@ fi         # Sun Studio on Solaris
+ if test "$GNU_CC"; then
+ 
+ echo $ac_n "checking for gcc PR49911""... $ac_c" 1>&6
+-echo "configure:9327: checking for gcc PR49911" >&5
++echo "configure:9348: checking for gcc PR49911" >&5
+ ac_have_gcc_pr49911="no"
+ 
+ ac_ext=C
+@@ -9340,7 +9361,7 @@ if test "$cross_compiling" = yes; then
+   true
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9344 "configure"
++#line 9365 "configure"
+ #include "confdefs.h"
+ 
+ extern "C" void abort(void);
+@@ -9381,7 +9402,7 @@ int main(void) {
+ }
+ 
+ EOF
+-if { (eval echo configure:9385: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:9406: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   true
+ else
+@@ -9417,19 +9438,19 @@ if test "$GNU_CC"; then
+   CFLAGS_save="${CFLAGS}"
+   CFLAGS="${CFLAGS} -Werror"
+   echo $ac_n "checking for __force_align_arg_pointer__ attribute""... $ac_c" 1>&6
+-echo "configure:9421: checking for __force_align_arg_pointer__ attribute" >&5
++echo "configure:9442: checking for __force_align_arg_pointer__ attribute" >&5
+ if eval "test \"`echo '$''{'ac_cv_force_align_arg_pointer'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9426 "configure"
++#line 9447 "configure"
+ #include "confdefs.h"
+ __attribute__ ((__force_align_arg_pointer__)) void test() {}
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9433: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9454: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_force_align_arg_pointer="yes"
+ else
+@@ -9456,12 +9477,12 @@ for ac_hdr in dirent.h sys/ndir.h sys/dir.h ndir.h
+ do
+ ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+ echo $ac_n "checking for $ac_hdr that defines DIR""... $ac_c" 1>&6
+-echo "configure:9460: checking for $ac_hdr that defines DIR" >&5
++echo "configure:9481: checking for $ac_hdr that defines DIR" >&5
+ if eval "test \"`echo '$''{'ac_cv_header_dirent_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 9465 "configure"
++#line 9486 "configure"
+ #include "confdefs.h"
+ #include <sys/types.h>
+ #include <$ac_hdr>
+@@ -9469,7 +9490,7 @@ int main() {
+ DIR *dirp = 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9473: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9494: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_dirent_$ac_safe=yes"
+ else
+@@ -9494,7 +9515,7 @@ done
+ # Two versions of opendir et al. are in -ldir and -lx on SCO Xenix.
+ if test $ac_header_dirent = dirent.h; then
+ echo $ac_n "checking for opendir in -ldir""... $ac_c" 1>&6
+-echo "configure:9498: checking for opendir in -ldir" >&5
++echo "configure:9519: checking for opendir in -ldir" >&5
+ ac_lib_var=`echo dir'_'opendir | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -9502,7 +9523,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-ldir  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 9506 "configure"
++#line 9527 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -9513,7 +9534,7 @@ int main() {
+ opendir()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9517: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:9538: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -9535,7 +9556,7 @@ fi
+ 
+ else
+ echo $ac_n "checking for opendir in -lx""... $ac_c" 1>&6
+-echo "configure:9539: checking for opendir in -lx" >&5
++echo "configure:9560: checking for opendir in -lx" >&5
+ ac_lib_var=`echo x'_'opendir | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -9543,7 +9564,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lx  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 9547 "configure"
++#line 9568 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -9554,7 +9575,7 @@ int main() {
+ opendir()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9558: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:9579: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -9586,19 +9607,19 @@ esac
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9590: checking for $ac_hdr" >&5
++echo "configure:9611: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 9595 "configure"
++#line 9616 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9602: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9623: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -9628,19 +9649,19 @@ EOF
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9632: checking for $ac_hdr" >&5
++echo "configure:9653: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 9637 "configure"
++#line 9658 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9644: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9665: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -9670,19 +9691,19 @@ EOF
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9674: checking for $ac_hdr" >&5
++echo "configure:9695: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 9679 "configure"
++#line 9700 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9686: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9707: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -9712,19 +9733,19 @@ EOF
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9716: checking for $ac_hdr" >&5
++echo "configure:9737: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 9721 "configure"
++#line 9742 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9728: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9749: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -9754,19 +9775,19 @@ EOF
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9758: checking for $ac_hdr" >&5
++echo "configure:9779: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 9763 "configure"
++#line 9784 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9770: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9791: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -9796,19 +9817,19 @@ EOF
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9800: checking for $ac_hdr" >&5
++echo "configure:9821: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 9805 "configure"
++#line 9826 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9812: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9833: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -9839,19 +9860,19 @@ EOF
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9843: checking for $ac_hdr" >&5
++echo "configure:9864: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 9848 "configure"
++#line 9869 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9855: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9876: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -9882,19 +9903,19 @@ EOF
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9886: checking for $ac_hdr" >&5
++echo "configure:9907: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 9891 "configure"
++#line 9912 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9898: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9919: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -9924,19 +9945,19 @@ EOF
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9928: checking for $ac_hdr" >&5
++echo "configure:9949: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 9933 "configure"
++#line 9954 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9940: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:9961: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -9967,19 +9988,19 @@ EOF
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:9971: checking for $ac_hdr" >&5
++echo "configure:9992: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 9976 "configure"
++#line 9997 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:9983: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:10004: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -10016,19 +10037,19 @@ cross_compiling=$ac_cv_prog_cxx_cross
+ NEW_H=new.h
+    ac_safe=`echo "new" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for new""... $ac_c" 1>&6
+-echo "configure:10020: checking for new" >&5
++echo "configure:10041: checking for new" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 10025 "configure"
++#line 10046 "configure"
+ #include "confdefs.h"
+ #include <new>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10032: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:10053: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -10069,19 +10090,19 @@ fi
+ if test "x$enable_dtrace" = "xyes"; then
+      ac_safe=`echo "sys/sdt.h" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for sys/sdt.h""... $ac_c" 1>&6
+-echo "configure:10073: checking for sys/sdt.h" >&5
++echo "configure:10094: checking for sys/sdt.h" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 10078 "configure"
++#line 10099 "configure"
+ #include "confdefs.h"
+ #include <sys/sdt.h>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10085: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:10106: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -10120,19 +10141,19 @@ case $target in
+   do
+        ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
+-echo "configure:10124: checking for $ac_hdr" >&5
++echo "configure:10145: checking for $ac_hdr" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 10129 "configure"
++#line 10150 "configure"
+ #include "confdefs.h"
+ #include <$ac_hdr>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10136: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:10157: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -10166,7 +10187,7 @@ case $target in
+ 	;;
+ *)
+ 	echo $ac_n "checking for gethostbyname_r in -lc_r""... $ac_c" 1>&6
+-echo "configure:10170: checking for gethostbyname_r in -lc_r" >&5
++echo "configure:10191: checking for gethostbyname_r in -lc_r" >&5
+ ac_lib_var=`echo c_r'_'gethostbyname_r | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10174,7 +10195,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lc_r  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10178 "configure"
++#line 10199 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10185,7 +10206,7 @@ int main() {
+ gethostbyname_r()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10189: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10210: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10223,14 +10244,14 @@ case $target in
+ *)
+     
+ echo $ac_n "checking for library containing dlopen""... $ac_c" 1>&6
+-echo "configure:10227: checking for library containing dlopen" >&5
++echo "configure:10248: checking for library containing dlopen" >&5
+ if eval "test \"`echo '$''{'ac_cv_search_dlopen'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   ac_func_search_save_LIBS="$LIBS"
+ ac_cv_search_dlopen="no"
+ cat > conftest.$ac_ext <<EOF
+-#line 10234 "configure"
++#line 10255 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10241,7 +10262,7 @@ int main() {
+ dlopen()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10245: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10266: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_search_dlopen="none required"
+ else
+@@ -10252,7 +10273,7 @@ rm -f conftest*
+ test "$ac_cv_search_dlopen" = "no" && for i in dl; do
+ LIBS="-l$i  $ac_func_search_save_LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10256 "configure"
++#line 10277 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10263,7 +10284,7 @@ int main() {
+ dlopen()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10267: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10288: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_search_dlopen="-l$i"
+ break
+@@ -10281,19 +10302,19 @@ if test "$ac_cv_search_dlopen" != "no"; then
+   test "$ac_cv_search_dlopen" = "none required" || LIBS="$ac_cv_search_dlopen $LIBS"
+      ac_safe=`echo "dlfcn.h" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for dlfcn.h""... $ac_c" 1>&6
+-echo "configure:10285: checking for dlfcn.h" >&5
++echo "configure:10306: checking for dlfcn.h" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 10290 "configure"
++#line 10311 "configure"
+ #include "confdefs.h"
+ #include <dlfcn.h>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10297: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:10318: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -10327,12 +10348,12 @@ CFLAGS="$CFLAGS -D_GNU_SOURCE"
+ for ac_func in dladdr memmem
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:10331: checking for $ac_func" >&5
++echo "configure:10352: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 10336 "configure"
++#line 10357 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -10355,7 +10376,7 @@ $ac_func();
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10359: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10380: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -10386,7 +10407,7 @@ if test ! "$GNU_CXX"; then
+     case $target in
+     *-aix*)
+ 	echo $ac_n "checking for demangle in -lC_r""... $ac_c" 1>&6
+-echo "configure:10390: checking for demangle in -lC_r" >&5
++echo "configure:10411: checking for demangle in -lC_r" >&5
+ ac_lib_var=`echo C_r'_'demangle | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10394,7 +10415,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lC_r  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10398 "configure"
++#line 10419 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10405,7 +10426,7 @@ int main() {
+ demangle()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10409: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10430: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10435,7 +10456,7 @@ fi
+ 	;;
+      *)
+ 	echo $ac_n "checking for demangle in -lC""... $ac_c" 1>&6
+-echo "configure:10439: checking for demangle in -lC" >&5
++echo "configure:10460: checking for demangle in -lC" >&5
+ ac_lib_var=`echo C'_'demangle | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10443,7 +10464,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lC  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10447 "configure"
++#line 10468 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10454,7 +10475,7 @@ int main() {
+ demangle()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10458: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10479: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10490,7 +10511,7 @@ case $target in
+     ;;
+ *)
+     echo $ac_n "checking for socket in -lsocket""... $ac_c" 1>&6
+-echo "configure:10494: checking for socket in -lsocket" >&5
++echo "configure:10515: checking for socket in -lsocket" >&5
+ ac_lib_var=`echo socket'_'socket | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10498,7 +10519,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lsocket  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10502 "configure"
++#line 10523 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10509,7 +10530,7 @@ int main() {
+ socket()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10513: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10534: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10555,7 +10576,7 @@ EOF
+ 	_SAVE_LDFLAGS="$LDFLAGS"
+ 	LDFLAGS="$XLDFLAGS $LDFLAGS"
+ 	echo $ac_n "checking for XDrawLines in -lX11""... $ac_c" 1>&6
+-echo "configure:10559: checking for XDrawLines in -lX11" >&5
++echo "configure:10580: checking for XDrawLines in -lX11" >&5
+ ac_lib_var=`echo X11'_'XDrawLines | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10563,7 +10584,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lX11 $XLIBS $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10567 "configure"
++#line 10588 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10574,7 +10595,7 @@ int main() {
+ XDrawLines()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10578: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10599: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10596,7 +10617,7 @@ MISSING_X="$MISSING_X -lX11"
+ fi
+ 
+ 	echo $ac_n "checking for XextAddDisplay in -lXext""... $ac_c" 1>&6
+-echo "configure:10600: checking for XextAddDisplay in -lXext" >&5
++echo "configure:10621: checking for XextAddDisplay in -lXext" >&5
+ ac_lib_var=`echo Xext'_'XextAddDisplay | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10604,7 +10625,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lXext $XLIBS $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10608 "configure"
++#line 10629 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10615,7 +10636,7 @@ int main() {
+ XextAddDisplay()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10619: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10640: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10638,7 +10659,7 @@ fi
+ 
+ 
+ 	echo $ac_n "checking for XtFree in -lXt""... $ac_c" 1>&6
+-echo "configure:10642: checking for XtFree in -lXt" >&5
++echo "configure:10663: checking for XtFree in -lXt" >&5
+ ac_lib_var=`echo Xt'_'XtFree | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10646,7 +10667,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lXt  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10650 "configure"
++#line 10671 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10657,7 +10678,7 @@ int main() {
+ XtFree()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10661: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10682: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10678,7 +10699,7 @@ else
+ 
+         unset ac_cv_lib_Xt_XtFree
+ 	    echo $ac_n "checking for IceFlush in -lICE""... $ac_c" 1>&6
+-echo "configure:10682: checking for IceFlush in -lICE" >&5
++echo "configure:10703: checking for IceFlush in -lICE" >&5
+ ac_lib_var=`echo ICE'_'IceFlush | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10686,7 +10707,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lICE $XT_LIBS $XLIBS $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10690 "configure"
++#line 10711 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10697,7 +10718,7 @@ int main() {
+ IceFlush()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10701: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10722: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10718,7 +10739,7 @@ else
+ fi
+ 
+ 	    echo $ac_n "checking for SmcCloseConnection in -lSM""... $ac_c" 1>&6
+-echo "configure:10722: checking for SmcCloseConnection in -lSM" >&5
++echo "configure:10743: checking for SmcCloseConnection in -lSM" >&5
+ ac_lib_var=`echo SM'_'SmcCloseConnection | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10726,7 +10747,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lSM $XT_LIBS $XLIBS $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10730 "configure"
++#line 10751 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10737,7 +10758,7 @@ int main() {
+ SmcCloseConnection()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10741: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10762: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10758,7 +10779,7 @@ else
+ fi
+ 
+         echo $ac_n "checking for XtFree in -lXt""... $ac_c" 1>&6
+-echo "configure:10762: checking for XtFree in -lXt" >&5
++echo "configure:10783: checking for XtFree in -lXt" >&5
+ ac_lib_var=`echo Xt'_'XtFree | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10766,7 +10787,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lXt $X_PRE_LIBS $XT_LIBS $XLIBS $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10770 "configure"
++#line 10791 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10777,7 +10798,7 @@ int main() {
+ XtFree()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10781: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10802: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10811,7 +10832,7 @@ fi
+     esac
+ 
+                 echo $ac_n "checking for XShmCreateImage in -lXext""... $ac_c" 1>&6
+-echo "configure:10815: checking for XShmCreateImage in -lXext" >&5
++echo "configure:10836: checking for XShmCreateImage in -lXext" >&5
+ ac_lib_var=`echo Xext'_'XShmCreateImage | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10819,7 +10840,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lXext $XLIBS $XEXT_LIBS $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10823 "configure"
++#line 10844 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10830,7 +10851,7 @@ int main() {
+ XShmCreateImage()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10834: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10855: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10853,19 +10874,19 @@ fi
+ 
+                    ac_safe=`echo "X11/extensions/scrnsaver.h" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for X11/extensions/scrnsaver.h""... $ac_c" 1>&6
+-echo "configure:10857: checking for X11/extensions/scrnsaver.h" >&5
++echo "configure:10878: checking for X11/extensions/scrnsaver.h" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 10862 "configure"
++#line 10883 "configure"
+ #include "confdefs.h"
+ #include <X11/extensions/scrnsaver.h>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10869: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:10890: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -10880,7 +10901,7 @@ fi
+   if eval "test \"`echo '$ac_cv_header_'$ac_safe`\" = yes"; then
+     echo "$ac_t""yes" 1>&6
+     echo $ac_n "checking for XScreenSaverQueryInfo in -lXss""... $ac_c" 1>&6
+-echo "configure:10884: checking for XScreenSaverQueryInfo in -lXss" >&5
++echo "configure:10905: checking for XScreenSaverQueryInfo in -lXss" >&5
+ ac_lib_var=`echo Xss'_'XScreenSaverQueryInfo | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -10888,7 +10909,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lXss $XEXT_LIBS $XLIBS $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 10892 "configure"
++#line 10913 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ /* We use char because int might match the return type of a gcc2
+@@ -10899,7 +10920,7 @@ int main() {
+ XScreenSaverQueryInfo()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:10903: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:10924: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -10971,7 +10992,7 @@ fi
+ # Extract the first word of "freetype-config", so it can be a program name with args.
+ set dummy freetype-config; ac_word=$2
+ echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
+-echo "configure:10975: checking for $ac_word" >&5
++echo "configure:10996: checking for $ac_word" >&5
+ if eval "test \"`echo '$''{'ac_cv_path_FT2_CONFIG'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -11007,7 +11028,7 @@ fi
+ 
+ min_ft_version=6.1.0
+ echo $ac_n "checking for FreeType - version >= $min_ft_version""... $ac_c" 1>&6
+-echo "configure:11011: checking for FreeType - version >= $min_ft_version" >&5
++echo "configure:11032: checking for FreeType - version >= $min_ft_version" >&5
+ no_ft=""
+ if test "$FT2_CONFIG" = "no" ; then
+   no_ft=yes
+@@ -11055,7 +11076,7 @@ else
+   echo $ac_n "cross compiling; assumed OK... $ac_c"
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11059 "configure"
++#line 11080 "configure"
+ #include "confdefs.h"
+ 
+ #include <ft2build.h>
+@@ -11081,7 +11102,7 @@ main()
+ }
+ 
+ EOF
+-if { (eval echo configure:11085: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:11106: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   :
+ else
+@@ -11131,12 +11152,12 @@ fi
+     	CFLAGS="$CFLAGS $FT2_CFLAGS"
+ 
+         echo $ac_n "checking for FT_Bitmap_Size.y_ppem""... $ac_c" 1>&6
+-echo "configure:11135: checking for FT_Bitmap_Size.y_ppem" >&5
++echo "configure:11156: checking for FT_Bitmap_Size.y_ppem" >&5
+ if eval "test \"`echo '$''{'ac_cv_member_FT_Bitmap_Size_y_ppem'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11140 "configure"
++#line 11161 "configure"
+ #include "confdefs.h"
+ #include <ft2build.h>
+                              #include FT_FREETYPE_H
+@@ -11146,7 +11167,7 @@ FT_Bitmap_Size s;
+                              return 1
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11150: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:11171: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_member_FT_Bitmap_Size_y_ppem=yes
+ else
+@@ -11172,12 +11193,12 @@ EOF
+         for ac_func in FT_GlyphSlot_Embolden FT_Load_Sfnt_Table FT_Select_Size
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:11176: checking for $ac_func" >&5
++echo "configure:11197: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11181 "configure"
++#line 11202 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -11200,7 +11221,7 @@ $ac_func();
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11204: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11225: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -11245,7 +11266,7 @@ darwin*)
+ *)
+     
+ echo $ac_n "checking for pthread_create in -lpthreads""... $ac_c" 1>&6
+-echo "configure:11249: checking for pthread_create in -lpthreads" >&5
++echo "configure:11270: checking for pthread_create in -lpthreads" >&5
+ echo "
+     #include <pthread.h>
+     #include <stdlib.h>
+@@ -11268,7 +11289,7 @@ echo "
+         echo "$ac_t""no" 1>&6
+         
+ echo $ac_n "checking for pthread_create in -lpthread""... $ac_c" 1>&6
+-echo "configure:11272: checking for pthread_create in -lpthread" >&5
++echo "configure:11293: checking for pthread_create in -lpthread" >&5
+ echo "
+     #include <pthread.h>
+     #include <stdlib.h>
+@@ -11291,7 +11312,7 @@ echo "
+         echo "$ac_t""no" 1>&6
+         
+ echo $ac_n "checking for pthread_create in -lc_r""... $ac_c" 1>&6
+-echo "configure:11295: checking for pthread_create in -lc_r" >&5
++echo "configure:11316: checking for pthread_create in -lc_r" >&5
+ echo "
+     #include <pthread.h>
+     #include <stdlib.h>
+@@ -11314,7 +11335,7 @@ echo "
+         echo "$ac_t""no" 1>&6
+         
+ echo $ac_n "checking for pthread_create in -lc""... $ac_c" 1>&6
+-echo "configure:11318: checking for pthread_create in -lc" >&5
++echo "configure:11339: checking for pthread_create in -lc" >&5
+ echo "
+     #include <pthread.h>
+     #include <stdlib.h>
+@@ -11373,7 +11394,7 @@ then
+ 				rm -f conftest*
+ 	ac_cv_have_dash_pthread=no
+ 	echo $ac_n "checking whether ${CC-cc} accepts -pthread""... $ac_c" 1>&6
+-echo "configure:11377: checking whether ${CC-cc} accepts -pthread" >&5
++echo "configure:11398: checking whether ${CC-cc} accepts -pthread" >&5
+ 	echo 'int main() { return 0; }' | cat > conftest.c
+ 	${CC-cc} -pthread -o conftest conftest.c > conftest.out 2>&1
+ 	if test $? -eq 0; then
+@@ -11396,7 +11417,7 @@ echo "configure:11377: checking whether ${CC-cc} accepts -pthread" >&5
+ 			    ac_cv_have_dash_pthreads=no
+     if test "$ac_cv_have_dash_pthread" = "no"; then
+ 	    echo $ac_n "checking whether ${CC-cc} accepts -pthreads""... $ac_c" 1>&6
+-echo "configure:11400: checking whether ${CC-cc} accepts -pthreads" >&5
++echo "configure:11421: checking whether ${CC-cc} accepts -pthreads" >&5
+     	echo 'int main() { return 0; }' | cat > conftest.c
+ 	    ${CC-cc} -pthreads -o conftest conftest.c > conftest.out 2>&1
+     	if test $? -eq 0; then
+@@ -11479,13 +11500,13 @@ fi
+ 
+ if test $ac_cv_prog_gcc = yes; then
+     echo $ac_n "checking whether ${CC-cc} needs -traditional""... $ac_c" 1>&6
+-echo "configure:11483: checking whether ${CC-cc} needs -traditional" >&5
++echo "configure:11504: checking whether ${CC-cc} needs -traditional" >&5
+ if eval "test \"`echo '$''{'ac_cv_prog_gcc_traditional'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+     ac_pattern="Autoconf.*'x'"
+   cat > conftest.$ac_ext <<EOF
+-#line 11489 "configure"
++#line 11510 "configure"
+ #include "confdefs.h"
+ #include <sgtty.h>
+ Autoconf TIOCGETP
+@@ -11503,7 +11524,7 @@ rm -f conftest*
+ 
+   if test $ac_cv_prog_gcc_traditional = no; then
+     cat > conftest.$ac_ext <<EOF
+-#line 11507 "configure"
++#line 11528 "configure"
+ #include "confdefs.h"
+ #include <termio.h>
+ Autoconf TCGETA
+@@ -11525,7 +11546,7 @@ echo "$ac_t""$ac_cv_prog_gcc_traditional" 1>&6
+ fi
+ 
+ echo $ac_n "checking for 8-bit clean memcmp""... $ac_c" 1>&6
+-echo "configure:11529: checking for 8-bit clean memcmp" >&5
++echo "configure:11550: checking for 8-bit clean memcmp" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_memcmp_clean'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -11533,7 +11554,7 @@ else
+   ac_cv_func_memcmp_clean=no
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11537 "configure"
++#line 11558 "configure"
+ #include "confdefs.h"
+ 
+ main()
+@@ -11543,7 +11564,7 @@ main()
+ }
+ 
+ EOF
+-if { (eval echo configure:11547: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:11568: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   ac_cv_func_memcmp_clean=yes
+ else
+@@ -11563,12 +11584,12 @@ test $ac_cv_func_memcmp_clean = no && LIBOBJS="$LIBOBJS memcmp.${ac_objext}"
+ for ac_func in random strerror lchown fchmod snprintf statvfs memmove rint stat64 lstat64 truncate64 statvfs64 setbuf isatty
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:11567: checking for $ac_func" >&5
++echo "configure:11588: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11572 "configure"
++#line 11593 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -11591,7 +11612,7 @@ $ac_func();
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11595: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11616: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -11618,12 +11639,12 @@ done
+ for ac_func in flockfile getpagesize
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:11622: checking for $ac_func" >&5
++echo "configure:11643: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11627 "configure"
++#line 11648 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -11646,7 +11667,7 @@ $ac_func();
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11650: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11671: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -11673,12 +11694,12 @@ done
+ for ac_func in localtime_r strtok_r
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:11677: checking for $ac_func" >&5
++echo "configure:11698: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11682 "configure"
++#line 11703 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -11701,7 +11722,7 @@ $ac_func();
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11705: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11726: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -11729,12 +11750,12 @@ done
+ _SAVE_LDFLAGS=$LDFLAGS
+ LDFLAGS="$LDFLAGS -lrt"
+ echo $ac_n "checking for clock_gettime(CLOCK_MONOTONIC) and -lrt""... $ac_c" 1>&6
+-echo "configure:11733: checking for clock_gettime(CLOCK_MONOTONIC) and -lrt" >&5
++echo "configure:11754: checking for clock_gettime(CLOCK_MONOTONIC) and -lrt" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_clock_monotonic'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11738 "configure"
++#line 11759 "configure"
+ #include "confdefs.h"
+ #include <time.h>
+ int main() {
+@@ -11742,7 +11763,7 @@ int main() {
+                               clock_gettime(CLOCK_MONOTONIC, &ts); 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11746: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11767: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_have_clock_monotonic=yes
+ else
+@@ -11777,19 +11798,19 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ echo $ac_n "checking for wcrtomb""... $ac_c" 1>&6
+-echo "configure:11781: checking for wcrtomb" >&5
++echo "configure:11802: checking for wcrtomb" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_wcrtomb'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11786 "configure"
++#line 11807 "configure"
+ #include "confdefs.h"
+ #include <wchar.h>
+ int main() {
+ mbstate_t ps={0};wcrtomb(0,'f',&ps);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11793: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11814: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_have_wcrtomb="yes"
+ else
+@@ -11809,19 +11830,19 @@ EOF
+ 
+ fi
+ echo $ac_n "checking for mbrtowc""... $ac_c" 1>&6
+-echo "configure:11813: checking for mbrtowc" >&5
++echo "configure:11834: checking for mbrtowc" >&5
+ if eval "test \"`echo '$''{'ac_cv_have_mbrtowc'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11818 "configure"
++#line 11839 "configure"
+ #include "confdefs.h"
+ #include <wchar.h>
+ int main() {
+ mbstate_t ps={0};mbrtowc(0,0,0,&ps);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11825: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11846: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_have_mbrtowc="yes"
+ else
+@@ -11850,12 +11871,12 @@ cross_compiling=$ac_cv_prog_cc_cross
+ fi
+ 
+ echo $ac_n "checking for res_ninit()""... $ac_c" 1>&6
+-echo "configure:11854: checking for res_ninit()" >&5
++echo "configure:11875: checking for res_ninit()" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_res_ninit'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11859 "configure"
++#line 11880 "configure"
+ #include "confdefs.h"
+ 
+         #ifdef linux
+@@ -11867,7 +11888,7 @@ int main() {
+ int foo = res_ninit(&_res);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11871: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11892: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_func_res_ninit=yes
+ else
+@@ -11897,12 +11918,12 @@ ac_link='${CXX-g++} -o conftest${ac_exeext} $CXXFLAGS $CPPFLAGS $LDFLAGS conftes
+ cross_compiling=$ac_cv_prog_cxx_cross
+ 
+ echo $ac_n "checking for gnu_get_libc_version()""... $ac_c" 1>&6
+-echo "configure:11901: checking for gnu_get_libc_version()" >&5
++echo "configure:11922: checking for gnu_get_libc_version()" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_gnu_get_libc_version'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 11906 "configure"
++#line 11927 "configure"
+ #include "confdefs.h"
+ 
+         #ifdef HAVE_GNU_LIBC_VERSION_H
+@@ -11913,7 +11934,7 @@ int main() {
+ const char *glibc_version = gnu_get_libc_version();
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11917: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11938: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_func_gnu_get_libc_version=yes
+ else
+@@ -11942,7 +11963,7 @@ case $target_os in
+     *)
+ 
+ echo $ac_n "checking for iconv in -lc""... $ac_c" 1>&6
+-echo "configure:11946: checking for iconv in -lc" >&5
++echo "configure:11967: checking for iconv in -lc" >&5
+ ac_lib_var=`echo c'_'iconv | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -11950,7 +11971,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-lc  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 11954 "configure"
++#line 11975 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ #ifdef __cplusplus
+@@ -11964,7 +11985,7 @@ int main() {
+ iconv()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:11968: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:11989: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -11983,7 +12004,7 @@ if eval "test \"`echo '$ac_cv_lib_'$ac_lib_var`\" = yes"; then
+ else
+   echo "$ac_t""no" 1>&6
+ echo $ac_n "checking for iconv in -liconv""... $ac_c" 1>&6
+-echo "configure:11987: checking for iconv in -liconv" >&5
++echo "configure:12008: checking for iconv in -liconv" >&5
+ ac_lib_var=`echo iconv'_'iconv | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -11991,7 +12012,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-liconv  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 11995 "configure"
++#line 12016 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ #ifdef __cplusplus
+@@ -12005,7 +12026,7 @@ int main() {
+ iconv()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12009: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:12030: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -12024,7 +12045,7 @@ if eval "test \"`echo '$ac_cv_lib_'$ac_lib_var`\" = yes"; then
+ else
+   echo "$ac_t""no" 1>&6
+ echo $ac_n "checking for libiconv in -liconv""... $ac_c" 1>&6
+-echo "configure:12028: checking for libiconv in -liconv" >&5
++echo "configure:12049: checking for libiconv in -liconv" >&5
+ ac_lib_var=`echo iconv'_'libiconv | sed 'y%./+-%__p_%'`
+ if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+@@ -12032,7 +12053,7 @@ else
+   ac_save_LIBS="$LIBS"
+ LIBS="-liconv  $LIBS"
+ cat > conftest.$ac_ext <<EOF
+-#line 12036 "configure"
++#line 12057 "configure"
+ #include "confdefs.h"
+ /* Override any gcc2 internal prototype to avoid an error.  */
+ #ifdef __cplusplus
+@@ -12046,7 +12067,7 @@ int main() {
+ libiconv()
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12050: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:12071: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_lib_$ac_lib_var=yes"
+ else
+@@ -12073,12 +12094,12 @@ fi
+ _SAVE_LIBS=$LIBS
+ LIBS="$LIBS $_ICONV_LIBS"
+ echo $ac_n "checking for iconv()""... $ac_c" 1>&6
+-echo "configure:12077: checking for iconv()" >&5
++echo "configure:12098: checking for iconv()" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_iconv'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12082 "configure"
++#line 12103 "configure"
+ #include "confdefs.h"
+ 
+         #include <stdlib.h>
+@@ -12092,7 +12113,7 @@ int main() {
+         
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12096: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:12117: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_func_iconv=yes
+ else
+@@ -12116,12 +12137,12 @@ EOF
+     LIBXUL_LIBS="$LIBXUL_LIBS $_ICONV_LIBS"
+     LIBICONV="$_ICONV_LIBS"
+     echo $ac_n "checking for iconv() with const input""... $ac_c" 1>&6
+-echo "configure:12120: checking for iconv() with const input" >&5
++echo "configure:12141: checking for iconv() with const input" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_const_iconv'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12125 "configure"
++#line 12146 "configure"
+ #include "confdefs.h"
+ 
+             #include <stdlib.h>
+@@ -12136,7 +12157,7 @@ int main() {
+             
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12140: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12161: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_func_const_iconv=yes
+ else
+@@ -12165,19 +12186,19 @@ esac
+ 
+ 
+   echo $ac_n "checking for nl_langinfo and CODESET""... $ac_c" 1>&6
+-echo "configure:12169: checking for nl_langinfo and CODESET" >&5
++echo "configure:12190: checking for nl_langinfo and CODESET" >&5
+ if eval "test \"`echo '$''{'am_cv_langinfo_codeset'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12174 "configure"
++#line 12195 "configure"
+ #include "confdefs.h"
+ #include <langinfo.h>
+ int main() {
+ char* cs = nl_langinfo(CODESET);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12181: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:12202: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   am_cv_langinfo_codeset=yes
+ else
+@@ -12209,7 +12230,7 @@ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ 
+ echo $ac_n "checking for an implementation of va_copy()""... $ac_c" 1>&6
+-echo "configure:12213: checking for an implementation of va_copy()" >&5
++echo "configure:12234: checking for an implementation of va_copy()" >&5
+ if eval "test \"`echo '$''{'ac_cv_va_copy'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -12219,7 +12240,7 @@ else
+     
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12223 "configure"
++#line 12244 "configure"
+ #include "confdefs.h"
+ 
+         #include <stdarg.h>
+@@ -12233,7 +12254,7 @@ else
+         }
+         int main() { f (0, 42); return 0; }
+ EOF
+-if { (eval echo configure:12237: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:12258: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   ac_cv_va_copy=yes
+ else
+@@ -12250,7 +12271,7 @@ fi
+ 
+ echo "$ac_t""$ac_cv_va_copy" 1>&6
+ echo $ac_n "checking for an implementation of __va_copy()""... $ac_c" 1>&6
+-echo "configure:12254: checking for an implementation of __va_copy()" >&5
++echo "configure:12275: checking for an implementation of __va_copy()" >&5
+ if eval "test \"`echo '$''{'ac_cv___va_copy'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -12260,7 +12281,7 @@ else
+     
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12264 "configure"
++#line 12285 "configure"
+ #include "confdefs.h"
+ 
+         #include <stdarg.h>
+@@ -12274,7 +12295,7 @@ else
+         }
+         int main() { f (0, 42); return 0; }
+ EOF
+-if { (eval echo configure:12278: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:12299: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   ac_cv___va_copy=yes
+ else
+@@ -12291,7 +12312,7 @@ fi
+ 
+ echo "$ac_t""$ac_cv___va_copy" 1>&6
+ echo $ac_n "checking whether va_lists can be copied by value""... $ac_c" 1>&6
+-echo "configure:12295: checking whether va_lists can be copied by value" >&5
++echo "configure:12316: checking whether va_lists can be copied by value" >&5
+ if eval "test \"`echo '$''{'ac_cv_va_val_copy'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -12301,7 +12322,7 @@ else
+     
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12305 "configure"
++#line 12326 "configure"
+ #include "confdefs.h"
+ 
+         #include <stdarg.h>
+@@ -12315,7 +12336,7 @@ else
+         }
+         int main() { f (0, 42); return 0; }
+ EOF
+-if { (eval echo configure:12319: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:12340: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   ac_cv_va_val_copy=yes
+ else
+@@ -12370,12 +12391,12 @@ ARM_ABI_PREFIX=
+ if test "$GNU_CC"; then
+   if test "$CPU_ARCH" = "arm" ; then
+     echo $ac_n "checking for ARM EABI""... $ac_c" 1>&6
+-echo "configure:12374: checking for ARM EABI" >&5
++echo "configure:12395: checking for ARM EABI" >&5
+ if eval "test \"`echo '$''{'ac_cv_gcc_arm_eabi'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12379 "configure"
++#line 12400 "configure"
+ #include "confdefs.h"
+ 
+ int main() {
+@@ -12388,7 +12409,7 @@ int main() {
+                         
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12392: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12413: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_gcc_arm_eabi="yes"
+ else
+@@ -12413,12 +12434,12 @@ echo "$ac_t""$ac_cv_gcc_arm_eabi" 1>&6
+ fi
+ 
+ echo $ac_n "checking for modern C++ template specialization syntax support""... $ac_c" 1>&6
+-echo "configure:12417: checking for modern C++ template specialization syntax support" >&5
++echo "configure:12438: checking for modern C++ template specialization syntax support" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_modern_specialize_template_syntax'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12422 "configure"
++#line 12443 "configure"
+ #include "confdefs.h"
+ template <class T> struct X { int a; };
+                                class Y {};
+@@ -12428,7 +12449,7 @@ X<int> int_x;
+                                X<Y> y_x;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12432: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12453: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_modern_specialize_template_syntax=yes
+ else
+@@ -12450,12 +12471,12 @@ fi
+ 
+ 
+ echo $ac_n "checking whether partial template specialization works""... $ac_c" 1>&6
+-echo "configure:12454: checking whether partial template specialization works" >&5
++echo "configure:12475: checking whether partial template specialization works" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_partial_specialization'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12459 "configure"
++#line 12480 "configure"
+ #include "confdefs.h"
+ template <class T> class Foo {};
+                                template <class T> class Foo<T*> {};
+@@ -12463,7 +12484,7 @@ int main() {
+ return 0;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12467: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12488: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_partial_specialization=yes
+ else
+@@ -12484,12 +12505,12 @@ EOF
+ fi
+ 
+ echo $ac_n "checking whether the C++ \"using\" keyword resolves ambiguity""... $ac_c" 1>&6
+-echo "configure:12488: checking whether the C++ \"using\" keyword resolves ambiguity" >&5
++echo "configure:12509: checking whether the C++ \"using\" keyword resolves ambiguity" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_ambiguity_resolving_using'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12493 "configure"
++#line 12514 "configure"
+ #include "confdefs.h"
+ class X {
+                                  public: int go(const X&) {return 3;}
+@@ -12505,7 +12526,7 @@ int main() {
+ X x; Y y; y.jo(x);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12509: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12530: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_cpp_ambiguity_resolving_using=yes
+ else
+@@ -12526,7 +12547,7 @@ EOF
+ fi
+ 
+ echo $ac_n "checking for C++ dynamic_cast to void*""... $ac_c" 1>&6
+-echo "configure:12530: checking for C++ dynamic_cast to void*" >&5
++echo "configure:12551: checking for C++ dynamic_cast to void*" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_dynamic_cast_void_ptr'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+@@ -12534,7 +12555,7 @@ else
+   ac_cv_cpp_dynamic_cast_void_ptr=no
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12538 "configure"
++#line 12559 "configure"
+ #include "confdefs.h"
+ class X { int i; public: virtual ~X() { } };
+                             class Y { int j; public: virtual ~Y() { } };
+@@ -12550,7 +12571,7 @@ class X { int i; public: virtual ~X() { } };
+                                            ((void*)&mdo == dynamic_cast<void*>(suby))));
+                             }
+ EOF
+-if { (eval echo configure:12554: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:12575: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
+ then
+   ac_cv_cpp_dynamic_cast_void_ptr=yes
+ else
+@@ -12574,19 +12595,19 @@ fi
+ 
+ 
+ echo $ac_n "checking whether C++ requires implementation of unused virtual methods""... $ac_c" 1>&6
+-echo "configure:12578: checking whether C++ requires implementation of unused virtual methods" >&5
++echo "configure:12599: checking whether C++ requires implementation of unused virtual methods" >&5
+ if eval "test \"`echo '$''{'ac_cv_cpp_unused_required'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12583 "configure"
++#line 12604 "configure"
+ #include "confdefs.h"
+ class X {private: virtual void never_called();};
+ int main() {
+ X x;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12590: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:12611: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_cpp_unused_required=no
+ else
+@@ -12609,12 +12630,12 @@ fi
+ 
+ 
+ echo $ac_n "checking for trouble comparing to zero near std::operator!=()""... $ac_c" 1>&6
+-echo "configure:12613: checking for trouble comparing to zero near std::operator!=()" >&5
++echo "configure:12634: checking for trouble comparing to zero near std::operator!=()" >&5
+ if eval "test \"`echo '$''{'ac_cv_trouble_comparing_to_zero'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12618 "configure"
++#line 12639 "configure"
+ #include "confdefs.h"
+ #include <algorithm>
+                                 template <class T> class Foo {};
+@@ -12625,7 +12646,7 @@ int main() {
+ Foo<int> f; return (0 != f);
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12629: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12650: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_trouble_comparing_to_zero=no
+ else
+@@ -12652,19 +12673,19 @@ fi
+ _SAVE_LDFLAGS=$LDFLAGS
+ LDFLAGS="$LDFLAGS $DSO_PIC_CFLAGS $DSO_LDOPTS $MOZ_OPTIMIZE_LDFLAGS"
+ echo $ac_n "checking for __thread keyword for TLS variables""... $ac_c" 1>&6
+-echo "configure:12656: checking for __thread keyword for TLS variables" >&5
++echo "configure:12677: checking for __thread keyword for TLS variables" >&5
+ if eval "test \"`echo '$''{'ac_cv_thread_keyword'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12661 "configure"
++#line 12682 "configure"
+ #include "confdefs.h"
+ __thread bool tlsIsMainThread = false;
+ int main() {
+ return tlsIsMainThread;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12668: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:12689: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   ac_cv_thread_keyword=yes
+ else
+@@ -12701,19 +12722,19 @@ fi
+ MALLOC_H=
+    ac_safe=`echo "malloc.h" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for malloc.h""... $ac_c" 1>&6
+-echo "configure:12705: checking for malloc.h" >&5
++echo "configure:12726: checking for malloc.h" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 12710 "configure"
++#line 12731 "configure"
+ #include "confdefs.h"
+ #include <malloc.h>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12717: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12738: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -12736,19 +12757,19 @@ fi
+ if test "$MALLOC_H" = ""; then
+      ac_safe=`echo "malloc/malloc.h" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for malloc/malloc.h""... $ac_c" 1>&6
+-echo "configure:12740: checking for malloc/malloc.h" >&5
++echo "configure:12761: checking for malloc/malloc.h" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 12745 "configure"
++#line 12766 "configure"
+ #include "confdefs.h"
+ #include <malloc/malloc.h>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12752: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12773: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -12771,19 +12792,19 @@ fi
+   if test "$MALLOC_H" = ""; then
+        ac_safe=`echo "sys/malloc.h" | sed 'y%./+-%__p_%'`
+   echo $ac_n "checking for sys/malloc.h""... $ac_c" 1>&6
+-echo "configure:12775: checking for sys/malloc.h" >&5
++echo "configure:12796: checking for sys/malloc.h" >&5
+   if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+    cat > conftest.$ac_ext <<EOF
+-#line 12780 "configure"
++#line 12801 "configure"
+ #include "confdefs.h"
+ #include <sys/malloc.h>
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12787: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12808: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   eval "ac_cv_header_$ac_safe=yes"
+ else
+@@ -12816,12 +12837,12 @@ MOZ_ALLOCATING_FUNCS="strndup posix_memalign memalign valloc"
+ for ac_func in strndup posix_memalign memalign valloc
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:12820: checking for $ac_func" >&5
++echo "configure:12841: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12825 "configure"
++#line 12846 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -12847,7 +12868,7 @@ $ac_func();
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12851: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:12872: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -12874,19 +12895,19 @@ done
+ 
+ 
+ echo $ac_n "checking for __attribute__((always_inline))""... $ac_c" 1>&6
+-echo "configure:12878: checking for __attribute__((always_inline))" >&5
++echo "configure:12899: checking for __attribute__((always_inline))" >&5
+ if eval "test \"`echo '$''{'ac_cv_attribute_always_inline'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12883 "configure"
++#line 12904 "configure"
+ #include "confdefs.h"
+ inline void f(void) __attribute__((always_inline));
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12890: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12911: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_attribute_always_inline=yes
+ else
+@@ -12901,19 +12922,19 @@ fi
+ echo "$ac_t""$ac_cv_attribute_always_inline" 1>&6
+ 
+ echo $ac_n "checking for __attribute__((malloc))""... $ac_c" 1>&6
+-echo "configure:12905: checking for __attribute__((malloc))" >&5
++echo "configure:12926: checking for __attribute__((malloc))" >&5
+ if eval "test \"`echo '$''{'ac_cv_attribute_malloc'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12910 "configure"
++#line 12931 "configure"
+ #include "confdefs.h"
+ void* f(int) __attribute__((malloc));
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12917: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12938: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_attribute_malloc=yes
+ else
+@@ -12928,19 +12949,19 @@ fi
+ echo "$ac_t""$ac_cv_attribute_malloc" 1>&6
+ 
+ echo $ac_n "checking for __attribute__((warn_unused_result))""... $ac_c" 1>&6
+-echo "configure:12932: checking for __attribute__((warn_unused_result))" >&5
++echo "configure:12953: checking for __attribute__((warn_unused_result))" >&5
+ if eval "test \"`echo '$''{'ac_cv_attribute_warn_unused'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12937 "configure"
++#line 12958 "configure"
+ #include "confdefs.h"
+ int f(void) __attribute__((warn_unused_result));
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12944: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12965: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_attribute_warn_unused=yes
+ else
+@@ -12955,19 +12976,19 @@ fi
+ echo "$ac_t""$ac_cv_attribute_warn_unused" 1>&6
+ 
+ echo $ac_n "checking for __attribute__((noreturn))""... $ac_c" 1>&6
+-echo "configure:12959: checking for __attribute__((noreturn))" >&5
++echo "configure:12980: checking for __attribute__((noreturn))" >&5
+ if eval "test \"`echo '$''{'ac_cv_attribute_noreturn'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 12964 "configure"
++#line 12985 "configure"
+ #include "confdefs.h"
+ void f(void) __attribute__((noreturn));
+ int main() {
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:12971: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:12992: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_attribute_noreturn=yes
+ else
+@@ -12991,19 +13012,19 @@ cross_compiling=$ac_cv_prog_cc_cross
+ 
+ 
+ echo $ac_n "checking for LC_MESSAGES""... $ac_c" 1>&6
+-echo "configure:12995: checking for LC_MESSAGES" >&5
++echo "configure:13016: checking for LC_MESSAGES" >&5
+ if eval "test \"`echo '$''{'ac_cv_i18n_lc_messages'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 13000 "configure"
++#line 13021 "configure"
+ #include "confdefs.h"
+ #include <locale.h>
+ int main() {
+ int category = LC_MESSAGES;
+ ; return 0; }
+ EOF
+-if { (eval echo configure:13007: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:13028: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+   rm -rf conftest*
+   ac_cv_i18n_lc_messages=yes
+ else
+@@ -13026,12 +13047,12 @@ fi
+ for ac_func in localeconv
+ do
+ echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
+-echo "configure:13030: checking for $ac_func" >&5
++echo "configure:13051: checking for $ac_func" >&5
+ if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   cat > conftest.$ac_ext <<EOF
+-#line 13035 "configure"
++#line 13056 "configure"
+ #include "confdefs.h"
+ /* System header to define __stub macros and hopefully few prototypes,
+     which can conflict with char $ac_func(); below.  */
+@@ -13054,7 +13075,7 @@ $ac_func();
+ 
+ ; return 0; }
+ EOF
+-if { (eval echo configure:13058: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:13079: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   rm -rf conftest*
+   eval "ac_cv_func_$ac_func=yes"
+ else
+@@ -13173,6 +13194,7 @@ fi
  
  if test -n "$LIBXUL_SDK"; then
      LIBXUL_DIST="$LIBXUL_SDK"
@@ -10,43 +4590,43 @@ index b8e7773..67ba888 100755
  else
      LIBXUL_DIST="$MOZ_BUILD_ROOT/dist"
  fi
-@@ -13243,7 +13244,7 @@ fi
+@@ -13243,7 +13265,7 @@ fi
  	# Extract the first word of "nspr-config", so it can be a program name with args.
  set dummy nspr-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:13247: checking for $ac_word" >&5
-+echo "configure:13248: checking for $ac_word" >&5
++echo "configure:13269: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_NSPR_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -13278,7 +13279,7 @@ fi
+@@ -13278,7 +13300,7 @@ fi
  
  	min_nspr_version=4.8.8
  	echo $ac_n "checking for NSPR - version >= $min_nspr_version""... $ac_c" 1>&6
 -echo "configure:13282: checking for NSPR - version >= $min_nspr_version" >&5
-+echo "configure:13283: checking for NSPR - version >= $min_nspr_version" >&5
++echo "configure:13304: checking for NSPR - version >= $min_nspr_version" >&5
  
  	no_nspr=""
  	if test "$NSPR_CONFIG" != "no"; then
-@@ -13337,7 +13338,7 @@ if test -n "$MOZ_NATIVE_NSPR"; then
+@@ -13337,7 +13359,7 @@ if test -n "$MOZ_NATIVE_NSPR"; then
      _SAVE_CFLAGS=$CFLAGS
      CFLAGS="$CFLAGS $NSPR_CFLAGS"
      cat > conftest.$ac_ext <<EOF
 -#line 13341 "configure"
-+#line 13342 "configure"
++#line 13363 "configure"
  #include "confdefs.h"
  #include "prtypes.h"
  int main() {
-@@ -13346,7 +13347,7 @@ int main() {
+@@ -13346,7 +13368,7 @@ int main() {
                   #endif
  ; return 0; }
  EOF
 -if { (eval echo configure:13350: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13351: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:13372: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    MOZ_NATIVE_NSPR=1
  else
-@@ -13358,6 +13359,10 @@ fi
+@@ -13358,6 +13380,10 @@ fi
  rm -f conftest*
      CFLAGS=$_SAVE_CFLAGS
  else
@@ -57,7 +4637,7 @@ index b8e7773..67ba888 100755
      if test "$OS_ARCH" = "WINNT"; then
          NSPR_CFLAGS="-I${LIBXUL_DIST}/include/nspr"
          if test -n "$GNU_CC"; then
-@@ -13369,6 +13374,7 @@ else
+@@ -13369,6 +13395,7 @@ else
          NSPR_CFLAGS='`$(LIBXUL_DIST)/sdk/bin/nspr-config --prefix='${LIBXUL_DIST}' --includedir='${LIBXUL_DIST}'/include/nspr --cflags`'
          NSPR_LIBS='`$(LIBXUL_DIST)/sdk/bin/nspr-config --prefix='${LIBXUL_DIST}' --libdir='${LIBXUL_DIST}'/lib --libs`'
      fi
@@ -65,18 +4645,18 @@ index b8e7773..67ba888 100755
  fi
  
  # Check whether --with-system-libevent or --without-system-libevent was given.
-@@ -13391,19 +13397,19 @@ else
+@@ -13391,19 +13418,19 @@ else
      LDFLAGS="-L${LIBEVENT_DIR}/lib $LDFLAGS"
         ac_safe=`echo "event.h" | sed 'y%./+-%__p_%'`
    echo $ac_n "checking for event.h""... $ac_c" 1>&6
 -echo "configure:13395: checking for event.h" >&5
-+echo "configure:13401: checking for event.h" >&5
++echo "configure:13422: checking for event.h" >&5
    if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
     cat > conftest.$ac_ext <<EOF
 -#line 13400 "configure"
-+#line 13406 "configure"
++#line 13427 "configure"
  #include "confdefs.h"
  #include <event.h>
  int main() {
@@ -84,99 +4664,99 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:13407: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13413: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:13434: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    eval "ac_cv_header_$ac_safe=yes"
  else
-@@ -13426,7 +13432,7 @@ fi
+@@ -13426,7 +13453,7 @@ fi
    fi
  
      echo $ac_n "checking for event_init in -levent""... $ac_c" 1>&6
 -echo "configure:13430: checking for event_init in -levent" >&5
-+echo "configure:13436: checking for event_init in -levent" >&5
++echo "configure:13457: checking for event_init in -levent" >&5
  ac_lib_var=`echo event'_'event_init | sed 'y%./+-%__p_%'`
  if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
-@@ -13434,7 +13440,7 @@ else
+@@ -13434,7 +13461,7 @@ else
    ac_save_LIBS="$LIBS"
  LIBS="-levent  $LIBS"
  cat > conftest.$ac_ext <<EOF
 -#line 13438 "configure"
-+#line 13444 "configure"
++#line 13465 "configure"
  #include "confdefs.h"
  /* Override any gcc2 internal prototype to avoid an error.  */
  /* We use char because int might match the return type of a gcc2
-@@ -13445,7 +13451,7 @@ int main() {
+@@ -13445,7 +13472,7 @@ int main() {
  event_init()
  ; return 0; }
  EOF
 -if { (eval echo configure:13449: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:13455: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:13476: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    eval "ac_cv_lib_$ac_lib_var=yes"
  else
-@@ -13528,7 +13534,7 @@ fi
+@@ -13528,7 +13555,7 @@ fi
  	# Extract the first word of "nss-config", so it can be a program name with args.
  set dummy nss-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:13532: checking for $ac_word" >&5
-+echo "configure:13538: checking for $ac_word" >&5
++echo "configure:13559: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_NSS_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -13563,7 +13569,7 @@ fi
+@@ -13563,7 +13590,7 @@ fi
  
  	min_nss_version=3.13.1
  	echo $ac_n "checking for NSS - version >= $min_nss_version""... $ac_c" 1>&6
 -echo "configure:13567: checking for NSS - version >= $min_nss_version" >&5
-+echo "configure:13573: checking for NSS - version >= $min_nss_version" >&5
++echo "configure:13594: checking for NSS - version >= $min_nss_version" >&5
  
  	no_nss=""
  	if test "$NSS_CONFIG" = "no"; then
-@@ -13636,13 +13642,13 @@ fi
+@@ -13636,13 +13663,13 @@ fi
  
  
  echo $ac_n "checking for YASM assembler""... $ac_c" 1>&6
 -echo "configure:13640: checking for YASM assembler" >&5
-+echo "configure:13646: checking for YASM assembler" >&5
++echo "configure:13667: checking for YASM assembler" >&5
  for ac_prog in yasm
  do
  # Extract the first word of "$ac_prog", so it can be a program name with args.
  set dummy $ac_prog; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:13646: checking for $ac_word" >&5
-+echo "configure:13652: checking for $ac_word" >&5
++echo "configure:13673: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_prog_YASM'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -13704,7 +13710,7 @@ if test -z "$JPEG_DIR" -o "$JPEG_DIR" = no; then
+@@ -13704,7 +13731,7 @@ if test -z "$JPEG_DIR" -o "$JPEG_DIR" = no; then
      SYSTEM_JPEG=
  else
      echo $ac_n "checking for jpeg_destroy_compress in -ljpeg""... $ac_c" 1>&6
 -echo "configure:13708: checking for jpeg_destroy_compress in -ljpeg" >&5
-+echo "configure:13714: checking for jpeg_destroy_compress in -ljpeg" >&5
++echo "configure:13735: checking for jpeg_destroy_compress in -ljpeg" >&5
  ac_lib_var=`echo jpeg'_'jpeg_destroy_compress | sed 'y%./+-%__p_%'`
  if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
-@@ -13712,7 +13718,7 @@ else
+@@ -13712,7 +13739,7 @@ else
    ac_save_LIBS="$LIBS"
  LIBS="-ljpeg $JPEG_LIBS $LIBS"
  cat > conftest.$ac_ext <<EOF
 -#line 13716 "configure"
-+#line 13722 "configure"
++#line 13743 "configure"
  #include "confdefs.h"
  /* Override any gcc2 internal prototype to avoid an error.  */
  /* We use char because int might match the return type of a gcc2
-@@ -13723,7 +13729,7 @@ int main() {
+@@ -13723,7 +13750,7 @@ int main() {
  jpeg_destroy_compress()
  ; return 0; }
  EOF
 -if { (eval echo configure:13727: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:13733: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:13754: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    eval "ac_cv_lib_$ac_lib_var=yes"
  else
-@@ -13746,10 +13752,10 @@ fi
+@@ -13746,10 +13773,10 @@ fi
  
  fi
  
@@ -185,47 +4765,47 @@ index b8e7773..67ba888 100755
      LIBS="$JPEG_LIBS $LIBS"
      cat > conftest.$ac_ext <<EOF
 -#line 13753 "configure"
-+#line 13759 "configure"
++#line 13780 "configure"
  #include "confdefs.h"
   #include <stdio.h>
                       #include <sys/types.h>
-@@ -13760,7 +13766,7 @@ int main() {
+@@ -13760,7 +13787,7 @@ int main() {
                       #endif 
  ; return 0; }
  EOF
 -if { (eval echo configure:13764: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13770: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:13791: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    SYSTEM_JPEG=1
  else
-@@ -13798,7 +13804,7 @@ if test -z "$ZLIB_DIR" -o "$ZLIB_DIR" = no; then
+@@ -13798,7 +13825,7 @@ if test -z "$ZLIB_DIR" -o "$ZLIB_DIR" = no; then
      SYSTEM_ZLIB=
  else
      echo $ac_n "checking for gzread in -lz""... $ac_c" 1>&6
 -echo "configure:13802: checking for gzread in -lz" >&5
-+echo "configure:13808: checking for gzread in -lz" >&5
++echo "configure:13829: checking for gzread in -lz" >&5
  ac_lib_var=`echo z'_'gzread | sed 'y%./+-%__p_%'`
  if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
-@@ -13806,7 +13812,7 @@ else
+@@ -13806,7 +13833,7 @@ else
    ac_save_LIBS="$LIBS"
  LIBS="-lz $ZLIB_LIBS $LIBS"
  cat > conftest.$ac_ext <<EOF
 -#line 13810 "configure"
-+#line 13816 "configure"
++#line 13837 "configure"
  #include "confdefs.h"
  /* Override any gcc2 internal prototype to avoid an error.  */
  /* We use char because int might match the return type of a gcc2
-@@ -13817,7 +13823,7 @@ int main() {
+@@ -13817,7 +13844,7 @@ int main() {
  gzread()
  ; return 0; }
  EOF
 -if { (eval echo configure:13821: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:13827: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:13848: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    eval "ac_cv_lib_$ac_lib_var=yes"
  else
-@@ -13839,10 +13845,10 @@ SYSTEM_ZLIB= ZLIB_CFLAGS= ZLIB_LIBS=
+@@ -13839,10 +13866,10 @@ SYSTEM_ZLIB= ZLIB_CFLAGS= ZLIB_LIBS=
  fi
  
  fi
@@ -234,101 +4814,101 @@ index b8e7773..67ba888 100755
      LIBS="$ZLIB_LIBS $LIBS"
      cat > conftest.$ac_ext <<EOF
 -#line 13846 "configure"
-+#line 13852 "configure"
++#line 13873 "configure"
  #include "confdefs.h"
   #include <stdio.h>
                       #include <string.h>
-@@ -13853,7 +13859,7 @@ int main() {
+@@ -13853,7 +13880,7 @@ int main() {
                       #endif 
  ; return 0; }
  EOF
 -if { (eval echo configure:13857: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:13863: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:13884: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    SYSTEM_ZLIB=1
  else
-@@ -13891,7 +13897,7 @@ if test -z "$BZ2_DIR" -o "$BZ2_DIR" = no; then
+@@ -13891,7 +13918,7 @@ if test -z "$BZ2_DIR" -o "$BZ2_DIR" = no; then
      SYSTEM_BZ2=
  else
      echo $ac_n "checking for BZ2_bzread in -lbz2""... $ac_c" 1>&6
 -echo "configure:13895: checking for BZ2_bzread in -lbz2" >&5
-+echo "configure:13901: checking for BZ2_bzread in -lbz2" >&5
++echo "configure:13922: checking for BZ2_bzread in -lbz2" >&5
  ac_lib_var=`echo bz2'_'BZ2_bzread | sed 'y%./+-%__p_%'`
  if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
-@@ -13899,7 +13905,7 @@ else
+@@ -13899,7 +13926,7 @@ else
    ac_save_LIBS="$LIBS"
  LIBS="-lbz2  $LIBS"
  cat > conftest.$ac_ext <<EOF
 -#line 13903 "configure"
-+#line 13909 "configure"
++#line 13930 "configure"
  #include "confdefs.h"
  /* Override any gcc2 internal prototype to avoid an error.  */
  /* We use char because int might match the return type of a gcc2
-@@ -13910,7 +13916,7 @@ int main() {
+@@ -13910,7 +13937,7 @@ int main() {
  BZ2_bzread()
  ; return 0; }
  EOF
 -if { (eval echo configure:13914: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:13920: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:13941: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    eval "ac_cv_lib_$ac_lib_var=yes"
  else
-@@ -13962,7 +13968,7 @@ if test -z "$PNG_DIR" -o "$PNG_DIR" = no; then
+@@ -13962,7 +13989,7 @@ if test -z "$PNG_DIR" -o "$PNG_DIR" = no; then
  else
      _SAVE_PNG_LIBS=$PNG_LIBS
      echo $ac_n "checking for png_get_valid in -lpng""... $ac_c" 1>&6
 -echo "configure:13966: checking for png_get_valid in -lpng" >&5
-+echo "configure:13972: checking for png_get_valid in -lpng" >&5
++echo "configure:13993: checking for png_get_valid in -lpng" >&5
  ac_lib_var=`echo png'_'png_get_valid | sed 'y%./+-%__p_%'`
  if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
-@@ -13970,7 +13976,7 @@ else
+@@ -13970,7 +13997,7 @@ else
    ac_save_LIBS="$LIBS"
  LIBS="-lpng $PNG_LIBS $LIBS"
  cat > conftest.$ac_ext <<EOF
 -#line 13974 "configure"
-+#line 13980 "configure"
++#line 14001 "configure"
  #include "confdefs.h"
  /* Override any gcc2 internal prototype to avoid an error.  */
  /* We use char because int might match the return type of a gcc2
-@@ -13981,7 +13987,7 @@ int main() {
+@@ -13981,7 +14008,7 @@ int main() {
  png_get_valid()
  ; return 0; }
  EOF
 -if { (eval echo configure:13985: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:13991: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:14012: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    eval "ac_cv_lib_$ac_lib_var=yes"
  else
-@@ -14003,7 +14009,7 @@ else
+@@ -14003,7 +14030,7 @@ else
  fi
  
      echo $ac_n "checking for png_get_acTL in -lpng""... $ac_c" 1>&6
 -echo "configure:14007: checking for png_get_acTL in -lpng" >&5
-+echo "configure:14013: checking for png_get_acTL in -lpng" >&5
++echo "configure:14034: checking for png_get_acTL in -lpng" >&5
  ac_lib_var=`echo png'_'png_get_acTL | sed 'y%./+-%__p_%'`
  if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
-@@ -14011,7 +14017,7 @@ else
+@@ -14011,7 +14038,7 @@ else
    ac_save_LIBS="$LIBS"
  LIBS="-lpng $_SAVE_PNG_LIBS $LIBS"
  cat > conftest.$ac_ext <<EOF
 -#line 14015 "configure"
-+#line 14021 "configure"
++#line 14042 "configure"
  #include "confdefs.h"
  /* Override any gcc2 internal prototype to avoid an error.  */
  /* We use char because int might match the return type of a gcc2
-@@ -14022,7 +14028,7 @@ int main() {
+@@ -14022,7 +14049,7 @@ int main() {
  png_get_acTL()
  ; return 0; }
  EOF
 -if { (eval echo configure:14026: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:14032: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:14053: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    eval "ac_cv_lib_$ac_lib_var=yes"
  else
-@@ -14051,10 +14057,10 @@ else
+@@ -14051,10 +14078,10 @@ else
  fi
  
  fi
@@ -337,34 +4917,34 @@ index b8e7773..67ba888 100755
      LIBS="$PNG_LIBS $LIBS"
      cat > conftest.$ac_ext <<EOF
 -#line 14058 "configure"
-+#line 14064 "configure"
++#line 14085 "configure"
  #include "confdefs.h"
   #include <stdio.h>
                       #include <sys/types.h>
-@@ -14068,7 +14074,7 @@ int main() {
+@@ -14068,7 +14095,7 @@ int main() {
                       #endif 
  ; return 0; }
  EOF
 -if { (eval echo configure:14072: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:14078: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:14099: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    SYSTEM_PNG=1
  else
-@@ -14110,7 +14116,7 @@ if test -n "$SYSTEM_HUNSPELL"; then
+@@ -14110,7 +14137,7 @@ if test -n "$SYSTEM_HUNSPELL"; then
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:14114: checking for $ac_word" >&5
-+echo "configure:14120: checking for $ac_word" >&5
++echo "configure:14141: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -14154,19 +14160,19 @@ fi
+@@ -14154,19 +14181,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for hunspell""... $ac_c" 1>&6
 -echo "configure:14158: checking for hunspell" >&5
-+echo "configure:14164: checking for hunspell" >&5
++echo "configure:14185: checking for hunspell" >&5
  
          if $PKG_CONFIG --exists "hunspell" ; then
              echo "$ac_t""yes" 1>&6
@@ -372,31 +4952,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_HUNSPELL_CFLAGS""... $ac_c" 1>&6
 -echo "configure:14165: checking MOZ_HUNSPELL_CFLAGS" >&5
-+echo "configure:14171: checking MOZ_HUNSPELL_CFLAGS" >&5
++echo "configure:14192: checking MOZ_HUNSPELL_CFLAGS" >&5
              MOZ_HUNSPELL_CFLAGS=`$PKG_CONFIG --cflags "hunspell"`
              echo "$ac_t""$MOZ_HUNSPELL_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_HUNSPELL_LIBS""... $ac_c" 1>&6
 -echo "configure:14170: checking MOZ_HUNSPELL_LIBS" >&5
-+echo "configure:14176: checking MOZ_HUNSPELL_LIBS" >&5
++echo "configure:14197: checking MOZ_HUNSPELL_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_HUNSPELL_LIBS="`$PKG_CONFIG --libs \"hunspell\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_HUNSPELL_LIBS" 1>&6
-@@ -14222,7 +14228,7 @@ if test -n "$MOZ_NATIVE_FFI"; then
+@@ -14222,7 +14249,7 @@ if test -n "$MOZ_NATIVE_FFI"; then
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:14226: checking for $ac_word" >&5
-+echo "configure:14232: checking for $ac_word" >&5
++echo "configure:14253: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -14266,19 +14272,19 @@ fi
+@@ -14266,19 +14293,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for libffi > 3.0.9""... $ac_c" 1>&6
 -echo "configure:14270: checking for libffi > 3.0.9" >&5
-+echo "configure:14276: checking for libffi > 3.0.9" >&5
++echo "configure:14297: checking for libffi > 3.0.9" >&5
  
          if $PKG_CONFIG --exists "libffi > 3.0.9" ; then
              echo "$ac_t""yes" 1>&6
@@ -404,31 +4984,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_FFI_CFLAGS""... $ac_c" 1>&6
 -echo "configure:14277: checking MOZ_FFI_CFLAGS" >&5
-+echo "configure:14283: checking MOZ_FFI_CFLAGS" >&5
++echo "configure:14304: checking MOZ_FFI_CFLAGS" >&5
              MOZ_FFI_CFLAGS=`$PKG_CONFIG --cflags "libffi > 3.0.9"`
              echo "$ac_t""$MOZ_FFI_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_FFI_LIBS""... $ac_c" 1>&6
 -echo "configure:14282: checking MOZ_FFI_LIBS" >&5
-+echo "configure:14288: checking MOZ_FFI_LIBS" >&5
++echo "configure:14309: checking MOZ_FFI_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_FFI_LIBS="`$PKG_CONFIG --libs \"libffi > 3.0.9\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_FFI_LIBS" 1>&6
-@@ -14314,7 +14320,7 @@ echo "configure:14282: checking MOZ_FFI_LIBS" >&5
+@@ -14314,7 +14341,7 @@ echo "configure:14282: checking MOZ_FFI_LIBS" >&5
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:14318: checking for $ac_word" >&5
-+echo "configure:14324: checking for $ac_word" >&5
++echo "configure:14345: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -14358,19 +14364,19 @@ fi
+@@ -14358,19 +14385,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for libffi >= 3.0.9""... $ac_c" 1>&6
 -echo "configure:14362: checking for libffi >= 3.0.9" >&5
-+echo "configure:14368: checking for libffi >= 3.0.9" >&5
++echo "configure:14389: checking for libffi >= 3.0.9" >&5
  
          if $PKG_CONFIG --exists "libffi >= 3.0.9" ; then
              echo "$ac_t""yes" 1>&6
@@ -436,49 +5016,49 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_FFI_CFLAGS""... $ac_c" 1>&6
 -echo "configure:14369: checking MOZ_FFI_CFLAGS" >&5
-+echo "configure:14375: checking MOZ_FFI_CFLAGS" >&5
++echo "configure:14396: checking MOZ_FFI_CFLAGS" >&5
              MOZ_FFI_CFLAGS=`$PKG_CONFIG --cflags "libffi >= 3.0.9"`
              echo "$ac_t""$MOZ_FFI_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_FFI_LIBS""... $ac_c" 1>&6
 -echo "configure:14374: checking MOZ_FFI_LIBS" >&5
-+echo "configure:14380: checking MOZ_FFI_LIBS" >&5
++echo "configure:14401: checking MOZ_FFI_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_FFI_LIBS="`$PKG_CONFIG --libs \"libffi >= 3.0.9\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_FFI_LIBS" 1>&6
-@@ -14542,7 +14548,7 @@ fi
+@@ -14542,7 +14569,7 @@ fi
  
  
  echo $ac_n "checking for application to build""... $ac_c" 1>&6
 -echo "configure:14546: checking for application to build" >&5
-+echo "configure:14552: checking for application to build" >&5
++echo "configure:14573: checking for application to build" >&5
  if test -z "$MOZ_BUILD_APP"; then
    echo "$ac_t""browser" 1>&6
    MOZ_BUILD_APP=browser
-@@ -14560,7 +14566,7 @@ fi
+@@ -14560,7 +14587,7 @@ fi
  # Allow the application to influence configure with a confvars.sh script.
  
  echo $ac_n "checking if app-specific confvars.sh exists""... $ac_c" 1>&6
 -echo "configure:14564: checking if app-specific confvars.sh exists" >&5
-+echo "configure:14570: checking if app-specific confvars.sh exists" >&5
++echo "configure:14591: checking if app-specific confvars.sh exists" >&5
  if test -f "${srcdir}/${MOZ_BUILD_APP}/confvars.sh" ; then
    echo "$ac_t""${srcdir}/${MOZ_BUILD_APP}/confvars.sh" 1>&6
    . "${srcdir}/${MOZ_BUILD_APP}/confvars.sh"
-@@ -14828,7 +14834,7 @@ if test "$COMPILE_ENVIRONMENT"; then
+@@ -14828,7 +14855,7 @@ if test "$COMPILE_ENVIRONMENT"; then
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:14832: checking for $ac_word" >&5
-+echo "configure:14838: checking for $ac_word" >&5
++echo "configure:14859: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -14872,19 +14878,19 @@ fi
+@@ -14872,19 +14899,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for directfb >= 1.1.0""... $ac_c" 1>&6
 -echo "configure:14876: checking for directfb >= 1.1.0" >&5
-+echo "configure:14882: checking for directfb >= 1.1.0" >&5
++echo "configure:14903: checking for directfb >= 1.1.0" >&5
  
          if $PKG_CONFIG --exists "directfb >= 1.1.0" ; then
              echo "$ac_t""yes" 1>&6
@@ -486,31 +5066,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_DFB_CFLAGS""... $ac_c" 1>&6
 -echo "configure:14883: checking MOZ_DFB_CFLAGS" >&5
-+echo "configure:14889: checking MOZ_DFB_CFLAGS" >&5
++echo "configure:14910: checking MOZ_DFB_CFLAGS" >&5
              MOZ_DFB_CFLAGS=`$PKG_CONFIG --cflags "directfb >= 1.1.0"`
              echo "$ac_t""$MOZ_DFB_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_DFB_LIBS""... $ac_c" 1>&6
 -echo "configure:14888: checking MOZ_DFB_LIBS" >&5
-+echo "configure:14894: checking MOZ_DFB_LIBS" >&5
++echo "configure:14915: checking MOZ_DFB_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_DFB_LIBS="`$PKG_CONFIG --libs \"directfb >= 1.1.0\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_DFB_LIBS" 1>&6
-@@ -14922,7 +14928,7 @@ echo "configure:14888: checking MOZ_DFB_LIBS" >&5
+@@ -14922,7 +14949,7 @@ echo "configure:14888: checking MOZ_DFB_LIBS" >&5
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:14926: checking for $ac_word" >&5
-+echo "configure:14932: checking for $ac_word" >&5
++echo "configure:14953: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -14966,19 +14972,19 @@ fi
+@@ -14966,19 +14993,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES""... $ac_c" 1>&6
 -echo "configure:14970: checking for gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES" >&5
-+echo "configure:14976: checking for gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES" >&5
++echo "configure:14997: checking for gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES" >&5
  
          if $PKG_CONFIG --exists "gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES" ; then
              echo "$ac_t""yes" 1>&6
@@ -518,17 +5098,17 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_GTK2_CFLAGS""... $ac_c" 1>&6
 -echo "configure:14977: checking MOZ_GTK2_CFLAGS" >&5
-+echo "configure:14983: checking MOZ_GTK2_CFLAGS" >&5
++echo "configure:15004: checking MOZ_GTK2_CFLAGS" >&5
              MOZ_GTK2_CFLAGS=`$PKG_CONFIG --cflags "gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES"`
              echo "$ac_t""$MOZ_GTK2_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_GTK2_LIBS""... $ac_c" 1>&6
 -echo "configure:14982: checking MOZ_GTK2_LIBS" >&5
-+echo "configure:14988: checking MOZ_GTK2_LIBS" >&5
++echo "configure:15009: checking MOZ_GTK2_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_GTK2_LIBS="`$PKG_CONFIG --libs \"gtk+-2.0 >= $GTK2_VERSION gtk+-unix-print-2.0 glib-2.0 gobject-2.0 $GDK_PACKAGES\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_GTK2_LIBS" 1>&6
-@@ -15033,6 +15039,7 @@ EOF
+@@ -15033,6 +15060,7 @@ EOF
  fi
  
  
@@ -536,21 +5116,21 @@ index b8e7773..67ba888 100755
  if test "$MOZ_ENABLE_GTK2"
  then
      MOZ_ENABLE_STARTUP_NOTIFICATION=
-@@ -15057,7 +15064,7 @@ fi
+@@ -15057,7 +15085,7 @@ fi
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:15061: checking for $ac_word" >&5
-+echo "configure:15068: checking for $ac_word" >&5
++echo "configure:15089: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -15101,19 +15108,19 @@ fi
+@@ -15101,19 +15129,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION""... $ac_c" 1>&6
 -echo "configure:15105: checking for libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION" >&5
-+echo "configure:15112: checking for libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION" >&5
++echo "configure:15133: checking for libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION" >&5
  
          if $PKG_CONFIG --exists "libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -558,17 +5138,17 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_STARTUP_NOTIFICATION_CFLAGS""... $ac_c" 1>&6
 -echo "configure:15112: checking MOZ_STARTUP_NOTIFICATION_CFLAGS" >&5
-+echo "configure:15119: checking MOZ_STARTUP_NOTIFICATION_CFLAGS" >&5
++echo "configure:15140: checking MOZ_STARTUP_NOTIFICATION_CFLAGS" >&5
              MOZ_STARTUP_NOTIFICATION_CFLAGS=`$PKG_CONFIG --cflags "libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION"`
              echo "$ac_t""$MOZ_STARTUP_NOTIFICATION_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_STARTUP_NOTIFICATION_LIBS""... $ac_c" 1>&6
 -echo "configure:15117: checking MOZ_STARTUP_NOTIFICATION_LIBS" >&5
-+echo "configure:15124: checking MOZ_STARTUP_NOTIFICATION_LIBS" >&5
++echo "configure:15145: checking MOZ_STARTUP_NOTIFICATION_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_STARTUP_NOTIFICATION_LIBS="`$PKG_CONFIG --libs \"libstartup-notification-1.0 >= $STARTUP_NOTIFICATION_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_STARTUP_NOTIFICATION_LIBS" 1>&6
-@@ -15159,6 +15166,7 @@ EOF
+@@ -15159,6 +15187,7 @@ EOF
  
      TK_LIBS="$TK_LIBS $MOZ_STARTUP_NOTIFICATION_LIBS"
  fi
@@ -576,21 +5156,21 @@ index b8e7773..67ba888 100755
  
  
  
-@@ -15179,7 +15187,7 @@ fi
+@@ -15179,7 +15208,7 @@ fi
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:15183: checking for $ac_word" >&5
-+echo "configure:15191: checking for $ac_word" >&5
++echo "configure:15212: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -15223,19 +15231,19 @@ fi
+@@ -15223,19 +15252,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for QtGui QtNetwork QtCore QtOpenGL""... $ac_c" 1>&6
 -echo "configure:15227: checking for QtGui QtNetwork QtCore QtOpenGL" >&5
-+echo "configure:15235: checking for QtGui QtNetwork QtCore QtOpenGL" >&5
++echo "configure:15256: checking for QtGui QtNetwork QtCore QtOpenGL" >&5
  
          if $PKG_CONFIG --exists "QtGui QtNetwork QtCore QtOpenGL" ; then
              echo "$ac_t""yes" 1>&6
@@ -598,40 +5178,40 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_QT_CFLAGS""... $ac_c" 1>&6
 -echo "configure:15234: checking MOZ_QT_CFLAGS" >&5
-+echo "configure:15242: checking MOZ_QT_CFLAGS" >&5
++echo "configure:15263: checking MOZ_QT_CFLAGS" >&5
              MOZ_QT_CFLAGS=`$PKG_CONFIG --cflags "QtGui QtNetwork QtCore QtOpenGL"`
              echo "$ac_t""$MOZ_QT_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_QT_LIBS""... $ac_c" 1>&6
 -echo "configure:15239: checking MOZ_QT_LIBS" >&5
-+echo "configure:15247: checking MOZ_QT_LIBS" >&5
++echo "configure:15268: checking MOZ_QT_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_QT_LIBS="`$PKG_CONFIG --libs \"QtGui QtNetwork QtCore QtOpenGL\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_QT_LIBS" 1>&6
-@@ -15269,7 +15277,7 @@ do
+@@ -15269,7 +15298,7 @@ do
  # Extract the first word of "$ac_prog", so it can be a program name with args.
  set dummy $ac_prog; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:15273: checking for $ac_word" >&5
-+echo "configure:15281: checking for $ac_word" >&5
++echo "configure:15302: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_prog_HOST_MOC'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -15324,7 +15332,7 @@ incorrect" 1>&2; exit 1; }
+@@ -15324,7 +15353,7 @@ incorrect" 1>&2; exit 1; }
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:15328: checking for $ac_word" >&5
-+echo "configure:15336: checking for $ac_word" >&5
++echo "configure:15357: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -15368,19 +15376,19 @@ fi
+@@ -15368,19 +15397,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for qmsystem2""... $ac_c" 1>&6
 -echo "configure:15372: checking for qmsystem2" >&5
-+echo "configure:15380: checking for qmsystem2" >&5
++echo "configure:15401: checking for qmsystem2" >&5
  
          if $PKG_CONFIG --exists "qmsystem2" ; then
              echo "$ac_t""yes" 1>&6
@@ -639,31 +5219,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking _QMSYSTEM2_CFLAGS""... $ac_c" 1>&6
 -echo "configure:15379: checking _QMSYSTEM2_CFLAGS" >&5
-+echo "configure:15387: checking _QMSYSTEM2_CFLAGS" >&5
++echo "configure:15408: checking _QMSYSTEM2_CFLAGS" >&5
              _QMSYSTEM2_CFLAGS=`$PKG_CONFIG --cflags "qmsystem2"`
              echo "$ac_t""$_QMSYSTEM2_CFLAGS" 1>&6
  
              echo $ac_n "checking _QMSYSTEM2_LIBS""... $ac_c" 1>&6
 -echo "configure:15384: checking _QMSYSTEM2_LIBS" >&5
-+echo "configure:15392: checking _QMSYSTEM2_LIBS" >&5
++echo "configure:15413: checking _QMSYSTEM2_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              _QMSYSTEM2_LIBS="`$PKG_CONFIG --libs \"qmsystem2\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$_QMSYSTEM2_LIBS" 1>&6
-@@ -15427,7 +15435,7 @@ EOF
+@@ -15427,7 +15456,7 @@ EOF
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:15431: checking for $ac_word" >&5
-+echo "configure:15439: checking for $ac_word" >&5
++echo "configure:15460: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -15471,19 +15479,19 @@ fi
+@@ -15471,19 +15500,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for QtNetwork >= 4.7""... $ac_c" 1>&6
 -echo "configure:15475: checking for QtNetwork >= 4.7" >&5
-+echo "configure:15483: checking for QtNetwork >= 4.7" >&5
++echo "configure:15504: checking for QtNetwork >= 4.7" >&5
  
          if $PKG_CONFIG --exists "QtNetwork >= 4.7" ; then
              echo "$ac_t""yes" 1>&6
@@ -671,31 +5251,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking _QTNETWORK_CFLAGS""... $ac_c" 1>&6
 -echo "configure:15482: checking _QTNETWORK_CFLAGS" >&5
-+echo "configure:15490: checking _QTNETWORK_CFLAGS" >&5
++echo "configure:15511: checking _QTNETWORK_CFLAGS" >&5
              _QTNETWORK_CFLAGS=`$PKG_CONFIG --cflags "QtNetwork >= 4.7"`
              echo "$ac_t""$_QTNETWORK_CFLAGS" 1>&6
  
              echo $ac_n "checking _QTNETWORK_LIBS""... $ac_c" 1>&6
 -echo "configure:15487: checking _QTNETWORK_LIBS" >&5
-+echo "configure:15495: checking _QTNETWORK_LIBS" >&5
++echo "configure:15516: checking _QTNETWORK_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              _QTNETWORK_LIBS="`$PKG_CONFIG --libs \"QtNetwork >= 4.7\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$_QTNETWORK_LIBS" 1>&6
-@@ -15528,7 +15536,7 @@ EOF
+@@ -15528,7 +15557,7 @@ EOF
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:15532: checking for $ac_word" >&5
-+echo "configure:15540: checking for $ac_word" >&5
++echo "configure:15561: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -15572,19 +15580,19 @@ fi
+@@ -15572,19 +15601,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for QtSensors QtFeedback QtLocation""... $ac_c" 1>&6
 -echo "configure:15576: checking for QtSensors QtFeedback QtLocation" >&5
-+echo "configure:15584: checking for QtSensors QtFeedback QtLocation" >&5
++echo "configure:15605: checking for QtSensors QtFeedback QtLocation" >&5
  
          if $PKG_CONFIG --exists "QtSensors QtFeedback QtLocation" ; then
              echo "$ac_t""yes" 1>&6
@@ -703,31 +5283,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking _QTMOBILITY_CFLAGS""... $ac_c" 1>&6
 -echo "configure:15583: checking _QTMOBILITY_CFLAGS" >&5
-+echo "configure:15591: checking _QTMOBILITY_CFLAGS" >&5
++echo "configure:15612: checking _QTMOBILITY_CFLAGS" >&5
              _QTMOBILITY_CFLAGS=`$PKG_CONFIG --cflags "QtSensors QtFeedback QtLocation"`
              echo "$ac_t""$_QTMOBILITY_CFLAGS" 1>&6
  
              echo $ac_n "checking _QTMOBILITY_LIBS""... $ac_c" 1>&6
 -echo "configure:15588: checking _QTMOBILITY_LIBS" >&5
-+echo "configure:15596: checking _QTMOBILITY_LIBS" >&5
++echo "configure:15617: checking _QTMOBILITY_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              _QTMOBILITY_LIBS="`$PKG_CONFIG --libs \"QtSensors QtFeedback QtLocation\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$_QTMOBILITY_LIBS" 1>&6
-@@ -15619,7 +15627,7 @@ echo "configure:15588: checking _QTMOBILITY_LIBS" >&5
+@@ -15619,7 +15648,7 @@ echo "configure:15588: checking _QTMOBILITY_LIBS" >&5
         MOZ_QT_LIBS="$MOZ_QT_LIBS $_QTMOBILITY_LIBS"
      else
         echo $ac_n "checking for main in -lQtSensors""... $ac_c" 1>&6
 -echo "configure:15623: checking for main in -lQtSensors" >&5
-+echo "configure:15631: checking for main in -lQtSensors" >&5
++echo "configure:15652: checking for main in -lQtSensors" >&5
  ac_lib_var=`echo QtSensors'_'main | sed 'y%./+-%__p_%'`
  if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
-@@ -15627,14 +15635,14 @@ else
+@@ -15627,14 +15656,14 @@ else
    ac_save_LIBS="$LIBS"
  LIBS="-lQtSensors  $LIBS"
  cat > conftest.$ac_ext <<EOF
 -#line 15631 "configure"
-+#line 15639 "configure"
++#line 15660 "configure"
  #include "confdefs.h"
  
  int main() {
@@ -735,11 +5315,11 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:15638: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:15646: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:15667: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    eval "ac_cv_lib_$ac_lib_var=yes"
  else
-@@ -15689,6 +15697,15 @@ fi
+@@ -15689,6 +15718,15 @@ fi
  
  
  
@@ -755,7 +5335,7 @@ index b8e7773..67ba888 100755
  
  # Components and Features
  
-@@ -15778,7 +15795,7 @@ if test "${enable_pango+set}" = set; then
+@@ -15778,7 +15816,7 @@ if test "${enable_pango+set}" = set; then
  fi
  
  
@@ -764,21 +5344,21 @@ index b8e7773..67ba888 100755
  then
      
  
-@@ -15788,7 +15805,7 @@ then
+@@ -15788,7 +15826,7 @@ then
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:15792: checking for $ac_word" >&5
-+echo "configure:15809: checking for $ac_word" >&5
++echo "configure:15830: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -15832,19 +15849,19 @@ fi
+@@ -15832,19 +15870,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for pango >= $PANGO_VERSION""... $ac_c" 1>&6
 -echo "configure:15836: checking for pango >= $PANGO_VERSION" >&5
-+echo "configure:15853: checking for pango >= $PANGO_VERSION" >&5
++echo "configure:15874: checking for pango >= $PANGO_VERSION" >&5
  
          if $PKG_CONFIG --exists "pango >= $PANGO_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -786,31 +5366,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking _PANGOCHK_CFLAGS""... $ac_c" 1>&6
 -echo "configure:15843: checking _PANGOCHK_CFLAGS" >&5
-+echo "configure:15860: checking _PANGOCHK_CFLAGS" >&5
++echo "configure:15881: checking _PANGOCHK_CFLAGS" >&5
              _PANGOCHK_CFLAGS=`$PKG_CONFIG --cflags "pango >= $PANGO_VERSION"`
              echo "$ac_t""$_PANGOCHK_CFLAGS" 1>&6
  
              echo $ac_n "checking _PANGOCHK_LIBS""... $ac_c" 1>&6
 -echo "configure:15848: checking _PANGOCHK_LIBS" >&5
-+echo "configure:15865: checking _PANGOCHK_LIBS" >&5
++echo "configure:15886: checking _PANGOCHK_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              _PANGOCHK_LIBS="`$PKG_CONFIG --libs \"pango >= $PANGO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$_PANGOCHK_LIBS" 1>&6
-@@ -15880,7 +15897,7 @@ echo "configure:15848: checking _PANGOCHK_LIBS" >&5
+@@ -15880,7 +15918,7 @@ echo "configure:15848: checking _PANGOCHK_LIBS" >&5
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:15884: checking for $ac_word" >&5
-+echo "configure:15901: checking for $ac_word" >&5
++echo "configure:15922: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -15924,19 +15941,19 @@ fi
+@@ -15924,19 +15962,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION""... $ac_c" 1>&6
 -echo "configure:15928: checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" >&5
-+echo "configure:15945: checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" >&5
++echo "configure:15966: checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" >&5
  
          if $PKG_CONFIG --exists "pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -818,31 +5398,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_PANGO_CFLAGS""... $ac_c" 1>&6
 -echo "configure:15935: checking MOZ_PANGO_CFLAGS" >&5
-+echo "configure:15952: checking MOZ_PANGO_CFLAGS" >&5
++echo "configure:15973: checking MOZ_PANGO_CFLAGS" >&5
              MOZ_PANGO_CFLAGS=`$PKG_CONFIG --cflags "pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION"`
              echo "$ac_t""$MOZ_PANGO_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_PANGO_LIBS""... $ac_c" 1>&6
 -echo "configure:15940: checking MOZ_PANGO_LIBS" >&5
-+echo "configure:15957: checking MOZ_PANGO_LIBS" >&5
++echo "configure:15978: checking MOZ_PANGO_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_PANGO_LIBS="`$PKG_CONFIG --libs \"pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_PANGO_LIBS" 1>&6
-@@ -15980,7 +15997,7 @@ EOF
+@@ -15980,7 +16018,7 @@ EOF
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:15984: checking for $ac_word" >&5
-+echo "configure:16001: checking for $ac_word" >&5
++echo "configure:16022: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -16024,19 +16041,19 @@ fi
+@@ -16024,19 +16062,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for freetype2 > 6.1.0 fontconfig""... $ac_c" 1>&6
 -echo "configure:16028: checking for freetype2 > 6.1.0 fontconfig" >&5
-+echo "configure:16045: checking for freetype2 > 6.1.0 fontconfig" >&5
++echo "configure:16066: checking for freetype2 > 6.1.0 fontconfig" >&5
  
          if $PKG_CONFIG --exists "freetype2 > 6.1.0 fontconfig" ; then
              echo "$ac_t""yes" 1>&6
@@ -850,31 +5430,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking FT2_CFLAGS""... $ac_c" 1>&6
 -echo "configure:16035: checking FT2_CFLAGS" >&5
-+echo "configure:16052: checking FT2_CFLAGS" >&5
++echo "configure:16073: checking FT2_CFLAGS" >&5
              FT2_CFLAGS=`$PKG_CONFIG --cflags "freetype2 > 6.1.0 fontconfig"`
              echo "$ac_t""$FT2_CFLAGS" 1>&6
  
              echo $ac_n "checking FT2_LIBS""... $ac_c" 1>&6
 -echo "configure:16040: checking FT2_LIBS" >&5
-+echo "configure:16057: checking FT2_LIBS" >&5
++echo "configure:16078: checking FT2_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              FT2_LIBS="`$PKG_CONFIG --libs \"freetype2 > 6.1.0 fontconfig\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$FT2_LIBS" 1>&6
-@@ -16080,7 +16097,7 @@ then
+@@ -16080,7 +16118,7 @@ then
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:16084: checking for $ac_word" >&5
-+echo "configure:16101: checking for $ac_word" >&5
++echo "configure:16122: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -16124,19 +16141,19 @@ fi
+@@ -16124,19 +16162,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION""... $ac_c" 1>&6
 -echo "configure:16128: checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" >&5
-+echo "configure:16145: checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" >&5
++echo "configure:16166: checking for pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" >&5
  
          if $PKG_CONFIG --exists "pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -882,17 +5462,17 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_PANGO_CFLAGS""... $ac_c" 1>&6
 -echo "configure:16135: checking MOZ_PANGO_CFLAGS" >&5
-+echo "configure:16152: checking MOZ_PANGO_CFLAGS" >&5
++echo "configure:16173: checking MOZ_PANGO_CFLAGS" >&5
              MOZ_PANGO_CFLAGS=`$PKG_CONFIG --cflags "pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION"`
              echo "$ac_t""$MOZ_PANGO_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_PANGO_LIBS""... $ac_c" 1>&6
 -echo "configure:16140: checking MOZ_PANGO_LIBS" >&5
-+echo "configure:16157: checking MOZ_PANGO_LIBS" >&5
++echo "configure:16178: checking MOZ_PANGO_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_PANGO_LIBS="`$PKG_CONFIG --libs \"pango >= $PANGO_VERSION pangoft2 >= $PANGO_VERSION pangocairo >= $PANGO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_PANGO_LIBS" 1>&6
-@@ -16180,6 +16197,7 @@ EOF
+@@ -16180,6 +16218,7 @@ EOF
  fi
  
  
@@ -900,21 +5480,21 @@ index b8e7773..67ba888 100755
  if test "$MOZ_X11"
  then
              if test "$MOZ_ENABLE_GTK2"
-@@ -16209,7 +16227,7 @@ fi
+@@ -16209,7 +16248,7 @@ fi
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:16213: checking for $ac_word" >&5
-+echo "configure:16231: checking for $ac_word" >&5
++echo "configure:16252: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -16253,19 +16271,19 @@ fi
+@@ -16253,19 +16292,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION""... $ac_c" 1>&6
 -echo "configure:16257: checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" >&5
-+echo "configure:16275: checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" >&5
++echo "configure:16296: checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" >&5
  
          if $PKG_CONFIG --exists "gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -922,31 +5502,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_GNOMEVFS_CFLAGS""... $ac_c" 1>&6
 -echo "configure:16264: checking MOZ_GNOMEVFS_CFLAGS" >&5
-+echo "configure:16282: checking MOZ_GNOMEVFS_CFLAGS" >&5
++echo "configure:16303: checking MOZ_GNOMEVFS_CFLAGS" >&5
              MOZ_GNOMEVFS_CFLAGS=`$PKG_CONFIG --cflags "gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION"`
              echo "$ac_t""$MOZ_GNOMEVFS_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_GNOMEVFS_LIBS""... $ac_c" 1>&6
 -echo "configure:16269: checking MOZ_GNOMEVFS_LIBS" >&5
-+echo "configure:16287: checking MOZ_GNOMEVFS_LIBS" >&5
++echo "configure:16308: checking MOZ_GNOMEVFS_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_GNOMEVFS_LIBS="`$PKG_CONFIG --libs \"gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_GNOMEVFS_LIBS" 1>&6
-@@ -16315,7 +16333,7 @@ EOF
+@@ -16315,7 +16354,7 @@ EOF
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:16319: checking for $ac_word" >&5
-+echo "configure:16337: checking for $ac_word" >&5
++echo "configure:16358: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -16359,19 +16377,19 @@ fi
+@@ -16359,19 +16398,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION""... $ac_c" 1>&6
 -echo "configure:16363: checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" >&5
-+echo "configure:16381: checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" >&5
++echo "configure:16402: checking for gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" >&5
  
          if $PKG_CONFIG --exists "gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -954,31 +5534,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_GNOMEVFS_CFLAGS""... $ac_c" 1>&6
 -echo "configure:16370: checking MOZ_GNOMEVFS_CFLAGS" >&5
-+echo "configure:16388: checking MOZ_GNOMEVFS_CFLAGS" >&5
++echo "configure:16409: checking MOZ_GNOMEVFS_CFLAGS" >&5
              MOZ_GNOMEVFS_CFLAGS=`$PKG_CONFIG --cflags "gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION"`
              echo "$ac_t""$MOZ_GNOMEVFS_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_GNOMEVFS_LIBS""... $ac_c" 1>&6
 -echo "configure:16375: checking MOZ_GNOMEVFS_LIBS" >&5
-+echo "configure:16393: checking MOZ_GNOMEVFS_LIBS" >&5
++echo "configure:16414: checking MOZ_GNOMEVFS_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_GNOMEVFS_LIBS="`$PKG_CONFIG --libs \"gnome-vfs-2.0 >= $GNOMEVFS_VERSION gnome-vfs-module-2.0 >= $GNOMEVFS_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_GNOMEVFS_LIBS" 1>&6
-@@ -16430,7 +16448,7 @@ fi
+@@ -16430,7 +16469,7 @@ fi
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:16434: checking for $ac_word" >&5
-+echo "configure:16452: checking for $ac_word" >&5
++echo "configure:16473: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -16474,19 +16492,19 @@ fi
+@@ -16474,19 +16513,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for gtk+-2.0 >= 2.14""... $ac_c" 1>&6
 -echo "configure:16478: checking for gtk+-2.0 >= 2.14" >&5
-+echo "configure:16496: checking for gtk+-2.0 >= 2.14" >&5
++echo "configure:16517: checking for gtk+-2.0 >= 2.14" >&5
  
          if $PKG_CONFIG --exists "gtk+-2.0 >= 2.14" ; then
              echo "$ac_t""yes" 1>&6
@@ -986,31 +5566,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking _GTKCHECK_CFLAGS""... $ac_c" 1>&6
 -echo "configure:16485: checking _GTKCHECK_CFLAGS" >&5
-+echo "configure:16503: checking _GTKCHECK_CFLAGS" >&5
++echo "configure:16524: checking _GTKCHECK_CFLAGS" >&5
              _GTKCHECK_CFLAGS=`$PKG_CONFIG --cflags "gtk+-2.0 >= 2.14"`
              echo "$ac_t""$_GTKCHECK_CFLAGS" 1>&6
  
              echo $ac_n "checking _GTKCHECK_LIBS""... $ac_c" 1>&6
 -echo "configure:16490: checking _GTKCHECK_LIBS" >&5
-+echo "configure:16508: checking _GTKCHECK_LIBS" >&5
++echo "configure:16529: checking _GTKCHECK_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              _GTKCHECK_LIBS="`$PKG_CONFIG --libs \"gtk+-2.0 >= 2.14\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$_GTKCHECK_LIBS" 1>&6
-@@ -16521,7 +16539,7 @@ echo "configure:16490: checking _GTKCHECK_LIBS" >&5
+@@ -16521,7 +16560,7 @@ echo "configure:16490: checking _GTKCHECK_LIBS" >&5
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:16525: checking for $ac_word" >&5
-+echo "configure:16543: checking for $ac_word" >&5
++echo "configure:16564: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -16565,19 +16583,19 @@ fi
+@@ -16565,19 +16604,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for gio-2.0 >= $GIO_VERSION""... $ac_c" 1>&6
 -echo "configure:16569: checking for gio-2.0 >= $GIO_VERSION" >&5
-+echo "configure:16587: checking for gio-2.0 >= $GIO_VERSION" >&5
++echo "configure:16608: checking for gio-2.0 >= $GIO_VERSION" >&5
  
          if $PKG_CONFIG --exists "gio-2.0 >= $GIO_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -1018,31 +5598,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_GIO_CFLAGS""... $ac_c" 1>&6
 -echo "configure:16576: checking MOZ_GIO_CFLAGS" >&5
-+echo "configure:16594: checking MOZ_GIO_CFLAGS" >&5
++echo "configure:16615: checking MOZ_GIO_CFLAGS" >&5
              MOZ_GIO_CFLAGS=`$PKG_CONFIG --cflags "gio-2.0 >= $GIO_VERSION"`
              echo "$ac_t""$MOZ_GIO_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_GIO_LIBS""... $ac_c" 1>&6
 -echo "configure:16581: checking MOZ_GIO_LIBS" >&5
-+echo "configure:16599: checking MOZ_GIO_LIBS" >&5
++echo "configure:16620: checking MOZ_GIO_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_GIO_LIBS="`$PKG_CONFIG --libs \"gio-2.0 >= $GIO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_GIO_LIBS" 1>&6
-@@ -16646,7 +16664,7 @@ fi
+@@ -16646,7 +16685,7 @@ fi
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:16650: checking for $ac_word" >&5
-+echo "configure:16668: checking for $ac_word" >&5
++echo "configure:16689: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -16690,19 +16708,19 @@ fi
+@@ -16690,19 +16729,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for gconf-2.0 >= $GCONF_VERSION gobject-2.0 ""... $ac_c" 1>&6
 -echo "configure:16694: checking for gconf-2.0 >= $GCONF_VERSION gobject-2.0 " >&5
-+echo "configure:16712: checking for gconf-2.0 >= $GCONF_VERSION gobject-2.0 " >&5
++echo "configure:16733: checking for gconf-2.0 >= $GCONF_VERSION gobject-2.0 " >&5
  
          if $PKG_CONFIG --exists "gconf-2.0 >= $GCONF_VERSION gobject-2.0 " ; then
              echo "$ac_t""yes" 1>&6
@@ -1050,31 +5630,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_GCONF_CFLAGS""... $ac_c" 1>&6
 -echo "configure:16701: checking MOZ_GCONF_CFLAGS" >&5
-+echo "configure:16719: checking MOZ_GCONF_CFLAGS" >&5
++echo "configure:16740: checking MOZ_GCONF_CFLAGS" >&5
              MOZ_GCONF_CFLAGS=`$PKG_CONFIG --cflags "gconf-2.0 >= $GCONF_VERSION gobject-2.0 "`
              echo "$ac_t""$MOZ_GCONF_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_GCONF_LIBS""... $ac_c" 1>&6
 -echo "configure:16706: checking MOZ_GCONF_LIBS" >&5
-+echo "configure:16724: checking MOZ_GCONF_LIBS" >&5
++echo "configure:16745: checking MOZ_GCONF_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_GCONF_LIBS="`$PKG_CONFIG --libs \"gconf-2.0 >= $GCONF_VERSION gobject-2.0 \" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_GCONF_LIBS" 1>&6
-@@ -16780,7 +16798,7 @@ fi
+@@ -16780,7 +16819,7 @@ fi
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:16784: checking for $ac_word" >&5
-+echo "configure:16802: checking for $ac_word" >&5
++echo "configure:16823: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -16824,19 +16842,19 @@ fi
+@@ -16824,19 +16863,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for libproxy-1.0""... $ac_c" 1>&6
 -echo "configure:16828: checking for libproxy-1.0" >&5
-+echo "configure:16846: checking for libproxy-1.0" >&5
++echo "configure:16867: checking for libproxy-1.0" >&5
  
          if $PKG_CONFIG --exists "libproxy-1.0" ; then
              echo "$ac_t""yes" 1>&6
@@ -1082,31 +5662,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_LIBPROXY_CFLAGS""... $ac_c" 1>&6
 -echo "configure:16835: checking MOZ_LIBPROXY_CFLAGS" >&5
-+echo "configure:16853: checking MOZ_LIBPROXY_CFLAGS" >&5
++echo "configure:16874: checking MOZ_LIBPROXY_CFLAGS" >&5
              MOZ_LIBPROXY_CFLAGS=`$PKG_CONFIG --cflags "libproxy-1.0"`
              echo "$ac_t""$MOZ_LIBPROXY_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_LIBPROXY_LIBS""... $ac_c" 1>&6
 -echo "configure:16840: checking MOZ_LIBPROXY_LIBS" >&5
-+echo "configure:16858: checking MOZ_LIBPROXY_LIBS" >&5
++echo "configure:16879: checking MOZ_LIBPROXY_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_LIBPROXY_LIBS="`$PKG_CONFIG --libs \"libproxy-1.0\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_LIBPROXY_LIBS" 1>&6
-@@ -16914,7 +16932,7 @@ then
+@@ -16914,7 +16953,7 @@ then
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:16918: checking for $ac_word" >&5
-+echo "configure:16936: checking for $ac_word" >&5
++echo "configure:16957: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -16958,19 +16976,19 @@ fi
+@@ -16958,19 +16997,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for libnotify >= $LIBNOTIFY_VERSION""... $ac_c" 1>&6
 -echo "configure:16962: checking for libnotify >= $LIBNOTIFY_VERSION" >&5
-+echo "configure:16980: checking for libnotify >= $LIBNOTIFY_VERSION" >&5
++echo "configure:17001: checking for libnotify >= $LIBNOTIFY_VERSION" >&5
  
          if $PKG_CONFIG --exists "libnotify >= $LIBNOTIFY_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -1114,31 +5694,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_LIBNOTIFY_CFLAGS""... $ac_c" 1>&6
 -echo "configure:16969: checking MOZ_LIBNOTIFY_CFLAGS" >&5
-+echo "configure:16987: checking MOZ_LIBNOTIFY_CFLAGS" >&5
++echo "configure:17008: checking MOZ_LIBNOTIFY_CFLAGS" >&5
              MOZ_LIBNOTIFY_CFLAGS=`$PKG_CONFIG --cflags "libnotify >= $LIBNOTIFY_VERSION"`
              echo "$ac_t""$MOZ_LIBNOTIFY_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_LIBNOTIFY_LIBS""... $ac_c" 1>&6
 -echo "configure:16974: checking MOZ_LIBNOTIFY_LIBS" >&5
-+echo "configure:16992: checking MOZ_LIBNOTIFY_LIBS" >&5
++echo "configure:17013: checking MOZ_LIBNOTIFY_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_LIBNOTIFY_LIBS="`$PKG_CONFIG --libs \"libnotify >= $LIBNOTIFY_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_LIBNOTIFY_LIBS" 1>&6
-@@ -17045,7 +17063,7 @@ fi
+@@ -17045,7 +17084,7 @@ fi
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:17049: checking for $ac_word" >&5
-+echo "configure:17067: checking for $ac_word" >&5
++echo "configure:17088: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -17089,19 +17107,19 @@ fi
+@@ -17089,19 +17128,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for libgnomeui-2.0 >= $GNOMEUI_VERSION""... $ac_c" 1>&6
 -echo "configure:17093: checking for libgnomeui-2.0 >= $GNOMEUI_VERSION" >&5
-+echo "configure:17111: checking for libgnomeui-2.0 >= $GNOMEUI_VERSION" >&5
++echo "configure:17132: checking for libgnomeui-2.0 >= $GNOMEUI_VERSION" >&5
  
          if $PKG_CONFIG --exists "libgnomeui-2.0 >= $GNOMEUI_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -1146,31 +5726,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_GNOMEUI_CFLAGS""... $ac_c" 1>&6
 -echo "configure:17100: checking MOZ_GNOMEUI_CFLAGS" >&5
-+echo "configure:17118: checking MOZ_GNOMEUI_CFLAGS" >&5
++echo "configure:17139: checking MOZ_GNOMEUI_CFLAGS" >&5
              MOZ_GNOMEUI_CFLAGS=`$PKG_CONFIG --cflags "libgnomeui-2.0 >= $GNOMEUI_VERSION"`
              echo "$ac_t""$MOZ_GNOMEUI_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_GNOMEUI_LIBS""... $ac_c" 1>&6
 -echo "configure:17105: checking MOZ_GNOMEUI_LIBS" >&5
-+echo "configure:17123: checking MOZ_GNOMEUI_LIBS" >&5
++echo "configure:17144: checking MOZ_GNOMEUI_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_GNOMEUI_LIBS="`$PKG_CONFIG --libs \"libgnomeui-2.0 >= $GNOMEUI_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_GNOMEUI_LIBS" 1>&6
-@@ -17179,7 +17197,7 @@ fi
+@@ -17179,7 +17218,7 @@ fi
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:17183: checking for $ac_word" >&5
-+echo "configure:17201: checking for $ac_word" >&5
++echo "configure:17222: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -17223,19 +17241,19 @@ fi
+@@ -17223,19 +17262,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for dbus-1 >= $DBUS_VERSION""... $ac_c" 1>&6
 -echo "configure:17227: checking for dbus-1 >= $DBUS_VERSION" >&5
-+echo "configure:17245: checking for dbus-1 >= $DBUS_VERSION" >&5
++echo "configure:17266: checking for dbus-1 >= $DBUS_VERSION" >&5
  
          if $PKG_CONFIG --exists "dbus-1 >= $DBUS_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -1178,31 +5758,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_DBUS_CFLAGS""... $ac_c" 1>&6
 -echo "configure:17234: checking MOZ_DBUS_CFLAGS" >&5
-+echo "configure:17252: checking MOZ_DBUS_CFLAGS" >&5
++echo "configure:17273: checking MOZ_DBUS_CFLAGS" >&5
              MOZ_DBUS_CFLAGS=`$PKG_CONFIG --cflags "dbus-1 >= $DBUS_VERSION"`
              echo "$ac_t""$MOZ_DBUS_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_DBUS_LIBS""... $ac_c" 1>&6
 -echo "configure:17239: checking MOZ_DBUS_LIBS" >&5
-+echo "configure:17257: checking MOZ_DBUS_LIBS" >&5
++echo "configure:17278: checking MOZ_DBUS_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_DBUS_LIBS="`$PKG_CONFIG --libs \"dbus-1 >= $DBUS_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_DBUS_LIBS" 1>&6
-@@ -17270,7 +17288,7 @@ echo "configure:17239: checking MOZ_DBUS_LIBS" >&5
+@@ -17270,7 +17309,7 @@ echo "configure:17239: checking MOZ_DBUS_LIBS" >&5
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:17274: checking for $ac_word" >&5
-+echo "configure:17292: checking for $ac_word" >&5
++echo "configure:17313: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -17314,19 +17332,19 @@ fi
+@@ -17314,19 +17353,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for dbus-glib-1 >= $DBUS_VERSION""... $ac_c" 1>&6
 -echo "configure:17318: checking for dbus-glib-1 >= $DBUS_VERSION" >&5
-+echo "configure:17336: checking for dbus-glib-1 >= $DBUS_VERSION" >&5
++echo "configure:17357: checking for dbus-glib-1 >= $DBUS_VERSION" >&5
  
          if $PKG_CONFIG --exists "dbus-glib-1 >= $DBUS_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -1210,17 +5790,17 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_DBUS_GLIB_CFLAGS""... $ac_c" 1>&6
 -echo "configure:17325: checking MOZ_DBUS_GLIB_CFLAGS" >&5
-+echo "configure:17343: checking MOZ_DBUS_GLIB_CFLAGS" >&5
++echo "configure:17364: checking MOZ_DBUS_GLIB_CFLAGS" >&5
              MOZ_DBUS_GLIB_CFLAGS=`$PKG_CONFIG --cflags "dbus-glib-1 >= $DBUS_VERSION"`
              echo "$ac_t""$MOZ_DBUS_GLIB_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_DBUS_GLIB_LIBS""... $ac_c" 1>&6
 -echo "configure:17330: checking MOZ_DBUS_GLIB_LIBS" >&5
-+echo "configure:17348: checking MOZ_DBUS_GLIB_LIBS" >&5
++echo "configure:17369: checking MOZ_DBUS_GLIB_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_DBUS_GLIB_LIBS="`$PKG_CONFIG --libs \"dbus-glib-1 >= $DBUS_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_DBUS_GLIB_LIBS" 1>&6
-@@ -17367,6 +17385,9 @@ fi
+@@ -17367,6 +17406,9 @@ fi
  
  
  
@@ -1230,21 +5810,21 @@ index b8e7773..67ba888 100755
  # Check whether --enable-crypto or --disable-crypto was given.
  if test "${enable_crypto+set}" = set; then
    enableval="$enable_crypto"
-@@ -17556,7 +17577,7 @@ EOF
+@@ -17556,7 +17598,7 @@ EOF
      esac
  
          echo $ac_n "checking __attribute__ ((aligned ())) support""... $ac_c" 1>&6
 -echo "configure:17560: checking __attribute__ ((aligned ())) support" >&5
-+echo "configure:17581: checking __attribute__ ((aligned ())) support" >&5
++echo "configure:17602: checking __attribute__ ((aligned ())) support" >&5
  if eval "test \"`echo '$''{'ac_cv_c_attribute_aligned'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -17566,14 +17587,14 @@ else
+@@ -17566,14 +17608,14 @@ else
           for ac_cv_c_attr_align_try in 64 32 16 8; do
             echo "trying $ac_cv_c_attr_align_try"
             cat > conftest.$ac_ext <<EOF
 -#line 17570 "configure"
-+#line 17591 "configure"
++#line 17612 "configure"
  #include "confdefs.h"
  
  int main() {
@@ -1252,22 +5832,22 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:17577: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:17598: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:17619: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    ac_cv_c_attribute_aligned="${ac_cv_c_attr_align_try}"
  else
-@@ -17651,19 +17672,19 @@ EOF
+@@ -17651,19 +17693,19 @@ EOF
          MOZ_NATIVE_LIBVPX_DEC_TEST=
             ac_safe=`echo "vpx/vpx_decoder.h" | sed 'y%./+-%__p_%'`
    echo $ac_n "checking for vpx/vpx_decoder.h""... $ac_c" 1>&6
 -echo "configure:17655: checking for vpx/vpx_decoder.h" >&5
-+echo "configure:17676: checking for vpx/vpx_decoder.h" >&5
++echo "configure:17697: checking for vpx/vpx_decoder.h" >&5
    if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
     cat > conftest.$ac_ext <<EOF
 -#line 17660 "configure"
-+#line 17681 "configure"
++#line 17702 "configure"
  #include "confdefs.h"
  #include <vpx/vpx_decoder.h>
  int main() {
@@ -1275,48 +5855,48 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:17667: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:17688: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:17709: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    eval "ac_cv_header_$ac_safe=yes"
  else
-@@ -17686,7 +17707,7 @@ fi
+@@ -17686,7 +17728,7 @@ fi
    fi
  
          echo $ac_n "checking for vpx_codec_dec_init_ver in -lvpx""... $ac_c" 1>&6
 -echo "configure:17690: checking for vpx_codec_dec_init_ver in -lvpx" >&5
-+echo "configure:17711: checking for vpx_codec_dec_init_ver in -lvpx" >&5
++echo "configure:17732: checking for vpx_codec_dec_init_ver in -lvpx" >&5
  ac_lib_var=`echo vpx'_'vpx_codec_dec_init_ver | sed 'y%./+-%__p_%'`
  if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
-@@ -17694,7 +17715,7 @@ else
+@@ -17694,7 +17736,7 @@ else
    ac_save_LIBS="$LIBS"
  LIBS="-lvpx  $LIBS"
  cat > conftest.$ac_ext <<EOF
 -#line 17698 "configure"
-+#line 17719 "configure"
++#line 17740 "configure"
  #include "confdefs.h"
  /* Override any gcc2 internal prototype to avoid an error.  */
  /* We use char because int might match the return type of a gcc2
-@@ -17705,7 +17726,7 @@ int main() {
+@@ -17705,7 +17747,7 @@ int main() {
  vpx_codec_dec_init_ver()
  ; return 0; }
  EOF
 -if { (eval echo configure:17709: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:17730: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:17751: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    eval "ac_cv_lib_$ac_lib_var=yes"
  else
-@@ -17727,14 +17748,14 @@ else
+@@ -17727,14 +17769,14 @@ else
  fi
  
          if test -n "$MOZ_NATIVE_LIBVPX_DEC_TEST" ; then
 -            echo $ac_n "checking for libvpx version >= v0.9.7""... $ac_c" 1>&6
 -echo "configure:17732: checking for libvpx version >= v0.9.7" >&5
 +            echo $ac_n "checking for libvpx version >= v1.0.0""... $ac_c" 1>&6
-+echo "configure:17753: checking for libvpx version >= v1.0.0" >&5
++echo "configure:17774: checking for libvpx version >= v1.0.0" >&5
                                                                                                                                      cat > conftest.$ac_ext <<EOF
 -#line 17734 "configure"
-+#line 17755 "configure"
++#line 17776 "configure"
  #include "confdefs.h"
  
                  #include <vpx/vpx_decoder.h>
@@ -1325,16 +5905,16 @@ index b8e7773..67ba888 100755
                      #error "test failed."
                  #endif
                  
-@@ -17742,7 +17763,7 @@ int main() {
+@@ -17742,7 +17784,7 @@ int main() {
  return 0;
  ; return 0; }
  EOF
 -if { (eval echo configure:17746: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:17767: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:17788: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    echo "$ac_t""yes" 1>&6
                   MOZ_NATIVE_LIBVPX=1
-@@ -17753,7 +17774,7 @@ else
+@@ -17753,7 +17795,7 @@ else
    cat conftest.$ac_ext >&5
    rm -rf conftest*
    echo "$ac_t""no" 1>&6
@@ -1343,7 +5923,7 @@ index b8e7773..67ba888 100755
  fi
  rm -f conftest*
          fi
-@@ -17918,6 +17939,7 @@ EOF
+@@ -17918,6 +17960,7 @@ EOF
  fi
  
  
@@ -1351,21 +5931,21 @@ index b8e7773..67ba888 100755
  if test -n "$MOZ_SYDNEYAUDIO"; then
     case "$target_os" in
  linux*)
-@@ -17927,7 +17949,7 @@ linux*)
+@@ -17927,7 +17970,7 @@ linux*)
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:17931: checking for $ac_word" >&5
-+echo "configure:17953: checking for $ac_word" >&5
++echo "configure:17974: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -17971,19 +17993,19 @@ fi
+@@ -17971,19 +18014,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for alsa""... $ac_c" 1>&6
 -echo "configure:17975: checking for alsa" >&5
-+echo "configure:17997: checking for alsa" >&5
++echo "configure:18018: checking for alsa" >&5
  
          if $PKG_CONFIG --exists "alsa" ; then
              echo "$ac_t""yes" 1>&6
@@ -1373,17 +5953,17 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_ALSA_CFLAGS""... $ac_c" 1>&6
 -echo "configure:17982: checking MOZ_ALSA_CFLAGS" >&5
-+echo "configure:18004: checking MOZ_ALSA_CFLAGS" >&5
++echo "configure:18025: checking MOZ_ALSA_CFLAGS" >&5
              MOZ_ALSA_CFLAGS=`$PKG_CONFIG --cflags "alsa"`
              echo "$ac_t""$MOZ_ALSA_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_ALSA_LIBS""... $ac_c" 1>&6
 -echo "configure:17987: checking MOZ_ALSA_LIBS" >&5
-+echo "configure:18009: checking MOZ_ALSA_LIBS" >&5
++echo "configure:18030: checking MOZ_ALSA_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_ALSA_LIBS="`$PKG_CONFIG --libs \"alsa\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_ALSA_LIBS" 1>&6
-@@ -18016,6 +18038,7 @@ echo "configure:17987: checking MOZ_ALSA_LIBS" >&5
+@@ -18016,6 +18059,7 @@ echo "configure:17987: checking MOZ_ALSA_LIBS" >&5
        ;;
     esac
  fi
@@ -1391,48 +5971,48 @@ index b8e7773..67ba888 100755
  
  # Check whether --enable-permissions or --disable-permissions was given.
  if test "${enable_permissions+set}" = set; then
-@@ -18117,7 +18140,7 @@ fi
+@@ -18117,7 +18161,7 @@ fi
   # Extract the first word of "java", so it can be a program name with args.
  set dummy java; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:18121: checking for $ac_word" >&5
-+echo "configure:18144: checking for $ac_word" >&5
++echo "configure:18165: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_JAVA'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -18166,7 +18189,7 @@ fi
+@@ -18166,7 +18210,7 @@ fi
   # Extract the first word of "javac", so it can be a program name with args.
  set dummy javac; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:18170: checking for $ac_word" >&5
-+echo "configure:18193: checking for $ac_word" >&5
++echo "configure:18214: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_JAVAC'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -18215,7 +18238,7 @@ fi
+@@ -18215,7 +18259,7 @@ fi
   # Extract the first word of "jar", so it can be a program name with args.
  set dummy jar; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:18219: checking for $ac_word" >&5
-+echo "configure:18242: checking for $ac_word" >&5
++echo "configure:18263: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_JAR'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -18405,7 +18428,7 @@ EOF
+@@ -18405,7 +18449,7 @@ EOF
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:18409: checking for $ac_word" >&5
-+echo "configure:18432: checking for $ac_word" >&5
++echo "configure:18453: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -18449,19 +18472,19 @@ fi
+@@ -18449,19 +18493,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for gthread-2.0""... $ac_c" 1>&6
 -echo "configure:18453: checking for gthread-2.0" >&5
-+echo "configure:18476: checking for gthread-2.0" >&5
++echo "configure:18497: checking for gthread-2.0" >&5
  
          if $PKG_CONFIG --exists "gthread-2.0" ; then
              echo "$ac_t""yes" 1>&6
@@ -1440,28 +6020,28 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_GTHREAD_CFLAGS""... $ac_c" 1>&6
 -echo "configure:18460: checking MOZ_GTHREAD_CFLAGS" >&5
-+echo "configure:18483: checking MOZ_GTHREAD_CFLAGS" >&5
++echo "configure:18504: checking MOZ_GTHREAD_CFLAGS" >&5
              MOZ_GTHREAD_CFLAGS=`$PKG_CONFIG --cflags "gthread-2.0"`
              echo "$ac_t""$MOZ_GTHREAD_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_GTHREAD_LIBS""... $ac_c" 1>&6
 -echo "configure:18465: checking MOZ_GTHREAD_LIBS" >&5
-+echo "configure:18488: checking MOZ_GTHREAD_LIBS" >&5
++echo "configure:18509: checking MOZ_GTHREAD_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_GTHREAD_LIBS="`$PKG_CONFIG --libs \"gthread-2.0\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_GTHREAD_LIBS" 1>&6
-@@ -18497,19 +18520,19 @@ echo "configure:18465: checking MOZ_GTHREAD_LIBS" >&5
+@@ -18497,19 +18541,19 @@ echo "configure:18465: checking MOZ_GTHREAD_LIBS" >&5
    do
         ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
    echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
 -echo "configure:18501: checking for $ac_hdr" >&5
-+echo "configure:18524: checking for $ac_hdr" >&5
++echo "configure:18545: checking for $ac_hdr" >&5
    if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
     cat > conftest.$ac_ext <<EOF
 -#line 18506 "configure"
-+#line 18529 "configure"
++#line 18550 "configure"
  #include "confdefs.h"
  #include <$ac_hdr>
  int main() {
@@ -1469,91 +6049,91 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:18513: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:18536: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:18557: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    eval "ac_cv_header_$ac_safe=yes"
  else
-@@ -18622,13 +18645,13 @@ fi
+@@ -18622,13 +18666,13 @@ fi
  
  if test -n "$LIBJPEG_TURBO_X86_ASM" -o -n "$LIBJPEG_TURBO_X64_ASM" ; then
      echo $ac_n "checking for YASM assembler""... $ac_c" 1>&6
 -echo "configure:18626: checking for YASM assembler" >&5
-+echo "configure:18649: checking for YASM assembler" >&5
++echo "configure:18670: checking for YASM assembler" >&5
      for ac_prog in yasm
  do
  # Extract the first word of "$ac_prog", so it can be a program name with args.
  set dummy $ac_prog; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:18632: checking for $ac_word" >&5
-+echo "configure:18655: checking for $ac_word" >&5
++echo "configure:18676: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_prog_LIBJPEG_TURBO_AS'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -18832,7 +18855,7 @@ do
+@@ -18832,7 +18876,7 @@ do
  # Extract the first word of "$ac_prog", so it can be a program name with args.
  set dummy $ac_prog; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:18836: checking for $ac_word" >&5
-+echo "configure:18859: checking for $ac_word" >&5
++echo "configure:18880: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_MAKENSISU'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -18891,7 +18914,7 @@ done
+@@ -18891,7 +18935,7 @@ done
          MAKENSISU_MINOR_VER=`echo $MAKENSISU_VER | $AWK -F\. '{ print $2 }'`
      fi
      echo $ac_n "checking for Unicode NSIS with major version == $REQ_NSIS_MAJOR_VER and minor version >= $MIN_NSIS_MINOR_VER""... $ac_c" 1>&6
 -echo "configure:18895: checking for Unicode NSIS with major version == $REQ_NSIS_MAJOR_VER and minor version >= $MIN_NSIS_MINOR_VER" >&5
-+echo "configure:18918: checking for Unicode NSIS with major version == $REQ_NSIS_MAJOR_VER and minor version >= $MIN_NSIS_MINOR_VER" >&5
++echo "configure:18939: checking for Unicode NSIS with major version == $REQ_NSIS_MAJOR_VER and minor version >= $MIN_NSIS_MINOR_VER" >&5
      if test "$MAKENSISU_VER" = "" ||
         test ! "$MAKENSISU_MAJOR_VER" = "$REQ_NSIS_MAJOR_VER" -o \
              ! "$MAKENSISU_MINOR_VER" -ge $MIN_NSIS_MINOR_VER; then
-@@ -18904,13 +18927,13 @@ fi
+@@ -18904,13 +18948,13 @@ fi
  
  
  echo $ac_n "checking for tar archiver""... $ac_c" 1>&6
 -echo "configure:18908: checking for tar archiver" >&5
-+echo "configure:18931: checking for tar archiver" >&5
++echo "configure:18952: checking for tar archiver" >&5
  for ac_prog in gnutar gtar tar
  do
  # Extract the first word of "$ac_prog", so it can be a program name with args.
  set dummy $ac_prog; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:18914: checking for $ac_word" >&5
-+echo "configure:18937: checking for $ac_word" >&5
++echo "configure:18958: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_prog_TAR'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -18947,13 +18970,13 @@ echo "$ac_t""$TAR" 1>&6
+@@ -18947,13 +18991,13 @@ echo "$ac_t""$TAR" 1>&6
  
  
  echo $ac_n "checking for wget""... $ac_c" 1>&6
 -echo "configure:18951: checking for wget" >&5
-+echo "configure:18974: checking for wget" >&5
++echo "configure:18995: checking for wget" >&5
  for ac_prog in wget
  do
  # Extract the first word of "$ac_prog", so it can be a program name with args.
  set dummy $ac_prog; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:18957: checking for $ac_word" >&5
-+echo "configure:18980: checking for $ac_word" >&5
++echo "configure:19001: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_prog_WGET'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -19145,7 +19168,7 @@ else
+@@ -19145,7 +19189,7 @@ else
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:19149: checking for $ac_word" >&5
-+echo "configure:19172: checking for $ac_word" >&5
++echo "configure:19193: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -19189,19 +19212,19 @@ fi
+@@ -19189,19 +19233,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for sqlite3 >= $SQLITE_VERSION""... $ac_c" 1>&6
 -echo "configure:19193: checking for sqlite3 >= $SQLITE_VERSION" >&5
-+echo "configure:19216: checking for sqlite3 >= $SQLITE_VERSION" >&5
++echo "configure:19237: checking for sqlite3 >= $SQLITE_VERSION" >&5
  
          if $PKG_CONFIG --exists "sqlite3 >= $SQLITE_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -1561,139 +6141,139 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking SQLITE_CFLAGS""... $ac_c" 1>&6
 -echo "configure:19200: checking SQLITE_CFLAGS" >&5
-+echo "configure:19223: checking SQLITE_CFLAGS" >&5
++echo "configure:19244: checking SQLITE_CFLAGS" >&5
              SQLITE_CFLAGS=`$PKG_CONFIG --cflags "sqlite3 >= $SQLITE_VERSION"`
              echo "$ac_t""$SQLITE_CFLAGS" 1>&6
  
              echo $ac_n "checking SQLITE_LIBS""... $ac_c" 1>&6
 -echo "configure:19205: checking SQLITE_LIBS" >&5
-+echo "configure:19228: checking SQLITE_LIBS" >&5
++echo "configure:19249: checking SQLITE_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              SQLITE_LIBS="`$PKG_CONFIG --libs \"sqlite3 >= $SQLITE_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$SQLITE_LIBS" 1>&6
-@@ -19232,7 +19255,7 @@ echo "configure:19205: checking SQLITE_LIBS" >&5
+@@ -19232,7 +19276,7 @@ echo "configure:19205: checking SQLITE_LIBS" >&5
  
  
                          echo $ac_n "checking for SQLITE_SECURE_DELETE support in system SQLite""... $ac_c" 1>&6
 -echo "configure:19236: checking for SQLITE_SECURE_DELETE support in system SQLite" >&5
-+echo "configure:19259: checking for SQLITE_SECURE_DELETE support in system SQLite" >&5
++echo "configure:19280: checking for SQLITE_SECURE_DELETE support in system SQLite" >&5
      _SAVE_CFLAGS="$CFLAGS"
      CFLAGS="$CFLAGS $SQLITE_CFLAGS"
      _SAVE_LIBS="$LIBS"
-@@ -19246,7 +19269,7 @@ else
+@@ -19246,7 +19290,7 @@ else
          
  else
    cat > conftest.$ac_ext <<EOF
 -#line 19250 "configure"
-+#line 19273 "configure"
++#line 19294 "configure"
  #include "confdefs.h"
  
              #include "sqlite3.h"
-@@ -19255,7 +19278,7 @@ else
+@@ -19255,7 +19299,7 @@ else
                return !sqlite3_compileoption_used("SQLITE_SECURE_DELETE");
              }
  EOF
 -if { (eval echo configure:19259: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:19282: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:19303: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
  then
    ac_cv_sqlite_secure_delete=yes
  else
-@@ -19278,7 +19301,7 @@ fi
+@@ -19278,7 +19322,7 @@ fi
      fi
  
                          echo $ac_n "checking for SQLITE_THREADSAFE support in system SQLite""... $ac_c" 1>&6
 -echo "configure:19282: checking for SQLITE_THREADSAFE support in system SQLite" >&5
-+echo "configure:19305: checking for SQLITE_THREADSAFE support in system SQLite" >&5
++echo "configure:19326: checking for SQLITE_THREADSAFE support in system SQLite" >&5
      _SAVE_CFLAGS="$CFLAGS"
      CFLAGS="$CFLAGS $SQLITE_CFLAGS"
      _SAVE_LIBS="$LIBS"
-@@ -19292,7 +19315,7 @@ else
+@@ -19292,7 +19336,7 @@ else
          
  else
    cat > conftest.$ac_ext <<EOF
 -#line 19296 "configure"
-+#line 19319 "configure"
++#line 19340 "configure"
  #include "confdefs.h"
  
              #include "sqlite3.h"
-@@ -19301,7 +19324,7 @@ else
+@@ -19301,7 +19345,7 @@ else
                return !sqlite3_compileoption_used("SQLITE_THREADSAFE=1");
              }
  EOF
 -if { (eval echo configure:19305: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:19328: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:19349: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
  then
    ac_cv_sqlite_threadsafe=yes
  else
-@@ -19324,7 +19347,7 @@ fi
+@@ -19324,7 +19368,7 @@ fi
      fi
  
                          echo $ac_n "checking for SQLITE_ENABLE_FTS3 support in system SQLite""... $ac_c" 1>&6
 -echo "configure:19328: checking for SQLITE_ENABLE_FTS3 support in system SQLite" >&5
-+echo "configure:19351: checking for SQLITE_ENABLE_FTS3 support in system SQLite" >&5
++echo "configure:19372: checking for SQLITE_ENABLE_FTS3 support in system SQLite" >&5
      _SAVE_CFLAGS="$CFLAGS"
      CFLAGS="$CFLAGS $SQLITE_CFLAGS"
      _SAVE_LIBS="$LIBS"
-@@ -19338,7 +19361,7 @@ else
+@@ -19338,7 +19382,7 @@ else
          
  else
    cat > conftest.$ac_ext <<EOF
 -#line 19342 "configure"
-+#line 19365 "configure"
++#line 19386 "configure"
  #include "confdefs.h"
  
              #include "sqlite3.h"
-@@ -19347,7 +19370,7 @@ else
+@@ -19347,7 +19391,7 @@ else
                return !sqlite3_compileoption_used("SQLITE_ENABLE_FTS3");
              }
  EOF
 -if { (eval echo configure:19351: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:19374: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:19395: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
  then
    ac_cv_sqlite_enable_fts3=yes
  else
-@@ -19370,7 +19393,7 @@ fi
+@@ -19370,7 +19414,7 @@ fi
      fi
  
                          echo $ac_n "checking for SQLITE_ENABLE_UNLOCK_NOTIFY support in system SQLite""... $ac_c" 1>&6
 -echo "configure:19374: checking for SQLITE_ENABLE_UNLOCK_NOTIFY support in system SQLite" >&5
-+echo "configure:19397: checking for SQLITE_ENABLE_UNLOCK_NOTIFY support in system SQLite" >&5
++echo "configure:19418: checking for SQLITE_ENABLE_UNLOCK_NOTIFY support in system SQLite" >&5
      _SAVE_CFLAGS="$CFLAGS"
      CFLAGS="$CFLAGS $SQLITE_CFLAGS"
      _SAVE_LIBS="$LIBS"
-@@ -19384,7 +19407,7 @@ else
+@@ -19384,7 +19428,7 @@ else
          
  else
    cat > conftest.$ac_ext <<EOF
 -#line 19388 "configure"
-+#line 19411 "configure"
++#line 19432 "configure"
  #include "confdefs.h"
  
              #include "sqlite3.h"
-@@ -19393,7 +19416,7 @@ else
+@@ -19393,7 +19437,7 @@ else
                return !sqlite3_compileoption_used("SQLITE_ENABLE_UNLOCK_NOTIFY");
              }
  EOF
 -if { (eval echo configure:19397: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:19420: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:19441: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
  then
    ac_cv_sqlite_enable_unlock_notify=yes
  else
-@@ -19516,7 +19539,7 @@ if test -n "$MOZ_ENABLE_LIBCONIC"; then
+@@ -19516,7 +19560,7 @@ if test -n "$MOZ_ENABLE_LIBCONIC"; then
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:19520: checking for $ac_word" >&5
-+echo "configure:19543: checking for $ac_word" >&5
++echo "configure:19564: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -19560,19 +19583,19 @@ fi
+@@ -19560,19 +19604,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for conic""... $ac_c" 1>&6
 -echo "configure:19564: checking for conic" >&5
-+echo "configure:19587: checking for conic" >&5
++echo "configure:19608: checking for conic" >&5
  
          if $PKG_CONFIG --exists "conic" ; then
              echo "$ac_t""yes" 1>&6
@@ -1701,28 +6281,28 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking LIBCONIC_CFLAGS""... $ac_c" 1>&6
 -echo "configure:19571: checking LIBCONIC_CFLAGS" >&5
-+echo "configure:19594: checking LIBCONIC_CFLAGS" >&5
++echo "configure:19615: checking LIBCONIC_CFLAGS" >&5
              LIBCONIC_CFLAGS=`$PKG_CONFIG --cflags "conic"`
              echo "$ac_t""$LIBCONIC_CFLAGS" 1>&6
  
              echo $ac_n "checking LIBCONIC_LIBS""... $ac_c" 1>&6
 -echo "configure:19576: checking LIBCONIC_LIBS" >&5
-+echo "configure:19599: checking LIBCONIC_LIBS" >&5
++echo "configure:19620: checking LIBCONIC_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              LIBCONIC_LIBS="`$PKG_CONFIG --libs \"conic\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$LIBCONIC_LIBS" 1>&6
-@@ -19658,19 +19681,19 @@ EOF
+@@ -19658,19 +19702,19 @@ EOF
    do
         ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
    echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
 -echo "configure:19662: checking for $ac_hdr" >&5
-+echo "configure:19685: checking for $ac_hdr" >&5
++echo "configure:19706: checking for $ac_hdr" >&5
    if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
     cat > conftest.$ac_ext <<EOF
 -#line 19667 "configure"
-+#line 19690 "configure"
++#line 19711 "configure"
  #include "confdefs.h"
  #include <$ac_hdr>
  int main() {
@@ -1730,52 +6310,52 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:19674: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:19697: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:19718: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    eval "ac_cv_header_$ac_safe=yes"
  else
-@@ -19697,7 +19720,7 @@ EOF
+@@ -19697,7 +19741,7 @@ EOF
    done
  
        echo $ac_n "checking for XCompositeRedirectWindow in -lXcomposite""... $ac_c" 1>&6
 -echo "configure:19701: checking for XCompositeRedirectWindow in -lXcomposite" >&5
-+echo "configure:19724: checking for XCompositeRedirectWindow in -lXcomposite" >&5
++echo "configure:19745: checking for XCompositeRedirectWindow in -lXcomposite" >&5
  ac_lib_var=`echo Xcomposite'_'XCompositeRedirectWindow | sed 'y%./+-%__p_%'`
  if eval "test \"`echo '$''{'ac_cv_lib_$ac_lib_var'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
-@@ -19705,7 +19728,7 @@ else
+@@ -19705,7 +19749,7 @@ else
    ac_save_LIBS="$LIBS"
  LIBS="-lXcomposite $XLIBS $LIBS"
  cat > conftest.$ac_ext <<EOF
 -#line 19709 "configure"
-+#line 19732 "configure"
++#line 19753 "configure"
  #include "confdefs.h"
  /* Override any gcc2 internal prototype to avoid an error.  */
  /* We use char because int might match the return type of a gcc2
-@@ -19716,7 +19739,7 @@ int main() {
+@@ -19716,7 +19760,7 @@ int main() {
  XCompositeRedirectWindow()
  ; return 0; }
  EOF
 -if { (eval echo configure:19720: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:19743: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:19764: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    eval "ac_cv_lib_$ac_lib_var=yes"
  else
-@@ -19746,7 +19769,7 @@ fi
+@@ -19746,7 +19790,7 @@ fi
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:19750: checking for $ac_word" >&5
-+echo "configure:19773: checking for $ac_word" >&5
++echo "configure:19794: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -19790,19 +19813,19 @@ fi
+@@ -19790,19 +19834,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for libhildonmime""... $ac_c" 1>&6
 -echo "configure:19794: checking for libhildonmime" >&5
-+echo "configure:19817: checking for libhildonmime" >&5
++echo "configure:19838: checking for libhildonmime" >&5
  
          if $PKG_CONFIG --exists "libhildonmime" ; then
              echo "$ac_t""yes" 1>&6
@@ -1783,31 +6363,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking LIBHILDONMIME_CFLAGS""... $ac_c" 1>&6
 -echo "configure:19801: checking LIBHILDONMIME_CFLAGS" >&5
-+echo "configure:19824: checking LIBHILDONMIME_CFLAGS" >&5
++echo "configure:19845: checking LIBHILDONMIME_CFLAGS" >&5
              LIBHILDONMIME_CFLAGS=`$PKG_CONFIG --cflags "libhildonmime"`
              echo "$ac_t""$LIBHILDONMIME_CFLAGS" 1>&6
  
              echo $ac_n "checking LIBHILDONMIME_LIBS""... $ac_c" 1>&6
 -echo "configure:19806: checking LIBHILDONMIME_LIBS" >&5
-+echo "configure:19829: checking LIBHILDONMIME_LIBS" >&5
++echo "configure:19850: checking LIBHILDONMIME_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              LIBHILDONMIME_LIBS="`$PKG_CONFIG --libs \"libhildonmime\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$LIBHILDONMIME_LIBS" 1>&6
-@@ -19844,7 +19867,7 @@ echo "configure:19806: checking LIBHILDONMIME_LIBS" >&5
+@@ -19844,7 +19888,7 @@ echo "configure:19806: checking LIBHILDONMIME_LIBS" >&5
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:19848: checking for $ac_word" >&5
-+echo "configure:19871: checking for $ac_word" >&5
++echo "configure:19892: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -19888,19 +19911,19 @@ fi
+@@ -19888,19 +19932,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for libosso""... $ac_c" 1>&6
 -echo "configure:19892: checking for libosso" >&5
-+echo "configure:19915: checking for libosso" >&5
++echo "configure:19936: checking for libosso" >&5
  
          if $PKG_CONFIG --exists "libosso" ; then
              echo "$ac_t""yes" 1>&6
@@ -1815,31 +6395,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking LIBOSSO_CFLAGS""... $ac_c" 1>&6
 -echo "configure:19899: checking LIBOSSO_CFLAGS" >&5
-+echo "configure:19922: checking LIBOSSO_CFLAGS" >&5
++echo "configure:19943: checking LIBOSSO_CFLAGS" >&5
              LIBOSSO_CFLAGS=`$PKG_CONFIG --cflags "libosso"`
              echo "$ac_t""$LIBOSSO_CFLAGS" 1>&6
  
              echo $ac_n "checking LIBOSSO_LIBS""... $ac_c" 1>&6
 -echo "configure:19904: checking LIBOSSO_LIBS" >&5
-+echo "configure:19927: checking LIBOSSO_LIBS" >&5
++echo "configure:19948: checking LIBOSSO_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              LIBOSSO_LIBS="`$PKG_CONFIG --libs \"libosso\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$LIBOSSO_LIBS" 1>&6
-@@ -19941,7 +19964,7 @@ echo "configure:19904: checking LIBOSSO_LIBS" >&5
+@@ -19941,7 +19985,7 @@ echo "configure:19904: checking LIBOSSO_LIBS" >&5
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:19945: checking for $ac_word" >&5
-+echo "configure:19968: checking for $ac_word" >&5
++echo "configure:19989: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -19985,19 +20008,19 @@ fi
+@@ -19985,19 +20029,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for hildon-fm-2""... $ac_c" 1>&6
 -echo "configure:19989: checking for hildon-fm-2" >&5
-+echo "configure:20012: checking for hildon-fm-2" >&5
++echo "configure:20033: checking for hildon-fm-2" >&5
  
          if $PKG_CONFIG --exists "hildon-fm-2" ; then
              echo "$ac_t""yes" 1>&6
@@ -1847,31 +6427,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking LIBHILDONFM_CFLAGS""... $ac_c" 1>&6
 -echo "configure:19996: checking LIBHILDONFM_CFLAGS" >&5
-+echo "configure:20019: checking LIBHILDONFM_CFLAGS" >&5
++echo "configure:20040: checking LIBHILDONFM_CFLAGS" >&5
              LIBHILDONFM_CFLAGS=`$PKG_CONFIG --cflags "hildon-fm-2"`
              echo "$ac_t""$LIBHILDONFM_CFLAGS" 1>&6
  
              echo $ac_n "checking LIBHILDONFM_LIBS""... $ac_c" 1>&6
 -echo "configure:20001: checking LIBHILDONFM_LIBS" >&5
-+echo "configure:20024: checking LIBHILDONFM_LIBS" >&5
++echo "configure:20045: checking LIBHILDONFM_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              LIBHILDONFM_LIBS="`$PKG_CONFIG --libs \"hildon-fm-2\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$LIBHILDONFM_LIBS" 1>&6
-@@ -20041,7 +20064,7 @@ echo "configure:20001: checking LIBHILDONFM_LIBS" >&5
+@@ -20041,7 +20085,7 @@ echo "configure:20001: checking LIBHILDONFM_LIBS" >&5
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:20045: checking for $ac_word" >&5
-+echo "configure:20068: checking for $ac_word" >&5
++echo "configure:20089: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -20085,19 +20108,19 @@ fi
+@@ -20085,19 +20129,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for ContentManager QtSparql""... $ac_c" 1>&6
 -echo "configure:20089: checking for ContentManager QtSparql" >&5
-+echo "configure:20112: checking for ContentManager QtSparql" >&5
++echo "configure:20133: checking for ContentManager QtSparql" >&5
  
          if $PKG_CONFIG --exists "ContentManager QtSparql" ; then
              echo "$ac_t""yes" 1>&6
@@ -1879,31 +6459,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking LIBCONTENTMANAGER_CFLAGS""... $ac_c" 1>&6
 -echo "configure:20096: checking LIBCONTENTMANAGER_CFLAGS" >&5
-+echo "configure:20119: checking LIBCONTENTMANAGER_CFLAGS" >&5
++echo "configure:20140: checking LIBCONTENTMANAGER_CFLAGS" >&5
              LIBCONTENTMANAGER_CFLAGS=`$PKG_CONFIG --cflags "ContentManager QtSparql"`
              echo "$ac_t""$LIBCONTENTMANAGER_CFLAGS" 1>&6
  
              echo $ac_n "checking LIBCONTENTMANAGER_LIBS""... $ac_c" 1>&6
 -echo "configure:20101: checking LIBCONTENTMANAGER_LIBS" >&5
-+echo "configure:20124: checking LIBCONTENTMANAGER_LIBS" >&5
++echo "configure:20145: checking LIBCONTENTMANAGER_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              LIBCONTENTMANAGER_LIBS="`$PKG_CONFIG --libs \"ContentManager QtSparql\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$LIBCONTENTMANAGER_LIBS" 1>&6
-@@ -20160,7 +20183,7 @@ fi
+@@ -20160,7 +20204,7 @@ fi
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:20164: checking for $ac_word" >&5
-+echo "configure:20187: checking for $ac_word" >&5
++echo "configure:20208: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -20204,19 +20227,19 @@ fi
+@@ -20204,19 +20248,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for contentaction-0.1""... $ac_c" 1>&6
 -echo "configure:20208: checking for contentaction-0.1" >&5
-+echo "configure:20231: checking for contentaction-0.1" >&5
++echo "configure:20252: checking for contentaction-0.1" >&5
  
          if $PKG_CONFIG --exists "contentaction-0.1" ; then
              echo "$ac_t""yes" 1>&6
@@ -1911,31 +6491,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking LIBCONTENTACTION_CFLAGS""... $ac_c" 1>&6
 -echo "configure:20215: checking LIBCONTENTACTION_CFLAGS" >&5
-+echo "configure:20238: checking LIBCONTENTACTION_CFLAGS" >&5
++echo "configure:20259: checking LIBCONTENTACTION_CFLAGS" >&5
              LIBCONTENTACTION_CFLAGS=`$PKG_CONFIG --cflags "contentaction-0.1"`
              echo "$ac_t""$LIBCONTENTACTION_CFLAGS" 1>&6
  
              echo $ac_n "checking LIBCONTENTACTION_LIBS""... $ac_c" 1>&6
 -echo "configure:20220: checking LIBCONTENTACTION_LIBS" >&5
-+echo "configure:20243: checking LIBCONTENTACTION_LIBS" >&5
++echo "configure:20264: checking LIBCONTENTACTION_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              LIBCONTENTACTION_LIBS="`$PKG_CONFIG --libs \"contentaction-0.1\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$LIBCONTENTACTION_LIBS" 1>&6
-@@ -20277,7 +20300,7 @@ fi
+@@ -20277,7 +20321,7 @@ fi
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:20281: checking for $ac_word" >&5
-+echo "configure:20304: checking for $ac_word" >&5
++echo "configure:20325: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -20321,19 +20344,19 @@ fi
+@@ -20321,19 +20365,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for meegotouchcore""... $ac_c" 1>&6
 -echo "configure:20325: checking for meegotouchcore" >&5
-+echo "configure:20348: checking for meegotouchcore" >&5
++echo "configure:20369: checking for meegotouchcore" >&5
  
          if $PKG_CONFIG --exists "meegotouchcore" ; then
              echo "$ac_t""yes" 1>&6
@@ -1943,31 +6523,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking MOZ_MEEGOTOUCH_CFLAGS""... $ac_c" 1>&6
 -echo "configure:20332: checking MOZ_MEEGOTOUCH_CFLAGS" >&5
-+echo "configure:20355: checking MOZ_MEEGOTOUCH_CFLAGS" >&5
++echo "configure:20376: checking MOZ_MEEGOTOUCH_CFLAGS" >&5
              MOZ_MEEGOTOUCH_CFLAGS=`$PKG_CONFIG --cflags "meegotouchcore"`
              echo "$ac_t""$MOZ_MEEGOTOUCH_CFLAGS" 1>&6
  
              echo $ac_n "checking MOZ_MEEGOTOUCH_LIBS""... $ac_c" 1>&6
 -echo "configure:20337: checking MOZ_MEEGOTOUCH_LIBS" >&5
-+echo "configure:20360: checking MOZ_MEEGOTOUCH_LIBS" >&5
++echo "configure:20381: checking MOZ_MEEGOTOUCH_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              MOZ_MEEGOTOUCH_LIBS="`$PKG_CONFIG --libs \"meegotouchcore\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$MOZ_MEEGOTOUCH_LIBS" 1>&6
-@@ -20381,7 +20404,7 @@ EOF
+@@ -20381,7 +20425,7 @@ EOF
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:20385: checking for $ac_word" >&5
-+echo "configure:20408: checking for $ac_word" >&5
++echo "configure:20429: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -20425,19 +20448,19 @@ fi
+@@ -20425,19 +20469,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for liblocation""... $ac_c" 1>&6
 -echo "configure:20429: checking for liblocation" >&5
-+echo "configure:20452: checking for liblocation" >&5
++echo "configure:20473: checking for liblocation" >&5
  
          if $PKG_CONFIG --exists "liblocation" ; then
              echo "$ac_t""yes" 1>&6
@@ -1975,31 +6555,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking LIBLOCATION_CFLAGS""... $ac_c" 1>&6
 -echo "configure:20436: checking LIBLOCATION_CFLAGS" >&5
-+echo "configure:20459: checking LIBLOCATION_CFLAGS" >&5
++echo "configure:20480: checking LIBLOCATION_CFLAGS" >&5
              LIBLOCATION_CFLAGS=`$PKG_CONFIG --cflags "liblocation"`
              echo "$ac_t""$LIBLOCATION_CFLAGS" 1>&6
  
              echo $ac_n "checking LIBLOCATION_LIBS""... $ac_c" 1>&6
 -echo "configure:20441: checking LIBLOCATION_LIBS" >&5
-+echo "configure:20464: checking LIBLOCATION_LIBS" >&5
++echo "configure:20485: checking LIBLOCATION_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              LIBLOCATION_LIBS="`$PKG_CONFIG --libs \"liblocation\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$LIBLOCATION_LIBS" 1>&6
-@@ -20485,7 +20508,7 @@ EOF
+@@ -20485,7 +20529,7 @@ EOF
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:20489: checking for $ac_word" >&5
-+echo "configure:20512: checking for $ac_word" >&5
++echo "configure:20533: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -20529,19 +20552,19 @@ fi
+@@ -20529,19 +20573,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri""... $ac_c" 1>&6
 -echo "configure:20533: checking for ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri" >&5
-+echo "configure:20556: checking for ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri" >&5
++echo "configure:20577: checking for ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri" >&5
  
          if $PKG_CONFIG --exists "ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri" ; then
              echo "$ac_t""yes" 1>&6
@@ -2007,27 +6587,27 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking LIBMEEGOTOUCHSHARE_CFLAGS""... $ac_c" 1>&6
 -echo "configure:20540: checking LIBMEEGOTOUCHSHARE_CFLAGS" >&5
-+echo "configure:20563: checking LIBMEEGOTOUCHSHARE_CFLAGS" >&5
++echo "configure:20584: checking LIBMEEGOTOUCHSHARE_CFLAGS" >&5
              LIBMEEGOTOUCHSHARE_CFLAGS=`$PKG_CONFIG --cflags "ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri"`
              echo "$ac_t""$LIBMEEGOTOUCHSHARE_CFLAGS" 1>&6
  
              echo $ac_n "checking LIBMEEGOTOUCHSHARE_LIBS""... $ac_c" 1>&6
 -echo "configure:20545: checking LIBMEEGOTOUCHSHARE_LIBS" >&5
-+echo "configure:20568: checking LIBMEEGOTOUCHSHARE_LIBS" >&5
++echo "configure:20589: checking LIBMEEGOTOUCHSHARE_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              LIBMEEGOTOUCHSHARE_LIBS="`$PKG_CONFIG --libs \"ShareUiInterface-maemo-meegotouch >= 0.3.31 mdatauri\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$LIBMEEGOTOUCHSHARE_LIBS" 1>&6
-@@ -20661,18 +20684,18 @@ MOZ_DEBUG_DISABLE_DEFS="-DNDEBUG -DTRIMMED"
+@@ -20661,18 +20705,18 @@ MOZ_DEBUG_DISABLE_DEFS="-DNDEBUG -DTRIMMED"
  
  if test -n "$MOZ_DEBUG"; then
      echo $ac_n "checking for valid debug flags""... $ac_c" 1>&6
 -echo "configure:20665: checking for valid debug flags" >&5
-+echo "configure:20688: checking for valid debug flags" >&5
++echo "configure:20709: checking for valid debug flags" >&5
      _SAVE_CFLAGS=$CFLAGS
      CFLAGS="$CFLAGS $MOZ_DEBUG_FLAGS"
      cat > conftest.$ac_ext <<EOF
 -#line 20669 "configure"
-+#line 20692 "configure"
++#line 20713 "configure"
  #include "confdefs.h"
  #include <stdio.h>
  int main() {
@@ -2035,21 +6615,21 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:20676: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:20699: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:20720: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    _results=yes
  else
-@@ -20757,18 +20780,18 @@ fi
+@@ -20757,18 +20801,18 @@ fi
  if test "$COMPILE_ENVIRONMENT"; then
  if test -n "$MOZ_OPTIMIZE"; then
      echo $ac_n "checking for valid optimization flags""... $ac_c" 1>&6
 -echo "configure:20761: checking for valid optimization flags" >&5
-+echo "configure:20784: checking for valid optimization flags" >&5
++echo "configure:20805: checking for valid optimization flags" >&5
      _SAVE_CFLAGS=$CFLAGS
      CFLAGS="$CFLAGS $MOZ_OPTIMIZE_FLAGS"
      cat > conftest.$ac_ext <<EOF
 -#line 20765 "configure"
-+#line 20788 "configure"
++#line 20809 "configure"
  #include "confdefs.h"
  #include <stdio.h>
  int main() {
@@ -2057,34 +6637,34 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:20772: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:20795: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:20816: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    _results=yes
  else
-@@ -20837,7 +20860,7 @@ fi
+@@ -20837,7 +20881,7 @@ fi
  
  if test "$GNU_CC" -a "$GCC_USE_GNU_LD" -a -z "$MOZ_DISABLE_ICF"; then
      echo $ac_n "checking whether the linker supports Identical Code Folding""... $ac_c" 1>&6
 -echo "configure:20841: checking whether the linker supports Identical Code Folding" >&5
-+echo "configure:20864: checking whether the linker supports Identical Code Folding" >&5
++echo "configure:20885: checking whether the linker supports Identical Code Folding" >&5
  if eval "test \"`echo '$''{'LD_SUPPORTS_ICF'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -20846,7 +20869,7 @@ else
+@@ -20846,7 +20890,7 @@ else
                'int main() {return foo() - bar();}' > conftest.${ac_ext}
          # If the linker supports ICF, foo and bar symbols will have
          # the same address
 -        if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS -Wl,--icf=safe -ffunction-sections conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:20850: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-+        if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS -Wl,--icf=safe -ffunction-sections conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:20873: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
++        if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS -Wl,--icf=safe -ffunction-sections conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:20894: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
             test -s conftest${ac_exeext} &&
             objdump -t conftest${ac_exeext} | awk '{a[$6] = $1} END {if (a["foo"] && (a["foo"] != a["bar"])) { exit 1 }}'; then
              LD_SUPPORTS_ICF=yes
-@@ -20867,15 +20890,15 @@ fi
+@@ -20867,15 +20911,15 @@ fi
  
  if test "$GNU_CC" -a "$GCC_USE_GNU_LD" -a -n "$MOZ_DEBUG_FLAGS"; then
        echo $ac_n "checking whether removing dead symbols breaks debugging""... $ac_c" 1>&6
 -echo "configure:20871: checking whether removing dead symbols breaks debugging" >&5
-+echo "configure:20894: checking whether removing dead symbols breaks debugging" >&5
++echo "configure:20915: checking whether removing dead symbols breaks debugging" >&5
  if eval "test \"`echo '$''{'GC_SECTIONS_BREAKS_DEBUG_RANGES'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
@@ -2093,12 +6673,12 @@ index b8e7773..67ba888 100755
               'int main() {return foo();}' > conftest.${ac_ext}
 -        if { ac_try='${CC-cc} -o conftest.${ac_objext} $CFLAGS $MOZ_DEBUG_FLAGS -ffunction-sections -c conftest.${ac_ext} 1>&2'; { (eval echo configure:20878: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
 -           { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS $MOZ_DEBUG_FLAGS -Wl,--gc-sections conftest.${ac_objext} $LIBS 1>&2'; { (eval echo configure:20879: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-+        if { ac_try='${CC-cc} -o conftest.${ac_objext} $CFLAGS $MOZ_DEBUG_FLAGS -ffunction-sections -c conftest.${ac_ext} 1>&2'; { (eval echo configure:20901: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-+           { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS $MOZ_DEBUG_FLAGS -Wl,--gc-sections conftest.${ac_objext} $LIBS 1>&2'; { (eval echo configure:20902: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
++        if { ac_try='${CC-cc} -o conftest.${ac_objext} $CFLAGS $MOZ_DEBUG_FLAGS -ffunction-sections -c conftest.${ac_ext} 1>&2'; { (eval echo configure:20922: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
++           { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS $MOZ_DEBUG_FLAGS -Wl,--gc-sections conftest.${ac_objext} $LIBS 1>&2'; { (eval echo configure:20923: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
             test -s conftest${ac_exeext} -a -s conftest.${ac_objext}; then
              if test "`$PYTHON "$_topsrcdir"/build/unix/check_debug_ranges.py conftest.${ac_objext} conftest.${ac_ext}`" = \
                      "`$PYTHON "$_topsrcdir"/build/unix/check_debug_ranges.py conftest${ac_exeext} conftest.${ac_ext}`"; then
-@@ -21007,7 +21030,7 @@ if test "${enable_jemalloc+set}" = set; then
+@@ -21007,7 +21051,7 @@ if test "${enable_jemalloc+set}" = set; then
  fi
  
  
@@ -2107,93 +6687,93 @@ index b8e7773..67ba888 100755
      MOZ_MEMORY=
  fi
  
-@@ -21045,7 +21068,7 @@ EOF
+@@ -21045,7 +21089,7 @@ EOF
      fi
    else
      echo $ac_n "checking size of int *""... $ac_c" 1>&6
 -echo "configure:21049: checking size of int *" >&5
-+echo "configure:21072: checking size of int *" >&5
++echo "configure:21093: checking size of int *" >&5
  if eval "test \"`echo '$''{'ac_cv_sizeof_int_p'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -21053,7 +21076,7 @@ else
+@@ -21053,7 +21097,7 @@ else
    ac_cv_sizeof_int_p=4
  else
    cat > conftest.$ac_ext <<EOF
 -#line 21057 "configure"
-+#line 21080 "configure"
++#line 21101 "configure"
  #include "confdefs.h"
  #include <stdio.h>
  int main()
-@@ -21064,7 +21087,7 @@ int main()
+@@ -21064,7 +21108,7 @@ int main()
    return(0);
  }
  EOF
 -if { (eval echo configure:21068: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:21091: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:21112: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
  then
    ac_cv_sizeof_int_p=`cat conftestval`
  else
-@@ -21365,7 +21388,7 @@ do
+@@ -21365,7 +21409,7 @@ do
  # Extract the first word of "$ac_prog", so it can be a program name with args.
  set dummy $ac_prog; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:21369: checking for $ac_word" >&5
-+echo "configure:21392: checking for $ac_word" >&5
++echo "configure:21413: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_CCACHE'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -21519,12 +21542,12 @@ fi
+@@ -21519,12 +21563,12 @@ fi
  
  if test "$USE_ELF_HACK" = 1; then
                                      echo $ac_n "checking whether linker creates PT_GNU_RELRO segments""... $ac_c" 1>&6
 -echo "configure:21523: checking whether linker creates PT_GNU_RELRO segments" >&5
-+echo "configure:21546: checking whether linker creates PT_GNU_RELRO segments" >&5
++echo "configure:21567: checking whether linker creates PT_GNU_RELRO segments" >&5
  if eval "test \"`echo '$''{'LINK_WITH_PT_GNU_RELRO'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
    echo "int main() {return 0;}" > conftest.${ac_ext}
 -         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:21528: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
-+         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:21551: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
++         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.${ac_ext} $LIBS 1>&2'; { (eval echo configure:21572: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } &&
              test -s conftest${ac_exeext}; then
              if readelf -l conftest${ac_exeext} | grep GNU_RELRO > /dev/null; then
                  LINK_WITH_PT_GNU_RELRO=yes
-@@ -21652,12 +21675,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
+@@ -21652,12 +21696,12 @@ cross_compiling=$ac_cv_prog_cxx_cross
      for ac_func in __cxa_demangle
  do
  echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
 -echo "configure:21656: checking for $ac_func" >&5
-+echo "configure:21679: checking for $ac_func" >&5
++echo "configure:21700: checking for $ac_func" >&5
  if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
    cat > conftest.$ac_ext <<EOF
 -#line 21661 "configure"
-+#line 21684 "configure"
++#line 21705 "configure"
  #include "confdefs.h"
  /* System header to define __stub macros and hopefully few prototypes,
      which can conflict with char $ac_func(); below.  */
-@@ -21683,7 +21706,7 @@ $ac_func();
+@@ -21683,7 +21727,7 @@ $ac_func();
  
  ; return 0; }
  EOF
 -if { (eval echo configure:21687: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:21710: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:21731: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    eval "ac_cv_func_$ac_func=yes"
  else
-@@ -21731,19 +21754,19 @@ fi
+@@ -21731,19 +21775,19 @@ fi
  if test -z "$SKIP_LIBRARY_CHECKS"; then
         ac_safe=`echo "unwind.h" | sed 'y%./+-%__p_%'`
    echo $ac_n "checking for unwind.h""... $ac_c" 1>&6
 -echo "configure:21735: checking for unwind.h" >&5
-+echo "configure:21758: checking for unwind.h" >&5
++echo "configure:21779: checking for unwind.h" >&5
    if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
     cat > conftest.$ac_ext <<EOF
 -#line 21740 "configure"
-+#line 21763 "configure"
++#line 21784 "configure"
  #include "confdefs.h"
  #include <unwind.h>
  int main() {
@@ -2201,49 +6781,49 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:21747: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:21770: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:21791: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    eval "ac_cv_header_$ac_safe=yes"
  else
-@@ -21760,12 +21783,12 @@ fi
+@@ -21760,12 +21804,12 @@ fi
      for ac_func in _Unwind_Backtrace
  do
  echo $ac_n "checking for $ac_func""... $ac_c" 1>&6
 -echo "configure:21764: checking for $ac_func" >&5
-+echo "configure:21787: checking for $ac_func" >&5
++echo "configure:21808: checking for $ac_func" >&5
  if eval "test \"`echo '$''{'ac_cv_func_$ac_func'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
    cat > conftest.$ac_ext <<EOF
 -#line 21769 "configure"
-+#line 21792 "configure"
++#line 21813 "configure"
  #include "confdefs.h"
  /* System header to define __stub macros and hopefully few prototypes,
      which can conflict with char $ac_func(); below.  */
-@@ -21788,7 +21811,7 @@ $ac_func();
+@@ -21788,7 +21832,7 @@ $ac_func();
  
  ; return 0; }
  EOF
 -if { (eval echo configure:21792: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:21815: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:21836: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    eval "ac_cv_func_$ac_func=yes"
  else
-@@ -21949,7 +21972,7 @@ if test -z "$SKIP_COMPILER_CHECKS"; then
+@@ -21949,7 +21993,7 @@ if test -z "$SKIP_COMPILER_CHECKS"; then
  # Compiler Options
  
  echo $ac_n "checking for gcc -pipe support""... $ac_c" 1>&6
 -echo "configure:21953: checking for gcc -pipe support" >&5
-+echo "configure:21976: checking for gcc -pipe support" >&5
++echo "configure:21997: checking for gcc -pipe support" >&5
  if test -n "$GNU_CC" -a -n "$GNU_CXX" -a -n "$GNU_AS"; then
      echo '#include <stdio.h>' > dummy-hello.c
      echo 'int main() { printf("Hello World\n"); exit(0); }' >> dummy-hello.c
-@@ -21964,14 +21987,14 @@ if test -n "$GNU_CC" -a -n "$GNU_CXX" -a -n "$GNU_AS"; then
+@@ -21964,14 +22008,14 @@ if test -n "$GNU_CC" -a -n "$GNU_CXX" -a -n "$GNU_AS"; then
          _SAVE_CFLAGS=$CFLAGS
          CFLAGS="$CFLAGS -pipe"
          cat > conftest.$ac_ext <<EOF
 -#line 21968 "configure"
-+#line 21991 "configure"
++#line 22012 "configure"
  #include "confdefs.h"
   #include <stdio.h> 
  int main() {
@@ -2251,19 +6831,19 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:21975: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:21998: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:22019: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    _res_gcc_pipe="yes"
  else
-@@ -22001,16 +22024,16 @@ _SAVE_CFLAGS="$CFLAGS"
+@@ -22001,16 +22045,16 @@ _SAVE_CFLAGS="$CFLAGS"
  CFLAGS="$CFLAGS -fprofile-generate -fprofile-correction"
  
  echo $ac_n "checking whether C compiler supports -fprofile-generate""... $ac_c" 1>&6
 -echo "configure:22005: checking whether C compiler supports -fprofile-generate" >&5
-+echo "configure:22028: checking whether C compiler supports -fprofile-generate" >&5
++echo "configure:22049: checking whether C compiler supports -fprofile-generate" >&5
  cat > conftest.$ac_ext <<EOF
 -#line 22007 "configure"
-+#line 22030 "configure"
++#line 22051 "configure"
  #include "confdefs.h"
  
  int main() {
@@ -2271,19 +6851,19 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:22014: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22037: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:22058: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
     PROFILE_GEN_CFLAGS="-fprofile-generate"
                   result="yes" 
-@@ -22074,16 +22097,16 @@ if test "$_PEDANTIC"; then
+@@ -22074,16 +22118,16 @@ if test "$_PEDANTIC"; then
      _SAVE_CXXFLAGS=$CXXFLAGS
      CXXFLAGS="$CXXFLAGS ${_WARNINGS_CXXFLAGS} ${_COMPILER_PREFIX}-pedantic ${_COMPILER_PREFIX}-Wno-long-long"
      echo $ac_n "checking whether C++ compiler has -pedantic long long bug""... $ac_c" 1>&6
 -echo "configure:22078: checking whether C++ compiler has -pedantic long long bug" >&5
-+echo "configure:22101: checking whether C++ compiler has -pedantic long long bug" >&5
++echo "configure:22122: checking whether C++ compiler has -pedantic long long bug" >&5
      cat > conftest.$ac_ext <<EOF
 -#line 22080 "configure"
-+#line 22103 "configure"
++#line 22124 "configure"
  #include "confdefs.h"
  $configure_static_assert_macros
  int main() {
@@ -2291,58 +6871,58 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:22087: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22110: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:22131: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    result="no"
  else
-@@ -22110,12 +22133,12 @@ fi
+@@ -22110,12 +22154,12 @@ fi
  _SAVE_CXXFLAGS=$CXXFLAGS
  CXXFLAGS="$CXXFLAGS ${_WARNINGS_CXXFLAGS}"
  echo $ac_n "checking for correct overload resolution with const and templates""... $ac_c" 1>&6
 -echo "configure:22114: checking for correct overload resolution with const and templates" >&5
-+echo "configure:22137: checking for correct overload resolution with const and templates" >&5
++echo "configure:22158: checking for correct overload resolution with const and templates" >&5
  if eval "test \"`echo '$''{'ac_nscap_nonconst_opeq_bug'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
    cat > conftest.$ac_ext <<EOF
 -#line 22119 "configure"
-+#line 22142 "configure"
++#line 22163 "configure"
  #include "confdefs.h"
  
                        template <class T>
-@@ -22145,7 +22168,7 @@ int main() {
+@@ -22145,7 +22189,7 @@ int main() {
                      
  ; return 0; }
  EOF
 -if { (eval echo configure:22149: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22172: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:22193: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    ac_nscap_nonconst_opeq_bug="no"
  else
-@@ -22182,18 +22205,18 @@ cross_compiling=$ac_cv_prog_cc_cross
+@@ -22182,18 +22226,18 @@ cross_compiling=$ac_cv_prog_cc_cross
  
  
  echo $ac_n "checking what kind of list files are supported by the linker""... $ac_c" 1>&6
 -echo "configure:22186: checking what kind of list files are supported by the linker" >&5
-+echo "configure:22209: checking what kind of list files are supported by the linker" >&5
++echo "configure:22230: checking what kind of list files are supported by the linker" >&5
  if eval "test \"`echo '$''{'EXPAND_LIBS_LIST_STYLE'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
    echo "int main() {return 0;}" > conftest.${ac_ext}
 -     if { ac_try='${CC-cc} -o conftest.${OBJ_SUFFIX} -c $CFLAGS $CPPFLAGS conftest.${ac_ext} 1>&2'; { (eval echo configure:22191: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest.${OBJ_SUFFIX}; then
-+     if { ac_try='${CC-cc} -o conftest.${OBJ_SUFFIX} -c $CFLAGS $CPPFLAGS conftest.${ac_ext} 1>&2'; { (eval echo configure:22214: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest.${OBJ_SUFFIX}; then
++     if { ac_try='${CC-cc} -o conftest.${OBJ_SUFFIX} -c $CFLAGS $CPPFLAGS conftest.${ac_ext} 1>&2'; { (eval echo configure:22235: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest.${OBJ_SUFFIX}; then
           echo "INPUT(conftest.${OBJ_SUFFIX})" > conftest.list
 -         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.list $LIBS 1>&2'; { (eval echo configure:22193: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
-+         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.list $LIBS 1>&2'; { (eval echo configure:22216: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
++         if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS conftest.list $LIBS 1>&2'; { (eval echo configure:22237: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
               EXPAND_LIBS_LIST_STYLE=linkerscript
           else
               echo "conftest.${OBJ_SUFFIX}" > conftest.list
 -             if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS @conftest.list $LIBS 1>&2'; { (eval echo configure:22197: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
-+             if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS @conftest.list $LIBS 1>&2'; { (eval echo configure:22220: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
++             if { ac_try='${CC-cc} -o conftest${ac_exeext} $LDFLAGS @conftest.list $LIBS 1>&2'; { (eval echo configure:22241: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }; } && test -s conftest${ac_exeext}; then
                   EXPAND_LIBS_LIST_STYLE=list
               else
                   EXPAND_LIBS_LIST_STYLE=none
-@@ -22323,7 +22346,7 @@ XPCOM_LIBS="$LIBXUL_LIBS"
+@@ -22323,7 +22367,7 @@ XPCOM_LIBS="$LIBXUL_LIBS"
  # Standalone module options (Not for building Mozilla)
  
  
@@ -2351,21 +6931,21 @@ index b8e7773..67ba888 100755
  if test -z "${GLIB_CFLAGS}" -o -z "${GLIB_LIBS}" ; then
      if test "$MOZ_ENABLE_GTK2" -o "$USE_ELF_DYNSTR_GC" ; then
          succeeded=no
-@@ -22332,7 +22355,7 @@ if test -z "${GLIB_CFLAGS}" -o -z "${GLIB_LIBS}" ; then
+@@ -22332,7 +22376,7 @@ if test -z "${GLIB_CFLAGS}" -o -z "${GLIB_LIBS}" ; then
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:22336: checking for $ac_word" >&5
-+echo "configure:22359: checking for $ac_word" >&5
++echo "configure:22380: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -22376,19 +22399,19 @@ fi
+@@ -22376,19 +22420,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for glib-2.0 >= 1.3.7 gobject-2.0""... $ac_c" 1>&6
 -echo "configure:22380: checking for glib-2.0 >= 1.3.7 gobject-2.0" >&5
-+echo "configure:22403: checking for glib-2.0 >= 1.3.7 gobject-2.0" >&5
++echo "configure:22424: checking for glib-2.0 >= 1.3.7 gobject-2.0" >&5
  
          if $PKG_CONFIG --exists "glib-2.0 >= 1.3.7 gobject-2.0" ; then
              echo "$ac_t""yes" 1>&6
@@ -2373,82 +6953,82 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking GLIB_CFLAGS""... $ac_c" 1>&6
 -echo "configure:22387: checking GLIB_CFLAGS" >&5
-+echo "configure:22410: checking GLIB_CFLAGS" >&5
++echo "configure:22431: checking GLIB_CFLAGS" >&5
              GLIB_CFLAGS=`$PKG_CONFIG --cflags "glib-2.0 >= 1.3.7 gobject-2.0"`
              echo "$ac_t""$GLIB_CFLAGS" 1>&6
  
              echo $ac_n "checking GLIB_LIBS""... $ac_c" 1>&6
 -echo "configure:22392: checking GLIB_LIBS" >&5
-+echo "configure:22415: checking GLIB_LIBS" >&5
++echo "configure:22436: checking GLIB_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              GLIB_LIBS="`$PKG_CONFIG --libs \"glib-2.0 >= 1.3.7 gobject-2.0\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$GLIB_LIBS" 1>&6
-@@ -22473,7 +22496,7 @@ fi
+@@ -22473,7 +22517,7 @@ fi
    # Extract the first word of "glib-config", so it can be a program name with args.
  set dummy glib-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:22477: checking for $ac_word" >&5
-+echo "configure:22500: checking for $ac_word" >&5
++echo "configure:22521: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_GLIB_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -22508,7 +22531,7 @@ fi
+@@ -22508,7 +22552,7 @@ fi
  
    min_glib_version=${GLIB_VERSION}
    echo $ac_n "checking for GLIB - version >= $min_glib_version""... $ac_c" 1>&6
 -echo "configure:22512: checking for GLIB - version >= $min_glib_version" >&5
-+echo "configure:22535: checking for GLIB - version >= $min_glib_version" >&5
++echo "configure:22556: checking for GLIB - version >= $min_glib_version" >&5
    no_glib=""
    if test "$GLIB_CONFIG" = "no" ; then
      no_glib=yes
-@@ -22531,7 +22554,7 @@ echo "configure:22512: checking for GLIB - version >= $min_glib_version" >&5
+@@ -22531,7 +22575,7 @@ echo "configure:22512: checking for GLIB - version >= $min_glib_version" >&5
    echo $ac_n "cross compiling; assumed OK... $ac_c"
  else
    cat > conftest.$ac_ext <<EOF
 -#line 22535 "configure"
-+#line 22558 "configure"
++#line 22579 "configure"
  #include "confdefs.h"
  
  #include <glib.h>
-@@ -22607,7 +22630,7 @@ main ()
+@@ -22607,7 +22651,7 @@ main ()
  }
  
  EOF
 -if { (eval echo configure:22611: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
-+if { (eval echo configure:22634: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
++if { (eval echo configure:22655: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext} && (./conftest; exit) 2>/dev/null
  then
    :
  else
-@@ -22641,7 +22664,7 @@ fi
+@@ -22641,7 +22685,7 @@ fi
            CFLAGS="$CFLAGS $GLIB_CFLAGS"
            LIBS="$LIBS $GLIB_LIBS"
            cat > conftest.$ac_ext <<EOF
 -#line 22645 "configure"
-+#line 22668 "configure"
++#line 22689 "configure"
  #include "confdefs.h"
  
  #include <glib.h>
-@@ -22651,7 +22674,7 @@ int main() {
+@@ -22651,7 +22695,7 @@ int main() {
   return ((glib_major_version) || (glib_minor_version) || (glib_micro_version)); 
  ; return 0; }
  EOF
 -if { (eval echo configure:22655: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:22678: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:22699: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
     echo "*** The test program compiled, but did not run. This usually means"
            echo "*** that the run-time linker is not finding GLIB or finding the wrong"
-@@ -22739,19 +22762,19 @@ fi
+@@ -22739,19 +22783,19 @@ fi
    do
         ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
    echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
 -echo "configure:22743: checking for $ac_hdr" >&5
-+echo "configure:22766: checking for $ac_hdr" >&5
++echo "configure:22787: checking for $ac_hdr" >&5
    if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
     cat > conftest.$ac_ext <<EOF
 -#line 22748 "configure"
-+#line 22771 "configure"
++#line 22792 "configure"
  #include "confdefs.h"
  #include <$ac_hdr>
  int main() {
@@ -2456,22 +7036,22 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:22755: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22778: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:22799: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    eval "ac_cv_header_$ac_safe=yes"
  else
-@@ -22825,19 +22848,19 @@ EOF
+@@ -22825,19 +22869,19 @@ EOF
  
             ac_safe=`echo "d3d9.h" | sed 'y%./+-%__p_%'`
    echo $ac_n "checking for d3d9.h""... $ac_c" 1>&6
 -echo "configure:22829: checking for d3d9.h" >&5
-+echo "configure:22852: checking for d3d9.h" >&5
++echo "configure:22873: checking for d3d9.h" >&5
    if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
     cat > conftest.$ac_ext <<EOF
 -#line 22834 "configure"
-+#line 22857 "configure"
++#line 22878 "configure"
  #include "confdefs.h"
  #include <d3d9.h>
  int main() {
@@ -2479,22 +7059,22 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:22841: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22864: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:22885: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    eval "ac_cv_header_$ac_safe=yes"
  else
-@@ -22861,19 +22884,19 @@ fi
+@@ -22861,19 +22905,19 @@ fi
                  if test -n "$WIN32_D2D_SURFACE_FEATURE"; then
               ac_safe=`echo "d3d10.h" | sed 'y%./+-%__p_%'`
    echo $ac_n "checking for d3d10.h""... $ac_c" 1>&6
 -echo "configure:22865: checking for d3d10.h" >&5
-+echo "configure:22888: checking for d3d10.h" >&5
++echo "configure:22909: checking for d3d10.h" >&5
    if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
     cat > conftest.$ac_ext <<EOF
 -#line 22870 "configure"
-+#line 22893 "configure"
++#line 22914 "configure"
  #include "confdefs.h"
  #include <d3d10.h>
  int main() {
@@ -2502,25 +7082,25 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:22877: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:22900: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:22921: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    eval "ac_cv_header_$ac_safe=yes"
  else
-@@ -22957,7 +22980,7 @@ EOF
+@@ -22957,7 +23001,7 @@ EOF
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:22961: checking for $ac_word" >&5
-+echo "configure:22984: checking for $ac_word" >&5
++echo "configure:23005: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -23001,19 +23024,19 @@ fi
+@@ -23001,19 +23045,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for pixman-1 >= 0.19.2""... $ac_c" 1>&6
 -echo "configure:23005: checking for pixman-1 >= 0.19.2" >&5
-+echo "configure:23028: checking for pixman-1 >= 0.19.2" >&5
++echo "configure:23049: checking for pixman-1 >= 0.19.2" >&5
  
          if $PKG_CONFIG --exists "pixman-1 >= 0.19.2" ; then
              echo "$ac_t""yes" 1>&6
@@ -2528,31 +7108,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking PIXMAN_CFLAGS""... $ac_c" 1>&6
 -echo "configure:23012: checking PIXMAN_CFLAGS" >&5
-+echo "configure:23035: checking PIXMAN_CFLAGS" >&5
++echo "configure:23056: checking PIXMAN_CFLAGS" >&5
              PIXMAN_CFLAGS=`$PKG_CONFIG --cflags "pixman-1 >= 0.19.2"`
              echo "$ac_t""$PIXMAN_CFLAGS" 1>&6
  
              echo $ac_n "checking PIXMAN_LIBS""... $ac_c" 1>&6
 -echo "configure:23017: checking PIXMAN_LIBS" >&5
-+echo "configure:23040: checking PIXMAN_LIBS" >&5
++echo "configure:23061: checking PIXMAN_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              PIXMAN_LIBS="`$PKG_CONFIG --libs \"pixman-1 >= 0.19.2\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$PIXMAN_LIBS" 1>&6
-@@ -23060,7 +23083,7 @@ else
+@@ -23060,7 +23104,7 @@ else
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:23064: checking for $ac_word" >&5
-+echo "configure:23087: checking for $ac_word" >&5
++echo "configure:23108: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -23104,19 +23127,19 @@ fi
+@@ -23104,19 +23148,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig""... $ac_c" 1>&6
 -echo "configure:23108: checking for cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig" >&5
-+echo "configure:23131: checking for cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig" >&5
++echo "configure:23152: checking for cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig" >&5
  
          if $PKG_CONFIG --exists "cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig" ; then
              echo "$ac_t""yes" 1>&6
@@ -2560,31 +7140,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking CAIRO_CFLAGS""... $ac_c" 1>&6
 -echo "configure:23115: checking CAIRO_CFLAGS" >&5
-+echo "configure:23138: checking CAIRO_CFLAGS" >&5
++echo "configure:23159: checking CAIRO_CFLAGS" >&5
              CAIRO_CFLAGS=`$PKG_CONFIG --cflags "cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig"`
              echo "$ac_t""$CAIRO_CFLAGS" 1>&6
  
              echo $ac_n "checking CAIRO_LIBS""... $ac_c" 1>&6
 -echo "configure:23120: checking CAIRO_LIBS" >&5
-+echo "configure:23143: checking CAIRO_LIBS" >&5
++echo "configure:23164: checking CAIRO_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              CAIRO_LIBS="`$PKG_CONFIG --libs \"cairo >= $CAIRO_VERSION pixman-1 freetype2 fontconfig\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$CAIRO_LIBS" 1>&6
-@@ -23153,7 +23176,7 @@ echo "configure:23120: checking CAIRO_LIBS" >&5
+@@ -23153,7 +23197,7 @@ echo "configure:23120: checking CAIRO_LIBS" >&5
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:23157: checking for $ac_word" >&5
-+echo "configure:23180: checking for $ac_word" >&5
++echo "configure:23201: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -23197,19 +23220,19 @@ fi
+@@ -23197,19 +23241,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for cairo-tee >= $CAIRO_VERSION""... $ac_c" 1>&6
 -echo "configure:23201: checking for cairo-tee >= $CAIRO_VERSION" >&5
-+echo "configure:23224: checking for cairo-tee >= $CAIRO_VERSION" >&5
++echo "configure:23245: checking for cairo-tee >= $CAIRO_VERSION" >&5
  
          if $PKG_CONFIG --exists "cairo-tee >= $CAIRO_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -2592,31 +7172,31 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking CAIRO_TEE_CFLAGS""... $ac_c" 1>&6
 -echo "configure:23208: checking CAIRO_TEE_CFLAGS" >&5
-+echo "configure:23231: checking CAIRO_TEE_CFLAGS" >&5
++echo "configure:23252: checking CAIRO_TEE_CFLAGS" >&5
              CAIRO_TEE_CFLAGS=`$PKG_CONFIG --cflags "cairo-tee >= $CAIRO_VERSION"`
              echo "$ac_t""$CAIRO_TEE_CFLAGS" 1>&6
  
              echo $ac_n "checking CAIRO_TEE_LIBS""... $ac_c" 1>&6
 -echo "configure:23213: checking CAIRO_TEE_LIBS" >&5
-+echo "configure:23236: checking CAIRO_TEE_LIBS" >&5
++echo "configure:23257: checking CAIRO_TEE_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              CAIRO_TEE_LIBS="`$PKG_CONFIG --libs \"cairo-tee >= $CAIRO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$CAIRO_TEE_LIBS" 1>&6
-@@ -23245,7 +23268,7 @@ echo "configure:23213: checking CAIRO_TEE_LIBS" >&5
+@@ -23245,7 +23289,7 @@ echo "configure:23213: checking CAIRO_TEE_LIBS" >&5
      # Extract the first word of "pkg-config", so it can be a program name with args.
  set dummy pkg-config; ac_word=$2
  echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
 -echo "configure:23249: checking for $ac_word" >&5
-+echo "configure:23272: checking for $ac_word" >&5
++echo "configure:23293: checking for $ac_word" >&5
  if eval "test \"`echo '$''{'ac_cv_path_PKG_CONFIG'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
-@@ -23289,19 +23312,19 @@ fi
+@@ -23289,19 +23333,19 @@ fi
       PKG_CONFIG_MIN_VERSION=0.9.0
       if $PKG_CONFIG --atleast-pkgconfig-version $PKG_CONFIG_MIN_VERSION; then
          echo $ac_n "checking for cairo-xlib-xrender >= $CAIRO_VERSION""... $ac_c" 1>&6
 -echo "configure:23293: checking for cairo-xlib-xrender >= $CAIRO_VERSION" >&5
-+echo "configure:23316: checking for cairo-xlib-xrender >= $CAIRO_VERSION" >&5
++echo "configure:23337: checking for cairo-xlib-xrender >= $CAIRO_VERSION" >&5
  
          if $PKG_CONFIG --exists "cairo-xlib-xrender >= $CAIRO_VERSION" ; then
              echo "$ac_t""yes" 1>&6
@@ -2624,28 +7204,28 @@ index b8e7773..67ba888 100755
  
              echo $ac_n "checking CAIRO_XRENDER_CFLAGS""... $ac_c" 1>&6
 -echo "configure:23300: checking CAIRO_XRENDER_CFLAGS" >&5
-+echo "configure:23323: checking CAIRO_XRENDER_CFLAGS" >&5
++echo "configure:23344: checking CAIRO_XRENDER_CFLAGS" >&5
              CAIRO_XRENDER_CFLAGS=`$PKG_CONFIG --cflags "cairo-xlib-xrender >= $CAIRO_VERSION"`
              echo "$ac_t""$CAIRO_XRENDER_CFLAGS" 1>&6
  
              echo $ac_n "checking CAIRO_XRENDER_LIBS""... $ac_c" 1>&6
 -echo "configure:23305: checking CAIRO_XRENDER_LIBS" >&5
-+echo "configure:23328: checking CAIRO_XRENDER_LIBS" >&5
++echo "configure:23349: checking CAIRO_XRENDER_LIBS" >&5
              ## Remove evil flags like -Wl,--export-dynamic
              CAIRO_XRENDER_LIBS="`$PKG_CONFIG --libs \"cairo-xlib-xrender >= $CAIRO_VERSION\" |sed s/-Wl,--export-dynamic//g`"
              echo "$ac_t""$CAIRO_XRENDER_LIBS" 1>&6
-@@ -23454,19 +23477,19 @@ if test -z "$SKIP_LIBRARY_CHECKS" -a "$NECKO_WIFI" -a "$OS_ARCH" = "Linux"
+@@ -23454,19 +23498,19 @@ if test -z "$SKIP_LIBRARY_CHECKS" -a "$NECKO_WIFI" -a "$OS_ARCH" = "Linux"
  then
       ac_safe=`echo "iwlib.h" | sed 'y%./+-%__p_%'`
    echo $ac_n "checking for iwlib.h""... $ac_c" 1>&6
 -echo "configure:23458: checking for iwlib.h" >&5
-+echo "configure:23481: checking for iwlib.h" >&5
++echo "configure:23502: checking for iwlib.h" >&5
    if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
     cat > conftest.$ac_ext <<EOF
 -#line 23463 "configure"
-+#line 23486 "configure"
++#line 23507 "configure"
  #include "confdefs.h"
  #include <iwlib.h>
  int main() {
@@ -2653,32 +7233,32 @@ index b8e7773..67ba888 100755
  ; return 0; }
  EOF
 -if { (eval echo configure:23470: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:23493: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:23514: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    eval "ac_cv_header_$ac_safe=yes"
  else
-@@ -23909,9 +23932,9 @@ EOF
+@@ -23924,9 +23968,9 @@ EOF
  
  
  echo $ac_n "checking for posix_fallocate""... $ac_c" 1>&6
--echo "configure:23913: checking for posix_fallocate" >&5
-+echo "configure:23936: checking for posix_fallocate" >&5
+-echo "configure:23928: checking for posix_fallocate" >&5
++echo "configure:23972: checking for posix_fallocate" >&5
  cat > conftest.$ac_ext <<EOF
--#line 23915 "configure"
-+#line 23938 "configure"
+-#line 23930 "configure"
++#line 23974 "configure"
  #include "confdefs.h"
  #define _XOPEN_SOURCE 600
    #include <fcntl.h>
-@@ -23919,7 +23942,7 @@ int main() {
+@@ -23934,7 +23978,7 @@ int main() {
  posix_fallocate(0, 0, 0);
  ; return 0; }
  EOF
--if { (eval echo configure:23923: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-+if { (eval echo configure:23946: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+-if { (eval echo configure:23938: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
++if { (eval echo configure:23982: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    rm -rf conftest*
    ac_cv___posix_fallocate=true
  else
-@@ -23940,12 +23963,12 @@ else
+@@ -23955,12 +23999,12 @@ else
    echo "$ac_t""no" 1>&6
  fi
  
@@ -2688,44 +7268,44 @@ index b8e7773..67ba888 100755
                  _SAVE_CFLAGS=$CFLAGS
      CFLAGS="$CFLAGS $XCFLAGS"
      cat > conftest.$ac_ext <<EOF
--#line 23949 "configure"
-+#line 23972 "configure"
+-#line 23964 "configure"
++#line 24008 "configure"
  #include "confdefs.h"
  
          #include <stdio.h>
-@@ -23964,7 +23987,7 @@ int main() {
+@@ -23979,7 +24023,7 @@ int main() {
      
  ; return 0; }
  EOF
--if { (eval echo configure:23968: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:23991: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+-if { (eval echo configure:23983: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:24027: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    :
  else
    echo "configure: failed program was:" >&5
-@@ -23984,19 +24007,19 @@ fi # MOZ_X11
+@@ -23999,19 +24043,19 @@ fi # MOZ_X11
  if test -n "$MOZ_WEBGL_GLX"; then
         ac_safe=`echo "GL/glx.h" | sed 'y%./+-%__p_%'`
    echo $ac_n "checking for GL/glx.h""... $ac_c" 1>&6
--echo "configure:23988: checking for GL/glx.h" >&5
-+echo "configure:24011: checking for GL/glx.h" >&5
+-echo "configure:24003: checking for GL/glx.h" >&5
++echo "configure:24047: checking for GL/glx.h" >&5
    if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
     cat > conftest.$ac_ext <<EOF
--#line 23993 "configure"
-+#line 24016 "configure"
+-#line 24008 "configure"
++#line 24052 "configure"
  #include "confdefs.h"
  #include <GL/glx.h>
  int main() {
  
  ; return 0; }
  EOF
--if { (eval echo configure:24000: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
-+if { (eval echo configure:24023: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
+-if { (eval echo configure:24015: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
++if { (eval echo configure:24059: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
    rm -rf conftest*
    eval "ac_cv_header_$ac_safe=yes"
  else
-@@ -24022,7 +24045,7 @@ fi
+@@ -24037,7 +24081,7 @@ fi
  fi # MOZ_WEBGL_GLX
  fi # COMPILE_ENVIRONMENT
  
@@ -2734,24 +7314,32 @@ index b8e7773..67ba888 100755
      if test "$COMPILE_ENVIRONMENT"; then
      	_SAVE_CPPFLAGS="$CPPFLAGS"
      	CPPFLAGS="$CPPFLAGS $FT2_CFLAGS $XCFLAGS"
-@@ -24030,17 +24053,17 @@ if test "$USE_FC_FREETYPE"; then
+@@ -24045,17 +24089,17 @@ if test "$USE_FC_FREETYPE"; then
  do
  ac_safe=`echo "$ac_hdr" | sed 'y%./+-%__p_%'`
  echo $ac_n "checking for $ac_hdr""... $ac_c" 1>&6
--echo "configure:24034: checking for $ac_hdr" >&5
-+echo "configure:24057: checking for $ac_hdr" >&5
+-echo "configure:24049: checking for $ac_hdr" >&5
++echo "configure:24093: checking for $ac_hdr" >&5
  if eval "test \"`echo '$''{'ac_cv_header_$ac_safe'+set}'`\" = set"; then
    echo $ac_n "(cached) $ac_c" 1>&6
  else
    cat > conftest.$ac_ext <<EOF
--#line 24039 "configure"
-+#line 24062 "configure"
+-#line 24054 "configure"
++#line 24098 "configure"
  #include "confdefs.h"
  #include <$ac_hdr>
  EOF
  ac_try="$ac_cpp conftest.$ac_ext >/dev/null 2>conftest.out"
--{ (eval echo configure:24044: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
-+{ (eval echo configure:24067: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
+-{ (eval echo configure:24059: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
++{ (eval echo configure:24103: \"$ac_try\") 1>&5; (eval $ac_try) 2>&5; }
  ac_err=`grep -v '^ *+' conftest.out | grep -v "^conftest.${ac_ext}\$"`
  if test -z "$ac_err"; then
    rm -rf conftest*
+@@ -24509,6 +24553,7 @@ s%@INSTALL_SCRIPT@%$INSTALL_SCRIPT%g
+ s%@INSTALL_DATA@%$INSTALL_DATA%g
+ s%@LN_S@%$LN_S%g
+ s%@PYTHON@%$PYTHON%g
++s%@MOZ_SYSTEM_PLY@%$MOZ_SYSTEM_PLY%g
+ s%@NSINSTALL_BIN@%$NSINSTALL_BIN%g
+ s%@DOXYGEN@%$DOXYGEN%g
+ s%@AUTOCONF@%$AUTOCONF%g
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch
index 26e2ee1..84a45df 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch
@@ -4,7 +4,7 @@ Subject: Add a 2 minutes timeout on xpcshell tests
 
 ---
  testing/xpcshell/runxpcshelltests.py |   18 ++++++++++++++++--
- 1 files changed, 16 insertions(+), 2 deletions(-)
+ 1 file changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/testing/xpcshell/runxpcshelltests.py b/testing/xpcshell/runxpcshelltests.py
 index ea15466..e1babbb 100644
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Add-another-preferences-directory-for-applications-p.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Add-another-preferences-directory-for-applications-p.patch
index 29ac2ba..799b0e5 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Add-another-preferences-directory-for-applications-p.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Add-another-preferences-directory-for-applications-p.patch
@@ -10,7 +10,7 @@ This has the side effect to make these preferences there work again, and
 to disable the "set as default browser" dialog.
 ---
  toolkit/xre/nsXREDirProvider.cpp |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
+ 1 file changed, 2 insertions(+)
 
 diff --git a/toolkit/xre/nsXREDirProvider.cpp b/toolkit/xre/nsXREDirProvider.cpp
 index 45bdfb1..da71bdd 100644
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Add-soname-to-appropriate-libraries.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Add-soname-to-appropriate-libraries.patch
index ef36132..430585e 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Add-soname-to-appropriate-libraries.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Add-soname-to-appropriate-libraries.patch
@@ -80,7 +80,7 @@ index d1b969b..c64b4d5 100644
  $(SHARED_LIBRARY): $(OBJS) $(LOBJS) $(DEF_FILE) $(RESFILE) $(SHARED_LIBRARY_LIBS_DEPS) $(LIBRARY) $(EXTRA_DEPS) $(DSO_LDOPTS_DEPS) $(GLOBAL_DEPS)
  ifndef INCREMENTAL_LINKER
 diff --git a/js/src/Makefile.in b/js/src/Makefile.in
-index 49f0bdc..7a8f9c1 100644
+index fc48cbd..1200ae6 100644
 --- a/js/src/Makefile.in
 +++ b/js/src/Makefile.in
 @@ -74,6 +74,7 @@ MODULE		    = js
@@ -91,7 +91,7 @@ index 49f0bdc..7a8f9c1 100644
  
  LIBS		= $(NSPR_LIBS) 
  
-@@ -927,6 +928,9 @@ ifneq (,$(LIBRARY))
+@@ -922,6 +923,9 @@ ifneq (,$(LIBRARY))
  endif
  ifneq (,$(SHARED_LIBRARY))
  	$(SYSINSTALL) $(SHARED_LIBRARY) $(DESTDIR)$(libdir)
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch
index d00807f..09cf8bf 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch
@@ -7,7 +7,7 @@ Force libxpcom to be linked to xulrunner-bin and xpcshell so that it is
 loaded in most cases.
 ---
  xulrunner/app/Makefile.in |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
+ 1 file changed, 2 insertions(+)
 
 diff --git a/xulrunner/app/Makefile.in b/xulrunner/app/Makefile.in
 index d6efcbb..eae02da 100644
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch
index b72f6b2..0084e99 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch
@@ -8,8 +8,8 @@ and fixed (probably in xulrunner).
 
 Closes: #552426, #553453
 ---
- .../components/sessionstore/src/nsSessionStore.js  |    4 +---
- 1 files changed, 1 insertions(+), 3 deletions(-)
+ browser/components/sessionstore/src/nsSessionStore.js |    4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/browser/components/sessionstore/src/nsSessionStore.js b/browser/components/sessionstore/src/nsSessionStore.js
 index a62821b..0878209 100644
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch
new file mode 100644
index 0000000..b20704a
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch
@@ -0,0 +1,117 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Sat, 21 Apr 2012 12:11:40 +0200
+Subject: Bug 508942 - Use Preprocessor.py filters in #defines and #includes
+
+Original patch by Markus Stange.
+---
+ config/Preprocessor.py            |   11 ++++++++---
+ config/tests/unit-Preprocessor.py |    9 +++++++++
+ js/src/config/Preprocessor.py     |   11 ++++++++---
+ 3 files changed, 25 insertions(+), 6 deletions(-)
+
+diff --git a/config/Preprocessor.py b/config/Preprocessor.py
+index 752e83f..f238111 100644
+--- a/config/Preprocessor.py
++++ b/config/Preprocessor.py
+@@ -134,6 +134,11 @@ class Preprocessor:
+     rv.out = self.out
+     return rv
+   
++  def applyFilters(self, aLine):
++    for f in self.filters:
++      aLine = f[1](aLine)
++    return aLine
++  
+   def write(self, aLine):
+     """
+     Internal method for handling output.
+@@ -146,8 +151,7 @@ class Preprocessor:
+                                                             'file': self.context['FILE'],
+                                                             'le': self.LE})
+         self.writtenLines = ln
+-    for f in self.filters:
+-      aLine = f[1](aLine)
++    aLine = self.applyFilters(aLine)
+     # ensure our line ending. Only need to handle \n, as we're reading
+     # with universal line ending support, at least for files.
+     aLine = re.sub('\n', self.LE, aLine)
+@@ -242,7 +246,7 @@ class Preprocessor:
+       raise Preprocessor.Error(self, 'SYNTAX_DEF', args)
+     val = 1
+     if m.group('value'):
+-      val = m.group('value')
++      val = self.applyFilters(m.group('value'))
+       try:
+         val = int(val)
+       except:
+@@ -423,6 +427,7 @@ class Preprocessor:
+     if isName:
+       try:
+         args = str(args)
++        args = self.applyFilters(args)
+         if not os.path.isabs(args):
+           args = os.path.join(self.context['DIRECTORY'], args)
+         args = open(args, 'rU')
+diff --git a/config/tests/unit-Preprocessor.py b/config/tests/unit-Preprocessor.py
+index d2f95f0..0ae2f88 100644
+--- a/config/tests/unit-Preprocessor.py
++++ b/config/tests/unit-Preprocessor.py
+@@ -404,6 +404,15 @@ FAIL
+     self.pp.do_include(f)
+     self.assertEqual(self.pp.out.getvalue(), "first\rsecond\r")
+ 
++  def test_filterDefine(self):
++    f = NamedIO('filterDefine.in', '''#filter substitution
++#define VAR AS
++#define VAR2 P@VAR@
++@VAR2@S
++''')
++    self.pp.do_include(f)
++    self.assertEqual(self.pp.out.getvalue(), "PASS\n")
++
+   def test_number_value_equals(self):
+     f = NamedIO("number_value_equals.in", """#define FOO 1000
+ #if FOO == 1000
+diff --git a/js/src/config/Preprocessor.py b/js/src/config/Preprocessor.py
+index 752e83f..f238111 100644
+--- a/js/src/config/Preprocessor.py
++++ b/js/src/config/Preprocessor.py
+@@ -134,6 +134,11 @@ class Preprocessor:
+     rv.out = self.out
+     return rv
+   
++  def applyFilters(self, aLine):
++    for f in self.filters:
++      aLine = f[1](aLine)
++    return aLine
++  
+   def write(self, aLine):
+     """
+     Internal method for handling output.
+@@ -146,8 +151,7 @@ class Preprocessor:
+                                                             'file': self.context['FILE'],
+                                                             'le': self.LE})
+         self.writtenLines = ln
+-    for f in self.filters:
+-      aLine = f[1](aLine)
++    aLine = self.applyFilters(aLine)
+     # ensure our line ending. Only need to handle \n, as we're reading
+     # with universal line ending support, at least for files.
+     aLine = re.sub('\n', self.LE, aLine)
+@@ -242,7 +246,7 @@ class Preprocessor:
+       raise Preprocessor.Error(self, 'SYNTAX_DEF', args)
+     val = 1
+     if m.group('value'):
+-      val = m.group('value')
++      val = self.applyFilters(m.group('value'))
+       try:
+         val = int(val)
+       except:
+@@ -423,6 +427,7 @@ class Preprocessor:
+     if isName:
+       try:
+         args = str(args)
++        args = self.applyFilters(args)
+         if not os.path.isabs(args):
+           args = os.path.join(self.context['DIRECTORY'], args)
+         args = open(args, 'rU')
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Check-less-things-during-configure-when-using-libxul.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Check-less-things-during-configure-when-using-libxul.patch
index ade8560..5952ac6 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Check-less-things-during-configure-when-using-libxul.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Check-less-things-during-configure-when-using-libxul.patch
@@ -6,10 +6,10 @@ We don't need to check e.g. cairo or pango when using libxul-sdk, since
 we won't be building most of the toolkit.
 ---
  configure.in |   30 +++++++++++++++++++++++++-----
- 1 files changed, 25 insertions(+), 5 deletions(-)
+ 1 file changed, 25 insertions(+), 5 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 6c227d9..88557f7 100644
+index 6b155e0..18872c4 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -4190,6 +4190,7 @@ AC_SUBST(LIBXUL_SDK)
@@ -129,7 +129,7 @@ index 6c227d9..88557f7 100644
  if test -z "${GLIB_CFLAGS}" -o -z "${GLIB_LIBS}" ; then
      if test "$MOZ_ENABLE_GTK2" -o "$USE_ELF_DYNSTR_GC" ; then
          PKG_CHECK_MODULES(GLIB, glib-2.0 >= 1.3.7 gobject-2.0)
-@@ -8595,7 +8615,7 @@ else
+@@ -8610,7 +8630,7 @@ else
  fi
  
  dnl Check for missing components
@@ -138,7 +138,7 @@ index 6c227d9..88557f7 100644
  if test "$MOZ_X11"; then
      dnl ====================================================
      dnl = Check if X headers exist
-@@ -8634,7 +8654,7 @@ if test -n "$MOZ_WEBGL_GLX"; then
+@@ -8649,7 +8669,7 @@ if test -n "$MOZ_WEBGL_GLX"; then
  fi # MOZ_WEBGL_GLX
  fi # COMPILE_ENVIRONMENT
  
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Do-build-time-detection-of-2-bytes-wchar_t-and-char1.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Do-build-time-detection-of-2-bytes-wchar_t-and-char1.patch
index f7d5523..99408b4 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Do-build-time-detection-of-2-bytes-wchar_t-and-char1.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Do-build-time-detection-of-2-bytes-wchar_t-and-char1.patch
@@ -8,7 +8,7 @@ Closes: #577677
  xpcom/base/nscore.h                   |   22 ++++++++++++++++++++++
  xpcom/glue/nsStringAPI.h              |    1 +
  xpcom/string/public/nsLiteralString.h |    1 +
- 3 files changed, 24 insertions(+), 0 deletions(-)
+ 3 files changed, 24 insertions(+)
 
 diff --git a/xpcom/base/nscore.h b/xpcom/base/nscore.h
 index 9cde77d..40d3aaa 100644
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-build-example-component.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-build-example-component.patch
index 0bb720b..daadb5f 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-build-example-component.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-build-example-component.patch
@@ -4,7 +4,7 @@ Subject: Don't build example component
 
 ---
  xulrunner/Makefile.in |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
+ 1 file changed, 1 deletion(-)
 
 diff --git a/xulrunner/Makefile.in b/xulrunner/Makefile.in
 index 0af55ea..176ace0 100644
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-tha.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-tha.patch
index 0d32f46..dd5661f 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-tha.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-tha.patch
@@ -6,7 +6,7 @@ Subject: Don't error-out when run-time libsqlite is older than build-time
 In Debian, we have shlibs to handle this.
 ---
  storage/src/mozStorageService.cpp |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
+ 1 file changed, 2 insertions(+)
 
 diff --git a/storage/src/mozStorageService.cpp b/storage/src/mozStorageService.cpp
 index 7c0a7a0..0121765 100644
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-install-system-profile.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-install-system-profile.patch
index 73d426e..5be5f5a 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-install-system-profile.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-install-system-profile.patch
@@ -4,7 +4,7 @@ Subject: Don't install system profile
 
 ---
  xulrunner/app/Makefile.in |    2 --
- 1 files changed, 0 insertions(+), 2 deletions(-)
+ 1 file changed, 2 deletions(-)
 
 diff --git a/xulrunner/app/Makefile.in b/xulrunner/app/Makefile.in
 index eae02da..2d5b8f4 100644
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch
index b495194..2b13be9 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch
@@ -5,13 +5,13 @@ Subject: Don't register plugins if the MOZILLA_DISABLE_PLUGINS environment
 
 ---
  dom/plugins/base/nsPluginHost.cpp |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
+ 1 file changed, 4 insertions(+)
 
 diff --git a/dom/plugins/base/nsPluginHost.cpp b/dom/plugins/base/nsPluginHost.cpp
-index 729c9ef..31a2b9d 100644
+index 992bcd4..18081a2 100644
 --- a/dom/plugins/base/nsPluginHost.cpp
 +++ b/dom/plugins/base/nsPluginHost.cpp
-@@ -404,6 +404,10 @@ nsPluginHost::nsPluginHost()
+@@ -407,6 +407,10 @@ nsPluginHost::nsPluginHost()
      }
    }
  
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Handle-transition-to-etc-appname-searchplugins-more-.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Handle-transition-to-etc-appname-searchplugins-more-.patch
new file mode 100644
index 0000000..7259c97
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Handle-transition-to-etc-appname-searchplugins-more-.patch
@@ -0,0 +1,73 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Sun, 15 Apr 2012 11:38:32 +0200
+Subject: Handle transition to /etc/<appname>/searchplugins more gracefully
+
+Closes: #666675.
+---
+ toolkit/components/search/nsSearchService.js |   32 ++++++++++++++++++++++++--
+ 1 file changed, 30 insertions(+), 2 deletions(-)
+
+diff --git a/toolkit/components/search/nsSearchService.js b/toolkit/components/search/nsSearchService.js
+index 2807835..8fa31ca 100644
+--- a/toolkit/components/search/nsSearchService.js
++++ b/toolkit/components/search/nsSearchService.js
+@@ -710,6 +710,7 @@ function getMozParamPref(prefName)
+  *
+  * @see nsIBrowserSearchService.idl
+  */
++let gForceCacheInvalidation = false;
+ let gEnginesLoaded = false;
+ function notifyAction(aEngine, aVerb) {
+   if (gEnginesLoaded) {
+@@ -2012,6 +2013,20 @@ Engine.prototype = {
+    **/
+   _initWithJSON: function SRCH_ENG__initWithJSON(aJson) {
+     this.__id = aJson._id;
++    try {
++      let file = Cc["@mozilla.org/file/local;1"].createInstance(Ci.nsILocalFile);
++      file.initWithPath(this.__id);
++      let loadDirs = [];
++      let locations = getDir(NS_APP_SEARCH_DIR_LIST, Ci.nsISimpleEnumerator);
++      while (locations.hasMoreElements()) {
++        let dir = locations.getNext().QueryInterface(Ci.nsIFile);
++        loadDirs.push(dir);
++      }
++      if (loadDirs.some(function (element) element.equals(file.parent))) {
++        this.__id = "[app]/" + file.leafName;
++        gForceCacheInvalidation = true;
++      }
++    } catch (e) { }
+     this._name = aJson._name;
+     this._description = aJson.description;
+     if (aJson._hasPreferredIcon == undefined)
+@@ -2306,8 +2321,19 @@ Engine.prototype = {
+         this.__installLocation = SEARCH_APP_DIR;
+       else if (this._file.parent.equals(getDir(NS_APP_USER_SEARCH_DIR)))
+         this.__installLocation = SEARCH_PROFILE_DIR;
+-      else
+-        this.__installLocation = SEARCH_IN_EXTENSION;
++      else {
++        let loadDirs = [];
++        let locations = getDir(NS_APP_SEARCH_DIR_LIST, Ci.nsISimpleEnumerator);
++        while (locations.hasMoreElements()) {
++          let dir = locations.getNext().QueryInterface(Ci.nsIFile);
++          loadDirs.push(dir);
++        }
++        let parent = this._file.parent;
++        if (loadDirs.some(function (element) !element.equals(parent)))
++          this.__installLocation = SEARCH_APP_DIR;
++        else
++          this.__installLocation = SEARCH_IN_EXTENSION;
++      }
+     }
+ 
+     return this.__installLocation;
+@@ -2471,6 +2497,8 @@ function SearchService() {
+   }
+   gEnginesLoaded = true;
+   this._addObservers();
++  if (gForceCacheInvalidation)
++    this._batchCacheInvalidation();
+ }
+ SearchService.prototype = {
+   classID: Components.ID("{7319788a-fe93-4db3-9f39-818cf08f4256}"),
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Ignore-system-libjpeg-libpng-and-zlib-version-checki.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Ignore-system-libjpeg-libpng-and-zlib-version-checki.patch
index 565683b..76368cb 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Ignore-system-libjpeg-libpng-and-zlib-version-checki.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Ignore-system-libjpeg-libpng-and-zlib-version-checki.patch
@@ -7,10 +7,10 @@ internal version, which makes system library not used even though
 --with-system-* argument is given to configure.
 ---
  configure.in |    6 +++---
- 1 files changed, 3 insertions(+), 3 deletions(-)
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 88557f7..554f469 100644
+index 18872c4..5c20d46 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -4357,7 +4357,7 @@ else
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Install-js-shell-when-running-make-install-from-js-s.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Install-js-shell-when-running-make-install-from-js-s.patch
index d448617..92052f2 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Install-js-shell-when-running-make-install-from-js-s.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Install-js-shell-when-running-make-install-from-js-s.patch
@@ -5,13 +5,13 @@ Subject: Install js shell when running make install from js/src
 ---
  js/src/Makefile.in       |    1 +
  js/src/shell/Makefile.in |    3 +++
- 2 files changed, 4 insertions(+), 0 deletions(-)
+ 2 files changed, 4 insertions(+)
 
 diff --git a/js/src/Makefile.in b/js/src/Makefile.in
-index a5e33d3..f26694b 100644
+index 0f83fd6..d61492d 100644
 --- a/js/src/Makefile.in
 +++ b/js/src/Makefile.in
-@@ -945,6 +945,7 @@ endif
+@@ -940,6 +940,7 @@ endif
  ifneq (,$(IMPORT_LIBRARY))
  	$(SYSINSTALL) $(IMPORT_LIBRARY) $(DESTDIR)$(libdir)
  endif
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Install-missing-nanojit-and-.tbl-headers-from-js-src.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Install-missing-nanojit-and-.tbl-headers-from-js-src.patch
index cd2cb0d..6dc7737 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Install-missing-nanojit-and-.tbl-headers-from-js-src.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Install-missing-nanojit-and-.tbl-headers-from-js-src.patch
@@ -5,10 +5,10 @@ Subject: Install missing nanojit and .tbl headers from js/src
 https://bugzilla.mozilla.org/show_bug.cgi?id=542789
 ---
  js/src/Makefile.in |   44 +++++++++++++++++++++++++++-----------------
- 1 files changed, 27 insertions(+), 17 deletions(-)
+ 1 file changed, 27 insertions(+), 17 deletions(-)
 
 diff --git a/js/src/Makefile.in b/js/src/Makefile.in
-index 7a8f9c1..a5e33d3 100644
+index 1200ae6..0f83fd6 100644
 --- a/js/src/Makefile.in
 +++ b/js/src/Makefile.in
 @@ -230,6 +230,7 @@ INSTALLED_HEADERS = \
@@ -56,7 +56,7 @@ index 7a8f9c1..a5e33d3 100644
  		VMPI.h		\
  		Writer.h	\
  		$(NULL)
-@@ -550,7 +551,11 @@ else
+@@ -545,7 +546,11 @@ else
  CPPSRCS += pm_stub.cpp
  endif
  
@@ -69,7 +69,7 @@ index 7a8f9c1..a5e33d3 100644
  
  DASH_R		= -r
  
-@@ -916,7 +921,12 @@ js-config: js-config.in Makefile $(DEPTH)/config/autoconf.mk $(topsrcdir)/config
+@@ -911,7 +916,12 @@ js-config: js-config.in Makefile $(DEPTH)/config/autoconf.mk $(topsrcdir)/config
  SCRIPTS = js-config
  SDK_BINARY = js-config
  
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Load-distribution-search-plugins-from-etc-appname-se.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Load-distribution-search-plugins-from-etc-appname-se.patch
new file mode 100644
index 0000000..940eac7
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Load-distribution-search-plugins-from-etc-appname-se.patch
@@ -0,0 +1,50 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Fri, 30 Mar 2012 15:44:54 +0200
+Subject: Load distribution search plugins from /etc/<appname>/searchplugins
+
+---
+ .../components/dirprovider/DirectoryProvider.cpp   |   22 ++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/browser/components/dirprovider/DirectoryProvider.cpp b/browser/components/dirprovider/DirectoryProvider.cpp
+index 1373adc..cde4587 100644
+--- a/browser/components/dirprovider/DirectoryProvider.cpp
++++ b/browser/components/dirprovider/DirectoryProvider.cpp
+@@ -38,7 +38,8 @@
+ #include "nsIDirectoryService.h"
+ #include "DirectoryProvider.h"
+ 
+-#include "nsIFile.h"
++#include "nsIXULAppInfo.h"
++#include "nsILocalFile.h"
+ #include "nsISimpleEnumerator.h"
+ #include "nsIPrefService.h"
+ #include "nsIPrefBranch.h"
+@@ -166,13 +167,22 @@ AppendFileKey(const char *key, nsIProperties* aDirSvc,
+ static void
+ AppendDistroSearchDirs(nsIProperties* aDirSvc, nsCOMArray<nsIFile> &array)
+ {
+-  nsCOMPtr<nsIFile> searchPlugins;
+-  nsresult rv = aDirSvc->Get(NS_XPCOM_CURRENT_PROCESS_DIR,
+-                             NS_GET_IID(nsIFile),
+-                             getter_AddRefs(searchPlugins));
++  nsCOMPtr<nsILocalFile> searchPlugins;
++  nsresult rv = NS_NewLocalFile(NS_LITERAL_STRING("/etc"), false,
++                                getter_AddRefs(searchPlugins));
+   if (NS_FAILED(rv))
+     return;
+-  searchPlugins->AppendNative(NS_LITERAL_CSTRING("distribution"));
++  nsCOMPtr<nsIXULAppInfo> appInfo = do_GetService("@mozilla.org/xre/app-info;1");
++  if (!appInfo)
++    return;
++
++  nsCAutoString name;
++  rv = appInfo->GetName(name);
++  if (NS_FAILED(rv))
++    return;
++  ToLowerCase(name);
++
++  searchPlugins->AppendNative(name);
+   searchPlugins->AppendNative(NS_LITERAL_CSTRING("searchplugins"));
+ 
+   bool exists;
diff --git a/recipes-mozilla/firefox/firefox/debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch b/recipes-mozilla/firefox/firefox/debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch
index bb13047..d35c478 100644
--- a/recipes-mozilla/firefox/firefox/debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch
+++ b/recipes-mozilla/firefox/firefox/debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch
@@ -4,21 +4,21 @@ Subject: Use a variable for xulrunner base version in various places
 
 ---
  config/autoconf.mk.in |    9 +++++----
- 1 files changed, 5 insertions(+), 4 deletions(-)
+ 1 file changed, 5 insertions(+), 4 deletions(-)
 
 diff --git a/config/autoconf.mk.in b/config/autoconf.mk.in
-index a168406..8592a08 100644
+index fccb1a9..ca251cb 100644
 --- a/config/autoconf.mk.in
 +++ b/config/autoconf.mk.in
-@@ -54,6 +54,7 @@ MOZ_APP_VENDOR = @MOZ_APP_VENDOR@
- MOZ_APP_PROFILE = @MOZ_APP_PROFILE@
+@@ -55,6 +55,7 @@ MOZ_APP_PROFILE = @MOZ_APP_PROFILE@
  MOZ_APP_UA_NAME = @MOZ_APP_UA_NAME@
  MOZ_APP_VERSION = @MOZ_APP_VERSION@
+ MOZ_APP_MAXVERSION = @MOZ_APP_MAXVERSION@
 +MOZ_APP_BASE_VERSION = $(firstword $(subst ., ,$(MOZ_APP_VERSION))).$(word 2,$(subst ., ,$(MOZ_APP_VERSION)))
  MOZ_UA_BUILDID = @MOZ_UA_BUILDID@
  MOZ_MACBUNDLE_NAME = @MOZ_MACBUNDLE_NAME@
  
-@@ -62,14 +63,14 @@ MOZ_PKG_SPECIAL = @MOZ_PKG_SPECIAL@
+@@ -63,14 +64,14 @@ MOZ_PKG_SPECIAL = @MOZ_PKG_SPECIAL@
  prefix		= @prefix@
  exec_prefix	= @exec_prefix@
  bindir		= @bindir@
diff --git a/recipes-mozilla/firefox/firefox/firefox.gcc-4.7.patch b/recipes-mozilla/firefox/firefox/firefox.gcc-4.7.patch
deleted file mode 100644
index 77cdad2..0000000
--- a/recipes-mozilla/firefox/firefox/firefox.gcc-4.7.patch
+++ /dev/null
@@ -1,57 +0,0 @@
---- mozilla-release/ipc/chromium/src/base/file_util.cc.orig	2012-05-01 08:07:10.000000000 +0200
-+++ mozilla-release/ipc/chromium/src/base/file_util.cc	2012-05-01 08:05:02.000000000 +0200
-@@ -8,9 +8,7 @@
- #include <io.h>
- #endif
- #include <stdio.h>
--#if defined(ANDROID)
- #include <unistd.h>
--#endif
- 
- #include <fstream>
- 
---- mozilla-release/ipc/chromium/src/base/message_pump_libevent.cc.orig	2012-05-01 08:16:55.000000000 +0200
-+++ mozilla-release/ipc/chromium/src/base/message_pump_libevent.cc	2012-05-01 08:16:37.000000000 +0200
-@@ -6,6 +6,7 @@
- 
- #include <errno.h>
- #include <fcntl.h>
-+#include <unistd.h>
- 
- #include "eintr_wrapper.h"
- #include "base/logging.h"
---- mozilla-release/security/nss/lib/softoken/secmodt.h.orig	2012-05-01 13:13:50.000000000 +0200
-+++ mozilla-release/security/nss/lib/softoken/secmodt.h	2012-05-01 13:14:25.000000000 +0200
-@@ -337,8 +337,9 @@
- /* default module configuration strings */
- #define SECMOD_SLOT_FLAGS "slotFlags=[RSA,DSA,DH,RC2,RC4,DES,RANDOM,SHA1,MD5,MD2,SSL,TLS,AES,Camellia,SEED,SHA256,SHA512]"
- 
--#define SECMOD_MAKE_NSS_FLAGS(fips,slot) \
--"Flags=internal,critical"fips" slotparams=("#slot"={"SECMOD_SLOT_FLAGS"})"
-+/* from http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50917 */
-+#define SECMOD_MAKE_NSS_FLAGS(fips,slot) \                                      
-+"Flags=internal,critical" fips" slotparams=("#slot"={" SECMOD_SLOT_FLAGS"})"
- 
- #define SECMOD_INT_NAME "NSS Internal PKCS #11 Module"
- #define SECMOD_INT_FLAGS SECMOD_MAKE_NSS_FLAGS("",1)
---- mozilla-release/ipc/chromium/src/base/time_posix.cc.orig	2012-05-01 13:15:33.000000000 +0200
-+++ mozilla-release/ipc/chromium/src/base/time_posix.cc	2012-05-01 12:42:38.000000000 +0200
-@@ -14,6 +14,8 @@
- #include <time.h>
- #endif
- 
-+#include <unistd.h>
-+
- #include <limits>
- 
- #include "base/basictypes.h"
---- mozilla-release/ipc/chromium/src/base/file_util_linux.cc.orig	2012-05-01 08:39:16.000000000 +0200
-+++ mozilla-release/ipc/chromium/src/base/file_util_linux.cc	2012-05-01 08:39:39.000000000 +0200
-@@ -5,6 +5,7 @@
- #include "base/file_util.h"
- 
- #include <fcntl.h>
-+#include <unistd.h>
- 
- #include <string>
- #include <vector>
diff --git a/recipes-mozilla/firefox/firefox/fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch b/recipes-mozilla/firefox/firefox/fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch
new file mode 100644
index 0000000..54ec57d
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch
@@ -0,0 +1,26 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Fri, 31 Aug 2012 09:01:08 +0200
+Subject: Allow webGL with mesa, assuming users will have updated to 8.0.4-2
+ on wheezy
+
+The version in squeeze-backports is not affected by CVE-2012-2864, and the
+version in squeeze is blacklisted.
+---
+ widget/src/xpwidgets/GfxInfoX11.cpp |    4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/widget/src/xpwidgets/GfxInfoX11.cpp b/widget/src/xpwidgets/GfxInfoX11.cpp
+index a2d5e0b..27a0fd0 100644
+--- a/widget/src/xpwidgets/GfxInfoX11.cpp
++++ b/widget/src/xpwidgets/GfxInfoX11.cpp
+@@ -310,10 +310,6 @@ GfxInfo::GetFeatureStatusImpl(PRInt32 aFeature,
+     }
+ 
+     if (mIsMesa) {
+-        if (aFeature == nsIGfxInfo::FEATURE_WEBGL_OPENGL) {
+-            *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
+-            aSuggestedDriverVersion.AssignLiteral("Not Mesa");
+-        }
+         if (mIsNouveau && version(mMajorVersion, mMinorVersion) < version(8,0)) {
+             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
+             aSuggestedDriverVersion.AssignLiteral("Mesa 8.0");
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch
new file mode 100644
index 0000000..87cf894
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch
@@ -0,0 +1,41 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Sun, 26 Feb 2012 09:20:44 +0100
+Subject: Bug 515232 - Try getting general.useragent.locale as a complex value
+ first in DirectoryProvider.cpp
+
+---
+ browser/components/dirprovider/DirectoryProvider.cpp |   14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/browser/components/dirprovider/DirectoryProvider.cpp b/browser/components/dirprovider/DirectoryProvider.cpp
+index 1373adc..5df1419 100644
+--- a/browser/components/dirprovider/DirectoryProvider.cpp
++++ b/browser/components/dirprovider/DirectoryProvider.cpp
+@@ -56,6 +56,7 @@
+ #include "nsServiceManagerUtils.h"
+ #include "nsStringAPI.h"
+ #include "nsXULAppAPI.h"
++#include "nsIPrefLocalizedString.h"
+ 
+ namespace mozilla {
+ namespace browser {
+@@ -200,7 +201,18 @@ AppendDistroSearchDirs(nsIProperties* aDirSvc, nsCOMArray<nsIFile> &array)
+     localePlugins->AppendNative(NS_LITERAL_CSTRING("locale"));
+ 
+     nsCString locale;
+-    rv = prefs->GetCharPref("general.useragent.locale", getter_Copies(locale));
++    nsCOMPtr<nsIPrefLocalizedString> prefString;
++    rv = prefs->GetComplexValue("general.useragent.locale",
++                                NS_GET_IID(nsIPrefLocalizedString),
++                                getter_AddRefs(prefString));
++    if (NS_SUCCEEDED(rv)) {
++      nsAutoString wLocale;
++      prefString->GetData(getter_Copies(wLocale));
++      CopyUTF16toUTF8(wLocale, locale);
++    } else {
++      rv = prefs->GetCharPref("general.useragent.locale", getter_Copies(locale));
++    }
++
+     if (NS_SUCCEEDED(rv)) {
+ 
+       nsCOMPtr<nsIFile> curLocalePlugins;
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-690682-Disable-dead-symbol-removal-when-failing-.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-690682-Disable-dead-symbol-removal-when-failing-.patch
deleted file mode 100644
index fe24b65..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-690682-Disable-dead-symbol-removal-when-failing-.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 30 Sep 2011 09:51:16 +0200
-Subject: Bug 690682 - Disable dead symbol removal when failing to test for
- bug 670659
-
----
- configure.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index cf849e1..ba1b528 100644
---- a/configure.in
-+++ b/configure.in
-@@ -6874,7 +6874,7 @@ if test "$GNU_CC" -a "$GCC_USE_GNU_LD" -a -n "$MOZ_DEBUG_FLAGS"; then
-             fi
-         else
-              dnl We really don't expect to get here, but just in case
--             AC_ERROR([couldn't compile a simple C file])
-+             GC_SECTIONS_BREAKS_DEBUG_RANGES="no, but it's broken in some other way"
-         fi
-         rm -rf conftest*])
-     if test "$GC_SECTIONS_BREAKS_DEBUG_RANGES" = no; then
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch
new file mode 100644
index 0000000..4f0ffc9
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch
@@ -0,0 +1,69 @@
+From: Benoit Jacob <bjacob@mozilla.com>
+Date: Thu, 23 Feb 2012 17:21:30 -0500
+Subject: Bug 696636 - Block OpenGL 1 drivers explicitly to steer clear of
+ crashes - r=mattwoodrow
+
+---
+ widget/src/xpwidgets/GfxInfoX11.cpp |   14 +++++++++++++-
+ widget/src/xpwidgets/GfxInfoX11.h   |    2 +-
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/widget/src/xpwidgets/GfxInfoX11.cpp b/widget/src/xpwidgets/GfxInfoX11.cpp
+index 018b8fa..4974c5f 100644
+--- a/widget/src/xpwidgets/GfxInfoX11.cpp
++++ b/widget/src/xpwidgets/GfxInfoX11.cpp
+@@ -61,6 +61,7 @@ pid_t glxtest_pid = 0;
+ nsresult
+ GfxInfo::Init()
+ {
++    mGLMajorVersion = 0;
+     mMajorVersion = 0;
+     mMinorVersion = 0;
+     mRevisionVersion = 0;
+@@ -195,6 +196,9 @@ GfxInfo::GetData()
+     CrashReporter::AppendAppNotesToCrashReport(note);
+ #endif
+ 
++    // determine the major OpenGL version. That's the first integer in the version string.
++    mGLMajorVersion = strtol(mVersion.get(), 0, 10);
++
+     // determine driver type (vendor) and where in the version string
+     // the actual driver version numbers should be expected to be found (whereToReadVersionNumbers)
+     const char *whereToReadVersionNumbers = nsnull;
+@@ -219,7 +223,7 @@ GfxInfo::GetData()
+         whereToReadVersionNumbers = mVersion.get();
+     }
+ 
+-    // read major.minor version numbers
++    // read major.minor version numbers of the driver (not to be confused with the OpenGL version)
+     if (whereToReadVersionNumbers) {
+         // copy into writable buffer, for tokenization
+         strncpy(buf, whereToReadVersionNumbers, buf_size);
+@@ -275,6 +279,14 @@ GfxInfo::GetFeatureStatusImpl(PRInt32 aFeature,
+ 
+     OperatingSystem os = DRIVER_OS_LINUX;
+ 
++    if (mGLMajorVersion == 1) {
++        // We're on OpenGL 1. In most cases that indicates really old hardware.
++        // We better block them, rather than rely on them to fail gracefully, because they don't!
++        // see bug 696636
++        *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DEVICE;
++        return NS_OK;
++    }
++
+     // Disable OpenGL layers when we don't have texture_from_pixmap because it regresses performance. 
+     if (aFeature == nsIGfxInfo::FEATURE_OPENGL_LAYERS && !mHasTextureFromPixmap) {
+         *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
+diff --git a/widget/src/xpwidgets/GfxInfoX11.h b/widget/src/xpwidgets/GfxInfoX11.h
+index 2525db0..03878ff 100644
+--- a/widget/src/xpwidgets/GfxInfoX11.h
++++ b/widget/src/xpwidgets/GfxInfoX11.h
+@@ -95,7 +95,7 @@ private:
+   nsCString mAdapterDescription;
+   bool mIsMesa, mIsNVIDIA, mIsFGLRX;
+   bool mHasTextureFromPixmap;
+-  int mMajorVersion, mMinorVersion, mRevisionVersion;
++  int mGLMajorVersion, mMajorVersion, mMinorVersion, mRevisionVersion;
+ 
+   void AddCrashReportAnnotations();
+ };
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-703633-TreePanel.jsm-uses-a-resource-url-that-ou.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-703633-TreePanel.jsm-uses-a-resource-url-that-ou.patch
deleted file mode 100644
index 8ca9ade..0000000
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-703633-TreePanel.jsm-uses-a-resource-url-that-ou.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From: Mike Hommey <mh+mozilla@glandium.org>
-Date: Fri, 18 Nov 2011 18:36:16 +0100
-Subject: Bug 703633 - TreePanel.jsm uses a resource:/// url that ought to be
- resource://gre/; r=rcampbell
-
----
- browser/devtools/highlighter/TreePanel.jsm |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/browser/devtools/highlighter/TreePanel.jsm b/browser/devtools/highlighter/TreePanel.jsm
-index b889d04..4f26ea2 100644
---- a/browser/devtools/highlighter/TreePanel.jsm
-+++ b/browser/devtools/highlighter/TreePanel.jsm
-@@ -45,7 +45,7 @@ const Cu = Components.utils;
- 
- Cu.import("resource:///modules/domplate.jsm");
- Cu.import("resource:///modules/InsideOutBox.jsm");
--Cu.import("resource:///modules/Services.jsm");
-+Cu.import("resource://gre/modules/Services.jsm");
- 
- var EXPORTED_SYMBOLS = ["TreePanel", "DOMHelpers"];
- 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch
new file mode 100644
index 0000000..0d3bd9f
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch
@@ -0,0 +1,26 @@
+From: aceman <acelists@atlas.sk>
+Date: Wed, 11 Jan 2012 10:46:54 +0100
+Subject: =?UTF-8?q?Bug=20706724=20-=20Fix=20for=20error:=20=E2=80=98ftruncat?=
+ =?UTF-8?q?e=E2=80=99=20was=20not=20declared=20in=20this=20scope.=20r=3Dbenj?=
+ =?UTF-8?q?amin?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+---
+ ipc/chromium/src/base/file_util.cc |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ipc/chromium/src/base/file_util.cc b/ipc/chromium/src/base/file_util.cc
+index 1154fed..6067a4a 100644
+--- a/ipc/chromium/src/base/file_util.cc
++++ b/ipc/chromium/src/base/file_util.cc
+@@ -8,7 +8,7 @@
+ #include <io.h>
+ #endif
+ #include <stdio.h>
+-#if defined(ANDROID)
++#if defined(ANDROID) || defined(OS_POSIX)
+ #include <unistd.h>
+ #endif
+ 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch
new file mode 100644
index 0000000..23c90a2
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch
@@ -0,0 +1,85 @@
+From: Chris Coulson <chrisccoulson@ubuntu.com>
+Date: Wed, 14 Dec 2011 11:34:31 +0100
+Subject: Bug 709259 - Try creating a named cursor before a bitmap cursor.
+ r=karlt
+
+---
+ widget/src/gtk2/nsGtkCursors.h |   31 +++++++++++++++++--------------
+ widget/src/gtk2/nsWindow.cpp   |   14 +++++++++++---
+ 2 files changed, 28 insertions(+), 17 deletions(-)
+
+diff --git a/widget/src/gtk2/nsGtkCursors.h b/widget/src/gtk2/nsGtkCursors.h
+index b8065eb..eff43ba 100644
+--- a/widget/src/gtk2/nsGtkCursors.h
++++ b/widget/src/gtk2/nsGtkCursors.h
+@@ -46,6 +46,7 @@ typedef struct {
+   const unsigned char *mask_bits;
+   int hot_x;
+   int hot_y;
++  const char *hash;
+ } nsGtkCursor;
+ 
+ /* MOZ_CURSOR_HAND_GRAB */
+@@ -415,21 +416,23 @@ enum {
+   MOZ_CURSOR_NONE
+ };
+ 
+-// create custom pixmap cursor
++// create custom pixmap cursor. The hash values must stay in sync with the
++// bitmap data above. To see the hash function, have a look at XcursorImageHash
++// in libXcursor
+ static const nsGtkCursor GtkCursors[] = {
+-  { moz_hand_grab_bits,      moz_hand_grab_mask_bits,      10, 10 },
+-  { moz_hand_grabbing_bits,  moz_hand_grabbing_mask_bits,  10, 10 },
+-  { moz_copy_bits,           moz_copy_mask_bits,           2,  2  },
+-  { moz_alias_bits,          moz_alias_mask_bits,          2,  2  },
+-  { moz_menu_bits,           moz_menu_mask_bits,           2,  2  },
+-  { moz_spinning_bits,       moz_spinning_mask_bits,       2,  2  },
+-  { moz_zoom_in_bits,        moz_zoom_in_mask_bits,        6,  6  },
+-  { moz_zoom_out_bits,       moz_zoom_out_mask_bits,       6,  6  },
+-  { moz_not_allowed_bits,    moz_not_allowed_mask_bits,    9,  9  },
+-  { moz_vertical_text_bits,  moz_vertical_text_mask_bits,  8,  4  },
+-  { moz_nesw_resize_bits,    moz_nesw_resize_mask_bits,    8,  8  },
+-  { moz_nwse_resize_bits,    moz_nwse_resize_mask_bits,    8,  8  },
+-  { moz_none_bits,           moz_none_mask_bits,           0,  0  }
++  { moz_hand_grab_bits,      moz_hand_grab_mask_bits,      10, 10, "5aca4d189052212118709018842178c0" },
++  { moz_hand_grabbing_bits,  moz_hand_grabbing_mask_bits,  10, 10, "208530c400c041818281048008011002" },
++  { moz_copy_bits,           moz_copy_mask_bits,           2,  2,  "08ffe1cb5fe6fc01f906f1c063814ccf" },
++  { moz_alias_bits,          moz_alias_mask_bits,          2,  2,  "0876e1c15ff2fc01f906f1c363074c0f" },
++  { moz_menu_bits,           moz_menu_mask_bits,           2,  2,  "08ffe1e65f80fcfdf9fff11263e74c48" },
++  { moz_spinning_bits,       moz_spinning_mask_bits,       2,  2,  "08e8e1c95fe2fc01f976f1e063a24ccd" },
++  { moz_zoom_in_bits,        moz_zoom_in_mask_bits,        6,  6,  "f41c0e382c94c0958e07017e42b00462" },
++  { moz_zoom_out_bits,       moz_zoom_out_mask_bits,       6,  6,  "f41c0e382c97c0938e07017e42800402" },
++  { moz_not_allowed_bits,    moz_not_allowed_mask_bits,    9,  9,  "03b6e0fcb3499374a867d041f52298f0" },
++  { moz_vertical_text_bits,  moz_vertical_text_mask_bits,  8,  4,  "048008013003cff3c00c801001200000" },
++  { moz_nesw_resize_bits,    moz_nesw_resize_mask_bits,    8,  8,  "50585d75b494802d0151028115016902" },
++  { moz_nwse_resize_bits,    moz_nwse_resize_mask_bits,    8,  8,  "38c5dff7c7b8962045400281044508d2" },
++  { moz_none_bits,           moz_none_mask_bits,           0,  0,  NULL }
+ };
+ 
+ #endif /* nsGtkCursors_h__ */
+diff --git a/widget/src/gtk2/nsWindow.cpp b/widget/src/gtk2/nsWindow.cpp
+index 2fd6f64..25f1c2a 100644
+--- a/widget/src/gtk2/nsWindow.cpp
++++ b/widget/src/gtk2/nsWindow.cpp
+@@ -5602,9 +5602,17 @@ get_gtk_cursor(nsCursor aCursor)
+         break;
+     }
+ 
+-    // if by now we don't have a xcursor, this means we have to make a
+-    // custom one
+-    if (newType != 0xff) {
++    // If by now we don't have a xcursor, this means we have to make a custom
++    // one. First, we try creating a named cursor based on the hash of our
++    // custom bitmap, as libXcursor has some magic to convert bitmapped cursors
++    // to themed cursors
++    if (newType != 0xFF && GtkCursors[newType].hash) {
++        gdkcursor = gdk_cursor_new_from_name(gdk_display_get_default(),
++                                             GtkCursors[newType].hash);
++    }
++
++    // If we still don't have a xcursor, we now really create a bitmap cursor
++    if (newType != 0xff && !gdkcursor) {
+         GdkPixbuf * cursor_pixbuf = gdk_pixbuf_new(GDK_COLORSPACE_RGB, TRUE, 8, 32, 32);
+         if (!cursor_pixbuf)
+             return NULL;
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch
new file mode 100644
index 0000000..7bc22a6
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch
@@ -0,0 +1,23 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Sat, 25 Feb 2012 10:34:52 +0100
+Subject: Bug 720682 - Don't crash an app using libxul because of the lack of
+ je_malloc_usable_size_in_advance
+
+---
+ storage/src/mozStorageService.cpp |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/storage/src/mozStorageService.cpp b/storage/src/mozStorageService.cpp
+index 7c0a7a0..8a1aa65 100644
+--- a/storage/src/mozStorageService.cpp
++++ b/storage/src/mozStorageService.cpp
+@@ -367,7 +367,8 @@ static int sqliteMemSize(void* p)
+ 
+ static int sqliteMemRoundup(int n)
+ {
+-  n = je_malloc_usable_size_in_advance(n);
++  if (je_malloc_usable_size_in_advance)
++  	n = je_malloc_usable_size_in_advance(n);
+ 
+   // jemalloc can return blocks of size 2 and 4, but SQLite requires that all
+   // allocations be 8-aligned.  So we round up sub-8 requests to 8.  This
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch
index dead616..cef3817 100644
--- a/recipes-mozilla/firefox/firefox/fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch
@@ -4,10 +4,10 @@ Subject: Bug 722127 - Bump required libvpx version to 1.0.0. r=tterribe
 
 ---
  configure.in |   12 ++++++------
- 1 files changed, 6 insertions(+), 6 deletions(-)
+ 1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 4ff56a6..6c227d9 100644
+index 6b155e0..d83926e 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -5616,20 +5616,20 @@ if test -n "$MOZ_WEBM"; then
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch
new file mode 100644
index 0000000..1db1a28
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch
@@ -0,0 +1,52 @@
+From: =?UTF-8?q?Martin=20Str=C3=A1nsk=C3=BD?= <stransky@redhat.com>
+Date: Fri, 10 Feb 2012 16:07:41 +0100
+Subject: Bug 725655 - gcc 4.7 build failures (missing headers). r=benjamin
+
+---
+ ipc/chromium/src/base/file_util_linux.cc       |    3 +++
+ ipc/chromium/src/base/message_pump_libevent.cc |    3 +++
+ ipc/chromium/src/base/time_posix.cc            |    3 +++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/ipc/chromium/src/base/file_util_linux.cc b/ipc/chromium/src/base/file_util_linux.cc
+index cca706f..171e44f 100644
+--- a/ipc/chromium/src/base/file_util_linux.cc
++++ b/ipc/chromium/src/base/file_util_linux.cc
+@@ -5,6 +5,9 @@
+ #include "base/file_util.h"
+ 
+ #include <fcntl.h>
++#if defined(ANDROID) || defined(OS_POSIX)
++#include <unistd.h>
++#endif
+ 
+ #include <string>
+ #include <vector>
+diff --git a/ipc/chromium/src/base/message_pump_libevent.cc b/ipc/chromium/src/base/message_pump_libevent.cc
+index 6194f79..9f31dbb 100644
+--- a/ipc/chromium/src/base/message_pump_libevent.cc
++++ b/ipc/chromium/src/base/message_pump_libevent.cc
+@@ -6,6 +6,9 @@
+ 
+ #include <errno.h>
+ #include <fcntl.h>
++#if defined(ANDROID) || defined(OS_POSIX)
++#include <unistd.h>
++#endif
+ 
+ #include "eintr_wrapper.h"
+ #include "base/logging.h"
+diff --git a/ipc/chromium/src/base/time_posix.cc b/ipc/chromium/src/base/time_posix.cc
+index 8d1a1d5..abf2a56 100644
+--- a/ipc/chromium/src/base/time_posix.cc
++++ b/ipc/chromium/src/base/time_posix.cc
+@@ -13,6 +13,9 @@
+ #else
+ #include <time.h>
+ #endif
++#if defined(ANDROID) || defined(OS_POSIX)
++#include <unistd.h>
++#endif
+ 
+ #include <limits>
+ 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch
new file mode 100644
index 0000000..b3e4c52
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch
@@ -0,0 +1,82 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Fri, 17 Feb 2012 16:53:34 +0100
+Subject: Bug 728229 - Allow to build with system python ply library
+
+---
+ config/autoconf.mk.in           |    2 ++
+ configure.in                    |   10 ++++++++++
+ xpcom/idl-parser/Makefile.in    |    2 ++
+ xpcom/typelib/xpidl/Makefile.in |    2 ++
+ 4 files changed, 16 insertions(+)
+
+diff --git a/config/autoconf.mk.in b/config/autoconf.mk.in
+index fccb1a9..e13dce4 100644
+--- a/config/autoconf.mk.in
++++ b/config/autoconf.mk.in
+@@ -685,6 +685,8 @@ JS_SHARED_LIBRARY = @JS_SHARED_LIBRARY@
+ 
+ MOZ_INSTRUMENT_EVENT_LOOP = @MOZ_INSTRUMENT_EVENT_LOOP@
+ 
++MOZ_SYSTEM_PLY = @MOZ_SYSTEM_PLY@
++
+ # We only want to do the pymake sanity on Windows, other os's can cope
+ ifeq ($(HOST_OS_ARCH),WINNT)
+ # Ensure invariants between GNU Make and pymake
+diff --git a/configure.in b/configure.in
+index d83926e..3c32ae8 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1021,6 +1021,16 @@ if test -z "$PYTHON"; then
+     AC_MSG_ERROR([python was not found in \$PATH])
+ fi
+ 
++MOZ_ARG_WITH_BOOL(system-ply,
++[  --with-system-ply       Use system installed python ply library],
++    [if $PYTHON -c 'import ply' 2>&5; then
++         MOZ_SYSTEM_PLY=1
++     else
++         AC_MSG_ERROR([python ply library is not found but --with-system-ply was requested])
++     fi])
++
++AC_SUBST(MOZ_SYSTEM_PLY)
++
+ if test -z "$COMPILE_ENVIRONMENT"; then
+     NSINSTALL_BIN='$(PYTHON) $(topsrcdir)/config/nsinstall.py'
+ fi
+diff --git a/xpcom/idl-parser/Makefile.in b/xpcom/idl-parser/Makefile.in
+index 20ca148..f5ff178 100644
+--- a/xpcom/idl-parser/Makefile.in
++++ b/xpcom/idl-parser/Makefile.in
+@@ -47,10 +47,12 @@ PARSER_SRCS = \
+   xpidl.py \
+   $(NULL)
+ 
++ifndef MOZ_SYSTEM_PLY
+ PLY_PROGS = \
+   $(topsrcdir)/other-licenses/ply/ply/lex.py \
+   $(topsrcdir)/other-licenses/ply/ply/yacc.py \
+   $(NULL)
++endif
+ 
+ include $(topsrcdir)/config/rules.mk
+ 
+diff --git a/xpcom/typelib/xpidl/Makefile.in b/xpcom/typelib/xpidl/Makefile.in
+index 30f1a66..bcae13a 100644
+--- a/xpcom/typelib/xpidl/Makefile.in
++++ b/xpcom/typelib/xpidl/Makefile.in
+@@ -52,6 +52,7 @@ SDK_BINARY = \
+   $(DEPTH)/xpcom/idl-parser/xpidlyacc.py \
+   $(NULL)
+ 
++ifndef MOZ_SYSTEM_PLY
+ $(SDK_BIN_DIR)/ply::
+ 	$(NSINSTALL) -D $@
+ 
+@@ -63,6 +64,7 @@ PLY_SRCS = \
+ 
+ export:: $(PLY_SRCS) $(SDK_BIN_DIR)/ply
+ 	$(INSTALL) $(IFLAGS2) $^
++endif
+ 
+ include $(topsrcdir)/config/rules.mk
+ 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch
new file mode 100644
index 0000000..40b010d
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch
@@ -0,0 +1,24 @@
+From: Zack Weinberg <zackw@panix.com>
+Date: Fri, 9 Mar 2012 11:07:16 +0100
+Subject: Bug 729817 - Allow the Nouveau driver with Mesa >= 8.0.1 - r=bjacob
+
+---
+ widget/src/xpwidgets/GfxInfoX11.cpp |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/widget/src/xpwidgets/GfxInfoX11.cpp b/widget/src/xpwidgets/GfxInfoX11.cpp
+index c6b2ad3..a2d5e0b 100644
+--- a/widget/src/xpwidgets/GfxInfoX11.cpp
++++ b/widget/src/xpwidgets/GfxInfoX11.cpp
+@@ -314,9 +314,9 @@ GfxInfo::GetFeatureStatusImpl(PRInt32 aFeature,
+             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
+             aSuggestedDriverVersion.AssignLiteral("Not Mesa");
+         }
+-        if (mIsNouveau) {
++        if (mIsNouveau && version(mMajorVersion, mMinorVersion) < version(8,0)) {
+             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
+-            aSuggestedDriverVersion.AssignLiteral("<Not the Nouveau driver>");
++            aSuggestedDriverVersion.AssignLiteral("Mesa 8.0");
+         } else if (version(mMajorVersion, mMinorVersion, mRevisionVersion) < version(7,10,3)) {
+             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
+             aSuggestedDriverVersion.AssignLiteral("Mesa 7.10.3");
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch
new file mode 100644
index 0000000..7e2f3a6
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch
@@ -0,0 +1,56 @@
+From: Benoit Jacob <bjacob@mozilla.com>
+Date: Thu, 23 Feb 2012 17:23:29 -0500
+Subject: Bug 729817 - Block the Nouveau 3D driver as it's installed by
+ default on OpenSuse 12.1 and crashes - r=mattwoodrow
+
+---
+ widget/src/xpwidgets/GfxInfoX11.cpp |    8 +++++++-
+ widget/src/xpwidgets/GfxInfoX11.h   |    2 +-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/widget/src/xpwidgets/GfxInfoX11.cpp b/widget/src/xpwidgets/GfxInfoX11.cpp
+index 4974c5f..c6b2ad3 100644
+--- a/widget/src/xpwidgets/GfxInfoX11.cpp
++++ b/widget/src/xpwidgets/GfxInfoX11.cpp
+@@ -68,6 +68,7 @@ GfxInfo::Init()
+     mIsMesa = false;
+     mIsNVIDIA = false;
+     mIsFGLRX = false;
++    mIsNouveau = false;
+     mHasTextureFromPixmap = false;
+     return GfxInfoBase::Init();
+ }
+@@ -208,6 +209,8 @@ GfxInfo::GetData()
+         // with Mesa, the version string contains "Mesa major.minor" and that's all the version information we get:
+         // there is no actual driver version info.
+         whereToReadVersionNumbers = Mesa_in_version_string + strlen("Mesa");
++        if (strcasestr(mVendor.get(), "nouveau"))
++            mIsNouveau = true;
+     } else if (strstr(mVendor.get(), "NVIDIA Corporation")) {
+         mIsNVIDIA = true;
+         // with the NVIDIA driver, the version string contains "NVIDIA major.minor"
+@@ -311,7 +314,10 @@ GfxInfo::GetFeatureStatusImpl(PRInt32 aFeature,
+             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
+             aSuggestedDriverVersion.AssignLiteral("Not Mesa");
+         }
+-        if (version(mMajorVersion, mMinorVersion, mRevisionVersion) < version(7,10,3)) {
++        if (mIsNouveau) {
++            *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
++            aSuggestedDriverVersion.AssignLiteral("<Not the Nouveau driver>");
++        } else if (version(mMajorVersion, mMinorVersion, mRevisionVersion) < version(7,10,3)) {
+             *aStatus = nsIGfxInfo::FEATURE_BLOCKED_DRIVER_VERSION;
+             aSuggestedDriverVersion.AssignLiteral("Mesa 7.10.3");
+         }
+diff --git a/widget/src/xpwidgets/GfxInfoX11.h b/widget/src/xpwidgets/GfxInfoX11.h
+index 03878ff..68bf976 100644
+--- a/widget/src/xpwidgets/GfxInfoX11.h
++++ b/widget/src/xpwidgets/GfxInfoX11.h
+@@ -93,7 +93,7 @@ private:
+   nsCString mRenderer;
+   nsCString mVersion;
+   nsCString mAdapterDescription;
+-  bool mIsMesa, mIsNVIDIA, mIsFGLRX;
++  bool mIsMesa, mIsNVIDIA, mIsFGLRX, mIsNouveau;
+   bool mHasTextureFromPixmap;
+   int mGLMajorVersion, mMajorVersion, mMinorVersion, mRevisionVersion;
+ 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch
new file mode 100644
index 0000000..a2ee22e
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch
@@ -0,0 +1,76 @@
+From: Stefan <kdevel@vogtner.de>
+Date: Thu, 15 Mar 2012 11:01:08 -0700
+Subject: Bug 734490: fix build failures with Clang and GCC 4.7 in
+ TestPoisonArea.cpp. r=zwol
+
+---
+ layout/base/tests/TestPoisonArea.cpp |   14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/layout/base/tests/TestPoisonArea.cpp b/layout/base/tests/TestPoisonArea.cpp
+index f81ce1b..6cf4afd 100644
+--- a/layout/base/tests/TestPoisonArea.cpp
++++ b/layout/base/tests/TestPoisonArea.cpp
+@@ -397,7 +397,7 @@ ReservePoisonArea()
+     uintptr_t result = (((uintptr_t(0x7FFFFFFFu) << 31) << 1 |
+                          uintptr_t(0xF0DEAFFFu)) &
+                         ~uintptr_t(PAGESIZE-1));
+-    printf("INFO | poison area assumed at 0x%.*"PRIxPTR"\n", SIZxPTR, result);
++    printf("INFO | poison area assumed at 0x%.*" PRIxPTR "\n", SIZxPTR, result);
+     return result;
+   } else {
+     // First see if we can allocate the preferred poison address from the OS.
+@@ -405,7 +405,7 @@ ReservePoisonArea()
+     void *result = ReserveRegion(candidate, false);
+     if (result == (void *)candidate) {
+       // success - inaccessible page allocated
+-      printf("INFO | poison area allocated at 0x%.*"PRIxPTR
++      printf("INFO | poison area allocated at 0x%.*" PRIxPTR
+              " (preferred addr)\n", SIZxPTR, (uintptr_t)result);
+       return candidate;
+     }
+@@ -416,7 +416,7 @@ ReservePoisonArea()
+       // success - selected page cannot be usable memory
+       if (result != MAP_FAILED)
+         ReleaseRegion(result);
+-      printf("INFO | poison area assumed at 0x%.*"PRIxPTR
++      printf("INFO | poison area assumed at 0x%.*" PRIxPTR
+              " (preferred addr)\n", SIZxPTR, candidate);
+       return candidate;
+     }
+@@ -424,7 +424,7 @@ ReservePoisonArea()
+     // The preferred address is already in use.  Did the OS give us a
+     // consolation prize?
+     if (result != MAP_FAILED) {
+-      printf("INFO | poison area allocated at 0x%.*"PRIxPTR
++      printf("INFO | poison area allocated at 0x%.*" PRIxPTR
+              " (consolation prize)\n", SIZxPTR, (uintptr_t)result);
+       return (uintptr_t)result;
+     }
+@@ -433,7 +433,7 @@ ReservePoisonArea()
+     // the address.
+     result = ReserveRegion(0, false);
+     if (result != MAP_FAILED) {
+-      printf("INFO | poison area allocated at 0x%.*"PRIxPTR
++      printf("INFO | poison area allocated at 0x%.*" PRIxPTR
+              " (fallback)\n", SIZxPTR, (uintptr_t)result);
+       return (uintptr_t)result;
+     }
+@@ -455,7 +455,7 @@ ReservePositiveControl()
+     printf("ERROR | allocating positive control | %s\n", LastErrMsg());
+     return 0;
+   }
+-  printf("INFO | positive control allocated at 0x%.*"PRIxPTR"\n",
++  printf("INFO | positive control allocated at 0x%.*" PRIxPTR "\n",
+          SIZxPTR, (uintptr_t)result);
+   return (uintptr_t)result;
+ }
+@@ -486,7 +486,7 @@ ReserveNegativeControl()
+     return 0;
+   }
+ 
+-  printf("INFO | negative control allocated at 0x%.*"PRIxPTR"\n",
++  printf("INFO | negative control allocated at 0x%.*" PRIxPTR "\n",
+          SIZxPTR, (uintptr_t)result);
+   return (uintptr_t)result;
+ }
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch
new file mode 100644
index 0000000..17b6678
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch
@@ -0,0 +1,25 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Fri, 20 Apr 2012 11:26:22 +0200
+Subject: Bug 747322 - Fix jemalloc mmap wrapper for s390x
+
+---
+ memory/jemalloc/jemalloc.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/memory/jemalloc/jemalloc.c b/memory/jemalloc/jemalloc.c
+index d792728..147e18f 100644
+--- a/memory/jemalloc/jemalloc.c
++++ b/memory/jemalloc/jemalloc.c
+@@ -403,9 +403,9 @@ void *_mmap(void *addr, size_t length, int prot, int flags,
+ 	struct {
+ 		void *addr;
+ 		size_t length;
+-		int prot;
+-		int flags;
+-		int fd;
++		long prot;
++		long flags;
++		long fd;
+ 		off_t offset;
+ 	} args = { addr, length, prot, flags, fd, offset };
+ 	return (void *) syscall(SYS_mmap, &args);
diff --git a/recipes-mozilla/firefox/firefox/fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch b/recipes-mozilla/firefox/firefox/fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch
new file mode 100644
index 0000000..ac855b2
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch
@@ -0,0 +1,49 @@
+From: Mike Hommey <mh+mozilla@glandium.org>
+Date: Thu, 7 Jun 2012 10:41:59 +0200
+Subject: Bug 761082 - Only export TabMessageUtils.h in mozilla/dom. r=cjones
+
+---
+ dom/ipc/Makefile.in         |    2 +-
+ dom/ipc/PBrowser.ipdl       |    2 +-
+ dom/ipc/TabMessageUtils.cpp |    2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/dom/ipc/Makefile.in b/dom/ipc/Makefile.in
+index 8d02e8b..ea37fad 100644
+--- a/dom/ipc/Makefile.in
++++ b/dom/ipc/Makefile.in
+@@ -53,7 +53,7 @@ DIRS += tests
+ endif
+ endif
+ 
+-EXPORTS = TabMessageUtils.h PCOMContentPermissionRequestChild.h
++EXPORTS = PCOMContentPermissionRequestChild.h
+ 
+ EXPORTS_NAMESPACES = mozilla/dom
+ 
+diff --git a/dom/ipc/PBrowser.ipdl b/dom/ipc/PBrowser.ipdl
+index f9a25fc..10a8592 100644
+--- a/dom/ipc/PBrowser.ipdl
++++ b/dom/ipc/PBrowser.ipdl
+@@ -44,7 +44,7 @@ include protocol PContentPermissionRequest;
+ include protocol PRenderFrame;
+ include protocol POfflineCacheUpdate;
+ 
+-include "TabMessageUtils.h";
++include "mozilla/dom/TabMessageUtils.h";
+ include "gfxMatrix.h";
+ include "mozilla/net/NeckoMessageUtils.h";
+ include "IPC/nsGUIEventIPC.h";
+diff --git a/dom/ipc/TabMessageUtils.cpp b/dom/ipc/TabMessageUtils.cpp
+index 201d7d4..44b7e44 100644
+--- a/dom/ipc/TabMessageUtils.cpp
++++ b/dom/ipc/TabMessageUtils.cpp
+@@ -36,7 +36,7 @@
+  *
+  * ***** END LICENSE BLOCK ***** */
+ 
+-#include "TabMessageUtils.h"
++#include "mozilla/dom/TabMessageUtils.h"
+ #include "nsCOMPtr.h"
+ #include "nsIDOMEvent.h"
+ 
diff --git a/recipes-mozilla/firefox/firefox/fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch b/recipes-mozilla/firefox/firefox/fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch
index e4d7f4a..c1002a9 100644
--- a/recipes-mozilla/firefox/firefox/fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch
+++ b/recipes-mozilla/firefox/firefox/fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch
@@ -3,9 +3,9 @@ Date: Thu, 14 Jul 2011 17:18:56 +0200
 Subject: Fix some tests using CurProcD where GreD should be used
 
 ---
- dom/plugins/test/unit/head_plugins.js              |    2 +-
- netwerk/test/unit/test_socks.js                    |    2 +-
- .../extensions/test/xpcshell/test_plugins.js       |    2 +-
+ dom/plugins/test/unit/head_plugins.js                    |    2 +-
+ netwerk/test/unit/test_socks.js                          |    2 +-
+ toolkit/mozapps/extensions/test/xpcshell/test_plugins.js |    2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/dom/plugins/test/unit/head_plugins.js b/dom/plugins/test/unit/head_plugins.js
@@ -22,7 +22,7 @@ index ddb78f5..ca32106 100644
    do_check_true(plugins.exists());
    var plugin = plugins.clone();
 diff --git a/netwerk/test/unit/test_socks.js b/netwerk/test/unit/test_socks.js
-index 74dd7d2..f21037e 100644
+index bbaeffa..f692d97 100644
 --- a/netwerk/test/unit/test_socks.js
 +++ b/netwerk/test/unit/test_socks.js
 @@ -36,7 +36,7 @@ function runScriptSubprocess(script, args)
diff --git a/recipes-mozilla/firefox/firefox/fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch b/recipes-mozilla/firefox/firefox/fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch
new file mode 100644
index 0000000..216792f
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch
@@ -0,0 +1,23 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Sat, 25 Feb 2012 12:03:56 +0100
+Subject: Load dependent libraries with their real path to avoid confusing gdb
+ when they are symlinks
+
+---
+ xpcom/glue/standalone/nsGlueLinkingDlopen.cpp |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/xpcom/glue/standalone/nsGlueLinkingDlopen.cpp b/xpcom/glue/standalone/nsGlueLinkingDlopen.cpp
+index 959bd69..61b18f8 100644
+--- a/xpcom/glue/standalone/nsGlueLinkingDlopen.cpp
++++ b/xpcom/glue/standalone/nsGlueLinkingDlopen.cpp
+@@ -206,6 +206,9 @@ preload(const char *file)
+ static void
+ ReadDependentCB(const char *aDependentLib, bool do_preload)
+ {
++    char lib[MAXPATHLEN];
++    if (realpath(aDependentLib, lib))
++        aDependentLib = lib;
+ #if defined(LINUX) && !defined(ANDROID)
+     if (do_preload)
+         preload(aDependentLib);
diff --git a/recipes-mozilla/firefox/firefox/fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch b/recipes-mozilla/firefox/firefox/fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch
index 6e0ffcb..8ed4881 100644
--- a/recipes-mozilla/firefox/firefox/fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch
+++ b/recipes-mozilla/firefox/firefox/fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch
@@ -5,7 +5,7 @@ Subject: Properly launch applications set in $HOME/.mailcap
 Replaces the previous patch in a much simpler way.
 ---
  uriloader/exthandler/unix/nsMIMEInfoUnix.cpp |   15 +++++++++++++--
- 1 files changed, 13 insertions(+), 2 deletions(-)
+ 1 file changed, 13 insertions(+), 2 deletions(-)
 
 diff --git a/uriloader/exthandler/unix/nsMIMEInfoUnix.cpp b/uriloader/exthandler/unix/nsMIMEInfoUnix.cpp
 index 5d7f758..81b8efb 100644
diff --git a/recipes-mozilla/firefox/firefox/fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch b/recipes-mozilla/firefox/firefox/fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch
new file mode 100644
index 0000000..2fdc6ae
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch
@@ -0,0 +1,351 @@
+From: Trevor Saunders <trev.saunders@gmail.com>
+Date: Wed, 4 Jan 2012 20:54:17 -0500
+Subject: bug 693343 - a11y disabled in Gnome 3 when GNOME_ACCESSIBILITY is
+ unset patch=mgorse, tbsaunde r=tbsaunde, karlt
+
+---
+ accessible/src/atk/Makefile.in                     |    4 +
+ accessible/src/atk/nsApplicationAccessibleWrap.cpp |  156 ++++++++++++++++----
+ accessible/src/base/nsAccessibilityService.h       |   15 ++
+ widget/src/gtk2/nsWindow.cpp                       |   48 +-----
+ widget/src/gtk2/nsWindow.h                         |    3 -
+ 5 files changed, 157 insertions(+), 69 deletions(-)
+
+diff --git a/accessible/src/atk/Makefile.in b/accessible/src/atk/Makefile.in
+index 4934fd1..9fe1f48 100644
+--- a/accessible/src/atk/Makefile.in
++++ b/accessible/src/atk/Makefile.in
+@@ -92,6 +92,10 @@ include $(topsrcdir)/config/rules.mk
+ CFLAGS		+= $(MOZ_GTK2_CFLAGS)
+ CXXFLAGS	+= $(MOZ_GTK2_CFLAGS)
+ 
++ifdef MOZ_ENABLE_DBUS
++CXXFLAGS += $(MOZ_DBUS_CFLAGS)
++endif
++
+ LOCAL_INCLUDES += \
+   -I$(srcdir) \
+   -I$(srcdir)/../base \
+diff --git a/accessible/src/atk/nsApplicationAccessibleWrap.cpp b/accessible/src/atk/nsApplicationAccessibleWrap.cpp
+index c8ee40c..5937883 100644
+--- a/accessible/src/atk/nsApplicationAccessibleWrap.cpp
++++ b/accessible/src/atk/nsApplicationAccessibleWrap.cpp
+@@ -44,7 +44,7 @@
+ #include "nsMai.h"
+ #include "prlink.h"
+ #include "prenv.h"
+-#include "nsIPrefBranch.h"
++#include "nsIGConfService.h"
+ #include "nsIServiceManager.h"
+ #include "nsAutoPtr.h"
+ #include "nsAccessibilityService.h"
+@@ -52,6 +52,11 @@
+ 
+ #include <gtk/gtk.h>
+ #include <atk/atk.h>
++#ifdef MOZ_ENABLE_DBUS
++#include <dbus/dbus.h>
++#endif
++
++using namespace mozilla::a11y;
+ 
+ typedef GType (* AtkGetTypeType) (void);
+ GType g_atk_hyperlink_impl_type = G_TYPE_INVALID;
+@@ -60,11 +65,6 @@ static PRLibrary *sATKLib = nsnull;
+ static const char sATKLibName[] = "libatk-1.0.so.0";
+ static const char sATKHyperlinkImplGetTypeSymbol[] =
+     "atk_hyperlink_impl_get_type";
+-static const char sAccEnv [] = "GNOME_ACCESSIBILITY";
+-static const char sSysPrefService [] =
+-    "@mozilla.org/system-preference-service;1";
+-static const char sAccessibilityKey [] =
+-    "config.use_system_prefs.accessibility";
+ 
+ /* gail function pointer */
+ static guint (* gail_add_global_event_listener) (GSignalEmissionHook listener,
+@@ -614,26 +614,7 @@ toplevel_event_watcher(GSignalInvocationHint* ihint,
+ bool
+ nsApplicationAccessibleWrap::Init()
+ {
+-    // XXX following code is copied from widget/src/gtk2/nsWindow.cpp
+-    // we should put it to somewhere that can be used from both modules
+-    // see bug 390761
+-
+-    // check if accessibility enabled/disabled by environment variable
+-    bool isGnomeATEnabled = false;
+-    const char *envValue = PR_GetEnv(sAccEnv);
+-    if (envValue) {
+-        isGnomeATEnabled = !!atoi(envValue);
+-    } else {
+-        //check gconf-2 setting
+-        nsresult rv;
+-        nsCOMPtr<nsIPrefBranch> sysPrefService =
+-            do_GetService(sSysPrefService, &rv);
+-        if (NS_SUCCEEDED(rv) && sysPrefService) {
+-            sysPrefService->GetBoolPref(sAccessibilityKey, &isGnomeATEnabled);
+-        }
+-    }
+-
+-    if (isGnomeATEnabled) {
++    if (ShouldA11yBeEnabled()) {
+         // load and initialize gail library
+         nsresult rv = LoadGtkModule(sGail);
+         if (NS_SUCCEEDED(rv)) {
+@@ -882,3 +863,126 @@ LoadGtkModule(GnomeAccessibilityModule& aModule)
+     }
+     return NS_OK;
+ }
++
++namespace mozilla {
++namespace a11y {
++
++  static const char sAccEnv [] = "GNOME_ACCESSIBILITY";
++#ifdef MOZ_ENABLE_DBUS
++static DBusPendingCall *sPendingCall = nsnull;
++#endif
++
++void
++PreInit()
++{
++#ifdef MOZ_ENABLE_DBUS
++  static bool sChecked = FALSE;
++  if (sChecked)
++    return;
++
++  sChecked = TRUE;
++
++  // dbus is only checked if GNOME_ACCESSIBILITY is unset
++  if (PR_GetEnv(sAccEnv) || !PR_GetEnv("DBUS_SESSION_BUS_ADDRESS"))
++    return;
++
++  DBusConnection* bus = dbus_bus_get(DBUS_BUS_SESSION, nsnull);
++  if (!bus)
++    return;
++
++  dbus_connection_set_exit_on_disconnect(bus, FALSE);
++
++  DBusMessage *message;
++  message = dbus_message_new_method_call("org.a11y.Bus", "/org/a11y/bus",
++                                         "org.freedesktop.DBus.Properties",
++                                         "Get");
++  if (!message)
++    goto dbus_done;
++
++  static const char* iface = "org.a11y.Status";
++  static const char* member = "IsEnabled";
++  dbus_message_append_args(message, DBUS_TYPE_STRING, &iface,
++                           DBUS_TYPE_STRING, &member, DBUS_TYPE_INVALID);
++  dbus_connection_send_with_reply(bus, message, &sPendingCall, 1000);
++  dbus_message_unref(message);
++
++dbus_done:
++  dbus_connection_unref(bus);
++#endif
++}
++
++bool
++ShouldA11yBeEnabled()
++{
++  static bool sChecked = false, sShouldEnable = false;
++  if (sChecked)
++    return sShouldEnable;
++
++  sChecked = true;
++
++  // check if accessibility enabled/disabled by environment variable
++  const char* envValue = PR_GetEnv(sAccEnv);
++  if (envValue)
++    return sShouldEnable = !!atoi(envValue);
++
++#ifdef MOZ_ENABLE_DBUS
++  PreInit();
++  bool dbusSuccess = false;
++  DBusMessage *reply = nsnull;
++  if (!sPendingCall)
++    goto dbus_done;
++
++  dbus_pending_call_block(sPendingCall);
++  reply = dbus_pending_call_steal_reply(sPendingCall);
++  dbus_pending_call_unref(sPendingCall);
++  sPendingCall = nsnull;
++  if (!reply ||
++      dbus_message_get_type(reply) != DBUS_MESSAGE_TYPE_METHOD_RETURN ||
++      strcmp(dbus_message_get_signature (reply), DBUS_TYPE_VARIANT_AS_STRING))
++    goto dbus_done;
++
++  DBusMessageIter iter, iter_variant, iter_struct;
++  dbus_bool_t dResult;
++  dbus_message_iter_init(reply, &iter);
++  dbus_message_iter_recurse (&iter, &iter_variant);
++  switch (dbus_message_iter_get_arg_type(&iter_variant)) {
++    case DBUS_TYPE_STRUCT:
++      // at-spi2-core 2.2.0-2.2.1 had a bug where it returned a struct
++      dbus_message_iter_recurse(&iter_variant, &iter_struct);
++      if (dbus_message_iter_get_arg_type(&iter_struct) == DBUS_TYPE_BOOLEAN) {
++        dbus_message_iter_get_basic(&iter_struct, &dResult);
++        sShouldEnable = dResult;
++        dbusSuccess = true;
++      }
++
++      break;
++    case DBUS_TYPE_BOOLEAN:
++      dbus_message_iter_get_basic(&iter_variant, &dResult);
++      sShouldEnable = dResult;
++      dbusSuccess = true;
++      break;
++    default:
++      break;
++  }
++
++dbus_done:
++  if (reply)
++    dbus_message_unref(reply);
++
++  if (dbusSuccess)
++    return sShouldEnable;
++#endif
++
++  //check gconf-2 setting
++static const char sGconfAccessibilityKey[] =
++    "/desktop/gnome/interface/accessibility";
++  nsresult rv = NS_OK;
++  nsCOMPtr<nsIGConfService> gconf =
++    do_GetService(NS_GCONFSERVICE_CONTRACTID, &rv);
++  if (NS_SUCCEEDED(rv) && gconf)
++    gconf->GetBool(NS_LITERAL_CSTRING(sGconfAccessibilityKey), &sShouldEnable);
++
++  return sShouldEnable;
++}
++} // namespace a11y
++} // namespace mozilla
+diff --git a/accessible/src/base/nsAccessibilityService.h b/accessible/src/base/nsAccessibilityService.h
+index 841814a..4284c80 100644
+--- a/accessible/src/base/nsAccessibilityService.h
++++ b/accessible/src/base/nsAccessibilityService.h
+@@ -56,6 +56,21 @@ namespace a11y {
+  */
+ FocusManager* FocusMgr();
+ 
++#ifdef MOZ_ACCESSIBILITY_ATK
++/**
++ * Perform initialization that should be done as soon as possible, in order
++ * to minimize startup time.
++ * XXX: this function and the next defined in nsApplicationAccessibleWrap.cpp
++ */
++void PreInit();
++
++/**
++ * Is platform accessibility enabled.
++ * Only used on linux with atk for now.
++ */
++bool ShouldA11yBeEnabled();
++#endif
++
+ } // namespace a11y
+ } // namespace mozilla
+ 
+diff --git a/widget/src/gtk2/nsWindow.cpp b/widget/src/gtk2/nsWindow.cpp
+index 25f1c2a..8f8cd40 100644
+--- a/widget/src/gtk2/nsWindow.cpp
++++ b/widget/src/gtk2/nsWindow.cpp
+@@ -110,19 +110,10 @@
+ #include "nsIPropertyBag2.h"
+ 
+ #ifdef ACCESSIBILITY
+-#include "nsIAccessibilityService.h"
++#include "nsAccessibilityService.h"
+ #include "nsIAccessibleDocument.h"
+-#include "prenv.h"
+-#include "stdlib.h"
+ 
+ using namespace mozilla;
+-
+-static bool sAccessibilityChecked = false;
+-/* static */
+-bool nsWindow::sAccessibilityEnabled = false;
+-static const char sSysPrefService [] = "@mozilla.org/system-preference-service;1";
+-static const char sAccEnv [] = "GNOME_ACCESSIBILITY";
+-static const char sAccessibilityKey [] = "config.use_system_prefs.accessibility";
+ #endif
+ 
+ /* For SetIcon */
+@@ -1116,9 +1107,8 @@ nsWindow::Show(bool aState)
+     }
+ 
+ #ifdef ACCESSIBILITY
+-    if (aState && sAccessibilityEnabled) {
++    if (aState && a11y::ShouldA11yBeEnabled())
+         CreateRootAccessible();
+-    }
+ #endif
+ 
+     NativeShow(aState);
+@@ -3890,6 +3880,11 @@ nsWindow::Create(nsIWidget        *aParent,
+ 
+     NS_ASSERTION(!mWindowGroup, "already have window group (leaking it)");
+ 
++#ifdef ACCESSIBILITY
++    // Send a DBus message to check whether a11y is enabled
++    a11y::PreInit();
++#endif
++
+     // Ensure that the toolkit is created.
+     nsGTKToolkit::GetToolkit();
+ 
+@@ -4283,33 +4278,6 @@ nsWindow::Create(nsIWidget        *aParent,
+     if (!mIsTopLevel)
+         Resize(mBounds.x, mBounds.y, mBounds.width, mBounds.height, false);
+ 
+-#ifdef ACCESSIBILITY
+-    nsresult rv;
+-    if (!sAccessibilityChecked) {
+-        sAccessibilityChecked = true;
+-
+-        //check if accessibility enabled/disabled by environment variable
+-        const char *envValue = PR_GetEnv(sAccEnv);
+-        if (envValue) {
+-            sAccessibilityEnabled = atoi(envValue) != 0;
+-            LOG(("Accessibility Env %s=%s\n", sAccEnv, envValue));
+-        }
+-        //check gconf-2 setting
+-        else {
+-            nsCOMPtr<nsIPrefBranch> sysPrefService =
+-                do_GetService(sSysPrefService, &rv);
+-            if (NS_SUCCEEDED(rv) && sysPrefService) {
+-
+-                // do the work to get gconf setting.
+-                // will be done soon later.
+-                sysPrefService->GetBoolPref(sAccessibilityKey,
+-                                            &sAccessibilityEnabled);
+-            }
+-
+-        }
+-    }
+-#endif
+-
+ #ifdef MOZ_DFB
+     if (!mDFB) {
+          DirectFBCreate( &mDFB );
+@@ -6517,7 +6485,7 @@ nsWindow::DispatchAccessibleEvent()
+ void
+ nsWindow::DispatchEventToRootAccessible(PRUint32 aEventType)
+ {
+-    if (!sAccessibilityEnabled) {
++    if (!a11y::ShouldA11yBeEnabled()) {
+         return;
+     }
+ 
+diff --git a/widget/src/gtk2/nsWindow.h b/widget/src/gtk2/nsWindow.h
+index a72eca7..577acbf 100644
+--- a/widget/src/gtk2/nsWindow.h
++++ b/widget/src/gtk2/nsWindow.h
+@@ -345,9 +345,6 @@ public:
+ #endif
+     NS_IMETHOD         ReparentNativeWidget(nsIWidget* aNewParent);
+ 
+-#ifdef ACCESSIBILITY
+-    static bool        sAccessibilityEnabled;
+-#endif
+ protected:
+     // Helper for SetParent and ReparentNativeWidget.
+     void ReparentNativeWidgetInternal(nsIWidget* aNewParent,
diff --git a/recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch b/recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch
index 12999ba..69d01f6 100644
--- a/recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch
+++ b/recipes-mozilla/firefox/firefox/iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch
@@ -4,11 +4,11 @@ Subject: Determine which phishing shavar to use depending on
  MOZ_OFFICIAL_BRANDING
 
 ---
- browser/app/Makefile.in                            |    4 ++++
- browser/app/profile/firefox.js                     |    4 ++++
- browser/components/safebrowsing/Makefile.in        |    4 ++++
- .../components/safebrowsing/content/application.js |    4 ++++
- 4 files changed, 16 insertions(+), 0 deletions(-)
+ browser/app/Makefile.in                                |    4 ++++
+ browser/app/profile/firefox.js                         |    4 ++++
+ browser/components/safebrowsing/Makefile.in            |    4 ++++
+ browser/components/safebrowsing/content/application.js |    4 ++++
+ 4 files changed, 16 insertions(+)
 
 diff --git a/browser/app/Makefile.in b/browser/app/Makefile.in
 index 95055cb..a6066f7 100644
@@ -26,7 +26,7 @@ index 95055cb..a6066f7 100644
  libs::
  	$(INSTALL) $(IFLAGS1) $(DIST)/branding/mozicon128.png $(DIST)/bin/icons
 diff --git a/browser/app/profile/firefox.js b/browser/app/profile/firefox.js
-index 42365ee..475a2e6 100644
+index 4f3aac3..7ba75fa 100644
 --- a/browser/app/profile/firefox.js
 +++ b/browser/app/profile/firefox.js
 @@ -742,7 +742,11 @@ pref("urlclassifier.alternate_error_page", "blocked");
diff --git a/recipes-mozilla/firefox/firefox/porting/Add-mips-hppa-ia64-s390-and-sparc-defines-in-ipc-chr.patch b/recipes-mozilla/firefox/firefox/porting/Add-mips-hppa-ia64-s390-and-sparc-defines-in-ipc-chr.patch
deleted file mode 100644
index 92e77ed..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Add-mips-hppa-ia64-s390-and-sparc-defines-in-ipc-chr.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Mon, 25 Apr 2011 11:32:45 +0200
-Subject: Add mips, hppa, ia64, s390 and sparc defines in
- ipc/chromium/src/build/build_config.h
-
----
- ipc/chromium/src/build/build_config.h              |   21 ++++++++++++++++++++
- ipc/chromium/src/chrome/common/ipc_message_utils.h |    2 +-
- 2 files changed, 22 insertions(+), 1 deletions(-)
-
-diff --git a/ipc/chromium/src/build/build_config.h b/ipc/chromium/src/build/build_config.h
-index 2f31021..0952ab1 100644
---- a/ipc/chromium/src/build/build_config.h
-+++ b/ipc/chromium/src/build/build_config.h
-@@ -59,12 +59,33 @@
- #define ARCH_CPU_ARMEL 1
- #define ARCH_CPU_32_BITS 1
- #define WCHAR_T_IS_UNSIGNED 1
-+#elif defined(__powerpc64__)
-+#define ARCH_CPU_PPC64 1
-+#define ARCH_CPU_64_BITS 1
- #elif defined(__ppc__) || defined(__powerpc__)
- #define ARCH_CPU_PPC 1
- #define ARCH_CPU_32_BITS 1
- #elif defined(__sparc64__)
- #define ARCH_CPU_SPARC 1
- #define ARCH_CPU_64_BITS 1
-+#elif defined(__sparc__)
-+#define ARCH_CPU_SPARC 1
-+#define ARCH_CPU_32_BITS 1
-+#elif defined(__mips__)
-+#define ARCH_CPU_MIPS 1
-+#define ARCH_CPU_32_BITS 1
-+#elif defined(__hppa__)
-+#define ARCH_CPU_HPPA 1
-+#define ARCH_CPU_32_BITS 1
-+#elif defined(__ia64__)
-+#define ARCH_CPU_IA64 1
-+#define ARCH_CPU_64_BITS 1
-+#elif defined(__s390x__)
-+#define ARCH_CPU_S390X 1
-+#define ARCH_CPU_64_BITS 1
-+#elif defined(__s390__)
-+#define ARCH_CPU_S390 1
-+#define ARCH_CPU_32_BITS 1
- #else
- #error Please add support for your architecture in build/build_config.h
- #endif
-diff --git a/ipc/chromium/src/chrome/common/ipc_message_utils.h b/ipc/chromium/src/chrome/common/ipc_message_utils.h
-index 59cd722..9e03687 100644
---- a/ipc/chromium/src/chrome/common/ipc_message_utils.h
-+++ b/ipc/chromium/src/chrome/common/ipc_message_utils.h
-@@ -195,7 +195,7 @@ struct ParamTraits<unsigned long long> {
- };
- #endif
- 
--#if !(defined(OS_MACOSX) || defined(OS_OPENBSD) || defined(OS_WIN) || (defined(OS_LINUX) && defined(ARCH_CPU_64_BITS)))
-+#if !(defined(OS_MACOSX) || defined(OS_OPENBSD) || defined(OS_WIN) || (defined(OS_LINUX) && defined(ARCH_CPU_64_BITS)) || defined(ARCH_CPU_S390))
- // There size_t is a synonym for |unsigned long| ...
- template <>
- struct ParamTraits<size_t> {
diff --git a/recipes-mozilla/firefox/firefox/porting/Add-xptcall-support-for-SH4-processors.patch b/recipes-mozilla/firefox/firefox/porting/Add-xptcall-support-for-SH4-processors.patch
index b52eb7d..9e2f26c 100644
--- a/recipes-mozilla/firefox/firefox/porting/Add-xptcall-support-for-SH4-processors.patch
+++ b/recipes-mozilla/firefox/firefox/porting/Add-xptcall-support-for-SH4-processors.patch
@@ -8,7 +8,7 @@ https://bugzilla.mozilla.org/show_bug.cgi?id=382214
  xpcom/reflect/xptcall/src/md/unix/Makefile.in      |   11 +
  .../xptcall/src/md/unix/xptcinvoke_linux_sh.cpp    |  203 +++++++++++++++
  .../xptcall/src/md/unix/xptcstubs_linux_sh.cpp     |  271 ++++++++++++++++++++
- 3 files changed, 485 insertions(+), 0 deletions(-)
+ 3 files changed, 485 insertions(+)
  create mode 100644 xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_sh.cpp
  create mode 100644 xpcom/reflect/xptcall/src/md/unix/xptcstubs_linux_sh.cpp
 
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-680917-Use-a-pool-size-of-16kB-on-ia64-for-bump-.patch b/recipes-mozilla/firefox/firefox/porting/Bug-680917-Use-a-pool-size-of-16kB-on-ia64-for-bump-.patch
deleted file mode 100644
index 10446a2..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Bug-680917-Use-a-pool-size-of-16kB-on-ia64-for-bump-.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From: Jan Horak <jhorak@redhat.com>
-Date: Mon, 29 Aug 2011 10:00:03 +0200
-Subject: Bug 680917 - Use a pool size of 16kB on ia64 for bump pointer
- allocator. r=luke
-
----
- js/src/yarr/BumpPointerAllocator.h |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/js/src/yarr/BumpPointerAllocator.h b/js/src/yarr/BumpPointerAllocator.h
-index a3d6984..50610e2 100644
---- a/js/src/yarr/BumpPointerAllocator.h
-+++ b/js/src/yarr/BumpPointerAllocator.h
-@@ -36,6 +36,8 @@ namespace WTF {
- 
- #if WTF_CPU_SPARC
- #define MINIMUM_BUMP_POOL_SIZE 0x2000
-+#elif WTF_CPU_IA64
-+#define MINIMUM_BUMP_POOL_SIZE 0x4000
- #else
- #define MINIMUM_BUMP_POOL_SIZE 0x1000
- #endif
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-694533-LDRH-STRH-LDRSB-STRSB-are-supported-on-AR.patch b/recipes-mozilla/firefox/firefox/porting/Bug-694533-LDRH-STRH-LDRSB-STRSB-are-supported-on-AR.patch
deleted file mode 100644
index 653dda2..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Bug-694533-LDRH-STRH-LDRSB-STRSB-are-supported-on-AR.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From: Mike Hommey <mh+mozilla@glandium.org>
-Date: Fri, 14 Oct 2011 13:36:04 +0200
-Subject: Bug 694533 - LDRH/STRH/LDRSB/STRSB are supported on ARMv5-
-
----
- js/src/assembler/assembler/ARMAssembler.h |    6 ------
- 1 files changed, 0 insertions(+), 6 deletions(-)
-
-diff --git a/js/src/assembler/assembler/ARMAssembler.h b/js/src/assembler/assembler/ARMAssembler.h
-index 7a512a1..cd0d540 100644
---- a/js/src/assembler/assembler/ARMAssembler.h
-+++ b/js/src/assembler/assembler/ARMAssembler.h
-@@ -205,11 +205,9 @@ namespace JSC {
-             FCMPD = 0x0eb40b40,
-             FSQRTD = 0x0eb10bc0,
-             DTR = 0x05000000,
--#if WTF_ARM_ARCH_VERSION >= 5
-             LDRH = 0x00100090,
-             STRH = 0x00000090,
-             DTRH = 0x00000090,
--#endif
-             STMDB = 0x09200000,
-             LDMIA = 0x08b00000,
-             B = 0x0a000000,
-@@ -597,8 +595,6 @@ namespace JSC {
-                          (posOffset ? DT_UP : 0), rd, rb, offset);
-             } else {
-                 /* All 16 bit ops and 8 bit unsigned use the newer encoding.*/
--                /*these instructions don't exist before ARMv4*/
--                ASSERT(WTF_ARM_ARCH_VERSION >= 4);
-                 emitInst(static_cast<ARMWord>(cc) | DTRH | HDT_IMM | DT_PRE |
-                          (isLoad ? DT_LOAD : 0) |
-                          (size == 16 ? HDT_UH : 0) |
-@@ -637,7 +633,6 @@ namespace JSC {
-                          OP2_OFSREG, rd, rb, rm);
-             } else {
-                 /* All 16 bit ops and 8 bit unsigned use the newer encoding.*/
--                ASSERT(WTF_ARM_ARCH_VERSION >= 4);
-                 emitInst(static_cast<ARMWord>(cc) | DTRH | DT_PRE |
-                          (isLoad ? DT_LOAD : 0) |
-                          (size == 16 ? HDT_UH : 0) |
-@@ -737,7 +732,6 @@ namespace JSC {
-         // Data transfers like this:
-         //  LDRSB rd, [rb, #-offset]
-         //  STRSB rd, [rb, #-offset]
--        // TODO: this instruction does not exist on arm v4 and earlier
-         void dtrsb_d(bool isLoad, int rd, int rb, ARMWord offset, Condition cc = AL)
-         {
-             ASSERT(isLoad); /*can only do signed byte loads, not stores*/
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-696393-Reimplement-NS_InvokeByIndex-in-C-on-S390.patch b/recipes-mozilla/firefox/firefox/porting/Bug-696393-Reimplement-NS_InvokeByIndex-in-C-on-S390.patch
deleted file mode 100644
index d127aea..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Bug-696393-Reimplement-NS_InvokeByIndex-in-C-on-S390.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From: Mike Hommey <mh@glandium.org>
-Date: Fri, 21 Oct 2011 17:57:27 +0200
-Subject: Bug 696393 - Reimplement NS_InvokeByIndex in C on S390 Linux
-
----
- .../xptcall/src/md/unix/xptcinvoke_linux_s390.cpp  |   48 ++++----------------
- 1 files changed, 9 insertions(+), 39 deletions(-)
-
-diff --git a/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390.cpp b/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390.cpp
-index 603df73..03cd0b3 100644
---- a/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390.cpp
-+++ b/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390.cpp
-@@ -200,52 +200,22 @@ invoke_copy_to_stack(PRUint32 paramCount, nsXPTCVariant* s, PRUint32* d_ov, PRUi
-     }
- }
- 
-+typedef nsresult (*vtable_func)(nsISupports *, PRUint32, PRUint32, PRUint32, PRUint32, double, double);
-+
- EXPORT_XPCOM_API(nsresult)
- NS_InvokeByIndex(nsISupports* that, PRUint32 methodIndex,
-                  PRUint32 paramCount, nsXPTCVariant* params)
- {
--    PRUint32 *vtable = *(PRUint32 **)that;
--    PRUint32 method = vtable[methodIndex];
-+    vtable_func *vtable = *reinterpret_cast<vtable_func **>(that);
-+    vtable_func method = vtable[methodIndex];
-     PRUint32 overflow = invoke_count_words (paramCount, params);
--    PRUint32 result;
--
--    __asm__ __volatile__
--    (
--        "lr    7,15\n\t"
--        "ahi   7,-32\n\t"
--
--        "lr    3,%3\n\t"
--        "sll   3,2\n\t"
--        "lcr   3,3\n\t"
--        "l     2,0(15)\n\t"
--        "la    15,0(3,7)\n\t"
--        "st    2,0(15)\n\t"
--
--        "lr    2,%1\n\t"
--        "lr    3,%2\n\t"
--        "la    4,96(15)\n\t"
--        "lr    5,%3\n\t"
--        "basr  14,%4\n\t"
-+    PRUint32 *stack_space = reinterpret_cast<PRUint32 *>(__builtin_alloca((overflow + 8 /* 4 32-bits gpr + 2 64-bits fpr */) * 4));
- 
--        "lr    2,%5\n\t"
--        "ld    0,112(7)\n\t"
--        "ld    2,120(7)\n\t"
--        "lm    3,6,96(7)\n\t"
--        "basr  14,%6\n\t"
-+    invoke_copy_to_stack(paramCount, params, stack_space, overflow);
- 
--        "la    15,32(7)\n\t"
-+    PRUint32 *d_gpr = stack_space + overflow;
-+    double *d_fpr = reinterpret_cast<double *>(d_gpr + 4);
- 
--        "lr    %0,2\n\t"
--        : "=r" (result)
--        : "r" (paramCount),
--          "r" (params),
--          "r" (overflow),
--          "a" (invoke_copy_to_stack),
--          "a" (that),
--          "a" (method)
--        : "2", "3", "4", "5", "6", "7", "14", "cc", "memory", "%f0", "%f2"
--    );
--  
--    return result;
-+    return method(that, d_gpr[0], d_gpr[1], d_gpr[2], d_gpr[3],  d_fpr[0], d_fpr[1]);
- }
- 
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-698923-Don-t-require-16-bytes-alignment-for-VMFr.patch b/recipes-mozilla/firefox/firefox/porting/Bug-698923-Don-t-require-16-bytes-alignment-for-VMFr.patch
index 7cd682a..83907bf 100644
--- a/recipes-mozilla/firefox/firefox/porting/Bug-698923-Don-t-require-16-bytes-alignment-for-VMFr.patch
+++ b/recipes-mozilla/firefox/firefox/porting/Bug-698923-Don-t-require-16-bytes-alignment-for-VMFr.patch
@@ -4,7 +4,7 @@ Subject: Bug 698923 - Don't require 16 bytes alignment for VMFrame on sparc
 
 ---
  js/src/methodjit/MethodJIT.cpp |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/js/src/methodjit/MethodJIT.cpp b/js/src/methodjit/MethodJIT.cpp
 index 4f7f5db..c3d01cb 100644
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-703531-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch b/recipes-mozilla/firefox/firefox/porting/Bug-703531-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch
index fed4d65..509b46a 100644
--- a/recipes-mozilla/firefox/firefox/porting/Bug-703531-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch
+++ b/recipes-mozilla/firefox/firefox/porting/Bug-703531-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch
@@ -4,7 +4,7 @@ Subject: Bug 703531 - Fix ARMAssembler::getOp2RegScale on < ARMv5
 
 ---
  js/src/assembler/assembler/ARMAssembler.cpp |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/js/src/assembler/assembler/ARMAssembler.cpp b/js/src/assembler/assembler/ARMAssembler.cpp
 index 78b8a7d..0458446 100644
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-703534-Fix-build-failure-on-platforms-without-YA.patch b/recipes-mozilla/firefox/firefox/porting/Bug-703534-Fix-build-failure-on-platforms-without-YA.patch
index 94882f7..981e7a7 100644
--- a/recipes-mozilla/firefox/firefox/porting/Bug-703534-Fix-build-failure-on-platforms-without-YA.patch
+++ b/recipes-mozilla/firefox/firefox/porting/Bug-703534-Fix-build-failure-on-platforms-without-YA.patch
@@ -4,10 +4,10 @@ Subject: Bug 703534 - Fix build failure on platforms without YARR JIT
 
 ---
  js/src/jscompartment.cpp |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
+ 1 file changed, 1 deletion(-)
 
 diff --git a/js/src/jscompartment.cpp b/js/src/jscompartment.cpp
-index 3db31a5..c3eada7 100644
+index 721c38e..af5a96e 100644
 --- a/js/src/jscompartment.cpp
 +++ b/js/src/jscompartment.cpp
 @@ -50,7 +50,6 @@
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch b/recipes-mozilla/firefox/firefox/porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch
index 94f8cc8..e4e339e 100644
--- a/recipes-mozilla/firefox/firefox/porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch
+++ b/recipes-mozilla/firefox/firefox/porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch
@@ -5,10 +5,10 @@ Subject: Bug 703833 - Avoid invalid conversion from 'const size_t*' to 'const
 
 ---
  js/src/jsgc.cpp |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/js/src/jsgc.cpp b/js/src/jsgc.cpp
-index e64f3f5..5df2bdd 100644
+index e8818d1..f25f0a5 100644
 --- a/js/src/jsgc.cpp
 +++ b/js/src/jsgc.cpp
 @@ -1052,8 +1052,8 @@ MarkStackRangeConservatively(JSTracer *trc, Value *beginv, Value *endv)
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch b/recipes-mozilla/firefox/firefox/porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch
index dad2617..c687ff4 100644
--- a/recipes-mozilla/firefox/firefox/porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch
+++ b/recipes-mozilla/firefox/firefox/porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch
@@ -4,7 +4,7 @@ Subject: Bug 703842 - Avoid R_SPARC_WDISP22 relocation in TrampolineSparc.s
 
 ---
  js/src/methodjit/TrampolineSparc.s |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/js/src/methodjit/TrampolineSparc.s b/js/src/methodjit/TrampolineSparc.s
 index 0fa9cfd..1b15369 100644
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch b/recipes-mozilla/firefox/firefox/porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch
new file mode 100644
index 0000000..c20e218
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch
@@ -0,0 +1,78 @@
+From: Martin Stransky <stransky@redhat.com>
+Date: Mon, 5 Dec 2011 10:49:56 +0100
+Subject: Bug 706787 - Crash on s390x
+ (nsXPCComponents::AttachNewComponentsObject() fails). r=glandium
+
+---
+ .../xptcall/src/md/unix/xptcinvoke_linux_s390x.cpp |   50 ++++----------------
+ 1 file changed, 9 insertions(+), 41 deletions(-)
+
+diff --git a/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390x.cpp b/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390x.cpp
+index c12482a..ec9dd98 100644
+--- a/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390x.cpp
++++ b/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_linux_s390x.cpp
+@@ -194,55 +194,23 @@ invoke_copy_to_stack(PRUint32 paramCount, nsXPTCVariant* s, PRUint64* d_ov, PRUi
+     }
+ }
+ 
++typedef nsresult (*vtable_func)(nsISupports *, PRUint64, PRUint64, PRUint64, PRUint64, double, double, double, double);
++
+ EXPORT_XPCOM_API(nsresult)
+ NS_InvokeByIndex(nsISupports* that, PRUint32 methodIndex,
+                  PRUint32 paramCount, nsXPTCVariant* params)
+ {
+-    PRUint64 *vtable = *(PRUint64 **)that;
+-    PRUint64 method = vtable[methodIndex];
++    vtable_func *vtable = *reinterpret_cast<vtable_func **>(that);
++    vtable_func method = vtable[methodIndex];
+     PRUint64 overflow = invoke_count_words (paramCount, params);
++    PRUint64 *stack_space = reinterpret_cast<PRUint64 *>(__builtin_alloca((overflow + 8 /* 4 64-bits gpr + 4 64-bits fpr */) * 8));
+     PRUint64 result;
+ 
+-    __asm__ __volatile__
+-    (
+-        "lgr    7,15\n\t"
+-        "aghi   7,-64\n\t"
+-
+-        "lgr    3,%3\n\t"
+-        "sllg   3,3,3\n\t"
+-        "lcgr   3,3\n\t"
+-        "lg     2,0(15)\n\t"
+-        "la     15,0(3,7)\n\t"
+-        "stg    2,0(15)\n\t"
+-
+-        "lgr    2,%1\n\t"
+-        "lgr    3,%2\n\t"
+-        "la     4,160(15)\n\t"
+-        "lgr    5,%3\n\t"
+-        "basr   14,%4\n\t"
+-
+-        "lgr    2,%5\n\t"
+-        "ld     0,192(7)\n\t"
+-        "ld     2,200(7)\n\t"
+-        "ld     4,208(7)\n\t"
+-        "ld     6,216(7)\n\t"
+-        "lmg    3,6,160(7)\n\t"
+-        "basr   14,%6\n\t"
++    invoke_copy_to_stack(paramCount, params, stack_space, overflow);
+ 
+-        "la     15,64(7)\n\t"
++    PRUint64 *d_gpr = stack_space + overflow;
++    double *d_fpr = reinterpret_cast<double *>(d_gpr + 4);
+ 
+-        "lgr    %0,2\n\t"
+-        : "=r" (result)
+-        : "r" ((PRUint64)paramCount),
+-          "r" (params),
+-          "r" (overflow),
+-          "a" (invoke_copy_to_stack),
+-          "a" (that),
+-          "a" (method)
+-        : "2", "3", "4", "5", "6", "7", "14", "cc", "memory",
+-	  "%f0", "%f1", "%f2", "%f3", "%f4", "%f5", "%f6", "%f7"
+-    );
+-  
+-    return result;
++    return method(that, d_gpr[0], d_gpr[1], d_gpr[2], d_gpr[3], d_fpr[0], d_fpr[1], d_fpr[2], d_fpr[3]);
+ }
+ 
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch b/recipes-mozilla/firefox/firefox/porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch
index 5670f82..721caf4 100644
--- a/recipes-mozilla/firefox/firefox/porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch
+++ b/recipes-mozilla/firefox/firefox/porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch
@@ -5,7 +5,7 @@ Subject: Bug 711353 - Add support for GNU/kFreeBSD and GNU/Hurd to
 
 ---
  gfx/angle/src/compiler/osinclude.h |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/gfx/angle/src/compiler/osinclude.h b/gfx/angle/src/compiler/osinclude.h
 index dacdc22..6e84774 100644
diff --git a/recipes-mozilla/firefox/firefox/porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch b/recipes-mozilla/firefox/firefox/porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch
new file mode 100644
index 0000000..ea01a1c
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch
@@ -0,0 +1,40 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Mon, 23 Apr 2012 12:32:10 +0200
+Subject: Bug 747870 - Properly align XPCLazyCallContext::mData. r=bholley
+
+---
+ js/xpconnect/src/xpcprivate.h |   13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/js/xpconnect/src/xpcprivate.h b/js/xpconnect/src/xpcprivate.h
+index d57f66e..ca23216 100644
+--- a/js/xpconnect/src/xpcprivate.h
++++ b/js/xpconnect/src/xpcprivate.h
+@@ -1328,12 +1328,13 @@ public:
+     XPCCallContext &GetXPCCallContext()
+     {
+         if (!mCcx) {
++            XPCCallContext *data = mData.addr();
+             mCcxToDestroy = mCcx =
+-                new (mData) XPCCallContext(mCallerLanguage, mCx,
+-                                           mCallBeginRequest == CALL_BEGINREQUEST,
+-                                           mObj,
+-                                           mFlattenedJSObject, mWrapper,
+-                                           mTearOff);
++                new (data) XPCCallContext(mCallerLanguage, mCx,
++                                          mCallBeginRequest == CALL_BEGINREQUEST,
++                                          mObj,
++                                          mFlattenedJSObject, mWrapper,
++                                          mTearOff);
+             if (!mCcx->IsValid()) {
+                 NS_ERROR("This is not supposed to fail!");
+             }
+@@ -1361,7 +1362,7 @@ private:
+     JSObject *mFlattenedJSObject;
+     XPCWrappedNative *mWrapper;
+     XPCWrappedNativeTearOff *mTearOff;
+-    char mData[sizeof(XPCCallContext)];
++    mozilla::AlignedStorage2<XPCCallContext> mData;
+ };
+ 
+ /***************************************************************************
diff --git a/recipes-mozilla/firefox/firefox/porting/Fix-GNU-non-Linux-failure-to-build-because-of-ipc-ch.patch b/recipes-mozilla/firefox/firefox/porting/Fix-GNU-non-Linux-failure-to-build-because-of-ipc-ch.patch
index 6e251a6..6ef2226 100644
--- a/recipes-mozilla/firefox/firefox/porting/Fix-GNU-non-Linux-failure-to-build-because-of-ipc-ch.patch
+++ b/recipes-mozilla/firefox/firefox/porting/Fix-GNU-non-Linux-failure-to-build-because-of-ipc-ch.patch
@@ -5,7 +5,7 @@ Subject: Fix GNU/non-Linux failure to build because of
 
 ---
  ipc/chromium/src/base/dir_reader_posix.h |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ipc/chromium/src/base/dir_reader_posix.h b/ipc/chromium/src/base/dir_reader_posix.h
 index f591ae0..4b74a08 100644
diff --git a/recipes-mozilla/firefox/firefox/porting/Revert-bz-164580.patch b/recipes-mozilla/firefox/firefox/porting/Revert-bz-164580.patch
deleted file mode 100644
index 2f8ec39..0000000
--- a/recipes-mozilla/firefox/firefox/porting/Revert-bz-164580.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From: Justin Lebar <justin.lebar@gmail.com>
-Date: Fri, 27 May 2011 16:50:37 -0400
-Subject: Revert bz#164580
-
----
- xpcom/glue/nsID.h |   14 +++++++++++---
- 1 files changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/xpcom/glue/nsID.h b/xpcom/glue/nsID.h
-index 26da5d6..de80a33 100644
---- a/xpcom/glue/nsID.h
-+++ b/xpcom/glue/nsID.h
-@@ -73,10 +73,18 @@ struct nsID {
-    */
- 
-   inline PRBool Equals(const nsID& other) const {
--    // First cast to void* in order to silence the alignment warnings.
-+    // One would think that this could be done faster with a really
-+    // efficient implementation of memcmp(), but evidently no
-+    // memcmp()'s out there are better than this code.
-+    //
-+    // See bug http://bugzilla.mozilla.org/show_bug.cgi?id=164580 for
-+    // details.
-+
-     return
--      ((PRUint64*)(void*) &m0)[0] == ((PRUint64*)(void*) &other.m0)[0] &&
--      ((PRUint64*)(void*) &m0)[1] == ((PRUint64*)(void*) &other.m0)[1];
-+      ((((PRUint32*) &m0)[0] == ((PRUint32*) &other.m0)[0]) &&
-+       (((PRUint32*) &m0)[1] == ((PRUint32*) &other.m0)[1]) &&
-+       (((PRUint32*) &m0)[2] == ((PRUint32*) &other.m0)[2]) &&
-+       (((PRUint32*) &m0)[3] == ((PRUint32*) &other.m0)[3]));
-   }
- 
-   /**
diff --git a/recipes-mozilla/firefox/firefox/prefs/Don-t-auto-disable-extensions-in-system-directories.patch b/recipes-mozilla/firefox/firefox/prefs/Don-t-auto-disable-extensions-in-system-directories.patch
new file mode 100644
index 0000000..f01ac83
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/prefs/Don-t-auto-disable-extensions-in-system-directories.patch
@@ -0,0 +1,21 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Fri, 17 Feb 2012 17:47:15 +0100
+Subject: Don't auto-disable extensions in system directories
+
+---
+ browser/app/profile/firefox.js |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/browser/app/profile/firefox.js b/browser/app/profile/firefox.js
+index 3d979c2..6d72e8d 100644
+--- a/browser/app/profile/firefox.js
++++ b/browser/app/profile/firefox.js
+@@ -88,7 +88,7 @@ pref("extensions.hotfix.certs.1.sha1Fingerprint", "CA:C4:7D:BF:63:4D:24:E9:DC:93
+ // Disable add-ons installed into the shared user and shared system areas by
+ // default. This does not include the application directory. See the SCOPE
+ // constants in AddonManager.jsm for values to use here
+-pref("extensions.autoDisableScopes", 15);
++pref("extensions.autoDisableScopes", 3);
+ 
+ // Dictionary download preference
+ pref("browser.dictionaries.download.url", "https://addons.mozilla.org/%LOCALE%/firefox/dictionaries/");
diff --git a/recipes-mozilla/firefox/firefox/prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch b/recipes-mozilla/firefox/firefox/prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch
index b1578c6..773b61a 100644
--- a/recipes-mozilla/firefox/firefox/prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch
+++ b/recipes-mozilla/firefox/firefox/prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch
@@ -5,7 +5,7 @@ Subject: Enable intl.locale.matchOS, and report the locale correctly
 https://bugzilla.mozilla.org/show_bug.cgi?id=331779
 ---
  xulrunner/app/xulrunner.js |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/xulrunner/app/xulrunner.js b/xulrunner/app/xulrunner.js
 index 880593c..0a0f5a9 100644
diff --git a/recipes-mozilla/firefox/firefox/prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch b/recipes-mozilla/firefox/firefox/prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch
index d78b300..68034fc 100644
--- a/recipes-mozilla/firefox/firefox/prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch
+++ b/recipes-mozilla/firefox/firefox/prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch
@@ -6,10 +6,10 @@ It is better defined in the GRE provided by xulrunner-1.9
 ---
  browser/app/profile/firefox.js        |    1 -
  browser/locales/en-US/firefox-l10n.js |    1 -
- 2 files changed, 0 insertions(+), 2 deletions(-)
+ 2 files changed, 2 deletions(-)
 
 diff --git a/browser/app/profile/firefox.js b/browser/app/profile/firefox.js
-index 475a2e6..218799d 100644
+index 4f3aac3..3d979c2 100644
 --- a/browser/app/profile/firefox.js
 +++ b/browser/app/profile/firefox.js
 @@ -229,7 +229,6 @@ pref("keyword.enabled", true);
diff --git a/recipes-mozilla/firefox/firefox/prefs/Set-DPI-to-system-settings.patch b/recipes-mozilla/firefox/firefox/prefs/Set-DPI-to-system-settings.patch
index 6176c29..9058cd4 100644
--- a/recipes-mozilla/firefox/firefox/prefs/Set-DPI-to-system-settings.patch
+++ b/recipes-mozilla/firefox/firefox/prefs/Set-DPI-to-system-settings.patch
@@ -4,13 +4,13 @@ Subject: Set DPI to system settings
 
 ---
  modules/libpref/src/init/all.js |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/modules/libpref/src/init/all.js b/modules/libpref/src/init/all.js
-index 5dc3608..7b71cb4 100644
+index 3c0a70c..10b82bb 100644
 --- a/modules/libpref/src/init/all.js
 +++ b/modules/libpref/src/init/all.js
-@@ -1391,7 +1391,7 @@ pref("layout.css.visited_links_enabled", true);
+@@ -1397,7 +1397,7 @@ pref("layout.css.visited_links_enabled", true);
  // A value of 0 means use the system DPI. A positive value is used as the DPI.
  // This sets the physical size of a device pixel and thus controls the
  // interpretation of physical units such as "pt".
diff --git a/recipes-mozilla/firefox/firefox/prefs/Set-javascript.options.showInConsole.patch b/recipes-mozilla/firefox/firefox/prefs/Set-javascript.options.showInConsole.patch
index a91a67d..cee79cf 100644
--- a/recipes-mozilla/firefox/firefox/prefs/Set-javascript.options.showInConsole.patch
+++ b/recipes-mozilla/firefox/firefox/prefs/Set-javascript.options.showInConsole.patch
@@ -4,13 +4,13 @@ Subject: Set javascript.options.showInConsole
 
 ---
  modules/libpref/src/init/all.js |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
+ 1 file changed, 1 insertion(+)
 
 diff --git a/modules/libpref/src/init/all.js b/modules/libpref/src/init/all.js
-index e7670c7..5dc3608 100644
+index e8160c2..3c0a70c 100644
 --- a/modules/libpref/src/init/all.js
 +++ b/modules/libpref/src/init/all.js
-@@ -625,6 +625,7 @@ pref("javascript.options.strict",           false);
+@@ -627,6 +627,7 @@ pref("javascript.options.strict",           false);
  pref("javascript.options.strict.debug",     true);
  #endif
  pref("javascript.options.relimit",          true);
diff --git a/recipes-mozilla/firefox/firefox/vendor.js b/recipes-mozilla/firefox/firefox/vendor.js
index 3717a09..5de0eb8 100644
--- a/recipes-mozilla/firefox/firefox/vendor.js
+++ b/recipes-mozilla/firefox/firefox/vendor.js
@@ -1,4 +1,6 @@
 pref("general.useragent.compatMode.firefox", true);
+pref("distribution.searchplugins.defaultLocale", "en-US");
+// Forbid application updates
 lockPref("app.update.enabled", false);
 lockPref("extensions.update.enabled", false);
 lockPref("extensions.autoDisableScopes", 10);
diff --git a/recipes-mozilla/firefox/firefox_10.0.2.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
similarity index 74%
rename from recipes-mozilla/firefox/firefox_10.0.2.bb
rename to recipes-mozilla/firefox/firefox_10.0.11esr.bb
index ab9d566..0774bb7 100644
--- a/recipes-mozilla/firefox/firefox_10.0.2.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
@@ -1,11 +1,12 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
 DESCRIPTION ?= "Browser made by mozilla"
 DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx virtual/libgl"
 
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=9cb02f27e77e702043b827c9418bfbf8"
 
-PR = "r4"
-
 SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
            file://mozilla-${PN}.png \
            file://mozilla-${PN}.desktop \
@@ -13,9 +14,23 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/f
            file://fixes/Avoid-spurious-Run-items-in-application-handlers-con.patch \
            file://fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch \
            file://fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch \
-           file://fixes/Bug-703633-TreePanel.jsm-uses-a-resource-url-that-ou.patch \
            file://fixes/Bug-691898-Use-YARR-interpreter-instead-of-PCRE-on-p.patch \
            file://fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch \
+           file://fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch \
+           file://fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch \
+           file://fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch \
+           file://fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch \
+           file://fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch \
+           file://fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch \
+           file://fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch \
+           file://fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch \
+           file://fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch \
+           file://fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch \
+           file://fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch \
+           file://fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch \
+           file://fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch \
+           file://fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch \
+           file://fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch \
            file://iceweasel-branding/Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.propertie.patch \
            file://iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch \
            file://porting/Add-xptcall-support-for-SH4-processors.patch \
@@ -28,10 +43,13 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/f
            file://porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch \
            file://porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch \
            file://porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch \
+           file://porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch \
+           file://porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch \
            file://prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch \
            file://prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch \
            file://prefs/Set-javascript.options.showInConsole.patch \
            file://prefs/Set-DPI-to-system-settings.patch \
+           file://prefs/Don-t-auto-disable-extensions-in-system-directories.patch \
            file://debian-hacks/Check-less-things-during-configure-when-using-libxul.patch \
            file://debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch \
            file://debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch \
@@ -50,15 +68,17 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/f
            file://debian-hacks/pkg-config-files-don-t-need-to-require-the-version-o.patch \
            file://debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch \
            file://debian-hacks/Fix-tracejit-to-build-against-nanojit-headers-in-dis.patch \
+           file://debian-hacks/Load-distribution-search-plugins-from-etc-appname-se.patch \
+           file://debian-hacks/Handle-transition-to-etc-appname-searchplugins-more-.patch \
+           file://debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch \
            file://configure.patch \
            file://powerpc_va_list.patch \
-           file://vendor.js \
-           file://firefox.gcc-4.7.patch"
+           file://vendor.js"
 
-SRC_URI[archive.md5sum] = "5ce038d591964f72c534fa33b75a62f5"
-SRC_URI[archive.sha256sum] = "6ec5feba56f180a6fbf437a68cf0c77146ade28b936e5187573e3d95f13a0449"
+SRC_URI[archive.md5sum] = "2f0e3a1dd7480e03f374c0121b4155e2"
+SRC_URI[archive.sha256sum] = "94b4d5a339d97dc56fd349f93407c3af4f408a4a8409a64e3680d564d37594f8"
 
-S = "${WORKDIR}/mozilla-release"
+S = "${WORKDIR}/mozilla-esr10"
 
 inherit mozilla
 
-- 
1.7.2.5




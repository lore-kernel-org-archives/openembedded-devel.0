Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJuj2-00030i-HF
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:39:54 +0200
Received: by mail-px0-f175.google.com with SMTP id 14so2440803pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=1Jv/WlnIfJyPast+IfsqLIdAcI83PSRlgP9L9dViunI=;
	b=r71Z2IV8DCDU87vnFNEyDsk8LnlM/dhzjUcj+zB88dsVJIvrWaZCD1mWL/oQz73I4d
	F74fPuH+JM3xQ7Z5xvD391pKdR0W2w0hxurZOnvUM58C0VQlEmUZUohBeZNTQLTklrxz
	PxIHnzK5kCobEmyQ47Le5UdRGheLrkIhXb6lY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cXRPoHPWVjGpLuf8t1FWzEWqpmidk+DZGw0w06Y9IkrELwL0UNWwXBnkdeAzi8CyQz
	IS8NbTbAtijC1Z8b46GqPEt6AYEKCJIppC2hba5n/amEqf0yiiLxt1sgIDt9jogD8twM
	0W72YP2EA/xmgaBTYrPKRd0B8XvHLETWiyREM=
Received: by 10.142.250.21 with SMTP id x21mr5393819wfh.263.1275510931277;
	Wed, 02 Jun 2010 13:35:31 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:45 -0700
Message-Id: <1275510896-30845-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 05/16] libiconv-1.13.1: Add recipes
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
X-List-Received-Date: Wed, 02 Jun 2010 20:39:54 -0000

* Get rid of old style staging.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/libiconv/libiconv-1.13.1/autoconf.patch |  834 +++++++++++++++++++++++
 recipes/libiconv/libiconv.inc                   |   15 +-
 recipes/libiconv/libiconv_1.12.bb               |   10 +
 recipes/libiconv/libiconv_1.13.1.bb             |   24 +
 4 files changed, 870 insertions(+), 13 deletions(-)
 create mode 100644 recipes/libiconv/libiconv-1.13.1/autoconf.patch
 create mode 100644 recipes/libiconv/libiconv_1.13.1.bb

diff --git a/recipes/libiconv/libiconv-1.13.1/autoconf.patch b/recipes/libiconv/libiconv-1.13.1/autoconf.patch
new file mode 100644
index 0000000..1c0efbf
--- /dev/null
+++ b/recipes/libiconv/libiconv-1.13.1/autoconf.patch
@@ -0,0 +1,834 @@
+Index: libiconv-1.13.1/configure.ac
+===================================================================
+--- libiconv-1.13.1.orig/configure.ac	2009-06-30 13:48:03.000000000 -0700
++++ libiconv-1.13.1/configure.ac	2010-06-01 02:57:31.301726190 -0700
+@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR([build-aux])
+ AM_INIT_AUTOMAKE([libiconv], [1.13.1])
+ AC_CONFIG_HEADERS([config.h lib/config.h])
+ AC_PROG_MAKE_SET
+-
++AC_CONFIG_MACRO_DIR([m4])
+ dnl           checks for basic programs
+ 
+ AC_PROG_CC
+Index: libiconv-1.13.1/libcharset/configure.ac
+===================================================================
+--- libiconv-1.13.1.orig/libcharset/configure.ac	2009-06-21 04:17:33.000000000 -0700
++++ libiconv-1.13.1/libcharset/configure.ac	2010-06-01 02:57:31.301726190 -0700
+@@ -16,17 +16,17 @@ dnl along with the GNU CHARSET Library; 
+ dnl write to the Free Software Foundation, Inc., 51 Franklin Street,
+ dnl Fifth Floor, Boston, MA 02110-1301, USA.
+ 
+-AC_PREREQ([2.13])
++AC_PREREQ(2.61)
++AC_INIT([libcharset],[1.4] )
++AC_CONFIG_SRCDIR([lib/localcharset.c])
+ 
+-PACKAGE=libcharset
+-VERSION=1.4
+-
+-AC_INIT([lib/localcharset.c])
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_HEADER([config.h])
+ AC_PROG_MAKE_SET
+-AC_SUBST([PACKAGE])
+-AC_SUBST([VERSION])
++dnl AC_SUBST(PACKAGE)
++dnl AC_SUBST(VERSION)
++
++AC_CONFIG_MACRO_DIR([m4])
+ 
+ dnl           checks for basic programs
+ 
+Index: libiconv-1.13.1/libcharset/m4/libtool.m4
+===================================================================
+--- libiconv-1.13.1.orig/libcharset/m4/libtool.m4	2009-06-21 04:17:33.000000000 -0700
++++ libiconv-1.13.1/libcharset/m4/libtool.m4	2010-06-01 02:57:31.301726190 -0700
+@@ -89,7 +89,8 @@ _LT_SET_OPTIONS([$0], [$1])
+ LIBTOOL_DEPS="$ltmain"
+ 
+ # Always use our own libtool.
+-LIBTOOL="${CONFIG_SHELL-$SHELL} "'$(top_builddir)/libtool'
++LIBTOOL='$(SHELL) $(top_builddir)'
++LIBTOOL="$LIBTOOL/$host_alias-libtool"
+ AC_SUBST(LIBTOOL)dnl
+ 
+ _LT_SETUP
+@@ -211,7 +212,7 @@ delay_single_quote_subst='s/'\''/'\'\\\\
+ no_glob_subst='s/\*/\\\*/g'
+ 
+ # Global variables:
+-ofile=libtool
++ofile=${host_alias}-libtool
+ can_build_shared=yes
+ 
+ # All known linkers require a `.a' archive for static linking (except MSVC,
+@@ -380,12 +381,12 @@ m4_define([lt_decl_dquote_varnames],
+ # lt_decl_varnames_tagged([SEPARATOR], [VARNAME1...])
+ # ---------------------------------------------------
+ m4_define([lt_decl_varnames_tagged],
+-[m4_assert([$# <= 2])dnl
+-_$0(m4_quote(m4_default([$1], [[, ]])),
+-    m4_ifval([$2], [[$2]], [m4_dquote(lt_decl_tag_varnames)]),
+-    m4_split(m4_normalize(m4_quote(_LT_TAGS)), [ ]))])
+-m4_define([_lt_decl_varnames_tagged],
+-[m4_ifval([$3], [lt_combine([$1], [$2], [_], $3)])])
++[_$0(m4_quote(m4_default([$1], [[, ]])),
++     m4_quote(m4_if([$2], [],
++		     m4_quote(lt_decl_tag_varnames),
++		  m4_quote(m4_shift($@)))),
++     m4_split(m4_normalize(m4_quote(_LT_TAGS))))])
++m4_define([_lt_decl_varnames_tagged], [lt_combine([$1], [$2], [_], $3)])
+ 
+ 
+ # lt_decl_all_varnames([SEPARATOR], [VARNAME1...])
+@@ -990,11 +991,7 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
+   _LT_TAGVAR(whole_archive_flag_spec, $1)=''
+   _LT_TAGVAR(link_all_deplibs, $1)=yes
+   _LT_TAGVAR(allow_undefined_flag, $1)="$_lt_dar_allow_undefined"
+-  case $cc_basename in
+-     ifort*) _lt_dar_can_shared=yes ;;
+-     *) _lt_dar_can_shared=$GCC ;;
+-  esac
+-  if test "$_lt_dar_can_shared" = "yes"; then
++  if test "$GCC" = "yes"; then
+     output_verbose_link_cmd=echo
+     _LT_TAGVAR(archive_cmds, $1)="\$CC -dynamiclib \$allow_undefined_flag -o \$lib \$libobjs \$deplibs \$compiler_flags -install_name \$rpath/\$soname \$verstring $_lt_dar_single_mod${_lt_dsymutil}"
+     _LT_TAGVAR(module_cmds, $1)="\$CC \$allow_undefined_flag -o \$lib -bundle \$libobjs \$deplibs \$compiler_flags${_lt_dsymutil}"
+@@ -1516,7 +1513,7 @@ AC_CACHE_VAL([lt_cv_sys_max_cmd_len], [d
+     lt_cv_sys_max_cmd_len=-1;
+     ;;
+ 
+-  cygwin* | mingw* | cegcc*)
++  cygwin* | mingw*)
+     # On Win9x/ME, this test blows up -- it succeeds, but takes
+     # about 5 minutes as the teststring grows exponentially.
+     # Worse, since 9x/ME are not pre-emptively multitasking,
+@@ -1684,6 +1681,10 @@ else
+ #  endif
+ #endif
+ 
++#ifdef __cplusplus
++extern "C" void exit (int);
++#endif
++
+ void fnord() { int i=42;}
+ int main ()
+ {
+@@ -1699,7 +1700,7 @@ int main ()
+   else
+     puts (dlerror ());
+ 
+-  return status;
++    exit (status);
+ }]
+ _LT_EOF
+   if AC_TRY_EVAL(ac_link) && test -s conftest${ac_exeext} 2>/dev/null; then
+@@ -1738,7 +1739,7 @@ else
+     lt_cv_dlopen_self=yes
+     ;;
+ 
+-  mingw* | pw32* | cegcc*)
++  mingw* | pw32*)
+     lt_cv_dlopen="LoadLibrary"
+     lt_cv_dlopen_libs=
+     ;;
+@@ -2035,7 +2036,6 @@ m4_defun([_LT_SYS_DYNAMIC_LINKER],
+ [AC_REQUIRE([AC_CANONICAL_HOST])dnl
+ m4_require([_LT_DECL_EGREP])dnl
+ m4_require([_LT_FILEUTILS_DEFAULTS])dnl
+-m4_require([_LT_DECL_OBJDUMP])dnl
+ m4_require([_LT_DECL_SED])dnl
+ AC_MSG_CHECKING([dynamic linker characteristics])
+ m4_if([$1],
+@@ -2200,14 +2200,14 @@ bsdi[[45]]*)
+   # libtool to hard-code these into programs
+   ;;
+ 
+-cygwin* | mingw* | pw32* | cegcc*)
++cygwin* | mingw* | pw32*)
+   version_type=windows
+   shrext_cmds=".dll"
+   need_version=no
+   need_lib_prefix=no
+ 
+   case $GCC,$host_os in
+-  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
++  yes,cygwin* | yes,mingw* | yes,pw32*)
+     library_names_spec='$libname.dll.a'
+     # DLL is installed to $(libdir)/../bin by postinstall_cmds
+     postinstall_cmds='base_file=`basename \${file}`~
+@@ -2230,7 +2230,7 @@ cygwin* | mingw* | pw32* | cegcc*)
+       soname_spec='`echo ${libname} | sed -e 's/^lib/cyg/'``echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
+       sys_lib_search_path_spec="/usr/lib /lib/w32api /lib /usr/local/lib"
+       ;;
+-    mingw* | cegcc*)
++    mingw*)
+       # MinGW DLLs use traditional 'lib' prefix
+       soname_spec='${libname}`echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
+       sys_lib_search_path_spec=`$CC -print-search-dirs | $GREP "^libraries:" | $SED -e "s/^libraries://" -e "s,=/,/,g"`
+@@ -2656,7 +2656,7 @@ tpf*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no
+-  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
++  library_name_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
+   shlibpath_var=LD_LIBRARY_PATH
+   shlibpath_overrides_runpath=no
+   hardcode_into_libs=yes
+@@ -2957,7 +2957,6 @@ _LT_DECL([], [reload_cmds], [2])dnl
+ #  -- PORTME fill in with the dynamic library characteristics
+ m4_defun([_LT_CHECK_MAGIC_METHOD],
+ [m4_require([_LT_DECL_EGREP])
+-m4_require([_LT_DECL_OBJDUMP])
+ AC_CACHE_CHECK([how to recognize dependent libraries],
+ lt_cv_deplibs_check_method,
+ [lt_cv_file_magic_cmd='$MAGIC_CMD'
+@@ -3008,12 +3007,6 @@ mingw* | pw32*)
+   fi
+   ;;
+ 
+-cegcc)
+-  # use the weaker test based on 'objdump'. See mingw*.
+-  lt_cv_deplibs_check_method='file_magic file format pe-arm-.*little(.*architecture: arm)?'
+-  lt_cv_file_magic_cmd='$OBJDUMP -f'
+-  ;;
+-
+ darwin* | rhapsody*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+@@ -3325,7 +3318,7 @@ case $host_os in
+ aix*)
+   symcode='[[BCDT]]'
+   ;;
+-cygwin* | mingw* | pw32* | cegcc*)
++cygwin* | mingw* | pw32*)
+   symcode='[[ABCDGISTW]]'
+   ;;
+ hpux*)
+@@ -3571,7 +3564,7 @@ m4_if([$1], [CXX], [
+     beos* | irix5* | irix6* | nonstopux* | osf3* | osf4* | osf5*)
+       # PIC is the default for these OSes.
+       ;;
+-    mingw* | cygwin* | os2* | pw32* | cegcc*)
++    mingw* | cygwin* | os2* | pw32*)
+       # This hack is so that the source file can tell whether it is being
+       # built for inclusion in a dll (and should export symbols for example).
+       # Although the cygwin gcc ignores -fPIC, still need this for old-style
+@@ -3598,11 +3591,10 @@ m4_if([$1], [CXX], [
+       fi
+       ;;
+     hpux*)
+-      # PIC is the default for 64-bit PA HP-UX, but not for 32-bit
+-      # PA HP-UX.  On IA64 HP-UX, PIC is the default but the pic flag
+-      # sets the default TLS model and affects inlining.
++      # PIC is the default for IA64 HP-UX and 64-bit HP-UX, but
++      # not for PA HP-UX.
+       case $host_cpu in
+-      hppa*64*)
++      hppa*64*|ia64*)
+ 	;;
+       *)
+ 	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
+@@ -3700,19 +3692,12 @@ m4_if([$1], [CXX], [
+ 	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='--backend -Wl,'
+ 	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
+ 	    ;;
+-	  ecpc* )
+-	    # old Intel C++ for x86_64 which still supported -KPIC.
++	  icpc* | ecpc* )
++	    # Intel C++
+ 	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+ 	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
+ 	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-static'
+ 	    ;;
+-	  icpc* )
+-	    # Intel C++, used to be incompatible with GCC.
+-	    # ICC 10 doesn't accept -KPIC any more.
+-	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+-	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
+-	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-static'
+-	    ;;
+ 	  pgCC* | pgcpp*)
+ 	    # Portland Group C++ compiler
+ 	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+@@ -3878,7 +3863,7 @@ m4_if([$1], [CXX], [
+       # PIC is the default for these OSes.
+       ;;
+ 
+-    mingw* | cygwin* | pw32* | os2* | cegcc*)
++    mingw* | cygwin* | pw32* | os2*)
+       # This hack is so that the source file can tell whether it is being
+       # built for inclusion in a dll (and should export symbols for example).
+       # Although the cygwin gcc ignores -fPIC, still need this for old-style
+@@ -3894,11 +3879,10 @@ m4_if([$1], [CXX], [
+       ;;
+ 
+     hpux*)
+-      # PIC is the default for 64-bit PA HP-UX, but not for 32-bit
+-      # PA HP-UX.  On IA64 HP-UX, PIC is the default but the pic flag
+-      # sets the default TLS model and affects inlining.
++      # PIC is the default for IA64 HP-UX and 64-bit HP-UX, but
++      # not for PA HP-UX.
+       case $host_cpu in
+-      hppa*64*)
++      hppa*64*|ia64*)
+ 	# +Z the default
+ 	;;
+       *)
+@@ -3948,7 +3932,7 @@ m4_if([$1], [CXX], [
+       fi
+       ;;
+ 
+-    mingw* | cygwin* | pw32* | os2* | cegcc*)
++    mingw* | cygwin* | pw32* | os2*)
+       # This hack is so that the source file can tell whether it is being
+       # built for inclusion in a dll (and should export symbols for example).
+       m4_if([$1], [GCJ], [],
+@@ -3979,25 +3963,11 @@ m4_if([$1], [CXX], [
+ 
+     linux* | k*bsd*-gnu)
+       case $cc_basename in
+-      # old Intel for x86_64 which still supported -KPIC.
+-      ecc*)
++      icc* | ecc* | ifort*)
+ 	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+ 	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
+ 	_LT_TAGVAR(lt_prog_compiler_static, $1)='-static'
+         ;;
+-      # icc used to be incompatible with GCC.
+-      # ICC 10 doesn't accept -KPIC any more.
+-      icc* | ifort*)
+-	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+-	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
+-	_LT_TAGVAR(lt_prog_compiler_static, $1)='-static'
+-        ;;
+-      # Lahey Fortran 8.1.
+-      lf95*)
+-	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+-	_LT_TAGVAR(lt_prog_compiler_pic, $1)='--shared'
+-	_LT_TAGVAR(lt_prog_compiler_static, $1)='--static'
+-	;;
+       pgcc* | pgf77* | pgf90* | pgf95*)
+         # Portland Group compilers (*not* the Pentium gcc compiler,
+ 	# which looks to be a dead project)
+@@ -4179,7 +4149,7 @@ m4_if([$1], [CXX], [
+   pw32*)
+     _LT_TAGVAR(export_symbols_cmds, $1)="$ltdll_cmds"
+   ;;
+-  cygwin* | mingw* | cegcc*)
++  cygwin* | mingw*)
+     _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[[BCDGRS]][[ ]]/s/.*[[ ]]\([[^ ]]*\)/\1 DATA/;/^.*[[ ]]__nm__/s/^.*[[ ]]__nm__\([[^ ]]*\)[[ ]][[^ ]]*/\1 DATA/;/^I[[ ]]/d;/^[[AITW]][[ ]]/s/.* //'\'' | sort | uniq > $export_symbols'
+   ;;
+   *)
+@@ -4231,7 +4201,7 @@ dnl Note also adjust exclude_expsyms for
+   extract_expsyms_cmds=
+ 
+   case $host_os in
+-  cygwin* | mingw* | pw32* | cegcc*)
++  cygwin* | mingw* | pw32*)
+     # FIXME: the MSVC++ port hasn't been tested in a loooong time
+     # When not using gcc, we currently assume that we are using
+     # Microsoft Visual C++.
+@@ -4318,7 +4288,7 @@ _LT_EOF
+       fi
+       ;;
+ 
+-    cygwin* | mingw* | pw32* | cegcc*)
++    cygwin* | mingw* | pw32*)
+       # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually meaningless,
+       # as there is no search path for DLLs.
+       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
+@@ -4384,9 +4354,6 @@ _LT_EOF
+ 	  tmp_addflag=' -i_dynamic -nofor_main' ;;
+ 	ifc* | ifort*)			# Intel Fortran compiler
+ 	  tmp_addflag=' -nofor_main' ;;
+-	lf95*)				# Lahey Fortran 8.1
+-	  _LT_TAGVAR(whole_archive_flag_spec, $1)=
+-	  tmp_sharedflag='--shared' ;;
+ 	xl[[cC]]*)			# IBM XL C 8.0 on PPC (deal with xlf below)
+ 	  tmp_sharedflag='-qmkshrobj'
+ 	  tmp_addflag= ;;
+@@ -4618,7 +4585,6 @@ _LT_EOF
+ 	fi
+       fi
+ 
+-      _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-bexpall'
+       # It seems that -bexpall does not export symbols beginning with
+       # underscore (_), so it is better to generate a list of symbols to export.
+       _LT_TAGVAR(always_export_symbols, $1)=yes
+@@ -4673,7 +4639,7 @@ _LT_EOF
+       _LT_TAGVAR(export_dynamic_flag_spec, $1)=-rdynamic
+       ;;
+ 
+-    cygwin* | mingw* | pw32* | cegcc*)
++    cygwin* | mingw* | pw32*)
+       # When not using gcc, we currently assume that we are using
+       # Microsoft Visual C++.
+       # hardcode_libdir_flag_spec is actually meaningless, as there is
+@@ -4777,7 +4743,7 @@ _LT_EOF
+ 	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+ 	  ;;
+ 	ia64*)
+-	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
++	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
+ 	  ;;
+ 	*)
+ 	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
+@@ -5562,7 +5528,6 @@ if test "$_lt_caught_CXX_error" != yes; 
+           fi
+         fi
+ 
+-        _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-bexpall'
+         # It seems that -bexpall does not export symbols beginning with
+         # underscore (_), so it is better to generate a list of symbols to
+ 	# export.
+@@ -5621,7 +5586,7 @@ if test "$_lt_caught_CXX_error" != yes; 
+         esac
+         ;;
+ 
+-      cygwin* | mingw* | pw32* | cegcc*)
++      cygwin* | mingw* | pw32*)
+         # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually meaningless,
+         # as there is no search path for DLLs.
+         _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
+@@ -7006,18 +6971,6 @@ AC_SUBST([GREP])
+ ])
+ 
+ 
+-# _LT_DECL_OBJDUMP
+-# --------------
+-# If we don't have a new enough Autoconf to choose the best objdump
+-# available, choose the one first in the user's PATH.
+-m4_defun([_LT_DECL_OBJDUMP],
+-[AC_CHECK_TOOL(OBJDUMP, objdump, false)
+-test -z "$OBJDUMP" && OBJDUMP=objdump
+-_LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
+-AC_SUBST([OBJDUMP])
+-])
+-
+-
+ # _LT_DECL_SED
+ # ------------
+ # Check for a fully-functional sed program, that truncates
+Index: libiconv-1.13.1/m4/libtool.m4
+===================================================================
+--- libiconv-1.13.1.orig/m4/libtool.m4	2009-06-21 04:17:33.000000000 -0700
++++ libiconv-1.13.1/m4/libtool.m4	2010-06-01 02:57:31.301726190 -0700
+@@ -89,7 +89,8 @@ _LT_SET_OPTIONS([$0], [$1])
+ LIBTOOL_DEPS="$ltmain"
+ 
+ # Always use our own libtool.
+-LIBTOOL="${CONFIG_SHELL-$SHELL} "'$(top_builddir)/libtool'
++LIBTOOL='$(SHELL) $(top_builddir)'
++LIBTOOL="$LIBTOOL/$host_alias-libtool"
+ AC_SUBST(LIBTOOL)dnl
+ 
+ _LT_SETUP
+@@ -211,7 +212,7 @@ delay_single_quote_subst='s/'\''/'\'\\\\
+ no_glob_subst='s/\*/\\\*/g'
+ 
+ # Global variables:
+-ofile=libtool
++ofile=${host_alias}-libtool
+ can_build_shared=yes
+ 
+ # All known linkers require a `.a' archive for static linking (except MSVC,
+@@ -380,12 +381,12 @@ m4_define([lt_decl_dquote_varnames],
+ # lt_decl_varnames_tagged([SEPARATOR], [VARNAME1...])
+ # ---------------------------------------------------
+ m4_define([lt_decl_varnames_tagged],
+-[m4_assert([$# <= 2])dnl
+-_$0(m4_quote(m4_default([$1], [[, ]])),
+-    m4_ifval([$2], [[$2]], [m4_dquote(lt_decl_tag_varnames)]),
+-    m4_split(m4_normalize(m4_quote(_LT_TAGS)), [ ]))])
+-m4_define([_lt_decl_varnames_tagged],
+-[m4_ifval([$3], [lt_combine([$1], [$2], [_], $3)])])
++[_$0(m4_quote(m4_default([$1], [[, ]])),
++     m4_quote(m4_if([$2], [],
++		     m4_quote(lt_decl_tag_varnames),
++		  m4_quote(m4_shift($@)))),
++     m4_split(m4_normalize(m4_quote(_LT_TAGS))))])
++m4_define([_lt_decl_varnames_tagged], [lt_combine([$1], [$2], [_], $3)])
+ 
+ 
+ # lt_decl_all_varnames([SEPARATOR], [VARNAME1...])
+@@ -990,11 +991,7 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
+   _LT_TAGVAR(whole_archive_flag_spec, $1)=''
+   _LT_TAGVAR(link_all_deplibs, $1)=yes
+   _LT_TAGVAR(allow_undefined_flag, $1)="$_lt_dar_allow_undefined"
+-  case $cc_basename in
+-     ifort*) _lt_dar_can_shared=yes ;;
+-     *) _lt_dar_can_shared=$GCC ;;
+-  esac
+-  if test "$_lt_dar_can_shared" = "yes"; then
++  if test "$GCC" = "yes"; then
+     output_verbose_link_cmd=echo
+     _LT_TAGVAR(archive_cmds, $1)="\$CC -dynamiclib \$allow_undefined_flag -o \$lib \$libobjs \$deplibs \$compiler_flags -install_name \$rpath/\$soname \$verstring $_lt_dar_single_mod${_lt_dsymutil}"
+     _LT_TAGVAR(module_cmds, $1)="\$CC \$allow_undefined_flag -o \$lib -bundle \$libobjs \$deplibs \$compiler_flags${_lt_dsymutil}"
+@@ -1516,7 +1513,7 @@ AC_CACHE_VAL([lt_cv_sys_max_cmd_len], [d
+     lt_cv_sys_max_cmd_len=-1;
+     ;;
+ 
+-  cygwin* | mingw* | cegcc*)
++  cygwin* | mingw*)
+     # On Win9x/ME, this test blows up -- it succeeds, but takes
+     # about 5 minutes as the teststring grows exponentially.
+     # Worse, since 9x/ME are not pre-emptively multitasking,
+@@ -1684,6 +1681,10 @@ else
+ #  endif
+ #endif
+ 
++#ifdef __cplusplus
++extern "C" void exit (int);
++#endif
++
+ void fnord() { int i=42;}
+ int main ()
+ {
+@@ -1699,7 +1700,7 @@ int main ()
+   else
+     puts (dlerror ());
+ 
+-  return status;
++    exit (status);
+ }]
+ _LT_EOF
+   if AC_TRY_EVAL(ac_link) && test -s conftest${ac_exeext} 2>/dev/null; then
+@@ -1738,7 +1739,7 @@ else
+     lt_cv_dlopen_self=yes
+     ;;
+ 
+-  mingw* | pw32* | cegcc*)
++  mingw* | pw32*)
+     lt_cv_dlopen="LoadLibrary"
+     lt_cv_dlopen_libs=
+     ;;
+@@ -2035,7 +2036,6 @@ m4_defun([_LT_SYS_DYNAMIC_LINKER],
+ [AC_REQUIRE([AC_CANONICAL_HOST])dnl
+ m4_require([_LT_DECL_EGREP])dnl
+ m4_require([_LT_FILEUTILS_DEFAULTS])dnl
+-m4_require([_LT_DECL_OBJDUMP])dnl
+ m4_require([_LT_DECL_SED])dnl
+ AC_MSG_CHECKING([dynamic linker characteristics])
+ m4_if([$1],
+@@ -2200,14 +2200,14 @@ bsdi[[45]]*)
+   # libtool to hard-code these into programs
+   ;;
+ 
+-cygwin* | mingw* | pw32* | cegcc*)
++cygwin* | mingw* | pw32*)
+   version_type=windows
+   shrext_cmds=".dll"
+   need_version=no
+   need_lib_prefix=no
+ 
+   case $GCC,$host_os in
+-  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
++  yes,cygwin* | yes,mingw* | yes,pw32*)
+     library_names_spec='$libname.dll.a'
+     # DLL is installed to $(libdir)/../bin by postinstall_cmds
+     postinstall_cmds='base_file=`basename \${file}`~
+@@ -2230,7 +2230,7 @@ cygwin* | mingw* | pw32* | cegcc*)
+       soname_spec='`echo ${libname} | sed -e 's/^lib/cyg/'``echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
+       sys_lib_search_path_spec="/usr/lib /lib/w32api /lib /usr/local/lib"
+       ;;
+-    mingw* | cegcc*)
++    mingw*)
+       # MinGW DLLs use traditional 'lib' prefix
+       soname_spec='${libname}`echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
+       sys_lib_search_path_spec=`$CC -print-search-dirs | $GREP "^libraries:" | $SED -e "s/^libraries://" -e "s,=/,/,g"`
+@@ -2656,7 +2656,7 @@ tpf*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no
+-  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
++  library_name_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
+   shlibpath_var=LD_LIBRARY_PATH
+   shlibpath_overrides_runpath=no
+   hardcode_into_libs=yes
+@@ -2957,7 +2957,6 @@ _LT_DECL([], [reload_cmds], [2])dnl
+ #  -- PORTME fill in with the dynamic library characteristics
+ m4_defun([_LT_CHECK_MAGIC_METHOD],
+ [m4_require([_LT_DECL_EGREP])
+-m4_require([_LT_DECL_OBJDUMP])
+ AC_CACHE_CHECK([how to recognize dependent libraries],
+ lt_cv_deplibs_check_method,
+ [lt_cv_file_magic_cmd='$MAGIC_CMD'
+@@ -3008,12 +3007,6 @@ mingw* | pw32*)
+   fi
+   ;;
+ 
+-cegcc)
+-  # use the weaker test based on 'objdump'. See mingw*.
+-  lt_cv_deplibs_check_method='file_magic file format pe-arm-.*little(.*architecture: arm)?'
+-  lt_cv_file_magic_cmd='$OBJDUMP -f'
+-  ;;
+-
+ darwin* | rhapsody*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+@@ -3325,7 +3318,7 @@ case $host_os in
+ aix*)
+   symcode='[[BCDT]]'
+   ;;
+-cygwin* | mingw* | pw32* | cegcc*)
++cygwin* | mingw* | pw32*)
+   symcode='[[ABCDGISTW]]'
+   ;;
+ hpux*)
+@@ -3571,7 +3564,7 @@ m4_if([$1], [CXX], [
+     beos* | irix5* | irix6* | nonstopux* | osf3* | osf4* | osf5*)
+       # PIC is the default for these OSes.
+       ;;
+-    mingw* | cygwin* | os2* | pw32* | cegcc*)
++    mingw* | cygwin* | os2* | pw32*)
+       # This hack is so that the source file can tell whether it is being
+       # built for inclusion in a dll (and should export symbols for example).
+       # Although the cygwin gcc ignores -fPIC, still need this for old-style
+@@ -3598,11 +3591,10 @@ m4_if([$1], [CXX], [
+       fi
+       ;;
+     hpux*)
+-      # PIC is the default for 64-bit PA HP-UX, but not for 32-bit
+-      # PA HP-UX.  On IA64 HP-UX, PIC is the default but the pic flag
+-      # sets the default TLS model and affects inlining.
++      # PIC is the default for IA64 HP-UX and 64-bit HP-UX, but
++      # not for PA HP-UX.
+       case $host_cpu in
+-      hppa*64*)
++      hppa*64*|ia64*)
+ 	;;
+       *)
+ 	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
+@@ -3700,19 +3692,12 @@ m4_if([$1], [CXX], [
+ 	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='--backend -Wl,'
+ 	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
+ 	    ;;
+-	  ecpc* )
+-	    # old Intel C++ for x86_64 which still supported -KPIC.
++	  icpc* | ecpc* )
++	    # Intel C++
+ 	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+ 	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
+ 	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-static'
+ 	    ;;
+-	  icpc* )
+-	    # Intel C++, used to be incompatible with GCC.
+-	    # ICC 10 doesn't accept -KPIC any more.
+-	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+-	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
+-	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-static'
+-	    ;;
+ 	  pgCC* | pgcpp*)
+ 	    # Portland Group C++ compiler
+ 	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+@@ -3878,7 +3863,7 @@ m4_if([$1], [CXX], [
+       # PIC is the default for these OSes.
+       ;;
+ 
+-    mingw* | cygwin* | pw32* | os2* | cegcc*)
++    mingw* | cygwin* | pw32* | os2*)
+       # This hack is so that the source file can tell whether it is being
+       # built for inclusion in a dll (and should export symbols for example).
+       # Although the cygwin gcc ignores -fPIC, still need this for old-style
+@@ -3894,11 +3879,10 @@ m4_if([$1], [CXX], [
+       ;;
+ 
+     hpux*)
+-      # PIC is the default for 64-bit PA HP-UX, but not for 32-bit
+-      # PA HP-UX.  On IA64 HP-UX, PIC is the default but the pic flag
+-      # sets the default TLS model and affects inlining.
++      # PIC is the default for IA64 HP-UX and 64-bit HP-UX, but
++      # not for PA HP-UX.
+       case $host_cpu in
+-      hppa*64*)
++      hppa*64*|ia64*)
+ 	# +Z the default
+ 	;;
+       *)
+@@ -3948,7 +3932,7 @@ m4_if([$1], [CXX], [
+       fi
+       ;;
+ 
+-    mingw* | cygwin* | pw32* | os2* | cegcc*)
++    mingw* | cygwin* | pw32* | os2*)
+       # This hack is so that the source file can tell whether it is being
+       # built for inclusion in a dll (and should export symbols for example).
+       m4_if([$1], [GCJ], [],
+@@ -3979,25 +3963,11 @@ m4_if([$1], [CXX], [
+ 
+     linux* | k*bsd*-gnu)
+       case $cc_basename in
+-      # old Intel for x86_64 which still supported -KPIC.
+-      ecc*)
++      icc* | ecc* | ifort*)
+ 	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+ 	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
+ 	_LT_TAGVAR(lt_prog_compiler_static, $1)='-static'
+         ;;
+-      # icc used to be incompatible with GCC.
+-      # ICC 10 doesn't accept -KPIC any more.
+-      icc* | ifort*)
+-	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+-	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
+-	_LT_TAGVAR(lt_prog_compiler_static, $1)='-static'
+-        ;;
+-      # Lahey Fortran 8.1.
+-      lf95*)
+-	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
+-	_LT_TAGVAR(lt_prog_compiler_pic, $1)='--shared'
+-	_LT_TAGVAR(lt_prog_compiler_static, $1)='--static'
+-	;;
+       pgcc* | pgf77* | pgf90* | pgf95*)
+         # Portland Group compilers (*not* the Pentium gcc compiler,
+ 	# which looks to be a dead project)
+@@ -4179,7 +4149,7 @@ m4_if([$1], [CXX], [
+   pw32*)
+     _LT_TAGVAR(export_symbols_cmds, $1)="$ltdll_cmds"
+   ;;
+-  cygwin* | mingw* | cegcc*)
++  cygwin* | mingw*)
+     _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[[BCDGRS]][[ ]]/s/.*[[ ]]\([[^ ]]*\)/\1 DATA/;/^.*[[ ]]__nm__/s/^.*[[ ]]__nm__\([[^ ]]*\)[[ ]][[^ ]]*/\1 DATA/;/^I[[ ]]/d;/^[[AITW]][[ ]]/s/.* //'\'' | sort | uniq > $export_symbols'
+   ;;
+   *)
+@@ -4231,7 +4201,7 @@ dnl Note also adjust exclude_expsyms for
+   extract_expsyms_cmds=
+ 
+   case $host_os in
+-  cygwin* | mingw* | pw32* | cegcc*)
++  cygwin* | mingw* | pw32*)
+     # FIXME: the MSVC++ port hasn't been tested in a loooong time
+     # When not using gcc, we currently assume that we are using
+     # Microsoft Visual C++.
+@@ -4318,7 +4288,7 @@ _LT_EOF
+       fi
+       ;;
+ 
+-    cygwin* | mingw* | pw32* | cegcc*)
++    cygwin* | mingw* | pw32*)
+       # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually meaningless,
+       # as there is no search path for DLLs.
+       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
+@@ -4384,9 +4354,6 @@ _LT_EOF
+ 	  tmp_addflag=' -i_dynamic -nofor_main' ;;
+ 	ifc* | ifort*)			# Intel Fortran compiler
+ 	  tmp_addflag=' -nofor_main' ;;
+-	lf95*)				# Lahey Fortran 8.1
+-	  _LT_TAGVAR(whole_archive_flag_spec, $1)=
+-	  tmp_sharedflag='--shared' ;;
+ 	xl[[cC]]*)			# IBM XL C 8.0 on PPC (deal with xlf below)
+ 	  tmp_sharedflag='-qmkshrobj'
+ 	  tmp_addflag= ;;
+@@ -4618,7 +4585,6 @@ _LT_EOF
+ 	fi
+       fi
+ 
+-      _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-bexpall'
+       # It seems that -bexpall does not export symbols beginning with
+       # underscore (_), so it is better to generate a list of symbols to export.
+       _LT_TAGVAR(always_export_symbols, $1)=yes
+@@ -4673,7 +4639,7 @@ _LT_EOF
+       _LT_TAGVAR(export_dynamic_flag_spec, $1)=-rdynamic
+       ;;
+ 
+-    cygwin* | mingw* | pw32* | cegcc*)
++    cygwin* | mingw* | pw32*)
+       # When not using gcc, we currently assume that we are using
+       # Microsoft Visual C++.
+       # hardcode_libdir_flag_spec is actually meaningless, as there is
+@@ -4777,7 +4743,7 @@ _LT_EOF
+ 	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+ 	  ;;
+ 	ia64*)
+-	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
++	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
+ 	  ;;
+ 	*)
+ 	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
+@@ -5562,7 +5528,6 @@ if test "$_lt_caught_CXX_error" != yes; 
+           fi
+         fi
+ 
+-        _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-bexpall'
+         # It seems that -bexpall does not export symbols beginning with
+         # underscore (_), so it is better to generate a list of symbols to
+ 	# export.
+@@ -5621,7 +5586,7 @@ if test "$_lt_caught_CXX_error" != yes; 
+         esac
+         ;;
+ 
+-      cygwin* | mingw* | pw32* | cegcc*)
++      cygwin* | mingw* | pw32*)
+         # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually meaningless,
+         # as there is no search path for DLLs.
+         _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
+@@ -7006,18 +6971,6 @@ AC_SUBST([GREP])
+ ])
+ 
+ 
+-# _LT_DECL_OBJDUMP
+-# --------------
+-# If we don't have a new enough Autoconf to choose the best objdump
+-# available, choose the one first in the user's PATH.
+-m4_defun([_LT_DECL_OBJDUMP],
+-[AC_CHECK_TOOL(OBJDUMP, objdump, false)
+-test -z "$OBJDUMP" && OBJDUMP=objdump
+-_LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
+-AC_SUBST([OBJDUMP])
+-])
+-
+-
+ # _LT_DECL_SED
+ # ------------
+ # Check for a fully-functional sed program, that truncates
+Index: libiconv-1.13.1/libcharset/m4/ltversion.m4
+===================================================================
+--- libiconv-1.13.1.orig/libcharset/m4/ltversion.m4	2009-06-21 04:17:33.000000000 -0700
++++ libiconv-1.13.1/libcharset/m4/ltversion.m4	2010-06-01 02:57:31.301726190 -0700
+@@ -9,15 +9,15 @@
+ 
+ # Generated from ltversion.in.
+ 
+-# serial 3012 ltversion.m4
++# serial 3017 ltversion.m4
+ # This file is part of GNU Libtool
+ 
+-m4_define([LT_PACKAGE_VERSION], [2.2.6])
+-m4_define([LT_PACKAGE_REVISION], [1.3012])
++m4_define([LT_PACKAGE_VERSION], [2.2.6b])
++m4_define([LT_PACKAGE_REVISION], [1.3017])
+ 
+ AC_DEFUN([LTVERSION_VERSION],
+-[macro_version='2.2.6'
+-macro_revision='1.3012'
++[macro_version='2.2.6b'
++macro_revision='1.3017'
+ _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
+ _LT_DECL(, macro_revision, 0)
+ ])
+Index: libiconv-1.13.1/m4/ltversion.m4
+===================================================================
+--- libiconv-1.13.1.orig/m4/ltversion.m4	2009-06-21 04:17:33.000000000 -0700
++++ libiconv-1.13.1/m4/ltversion.m4	2010-06-01 02:57:31.301726190 -0700
+@@ -9,15 +9,15 @@
+ 
+ # Generated from ltversion.in.
+ 
+-# serial 3012 ltversion.m4
++# serial 3017 ltversion.m4
+ # This file is part of GNU Libtool
+ 
+-m4_define([LT_PACKAGE_VERSION], [2.2.6])
+-m4_define([LT_PACKAGE_REVISION], [1.3012])
++m4_define([LT_PACKAGE_VERSION], [2.2.6b])
++m4_define([LT_PACKAGE_REVISION], [1.3017])
+ 
+ AC_DEFUN([LTVERSION_VERSION],
+-[macro_version='2.2.6'
+-macro_revision='1.3012'
++[macro_version='2.2.6b'
++macro_revision='1.3017'
+ _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
+ _LT_DECL(, macro_revision, 0)
+ ])
diff --git a/recipes/libiconv/libiconv.inc b/recipes/libiconv/libiconv.inc
index 6bb85ef..11dfaf2 100644
--- a/recipes/libiconv/libiconv.inc
+++ b/recipes/libiconv/libiconv.inc
@@ -6,21 +6,10 @@ PRIORITY = "optional"
 NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
 
 SRC_URI = "ftp://ftp.gnu.org/pub/gnu/libiconv/libiconv-${PV}.tar.gz \
-	   file://autotools.patch \
-	   file://preload.patch"
+          "
 
 S = "${WORKDIR}/libiconv-${PV}"
 
 inherit autotools gettext
 
-EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable --disable-rpath"
-
-do_configure_append () {
-	        # Fix stupid libtool... handling. rpath handling can't be disabled and the Makefile's can't be regenerated..
-        # (GNU sed required)
-        sed -i s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ ${S}/*-libtool
-}
-
-do_stage () {
-	autotools_stage_all
-}
+EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
diff --git a/recipes/libiconv/libiconv_1.12.bb b/recipes/libiconv/libiconv_1.12.bb
index a38248e..83774d6 100644
--- a/recipes/libiconv/libiconv_1.12.bb
+++ b/recipes/libiconv/libiconv_1.12.bb
@@ -11,5 +11,15 @@ EXTRA_OECONF +=  "${@['--disable-nls','--enable-nls'][bb.data.getVar('USE_NLS',
 
 LEAD_SONAME = "libiconv.so"
 
+SRC_URI += "file://autotools.patch \
+            file://preload.patch \
+           "
+do_configure_append () {
+        # Fix stupid libtool... handling. 
+	# rpath handling can't be disabled and the Makefile's can't be regenerated..
+        # (GNU sed required)
+        sed -i s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ ${S}/*-libtool
+}
+
 SRC_URI[md5sum] = "c2be282595751535a618ae0edeb8f648"
 SRC_URI[sha256sum] = "a99e244fd78babb95ea3c9a5c88b964994edaa1d15fd8dde5b4067801e23f0cd"
diff --git a/recipes/libiconv/libiconv_1.13.1.bb b/recipes/libiconv/libiconv_1.13.1.bb
new file mode 100644
index 0000000..3cd836f
--- /dev/null
+++ b/recipes/libiconv/libiconv_1.13.1.bb
@@ -0,0 +1,24 @@
+require libiconv.inc
+LICENSE = "GPLv3 LGPLv2"
+
+PROVIDES = "virtual/libiconv"
+PR = "r0"
+
+#gettext.class cant be inherit here so use this hack
+DEPENDS = "${@['','gettext-native'][bb.data.getVar('USE_NLS', d, 1) == 'yes']}"
+
+EXTRA_OECONF +=  "${@['--disable-nls','--enable-nls'][bb.data.getVar('USE_NLS', d, 1) == 'yes']}"
+
+SRC_URI += "file://autoconf.patch"
+
+do_configure_append () {
+        # Fix stupid libtool... handling. 
+        # rpath handling can't be disabled and the Makefile's can't be regenerated..
+        # (GNU sed required)
+        sed -i s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ ${S}/*-libtool
+}
+
+LEAD_SONAME = "libiconv.so"
+SRC_URI[md5sum] = "7ab33ebd26687c744a37264a330bbe9a"
+SRC_URI[sha256sum] = "55a36168306089009d054ccdd9d013041bfc3ab26be7033d107821f1c4949a49"
+
-- 
1.7.0.4




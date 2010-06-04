Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRXy-0003B0-Na
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:42:36 +0200
Received: by mail-fx0-f47.google.com with SMTP id 9so590619fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0YKhwLpvp11pO3i6o6pw0YKQFo9KfkvA25Gy2Sq/KG8=;
	b=FxW3PxEiFKpNtmM0dxpst8zHC/3TBDu/Vt4i514Y6LR7jPc5R7WaFirbm/6arY+fI4
	KNvv61pOcaR0lNxELK5VJKG6ki0/NWf05KvGajEJ1suzr1e6JgTftyydGORHb+t2kvn6
	uKxenYabbeIlhLg7pgmADoUUxjB3vZfOf41tI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bFToTDRKIPPusq/m+sGBTQuhwf77MGrt6T2L43OduQuI/tEVsuTfRQiMtvKAYH7vz9
	bW3OekS5HJbilOgLDk7/vK+2LnHQOxriq3q+SXn/18H5Xpfb9FTrUoAukIWn8fWHI8RU
	JTb5aEoUvGjjl8odjbUFAnPbAZIM8SZ3tlEwA=
MIME-Version: 1.0
Received: by 10.223.16.84 with SMTP id n20mr11306084faa.94.1275637096455; Fri, 
	04 Jun 2010 00:38:16 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:38:16 -0700 (PDT)
In-Reply-To: <1275510896-30845-6-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-6-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:38:16 +0200
Message-ID: <AANLkTinqjqyiK-dPPautbKu86dCiRzmglBFY_jdrmkIf@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 05/16] libiconv-1.13.1: Add recipes
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
X-List-Received-Date: Fri, 04 Jun 2010 07:42:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> * Get rid of old style staging.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/libiconv/libiconv-1.13.1/autoconf.patch | =A0834 +++++++++++++=
++++++++++
> =A0recipes/libiconv/libiconv.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 15 +-
> =A0recipes/libiconv/libiconv_1.12.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 10=
 +
> =A0recipes/libiconv/libiconv_1.13.1.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 24 +
> =A04 files changed, 870 insertions(+), 13 deletions(-)
> =A0create mode 100644 recipes/libiconv/libiconv-1.13.1/autoconf.patch
> =A0create mode 100644 recipes/libiconv/libiconv_1.13.1.bb
>
> diff --git a/recipes/libiconv/libiconv-1.13.1/autoconf.patch b/recipes/li=
biconv/libiconv-1.13.1/autoconf.patch
> new file mode 100644
> index 0000000..1c0efbf
> --- /dev/null
> +++ b/recipes/libiconv/libiconv-1.13.1/autoconf.patch
> @@ -0,0 +1,834 @@
> +Index: libiconv-1.13.1/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libiconv-1.13.1.orig/configure.ac =A02009-06-30 13:48:03.000000000 -=
0700
> ++++ libiconv-1.13.1/configure.ac =A0 =A0 =A0 2010-06-01 02:57:31.3017261=
90 -0700
> +@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR([build-aux])
> + AM_INIT_AUTOMAKE([libiconv], [1.13.1])
> + AC_CONFIG_HEADERS([config.h lib/config.h])
> + AC_PROG_MAKE_SET
> +-
> ++AC_CONFIG_MACRO_DIR([m4])
> + dnl =A0 =A0 =A0 =A0 =A0 checks for basic programs
> +
> + AC_PROG_CC
> +Index: libiconv-1.13.1/libcharset/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libiconv-1.13.1.orig/libcharset/configure.ac =A0 =A0 =A0 2009-06-21 =
04:17:33.000000000 -0700
> ++++ libiconv-1.13.1/libcharset/configure.ac =A0 =A02010-06-01 02:57:31.3=
01726190 -0700
> +@@ -16,17 +16,17 @@ dnl along with the GNU CHARSET Library;
> + dnl write to the Free Software Foundation, Inc., 51 Franklin Street,
> + dnl Fifth Floor, Boston, MA 02110-1301, USA.
> +
> +-AC_PREREQ([2.13])
> ++AC_PREREQ(2.61)
> ++AC_INIT([libcharset],[1.4] )
> ++AC_CONFIG_SRCDIR([lib/localcharset.c])
> +
> +-PACKAGE=3Dlibcharset
> +-VERSION=3D1.4
> +-
> +-AC_INIT([lib/localcharset.c])
> + AC_CONFIG_AUX_DIR([build-aux])
> + AC_CONFIG_HEADER([config.h])
> + AC_PROG_MAKE_SET
> +-AC_SUBST([PACKAGE])
> +-AC_SUBST([VERSION])
> ++dnl AC_SUBST(PACKAGE)
> ++dnl AC_SUBST(VERSION)
> ++
> ++AC_CONFIG_MACRO_DIR([m4])
> +
> + dnl =A0 =A0 =A0 =A0 =A0 checks for basic programs
> +
> +Index: libiconv-1.13.1/libcharset/m4/libtool.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libiconv-1.13.1.orig/libcharset/m4/libtool.m4 =A0 =A0 =A02009-06-21 =
04:17:33.000000000 -0700
> ++++ libiconv-1.13.1/libcharset/m4/libtool.m4 =A0 2010-06-01 02:57:31.301=
726190 -0700
> +@@ -89,7 +89,8 @@ _LT_SET_OPTIONS([$0], [$1])
> + LIBTOOL_DEPS=3D"$ltmain"
> +
> + # Always use our own libtool.
> +-LIBTOOL=3D"${CONFIG_SHELL-$SHELL} "'$(top_builddir)/libtool'
> ++LIBTOOL=3D'$(SHELL) $(top_builddir)'
> ++LIBTOOL=3D"$LIBTOOL/$host_alias-libtool"
> + AC_SUBST(LIBTOOL)dnl
> +
> + _LT_SETUP
> +@@ -211,7 +212,7 @@ delay_single_quote_subst=3D's/'\''/'\'\\\\
> + no_glob_subst=3D's/\*/\\\*/g'
> +
> + # Global variables:
> +-ofile=3Dlibtool
> ++ofile=3D${host_alias}-libtool
> + can_build_shared=3Dyes
> +
> + # All known linkers require a `.a' archive for static linking (except M=
SVC,
> +@@ -380,12 +381,12 @@ m4_define([lt_decl_dquote_varnames],
> + # lt_decl_varnames_tagged([SEPARATOR], [VARNAME1...])
> + # ---------------------------------------------------
> + m4_define([lt_decl_varnames_tagged],
> +-[m4_assert([$# <=3D 2])dnl
> +-_$0(m4_quote(m4_default([$1], [[, ]])),
> +- =A0 =A0m4_ifval([$2], [[$2]], [m4_dquote(lt_decl_tag_varnames)]),
> +- =A0 =A0m4_split(m4_normalize(m4_quote(_LT_TAGS)), [ ]))])
> +-m4_define([_lt_decl_varnames_tagged],
> +-[m4_ifval([$3], [lt_combine([$1], [$2], [_], $3)])])
> ++[_$0(m4_quote(m4_default([$1], [[, ]])),
> ++ =A0 =A0 m4_quote(m4_if([$2], [],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 m4_quote(lt_decl_tag_varnames),
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0m4_quote(m4_shift($@)))),
> ++ =A0 =A0 m4_split(m4_normalize(m4_quote(_LT_TAGS))))])
> ++m4_define([_lt_decl_varnames_tagged], [lt_combine([$1], [$2], [_], $3)]=
)
> +
> +
> + # lt_decl_all_varnames([SEPARATOR], [VARNAME1...])
> +@@ -990,11 +991,7 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
> + =A0 _LT_TAGVAR(whole_archive_flag_spec, $1)=3D''
> + =A0 _LT_TAGVAR(link_all_deplibs, $1)=3Dyes
> + =A0 _LT_TAGVAR(allow_undefined_flag, $1)=3D"$_lt_dar_allow_undefined"
> +- =A0case $cc_basename in
> +- =A0 =A0 ifort*) _lt_dar_can_shared=3Dyes ;;
> +- =A0 =A0 *) _lt_dar_can_shared=3D$GCC ;;
> +- =A0esac
> +- =A0if test "$_lt_dar_can_shared" =3D "yes"; then
> ++ =A0if test "$GCC" =3D "yes"; then
> + =A0 =A0 output_verbose_link_cmd=3Decho
> + =A0 =A0 _LT_TAGVAR(archive_cmds, $1)=3D"\$CC -dynamiclib \$allow_undefi=
ned_flag -o \$lib \$libobjs \$deplibs \$compiler_flags -install_name \$rpat=
h/\$soname \$verstring $_lt_dar_single_mod${_lt_dsymutil}"
> + =A0 =A0 _LT_TAGVAR(module_cmds, $1)=3D"\$CC \$allow_undefined_flag -o \=
$lib -bundle \$libobjs \$deplibs \$compiler_flags${_lt_dsymutil}"
> +@@ -1516,7 +1513,7 @@ AC_CACHE_VAL([lt_cv_sys_max_cmd_len], [d
> + =A0 =A0 lt_cv_sys_max_cmd_len=3D-1;
> + =A0 =A0 ;;
> +
> +- =A0cygwin* | mingw* | cegcc*)
> ++ =A0cygwin* | mingw*)
> + =A0 =A0 # On Win9x/ME, this test blows up -- it succeeds, but takes
> + =A0 =A0 # about 5 minutes as the teststring grows exponentially.
> + =A0 =A0 # Worse, since 9x/ME are not pre-emptively multitasking,
> +@@ -1684,6 +1681,10 @@ else
> + # =A0endif
> + #endif
> +
> ++#ifdef __cplusplus
> ++extern "C" void exit (int);
> ++#endif
> ++
> + void fnord() { int i=3D42;}
> + int main ()
> + {
> +@@ -1699,7 +1700,7 @@ int main ()
> + =A0 else
> + =A0 =A0 puts (dlerror ());
> +
> +- =A0return status;
> ++ =A0 =A0exit (status);
> + }]
> + _LT_EOF
> + =A0 if AC_TRY_EVAL(ac_link) && test -s conftest${ac_exeext} 2>/dev/null=
; then
> +@@ -1738,7 +1739,7 @@ else
> + =A0 =A0 lt_cv_dlopen_self=3Dyes
> + =A0 =A0 ;;
> +
> +- =A0mingw* | pw32* | cegcc*)
> ++ =A0mingw* | pw32*)
> + =A0 =A0 lt_cv_dlopen=3D"LoadLibrary"
> + =A0 =A0 lt_cv_dlopen_libs=3D
> + =A0 =A0 ;;
> +@@ -2035,7 +2036,6 @@ m4_defun([_LT_SYS_DYNAMIC_LINKER],
> + [AC_REQUIRE([AC_CANONICAL_HOST])dnl
> + m4_require([_LT_DECL_EGREP])dnl
> + m4_require([_LT_FILEUTILS_DEFAULTS])dnl
> +-m4_require([_LT_DECL_OBJDUMP])dnl
> + m4_require([_LT_DECL_SED])dnl
> + AC_MSG_CHECKING([dynamic linker characteristics])
> + m4_if([$1],
> +@@ -2200,14 +2200,14 @@ bsdi[[45]]*)
> + =A0 # libtool to hard-code these into programs
> + =A0 ;;
> +
> +-cygwin* | mingw* | pw32* | cegcc*)
> ++cygwin* | mingw* | pw32*)
> + =A0 version_type=3Dwindows
> + =A0 shrext_cmds=3D".dll"
> + =A0 need_version=3Dno
> + =A0 need_lib_prefix=3Dno
> +
> + =A0 case $GCC,$host_os in
> +- =A0yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
> ++ =A0yes,cygwin* | yes,mingw* | yes,pw32*)
> + =A0 =A0 library_names_spec=3D'$libname.dll.a'
> + =A0 =A0 # DLL is installed to $(libdir)/../bin by postinstall_cmds
> + =A0 =A0 postinstall_cmds=3D'base_file=3D`basename \${file}`~
> +@@ -2230,7 +2230,7 @@ cygwin* | mingw* | pw32* | cegcc*)
> + =A0 =A0 =A0 soname_spec=3D'`echo ${libname} | sed -e 's/^lib/cyg/'``ech=
o ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
> + =A0 =A0 =A0 sys_lib_search_path_spec=3D"/usr/lib /lib/w32api /lib /usr/=
local/lib"
> + =A0 =A0 =A0 ;;
> +- =A0 =A0mingw* | cegcc*)
> ++ =A0 =A0mingw*)
> + =A0 =A0 =A0 # MinGW DLLs use traditional 'lib' prefix
> + =A0 =A0 =A0 soname_spec=3D'${libname}`echo ${release} | $SED -e 's/[[.]=
]/-/g'`${versuffix}${shared_ext}'
> + =A0 =A0 =A0 sys_lib_search_path_spec=3D`$CC -print-search-dirs | $GREP =
"^libraries:" | $SED -e "s/^libraries://" -e "s,=3D/,/,g"`
> +@@ -2656,7 +2656,7 @@ tpf*)
> + =A0 version_type=3Dlinux
> + =A0 need_lib_prefix=3Dno
> + =A0 need_version=3Dno
> +- =A0library_names_spec=3D'${libname}${release}${shared_ext}$versuffix $=
{libname}${release}${shared_ext}$major $libname${shared_ext}'
> ++ =A0library_name_spec=3D'${libname}${release}${shared_ext}$versuffix ${=
libname}${release}${shared_ext}$major $libname${shared_ext}'
> + =A0 shlibpath_var=3DLD_LIBRARY_PATH
> + =A0 shlibpath_overrides_runpath=3Dno
> + =A0 hardcode_into_libs=3Dyes
> +@@ -2957,7 +2957,6 @@ _LT_DECL([], [reload_cmds], [2])dnl
> + # =A0-- PORTME fill in with the dynamic library characteristics
> + m4_defun([_LT_CHECK_MAGIC_METHOD],
> + [m4_require([_LT_DECL_EGREP])
> +-m4_require([_LT_DECL_OBJDUMP])
> + AC_CACHE_CHECK([how to recognize dependent libraries],
> + lt_cv_deplibs_check_method,
> + [lt_cv_file_magic_cmd=3D'$MAGIC_CMD'
> +@@ -3008,12 +3007,6 @@ mingw* | pw32*)
> + =A0 fi
> + =A0 ;;
> +
> +-cegcc)
> +- =A0# use the weaker test based on 'objdump'. See mingw*.
> +- =A0lt_cv_deplibs_check_method=3D'file_magic file format pe-arm-.*littl=
e(.*architecture: arm)?'
> +- =A0lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> +- =A0;;
> +-
> + darwin* | rhapsody*)
> + =A0 lt_cv_deplibs_check_method=3Dpass_all
> + =A0 ;;
> +@@ -3325,7 +3318,7 @@ case $host_os in
> + aix*)
> + =A0 symcode=3D'[[BCDT]]'
> + =A0 ;;
> +-cygwin* | mingw* | pw32* | cegcc*)
> ++cygwin* | mingw* | pw32*)
> + =A0 symcode=3D'[[ABCDGISTW]]'
> + =A0 ;;
> + hpux*)
> +@@ -3571,7 +3564,7 @@ m4_if([$1], [CXX], [
> + =A0 =A0 beos* | irix5* | irix6* | nonstopux* | osf3* | osf4* | osf5*)
> + =A0 =A0 =A0 # PIC is the default for these OSes.
> + =A0 =A0 =A0 ;;
> +- =A0 =A0mingw* | cygwin* | os2* | pw32* | cegcc*)
> ++ =A0 =A0mingw* | cygwin* | os2* | pw32*)
> + =A0 =A0 =A0 # This hack is so that the source file can tell whether it =
is being
> + =A0 =A0 =A0 # built for inclusion in a dll (and should export symbols f=
or example).
> + =A0 =A0 =A0 # Although the cygwin gcc ignores -fPIC, still need this fo=
r old-style
> +@@ -3598,11 +3591,10 @@ m4_if([$1], [CXX], [
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 ;;
> + =A0 =A0 hpux*)
> +- =A0 =A0 =A0# PIC is the default for 64-bit PA HP-UX, but not for 32-bi=
t
> +- =A0 =A0 =A0# PA HP-UX. =A0On IA64 HP-UX, PIC is the default but the pi=
c flag
> +- =A0 =A0 =A0# sets the default TLS model and affects inlining.
> ++ =A0 =A0 =A0# PIC is the default for IA64 HP-UX and 64-bit HP-UX, but
> ++ =A0 =A0 =A0# not for PA HP-UX.
> + =A0 =A0 =A0 case $host_cpu in
> +- =A0 =A0 =A0hppa*64*)
> ++ =A0 =A0 =A0hppa*64*|ia64*)
> + =A0 =A0 =A0 ;;
> + =A0 =A0 =A0 *)
> + =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-fPIC'
> +@@ -3700,19 +3692,12 @@ m4_if([$1], [CXX], [
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'--backend -W=
l,'
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-fPIC'
> + =A0 =A0 =A0 =A0 =A0 ;;
> +- =A0 =A0 =A0 =A0ecpc* )
> +- =A0 =A0 =A0 =A0 =A0# old Intel C++ for x86_64 which still supported -K=
PIC.
> ++ =A0 =A0 =A0 =A0icpc* | ecpc* )
> ++ =A0 =A0 =A0 =A0 =A0# Intel C++
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-KPIC'
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_static, $1)=3D'-static'
> + =A0 =A0 =A0 =A0 =A0 ;;
> +- =A0 =A0 =A0 =A0icpc* )
> +- =A0 =A0 =A0 =A0 =A0# Intel C++, used to be incompatible with GCC.
> +- =A0 =A0 =A0 =A0 =A0# ICC 10 doesn't accept -KPIC any more.
> +- =A0 =A0 =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> +- =A0 =A0 =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-fPIC'
> +- =A0 =A0 =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_static, $1)=3D'-static'
> +- =A0 =A0 =A0 =A0 =A0;;
> + =A0 =A0 =A0 =A0 pgCC* | pgcpp*)
> + =A0 =A0 =A0 =A0 =A0 # Portland Group C++ compiler
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> +@@ -3878,7 +3863,7 @@ m4_if([$1], [CXX], [
> + =A0 =A0 =A0 # PIC is the default for these OSes.
> + =A0 =A0 =A0 ;;
> +
> +- =A0 =A0mingw* | cygwin* | pw32* | os2* | cegcc*)
> ++ =A0 =A0mingw* | cygwin* | pw32* | os2*)
> + =A0 =A0 =A0 # This hack is so that the source file can tell whether it =
is being
> + =A0 =A0 =A0 # built for inclusion in a dll (and should export symbols f=
or example).
> + =A0 =A0 =A0 # Although the cygwin gcc ignores -fPIC, still need this fo=
r old-style
> +@@ -3894,11 +3879,10 @@ m4_if([$1], [CXX], [
> + =A0 =A0 =A0 ;;
> +
> + =A0 =A0 hpux*)
> +- =A0 =A0 =A0# PIC is the default for 64-bit PA HP-UX, but not for 32-bi=
t
> +- =A0 =A0 =A0# PA HP-UX. =A0On IA64 HP-UX, PIC is the default but the pi=
c flag
> +- =A0 =A0 =A0# sets the default TLS model and affects inlining.
> ++ =A0 =A0 =A0# PIC is the default for IA64 HP-UX and 64-bit HP-UX, but
> ++ =A0 =A0 =A0# not for PA HP-UX.
> + =A0 =A0 =A0 case $host_cpu in
> +- =A0 =A0 =A0hppa*64*)
> ++ =A0 =A0 =A0hppa*64*|ia64*)
> + =A0 =A0 =A0 # +Z the default
> + =A0 =A0 =A0 ;;
> + =A0 =A0 =A0 *)
> +@@ -3948,7 +3932,7 @@ m4_if([$1], [CXX], [
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 ;;
> +
> +- =A0 =A0mingw* | cygwin* | pw32* | os2* | cegcc*)
> ++ =A0 =A0mingw* | cygwin* | pw32* | os2*)
> + =A0 =A0 =A0 # This hack is so that the source file can tell whether it =
is being
> + =A0 =A0 =A0 # built for inclusion in a dll (and should export symbols f=
or example).
> + =A0 =A0 =A0 m4_if([$1], [GCJ], [],
> +@@ -3979,25 +3963,11 @@ m4_if([$1], [CXX], [
> +
> + =A0 =A0 linux* | k*bsd*-gnu)
> + =A0 =A0 =A0 case $cc_basename in
> +- =A0 =A0 =A0# old Intel for x86_64 which still supported -KPIC.
> +- =A0 =A0 =A0ecc*)
> ++ =A0 =A0 =A0icc* | ecc* | ifort*)
> + =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> + =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-KPIC'
> + =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_static, $1)=3D'-static'
> + =A0 =A0 =A0 =A0 ;;
> +- =A0 =A0 =A0# icc used to be incompatible with GCC.
> +- =A0 =A0 =A0# ICC 10 doesn't accept -KPIC any more.
> +- =A0 =A0 =A0icc* | ifort*)
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-fPIC'
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_static, $1)=3D'-static'
> +- =A0 =A0 =A0 =A0;;
> +- =A0 =A0 =A0# Lahey Fortran 8.1.
> +- =A0 =A0 =A0lf95*)
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'--shared'
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_static, $1)=3D'--static'
> +- =A0 =A0 =A0;;
> + =A0 =A0 =A0 pgcc* | pgf77* | pgf90* | pgf95*)
> + =A0 =A0 =A0 =A0 # Portland Group compilers (*not* the Pentium gcc compi=
ler,
> + =A0 =A0 =A0 # which looks to be a dead project)
> +@@ -4179,7 +4149,7 @@ m4_if([$1], [CXX], [
> + =A0 pw32*)
> + =A0 =A0 _LT_TAGVAR(export_symbols_cmds, $1)=3D"$ltdll_cmds"
> + =A0 ;;
> +- =A0cygwin* | mingw* | cegcc*)
> ++ =A0cygwin* | mingw*)
> + =A0 =A0 _LT_TAGVAR(export_symbols_cmds, $1)=3D'$NM $libobjs $convenienc=
e | $global_symbol_pipe | $SED -e '\''/^[[BCDGRS]][[ ]]/s/.*[[ ]]\([[^ ]]*\=
)/\1 DATA/;/^.*[[ ]]__nm__/s/^.*[[ ]]__nm__\([[^ ]]*\)[[ ]][[^ ]]*/\1 DATA/=
;/^I[[ ]]/d;/^[[AITW]][[ ]]/s/.* //'\'' | sort | uniq > $export_symbols'
> + =A0 ;;
> + =A0 *)
> +@@ -4231,7 +4201,7 @@ dnl Note also adjust exclude_expsyms for
> + =A0 extract_expsyms_cmds=3D
> +
> + =A0 case $host_os in
> +- =A0cygwin* | mingw* | pw32* | cegcc*)
> ++ =A0cygwin* | mingw* | pw32*)
> + =A0 =A0 # FIXME: the MSVC++ port hasn't been tested in a loooong time
> + =A0 =A0 # When not using gcc, we currently assume that we are using
> + =A0 =A0 # Microsoft Visual C++.
> +@@ -4318,7 +4288,7 @@ _LT_EOF
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 ;;
> +
> +- =A0 =A0cygwin* | mingw* | pw32* | cegcc*)
> ++ =A0 =A0cygwin* | mingw* | pw32*)
> + =A0 =A0 =A0 # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually mea=
ningless,
> + =A0 =A0 =A0 # as there is no search path for DLLs.
> + =A0 =A0 =A0 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=3D'-L$libdir'
> +@@ -4384,9 +4354,6 @@ _LT_EOF
> + =A0 =A0 =A0 =A0 tmp_addflag=3D' -i_dynamic -nofor_main' ;;
> + =A0 =A0 =A0 ifc* | ifort*) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# Intel F=
ortran compiler
> + =A0 =A0 =A0 =A0 tmp_addflag=3D' -nofor_main' ;;
> +- =A0 =A0 =A0lf95*) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#=
 Lahey Fortran 8.1
> +- =A0 =A0 =A0 =A0_LT_TAGVAR(whole_archive_flag_spec, $1)=3D
> +- =A0 =A0 =A0 =A0tmp_sharedflag=3D'--shared' ;;
> + =A0 =A0 =A0 xl[[cC]]*) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# IBM=
 XL C 8.0 on PPC (deal with xlf below)
> + =A0 =A0 =A0 =A0 tmp_sharedflag=3D'-qmkshrobj'
> + =A0 =A0 =A0 =A0 tmp_addflag=3D ;;
> +@@ -4618,7 +4585,6 @@ _LT_EOF
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 fi
> +
> +- =A0 =A0 =A0_LT_TAGVAR(export_dynamic_flag_spec, $1)=3D'${wl}-bexpall'
> + =A0 =A0 =A0 # It seems that -bexpall does not export symbols beginning =
with
> + =A0 =A0 =A0 # underscore (_), so it is better to generate a list of sym=
bols to export.
> + =A0 =A0 =A0 _LT_TAGVAR(always_export_symbols, $1)=3Dyes
> +@@ -4673,7 +4639,7 @@ _LT_EOF
> + =A0 =A0 =A0 _LT_TAGVAR(export_dynamic_flag_spec, $1)=3D-rdynamic
> + =A0 =A0 =A0 ;;
> +
> +- =A0 =A0cygwin* | mingw* | pw32* | cegcc*)
> ++ =A0 =A0cygwin* | mingw* | pw32*)
> + =A0 =A0 =A0 # When not using gcc, we currently assume that we are using
> + =A0 =A0 =A0 # Microsoft Visual C++.
> + =A0 =A0 =A0 # hardcode_libdir_flag_spec is actually meaningless, as the=
re is
> +@@ -4777,7 +4743,7 @@ _LT_EOF
> + =A0 =A0 =A0 =A0 _LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared ${wl}+h ${w=
l}$soname -o $lib $libobjs $deplibs $compiler_flags'
> + =A0 =A0 =A0 =A0 ;;
> + =A0 =A0 =A0 ia64*)
> +- =A0 =A0 =A0 =A0_LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared -fPIC ${wl}=
+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_fl=
ags'
> ++ =A0 =A0 =A0 =A0_LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared ${wl}+h ${w=
l}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> + =A0 =A0 =A0 =A0 ;;
> + =A0 =A0 =A0 *)
> + =A0 =A0 =A0 =A0 _LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared -fPIC ${wl}=
+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $com=
piler_flags'
> +@@ -5562,7 +5528,6 @@ if test "$_lt_caught_CXX_error" !=3D yes;
> + =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 fi
> +
> +- =A0 =A0 =A0 =A0_LT_TAGVAR(export_dynamic_flag_spec, $1)=3D'${wl}-bexpa=
ll'
> + =A0 =A0 =A0 =A0 # It seems that -bexpall does not export symbols beginn=
ing with
> + =A0 =A0 =A0 =A0 # underscore (_), so it is better to generate a list of=
 symbols to
> + =A0 =A0 =A0 # export.
> +@@ -5621,7 +5586,7 @@ if test "$_lt_caught_CXX_error" !=3D yes;
> + =A0 =A0 =A0 =A0 esac
> + =A0 =A0 =A0 =A0 ;;
> +
> +- =A0 =A0 =A0cygwin* | mingw* | pw32* | cegcc*)
> ++ =A0 =A0 =A0cygwin* | mingw* | pw32*)
> + =A0 =A0 =A0 =A0 # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually=
 meaningless,
> + =A0 =A0 =A0 =A0 # as there is no search path for DLLs.
> + =A0 =A0 =A0 =A0 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=3D'-L$libdir'
> +@@ -7006,18 +6971,6 @@ AC_SUBST([GREP])
> + ])
> +
> +
> +-# _LT_DECL_OBJDUMP
> +-# --------------
> +-# If we don't have a new enough Autoconf to choose the best objdump
> +-# available, choose the one first in the user's PATH.
> +-m4_defun([_LT_DECL_OBJDUMP],
> +-[AC_CHECK_TOOL(OBJDUMP, objdump, false)
> +-test -z "$OBJDUMP" && OBJDUMP=3Dobjdump
> +-_LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
> +-AC_SUBST([OBJDUMP])
> +-])
> +-
> +-
> + # _LT_DECL_SED
> + # ------------
> + # Check for a fully-functional sed program, that truncates
> +Index: libiconv-1.13.1/m4/libtool.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libiconv-1.13.1.orig/m4/libtool.m4 2009-06-21 04:17:33.000000000 -07=
00
> ++++ libiconv-1.13.1/m4/libtool.m4 =A0 =A0 =A02010-06-01 02:57:31.3017261=
90 -0700
> +@@ -89,7 +89,8 @@ _LT_SET_OPTIONS([$0], [$1])
> + LIBTOOL_DEPS=3D"$ltmain"
> +
> + # Always use our own libtool.
> +-LIBTOOL=3D"${CONFIG_SHELL-$SHELL} "'$(top_builddir)/libtool'
> ++LIBTOOL=3D'$(SHELL) $(top_builddir)'
> ++LIBTOOL=3D"$LIBTOOL/$host_alias-libtool"
> + AC_SUBST(LIBTOOL)dnl
> +
> + _LT_SETUP
> +@@ -211,7 +212,7 @@ delay_single_quote_subst=3D's/'\''/'\'\\\\
> + no_glob_subst=3D's/\*/\\\*/g'
> +
> + # Global variables:
> +-ofile=3Dlibtool
> ++ofile=3D${host_alias}-libtool
> + can_build_shared=3Dyes
> +
> + # All known linkers require a `.a' archive for static linking (except M=
SVC,
> +@@ -380,12 +381,12 @@ m4_define([lt_decl_dquote_varnames],
> + # lt_decl_varnames_tagged([SEPARATOR], [VARNAME1...])
> + # ---------------------------------------------------
> + m4_define([lt_decl_varnames_tagged],
> +-[m4_assert([$# <=3D 2])dnl
> +-_$0(m4_quote(m4_default([$1], [[, ]])),
> +- =A0 =A0m4_ifval([$2], [[$2]], [m4_dquote(lt_decl_tag_varnames)]),
> +- =A0 =A0m4_split(m4_normalize(m4_quote(_LT_TAGS)), [ ]))])
> +-m4_define([_lt_decl_varnames_tagged],
> +-[m4_ifval([$3], [lt_combine([$1], [$2], [_], $3)])])
> ++[_$0(m4_quote(m4_default([$1], [[, ]])),
> ++ =A0 =A0 m4_quote(m4_if([$2], [],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 m4_quote(lt_decl_tag_varnames),
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0m4_quote(m4_shift($@)))),
> ++ =A0 =A0 m4_split(m4_normalize(m4_quote(_LT_TAGS))))])
> ++m4_define([_lt_decl_varnames_tagged], [lt_combine([$1], [$2], [_], $3)]=
)
> +
> +
> + # lt_decl_all_varnames([SEPARATOR], [VARNAME1...])
> +@@ -990,11 +991,7 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
> + =A0 _LT_TAGVAR(whole_archive_flag_spec, $1)=3D''
> + =A0 _LT_TAGVAR(link_all_deplibs, $1)=3Dyes
> + =A0 _LT_TAGVAR(allow_undefined_flag, $1)=3D"$_lt_dar_allow_undefined"
> +- =A0case $cc_basename in
> +- =A0 =A0 ifort*) _lt_dar_can_shared=3Dyes ;;
> +- =A0 =A0 *) _lt_dar_can_shared=3D$GCC ;;
> +- =A0esac
> +- =A0if test "$_lt_dar_can_shared" =3D "yes"; then
> ++ =A0if test "$GCC" =3D "yes"; then
> + =A0 =A0 output_verbose_link_cmd=3Decho
> + =A0 =A0 _LT_TAGVAR(archive_cmds, $1)=3D"\$CC -dynamiclib \$allow_undefi=
ned_flag -o \$lib \$libobjs \$deplibs \$compiler_flags -install_name \$rpat=
h/\$soname \$verstring $_lt_dar_single_mod${_lt_dsymutil}"
> + =A0 =A0 _LT_TAGVAR(module_cmds, $1)=3D"\$CC \$allow_undefined_flag -o \=
$lib -bundle \$libobjs \$deplibs \$compiler_flags${_lt_dsymutil}"
> +@@ -1516,7 +1513,7 @@ AC_CACHE_VAL([lt_cv_sys_max_cmd_len], [d
> + =A0 =A0 lt_cv_sys_max_cmd_len=3D-1;
> + =A0 =A0 ;;
> +
> +- =A0cygwin* | mingw* | cegcc*)
> ++ =A0cygwin* | mingw*)
> + =A0 =A0 # On Win9x/ME, this test blows up -- it succeeds, but takes
> + =A0 =A0 # about 5 minutes as the teststring grows exponentially.
> + =A0 =A0 # Worse, since 9x/ME are not pre-emptively multitasking,
> +@@ -1684,6 +1681,10 @@ else
> + # =A0endif
> + #endif
> +
> ++#ifdef __cplusplus
> ++extern "C" void exit (int);
> ++#endif
> ++
> + void fnord() { int i=3D42;}
> + int main ()
> + {
> +@@ -1699,7 +1700,7 @@ int main ()
> + =A0 else
> + =A0 =A0 puts (dlerror ());
> +
> +- =A0return status;
> ++ =A0 =A0exit (status);
> + }]
> + _LT_EOF
> + =A0 if AC_TRY_EVAL(ac_link) && test -s conftest${ac_exeext} 2>/dev/null=
; then
> +@@ -1738,7 +1739,7 @@ else
> + =A0 =A0 lt_cv_dlopen_self=3Dyes
> + =A0 =A0 ;;
> +
> +- =A0mingw* | pw32* | cegcc*)
> ++ =A0mingw* | pw32*)
> + =A0 =A0 lt_cv_dlopen=3D"LoadLibrary"
> + =A0 =A0 lt_cv_dlopen_libs=3D
> + =A0 =A0 ;;
> +@@ -2035,7 +2036,6 @@ m4_defun([_LT_SYS_DYNAMIC_LINKER],
> + [AC_REQUIRE([AC_CANONICAL_HOST])dnl
> + m4_require([_LT_DECL_EGREP])dnl
> + m4_require([_LT_FILEUTILS_DEFAULTS])dnl
> +-m4_require([_LT_DECL_OBJDUMP])dnl
> + m4_require([_LT_DECL_SED])dnl
> + AC_MSG_CHECKING([dynamic linker characteristics])
> + m4_if([$1],
> +@@ -2200,14 +2200,14 @@ bsdi[[45]]*)
> + =A0 # libtool to hard-code these into programs
> + =A0 ;;
> +
> +-cygwin* | mingw* | pw32* | cegcc*)
> ++cygwin* | mingw* | pw32*)
> + =A0 version_type=3Dwindows
> + =A0 shrext_cmds=3D".dll"
> + =A0 need_version=3Dno
> + =A0 need_lib_prefix=3Dno
> +
> + =A0 case $GCC,$host_os in
> +- =A0yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
> ++ =A0yes,cygwin* | yes,mingw* | yes,pw32*)
> + =A0 =A0 library_names_spec=3D'$libname.dll.a'
> + =A0 =A0 # DLL is installed to $(libdir)/../bin by postinstall_cmds
> + =A0 =A0 postinstall_cmds=3D'base_file=3D`basename \${file}`~
> +@@ -2230,7 +2230,7 @@ cygwin* | mingw* | pw32* | cegcc*)
> + =A0 =A0 =A0 soname_spec=3D'`echo ${libname} | sed -e 's/^lib/cyg/'``ech=
o ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
> + =A0 =A0 =A0 sys_lib_search_path_spec=3D"/usr/lib /lib/w32api /lib /usr/=
local/lib"
> + =A0 =A0 =A0 ;;
> +- =A0 =A0mingw* | cegcc*)
> ++ =A0 =A0mingw*)
> + =A0 =A0 =A0 # MinGW DLLs use traditional 'lib' prefix
> + =A0 =A0 =A0 soname_spec=3D'${libname}`echo ${release} | $SED -e 's/[[.]=
]/-/g'`${versuffix}${shared_ext}'
> + =A0 =A0 =A0 sys_lib_search_path_spec=3D`$CC -print-search-dirs | $GREP =
"^libraries:" | $SED -e "s/^libraries://" -e "s,=3D/,/,g"`
> +@@ -2656,7 +2656,7 @@ tpf*)
> + =A0 version_type=3Dlinux
> + =A0 need_lib_prefix=3Dno
> + =A0 need_version=3Dno
> +- =A0library_names_spec=3D'${libname}${release}${shared_ext}$versuffix $=
{libname}${release}${shared_ext}$major $libname${shared_ext}'
> ++ =A0library_name_spec=3D'${libname}${release}${shared_ext}$versuffix ${=
libname}${release}${shared_ext}$major $libname${shared_ext}'
> + =A0 shlibpath_var=3DLD_LIBRARY_PATH
> + =A0 shlibpath_overrides_runpath=3Dno
> + =A0 hardcode_into_libs=3Dyes
> +@@ -2957,7 +2957,6 @@ _LT_DECL([], [reload_cmds], [2])dnl
> + # =A0-- PORTME fill in with the dynamic library characteristics
> + m4_defun([_LT_CHECK_MAGIC_METHOD],
> + [m4_require([_LT_DECL_EGREP])
> +-m4_require([_LT_DECL_OBJDUMP])
> + AC_CACHE_CHECK([how to recognize dependent libraries],
> + lt_cv_deplibs_check_method,
> + [lt_cv_file_magic_cmd=3D'$MAGIC_CMD'
> +@@ -3008,12 +3007,6 @@ mingw* | pw32*)
> + =A0 fi
> + =A0 ;;
> +
> +-cegcc)
> +- =A0# use the weaker test based on 'objdump'. See mingw*.
> +- =A0lt_cv_deplibs_check_method=3D'file_magic file format pe-arm-.*littl=
e(.*architecture: arm)?'
> +- =A0lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> +- =A0;;
> +-
> + darwin* | rhapsody*)
> + =A0 lt_cv_deplibs_check_method=3Dpass_all
> + =A0 ;;
> +@@ -3325,7 +3318,7 @@ case $host_os in
> + aix*)
> + =A0 symcode=3D'[[BCDT]]'
> + =A0 ;;
> +-cygwin* | mingw* | pw32* | cegcc*)
> ++cygwin* | mingw* | pw32*)
> + =A0 symcode=3D'[[ABCDGISTW]]'
> + =A0 ;;
> + hpux*)
> +@@ -3571,7 +3564,7 @@ m4_if([$1], [CXX], [
> + =A0 =A0 beos* | irix5* | irix6* | nonstopux* | osf3* | osf4* | osf5*)
> + =A0 =A0 =A0 # PIC is the default for these OSes.
> + =A0 =A0 =A0 ;;
> +- =A0 =A0mingw* | cygwin* | os2* | pw32* | cegcc*)
> ++ =A0 =A0mingw* | cygwin* | os2* | pw32*)
> + =A0 =A0 =A0 # This hack is so that the source file can tell whether it =
is being
> + =A0 =A0 =A0 # built for inclusion in a dll (and should export symbols f=
or example).
> + =A0 =A0 =A0 # Although the cygwin gcc ignores -fPIC, still need this fo=
r old-style
> +@@ -3598,11 +3591,10 @@ m4_if([$1], [CXX], [
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 ;;
> + =A0 =A0 hpux*)
> +- =A0 =A0 =A0# PIC is the default for 64-bit PA HP-UX, but not for 32-bi=
t
> +- =A0 =A0 =A0# PA HP-UX. =A0On IA64 HP-UX, PIC is the default but the pi=
c flag
> +- =A0 =A0 =A0# sets the default TLS model and affects inlining.
> ++ =A0 =A0 =A0# PIC is the default for IA64 HP-UX and 64-bit HP-UX, but
> ++ =A0 =A0 =A0# not for PA HP-UX.
> + =A0 =A0 =A0 case $host_cpu in
> +- =A0 =A0 =A0hppa*64*)
> ++ =A0 =A0 =A0hppa*64*|ia64*)
> + =A0 =A0 =A0 ;;
> + =A0 =A0 =A0 *)
> + =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-fPIC'
> +@@ -3700,19 +3692,12 @@ m4_if([$1], [CXX], [
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'--backend -W=
l,'
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-fPIC'
> + =A0 =A0 =A0 =A0 =A0 ;;
> +- =A0 =A0 =A0 =A0ecpc* )
> +- =A0 =A0 =A0 =A0 =A0# old Intel C++ for x86_64 which still supported -K=
PIC.
> ++ =A0 =A0 =A0 =A0icpc* | ecpc* )
> ++ =A0 =A0 =A0 =A0 =A0# Intel C++
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-KPIC'
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_static, $1)=3D'-static'
> + =A0 =A0 =A0 =A0 =A0 ;;
> +- =A0 =A0 =A0 =A0icpc* )
> +- =A0 =A0 =A0 =A0 =A0# Intel C++, used to be incompatible with GCC.
> +- =A0 =A0 =A0 =A0 =A0# ICC 10 doesn't accept -KPIC any more.
> +- =A0 =A0 =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> +- =A0 =A0 =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-fPIC'
> +- =A0 =A0 =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_static, $1)=3D'-static'
> +- =A0 =A0 =A0 =A0 =A0;;
> + =A0 =A0 =A0 =A0 pgCC* | pgcpp*)
> + =A0 =A0 =A0 =A0 =A0 # Portland Group C++ compiler
> + =A0 =A0 =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> +@@ -3878,7 +3863,7 @@ m4_if([$1], [CXX], [
> + =A0 =A0 =A0 # PIC is the default for these OSes.
> + =A0 =A0 =A0 ;;
> +
> +- =A0 =A0mingw* | cygwin* | pw32* | os2* | cegcc*)
> ++ =A0 =A0mingw* | cygwin* | pw32* | os2*)
> + =A0 =A0 =A0 # This hack is so that the source file can tell whether it =
is being
> + =A0 =A0 =A0 # built for inclusion in a dll (and should export symbols f=
or example).
> + =A0 =A0 =A0 # Although the cygwin gcc ignores -fPIC, still need this fo=
r old-style
> +@@ -3894,11 +3879,10 @@ m4_if([$1], [CXX], [
> + =A0 =A0 =A0 ;;
> +
> + =A0 =A0 hpux*)
> +- =A0 =A0 =A0# PIC is the default for 64-bit PA HP-UX, but not for 32-bi=
t
> +- =A0 =A0 =A0# PA HP-UX. =A0On IA64 HP-UX, PIC is the default but the pi=
c flag
> +- =A0 =A0 =A0# sets the default TLS model and affects inlining.
> ++ =A0 =A0 =A0# PIC is the default for IA64 HP-UX and 64-bit HP-UX, but
> ++ =A0 =A0 =A0# not for PA HP-UX.
> + =A0 =A0 =A0 case $host_cpu in
> +- =A0 =A0 =A0hppa*64*)
> ++ =A0 =A0 =A0hppa*64*|ia64*)
> + =A0 =A0 =A0 # +Z the default
> + =A0 =A0 =A0 ;;
> + =A0 =A0 =A0 *)
> +@@ -3948,7 +3932,7 @@ m4_if([$1], [CXX], [
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 ;;
> +
> +- =A0 =A0mingw* | cygwin* | pw32* | os2* | cegcc*)
> ++ =A0 =A0mingw* | cygwin* | pw32* | os2*)
> + =A0 =A0 =A0 # This hack is so that the source file can tell whether it =
is being
> + =A0 =A0 =A0 # built for inclusion in a dll (and should export symbols f=
or example).
> + =A0 =A0 =A0 m4_if([$1], [GCJ], [],
> +@@ -3979,25 +3963,11 @@ m4_if([$1], [CXX], [
> +
> + =A0 =A0 linux* | k*bsd*-gnu)
> + =A0 =A0 =A0 case $cc_basename in
> +- =A0 =A0 =A0# old Intel for x86_64 which still supported -KPIC.
> +- =A0 =A0 =A0ecc*)
> ++ =A0 =A0 =A0icc* | ecc* | ifort*)
> + =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> + =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-KPIC'
> + =A0 =A0 =A0 _LT_TAGVAR(lt_prog_compiler_static, $1)=3D'-static'
> + =A0 =A0 =A0 =A0 ;;
> +- =A0 =A0 =A0# icc used to be incompatible with GCC.
> +- =A0 =A0 =A0# ICC 10 doesn't accept -KPIC any more.
> +- =A0 =A0 =A0icc* | ifort*)
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-fPIC'
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_static, $1)=3D'-static'
> +- =A0 =A0 =A0 =A0;;
> +- =A0 =A0 =A0# Lahey Fortran 8.1.
> +- =A0 =A0 =A0lf95*)
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,'
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'--shared'
> +- =A0 =A0 =A0_LT_TAGVAR(lt_prog_compiler_static, $1)=3D'--static'
> +- =A0 =A0 =A0;;
> + =A0 =A0 =A0 pgcc* | pgf77* | pgf90* | pgf95*)
> + =A0 =A0 =A0 =A0 # Portland Group compilers (*not* the Pentium gcc compi=
ler,
> + =A0 =A0 =A0 # which looks to be a dead project)
> +@@ -4179,7 +4149,7 @@ m4_if([$1], [CXX], [
> + =A0 pw32*)
> + =A0 =A0 _LT_TAGVAR(export_symbols_cmds, $1)=3D"$ltdll_cmds"
> + =A0 ;;
> +- =A0cygwin* | mingw* | cegcc*)
> ++ =A0cygwin* | mingw*)
> + =A0 =A0 _LT_TAGVAR(export_symbols_cmds, $1)=3D'$NM $libobjs $convenienc=
e | $global_symbol_pipe | $SED -e '\''/^[[BCDGRS]][[ ]]/s/.*[[ ]]\([[^ ]]*\=
)/\1 DATA/;/^.*[[ ]]__nm__/s/^.*[[ ]]__nm__\([[^ ]]*\)[[ ]][[^ ]]*/\1 DATA/=
;/^I[[ ]]/d;/^[[AITW]][[ ]]/s/.* //'\'' | sort | uniq > $export_symbols'
> + =A0 ;;
> + =A0 *)
> +@@ -4231,7 +4201,7 @@ dnl Note also adjust exclude_expsyms for
> + =A0 extract_expsyms_cmds=3D
> +
> + =A0 case $host_os in
> +- =A0cygwin* | mingw* | pw32* | cegcc*)
> ++ =A0cygwin* | mingw* | pw32*)
> + =A0 =A0 # FIXME: the MSVC++ port hasn't been tested in a loooong time
> + =A0 =A0 # When not using gcc, we currently assume that we are using
> + =A0 =A0 # Microsoft Visual C++.
> +@@ -4318,7 +4288,7 @@ _LT_EOF
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 ;;
> +
> +- =A0 =A0cygwin* | mingw* | pw32* | cegcc*)
> ++ =A0 =A0cygwin* | mingw* | pw32*)
> + =A0 =A0 =A0 # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually mea=
ningless,
> + =A0 =A0 =A0 # as there is no search path for DLLs.
> + =A0 =A0 =A0 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=3D'-L$libdir'
> +@@ -4384,9 +4354,6 @@ _LT_EOF
> + =A0 =A0 =A0 =A0 tmp_addflag=3D' -i_dynamic -nofor_main' ;;
> + =A0 =A0 =A0 ifc* | ifort*) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# Intel F=
ortran compiler
> + =A0 =A0 =A0 =A0 tmp_addflag=3D' -nofor_main' ;;
> +- =A0 =A0 =A0lf95*) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#=
 Lahey Fortran 8.1
> +- =A0 =A0 =A0 =A0_LT_TAGVAR(whole_archive_flag_spec, $1)=3D
> +- =A0 =A0 =A0 =A0tmp_sharedflag=3D'--shared' ;;
> + =A0 =A0 =A0 xl[[cC]]*) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# IBM=
 XL C 8.0 on PPC (deal with xlf below)
> + =A0 =A0 =A0 =A0 tmp_sharedflag=3D'-qmkshrobj'
> + =A0 =A0 =A0 =A0 tmp_addflag=3D ;;
> +@@ -4618,7 +4585,6 @@ _LT_EOF
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 fi
> +
> +- =A0 =A0 =A0_LT_TAGVAR(export_dynamic_flag_spec, $1)=3D'${wl}-bexpall'
> + =A0 =A0 =A0 # It seems that -bexpall does not export symbols beginning =
with
> + =A0 =A0 =A0 # underscore (_), so it is better to generate a list of sym=
bols to export.
> + =A0 =A0 =A0 _LT_TAGVAR(always_export_symbols, $1)=3Dyes
> +@@ -4673,7 +4639,7 @@ _LT_EOF
> + =A0 =A0 =A0 _LT_TAGVAR(export_dynamic_flag_spec, $1)=3D-rdynamic
> + =A0 =A0 =A0 ;;
> +
> +- =A0 =A0cygwin* | mingw* | pw32* | cegcc*)
> ++ =A0 =A0cygwin* | mingw* | pw32*)
> + =A0 =A0 =A0 # When not using gcc, we currently assume that we are using
> + =A0 =A0 =A0 # Microsoft Visual C++.
> + =A0 =A0 =A0 # hardcode_libdir_flag_spec is actually meaningless, as the=
re is
> +@@ -4777,7 +4743,7 @@ _LT_EOF
> + =A0 =A0 =A0 =A0 _LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared ${wl}+h ${w=
l}$soname -o $lib $libobjs $deplibs $compiler_flags'
> + =A0 =A0 =A0 =A0 ;;
> + =A0 =A0 =A0 ia64*)
> +- =A0 =A0 =A0 =A0_LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared -fPIC ${wl}=
+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_fl=
ags'
> ++ =A0 =A0 =A0 =A0_LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared ${wl}+h ${w=
l}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> + =A0 =A0 =A0 =A0 ;;
> + =A0 =A0 =A0 *)
> + =A0 =A0 =A0 =A0 _LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared -fPIC ${wl}=
+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $com=
piler_flags'
> +@@ -5562,7 +5528,6 @@ if test "$_lt_caught_CXX_error" !=3D yes;
> + =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 fi
> +
> +- =A0 =A0 =A0 =A0_LT_TAGVAR(export_dynamic_flag_spec, $1)=3D'${wl}-bexpa=
ll'
> + =A0 =A0 =A0 =A0 # It seems that -bexpall does not export symbols beginn=
ing with
> + =A0 =A0 =A0 =A0 # underscore (_), so it is better to generate a list of=
 symbols to
> + =A0 =A0 =A0 # export.
> +@@ -5621,7 +5586,7 @@ if test "$_lt_caught_CXX_error" !=3D yes;
> + =A0 =A0 =A0 =A0 esac
> + =A0 =A0 =A0 =A0 ;;
> +
> +- =A0 =A0 =A0cygwin* | mingw* | pw32* | cegcc*)
> ++ =A0 =A0 =A0cygwin* | mingw* | pw32*)
> + =A0 =A0 =A0 =A0 # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually=
 meaningless,
> + =A0 =A0 =A0 =A0 # as there is no search path for DLLs.
> + =A0 =A0 =A0 =A0 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=3D'-L$libdir'
> +@@ -7006,18 +6971,6 @@ AC_SUBST([GREP])
> + ])
> +
> +
> +-# _LT_DECL_OBJDUMP
> +-# --------------
> +-# If we don't have a new enough Autoconf to choose the best objdump
> +-# available, choose the one first in the user's PATH.
> +-m4_defun([_LT_DECL_OBJDUMP],
> +-[AC_CHECK_TOOL(OBJDUMP, objdump, false)
> +-test -z "$OBJDUMP" && OBJDUMP=3Dobjdump
> +-_LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
> +-AC_SUBST([OBJDUMP])
> +-])
> +-
> +-
> + # _LT_DECL_SED
> + # ------------
> + # Check for a fully-functional sed program, that truncates
> +Index: libiconv-1.13.1/libcharset/m4/ltversion.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libiconv-1.13.1.orig/libcharset/m4/ltversion.m4 =A0 =A02009-06-21 04=
:17:33.000000000 -0700
> ++++ libiconv-1.13.1/libcharset/m4/ltversion.m4 2010-06-01 02:57:31.30172=
6190 -0700
> +@@ -9,15 +9,15 @@
> +
> + # Generated from ltversion.in.
> +
> +-# serial 3012 ltversion.m4
> ++# serial 3017 ltversion.m4
> + # This file is part of GNU Libtool
> +
> +-m4_define([LT_PACKAGE_VERSION], [2.2.6])
> +-m4_define([LT_PACKAGE_REVISION], [1.3012])
> ++m4_define([LT_PACKAGE_VERSION], [2.2.6b])
> ++m4_define([LT_PACKAGE_REVISION], [1.3017])
> +
> + AC_DEFUN([LTVERSION_VERSION],
> +-[macro_version=3D'2.2.6'
> +-macro_revision=3D'1.3012'
> ++[macro_version=3D'2.2.6b'
> ++macro_revision=3D'1.3017'
> + _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
> + _LT_DECL(, macro_revision, 0)
> + ])
> +Index: libiconv-1.13.1/m4/ltversion.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libiconv-1.13.1.orig/m4/ltversion.m4 =A0 =A0 =A0 2009-06-21 04:17:33=
.000000000 -0700
> ++++ libiconv-1.13.1/m4/ltversion.m4 =A0 =A02010-06-01 02:57:31.301726190=
 -0700
> +@@ -9,15 +9,15 @@
> +
> + # Generated from ltversion.in.
> +
> +-# serial 3012 ltversion.m4
> ++# serial 3017 ltversion.m4
> + # This file is part of GNU Libtool
> +
> +-m4_define([LT_PACKAGE_VERSION], [2.2.6])
> +-m4_define([LT_PACKAGE_REVISION], [1.3012])
> ++m4_define([LT_PACKAGE_VERSION], [2.2.6b])
> ++m4_define([LT_PACKAGE_REVISION], [1.3017])
> +
> + AC_DEFUN([LTVERSION_VERSION],
> +-[macro_version=3D'2.2.6'
> +-macro_revision=3D'1.3012'
> ++[macro_version=3D'2.2.6b'
> ++macro_revision=3D'1.3017'
> + _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
> + _LT_DECL(, macro_revision, 0)
> + ])
> diff --git a/recipes/libiconv/libiconv.inc b/recipes/libiconv/libiconv.in=
c
> index 6bb85ef..11dfaf2 100644
> --- a/recipes/libiconv/libiconv.inc
> +++ b/recipes/libiconv/libiconv.inc
> @@ -6,21 +6,10 @@ PRIORITY =3D "optional"
> =A0NOTES =3D "Needs to be stripped down to: ascii iso8859-1 eucjp iso-202=
2jp gb utf8"
>
> =A0SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/libiconv/libiconv-${PV}.tar.gz =
\
> - =A0 =A0 =A0 =A0 =A0file://autotools.patch \
> - =A0 =A0 =A0 =A0 =A0file://preload.patch"
> + =A0 =A0 =A0 =A0 =A0"
>
> =A0S =3D "${WORKDIR}/libiconv-${PV}"
>
> =A0inherit autotools gettext
>
> -EXTRA_OECONF +=3D "--enable-shared --enable-static --enable-relocatable =
--disable-rpath"
> -
> -do_configure_append () {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 # Fix stupid libtool... handling. rpath han=
dling can't be disabled and the Makefile's can't be regenerated..
> - =A0 =A0 =A0 =A0# (GNU sed required)
> - =A0 =A0 =A0 =A0sed -i s/^hardcode_libdir_flag_spec/#hardcode_libdir_fla=
g_spec/ ${S}/*-libtool
> -}
> -
> -do_stage () {
> - =A0 =A0 =A0 autotools_stage_all
> -}
> +EXTRA_OECONF +=3D "--enable-shared --enable-static --enable-relocatable"
> diff --git a/recipes/libiconv/libiconv_1.12.bb b/recipes/libiconv/libicon=
v_1.12.bb
> index a38248e..83774d6 100644
> --- a/recipes/libiconv/libiconv_1.12.bb
> +++ b/recipes/libiconv/libiconv_1.12.bb
> @@ -11,5 +11,15 @@ EXTRA_OECONF +=3D =A0"${@['--disable-nls','--enable-nl=
s'][bb.data.getVar('USE_NLS',
>
> =A0LEAD_SONAME =3D "libiconv.so"
>
> +SRC_URI +=3D "file://autotools.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0file://preload.patch \
> + =A0 =A0 =A0 =A0 =A0 "
> +do_configure_append () {
> + =A0 =A0 =A0 =A0# Fix stupid libtool... handling.
> + =A0 =A0 =A0 # rpath handling can't be disabled and the Makefile's can't=
 be regenerated..
> + =A0 =A0 =A0 =A0# (GNU sed required)
> + =A0 =A0 =A0 =A0sed -i s/^hardcode_libdir_flag_spec/#hardcode_libdir_fla=
g_spec/ ${S}/*-libtool
> +}
> +
> =A0SRC_URI[md5sum] =3D "c2be282595751535a618ae0edeb8f648"
> =A0SRC_URI[sha256sum] =3D "a99e244fd78babb95ea3c9a5c88b964994edaa1d15fd8d=
de5b4067801e23f0cd"
> diff --git a/recipes/libiconv/libiconv_1.13.1.bb b/recipes/libiconv/libic=
onv_1.13.1.bb
> new file mode 100644
> index 0000000..3cd836f
> --- /dev/null
> +++ b/recipes/libiconv/libiconv_1.13.1.bb
> @@ -0,0 +1,24 @@
> +require libiconv.inc
> +LICENSE =3D "GPLv3 LGPLv2"
> +
> +PROVIDES =3D "virtual/libiconv"
> +PR =3D "r0"
> +
> +#gettext.class cant be inherit here so use this hack
> +DEPENDS =3D "${@['','gettext-native'][bb.data.getVar('USE_NLS', d, 1) =
=3D=3D 'yes']}"
> +
> +EXTRA_OECONF +=3D =A0"${@['--disable-nls','--enable-nls'][bb.data.getVar=
('USE_NLS', d, 1) =3D=3D 'yes']}"
> +
> +SRC_URI +=3D "file://autoconf.patch"
> +
> +do_configure_append () {
> + =A0 =A0 =A0 =A0# Fix stupid libtool... handling.
> + =A0 =A0 =A0 =A0# rpath handling can't be disabled and the Makefile's ca=
n't be regenerated..
> + =A0 =A0 =A0 =A0# (GNU sed required)
> + =A0 =A0 =A0 =A0sed -i s/^hardcode_libdir_flag_spec/#hardcode_libdir_fla=
g_spec/ ${S}/*-libtool
> +}
> +
> +LEAD_SONAME =3D "libiconv.so"
> +SRC_URI[md5sum] =3D "7ab33ebd26687c744a37264a330bbe9a"
> +SRC_URI[sha256sum] =3D "55a36168306089009d054ccdd9d013041bfc3ab26be7033d=
107821f1c4949a49"
> +
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



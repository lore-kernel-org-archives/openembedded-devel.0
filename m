Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5576DC54E66
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 04:38:28 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.13322.1710477503884199246
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 21:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FNrv9yJr;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-22181888b88so1353286fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 21:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710477503; x=1711082303; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjDeczdkTeV/Wkvm7+y4d/XaNal6L50cPbFLxwVK2zY=;
        b=FNrv9yJr20XED/3DhLQEwB2KbchfwIPejtEi3trH0cJCQb2YM36xrGOb5E8U0owZ2L
         8UoQSFsLlM2EKWWhRllnOQOFI1UxOI2UnCQCh+j/N2ZDPHV7lZr6omq69Yu3B1WPbrDU
         xseed4u85ENPIhl0zLca104iW0g2Tlryjk8YfR1R121RI3WWkOE/dGHCNVzlLnd2SKoQ
         ui1NWNV1wLx+Nm/ak4mSYrMWUqRoRASIJCCVCWKJemo2dMnxvSoFtFMhLBPCwIPJmLFx
         FP54rCR4JBvWrydZujrOR/OrzJYkgn1xOgmj+E3YgNk36Lps1NdoR6WpeBSzlZNqOURN
         uEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710477503; x=1711082303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjDeczdkTeV/Wkvm7+y4d/XaNal6L50cPbFLxwVK2zY=;
        b=Bw/fXH5HGspMlnXgo1FL1045GEy6uEljw5VrTykHTOxl9Y3pbfsXQF3DCoIE2BnU4w
         BFAH1U5960I3iVW+HvfbUW8lPTQ23FImUXZkm3tTtNeISgI3BRQuQaCn53+FBzsXw5DM
         uX2DudLaKXDOVnimjdRGntMNpKqkvSlzdzWdMb/nmMEv6NkCU7Kw6FBd5tvat6wjuhWv
         IBbpjthYaOT4YBD/CzyUs+lQgH2AAX0Y99+U4NjenGwtCp9x5OeK8W8qc7xEhwRV+Hh5
         CIJd/WFfhWyQScEBI2J8zkQl43Tptjs0U/2TkxTZIvKclHsHS8djZLut8AEF+HXlPM/x
         u2Jg==
X-Gm-Message-State: AOJu0YxvJvRWn49s3jy6RC8EoMt3rh/EhRP6vj4DO66zGtJscvDAhQsM
	CHTzrWPQfe3MrvxlrOiTX6xpN7mr7EvLT/ni/4vkZHxQvNv7IMzdmQnpGFkDURBSq/PzN43OXfc
	RNfGTeBejizIjJd1BxLjY6qX3/Xu2QotVqsI=
X-Google-Smtp-Source: AGHT+IEsO1QyEhWI4Fbi4nRjKTeANHFKebByW2jk4s1bI6YV3smNhCloQMQTaAODDYpZhrg2SRTMiCUEEVTvrM4JlAM=
X-Received: by 2002:a05:6870:ac27:b0:21e:e5db:7964 with SMTP id
 kw39-20020a056870ac2700b0021ee5db7964mr4122594oab.23.1710477502861; Thu, 14
 Mar 2024 21:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <0afe6e7d5c9f3de0c3b82a646236bb9bbbe8210f.1710445397.git.joerg.sommer@navimatix.de>
In-Reply-To: <0afe6e7d5c9f3de0c3b82a646236bb9bbbe8210f.1710445397.git.joerg.sommer@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2024 21:37:56 -0700
Message-ID: <CAMKF1sqA7eN1pMRKzeSQp8UZKhdADaW5yHLaXZHOd9+-jDaexA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH v2] spandsp: new telephony DSP library
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 04:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109325

fails to build with musl/clang

https://snips.sh/f/qCR86Rwwz1

On Thu, Mar 14, 2024 at 12:43=E2=80=AFPM J=C3=B6rg Sommer via
lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../spandsp/spandsp/configure.patch           |  56 ++++++
>  .../spandsp/spandsp/makefile.patch            | 161 ++++++++++++++++++
>  .../recipes-multimedia/spandsp/spandsp_git.bb |  47 +++++
>  3 files changed, 264 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/spandsp/spandsp/co=
nfigure.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/spandsp/spandsp/ma=
kefile.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/spandsp/spandsp_gi=
t.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp/configure=
.patch b/meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.patch
> new file mode 100644
> index 000000000..af504be76
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.patch
> @@ -0,0 +1,56 @@
> +From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.d=
e>
> +Date: Thu, 14 Mar 2024 09:41:57 +0100
> +Subject: [PATCH 2/2] configure: Replace manual search for libxml by
> + AC_CHECK_LIB
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The manual search fails if the include directories (and build environmen=
t)
> +are located somewhere else.
> +
> +Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> +Upstream-Status: Submitted [https://github.com/freeswitch/spandsp/pull/7=
4]
> +---
> +
> +ERROR: spandsp-3.0.0+git-r0 do_configure: QA Issue: This autoconf log in=
dicates errors, it looked at host include and/or library paths while determ=
ining system capabilities.
> +
> + configure.ac | 22 +++++-----------------
> + 1 file changed, 5 insertions(+), 17 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 2140837..b5138d6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -185,23 +185,11 @@ then
> + fi
> +
> + # Determine XML2 include path
> +-AC_MSG_CHECKING(for libxml/xmlmemory.h)
> +-
> +-# Can we include headers using system include dirs?
> +-AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <libxml/xmlmemory.h>]], [=
[int a =3D 1;]])],[XML2_INCLUDE=3D" "],[XML2_INCLUDE=3D])
> +-
> +-# Hunt through several possible directories to find the includes for li=
bxml2
> +-if test "x$XML2_INCLUDE" =3D "x"; then
> +-    old_CPPFLAGS=3D"$CPPFLAGS"
> +-    for i in $xml2_include_dir /usr/include /usr/local/include /usr/inc=
lude/libxml2 /usr/local/include/libxml2 ; do
> +-        CPPFLAGS=3D"$old_CPPFLAGS -I$i"
> +-        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <libxml/xmlmemory=
.h>]], [[int a =3D 1;]])],[XML2_INCLUDE=3D"-I$i"],[XML2_INCLUDE=3D
> +-        ])
> +-        if test "x$XML2_INCLUDE" !=3D "x"; then
> +-            break;
> +-        fi
> +-    done
> +-    CPPFLAGS=3D"$old_CPPFLAGS $XML2_INCLUDE"
> ++AC_CHECK_LIB([xml2], [xmlParseFile], [libxml2_found=3Dyes])
> ++if test "$libxml2_found" =3D "yes" ; then
> ++    AC_DEFINE(HAVE_LIBXML2,1,[defined when libxml2 is available])
> ++else
> ++    AC_MSG_WARN([libxml2 not found. Disabling cache.])
> + fi
> +
> + AC_CHECK_HEADERS([libxml/xmlmemory.h])
> +--
> +2.34.1
> +
> diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.=
patch b/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.patch
> new file mode 100644
> index 000000000..d3eb047fe
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.patch
> @@ -0,0 +1,161 @@
> +From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.d=
e>
> +Date: Thu, 14 Mar 2024 08:08:13 +0100
> +Subject: [PATCH 1/2] configure: Use AX_PROG_CC_FOR_BUILD for cross compi=
ling
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The macro AX_PROG_CC_FOR_BUILD [1] sets the variables CC_FOR_BUILD and
> +..._FLAGS_FOR_BUILD they can be used [2] to build binaries used at compi=
le
> +time.
> +
> +[1]: https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.=
html
> +[2]: https://stackoverflow.com/questions/24201260/autotools-cross-compil=
ation-and-generated-sources/24208587#24208587
> +
> +Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> +Upstream-Status: Submitted [https://github.com/freeswitch/spandsp/pull/7=
4]
> +---
> + configure.ac    | 49 +-------------------------------------------
> + src/Makefile.am | 54 +++++++++++++++++++++++++------------------------
> + 2 files changed, 29 insertions(+), 74 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 96fd022..2140837 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -55,54 +55,7 @@ AC_LANG([C])
> +
> + AX_COMPILER_VENDOR
> +
> +-if test "${build}" !=3D "${host}"
> +-then
> +-    # If we are doing a Canadian Cross, in which the host and build sys=
tems
> +-    # are not the same, we set reasonable default values for the tools.
> +-
> +-    CC_FOR_BUILD=3D${CC_FOR_BUILD-gcc}
> +-    CPPFLAGS_FOR_BUILD=3D"\$(CPPFLAGS)"
> +-    CC=3D${CC-${host_alias}-gcc}
> +-    CFLAGS=3D${CFLAGS-"-g -O2"}
> +-    CXX=3D${CXX-${host_alias}-c++}
> +-    CXXFLAGS=3D${CXXFLAGS-"-g -O2"}
> +-else
> +-    # Set reasonable default values for some tools even if not Canadian=
.
> +-    # Of course, these are different reasonable default values, origina=
lly
> +-    # specified directly in the Makefile.
> +-    # We don't export, so that autoconf can do its job.
> +-    # Note that all these settings are above the fragment inclusion poi=
nt
> +-    # in Makefile.in, so can still be overridden by fragments.
> +-    # This is all going to change when we autoconfiscate...
> +-    CC_FOR_BUILD=3D"\$(CC)"
> +-    CPPFLAGS_FOR_BUILD=3D"\$(CPPFLAGS)"
> +-    AC_PROG_CC
> +-
> +-    # We must set the default linker to the linker used by gcc for the =
correct
> +-    # operation of libtool.  If LD is not defined and we are using gcc,=
 try to
> +-    # set the LD default to the ld used by gcc.
> +-    if test -z "$LD"
> +-    then
> +-        if test "$GCC" =3D yes
> +-        then
> +-            case $build in
> +-            *-*-mingw*)
> +-                gcc_prog_ld=3D`$CC -print-prog-name=3Dld 2>&1 | tr -d '=
\015'` ;;
> +-            *)
> +-                gcc_prog_ld=3D`$CC -print-prog-name=3Dld 2>&1` ;;
> +-            esac
> +-            case $gcc_prog_ld in
> +-            # Accept absolute paths.
> +-            [[\\/]* | [A-Za-z]:[\\/]*)]
> +-                LD=3D"$gcc_prog_ld" ;;
> +-            esac
> +-        fi
> +-    fi
> +-
> +-    CXX=3D${CXX-"c++"}
> +-    CFLAGS=3D${CFLAGS-"-g -O2"}
> +-    CXXFLAGS=3D${CXXFLAGS-"-g -O2"}
> +-fi
> ++AX_PROG_CC_FOR_BUILD
> +
> + AC_DEFUN([REMOVE_FROM_VAR],[
> +     new_val=3D""
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index e05fad5..9b409a1 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -386,44 +386,46 @@ noinst_HEADERS =3D cielab_luts.h \
> +                  v34_tx_pre_emphasis_filters.h \
> +                  v34_tables.h
> +
> +-make_at_dictionary$(EXEEXT): $(top_srcdir)/src/make_at_dictionary.c
> +-      $(CC_FOR_BUILD) -o make_at_dictionary$(EXEEXT) $(top_srcdir)/src/=
make_at_dictionary.c -DHAVE_CONFIG_H -I$(top_builddir)/src
> ++LINK_FOR_BUILD.c =3D $(CC_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/=
src $(CFLAGS_FOR_BUILD) $(CPPFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) $(TARGET=
_ARCH_FOR_BUILD)
> +
> +-make_cielab_luts$(EXEEXT): $(top_srcdir)/src/make_cielab_luts.c
> +-      $(CC_FOR_BUILD) -o make_cielab_luts$(EXEEXT) $(top_srcdir)/src/ma=
ke_cielab_luts.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
> ++make_at_dictionary$(BUILD_EXEEXT): $(top_srcdir)/src/make_at_dictionary=
.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^
> +
> +-make_math_fixed_tables$(EXEEXT): $(top_srcdir)/src/make_math_fixed_tabl=
es.c
> +-      $(CC_FOR_BUILD) -o make_math_fixed_tables$(EXEEXT) $(top_srcdir)/=
src/make_math_fixed_tables.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
> ++make_cielab_luts$(BUILD_EXEEXT): $(top_srcdir)/src/make_cielab_luts.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> +
> +-make_modem_filter$(EXEEXT): $(top_srcdir)/src/make_modem_filter.c $(top=
_srcdir)/src/filter_tools.c
> +-      $(CC_FOR_BUILD) -o make_modem_filter$(EXEEXT) $(top_srcdir)/src/m=
ake_modem_filter.c $(top_srcdir)/src/filter_tools.c -DHAVE_CONFIG_H -I$(top=
_builddir)/src -lm
> ++make_math_fixed_tables$(BUILD_EXEEXT): $(top_srcdir)/src/make_math_fixe=
d_tables.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> +
> +-make_modem_godard_coefficients$(EXEEXT): $(top_srcdir)/src/make_modem_g=
odard_coefficients.c $(top_srcdir)/src/filter_tools.c
> +-      $(CC_FOR_BUILD) -o make_modem_godard_coefficients$(EXEEXT) $(top_=
srcdir)/src/make_modem_godard_coefficients.c $(top_srcdir)/src/filter_tools=
.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
> ++make_modem_filter$(BUILD_EXEEXT): $(top_srcdir)/src/make_modem_filter.c=
 $(top_srcdir)/src/filter_tools.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> +
> +-make_t43_gray_code_tables$(EXEEXT): $(top_srcdir)/src/make_t43_gray_cod=
e_tables.c
> +-      $(CC_FOR_BUILD) -o make_t43_gray_code_tables$(EXEEXT) $(top_srcdi=
r)/src/make_t43_gray_code_tables.c -DHAVE_CONFIG_H -I$(top_builddir)/src -l=
m
> ++make_modem_godard_coefficients$(BUILD_EXEEXT): $(top_srcdir)/src/make_m=
odem_godard_coefficients.c $(top_srcdir)/src/filter_tools.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> +
> +-make_v17_v32_constellation_map$(EXEEXT): $(top_srcdir)/src/make_v17_v32=
_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
> +-      $(CC_FOR_BUILD) -o make_v17_v32_constellation_map$(EXEEXT) $(top_=
srcdir)/src/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top=
_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
> ++make_t43_gray_code_tables$(BUILD_EXEEXT): $(top_srcdir)/src/make_t43_gr=
ay_code_tables.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> +
> +-make_v17_v32_convolutional_encoder$(EXEEXT): $(top_srcdir)/src/make_v17=
_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/all=
oc.c
> +-      $(CC_FOR_BUILD) -o make_v17_v32_convolutional_encoder$(EXEEXT) $(=
top_srcdir)/src/make_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711=
.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
> ++make_v17_v32_constellation_map$(BUILD_EXEEXT): $(top_srcdir)/src/make_v=
17_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc=
.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> +
> +-make_v29_constellation_map$(EXEEXT): $(top_srcdir)/src/make_v29_constel=
lation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
> +-      $(CC_FOR_BUILD) -o make_v29_constellation_map$(EXEEXT) $(top_srcd=
ir)/src/make_v29_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)=
/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
> ++make_v17_v32_convolutional_encoder$(BUILD_EXEEXT): $(top_srcdir)/src/ma=
ke_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)/s=
rc/alloc.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> +
> +-make_v34_convolutional_coders$(EXEEXT): $(top_srcdir)/src/make_v34_conv=
olutional_coders.c
> +-      $(CC_FOR_BUILD) -o make_v34_convolutional_coders$(EXEEXT) $(top_s=
rcdir)/src/make_v34_convolutional_coders.c -DHAVE_CONFIG_H -I$(top_builddir=
)/src -lm
> ++make_v29_constellation_map$(BUILD_EXEEXT): $(top_srcdir)/src/make_v29_c=
onstellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> +
> +-make_v34_probe_signals$(EXEEXT): $(top_srcdir)/src/make_v34_probe_signa=
ls.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
> +-      $(CC_FOR_BUILD) -o make_v34_probe_signals$(EXEEXT) $(top_srcdir)/=
src/make_v34_probe_signals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/all=
oc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
> ++make_v34_convolutional_coders$(BUILD_EXEEXT): $(top_srcdir)/src/make_v3=
4_convolutional_coders.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^ -lm
> +
> +-make_v34_shell_map$(EXEEXT): $(top_srcdir)/src/make_v34_shell_map.c
> +-      $(CC_FOR_BUILD) -o make_v34_shell_map$(EXEEXT) $(top_srcdir)/src/=
make_v34_shell_map.c -DHAVE_CONFIG_H -I$(top_builddir)/src
> ++make_v34_probe_signals$(BUILD_EXEEXT): $(top_srcdir)/src/make_v34_probe=
_signals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^ -I$(top_srcdir)/src -lm
> +
> +-make_v34_tx_pre_emphasis_filters$(EXEEXT): $(top_srcdir)/src/make_v34_t=
x_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c
> +-      $(CC_FOR_BUILD) -o make_v34_tx_pre_emphasis_filters$(EXEEXT) $(to=
p_srcdir)/src/make_v34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor=
-engine.c -DHAVE_CONFIG_H -I$(top_builddir)/src -I$(top_builddir)/tools -lm
> ++make_v34_shell_map$(BUILD_EXEEXT): $(top_srcdir)/src/make_v34_shell_map=
.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^
> ++
> ++make_v34_tx_pre_emphasis_filters$(BUILD_EXEEXT): $(top_srcdir)/src/make=
_v34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c
> ++      $(LINK_FOR_BUILD.c) -o $@ $^ -I$(top_srcdir)/tools -lm
> +
> + # We need to run make_at_dictionary, so it generates the
> + # at_interpreter_dictionary.h file
> +--
> +2.34.1
> +
> diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb b/=
meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
> new file mode 100644
> index 000000000..84bc4a8f1
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
> @@ -0,0 +1,47 @@
> +SUMMARY =3D "A DSP library for telephony"
> +DESCRIPTION =3D "\
> +    SpanDSP is a low-level signal processing library that modulates and =
\
> +    demodulates signals commonly used in telephony, such as the \"noise\=
" \
> +    generated by a fax modem or DTMF touchpad. \
> +"
> +HOMEPAGE =3D "https://www.soft-switch.org/"
> +BUGTRACKER =3D "https://github.com/freeswitch/spandsp/issues"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8791c23ddf418deb5be264cffb5fa=
6bc"
> +
> +DEPENDS =3D "\
> +    libxml2 \
> +    tiff \
> +    tiff-native \
> +"
> +
> +PV =3D "3.0.0+git"
> +
> +SRC_URI =3D "\
> +    git://github.com/freeswitch/spandsp.git;protocol=3Dhttps;branch=3Dma=
ster \
> +    file://configure.patch \
> +    file://makefile.patch \
> +"
> +SRCREV =3D "7b0b8cf3d42b725405bcc63145de5e280265ce4e"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +PACKAGECONFIG ?=3D ""
> +
> +PACKAGECONFIG[mmx] =3D "--enable-mmx,--disable-mmx"
> +PACKAGECONFIG[sse] =3D "--enable-sse,--disable-sse"
> +PACKAGECONFIG[sse2] =3D "--enable-sse2,--disable-sse2"
> +PACKAGECONFIG[sse3] =3D "--enable-sse3,--disable-sse3"
> +PACKAGECONFIG[ssse3] =3D "--enable-ssse3,--disable-ssse3"
> +PACKAGECONFIG[sse4-1] =3D "--enable-sse4-1,--disable-sse4-1"
> +PACKAGECONFIG[sse4-2] =3D "--enable-sse4-2,--disable-sse4-2"
> +PACKAGECONFIG[avx] =3D "--enable-avx,--disable-avx"
> +PACKAGECONFIG[avx2] =3D "--enable-avx2,--disable-avx2"
> +PACKAGECONFIG[neon] =3D "--enable-neon,--disable-neon"
> +PACKAGECONFIG[fixed-point] =3D "--enable-fixed-point,--disable-fixed-poi=
nt"
> +PACKAGECONFIG[v32bis] =3D "--enable-v32bis,--disable-v32bis"
> +PACKAGECONFIG[v34] =3D "--enable-v34,--disable-v34"
> +PACKAGECONFIG[sslfax] =3D "--enable-sslfax,--disable-sslfax"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109321): https://lists.openembedded.org/g/openembedde=
d-devel/message/109321
> Mute This Topic: https://lists.openembedded.org/mt/104933829/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


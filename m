Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.15357.1604943966918474968
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Li2la2/3;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id p12so6583986qtp.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/N/NaaRGoQMwCm9qBnCvG/RaiVVNJw5wdrJ27lephOU=;
        b=Li2la2/3jaUFPNH5rID7qlafX+zM665oDBux1DwvtfNYhP26a+gPuLa20/+2zAjplR
         +Qfn8ERid/9h/YJVta/p/D9to9koGUgyoxE/vMnPYS50NsAfePK5VoxoJ2vYIpf53GpT
         XByqPWCUbE64VDj9QiaQAIQjOIr62bHRV2SYCdXFJUE1l2cnjOvZ0jUzQPkQ6mDqQ4ly
         edU1anlnCiwo/oG7UuudQFx2e+fIo6dfeodMqbkExmeXBCbgziZ4O+1EFvx5TghbXxYU
         ejXrW8Jk53OiEOMcTKuAwFpRs/vizTjFzJ509YqZo9/mrHwQNj/7p+QdSr9h59cbxe4e
         tN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/N/NaaRGoQMwCm9qBnCvG/RaiVVNJw5wdrJ27lephOU=;
        b=FxDZxD81B6XC1Psbfb2DaocK/QtthTwquF7DWLCAYgDT9m0+R7nRjWHVEFA1x+ktMY
         jFIBJEH0VFDw+QyUncBQ9tKT0Qi4AiKn8kfs+dDVbBiQuGPvqmrU5ITLcxr8UGfRD0sX
         HgoqMHcgXQTEGGzzqPioF/88uCFf428tQfh948NPXerP30cDbauTEFzv0YuhMlJPsirc
         7WNqKl0Pr/3uDUWcDNcOas4TURUObAemYwdML34SG6kP0eFyZCd5KL+wJQUgdfi9z0+1
         aFhSbSqjOR+DM4s/ps3Nip1EvegwEqqW2o5ACvpQPPlB6/6SmV49fYbLQ18vQqiacZIV
         +LJg==
X-Gm-Message-State: AOAM532ba4lIU3E9CgDsTJmGosUGylQbnu7MgnBel1Xp8thPRcRXF+vq
	OQL+g/9lLv2AAGrrj9E8mIVUlANkampinbn6oh1y3G+5TGI=
X-Google-Smtp-Source: ABdhPJxm6syz4PWFuLTAJEbVqnr6kRMOAok+d/Mi7iyEFWK15aG8jTqJcMUCYcn4mJQJ+phtS8eD3IqyEQmI+ROAJcE=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr13786219qtb.80.1604943965609;
 Mon, 09 Nov 2020 09:46:05 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1srZNRHHq20v2rE1jzRpzT562VjUK6U0_-rYyA3qr4SzyA@mail.gmail.com>
 <20201109081503.19713-1-mingli.yu@windriver.com>
In-Reply-To: <20201109081503.19713-1-mingli.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Nov 2020 09:45:39 -0800
Message-ID: <CAMKF1sru02J6BaL=1c_=2Xkm7ocFT-dBiMZbDZH-x1F-crvidg@mail.gmail.com>
Subject: Re: [meta-networking][PATCH v3 4/4] ntop: remove the recipe
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am still not able to apply it once I get it from patchwork.

On Mon, Nov 9, 2020 at 12:15 AM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> The ntop project is inactive and there is no new version
> since 2012 [1] and it has been replaced by ntopng.
>
> [1] https://sourceforge.net/projects/ntop/files/ntop/Stable/
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../ntop/0001-nDPI-Include-sys-types.h.patch  |  26 --
>  ...-Makefile.am-fix-for-automake-1.16.1.patch |  74 ------
>  .../ntop/ntop/embed-libs.patch                |  20 --
>  ...issing-return-from-non-void-function.patch |  19 --
>  .../recipes-support/ntop/ntop/ntop.service    |  15 --
>  .../ntop/ntop/ntop_configure_in.patch         | 164 -------------
>  ...p_configure_in_net_snmp_config_exist.patch |  21 --
>  .../recipes-support/ntop/ntop/ntop_init.patch | 228 ------------------
>  .../ntop/ntop/ntop_webInterface.patch         |  19 --
>  .../ntop/ntop/use-static-inline.patch         |  32 ---
>  .../recipes-support/ntopng/ntopng_4.2.bb      |  48 ----
>  11 files changed, 666 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop/embed-libs.patch
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop.service
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_init.patch
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch
>  delete mode 100644 meta-networking/recipes-support/ntop/ntop/use-static-inline.patch
>  delete mode 100644 meta-networking/recipes-support/ntopng/ntopng_4.2.bb
>
> diff --git a/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch b/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch
> deleted file mode 100644
> index 81ffeec21..000000000
> --- a/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 6543f3e2d5fe214e2fc6c050289bf1ae73b18724 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 30 Aug 2017 13:56:24 -0700
> -Subject: [PATCH] nDPI: Include sys/types.h
> -
> -Needed for uint_t types
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - nDPI/src/include/ipq_api.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -Index: ntop-5.0.1/nDPI/src/include/ipq_api.h
> -===================================================================
> ---- ntop-5.0.1.orig/nDPI/src/include/ipq_api.h
> -+++ ntop-5.0.1/nDPI/src/include/ipq_api.h
> -@@ -24,6 +24,7 @@
> - #ifndef __IPOQUE_API_INCLUDE_FILE__
> - #define __IPOQUE_API_INCLUDE_FILE__
> -
> -+#include <sys/types.h>
> -
> - #if defined(HAVE_NTOP) && defined(WIN32)
> - #include <winsock2.h>
> diff --git a/meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch b/meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch
> deleted file mode 100644
> index d6f7eb555..000000000
> --- a/meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From d22ddc73f00ed056032a635ee8379305ec83bf81 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Wed, 11 Jul 2018 12:02:50 +0800
> -Subject: [PATCH] plugins/Makefile.am: fix for automake 1.16.1
> -
> -Fixed:
> -| i586-poky-linux-gcc: error: netflowPlugin.o: No such file or directory
> -| i586-poky-linux-gcc: error: unrecognized command line option '-flat_namespace'; did you mean '-Wnamespaces'?
> -| i586-poky-linux-gcc: fatal error: no input files
> -
> -The previous code make things complicated, but we don't have to, let libtool do
> -most of the things can fix the problem.
> -
> -Upstream-Status: Pending [ntop is not longer maintained any more, we need consider moving to ntopng]
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - plugins/Makefile.am | 34 ++++++----------------------------
> - 1 file changed, 6 insertions(+), 28 deletions(-)
> -
> -diff --git a/plugins/Makefile.am b/plugins/Makefile.am
> -index 64492e0..bcd0c10 100644
> ---- a/plugins/Makefile.am
> -+++ b/plugins/Makefile.am
> -@@ -69,40 +69,18 @@ libsflowPlugin_la_CFLAGS = $(AM_CFLAGS)
> - # by default ntop looks for plugins in the plugins/ subdirectory
> - #
> -
> --
> --.libs/libnetflowPlugin.so@SO_VERSION_PATCH@:
> --      @if test -f libnetflowPlugin_la-netflowPlugin.o; then \
> --      $(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libnetflowPlugin.so@SO_VERSION_PATCH@ libnetflowPlugin_la-netflowPlugin.o; \
> --      else \
> --      $(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libnetflowPlugin.so@SO_VERSION_PATCH@ netflowPlugin.o; \
> --      fi
> --
> --netflowPlugin.so$(EXEEXT): .libs/libnetflowPlugin.so@SO_VERSION_PATCH@
> --      @$(LN_S) .libs/libnetflowPlugin.so netflowPlugin.so
> -+netflowPlugin.so$(EXEEXT): libnetflowPlugin.la
> -+      @$(LN_S) -f .libs/libnetflowPlugin.so netflowPlugin.so
> -
> - ###############
> -
> --.libs/librrdPlugin.so@SO_VERSION_PATCH@:
> --      @if test -f librrdPlugin_la-rrdPlugin.o; then \
> --      $(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/librrdPlugin.so@SO_VERSION_PATCH@ librrdPlugin_la-rrdPlugin.o; \
> --      else \
> --      $(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/librrdPlugin.so@SO_VERSION_PATCH@ rrdPlugin.o; \
> --      fi
> --
> --rrdPlugin.so$(EXEEXT): .libs/librrdPlugin.so@SO_VERSION_PATCH@
> --      @$(LN_S) .libs/librrdPlugin.so rrdPlugin.so
> -+rrdPlugin.so$(EXEEXT): librrdPlugin.la
> -+      @$(LN_S) -f .libs/librrdPlugin.so rrdPlugin.so
> -
> - ###############
> -
> --.libs/libsflowPlugin.so@SO_VERSION_PATCH@:
> --      @if test -f libsflowPlugin_la-sflowPlugin.o; then \
> --      $(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libsflowPlugin.so@SO_VERSION_PATCH@ libsflowPlugin_la-sflowPlugin.o; \
> --      else \
> --      $(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libsflowPlugin.so@SO_VERSION_PATCH@ sflowPlugin.o; \
> --      fi
> --
> --sflowPlugin.so$(EXEEXT): .libs/libsflowPlugin.so@SO_VERSION_PATCH@
> --      @$(LN_S) .libs/libsflowPlugin.so sflowPlugin.so
> -+sflowPlugin.so$(EXEEXT): libsflowPlugin.la
> -+      @$(LN_S) -f .libs/libsflowPlugin.so sflowPlugin.so
> -
> - ###############
> -
> ---
> -2.7.4
> -
> diff --git a/meta-networking/recipes-support/ntop/ntop/embed-libs.patch b/meta-networking/recipes-support/ntop/ntop/embed-libs.patch
> deleted file mode 100644
> index 2d1ab7371..000000000
> --- a/meta-networking/recipes-support/ntop/ntop/embed-libs.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Use --embed option so that it can return libpython as well
> -
> -% ../recipe-sysroot-native/usr/bin/python3-native/python3-config --libs --embed
> --lpython3.8 -lcrypt -lpthread -ldl -lutil -lm -lm
> -[kraj@apollo /mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/ntop/5.0.1-r0/ntop-5.0.1]
> -% ../recipe-sysroot-native/usr/bin/python3-native/python3-config --libs
> --lcrypt -lpthread -ldl -lutil -lm -lm
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1463,7 +1463,7 @@ dnl>
> -   fi
> -
> -   if test "x$PYTHON_CONFIG" != "x"; then
> --    PYTHON_LIBS="`$PYTHON_CONFIG --libs`"
> -+    PYTHON_LIBS="`$PYTHON_CONFIG --libs --embed`"
> -     if test "x$PYTHON_LIBS" = "x"; then
> -       AC_MSG_RESULT(Python[-devel] support is present but misconfigured)
> -     else
> diff --git a/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch b/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
> deleted file mode 100644
> index e627e59a5..000000000
> --- a/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Fix following error:
> -
> -netflowPlugin.c: In function 'netflowUtilsLoop':
> -netflowPlugin.c:2144:1: error: no return statement in function returning non-void [-Werror=return-type]
> - 2144 | }
> -      | ^
> -
> -Return NULL like netflowMainLoop does.
> -
> ---- ntop-5.0.1.orig/plugins/netflowPlugin.c    2012-03-09 17:44:17.000000000 +0000
> -+++ ntop-5.0.1/plugins/netflowPlugin.c 2019-08-09 10:25:40.878799852 +0000
> -@@ -2141,6 +2141,7 @@
> -       waitCondvar(&myGlobals.device[deviceId].netflowGlobals->ifStatsQueueCondvar);
> -     }
> -   }
> -+  return(NULL);
> - }
> - #endif
> -
> diff --git a/meta-networking/recipes-support/ntop/ntop/ntop.service b/meta-networking/recipes-support/ntop/ntop/ntop.service
> deleted file mode 100644
> index 1ead2a0c5..000000000
> --- a/meta-networking/recipes-support/ntop/ntop/ntop.service
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -[Unit]
> -Description=A network traffic probe similar to the UNIX top command
> -Requires=network.target
> -
> -ConditionPathExists=@SYSCONFDIR@/ntop.conf
> -After=syslog.target network.target
> -
> -[Service]
> -Type=oneshot
> -RemainAfterExit=yes
> -ExecStart=@LIBEXECDIR@/ntop-helper start
> -ExecStop=@LIBEXECDIR@/ntop-helper stop
> -
> -[Install]
> -WantedBy=multi-user.target
> diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch b/meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch
> deleted file mode 100644
> index 392cb082b..000000000
> --- a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch
> +++ /dev/null
> @@ -1,164 +0,0 @@
> -1)add --with-pcap-config option to use libpcap's pcap-config
> -2)add AC_CHECK_LIB if user didn't specify PCAP_ROOT and pcap-config
> -  put it before host check to make cross-compiling easier.
> -  pcap doesn't need extra include and libs so it is fine.
> -3)remove old rrd configure code but use pkg-config to config rrd
> -  rrdtool should have the pkg-config file installed.
> -4)fix python-config
> -5)change AC_TRY_RUN to AC_COMPILE_IFELSE for pthread_rwlock_t checking
> -6)fix a net-snmp-config bug
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ----
> -diff --git a/configure.in b/configure.in
> -index 0c7c0a5..cad40be 100644
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -230,14 +230,14 @@ dnl>
> - AC_ARG_WITH(void,
> -               [  +-External-source-locations:-------------------------------------------------+])
> -
> --AC_ARG_WITH(  rrd-home,
> --              [  --with-rrd-home=DIR        Usually /usr/local/rrdtool-1.2.x],
> --              RRD_HOME="$withval",
> --              RRD_HOME=/usr/local/rrdtool-1.2.19)
> - AC_ARG_WITH(  pcap-root,
> -               [  --with-pcap-root=DIR        LBNL pcap located in DIR],
> -               PCAP_ROOT="$withval",
> -               PCAP_ROOT=)
> -+AC_ARG_WITH(  pcap-config,
> -+              [  --with-pcap-config=path/pcap-config where to find pcap-config],
> -+              PCAP_CONFIG="$withval",
> -+              PCAP_CONFIG=)
> - AC_ARG_WITH(  gdbm-root,
> -               [  --with-gdbm-root=DIR        gdbm located in DIR],
> -               GDBM_DIRECTORY="$withval",
> -@@ -556,6 +556,7 @@ if test ".${PCAPRING_DIR}" != .; then
> - else
> -
> - TMP_ROOT=${HOME}/PF_RING/userland/libpcap/
> -+FOUND_PCAP=1
> - if test ".${PCAP_ROOT}" == . &&
> -    test -d ${TMP_ROOT} &&
> -    test -r ${TMP_ROOT}/libpcap.a; then
> -@@ -563,6 +564,18 @@ if test ".${PCAP_ROOT}" == . &&
> -        CORELIBS="${CORELIBS} -L${TMP_ROOT} -L${HOME}/PF_RING/userland/lib -lpfring -lpcap "
> -        INCS="${INCS} -I ${PCAP_ROOT}"
> -        AC_MSG_RESULT([found in $PCAP_ROOT])
> -+elif test -n "${PCAP_CONFIG}" && test -x "${PCAP_CONFIG}"; then
> -+       CORELIBS="${CORELIBS} $(${PCAP_CONFIG} --libs)"
> -+       INCS="${INCS} $(${PCAP_CONFIG} --cflags)"
> -+       AC_DEFINE_UNQUOTED(HAVE_LIBPCAP, 1, [have libpcap ])
> -+       AC_MSG_RESULT([found pcap-config: $PCAP_CONFIG, libs:$(${PCAP_CONFIG} --libs) cflags:$(${PCAP_CONFIG} --cflags)])
> -+else
> -+     AC_CHECK_LIB(pcap, pcap_lookupdev, ,
> -+        [FOUND_PCAP=])
> -+fi
> -+
> -+if test -n "$FOUND_PCAP"; then
> -+      :
> - elif test ".${PCAP_ROOT}" != .; then
> -   if test -d $PCAP_ROOT &&
> -      test -r $PCAP_ROOT/lib/libpcap.a &&
> -@@ -880,44 +893,11 @@ AC_CHECK_LIB([z], [zlibVersion], [], [
> -         exit -1
> -         ])
> -
> --# RRD
> --if test -d "$RRD_HOME"; then
> --   AC_MSG_RESULT(checking for RRD home... yes)
> --else
> --   RRD_HOME=/usr/local/rrdtool
> --   if test -d "$RRD_HOME"; then
> --      AC_MSG_RESULT(Checking rrdtool in $RRD_HOME)
> --   else
> --      RRD_HOME=/usr/local
> --   fi
> --fi
> --
> --RRD_LIB="-L${RRD_HOME}/lib -lrrd_th"
> --
> --if test -f "$RRD_HOME/lib/librrd_th.so"; then
> --   AC_MSG_RESULT(checking for rrdtool... yes)
> --else
> --  if test -f "$RRD_HOME/lib/librrd_th.dylib"; then # OSX
> --     AC_MSG_RESULT(checking for rrdtool... yes)
> --  else
> --     if test -f "$RRD_HOME/lib/librrd_th.a"; then
> --       AC_MSG_RESULT(checking for rrdtool... yes)
> --     else
> --       AC_CHECK_LIB([rrd_th], [main])
> --       if test ".${ac_cv_lib_rrd_th_main}" != ".yes"; then
> --         AC_MSG_ERROR(Unable to find RRD at $RRD_HOME: please use --with-rrd-home=DIR);
> --       AC_MSG_ERROR(RRD source can be downloaded from http://www.rrdtool.org/);
> --       else
> --         RRD_LIB=
> --       fi
> --     fi
> --  fi
> --fi
> --
> --RRD_INC=
> --if test -d "${RRD_HOME}/include"; then
> --  RRD_INC="-I${RRD_HOME}/include"
> --fi
> -+PKG_CHECK_MODULES( [RRD], [librrd] )
> -+AC_SUBST(RRD_CFLAGS)
> -+AC_SUBST(RRD_LIBS)
> -+RRD_INC=$RRD_FLAGS
> -+RRD_LIB=$RRD_LIBS
> -
> - dnl> The failed recheck stuff below is courtesy of Chris Turbeville [turbo@verio.net]
> - dnl> Chris developed this for Solaris 9, confirming work I had done earlier for FreeBSD
> -@@ -1041,7 +1021,7 @@ AC_CHECK_HEADERS([sched.h sys/sched.h])
> - AC_CHECK_HEADERS([pthread.h])
> -
> - AC_MSG_CHECKING([if r/w locks are supported])
> --AC_TRY_RUN([
> -+AC_COMPILE_IFELSE([
> - #include <pthread.h>
> -
> - int main()
> -@@ -1443,15 +1423,15 @@ dnl> NET-SNMP
> - dnl>
> - if test ".${ac_disable_snmp}" != ".yes"; then
> -   AC_CHECK_TOOL(NETSNMP, net-snmp-config)
> --  if test "x$ac_cv_prog_ac_ct_NETSNMP" = "xnet-snmp-config"; then
> -+  if test -n "$NETSNMP"; then
> -     AC_DEFINE_UNQUOTED(HAVE_SNMP, 1, [SNMP is supported])
> --    SNMPLIBS="`net-snmp-config --libs`"
> -+    SNMPLIBS="`$NETSNMP --libs`"
> -     SNMPLIBS="`echo ${SNMPLIBS}|sed -e s,'-R../lib',,g`"
> -     echo "net-snmp libs: ${SNMPLIBS}"
> -     LIBS="${LIBS} ${SNMPLIBS}"
> - dnl remove unecessary path
> -     LIBS=`echo ${LIBS}|sed -e s,'-R../lib',,g`
> --    INCS="${INCS} `net-snmp-config --cflags`"
> -+    INCS="${INCS} `$NETSNMP --cflags`"
> -   else
> -     AC_MSG_RESULT(NETSNMP is not present: SNMP support is disabled)
> -   fi
> -@@ -1464,10 +1444,9 @@ SAVED_LIBS=$LIBS
> - dnl>
> - dnl> PYTHON
> - dnl>
> --  AC_CHECK_TOOL(PYTHON, python-config)
> --  PYTHON_CONFIG=""
> -+  AC_CHECK_TOOL(PYTHON_CONFIG, python-config)
> -
> --  if test "x$ac_cv_prog_ac_ct_PYTHON" != "xpython-config"; then
> -+  if test -z "$PYTHON_CONFIG"; then
> -        if test -f "/etc/debian_version"; then
> -                  AC_MSG_RESULT(Please install python-dev and rerun configure)
> -          exit 1
> -@@ -1481,8 +1460,6 @@ dnl>
> -           PYTHON_CONFIG="python-config"
> -         fi
> -      fi
> --  else
> --     PYTHON_CONFIG="python-config"
> -   fi
> -
> -   if test "x$PYTHON_CONFIG" != "x"; then
> diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch b/meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch
> deleted file mode 100644
> index 269138df9..000000000
> --- a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Check net-snmp-config's existence in case user specified the
> -ac_cv_prog_NETSNMP to avoid HAVE_SNMP defined if the specified
> -net-snmp-config doesn't exist.
> -
> -Upstream-Status: Inappropriate [Embedded specific]
> -
> -Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ----
> -diff --git a/configure.in b/configure.in
> -index 6f3e88f..8ddf017 100755
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1423,7 +1423,7 @@ dnl> NET-SNMP
> - dnl>
> - if test ".${ac_disable_snmp}" != ".yes"; then
> -   AC_CHECK_TOOL(NETSNMP, net-snmp-config)
> --  if test -n "$NETSNMP"; then
> -+  if test -n "$NETSNMP" -a -e "$NETSNMP"; then
> -     AC_DEFINE_UNQUOTED(HAVE_SNMP, 1, [SNMP is supported])
> -     SNMPLIBS="`$NETSNMP --libs`"
> -     SNMPLIBS="`echo ${SNMPLIBS}|sed -e s,'-R../lib',,g`"
> diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_init.patch b/meta-networking/recipes-support/ntop/ntop/ntop_init.patch
> deleted file mode 100644
> index e7684c1b4..000000000
> --- a/meta-networking/recipes-support/ntop/ntop/ntop_init.patch
> +++ /dev/null
> @@ -1,228 +0,0 @@
> -Modify ntop.init to WRLinux 5.0 style.
> -
> -Fix a small problem that when ntop not running,
> -/etc/init.d/ntop stop will return 1
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ----
> - packages/RedHat/ntop.init |  102 +++++++++-----------------------------------
> - 1 files changed, 21 insertions(+), 81 deletions(-)
> -
> -diff --git a/packages/RedHat/ntop.init b/packages/RedHat/ntop.init
> -index 40d49f1..a189c59 100755
> ---- a/packages/RedHat/ntop.init
> -+++ b/packages/RedHat/ntop.init
> -@@ -10,19 +10,9 @@
> - #           You have set the admin password - read docs/1STRUN.txt
> - #           You have created /etc/ntop.conf with appropriate parameters.
> -
> --#  To identify an interface to ntop, use the following flags
> --#  in /etc/sysconfig/network-scripts/ifcfg-ethx
> --
> --#   NTOP="yes"      <--- means for ntop to use this interface
> --#   NTOPCONFIG="yes"  <--- means for ntop to configure this interface
> --
> - # Note that if you give a -i parameter in either /etc/ntop.conf or
> - # the command line, the scan is NOT performed.
> -
> --# However, when it comes to the configuration step, with NTOPCONFIG="yes"
> --# the interface is configured regardless of how the interface list was
> --# specified.
> --
> - #
> - #  
> - #
> -@@ -107,11 +97,7 @@ ntopusesyslog="local3"
> - invoked=$0
> -
> - # Source function library.
> --. /etc/rc.d/init.d/functions
> --
> --# Source networking configuration.
> --. /etc/sysconfig/network
> --
> -+. /etc/init.d/functions
> -
> - # Basic sanity checks...
> - if ! [ -x $prog ]; then
> -@@ -124,16 +110,6 @@ if ! [ -x $prog ]; then
> -   exit 1
> - fi
> -
> --if [ ${NETWORKING} = "no" ]; then
> --  echo ""
> --  echo "ERROR -"
> --  echo "        Networking is not up!"
> --  echo ""
> --  echo "Aborting..."
> --  echo ""
> --  exit 1
> --fi
> --
> - if ! [ -f ${conf} ]; then
> -   echo ""
> -   echo "ERROR -"
> -@@ -180,8 +156,8 @@ fi
> - if [ "${debug}" = "y" ]; then echo "DEBUG: parm file temp is ${parmfile}"; fi
> -
> - cmd=`echo \
> --    @${conf} \
> -     -i tbd \
> -+    @${conf} \
> -     $extra $@`
> -
> - echo ${cmd} | awk ' \
> -@@ -305,42 +281,6 @@ logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD -      Configuration
> -
> - # Build list of interfaces, e.g  eth0 eth1 eth1:1
> - # (Yeah, we'll have to convert that to eth0,eth1,eth1:1 later
> --if [ ".${ntopinterface}" = ".tbd" ]; then
> --
> --    ntopinterface=""
> --    iflist=`ip link show | \
> --        awk '/^[0-9]*:\ eth/ { printf("%s ", substr($2, 1, length($2)-1)) }'`
> --    logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Scanning all interfaces $iflist"
> --    if [ "${debug}" = "y" ]; then echo "DEBUG: Interface candidates are ${iflist}"; fi
> --
> --    for eth in $iflist; do
> --
> --       if ! LANG=C egrep -L "^[Nn][Tt][Oo][Pp]=['\"]?[Yy][Ee][Ss]['\"]?" \
> --                /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null ; then
> --            logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is not ntop=yes, skipping"
> --            if [ "${debug}" = "y" ]; then echo "DEBUG: $eth not ntop=yes"; fi
> --            continue
> --       fi
> --
> --       ntopinterface="${ntopinterface} $eth"
> --
> --       ip=`ip addr show $eth | \
> --           awk '/inet/ { printf("%s", substr($2, 1, index($2, "/")-1)) }'`
> --
> --       if [ ".$ip" = "." ]; then
> --           is="is unnumbered interface"
> --       else
> --           is="has IP address $ip"
> --       fi
> --       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is ntop=yes, ${is}"
> --       if [ "${debug}" = "y" ]; then echo "DEBUG: $eth ntop=yes, ${is}"; fi
> --
> --    done
> --
> --else
> --    logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Skipping interface scan - list in parms"
> --fi
> --
> - if [ "x${ntopinterface}" = "x" ]; then
> -   ntopinterface="none"
> - fi
> -@@ -462,12 +402,6 @@ config_interfaces () {
> -           if="${if},${eth}"
> -       fi
> -
> --       if ! LANG=C egrep -L "^[Nn][Tt][Oo][Pp][Cc].*=['\"]?[Yy][Ee][Ss]['\"]?" \
> --                /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null ; then
> --            logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is not ntopconfigure=yes, skipping"
> --            continue
> --       fi
> --
> -       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Configuring $eth"
> -       if [ "${debug}" = "y" ]; then echo "DEBUG: Configuring $eth"; fi
> -
> -@@ -527,7 +461,7 @@ start () {
> -   show_extra
> -   config_interfaces
> -
> --  cmd=`echo $prog \
> -+  cmd=`echo \
> -                @${conf} \
> -                -i $if \
> -                $extra $@`
> -@@ -541,7 +475,7 @@ start () {
> -   if [ ".${ldlibpath}" != "." ]; then
> -     export LD_LIBRARY_PATH="${ldlibpath}"
> -   fi
> --  daemon ${cmd}
> -+  start-stop-daemon --start --quiet --exec $prog -- ${cmd}
> -   RETVAL=$?
> -
> -   [ $RETVAL = 0 ] && touch /var/lock/subsys/${name}${instance}
> -@@ -551,6 +485,7 @@ start () {
> - stop () {
> -   # stop daemon
> -
> -+  NOT_RUNNING=1
> -   RETVAL=1
> -   echo -n $"Stopping ${name}${instance}: "
> -   logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Stopping: ${name}${instance}"
> -@@ -563,13 +498,14 @@ stop () {
> -     if [ $rc = 0 ]; then
> -       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Sending SIGTERM to ${pid}"
> -       if [ "${debug}" = "y" ]; then echo "Sending SIGTERM to ${pid}"; fi
> --      kill -s SIGTERM ${pid}
> -+      kill -TERM ${pid} 2>&1 > /dev/null
> -       RETVAL=$?
> -       rm -f ${ntopdbfilepath}/ntop.pid
> -     else
> -       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Unable to find process ${pid} ... will kill by name"
> -       if [ "${debug}" = "y" ]; then echo "Unable to find process ${pid} ... will kill by name"; fi
> -     fi
> -+    NOT_RUNNING=0
> -   else
> -
> -     logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Unable to find ${ntopdbfilepath}/ntop.pid file ... will kill by name"
> -@@ -577,15 +513,16 @@ stop () {
> -
> -   fi
> -
> --  echo
> --
> -   if [ $RETVAL != 0 ]; then
> -     pids=`ps axf | grep '\/usr\/bin\/ntop' | awk '{ printf(" %s", $1) }; END { print "" }'`
> --    if [ "${pids}" != " " ]; then
> -+    if [ "${pids}" != "" ]; then
> -       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Sending SIGTERM to ${prog}...${pids}"
> -       if [ "${debug}" = "y" ]; then echo "Sending SIGTERM to ${prog}...${pids}"; fi
> --      kill -INT ${pids}
> -+      kill -TERM ${pids} > /dev/null 2>&1
> -       RETVAL=$?
> -+      NOT_RUNNING=0
> -+    else
> -+      NOT_RUNNING=1
> -     fi
> -   fi
> -
> -@@ -597,13 +534,9 @@ stop () {
> -       if [ "${debug}" = "y" ]; then echo "DEBUG: Unconfiguring interfaces"; fi
> -
> -       for eth in ${ntopinterface}; do
> --          if ! LANG=C egrep -L "^[Nn][Tt][Oo][Pp][Cc].*=['\"]?[Yy][Ee][Ss]['\"]?" \
> --                   /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null ; then
> --              logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is not ntopconfigure=yes, skipping"
> --              if [ "${debug}" = "y" ]; then echo "DEBUG: $eth is not ntopconfigure=yes"; fi
> --              continue
> -+          if [ "$eth" = "none" ]; then
> -+               continue
> -           fi
> --
> -           logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Unconfiguring $eth"
> -           if [ "${debug}" = "y" ]; then echo "DEBUG: Unconfiguring $eth"; fi
> -
> -@@ -623,6 +556,13 @@ stop () {
> -       if [ "${debug}" = "y" ]; then echo "DEBUG: Interfaces are unconfigured"; fi
> -   fi
> -
> -+  if [ $NOT_RUNNING -eq 1 -o $RETVAL -eq 0 ]; then
> -+    echo " [ OK ]"
> -+    RETVAL=0
> -+  else
> -+    echo " [ FAILED ]"
> -+  fi
> -+
> -   return $RETVAL
> - }
> -
> ---
> -1.7.5.4
> -
> diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch b/meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch
> deleted file mode 100644
> index 9f57ca425..000000000
> --- a/meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -change osName to version as it prints out "ntop Version".
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ----
> -diff --git a/webInterface.c b/webInterface.c
> -index 5622e69..8cb7a67 100644
> ---- a/webInterface.c
> -+++ b/webInterface.c
> -@@ -5816,7 +5816,7 @@ static void printNtopConfigInfoData(int textPrintFlag, UserPref *pref) {
> -   printInfoSectionTitle(textPrintFlag, "Basic Information");
> -
> -   safe_snprintf(__FILE__, __LINE__, formatBuf, sizeof(formatBuf), "%s (%d bit)",
> --              osName, sizeof(long) == 8 ? 64 : 32);
> -+              version, sizeof(long) == 8 ? 64 : 32);
> -   printFeatureConfigInfo(textPrintFlag, "ntop Version", formatBuf);
> -
> - #ifndef WIN32
> diff --git a/meta-networking/recipes-support/ntop/ntop/use-static-inline.patch b/meta-networking/recipes-support/ntop/ntop/use-static-inline.patch
> deleted file mode 100644
> index 2b001c13e..000000000
> --- a/meta-networking/recipes-support/ntop/ntop/use-static-inline.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -[PATCH] replace 'inline' with 'static inline' for gcc 5.x
> -
> -gcc 5.x defaults to -std=gnu11 instead of -std=gnu89 which change
> -the semantics for inline functions and the standalone 'inline'
> -causes error with "gcc5 -g -o0"
> -
> -Replace inline with static inline to be compatible with both gcc 4
> -and 5.
> -
> -Upstream-status: Pending
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ----
> - nDPI/src/lib/protocols/ssl.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/nDPI/src/lib/protocols/ssl.c b/nDPI/src/lib/protocols/ssl.c
> -index 245b8c3..72beda9 100644
> ---- a/nDPI/src/lib/protocols/ssl.c
> -+++ b/nDPI/src/lib/protocols/ssl.c
> -@@ -39,7 +39,7 @@ static void ipoque_int_ssl_add_connection(struct ipoque_detection_module_struct
> -
> - #ifdef HAVE_NTOP
> - #ifndef WIN32
> --inline int min(int a, int b) { return(a < b ? a : b); }
> -+static inline int min(int a, int b) { return(a < b ? a : b); }
> - #endif
> -
> - static void stripCertificateTrailer(char *buffer, int buffer_len) {
> ---
> -1.9.1
> -
> diff --git a/meta-networking/recipes-support/ntopng/ntopng_4.2.bb b/meta-networking/recipes-support/ntopng/ntopng_4.2.bb
> deleted file mode 100644
> index bd2b99fab..000000000
> --- a/meta-networking/recipes-support/ntopng/ntopng_4.2.bb
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -SUMMARY = "Web-based Traffic and Security Network Traffic Monitoring"
> -DESCRIPTION = "ntopng is a web-based network traffic monitoring application \
> -released under GPLv3. It is the new incarnation of the original \
> -ntop written in 1998, and now revamped in terms of performance, \
> -usability, and features."
> -
> -SECTION = "console/network"
> -
> -DEPENDS = "curl libmaxminddb libpcap lua mariadb ndpi json-c rrdtool zeromq"
> -RDEPENDS_${PN} = "bash redis"
> -LICENSE = "GPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> -
> -SRCREV = "5e649a2d1130b4a3ab0c5bb673d615172cc0bdbb"
> -SRC_URI = "git://github.com/ntop/ntopng.git;protocol=git;branch=4.2-stable \
> -           file://0001-configure.seed-fix-configure-error.patch \
> -           file://0001-configure.seed-fix-host-contamination.patch \
> -           file://0001-Makefile.in-don-t-use-the-internal-lua.patch \
> -           file://0001-autogen.sh-generate-configure.ac-only.patch \
> -           file://0001-configure.seed-not-check-clang-on-host.patch \
> -           file://ntopng.service \
> -"
> -
> -S = "${WORKDIR}/git"
> -
> -# don't use the lua under thirdparty as it supports cross compiling badly
> -export LUA_LIB = "${STAGING_LIBDIR}/liblua.a"
> -
> -LDFLAGS_append_mipsarch = " -latomic"
> -LDFLAGS_append_powerpc = " -latomic"
> -inherit autotools-brokensep gettext systemd
> -
> -do_install_append() {
> -    install -d ${D}${systemd_unitdir}/system/
> -    install -m 0644 ${WORKDIR}/ntopng.service ${D}${systemd_unitdir}/system
> -}
> -
> -FILES_${PN} += "\
> -    ${systemd_unitdir}/system/ntopng.service"
> -
> -FILES_${PN}-doc += "\
> -    /usr/man/man8/ntopng.8"
> -
> -do_configure_prepend() {
> -    ${S}/autogen.sh
> -}
> -
> -SYSTEMD_SERVICE_${PN} = "ntopng.service"
> --
> 2.17.1
>

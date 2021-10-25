Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6407DC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 16:01:26 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.222.1635177685276361442
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 09:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VWLIfkUd;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id bj31so12328070qkb.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6vgVbbGqdokDzuM6rst4ZVf5A7ABJLnJLE1D520L0Kw=;
        b=VWLIfkUdAe7EPv2WetJnEVqEhZdeTjQ2Tm9mJeyvofVUwa6nJc72/z3aQccqXUduyN
         R4ZuGWgiDGEk6MWlVYU2CfYMu4R/LbGow76Rat/WSxBYrA2srKkK6pRXf9ZKF7z41d4Y
         DYoEvvosUbdhB/c4qZM6g0DkRTWxrft7+Xph09ng2jny9tBRIc9Z9crny+1M6bnFae+D
         yN6/JDWZezo+yTclMQeZKQAzrRo1udD97zq9iAAjl6/wTmUccThjkv59I3dSIVs/v43E
         SPRkq4tkhk3VTpWvLz9k95J77msNqOrm/NYp7rMVBqg0j0z960Y79Mn7LYbpkeweQOyD
         sVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6vgVbbGqdokDzuM6rst4ZVf5A7ABJLnJLE1D520L0Kw=;
        b=ELHG//CmegmrlvIheHDSnGkkhgxhZPhjqRuNDTSbbRkRZqkYfjub1A+Y3cVQlqMhSl
         kqchw2YIXmV/nUAayuiefAwNpFffMAUih7IZxsGyNoXPfPGQJNRSRl+xBXIaJtiMwm/Y
         ECRp6+/SFxOVw9RNyUI0bwaGS1AoiHVX7MPvuXKjJixWiVq6F+aq+1oGK5YAJ7BggLEh
         QwGveybLnFyQ7WRTXxWtg4Fzv/55x+bjYP3PYUR1rBUTf/GlT1ocJ/vwwR2oRLe6xFh6
         G9/hKfuC/cAl7mrBjm/CF+I4b2Y8UCn9jU1/2kxC+A2oWjGFsvC0C1JLSWM2z2CJZZ5w
         YYNQ==
X-Gm-Message-State: AOAM530pX2Po9IbdqkEdWWEPR0nfzKH4ubUvDHKLFry6Hx2cAlqjTpoq
	ioN8Bu/rkgDvGJipwshKejGTsGx69WYCR4pwcaA=
X-Google-Smtp-Source: 
 ABdhPJyPSii5Mqf69NcUM7wC8lnk/wFNa8y0ECqRgBX6dW+Hw4+m4ftINTELX9Qknhr29JJmnnRtN3ijLBhHA848p28=
X-Received: by 2002:a05:620a:28d5:: with SMTP id
 l21mr14061990qkp.98.1635177683831;
 Mon, 25 Oct 2021 09:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635161379.git.salman.ahmed@weidmueller.com>
 <a99a2b3f7cda5a89601d4bc0b08080c2e49ade97.1635161379.git.salman.ahmed@weidmueller.com>
In-Reply-To: 
 <a99a2b3f7cda5a89601d4bc0b08080c2e49ade97.1635161379.git.salman.ahmed@weidmueller.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Oct 2021 09:00:57 -0700
Message-ID: 
 <CAMKF1so2HtWtEhPF7Y0Etvqevhcf2j_4+ND18qp2Yg46fgVWng@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 1/1] openldap: upgrade 2.4.58 -> 2.5.8
To: Salman Ahmed <salman.isd@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 16:01:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93570

On Mon, Oct 25, 2021 at 4:45 AM Salman Ahmed <salman.isd@gmail.com> wrote:
>
> - dropped retired backends (bdb, hdb, shell)
> - back-monitor is now built as part of slapd
> - added asyncmeta and wt backends
> - dropped patches for functionalities which don't
>   exist anymore
>
> Signed-off-by: Salman Ahmed <salman.ahmed@weidmueller.com>
> ---
>  .../openldap/openldap/install-strip.patch     |  2 +-
>  .../openldap-2.4.28-gnutls-gcrypt.patch       | 10 ++-
>  .../openldap/openldap-CVE-2015-3276.patch     | 58 ----------------
>  .../openldap/openldap-m4-pthread.patch        | 22 ------
>  .../openldap/openldap/thread_stub.patch       | 20 ------
>  .../openldap/openldap/use-urandom.patch       | 15 ++--
>  .../{openldap_2.4.58.bb => openldap_2.5.8.bb} | 68 +++++++------------
>  7 files changed, 37 insertions(+), 158 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
>  delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
>  delete mode 100644 meta-oe/recipes-support/openldap/openldap/thread_stub.patch
>  rename meta-oe/recipes-support/openldap/{openldap_2.4.58.bb => openldap_2.5.8.bb} (82%)
>
> diff --git a/meta-oe/recipes-support/openldap/openldap/install-strip.patch b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
> index b59db3939..b757aabb0 100644
> --- a/meta-oe/recipes-support/openldap/openldap/install-strip.patch
> +++ b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
> @@ -6,7 +6,7 @@ Upstream-Status: Pending
>
>  --- a/build/top.mk
>  +++ b/build/top.mk
> -@@ -121,7 +121,7 @@ LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD)
> +@@ -125,7 +125,7 @@ LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=compile \
>   LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
>         $(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
>
> diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
> index 91bcc0435..f551861a3 100644
> --- a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
> +++ b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
> @@ -2,13 +2,11 @@ From http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-nds/openldap/fi
>
>  Upstream-status: Pending
>
> ---
> -
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1227,7 +1227,7 @@ if test $ol_link_tls = no ; then
> -                               ol_with_tls=gnutls
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1263,7 +1263,7 @@ if test $ol_link_tls = no ; then
>                                 ol_link_tls=yes
> +                               WITH_TLS_TYPE=gnutls
>
>  -                              TLS_LIBS="-lgnutls"
>  +                              TLS_LIBS="-lgnutls -lgcrypt"
> diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
> deleted file mode 100644
> index ab5c4de66..000000000
> --- a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -openldap CVE-2015-3276
> -
> -the patch comes from:
> -https://bugzilla.redhat.com/show_bug.cgi?id=1238322
> -https://bugzilla.redhat.com/attachment.cgi?id=1055640
> -
> -The nss_parse_ciphers function in libraries/libldap/tls_m.c in
> -OpenLDAP does not properly parse OpenSSL-style multi-keyword mode
> -cipher strings, which might cause a weaker than intended cipher to
> -be used and allow remote attackers to have unspecified impact via
> -unknown vectors.
> -
> -Upstream-Status: Pending
> -
> -CVE: CVE-2015-3276
> -
> -Signed-off-by: Li Wang <li.wang@windriver.com>
> ----
> - libraries/libldap/tls_m.c |   27 ++++++++++++++++-----------
> - 1 file changed, 16 insertions(+), 11 deletions(-)
> -
> ---- a/libraries/libldap/tls_m.c
> -+++ b/libraries/libldap/tls_m.c
> -@@ -620,18 +620,23 @@ nss_parse_ciphers(const char *cipherstr,
> -                        */
> -                       if (mask || strength || protocol) {
> -                               for (i=0; i<ciphernum; i++) {
> --                                      if (((ciphers_def[i].attr & mask) ||
> --                                               (ciphers_def[i].strength & strength) ||
> --                                               (ciphers_def[i].version & protocol)) &&
> --                                              (cipher_list[i] != -1)) {
> --                                              /* Enable the NULL ciphers only if explicity
> --                                               * requested */
> --                                              if (ciphers_def[i].attr & SSL_eNULL) {
> --                                                      if (mask & SSL_eNULL)
> --                                                              cipher_list[i] = action;
> --                                              } else
> -+                                      /* if more than one mask is provided
> -+                                       * then AND logic applies (to match openssl)
> -+                                       */
> -+                                      if ( cipher_list[i] == -1) )
> -+                                              continue;
> -+                                      if ( mask && ! (ciphers_def[i].attr & mask) )
> -+                                              continue;
> -+                                      if ( strength && ! (ciphers_def[i].strength & strength) )
> -+                                              continue;
> -+                                      if ( protocol && ! (ciphers_def[i].version & protocol) )
> -+                                              continue;
> -+                                      /* Enable the NULL ciphers only if explicity requested */
> -+                                      if (ciphers_def[i].attr & SSL_eNULL) {
> -+                                              if (mask & SSL_eNULL)
> -                                                       cipher_list[i] = action;
> --                                      }
> -+                                      } else
> -+                                              cipher_list[i] = action;
> -                               }
> -                       } else {
> -                               for (i=0; i<ciphernum; i++) {
> diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch b/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
> deleted file mode 100644
> index 4d1fda96e..000000000
> --- a/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Upstream-Status: Pending
> -
> ---- a/build/openldap.m4
> -+++ b/build/openldap.m4
> -@@ -651,7 +651,7 @@ AC_DEFUN([OL_PTHREAD_TEST_FUNCTION],[[
> - ]])
> -
> - AC_DEFUN([OL_PTHREAD_TEST_PROGRAM],
> --AC_LANG_SOURCE([OL_PTHREAD_TEST_INCLUDES
> -+[AC_LANG_SOURCE([[OL_PTHREAD_TEST_INCLUDES
> -
> - int main(argc, argv)
> -       int argc;
> -@@ -659,7 +659,7 @@ int main(argc, argv)
> - {
> - OL_PTHREAD_TEST_FUNCTION
> - }
> --]))
> -+]])])
> - dnl --------------------------------------------------------------------
> - AC_DEFUN([OL_PTHREAD_TRY], [# Pthread try link: $1 ($2)
> - if test "$ol_link_threads" = no ; then
> diff --git a/meta-oe/recipes-support/openldap/openldap/thread_stub.patch b/meta-oe/recipes-support/openldap/openldap/thread_stub.patch
> deleted file mode 100644
> index 540ba4a63..000000000
> --- a/meta-oe/recipes-support/openldap/openldap/thread_stub.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -openldap: set pointer
> -
> -When the function ldap_pvt_thread_pool_getkey() succeeds, it
> -must set the value of *data since the caller may try to use it.
> -
> -Upstream-Status: pending
> -
> -Signed-off-by: Joe Slater <jslater@windriver.com>
> -
> -
> ---- a/libraries/libldap_r/thr_stub.c
> -+++ b/libraries/libldap_r/thr_stub.c
> -@@ -217,6 +217,7 @@ ldap_pvt_thread_pool_unidle ( ldap_pvt_t
> - int ldap_pvt_thread_pool_getkey (
> -       void *ctx, void *key, void **data, ldap_pvt_thread_pool_keyfree_t **kfree )
> - {
> -+      if (data) *data = NULL;  /* avoid problems with uninitialized *data */
> -       return(0);
> - }
> -
> diff --git a/meta-oe/recipes-support/openldap/openldap/use-urandom.patch b/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
> index 96a03369a..6783b5175 100644
> --- a/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
> +++ b/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
> @@ -8,20 +8,17 @@ Upstream-Status: pending
>
>  Signed-off-by: Joe Slater <jslater@windriver.com>
>
> -
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -2153,8 +2153,8 @@ fi
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -2117,6 +2117,7 @@ AC_SUBST(systemdsystemunitdir)
>
>   dnl ----------------------------------------------------------------
>   dnl Check for entropy sources
>  +dev=no
>   if test $cross_compiling != yes && test "$ac_cv_mingw32" != yes ; then
> --      dev=no
> +       dev=no
>         if test -r /dev/urandom ; then
> -               dev="/dev/urandom";
> -       elif test -r /idev/urandom ; then
> -@@ -2167,9 +2167,11 @@ if test $cross_compiling != yes && test
> +@@ -2131,9 +2132,11 @@ if test $cross_compiling != yes && test "$ac_cv_mingw32" != yes ; then
>                 dev="/idev/random";
>         fi
>
> @@ -29,7 +26,7 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
>  -              AC_DEFINE_UNQUOTED(URANDOM_DEVICE,"$dev",[set to urandom device])
>  -      fi
>  +elif test $cross_compiling == yes ; then
> -+      dev="/dev/urandom";
> ++       dev="/dev/urandom";
>  +fi
>  +if test $dev != no ; then
>  +      AC_DEFINE_UNQUOTED(URANDOM_DEVICE,"$dev",[set to urandom device])
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.58.bb b/meta-oe/recipes-support/openldap/openldap_2.5.8.bb
> similarity index 82%
> rename from meta-oe/recipes-support/openldap/openldap_2.4.58.bb
> rename to meta-oe/recipes-support/openldap/openldap_2.5.8.bb
> index f9dc58a4c..ca005de70 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.4.58.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.5.8.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
>  # basically BSD.  opensource.org does not record this license
>  # at present (so it is apparently not OSI certified).
>  LICENSE = "OpenLDAP"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b6dea6c170362fc46381fe3690c722cb \
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=5cc6ef74da4ad25d707c4f5903d64975 \
>                      file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
>                      "
>  SECTION = "libs"
> @@ -15,18 +15,15 @@ SECTION = "libs"
>  LDAP_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
>
>  SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/${BP}.tgz \
> -    file://openldap-m4-pthread.patch \
>      file://openldap-2.4.28-gnutls-gcrypt.patch \
>      file://use-urandom.patch \
>      file://initscript \
>      file://slapd.service \
> -    file://thread_stub.patch \
> -    file://openldap-CVE-2015-3276.patch \
>      file://remove-user-host-pwd-from-version.patch \
>  "
>
> -SRC_URI[md5sum] = "c203d735ba69976e5b28dc39006f29b5"
> -SRC_URI[sha256sum] = "57b59254be15d0bf6a9ab3d514c1c05777b02123291533134a87c94468f8f47b"
> +SRC_URI[md5sum] = "86e3ffce4adfc57cbb76ac0ff48b2614"
> +SRC_URI[sha256sum] = "366ea1c3b24202de4481978b632128c0cfe4148d4ae13cabf93a1f38c56472dc"
>
>  DEPENDS = "util-linux groff-native"
>
> @@ -35,7 +32,7 @@ DEPENDS = "util-linux groff-native"
>  # environments
>  SRC_URI += "file://install-strip.patch"
>
> -inherit autotools-brokensep update-rc.d systemd
> +inherit autotools-brokensep update-rc.d systemd pkgconfig
>
>  # CV SETTINGS
>  # Required to work round AC_FUNC_MEMCMP which gets the wrong answer
> @@ -50,8 +47,8 @@ EXTRA_OECONF += "--with-yielding-select=yes"
>  # Shared libraries are nice...
>  EXTRA_OECONF += "--enable-dynamic"
>
> -PACKAGECONFIG ??= "gnutls modules \
> -                   mdb ldap meta monitor null passwd shell proxycache dnssrv \
> +PACKAGECONFIG ??= "asyncmeta gnutls modules \
> +                   mdb ldap meta null passwd proxycache dnssrv \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
>  "
>  #--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
> @@ -72,25 +69,20 @@ EXTRA_OECONF += "--enable-crypt"
>  # The backend must be set by the configuration.  This controls the
>  # required database.
>  #
> -# Backends="bdb dnssrv hdb ldap mdb meta monitor ndb null passwd perl relay shell sock sql"
> +# Backends="asyncmeta dnssrv ldap mdb meta ndb null passwd perl relay sock sql wt"
>  #
>  # Note that multiple backends can be built.  The ldbm backend requires a
> -# build-time choice of database API.  The bdb backend forces this to be
> -# DB4.  To use the gdbm (or other) API the Berkely database module must
> -# be removed from the build.
> +# build-time choice of database API. To use the gdbm (or other) API the
> +# Berkely database module must be removed from the build.
>  md = "${libexecdir}/openldap"
>  #
> -#--enable-bdb          enable Berkeley DB backend no|yes|mod yes
> -# The Berkely DB is the standard choice.  This version of OpenLDAP requires
> -# the version 4 implementation or better.
> -PACKAGECONFIG[bdb] = "--enable-bdb=yes,--enable-bdb=no,db"
> +
> +#--enable-asyncmeta    enable asyncmeta backend no|yes|mod no
> +PACKAGECONFIG[asyncmeta] = "--enable-asyncmeta=mod,--enable-asyncmeta=no"
>
>  #--enable-dnssrv       enable dnssrv backend no|yes|mod no
>  PACKAGECONFIG[dnssrv] = "--enable-dnssrv=mod,--enable-dnssrv=no"
>
> -#--enable-hdb          enable Hierarchical DB backend no|yes|mod no
> -PACKAGECONFIG[hdb] = "--enable-hdb=yes,--enable-hdb=no,db"
> -
>  #--enable-ldap         enable ldap backend no|yes|mod no
>  PACKAGECONFIG[ldap] = "--enable-ldap=mod,--enable-ldap=no,"
>
> @@ -100,9 +92,6 @@ PACKAGECONFIG[mdb] = "--enable-mdb=yes,--enable-mdb=no,"
>  #--enable-meta         enable metadirectory backend no|yes|mod no
>  PACKAGECONFIG[meta] = "--enable-meta=mod,--enable-meta=no,"
>
> -#--enable-monitor      enable monitor backend no|yes|mod yes
> -PACKAGECONFIG[monitor] = "--enable-monitor=mod,--enable-monitor=no,"
> -
>  #--enable-ndb          enable MySQL NDB Cluster backend no|yes|mod [no]
>  PACKAGECONFIG[ndb] = "--enable-ndb=mod,--enable-ndb=no,"
>
> @@ -121,10 +110,6 @@ PACKAGECONFIG[perl] = "--enable-perl=mod,--enable-perl=no,perl"
>  #--enable-relay        enable relay backend no|yes|mod [yes]
>  PACKAGECONFIG[relay] = "--enable-relay=mod,--enable-relay=no,"
>
> -#--enable-shell        enable shell backend no|yes|mod no
> -# configure: WARNING: Use of --without-threads is recommended with back-shell
> -PACKAGECONFIG[shell] = "--enable-shell=mod --without-threads,--enable-shell=no,"
> -
>  #--enable-sock         enable sock backend no|yes|mod [no]
>  PACKAGECONFIG[sock] = "--enable-sock=mod,--enable-sock=no,"
>
> @@ -133,6 +118,10 @@ PACKAGECONFIG[sock] = "--enable-sock=mod,--enable-sock=no,"
>  # sqlite.h (which may be compatible but hasn't been tried.)
>  PACKAGECONFIG[sql] = "--enable-sql=mod,--enable-sql=no,sqlite3"
>
> +#--enable-wt           enable wt backend no|yes|mod no
> +# back-wt is marked currently as experimental
> +PACKAGECONFIG[wt] = "--enable-wt=mod,--enable-wt=no"
> +
>  #--enable-dyngroup     Dynamic Group overlay no|yes|mod no
>  #  This is a demo, Proxy Cache defines init_module which conflicts with the
>  #  same symbol in dyngroup
> @@ -176,7 +165,7 @@ FILES:${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir} ${local
>      ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
>  FILES:${PN}-slurpd = "${libexecdir}/slurpd ${localstatedir}/openldap-slurp"
>  FILES:${PN}-bin = "${bindir}"
> -FILES:${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir}/openldap/*.so"
> +FILES:${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir}/openldap/*.so ${libdir}/pkgconfig/*.pc"
>  FILES:${PN}-dbg += "${libexecdir}/openldap/.debug"
>
>  do_install:append() {
> @@ -210,8 +199,6 @@ do_install:append() {
>          -i ${D}${sysconfdir}/openldap/slapd.conf
>
>      mkdir -p ${D}${localstatedir}/${BPN}/data
> -
> -
>  }
>
>  INITSCRIPT_PACKAGES = "${PN}-slapd"
> @@ -220,21 +207,18 @@ INITSCRIPT_PARAMS:${PN}-slapd = "defaults"
>  SYSTEMD_SERVICE:${PN}-slapd = "hostapd.service"
>  SYSTEMD_AUTO_ENABLE:${PN}-slapd ?= "disable"
>
> -
>  PACKAGES_DYNAMIC += "^${PN}-backends.* ^${PN}-backend-.*"
>
>  # The modules require their .so to be dynamicaly loaded
> -INSANE_SKIP:${PN}-backend-dnssrv  += "dev-so"
> -INSANE_SKIP:${PN}-backend-ldap    += "dev-so"
> -INSANE_SKIP:${PN}-backend-meta    += "dev-so"
> -INSANE_SKIP:${PN}-backend-mdb     += "dev-so"
> -INSANE_SKIP:${PN}-backend-monitor += "dev-so"
> -INSANE_SKIP:${PN}-backend-null    += "dev-so"
> -INSANE_SKIP:${PN}-backend-passwd  += "dev-so"
> -INSANE_SKIP:${PN}-backend-shell   += "dev-so"
> -
> -
> -python populate_packages:prepend () {
> +INSANE_SKIP:${PN}-backend-asyncmeta  += "dev-so"
> +INSANE_SKIP:${PN}-backend-dnssrv     += "dev-so"
> +INSANE_SKIP:${PN}-backend-ldap       += "dev-so"
> +INSANE_SKIP:${PN}-backend-meta       += "dev-so"
> +INSANE_SKIP:${PN}-backend-mdb        += "dev-so"
> +INSANE_SKIP:${PN}-backend-null       += "dev-so"
> +INSANE_SKIP:${PN}-backend-passwd     += "dev-so"
> +
> +python populate_packages_prepend () {

this should be populate_packages:prepend
I have corrected it before staging this patch so no need to send a v2

>      backend_dir    = d.expand('${libexecdir}/openldap')
>      do_split_packages(d, backend_dir, 'back_([a-z]*)\.so$', 'openldap-backend-%s', 'OpenLDAP %s backend', prepend=True, extra_depends='', allow_links=True)
>      do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$', 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='', allow_links=True)
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93562): https://lists.openembedded.org/g/openembedded-devel/message/93562
> Mute This Topic: https://lists.openembedded.org/mt/86574889/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.700.1623083017207242818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 09:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aJmIJ7iP;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id i68so13651651qke.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fnh/IDfzHYWs4g0iOgAcD5qdrUn+cvfGxy5o0epBqZY=;
        b=aJmIJ7iPP3QUyrtejiUNvVOHcfQ+5/eAjNj1BHHly+9iSRbM7nMjnfYC/GXGfYk3fe
         T5Qk/ZXK3feYXRfdq3tDQujBk3u1yKjAIR4853QfzDV+EAADeK97HrsNBnQ2M9cbN1Rc
         lvHf6JRBKwlHbNV/dOE7xLEaXix71e4ZSHBfarrx3bTEgGyMT4jyRAr85Ds5UN9Wxfat
         E77D4BK0oBaSA4DzmfLhn2hnPELOJqOBWSEkarBZUvoFMq5wjOTv8AWZx2vXCyPCAq29
         t/8tDCBFmZHIfukfPpPN32lfNpoo5rNrZPnieHOhYK17Sqy5Foiw+dLlo08/kCsehqSJ
         OM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fnh/IDfzHYWs4g0iOgAcD5qdrUn+cvfGxy5o0epBqZY=;
        b=QOGRQLqkbpnHlYFzA+TxeyKHXzu45RcnM/oro1i+CfwJuBbMV6LFwCUCYN+AFt9KnF
         q8R1PtSb3iaFYKEAx28kFOMBReAj/vkIPYxMmLSWzMHHgE6ooI076blhJF+cyXcsuH5Q
         TQ88EvjEuYQGc8EI0CkwfseiBO3C+w4wE33LkO52FpA2FpKqToqWU85dnqmjFDhSju4G
         zmdLNouPsjJh3hkiUf2TVoOy+Y7SjeOPcY5Z3RBfuR/ScYu3Az6OeGo29J9ARxZxFdlH
         7cXdA7i3+XOTeR5MIbXSbt+wF7D/W9LHtRIFFAix5yxbOgp56xp9D3Hz6fQ7/3d5rNmZ
         ve2w==
X-Gm-Message-State: AOAM533pZQ9g/wcgd7frQjgwT9OyGf3E21NaTKK2jjuSH1K6SVNPRU/b
	dlIFT3unYojwC6vQMvBnzou2iO+bExpDj2LgPjwDI3Vm6usAmQ==
X-Google-Smtp-Source: ABdhPJy5IRil3L+ESc7TnlwoW5f+k25yM6hDO47F86ztFsWuBV5BQiGG3HTtmmEaFqy2F7tpIshGAbNwob8i+BIe+tw=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr17349467qkb.146.1623083015847;
 Mon, 07 Jun 2021 09:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210605134817.163302-1-yi.zhao@windriver.com> <20210605134817.163302-4-yi.zhao@windriver.com>
In-Reply-To: <20210605134817.163302-4-yi.zhao@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 7 Jun 2021 09:23:09 -0700
Message-ID: <CAMKF1srhMimG7Cc5RMvoqwr8QQB5-oO3_okJ4+k=4QcE9-ZJDw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 3/4] samba: upgrade 4.10.18 -> 4.14.4
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seeing this

https://errors.yoctoproject.org/Errors/Details/586079/

On Sat, Jun 5, 2021 at 6:48 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> The 4.10.x is EOL: https://wiki.samba.org/index.php/Samba_Release_Planni=
ng
> Upgrade to latest 4.14.x.
>
> Remove PACKAGECONFIG[gnutls] since the gnutls is now the mandatory
> requirement for samba. See:
> https://wiki.samba.org/index.php/Package_Dependencies_Required_to_Build_=
Samba#Mandatory
>
> Refresh patches:
>   16-do-not-check-xsltproc-manpages.patch
>   20-do-not-import-target-module-while-cross-compile.patch
>   21-add-config-option-without-valgrind.patch
>   0001-Add-options-to-configure-the-use-of-libbsd.patch
>   dnsserver-4.7.0.patch
>   iconv-4.7.0.patch
>   0001-samba-fix-musl-lib-without-innetgr.patch
>
> Drop patches:
>   0001-lib-replace-wscript-Avoid-generating-nested-main-fun.patch
>   0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch
>   0001-waf-add-support-of-cross_compile.patch
>   0002-util_sec.c-Move-__thread-variable-to-global-scope.patch
>   CVE-2020-14318.patch
>   CVE-2020-14383.patch
>   glibc_only.patch
>   smb_conf-4.7.0.patch
>
> Add new patches:
>   0007-wscript_configure_system_gnutls-disable-check-gnutls.patch
>   0008-source3-wscript-disable-check-fcntl-F_OWNER_EX.patch
>   source3-wscript-disable-check-fcntl-RW_HINTS.patch
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ... 0001-Don-t-check-xsltproc-manpages.patch} |  24 +--
>  ...ipt-Avoid-generating-nested-main-fun.patch |  30 ----
>  ....c-Avoid-nss-function-conflicts-with.patch |  96 ------------
>  ...001-waf-add-support-of-cross_compile.patch |  62 --------
>  ...t-target-module-while-cross-compile.patch} |   8 +-
>  ...ve-__thread-variable-to-global-scope.patch |  58 -------
>  ...-Add-config-option-without-valgrind.patch} |  12 +-
>  ...ions-to-configure-the-use-of-libbsd.patch} |  45 +++---
>  ...5-samba-build-dnsserver_common-code.patch} |  13 +-
>  ...tch =3D> 0006-samba-defeat-iconv-test.patch} |  20 ++-
>  ...e_system_gnutls-disable-check-gnutls.patch |  39 +++++
>  ...cript-disable-check-fcntl-F_OWNER_EX.patch |  79 ++++++++++
>  .../samba/samba/CVE-2020-14318.patch          | 142 ------------------
>  .../samba/samba/CVE-2020-14383.patch          | 112 --------------
>  .../samba/samba/glibc_only.patch              |  28 ----
>  ... samba-fix-musl-lib-without-innetgr.patch} |   0
>  .../samba/samba/smb_conf-4.7.0.patch          |  28 ----
>  ...wscript-disable-check-fcntl-RW_HINTS.patch |  92 ++++++++++++
>  .../{samba_4.10.18.bb =3D> samba_4.14.4.bb}     |  66 ++++----
>  19 files changed, 307 insertions(+), 647 deletions(-)
>  rename meta-networking/recipes-connectivity/samba/samba/{16-do-not-chec=
k-xsltproc-manpages.patch =3D> 0001-Don-t-check-xsltproc-manpages.patch} (7=
7%)
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/000=
1-lib-replace-wscript-Avoid-generating-nested-main-fun.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/000=
1-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/000=
1-waf-add-support-of-cross_compile.patch
>  rename meta-networking/recipes-connectivity/samba/samba/{20-do-not-impo=
rt-target-module-while-cross-compile.patch =3D> 0002-do-not-import-target-m=
odule-while-cross-compile.patch} (94%)
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/000=
2-util_sec.c-Move-__thread-variable-to-global-scope.patch
>  rename meta-networking/recipes-connectivity/samba/samba/{21-add-config-=
option-without-valgrind.patch =3D> 0003-Add-config-option-without-valgrind.=
patch} (88%)
>  rename meta-networking/recipes-connectivity/samba/samba/{0001-Add-optio=
ns-to-configure-the-use-of-libbsd.patch =3D> 0004-Add-options-to-configure-=
the-use-of-libbsd.patch} (76%)
>  rename meta-networking/recipes-connectivity/samba/samba/{dnsserver-4.7.=
0.patch =3D> 0005-samba-build-dnsserver_common-code.patch} (55%)
>  rename meta-networking/recipes-connectivity/samba/samba/{iconv-4.7.0.pa=
tch =3D> 0006-samba-defeat-iconv-test.patch} (52%)
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/000=
7-wscript_configure_system_gnutls-disable-check-gnutls.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/000=
8-source3-wscript-disable-check-fcntl-F_OWNER_EX.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE=
-2020-14318.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE=
-2020-14383.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/gli=
bc_only.patch
>  rename meta-networking/recipes-connectivity/samba/samba/{0001-samba-fix=
-musl-lib-without-innetgr.patch =3D> samba-fix-musl-lib-without-innetgr.pat=
ch} (100%)
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba/smb=
_conf-4.7.0.patch
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/sou=
rce3-wscript-disable-check-fcntl-RW_HINTS.patch
>  rename meta-networking/recipes-connectivity/samba/{samba_4.10.18.bb =3D=
> samba_4.14.4.bb} (85%)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba/16-do-not-=
check-xsltproc-manpages.patch b/meta-networking/recipes-connectivity/samba/=
samba/0001-Don-t-check-xsltproc-manpages.patch
> similarity index 77%
> rename from meta-networking/recipes-connectivity/samba/samba/16-do-not-c=
heck-xsltproc-manpages.patch
> rename to meta-networking/recipes-connectivity/samba/samba/0001-Don-t-ch=
eck-xsltproc-manpages.patch
> index 8ca7a52ed..f4668dc6f 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/16-do-not-check-x=
sltproc-manpages.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-=
xsltproc-manpages.patch
> @@ -1,12 +1,14 @@
> -From 2214c2d1e455a38c891d17e421b438e3f7c495d8 Mon Sep 17 00:00:00 2001
> +From 3bc1ebc3d2758af4067b3aace7ddd0ea0cb0b57b Mon Sep 17 00:00:00 2001
>  From: Bian Naimeng <biannm@cn.fujitsu.com>
>  Date: Mon, 18 Apr 2016 17:00:53 -0400
>  Subject: [PATCH] Don't check xsltproc manpages
>
>  Upstream-Status: Pending
> -
> +
>  Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>
> +Rebase to 4.14.4
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>  ---
>   lib/ldb/wscript    | 2 +-
>   lib/talloc/wscript | 2 +-
> @@ -14,10 +16,10 @@ Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
>  diff --git a/lib/ldb/wscript b/lib/ldb/wscript
> -index 5ea5231..d94086b 100644
> +index bf6129b..c515deb 100644
>  --- a/lib/ldb/wscript
>  +++ b/lib/ldb/wscript
> -@@ -98,7 +98,7 @@ def configure(conf):
> +@@ -143,7 +143,7 @@ def configure(conf):
>           conf.DEFINE('EXPECTED_SYSTEM_LDB_VERSION_RELEASE', int(v[2]))
>
>       if conf.env.standalone_ldb:
> @@ -27,10 +29,10 @@ index 5ea5231..d94086b 100644
>           # we need this for the ldap backend
>           if conf.CHECK_FUNCS_IN('ber_flush ldap_open ldap_initialize', =
'lber ldap', headers=3D'lber.h ldap.h'):
>  diff --git a/lib/talloc/wscript b/lib/talloc/wscript
> -index df7e6be..b3305cf 100644
> +index a767477..f754819 100644
>  --- a/lib/talloc/wscript
>  +++ b/lib/talloc/wscript
> -@@ -49,7 +49,7 @@ def configure(conf):
> +@@ -48,7 +48,7 @@ def configure(conf):
>           conf.env.PKGCONFIGDIR =3D '${LIBDIR}/pkgconfig'
>           conf.env.TALLOC_VERSION =3D VERSION
>
> @@ -40,18 +42,18 @@ index df7e6be..b3305cf 100644
>       conf.CHECK_HEADERS('sys/auxv.h')
>       conf.CHECK_FUNCS('getauxval')
>  diff --git a/lib/tdb/wscript b/lib/tdb/wscript
> -index 4782550..6bb3fa1 100644
> +index e56ddd0..467dd65 100644
>  --- a/lib/tdb/wscript
>  +++ b/lib/tdb/wscript
> -@@ -89,7 +89,7 @@ def configure(conf):
> +@@ -95,7 +95,7 @@ def configure(conf):
>           not conf.env.disable_tdb_mutex_locking):
>           conf.define('USE_TDB_MUTEX_LOCKING', 1)
>
>  -    conf.CHECK_XSLTPROC_MANPAGES()
>  +    #conf.CHECK_XSLTPROC_MANPAGES()
>
> -     if not conf.env.disable_python:
> -         # also disable if we don't have the python libs installed
> +     conf.SAMBA_CHECK_PYTHON()
> +     conf.SAMBA_CHECK_PYTHON_HEADERS()
>  --
> -2.14.3
> +2.17.1
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-lib-r=
eplace-wscript-Avoid-generating-nested-main-fun.patch b/meta-networking/rec=
ipes-connectivity/samba/samba/0001-lib-replace-wscript-Avoid-generating-nes=
ted-main-fun.patch
> deleted file mode 100644
> index de7f31183..000000000
> --- a/meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-=
wscript-Avoid-generating-nested-main-fun.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 3a935c638605bfb392ca7780d22c08c1a0a71e71 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 5 Sep 2019 21:37:33 -0700
> -Subject: [PATCH 1/2] lib/replace/wscript: Avoid generating nested main
> - function
> -
> -clang is not happy when it sees another main nested inside the main
> -function and fails the test for prctl syscall, therefore avoid adding
> -implicit main() here
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - lib/replace/wscript | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/lib/replace/wscript b/lib/replace/wscript
> -index a7fd25d..d6767fc 100644
> ---- a/lib/replace/wscript
> -+++ b/lib/replace/wscript
> -@@ -137,6 +137,7 @@ def configure(conf):
> -                     }
> -                     ''',
> -                     'HAVE_PRCTL',
> -+                    addmain=3DFalse,
> -                     headers=3D'sys/prctl.h',
> -                     msg=3D'Checking for prctl syscall')
> -
> ---
> -2.23.0
> -
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-nsswi=
tch-nsstest.c-Avoid-nss-function-conflicts-with.patch b/meta-networking/rec=
ipes-connectivity/samba/samba/0001-nsswitch-nsstest.c-Avoid-nss-function-co=
nflicts-with.patch
> deleted file mode 100644
> index 2dbabdaa4..000000000
> --- a/meta-networking/recipes-connectivity/samba/samba/0001-nsswitch-nss=
test.c-Avoid-nss-function-conflicts-with.patch
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -From 9aba5ac17bb822f91f6b214f5b82dd1eb8c47616 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 22 Jul 2020 22:42:09 -0700
> -Subject: [PATCH] nsswitch/nsstest.c: Avoid nss function conflicts with =
glibc nss.h
> -
> -glibc 2.32 will define these varibles [1] which results in conflicts
> -with these static function names, therefore prefix these function names
> -with samba_ to avoid it
> -
> -[1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D499a92df8b=
9fc64a054cf3b7f728f8967fc1da7d
> -
> -Upstream-Status: Submitted [https://gitlab.com/samba-team/samba/-/merge=
_requests/1477]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - nsswitch/nsstest.c | 16 ++++++++--------
> - 1 file changed, 8 insertions(+), 8 deletions(-)
> -
> -diff --git a/nsswitch/nsstest.c b/nsswitch/nsstest.c
> -index 6d92806..46f9679 100644
> ---- a/nsswitch/nsstest.c
> -+++ b/nsswitch/nsstest.c
> -@@ -137,7 +137,7 @@ static struct passwd *nss_getpwuid(uid_t uid)
> -       return &pwd;
> - }
> -
> --static void nss_setpwent(void)
> -+static void samba_nss_setpwent(void)
> - {
> -       NSS_STATUS (*_nss_setpwent)(void) =3D
> -               (NSS_STATUS(*)(void))find_fn("setpwent");
> -@@ -152,7 +152,7 @@ static void nss_setpwent(void)
> -       }
> - }
> -
> --static void nss_endpwent(void)
> -+static void samba_nss_endpwent(void)
> - {
> -       NSS_STATUS (*_nss_endpwent)(void) =3D
> -               (NSS_STATUS (*)(void))find_fn("endpwent");
> -@@ -284,7 +284,7 @@ again:
> -       return &grp;
> - }
> -
> --static void nss_setgrent(void)
> -+static void samba_nss_setgrent(void)
> - {
> -       NSS_STATUS (*_nss_setgrent)(void) =3D
> -               (NSS_STATUS (*)(void))find_fn("setgrent");
> -@@ -299,7 +299,7 @@ static void nss_setgrent(void)
> -       }
> - }
> -
> --static void nss_endgrent(void)
> -+static void samba_nss_endgrent(void)
> - {
> -       NSS_STATUS (*_nss_endgrent)(void) =3D
> -               (NSS_STATUS (*)(void))find_fn("endgrent");
> -@@ -396,7 +396,7 @@ static void nss_test_users(void)
> - {
> -       struct passwd *pwd;
> -
> --      nss_setpwent();
> -+      samba_nss_setpwent();
> -       /* loop over all users */
> -       while ((pwd =3D nss_getpwent())) {
> -               printf("Testing user %s\n", pwd->pw_name);
> -@@ -418,14 +418,14 @@ static void nss_test_users(void)
> -               printf("initgroups: "); nss_test_initgroups(pwd->pw_name=
, pwd->pw_gid);
> -               printf("\n");
> -       }
> --      nss_endpwent();
> -+      samba_nss_endpwent();
> - }
> -
> - static void nss_test_groups(void)
> - {
> -       struct group *grp;
> -
> --      nss_setgrent();
> -+      samba_nss_setgrent();
> -       /* loop over all groups */
> -       while ((grp =3D nss_getgrent())) {
> -               printf("Testing group %s\n", grp->gr_name);
> -@@ -446,7 +446,7 @@ static void nss_test_groups(void)
> -               printf("getgrgid: "); print_group(grp);
> -               printf("\n");
> -       }
> --      nss_endgrent();
> -+      samba_nss_endgrent();
> - }
> -
> - static void nss_test_errors(void)
> ---
> -2.27.0
> -
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-waf-a=
dd-support-of-cross_compile.patch b/meta-networking/recipes-connectivity/sa=
mba/samba/0001-waf-add-support-of-cross_compile.patch
> deleted file mode 100644
> index 23b35a814..000000000
> --- a/meta-networking/recipes-connectivity/samba/samba/0001-waf-add-supp=
ort-of-cross_compile.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From 4b8463ff43f8983a706b181c5292491f9f954be1 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Fri, 25 Jan 2019 15:00:59 +0800
> -Subject: [PATCH] waf: add support of cross_compile
> -
> -After upgrade, waf also upgraded
> -
> -on 1.5.19, for cross_compile, subprocess.Popen is set to be
> -samba_cross.cross_Popen, which will not execute testprog on
> -host, but only read result from cross-answers.txt which is
> -passed by option --cross-answer
> -
> -part of old code:
> -    args =3D Utils.to_list(kw.get('exec_args', []))
> -    proc =3D Utils.pproc.Popen([lastprog] + args, stdout=3DUtils.pproc.=
PIPE, stderr=3DUtils.pproc.PIPE)
> -
> -but on new version, exec_args is not used and cause do_configure
> -failed with Exec format error
> -
> -fixed by append cross anser related args to cmd
> -
> -Upstream-Status: Submitted [https://gitlab.com/samba-team/samba/merge_r=
equests/211]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - third_party/waf/waflib/Tools/c_config.py | 11 ++++++-----
> - 1 file changed, 6 insertions(+), 5 deletions(-)
> -
> -diff --git a/third_party/waf/waflib/Tools/c_config.py b/third_party/waf=
/waflib/Tools/c_config.py
> -index 7608215..767cf33 100644
> ---- a/third_party/waf/waflib/Tools/c_config.py
> -+++ b/third_party/waf/waflib/Tools/c_config.py
> -@@ -660,20 +660,21 @@ class test_exec(Task.Task):
> -       """
> -       color =3D 'PINK'
> -       def run(self):
> -+              args =3D self.generator.bld.kw.get('exec_args', [])
> -               if getattr(self.generator, 'rpath', None):
> -                       if getattr(self.generator, 'define_ret', False):
> --                              self.generator.bld.retval =3D self.gener=
ator.bld.cmd_and_log([self.inputs[0].abspath()])
> --                      else:
> --                              self.generator.bld.retval =3D self.gener=
ator.bld.exec_command([self.inputs[0].abspath()])
> -+                              self.generator.bld.retval =3D self.gener=
ator.bld.cmd_and_log([self.inputs[0].abspath()] + args)
> -+                      else:
> -+                              self.generator.bld.retval =3D self.gener=
ator.bld.exec_command([self.inputs[0].abspath()] + args)
> -               else:
> -                       env =3D self.env.env or {}
> -                       env.update(dict(os.environ))
> -                       for var in ('LD_LIBRARY_PATH', 'DYLD_LIBRARY_PAT=
H', 'PATH'):
> -                               env[var] =3D self.inputs[0].parent.abspa=
th() + os.path.pathsep + env.get(var, '')
> -                       if getattr(self.generator, 'define_ret', False):
> --                              self.generator.bld.retval =3D self.gener=
ator.bld.cmd_and_log([self.inputs[0].abspath()], env=3Denv)
> -+                              self.generator.bld.retval =3D self.gener=
ator.bld.cmd_and_log([self.inputs[0].abspath()] + args, env=3Denv)
> -                       else:
> --                              self.generator.bld.retval =3D self.gener=
ator.bld.exec_command([self.inputs[0].abspath()], env=3Denv)
> -+                              self.generator.bld.retval =3D self.gener=
ator.bld.exec_command([self.inputs[0].abspath()] + args, env=3Denv)
> -
> - @feature('test_exec')
> - @after_method('apply_link')
> ---
> -2.7.4
> -
> diff --git a/meta-networking/recipes-connectivity/samba/samba/20-do-not-=
import-target-module-while-cross-compile.patch b/meta-networking/recipes-co=
nnectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile=
.patch
> similarity index 94%
> rename from meta-networking/recipes-connectivity/samba/samba/20-do-not-i=
mport-target-module-while-cross-compile.patch
> rename to meta-networking/recipes-connectivity/samba/samba/0002-do-not-i=
mport-target-module-while-cross-compile.patch
> index 3f2921ed3..292e614eb 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/20-do-not-import-=
target-module-while-cross-compile.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0002-do-not-impor=
t-target-module-while-cross-compile.patch
> @@ -1,4 +1,4 @@
> -From cc0576405803bcae45ee353c4333c449cead9207 Mon Sep 17 00:00:00 2001
> +From 9ebea97a52e4f70e831dd6402b865c77753ce1cc Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Tue, 25 Jun 2019 14:25:08 +0800
>  Subject: [PATCH] do not import target module while cross compile
> @@ -12,10 +12,10 @@ update to version 4.10.5, and switch to python3
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
>   buildtools/wafsamba/samba_bundled.py | 27 +++++++++++++++++++--------
> - 1 file changed, 18 insertions(+), 8 deletions(-)
> + 1 file changed, 19 insertions(+), 8 deletions(-)
>
>  diff --git a/buildtools/wafsamba/samba_bundled.py b/buildtools/wafsamba=
/samba_bundled.py
> -index 60ce7da..5468a36 100644
> +index 5f080dd..cdc115e 100644
>  --- a/buildtools/wafsamba/samba_bundled.py
>  +++ b/buildtools/wafsamba/samba_bundled.py
>  @@ -4,6 +4,7 @@ import sys
> @@ -63,5 +63,5 @@ index 60ce7da..5468a36 100644
>           Logs.error('ERROR: Python module %s of version %s not found, a=
nd bundling disabled' % (libname, minversion))
>           sys.exit(1)
>  --
> -2.7.4
> +2.17.1
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0002-util_=
sec.c-Move-__thread-variable-to-global-scope.patch b/meta-networking/recipe=
s-connectivity/samba/samba/0002-util_sec.c-Move-__thread-variable-to-global=
-scope.patch
> deleted file mode 100644
> index 6fc849337..000000000
> --- a/meta-networking/recipes-connectivity/samba/samba/0002-util_sec.c-M=
ove-__thread-variable-to-global-scope.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From c62a6f32ab965de2ec77a614f20f04568116835b Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 5 Sep 2019 21:39:05 -0700
> -Subject: [PATCH 2/2] util_sec.c: Move __thread variable to global scope
> -
> -Make clang happy otherwise it complains about variable scope
> -
> -fixes
> -
> -source3/./lib/util_sec.c:470:4: error: '__thread' variables must have g=
lobal storage
> -        } __thread cache;
> -          ^
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - source3/lib/util_sec.c | 19 +++++++++++--------
> - 1 file changed, 11 insertions(+), 8 deletions(-)
> -
> -diff --git a/source3/lib/util_sec.c b/source3/lib/util_sec.c
> -index 9408269..7390318 100644
> ---- a/source3/lib/util_sec.c
> -+++ b/source3/lib/util_sec.c
> -@@ -444,6 +444,17 @@ void become_user_permanently(uid_t uid, gid_t gid)
> -       assert_gid(gid, gid);
> - }
> -
> -+#ifdef HAVE___THREAD
> -+      struct cache_t {
> -+              bool active;
> -+              uid_t uid;
> -+              gid_t gid;
> -+              size_t setlen;
> -+              uintptr_t gidset;
> -+      };
> -+
> -+static __thread struct cache_t cache;
> -+#endif
> - /**********************************************************
> -  Function to set thread specific credentials. Leave
> -  saved-set uid/gid alone.Must be thread-safe code.
> -@@ -461,14 +472,6 @@ int set_thread_credentials(uid_t uid,
> -        * available.
> -        */
> - #ifdef HAVE___THREAD
> --      static struct {
> --              bool active;
> --              uid_t uid;
> --              gid_t gid;
> --              size_t setlen;
> --              uintptr_t gidset;
> --      } __thread cache;
> --
> -       if (cache.active &&
> -           cache.uid =3D=3D uid &&
> -           cache.gid =3D=3D gid &&
> ---
> -2.23.0
> -
> diff --git a/meta-networking/recipes-connectivity/samba/samba/21-add-con=
fig-option-without-valgrind.patch b/meta-networking/recipes-connectivity/sa=
mba/samba/0003-Add-config-option-without-valgrind.patch
> similarity index 88%
> rename from meta-networking/recipes-connectivity/samba/samba/21-add-conf=
ig-option-without-valgrind.patch
> rename to meta-networking/recipes-connectivity/samba/samba/0003-Add-conf=
ig-option-without-valgrind.patch
> index 46a6f0626..93ca005d6 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/21-add-config-opt=
ion-without-valgrind.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-o=
ption-without-valgrind.patch
> @@ -1,4 +1,4 @@
> -From 87bc8e7eafc7d12a1d3a143ebb9e43cf5fbafb72 Mon Sep 17 00:00:00 2001
> +From 6455448eb060d03a534539f1a424e2d3e44319e1 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Thu, 20 Jun 2019 14:11:16 +0800
>  Subject: [PATCH] Add config option without-valgrind
> @@ -15,10 +15,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.=
com>
>   2 files changed, 7 insertions(+), 2 deletions(-)
>
>  diff --git a/lib/replace/wscript b/lib/replace/wscript
> -index a7fd25d..a19ae68 100644
> +index 2c856b6..bc726f7 100644
>  --- a/lib/replace/wscript
>  +++ b/lib/replace/wscript
> -@@ -110,8 +110,9 @@ def configure(conf):
> +@@ -121,8 +121,9 @@ def configure(conf):
>       conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sy=
smacros.h')
>       conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
>
> @@ -31,10 +31,10 @@ index a7fd25d..a19ae68 100644
>       conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdef=
s.h')
>       conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
>  diff --git a/wscript b/wscript
> -index e38a8e9..38b7230 100644
> +index 83d9421..969b07a 100644
>  --- a/wscript
>  +++ b/wscript
> -@@ -105,6 +105,10 @@ def options(opt):
> +@@ -123,6 +123,10 @@ def options(opt):
>                     help=3D("Disable RELRO builds"),
>                     action=3D"store_false", dest=3D'enable_relro')
>
> @@ -46,5 +46,5 @@ index e38a8e9..38b7230 100644
>
>       opt.load('python') # options for disabling pyc or pyo compilation
>  --
> -2.7.4
> +2.17.1
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Add-o=
ptions-to-configure-the-use-of-libbsd.patch b/meta-networking/recipes-conne=
ctivity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch
> similarity index 76%
> rename from meta-networking/recipes-connectivity/samba/samba/0001-Add-op=
tions-to-configure-the-use-of-libbsd.patch
> rename to meta-networking/recipes-connectivity/samba/samba/0004-Add-opti=
ons-to-configure-the-use-of-libbsd.patch
> index 80cdd3955..5fd32f385 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/0001-Add-options-=
to-configure-the-use-of-libbsd.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-=
to-configure-the-use-of-libbsd.patch
> @@ -1,19 +1,21 @@
> -From 1e8d31c138395122df4cc2a3e0edd6cd3fad736c Mon Sep 17 00:00:00 2001
> +From 5abf3c2efa1cd4e16878b6b26068ff153973ebd3 Mon Sep 17 00:00:00 2001
>  From: Peter Kjellerstedt <pkj@axis.com>
>  Date: Tue, 28 Apr 2020 02:05:33 +0200
>  Subject: [PATCH] Add options to configure the use of libbsd
>
>  Upstream-Status: Inappropriate [oe deterministic build specific]
>  Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +
> +Rebase to 4.14.4
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>  ---
> - buildtools/wafsamba/wscript  |  7 +++++++
> - lib/crypto/wscript_configure |  2 +-
> - lib/replace/wscript          | 29 +++++++++++++++--------------
> - lib/texpect/wscript          |  7 ++++++-
> - 4 files changed, 29 insertions(+), 16 deletions(-)
> + buildtools/wafsamba/wscript |  7 +++++++
> + lib/replace/wscript         | 29 +++++++++++++++--------------
> + lib/texpect/wscript         |  8 +++++++-
> + 3 files changed, 29 insertions(+), 15 deletions(-)
>
>  diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
> -index 7b8fb01..a8e4b0a 100644
> +index 1aadb95..e7b47c0 100644
>  --- a/buildtools/wafsamba/wscript
>  +++ b/buildtools/wafsamba/wscript
>  @@ -88,6 +88,13 @@ def options(opt):
> @@ -30,24 +32,11 @@ index 7b8fb01..a8e4b0a 100644
>       gr =3D opt.option_group('developer options')
>
>       gr.add_option('-C',
> -diff --git a/lib/crypto/wscript_configure b/lib/crypto/wscript_configur=
e
> -index 09dfe04..e871718 100644
> ---- a/lib/crypto/wscript_configure
> -+++ b/lib/crypto/wscript_configure
> -@@ -2,7 +2,7 @@
> - from waflib import Options
> - from waflib import Errors, Logs
> -
> --if not conf.CHECK_FUNCS_IN('MD5Init', 'bsd', headers=3D'bsd/md5.h',
> -+if not Options.options.enable_libbsd or not conf.CHECK_FUNCS_IN('MD5In=
it', 'bsd', headers=3D'bsd/md5.h',
> -     checklibc=3DTrue):
> -     conf.CHECK_FUNCS_IN('MD5Init', 'md5', headers=3D'sys/md5.h',
> -                         checklibc=3DTrue)
>  diff --git a/lib/replace/wscript b/lib/replace/wscript
> -index 0020d2a..cd9228f 100644
> +index bc726f7..44ad0d6 100644
>  --- a/lib/replace/wscript
>  +++ b/lib/replace/wscript
> -@@ -407,20 +407,21 @@ def configure(conf):
> +@@ -419,20 +419,21 @@ def configure(conf):
>
>       strlcpy_in_bsd =3D False
>
> @@ -84,13 +73,14 @@ index 0020d2a..cd9228f 100644
>       conf.CHECK_CODE('''
>                   struct ucred cred;
>  diff --git a/lib/texpect/wscript b/lib/texpect/wscript
> -index e14c048..a91de59 100644
> +index 82f6b25..33eea64 100644
>  --- a/lib/texpect/wscript
>  +++ b/lib/texpect/wscript
> -@@ -1,7 +1,12 @@
> +@@ -1,7 +1,13 @@
>   #!/usr/bin/env python
> -+from waflib import Options
>
> ++from waflib import Options
> ++
>   def configure(conf):
>  -    conf.CHECK_FUNCS_IN('openpty', 'util', checklibc=3DTrue, headers=
=3D'pty.h util.h bsd/libutil.h libutil.h')
>  +    hdrs =3D 'pty.h util.h'
> @@ -100,4 +90,7 @@ index e14c048..a91de59 100644
>  +    conf.CHECK_FUNCS_IN('openpty', 'util', checklibc=3DTrue, headers=
=3Dhdrs)
>
>   def build(bld):
> -     bld.SAMBA_BINARY('texpect', 'texpect.c', deps=3D'popt util replace=
', install=3DFalse)
> +     bld.SAMBA_BINARY('texpect',
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/samba/samba/dnsserver-=
4.7.0.patch b/meta-networking/recipes-connectivity/samba/samba/0005-samba-b=
uild-dnsserver_common-code.patch
> similarity index 55%
> rename from meta-networking/recipes-connectivity/samba/samba/dnsserver-4=
.7.0.patch
> rename to meta-networking/recipes-connectivity/samba/samba/0005-samba-bu=
ild-dnsserver_common-code.patch
> index 0c7592f8e..2abbe563a 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/dnsserver-4.7.0.p=
atch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0005-samba-build-=
dnsserver_common-code.patch
> @@ -1,11 +1,19 @@
> -samba: build dnsserver_common code
> +From 10d7abc8f1aa99ae45209aeb704978d206f329c0 Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Tue, 1 Jun 2021 11:09:19 +0800
> +Subject: [PATCH] samba: build dnsserver_common code
>
>  Just 'install' does not seem to do it.
>
>  Upstream-Status: Pending
>
>  Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + source4/dns_server/wscript_build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
> +diff --git a/source4/dns_server/wscript_build b/source4/dns_server/wscr=
ipt_build
> +index e97c85d..a49fbb9 100644
>  --- a/source4/dns_server/wscript_build
>  +++ b/source4/dns_server/wscript_build
>  @@ -4,7 +4,7 @@ bld.SAMBA_LIBRARY('dnsserver_common',
> @@ -17,3 +25,6 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
>           )
>
>   bld.SAMBA_MODULE('service_dns',
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/samba/samba/iconv-4.7.=
0.patch b/meta-networking/recipes-connectivity/samba/samba/0006-samba-defea=
t-iconv-test.patch
> similarity index 52%
> rename from meta-networking/recipes-connectivity/samba/samba/iconv-4.7.0=
.patch
> rename to meta-networking/recipes-connectivity/samba/samba/0006-samba-de=
feat-iconv-test.patch
> index 5ae8c5978..00b692b58 100644
> --- a/meta-networking/recipes-connectivity/samba/samba/iconv-4.7.0.patch
> +++ b/meta-networking/recipes-connectivity/samba/samba/0006-samba-defeat=
-iconv-test.patch
> @@ -1,4 +1,7 @@
> -samba: defeat iconv test
> +From 59f7098bfbd63f9b3c19d7d297a8f90870a1893d Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Mon, 31 May 2021 14:50:38 +0800
> +Subject: [PATCH] samba: defeat iconv test
>
>  A test was added when configuring samba which requires target code
>  to be executed.  In general, this will not work, so we eliminate it.
> @@ -6,10 +9,15 @@ to be executed.  In general, this will not work, so we=
 eliminate it.
>  Upstream-Status: Pending
>
>  Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + lib/util/charset/wscript_configure | 3 +++
> + 1 file changed, 3 insertions(+)
>
> +diff --git a/lib/util/charset/wscript_configure b/lib/util/charset/wscr=
ipt_configure
> +index 9c27fc6..845eb36 100644
>  --- a/lib/util/charset/wscript_configure
>  +++ b/lib/util/charset/wscript_configure
> -@@ -17,6 +17,8 @@ if (conf.CHECK_FUNCS_IN('iconv_open', 'i
> +@@ -17,6 +17,8 @@ if (conf.CHECK_FUNCS_IN('iconv_open', 'iconv', checkl=
ibc=3DFalse, headers=3D'iconv.h
>
>       conf.DEFINE('HAVE_NATIVE_ICONV', 1)
>
> @@ -18,8 +26,14 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
>   conf.CHECK_CODE('''
>                   uint8_t inbuf[2] =3D { 0x30, 0xdf };
>                   uint8_t outbuf[4] =3D { 0 };
> -@@ -36,3 +38,4 @@ conf.CHECK_CODE('''
> +@@ -36,6 +38,7 @@ conf.CHECK_CODE('''
>                   msg=3D'Checking errno of iconv for illegal multibyte s=
equence',
>                   lib=3D'iconv',
>                   headers=3D'errno.h iconv.h')
>  +"""
> +
> + if conf.CHECK_CFG(package=3D'icu-i18n',
> +                args=3D'--cflags --libs',
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0007-wscri=
pt_configure_system_gnutls-disable-check-gnutls.patch b/meta-networking/rec=
ipes-connectivity/samba/samba/0007-wscript_configure_system_gnutls-disable-=
check-gnutls.patch
> new file mode 100644
> index 000000000..0f843af20
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/0007-wscript_conf=
igure_system_gnutls-disable-check-gnutls.patch
> @@ -0,0 +1,39 @@
> +From a31a014c5d98501074fde1acb5c00162c927c361 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Mon, 31 May 2021 15:47:58 +0800
> +Subject: [PATCH] wscript_configure_system_gnutls: disable check gnutls
> + AES_CFB8/AES_CMAC
> +
> +The CHECK_VALUEOF() can not work on cross-compilation.
> +
> +Fixes configure error:
> +  Checking value of GNUTLS_CIPHER_AES_128_CFB8: UNKNOWN
> +  Checking value of GNUTLS_MAC_AES_CMAC_128: UNKNOWN
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + wscript_configure_system_gnutls | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/wscript_configure_system_gnutls b/wscript_configure_system=
_gnutls
> +index 2ec217f..cd91b55 100644
> +--- a/wscript_configure_system_gnutls
> ++++ b/wscript_configure_system_gnutls
> +@@ -39,6 +39,7 @@ if (parse_version(gnutls_version) > parse_version('3.=
6.14')):
> + if conf.CHECK_FUNCS_IN('gnutls_get_system_config_file', 'gnutls'):
> +     conf.DEFINE('HAVE_GNUTLS_CRYPTO_POLICIES', 1)
> +
> ++"""
> + if conf.CHECK_VALUEOF('GNUTLS_CIPHER_AES_128_CFB8', headers=3D'gnutls/=
gnutls.h'):
> +     conf.DEFINE('HAVE_GNUTLS_AES_CFB8', 1)
> + else:
> +@@ -48,3 +49,4 @@ if conf.CHECK_VALUEOF('GNUTLS_MAC_AES_CMAC_128', head=
ers=3D'gnutls/gnutls.h'):
> +     conf.DEFINE('HAVE_GNUTLS_AES_CMAC', 1)
> + else:
> +     Logs.warn('No gnutls support for AES CMAC')
> ++"""
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0008-sourc=
e3-wscript-disable-check-fcntl-F_OWNER_EX.patch b/meta-networking/recipes-c=
onnectivity/samba/samba/0008-source3-wscript-disable-check-fcntl-F_OWNER_EX=
.patch
> new file mode 100644
> index 000000000..d4ceb5ce9
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/0008-source3-wscr=
ipt-disable-check-fcntl-F_OWNER_EX.patch
> @@ -0,0 +1,79 @@
> +From ba6bc5459cf148dd617fd9cd38dd50c3a9b5d706 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Mon, 31 May 2021 15:50:48 +0800
> +Subject: [PATCH] source3/wscript: disable check fcntl F_OWNER_EX
> +
> +It fails on cross-compilation.
> +
> +Fixes configure error:
> +  Checking whether fcntl supports flags to send direct I/O availability=
 signals: UNKNOWN
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + source3/wscript | 48 ------------------------------------------------
> + 1 file changed, 48 deletions(-)
> +
> +diff --git a/source3/wscript b/source3/wscript
> +index adc31ce..f6de0a6 100644
> +--- a/source3/wscript
> ++++ b/source3/wscript
> +@@ -1168,54 +1168,6 @@ err:
> + #include <fcntl.h>
> + #include <unistd.h>
> + #include <stdlib.h>
> +-#include <sys/socket.h>
> +-
> +-int main(void)
> +-{
> +-        int sockfd, ret;
> +-        struct f_owner_ex owner, get_owner;
> +-
> +-        sockfd =3D socket(AF_UNIX, SOCK_STREAM, 0);
> +-        if (sockfd =3D=3D -1) {
> +-            goto err;
> +-        }
> +-
> +-        owner.type =3D F_OWNER_PID;
> +-        owner.pid =3D getpid();
> +-
> +-        ret =3D fcntl(sockfd, F_SETOWN_EX, &owner);
> +-        if (ret =3D=3D -1) {
> +-            goto err;
> +-        }
> +-
> +-        ret =3D fcntl(sockfd, F_GETOWN_EX, &get_owner);
> +-        if (ret =3D=3D -1) {
> +-            goto err;
> +-        }
> +-
> +-        if (get_owner.type !=3D F_OWNER_PID) {
> +-            goto err;
> +-        }
> +-
> +-        if (get_owner.pid !=3D getpid()) {
> +-            goto err;
> +-        }
> +-
> +-        close(sockfd);
> +-        exit(0);
> +-err:
> +-        close(sockfd);
> +-        exit(1);
> +-}''',
> +-            'HAVE_F_OWNER_EX',
> +-            addmain=3DFalse,
> +-            execute=3DTrue,
> +-            msg=3D"Checking whether fcntl supports flags to send direc=
t I/O availability signals")
> +-
> +-    conf.CHECK_CODE('''
> +-#include <fcntl.h>
> +-#include <unistd.h>
> +-#include <stdlib.h>
> + #include <stdint.h>
> +
> + #define DATA "hinttest.fcntl"
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2020-1=
4318.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2020-1431=
8.patch
> deleted file mode 100644
> index ff1225db0..000000000
> --- a/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.pa=
tch
> +++ /dev/null
> @@ -1,142 +0,0 @@
> -From ccf53dfdcd39f3526dbc2f20e1245674155380ff Mon Sep 17 00:00:00 2001
> -From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> -Date: Fri, 11 Dec 2020 11:32:44 +0900
> -Subject: [PATCH] s4: torture: Add smb2.notify.handle-permissions test.
> -
> -s3: smbd: Ensure change notifies can't get set unless the
> - directory handle is open for SEC_DIR_LIST.
> -
> -CVE-2020-14318
> -
> -BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14434
> -
> -Signed-off-by: Jeremy Allison <jra@samba.org>
> -
> -Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ----
> - source3/smbd/notify.c         |  8 ++++
> - source4/torture/smb2/notify.c | 82 ++++++++++++++++++++++++++++++++++-
> - 2 files changed, 89 insertions(+), 1 deletion(-)
> -
> -diff --git a/source3/smbd/notify.c b/source3/smbd/notify.c
> -index 44c0b09..d23c03b 100644
> ---- a/source3/smbd/notify.c
> -+++ b/source3/smbd/notify.c
> -@@ -283,6 +283,14 @@ NTSTATUS change_notify_create(struct files_struct =
*fsp, uint32_t filter,
> -       char fullpath[len+1];
> -       NTSTATUS status =3D NT_STATUS_NOT_IMPLEMENTED;
> -
> -+      /*
> -+       * Setting a changenotify needs READ/LIST access
> -+       * on the directory handle.
> -+       */
> -+      if (!(fsp->access_mask & SEC_DIR_LIST)) {
> -+              return NT_STATUS_ACCESS_DENIED;
> -+      }
> -+
> -       if (fsp->notify !=3D NULL) {
> -               DEBUG(1, ("change_notify_create: fsp->notify !=3D NULL, =
"
> -                         "fname =3D %s\n", fsp->fsp_name->base_name));
> -diff --git a/source4/torture/smb2/notify.c b/source4/torture/smb2/notif=
y.c
> -index ebb4f8a..a5c9b94 100644
> ---- a/source4/torture/smb2/notify.c
> -+++ b/source4/torture/smb2/notify.c
> -@@ -2569,6 +2569,83 @@ done:
> -       return ok;
> - }
> -
> -+/*
> -+  Test asking for a change notify on a handle without permissions.
> -+*/
> -+
> -+#define BASEDIR_HPERM BASEDIR "_HPERM"
> -+
> -+static bool torture_smb2_notify_handle_permissions(
> -+              struct torture_context *torture,
> -+              struct smb2_tree *tree)
> -+{
> -+      bool ret =3D true;
> -+      NTSTATUS status;
> -+      union smb_notify notify;
> -+      union smb_open io;
> -+      struct smb2_handle h1 =3D {{0}};
> -+      struct smb2_request *req;
> -+
> -+      smb2_deltree(tree, BASEDIR_HPERM);
> -+      smb2_util_rmdir(tree, BASEDIR_HPERM);
> -+
> -+      torture_comment(torture,
> -+              "TESTING CHANGE NOTIFY "
> -+              "ON A HANDLE WITHOUT PERMISSIONS\n");
> -+
> -+      /*
> -+        get a handle on the directory
> -+      */
> -+      ZERO_STRUCT(io.smb2);
> -+      io.generic.level =3D RAW_OPEN_SMB2;
> -+      io.smb2.in.create_flags =3D 0;
> -+      io.smb2.in.desired_access =3D SEC_FILE_READ_ATTRIBUTE;
> -+      io.smb2.in.create_options =3D NTCREATEX_OPTIONS_DIRECTORY;
> -+      io.smb2.in.file_attributes =3D FILE_ATTRIBUTE_NORMAL;
> -+      io.smb2.in.share_access =3D NTCREATEX_SHARE_ACCESS_READ |
> -+                              NTCREATEX_SHARE_ACCESS_WRITE;
> -+      io.smb2.in.alloc_size =3D 0;
> -+      io.smb2.in.create_disposition =3D NTCREATEX_DISP_CREATE;
> -+      io.smb2.in.impersonation_level =3D SMB2_IMPERSONATION_ANONYMOUS;
> -+      io.smb2.in.security_flags =3D 0;
> -+      io.smb2.in.fname =3D BASEDIR_HPERM;
> -+
> -+      status =3D smb2_create(tree, torture, &io.smb2);
> -+      CHECK_STATUS(status, NT_STATUS_OK);
> -+      h1 =3D io.smb2.out.file.handle;
> -+
> -+      /* ask for a change notify,
> -+         on file or directory name changes */
> -+      ZERO_STRUCT(notify.smb2);
> -+      notify.smb2.level =3D RAW_NOTIFY_SMB2;
> -+      notify.smb2.in.buffer_size =3D 1000;
> -+      notify.smb2.in.completion_filter =3D FILE_NOTIFY_CHANGE_NAME;
> -+      notify.smb2.in.file.handle =3D h1;
> -+      notify.smb2.in.recursive =3D true;
> -+
> -+      req =3D smb2_notify_send(tree, &notify.smb2);
> -+      torture_assert_goto(torture,
> -+                      req !=3D NULL,
> -+                      ret,
> -+                      done,
> -+                      "smb2_notify_send failed\n");
> -+
> -+      /*
> -+       * Cancel it, we don't really want to wait.
> -+       */
> -+      smb2_cancel(req);
> -+      status =3D smb2_notify_recv(req, torture, &notify.smb2);
> -+      /* Handle h1 doesn't have permissions for ChangeNotify. */
> -+      CHECK_STATUS(status, NT_STATUS_ACCESS_DENIED);
> -+
> -+done:
> -+      if (!smb2_util_handle_empty(h1)) {
> -+              smb2_util_close(tree, h1);
> -+      }
> -+      smb2_deltree(tree, BASEDIR_HPERM);
> -+      return ret;
> -+}
> -+
> - /*
> -    basic testing of SMB2 change notify
> - */
> -@@ -2602,7 +2679,10 @@ struct torture_suite *torture_smb2_notify_init(T=
ALLOC_CTX *ctx)
> -                                    torture_smb2_notify_rmdir3);
> -       torture_suite_add_2smb2_test(suite, "rmdir4",
> -                                    torture_smb2_notify_rmdir4);
> --
> -+      torture_suite_add_1smb2_test(suite,
> -+                                  "handle-permissions",
> -+                                  torture_smb2_notify_handle_permissio=
ns);
> -+
> -       suite->description =3D talloc_strdup(suite, "SMB2-NOTIFY tests")=
;
> -
> -       return suite;
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2020-1=
4383.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2020-1438=
3.patch
> deleted file mode 100644
> index 3341b80a3..000000000
> --- a/meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.pa=
tch
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -From ff17443fe761eda864d13957bec45f5bac478fe3 Mon Sep 17 00:00:00 2001
> -From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> -Date: Fri, 11 Dec 2020 14:34:31 +0900
> -Subject: [PATCH] CVE-2020-14383: s4/dns: Ensure variable initialization=
 with
> - NULL. do not crash when additional data not found
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Found by Francis Brosnan Bl=C3=83=C2=A1zquez <francis@aspl.es>.
> -Based on patches from Francis Brosnan Bl=C3=83=C2=A1zquez <francis@aspl=
.es>
> -and Jeremy Allison <jra@samba.org>
> -
> -BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14472
> -BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D12795
> -
> -Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
> -Reviewed-by: Jeremy Allison <jra@samba.org>
> -
> -Autobuild-User(master): Douglas Bagnall <dbagnall@samba.org>
> -Autobuild-Date(master): Mon Aug 24 00:21:41 UTC 2020 on sn-devel-184
> -
> -(based on commit df98e7db04c901259dd089e20cd557bdbdeaf379)
> -(based on commit 7afe449e7201be92bed8e53cbb37b74af720ef4e
> -
> -Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ----
> - .../rpc_server/dnsserver/dcerpc_dnsserver.c   | 31 ++++++++++---------
> - 1 file changed, 17 insertions(+), 14 deletions(-)
> -
> -diff --git a/source4/rpc_server/dnsserver/dcerpc_dnsserver.c b/source4/=
rpc_server/dnsserver/dcerpc_dnsserver.c
> -index 910de9a1..618c7096 100644
> ---- a/source4/rpc_server/dnsserver/dcerpc_dnsserver.c
> -+++ b/source4/rpc_server/dnsserver/dcerpc_dnsserver.c
> -@@ -1754,15 +1754,17 @@ static WERROR dnsserver_enumerate_records(struc=
t dnsserver_state *dsstate,
> -       TALLOC_CTX *tmp_ctx;
> -       char *name;
> -       const char * const attrs[] =3D { "name", "dnsRecord", NULL };
> --      struct ldb_result *res;
> --      struct DNS_RPC_RECORDS_ARRAY *recs;
> -+      struct ldb_result *res =3D NULL;
> -+      struct DNS_RPC_RECORDS_ARRAY *recs =3D NULL;
> -       char **add_names =3D NULL;
> --      char *rname;
> -+      char *rname =3D NULL;
> -       const char *preference_name =3D NULL;
> -       int add_count =3D 0;
> -       int i, ret, len;
> -       WERROR status;
> --      struct dns_tree *tree, *base, *node;
> -+      struct dns_tree *tree =3D NULL;
> -+      struct dns_tree *base =3D NULL;
> -+      struct dns_tree *node =3D NULL;
> -
> -       tmp_ctx =3D talloc_new(mem_ctx);
> -       W_ERROR_HAVE_NO_MEMORY(tmp_ctx);
> -@@ -1845,15 +1847,15 @@ static WERROR dnsserver_enumerate_records(struc=
t dnsserver_state *dsstate,
> -               }
> -       }
> -
> --      talloc_free(res);
> --      talloc_free(tree);
> --      talloc_free(name);
> -+      TALLOC_FREE(res);
> -+      TALLOC_FREE(tree);
> -+      TALLOC_FREE(name);
> -
> -       /* Add any additional records */
> -       if (select_flag & DNS_RPC_VIEW_ADDITIONAL_DATA) {
> -               for (i=3D0; i<add_count; i++) {
> --                      struct dnsserver_zone *z2;
> --
> -+                      struct dnsserver_zone *z2 =3D NULL;
> -+                      struct ldb_message *msg =3D NULL;
> -                       /* Search all the available zones for additional=
 name */
> -                       for (z2 =3D dsstate->zones; z2; z2 =3D z2->next)=
 {
> -                               char *encoded_name;
> -@@ -1865,14 +1867,15 @@ static WERROR dnsserver_enumerate_records(struc=
t dnsserver_state *dsstate,
> -                                               LDB_SCOPE_ONELEVEL, attr=
s,
> -                                               "(&(objectClass=3DdnsNod=
e)(name=3D%s)(!(dNSTombstoned=3DTRUE)))",
> -                                               encoded_name);
> --                              talloc_free(name);
> -+                              TALLOC_FREE(name);
> -                               if (ret !=3D LDB_SUCCESS) {
> -                                       continue;
> -                               }
> -                               if (res->count =3D=3D 1) {
> -+                                      msg =3D res->msgs[0];
> -                                       break;
> -                               } else {
> --                                      talloc_free(res);
> -+                                      TALLOC_FREE(res);
> -                                       continue;
> -                               }
> -                       }
> -@@ -1885,10 +1888,10 @@ static WERROR dnsserver_enumerate_records(struc=
t dnsserver_state *dsstate,
> -                       }
> -                       status =3D dns_fill_records_array(tmp_ctx, NULL,=
 DNS_TYPE_A,
> -                                                       select_flag, rna=
me,
> --                                                      res->msgs[0], 0,=
 recs,
> -+                                                      msg, 0, recs,
> -                                                       NULL, NULL);
> --                      talloc_free(rname);
> --                      talloc_free(res);
> -+                      TALLOC_FREE(rname);
> -+                      TALLOC_FREE(res);
> -               }
> -       }
> -
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-connectivity/samba/samba/glibc_only=
.patch b/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
> deleted file mode 100644
> index d07ec0df1..000000000
> --- a/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 062cf74b498c1d12fd76f9d9bca926ac806e0b99 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 20 Jun 2019 14:15:18 +0800
> -Subject: [PATCH] glibc only fix
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - ctdb/tests/src/test_mutex_raw.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/ctdb/tests/src/test_mutex_raw.c b/ctdb/tests/src/test_mute=
x_raw.c
> -index 926a525..814343f 100644
> ---- a/ctdb/tests/src/test_mutex_raw.c
> -+++ b/ctdb/tests/src/test_mutex_raw.c
> -@@ -291,8 +291,10 @@ int main(int argc, const char **argv)
> -                                       "failed\n");
> -                               exit (EXIT_FAILURE);
> -                       }
> -+#ifdef __GLIBC__
> -               } else if (ret =3D=3D EBUSY) {
> -                       printf("INFO: pid=3D%u\n", mutex->__data.__owner=
);
> -+#endif
> -               } else if (ret =3D=3D 0) {
> -                       pthread_mutex_unlock(mutex);
> -               }
> ---
> -2.7.4
> -
> diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-samba=
-fix-musl-lib-without-innetgr.patch b/meta-networking/recipes-connectivity/=
samba/samba/samba-fix-musl-lib-without-innetgr.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/samba/samba/0001-samba-=
fix-musl-lib-without-innetgr.patch
> rename to meta-networking/recipes-connectivity/samba/samba/samba-fix-mus=
l-lib-without-innetgr.patch
> diff --git a/meta-networking/recipes-connectivity/samba/samba/smb_conf-4=
.7.0.patch b/meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.=
0.patch
> deleted file mode 100644
> index 6ae292835..000000000
> --- a/meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.pa=
tch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From f99b6a8617df6a46f41fb68ffafb2608dbb6681e Mon Sep 17 00:00:00 2001
> -From: Joe Slater <joe.slater@windriver.com>
> -Date: Wed, 8 Nov 2017 11:58:05 -0800
> -Subject: [PATCH] samba: correct log files location
> -
> -We use /var/log/samba.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> -
> ----
> - examples/smb.conf.default | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/examples/smb.conf.default b/examples/smb.conf.default
> -index 2f20720..44c1aa8 100644
> ---- a/examples/smb.conf.default
> -+++ b/examples/smb.conf.default
> -@@ -52,7 +52,7 @@
> -
> - # this tells Samba to use a separate log file for each machine
> - # that connects
> --   log file =3D /usr/local/samba/var/log.%m
> -+   log file =3D /var/log/samba/log.%m
> -
> - # Put a capping on the size of the log files (in Kb).
> -    max log size =3D 50
> diff --git a/meta-networking/recipes-connectivity/samba/samba/source3-ws=
cript-disable-check-fcntl-RW_HINTS.patch b/meta-networking/recipes-connecti=
vity/samba/samba/source3-wscript-disable-check-fcntl-RW_HINTS.patch
> new file mode 100644
> index 000000000..a0b751034
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/source3-wscript-d=
isable-check-fcntl-RW_HINTS.patch
> @@ -0,0 +1,92 @@
> +From 9942bca2e276c7b4c7696a08594258430c4c5bb5 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Thu, 3 Jun 2021 09:39:56 +0800
> +Subject: [PATCH] source3/wscript: disable check fcntl RW_HINTS
> +
> +It fails on cross-compilation for musl.
> +
> +Fixes configure error:
> +  Checking whether fcntl supports setting/geting hints: UNKNOWN
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + source3/wscript | 61 -------------------------------------------------
> + 1 file changed, 61 deletions(-)
> +
> +diff --git a/source3/wscript b/source3/wscript
> +index f6de0a6..3e260c1 100644
> +--- a/source3/wscript
> ++++ b/source3/wscript
> +@@ -1164,67 +1164,6 @@ err:
> +             execute=3DTrue,
> +             msg=3D"Checking whether fcntl lock supports open file desc=
ription locks")
> +
> +-    conf.CHECK_CODE('''
> +-#include <fcntl.h>
> +-#include <unistd.h>
> +-#include <stdlib.h>
> +-#include <stdint.h>
> +-
> +-#define DATA "hinttest.fcntl"
> +-
> +-int main(void)
> +-{
> +-        uint64_t hint, get_hint;
> +-        int fd;
> +-
> +-        fd =3D open(DATA, O_RDONLY | O_CREAT | O_EXCL);
> +-        if (fd =3D=3D -1) {
> +-            goto err;
> +-        }
> +-
> +-        hint =3D RWH_WRITE_LIFE_SHORT;
> +-        int ret =3D fcntl(fd, F_SET_RW_HINT, &hint);
> +-        if (ret =3D=3D -1) {
> +-            goto err;
> +-        }
> +-
> +-        ret =3D fcntl(fd, F_GET_RW_HINT, &get_hint);
> +-        if (ret =3D=3D -1) {
> +-            goto err;
> +-        }
> +-
> +-        if (get_hint !=3D RWH_WRITE_LIFE_SHORT) {
> +-            goto err;
> +-        }
> +-
> +-        hint =3D RWH_WRITE_LIFE_EXTREME;
> +-        ret =3D fcntl(fd, F_SET_FILE_RW_HINT, &hint);
> +-        if (ret =3D=3D -1) {
> +-            goto err;
> +-        }
> +-
> +-        ret =3D fcntl(fd, F_GET_FILE_RW_HINT, &get_hint);
> +-        if (ret =3D=3D -1) {
> +-            goto err;
> +-        }
> +-
> +-        if (get_hint !=3D RWH_WRITE_LIFE_EXTREME) {
> +-            goto err;
> +-        }
> +-
> +-        close(fd);
> +-        unlink(DATA);
> +-        exit(0);
> +-err:
> +-        close(fd);
> +-        unlink(DATA);
> +-        exit(1);
> +-}''',
> +-            'HAVE_RW_HINTS',
> +-            addmain=3DFalse,
> +-            execute=3DTrue,
> +-            msg=3D"Checking whether fcntl supports setting/geting hint=
s")
> +-
> +     conf.CHECK_STRUCTURE_MEMBER('struct stat', 'st_mtim.tv_nsec',
> +                                 define=3D'HAVE_STRUCT_STAT_ST_MTIM_TV_=
NSEC') # Linux, Solaris
> +     conf.CHECK_STRUCTURE_MEMBER('struct stat', 'st_mtimensec',
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb=
 b/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
> similarity index 85%
> rename from meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
> rename to meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
> index 166bf5727..2e0bdceab 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
> @@ -14,40 +14,36 @@ ${SAMBA_MIRROR}    http://www.mirrorservice.org/site=
s/ftp.samba.org \n \
>
>  SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
>             file://smb.conf \
> -           file://16-do-not-check-xsltproc-manpages.patch \
> -           file://20-do-not-import-target-module-while-cross-compile.pa=
tch \
> -           file://21-add-config-option-without-valgrind.patch \
> -           file://netdb_defines.patch \
> -           file://glibc_only.patch \
> -           file://iconv-4.7.0.patch \
> -           file://dnsserver-4.7.0.patch \
> -           file://smb_conf-4.7.0.patch \
>             file://volatiles.03_samba \
> -           file://0001-waf-add-support-of-cross_compile.patch \
> -           file://0001-lib-replace-wscript-Avoid-generating-nested-main=
-fun.patch \
> -           file://0002-util_sec.c-Move-__thread-variable-to-global-scop=
e.patch \
> -           file://0001-Add-options-to-configure-the-use-of-libbsd.patch=
 \
> -           file://0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-=
with.patch \
> -           file://CVE-2020-14318.patch \
> -           file://CVE-2020-14383.patch \
> +           file://0001-Don-t-check-xsltproc-manpages.patch \
> +           file://0002-do-not-import-target-module-while-cross-compile.=
patch \
> +           file://0003-Add-config-option-without-valgrind.patch \
> +           file://0004-Add-options-to-configure-the-use-of-libbsd.patch=
 \
> +           file://0005-samba-build-dnsserver_common-code.patch \
> +           file://0006-samba-defeat-iconv-test.patch \
> +           file://0007-wscript_configure_system_gnutls-disable-check-gn=
utls.patch \
> +           file://0008-source3-wscript-disable-check-fcntl-F_OWNER_EX.p=
atch \
>             "
> +
>  SRC_URI_append_libc-musl =3D " \
> +           file://netdb_defines.patch \
>             file://samba-pam.patch \
>             file://samba-4.3.9-remove-getpwent_r.patch \
>             file://cmocka-uintptr_t.patch \
> -           file://0001-samba-fix-musl-lib-without-innetgr.patch \
> -          "
> +           file://samba-fix-musl-lib-without-innetgr.patch \
> +           file://source3-wscript-disable-check-fcntl-RW_HINTS.patch \
> +           "
>
> -SRC_URI[md5sum] =3D "f006a3d1876113e4a049015969d20fe6"
> -SRC_URI[sha256sum] =3D "7dcfc2aaaac565b959068788e6a43fc79ce2a03e7d523f5=
843f7a9fddffc7c2c"
> +SRC_URI[md5sum] =3D "171629ad42b4b303107e8b0fff942a1f"
> +SRC_URI[sha256sum] =3D "89af092a0b00f5354ed287f0aa37b8c2cf9ba2ce67ea646=
4192e2c18528f89b9"
>
> -UPSTREAM_CHECK_REGEX =3D "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
> +UPSTREAM_CHECK_REGEX =3D "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
>
>  inherit systemd waf-samba cpan-base perlnative update-rc.d
>  # remove default added RDEPENDS on perl
>  RDEPENDS_${PN}_remove =3D "perl"
>
> -DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb libt=
event libldb libaio libpam libtasn1 jansson"
> +DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb libt=
event libldb libaio libpam libtasn1 jansson libparse-yapp-perl-native gnutl=
s"
>
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES =3D "pam"
> @@ -56,6 +52,8 @@ DEPENDS_append_libc-musl =3D " libtirpc"
>  CFLAGS_append_libc-musl =3D " -I${STAGING_INCDIR}/tirpc"
>  LDFLAGS_append_libc-musl =3D " -ltirpc"
>
> +COMPATIBLE_HOST_riscv32 =3D "null"
> +
>  INITSCRIPT_NAME =3D "samba"
>  INITSCRIPT_PARAMS =3D "start 20 3 5 . stop 20 0 1 6 ."
>
> @@ -76,7 +74,7 @@ export WAF_NO_PREFORK=3D"yes"
>  # Use krb5.  Build active domain controller.
>  #
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd zer=
oconf', d)} \
> -                   acl cups ad-dc gnutls ldap mitkrb5 \
> +                   acl cups ad-dc ldap mitkrb5 \
>  "
>
>  RDEPENDS_${PN}-ctdb-tests +=3D "bash util-linux-getopt"
> @@ -96,19 +94,7 @@ PACKAGECONFIG[libunwind] =3D ", , libunwind"
>  PACKAGECONFIG[gpgme] =3D ",--without-gpgme,,"
>  PACKAGECONFIG[lmdb] =3D ",--without-ldb-lmdb,lmdb,"
>  PACKAGECONFIG[libbsd] =3D "--with-libbsd, --without-libbsd, libbsd"
> -
> -# Building the AD (Active Directory) DC (Domain Controller) requires Gn=
uTLS,
> -# And ad-dc doesn't work with mitkrb5 for versions prior to 4.7.0 accor=
ding to:
> -# http://samba.2283325.n4.nabble.com/samba-4-6-6-Unknown-dependency-kdc=
-in-service-kdc-objlist-td4722096.html
> -# So the working combination is:
> -# 1) ad-dc: enable, gnutls: enable, mitkrb5: disable
> -# 2) ad-dc: disable, gnutls: enable/disable, mitkrb5: enable
> -#
> -# We are now at 4.7.0, so take the above with a grain of salt. We do no=
t need to know where
> -# krb5kdc is unless ad-dc is enabled, but we tell configure anyhow.
> -#
> -PACKAGECONFIG[ad-dc] =3D "--with-experimental-mit-ad-dc,--without-ad-dc=
,,"
> -PACKAGECONFIG[gnutls] =3D "--enable-gnutls,--disable-gnutls,gnutls,"
> +PACKAGECONFIG[ad-dc] =3D "--with-experimental-mit-ad-dc,--without-ad-dc=
,python3-markdown python3-dnspython,"
>  PACKAGECONFIG[mitkrb5] =3D "--with-system-mitkrb5 --with-system-mitkdc=
=3D/usr/sbin/krb5kdc,,krb5,"
>
>  SAMBA4_IDMAP_MODULES=3D"idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_=
tdb2"
> @@ -182,11 +168,11 @@ do_install_append() {
>      install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/d=
efault/samba
>
>      # the items are from ctdb/tests/run_tests.sh
> -    for d in onnode takeover tool eventscripts cunit simple complex; do
> -        testdir=3D${D}${datadir}/ctdb-tests/$d
> +    for d in cunit eventd eventscripts onnode shellcheck takeover takeo=
ver_helper tool; do
> +        testdir=3D${D}${datadir}/ctdb-tests/UNIT/$d
>          install -d $testdir
> -        cp ${S}/ctdb/tests/$d/*.sh $testdir
> -        cp -r ${S}/ctdb/tests/$d/scripts ${S}/ctdb/tests/$d/stubs $test=
dir || true
> +        cp ${S}/ctdb/tests/UNIT/$d/*.sh $testdir
> +        cp -r ${S}/ctdb/tests/UNIT/$d/scripts ${S}/ctdb/tests/UNIT/$d/s=
tubs $testdir || true
>      done
>
>      # fix file-rdeps qa warning
> @@ -197,7 +183,7 @@ do_install_append() {
>      chmod 0750 ${D}${sysconfdir}/sudoers.d || true
>      rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
>
> -    for f in samba-gpupdate samba_upgradedns samba_spnupdate samba_kcc =
samba_dnsupdate; do
> +    for f in samba-gpupdate samba_upgradedns samba_spnupdate samba_kcc =
samba_dnsupdate samba_downgrade_db; do
>          if [ -f "${D}${sbindir}/$f" ]; then
>              sed -i -e 's,${PYTHON},/usr/bin/env python3,g' ${D}${sbindi=
r}/$f
>          fi
> --
> 2.25.1
>
>
>=20
>

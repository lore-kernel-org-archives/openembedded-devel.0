Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF901098793
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 14:51:21 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14644.1774018276432945975
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 07:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XO5S5ZdP;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64c31ca77b4so808762d50.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 07:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774018275; cv=none;
        d=google.com; s=arc-20240605;
        b=YRQ2OQ42VpUU3sj1aQvf2srfj02v0tShd16wKQKIuyD0pTszTxsEUk55dANhdm850d
         CmHJ39DSr8y/0nxqi43KjxtF43cJBBLBL8yE8aAwdC+hyd2BnidJE8NWjvBr+giLPkah
         le/RZ2G0A34YYWOrTUWY/K5/VwSz7qGFWMcDHoRmoZ3Grvzg5jnDJzaOjrxYFFOed+j8
         K2sLyVtV5D/W83fwAmFfU0Fo3nw0rTk+4eX41bjmNFt7KQ1yZbstljJzB207H390iJOd
         fSeWaZEv7OOYhAUBlQ7CUxJC4acLBoGJJJECLgFoI2mqiNXUt9gTjFx93F2aeANIr95X
         5avw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=frUCfkRAjNfUs7DO9HxzqXemETeG4+tSo+Opkxr6G3s=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=YF1gpLI9Y58x3K+MR7HqrN7QcQTt3YcedTLZUDL4TJuhdfL7N7PyJJtJ0cwBNWL8LP
         53DpY674xMteyae36ctFqR6yNUW+VtKzI/wJEXhBrD9bnEi5eglgleIxVFntyXsvj4+I
         o0zfR04F2HQ1RbzrEweGbPsZDcKwMvqeDMD5v0H5mkDIKwff9QH7Rd1ddsF0lUFGh68P
         tCnqrEWPcj+IYyae3TqW5D9QerRCeOqx9BnPV+o1xQxP9jCi2bzc+55XK+0mo2E0PJgt
         1LDfEWbOnvgICe5GUUSOFJPo1F3HchH/PP7qVZ2HTbGr7OfF7RrNKS+uZSoOTBFZmmDD
         NP9A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774018275; x=1774623075; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=frUCfkRAjNfUs7DO9HxzqXemETeG4+tSo+Opkxr6G3s=;
        b=XO5S5ZdPlRcGq82PdcSXMKoheYQMqOK1wSodnBs/GuPDM/wI5UOi0cQFFvRnz9I4cg
         JwfyHGDildLuBuqdFrqLAZ8zXZ9LNGYYIa9B0MMW9Kewn78HYuzm/V5NRPVghFvJysXn
         XIVJRh4kDHh2U0Hj2Lk2VybWBROc9Eyz2hZDO4mhJHQg8WiPQIDNsdQIKzgx36U0j4x9
         EyGLPx+eQ9dCkOs8LyxffbJhU6Rp4WP8gnEDUePHFbTEgD7ure67VznrxJVcmsn92H4Y
         isPTLsqVWLMimEPaixhjP0gMubHS6RfOvZb+FfEMO1c2GS6ceuyhuN/Z/voKHj94bs1t
         AuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018275; x=1774623075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frUCfkRAjNfUs7DO9HxzqXemETeG4+tSo+Opkxr6G3s=;
        b=fe0B48nI//lGviO65pH42PcCUjI99wGkp3aw+k51bbLxgAYn63dGC7LrdlfHmhGUSl
         jd7yAgMNCDgftk51L97vSyE0iP8+1t8Imxtgm5JuSm9zdQElQ1P37kKIdupVmGVuDrnX
         W9IEBy+B74htUQ7haZuXzjwDzRSQmKGUVVp/mlf2Wy5+flMTwve4zVZVjPORe+NTqMZh
         tS2juU5nyGz/VWQz4iQ91MjirhGmzq2N3AzLZRJfKMBZtvrPVsGoqBT+Wz1gGOHpxNGG
         Yu9w+5qxIIfkYVLrbdyp/U/IPt49XjRK1fNswqselMB3SLAMey9BjXG1pJFwyvVjGNBf
         zIag==
X-Gm-Message-State: AOJu0YxYELCVbhE5WwuyNmGLRwoX6SNtx7OaIB3fiKTIztxmAcoSmxed
	FQFqr8ZYI5C6XwjnO1XOnj9fT7rRs1T8B5NIfgsX2v8hzD9YEXcdw2+l+bwMsldnvpVjpyxh3e+
	LLYU+JG23+Gxu1BP+Dqn14XARl8Bb2pU=
X-Gm-Gg: ATEYQzz8h82S6lxOvt18O4fdRo1ledllrwsPN8OVaE5ZNYh1nZ+Skdid/tx8DO5Bfsv
	DfgzCF+ziHSCZS82pS9T/3a/rhtk7hdrGLRU6ZdUSZkLvbsM7xud1CMdVSuiP2y5Afu4jqXJRhh
	NHmhDU79YicrjBsaEBpZjKlpuIY/mxUYllIzPcl4og+xmTIn3xH2K8WhH/GzfbjSRPUjMrT8HwP
	qdxxI7LmZ2XtgR/OLCuN3OO+UERSIf6BbOhFZTahQONJoUMXbUJ9mz2t+N4g/TGSN2Q/8c0JALA
	HGHx8AW23mNtgtouh7nM/KCCU9lzX05i86k/gtUgfCWR2uZgy7+3EneBsMUjZyRSrRHQA4iGOFn
	kpWWeGuDn5d5xIBB5FLNY3E+7
X-Received: by 2002:a53:e1c7:0:b0:64e:a737:e1a6 with SMTP id
 956f58d0204a3-64eaa77f179mr2777205d50.45.1774018275064; Fri, 20 Mar 2026
 07:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260320083033.2703890-1-skandigraun@gmail.com>
In-Reply-To: <20260320083033.2703890-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Mar 2026 07:50:46 -0700
X-Gm-Features: AaiRm53Zsizbjw7whl0tUrw-9mmVnurcUHbSM4x48SgmQdpZ2C_dRyiGHJ2O6gQ
Message-ID: <CAMKF1spZyOr-=86hia5ittUnTXXXuxV8rRiyEeT5r67w0pPtuA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] samba: upgrade 4.19.9 -> 4.23.5
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001c4280064d75d1d3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 14:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125439

--0000000000001c4280064d75d1d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 1:30=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Samba has a new build-time dependency, libquic[1]. The repository
> builds an out-of-tree  kernel module and a regular userspace library
> with the same build script, however the Makefile seems to be fairly
> hostile to cross-compilation. The Samba tarball also vendors the
> same with their own build script - for now, this venodred version is used=
.
>
> There are some efforts that the kernel part is mainlined[2], once it
> happens it should be possible to easily remove this from the recipe.
>
> pyldb was removed from RDEPENDS, as it seems that samba now builds its
> own version of it.
>
> Patches updated, unneeded patches dropped. Some patches contained a
> considerable amount of whitespace changes - those were trimmed for
> the ease of rebasing.
>
> Added a backported patch to avoid infinite recursion during the generatio=
n
> of the man pages.
>
> Changelog:
>
> https://gitlab.com/samba-team/samba/-/blob/samba-4.23.5/WHATSNEW.txt?ref_=
type=3Dtags
> (Switch to other branches to see earlier changelogs)
>
> [1]: https://github.com/lxin/quic/
> [2]: https://github.com/lxin/net-next/commits/quic/
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-Don-t-check-xsltproc-manpages.patch  |  19 +-
>  ...3-Add-config-option-without-valgrind.patch |  11 +-
>  ...eplace-memset_s-with-memset_explicit.patch | 117 +---------
>  ...tions-to-configure-the-use-of-libbsd.patch |  50 ++--
>  .../0004-lib-replace-Remove-memset_s.patch    | 217 +-----------------
>  ...c43315d83c19514251a11c4fba5a137f2821.patch |  70 ------
>  ...xslt-replace-function-when-available.patch |  51 ++++
>  .../{samba_4.19.9.bb =3D> samba_4.23.5.bb}      |  37 ++-
>  8 files changed, 131 insertions(+), 441 deletions(-)
>  delete mode 100644
> meta-networking/recipes-connectivity/samba/samba/9aa5c43315d83c19514251a1=
1c4fba5a137f2821.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/use-xslt-replace-functio=
n-when-available.patch
>  rename meta-networking/recipes-connectivity/samba/{samba_4.19.9.bb =3D>
> samba_4.23.5.bb} (88%)
>
> diff --git
> a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltp=
roc-manpages.patch
> b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltp=
roc-manpages.patch
> index a498348c20..afa1154827 100644
> ---
> a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltp=
roc-manpages.patch
> +++
> b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsltp=
roc-manpages.patch
> @@ -9,25 +9,14 @@ Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>
>  Rebase to 4.14.4
>  Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +
> +Rebase to 4.23.5
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>  ---
> - lib/ldb/wscript    | 2 +-
>   lib/talloc/wscript | 2 +-
>   lib/tdb/wscript    | 2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> + 2 files changed, 2 insertions(+), 2 deletions(-)
>
> -diff --git a/lib/ldb/wscript b/lib/ldb/wscript
> -index ed5d45f..de3c648 100644
> ---- a/lib/ldb/wscript
> -+++ b/lib/ldb/wscript
> -@@ -144,7 +144,7 @@ def configure(conf):
> -         conf.DEFINE('EXPECTED_SYSTEM_LDB_VERSION_RELEASE', int(v[2]))
> -
> -     if conf.env.standalone_ldb:
> --        conf.CHECK_XSLTPROC_MANPAGES()
> -+        #conf.CHECK_XSLTPROC_MANPAGES()
> -
> -         # we need this for the ldap backend
> -         if conf.CHECK_FUNCS_IN('ber_flush ldap_open ldap_initialize',
> 'lber ldap', headers=3D'lber.h ldap.h'):
>  diff --git a/lib/talloc/wscript b/lib/talloc/wscript
>  index 075f1ec..9bd9f73 100644
>  --- a/lib/talloc/wscript
> diff --git
> a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option=
-without-valgrind.patch
> b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option=
-without-valgrind.patch
> index 2c9d29c9fe..70e7f28cc7 100644
> ---
> a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option=
-without-valgrind.patch
> +++
> b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option=
-without-valgrind.patch
> @@ -37,10 +37,10 @@ diff --git a/wscript b/wscript
>  index 95ddd9e..6d9577a 100644
>  --- a/wscript
>  +++ b/wscript
> -@@ -123,6 +123,13 @@ def options(opt):
> +@@ -131,6 +131,13 @@
>                     help=3D('Disable kernely keyring support for credenti=
al
> storage'),
>                     action=3D'store_false', dest=3D'enable_keyring')
> -
> +
>  +    opt.add_option('--with-valgrind',
>  +                   help=3D("Enable use of valgrind"),
>  +                   action=3D"store_true", dest=3D'enable_valgrind')
> @@ -48,9 +48,6 @@ index 95ddd9e..6d9577a 100644
>  +                   help=3D("Disable use of valgrind"),
>  +                   action=3D"store_false", dest=3D'enable_valgrind',
> default=3DFalse)
>  +
> -     gr =3D opt.option_group('developer options')
> -
> -     opt.load('python') # options for disabling pyc or pyo compilation
> ---
> -2.25.1
> +     opt.samba_add_onoff_option('ldap')
>
> +     opt.option_group('developer options')
> diff --git
> a/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-=
with-memset_explicit.patch
> b/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-=
with-memset_explicit.patch
> index a96cd062cd..74ea1a7ab4 100644
> ---
> a/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-=
with-memset_explicit.patch
> +++
> b/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-=
with-memset_explicit.patch
> @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  --- a/lib/replace/replace.h
>  +++ b/lib/replace/replace.h
> -@@ -815,50 +815,50 @@ typedef unsigned long long ptrdiff_t ;
> +@@ -811,50 +811,50 @@ typedef unsigned long long ptrdiff_t ;
>   /**
>    * Zero a structure.
>    */
> @@ -74,7 +74,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>   /**
>    * Explicitly zero data in string. This is guaranteed to be not optimiz=
ed
> -@@ -867,7 +867,7 @@ typedef unsigned long long ptrdiff_t ;
> +@@ -863,7 +863,7 @@ typedef unsigned long long ptrdiff_t ;
>   #define BURN_STR(x)   do { \
>                                 if ((x) !=3D NULL) { \
>                                         size_t s =3D strlen(x); \
> @@ -193,116 +193,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>         talloc_free(mem_ctx);
>   }
> ---- a/lib/cmdline/cmdline.c
> -+++ b/lib/cmdline/cmdline.c
> -@@ -358,7 +358,7 @@ bool samba_cmdline_burn(int argc, char *
> -                               p +=3D ulen;
> -                       }
> -
> --                      memset_s(p, strlen(p), '\0', strlen(p));
> -+                      memset_explicit(p, '\0', strlen(p));
> -                       burnt =3D true;
> -               }
> -       }
> ---- a/lib/util/data_blob.c
> -+++ b/lib/util/data_blob.c
> -@@ -1,19 +1,19 @@
> --/*
> -+/*
> -    Unix SMB/CIFS implementation.
> -    Easy management of byte-length data
> -    Copyright (C) Andrew Tridgell 2001
> -    Copyright (C) Andrew Bartlett 2001
> --
> -+
> -    This program is free software; you can redistribute it and/or modify
> -    it under the terms of the GNU General Public License as published by
> -    the Free Software Foundation; either version 3 of the License, or
> -    (at your option) any later version.
> --
> -+
> -    This program is distributed in the hope that it will be useful,
> -    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -    GNU General Public License for more details.
> --
> -+
> -    You should have received a copy of the GNU General Public License
> -    along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
> - */
> -@@ -67,7 +67,7 @@ _PUBLIC_ DATA_BLOB data_blob_talloc_name
> - }
> -
> - /**
> -- construct a zero data blob, using supplied TALLOC_CTX.
> -+ construct a zero data blob, using supplied TALLOC_CTX.
> -  use this sparingly as it initialises data - better to initialise
> -  yourself if you want specific data in the blob
> - **/
> -@@ -95,7 +95,7 @@ clear a DATA_BLOB's contents
> - _PUBLIC_ void data_blob_clear(DATA_BLOB *d)
> - {
> -       if (d->data) {
> --              memset_s(d->data, d->length, 0, d->length);
> -+              memset_explicit(d->data, 0, d->length);
> -       }
> - }
> -
> -@@ -219,7 +219,7 @@ _PUBLIC_ DATA_BLOB data_blob_string_cons
> - }
> -
> - /**
> -- * Create a new data blob from const data
> -+ * Create a new data blob from const data
> -  */
> -
> - _PUBLIC_ DATA_BLOB data_blob_const(const void *p, size_t length)
> -@@ -266,7 +266,7 @@ _PUBLIC_ bool data_blob_append(TALLOC_CT
> -       if ((const uint8_t *)p + length < (const uint8_t *)p) {
> -               return false;
> -       }
> --
> -+
> -       if (!data_blob_realloc(mem_ctx, blob, new_len)) {
> -               return false;
> -       }
> ---- a/lib/util/talloc_keep_secret.c
> -+++ b/lib/util/talloc_keep_secret.c
> -@@ -22,27 +22,13 @@
> -
> - static int talloc_keep_secret_destructor(void *ptr)
> - {
> --      int ret;
> -       size_t size =3D talloc_get_size(ptr);
> -
> -       if (unlikely(size =3D=3D 0)) {
> -               return 0;
> -       }
> -
> --      ret =3D memset_s(ptr, size, 0, size);
> --      if (unlikely(ret !=3D 0)) {
> --              char *msg =3D NULL;
> --              int ret2;
> --              ret2 =3D asprintf(&msg,
> --                              "talloc_keep_secret_destructor: memset_s(=
)
> failed: %s",
> --                              strerror(ret));
> --              if (ret2 !=3D -1) {
> --                      smb_panic(msg);
> --              } else {
> --                      smb_panic("talloc_keep_secret_destructor:
> memset_s() failed");
> --              }
> --      }
> --
> -+      memset_explicit(ptr, 0, size);
> -       return 0;
> - }
> -
> ---- a/librpc/ndr/util.c
> -+++ b/librpc/ndr/util.c
> -@@ -32,5 +32,5 @@ _PUBLIC_ void ndr_print_sockaddr_storage
> -
> - _PUBLIC_ void ndr_zero_memory(void *ptr, size_t len)
> - {
> --      memset_s(ptr, len, 0, len);
> -+      memset_explicit(ptr, 0, len);
> - }
> diff --git
> a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-co=
nfigure-the-use-of-libbsd.patch
> b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-co=
nfigure-the-use-of-libbsd.patch
> index c72bd133ee..88acfeef07 100644
> ---
> a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-co=
nfigure-the-use-of-libbsd.patch
> +++
> b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-co=
nfigure-the-use-of-libbsd.patch
> @@ -19,7 +19,7 @@ diff --git a/buildtools/wafsamba/wscript
> b/buildtools/wafsamba/wscript
>  index 30cb366..d167551 100644
>  --- a/buildtools/wafsamba/wscript
>  +++ b/buildtools/wafsamba/wscript
> -@@ -145,6 +145,13 @@ Currently the only tested value is
> 'smbtorture,smbd/smbd' for Samba'''),
> +@@ -155,6 +155,13 @@ Currently the only tested value is
> 'smbtorture,smbd/smbd' for Samba'''),
>                      help=3D("Disable use of gettext"),
>                      action=3D"store_true", dest=3D'disable_gettext',
> default=3DFalse)
>
> @@ -37,40 +37,60 @@ diff --git a/lib/replace/wscript b/lib/replace/wscrip=
t
>  index 9dd9b48..a22ae59 100644
>  --- a/lib/replace/wscript
>  +++ b/lib/replace/wscript
> -@@ -444,20 +444,21 @@ def configure(conf):
> -
> +@@ -444,31 +444,32 @@
> +
>       strlcpy_in_bsd =3D False
> -
> +
>  -    # libbsd on some platforms provides strlcpy and strlcat
>  -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
>  -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd',
> headers=3D'bsd/string.h',
>  -                               checklibc=3DTrue):
>  -            strlcpy_in_bsd =3D True
> --    if not conf.CHECK_FUNCS('getpeereid'):
> --        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers=3D'sys/types.h
> bsd/unistd.h')
> --    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle',
> headers=3D'setproctitle.h'):
> --        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers=3D'sys/types=
.h
> bsd/unistd.h')
> --    if not conf.CHECK_FUNCS('setproctitle_init'):
> --        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd',
> headers=3D'sys/types.h bsd/unistd.h')
> --
> --    if not conf.CHECK_FUNCS('closefrom'):
> --        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers=3D'bsd/unistd.h=
')
> +-    elif conf.env.enable_fuzzing:
> +-        # Just to complicate it more, some versions of Honggfuzz have
> +-        # got strlcpy and strlcat in libc, but not in <string.h>
> +-        # (unless it is there coincidentally, on a BSD). Therefore we
> +-        # can't use CHECK_FUNCS alone to decide whether to add the
> +-        # headers to replace.h.
> +-        #
> +-        # As this is only known to happen on a fuzzing compiler, we'll
> +-        # skip the check when not in fuzzing mode.
> +-        conf.CHECK_HEADERS('bsd/string.h')
>  +    if Options.options.enable_libbsd:
>  +        # libbsd on some platforms provides strlcpy and strlcat
>  +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
>  +            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd',
> headers=3D'bsd/string.h',
>  +                                   checklibc=3DTrue):
>  +                strlcpy_in_bsd =3D True
> ++        elif conf.env.enable_fuzzing:
> ++            # Just to complicate it more, some versions of Honggfuzz ha=
ve
> ++            # got strlcpy and strlcat in libc, but not in <string.h>
> ++            # (unless it is there coincidentally, on a BSD). Therefore =
we
> ++            # can't use CHECK_FUNCS alone to decide whether to add the
> ++            # headers to replace.h.
> ++            #
> ++            # As this is only known to happen on a fuzzing compiler,
> we'll
> ++            # skip the check when not in fuzzing mode.
> ++            conf.CHECK_HEADERS('bsd/string.h')
> +
> +-    if not conf.CHECK_FUNCS('getpeereid'):
> +-        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers=3D'sys/types.h
> bsd/unistd.h')
> +-    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle',
> headers=3D'setproctitle.h'):
> +-        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers=3D'sys/types=
.h
> bsd/unistd.h')
> +-    if not conf.CHECK_FUNCS('setproctitle_init'):
> +-        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd',
> headers=3D'sys/types.h bsd/unistd.h')
>  +        if not conf.CHECK_FUNCS('getpeereid'):
>  +            conf.CHECK_FUNCS_IN('getpeereid', 'bsd',
> headers=3D'sys/types.h bsd/unistd.h')
>  +        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle',
> headers=3D'setproctitle.h'):
>  +            conf.CHECK_FUNCS_IN('setproctitle', 'bsd',
> headers=3D'sys/types.h bsd/unistd.h')
>  +        if not conf.CHECK_FUNCS('setproctitle_init'):
>  +            conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd',
> headers=3D'sys/types.h bsd/unistd.h')
> -+
> +
> +-    if not conf.CHECK_FUNCS('closefrom'):
> +-        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers=3D'bsd/unistd.h=
')
>  +        if not conf.CHECK_FUNCS('closefrom'):
>  +            conf.CHECK_FUNCS_IN('closefrom', 'bsd',
> headers=3D'bsd/unistd.h')
> -
> +
>       conf.CHECK_CODE('''
>                   struct ucred cred;
>  diff --git a/lib/texpect/wscript b/lib/texpect/wscript
> diff --git
> a/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remov=
e-memset_s.patch
> b/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remov=
e-memset_s.patch
> index 409c36da7c..6e01ae35e7 100644
> ---
> a/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remov=
e-memset_s.patch
> +++
> b/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remov=
e-memset_s.patch
> @@ -24,7 +24,7 @@ diff --git a/lib/replace/README b/lib/replace/README
>  index bb9d008..d8431e7 100644
>  --- a/lib/replace/README
>  +++ b/lib/replace/README
> -@@ -74,7 +74,6 @@ realpath
> +@@ -73,7 +73,6 @@ realpath
>   poll
>   setproctitle
>   memset_explicit
> @@ -36,219 +36,10 @@ diff --git a/lib/replace/replace.c
> b/lib/replace/replace.c
>  index 8615899..a419837 100644
>  --- a/lib/replace/replace.c
>  +++ b/lib/replace/replace.c
> -@@ -1,4 +1,4 @@
> --/*
> -+/*
> -    Unix SMB/CIFS implementation.
> -    replacement routines for broken systems
> -    Copyright (C) Andrew Tridgell 1992-1998
> -@@ -8,7 +8,7 @@
> -      ** NOTE! The following LGPL license applies to the replace
> -      ** library. This does NOT imply that all of Samba is released
> -      ** under the LGPL
> --
> -+
> -    This library is free software; you can redistribute it and/or
> -    modify it under the terms of the GNU Lesser General Public
> -    License as published by the Free Software Foundation; either
> -@@ -91,7 +91,7 @@ size_t rep_strlcpy(char *d, const char *s, size_t
> bufsize)
> - #endif
> -
> - #ifndef HAVE_STRLCAT
> --/* like strncat but does not 0 fill the buffer and always null
> -+/* like strncat but does not 0 fill the buffer and always null
> -    terminates. bufsize is the length of the buffer, which should
> -    be one more than the maximum resulting string length */
> - size_t rep_strlcat(char *d, const char *s, size_t bufsize)
> -@@ -116,7 +116,7 @@ size_t rep_strlcat(char *d, const char *s, size_t
> bufsize)
> -
> - #ifndef HAVE_MKTIME
> - /*******************************************************************
> --a mktime() replacement for those who don't have it - contributed by
> -+a mktime() replacement for those who don't have it - contributed by
> - C.A. Lademann <cal@zls.com>
> - Corrections by richard.kettlewell@kewill.com
> - ********************************************************************/
> -@@ -137,7 +137,7 @@ time_t rep_mktime(struct tm *t)
> -     return((time_t)-1);
> -
> -   n =3D t->tm_year + 1900 - 1;
> --  epoch =3D (t->tm_year - 70) * YEAR +
> -+  epoch =3D (t->tm_year - 70) * YEAR +
> -     ((n / 4 - n / 100 + n / 400) - (1969 / 4 - 1969 / 100 + 1969 / 400)=
)
> * DAY;
> -
> -   y =3D t->tm_year + 1900;
> -@@ -147,7 +147,7 @@ time_t rep_mktime(struct tm *t)
> -     epoch +=3D mon [m] * DAY;
> -     if(m =3D=3D 1 && y % 4 =3D=3D 0 && (y % 100 !=3D 0 || y % 400 =3D=
=3D 0))
> -       epoch +=3D DAY;
> --
> -+
> -     if(++m > 11) {
> -       m =3D 0;
> -       y++;
> -@@ -156,7 +156,7 @@ time_t rep_mktime(struct tm *t)
> -
> -   epoch +=3D (t->tm_mday - 1) * DAY;
> -   epoch +=3D t->tm_hour * HOUR + t->tm_min * MINUTE + t->tm_sec;
> --
> -+
> -   if((u =3D localtime(&epoch)) !=3D NULL) {
> -     t->tm_sec =3D u->tm_sec;
> -     t->tm_min =3D u->tm_min;
> -@@ -176,7 +176,7 @@ time_t rep_mktime(struct tm *t)
> -
> - #ifndef HAVE_INITGROUPS
> -
> /************************************************************************=
****
> -- some systems don't have an initgroups call
> -+ some systems don't have an initgroups call
> -
> *************************************************************************=
***/
> - int rep_initgroups(char *name, gid_t id)
> - {
> -@@ -194,7 +194,7 @@ int rep_initgroups(char *name, gid_t id)
> -       int    i,j;
> -       struct group *g;
> -       char   *gr;
> --
> -+
> -       if((grouplst =3D malloc(sizeof(gid_t) * max_gr)) =3D=3D NULL) {
> -               errno =3D ENOMEM;
> -               return -1;
> -@@ -250,9 +250,9 @@ void *rep_memmove(void *dest,const void *src,int siz=
e)
> -
> -       if (d < s) {
> -               /* we can forward copy */
> --              if (s-d >=3D sizeof(int) &&
> --                  !(s%sizeof(int)) &&
> --                  !(d%sizeof(int)) &&
> -+              if (s-d >=3D sizeof(int) &&
> -+                  !(s%sizeof(int)) &&
> -+                  !(d%sizeof(int)) &&
> -                   !(size%sizeof(int))) {
> -                       /* do it all as words */
> -                       int *idest =3D (int *)dest;
> -@@ -267,9 +267,9 @@ void *rep_memmove(void *dest,const void *src,int siz=
e)
> -               }
> -       } else {
> -               /* must backward copy */
> --              if (d-s >=3D sizeof(int) &&
> --                  !(s%sizeof(int)) &&
> --                  !(d%sizeof(int)) &&
> -+              if (d-s >=3D sizeof(int) &&
> -+                  !(s%sizeof(int)) &&
> -+                  !(d%sizeof(int)) &&
> -                   !(size%sizeof(int))) {
> -                       /* do it all as words */
> -                       int *idest =3D (int *)dest;
> -@@ -281,7 +281,7 @@ void *rep_memmove(void *dest,const void *src,int siz=
e)
> -                       char *cdest =3D (char *)dest;
> -                       char *csrc =3D (char *)src;
> -                       for (i=3Dsize-1;i>=3D0;i--) cdest[i] =3D csrc[i];
> --              }
> -+              }
> -       }
> -       return(dest);
> - }
> -@@ -334,16 +334,16 @@ void rep_vsyslog (int facility_priority, const cha=
r
> *format, va_list arglist)
> -  size_t rep_strnlen(const char *s, size_t max)
> - {
> -         size_t len;
> --
> -+
> -         for (len =3D 0; len < max; len++) {
> -                 if (s[len] =3D=3D '\0') {
> -                         break;
> -                 }
> -         }
> --        return len;
> -+        return len;
> +@@ -965,37 +965,6 @@
>   }
>   #endif
> --
> -+
> - #ifndef HAVE_STRNDUP
> - /**
> -  Some platforms don't have strndup.
> -@@ -351,7 +351,7 @@ void rep_vsyslog (int facility_priority, const char
> *format, va_list arglist)
> - char *rep_strndup(const char *s, size_t n)
> - {
> -       char *ret;
> --
> -+
> -       n =3D strnlen(s, n);
> -       ret =3D malloc(n+1);
> -       if (!ret)
> -@@ -407,7 +407,7 @@ int rep_chroot(const char *dname)
> -
> - /*****************************************************************
> -  Possibly replace mkstemp if it is broken.
> --*****************************************************************/
> -+*****************************************************************/
> -
> - #ifndef HAVE_SECURE_MKSTEMP
> - int rep_mkstemp(char *template)
> -@@ -425,7 +425,7 @@ int rep_mkstemp(char *template)
> - char *rep_mkdtemp(char *template)
> - {
> -       char *dname;
> --
> -+
> -       if ((dname =3D mktemp(template))) {
> -               if (mkdir(dname, 0700) >=3D 0) {
> -                       return dname;
> -@@ -532,7 +532,7 @@ long long int rep_strtoll(const char *str, char
> **endptr, int base)
> - {
> - #ifdef HAVE_STRTOQ
> -       return strtoq(str, endptr, base);
> --#elif defined(HAVE___STRTOLL)
> -+#elif defined(HAVE___STRTOLL)
> -       return __strtoll(str, endptr, base);
> - #elif SIZEOF_LONG =3D=3D SIZEOF_LONG_LONG
> -       return (long long int) strtol(str, endptr, base);
> -@@ -568,7 +568,7 @@ unsigned long long int rep_strtoull(const char *str,
> char **endptr, int base)
> - {
> - #ifdef HAVE_STRTOUQ
> -       return strtouq(str, endptr, base);
> --#elif defined(HAVE___STRTOULL)
> -+#elif defined(HAVE___STRTOULL)
> -       return __strtoull(str, endptr, base);
> - #elif SIZEOF_LONG =3D=3D SIZEOF_LONG_LONG
> -       return (unsigned long long int) strtoul(str, endptr, base);
> -@@ -599,7 +599,7 @@ unsigned long long int rep_strtoull(const char *str,
> char **endptr, int base)
> - #endif /* HAVE_STRTOULL */
> -
> - #ifndef HAVE_SETENV
> --int rep_setenv(const char *name, const char *value, int overwrite)
> -+int rep_setenv(const char *name, const char *value, int overwrite)
> - {
> -       char *p;
> -       size_t l1, l2;
> -@@ -644,10 +644,10 @@ int rep_unsetenv(const char *name)
> -       for (i=3D0;environ[i];i++) /* noop */ ;
> -
> -       count=3Di;
> --
> -+
> -       for (i=3D0;i<count;) {
> -               if (strncmp(environ[i], name, len) =3D=3D 0 && environ[i]=
[len]
> =3D=3D '=3D') {
> --                      /* note: we do _not_ free the old variable here.
> It is unsafe to
> -+                      /* note: we do _not_ free the old variable here.
> It is unsafe to
> -                          do so, as the pointer may not have come from
> malloc */
> -                       memmove(&environ[i], &environ[i+1],
> (count-i)*sizeof(char *));
> -                       count--;
> -@@ -688,7 +688,7 @@ int rep_utimes(const char *filename, const struct
> timeval tv[2])
> - #endif
> -
> - #ifndef HAVE_DUP2
> --int rep_dup2(int oldfd, int newfd)
> -+int rep_dup2(int oldfd, int newfd)
> - {
> -       errno =3D ENOSYS;
> -       return -1;
> -@@ -965,37 +965,6 @@ void *rep_memset_explicit(void *block, int c, size_=
t
> size)
> - }
> - #endif
> -
> +
>  -#ifndef HAVE_MEMSET_S
>  -# ifndef RSIZE_MAX
>  -#  define RSIZE_MAX (SIZE_MAX >> 1)
> @@ -267,7 +58,7 @@ index 8615899..a419837 100644
>  -      }
>  -
>  -#if defined(HAVE_MEMSET_EXPLICIT)
> --      memset_explicit(dest, destsz, ch, count);
> +-      memset_explicit(dest, ch, count);
>  -#else /* HAVE_MEMSET_EXPLICIT */
>  -      memset(dest, ch, count);
>  -# if defined(HAVE_GCC_VOLATILE_MEMORY_PROTECTION)
> diff --git
> a/meta-networking/recipes-connectivity/samba/samba/9aa5c43315d83c19514251=
a11c4fba5a137f2821.patch
> b/meta-networking/recipes-connectivity/samba/samba/9aa5c43315d83c19514251=
a11c4fba5a137f2821.patch
> deleted file mode 100644
> index e07e86e887..0000000000
> ---
> a/meta-networking/recipes-connectivity/samba/samba/9aa5c43315d83c19514251=
a11c4fba5a137f2821.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From 9aa5c43315d83c19514251a11c4fba5a137f2821 Mon Sep 17 00:00:00 2001
> -From: Andreas Schneider <asn@samba.org>
> -Date: Tue, 21 Jan 2025 17:59:27 +0100
> -Subject: [PATCH] lib:replace: Don't use deprecated readline CPPFunction
> cast
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -HAVE_RL_COMPLETION_FUNC_T was unused and not checking for the right
> -function.
> -
> -libcli/smbreadline/smbreadline.c: In function =E2=80=98smb_readline=E2=
=80=99:
> -libcli/smbreadline/smbreadline.c:139:17: warning: =E2=80=98CPPFunction=
=E2=80=99 is
> deprecated [-Wdeprecated-declarations]
> -  139 |                 rl_attempted_completion_function =3D
> RL_COMPLETION_CAST completion_fn;
> -      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -libcli/smbreadline/smbreadline.c:139:50: error: assignment to =E2=80=98c=
har **
> (*)(const char *, int,  int)=E2=80=99 from incompatible pointer type =E2=
=80=98char **
> (*)(void)=E2=80=99 [-Wincompatible-pointer-types]
> -  139 |                 rl_attempted_completion_function =3D
> RL_COMPLETION_CAST completion_fn;
> -      |                                                  ^
> -
> -BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15788
> -
> -Signed-off-by: Andreas Schneider <asn@samba.org>
> -Reviewed-by: Alexander Bokovoy <ab@samba.org>
> -
> -Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
> -Autobuild-Date(master): Tue Jan 21 19:38:37 UTC 2025 on atb-devel-224
> -
> -Upstream-Status: Backport [
> https://github.com/samba-team/samba/commit/9aa5c43315d83c19514251a11c4fba=
5a137f2821
> ]
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ----
> - lib/replace/system/readline.h        | 4 +++-
> - libcli/smbreadline/wscript_configure | 8 +++++---
> - 2 files changed, 8 insertions(+), 4 deletions(-)
> -
> -diff --git a/lib/replace/system/readline.h b/lib/replace/system/readline=
.h
> -index 9a9af266ca6d..ac3604fc12e0 100644
> ---- a/lib/replace/system/readline.h
> -+++ b/lib/replace/system/readline.h
> -@@ -46,7 +46,9 @@
> - #endif
> -
> - #ifdef HAVE_NEW_LIBREADLINE
> --#ifdef HAVE_CPPFUNCTION
> -+#if defined(HAVE_RL_COMPLETION_FUNC_T)
> -+#  define RL_COMPLETION_CAST (rl_completion_func_t *)
> -+#elif defined(HAVE_CPPFUNCTION)
> - #  define RL_COMPLETION_CAST (CPPFunction *)
> - #elif defined(HAVE_RL_COMPLETION_T)
> - #  define RL_COMPLETION_CAST (rl_completion_t *)
> -diff --git a/libcli/smbreadline/wscript_configure
> b/libcli/smbreadline/wscript_configure
> -index 912ff53a150d..f5a401ebae00 100644
> ---- a/libcli/smbreadline/wscript_configure
> -+++ b/libcli/smbreadline/wscript_configure
> -@@ -51,10 +51,12 @@ conf.CHECK_CODE('''
> - #    endif
> - #  endif
> - #endif
> --int main(void) {rl_completion_t f; return 0;}
> -+int main(void) {rl_completion_func_t f; return 0;}
> - ''',
> --'HAVE_RL_COMPLETION_FUNC_T', execute=3DFalse, addmain=3DFalse,
> --msg=3D'Checking for rl_completion_t')
> -+                'HAVE_RL_COMPLETION_FUNC_T',
> -+                execute=3DFalse,
> -+                addmain=3DFalse,
> -+                msg=3D'Checking for rl_completion_func_t')
> -
> - conf.CHECK_CODE('''
> - #ifdef HAVE_READLINE_READLINE_H
> diff --git
> a/meta-networking/recipes-connectivity/samba/samba/use-xslt-replace-funct=
ion-when-available.patch
> b/meta-networking/recipes-connectivity/samba/samba/use-xslt-replace-funct=
ion-when-available.patch
> new file mode 100644
> index 0000000000..c8cd7f37a8
> --- /dev/null
> +++
> b/meta-networking/recipes-connectivity/samba/samba/use-xslt-replace-funct=
ion-when-available.patch
> @@ -0,0 +1,51 @@
> +From: Peter De Wachter <pdewacht@gmail.com>
> +Date: Tue, 2 Jun 2020 09:10:39 -0400
> +Subject: use EXSLT "replace" function when available
> +
> +A recursive implementation  of string.subst is problematic,
> +long strings with many matches will cause stack overflows.
> +
> +Bug-Debian: https://bugs.debian.org/750593
> +
> +OE comment:
> +This fixes samba build error:
> +xsltApplySequenceConstructor: A potential infinite template recursion wa=
s
> detected
> +
> +The patch changes xslt-styleshets in native sysroot. It comes from Debia=
n,
> +but used by other distros also, for example Fedora.
> +
> +Looking at the history, it seems that the patch was upstreamed in 2018,
> +but upstream hasn't created a stable tag since 2016.
> +
> +Upstream-Status: Backport [
> https://github.com/docbook/xslt10-stylesheets/commit/1c41ae5ae3d481668746=
7712580d5f05957b3b88
> ]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + docbook-xsl/lib/lib.xsl | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/docbook-xsl/lib/lib.xsl b/docbook-xsl/lib/lib.xsl
> +index e65776a..bc45cd8 100644
> +--- a/docbook-xsl/lib/lib.xsl
> ++++ b/docbook-xsl/lib/lib.xsl
> +@@ -10,7 +10,10 @@
> +      This module implements DTD-independent functions
> +
> +
> ******************************************************************** -->
> +-<xsl:stylesheet xmlns:xsl=3D"http://www.w3.org/1999/XSL/Transform"
> version=3D"1.0">
> ++<xsl:stylesheet xmlns:xsl=3D"http://www.w3.org/1999/XSL/Transform"
> ++                xmlns:str=3D"http://exslt.org/strings"
> ++                exclude-result-prefixes=3D"str"
> ++                version=3D"1.0">
> +
> + <xsl:template name=3D"dot.count">
> +   <!-- Returns the number of "." characters in a string -->
> +@@ -56,6 +59,9 @@
> +   <xsl:param name=3D"replacement"/>
> +
> +   <xsl:choose>
> ++    <xsl:when test=3D"function-available('str:replace')">
> ++      <xsl:value-of select=3D"str:replace($string, string($target),
> string($replacement))"/>
> ++    </xsl:when>
> +     <xsl:when test=3D"contains($string, $target)">
> +       <xsl:variable name=3D"rest">
> +         <xsl:call-template name=3D"string.subst">
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
> b/meta-networking/recipes-connectivity/samba/samba_4.23.5.bb
> similarity index 88%
> rename from meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
> rename to meta-networking/recipes-connectivity/samba/samba_4.23.5.bb
> index 3ed1d46754..a84b20f564 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.23.5.bb
> @@ -14,6 +14,10 @@ ${SAMBA_MIRROR}
> http://www.mirrorservice.org/sites/ftp.samba.org \n \
>
>  export PYTHONHASHSEED =3D "1"
>
> +# If XML_CATALOG_FILES env var is not defined, waf defaults
> +# to build host folders looking for catalogs.
> +export XML_CATALOG_FILES =3D ""
> +
>  SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
>             file://smb.conf \
>             file://volatiles.03_samba \
> @@ -24,11 +28,11 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.g=
z \
>             file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
>             file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
>
> file://0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
> -           file://9aa5c43315d83c19514251a11c4fba5a137f2821.patch \
>             file://0001-lib-replace-Implement-memset_explicit.patch \
>             file://0002-lib-replace-Add-test-for-memset_explicit.patch \
>             file://0003-Replace-memset_s-with-memset_explicit.patch \
>             file://0004-lib-replace-Remove-memset_s.patch \
> +
>  file://use-xslt-replace-function-when-available.patch;rev=3Dneed-to-be-a=
pplied-manually
> \
>

use apply=3Dno if you want patch to be created in build area but not applie=
d.
however, this patch should be applied to oe-core docbook-xsl-stylesheets
recipe
the recipe should perhaps also swtich to using
https://github.com/docbook/xslt10-stylesheets
 for sources as there seems to be newer releases there 1.79.1 was released
in 2015

            "
>
>  SRC_URI:append:libc-musl =3D " \
> @@ -36,7 +40,7 @@ SRC_URI:append:libc-musl =3D " \
>             file://samba-4.3.9-remove-getpwent_r.patch \
>             "
>
> -SRC_URI[sha256sum] =3D
> "71ed406444714c90bb9d36c576d807b67af15449f297e91106d42b3ca2fa5549"
> +SRC_URI[sha256sum] =3D
> "593a43ddd0d57902237dfa76888f7b02cb7fc7747111369cb31e126db4836b9f"
>
>  UPSTREAM_CHECK_REGEX =3D "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
>
> @@ -47,7 +51,7 @@ CVE_STATUS[CVE-2011-2411] =3D "not-applicable-platform:
> vulnerable only on HP NonS
>  # remove default added RDEPENDS on perl
>  RDEPENDS:${PN}:remove =3D "perl"
>
> -DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb
> libtevent libldb libaio libpam libtasn1 libtasn1-native jansson
> libparse-yapp-perl-native gnutls cmocka"
> +DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb
> libtevent libaio libpam libtasn1 libtasn1-native jansson
> libparse-yapp-perl-native gnutls cmocka ngtcp2 bison-native"
>
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES =3D "pam"
> @@ -62,7 +66,7 @@ INITSCRIPT_NAME =3D "samba"
>  INITSCRIPT_PARAMS =3D "start 20 3 5 . stop 20 0 1 6 ."
>
>  SYSTEMD_PACKAGES =3D "${PN}-base ${PN}-ad-dc winbind ctdb"
> -SYSTEMD_SERVICE:${PN}-base =3D "nmb.service smb.service"
> +SYSTEMD_SERVICE:${PN}-base =3D "nmb.service smb.service samba-bgqd.servi=
ce"
>  SYSTEMD_SERVICE:${PN}-ad-dc =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'ad-dc', 'samba.service', '', d)}"
>  SYSTEMD_SERVICE:winbind =3D "winbind.service"
>  SYSTEMD_SERVICE:ctdb =3D "ctdb.service"
> @@ -109,7 +113,7 @@ SAMBA4_MODULES =3D
> "${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MO
>  # .so files so there will not be a conflict.  This is not done
> consistantly, so be very careful
>  # when adding to this list.
>  #
> -SAMBA4_LIBS =3D "heimdal,NONE"
> +SAMBA4_LIBS =3D "heimdal,libquic,NONE"
>
>  EXTRA_OECONF +=3D "--enable-fhs \
>                   --with-piddir=3D/run \
> @@ -132,6 +136,24 @@ EXTRA_OECONF +=3D "--enable-fhs \
>
>  LDFLAGS +=3D "-Wl,-z,relro,-z,now"
>
> +do_configure:prepend() {
> +    # The xsltproc tool is actually a wrapper script in OE, which export=
s
> its own XML_CATALOG_FILES env var
> +    # However samba does that too. So here I'm trying to concatenate the
> variables.
> +    # The original looks like this in the wrapper:
> +    # export XML_CATALOG_FILES=3Doe-core-specific-thing
> +    # and this sed prepends the value with $XML_CATALOG_FILES, and
> encloses it in quotes. So the end value is
> +    # export XML_CATALOG_FILES=3D"$XML_CATALOG FILES oe-core-specific-th=
ing"
> +    # The first grep just checks if it was already done, so it is not
> prepended multiple times.
> +
> +    grep \$XML_CATALOG_FILES ${STAGING_BINDIR_NATIVE}/xsltproc || \
> +        sed -i 's,\(XML_CATALOG_FILES\)=3D\(.*\),\1=3D"\$XML_CATALOG_FIL=
ES
> \2",' ${STAGING_BINDIR_NATIVE}/xsltproc
> +
> +    # This patch modifies xslt-stylesheets in sysroot. Version is
> hardcoded in the path - when it fails, that should be an
> +    # indicator that a new version is available, which contains this pat=
ch
> +    grep exslt
> ${STAGING_DATADIR_NATIVE}/xml/docbook/xsl-stylesheets-1.79.1/lib/lib.xsl =
||
> \
> +        patch -p 3 -d
> ${STAGING_DATADIR_NATIVE}/xml/docbook/xsl-stylesheets-1.79.1/lib <
> ${UNPACKDIR}/use-xslt-replace-function-when-available.patch
> +}
> +
>  do_configure:append() {
>      cd ${S}/pidl/
>      perl Makefile.PL PREFIX=3D${prefix}
> @@ -213,6 +235,9 @@ do_install:append() {
>      find ${D}${libdir}/perl5/ -type f -name "perllocal.pod" -delete
>      find ${D}${libdir}/perl5/ -type f -name ".packlist" -delete
>      sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${bindir}/pidl
> +
> +    sed -i 's,${UNPACKDIR},,g' ${S}/bin/default/libcli/wsp/wsp_aqs_lexer=
.c
> +    sed -i 's,${UNPACKDIR},,g' ${S}/bin/default/libcli/wsp/wsp_aqs_lexer=
.h
>  }
>
>  PACKAGES =3D+ "${PN}-python3 ${PN}-pidl \
> @@ -245,7 +270,7 @@ PACKAGESPLITFUNCS:prepend =3D "samba_populate_package=
s "
>  PACKAGES_DYNAMIC =3D "samba-auth-.* samba-pdb-.*"
>
>  RDEPENDS:${PN} +=3D "${PN}-base ${PN}-python3 ${PN}-dsdb-modules python3=
"
> -RDEPENDS:${PN}-python3 +=3D "pytalloc python3-tdb pyldb"
> +RDEPENDS:${PN}-python3 +=3D "pytalloc python3-tdb"
>
>  FILES:${PN}-base =3D "${sbindir}/nmbd \
>                      ${sbindir}/smbd \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125422):
> https://lists.openembedded.org/g/openembedded-devel/message/125422
> Mute This Topic: https://lists.openembedded.org/mt/118414326/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001c4280064d75d1d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 20,=
 2026 at 1:30=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Samba has =
a new build-time dependency, libquic[1]. The repository<br>
builds an out-of-tree=C2=A0 kernel module and a regular userspace library<b=
r>
with the same build script, however the Makefile seems to be fairly<br>
hostile to cross-compilation. The Samba tarball also vendors the<br>
same with their own build script - for now, this venodred version is used.<=
br>
<br>
There are some efforts that the kernel part is mainlined[2], once it<br>
happens it should be possible to easily remove this from the recipe.<br>
<br>
pyldb was removed from RDEPENDS, as it seems that samba now builds its<br>
own version of it.<br>
<br>
Patches updated, unneeded patches dropped. Some patches contained a<br>
considerable amount of whitespace changes - those were trimmed for<br>
the ease of rebasing.<br>
<br>
Added a backported patch to avoid infinite recursion during the generation<=
br>
of the man pages.<br>
<br>
Changelog:<br>
<a href=3D"https://gitlab.com/samba-team/samba/-/blob/samba-4.23.5/WHATSNEW=
.txt?ref_type=3Dtags" rel=3D"noreferrer" target=3D"_blank">https://gitlab.c=
om/samba-team/samba/-/blob/samba-4.23.5/WHATSNEW.txt?ref_type=3Dtags</a><br=
>
(Switch to other branches to see earlier changelogs)<br>
<br>
[1]: <a href=3D"https://github.com/lxin/quic/" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/lxin/quic/</a><br>
[2]: <a href=3D"https://github.com/lxin/net-next/commits/quic/" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/lxin/net-next/commits/quic/</a=
><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Don-t-check-xsltproc-manpages.patch=C2=A0 |=C2=A0 19 +-<br>
=C2=A0...3-Add-config-option-without-valgrind.patch |=C2=A0 11 +-<br>
=C2=A0...eplace-memset_s-with-memset_explicit.patch | 117 +---------<br>
=C2=A0...tions-to-configure-the-use-of-libbsd.patch |=C2=A0 50 ++--<br>
=C2=A0.../0004-lib-replace-Remove-memset_s.patch=C2=A0 =C2=A0 | 217 +------=
-----------<br>
=C2=A0...c43315d83c19514251a11c4fba5a137f2821.patch |=C2=A0 70 ------<br>
=C2=A0...xslt-replace-function-when-available.patch |=C2=A0 51 ++++<br>
=C2=A0.../{<a href=3D"http://samba_4.19.9.bb" rel=3D"noreferrer" target=3D"=
_blank">samba_4.19.9.bb</a> =3D&gt; <a href=3D"http://samba_4.23.5.bb" rel=
=3D"noreferrer" target=3D"_blank">samba_4.23.5.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 37 ++-<br>
=C2=A08 files changed, 131 insertions(+), 441 deletions(-)<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/samba/samba/9=
aa5c43315d83c19514251a11c4fba5a137f2821.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/u=
se-xslt-replace-function-when-available.patch<br>
=C2=A0rename meta-networking/recipes-connectivity/samba/{<a href=3D"http://=
samba_4.19.9.bb" rel=3D"noreferrer" target=3D"_blank">samba_4.19.9.bb</a> =
=3D&gt; <a href=3D"http://samba_4.23.5.bb" rel=3D"noreferrer" target=3D"_bl=
ank">samba_4.23.5.bb</a>} (88%)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-ch=
eck-xsltproc-manpages.patch b/meta-networking/recipes-connectivity/samba/sa=
mba/0001-Don-t-check-xsltproc-manpages.patch<br>
index a498348c20..afa1154827 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsl=
tproc-manpages.patch<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-Don-t-check-xsl=
tproc-manpages.patch<br>
@@ -9,25 +9,14 @@ Signed-off-by: Bian Naimeng &lt;<a href=3D"mailto:biannm@=
cn.fujitsu.com" target=3D"_blank">biannm@cn.fujitsu.com</a>&gt;<br>
<br>
=C2=A0Rebase to 4.14.4<br>
=C2=A0Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" t=
arget=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
+<br>
+Rebase to 4.23.5<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
=C2=A0---<br>
- lib/ldb/wscript=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0 lib/talloc/wscript | 2 +-<br>
=C2=A0 lib/tdb/wscript=C2=A0 =C2=A0 | 2 +-<br>
- 3 files changed, 3 insertions(+), 3 deletions(-)<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
-diff --git a/lib/ldb/wscript b/lib/ldb/wscript<br>
-index ed5d45f..de3c648 100644<br>
---- a/lib/ldb/wscript<br>
-+++ b/lib/ldb/wscript<br>
-@@ -144,7 +144,7 @@ def configure(conf):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conf.DEFINE(&#39;EXPECTED_SYSTEM_LDB_VER=
SION_RELEASE&#39;, int(v[2]))<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if conf.env.standalone_ldb:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_XSLTPROC_MANPAGES()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #conf.CHECK_XSLTPROC_MANPAGES()<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# we need this for the ldap backend<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if conf.CHECK_FUNCS_IN(&#39;ber_flush ld=
ap_open ldap_initialize&#39;, &#39;lber ldap&#39;, headers=3D&#39;lber.h ld=
ap.h&#39;):<br>
=C2=A0diff --git a/lib/talloc/wscript b/lib/talloc/wscript<br>
=C2=A0index 075f1ec..9bd9f73 100644<br>
=C2=A0--- a/lib/talloc/wscript<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-Add-conf=
ig-option-without-valgrind.patch b/meta-networking/recipes-connectivity/sam=
ba/samba/0003-Add-config-option-without-valgrind.patch<br>
index 2c9d29c9fe..70e7f28cc7 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-opti=
on-without-valgrind.patch<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-opti=
on-without-valgrind.patch<br>
@@ -37,10 +37,10 @@ diff --git a/wscript b/wscript<br>
=C2=A0index 95ddd9e..6d9577a 100644<br>
=C2=A0--- a/wscript<br>
=C2=A0+++ b/wscript<br>
-@@ -123,6 +123,13 @@ def options(opt):<br>
+@@ -131,6 +131,13 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=
=3D(&#39;Disable kernely keyring support for credential storage&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actio=
n=3D&#39;store_false&#39;, dest=3D&#39;enable_keyring&#39;)<br>
- <br>
+<br>
=C2=A0+=C2=A0 =C2=A0 opt.add_option(&#39;--with-valgrind&#39;,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0help=3D(&quot;Enable use of valgrind&quot;),<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0action=3D&quot;store_true&quot;, dest=3D&#39;enable_valgrind&#39;)<br>
@@ -48,9 +48,6 @@ index 95ddd9e..6d9577a 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0help=3D(&quot;Disable use of valgrind&quot;),<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0action=3D&quot;store_false&quot;, dest=3D&#39;enable_valgrind&#39;, defa=
ult=3DFalse)<br>
=C2=A0+<br>
-=C2=A0 =C2=A0 =C2=A0gr =3D opt.option_group(&#39;developer options&#39;)<b=
r>
- <br>
-=C2=A0 =C2=A0 =C2=A0opt.load(&#39;python&#39;) # options for disabling pyc=
 or pyo compilation<br>
--- <br>
-2.25.1<br>
+=C2=A0 =C2=A0 =C2=A0opt.samba_add_onoff_option(&#39;ldap&#39;)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0opt.option_group(&#39;developer options&#39;)<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-Replace-=
memset_s-with-memset_explicit.patch b/meta-networking/recipes-connectivity/=
samba/samba/0003-Replace-memset_s-with-memset_explicit.patch<br>
index a96cd062cd..74ea1a7ab4 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_=
s-with-memset_explicit.patch<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_=
s-with-memset_explicit.patch<br>
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
=C2=A0--- a/lib/replace/replace.h<br>
=C2=A0+++ b/lib/replace/replace.h<br>
-@@ -815,50 +815,50 @@ typedef unsigned long long ptrdiff_t ;<br>
+@@ -811,50 +811,50 @@ typedef unsigned long long ptrdiff_t ;<br>
=C2=A0 /**<br>
=C2=A0 =C2=A0* Zero a structure.<br>
=C2=A0 =C2=A0*/<br>
@@ -74,7 +74,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
=C2=A0 /**<br>
=C2=A0 =C2=A0* Explicitly zero data in string. This is guaranteed to be not=
 optimized<br>
-@@ -867,7 +867,7 @@ typedef unsigned long long ptrdiff_t ;<br>
+@@ -863,7 +863,7 @@ typedef unsigned long long ptrdiff_t ;<br>
=C2=A0 #define BURN_STR(x)=C2=A0 =C2=A0do { \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((x) !=3D NULL) { \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t s=
 =3D strlen(x); \<br>
@@ -193,116 +193,3 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 talloc_free(mem_ctx);<br>
=C2=A0 }<br>
---- a/lib/cmdline/cmdline.c<br>
-+++ b/lib/cmdline/cmdline.c<br>
-@@ -358,7 +358,7 @@ bool samba_cmdline_burn(int argc, char *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p +=3D ulen;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 memset_s(p, strlen(p), &#39;\0&#39;, strlen(p));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 memset_explicit(p, &#39;\0&#39;, strlen(p));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0burnt =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
---- a/lib/util/data_blob.c<br>
-+++ b/lib/util/data_blob.c<br>
-@@ -1,19 +1,19 @@<br>
--/* <br>
-+/*<br>
-=C2=A0 =C2=A0 Unix SMB/CIFS implementation.<br>
-=C2=A0 =C2=A0 Easy management of byte-length data<br>
-=C2=A0 =C2=A0 Copyright (C) Andrew Tridgell 2001<br>
-=C2=A0 =C2=A0 Copyright (C) Andrew Bartlett 2001<br>
--=C2=A0 =C2=A0<br>
-+<br>
-=C2=A0 =C2=A0 This program is free software; you can redistribute it and/o=
r modify<br>
-=C2=A0 =C2=A0 it under the terms of the GNU General Public License as publ=
ished by<br>
-=C2=A0 =C2=A0 the Free Software Foundation; either version 3 of the Licens=
e, or<br>
-=C2=A0 =C2=A0 (at your option) any later version.<br>
--=C2=A0 =C2=A0<br>
-+<br>
-=C2=A0 =C2=A0 This program is distributed in the hope that it will be usef=
ul,<br>
-=C2=A0 =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty =
of<br>
-=C2=A0 =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 S=
ee the<br>
-=C2=A0 =C2=A0 GNU General Public License for more details.<br>
--=C2=A0 =C2=A0<br>
-+<br>
-=C2=A0 =C2=A0 You should have received a copy of the GNU General Public Li=
cense<br>
-=C2=A0 =C2=A0 along with this program.=C2=A0 If not, see &lt;<a href=3D"ht=
tp://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www=
.gnu.org/licenses/</a>&gt;.<br>
- */<br>
-@@ -67,7 +67,7 @@ _PUBLIC_ DATA_BLOB data_blob_talloc_name<br>
- }<br>
- <br>
- /**<br>
-- construct a zero data blob, using supplied TALLOC_CTX. <br>
-+ construct a zero data blob, using supplied TALLOC_CTX.<br>
-=C2=A0 use this sparingly as it initialises data - better to initialise<br=
>
-=C2=A0 yourself if you want specific data in the blob<br>
- **/<br>
-@@ -95,7 +95,7 @@ clear a DATA_BLOB&#39;s contents<br>
- _PUBLIC_ void data_blob_clear(DATA_BLOB *d)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (d-&gt;data) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset_s(d-&gt;data, d-&=
gt;length, 0, d-&gt;length);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset_explicit(d-&gt;da=
ta, 0, d-&gt;length);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
-@@ -219,7 +219,7 @@ _PUBLIC_ DATA_BLOB data_blob_string_cons<br>
- }<br>
- <br>
- /**<br>
-- * Create a new data blob from const data <br>
-+ * Create a new data blob from const data<br>
-=C2=A0 */<br>
- <br>
- _PUBLIC_ DATA_BLOB data_blob_const(const void *p, size_t length)<br>
-@@ -266,7 +266,7 @@ _PUBLIC_ bool data_blob_append(TALLOC_CT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((const uint8_t *)p + length &lt; (const uin=
t8_t *)p) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 <br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data_blob_realloc(mem_ctx, blob, new_len))=
 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
---- a/lib/util/talloc_keep_secret.c<br>
-+++ b/lib/util/talloc_keep_secret.c<br>
-@@ -22,27 +22,13 @@<br>
- <br>
- static int talloc_keep_secret_destructor(void *ptr)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size =3D talloc_get_size(ptr);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(size =3D=3D 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 ret =3D memset_s(ptr, size, 0, size);<br>
--=C2=A0 =C2=A0 =C2=A0 if (unlikely(ret !=3D 0)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *msg =3D NULL;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret2;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret2 =3D asprintf(&amp;m=
sg,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;talloc_keep_secret_destructor: memset=
_s() failed: %s&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(ret));<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret2 !=3D -1) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 smb_panic(msg);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 smb_panic(&quot;talloc_keep_secret_destructor: memset_s() failed&quot;)=
;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
-+=C2=A0 =C2=A0 =C2=A0 memset_explicit(ptr, 0, size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
- <br>
---- a/librpc/ndr/util.c<br>
-+++ b/librpc/ndr/util.c<br>
-@@ -32,5 +32,5 @@ _PUBLIC_ void ndr_print_sockaddr_storage<br>
- <br>
- _PUBLIC_ void ndr_zero_memory(void *ptr, size_t len)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 memset_s(ptr, len, 0, len);<br>
-+=C2=A0 =C2=A0 =C2=A0 memset_explicit(ptr, 0, len);<br>
- }<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/0004-Add-opti=
ons-to-configure-the-use-of-libbsd.patch b/meta-networking/recipes-connecti=
vity/samba/samba/0004-Add-options-to-configure-the-use-of-libbsd.patch<br>
index c72bd133ee..88acfeef07 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-=
configure-the-use-of-libbsd.patch<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/0004-Add-options-to-=
configure-the-use-of-libbsd.patch<br>
@@ -19,7 +19,7 @@ diff --git a/buildtools/wafsamba/wscript b/buildtools/waf=
samba/wscript<br>
=C2=A0index 30cb366..d167551 100644<br>
=C2=A0--- a/buildtools/wafsamba/wscript<br>
=C2=A0+++ b/buildtools/wafsamba/wscript<br>
-@@ -145,6 +145,13 @@ Currently the only tested value is &#39;smbtorture,sm=
bd/smbd&#39; for Samba&#39;&#39;&#39;),<br>
+@@ -155,6 +155,13 @@ Currently the only tested value is &#39;smbtorture,sm=
bd/smbd&#39; for Samba&#39;&#39;&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0help=3D(&quot;Disable use of gettext&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0action=3D&quot;store_true&quot;, dest=3D&#39;disable_gettext&#39;, defau=
lt=3DFalse)<br>
<br>
@@ -37,40 +37,60 @@ diff --git a/lib/replace/wscript b/lib/replace/wscript<=
br>
=C2=A0index 9dd9b48..a22ae59 100644<br>
=C2=A0--- a/lib/replace/wscript<br>
=C2=A0+++ b/lib/replace/wscript<br>
-@@ -444,20 +444,21 @@ def configure(conf):<br>
- <br>
+@@ -444,31 +444,32 @@<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 strlcpy_in_bsd =3D False<br>
- <br>
+<br>
=C2=A0-=C2=A0 =C2=A0 # libbsd on some platforms provides strlcpy and strlca=
t<br>
=C2=A0-=C2=A0 =C2=A0 if not conf.CHECK_FUNCS(&#39;strlcpy strlcat&#39;):<br=
>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if conf.CHECK_FUNCS_IN(&#39;strlcpy strl=
cat&#39;, &#39;bsd&#39;, headers=3D&#39;bsd/string.h&#39;,<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checklibc=3DTrue):<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strlcpy_in_bsd =3D True<br=
>
--=C2=A0 =C2=A0 if not conf.CHECK_FUNCS(&#39;getpeereid&#39;):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;getpeereid&#39;, &#3=
9;bsd&#39;, headers=3D&#39;sys/types.h bsd/unistd.h&#39;)<br>
--=C2=A0 =C2=A0 if not conf.CHECK_FUNCS_IN(&#39;setproctitle&#39;, &#39;set=
proctitle&#39;, headers=3D&#39;setproctitle.h&#39;):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;setproctitle&#39;, &=
#39;bsd&#39;, headers=3D&#39;sys/types.h bsd/unistd.h&#39;)<br>
--=C2=A0 =C2=A0 if not conf.CHECK_FUNCS(&#39;setproctitle_init&#39;):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;setproctitle_init&#3=
9;, &#39;bsd&#39;, headers=3D&#39;sys/types.h bsd/unistd.h&#39;)<br>
--<br>
--=C2=A0 =C2=A0 if not conf.CHECK_FUNCS(&#39;closefrom&#39;):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;closefrom&#39;, &#39=
;bsd&#39;, headers=3D&#39;bsd/unistd.h&#39;)<br>
+-=C2=A0 =C2=A0 elif conf.env.enable_fuzzing:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Just to complicate it more, some versions o=
f Honggfuzz have<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # got strlcpy and strlcat in libc, but not in=
 &lt;string.h&gt;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (unless it is there coincidentally, on a BS=
D). Therefore we<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can&#39;t use CHECK_FUNCS alone to decide w=
hether to add the<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # headers to replace.h.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # As this is only known to happen on a fuzzin=
g compiler, we&#39;ll<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # skip the check when not in fuzzing mode.<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_HEADERS(&#39;bsd/string.h&#39;)<br=
>
=C2=A0+=C2=A0 =C2=A0 if Options.options.enable_libbsd:<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # libbsd on some platforms provides strl=
cpy and strlcat<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not conf.CHECK_FUNCS(&#39;strlcpy str=
lcat&#39;):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if conf.CHECK_FUNCS_IN(&#3=
9;strlcpy strlcat&#39;, &#39;bsd&#39;, headers=3D&#39;bsd/string.h&#39;,<br=
>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checklibc=3DTrue=
):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strlcpy_in_b=
sd =3D True<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif conf.env.enable_fuzzing:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Just to complicate it more, s=
ome versions of Honggfuzz have<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # got strlcpy and strlcat in li=
bc, but not in &lt;string.h&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # (unless it is there coinciden=
tally, on a BSD). Therefore we<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # can&#39;t use CHECK_FUNCS alo=
ne to decide whether to add the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # headers to replace.h.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # As this is only known to happ=
en on a fuzzing compiler, we&#39;ll<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # skip the check when not in fu=
zzing mode.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_HEADERS(&#39;bsd/str=
ing.h&#39;)<br>
+<br>
+-=C2=A0 =C2=A0 if not conf.CHECK_FUNCS(&#39;getpeereid&#39;):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;getpeereid&#39;, &#3=
9;bsd&#39;, headers=3D&#39;sys/types.h bsd/unistd.h&#39;)<br>
+-=C2=A0 =C2=A0 if not conf.CHECK_FUNCS_IN(&#39;setproctitle&#39;, &#39;set=
proctitle&#39;, headers=3D&#39;setproctitle.h&#39;):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;setproctitle&#39;, &=
#39;bsd&#39;, headers=3D&#39;sys/types.h bsd/unistd.h&#39;)<br>
+-=C2=A0 =C2=A0 if not conf.CHECK_FUNCS(&#39;setproctitle_init&#39;):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;setproctitle_init&#3=
9;, &#39;bsd&#39;, headers=3D&#39;sys/types.h bsd/unistd.h&#39;)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not conf.CHECK_FUNCS(&#39;getpeereid&=
#39;):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;g=
etpeereid&#39;, &#39;bsd&#39;, headers=3D&#39;sys/types.h bsd/unistd.h&#39;=
)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not conf.CHECK_FUNCS_IN(&#39;setproct=
itle&#39;, &#39;setproctitle&#39;, headers=3D&#39;setproctitle.h&#39;):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;s=
etproctitle&#39;, &#39;bsd&#39;, headers=3D&#39;sys/types.h bsd/unistd.h&#3=
9;)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not conf.CHECK_FUNCS(&#39;setproctitl=
e_init&#39;):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;s=
etproctitle_init&#39;, &#39;bsd&#39;, headers=3D&#39;sys/types.h bsd/unistd=
.h&#39;)<br>
-+<br>
+<br>
+-=C2=A0 =C2=A0 if not conf.CHECK_FUNCS(&#39;closefrom&#39;):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;closefrom&#39;, &#39=
;bsd&#39;, headers=3D&#39;bsd/unistd.h&#39;)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not conf.CHECK_FUNCS(&#39;closefrom&#=
39;):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf.CHECK_FUNCS_IN(&#39;c=
losefrom&#39;, &#39;bsd&#39;, headers=3D&#39;bsd/unistd.h&#39;)<br>
- <br>
+<br>
=C2=A0 =C2=A0 =C2=A0 conf.CHECK_CODE(&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ucred=
 cred;<br>
=C2=A0diff --git a/lib/texpect/wscript b/lib/texpect/wscript<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/0004-lib-repl=
ace-Remove-memset_s.patch b/meta-networking/recipes-connectivity/samba/samb=
a/0004-lib-replace-Remove-memset_s.patch<br>
index 409c36da7c..6e01ae35e7 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Rem=
ove-memset_s.patch<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Rem=
ove-memset_s.patch<br>
@@ -24,7 +24,7 @@ diff --git a/lib/replace/README b/lib/replace/README<br>
=C2=A0index bb9d008..d8431e7 100644<br>
=C2=A0--- a/lib/replace/README<br>
=C2=A0+++ b/lib/replace/README<br>
-@@ -74,7 +74,6 @@ realpath<br>
+@@ -73,7 +73,6 @@ realpath<br>
=C2=A0 poll<br>
=C2=A0 setproctitle<br>
=C2=A0 memset_explicit<br>
@@ -36,219 +36,10 @@ diff --git a/lib/replace/replace.c b/lib/replace/repla=
ce.c<br>
=C2=A0index 8615899..a419837 100644<br>
=C2=A0--- a/lib/replace/replace.c<br>
=C2=A0+++ b/lib/replace/replace.c<br>
-@@ -1,4 +1,4 @@<br>
--/* <br>
-+/*<br>
-=C2=A0 =C2=A0 Unix SMB/CIFS implementation.<br>
-=C2=A0 =C2=A0 replacement routines for broken systems<br>
-=C2=A0 =C2=A0 Copyright (C) Andrew Tridgell 1992-1998<br>
-@@ -8,7 +8,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 ** NOTE! The following LGPL license applies to the re=
place<br>
-=C2=A0 =C2=A0 =C2=A0 ** library. This does NOT imply that all of Samba is =
released<br>
-=C2=A0 =C2=A0 =C2=A0 ** under the LGPL<br>
--=C2=A0 =C2=A0<br>
-+<br>
-=C2=A0 =C2=A0 This library is free software; you can redistribute it and/o=
r<br>
-=C2=A0 =C2=A0 modify it under the terms of the GNU Lesser General Public<b=
r>
-=C2=A0 =C2=A0 License as published by the Free Software Foundation; either=
<br>
-@@ -91,7 +91,7 @@ size_t rep_strlcpy(char *d, const char *s, size_t bufsiz=
e)<br>
- #endif<br>
- <br>
- #ifndef HAVE_STRLCAT<br>
--/* like strncat but does not 0 fill the buffer and always null <br>
-+/* like strncat but does not 0 fill the buffer and always null<br>
-=C2=A0 =C2=A0 terminates. bufsize is the length of the buffer, which shoul=
d<br>
-=C2=A0 =C2=A0 be one more than the maximum resulting string length */<br>
- size_t rep_strlcat(char *d, const char *s, size_t bufsize)<br>
-@@ -116,7 +116,7 @@ size_t rep_strlcat(char *d, const char *s, size_t bufs=
ize)<br>
- <br>
- #ifndef HAVE_MKTIME<br>
- /*******************************************************************<br>
--a mktime() replacement for those who don&#39;t have it - contributed by <=
br>
-+a mktime() replacement for those who don&#39;t have it - contributed by<b=
r>
- C.A. Lademann &lt;<a href=3D"mailto:cal@zls.com" target=3D"_blank">cal@zl=
s.com</a>&gt;<br>
- Corrections by <a href=3D"mailto:richard.kettlewell@kewill.com" target=3D=
"_blank">richard.kettlewell@kewill.com</a><br>
- ********************************************************************/<br>
-@@ -137,7 +137,7 @@ time_t rep_mktime(struct tm *t)<br>
-=C2=A0 =C2=A0 =C2=A0return((time_t)-1);<br>
- <br>
-=C2=A0 =C2=A0n =3D t-&gt;tm_year + 1900 - 1;<br>
--=C2=A0 epoch =3D (t-&gt;tm_year - 70) * YEAR + <br>
-+=C2=A0 epoch =3D (t-&gt;tm_year - 70) * YEAR +<br>
-=C2=A0 =C2=A0 =C2=A0((n / 4 - n / 100 + n / 400) - (1969 / 4 - 1969 / 100 =
+ 1969 / 400)) * DAY;<br>
- <br>
-=C2=A0 =C2=A0y =3D t-&gt;tm_year + 1900;<br>
-@@ -147,7 +147,7 @@ time_t rep_mktime(struct tm *t)<br>
-=C2=A0 =C2=A0 =C2=A0epoch +=3D mon [m] * DAY;<br>
-=C2=A0 =C2=A0 =C2=A0if(m =3D=3D 1 &amp;&amp; y % 4 =3D=3D 0 &amp;&amp; (y =
% 100 !=3D 0 || y % 400 =3D=3D 0))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0epoch +=3D DAY;<br>
--=C2=A0 =C2=A0 <br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0if(++m &gt; 11) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0m =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0y++;<br>
-@@ -156,7 +156,7 @@ time_t rep_mktime(struct tm *t)<br>
- <br>
-=C2=A0 =C2=A0epoch +=3D (t-&gt;tm_mday - 1) * DAY;<br>
-=C2=A0 =C2=A0epoch +=3D t-&gt;tm_hour * HOUR + t-&gt;tm_min * MINUTE + t-&=
gt;tm_sec;<br>
--=C2=A0 <br>
-+<br>
-=C2=A0 =C2=A0if((u =3D localtime(&amp;epoch)) !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0t-&gt;tm_sec =3D u-&gt;tm_sec;<br>
-=C2=A0 =C2=A0 =C2=A0t-&gt;tm_min =3D u-&gt;tm_min;<br>
-@@ -176,7 +176,7 @@ time_t rep_mktime(struct tm *t)<br>
- <br>
- #ifndef HAVE_INITGROUPS<br>
- /************************************************************************=
****<br>
-- some systems don&#39;t have an initgroups call <br>
-+ some systems don&#39;t have an initgroups call<br>
- *************************************************************************=
***/<br>
- int rep_initgroups(char *name, gid_t id)<br>
- {<br>
-@@ -194,7 +194,7 @@ int rep_initgroups(char *name, gid_t id)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 i,j;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct group *g;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0*gr;<br>
--=C2=A0 =C2=A0 =C2=A0 <br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if((grouplst =3D malloc(sizeof(gid_t) * max_gr)=
) =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D ENOMEM;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
-@@ -250,9 +250,9 @@ void *rep_memmove(void *dest,const void *src,int size)=
<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (d &lt; s) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* we can forward c=
opy */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-d &gt;=3D sizeof(i=
nt) &amp;&amp; <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(s%sizeof=
(int)) &amp;&amp; <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(d%sizeof=
(int)) &amp;&amp; <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-d &gt;=3D sizeof(i=
nt) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(s%sizeof=
(int)) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(d%sizeof=
(int)) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!(siz=
e%sizeof(int))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* do it all as words */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int *idest =3D (int *)dest;<br>
-@@ -267,9 +267,9 @@ void *rep_memmove(void *dest,const void *src,int size)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* must backward co=
py */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d-s &gt;=3D sizeof(i=
nt) &amp;&amp; <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(s%sizeof=
(int)) &amp;&amp; <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(d%sizeof=
(int)) &amp;&amp; <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d-s &gt;=3D sizeof(i=
nt) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(s%sizeof=
(int)) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(d%sizeof=
(int)) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!(siz=
e%sizeof(int))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* do it all as words */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int *idest =3D (int *)dest;<br>
-@@ -281,7 +281,7 @@ void *rep_memmove(void *dest,const void *src,int size)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0char *cdest =3D (char *)dest;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0char *csrc =3D (char *)src;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0for (i=3Dsize-1;i&gt;=3D0;i--) cdest[i] =3D csrc[i];<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 <b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return(dest);<br>
- }<br>
-@@ -334,16 +334,16 @@ void rep_vsyslog (int facility_priority, const char =
*format, va_list arglist)<br>
-=C2=A0 size_t rep_strnlen(const char *s, size_t max)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
--=C2=A0 <br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (len =3D 0; len &lt; max; len++) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s[len] =
=3D=3D &#39;\0&#39;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return len;=C2=A0 <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return len;<br>
+@@ -965,37 +965,6 @@<br>
=C2=A0 }<br>
=C2=A0 #endif<br>
--=C2=A0 <br>
-+<br>
- #ifndef HAVE_STRNDUP<br>
- /**<br>
-=C2=A0 Some platforms don&#39;t have strndup.<br>
-@@ -351,7 +351,7 @@ void rep_vsyslog (int facility_priority, const char *f=
ormat, va_list arglist)<br>
- char *rep_strndup(const char *s, size_t n)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *ret;<br>
--=C2=A0 =C2=A0 =C2=A0 <br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D strnlen(s, n);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D malloc(n+1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ret)<br>
-@@ -407,7 +407,7 @@ int rep_chroot(const char *dname)<br>
- <br>
- /*****************************************************************<br>
-=C2=A0 Possibly replace mkstemp if it is broken.<br>
--*****************************************************************/=C2=A0 =
<br>
-+*****************************************************************/<br>
- <br>
- #ifndef HAVE_SECURE_MKSTEMP<br>
- int rep_mkstemp(char *template)<br>
-@@ -425,7 +425,7 @@ int rep_mkstemp(char *template)<br>
- char *rep_mkdtemp(char *template)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *dname;<br>
--=C2=A0 =C2=A0 =C2=A0 <br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((dname =3D mktemp(template))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mkdir(dname, 07=
00) &gt;=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return dname;<br>
-@@ -532,7 +532,7 @@ long long int rep_strtoll(const char *str, char **endp=
tr, int base)<br>
- {<br>
- #ifdef HAVE_STRTOQ<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return strtoq(str, endptr, base);<br>
--#elif defined(HAVE___STRTOLL) <br>
-+#elif defined(HAVE___STRTOLL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return __strtoll(str, endptr, base);<br>
- #elif SIZEOF_LONG =3D=3D SIZEOF_LONG_LONG<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return (long long int) strtol(str, endptr, base=
);<br>
-@@ -568,7 +568,7 @@ unsigned long long int rep_strtoull(const char *str, c=
har **endptr, int base)<br>
- {<br>
- #ifdef HAVE_STRTOUQ<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return strtouq(str, endptr, base);<br>
--#elif defined(HAVE___STRTOULL) <br>
-+#elif defined(HAVE___STRTOULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return __strtoull(str, endptr, base);<br>
- #elif SIZEOF_LONG =3D=3D SIZEOF_LONG_LONG<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return (unsigned long long int) strtoul(str, en=
dptr, base);<br>
-@@ -599,7 +599,7 @@ unsigned long long int rep_strtoull(const char *str, c=
har **endptr, int base)<br>
- #endif /* HAVE_STRTOULL */<br>
- <br>
- #ifndef HAVE_SETENV<br>
--int rep_setenv(const char *name, const char *value, int overwrite) <br>
-+int rep_setenv(const char *name, const char *value, int overwrite)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *p;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t l1, l2;<br>
-@@ -644,10 +644,10 @@ int rep_unsetenv(const char *name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i=3D0;environ[i];i++) /* noop */ ;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0count=3Di;<br>
--=C2=A0 =C2=A0 =C2=A0 <br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i=3D0;i&lt;count;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strncmp(environ=
[i], name, len) =3D=3D 0 &amp;&amp; environ[i][len] =3D=3D &#39;=3D&#39;) {=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* note: we do _not_ free the old variable here. It is unsafe to <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* note: we do _not_ free the old variable here. It is unsafe to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 do so, as the pointer may not have come from malloc */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0memmove(&amp;environ[i], &amp;environ[i+1], (count-i)*sizeof(char=
 *));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0count--;<br>
-@@ -688,7 +688,7 @@ int rep_utimes(const char *filename, const struct time=
val tv[2])<br>
- #endif<br>
- <br>
- #ifndef HAVE_DUP2<br>
--int rep_dup2(int oldfd, int newfd) <br>
-+int rep_dup2(int oldfd, int newfd)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D ENOSYS;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
-@@ -965,37 +965,6 @@ void *rep_memset_explicit(void *block, int c, size_t =
size)<br>
- }<br>
- #endif<br>
- <br>
+<br>
=C2=A0-#ifndef HAVE_MEMSET_S<br>
=C2=A0-# ifndef RSIZE_MAX<br>
=C2=A0-#=C2=A0 define RSIZE_MAX (SIZE_MAX &gt;&gt; 1)<br>
@@ -267,7 +58,7 @@ index 8615899..a419837 100644<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0-<br>
=C2=A0-#if defined(HAVE_MEMSET_EXPLICIT)<br>
--=C2=A0 =C2=A0 =C2=A0 memset_explicit(dest, destsz, ch, count);<br>
+-=C2=A0 =C2=A0 =C2=A0 memset_explicit(dest, ch, count);<br>
=C2=A0-#else /* HAVE_MEMSET_EXPLICIT */<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 memset(dest, ch, count);<br>
=C2=A0-# if defined(HAVE_GCC_VOLATILE_MEMORY_PROTECTION)<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/9aa5c43315d83=
c19514251a11c4fba5a137f2821.patch b/meta-networking/recipes-connectivity/sa=
mba/samba/9aa5c43315d83c19514251a11c4fba5a137f2821.patch<br>
deleted file mode 100644<br>
index e07e86e887..0000000000<br>
--- a/meta-networking/recipes-connectivity/samba/samba/9aa5c43315d83c195142=
51a11c4fba5a137f2821.patch<br>
+++ /dev/null<br>
@@ -1,70 +0,0 @@<br>
-From 9aa5c43315d83c19514251a11c4fba5a137f2821 Mon Sep 17 00:00:00 2001<br>
-From: Andreas Schneider &lt;<a href=3D"mailto:asn@samba.org" target=3D"_bl=
ank">asn@samba.org</a>&gt;<br>
-Date: Tue, 21 Jan 2025 17:59:27 +0100<br>
-Subject: [PATCH] lib:replace: Don&#39;t use deprecated readline CPPFunctio=
n cast<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-HAVE_RL_COMPLETION_FUNC_T was unused and not checking for the right<br>
-function.<br>
-<br>
-libcli/smbreadline/smbreadline.c: In function =E2=80=98smb_readline=E2=80=
=99:<br>
-libcli/smbreadline/smbreadline.c:139:17: warning: =E2=80=98CPPFunction=E2=
=80=99 is deprecated [-Wdeprecated-declarations]<br>
-=C2=A0 139 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
rl_attempted_completion_function =3D RL_COMPLETION_CAST completion_fn;<br>
-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
-libcli/smbreadline/smbreadline.c:139:50: error: assignment to =E2=80=98cha=
r ** (*)(const char *, int,=C2=A0 int)=E2=80=99 from incompatible pointer t=
ype =E2=80=98char ** (*)(void)=E2=80=99 [-Wincompatible-pointer-types]<br>
-=C2=A0 139 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
rl_attempted_completion_function =3D RL_COMPLETION_CAST completion_fn;<br>
-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
-<br>
-BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15788" rel=3D=
"noreferrer" target=3D"_blank">https://bugzilla.samba.org/show_bug.cgi?id=
=3D15788</a><br>
-<br>
-Signed-off-by: Andreas Schneider &lt;<a href=3D"mailto:asn@samba.org" targ=
et=3D"_blank">asn@samba.org</a>&gt;<br>
-Reviewed-by: Alexander Bokovoy &lt;<a href=3D"mailto:ab@samba.org" target=
=3D"_blank">ab@samba.org</a>&gt;<br>
-<br>
-Autobuild-User(master): Andreas Schneider &lt;<a href=3D"mailto:asn@crypto=
milk.org" target=3D"_blank">asn@cryptomilk.org</a>&gt;<br>
-Autobuild-Date(master): Tue Jan 21 19:38:37 UTC 2025 on atb-devel-224<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/9aa5c43315d83c19514251a11c4fba5a137f2821" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/samba-team/samba/commit/9aa5c43315d83c195142=
51a11c4fba5a137f2821</a>]<br>
-<br>
-Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
----<br>
- lib/replace/system/readline.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +++-<br>
- libcli/smbreadline/wscript_configure | 8 +++++---<br>
- 2 files changed, 8 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/lib/replace/system/readline.h b/lib/replace/system/readline.h=
<br>
-index 9a9af266ca6d..ac3604fc12e0 100644<br>
---- a/lib/replace/system/readline.h<br>
-+++ b/lib/replace/system/readline.h<br>
-@@ -46,7 +46,9 @@<br>
- #endif<br>
- <br>
- #ifdef HAVE_NEW_LIBREADLINE<br>
--#ifdef HAVE_CPPFUNCTION<br>
-+#if defined(HAVE_RL_COMPLETION_FUNC_T)<br>
-+#=C2=A0 define RL_COMPLETION_CAST (rl_completion_func_t *)<br>
-+#elif defined(HAVE_CPPFUNCTION)<br>
- #=C2=A0 define RL_COMPLETION_CAST (CPPFunction *)<br>
- #elif defined(HAVE_RL_COMPLETION_T)<br>
- #=C2=A0 define RL_COMPLETION_CAST (rl_completion_t *)<br>
-diff --git a/libcli/smbreadline/wscript_configure b/libcli/smbreadline/wsc=
ript_configure<br>
-index 912ff53a150d..f5a401ebae00 100644<br>
---- a/libcli/smbreadline/wscript_configure<br>
-+++ b/libcli/smbreadline/wscript_configure<br>
-@@ -51,10 +51,12 @@ conf.CHECK_CODE(&#39;&#39;&#39;<br>
- #=C2=A0 =C2=A0 endif<br>
- #=C2=A0 endif<br>
- #endif<br>
--int main(void) {rl_completion_t f; return 0;}<br>
-+int main(void) {rl_completion_func_t f; return 0;}<br>
- &#39;&#39;&#39;,<br>
--&#39;HAVE_RL_COMPLETION_FUNC_T&#39;, execute=3DFalse, addmain=3DFalse,<br=
>
--msg=3D&#39;Checking for rl_completion_t&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;HAVE_RL_COMP=
LETION_FUNC_T&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execute=3DFalse,<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addmain=3DFalse,<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg=3D&#39;Checki=
ng for rl_completion_func_t&#39;)<br>
- <br>
- conf.CHECK_CODE(&#39;&#39;&#39;<br>
- #ifdef HAVE_READLINE_READLINE_H<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/use-xslt-repl=
ace-function-when-available.patch b/meta-networking/recipes-connectivity/sa=
mba/samba/use-xslt-replace-function-when-available.patch<br>
new file mode 100644<br>
index 0000000000..c8cd7f37a8<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/use-xslt-replace-fun=
ction-when-available.patch<br>
@@ -0,0 +1,51 @@<br>
+From: Peter De Wachter &lt;<a href=3D"mailto:pdewacht@gmail.com" target=3D=
"_blank">pdewacht@gmail.com</a>&gt;<br>
+Date: Tue, 2 Jun 2020 09:10:39 -0400<br>
+Subject: use EXSLT &quot;replace&quot; function when available<br>
+<br>
+A recursive implementation=C2=A0 of string.subst is problematic,<br>
+long strings with many matches will cause stack overflows.<br>
+<br>
+Bug-Debian: <a href=3D"https://bugs.debian.org/750593" rel=3D"noreferrer" =
target=3D"_blank">https://bugs.debian.org/750593</a><br>
+<br>
+OE comment:<br>
+This fixes samba build error:<br>
+xsltApplySequenceConstructor: A potential infinite template recursion was =
detected<br>
+<br>
+The patch changes xslt-styleshets in native sysroot. It comes from Debian,=
<br>
+but used by other distros also, for example Fedora.<br>
+<br>
+Looking at the history, it seems that the patch was upstreamed in 2018,<br=
>
+but upstream hasn&#39;t created a stable tag since 2016.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/docbook/xslt10-st=
ylesheets/commit/1c41ae5ae3d4816687467712580d5f05957b3b88" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/docbook/xslt10-stylesheets/commit/1=
c41ae5ae3d4816687467712580d5f05957b3b88</a>]<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+---<br>
+ docbook-xsl/lib/lib.xsl | 9 ++++++++-<br>
+ 1 file changed, 8 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/docbook-xsl/lib/lib.xsl b/docbook-xsl/lib/lib.xsl<br>
+index e65776a..bc45cd8 100644<br>
+--- a/docbook-xsl/lib/lib.xsl<br>
++++ b/docbook-xsl/lib/lib.xsl<br>
+@@ -10,7 +10,10 @@<br>
+=C2=A0 =C2=A0 =C2=A0 This module implements DTD-independent functions<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 *****************************************************=
*************** --&gt;<br>
+-&lt;xsl:stylesheet xmlns:xsl=3D&quot;<a href=3D"http://www.w3.org/1999/XS=
L/Transform" rel=3D"noreferrer" target=3D"_blank">http://www.w3.org/1999/XS=
L/Transform</a>&quot; version=3D&quot;1.0&quot;&gt;<br>
++&lt;xsl:stylesheet xmlns:xsl=3D&quot;<a href=3D"http://www.w3.org/1999/XS=
L/Transform" rel=3D"noreferrer" target=3D"_blank">http://www.w3.org/1999/XS=
L/Transform</a>&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlns:str=3D&quot=
;<a href=3D"http://exslt.org/strings" rel=3D"noreferrer" target=3D"_blank">=
http://exslt.org/strings</a>&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exclude-result-pr=
efixes=3D&quot;str&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version=3D&quot;1=
.0&quot;&gt;<br>
+ <br>
+ &lt;xsl:template name=3D&quot;dot.count&quot;&gt;<br>
+=C2=A0 =C2=A0&lt;!-- Returns the number of &quot;.&quot; characters in a s=
tring --&gt;<br>
+@@ -56,6 +59,9 @@<br>
+=C2=A0 =C2=A0&lt;xsl:param name=3D&quot;replacement&quot;/&gt;<br>
+ <br>
+=C2=A0 =C2=A0&lt;xsl:choose&gt;<br>
++=C2=A0 =C2=A0 &lt;xsl:when test=3D&quot;function-available(&#39;str:repla=
ce&#39;)&quot;&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 &lt;xsl:value-of select=3D&quot;str:replace($string,=
 string($target), string($replacement))&quot;/&gt;<br>
++=C2=A0 =C2=A0 &lt;/xsl:when&gt;<br>
+=C2=A0 =C2=A0 =C2=A0&lt;xsl:when test=3D&quot;contains($string, $target)&q=
uot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;xsl:variable name=3D&quot;rest&quot;&gt;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;xsl:call-template name=3D&quot;strin=
g.subst&quot;&gt;<br>
diff --git a/meta-networking/recipes-connectivity/samba/<a href=3D"http://s=
amba_4.19.9.bb" rel=3D"noreferrer" target=3D"_blank">samba_4.19.9.bb</a> b/=
meta-networking/recipes-connectivity/samba/<a href=3D"http://samba_4.23.5.b=
b" rel=3D"noreferrer" target=3D"_blank">samba_4.23.5.bb</a><br>
similarity index 88%<br>
rename from meta-networking/recipes-connectivity/samba/<a href=3D"http://sa=
mba_4.19.9.bb" rel=3D"noreferrer" target=3D"_blank">samba_4.19.9.bb</a><br>
rename to meta-networking/recipes-connectivity/samba/<a href=3D"http://samb=
a_4.23.5.bb" rel=3D"noreferrer" target=3D"_blank">samba_4.23.5.bb</a><br>
index 3ed1d46754..a84b20f564 100644<br>
--- a/meta-networking/recipes-connectivity/samba/<a href=3D"http://samba_4.=
19.9.bb" rel=3D"noreferrer" target=3D"_blank">samba_4.19.9.bb</a><br>
+++ b/meta-networking/recipes-connectivity/samba/<a href=3D"http://samba_4.=
23.5.bb" rel=3D"noreferrer" target=3D"_blank">samba_4.23.5.bb</a><br>
@@ -14,6 +14,10 @@ ${SAMBA_MIRROR}=C2=A0 =C2=A0 <a href=3D"http://www.mirro=
rservice.org/sites/ftp.samba.org" rel=3D"noreferrer" target=3D"_blank">http=
://www.mirrorservice.org/sites/ftp.samba.org</a> \n \<br>
<br>
=C2=A0export PYTHONHASHSEED =3D &quot;1&quot;<br>
<br>
+# If XML_CATALOG_FILES env var is not defined, waf defaults<br>
+# to build host folders looking for catalogs.<br>
+export XML_CATALOG_FILES =3D &quot;&quot;<br>
+<br>
=C2=A0SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://smb.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://volatiles.03_samba \<br>
@@ -24,11 +28,11 @@ SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-${PV}.ta=
r.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-Fix-pyext_PATTERN-for=
-cross-compilation.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-smbtorture-skip-test-=
case-tfork_cmd_send.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-Deleted-settiong-of-p=
ython-to-fix-the-install-confli.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://9aa5c43315d83c19514251a11c=
4fba5a137f2821.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-lib-replace-Implement=
-memset_explicit.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-lib-replace-Add-test-=
for-memset_explicit.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Replace-memset_s-with=
-memset_explicit.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-lib-replace-Remove-me=
mset_s.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use-xslt-replace-function-=
when-available.patch;rev=3Dneed-to-be-applied-manually \<br></blockquote><d=
iv><br></div><div>use apply=3Dno if you want patch to be created in build a=
rea but not applied.</div><div>however, this patch should be applied to oe-=
core docbook-xsl-stylesheets recipe</div><div>the recipe should perhaps als=
o swtich to using <a href=3D"https://github.com/docbook/xslt10-stylesheets"=
>https://github.com/docbook/xslt10-stylesheets</a></div><div>=C2=A0for sour=
ces as there seems to be newer releases there 1.79.1 was released in 2015</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI:append:libc-musl =3D &quot; \<br>
@@ -36,7 +40,7 @@ SRC_URI:append:libc-musl =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://samba-4.3.9-remove-getpwen=
t_r.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;71ed406444714c90bb9d36c576d807b67af15449f297e=
91106d42b3ca2fa5549&quot;<br>
+SRC_URI[sha256sum] =3D &quot;593a43ddd0d57902237dfa76888f7b02cb7fc77471113=
69cb31e126db4836b9f&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;samba\-(?P&lt;pver&gt;4\.19(\.\d+)+).t=
ar.gz&quot;<br>
<br>
@@ -47,7 +51,7 @@ CVE_STATUS[CVE-2011-2411] =3D &quot;not-applicable-platfo=
rm: vulnerable only on HP NonS<br>
=C2=A0# remove default added RDEPENDS on perl<br>
=C2=A0RDEPENDS:${PN}:remove =3D &quot;perl&quot;<br>
<br>
-DEPENDS +=3D &quot;readline virtual/libiconv zlib popt libtalloc libtdb li=
btevent libldb libaio libpam libtasn1 libtasn1-native jansson libparse-yapp=
-perl-native gnutls cmocka&quot;<br>
+DEPENDS +=3D &quot;readline virtual/libiconv zlib popt libtalloc libtdb li=
btevent libaio libpam libtasn1 libtasn1-native jansson libparse-yapp-perl-n=
ative gnutls cmocka ngtcp2 bison-native&quot;<br>
<br>
=C2=A0inherit features_check<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;pam&quot;<br>
@@ -62,7 +66,7 @@ INITSCRIPT_NAME =3D &quot;samba&quot;<br>
=C2=A0INITSCRIPT_PARAMS =3D &quot;start 20 3 5 . stop 20 0 1 6 .&quot;<br>
<br>
=C2=A0SYSTEMD_PACKAGES =3D &quot;${PN}-base ${PN}-ad-dc winbind ctdb&quot;<=
br>
-SYSTEMD_SERVICE:${PN}-base =3D &quot;nmb.service smb.service&quot;<br>
+SYSTEMD_SERVICE:${PN}-base =3D &quot;nmb.service smb.service samba-bgqd.se=
rvice&quot;<br>
=C2=A0SYSTEMD_SERVICE:${PN}-ad-dc =3D &quot;${@bb.utils.contains(&#39;PACKA=
GECONFIG&#39;, &#39;ad-dc&#39;, &#39;samba.service&#39;, &#39;&#39;, d)}&qu=
ot;<br>
=C2=A0SYSTEMD_SERVICE:winbind =3D &quot;winbind.service&quot;<br>
=C2=A0SYSTEMD_SERVICE:ctdb =3D &quot;ctdb.service&quot;<br>
@@ -109,7 +113,7 @@ SAMBA4_MODULES =3D &quot;${SAMBA4_IDMAP_MODULES},${SAMB=
A4_PDB_MODULES},${SAMBA4_AUTH_MO<br>
=C2=A0# .so files so there will not be a conflict.=C2=A0 This is not done c=
onsistantly, so be very careful<br>
=C2=A0# when adding to this list.<br>
=C2=A0#<br>
-SAMBA4_LIBS =3D &quot;heimdal,NONE&quot;<br>
+SAMBA4_LIBS =3D &quot;heimdal,libquic,NONE&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--enable-fhs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-piddi=
r=3D/run \<br>
@@ -132,6 +136,24 @@ EXTRA_OECONF +=3D &quot;--enable-fhs \<br>
<br>
=C2=A0LDFLAGS +=3D &quot;-Wl,-z,relro,-z,now&quot;<br>
<br>
+do_configure:prepend() {<br>
+=C2=A0 =C2=A0 # The xsltproc tool is actually a wrapper script in OE, whic=
h exports its own XML_CATALOG_FILES env var<br>
+=C2=A0 =C2=A0 # However samba does that too. So here I&#39;m trying to con=
catenate the variables.<br>
+=C2=A0 =C2=A0 # The original looks like this in the wrapper:<br>
+=C2=A0 =C2=A0 # export XML_CATALOG_FILES=3Doe-core-specific-thing<br>
+=C2=A0 =C2=A0 # and this sed prepends the value with $XML_CATALOG_FILES, a=
nd encloses it in quotes. So the end value is<br>
+=C2=A0 =C2=A0 # export XML_CATALOG_FILES=3D&quot;$XML_CATALOG FILES oe-cor=
e-specific-thing&quot;<br>
+=C2=A0 =C2=A0 # The first grep just checks if it was already done, so it i=
s not prepended multiple times.<br>
+<br>
+=C2=A0 =C2=A0 grep \$XML_CATALOG_FILES ${STAGING_BINDIR_NATIVE}/xsltproc |=
| \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,\(XML_CATALOG_FILES\)=3D\(.*\),\=
1=3D&quot;\$XML_CATALOG_FILES \2&quot;,&#39; ${STAGING_BINDIR_NATIVE}/xsltp=
roc<br>
+<br>
+=C2=A0 =C2=A0 # This patch modifies xslt-stylesheets in sysroot. Version i=
s hardcoded in the path - when it fails, that should be an<br>
+=C2=A0 =C2=A0 # indicator that a new version is available, which contains =
this patch<br>
+=C2=A0 =C2=A0 grep exslt ${STAGING_DATADIR_NATIVE}/xml/docbook/xsl-stylesh=
eets-1.79.1/lib/lib.xsl || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch -p 3 -d ${STAGING_DATADIR_NATIVE}/xml/do=
cbook/xsl-stylesheets-1.79.1/lib &lt; ${UNPACKDIR}/use-xslt-replace-functio=
n-when-available.patch<br>
+}<br>
+<br>
=C2=A0do_configure:append() {<br>
=C2=A0 =C2=A0 =C2=A0cd ${S}/pidl/<br>
=C2=A0 =C2=A0 =C2=A0perl Makefile.PL PREFIX=3D${prefix}<br>
@@ -213,6 +235,9 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0find ${D}${libdir}/perl5/ -type f -name &quot;perllocal=
.pod&quot; -delete<br>
=C2=A0 =C2=A0 =C2=A0find ${D}${libdir}/perl5/ -type f -name &quot;.packlist=
&quot; -delete<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;1s,#!.*perl,#!${bindir}/env perl,&#39; $=
{D}${bindir}/pidl<br>
+<br>
+=C2=A0 =C2=A0 sed -i &#39;s,${UNPACKDIR},,g&#39; ${S}/bin/default/libcli/w=
sp/wsp_aqs_lexer.c<br>
+=C2=A0 =C2=A0 sed -i &#39;s,${UNPACKDIR},,g&#39; ${S}/bin/default/libcli/w=
sp/wsp_aqs_lexer.h<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-python3 ${PN}-pidl \<br>
@@ -245,7 +270,7 @@ PACKAGESPLITFUNCS:prepend =3D &quot;samba_populate_pack=
ages &quot;<br>
=C2=A0PACKAGES_DYNAMIC =3D &quot;samba-auth-.* samba-pdb-.*&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;${PN}-base ${PN}-python3 ${PN}-dsdb-modules=
 python3&quot;<br>
-RDEPENDS:${PN}-python3 +=3D &quot;pytalloc python3-tdb pyldb&quot;<br>
+RDEPENDS:${PN}-python3 +=3D &quot;pytalloc python3-tdb&quot;<br>
<br>
=C2=A0FILES:${PN}-base =3D &quot;${sbindir}/nmbd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${sbindir}/smbd \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125422): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125422" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125422</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118414326/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118414326/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001c4280064d75d1d3--


Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.7173.1622124480840980264
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 07:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k7XonjkT;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: nishaparrakat@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id h15so366939ilr.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 07:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fncypgDrTP8T+5KBf9oneFEDsabibl4CA4oRwo5V3Ag=;
        b=k7XonjkTBqA5lqrygbxGgzO/phzMMx6Lp63nRPLljUUzUgInMPJ56y+n2BXCK5caIg
         fKc+ZXBFiQIiHmrlke0X62z8NrysF0JI33ZK7kyGsVk2KPtvd/5gPAZdFvX+lJaORbRi
         qMFIJpWkTAPI3lcl/q3J6il0eqhNAUdCC4BREMBIfE+jZvKHeUuJi2Qpiatg5HTrQ/gQ
         +87l38GJ+h5AZUHrhrtfhMan2bUpknepA5Q3joMLwEDRJY02KXBZSi9yWzzmuUydu2nM
         RaoO4CZe6vGvDlsBzpIHFZZtH+h26JQi04nKXsk1xq+87HL95x62bE6OtNpPc2GnNx5g
         qlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fncypgDrTP8T+5KBf9oneFEDsabibl4CA4oRwo5V3Ag=;
        b=OrpPNt3RYAMeoY3jCT3Qrc+OoHYCTgF9pmDMuXyt0whzKN94esxJCwDwhoMxO8pJKn
         4toe1x9a/NFWRjYk0tJKN70VO+cyGniynCevtECPp/aHDS+fw/WTMatJ9RRk0QFC+deI
         sPmYj9ThYv0xAnkQYM3PTYiKFkmQzbM/rqhAAyUyLJ3+7P3rusJiKeoebI4E1e0yRK81
         yDEY2iyn8jWLb0+QhrFKwTuBdj+gGezzgFoIy3vJkzC/4P/JqSO8jaqfa5HojttjgW4l
         FLeskjxwYq0il4zIc8EEa8q0AbhXBBfAzuI0LHgM3EDinHyU0JvN8z/bKbEzsAgn7l9s
         Lbtw==
X-Gm-Message-State: AOAM5331fE0VZWEyJ5q/miOuc0Blrd2zDqBGIq7eTF4q2nvNUs9cyxum
	PATcYUVKUEIFTqj00fzMQrHTKsWsWEJ1cT9hGI0=
X-Google-Smtp-Source: ABdhPJysOGJf+K6AAic+PJxCkuar8uahnQe9FElqCPPJH9Qt49inEfcFwPQaIhNdLoL2+T3dTnqo2Bu/pitQX+Fq8DQ=
X-Received: by 2002:a92:2a0a:: with SMTP id r10mr3191771ile.274.1622124479405;
 Thu, 27 May 2021 07:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210526195929.26047-1-nishaparrakat@gmail.com>
 <20210526195929.26047-2-nishaparrakat@gmail.com> <CAMKF1soaWc2yFmD5POtF_+t86wAxYVe3oXUoLAKTuDd36Qp4NA@mail.gmail.com>
 <CAMR+PikT9n4i6jOw1B-JPaUkzOQtyQX5O8UKPN708wsqipWj-g@mail.gmail.com> <CAMKF1soM8WszZxDh0vQVgs8uZhb1QdhSHEV4n=ga_yNFRcRpcw@mail.gmail.com>
In-Reply-To: <CAMKF1soM8WszZxDh0vQVgs8uZhb1QdhSHEV4n=ga_yNFRcRpcw@mail.gmail.com>
From: "Nisha Parrakat" <nishaparrakat@gmail.com>
Date: Thu, 27 May 2021 16:07:47 +0200
Message-ID: <CAMR+Pin9WdH4_+3MjSj0WE8D=81pw3A41g74OtRfDOV66m-77A@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH 2/2] android-tools: upgrade android-tools to latest debian 10.0.0.r36
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Nisha Parrakat <Nisha.Parrakat@kpit.com>
Content-Type: multipart/alternative; boundary="00000000000060626605c350498d"

--00000000000060626605c350498d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I thought about it but then that requires me to go and change in the
android-tools code.
Let me try to see how trivial is that. Else we can get the recipe to
meta-clang and add selinux as dynamic layers there.

regards
Nisha P

Am Do., 27. Mai 2021 um 16:02 Uhr schrieb Khem Raj <raj.khem@gmail.com>:

> On Thu, May 27, 2021 at 12:18 AM Nisha Parrakat <nishaparrakat@gmail.com>
> wrote:
> >
> > HI Khem,
> > This particular patch will need meta-clang and meta-selinux.
> > Where can I find the documentation to use dynamic-layers and include
> such cases where we need multple layers for a recipe ?
> >
>
> we already use it in meta-oe for single layer meta-oe/dynamic-layers e,g
> but if its multiple layers then it is going to be complex. Is it
> possible to turn selinux into  a packageconfig ?
>
> > regards
> > Nisha P
> >
> > Am Do., 27. Mai 2021 um 06:15 Uhr schrieb Khem Raj <raj.khem@gmail.com>=
:
> >>
> >> I am seeing
> >>
> >> Parsing recipes...ERROR: ParseError at
> >>
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-devtools/android-tools/
> android-tools_10.0.0.r36.bb:77:
> >> Could not inherit file classes/clang.bbclass
> >>
> >> this seems to depend on meta-clang, so perhaps it should either use
> >> dynamic-layers or add it to meta-clang itself.
> >>
> >> On Wed, May 26, 2021 at 12:59 PM Nisha Parrakat <
> nishaparrakat@gmail.com> wrote:
> >> >
> >> > upgrade of android-tools to 10.0.0.r36
> >> >
> >> > Delete all the old patches that were applicable for
> >> > old version.
> >> >
> >> > Use all the makefiles that come with the new version
> >> > directly from the source code, just modifying them
> >> > to install output to a specific folder
> >> >
> >> > a)added rules_yocto.mk that will mimic the debian/rules
> >> > b)modified the makefiles of the components to output to
> >> > a common dir.
> >> > c)
> >> > Built boringssl crypto with the option -DOPENSSL_NO_ASM
> >> > to solve the below errors
> >> >
> >> >  libcrypto.so.0: undefined reference to `aes_hw_encrypt'
> >> >  libcrypto.so.0: undefined reference to `aes_hw_set_encrypt_key'
> >> >  libcrypto.so.0: undefined reference to `gcm_gmult_v8'
> >> >  libcrypto.so.0: undefined reference to `gcm_init_v8'
> >> >  libcrypto.so.0: undefined reference to `sha256_block_data_order'
> >> >  libcrypto.so.0: undefined reference to `aes_hw_ctr32_encrypt_blocks=
'
> >> >  libcrypto.so.0: undefined reference to `aes_hw_cbc_encrypt'
> >> >  libcrypto.so.0: undefined reference to `vpaes_decrypt'
> >> >  libcrypto.so.0: undefined reference to `vpaes_encrypt'
> >> >  libcrypto.so.0: undefined reference to `gcm_gmult_neon'
> >> >  libcrypto.so.0: undefined reference to `sha1_block_data_order'
> >> >  libcrypto.so.0: undefined reference to `sha512_block_data_order'
> >> >  libcrypto.so.0: undefined reference to `gcm_init_neon'
> >> >  libcrypto.so.0: undefined reference to `aes_hw_set_decrypt_key'
> >> >  libcrypto.so.0: undefined reference to `vpaes_set_decrypt_key'
> >> >  libcrypto.so.0: undefined reference to `gcm_ghash_neon'
> >> >  libcrypto.so.0: undefined reference to `bn_mul_mont'
> >> >  libcrypto.so.0: undefined reference to `aes_hw_decrypt'
> >> >  libcrypto.so.0: undefined reference to `gcm_ghash_v8'
> >> >  libcrypto.so.0: undefined reference to `vpaes_cbc_encrypt'
> >> >  libcrypto.so.0: undefined reference to `ChaCha20_ctr32'
> >> >  libcrypto.so.0: undefined reference to `vpaes_ctr32_encrypt_blocks'
> >> >  libcrypto.so.0: undefined reference to `vpaes_set_encrypt_key'
> >> >
> >> >  Attention : https://github.com/grpc/grpc/issues/9440
> >> >
> >> > d) compiled android compatible version of libunwind to be used
> >> > to build libbacktrace
> >> > e) REQUIRES meta-selinux for libselinux
> >> > f) checked compilation and packaging for for x86_64 and aarch64
> >> > g) UNTESTED android-tools-adbd.service , couldn't find how to build
> adbd
> >> > that is needed by the service with the new version of android-tools.
> At
> >> > present the service is still packaged but may not work.
> >> > h) tested the adb and fastboot on the core-image-minimal by includin=
g
> >> > the android-tools in the image and ran the commands with 'help'
> >> >
> >> > Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> >> > ---
> >> >  .../android-tools/android-tools/adb.mk        |  72 ----
> >> >  .../android-tools/adb_mk_change_out_dir.patch |  50 +++
> >> >  .../android-tools/android-tools/adbd.mk       | 164 --------
> >> >  ...scv-Add-risc-v-Android-config-header.patch | 359
> ------------------
> >> >  .../0001-adb-remove-selinux-extensions.patch  |  44 ---
> >> >  ...-Use-local-sockets-where-appropriate.patch |  70 ----
> >> >  .../core/0003-adb-define-shell-command.patch  |  29 --
> >> >  ...-adb-Fix-build-on-big-endian-systems.patch |  45 ---
> >> >  .../0005-adb-add-base64-implementation.patch  | 348 ---------------=
--
> >> >  .../core/0006-adb-Musl-fixes.patch            | 131 -------
> >> >  ...sb_linux.c-fix-build-with-glibc-2.28.patch |  24 --
> >> >  ...008-adb-Allow-adbd-to-be-ran-as-root.patch |  21 -
> >> >  ...Add-dt-parameter-to-specify-DT-image.patch | 110 ------
> >> >  ...ux-capability.h-on-linux-systems-too.patch |  23 --
> >> >  .../0011-Remove-bionic-specific-calls.patch   |  64 ----
> >> >  ...laration-of-stlcat-strlcopy-function.patch |  50 ---
> >> >  .../core/0013-adb-Support-riscv64.patch       | 189 ---------
> >> >  .../android-tools/core/adb_libssl_11.diff     |  39 --
> >> >  .../android-tools/android-tools/ext4_utils.mk | 103 -----
> >> >  ...ext4_utils-remove-selinux-extensions.patch |  39 --
> >> >  ...add-o-argument-to-preserve-ownership.patch |  78 ----
> >> >  .../android-tools/android-tools/fastboot.mk   |  89 -----
> >> >  .../fastboot_compile_remove_gtest.patch       |  51 +++
> >> >  .../fastboot_mk_change_out_dir.patch          |  52 +++
> >> >  .../android-tools/android-tools/gitignore     |  59 ---
> >> >  .../img2simg_change_out_dir.patch             |  41 ++
> >> >  .../libadb_mk_change_out_dir.patch            |  44 +++
> >> >  .../libbacktrace_mk_change_out_dir.patch      |  60 +++
> >> >  .../libbase_mk_change_out_dir.patch           |  33 ++
> >> >  .../libcrypto_mk_change_out_dir.patch         |  30 ++
> >> >  .../libcrypto_utils_mk_change_out_dir.patch   |  38 ++
> >> >  .../libcutils_mk_change_out_dir.patch         |  27 ++
> >> >  .../libext4_utils_mk_change_out_dir.patch     |  42 ++
> >> >  .../libfec_mk_change_out_dir.patch            |  35 ++
> >> >  .../liblog_mk_change_out_dir.patch            |  42 ++
> >> >  .../0001-Remove-bionic-specific-calls.patch   |  25 --
> >> >  ...t-define-gettid-if-glibc-2.30-is-use.patch |  49 ---
> >> >  .../libsparse_mk_change_out_dir.patch         |  47 +++
> >> >  .../libunwind_mk_change_out_dir.patch         |  47 +++
> >> >  .../libziparchive_mk_change_out_dir.patch     |  47 +++
> >> >  .../android-tools/android-tools/mkbootimg.mk  |  29 --
> >> >  .../android-tools/rules_yocto.mk              |   4 +
> >> >  .../simg2img_change_out_dir.patch             |  41 ++
> >> >  ...me_space_std_to_compile_libbacktrace.patch |  19 +
> >> >  .../android-tools/android-tools_10.0.0.r36.bb | 204 ++++++++++
> >> >  .../android-tools/android-tools_5.1.1.r37.bb  | 182 ---------
> >> >  46 files changed, 954 insertions(+), 2435 deletions(-)
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_di=
r.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add=
-risc-v-Android-config-header.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove=
-selinux-extensions.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-lo=
cal-sockets-where-appropriate.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define=
-shell-command.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-bu=
ild-on-big-endian-systems.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-ba=
se64-implementation.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-f=
ixes.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_li=
nux.c-fix-build-with-glibc-2.28.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-=
adbd-to-be-ran-as-root.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-=
Add-dt-parameter-to-specify-DT-image.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-=
capability.h-on-linux-systems-too.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bio=
nic-specific-calls.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implic=
it-declaration-of-stlcat-strlcopy-function.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Suppor=
t-riscv64.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.d=
iff
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_uti=
ls-remove-selinux-extensions.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_uti=
ls-add-o-argument-to-preserve-ownership.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_rem=
ove_gtest.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change_o=
ut_dir.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/gitignore
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_out_=
dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_out=
_dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_chan=
ge_out_dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_ou=
t_dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_change_=
out_dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk_c=
hange_out_dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_change_=
out_dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_cha=
nge_out_dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_out=
_dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_out=
_dir.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remo=
ve-bionic-specific-calls.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libs=
elinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_change_=
out_dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_change_=
out_dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_cha=
nge_out_dir.patch
> >> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/rules_yocto.mk
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_out_=
dir.patch
> >> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std_t=
o_compile_libbacktrace.patch
> >> >  create mode 100644 meta-oe/recipes-devtools/android-tools/
> android-tools_10.0.0.r36.bb
> >> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/
> android-tools_5.1.1.r37.bb
> >> >
> >> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/
> adb.mk b/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
> >> > deleted file mode 100644
> >> > index 0687c22c1..000000000
> >> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
> >> > +++ /dev/null
> >> > @@ -1,72 +0,0 @@
> >> > -# Makefile for adb
> >> > -
> >> > -SRCDIR ?=3D $(S)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/adb
> >> > -adb_SRC_FILES +=3D adb.c
> >> > -adb_SRC_FILES +=3D console.c
> >> > -adb_SRC_FILES +=3D transport.c
> >> > -adb_SRC_FILES +=3D transport_local.c
> >> > -adb_SRC_FILES +=3D transport_usb.c
> >> > -adb_SRC_FILES +=3D commandline.c
> >> > -adb_SRC_FILES +=3D adb_client.c
> >> > -adb_SRC_FILES +=3D adb_auth_host.c
> >> > -adb_SRC_FILES +=3D sockets.c
> >> > -adb_SRC_FILES +=3D services.c
> >> > -adb_SRC_FILES +=3D file_sync_client.c
> >> > -adb_SRC_FILES +=3D get_my_path_linux.c
> >> > -adb_SRC_FILES +=3D usb_linux.c
> >> > -adb_SRC_FILES +=3D usb_vendors.c
> >> > -adb_SRC_FILES +=3D fdevent.c
> >> > -adb_OBJS :=3D $(adb_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/libcutils
> >> > -libcutils_SRC_FILES +=3D atomic.c
> >> > -libcutils_SRC_FILES +=3D hashmap.c
> >> > -libcutils_SRC_FILES +=3D native_handle.c
> >> > -libcutils_SRC_FILES +=3D config_utils.c
> >> > -libcutils_SRC_FILES +=3D cpu_info.c
> >> > -libcutils_SRC_FILES +=3D load_file.c
> >> > -# libcutils_SRC_FILES +=3D open_memstream.c
> >> > -# libcutils_SRC_FILES +=3D strdup16to8.c
> >> > -# libcutils_SRC_FILES +=3D strdup8to16.c
> >> > -# libcutils_SRC_FILES +=3D record_stream.c
> >> > -# libcutils_SRC_FILES +=3D process_name.c
> >> > -# libcutils_SRC_FILES +=3D threads.c
> >> > -# libcutils_SRC_FILES +=3D sched_policy.c
> >> > -# libcutils_SRC_FILES +=3D iosched_policy.c
> >> > -libcutils_SRC_FILES +=3D str_parms.c
> >> > -libcutils_SRC_FILES +=3D fs.c
> >> > -libcutils_SRC_FILES +=3D multiuser.c
> >> > -libcutils_SRC_FILES +=3D socket_inaddr_any_server.c
> >> > -libcutils_SRC_FILES +=3D socket_local_client.c
> >> > -libcutils_SRC_FILES +=3D socket_local_server.c
> >> > -libcutils_SRC_FILES +=3D socket_loopback_client.c
> >> > -libcutils_SRC_FILES +=3D socket_loopback_server.c
> >> > -libcutils_SRC_FILES +=3D socket_network_client.c
> >> > -libcutils_SRC_FILES +=3D sockets.c
> >> > -libcutils_SRC_FILES +=3D ashmem-host.c
> >> > -libcutils_SRC_FILES +=3D dlmalloc_stubs.c
> >> > -libcutils_OBJS :=3D $(libcutils_SRC_FILES:.c=3D.o)
> >> > -
> >> > -CFLAGS +=3D -DANDROID
> >> > -CFLAGS +=3D -DWORKAROUND_BUG6558362
> >> > -CFLAGS +=3D -DADB_HOST=3D1
> >> > -CFLAGS +=3D -D_XOPEN_SOURCE -D_GNU_SOURCE
> >> > -CFLAGS +=3D -DANDROID_SMP=3D0
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/adb
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/include
> >> > -CFLAGS +=3D -include
> $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> >> > -
> >> > -LIBS +=3D libcutils.a -lpthread -lcrypto
> >> > -
> >> > -all: adb
> >> > -
> >> > -adb: libcutils.a $(adb_OBJS)
> >> > -       $(CC) -o $@ $(LDFLAGS) $(adb_OBJS) $(LIBS)
> >> > -
> >> > -libcutils.a: $(libcutils_OBJS)
> >> > -       $(AR) rcs $@ $(libcutils_OBJS)
> >> > -
> >> > -clean:
> >> > -       $(RM) $(adb_OBJS) $(libcutils_OBJS) adb *.a
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_=
dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_=
dir.patch
> >> > new file mode 100644
> >> > index 000000000..8c07e133a
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_=
dir.patch
> >> > @@ -0,0 +1,50 @@
> >> > +patching adb.mk to build in yocto environment.
> >> > +
> >> > +Changes include:
> >> > +Introduced an output folder which will keep all the outputs from th=
e
> >> > +android-tools.
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary to the OUT_DI=
R
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +Upstream-Status: Pending
> >> > +--- git/system/core/debian/adb.mk      2021-04-29
> 21:11:00.617892503 +0200
> >> > ++++ git/system/core/debian/adb.mk      2021-04-29
> 21:17:33.256016600 +0200
> >> > +@@ -1,3 +1,4 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME =3D adb
> >> > +
> >> > + SOURCES =3D client/adb_client.cpp \
> >> > +@@ -12,10 +13,10 @@
> >> > +
> >> > + SOURCES :=3D $(foreach source, $(SOURCES), adb/$(source))
> >> > + CXXFLAGS +=3D -std=3Dgnu++2a
> >> > +-CPPFLAGS +=3D -Iinclude -Iadb -Ibase/include \
> >> > ++CPPFLAGS +=3D -Iinclude -Iadb -Ibase/include
> -I$(OUT_DIR)/usr/include/ \
> >> > +             -DADB_VERSION=3D'"$(DEB_VERSION)"' -DADB_HOST=3D1
> -D_GNU_SOURCE
> >> > +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -Wl,-rpath-link=3D. \
> >> > +-           -lpthread -L. -ladb -lbase
> >> > ++LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -Wl,-rpath-link=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
> >> > ++           -lpthread
> -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ -ladb -lbase
> >> > +
> >> > + # -latomic should be the last library specified
> >> > + # https://github.com/android/ndk/issues/589
> >> > +@@ -24,7 +25,8 @@
> >> > + endif
> >> > +
> >> > + build: $(SOURCES)
> >> > +-      $(CXX) $^ -o adb/$(NAME) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
> >> > ++      mkdir --parents
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/adb
> >> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/adb/$(NAME) $(CXXFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> >> > +
> >> > + clean:
> >> > +-      $(RM) adb/$(NAME)
> >> > ++      $(RM)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/adb/$(NAME)
> >> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/
> adbd.mk b/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
> >> > deleted file mode 100644
> >> > index 31452ae10..000000000
> >> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
> >> > +++ /dev/null
> >> > @@ -1,164 +0,0 @@
> >> > -# Makefile for adbd
> >> > -
> >> > -SRCDIR ?=3D $(S)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/adb
> >> > -adbd_SRC_FILES +=3D adb.c
> >> > -adbd_SRC_FILES +=3D fdevent.c
> >> > -adbd_SRC_FILES +=3D transport.c
> >> > -adbd_SRC_FILES +=3D transport_local.c
> >> > -adbd_SRC_FILES +=3D transport_usb.c
> >> > -adbd_SRC_FILES +=3D adb_auth_client.c
> >> > -adbd_SRC_FILES +=3D sockets.c
> >> > -adbd_SRC_FILES +=3D services.c
> >> > -adbd_SRC_FILES +=3D file_sync_service.c
> >> > -adbd_SRC_FILES +=3D jdwp_service.c
> >> > -adbd_SRC_FILES +=3D framebuffer_service.c
> >> > -adbd_SRC_FILES +=3D remount_service.c
> >> > -adbd_SRC_FILES +=3D disable_verity_service.c
> >> > -adbd_SRC_FILES +=3D base64.c
> >> > -adbd_SRC_FILES +=3D usb_linux_client.c
> >> > -adbd_OBJS :=3D $(adbd_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/liblog
> >> > -liblog_SRC_FILES +=3D logd_write.c
> >> > -liblog_SRC_FILES +=3D log_event_write.c
> >> > -liblog_SRC_FILES +=3D logprint.c
> >> > -liblog_SRC_FILES +=3D event_tag_map.c
> >> > -liblog_SRC_FILES +=3D fake_log_device.c
> >> > -liblog_OBJS :=3D $(liblog_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/fs_mgr
> >> > -fs_mgr_SRC_FILES +=3D fs_mgr_fstab.c
> >> > -fs_mgr_OBJS :=3D $(fs_mgr_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/libcutils
> >> > -libcutils_SRC_FILES +=3D atomic.c
> >> > -libcutils_SRC_FILES +=3D hashmap.c
> >> > -libcutils_SRC_FILES +=3D native_handle.c
> >> > -libcutils_SRC_FILES +=3D config_utils.c
> >> > -libcutils_SRC_FILES +=3D cpu_info.c
> >> > -libcutils_SRC_FILES +=3D load_file.c
> >> > -# libcutils_SRC_FILES +=3D open_memstream.c
> >> > -# libcutils_SRC_FILES +=3D strdup16to8.c
> >> > -# libcutils_SRC_FILES +=3D strdup8to16.c
> >> > -# libcutils_SRC_FILES +=3D record_stream.c
> >> > -# libcutils_SRC_FILES +=3D process_name.c
> >> > -# libcutils_SRC_FILES +=3D threads.c
> >> > -# libcutils_SRC_FILES +=3D sched_policy.c
> >> > -# libcutils_SRC_FILES +=3D iosched_policy.c
> >> > -libcutils_SRC_FILES +=3D str_parms.c
> >> > -libcutils_SRC_FILES +=3D fs.c
> >> > -libcutils_SRC_FILES +=3D multiuser.c
> >> > -libcutils_SRC_FILES +=3D socket_inaddr_any_server.c
> >> > -libcutils_SRC_FILES +=3D socket_local_client.c
> >> > -libcutils_SRC_FILES +=3D socket_local_server.c
> >> > -libcutils_SRC_FILES +=3D socket_loopback_client.c
> >> > -libcutils_SRC_FILES +=3D socket_loopback_server.c
> >> > -libcutils_SRC_FILES +=3D socket_network_client.c
> >> > -libcutils_SRC_FILES +=3D sockets.c
> >> > -libcutils_SRC_FILES +=3D ashmem-host.c
> >> > -libcutils_SRC_FILES +=3D dlmalloc_stubs.c
> >> > -libcutils_SRC_FILES +=3D klog.c
> >> > -libcutils_SRC_FILES +=3D properties.c
> >> > -libcutils_OBJS :=3D $(libcutils_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/external/libselinux/src
> >> > -libselinux_SRC_FILES +=3D booleans.c
> >> > -libselinux_SRC_FILES +=3D canonicalize_context.c
> >> > -libselinux_SRC_FILES +=3D disable.c
> >> > -libselinux_SRC_FILES +=3D enabled.c
> >> > -libselinux_SRC_FILES +=3D fgetfilecon.c
> >> > -libselinux_SRC_FILES +=3D fsetfilecon.c
> >> > -libselinux_SRC_FILES +=3D getenforce.c
> >> > -libselinux_SRC_FILES +=3D getfilecon.c
> >> > -libselinux_SRC_FILES +=3D getpeercon.c
> >> > -libselinux_SRC_FILES +=3D lgetfilecon.c
> >> > -libselinux_SRC_FILES +=3D load_policy.c
> >> > -libselinux_SRC_FILES +=3D lsetfilecon.c
> >> > -libselinux_SRC_FILES +=3D policyvers.c
> >> > -libselinux_SRC_FILES +=3D procattr.c
> >> > -libselinux_SRC_FILES +=3D setenforce.c
> >> > -libselinux_SRC_FILES +=3D setfilecon.c
> >> > -libselinux_SRC_FILES +=3D context.c
> >> > -libselinux_SRC_FILES +=3D mapping.c
> >> > -libselinux_SRC_FILES +=3D stringrep.c
> >> > -libselinux_SRC_FILES +=3D compute_create.c
> >> > -libselinux_SRC_FILES +=3D compute_av.c
> >> > -libselinux_SRC_FILES +=3D avc.c
> >> > -libselinux_SRC_FILES +=3D avc_internal.c
> >> > -libselinux_SRC_FILES +=3D avc_sidtab.c
> >> > -libselinux_SRC_FILES +=3D get_initial_context.c
> >> > -libselinux_SRC_FILES +=3D checkAccess.c
> >> > -libselinux_SRC_FILES +=3D sestatus.c
> >> > -libselinux_SRC_FILES +=3D deny_unknown.c
> >> > -
> >> > -libselinux_SRC_FILES +=3D callbacks.c
> >> > -libselinux_SRC_FILES +=3D check_context.c
> >> > -libselinux_SRC_FILES +=3D freecon.c
> >> > -libselinux_SRC_FILES +=3D init.c
> >> > -libselinux_SRC_FILES +=3D label.c
> >> > -libselinux_SRC_FILES +=3D label_file.c
> >> > -libselinux_SRC_FILES +=3D label_android_property.c
> >> > -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils
> >> > -libext4_utils_SRC_FILES +=3D make_ext4fs.c
> >> > -libext4_utils_SRC_FILES +=3D ext4fixup.c
> >> > -libext4_utils_SRC_FILES +=3D ext4_utils.c
> >> > -libext4_utils_SRC_FILES +=3D allocate.c
> >> > -libext4_utils_SRC_FILES +=3D contents.c
> >> > -libext4_utils_SRC_FILES +=3D extent.c
> >> > -libext4_utils_SRC_FILES +=3D indirect.c
> >> > -libext4_utils_SRC_FILES +=3D uuid.c
> >> > -libext4_utils_SRC_FILES +=3D sha1.c
> >> > -libext4_utils_SRC_FILES +=3D wipe.c
> >> > -libext4_utils_SRC_FILES +=3D crc16.c
> >> > -libext4_utils_SRC_FILES +=3D ext4_sb.c
> >> > -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)
> >> > -
> >> > -CFLAGS +=3D -std=3Dgnu11
> >> > -CFLAGS +=3D -DANDROID
> >> > -CFLAGS +=3D -DADB_HOST=3D0
> >> > -CFLAGS +=3D -D_XOPEN_SOURCE -D_GNU_SOURCE
> >> > -CFLAGS +=3D -DALLOW_ADBD_ROOT=3D1
> >> > -CFLAGS +=3D -DALLOW_ADBD_DISABLE_VERITY=3D1
> >> > -CFLAGS +=3D -DPROP_NAME_MAX=3D32
> >> > -CFLAGS +=3D -DPROP_VALUE_MAX=3D92
> >> > -CFLAGS +=3D -DAUDITD_LOG_TAG=3D1003
> >> > -# CFLAGS +=3D -DHOST
> >> > -CFLAGS +=3D -DANDROID_SMP=3D0
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/adb
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/include
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/fs_mgr/include
> >> > -CFLAGS +=3D -I$(SRCDIR)/hardware/libhardware/include
> >> > -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include
> >> > -CFLAGS +=3D -include
> $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> >> > -
> >> > -LIBS +=3D liblog.a libfs_mgr.a libcutils.a libselinux.a
> libext4_utils.a -lpthread -lbsd -lpcre -lresolv -lcrypto
> >> > -
> >> > -all: adbd
> >> > -
> >> > -adbd: liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a
> $(adbd_OBJS)
> >> > -       $(CC) -o $@ $(LDFLAGS) $(adbd_OBJS) $(LIBS)
> >> > -
> >> > -liblog.a: $(liblog_OBJS)
> >> > -       $(AR) rcs $@ $(liblog_OBJS)
> >> > -
> >> > -libfs_mgr.a: $(fs_mgr_OBJS)
> >> > -       $(AR) rcs $@ $(fs_mgr_OBJS)
> >> > -
> >> > -libcutils.a: $(libcutils_OBJS)
> >> > -       $(AR) rcs $@ $(libcutils_OBJS)
> >> > -
> >> > -libselinux.a: $(libselinux_OBJS)
> >> > -       export CFLAGS=3D"-DANDROID -DHOST"
> >> > -       $(AR) rcs $@ $(libselinux_OBJS)
> >> > -
> >> > -libext4_utils.a: $(libext4_utils_OBJS)
> >> > -       $(AR) rcs $@ $(libext4_utils_OBJS)
> >> > -
> >> > -clean:
> >> > -       $(RM) *.o *.a adbd
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-A=
dd-risc-v-Android-config-header.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-A=
dd-risc-v-Android-config-header.patch
> >> > deleted file mode 100644
> >> > index 57c443b70..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-A=
dd-risc-v-Android-config-header.patch
> >> > +++ /dev/null
> >> > @@ -1,359 +0,0 @@
> >> > -From 82dce13ea7b5b31c63851bd67f66072413917e73 Mon Sep 17 00:00:00
> 2001
> >> > -From: Chenxi Mao <maochenxi@eswin.com>
> >> > -Date: Mon, 20 Apr 2020 15:32:40 +0800
> >> > -Subject: [PATCH 1/1] Riscv: Add risc-v Android config header
> >> > -
> >> > ----
> >> > - .../arch/linux-riscv64/AndroidConfig.h        | 340
> ++++++++++++++++++
> >> > - 1 file changed, 340 insertions(+)
> >> > - create mode 100644
> core/combo/include/arch/linux-riscv64/AndroidConfig.h
> >> > -
> >> > -diff --git a/core/combo/include/arch/linux-riscv64/AndroidConfig.h
> b/core/combo/include/arch/linux-riscv64/AndroidConfig.h
> >> > -new file mode 100644
> >> > -index 0000000000..bcbda8f87f
> >> > ---- /dev/null
> >> > -+++ b/core/combo/include/arch/linux-riscv64/AndroidConfig.h
> >> > -@@ -0,0 +1,340 @@
> >> > -+/*
> >> > -+ * Copyright (C) 2013 The Android Open Source Project
> >> > -+ *
> >> > -+ * Licensed under the Apache License, Version 2.0 (the "License");
> >> > -+ * you may not use this file except in compliance with the License=
.
> >> > -+ * You may obtain a copy of the License at
> >> > -+ *
> >> > -+ *      http://www.apache.org/licenses/LICENSE-2.0
> >> > -+ *
> >> > -+ * Unless required by applicable law or agreed to in writing,
> software
> >> > -+ * distributed under the License is distributed on an "AS IS" BASI=
S,
> >> > -+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
> implied.
> >> > -+ * See the License for the specific language governing permissions
> and
> >> > -+ * limitations under the License.
> >> > -+ */
> >> > -+
> >> > -+/*
> >> > -+ * Android config -- "android-aarch64".  Used for ARM aarch64
> device builds.
> >> > -+ */
> >> > -+#ifndef _ANDROID_CONFIG_H
> >> > -+#define _ANDROID_CONFIG_H
> >> > -+
> >> > -+/*
> >> > -+ *
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >> > -+ *                              !!! IMPORTANT !!!
> >> > -+ *
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >> > -+ *
> >> > -+ * This file is included by ALL C/C++ source files.  Don't put
> anything in
> >> > -+ * here unless you are absolutely certain it can't go anywhere els=
e.
> >> > -+ *
> >> > -+ * Any C++ stuff must be wrapped with "#ifdef __cplusplus".  Do no=
t
> use "//"
> >> > -+ * comments.
> >> > -+ */
> >> > -+
> >> > -+/*
> >> > -+ * Threading model.  Choose one:
> >> > -+ *
> >> > -+ * HAVE_PTHREADS - use the pthreads library.
> >> > -+ * HAVE_WIN32_THREADS - use Win32 thread primitives.
> >> > -+ *  -- combine HAVE_CREATETHREAD, HAVE_CREATEMUTEX, and
> HAVE__BEGINTHREADEX
> >> > -+ */
> >> > -+#define HAVE_PTHREADS
> >> > -+
> >> > -+/*
> >> > -+ * Do we have pthread_setname_np()?
> >> > -+ *
> >> > -+ * (HAVE_PTHREAD_SETNAME_NP is used by WebKit to enable a function
> with
> >> > -+ * the same name but different parameters, so we can't use that
> here.)
> >> > -+ */
> >> > -+#define HAVE_ANDROID_PTHREAD_SETNAME_NP
> >> > -+
> >> > -+/*
> >> > -+ * Do we have the futex syscall?
> >> > -+ */
> >> > -+#define HAVE_FUTEX
> >> > -+
> >> > -+/*
> >> > -+ * Process creation model.  Choose one:
> >> > -+ *
> >> > -+ * HAVE_FORKEXEC - use fork() and exec()
> >> > -+ * HAVE_WIN32_PROC - use CreateProcess()
> >> > -+ */
> >> > -+#define HAVE_FORKEXEC
> >> > -+
> >> > -+/*
> >> > -+ * Process out-of-memory adjustment.  Set if running on Linux,
> >> > -+ * where we can write to /proc/<pid>/oom_adj to modify the
> out-of-memory
> >> > -+ * badness adjustment.
> >> > -+ */
> >> > -+#define HAVE_OOM_ADJ
> >> > -+
> >> > -+/*
> >> > -+ * IPC model.  Choose one:
> >> > -+ *
> >> > -+ * HAVE_SYSV_IPC - use the classic SysV IPC mechanisms (semget,
> shmget).
> >> > -+ * HAVE_MACOSX_IPC - use Macintosh IPC mechanisms (sem_open, mmap)=
.
> >> > -+ * HAVE_WIN32_IPC - use Win32 IPC (CreateSemaphore,
> CreateFileMapping).
> >> > -+ * HAVE_ANDROID_IPC - use Android versions (?, mmap).
> >> > -+ */
> >> > -+#define HAVE_ANDROID_IPC
> >> > -+
> >> > -+/*
> >> > -+ * Memory-mapping model. Choose one:
> >> > -+ *
> >> > -+ * HAVE_POSIX_FILEMAP - use the Posix sys/mmap.h
> >> > -+ * HAVE_WIN32_FILEMAP - use Win32 filemaps
> >> > -+ */
> >> > -+#define  HAVE_POSIX_FILEMAP
> >> > -+
> >> > -+/*
> >> > -+ * Define this if you have <termio.h>
> >> > -+ */
> >> > -+#define  HAVE_TERMIO_H 1
> >> > -+
> >> > -+/*
> >> > -+ * Define this if you have <sys/sendfile.h>
> >> > -+ */
> >> > -+#define  HAVE_SYS_SENDFILE_H 1
> >> > -+
> >> > -+/*
> >> > -+ * Define this if you build against MSVCRT.DLL
> >> > -+ */
> >> > -+/* #define HAVE_MS_C_RUNTIME */
> >> > -+
> >> > -+/*
> >> > -+ * Define this if you have sys/uio.h
> >> > -+ */
> >> > -+#define  HAVE_SYS_UIO_H 1
> >> > -+
> >> > -+/*
> >> > -+ * Define this if your platforms implements symbolic links
> >> > -+ * in its filesystems
> >> > -+ */
> >> > -+#define HAVE_SYMLINKS
> >> > -+
> >> > -+/*
> >> > -+ * Define this if we have localtime_r().
> >> > -+ */
> >> > -+/* #define HAVE_LOCALTIME_R 1 */
> >> > -+
> >> > -+/*
> >> > -+ * Define this if we have gethostbyname_r().
> >> > -+ */
> >> > -+/* #define HAVE_GETHOSTBYNAME_R */
> >> > -+
> >> > -+/*
> >> > -+ * Define this if we have ioctl().
> >> > -+ */
> >> > -+#define HAVE_IOCTL
> >> > -+
> >> > -+/*
> >> > -+ * Define this if we want to use WinSock.
> >> > -+ */
> >> > -+/* #define HAVE_WINSOCK */
> >> > -+
> >> > -+/*
> >> > -+ * Define this if have clock_gettime() and friends
> >> > -+ */
> >> > -+#define HAVE_POSIX_CLOCKS
> >> > -+
> >> > -+/*
> >> > -+ * Define this if we have linux style epoll()
> >> > -+ */
> >> > -+#define HAVE_EPOLL
> >> > -+
> >> > -+/*
> >> > -+ * Endianness of the target machine.  Choose one:
> >> > -+ *
> >> > -+ * HAVE_ENDIAN_H -- have endian.h header we can include.
> >> > -+ * HAVE_LITTLE_ENDIAN -- we are little endian.
> >> > -+ * HAVE_BIG_ENDIAN -- we are big endian.
> >> > -+ */
> >> > -+#define HAVE_ENDIAN_H
> >> > -+#define HAVE_LITTLE_ENDIAN
> >> > -+
> >> > -+#define _FILE_OFFSET_BITS 64
> >> > -+/* #define _LARGEFILE_SOURCE 1 */
> >> > -+
> >> > -+/*
> >> > -+ * Define if platform has off64_t (and lseek64 and other xxx64
> functions)
> >> > -+ */
> >> > -+#define HAVE_OFF64_T
> >> > -+
> >> > -+/*
> >> > -+ * Defined if we have the backtrace() call for retrieving a stack
> trace.
> >> > -+ * Needed for CallStack to operate; if not defined, CallStack is
> >> > -+ * non-functional.
> >> > -+ */
> >> > -+#define HAVE_BACKTRACE 0
> >> > -+
> >> > -+/*
> >> > -+ * Defined if we have the cxxabi.h header for demangling C++
> symbols.  If
> >> > -+ * not defined, stack crawls will be displayed with raw mangled
> symbols
> >> > -+ */
> >> > -+#define HAVE_CXXABI 0
> >> > -+
> >> > -+/*
> >> > -+ * Defined if we have the gettid() system call.
> >> > -+ */
> >> > -+#define HAVE_GETTID
> >> > -+
> >> > -+/*
> >> > -+ * Defined if we have the sched_setscheduler() call
> >> > -+ */
> >> > -+#define HAVE_SCHED_SETSCHEDULER
> >> > -+
> >> > -+/*
> >> > -+ * Add any extra platform-specific defines here.
> >> > -+ */
> >> > -+#ifndef __linux__
> >> > -+#define __linux__
> >> > -+#endif
> >> > -+
> >> > -+/*
> >> > -+ * Define if we have <malloc.h> header
> >> > -+ */
> >> > -+#define HAVE_MALLOC_H
> >> > -+
> >> > -+/*
> >> > -+ * Define if we're running on *our* linux on device or emulator.
> >> > -+ */
> >> > -+#define HAVE_ANDROID_OS 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if we have Linux-style non-filesystem Unix Domain Socket=
s
> >> > -+ */
> >> > -+#define HAVE_LINUX_LOCAL_SOCKET_NAMESPACE 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if we have Linux's inotify in <sys/inotify.h>.
> >> > -+ */
> >> > -+#define HAVE_INOTIFY 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if we have madvise() in <sys/mman.h>
> >> > -+ */
> >> > -+#define HAVE_MADVISE 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if tm struct has tm_gmtoff field
> >> > -+ */
> >> > -+#define HAVE_TM_GMTOFF 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if dirent struct has d_type field
> >> > -+ */
> >> > -+#define HAVE_DIRENT_D_TYPE 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if libc includes Android system properties implementatio=
n.
> >> > -+ */
> >> > -+#define HAVE_LIBC_SYSTEM_PROPERTIES 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if system provides a system property server (should be
> >> > -+ * mutually exclusive with HAVE_LIBC_SYSTEM_PROPERTIES).
> >> > -+ */
> >> > -+/* #define HAVE_SYSTEM_PROPERTY_SERVER */
> >> > -+
> >> > -+/*
> >> > -+ * What CPU architecture does this platform use?
> >> > -+ */
> >> > -+#define ARCH_AARCH64
> >> > -+
> >> > -+/*
> >> > -+ * Define if the size of enums is as short as possible,
> >> > -+ */
> >> > -+/* #define HAVE_SHORT_ENUMS */
> >> > -+
> >> > -+/*
> >> > -+ * sprintf() format string for shared library naming.
> >> > -+ */
> >> > -+#define OS_SHARED_LIB_FORMAT_STR    "lib%s.so"
> >> > -+
> >> > -+/*
> >> > -+ * type for the third argument to mincore().
> >> > -+ */
> >> > -+#define MINCORE_POINTER_TYPE unsigned char *
> >> > -+
> >> > -+/*
> >> > -+ * The default path separator for the platform
> >> > -+ */
> >> > -+#define OS_PATH_SEPARATOR '/'
> >> > -+
> >> > -+/*
> >> > -+ * Is the filesystem case sensitive?
> >> > -+ */
> >> > -+#define OS_CASE_SENSITIVE
> >> > -+
> >> > -+/*
> >> > -+ * Define if <sys/socket.h> exists.
> >> > -+ */
> >> > -+#define HAVE_SYS_SOCKET_H 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if the strlcpy() function exists on the system.
> >> > -+ */
> >> > -+#define HAVE_STRLCPY 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if the open_memstream() function exists on the system.
> >> > -+ */
> >> > -+/* #define HAVE_OPEN_MEMSTREAM 1 */
> >> > -+
> >> > -+/*
> >> > -+ * Define if the BSD funopen() function exists on the system.
> >> > -+ */
> >> > -+#define HAVE_FUNOPEN 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if prctl() exists
> >> > -+ */
> >> > -+#define HAVE_PRCTL 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if writev() exists
> >> > -+ */
> >> > -+#define HAVE_WRITEV 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if <stdint.h> exists.
> >> > -+ */
> >> > -+#define HAVE_STDINT_H 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if <stdbool.h> exists.
> >> > -+ */
> >> > -+#define HAVE_STDBOOL_H 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if <sched.h> exists.
> >> > -+ */
> >> > -+#define HAVE_SCHED_H 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if pread() exists
> >> > -+ */
> >> > -+#define HAVE_PREAD 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if we have st_mtim in struct stat
> >> > -+ */
> >> > -+#define HAVE_STAT_ST_MTIM 1
> >> > -+
> >> > -+/*
> >> > -+ * Define if printf() supports %zd for size_t arguments
> >> > -+ */
> >> > -+#define HAVE_PRINTF_ZD 1
> >> > -+
> >> > -+/*
> >> > -+ * Define to 1 if <stdlib.h> provides qsort_r() with a BSD style
> function prototype.
> >> > -+ */
> >> > -+#define HAVE_BSD_QSORT_R 0
> >> > -+
> >> > -+/*
> >> > -+ * Define to 1 if <stdlib.h> provides qsort_r() with a GNU style
> function prototype.
> >> > -+ */
> >> > -+#define HAVE_GNU_QSORT_R 0
> >> > -+
> >> > -+#endif /* _ANDROID_CONFIG_H */
> >> > ---
> >> > -2.17.1
> >> > -
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remo=
ve-selinux-extensions.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remo=
ve-selinux-extensions.patch
> >> > deleted file mode 100644
> >> > index 7d20c5068..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remo=
ve-selinux-extensions.patch
> >> > +++ /dev/null
> >> > @@ -1,44 +0,0 @@
> >> > -From 7b7200727413ca4a9bb132221c543ec033dffafa Mon Sep 17 00:00:00
> 2001
> >> > -From: Sergio Schvezov <sergio.schvezov@canonical.com>
> >> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> >> > -Subject: [PATCH] adb: remove selinux extensions
> >> > -
> >> > -* drop useless includes of Android SELINUX extensions
> >> > -* avoids having to clone another module
> >> > -* this should be sent upstream
> >> > -
> >> > -Upstream-Status: Inappropriate
> >> > -
> >> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> > ----
> >> > - adb/file_sync_service.c | 3 ---
> >> > - 1 file changed, 3 deletions(-)
> >> > -
> >> > -diff --git a/adb/file_sync_service.c b/adb/file_sync_service.c
> >> > -index 7933858516..3cbd0cd863 100644
> >> > ---- a/adb/file_sync_service.c
> >> > -+++ b/adb/file_sync_service.c
> >> > -@@ -26,7 +26,6 @@
> >> > -
> >> > - #include <errno.h>
> >> > - #include <private/android_filesystem_config.h>
> >> > --#include <selinux/android.h>
> >> > - #include "sysdeps.h"
> >> > -
> >> > - #define TRACE_TAG  TRACE_SYNC
> >> > -@@ -73,7 +72,6 @@ static int mkdirs(char *name)
> >> > -                 *x =3D '/';
> >> > -                 return ret;
> >> > -             }
> >> > --            selinux_android_restorecon(name, 0);
> >> > -         }
> >> > -         *x++ =3D '/';
> >> > -     }
> >> > -@@ -251,7 +249,6 @@ static int handle_send_file(int s, char *path,
> uid_t uid,
> >> > -     if(fd >=3D 0) {
> >> > -         struct utimbuf u;
> >> > -         adb_close(fd);
> >> > --        selinux_android_restorecon(path, 0);
> >> > -         u.actime =3D timestamp;
> >> > -         u.modtime =3D timestamp;
> >> > -         utime(path, &u);
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-=
local-sockets-where-appropriate.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-=
local-sockets-where-appropriate.patch
> >> > deleted file mode 100644
> >> > index 3627110ad..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-=
local-sockets-where-appropriate.patch
> >> > +++ /dev/null
> >> > @@ -1,70 +0,0 @@
> >> > -From d855f042ca09a358cebe2d3c1d29d512afd7ebb8 Mon Sep 17 00:00:00
> 2001
> >> > -From: Hilko Bengen <bengen@debian.org>
> >> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> >> > -Subject: [PATCH] adb: Use local sockets where appropriate
> >> > -
> >> > -Upstream-Status: Inappropriate
> >> > ----
> >> > - adb/adb.c             | 6 +++++-
> >> > - adb/adb_client.c      | 5 +++--
> >> > - adb/transport_local.c | 3 ++-
> >> > - 3 files changed, 10 insertions(+), 4 deletions(-)
> >> > -
> >> > -diff --git a/adb/adb.c b/adb/adb.c
> >> > -index 10a1e0da26..027edd9359 100644
> >> > ---- a/adb/adb.c
> >> > -+++ b/adb/adb.c
> >> > -@@ -1230,7 +1230,11 @@ int launch_server(int server_port)
> >> > -  */
> >> > - void build_local_name(char* target_str, size_t target_size, int
> server_port)
> >> > - {
> >> > --  snprintf(target_str, target_size, "tcp:%d", server_port);
> >> > -+  if (gListenAll > 0) {
> >> > -+    snprintf(target_str, target_size, "tcp:%d", server_port);
> >> > -+  } else {
> >> > -+    snprintf(target_str, target_size, "local:%d", server_port);
> >> > -+  }
> >> > - }
> >> > -
> >> > - #if !ADB_HOST
> >> > -diff --git a/adb/adb_client.c b/adb/adb_client.c
> >> > -index eb1720d22c..a383faefe3 100644
> >> > ---- a/adb/adb_client.c
> >> > -+++ b/adb/adb_client.c
> >> > -@@ -185,12 +185,12 @@ int _adb_connect(const char *service)
> >> > -         strcpy(__adb_error, "service name too long");
> >> > -         return -1;
> >> > -     }
> >> > --    snprintf(tmp, sizeof tmp, "%04x", len);
> >> > -+    snprintf(tmp, sizeof tmp, "%d", __adb_server_port);
> >> > -
> >> > -     if (__adb_server_name)
> >> > -         fd =3D socket_network_client(__adb_server_name,
> __adb_server_port, SOCK_STREAM);
> >> > -     else
> >> > --        fd =3D socket_loopback_client(__adb_server_port, SOCK_STRE=
AM);
> >> > -+        fd =3D socket_local_client(tmp,
> ANDROID_SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);
> >> > -
> >> > -     if(fd < 0) {
> >> > -         strcpy(__adb_error, "cannot connect to daemon");
> >> > -@@ -201,6 +201,7 @@ int _adb_connect(const char *service)
> >> > -         return -1;
> >> > -     }
> >> > -
> >> > -+    snprintf(tmp, sizeof tmp, "%04x", len);
> >> > -     if(writex(fd, tmp, 4) || writex(fd, service, len)) {
> >> > -         strcpy(__adb_error, "write failure during connection");
> >> > -         adb_close(fd);
> >> > -diff --git a/adb/transport_local.c b/adb/transport_local.c
> >> > -index 948cc15812..71582a8c88 100644
> >> > ---- a/adb/transport_local.c
> >> > -+++ b/adb/transport_local.c
> >> > -@@ -121,7 +121,8 @@ int local_connect_arbitrary_ports(int
> console_port, int adb_port)
> >> > -     }
> >> > - #endif
> >> > -     if (fd < 0) {
> >> > --        fd =3D socket_loopback_client(adb_port, SOCK_STREAM);
> >> > -+        snprintf(buf, sizeof buf, "%d", adb_port);
> >> > -+        fd =3D socket_local_client(buf,
> ANDROID_SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);
> >> > -     }
> >> > -
> >> > -     if (fd >=3D 0) {
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-defi=
ne-shell-command.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-defi=
ne-shell-command.patch
> >> > deleted file mode 100644
> >> > index cf1d9cbc3..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-defi=
ne-shell-command.patch
> >> > +++ /dev/null
> >> > @@ -1,29 +0,0 @@
> >> > -From 4421c2e19946dcd651fd8ac022b96627fc526149 Mon Sep 17 00:00:00
> 2001
> >> > -From: Fathi Boudra <fabo@debian.org>
> >> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> >> > -Subject: [PATCH] adb: define shell command
> >> > -
> >> > -we intend to run on Linux system so the shell is always /bin/sh,
> >> > -for the host or the target.
> >> > -
> >> > -Upstream-Status: Inappropriate
> >> > ----
> >> > - adb/services.c | 4 ----
> >> > - 1 file changed, 4 deletions(-)
> >> > -
> >> > -diff --git a/adb/services.c b/adb/services.c
> >> > -index 21b08dc201..d44b0c5068 100644
> >> > ---- a/adb/services.c
> >> > -+++ b/adb/services.c
> >> > -@@ -299,11 +299,7 @@ static int create_subproc_raw(const char *cmd,
> const char *arg0, const char *arg
> >> > - }
> >> > - #endif  /* !ABD_HOST */
> >> > -
> >> > --#if ADB_HOST
> >> > - #define SHELL_COMMAND "/bin/sh"
> >> > --#else
> >> > --#define SHELL_COMMAND "/system/bin/sh"
> >> > --#endif
> >> > -
> >> > - #if !ADB_HOST
> >> > - static void subproc_waiter_service(int fd, void *cookie)
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-=
build-on-big-endian-systems.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-=
build-on-big-endian-systems.patch
> >> > deleted file mode 100644
> >> > index 79e9d4d3b..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-=
build-on-big-endian-systems.patch
> >> > +++ /dev/null
> >> > @@ -1,45 +0,0 @@
> >> > -From 548b8ca62c64a16305929e2eaf3d546d48de9c25 Mon Sep 17 00:00:00
> 2001
> >> > -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >> > -Date: Tue, 21 Feb 2017 19:46:24 +0100
> >> > -Subject: [PATCH] adb: Fix build on big endian systems
> >> > -
> >> > -The usb_linux_client.c file defines cpu_to_le16/32 by using the C
> >> > -library htole16/32 function calls. However, cpu_to_le16/32 are used
> >> > -when initializing structures, i.e in a context where a function cal=
l
> >> > -is not allowed.
> >> > -
> >> > -It works fine on little endian systems because htole16/32 are defin=
ed
> >> > -by the C library as no-ops. But on big-endian systems, they are
> >> > -actually doing something, which might involve calling a function,
> >> > -causing build failures.
> >> > -
> >> > -To solve this, we simply open-code cpu_to_le16/32 in a way that
> allows
> >> > -them to be used when initializing structures.
> >> > -
> >> > -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.co=
m
> >
> >> > ----
> >> > - adb/usb_linux_client.c | 11 +++++++++--
> >> > - 1 file changed, 9 insertions(+), 2 deletions(-)
> >> > -
> >> > -diff --git a/adb/usb_linux_client.c b/adb/usb_linux_client.c
> >> > -index 8426e0ea14..6e8b5bbbd2 100644
> >> > ---- a/adb/usb_linux_client.c
> >> > -+++ b/adb/usb_linux_client.c
> >> > -@@ -34,8 +34,15 @@
> >> > - #define MAX_PACKET_SIZE_FS    64
> >> > - #define MAX_PACKET_SIZE_HS    512
> >> > -
> >> > --#define cpu_to_le16(x)  htole16(x)
> >> > --#define cpu_to_le32(x)  htole32(x)
> >> > -+#if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN
> >> > -+# define cpu_to_le16(x) (x)
> >> > -+# define cpu_to_le32(x) (x)
> >> > -+#else
> >> > -+# define cpu_to_le16(x) ((((x) >> 8) & 0xffu) | (((x) & 0xffu) <<
> 8))
> >> > -+# define cpu_to_le32(x) \
> >> > -+      ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) |=
 \
> >> > -+       (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))
> >> > -+#endif
> >> > -
> >> > - struct usb_handle
> >> > - {
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-=
base64-implementation.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-=
base64-implementation.patch
> >> > deleted file mode 100644
> >> > index fcd4ae238..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-=
base64-implementation.patch
> >> > +++ /dev/null
> >> > @@ -1,348 +0,0 @@
> >> > -From 753bcb5971401b82fb2e6197d31c9e386f6d0392 Mon Sep 17 00:00:00
> 2001
> >> > -From: Khem Raj <raj.khem@gmail.com>
> >> > -Date: Fri, 15 Sep 2017 15:46:38 -0700
> >> > -Subject: [PATCH] adb: add base64 implementation
> >> > -
> >> > -musl needs it
> >> > -
> >> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > ----
> >> > - adb/adb_auth_client.c |   2 +-
> >> > - adb/base64.c          | 315
> ++++++++++++++++++++++++++++++++++++++++++
> >> > - 2 files changed, 316 insertions(+), 1 deletion(-)
> >> > - create mode 100644 adb/base64.c
> >> > -
> >> > -diff --git a/adb/adb_auth_client.c b/adb/adb_auth_client.c
> >> > -index 55e9dcad19..104b413b8b 100644
> >> > ---- a/adb/adb_auth_client.c
> >> > -+++ b/adb/adb_auth_client.c
> >> > -@@ -75,7 +75,7 @@ static void read_keys(const char *file, struct
> listnode *list)
> >> > -         if (sep)
> >> > -             *sep =3D '\0';
> >> > -
> >> > --        ret =3D __b64_pton(buf, (u_char *)&key->key, sizeof(key->k=
ey)
> + 4);
> >> > -+        ret =3D b64_pton(buf, (u_char *)&key->key, sizeof(key->key=
) +
> 4);
> >> > -         if (ret !=3D sizeof(key->key)) {
> >> > -             D("%s: Invalid base64 data ret=3D%d\n", file, ret);
> >> > -             free(key);
> >> > -diff --git a/adb/base64.c b/adb/base64.c
> >> > -new file mode 100644
> >> > -index 0000000000..95da284d0d
> >> > ---- /dev/null
> >> > -+++ b/adb/base64.c
> >> > -@@ -0,0 +1,315 @@
> >> > -+/*
> >> > -+ * Copyright (c) 1996-1999 by Internet Software Consortium.
> >> > -+ *
> >> > -+ * Permission to use, copy, modify, and distribute this software
> for any
> >> > -+ * purpose with or without fee is hereby granted, provided that th=
e
> above
> >> > -+ * copyright notice and this permission notice appear in all copie=
s.
> >> > -+ *
> >> > -+ * THE SOFTWARE IS PROVIDED "AS IS" AND INTERNET SOFTWARE
> CONSORTIUM DISCLAIMS
> >> > -+ * ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL
> IMPLIED WARRANTIES
> >> > -+ * OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL INTERNET
> SOFTWARE
> >> > -+ * CONSORTIUM BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
> CONSEQUENTIAL
> >> > -+ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> DATA OR
> >> > -+ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> TORTIOUS
> >> > -+ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> PERFORMANCE OF THIS
> >> > -+ * SOFTWARE.
> >> > -+ */
> >> > -+
> >> > -+/*
> >> > -+ * Portions Copyright (c) 1995 by International Business Machines,
> Inc.
> >> > -+ *
> >> > -+ * International Business Machines, Inc. (hereinafter called IBM)
> grants
> >> > -+ * permission under its copyrights to use, copy, modify, and
> distribute this
> >> > -+ * Software with or without fee, provided that the above copyright
> notice and
> >> > -+ * all paragraphs of this notice appear in all copies, and that th=
e
> name of IBM
> >> > -+ * not be used in connection with the marketing of any product
> incorporating
> >> > -+ * the Software or modifications thereof, without specific, writte=
n
> prior
> >> > -+ * permission.
> >> > -+ *
> >> > -+ * To the extent it has a right to do so, IBM grants an immunity
> from suit
> >> > -+ * under its patents, if any, for the use, sale or manufacture of
> products to
> >> > -+ * the extent that such products are used for performing Domain
> Name System
> >> > -+ * dynamic updates in TCP/IP networks by means of the Software.  N=
o
> immunity is
> >> > -+ * granted for any product per se or for any other function of any
> product.
> >> > -+ *
> >> > -+ * THE SOFTWARE IS PROVIDED "AS IS", AND IBM DISCLAIMS ALL
> WARRANTIES,
> >> > -+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> FOR A
> >> > -+ * PARTICULAR PURPOSE.  IN NO EVENT SHALL IBM BE LIABLE FOR ANY
> SPECIAL,
> >> > -+ * DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> WHATSOEVER ARISING
> >> > -+ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
> SOFTWARE, EVEN
> >> > -+ * IF IBM IS APPRISED OF THE POSSIBILITY OF SUCH DAMAGES.
> >> > -+ */
> >> > -+
> >> > -+#if !defined(LINT) && !defined(CODECENTER)
> >> > -+static const char rcsid[] =3D "$BINDId: base64.c,v 8.7 1999/10/13
> 16:39:33 vixie Exp $";
> >> > -+#endif /* not lint */
> >> > -+
> >> > -+#include <sys/types.h>
> >> > -+#include <sys/param.h>
> >> > -+#include <sys/socket.h>
> >> > -+
> >> > -+#include <netinet/in.h>
> >> > -+#include <arpa/inet.h>
> >> > -+#include <arpa/nameser.h>
> >> > -+
> >> > -+#include <ctype.h>
> >> > -+#include <resolv.h>
> >> > -+#include <stdio.h>
> >> > -+#include <stdlib.h>
> >> > -+#include <stdint.h>
> >> > -+#include <string.h>
> >> > -+
> >> > -+#define Assert(Cond) if (!(Cond)) abort()
> >> > -+
> >> > -+static const char Base64[] =3D
> >> > -+
> "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
> >> > -+static const char Pad64 =3D '=3D';
> >> > -+
> >> > -+/* (From RFC1521 and draft-ietf-dnssec-secext-03.txt)
> >> > -+   The following encoding technique is taken from RFC 1521 by
> Borenstein
> >> > -+   and Freed.  It is reproduced here in a slightly edited form for
> >> > -+   convenience.
> >> > -+
> >> > -+   A 65-character subset of US-ASCII is used, enabling 6 bits to b=
e
> >> > -+   represented per printable character. (The extra 65th character,
> "=3D",
> >> > -+   is used to signify a special processing function.)
> >> > -+
> >> > -+   The encoding process represents 24-bit groups of input bits as
> output
> >> > -+   strings of 4 encoded characters. Proceeding from left to right,=
 a
> >> > -+   24-bit input group is formed by concatenating 3 8-bit input
> groups.
> >> > -+   These 24 bits are then treated as 4 concatenated 6-bit groups,
> each
> >> > -+   of which is translated into a single digit in the base64
> alphabet.
> >> > -+
> >> > -+   Each 6-bit group is used as an index into an array of 64
> printable
> >> > -+   characters. The character referenced by the index is placed in
> the
> >> > -+   output string.
> >> > -+
> >> > -+                         Table 1: The Base64 Alphabet
> >> > -+
> >> > -+      Value Encoding  Value Encoding  Value Encoding  Value Encodi=
ng
> >> > -+          0 A            17 R            34 i            51 z
> >> > -+          1 B            18 S            35 j            52 0
> >> > -+          2 C            19 T            36 k            53 1
> >> > -+          3 D            20 U            37 l            54 2
> >> > -+          4 E            21 V            38 m            55 3
> >> > -+          5 F            22 W            39 n            56 4
> >> > -+          6 G            23 X            40 o            57 5
> >> > -+          7 H            24 Y            41 p            58 6
> >> > -+          8 I            25 Z            42 q            59 7
> >> > -+          9 J            26 a            43 r            60 8
> >> > -+         10 K            27 b            44 s            61 9
> >> > -+         11 L            28 c            45 t            62 +
> >> > -+         12 M            29 d            46 u            63 /
> >> > -+         13 N            30 e            47 v
> >> > -+         14 O            31 f            48 w         (pad) =3D
> >> > -+         15 P            32 g            49 x
> >> > -+         16 Q            33 h            50 y
> >> > -+
> >> > -+   Special processing is performed if fewer than 24 bits are
> available
> >> > -+   at the end of the data being encoded.  A full encoding quantum =
is
> >> > -+   always completed at the end of a quantity.  When fewer than 24
> input
> >> > -+   bits are available in an input group, zero bits are added (on t=
he
> >> > -+   right) to form an integral number of 6-bit groups.  Padding at
> the
> >> > -+   end of the data is performed using the '=3D' character.
> >> > -+
> >> > -+   Since all base64 input is an integral number of octets, only th=
e
> >> > -+         -------------------------------------------------
> >> > -+   following cases can arise:
> >> > -+
> >> > -+       (1) the final quantum of encoding input is an integral
> >> > -+           multiple of 24 bits; here, the final unit of encoded
> >> > -+         output will be an integral multiple of 4 characters
> >> > -+         with no "=3D" padding,
> >> > -+       (2) the final quantum of encoding input is exactly 8 bits;
> >> > -+           here, the final unit of encoded output will be two
> >> > -+         characters followed by two "=3D" padding characters, or
> >> > -+       (3) the final quantum of encoding input is exactly 16 bits;
> >> > -+           here, the final unit of encoded output will be three
> >> > -+         characters followed by one "=3D" padding character.
> >> > -+   */
> >> > -+
> >> > -+int
> >> > -+b64_ntop(const uint8_t* src, size_t srclength, char* target, size_=
t
> targsize)
> >> > -+{
> >> > -+      size_t datalength =3D 0;
> >> > -+      uint8_t input[3];
> >> > -+      uint8_t output[4];
> >> > -+      size_t i;
> >> > -+
> >> > -+      while (2 < srclength) {
> >> > -+              input[0] =3D *src++;
> >> > -+              input[1] =3D *src++;
> >> > -+              input[2] =3D *src++;
> >> > -+              srclength -=3D 3;
> >> > -+
> >> > -+              output[0] =3D input[0] >> 2;
> >> > -+              output[1] =3D ((input[0] & 0x03) << 4) + (input[1] >=
>
> 4);
> >> > -+              output[2] =3D ((input[1] & 0x0f) << 2) + (input[2] >=
>
> 6);
> >> > -+              output[3] =3D input[2] & 0x3f;
> >> > -+              Assert(output[0] < 64);
> >> > -+              Assert(output[1] < 64);
> >> > -+              Assert(output[2] < 64);
> >> > -+              Assert(output[3] < 64);
> >> > -+
> >> > -+              if (datalength + 4 > targsize)
> >> > -+                      return (-1);
> >> > -+              target[datalength++] =3D Base64[output[0]];
> >> > -+              target[datalength++] =3D Base64[output[1]];
> >> > -+              target[datalength++] =3D Base64[output[2]];
> >> > -+              target[datalength++] =3D Base64[output[3]];
> >> > -+      }
> >> > -+
> >> > -+      /* Now we worry about padding. */
> >> > -+      if (0 !=3D srclength) {
> >> > -+              /* Get what's left. */
> >> > -+              input[0] =3D input[1] =3D input[2] =3D '\0';
> >> > -+              for (i =3D 0; i < srclength; i++)
> >> > -+                      input[i] =3D *src++;
> >> > -+
> >> > -+              output[0] =3D input[0] >> 2;
> >> > -+              output[1] =3D ((input[0] & 0x03) << 4) + (input[1] >=
>
> 4);
> >> > -+              output[2] =3D ((input[1] & 0x0f) << 2) + (input[2] >=
>
> 6);
> >> > -+              Assert(output[0] < 64);
> >> > -+              Assert(output[1] < 64);
> >> > -+              Assert(output[2] < 64);
> >> > -+
> >> > -+              if (datalength + 4 > targsize)
> >> > -+                      return (-1);
> >> > -+              target[datalength++] =3D Base64[output[0]];
> >> > -+              target[datalength++] =3D Base64[output[1]];
> >> > -+              if (srclength =3D=3D 1)
> >> > -+                      target[datalength++] =3D Pad64;
> >> > -+              else
> >> > -+                      target[datalength++] =3D Base64[output[2]];
> >> > -+              target[datalength++] =3D Pad64;
> >> > -+      }
> >> > -+      if (datalength >=3D targsize)
> >> > -+              return (-1);
> >> > -+      target[datalength] =3D '\0';      /* Returned value doesn't
> count \0. */
> >> > -+      return (datalength);
> >> > -+}
> >> > -+
> >> > -+/* skips all whitespace anywhere.
> >> > -+   converts characters, four at a time, starting at (or after)
> >> > -+   src from base - 64 numbers into three 8 bit bytes in the target
> area.
> >> > -+   it returns the number of data bytes stored at the target, or -1
> on error.
> >> > -+ */
> >> > -+
> >> > -+int b64_pton(const char* src, uint8_t* target, size_t targsize)
> >> > -+{
> >> > -+      int tarindex, state, ch;
> >> > -+      char *pos;
> >> > -+
> >> > -+      state =3D 0;
> >> > -+      tarindex =3D 0;
> >> > -+
> >> > -+      while ((ch =3D *src++) !=3D '\0') {
> >> > -+              if (isspace(ch))        /* Skip whitespace anywhere.
> */
> >> > -+                      continue;
> >> > -+
> >> > -+              if (ch =3D=3D Pad64)
> >> > -+                      break;
> >> > -+
> >> > -+              pos =3D strchr(Base64, ch);
> >> > -+              if (pos =3D=3D 0)           /* A non-base64 characte=
r. */
> >> > -+                      return (-1);
> >> > -+
> >> > -+              switch (state) {
> >> > -+              case 0:
> >> > -+                      if (target) {
> >> > -+                              if ((size_t)tarindex >=3D targsize)
> >> > -+                                      return (-1);
> >> > -+                              target[tarindex] =3D (pos - Base64) =
<<
> 2;
> >> > -+                      }
> >> > -+                      state =3D 1;
> >> > -+                      break;
> >> > -+              case 1:
> >> > -+                      if (target) {
> >> > -+                              if ((size_t)tarindex + 1 >=3D targsi=
ze)
> >> > -+                                      return (-1);
> >> > -+                              target[tarindex]   |=3D  (pos - Base=
64)
> >> 4;
> >> > -+                              target[tarindex+1]  =3D ((pos - Base=
64)
> & 0x0f)
> >> > -+                                                      << 4 ;
> >> > -+                      }
> >> > -+                      tarindex++;
> >> > -+                      state =3D 2;
> >> > -+                      break;
> >> > -+              case 2:
> >> > -+                      if (target) {
> >> > -+                              if ((size_t)tarindex + 1 >=3D targsi=
ze)
> >> > -+                                      return (-1);
> >> > -+                              target[tarindex]   |=3D  (pos - Base=
64)
> >> 2;
> >> > -+                              target[tarindex+1]  =3D ((pos - Base=
64)
> & 0x03)
> >> > -+                                                      << 6;
> >> > -+                      }
> >> > -+                      tarindex++;
> >> > -+                      state =3D 3;
> >> > -+                      break;
> >> > -+              case 3:
> >> > -+                      if (target) {
> >> > -+                              if ((size_t)tarindex >=3D targsize)
> >> > -+                                      return (-1);
> >> > -+                              target[tarindex] |=3D (pos - Base64)=
;
> >> > -+                      }
> >> > -+                      tarindex++;
> >> > -+                      state =3D 0;
> >> > -+                      break;
> >> > -+              default:
> >> > -+                      abort();
> >> > -+              }
> >> > -+      }
> >> > -+
> >> > -+      /*
> >> > -+       * We are done decoding Base-64 chars.  Let's see if we ende=
d
> >> > -+       * on a byte boundary, and/or with erroneous trailing
> characters.
> >> > -+       */
> >> > -+
> >> > -+      if (ch =3D=3D Pad64) {              /* We got a pad char. */
> >> > -+              ch =3D *src++;            /* Skip it, get next. */
> >> > -+              switch (state) {
> >> > -+              case 0:         /* Invalid =3D in first position */
> >> > -+              case 1:         /* Invalid =3D in second position */
> >> > -+                      return (-1);
> >> > -+
> >> > -+              case 2:         /* Valid, means one byte of info */
> >> > -+                      /* Skip any number of spaces. */
> >> > -+                      for ((void)NULL; ch !=3D '\0'; ch =3D *src++=
)
> >> > -+                              if (!isspace(ch))
> >> > -+                                      break;
> >> > -+                      /* Make sure there is another trailing =3D
> sign. */
> >> > -+                      if (ch !=3D Pad64)
> >> > -+                              return (-1);
> >> > -+                      ch =3D *src++;            /* Skip the =3D */
> >> > -+                      /* Fall through to "single trailing =3D" cas=
e.
> */
> >> > -+                      /* FALLTHROUGH */
> >> > -+
> >> > -+              case 3:         /* Valid, means two bytes of info */
> >> > -+                      /*
> >> > -+                       * We know this char is an =3D.  Is there
> anything but
> >> > -+                       * whitespace after it?
> >> > -+                       */
> >> > -+                      for ((void)NULL; ch !=3D '\0'; ch =3D *src++=
)
> >> > -+                              if (!isspace(ch))
> >> > -+                                      return (-1);
> >> > -+
> >> > -+                      /*
> >> > -+                       * Now make sure for cases 2 and 3 that the
> "extra"
> >> > -+                       * bits that slopped past the last full byte
> were
> >> > -+                       * zeros.  If we don't check them, they
> become a
> >> > -+                       * subliminal channel.
> >> > -+                       */
> >> > -+                      if (target && target[tarindex] !=3D 0)
> >> > -+                              return (-1);
> >> > -+              }
> >> > -+      } else {
> >> > -+              /*
> >> > -+               * We ended by seeing the end of the string.  Make
> sure we
> >> > -+               * have no partial bytes lying around.
> >> > -+               */
> >> > -+              if (state !=3D 0)
> >> > -+                      return (-1);
> >> > -+      }
> >> > -+
> >> > -+      return (tarindex);
> >> > -+}
> >> > -+
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl=
-fixes.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl=
-fixes.patch
> >> > deleted file mode 100644
> >> > index b5d383f38..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl=
-fixes.patch
> >> > +++ /dev/null
> >> > @@ -1,131 +0,0 @@
> >> > -From 62d957a1271c88ec08d67984fbe31601f0bd41a9 Mon Sep 17 00:00:00
> 2001
> >> > -From: Khem Raj <raj.khem@gmail.com>
> >> > -Date: Fri, 15 Sep 2017 15:50:57 -0700
> >> > -Subject: [PATCH] adb: Musl fixes
> >> > -
> >> > -__nonnull is gcc specific
> >> > -include sys/types.h for size_t
> >> > -Do not redefine close() and lseek()
> >> > -
> >> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > ----
> >> > - adb/adb.h                    |  2 ++
> >> > - adb/disable_verity_service.c | 13 ++++++++-----
> >> > - adb/framebuffer_service.c    |  7 ++++---
> >> > - adb/sysdeps.h                | 12 ++++++------
> >> > - 4 files changed, 20 insertions(+), 14 deletions(-)
> >> > -
> >> > -diff --git a/adb/adb.h b/adb/adb.h
> >> > -index 44e5981bdc..bcdc49f63c 100644
> >> > ---- a/adb/adb.h
> >> > -+++ b/adb/adb.h
> >> > -@@ -18,7 +18,9 @@
> >> > - #define __ADB_H
> >> > -
> >> > - #include <limits.h>
> >> > -+#include <sys/types.h>
> >> > -
> >> > -+#include "fdevent.h"
> >> > - #include "adb_trace.h"
> >> > - #include "transport.h"  /* readx(), writex() */
> >> > -
> >> > -diff --git a/adb/disable_verity_service.c
> b/adb/disable_verity_service.c
> >> > -index ed3da52108..29fa3d65a9 100644
> >> > ---- a/adb/disable_verity_service.c
> >> > -+++ b/adb/disable_verity_service.c
> >> > -@@ -14,25 +14,28 @@
> >> > -  * limitations under the License.
> >> > -  */
> >> > -
> >> > --#include "sysdeps.h"
> >> > -
> >> > - #define  TRACE_TAG  TRACE_ADB
> >> > - #include "adb.h"
> >> > -+#include "sysdeps.h"
> >> > -+#include "cutils/properties.h"
> >> > -+#include "ext4_sb.h"
> >> > -+#include <fs_mgr.h>
> >> > -
> >> > - #include <stdio.h>
> >> > - #include <stdarg.h>
> >> > - #include <sys/stat.h>
> >> > - #include <fcntl.h>
> >> > - #include <inttypes.h>
> >> > -+#include <unistd.h>
> >> > -+#include <errno.h>
> >> > -+#include <stdbool.h>
> >> > -
> >> > --#include "cutils/properties.h"
> >> > --#include "ext4_sb.h"
> >> > --#include <fs_mgr.h>
> >> > -
> >> > - #define FSTAB_PREFIX "/fstab."
> >> > - struct fstab *fstab;
> >> > -
> >> > --__attribute__((__format__(printf, 2, 3))) __nonnull((2))
> >> > -+__attribute__((__format__(printf, 2, 3)))
> __attribute__((nonnull((2))))
> >> > - static void write_console(int fd, const char* format, ...)
> >> > - {
> >> > -     char buffer[256];
> >> > -diff --git a/adb/framebuffer_service.c b/adb/framebuffer_service.c
> >> > -index 8cbe8403cc..8f0ccfb7aa 100644
> >> > ---- a/adb/framebuffer_service.c
> >> > -+++ b/adb/framebuffer_service.c
> >> > -@@ -14,6 +14,10 @@
> >> > -  * limitations under the License.
> >> > -  */
> >> > -
> >> > -+#include "fdevent.h"
> >> > -+#include "adb.h"
> >> > -+#include "sysdeps.h"
> >> > -+
> >> > - #include <stdlib.h>
> >> > - #include <stdio.h>
> >> > - #include <unistd.h>
> >> > -@@ -23,9 +27,6 @@
> >> > - #include <sys/types.h>
> >> > - #include <sys/wait.h>
> >> > -
> >> > --#include "fdevent.h"
> >> > --#include "adb.h"
> >> > --
> >> > - #include <linux/fb.h>
> >> > - #include <sys/ioctl.h>
> >> > - #include <sys/mman.h>
> >> > -diff --git a/adb/sysdeps.h b/adb/sysdeps.h
> >> > -index cc1f839e9f..ea39ac39cc 100644
> >> > ---- a/adb/sysdeps.h
> >> > -+++ b/adb/sysdeps.h
> >> > -@@ -123,8 +123,8 @@ static __inline__ int  unix_close(int fd)
> >> > - {
> >> > -     return close(fd);
> >> > - }
> >> > --#undef   close
> >> > --#define  close   ____xxx_close
> >> > -+//#undef   close
> >> > -+//#define  close   ____xxx_close
> >> > -
> >> > - static __inline__  int  unix_read(int  fd, void*  buf, size_t  len=
)
> >> > - {
> >> > -@@ -369,8 +369,8 @@ static __inline__ int  adb_close(int fd)
> >> > - {
> >> > -     return close(fd);
> >> > - }
> >> > --#undef   close
> >> > --#define  close   ____xxx_close
> >> > -+//#undef   close
> >> > -+//#define  close   ____xxx_close
> >> > -
> >> > -
> >> > - static __inline__  int  adb_read(int  fd, void*  buf, size_t  len)
> >> > -@@ -392,8 +392,8 @@ static __inline__ int   adb_lseek(int  fd, int
> pos, int  where)
> >> > - {
> >> > -     return lseek(fd, pos, where);
> >> > - }
> >> > --#undef   lseek
> >> > --#define  lseek   ___xxx_lseek
> >> > -+//#undef   lseek
> >> > -+//#define  lseek   ___xxx_lseek
> >> > -
> >> > - static __inline__  int    adb_unlink(const char*  path)
> >> > - {
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_=
linux.c-fix-build-with-glibc-2.28.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_=
linux.c-fix-build-with-glibc-2.28.patch
> >> > deleted file mode 100644
> >> > index e02a95687..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_=
linux.c-fix-build-with-glibc-2.28.patch
> >> > +++ /dev/null
> >> > @@ -1,24 +0,0 @@
> >> > -From de393bba41c8feff932c77d6c30233945f380d42 Mon Sep 17 00:00:00
> 2001
> >> > -From: Martin Jansa <Martin.Jansa@gmail.com>
> >> > -Date: Sat, 11 Aug 2018 13:23:37 +0000
> >> > -Subject: [PATCH] adb: usb_linux.c: fix build with glibc-2.28
> >> > -
> >> > -* include sysmacros for major, minor
> >> > -
> >> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> > ----
> >> > - adb/usb_linux.c | 1 +
> >> > - 1 file changed, 1 insertion(+)
> >> > -
> >> > -diff --git a/adb/usb_linux.c b/adb/usb_linux.c
> >> > -index f16bdd0361..c8a7732441 100644
> >> > ---- a/adb/usb_linux.c
> >> > -+++ b/adb/usb_linux.c
> >> > -@@ -22,6 +22,7 @@
> >> > - #include <sys/ioctl.h>
> >> > - #include <sys/types.h>
> >> > - #include <sys/time.h>
> >> > -+#include <sys/sysmacros.h>
> >> > - #include <dirent.h>
> >> > - #include <fcntl.h>
> >> > - #include <errno.h>
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allo=
w-adbd-to-be-ran-as-root.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allo=
w-adbd-to-be-ran-as-root.patch
> >> > deleted file mode 100644
> >> > index 7d223e05f..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allo=
w-adbd-to-be-ran-as-root.patch
> >> > +++ /dev/null
> >> > @@ -1,21 +0,0 @@
> >> > -From 3a788e9168c9b9eac66c4fa479413f4a95c61be4 Mon Sep 17 00:00:00
> 2001
> >> > -From: Florent Revest <revestflo@gmail.com>
> >> > -Date: Mon, 30 Oct 2017 21:05:46 +0100
> >> > -Subject: [PATCH] adb: Allow adbd to be ran as root
> >> > -
> >> > ----
> >> > - adb/adb.c | 1 +
> >> > - 1 file changed, 1 insertion(+)
> >> > -
> >> > -diff --git a/adb/adb.c b/adb/adb.c
> >> > -index 027edd9359..e0f7ecde45 100644
> >> > ---- a/adb/adb.c
> >> > -+++ b/adb/adb.c
> >> > -@@ -1271,6 +1271,7 @@ static int should_drop_privileges() {
> >> > -     int secure =3D 0;
> >> > -     char value[PROPERTY_VALUE_MAX];
> >> > -
> >> > -+    return 0;
> >> > -    /* run adbd in secure mode if ro.secure is set and
> >> > -     ** we are not in the emulator
> >> > -     */
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootim=
g-Add-dt-parameter-to-specify-DT-image.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootim=
g-Add-dt-parameter-to-specify-DT-image.patch
> >> > deleted file mode 100644
> >> > index a4dc6e1e3..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootim=
g-Add-dt-parameter-to-specify-DT-image.patch
> >> > +++ /dev/null
> >> > @@ -1,110 +0,0 @@
> >> > -From dd195778a9930b7967b21a3b8eb390b70253dbad Mon Sep 17 00:00:00
> 2001
> >> > -From: David Ng <dave@codeaurora.org>
> >> > -Date: Fri, 27 Jul 2012 17:15:03 -0700
> >> > -Subject: [PATCH] mkbootimg: Add --dt parameter to specify DT image
> >> > -
> >> > -New optional --dt parameter to specify a kernel device
> >> > -tree image.
> >> > -
> >> > -Upstream-Status: Inappropriate
> >> > ----
> >> > - mkbootimg/bootimg.h   |  7 +++++--
> >> > - mkbootimg/mkbootimg.c | 21 +++++++++++++++++++++
> >> > - 2 files changed, 26 insertions(+), 2 deletions(-)
> >> > -
> >> > -diff --git a/mkbootimg/bootimg.h b/mkbootimg/bootimg.h
> >> > -index 9171d85a7b..308c537d6b 100644
> >> > ---- a/mkbootimg/bootimg.h
> >> > -+++ b/mkbootimg/bootimg.h
> >> > -@@ -41,8 +41,8 @@ struct boot_img_hdr
> >> > -
> >> > -     unsigned tags_addr;    /* physical addr for kernel tags */
> >> > -     unsigned page_size;    /* flash page size we assume */
> >> > --    unsigned unused[2];    /* future expansion: should be 0 */
> >> > --
> >> > -+    unsigned dt_size;      /* device tree in bytes */
> >> > -+    unsigned unused;       /* future expansion: should be 0 */
> >> > -     unsigned char name[BOOT_NAME_SIZE]; /* asciiz product name */
> >> > -
> >> > -     unsigned char cmdline[BOOT_ARGS_SIZE];
> >> > -@@ -64,10 +64,13 @@ struct boot_img_hdr
> >> > - ** +-----------------+
> >> > - ** | second stage    | o pages
> >> > - ** +-----------------+
> >> > -+** | device tree     | p pages
> >> > -+** +-----------------+
> >> > - **
> >> > - ** n =3D (kernel_size + page_size - 1) / page_size
> >> > - ** m =3D (ramdisk_size + page_size - 1) / page_size
> >> > - ** o =3D (second_size + page_size - 1) / page_size
> >> > -+** p =3D (dt_size + page_size - 1) / page_size
> >> > - **
> >> > - ** 0. all entities are page_size aligned in flash
> >> > - ** 1. kernel and ramdisk are required (size !=3D 0)
> >> > -diff --git a/mkbootimg/mkbootimg.c b/mkbootimg/mkbootimg.c
> >> > -index fc92b4dc30..658052cdf2 100644
> >> > ---- a/mkbootimg/mkbootimg.c
> >> > -+++ b/mkbootimg/mkbootimg.c
> >> > -@@ -65,6 +65,7 @@ int usage(void)
> >> > -             "       [ --board <boardname> ]\n"
> >> > -             "       [ --base <address> ]\n"
> >> > -             "       [ --pagesize <pagesize> ]\n"
> >> > -+            "       [ --dt <filename> ]\n"
> >> > -             "       -o|--output <filename>\n"
> >> > -             );
> >> > -     return 1;
> >> > -@@ -105,6 +106,8 @@ int main(int argc, char **argv)
> >> > -     char *cmdline =3D "";
> >> > -     char *bootimg =3D 0;
> >> > -     char *board =3D "";
> >> > -+    char *dt_fn =3D 0;
> >> > -+    void *dt_data =3D 0;
> >> > -     unsigned pagesize =3D 2048;
> >> > -     int fd;
> >> > -     SHA_CTX ctx;
> >> > -@@ -158,6 +161,8 @@ int main(int argc, char **argv)
> >> > -                 fprintf(stderr,"error: unsupported page size %d\n"=
,
> pagesize);
> >> > -                 return -1;
> >> > -             }
> >> > -+        } else if(!strcmp(arg, "--dt")) {
> >> > -+            dt_fn =3D val;
> >> > -         } else {
> >> > -             return usage();
> >> > -         }
> >> > -@@ -232,6 +237,14 @@ int main(int argc, char **argv)
> >> > -         }
> >> > -     }
> >> > -
> >> > -+    if(dt_fn) {
> >> > -+        dt_data =3D load_file(dt_fn, &hdr.dt_size);
> >> > -+        if (dt_data =3D=3D 0) {
> >> > -+            fprintf(stderr,"error: could not load device tree imag=
e
> '%s'\n", dt_fn);
> >> > -+            return 1;
> >> > -+        }
> >> > -+    }
> >> > -+
> >> > -     /* put a hash of the contents in the header so boot images can
> be
> >> > -      * differentiated based on their first 2k.
> >> > -      */
> >> > -@@ -242,6 +255,10 @@ int main(int argc, char **argv)
> >> > -     SHA_update(&ctx, &hdr.ramdisk_size, sizeof(hdr.ramdisk_size));
> >> > -     SHA_update(&ctx, second_data, hdr.second_size);
> >> > -     SHA_update(&ctx, &hdr.second_size, sizeof(hdr.second_size));
> >> > -+    if(dt_data) {
> >> > -+        SHA_update(&ctx, dt_data, hdr.dt_size);
> >> > -+        SHA_update(&ctx, &hdr.dt_size, sizeof(hdr.dt_size));
> >> > -+    }
> >> > -     sha =3D SHA_final(&ctx);
> >> > -     memcpy(hdr.id, sha,
> >> > -            SHA_DIGEST_SIZE > sizeof(hdr.id) ? sizeof(hdr.id) :
> SHA_DIGEST_SIZE);
> >> > -@@ -266,6 +283,10 @@ int main(int argc, char **argv)
> >> > -         if(write_padding(fd, pagesize, hdr.second_size)) goto fail=
;
> >> > -     }
> >> > -
> >> > -+    if(dt_data) {
> >> > -+        if(write(fd, dt_data, hdr.dt_size) !=3D (ssize_t)
> hdr.dt_size) goto fail;
> >> > -+        if(write_padding(fd, pagesize, hdr.dt_size)) goto fail;
> >> > -+    }
> >> > -     return 0;
> >> > -
> >> > - fail:
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linu=
x-capability.h-on-linux-systems-too.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linu=
x-capability.h-on-linux-systems-too.patch
> >> > deleted file mode 100644
> >> > index 2c607ff67..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linu=
x-capability.h-on-linux-systems-too.patch
> >> > +++ /dev/null
> >> > @@ -1,23 +0,0 @@
> >> > -From ef743c9c3c7452ae904a5c343ee2b759ab3a87cb Mon Sep 17 00:00:00
> 2001
> >> > -From: =3D?UTF-8?q?Lo=3DC3=3DAFc=3D20Minier?=3D <loic.minier@ubuntu.=
com>
> >> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> >> > -Subject: [PATCH] Use linux/capability.h on linux systems too
> >> > -
> >> > -Upstream-Status: Inappropriate
> >> > ----
> >> > - include/private/android_filesystem_config.h | 2 +-
> >> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> >> > -
> >> > -diff --git a/include/private/android_filesystem_config.h
> b/include/private/android_filesystem_config.h
> >> > -index 2f528b95c8..3e0b00928e 100644
> >> > ---- a/include/private/android_filesystem_config.h
> >> > -+++ b/include/private/android_filesystem_config.h
> >> > -@@ -27,7 +27,7 @@
> >> > - #include <sys/types.h>
> >> > - #include <stdint.h>
> >> > -
> >> > --#ifdef HAVE_ANDROID_OS
> >> > -+#if defined(HAVE_ANDROID_OS) || defined(__linux__)
> >> > - #include <linux/capability.h>
> >> > - #else
> >> > - #include "android_filesystem_capability.h"
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-b=
ionic-specific-calls.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-b=
ionic-specific-calls.patch
> >> > deleted file mode 100644
> >> > index 5b18f461a..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-b=
ionic-specific-calls.patch
> >> > +++ /dev/null
> >> > @@ -1,64 +0,0 @@
> >> > -From 9eff8799831961c0edf6e37e5d4cbf43baa7c748 Mon Sep 17 00:00:00
> 2001
> >> > -From: Fathi Boudra <fabo@debian.org>
> >> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> >> > -Subject: [PATCH] Remove bionic specific calls
> >> > -
> >> > -Upstream-Status: Inappropriate
> >> > ----
> >> > - include/cutils/properties.h | 1 -
> >> > - libcutils/properties.c      | 2 +-
> >> > - liblog/logd_write.c         | 5 +++++
> >> > - 3 files changed, 6 insertions(+), 2 deletions(-)
> >> > -
> >> > -diff --git a/include/cutils/properties.h
> b/include/cutils/properties.h
> >> > -index 798db8b36f..7d01f28d6e 100644
> >> > ---- a/include/cutils/properties.h
> >> > -+++ b/include/cutils/properties.h
> >> > -@@ -19,7 +19,6 @@
> >> > -
> >> > - #include <sys/cdefs.h>
> >> > - #include <stddef.h>
> >> > --#include <sys/system_properties.h>
> >> > - #include <stdint.h>
> >> > -
> >> > - #ifdef __cplusplus
> >> > -diff --git a/libcutils/properties.c b/libcutils/properties.c
> >> > -index b283658aa4..4151e7882c 100644
> >> > ---- a/libcutils/properties.c
> >> > -+++ b/libcutils/properties.c
> >> > -@@ -104,10 +104,10 @@ int32_t property_get_int32(const char *key,
> int32_t default_value) {
> >> > -     return (int32_t)property_get_imax(key, INT32_MIN, INT32_MAX,
> default_value);
> >> > - }
> >> > -
> >> > -+#undef HAVE_LIBC_SYSTEM_PROPERTIES
> >> > - #ifdef HAVE_LIBC_SYSTEM_PROPERTIES
> >> > -
> >> > - #define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
> >> > --#include <sys/_system_properties.h>
> >> > -
> >> > - int property_set(const char *key, const char *value)
> >> > - {
> >> > -diff --git a/liblog/logd_write.c b/liblog/logd_write.c
> >> > -index b2668cedb7..f5a44fe901 100644
> >> > ---- a/liblog/logd_write.c
> >> > -+++ b/liblog/logd_write.c
> >> > -@@ -23,6 +23,7 @@
> >> > - #include <stdlib.h>
> >> > - #include <string.h>
> >> > - #include <sys/stat.h>
> >> > -+#include <sys/syscall.h>
> >> > - #include <sys/types.h>
> >> > - #if (FAKE_LOG_DEVICE =3D=3D 0)
> >> > - #include <sys/socket.h>
> >> > -@@ -205,7 +206,11 @@ static int __write_to_log_kernel(log_id_t
> log_id, struct iovec *vec, size_t nr)
> >> > -     realtime_ts.tv_nsec =3D ts.tv_nsec;
> >> > -
> >> > -     log_id_buf =3D log_id;
> >> > -+#ifdef __BIONIC__
> >> > -     tid =3D gettid();
> >> > -+#else
> >> > -+    tid =3D (pid_t) syscall(__NR_gettid);
> >> > -+#endif
> >> > -
> >> > -     newVec[0].iov_base   =3D (unsigned char *) &log_id_buf;
> >> > -     newVec[0].iov_len    =3D sizeof_log_id_t;
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-impl=
icit-declaration-of-stlcat-strlcopy-function.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-impl=
icit-declaration-of-stlcat-strlcopy-function.patch
> >> > deleted file mode 100644
> >> > index b0feb6592..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-impl=
icit-declaration-of-stlcat-strlcopy-function.patch
> >> > +++ /dev/null
> >> > @@ -1,50 +0,0 @@
> >> > -From cd4525d760c6f88c9bf85f7bf488da79cd0d3264 Mon Sep 17 00:00:00
> 2001
> >> > -From: Fathi Boudra <fabo@debian.org>
> >> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> >> > -Subject: [PATCH] Fix implicit declaration of stlcat/strlcopy
> functions
> >> > -
> >> > -Upstream-Status: Inappropriate
> >> > ----
> >> > - adb/adb.c                | 1 +
> >> > - fs_mgr/fs_mgr_fstab.c    | 2 +-
> >> > - include/cutils/sockets.h | 2 +-
> >> > - 3 files changed, 3 insertions(+), 2 deletions(-)
> >> > -
> >> > -diff --git a/adb/adb.c b/adb/adb.c
> >> > -index e0f7ecde45..aaefd9b401 100644
> >> > ---- a/adb/adb.c
> >> > -+++ b/adb/adb.c
> >> > -@@ -41,6 +41,7 @@
> >> > - #include <sys/prctl.h>
> >> > - #include <getopt.h>
> >> > - #include <selinux/selinux.h>
> >> > -+#include <grp.h>
> >> > - #else
> >> > - #include "usb_vendors.h"
> >> > - #endif
> >> > -diff --git a/fs_mgr/fs_mgr_fstab.c b/fs_mgr/fs_mgr_fstab.c
> >> > -index edd9591164..9ddb4643b5 100644
> >> > ---- a/fs_mgr/fs_mgr_fstab.c
> >> > -+++ b/fs_mgr/fs_mgr_fstab.c
> >> > -@@ -17,7 +17,7 @@
> >> > - #include <ctype.h>
> >> > - #include <stdio.h>
> >> > - #include <stdlib.h>
> >> > --#include <string.h>
> >> > -+#include <bsd/string.h>
> >> > - #include <sys/mount.h>
> >> > -
> >> > - #include "fs_mgr_priv.h"
> >> > -diff --git a/include/cutils/sockets.h b/include/cutils/sockets.h
> >> > -index daf43ec944..d3270c69e7 100644
> >> > ---- a/include/cutils/sockets.h
> >> > -+++ b/include/cutils/sockets.h
> >> > -@@ -19,7 +19,7 @@
> >> > -
> >> > - #include <errno.h>
> >> > - #include <stdlib.h>
> >> > --#include <string.h>
> >> > -+#include <bsd/string.h>
> >> > - #include <stdbool.h>
> >> > -
> >> > - #ifdef HAVE_WINSOCK
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Supp=
ort-riscv64.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Supp=
ort-riscv64.patch
> >> > deleted file mode 100644
> >> > index a8434afba..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Supp=
ort-riscv64.patch
> >> > +++ /dev/null
> >> > @@ -1,189 +0,0 @@
> >> > -From 48ddf4fb999931942c359350fb31cd557514e1c6 Mon Sep 17 00:00:00
> 2001
> >> > -From: Chenxi Mao <maochenxi@eswin.com>
> >> > -Date: Mon, 20 Apr 2020 15:27:22 +0800
> >> > -Subject: [PATCH 1/1] adb: Support riscv64
> >> > -
> >> > ----
> >> > - include/cutils/atomic-inline.h  |   2 +
> >> > - include/cutils/atomic-riscv64.h | 156
> ++++++++++++++++++++++++++++++++
> >> > - 2 files changed, 158 insertions(+)
> >> > - create mode 100644 include/cutils/atomic-riscv64.h
> >> > -
> >> > -diff --git a/include/cutils/atomic-inline.h
> b/include/cutils/atomic-inline.h
> >> > -index a31e913579..b5dc38209c 100644
> >> > ---- a/include/cutils/atomic-inline.h
> >> > -+++ b/include/cutils/atomic-inline.h
> >> > -@@ -55,6 +55,8 @@ extern "C" {
> >> > - #include <cutils/atomic-mips64.h>
> >> > - #elif defined(__mips__)
> >> > - #include <cutils/atomic-mips.h>
> >> > -+#elif defined(__riscv) && __riscv_xlen =3D=3D 64
> >> > -+#include <cutils/atomic-riscv64.h>
> >> > - #else
> >> > - #error atomic operations are unsupported
> >> > - #endif
> >> > -diff --git a/include/cutils/atomic-riscv64.h
> b/include/cutils/atomic-riscv64.h
> >> > -new file mode 100644
> >> > -index 0000000000..2664db5a86
> >> > ---- /dev/null
> >> > -+++ b/include/cutils/atomic-riscv64.h
> >> > -@@ -0,0 +1,156 @@
> >> > -+/*
> >> > -+ * Copyright (C) 2014 The Android Open Source Project
> >> > -+ * All rights reserved.
> >> > -+ *
> >> > -+ * Redistribution and use in source and binary forms, with or
> without
> >> > -+ * modification, are permitted provided that the following
> conditions
> >> > -+ * are met:
> >> > -+ *  * Redistributions of source code must retain the above copyrig=
ht
> >> > -+ *    notice, this list of conditions and the following disclaimer=
.
> >> > -+ *  * Redistributions in binary form must reproduce the above
> copyright
> >> > -+ *    notice, this list of conditions and the following disclaimer
> in
> >> > -+ *    the documentation and/or other materials provided with the
> >> > -+ *    distribution.
> >> > -+ *
> >> > -+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS
> >> > -+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT N=
OT
> >> > -+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNE=
SS
> >> > -+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> >> > -+ * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
> INDIRECT,
> >> > -+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> (INCLUDING,
> >> > -+ * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES=
;
> LOSS
> >> > -+ * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
> CAUSED
> >> > -+ * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> LIABILITY,
> >> > -+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> OUT
> >> > -+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
> OF
> >> > -+ * SUCH DAMAGE.
> >> > -+ */
> >> > -+
> >> > -+#ifndef ANDROID_CUTILS_ATOMIC_RISCV64_H
> >> > -+#define ANDROID_CUTILS_ATOMIC_RISCV64_H
> >> > -+
> >> > -+#include <stdint.h>
> >> > -+
> >> > -+#ifndef ANDROID_ATOMIC_INLINE
> >> > -+#define ANDROID_ATOMIC_INLINE inline __attribute__((always_inline)=
)
> >> > -+#endif
> >> > -+
> >> > -+/*
> >> > -+   TODOAArch64: Revisit the below functions and check for potentia=
l
> >> > -+   optimizations using assembly code or otherwise.
> >> > -+*/
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+void android_compiler_barrier(void)
> >> > -+{
> >> > -+    __asm__ __volatile__ ("" : : : "memory");
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+void android_memory_barrier(void)
> >> > -+{
> >> > -+    __asm__ __volatile__ ("fence rw,rw" : : : "memory");
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+int32_t android_atomic_acquire_load(volatile const int32_t *ptr)
> >> > -+{
> >> > -+    int32_t value =3D *ptr;
> >> > -+    android_memory_barrier();
> >> > -+    return value;
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+int32_t android_atomic_release_load(volatile const int32_t *ptr)
> >> > -+{
> >> > -+    android_memory_barrier();
> >> > -+    return *ptr;
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+void android_atomic_acquire_store(int32_t value, volatile int32_t
> *ptr)
> >> > -+{
> >> > -+    *ptr =3D value;
> >> > -+    android_memory_barrier();
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+void android_atomic_release_store(int32_t value, volatile int32_t
> *ptr)
> >> > -+{
> >> > -+    android_memory_barrier();
> >> > -+    *ptr =3D value;
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+int android_atomic_cas(int32_t old_value, int32_t new_value,
> >> > -+                       volatile int32_t *ptr)
> >> > -+{
> >> > -+    return __sync_val_compare_and_swap(ptr, old_value, new_value)
> !=3D old_value;
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+int android_atomic_acquire_cas(int32_t old_value, int32_t new_valu=
e,
> >> > -+                               volatile int32_t *ptr)
> >> > -+{
> >> > -+    int status =3D android_atomic_cas(old_value, new_value, ptr);
> >> > -+    android_memory_barrier();
> >> > -+    return status;
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+int android_atomic_release_cas(int32_t old_value, int32_t new_valu=
e,
> >> > -+                               volatile int32_t *ptr)
> >> > -+{
> >> > -+    android_memory_barrier();
> >> > -+    return android_atomic_cas(old_value, new_value, ptr);
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+int32_t android_atomic_add(int32_t increment, volatile int32_t *pt=
r)
> >> > -+{
> >> > -+    int32_t prev, status;
> >> > -+    android_memory_barrier();
> >> > -+    do {
> >> > -+        prev =3D *ptr;
> >> > -+        status =3D android_atomic_cas(prev, prev + increment, ptr)=
;
> >> > -+    } while (__builtin_expect(status !=3D 0, 0));
> >> > -+    return prev;
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+int32_t android_atomic_inc(volatile int32_t *addr)
> >> > -+{
> >> > -+    return android_atomic_add(1, addr);
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+int32_t android_atomic_dec(volatile int32_t *addr)
> >> > -+{
> >> > -+    return android_atomic_add(-1, addr);
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+int32_t android_atomic_and(int32_t value, volatile int32_t *ptr)
> >> > -+{
> >> > -+    int32_t prev, status;
> >> > -+    android_memory_barrier();
> >> > -+    do {
> >> > -+        prev =3D *ptr;
> >> > -+        status =3D android_atomic_cas(prev, prev & value, ptr);
> >> > -+    } while (__builtin_expect(status !=3D 0, 0));
> >> > -+    return prev;
> >> > -+}
> >> > -+
> >> > -+extern ANDROID_ATOMIC_INLINE
> >> > -+int32_t android_atomic_or(int32_t value, volatile int32_t *ptr)
> >> > -+{
> >> > -+    int32_t prev, status;
> >> > -+    android_memory_barrier();
> >> > -+    do {
> >> > -+        prev =3D *ptr;
> >> > -+        status =3D android_atomic_cas(prev, prev | value, ptr);
> >> > -+    } while (__builtin_expect(status !=3D 0, 0));
> >> > -+    return prev;
> >> > -+}
> >> > -+
> >> > -+#endif /* ANDROID_CUTILS_ATOMIC_RISCV_H */
> >> > ---
> >> > -2.17.1
> >> > -
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11=
.diff
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11=
.diff
> >> > deleted file mode 100644
> >> > index 3ead649b1..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11=
.diff
> >> > +++ /dev/null
> >> > @@ -1,39 +0,0 @@
> >> > -Description: adb: Make compatible with openssl 1.1
> >> > - OpenSSL version 1.1 brought some API changes which broke the build
> here,
> >> > - fix that by accessing rsa->n (and e) directly, using RSA_get0_key
> instead.
> >> > -Author: Chirayu Desai <chirayudesai1@gmail.com
> >> > -Last-Update: 2016-11-10
> >> > ----
> >> > -This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
> >> > ----
> >> > - system/core/adb/adb_auth_host.c |    5 +++--
> >> > - 1 file changed, 3 insertions(+), 2 deletions(-)
> >> > -
> >> > ---- a/adb/adb_auth_host.c
> >> > -+++ b/adb/adb_auth_host.c
> >> > -@@ -75,6 +75,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
> >> > -     BIGNUM* rem =3D BN_new();
> >> > -     BIGNUM* n =3D BN_new();
> >> > -     BIGNUM* n0inv =3D BN_new();
> >> > -+    BIGNUM* e =3D BN_new();
> >> > -
> >> > -     if (RSA_size(rsa) !=3D RSANUMBYTES) {
> >> > -         ret =3D 0;
> >> > -@@ -82,7 +83,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
> >> > -     }
> >> > -
> >> > -     BN_set_bit(r32, 32);
> >> > --    BN_copy(n, rsa->n);
> >> > -+    RSA_get0_key(rsa, &n, &e, NULL);
> >> > -     BN_set_bit(r, RSANUMWORDS * 32);
> >> > -     BN_mod_sqr(rr, r, n, ctx);
> >> > -     BN_div(NULL, rem, n, r32, ctx);
> >> > -@@ -96,7 +97,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
> >> > -         BN_div(n, rem, n, r32, ctx);
> >> > -         pkey->n[i] =3D BN_get_word(rem);
> >> > -     }
> >> > --    pkey->exponent =3D BN_get_word(rsa->e);
> >> > -+    pkey->exponent =3D BN_get_word(e);
> >> > -
> >> > - out:
> >> > -     BN_free(n0inv);
> >> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/
> ext4_utils.mk b/meta-oe/recipes-devtools/android-tools/android-tools/
> ext4_utils.mk
> >> > deleted file mode 100644
> >> > index c18aa9c4d..000000000
> >> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/
> ext4_utils.mk
> >> > +++ /dev/null
> >> > @@ -1,103 +0,0 @@
> >> > -# Makefile for ext4_utils
> >> > -
> >> > -SRCDIR ?=3D $(S)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils
> >> > -make_ext4fs_SRC_FILES +=3D make_ext4fs_main.c
> >> > -make_ext4fs_SRC_FILES +=3D canned_fs_config.c
> >> > -make_ext4fs_OBJS :=3D $(make_ext4fs_SRC_FILES:.c=3D.o)
> >> > -
> >> > -ext2simg_SRC_FILES +=3D ext2simg.c
> >> > -ext2simg_OBJS :=3D $(ext2simg_SRC_FILES:.c=3D.o)
> >> > -
> >> > -ext4fixup_SRC_FILES +=3D ext4fixup_main.c
> >> > -ext4fixup_OBJS :=3D $(ext4fixup_SRC_FILES:.c=3D.o)
> >> > -
> >> > -libext4_utils_SRC_FILES +=3D make_ext4fs.c
> >> > -libext4_utils_SRC_FILES +=3D ext4fixup.c
> >> > -libext4_utils_SRC_FILES +=3D ext4_utils.c
> >> > -libext4_utils_SRC_FILES +=3D allocate.c
> >> > -libext4_utils_SRC_FILES +=3D contents.c
> >> > -libext4_utils_SRC_FILES +=3D extent.c
> >> > -libext4_utils_SRC_FILES +=3D indirect.c
> >> > -libext4_utils_SRC_FILES +=3D uuid.c
> >> > -libext4_utils_SRC_FILES +=3D sha1.c
> >> > -libext4_utils_SRC_FILES +=3D wipe.c
> >> > -libext4_utils_SRC_FILES +=3D crc16.c
> >> > -libext4_utils_SRC_FILES +=3D ext4_sb.c
> >> > -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/libsparse
> >> > -simg2img_SRC_FILES +=3D simg2img.c
> >> > -simg2img_SRC_FILES +=3D sparse_crc32.c
> >> > -simg2img_OBJS :=3D $(simg2img_SRC_FILES:.c=3D.o)
> >> > -
> >> > -img2simg_SRC_FILES +=3D img2simg.c
> >> > -img2simg_OBJS :=3D $(img2simg_SRC_FILES:.c=3D.o)
> >> > -
> >> > -simg2simg_SRC_FILES +=3D simg2simg.c
> >> > -simg2simg_SRC_FILES +=3D sparse_crc32.c
> >> > -simg2simg_OBJS :=3D $(simg2simg_SRC_FILES:.c=3D.o)
> >> > -
> >> > -libsparse_SRC_FILES +=3D backed_block.c
> >> > -libsparse_SRC_FILES +=3D output_file.c
> >> > -libsparse_SRC_FILES +=3D sparse.c
> >> > -libsparse_SRC_FILES +=3D sparse_crc32.c
> >> > -libsparse_SRC_FILES +=3D sparse_err.c
> >> > -libsparse_SRC_FILES +=3D sparse_read.c
> >> > -libsparse_OBJS :=3D $(libsparse_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/external/libselinux/src
> >> > -libselinux_SRC_FILES +=3D callbacks.c
> >> > -libselinux_SRC_FILES +=3D check_context.c
> >> > -libselinux_SRC_FILES +=3D freecon.c
> >> > -libselinux_SRC_FILES +=3D init.c
> >> > -libselinux_SRC_FILES +=3D label.c
> >> > -libselinux_SRC_FILES +=3D label_file.c
> >> > -libselinux_SRC_FILES +=3D label_android_property.c
> >> > -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)
> >> > -
> >> > -CFLAGS +=3D -DANDROID
> >> > -CFLAGS +=3D -DHOST
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/include
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include
> >> > -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include
> >> > -CFLAGS +=3D -include
> $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> >> > -
> >> > -all: make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg
> >> > -
> >> > -make_ext4fs: libext4_utils.a libsparse.a libselinux.a
> $(make_ext4fs_OBJS)
> >> > -       $(CC) -o $@ $(LDFLAGS) $(make_ext4fs_OBJS) \
> >> > -               libext4_utils.a libsparse.a libselinux.a -lz -lpcre
> >> > -
> >> > -ext2simg: libext4_utils.a libselinux.a libsparse.a $(ext2simg_OBJS)
> >> > -       $(CC) -o $@ $(LDFLAGS) $(ext2simg_OBJS) \
> >> > -               libext4_utils.a libselinux.a libsparse.a -lz -lpcre
> >> > -
> >> > -ext4fixup: libext4_utils.a libsparse.a $(ext4fixup_OBJS)
> >> > -       $(CC) -o $@ $(LDFLAGS) $(ext4fixup_OBJS) libext4_utils.a
> libsparse.a -lz
> >> > -
> >> > -simg2img: libsparse.a $(simg2img_OBJS)
> >> > -       $(CC) -o $@ $(LDFLAGS) $(simg2img_OBJS) libsparse.a -lz
> >> > -
> >> > -img2simg: libsparse.a $(img2simg_OBJS)
> >> > -       $(CC) -o $@ $(LDFLAGS) $(img2simg_OBJS) libsparse.a -lz
> >> > -
> >> > -simg2simg: libsparse.a $(simg2simg_OBJS)
> >> > -       $(CC) -o $@ $(LDFLAGS) $(simg2simg_OBJS) libsparse.a -lz
> >> > -
> >> > -libext4_utils.a: $(libext4_utils_OBJS)
> >> > -       $(AR) rcs $@ $(libext4_utils_OBJS)
> >> > -
> >> > -libsparse.a: $(libsparse_OBJS)
> >> > -       $(AR) rcs $@ $(libsparse_OBJS)
> >> > -
> >> > -libselinux.a: $(libselinux_OBJS)
> >> > -       $(AR) rcs $@ $(libselinux_OBJS)
> >> > -
> >> > -clean:
> >> > -       $(RM) $(make_ext4fs_OBJS) $(ext2simg_OBJS) $(ext4fixup_OBJS)=
 \
> >> > -               $(simg2img_OBJS) $(img2simg_OBJS) $(simg2simg_OBJS) =
\
> >> > -               $(libext4_utils_OBJS) $(libsparse_OBJS)
> $(libselinux_OBJS) \
> >> > -               make_ext4fs ext2simg ext4fixup simg2img img2simg
> simg2simg *.a
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_u=
tils-remove-selinux-extensions.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_u=
tils-remove-selinux-extensions.patch
> >> > deleted file mode 100644
> >> > index 4a19a5d65..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_u=
tils-remove-selinux-extensions.patch
> >> > +++ /dev/null
> >> > @@ -1,39 +0,0 @@
> >> > -From 354604da9d152f1931e91991d3f34197fc8fc759 Mon Sep 17 00:00:00
> 2001
> >> > -From: Sergio Schvezov <sergio.schvezov@canonical.com>
> >> > -Date: Tue, 2 Oct 2018 16:36:54 +0000
> >> > -Subject: [PATCH] ext4_utils: remove selinux extensions
> >> > -
> >> > -* drop useless includes of Android SELINUX extensions
> >> > -* avoids having to clone another module
> >> > -* this should be sent upstream
> >> > -
> >> > -Upstream-Status: Inappropriate
> >> > ----
> >> > - ext4_utils/make_ext4fs.c      | 1 -
> >> > - ext4_utils/make_ext4fs_main.c | 1 -
> >> > - 2 files changed, 2 deletions(-)
> >> > -
> >> > -diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c
> >> > -index 2f89ae8a0..732afbed7 100644
> >> > ---- a/ext4_utils/make_ext4fs.c
> >> > -+++ b/ext4_utils/make_ext4fs.c
> >> > -@@ -62,7 +62,6 @@
> >> > -
> >> > - #include <selinux/selinux.h>
> >> > - #include <selinux/label.h>
> >> > --#include <selinux/android.h>
> >> > -
> >> > - #define O_BINARY 0
> >> > -
> >> > -diff --git a/ext4_utils/make_ext4fs_main.c
> b/ext4_utils/make_ext4fs_main.c
> >> > -index a6c5f6160..f8e7b9da9 100644
> >> > ---- a/ext4_utils/make_ext4fs_main.c
> >> > -+++ b/ext4_utils/make_ext4fs_main.c
> >> > -@@ -32,7 +32,6 @@
> >> > - #ifndef USE_MINGW
> >> > - #include <selinux/selinux.h>
> >> > - #include <selinux/label.h>
> >> > --#include <selinux/android.h>
> >> > - #else
> >> > - struct selabel_handle;
> >> > - #endif
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_u=
tils-add-o-argument-to-preserve-ownership.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_u=
tils-add-o-argument-to-preserve-ownership.patch
> >> > deleted file mode 100644
> >> > index 3b50ffbf3..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_u=
tils-add-o-argument-to-preserve-ownership.patch
> >> > +++ /dev/null
> >> > @@ -1,78 +0,0 @@
> >> > -From b9254539811ce912bfd16dd1d185eba7a10cceff Mon Sep 17 00:00:00
> 2001
> >> > -From: Markus Mayer <mmayer@mmayer.net>
> >> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> >> > -Subject: [PATCH] ext4_utils: add -o argument to preserve ownership
> >> > -
> >> > -See also https://android-review.googlesource.com/#/c/100312/
> >> > -
> >> > -Upstream-Status: Inappropriate
> >> > ----
> >> > - ext4_utils/make_ext4fs.c      |  6 ++++++
> >> > - ext4_utils/make_ext4fs_main.c | 10 ++++++++--
> >> > - 2 files changed, 14 insertions(+), 2 deletions(-)
> >> > -
> >> > -diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c
> >> > -index 732afbed7..2cbf04399 100644
> >> > ---- a/ext4_utils/make_ext4fs.c
> >> > -+++ b/ext4_utils/make_ext4fs.c
> >> > -@@ -67,6 +67,8 @@
> >> > -
> >> > - #endif
> >> > -
> >> > -+int preserve_owner =3D 0;
> >> > -+
> >> > - /* TODO: Not implemented:
> >> > -    Allocating blocks in the same block group as the file inode
> >> > -    Hash or binary tree directories
> >> > -@@ -185,6 +187,10 @@ static u32 build_directory_structure(const cha=
r
> *full_path, const char *dir_path
> >> > -               } else {
> >> > -                       dentries[i].mtime =3D fixed_time;
> >> > -               }
> >> > -+              if (preserve_owner) {
> >> > -+                      dentries[i].uid =3D stat.st_uid;
> >> > -+                      dentries[i].gid =3D stat.st_gid;
> >> > -+              }
> >> > -               uint64_t capabilities;
> >> > -               if (fs_config_func !=3D NULL) {
> >> > - #ifdef ANDROID
> >> > -diff --git a/ext4_utils/make_ext4fs_main.c
> b/ext4_utils/make_ext4fs_main.c
> >> > -index f8e7b9da9..e82d43277 100644
> >> > ---- a/ext4_utils/make_ext4fs_main.c
> >> > -+++ b/ext4_utils/make_ext4fs_main.c
> >> > -@@ -47,13 +47,15 @@ struct selabel_handle;
> >> > - extern struct fs_info info;
> >> > -
> >> > -
> >> > -+extern int preserve_owner;
> >> > -+
> >> > - static void usage(char *path)
> >> > - {
> >> > -       fprintf(stderr, "%s [ -l <len> ] [ -j <journal size> ] [ -b
> <block_size> ]\n", basename(path));
> >> > -       fprintf(stderr, "    [ -g <blocks per group> ] [ -i <inodes>
> ] [ -I <inode size> ]\n");
> >> > -       fprintf(stderr, "    [ -L <label> ] [ -f ] [ -a <android
> mountpoint> ]\n");
> >> > -       fprintf(stderr, "    [ -S file_contexts ] [ -C fs_config ] [
> -T timestamp ]\n");
> >> > --      fprintf(stderr, "    [ -z | -s ] [ -w ] [ -c ] [ -J ] [ -v ]
> [ -B <block_list_file> ]\n");
> >> > -+      fprintf(stderr, "    [ -z | -s ] [ -w ] [ -c ] [ -J ] [ -o ]
> [ -v ] [ -B <block_list_file> ]\n");
> >> > -       fprintf(stderr, "    <filename> [<directory>]\n");
> >> > - }
> >> > -
> >> > -@@ -79,7 +81,7 @@ int main(int argc, char **argv)
> >> > -       struct selinux_opt seopts[] =3D { { SELABEL_OPT_PATH, "" } }=
;
> >> > - #endif
> >> > -
> >> > --      while ((opt =3D getopt(argc, argv,
> "l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctv")) !=3D -1) {
> >> > -+      while ((opt =3D getopt(argc, argv,
> "l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctov")) !=3D -1) {
> >> > -               switch (opt) {
> >> > -               case 'l':
> >> > -                       info.len =3D parse_num(optarg);
> >> > -@@ -142,6 +144,10 @@ int main(int argc, char **argv)
> >> > -                       }
> >> > - #endif
> >> > -                       break;
> >> > -+              case 'o':
> >> > -+                      preserve_owner =3D 1;
> >> > -+                      printf("Warning: Enabling 'preserve
> ownership', this is an unofficial feature!\n");
> >> > -+                      break;
> >> > -               case 'v':
> >> > -                       verbose =3D 1;
> >> > -                       break;
> >> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/
> fastboot.mk b/meta-oe/recipes-devtools/android-tools/android-tools/
> fastboot.mk
> >> > deleted file mode 100644
> >> > index b9ba95f38..000000000
> >> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/
> fastboot.mk
> >> > +++ /dev/null
> >> > @@ -1,89 +0,0 @@
> >> > -# Makefile for fastboot
> >> > -
> >> > -SRCDIR ?=3D $(S)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/fastboot
> >> > -fastboot_SRC_FILES +=3D protocol.c
> >> > -fastboot_SRC_FILES +=3D engine.c
> >> > -fastboot_SRC_FILES +=3D bootimg.c
> >> > -fastboot_SRC_FILES +=3D fastboot.c
> >> > -fastboot_SRC_FILES +=3D util.c
> >> > -fastboot_SRC_FILES +=3D fs.c
> >> > -fastboot_SRC_FILES +=3D usb_linux.c
> >> > -fastboot_SRC_FILES +=3D util_linux.c
> >> > -fastboot_OBJS :=3D $(fastboot_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/libzipfile
> >> > -libzipfile_SRC_FILES +=3D centraldir.c
> >> > -libzipfile_SRC_FILES +=3D zipfile.c
> >> > -libzipfile_OBJS :=3D $(libzipfile_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils
> >> > -libext4_utils_SRC_FILES +=3D make_ext4fs.c
> >> > -libext4_utils_SRC_FILES +=3D ext4fixup.c
> >> > -libext4_utils_SRC_FILES +=3D ext4_utils.c
> >> > -libext4_utils_SRC_FILES +=3D allocate.c
> >> > -libext4_utils_SRC_FILES +=3D contents.c
> >> > -libext4_utils_SRC_FILES +=3D extent.c
> >> > -libext4_utils_SRC_FILES +=3D indirect.c
> >> > -libext4_utils_SRC_FILES +=3D uuid.c
> >> > -libext4_utils_SRC_FILES +=3D sha1.c
> >> > -libext4_utils_SRC_FILES +=3D wipe.c
> >> > -libext4_utils_SRC_FILES +=3D crc16.c
> >> > -libext4_utils_SRC_FILES +=3D ext4_sb.c
> >> > -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/libsparse
> >> > -libsparse_SRC_FILES +=3D backed_block.c
> >> > -libsparse_SRC_FILES +=3D output_file.c
> >> > -libsparse_SRC_FILES +=3D sparse.c
> >> > -libsparse_SRC_FILES +=3D sparse_crc32.c
> >> > -libsparse_SRC_FILES +=3D sparse_err.c
> >> > -libsparse_SRC_FILES +=3D sparse_read.c
> >> > -libsparse_OBJS :=3D $(libsparse_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/external/libselinux/src
> >> > -libselinux_SRC_FILES +=3D callbacks.c
> >> > -libselinux_SRC_FILES +=3D check_context.c
> >> > -libselinux_SRC_FILES +=3D freecon.c
> >> > -libselinux_SRC_FILES +=3D init.c
> >> > -libselinux_SRC_FILES +=3D label.c
> >> > -libselinux_SRC_FILES +=3D label_file.c
> >> > -libselinux_SRC_FILES +=3D label_android_property.c
> >> > -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)
> >> > -
> >> > -CFLAGS +=3D -std=3Dgnu11
> >> > -CFLAGS +=3D -DANDROID
> >> > -# CFLAGS +=3D -DUSE_F2FS
> >> > -CFLAGS +=3D -DHOST
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/fastboot
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/include
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/mkbootimg
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/extras/f2fs_utils
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include
> >> > -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include
> >> > -CFLAGS +=3D -include
> $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> >> > -
> >> > -LIBS +=3D libzipfile.a libext4_utils.a libsparse.a libselinux.a -lz
> -lpcre
> >> > -
> >> > -all: fastboot
> >> > -
> >> > -fastboot: libzipfile.a libext4_utils.a libsparse.a libselinux.a
> $(fastboot_OBJS)
> >> > -       $(CC) -o $@ $(LDFLAGS) $(fastboot_OBJS) $(LIBS)
> >> > -
> >> > -libzipfile.a: $(libzipfile_OBJS)
> >> > -       $(AR) rcs $@ $(libzipfile_OBJS)
> >> > -
> >> > -libext4_utils.a: $(libext4_utils_OBJS)
> >> > -       $(AR) rcs $@ $(libext4_utils_OBJS)
> >> > -
> >> > -libsparse.a: $(libsparse_OBJS)
> >> > -       $(AR) rcs $@ $(libsparse_OBJS)
> >> > -
> >> > -libselinux.a: $(libselinux_OBJS)
> >> > -       $(AR) rcs $@ $(libselinux_OBJS)
> >> > -
> >> > -clean:
> >> > -       $(RM) $(fastboot_OBJS) $(libzipfile_OBJS)
> $(libext4_utils_OBJS) \
> >> > -               $(libsparse_OBJS) $(libselinux_OBJS) fastboot *.a
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_r=
emove_gtest.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_r=
emove_gtest.patch
> >> > new file mode 100644
> >> > index 000000000..a04f27f10
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_r=
emove_gtest.patch
> >> > @@ -0,0 +1,51 @@
> >> > +socket.h: removing dependency of gtest
> >> > +
> >> > +Removed the dependency of gtest on the build of fastboot binary.
> >> > +Fixes below error
> >> > +
> >> > +In file included from fastboot/fastboot.cpp:70:
> >> > +| In file included from fastboot/tcp.h:36:
> >> > +| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file
> not found
> >> > +| #include <gtest/gtest_prod.h>
> >> > +|          ^~~~~~~~~~~~~~~~~~~~
> >> > +| 1 error generated.
> >> > +| In file included from fastboot/socket.cpp:29:
> >> > +| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file
> not found
> >> > +| #include <gtest/gtest_prod.h>
> >> > +|          ^~~~~~~~~~~~~~~~~~~~
> >> > +| 1 error generated.
> >> > +| In file included from fastboot/tcp.cpp:29:
> >> > +| In file included from fastboot/tcp.h:36:
> >> > +| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file
> not found
> >> > +| #include <gtest/gtest_prod.h>
> >> > +|          ^~~~~~~~~~~~~~~~~~~~
> >> > +| 1 error generated.
> >> > +| In file included from fastboot/udp.cpp:31:
> >> > +| In file included from fastboot/udp.h:34:
> >> > +| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file
> not found
> >> > +| #include <gtest/gtest_prod.h>
> >> > +|          ^~~~~~~~~~~~~~~~~~~~
> >> > +| 1 error generated.
> >> > +
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +--- a/system/core/fastboot/socket.h       2021-04-14
> 21:14:00.355973915 +0000
> >> > ++++ b/system/core/fastboot/socket.h   2021-04-14 21:14:21.879680699
> +0000
> >> > +@@ -40,7 +40,6 @@
> >> > +
> >> > + #include <android-base/macros.h>
> >> > + #include <cutils/sockets.h>
> >> > +-#include <gtest/gtest_prod.h>
> >> > +
> >> > + // Socket interface to be implemented for each platform.
> >> > + class Socket {
> >> > +@@ -119,8 +118,6 @@
> >> > +             socket_send_buffers_function_ =3D &socket_send_buffers=
;
> >> > +
> >> > +   private:
> >> > +-    FRIEND_TEST(SocketTest, TestTcpSendBuffers);
> >> > +-    FRIEND_TEST(SocketTest, TestUdpSendBuffers);
> >> > +
> >> > +     DISALLOW_COPY_AND_ASSIGN(Socket);
> >> > + };
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change=
_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change=
_out_dir.patch
> >> > new file mode 100644
> >> > index 000000000..c8904f045
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change=
_out_dir.patch
> >> > @@ -0,0 +1,52 @@
> >> > +patching fastboot.mk to build in yocto environment.
> >> > +
> >> > +Changes include:
> >> > +Introduced an output folder which will keep all the outputs from th=
e
> >> > +android-tools.
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary to the OUT_DI=
R
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +Upstream-Status: Pending
> >> > +
> >> > +--- git/system/core/debian/fastboot.mk 2021-05-17
> 07:47:56.800224043 +0000
> >> > ++++ git/system/core/debian/fastboot.mk 2021-05-17
> 07:49:40.130383096 +0000
> >> > +@@ -1,3 +1,4 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME =3D fastboot
> >> > + fastboot_SOURCES =3D \
> >> > +           bootimg_utils.cpp \
> >> > +@@ -38,11 +39,11 @@
> >> > +             -Ifs_mgr/liblp/include \
> >> > +             -I/usr/include/android/openssl \
> >> > +             -Ilibsparse/include \
> >> > +-            -Ilibziparchive/include
> >> > ++            -Ilibziparchive/include -I$(OUT_DIR)/usr/include/
> >> > + LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +            -fuse-ld=3Dgold \
> >> > +-           -Wl,-rpath-link=3D. \
> >> > +-           -L. -lziparchive -lsparse -lbase -lcutils -ladb -lcrypt=
o
> -lext4_utils \
> >> > ++
>  -Wl,-rpath-link=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -lziparchive -lsparse -lbase -lcutils -ladb -lcrypto -lext4_utils \
> >> > +            -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +            -l7z \
> >> > +
> >> > +@@ -53,7 +54,8 @@
> >> > + endif
> >> > +
> >> > + build: $(SOURCES)
> >> > +-      $(CXX) $^ -o fastboot/$(NAME) $(CXXFLAGS) $(CPPFLAGS)
> $(LDFLAGS)
> >> > ++      mkdir --parents $(OUT_DIR)/usr/bin/fastboot
> >> > ++      $(CXX) $^ -o $(OUT_DIR)/usr/bin/fastboot/$(NAME) $(CXXFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> >> > +
> >> > + clean:
> >> > +-      $(RM) fastboot/$(NAME)
> >> > ++      $(RM) $(OUT_DIR)/usr/bin/fastboot/$(NAME)
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/gitignore
> b/meta-oe/recipes-devtools/android-tools/android-tools/gitignore
> >> > deleted file mode 100644
> >> > index b034c10a1..000000000
> >> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/gitignore
> >> > +++ /dev/null
> >> > @@ -1,59 +0,0 @@
> >> > -*
> >> > -!.gitignore
> >> > -!*.indirectionsymlink
> >> > -!*.[ch]
> >> > -!*.mk
> >> > -!*.patch
> >> > -!*.service
> >> > -!NOTICE
> >> > -!MODULE_LICENSE_*
> >> > -!/system/
> >> > -!/system/core/
> >> > -!/system/core/adb/
> >> > -!/system/core/fastboot/
> >> > -!/system/core/fs_mgr/
> >> > -!/system/core/fs_mgr/include/
> >> > -!/system/core/include/
> >> > -!/system/core/include/android/
> >> > -!/system/core/include/cutils/
> >> > -!/system/core/include/log/
> >> > -!/system/core/include/mincrypt/
> >> > -!/system/core/include/private/
> >> > -!/system/core/include/utils/
> >> > -!/system/core/include/zipfile/
> >> > -!/system/core/liblog/
> >> > -!/system/core/liblog/tests/
> >> > -!/system/core/libcutils/
> >> > -!/system/core/libmincrypt/
> >> > -!/system/core/libzipfile/
> >> > -!/system/core/libsparse/
> >> > -!/system/core/libsparse/include/
> >> > -!/system/core/libsparse/include/sparse/
> >> > -!/system/core/libsparse/simg_dump.py
> >> > -!/system/core/mkbootimg/
> >> > -!/system/extras/
> >> > -!/system/extras/ext4_utils/
> >> > -!/system/extras/ext4_utils/mkuserimg.sh
> >> > -!/system/extras/ext4_utils/test_ext4fixup
> >> > -!/system/extras/f2fs_utils/
> >> > -!/hardware/
> >> > -!/hardware/libhardware/
> >> > -!/hardware/libhardware/include/
> >> > -!/hardware/libhardware/include/hardware/
> >> > -!/external/
> >> > -!/external/libselinux/
> >> > -!/external/libselinux/include/
> >> > -!/external/libselinux/include/selinux/
> >> > -!/external/libselinux/src/
> >> > -!/external/f2fs-tools/
> >> > -!/external/f2fs-tools/include/
> >> > -!/external/f2fs-tools/lib/
> >> > -!/external/f2fs-tools/mkfs/
> >> > -!/build/
> >> > -!/build/core/
> >> > -!/build/core/version_defaults.mk
> >> > -!/build/core/combo/
> >> > -!/build/core/combo/include/
> >> > -!/build/core/combo/include/arch/
> >> > -!/build/core/combo/include/arch/linux-*/
> >> > -!/build/core/combo/include/arch/linux-*/AndroidConfig.h
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_ou=
t_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_ou=
t_dir.patch
> >> > new file mode 100644
> >> > index 000000000..6913c4b98
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_ou=
t_dir.patch
> >> > @@ -0,0 +1,41 @@
> >> > +patching img2simg.mk to build in yocto environment.
> >> > +
> >> > +Changes include:
> >> > +Introduced an output folder which will keep all the outputs from th=
e
> >> > +android-tools.
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary to the OUT_DI=
R
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +Upstream-Status: Pending
> >> > +
> >> > +--- git/system/core/debian/img2simg.mk 2021-05-12
> 09:05:38.580607289 +0000
> >> > ++++ git/system/core/debian/img2simg.mk 2021-05-12
> 09:09:04.331908253 +0000
> >> > +@@ -1,13 +1,14 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME =3D img2simg
> >> > + SOURCES =3D img2simg.cpp
> >> > + SOURCES :=3D $(foreach source, $(SOURCES), libsparse/$(source))
> >> > + CPPFLAGS +=3D -Ilibsparse/include -Iinclude -std=3Dgnu++17
> >> > +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +-           -Wl,-rpath-link=3D. \
> >> > +-           -L. -lsparse
> >> > ++LDFLAGS +=3D
> -Wl,-rpath=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > ++
>  -Wl,-rpath-link=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
> >> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/
> -lsparse
> >> > +
> >> > + build: $(SOURCES)
> >> > +-      $(CXX) $^ -o libsparse/$(NAME) $(CPPFLAGS) $(LDFLAGS)
> >> > ++      $(CXX) $^ -o $(OUT_DIR)/usr/bin/$(NAME) $(CPPFLAGS) $(LDFLAG=
S)
> >> > +
> >> > + clean:
> >> > +-      $(RM) libsparse/$(NAME)
> >> > ++      $(RM) $(OUT_DIR)/usr/bin/$(NAME)
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_o=
ut_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_o=
ut_dir.patch
> >> > new file mode 100644
> >> > index 000000000..7094ccaa9
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_o=
ut_dir.patch
> >> > @@ -0,0 +1,44 @@
> >> > +libadb.mk: modifications to make it build in yocto environment
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary to the OUT_DI=
R
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +--- git/system/core/debian/libadb.mk   2021-04-30
> 16:29:34.596618862 +0200
> >> > ++++ git/system/core/debian/libadb.mk   2021-04-30
> 16:36:53.932837490 +0200
> >> > +@@ -1,3 +1,4 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME :=3D libadb
> >> > +
> >> > + LIBADB_SRC_FILES :=3D \
> >> > +@@ -43,18 +44,18 @@
> >> > +             -Ibase/include \
> >> > +             -Idiagnose_usb/include \
> >> > +             -Ilibcrypto_utils/include \
> >> > +-            -Iinclude \
> >> > ++            -Iinclude -I$(OUT_DIR)/usr/include \
> >> > +             -DPLATFORM_TOOLS_VERSION=3D'"$(PLATFORM_TOOLS_VERSION)=
"' \
> >> > +             -DADB_HOST=3D1 -DADB_VERSION=3D'"$(DEB_VERSION)"'
> >> > +
> >> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> >> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android -lcrypto \
> >> > +-           -lpthread -L. -lbase -lcutils -lcrypto_utils -lusb-1.0
> >> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -lcrypto \
> >> > ++           -lpthread -lbase -lcutils -lcrypto_utils -lusb-1.0
> >> > +
> >> > + $(NAME).so: $(SOURCES)
> >> > +-      $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 $(NAME).so
> >> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> >> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> >> > +
> >> > + transport_mdns_unsupported.cpp:
> >> > +       echo 'void init_mdns_transport_discovery(void) {}' >
> transport_mdns_unsupported.cpp
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_ch=
ange_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_ch=
ange_out_dir.patch
> >> > new file mode 100644
> >> > index 000000000..464b63de2
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_ch=
ange_out_dir.patch
> >> > @@ -0,0 +1,60 @@
> >> > +patching libbacktrace.mk to build in yocto environment.
> >> > +
> >> > +Changes include:
> >> > +Introduced an output folder which will keep all the outputs from th=
e
> >> > +android-tools.
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary to the OUT_DI=
R
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +Upstream-Status: Pending
> >> > +
> >> > +--- git/system/core/debian/libbacktrace.mk     2021-05-21
> 23:51:55.022408433 +0000
> >> > ++++ git/system/core/debian/libbacktrace.mk     2021-05-21
> 23:53:07.487543521 +0000
> >> > +@@ -1,5 +1,6 @@
> >> > +-
> >> > +-include /usr/share/dpkg/architecture.mk
> >> > ++include ../../rules_yocto.mk
> >> > ++#pass architecture specific info to makefile
> >> > ++DEB_HOST_ARCH=3D${deb_host_arch}
> >> > +
> >> > + NAME =3D libbacktrace
> >> > +
> >> > +@@ -88,11 +89,11 @@
> >> > +             -Ilibprocinfo/include \
> >> > +             -Ilibunwindstack/include \
> >> > +             -I/usr/include/android/lzma \
> >> > +-            -I/usr/include/android/unwind
> >> > ++            -I$(OUT_DIR)/usr/include/android/libunwind
> >> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> >> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android -lunwind \
> >> > +-           -L. -lbase -llog -lpthread -l7z
> >> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -lunwind \
> >> > ++           -lbase -llog -lpthread -l7z
> >> > +
> >> > + # -latomic should be the last library specified
> >> > + # https://github.com/android/ndk/issues/589
> >> > +@@ -104,11 +105,11 @@
> >> > + endif
> >> > +
> >> > + build: $(COBJECTS) $(CXXOBJECTS) $(OBJECTS_ASSEMBLY)
> >> > +-      $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 $(NAME).so
> >> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
> >> > ++      ln -s
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(NAME).so
> >> > +
> >> > + clean:
> >> > +-      $(RM) $(COBJECTS) $(CXXOBJECTS) $(NAME).so*
> >> > ++      $(RM) $(COBJECTS) $(CXXOBJECTS)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> >> > +
> >> > + $(CXXOBJECTS): %.o: %.cpp
> >> > +       $(CXX) $< -o $@ $(CXXFLAGS) $(CPPFLAGS)
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_=
out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_=
out_dir.patch
> >> > new file mode 100644
> >> > index 000000000..37c93d6d0
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_=
out_dir.patch
> >> > @@ -0,0 +1,33 @@
> >> > +libbase.mk: modifications to make it build in yocto environment
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary to the OUT_DI=
R
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +--- git/system/core/debian/libbase.mk  2021-04-29
> 22:01:13.664181133 +0200
> >> > ++++ git/system/core/debian/libbase.mk  2021-04-29
> 22:04:52.328123833 +0200
> >> > +@@ -1,3 +1,4 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME =3D libbase
> >> > + SOURCES =3D \
> >> > +           chrono_utils.cpp \
> >> > +@@ -20,8 +21,9 @@
> >> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0
> >> > +
> >> > + build: $(SOURCES)
> >> > +-      $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 $(NAME).so
> >> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> >> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> >> > ++      cp -r base/include/* $(OUT_DIR)/usr/include/
> >> > +
> >> > + clean:
> >> > +-      $(RM) $(NAME).so*
> >> > ++      $(RM)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_chang=
e_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_chang=
e_out_dir.patch
> >> > new file mode 100644
> >> > index 000000000..f70590977
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_chang=
e_out_dir.patch
> >> > @@ -0,0 +1,30 @@
> >> > +libcrypto.mk: modifications to make it build in yocto environment
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +
> >> > +Modified the build rule so that it outputs the binary and include
> >> > +to the OUT_DIR
> >> > +
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +--- git/external/boringssl/debian/libcrypto.mk 2021-04-30
> 11:32:40.610312307 +0000
> >> > ++++ git/external/boringssl/debian/libcrypto.mk 2021-04-30
> 11:36:47.738318880 +0000
> >> > +@@ -1,3 +1,4 @@
> >> > ++include ../../rules_yocto.mk
> >> > + include sources.mk
> >> > +
> >> > + NAME =3D libcrypto
> >> > +@@ -26,6 +27,8 @@
> >> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 -lpthread
> >> > +
> >> > + build: $(SOURCES)
> >> > +-      mkdir --parents debian/out
> >> > +-      $(CC) $^ -o debian/out/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS)
> $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 debian/out/$(NAME).so
> >> > +\ No newline at end of file
> >> > ++      mkdir --parents
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/
> >> > ++      mkdir --parents $(OUT_DIR)/usr/include
> >> > ++      $(CC) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS)
> $(CPPFLAGS) $(LDFLAGS) -DOPENSSL_NO_ASM
> >> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> >> > ++      cp -r include/openssl $(OUT_DIR)/usr/include
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk=
_change_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk=
_change_out_dir.patch
> >> > new file mode 100644
> >> > index 000000000..a0dd34876
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk=
_change_out_dir.patch
> >> > @@ -0,0 +1,38 @@
> >> > +libcrypto_utils.mk: modifications to make it build in yocto
> environment
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary and header to
> the OUT_DIR
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +--- git/system/core/debian/libcrypto_utils.mk  2021-04-30
> 14:18:54.071379767 +0200
> >> > ++++ git/system/core/debian/libcrypto_utils.mk  2021-04-30
> 14:22:46.179047308 +0200
> >> > +@@ -1,15 +1,17 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME:=3D libcrypto_utils
> >> > + SOURCES :=3D android_pubkey.c
> >> > + SOURCES :=3D $(foreach source, $(SOURCES), libcrypto_utils/$(sourc=
e))
> >> > +-CPPFLAGS +=3D -Ilibcrypto_utils/include -Iinclude
> >> > ++CPPFLAGS +=3D -Ilibcrypto_utils/include -Iinclude
> -I$(OUT_DIR)/usr/include
> >> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> >> > +       -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +-      -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > ++      -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +       -lcrypto -Wl,-z,defs
> >> > +
> >> > + build: $(SOURCES)
> >> > +-      $(CC) $^ -o $(NAME).so.0  $(CPPFLAGS) $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 $(NAME).so
> >> > ++      $(CC) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0  $(CPPFLAGS=
)
> $(LDFLAGS)
> >> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> >> > ++      cp -r libcrypto_utils/include/* $(OUT_DIR)/usr/include/
> >> > +
> >> > + clean:
> >> > +-      $(RM) $(NAME).so*
> >> > ++      $(RM)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_chang=
e_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_chang=
e_out_dir.patch
> >> > new file mode 100644
> >> > index 000000000..5539eb91d
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_chang=
e_out_dir.patch
> >> > @@ -0,0 +1,27 @@
> >> > +--- git/system/core/debian/libcutils.mk        2021-05-17
> 06:38:40.105161629 +0000
> >> > ++++ git/system/core/debian/libcutils.mk        2021-05-17
> 06:42:37.141912366 +0000
> >> > +@@ -1,3 +1,4 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME =3D libcutils
> >> > +
> >> > + # copied from libcutils/Android.bp
> >> > +@@ -50,14 +51,15 @@
> >> > +             -Iinclude \
> >> > +
> >> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> >> > +-           -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -lpthread -L. -llog -lbase
> >> > ++           -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -lpthread -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ -llog -lbas=
e
> >> > +
> >> > + build: $(COBJECTS) $(CXXOBJECTS)
> >> > +-      $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 $(NAME).so
> >> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
> >> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> >> > ++      cp -r libcutils/include/cutils $(OUT_DIR)/usr/include/
> >> > +
> >> > + clean:
> >> > +-      $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*
> >> > ++      $(RM) $(CXXOBJECTS) $(COBJECTS)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> >> > +
> >> > + $(COBJECTS): %.o: %.c
> >> > +       $(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_c=
hange_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_c=
hange_out_dir.patch
> >> > new file mode 100644
> >> > index 000000000..efccfab9c
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_c=
hange_out_dir.patch
> >> > @@ -0,0 +1,42 @@
> >> > +libext4_utils.mk: modifications to make it build in yocto
> environment
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary and header to
> the OUT_DIR
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +--- git/system/extras/debian/libext4_utils.mk  2021-04-29
> 21:46:39.384394114 +0000
> >> > ++++ git/system/extras/debian/libext4_utils.mk  2021-04-29
> 21:49:53.808605543 +0000
> >> > +@@ -1,3 +1,4 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME =3D libext4_utils
> >> > +
> >> > + ext4_utils_SOURCES :=3D \
> >> > +@@ -17,14 +18,16 @@
> >> > +             -Iext4_utils/include \
> >> > +             -Ilibfec/include \
> >> > +             -Isquashfs_utils \
> >> > +-            -I/usr/include/android \
> >> > ++            -I/usr/include/android -I$(OUT_DIR)/usr/include \
> >> > +             -D_GNU_SOURCE -DFEC_NO_KLOG -DSQUASHFS_NO_KLOG
> -D_LARGEFILE64_SOURCE
> >> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> >> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
> >> > +            -lbase -lsparse -lselinux
> >> > +
> >> > + build: $(SOURCES)
> >> > +-      mkdir --parents $(OUT_DIR)
> >> > +-      $(CC) $^ -o $(OUT_DIR)/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS)
> $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 $(OUT_DIR)/$(NAME).so
> >> > ++      mkdir --parents
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/
> >> > ++      $(CC) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> >> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> >> > ++      cp -r ext4_utils/include/* $(OUT_DIR)/usr/include/
> >> > ++
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_o=
ut_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_o=
ut_dir.patch
> >> > new file mode 100644
> >> > index 000000000..0f8184d41
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_o=
ut_dir.patch
> >> > @@ -0,0 +1,35 @@
> >> > +--- git/system/extras/debian/libfec.mk 2021-05-17
> 06:55:51.973044031 +0000
> >> > ++++ git/system/extras/debian/libfec.mk 2021-05-17
> 06:56:41.940185413 +0000
> >> > +@@ -1,3 +1,4 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME =3D libfec
> >> > +
> >> > + # copied from libfec/Android.bp
> >> > +@@ -12,20 +13,21 @@
> >> > + CXXFLAGS +=3D -fno-strict-aliasing -std=3Dg++17
> >> > + CPPFLAGS +=3D \
> >> > +             -Iext4_utils/include \
> >> > +-            -Ilibfec/include \
> >> > ++            -Ilibfec/include -I $(OUT_DIR)/usr/include \
> >> > +             -D_GNU_SOURCE -DFEC_NO_KLOG -D_LARGEFILE64_SOURCE
> >> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> >> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +            -lbase -lsparse -lselinux
> >> > +
> >> > + build: $(COBJECTS) $(CXXOBJECTS)
> >> > +-      mkdir -p $(OUT_DIR)
> >> > +-      $(CXX) $^ -o $(OUT_DIR)/$(NAME).so.0 $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 $(OUT_DIR)/$(NAME).so
> >> > ++      mkdir -p $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android
> >> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
> >> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> >> > ++      cp -r libfec/include/* $(OUT_DIR)/usr/include/
> >> > +
> >> > + clean:
> >> > +-      $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*
> >> > ++      $(RM) $(CXXOBJECTS) $(COBJECTS)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> >> > +
> >> > + $(COBJECTS): %.o: %.c
> >> > +       $(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_o=
ut_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_o=
ut_dir.patch
> >> > new file mode 100644
> >> > index 000000000..09ef1871b
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_o=
ut_dir.patch
> >> > @@ -0,0 +1,42 @@
> >> > +patching liblog.mk to build in yocto environment.
> >> > +
> >> > +Changes include:
> >> > +Introduced an output folder which will keep all the outputs from th=
e
> >> > +android-tools.
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary to the OUT_DI=
R
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +Upstream-Status: Pending
> >> > +
> >> > +--- git/system/core/debian/liblog.mk   2021-05-17
> 08:13:28.304700936 +0000
> >> > ++++ git/system/core/debian/liblog.mk   2021-05-17
> 08:15:59.590064282 +0000
> >> > +@@ -1,3 +1,4 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME =3D liblog
> >> > +
> >> > + # copied from liblog/Android.bp
> >> > +@@ -39,11 +40,12 @@
> >> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 -lpthread
> >> > +
> >> > + build: $(COBJECTS) $(CXXOBJECTS)
> >> > +-      $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 $(NAME).so
> >> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
> >> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> >> > ++      cp -r liblog/include/* $(OUT_DIR)/usr/include/
> >> > +
> >> > + clean:
> >> > +-      $(RM) $(COBJECTS) $(CXXOBJECTS) $(NAME).so*
> >> > ++      $(RM) $(COBJECTS) $(CXXOBJECTS)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> >> > +
> >> > + $(COBJECTS): %.o: %.c
> >> > +       $(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Re=
move-bionic-specific-calls.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Re=
move-bionic-specific-calls.patch
> >> > deleted file mode 100644
> >> > index 9de2593df..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Re=
move-bionic-specific-calls.patch
> >> > +++ /dev/null
> >> > @@ -1,25 +0,0 @@
> >> > -From 36654a4484117e5f4d63a810c0d94bc9c7ee3a83 Mon Sep 17 00:00:00
> 2001
> >> > -From: Fathi Boudra <fabo@debian.org>
> >> > -Date: Tue, 2 Oct 2018 16:36:54 +0000
> >> > -Subject: [PATCH] Remove bionic specific calls
> >> > -
> >> > -Upstream-Status: Inappropriate
> >> > -
> >> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> > ----
> >> > - src/procattr.c | 2 +-
> >> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> >> > -
> >> > -diff --git a/src/procattr.c b/src/procattr.c
> >> > -index f350808..761cf8e 100644
> >> > ---- a/src/procattr.c
> >> > -+++ b/src/procattr.c
> >> > -@@ -8,7 +8,7 @@
> >> > - #include "selinux_internal.h"
> >> > - #include "policy.h"
> >> > -
> >> > --#ifdef HOST
> >> > -+#ifndef __BIONIC__
> >> > - static pid_t gettid(void)
> >> > - {
> >> > -       return syscall(__NR_gettid);
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-li=
bselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-li=
bselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
> >> > deleted file mode 100644
> >> > index 87771cba8..000000000
> >> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-li=
bselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
> >> > +++ /dev/null
> >> > @@ -1,49 +0,0 @@
> >> > -From f4f9d24860e1b5cd4f6a014f3fda7cd33ebe5be7 Mon Sep 17 00:00:00
> 2001
> >> > -From: Petr Lautrbach <plautrba@redhat.com>
> >> > -Date: Sat, 27 Jul 2019 08:20:20 -0700
> >> > -Subject: [PATCH] libselinux: Do not define gettid() if glibc >=3D 2=
.30
> is used
> >> > -MIME-Version: 1.0
> >> > -Content-Type: text/plain; charset=3DUTF-8
> >> > -Content-Transfer-Encoding: 8bit
> >> > -
> >> > -Since version 2.30 glibc implements gettid() system call wrapper, s=
ee
> >> > -https://sourceware.org/bugzilla/show_bug.cgi?id=3D6399
> >> > -
> >> > -Fixes:
> >> > -cc -O2 -g -pipe -Wall -Werror=3Dformat-security
> -Wp,-D_FORTIFY_SOURCE=3D2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions
> -fstack-protector-strong -grecord-gcc-switches
> -specs=3D/usr/lib/rpm/redhat/redhat-hardened-cc1
> -specs=3D/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=3Dgeneric
> -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection
> -I../include -D_GNU_SOURCE  -DNO_ANDROID_BACKEND   -c -o procattr.o
> procattr.c
> >> > -procattr.c:28:14: error: static declaration of =E2=80=98gettid=E2=
=80=99 follows
> non-static declaration
> >> > -   28 | static pid_t gettid(void)
> >> > -      |              ^~~~~~
> >> > -In file included from /usr/include/unistd.h:1170,
> >> > -                 from procattr.c:2:
> >> > -/usr/include/bits/unistd_ext.h:34:16: note: previous declaration of
> =E2=80=98gettid=E2=80=99 was here
> >> > -   34 | extern __pid_t gettid (void) __THROW;
> >> > -      |                ^~~~~~
> >> > -
> >> > -Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
> >> > -Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> >> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > ----
> >> > - src/procattr.c | 14 +++++++++++++-
> >> > - 1 file changed, 13 insertions(+), 1 deletion(-)
> >> > -
> >> > ---- a/src/procattr.c
> >> > -+++ b/src/procattr.c
> >> > -@@ -8,12 +8,16 @@
> >> > - #include "selinux_internal.h"
> >> > - #include "policy.h"
> >> > -
> >> > --#ifndef __BIONIC__
> >> > -+/* Bionic and glibc >=3D 2.30 declare gettid() system call wrapper=
 in
> unistd.h and
> >> > -+ * has a definition for it */
> >> > -+#if defined(__GLIBC_)
> >> > -+#if !__GLIBC_PREREQ(2,30)
> >> > - static pid_t gettid(void)
> >> > - {
> >> > -       return syscall(__NR_gettid);
> >> > - }
> >> > - #endif
> >> > -+#endif
> >> > -
> >> > - static int getprocattrcon(char ** context,
> >> > -                         pid_t pid, const char *attr)
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_chang=
e_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_chang=
e_out_dir.patch
> >> > new file mode 100644
> >> > index 000000000..4f8bb44a4
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_chang=
e_out_dir.patch
> >> > @@ -0,0 +1,47 @@
> >> > +patching libsparse.mk to build in yocto environment.
> >> > +
> >> > +Changes include:
> >> > +Introduced an output folder which will keep all the outputs from th=
e
> >> > +android-tools.
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary to the OUT_DI=
R
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +Upstream-Status: Pending
> >> > +
> >> > +--- git/system/core/debian/libsparse.mk        2021-05-17
> 08:13:34.764584388 +0000
> >> > ++++ git/system/core/debian/libsparse.mk        2021-05-17
> 08:15:34.850492654 +0000
> >> > +@@ -1,3 +1,4 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME =3D libsparse
> >> > + SOURCES =3D \
> >> > +         backed_block.cpp \
> >> > +@@ -18,16 +19,16 @@
> >> > +   -shared -Wl,-soname,$(NAME).so.0 \
> >> > +   -lz \
> >> > +   -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +-  -L. \
> >> > ++  -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
> >> > +   -lbase
> >> > +
> >> > +
> >> > + build: $(COBJECTS) $(CXXOBJECTS)
> >> > +-      $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 $(NAME).so
> >> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
> >> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> >> > +
> >> > + clean:
> >> > +-      $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*
> >> > ++      $(RM) $(CXXOBJECTS) $(COBJECTS)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> >> > +
> >> > + $(COBJECTS): %.o: %.c
> >> > +       $(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_chang=
e_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_chang=
e_out_dir.patch
> >> > new file mode 100644
> >> > index 000000000..237d45c3c
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_chang=
e_out_dir.patch
> >> > @@ -0,0 +1,47 @@
> >> > +patching libundwind to build in yocto environment.
> >> > +
> >> > +Changes include:
> >> > +Introduced an output folder which will keep all the outputs from th=
e
> >> > +android-tools.
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary to the OUT_DI=
R
> >> > +
> >> > +Passing the architecture details($CPU)from the recipe.
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +Upstream-Status: Pending
> >> > +
> >> > +--- git/external/libunwind/debian/libunwind.mk 2021-05-22
> 02:29:52.950324653 +0000
> >> > ++++ git/external/libunwind/debian/libunwind.mk 2021-05-22
> 02:30:48.535322846 +0000
> >> > +@@ -1,4 +1,4 @@
> >> > +-include debian/detect_arch.mk
> >> > ++include ../../rules_yocto.mk
> >> > +
> >> > + ARCH_SOURCES =3D is_fpreg.c \
> >> > +                regname.c \
> >> > +@@ -131,10 +131,12 @@
> >> > + CPPFLAGS +=3D -Iinclude -Isrc $($(CPU)_INCLUDES) -Idebian/include
> >> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> >> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +-           -lpthread -nostdlib -lc -lgcc -Ldebian/out -l7z
> >> > ++           -lpthread -nostdlib -lc -lgcc -l7z
> >> > +
> >> > + build: $(SOURCES)
> >> > +-      mkdir --parents debian/out
> >> > +-      ln -s /usr/lib/p7zip/7z.so debian/out/lib7z.so
> >> > +-      $(CC) $^ -o debian/out/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS)
> $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 debian/out/$(NAME).so
> >> > ++      mkdir --parents
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/
> >> > ++      mkdir --parents $(OUT_DIR)/usr/include/android/libunwind
> >> > ++      $(CC) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS)
> $(CPPFLAGS) $(LDFLAGS) -Wno-header-guard -Wno-absolute-value
> >> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> >> > ++      cp -r include/* debian/include/*
> $(OUT_DIR)/usr/include/android/libunwind/
> >> > ++
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_c=
hange_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_c=
hange_out_dir.patch
> >> > new file mode 100644
> >> > index 000000000..cc9997dac
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_c=
hange_out_dir.patch
> >> > @@ -0,0 +1,47 @@
> >> > +patching libziparchive.mk to build in yocto environment.
> >> > +
> >> > +Changes include:
> >> > +Introduced an output folder which will keep all the outputs from th=
e
> >> > +android-tools.
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary to the OUT_DI=
R
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +Upstream-Status: Pending
> >> > +
> >> > +--- git/system/core/debian/libziparchive.mk    2021-05-17
> 08:13:41.684459540 +0000
> >> > ++++ git/system/core/debian/libziparchive.mk    2021-05-17
> 08:16:19.293722572 +0000
> >> > +@@ -1,3 +1,4 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME =3D libziparchive
> >> > + SOURCES =3D zip_archive.cc \
> >> > +           zip_archive_stream_entry.cc\
> >> > +@@ -5,14 +6,15 @@
> >> > + SOURCES :=3D $(foreach source, $(SOURCES), libziparchive/$(source)=
)
> >> > + CXXFLAGS +=3D -std=3Dgnu++17
> >> > + CPPFLAGS +=3D -DZLIB_CONST -D_FILE_OFFSET_BITS=3D64 \
> >> > +-            -Iinclude -Ibase/include -Ilibziparchive/include
> >> > ++            -Iinclude -Ibase/include -Ilibziparchive/include
> -I$(OUT_DIR)/usr/include/
> >> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> >> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +-           -lz -L. -llog -lbase
> >> > ++           -lz -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -llog -lbase
> >> > +
> >> > + build: $(SOURCES)
> >> > +-      $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
> >> > +-      ln -s $(NAME).so.0 $(NAME).so
> >> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> >> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> >> > ++      cp -r libziparchive/include/* $(OUT_DIR)/usr/include/
> >> > +
> >> > + clean:
> >> > +-      $(RM) $(NAME).so*
> >> > ++      $(RM)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> >> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/
> mkbootimg.mk b/meta-oe/recipes-devtools/android-tools/android-tools/
> mkbootimg.mk
> >> > deleted file mode 100644
> >> > index 519f609fd..000000000
> >> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/
> mkbootimg.mk
> >> > +++ /dev/null
> >> > @@ -1,29 +0,0 @@
> >> > -# Makefile for mkbootimg
> >> > -
> >> > -SRCDIR ?=3D $(S)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/mkbootimg
> >> > -mkbootimg_SRC_FILES +=3D mkbootimg.c
> >> > -mkbootimg_OBJS :=3D $(mkbootimg_SRC_FILES:.c=3D.o)
> >> > -
> >> > -VPATH +=3D $(SRCDIR)/system/core/libmincrypt
> >> > -libmincrypt_SRC_FILES :=3D dsa_sig.c p256.c p256_ec.c p256_ecdsa.c
> rsa.c sha.c sha256.c
> >> > -libmincrypt_OBJS :=3D $(libmincrypt_SRC_FILES:.c=3D.o)
> >> > -
> >> > -CFLAGS +=3D -DANDROID
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/mkbootimg
> >> > -CFLAGS +=3D -I$(SRCDIR)/system/core/include
> >> > -CFLAGS +=3D -include
> $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> >> > -
> >> > -LIBS +=3D libmincrypt.a
> >> > -
> >> > -all: mkbootimg
> >> > -
> >> > -mkbootimg: libmincrypt.a $(mkbootimg_OBJS)
> >> > -       $(CC) -o $@ $(LDFLAGS) $(mkbootimg_OBJS) $(LIBS)
> >> > -
> >> > -libmincrypt.a: $(libmincrypt_OBJS)
> >> > -       $(AR) rcs $@ $(libmincrypt_OBJS)
> >> > -
> >> > -clean:
> >> > -       $(RM) $(mkbootimg_OBJS) $(libmincrypt_OBJS) mkbootimg *.a
> >> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/
> rules_yocto.mk b/meta-oe/recipes-devtools/android-tools/android-tools/
> rules_yocto.mk
> >> > new file mode 100644
> >> > index 000000000..5e217f47f
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-devtools/android-tools/android-tools/
> rules_yocto.mk
> >> > @@ -0,0 +1,4 @@
> >> > +CPPFLAGS +=3D -fPIC
> >> > +ifndef OUT_DIR
> >> > +OUT_DIR =3D ../../debian/out
> >> > +endif
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_ou=
t_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_ou=
t_dir.patch
> >> > new file mode 100644
> >> > index 000000000..d17adfffd
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_ou=
t_dir.patch
> >> > @@ -0,0 +1,41 @@
> >> > +patching simg2img.mk to build in yocto environment.
> >> > +
> >> > +Changes include:
> >> > +Introduced an output folder which will keep all the outputs from th=
e
> >> > +android-tools.
> >> > +
> >> > +Adding an include file that is setting the common flags.
> >> > +Changed the cppflag to include the headers from other components
> >> > +of android-tools
> >> > +
> >> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> >> > +are searched in the output folder.
> >> > +
> >> > +Modified the build rule so that it outputs the binary to the OUT_DI=
R
> >> > +
> >> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> >> > +
> >> > +Upstream-Status: Pending
> >> > +
> >> > +--- git/system/core/debian/simg2img.mk 2021-05-12
> 09:47:52.577840520 +0000
> >> > ++++ git/system/core/debian/simg2img.mk 2021-05-12
> 09:51:43.525678276 +0000
> >> > +@@ -1,13 +1,14 @@
> >> > ++include ../../rules_yocto.mk
> >> > + NAME =3D simg2img
> >> > + SOURCES =3D simg2img.cpp sparse_crc32.cpp
> >> > + SOURCES :=3D $(foreach source, $(SOURCES), libsparse/$(source))
> >> > + CPPFLAGS +=3D -Ilibsparse/include -Iinclude -std=3Dgnu++17
> >> > +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > +-           -Wl,-rpath-link=3D. \
> >> > +-           -L. -lsparse
> >> > ++LDFLAGS +=3D
> -Wl,-rpath=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > ++
>  -Wl,-rpath-link=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> >> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -lsparse
> >> > +
> >> > + build: $(SOURCES)
> >> > +-      $(CXX) $^ -o libsparse/$(NAME) $(CPPFLAGS) $(LDFLAGS)
> >> > ++      $(CXX) $^ -o $(OUT_DIR)/usr/bin/$(NAME) $(CPPFLAGS) $(LDFLAG=
S)
> >> > +
> >> > + clean:
> >> > +-      $(RM) libsparse/$(NAME)
> >> > ++      $(RM) $(OUT_DIR)/usr/bin/$(NAME)
> >> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std=
_to_compile_libbacktrace.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std=
_to_compile_libbacktrace.patch
> >> > new file mode 100644
> >> > index 000000000..079ade46b
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std=
_to_compile_libbacktrace.patch
> >> > @@ -0,0 +1,19 @@
> >> > +To Fix the below error
> >> > +
> >> > + In file included from libunwindstack/DwarfSection.cpp:21:
> >> > +| libunwindstack/include/unwindstack/DwarfMemory.h:32:29: error:
> unknown type name 'size_t'; did you mean 'std::size_t'?
> >> > +|   bool ReadBytes(void* dst, size_t num_bytes);
> >> > +|                             ^~~~~~
> >> > +|                             std::size_t
> >> > +
> >> > +--- ./system/core/libunwindstack/include/unwindstack/DwarfMemory.h
>    2021-05-22 00:52:15.132452862 +0000
> >> > ++++ ./system/core/libunwindstack/include/unwindstack/DwarfMemory.h
>    2021-05-22 00:53:09.793416724 +0000
> >> > +@@ -23,7 +23,7 @@
> >> > +
> >> > + // Forward declarations.
> >> > + class Memory;
> >> > +-
> >> > ++using namespace std;
> >> > + class DwarfMemory {
> >> > +  public:
> >> > +   DwarfMemory(Memory* memory) : memory_(memory) {}
> >> > diff --git a/meta-oe/recipes-devtools/android-tools/
> android-tools_10.0.0.r36.bb b/meta-oe/recipes-devtools/android-tools/
> android-tools_10.0.0.r36.bb
> >> > new file mode 100644
> >> > index 000000000..02c669582
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-devtools/android-tools/
> android-tools_10.0.0.r36.bb
> >> > @@ -0,0 +1,204 @@
> >> > +DESCRIPTION =3D "Different utilities from Android"
> >> > +SECTION =3D "console/utils"
> >> > +LICENSE =3D "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
> >> > +LIC_FILES_CHKSUM =3D " \
> >> > +
> file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a00=
96b10
> \
> >> > +
> file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd6425610833=
a22dbe6
> \
> >> > +
> file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1bc=
15da69f
> \
> >> > +
> file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e2=
03a55f9
> \
> >> > +"
> >> > +DEPENDS =3D "libbsd libpcre zlib libcap libusb squashfs-tools p7zip
> libselinux"
> >> > +
> >> > +ANDROID_MIRROR =3D "android.googlesource.com"
> >> > +
> >> > +# matches with 10.0.0+r36
> >> > +SRCREV_boringssl =3D "ae2dd49c7cb74d04bdba7c1c9bd62c1e9cdf98f6"
> >> > +SRCREV_core =3D "5aa13b053182b758d7a19db0c83e1b9b5bf1ec2e"
> >> > +SRCREV_extras =3D "d31740f9d0399f8b938e88e58843d966e1cccab6"
> >> > +SRCREV_libhardware =3D "c6925520342a7d37758f85eb1cf3baa20a7b7a18"
> >> > +SRCREV_build =3D "28768b3120f751583a2743101b892f210d4715cf"
> >> > +SRCREV_libunwind =3D "03a963ecf6ea836b38b3537cbcda0ecfd7a77393"
> >> > +
> >> > +SRC_URI =3D " \
> >> > +    git://
> salsa.debian.org/android-tools-team/android-platform-external-boringssl;n=
ame=3Dboringssl;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/external/bor=
ingssl
> \
> >> > +    git://
> salsa.debian.org/android-tools-team/android-platform-system-core;name=3Dc=
ore;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/core
> \
> >> > +    git://
> salsa.debian.org/android-tools-team/android-platform-system-extras;name=
=3Dextras;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/extras
> \
> >> > +
> git://${ANDROID_MIRROR}/platform/hardware/libhardware;name=3Dlibhardware;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/hardware/libhardware
> \
> >> > +    git://
> salsa.debian.org/android-tools-team/android-platform-build.git;name=3Dbui=
ld;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/build
> \
> >> > +    git://
> salsa.debian.org/android-tools-team/android-platform-external-libunwind.g=
it;protocol=3Dhttps;name=3Dlibunwind;nobranch=3D1;destsuffix=3Dgit/external=
/libunwind
> \
> >> > +    file://adb_mk_change_out_dir.patch \
> >> > +    file://libadb_mk_change_out_dir.patch \
> >> > +    file://fastboot_compile_remove_gtest.patch \
> >> > +    file://fastboot_mk_change_out_dir.patch \
> >> > +    file://libbase_mk_change_out_dir.patch \
> >> > +    file://libext4_utils_mk_change_out_dir.patch \
> >> > +    file://libcrypto_mk_change_out_dir.patch \
> >> > +    file://libcrypto_utils_mk_change_out_dir.patch \
> >> > +    file://libcutils_mk_change_out_dir.patch \
> >> > +    file://libfec_mk_change_out_dir.patch \
> >> > +    file://img2simg_change_out_dir.patch \
> >> > +    file://simg2img_change_out_dir.patch \
> >> > +    file://liblog_mk_change_out_dir.patch \
> >> > +    file://libsparse_mk_change_out_dir.patch \
> >> > +    file://libziparchive_mk_change_out_dir.patch \
> >> > +    file://libbacktrace_mk_change_out_dir.patch \
> >> > +    file://libunwind_mk_change_out_dir.patch \
> >> > +    file://use_name_space_std_to_compile_libbacktrace.patch \
> >> > +    file://rules_yocto.mk;subdir=3Dgit \
> >> > +    file://android-tools-adbd.service \
> >> > +"
> >> > +
> >> > +S =3D "${WORKDIR}/git"
> >> > +B =3D "${WORKDIR}/${BPN}"
> >> > +
> >> > +#apply all the patches maintained in the debian version.
> >> > +do_unpack_and_patch_debian() {
> >> > +    cd ${S}/system/core
> >> > +    for i in `find ${S}/system/core/debian/patches -name "*.patch"`=
;
> do
> >> > +        patch -p1 < $i
> >> > +    done
> >> > +    #a patch with no .patch extention, lets apply that
> >> > +    patch -p1 < ${S}/system/core/debian/patches/Added-missing-heade=
rs
> >> > +    cd ${S}/external/libunwind
> >> > +    for i in `find ${S}/external/libunwind/debian/patches -name
> "*.patch"`; do
> >> > +        patch -p1 < $i
> >> > +    done
> >> > +}
> >> > +addtask unpack_and_patch_debian after do_unpack before do_patch
> >> > +
> >> > +# http://errors.yoctoproject.org/Errors/Details/1debian881/
> >> > +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> >> > +ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >> > +
> >> > +COMPATIBLE_HOST_powerpc =3D "(null)"
> >> > +COMPATIBLE_HOST_powerpc64 =3D "(null)"
> >> > +COMPATIBLE_HOST_powerpc64le =3D "(null)"
> >> > +
> >> > +inherit systemd clang
> >> > +
> >> > +TOOLCHAIN =3D "clang"
> >> > +DEPENDS +=3D "\
> >> > +    clang-cross-${TARGET_ARCH} \
> >> > +"
> >> > +
> >> > +SYSTEMD_SERVICE_${PN} =3D "android-tools-adbd.service"
> >> > +
> >> > +# Find libbsd headers during native builds
> >> > +CC_append_class-native =3D " -I${STAGING_INCDIR}"
> >> > +CC_append_class-nativesdk =3D " -I${STAGING_INCDIR}"
> >> > +
> >> > +PREREQUISITE_core =3D "libbase libsparse liblog libcutils"
> >> > +TOOLS_TO_BUILD =3D "libcrypto_utils libadb libziparchive fastboot a=
db
> img2simg simg2img libbacktrace"
> >> > +
> >> > +# Adb needs sys/capability.h, which is not available for native*
> >> > +TOOLS_class-native =3D "boringssl fastboot ext4_utils mkbootimg"
> >> > +TOOLS_class-nativesdk =3D "boringssl fastboot ext4_utils mkbootimg"
> >> > +
> >> > +do_compile() {
> >> > +
> >> > +    case "${HOST_ARCH}" in
> >> > +      arm)
> >> > +        export android_arch=3Dlinux-arm
> >> > +        cpu=3Darm
> >> > +        deb_host_arch=3Darm
> >> > +      ;;
> >> > +      aarch64)
> >> > +        export android_arch=3Dlinux-arm64
> >> > +        cpu=3Darm64
> >> > +        deb_host_arch=3Darm64
> >> > +      ;;
> >> > +      riscv64)
> >> > +        export android_arch=3Dlinux-riscv64
> >> > +      ;;
> >> > +      mips|mipsel)
> >> > +        export android_arch=3Dlinux-mips
> >> > +        cpu=3Dmips
> >> > +        deb_host_arch=3Dmips
> >> > +      ;;
> >> > +      mips64|mips64el)
> >> > +        export android_arch=3Dlinux-mips64
> >> > +        cpu=3Dmips64
> >> > +        deb_host_arch=3Dmips64
> >> > +      ;;
> >> > +      powerpc|powerpc64)
> >> > +        export android_arch=3Dlinux-ppc
> >> > +      ;;
> >> > +      i586|i686|x86_64)
> >> > +        export android_arch=3Dlinux-x86
> >> > +        cpu=3Dx86_64
> >> > +        deb_host_arch=3Damd64
> >> > +      ;;
> >> > +    esac
> >> > +
> >> > +    export SRCDIR=3D${S}
> >> > +
> >> > +    oe_runmake -f ${S}/external/boringssl/debian/libcrypto.mk -C
> ${S}/external/boringssl
> >> > +    oe_runmake -f ${S}/external/libunwind/debian/libunwind.mk -C
> ${S}/external/libunwind CPU=3D${cpu}
> >> > +
> >> > +    for tool in ${PREREQUISITE_core}; do
> >> > +      oe_runmake -f ${S}/system/core/debian/${tool}.mk -C
> ${S}/system/core
> >> > +    done
> >> > +
> >> > +    for i in `find ${S}/system/extras/debian/ -name "*.mk"`; do
> >> > +        oe_runmake -f $i -C ${S}/system/extras
> >> > +    done
> >> > +
> >> > +    for tool in ${TOOLS_TO_BUILD}; do
> >> > +        if tool =3D=3D "libbacktrace"; then
> >> > +            oe_runmake -f ${S}/system/core/debian/${tool}.mk -C
> ${S}/system/core DEB_HOST_ARCH=3D${deb_host_arch}
> >> > +        else
> >> > +            oe_runmake -f ${S}/system/core/debian/${tool}.mk -C
> ${S}/system/core
> >> > +        fi
> >> > +    done
> >> > +
> >> > +}
> >> > +
> >> > +do_install() {
> >> > +    if echo ${TOOLS_TO_BUILD} | grep -q "ext4_utils" ; then
> >> > +        install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.p=
y
> ${D}${bindir}/simg_dump
> >> > +    fi
> >> > +
> >> > +    if echo ${TOOLS_TO_BUILD} | grep -q "adb " ; then
> >> > +        install -d ${D}${bindir}
> >> > +        install -m0755 ${S}/debian/out/usr/lib/android/adb/adb
> ${D}${bindir}
> >> > +    fi
> >> > +
> >> > +    if echo ${TOOLS_TO_BUILD} | grep -q "adbd" ; then
> >> > +        install -d ${D}${bindir}
> >> > +        install -m0755 ${B}/adbd/adbd ${D}${bindir}
> >> > +    fi
> >> > +
> >> > +    # Outside the if statement to avoid errors during do_package
> >> > +    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
> >> > +      ${D}${systemd_unitdir}/system/android-tools-adbd.service
> >> > +
> >> > +    if echo ${TOOLS_TO_BUILD} | grep -q "fastboot" ; then
> >> > +        install -d ${D}${bindir}
> >> > +        install -m0755 ${S}/debian/out/usr/bin/fastboot/fastboot
> ${D}${bindir}
> >> > +    fi
> >> > +
> >> > +    install -d  ${D}${libdir}/android/
> >> > +    install -m0755 ${S}/debian/out/usr/lib/android/*.so.*
> ${D}${libdir}/android/
> >> > +    if echo ${TOOLS_TO_BUILD} | grep -q "mkbootimg" ; then
> >> > +        install -d ${D}${bindir}
> >> > +        install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
> >> > +    fi
> >> > +}
> >> > +
> >> > +PACKAGES +=3D "${PN}-fstools"
> >> > +
> >> > +RDEPENDS_${BPN} =3D "${BPN}-conf p7zip"
> >> > +
> >> > +FILES_${PN}-fstools =3D "\
> >> > +    ${bindir}/ext2simg \
> >> > +    ${bindir}/ext4fixup \
> >> > +    ${bindir}/img2simg \
> >> > +    ${bindir}/make_ext4fs \
> >> > +    ${bindir}/simg2img \
> >> > +    ${bindir}/simg2simg \
> >> > +    ${bindir}/simg_dump \
> >> > +    ${bindir}/mkuserimg \
> >> > +"
> >> > +FILES_${PN} +=3D "${libdir}/android ${libdir}/android/*"
> >> > +
> >> > +BBCLASSEXTEND =3D "native"
> >> > diff --git a/meta-oe/recipes-devtools/android-tools/
> android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/
> android-tools_5.1.1.r37.bb
> >> > deleted file mode 100644
> >> > index e8992346b..000000000
> >> > --- a/meta-oe/recipes-devtools/android-tools/
> android-tools_5.1.1.r37.bb
> >> > +++ /dev/null
> >> > @@ -1,182 +0,0 @@
> >> > -DESCRIPTION =3D "Different utilities from Android"
> >> > -SECTION =3D "console/utils"
> >> > -LICENSE =3D "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
> >> > -LIC_FILES_CHKSUM =3D " \
> >> > -
> file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a00=
96b10
> \
> >> > -
> file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd6425610833=
a22dbe6
> \
> >> > -
> file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1bc=
15da69f
> \
> >> > -
> file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e2=
03a55f9
> \
> >> > -"
> >> > -DEPENDS =3D "libbsd libpcre zlib libcap"
> >> > -DEPENDS_append_class-target =3D " openssl"
> >> > -
> >> > -ANDROID_MIRROR =3D "android.googlesource.com"
> >> > -
> >> > -# matches with android-5.1.1_r37
> >> > -SRCREV_core =3D "2314b110bdebdbfd2d94c502282f9e57c849897e"
> >> > -SRCREV_extras =3D "3ecbe8d841df96127d7855661293e5ab6ba6c205"
> >> > -SRCREV_libhardware =3D "be55eb1f4d840c82ffaf7c47460df17ff5bc4d9b"
> >> > -SRCREV_libselinux =3D "07e9e1339ad1ba608acfba9dce2d0f474b252feb"
> >> > -SRCREV_build =3D "16e987def3d7d8f7d30805eb95cef69e52a87dbc"
> >> > -
> >> > -SRC_URI =3D " \
> >> > -
> git://${ANDROID_MIRROR}/platform/system/core;name=3Dcore;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3Dgit/system/core
> \
> >> > -
> git://${ANDROID_MIRROR}/platform/system/extras;name=3Dextras;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3Dgit/system/extras
> \
> >> > -
> git://${ANDROID_MIRROR}/platform/hardware/libhardware;name=3Dlibhardware;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/hardware/libhardware
> \
> >> > -
> git://${ANDROID_MIRROR}/platform/external/libselinux;name=3Dlibselinux;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/external/libselinux
> \
> >> > -
> git://${ANDROID_MIRROR}/platform/build;name=3Dbuild;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3Dgit/build
> \
> >> > -
> file://core/0001-adb-remove-selinux-extensions.patch;patchdir=3Dsystem/co=
re \
> >> > -
> file://core/0002-adb-Use-local-sockets-where-appropriate.patch;patchdir=
=3Dsystem/core
> \
> >> > -
> file://core/0003-adb-define-shell-command.patch;patchdir=3Dsystem/core \
> >> > -
> file://core/0004-adb-Fix-build-on-big-endian-systems.patch;patchdir=3Dsys=
tem/core
> \
> >> > -
> file://core/0005-adb-add-base64-implementation.patch;patchdir=3Dsystem/co=
re \
> >> > -    file://core/0006-adb-Musl-fixes.patch;patchdir=3Dsystem/core \
> >> > -
> file://core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch;patchdir=
=3Dsystem/core
> \
> >> > -
> file://core/0008-adb-Allow-adbd-to-be-ran-as-root.patch;patchdir=3Dsystem=
/core
> \
> >> > -
> file://core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch;pat=
chdir=3Dsystem/core
> \
> >> > -
> file://core/0010-Use-linux-capability.h-on-linux-systems-too.patch;patchd=
ir=3Dsystem/core
> \
> >> > -
> file://core/0011-Remove-bionic-specific-calls.patch;patchdir=3Dsystem/cor=
e \
> >> > -
> file://core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.pat=
ch;patchdir=3Dsystem/core
> \
> >> > -    file://core/adb_libssl_11.diff;patchdir=3Dsystem/core \
> >> > -    file://core/0013-adb-Support-riscv64.patch;patchdir=3Dsystem/co=
re \
> >> > -
> file://extras/0001-ext4_utils-remove-selinux-extensions.patch;patchdir=3D=
system/extras
> \
> >> > -
> file://extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch;=
patchdir=3Dsystem/extras
> \
> >> > -
> file://libselinux/0001-Remove-bionic-specific-calls.patch;patchdir=3Dexte=
rnal/libselinux
> \
> >> > -
> file://libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-u=
se.patch;patchdir=3Dexternal/libselinux
> \
> >> > -    file://android-tools-adbd.service \
> >> > -
> file://build/0001-Riscv-Add-risc-v-Android-config-header.patch;patchdir=
=3Dbuild
> \
> >> > -    file://gitignore \
> >> > -    file://adb.mk;subdir=3D${BPN} \
> >> > -    file://adbd.mk;subdir=3D${BPN} \
> >> > -    file://ext4_utils.mk;subdir=3D${BPN} \
> >> > -    file://fastboot.mk;subdir=3D${BPN} \
> >> > -    file://mkbootimg.mk;subdir=3D${BPN} \
> >> > -"
> >> > -
> >> > -
> >> > -S =3D "${WORKDIR}/git"
> >> > -B =3D "${WORKDIR}/${BPN}"
> >> > -
> >> > -# http://errors.yoctoproject.org/Errors/Details/133881/
> >> > -ARM_INSTRUCTION_SET_armv4 =3D "arm"
> >> > -ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >> > -
> >> > -COMPATIBLE_HOST_powerpc =3D "(null)"
> >> > -COMPATIBLE_HOST_powerpc64 =3D "(null)"
> >> > -COMPATIBLE_HOST_powerpc64le =3D "(null)"
> >> > -
> >> > -inherit systemd
> >> > -
> >> > -SYSTEMD_PACKAGES =3D "${PN}-adbd"
> >> > -SYSTEMD_SERVICE_${PN}-adbd =3D "android-tools-adbd.service"
> >> > -
> >> > -# Find libbsd headers during native builds
> >> > -CC_append_class-native =3D " -I${STAGING_INCDIR}"
> >> > -CC_append_class-nativesdk =3D " -I${STAGING_INCDIR}"
> >> > -
> >> > -TOOLS =3D "adb fastboot ext4_utils mkbootimg adbd"
> >> > -
> >> > -# Adb needs sys/capability.h, which is not available for native*
> >> > -TOOLS_class-native =3D "fastboot ext4_utils mkbootimg"
> >> > -TOOLS_class-nativesdk =3D "fastboot ext4_utils mkbootimg"
> >> > -
> >> > -do_compile() {
> >> > -    cp ${WORKDIR}/gitignore ${S}/.gitignore
> >> > -
> >> > -    # Setting both variables below causing our makefiles to not wor=
k
> with
> >> > -    # implicit make rules
> >> > -    unset CFLAGS
> >> > -    unset CPPFLAGS
> >> > -
> >> > -    export SRCDIR=3D${S}
> >> > -
> >> > -    case "${HOST_ARCH}" in
> >> > -      arm)
> >> > -        export android_arch=3Dlinux-arm
> >> > -      ;;
> >> > -      aarch64)
> >> > -        export android_arch=3Dlinux-arm64
> >> > -      ;;
> >> > -      riscv64)
> >> > -        export android_arch=3Dlinux-riscv64
> >> > -      ;;
> >> > -      mips|mipsel)
> >> > -        export android_arch=3Dlinux-mips
> >> > -      ;;
> >> > -      mips64|mips64el)
> >> > -        export android_arch=3Dlinux-mips64
> >> > -      ;;
> >> > -      powerpc|powerpc64)
> >> > -        export android_arch=3Dlinux-ppc
> >> > -      ;;
> >> > -      i586|i686|x86_64)
> >> > -        export android_arch=3Dlinux-x86
> >> > -      ;;
> >> > -    esac
> >> > -
> >> > -    for tool in ${TOOLS}; do
> >> > -      mkdir -p ${B}/${tool}
> >> > -      oe_runmake -f ${B}/${tool}.mk -C ${B}/${tool}
> >> > -    done
> >> > -}
> >> > -
> >> > -do_install() {
> >> > -    if echo ${TOOLS} | grep -q "ext4_utils" ; then
> >> > -        install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.p=
y
> ${D}${bindir}/simg_dump
> >> > -        install -D -p -m0755
> ${S}/system/extras/ext4_utils/mkuserimg.sh ${D}${bindir}/mkuserimg
> >> > -
> >> > -        install -m0755 ${B}/ext4_utils/ext2simg ${D}${bindir}
> >> > -        install -m0755 ${B}/ext4_utils/ext4fixup ${D}${bindir}
> >> > -        install -m0755 ${B}/ext4_utils/img2simg ${D}${bindir}
> >> > -        install -m0755 ${B}/ext4_utils/make_ext4fs ${D}${bindir}
> >> > -        install -m0755 ${B}/ext4_utils/simg2img ${D}${bindir}
> >> > -        install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
> >> > -    fi
> >> > -
> >> > -    if echo ${TOOLS} | grep -q "adb " ; then
> >> > -        install -d ${D}${bindir}
> >> > -        install -m0755 ${B}/adb/adb ${D}${bindir}
> >> > -    fi
> >> > -
> >> > -    if echo ${TOOLS} | grep -q "adbd" ; then
> >> > -        install -d ${D}${bindir}
> >> > -        install -m0755 ${B}/adbd/adbd ${D}${bindir}
> >> > -    fi
> >> > -
> >> > -    # Outside the if statement to avoid errors during do_package
> >> > -    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
> >> > -      ${D}${systemd_unitdir}/system/android-tools-adbd.service
> >> > -
> >> > -    if echo ${TOOLS} | grep -q "fastboot" ; then
> >> > -        install -d ${D}${bindir}
> >> > -        install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
> >> > -    fi
> >> > -
> >> > -    if echo ${TOOLS} | grep -q "mkbootimg" ; then
> >> > -        install -d ${D}${bindir}
> >> > -        install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
> >> > -    fi
> >> > -}
> >> > -
> >> > -PACKAGES =3D+ "${PN}-fstools ${PN}-adbd"
> >> > -
> >> > -RDEPENDS_${PN}-adbd =3D "${PN}-conf"
> >> > -RDEPENDS_${PN}-fstools =3D "bash"
> >> > -
> >> > -FILES_${PN}-adbd =3D "\
> >> > -    ${bindir}/adbd \
> >> > -    ${systemd_unitdir}/system/android-tools-adbd.service \
> >> > -"
> >> > -
> >> > -FILES_${PN}-fstools =3D "\
> >> > -    ${bindir}/ext2simg \
> >> > -    ${bindir}/ext4fixup \
> >> > -    ${bindir}/img2simg \
> >> > -    ${bindir}/make_ext4fs \
> >> > -    ${bindir}/simg2img \
> >> > -    ${bindir}/simg2simg \
> >> > -    ${bindir}/simg_dump \
> >> > -    ${bindir}/mkuserimg \
> >> > -"
> >> > -
> >> > -BBCLASSEXTEND =3D "native"
> >> > --
> >> > 2.17.1
> >> >
>

--00000000000060626605c350498d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I thought about it but then that requires me to go and cha=
nge in the android-tools code.=C2=A0<div>Let me try to see how trivial is t=
hat. Else we can get the recipe to meta-clang and add selinux as dynamic la=
yers there.</div><div><br></div><div>regards</div><div>Nisha P</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Do.,=
 27. Mai 2021 um 16:02=C2=A0Uhr schrieb Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com">raj.khem@gmail.com</a>&gt;:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Thu, May 27, 2021 at 12:18 AM Nisha Parrakat=
 &lt;<a href=3D"mailto:nishaparrakat@gmail.com" target=3D"_blank">nishaparr=
akat@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; HI Khem,<br>
&gt; This particular patch will need meta-clang and meta-selinux.<br>
&gt; Where can I find the documentation to use dynamic-layers and include s=
uch cases where we need multple layers for a recipe ?<br>
&gt;<br>
<br>
we already use it in meta-oe for single layer meta-oe/dynamic-layers e,g<br=
>
but if its multiple layers then it is going to be complex. Is it<br>
possible to turn selinux into=C2=A0 a packageconfig ?<br>
<br>
&gt; regards<br>
&gt; Nisha P<br>
&gt;<br>
&gt; Am Do., 27. Mai 2021 um 06:15 Uhr schrieb Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; I am seeing<br>
&gt;&gt;<br>
&gt;&gt; Parsing recipes...ERROR: ParseError at<br>
&gt;&gt; /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-=
oe/recipes-devtools/android-tools/<a href=3D"http://android-tools_10.0.0.r3=
6.bb:77" rel=3D"noreferrer" target=3D"_blank">android-tools_10.0.0.r36.bb:7=
7</a>:<br>
&gt;&gt; Could not inherit file classes/clang.bbclass<br>
&gt;&gt;<br>
&gt;&gt; this seems to depend on meta-clang, so perhaps it should either us=
e<br>
&gt;&gt; dynamic-layers or add it to meta-clang itself.<br>
&gt;&gt;<br>
&gt;&gt; On Wed, May 26, 2021 at 12:59 PM Nisha Parrakat &lt;<a href=3D"mai=
lto:nishaparrakat@gmail.com" target=3D"_blank">nishaparrakat@gmail.com</a>&=
gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; upgrade of android-tools to 10.0.0.r36<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Delete all the old patches that were applicable for<br>
&gt;&gt; &gt; old version.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Use all the makefiles that come with the new version<br>
&gt;&gt; &gt; directly from the source code, just modifying them<br>
&gt;&gt; &gt; to install output to a specific folder<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; a)added <a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" =
target=3D"_blank">rules_yocto.mk</a> that will mimic the debian/rules<br>
&gt;&gt; &gt; b)modified the makefiles of the components to output to<br>
&gt;&gt; &gt; a common dir.<br>
&gt;&gt; &gt; c)<br>
&gt;&gt; &gt; Built boringssl crypto with the option -DOPENSSL_NO_ASM<br>
&gt;&gt; &gt; to solve the below errors<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_encrypt&=
#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_set_encr=
ypt_key&#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_gmult_v8&#3=
9;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_init_v8&#39=
;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `sha256_block_da=
ta_order&#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_ctr32_en=
crypt_blocks&#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_cbc_encr=
ypt&#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_decrypt&#=
39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_encrypt&#=
39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_gmult_neon&=
#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `sha1_block_data=
_order&#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `sha512_block_da=
ta_order&#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_init_neon&#=
39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_set_decr=
ypt_key&#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_set_decry=
pt_key&#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_ghash_neon&=
#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `bn_mul_mont&#39=
;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_decrypt&=
#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_ghash_v8&#3=
9;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_cbc_encry=
pt&#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `ChaCha20_ctr32&=
#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_ctr32_enc=
rypt_blocks&#39;<br>
&gt;&gt; &gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_set_encry=
pt_key&#39;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 Attention : <a href=3D"https://github.com/grpc/grpc/iss=
ues/9440" rel=3D"noreferrer" target=3D"_blank">https://github.com/grpc/grpc=
/issues/9440</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; d) compiled android compatible version of libunwind to be use=
d<br>
&gt;&gt; &gt; to build libbacktrace<br>
&gt;&gt; &gt; e) REQUIRES meta-selinux for libselinux<br>
&gt;&gt; &gt; f) checked compilation and packaging for for x86_64 and aarch=
64<br>
&gt;&gt; &gt; g) UNTESTED android-tools-adbd.service , couldn&#39;t find ho=
w to build adbd<br>
&gt;&gt; &gt; that is needed by the service with the new version of android=
-tools. At<br>
&gt;&gt; &gt; present the service is still packaged but may not work.<br>
&gt;&gt; &gt; h) tested the adb and fastboot on the core-image-minimal by i=
ncluding<br>
&gt;&gt; &gt; the android-tools in the image and ran the commands with &#39=
;help&#39;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Par=
rakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:nishaparr=
akat@gmail.com" target=3D"_blank">nishaparrakat@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://adb.m=
k" rel=3D"noreferrer" target=3D"_blank">adb.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 72 ----<br>
&gt;&gt; &gt;=C2=A0 .../android-tools/adb_mk_change_out_dir.patch |=C2=A0 5=
0 +++<br>
&gt;&gt; &gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://adbd.=
mk" rel=3D"noreferrer" target=3D"_blank">adbd.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 164 --------<br>
&gt;&gt; &gt;=C2=A0 ...scv-Add-risc-v-Android-config-header.patch | 359 ---=
---------------<br>
&gt;&gt; &gt;=C2=A0 .../0001-adb-remove-selinux-extensions.patch=C2=A0 |=C2=
=A0 44 ---<br>
&gt;&gt; &gt;=C2=A0 ...-Use-local-sockets-where-appropriate.patch |=C2=A0 7=
0 ----<br>
&gt;&gt; &gt;=C2=A0 .../core/0003-adb-define-shell-command.patch=C2=A0 |=C2=
=A0 29 --<br>
&gt;&gt; &gt;=C2=A0 ...-adb-Fix-build-on-big-endian-systems.patch |=C2=A0 4=
5 ---<br>
&gt;&gt; &gt;=C2=A0 .../0005-adb-add-base64-implementation.patch=C2=A0 | 34=
8 -----------------<br>
&gt;&gt; &gt;=C2=A0 .../core/0006-adb-Musl-fixes.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 131 -------<br>
&gt;&gt; &gt;=C2=A0 ...sb_linux.c-fix-build-with-glibc-2.28.patch |=C2=A0 2=
4 --<br>
&gt;&gt; &gt;=C2=A0 ...008-adb-Allow-adbd-to-be-ran-as-root.patch |=C2=A0 2=
1 -<br>
&gt;&gt; &gt;=C2=A0 ...Add-dt-parameter-to-specify-DT-image.patch | 110 ---=
---<br>
&gt;&gt; &gt;=C2=A0 ...ux-capability.h-on-linux-systems-too.patch |=C2=A0 2=
3 --<br>
&gt;&gt; &gt;=C2=A0 .../0011-Remove-bionic-specific-calls.patch=C2=A0 =C2=
=A0|=C2=A0 64 ----<br>
&gt;&gt; &gt;=C2=A0 ...laration-of-stlcat-strlcopy-function.patch |=C2=A0 5=
0 ---<br>
&gt;&gt; &gt;=C2=A0 .../core/0013-adb-Support-riscv64.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 189 ---------<br>
&gt;&gt; &gt;=C2=A0 .../android-tools/core/adb_libssl_11.diff=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 39 --<br>
&gt;&gt; &gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://ext4_=
utils.mk" rel=3D"noreferrer" target=3D"_blank">ext4_utils.mk</a> | 103 ----=
-<br>
&gt;&gt; &gt;=C2=A0 ...ext4_utils-remove-selinux-extensions.patch |=C2=A0 3=
9 --<br>
&gt;&gt; &gt;=C2=A0 ...add-o-argument-to-preserve-ownership.patch |=C2=A0 7=
8 ----<br>
&gt;&gt; &gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://fastb=
oot.mk" rel=3D"noreferrer" target=3D"_blank">fastboot.mk</a>=C2=A0 =C2=A0|=
=C2=A0 89 -----<br>
&gt;&gt; &gt;=C2=A0 .../fastboot_compile_remove_gtest.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 51 +++<br>
&gt;&gt; &gt;=C2=A0 .../fastboot_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 52 +++<br>
&gt;&gt; &gt;=C2=A0 .../android-tools/android-tools/gitignore=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 59 ---<br>
&gt;&gt; &gt;=C2=A0 .../img2simg_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 41 ++<br>
&gt;&gt; &gt;=C2=A0 .../libadb_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 44 +++<br>
&gt;&gt; &gt;=C2=A0 .../libbacktrace_mk_change_out_dir.patch=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 60 +++<br>
&gt;&gt; &gt;=C2=A0 .../libbase_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 33 ++<br>
&gt;&gt; &gt;=C2=A0 .../libcrypto_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 30 ++<br>
&gt;&gt; &gt;=C2=A0 .../libcrypto_utils_mk_change_out_dir.patch=C2=A0 =C2=
=A0|=C2=A0 38 ++<br>
&gt;&gt; &gt;=C2=A0 .../libcutils_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 27 ++<br>
&gt;&gt; &gt;=C2=A0 .../libext4_utils_mk_change_out_dir.patch=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 42 ++<br>
&gt;&gt; &gt;=C2=A0 .../libfec_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 35 ++<br>
&gt;&gt; &gt;=C2=A0 .../liblog_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 42 ++<br>
&gt;&gt; &gt;=C2=A0 .../0001-Remove-bionic-specific-calls.patch=C2=A0 =C2=
=A0|=C2=A0 25 --<br>
&gt;&gt; &gt;=C2=A0 ...t-define-gettid-if-glibc-2.30-is-use.patch |=C2=A0 4=
9 ---<br>
&gt;&gt; &gt;=C2=A0 .../libsparse_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 47 +++<br>
&gt;&gt; &gt;=C2=A0 .../libunwind_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 47 +++<br>
&gt;&gt; &gt;=C2=A0 .../libziparchive_mk_change_out_dir.patch=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 47 +++<br>
&gt;&gt; &gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://mkboo=
timg.mk" rel=3D"noreferrer" target=3D"_blank">mkbootimg.mk</a>=C2=A0 |=C2=
=A0 29 --<br>
&gt;&gt; &gt;=C2=A0 .../android-tools/<a href=3D"http://rules_yocto.mk" rel=
=3D"noreferrer" target=3D"_blank">rules_yocto.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt;&gt; &gt;=C2=A0 .../simg2img_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 41 ++<br>
&gt;&gt; &gt;=C2=A0 ...me_space_std_to_compile_libbacktrace.patch |=C2=A0 1=
9 +<br>
&gt;&gt; &gt;=C2=A0 .../android-tools/<a href=3D"http://android-tools_10.0.=
0.r36.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_10.0.0.r36.bb<=
/a> | 204 ++++++++++<br>
&gt;&gt; &gt;=C2=A0 .../android-tools/<a href=3D"http://android-tools_5.1.1=
.r37.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_5.1.1.r37.bb</a=
>=C2=A0 | 182 ---------<br>
&gt;&gt; &gt;=C2=A0 46 files changed, 954 insertions(+), 2435 deletions(-)<=
br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/<a href=3D"http://adb.mk" rel=3D"noreferrer" target=3D"_bl=
ank">adb.mk</a><br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/adb_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/<a href=3D"http://adbd.mk" rel=3D"noreferrer" target=3D"_b=
lank">adbd.mk</a><br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch<br=
>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0001-adb-remove-selinux-extensions.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch<br=
>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0003-adb-define-shell-command.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0005-adb-add-base64-implementation.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0006-adb-Musl-fixes.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch<=
br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.p=
atch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patc=
h<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0011-Remove-bionic-specific-calls.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-func=
tion.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0013-adb-Support-riscv64.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/core/adb_libssl_11.diff<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/<a href=3D"http://ext4_utils.mk" rel=3D"noreferrer" target=
=3D"_blank">ext4_utils.mk</a><br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownershi=
p.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/<a href=3D"http://fastboot.mk" rel=3D"noreferrer" target=
=3D"_blank">fastboot.mk</a><br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/fastboot_compile_remove_gtest.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/fastboot_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/gitignore<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/img2simg_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libadb_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libbacktrace_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libbase_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libcrypto_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libcrypto_utils_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libcutils_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libext4_utils_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libfec_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/liblog_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libselinux/0001-Remove-bionic-specific-calls.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2=
.30-is-use.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libsparse_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libunwind_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/libziparchive_mk_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/<a href=3D"http://mkbootimg.mk" rel=3D"noreferrer" target=
=3D"_blank">mkbootimg.mk</a><br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" targe=
t=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/simg2img_change_out_dir.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/android-tools/use_name_space_std_to_compile_libbacktrace.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-too=
ls/<a href=3D"http://android-tools_10.0.0.r36.bb" rel=3D"noreferrer" target=
=3D"_blank">android-tools_10.0.0.r36.bb</a><br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-too=
ls/<a href=3D"http://android-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=
=3D"_blank">android-tools_5.1.1.r37.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/<a href=3D"http://adb.mk" rel=3D"noreferrer" target=3D"_blank">adb.mk<=
/a> b/meta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"http:=
//adb.mk" rel=3D"noreferrer" target=3D"_blank">adb.mk</a><br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 0687c22c1..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/<a=
 href=3D"http://adb.mk" rel=3D"noreferrer" target=3D"_blank">adb.mk</a><br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,72 +0,0 @@<br>
&gt;&gt; &gt; -# Makefile for adb<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -SRCDIR ?=3D $(S)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/adb<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D adb.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D console.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D transport.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D transport_local.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D transport_usb.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D commandline.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D adb_client.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D adb_auth_host.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D sockets.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D services.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D file_sync_client.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D get_my_path_linux.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D usb_linux.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D usb_vendors.c<br>
&gt;&gt; &gt; -adb_SRC_FILES +=3D fdevent.c<br>
&gt;&gt; &gt; -adb_OBJS :=3D $(adb_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/libcutils<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D atomic.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D hashmap.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D native_handle.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D config_utils.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D cpu_info.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D load_file.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D open_memstream.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D strdup16to8.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D strdup8to16.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D record_stream.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D process_name.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D threads.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D sched_policy.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D iosched_policy.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D str_parms.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D fs.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D multiuser.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_inaddr_any_server.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_local_client.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_local_server.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_loopback_client.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_loopback_server.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_network_client.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D sockets.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D ashmem-host.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D dlmalloc_stubs.c<br>
&gt;&gt; &gt; -libcutils_OBJS :=3D $(libcutils_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -CFLAGS +=3D -DANDROID<br>
&gt;&gt; &gt; -CFLAGS +=3D -DWORKAROUND_BUG6558362<br>
&gt;&gt; &gt; -CFLAGS +=3D -DADB_HOST=3D1<br>
&gt;&gt; &gt; -CFLAGS +=3D -D_XOPEN_SOURCE -D_GNU_SOURCE<br>
&gt;&gt; &gt; -CFLAGS +=3D -DANDROID_SMP=3D0<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/adb<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch=
/$(android_arch)/AndroidConfig.h<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -LIBS +=3D libcutils.a -lpthread -lcrypto<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -all: adb<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -adb: libcutils.a $(adb_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(adb_OBJS=
) $(LIBS)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libcutils.a: $(libcutils_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libcutils_OBJS)<br=
>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -clean:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) $(adb_OBJS) $(libcutils_OBJ=
S) adb *.a<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/adb_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/a=
ndroid-tools/adb_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..8c07e133a<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/ad=
b_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,50 @@<br>
&gt;&gt; &gt; +patching <a href=3D"http://adb.mk" rel=3D"noreferrer" target=
=3D"_blank">adb.mk</a> to build in yocto environment.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Changes include:<br>
&gt;&gt; &gt; +Introduced an output folder which will keep all the outputs =
from the<br>
&gt;&gt; &gt; +android-tools.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary to the=
 OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Pending<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://adb.mk" rel=3D"=
noreferrer" target=3D"_blank">adb.mk</a>=C2=A0 =C2=A0 =C2=A0 2021-04-29 21:=
11:00.617892503 +0200<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://adb.mk" rel=3D"=
noreferrer" target=3D"_blank">adb.mk</a>=C2=A0 =C2=A0 =C2=A0 2021-04-29 21:=
17:33.256016600 +0200<br>
&gt;&gt; &gt; +@@ -1,3 +1,4 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME =3D adb<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + SOURCES =3D client/adb_client.cpp \<br>
&gt;&gt; &gt; +@@ -12,10 +13,10 @@<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + SOURCES :=3D $(foreach source, $(SOURCES), adb/$(source))<b=
r>
&gt;&gt; &gt; + CXXFLAGS +=3D -std=3Dgnu++2a<br>
&gt;&gt; &gt; +-CPPFLAGS +=3D -Iinclude -Iadb -Ibase/include \<br>
&gt;&gt; &gt; ++CPPFLAGS +=3D -Iinclude -Iadb -Ibase/include=C2=A0 -I$(OUT_=
DIR)/usr/include/ \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DADB_VERSIO=
N=3D&#39;&quot;$(DEB_VERSION)&quot;&#39; -DADB_HOST=3D1 -D_GNU_SOURCE<br>
&gt;&gt; &gt; +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/an=
droid -Wl,-rpath-link=3D. \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -L. -lad=
b -lbase<br>
&gt;&gt; &gt; ++LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/an=
droid -Wl,-rpath-link=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \=
<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -L$(OUT_=
DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ -ladb -lbase<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + # -latomic should be the last library specified<br>
&gt;&gt; &gt; + # <a href=3D"https://github.com/android/ndk/issues/589" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/android/ndk/issues/589=
</a><br>
&gt;&gt; &gt; +@@ -24,7 +25,8 @@<br>
&gt;&gt; &gt; + endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(SOURCES)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o adb/$(NAME) $(CXXFLAGS) $=
(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/lib/$(D=
EB_HOST_MULTIARCH)/android/adb<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android/adb/$(NAME) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) adb/$(NAME)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MU=
LTIARCH)/android/adb/$(NAME)<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/<a href=3D"http://adbd.mk" rel=3D"noreferrer" target=3D"_blank">adbd.m=
k</a> b/meta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"htt=
p://adbd.mk" rel=3D"noreferrer" target=3D"_blank">adbd.mk</a><br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 31452ae10..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/<a=
 href=3D"http://adbd.mk" rel=3D"noreferrer" target=3D"_blank">adbd.mk</a><b=
r>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,164 +0,0 @@<br>
&gt;&gt; &gt; -# Makefile for adbd<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -SRCDIR ?=3D $(S)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/adb<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D adb.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D fdevent.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D transport.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D transport_local.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D transport_usb.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D adb_auth_client.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D sockets.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D services.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D file_sync_service.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D jdwp_service.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D framebuffer_service.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D remount_service.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D disable_verity_service.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D base64.c<br>
&gt;&gt; &gt; -adbd_SRC_FILES +=3D usb_linux_client.c<br>
&gt;&gt; &gt; -adbd_OBJS :=3D $(adbd_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/liblog<br>
&gt;&gt; &gt; -liblog_SRC_FILES +=3D logd_write.c<br>
&gt;&gt; &gt; -liblog_SRC_FILES +=3D log_event_write.c<br>
&gt;&gt; &gt; -liblog_SRC_FILES +=3D logprint.c<br>
&gt;&gt; &gt; -liblog_SRC_FILES +=3D event_tag_map.c<br>
&gt;&gt; &gt; -liblog_SRC_FILES +=3D fake_log_device.c<br>
&gt;&gt; &gt; -liblog_OBJS :=3D $(liblog_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/fs_mgr<br>
&gt;&gt; &gt; -fs_mgr_SRC_FILES +=3D fs_mgr_fstab.c<br>
&gt;&gt; &gt; -fs_mgr_OBJS :=3D $(fs_mgr_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/libcutils<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D atomic.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D hashmap.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D native_handle.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D config_utils.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D cpu_info.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D load_file.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D open_memstream.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D strdup16to8.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D strdup8to16.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D record_stream.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D process_name.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D threads.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D sched_policy.c<br>
&gt;&gt; &gt; -# libcutils_SRC_FILES +=3D iosched_policy.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D str_parms.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D fs.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D multiuser.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_inaddr_any_server.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_local_client.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_local_server.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_loopback_client.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_loopback_server.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D socket_network_client.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D sockets.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D ashmem-host.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D dlmalloc_stubs.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D klog.c<br>
&gt;&gt; &gt; -libcutils_SRC_FILES +=3D properties.c<br>
&gt;&gt; &gt; -libcutils_OBJS :=3D $(libcutils_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/external/libselinux/src<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D booleans.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D canonicalize_context.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D disable.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D enabled.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D fgetfilecon.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D fsetfilecon.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D getenforce.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D getfilecon.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D getpeercon.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D lgetfilecon.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D load_policy.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D lsetfilecon.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D policyvers.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D procattr.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D setenforce.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D setfilecon.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D context.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D mapping.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D stringrep.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D compute_create.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D compute_av.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D avc.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D avc_internal.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D avc_sidtab.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D get_initial_context.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D checkAccess.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D sestatus.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D deny_unknown.c<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D callbacks.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D check_context.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D freecon.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D init.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D label.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D label_file.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D label_android_property.c<br>
&gt;&gt; &gt; -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D make_ext4fs.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D ext4fixup.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D ext4_utils.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D allocate.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D contents.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D extent.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D indirect.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D uuid.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D sha1.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D wipe.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D crc16.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D ext4_sb.c<br>
&gt;&gt; &gt; -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)<b=
r>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -CFLAGS +=3D -std=3Dgnu11<br>
&gt;&gt; &gt; -CFLAGS +=3D -DANDROID<br>
&gt;&gt; &gt; -CFLAGS +=3D -DADB_HOST=3D0<br>
&gt;&gt; &gt; -CFLAGS +=3D -D_XOPEN_SOURCE -D_GNU_SOURCE<br>
&gt;&gt; &gt; -CFLAGS +=3D -DALLOW_ADBD_ROOT=3D1<br>
&gt;&gt; &gt; -CFLAGS +=3D -DALLOW_ADBD_DISABLE_VERITY=3D1<br>
&gt;&gt; &gt; -CFLAGS +=3D -DPROP_NAME_MAX=3D32<br>
&gt;&gt; &gt; -CFLAGS +=3D -DPROP_VALUE_MAX=3D92<br>
&gt;&gt; &gt; -CFLAGS +=3D -DAUDITD_LOG_TAG=3D1003<br>
&gt;&gt; &gt; -# CFLAGS +=3D -DHOST<br>
&gt;&gt; &gt; -CFLAGS +=3D -DANDROID_SMP=3D0<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/adb<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/fs_mgr/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/hardware/libhardware/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch=
/$(android_arch)/AndroidConfig.h<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -LIBS +=3D liblog.a libfs_mgr.a libcutils.a libselinux.a libe=
xt4_utils.a -lpthread -lbsd -lpcre -lresolv -lcrypto<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -all: adbd<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -adbd: liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_=
utils.a $(adbd_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(adbd_OBJ=
S) $(LIBS)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -liblog.a: $(liblog_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(liblog_OBJS)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libfs_mgr.a: $(fs_mgr_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(fs_mgr_OBJS)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libcutils.a: $(libcutils_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libcutils_OBJS)<br=
>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libselinux.a: $(libselinux_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CFLAGS=3D&quot;-DANDROID -=
DHOST&quot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libselinux_OBJS)<b=
r>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libext4_utils.a: $(libext4_utils_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libext4_utils_OBJS=
)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -clean:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) *.o *.a adbd<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/build/0001-Riscv-Add-risc-v-Android-config-header.patch b/meta-oe/reci=
pes-devtools/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Androi=
d-config-header.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 57c443b70..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/bu=
ild/0001-Riscv-Add-risc-v-Android-config-header.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,359 +0,0 @@<br>
&gt;&gt; &gt; -From 82dce13ea7b5b31c63851bd67f66072413917e73 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Chenxi Mao &lt;<a href=3D"mailto:maochenxi@eswin.com" =
target=3D"_blank">maochenxi@eswin.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Mon, 20 Apr 2020 15:32:40 +0800<br>
&gt;&gt; &gt; -Subject: [PATCH 1/1] Riscv: Add risc-v Android config header=
<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - .../arch/linux-riscv64/AndroidConfig.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 340 ++++++++++++++++++<br>
&gt;&gt; &gt; - 1 file changed, 340 insertions(+)<br>
&gt;&gt; &gt; - create mode 100644 core/combo/include/arch/linux-riscv64/An=
droidConfig.h<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/core/combo/include/arch/linux-riscv64/AndroidCo=
nfig.h b/core/combo/include/arch/linux-riscv64/AndroidConfig.h<br>
&gt;&gt; &gt; -new file mode 100644<br>
&gt;&gt; &gt; -index 0000000000..bcbda8f87f<br>
&gt;&gt; &gt; ---- /dev/null<br>
&gt;&gt; &gt; -+++ b/core/combo/include/arch/linux-riscv64/AndroidConfig.h<=
br>
&gt;&gt; &gt; -@@ -0,0 +1,340 @@<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Copyright (C) 2013 The Android Open Source Project<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * Licensed under the Apache License, Version 2.0 (the &quo=
t;License&quot;);<br>
&gt;&gt; &gt; -+ * you may not use this file except in compliance with the =
License.<br>
&gt;&gt; &gt; -+ * You may obtain a copy of the License at<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ *=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.apache.org/lic=
enses/LICENSE-2.0" rel=3D"noreferrer" target=3D"_blank">http://www.apache.o=
rg/licenses/LICENSE-2.0</a><br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * Unless required by applicable law or agreed to in writin=
g, software<br>
&gt;&gt; &gt; -+ * distributed under the License is distributed on an &quot=
;AS IS&quot; BASIS,<br>
&gt;&gt; &gt; -+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either exp=
ress or implied.<br>
&gt;&gt; &gt; -+ * See the License for the specific language governing perm=
issions and<br>
&gt;&gt; &gt; -+ * limitations under the License.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Android config -- &quot;android-aarch64&quot;.=C2=A0 Use=
d for ARM aarch64 device builds.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#ifndef _ANDROID_CONFIG_H<br>
&gt;&gt; &gt; -+#define _ANDROID_CONFIG_H<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !!! IMPORTANT !!!<br>
&gt;&gt; &gt; -+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * This file is included by ALL C/C++ source files.=C2=A0 D=
on&#39;t put anything in<br>
&gt;&gt; &gt; -+ * here unless you are absolutely certain it can&#39;t go a=
nywhere else.<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * Any C++ stuff must be wrapped with &quot;#ifdef __cplusp=
lus&quot;.=C2=A0 Do not use &quot;//&quot;<br>
&gt;&gt; &gt; -+ * comments.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Threading model.=C2=A0 Choose one:<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * HAVE_PTHREADS - use the pthreads library.<br>
&gt;&gt; &gt; -+ * HAVE_WIN32_THREADS - use Win32 thread primitives.<br>
&gt;&gt; &gt; -+ *=C2=A0 -- combine HAVE_CREATETHREAD, HAVE_CREATEMUTEX, an=
d HAVE__BEGINTHREADEX<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_PTHREADS<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Do we have pthread_setname_np()?<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * (HAVE_PTHREAD_SETNAME_NP is used by WebKit to enable a f=
unction with<br>
&gt;&gt; &gt; -+ * the same name but different parameters, so we can&#39;t =
use that here.)<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_ANDROID_PTHREAD_SETNAME_NP<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Do we have the futex syscall?<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_FUTEX<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Process creation model.=C2=A0 Choose one:<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * HAVE_FORKEXEC - use fork() and exec()<br>
&gt;&gt; &gt; -+ * HAVE_WIN32_PROC - use CreateProcess()<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_FORKEXEC<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Process out-of-memory adjustment.=C2=A0 Set if running o=
n Linux,<br>
&gt;&gt; &gt; -+ * where we can write to /proc/&lt;pid&gt;/oom_adj to modif=
y the out-of-memory<br>
&gt;&gt; &gt; -+ * badness adjustment.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_OOM_ADJ<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * IPC model.=C2=A0 Choose one:<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * HAVE_SYSV_IPC - use the classic SysV IPC mechanisms (sem=
get, shmget).<br>
&gt;&gt; &gt; -+ * HAVE_MACOSX_IPC - use Macintosh IPC mechanisms (sem_open=
, mmap).<br>
&gt;&gt; &gt; -+ * HAVE_WIN32_IPC - use Win32 IPC (CreateSemaphore, CreateF=
ileMapping).<br>
&gt;&gt; &gt; -+ * HAVE_ANDROID_IPC - use Android versions (?, mmap).<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_ANDROID_IPC<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Memory-mapping model. Choose one:<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * HAVE_POSIX_FILEMAP - use the Posix sys/mmap.h<br>
&gt;&gt; &gt; -+ * HAVE_WIN32_FILEMAP - use Win32 filemaps<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define=C2=A0 HAVE_POSIX_FILEMAP<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define this if you have &lt;termio.h&gt;<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define=C2=A0 HAVE_TERMIO_H 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define this if you have &lt;sys/sendfile.h&gt;<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define=C2=A0 HAVE_SYS_SENDFILE_H 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define this if you build against MSVCRT.DLL<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+/* #define HAVE_MS_C_RUNTIME */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define this if you have sys/uio.h<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define=C2=A0 HAVE_SYS_UIO_H 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define this if your platforms implements symbolic links<=
br>
&gt;&gt; &gt; -+ * in its filesystems<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_SYMLINKS<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define this if we have localtime_r().<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+/* #define HAVE_LOCALTIME_R 1 */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define this if we have gethostbyname_r().<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+/* #define HAVE_GETHOSTBYNAME_R */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define this if we have ioctl().<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_IOCTL<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define this if we want to use WinSock.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+/* #define HAVE_WINSOCK */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define this if have clock_gettime() and friends<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_POSIX_CLOCKS<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define this if we have linux style epoll()<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_EPOLL<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Endianness of the target machine.=C2=A0 Choose one:<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * HAVE_ENDIAN_H -- have endian.h header we can include.<br=
>
&gt;&gt; &gt; -+ * HAVE_LITTLE_ENDIAN -- we are little endian.<br>
&gt;&gt; &gt; -+ * HAVE_BIG_ENDIAN -- we are big endian.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_ENDIAN_H<br>
&gt;&gt; &gt; -+#define HAVE_LITTLE_ENDIAN<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+#define _FILE_OFFSET_BITS 64<br>
&gt;&gt; &gt; -+/* #define _LARGEFILE_SOURCE 1 */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if platform has off64_t (and lseek64 and other xx=
x64 functions)<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_OFF64_T<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Defined if we have the backtrace() call for retrieving a=
 stack trace.<br>
&gt;&gt; &gt; -+ * Needed for CallStack to operate; if not defined, CallSta=
ck is<br>
&gt;&gt; &gt; -+ * non-functional.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_BACKTRACE 0<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Defined if we have the cxxabi.h header for demangling C+=
+ symbols.=C2=A0 If<br>
&gt;&gt; &gt; -+ * not defined, stack crawls will be displayed with raw man=
gled symbols<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_CXXABI 0<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Defined if we have the gettid() system call.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_GETTID<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Defined if we have the sched_setscheduler() call<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_SCHED_SETSCHEDULER<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Add any extra platform-specific defines here.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#ifndef __linux__<br>
&gt;&gt; &gt; -+#define __linux__<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if we have &lt;malloc.h&gt; header<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_MALLOC_H<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if we&#39;re running on *our* linux on device or =
emulator.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_ANDROID_OS 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if we have Linux-style non-filesystem Unix Domain=
 Sockets<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_LINUX_LOCAL_SOCKET_NAMESPACE 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if we have Linux&#39;s inotify in &lt;sys/inotify=
.h&gt;.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_INOTIFY 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if we have madvise() in &lt;sys/mman.h&gt;<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_MADVISE 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if tm struct has tm_gmtoff field<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_TM_GMTOFF 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if dirent struct has d_type field<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_DIRENT_D_TYPE 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if libc includes Android system properties implem=
entation.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_LIBC_SYSTEM_PROPERTIES 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if system provides a system property server (shou=
ld be<br>
&gt;&gt; &gt; -+ * mutually exclusive with HAVE_LIBC_SYSTEM_PROPERTIES).<br=
>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+/* #define HAVE_SYSTEM_PROPERTY_SERVER */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * What CPU architecture does this platform use?<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define ARCH_AARCH64<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if the size of enums is as short as possible,<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+/* #define HAVE_SHORT_ENUMS */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * sprintf() format string for shared library naming.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define OS_SHARED_LIB_FORMAT_STR=C2=A0 =C2=A0 &quot;lib%s.s=
o&quot;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * type for the third argument to mincore().<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define MINCORE_POINTER_TYPE unsigned char *<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * The default path separator for the platform<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define OS_PATH_SEPARATOR &#39;/&#39;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Is the filesystem case sensitive?<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define OS_CASE_SENSITIVE<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if &lt;sys/socket.h&gt; exists.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_SYS_SOCKET_H 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if the strlcpy() function exists on the system.<b=
r>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_STRLCPY 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if the open_memstream() function exists on the sy=
stem.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+/* #define HAVE_OPEN_MEMSTREAM 1 */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if the BSD funopen() function exists on the syste=
m.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_FUNOPEN 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if prctl() exists<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_PRCTL 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if writev() exists<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_WRITEV 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if &lt;stdint.h&gt; exists.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_STDINT_H 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if &lt;stdbool.h&gt; exists.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_STDBOOL_H 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if &lt;sched.h&gt; exists.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_SCHED_H 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if pread() exists<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_PREAD 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if we have st_mtim in struct stat<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_STAT_ST_MTIM 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define if printf() supports %zd for size_t arguments<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_PRINTF_ZD 1<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define to 1 if &lt;stdlib.h&gt; provides qsort_r() with =
a BSD style function prototype.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_BSD_QSORT_R 0<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Define to 1 if &lt;stdlib.h&gt; provides qsort_r() with =
a GNU style function prototype.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+#define HAVE_GNU_QSORT_R 0<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+#endif /* _ANDROID_CONFIG_H */<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; -2.17.1<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0001-adb-remove-selinux-extensions.patch b/meta-oe/recipes-devtoo=
ls/android-tools/android-tools/core/0001-adb-remove-selinux-extensions.patc=
h<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 7d20c5068..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0001-adb-remove-selinux-extensions.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,44 +0,0 @@<br>
&gt;&gt; &gt; -From 7b7200727413ca4a9bb132221c543ec033dffafa Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Sergio Schvezov &lt;<a href=3D"mailto:sergio.schvezov@=
canonical.com" target=3D"_blank">sergio.schvezov@canonical.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH] adb: remove selinux extensions<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -* drop useless includes of Android SELINUX extensions<br>
&gt;&gt; &gt; -* avoids having to clone another module<br>
&gt;&gt; &gt; -* this should be sent upstream<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Inappropriate<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jan=
sa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - adb/file_sync_service.c | 3 ---<br>
&gt;&gt; &gt; - 1 file changed, 3 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/adb/file_sync_service.c b/adb/file_sync_service=
.c<br>
&gt;&gt; &gt; -index 7933858516..3cbd0cd863 100644<br>
&gt;&gt; &gt; ---- a/adb/file_sync_service.c<br>
&gt;&gt; &gt; -+++ b/adb/file_sync_service.c<br>
&gt;&gt; &gt; -@@ -26,7 +26,6 @@<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &lt;errno.h&gt;<br>
&gt;&gt; &gt; - #include &lt;private/android_filesystem_config.h&gt;<br>
&gt;&gt; &gt; --#include &lt;selinux/android.h&gt;<br>
&gt;&gt; &gt; - #include &quot;sysdeps.h&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #define TRACE_TAG=C2=A0 TRACE_SYNC<br>
&gt;&gt; &gt; -@@ -73,7 +72,6 @@ static int mkdirs(char *name)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*x =3D &#39;/&#39;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return ret;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 selinux_android_r=
estorecon(name, 0);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*x++ =3D &#39;/&#39;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -@@ -251,7 +249,6 @@ static int handle_send_file(int s, char =
*path, uid_t uid,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if(fd &gt;=3D 0) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct utimbuf u;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adb_close(fd);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 selinux_android_restorecon(path=
, 0);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u.actime =3D timestamp;<br=
>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u.modtime =3D timestamp;<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0utime(path, &amp;u);<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0002-adb-Use-local-sockets-where-appropriate.patch b/meta-oe/reci=
pes-devtools/android-tools/android-tools/core/0002-adb-Use-local-sockets-wh=
ere-appropriate.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 3627110ad..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0002-adb-Use-local-sockets-where-appropriate.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,70 +0,0 @@<br>
&gt;&gt; &gt; -From d855f042ca09a358cebe2d3c1d29d512afd7ebb8 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Hilko Bengen &lt;<a href=3D"mailto:bengen@debian.org" =
target=3D"_blank">bengen@debian.org</a>&gt;<br>
&gt;&gt; &gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH] adb: Use local sockets where appropriate<br=
>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Inappropriate<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - adb/adb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
6 +++++-<br>
&gt;&gt; &gt; - adb/adb_client.c=C2=A0 =C2=A0 =C2=A0 | 5 +++--<br>
&gt;&gt; &gt; - adb/transport_local.c | 3 ++-<br>
&gt;&gt; &gt; - 3 files changed, 10 insertions(+), 4 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/adb/adb.c b/adb/adb.c<br>
&gt;&gt; &gt; -index 10a1e0da26..027edd9359 100644<br>
&gt;&gt; &gt; ---- a/adb/adb.c<br>
&gt;&gt; &gt; -+++ b/adb/adb.c<br>
&gt;&gt; &gt; -@@ -1230,7 +1230,11 @@ int launch_server(int server_port)<br=
>
&gt;&gt; &gt; -=C2=A0 */<br>
&gt;&gt; &gt; - void build_local_name(char* target_str, size_t target_size,=
 int server_port)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; --=C2=A0 snprintf(target_str, target_size, &quot;tcp:%d&quot;=
, server_port);<br>
&gt;&gt; &gt; -+=C2=A0 if (gListenAll &gt; 0) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 snprintf(target_str, target_size, &quot;tcp:%=
d&quot;, server_port);<br>
&gt;&gt; &gt; -+=C2=A0 } else {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 snprintf(target_str, target_size, &quot;local=
:%d&quot;, server_port);<br>
&gt;&gt; &gt; -+=C2=A0 }<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #if !ADB_HOST<br>
&gt;&gt; &gt; -diff --git a/adb/adb_client.c b/adb/adb_client.c<br>
&gt;&gt; &gt; -index eb1720d22c..a383faefe3 100644<br>
&gt;&gt; &gt; ---- a/adb/adb_client.c<br>
&gt;&gt; &gt; -+++ b/adb/adb_client.c<br>
&gt;&gt; &gt; -@@ -185,12 +185,12 @@ int _adb_connect(const char *service)<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy(__adb_error, &quot;=
service name too long&quot;);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 snprintf(tmp, sizeof tmp, &quot;%04x&quot;, l=
en);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 snprintf(tmp, sizeof tmp, &quot;%d&quot;, __a=
db_server_port);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (__adb_server_name)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D socket_network_clie=
nt(__adb_server_name, __adb_server_port, SOCK_STREAM);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_loopback_client(_=
_adb_server_port, SOCK_STREAM);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_local_client(tmp,=
 ANDROID_SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if(fd &lt; 0) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy(__adb_error, &quot;=
cannot connect to daemon&quot;);<br>
&gt;&gt; &gt; -@@ -201,6 +201,7 @@ int _adb_connect(const char *service)<br=
>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 snprintf(tmp, sizeof tmp, &quot;%04x&quot;, l=
en);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if(writex(fd, tmp, 4) || writex(fd, serv=
ice, len)) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy(__adb_error, &quot;=
write failure during connection&quot;);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adb_close(fd);<br>
&gt;&gt; &gt; -diff --git a/adb/transport_local.c b/adb/transport_local.c<b=
r>
&gt;&gt; &gt; -index 948cc15812..71582a8c88 100644<br>
&gt;&gt; &gt; ---- a/adb/transport_local.c<br>
&gt;&gt; &gt; -+++ b/adb/transport_local.c<br>
&gt;&gt; &gt; -@@ -121,7 +121,8 @@ int local_connect_arbitrary_ports(int co=
nsole_port, int adb_port)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_loopback_client(a=
db_port, SOCK_STREAM);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(buf, sizeof buf, &quot=
;%d&quot;, adb_port);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_local_client(buf,=
 ANDROID_SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (fd &gt;=3D 0) {<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0003-adb-define-shell-command.patch b/meta-oe/recipes-devtools/an=
droid-tools/android-tools/core/0003-adb-define-shell-command.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index cf1d9cbc3..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0003-adb-define-shell-command.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,29 +0,0 @@<br>
&gt;&gt; &gt; -From 4421c2e19946dcd651fd8ac022b96627fc526149 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Fathi Boudra &lt;<a href=3D"mailto:fabo@debian.org" ta=
rget=3D"_blank">fabo@debian.org</a>&gt;<br>
&gt;&gt; &gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH] adb: define shell command<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -we intend to run on Linux system so the shell is always /bin=
/sh,<br>
&gt;&gt; &gt; -for the host or the target.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Inappropriate<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - adb/services.c | 4 ----<br>
&gt;&gt; &gt; - 1 file changed, 4 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/adb/services.c b/adb/services.c<br>
&gt;&gt; &gt; -index 21b08dc201..d44b0c5068 100644<br>
&gt;&gt; &gt; ---- a/adb/services.c<br>
&gt;&gt; &gt; -+++ b/adb/services.c<br>
&gt;&gt; &gt; -@@ -299,11 +299,7 @@ static int create_subproc_raw(const cha=
r *cmd, const char *arg0, const char *arg<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; - #endif=C2=A0 /* !ABD_HOST */<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --#if ADB_HOST<br>
&gt;&gt; &gt; - #define SHELL_COMMAND &quot;/bin/sh&quot;<br>
&gt;&gt; &gt; --#else<br>
&gt;&gt; &gt; --#define SHELL_COMMAND &quot;/system/bin/sh&quot;<br>
&gt;&gt; &gt; --#endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #if !ADB_HOST<br>
&gt;&gt; &gt; - static void subproc_waiter_service(int fd, void *cookie)<br=
>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0004-adb-Fix-build-on-big-endian-systems.patch b/meta-oe/recipes-=
devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-=
systems.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 79e9d4d3b..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0004-adb-Fix-build-on-big-endian-systems.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,45 +0,0 @@<br>
&gt;&gt; &gt; -From 548b8ca62c64a16305929e2eaf3d546d48de9c25 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzon=
i@free-electrons.com" target=3D"_blank">thomas.petazzoni@free-electrons.com=
</a>&gt;<br>
&gt;&gt; &gt; -Date: Tue, 21 Feb 2017 19:46:24 +0100<br>
&gt;&gt; &gt; -Subject: [PATCH] adb: Fix build on big endian systems<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -The usb_linux_client.c file defines cpu_to_le16/32 by using =
the C<br>
&gt;&gt; &gt; -library htole16/32 function calls. However, cpu_to_le16/32 a=
re used<br>
&gt;&gt; &gt; -when initializing structures, i.e in a context where a funct=
ion call<br>
&gt;&gt; &gt; -is not allowed.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -It works fine on little endian systems because htole16/32 ar=
e defined<br>
&gt;&gt; &gt; -by the C library as no-ops. But on big-endian systems, they =
are<br>
&gt;&gt; &gt; -actually doing something, which might involve calling a func=
tion,<br>
&gt;&gt; &gt; -causing build failures.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -To solve this, we simply open-code cpu_to_le16/32 in a way t=
hat allows<br>
&gt;&gt; &gt; -them to be used when initializing structures.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas=
.petazzoni@free-electrons.com" target=3D"_blank">thomas.petazzoni@free-elec=
trons.com</a>&gt;<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - adb/usb_linux_client.c | 11 +++++++++--<br>
&gt;&gt; &gt; - 1 file changed, 9 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/adb/usb_linux_client.c b/adb/usb_linux_client.c=
<br>
&gt;&gt; &gt; -index 8426e0ea14..6e8b5bbbd2 100644<br>
&gt;&gt; &gt; ---- a/adb/usb_linux_client.c<br>
&gt;&gt; &gt; -+++ b/adb/usb_linux_client.c<br>
&gt;&gt; &gt; -@@ -34,8 +34,15 @@<br>
&gt;&gt; &gt; - #define MAX_PACKET_SIZE_FS=C2=A0 =C2=A0 64<br>
&gt;&gt; &gt; - #define MAX_PACKET_SIZE_HS=C2=A0 =C2=A0 512<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --#define cpu_to_le16(x)=C2=A0 htole16(x)<br>
&gt;&gt; &gt; --#define cpu_to_le32(x)=C2=A0 htole32(x)<br>
&gt;&gt; &gt; -+#if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN<br>
&gt;&gt; &gt; -+# define cpu_to_le16(x) (x)<br>
&gt;&gt; &gt; -+# define cpu_to_le32(x) (x)<br>
&gt;&gt; &gt; -+#else<br>
&gt;&gt; &gt; -+# define cpu_to_le16(x) ((((x) &gt;&gt; 8) &amp; 0xffu) | (=
((x) &amp; 0xffu) &lt;&lt; 8))<br>
&gt;&gt; &gt; -+# define cpu_to_le32(x) \<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 ((((x) &amp; 0xff000000u) &gt;&gt; 24)=
 | (((x) &amp; 0x00ff0000u) &gt;&gt;=C2=A0 8) | \<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0(((x) &amp; 0x0000ff00u) &lt;&lt=
;=C2=A0 8) | (((x) &amp; 0x000000ffu) &lt;&lt; 24))<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - struct usb_handle<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0005-adb-add-base64-implementation.patch b/meta-oe/recipes-devtoo=
ls/android-tools/android-tools/core/0005-adb-add-base64-implementation.patc=
h<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index fcd4ae238..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0005-adb-add-base64-implementation.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,348 +0,0 @@<br>
&gt;&gt; &gt; -From 753bcb5971401b82fb2e6197d31c9e386f6d0392 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Fri, 15 Sep 2017 15:46:38 -0700<br>
&gt;&gt; &gt; -Subject: [PATCH] adb: add base64 implementation<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -musl needs it<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - adb/adb_auth_client.c |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt; - adb/base64.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 315 ++++++=
++++++++++++++++++++++++++++++++++++<br>
&gt;&gt; &gt; - 2 files changed, 316 insertions(+), 1 deletion(-)<br>
&gt;&gt; &gt; - create mode 100644 adb/base64.c<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/adb/adb_auth_client.c b/adb/adb_auth_client.c<b=
r>
&gt;&gt; &gt; -index 55e9dcad19..104b413b8b 100644<br>
&gt;&gt; &gt; ---- a/adb/adb_auth_client.c<br>
&gt;&gt; &gt; -+++ b/adb/adb_auth_client.c<br>
&gt;&gt; &gt; -@@ -75,7 +75,7 @@ static void read_keys(const char *file, st=
ruct listnode *list)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sep)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*sep =3D &#3=
9;\0&#39;;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D __b64_pton(buf, (u_char=
 *)&amp;key-&gt;key, sizeof(key-&gt;key) + 4);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D b64_pton(buf, (u_char *=
)&amp;key-&gt;key, sizeof(key-&gt;key) + 4);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D sizeof(key-&g=
t;key)) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0D(&quot;%s: =
Invalid base64 data ret=3D%d\n&quot;, file, ret);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(key);<b=
r>
&gt;&gt; &gt; -diff --git a/adb/base64.c b/adb/base64.c<br>
&gt;&gt; &gt; -new file mode 100644<br>
&gt;&gt; &gt; -index 0000000000..95da284d0d<br>
&gt;&gt; &gt; ---- /dev/null<br>
&gt;&gt; &gt; -+++ b/adb/base64.c<br>
&gt;&gt; &gt; -@@ -0,0 +1,315 @@<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Copyright (c) 1996-1999 by Internet Software Consortium.=
<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * Permission to use, copy, modify, and distribute this sof=
tware for any<br>
&gt;&gt; &gt; -+ * purpose with or without fee is hereby granted, provided =
that the above<br>
&gt;&gt; &gt; -+ * copyright notice and this permission notice appear in al=
l copies.<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot; AND INTERNET =
SOFTWARE CONSORTIUM DISCLAIMS<br>
&gt;&gt; &gt; -+ * ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING AL=
L IMPLIED WARRANTIES<br>
&gt;&gt; &gt; -+ * OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL INTERN=
ET SOFTWARE<br>
&gt;&gt; &gt; -+ * CONSORTIUM BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, =
OR CONSEQUENTIAL<br>
&gt;&gt; &gt; -+ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF=
 USE, DATA OR<br>
&gt;&gt; &gt; -+ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR=
 OTHER TORTIOUS<br>
&gt;&gt; &gt; -+ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR =
PERFORMANCE OF THIS<br>
&gt;&gt; &gt; -+ * SOFTWARE.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Portions Copyright (c) 1995 by International Business Ma=
chines, Inc.<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * International Business Machines, Inc. (hereinafter calle=
d IBM) grants<br>
&gt;&gt; &gt; -+ * permission under its copyrights to use, copy, modify, an=
d distribute this<br>
&gt;&gt; &gt; -+ * Software with or without fee, provided that the above co=
pyright notice and<br>
&gt;&gt; &gt; -+ * all paragraphs of this notice appear in all copies, and =
that the name of IBM<br>
&gt;&gt; &gt; -+ * not be used in connection with the marketing of any prod=
uct incorporating<br>
&gt;&gt; &gt; -+ * the Software or modifications thereof, without specific,=
 written prior<br>
&gt;&gt; &gt; -+ * permission.<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * To the extent it has a right to do so, IBM grants an imm=
unity from suit<br>
&gt;&gt; &gt; -+ * under its patents, if any, for the use, sale or manufact=
ure of products to<br>
&gt;&gt; &gt; -+ * the extent that such products are used for performing Do=
main Name System<br>
&gt;&gt; &gt; -+ * dynamic updates in TCP/IP networks by means of the Softw=
are.=C2=A0 No immunity is<br>
&gt;&gt; &gt; -+ * granted for any product per se or for any other function=
 of any product.<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, AND IBM DISC=
LAIMS ALL WARRANTIES,<br>
&gt;&gt; &gt; -+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND =
FITNESS FOR A<br>
&gt;&gt; &gt; -+ * PARTICULAR PURPOSE.=C2=A0 IN NO EVENT SHALL IBM BE LIABL=
E FOR ANY SPECIAL,<br>
&gt;&gt; &gt; -+ * DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGE=
S WHATSOEVER ARISING<br>
&gt;&gt; &gt; -+ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF T=
HIS SOFTWARE, EVEN<br>
&gt;&gt; &gt; -+ * IF IBM IS APPRISED OF THE POSSIBILITY OF SUCH DAMAGES.<b=
r>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+#if !defined(LINT) &amp;&amp; !defined(CODECENTER)<br>
&gt;&gt; &gt; -+static const char rcsid[] =3D &quot;$BINDId: base64.c,v 8.7=
 1999/10/13 16:39:33 vixie Exp $&quot;;<br>
&gt;&gt; &gt; -+#endif /* not lint */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+#include &lt;sys/types.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;sys/param.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;sys/socket.h&gt;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+#include &lt;netinet/in.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;arpa/inet.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;arpa/nameser.h&gt;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+#include &lt;ctype.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;resolv.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;stdio.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;stdlib.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;stdint.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;string.h&gt;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+#define Assert(Cond) if (!(Cond)) abort()<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+static const char Base64[] =3D<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef=
ghijklmnopqrstuvwxyz0123456789+/&quot;;<br>
&gt;&gt; &gt; -+static const char Pad64 =3D &#39;=3D&#39;;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/* (From RFC1521 and draft-ietf-dnssec-secext-03.txt)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0The following encoding technique is taken from=
 RFC 1521 by Borenstein<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0and Freed.=C2=A0 It is reproduced here in a sl=
ightly edited form for<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0convenience.<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0A 65-character subset of US-ASCII is used, ena=
bling 6 bits to be<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0represented per printable character. (The extr=
a 65th character, &quot;=3D&quot;,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0is used to signify a special processing functi=
on.)<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0The encoding process represents 24-bit groups =
of input bits as output<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0strings of 4 encoded characters. Proceeding fr=
om left to right, a<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A024-bit input group is formed by concatenating =
3 8-bit input groups.<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0These 24 bits are then treated as 4 concatenat=
ed 6-bit groups, each<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0of which is translated into a single digit in =
the base64 alphabet.<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0Each 6-bit group is used as an index into an a=
rray of 64 printable<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0characters. The character referenced by the in=
dex is placed in the<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0output string.<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Table 1: The Base64 Alphabet<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 Value Encoding=C2=A0 Value Encoding=C2=
=A0 Value Encoding=C2=A0 Value Encoding<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 A=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 17 R=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 34 i=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 51 z<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 B=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 18 S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 35 j=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 52 0<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 C=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 19 T=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 36 k=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 53 1<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 20 U=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 37 l=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 54 2<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4 E=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 21 V=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 38 m=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 55 3<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5 F=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 22 W=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 39 n=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 56 4<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6 G=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 23 X=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 40 o=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 57 5<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 H=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 24 Y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 41 p=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 58 6<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8 I=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 25 Z=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 42 q=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 59 7<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9 J=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 26 a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 43 r=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 60 8<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010 K=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 27 b=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 44 s=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 61 9<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011 L=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 28 c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 45 t=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 62 +<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012 M=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 29 d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 46 u=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 63 /<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013 N=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 30 e=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 47 v<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014 O=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 31 f=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 48 w=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(pad) =3D<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A015 P=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 32 g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 49 x<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016 Q=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 33 h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 50 y<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0Special processing is performed if fewer than =
24 bits are available<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0at the end of the data being encoded.=C2=A0 A =
full encoding quantum is<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0always completed at the end of a quantity.=C2=
=A0 When fewer than 24 input<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0bits are available in an input group, zero bit=
s are added (on the<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0right) to form an integral number of 6-bit gro=
ups.=C2=A0 Padding at the<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0end of the data is performed using the &#39;=
=3D&#39; character.<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0Since all base64 input is an integral number o=
f octets, only the<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-------------------------=
------------------------<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0following cases can arise:<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0(1) the final quantum of encodin=
g input is an integral<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0multiple of 24 bit=
s; here, the final unit of encoded<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output will be an integra=
l multiple of 4 characters<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with no &quot;=3D&quot; p=
adding,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0(2) the final quantum of encodin=
g input is exactly 8 bits;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0here, the final un=
it of encoded output will be two<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0characters followed by tw=
o &quot;=3D&quot; padding characters, or<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0(3) the final quantum of encodin=
g input is exactly 16 bits;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0here, the final un=
it of encoded output will be three<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0characters followed by on=
e &quot;=3D&quot; padding character.<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0*/<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+int<br>
&gt;&gt; &gt; -+b64_ntop(const uint8_t* src, size_t srclength, char* target=
, size_t targsize)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 size_t datalength =3D 0;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 uint8_t input[3];<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 uint8_t output[4];<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 size_t i;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 while (2 &lt; srclength) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input[0] =
=3D *src++;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input[1] =
=3D *src++;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input[2] =
=3D *src++;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srclength =
-=3D 3;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[0] =
=3D input[0] &gt;&gt; 2;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[1] =
=3D ((input[0] &amp; 0x03) &lt;&lt; 4) + (input[1] &gt;&gt; 4);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[2] =
=3D ((input[1] &amp; 0x0f) &lt;&lt; 2) + (input[2] &gt;&gt; 6);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[3] =
=3D input[2] &amp; 0x3f;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(out=
put[0] &lt; 64);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(out=
put[1] &lt; 64);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(out=
put[2] &lt; 64);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(out=
put[3] &lt; 64);<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (datale=
ngth + 4 &gt; targsize)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return (-1);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[dat=
alength++] =3D Base64[output[0]];<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[dat=
alength++] =3D Base64[output[1]];<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[dat=
alength++] =3D Base64[output[2]];<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[dat=
alength++] =3D Base64[output[3]];<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 /* Now we worry about padding. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (0 !=3D srclength) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get wha=
t&#39;s left. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input[0] =
=3D input[1] =3D input[2] =3D &#39;\0&#39;;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D=
 0; i &lt; srclength; i++)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 input[i] =3D *src++;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[0] =
=3D input[0] &gt;&gt; 2;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[1] =
=3D ((input[0] &amp; 0x03) &lt;&lt; 4) + (input[1] &gt;&gt; 4);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[2] =
=3D ((input[1] &amp; 0x0f) &lt;&lt; 2) + (input[2] &gt;&gt; 6);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(out=
put[0] &lt; 64);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(out=
put[1] &lt; 64);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(out=
put[2] &lt; 64);<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (datale=
ngth + 4 &gt; targsize)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return (-1);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[dat=
alength++] =3D Base64[output[0]];<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[dat=
alength++] =3D Base64[output[1]];<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srclen=
gth =3D=3D 1)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 target[datalength++] =3D Pad64;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 target[datalength++] =3D Base64[output[2]];<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[dat=
alength++] =3D Pad64;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (datalength &gt;=3D targsize)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (-1=
);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 target[datalength] =3D &#39;\0&#39;;=
=C2=A0 =C2=A0 =C2=A0 /* Returned value doesn&#39;t count \0. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return (datalength);<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/* skips all whitespace anywhere.<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0converts characters, four at a time, starting =
at (or after)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0src from base - 64 numbers into three 8 bit by=
tes in the target area.<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0it returns the number of data bytes stored at =
the target, or -1 on error.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+int b64_pton(const char* src, uint8_t* target, size_t targs=
ize)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 int tarindex, state, ch;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 char *pos;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 state =3D 0;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 tarindex =3D 0;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 while ((ch =3D *src++) !=3D &#39;\0&#3=
9;) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (isspac=
e(ch))=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip whitespace anywhere. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ch =3D=
=3D Pad64)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pos =3D st=
rchr(Base64, ch);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pos =
=3D=3D 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* A non-base64 character=
. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return (-1);<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (st=
ate) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br=
>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (target) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((size_t)tarindex &gt;=3D =
targsize)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn (-1);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex] =3D (pos - B=
ase64) &lt;&lt; 2;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 state =3D 1;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:<br=
>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (target) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((size_t)tarindex + 1 &gt;=
=3D targsize)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn (-1);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex]=C2=A0 =C2=A0=
|=3D=C2=A0 (pos - Base64) &gt;&gt; 4;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex+1]=C2=A0 =3D =
((pos - Base64) &amp; 0x0f)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; 4 ;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tarindex++;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 state =3D 2;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br=
>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (target) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((size_t)tarindex + 1 &gt;=
=3D targsize)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn (-1);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex]=C2=A0 =C2=A0=
|=3D=C2=A0 (pos - Base64) &gt;&gt; 2;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex+1]=C2=A0 =3D =
((pos - Base64) &amp; 0x03)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; 6;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tarindex++;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 state =3D 3;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3:<br=
>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (target) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((size_t)tarindex &gt;=3D =
targsize)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn (-1);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex] |=3D (pos - =
Base64);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tarindex++;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 state =3D 0;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 abort();<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0* We are done decoding Base-64 c=
hars.=C2=A0 Let&#39;s see if we ended<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0* on a byte boundary, and/or wit=
h erroneous trailing characters.<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (ch =3D=3D Pad64) {=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We got a pad char. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ch =3D *sr=
c++;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip it, get next. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (st=
ate) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Invalid =3D in first position */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Invalid =3D in second position */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return (-1);<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Valid, means one byte of info */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* Skip any number of spaces. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 for ((void)NULL; ch !=3D &#39;\0&#39;; ch =3D *src++)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!isspace(ch))<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
reak;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* Make sure there is another trailing =3D sign. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (ch !=3D Pad64)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (-1);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ch =3D *src++;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /=
* Skip the =3D */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* Fall through to &quot;single trailing =3D&quot; case. =
*/<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* FALLTHROUGH */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Valid, means two bytes of info */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0* We know this char is an =3D.=C2=A0 Is there anyth=
ing but<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0* whitespace after it?<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 for ((void)NULL; ch !=3D &#39;\0&#39;; ch =3D *src++)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!isspace(ch))<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn (-1);<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0* Now make sure for cases 2 and 3 that the &quot;ex=
tra&quot;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0* bits that slopped past the last full byte were<br=
>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0* zeros.=C2=A0 If we don&#39;t check them, they bec=
ome a<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0* subliminal channel.<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (target &amp;&amp; target[tarindex] !=3D 0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (-1);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We=
 ended by seeing the end of the string.=C2=A0 Make sure we<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ha=
ve no partial bytes lying around.<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (state =
!=3D 0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return (-1);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return (tarindex);<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0006-adb-Musl-fixes.patch b/meta-oe/recipes-devtools/android-tool=
s/android-tools/core/0006-adb-Musl-fixes.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index b5d383f38..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0006-adb-Musl-fixes.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,131 +0,0 @@<br>
&gt;&gt; &gt; -From 62d957a1271c88ec08d67984fbe31601f0bd41a9 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Fri, 15 Sep 2017 15:50:57 -0700<br>
&gt;&gt; &gt; -Subject: [PATCH] adb: Musl fixes<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -__nonnull is gcc specific<br>
&gt;&gt; &gt; -include sys/types.h for size_t<br>
&gt;&gt; &gt; -Do not redefine close() and lseek()<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - adb/adb.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;&gt; &gt; - adb/disable_verity_service.c | 13 ++++++++-----<br>
&gt;&gt; &gt; - adb/framebuffer_service.c=C2=A0 =C2=A0 |=C2=A0 7 ++++---<br=
>
&gt;&gt; &gt; - adb/sysdeps.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 12 ++++++------<br>
&gt;&gt; &gt; - 4 files changed, 20 insertions(+), 14 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/adb/adb.h b/adb/adb.h<br>
&gt;&gt; &gt; -index 44e5981bdc..bcdc49f63c 100644<br>
&gt;&gt; &gt; ---- a/adb/adb.h<br>
&gt;&gt; &gt; -+++ b/adb/adb.h<br>
&gt;&gt; &gt; -@@ -18,7 +18,9 @@<br>
&gt;&gt; &gt; - #define __ADB_H<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &lt;limits.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;sys/types.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#include &quot;fdevent.h&quot;<br>
&gt;&gt; &gt; - #include &quot;adb_trace.h&quot;<br>
&gt;&gt; &gt; - #include &quot;transport.h&quot;=C2=A0 /* readx(), writex()=
 */<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/adb/disable_verity_service.c b/adb/disable_veri=
ty_service.c<br>
&gt;&gt; &gt; -index ed3da52108..29fa3d65a9 100644<br>
&gt;&gt; &gt; ---- a/adb/disable_verity_service.c<br>
&gt;&gt; &gt; -+++ b/adb/disable_verity_service.c<br>
&gt;&gt; &gt; -@@ -14,25 +14,28 @@<br>
&gt;&gt; &gt; -=C2=A0 * limitations under the License.<br>
&gt;&gt; &gt; -=C2=A0 */<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --#include &quot;sysdeps.h&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #define=C2=A0 TRACE_TAG=C2=A0 TRACE_ADB<br>
&gt;&gt; &gt; - #include &quot;adb.h&quot;<br>
&gt;&gt; &gt; -+#include &quot;sysdeps.h&quot;<br>
&gt;&gt; &gt; -+#include &quot;cutils/properties.h&quot;<br>
&gt;&gt; &gt; -+#include &quot;ext4_sb.h&quot;<br>
&gt;&gt; &gt; -+#include &lt;fs_mgr.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &lt;stdio.h&gt;<br>
&gt;&gt; &gt; - #include &lt;stdarg.h&gt;<br>
&gt;&gt; &gt; - #include &lt;sys/stat.h&gt;<br>
&gt;&gt; &gt; - #include &lt;fcntl.h&gt;<br>
&gt;&gt; &gt; - #include &lt;inttypes.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;unistd.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;errno.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;stdbool.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --#include &quot;cutils/properties.h&quot;<br>
&gt;&gt; &gt; --#include &quot;ext4_sb.h&quot;<br>
&gt;&gt; &gt; --#include &lt;fs_mgr.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #define FSTAB_PREFIX &quot;/fstab.&quot;<br>
&gt;&gt; &gt; - struct fstab *fstab;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --__attribute__((__format__(printf, 2, 3))) __nonnull((2))<br=
>
&gt;&gt; &gt; -+__attribute__((__format__(printf, 2, 3))) __attribute__((no=
nnull((2))))<br>
&gt;&gt; &gt; - static void write_console(int fd, const char* format, ...)<=
br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0char buffer[256];<br>
&gt;&gt; &gt; -diff --git a/adb/framebuffer_service.c b/adb/framebuffer_ser=
vice.c<br>
&gt;&gt; &gt; -index 8cbe8403cc..8f0ccfb7aa 100644<br>
&gt;&gt; &gt; ---- a/adb/framebuffer_service.c<br>
&gt;&gt; &gt; -+++ b/adb/framebuffer_service.c<br>
&gt;&gt; &gt; -@@ -14,6 +14,10 @@<br>
&gt;&gt; &gt; -=C2=A0 * limitations under the License.<br>
&gt;&gt; &gt; -=C2=A0 */<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#include &quot;fdevent.h&quot;<br>
&gt;&gt; &gt; -+#include &quot;adb.h&quot;<br>
&gt;&gt; &gt; -+#include &quot;sysdeps.h&quot;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; - #include &lt;stdlib.h&gt;<br>
&gt;&gt; &gt; - #include &lt;stdio.h&gt;<br>
&gt;&gt; &gt; - #include &lt;unistd.h&gt;<br>
&gt;&gt; &gt; -@@ -23,9 +27,6 @@<br>
&gt;&gt; &gt; - #include &lt;sys/types.h&gt;<br>
&gt;&gt; &gt; - #include &lt;sys/wait.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --#include &quot;fdevent.h&quot;<br>
&gt;&gt; &gt; --#include &quot;adb.h&quot;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; - #include &lt;linux/fb.h&gt;<br>
&gt;&gt; &gt; - #include &lt;sys/ioctl.h&gt;<br>
&gt;&gt; &gt; - #include &lt;sys/mman.h&gt;<br>
&gt;&gt; &gt; -diff --git a/adb/sysdeps.h b/adb/sysdeps.h<br>
&gt;&gt; &gt; -index cc1f839e9f..ea39ac39cc 100644<br>
&gt;&gt; &gt; ---- a/adb/sysdeps.h<br>
&gt;&gt; &gt; -+++ b/adb/sysdeps.h<br>
&gt;&gt; &gt; -@@ -123,8 +123,8 @@ static __inline__ int=C2=A0 unix_close(i=
nt fd)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return close(fd);<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; --#undef=C2=A0 =C2=A0close<br>
&gt;&gt; &gt; --#define=C2=A0 close=C2=A0 =C2=A0____xxx_close<br>
&gt;&gt; &gt; -+//#undef=C2=A0 =C2=A0close<br>
&gt;&gt; &gt; -+//#define=C2=A0 close=C2=A0 =C2=A0____xxx_close<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - static __inline__=C2=A0 int=C2=A0 unix_read(int=C2=A0 fd, v=
oid*=C2=A0 buf, size_t=C2=A0 len)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -@@ -369,8 +369,8 @@ static __inline__ int=C2=A0 adb_close(in=
t fd)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return close(fd);<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; --#undef=C2=A0 =C2=A0close<br>
&gt;&gt; &gt; --#define=C2=A0 close=C2=A0 =C2=A0____xxx_close<br>
&gt;&gt; &gt; -+//#undef=C2=A0 =C2=A0close<br>
&gt;&gt; &gt; -+//#define=C2=A0 close=C2=A0 =C2=A0____xxx_close<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - static __inline__=C2=A0 int=C2=A0 adb_read(int=C2=A0 fd, vo=
id*=C2=A0 buf, size_t=C2=A0 len)<br>
&gt;&gt; &gt; -@@ -392,8 +392,8 @@ static __inline__ int=C2=A0 =C2=A0adb_ls=
eek(int=C2=A0 fd, int=C2=A0 pos, int=C2=A0 where)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return lseek(fd, pos, where);<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; --#undef=C2=A0 =C2=A0lseek<br>
&gt;&gt; &gt; --#define=C2=A0 lseek=C2=A0 =C2=A0___xxx_lseek<br>
&gt;&gt; &gt; -+//#undef=C2=A0 =C2=A0lseek<br>
&gt;&gt; &gt; -+//#define=C2=A0 lseek=C2=A0 =C2=A0___xxx_lseek<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - static __inline__=C2=A0 int=C2=A0 =C2=A0 adb_unlink(const c=
har*=C2=A0 path)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch b/meta-oe/re=
cipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-bu=
ild-with-glibc-2.28.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index e02a95687..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,24 +0,0 @@<br>
&gt;&gt; &gt; -From de393bba41c8feff932c77d6c30233945f380d42 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Sat, 11 Aug 2018 13:23:37 +0000<br>
&gt;&gt; &gt; -Subject: [PATCH] adb: usb_linux.c: fix build with glibc-2.28=
<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -* include sysmacros for major, minor<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jan=
sa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - adb/usb_linux.c | 1 +<br>
&gt;&gt; &gt; - 1 file changed, 1 insertion(+)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/adb/usb_linux.c b/adb/usb_linux.c<br>
&gt;&gt; &gt; -index f16bdd0361..c8a7732441 100644<br>
&gt;&gt; &gt; ---- a/adb/usb_linux.c<br>
&gt;&gt; &gt; -+++ b/adb/usb_linux.c<br>
&gt;&gt; &gt; -@@ -22,6 +22,7 @@<br>
&gt;&gt; &gt; - #include &lt;sys/ioctl.h&gt;<br>
&gt;&gt; &gt; - #include &lt;sys/types.h&gt;<br>
&gt;&gt; &gt; - #include &lt;sys/time.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;sys/sysmacros.h&gt;<br>
&gt;&gt; &gt; - #include &lt;dirent.h&gt;<br>
&gt;&gt; &gt; - #include &lt;fcntl.h&gt;<br>
&gt;&gt; &gt; - #include &lt;errno.h&gt;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch b/meta-oe/recipes-dev=
tools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-roo=
t.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 7d223e05f..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0008-adb-Allow-adbd-to-be-ran-as-root.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,21 +0,0 @@<br>
&gt;&gt; &gt; -From 3a788e9168c9b9eac66c4fa479413f4a95c61be4 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Florent Revest &lt;<a href=3D"mailto:revestflo@gmail.c=
om" target=3D"_blank">revestflo@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Mon, 30 Oct 2017 21:05:46 +0100<br>
&gt;&gt; &gt; -Subject: [PATCH] adb: Allow adbd to be ran as root<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - adb/adb.c | 1 +<br>
&gt;&gt; &gt; - 1 file changed, 1 insertion(+)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/adb/adb.c b/adb/adb.c<br>
&gt;&gt; &gt; -index 027edd9359..e0f7ecde45 100644<br>
&gt;&gt; &gt; ---- a/adb/adb.c<br>
&gt;&gt; &gt; -+++ b/adb/adb.c<br>
&gt;&gt; &gt; -@@ -1271,6 +1271,7 @@ static int should_drop_privileges() {<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0int secure =3D 0;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0char value[PROPERTY_VALUE_MAX];<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 /* run adbd in secure mode if ro.secure is set=
 and<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0** we are not in the emulator<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch b/meta-=
oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-=
parameter-to-specify-DT-image.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index a4dc6e1e3..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,110 +0,0 @@<br>
&gt;&gt; &gt; -From dd195778a9930b7967b21a3b8eb390b70253dbad Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: David Ng &lt;<a href=3D"mailto:dave@codeaurora.org" ta=
rget=3D"_blank">dave@codeaurora.org</a>&gt;<br>
&gt;&gt; &gt; -Date: Fri, 27 Jul 2012 17:15:03 -0700<br>
&gt;&gt; &gt; -Subject: [PATCH] mkbootimg: Add --dt parameter to specify DT=
 image<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -New optional --dt parameter to specify a kernel device<br>
&gt;&gt; &gt; -tree image.<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Inappropriate<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - mkbootimg/bootimg.h=C2=A0 =C2=A0|=C2=A0 7 +++++--<br>
&gt;&gt; &gt; - mkbootimg/mkbootimg.c | 21 +++++++++++++++++++++<br>
&gt;&gt; &gt; - 2 files changed, 26 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/mkbootimg/bootimg.h b/mkbootimg/bootimg.h<br>
&gt;&gt; &gt; -index 9171d85a7b..308c537d6b 100644<br>
&gt;&gt; &gt; ---- a/mkbootimg/bootimg.h<br>
&gt;&gt; &gt; -+++ b/mkbootimg/bootimg.h<br>
&gt;&gt; &gt; -@@ -41,8 +41,8 @@ struct boot_img_hdr<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0unsigned tags_addr;=C2=A0 =C2=A0 /* phys=
ical addr for kernel tags */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0unsigned page_size;=C2=A0 =C2=A0 /* flas=
h page size we assume */<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 unsigned unused[2];=C2=A0 =C2=A0 /* future ex=
pansion: should be 0 */<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 unsigned dt_size;=C2=A0 =C2=A0 =C2=A0 /* devi=
ce tree in bytes */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 unsigned unused;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 future expansion: should be 0 */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0unsigned char name[BOOT_NAME_SIZE]; /* a=
sciiz product name */<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0unsigned char cmdline[BOOT_ARGS_SIZE];<b=
r>
&gt;&gt; &gt; -@@ -64,10 +64,13 @@ struct boot_img_hdr<br>
&gt;&gt; &gt; - ** +-----------------+<br>
&gt;&gt; &gt; - ** | second stage=C2=A0 =C2=A0 | o pages<br>
&gt;&gt; &gt; - ** +-----------------+<br>
&gt;&gt; &gt; -+** | device tree=C2=A0 =C2=A0 =C2=A0| p pages<br>
&gt;&gt; &gt; -+** +-----------------+<br>
&gt;&gt; &gt; - **<br>
&gt;&gt; &gt; - ** n =3D (kernel_size + page_size - 1) / page_size<br>
&gt;&gt; &gt; - ** m =3D (ramdisk_size + page_size - 1) / page_size<br>
&gt;&gt; &gt; - ** o =3D (second_size + page_size - 1) / page_size<br>
&gt;&gt; &gt; -+** p =3D (dt_size + page_size - 1) / page_size<br>
&gt;&gt; &gt; - **<br>
&gt;&gt; &gt; - ** 0. all entities are page_size aligned in flash<br>
&gt;&gt; &gt; - ** 1. kernel and ramdisk are required (size !=3D 0)<br>
&gt;&gt; &gt; -diff --git a/mkbootimg/mkbootimg.c b/mkbootimg/mkbootimg.c<b=
r>
&gt;&gt; &gt; -index fc92b4dc30..658052cdf2 100644<br>
&gt;&gt; &gt; ---- a/mkbootimg/mkbootimg.c<br>
&gt;&gt; &gt; -+++ b/mkbootimg/mkbootimg.c<br>
&gt;&gt; &gt; -@@ -65,6 +65,7 @@ int usage(void)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0[ --board &lt;boardname&gt; ]\n&quot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0[ --base &lt;address&gt; ]\n&quot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0[ --pagesize &lt;pagesize&gt; ]\n&quot;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0[ --dt &lt;filename&gt; ]\n&quot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0-o|--output &lt;filename&gt;\n&quot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt;&gt; &gt; -@@ -105,6 +106,8 @@ int main(int argc, char **argv)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0char *cmdline =3D &quot;&quot;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0char *bootimg =3D 0;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0char *board =3D &quot;&quot;;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 char *dt_fn =3D 0;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 void *dt_data =3D 0;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0unsigned pagesize =3D 2048;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0int fd;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0SHA_CTX ctx;<br>
&gt;&gt; &gt; -@@ -158,6 +161,8 @@ int main(int argc, char **argv)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fprintf(stderr,&quot;error: unsupported page size %d\n&quot;, pagesize);=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return -1;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if(!strcmp(arg, &quot;--=
dt&quot;)) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dt_fn =3D val;<br=
>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return usage=
();<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -@@ -232,6 +237,14 @@ int main(int argc, char **argv)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 if(dt_fn) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dt_data =3D load_file(dt_fn, &a=
mp;hdr.dt_size);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dt_data =3D=3D 0) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,&q=
uot;error: could not load device tree image &#39;%s&#39;\n&quot;, dt_fn);<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* put a hash of the contents in the hea=
der so boot images can be<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 * differentiated based on their first 2=
k.<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; &gt; -@@ -242,6 +255,10 @@ int main(int argc, char **argv)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0SHA_update(&amp;ctx, &amp;hdr.ramdisk_si=
ze, sizeof(hdr.ramdisk_size));<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0SHA_update(&amp;ctx, second_data, hdr.se=
cond_size);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0SHA_update(&amp;ctx, &amp;hdr.second_siz=
e, sizeof(hdr.second_size));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 if(dt_data) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SHA_update(&amp;ctx, dt_data, h=
dr.dt_size);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SHA_update(&amp;ctx, &amp;hdr.d=
t_size, sizeof(hdr.dt_size));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0sha =3D SHA_final(&amp;ctx);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0memcpy(<a href=3D"http://hdr.id" rel=3D"=
noreferrer" target=3D"_blank">hdr.id</a>, sha,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHA_DIGEST_SIZE &g=
t; sizeof(<a href=3D"http://hdr.id" rel=3D"noreferrer" target=3D"_blank">hd=
r.id</a>) ? sizeof(<a href=3D"http://hdr.id" rel=3D"noreferrer" target=3D"_=
blank">hdr.id</a>) : SHA_DIGEST_SIZE);<br>
&gt;&gt; &gt; -@@ -266,6 +283,10 @@ int main(int argc, char **argv)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(write_padding(fd, pages=
ize, hdr.second_size)) goto fail;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 if(dt_data) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(write(fd, dt_data, hdr.dt_si=
ze) !=3D (ssize_t) hdr.dt_size) goto fail;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(write_padding(fd, pagesize, =
hdr.dt_size)) goto fail;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - fail:<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch b/meta-oe/=
recipes-devtools/android-tools/android-tools/core/0010-Use-linux-capability=
.h-on-linux-systems-too.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 2c607ff67..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0010-Use-linux-capability.h-on-linux-systems-too.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,23 +0,0 @@<br>
&gt;&gt; &gt; -From ef743c9c3c7452ae904a5c343ee2b759ab3a87cb Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: =3D?UTF-8?q?Lo=3DC3=3DAFc=3D20Minier?=3D &lt;<a href=
=3D"mailto:loic.minier@ubuntu.com" target=3D"_blank">loic.minier@ubuntu.com=
</a>&gt;<br>
&gt;&gt; &gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH] Use linux/capability.h on linux systems too=
<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Inappropriate<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - include/private/android_filesystem_config.h | 2 +-<br>
&gt;&gt; &gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/include/private/android_filesystem_config.h b/i=
nclude/private/android_filesystem_config.h<br>
&gt;&gt; &gt; -index 2f528b95c8..3e0b00928e 100644<br>
&gt;&gt; &gt; ---- a/include/private/android_filesystem_config.h<br>
&gt;&gt; &gt; -+++ b/include/private/android_filesystem_config.h<br>
&gt;&gt; &gt; -@@ -27,7 +27,7 @@<br>
&gt;&gt; &gt; - #include &lt;sys/types.h&gt;<br>
&gt;&gt; &gt; - #include &lt;stdint.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --#ifdef HAVE_ANDROID_OS<br>
&gt;&gt; &gt; -+#if defined(HAVE_ANDROID_OS) || defined(__linux__)<br>
&gt;&gt; &gt; - #include &lt;linux/capability.h&gt;<br>
&gt;&gt; &gt; - #else<br>
&gt;&gt; &gt; - #include &quot;android_filesystem_capability.h&quot;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0011-Remove-bionic-specific-calls.patch b/meta-oe/recipes-devtool=
s/android-tools/android-tools/core/0011-Remove-bionic-specific-calls.patch<=
br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 5b18f461a..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0011-Remove-bionic-specific-calls.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,64 +0,0 @@<br>
&gt;&gt; &gt; -From 9eff8799831961c0edf6e37e5d4cbf43baa7c748 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Fathi Boudra &lt;<a href=3D"mailto:fabo@debian.org" ta=
rget=3D"_blank">fabo@debian.org</a>&gt;<br>
&gt;&gt; &gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH] Remove bionic specific calls<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Inappropriate<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - include/cutils/properties.h | 1 -<br>
&gt;&gt; &gt; - libcutils/properties.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt; &gt; - liblog/logd_write.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 ++=
+++<br>
&gt;&gt; &gt; - 3 files changed, 6 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/include/cutils/properties.h b/include/cutils/pr=
operties.h<br>
&gt;&gt; &gt; -index 798db8b36f..7d01f28d6e 100644<br>
&gt;&gt; &gt; ---- a/include/cutils/properties.h<br>
&gt;&gt; &gt; -+++ b/include/cutils/properties.h<br>
&gt;&gt; &gt; -@@ -19,7 +19,6 @@<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &lt;sys/cdefs.h&gt;<br>
&gt;&gt; &gt; - #include &lt;stddef.h&gt;<br>
&gt;&gt; &gt; --#include &lt;sys/system_properties.h&gt;<br>
&gt;&gt; &gt; - #include &lt;stdint.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #ifdef __cplusplus<br>
&gt;&gt; &gt; -diff --git a/libcutils/properties.c b/libcutils/properties.c=
<br>
&gt;&gt; &gt; -index b283658aa4..4151e7882c 100644<br>
&gt;&gt; &gt; ---- a/libcutils/properties.c<br>
&gt;&gt; &gt; -+++ b/libcutils/properties.c<br>
&gt;&gt; &gt; -@@ -104,10 +104,10 @@ int32_t property_get_int32(const char =
*key, int32_t default_value) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0return (int32_t)property_get_imax(key, I=
NT32_MIN, INT32_MAX, default_value);<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#undef HAVE_LIBC_SYSTEM_PROPERTIES<br>
&gt;&gt; &gt; - #ifdef HAVE_LIBC_SYSTEM_PROPERTIES<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_<br>
&gt;&gt; &gt; --#include &lt;sys/_system_properties.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - int property_set(const char *key, const char *value)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -diff --git a/liblog/logd_write.c b/liblog/logd_write.c<br>
&gt;&gt; &gt; -index b2668cedb7..f5a44fe901 100644<br>
&gt;&gt; &gt; ---- a/liblog/logd_write.c<br>
&gt;&gt; &gt; -+++ b/liblog/logd_write.c<br>
&gt;&gt; &gt; -@@ -23,6 +23,7 @@<br>
&gt;&gt; &gt; - #include &lt;stdlib.h&gt;<br>
&gt;&gt; &gt; - #include &lt;string.h&gt;<br>
&gt;&gt; &gt; - #include &lt;sys/stat.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;sys/syscall.h&gt;<br>
&gt;&gt; &gt; - #include &lt;sys/types.h&gt;<br>
&gt;&gt; &gt; - #if (FAKE_LOG_DEVICE =3D=3D 0)<br>
&gt;&gt; &gt; - #include &lt;sys/socket.h&gt;<br>
&gt;&gt; &gt; -@@ -205,7 +206,11 @@ static int __write_to_log_kernel(log_id=
_t log_id, struct iovec *vec, size_t nr)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0realtime_ts.tv_nsec =3D ts.tv_nsec;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0log_id_buf =3D log_id;<br>
&gt;&gt; &gt; -+#ifdef __BIONIC__<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0tid =3D gettid();<br>
&gt;&gt; &gt; -+#else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 tid =3D (pid_t) syscall(__NR_gettid);<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0newVec[0].iov_base=C2=A0 =C2=A0=3D (unsi=
gned char *) &amp;log_id_buf;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0newVec[0].iov_len=C2=A0 =C2=A0 =3D sizeo=
f_log_id_t;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch b=
/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implici=
t-declaration-of-stlcat-strlcopy-function.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index b0feb6592..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,50 +0,0 @@<br>
&gt;&gt; &gt; -From cd4525d760c6f88c9bf85f7bf488da79cd0d3264 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Fathi Boudra &lt;<a href=3D"mailto:fabo@debian.org" ta=
rget=3D"_blank">fabo@debian.org</a>&gt;<br>
&gt;&gt; &gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH] Fix implicit declaration of stlcat/strlcopy=
 functions<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Inappropriate<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - adb/adb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 +<br>
&gt;&gt; &gt; - fs_mgr/fs_mgr_fstab.c=C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt; &gt; - include/cutils/sockets.h | 2 +-<br>
&gt;&gt; &gt; - 3 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/adb/adb.c b/adb/adb.c<br>
&gt;&gt; &gt; -index e0f7ecde45..aaefd9b401 100644<br>
&gt;&gt; &gt; ---- a/adb/adb.c<br>
&gt;&gt; &gt; -+++ b/adb/adb.c<br>
&gt;&gt; &gt; -@@ -41,6 +41,7 @@<br>
&gt;&gt; &gt; - #include &lt;sys/prctl.h&gt;<br>
&gt;&gt; &gt; - #include &lt;getopt.h&gt;<br>
&gt;&gt; &gt; - #include &lt;selinux/selinux.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;grp.h&gt;<br>
&gt;&gt; &gt; - #else<br>
&gt;&gt; &gt; - #include &quot;usb_vendors.h&quot;<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -diff --git a/fs_mgr/fs_mgr_fstab.c b/fs_mgr/fs_mgr_fstab.c<b=
r>
&gt;&gt; &gt; -index edd9591164..9ddb4643b5 100644<br>
&gt;&gt; &gt; ---- a/fs_mgr/fs_mgr_fstab.c<br>
&gt;&gt; &gt; -+++ b/fs_mgr/fs_mgr_fstab.c<br>
&gt;&gt; &gt; -@@ -17,7 +17,7 @@<br>
&gt;&gt; &gt; - #include &lt;ctype.h&gt;<br>
&gt;&gt; &gt; - #include &lt;stdio.h&gt;<br>
&gt;&gt; &gt; - #include &lt;stdlib.h&gt;<br>
&gt;&gt; &gt; --#include &lt;string.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;bsd/string.h&gt;<br>
&gt;&gt; &gt; - #include &lt;sys/mount.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &quot;fs_mgr_priv.h&quot;<br>
&gt;&gt; &gt; -diff --git a/include/cutils/sockets.h b/include/cutils/socke=
ts.h<br>
&gt;&gt; &gt; -index daf43ec944..d3270c69e7 100644<br>
&gt;&gt; &gt; ---- a/include/cutils/sockets.h<br>
&gt;&gt; &gt; -+++ b/include/cutils/sockets.h<br>
&gt;&gt; &gt; -@@ -19,7 +19,7 @@<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &lt;errno.h&gt;<br>
&gt;&gt; &gt; - #include &lt;stdlib.h&gt;<br>
&gt;&gt; &gt; --#include &lt;string.h&gt;<br>
&gt;&gt; &gt; -+#include &lt;bsd/string.h&gt;<br>
&gt;&gt; &gt; - #include &lt;stdbool.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #ifdef HAVE_WINSOCK<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/0013-adb-Support-riscv64.patch b/meta-oe/recipes-devtools/android=
-tools/android-tools/core/0013-adb-Support-riscv64.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index a8434afba..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0013-adb-Support-riscv64.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,189 +0,0 @@<br>
&gt;&gt; &gt; -From 48ddf4fb999931942c359350fb31cd557514e1c6 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Chenxi Mao &lt;<a href=3D"mailto:maochenxi@eswin.com" =
target=3D"_blank">maochenxi@eswin.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Mon, 20 Apr 2020 15:27:22 +0800<br>
&gt;&gt; &gt; -Subject: [PATCH 1/1] adb: Support riscv64<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - include/cutils/atomic-inline.h=C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;&gt; &gt; - include/cutils/atomic-riscv64.h | 156 +++++++++++++++++++++=
+++++++++++<br>
&gt;&gt; &gt; - 2 files changed, 158 insertions(+)<br>
&gt;&gt; &gt; - create mode 100644 include/cutils/atomic-riscv64.h<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/include/cutils/atomic-inline.h b/include/cutils=
/atomic-inline.h<br>
&gt;&gt; &gt; -index a31e913579..b5dc38209c 100644<br>
&gt;&gt; &gt; ---- a/include/cutils/atomic-inline.h<br>
&gt;&gt; &gt; -+++ b/include/cutils/atomic-inline.h<br>
&gt;&gt; &gt; -@@ -55,6 +55,8 @@ extern &quot;C&quot; {<br>
&gt;&gt; &gt; - #include &lt;cutils/atomic-mips64.h&gt;<br>
&gt;&gt; &gt; - #elif defined(__mips__)<br>
&gt;&gt; &gt; - #include &lt;cutils/atomic-mips.h&gt;<br>
&gt;&gt; &gt; -+#elif defined(__riscv) &amp;&amp; __riscv_xlen =3D=3D 64<br=
>
&gt;&gt; &gt; -+#include &lt;cutils/atomic-riscv64.h&gt;<br>
&gt;&gt; &gt; - #else<br>
&gt;&gt; &gt; - #error atomic operations are unsupported<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -diff --git a/include/cutils/atomic-riscv64.h b/include/cutil=
s/atomic-riscv64.h<br>
&gt;&gt; &gt; -new file mode 100644<br>
&gt;&gt; &gt; -index 0000000000..2664db5a86<br>
&gt;&gt; &gt; ---- /dev/null<br>
&gt;&gt; &gt; -+++ b/include/cutils/atomic-riscv64.h<br>
&gt;&gt; &gt; -@@ -0,0 +1,156 @@<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+ * Copyright (C) 2014 The Android Open Source Project<br>
&gt;&gt; &gt; -+ * All rights reserved.<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * Redistribution and use in source and binary forms, with =
or without<br>
&gt;&gt; &gt; -+ * modification, are permitted provided that the following =
conditions<br>
&gt;&gt; &gt; -+ * are met:<br>
&gt;&gt; &gt; -+ *=C2=A0 * Redistributions of source code must retain the a=
bove copyright<br>
&gt;&gt; &gt; -+ *=C2=A0 =C2=A0 notice, this list of conditions and the fol=
lowing disclaimer.<br>
&gt;&gt; &gt; -+ *=C2=A0 * Redistributions in binary form must reproduce th=
e above copyright<br>
&gt;&gt; &gt; -+ *=C2=A0 =C2=A0 notice, this list of conditions and the fol=
lowing disclaimer in<br>
&gt;&gt; &gt; -+ *=C2=A0 =C2=A0 the documentation and/or other materials pr=
ovided with the<br>
&gt;&gt; &gt; -+ *=C2=A0 =C2=A0 distribution.<br>
&gt;&gt; &gt; -+ *<br>
&gt;&gt; &gt; -+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND C=
ONTRIBUTORS<br>
&gt;&gt; &gt; -+ * &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES,=
 INCLUDING, BUT NOT<br>
&gt;&gt; &gt; -+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AN=
D FITNESS<br>
&gt;&gt; &gt; -+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHA=
LL THE<br>
&gt;&gt; &gt; -+ * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT=
, INDIRECT,<br>
&gt;&gt; &gt; -+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES=
 (INCLUDING,<br>
&gt;&gt; &gt; -+ * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR S=
ERVICES; LOSS<br>
&gt;&gt; &gt; -+ * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWE=
VER CAUSED<br>
&gt;&gt; &gt; -+ * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STR=
ICT LIABILITY,<br>
&gt;&gt; &gt; -+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN A=
NY WAY OUT<br>
&gt;&gt; &gt; -+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSS=
IBILITY OF<br>
&gt;&gt; &gt; -+ * SUCH DAMAGE.<br>
&gt;&gt; &gt; -+ */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+#ifndef ANDROID_CUTILS_ATOMIC_RISCV64_H<br>
&gt;&gt; &gt; -+#define ANDROID_CUTILS_ATOMIC_RISCV64_H<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+#include &lt;stdint.h&gt;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+#ifndef ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+#define ANDROID_ATOMIC_INLINE inline __attribute__((always_=
inline))<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+/*<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0TODOAArch64: Revisit the below functions and c=
heck for potential<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0optimizations using assembly code or otherwise=
.<br>
&gt;&gt; &gt; -+*/<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+void android_compiler_barrier(void)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 __asm__ __volatile__ (&quot;&quot; : : : &quo=
t;memory&quot;);<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+void android_memory_barrier(void)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 __asm__ __volatile__ (&quot;fence rw,rw&quot;=
 : : : &quot;memory&quot;);<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+int32_t android_atomic_acquire_load(volatile const int32_t =
*ptr)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 int32_t value =3D *ptr;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return value;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+int32_t android_atomic_release_load(volatile const int32_t =
*ptr)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return *ptr;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+void android_atomic_acquire_store(int32_t value, volatile i=
nt32_t *ptr)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 *ptr =3D value;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+void android_atomic_release_store(int32_t value, volatile i=
nt32_t *ptr)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 *ptr =3D value;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+int android_atomic_cas(int32_t old_value, int32_t new_value=
,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0volatile int32_t *ptr)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return __sync_val_compare_and_swap(ptr, old_v=
alue, new_value) !=3D old_value;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+int android_atomic_acquire_cas(int32_t old_value, int32_t n=
ew_value,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0volatile int32_t *ptr)<=
br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 int status =3D android_atomic_cas(old_value, =
new_value, ptr);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return status;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+int android_atomic_release_cas(int32_t old_value, int32_t n=
ew_value,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0volatile int32_t *ptr)<=
br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return android_atomic_cas(old_value, new_valu=
e, ptr);<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+int32_t android_atomic_add(int32_t increment, volatile int3=
2_t *ptr)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 int32_t prev, status;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 do {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D *ptr;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D android_atomic_cas(p=
rev, prev + increment, ptr);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 } while (__builtin_expect(status !=3D 0, 0));=
<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return prev;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+int32_t android_atomic_inc(volatile int32_t *addr)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return android_atomic_add(1, addr);<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+int32_t android_atomic_dec(volatile int32_t *addr)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return android_atomic_add(-1, addr);<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+int32_t android_atomic_and(int32_t value, volatile int32_t =
*ptr)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 int32_t prev, status;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 do {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D *ptr;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D android_atomic_cas(p=
rev, prev &amp; value, ptr);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 } while (__builtin_expect(status !=3D 0, 0));=
<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return prev;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt;&gt; &gt; -+int32_t android_atomic_or(int32_t value, volatile int32_t *=
ptr)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 int32_t prev, status;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 do {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D *ptr;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D android_atomic_cas(p=
rev, prev | value, ptr);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 } while (__builtin_expect(status !=3D 0, 0));=
<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return prev;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -+#endif /* ANDROID_CUTILS_ATOMIC_RISCV_H */<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; -2.17.1<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/core/adb_libssl_11.diff b/meta-oe/recipes-devtools/android-tools/andro=
id-tools/core/adb_libssl_11.diff<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 3ead649b1..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/co=
re/adb_libssl_11.diff<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,39 +0,0 @@<br>
&gt;&gt; &gt; -Description: adb: Make compatible with openssl 1.1<br>
&gt;&gt; &gt; - OpenSSL version 1.1 brought some API changes which broke th=
e build here,<br>
&gt;&gt; &gt; - fix that by accessing rsa-&gt;n (and e) directly, using RSA=
_get0_key instead.<br>
&gt;&gt; &gt; -Author: Chirayu Desai &lt;<a href=3D"mailto:chirayudesai1@gm=
ail.com" target=3D"_blank">chirayudesai1@gmail.com</a><br>
&gt;&gt; &gt; -Last-Update: 2016-11-10<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; -This patch header follows DEP-3: <a href=3D"http://dep.debia=
n.net/deps/dep3/" rel=3D"noreferrer" target=3D"_blank">http://dep.debian.ne=
t/deps/dep3/</a><br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - system/core/adb/adb_auth_host.c |=C2=A0 =C2=A0 5 +++--<br>
&gt;&gt; &gt; - 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ---- a/adb/adb_auth_host.c<br>
&gt;&gt; &gt; -+++ b/adb/adb_auth_host.c<br>
&gt;&gt; &gt; -@@ -75,6 +75,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0BIGNUM* rem =3D BN_new();<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0BIGNUM* n =3D BN_new();<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0BIGNUM* n0inv =3D BN_new();<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 BIGNUM* e =3D BN_new();<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (RSA_size(rsa) !=3D RSANUMBYTES) {<br=
>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
&gt;&gt; &gt; -@@ -82,7 +83,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0BN_set_bit(r32, 32);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 BN_copy(n, rsa-&gt;n);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 RSA_get0_key(rsa, &amp;n, &amp;e, NULL);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0BN_set_bit(r, RSANUMWORDS * 32);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0BN_mod_sqr(rr, r, n, ctx);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0BN_div(NULL, rem, n, r32, ctx);<br>
&gt;&gt; &gt; -@@ -96,7 +97,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,<b=
r>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BN_div(n, rem, n, r32, ctx=
);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkey-&gt;n[i] =3D BN_get_w=
ord(rem);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 pkey-&gt;exponent =3D BN_get_word(rsa-&gt;e);=
<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 pkey-&gt;exponent =3D BN_get_word(e);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - out:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0BN_free(n0inv);<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/<a href=3D"http://ext4_utils.mk" rel=3D"noreferrer" target=3D"_blank">=
ext4_utils.mk</a> b/meta-oe/recipes-devtools/android-tools/android-tools/<a=
 href=3D"http://ext4_utils.mk" rel=3D"noreferrer" target=3D"_blank">ext4_ut=
ils.mk</a><br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index c18aa9c4d..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/<a=
 href=3D"http://ext4_utils.mk" rel=3D"noreferrer" target=3D"_blank">ext4_ut=
ils.mk</a><br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,103 +0,0 @@<br>
&gt;&gt; &gt; -# Makefile for ext4_utils<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -SRCDIR ?=3D $(S)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils<br>
&gt;&gt; &gt; -make_ext4fs_SRC_FILES +=3D make_ext4fs_main.c<br>
&gt;&gt; &gt; -make_ext4fs_SRC_FILES +=3D canned_fs_config.c<br>
&gt;&gt; &gt; -make_ext4fs_OBJS :=3D $(make_ext4fs_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -ext2simg_SRC_FILES +=3D ext2simg.c<br>
&gt;&gt; &gt; -ext2simg_OBJS :=3D $(ext2simg_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -ext4fixup_SRC_FILES +=3D ext4fixup_main.c<br>
&gt;&gt; &gt; -ext4fixup_OBJS :=3D $(ext4fixup_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D make_ext4fs.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D ext4fixup.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D ext4_utils.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D allocate.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D contents.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D extent.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D indirect.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D uuid.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D sha1.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D wipe.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D crc16.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D ext4_sb.c<br>
&gt;&gt; &gt; -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)<b=
r>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/libsparse<br>
&gt;&gt; &gt; -simg2img_SRC_FILES +=3D simg2img.c<br>
&gt;&gt; &gt; -simg2img_SRC_FILES +=3D sparse_crc32.c<br>
&gt;&gt; &gt; -simg2img_OBJS :=3D $(simg2img_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -img2simg_SRC_FILES +=3D img2simg.c<br>
&gt;&gt; &gt; -img2simg_OBJS :=3D $(img2simg_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -simg2simg_SRC_FILES +=3D simg2simg.c<br>
&gt;&gt; &gt; -simg2simg_SRC_FILES +=3D sparse_crc32.c<br>
&gt;&gt; &gt; -simg2simg_OBJS :=3D $(simg2simg_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D backed_block.c<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D output_file.c<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D sparse.c<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D sparse_crc32.c<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D sparse_err.c<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D sparse_read.c<br>
&gt;&gt; &gt; -libsparse_OBJS :=3D $(libsparse_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/external/libselinux/src<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D callbacks.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D check_context.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D freecon.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D init.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D label.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D label_file.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D label_android_property.c<br>
&gt;&gt; &gt; -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -CFLAGS +=3D -DANDROID<br>
&gt;&gt; &gt; -CFLAGS +=3D -DHOST<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch=
/$(android_arch)/AndroidConfig.h<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -all: make_ext4fs ext2simg ext4fixup simg2img img2simg simg2s=
img<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -make_ext4fs: libext4_utils.a libsparse.a libselinux.a $(make=
_ext4fs_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(make_ext=
4fs_OBJS) \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libex=
t4_utils.a libsparse.a libselinux.a -lz -lpcre<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -ext2simg: libext4_utils.a libselinux.a libsparse.a $(ext2sim=
g_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(ext2simg=
_OBJS) \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libex=
t4_utils.a libselinux.a libsparse.a -lz -lpcre<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -ext4fixup: libext4_utils.a libsparse.a $(ext4fixup_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(ext4fixu=
p_OBJS) libext4_utils.a libsparse.a -lz<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -simg2img: libsparse.a $(simg2img_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(simg2img=
_OBJS) libsparse.a -lz<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -img2simg: libsparse.a $(img2simg_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(img2simg=
_OBJS) libsparse.a -lz<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -simg2simg: libsparse.a $(simg2simg_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(simg2sim=
g_OBJS) libsparse.a -lz<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libext4_utils.a: $(libext4_utils_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libext4_utils_OBJS=
)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libsparse.a: $(libsparse_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libsparse_OBJS)<br=
>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libselinux.a: $(libselinux_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libselinux_OBJS)<b=
r>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -clean:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) $(make_ext4fs_OBJS) $(ext2s=
img_OBJS) $(ext4fixup_OBJS) \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(sim=
g2img_OBJS) $(img2simg_OBJS) $(simg2simg_OBJS) \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(lib=
ext4_utils_OBJS) $(libsparse_OBJS) $(libselinux_OBJS) \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make_=
ext4fs ext2simg ext4fixup simg2img img2simg simg2simg *.a<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/extras/0001-ext4_utils-remove-selinux-extensions.patch b/meta-oe/recip=
es-devtools/android-tools/android-tools/extras/0001-ext4_utils-remove-selin=
ux-extensions.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 4a19a5d65..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/ex=
tras/0001-ext4_utils-remove-selinux-extensions.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,39 +0,0 @@<br>
&gt;&gt; &gt; -From 354604da9d152f1931e91991d3f34197fc8fc759 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Sergio Schvezov &lt;<a href=3D"mailto:sergio.schvezov@=
canonical.com" target=3D"_blank">sergio.schvezov@canonical.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Tue, 2 Oct 2018 16:36:54 +0000<br>
&gt;&gt; &gt; -Subject: [PATCH] ext4_utils: remove selinux extensions<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -* drop useless includes of Android SELINUX extensions<br>
&gt;&gt; &gt; -* avoids having to clone another module<br>
&gt;&gt; &gt; -* this should be sent upstream<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Inappropriate<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - ext4_utils/make_ext4fs.c=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;&gt; &gt; - ext4_utils/make_ext4fs_main.c | 1 -<br>
&gt;&gt; &gt; - 2 files changed, 2 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4=
fs.c<br>
&gt;&gt; &gt; -index 2f89ae8a0..732afbed7 100644<br>
&gt;&gt; &gt; ---- a/ext4_utils/make_ext4fs.c<br>
&gt;&gt; &gt; -+++ b/ext4_utils/make_ext4fs.c<br>
&gt;&gt; &gt; -@@ -62,7 +62,6 @@<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #include &lt;selinux/selinux.h&gt;<br>
&gt;&gt; &gt; - #include &lt;selinux/label.h&gt;<br>
&gt;&gt; &gt; --#include &lt;selinux/android.h&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #define O_BINARY 0<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/ext4_utils/make_ext4fs_main.c b/ext4_utils/make=
_ext4fs_main.c<br>
&gt;&gt; &gt; -index a6c5f6160..f8e7b9da9 100644<br>
&gt;&gt; &gt; ---- a/ext4_utils/make_ext4fs_main.c<br>
&gt;&gt; &gt; -+++ b/ext4_utils/make_ext4fs_main.c<br>
&gt;&gt; &gt; -@@ -32,7 +32,6 @@<br>
&gt;&gt; &gt; - #ifndef USE_MINGW<br>
&gt;&gt; &gt; - #include &lt;selinux/selinux.h&gt;<br>
&gt;&gt; &gt; - #include &lt;selinux/label.h&gt;<br>
&gt;&gt; &gt; --#include &lt;selinux/android.h&gt;<br>
&gt;&gt; &gt; - #else<br>
&gt;&gt; &gt; - struct selabel_handle;<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch b/me=
ta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_utils-a=
dd-o-argument-to-preserve-ownership.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 3b50ffbf3..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/ex=
tras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,78 +0,0 @@<br>
&gt;&gt; &gt; -From b9254539811ce912bfd16dd1d185eba7a10cceff Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Markus Mayer &lt;<a href=3D"mailto:mmayer@mmayer.net" =
target=3D"_blank">mmayer@mmayer.net</a>&gt;<br>
&gt;&gt; &gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt;&gt; &gt; -Subject: [PATCH] ext4_utils: add -o argument to preserve own=
ership<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -See also <a href=3D"https://android-review.googlesource.com/=
#/c/100312/" rel=3D"noreferrer" target=3D"_blank">https://android-review.go=
oglesource.com/#/c/100312/</a><br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Inappropriate<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - ext4_utils/make_ext4fs.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++=
++<br>
&gt;&gt; &gt; - ext4_utils/make_ext4fs_main.c | 10 ++++++++--<br>
&gt;&gt; &gt; - 2 files changed, 14 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4=
fs.c<br>
&gt;&gt; &gt; -index 732afbed7..2cbf04399 100644<br>
&gt;&gt; &gt; ---- a/ext4_utils/make_ext4fs.c<br>
&gt;&gt; &gt; -+++ b/ext4_utils/make_ext4fs.c<br>
&gt;&gt; &gt; -@@ -67,6 +67,8 @@<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+int preserve_owner =3D 0;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; - /* TODO: Not implemented:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 Allocating blocks in the same block group as t=
he file inode<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 Hash or binary tree directories<br>
&gt;&gt; &gt; -@@ -185,6 +187,10 @@ static u32 build_directory_structure(co=
nst char *full_path, const char *dir_path<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} els=
e {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0dentries[i].mtime =3D fixed_time;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (preser=
ve_owner) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dentries[i].uid =3D stat.st_uid;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dentries[i].gid =3D stat.st_gid;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint6=
4_t capabilities;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (f=
s_config_func !=3D NULL) {<br>
&gt;&gt; &gt; - #ifdef ANDROID<br>
&gt;&gt; &gt; -diff --git a/ext4_utils/make_ext4fs_main.c b/ext4_utils/make=
_ext4fs_main.c<br>
&gt;&gt; &gt; -index f8e7b9da9..e82d43277 100644<br>
&gt;&gt; &gt; ---- a/ext4_utils/make_ext4fs_main.c<br>
&gt;&gt; &gt; -+++ b/ext4_utils/make_ext4fs_main.c<br>
&gt;&gt; &gt; -@@ -47,13 +47,15 @@ struct selabel_handle;<br>
&gt;&gt; &gt; - extern struct fs_info info;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+extern int preserve_owner;<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; - static void usage(char *path)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s [ -l &lt=
;len&gt; ] [ -j &lt;journal size&gt; ] [ -b &lt;block_size&gt; ]\n&quot;, b=
asename(path));<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;=C2=A0 =C2=
=A0 [ -g &lt;blocks per group&gt; ] [ -i &lt;inodes&gt; ] [ -I &lt;inode si=
ze&gt; ]\n&quot;);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;=C2=A0 =C2=
=A0 [ -L &lt;label&gt; ] [ -f ] [ -a &lt;android mountpoint&gt; ]\n&quot;);=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;=C2=A0 =C2=
=A0 [ -S file_contexts ] [ -C fs_config ] [ -T timestamp ]\n&quot;);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=C2=A0 =C2=A0 [ =
-z | -s ] [ -w ] [ -c ] [ -J ] [ -v ] [ -B &lt;block_list_file&gt; ]\n&quot=
;);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=C2=A0 =C2=A0 [ =
-z | -s ] [ -w ] [ -c ] [ -J ] [ -o ] [ -v ] [ -B &lt;block_list_file&gt; ]=
\n&quot;);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;=C2=A0 =C2=
=A0 &lt;filename&gt; [&lt;directory&gt;]\n&quot;);<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -79,7 +81,7 @@ int main(int argc, char **argv)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct selinux_opt seopts[] =3D {=
 { SELABEL_OPT_PATH, &quot;&quot; } };<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 while ((opt =3D getopt(argc, argv, &qu=
ot;l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctv&quot;)) !=3D -1) {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 while ((opt =3D getopt(argc, argv, &qu=
ot;l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctov&quot;)) !=3D -1) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switc=
h (opt) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case =
&#39;l&#39;:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0info.len =3D parse_num(optarg);<br>
&gt;&gt; &gt; -@@ -142,6 +144,10 @@ int main(int argc, char **argv)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;=
o&#39;:<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 preserve_owner =3D 1;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 printf(&quot;Warning: Enabling &#39;preserve ownership&#3=
9;, this is an unofficial feature!\n&quot;);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case =
&#39;v&#39;:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0verbose =3D 1;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/<a href=3D"http://fastboot.mk" rel=3D"noreferrer" target=3D"_blank">fa=
stboot.mk</a> b/meta-oe/recipes-devtools/android-tools/android-tools/<a hre=
f=3D"http://fastboot.mk" rel=3D"noreferrer" target=3D"_blank">fastboot.mk</=
a><br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index b9ba95f38..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/<a=
 href=3D"http://fastboot.mk" rel=3D"noreferrer" target=3D"_blank">fastboot.=
mk</a><br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,89 +0,0 @@<br>
&gt;&gt; &gt; -# Makefile for fastboot<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -SRCDIR ?=3D $(S)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/fastboot<br>
&gt;&gt; &gt; -fastboot_SRC_FILES +=3D protocol.c<br>
&gt;&gt; &gt; -fastboot_SRC_FILES +=3D engine.c<br>
&gt;&gt; &gt; -fastboot_SRC_FILES +=3D bootimg.c<br>
&gt;&gt; &gt; -fastboot_SRC_FILES +=3D fastboot.c<br>
&gt;&gt; &gt; -fastboot_SRC_FILES +=3D util.c<br>
&gt;&gt; &gt; -fastboot_SRC_FILES +=3D fs.c<br>
&gt;&gt; &gt; -fastboot_SRC_FILES +=3D usb_linux.c<br>
&gt;&gt; &gt; -fastboot_SRC_FILES +=3D util_linux.c<br>
&gt;&gt; &gt; -fastboot_OBJS :=3D $(fastboot_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/libzipfile<br>
&gt;&gt; &gt; -libzipfile_SRC_FILES +=3D centraldir.c<br>
&gt;&gt; &gt; -libzipfile_SRC_FILES +=3D zipfile.c<br>
&gt;&gt; &gt; -libzipfile_OBJS :=3D $(libzipfile_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D make_ext4fs.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D ext4fixup.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D ext4_utils.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D allocate.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D contents.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D extent.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D indirect.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D uuid.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D sha1.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D wipe.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D crc16.c<br>
&gt;&gt; &gt; -libext4_utils_SRC_FILES +=3D ext4_sb.c<br>
&gt;&gt; &gt; -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)<b=
r>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/libsparse<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D backed_block.c<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D output_file.c<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D sparse.c<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D sparse_crc32.c<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D sparse_err.c<br>
&gt;&gt; &gt; -libsparse_SRC_FILES +=3D sparse_read.c<br>
&gt;&gt; &gt; -libsparse_OBJS :=3D $(libsparse_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/external/libselinux/src<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D callbacks.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D check_context.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D freecon.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D init.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D label.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D label_file.c<br>
&gt;&gt; &gt; -libselinux_SRC_FILES +=3D label_android_property.c<br>
&gt;&gt; &gt; -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -CFLAGS +=3D -std=3Dgnu11<br>
&gt;&gt; &gt; -CFLAGS +=3D -DANDROID<br>
&gt;&gt; &gt; -# CFLAGS +=3D -DUSE_F2FS<br>
&gt;&gt; &gt; -CFLAGS +=3D -DHOST<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/fastboot<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/mkbootimg<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/extras/f2fs_utils<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch=
/$(android_arch)/AndroidConfig.h<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -LIBS +=3D libzipfile.a libext4_utils.a libsparse.a libselinu=
x.a -lz -lpcre<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -all: fastboot<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -fastboot: libzipfile.a libext4_utils.a libsparse.a libselinu=
x.a $(fastboot_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(fastboot=
_OBJS) $(LIBS)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libzipfile.a: $(libzipfile_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libzipfile_OBJS)<b=
r>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libext4_utils.a: $(libext4_utils_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libext4_utils_OBJS=
)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libsparse.a: $(libsparse_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libsparse_OBJS)<br=
>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libselinux.a: $(libselinux_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libselinux_OBJS)<b=
r>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -clean:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) $(fastboot_OBJS) $(libzipfi=
le_OBJS) $(libext4_utils_OBJS) \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(lib=
sparse_OBJS) $(libselinux_OBJS) fastboot *.a<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/fastboot_compile_remove_gtest.patch b/meta-oe/recipes-devtools/android=
-tools/android-tools/fastboot_compile_remove_gtest.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..a04f27f10<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/fa=
stboot_compile_remove_gtest.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,51 @@<br>
&gt;&gt; &gt; +socket.h: removing dependency of gtest<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Removed the dependency of gtest on the build of fastboot bin=
ary.<br>
&gt;&gt; &gt; +Fixes below error<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +In file included from fastboot/fastboot.cpp:70:<br>
&gt;&gt; &gt; +| In file included from fastboot/tcp.h:36:<br>
&gt;&gt; &gt; +| fastboot/socket.h:43:10: fatal error: &#39;gtest/gtest_pro=
d.h&#39; file not found<br>
&gt;&gt; &gt; +| #include &lt;gtest/gtest_prod.h&gt;<br>
&gt;&gt; &gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~<br>
&gt;&gt; &gt; +| 1 error generated.<br>
&gt;&gt; &gt; +| In file included from fastboot/socket.cpp:29:<br>
&gt;&gt; &gt; +| fastboot/socket.h:43:10: fatal error: &#39;gtest/gtest_pro=
d.h&#39; file not found<br>
&gt;&gt; &gt; +| #include &lt;gtest/gtest_prod.h&gt;<br>
&gt;&gt; &gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~<br>
&gt;&gt; &gt; +| 1 error generated.<br>
&gt;&gt; &gt; +| In file included from fastboot/tcp.cpp:29:<br>
&gt;&gt; &gt; +| In file included from fastboot/tcp.h:36:<br>
&gt;&gt; &gt; +| fastboot/socket.h:43:10: fatal error: &#39;gtest/gtest_pro=
d.h&#39; file not found<br>
&gt;&gt; &gt; +| #include &lt;gtest/gtest_prod.h&gt;<br>
&gt;&gt; &gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~<br>
&gt;&gt; &gt; +| 1 error generated.<br>
&gt;&gt; &gt; +| In file included from fastboot/udp.cpp:31:<br>
&gt;&gt; &gt; +| In file included from fastboot/udp.h:34:<br>
&gt;&gt; &gt; +| fastboot/socket.h:43:10: fatal error: &#39;gtest/gtest_pro=
d.h&#39; file not found<br>
&gt;&gt; &gt; +| #include &lt;gtest/gtest_prod.h&gt;<br>
&gt;&gt; &gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~<br>
&gt;&gt; &gt; +| 1 error generated.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- a/system/core/fastboot/socket.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A02021-04-14 21:14:00.355973915 +0000<br>
&gt;&gt; &gt; ++++ b/system/core/fastboot/socket.h=C2=A0 =C2=A02021-04-14 2=
1:14:21.879680699 +0000<br>
&gt;&gt; &gt; +@@ -40,7 +40,6 @@<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + #include &lt;android-base/macros.h&gt;<br>
&gt;&gt; &gt; + #include &lt;cutils/sockets.h&gt;<br>
&gt;&gt; &gt; +-#include &lt;gtest/gtest_prod.h&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + // Socket interface to be implemented for each platform.<br=
>
&gt;&gt; &gt; + class Socket {<br>
&gt;&gt; &gt; +@@ -119,8 +118,6 @@<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0socket_send_=
buffers_function_ =3D &amp;socket_send_buffers;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0private:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 FRIEND_TEST(SocketTest, TestTcpSendBuffers);<=
br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 FRIEND_TEST(SocketTest, TestUdpSendBuffers);<=
br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0DISALLOW_COPY_AND_ASSIGN(Socket);<br>
&gt;&gt; &gt; + };<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/fastboot_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-to=
ols/android-tools/fastboot_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..c8904f045<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/fa=
stboot_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,52 @@<br>
&gt;&gt; &gt; +patching <a href=3D"http://fastboot.mk" rel=3D"noreferrer" t=
arget=3D"_blank">fastboot.mk</a> to build in yocto environment.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Changes include:<br>
&gt;&gt; &gt; +Introduced an output folder which will keep all the outputs =
from the<br>
&gt;&gt; &gt; +android-tools.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary to the=
 OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Pending<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://fastboot.mk" re=
l=3D"noreferrer" target=3D"_blank">fastboot.mk</a> 2021-05-17 07:47:56.8002=
24043 +0000<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://fastboot.mk" re=
l=3D"noreferrer" target=3D"_blank">fastboot.mk</a> 2021-05-17 07:49:40.1303=
83096 +0000<br>
&gt;&gt; &gt; +@@ -1,3 +1,4 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME =3D fastboot<br>
&gt;&gt; &gt; + fastboot_SOURCES =3D \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootimg_utils.cpp \=
<br>
&gt;&gt; &gt; +@@ -38,11 +39,11 @@<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ifs_mgr/lib=
lp/include \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I/usr/inclu=
de/android/openssl \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ilibsparse/=
include \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ilibziparchive/i=
nclude<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ilibziparchive/i=
nclude -I$(OUT_DIR)/usr/include/<br>
&gt;&gt; &gt; + LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/an=
droid \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fuse-ld=3Dgold \<=
br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D=
. \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L. -lziparchive -=
lsparse -lbase -lcutils -ladb -lcrypto -lext4_utils \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D=
$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/l=
ib/$(DEB_HOST_MULTIARCH)/android -lziparchive -lsparse -lbase -lcutils -lad=
b -lcrypto -lext4_utils \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -L/usr/lib/$(DEB_H=
OST_MULTIARCH)/android \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -l7z \<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +@@ -53,7 +54,8 @@<br>
&gt;&gt; &gt; + endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(SOURCES)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o fastboot/$(NAME) $(CXXFLA=
GS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/bin/fas=
tboot<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/bin/fastbo=
ot/$(NAME) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) fastboot/$(NAME)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/bin/fastboot/$(NA=
ME)<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/gitignore b/meta-oe/recipes-devtools/android-tools/android-tools/gitig=
nore<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index b034c10a1..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/gi=
tignore<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,59 +0,0 @@<br>
&gt;&gt; &gt; -*<br>
&gt;&gt; &gt; -!.gitignore<br>
&gt;&gt; &gt; -!*.indirectionsymlink<br>
&gt;&gt; &gt; -!*.[ch]<br>
&gt;&gt; &gt; -!*.mk<br>
&gt;&gt; &gt; -!*.patch<br>
&gt;&gt; &gt; -!*.service<br>
&gt;&gt; &gt; -!NOTICE<br>
&gt;&gt; &gt; -!MODULE_LICENSE_*<br>
&gt;&gt; &gt; -!/system/<br>
&gt;&gt; &gt; -!/system/core/<br>
&gt;&gt; &gt; -!/system/core/adb/<br>
&gt;&gt; &gt; -!/system/core/fastboot/<br>
&gt;&gt; &gt; -!/system/core/fs_mgr/<br>
&gt;&gt; &gt; -!/system/core/fs_mgr/include/<br>
&gt;&gt; &gt; -!/system/core/include/<br>
&gt;&gt; &gt; -!/system/core/include/android/<br>
&gt;&gt; &gt; -!/system/core/include/cutils/<br>
&gt;&gt; &gt; -!/system/core/include/log/<br>
&gt;&gt; &gt; -!/system/core/include/mincrypt/<br>
&gt;&gt; &gt; -!/system/core/include/private/<br>
&gt;&gt; &gt; -!/system/core/include/utils/<br>
&gt;&gt; &gt; -!/system/core/include/zipfile/<br>
&gt;&gt; &gt; -!/system/core/liblog/<br>
&gt;&gt; &gt; -!/system/core/liblog/tests/<br>
&gt;&gt; &gt; -!/system/core/libcutils/<br>
&gt;&gt; &gt; -!/system/core/libmincrypt/<br>
&gt;&gt; &gt; -!/system/core/libzipfile/<br>
&gt;&gt; &gt; -!/system/core/libsparse/<br>
&gt;&gt; &gt; -!/system/core/libsparse/include/<br>
&gt;&gt; &gt; -!/system/core/libsparse/include/sparse/<br>
&gt;&gt; &gt; -!/system/core/libsparse/simg_dump.py<br>
&gt;&gt; &gt; -!/system/core/mkbootimg/<br>
&gt;&gt; &gt; -!/system/extras/<br>
&gt;&gt; &gt; -!/system/extras/ext4_utils/<br>
&gt;&gt; &gt; -!/system/extras/ext4_utils/mkuserimg.sh<br>
&gt;&gt; &gt; -!/system/extras/ext4_utils/test_ext4fixup<br>
&gt;&gt; &gt; -!/system/extras/f2fs_utils/<br>
&gt;&gt; &gt; -!/hardware/<br>
&gt;&gt; &gt; -!/hardware/libhardware/<br>
&gt;&gt; &gt; -!/hardware/libhardware/include/<br>
&gt;&gt; &gt; -!/hardware/libhardware/include/hardware/<br>
&gt;&gt; &gt; -!/external/<br>
&gt;&gt; &gt; -!/external/libselinux/<br>
&gt;&gt; &gt; -!/external/libselinux/include/<br>
&gt;&gt; &gt; -!/external/libselinux/include/selinux/<br>
&gt;&gt; &gt; -!/external/libselinux/src/<br>
&gt;&gt; &gt; -!/external/f2fs-tools/<br>
&gt;&gt; &gt; -!/external/f2fs-tools/include/<br>
&gt;&gt; &gt; -!/external/f2fs-tools/lib/<br>
&gt;&gt; &gt; -!/external/f2fs-tools/mkfs/<br>
&gt;&gt; &gt; -!/build/<br>
&gt;&gt; &gt; -!/build/core/<br>
&gt;&gt; &gt; -!/build/core/<a href=3D"http://version_defaults.mk" rel=3D"n=
oreferrer" target=3D"_blank">version_defaults.mk</a><br>
&gt;&gt; &gt; -!/build/core/combo/<br>
&gt;&gt; &gt; -!/build/core/combo/include/<br>
&gt;&gt; &gt; -!/build/core/combo/include/arch/<br>
&gt;&gt; &gt; -!/build/core/combo/include/arch/linux-*/<br>
&gt;&gt; &gt; -!/build/core/combo/include/arch/linux-*/AndroidConfig.h<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/img2simg_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools=
/android-tools/img2simg_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..6913c4b98<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/im=
g2simg_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,41 @@<br>
&gt;&gt; &gt; +patching <a href=3D"http://img2simg.mk" rel=3D"noreferrer" t=
arget=3D"_blank">img2simg.mk</a> to build in yocto environment.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Changes include:<br>
&gt;&gt; &gt; +Introduced an output folder which will keep all the outputs =
from the<br>
&gt;&gt; &gt; +android-tools.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary to the=
 OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Pending<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://img2simg.mk" re=
l=3D"noreferrer" target=3D"_blank">img2simg.mk</a> 2021-05-12 09:05:38.5806=
07289 +0000<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://img2simg.mk" re=
l=3D"noreferrer" target=3D"_blank">img2simg.mk</a> 2021-05-12 09:09:04.3319=
08253 +0000<br>
&gt;&gt; &gt; +@@ -1,13 +1,14 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME =3D img2simg<br>
&gt;&gt; &gt; + SOURCES =3D img2simg.cpp<br>
&gt;&gt; &gt; + SOURCES :=3D $(foreach source, $(SOURCES), libsparse/$(sour=
ce))<br>
&gt;&gt; &gt; + CPPFLAGS +=3D -Ilibsparse/include -Iinclude -std=3Dgnu++17<=
br>
&gt;&gt; &gt; +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/an=
droid \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D=
. \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L. -lsparse<br>
&gt;&gt; &gt; ++LDFLAGS +=3D -Wl,-rpath=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MUL=
TIARCH)/android \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D=
$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/l=
ib/$(DEB_HOST_MULTIARCH)/android/ -lsparse<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(SOURCES)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o libsparse/$(NAME) $(CPPFL=
AGS) $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/bin/$(NAME=
) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) libsparse/$(NAME)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/bin/$(NAME)<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libadb_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tool=
s/android-tools/libadb_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..7094ccaa9<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
badb_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,44 @@<br>
&gt;&gt; &gt; +<a href=3D"http://libadb.mk" rel=3D"noreferrer" target=3D"_b=
lank">libadb.mk</a>: modifications to make it build in yocto environment<br=
>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary to the=
 OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://libadb.mk" rel=
=3D"noreferrer" target=3D"_blank">libadb.mk</a>=C2=A0 =C2=A02021-04-30 16:2=
9:34.596618862 +0200<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://libadb.mk" rel=
=3D"noreferrer" target=3D"_blank">libadb.mk</a>=C2=A0 =C2=A02021-04-30 16:3=
6:53.932837490 +0200<br>
&gt;&gt; &gt; +@@ -1,3 +1,4 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME :=3D libadb<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + LIBADB_SRC_FILES :=3D \<br>
&gt;&gt; &gt; +@@ -43,18 +44,18 @@<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ibase/inclu=
de \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Idiagnose_u=
sb/include \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ilibcrypto_=
utils/include \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Iinclude \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Iinclude -I$(OUT=
_DIR)/usr/include \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DPLATFORM_T=
OOLS_VERSION=3D&#39;&quot;$(PLATFORM_TOOLS_VERSION)&quot;&#39; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DADB_HOST=
=3D1 -DADB_VERSION=3D&#39;&quot;$(DEB_VERSION)&quot;&#39;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/=
lib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L/usr/lib/$(DEB_H=
OST_MULTIARCH)/android -lcrypto \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -L. -lba=
se -lcutils -lcrypto_utils -lusb-1.0<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/l=
ib/$(DEB_HOST_MULTIARCH)/android -lcrypto \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -lbase -=
lcutils -lcrypto_utils -lusb-1.0<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + $(NAME).so: $(SOURCES)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) =
$(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/=
$(DEB_HOST_MULTIARCH)/android/$(NAME).so<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + transport_mdns_unsupported.cpp:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;void init_mdns_transpor=
t_discovery(void) {}&#39; &gt; transport_mdns_unsupported.cpp<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libbacktrace_mk_change_out_dir.patch b/meta-oe/recipes-devtools/androi=
d-tools/android-tools/libbacktrace_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..464b63de2<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
bbacktrace_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,60 @@<br>
&gt;&gt; &gt; +patching <a href=3D"http://libbacktrace.mk" rel=3D"noreferre=
r" target=3D"_blank">libbacktrace.mk</a> to build in yocto environment.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Changes include:<br>
&gt;&gt; &gt; +Introduced an output folder which will keep all the outputs =
from the<br>
&gt;&gt; &gt; +android-tools.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary to the=
 OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Pending<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://libbacktrace.mk=
" rel=3D"noreferrer" target=3D"_blank">libbacktrace.mk</a>=C2=A0 =C2=A0 =C2=
=A02021-05-21 23:51:55.022408433 +0000<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://libbacktrace.mk=
" rel=3D"noreferrer" target=3D"_blank">libbacktrace.mk</a>=C2=A0 =C2=A0 =C2=
=A02021-05-21 23:53:07.487543521 +0000<br>
&gt;&gt; &gt; +@@ -1,5 +1,6 @@<br>
&gt;&gt; &gt; +-<br>
&gt;&gt; &gt; +-include /usr/share/dpkg/<a href=3D"http://architecture.mk" =
rel=3D"noreferrer" target=3D"_blank">architecture.mk</a><br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; ++#pass architecture specific info to makefile<br>
&gt;&gt; &gt; ++DEB_HOST_ARCH=3D${deb_host_arch}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + NAME =3D libbacktrace<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +@@ -88,11 +89,11 @@<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ilibprocinf=
o/include \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ilibunwinds=
tack/include \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I/usr/inclu=
de/android/lzma \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I/usr/include/an=
droid/unwind<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(OUT_DIR)/usr/=
include/android/libunwind<br>
&gt;&gt; &gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/=
lib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L/usr/lib/$(DEB_H=
OST_MULTIARCH)/android -lunwind \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L. -lbase -llog -=
lpthread -l7z<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/l=
ib/$(DEB_HOST_MULTIARCH)/android -lunwind \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lbase -llog -lpth=
read -l7z<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + # -latomic should be the last library specified<br>
&gt;&gt; &gt; + # <a href=3D"https://github.com/android/ndk/issues/589" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/android/ndk/issues/589=
</a><br>
&gt;&gt; &gt; +@@ -104,11 +105,11 @@<br>
&gt;&gt; &gt; + endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(COBJECTS) $(CXXOBJECTS) $(OBJECTS_ASSEMBLY)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)<b=
r>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(OUT_DIR)/usr/lib/$(DEB_HOST_MU=
LTIARCH)/android/$(NAME).so.0 $(NAME).so<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(COBJECTS) $(CXXOBJECTS) $(NAME=
).so*<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(COBJECTS) $(CXXOBJECTS) $(OUT_=
DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + $(CXXOBJECTS): %.o: %.cpp<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CXX) $&lt; -o $@ $(CXXFLAGS) $(=
CPPFLAGS)<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libbase_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-too=
ls/android-tools/libbase_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..37c93d6d0<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
bbase_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,33 @@<br>
&gt;&gt; &gt; +<a href=3D"http://libbase.mk" rel=3D"noreferrer" target=3D"_=
blank">libbase.mk</a>: modifications to make it build in yocto environment<=
br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary to the=
 OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://libbase.mk" rel=
=3D"noreferrer" target=3D"_blank">libbase.mk</a>=C2=A0 2021-04-29 22:01:13.=
664181133 +0200<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://libbase.mk" rel=
=3D"noreferrer" target=3D"_blank">libbase.mk</a>=C2=A0 2021-04-29 22:04:52.=
328123833 +0200<br>
&gt;&gt; &gt; +@@ -1,3 +1,4 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME =3D libbase<br>
&gt;&gt; &gt; + SOURCES =3D \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chrono_utils.cpp \<=
br>
&gt;&gt; &gt; +@@ -20,8 +21,9 @@<br>
&gt;&gt; &gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(SOURCES)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) =
$(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/=
$(DEB_HOST_MULTIARCH)/android/$(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r base/include/* $(OUT_DIR)/usr/in=
clude/<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(NAME).so*<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MU=
LTIARCH)/android/$(NAME).so*<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libcrypto_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-t=
ools/android-tools/libcrypto_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..f70590977<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
bcrypto_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,30 @@<br>
&gt;&gt; &gt; +<a href=3D"http://libcrypto.mk" rel=3D"noreferrer" target=3D=
"_blank">libcrypto.mk</a>: modifications to make it build in yocto environm=
ent<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary and in=
clude<br>
&gt;&gt; &gt; +to the OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/external/boringssl/debian/<a href=3D"http://libcrypt=
o.mk" rel=3D"noreferrer" target=3D"_blank">libcrypto.mk</a> 2021-04-30 11:3=
2:40.610312307 +0000<br>
&gt;&gt; &gt; ++++ git/external/boringssl/debian/<a href=3D"http://libcrypt=
o.mk" rel=3D"noreferrer" target=3D"_blank">libcrypto.mk</a> 2021-04-30 11:3=
6:47.738318880 +0000<br>
&gt;&gt; &gt; +@@ -1,3 +1,4 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + include <a href=3D"http://sources.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">sources.mk</a><br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + NAME =3D libcrypto<br>
&gt;&gt; &gt; +@@ -26,6 +27,8 @@<br>
&gt;&gt; &gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 -lpthread<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(SOURCES)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 mkdir --parents debian/out<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o debian/out/$(NAME).so.0 $(=
CFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 debian/out/$(NAME).=
so<br>
&gt;&gt; &gt; +\ No newline at end of file<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/lib/$(D=
EB_HOST_MULTIARCH)/android/<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/include=
<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_H=
OST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -DOPEN=
SSL_NO_ASM<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/=
$(DEB_HOST_MULTIARCH)/android/$(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r include/openssl $(OUT_DIR)/usr/i=
nclude<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libcrypto_utils_mk_change_out_dir.patch b/meta-oe/recipes-devtools/and=
roid-tools/android-tools/libcrypto_utils_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..a0dd34876<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
bcrypto_utils_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,38 @@<br>
&gt;&gt; &gt; +<a href=3D"http://libcrypto_utils.mk" rel=3D"noreferrer" tar=
get=3D"_blank">libcrypto_utils.mk</a>: modifications to make it build in yo=
cto environment<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary and he=
ader to the OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://libcrypto_utils=
.mk" rel=3D"noreferrer" target=3D"_blank">libcrypto_utils.mk</a>=C2=A0 2021=
-04-30 14:18:54.071379767 +0200<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://libcrypto_utils=
.mk" rel=3D"noreferrer" target=3D"_blank">libcrypto_utils.mk</a>=C2=A0 2021=
-04-30 14:22:46.179047308 +0200<br>
&gt;&gt; &gt; +@@ -1,15 +1,17 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME:=3D libcrypto_utils<br>
&gt;&gt; &gt; + SOURCES :=3D android_pubkey.c<br>
&gt;&gt; &gt; + SOURCES :=3D $(foreach source, $(SOURCES), libcrypto_utils/=
$(source))<br>
&gt;&gt; &gt; +-CPPFLAGS +=3D -Ilibcrypto_utils/include -Iinclude<br>
&gt;&gt; &gt; ++CPPFLAGS +=3D -Ilibcrypto_utils/include -Iinclude -I$(OUT_D=
IR)/usr/include<br>
&gt;&gt; &gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath=3D/usr/lib/$(DEB_HOST_=
MULTIARCH)/android \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 -L/usr/lib/$(DEB_HOST_MULTIARCH)/andro=
id \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIA=
RCH)/android \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-lcrypto -Wl,-z,defs<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(SOURCES)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(NAME).so.0=C2=A0 $(CPPFL=
AGS) $(LDFLAGS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_H=
OST_MULTIARCH)/android/$(NAME).so.0=C2=A0 $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/=
$(DEB_HOST_MULTIARCH)/android/$(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r libcrypto_utils/include/* $(OUT_=
DIR)/usr/include/<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(NAME).so*<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MU=
LTIARCH)/android/$(NAME).so*<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libcutils_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-t=
ools/android-tools/libcutils_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..5539eb91d<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
bcutils_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,27 @@<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://libcutils.mk" r=
el=3D"noreferrer" target=3D"_blank">libcutils.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2021-05-17 06:38:40.105161629 +0000<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://libcutils.mk" r=
el=3D"noreferrer" target=3D"_blank">libcutils.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2021-05-17 06:42:37.141912366 +0000<br>
&gt;&gt; &gt; +@@ -1,3 +1,4 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME =3D libcutils<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + # copied from libcutils/Android.bp<br>
&gt;&gt; &gt; +@@ -50,14 +51,15 @@<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Iinclude \<=
br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath=3D/usr/=
lib/$(DEB_HOST_MULTIARCH)/android -lpthread -L. -llog -lbase<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath=3D/usr/=
lib/$(DEB_HOST_MULTIARCH)/android -lpthread -L$(OUT_DIR)/usr/lib/$(DEB_HOST=
_MULTIARCH)/android/ -llog -lbase<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(COBJECTS) $(CXXOBJECTS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)<b=
r>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/=
$(DEB_HOST_MULTIARCH)/android/$(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r libcutils/include/cutils $(OUT_D=
IR)/usr/include/<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME=
).so*<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(OUT_=
DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + $(COBJECTS): %.o: %.c<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $&lt; -o $@ $(CFLAGS) $(CPP=
FLAGS)<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libext4_utils_mk_change_out_dir.patch b/meta-oe/recipes-devtools/andro=
id-tools/android-tools/libext4_utils_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..efccfab9c<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
bext4_utils_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,42 @@<br>
&gt;&gt; &gt; +<a href=3D"http://libext4_utils.mk" rel=3D"noreferrer" targe=
t=3D"_blank">libext4_utils.mk</a>: modifications to make it build in yocto =
environment<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary and he=
ader to the OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/system/extras/debian/<a href=3D"http://libext4_utils=
.mk" rel=3D"noreferrer" target=3D"_blank">libext4_utils.mk</a>=C2=A0 2021-0=
4-29 21:46:39.384394114 +0000<br>
&gt;&gt; &gt; ++++ git/system/extras/debian/<a href=3D"http://libext4_utils=
.mk" rel=3D"noreferrer" target=3D"_blank">libext4_utils.mk</a>=C2=A0 2021-0=
4-29 21:49:53.808605543 +0000<br>
&gt;&gt; &gt; +@@ -1,3 +1,4 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME =3D libext4_utils<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + ext4_utils_SOURCES :=3D \<br>
&gt;&gt; &gt; +@@ -17,14 +18,16 @@<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Iext4_utils=
/include \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ilibfec/inc=
lude \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Isquashfs_u=
tils \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I/usr/include/an=
droid \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I/usr/include/an=
droid -I$(OUT_DIR)/usr/include \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-D_GNU_SOURC=
E -DFEC_NO_KLOG -DSQUASHFS_NO_KLOG -D_LARGEFILE64_SOURCE<br>
&gt;&gt; &gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/=
lib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L/usr/lib/$(DEB_H=
OST_MULTIARCH)/android \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/l=
ib/$(DEB_HOST_MULTIARCH)/android/ \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -lbase -lsparse -l=
selinux<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(SOURCES)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(OUT_DIR)/$(NAME).so.0 $(=
CFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/$(NAME).=
so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/lib/$(D=
EB_HOST_MULTIARCH)/android/<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_H=
OST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/=
$(DEB_HOST_MULTIARCH)/android/$(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r ext4_utils/include/* $(OUT_DIR)/=
usr/include/<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libfec_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tool=
s/android-tools/libfec_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..0f8184d41<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
bfec_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,35 @@<br>
&gt;&gt; &gt; +--- git/system/extras/debian/<a href=3D"http://libfec.mk" re=
l=3D"noreferrer" target=3D"_blank">libfec.mk</a> 2021-05-17 06:55:51.973044=
031 +0000<br>
&gt;&gt; &gt; ++++ git/system/extras/debian/<a href=3D"http://libfec.mk" re=
l=3D"noreferrer" target=3D"_blank">libfec.mk</a> 2021-05-17 06:56:41.940185=
413 +0000<br>
&gt;&gt; &gt; +@@ -1,3 +1,4 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME =3D libfec<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + # copied from libfec/Android.bp<br>
&gt;&gt; &gt; +@@ -12,20 +13,21 @@<br>
&gt;&gt; &gt; + CXXFLAGS +=3D -fno-strict-aliasing -std=3Dg++17<br>
&gt;&gt; &gt; + CPPFLAGS +=3D \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Iext4_utils=
/include \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ilibfec/include =
\<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ilibfec/include =
-I $(OUT_DIR)/usr/include \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-D_GNU_SOURC=
E -DFEC_NO_KLOG -D_LARGEFILE64_SOURCE<br>
&gt;&gt; &gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/=
lib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L/usr/lib/$(DEB_H=
OST_MULTIARCH)/android \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/l=
ib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -lbase -lsparse -l=
selinux<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(COBJECTS) $(CXXOBJECTS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 mkdir -p $(OUT_DIR)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/$(NAME).so.0 $=
(LDFLAGS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/$(NAME).=
so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir -p $(OUT_DIR)/usr/lib/$(DEB_HOST=
_MULTIARCH)/android<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/=
$(DEB_HOST_MULTIARCH)/android/$(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r libfec/include/* $(OUT_DIR)/usr/=
include/<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME=
).so*<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(OUT_=
DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + $(COBJECTS): %.o: %.c<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $&lt; -o $@ $(CFLAGS) $(CPP=
FLAGS)<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/liblog_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tool=
s/android-tools/liblog_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..09ef1871b<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
blog_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,42 @@<br>
&gt;&gt; &gt; +patching <a href=3D"http://liblog.mk" rel=3D"noreferrer" tar=
get=3D"_blank">liblog.mk</a> to build in yocto environment.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Changes include:<br>
&gt;&gt; &gt; +Introduced an output folder which will keep all the outputs =
from the<br>
&gt;&gt; &gt; +android-tools.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary to the=
 OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Pending<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://liblog.mk" rel=
=3D"noreferrer" target=3D"_blank">liblog.mk</a>=C2=A0 =C2=A02021-05-17 08:1=
3:28.304700936 +0000<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://liblog.mk" rel=
=3D"noreferrer" target=3D"_blank">liblog.mk</a>=C2=A0 =C2=A02021-05-17 08:1=
5:59.590064282 +0000<br>
&gt;&gt; &gt; +@@ -1,3 +1,4 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME =3D liblog<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + # copied from liblog/Android.bp<br>
&gt;&gt; &gt; +@@ -39,11 +40,12 @@<br>
&gt;&gt; &gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 -lpthread<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(COBJECTS) $(CXXOBJECTS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)<b=
r>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/=
$(DEB_HOST_MULTIARCH)/android/$(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r liblog/include/* $(OUT_DIR)/usr/=
include/<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(COBJECTS) $(CXXOBJECTS) $(NAME=
).so*<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(COBJECTS) $(CXXOBJECTS) $(OUT_=
DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + $(COBJECTS): %.o: %.c<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $&lt; -o $@ $(CFLAGS) $(CPP=
FLAGS)<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libselinux/0001-Remove-bionic-specific-calls.patch b/meta-oe/recipes-d=
evtools/android-tools/android-tools/libselinux/0001-Remove-bionic-specific-=
calls.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 9de2593df..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/li=
bselinux/0001-Remove-bionic-specific-calls.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,25 +0,0 @@<br>
&gt;&gt; &gt; -From 36654a4484117e5f4d63a810c0d94bc9c7ee3a83 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Fathi Boudra &lt;<a href=3D"mailto:fabo@debian.org" ta=
rget=3D"_blank">fabo@debian.org</a>&gt;<br>
&gt;&gt; &gt; -Date: Tue, 2 Oct 2018 16:36:54 +0000<br>
&gt;&gt; &gt; -Subject: [PATCH] Remove bionic specific calls<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: Inappropriate<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jan=
sa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - src/procattr.c | 2 +-<br>
&gt;&gt; &gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -diff --git a/src/procattr.c b/src/procattr.c<br>
&gt;&gt; &gt; -index f350808..761cf8e 100644<br>
&gt;&gt; &gt; ---- a/src/procattr.c<br>
&gt;&gt; &gt; -+++ b/src/procattr.c<br>
&gt;&gt; &gt; -@@ -8,7 +8,7 @@<br>
&gt;&gt; &gt; - #include &quot;selinux_internal.h&quot;<br>
&gt;&gt; &gt; - #include &quot;policy.h&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --#ifdef HOST<br>
&gt;&gt; &gt; -+#ifndef __BIONIC__<br>
&gt;&gt; &gt; - static pid_t gettid(void)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return syscall(__NR_gettid);<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.p=
atch b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001=
-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 87771cba8..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/li=
bselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch<br=
>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,49 +0,0 @@<br>
&gt;&gt; &gt; -From f4f9d24860e1b5cd4f6a014f3fda7cd33ebe5be7 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; -From: Petr Lautrbach &lt;<a href=3D"mailto:plautrba@redhat.c=
om" target=3D"_blank">plautrba@redhat.com</a>&gt;<br>
&gt;&gt; &gt; -Date: Sat, 27 Jul 2019 08:20:20 -0700<br>
&gt;&gt; &gt; -Subject: [PATCH] libselinux: Do not define gettid() if glibc=
 &gt;=3D 2.30 is used<br>
&gt;&gt; &gt; -MIME-Version: 1.0<br>
&gt;&gt; &gt; -Content-Type: text/plain; charset=3DUTF-8<br>
&gt;&gt; &gt; -Content-Transfer-Encoding: 8bit<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Since version 2.30 glibc implements gettid() system call wra=
pper, see<br>
&gt;&gt; &gt; -<a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=
=3D6399" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzil=
la/show_bug.cgi?id=3D6399</a><br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Fixes:<br>
&gt;&gt; &gt; -cc -O2 -g -pipe -Wall -Werror=3Dformat-security -Wp,-D_FORTI=
FY_SOURCE=3D2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-stro=
ng -grecord-gcc-switches -specs=3D/usr/lib/rpm/redhat/redhat-hardened-cc1 -=
specs=3D/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=3Dgeneric -fasyn=
chronous-unwind-tables -fstack-clash-protection -fcf-protection -I../includ=
e -D_GNU_SOURCE=C2=A0 -DNO_ANDROID_BACKEND=C2=A0 =C2=A0-c -o procattr.o pro=
cattr.c<br>
&gt;&gt; &gt; -procattr.c:28:14: error: static declaration of =E2=80=98gett=
id=E2=80=99 follows non-static declaration<br>
&gt;&gt; &gt; -=C2=A0 =C2=A028 | static pid_t gettid(void)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~<br>
&gt;&gt; &gt; -In file included from /usr/include/unistd.h:1170,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from procattr.c:2:<br>
&gt;&gt; &gt; -/usr/include/bits/unistd_ext.h:34:16: note: previous declara=
tion of =E2=80=98gettid=E2=80=99 was here<br>
&gt;&gt; &gt; -=C2=A0 =C2=A034 | extern __pid_t gettid (void) __THROW;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~~~<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Petr Lautrbach &lt;<a href=3D"mailto:plautrba=
@redhat.com" target=3D"_blank">plautrba@redhat.com</a>&gt;<br>
&gt;&gt; &gt; -Acked-by: Stephen Smalley &lt;<a href=3D"mailto:sds@tycho.ns=
a.gov" target=3D"_blank">sds@tycho.nsa.gov</a>&gt;<br>
&gt;&gt; &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ----<br>
&gt;&gt; &gt; - src/procattr.c | 14 +++++++++++++-<br>
&gt;&gt; &gt; - 1 file changed, 13 insertions(+), 1 deletion(-)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ---- a/src/procattr.c<br>
&gt;&gt; &gt; -+++ b/src/procattr.c<br>
&gt;&gt; &gt; -@@ -8,12 +8,16 @@<br>
&gt;&gt; &gt; - #include &quot;selinux_internal.h&quot;<br>
&gt;&gt; &gt; - #include &quot;policy.h&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --#ifndef __BIONIC__<br>
&gt;&gt; &gt; -+/* Bionic and glibc &gt;=3D 2.30 declare gettid() system ca=
ll wrapper in unistd.h and<br>
&gt;&gt; &gt; -+ * has a definition for it */<br>
&gt;&gt; &gt; -+#if defined(__GLIBC_)<br>
&gt;&gt; &gt; -+#if !__GLIBC_PREREQ(2,30)<br>
&gt;&gt; &gt; - static pid_t gettid(void)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return syscall(__NR_gettid);<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - static int getprocattrcon(char ** context,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t pid, const char *attr)<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libsparse_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-t=
ools/android-tools/libsparse_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..4f8bb44a4<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
bsparse_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,47 @@<br>
&gt;&gt; &gt; +patching <a href=3D"http://libsparse.mk" rel=3D"noreferrer" =
target=3D"_blank">libsparse.mk</a> to build in yocto environment.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Changes include:<br>
&gt;&gt; &gt; +Introduced an output folder which will keep all the outputs =
from the<br>
&gt;&gt; &gt; +android-tools.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary to the=
 OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Pending<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://libsparse.mk" r=
el=3D"noreferrer" target=3D"_blank">libsparse.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2021-05-17 08:13:34.764584388 +0000<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://libsparse.mk" r=
el=3D"noreferrer" target=3D"_blank">libsparse.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2021-05-17 08:15:34.850492654 +0000<br>
&gt;&gt; &gt; +@@ -1,3 +1,4 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME =3D libsparse<br>
&gt;&gt; &gt; + SOURCES =3D \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backed_block.cpp \<br>
&gt;&gt; &gt; +@@ -18,16 +19,16 @@<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0-shared -Wl,-soname,$(NAME).so.0 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0-lz \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0-Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/and=
roid \<br>
&gt;&gt; &gt; +-=C2=A0 -L. \<br>
&gt;&gt; &gt; ++=C2=A0 -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ =
\<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0-lbase<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(COBJECTS) $(CXXOBJECTS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)<b=
r>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/=
$(DEB_HOST_MULTIARCH)/android/$(NAME).so<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME=
).so*<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(OUT_=
DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + $(COBJECTS): %.o: %.c<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $&lt; -o $@ $(CFLAGS) $(CPP=
FLAGS)<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libunwind_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-t=
ools/android-tools/libunwind_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..237d45c3c<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
bunwind_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,47 @@<br>
&gt;&gt; &gt; +patching libundwind to build in yocto environment.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Changes include:<br>
&gt;&gt; &gt; +Introduced an output folder which will keep all the outputs =
from the<br>
&gt;&gt; &gt; +android-tools.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary to the=
 OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Passing the architecture details($CPU)from the recipe.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Pending<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/external/libunwind/debian/<a href=3D"http://libunwin=
d.mk" rel=3D"noreferrer" target=3D"_blank">libunwind.mk</a> 2021-05-22 02:2=
9:52.950324653 +0000<br>
&gt;&gt; &gt; ++++ git/external/libunwind/debian/<a href=3D"http://libunwin=
d.mk" rel=3D"noreferrer" target=3D"_blank">libunwind.mk</a> 2021-05-22 02:3=
0:48.535322846 +0000<br>
&gt;&gt; &gt; +@@ -1,4 +1,4 @@<br>
&gt;&gt; &gt; +-include debian/<a href=3D"http://detect_arch.mk" rel=3D"nor=
eferrer" target=3D"_blank">detect_arch.mk</a><br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + ARCH_SOURCES =3D is_fpreg.c \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regn=
ame.c \<br>
&gt;&gt; &gt; +@@ -131,10 +131,12 @@<br>
&gt;&gt; &gt; + CPPFLAGS +=3D -Iinclude -Isrc $($(CPU)_INCLUDES) -Idebian/i=
nclude<br>
&gt;&gt; &gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/=
lib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -nostdli=
b -lc -lgcc -Ldebian/out -l7z<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -nostdli=
b -lc -lgcc -l7z<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(SOURCES)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 mkdir --parents debian/out<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s /usr/lib/p7zip/7z.so debian/out/=
lib7z.so<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o debian/out/$(NAME).so.0 $(=
CFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 debian/out/$(NAME).=
so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/lib/$(D=
EB_HOST_MULTIARCH)/android/<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/include=
/android/libunwind<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_H=
OST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -Wno-h=
eader-guard -Wno-absolute-value<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/=
$(DEB_HOST_MULTIARCH)/android/$(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r include/* debian/include/* $(OUT=
_DIR)/usr/include/android/libunwind/<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/libziparchive_mk_change_out_dir.patch b/meta-oe/recipes-devtools/andro=
id-tools/android-tools/libziparchive_mk_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..cc9997dac<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/li=
bziparchive_mk_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,47 @@<br>
&gt;&gt; &gt; +patching <a href=3D"http://libziparchive.mk" rel=3D"noreferr=
er" target=3D"_blank">libziparchive.mk</a> to build in yocto environment.<b=
r>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Changes include:<br>
&gt;&gt; &gt; +Introduced an output folder which will keep all the outputs =
from the<br>
&gt;&gt; &gt; +android-tools.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary to the=
 OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Pending<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://libziparchive.m=
k" rel=3D"noreferrer" target=3D"_blank">libziparchive.mk</a>=C2=A0 =C2=A0 2=
021-05-17 08:13:41.684459540 +0000<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://libziparchive.m=
k" rel=3D"noreferrer" target=3D"_blank">libziparchive.mk</a>=C2=A0 =C2=A0 2=
021-05-17 08:16:19.293722572 +0000<br>
&gt;&gt; &gt; +@@ -1,3 +1,4 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME =3D libziparchive<br>
&gt;&gt; &gt; + SOURCES =3D zip_archive.cc \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zip_archive_stream_=
entry.cc\<br>
&gt;&gt; &gt; +@@ -5,14 +6,15 @@<br>
&gt;&gt; &gt; + SOURCES :=3D $(foreach source, $(SOURCES), libziparchive/$(=
source))<br>
&gt;&gt; &gt; + CXXFLAGS +=3D -std=3Dgnu++17<br>
&gt;&gt; &gt; + CPPFLAGS +=3D -DZLIB_CONST -D_FILE_OFFSET_BITS=3D64 \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Iinclude -Ibase/=
include -Ilibziparchive/include<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Iinclude -Ibase/=
include -Ilibziparchive/include -I$(OUT_DIR)/usr/include/<br>
&gt;&gt; &gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/=
lib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lz -L. -llog -lba=
se<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lz -L$(OUT_DIR)/u=
sr/lib/$(DEB_HOST_MULTIARCH)/android -llog -lbase<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(SOURCES)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) =
$(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/=
$(DEB_HOST_MULTIARCH)/android/$(NAME).so<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r libziparchive/include/* $(OUT_DI=
R)/usr/include/<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(NAME).so*<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MU=
LTIARCH)/android/$(NAME).so*<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/<a href=3D"http://mkbootimg.mk" rel=3D"noreferrer" target=3D"_blank">m=
kbootimg.mk</a> b/meta-oe/recipes-devtools/android-tools/android-tools/<a h=
ref=3D"http://mkbootimg.mk" rel=3D"noreferrer" target=3D"_blank">mkbootimg.=
mk</a><br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 519f609fd..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/<a=
 href=3D"http://mkbootimg.mk" rel=3D"noreferrer" target=3D"_blank">mkbootim=
g.mk</a><br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,29 +0,0 @@<br>
&gt;&gt; &gt; -# Makefile for mkbootimg<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -SRCDIR ?=3D $(S)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/mkbootimg<br>
&gt;&gt; &gt; -mkbootimg_SRC_FILES +=3D mkbootimg.c<br>
&gt;&gt; &gt; -mkbootimg_OBJS :=3D $(mkbootimg_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -VPATH +=3D $(SRCDIR)/system/core/libmincrypt<br>
&gt;&gt; &gt; -libmincrypt_SRC_FILES :=3D dsa_sig.c p256.c p256_ec.c p256_e=
cdsa.c rsa.c sha.c sha256.c<br>
&gt;&gt; &gt; -libmincrypt_OBJS :=3D $(libmincrypt_SRC_FILES:.c=3D.o)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -CFLAGS +=3D -DANDROID<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/mkbootimg<br>
&gt;&gt; &gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/include<br>
&gt;&gt; &gt; -CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch=
/$(android_arch)/AndroidConfig.h<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -LIBS +=3D libmincrypt.a<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -all: mkbootimg<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -mkbootimg: libmincrypt.a $(mkbootimg_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(mkbootim=
g_OBJS) $(LIBS)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -libmincrypt.a: $(libmincrypt_OBJS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libmincrypt_OBJS)<=
br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -clean:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) $(mkbootimg_OBJS) $(libminc=
rypt_OBJS) mkbootimg *.a<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" target=3D"_blank"=
>rules_yocto.mk</a> b/meta-oe/recipes-devtools/android-tools/android-tools/=
<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" target=3D"_blank">rule=
s_yocto.mk</a><br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..5e217f47f<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/<a=
 href=3D"http://rules_yocto.mk" rel=3D"noreferrer" target=3D"_blank">rules_=
yocto.mk</a><br>
&gt;&gt; &gt; @@ -0,0 +1,4 @@<br>
&gt;&gt; &gt; +CPPFLAGS +=3D -fPIC<br>
&gt;&gt; &gt; +ifndef OUT_DIR<br>
&gt;&gt; &gt; +OUT_DIR =3D ../../debian/out<br>
&gt;&gt; &gt; +endif<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/simg2img_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools=
/android-tools/simg2img_change_out_dir.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..d17adfffd<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/si=
mg2img_change_out_dir.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,41 @@<br>
&gt;&gt; &gt; +patching <a href=3D"http://simg2img.mk" rel=3D"noreferrer" t=
arget=3D"_blank">simg2img.mk</a> to build in yocto environment.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Changes include:<br>
&gt;&gt; &gt; +Introduced an output folder which will keep all the outputs =
from the<br>
&gt;&gt; &gt; +android-tools.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Adding an include file that is setting the common flags.<br>
&gt;&gt; &gt; +Changed the cppflag to include the headers from other compon=
ents<br>
&gt;&gt; &gt; +of android-tools<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified LDflags so that the libraries that are coming from =
other android-tools<br>
&gt;&gt; &gt; +are searched in the output folder.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Modified the build rule so that it outputs the binary to the=
 OUT_DIR<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Pa=
rrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Pending<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- git/system/core/debian/<a href=3D"http://simg2img.mk" re=
l=3D"noreferrer" target=3D"_blank">simg2img.mk</a> 2021-05-12 09:47:52.5778=
40520 +0000<br>
&gt;&gt; &gt; ++++ git/system/core/debian/<a href=3D"http://simg2img.mk" re=
l=3D"noreferrer" target=3D"_blank">simg2img.mk</a> 2021-05-12 09:51:43.5256=
78276 +0000<br>
&gt;&gt; &gt; +@@ -1,13 +1,14 @@<br>
&gt;&gt; &gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"nore=
ferrer" target=3D"_blank">rules_yocto.mk</a><br>
&gt;&gt; &gt; + NAME =3D simg2img<br>
&gt;&gt; &gt; + SOURCES =3D simg2img.cpp sparse_crc32.cpp<br>
&gt;&gt; &gt; + SOURCES :=3D $(foreach source, $(SOURCES), libsparse/$(sour=
ce))<br>
&gt;&gt; &gt; + CPPFLAGS +=3D -Ilibsparse/include -Iinclude -std=3Dgnu++17<=
br>
&gt;&gt; &gt; +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/an=
droid \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D=
. \<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L. -lsparse<br>
&gt;&gt; &gt; ++LDFLAGS +=3D -Wl,-rpath=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MUL=
TIARCH)/android \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D=
$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/l=
ib/$(DEB_HOST_MULTIARCH)/android -lsparse<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + build: $(SOURCES)<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o libsparse/$(NAME) $(CPPFL=
AGS) $(LDFLAGS)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/bin/$(NAME=
) $(CPPFLAGS) $(LDFLAGS)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + clean:<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) libsparse/$(NAME)<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/bin/$(NAME)<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-t=
ools/use_name_space_std_to_compile_libbacktrace.patch b/meta-oe/recipes-dev=
tools/android-tools/android-tools/use_name_space_std_to_compile_libbacktrac=
e.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..079ade46b<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/us=
e_name_space_std_to_compile_libbacktrace.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,19 @@<br>
&gt;&gt; &gt; +To Fix the below error<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + In file included from libunwindstack/DwarfSection.cpp:21:<b=
r>
&gt;&gt; &gt; +| libunwindstack/include/unwindstack/DwarfMemory.h:32:29: er=
ror: unknown type name &#39;size_t&#39;; did you mean &#39;std::size_t&#39;=
?<br>
&gt;&gt; &gt; +|=C2=A0 =C2=A0bool ReadBytes(void* dst, size_t num_bytes);<b=
r>
&gt;&gt; &gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~<br>
&gt;&gt; &gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::size_t<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- ./system/core/libunwindstack/include/unwindstack/DwarfMe=
mory.h=C2=A0 =C2=A0 =C2=A02021-05-22 00:52:15.132452862 +0000<br>
&gt;&gt; &gt; ++++ ./system/core/libunwindstack/include/unwindstack/DwarfMe=
mory.h=C2=A0 =C2=A0 =C2=A02021-05-22 00:53:09.793416724 +0000<br>
&gt;&gt; &gt; +@@ -23,7 +23,7 @@<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + // Forward declarations.<br>
&gt;&gt; &gt; + class Memory;<br>
&gt;&gt; &gt; +-<br>
&gt;&gt; &gt; ++using namespace std;<br>
&gt;&gt; &gt; + class DwarfMemory {<br>
&gt;&gt; &gt; +=C2=A0 public:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0DwarfMemory(Memory* memory) : memory_(memory) {=
}<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/<a href=
=3D"http://android-tools_10.0.0.r36.bb" rel=3D"noreferrer" target=3D"_blank=
">android-tools_10.0.0.r36.bb</a> b/meta-oe/recipes-devtools/android-tools/=
<a href=3D"http://android-tools_10.0.0.r36.bb" rel=3D"noreferrer" target=3D=
"_blank">android-tools_10.0.0.r36.bb</a><br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..02c669582<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/android-tools/<a href=3D"http:=
//android-tools_10.0.0.r36.bb" rel=3D"noreferrer" target=3D"_blank">android=
-tools_10.0.0.r36.bb</a><br>
&gt;&gt; &gt; @@ -0,0 +1,204 @@<br>
&gt;&gt; &gt; +DESCRIPTION =3D &quot;Different utilities from Android&quot;=
<br>
&gt;&gt; &gt; +SECTION =3D &quot;console/utils&quot;<br>
&gt;&gt; &gt; +LICENSE =3D &quot;Apache-2.0 &amp; GPL-2.0 &amp; BSD-2-Claus=
e &amp; BSD-3-Clause&quot;<br>
&gt;&gt; &gt; +LIC_FILES_CHKSUM =3D &quot; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D=
89aea4e17d99a7cacdbeed46a0096b10 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=
=3D801f80980d171dd6425610833a22dbe6 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=
=3Dcb641bc04cda31daea161b1bc15da69f \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=
=3D550794465ba0ec5312d6919e203a55f9 \<br>
&gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; +DEPENDS =3D &quot;libbsd libpcre zlib libcap libusb squashfs=
-tools p7zip libselinux&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +ANDROID_MIRROR =3D &quot;<a href=3D"http://android.googlesou=
rce.com" rel=3D"noreferrer" target=3D"_blank">android.googlesource.com</a>&=
quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +# matches with 10.0.0+r36<br>
&gt;&gt; &gt; +SRCREV_boringssl =3D &quot;ae2dd49c7cb74d04bdba7c1c9bd62c1e9=
cdf98f6&quot;<br>
&gt;&gt; &gt; +SRCREV_core =3D &quot;5aa13b053182b758d7a19db0c83e1b9b5bf1ec=
2e&quot;<br>
&gt;&gt; &gt; +SRCREV_extras =3D &quot;d31740f9d0399f8b938e88e58843d966e1cc=
cab6&quot;<br>
&gt;&gt; &gt; +SRCREV_libhardware =3D &quot;c6925520342a7d37758f85eb1cf3baa=
20a7b7a18&quot;<br>
&gt;&gt; &gt; +SRCREV_build =3D &quot;28768b3120f751583a2743101b892f210d471=
5cf&quot;<br>
&gt;&gt; &gt; +SRCREV_libunwind =3D &quot;03a963ecf6ea836b38b3537cbcda0ecfd=
7a77393&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +SRC_URI =3D &quot; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/andro=
id-tools-team/android-platform-external-boringssl;name=3Dboringssl;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3Dgit/external/boringssl" rel=3D"noreferre=
r" target=3D"_blank">salsa.debian.org/android-tools-team/android-platform-e=
xternal-boringssl;name=3Dboringssl;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3Dgit/external/boringssl</a> \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/andro=
id-tools-team/android-platform-system-core;name=3Dcore;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3Dgit/system/core" rel=3D"noreferrer" target=3D"_blank=
">salsa.debian.org/android-tools-team/android-platform-system-core;name=3Dc=
ore;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/core</a> \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/andro=
id-tools-team/android-platform-system-extras;name=3Dextras;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3Dgit/system/extras" rel=3D"noreferrer" target=3D"=
_blank">salsa.debian.org/android-tools-team/android-platform-system-extras;=
name=3Dextras;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/extras<=
/a> \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/hardware/libh=
ardware;name=3Dlibhardware;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/h=
ardware/libhardware \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/andro=
id-tools-team/android-platform-build.git;name=3Dbuild;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3Dgit/build" rel=3D"noreferrer" target=3D"_blank">salsa=
.debian.org/android-tools-team/android-platform-build.git;name=3Dbuild;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/build</a> \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/andro=
id-tools-team/android-platform-external-libunwind.git;protocol=3Dhttps;name=
=3Dlibunwind;nobranch=3D1;destsuffix=3Dgit/external/libunwind" rel=3D"noref=
errer" target=3D"_blank">salsa.debian.org/android-tools-team/android-platfo=
rm-external-libunwind.git;protocol=3Dhttps;name=3Dlibunwind;nobranch=3D1;de=
stsuffix=3Dgit/external/libunwind</a> \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://adb_mk_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://libadb_mk_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://fastboot_compile_remove_gtest.patch \<b=
r>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://fastboot_mk_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://libbase_mk_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://libext4_utils_mk_change_out_dir.patch \=
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://libcrypto_mk_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://libcrypto_utils_mk_change_out_dir.patch=
 \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://libcutils_mk_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://libfec_mk_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://img2simg_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://simg2img_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://liblog_mk_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://libsparse_mk_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://libziparchive_mk_change_out_dir.patch \=
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://libbacktrace_mk_change_out_dir.patch \<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://libunwind_mk_change_out_dir.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://use_name_space_std_to_compile_libbacktr=
ace.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://<a href=3D"http://rules_yocto.mk" rel=
=3D"noreferrer" target=3D"_blank">rules_yocto.mk</a>;subdir=3Dgit \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 file://android-tools-adbd.service \<br>
&gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; &gt; +B =3D &quot;${WORKDIR}/${BPN}&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#apply all the patches maintained in the debian version.<br>
&gt;&gt; &gt; +do_unpack_and_patch_debian() {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 cd ${S}/system/core<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 for i in `find ${S}/system/core/debian/patches=
 -name &quot;*.patch&quot;`; do<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch -p1 &lt; $i<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 done<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 #a patch with no .patch extention, lets apply =
that<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 patch -p1 &lt; ${S}/system/core/debian/patches=
/Added-missing-headers<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 cd ${S}/external/libunwind<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 for i in `find ${S}/external/libunwind/debian/=
patches -name &quot;*.patch&quot;`; do<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch -p1 &lt; $i<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 done<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +addtask unpack_and_patch_debian after do_unpack before do_pa=
tch<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +# <a href=3D"http://errors.yoctoproject.org/Errors/Details/1=
debian881/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject=
.org/Errors/Details/1debian881/</a><br>
&gt;&gt; &gt; +ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
&gt;&gt; &gt; +ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +COMPATIBLE_HOST_powerpc =3D &quot;(null)&quot;<br>
&gt;&gt; &gt; +COMPATIBLE_HOST_powerpc64 =3D &quot;(null)&quot;<br>
&gt;&gt; &gt; +COMPATIBLE_HOST_powerpc64le =3D &quot;(null)&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +inherit systemd clang<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +TOOLCHAIN =3D &quot;clang&quot;<br>
&gt;&gt; &gt; +DEPENDS +=3D &quot;\<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 clang-cross-${TARGET_ARCH} \<br>
&gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +SYSTEMD_SERVICE_${PN} =3D &quot;android-tools-adbd.service&q=
uot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +# Find libbsd headers during native builds<br>
&gt;&gt; &gt; +CC_append_class-native =3D &quot; -I${STAGING_INCDIR}&quot;<=
br>
&gt;&gt; &gt; +CC_append_class-nativesdk =3D &quot; -I${STAGING_INCDIR}&quo=
t;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +PREREQUISITE_core =3D &quot;libbase libsparse liblog libcuti=
ls&quot;<br>
&gt;&gt; &gt; +TOOLS_TO_BUILD =3D &quot;libcrypto_utils libadb libziparchiv=
e fastboot adb img2simg simg2img libbacktrace&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +# Adb needs sys/capability.h, which is not available for nat=
ive*<br>
&gt;&gt; &gt; +TOOLS_class-native =3D &quot;boringssl fastboot ext4_utils m=
kbootimg&quot;<br>
&gt;&gt; &gt; +TOOLS_class-nativesdk =3D &quot;boringssl fastboot ext4_util=
s mkbootimg&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +do_compile() {<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case &quot;${HOST_ARCH}&quot; in<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 arm)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-arm<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu=3Darm<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_host_arch=3Darm<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 aarch64)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-arm6=
4<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu=3Darm64<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_host_arch=3Darm64<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 riscv64)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-risc=
v64<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 mips|mipsel)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-mips=
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu=3Dmips<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_host_arch=3Dmips<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 mips64|mips64el)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-mips=
64<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu=3Dmips64<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_host_arch=3Dmips64<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 powerpc|powerpc64)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-ppc<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 i586|i686|x86_64)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-x86<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu=3Dx86_64<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_host_arch=3Damd64<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 esac<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 export SRCDIR=3D${S}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 oe_runmake -f ${S}/external/boringssl/debian/<=
a href=3D"http://libcrypto.mk" rel=3D"noreferrer" target=3D"_blank">libcryp=
to.mk</a> -C ${S}/external/boringssl<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 oe_runmake -f ${S}/external/libunwind/debian/<=
a href=3D"http://libunwind.mk" rel=3D"noreferrer" target=3D"_blank">libunwi=
nd.mk</a> -C ${S}/external/libunwind CPU=3D${cpu}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 for tool in ${PREREQUISITE_core}; do<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 oe_runmake -f ${S}/system/core/debian/$=
{tool}.mk -C ${S}/system/core<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 done<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 for i in `find ${S}/system/extras/debian/ -nam=
e &quot;*.mk&quot;`; do<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -f $i -C ${S}/system/=
extras<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 done<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 for tool in ${TOOLS_TO_BUILD}; do<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if tool =3D=3D &quot;libbacktrac=
e&quot;; then<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -f ${S}=
/system/core/debian/${tool}.mk -C ${S}/system/core DEB_HOST_ARCH=3D${deb_ho=
st_arch}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -f ${S}=
/system/core/debian/${tool}.mk -C ${S}/system/core<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 done<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +do_install() {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if echo ${TOOLS_TO_BUILD} | grep -q &quot;ext4=
_utils&quot; ; then<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -p -m0755 ${S}/system=
/core/libsparse/simg_dump.py ${D}${bindir}/simg_dump<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if echo ${TOOLS_TO_BUILD} | grep -q &quot;adb =
&quot; ; then<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${S}/debian/out/u=
sr/lib/android/adb/adb ${D}${bindir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if echo ${TOOLS_TO_BUILD} | grep -q &quot;adbd=
&quot; ; then<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/adbd/adbd ${=
D}${bindir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 # Outside the if statement to avoid errors dur=
ing do_package<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 install -D -p -m0644 ${WORKDIR}/android-tools-=
adbd.service \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 ${D}${systemd_unitdir}/system/android-t=
ools-adbd.service<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if echo ${TOOLS_TO_BUILD} | grep -q &quot;fast=
boot&quot; ; then<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${S}/debian/out/u=
sr/bin/fastboot/fastboot ${D}${bindir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 install -d=C2=A0 ${D}${libdir}/android/<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 install -m0755 ${S}/debian/out/usr/lib/android=
/*.so.* ${D}${libdir}/android/<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if echo ${TOOLS_TO_BUILD} | grep -q &quot;mkbo=
otimg&quot; ; then<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/mkbootimg/mk=
bootimg ${D}${bindir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +PACKAGES +=3D &quot;${PN}-fstools&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +RDEPENDS_${BPN} =3D &quot;${BPN}-conf p7zip&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +FILES_${PN}-fstools =3D &quot;\<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 ${bindir}/ext2simg \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 ${bindir}/ext4fixup \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 ${bindir}/img2simg \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 ${bindir}/make_ext4fs \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 ${bindir}/simg2img \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 ${bindir}/simg2simg \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 ${bindir}/simg_dump \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 ${bindir}/mkuserimg \<br>
&gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; +FILES_${PN} +=3D &quot;${libdir}/android ${libdir}/android/*=
&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/android-tools/<a href=
=3D"http://android-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank"=
>android-tools_5.1.1.r37.bb</a> b/meta-oe/recipes-devtools/android-tools/<a=
 href=3D"http://android-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_b=
lank">android-tools_5.1.1.r37.bb</a><br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index e8992346b..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/android-tools/<a href=3D"http:=
//android-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank">android-=
tools_5.1.1.r37.bb</a><br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,182 +0,0 @@<br>
&gt;&gt; &gt; -DESCRIPTION =3D &quot;Different utilities from Android&quot;=
<br>
&gt;&gt; &gt; -SECTION =3D &quot;console/utils&quot;<br>
&gt;&gt; &gt; -LICENSE =3D &quot;Apache-2.0 &amp; GPL-2.0 &amp; BSD-2-Claus=
e &amp; BSD-3-Clause&quot;<br>
&gt;&gt; &gt; -LIC_FILES_CHKSUM =3D &quot; \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D=
89aea4e17d99a7cacdbeed46a0096b10 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=
=3D801f80980d171dd6425610833a22dbe6 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=
=3Dcb641bc04cda31daea161b1bc15da69f \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=
=3D550794465ba0ec5312d6919e203a55f9 \<br>
&gt;&gt; &gt; -&quot;<br>
&gt;&gt; &gt; -DEPENDS =3D &quot;libbsd libpcre zlib libcap&quot;<br>
&gt;&gt; &gt; -DEPENDS_append_class-target =3D &quot; openssl&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -ANDROID_MIRROR =3D &quot;<a href=3D"http://android.googlesou=
rce.com" rel=3D"noreferrer" target=3D"_blank">android.googlesource.com</a>&=
quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -# matches with android-5.1.1_r37<br>
&gt;&gt; &gt; -SRCREV_core =3D &quot;2314b110bdebdbfd2d94c502282f9e57c84989=
7e&quot;<br>
&gt;&gt; &gt; -SRCREV_extras =3D &quot;3ecbe8d841df96127d7855661293e5ab6ba6=
c205&quot;<br>
&gt;&gt; &gt; -SRCREV_libhardware =3D &quot;be55eb1f4d840c82ffaf7c47460df17=
ff5bc4d9b&quot;<br>
&gt;&gt; &gt; -SRCREV_libselinux =3D &quot;07e9e1339ad1ba608acfba9dce2d0f47=
4b252feb&quot;<br>
&gt;&gt; &gt; -SRCREV_build =3D &quot;16e987def3d7d8f7d30805eb95cef69e52a87=
dbc&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -SRC_URI =3D &quot; \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/system/core;n=
ame=3Dcore;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/system/extras=
;name=3Dextras;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/extras=
 \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/hardware/libh=
ardware;name=3Dlibhardware;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/h=
ardware/libhardware \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/external/libs=
elinux;name=3Dlibselinux;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/ext=
ernal/libselinux \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/build;name=3D=
build;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/build \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0001-adb-remove-selinux-extensions=
.patch;patchdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0002-adb-Use-local-sockets-where-a=
ppropriate.patch;patchdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0003-adb-define-shell-command.patc=
h;patchdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0004-adb-Fix-build-on-big-endian-s=
ystems.patch;patchdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0005-adb-add-base64-implementation=
.patch;patchdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0006-adb-Musl-fixes.patch;patchdir=
=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0007-adb-usb_linux.c-fix-build-wit=
h-glibc-2.28.patch;patchdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0008-adb-Allow-adbd-to-be-ran-as-r=
oot.patch;patchdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0009-mkbootimg-Add-dt-parameter-to=
-specify-DT-image.patch;patchdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0010-Use-linux-capability.h-on-lin=
ux-systems-too.patch;patchdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0011-Remove-bionic-specific-calls.=
patch;patchdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0012-Fix-implicit-declaration-of-s=
tlcat-strlcopy-function.patch;patchdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/adb_libssl_11.diff;patchdir=3Dsyst=
em/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://core/0013-adb-Support-riscv64.patch;pat=
chdir=3Dsystem/core \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://extras/0001-ext4_utils-remove-selinux-e=
xtensions.patch;patchdir=3Dsystem/extras \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://extras/0002-ext4_utils-add-o-argument-t=
o-preserve-ownership.patch;patchdir=3Dsystem/extras \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://libselinux/0001-Remove-bionic-specific-=
calls.patch;patchdir=3Dexternal/libselinux \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://libselinux/0001-libselinux-Do-not-defin=
e-gettid-if-glibc-2.30-is-use.patch;patchdir=3Dexternal/libselinux \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://android-tools-adbd.service \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://build/0001-Riscv-Add-risc-v-Android-con=
fig-header.patch;patchdir=3Dbuild \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://gitignore \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://<a href=3D"http://adb.mk" rel=3D"norefe=
rrer" target=3D"_blank">adb.mk</a>;subdir=3D${BPN} \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://<a href=3D"http://adbd.mk" rel=3D"noref=
errer" target=3D"_blank">adbd.mk</a>;subdir=3D${BPN} \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://<a href=3D"http://ext4_utils.mk" rel=3D=
"noreferrer" target=3D"_blank">ext4_utils.mk</a>;subdir=3D${BPN} \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://<a href=3D"http://fastboot.mk" rel=3D"n=
oreferrer" target=3D"_blank">fastboot.mk</a>;subdir=3D${BPN} \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://<a href=3D"http://mkbootimg.mk" rel=3D"=
noreferrer" target=3D"_blank">mkbootimg.mk</a>;subdir=3D${BPN} \<br>
&gt;&gt; &gt; -&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; &gt; -B =3D &quot;${WORKDIR}/${BPN}&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -# <a href=3D"http://errors.yoctoproject.org/Errors/Details/1=
33881/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org=
/Errors/Details/133881/</a><br>
&gt;&gt; &gt; -ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
&gt;&gt; &gt; -ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -COMPATIBLE_HOST_powerpc =3D &quot;(null)&quot;<br>
&gt;&gt; &gt; -COMPATIBLE_HOST_powerpc64 =3D &quot;(null)&quot;<br>
&gt;&gt; &gt; -COMPATIBLE_HOST_powerpc64le =3D &quot;(null)&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -inherit systemd<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -SYSTEMD_PACKAGES =3D &quot;${PN}-adbd&quot;<br>
&gt;&gt; &gt; -SYSTEMD_SERVICE_${PN}-adbd =3D &quot;android-tools-adbd.serv=
ice&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -# Find libbsd headers during native builds<br>
&gt;&gt; &gt; -CC_append_class-native =3D &quot; -I${STAGING_INCDIR}&quot;<=
br>
&gt;&gt; &gt; -CC_append_class-nativesdk =3D &quot; -I${STAGING_INCDIR}&quo=
t;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -TOOLS =3D &quot;adb fastboot ext4_utils mkbootimg adbd&quot;=
<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -# Adb needs sys/capability.h, which is not available for nat=
ive*<br>
&gt;&gt; &gt; -TOOLS_class-native =3D &quot;fastboot ext4_utils mkbootimg&q=
uot;<br>
&gt;&gt; &gt; -TOOLS_class-nativesdk =3D &quot;fastboot ext4_utils mkbootim=
g&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -do_compile() {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 cp ${WORKDIR}/gitignore ${S}/.gitignore<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 # Setting both variables below causing our mak=
efiles to not work with<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 # implicit make rules<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 unset CFLAGS<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 unset CPPFLAGS<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 export SRCDIR=3D${S}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 case &quot;${HOST_ARCH}&quot; in<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 arm)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-arm<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 aarch64)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-arm6=
4<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 riscv64)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-risc=
v64<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 mips|mipsel)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-mips=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 mips64|mips64el)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-mips=
64<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 powerpc|powerpc64)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-ppc<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 i586|i686|x86_64)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-x86<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 esac<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 for tool in ${TOOLS}; do<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 mkdir -p ${B}/${tool}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 oe_runmake -f ${B}/${tool}.mk -C ${B}/$=
{tool}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 done<br>
&gt;&gt; &gt; -}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -do_install() {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 if echo ${TOOLS} | grep -q &quot;ext4_utils&qu=
ot; ; then<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -p -m0755 ${S}/system=
/core/libsparse/simg_dump.py ${D}${bindir}/simg_dump<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -p -m0755 ${S}/system=
/extras/ext4_utils/mkuserimg.sh ${D}${bindir}/mkuserimg<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/e=
xt2simg ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/e=
xt4fixup ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/i=
mg2simg ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/m=
ake_ext4fs ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/s=
img2img ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/s=
img2simg ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 fi<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 if echo ${TOOLS} | grep -q &quot;adb &quot; ; =
then<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/adb/adb ${D}=
${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 fi<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 if echo ${TOOLS} | grep -q &quot;adbd&quot; ; =
then<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/adbd/adbd ${=
D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 fi<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 # Outside the if statement to avoid errors dur=
ing do_package<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 install -D -p -m0644 ${WORKDIR}/android-tools-=
adbd.service \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 ${D}${systemd_unitdir}/system/android-t=
ools-adbd.service<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 if echo ${TOOLS} | grep -q &quot;fastboot&quot=
; ; then<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/fastboot/fas=
tboot ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 fi<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 if echo ${TOOLS} | grep -q &quot;mkbootimg&quo=
t; ; then<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/mkbootimg/mk=
bootimg ${D}${bindir}<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 fi<br>
&gt;&gt; &gt; -}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -PACKAGES =3D+ &quot;${PN}-fstools ${PN}-adbd&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -RDEPENDS_${PN}-adbd =3D &quot;${PN}-conf&quot;<br>
&gt;&gt; &gt; -RDEPENDS_${PN}-fstools =3D &quot;bash&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -FILES_${PN}-adbd =3D &quot;\<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 ${bindir}/adbd \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 ${systemd_unitdir}/system/android-tools-adbd.s=
ervice \<br>
&gt;&gt; &gt; -&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -FILES_${PN}-fstools =3D &quot;\<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 ${bindir}/ext2simg \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 ${bindir}/ext4fixup \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 ${bindir}/img2simg \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 ${bindir}/make_ext4fs \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 ${bindir}/simg2img \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 ${bindir}/simg2simg \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 ${bindir}/simg_dump \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 ${bindir}/mkuserimg \<br>
&gt;&gt; &gt; -&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.17.1<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--00000000000060626605c350498d--

Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.3773.1622099925560949111
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 00:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JW90EFs0;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: nishaparrakat@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id r11so4489481edt.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 00:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uNFYz05ezMHIlGQ22wXV1onKHzlN5Hm5t/PSqbCT64o=;
        b=JW90EFs0jJxmi+0I3exQnsBzCv9gHCkhPk69GCUMzcn1kJnZAU7N2OMrSyHkwxfnQK
         vfUnwKD2pH7T8QCC98wew4foiWkbgBMPkyNLPEITpcLjB3FztB9mTcPtt8pDg3s6EnoP
         uKvjt+bcOAUQJo1afVAuo8hfGX4fCEJV9LGDJD1x6Wmit5pzIz9YPV0nUcjN92is4ttJ
         YX/dEanvI7QNaEK0yrfgqevtb752RNsplnTva8Mfb5j20xI9rRnLgUQ69sCruW+HxheX
         SId6hAmR2BOUTJuT3LF7Zwu698lhO2+JrMiuQXTZuuFYcmeXeHmoLaC3kDR/Kq3SoW+k
         HQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uNFYz05ezMHIlGQ22wXV1onKHzlN5Hm5t/PSqbCT64o=;
        b=EV5hes7NljBxuFXaDs/wc2p7h7FFcuzSLDx3qpWhxi+a3PQiYj9ajD+LgqKKORrEk0
         TfRWsYwcHiDNldiPWD3VVCWvEbjAPelOufbARfUes8agoErljIdZ0Vh1YQRGpygBcgwB
         Q87g8d9jUA/GEVkQEiRGPYZxR4tNJMph0LjP3ZpNpQPC2Rgr74aTK6kkUIqxQzXiBOd6
         QSNDOhcMn3dvdIrgz9ZfPo/L86wVZP+W1NAGIb+1z1RxnwPCa40XNUZHmhc4gWB5aXJF
         qGbSyWjv5icleV1EQI1z6UatuQ0umbCnvxLqiNVWmPRJSIC/piA78IU8N59ovUVAi8vk
         lUZQ==
X-Gm-Message-State: AOAM533ViP4VJ0Hln3dD+Nm1Azw7QUVyEvzjTN+H+QiTXmz8FZuOcdQ4
	wu1mIVtSHBo+k1x1f3kHWKKqvpivfLOlFQt+8Ko=
X-Google-Smtp-Source: ABdhPJzu+b1p+cPoQH3Wt0brdT9W1gM1SY3JEuPYS6ZChfL0yiyW2W4TLweKOma6d3Td/X9SpognE7Afj8xFt9mBhRk=
X-Received: by 2002:a05:6402:254d:: with SMTP id l13mr2588190edb.281.1622099923340;
 Thu, 27 May 2021 00:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210526195929.26047-1-nishaparrakat@gmail.com>
 <20210526195929.26047-2-nishaparrakat@gmail.com> <CAMKF1soaWc2yFmD5POtF_+t86wAxYVe3oXUoLAKTuDd36Qp4NA@mail.gmail.com>
In-Reply-To: <CAMKF1soaWc2yFmD5POtF_+t86wAxYVe3oXUoLAKTuDd36Qp4NA@mail.gmail.com>
From: "Nisha Parrakat" <nishaparrakat@gmail.com>
Date: Thu, 27 May 2021 09:18:31 +0200
Message-ID: <CAMR+PikT9n4i6jOw1B-JPaUkzOQtyQX5O8UKPN708wsqipWj-g@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH 2/2] android-tools: upgrade android-tools to latest debian 10.0.0.r36
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Nisha Parrakat <Nisha.Parrakat@kpit.com>
Content-Type: multipart/alternative; boundary="000000000000b8924005c34a91fd"

--000000000000b8924005c34a91fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Khem,
This particular patch will need meta-clang and meta-selinux.
Where can I find the documentation to use dynamic-layers and include such
cases where we need multple layers for a recipe ?

regards
Nisha P

Am Do., 27. Mai 2021 um 06:15 Uhr schrieb Khem Raj <raj.khem@gmail.com>:

> I am seeing
>
> Parsing recipes...ERROR: ParseError at
>
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-devtools/android-tools/
> android-tools_10.0.0.r36.bb:77:
> Could not inherit file classes/clang.bbclass
>
> this seems to depend on meta-clang, so perhaps it should either use
> dynamic-layers or add it to meta-clang itself.
>
> On Wed, May 26, 2021 at 12:59 PM Nisha Parrakat <nishaparrakat@gmail.com>
> wrote:
> >
> > upgrade of android-tools to 10.0.0.r36
> >
> > Delete all the old patches that were applicable for
> > old version.
> >
> > Use all the makefiles that come with the new version
> > directly from the source code, just modifying them
> > to install output to a specific folder
> >
> > a)added rules_yocto.mk that will mimic the debian/rules
> > b)modified the makefiles of the components to output to
> > a common dir.
> > c)
> > Built boringssl crypto with the option -DOPENSSL_NO_ASM
> > to solve the below errors
> >
> >  libcrypto.so.0: undefined reference to `aes_hw_encrypt'
> >  libcrypto.so.0: undefined reference to `aes_hw_set_encrypt_key'
> >  libcrypto.so.0: undefined reference to `gcm_gmult_v8'
> >  libcrypto.so.0: undefined reference to `gcm_init_v8'
> >  libcrypto.so.0: undefined reference to `sha256_block_data_order'
> >  libcrypto.so.0: undefined reference to `aes_hw_ctr32_encrypt_blocks'
> >  libcrypto.so.0: undefined reference to `aes_hw_cbc_encrypt'
> >  libcrypto.so.0: undefined reference to `vpaes_decrypt'
> >  libcrypto.so.0: undefined reference to `vpaes_encrypt'
> >  libcrypto.so.0: undefined reference to `gcm_gmult_neon'
> >  libcrypto.so.0: undefined reference to `sha1_block_data_order'
> >  libcrypto.so.0: undefined reference to `sha512_block_data_order'
> >  libcrypto.so.0: undefined reference to `gcm_init_neon'
> >  libcrypto.so.0: undefined reference to `aes_hw_set_decrypt_key'
> >  libcrypto.so.0: undefined reference to `vpaes_set_decrypt_key'
> >  libcrypto.so.0: undefined reference to `gcm_ghash_neon'
> >  libcrypto.so.0: undefined reference to `bn_mul_mont'
> >  libcrypto.so.0: undefined reference to `aes_hw_decrypt'
> >  libcrypto.so.0: undefined reference to `gcm_ghash_v8'
> >  libcrypto.so.0: undefined reference to `vpaes_cbc_encrypt'
> >  libcrypto.so.0: undefined reference to `ChaCha20_ctr32'
> >  libcrypto.so.0: undefined reference to `vpaes_ctr32_encrypt_blocks'
> >  libcrypto.so.0: undefined reference to `vpaes_set_encrypt_key'
> >
> >  Attention : https://github.com/grpc/grpc/issues/9440
> >
> > d) compiled android compatible version of libunwind to be used
> > to build libbacktrace
> > e) REQUIRES meta-selinux for libselinux
> > f) checked compilation and packaging for for x86_64 and aarch64
> > g) UNTESTED android-tools-adbd.service , couldn't find how to build adb=
d
> > that is needed by the service with the new version of android-tools. At
> > present the service is still packaged but may not work.
> > h) tested the adb and fastboot on the core-image-minimal by including
> > the android-tools in the image and ran the commands with 'help'
> >
> > Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> > ---
> >  .../android-tools/android-tools/adb.mk        |  72 ----
> >  .../android-tools/adb_mk_change_out_dir.patch |  50 +++
> >  .../android-tools/android-tools/adbd.mk       | 164 --------
> >  ...scv-Add-risc-v-Android-config-header.patch | 359 ------------------
> >  .../0001-adb-remove-selinux-extensions.patch  |  44 ---
> >  ...-Use-local-sockets-where-appropriate.patch |  70 ----
> >  .../core/0003-adb-define-shell-command.patch  |  29 --
> >  ...-adb-Fix-build-on-big-endian-systems.patch |  45 ---
> >  .../0005-adb-add-base64-implementation.patch  | 348 -----------------
> >  .../core/0006-adb-Musl-fixes.patch            | 131 -------
> >  ...sb_linux.c-fix-build-with-glibc-2.28.patch |  24 --
> >  ...008-adb-Allow-adbd-to-be-ran-as-root.patch |  21 -
> >  ...Add-dt-parameter-to-specify-DT-image.patch | 110 ------
> >  ...ux-capability.h-on-linux-systems-too.patch |  23 --
> >  .../0011-Remove-bionic-specific-calls.patch   |  64 ----
> >  ...laration-of-stlcat-strlcopy-function.patch |  50 ---
> >  .../core/0013-adb-Support-riscv64.patch       | 189 ---------
> >  .../android-tools/core/adb_libssl_11.diff     |  39 --
> >  .../android-tools/android-tools/ext4_utils.mk | 103 -----
> >  ...ext4_utils-remove-selinux-extensions.patch |  39 --
> >  ...add-o-argument-to-preserve-ownership.patch |  78 ----
> >  .../android-tools/android-tools/fastboot.mk   |  89 -----
> >  .../fastboot_compile_remove_gtest.patch       |  51 +++
> >  .../fastboot_mk_change_out_dir.patch          |  52 +++
> >  .../android-tools/android-tools/gitignore     |  59 ---
> >  .../img2simg_change_out_dir.patch             |  41 ++
> >  .../libadb_mk_change_out_dir.patch            |  44 +++
> >  .../libbacktrace_mk_change_out_dir.patch      |  60 +++
> >  .../libbase_mk_change_out_dir.patch           |  33 ++
> >  .../libcrypto_mk_change_out_dir.patch         |  30 ++
> >  .../libcrypto_utils_mk_change_out_dir.patch   |  38 ++
> >  .../libcutils_mk_change_out_dir.patch         |  27 ++
> >  .../libext4_utils_mk_change_out_dir.patch     |  42 ++
> >  .../libfec_mk_change_out_dir.patch            |  35 ++
> >  .../liblog_mk_change_out_dir.patch            |  42 ++
> >  .../0001-Remove-bionic-specific-calls.patch   |  25 --
> >  ...t-define-gettid-if-glibc-2.30-is-use.patch |  49 ---
> >  .../libsparse_mk_change_out_dir.patch         |  47 +++
> >  .../libunwind_mk_change_out_dir.patch         |  47 +++
> >  .../libziparchive_mk_change_out_dir.patch     |  47 +++
> >  .../android-tools/android-tools/mkbootimg.mk  |  29 --
> >  .../android-tools/rules_yocto.mk              |   4 +
> >  .../simg2img_change_out_dir.patch             |  41 ++
> >  ...me_space_std_to_compile_libbacktrace.patch |  19 +
> >  .../android-tools/android-tools_10.0.0.r36.bb | 204 ++++++++++
> >  .../android-tools/android-tools_5.1.1.r37.bb  | 182 ---------
> >  46 files changed, 954 insertions(+), 2435 deletions(-)
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tool=
s/
> adb.mk
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_di=
r.patch
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tool=
s/
> adbd.mk
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add=
-risc-v-Android-config-header.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove=
-selinux-extensions.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-lo=
cal-sockets-where-appropriate.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define=
-shell-command.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-bu=
ild-on-big-endian-systems.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-ba=
se64-implementation.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-f=
ixes.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_li=
nux.c-fix-build-with-glibc-2.28.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-=
adbd-to-be-ran-as-root.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-=
Add-dt-parameter-to-specify-DT-image.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-=
capability.h-on-linux-systems-too.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bio=
nic-specific-calls.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implic=
it-declaration-of-stlcat-strlcopy-function.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Suppor=
t-riscv64.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.d=
iff
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tool=
s/
> ext4_utils.mk
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_uti=
ls-remove-selinux-extensions.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_uti=
ls-add-o-argument-to-preserve-ownership.patch
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tool=
s/
> fastboot.mk
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_rem=
ove_gtest.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change_o=
ut_dir.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/gitignore
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_out_=
dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_out=
_dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_chan=
ge_out_dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_ou=
t_dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_change_=
out_dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk_c=
hange_out_dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_change_=
out_dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_cha=
nge_out_dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_out=
_dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_out=
_dir.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remo=
ve-bionic-specific-calls.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libs=
elinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_change_=
out_dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_change_=
out_dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_cha=
nge_out_dir.patch
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tool=
s/
> mkbootimg.mk
> >  create mode 100644 meta-oe/recipes-devtools/android-tools/android-tool=
s/
> rules_yocto.mk
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_out_=
dir.patch
> >  create mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std_t=
o_compile_libbacktrace.patch
> >  create mode 100644 meta-oe/recipes-devtools/android-tools/
> android-tools_10.0.0.r36.bb
> >  delete mode 100644 meta-oe/recipes-devtools/android-tools/
> android-tools_5.1.1.r37.bb
> >
> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/adb.m=
k
> b/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
> > deleted file mode 100644
> > index 0687c22c1..000000000
> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
> > +++ /dev/null
> > @@ -1,72 +0,0 @@
> > -# Makefile for adb
> > -
> > -SRCDIR ?=3D $(S)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/adb
> > -adb_SRC_FILES +=3D adb.c
> > -adb_SRC_FILES +=3D console.c
> > -adb_SRC_FILES +=3D transport.c
> > -adb_SRC_FILES +=3D transport_local.c
> > -adb_SRC_FILES +=3D transport_usb.c
> > -adb_SRC_FILES +=3D commandline.c
> > -adb_SRC_FILES +=3D adb_client.c
> > -adb_SRC_FILES +=3D adb_auth_host.c
> > -adb_SRC_FILES +=3D sockets.c
> > -adb_SRC_FILES +=3D services.c
> > -adb_SRC_FILES +=3D file_sync_client.c
> > -adb_SRC_FILES +=3D get_my_path_linux.c
> > -adb_SRC_FILES +=3D usb_linux.c
> > -adb_SRC_FILES +=3D usb_vendors.c
> > -adb_SRC_FILES +=3D fdevent.c
> > -adb_OBJS :=3D $(adb_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/libcutils
> > -libcutils_SRC_FILES +=3D atomic.c
> > -libcutils_SRC_FILES +=3D hashmap.c
> > -libcutils_SRC_FILES +=3D native_handle.c
> > -libcutils_SRC_FILES +=3D config_utils.c
> > -libcutils_SRC_FILES +=3D cpu_info.c
> > -libcutils_SRC_FILES +=3D load_file.c
> > -# libcutils_SRC_FILES +=3D open_memstream.c
> > -# libcutils_SRC_FILES +=3D strdup16to8.c
> > -# libcutils_SRC_FILES +=3D strdup8to16.c
> > -# libcutils_SRC_FILES +=3D record_stream.c
> > -# libcutils_SRC_FILES +=3D process_name.c
> > -# libcutils_SRC_FILES +=3D threads.c
> > -# libcutils_SRC_FILES +=3D sched_policy.c
> > -# libcutils_SRC_FILES +=3D iosched_policy.c
> > -libcutils_SRC_FILES +=3D str_parms.c
> > -libcutils_SRC_FILES +=3D fs.c
> > -libcutils_SRC_FILES +=3D multiuser.c
> > -libcutils_SRC_FILES +=3D socket_inaddr_any_server.c
> > -libcutils_SRC_FILES +=3D socket_local_client.c
> > -libcutils_SRC_FILES +=3D socket_local_server.c
> > -libcutils_SRC_FILES +=3D socket_loopback_client.c
> > -libcutils_SRC_FILES +=3D socket_loopback_server.c
> > -libcutils_SRC_FILES +=3D socket_network_client.c
> > -libcutils_SRC_FILES +=3D sockets.c
> > -libcutils_SRC_FILES +=3D ashmem-host.c
> > -libcutils_SRC_FILES +=3D dlmalloc_stubs.c
> > -libcutils_OBJS :=3D $(libcutils_SRC_FILES:.c=3D.o)
> > -
> > -CFLAGS +=3D -DANDROID
> > -CFLAGS +=3D -DWORKAROUND_BUG6558362
> > -CFLAGS +=3D -DADB_HOST=3D1
> > -CFLAGS +=3D -D_XOPEN_SOURCE -D_GNU_SOURCE
> > -CFLAGS +=3D -DANDROID_SMP=3D0
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/adb
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/include
> > -CFLAGS +=3D -include
> $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> > -
> > -LIBS +=3D libcutils.a -lpthread -lcrypto
> > -
> > -all: adb
> > -
> > -adb: libcutils.a $(adb_OBJS)
> > -       $(CC) -o $@ $(LDFLAGS) $(adb_OBJS) $(LIBS)
> > -
> > -libcutils.a: $(libcutils_OBJS)
> > -       $(AR) rcs $@ $(libcutils_OBJS)
> > -
> > -clean:
> > -       $(RM) $(adb_OBJS) $(libcutils_OBJS) adb *.a
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_=
dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_=
dir.patch
> > new file mode 100644
> > index 000000000..8c07e133a
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_change_out_=
dir.patch
> > @@ -0,0 +1,50 @@
> > +patching adb.mk to build in yocto environment.
> > +
> > +Changes include:
> > +Introduced an output folder which will keep all the outputs from the
> > +android-tools.
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary to the OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +Upstream-Status: Pending
> > +--- git/system/core/debian/adb.mk      2021-04-29 21:11:00.617892503
> +0200
> > ++++ git/system/core/debian/adb.mk      2021-04-29 21:17:33.256016600
> +0200
> > +@@ -1,3 +1,4 @@
> > ++include ../../rules_yocto.mk
> > + NAME =3D adb
> > +
> > + SOURCES =3D client/adb_client.cpp \
> > +@@ -12,10 +13,10 @@
> > +
> > + SOURCES :=3D $(foreach source, $(SOURCES), adb/$(source))
> > + CXXFLAGS +=3D -std=3Dgnu++2a
> > +-CPPFLAGS +=3D -Iinclude -Iadb -Ibase/include \
> > ++CPPFLAGS +=3D -Iinclude -Iadb -Ibase/include  -I$(OUT_DIR)/usr/includ=
e/ \
> > +             -DADB_VERSION=3D'"$(DEB_VERSION)"' -DADB_HOST=3D1 -D_GNU_=
SOURCE
> > +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -Wl,-rpath-link=3D. \
> > +-           -lpthread -L. -ladb -lbase
> > ++LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -Wl,-rpath-link=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
> > ++           -lpthread
> -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ -ladb -lbase
> > +
> > + # -latomic should be the last library specified
> > + # https://github.com/android/ndk/issues/589
> > +@@ -24,7 +25,8 @@
> > + endif
> > +
> > + build: $(SOURCES)
> > +-      $(CXX) $^ -o adb/$(NAME) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
> > ++      mkdir --parents
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/adb
> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/adb/$(NAME) $(CXXFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> > +
> > + clean:
> > +-      $(RM) adb/$(NAME)
> > ++      $(RM)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/adb/$(NAME)
> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/
> adbd.mk b/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
> > deleted file mode 100644
> > index 31452ae10..000000000
> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
> > +++ /dev/null
> > @@ -1,164 +0,0 @@
> > -# Makefile for adbd
> > -
> > -SRCDIR ?=3D $(S)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/adb
> > -adbd_SRC_FILES +=3D adb.c
> > -adbd_SRC_FILES +=3D fdevent.c
> > -adbd_SRC_FILES +=3D transport.c
> > -adbd_SRC_FILES +=3D transport_local.c
> > -adbd_SRC_FILES +=3D transport_usb.c
> > -adbd_SRC_FILES +=3D adb_auth_client.c
> > -adbd_SRC_FILES +=3D sockets.c
> > -adbd_SRC_FILES +=3D services.c
> > -adbd_SRC_FILES +=3D file_sync_service.c
> > -adbd_SRC_FILES +=3D jdwp_service.c
> > -adbd_SRC_FILES +=3D framebuffer_service.c
> > -adbd_SRC_FILES +=3D remount_service.c
> > -adbd_SRC_FILES +=3D disable_verity_service.c
> > -adbd_SRC_FILES +=3D base64.c
> > -adbd_SRC_FILES +=3D usb_linux_client.c
> > -adbd_OBJS :=3D $(adbd_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/liblog
> > -liblog_SRC_FILES +=3D logd_write.c
> > -liblog_SRC_FILES +=3D log_event_write.c
> > -liblog_SRC_FILES +=3D logprint.c
> > -liblog_SRC_FILES +=3D event_tag_map.c
> > -liblog_SRC_FILES +=3D fake_log_device.c
> > -liblog_OBJS :=3D $(liblog_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/fs_mgr
> > -fs_mgr_SRC_FILES +=3D fs_mgr_fstab.c
> > -fs_mgr_OBJS :=3D $(fs_mgr_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/libcutils
> > -libcutils_SRC_FILES +=3D atomic.c
> > -libcutils_SRC_FILES +=3D hashmap.c
> > -libcutils_SRC_FILES +=3D native_handle.c
> > -libcutils_SRC_FILES +=3D config_utils.c
> > -libcutils_SRC_FILES +=3D cpu_info.c
> > -libcutils_SRC_FILES +=3D load_file.c
> > -# libcutils_SRC_FILES +=3D open_memstream.c
> > -# libcutils_SRC_FILES +=3D strdup16to8.c
> > -# libcutils_SRC_FILES +=3D strdup8to16.c
> > -# libcutils_SRC_FILES +=3D record_stream.c
> > -# libcutils_SRC_FILES +=3D process_name.c
> > -# libcutils_SRC_FILES +=3D threads.c
> > -# libcutils_SRC_FILES +=3D sched_policy.c
> > -# libcutils_SRC_FILES +=3D iosched_policy.c
> > -libcutils_SRC_FILES +=3D str_parms.c
> > -libcutils_SRC_FILES +=3D fs.c
> > -libcutils_SRC_FILES +=3D multiuser.c
> > -libcutils_SRC_FILES +=3D socket_inaddr_any_server.c
> > -libcutils_SRC_FILES +=3D socket_local_client.c
> > -libcutils_SRC_FILES +=3D socket_local_server.c
> > -libcutils_SRC_FILES +=3D socket_loopback_client.c
> > -libcutils_SRC_FILES +=3D socket_loopback_server.c
> > -libcutils_SRC_FILES +=3D socket_network_client.c
> > -libcutils_SRC_FILES +=3D sockets.c
> > -libcutils_SRC_FILES +=3D ashmem-host.c
> > -libcutils_SRC_FILES +=3D dlmalloc_stubs.c
> > -libcutils_SRC_FILES +=3D klog.c
> > -libcutils_SRC_FILES +=3D properties.c
> > -libcutils_OBJS :=3D $(libcutils_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/external/libselinux/src
> > -libselinux_SRC_FILES +=3D booleans.c
> > -libselinux_SRC_FILES +=3D canonicalize_context.c
> > -libselinux_SRC_FILES +=3D disable.c
> > -libselinux_SRC_FILES +=3D enabled.c
> > -libselinux_SRC_FILES +=3D fgetfilecon.c
> > -libselinux_SRC_FILES +=3D fsetfilecon.c
> > -libselinux_SRC_FILES +=3D getenforce.c
> > -libselinux_SRC_FILES +=3D getfilecon.c
> > -libselinux_SRC_FILES +=3D getpeercon.c
> > -libselinux_SRC_FILES +=3D lgetfilecon.c
> > -libselinux_SRC_FILES +=3D load_policy.c
> > -libselinux_SRC_FILES +=3D lsetfilecon.c
> > -libselinux_SRC_FILES +=3D policyvers.c
> > -libselinux_SRC_FILES +=3D procattr.c
> > -libselinux_SRC_FILES +=3D setenforce.c
> > -libselinux_SRC_FILES +=3D setfilecon.c
> > -libselinux_SRC_FILES +=3D context.c
> > -libselinux_SRC_FILES +=3D mapping.c
> > -libselinux_SRC_FILES +=3D stringrep.c
> > -libselinux_SRC_FILES +=3D compute_create.c
> > -libselinux_SRC_FILES +=3D compute_av.c
> > -libselinux_SRC_FILES +=3D avc.c
> > -libselinux_SRC_FILES +=3D avc_internal.c
> > -libselinux_SRC_FILES +=3D avc_sidtab.c
> > -libselinux_SRC_FILES +=3D get_initial_context.c
> > -libselinux_SRC_FILES +=3D checkAccess.c
> > -libselinux_SRC_FILES +=3D sestatus.c
> > -libselinux_SRC_FILES +=3D deny_unknown.c
> > -
> > -libselinux_SRC_FILES +=3D callbacks.c
> > -libselinux_SRC_FILES +=3D check_context.c
> > -libselinux_SRC_FILES +=3D freecon.c
> > -libselinux_SRC_FILES +=3D init.c
> > -libselinux_SRC_FILES +=3D label.c
> > -libselinux_SRC_FILES +=3D label_file.c
> > -libselinux_SRC_FILES +=3D label_android_property.c
> > -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils
> > -libext4_utils_SRC_FILES +=3D make_ext4fs.c
> > -libext4_utils_SRC_FILES +=3D ext4fixup.c
> > -libext4_utils_SRC_FILES +=3D ext4_utils.c
> > -libext4_utils_SRC_FILES +=3D allocate.c
> > -libext4_utils_SRC_FILES +=3D contents.c
> > -libext4_utils_SRC_FILES +=3D extent.c
> > -libext4_utils_SRC_FILES +=3D indirect.c
> > -libext4_utils_SRC_FILES +=3D uuid.c
> > -libext4_utils_SRC_FILES +=3D sha1.c
> > -libext4_utils_SRC_FILES +=3D wipe.c
> > -libext4_utils_SRC_FILES +=3D crc16.c
> > -libext4_utils_SRC_FILES +=3D ext4_sb.c
> > -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)
> > -
> > -CFLAGS +=3D -std=3Dgnu11
> > -CFLAGS +=3D -DANDROID
> > -CFLAGS +=3D -DADB_HOST=3D0
> > -CFLAGS +=3D -D_XOPEN_SOURCE -D_GNU_SOURCE
> > -CFLAGS +=3D -DALLOW_ADBD_ROOT=3D1
> > -CFLAGS +=3D -DALLOW_ADBD_DISABLE_VERITY=3D1
> > -CFLAGS +=3D -DPROP_NAME_MAX=3D32
> > -CFLAGS +=3D -DPROP_VALUE_MAX=3D92
> > -CFLAGS +=3D -DAUDITD_LOG_TAG=3D1003
> > -# CFLAGS +=3D -DHOST
> > -CFLAGS +=3D -DANDROID_SMP=3D0
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/adb
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/include
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include
> > -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/fs_mgr/include
> > -CFLAGS +=3D -I$(SRCDIR)/hardware/libhardware/include
> > -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include
> > -CFLAGS +=3D -include
> $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> > -
> > -LIBS +=3D liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.=
a
> -lpthread -lbsd -lpcre -lresolv -lcrypto
> > -
> > -all: adbd
> > -
> > -adbd: liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a
> $(adbd_OBJS)
> > -       $(CC) -o $@ $(LDFLAGS) $(adbd_OBJS) $(LIBS)
> > -
> > -liblog.a: $(liblog_OBJS)
> > -       $(AR) rcs $@ $(liblog_OBJS)
> > -
> > -libfs_mgr.a: $(fs_mgr_OBJS)
> > -       $(AR) rcs $@ $(fs_mgr_OBJS)
> > -
> > -libcutils.a: $(libcutils_OBJS)
> > -       $(AR) rcs $@ $(libcutils_OBJS)
> > -
> > -libselinux.a: $(libselinux_OBJS)
> > -       export CFLAGS=3D"-DANDROID -DHOST"
> > -       $(AR) rcs $@ $(libselinux_OBJS)
> > -
> > -libext4_utils.a: $(libext4_utils_OBJS)
> > -       $(AR) rcs $@ $(libext4_utils_OBJS)
> > -
> > -clean:
> > -       $(RM) *.o *.a adbd
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-A=
dd-risc-v-Android-config-header.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-A=
dd-risc-v-Android-config-header.patch
> > deleted file mode 100644
> > index 57c443b70..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-A=
dd-risc-v-Android-config-header.patch
> > +++ /dev/null
> > @@ -1,359 +0,0 @@
> > -From 82dce13ea7b5b31c63851bd67f66072413917e73 Mon Sep 17 00:00:00 2001
> > -From: Chenxi Mao <maochenxi@eswin.com>
> > -Date: Mon, 20 Apr 2020 15:32:40 +0800
> > -Subject: [PATCH 1/1] Riscv: Add risc-v Android config header
> > -
> > ----
> > - .../arch/linux-riscv64/AndroidConfig.h        | 340 +++++++++++++++++=
+
> > - 1 file changed, 340 insertions(+)
> > - create mode 100644
> core/combo/include/arch/linux-riscv64/AndroidConfig.h
> > -
> > -diff --git a/core/combo/include/arch/linux-riscv64/AndroidConfig.h
> b/core/combo/include/arch/linux-riscv64/AndroidConfig.h
> > -new file mode 100644
> > -index 0000000000..bcbda8f87f
> > ---- /dev/null
> > -+++ b/core/combo/include/arch/linux-riscv64/AndroidConfig.h
> > -@@ -0,0 +1,340 @@
> > -+/*
> > -+ * Copyright (C) 2013 The Android Open Source Project
> > -+ *
> > -+ * Licensed under the Apache License, Version 2.0 (the "License");
> > -+ * you may not use this file except in compliance with the License.
> > -+ * You may obtain a copy of the License at
> > -+ *
> > -+ *      http://www.apache.org/licenses/LICENSE-2.0
> > -+ *
> > -+ * Unless required by applicable law or agreed to in writing, softwar=
e
> > -+ * distributed under the License is distributed on an "AS IS" BASIS,
> > -+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
> implied.
> > -+ * See the License for the specific language governing permissions an=
d
> > -+ * limitations under the License.
> > -+ */
> > -+
> > -+/*
> > -+ * Android config -- "android-aarch64".  Used for ARM aarch64 device
> builds.
> > -+ */
> > -+#ifndef _ANDROID_CONFIG_H
> > -+#define _ANDROID_CONFIG_H
> > -+
> > -+/*
> > -+ *
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > -+ *                              !!! IMPORTANT !!!
> > -+ *
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > -+ *
> > -+ * This file is included by ALL C/C++ source files.  Don't put
> anything in
> > -+ * here unless you are absolutely certain it can't go anywhere else.
> > -+ *
> > -+ * Any C++ stuff must be wrapped with "#ifdef __cplusplus".  Do not
> use "//"
> > -+ * comments.
> > -+ */
> > -+
> > -+/*
> > -+ * Threading model.  Choose one:
> > -+ *
> > -+ * HAVE_PTHREADS - use the pthreads library.
> > -+ * HAVE_WIN32_THREADS - use Win32 thread primitives.
> > -+ *  -- combine HAVE_CREATETHREAD, HAVE_CREATEMUTEX, and
> HAVE__BEGINTHREADEX
> > -+ */
> > -+#define HAVE_PTHREADS
> > -+
> > -+/*
> > -+ * Do we have pthread_setname_np()?
> > -+ *
> > -+ * (HAVE_PTHREAD_SETNAME_NP is used by WebKit to enable a function wi=
th
> > -+ * the same name but different parameters, so we can't use that here.=
)
> > -+ */
> > -+#define HAVE_ANDROID_PTHREAD_SETNAME_NP
> > -+
> > -+/*
> > -+ * Do we have the futex syscall?
> > -+ */
> > -+#define HAVE_FUTEX
> > -+
> > -+/*
> > -+ * Process creation model.  Choose one:
> > -+ *
> > -+ * HAVE_FORKEXEC - use fork() and exec()
> > -+ * HAVE_WIN32_PROC - use CreateProcess()
> > -+ */
> > -+#define HAVE_FORKEXEC
> > -+
> > -+/*
> > -+ * Process out-of-memory adjustment.  Set if running on Linux,
> > -+ * where we can write to /proc/<pid>/oom_adj to modify the
> out-of-memory
> > -+ * badness adjustment.
> > -+ */
> > -+#define HAVE_OOM_ADJ
> > -+
> > -+/*
> > -+ * IPC model.  Choose one:
> > -+ *
> > -+ * HAVE_SYSV_IPC - use the classic SysV IPC mechanisms (semget,
> shmget).
> > -+ * HAVE_MACOSX_IPC - use Macintosh IPC mechanisms (sem_open, mmap).
> > -+ * HAVE_WIN32_IPC - use Win32 IPC (CreateSemaphore, CreateFileMapping=
).
> > -+ * HAVE_ANDROID_IPC - use Android versions (?, mmap).
> > -+ */
> > -+#define HAVE_ANDROID_IPC
> > -+
> > -+/*
> > -+ * Memory-mapping model. Choose one:
> > -+ *
> > -+ * HAVE_POSIX_FILEMAP - use the Posix sys/mmap.h
> > -+ * HAVE_WIN32_FILEMAP - use Win32 filemaps
> > -+ */
> > -+#define  HAVE_POSIX_FILEMAP
> > -+
> > -+/*
> > -+ * Define this if you have <termio.h>
> > -+ */
> > -+#define  HAVE_TERMIO_H 1
> > -+
> > -+/*
> > -+ * Define this if you have <sys/sendfile.h>
> > -+ */
> > -+#define  HAVE_SYS_SENDFILE_H 1
> > -+
> > -+/*
> > -+ * Define this if you build against MSVCRT.DLL
> > -+ */
> > -+/* #define HAVE_MS_C_RUNTIME */
> > -+
> > -+/*
> > -+ * Define this if you have sys/uio.h
> > -+ */
> > -+#define  HAVE_SYS_UIO_H 1
> > -+
> > -+/*
> > -+ * Define this if your platforms implements symbolic links
> > -+ * in its filesystems
> > -+ */
> > -+#define HAVE_SYMLINKS
> > -+
> > -+/*
> > -+ * Define this if we have localtime_r().
> > -+ */
> > -+/* #define HAVE_LOCALTIME_R 1 */
> > -+
> > -+/*
> > -+ * Define this if we have gethostbyname_r().
> > -+ */
> > -+/* #define HAVE_GETHOSTBYNAME_R */
> > -+
> > -+/*
> > -+ * Define this if we have ioctl().
> > -+ */
> > -+#define HAVE_IOCTL
> > -+
> > -+/*
> > -+ * Define this if we want to use WinSock.
> > -+ */
> > -+/* #define HAVE_WINSOCK */
> > -+
> > -+/*
> > -+ * Define this if have clock_gettime() and friends
> > -+ */
> > -+#define HAVE_POSIX_CLOCKS
> > -+
> > -+/*
> > -+ * Define this if we have linux style epoll()
> > -+ */
> > -+#define HAVE_EPOLL
> > -+
> > -+/*
> > -+ * Endianness of the target machine.  Choose one:
> > -+ *
> > -+ * HAVE_ENDIAN_H -- have endian.h header we can include.
> > -+ * HAVE_LITTLE_ENDIAN -- we are little endian.
> > -+ * HAVE_BIG_ENDIAN -- we are big endian.
> > -+ */
> > -+#define HAVE_ENDIAN_H
> > -+#define HAVE_LITTLE_ENDIAN
> > -+
> > -+#define _FILE_OFFSET_BITS 64
> > -+/* #define _LARGEFILE_SOURCE 1 */
> > -+
> > -+/*
> > -+ * Define if platform has off64_t (and lseek64 and other xxx64
> functions)
> > -+ */
> > -+#define HAVE_OFF64_T
> > -+
> > -+/*
> > -+ * Defined if we have the backtrace() call for retrieving a stack
> trace.
> > -+ * Needed for CallStack to operate; if not defined, CallStack is
> > -+ * non-functional.
> > -+ */
> > -+#define HAVE_BACKTRACE 0
> > -+
> > -+/*
> > -+ * Defined if we have the cxxabi.h header for demangling C++ symbols.
> If
> > -+ * not defined, stack crawls will be displayed with raw mangled symbo=
ls
> > -+ */
> > -+#define HAVE_CXXABI 0
> > -+
> > -+/*
> > -+ * Defined if we have the gettid() system call.
> > -+ */
> > -+#define HAVE_GETTID
> > -+
> > -+/*
> > -+ * Defined if we have the sched_setscheduler() call
> > -+ */
> > -+#define HAVE_SCHED_SETSCHEDULER
> > -+
> > -+/*
> > -+ * Add any extra platform-specific defines here.
> > -+ */
> > -+#ifndef __linux__
> > -+#define __linux__
> > -+#endif
> > -+
> > -+/*
> > -+ * Define if we have <malloc.h> header
> > -+ */
> > -+#define HAVE_MALLOC_H
> > -+
> > -+/*
> > -+ * Define if we're running on *our* linux on device or emulator.
> > -+ */
> > -+#define HAVE_ANDROID_OS 1
> > -+
> > -+/*
> > -+ * Define if we have Linux-style non-filesystem Unix Domain Sockets
> > -+ */
> > -+#define HAVE_LINUX_LOCAL_SOCKET_NAMESPACE 1
> > -+
> > -+/*
> > -+ * Define if we have Linux's inotify in <sys/inotify.h>.
> > -+ */
> > -+#define HAVE_INOTIFY 1
> > -+
> > -+/*
> > -+ * Define if we have madvise() in <sys/mman.h>
> > -+ */
> > -+#define HAVE_MADVISE 1
> > -+
> > -+/*
> > -+ * Define if tm struct has tm_gmtoff field
> > -+ */
> > -+#define HAVE_TM_GMTOFF 1
> > -+
> > -+/*
> > -+ * Define if dirent struct has d_type field
> > -+ */
> > -+#define HAVE_DIRENT_D_TYPE 1
> > -+
> > -+/*
> > -+ * Define if libc includes Android system properties implementation.
> > -+ */
> > -+#define HAVE_LIBC_SYSTEM_PROPERTIES 1
> > -+
> > -+/*
> > -+ * Define if system provides a system property server (should be
> > -+ * mutually exclusive with HAVE_LIBC_SYSTEM_PROPERTIES).
> > -+ */
> > -+/* #define HAVE_SYSTEM_PROPERTY_SERVER */
> > -+
> > -+/*
> > -+ * What CPU architecture does this platform use?
> > -+ */
> > -+#define ARCH_AARCH64
> > -+
> > -+/*
> > -+ * Define if the size of enums is as short as possible,
> > -+ */
> > -+/* #define HAVE_SHORT_ENUMS */
> > -+
> > -+/*
> > -+ * sprintf() format string for shared library naming.
> > -+ */
> > -+#define OS_SHARED_LIB_FORMAT_STR    "lib%s.so"
> > -+
> > -+/*
> > -+ * type for the third argument to mincore().
> > -+ */
> > -+#define MINCORE_POINTER_TYPE unsigned char *
> > -+
> > -+/*
> > -+ * The default path separator for the platform
> > -+ */
> > -+#define OS_PATH_SEPARATOR '/'
> > -+
> > -+/*
> > -+ * Is the filesystem case sensitive?
> > -+ */
> > -+#define OS_CASE_SENSITIVE
> > -+
> > -+/*
> > -+ * Define if <sys/socket.h> exists.
> > -+ */
> > -+#define HAVE_SYS_SOCKET_H 1
> > -+
> > -+/*
> > -+ * Define if the strlcpy() function exists on the system.
> > -+ */
> > -+#define HAVE_STRLCPY 1
> > -+
> > -+/*
> > -+ * Define if the open_memstream() function exists on the system.
> > -+ */
> > -+/* #define HAVE_OPEN_MEMSTREAM 1 */
> > -+
> > -+/*
> > -+ * Define if the BSD funopen() function exists on the system.
> > -+ */
> > -+#define HAVE_FUNOPEN 1
> > -+
> > -+/*
> > -+ * Define if prctl() exists
> > -+ */
> > -+#define HAVE_PRCTL 1
> > -+
> > -+/*
> > -+ * Define if writev() exists
> > -+ */
> > -+#define HAVE_WRITEV 1
> > -+
> > -+/*
> > -+ * Define if <stdint.h> exists.
> > -+ */
> > -+#define HAVE_STDINT_H 1
> > -+
> > -+/*
> > -+ * Define if <stdbool.h> exists.
> > -+ */
> > -+#define HAVE_STDBOOL_H 1
> > -+
> > -+/*
> > -+ * Define if <sched.h> exists.
> > -+ */
> > -+#define HAVE_SCHED_H 1
> > -+
> > -+/*
> > -+ * Define if pread() exists
> > -+ */
> > -+#define HAVE_PREAD 1
> > -+
> > -+/*
> > -+ * Define if we have st_mtim in struct stat
> > -+ */
> > -+#define HAVE_STAT_ST_MTIM 1
> > -+
> > -+/*
> > -+ * Define if printf() supports %zd for size_t arguments
> > -+ */
> > -+#define HAVE_PRINTF_ZD 1
> > -+
> > -+/*
> > -+ * Define to 1 if <stdlib.h> provides qsort_r() with a BSD style
> function prototype.
> > -+ */
> > -+#define HAVE_BSD_QSORT_R 0
> > -+
> > -+/*
> > -+ * Define to 1 if <stdlib.h> provides qsort_r() with a GNU style
> function prototype.
> > -+ */
> > -+#define HAVE_GNU_QSORT_R 0
> > -+
> > -+#endif /* _ANDROID_CONFIG_H */
> > ---
> > -2.17.1
> > -
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remo=
ve-selinux-extensions.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remo=
ve-selinux-extensions.patch
> > deleted file mode 100644
> > index 7d20c5068..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remo=
ve-selinux-extensions.patch
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -From 7b7200727413ca4a9bb132221c543ec033dffafa Mon Sep 17 00:00:00 2001
> > -From: Sergio Schvezov <sergio.schvezov@canonical.com>
> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> > -Subject: [PATCH] adb: remove selinux extensions
> > -
> > -* drop useless includes of Android SELINUX extensions
> > -* avoids having to clone another module
> > -* this should be sent upstream
> > -
> > -Upstream-Status: Inappropriate
> > -
> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ----
> > - adb/file_sync_service.c | 3 ---
> > - 1 file changed, 3 deletions(-)
> > -
> > -diff --git a/adb/file_sync_service.c b/adb/file_sync_service.c
> > -index 7933858516..3cbd0cd863 100644
> > ---- a/adb/file_sync_service.c
> > -+++ b/adb/file_sync_service.c
> > -@@ -26,7 +26,6 @@
> > -
> > - #include <errno.h>
> > - #include <private/android_filesystem_config.h>
> > --#include <selinux/android.h>
> > - #include "sysdeps.h"
> > -
> > - #define TRACE_TAG  TRACE_SYNC
> > -@@ -73,7 +72,6 @@ static int mkdirs(char *name)
> > -                 *x =3D '/';
> > -                 return ret;
> > -             }
> > --            selinux_android_restorecon(name, 0);
> > -         }
> > -         *x++ =3D '/';
> > -     }
> > -@@ -251,7 +249,6 @@ static int handle_send_file(int s, char *path,
> uid_t uid,
> > -     if(fd >=3D 0) {
> > -         struct utimbuf u;
> > -         adb_close(fd);
> > --        selinux_android_restorecon(path, 0);
> > -         u.actime =3D timestamp;
> > -         u.modtime =3D timestamp;
> > -         utime(path, &u);
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-=
local-sockets-where-appropriate.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-=
local-sockets-where-appropriate.patch
> > deleted file mode 100644
> > index 3627110ad..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-=
local-sockets-where-appropriate.patch
> > +++ /dev/null
> > @@ -1,70 +0,0 @@
> > -From d855f042ca09a358cebe2d3c1d29d512afd7ebb8 Mon Sep 17 00:00:00 2001
> > -From: Hilko Bengen <bengen@debian.org>
> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> > -Subject: [PATCH] adb: Use local sockets where appropriate
> > -
> > -Upstream-Status: Inappropriate
> > ----
> > - adb/adb.c             | 6 +++++-
> > - adb/adb_client.c      | 5 +++--
> > - adb/transport_local.c | 3 ++-
> > - 3 files changed, 10 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/adb/adb.c b/adb/adb.c
> > -index 10a1e0da26..027edd9359 100644
> > ---- a/adb/adb.c
> > -+++ b/adb/adb.c
> > -@@ -1230,7 +1230,11 @@ int launch_server(int server_port)
> > -  */
> > - void build_local_name(char* target_str, size_t target_size, int
> server_port)
> > - {
> > --  snprintf(target_str, target_size, "tcp:%d", server_port);
> > -+  if (gListenAll > 0) {
> > -+    snprintf(target_str, target_size, "tcp:%d", server_port);
> > -+  } else {
> > -+    snprintf(target_str, target_size, "local:%d", server_port);
> > -+  }
> > - }
> > -
> > - #if !ADB_HOST
> > -diff --git a/adb/adb_client.c b/adb/adb_client.c
> > -index eb1720d22c..a383faefe3 100644
> > ---- a/adb/adb_client.c
> > -+++ b/adb/adb_client.c
> > -@@ -185,12 +185,12 @@ int _adb_connect(const char *service)
> > -         strcpy(__adb_error, "service name too long");
> > -         return -1;
> > -     }
> > --    snprintf(tmp, sizeof tmp, "%04x", len);
> > -+    snprintf(tmp, sizeof tmp, "%d", __adb_server_port);
> > -
> > -     if (__adb_server_name)
> > -         fd =3D socket_network_client(__adb_server_name,
> __adb_server_port, SOCK_STREAM);
> > -     else
> > --        fd =3D socket_loopback_client(__adb_server_port, SOCK_STREAM)=
;
> > -+        fd =3D socket_local_client(tmp,
> ANDROID_SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);
> > -
> > -     if(fd < 0) {
> > -         strcpy(__adb_error, "cannot connect to daemon");
> > -@@ -201,6 +201,7 @@ int _adb_connect(const char *service)
> > -         return -1;
> > -     }
> > -
> > -+    snprintf(tmp, sizeof tmp, "%04x", len);
> > -     if(writex(fd, tmp, 4) || writex(fd, service, len)) {
> > -         strcpy(__adb_error, "write failure during connection");
> > -         adb_close(fd);
> > -diff --git a/adb/transport_local.c b/adb/transport_local.c
> > -index 948cc15812..71582a8c88 100644
> > ---- a/adb/transport_local.c
> > -+++ b/adb/transport_local.c
> > -@@ -121,7 +121,8 @@ int local_connect_arbitrary_ports(int console_port=
,
> int adb_port)
> > -     }
> > - #endif
> > -     if (fd < 0) {
> > --        fd =3D socket_loopback_client(adb_port, SOCK_STREAM);
> > -+        snprintf(buf, sizeof buf, "%d", adb_port);
> > -+        fd =3D socket_local_client(buf,
> ANDROID_SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);
> > -     }
> > -
> > -     if (fd >=3D 0) {
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-defi=
ne-shell-command.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-defi=
ne-shell-command.patch
> > deleted file mode 100644
> > index cf1d9cbc3..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-defi=
ne-shell-command.patch
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -From 4421c2e19946dcd651fd8ac022b96627fc526149 Mon Sep 17 00:00:00 2001
> > -From: Fathi Boudra <fabo@debian.org>
> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> > -Subject: [PATCH] adb: define shell command
> > -
> > -we intend to run on Linux system so the shell is always /bin/sh,
> > -for the host or the target.
> > -
> > -Upstream-Status: Inappropriate
> > ----
> > - adb/services.c | 4 ----
> > - 1 file changed, 4 deletions(-)
> > -
> > -diff --git a/adb/services.c b/adb/services.c
> > -index 21b08dc201..d44b0c5068 100644
> > ---- a/adb/services.c
> > -+++ b/adb/services.c
> > -@@ -299,11 +299,7 @@ static int create_subproc_raw(const char *cmd,
> const char *arg0, const char *arg
> > - }
> > - #endif  /* !ABD_HOST */
> > -
> > --#if ADB_HOST
> > - #define SHELL_COMMAND "/bin/sh"
> > --#else
> > --#define SHELL_COMMAND "/system/bin/sh"
> > --#endif
> > -
> > - #if !ADB_HOST
> > - static void subproc_waiter_service(int fd, void *cookie)
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-=
build-on-big-endian-systems.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-=
build-on-big-endian-systems.patch
> > deleted file mode 100644
> > index 79e9d4d3b..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-=
build-on-big-endian-systems.patch
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -From 548b8ca62c64a16305929e2eaf3d546d48de9c25 Mon Sep 17 00:00:00 2001
> > -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > -Date: Tue, 21 Feb 2017 19:46:24 +0100
> > -Subject: [PATCH] adb: Fix build on big endian systems
> > -
> > -The usb_linux_client.c file defines cpu_to_le16/32 by using the C
> > -library htole16/32 function calls. However, cpu_to_le16/32 are used
> > -when initializing structures, i.e in a context where a function call
> > -is not allowed.
> > -
> > -It works fine on little endian systems because htole16/32 are defined
> > -by the C library as no-ops. But on big-endian systems, they are
> > -actually doing something, which might involve calling a function,
> > -causing build failures.
> > -
> > -To solve this, we simply open-code cpu_to_le16/32 in a way that allows
> > -them to be used when initializing structures.
> > -
> > -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ----
> > - adb/usb_linux_client.c | 11 +++++++++--
> > - 1 file changed, 9 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/adb/usb_linux_client.c b/adb/usb_linux_client.c
> > -index 8426e0ea14..6e8b5bbbd2 100644
> > ---- a/adb/usb_linux_client.c
> > -+++ b/adb/usb_linux_client.c
> > -@@ -34,8 +34,15 @@
> > - #define MAX_PACKET_SIZE_FS    64
> > - #define MAX_PACKET_SIZE_HS    512
> > -
> > --#define cpu_to_le16(x)  htole16(x)
> > --#define cpu_to_le32(x)  htole32(x)
> > -+#if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN
> > -+# define cpu_to_le16(x) (x)
> > -+# define cpu_to_le32(x) (x)
> > -+#else
> > -+# define cpu_to_le16(x) ((((x) >> 8) & 0xffu) | (((x) & 0xffu) << 8))
> > -+# define cpu_to_le32(x) \
> > -+      ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) | \
> > -+       (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))
> > -+#endif
> > -
> > - struct usb_handle
> > - {
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-=
base64-implementation.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-=
base64-implementation.patch
> > deleted file mode 100644
> > index fcd4ae238..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-=
base64-implementation.patch
> > +++ /dev/null
> > @@ -1,348 +0,0 @@
> > -From 753bcb5971401b82fb2e6197d31c9e386f6d0392 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Fri, 15 Sep 2017 15:46:38 -0700
> > -Subject: [PATCH] adb: add base64 implementation
> > -
> > -musl needs it
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - adb/adb_auth_client.c |   2 +-
> > - adb/base64.c          | 315 +++++++++++++++++++++++++++++++++++++++++=
+
> > - 2 files changed, 316 insertions(+), 1 deletion(-)
> > - create mode 100644 adb/base64.c
> > -
> > -diff --git a/adb/adb_auth_client.c b/adb/adb_auth_client.c
> > -index 55e9dcad19..104b413b8b 100644
> > ---- a/adb/adb_auth_client.c
> > -+++ b/adb/adb_auth_client.c
> > -@@ -75,7 +75,7 @@ static void read_keys(const char *file, struct
> listnode *list)
> > -         if (sep)
> > -             *sep =3D '\0';
> > -
> > --        ret =3D __b64_pton(buf, (u_char *)&key->key, sizeof(key->key)=
 +
> 4);
> > -+        ret =3D b64_pton(buf, (u_char *)&key->key, sizeof(key->key) +=
 4);
> > -         if (ret !=3D sizeof(key->key)) {
> > -             D("%s: Invalid base64 data ret=3D%d\n", file, ret);
> > -             free(key);
> > -diff --git a/adb/base64.c b/adb/base64.c
> > -new file mode 100644
> > -index 0000000000..95da284d0d
> > ---- /dev/null
> > -+++ b/adb/base64.c
> > -@@ -0,0 +1,315 @@
> > -+/*
> > -+ * Copyright (c) 1996-1999 by Internet Software Consortium.
> > -+ *
> > -+ * Permission to use, copy, modify, and distribute this software for
> any
> > -+ * purpose with or without fee is hereby granted, provided that the
> above
> > -+ * copyright notice and this permission notice appear in all copies.
> > -+ *
> > -+ * THE SOFTWARE IS PROVIDED "AS IS" AND INTERNET SOFTWARE CONSORTIUM
> DISCLAIMS
> > -+ * ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
> WARRANTIES
> > -+ * OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL INTERNET SOFTWAR=
E
> > -+ * CONSORTIUM BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
> CONSEQUENTIAL
> > -+ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA
> OR
> > -+ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> TORTIOUS
> > -+ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANC=
E
> OF THIS
> > -+ * SOFTWARE.
> > -+ */
> > -+
> > -+/*
> > -+ * Portions Copyright (c) 1995 by International Business Machines, In=
c.
> > -+ *
> > -+ * International Business Machines, Inc. (hereinafter called IBM)
> grants
> > -+ * permission under its copyrights to use, copy, modify, and
> distribute this
> > -+ * Software with or without fee, provided that the above copyright
> notice and
> > -+ * all paragraphs of this notice appear in all copies, and that the
> name of IBM
> > -+ * not be used in connection with the marketing of any product
> incorporating
> > -+ * the Software or modifications thereof, without specific, written
> prior
> > -+ * permission.
> > -+ *
> > -+ * To the extent it has a right to do so, IBM grants an immunity from
> suit
> > -+ * under its patents, if any, for the use, sale or manufacture of
> products to
> > -+ * the extent that such products are used for performing Domain Name
> System
> > -+ * dynamic updates in TCP/IP networks by means of the Software.  No
> immunity is
> > -+ * granted for any product per se or for any other function of any
> product.
> > -+ *
> > -+ * THE SOFTWARE IS PROVIDED "AS IS", AND IBM DISCLAIMS ALL WARRANTIES=
,
> > -+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FO=
R
> A
> > -+ * PARTICULAR PURPOSE.  IN NO EVENT SHALL IBM BE LIABLE FOR ANY
> SPECIAL,
> > -+ * DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> WHATSOEVER ARISING
> > -+ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
> SOFTWARE, EVEN
> > -+ * IF IBM IS APPRISED OF THE POSSIBILITY OF SUCH DAMAGES.
> > -+ */
> > -+
> > -+#if !defined(LINT) && !defined(CODECENTER)
> > -+static const char rcsid[] =3D "$BINDId: base64.c,v 8.7 1999/10/13
> 16:39:33 vixie Exp $";
> > -+#endif /* not lint */
> > -+
> > -+#include <sys/types.h>
> > -+#include <sys/param.h>
> > -+#include <sys/socket.h>
> > -+
> > -+#include <netinet/in.h>
> > -+#include <arpa/inet.h>
> > -+#include <arpa/nameser.h>
> > -+
> > -+#include <ctype.h>
> > -+#include <resolv.h>
> > -+#include <stdio.h>
> > -+#include <stdlib.h>
> > -+#include <stdint.h>
> > -+#include <string.h>
> > -+
> > -+#define Assert(Cond) if (!(Cond)) abort()
> > -+
> > -+static const char Base64[] =3D
> > -+
> "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
> > -+static const char Pad64 =3D '=3D';
> > -+
> > -+/* (From RFC1521 and draft-ietf-dnssec-secext-03.txt)
> > -+   The following encoding technique is taken from RFC 1521 by
> Borenstein
> > -+   and Freed.  It is reproduced here in a slightly edited form for
> > -+   convenience.
> > -+
> > -+   A 65-character subset of US-ASCII is used, enabling 6 bits to be
> > -+   represented per printable character. (The extra 65th character, "=
=3D",
> > -+   is used to signify a special processing function.)
> > -+
> > -+   The encoding process represents 24-bit groups of input bits as
> output
> > -+   strings of 4 encoded characters. Proceeding from left to right, a
> > -+   24-bit input group is formed by concatenating 3 8-bit input groups=
.
> > -+   These 24 bits are then treated as 4 concatenated 6-bit groups, eac=
h
> > -+   of which is translated into a single digit in the base64 alphabet.
> > -+
> > -+   Each 6-bit group is used as an index into an array of 64 printable
> > -+   characters. The character referenced by the index is placed in the
> > -+   output string.
> > -+
> > -+                         Table 1: The Base64 Alphabet
> > -+
> > -+      Value Encoding  Value Encoding  Value Encoding  Value Encoding
> > -+          0 A            17 R            34 i            51 z
> > -+          1 B            18 S            35 j            52 0
> > -+          2 C            19 T            36 k            53 1
> > -+          3 D            20 U            37 l            54 2
> > -+          4 E            21 V            38 m            55 3
> > -+          5 F            22 W            39 n            56 4
> > -+          6 G            23 X            40 o            57 5
> > -+          7 H            24 Y            41 p            58 6
> > -+          8 I            25 Z            42 q            59 7
> > -+          9 J            26 a            43 r            60 8
> > -+         10 K            27 b            44 s            61 9
> > -+         11 L            28 c            45 t            62 +
> > -+         12 M            29 d            46 u            63 /
> > -+         13 N            30 e            47 v
> > -+         14 O            31 f            48 w         (pad) =3D
> > -+         15 P            32 g            49 x
> > -+         16 Q            33 h            50 y
> > -+
> > -+   Special processing is performed if fewer than 24 bits are availabl=
e
> > -+   at the end of the data being encoded.  A full encoding quantum is
> > -+   always completed at the end of a quantity.  When fewer than 24 inp=
ut
> > -+   bits are available in an input group, zero bits are added (on the
> > -+   right) to form an integral number of 6-bit groups.  Padding at the
> > -+   end of the data is performed using the '=3D' character.
> > -+
> > -+   Since all base64 input is an integral number of octets, only the
> > -+         -------------------------------------------------
> > -+   following cases can arise:
> > -+
> > -+       (1) the final quantum of encoding input is an integral
> > -+           multiple of 24 bits; here, the final unit of encoded
> > -+         output will be an integral multiple of 4 characters
> > -+         with no "=3D" padding,
> > -+       (2) the final quantum of encoding input is exactly 8 bits;
> > -+           here, the final unit of encoded output will be two
> > -+         characters followed by two "=3D" padding characters, or
> > -+       (3) the final quantum of encoding input is exactly 16 bits;
> > -+           here, the final unit of encoded output will be three
> > -+         characters followed by one "=3D" padding character.
> > -+   */
> > -+
> > -+int
> > -+b64_ntop(const uint8_t* src, size_t srclength, char* target, size_t
> targsize)
> > -+{
> > -+      size_t datalength =3D 0;
> > -+      uint8_t input[3];
> > -+      uint8_t output[4];
> > -+      size_t i;
> > -+
> > -+      while (2 < srclength) {
> > -+              input[0] =3D *src++;
> > -+              input[1] =3D *src++;
> > -+              input[2] =3D *src++;
> > -+              srclength -=3D 3;
> > -+
> > -+              output[0] =3D input[0] >> 2;
> > -+              output[1] =3D ((input[0] & 0x03) << 4) + (input[1] >> 4=
);
> > -+              output[2] =3D ((input[1] & 0x0f) << 2) + (input[2] >> 6=
);
> > -+              output[3] =3D input[2] & 0x3f;
> > -+              Assert(output[0] < 64);
> > -+              Assert(output[1] < 64);
> > -+              Assert(output[2] < 64);
> > -+              Assert(output[3] < 64);
> > -+
> > -+              if (datalength + 4 > targsize)
> > -+                      return (-1);
> > -+              target[datalength++] =3D Base64[output[0]];
> > -+              target[datalength++] =3D Base64[output[1]];
> > -+              target[datalength++] =3D Base64[output[2]];
> > -+              target[datalength++] =3D Base64[output[3]];
> > -+      }
> > -+
> > -+      /* Now we worry about padding. */
> > -+      if (0 !=3D srclength) {
> > -+              /* Get what's left. */
> > -+              input[0] =3D input[1] =3D input[2] =3D '\0';
> > -+              for (i =3D 0; i < srclength; i++)
> > -+                      input[i] =3D *src++;
> > -+
> > -+              output[0] =3D input[0] >> 2;
> > -+              output[1] =3D ((input[0] & 0x03) << 4) + (input[1] >> 4=
);
> > -+              output[2] =3D ((input[1] & 0x0f) << 2) + (input[2] >> 6=
);
> > -+              Assert(output[0] < 64);
> > -+              Assert(output[1] < 64);
> > -+              Assert(output[2] < 64);
> > -+
> > -+              if (datalength + 4 > targsize)
> > -+                      return (-1);
> > -+              target[datalength++] =3D Base64[output[0]];
> > -+              target[datalength++] =3D Base64[output[1]];
> > -+              if (srclength =3D=3D 1)
> > -+                      target[datalength++] =3D Pad64;
> > -+              else
> > -+                      target[datalength++] =3D Base64[output[2]];
> > -+              target[datalength++] =3D Pad64;
> > -+      }
> > -+      if (datalength >=3D targsize)
> > -+              return (-1);
> > -+      target[datalength] =3D '\0';      /* Returned value doesn't cou=
nt
> \0. */
> > -+      return (datalength);
> > -+}
> > -+
> > -+/* skips all whitespace anywhere.
> > -+   converts characters, four at a time, starting at (or after)
> > -+   src from base - 64 numbers into three 8 bit bytes in the target
> area.
> > -+   it returns the number of data bytes stored at the target, or -1 on
> error.
> > -+ */
> > -+
> > -+int b64_pton(const char* src, uint8_t* target, size_t targsize)
> > -+{
> > -+      int tarindex, state, ch;
> > -+      char *pos;
> > -+
> > -+      state =3D 0;
> > -+      tarindex =3D 0;
> > -+
> > -+      while ((ch =3D *src++) !=3D '\0') {
> > -+              if (isspace(ch))        /* Skip whitespace anywhere. */
> > -+                      continue;
> > -+
> > -+              if (ch =3D=3D Pad64)
> > -+                      break;
> > -+
> > -+              pos =3D strchr(Base64, ch);
> > -+              if (pos =3D=3D 0)           /* A non-base64 character. =
*/
> > -+                      return (-1);
> > -+
> > -+              switch (state) {
> > -+              case 0:
> > -+                      if (target) {
> > -+                              if ((size_t)tarindex >=3D targsize)
> > -+                                      return (-1);
> > -+                              target[tarindex] =3D (pos - Base64) << =
2;
> > -+                      }
> > -+                      state =3D 1;
> > -+                      break;
> > -+              case 1:
> > -+                      if (target) {
> > -+                              if ((size_t)tarindex + 1 >=3D targsize)
> > -+                                      return (-1);
> > -+                              target[tarindex]   |=3D  (pos - Base64)=
 >>
> 4;
> > -+                              target[tarindex+1]  =3D ((pos - Base64)=
 &
> 0x0f)
> > -+                                                      << 4 ;
> > -+                      }
> > -+                      tarindex++;
> > -+                      state =3D 2;
> > -+                      break;
> > -+              case 2:
> > -+                      if (target) {
> > -+                              if ((size_t)tarindex + 1 >=3D targsize)
> > -+                                      return (-1);
> > -+                              target[tarindex]   |=3D  (pos - Base64)=
 >>
> 2;
> > -+                              target[tarindex+1]  =3D ((pos - Base64)=
 &
> 0x03)
> > -+                                                      << 6;
> > -+                      }
> > -+                      tarindex++;
> > -+                      state =3D 3;
> > -+                      break;
> > -+              case 3:
> > -+                      if (target) {
> > -+                              if ((size_t)tarindex >=3D targsize)
> > -+                                      return (-1);
> > -+                              target[tarindex] |=3D (pos - Base64);
> > -+                      }
> > -+                      tarindex++;
> > -+                      state =3D 0;
> > -+                      break;
> > -+              default:
> > -+                      abort();
> > -+              }
> > -+      }
> > -+
> > -+      /*
> > -+       * We are done decoding Base-64 chars.  Let's see if we ended
> > -+       * on a byte boundary, and/or with erroneous trailing character=
s.
> > -+       */
> > -+
> > -+      if (ch =3D=3D Pad64) {              /* We got a pad char. */
> > -+              ch =3D *src++;            /* Skip it, get next. */
> > -+              switch (state) {
> > -+              case 0:         /* Invalid =3D in first position */
> > -+              case 1:         /* Invalid =3D in second position */
> > -+                      return (-1);
> > -+
> > -+              case 2:         /* Valid, means one byte of info */
> > -+                      /* Skip any number of spaces. */
> > -+                      for ((void)NULL; ch !=3D '\0'; ch =3D *src++)
> > -+                              if (!isspace(ch))
> > -+                                      break;
> > -+                      /* Make sure there is another trailing =3D sign=
. */
> > -+                      if (ch !=3D Pad64)
> > -+                              return (-1);
> > -+                      ch =3D *src++;            /* Skip the =3D */
> > -+                      /* Fall through to "single trailing =3D" case. =
*/
> > -+                      /* FALLTHROUGH */
> > -+
> > -+              case 3:         /* Valid, means two bytes of info */
> > -+                      /*
> > -+                       * We know this char is an =3D.  Is there anyth=
ing
> but
> > -+                       * whitespace after it?
> > -+                       */
> > -+                      for ((void)NULL; ch !=3D '\0'; ch =3D *src++)
> > -+                              if (!isspace(ch))
> > -+                                      return (-1);
> > -+
> > -+                      /*
> > -+                       * Now make sure for cases 2 and 3 that the
> "extra"
> > -+                       * bits that slopped past the last full byte we=
re
> > -+                       * zeros.  If we don't check them, they become =
a
> > -+                       * subliminal channel.
> > -+                       */
> > -+                      if (target && target[tarindex] !=3D 0)
> > -+                              return (-1);
> > -+              }
> > -+      } else {
> > -+              /*
> > -+               * We ended by seeing the end of the string.  Make sure
> we
> > -+               * have no partial bytes lying around.
> > -+               */
> > -+              if (state !=3D 0)
> > -+                      return (-1);
> > -+      }
> > -+
> > -+      return (tarindex);
> > -+}
> > -+
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl=
-fixes.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl=
-fixes.patch
> > deleted file mode 100644
> > index b5d383f38..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl=
-fixes.patch
> > +++ /dev/null
> > @@ -1,131 +0,0 @@
> > -From 62d957a1271c88ec08d67984fbe31601f0bd41a9 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Fri, 15 Sep 2017 15:50:57 -0700
> > -Subject: [PATCH] adb: Musl fixes
> > -
> > -__nonnull is gcc specific
> > -include sys/types.h for size_t
> > -Do not redefine close() and lseek()
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - adb/adb.h                    |  2 ++
> > - adb/disable_verity_service.c | 13 ++++++++-----
> > - adb/framebuffer_service.c    |  7 ++++---
> > - adb/sysdeps.h                | 12 ++++++------
> > - 4 files changed, 20 insertions(+), 14 deletions(-)
> > -
> > -diff --git a/adb/adb.h b/adb/adb.h
> > -index 44e5981bdc..bcdc49f63c 100644
> > ---- a/adb/adb.h
> > -+++ b/adb/adb.h
> > -@@ -18,7 +18,9 @@
> > - #define __ADB_H
> > -
> > - #include <limits.h>
> > -+#include <sys/types.h>
> > -
> > -+#include "fdevent.h"
> > - #include "adb_trace.h"
> > - #include "transport.h"  /* readx(), writex() */
> > -
> > -diff --git a/adb/disable_verity_service.c b/adb/disable_verity_service=
.c
> > -index ed3da52108..29fa3d65a9 100644
> > ---- a/adb/disable_verity_service.c
> > -+++ b/adb/disable_verity_service.c
> > -@@ -14,25 +14,28 @@
> > -  * limitations under the License.
> > -  */
> > -
> > --#include "sysdeps.h"
> > -
> > - #define  TRACE_TAG  TRACE_ADB
> > - #include "adb.h"
> > -+#include "sysdeps.h"
> > -+#include "cutils/properties.h"
> > -+#include "ext4_sb.h"
> > -+#include <fs_mgr.h>
> > -
> > - #include <stdio.h>
> > - #include <stdarg.h>
> > - #include <sys/stat.h>
> > - #include <fcntl.h>
> > - #include <inttypes.h>
> > -+#include <unistd.h>
> > -+#include <errno.h>
> > -+#include <stdbool.h>
> > -
> > --#include "cutils/properties.h"
> > --#include "ext4_sb.h"
> > --#include <fs_mgr.h>
> > -
> > - #define FSTAB_PREFIX "/fstab."
> > - struct fstab *fstab;
> > -
> > --__attribute__((__format__(printf, 2, 3))) __nonnull((2))
> > -+__attribute__((__format__(printf, 2, 3))) __attribute__((nonnull((2))=
))
> > - static void write_console(int fd, const char* format, ...)
> > - {
> > -     char buffer[256];
> > -diff --git a/adb/framebuffer_service.c b/adb/framebuffer_service.c
> > -index 8cbe8403cc..8f0ccfb7aa 100644
> > ---- a/adb/framebuffer_service.c
> > -+++ b/adb/framebuffer_service.c
> > -@@ -14,6 +14,10 @@
> > -  * limitations under the License.
> > -  */
> > -
> > -+#include "fdevent.h"
> > -+#include "adb.h"
> > -+#include "sysdeps.h"
> > -+
> > - #include <stdlib.h>
> > - #include <stdio.h>
> > - #include <unistd.h>
> > -@@ -23,9 +27,6 @@
> > - #include <sys/types.h>
> > - #include <sys/wait.h>
> > -
> > --#include "fdevent.h"
> > --#include "adb.h"
> > --
> > - #include <linux/fb.h>
> > - #include <sys/ioctl.h>
> > - #include <sys/mman.h>
> > -diff --git a/adb/sysdeps.h b/adb/sysdeps.h
> > -index cc1f839e9f..ea39ac39cc 100644
> > ---- a/adb/sysdeps.h
> > -+++ b/adb/sysdeps.h
> > -@@ -123,8 +123,8 @@ static __inline__ int  unix_close(int fd)
> > - {
> > -     return close(fd);
> > - }
> > --#undef   close
> > --#define  close   ____xxx_close
> > -+//#undef   close
> > -+//#define  close   ____xxx_close
> > -
> > - static __inline__  int  unix_read(int  fd, void*  buf, size_t  len)
> > - {
> > -@@ -369,8 +369,8 @@ static __inline__ int  adb_close(int fd)
> > - {
> > -     return close(fd);
> > - }
> > --#undef   close
> > --#define  close   ____xxx_close
> > -+//#undef   close
> > -+//#define  close   ____xxx_close
> > -
> > -
> > - static __inline__  int  adb_read(int  fd, void*  buf, size_t  len)
> > -@@ -392,8 +392,8 @@ static __inline__ int   adb_lseek(int  fd, int
> pos, int  where)
> > - {
> > -     return lseek(fd, pos, where);
> > - }
> > --#undef   lseek
> > --#define  lseek   ___xxx_lseek
> > -+//#undef   lseek
> > -+//#define  lseek   ___xxx_lseek
> > -
> > - static __inline__  int    adb_unlink(const char*  path)
> > - {
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_=
linux.c-fix-build-with-glibc-2.28.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_=
linux.c-fix-build-with-glibc-2.28.patch
> > deleted file mode 100644
> > index e02a95687..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_=
linux.c-fix-build-with-glibc-2.28.patch
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -From de393bba41c8feff932c77d6c30233945f380d42 Mon Sep 17 00:00:00 2001
> > -From: Martin Jansa <Martin.Jansa@gmail.com>
> > -Date: Sat, 11 Aug 2018 13:23:37 +0000
> > -Subject: [PATCH] adb: usb_linux.c: fix build with glibc-2.28
> > -
> > -* include sysmacros for major, minor
> > -
> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ----
> > - adb/usb_linux.c | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/adb/usb_linux.c b/adb/usb_linux.c
> > -index f16bdd0361..c8a7732441 100644
> > ---- a/adb/usb_linux.c
> > -+++ b/adb/usb_linux.c
> > -@@ -22,6 +22,7 @@
> > - #include <sys/ioctl.h>
> > - #include <sys/types.h>
> > - #include <sys/time.h>
> > -+#include <sys/sysmacros.h>
> > - #include <dirent.h>
> > - #include <fcntl.h>
> > - #include <errno.h>
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allo=
w-adbd-to-be-ran-as-root.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allo=
w-adbd-to-be-ran-as-root.patch
> > deleted file mode 100644
> > index 7d223e05f..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allo=
w-adbd-to-be-ran-as-root.patch
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -From 3a788e9168c9b9eac66c4fa479413f4a95c61be4 Mon Sep 17 00:00:00 2001
> > -From: Florent Revest <revestflo@gmail.com>
> > -Date: Mon, 30 Oct 2017 21:05:46 +0100
> > -Subject: [PATCH] adb: Allow adbd to be ran as root
> > -
> > ----
> > - adb/adb.c | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/adb/adb.c b/adb/adb.c
> > -index 027edd9359..e0f7ecde45 100644
> > ---- a/adb/adb.c
> > -+++ b/adb/adb.c
> > -@@ -1271,6 +1271,7 @@ static int should_drop_privileges() {
> > -     int secure =3D 0;
> > -     char value[PROPERTY_VALUE_MAX];
> > -
> > -+    return 0;
> > -    /* run adbd in secure mode if ro.secure is set and
> > -     ** we are not in the emulator
> > -     */
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootim=
g-Add-dt-parameter-to-specify-DT-image.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootim=
g-Add-dt-parameter-to-specify-DT-image.patch
> > deleted file mode 100644
> > index a4dc6e1e3..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootim=
g-Add-dt-parameter-to-specify-DT-image.patch
> > +++ /dev/null
> > @@ -1,110 +0,0 @@
> > -From dd195778a9930b7967b21a3b8eb390b70253dbad Mon Sep 17 00:00:00 2001
> > -From: David Ng <dave@codeaurora.org>
> > -Date: Fri, 27 Jul 2012 17:15:03 -0700
> > -Subject: [PATCH] mkbootimg: Add --dt parameter to specify DT image
> > -
> > -New optional --dt parameter to specify a kernel device
> > -tree image.
> > -
> > -Upstream-Status: Inappropriate
> > ----
> > - mkbootimg/bootimg.h   |  7 +++++--
> > - mkbootimg/mkbootimg.c | 21 +++++++++++++++++++++
> > - 2 files changed, 26 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/mkbootimg/bootimg.h b/mkbootimg/bootimg.h
> > -index 9171d85a7b..308c537d6b 100644
> > ---- a/mkbootimg/bootimg.h
> > -+++ b/mkbootimg/bootimg.h
> > -@@ -41,8 +41,8 @@ struct boot_img_hdr
> > -
> > -     unsigned tags_addr;    /* physical addr for kernel tags */
> > -     unsigned page_size;    /* flash page size we assume */
> > --    unsigned unused[2];    /* future expansion: should be 0 */
> > --
> > -+    unsigned dt_size;      /* device tree in bytes */
> > -+    unsigned unused;       /* future expansion: should be 0 */
> > -     unsigned char name[BOOT_NAME_SIZE]; /* asciiz product name */
> > -
> > -     unsigned char cmdline[BOOT_ARGS_SIZE];
> > -@@ -64,10 +64,13 @@ struct boot_img_hdr
> > - ** +-----------------+
> > - ** | second stage    | o pages
> > - ** +-----------------+
> > -+** | device tree     | p pages
> > -+** +-----------------+
> > - **
> > - ** n =3D (kernel_size + page_size - 1) / page_size
> > - ** m =3D (ramdisk_size + page_size - 1) / page_size
> > - ** o =3D (second_size + page_size - 1) / page_size
> > -+** p =3D (dt_size + page_size - 1) / page_size
> > - **
> > - ** 0. all entities are page_size aligned in flash
> > - ** 1. kernel and ramdisk are required (size !=3D 0)
> > -diff --git a/mkbootimg/mkbootimg.c b/mkbootimg/mkbootimg.c
> > -index fc92b4dc30..658052cdf2 100644
> > ---- a/mkbootimg/mkbootimg.c
> > -+++ b/mkbootimg/mkbootimg.c
> > -@@ -65,6 +65,7 @@ int usage(void)
> > -             "       [ --board <boardname> ]\n"
> > -             "       [ --base <address> ]\n"
> > -             "       [ --pagesize <pagesize> ]\n"
> > -+            "       [ --dt <filename> ]\n"
> > -             "       -o|--output <filename>\n"
> > -             );
> > -     return 1;
> > -@@ -105,6 +106,8 @@ int main(int argc, char **argv)
> > -     char *cmdline =3D "";
> > -     char *bootimg =3D 0;
> > -     char *board =3D "";
> > -+    char *dt_fn =3D 0;
> > -+    void *dt_data =3D 0;
> > -     unsigned pagesize =3D 2048;
> > -     int fd;
> > -     SHA_CTX ctx;
> > -@@ -158,6 +161,8 @@ int main(int argc, char **argv)
> > -                 fprintf(stderr,"error: unsupported page size %d\n",
> pagesize);
> > -                 return -1;
> > -             }
> > -+        } else if(!strcmp(arg, "--dt")) {
> > -+            dt_fn =3D val;
> > -         } else {
> > -             return usage();
> > -         }
> > -@@ -232,6 +237,14 @@ int main(int argc, char **argv)
> > -         }
> > -     }
> > -
> > -+    if(dt_fn) {
> > -+        dt_data =3D load_file(dt_fn, &hdr.dt_size);
> > -+        if (dt_data =3D=3D 0) {
> > -+            fprintf(stderr,"error: could not load device tree image
> '%s'\n", dt_fn);
> > -+            return 1;
> > -+        }
> > -+    }
> > -+
> > -     /* put a hash of the contents in the header so boot images can be
> > -      * differentiated based on their first 2k.
> > -      */
> > -@@ -242,6 +255,10 @@ int main(int argc, char **argv)
> > -     SHA_update(&ctx, &hdr.ramdisk_size, sizeof(hdr.ramdisk_size));
> > -     SHA_update(&ctx, second_data, hdr.second_size);
> > -     SHA_update(&ctx, &hdr.second_size, sizeof(hdr.second_size));
> > -+    if(dt_data) {
> > -+        SHA_update(&ctx, dt_data, hdr.dt_size);
> > -+        SHA_update(&ctx, &hdr.dt_size, sizeof(hdr.dt_size));
> > -+    }
> > -     sha =3D SHA_final(&ctx);
> > -     memcpy(hdr.id, sha,
> > -            SHA_DIGEST_SIZE > sizeof(hdr.id) ? sizeof(hdr.id) :
> SHA_DIGEST_SIZE);
> > -@@ -266,6 +283,10 @@ int main(int argc, char **argv)
> > -         if(write_padding(fd, pagesize, hdr.second_size)) goto fail;
> > -     }
> > -
> > -+    if(dt_data) {
> > -+        if(write(fd, dt_data, hdr.dt_size) !=3D (ssize_t) hdr.dt_size=
)
> goto fail;
> > -+        if(write_padding(fd, pagesize, hdr.dt_size)) goto fail;
> > -+    }
> > -     return 0;
> > -
> > - fail:
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linu=
x-capability.h-on-linux-systems-too.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linu=
x-capability.h-on-linux-systems-too.patch
> > deleted file mode 100644
> > index 2c607ff67..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linu=
x-capability.h-on-linux-systems-too.patch
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -From ef743c9c3c7452ae904a5c343ee2b759ab3a87cb Mon Sep 17 00:00:00 2001
> > -From: =3D?UTF-8?q?Lo=3DC3=3DAFc=3D20Minier?=3D <loic.minier@ubuntu.com=
>
> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> > -Subject: [PATCH] Use linux/capability.h on linux systems too
> > -
> > -Upstream-Status: Inappropriate
> > ----
> > - include/private/android_filesystem_config.h | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/include/private/android_filesystem_config.h
> b/include/private/android_filesystem_config.h
> > -index 2f528b95c8..3e0b00928e 100644
> > ---- a/include/private/android_filesystem_config.h
> > -+++ b/include/private/android_filesystem_config.h
> > -@@ -27,7 +27,7 @@
> > - #include <sys/types.h>
> > - #include <stdint.h>
> > -
> > --#ifdef HAVE_ANDROID_OS
> > -+#if defined(HAVE_ANDROID_OS) || defined(__linux__)
> > - #include <linux/capability.h>
> > - #else
> > - #include "android_filesystem_capability.h"
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-b=
ionic-specific-calls.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-b=
ionic-specific-calls.patch
> > deleted file mode 100644
> > index 5b18f461a..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-b=
ionic-specific-calls.patch
> > +++ /dev/null
> > @@ -1,64 +0,0 @@
> > -From 9eff8799831961c0edf6e37e5d4cbf43baa7c748 Mon Sep 17 00:00:00 2001
> > -From: Fathi Boudra <fabo@debian.org>
> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> > -Subject: [PATCH] Remove bionic specific calls
> > -
> > -Upstream-Status: Inappropriate
> > ----
> > - include/cutils/properties.h | 1 -
> > - libcutils/properties.c      | 2 +-
> > - liblog/logd_write.c         | 5 +++++
> > - 3 files changed, 6 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/include/cutils/properties.h b/include/cutils/properties.h
> > -index 798db8b36f..7d01f28d6e 100644
> > ---- a/include/cutils/properties.h
> > -+++ b/include/cutils/properties.h
> > -@@ -19,7 +19,6 @@
> > -
> > - #include <sys/cdefs.h>
> > - #include <stddef.h>
> > --#include <sys/system_properties.h>
> > - #include <stdint.h>
> > -
> > - #ifdef __cplusplus
> > -diff --git a/libcutils/properties.c b/libcutils/properties.c
> > -index b283658aa4..4151e7882c 100644
> > ---- a/libcutils/properties.c
> > -+++ b/libcutils/properties.c
> > -@@ -104,10 +104,10 @@ int32_t property_get_int32(const char *key,
> int32_t default_value) {
> > -     return (int32_t)property_get_imax(key, INT32_MIN, INT32_MAX,
> default_value);
> > - }
> > -
> > -+#undef HAVE_LIBC_SYSTEM_PROPERTIES
> > - #ifdef HAVE_LIBC_SYSTEM_PROPERTIES
> > -
> > - #define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
> > --#include <sys/_system_properties.h>
> > -
> > - int property_set(const char *key, const char *value)
> > - {
> > -diff --git a/liblog/logd_write.c b/liblog/logd_write.c
> > -index b2668cedb7..f5a44fe901 100644
> > ---- a/liblog/logd_write.c
> > -+++ b/liblog/logd_write.c
> > -@@ -23,6 +23,7 @@
> > - #include <stdlib.h>
> > - #include <string.h>
> > - #include <sys/stat.h>
> > -+#include <sys/syscall.h>
> > - #include <sys/types.h>
> > - #if (FAKE_LOG_DEVICE =3D=3D 0)
> > - #include <sys/socket.h>
> > -@@ -205,7 +206,11 @@ static int __write_to_log_kernel(log_id_t log_id,
> struct iovec *vec, size_t nr)
> > -     realtime_ts.tv_nsec =3D ts.tv_nsec;
> > -
> > -     log_id_buf =3D log_id;
> > -+#ifdef __BIONIC__
> > -     tid =3D gettid();
> > -+#else
> > -+    tid =3D (pid_t) syscall(__NR_gettid);
> > -+#endif
> > -
> > -     newVec[0].iov_base   =3D (unsigned char *) &log_id_buf;
> > -     newVec[0].iov_len    =3D sizeof_log_id_t;
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-impl=
icit-declaration-of-stlcat-strlcopy-function.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-impl=
icit-declaration-of-stlcat-strlcopy-function.patch
> > deleted file mode 100644
> > index b0feb6592..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-impl=
icit-declaration-of-stlcat-strlcopy-function.patch
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -From cd4525d760c6f88c9bf85f7bf488da79cd0d3264 Mon Sep 17 00:00:00 2001
> > -From: Fathi Boudra <fabo@debian.org>
> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> > -Subject: [PATCH] Fix implicit declaration of stlcat/strlcopy functions
> > -
> > -Upstream-Status: Inappropriate
> > ----
> > - adb/adb.c                | 1 +
> > - fs_mgr/fs_mgr_fstab.c    | 2 +-
> > - include/cutils/sockets.h | 2 +-
> > - 3 files changed, 3 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/adb/adb.c b/adb/adb.c
> > -index e0f7ecde45..aaefd9b401 100644
> > ---- a/adb/adb.c
> > -+++ b/adb/adb.c
> > -@@ -41,6 +41,7 @@
> > - #include <sys/prctl.h>
> > - #include <getopt.h>
> > - #include <selinux/selinux.h>
> > -+#include <grp.h>
> > - #else
> > - #include "usb_vendors.h"
> > - #endif
> > -diff --git a/fs_mgr/fs_mgr_fstab.c b/fs_mgr/fs_mgr_fstab.c
> > -index edd9591164..9ddb4643b5 100644
> > ---- a/fs_mgr/fs_mgr_fstab.c
> > -+++ b/fs_mgr/fs_mgr_fstab.c
> > -@@ -17,7 +17,7 @@
> > - #include <ctype.h>
> > - #include <stdio.h>
> > - #include <stdlib.h>
> > --#include <string.h>
> > -+#include <bsd/string.h>
> > - #include <sys/mount.h>
> > -
> > - #include "fs_mgr_priv.h"
> > -diff --git a/include/cutils/sockets.h b/include/cutils/sockets.h
> > -index daf43ec944..d3270c69e7 100644
> > ---- a/include/cutils/sockets.h
> > -+++ b/include/cutils/sockets.h
> > -@@ -19,7 +19,7 @@
> > -
> > - #include <errno.h>
> > - #include <stdlib.h>
> > --#include <string.h>
> > -+#include <bsd/string.h>
> > - #include <stdbool.h>
> > -
> > - #ifdef HAVE_WINSOCK
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Supp=
ort-riscv64.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Supp=
ort-riscv64.patch
> > deleted file mode 100644
> > index a8434afba..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Supp=
ort-riscv64.patch
> > +++ /dev/null
> > @@ -1,189 +0,0 @@
> > -From 48ddf4fb999931942c359350fb31cd557514e1c6 Mon Sep 17 00:00:00 2001
> > -From: Chenxi Mao <maochenxi@eswin.com>
> > -Date: Mon, 20 Apr 2020 15:27:22 +0800
> > -Subject: [PATCH 1/1] adb: Support riscv64
> > -
> > ----
> > - include/cutils/atomic-inline.h  |   2 +
> > - include/cutils/atomic-riscv64.h | 156 +++++++++++++++++++++++++++++++=
+
> > - 2 files changed, 158 insertions(+)
> > - create mode 100644 include/cutils/atomic-riscv64.h
> > -
> > -diff --git a/include/cutils/atomic-inline.h
> b/include/cutils/atomic-inline.h
> > -index a31e913579..b5dc38209c 100644
> > ---- a/include/cutils/atomic-inline.h
> > -+++ b/include/cutils/atomic-inline.h
> > -@@ -55,6 +55,8 @@ extern "C" {
> > - #include <cutils/atomic-mips64.h>
> > - #elif defined(__mips__)
> > - #include <cutils/atomic-mips.h>
> > -+#elif defined(__riscv) && __riscv_xlen =3D=3D 64
> > -+#include <cutils/atomic-riscv64.h>
> > - #else
> > - #error atomic operations are unsupported
> > - #endif
> > -diff --git a/include/cutils/atomic-riscv64.h
> b/include/cutils/atomic-riscv64.h
> > -new file mode 100644
> > -index 0000000000..2664db5a86
> > ---- /dev/null
> > -+++ b/include/cutils/atomic-riscv64.h
> > -@@ -0,0 +1,156 @@
> > -+/*
> > -+ * Copyright (C) 2014 The Android Open Source Project
> > -+ * All rights reserved.
> > -+ *
> > -+ * Redistribution and use in source and binary forms, with or without
> > -+ * modification, are permitted provided that the following conditions
> > -+ * are met:
> > -+ *  * Redistributions of source code must retain the above copyright
> > -+ *    notice, this list of conditions and the following disclaimer.
> > -+ *  * Redistributions in binary form must reproduce the above copyrig=
ht
> > -+ *    notice, this list of conditions and the following disclaimer in
> > -+ *    the documentation and/or other materials provided with the
> > -+ *    distribution.
> > -+ *
> > -+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTOR=
S
> > -+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> > -+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> > -+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> > -+ * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT=
,
> > -+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDIN=
G,
> > -+ * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> LOSS
> > -+ * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
> > -+ * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> LIABILITY,
> > -+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
> > -+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> > -+ * SUCH DAMAGE.
> > -+ */
> > -+
> > -+#ifndef ANDROID_CUTILS_ATOMIC_RISCV64_H
> > -+#define ANDROID_CUTILS_ATOMIC_RISCV64_H
> > -+
> > -+#include <stdint.h>
> > -+
> > -+#ifndef ANDROID_ATOMIC_INLINE
> > -+#define ANDROID_ATOMIC_INLINE inline __attribute__((always_inline))
> > -+#endif
> > -+
> > -+/*
> > -+   TODOAArch64: Revisit the below functions and check for potential
> > -+   optimizations using assembly code or otherwise.
> > -+*/
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+void android_compiler_barrier(void)
> > -+{
> > -+    __asm__ __volatile__ ("" : : : "memory");
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+void android_memory_barrier(void)
> > -+{
> > -+    __asm__ __volatile__ ("fence rw,rw" : : : "memory");
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+int32_t android_atomic_acquire_load(volatile const int32_t *ptr)
> > -+{
> > -+    int32_t value =3D *ptr;
> > -+    android_memory_barrier();
> > -+    return value;
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+int32_t android_atomic_release_load(volatile const int32_t *ptr)
> > -+{
> > -+    android_memory_barrier();
> > -+    return *ptr;
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+void android_atomic_acquire_store(int32_t value, volatile int32_t *pt=
r)
> > -+{
> > -+    *ptr =3D value;
> > -+    android_memory_barrier();
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+void android_atomic_release_store(int32_t value, volatile int32_t *pt=
r)
> > -+{
> > -+    android_memory_barrier();
> > -+    *ptr =3D value;
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+int android_atomic_cas(int32_t old_value, int32_t new_value,
> > -+                       volatile int32_t *ptr)
> > -+{
> > -+    return __sync_val_compare_and_swap(ptr, old_value, new_value) !=
=3D
> old_value;
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+int android_atomic_acquire_cas(int32_t old_value, int32_t new_value,
> > -+                               volatile int32_t *ptr)
> > -+{
> > -+    int status =3D android_atomic_cas(old_value, new_value, ptr);
> > -+    android_memory_barrier();
> > -+    return status;
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+int android_atomic_release_cas(int32_t old_value, int32_t new_value,
> > -+                               volatile int32_t *ptr)
> > -+{
> > -+    android_memory_barrier();
> > -+    return android_atomic_cas(old_value, new_value, ptr);
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+int32_t android_atomic_add(int32_t increment, volatile int32_t *ptr)
> > -+{
> > -+    int32_t prev, status;
> > -+    android_memory_barrier();
> > -+    do {
> > -+        prev =3D *ptr;
> > -+        status =3D android_atomic_cas(prev, prev + increment, ptr);
> > -+    } while (__builtin_expect(status !=3D 0, 0));
> > -+    return prev;
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+int32_t android_atomic_inc(volatile int32_t *addr)
> > -+{
> > -+    return android_atomic_add(1, addr);
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+int32_t android_atomic_dec(volatile int32_t *addr)
> > -+{
> > -+    return android_atomic_add(-1, addr);
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+int32_t android_atomic_and(int32_t value, volatile int32_t *ptr)
> > -+{
> > -+    int32_t prev, status;
> > -+    android_memory_barrier();
> > -+    do {
> > -+        prev =3D *ptr;
> > -+        status =3D android_atomic_cas(prev, prev & value, ptr);
> > -+    } while (__builtin_expect(status !=3D 0, 0));
> > -+    return prev;
> > -+}
> > -+
> > -+extern ANDROID_ATOMIC_INLINE
> > -+int32_t android_atomic_or(int32_t value, volatile int32_t *ptr)
> > -+{
> > -+    int32_t prev, status;
> > -+    android_memory_barrier();
> > -+    do {
> > -+        prev =3D *ptr;
> > -+        status =3D android_atomic_cas(prev, prev | value, ptr);
> > -+    } while (__builtin_expect(status !=3D 0, 0));
> > -+    return prev;
> > -+}
> > -+
> > -+#endif /* ANDROID_CUTILS_ATOMIC_RISCV_H */
> > ---
> > -2.17.1
> > -
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11=
.diff
> b/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11=
.diff
> > deleted file mode 100644
> > index 3ead649b1..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11=
.diff
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -Description: adb: Make compatible with openssl 1.1
> > - OpenSSL version 1.1 brought some API changes which broke the build
> here,
> > - fix that by accessing rsa->n (and e) directly, using RSA_get0_key
> instead.
> > -Author: Chirayu Desai <chirayudesai1@gmail.com
> > -Last-Update: 2016-11-10
> > ----
> > -This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
> > ----
> > - system/core/adb/adb_auth_host.c |    5 +++--
> > - 1 file changed, 3 insertions(+), 2 deletions(-)
> > -
> > ---- a/adb/adb_auth_host.c
> > -+++ b/adb/adb_auth_host.c
> > -@@ -75,6 +75,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
> > -     BIGNUM* rem =3D BN_new();
> > -     BIGNUM* n =3D BN_new();
> > -     BIGNUM* n0inv =3D BN_new();
> > -+    BIGNUM* e =3D BN_new();
> > -
> > -     if (RSA_size(rsa) !=3D RSANUMBYTES) {
> > -         ret =3D 0;
> > -@@ -82,7 +83,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
> > -     }
> > -
> > -     BN_set_bit(r32, 32);
> > --    BN_copy(n, rsa->n);
> > -+    RSA_get0_key(rsa, &n, &e, NULL);
> > -     BN_set_bit(r, RSANUMWORDS * 32);
> > -     BN_mod_sqr(rr, r, n, ctx);
> > -     BN_div(NULL, rem, n, r32, ctx);
> > -@@ -96,7 +97,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
> > -         BN_div(n, rem, n, r32, ctx);
> > -         pkey->n[i] =3D BN_get_word(rem);
> > -     }
> > --    pkey->exponent =3D BN_get_word(rsa->e);
> > -+    pkey->exponent =3D BN_get_word(e);
> > -
> > - out:
> > -     BN_free(n0inv);
> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/
> ext4_utils.mk b/meta-oe/recipes-devtools/android-tools/android-tools/
> ext4_utils.mk
> > deleted file mode 100644
> > index c18aa9c4d..000000000
> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.m=
k
> > +++ /dev/null
> > @@ -1,103 +0,0 @@
> > -# Makefile for ext4_utils
> > -
> > -SRCDIR ?=3D $(S)
> > -
> > -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils
> > -make_ext4fs_SRC_FILES +=3D make_ext4fs_main.c
> > -make_ext4fs_SRC_FILES +=3D canned_fs_config.c
> > -make_ext4fs_OBJS :=3D $(make_ext4fs_SRC_FILES:.c=3D.o)
> > -
> > -ext2simg_SRC_FILES +=3D ext2simg.c
> > -ext2simg_OBJS :=3D $(ext2simg_SRC_FILES:.c=3D.o)
> > -
> > -ext4fixup_SRC_FILES +=3D ext4fixup_main.c
> > -ext4fixup_OBJS :=3D $(ext4fixup_SRC_FILES:.c=3D.o)
> > -
> > -libext4_utils_SRC_FILES +=3D make_ext4fs.c
> > -libext4_utils_SRC_FILES +=3D ext4fixup.c
> > -libext4_utils_SRC_FILES +=3D ext4_utils.c
> > -libext4_utils_SRC_FILES +=3D allocate.c
> > -libext4_utils_SRC_FILES +=3D contents.c
> > -libext4_utils_SRC_FILES +=3D extent.c
> > -libext4_utils_SRC_FILES +=3D indirect.c
> > -libext4_utils_SRC_FILES +=3D uuid.c
> > -libext4_utils_SRC_FILES +=3D sha1.c
> > -libext4_utils_SRC_FILES +=3D wipe.c
> > -libext4_utils_SRC_FILES +=3D crc16.c
> > -libext4_utils_SRC_FILES +=3D ext4_sb.c
> > -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/libsparse
> > -simg2img_SRC_FILES +=3D simg2img.c
> > -simg2img_SRC_FILES +=3D sparse_crc32.c
> > -simg2img_OBJS :=3D $(simg2img_SRC_FILES:.c=3D.o)
> > -
> > -img2simg_SRC_FILES +=3D img2simg.c
> > -img2simg_OBJS :=3D $(img2simg_SRC_FILES:.c=3D.o)
> > -
> > -simg2simg_SRC_FILES +=3D simg2simg.c
> > -simg2simg_SRC_FILES +=3D sparse_crc32.c
> > -simg2simg_OBJS :=3D $(simg2simg_SRC_FILES:.c=3D.o)
> > -
> > -libsparse_SRC_FILES +=3D backed_block.c
> > -libsparse_SRC_FILES +=3D output_file.c
> > -libsparse_SRC_FILES +=3D sparse.c
> > -libsparse_SRC_FILES +=3D sparse_crc32.c
> > -libsparse_SRC_FILES +=3D sparse_err.c
> > -libsparse_SRC_FILES +=3D sparse_read.c
> > -libsparse_OBJS :=3D $(libsparse_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/external/libselinux/src
> > -libselinux_SRC_FILES +=3D callbacks.c
> > -libselinux_SRC_FILES +=3D check_context.c
> > -libselinux_SRC_FILES +=3D freecon.c
> > -libselinux_SRC_FILES +=3D init.c
> > -libselinux_SRC_FILES +=3D label.c
> > -libselinux_SRC_FILES +=3D label_file.c
> > -libselinux_SRC_FILES +=3D label_android_property.c
> > -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)
> > -
> > -CFLAGS +=3D -DANDROID
> > -CFLAGS +=3D -DHOST
> > -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/include
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include
> > -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include
> > -CFLAGS +=3D -include
> $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> > -
> > -all: make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg
> > -
> > -make_ext4fs: libext4_utils.a libsparse.a libselinux.a
> $(make_ext4fs_OBJS)
> > -       $(CC) -o $@ $(LDFLAGS) $(make_ext4fs_OBJS) \
> > -               libext4_utils.a libsparse.a libselinux.a -lz -lpcre
> > -
> > -ext2simg: libext4_utils.a libselinux.a libsparse.a $(ext2simg_OBJS)
> > -       $(CC) -o $@ $(LDFLAGS) $(ext2simg_OBJS) \
> > -               libext4_utils.a libselinux.a libsparse.a -lz -lpcre
> > -
> > -ext4fixup: libext4_utils.a libsparse.a $(ext4fixup_OBJS)
> > -       $(CC) -o $@ $(LDFLAGS) $(ext4fixup_OBJS) libext4_utils.a
> libsparse.a -lz
> > -
> > -simg2img: libsparse.a $(simg2img_OBJS)
> > -       $(CC) -o $@ $(LDFLAGS) $(simg2img_OBJS) libsparse.a -lz
> > -
> > -img2simg: libsparse.a $(img2simg_OBJS)
> > -       $(CC) -o $@ $(LDFLAGS) $(img2simg_OBJS) libsparse.a -lz
> > -
> > -simg2simg: libsparse.a $(simg2simg_OBJS)
> > -       $(CC) -o $@ $(LDFLAGS) $(simg2simg_OBJS) libsparse.a -lz
> > -
> > -libext4_utils.a: $(libext4_utils_OBJS)
> > -       $(AR) rcs $@ $(libext4_utils_OBJS)
> > -
> > -libsparse.a: $(libsparse_OBJS)
> > -       $(AR) rcs $@ $(libsparse_OBJS)
> > -
> > -libselinux.a: $(libselinux_OBJS)
> > -       $(AR) rcs $@ $(libselinux_OBJS)
> > -
> > -clean:
> > -       $(RM) $(make_ext4fs_OBJS) $(ext2simg_OBJS) $(ext4fixup_OBJS) \
> > -               $(simg2img_OBJS) $(img2simg_OBJS) $(simg2simg_OBJS) \
> > -               $(libext4_utils_OBJS) $(libsparse_OBJS)
> $(libselinux_OBJS) \
> > -               make_ext4fs ext2simg ext4fixup simg2img img2simg
> simg2simg *.a
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_u=
tils-remove-selinux-extensions.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_u=
tils-remove-selinux-extensions.patch
> > deleted file mode 100644
> > index 4a19a5d65..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_u=
tils-remove-selinux-extensions.patch
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -From 354604da9d152f1931e91991d3f34197fc8fc759 Mon Sep 17 00:00:00 2001
> > -From: Sergio Schvezov <sergio.schvezov@canonical.com>
> > -Date: Tue, 2 Oct 2018 16:36:54 +0000
> > -Subject: [PATCH] ext4_utils: remove selinux extensions
> > -
> > -* drop useless includes of Android SELINUX extensions
> > -* avoids having to clone another module
> > -* this should be sent upstream
> > -
> > -Upstream-Status: Inappropriate
> > ----
> > - ext4_utils/make_ext4fs.c      | 1 -
> > - ext4_utils/make_ext4fs_main.c | 1 -
> > - 2 files changed, 2 deletions(-)
> > -
> > -diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c
> > -index 2f89ae8a0..732afbed7 100644
> > ---- a/ext4_utils/make_ext4fs.c
> > -+++ b/ext4_utils/make_ext4fs.c
> > -@@ -62,7 +62,6 @@
> > -
> > - #include <selinux/selinux.h>
> > - #include <selinux/label.h>
> > --#include <selinux/android.h>
> > -
> > - #define O_BINARY 0
> > -
> > -diff --git a/ext4_utils/make_ext4fs_main.c
> b/ext4_utils/make_ext4fs_main.c
> > -index a6c5f6160..f8e7b9da9 100644
> > ---- a/ext4_utils/make_ext4fs_main.c
> > -+++ b/ext4_utils/make_ext4fs_main.c
> > -@@ -32,7 +32,6 @@
> > - #ifndef USE_MINGW
> > - #include <selinux/selinux.h>
> > - #include <selinux/label.h>
> > --#include <selinux/android.h>
> > - #else
> > - struct selabel_handle;
> > - #endif
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_u=
tils-add-o-argument-to-preserve-ownership.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_u=
tils-add-o-argument-to-preserve-ownership.patch
> > deleted file mode 100644
> > index 3b50ffbf3..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_u=
tils-add-o-argument-to-preserve-ownership.patch
> > +++ /dev/null
> > @@ -1,78 +0,0 @@
> > -From b9254539811ce912bfd16dd1d185eba7a10cceff Mon Sep 17 00:00:00 2001
> > -From: Markus Mayer <mmayer@mmayer.net>
> > -Date: Wed, 7 Sep 2016 12:58:47 +0300
> > -Subject: [PATCH] ext4_utils: add -o argument to preserve ownership
> > -
> > -See also https://android-review.googlesource.com/#/c/100312/
> > -
> > -Upstream-Status: Inappropriate
> > ----
> > - ext4_utils/make_ext4fs.c      |  6 ++++++
> > - ext4_utils/make_ext4fs_main.c | 10 ++++++++--
> > - 2 files changed, 14 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c
> > -index 732afbed7..2cbf04399 100644
> > ---- a/ext4_utils/make_ext4fs.c
> > -+++ b/ext4_utils/make_ext4fs.c
> > -@@ -67,6 +67,8 @@
> > -
> > - #endif
> > -
> > -+int preserve_owner =3D 0;
> > -+
> > - /* TODO: Not implemented:
> > -    Allocating blocks in the same block group as the file inode
> > -    Hash or binary tree directories
> > -@@ -185,6 +187,10 @@ static u32 build_directory_structure(const char
> *full_path, const char *dir_path
> > -               } else {
> > -                       dentries[i].mtime =3D fixed_time;
> > -               }
> > -+              if (preserve_owner) {
> > -+                      dentries[i].uid =3D stat.st_uid;
> > -+                      dentries[i].gid =3D stat.st_gid;
> > -+              }
> > -               uint64_t capabilities;
> > -               if (fs_config_func !=3D NULL) {
> > - #ifdef ANDROID
> > -diff --git a/ext4_utils/make_ext4fs_main.c
> b/ext4_utils/make_ext4fs_main.c
> > -index f8e7b9da9..e82d43277 100644
> > ---- a/ext4_utils/make_ext4fs_main.c
> > -+++ b/ext4_utils/make_ext4fs_main.c
> > -@@ -47,13 +47,15 @@ struct selabel_handle;
> > - extern struct fs_info info;
> > -
> > -
> > -+extern int preserve_owner;
> > -+
> > - static void usage(char *path)
> > - {
> > -       fprintf(stderr, "%s [ -l <len> ] [ -j <journal size> ] [ -b
> <block_size> ]\n", basename(path));
> > -       fprintf(stderr, "    [ -g <blocks per group> ] [ -i <inodes> ] =
[
> -I <inode size> ]\n");
> > -       fprintf(stderr, "    [ -L <label> ] [ -f ] [ -a <android
> mountpoint> ]\n");
> > -       fprintf(stderr, "    [ -S file_contexts ] [ -C fs_config ] [ -T
> timestamp ]\n");
> > --      fprintf(stderr, "    [ -z | -s ] [ -w ] [ -c ] [ -J ] [ -v ] [
> -B <block_list_file> ]\n");
> > -+      fprintf(stderr, "    [ -z | -s ] [ -w ] [ -c ] [ -J ] [ -o ] [
> -v ] [ -B <block_list_file> ]\n");
> > -       fprintf(stderr, "    <filename> [<directory>]\n");
> > - }
> > -
> > -@@ -79,7 +81,7 @@ int main(int argc, char **argv)
> > -       struct selinux_opt seopts[] =3D { { SELABEL_OPT_PATH, "" } };
> > - #endif
> > -
> > --      while ((opt =3D getopt(argc, argv,
> "l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctv")) !=3D -1) {
> > -+      while ((opt =3D getopt(argc, argv,
> "l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctov")) !=3D -1) {
> > -               switch (opt) {
> > -               case 'l':
> > -                       info.len =3D parse_num(optarg);
> > -@@ -142,6 +144,10 @@ int main(int argc, char **argv)
> > -                       }
> > - #endif
> > -                       break;
> > -+              case 'o':
> > -+                      preserve_owner =3D 1;
> > -+                      printf("Warning: Enabling 'preserve ownership',
> this is an unofficial feature!\n");
> > -+                      break;
> > -               case 'v':
> > -                       verbose =3D 1;
> > -                       break;
> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/
> fastboot.mk b/meta-oe/recipes-devtools/android-tools/android-tools/
> fastboot.mk
> > deleted file mode 100644
> > index b9ba95f38..000000000
> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
> > +++ /dev/null
> > @@ -1,89 +0,0 @@
> > -# Makefile for fastboot
> > -
> > -SRCDIR ?=3D $(S)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/fastboot
> > -fastboot_SRC_FILES +=3D protocol.c
> > -fastboot_SRC_FILES +=3D engine.c
> > -fastboot_SRC_FILES +=3D bootimg.c
> > -fastboot_SRC_FILES +=3D fastboot.c
> > -fastboot_SRC_FILES +=3D util.c
> > -fastboot_SRC_FILES +=3D fs.c
> > -fastboot_SRC_FILES +=3D usb_linux.c
> > -fastboot_SRC_FILES +=3D util_linux.c
> > -fastboot_OBJS :=3D $(fastboot_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/libzipfile
> > -libzipfile_SRC_FILES +=3D centraldir.c
> > -libzipfile_SRC_FILES +=3D zipfile.c
> > -libzipfile_OBJS :=3D $(libzipfile_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils
> > -libext4_utils_SRC_FILES +=3D make_ext4fs.c
> > -libext4_utils_SRC_FILES +=3D ext4fixup.c
> > -libext4_utils_SRC_FILES +=3D ext4_utils.c
> > -libext4_utils_SRC_FILES +=3D allocate.c
> > -libext4_utils_SRC_FILES +=3D contents.c
> > -libext4_utils_SRC_FILES +=3D extent.c
> > -libext4_utils_SRC_FILES +=3D indirect.c
> > -libext4_utils_SRC_FILES +=3D uuid.c
> > -libext4_utils_SRC_FILES +=3D sha1.c
> > -libext4_utils_SRC_FILES +=3D wipe.c
> > -libext4_utils_SRC_FILES +=3D crc16.c
> > -libext4_utils_SRC_FILES +=3D ext4_sb.c
> > -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/libsparse
> > -libsparse_SRC_FILES +=3D backed_block.c
> > -libsparse_SRC_FILES +=3D output_file.c
> > -libsparse_SRC_FILES +=3D sparse.c
> > -libsparse_SRC_FILES +=3D sparse_crc32.c
> > -libsparse_SRC_FILES +=3D sparse_err.c
> > -libsparse_SRC_FILES +=3D sparse_read.c
> > -libsparse_OBJS :=3D $(libsparse_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/external/libselinux/src
> > -libselinux_SRC_FILES +=3D callbacks.c
> > -libselinux_SRC_FILES +=3D check_context.c
> > -libselinux_SRC_FILES +=3D freecon.c
> > -libselinux_SRC_FILES +=3D init.c
> > -libselinux_SRC_FILES +=3D label.c
> > -libselinux_SRC_FILES +=3D label_file.c
> > -libselinux_SRC_FILES +=3D label_android_property.c
> > -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)
> > -
> > -CFLAGS +=3D -std=3Dgnu11
> > -CFLAGS +=3D -DANDROID
> > -# CFLAGS +=3D -DUSE_F2FS
> > -CFLAGS +=3D -DHOST
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/fastboot
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/include
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/mkbootimg
> > -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils
> > -CFLAGS +=3D -I$(SRCDIR)/system/extras/f2fs_utils
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include
> > -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include
> > -CFLAGS +=3D -include
> $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> > -
> > -LIBS +=3D libzipfile.a libext4_utils.a libsparse.a libselinux.a -lz -l=
pcre
> > -
> > -all: fastboot
> > -
> > -fastboot: libzipfile.a libext4_utils.a libsparse.a libselinux.a
> $(fastboot_OBJS)
> > -       $(CC) -o $@ $(LDFLAGS) $(fastboot_OBJS) $(LIBS)
> > -
> > -libzipfile.a: $(libzipfile_OBJS)
> > -       $(AR) rcs $@ $(libzipfile_OBJS)
> > -
> > -libext4_utils.a: $(libext4_utils_OBJS)
> > -       $(AR) rcs $@ $(libext4_utils_OBJS)
> > -
> > -libsparse.a: $(libsparse_OBJS)
> > -       $(AR) rcs $@ $(libsparse_OBJS)
> > -
> > -libselinux.a: $(libselinux_OBJS)
> > -       $(AR) rcs $@ $(libselinux_OBJS)
> > -
> > -clean:
> > -       $(RM) $(fastboot_OBJS) $(libzipfile_OBJS) $(libext4_utils_OBJS)=
 \
> > -               $(libsparse_OBJS) $(libselinux_OBJS) fastboot *.a
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_r=
emove_gtest.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_r=
emove_gtest.patch
> > new file mode 100644
> > index 000000000..a04f27f10
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_compile_r=
emove_gtest.patch
> > @@ -0,0 +1,51 @@
> > +socket.h: removing dependency of gtest
> > +
> > +Removed the dependency of gtest on the build of fastboot binary.
> > +Fixes below error
> > +
> > +In file included from fastboot/fastboot.cpp:70:
> > +| In file included from fastboot/tcp.h:36:
> > +| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file not
> found
> > +| #include <gtest/gtest_prod.h>
> > +|          ^~~~~~~~~~~~~~~~~~~~
> > +| 1 error generated.
> > +| In file included from fastboot/socket.cpp:29:
> > +| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file not
> found
> > +| #include <gtest/gtest_prod.h>
> > +|          ^~~~~~~~~~~~~~~~~~~~
> > +| 1 error generated.
> > +| In file included from fastboot/tcp.cpp:29:
> > +| In file included from fastboot/tcp.h:36:
> > +| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file not
> found
> > +| #include <gtest/gtest_prod.h>
> > +|          ^~~~~~~~~~~~~~~~~~~~
> > +| 1 error generated.
> > +| In file included from fastboot/udp.cpp:31:
> > +| In file included from fastboot/udp.h:34:
> > +| fastboot/socket.h:43:10: fatal error: 'gtest/gtest_prod.h' file not
> found
> > +| #include <gtest/gtest_prod.h>
> > +|          ^~~~~~~~~~~~~~~~~~~~
> > +| 1 error generated.
> > +
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +--- a/system/core/fastboot/socket.h       2021-04-14 21:14:00.35597391=
5
> +0000
> > ++++ b/system/core/fastboot/socket.h   2021-04-14 21:14:21.879680699
> +0000
> > +@@ -40,7 +40,6 @@
> > +
> > + #include <android-base/macros.h>
> > + #include <cutils/sockets.h>
> > +-#include <gtest/gtest_prod.h>
> > +
> > + // Socket interface to be implemented for each platform.
> > + class Socket {
> > +@@ -119,8 +118,6 @@
> > +             socket_send_buffers_function_ =3D &socket_send_buffers;
> > +
> > +   private:
> > +-    FRIEND_TEST(SocketTest, TestTcpSendBuffers);
> > +-    FRIEND_TEST(SocketTest, TestUdpSendBuffers);
> > +
> > +     DISALLOW_COPY_AND_ASSIGN(Socket);
> > + };
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change=
_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change=
_out_dir.patch
> > new file mode 100644
> > index 000000000..c8904f045
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk_change=
_out_dir.patch
> > @@ -0,0 +1,52 @@
> > +patching fastboot.mk to build in yocto environment.
> > +
> > +Changes include:
> > +Introduced an output folder which will keep all the outputs from the
> > +android-tools.
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary to the OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +--- git/system/core/debian/fastboot.mk 2021-05-17 07:47:56.800224043
> +0000
> > ++++ git/system/core/debian/fastboot.mk 2021-05-17 07:49:40.130383096
> +0000
> > +@@ -1,3 +1,4 @@
> > ++include ../../rules_yocto.mk
> > + NAME =3D fastboot
> > + fastboot_SOURCES =3D \
> > +           bootimg_utils.cpp \
> > +@@ -38,11 +39,11 @@
> > +             -Ifs_mgr/liblp/include \
> > +             -I/usr/include/android/openssl \
> > +             -Ilibsparse/include \
> > +-            -Ilibziparchive/include
> > ++            -Ilibziparchive/include -I$(OUT_DIR)/usr/include/
> > + LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +            -fuse-ld=3Dgold \
> > +-           -Wl,-rpath-link=3D. \
> > +-           -L. -lziparchive -lsparse -lbase -lcutils -ladb -lcrypto
> -lext4_utils \
> > ++
>  -Wl,-rpath-link=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -lziparchive -lsparse -lbase -lcutils -ladb -lcrypto -lext4_utils \
> > +            -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +            -l7z \
> > +
> > +@@ -53,7 +54,8 @@
> > + endif
> > +
> > + build: $(SOURCES)
> > +-      $(CXX) $^ -o fastboot/$(NAME) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS=
)
> > ++      mkdir --parents $(OUT_DIR)/usr/bin/fastboot
> > ++      $(CXX) $^ -o $(OUT_DIR)/usr/bin/fastboot/$(NAME) $(CXXFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> > +
> > + clean:
> > +-      $(RM) fastboot/$(NAME)
> > ++      $(RM) $(OUT_DIR)/usr/bin/fastboot/$(NAME)
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/gitignore
> b/meta-oe/recipes-devtools/android-tools/android-tools/gitignore
> > deleted file mode 100644
> > index b034c10a1..000000000
> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/gitignore
> > +++ /dev/null
> > @@ -1,59 +0,0 @@
> > -*
> > -!.gitignore
> > -!*.indirectionsymlink
> > -!*.[ch]
> > -!*.mk
> > -!*.patch
> > -!*.service
> > -!NOTICE
> > -!MODULE_LICENSE_*
> > -!/system/
> > -!/system/core/
> > -!/system/core/adb/
> > -!/system/core/fastboot/
> > -!/system/core/fs_mgr/
> > -!/system/core/fs_mgr/include/
> > -!/system/core/include/
> > -!/system/core/include/android/
> > -!/system/core/include/cutils/
> > -!/system/core/include/log/
> > -!/system/core/include/mincrypt/
> > -!/system/core/include/private/
> > -!/system/core/include/utils/
> > -!/system/core/include/zipfile/
> > -!/system/core/liblog/
> > -!/system/core/liblog/tests/
> > -!/system/core/libcutils/
> > -!/system/core/libmincrypt/
> > -!/system/core/libzipfile/
> > -!/system/core/libsparse/
> > -!/system/core/libsparse/include/
> > -!/system/core/libsparse/include/sparse/
> > -!/system/core/libsparse/simg_dump.py
> > -!/system/core/mkbootimg/
> > -!/system/extras/
> > -!/system/extras/ext4_utils/
> > -!/system/extras/ext4_utils/mkuserimg.sh
> > -!/system/extras/ext4_utils/test_ext4fixup
> > -!/system/extras/f2fs_utils/
> > -!/hardware/
> > -!/hardware/libhardware/
> > -!/hardware/libhardware/include/
> > -!/hardware/libhardware/include/hardware/
> > -!/external/
> > -!/external/libselinux/
> > -!/external/libselinux/include/
> > -!/external/libselinux/include/selinux/
> > -!/external/libselinux/src/
> > -!/external/f2fs-tools/
> > -!/external/f2fs-tools/include/
> > -!/external/f2fs-tools/lib/
> > -!/external/f2fs-tools/mkfs/
> > -!/build/
> > -!/build/core/
> > -!/build/core/version_defaults.mk
> > -!/build/core/combo/
> > -!/build/core/combo/include/
> > -!/build/core/combo/include/arch/
> > -!/build/core/combo/include/arch/linux-*/
> > -!/build/core/combo/include/arch/linux-*/AndroidConfig.h
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_ou=
t_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_ou=
t_dir.patch
> > new file mode 100644
> > index 000000000..6913c4b98
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/img2simg_change_ou=
t_dir.patch
> > @@ -0,0 +1,41 @@
> > +patching img2simg.mk to build in yocto environment.
> > +
> > +Changes include:
> > +Introduced an output folder which will keep all the outputs from the
> > +android-tools.
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary to the OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +--- git/system/core/debian/img2simg.mk 2021-05-12 09:05:38.580607289
> +0000
> > ++++ git/system/core/debian/img2simg.mk 2021-05-12 09:09:04.331908253
> +0000
> > +@@ -1,13 +1,14 @@
> > ++include ../../rules_yocto.mk
> > + NAME =3D img2simg
> > + SOURCES =3D img2simg.cpp
> > + SOURCES :=3D $(foreach source, $(SOURCES), libsparse/$(source))
> > + CPPFLAGS +=3D -Ilibsparse/include -Iinclude -std=3Dgnu++17
> > +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +-           -Wl,-rpath-link=3D. \
> > +-           -L. -lsparse
> > ++LDFLAGS +=3D -Wl,-rpath=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/an=
droid
> \
> > ++
>  -Wl,-rpath-link=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ -lspar=
se
> > +
> > + build: $(SOURCES)
> > +-      $(CXX) $^ -o libsparse/$(NAME) $(CPPFLAGS) $(LDFLAGS)
> > ++      $(CXX) $^ -o $(OUT_DIR)/usr/bin/$(NAME) $(CPPFLAGS) $(LDFLAGS)
> > +
> > + clean:
> > +-      $(RM) libsparse/$(NAME)
> > ++      $(RM) $(OUT_DIR)/usr/bin/$(NAME)
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_o=
ut_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_o=
ut_dir.patch
> > new file mode 100644
> > index 000000000..7094ccaa9
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_change_o=
ut_dir.patch
> > @@ -0,0 +1,44 @@
> > +libadb.mk: modifications to make it build in yocto environment
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary to the OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +--- git/system/core/debian/libadb.mk   2021-04-30 16:29:34.596618862
> +0200
> > ++++ git/system/core/debian/libadb.mk   2021-04-30 16:36:53.932837490
> +0200
> > +@@ -1,3 +1,4 @@
> > ++include ../../rules_yocto.mk
> > + NAME :=3D libadb
> > +
> > + LIBADB_SRC_FILES :=3D \
> > +@@ -43,18 +44,18 @@
> > +             -Ibase/include \
> > +             -Idiagnose_usb/include \
> > +             -Ilibcrypto_utils/include \
> > +-            -Iinclude \
> > ++            -Iinclude -I$(OUT_DIR)/usr/include \
> > +             -DPLATFORM_TOOLS_VERSION=3D'"$(PLATFORM_TOOLS_VERSION)"' =
\
> > +             -DADB_HOST=3D1 -DADB_VERSION=3D'"$(DEB_VERSION)"'
> > +
> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android -lcrypto \
> > +-           -lpthread -L. -lbase -lcutils -lcrypto_utils -lusb-1.0
> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android -lcrypt=
o
> \
> > ++           -lpthread -lbase -lcutils -lcrypto_utils -lusb-1.0
> > +
> > + $(NAME).so: $(SOURCES)
> > +-      $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 $(NAME).so
> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> > +
> > + transport_mdns_unsupported.cpp:
> > +       echo 'void init_mdns_transport_discovery(void) {}' >
> transport_mdns_unsupported.cpp
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_ch=
ange_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_ch=
ange_out_dir.patch
> > new file mode 100644
> > index 000000000..464b63de2
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libbacktrace_mk_ch=
ange_out_dir.patch
> > @@ -0,0 +1,60 @@
> > +patching libbacktrace.mk to build in yocto environment.
> > +
> > +Changes include:
> > +Introduced an output folder which will keep all the outputs from the
> > +android-tools.
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary to the OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +--- git/system/core/debian/libbacktrace.mk     2021-05-21
> 23:51:55.022408433 +0000
> > ++++ git/system/core/debian/libbacktrace.mk     2021-05-21
> 23:53:07.487543521 +0000
> > +@@ -1,5 +1,6 @@
> > +-
> > +-include /usr/share/dpkg/architecture.mk
> > ++include ../../rules_yocto.mk
> > ++#pass architecture specific info to makefile
> > ++DEB_HOST_ARCH=3D${deb_host_arch}
> > +
> > + NAME =3D libbacktrace
> > +
> > +@@ -88,11 +89,11 @@
> > +             -Ilibprocinfo/include \
> > +             -Ilibunwindstack/include \
> > +             -I/usr/include/android/lzma \
> > +-            -I/usr/include/android/unwind
> > ++            -I$(OUT_DIR)/usr/include/android/libunwind
> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android -lunwind \
> > +-           -L. -lbase -llog -lpthread -l7z
> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android -lunwin=
d
> \
> > ++           -lbase -llog -lpthread -l7z
> > +
> > + # -latomic should be the last library specified
> > + # https://github.com/android/ndk/issues/589
> > +@@ -104,11 +105,11 @@
> > + endif
> > +
> > + build: $(COBJECTS) $(CXXOBJECTS) $(OBJECTS_ASSEMBLY)
> > +-      $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 $(NAME).so
> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
> > ++      ln -s
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(NAME).so
> > +
> > + clean:
> > +-      $(RM) $(COBJECTS) $(CXXOBJECTS) $(NAME).so*
> > ++      $(RM) $(COBJECTS) $(CXXOBJECTS)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> > +
> > + $(CXXOBJECTS): %.o: %.cpp
> > +       $(CXX) $< -o $@ $(CXXFLAGS) $(CPPFLAGS)
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_=
out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_=
out_dir.patch
> > new file mode 100644
> > index 000000000..37c93d6d0
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_change_=
out_dir.patch
> > @@ -0,0 +1,33 @@
> > +libbase.mk: modifications to make it build in yocto environment
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary to the OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +--- git/system/core/debian/libbase.mk  2021-04-29 22:01:13.664181133
> +0200
> > ++++ git/system/core/debian/libbase.mk  2021-04-29 22:04:52.328123833
> +0200
> > +@@ -1,3 +1,4 @@
> > ++include ../../rules_yocto.mk
> > + NAME =3D libbase
> > + SOURCES =3D \
> > +           chrono_utils.cpp \
> > +@@ -20,8 +21,9 @@
> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0
> > +
> > + build: $(SOURCES)
> > +-      $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 $(NAME).so
> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> > ++      cp -r base/include/* $(OUT_DIR)/usr/include/
> > +
> > + clean:
> > +-      $(RM) $(NAME).so*
> > ++      $(RM)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_chang=
e_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_chang=
e_out_dir.patch
> > new file mode 100644
> > index 000000000..f70590977
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_mk_chang=
e_out_dir.patch
> > @@ -0,0 +1,30 @@
> > +libcrypto.mk: modifications to make it build in yocto environment
> > +
> > +Adding an include file that is setting the common flags.
> > +
> > +Modified the build rule so that it outputs the binary and include
> > +to the OUT_DIR
> > +
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +--- git/external/boringssl/debian/libcrypto.mk 2021-04-30
> 11:32:40.610312307 +0000
> > ++++ git/external/boringssl/debian/libcrypto.mk 2021-04-30
> 11:36:47.738318880 +0000
> > +@@ -1,3 +1,4 @@
> > ++include ../../rules_yocto.mk
> > + include sources.mk
> > +
> > + NAME =3D libcrypto
> > +@@ -26,6 +27,8 @@
> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 -lpthread
> > +
> > + build: $(SOURCES)
> > +-      mkdir --parents debian/out
> > +-      $(CC) $^ -o debian/out/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS)
> $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 debian/out/$(NAME).so
> > +\ No newline at end of file
> > ++      mkdir --parents $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/androi=
d/
> > ++      mkdir --parents $(OUT_DIR)/usr/include
> > ++      $(CC) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS)
> $(CPPFLAGS) $(LDFLAGS) -DOPENSSL_NO_ASM
> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> > ++      cp -r include/openssl $(OUT_DIR)/usr/include
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk=
_change_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk=
_change_out_dir.patch
> > new file mode 100644
> > index 000000000..a0dd34876
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_utils_mk=
_change_out_dir.patch
> > @@ -0,0 +1,38 @@
> > +libcrypto_utils.mk: modifications to make it build in yocto environmen=
t
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary and header to th=
e
> OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +--- git/system/core/debian/libcrypto_utils.mk  2021-04-30
> 14:18:54.071379767 +0200
> > ++++ git/system/core/debian/libcrypto_utils.mk  2021-04-30
> 14:22:46.179047308 +0200
> > +@@ -1,15 +1,17 @@
> > ++include ../../rules_yocto.mk
> > + NAME:=3D libcrypto_utils
> > + SOURCES :=3D android_pubkey.c
> > + SOURCES :=3D $(foreach source, $(SOURCES), libcrypto_utils/$(source))
> > +-CPPFLAGS +=3D -Ilibcrypto_utils/include -Iinclude
> > ++CPPFLAGS +=3D -Ilibcrypto_utils/include -Iinclude
> -I$(OUT_DIR)/usr/include
> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> > +       -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +-      -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > ++      -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +       -lcrypto -Wl,-z,defs
> > +
> > + build: $(SOURCES)
> > +-      $(CC) $^ -o $(NAME).so.0  $(CPPFLAGS) $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 $(NAME).so
> > ++      $(CC) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0  $(CPPFLAGS=
)
> $(LDFLAGS)
> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> > ++      cp -r libcrypto_utils/include/* $(OUT_DIR)/usr/include/
> > +
> > + clean:
> > +-      $(RM) $(NAME).so*
> > ++      $(RM)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_chang=
e_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_chang=
e_out_dir.patch
> > new file mode 100644
> > index 000000000..5539eb91d
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libcutils_mk_chang=
e_out_dir.patch
> > @@ -0,0 +1,27 @@
> > +--- git/system/core/debian/libcutils.mk        2021-05-17
> 06:38:40.105161629 +0000
> > ++++ git/system/core/debian/libcutils.mk        2021-05-17
> 06:42:37.141912366 +0000
> > +@@ -1,3 +1,4 @@
> > ++include ../../rules_yocto.mk
> > + NAME =3D libcutils
> > +
> > + # copied from libcutils/Android.bp
> > +@@ -50,14 +51,15 @@
> > +             -Iinclude \
> > +
> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> > +-           -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android -lpthr=
ead
> -L. -llog -lbase
> > ++           -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android -lpthr=
ead
> -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ -llog -lbase
> > +
> > + build: $(COBJECTS) $(CXXOBJECTS)
> > +-      $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 $(NAME).so
> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> > ++      cp -r libcutils/include/cutils $(OUT_DIR)/usr/include/
> > +
> > + clean:
> > +-      $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*
> > ++      $(RM) $(CXXOBJECTS) $(COBJECTS)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> > +
> > + $(COBJECTS): %.o: %.c
> > +       $(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_c=
hange_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_c=
hange_out_dir.patch
> > new file mode 100644
> > index 000000000..efccfab9c
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libext4_utils_mk_c=
hange_out_dir.patch
> > @@ -0,0 +1,42 @@
> > +libext4_utils.mk: modifications to make it build in yocto environment
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary and header to th=
e
> OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +--- git/system/extras/debian/libext4_utils.mk  2021-04-29
> 21:46:39.384394114 +0000
> > ++++ git/system/extras/debian/libext4_utils.mk  2021-04-29
> 21:49:53.808605543 +0000
> > +@@ -1,3 +1,4 @@
> > ++include ../../rules_yocto.mk
> > + NAME =3D libext4_utils
> > +
> > + ext4_utils_SOURCES :=3D \
> > +@@ -17,14 +18,16 @@
> > +             -Iext4_utils/include \
> > +             -Ilibfec/include \
> > +             -Isquashfs_utils \
> > +-            -I/usr/include/android \
> > ++            -I/usr/include/android -I$(OUT_DIR)/usr/include \
> > +             -D_GNU_SOURCE -DFEC_NO_KLOG -DSQUASHFS_NO_KLOG
> -D_LARGEFILE64_SOURCE
> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
> > +            -lbase -lsparse -lselinux
> > +
> > + build: $(SOURCES)
> > +-      mkdir --parents $(OUT_DIR)
> > +-      $(CC) $^ -o $(OUT_DIR)/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS)
> $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 $(OUT_DIR)/$(NAME).so
> > ++      mkdir --parents $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/androi=
d/
> > ++      $(CC) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> > ++      cp -r ext4_utils/include/* $(OUT_DIR)/usr/include/
> > ++
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_o=
ut_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_o=
ut_dir.patch
> > new file mode 100644
> > index 000000000..0f8184d41
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_change_o=
ut_dir.patch
> > @@ -0,0 +1,35 @@
> > +--- git/system/extras/debian/libfec.mk 2021-05-17 06:55:51.973044031
> +0000
> > ++++ git/system/extras/debian/libfec.mk 2021-05-17 06:56:41.940185413
> +0000
> > +@@ -1,3 +1,4 @@
> > ++include ../../rules_yocto.mk
> > + NAME =3D libfec
> > +
> > + # copied from libfec/Android.bp
> > +@@ -12,20 +13,21 @@
> > + CXXFLAGS +=3D -fno-strict-aliasing -std=3Dg++17
> > + CPPFLAGS +=3D \
> > +             -Iext4_utils/include \
> > +-            -Ilibfec/include \
> > ++            -Ilibfec/include -I $(OUT_DIR)/usr/include \
> > +             -D_GNU_SOURCE -DFEC_NO_KLOG -D_LARGEFILE64_SOURCE
> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +-           -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +            -lbase -lsparse -lselinux
> > +
> > + build: $(COBJECTS) $(CXXOBJECTS)
> > +-      mkdir -p $(OUT_DIR)
> > +-      $(CXX) $^ -o $(OUT_DIR)/$(NAME).so.0 $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 $(OUT_DIR)/$(NAME).so
> > ++      mkdir -p $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android
> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> > ++      cp -r libfec/include/* $(OUT_DIR)/usr/include/
> > +
> > + clean:
> > +-      $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*
> > ++      $(RM) $(CXXOBJECTS) $(COBJECTS)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> > +
> > + $(COBJECTS): %.o: %.c
> > +       $(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_o=
ut_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_o=
ut_dir.patch
> > new file mode 100644
> > index 000000000..09ef1871b
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_change_o=
ut_dir.patch
> > @@ -0,0 +1,42 @@
> > +patching liblog.mk to build in yocto environment.
> > +
> > +Changes include:
> > +Introduced an output folder which will keep all the outputs from the
> > +android-tools.
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary to the OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +--- git/system/core/debian/liblog.mk   2021-05-17 08:13:28.304700936
> +0000
> > ++++ git/system/core/debian/liblog.mk   2021-05-17 08:15:59.590064282
> +0000
> > +@@ -1,3 +1,4 @@
> > ++include ../../rules_yocto.mk
> > + NAME =3D liblog
> > +
> > + # copied from liblog/Android.bp
> > +@@ -39,11 +40,12 @@
> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 -lpthread
> > +
> > + build: $(COBJECTS) $(CXXOBJECTS)
> > +-      $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 $(NAME).so
> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> > ++      cp -r liblog/include/* $(OUT_DIR)/usr/include/
> > +
> > + clean:
> > +-      $(RM) $(COBJECTS) $(CXXOBJECTS) $(NAME).so*
> > ++      $(RM) $(COBJECTS) $(CXXOBJECTS)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> > +
> > + $(COBJECTS): %.o: %.c
> > +       $(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Re=
move-bionic-specific-calls.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Re=
move-bionic-specific-calls.patch
> > deleted file mode 100644
> > index 9de2593df..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Re=
move-bionic-specific-calls.patch
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -From 36654a4484117e5f4d63a810c0d94bc9c7ee3a83 Mon Sep 17 00:00:00 2001
> > -From: Fathi Boudra <fabo@debian.org>
> > -Date: Tue, 2 Oct 2018 16:36:54 +0000
> > -Subject: [PATCH] Remove bionic specific calls
> > -
> > -Upstream-Status: Inappropriate
> > -
> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ----
> > - src/procattr.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/src/procattr.c b/src/procattr.c
> > -index f350808..761cf8e 100644
> > ---- a/src/procattr.c
> > -+++ b/src/procattr.c
> > -@@ -8,7 +8,7 @@
> > - #include "selinux_internal.h"
> > - #include "policy.h"
> > -
> > --#ifdef HOST
> > -+#ifndef __BIONIC__
> > - static pid_t gettid(void)
> > - {
> > -       return syscall(__NR_gettid);
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-li=
bselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-li=
bselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
> > deleted file mode 100644
> > index 87771cba8..000000000
> > ---
> a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-li=
bselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
> > +++ /dev/null
> > @@ -1,49 +0,0 @@
> > -From f4f9d24860e1b5cd4f6a014f3fda7cd33ebe5be7 Mon Sep 17 00:00:00 2001
> > -From: Petr Lautrbach <plautrba@redhat.com>
> > -Date: Sat, 27 Jul 2019 08:20:20 -0700
> > -Subject: [PATCH] libselinux: Do not define gettid() if glibc >=3D 2.30=
 is
> used
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -Since version 2.30 glibc implements gettid() system call wrapper, see
> > -https://sourceware.org/bugzilla/show_bug.cgi?id=3D6399
> > -
> > -Fixes:
> > -cc -O2 -g -pipe -Wall -Werror=3Dformat-security -Wp,-D_FORTIFY_SOURCE=
=3D2
> -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong
> -grecord-gcc-switches -specs=3D/usr/lib/rpm/redhat/redhat-hardened-cc1
> -specs=3D/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=3Dgeneric
> -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection
> -I../include -D_GNU_SOURCE  -DNO_ANDROID_BACKEND   -c -o procattr.o
> procattr.c
> > -procattr.c:28:14: error: static declaration of =E2=80=98gettid=E2=80=
=99 follows
> non-static declaration
> > -   28 | static pid_t gettid(void)
> > -      |              ^~~~~~
> > -In file included from /usr/include/unistd.h:1170,
> > -                 from procattr.c:2:
> > -/usr/include/bits/unistd_ext.h:34:16: note: previous declaration of
> =E2=80=98gettid=E2=80=99 was here
> > -   34 | extern __pid_t gettid (void) __THROW;
> > -      |                ^~~~~~
> > -
> > -Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
> > -Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - src/procattr.c | 14 +++++++++++++-
> > - 1 file changed, 13 insertions(+), 1 deletion(-)
> > -
> > ---- a/src/procattr.c
> > -+++ b/src/procattr.c
> > -@@ -8,12 +8,16 @@
> > - #include "selinux_internal.h"
> > - #include "policy.h"
> > -
> > --#ifndef __BIONIC__
> > -+/* Bionic and glibc >=3D 2.30 declare gettid() system call wrapper in
> unistd.h and
> > -+ * has a definition for it */
> > -+#if defined(__GLIBC_)
> > -+#if !__GLIBC_PREREQ(2,30)
> > - static pid_t gettid(void)
> > - {
> > -       return syscall(__NR_gettid);
> > - }
> > - #endif
> > -+#endif
> > -
> > - static int getprocattrcon(char ** context,
> > -                         pid_t pid, const char *attr)
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_chang=
e_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_chang=
e_out_dir.patch
> > new file mode 100644
> > index 000000000..4f8bb44a4
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libsparse_mk_chang=
e_out_dir.patch
> > @@ -0,0 +1,47 @@
> > +patching libsparse.mk to build in yocto environment.
> > +
> > +Changes include:
> > +Introduced an output folder which will keep all the outputs from the
> > +android-tools.
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary to the OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +--- git/system/core/debian/libsparse.mk        2021-05-17
> 08:13:34.764584388 +0000
> > ++++ git/system/core/debian/libsparse.mk        2021-05-17
> 08:15:34.850492654 +0000
> > +@@ -1,3 +1,4 @@
> > ++include ../../rules_yocto.mk
> > + NAME =3D libsparse
> > + SOURCES =3D \
> > +         backed_block.cpp \
> > +@@ -18,16 +19,16 @@
> > +   -shared -Wl,-soname,$(NAME).so.0 \
> > +   -lz \
> > +   -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +-  -L. \
> > ++  -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \
> > +   -lbase
> > +
> > +
> > + build: $(COBJECTS) $(CXXOBJECTS)
> > +-      $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 $(NAME).so
> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(LDFLAGS)
> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> > +
> > + clean:
> > +-      $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*
> > ++      $(RM) $(CXXOBJECTS) $(COBJECTS)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> > +
> > + $(COBJECTS): %.o: %.c
> > +       $(CC) $< -o $@ $(CFLAGS) $(CPPFLAGS)
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_chang=
e_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_chang=
e_out_dir.patch
> > new file mode 100644
> > index 000000000..237d45c3c
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libunwind_mk_chang=
e_out_dir.patch
> > @@ -0,0 +1,47 @@
> > +patching libundwind to build in yocto environment.
> > +
> > +Changes include:
> > +Introduced an output folder which will keep all the outputs from the
> > +android-tools.
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary to the OUT_DIR
> > +
> > +Passing the architecture details($CPU)from the recipe.
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +--- git/external/libunwind/debian/libunwind.mk 2021-05-22
> 02:29:52.950324653 +0000
> > ++++ git/external/libunwind/debian/libunwind.mk 2021-05-22
> 02:30:48.535322846 +0000
> > +@@ -1,4 +1,4 @@
> > +-include debian/detect_arch.mk
> > ++include ../../rules_yocto.mk
> > +
> > + ARCH_SOURCES =3D is_fpreg.c \
> > +                regname.c \
> > +@@ -131,10 +131,12 @@
> > + CPPFLAGS +=3D -Iinclude -Isrc $($(CPU)_INCLUDES) -Idebian/include
> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +-           -lpthread -nostdlib -lc -lgcc -Ldebian/out -l7z
> > ++           -lpthread -nostdlib -lc -lgcc -l7z
> > +
> > + build: $(SOURCES)
> > +-      mkdir --parents debian/out
> > +-      ln -s /usr/lib/p7zip/7z.so debian/out/lib7z.so
> > +-      $(CC) $^ -o debian/out/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS)
> $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 debian/out/$(NAME).so
> > ++      mkdir --parents $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/androi=
d/
> > ++      mkdir --parents $(OUT_DIR)/usr/include/android/libunwind
> > ++      $(CC) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CFLAGS)
> $(CPPFLAGS) $(LDFLAGS) -Wno-header-guard -Wno-absolute-value
> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> > ++      cp -r include/* debian/include/*
> $(OUT_DIR)/usr/include/android/libunwind/
> > ++
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_c=
hange_out_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_c=
hange_out_dir.patch
> > new file mode 100644
> > index 000000000..cc9997dac
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/libziparchive_mk_c=
hange_out_dir.patch
> > @@ -0,0 +1,47 @@
> > +patching libziparchive.mk to build in yocto environment.
> > +
> > +Changes include:
> > +Introduced an output folder which will keep all the outputs from the
> > +android-tools.
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary to the OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +--- git/system/core/debian/libziparchive.mk    2021-05-17
> 08:13:41.684459540 +0000
> > ++++ git/system/core/debian/libziparchive.mk    2021-05-17
> 08:16:19.293722572 +0000
> > +@@ -1,3 +1,4 @@
> > ++include ../../rules_yocto.mk
> > + NAME =3D libziparchive
> > + SOURCES =3D zip_archive.cc \
> > +           zip_archive_stream_entry.cc\
> > +@@ -5,14 +6,15 @@
> > + SOURCES :=3D $(foreach source, $(SOURCES), libziparchive/$(source))
> > + CXXFLAGS +=3D -std=3Dgnu++17
> > + CPPFLAGS +=3D -DZLIB_CONST -D_FILE_OFFSET_BITS=3D64 \
> > +-            -Iinclude -Ibase/include -Ilibziparchive/include
> > ++            -Iinclude -Ibase/include -Ilibziparchive/include
> -I$(OUT_DIR)/usr/include/
> > + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \
> > +            -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +-           -lz -L. -llog -lbase
> > ++           -lz -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android
> -llog -lbase
> > +
> > + build: $(SOURCES)
> > +-      $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
> > +-      ln -s $(NAME).so.0 $(NAME).so
> > ++      $(CXX) $^ -o
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so.0 $(CXXFLAGS)
> $(CPPFLAGS) $(LDFLAGS)
> > ++      ln -s $(NAME).so.0
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so
> > ++      cp -r libziparchive/include/* $(OUT_DIR)/usr/include/
> > +
> > + clean:
> > +-      $(RM) $(NAME).so*
> > ++      $(RM)
> $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*
> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/
> mkbootimg.mk b/meta-oe/recipes-devtools/android-tools/android-tools/
> mkbootimg.mk
> > deleted file mode 100644
> > index 519f609fd..000000000
> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -# Makefile for mkbootimg
> > -
> > -SRCDIR ?=3D $(S)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/mkbootimg
> > -mkbootimg_SRC_FILES +=3D mkbootimg.c
> > -mkbootimg_OBJS :=3D $(mkbootimg_SRC_FILES:.c=3D.o)
> > -
> > -VPATH +=3D $(SRCDIR)/system/core/libmincrypt
> > -libmincrypt_SRC_FILES :=3D dsa_sig.c p256.c p256_ec.c p256_ecdsa.c rsa=
.c
> sha.c sha256.c
> > -libmincrypt_OBJS :=3D $(libmincrypt_SRC_FILES:.c=3D.o)
> > -
> > -CFLAGS +=3D -DANDROID
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/mkbootimg
> > -CFLAGS +=3D -I$(SRCDIR)/system/core/include
> > -CFLAGS +=3D -include
> $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
> > -
> > -LIBS +=3D libmincrypt.a
> > -
> > -all: mkbootimg
> > -
> > -mkbootimg: libmincrypt.a $(mkbootimg_OBJS)
> > -       $(CC) -o $@ $(LDFLAGS) $(mkbootimg_OBJS) $(LIBS)
> > -
> > -libmincrypt.a: $(libmincrypt_OBJS)
> > -       $(AR) rcs $@ $(libmincrypt_OBJS)
> > -
> > -clean:
> > -       $(RM) $(mkbootimg_OBJS) $(libmincrypt_OBJS) mkbootimg *.a
> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/
> rules_yocto.mk b/meta-oe/recipes-devtools/android-tools/android-tools/
> rules_yocto.mk
> > new file mode 100644
> > index 000000000..5e217f47f
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/android-tools/android-tools/
> rules_yocto.mk
> > @@ -0,0 +1,4 @@
> > +CPPFLAGS +=3D -fPIC
> > +ifndef OUT_DIR
> > +OUT_DIR =3D ../../debian/out
> > +endif
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_ou=
t_dir.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_ou=
t_dir.patch
> > new file mode 100644
> > index 000000000..d17adfffd
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/simg2img_change_ou=
t_dir.patch
> > @@ -0,0 +1,41 @@
> > +patching simg2img.mk to build in yocto environment.
> > +
> > +Changes include:
> > +Introduced an output folder which will keep all the outputs from the
> > +android-tools.
> > +
> > +Adding an include file that is setting the common flags.
> > +Changed the cppflag to include the headers from other components
> > +of android-tools
> > +
> > +Modified LDflags so that the libraries that are coming from other
> android-tools
> > +are searched in the output folder.
> > +
> > +Modified the build rule so that it outputs the binary to the OUT_DIR
> > +
> > +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +--- git/system/core/debian/simg2img.mk 2021-05-12 09:47:52.577840520
> +0000
> > ++++ git/system/core/debian/simg2img.mk 2021-05-12 09:51:43.525678276
> +0000
> > +@@ -1,13 +1,14 @@
> > ++include ../../rules_yocto.mk
> > + NAME =3D simg2img
> > + SOURCES =3D simg2img.cpp sparse_crc32.cpp
> > + SOURCES :=3D $(foreach source, $(SOURCES), libsparse/$(source))
> > + CPPFLAGS +=3D -Ilibsparse/include -Iinclude -std=3Dgnu++17
> > +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > +-           -Wl,-rpath-link=3D. \
> > +-           -L. -lsparse
> > ++LDFLAGS +=3D -Wl,-rpath=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/an=
droid
> \
> > ++
>  -Wl,-rpath-link=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android \
> > ++           -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android -lspars=
e
> > +
> > + build: $(SOURCES)
> > +-      $(CXX) $^ -o libsparse/$(NAME) $(CPPFLAGS) $(LDFLAGS)
> > ++      $(CXX) $^ -o $(OUT_DIR)/usr/bin/$(NAME) $(CPPFLAGS) $(LDFLAGS)
> > +
> > + clean:
> > +-      $(RM) libsparse/$(NAME)
> > ++      $(RM) $(OUT_DIR)/usr/bin/$(NAME)
> > diff --git
> a/meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std=
_to_compile_libbacktrace.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std=
_to_compile_libbacktrace.patch
> > new file mode 100644
> > index 000000000..079ade46b
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/android-tools/android-tools/use_name_space_std=
_to_compile_libbacktrace.patch
> > @@ -0,0 +1,19 @@
> > +To Fix the below error
> > +
> > + In file included from libunwindstack/DwarfSection.cpp:21:
> > +| libunwindstack/include/unwindstack/DwarfMemory.h:32:29: error:
> unknown type name 'size_t'; did you mean 'std::size_t'?
> > +|   bool ReadBytes(void* dst, size_t num_bytes);
> > +|                             ^~~~~~
> > +|                             std::size_t
> > +
> > +--- ./system/core/libunwindstack/include/unwindstack/DwarfMemory.h
>  2021-05-22 00:52:15.132452862 +0000
> > ++++ ./system/core/libunwindstack/include/unwindstack/DwarfMemory.h
>  2021-05-22 00:53:09.793416724 +0000
> > +@@ -23,7 +23,7 @@
> > +
> > + // Forward declarations.
> > + class Memory;
> > +-
> > ++using namespace std;
> > + class DwarfMemory {
> > +  public:
> > +   DwarfMemory(Memory* memory) : memory_(memory) {}
> > diff --git a/meta-oe/recipes-devtools/android-tools/
> android-tools_10.0.0.r36.bb b/meta-oe/recipes-devtools/android-tools/
> android-tools_10.0.0.r36.bb
> > new file mode 100644
> > index 000000000..02c669582
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/android-tools/android-tools_10.0.0.r36.b=
b
> > @@ -0,0 +1,204 @@
> > +DESCRIPTION =3D "Different utilities from Android"
> > +SECTION =3D "console/utils"
> > +LICENSE =3D "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D " \
> > +
> file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a00=
96b10
> \
> > +
> file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd6425610833=
a22dbe6
> \
> > +
> file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1bc=
15da69f
> \
> > +
> file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e2=
03a55f9
> \
> > +"
> > +DEPENDS =3D "libbsd libpcre zlib libcap libusb squashfs-tools p7zip
> libselinux"
> > +
> > +ANDROID_MIRROR =3D "android.googlesource.com"
> > +
> > +# matches with 10.0.0+r36
> > +SRCREV_boringssl =3D "ae2dd49c7cb74d04bdba7c1c9bd62c1e9cdf98f6"
> > +SRCREV_core =3D "5aa13b053182b758d7a19db0c83e1b9b5bf1ec2e"
> > +SRCREV_extras =3D "d31740f9d0399f8b938e88e58843d966e1cccab6"
> > +SRCREV_libhardware =3D "c6925520342a7d37758f85eb1cf3baa20a7b7a18"
> > +SRCREV_build =3D "28768b3120f751583a2743101b892f210d4715cf"
> > +SRCREV_libunwind =3D "03a963ecf6ea836b38b3537cbcda0ecfd7a77393"
> > +
> > +SRC_URI =3D " \
> > +    git://
> salsa.debian.org/android-tools-team/android-platform-external-boringssl;n=
ame=3Dboringssl;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/external/bor=
ingssl
> \
> > +    git://
> salsa.debian.org/android-tools-team/android-platform-system-core;name=3Dc=
ore;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/core
> \
> > +    git://
> salsa.debian.org/android-tools-team/android-platform-system-extras;name=
=3Dextras;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/extras
> \
> > +
> git://${ANDROID_MIRROR}/platform/hardware/libhardware;name=3Dlibhardware;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/hardware/libhardware
> \
> > +    git://
> salsa.debian.org/android-tools-team/android-platform-build.git;name=3Dbui=
ld;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/build
> \
> > +    git://
> salsa.debian.org/android-tools-team/android-platform-external-libunwind.g=
it;protocol=3Dhttps;name=3Dlibunwind;nobranch=3D1;destsuffix=3Dgit/external=
/libunwind
> \
> > +    file://adb_mk_change_out_dir.patch \
> > +    file://libadb_mk_change_out_dir.patch \
> > +    file://fastboot_compile_remove_gtest.patch \
> > +    file://fastboot_mk_change_out_dir.patch \
> > +    file://libbase_mk_change_out_dir.patch \
> > +    file://libext4_utils_mk_change_out_dir.patch \
> > +    file://libcrypto_mk_change_out_dir.patch \
> > +    file://libcrypto_utils_mk_change_out_dir.patch \
> > +    file://libcutils_mk_change_out_dir.patch \
> > +    file://libfec_mk_change_out_dir.patch \
> > +    file://img2simg_change_out_dir.patch \
> > +    file://simg2img_change_out_dir.patch \
> > +    file://liblog_mk_change_out_dir.patch \
> > +    file://libsparse_mk_change_out_dir.patch \
> > +    file://libziparchive_mk_change_out_dir.patch \
> > +    file://libbacktrace_mk_change_out_dir.patch \
> > +    file://libunwind_mk_change_out_dir.patch \
> > +    file://use_name_space_std_to_compile_libbacktrace.patch \
> > +    file://rules_yocto.mk;subdir=3Dgit \
> > +    file://android-tools-adbd.service \
> > +"
> > +
> > +S =3D "${WORKDIR}/git"
> > +B =3D "${WORKDIR}/${BPN}"
> > +
> > +#apply all the patches maintained in the debian version.
> > +do_unpack_and_patch_debian() {
> > +    cd ${S}/system/core
> > +    for i in `find ${S}/system/core/debian/patches -name "*.patch"`; d=
o
> > +        patch -p1 < $i
> > +    done
> > +    #a patch with no .patch extention, lets apply that
> > +    patch -p1 < ${S}/system/core/debian/patches/Added-missing-headers
> > +    cd ${S}/external/libunwind
> > +    for i in `find ${S}/external/libunwind/debian/patches -name
> "*.patch"`; do
> > +        patch -p1 < $i
> > +    done
> > +}
> > +addtask unpack_and_patch_debian after do_unpack before do_patch
> > +
> > +# http://errors.yoctoproject.org/Errors/Details/1debian881/
> > +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> > +ARM_INSTRUCTION_SET_armv5 =3D "arm"
> > +
> > +COMPATIBLE_HOST_powerpc =3D "(null)"
> > +COMPATIBLE_HOST_powerpc64 =3D "(null)"
> > +COMPATIBLE_HOST_powerpc64le =3D "(null)"
> > +
> > +inherit systemd clang
> > +
> > +TOOLCHAIN =3D "clang"
> > +DEPENDS +=3D "\
> > +    clang-cross-${TARGET_ARCH} \
> > +"
> > +
> > +SYSTEMD_SERVICE_${PN} =3D "android-tools-adbd.service"
> > +
> > +# Find libbsd headers during native builds
> > +CC_append_class-native =3D " -I${STAGING_INCDIR}"
> > +CC_append_class-nativesdk =3D " -I${STAGING_INCDIR}"
> > +
> > +PREREQUISITE_core =3D "libbase libsparse liblog libcutils"
> > +TOOLS_TO_BUILD =3D "libcrypto_utils libadb libziparchive fastboot adb
> img2simg simg2img libbacktrace"
> > +
> > +# Adb needs sys/capability.h, which is not available for native*
> > +TOOLS_class-native =3D "boringssl fastboot ext4_utils mkbootimg"
> > +TOOLS_class-nativesdk =3D "boringssl fastboot ext4_utils mkbootimg"
> > +
> > +do_compile() {
> > +
> > +    case "${HOST_ARCH}" in
> > +      arm)
> > +        export android_arch=3Dlinux-arm
> > +        cpu=3Darm
> > +        deb_host_arch=3Darm
> > +      ;;
> > +      aarch64)
> > +        export android_arch=3Dlinux-arm64
> > +        cpu=3Darm64
> > +        deb_host_arch=3Darm64
> > +      ;;
> > +      riscv64)
> > +        export android_arch=3Dlinux-riscv64
> > +      ;;
> > +      mips|mipsel)
> > +        export android_arch=3Dlinux-mips
> > +        cpu=3Dmips
> > +        deb_host_arch=3Dmips
> > +      ;;
> > +      mips64|mips64el)
> > +        export android_arch=3Dlinux-mips64
> > +        cpu=3Dmips64
> > +        deb_host_arch=3Dmips64
> > +      ;;
> > +      powerpc|powerpc64)
> > +        export android_arch=3Dlinux-ppc
> > +      ;;
> > +      i586|i686|x86_64)
> > +        export android_arch=3Dlinux-x86
> > +        cpu=3Dx86_64
> > +        deb_host_arch=3Damd64
> > +      ;;
> > +    esac
> > +
> > +    export SRCDIR=3D${S}
> > +
> > +    oe_runmake -f ${S}/external/boringssl/debian/libcrypto.mk -C
> ${S}/external/boringssl
> > +    oe_runmake -f ${S}/external/libunwind/debian/libunwind.mk -C
> ${S}/external/libunwind CPU=3D${cpu}
> > +
> > +    for tool in ${PREREQUISITE_core}; do
> > +      oe_runmake -f ${S}/system/core/debian/${tool}.mk -C
> ${S}/system/core
> > +    done
> > +
> > +    for i in `find ${S}/system/extras/debian/ -name "*.mk"`; do
> > +        oe_runmake -f $i -C ${S}/system/extras
> > +    done
> > +
> > +    for tool in ${TOOLS_TO_BUILD}; do
> > +        if tool =3D=3D "libbacktrace"; then
> > +            oe_runmake -f ${S}/system/core/debian/${tool}.mk -C
> ${S}/system/core DEB_HOST_ARCH=3D${deb_host_arch}
> > +        else
> > +            oe_runmake -f ${S}/system/core/debian/${tool}.mk -C
> ${S}/system/core
> > +        fi
> > +    done
> > +
> > +}
> > +
> > +do_install() {
> > +    if echo ${TOOLS_TO_BUILD} | grep -q "ext4_utils" ; then
> > +        install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py
> ${D}${bindir}/simg_dump
> > +    fi
> > +
> > +    if echo ${TOOLS_TO_BUILD} | grep -q "adb " ; then
> > +        install -d ${D}${bindir}
> > +        install -m0755 ${S}/debian/out/usr/lib/android/adb/adb
> ${D}${bindir}
> > +    fi
> > +
> > +    if echo ${TOOLS_TO_BUILD} | grep -q "adbd" ; then
> > +        install -d ${D}${bindir}
> > +        install -m0755 ${B}/adbd/adbd ${D}${bindir}
> > +    fi
> > +
> > +    # Outside the if statement to avoid errors during do_package
> > +    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
> > +      ${D}${systemd_unitdir}/system/android-tools-adbd.service
> > +
> > +    if echo ${TOOLS_TO_BUILD} | grep -q "fastboot" ; then
> > +        install -d ${D}${bindir}
> > +        install -m0755 ${S}/debian/out/usr/bin/fastboot/fastboot
> ${D}${bindir}
> > +    fi
> > +
> > +    install -d  ${D}${libdir}/android/
> > +    install -m0755 ${S}/debian/out/usr/lib/android/*.so.*
> ${D}${libdir}/android/
> > +    if echo ${TOOLS_TO_BUILD} | grep -q "mkbootimg" ; then
> > +        install -d ${D}${bindir}
> > +        install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
> > +    fi
> > +}
> > +
> > +PACKAGES +=3D "${PN}-fstools"
> > +
> > +RDEPENDS_${BPN} =3D "${BPN}-conf p7zip"
> > +
> > +FILES_${PN}-fstools =3D "\
> > +    ${bindir}/ext2simg \
> > +    ${bindir}/ext4fixup \
> > +    ${bindir}/img2simg \
> > +    ${bindir}/make_ext4fs \
> > +    ${bindir}/simg2img \
> > +    ${bindir}/simg2simg \
> > +    ${bindir}/simg_dump \
> > +    ${bindir}/mkuserimg \
> > +"
> > +FILES_${PN} +=3D "${libdir}/android ${libdir}/android/*"
> > +
> > +BBCLASSEXTEND =3D "native"
> > diff --git a/meta-oe/recipes-devtools/android-tools/
> android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/
> android-tools_5.1.1.r37.bb
> > deleted file mode 100644
> > index e8992346b..000000000
> > --- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> > +++ /dev/null
> > @@ -1,182 +0,0 @@
> > -DESCRIPTION =3D "Different utilities from Android"
> > -SECTION =3D "console/utils"
> > -LICENSE =3D "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
> > -LIC_FILES_CHKSUM =3D " \
> > -
> file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a00=
96b10
> \
> > -
> file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd6425610833=
a22dbe6
> \
> > -
> file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1bc=
15da69f
> \
> > -
> file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e2=
03a55f9
> \
> > -"
> > -DEPENDS =3D "libbsd libpcre zlib libcap"
> > -DEPENDS_append_class-target =3D " openssl"
> > -
> > -ANDROID_MIRROR =3D "android.googlesource.com"
> > -
> > -# matches with android-5.1.1_r37
> > -SRCREV_core =3D "2314b110bdebdbfd2d94c502282f9e57c849897e"
> > -SRCREV_extras =3D "3ecbe8d841df96127d7855661293e5ab6ba6c205"
> > -SRCREV_libhardware =3D "be55eb1f4d840c82ffaf7c47460df17ff5bc4d9b"
> > -SRCREV_libselinux =3D "07e9e1339ad1ba608acfba9dce2d0f474b252feb"
> > -SRCREV_build =3D "16e987def3d7d8f7d30805eb95cef69e52a87dbc"
> > -
> > -SRC_URI =3D " \
> > -
> git://${ANDROID_MIRROR}/platform/system/core;name=3Dcore;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3Dgit/system/core
> \
> > -
> git://${ANDROID_MIRROR}/platform/system/extras;name=3Dextras;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3Dgit/system/extras
> \
> > -
> git://${ANDROID_MIRROR}/platform/hardware/libhardware;name=3Dlibhardware;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/hardware/libhardware
> \
> > -
> git://${ANDROID_MIRROR}/platform/external/libselinux;name=3Dlibselinux;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/external/libselinux
> \
> > -
> git://${ANDROID_MIRROR}/platform/build;name=3Dbuild;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3Dgit/build
> \
> > -
> file://core/0001-adb-remove-selinux-extensions.patch;patchdir=3Dsystem/co=
re \
> > -
> file://core/0002-adb-Use-local-sockets-where-appropriate.patch;patchdir=
=3Dsystem/core
> \
> > -
> file://core/0003-adb-define-shell-command.patch;patchdir=3Dsystem/core \
> > -
> file://core/0004-adb-Fix-build-on-big-endian-systems.patch;patchdir=3Dsys=
tem/core
> \
> > -
> file://core/0005-adb-add-base64-implementation.patch;patchdir=3Dsystem/co=
re \
> > -    file://core/0006-adb-Musl-fixes.patch;patchdir=3Dsystem/core \
> > -
> file://core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch;patchdir=
=3Dsystem/core
> \
> > -
> file://core/0008-adb-Allow-adbd-to-be-ran-as-root.patch;patchdir=3Dsystem=
/core
> \
> > -
> file://core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch;pat=
chdir=3Dsystem/core
> \
> > -
> file://core/0010-Use-linux-capability.h-on-linux-systems-too.patch;patchd=
ir=3Dsystem/core
> \
> > -
> file://core/0011-Remove-bionic-specific-calls.patch;patchdir=3Dsystem/cor=
e \
> > -
> file://core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.pat=
ch;patchdir=3Dsystem/core
> \
> > -    file://core/adb_libssl_11.diff;patchdir=3Dsystem/core \
> > -    file://core/0013-adb-Support-riscv64.patch;patchdir=3Dsystem/core =
\
> > -
> file://extras/0001-ext4_utils-remove-selinux-extensions.patch;patchdir=3D=
system/extras
> \
> > -
> file://extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch;=
patchdir=3Dsystem/extras
> \
> > -
> file://libselinux/0001-Remove-bionic-specific-calls.patch;patchdir=3Dexte=
rnal/libselinux
> \
> > -
> file://libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-u=
se.patch;patchdir=3Dexternal/libselinux
> \
> > -    file://android-tools-adbd.service \
> > -
> file://build/0001-Riscv-Add-risc-v-Android-config-header.patch;patchdir=
=3Dbuild
> \
> > -    file://gitignore \
> > -    file://adb.mk;subdir=3D${BPN} \
> > -    file://adbd.mk;subdir=3D${BPN} \
> > -    file://ext4_utils.mk;subdir=3D${BPN} \
> > -    file://fastboot.mk;subdir=3D${BPN} \
> > -    file://mkbootimg.mk;subdir=3D${BPN} \
> > -"
> > -
> > -
> > -S =3D "${WORKDIR}/git"
> > -B =3D "${WORKDIR}/${BPN}"
> > -
> > -# http://errors.yoctoproject.org/Errors/Details/133881/
> > -ARM_INSTRUCTION_SET_armv4 =3D "arm"
> > -ARM_INSTRUCTION_SET_armv5 =3D "arm"
> > -
> > -COMPATIBLE_HOST_powerpc =3D "(null)"
> > -COMPATIBLE_HOST_powerpc64 =3D "(null)"
> > -COMPATIBLE_HOST_powerpc64le =3D "(null)"
> > -
> > -inherit systemd
> > -
> > -SYSTEMD_PACKAGES =3D "${PN}-adbd"
> > -SYSTEMD_SERVICE_${PN}-adbd =3D "android-tools-adbd.service"
> > -
> > -# Find libbsd headers during native builds
> > -CC_append_class-native =3D " -I${STAGING_INCDIR}"
> > -CC_append_class-nativesdk =3D " -I${STAGING_INCDIR}"
> > -
> > -TOOLS =3D "adb fastboot ext4_utils mkbootimg adbd"
> > -
> > -# Adb needs sys/capability.h, which is not available for native*
> > -TOOLS_class-native =3D "fastboot ext4_utils mkbootimg"
> > -TOOLS_class-nativesdk =3D "fastboot ext4_utils mkbootimg"
> > -
> > -do_compile() {
> > -    cp ${WORKDIR}/gitignore ${S}/.gitignore
> > -
> > -    # Setting both variables below causing our makefiles to not work
> with
> > -    # implicit make rules
> > -    unset CFLAGS
> > -    unset CPPFLAGS
> > -
> > -    export SRCDIR=3D${S}
> > -
> > -    case "${HOST_ARCH}" in
> > -      arm)
> > -        export android_arch=3Dlinux-arm
> > -      ;;
> > -      aarch64)
> > -        export android_arch=3Dlinux-arm64
> > -      ;;
> > -      riscv64)
> > -        export android_arch=3Dlinux-riscv64
> > -      ;;
> > -      mips|mipsel)
> > -        export android_arch=3Dlinux-mips
> > -      ;;
> > -      mips64|mips64el)
> > -        export android_arch=3Dlinux-mips64
> > -      ;;
> > -      powerpc|powerpc64)
> > -        export android_arch=3Dlinux-ppc
> > -      ;;
> > -      i586|i686|x86_64)
> > -        export android_arch=3Dlinux-x86
> > -      ;;
> > -    esac
> > -
> > -    for tool in ${TOOLS}; do
> > -      mkdir -p ${B}/${tool}
> > -      oe_runmake -f ${B}/${tool}.mk -C ${B}/${tool}
> > -    done
> > -}
> > -
> > -do_install() {
> > -    if echo ${TOOLS} | grep -q "ext4_utils" ; then
> > -        install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py
> ${D}${bindir}/simg_dump
> > -        install -D -p -m0755 ${S}/system/extras/ext4_utils/mkuserimg.s=
h
> ${D}${bindir}/mkuserimg
> > -
> > -        install -m0755 ${B}/ext4_utils/ext2simg ${D}${bindir}
> > -        install -m0755 ${B}/ext4_utils/ext4fixup ${D}${bindir}
> > -        install -m0755 ${B}/ext4_utils/img2simg ${D}${bindir}
> > -        install -m0755 ${B}/ext4_utils/make_ext4fs ${D}${bindir}
> > -        install -m0755 ${B}/ext4_utils/simg2img ${D}${bindir}
> > -        install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
> > -    fi
> > -
> > -    if echo ${TOOLS} | grep -q "adb " ; then
> > -        install -d ${D}${bindir}
> > -        install -m0755 ${B}/adb/adb ${D}${bindir}
> > -    fi
> > -
> > -    if echo ${TOOLS} | grep -q "adbd" ; then
> > -        install -d ${D}${bindir}
> > -        install -m0755 ${B}/adbd/adbd ${D}${bindir}
> > -    fi
> > -
> > -    # Outside the if statement to avoid errors during do_package
> > -    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
> > -      ${D}${systemd_unitdir}/system/android-tools-adbd.service
> > -
> > -    if echo ${TOOLS} | grep -q "fastboot" ; then
> > -        install -d ${D}${bindir}
> > -        install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
> > -    fi
> > -
> > -    if echo ${TOOLS} | grep -q "mkbootimg" ; then
> > -        install -d ${D}${bindir}
> > -        install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
> > -    fi
> > -}
> > -
> > -PACKAGES =3D+ "${PN}-fstools ${PN}-adbd"
> > -
> > -RDEPENDS_${PN}-adbd =3D "${PN}-conf"
> > -RDEPENDS_${PN}-fstools =3D "bash"
> > -
> > -FILES_${PN}-adbd =3D "\
> > -    ${bindir}/adbd \
> > -    ${systemd_unitdir}/system/android-tools-adbd.service \
> > -"
> > -
> > -FILES_${PN}-fstools =3D "\
> > -    ${bindir}/ext2simg \
> > -    ${bindir}/ext4fixup \
> > -    ${bindir}/img2simg \
> > -    ${bindir}/make_ext4fs \
> > -    ${bindir}/simg2img \
> > -    ${bindir}/simg2simg \
> > -    ${bindir}/simg_dump \
> > -    ${bindir}/mkuserimg \
> > -"
> > -
> > -BBCLASSEXTEND =3D "native"
> > --
> > 2.17.1
> >
>

--000000000000b8924005c34a91fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">HI Khem,<div>This particular patch will need meta-clang an=
d meta-selinux.</div><div>Where can I find the documentation to use dynamic=
-layers and include such cases where we need multple layers for a recipe ?<=
/div><div><br></div><div>regards</div><div>Nisha P</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Do., 27. Mai 202=
1 um 06:15=C2=A0Uhr schrieb Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om">raj.khem@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">I am seeing<br>
<br>
Parsing recipes...ERROR: ParseError at<br>
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-devtools/android-tools/<a href=3D"http://android-tools_10.0.0.r36.bb:77" =
rel=3D"noreferrer" target=3D"_blank">android-tools_10.0.0.r36.bb:77</a>:<br=
>
Could not inherit file classes/clang.bbclass<br>
<br>
this seems to depend on meta-clang, so perhaps it should either use<br>
dynamic-layers or add it to meta-clang itself.<br>
<br>
On Wed, May 26, 2021 at 12:59 PM Nisha Parrakat &lt;<a href=3D"mailto:nisha=
parrakat@gmail.com" target=3D"_blank">nishaparrakat@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; upgrade of android-tools to 10.0.0.r36<br>
&gt;<br>
&gt; Delete all the old patches that were applicable for<br>
&gt; old version.<br>
&gt;<br>
&gt; Use all the makefiles that come with the new version<br>
&gt; directly from the source code, just modifying them<br>
&gt; to install output to a specific folder<br>
&gt;<br>
&gt; a)added <a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" target=3D=
"_blank">rules_yocto.mk</a> that will mimic the debian/rules<br>
&gt; b)modified the makefiles of the components to output to<br>
&gt; a common dir.<br>
&gt; c)<br>
&gt; Built boringssl crypto with the option -DOPENSSL_NO_ASM<br>
&gt; to solve the below errors<br>
&gt;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_encrypt&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_set_encrypt_key&#=
39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_gmult_v8&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_init_v8&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `sha256_block_data_order&=
#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_ctr32_encrypt_blo=
cks&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_cbc_encrypt&#39;<=
br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_decrypt&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_encrypt&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_gmult_neon&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `sha1_block_data_order&#3=
9;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `sha512_block_data_order&=
#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_init_neon&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_set_decrypt_key&#=
39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_set_decrypt_key&#3=
9;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_ghash_neon&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `bn_mul_mont&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `aes_hw_decrypt&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `gcm_ghash_v8&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_cbc_encrypt&#39;<b=
r>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `ChaCha20_ctr32&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_ctr32_encrypt_bloc=
ks&#39;<br>
&gt;=C2=A0 libcrypto.so.0: undefined reference to `vpaes_set_encrypt_key&#3=
9;<br>
&gt;<br>
&gt;=C2=A0 Attention : <a href=3D"https://github.com/grpc/grpc/issues/9440"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/grpc/grpc/issues/9=
440</a><br>
&gt;<br>
&gt; d) compiled android compatible version of libunwind to be used<br>
&gt; to build libbacktrace<br>
&gt; e) REQUIRES meta-selinux for libselinux<br>
&gt; f) checked compilation and packaging for for x86_64 and aarch64<br>
&gt; g) UNTESTED android-tools-adbd.service , couldn&#39;t find how to buil=
d adbd<br>
&gt; that is needed by the service with the new version of android-tools. A=
t<br>
&gt; present the service is still packaged but may not work.<br>
&gt; h) tested the adb and fastboot on the core-image-minimal by including<=
br>
&gt; the android-tools in the image and ran the commands with &#39;help&#39=
;<br>
&gt;<br>
&gt; Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kpi=
t.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:nishaparrakat@gmai=
l.com" target=3D"_blank">nishaparrakat@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://adb.mk" rel=3D=
"noreferrer" target=3D"_blank">adb.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 72 ----<br>
&gt;=C2=A0 .../android-tools/adb_mk_change_out_dir.patch |=C2=A0 50 +++<br>
&gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://adbd.mk" rel=
=3D"noreferrer" target=3D"_blank">adbd.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
64 --------<br>
&gt;=C2=A0 ...scv-Add-risc-v-Android-config-header.patch | 359 ------------=
------<br>
&gt;=C2=A0 .../0001-adb-remove-selinux-extensions.patch=C2=A0 |=C2=A0 44 --=
-<br>
&gt;=C2=A0 ...-Use-local-sockets-where-appropriate.patch |=C2=A0 70 ----<br=
>
&gt;=C2=A0 .../core/0003-adb-define-shell-command.patch=C2=A0 |=C2=A0 29 --=
<br>
&gt;=C2=A0 ...-adb-Fix-build-on-big-endian-systems.patch |=C2=A0 45 ---<br>
&gt;=C2=A0 .../0005-adb-add-base64-implementation.patch=C2=A0 | 348 -------=
----------<br>
&gt;=C2=A0 .../core/0006-adb-Musl-fixes.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 131 -------<br>
&gt;=C2=A0 ...sb_linux.c-fix-build-with-glibc-2.28.patch |=C2=A0 24 --<br>
&gt;=C2=A0 ...008-adb-Allow-adbd-to-be-ran-as-root.patch |=C2=A0 21 -<br>
&gt;=C2=A0 ...Add-dt-parameter-to-specify-DT-image.patch | 110 ------<br>
&gt;=C2=A0 ...ux-capability.h-on-linux-systems-too.patch |=C2=A0 23 --<br>
&gt;=C2=A0 .../0011-Remove-bionic-specific-calls.patch=C2=A0 =C2=A0|=C2=A0 =
64 ----<br>
&gt;=C2=A0 ...laration-of-stlcat-strlcopy-function.patch |=C2=A0 50 ---<br>
&gt;=C2=A0 .../core/0013-adb-Support-riscv64.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 189 ---------<br>
&gt;=C2=A0 .../android-tools/core/adb_libssl_11.diff=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 39 --<br>
&gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://ext4_utils.mk"=
 rel=3D"noreferrer" target=3D"_blank">ext4_utils.mk</a> | 103 -----<br>
&gt;=C2=A0 ...ext4_utils-remove-selinux-extensions.patch |=C2=A0 39 --<br>
&gt;=C2=A0 ...add-o-argument-to-preserve-ownership.patch |=C2=A0 78 ----<br=
>
&gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://fastboot.mk" r=
el=3D"noreferrer" target=3D"_blank">fastboot.mk</a>=C2=A0 =C2=A0|=C2=A0 89 =
-----<br>
&gt;=C2=A0 .../fastboot_compile_remove_gtest.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 51 +++<br>
&gt;=C2=A0 .../fastboot_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 52 +++<br>
&gt;=C2=A0 .../android-tools/android-tools/gitignore=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 59 ---<br>
&gt;=C2=A0 .../img2simg_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 41 ++<br>
&gt;=C2=A0 .../libadb_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 44 +++<br>
&gt;=C2=A0 .../libbacktrace_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 60 +++<br>
&gt;=C2=A0 .../libbase_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 33 ++<br>
&gt;=C2=A0 .../libcrypto_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 30 ++<br>
&gt;=C2=A0 .../libcrypto_utils_mk_change_out_dir.patch=C2=A0 =C2=A0|=C2=A0 =
38 ++<br>
&gt;=C2=A0 .../libcutils_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 27 ++<br>
&gt;=C2=A0 .../libext4_utils_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 42 ++<br>
&gt;=C2=A0 .../libfec_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 35 ++<br>
&gt;=C2=A0 .../liblog_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 42 ++<br>
&gt;=C2=A0 .../0001-Remove-bionic-specific-calls.patch=C2=A0 =C2=A0|=C2=A0 =
25 --<br>
&gt;=C2=A0 ...t-define-gettid-if-glibc-2.30-is-use.patch |=C2=A0 49 ---<br>
&gt;=C2=A0 .../libsparse_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 47 +++<br>
&gt;=C2=A0 .../libunwind_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 47 +++<br>
&gt;=C2=A0 .../libziparchive_mk_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 47 +++<br>
&gt;=C2=A0 .../android-tools/android-tools/<a href=3D"http://mkbootimg.mk" =
rel=3D"noreferrer" target=3D"_blank">mkbootimg.mk</a>=C2=A0 |=C2=A0 29 --<b=
r>
&gt;=C2=A0 .../android-tools/<a href=3D"http://rules_yocto.mk" rel=3D"noref=
errer" target=3D"_blank">rules_yocto.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 .../simg2img_change_out_dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 41 ++<br>
&gt;=C2=A0 ...me_space_std_to_compile_libbacktrace.patch |=C2=A0 19 +<br>
&gt;=C2=A0 .../android-tools/<a href=3D"http://android-tools_10.0.0.r36.bb"=
 rel=3D"noreferrer" target=3D"_blank">android-tools_10.0.0.r36.bb</a> | 204=
 ++++++++++<br>
&gt;=C2=A0 .../android-tools/<a href=3D"http://android-tools_5.1.1.r37.bb" =
rel=3D"noreferrer" target=3D"_blank">android-tools_5.1.1.r37.bb</a>=C2=A0 |=
 182 ---------<br>
&gt;=C2=A0 46 files changed, 954 insertions(+), 2435 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/<a href=3D"http://adb.mk" rel=3D"noreferrer" target=3D"_blank">adb.=
mk</a><br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/adb_mk_change_out_dir.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/<a href=3D"http://adbd.mk" rel=3D"noreferrer" target=3D"_blank">adb=
d.mk</a><br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0001-adb-remove-selinux-extensions.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0002-adb-Use-local-sockets-where-appropriate.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0003-adb-define-shell-command.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0005-adb-add-base64-implementation.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0006-adb-Musl-fixes.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0010-Use-linux-capability.h-on-linux-systems-too.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0011-Remove-bionic-specific-calls.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patc=
h<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/0013-adb-Support-riscv64.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/core/adb_libssl_11.diff<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/<a href=3D"http://ext4_utils.mk" rel=3D"noreferrer" target=3D"_blan=
k">ext4_utils.mk</a><br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/extras/0001-ext4_utils-remove-selinux-extensions.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch<b=
r>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/<a href=3D"http://fastboot.mk" rel=3D"noreferrer" target=3D"_blank"=
>fastboot.mk</a><br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/fastboot_compile_remove_gtest.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/fastboot_mk_change_out_dir.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/gitignore<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/img2simg_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libadb_mk_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libbacktrace_mk_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libbase_mk_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libcrypto_mk_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libcrypto_utils_mk_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libcutils_mk_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libext4_utils_mk_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libfec_mk_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/liblog_mk_change_out_dir.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libselinux/0001-Remove-bionic-specific-calls.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-us=
e.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libsparse_mk_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libunwind_mk_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/libziparchive_mk_change_out_dir.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/<a href=3D"http://mkbootimg.mk" rel=3D"noreferrer" target=3D"_blank=
">mkbootimg.mk</a><br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" target=3D"_bla=
nk">rules_yocto.mk</a><br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/simg2img_change_out_dir.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/androi=
d-tools/use_name_space_std_to_compile_libbacktrace.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/android-tools/<a hre=
f=3D"http://android-tools_10.0.0.r36.bb" rel=3D"noreferrer" target=3D"_blan=
k">android-tools_10.0.0.r36.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/android-tools/<a hre=
f=3D"http://android-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank=
">android-tools_5.1.1.r37.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/<a h=
ref=3D"http://adb.mk" rel=3D"noreferrer" target=3D"_blank">adb.mk</a> b/met=
a-oe/recipes-devtools/android-tools/android-tools/<a href=3D"http://adb.mk"=
 rel=3D"noreferrer" target=3D"_blank">adb.mk</a><br>
&gt; deleted file mode 100644<br>
&gt; index 0687c22c1..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"=
http://adb.mk" rel=3D"noreferrer" target=3D"_blank">adb.mk</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,72 +0,0 @@<br>
&gt; -# Makefile for adb<br>
&gt; -<br>
&gt; -SRCDIR ?=3D $(S)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/adb<br>
&gt; -adb_SRC_FILES +=3D adb.c<br>
&gt; -adb_SRC_FILES +=3D console.c<br>
&gt; -adb_SRC_FILES +=3D transport.c<br>
&gt; -adb_SRC_FILES +=3D transport_local.c<br>
&gt; -adb_SRC_FILES +=3D transport_usb.c<br>
&gt; -adb_SRC_FILES +=3D commandline.c<br>
&gt; -adb_SRC_FILES +=3D adb_client.c<br>
&gt; -adb_SRC_FILES +=3D adb_auth_host.c<br>
&gt; -adb_SRC_FILES +=3D sockets.c<br>
&gt; -adb_SRC_FILES +=3D services.c<br>
&gt; -adb_SRC_FILES +=3D file_sync_client.c<br>
&gt; -adb_SRC_FILES +=3D get_my_path_linux.c<br>
&gt; -adb_SRC_FILES +=3D usb_linux.c<br>
&gt; -adb_SRC_FILES +=3D usb_vendors.c<br>
&gt; -adb_SRC_FILES +=3D fdevent.c<br>
&gt; -adb_OBJS :=3D $(adb_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/libcutils<br>
&gt; -libcutils_SRC_FILES +=3D atomic.c<br>
&gt; -libcutils_SRC_FILES +=3D hashmap.c<br>
&gt; -libcutils_SRC_FILES +=3D native_handle.c<br>
&gt; -libcutils_SRC_FILES +=3D config_utils.c<br>
&gt; -libcutils_SRC_FILES +=3D cpu_info.c<br>
&gt; -libcutils_SRC_FILES +=3D load_file.c<br>
&gt; -# libcutils_SRC_FILES +=3D open_memstream.c<br>
&gt; -# libcutils_SRC_FILES +=3D strdup16to8.c<br>
&gt; -# libcutils_SRC_FILES +=3D strdup8to16.c<br>
&gt; -# libcutils_SRC_FILES +=3D record_stream.c<br>
&gt; -# libcutils_SRC_FILES +=3D process_name.c<br>
&gt; -# libcutils_SRC_FILES +=3D threads.c<br>
&gt; -# libcutils_SRC_FILES +=3D sched_policy.c<br>
&gt; -# libcutils_SRC_FILES +=3D iosched_policy.c<br>
&gt; -libcutils_SRC_FILES +=3D str_parms.c<br>
&gt; -libcutils_SRC_FILES +=3D fs.c<br>
&gt; -libcutils_SRC_FILES +=3D multiuser.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_inaddr_any_server.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_local_client.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_local_server.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_loopback_client.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_loopback_server.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_network_client.c<br>
&gt; -libcutils_SRC_FILES +=3D sockets.c<br>
&gt; -libcutils_SRC_FILES +=3D ashmem-host.c<br>
&gt; -libcutils_SRC_FILES +=3D dlmalloc_stubs.c<br>
&gt; -libcutils_OBJS :=3D $(libcutils_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -CFLAGS +=3D -DANDROID<br>
&gt; -CFLAGS +=3D -DWORKAROUND_BUG6558362<br>
&gt; -CFLAGS +=3D -DADB_HOST=3D1<br>
&gt; -CFLAGS +=3D -D_XOPEN_SOURCE -D_GNU_SOURCE<br>
&gt; -CFLAGS +=3D -DANDROID_SMP=3D0<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/adb<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/include<br>
&gt; -CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch/$(androi=
d_arch)/AndroidConfig.h<br>
&gt; -<br>
&gt; -LIBS +=3D libcutils.a -lpthread -lcrypto<br>
&gt; -<br>
&gt; -all: adb<br>
&gt; -<br>
&gt; -adb: libcutils.a $(adb_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(adb_OBJS) $(LIBS)=
<br>
&gt; -<br>
&gt; -libcutils.a: $(libcutils_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libcutils_OBJS)<br>
&gt; -<br>
&gt; -clean:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) $(adb_OBJS) $(libcutils_OBJS) adb *.=
a<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/adb_=
mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-to=
ols/adb_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..8c07e133a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/adb_mk_chan=
ge_out_dir.patch<br>
&gt; @@ -0,0 +1,50 @@<br>
&gt; +patching <a href=3D"http://adb.mk" rel=3D"noreferrer" target=3D"_blan=
k">adb.mk</a> to build in yocto environment.<br>
&gt; +<br>
&gt; +Changes include:<br>
&gt; +Introduced an output folder which will keep all the outputs from the<=
br>
&gt; +android-tools.<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary to the OUT_DIR<=
br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +--- git/system/core/debian/<a href=3D"http://adb.mk" rel=3D"noreferre=
r" target=3D"_blank">adb.mk</a>=C2=A0 =C2=A0 =C2=A0 2021-04-29 21:11:00.617=
892503 +0200<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://adb.mk" rel=3D"noreferre=
r" target=3D"_blank">adb.mk</a>=C2=A0 =C2=A0 =C2=A0 2021-04-29 21:17:33.256=
016600 +0200<br>
&gt; +@@ -1,3 +1,4 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME =3D adb<br>
&gt; +<br>
&gt; + SOURCES =3D client/adb_client.cpp \<br>
&gt; +@@ -12,10 +13,10 @@<br>
&gt; +<br>
&gt; + SOURCES :=3D $(foreach source, $(SOURCES), adb/$(source))<br>
&gt; + CXXFLAGS +=3D -std=3Dgnu++2a<br>
&gt; +-CPPFLAGS +=3D -Iinclude -Iadb -Ibase/include \<br>
&gt; ++CPPFLAGS +=3D -Iinclude -Iadb -Ibase/include=C2=A0 -I$(OUT_DIR)/usr/=
include/ \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DADB_VERSION=3D&#39;=
&quot;$(DEB_VERSION)&quot;&#39; -DADB_HOST=3D1 -D_GNU_SOURCE<br>
&gt; +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android -Wl=
,-rpath-link=3D. \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -L. -ladb -lbase<=
br>
&gt; ++LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android -Wl=
,-rpath-link=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -L$(OUT_DIR)/usr/=
lib/$(DEB_HOST_MULTIARCH)/android/ -ladb -lbase<br>
&gt; +<br>
&gt; + # -latomic should be the last library specified<br>
&gt; + # <a href=3D"https://github.com/android/ndk/issues/589" rel=3D"noref=
errer" target=3D"_blank">https://github.com/android/ndk/issues/589</a><br>
&gt; +@@ -24,7 +25,8 @@<br>
&gt; + endif<br>
&gt; +<br>
&gt; + build: $(SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o adb/$(NAME) $(CXXFLAGS) $(CPPFLAGS=
) $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/lib/$(DEB_HOST_M=
ULTIARCH)/android/adb<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULT=
IARCH)/android/adb/$(NAME) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) adb/$(NAME)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/=
android/adb/$(NAME)<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/<a h=
ref=3D"http://adbd.mk" rel=3D"noreferrer" target=3D"_blank">adbd.mk</a> b/m=
eta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"http://adbd.=
mk" rel=3D"noreferrer" target=3D"_blank">adbd.mk</a><br>
&gt; deleted file mode 100644<br>
&gt; index 31452ae10..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"=
http://adbd.mk" rel=3D"noreferrer" target=3D"_blank">adbd.mk</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,164 +0,0 @@<br>
&gt; -# Makefile for adbd<br>
&gt; -<br>
&gt; -SRCDIR ?=3D $(S)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/adb<br>
&gt; -adbd_SRC_FILES +=3D adb.c<br>
&gt; -adbd_SRC_FILES +=3D fdevent.c<br>
&gt; -adbd_SRC_FILES +=3D transport.c<br>
&gt; -adbd_SRC_FILES +=3D transport_local.c<br>
&gt; -adbd_SRC_FILES +=3D transport_usb.c<br>
&gt; -adbd_SRC_FILES +=3D adb_auth_client.c<br>
&gt; -adbd_SRC_FILES +=3D sockets.c<br>
&gt; -adbd_SRC_FILES +=3D services.c<br>
&gt; -adbd_SRC_FILES +=3D file_sync_service.c<br>
&gt; -adbd_SRC_FILES +=3D jdwp_service.c<br>
&gt; -adbd_SRC_FILES +=3D framebuffer_service.c<br>
&gt; -adbd_SRC_FILES +=3D remount_service.c<br>
&gt; -adbd_SRC_FILES +=3D disable_verity_service.c<br>
&gt; -adbd_SRC_FILES +=3D base64.c<br>
&gt; -adbd_SRC_FILES +=3D usb_linux_client.c<br>
&gt; -adbd_OBJS :=3D $(adbd_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/liblog<br>
&gt; -liblog_SRC_FILES +=3D logd_write.c<br>
&gt; -liblog_SRC_FILES +=3D log_event_write.c<br>
&gt; -liblog_SRC_FILES +=3D logprint.c<br>
&gt; -liblog_SRC_FILES +=3D event_tag_map.c<br>
&gt; -liblog_SRC_FILES +=3D fake_log_device.c<br>
&gt; -liblog_OBJS :=3D $(liblog_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/fs_mgr<br>
&gt; -fs_mgr_SRC_FILES +=3D fs_mgr_fstab.c<br>
&gt; -fs_mgr_OBJS :=3D $(fs_mgr_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/libcutils<br>
&gt; -libcutils_SRC_FILES +=3D atomic.c<br>
&gt; -libcutils_SRC_FILES +=3D hashmap.c<br>
&gt; -libcutils_SRC_FILES +=3D native_handle.c<br>
&gt; -libcutils_SRC_FILES +=3D config_utils.c<br>
&gt; -libcutils_SRC_FILES +=3D cpu_info.c<br>
&gt; -libcutils_SRC_FILES +=3D load_file.c<br>
&gt; -# libcutils_SRC_FILES +=3D open_memstream.c<br>
&gt; -# libcutils_SRC_FILES +=3D strdup16to8.c<br>
&gt; -# libcutils_SRC_FILES +=3D strdup8to16.c<br>
&gt; -# libcutils_SRC_FILES +=3D record_stream.c<br>
&gt; -# libcutils_SRC_FILES +=3D process_name.c<br>
&gt; -# libcutils_SRC_FILES +=3D threads.c<br>
&gt; -# libcutils_SRC_FILES +=3D sched_policy.c<br>
&gt; -# libcutils_SRC_FILES +=3D iosched_policy.c<br>
&gt; -libcutils_SRC_FILES +=3D str_parms.c<br>
&gt; -libcutils_SRC_FILES +=3D fs.c<br>
&gt; -libcutils_SRC_FILES +=3D multiuser.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_inaddr_any_server.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_local_client.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_local_server.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_loopback_client.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_loopback_server.c<br>
&gt; -libcutils_SRC_FILES +=3D socket_network_client.c<br>
&gt; -libcutils_SRC_FILES +=3D sockets.c<br>
&gt; -libcutils_SRC_FILES +=3D ashmem-host.c<br>
&gt; -libcutils_SRC_FILES +=3D dlmalloc_stubs.c<br>
&gt; -libcutils_SRC_FILES +=3D klog.c<br>
&gt; -libcutils_SRC_FILES +=3D properties.c<br>
&gt; -libcutils_OBJS :=3D $(libcutils_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/external/libselinux/src<br>
&gt; -libselinux_SRC_FILES +=3D booleans.c<br>
&gt; -libselinux_SRC_FILES +=3D canonicalize_context.c<br>
&gt; -libselinux_SRC_FILES +=3D disable.c<br>
&gt; -libselinux_SRC_FILES +=3D enabled.c<br>
&gt; -libselinux_SRC_FILES +=3D fgetfilecon.c<br>
&gt; -libselinux_SRC_FILES +=3D fsetfilecon.c<br>
&gt; -libselinux_SRC_FILES +=3D getenforce.c<br>
&gt; -libselinux_SRC_FILES +=3D getfilecon.c<br>
&gt; -libselinux_SRC_FILES +=3D getpeercon.c<br>
&gt; -libselinux_SRC_FILES +=3D lgetfilecon.c<br>
&gt; -libselinux_SRC_FILES +=3D load_policy.c<br>
&gt; -libselinux_SRC_FILES +=3D lsetfilecon.c<br>
&gt; -libselinux_SRC_FILES +=3D policyvers.c<br>
&gt; -libselinux_SRC_FILES +=3D procattr.c<br>
&gt; -libselinux_SRC_FILES +=3D setenforce.c<br>
&gt; -libselinux_SRC_FILES +=3D setfilecon.c<br>
&gt; -libselinux_SRC_FILES +=3D context.c<br>
&gt; -libselinux_SRC_FILES +=3D mapping.c<br>
&gt; -libselinux_SRC_FILES +=3D stringrep.c<br>
&gt; -libselinux_SRC_FILES +=3D compute_create.c<br>
&gt; -libselinux_SRC_FILES +=3D compute_av.c<br>
&gt; -libselinux_SRC_FILES +=3D avc.c<br>
&gt; -libselinux_SRC_FILES +=3D avc_internal.c<br>
&gt; -libselinux_SRC_FILES +=3D avc_sidtab.c<br>
&gt; -libselinux_SRC_FILES +=3D get_initial_context.c<br>
&gt; -libselinux_SRC_FILES +=3D checkAccess.c<br>
&gt; -libselinux_SRC_FILES +=3D sestatus.c<br>
&gt; -libselinux_SRC_FILES +=3D deny_unknown.c<br>
&gt; -<br>
&gt; -libselinux_SRC_FILES +=3D callbacks.c<br>
&gt; -libselinux_SRC_FILES +=3D check_context.c<br>
&gt; -libselinux_SRC_FILES +=3D freecon.c<br>
&gt; -libselinux_SRC_FILES +=3D init.c<br>
&gt; -libselinux_SRC_FILES +=3D label.c<br>
&gt; -libselinux_SRC_FILES +=3D label_file.c<br>
&gt; -libselinux_SRC_FILES +=3D label_android_property.c<br>
&gt; -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils<br>
&gt; -libext4_utils_SRC_FILES +=3D make_ext4fs.c<br>
&gt; -libext4_utils_SRC_FILES +=3D ext4fixup.c<br>
&gt; -libext4_utils_SRC_FILES +=3D ext4_utils.c<br>
&gt; -libext4_utils_SRC_FILES +=3D allocate.c<br>
&gt; -libext4_utils_SRC_FILES +=3D contents.c<br>
&gt; -libext4_utils_SRC_FILES +=3D extent.c<br>
&gt; -libext4_utils_SRC_FILES +=3D indirect.c<br>
&gt; -libext4_utils_SRC_FILES +=3D uuid.c<br>
&gt; -libext4_utils_SRC_FILES +=3D sha1.c<br>
&gt; -libext4_utils_SRC_FILES +=3D wipe.c<br>
&gt; -libext4_utils_SRC_FILES +=3D crc16.c<br>
&gt; -libext4_utils_SRC_FILES +=3D ext4_sb.c<br>
&gt; -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -CFLAGS +=3D -std=3Dgnu11<br>
&gt; -CFLAGS +=3D -DANDROID<br>
&gt; -CFLAGS +=3D -DADB_HOST=3D0<br>
&gt; -CFLAGS +=3D -D_XOPEN_SOURCE -D_GNU_SOURCE<br>
&gt; -CFLAGS +=3D -DALLOW_ADBD_ROOT=3D1<br>
&gt; -CFLAGS +=3D -DALLOW_ADBD_DISABLE_VERITY=3D1<br>
&gt; -CFLAGS +=3D -DPROP_NAME_MAX=3D32<br>
&gt; -CFLAGS +=3D -DPROP_VALUE_MAX=3D92<br>
&gt; -CFLAGS +=3D -DAUDITD_LOG_TAG=3D1003<br>
&gt; -# CFLAGS +=3D -DHOST<br>
&gt; -CFLAGS +=3D -DANDROID_SMP=3D0<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/adb<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/include<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/fs_mgr/include<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/hardware/libhardware/include<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include<br>
&gt; -CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch/$(androi=
d_arch)/AndroidConfig.h<br>
&gt; -<br>
&gt; -LIBS +=3D liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils=
.a -lpthread -lbsd -lpcre -lresolv -lcrypto<br>
&gt; -<br>
&gt; -all: adbd<br>
&gt; -<br>
&gt; -adbd: liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a $=
(adbd_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(adbd_OBJS) $(LIBS=
)<br>
&gt; -<br>
&gt; -liblog.a: $(liblog_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(liblog_OBJS)<br>
&gt; -<br>
&gt; -libfs_mgr.a: $(fs_mgr_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(fs_mgr_OBJS)<br>
&gt; -<br>
&gt; -libcutils.a: $(libcutils_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libcutils_OBJS)<br>
&gt; -<br>
&gt; -libselinux.a: $(libselinux_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CFLAGS=3D&quot;-DANDROID -DHOST&quo=
t;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libselinux_OBJS)<br>
&gt; -<br>
&gt; -libext4_utils.a: $(libext4_utils_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libext4_utils_OBJS)<br>
&gt; -<br>
&gt; -clean:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) *.o *.a adbd<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/buil=
d/0001-Riscv-Add-risc-v-Android-config-header.patch b/meta-oe/recipes-devto=
ols/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-=
header.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 57c443b70..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-=
Riscv-Add-risc-v-Android-config-header.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,359 +0,0 @@<br>
&gt; -From 82dce13ea7b5b31c63851bd67f66072413917e73 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Chenxi Mao &lt;<a href=3D"mailto:maochenxi@eswin.com" target=3D=
"_blank">maochenxi@eswin.com</a>&gt;<br>
&gt; -Date: Mon, 20 Apr 2020 15:32:40 +0800<br>
&gt; -Subject: [PATCH 1/1] Riscv: Add risc-v Android config header<br>
&gt; -<br>
&gt; ----<br>
&gt; - .../arch/linux-riscv64/AndroidConfig.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
340 ++++++++++++++++++<br>
&gt; - 1 file changed, 340 insertions(+)<br>
&gt; - create mode 100644 core/combo/include/arch/linux-riscv64/AndroidConf=
ig.h<br>
&gt; -<br>
&gt; -diff --git a/core/combo/include/arch/linux-riscv64/AndroidConfig.h b/=
core/combo/include/arch/linux-riscv64/AndroidConfig.h<br>
&gt; -new file mode 100644<br>
&gt; -index 0000000000..bcbda8f87f<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/core/combo/include/arch/linux-riscv64/AndroidConfig.h<br>
&gt; -@@ -0,0 +1,340 @@<br>
&gt; -+/*<br>
&gt; -+ * Copyright (C) 2013 The Android Open Source Project<br>
&gt; -+ *<br>
&gt; -+ * Licensed under the Apache License, Version 2.0 (the &quot;License=
&quot;);<br>
&gt; -+ * you may not use this file except in compliance with the License.<=
br>
&gt; -+ * You may obtain a copy of the License at<br>
&gt; -+ *<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.apache.org/licenses/LIC=
ENSE-2.0" rel=3D"noreferrer" target=3D"_blank">http://www.apache.org/licens=
es/LICENSE-2.0</a><br>
&gt; -+ *<br>
&gt; -+ * Unless required by applicable law or agreed to in writing, softwa=
re<br>
&gt; -+ * distributed under the License is distributed on an &quot;AS IS&qu=
ot; BASIS,<br>
&gt; -+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or i=
mplied.<br>
&gt; -+ * See the License for the specific language governing permissions a=
nd<br>
&gt; -+ * limitations under the License.<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Android config -- &quot;android-aarch64&quot;.=C2=A0 Used for ARM=
 aarch64 device builds.<br>
&gt; -+ */<br>
&gt; -+#ifndef _ANDROID_CONFIG_H<br>
&gt; -+#define _ANDROID_CONFIG_H<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !!! IMPORTANT !!!<br>
&gt; -+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
&gt; -+ *<br>
&gt; -+ * This file is included by ALL C/C++ source files.=C2=A0 Don&#39;t =
put anything in<br>
&gt; -+ * here unless you are absolutely certain it can&#39;t go anywhere e=
lse.<br>
&gt; -+ *<br>
&gt; -+ * Any C++ stuff must be wrapped with &quot;#ifdef __cplusplus&quot;=
.=C2=A0 Do not use &quot;//&quot;<br>
&gt; -+ * comments.<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Threading model.=C2=A0 Choose one:<br>
&gt; -+ *<br>
&gt; -+ * HAVE_PTHREADS - use the pthreads library.<br>
&gt; -+ * HAVE_WIN32_THREADS - use Win32 thread primitives.<br>
&gt; -+ *=C2=A0 -- combine HAVE_CREATETHREAD, HAVE_CREATEMUTEX, and HAVE__B=
EGINTHREADEX<br>
&gt; -+ */<br>
&gt; -+#define HAVE_PTHREADS<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Do we have pthread_setname_np()?<br>
&gt; -+ *<br>
&gt; -+ * (HAVE_PTHREAD_SETNAME_NP is used by WebKit to enable a function w=
ith<br>
&gt; -+ * the same name but different parameters, so we can&#39;t use that =
here.)<br>
&gt; -+ */<br>
&gt; -+#define HAVE_ANDROID_PTHREAD_SETNAME_NP<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Do we have the futex syscall?<br>
&gt; -+ */<br>
&gt; -+#define HAVE_FUTEX<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Process creation model.=C2=A0 Choose one:<br>
&gt; -+ *<br>
&gt; -+ * HAVE_FORKEXEC - use fork() and exec()<br>
&gt; -+ * HAVE_WIN32_PROC - use CreateProcess()<br>
&gt; -+ */<br>
&gt; -+#define HAVE_FORKEXEC<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Process out-of-memory adjustment.=C2=A0 Set if running on Linux,<=
br>
&gt; -+ * where we can write to /proc/&lt;pid&gt;/oom_adj to modify the out=
-of-memory<br>
&gt; -+ * badness adjustment.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_OOM_ADJ<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * IPC model.=C2=A0 Choose one:<br>
&gt; -+ *<br>
&gt; -+ * HAVE_SYSV_IPC - use the classic SysV IPC mechanisms (semget, shmg=
et).<br>
&gt; -+ * HAVE_MACOSX_IPC - use Macintosh IPC mechanisms (sem_open, mmap).<=
br>
&gt; -+ * HAVE_WIN32_IPC - use Win32 IPC (CreateSemaphore, CreateFileMappin=
g).<br>
&gt; -+ * HAVE_ANDROID_IPC - use Android versions (?, mmap).<br>
&gt; -+ */<br>
&gt; -+#define HAVE_ANDROID_IPC<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Memory-mapping model. Choose one:<br>
&gt; -+ *<br>
&gt; -+ * HAVE_POSIX_FILEMAP - use the Posix sys/mmap.h<br>
&gt; -+ * HAVE_WIN32_FILEMAP - use Win32 filemaps<br>
&gt; -+ */<br>
&gt; -+#define=C2=A0 HAVE_POSIX_FILEMAP<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define this if you have &lt;termio.h&gt;<br>
&gt; -+ */<br>
&gt; -+#define=C2=A0 HAVE_TERMIO_H 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define this if you have &lt;sys/sendfile.h&gt;<br>
&gt; -+ */<br>
&gt; -+#define=C2=A0 HAVE_SYS_SENDFILE_H 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define this if you build against MSVCRT.DLL<br>
&gt; -+ */<br>
&gt; -+/* #define HAVE_MS_C_RUNTIME */<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define this if you have sys/uio.h<br>
&gt; -+ */<br>
&gt; -+#define=C2=A0 HAVE_SYS_UIO_H 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define this if your platforms implements symbolic links<br>
&gt; -+ * in its filesystems<br>
&gt; -+ */<br>
&gt; -+#define HAVE_SYMLINKS<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define this if we have localtime_r().<br>
&gt; -+ */<br>
&gt; -+/* #define HAVE_LOCALTIME_R 1 */<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define this if we have gethostbyname_r().<br>
&gt; -+ */<br>
&gt; -+/* #define HAVE_GETHOSTBYNAME_R */<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define this if we have ioctl().<br>
&gt; -+ */<br>
&gt; -+#define HAVE_IOCTL<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define this if we want to use WinSock.<br>
&gt; -+ */<br>
&gt; -+/* #define HAVE_WINSOCK */<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define this if have clock_gettime() and friends<br>
&gt; -+ */<br>
&gt; -+#define HAVE_POSIX_CLOCKS<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define this if we have linux style epoll()<br>
&gt; -+ */<br>
&gt; -+#define HAVE_EPOLL<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Endianness of the target machine.=C2=A0 Choose one:<br>
&gt; -+ *<br>
&gt; -+ * HAVE_ENDIAN_H -- have endian.h header we can include.<br>
&gt; -+ * HAVE_LITTLE_ENDIAN -- we are little endian.<br>
&gt; -+ * HAVE_BIG_ENDIAN -- we are big endian.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_ENDIAN_H<br>
&gt; -+#define HAVE_LITTLE_ENDIAN<br>
&gt; -+<br>
&gt; -+#define _FILE_OFFSET_BITS 64<br>
&gt; -+/* #define _LARGEFILE_SOURCE 1 */<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if platform has off64_t (and lseek64 and other xxx64 funct=
ions)<br>
&gt; -+ */<br>
&gt; -+#define HAVE_OFF64_T<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Defined if we have the backtrace() call for retrieving a stack tr=
ace.<br>
&gt; -+ * Needed for CallStack to operate; if not defined, CallStack is<br>
&gt; -+ * non-functional.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_BACKTRACE 0<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Defined if we have the cxxabi.h header for demangling C++ symbols=
.=C2=A0 If<br>
&gt; -+ * not defined, stack crawls will be displayed with raw mangled symb=
ols<br>
&gt; -+ */<br>
&gt; -+#define HAVE_CXXABI 0<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Defined if we have the gettid() system call.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_GETTID<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Defined if we have the sched_setscheduler() call<br>
&gt; -+ */<br>
&gt; -+#define HAVE_SCHED_SETSCHEDULER<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Add any extra platform-specific defines here.<br>
&gt; -+ */<br>
&gt; -+#ifndef __linux__<br>
&gt; -+#define __linux__<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if we have &lt;malloc.h&gt; header<br>
&gt; -+ */<br>
&gt; -+#define HAVE_MALLOC_H<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if we&#39;re running on *our* linux on device or emulator.=
<br>
&gt; -+ */<br>
&gt; -+#define HAVE_ANDROID_OS 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if we have Linux-style non-filesystem Unix Domain Sockets<=
br>
&gt; -+ */<br>
&gt; -+#define HAVE_LINUX_LOCAL_SOCKET_NAMESPACE 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if we have Linux&#39;s inotify in &lt;sys/inotify.h&gt;.<b=
r>
&gt; -+ */<br>
&gt; -+#define HAVE_INOTIFY 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if we have madvise() in &lt;sys/mman.h&gt;<br>
&gt; -+ */<br>
&gt; -+#define HAVE_MADVISE 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if tm struct has tm_gmtoff field<br>
&gt; -+ */<br>
&gt; -+#define HAVE_TM_GMTOFF 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if dirent struct has d_type field<br>
&gt; -+ */<br>
&gt; -+#define HAVE_DIRENT_D_TYPE 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if libc includes Android system properties implementation.=
<br>
&gt; -+ */<br>
&gt; -+#define HAVE_LIBC_SYSTEM_PROPERTIES 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if system provides a system property server (should be<br>
&gt; -+ * mutually exclusive with HAVE_LIBC_SYSTEM_PROPERTIES).<br>
&gt; -+ */<br>
&gt; -+/* #define HAVE_SYSTEM_PROPERTY_SERVER */<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * What CPU architecture does this platform use?<br>
&gt; -+ */<br>
&gt; -+#define ARCH_AARCH64<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if the size of enums is as short as possible,<br>
&gt; -+ */<br>
&gt; -+/* #define HAVE_SHORT_ENUMS */<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * sprintf() format string for shared library naming.<br>
&gt; -+ */<br>
&gt; -+#define OS_SHARED_LIB_FORMAT_STR=C2=A0 =C2=A0 &quot;lib%s.so&quot;<b=
r>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * type for the third argument to mincore().<br>
&gt; -+ */<br>
&gt; -+#define MINCORE_POINTER_TYPE unsigned char *<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * The default path separator for the platform<br>
&gt; -+ */<br>
&gt; -+#define OS_PATH_SEPARATOR &#39;/&#39;<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Is the filesystem case sensitive?<br>
&gt; -+ */<br>
&gt; -+#define OS_CASE_SENSITIVE<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if &lt;sys/socket.h&gt; exists.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_SYS_SOCKET_H 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if the strlcpy() function exists on the system.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_STRLCPY 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if the open_memstream() function exists on the system.<br>
&gt; -+ */<br>
&gt; -+/* #define HAVE_OPEN_MEMSTREAM 1 */<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if the BSD funopen() function exists on the system.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_FUNOPEN 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if prctl() exists<br>
&gt; -+ */<br>
&gt; -+#define HAVE_PRCTL 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if writev() exists<br>
&gt; -+ */<br>
&gt; -+#define HAVE_WRITEV 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if &lt;stdint.h&gt; exists.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_STDINT_H 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if &lt;stdbool.h&gt; exists.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_STDBOOL_H 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if &lt;sched.h&gt; exists.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_SCHED_H 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if pread() exists<br>
&gt; -+ */<br>
&gt; -+#define HAVE_PREAD 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if we have st_mtim in struct stat<br>
&gt; -+ */<br>
&gt; -+#define HAVE_STAT_ST_MTIM 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define if printf() supports %zd for size_t arguments<br>
&gt; -+ */<br>
&gt; -+#define HAVE_PRINTF_ZD 1<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define to 1 if &lt;stdlib.h&gt; provides qsort_r() with a BSD sty=
le function prototype.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_BSD_QSORT_R 0<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Define to 1 if &lt;stdlib.h&gt; provides qsort_r() with a GNU sty=
le function prototype.<br>
&gt; -+ */<br>
&gt; -+#define HAVE_GNU_QSORT_R 0<br>
&gt; -+<br>
&gt; -+#endif /* _ANDROID_CONFIG_H */<br>
&gt; ---<br>
&gt; -2.17.1<br>
&gt; -<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0001-adb-remove-selinux-extensions.patch b/meta-oe/recipes-devtools/androi=
d-tools/android-tools/core/0001-adb-remove-selinux-extensions.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 7d20c5068..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-a=
db-remove-selinux-extensions.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,44 +0,0 @@<br>
&gt; -From 7b7200727413ca4a9bb132221c543ec033dffafa Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Sergio Schvezov &lt;<a href=3D"mailto:sergio.schvezov@canonical=
.com" target=3D"_blank">sergio.schvezov@canonical.com</a>&gt;<br>
&gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt; -Subject: [PATCH] adb: remove selinux extensions<br>
&gt; -<br>
&gt; -* drop useless includes of Android SELINUX extensions<br>
&gt; -* avoids having to clone another module<br>
&gt; -* this should be sent upstream<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; -<br>
&gt; -Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - adb/file_sync_service.c | 3 ---<br>
&gt; - 1 file changed, 3 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/adb/file_sync_service.c b/adb/file_sync_service.c<br>
&gt; -index 7933858516..3cbd0cd863 100644<br>
&gt; ---- a/adb/file_sync_service.c<br>
&gt; -+++ b/adb/file_sync_service.c<br>
&gt; -@@ -26,7 +26,6 @@<br>
&gt; -<br>
&gt; - #include &lt;errno.h&gt;<br>
&gt; - #include &lt;private/android_filesystem_config.h&gt;<br>
&gt; --#include &lt;selinux/android.h&gt;<br>
&gt; - #include &quot;sysdeps.h&quot;<br>
&gt; -<br>
&gt; - #define TRACE_TAG=C2=A0 TRACE_SYNC<br>
&gt; -@@ -73,7 +72,6 @@ static int mkdirs(char *name)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*x =3D =
&#39;/&#39;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
ret;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 selinux_android_restorecon=
(name, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*x++ =3D &#39;/&#39;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -251,7 +249,6 @@ static int handle_send_file(int s, char *path, ui=
d_t uid,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if(fd &gt;=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct utimbuf u;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adb_close(fd);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 selinux_android_restorecon(path, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u.actime =3D timestamp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u.modtime =3D timestamp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0utime(path, &amp;u);<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0002-adb-Use-local-sockets-where-appropriate.patch b/meta-oe/recipes-devto=
ols/android-tools/android-tools/core/0002-adb-Use-local-sockets-where-appro=
priate.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 3627110ad..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0002-a=
db-Use-local-sockets-where-appropriate.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,70 +0,0 @@<br>
&gt; -From d855f042ca09a358cebe2d3c1d29d512afd7ebb8 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Hilko Bengen &lt;<a href=3D"mailto:bengen@debian.org" target=3D=
"_blank">bengen@debian.org</a>&gt;<br>
&gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt; -Subject: [PATCH] adb: Use local sockets where appropriate<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; ----<br>
&gt; - adb/adb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++++-<=
br>
&gt; - adb/adb_client.c=C2=A0 =C2=A0 =C2=A0 | 5 +++--<br>
&gt; - adb/transport_local.c | 3 ++-<br>
&gt; - 3 files changed, 10 insertions(+), 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/adb/adb.c b/adb/adb.c<br>
&gt; -index 10a1e0da26..027edd9359 100644<br>
&gt; ---- a/adb/adb.c<br>
&gt; -+++ b/adb/adb.c<br>
&gt; -@@ -1230,7 +1230,11 @@ int launch_server(int server_port)<br>
&gt; -=C2=A0 */<br>
&gt; - void build_local_name(char* target_str, size_t target_size, int serv=
er_port)<br>
&gt; - {<br>
&gt; --=C2=A0 snprintf(target_str, target_size, &quot;tcp:%d&quot;, server_=
port);<br>
&gt; -+=C2=A0 if (gListenAll &gt; 0) {<br>
&gt; -+=C2=A0 =C2=A0 snprintf(target_str, target_size, &quot;tcp:%d&quot;, =
server_port);<br>
&gt; -+=C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 snprintf(target_str, target_size, &quot;local:%d&quot;=
, server_port);<br>
&gt; -+=C2=A0 }<br>
&gt; - }<br>
&gt; -<br>
&gt; - #if !ADB_HOST<br>
&gt; -diff --git a/adb/adb_client.c b/adb/adb_client.c<br>
&gt; -index eb1720d22c..a383faefe3 100644<br>
&gt; ---- a/adb/adb_client.c<br>
&gt; -+++ b/adb/adb_client.c<br>
&gt; -@@ -185,12 +185,12 @@ int _adb_connect(const char *service)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy(__adb_error, &quot;service n=
ame too long&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 snprintf(tmp, sizeof tmp, &quot;%04x&quot;, len);<br>
&gt; -+=C2=A0 =C2=A0 snprintf(tmp, sizeof tmp, &quot;%d&quot;, __adb_server=
_port);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (__adb_server_name)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D socket_network_client(__adb_=
server_name, __adb_server_port, SOCK_STREAM);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_loopback_client(__adb_serv=
er_port, SOCK_STREAM);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_local_client(tmp, ANDROID_=
SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if(fd &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy(__adb_error, &quot;cannot co=
nnect to daemon&quot;);<br>
&gt; -@@ -201,6 +201,7 @@ int _adb_connect(const char *service)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 snprintf(tmp, sizeof tmp, &quot;%04x&quot;, len);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if(writex(fd, tmp, 4) || writex(fd, service, len)=
) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy(__adb_error, &quot;write fai=
lure during connection&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adb_close(fd);<br>
&gt; -diff --git a/adb/transport_local.c b/adb/transport_local.c<br>
&gt; -index 948cc15812..71582a8c88 100644<br>
&gt; ---- a/adb/transport_local.c<br>
&gt; -+++ b/adb/transport_local.c<br>
&gt; -@@ -121,7 +121,8 @@ int local_connect_arbitrary_ports(int console_por=
t, int adb_port)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - #endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_loopback_client(adb_port, =
SOCK_STREAM);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(buf, sizeof buf, &quot;%d&quot;=
, adb_port);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_local_client(buf, ANDROID_=
SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (fd &gt;=3D 0) {<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0003-adb-define-shell-command.patch b/meta-oe/recipes-devtools/android-too=
ls/android-tools/core/0003-adb-define-shell-command.patch<br>
&gt; deleted file mode 100644<br>
&gt; index cf1d9cbc3..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0003-a=
db-define-shell-command.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,29 +0,0 @@<br>
&gt; -From 4421c2e19946dcd651fd8ac022b96627fc526149 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Fathi Boudra &lt;<a href=3D"mailto:fabo@debian.org" target=3D"_=
blank">fabo@debian.org</a>&gt;<br>
&gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt; -Subject: [PATCH] adb: define shell command<br>
&gt; -<br>
&gt; -we intend to run on Linux system so the shell is always /bin/sh,<br>
&gt; -for the host or the target.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; ----<br>
&gt; - adb/services.c | 4 ----<br>
&gt; - 1 file changed, 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/adb/services.c b/adb/services.c<br>
&gt; -index 21b08dc201..d44b0c5068 100644<br>
&gt; ---- a/adb/services.c<br>
&gt; -+++ b/adb/services.c<br>
&gt; -@@ -299,11 +299,7 @@ static int create_subproc_raw(const char *cmd, c=
onst char *arg0, const char *arg<br>
&gt; - }<br>
&gt; - #endif=C2=A0 /* !ABD_HOST */<br>
&gt; -<br>
&gt; --#if ADB_HOST<br>
&gt; - #define SHELL_COMMAND &quot;/bin/sh&quot;<br>
&gt; --#else<br>
&gt; --#define SHELL_COMMAND &quot;/system/bin/sh&quot;<br>
&gt; --#endif<br>
&gt; -<br>
&gt; - #if !ADB_HOST<br>
&gt; - static void subproc_waiter_service(int fd, void *cookie)<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0004-adb-Fix-build-on-big-endian-systems.patch b/meta-oe/recipes-devtools/=
android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.p=
atch<br>
&gt; deleted file mode 100644<br>
&gt; index 79e9d4d3b..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-a=
db-Fix-build-on-big-endian-systems.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,45 +0,0 @@<br>
&gt; -From 548b8ca62c64a16305929e2eaf3d546d48de9c25 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@free-el=
ectrons.com" target=3D"_blank">thomas.petazzoni@free-electrons.com</a>&gt;<=
br>
&gt; -Date: Tue, 21 Feb 2017 19:46:24 +0100<br>
&gt; -Subject: [PATCH] adb: Fix build on big endian systems<br>
&gt; -<br>
&gt; -The usb_linux_client.c file defines cpu_to_le16/32 by using the C<br>
&gt; -library htole16/32 function calls. However, cpu_to_le16/32 are used<b=
r>
&gt; -when initializing structures, i.e in a context where a function call<=
br>
&gt; -is not allowed.<br>
&gt; -<br>
&gt; -It works fine on little endian systems because htole16/32 are defined=
<br>
&gt; -by the C library as no-ops. But on big-endian systems, they are<br>
&gt; -actually doing something, which might involve calling a function,<br>
&gt; -causing build failures.<br>
&gt; -<br>
&gt; -To solve this, we simply open-code cpu_to_le16/32 in a way that allow=
s<br>
&gt; -them to be used when initializing structures.<br>
&gt; -<br>
&gt; -Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzon=
i@free-electrons.com" target=3D"_blank">thomas.petazzoni@free-electrons.com=
</a>&gt;<br>
&gt; ----<br>
&gt; - adb/usb_linux_client.c | 11 +++++++++--<br>
&gt; - 1 file changed, 9 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/adb/usb_linux_client.c b/adb/usb_linux_client.c<br>
&gt; -index 8426e0ea14..6e8b5bbbd2 100644<br>
&gt; ---- a/adb/usb_linux_client.c<br>
&gt; -+++ b/adb/usb_linux_client.c<br>
&gt; -@@ -34,8 +34,15 @@<br>
&gt; - #define MAX_PACKET_SIZE_FS=C2=A0 =C2=A0 64<br>
&gt; - #define MAX_PACKET_SIZE_HS=C2=A0 =C2=A0 512<br>
&gt; -<br>
&gt; --#define cpu_to_le16(x)=C2=A0 htole16(x)<br>
&gt; --#define cpu_to_le32(x)=C2=A0 htole32(x)<br>
&gt; -+#if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN<br>
&gt; -+# define cpu_to_le16(x) (x)<br>
&gt; -+# define cpu_to_le32(x) (x)<br>
&gt; -+#else<br>
&gt; -+# define cpu_to_le16(x) ((((x) &gt;&gt; 8) &amp; 0xffu) | (((x) &amp=
; 0xffu) &lt;&lt; 8))<br>
&gt; -+# define cpu_to_le32(x) \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ((((x) &amp; 0xff000000u) &gt;&gt; 24) | (((x) =
&amp; 0x00ff0000u) &gt;&gt;=C2=A0 8) | \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0(((x) &amp; 0x0000ff00u) &lt;&lt;=C2=A0 8=
) | (((x) &amp; 0x000000ffu) &lt;&lt; 24))<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; - struct usb_handle<br>
&gt; - {<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0005-adb-add-base64-implementation.patch b/meta-oe/recipes-devtools/androi=
d-tools/android-tools/core/0005-adb-add-base64-implementation.patch<br>
&gt; deleted file mode 100644<br>
&gt; index fcd4ae238..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-a=
db-add-base64-implementation.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,348 +0,0 @@<br>
&gt; -From 753bcb5971401b82fb2e6197d31c9e386f6d0392 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Fri, 15 Sep 2017 15:46:38 -0700<br>
&gt; -Subject: [PATCH] adb: add base64 implementation<br>
&gt; -<br>
&gt; -musl needs it<br>
&gt; -<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - adb/adb_auth_client.c |=C2=A0 =C2=A02 +-<br>
&gt; - adb/base64.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 315 +++++++++++++++=
+++++++++++++++++++++++++++<br>
&gt; - 2 files changed, 316 insertions(+), 1 deletion(-)<br>
&gt; - create mode 100644 adb/base64.c<br>
&gt; -<br>
&gt; -diff --git a/adb/adb_auth_client.c b/adb/adb_auth_client.c<br>
&gt; -index 55e9dcad19..104b413b8b 100644<br>
&gt; ---- a/adb/adb_auth_client.c<br>
&gt; -+++ b/adb/adb_auth_client.c<br>
&gt; -@@ -75,7 +75,7 @@ static void read_keys(const char *file, struct list=
node *list)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sep)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*sep =3D &#39;\0&#39;=
;<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D __b64_pton(buf, (u_char *)&amp;k=
ey-&gt;key, sizeof(key-&gt;key) + 4);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D b64_pton(buf, (u_char *)&amp;key=
-&gt;key, sizeof(key-&gt;key) + 4);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D sizeof(key-&gt;key)) {=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0D(&quot;%s: Invalid b=
ase64 data ret=3D%d\n&quot;, file, ret);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(key);<br>
&gt; -diff --git a/adb/base64.c b/adb/base64.c<br>
&gt; -new file mode 100644<br>
&gt; -index 0000000000..95da284d0d<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/adb/base64.c<br>
&gt; -@@ -0,0 +1,315 @@<br>
&gt; -+/*<br>
&gt; -+ * Copyright (c) 1996-1999 by Internet Software Consortium.<br>
&gt; -+ *<br>
&gt; -+ * Permission to use, copy, modify, and distribute this software for=
 any<br>
&gt; -+ * purpose with or without fee is hereby granted, provided that the =
above<br>
&gt; -+ * copyright notice and this permission notice appear in all copies.=
<br>
&gt; -+ *<br>
&gt; -+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot; AND INTERNET SOFTWARE =
CONSORTIUM DISCLAIMS<br>
&gt; -+ * ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED=
 WARRANTIES<br>
&gt; -+ * OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL INTERNET SOFTWA=
RE<br>
&gt; -+ * CONSORTIUM BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQ=
UENTIAL<br>
&gt; -+ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DAT=
A OR<br>
&gt; -+ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TO=
RTIOUS<br>
&gt; -+ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMAN=
CE OF THIS<br>
&gt; -+ * SOFTWARE.<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+ * Portions Copyright (c) 1995 by International Business Machines, I=
nc.<br>
&gt; -+ *<br>
&gt; -+ * International Business Machines, Inc. (hereinafter called IBM) gr=
ants<br>
&gt; -+ * permission under its copyrights to use, copy, modify, and distrib=
ute this<br>
&gt; -+ * Software with or without fee, provided that the above copyright n=
otice and<br>
&gt; -+ * all paragraphs of this notice appear in all copies, and that the =
name of IBM<br>
&gt; -+ * not be used in connection with the marketing of any product incor=
porating<br>
&gt; -+ * the Software or modifications thereof, without specific, written =
prior<br>
&gt; -+ * permission.<br>
&gt; -+ *<br>
&gt; -+ * To the extent it has a right to do so, IBM grants an immunity fro=
m suit<br>
&gt; -+ * under its patents, if any, for the use, sale or manufacture of pr=
oducts to<br>
&gt; -+ * the extent that such products are used for performing Domain Name=
 System<br>
&gt; -+ * dynamic updates in TCP/IP networks by means of the Software.=C2=
=A0 No immunity is<br>
&gt; -+ * granted for any product per se or for any other function of any p=
roduct.<br>
&gt; -+ *<br>
&gt; -+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, AND IBM DISCLAIMS ALL=
 WARRANTIES,<br>
&gt; -+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS F=
OR A<br>
&gt; -+ * PARTICULAR PURPOSE.=C2=A0 IN NO EVENT SHALL IBM BE LIABLE FOR ANY=
 SPECIAL,<br>
&gt; -+ * DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOE=
VER ARISING<br>
&gt; -+ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTW=
ARE, EVEN<br>
&gt; -+ * IF IBM IS APPRISED OF THE POSSIBILITY OF SUCH DAMAGES.<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; -+#if !defined(LINT) &amp;&amp; !defined(CODECENTER)<br>
&gt; -+static const char rcsid[] =3D &quot;$BINDId: base64.c,v 8.7 1999/10/=
13 16:39:33 vixie Exp $&quot;;<br>
&gt; -+#endif /* not lint */<br>
&gt; -+<br>
&gt; -+#include &lt;sys/types.h&gt;<br>
&gt; -+#include &lt;sys/param.h&gt;<br>
&gt; -+#include &lt;sys/socket.h&gt;<br>
&gt; -+<br>
&gt; -+#include &lt;netinet/in.h&gt;<br>
&gt; -+#include &lt;arpa/inet.h&gt;<br>
&gt; -+#include &lt;arpa/nameser.h&gt;<br>
&gt; -+<br>
&gt; -+#include &lt;ctype.h&gt;<br>
&gt; -+#include &lt;resolv.h&gt;<br>
&gt; -+#include &lt;stdio.h&gt;<br>
&gt; -+#include &lt;stdlib.h&gt;<br>
&gt; -+#include &lt;stdint.h&gt;<br>
&gt; -+#include &lt;string.h&gt;<br>
&gt; -+<br>
&gt; -+#define Assert(Cond) if (!(Cond)) abort()<br>
&gt; -+<br>
&gt; -+static const char Base64[] =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &quot;ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmno=
pqrstuvwxyz0123456789+/&quot;;<br>
&gt; -+static const char Pad64 =3D &#39;=3D&#39;;<br>
&gt; -+<br>
&gt; -+/* (From RFC1521 and draft-ietf-dnssec-secext-03.txt)<br>
&gt; -+=C2=A0 =C2=A0The following encoding technique is taken from RFC 1521=
 by Borenstein<br>
&gt; -+=C2=A0 =C2=A0and Freed.=C2=A0 It is reproduced here in a slightly ed=
ited form for<br>
&gt; -+=C2=A0 =C2=A0convenience.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0A 65-character subset of US-ASCII is used, enabling 6 b=
its to be<br>
&gt; -+=C2=A0 =C2=A0represented per printable character. (The extra 65th ch=
aracter, &quot;=3D&quot;,<br>
&gt; -+=C2=A0 =C2=A0is used to signify a special processing function.)<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0The encoding process represents 24-bit groups of input =
bits as output<br>
&gt; -+=C2=A0 =C2=A0strings of 4 encoded characters. Proceeding from left t=
o right, a<br>
&gt; -+=C2=A0 =C2=A024-bit input group is formed by concatenating 3 8-bit i=
nput groups.<br>
&gt; -+=C2=A0 =C2=A0These 24 bits are then treated as 4 concatenated 6-bit =
groups, each<br>
&gt; -+=C2=A0 =C2=A0of which is translated into a single digit in the base6=
4 alphabet.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0Each 6-bit group is used as an index into an array of 6=
4 printable<br>
&gt; -+=C2=A0 =C2=A0characters. The character referenced by the index is pl=
aced in the<br>
&gt; -+=C2=A0 =C2=A0output string.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Table 1: The Base64 Alphabet<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 Value Encoding=C2=A0 Value Encoding=C2=A0 Value=
 Encoding=C2=A0 Value Encoding<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 17 R=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 34 i=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 51 z<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 B=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 18 S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 35 j=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 52 0<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 C=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 19 T=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 36 k=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 53 1<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 20 U=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 37 l=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 54 2<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4 E=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 21 V=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 38 m=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 55 3<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5 F=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 22 W=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 39 n=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 56 4<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6 G=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 23 X=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 40 o=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 57 5<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 H=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 24 Y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 41 p=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 58 6<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8 I=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 25 Z=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 42 q=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 59 7<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9 J=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 26 a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 43 r=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 60 8<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010 K=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 27 b=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 44 s=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 61 9<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011 L=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 28 c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 45 t=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 62 +<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012 M=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 29 d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 46 u=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 63 /<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013 N=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 30 e=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 47 v<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014 O=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 31 f=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 48 w=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(pad) =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A015 P=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 32 g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 49 x<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016 Q=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 33 h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 50 y<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0Special processing is performed if fewer than 24 bits a=
re available<br>
&gt; -+=C2=A0 =C2=A0at the end of the data being encoded.=C2=A0 A full enco=
ding quantum is<br>
&gt; -+=C2=A0 =C2=A0always completed at the end of a quantity.=C2=A0 When f=
ewer than 24 input<br>
&gt; -+=C2=A0 =C2=A0bits are available in an input group, zero bits are add=
ed (on the<br>
&gt; -+=C2=A0 =C2=A0right) to form an integral number of 6-bit groups.=C2=
=A0 Padding at the<br>
&gt; -+=C2=A0 =C2=A0end of the data is performed using the &#39;=3D&#39; ch=
aracter.<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0Since all base64 input is an integral number of octets,=
 only the<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0----------------------------------=
---------------<br>
&gt; -+=C2=A0 =C2=A0following cases can arise:<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0(1) the final quantum of encoding input i=
s an integral<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0multiple of 24 bits; here, =
the final unit of encoded<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output will be an integral multipl=
e of 4 characters<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with no &quot;=3D&quot; padding,<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0(2) the final quantum of encoding input i=
s exactly 8 bits;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0here, the final unit of enc=
oded output will be two<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0characters followed by two &quot;=
=3D&quot; padding characters, or<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0(3) the final quantum of encoding input i=
s exactly 16 bits;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0here, the final unit of enc=
oded output will be three<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0characters followed by one &quot;=
=3D&quot; padding character.<br>
&gt; -+=C2=A0 =C2=A0*/<br>
&gt; -+<br>
&gt; -+int<br>
&gt; -+b64_ntop(const uint8_t* src, size_t srclength, char* target, size_t =
targsize)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 size_t datalength =3D 0;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 uint8_t input[3];<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 uint8_t output[4];<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 size_t i;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 while (2 &lt; srclength) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input[0] =3D *src++=
;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input[1] =3D *src++=
;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input[2] =3D *src++=
;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srclength -=3D 3;<b=
r>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[0] =3D input=
[0] &gt;&gt; 2;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[1] =3D ((inp=
ut[0] &amp; 0x03) &lt;&lt; 4) + (input[1] &gt;&gt; 4);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[2] =3D ((inp=
ut[1] &amp; 0x0f) &lt;&lt; 2) + (input[2] &gt;&gt; 6);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[3] =3D input=
[2] &amp; 0x3f;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(output[0] &l=
t; 64);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(output[1] &l=
t; 64);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(output[2] &l=
t; 64);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(output[3] &l=
t; 64);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (datalength + 4 =
&gt; targsize)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return (-1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[datalength++=
] =3D Base64[output[0]];<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[datalength++=
] =3D Base64[output[1]];<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[datalength++=
] =3D Base64[output[2]];<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[datalength++=
] =3D Base64[output[3]];<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 /* Now we worry about padding. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (0 !=3D srclength) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get what&#39;s l=
eft. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input[0] =3D input[=
1] =3D input[2] =3D &#39;\0&#39;;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt=
; srclength; i++)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 input[i] =3D *src++;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[0] =3D input=
[0] &gt;&gt; 2;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[1] =3D ((inp=
ut[0] &amp; 0x03) &lt;&lt; 4) + (input[1] &gt;&gt; 4);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output[2] =3D ((inp=
ut[1] &amp; 0x0f) &lt;&lt; 2) + (input[2] &gt;&gt; 6);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(output[0] &l=
t; 64);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(output[1] &l=
t; 64);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assert(output[2] &l=
t; 64);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (datalength + 4 =
&gt; targsize)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return (-1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[datalength++=
] =3D Base64[output[0]];<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[datalength++=
] =3D Base64[output[1]];<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srclength =3D=
=3D 1)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 target[datalength++] =3D Pad64;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 target[datalength++] =3D Base64[output[2]];<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[datalength++=
] =3D Pad64;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (datalength &gt;=3D targsize)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (-1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 target[datalength] =3D &#39;\0&#39;;=C2=A0 =C2=
=A0 =C2=A0 /* Returned value doesn&#39;t count \0. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return (datalength);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+/* skips all whitespace anywhere.<br>
&gt; -+=C2=A0 =C2=A0converts characters, four at a time, starting at (or af=
ter)<br>
&gt; -+=C2=A0 =C2=A0src from base - 64 numbers into three 8 bit bytes in th=
e target area.<br>
&gt; -+=C2=A0 =C2=A0it returns the number of data bytes stored at the targe=
t, or -1 on error.<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; -+int b64_pton(const char* src, uint8_t* target, size_t targsize)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 int tarindex, state, ch;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 char *pos;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 state =3D 0;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 tarindex =3D 0;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 while ((ch =3D *src++) !=3D &#39;\0&#39;) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (isspace(ch))=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip whitespace anywhere. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ch =3D=3D Pad64=
)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pos =3D strchr(Base=
64, ch);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pos =3D=3D 0)=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* A non-base64 character. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return (-1);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (state) {<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (target) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((size_t)tarindex &gt;=3D targsiz=
e)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (=
-1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex] =3D (pos - Base64) =
&lt;&lt; 2;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 state =3D 1;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (target) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((size_t)tarindex + 1 &gt;=3D tar=
gsize)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (=
-1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex]=C2=A0 =C2=A0|=3D=C2=
=A0 (pos - Base64) &gt;&gt; 4;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex+1]=C2=A0 =3D ((pos -=
 Base64) &amp; 0x0f)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; 4 ;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tarindex++;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 state =3D 2;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (target) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((size_t)tarindex + 1 &gt;=3D tar=
gsize)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (=
-1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex]=C2=A0 =C2=A0|=3D=C2=
=A0 (pos - Base64) &gt;&gt; 2;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex+1]=C2=A0 =3D ((pos -=
 Base64) &amp; 0x03)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; 6;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tarindex++;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 state =3D 3;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (target) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((size_t)tarindex &gt;=3D targsiz=
e)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (=
-1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target[tarindex] |=3D (pos - Base64)=
;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tarindex++;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 state =3D 0;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 abort();<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0* We are done decoding Base-64 chars.=C2=
=A0 Let&#39;s see if we ended<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0* on a byte boundary, and/or with erroneo=
us trailing characters.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (ch =3D=3D Pad64) {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* We got a pad char. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ch =3D *src++;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip it, get next. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (state) {<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* Invalid =3D in first position */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* Invalid =3D in second position */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return (-1);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* Valid, means one byte of info */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Skip any number of spaces. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for ((void)NULL; ch !=3D &#39;\0&#39;; ch =3D *src++)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!isspace(ch))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Make sure there is another trailing =3D sign. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (ch !=3D Pad64)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (-1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ch =3D *src++;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip =
the =3D */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Fall through to &quot;single trailing =3D&quot; case. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* FALLTHROUGH */<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* Valid, means two bytes of info */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* We know this char is an =3D.=C2=A0 Is there anything but=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* whitespace after it?<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for ((void)NULL; ch !=3D &#39;\0&#39;; ch =3D *src++)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!isspace(ch))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (=
-1);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* Now make sure for cases 2 and 3 that the &quot;extra&quo=
t;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* bits that slopped past the last full byte were<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* zeros.=C2=A0 If we don&#39;t check them, they become a<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* subliminal channel.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (target &amp;&amp; target[tarindex] !=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (-1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We ended by=
 seeing the end of the string.=C2=A0 Make sure we<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* have no par=
tial bytes lying around.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (state !=3D 0)<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return (-1);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return (tarindex);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0006-adb-Musl-fixes.patch b/meta-oe/recipes-devtools/android-tools/android=
-tools/core/0006-adb-Musl-fixes.patch<br>
&gt; deleted file mode 100644<br>
&gt; index b5d383f38..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-a=
db-Musl-fixes.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,131 +0,0 @@<br>
&gt; -From 62d957a1271c88ec08d67984fbe31601f0bd41a9 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Fri, 15 Sep 2017 15:50:57 -0700<br>
&gt; -Subject: [PATCH] adb: Musl fixes<br>
&gt; -<br>
&gt; -__nonnull is gcc specific<br>
&gt; -include sys/types.h for size_t<br>
&gt; -Do not redefine close() and lseek()<br>
&gt; -<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - adb/adb.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt; - adb/disable_verity_service.c | 13 ++++++++-----<br>
&gt; - adb/framebuffer_service.c=C2=A0 =C2=A0 |=C2=A0 7 ++++---<br>
&gt; - adb/sysdeps.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 12 ++++++------<br>
&gt; - 4 files changed, 20 insertions(+), 14 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/adb/adb.h b/adb/adb.h<br>
&gt; -index 44e5981bdc..bcdc49f63c 100644<br>
&gt; ---- a/adb/adb.h<br>
&gt; -+++ b/adb/adb.h<br>
&gt; -@@ -18,7 +18,9 @@<br>
&gt; - #define __ADB_H<br>
&gt; -<br>
&gt; - #include &lt;limits.h&gt;<br>
&gt; -+#include &lt;sys/types.h&gt;<br>
&gt; -<br>
&gt; -+#include &quot;fdevent.h&quot;<br>
&gt; - #include &quot;adb_trace.h&quot;<br>
&gt; - #include &quot;transport.h&quot;=C2=A0 /* readx(), writex() */<br>
&gt; -<br>
&gt; -diff --git a/adb/disable_verity_service.c b/adb/disable_verity_servic=
e.c<br>
&gt; -index ed3da52108..29fa3d65a9 100644<br>
&gt; ---- a/adb/disable_verity_service.c<br>
&gt; -+++ b/adb/disable_verity_service.c<br>
&gt; -@@ -14,25 +14,28 @@<br>
&gt; -=C2=A0 * limitations under the License.<br>
&gt; -=C2=A0 */<br>
&gt; -<br>
&gt; --#include &quot;sysdeps.h&quot;<br>
&gt; -<br>
&gt; - #define=C2=A0 TRACE_TAG=C2=A0 TRACE_ADB<br>
&gt; - #include &quot;adb.h&quot;<br>
&gt; -+#include &quot;sysdeps.h&quot;<br>
&gt; -+#include &quot;cutils/properties.h&quot;<br>
&gt; -+#include &quot;ext4_sb.h&quot;<br>
&gt; -+#include &lt;fs_mgr.h&gt;<br>
&gt; -<br>
&gt; - #include &lt;stdio.h&gt;<br>
&gt; - #include &lt;stdarg.h&gt;<br>
&gt; - #include &lt;sys/stat.h&gt;<br>
&gt; - #include &lt;fcntl.h&gt;<br>
&gt; - #include &lt;inttypes.h&gt;<br>
&gt; -+#include &lt;unistd.h&gt;<br>
&gt; -+#include &lt;errno.h&gt;<br>
&gt; -+#include &lt;stdbool.h&gt;<br>
&gt; -<br>
&gt; --#include &quot;cutils/properties.h&quot;<br>
&gt; --#include &quot;ext4_sb.h&quot;<br>
&gt; --#include &lt;fs_mgr.h&gt;<br>
&gt; -<br>
&gt; - #define FSTAB_PREFIX &quot;/fstab.&quot;<br>
&gt; - struct fstab *fstab;<br>
&gt; -<br>
&gt; --__attribute__((__format__(printf, 2, 3))) __nonnull((2))<br>
&gt; -+__attribute__((__format__(printf, 2, 3))) __attribute__((nonnull((2)=
)))<br>
&gt; - static void write_console(int fd, const char* format, ...)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char buffer[256];<br>
&gt; -diff --git a/adb/framebuffer_service.c b/adb/framebuffer_service.c<br=
>
&gt; -index 8cbe8403cc..8f0ccfb7aa 100644<br>
&gt; ---- a/adb/framebuffer_service.c<br>
&gt; -+++ b/adb/framebuffer_service.c<br>
&gt; -@@ -14,6 +14,10 @@<br>
&gt; -=C2=A0 * limitations under the License.<br>
&gt; -=C2=A0 */<br>
&gt; -<br>
&gt; -+#include &quot;fdevent.h&quot;<br>
&gt; -+#include &quot;adb.h&quot;<br>
&gt; -+#include &quot;sysdeps.h&quot;<br>
&gt; -+<br>
&gt; - #include &lt;stdlib.h&gt;<br>
&gt; - #include &lt;stdio.h&gt;<br>
&gt; - #include &lt;unistd.h&gt;<br>
&gt; -@@ -23,9 +27,6 @@<br>
&gt; - #include &lt;sys/types.h&gt;<br>
&gt; - #include &lt;sys/wait.h&gt;<br>
&gt; -<br>
&gt; --#include &quot;fdevent.h&quot;<br>
&gt; --#include &quot;adb.h&quot;<br>
&gt; --<br>
&gt; - #include &lt;linux/fb.h&gt;<br>
&gt; - #include &lt;sys/ioctl.h&gt;<br>
&gt; - #include &lt;sys/mman.h&gt;<br>
&gt; -diff --git a/adb/sysdeps.h b/adb/sysdeps.h<br>
&gt; -index cc1f839e9f..ea39ac39cc 100644<br>
&gt; ---- a/adb/sysdeps.h<br>
&gt; -+++ b/adb/sysdeps.h<br>
&gt; -@@ -123,8 +123,8 @@ static __inline__ int=C2=A0 unix_close(int fd)<br=
>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return close(fd);<br>
&gt; - }<br>
&gt; --#undef=C2=A0 =C2=A0close<br>
&gt; --#define=C2=A0 close=C2=A0 =C2=A0____xxx_close<br>
&gt; -+//#undef=C2=A0 =C2=A0close<br>
&gt; -+//#define=C2=A0 close=C2=A0 =C2=A0____xxx_close<br>
&gt; -<br>
&gt; - static __inline__=C2=A0 int=C2=A0 unix_read(int=C2=A0 fd, void*=C2=
=A0 buf, size_t=C2=A0 len)<br>
&gt; - {<br>
&gt; -@@ -369,8 +369,8 @@ static __inline__ int=C2=A0 adb_close(int fd)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return close(fd);<br>
&gt; - }<br>
&gt; --#undef=C2=A0 =C2=A0close<br>
&gt; --#define=C2=A0 close=C2=A0 =C2=A0____xxx_close<br>
&gt; -+//#undef=C2=A0 =C2=A0close<br>
&gt; -+//#define=C2=A0 close=C2=A0 =C2=A0____xxx_close<br>
&gt; -<br>
&gt; -<br>
&gt; - static __inline__=C2=A0 int=C2=A0 adb_read(int=C2=A0 fd, void*=C2=A0=
 buf, size_t=C2=A0 len)<br>
&gt; -@@ -392,8 +392,8 @@ static __inline__ int=C2=A0 =C2=A0adb_lseek(int=
=C2=A0 fd, int=C2=A0 pos, int=C2=A0 where)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return lseek(fd, pos, where);<br>
&gt; - }<br>
&gt; --#undef=C2=A0 =C2=A0lseek<br>
&gt; --#define=C2=A0 lseek=C2=A0 =C2=A0___xxx_lseek<br>
&gt; -+//#undef=C2=A0 =C2=A0lseek<br>
&gt; -+//#define=C2=A0 lseek=C2=A0 =C2=A0___xxx_lseek<br>
&gt; -<br>
&gt; - static __inline__=C2=A0 int=C2=A0 =C2=A0 adb_unlink(const char*=C2=
=A0 path)<br>
&gt; - {<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch b/meta-oe/recipes-dev=
tools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-=
glibc-2.28.patch<br>
&gt; deleted file mode 100644<br>
&gt; index e02a95687..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-a=
db-usb_linux.c-fix-build-with-glibc-2.28.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,24 +0,0 @@<br>
&gt; -From de393bba41c8feff932c77d6c30233945f380d42 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; -Date: Sat, 11 Aug 2018 13:23:37 +0000<br>
&gt; -Subject: [PATCH] adb: usb_linux.c: fix build with glibc-2.28<br>
&gt; -<br>
&gt; -* include sysmacros for major, minor<br>
&gt; -<br>
&gt; -Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - adb/usb_linux.c | 1 +<br>
&gt; - 1 file changed, 1 insertion(+)<br>
&gt; -<br>
&gt; -diff --git a/adb/usb_linux.c b/adb/usb_linux.c<br>
&gt; -index f16bdd0361..c8a7732441 100644<br>
&gt; ---- a/adb/usb_linux.c<br>
&gt; -+++ b/adb/usb_linux.c<br>
&gt; -@@ -22,6 +22,7 @@<br>
&gt; - #include &lt;sys/ioctl.h&gt;<br>
&gt; - #include &lt;sys/types.h&gt;<br>
&gt; - #include &lt;sys/time.h&gt;<br>
&gt; -+#include &lt;sys/sysmacros.h&gt;<br>
&gt; - #include &lt;dirent.h&gt;<br>
&gt; - #include &lt;fcntl.h&gt;<br>
&gt; - #include &lt;errno.h&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0008-adb-Allow-adbd-to-be-ran-as-root.patch b/meta-oe/recipes-devtools/and=
roid-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch<b=
r>
&gt; deleted file mode 100644<br>
&gt; index 7d223e05f..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-a=
db-Allow-adbd-to-be-ran-as-root.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,21 +0,0 @@<br>
&gt; -From 3a788e9168c9b9eac66c4fa479413f4a95c61be4 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Florent Revest &lt;<a href=3D"mailto:revestflo@gmail.com" targe=
t=3D"_blank">revestflo@gmail.com</a>&gt;<br>
&gt; -Date: Mon, 30 Oct 2017 21:05:46 +0100<br>
&gt; -Subject: [PATCH] adb: Allow adbd to be ran as root<br>
&gt; -<br>
&gt; ----<br>
&gt; - adb/adb.c | 1 +<br>
&gt; - 1 file changed, 1 insertion(+)<br>
&gt; -<br>
&gt; -diff --git a/adb/adb.c b/adb/adb.c<br>
&gt; -index 027edd9359..e0f7ecde45 100644<br>
&gt; ---- a/adb/adb.c<br>
&gt; -+++ b/adb/adb.c<br>
&gt; -@@ -1271,6 +1271,7 @@ static int should_drop_privileges() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int secure =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char value[PROPERTY_VALUE_MAX];<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 return 0;<br>
&gt; -=C2=A0 =C2=A0 /* run adbd in secure mode if ro.secure is set and<br>
&gt; -=C2=A0 =C2=A0 =C2=A0** we are not in the emulator<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch b/meta-oe/recipe=
s-devtools/android-tools/android-tools/core/0009-mkbootimg-Add-dt-parameter=
-to-specify-DT-image.patch<br>
&gt; deleted file mode 100644<br>
&gt; index a4dc6e1e3..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0009-m=
kbootimg-Add-dt-parameter-to-specify-DT-image.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,110 +0,0 @@<br>
&gt; -From dd195778a9930b7967b21a3b8eb390b70253dbad Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: David Ng &lt;<a href=3D"mailto:dave@codeaurora.org" target=3D"_=
blank">dave@codeaurora.org</a>&gt;<br>
&gt; -Date: Fri, 27 Jul 2012 17:15:03 -0700<br>
&gt; -Subject: [PATCH] mkbootimg: Add --dt parameter to specify DT image<br=
>
&gt; -<br>
&gt; -New optional --dt parameter to specify a kernel device<br>
&gt; -tree image.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; ----<br>
&gt; - mkbootimg/bootimg.h=C2=A0 =C2=A0|=C2=A0 7 +++++--<br>
&gt; - mkbootimg/mkbootimg.c | 21 +++++++++++++++++++++<br>
&gt; - 2 files changed, 26 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/mkbootimg/bootimg.h b/mkbootimg/bootimg.h<br>
&gt; -index 9171d85a7b..308c537d6b 100644<br>
&gt; ---- a/mkbootimg/bootimg.h<br>
&gt; -+++ b/mkbootimg/bootimg.h<br>
&gt; -@@ -41,8 +41,8 @@ struct boot_img_hdr<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned tags_addr;=C2=A0 =C2=A0 /* physical addr=
 for kernel tags */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned page_size;=C2=A0 =C2=A0 /* flash page si=
ze we assume */<br>
&gt; --=C2=A0 =C2=A0 unsigned unused[2];=C2=A0 =C2=A0 /* future expansion: =
should be 0 */<br>
&gt; --<br>
&gt; -+=C2=A0 =C2=A0 unsigned dt_size;=C2=A0 =C2=A0 =C2=A0 /* device tree i=
n bytes */<br>
&gt; -+=C2=A0 =C2=A0 unsigned unused;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* future e=
xpansion: should be 0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned char name[BOOT_NAME_SIZE]; /* asciiz pro=
duct name */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned char cmdline[BOOT_ARGS_SIZE];<br>
&gt; -@@ -64,10 +64,13 @@ struct boot_img_hdr<br>
&gt; - ** +-----------------+<br>
&gt; - ** | second stage=C2=A0 =C2=A0 | o pages<br>
&gt; - ** +-----------------+<br>
&gt; -+** | device tree=C2=A0 =C2=A0 =C2=A0| p pages<br>
&gt; -+** +-----------------+<br>
&gt; - **<br>
&gt; - ** n =3D (kernel_size + page_size - 1) / page_size<br>
&gt; - ** m =3D (ramdisk_size + page_size - 1) / page_size<br>
&gt; - ** o =3D (second_size + page_size - 1) / page_size<br>
&gt; -+** p =3D (dt_size + page_size - 1) / page_size<br>
&gt; - **<br>
&gt; - ** 0. all entities are page_size aligned in flash<br>
&gt; - ** 1. kernel and ramdisk are required (size !=3D 0)<br>
&gt; -diff --git a/mkbootimg/mkbootimg.c b/mkbootimg/mkbootimg.c<br>
&gt; -index fc92b4dc30..658052cdf2 100644<br>
&gt; ---- a/mkbootimg/mkbootimg.c<br>
&gt; -+++ b/mkbootimg/mkbootimg.c<br>
&gt; -@@ -65,6 +65,7 @@ int usage(void)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0[ --board &lt;boardname&gt; ]\n&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0[ --base &lt;address&gt; ]\n&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0[ --pagesize &lt;pagesize&gt; ]\n&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0[ --dt &lt;filename&gt; ]\n&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0-o|--output &lt;filename&gt;\n&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; -@@ -105,6 +106,8 @@ int main(int argc, char **argv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char *cmdline =3D &quot;&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char *bootimg =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char *board =3D &quot;&quot;;<br>
&gt; -+=C2=A0 =C2=A0 char *dt_fn =3D 0;<br>
&gt; -+=C2=A0 =C2=A0 void *dt_data =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned pagesize =3D 2048;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int fd;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0SHA_CTX ctx;<br>
&gt; -@@ -158,6 +161,8 @@ int main(int argc, char **argv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf=
(stderr,&quot;error: unsupported page size %d\n&quot;, pagesize);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
-1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if(!strcmp(arg, &quot;--dt&quot;)=
) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dt_fn =3D val;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return usage();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -232,6 +237,14 @@ int main(int argc, char **argv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 if(dt_fn) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dt_data =3D load_file(dt_fn, &amp;hdr.dt=
_size);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dt_data =3D=3D 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,&quot;error=
: could not load device tree image &#39;%s&#39;\n&quot;, dt_fn);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* put a hash of the contents in the header so bo=
ot images can be<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * differentiated based on their first 2k.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -@@ -242,6 +255,10 @@ int main(int argc, char **argv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0SHA_update(&amp;ctx, &amp;hdr.ramdisk_size, sizeo=
f(hdr.ramdisk_size));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0SHA_update(&amp;ctx, second_data, hdr.second_size=
);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0SHA_update(&amp;ctx, &amp;hdr.second_size, sizeof=
(hdr.second_size));<br>
&gt; -+=C2=A0 =C2=A0 if(dt_data) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SHA_update(&amp;ctx, dt_data, hdr.dt_siz=
e);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SHA_update(&amp;ctx, &amp;hdr.dt_size, s=
izeof(hdr.dt_size));<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sha =3D SHA_final(&amp;ctx);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0memcpy(<a href=3D"http://hdr.id" rel=3D"noreferre=
r" target=3D"_blank">hdr.id</a>, sha,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SHA_DIGEST_SIZE &gt; sizeof=
(<a href=3D"http://hdr.id" rel=3D"noreferrer" target=3D"_blank">hdr.id</a>)=
 ? sizeof(<a href=3D"http://hdr.id" rel=3D"noreferrer" target=3D"_blank">hd=
r.id</a>) : SHA_DIGEST_SIZE);<br>
&gt; -@@ -266,6 +283,10 @@ int main(int argc, char **argv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(write_padding(fd, pagesize, hdr.=
second_size)) goto fail;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 if(dt_data) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(write(fd, dt_data, hdr.dt_size) !=3D =
(ssize_t) hdr.dt_size) goto fail;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(write_padding(fd, pagesize, hdr.dt_si=
ze)) goto fail;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -<br>
&gt; - fail:<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0010-Use-linux-capability.h-on-linux-systems-too.patch b/meta-oe/recipes-d=
evtools/android-tools/android-tools/core/0010-Use-linux-capability.h-on-lin=
ux-systems-too.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 2c607ff67..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0010-U=
se-linux-capability.h-on-linux-systems-too.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,23 +0,0 @@<br>
&gt; -From ef743c9c3c7452ae904a5c343ee2b759ab3a87cb Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: =3D?UTF-8?q?Lo=3DC3=3DAFc=3D20Minier?=3D &lt;<a href=3D"mailto:=
loic.minier@ubuntu.com" target=3D"_blank">loic.minier@ubuntu.com</a>&gt;<br=
>
&gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt; -Subject: [PATCH] Use linux/capability.h on linux systems too<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; ----<br>
&gt; - include/private/android_filesystem_config.h | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/include/private/android_filesystem_config.h b/include/pr=
ivate/android_filesystem_config.h<br>
&gt; -index 2f528b95c8..3e0b00928e 100644<br>
&gt; ---- a/include/private/android_filesystem_config.h<br>
&gt; -+++ b/include/private/android_filesystem_config.h<br>
&gt; -@@ -27,7 +27,7 @@<br>
&gt; - #include &lt;sys/types.h&gt;<br>
&gt; - #include &lt;stdint.h&gt;<br>
&gt; -<br>
&gt; --#ifdef HAVE_ANDROID_OS<br>
&gt; -+#if defined(HAVE_ANDROID_OS) || defined(__linux__)<br>
&gt; - #include &lt;linux/capability.h&gt;<br>
&gt; - #else<br>
&gt; - #include &quot;android_filesystem_capability.h&quot;<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0011-Remove-bionic-specific-calls.patch b/meta-oe/recipes-devtools/android=
-tools/android-tools/core/0011-Remove-bionic-specific-calls.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 5b18f461a..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0011-R=
emove-bionic-specific-calls.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,64 +0,0 @@<br>
&gt; -From 9eff8799831961c0edf6e37e5d4cbf43baa7c748 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Fathi Boudra &lt;<a href=3D"mailto:fabo@debian.org" target=3D"_=
blank">fabo@debian.org</a>&gt;<br>
&gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt; -Subject: [PATCH] Remove bionic specific calls<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; ----<br>
&gt; - include/cutils/properties.h | 1 -<br>
&gt; - libcutils/properties.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; - liblog/logd_write.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
&gt; - 3 files changed, 6 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/include/cutils/properties.h b/include/cutils/properties.=
h<br>
&gt; -index 798db8b36f..7d01f28d6e 100644<br>
&gt; ---- a/include/cutils/properties.h<br>
&gt; -+++ b/include/cutils/properties.h<br>
&gt; -@@ -19,7 +19,6 @@<br>
&gt; -<br>
&gt; - #include &lt;sys/cdefs.h&gt;<br>
&gt; - #include &lt;stddef.h&gt;<br>
&gt; --#include &lt;sys/system_properties.h&gt;<br>
&gt; - #include &lt;stdint.h&gt;<br>
&gt; -<br>
&gt; - #ifdef __cplusplus<br>
&gt; -diff --git a/libcutils/properties.c b/libcutils/properties.c<br>
&gt; -index b283658aa4..4151e7882c 100644<br>
&gt; ---- a/libcutils/properties.c<br>
&gt; -+++ b/libcutils/properties.c<br>
&gt; -@@ -104,10 +104,10 @@ int32_t property_get_int32(const char *key, int=
32_t default_value) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return (int32_t)property_get_imax(key, INT32_MIN,=
 INT32_MAX, default_value);<br>
&gt; - }<br>
&gt; -<br>
&gt; -+#undef HAVE_LIBC_SYSTEM_PROPERTIES<br>
&gt; - #ifdef HAVE_LIBC_SYSTEM_PROPERTIES<br>
&gt; -<br>
&gt; - #define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_<br>
&gt; --#include &lt;sys/_system_properties.h&gt;<br>
&gt; -<br>
&gt; - int property_set(const char *key, const char *value)<br>
&gt; - {<br>
&gt; -diff --git a/liblog/logd_write.c b/liblog/logd_write.c<br>
&gt; -index b2668cedb7..f5a44fe901 100644<br>
&gt; ---- a/liblog/logd_write.c<br>
&gt; -+++ b/liblog/logd_write.c<br>
&gt; -@@ -23,6 +23,7 @@<br>
&gt; - #include &lt;stdlib.h&gt;<br>
&gt; - #include &lt;string.h&gt;<br>
&gt; - #include &lt;sys/stat.h&gt;<br>
&gt; -+#include &lt;sys/syscall.h&gt;<br>
&gt; - #include &lt;sys/types.h&gt;<br>
&gt; - #if (FAKE_LOG_DEVICE =3D=3D 0)<br>
&gt; - #include &lt;sys/socket.h&gt;<br>
&gt; -@@ -205,7 +206,11 @@ static int __write_to_log_kernel(log_id_t log_id=
, struct iovec *vec, size_t nr)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0realtime_ts.tv_nsec =3D ts.tv_nsec;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0log_id_buf =3D log_id;<br>
&gt; -+#ifdef __BIONIC__<br>
&gt; -=C2=A0 =C2=A0 =C2=A0tid =3D gettid();<br>
&gt; -+#else<br>
&gt; -+=C2=A0 =C2=A0 tid =3D (pid_t) syscall(__NR_gettid);<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0newVec[0].iov_base=C2=A0 =C2=A0=3D (unsigned char=
 *) &amp;log_id_buf;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0newVec[0].iov_len=C2=A0 =C2=A0 =3D sizeof_log_id_=
t;<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch b/meta-oe/=
recipes-devtools/android-tools/android-tools/core/0012-Fix-implicit-declara=
tion-of-stlcat-strlcopy-function.patch<br>
&gt; deleted file mode 100644<br>
&gt; index b0feb6592..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0012-F=
ix-implicit-declaration-of-stlcat-strlcopy-function.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,50 +0,0 @@<br>
&gt; -From cd4525d760c6f88c9bf85f7bf488da79cd0d3264 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Fathi Boudra &lt;<a href=3D"mailto:fabo@debian.org" target=3D"_=
blank">fabo@debian.org</a>&gt;<br>
&gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt; -Subject: [PATCH] Fix implicit declaration of stlcat/strlcopy function=
s<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; ----<br>
&gt; - adb/adb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
 +<br>
&gt; - fs_mgr/fs_mgr_fstab.c=C2=A0 =C2=A0 | 2 +-<br>
&gt; - include/cutils/sockets.h | 2 +-<br>
&gt; - 3 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/adb/adb.c b/adb/adb.c<br>
&gt; -index e0f7ecde45..aaefd9b401 100644<br>
&gt; ---- a/adb/adb.c<br>
&gt; -+++ b/adb/adb.c<br>
&gt; -@@ -41,6 +41,7 @@<br>
&gt; - #include &lt;sys/prctl.h&gt;<br>
&gt; - #include &lt;getopt.h&gt;<br>
&gt; - #include &lt;selinux/selinux.h&gt;<br>
&gt; -+#include &lt;grp.h&gt;<br>
&gt; - #else<br>
&gt; - #include &quot;usb_vendors.h&quot;<br>
&gt; - #endif<br>
&gt; -diff --git a/fs_mgr/fs_mgr_fstab.c b/fs_mgr/fs_mgr_fstab.c<br>
&gt; -index edd9591164..9ddb4643b5 100644<br>
&gt; ---- a/fs_mgr/fs_mgr_fstab.c<br>
&gt; -+++ b/fs_mgr/fs_mgr_fstab.c<br>
&gt; -@@ -17,7 +17,7 @@<br>
&gt; - #include &lt;ctype.h&gt;<br>
&gt; - #include &lt;stdio.h&gt;<br>
&gt; - #include &lt;stdlib.h&gt;<br>
&gt; --#include &lt;string.h&gt;<br>
&gt; -+#include &lt;bsd/string.h&gt;<br>
&gt; - #include &lt;sys/mount.h&gt;<br>
&gt; -<br>
&gt; - #include &quot;fs_mgr_priv.h&quot;<br>
&gt; -diff --git a/include/cutils/sockets.h b/include/cutils/sockets.h<br>
&gt; -index daf43ec944..d3270c69e7 100644<br>
&gt; ---- a/include/cutils/sockets.h<br>
&gt; -+++ b/include/cutils/sockets.h<br>
&gt; -@@ -19,7 +19,7 @@<br>
&gt; -<br>
&gt; - #include &lt;errno.h&gt;<br>
&gt; - #include &lt;stdlib.h&gt;<br>
&gt; --#include &lt;string.h&gt;<br>
&gt; -+#include &lt;bsd/string.h&gt;<br>
&gt; - #include &lt;stdbool.h&gt;<br>
&gt; -<br>
&gt; - #ifdef HAVE_WINSOCK<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/0013-adb-Support-riscv64.patch b/meta-oe/recipes-devtools/android-tools/an=
droid-tools/core/0013-adb-Support-riscv64.patch<br>
&gt; deleted file mode 100644<br>
&gt; index a8434afba..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-a=
db-Support-riscv64.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,189 +0,0 @@<br>
&gt; -From 48ddf4fb999931942c359350fb31cd557514e1c6 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Chenxi Mao &lt;<a href=3D"mailto:maochenxi@eswin.com" target=3D=
"_blank">maochenxi@eswin.com</a>&gt;<br>
&gt; -Date: Mon, 20 Apr 2020 15:27:22 +0800<br>
&gt; -Subject: [PATCH 1/1] adb: Support riscv64<br>
&gt; -<br>
&gt; ----<br>
&gt; - include/cutils/atomic-inline.h=C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; - include/cutils/atomic-riscv64.h | 156 ++++++++++++++++++++++++++++++=
++<br>
&gt; - 2 files changed, 158 insertions(+)<br>
&gt; - create mode 100644 include/cutils/atomic-riscv64.h<br>
&gt; -<br>
&gt; -diff --git a/include/cutils/atomic-inline.h b/include/cutils/atomic-i=
nline.h<br>
&gt; -index a31e913579..b5dc38209c 100644<br>
&gt; ---- a/include/cutils/atomic-inline.h<br>
&gt; -+++ b/include/cutils/atomic-inline.h<br>
&gt; -@@ -55,6 +55,8 @@ extern &quot;C&quot; {<br>
&gt; - #include &lt;cutils/atomic-mips64.h&gt;<br>
&gt; - #elif defined(__mips__)<br>
&gt; - #include &lt;cutils/atomic-mips.h&gt;<br>
&gt; -+#elif defined(__riscv) &amp;&amp; __riscv_xlen =3D=3D 64<br>
&gt; -+#include &lt;cutils/atomic-riscv64.h&gt;<br>
&gt; - #else<br>
&gt; - #error atomic operations are unsupported<br>
&gt; - #endif<br>
&gt; -diff --git a/include/cutils/atomic-riscv64.h b/include/cutils/atomic-=
riscv64.h<br>
&gt; -new file mode 100644<br>
&gt; -index 0000000000..2664db5a86<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/include/cutils/atomic-riscv64.h<br>
&gt; -@@ -0,0 +1,156 @@<br>
&gt; -+/*<br>
&gt; -+ * Copyright (C) 2014 The Android Open Source Project<br>
&gt; -+ * All rights reserved.<br>
&gt; -+ *<br>
&gt; -+ * Redistribution and use in source and binary forms, with or withou=
t<br>
&gt; -+ * modification, are permitted provided that the following condition=
s<br>
&gt; -+ * are met:<br>
&gt; -+ *=C2=A0 * Redistributions of source code must retain the above copy=
right<br>
&gt; -+ *=C2=A0 =C2=A0 notice, this list of conditions and the following di=
sclaimer.<br>
&gt; -+ *=C2=A0 * Redistributions in binary form must reproduce the above c=
opyright<br>
&gt; -+ *=C2=A0 =C2=A0 notice, this list of conditions and the following di=
sclaimer in<br>
&gt; -+ *=C2=A0 =C2=A0 the documentation and/or other materials provided wi=
th the<br>
&gt; -+ *=C2=A0 =C2=A0 distribution.<br>
&gt; -+ *<br>
&gt; -+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTO=
RS<br>
&gt; -+ * &quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDIN=
G, BUT NOT<br>
&gt; -+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS=
<br>
&gt; -+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE<br=
>
&gt; -+ * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIREC=
T,<br>
&gt; -+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDI=
NG,<br>
&gt; -+ * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; =
LOSS<br>
&gt; -+ * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSE=
D<br>
&gt; -+ * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABI=
LITY,<br>
&gt; -+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OU=
T<br>
&gt; -+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY O=
F<br>
&gt; -+ * SUCH DAMAGE.<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; -+#ifndef ANDROID_CUTILS_ATOMIC_RISCV64_H<br>
&gt; -+#define ANDROID_CUTILS_ATOMIC_RISCV64_H<br>
&gt; -+<br>
&gt; -+#include &lt;stdint.h&gt;<br>
&gt; -+<br>
&gt; -+#ifndef ANDROID_ATOMIC_INLINE<br>
&gt; -+#define ANDROID_ATOMIC_INLINE inline __attribute__((always_inline))<=
br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; -+/*<br>
&gt; -+=C2=A0 =C2=A0TODOAArch64: Revisit the below functions and check for =
potential<br>
&gt; -+=C2=A0 =C2=A0optimizations using assembly code or otherwise.<br>
&gt; -+*/<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+void android_compiler_barrier(void)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 __asm__ __volatile__ (&quot;&quot; : : : &quot;memory&=
quot;);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+void android_memory_barrier(void)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 __asm__ __volatile__ (&quot;fence rw,rw&quot; : : : &q=
uot;memory&quot;);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+int32_t android_atomic_acquire_load(volatile const int32_t *ptr)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 int32_t value =3D *ptr;<br>
&gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt; -+=C2=A0 =C2=A0 return value;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+int32_t android_atomic_release_load(volatile const int32_t *ptr)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt; -+=C2=A0 =C2=A0 return *ptr;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+void android_atomic_acquire_store(int32_t value, volatile int32_t *p=
tr)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 *ptr =3D value;<br>
&gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+void android_atomic_release_store(int32_t value, volatile int32_t *p=
tr)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt; -+=C2=A0 =C2=A0 *ptr =3D value;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+int android_atomic_cas(int32_t old_value, int32_t new_value,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0volatile int32_t *ptr)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 return __sync_val_compare_and_swap(ptr, old_value, new=
_value) !=3D old_value;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+int android_atomic_acquire_cas(int32_t old_value, int32_t new_value,=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0volatile int32_t *ptr)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 int status =3D android_atomic_cas(old_value, new_value=
, ptr);<br>
&gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt; -+=C2=A0 =C2=A0 return status;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+int android_atomic_release_cas(int32_t old_value, int32_t new_value,=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0volatile int32_t *ptr)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt; -+=C2=A0 =C2=A0 return android_atomic_cas(old_value, new_value, ptr);<=
br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+int32_t android_atomic_add(int32_t increment, volatile int32_t *ptr)=
<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 int32_t prev, status;<br>
&gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt; -+=C2=A0 =C2=A0 do {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D *ptr;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D android_atomic_cas(prev, prev=
 + increment, ptr);<br>
&gt; -+=C2=A0 =C2=A0 } while (__builtin_expect(status !=3D 0, 0));<br>
&gt; -+=C2=A0 =C2=A0 return prev;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+int32_t android_atomic_inc(volatile int32_t *addr)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 return android_atomic_add(1, addr);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+int32_t android_atomic_dec(volatile int32_t *addr)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 return android_atomic_add(-1, addr);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+int32_t android_atomic_and(int32_t value, volatile int32_t *ptr)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 int32_t prev, status;<br>
&gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt; -+=C2=A0 =C2=A0 do {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D *ptr;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D android_atomic_cas(prev, prev=
 &amp; value, ptr);<br>
&gt; -+=C2=A0 =C2=A0 } while (__builtin_expect(status !=3D 0, 0));<br>
&gt; -+=C2=A0 =C2=A0 return prev;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+extern ANDROID_ATOMIC_INLINE<br>
&gt; -+int32_t android_atomic_or(int32_t value, volatile int32_t *ptr)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 int32_t prev, status;<br>
&gt; -+=C2=A0 =C2=A0 android_memory_barrier();<br>
&gt; -+=C2=A0 =C2=A0 do {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev =3D *ptr;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D android_atomic_cas(prev, prev=
 | value, ptr);<br>
&gt; -+=C2=A0 =C2=A0 } while (__builtin_expect(status !=3D 0, 0));<br>
&gt; -+=C2=A0 =C2=A0 return prev;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+#endif /* ANDROID_CUTILS_ATOMIC_RISCV_H */<br>
&gt; ---<br>
&gt; -2.17.1<br>
&gt; -<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core=
/adb_libssl_11.diff b/meta-oe/recipes-devtools/android-tools/android-tools/=
core/adb_libssl_11.diff<br>
&gt; deleted file mode 100644<br>
&gt; index 3ead649b1..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_li=
bssl_11.diff<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,39 +0,0 @@<br>
&gt; -Description: adb: Make compatible with openssl 1.1<br>
&gt; - OpenSSL version 1.1 brought some API changes which broke the build h=
ere,<br>
&gt; - fix that by accessing rsa-&gt;n (and e) directly, using RSA_get0_key=
 instead.<br>
&gt; -Author: Chirayu Desai &lt;<a href=3D"mailto:chirayudesai1@gmail.com" =
target=3D"_blank">chirayudesai1@gmail.com</a><br>
&gt; -Last-Update: 2016-11-10<br>
&gt; ----<br>
&gt; -This patch header follows DEP-3: <a href=3D"http://dep.debian.net/dep=
s/dep3/" rel=3D"noreferrer" target=3D"_blank">http://dep.debian.net/deps/de=
p3/</a><br>
&gt; ----<br>
&gt; - system/core/adb/adb_auth_host.c |=C2=A0 =C2=A0 5 +++--<br>
&gt; - 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; ---- a/adb/adb_auth_host.c<br>
&gt; -+++ b/adb/adb_auth_host.c<br>
&gt; -@@ -75,6 +75,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BIGNUM* rem =3D BN_new();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BIGNUM* n =3D BN_new();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BIGNUM* n0inv =3D BN_new();<br>
&gt; -+=C2=A0 =C2=A0 BIGNUM* e =3D BN_new();<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (RSA_size(rsa) !=3D RSANUMBYTES) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
&gt; -@@ -82,7 +83,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BN_set_bit(r32, 32);<br>
&gt; --=C2=A0 =C2=A0 BN_copy(n, rsa-&gt;n);<br>
&gt; -+=C2=A0 =C2=A0 RSA_get0_key(rsa, &amp;n, &amp;e, NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BN_set_bit(r, RSANUMWORDS * 32);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BN_mod_sqr(rr, r, n, ctx);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BN_div(NULL, rem, n, r32, ctx);<br>
&gt; -@@ -96,7 +97,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BN_div(n, rem, n, r32, ctx);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkey-&gt;n[i] =3D BN_get_word(rem);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 pkey-&gt;exponent =3D BN_get_word(rsa-&gt;e);<br>
&gt; -+=C2=A0 =C2=A0 pkey-&gt;exponent =3D BN_get_word(e);<br>
&gt; -<br>
&gt; - out:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BN_free(n0inv);<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/<a h=
ref=3D"http://ext4_utils.mk" rel=3D"noreferrer" target=3D"_blank">ext4_util=
s.mk</a> b/meta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"=
http://ext4_utils.mk" rel=3D"noreferrer" target=3D"_blank">ext4_utils.mk</a=
><br>
&gt; deleted file mode 100644<br>
&gt; index c18aa9c4d..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"=
http://ext4_utils.mk" rel=3D"noreferrer" target=3D"_blank">ext4_utils.mk</a=
><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,103 +0,0 @@<br>
&gt; -# Makefile for ext4_utils<br>
&gt; -<br>
&gt; -SRCDIR ?=3D $(S)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils<br>
&gt; -make_ext4fs_SRC_FILES +=3D make_ext4fs_main.c<br>
&gt; -make_ext4fs_SRC_FILES +=3D canned_fs_config.c<br>
&gt; -make_ext4fs_OBJS :=3D $(make_ext4fs_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -ext2simg_SRC_FILES +=3D ext2simg.c<br>
&gt; -ext2simg_OBJS :=3D $(ext2simg_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -ext4fixup_SRC_FILES +=3D ext4fixup_main.c<br>
&gt; -ext4fixup_OBJS :=3D $(ext4fixup_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -libext4_utils_SRC_FILES +=3D make_ext4fs.c<br>
&gt; -libext4_utils_SRC_FILES +=3D ext4fixup.c<br>
&gt; -libext4_utils_SRC_FILES +=3D ext4_utils.c<br>
&gt; -libext4_utils_SRC_FILES +=3D allocate.c<br>
&gt; -libext4_utils_SRC_FILES +=3D contents.c<br>
&gt; -libext4_utils_SRC_FILES +=3D extent.c<br>
&gt; -libext4_utils_SRC_FILES +=3D indirect.c<br>
&gt; -libext4_utils_SRC_FILES +=3D uuid.c<br>
&gt; -libext4_utils_SRC_FILES +=3D sha1.c<br>
&gt; -libext4_utils_SRC_FILES +=3D wipe.c<br>
&gt; -libext4_utils_SRC_FILES +=3D crc16.c<br>
&gt; -libext4_utils_SRC_FILES +=3D ext4_sb.c<br>
&gt; -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/libsparse<br>
&gt; -simg2img_SRC_FILES +=3D simg2img.c<br>
&gt; -simg2img_SRC_FILES +=3D sparse_crc32.c<br>
&gt; -simg2img_OBJS :=3D $(simg2img_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -img2simg_SRC_FILES +=3D img2simg.c<br>
&gt; -img2simg_OBJS :=3D $(img2simg_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -simg2simg_SRC_FILES +=3D simg2simg.c<br>
&gt; -simg2simg_SRC_FILES +=3D sparse_crc32.c<br>
&gt; -simg2simg_OBJS :=3D $(simg2simg_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -libsparse_SRC_FILES +=3D backed_block.c<br>
&gt; -libsparse_SRC_FILES +=3D output_file.c<br>
&gt; -libsparse_SRC_FILES +=3D sparse.c<br>
&gt; -libsparse_SRC_FILES +=3D sparse_crc32.c<br>
&gt; -libsparse_SRC_FILES +=3D sparse_err.c<br>
&gt; -libsparse_SRC_FILES +=3D sparse_read.c<br>
&gt; -libsparse_OBJS :=3D $(libsparse_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/external/libselinux/src<br>
&gt; -libselinux_SRC_FILES +=3D callbacks.c<br>
&gt; -libselinux_SRC_FILES +=3D check_context.c<br>
&gt; -libselinux_SRC_FILES +=3D freecon.c<br>
&gt; -libselinux_SRC_FILES +=3D init.c<br>
&gt; -libselinux_SRC_FILES +=3D label.c<br>
&gt; -libselinux_SRC_FILES +=3D label_file.c<br>
&gt; -libselinux_SRC_FILES +=3D label_android_property.c<br>
&gt; -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -CFLAGS +=3D -DANDROID<br>
&gt; -CFLAGS +=3D -DHOST<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/include<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include<br>
&gt; -CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch/$(androi=
d_arch)/AndroidConfig.h<br>
&gt; -<br>
&gt; -all: make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg<br>
&gt; -<br>
&gt; -make_ext4fs: libext4_utils.a libsparse.a libselinux.a $(make_ext4fs_O=
BJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(make_ext4fs_OBJS)=
 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libext4_utils.=
a libsparse.a libselinux.a -lz -lpcre<br>
&gt; -<br>
&gt; -ext2simg: libext4_utils.a libselinux.a libsparse.a $(ext2simg_OBJS)<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(ext2simg_OBJS) \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libext4_utils.=
a libselinux.a libsparse.a -lz -lpcre<br>
&gt; -<br>
&gt; -ext4fixup: libext4_utils.a libsparse.a $(ext4fixup_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(ext4fixup_OBJS) l=
ibext4_utils.a libsparse.a -lz<br>
&gt; -<br>
&gt; -simg2img: libsparse.a $(simg2img_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(simg2img_OBJS) li=
bsparse.a -lz<br>
&gt; -<br>
&gt; -img2simg: libsparse.a $(img2simg_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(img2simg_OBJS) li=
bsparse.a -lz<br>
&gt; -<br>
&gt; -simg2simg: libsparse.a $(simg2simg_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(simg2simg_OBJS) l=
ibsparse.a -lz<br>
&gt; -<br>
&gt; -libext4_utils.a: $(libext4_utils_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libext4_utils_OBJS)<br>
&gt; -<br>
&gt; -libsparse.a: $(libsparse_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libsparse_OBJS)<br>
&gt; -<br>
&gt; -libselinux.a: $(libselinux_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libselinux_OBJS)<br>
&gt; -<br>
&gt; -clean:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) $(make_ext4fs_OBJS) $(ext2simg_OBJS)=
 $(ext4fixup_OBJS) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(simg2img_OBJ=
S) $(img2simg_OBJS) $(simg2simg_OBJS) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(libext4_util=
s_OBJS) $(libsparse_OBJS) $(libselinux_OBJS) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make_ext4fs ex=
t2simg ext4fixup simg2img img2simg simg2simg *.a<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/extr=
as/0001-ext4_utils-remove-selinux-extensions.patch b/meta-oe/recipes-devtoo=
ls/android-tools/android-tools/extras/0001-ext4_utils-remove-selinux-extens=
ions.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 4a19a5d65..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0001=
-ext4_utils-remove-selinux-extensions.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,39 +0,0 @@<br>
&gt; -From 354604da9d152f1931e91991d3f34197fc8fc759 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Sergio Schvezov &lt;<a href=3D"mailto:sergio.schvezov@canonical=
.com" target=3D"_blank">sergio.schvezov@canonical.com</a>&gt;<br>
&gt; -Date: Tue, 2 Oct 2018 16:36:54 +0000<br>
&gt; -Subject: [PATCH] ext4_utils: remove selinux extensions<br>
&gt; -<br>
&gt; -* drop useless includes of Android SELINUX extensions<br>
&gt; -* avoids having to clone another module<br>
&gt; -* this should be sent upstream<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; ----<br>
&gt; - ext4_utils/make_ext4fs.c=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt; - ext4_utils/make_ext4fs_main.c | 1 -<br>
&gt; - 2 files changed, 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c<br>
&gt; -index 2f89ae8a0..732afbed7 100644<br>
&gt; ---- a/ext4_utils/make_ext4fs.c<br>
&gt; -+++ b/ext4_utils/make_ext4fs.c<br>
&gt; -@@ -62,7 +62,6 @@<br>
&gt; -<br>
&gt; - #include &lt;selinux/selinux.h&gt;<br>
&gt; - #include &lt;selinux/label.h&gt;<br>
&gt; --#include &lt;selinux/android.h&gt;<br>
&gt; -<br>
&gt; - #define O_BINARY 0<br>
&gt; -<br>
&gt; -diff --git a/ext4_utils/make_ext4fs_main.c b/ext4_utils/make_ext4fs_m=
ain.c<br>
&gt; -index a6c5f6160..f8e7b9da9 100644<br>
&gt; ---- a/ext4_utils/make_ext4fs_main.c<br>
&gt; -+++ b/ext4_utils/make_ext4fs_main.c<br>
&gt; -@@ -32,7 +32,6 @@<br>
&gt; - #ifndef USE_MINGW<br>
&gt; - #include &lt;selinux/selinux.h&gt;<br>
&gt; - #include &lt;selinux/label.h&gt;<br>
&gt; --#include &lt;selinux/android.h&gt;<br>
&gt; - #else<br>
&gt; - struct selabel_handle;<br>
&gt; - #endif<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/extr=
as/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch b/meta-oe/rec=
ipes-devtools/android-tools/android-tools/extras/0002-ext4_utils-add-o-argu=
ment-to-preserve-ownership.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 3b50ffbf3..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0002=
-ext4_utils-add-o-argument-to-preserve-ownership.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,78 +0,0 @@<br>
&gt; -From b9254539811ce912bfd16dd1d185eba7a10cceff Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Markus Mayer &lt;<a href=3D"mailto:mmayer@mmayer.net" target=3D=
"_blank">mmayer@mmayer.net</a>&gt;<br>
&gt; -Date: Wed, 7 Sep 2016 12:58:47 +0300<br>
&gt; -Subject: [PATCH] ext4_utils: add -o argument to preserve ownership<br=
>
&gt; -<br>
&gt; -See also <a href=3D"https://android-review.googlesource.com/#/c/10031=
2/" rel=3D"noreferrer" target=3D"_blank">https://android-review.googlesourc=
e.com/#/c/100312/</a><br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; ----<br>
&gt; - ext4_utils/make_ext4fs.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
&gt; - ext4_utils/make_ext4fs_main.c | 10 ++++++++--<br>
&gt; - 2 files changed, 14 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/ext4_utils/make_ext4fs.c b/ext4_utils/make_ext4fs.c<br>
&gt; -index 732afbed7..2cbf04399 100644<br>
&gt; ---- a/ext4_utils/make_ext4fs.c<br>
&gt; -+++ b/ext4_utils/make_ext4fs.c<br>
&gt; -@@ -67,6 +67,8 @@<br>
&gt; -<br>
&gt; - #endif<br>
&gt; -<br>
&gt; -+int preserve_owner =3D 0;<br>
&gt; -+<br>
&gt; - /* TODO: Not implemented:<br>
&gt; -=C2=A0 =C2=A0 Allocating blocks in the same block group as the file i=
node<br>
&gt; -=C2=A0 =C2=A0 Hash or binary tree directories<br>
&gt; -@@ -185,6 +187,10 @@ static u32 build_directory_structure(const char =
*full_path, const char *dir_path<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dentries[i].mtime =3D fixed_time;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (preserve_owner)=
 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dentries[i].uid =3D stat.st_uid;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dentries[i].gid =3D stat.st_gid;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t capab=
ilities;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fs_config_=
func !=3D NULL) {<br>
&gt; - #ifdef ANDROID<br>
&gt; -diff --git a/ext4_utils/make_ext4fs_main.c b/ext4_utils/make_ext4fs_m=
ain.c<br>
&gt; -index f8e7b9da9..e82d43277 100644<br>
&gt; ---- a/ext4_utils/make_ext4fs_main.c<br>
&gt; -+++ b/ext4_utils/make_ext4fs_main.c<br>
&gt; -@@ -47,13 +47,15 @@ struct selabel_handle;<br>
&gt; - extern struct fs_info info;<br>
&gt; -<br>
&gt; -<br>
&gt; -+extern int preserve_owner;<br>
&gt; -+<br>
&gt; - static void usage(char *path)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s [ -l &lt;len&gt; =
] [ -j &lt;journal size&gt; ] [ -b &lt;block_size&gt; ]\n&quot;, basename(p=
ath));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;=C2=A0 =C2=A0 [ -g &=
lt;blocks per group&gt; ] [ -i &lt;inodes&gt; ] [ -I &lt;inode size&gt; ]\n=
&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;=C2=A0 =C2=A0 [ -L &=
lt;label&gt; ] [ -f ] [ -a &lt;android mountpoint&gt; ]\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;=C2=A0 =C2=A0 [ -S f=
ile_contexts ] [ -C fs_config ] [ -T timestamp ]\n&quot;);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=C2=A0 =C2=A0 [ -z | -s ]=
 [ -w ] [ -c ] [ -J ] [ -v ] [ -B &lt;block_list_file&gt; ]\n&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=C2=A0 =C2=A0 [ -z | -s ]=
 [ -w ] [ -c ] [ -J ] [ -o ] [ -v ] [ -B &lt;block_list_file&gt; ]\n&quot;)=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;=C2=A0 =C2=A0 &lt;fi=
lename&gt; [&lt;directory&gt;]\n&quot;);<br>
&gt; - }<br>
&gt; -<br>
&gt; -@@ -79,7 +81,7 @@ int main(int argc, char **argv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct selinux_opt seopts[] =3D { { SELABE=
L_OPT_PATH, &quot;&quot; } };<br>
&gt; - #endif<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 while ((opt =3D getopt(argc, argv, &quot;l:j:b:=
g:i:I:L:a:S:T:C:B:fwzJsctv&quot;)) !=3D -1) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 while ((opt =3D getopt(argc, argv, &quot;l:j:b:=
g:i:I:L:a:S:T:C:B:fwzJsctov&quot;)) !=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (opt) {=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;l&#3=
9;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0info.len =3D parse_num(optarg);<br>
&gt; -@@ -142,6 +144,10 @@ int main(int argc, char **argv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}<br>
&gt; - #endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;o&#39;:<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 preserve_owner =3D 1;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 printf(&quot;Warning: Enabling &#39;preserve ownership&#39;, thi=
s is an unofficial feature!\n&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;v&#3=
9;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0verbose =3D 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/<a h=
ref=3D"http://fastboot.mk" rel=3D"noreferrer" target=3D"_blank">fastboot.mk=
</a> b/meta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"http=
://fastboot.mk" rel=3D"noreferrer" target=3D"_blank">fastboot.mk</a><br>
&gt; deleted file mode 100644<br>
&gt; index b9ba95f38..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"=
http://fastboot.mk" rel=3D"noreferrer" target=3D"_blank">fastboot.mk</a><br=
>
&gt; +++ /dev/null<br>
&gt; @@ -1,89 +0,0 @@<br>
&gt; -# Makefile for fastboot<br>
&gt; -<br>
&gt; -SRCDIR ?=3D $(S)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/fastboot<br>
&gt; -fastboot_SRC_FILES +=3D protocol.c<br>
&gt; -fastboot_SRC_FILES +=3D engine.c<br>
&gt; -fastboot_SRC_FILES +=3D bootimg.c<br>
&gt; -fastboot_SRC_FILES +=3D fastboot.c<br>
&gt; -fastboot_SRC_FILES +=3D util.c<br>
&gt; -fastboot_SRC_FILES +=3D fs.c<br>
&gt; -fastboot_SRC_FILES +=3D usb_linux.c<br>
&gt; -fastboot_SRC_FILES +=3D util_linux.c<br>
&gt; -fastboot_OBJS :=3D $(fastboot_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/libzipfile<br>
&gt; -libzipfile_SRC_FILES +=3D centraldir.c<br>
&gt; -libzipfile_SRC_FILES +=3D zipfile.c<br>
&gt; -libzipfile_OBJS :=3D $(libzipfile_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/extras/ext4_utils<br>
&gt; -libext4_utils_SRC_FILES +=3D make_ext4fs.c<br>
&gt; -libext4_utils_SRC_FILES +=3D ext4fixup.c<br>
&gt; -libext4_utils_SRC_FILES +=3D ext4_utils.c<br>
&gt; -libext4_utils_SRC_FILES +=3D allocate.c<br>
&gt; -libext4_utils_SRC_FILES +=3D contents.c<br>
&gt; -libext4_utils_SRC_FILES +=3D extent.c<br>
&gt; -libext4_utils_SRC_FILES +=3D indirect.c<br>
&gt; -libext4_utils_SRC_FILES +=3D uuid.c<br>
&gt; -libext4_utils_SRC_FILES +=3D sha1.c<br>
&gt; -libext4_utils_SRC_FILES +=3D wipe.c<br>
&gt; -libext4_utils_SRC_FILES +=3D crc16.c<br>
&gt; -libext4_utils_SRC_FILES +=3D ext4_sb.c<br>
&gt; -libext4_utils_OBJS :=3D $(libext4_utils_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/libsparse<br>
&gt; -libsparse_SRC_FILES +=3D backed_block.c<br>
&gt; -libsparse_SRC_FILES +=3D output_file.c<br>
&gt; -libsparse_SRC_FILES +=3D sparse.c<br>
&gt; -libsparse_SRC_FILES +=3D sparse_crc32.c<br>
&gt; -libsparse_SRC_FILES +=3D sparse_err.c<br>
&gt; -libsparse_SRC_FILES +=3D sparse_read.c<br>
&gt; -libsparse_OBJS :=3D $(libsparse_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/external/libselinux/src<br>
&gt; -libselinux_SRC_FILES +=3D callbacks.c<br>
&gt; -libselinux_SRC_FILES +=3D check_context.c<br>
&gt; -libselinux_SRC_FILES +=3D freecon.c<br>
&gt; -libselinux_SRC_FILES +=3D init.c<br>
&gt; -libselinux_SRC_FILES +=3D label.c<br>
&gt; -libselinux_SRC_FILES +=3D label_file.c<br>
&gt; -libselinux_SRC_FILES +=3D label_android_property.c<br>
&gt; -libselinux_OBJS :=3D $(libselinux_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -CFLAGS +=3D -std=3Dgnu11<br>
&gt; -CFLAGS +=3D -DANDROID<br>
&gt; -# CFLAGS +=3D -DUSE_F2FS<br>
&gt; -CFLAGS +=3D -DHOST<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/fastboot<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/include<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/mkbootimg<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/extras/ext4_utils<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/extras/f2fs_utils<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/libsparse/include<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/external/libselinux/include<br>
&gt; -CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch/$(androi=
d_arch)/AndroidConfig.h<br>
&gt; -<br>
&gt; -LIBS +=3D libzipfile.a libext4_utils.a libsparse.a libselinux.a -lz -=
lpcre<br>
&gt; -<br>
&gt; -all: fastboot<br>
&gt; -<br>
&gt; -fastboot: libzipfile.a libext4_utils.a libsparse.a libselinux.a $(fas=
tboot_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(fastboot_OBJS) $(=
LIBS)<br>
&gt; -<br>
&gt; -libzipfile.a: $(libzipfile_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libzipfile_OBJS)<br>
&gt; -<br>
&gt; -libext4_utils.a: $(libext4_utils_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libext4_utils_OBJS)<br>
&gt; -<br>
&gt; -libsparse.a: $(libsparse_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libsparse_OBJS)<br>
&gt; -<br>
&gt; -libselinux.a: $(libselinux_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libselinux_OBJS)<br>
&gt; -<br>
&gt; -clean:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) $(fastboot_OBJS) $(libzipfile_OBJS) =
$(libext4_utils_OBJS) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(libsparse_OB=
JS) $(libselinux_OBJS) fastboot *.a<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/fast=
boot_compile_remove_gtest.patch b/meta-oe/recipes-devtools/android-tools/an=
droid-tools/fastboot_compile_remove_gtest.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..a04f27f10<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_co=
mpile_remove_gtest.patch<br>
&gt; @@ -0,0 +1,51 @@<br>
&gt; +socket.h: removing dependency of gtest<br>
&gt; +<br>
&gt; +Removed the dependency of gtest on the build of fastboot binary.<br>
&gt; +Fixes below error<br>
&gt; +<br>
&gt; +In file included from fastboot/fastboot.cpp:70:<br>
&gt; +| In file included from fastboot/tcp.h:36:<br>
&gt; +| fastboot/socket.h:43:10: fatal error: &#39;gtest/gtest_prod.h&#39; =
file not found<br>
&gt; +| #include &lt;gtest/gtest_prod.h&gt;<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~<br>
&gt; +| 1 error generated.<br>
&gt; +| In file included from fastboot/socket.cpp:29:<br>
&gt; +| fastboot/socket.h:43:10: fatal error: &#39;gtest/gtest_prod.h&#39; =
file not found<br>
&gt; +| #include &lt;gtest/gtest_prod.h&gt;<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~<br>
&gt; +| 1 error generated.<br>
&gt; +| In file included from fastboot/tcp.cpp:29:<br>
&gt; +| In file included from fastboot/tcp.h:36:<br>
&gt; +| fastboot/socket.h:43:10: fatal error: &#39;gtest/gtest_prod.h&#39; =
file not found<br>
&gt; +| #include &lt;gtest/gtest_prod.h&gt;<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~<br>
&gt; +| 1 error generated.<br>
&gt; +| In file included from fastboot/udp.cpp:31:<br>
&gt; +| In file included from fastboot/udp.h:34:<br>
&gt; +| fastboot/socket.h:43:10: fatal error: &#39;gtest/gtest_prod.h&#39; =
file not found<br>
&gt; +| #include &lt;gtest/gtest_prod.h&gt;<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~<br>
&gt; +| 1 error generated.<br>
&gt; +<br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +--- a/system/core/fastboot/socket.h=C2=A0 =C2=A0 =C2=A0 =C2=A02021-04=
-14 21:14:00.355973915 +0000<br>
&gt; ++++ b/system/core/fastboot/socket.h=C2=A0 =C2=A02021-04-14 21:14:21.8=
79680699 +0000<br>
&gt; +@@ -40,7 +40,6 @@<br>
&gt; +<br>
&gt; + #include &lt;android-base/macros.h&gt;<br>
&gt; + #include &lt;cutils/sockets.h&gt;<br>
&gt; +-#include &lt;gtest/gtest_prod.h&gt;<br>
&gt; +<br>
&gt; + // Socket interface to be implemented for each platform.<br>
&gt; + class Socket {<br>
&gt; +@@ -119,8 +118,6 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0socket_send_buffers_f=
unction_ =3D &amp;socket_send_buffers;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0private:<br>
&gt; +-=C2=A0 =C2=A0 FRIEND_TEST(SocketTest, TestTcpSendBuffers);<br>
&gt; +-=C2=A0 =C2=A0 FRIEND_TEST(SocketTest, TestUdpSendBuffers);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DISALLOW_COPY_AND_ASSIGN(Socket);<br>
&gt; + };<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/fast=
boot_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/andro=
id-tools/fastboot_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..c8904f045<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot_mk=
_change_out_dir.patch<br>
&gt; @@ -0,0 +1,52 @@<br>
&gt; +patching <a href=3D"http://fastboot.mk" rel=3D"noreferrer" target=3D"=
_blank">fastboot.mk</a> to build in yocto environment.<br>
&gt; +<br>
&gt; +Changes include:<br>
&gt; +Introduced an output folder which will keep all the outputs from the<=
br>
&gt; +android-tools.<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary to the OUT_DIR<=
br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +--- git/system/core/debian/<a href=3D"http://fastboot.mk" rel=3D"nore=
ferrer" target=3D"_blank">fastboot.mk</a> 2021-05-17 07:47:56.800224043 +00=
00<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://fastboot.mk" rel=3D"nore=
ferrer" target=3D"_blank">fastboot.mk</a> 2021-05-17 07:49:40.130383096 +00=
00<br>
&gt; +@@ -1,3 +1,4 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME =3D fastboot<br>
&gt; + fastboot_SOURCES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootimg_utils.cpp \<br>
&gt; +@@ -38,11 +39,11 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ifs_mgr/liblp/includ=
e \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I/usr/include/androi=
d/openssl \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ilibsparse/include \=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ilibziparchive/include<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ilibziparchive/include -I=
$(OUT_DIR)/usr/include/<br>
&gt; + LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fuse-ld=3Dgold \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D. \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L. -lziparchive -lsparse -=
lbase -lcutils -ladb -lcrypto -lext4_utils \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D$(OUT_DIR=
)/usr/lib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android -lziparchive -lsparse -lbase -lcutils -ladb -lcrypt=
o -lext4_utils \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -L/usr/lib/$(DEB_HOST_MULTI=
ARCH)/android \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -l7z \<br>
&gt; +<br>
&gt; +@@ -53,7 +54,8 @@<br>
&gt; + endif<br>
&gt; +<br>
&gt; + build: $(SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o fastboot/$(NAME) $(CXXFLAGS) $(CPP=
FLAGS) $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/bin/fastboot<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/bin/fastboot/$(NAME=
) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) fastboot/$(NAME)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/bin/fastboot/$(NAME)<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/giti=
gnore b/meta-oe/recipes-devtools/android-tools/android-tools/gitignore<br>
&gt; deleted file mode 100644<br>
&gt; index b034c10a1..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/gitignore<b=
r>
&gt; +++ /dev/null<br>
&gt; @@ -1,59 +0,0 @@<br>
&gt; -*<br>
&gt; -!.gitignore<br>
&gt; -!*.indirectionsymlink<br>
&gt; -!*.[ch]<br>
&gt; -!*.mk<br>
&gt; -!*.patch<br>
&gt; -!*.service<br>
&gt; -!NOTICE<br>
&gt; -!MODULE_LICENSE_*<br>
&gt; -!/system/<br>
&gt; -!/system/core/<br>
&gt; -!/system/core/adb/<br>
&gt; -!/system/core/fastboot/<br>
&gt; -!/system/core/fs_mgr/<br>
&gt; -!/system/core/fs_mgr/include/<br>
&gt; -!/system/core/include/<br>
&gt; -!/system/core/include/android/<br>
&gt; -!/system/core/include/cutils/<br>
&gt; -!/system/core/include/log/<br>
&gt; -!/system/core/include/mincrypt/<br>
&gt; -!/system/core/include/private/<br>
&gt; -!/system/core/include/utils/<br>
&gt; -!/system/core/include/zipfile/<br>
&gt; -!/system/core/liblog/<br>
&gt; -!/system/core/liblog/tests/<br>
&gt; -!/system/core/libcutils/<br>
&gt; -!/system/core/libmincrypt/<br>
&gt; -!/system/core/libzipfile/<br>
&gt; -!/system/core/libsparse/<br>
&gt; -!/system/core/libsparse/include/<br>
&gt; -!/system/core/libsparse/include/sparse/<br>
&gt; -!/system/core/libsparse/simg_dump.py<br>
&gt; -!/system/core/mkbootimg/<br>
&gt; -!/system/extras/<br>
&gt; -!/system/extras/ext4_utils/<br>
&gt; -!/system/extras/ext4_utils/mkuserimg.sh<br>
&gt; -!/system/extras/ext4_utils/test_ext4fixup<br>
&gt; -!/system/extras/f2fs_utils/<br>
&gt; -!/hardware/<br>
&gt; -!/hardware/libhardware/<br>
&gt; -!/hardware/libhardware/include/<br>
&gt; -!/hardware/libhardware/include/hardware/<br>
&gt; -!/external/<br>
&gt; -!/external/libselinux/<br>
&gt; -!/external/libselinux/include/<br>
&gt; -!/external/libselinux/include/selinux/<br>
&gt; -!/external/libselinux/src/<br>
&gt; -!/external/f2fs-tools/<br>
&gt; -!/external/f2fs-tools/include/<br>
&gt; -!/external/f2fs-tools/lib/<br>
&gt; -!/external/f2fs-tools/mkfs/<br>
&gt; -!/build/<br>
&gt; -!/build/core/<br>
&gt; -!/build/core/<a href=3D"http://version_defaults.mk" rel=3D"noreferrer=
" target=3D"_blank">version_defaults.mk</a><br>
&gt; -!/build/core/combo/<br>
&gt; -!/build/core/combo/include/<br>
&gt; -!/build/core/combo/include/arch/<br>
&gt; -!/build/core/combo/include/arch/linux-*/<br>
&gt; -!/build/core/combo/include/arch/linux-*/AndroidConfig.h<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/img2=
simg_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-=
tools/img2simg_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..6913c4b98<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/img2simg_ch=
ange_out_dir.patch<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +patching <a href=3D"http://img2simg.mk" rel=3D"noreferrer" target=3D"=
_blank">img2simg.mk</a> to build in yocto environment.<br>
&gt; +<br>
&gt; +Changes include:<br>
&gt; +Introduced an output folder which will keep all the outputs from the<=
br>
&gt; +android-tools.<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary to the OUT_DIR<=
br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +--- git/system/core/debian/<a href=3D"http://img2simg.mk" rel=3D"nore=
ferrer" target=3D"_blank">img2simg.mk</a> 2021-05-12 09:05:38.580607289 +00=
00<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://img2simg.mk" rel=3D"nore=
ferrer" target=3D"_blank">img2simg.mk</a> 2021-05-12 09:09:04.331908253 +00=
00<br>
&gt; +@@ -1,13 +1,14 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME =3D img2simg<br>
&gt; + SOURCES =3D img2simg.cpp<br>
&gt; + SOURCES :=3D $(foreach source, $(SOURCES), libsparse/$(source))<br>
&gt; + CPPFLAGS +=3D -Ilibsparse/include -Iinclude -std=3Dgnu++17<br>
&gt; +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D. \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L. -lsparse<br>
&gt; ++LDFLAGS +=3D -Wl,-rpath=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/a=
ndroid \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D$(OUT_DIR=
)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android/ -lsparse<br>
&gt; +<br>
&gt; + build: $(SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o libsparse/$(NAME) $(CPPFLAGS) $(LD=
FLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/bin/$(NAME) $(CPPFL=
AGS) $(LDFLAGS)<br>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) libsparse/$(NAME)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/bin/$(NAME)<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/liba=
db_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android=
-tools/libadb_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..7094ccaa9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/libadb_mk_c=
hange_out_dir.patch<br>
&gt; @@ -0,0 +1,44 @@<br>
&gt; +<a href=3D"http://libadb.mk" rel=3D"noreferrer" target=3D"_blank">lib=
adb.mk</a>: modifications to make it build in yocto environment<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary to the OUT_DIR<=
br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +--- git/system/core/debian/<a href=3D"http://libadb.mk" rel=3D"norefe=
rrer" target=3D"_blank">libadb.mk</a>=C2=A0 =C2=A02021-04-30 16:29:34.59661=
8862 +0200<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://libadb.mk" rel=3D"norefe=
rrer" target=3D"_blank">libadb.mk</a>=C2=A0 =C2=A02021-04-30 16:36:53.93283=
7490 +0200<br>
&gt; +@@ -1,3 +1,4 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME :=3D libadb<br>
&gt; +<br>
&gt; + LIBADB_SRC_FILES :=3D \<br>
&gt; +@@ -43,18 +44,18 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ibase/include \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Idiagnose_usb/includ=
e \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ilibcrypto_utils/inc=
lude \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Iinclude \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Iinclude -I$(OUT_DIR)/usr=
/include \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DPLATFORM_TOOLS_VERS=
ION=3D&#39;&quot;$(PLATFORM_TOOLS_VERSION)&quot;&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DADB_HOST=3D1 -DADB_=
VERSION=3D&#39;&quot;$(DEB_VERSION)&quot;&#39;<br>
&gt; +<br>
&gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/lib/$(DEB=
_HOST_MULTIARCH)/android \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L/usr/lib/$(DEB_HOST_MULTI=
ARCH)/android -lcrypto \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -L. -lbase -lcuti=
ls -lcrypto_utils -lusb-1.0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android -lcrypto \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -lbase -lcutils -=
lcrypto_utils -lusb-1.0<br>
&gt; +<br>
&gt; + $(NAME).so: $(SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAG=
S) $(LDFLAGS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULT=
IARCH)/android/$(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOS=
T_MULTIARCH)/android/$(NAME).so<br>
&gt; +<br>
&gt; + transport_mdns_unsupported.cpp:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;void init_mdns_transport_discove=
ry(void) {}&#39; &gt; transport_mdns_unsupported.cpp<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libb=
acktrace_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/a=
ndroid-tools/libbacktrace_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..464b63de2<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/libbacktrac=
e_mk_change_out_dir.patch<br>
&gt; @@ -0,0 +1,60 @@<br>
&gt; +patching <a href=3D"http://libbacktrace.mk" rel=3D"noreferrer" target=
=3D"_blank">libbacktrace.mk</a> to build in yocto environment.<br>
&gt; +<br>
&gt; +Changes include:<br>
&gt; +Introduced an output folder which will keep all the outputs from the<=
br>
&gt; +android-tools.<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary to the OUT_DIR<=
br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +--- git/system/core/debian/<a href=3D"http://libbacktrace.mk" rel=3D"=
noreferrer" target=3D"_blank">libbacktrace.mk</a>=C2=A0 =C2=A0 =C2=A02021-0=
5-21 23:51:55.022408433 +0000<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://libbacktrace.mk" rel=3D"=
noreferrer" target=3D"_blank">libbacktrace.mk</a>=C2=A0 =C2=A0 =C2=A02021-0=
5-21 23:53:07.487543521 +0000<br>
&gt; +@@ -1,5 +1,6 @@<br>
&gt; +-<br>
&gt; +-include /usr/share/dpkg/<a href=3D"http://architecture.mk" rel=3D"no=
referrer" target=3D"_blank">architecture.mk</a><br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; ++#pass architecture specific info to makefile<br>
&gt; ++DEB_HOST_ARCH=3D${deb_host_arch}<br>
&gt; +<br>
&gt; + NAME =3D libbacktrace<br>
&gt; +<br>
&gt; +@@ -88,11 +89,11 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ilibprocinfo/include=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ilibunwindstack/incl=
ude \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I/usr/include/androi=
d/lzma \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I/usr/include/android/unw=
ind<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(OUT_DIR)/usr/include/a=
ndroid/libunwind<br>
&gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/lib/$(DEB=
_HOST_MULTIARCH)/android \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L/usr/lib/$(DEB_HOST_MULTI=
ARCH)/android -lunwind \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L. -lbase -llog -lpthread =
-l7z<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android -lunwind \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lbase -llog -lpthread -l7z=
<br>
&gt; +<br>
&gt; + # -latomic should be the last library specified<br>
&gt; + # <a href=3D"https://github.com/android/ndk/issues/589" rel=3D"noref=
errer" target=3D"_blank">https://github.com/android/ndk/issues/589</a><br>
&gt; +@@ -104,11 +105,11 @@<br>
&gt; + endif<br>
&gt; +<br>
&gt; + build: $(COBJECTS) $(CXXOBJECTS) $(OBJECTS_ASSEMBLY)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULT=
IARCH)/android/$(NAME).so.0 $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/=
android/$(NAME).so.0 $(NAME).so<br>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(COBJECTS) $(CXXOBJECTS) $(NAME).so*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(COBJECTS) $(CXXOBJECTS) $(OUT_DIR)/usr/=
lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*<br>
&gt; +<br>
&gt; + $(CXXOBJECTS): %.o: %.cpp<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CXX) $&lt; -o $@ $(CXXFLAGS) $(CPPFLAGS)=
<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libb=
ase_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/androi=
d-tools/libbase_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..37c93d6d0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/libbase_mk_=
change_out_dir.patch<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +<a href=3D"http://libbase.mk" rel=3D"noreferrer" target=3D"_blank">li=
bbase.mk</a>: modifications to make it build in yocto environment<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary to the OUT_DIR<=
br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +--- git/system/core/debian/<a href=3D"http://libbase.mk" rel=3D"noref=
errer" target=3D"_blank">libbase.mk</a>=C2=A0 2021-04-29 22:01:13.664181133=
 +0200<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://libbase.mk" rel=3D"noref=
errer" target=3D"_blank">libbase.mk</a>=C2=A0 2021-04-29 22:04:52.328123833=
 +0200<br>
&gt; +@@ -1,3 +1,4 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME =3D libbase<br>
&gt; + SOURCES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chrono_utils.cpp \<br>
&gt; +@@ -20,8 +21,9 @@<br>
&gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0<br>
&gt; +<br>
&gt; + build: $(SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAG=
S) $(LDFLAGS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULT=
IARCH)/android/$(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOS=
T_MULTIARCH)/android/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r base/include/* $(OUT_DIR)/usr/include/<br=
>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(NAME).so*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/=
android/$(NAME).so*<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libc=
rypto_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/andr=
oid-tools/libcrypto_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..f70590977<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_m=
k_change_out_dir.patch<br>
&gt; @@ -0,0 +1,30 @@<br>
&gt; +<a href=3D"http://libcrypto.mk" rel=3D"noreferrer" target=3D"_blank">=
libcrypto.mk</a>: modifications to make it build in yocto environment<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary and include<br>
&gt; +to the OUT_DIR<br>
&gt; +<br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +--- git/external/boringssl/debian/<a href=3D"http://libcrypto.mk" rel=
=3D"noreferrer" target=3D"_blank">libcrypto.mk</a> 2021-04-30 11:32:40.6103=
12307 +0000<br>
&gt; ++++ git/external/boringssl/debian/<a href=3D"http://libcrypto.mk" rel=
=3D"noreferrer" target=3D"_blank">libcrypto.mk</a> 2021-04-30 11:36:47.7383=
18880 +0000<br>
&gt; +@@ -1,3 +1,4 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + include <a href=3D"http://sources.mk" rel=3D"noreferrer" target=3D"_=
blank">sources.mk</a><br>
&gt; +<br>
&gt; + NAME =3D libcrypto<br>
&gt; +@@ -26,6 +27,8 @@<br>
&gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 -lpthread<br>
&gt; +<br>
&gt; + build: $(SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 mkdir --parents debian/out<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o debian/out/$(NAME).so.0 $(CFLAGS) $=
(CPPFLAGS) $(LDFLAGS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 debian/out/$(NAME).so<br>
&gt; +\ No newline at end of file<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/lib/$(DEB_HOST_M=
ULTIARCH)/android/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/include<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTI=
ARCH)/android/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -DOPENSSL_NO_AS=
M<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOS=
T_MULTIARCH)/android/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r include/openssl $(OUT_DIR)/usr/include<br=
>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libc=
rypto_utils_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tool=
s/android-tools/libcrypto_utils_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..a0dd34876<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/libcrypto_u=
tils_mk_change_out_dir.patch<br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +<a href=3D"http://libcrypto_utils.mk" rel=3D"noreferrer" target=3D"_b=
lank">libcrypto_utils.mk</a>: modifications to make it build in yocto envir=
onment<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary and header to t=
he OUT_DIR<br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +--- git/system/core/debian/<a href=3D"http://libcrypto_utils.mk" rel=
=3D"noreferrer" target=3D"_blank">libcrypto_utils.mk</a>=C2=A0 2021-04-30 1=
4:18:54.071379767 +0200<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://libcrypto_utils.mk" rel=
=3D"noreferrer" target=3D"_blank">libcrypto_utils.mk</a>=C2=A0 2021-04-30 1=
4:22:46.179047308 +0200<br>
&gt; +@@ -1,15 +1,17 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME:=3D libcrypto_utils<br>
&gt; + SOURCES :=3D android_pubkey.c<br>
&gt; + SOURCES :=3D $(foreach source, $(SOURCES), libcrypto_utils/$(source)=
)<br>
&gt; +-CPPFLAGS +=3D -Ilibcrypto_utils/include -Iinclude<br>
&gt; ++CPPFLAGS +=3D -Ilibcrypto_utils/include -Iinclude -I$(OUT_DIR)/usr/i=
nclude<br>
&gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH=
)/android \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 -L/usr/lib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/andr=
oid \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-lcrypto -Wl,-z,defs<br>
&gt; +<br>
&gt; + build: $(SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(NAME).so.0=C2=A0 $(CPPFLAGS) $(LD=
FLAGS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTI=
ARCH)/android/$(NAME).so.0=C2=A0 $(CPPFLAGS) $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOS=
T_MULTIARCH)/android/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r libcrypto_utils/include/* $(OUT_DIR)/usr/=
include/<br>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(NAME).so*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/=
android/$(NAME).so*<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libc=
utils_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/andr=
oid-tools/libcutils_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..5539eb91d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/libcutils_m=
k_change_out_dir.patch<br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +--- git/system/core/debian/<a href=3D"http://libcutils.mk" rel=3D"nor=
eferrer" target=3D"_blank">libcutils.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 2021=
-05-17 06:38:40.105161629 +0000<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://libcutils.mk" rel=3D"nor=
eferrer" target=3D"_blank">libcutils.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 2021=
-05-17 06:42:37.141912366 +0000<br>
&gt; +@@ -1,3 +1,4 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME =3D libcutils<br>
&gt; +<br>
&gt; + # copied from libcutils/Android.bp<br>
&gt; +@@ -50,14 +51,15 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Iinclude \<br>
&gt; +<br>
&gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath=3D/usr/lib/$(DEB=
_HOST_MULTIARCH)/android -lpthread -L. -llog -lbase<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath=3D/usr/lib/$(DEB=
_HOST_MULTIARCH)/android -lpthread -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARC=
H)/android/ -llog -lbase<br>
&gt; +<br>
&gt; + build: $(COBJECTS) $(CXXOBJECTS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULT=
IARCH)/android/$(NAME).so.0 $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOS=
T_MULTIARCH)/android/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r libcutils/include/cutils $(OUT_DIR)/usr/i=
nclude/<br>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(OUT_DIR)/usr/=
lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*<br>
&gt; +<br>
&gt; + $(COBJECTS): %.o: %.c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $&lt; -o $@ $(CFLAGS) $(CPPFLAGS)<br=
>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libe=
xt4_utils_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/=
android-tools/libext4_utils_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..efccfab9c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/libext4_uti=
ls_mk_change_out_dir.patch<br>
&gt; @@ -0,0 +1,42 @@<br>
&gt; +<a href=3D"http://libext4_utils.mk" rel=3D"noreferrer" target=3D"_bla=
nk">libext4_utils.mk</a>: modifications to make it build in yocto environme=
nt<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary and header to t=
he OUT_DIR<br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +--- git/system/extras/debian/<a href=3D"http://libext4_utils.mk" rel=
=3D"noreferrer" target=3D"_blank">libext4_utils.mk</a>=C2=A0 2021-04-29 21:=
46:39.384394114 +0000<br>
&gt; ++++ git/system/extras/debian/<a href=3D"http://libext4_utils.mk" rel=
=3D"noreferrer" target=3D"_blank">libext4_utils.mk</a>=C2=A0 2021-04-29 21:=
49:53.808605543 +0000<br>
&gt; +@@ -1,3 +1,4 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME =3D libext4_utils<br>
&gt; +<br>
&gt; + ext4_utils_SOURCES :=3D \<br>
&gt; +@@ -17,14 +18,16 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Iext4_utils/include =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ilibfec/include \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Isquashfs_utils \<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I/usr/include/android \<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I/usr/include/android -I$=
(OUT_DIR)/usr/include \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-D_GNU_SOURCE -DFEC_N=
O_KLOG -DSQUASHFS_NO_KLOG -D_LARGEFILE64_SOURCE<br>
&gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/lib/$(DEB=
_HOST_MULTIARCH)/android \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L/usr/lib/$(DEB_HOST_MULTI=
ARCH)/android \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android/ \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -lbase -lsparse -lselinux<b=
r>
&gt; +<br>
&gt; + build: $(SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(OUT_DIR)/$(NAME).so.0 $(CFLAGS) $=
(CPPFLAGS) $(LDFLAGS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/lib/$(DEB_HOST_M=
ULTIARCH)/android/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTI=
ARCH)/android/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOS=
T_MULTIARCH)/android/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r ext4_utils/include/* $(OUT_DIR)/usr/inclu=
de/<br>
&gt; ++<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libf=
ec_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android=
-tools/libfec_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..0f8184d41<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/libfec_mk_c=
hange_out_dir.patch<br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +--- git/system/extras/debian/<a href=3D"http://libfec.mk" rel=3D"nore=
ferrer" target=3D"_blank">libfec.mk</a> 2021-05-17 06:55:51.973044031 +0000=
<br>
&gt; ++++ git/system/extras/debian/<a href=3D"http://libfec.mk" rel=3D"nore=
ferrer" target=3D"_blank">libfec.mk</a> 2021-05-17 06:56:41.940185413 +0000=
<br>
&gt; +@@ -1,3 +1,4 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME =3D libfec<br>
&gt; +<br>
&gt; + # copied from libfec/Android.bp<br>
&gt; +@@ -12,20 +13,21 @@<br>
&gt; + CXXFLAGS +=3D -fno-strict-aliasing -std=3Dg++17<br>
&gt; + CPPFLAGS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Iext4_utils/include =
\<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ilibfec/include \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ilibfec/include -I $(OUT_=
DIR)/usr/include \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-D_GNU_SOURCE -DFEC_N=
O_KLOG -D_LARGEFILE64_SOURCE<br>
&gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/lib/$(DEB=
_HOST_MULTIARCH)/android \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L/usr/lib/$(DEB_HOST_MULTI=
ARCH)/android \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -lbase -lsparse -lselinux<b=
r>
&gt; +<br>
&gt; + build: $(COBJECTS) $(CXXOBJECTS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 mkdir -p $(OUT_DIR)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/$(NAME).so.0 $(LDFLAGS)=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir -p $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARC=
H)/android<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULT=
IARCH)/android/$(NAME).so.0 $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOS=
T_MULTIARCH)/android/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r libfec/include/* $(OUT_DIR)/usr/include/<=
br>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(OUT_DIR)/usr/=
lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*<br>
&gt; +<br>
&gt; + $(COBJECTS): %.o: %.c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $&lt; -o $@ $(CFLAGS) $(CPPFLAGS)<br=
>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libl=
og_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android=
-tools/liblog_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..09ef1871b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/liblog_mk_c=
hange_out_dir.patch<br>
&gt; @@ -0,0 +1,42 @@<br>
&gt; +patching <a href=3D"http://liblog.mk" rel=3D"noreferrer" target=3D"_b=
lank">liblog.mk</a> to build in yocto environment.<br>
&gt; +<br>
&gt; +Changes include:<br>
&gt; +Introduced an output folder which will keep all the outputs from the<=
br>
&gt; +android-tools.<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary to the OUT_DIR<=
br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +--- git/system/core/debian/<a href=3D"http://liblog.mk" rel=3D"norefe=
rrer" target=3D"_blank">liblog.mk</a>=C2=A0 =C2=A02021-05-17 08:13:28.30470=
0936 +0000<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://liblog.mk" rel=3D"norefe=
rrer" target=3D"_blank">liblog.mk</a>=C2=A0 =C2=A02021-05-17 08:15:59.59006=
4282 +0000<br>
&gt; +@@ -1,3 +1,4 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME =3D liblog<br>
&gt; +<br>
&gt; + # copied from liblog/Android.bp<br>
&gt; +@@ -39,11 +40,12 @@<br>
&gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 -lpthread<br>
&gt; +<br>
&gt; + build: $(COBJECTS) $(CXXOBJECTS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULT=
IARCH)/android/$(NAME).so.0 $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOS=
T_MULTIARCH)/android/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r liblog/include/* $(OUT_DIR)/usr/include/<=
br>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(COBJECTS) $(CXXOBJECTS) $(NAME).so*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(COBJECTS) $(CXXOBJECTS) $(OUT_DIR)/usr/=
lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*<br>
&gt; +<br>
&gt; + $(COBJECTS): %.o: %.c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $&lt; -o $@ $(CFLAGS) $(CPPFLAGS)<br=
>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libs=
elinux/0001-Remove-bionic-specific-calls.patch b/meta-oe/recipes-devtools/a=
ndroid-tools/android-tools/libselinux/0001-Remove-bionic-specific-calls.pat=
ch<br>
&gt; deleted file mode 100644<br>
&gt; index 9de2593df..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/=
0001-Remove-bionic-specific-calls.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,25 +0,0 @@<br>
&gt; -From 36654a4484117e5f4d63a810c0d94bc9c7ee3a83 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Fathi Boudra &lt;<a href=3D"mailto:fabo@debian.org" target=3D"_=
blank">fabo@debian.org</a>&gt;<br>
&gt; -Date: Tue, 2 Oct 2018 16:36:54 +0000<br>
&gt; -Subject: [PATCH] Remove bionic specific calls<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; -<br>
&gt; -Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/procattr.c | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/src/procattr.c b/src/procattr.c<br>
&gt; -index f350808..761cf8e 100644<br>
&gt; ---- a/src/procattr.c<br>
&gt; -+++ b/src/procattr.c<br>
&gt; -@@ -8,7 +8,7 @@<br>
&gt; - #include &quot;selinux_internal.h&quot;<br>
&gt; - #include &quot;policy.h&quot;<br>
&gt; -<br>
&gt; --#ifdef HOST<br>
&gt; -+#ifndef __BIONIC__<br>
&gt; - static pid_t gettid(void)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return syscall(__NR_gettid);<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libs=
elinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch b/me=
ta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselin=
ux-Do-not-define-gettid-if-glibc-2.30-is-use.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 87771cba8..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/=
0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,49 +0,0 @@<br>
&gt; -From f4f9d24860e1b5cd4f6a014f3fda7cd33ebe5be7 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Petr Lautrbach &lt;<a href=3D"mailto:plautrba@redhat.com" targe=
t=3D"_blank">plautrba@redhat.com</a>&gt;<br>
&gt; -Date: Sat, 27 Jul 2019 08:20:20 -0700<br>
&gt; -Subject: [PATCH] libselinux: Do not define gettid() if glibc &gt;=3D =
2.30 is used<br>
&gt; -MIME-Version: 1.0<br>
&gt; -Content-Type: text/plain; charset=3DUTF-8<br>
&gt; -Content-Transfer-Encoding: 8bit<br>
&gt; -<br>
&gt; -Since version 2.30 glibc implements gettid() system call wrapper, see=
<br>
&gt; -<a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D6399" re=
l=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_bug=
.cgi?id=3D6399</a><br>
&gt; -<br>
&gt; -Fixes:<br>
&gt; -cc -O2 -g -pipe -Wall -Werror=3Dformat-security -Wp,-D_FORTIFY_SOURCE=
=3D2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -greco=
rd-gcc-switches -specs=3D/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=3D/=
usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=3Dgeneric -fasynchronous-=
unwind-tables -fstack-clash-protection -fcf-protection -I../include -D_GNU_=
SOURCE=C2=A0 -DNO_ANDROID_BACKEND=C2=A0 =C2=A0-c -o procattr.o procattr.c<b=
r>
&gt; -procattr.c:28:14: error: static declaration of =E2=80=98gettid=E2=80=
=99 follows non-static declaration<br>
&gt; -=C2=A0 =C2=A028 | static pid_t gettid(void)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~<br>
&gt; -In file included from /usr/include/unistd.h:1170,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from pr=
ocattr.c:2:<br>
&gt; -/usr/include/bits/unistd_ext.h:34:16: note: previous declaration of =
=E2=80=98gettid=E2=80=99 was here<br>
&gt; -=C2=A0 =C2=A034 | extern __pid_t gettid (void) __THROW;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~<br>
&gt; -<br>
&gt; -Signed-off-by: Petr Lautrbach &lt;<a href=3D"mailto:plautrba@redhat.c=
om" target=3D"_blank">plautrba@redhat.com</a>&gt;<br>
&gt; -Acked-by: Stephen Smalley &lt;<a href=3D"mailto:sds@tycho.nsa.gov" ta=
rget=3D"_blank">sds@tycho.nsa.gov</a>&gt;<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/procattr.c | 14 +++++++++++++-<br>
&gt; - 1 file changed, 13 insertions(+), 1 deletion(-)<br>
&gt; -<br>
&gt; ---- a/src/procattr.c<br>
&gt; -+++ b/src/procattr.c<br>
&gt; -@@ -8,12 +8,16 @@<br>
&gt; - #include &quot;selinux_internal.h&quot;<br>
&gt; - #include &quot;policy.h&quot;<br>
&gt; -<br>
&gt; --#ifndef __BIONIC__<br>
&gt; -+/* Bionic and glibc &gt;=3D 2.30 declare gettid() system call wrappe=
r in unistd.h and<br>
&gt; -+ * has a definition for it */<br>
&gt; -+#if defined(__GLIBC_)<br>
&gt; -+#if !__GLIBC_PREREQ(2,30)<br>
&gt; - static pid_t gettid(void)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return syscall(__NR_gettid);<br>
&gt; - }<br>
&gt; - #endif<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; - static int getprocattrcon(char ** context,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0pid_t pid, const char *attr)<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libs=
parse_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/andr=
oid-tools/libsparse_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..4f8bb44a4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/libsparse_m=
k_change_out_dir.patch<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +patching <a href=3D"http://libsparse.mk" rel=3D"noreferrer" target=3D=
"_blank">libsparse.mk</a> to build in yocto environment.<br>
&gt; +<br>
&gt; +Changes include:<br>
&gt; +Introduced an output folder which will keep all the outputs from the<=
br>
&gt; +android-tools.<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary to the OUT_DIR<=
br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +--- git/system/core/debian/<a href=3D"http://libsparse.mk" rel=3D"nor=
eferrer" target=3D"_blank">libsparse.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 2021=
-05-17 08:13:34.764584388 +0000<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://libsparse.mk" rel=3D"nor=
eferrer" target=3D"_blank">libsparse.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 2021=
-05-17 08:15:34.850492654 +0000<br>
&gt; +@@ -1,3 +1,4 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME =3D libsparse<br>
&gt; + SOURCES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backed_block.cpp \<br>
&gt; +@@ -18,16 +19,16 @@<br>
&gt; +=C2=A0 =C2=A0-shared -Wl,-soname,$(NAME).so.0 \<br>
&gt; +=C2=A0 =C2=A0-lz \<br>
&gt; +=C2=A0 =C2=A0-Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \<br=
>
&gt; +-=C2=A0 -L. \<br>
&gt; ++=C2=A0 -L$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/android/ \<br>
&gt; +=C2=A0 =C2=A0-lbase<br>
&gt; +<br>
&gt; +<br>
&gt; + build: $(COBJECTS) $(CXXOBJECTS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(LDFLAGS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULT=
IARCH)/android/$(NAME).so.0 $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOS=
T_MULTIARCH)/android/$(NAME).so<br>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(NAME).so*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(CXXOBJECTS) $(COBJECTS) $(OUT_DIR)/usr/=
lib/$(DEB_HOST_MULTIARCH)/android/$(NAME).so*<br>
&gt; +<br>
&gt; + $(COBJECTS): %.o: %.c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $&lt; -o $@ $(CFLAGS) $(CPPFLAGS)<br=
>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libu=
nwind_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/andr=
oid-tools/libunwind_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..237d45c3c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/libunwind_m=
k_change_out_dir.patch<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +patching libundwind to build in yocto environment.<br>
&gt; +<br>
&gt; +Changes include:<br>
&gt; +Introduced an output folder which will keep all the outputs from the<=
br>
&gt; +android-tools.<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary to the OUT_DIR<=
br>
&gt; +<br>
&gt; +Passing the architecture details($CPU)from the recipe.<br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +--- git/external/libunwind/debian/<a href=3D"http://libunwind.mk" rel=
=3D"noreferrer" target=3D"_blank">libunwind.mk</a> 2021-05-22 02:29:52.9503=
24653 +0000<br>
&gt; ++++ git/external/libunwind/debian/<a href=3D"http://libunwind.mk" rel=
=3D"noreferrer" target=3D"_blank">libunwind.mk</a> 2021-05-22 02:30:48.5353=
22846 +0000<br>
&gt; +@@ -1,4 +1,4 @@<br>
&gt; +-include debian/<a href=3D"http://detect_arch.mk" rel=3D"noreferrer" =
target=3D"_blank">detect_arch.mk</a><br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; +<br>
&gt; + ARCH_SOURCES =3D is_fpreg.c \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regname.c \<b=
r>
&gt; +@@ -131,10 +131,12 @@<br>
&gt; + CPPFLAGS +=3D -Iinclude -Isrc $($(CPU)_INCLUDES) -Idebian/include<br=
>
&gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/lib/$(DEB=
_HOST_MULTIARCH)/android \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -nostdlib -lc -lg=
cc -Ldebian/out -l7z<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lpthread -nostdlib -lc -lg=
cc -l7z<br>
&gt; +<br>
&gt; + build: $(SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 mkdir --parents debian/out<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s /usr/lib/p7zip/7z.so debian/out/lib7z.so<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o debian/out/$(NAME).so.0 $(CFLAGS) $=
(CPPFLAGS) $(LDFLAGS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 debian/out/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/lib/$(DEB_HOST_M=
ULTIARCH)/android/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mkdir --parents $(OUT_DIR)/usr/include/android/=
libunwind<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTI=
ARCH)/android/$(NAME).so.0 $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -Wno-header-gua=
rd -Wno-absolute-value<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOS=
T_MULTIARCH)/android/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r include/* debian/include/* $(OUT_DIR)/usr=
/include/android/libunwind/<br>
&gt; ++<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libz=
iparchive_mk_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/=
android-tools/libziparchive_mk_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..cc9997dac<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/libziparchi=
ve_mk_change_out_dir.patch<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +patching <a href=3D"http://libziparchive.mk" rel=3D"noreferrer" targe=
t=3D"_blank">libziparchive.mk</a> to build in yocto environment.<br>
&gt; +<br>
&gt; +Changes include:<br>
&gt; +Introduced an output folder which will keep all the outputs from the<=
br>
&gt; +android-tools.<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary to the OUT_DIR<=
br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +--- git/system/core/debian/<a href=3D"http://libziparchive.mk" rel=3D=
"noreferrer" target=3D"_blank">libziparchive.mk</a>=C2=A0 =C2=A0 2021-05-17=
 08:13:41.684459540 +0000<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://libziparchive.mk" rel=3D=
"noreferrer" target=3D"_blank">libziparchive.mk</a>=C2=A0 =C2=A0 2021-05-17=
 08:16:19.293722572 +0000<br>
&gt; +@@ -1,3 +1,4 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME =3D libziparchive<br>
&gt; + SOURCES =3D zip_archive.cc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zip_archive_stream_entry.cc\=
<br>
&gt; +@@ -5,14 +6,15 @@<br>
&gt; + SOURCES :=3D $(foreach source, $(SOURCES), libziparchive/$(source))<=
br>
&gt; + CXXFLAGS +=3D -std=3Dgnu++17<br>
&gt; + CPPFLAGS +=3D -DZLIB_CONST -D_FILE_OFFSET_BITS=3D64 \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Iinclude -Ibase/include -=
Ilibziparchive/include<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Iinclude -Ibase/include -=
Ilibziparchive/include -I$(OUT_DIR)/usr/include/<br>
&gt; + LDFLAGS +=3D -shared -Wl,-soname,$(NAME).so.0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-rpath=3D/usr/lib/$(DEB=
_HOST_MULTIARCH)/android \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lz -L. -llog -lbase<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-lz -L$(OUT_DIR)/usr/lib/$(=
DEB_HOST_MULTIARCH)/android -llog -lbase<br>
&gt; +<br>
&gt; + build: $(SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(NAME).so.0 $(CXXFLAGS) $(CPPFLAG=
S) $(LDFLAGS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/lib/$(DEB_HOST_MULT=
IARCH)/android/$(NAME).so.0 $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ln -s $(NAME).so.0 $(OUT_DIR)/usr/lib/$(DEB_HOS=
T_MULTIARCH)/android/$(NAME).so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 cp -r libziparchive/include/* $(OUT_DIR)/usr/in=
clude/<br>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) $(NAME).so*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/=
android/$(NAME).so*<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/<a h=
ref=3D"http://mkbootimg.mk" rel=3D"noreferrer" target=3D"_blank">mkbootimg.=
mk</a> b/meta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"ht=
tp://mkbootimg.mk" rel=3D"noreferrer" target=3D"_blank">mkbootimg.mk</a><br=
>
&gt; deleted file mode 100644<br>
&gt; index 519f609fd..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"=
http://mkbootimg.mk" rel=3D"noreferrer" target=3D"_blank">mkbootimg.mk</a><=
br>
&gt; +++ /dev/null<br>
&gt; @@ -1,29 +0,0 @@<br>
&gt; -# Makefile for mkbootimg<br>
&gt; -<br>
&gt; -SRCDIR ?=3D $(S)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/mkbootimg<br>
&gt; -mkbootimg_SRC_FILES +=3D mkbootimg.c<br>
&gt; -mkbootimg_OBJS :=3D $(mkbootimg_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -VPATH +=3D $(SRCDIR)/system/core/libmincrypt<br>
&gt; -libmincrypt_SRC_FILES :=3D dsa_sig.c p256.c p256_ec.c p256_ecdsa.c rs=
a.c sha.c sha256.c<br>
&gt; -libmincrypt_OBJS :=3D $(libmincrypt_SRC_FILES:.c=3D.o)<br>
&gt; -<br>
&gt; -CFLAGS +=3D -DANDROID<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/mkbootimg<br>
&gt; -CFLAGS +=3D -I$(SRCDIR)/system/core/include<br>
&gt; -CFLAGS +=3D -include $(SRCDIR)/build/core/combo/include/arch/$(androi=
d_arch)/AndroidConfig.h<br>
&gt; -<br>
&gt; -LIBS +=3D libmincrypt.a<br>
&gt; -<br>
&gt; -all: mkbootimg<br>
&gt; -<br>
&gt; -mkbootimg: libmincrypt.a $(mkbootimg_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $(LDFLAGS) $(mkbootimg_OBJS) $=
(LIBS)<br>
&gt; -<br>
&gt; -libmincrypt.a: $(libmincrypt_OBJS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AR) rcs $@ $(libmincrypt_OBJS)<br>
&gt; -<br>
&gt; -clean:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) $(mkbootimg_OBJS) $(libmincrypt_OBJS=
) mkbootimg *.a<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/<a h=
ref=3D"http://rules_yocto.mk" rel=3D"noreferrer" target=3D"_blank">rules_yo=
cto.mk</a> b/meta-oe/recipes-devtools/android-tools/android-tools/<a href=
=3D"http://rules_yocto.mk" rel=3D"noreferrer" target=3D"_blank">rules_yocto=
.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..5e217f47f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/<a href=3D"=
http://rules_yocto.mk" rel=3D"noreferrer" target=3D"_blank">rules_yocto.mk<=
/a><br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +CPPFLAGS +=3D -fPIC<br>
&gt; +ifndef OUT_DIR<br>
&gt; +OUT_DIR =3D ../../debian/out<br>
&gt; +endif<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/simg=
2img_change_out_dir.patch b/meta-oe/recipes-devtools/android-tools/android-=
tools/simg2img_change_out_dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..d17adfffd<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/simg2img_ch=
ange_out_dir.patch<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +patching <a href=3D"http://simg2img.mk" rel=3D"noreferrer" target=3D"=
_blank">simg2img.mk</a> to build in yocto environment.<br>
&gt; +<br>
&gt; +Changes include:<br>
&gt; +Introduced an output folder which will keep all the outputs from the<=
br>
&gt; +android-tools.<br>
&gt; +<br>
&gt; +Adding an include file that is setting the common flags.<br>
&gt; +Changed the cppflag to include the headers from other components<br>
&gt; +of android-tools<br>
&gt; +<br>
&gt; +Modified LDflags so that the libraries that are coming from other and=
roid-tools<br>
&gt; +are searched in the output folder.<br>
&gt; +<br>
&gt; +Modified the build rule so that it outputs the binary to the OUT_DIR<=
br>
&gt; +<br>
&gt; +Signed-off-by: Nisha Parrakat &lt;<a href=3D"mailto:Nisha.Parrakat@kp=
it.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +--- git/system/core/debian/<a href=3D"http://simg2img.mk" rel=3D"nore=
ferrer" target=3D"_blank">simg2img.mk</a> 2021-05-12 09:47:52.577840520 +00=
00<br>
&gt; ++++ git/system/core/debian/<a href=3D"http://simg2img.mk" rel=3D"nore=
ferrer" target=3D"_blank">simg2img.mk</a> 2021-05-12 09:51:43.525678276 +00=
00<br>
&gt; +@@ -1,13 +1,14 @@<br>
&gt; ++include ../../<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer" t=
arget=3D"_blank">rules_yocto.mk</a><br>
&gt; + NAME =3D simg2img<br>
&gt; + SOURCES =3D simg2img.cpp sparse_crc32.cpp<br>
&gt; + SOURCES :=3D $(foreach source, $(SOURCES), libsparse/$(source))<br>
&gt; + CPPFLAGS +=3D -Ilibsparse/include -Iinclude -std=3Dgnu++17<br>
&gt; +-LDFLAGS +=3D -Wl,-rpath=3D/usr/lib/$(DEB_HOST_MULTIARCH)/android \<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D. \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L. -lsparse<br>
&gt; ++LDFLAGS +=3D -Wl,-rpath=3D$(OUT_DIR)/usr/lib/$(DEB_HOST_MULTIARCH)/a=
ndroid \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link=3D$(OUT_DIR=
)/usr/lib/$(DEB_HOST_MULTIARCH)/android \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(OUT_DIR)/usr/lib/$(DEB_=
HOST_MULTIARCH)/android -lsparse<br>
&gt; +<br>
&gt; + build: $(SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o libsparse/$(NAME) $(CPPFLAGS) $(LD=
FLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(CXX) $^ -o $(OUT_DIR)/usr/bin/$(NAME) $(CPPFL=
AGS) $(LDFLAGS)<br>
&gt; +<br>
&gt; + clean:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(RM) libsparse/$(NAME)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(RM) $(OUT_DIR)/usr/bin/$(NAME)<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/use_=
name_space_std_to_compile_libbacktrace.patch b/meta-oe/recipes-devtools/and=
roid-tools/android-tools/use_name_space_std_to_compile_libbacktrace.patch<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000..079ade46b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/android-tools/use_name_sp=
ace_std_to_compile_libbacktrace.patch<br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +To Fix the below error<br>
&gt; +<br>
&gt; + In file included from libunwindstack/DwarfSection.cpp:21:<br>
&gt; +| libunwindstack/include/unwindstack/DwarfMemory.h:32:29: error: unkn=
own type name &#39;size_t&#39;; did you mean &#39;std::size_t&#39;?<br>
&gt; +|=C2=A0 =C2=A0bool ReadBytes(void* dst, size_t num_bytes);<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::size_t<br>
&gt; +<br>
&gt; +--- ./system/core/libunwindstack/include/unwindstack/DwarfMemory.h=C2=
=A0 =C2=A0 =C2=A02021-05-22 00:52:15.132452862 +0000<br>
&gt; ++++ ./system/core/libunwindstack/include/unwindstack/DwarfMemory.h=C2=
=A0 =C2=A0 =C2=A02021-05-22 00:53:09.793416724 +0000<br>
&gt; +@@ -23,7 +23,7 @@<br>
&gt; +<br>
&gt; + // Forward declarations.<br>
&gt; + class Memory;<br>
&gt; +-<br>
&gt; ++using namespace std;<br>
&gt; + class DwarfMemory {<br>
&gt; +=C2=A0 public:<br>
&gt; +=C2=A0 =C2=A0DwarfMemory(Memory* memory) : memory_(memory) {}<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/<a href=3D"http://=
android-tools_10.0.0.r36.bb" rel=3D"noreferrer" target=3D"_blank">android-t=
ools_10.0.0.r36.bb</a> b/meta-oe/recipes-devtools/android-tools/<a href=3D"=
http://android-tools_10.0.0.r36.bb" rel=3D"noreferrer" target=3D"_blank">an=
droid-tools_10.0.0.r36.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..02c669582<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/android-tools/<a href=3D"http://android=
-tools_10.0.0.r36.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_10=
.0.0.r36.bb</a><br>
&gt; @@ -0,0 +1,204 @@<br>
&gt; +DESCRIPTION =3D &quot;Different utilities from Android&quot;<br>
&gt; +SECTION =3D &quot;console/utils&quot;<br>
&gt; +LICENSE =3D &quot;Apache-2.0 &amp; GPL-2.0 &amp; BSD-2-Clause &amp; B=
SD-3-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17=
d99a7cacdbeed46a0096b10 \<br>
&gt; +=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f809=
80d171dd6425610833a22dbe6 \<br>
&gt; +=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc=
04cda31daea161b1bc15da69f \<br>
&gt; +=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D5507944=
65ba0ec5312d6919e203a55f9 \<br>
&gt; +&quot;<br>
&gt; +DEPENDS =3D &quot;libbsd libpcre zlib libcap libusb squashfs-tools p7=
zip libselinux&quot;<br>
&gt; +<br>
&gt; +ANDROID_MIRROR =3D &quot;<a href=3D"http://android.googlesource.com" =
rel=3D"noreferrer" target=3D"_blank">android.googlesource.com</a>&quot;<br>
&gt; +<br>
&gt; +# matches with 10.0.0+r36<br>
&gt; +SRCREV_boringssl =3D &quot;ae2dd49c7cb74d04bdba7c1c9bd62c1e9cdf98f6&q=
uot;<br>
&gt; +SRCREV_core =3D &quot;5aa13b053182b758d7a19db0c83e1b9b5bf1ec2e&quot;<=
br>
&gt; +SRCREV_extras =3D &quot;d31740f9d0399f8b938e88e58843d966e1cccab6&quot=
;<br>
&gt; +SRCREV_libhardware =3D &quot;c6925520342a7d37758f85eb1cf3baa20a7b7a18=
&quot;<br>
&gt; +SRCREV_build =3D &quot;28768b3120f751583a2743101b892f210d4715cf&quot;=
<br>
&gt; +SRCREV_libunwind =3D &quot;03a963ecf6ea836b38b3537cbcda0ecfd7a77393&q=
uot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/android-tools-=
team/android-platform-external-boringssl;name=3Dboringssl;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3Dgit/external/boringssl" rel=3D"noreferrer" target=
=3D"_blank">salsa.debian.org/android-tools-team/android-platform-external-b=
oringssl;name=3Dboringssl;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/ex=
ternal/boringssl</a> \<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/android-tools-=
team/android-platform-system-core;name=3Dcore;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3Dgit/system/core" rel=3D"noreferrer" target=3D"_blank">salsa.d=
ebian.org/android-tools-team/android-platform-system-core;name=3Dcore;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/core</a> \<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/android-tools-=
team/android-platform-system-extras;name=3Dextras;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3Dgit/system/extras" rel=3D"noreferrer" target=3D"_blank">s=
alsa.debian.org/android-tools-team/android-platform-system-extras;name=3Dex=
tras;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/extras</a> \<br>
&gt; +=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/hardware/libhardware;n=
ame=3Dlibhardware;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/hardware/l=
ibhardware \<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/android-tools-=
team/android-platform-build.git;name=3Dbuild;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3Dgit/build" rel=3D"noreferrer" target=3D"_blank">salsa.debian.o=
rg/android-tools-team/android-platform-build.git;name=3Dbuild;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3Dgit/build</a> \<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://salsa.debian.org/android-tools-=
team/android-platform-external-libunwind.git;protocol=3Dhttps;name=3Dlibunw=
ind;nobranch=3D1;destsuffix=3Dgit/external/libunwind" rel=3D"noreferrer" ta=
rget=3D"_blank">salsa.debian.org/android-tools-team/android-platform-extern=
al-libunwind.git;protocol=3Dhttps;name=3Dlibunwind;nobranch=3D1;destsuffix=
=3Dgit/external/libunwind</a> \<br>
&gt; +=C2=A0 =C2=A0 file://adb_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://libadb_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://fastboot_compile_remove_gtest.patch \<br>
&gt; +=C2=A0 =C2=A0 file://fastboot_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://libbase_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://libext4_utils_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://libcrypto_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://libcrypto_utils_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://libcutils_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://libfec_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://img2simg_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://simg2img_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://liblog_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://libsparse_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://libziparchive_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://libbacktrace_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://libunwind_mk_change_out_dir.patch \<br>
&gt; +=C2=A0 =C2=A0 file://use_name_space_std_to_compile_libbacktrace.patch=
 \<br>
&gt; +=C2=A0 =C2=A0 file://<a href=3D"http://rules_yocto.mk" rel=3D"norefer=
rer" target=3D"_blank">rules_yocto.mk</a>;subdir=3Dgit \<br>
&gt; +=C2=A0 =C2=A0 file://android-tools-adbd.service \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +B =3D &quot;${WORKDIR}/${BPN}&quot;<br>
&gt; +<br>
&gt; +#apply all the patches maintained in the debian version.<br>
&gt; +do_unpack_and_patch_debian() {<br>
&gt; +=C2=A0 =C2=A0 cd ${S}/system/core<br>
&gt; +=C2=A0 =C2=A0 for i in `find ${S}/system/core/debian/patches -name &q=
uot;*.patch&quot;`; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch -p1 &lt; $i<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 #a patch with no .patch extention, lets apply that<br>
&gt; +=C2=A0 =C2=A0 patch -p1 &lt; ${S}/system/core/debian/patches/Added-mi=
ssing-headers<br>
&gt; +=C2=A0 =C2=A0 cd ${S}/external/libunwind<br>
&gt; +=C2=A0 =C2=A0 for i in `find ${S}/external/libunwind/debian/patches -=
name &quot;*.patch&quot;`; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch -p1 &lt; $i<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +}<br>
&gt; +addtask unpack_and_patch_debian after do_unpack before do_patch<br>
&gt; +<br>
&gt; +# <a href=3D"http://errors.yoctoproject.org/Errors/Details/1debian881=
/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Erro=
rs/Details/1debian881/</a><br>
&gt; +ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
&gt; +ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST_powerpc =3D &quot;(null)&quot;<br>
&gt; +COMPATIBLE_HOST_powerpc64 =3D &quot;(null)&quot;<br>
&gt; +COMPATIBLE_HOST_powerpc64le =3D &quot;(null)&quot;<br>
&gt; +<br>
&gt; +inherit systemd clang<br>
&gt; +<br>
&gt; +TOOLCHAIN =3D &quot;clang&quot;<br>
&gt; +DEPENDS +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 clang-cross-${TARGET_ARCH} \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SYSTEMD_SERVICE_${PN} =3D &quot;android-tools-adbd.service&quot;<br>
&gt; +<br>
&gt; +# Find libbsd headers during native builds<br>
&gt; +CC_append_class-native =3D &quot; -I${STAGING_INCDIR}&quot;<br>
&gt; +CC_append_class-nativesdk =3D &quot; -I${STAGING_INCDIR}&quot;<br>
&gt; +<br>
&gt; +PREREQUISITE_core =3D &quot;libbase libsparse liblog libcutils&quot;<=
br>
&gt; +TOOLS_TO_BUILD =3D &quot;libcrypto_utils libadb libziparchive fastboo=
t adb img2simg simg2img libbacktrace&quot;<br>
&gt; +<br>
&gt; +# Adb needs sys/capability.h, which is not available for native*<br>
&gt; +TOOLS_class-native =3D &quot;boringssl fastboot ext4_utils mkbootimg&=
quot;<br>
&gt; +TOOLS_class-nativesdk =3D &quot;boringssl fastboot ext4_utils mkbooti=
mg&quot;<br>
&gt; +<br>
&gt; +do_compile() {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case &quot;${HOST_ARCH}&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 arm)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-arm<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu=3Darm<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_host_arch=3Darm<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 aarch64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-arm64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu=3Darm64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_host_arch=3Darm64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 riscv64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-riscv64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 mips|mipsel)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-mips<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu=3Dmips<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_host_arch=3Dmips<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 mips64|mips64el)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-mips64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu=3Dmips64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_host_arch=3Dmips64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 powerpc|powerpc64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-ppc<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 i586|i686|x86_64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-x86<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu=3Dx86_64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_host_arch=3Damd64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 esac<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 export SRCDIR=3D${S}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 oe_runmake -f ${S}/external/boringssl/debian/<a href=3D=
"http://libcrypto.mk" rel=3D"noreferrer" target=3D"_blank">libcrypto.mk</a>=
 -C ${S}/external/boringssl<br>
&gt; +=C2=A0 =C2=A0 oe_runmake -f ${S}/external/libunwind/debian/<a href=3D=
"http://libunwind.mk" rel=3D"noreferrer" target=3D"_blank">libunwind.mk</a>=
 -C ${S}/external/libunwind CPU=3D${cpu}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for tool in ${PREREQUISITE_core}; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 oe_runmake -f ${S}/system/core/debian/${tool}.mk=
 -C ${S}/system/core<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for i in `find ${S}/system/extras/debian/ -name &quot;*=
.mk&quot;`; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -f $i -C ${S}/system/extras<br=
>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for tool in ${TOOLS_TO_BUILD}; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if tool =3D=3D &quot;libbacktrace&quot;; =
then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -f ${S}/system/c=
ore/debian/${tool}.mk -C ${S}/system/core DEB_HOST_ARCH=3D${deb_host_arch}<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -f ${S}/system/c=
ore/debian/${tool}.mk -C ${S}/system/core<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 if echo ${TOOLS_TO_BUILD} | grep -q &quot;ext4_utils&qu=
ot; ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -p -m0755 ${S}/system/core/lib=
sparse/simg_dump.py ${D}${bindir}/simg_dump<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if echo ${TOOLS_TO_BUILD} | grep -q &quot;adb &quot; ; =
then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${S}/debian/out/usr/lib/an=
droid/adb/adb ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if echo ${TOOLS_TO_BUILD} | grep -q &quot;adbd&quot; ; =
then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/adbd/adbd ${D}${bindi=
r}<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Outside the if statement to avoid errors during do_pa=
ckage<br>
&gt; +=C2=A0 =C2=A0 install -D -p -m0644 ${WORKDIR}/android-tools-adbd.serv=
ice \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ${D}${systemd_unitdir}/system/android-tools-adbd=
.service<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if echo ${TOOLS_TO_BUILD} | grep -q &quot;fastboot&quot=
; ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${S}/debian/out/usr/bin/fa=
stboot/fastboot ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 install -d=C2=A0 ${D}${libdir}/android/<br>
&gt; +=C2=A0 =C2=A0 install -m0755 ${S}/debian/out/usr/lib/android/*.so.* $=
{D}${libdir}/android/<br>
&gt; +=C2=A0 =C2=A0 if echo ${TOOLS_TO_BUILD} | grep -q &quot;mkbootimg&quo=
t; ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/mkbootimg/mkbootimg $=
{D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +}<br>
&gt; +<br>
&gt; +PACKAGES +=3D &quot;${PN}-fstools&quot;<br>
&gt; +<br>
&gt; +RDEPENDS_${BPN} =3D &quot;${BPN}-conf p7zip&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-fstools =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/ext2simg \<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/ext4fixup \<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/img2simg \<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/make_ext4fs \<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/simg2img \<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/simg2simg \<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/simg_dump \<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/mkuserimg \<br>
&gt; +&quot;<br>
&gt; +FILES_${PN} +=3D &quot;${libdir}/android ${libdir}/android/*&quot;<br=
>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; diff --git a/meta-oe/recipes-devtools/android-tools/<a href=3D"http://=
android-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank">android-to=
ols_5.1.1.r37.bb</a> b/meta-oe/recipes-devtools/android-tools/<a href=3D"ht=
tp://android-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank">andro=
id-tools_5.1.1.r37.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index e8992346b..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/android-tools/<a href=3D"http://android=
-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_5.1=
.1.r37.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,182 +0,0 @@<br>
&gt; -DESCRIPTION =3D &quot;Different utilities from Android&quot;<br>
&gt; -SECTION =3D &quot;console/utils&quot;<br>
&gt; -LICENSE =3D &quot;Apache-2.0 &amp; GPL-2.0 &amp; BSD-2-Clause &amp; B=
SD-3-Clause&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17=
d99a7cacdbeed46a0096b10 \<br>
&gt; -=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f809=
80d171dd6425610833a22dbe6 \<br>
&gt; -=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc=
04cda31daea161b1bc15da69f \<br>
&gt; -=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D5507944=
65ba0ec5312d6919e203a55f9 \<br>
&gt; -&quot;<br>
&gt; -DEPENDS =3D &quot;libbsd libpcre zlib libcap&quot;<br>
&gt; -DEPENDS_append_class-target =3D &quot; openssl&quot;<br>
&gt; -<br>
&gt; -ANDROID_MIRROR =3D &quot;<a href=3D"http://android.googlesource.com" =
rel=3D"noreferrer" target=3D"_blank">android.googlesource.com</a>&quot;<br>
&gt; -<br>
&gt; -# matches with android-5.1.1_r37<br>
&gt; -SRCREV_core =3D &quot;2314b110bdebdbfd2d94c502282f9e57c849897e&quot;<=
br>
&gt; -SRCREV_extras =3D &quot;3ecbe8d841df96127d7855661293e5ab6ba6c205&quot=
;<br>
&gt; -SRCREV_libhardware =3D &quot;be55eb1f4d840c82ffaf7c47460df17ff5bc4d9b=
&quot;<br>
&gt; -SRCREV_libselinux =3D &quot;07e9e1339ad1ba608acfba9dce2d0f474b252feb&=
quot;<br>
&gt; -SRCREV_build =3D &quot;16e987def3d7d8f7d30805eb95cef69e52a87dbc&quot;=
<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/system/core;name=3Dcor=
e;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/core \<br>
&gt; -=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/system/extras;name=3De=
xtras;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/system/extras \<br>
&gt; -=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/hardware/libhardware;n=
ame=3Dlibhardware;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/hardware/l=
ibhardware \<br>
&gt; -=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/external/libselinux;na=
me=3Dlibselinux;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/external/lib=
selinux \<br>
&gt; -=C2=A0 =C2=A0 git://${ANDROID_MIRROR}/platform/build;name=3Dbuild;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/build \<br>
&gt; -=C2=A0 =C2=A0 file://core/0001-adb-remove-selinux-extensions.patch;pa=
tchdir=3Dsystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/0002-adb-Use-local-sockets-where-appropriat=
e.patch;patchdir=3Dsystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/0003-adb-define-shell-command.patch;patchdi=
r=3Dsystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/0004-adb-Fix-build-on-big-endian-systems.pa=
tch;patchdir=3Dsystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/0005-adb-add-base64-implementation.patch;pa=
tchdir=3Dsystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/0006-adb-Musl-fixes.patch;patchdir=3Dsystem=
/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/0007-adb-usb_linux.c-fix-build-with-glibc-2=
.28.patch;patchdir=3Dsystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/0008-adb-Allow-adbd-to-be-ran-as-root.patch=
;patchdir=3Dsystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/0009-mkbootimg-Add-dt-parameter-to-specify-=
DT-image.patch;patchdir=3Dsystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/0010-Use-linux-capability.h-on-linux-system=
s-too.patch;patchdir=3Dsystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/0011-Remove-bionic-specific-calls.patch;pat=
chdir=3Dsystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/0012-Fix-implicit-declaration-of-stlcat-str=
lcopy-function.patch;patchdir=3Dsystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://core/adb_libssl_11.diff;patchdir=3Dsystem/core \=
<br>
&gt; -=C2=A0 =C2=A0 file://core/0013-adb-Support-riscv64.patch;patchdir=3Ds=
ystem/core \<br>
&gt; -=C2=A0 =C2=A0 file://extras/0001-ext4_utils-remove-selinux-extensions=
.patch;patchdir=3Dsystem/extras \<br>
&gt; -=C2=A0 =C2=A0 file://extras/0002-ext4_utils-add-o-argument-to-preserv=
e-ownership.patch;patchdir=3Dsystem/extras \<br>
&gt; -=C2=A0 =C2=A0 file://libselinux/0001-Remove-bionic-specific-calls.pat=
ch;patchdir=3Dexternal/libselinux \<br>
&gt; -=C2=A0 =C2=A0 file://libselinux/0001-libselinux-Do-not-define-gettid-=
if-glibc-2.30-is-use.patch;patchdir=3Dexternal/libselinux \<br>
&gt; -=C2=A0 =C2=A0 file://android-tools-adbd.service \<br>
&gt; -=C2=A0 =C2=A0 file://build/0001-Riscv-Add-risc-v-Android-config-heade=
r.patch;patchdir=3Dbuild \<br>
&gt; -=C2=A0 =C2=A0 file://gitignore \<br>
&gt; -=C2=A0 =C2=A0 file://<a href=3D"http://adb.mk" rel=3D"noreferrer" tar=
get=3D"_blank">adb.mk</a>;subdir=3D${BPN} \<br>
&gt; -=C2=A0 =C2=A0 file://<a href=3D"http://adbd.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">adbd.mk</a>;subdir=3D${BPN} \<br>
&gt; -=C2=A0 =C2=A0 file://<a href=3D"http://ext4_utils.mk" rel=3D"noreferr=
er" target=3D"_blank">ext4_utils.mk</a>;subdir=3D${BPN} \<br>
&gt; -=C2=A0 =C2=A0 file://<a href=3D"http://fastboot.mk" rel=3D"noreferrer=
" target=3D"_blank">fastboot.mk</a>;subdir=3D${BPN} \<br>
&gt; -=C2=A0 =C2=A0 file://<a href=3D"http://mkbootimg.mk" rel=3D"noreferre=
r" target=3D"_blank">mkbootimg.mk</a>;subdir=3D${BPN} \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -B =3D &quot;${WORKDIR}/${BPN}&quot;<br>
&gt; -<br>
&gt; -# <a href=3D"http://errors.yoctoproject.org/Errors/Details/133881/" r=
el=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/D=
etails/133881/</a><br>
&gt; -ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
&gt; -ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
&gt; -<br>
&gt; -COMPATIBLE_HOST_powerpc =3D &quot;(null)&quot;<br>
&gt; -COMPATIBLE_HOST_powerpc64 =3D &quot;(null)&quot;<br>
&gt; -COMPATIBLE_HOST_powerpc64le =3D &quot;(null)&quot;<br>
&gt; -<br>
&gt; -inherit systemd<br>
&gt; -<br>
&gt; -SYSTEMD_PACKAGES =3D &quot;${PN}-adbd&quot;<br>
&gt; -SYSTEMD_SERVICE_${PN}-adbd =3D &quot;android-tools-adbd.service&quot;=
<br>
&gt; -<br>
&gt; -# Find libbsd headers during native builds<br>
&gt; -CC_append_class-native =3D &quot; -I${STAGING_INCDIR}&quot;<br>
&gt; -CC_append_class-nativesdk =3D &quot; -I${STAGING_INCDIR}&quot;<br>
&gt; -<br>
&gt; -TOOLS =3D &quot;adb fastboot ext4_utils mkbootimg adbd&quot;<br>
&gt; -<br>
&gt; -# Adb needs sys/capability.h, which is not available for native*<br>
&gt; -TOOLS_class-native =3D &quot;fastboot ext4_utils mkbootimg&quot;<br>
&gt; -TOOLS_class-nativesdk =3D &quot;fastboot ext4_utils mkbootimg&quot;<b=
r>
&gt; -<br>
&gt; -do_compile() {<br>
&gt; -=C2=A0 =C2=A0 cp ${WORKDIR}/gitignore ${S}/.gitignore<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 # Setting both variables below causing our makefiles to=
 not work with<br>
&gt; -=C2=A0 =C2=A0 # implicit make rules<br>
&gt; -=C2=A0 =C2=A0 unset CFLAGS<br>
&gt; -=C2=A0 =C2=A0 unset CPPFLAGS<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 export SRCDIR=3D${S}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 case &quot;${HOST_ARCH}&quot; in<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 arm)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-arm<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 aarch64)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-arm64<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 riscv64)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-riscv64<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 mips|mipsel)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-mips<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 mips64|mips64el)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-mips64<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 powerpc|powerpc64)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-ppc<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 i586|i686|x86_64)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export android_arch=3Dlinux-x86<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; -=C2=A0 =C2=A0 esac<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 for tool in ${TOOLS}; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 mkdir -p ${B}/${tool}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 oe_runmake -f ${B}/${tool}.mk -C ${B}/${tool}<br=
>
&gt; -=C2=A0 =C2=A0 done<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_install() {<br>
&gt; -=C2=A0 =C2=A0 if echo ${TOOLS} | grep -q &quot;ext4_utils&quot; ; the=
n<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -p -m0755 ${S}/system/core/lib=
sparse/simg_dump.py ${D}${bindir}/simg_dump<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -p -m0755 ${S}/system/extras/e=
xt4_utils/mkuserimg.sh ${D}${bindir}/mkuserimg<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/ext2simg $=
{D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/ext4fixup =
${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/img2simg $=
{D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/make_ext4f=
s ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/simg2img $=
{D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/ext4_utils/simg2simg =
${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 fi<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if echo ${TOOLS} | grep -q &quot;adb &quot; ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/adb/adb ${D}${bindir}=
<br>
&gt; -=C2=A0 =C2=A0 fi<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if echo ${TOOLS} | grep -q &quot;adbd&quot; ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/adbd/adbd ${D}${bindi=
r}<br>
&gt; -=C2=A0 =C2=A0 fi<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 # Outside the if statement to avoid errors during do_pa=
ckage<br>
&gt; -=C2=A0 =C2=A0 install -D -p -m0644 ${WORKDIR}/android-tools-adbd.serv=
ice \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 ${D}${systemd_unitdir}/system/android-tools-adbd=
.service<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if echo ${TOOLS} | grep -q &quot;fastboot&quot; ; then<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/fastboot/fastboot ${D=
}${bindir}<br>
&gt; -=C2=A0 =C2=A0 fi<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if echo ${TOOLS} | grep -q &quot;mkbootimg&quot; ; then=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0755 ${B}/mkbootimg/mkbootimg $=
{D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 fi<br>
&gt; -}<br>
&gt; -<br>
&gt; -PACKAGES =3D+ &quot;${PN}-fstools ${PN}-adbd&quot;<br>
&gt; -<br>
&gt; -RDEPENDS_${PN}-adbd =3D &quot;${PN}-conf&quot;<br>
&gt; -RDEPENDS_${PN}-fstools =3D &quot;bash&quot;<br>
&gt; -<br>
&gt; -FILES_${PN}-adbd =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 ${bindir}/adbd \<br>
&gt; -=C2=A0 =C2=A0 ${systemd_unitdir}/system/android-tools-adbd.service \<=
br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -FILES_${PN}-fstools =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 ${bindir}/ext2simg \<br>
&gt; -=C2=A0 =C2=A0 ${bindir}/ext4fixup \<br>
&gt; -=C2=A0 =C2=A0 ${bindir}/img2simg \<br>
&gt; -=C2=A0 =C2=A0 ${bindir}/make_ext4fs \<br>
&gt; -=C2=A0 =C2=A0 ${bindir}/simg2img \<br>
&gt; -=C2=A0 =C2=A0 ${bindir}/simg2simg \<br>
&gt; -=C2=A0 =C2=A0 ${bindir}/simg_dump \<br>
&gt; -=C2=A0 =C2=A0 ${bindir}/mkuserimg \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
</blockquote></div>

--000000000000b8924005c34a91fd--

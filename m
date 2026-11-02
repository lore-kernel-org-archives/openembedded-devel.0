Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14412.1793630978394518382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 06:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kAs0MDvq;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab3d3c5761so28123067b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 06:49:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793630977; cv=none;
        d=google.com; s=arc-20260327;
        b=roSAzfbreeK7s2VG/X46q72ns6tdpyfRtuX1OInwVZ72iBbokTtPguoWhZpeJstsmk
         Jd7szMFQZZuPD25DmaExZpIk2/51yTnh8or9ixvRPhVJcrCOwamvKrsyiS5l/j+Iyjof
         I0pvQ0y2B6NkQ7GyqqXs0JfXCp7Ec3gwxlvRTBiR4dUpkfx2mh/uJn9UlF/HFxF2ju1o
         s0ll7flsU2Wzpcuvz1Zp1/E5Ejia/fgz8avQY/fWxYg8Q+fLdMy1LXwLv4xmIcs7dxwT
         k4CIKuffJm/c4QzJd9dl3/Kp69HMl3TbZHjaPWHb6Gu9aLCpMQp8MnCHG5QDRv4cNl0E
         d8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JVqBTGDgiK1z1gRb3ncnfEjGsIccjILC1oD7+JoUwHo=;
        fh=GAmuCoVjS9oGMn+mnOzGxEzx8+LUfnj0kRwaMfrHa5A=;
        b=ZXNDIf3UVnLDmCa1XK9NUTvAWNoGVQ2YA6AeUx5xEfTaxww7UdN827BUTS+nEjXB5g
         NyATMg9eq+lcSMKzY5fH/WeAlgStpFfwit04Rok3mRA3ush2lhbPm3W3FYD2+h3I8tS/
         23xjA9OfD53S5F1rWtLd4HPT8Iut3bdWaafZGGPcC9Tj6gMPBsapM+xYeGCUQBhdvkol
         nP9EzEbkEoLhBKrL3s/5zehgSXEoXWL11ZpVYMzmQXpvHVqrUo2GBHCndWkhm5yP9XAT
         3TpShT3cRzSR4rUtPsqe08hYkHseqgT7VFd+HC9e6X6VE/+I1v169zAehuSyLgGjRXjb
         87pQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630977; x=1794235777; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVqBTGDgiK1z1gRb3ncnfEjGsIccjILC1oD7+JoUwHo=;
        b=kAs0MDvqYQH4RCc0aYZZv7MeZPBx8Wir7dPmDEWf68krFPwVgkjkUwMXtwoD3oglP2
         tG3LLmOmcGvrY3Nx/3ckazzMiIRcvVwPAhUSTMzDG05vKLxWVUqnOsgI39GGWiEEaBoa
         gM7ONEtereArd4Vj02aeA4cUR1G6F7D4gI/SXR721LnsuV2ni19WjIQcE8GL3xOtDYXH
         UGgn2w8tSB2uXnaSf4GbhCU/bECdVpxmbV9uVWTBQgcXZXzC3cL6ubo3AJRYbLd75ZOU
         8ZTcUNdAtLO+YsDYBupk0hqVMe5cUzvplNrY/+jfcbOGQn5qykGKWV57lepAO0Ubs7a0
         nL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630977; x=1794235777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JVqBTGDgiK1z1gRb3ncnfEjGsIccjILC1oD7+JoUwHo=;
        b=BDCyN76zTX4ZF7xkyKyYsgXI5scGTh6uiJjP5F46FHlnEW4xoHtFaDl4xgDZSbBx5X
         Sc1Olxk+7VZ+g6NuaCblB81TsRSlmm/do9LFg1i6cEGkjMclGmcgaG57nHaqaNt7c2JP
         4RdD/YC+ASSICbxR3Lj0YX6RGoa4PdyzmSX5AIGF8WRhUs8Wh2y6h8qr0inOt+uH31Yb
         xKkka1u3hthNBkLwH83octWIoZ/zg6vt8b7ClG0dg7lZXZ6so2y8qjuYxOS8jjWuc9ma
         to9ZU6Q8cylbx0OP6VxSOXTITnyvCi/OHHkmQYJloxFi0YX37QFZ9yxto+R6hJN7i3j7
         TmZw==
X-Gm-Message-State: APuU4Z/2yPZvY9Pk8nLwz3NPyVNGYIlF/o5Gq+oz5m9ZWIL/MXcG5OHM
	sm73zaKtYCdUZO7bk1SjQQHdaisw0JICyHHRzeb55Zf3v8MJ7utEpkNAAm6qc4YKY0I2ufEic67
	jAIOmkN4TutsBaSAQ/CfYzqkEh4bkeHOh/Q==
X-Gm-Gg: AYBFou0zXb0FrXtBresqMow/r+q3dJi0XSpQ/KFBxsdmO87duh3dIEWB7sCd4H1aSZF
	2owdRGCSp3o8AHEjZTIypt0wmTFAa+FOoiqsz9QMSKjcMh0cXGdJtk4GSzvMdQgre+VGLiTkmDn
	fkigYOzpg9nE6jEnB+VaIHimKB6HMPsIO30dAgzViBQgJIgklxMz9DUVfbVY0wL1K+OlFIO4zYc
	g3kJCC0/x2ETxt8cSya0Nx0ECm0V2hqiDZ+dk3QhRReRfJlyarzeaS1UM9JD8mpG/bS9tjOitZz
	IByO43oTQwomosK9zTWqWKVufttbvd4tPZMvM5WCwHL+5wr+wdpJShZ8Ficu0Ar/evpLsEu8rH1
	jspyQKbdf5mMEHRa/JxiF0C7KnWLvdZ6zZ5t3z2eO+t0jHRbZxYCHNTzcWSt3xmIpMdXjIFGIMM
	x3CGZq6+SX9xB0mHf0VaR4L9sOJ2iDmFoYEE+MW3nP4IXpnvKEREOOOR1tRw9QRfNwTuvqlZJO7
	Q51krlq2JfVf7yAaZ+3CWJ7aa4HJTFPeH0Si2F7DqW3xEVn4Sz5/9hz94PWhABLqLGWn9k6NmVi
	SGNwwbQwyf7s1EKMCL21oiFMK92q09IUCX9XpvLA7LY7+o0uX2LY0KPUDKvekc9XmgKxEvlvG7O
	dIAjnWGkx0FZhDubl00xjNg==
X-Received: by 2002:a05:690c:6e84:b0:87d:b776:c659 with SMTP id
 00721157ae682-8b2b66d9a82mr71599887b3.11.1793630977063; Mon, 02 Nov 2026
 06:49:37 -0800 (PST)
MIME-Version: 1.0
References: <20261102072934.89576-1-ayoub.zaki@embetrix.com>
In-Reply-To: <20261102072934.89576-1-ayoub.zaki@embetrix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Nov 2026 06:49:10 -0800
X-Gm-Features: AclHuK-5rv1oSMXHcf05p3eZvRa_Ulw2IwH-mbOzA_H2VE1I82MLeAu4QORrO6A
Message-ID: <CAMKF1srcz4vLyny9dYWniO6TPZ+snbSTWhsbA7W7JQum2LtYXg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] leancrypto: add Linux kernel module recipe
To: ayoub.zaki@embetrix.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003f0361065f4c413e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 14:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131750

--0000000000003f0361065f4c413e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rebase it on latest master/master-next branch

On Sun, Nov 1, 2026 at 11:58=E2=80=AFPM Ayoub Zaki via openembedded-devel
<ayoub.zaki=3Dembetrix.com@lists.openembedded.org> wrote:

> Add leancrypto-module to build and package leancrypto.ko
> independently of the userspace library.
>
> Move common source and license metadata into leancrypto.inc and include t=
he
> submitted upstream patch to generate headers using the target kernel
> architecture instead of the build host.
>
> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
> ---
>  ...t-architecture-for-generated-headers.patch | 164 ++++++++++++++++++
>  .../leancrypto/leancrypto-module_1.9.1.bb     |  25 +++
>  .../recipes-crypto/leancrypto/leancrypto.inc  |  10 ++
>  .../leancrypto/leancrypto_1.9.1.bb            |  18 +-
>  4 files changed, 205 insertions(+), 12 deletions(-)
>  create mode 100644
> meta-oe/recipes-crypto/leancrypto/files/0001-linux_kernel-use-target-arch=
itecture-for-generated-headers.patch
>  create mode 100644 meta-oe/recipes-crypto/leancrypto/
> leancrypto-module_1.9.1.bb
>  create mode 100644 meta-oe/recipes-crypto/leancrypto/leancrypto.inc
>
> diff --git
> a/meta-oe/recipes-crypto/leancrypto/files/0001-linux_kernel-use-target-ar=
chitecture-for-generated-headers.patch
> b/meta-oe/recipes-crypto/leancrypto/files/0001-linux_kernel-use-target-ar=
chitecture-for-generated-headers.patch
> new file mode 100644
> index 0000000000..1ce848265e
> --- /dev/null
> +++
> b/meta-oe/recipes-crypto/leancrypto/files/0001-linux_kernel-use-target-ar=
chitecture-for-generated-headers.patch
> @@ -0,0 +1,164 @@
> +From 47aedd8d985b94dc35836925c123cb705985796b Mon Sep 17 00:00:00 2001
> +From: Ayoub Zaki <ayoub.zaki@embetrix.com>
> +Date: Sun, 1 Nov 2026 16:55:00 +0100
> +Subject: [PATCH] linux_kernel: use target architecture for generated
> headers
> +
> +Derive the architecture from the target kernel configuration and pass it
> +to the AWK generators instead of querying uname -m.
> +This prevents cross builds from using the build host's settings.
> +
> +Upstream-Status: Submitted [
> https://github.com/smuellerDD/leancrypto/pull/79]
> +Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
> +---
> + linux_kernel/Kbuild.autogen        | 28 ++++++++++++++++++++++------
> + linux_kernel/README.md             |  8 ++++++++
> + linux_kernel/lc_ascon_hash.awk     |  7 ++-----
> + linux_kernel/lc_hash.h.awk         |  9 +++------
> + linux_kernel/lc_memory_support.awk | 11 ++++-------
> + 5 files changed, 39 insertions(+), 24 deletions(-)
> +
> +diff --git a/linux_kernel/Kbuild.autogen b/linux_kernel/Kbuild.autogen
> +index e5052406d..da6d5d05a 100644
> +--- a/linux_kernel/Kbuild.autogen
> ++++ b/linux_kernel/Kbuild.autogen
> +@@ -3,6 +3,17 @@
> +
> + # Generic support files
> +
> ++# Use the target kernel configuration not the build host architecture
> ++ifdef CONFIG_X86_64
> ++lc_target_arch :=3D x86_64
> ++else ifdef CONFIG_ARM
> ++lc_target_arch :=3D arm
> ++else ifdef CONFIG_ARM64
> ++lc_target_arch :=3D aarch64
> ++else
> ++lc_target_arch :=3D generic
> ++endif
> ++
> + clean-files :=3D $(obj)/lc_memory_support.h $(obj)/lc_hash.h
> +
> + $(obj)/posix_support.o: $(obj)/lc_memory_support.h
> +@@ -10,16 +21,19 @@ $(obj)/posix_support.o: $(obj)/lc_memory_support.h
> + targets +=3D lc_memory_support.h
> +
> + quiet_cmd_build_lc_memory_support =3D GEN     $@
> +-      cmd_build_lc_memory_support =3D awk -f $(src)/lc_memory_support.a=
wk
> $< > $@
> +-$(obj)/lc_memory_support.h: $(src)/../internal/api/
> lc_memory_support.h.in FORCE
> ++      cmd_build_lc_memory_support =3D awk -v target_arch=3D$(lc_target_=
arch)
> \
> ++      -f $(src)/lc_memory_support.awk $< > $@
> ++$(obj)/lc_memory_support.h: $(src)/../internal/api/
> lc_memory_support.h.in \
> ++                        $(src)/lc_memory_support.awk FORCE
> +       $(call if_changed,build_lc_memory_support)
> +
> + $(obj)/leancrypto_kernel.o: $(obj)/lc_hash.h
> + targets +=3D lc_hash.h
> +
> + quiet_cmd_build_lc_hash =3D GEN     $@
> +-      cmd_build_lc_hash =3D awk -f $(src)/lc_hash.h.awk $< > $@
> +-$(obj)/lc_hash.h: $(src)/../hash/api/lc_hash.h.in FORCE
> ++      cmd_build_lc_hash =3D awk -v target_arch=3D$(lc_target_arch) \
> ++      -f $(src)/lc_hash.h.awk $< > $@
> ++$(obj)/lc_hash.h: $(src)/../hash/api/lc_hash.h.in $(src)/lc_hash.h.awk
> FORCE
> +       $(call if_changed,build_lc_hash)
> +
> +
> +@@ -103,8 +117,10 @@ clean-files +=3D $(obj)/lc_ascon_hash.h
> +
> +
> + quiet_cmd_build_lc_ascon_hash =3D GEN     $@
> +-      cmd_build_lc_ascon_hash =3D awk -f $(src)/lc_ascon_hash.awk $< > =
$@
> +-$(obj)/lc_ascon_hash.h: $(src)/../hash/api/lc_ascon_hash.h.in FORCE
> ++      cmd_build_lc_ascon_hash =3D awk -v target_arch=3D$(lc_target_arch=
) \
> ++      -f $(src)/lc_ascon_hash.awk $< > $@
> ++$(obj)/lc_ascon_hash.h: $(src)/../hash/api/lc_ascon_hash.h.in \
> ++                    $(src)/lc_ascon_hash.awk FORCE
> +       $(call if_changed,build_lc_ascon_hash)
> +
> +
> +diff --git a/linux_kernel/README.md b/linux_kernel/README.md
> +index 45ae377cc..17ff76b16 100644
> +--- a/linux_kernel/README.md
> ++++ b/linux_kernel/README.md
> +@@ -21,6 +21,14 @@ directory `linux_kernel`:
> +
> + 2. the leancrypto library is provided with `leancrypto.ko`
> +
> ++For cross-compilation set `KDIR` to the configured and prepared target
> kernel
> ++build directory and pass the kernel architecture and compiler prefix:
> ++
> ++```sh
> ++make KDIR=3D/path/to/target/kernel/build ARCH=3Darm64 \
> ++      CROSS_COMPILE=3Daarch64-linux-gnu-
> ++```
> ++
> + ## Build in Tree
> +
> + When the use of leancrypto as a kernel module is insufficient, e.g. whe=
n
> its
> +diff --git a/linux_kernel/lc_ascon_hash.awk
> b/linux_kernel/lc_ascon_hash.awk
> +index e1fed4cf6..e3c048511 100644
> +--- a/linux_kernel/lc_ascon_hash.awk
> ++++ b/linux_kernel/lc_ascon_hash.awk
> +@@ -1,9 +1,6 @@
> +-# Set the Ascon memory size
> +-BEGIN {
> +-      "uname -m" | getline host
> +-}
> ++# Set the Ascon memory size for target_arch
> + {
> +-      if (host=3D=3D"x86_64") {
> ++      if (target_arch=3D=3D"x86_64") {
> +               gsub("mesondefine LC_DEF_ASCON_AVX512", "define
> LC_DEF_ASCON_AVX512", $0) ;
> +       } else {
> +               gsub("mesondefine LC_DEF_ASCON_AVX512", "undef
> LC_DEF_ASCON_AVX512", $0) ;
> +diff --git a/linux_kernel/lc_hash.h.awk b/linux_kernel/lc_hash.h.awk
> +index d26e36304..0a83bade2 100644
> +--- a/linux_kernel/lc_hash.h.awk
> ++++ b/linux_kernel/lc_hash.h.awk
> +@@ -1,9 +1,6 @@
> +-# Set the hash alignment value
> +-BEGIN {
> +-      "uname -m" | getline host
> +-}
> ++# Set the hash alignment value for target_arch
> + {
> +-      if (host=3D=3D"x86_64") {
> ++      if (target_arch=3D=3D"x86_64") {
> +               # This value has to be limited to 32 as otherwise the has=
h
> +               # algorithms fail to register since their state is larger
> than
> +               # HASH_MAX_DESCSIZE - this is an arbitrary defined value =
in
> +@@ -14,7 +11,7 @@ BEGIN {
> +               # implementation as it requires an alignment of the buffe=
r
> to
> +               # 512 bits.
> +               gsub("@hash_common_alignment@", "32", $0) ;
> +-      } else if (host=3D=3D"arm") {
> ++      } else if (target_arch=3D=3D"arm") {
> +               gsub("@hash_common_alignment@", "32", $0) ;
> +       } else {
> +               gsub("@hash_common_alignment@", "8", $0) ;
> +diff --git a/linux_kernel/lc_memory_support.awk
> b/linux_kernel/lc_memory_support.awk
> +index b3480a7e2..4b346a742 100644
> +--- a/linux_kernel/lc_memory_support.awk
> ++++ b/linux_kernel/lc_memory_support.awk
> +@@ -1,17 +1,14 @@
> +-# Set the XOR alignment value
> +-BEGIN {
> +-      "uname -m" | getline host
> +-}
> ++# Set the XOR alignment value for target_arch
> + {
> +-      if (host=3D=3D"x86_64") {
> ++      if (target_arch=3D=3D"x86_64") {
> +               gsub("mesondefine LC_DEF_HOST_X86_64", "define
> LC_DEF_HOST_X86_64", $0) ;
> +               gsub("mesondefine LC_DEF_HOST_ARM32_NEON", "undef
> LC_DEF_HOST_ARM32_NEON", $0) ;
> +               gsub("mesondefine LC_DEF_HOST_AARCH64", "undef
> LC_DEF_HOST_AARCH64", $0) ;
> +-      } else if (host=3D=3D"arm") {
> ++      } else if (target_arch=3D=3D"arm") {
> +               gsub("mesondefine LC_DEF_HOST_X86_64", "undef
> LC_DEF_HOST_X86_64", $0) ;
> +               gsub("mesondefine LC_DEF_HOST_ARM32_NEON", "define
> LC_DEF_HOST_ARM32_NEON", $0) ;
> +               gsub("mesondefine LC_DEF_HOST_AARCH64", "undef
> LC_DEF_HOST_AARCH64", $0) ;
> +-      } else if (host=3D=3D"aarch64") {
> ++      } else if (target_arch=3D=3D"aarch64") {
> +               gsub("mesondefine LC_DEF_HOST_X86_64", "undef
> LC_DEF_HOST_X86_64", $0) ;
> +               gsub("mesondefine LC_DEF_HOST_ARM32_NEON", "undef
> LC_DEF_HOST_ARM32_NEON", $0) ;
> +               gsub("mesondefine LC_DEF_HOST_AARCH64", "define
> LC_DEF_HOST_AARCH64", $0) ;
> diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto-module_1.9.1.bb
> b/meta-oe/recipes-crypto/leancrypto/leancrypto-module_1.9.1.bb
> new file mode 100644
> index 0000000000..ea74347792
> --- /dev/null
> +++ b/meta-oe/recipes-crypto/leancrypto/leancrypto-module_1.9.1.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Leancrypto Linux kernel module"
> +DESCRIPTION =3D "Standalone Linux kernel module providing PQC-resistant
> algorithms"
> +
> +require leancrypto.inc
> +
> +SRC_URI +=3D
> "file://0001-linux_kernel-use-target-architecture-for-generated-headers.p=
atch"
> +
> +inherit module
> +
> +B =3D "${S}/linux_kernel"
> +
> +MAKE_TARGETS =3D "modules"
> +# Also apply when a custom Kbuild.config is supplied
> +EXTRA_OEMAKE +=3D "KDIR=3D${STAGING_KERNEL_DIR} \
> +                 CONFIG_LEANCRYPTO=3Dm \
> +                 CONFIG_LEANCRYPTO_TEST_MODULES=3Dn \
> +"
> +
> +# Supply Kbuild.config to SRC_URI in a bbappend to select algorithms
> +# Otherwise retain upstream settings
> +do_configure() {
> +    if [ -f ${UNPACKDIR}/Kbuild.config ]; then
> +        install -m 0644 ${UNPACKDIR}/Kbuild.config ${B}/Kbuild.config
> +    fi
> +}
> diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto.inc
> b/meta-oe/recipes-crypto/leancrypto/leancrypto.inc
> new file mode 100644
> index 0000000000..fdccdb5a77
> --- /dev/null
> +++ b/meta-oe/recipes-crypto/leancrypto/leancrypto.inc
> @@ -0,0 +1,10 @@
> +HOMEPAGE =3D "https://leancrypto.org"
> +LICENSE =3D "BSD-3-Clause OR GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE;md5=3D581f53c96a634ae7f241516370a8f1ee \
> +    file://LICENSE.bsd;md5=3D66a5cedaf62c4b2637025f049f9b826f \
> +    file://LICENSE.gplv2;md5=3Deb723b61539feef013de476e68b5c50a \
> +"
> +
> +SRC_URI =3D "git://
> github.com/smuellerDD/leancrypto.git;branch=3Dmaster;protocol=3Dhttps;tag=
=3Dv${PV}
> <http://github.com/smuellerDD/leancrypto.git;branch=3Dmaster;protocol=3Dh=
ttps;tag=3Dv$%7BPV%7D>
> "
> +SRCREV =3D "65eb4e7e84e3a5499460a66b1623ccf6c59628b1"
> diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
> b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
> index 083b70fe8c..43d4b13655 100644
> --- a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
> +++ b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
> @@ -3,19 +3,13 @@ DESCRIPTION =3D "leancrypto is a cryptographic library
> that exclusively contains \
>  PQC-resistant cryptographic algorithms. It is lean, has minimal
> dependencies, \
>  supports stack-only operation and provides optimized implementations for=
 \
>  ML-KEM (Kyber), ML-DSA (Dilithium), SLH-DSA (Sphincs+) and many more"
> -HOMEPAGE =3D "https://leancrypto.org"
> -LICENSE =3D "BSD-3-Clause OR GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE;md5=3D581f53c96a634ae7f241516370a8f1ee \
> -    file://LICENSE.bsd;md5=3D66a5cedaf62c4b2637025f049f9b826f \
> -    file://LICENSE.gplv2;md5=3Deb723b61539feef013de476e68b5c50a \
> -    "
>  SECTION =3D "libs"
> -SRC_URI =3D "git://
> github.com/smuellerDD/leancrypto.git;branch=3Dmaster;protocol=3Dhttps;tag=
=3Dv${PV}
> <http://github.com/smuellerDD/leancrypto.git;branch=3Dmaster;protocol=3Dh=
ttps;tag=3Dv$%7BPV%7D>
> \
> -           file://leancrypto-tests.sh \
> -
>  file://0001-secure_execution_linux-drop-redundant-linux-prctl.h-.patch \
> -           "
> -SRCREV =3D "65eb4e7e84e3a5499460a66b1623ccf6c59628b1"
> +
> +require leancrypto.inc
> +
> +SRC_URI +=3D "file://leancrypto-tests.sh \
> +
> file://0001-secure_execution_linux-drop-redundant-linux-prctl.h-.patch \
> +"
>
>  inherit pkgconfig meson
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131742):
> https://lists.openembedded.org/g/openembedded-devel/message/131742
> Mute This Topic: https://lists.openembedded.org/mt/122054601/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003f0361065f4c413e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please rebase it on latest master/master-next branch</div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Nov 1, 2026 at 11:58=E2=80=AFPM Ayoub Zaki via open=
embedded-devel &lt;ayoub.zaki=3D<a href=3D"mailto:embetrix.com@lists.openem=
bedded.org">embetrix.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Add leancrypto-module to bui=
ld and package leancrypto.ko<br>
independently of the userspace library.<br>
<br>
Move common source and license metadata into leancrypto.inc and include the=
<br>
submitted upstream patch to generate headers using the target kernel<br>
architecture instead of the build host.<br>
<br>
Signed-off-by: Ayoub Zaki &lt;<a href=3D"mailto:ayoub.zaki@embetrix.com" ta=
rget=3D"_blank">ayoub.zaki@embetrix.com</a>&gt;<br>
---<br>
=C2=A0...t-architecture-for-generated-headers.patch | 164 +++++++++++++++++=
+<br>
=C2=A0.../leancrypto/<a href=3D"http://leancrypto-module_1.9.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">leancrypto-module_1.9.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 25 +++<br>
=C2=A0.../recipes-crypto/leancrypto/leancrypto.inc=C2=A0 |=C2=A0 10 ++<br>
=C2=A0.../leancrypto/<a href=3D"http://leancrypto_1.9.1.bb" rel=3D"noreferr=
er" target=3D"_blank">leancrypto_1.9.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 18 +-<br>
=C2=A04 files changed, 205 insertions(+), 12 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/leancrypto/files/0001-linux=
_kernel-use-target-architecture-for-generated-headers.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/leancrypto/<a href=3D"http:=
//leancrypto-module_1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">leancryp=
to-module_1.9.1.bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/leancrypto/leancrypto.inc<b=
r>
<br>
diff --git a/meta-oe/recipes-crypto/leancrypto/files/0001-linux_kernel-use-=
target-architecture-for-generated-headers.patch b/meta-oe/recipes-crypto/le=
ancrypto/files/0001-linux_kernel-use-target-architecture-for-generated-head=
ers.patch<br>
new file mode 100644<br>
index 0000000000..1ce848265e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-crypto/leancrypto/files/0001-linux_kernel-use-target-=
architecture-for-generated-headers.patch<br>
@@ -0,0 +1,164 @@<br>
+From 47aedd8d985b94dc35836925c123cb705985796b Mon Sep 17 00:00:00 2001<br>
+From: Ayoub Zaki &lt;<a href=3D"mailto:ayoub.zaki@embetrix.com" target=3D"=
_blank">ayoub.zaki@embetrix.com</a>&gt;<br>
+Date: Sun, 1 Nov 2026 16:55:00 +0100<br>
+Subject: [PATCH] linux_kernel: use target architecture for generated heade=
rs<br>
+<br>
+Derive the architecture from the target kernel configuration and pass it<b=
r>
+to the AWK generators instead of querying uname -m.<br>
+This prevents cross builds from using the build host&#39;s settings.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/smuellerDD/leanc=
rypto/pull/79" rel=3D"noreferrer" target=3D"_blank">https://github.com/smue=
llerDD/leancrypto/pull/79</a>]<br>
+Signed-off-by: Ayoub Zaki &lt;<a href=3D"mailto:ayoub.zaki@embetrix.com" t=
arget=3D"_blank">ayoub.zaki@embetrix.com</a>&gt;<br>
+---<br>
+ linux_kernel/Kbuild.autogen=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28 +++++++++++++=
+++++++++------<br>
+ linux_kernel/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 8 ++++++++<br>
+ linux_kernel/lc_ascon_hash.awk=C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++-----<br>
+ linux_kernel/lc_hash.h.awk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++=
------<br>
+ linux_kernel/lc_memory_support.awk | 11 ++++-------<br>
+ 5 files changed, 39 insertions(+), 24 deletions(-)<br>
+<br>
+diff --git a/linux_kernel/Kbuild.autogen b/linux_kernel/Kbuild.autogen<br>
+index e5052406d..da6d5d05a 100644<br>
+--- a/linux_kernel/Kbuild.autogen<br>
++++ b/linux_kernel/Kbuild.autogen<br>
+@@ -3,6 +3,17 @@<br>
+ <br>
+ # Generic support files<br>
+ <br>
++# Use the target kernel configuration not the build host architecture<br>
++ifdef CONFIG_X86_64<br>
++lc_target_arch :=3D x86_64<br>
++else ifdef CONFIG_ARM<br>
++lc_target_arch :=3D arm<br>
++else ifdef CONFIG_ARM64<br>
++lc_target_arch :=3D aarch64<br>
++else<br>
++lc_target_arch :=3D generic<br>
++endif<br>
++<br>
+ clean-files :=3D $(obj)/lc_memory_support.h $(obj)/lc_hash.h<br>
+ <br>
+ $(obj)/posix_support.o: $(obj)/lc_memory_support.h<br>
+@@ -10,16 +21,19 @@ $(obj)/posix_support.o: $(obj)/lc_memory_support.h<br>
+ targets +=3D lc_memory_support.h<br>
+ <br>
+ quiet_cmd_build_lc_memory_support =3D GEN=C2=A0 =C2=A0 =C2=A0$@<br>
+-=C2=A0 =C2=A0 =C2=A0 cmd_build_lc_memory_support =3D awk -f $(src)/lc_mem=
ory_support.awk $&lt; &gt; $@<br>
+-$(obj)/lc_memory_support.h: $(src)/../internal/api/<a href=3D"http://lc_m=
emory_support.h.in" rel=3D"noreferrer" target=3D"_blank">lc_memory_support.=
h.in</a> FORCE<br>
++=C2=A0 =C2=A0 =C2=A0 cmd_build_lc_memory_support =3D awk -v target_arch=
=3D$(lc_target_arch) \<br>
++=C2=A0 =C2=A0 =C2=A0 -f $(src)/lc_memory_support.awk $&lt; &gt; $@<br>
++$(obj)/lc_memory_support.h: $(src)/../internal/api/<a href=3D"http://lc_m=
emory_support.h.in" rel=3D"noreferrer" target=3D"_blank">lc_memory_support.=
h.in</a> \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(src)/lc_memory_support.awk FORCE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call if_changed,build_lc_memory_support)<br>
+ <br>
+ $(obj)/leancrypto_kernel.o: $(obj)/lc_hash.h<br>
+ targets +=3D lc_hash.h<br>
+ <br>
+ quiet_cmd_build_lc_hash =3D GEN=C2=A0 =C2=A0 =C2=A0$@<br>
+-=C2=A0 =C2=A0 =C2=A0 cmd_build_lc_hash =3D awk -f $(src)/lc_hash.h.awk $&=
lt; &gt; $@<br>
+-$(obj)/lc_hash.h: $(src)/../hash/api/<a href=3D"http://lc_hash.h.in" rel=
=3D"noreferrer" target=3D"_blank">lc_hash.h.in</a> FORCE<br>
++=C2=A0 =C2=A0 =C2=A0 cmd_build_lc_hash =3D awk -v target_arch=3D$(lc_targ=
et_arch) \<br>
++=C2=A0 =C2=A0 =C2=A0 -f $(src)/lc_hash.h.awk $&lt; &gt; $@<br>
++$(obj)/lc_hash.h: $(src)/../hash/api/<a href=3D"http://lc_hash.h.in" rel=
=3D"noreferrer" target=3D"_blank">lc_hash.h.in</a> $(src)/lc_hash.h.awk FOR=
CE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call if_changed,build_lc_hash)<br>
+ <br>
+ <br>
+@@ -103,8 +117,10 @@ clean-files +=3D $(obj)/lc_ascon_hash.h<br>
+ <br>
+ <br>
+ quiet_cmd_build_lc_ascon_hash =3D GEN=C2=A0 =C2=A0 =C2=A0$@<br>
+-=C2=A0 =C2=A0 =C2=A0 cmd_build_lc_ascon_hash =3D awk -f $(src)/lc_ascon_h=
ash.awk $&lt; &gt; $@<br>
+-$(obj)/lc_ascon_hash.h: $(src)/../hash/api/<a href=3D"http://lc_ascon_has=
h.h.in" rel=3D"noreferrer" target=3D"_blank">lc_ascon_hash.h.in</a> FORCE<b=
r>
++=C2=A0 =C2=A0 =C2=A0 cmd_build_lc_ascon_hash =3D awk -v target_arch=3D$(l=
c_target_arch) \<br>
++=C2=A0 =C2=A0 =C2=A0 -f $(src)/lc_ascon_hash.awk $&lt; &gt; $@<br>
++$(obj)/lc_ascon_hash.h: $(src)/../hash/api/<a href=3D"http://lc_ascon_has=
h.h.in" rel=3D"noreferrer" target=3D"_blank">lc_ascon_hash.h.in</a> \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(s=
rc)/lc_ascon_hash.awk FORCE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call if_changed,build_lc_ascon_hash)<br>
+ <br>
+ <br>
+diff --git a/linux_kernel/README.md b/linux_kernel/README.md<br>
+index 45ae377cc..17ff76b16 100644<br>
+--- a/linux_kernel/README.md<br>
++++ b/linux_kernel/README.md<br>
+@@ -21,6 +21,14 @@ directory `linux_kernel`:<br>
+ <br>
+ 2. the leancrypto library is provided with `leancrypto.ko`<br>
+ <br>
++For cross-compilation set `KDIR` to the configured and prepared target ke=
rnel<br>
++build directory and pass the kernel architecture and compiler prefix:<br>
++<br>
++```sh<br>
++make KDIR=3D/path/to/target/kernel/build ARCH=3Darm64 \<br>
++=C2=A0 =C2=A0 =C2=A0 CROSS_COMPILE=3Daarch64-linux-gnu-<br>
++```<br>
++<br>
+ ## Build in Tree<br>
+ <br>
+ When the use of leancrypto as a kernel module is insufficient, e.g. when =
its<br>
+diff --git a/linux_kernel/lc_ascon_hash.awk b/linux_kernel/lc_ascon_hash.a=
wk<br>
+index e1fed4cf6..e3c048511 100644<br>
+--- a/linux_kernel/lc_ascon_hash.awk<br>
++++ b/linux_kernel/lc_ascon_hash.awk<br>
+@@ -1,9 +1,6 @@<br>
+-# Set the Ascon memory size<br>
+-BEGIN {<br>
+-=C2=A0 =C2=A0 =C2=A0 &quot;uname -m&quot; | getline host<br>
+-}<br>
++# Set the Ascon memory size for target_arch<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (host=3D=3D&quot;x86_64&quot;) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (target_arch=3D=3D&quot;x86_64&quot;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;mesondef=
ine LC_DEF_ASCON_AVX512&quot;, &quot;define LC_DEF_ASCON_AVX512&quot;, $0) =
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;mesondef=
ine LC_DEF_ASCON_AVX512&quot;, &quot;undef LC_DEF_ASCON_AVX512&quot;, $0) ;=
<br>
+diff --git a/linux_kernel/lc_hash.h.awk b/linux_kernel/lc_hash.h.awk<br>
+index d26e36304..0a83bade2 100644<br>
+--- a/linux_kernel/lc_hash.h.awk<br>
++++ b/linux_kernel/lc_hash.h.awk<br>
+@@ -1,9 +1,6 @@<br>
+-# Set the hash alignment value<br>
+-BEGIN {<br>
+-=C2=A0 =C2=A0 =C2=A0 &quot;uname -m&quot; | getline host<br>
+-}<br>
++# Set the hash alignment value for target_arch<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (host=3D=3D&quot;x86_64&quot;) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (target_arch=3D=3D&quot;x86_64&quot;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This value has to=
 be limited to 32 as otherwise the hash<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# algorithms fail t=
o register since their state is larger than<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# HASH_MAX_DESCSIZE=
 - this is an arbitrary defined value in<br>
+@@ -14,7 +11,7 @@ BEGIN {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# implementation as=
 it requires an alignment of the buffer to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# 512 bits.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;@hash_co=
mmon_alignment@&quot;, &quot;32&quot;, $0) ;<br>
+-=C2=A0 =C2=A0 =C2=A0 } else if (host=3D=3D&quot;arm&quot;) {<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (target_arch=3D=3D&quot;arm&quot;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;@hash_co=
mmon_alignment@&quot;, &quot;32&quot;, $0) ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;@hash_co=
mmon_alignment@&quot;, &quot;8&quot;, $0) ;<br>
+diff --git a/linux_kernel/lc_memory_support.awk b/linux_kernel/lc_memory_s=
upport.awk<br>
+index b3480a7e2..4b346a742 100644<br>
+--- a/linux_kernel/lc_memory_support.awk<br>
++++ b/linux_kernel/lc_memory_support.awk<br>
+@@ -1,17 +1,14 @@<br>
+-# Set the XOR alignment value<br>
+-BEGIN {<br>
+-=C2=A0 =C2=A0 =C2=A0 &quot;uname -m&quot; | getline host<br>
+-}<br>
++# Set the XOR alignment value for target_arch<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (host=3D=3D&quot;x86_64&quot;) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (target_arch=3D=3D&quot;x86_64&quot;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;mesondef=
ine LC_DEF_HOST_X86_64&quot;, &quot;define LC_DEF_HOST_X86_64&quot;, $0) ;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;mesondef=
ine LC_DEF_HOST_ARM32_NEON&quot;, &quot;undef LC_DEF_HOST_ARM32_NEON&quot;,=
 $0) ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;mesondef=
ine LC_DEF_HOST_AARCH64&quot;, &quot;undef LC_DEF_HOST_AARCH64&quot;, $0) ;=
<br>
+-=C2=A0 =C2=A0 =C2=A0 } else if (host=3D=3D&quot;arm&quot;) {<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (target_arch=3D=3D&quot;arm&quot;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;mesondef=
ine LC_DEF_HOST_X86_64&quot;, &quot;undef LC_DEF_HOST_X86_64&quot;, $0) ;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;mesondef=
ine LC_DEF_HOST_ARM32_NEON&quot;, &quot;define LC_DEF_HOST_ARM32_NEON&quot;=
, $0) ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;mesondef=
ine LC_DEF_HOST_AARCH64&quot;, &quot;undef LC_DEF_HOST_AARCH64&quot;, $0) ;=
<br>
+-=C2=A0 =C2=A0 =C2=A0 } else if (host=3D=3D&quot;aarch64&quot;) {<br>
++=C2=A0 =C2=A0 =C2=A0 } else if (target_arch=3D=3D&quot;aarch64&quot;) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;mesondef=
ine LC_DEF_HOST_X86_64&quot;, &quot;undef LC_DEF_HOST_X86_64&quot;, $0) ;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;mesondef=
ine LC_DEF_HOST_ARM32_NEON&quot;, &quot;undef LC_DEF_HOST_ARM32_NEON&quot;,=
 $0) ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;mesondef=
ine LC_DEF_HOST_AARCH64&quot;, &quot;define LC_DEF_HOST_AARCH64&quot;, $0) =
;<br>
diff --git a/meta-oe/recipes-crypto/leancrypto/<a href=3D"http://leancrypto=
-module_1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">leancrypto-module_1.=
9.1.bb</a> b/meta-oe/recipes-crypto/leancrypto/<a href=3D"http://leancrypto=
-module_1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">leancrypto-module_1.=
9.1.bb</a><br>
new file mode 100644<br>
index 0000000000..ea74347792<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-crypto/leancrypto/<a href=3D"http://leancrypto-module=
_1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">leancrypto-module_1.9.1.bb<=
/a><br>
@@ -0,0 +1,25 @@<br>
+SUMMARY =3D &quot;Leancrypto Linux kernel module&quot;<br>
+DESCRIPTION =3D &quot;Standalone Linux kernel module providing PQC-resista=
nt algorithms&quot;<br>
+<br>
+require leancrypto.inc<br>
+<br>
+SRC_URI +=3D &quot;file://0001-linux_kernel-use-target-architecture-for-ge=
nerated-headers.patch&quot;<br>
+<br>
+inherit module<br>
+<br>
+B =3D &quot;${S}/linux_kernel&quot;<br>
+<br>
+MAKE_TARGETS =3D &quot;modules&quot;<br>
+# Also apply when a custom Kbuild.config is supplied<br>
+EXTRA_OEMAKE +=3D &quot;KDIR=3D${STAGING_KERNEL_DIR} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_LEANC=
RYPTO=3Dm \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_LEANC=
RYPTO_TEST_MODULES=3Dn \<br>
+&quot;<br>
+<br>
+# Supply Kbuild.config to SRC_URI in a bbappend to select algorithms<br>
+# Otherwise retain upstream settings<br>
+do_configure() {<br>
+=C2=A0 =C2=A0 if [ -f ${UNPACKDIR}/Kbuild.config ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${UNPACKDIR}/Kbuild.config ${B=
}/Kbuild.config<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto.inc b/meta-oe/rec=
ipes-crypto/leancrypto/leancrypto.inc<br>
new file mode 100644<br>
index 0000000000..fdccdb5a77<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto.inc<br>
@@ -0,0 +1,10 @@<br>
+HOMEPAGE =3D &quot;<a href=3D"https://leancrypto.org" rel=3D"noreferrer" t=
arget=3D"_blank">https://leancrypto.org</a>&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause OR GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot; \<br>
+=C2=A0 =C2=A0 file://LICENSE;md5=3D581f53c96a634ae7f241516370a8f1ee \<br>
+=C2=A0 =C2=A0 file://LICENSE.bsd;md5=3D66a5cedaf62c4b2637025f049f9b826f \<=
br>
+=C2=A0 =C2=A0 file://LICENSE.gplv2;md5=3Deb723b61539feef013de476e68b5c50a =
\<br>
+&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/smuellerDD/leancrypto=
.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" =
target=3D"_blank">github.com/smuellerDD/leancrypto.git;branch=3Dmaster;prot=
ocol=3Dhttps;tag=3Dv${PV}</a>&quot;<br>
+SRCREV =3D &quot;65eb4e7e84e3a5499460a66b1623ccf6c59628b1&quot;<br>
diff --git a/meta-oe/recipes-crypto/leancrypto/<a href=3D"http://leancrypto=
_1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">leancrypto_1.9.1.bb</a> b/m=
eta-oe/recipes-crypto/leancrypto/<a href=3D"http://leancrypto_1.9.1.bb" rel=
=3D"noreferrer" target=3D"_blank">leancrypto_1.9.1.bb</a><br>
index 083b70fe8c..43d4b13655 100644<br>
--- a/meta-oe/recipes-crypto/leancrypto/<a href=3D"http://leancrypto_1.9.1.=
bb" rel=3D"noreferrer" target=3D"_blank">leancrypto_1.9.1.bb</a><br>
+++ b/meta-oe/recipes-crypto/leancrypto/<a href=3D"http://leancrypto_1.9.1.=
bb" rel=3D"noreferrer" target=3D"_blank">leancrypto_1.9.1.bb</a><br>
@@ -3,19 +3,13 @@ DESCRIPTION =3D &quot;leancrypto is a cryptographic libra=
ry that exclusively contains \<br>
=C2=A0PQC-resistant cryptographic algorithms. It is lean, has minimal depen=
dencies, \<br>
=C2=A0supports stack-only operation and provides optimized implementations =
for \<br>
=C2=A0ML-KEM (Kyber), ML-DSA (Dilithium), SLH-DSA (Sphincs+) and many more&=
quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://leancrypto.org" rel=3D"noreferrer" t=
arget=3D"_blank">https://leancrypto.org</a>&quot;<br>
-LICENSE =3D &quot;BSD-3-Clause OR GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot; \<br>
-=C2=A0 =C2=A0 file://LICENSE;md5=3D581f53c96a634ae7f241516370a8f1ee \<br>
-=C2=A0 =C2=A0 file://LICENSE.bsd;md5=3D66a5cedaf62c4b2637025f049f9b826f \<=
br>
-=C2=A0 =C2=A0 file://LICENSE.gplv2;md5=3Deb723b61539feef013de476e68b5c50a =
\<br>
-=C2=A0 =C2=A0 &quot;<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/smuellerDD/leancrypto=
.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" =
target=3D"_blank">github.com/smuellerDD/leancrypto.git;branch=3Dmaster;prot=
ocol=3Dhttps;tag=3Dv${PV}</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://leancrypto-tests.sh \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-secure_execution_linu=
x-drop-redundant-linux-prctl.h-.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRCREV =3D &quot;65eb4e7e84e3a5499460a66b1623ccf6c59628b1&quot;<br>
+<br>
+require leancrypto.inc<br>
+<br>
+SRC_URI +=3D &quot;file://leancrypto-tests.sh \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-secure_execution_lin=
ux-drop-redundant-linux-prctl.h-.patch \<br>
+&quot;<br>
<br>
=C2=A0inherit pkgconfig meson<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131742): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131742" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131742</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122054601/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122054601/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000003f0361065f4c413e--

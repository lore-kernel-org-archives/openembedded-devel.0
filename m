Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D02C282D2
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 23:33:10 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.9898.1741044781708238619
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Mar 2025 15:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i6YHYugf;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alistair23@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86b3bd4d0faso1809231241.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 15:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741044780; x=1741649580; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0F/vqfupekrAGWIeRMr30lp84TzdWUh4Kf/J2i7XoA=;
        b=i6YHYugfnFkF+ESZgqj7U9/PY7utAJrt+BIzSxEPac12ImlO3KZQvt+pGJ1Z49ssz4
         PC9AJAL0Ztlywk1+0XTdmRadOjW/rpA9c4LauF7/3eXqPGq6uw7Qy1o3w7xOP5sEGNZ2
         iiWIGk0GVpjh8+/ZcP8MfgrP28vUo1Q7cbXceIIVhPc/dEq9rJj+abcq79zQeZesZ+pY
         PZs2INIEcR7mz5NGHBrnwlKvaL41+ElhhrGEk+dh4MpNDlUg7rBH781XJbWGl1cWKEW0
         l7e5avKKKpM88yHj/6L15KOpJzCWfQ7SUfyPan1Cj98zm22cY/uFC9uTg8Dl/sE7JryN
         24HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741044780; x=1741649580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0F/vqfupekrAGWIeRMr30lp84TzdWUh4Kf/J2i7XoA=;
        b=H+LBSclVU1V6LvlVuj8mJ0kjzlQ7x4df7qqi5MlXEZzoHod/wxJ7a6LAD86d+Hqkum
         DbgDyMy7qXSUNF+98cZKUEueN/4AQpIzWXRvaB1gUwu3UJdmvH+mkwMIjwML78mTugd0
         RcWJ8+8pyTaw/3POi834oULwx9Gm51emYFbgd+ozR3Yw0ppUAUmobW1TH2z3vEmoO4Q6
         r2DEakuS0cX8JgYeC4fhdBVNcRmkAYzLkk+z9qZ3pQiHukXRFjbA07LH6ZhfMQRW/WEP
         mp8t1JumklS+OnDJr/X0WBuuev7hhJnrpl/rJ9m/Rb2FHWocK8iCNp505VsmJZO7Vl6S
         S+lQ==
X-Gm-Message-State: AOJu0Yww7x0EGjl+7wr8HILq491ASKOMZJWQu+K2QLhaAprrjbAbsgCf
	w3YERAoOGa3eFKSZzYfpkH/47Yrhgxdc7kgQBkSWLZgo9YSiP9TeTJliMA9dZ/FeKdv2wXVx4YH
	WGUIfUM52gKYdd2yhG/6Gjmx4BMI=
X-Gm-Gg: ASbGncunLwjYvdskfvToEl2GR9ekR/UUDPdfcZxr6au7HSnBQo/6Hf8Uc26lGaxWLTq
	00OdoNXiT/2ugyzqT0LH766arFv9MOnbsGkTAbmcw2PsH0i+FqYNNHB8Ay+LwtNInB72rYWg+jv
	C2Ldmpi5Ry632UDENVBh88cSy9yhUx0EXnePtVJ/nY2TVm1cIU+rrSq7MU
X-Google-Smtp-Source: AGHT+IHWutko0ZGY1EX/cgyg8ziaBRIDpHgfSpB8e2Y66LZ9WvqGi57IRW2+7MP79Cfhf1JkSGuApb6FXskflrPaCCg=
X-Received: by 2002:a05:6102:3ecc:b0:4bb:5d61:127e with SMTP id
 ada2fe7eead31-4c044d4ab20mr9378892137.25.1741044778495; Mon, 03 Mar 2025
 15:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20250303192705.2429629-1-martin.jansa@gmail.com>
In-Reply-To: <20250303192705.2429629-1-martin.jansa@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 4 Mar 2025 09:32:32 +1000
X-Gm-Features: AQ5f1JrNfU-YnIOsFvXP7Flzc8qt_kZbjJgaHzlFQBcPzAcpkRjhCYrK3BHua4k
Message-ID: <CAKmqyKPAQ+rprG0YfE+6k-JgOzwoH5J_mDaxvDr2Oz_gr1iHXA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] spdm-utils: use STAGING_DIR_HOST/STAGING_INCDIR
 variables
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 23:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115735

On Tue, Mar 4, 2025 at 5:27=E2=80=AFAM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> * there is no need to hardcode 'recipe-sysroot' path which is wrong in mu=
ltilib builds
>   where it will be 'lib32-recipe-sysroot' use standard variables
>   STAGING_DIR_HOST and STAGING_INCDIR
>
> * it is still failing in some builds (with or without multilib enabled) w=
ith:
>
> error: linking with `spdm-utils/0.7.2/wrapper/target-rust-ccld` failed: e=
xit status: 1
>   |
>   =3D note: LC_ALL=3D"C" PATH=3D"spdm-utils/0.7.2/recipe-sysroot-native/u=
sr/lib/rustlib/x86_64-unknown-linux-gnu/bin:spdm-utils/0.7.2/recipe-sysroot=
-native/usr/lib/rustlib/x86_64-unknown-linux-gnu/bin:spdm-utils/0.7.2/recip=
e-sysroot-native/usr/lib/rustlib/x86_64-unknown-linux-gnu/bin:TOPDIR/BUILD/=
sysroots-uninative/x86_64-linux/usr/bin:spdm-utils/0.7.2/recipe-sysroot-nat=
ive/usr/bin/python3-native:TOPDIR/oe-core/scripts:spdm-utils/0.7.2/recipe-s=
ysroot-native/usr/bin/aarch64-oe-linux:spdm-utils/0.7.2/recipe-sysroot/usr/=
bin/crossscripts:spdm-utils/0.7.2/recipe-sysroot-native/usr/sbin:spdm-utils=
/0.7.2/recipe-sysroot-native/usr/bin:spdm-utils/0.7.2/recipe-sysroot-native=
/sbin:spdm-utils/0.7.2/recipe-sysroot-native/bin:TOPDIR/bitbake/bin:TOPDIR/=
BUILD/hosttools" VSLANG=3D"1033" "spdm-utils/0.7.2/wrapper/target-rust-ccld=
" "/tmp/rustcwOPmo4/symbols.o" "spdm-utils/0.7.2/build/target/aarch64-oe-li=
nux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526d=
c-cgu.00.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/releas=
e/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.01.rcgu.=
o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/spdm_ut=
ils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.02.rcgu.o" "spdm-utils=
/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d19=
8f7a3b.spdm_utils.10963d2e3c9526dc-cgu.03.rcgu.o" "spdm-utils/0.7.2/build/t=
arget/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_ut=
ils.10963d2e3c9526dc-cgu.04.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-=
oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c=
9526dc-cgu.05.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/r=
elease/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.06.=
rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/sp=
dm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.07.rcgu.o" "spdm-=
utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde42=
d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.08.rcgu.o" "spdm-utils/0.7.2/bu=
ild/target/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.sp=
dm_utils.10963d2e3c9526dc-cgu.09.rcgu.o" "spdm-utils/0.7.2/build/target/aar=
ch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963=
d2e3c9526dc-cgu.10.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-=
gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cg=
u.11.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/de=
ps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.12.rcgu.o" "=
spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/spdm_utils-=
bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.13.rcgu.o" "spdm-utils/0.7=
.2/build/target/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a=
3b.spdm_utils.10963d2e3c9526dc-cgu.14.rcgu.o" "spdm-utils/0.7.2/build/targe=
t/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.=
10963d2e3c9526dc-cgu.15.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe-l=
inux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.a5lxpbrgiyije3w5cbqbylhb7=
.rcgu.o" "-Wl,--as-needed" "-Wl,-Bstatic" "spdm-utils/0.7.2/build/target/aa=
rch64-oe-linux-gnu/release/deps/libserialport-6eeca887df603c96.rlib" "spdm-=
utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libunescaper-cea=
3830d0f2d8e36.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/rel=
ease/deps/libnix-dac1a1693ab17db3.rlib" "spdm-utils/0.7.2/build/target/aarc=
h64-oe-linux-gnu/release/deps/libbitflags-d74b49e427459ea6.rlib" "spdm-util=
s/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/liblibudev-c60e422d3=
17a6d2a.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/d=
eps/liblibudev_sys-c703eeb5c735a38c.rlib" "spdm-utils/0.7.2/build/target/aa=
rch64-oe-linux-gnu/release/deps/liblibmctp-fead11c09f728867.rlib" "spdm-uti=
ls/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libsmbus_pec-3bd54e=
240597f305.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/releas=
e/deps/libembedded_crc_macros-a6fe57f0f48ef874.rlib" "spdm-utils/0.7.2/buil=
d/target/aarch64-oe-linux-gnu/release/deps/libbitfield-d004b2e82a12be5c.rli=
b" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libx509=
_parser-362699415348d972.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-li=
nux-gnu/release/deps/libdata_encoding-bb06fc446846a769.rlib" "spdm-utils/0.=
7.2/build/target/aarch64-oe-linux-gnu/release/deps/liboid_registry-02fd4724=
05fe8fe9.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/=
deps/libder_parser-d1f98822897a57b2.rlib" "spdm-utils/0.7.2/build/target/aa=
rch64-oe-linux-gnu/release/deps/libnum_bigint-688b27e66bf0b68f.rlib" "spdm-=
utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libnum_integer-7=
f827874f05600ee.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/r=
elease/deps/libasn1_rs-e74a43291d44175f.rlib" "spdm-utils/0.7.2/build/targe=
t/aarch64-oe-linux-gnu/release/deps/libtime-017b51bb919318e7.rlib" "spdm-ut=
ils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libitoa-8ab99d3828=
099a8e.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/de=
ps/libtime_core-a0a3e07ea9d65e2b.rlib" "spdm-utils/0.7.2/build/target/aarch=
64-oe-linux-gnu/release/deps/libnum_conv-06fec1ec684a87e1.rlib" "spdm-utils=
/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libderanged-ffd9c21dd=
9532c1a.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/d=
eps/libpowerfmt-c282310c9539410f.rlib" "spdm-utils/0.7.2/build/target/aarch=
64-oe-linux-gnu/release/deps/libasn1_rs-086351c4156f8c45.rlib" "spdm-utils/=
0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libthiserror-250ffbb3e=
b5075a0.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/d=
eps/librusticata_macros-b29e91a256e7f339.rlib" "spdm-utils/0.7.2/build/targ=
et/aarch64-oe-linux-gnu/release/deps/libnom-14d1f6f55899cc7f.rlib" "spdm-ut=
ils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libnum_traits-ff02=
1baaff61b6dd.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/rele=
ase/deps/libenv_logger-4d971d97d3d2728a.rlib" "spdm-utils/0.7.2/build/targe=
t/aarch64-oe-linux-gnu/release/deps/libtermcolor-5f5920ebd06dd4f0.rlib" "sp=
dm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libis_termina=
l-cf7edf7fdc93135c.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gn=
u/release/deps/libhumantime-0544f8a004168f5a.rlib" "spdm-utils/0.7.2/build/=
target/aarch64-oe-linux-gnu/release/deps/libregex-9e2dcd075c834f8f.rlib" "s=
pdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libregex_aut=
omata-5467380482e473a6.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linu=
x-gnu/release/deps/libaho_corasick-2fff436f7eb72e62.rlib" "spdm-utils/0.7.2=
/build/target/aarch64-oe-linux-gnu/release/deps/libregex_syntax-5235f377a0d=
736ba.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/dep=
s/libsha2-70c395dc600e20f3.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-=
linux-gnu/release/deps/libdigest-b291496809a77a8f.rlib" "spdm-utils/0.7.2/b=
uild/target/aarch64-oe-linux-gnu/release/deps/libblock_buffer-9693dc4f01c47=
a6a.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/=
libcrypto_common-a0e27511fe62f6c0.rlib" "spdm-utils/0.7.2/build/target/aarc=
h64-oe-linux-gnu/release/deps/libgeneric_array-038d5582acbd4525.rlib" "spdm=
-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libtypenum-e537=
90c6af30a73c.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/rele=
ase/deps/libnix-1bf3ed0ea4e2e7fd.rlib" "spdm-utils/0.7.2/build/target/aarch=
64-oe-linux-gnu/release/deps/liblibc-948e68f25c1ea920.rlib" "spdm-utils/0.7=
.2/build/target/aarch64-oe-linux-gnu/release/deps/liblibspdm-cd3bb7cf97ef1e=
de.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/l=
ibcolored-4b424f8b8a8a8f3a.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-=
linux-gnu/release/deps/liblazy_static-e4af7fc9cda932b7.rlib" "spdm-utils/0.=
7.2/build/target/aarch64-oe-linux-gnu/release/deps/libwhich-ed452b9a8575f9c=
2.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/li=
bhome-025b3253d2c9a761.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linu=
x-gnu/release/deps/libeither-a74c6c4f425b42e6.rlib" "spdm-utils/0.7.2/build=
/target/aarch64-oe-linux-gnu/release/deps/libminicbor-6dd2ce82a1c6ab80.rlib=
" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libhalf-=
60173e3c67bb51d7.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/=
release/deps/libfutures-a895171bccbbf729.rlib" "spdm-utils/0.7.2/build/targ=
et/aarch64-oe-linux-gnu/release/deps/libfutures_executor-08de71c30d20f215.r=
lib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libfu=
tures_util-80b02b35afdeac60.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe=
-linux-gnu/release/deps/libfutures_channel-130545631c2db438.rlib" "spdm-uti=
ls/0.7.2/build/target/aarch64-oe-linux-gnurelease/deps/libfutures_sink-7de2=
1ab1b2977f12.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/rele=
ase/deps/libfutures_task-8f358783b3a90d2e.rlib" "spdm-utils/0.7.2/build/tar=
get/aarch64-oe-linux-gnu/release/deps/libpin_utils-725b87fa7f052d76.rlib" "=
spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libclap-9f6=
03ab24f4e6ac8.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/rel=
ease/deps/libclap_builder-b02ec4f395c2d49a.rlib" "spdm-utils/0.7.2/build/ta=
rget/aarch64-oe-linux-gnu/release/deps/libstrsim-6c18ac20b99f1e62.rlib" "sp=
dm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libanstream-b=
e4ed5ec629d6cf6.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/r=
elease/deps/libanstyle_query-a6d9f9bb2f22fde2.rlib" "spdm-utils/0.7.2/build=
/target/aarch64-oe-linux-gnu/release/deps/libis_terminal_polyfill-cd48d6760=
5f06b34.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/d=
eps/libcolorchoice-1daf6f02b9c525b9.rlib" "spdm-utils/0.7.2/build/target/aa=
rch64-oe-linux-gnu/release/deps/libanstyle_parse-bc9ba3dd88b60c4d.rlib" "sp=
dm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libutf8parse-=
123ec8d013c1be9c.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/=
release/deps/libclap_lex-d099f14881092c47.rlib" "spdm-utils/0.7.2/build/tar=
get/aarch64-oe-linux-gnu/release/deps/libanstyle-134885157f6b20ae.rlib" "sp=
dm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libasync_std-=
276f6efc8eb7aa08.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/=
release/deps/libmemchr-4bada5f9ce95ee71.rlib" "spdm-utils/0.7.2/build/targe=
t/aarch64-oe-linux-gnu/release/deps/libasync_global_executor-3d81cc78f05bb9=
b7.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/l=
ibblocking-a150ec06774df238.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe=
-linux-gnu/release/deps/libpiper-122e031690ac2eee.rlib" "spdm-utils/0.7.2/b=
uild/target/aarch64-oe-linux-gnu/release/deps/libatomic_waker-d518cd5948259=
228.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/=
libasync_channel-43c9dc6a1c77de5b.rlib" "spdm-utils/0.7.2/build/target/aarc=
h64-oe-linux-gnu/release/deps/libasync_executor-6b9f64980735686f.rlib" "spd=
m-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libasync_task-=
d172452ce8e6e7c2.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/=
release/deps/libonce_cell-d237059d66b9fe37.rlib" "spdm-utils/0.7.2/build/ta=
rget/aarch64-oe-linux-gnu/release/deps/libasync_io-b7f857a36a0f6858.rlib" "=
spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libslab-f4b=
edd7227c6bf84.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/rel=
ease/deps/libpolling-2541f97ca1b9ab98.rlib" "spdm-utils/0.7.2/build/target/=
aarch64-oe-linux-gnu/release/deps/libtracing-27d8bd1a07ee47ac.rlib" "spdm-u=
tils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libtracing_core-1=
b1f84d2a95f3932.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/r=
elease/deps/libcfg_if-fdb0d11c6dd44f87.rlib" "spdm-utils/0.7.2/build/target=
/aarch64-oe-linux-gnu/release/deps/librustix-a2f9a72310cd063a.rlib" "spdm-u=
tils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libbitflags-9ca1a=
1f0de518834.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/relea=
se/deps/liblinux_raw_sys-99651370baf8c855.rlib" "spdm-utils/0.7.2/build/tar=
get/aarch64-oe-linux-gnu/release/deps/libfutures_lite-3bb954336e1d8cfb.rlib=
" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libfastr=
and-4612045bc9988b72.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-=
gnu/release/deps/libfutures_io-cf70903f61e9b6cf.rlib" "spdm-utils/0.7.2/bui=
ld/target/aarch64-oe-linux-gnu/release/deps/libasync_channel-3a4688c43a4bba=
b6.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/l=
ibevent_listener-34ab001d39450d29.rlib" "spdm-utils/0.7.2/build/target/aarc=
h64-oe-linux-gnu/release/deps/libconcurrent_queue-0f9cfddcdb7c1ab5.rlib" "s=
pdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libcrossbeam=
_utils-224ded61ddaf0891.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-lin=
ux-gnu/release/deps/libasync_lock-da4cb138055e51a7.rlib" "spdm-utils/0.7.2/=
build/target/aarch64-oe-linux-gnu/release/deps/libevent_listener_strategy-4=
3c86a853439156a.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/r=
elease/deps/libevent_listener-844e677a0da51119.rlib" "spdm-utils/0.7.2/buil=
d/target/aarch64-oe-linux-gnu/release/deps/libparking-3dffb30da11a1f47.rlib=
" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libpin_p=
roject_lite-5503e04d7a85db18.rlib" "spdm-utils/0.7.2/build/target/aarch64-o=
e-linux-gnu/release/deps/libfutures_core-7153e7ad780e0572.rlib" "spdm-utils=
/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libkv_log_macro-91253=
cf35f2bf00b.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/relea=
se/deps/liblog-ca2be10f58adc31a.rlib" "spdm-utils/0.7.2/build/target/aarch6=
4-oe-linux-gnu/release/deps/libvalue_bag-e7a2a4594b6dbc84.rlib" "spdm-utils=
/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libstd.rlib"=
 "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/=
libpanic_unwind-2af724e74f58518c.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr=
/lib/rustlib/aarch64-oe-linux-gnu/lib/libobject-a0d3363d4c06b170.rlib" "spd=
m-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libme=
mchr-d448e3cd48ffb56d.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustli=
b/aarch64-oe-linux-gnu/lib/libaddr2line-be185de14bda170a.rlib" "spdm-utils/=
0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libgimli-4f87=
816ac4c3936c.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64=
-oe-linux-gnu/lib/librustc_demangle-fb519111ad364b3c.rlib" "spdm-utils/0.7.=
2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libstd_detect-4a7=
89f348ecae68d.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch6=
4-oe-linux-gnu/lib/libhashbrown-53fc84a5893e74d4.rlib" "spdm-utils/0.7.2/re=
cipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/librustc_std_workspac=
e_alloc-863b1a9dcca1e102.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rus=
tlib/aarch64-oe-linux-gnu/lib/libminiz_oxide-99398dbf0d70cd1a.rlib" "spdm-u=
tils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libadler=
-819f47a85e2a506f.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aa=
rch64-oe-linux-gnu/lib/libunwind-8a40409cdcc36a8f.rlib" "spdm-utils/0.7.2/r=
ecipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libcfg_if-dd2ea6c27f=
046e56.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-li=
nux-gnu/lib/liblibc-a298ccd8ac6da714.rlib" "spdm-utils/0.7.2/recipe-sysroot=
/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/liballoc-056aaf2e033bde1c.rlib" "=
spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/li=
brustc_std_workspace_core-285c3174480c42d6.rlib" "spdm-utils/0.7.2/recipe-s=
ysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libcore-df89ffd20f73d501.rl=
ib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/l=
ib/libcompiler_builtins-f7db086d3d9fb6b3.rlib" "-Wl,-Bdynamic" "-ludev" "-l=
gcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr" =
"-Wl,-z,noexecstack" "-L" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/=
aarch64-oe-linux-gnu/lib" "-L" "spdm-utils/0.7.2/recipe-sysroot/usr/lib" "-=
L" "spdm-utils/0.7.2/recipe-sysroot-native/usr/lib/rustlib/aarch64-oe-linux=
-gnu/lib" "-o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/=
deps/spdm_utils-bde42d4d198f7a3b" "-Wl,--gc-sections" "-pie" "-Wl,-O1" "-Wl=
,--strip-debug" "-nodefaultlibs" "-Wl,--start-group" "-lpci" "-lmemlib" "-l=
malloclib" "-ldebuglib" "-lplatform_lib" "-lssl" "-lcrypto" "-lcryptlib_ope=
nssl" "-lrnglib" "-lspdm_common_lib" "-lspdm_requester_lib" "-lspdm_respond=
er_lib" "-lspdm_secured_message_lib" "-lspdm_secured_message_lib" "-lspdm_c=
rypt_lib" "-lspdm_crypt_ext_lib" "-lspdm_transport_pcidoe_lib" "-lspdm_tran=
sport_mctp_lib" "-Wl,--end-group"
>   =3D note: spdm-utils/0.7.2/recipe-sysroot-native/usr/bin/aarch64-oe-lin=
ux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/14.2.0/ld: spdm-util=
s/0.7.2/recipe-sysroot/usr/lib/libmemlib.a(zero_mem.c.o): undefined referen=
ce to symbol '__stack_chk_guard@@GLIBC_2.17'
>           spdm-utils/0.7.2/recipe-sysroot-native/usr/bin/aarch64-oe-linux=
/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/14.2.0/ld: spdm-utils/=
0.7.2/recipe-sysroot/usr/lib/ld-linux-aarch64.so.1: error adding symbols: D=
SO missing from command line
>           collect2: error: ld returned 1 exit status
>
>   =3D note: some `extern` functions couldn't be found; some native librar=
ies may need to be installed or have their path specified
>   =3D note: use the `-l` flag to specify native libraries to link
>   =3D note: use the `cargo:rustc-link-lib` directive to specify the nativ=
e libraries to link with Cargo (see https://doc.rust-lang.org/cargo/referen=
ce/build-scripts.html#rustc-link-lib)
>
> error: could not compile `SPDM-Utils` (bin "spdm_utils") due to 1 previou=
s error
>
> Caused by:
>   process didn't exit successfully: `rustc --crate-name spdm_utils --edit=
ion=3D2021 src/main.rs --error-format=3Djson --json=3Ddiagnostic-rendered-a=
nsi,artifacts,future-incompat --crate-type bin --emit=3Ddep-info,link -C op=
t-level=3D3 -C embed-bitcode=3Dno --cfg 'feature=3D"asn1-rs"' --cfg 'featur=
e=3D"async-std"' --cfg 'feature=3D"clap"' --cfg 'feature=3D"colored"' --cfg=
 'feature=3D"default"' --cfg 'feature=3D"env_logger"' --cfg 'feature=3D"fut=
ures"' --cfg 'feature=3D"lazy_static"' --cfg 'feature=3D"memmap2"' --cfg 'f=
eature=3D"minicbor"' --cfg 'feature=3D"minicbor-derive"' --cfg 'feature=3D"=
nix"' --cfg 'feature=3D"once_cell"' --cfg 'feature=3D"serialport"' --cfg 'f=
eature=3D"sha2"' --cfg 'feature=3D"std"' --cfg 'feature=3D"which"' --cfg 'f=
eature=3D"x509-parser"' --check-cfg 'cfg(docsrs)' --check-cfg 'cfg(feature,=
 values("asn1-rs", "async-std", "clap", "colored", "default", "env_logger",=
 "futures", "lazy_static", "libspdm_tests", "memmap2", "minicbor", "minicbo=
r-derive", "nix", "no_std", "once_cell", "serialport", "sha2", "std", "whic=
h", "x509-parser"))' -C metadata=3Dbde42d4d198f7a3b -C extra-filename=3D-bd=
e42d4d198f7a3b --out-dir spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu=
/release/deps --target aarch64-oe-linux-gnu -C linker=3Dspdm-utils/0.7.2/wr=
apper/target-rust-ccld -C strip=3Ddebuginfo -L dependency=3Dspdm-utils/0.7.=
2/build/target/aarch64-oe-linux-gnu/release/deps -L dependency=3Dspdm-utils=
/0.7.2/build/target/release/deps --extern libspdm=3Dspdm-utils/0.7.2/build/=
target/aarch64-oe-linux-gnu/release/deps/liblibspdm-cd3bb7cf97ef1ede.rlib -=
-extern asn1_rs=3Dspdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/releas=
e/deps/libasn1_rs-086351c4156f8c45.rlib --extern async_std=3Dspdm-utils/0.7=
.2/build/target/aarch64-oe-linux-gnu/release/deps/libasync_std-276f6efc8eb7=
aa08.rlib --extern clap=3Dspdm-utils/0.7.2/build/target/aarch64-oe-linux-gn=
u/release/deps/libclap-9f603ab24f4e6ac8.rlib --extern colored=3Dspdm-utils/=
0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libcolored-4b424f8b8a8=
a8f3a.rlib --extern env_logger=3Dspdm-utils/0.7.2/build/target/aarch64-oe-l=
inux-gnu/release/deps/libenv_logger-4d971d97d3d2728a.rlib --extern futures=
=3Dspdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libfutur=
es-a895171bccbbf729.rlib --extern lazy_static=3Dspdm-utils/0.7.2/build/targ=
et/aarch64-oe-linux-gnu/release/deps/liblazy_static-e4af7fc9cda932b7.rlib -=
-extern libmctp=3Dspdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/releas=
e/deps/liblibmctp-fead11c09f728867.rlib --extern log=3Dspdm-utils/0.7.2/bui=
ld/target/aarch64-oe-linux-gnu/release/deps/liblog-ca2be10f58adc31a.rlib --=
extern memmap2=3Dspdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release=
/deps/libmemmap2-1e722f3ca1cb9a40.rlib --extern minicbor=3Dspdm-utils/0.7.2=
/build/target/aarch64-oe-linux-gnu/release/deps/libminicbor-6dd2ce82a1c6ab8=
0.rlib --extern minicbor_derive=3Dspdm-utils/0.7.2/build/target/release/dep=
s/libminicbor_derive-1ac8504d13b7a0c4.so --extern nix=3Dspdm-utils/0.7.2/bu=
ild/target/aarch64-oe-linux-gnu/release/deps/libnix-1bf3ed0ea4e2e7fd.rlib -=
-extern once_cell=3Dspdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/rele=
ase/deps/libonce_cell-d237059d66b9fe37.rlib --extern serialport=3Dspdm-util=
s/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libserialport-6eeca8=
87df603c96.rlib --extern sha2=3Dspdm-utils/0.7.2/build/target/aarch64-oe-li=
nux-gnu/release/deps/libsha2-70c395dc600e20f3.rlib --extern which=3Dspdm-ut=
ils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libwhich-ed452b9a8=
575f9c2.rlib --extern x509_parser=3Dspdm-utils/0.7.2/build/target/aarch64-o=
e-linux-gnu/release/deps/libx509_parser-362699415348d972.rlib -L spdm-utils=
/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib --remap-path=
-prefix=3Dspdm-utils/0.7.2=3D/usr/src/debug/spdm-utils/0.7.2 -C link-arg=3D=
-Wl,--start-group -C link-arg=3D-lpci -C link-arg=3D-lmemlib -C link-arg=3D=
-lmalloclib -C link-arg=3D-ldebuglib -C link-arg=3D-lplatform_lib -C link-a=
rg=3D-lssl -C link-arg=3D-lcrypto -C link-arg=3D-lcryptlib_openssl -C link-=
arg=3D-lrnglib -C link-arg=3D-lspdm_common_lib -C link-arg=3D-lspdm_request=
er_lib -C link-arg=3D-lspdm_responder_lib -C link-arg=3D-lspdm_secured_mess=
age_lib -C link-arg=3D-lspdm_secured_message_lib -C link-arg=3D-lspdm_crypt=
_lib -C link-arg=3D-lspdm_crypt_ext_lib -C link-arg=3D-lspdm_transport_pcid=
oe_lib -C link-arg=3D-lspdm_transport_mctp_lib -C link-arg=3D-Wl,--end-grou=
p -L native=3Dspdm-utils/0.7.2/recipe-sysroot/usr/lib` (exit status: 1)
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  .../clang-layer/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-uti=
ls/spdm-utils_0.7.2.bb b/meta-oe/dynamic-layers/clang-layer/recipes-devtool=
s/spdm-utils/spdm-utils_0.7.2.bb
> index 800f9629c1..64cd1d928a 100644
> --- a/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm=
-utils_0.7.2.bb
> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm=
-utils_0.7.2.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "\
>  inherit cargo cargo-update-recipe-crates pkgconfig
>
>  export BINDGEN_EXTRA_CLANG_ARGS
> -BINDGEN_EXTRA_CLANG_ARGS =3D "--sysroot=3D${WORKDIR}/recipe-sysroot -I${=
WORKDIR}/recipe-sysroot/usr/include"
> +BINDGEN_EXTRA_CLANG_ARGS =3D "--sysroot=3D${STAGING_DIR_HOST} -I${STAGIN=
G_INCDIR}"
>
>  SRC_URI +=3D "git://github.com/westerndigitalcorporation/spdm-utils.git;=
protocol=3Dhttps;branch=3Dmaster"
>
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115730): https://lists.openembedded.org/g/openembedde=
d-devel/message/115730
> Mute This Topic: https://lists.openembedded.org/mt/111495409/3619028
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
listair23@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16DAC282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 21:20:39 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.6818.1741036838357096860
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Mar 2025 13:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DIKhQMnt;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bb64a4060so13226761fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 13:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741036836; x=1741641636; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lKtsQZoYR/RABH7Rzj8ARPqf8d561VuvZqPMopQTRs=;
        b=DIKhQMntDQ79hH9zAZItHD94RmguOSqZOn1E8GzuGoJDi3WjJdLzoWQI789xta6+ft
         lyz2pqX/yoQ/xeAcFBljSsyKiCRlgW8pvF7x0Znu3Tj2d09Boxb8gdLW84bptGdznab8
         4uD7w16VQPuUwRG5vsTGn+GsNW4fUATWW0TXz2HrObAD6WNzJVdf6/esEIjyx1mMoAWX
         H7Qf9J7qCzMSutye2aG0kGZVKfqUMnHE1RrsOWsK2RrElHBQ9BvZ6LQkLulZSIooqEeO
         ZolH4Dmb1hPiFSwiuXcm7OJd8obsz2ICb4siWn7y8nOZYpSEvJOZiTXweQRtVvjVJZ+X
         npCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741036836; x=1741641636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lKtsQZoYR/RABH7Rzj8ARPqf8d561VuvZqPMopQTRs=;
        b=vY33jDEfWp/COhZbfNLJBNQwsOfc1YxXn8Yd+CMGjq60lxdnsFL+IaIBD5XN4YJdU3
         hDXBCtyx5JkE9Qk8DHmTGIPr++8ZvPx8HkNUigdkCXcgXLZkDb/YQBBXgKbqmH9/QlpB
         9CvaGs5UWbEy+olMrPs3eSkwJEJFbzCUkLU4TPk9RaRp+aGv1kB9Q6dvkuq1zwFaaMNO
         HuAgrgkuY1NkvuZhay0/R7rDVy5ZaHg1+aYKlSt9faTnbLchDRiUSofYVpGnppAjvKXP
         m/E2by4VG4QsNUdBSwJ/TVXEX1XMD28BkCrYV7ZZO6nmFxtU0zVKOomlmlTm5MADLjVn
         aXSw==
X-Gm-Message-State: AOJu0YzDZMQcB/pvqy7+OjRdPcI0k9vxrc7YsMZmJtZhwsGYcZh/MERy
	kCX8zBP2iPbyQ93AGZHJxw53dMskVlib+0diWprnjPuegJO8iD/CUr/h8YO93XBk/1FXwAttRjq
	7VMpjgewtA0rqMLfF/OFPiPcA7iQ=
X-Gm-Gg: ASbGnctLKdm6MzMmEB+tQlTZLoaWj+slCND1cx7XIaVWzZghGNkAaUTp27y2r+M0SKF
	2OqyZOAfr0hSN/v6gQ9KIIBbZzTaMOT64OiE+vnzWC7nG+QlJZPOMxEyGjq0+Su7RfXV1ZX0z5t
	9j7MkbzV+v32XCYhPg90fmE8Od2cYB
X-Google-Smtp-Source: AGHT+IHoLysqOIdagrvdOzsoL20vfKWqN4stNo4PMMwzS3fC0J6SXnLFHDM2WHDd8Aypy4OY/ecQWt+6pgtR4/4bOK4=
X-Received: by 2002:a05:651c:a0b:b0:30b:8f64:6261 with SMTP id
 38308e7fff4ca-30b93229e0emr53707551fa.21.1741036836021; Mon, 03 Mar 2025
 13:20:36 -0800 (PST)
MIME-Version: 1.0
References: <18296197342B2F6E.4820@lists.openembedded.org> <1829624241DDB01B.22197@lists.openembedded.org>
In-Reply-To: <1829624241DDB01B.22197@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 3 Mar 2025 22:20:22 +0100
X-Gm-Features: AQ5f1JrOzpNfF7bpdz313EyQjRzWW_chWFSo-mfRjLt7g6Iw5-5RZy0X9tU1UMM
Message-ID: <CA+chaQdX1LZV0eXTmbWN79Bg7CK1SpmDA6yqyacS8jMYUFd-FA@mail.gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 21:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115734

On Mon, Mar 3, 2025 at 8:39=E2=80=AFPM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Mon, Mar 3, 2025 at 8:27=E2=80=AFPM Martin Jansa via lists.openembedde=
d.org
> <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > * there is no need to hardcode 'recipe-sysroot' path which is wrong in =
multilib builds
> >   where it will be 'lib32-recipe-sysroot' use standard variables
> >   STAGING_DIR_HOST and STAGING_INCDIR
> >
> > * it is still failing in some builds (with or without multilib enabled)=
 with:
> >
> > error: linking with `spdm-utils/0.7.2/wrapper/target-rust-ccld` failed:=
 exit status: 1
> >   |
> >   =3D note: LC_ALL=3D"C" PATH=3D"spdm-utils/0.7.2/recipe-sysroot-native=
/usr/lib/rustlib/x86_64-unknown-linux-gnu/bin:spdm-utils/0.7.2/recipe-sysro=
ot-native/usr/lib/rustlib/x86_64-unknown-linux-gnu/bin:spdm-utils/0.7.2/rec=
ipe-sysroot-native/usr/lib/rustlib/x86_64-unknown-linux-gnu/bin:TOPDIR/BUIL=
D/sysroots-uninative/x86_64-linux/usr/bin:spdm-utils/0.7.2/recipe-sysroot-n=
ative/usr/bin/python3-native:TOPDIR/oe-core/scripts:spdm-utils/0.7.2/recipe=
-sysroot-native/usr/bin/aarch64-oe-linux:spdm-utils/0.7.2/recipe-sysroot/us=
r/bin/crossscripts:spdm-utils/0.7.2/recipe-sysroot-native/usr/sbin:spdm-uti=
ls/0.7.2/recipe-sysroot-native/usr/bin:spdm-utils/0.7.2/recipe-sysroot-nati=
ve/sbin:spdm-utils/0.7.2/recipe-sysroot-native/bin:TOPDIR/bitbake/bin:TOPDI=
R/BUILD/hosttools" VSLANG=3D"1033" "spdm-utils/0.7.2/wrapper/target-rust-cc=
ld" "/tmp/rustcwOPmo4/symbols.o" "spdm-utils/0.7.2/build/target/aarch64-oe-=
linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c952=
6dc-cgu.00.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/rele=
ase/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.01.rcg=
u.o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/spdm_=
utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.02.rcgu.o" "spdm-uti=
ls/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d=
198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.03.rcgu.o" "spdm-utils/0.7.2/build=
/target/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_=
utils.10963d2e3c9526dc-cgu.04.rcgu.o" "spdm-utils/0.7.2/build/target/aarch6=
4-oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e=
3c9526dc-cgu.05.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu=
/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.0=
6.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/=
spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.07.rcgu.o" "spd=
m-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde=
42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.08.rcgu.o" "spdm-utils/0.7.2/=
build/target/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.=
spdm_utils.10963d2e3c9526dc-cgu.09.rcgu.o" "spdm-utils/0.7.2/build/target/a=
arch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.109=
63d2e3c9526dc-cgu.10.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe-linu=
x-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-=
cgu.11.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/=
deps/spdm_utils-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.12.rcgu.o"=
 "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/spdm_util=
s-bde42d4d198f7a3b.spdm_utils.10963d2e3c9526dc-cgu.13.rcgu.o" "spdm-utils/0=
.7.2/build/target/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f=
7a3b.spdm_utils.10963d2e3c9526dc-cgu.14.rcgu.o" "spdm-utils/0.7.2/build/tar=
get/aarch64-oe-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.spdm_util=
s.10963d2e3c9526dc-cgu.15.rcgu.o" "spdm-utils/0.7.2/build/target/aarch64-oe=
-linux-gnu/release/deps/spdm_utils-bde42d4d198f7a3b.a5lxpbrgiyije3w5cbqbylh=
b7.rcgu.o" "-Wl,--as-needed" "-Wl,-Bstatic" "spdm-utils/0.7.2/build/target/=
aarch64-oe-linux-gnu/release/deps/libserialport-6eeca887df603c96.rlib" "spd=
m-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libunescaper-c=
ea3830d0f2d8e36.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/r=
elease/deps/libnix-dac1a1693ab17db3.rlib" "spdm-utils/0.7.2/build/target/aa=
rch64-oe-linux-gnu/release/deps/libbitflags-d74b49e427459ea6.rlib" "spdm-ut=
ils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/liblibudev-c60e422=
d317a6d2a.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release=
/deps/liblibudev_sys-c703eeb5c735a38c.rlib" "spdm-utils/0.7.2/build/target/=
aarch64-oe-linux-gnu/release/deps/liblibmctp-fead11c09f728867.rlib" "spdm-u=
tils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libsmbus_pec-3bd5=
4e240597f305.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/rele=
ase/deps/libembedded_crc_macros-a6fe57f0f48ef874.rlib" "spdm-utils/0.7.2/bu=
ild/target/aarch64-oe-linux-gnu/release/deps/libbitfield-d004b2e82a12be5c.r=
lib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libx5=
09_parser-362699415348d972.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-=
linux-gnu/release/deps/libdata_encoding-bb06fc446846a769.rlib" "spdm-utils/=
0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/liboid_registry-02fd47=
2405fe8fe9.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/releas=
e/deps/libder_parser-d1f98822897a57b2.rlib" "spdm-utils/0.7.2/build/target/=
aarch64-oe-linux-gnu/release/deps/libnum_bigint-688b27e66bf0b68f.rlib" "spd=
m-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libnum_integer=
-7f827874f05600ee.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu=
/release/deps/libasn1_rs-e74a43291d44175f.rlib" "spdm-utils/0.7.2/build/tar=
get/aarch64-oe-linux-gnu/release/deps/libtime-017b51bb919318e7.rlib" "spdm-=
utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libitoa-8ab99d38=
28099a8e.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/=
deps/libtime_core-a0a3e07ea9d65e2b.rlib" "spdm-utils/0.7.2/build/target/aar=
ch64-oe-linux-gnu/release/deps/libnum_conv-06fec1ec684a87e1.rlib" "spdm-uti=
ls/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libderanged-ffd9c21=
dd9532c1a.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release=
/deps/libpowerfmt-c282310c9539410f.rlib" "spdm-utils/0.7.2/build/target/aar=
ch64-oe-linux-gnu/release/deps/libasn1_rs-086351c4156f8c45.rlib" "spdm-util=
s/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libthiserror-250ffbb=
3eb5075a0.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release=
/deps/librusticata_macros-b29e91a256e7f339.rlib" "spdm-utils/0.7.2/build/ta=
rget/aarch64-oe-linux-gnu/release/deps/libnom-14d1f6f55899cc7f.rlib" "spdm-=
utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libnum_traits-ff=
021baaff61b6dd.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/re=
lease/deps/libenv_logger-4d971d97d3d2728a.rlib" "spdm-utils/0.7.2/build/tar=
get/aarch64-oe-linux-gnu/release/deps/libtermcolor-5f5920ebd06dd4f0.rlib" "=
spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libis_termi=
nal-cf7edf7fdc93135c.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-=
gnu/release/deps/libhumantime-0544f8a004168f5a.rlib" "spdm-utils/0.7.2/buil=
d/target/aarch64-oe-linux-gnu/release/deps/libregex-9e2dcd075c834f8f.rlib" =
"spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libregex_a=
utomata-5467380482e473a6.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-li=
nux-gnu/release/deps/libaho_corasick-2fff436f7eb72e62.rlib" "spdm-utils/0.7=
.2/build/target/aarch64-oe-linux-gnu/release/deps/libregex_syntax-5235f377a=
0d736ba.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/d=
eps/libsha2-70c395dc600e20f3.rlib" "spdm-utils/0.7.2/build/target/aarch64-o=
e-linux-gnu/release/deps/libdigest-b291496809a77a8f.rlib" "spdm-utils/0.7.2=
/build/target/aarch64-oe-linux-gnu/release/deps/libblock_buffer-9693dc4f01c=
47a6a.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/dep=
s/libcrypto_common-a0e27511fe62f6c0.rlib" "spdm-utils/0.7.2/build/target/aa=
rch64-oe-linux-gnu/release/deps/libgeneric_array-038d5582acbd4525.rlib" "sp=
dm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libtypenum-e5=
3790c6af30a73c.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/re=
lease/deps/libnix-1bf3ed0ea4e2e7fd.rlib" "spdm-utils/0.7.2/build/target/aar=
ch64-oe-linux-gnu/release/deps/liblibc-948e68f25c1ea920.rlib" "spdm-utils/0=
.7.2/build/target/aarch64-oe-linux-gnu/release/deps/liblibspdm-cd3bb7cf97ef=
1ede.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps=
/libcolored-4b424f8b8a8a8f3a.rlib" "spdm-utils/0.7.2/build/target/aarch64-o=
e-linux-gnu/release/deps/liblazy_static-e4af7fc9cda932b7.rlib" "spdm-utils/=
0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libwhich-ed452b9a8575f=
9c2.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/=
libhome-025b3253d2c9a761.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-li=
nux-gnu/release/deps/libeither-a74c6c4f425b42e6.rlib" "spdm-utils/0.7.2/bui=
ld/target/aarch64-oe-linux-gnu/release/deps/libminicbor-6dd2ce82a1c6ab80.rl=
ib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libhal=
f-60173e3c67bb51d7.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gn=
u/release/deps/libfutures-a895171bccbbf729.rlib" "spdm-utils/0.7.2/build/ta=
rget/aarch64-oe-linux-gnu/release/deps/libfutures_executor-08de71c30d20f215=
.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/lib=
futures_util-80b02b35afdeac60.rlib" "spdm-utils/0.7.2/build/target/aarch64-=
oe-linux-gnu/release/deps/libfutures_channel-130545631c2db438.rlib" "spdm-u=
tils/0.7.2/build/target/aarch64-oe-linux-gnurelease/deps/libfutures_sink-7d=
e21ab1b2977f12.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/re=
lease/deps/libfutures_task-8f358783b3a90d2e.rlib" "spdm-utils/0.7.2/build/t=
arget/aarch64-oe-linux-gnu/release/deps/libpin_utils-725b87fa7f052d76.rlib"=
 "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libclap-9=
f603ab24f4e6ac8.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/r=
elease/deps/libclap_builder-b02ec4f395c2d49a.rlib" "spdm-utils/0.7.2/build/=
target/aarch64-oe-linux-gnu/release/deps/libstrsim-6c18ac20b99f1e62.rlib" "=
spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libanstream=
-be4ed5ec629d6cf6.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu=
/release/deps/libanstyle_query-a6d9f9bb2f22fde2.rlib" "spdm-utils/0.7.2/bui=
ld/target/aarch64-oe-linux-gnu/release/deps/libis_terminal_polyfill-cd48d67=
605f06b34.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release=
/deps/libcolorchoice-1daf6f02b9c525b9.rlib" "spdm-utils/0.7.2/build/target/=
aarch64-oe-linux-gnu/release/deps/libanstyle_parse-bc9ba3dd88b60c4d.rlib" "=
spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libutf8pars=
e-123ec8d013c1be9c.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gn=
u/release/deps/libclap_lex-d099f14881092c47.rlib" "spdm-utils/0.7.2/build/t=
arget/aarch64-oe-linux-gnu/release/deps/libanstyle-134885157f6b20ae.rlib" "=
spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libasync_st=
d-276f6efc8eb7aa08.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gn=
u/release/deps/libmemchr-4bada5f9ce95ee71.rlib" "spdm-utils/0.7.2/build/tar=
get/aarch64-oe-linux-gnu/release/deps/libasync_global_executor-3d81cc78f05b=
b9b7.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps=
/libblocking-a150ec06774df238.rlib" "spdm-utils/0.7.2/build/target/aarch64-=
oe-linux-gnu/release/deps/libpiper-122e031690ac2eee.rlib" "spdm-utils/0.7.2=
/build/target/aarch64-oe-linux-gnu/release/deps/libatomic_waker-d518cd59482=
59228.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/dep=
s/libasync_channel-43c9dc6a1c77de5b.rlib" "spdm-utils/0.7.2/build/target/aa=
rch64-oe-linux-gnu/release/deps/libasync_executor-6b9f64980735686f.rlib" "s=
pdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libasync_tas=
k-d172452ce8e6e7c2.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gn=
u/release/deps/libonce_cell-d237059d66b9fe37.rlib" "spdm-utils/0.7.2/build/=
target/aarch64-oe-linux-gnu/release/deps/libasync_io-b7f857a36a0f6858.rlib"=
 "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libslab-f=
4bedd7227c6bf84.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/r=
elease/deps/libpolling-2541f97ca1b9ab98.rlib" "spdm-utils/0.7.2/build/targe=
t/aarch64-oe-linux-gnu/release/deps/libtracing-27d8bd1a07ee47ac.rlib" "spdm=
-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libtracing_core=
-1b1f84d2a95f3932.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu=
/release/deps/libcfg_if-fdb0d11c6dd44f87.rlib" "spdm-utils/0.7.2/build/targ=
et/aarch64-oe-linux-gnu/release/deps/librustix-a2f9a72310cd063a.rlib" "spdm=
-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libbitflags-9ca=
1a1f0de518834.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/rel=
ease/deps/liblinux_raw_sys-99651370baf8c855.rlib" "spdm-utils/0.7.2/build/t=
arget/aarch64-oe-linux-gnu/release/deps/libfutures_lite-3bb954336e1d8cfb.rl=
ib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libfas=
trand-4612045bc9988b72.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linu=
x-gnu/release/deps/libfutures_io-cf70903f61e9b6cf.rlib" "spdm-utils/0.7.2/b=
uild/target/aarch64-oe-linux-gnu/release/deps/libasync_channel-3a4688c43a4b=
bab6.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps=
/libevent_listener-34ab001d39450d29.rlib" "spdm-utils/0.7.2/build/target/aa=
rch64-oe-linux-gnu/release/deps/libconcurrent_queue-0f9cfddcdb7c1ab5.rlib" =
"spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libcrossbe=
am_utils-224ded61ddaf0891.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-l=
inux-gnu/release/deps/libasync_lock-da4cb138055e51a7.rlib" "spdm-utils/0.7.=
2/build/target/aarch64-oe-linux-gnu/release/deps/libevent_listener_strategy=
-43c86a853439156a.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu=
/release/deps/libevent_listener-844e677a0da51119.rlib" "spdm-utils/0.7.2/bu=
ild/target/aarch64-oe-linux-gnu/release/deps/libparking-3dffb30da11a1f47.rl=
ib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libpin=
_project_lite-5503e04d7a85db18.rlib" "spdm-utils/0.7.2/build/target/aarch64=
-oe-linux-gnu/release/deps/libfutures_core-7153e7ad780e0572.rlib" "spdm-uti=
ls/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libkv_log_macro-912=
53cf35f2bf00b.rlib" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/rel=
ease/deps/liblog-ca2be10f58adc31a.rlib" "spdm-utils/0.7.2/build/target/aarc=
h64-oe-linux-gnu/release/deps/libvalue_bag-e7a2a4594b6dbc84.rlib" "spdm-uti=
ls/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libstd.rli=
b" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/li=
b/libpanic_unwind-2af724e74f58518c.rlib" "spdm-utils/0.7.2/recipe-sysroot/u=
sr/lib/rustlib/aarch64-oe-linux-gnu/lib/libobject-a0d3363d4c06b170.rlib" "s=
pdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/lib=
memchr-d448e3cd48ffb56d.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rust=
lib/aarch64-oe-linux-gnu/lib/libaddr2line-be185de14bda170a.rlib" "spdm-util=
s/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libgimli-4f=
87816ac4c3936c.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch=
64-oe-linux-gnu/lib/librustc_demangle-fb519111ad364b3c.rlib" "spdm-utils/0.=
7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libstd_detect-4=
a789f348ecae68d.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarc=
h64-oe-linux-gnu/lib/libhashbrown-53fc84a5893e74d4.rlib" "spdm-utils/0.7.2/=
recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/librustc_std_worksp=
ace_alloc-863b1a9dcca1e102.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/r=
ustlib/aarch64-oe-linux-gnu/lib/libminiz_oxide-99398dbf0d70cd1a.rlib" "spdm=
-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libadl=
er-819f47a85e2a506f.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/=
aarch64-oe-linux-gnu/lib/libunwind-8a40409cdcc36a8f.rlib" "spdm-utils/0.7.2=
/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libcfg_if-dd2ea6c2=
7f046e56.rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-=
linux-gnu/lib/liblibc-a298ccd8ac6da714.rlib" "spdm-utils/0.7.2/recipe-sysro=
ot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/liballoc-056aaf2e033bde1c.rlib"=
 "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/=
librustc_std_workspace_core-285c3174480c42d6.rlib" "spdm-utils/0.7.2/recipe=
-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib/libcore-df89ffd20f73d501.=
rlib" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu=
/lib/libcompiler_builtins-f7db086d3d9fb6b3.rlib" "-Wl,-Bdynamic" "-ludev" "=
-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr=
" "-Wl,-z,noexecstack" "-L" "spdm-utils/0.7.2/recipe-sysroot/usr/lib/rustli=
b/aarch64-oe-linux-gnu/lib" "-L" "spdm-utils/0.7.2/recipe-sysroot/usr/lib" =
"-L" "spdm-utils/0.7.2/recipe-sysroot-native/usr/lib/rustlib/aarch64-oe-lin=
ux-gnu/lib" "-o" "spdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/releas=
e/deps/spdm_utils-bde42d4d198f7a3b" "-Wl,--gc-sections" "-pie" "-Wl,-O1" "-=
Wl,--strip-debug" "-nodefaultlibs" "-Wl,--start-group" "-lpci" "-lmemlib" "=
-lmalloclib" "-ldebuglib" "-lplatform_lib" "-lssl" "-lcrypto" "-lcryptlib_o=
penssl" "-lrnglib" "-lspdm_common_lib" "-lspdm_requester_lib" "-lspdm_respo=
nder_lib" "-lspdm_secured_message_lib" "-lspdm_secured_message_lib" "-lspdm=
_crypt_lib" "-lspdm_crypt_ext_lib" "-lspdm_transport_pcidoe_lib" "-lspdm_tr=
ansport_mctp_lib" "-Wl,--end-group"
> >   =3D note: spdm-utils/0.7.2/recipe-sysroot-native/usr/bin/aarch64-oe-l=
inux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/14.2.0/ld: spdm-ut=
ils/0.7.2/recipe-sysroot/usr/lib/libmemlib.a(zero_mem.c.o): undefined refer=
ence to symbol '__stack_chk_guard@@GLIBC_2.17'
> >           spdm-utils/0.7.2/recipe-sysroot-native/usr/bin/aarch64-oe-lin=
ux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/14.2.0/ld: spdm-util=
s/0.7.2/recipe-sysroot/usr/lib/ld-linux-aarch64.so.1: error adding symbols:=
 DSO missing from command line
> >           collect2: error: ld returned 1 exit status
> >
> >   =3D note: some `extern` functions couldn't be found; some native libr=
aries may need to be installed or have their path specified
> >   =3D note: use the `-l` flag to specify native libraries to link
> >   =3D note: use the `cargo:rustc-link-lib` directive to specify the nat=
ive libraries to link with Cargo (see https://doc.rust-lang.org/cargo/refer=
ence/build-scripts.html#rustc-link-lib)
> >
> > error: could not compile `SPDM-Utils` (bin "spdm_utils") due to 1 previ=
ous error
> >
> > Caused by:
> >   process didn't exit successfully: `rustc --crate-name spdm_utils --ed=
ition=3D2021 src/main.rs --error-format=3Djson --json=3Ddiagnostic-rendered=
-ansi,artifacts,future-incompat --crate-type bin --emit=3Ddep-info,link -C =
opt-level=3D3 -C embed-bitcode=3Dno --cfg 'feature=3D"asn1-rs"' --cfg 'feat=
ure=3D"async-std"' --cfg 'feature=3D"clap"' --cfg 'feature=3D"colored"' --c=
fg 'feature=3D"default"' --cfg 'feature=3D"env_logger"' --cfg 'feature=3D"f=
utures"' --cfg 'feature=3D"lazy_static"' --cfg 'feature=3D"memmap2"' --cfg =
'feature=3D"minicbor"' --cfg 'feature=3D"minicbor-derive"' --cfg 'feature=
=3D"nix"' --cfg 'feature=3D"once_cell"' --cfg 'feature=3D"serialport"' --cf=
g 'feature=3D"sha2"' --cfg 'feature=3D"std"' --cfg 'feature=3D"which"' --cf=
g 'feature=3D"x509-parser"' --check-cfg 'cfg(docsrs)' --check-cfg 'cfg(feat=
ure, values("asn1-rs", "async-std", "clap", "colored", "default", "env_logg=
er", "futures", "lazy_static", "libspdm_tests", "memmap2", "minicbor", "min=
icbor-derive", "nix", "no_std", "once_cell", "serialport", "sha2", "std", "=
which", "x509-parser"))' -C metadata=3Dbde42d4d198f7a3b -C extra-filename=
=3D-bde42d4d198f7a3b --out-dir spdm-utils/0.7.2/build/target/aarch64-oe-lin=
ux-gnu/release/deps --target aarch64-oe-linux-gnu -C linker=3Dspdm-utils/0.=
7.2/wrapper/target-rust-ccld -C strip=3Ddebuginfo -L dependency=3Dspdm-util=
s/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps -L dependency=3Dspdm=
-utils/0.7.2/build/target/release/deps --extern libspdm=3Dspdm-utils/0.7.2/=
build/target/aarch64-oe-linux-gnu/release/deps/liblibspdm-cd3bb7cf97ef1ede.=
rlib --extern asn1_rs=3Dspdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/=
release/deps/libasn1_rs-086351c4156f8c45.rlib --extern async_std=3Dspdm-uti=
ls/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libasync_std-276f6e=
fc8eb7aa08.rlib --extern clap=3Dspdm-utils/0.7.2/build/target/aarch64-oe-li=
nux-gnu/release/deps/libclap-9f603ab24f4e6ac8.rlib --extern colored=3Dspdm-=
utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libcolored-4b424=
f8b8a8a8f3a.rlib --extern env_logger=3Dspdm-utils/0.7.2/build/target/aarch6=
4-oe-linux-gnu/release/deps/libenv_logger-4d971d97d3d2728a.rlib --extern fu=
tures=3Dspdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/lib=
futures-a895171bccbbf729.rlib --extern lazy_static=3Dspdm-utils/0.7.2/build=
/target/aarch64-oe-linux-gnu/release/deps/liblazy_static-e4af7fc9cda932b7.r=
lib --extern libmctp=3Dspdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/r=
elease/deps/liblibmctp-fead11c09f728867.rlib --extern log=3Dspdm-utils/0.7.=
2/build/target/aarch64-oe-linux-gnu/release/deps/liblog-ca2be10f58adc31a.rl=
ib --extern memmap2=3Dspdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/re=
lease/deps/libmemmap2-1e722f3ca1cb9a40.rlib --extern minicbor=3Dspdm-utils/=
0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libminicbor-6dd2ce82a1=
c6ab80.rlib --extern minicbor_derive=3Dspdm-utils/0.7.2/build/target/releas=
e/deps/libminicbor_derive-1ac8504d13b7a0c4.so --extern nix=3Dspdm-utils/0.7=
.2/build/target/aarch64-oe-linux-gnu/release/deps/libnix-1bf3ed0ea4e2e7fd.r=
lib --extern once_cell=3Dspdm-utils/0.7.2/build/target/aarch64-oe-linux-gnu=
/release/deps/libonce_cell-d237059d66b9fe37.rlib --extern serialport=3Dspdm=
-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libserialport-6=
eeca887df603c96.rlib --extern sha2=3Dspdm-utils/0.7.2/build/target/aarch64-=
oe-linux-gnu/release/deps/libsha2-70c395dc600e20f3.rlib --extern which=3Dsp=
dm-utils/0.7.2/build/target/aarch64-oe-linux-gnu/release/deps/libwhich-ed45=
2b9a8575f9c2.rlib --extern x509_parser=3Dspdm-utils/0.7.2/build/target/aarc=
h64-oe-linux-gnu/release/deps/libx509_parser-362699415348d972.rlib -L spdm-=
utils/0.7.2/recipe-sysroot/usr/lib/rustlib/aarch64-oe-linux-gnu/lib --remap=
-path-prefix=3Dspdm-utils/0.7.2=3D/usr/src/debug/spdm-utils/0.7.2 -C link-a=
rg=3D-Wl,--start-group -C link-arg=3D-lpci -C link-arg=3D-lmemlib -C link-a=
rg=3D-lmalloclib -C link-arg=3D-ldebuglib -C link-arg=3D-lplatform_lib -C l=
ink-arg=3D-lssl -C link-arg=3D-lcrypto -C link-arg=3D-lcryptlib_openssl -C =
link-arg=3D-lrnglib -C link-arg=3D-lspdm_common_lib -C link-arg=3D-lspdm_re=
quester_lib -C link-arg=3D-lspdm_responder_lib -C link-arg=3D-lspdm_secured=
_message_lib -C link-arg=3D-lspdm_secured_message_lib -C link-arg=3D-lspdm_=
crypt_lib -C link-arg=3D-lspdm_crypt_ext_lib -C link-arg=3D-lspdm_transport=
_pcidoe_lib -C link-arg=3D-lspdm_transport_mctp_lib -C link-arg=3D-Wl,--end=
-group -L native=3Dspdm-utils/0.7.2/recipe-sysroot/usr/lib` (exit status: 1=
)
>
> It was failing in builds where
> meta/conf/distro/include/security_flags.inc was included and setting
> SECURITY_STACK_PROTECTOR to empty instead of the default:
> SECURITY_STACK_PROTECTOR=3D"-fstack-protector-strong"
> avoided that error, but surprisingly when trying to reproduce the same
> with just meta-oe and meta-clang and
> meta/conf/distro/include/security_flags.inc included in local.conf it
> didn't fail, so something more is needed to reproduce this, I don't
> use spdm-utils nor libspdm, it was just new failure in my world
> builds, so I can add the work around (or SKIP_RECIPE) in our layer.

I was finally able to reproduce it with just meta-oe and meta-clang by
using -fstack-protector-all instead of the default
-fstack-protector-strong (and with qemuarm instead of qemux86-64):

require conf/distro/include/security_flags.inc
SECURITY_STACK_PROTECTOR =3D "-fstack-protector-all"

ld: TOPDIR/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/spdm-utils/0.7.2/re=
cipe-sysroot/usr/lib/libmemlib.a(zero_mem.c.o):
undefined reference to symbol '__stack_chk_guard@@GLIBC_2.4'
http://errors.yoctoproject.org/Errors/Details/845272/

or

ld: TOPDIR/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/spdm-utils/0.7.2/re=
cipe-sysroot/usr/lib/libcryptlib_openssl.a(x509.c.o):
undefined reference to symbol '__stack_chk_guard@@GLIBC_2.4'
http://errors.yoctoproject.org/Errors/Details/845274/

And to avoid the error I had to set SECURITY_STACK_PROTECTOR to empty
in meta-openembedded/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
(which provides libmemlib.a and libcryptlib_openssl.a not in failing
spdm-utils).

Cheers,

>
> Cheers,
>
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  .../clang-layer/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-u=
tils/spdm-utils_0.7.2.bb b/meta-oe/dynamic-layers/clang-layer/recipes-devto=
ols/spdm-utils/spdm-utils_0.7.2.bb
> > index 800f9629c1..64cd1d928a 100644
> > --- a/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/sp=
dm-utils_0.7.2.bb
> > +++ b/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/sp=
dm-utils_0.7.2.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "\
> >  inherit cargo cargo-update-recipe-crates pkgconfig
> >
> >  export BINDGEN_EXTRA_CLANG_ARGS
> > -BINDGEN_EXTRA_CLANG_ARGS =3D "--sysroot=3D${WORKDIR}/recipe-sysroot -I=
${WORKDIR}/recipe-sysroot/usr/include"
> > +BINDGEN_EXTRA_CLANG_ARGS =3D "--sysroot=3D${STAGING_DIR_HOST} -I${STAG=
ING_INCDIR}"
> >
> >  SRC_URI +=3D "git://github.com/westerndigitalcorporation/spdm-utils.gi=
t;protocol=3Dhttps;branch=3Dmaster"
> >
> > --
> > 2.48.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115732): https://lists.openembedded.org/g/openembedde=
d-devel/message/115732
> Mute This Topic: https://lists.openembedded.org/mt/111495409/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


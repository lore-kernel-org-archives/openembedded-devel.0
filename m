Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AD2C282E5
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:00:44 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.14967.1741186838834347983
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LObIflgb;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30ba563a6d1so10778101fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 07:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741186837; x=1741791637; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxVFPBteg+5Idhu1A9QXvjZ5yoyAbiZpqncmIjHvm1I=;
        b=LObIflgbXXkkowiuLUnT77kNtlUXfgFk/LWAa7K2SDp2eqLYO96sZaOxH2o5EOssq4
         yHP5Md1dYyVq+kcBWJ+kfwyRIdkL5iUHF4PyjxNCKxSzrIrF8L8W6dD4jRYvbQKPkPEh
         MdeyvgWjqItU5Qab7Dgvph0PwBD+Ti8EDWvwpF4ARb1d0CIYY/Cn/bXImhQ9lId++s6l
         ysJ52gGcu3D5CHaKJFE6vfQ8OfWuDydRcKqWum0aXnUBpeJxfZEK8kP4FF7GGIXKA0Va
         FjiAJS2riIqOmKu+cltNmEc7FV8+U0leYqywjWG9RXRTSoM0FoXIaxUL0Bg+eGOngdbi
         sO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186837; x=1741791637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxVFPBteg+5Idhu1A9QXvjZ5yoyAbiZpqncmIjHvm1I=;
        b=uPKc7NBAUTw6WMVsmhOqSBpRWCr2tBOCDrdAw1qL3etwNReBqKFLYFdN1XrnS+74zl
         EZrkiUZwz3vdKxcEpRnPLcyfebtXtNV0/gmvgtQd8ZGiD80a7jKMaM7xZVmlsw9OrIqQ
         q6gTnw+zJWKeVIJlOaSH+TNJ6+erqNO14RXv3weCIV02BHqMUVMsKgMISoQmhiPVdaVQ
         ECbL9A/SSIqpRxJqGFSwH393OnVdkgpioWap2ha3rcDi+J3JCa2D9BJgfqqdD4EMDxdB
         4YXh8CRdRRr7Vj+Q+Wl1EsoP9QLLcyaAujPueQB5YF9Gm6qnSF6VU25YobcgjklT6Br5
         IAQA==
X-Gm-Message-State: AOJu0YzJuecDqDSTLwrper9XmxP3O9aFQ8iJb/2sWfL/M/l15+ucrYzf
	WqrYNhCGGGovxstpcCAWxDie/PNqX9IiDcOrDuCnjlrdqDL0PjhFW/KwVjQsG1jygFIlXRVpZOo
	Q7L7ZG4Le8W/f01Bf+J4wxR2YWnw=
X-Gm-Gg: ASbGnctyDb1aQssxlJRh+aHXZnuX5VsPdsIH5+G1fm1IZY/p9Rajn7iylVZdJszXXvN
	fqytSKrcuGFYYnprLBSX99s7EY+aLKQeABHwXRFZDuqnYTi/Aw+YAq33yNILuLYqc5BYRhMuzt6
	QAq95lYaPrYJJ9upBaXvJuXiOsljgo
X-Google-Smtp-Source: AGHT+IGz52fN5yK/HAxXfh5zVoDkX5ulHG+NF1FBI4mHkx0aKZGL3vple2KNgwxiMsuiVzb8N1Ax7HYz22ue8Es61WU=
X-Received: by 2002:a2e:a98b:0:b0:308:eabd:297b with SMTP id
 38308e7fff4ca-30bd7b0d4a9mr13541261fa.4.1741186836520; Wed, 05 Mar 2025
 07:00:36 -0800 (PST)
MIME-Version: 1.0
References: <20250305105253.3545398-1-martin.jansa@gmail.com> <CAHUKmYYEF972DY5sKtG3iUOQPB9Y9YNTHJicMF_xOVP0j4F4rQ@mail.gmail.com>
In-Reply-To: <CAHUKmYYEF972DY5sKtG3iUOQPB9Y9YNTHJicMF_xOVP0j4F4rQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Mar 2025 16:00:24 +0100
X-Gm-Features: AQ5f1JoZXK_aRBz6d9wqEY9SL_bojo1xv7t4_P7S268_FEbtAOqp55TChgqTk4o
Message-ID: <CA+chaQfLJZe4tPh_xj65B-dBOrfJDFBz3GqSEWd1CT-9W+4rxQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] uutils-coreutils: use correct variables
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 15:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115757

Hi Etienne,

I've tried to remove all 3 variables and it still builds for me fine.
I'll send review to do that shortly, please test it in your setup as I
don't use uutils-coreutils, I was updating it just to prevent people
copy-pasting ${WORKDIR}/recipe-sysroot-native${libdir} like Robert did
in thin-provisioning-tools:
https://lists.openembedded.org/g/openembedded-devel/message/115743

On Wed, Mar 5, 2025 at 3:28=E2=80=AFPM Etienne Cordonnier <ecordonnier@snap=
.com> wrote:
>
> Hi Martin,
> regarding SELINUX_INCLUDE_DIR, it was definitely needed as I implemented =
the recipe. During implementation I submitted this patch to selinux-sys ( h=
ttps://github.com/koutheir/selinux-sys/commit/a6667c404ecc33266f66e9516bb8e=
30150c41ec2 ) to correctly use this variable, and was getting a build error=
 without this fix because the rust crate selinux-sys was not finding the se=
linux header-file (specifically, the bindgen tool).
>
> However, this was in 2022, and since then there has been this patch in se=
linux-sys: https://github.com/koutheir/selinux-sys/commit/d3ea4674e18c52409=
18348bea4ec6248e50516e5 , and it seems that the variable is not needed any =
more.
> At least I'm not able to reproduce the build error which I was getting, e=
ven with commenting out SELINUX_LIB_DIR and SELINUX_INCLUDE_DIR.
>
> The header-file is used for generating rust code from the C header-file u=
sing bindgen, so I don't think it makes a difference whether the native ver=
sion or the target version is used.
>
> This is the old build error I was getting:
>   process didn't exit successfully: `/workdir/build/tmp-glibc/work/armv8a=
-linux/uutils-coreutils/0.0.14.AUTOINC+43a5b8c7d7-r0/build/target/release/b=
uild/selinux-sys-0849198bc1fef4a4/build-script-build` (exit status: 101)
>   --- stdout
>   cargo:root=3D/workdir/build/tmp-glibc/work/armv8a-linux/uutils-coreutil=
s/0.0.14.AUTOINC+43a5b8c7d7-r0/build/target/aarch64-snap-linux/release/buil=
d/selinux-sys-d96748d49908959f/out
>   cargo:rerun-if-env-changed=3DSELINUX_STATIC_aarch64-snap-linux
>   cargo:rerun-if-env-changed=3DSELINUX_STATIC_aarch64_snap_linux
>   cargo:rerun-if-env-changed=3DTARGET_SELINUX_STATIC
>
> |   --- stderr
> |   src/selinux-sys.h:1:10: fatal error: 'selinux/selinux.h' file not fou=
nd
> |   src/selinux-sys.h:1:10: fatal error: 'selinux/selinux.h' file not fou=
nd, err: true
>
> =C3=89tienne
>
>
> On Wed, Mar 5, 2025 at 11:53=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com> wrote:
>>
>> * use STAGING_LIBDIR_NATIVE variable for LIBCLANG_PATH and SELINUX_LIB_D=
IR
>>   and STAGING_INCDIR_NATIVE variable for SELINUX_INCLUDE_DIR
>>   not sure why it uses native version and not target, but at least use
>>   correct variable
>>
>> * hardcoding:
>>   ${WORKDIR}/recipe-sysroot-native${libdir}
>>   is just wrong when there is a better variable
>>
>> * This path won't be correct for multilib builds where target ${libdir}
>>   might be e.g. /usr/lib32 while native libdir is /usr/lib.
>>
>> * even with meta-selinux added to my builds I don't see any failure
>>   maybe these variables aren't really used?
>>
>> * use STAGING_LIBDIR_NATIVE variable which uses correct ${libdir_native}
>>
>> OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar LIBCLANG_PATH =
-r uutils-coreutils
>>   #
>>   # $LIBCLANG_PATH [2 operations]
>>   #   exported /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/=
uutils-coreutils/uutils-coreutils_0.0.29.bb:33
>>   #     [export] "1"
>>   #   set /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/uutil=
s-coreutils/uutils-coreutils_0.0.29.bb:33
>>   #     "${WORKDIR}/recipe-sysroot-native${libdir}"
>>   # pre-expansion value:
>>   #   "${WORKDIR}/recipe-sysroot-native${libdir}"
>> export LIBCLANG_PATH=3D"/OE/build/oe-core/tmp/work/cortexa57-oe-linux/uu=
tils-coreutils/0.0.29/recipe-sysroot-native/usr/lib64"
>>
>> OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar STAGING_LIBDIR=
_NATIVE -r uutils-coreutils
>>   #
>>   # $STAGING_LIBDIR_NATIVE
>>   #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:425
>>   #     "${STAGING_DIR_NATIVE}${libdir_native}"
>> STAGING_LIBDIR_NATIVE=3D"/OE/build/oe-core/tmp/work/cortexa57-oe-linux/u=
utils-coreutils/0.0.29/recipe-sysroot-native/usr/lib"
>>
>> OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar LIBCLANG_PATH =
-r lib32-uutils-coreutils
>>   #
>>   # $LIBCLANG_PATH [2 operations]
>>   #   exported /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/=
uutils-coreutils/uutils-coreutils_0.0.29.bb:33
>>   #     [export] "1"
>>   #   set /OE/build/oe-core/meta-openembedded/meta-oe/recipes-core/uutil=
s-coreutils/uutils-coreutils_0.0.29.bb:33
>>   #     "${WORKDIR}/recipe-sysroot-native${libdir}"
>>   # pre-expansion value:
>>   #   "${WORKDIR}/recipe-sysroot-native${libdir}"
>> export LIBCLANG_PATH=3D"/OE/build/oe-core/tmp/work/armv7at2-neon-oemllib=
32-linux-gnueabi/lib32-uutils-coreutils/0.0.29/recipe-sysroot-native/usr/li=
b32"
>>
>> OE qemuarm64-multilib@ /OE/build/oe-core $ bitbake-getvar STAGING_LIBDIR=
_NATIVE -r lib32-uutils-coreutils
>>   #
>>   # $STAGING_LIBDIR_NATIVE
>>   #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:425
>>   #     "${STAGING_DIR_NATIVE}${libdir_native}"
>> STAGING_LIBDIR_NATIVE=3D"/OE/build/oe-core/tmp/work/armv7at2-neon-oemlli=
b32-linux-gnueabi/lib32-uutils-coreutils/0.0.29/recipe-sysroot-native/usr/l=
ib"
>>
>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> ---
>>  .../uutils-coreutils/uutils-coreutils_0.0.29.bb             | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.=
29.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
>> index 19d628f735..d0a7532984 100644
>> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
>> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
>> @@ -30,9 +30,9 @@ CARGO_BUILD_FLAGS +=3D "${@bb.utils.contains('PACKAGEC=
ONFIG', 'selinux', '--featur
>>
>>  DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'selinux', 'clang-n=
ative libselinux-native', '', d)}"
>>
>> -export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
>> -export SELINUX_LIB_DIR =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
>> -export SELINUX_INCLUDE_DIR =3D "${WORKDIR}/recipe-sysroot-native${inclu=
dedir}"
>> +export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
>> +export SELINUX_LIB_DIR =3D "${STAGING_LIBDIR_NATIVE}"
>> +export SELINUX_INCLUDE_DIR =3D "${STAGING_INCDIR_NATIVE}"
>>
>>  # The code which follows is strongly inspired from the GNU coreutils bi=
tbake recipe:
>>
>> --
>> 2.48.1
>>


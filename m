Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9B7EB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 16:07:16 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.13976.1687709229516721113
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 09:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HNdPCbf/;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b7e66ff65fso10076035ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687709229; x=1690301229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkYxwvWZe+twxe1G+srfQxKOg4VNNd2vo/Plq2vBc/s=;
        b=HNdPCbf/4v8++bLToq1hdC43VYCa6bxoXJE+dSBTVyDOQDvi/op5RPR6aG9bHHcdZd
         PM0B37GXJQZdMCmbariUTY9Z8ZvewrdMq6jBDAojDJhfwn75Lwz2frSq0W2TSM/FR+26
         P1YEbYOVC9djeunQl4YL32vQP+Tu5P7w0bbcwcnwQSbP9giYn2+tu3Ii1y8ckFrjBhdZ
         ImjCZMRrHer76HZPEST5mNEw8jR2uftF7J0gvp1XwHjN0LqAv6RTgLllVzt7GtB0Eraw
         Gq8ChXEXvyHrWs0Z6n4Pre4NWzKRP+YxHNCvQP/FfSNyabE5hGczr7g57sRWrwmeueI8
         TTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687709229; x=1690301229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkYxwvWZe+twxe1G+srfQxKOg4VNNd2vo/Plq2vBc/s=;
        b=awlvNetrPcXAXOUvD1/5SYjnDNr7/LxFEBKcrl/9LcszDjm53Gapw2cl8NHY1SeBNw
         /EUShVB9z7QLPge3kolRVi/zbEMw8ZR27VmnB3liHoTWmZjHjGSS2lCe3N8DliuLYQjp
         GaJHmTM1hsKttkByZSA/og5aTxhuWa0g06+nCrgEwR3REShHrFV2TSQ4RcPXak0sqfWS
         Mo9VZO+3RJz3YPL0OpxdS/iR5+cUEKh7ilKX3dw39XweyNK8OMt/MqQ4uAypWLVsxBtu
         95OCrCwmINUmUHDgjLJdHa49xqu9cReVgBPKu7B/NKBHepoteNXqra9BBYVKn9AOqCjx
         JXYw==
X-Gm-Message-State: AC+VfDyU96D7XUTw5rFv61gdLNDvtBsl77TP5ptcySP7MBdFkazUQZ5F
	YLvXWa4ZIBDgT1nMnrvI35Mxsg4Ew3JLyTmB3Qs=
X-Google-Smtp-Source: ACHHUZ5nciM2EutYkY8k4OhFtxXh/zUuZtcT5GGYKqwCNjGHcSRd/EDKVc/2KbwMka920h0LdALKf8LzqtiOs7r8nk4=
X-Received: by 2002:a17:902:e5c3:b0:1b6:9fec:8134 with SMTP id
 u3-20020a170902e5c300b001b69fec8134mr6265427plf.46.1687709228841; Sun, 25 Jun
 2023 09:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230619182559.104504-1-beniaminsandu@gmail.com>
 <CA+chaQcgWg7AJ7kk62HE2xTS6k3sORmgb4OTJmhqcwyN+ZqmPQ@mail.gmail.com>
 <CABQJdOG4=HojBgBTc9cJX92pe0ZKzS6=c0NgKHQiKR6Ue67ZVQ@mail.gmail.com> <CA+chaQeoWV8c5toN8brcLmEkzAk-FxjSRsSHVtQRD1LZwvZS=w@mail.gmail.com>
In-Reply-To: <CA+chaQeoWV8c5toN8brcLmEkzAk-FxjSRsSHVtQRD1LZwvZS=w@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Sun, 25 Jun 2023 19:06:57 +0300
Message-ID: <CABQJdOG4BS8zDs2rsH6gRK9ZkjR+wntLt7binQePfCTuJcOyuA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add support for v3.x
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 16:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103565

On Sun, Jun 25, 2023 at 5:38=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> Maybe just skip the recipe when building without crypto? If someone uses =
tune without crypto for whatever reason, then it might be better to show an=
 error that crypto is mandatory for this recipe instead of silently changin=
g the decision not to use crypto with DEFAULTTUNE.

I was considering it, but doing it like this seemed a bit less ugly at
the time. The issue is not with the 64bit build itself, just building
with a tune that has arm64 instructions only enabled, without any
other core specs. Any other arm64 tune variation should work.
I will have a closer look at the mbedtls code, might be fixable there.

>
> I've noticed it just in world builds, don't really need 64bit mbedtls bui=
ld in this multilib setup (which uses just 64bit kernel and external module=
s, whole userspace is 32bit).
>
> Regards,
>
> On Sun, Jun 25, 2023 at 3:42=E2=80=AFPM Beniamin Sandu <beniaminsandu@gma=
il.com> wrote:
>>
>> On Sun, Jun 25, 2023 at 1:53=E2=80=AFPM Martin Jansa <martin.jansa@gmail=
.com> wrote:
>> >
>> > On Mon, Jun 19, 2023 at 8:26=E2=80=AFPM Beniamin Sandu <beniaminsandu@=
gmail.com> wrote:
>> >>
>> >> Version 3.4.0 adds a lot of improvements and fixes (a notable one
>> >> being initial support for PKCS7 CMS), but since this is a pretty
>> >> big jump, let's keep both versions for a while, so the v2.x users
>> >> can upgrade to 3.x in a timely manner if needed.
>> >>
>> >> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
>> >> ---
>> >>  .../mbedtls/mbedtls_3.4.0.bb                  | 85 +++++++++++++++++=
++
>> >>  1 file changed, 85 insertions(+)
>> >>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbed=
tls_3.4.0.bb
>> >>
>> >> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4=
.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
>> >> new file mode 100644
>> >> index 000000000..ebc6ba573
>> >> --- /dev/null
>> >> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
>> >
>> >
>> > ....
>> >
>> >> +# Needs crypto instructions on aarch64
>> >> +TUNE_CCARGS_MARCH_OPTS:append:aarch64 =3D "${@bb.utils.contains('TUN=
E_FEATURES', 'crypto', '', '+crypto', d)}"
>> >
>> >
>> > This assumes too much about TUNE_CCARGS_MARCH_OPTS structure and in so=
me multilib builds I'm seeing:
>> >
>> > # $TUNE_CCARGS_MARCH_OPTS [4 operations]
>> > #   set oe-core/meta/conf/machine/include/arm/arch-arm.inc:19
>> > #     [_defaultval] ""
>> > #   postdot oe-core/meta/conf/machine/include/arm/feature-arm-neon.inc=
:26
>> > #     "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv3d16', 'vfpv5spd16=
' ], '+fp', '', d)}"
>> > #   postdot oe-core/meta/conf/machine/include/arm/feature-arm-simd.inc=
:5
>> > #     "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
>> > #   :append[aarch64] meta-oe/meta-networking/recipes-connectivity/mbed=
tls/mbedtls_3.4.0.bb:45
>> > #     "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', =
d)}"
>> > # pre-expansion value:
>> > #   "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv3d16', 'vfpv5spd16' =
], '+fp', '', d)}${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '',=
 d)}${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', d)}"
>> > TUNE_CCARGS_MARCH_OPTS=3D"+crypto"
>> >
>> > And empty TUNE_CCARGS_MARCH, because TUNE_FEATURES has only aarch64
>> >
>> > # $TUNE_CCARGS_MARCH [4 operations]
>> > #   postdot oe-core/meta/conf/machine/include/arm/arch-armv7a.inc:6
>> > #     "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=3Darmv=
7-a', '', d)}"
>> > #   postdot oe-core/meta/conf/machine/include/arm/arch-armv6.inc:5
>> > #     "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=3Darmv6=
', '', d)}"
>> > #   postdot oe-core/meta/conf/machine/include/arm/arch-armv5.inc:5
>> > #     "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=3Darmv5=
t${ARMPKGSFX_DSP}', '', d)}"
>> > #   postdot oe-core/meta/conf/machine/include/arm/arch-armv4.inc:5
>> > #     "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=3Darmv4=
${ARMPKGSFX_THUMB}', '', d)}"
>> > # pre-expansion value:
>> > #   "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=3Darmv7-=
a', '', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=3Darmv6'=
, '', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=3Darmv5t${=
ARMPKGSFX_DSP}', '', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -m=
arch=3Darmv4${ARMPKGSFX_THUMB}', '', d)}"
>> > TUNE_CCARGS_MARCH=3D""
>> >
>> > causing do_configure failure:
>> >
>> > aarch64-oe-linux-gcc: warning: +crypto: linker input file unused becau=
se linking not done
>> > aarch64-oe-linux-gcc: error: +crypto: linker input file not found: No =
such file or directory
>> > ninja: build stopped: subcommand failed.
>>
>> As I understand, you are building a lib64 multilib variant with a pure
>> aarch64 tune (no core specifications or optimizations whatsoever)?
>> I have tested with a bunch of different machines and tuning variations
>> on my side, but I never encountered a build in the real world with
>> arm64 instructions enabled and nothing else, so did not think trying
>> out this one would be useful.
>> Building with crypto instructions on arm64 machines was the path with
>> the least resistance in getting rid of compilation errors because of
>> target specific option mismatches, but I will look if there is better
>> way to handle this when I get the chance.
>>
>> >
>> >>  +
>> >> +# For now the only way to enable PSA is to explicitly pass a -D via =
CFLAGS
>> >> +CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -D=
MBEDTLS_USE_PSA_CRYPTO', '', d)}"
>> >> +
>> >> +PROVIDES +=3D "polarssl"
>> >> +RPROVIDES:${PN} =3D "polarssl"
>> >> +
>> >> +PACKAGES =3D+ "${PN}-programs"
>> >> +FILES:${PN}-programs =3D "${bindir}/"
>> >> +
>> >> +ALTERNATIVE:${PN}-programs =3D "hello"
>> >> +ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
>> >> +
>> >> +BBCLASSEXTEND =3D "native nativesdk"
>> >> +
>> >> +CVE_PRODUCT =3D "mbed_tls"
>> >> +
>> >> +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
>> >> +CVE_CHECK_IGNORE +=3D "CVE-2021-43666"
>> >> +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4=
a9c66a48edfe9ece03c7e4a53310adf73a86c
>> >> +CVE_CHECK_IGNORE +=3D "CVE-2021-45451"
>> >> +
>> >> +# Strip host paths from autogenerated test files
>> >> +do_compile:append() {
>> >> +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
>> >> +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
>> >> +}
>> >> +
>> >> +# Export source files/headers needed by Arm Trusted Firmware
>> >> +sysroot_stage_all:append() {
>> >> +       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/shar=
e/mbedtls-source/library"
>> >> +       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/shar=
e/mbedtls-source/include"
>> >> +}
>> >> +
>> >> +do_install_ptest () {
>> >> +       install -d ${D}${PTEST_PATH}/tests
>> >> +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
>> >> +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
>> >> +       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
>> >> +}
>> >> --
>> >> 2.25.1
>> >>
>> >>
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> Links: You receive all messages sent to this group.
>> >> View/Reply Online (#103441): https://lists.openembedded.org/g/openemb=
edded-devel/message/103441
>> >> Mute This Topic: https://lists.openembedded.org/mt/99629175/3617156
>> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [Martin.Jansa@gmail.com]
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>


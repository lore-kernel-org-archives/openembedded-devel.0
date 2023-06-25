Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7CAEB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 13:42:55 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.11634.1687700569807483674
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 06:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TJV8I/uX;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-543c692db30so2076886a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 06:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687700569; x=1690292569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbOW5xTriQaQKyFoQN3TXrlAx7vue9IQNIMpzl+O98w=;
        b=TJV8I/uX1/4Ipx+q8w7mnrE0zMg5So+SeRssHH8uFCkNocVDoibTL+WgD1g4w3nacG
         thpvA4CKCIs3krE5URF+HPFaRcrOYHFUWVM0Hx0g3FUcRw9v+/orhmQs3kvPvyXttC5n
         4ixj4jY1DwW2OKF0xcDAIo9hHs9ZTczUlL7a52UDSQY7sKNQXdPnpZlHoMFPFyURATzy
         bJESbXrm9YG086iDA1FTY8x3dx7ie1gzpOZ861W/Frhhcx56NLvZoi8ngDlwFYvXMfHV
         1Wsd4Akc9mSrKPQmUAOb1OfzzokKiW7AYBnSdVTdaEoVvIDq+p/HyOJZtaFvIx19TBsL
         uv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687700569; x=1690292569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbOW5xTriQaQKyFoQN3TXrlAx7vue9IQNIMpzl+O98w=;
        b=IaXz86Oq9J8WPzq3+pF9A6OCNuHyGSPU4UlSbAAmhTc+so3C4ywEl909DhHpYFaufT
         8d49CnAiWsngP7Rtl7+TgGbCdB0h7E85ymmmxMy62/4MuyTjIS30bsf1Hs/sp9HTfjvF
         ZJTAfqQb7W0bMUlMsK0fxQI3gXKseuPuzYgsWokocTVeB0MZ9J6/EIKBrU3flE1cTxam
         igAd5WOp1ZKtpBEP1F5Mk4mLjzij71CgGysp7XDzWnUkQVJAGkhN14ZgG+KV+753s/Sn
         TVHCvpWOOJGe/KvAgP0bfpqFUpNM9+13Yd//kgJwvdzJi29j2/h+T7lmpgkYOewoPpxD
         SNxg==
X-Gm-Message-State: AC+VfDyheIS6owtQCxmrXoVFk0UfRVxeDmslwov4kpB7ekHH8OZARX79
	cqOEi7JShtsfwZMzXc4Q8BcyhnxnP0cywyhvvEA=
X-Google-Smtp-Source: ACHHUZ4VeTSSO4uYPvnG3HVbniay08MQRtGXfKhS2+g5OZMlGPpOLLx101iAzLnVud/SPeP8negy0V8o+6479SiTNC4=
X-Received: by 2002:a17:90a:9bcc:b0:262:ec13:d3a with SMTP id
 b12-20020a17090a9bcc00b00262ec130d3amr1195110pjw.28.1687700569036; Sun, 25
 Jun 2023 06:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230619182559.104504-1-beniaminsandu@gmail.com> <CA+chaQcgWg7AJ7kk62HE2xTS6k3sORmgb4OTJmhqcwyN+ZqmPQ@mail.gmail.com>
In-Reply-To: <CA+chaQcgWg7AJ7kk62HE2xTS6k3sORmgb4OTJmhqcwyN+ZqmPQ@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Sun, 25 Jun 2023 16:42:37 +0300
Message-ID: <CABQJdOG4=HojBgBTc9cJX92pe0ZKzS6=c0NgKHQiKR6Ue67ZVQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add support for v3.x
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 13:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103561

On Sun, Jun 25, 2023 at 1:53=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> On Mon, Jun 19, 2023 at 8:26=E2=80=AFPM Beniamin Sandu <beniaminsandu@gma=
il.com> wrote:
>>
>> Version 3.4.0 adds a lot of improvements and fixes (a notable one
>> being initial support for PKCS7 CMS), but since this is a pretty
>> big jump, let's keep both versions for a while, so the v2.x users
>> can upgrade to 3.x in a timely manner if needed.
>>
>> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
>> ---
>>  .../mbedtls/mbedtls_3.4.0.bb                  | 85 +++++++++++++++++++
>>  1 file changed, 85 insertions(+)
>>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls=
_3.4.0.bb
>>
>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.=
bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
>> new file mode 100644
>> index 000000000..ebc6ba573
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
>
>
> ....
>
>> +# Needs crypto instructions on aarch64
>> +TUNE_CCARGS_MARCH_OPTS:append:aarch64 =3D "${@bb.utils.contains('TUNE_F=
EATURES', 'crypto', '', '+crypto', d)}"
>
>
> This assumes too much about TUNE_CCARGS_MARCH_OPTS structure and in some =
multilib builds I'm seeing:
>
> # $TUNE_CCARGS_MARCH_OPTS [4 operations]
> #   set oe-core/meta/conf/machine/include/arm/arch-arm.inc:19
> #     [_defaultval] ""
> #   postdot oe-core/meta/conf/machine/include/arm/feature-arm-neon.inc:26
> #     "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv3d16', 'vfpv5spd16' ]=
, '+fp', '', d)}"
> #   postdot oe-core/meta/conf/machine/include/arm/feature-arm-simd.inc:5
> #     "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
> #   :append[aarch64] meta-oe/meta-networking/recipes-connectivity/mbedtls=
/mbedtls_3.4.0.bb:45
> #     "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', d)}=
"
> # pre-expansion value:
> #   "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv3d16', 'vfpv5spd16' ], =
'+fp', '', d)}${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)=
}${@bb.utils.contains('TUNE_FEATURES', 'crypto', '', '+crypto', d)}"
> TUNE_CCARGS_MARCH_OPTS=3D"+crypto"
>
> And empty TUNE_CCARGS_MARCH, because TUNE_FEATURES has only aarch64
>
> # $TUNE_CCARGS_MARCH [4 operations]
> #   postdot oe-core/meta/conf/machine/include/arm/arch-armv7a.inc:6
> #     "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=3Darmv7-a=
', '', d)}"
> #   postdot oe-core/meta/conf/machine/include/arm/arch-armv6.inc:5
> #     "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=3Darmv6', =
'', d)}"
> #   postdot oe-core/meta/conf/machine/include/arm/arch-armv5.inc:5
> #     "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=3Darmv5t${=
ARMPKGSFX_DSP}', '', d)}"
> #   postdot oe-core/meta/conf/machine/include/arm/arch-armv4.inc:5
> #     "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=3Darmv4${A=
RMPKGSFX_THUMB}', '', d)}"
> # pre-expansion value:
> #   "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=3Darmv7-a',=
 '', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=3Darmv6', '=
', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=3Darmv5t${ARM=
PKGSFX_DSP}', '', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -marc=
h=3Darmv4${ARMPKGSFX_THUMB}', '', d)}"
> TUNE_CCARGS_MARCH=3D""
>
> causing do_configure failure:
>
> aarch64-oe-linux-gcc: warning: +crypto: linker input file unused because =
linking not done
> aarch64-oe-linux-gcc: error: +crypto: linker input file not found: No suc=
h file or directory
> ninja: build stopped: subcommand failed.

As I understand, you are building a lib64 multilib variant with a pure
aarch64 tune (no core specifications or optimizations whatsoever)?
I have tested with a bunch of different machines and tuning variations
on my side, but I never encountered a build in the real world with
arm64 instructions enabled and nothing else, so did not think trying
out this one would be useful.
Building with crypto instructions on arm64 machines was the path with
the least resistance in getting rid of compilation errors because of
target specific option mismatches, but I will look if there is better
way to handle this when I get the chance.

>
>>  +
>> +# For now the only way to enable PSA is to explicitly pass a -D via CFL=
AGS
>> +CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBE=
DTLS_USE_PSA_CRYPTO', '', d)}"
>> +
>> +PROVIDES +=3D "polarssl"
>> +RPROVIDES:${PN} =3D "polarssl"
>> +
>> +PACKAGES =3D+ "${PN}-programs"
>> +FILES:${PN}-programs =3D "${bindir}/"
>> +
>> +ALTERNATIVE:${PN}-programs =3D "hello"
>> +ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> +
>> +CVE_PRODUCT =3D "mbed_tls"
>> +
>> +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
>> +CVE_CHECK_IGNORE +=3D "CVE-2021-43666"
>> +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c=
66a48edfe9ece03c7e4a53310adf73a86c
>> +CVE_CHECK_IGNORE +=3D "CVE-2021-45451"
>> +
>> +# Strip host paths from autogenerated test files
>> +do_compile:append() {
>> +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
>> +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
>> +}
>> +
>> +# Export source files/headers needed by Arm Trusted Firmware
>> +sysroot_stage_all:append() {
>> +       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/m=
bedtls-source/library"
>> +       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/m=
bedtls-source/include"
>> +}
>> +
>> +do_install_ptest () {
>> +       install -d ${D}${PTEST_PATH}/tests
>> +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
>> +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
>> +       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
>> +}
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#103441): https://lists.openembedded.org/g/openembedd=
ed-devel/message/103441
>> Mute This Topic: https://lists.openembedded.org/mt/99629175/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


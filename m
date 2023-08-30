Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6780BC83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 14:41:43 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.15623.1693406495951409435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 07:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Y/SiQxrx;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a8614fe8c4so4069561b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693406495; x=1694011295; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWMqPMCiSxan/um40hJS5hjboAguxOOVZSn2rmO88I8=;
        b=Y/SiQxrxLc0eDnXkeWoUbVsYieJE5SZ8UlGRTQKbs5nBkPHo/HsCR5sIjbf5kEG14A
         T6GhL4uQE87XLxBIjwuXSKM8vHNj+2AOV9JKzPe902zfswjnr6A9Vh1uevSf1aObAoZs
         7ftChNhCaebRDaEK/93CArep6O9GGI1Mey/VsB+f0qL2UsD7cdbEBtbqwkpZ9U9AbCI3
         GVq5Buqyy2llhaCKVDdpe1bWgAJ7K0+SVkGJ+je/5l8dR4WZvNWCB3cC+a+50MfZc75N
         LsdajSUna+K2kg7URV4YehQ2Q51W7E8dyNS9OE1GuHMI87qjNSl5a+VPiupFIE+YNWHS
         km0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693406495; x=1694011295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWMqPMCiSxan/um40hJS5hjboAguxOOVZSn2rmO88I8=;
        b=JJ9lI9t1Uxt89xGsTd0UbOzeABnnqyAWC/Ze6eMtmAbeFPNWc/NqtyG/PXmnRoZWN6
         FD07aWoEtloH7+IBCPhlx+4Fae0l5ZzreYmQkLQbdDFRALogHdbr6xDne3dmhFpB2G91
         FgWJuV30DfTVsQRxAieyDFIQ+Os5eehV/90V9pdSetqkDY+zSY2KLmwTrSNVm2HxAhZR
         Ek4V1ZhwbmbUpMsxafMyCY/fK+qY3pBuLqZvPXi6JLhmFIdsXM4Hryqlysv/5T0auFIo
         0v+csgjSLIEwVbZe2eN4FqGKbHagXwViaIqpWlNmIkmgAnMhf/ykktiws5PY5HJ/GJ9b
         1d8Q==
X-Gm-Message-State: AOJu0Ywqd8kWFk8Ho5KNIUzrKwZ2XXQrn/EWfMcGE0AFAuZNXwBysb9S
	Q9837k+s1gcSgcLZoFWcd2czg3b/3r5bAgrCwOw=
X-Google-Smtp-Source: AGHT+IFHRwUWK0YLCHMH503ehcU8euEx4EaFcrFkf5/RDB68piZNYrU+62RvP9xAYjtHz/8tfisYYy31ZnQOzVw0VZc=
X-Received: by 2002:a05:6808:150b:b0:3a7:46d2:5203 with SMTP id
 u11-20020a056808150b00b003a746d25203mr2840106oiw.51.1693406495141; Wed, 30
 Aug 2023 07:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230818105212.34481-1-tymoteusz.burak@3mdeb.com>
 <CAMKF1sriZM2ykf_b4Yfn+ZnQ1G7-LU-Fp+4_WY45T4ch3sv83w@mail.gmail.com> <CA+chaQd8qGX8g4PSKJo0N3O=n9J08kc_6NR0GKg2jXxV6e8rKQ@mail.gmail.com>
In-Reply-To: <CA+chaQd8qGX8g4PSKJo0N3O=n9J08kc_6NR0GKg2jXxV6e8rKQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Aug 2023 07:41:08 -0700
Message-ID: <CAMKF1sodWqwsR2bzHP6KX=6wtihCbwZTTE_Q3e31gFQF2G7yqQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] libfaketime: add recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>, openembedded-devel@lists.openembedded.org, 
	piotr.krol@3mdeb.com, tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 14:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104667

On Wed, Aug 30, 2023 at 12:33=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> Can we name the lib${PN} package differently, e.g. libfaketime? With mult=
ilib the package name is ridiculous lib32-liblib32-libfaketime:
>
> ERROR: lib32-libfaketime-0.9.10-r0 do_package_qa: QA Issue: non -dev/-dbg=
/nativesdk- package lib32-liblib32-libfaketime contains symlink .so '/usr/l=
ib32/faketime/libfaketime.so' [dev-so]

yes, I think I had that feedback in mind but I forgot to provide it.
We should be fine to rename lib${PN} -> ${PN}
>
> On Sat, Aug 19, 2023 at 8:39=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> fails to build with clang
>> https://errors.yoctoproject.org/Errors/Details/732361/
>>
>> On Fri, Aug 18, 2023 at 3:52=E2=80=AFAM Tymoteusz Burak
>> <tymoteusz.burak@3mdeb.com> wrote:
>> >
>> > This commit adds the libfaketime library recipe, which provides time
>> > manipulation capabilities for testing and debugging purposes. libfaket=
ime allows
>> > developers to modify the system time reported to applications, aiding =
in scenarios
>> > where accurate time emulation is required.
>> >
>> > GitHub Repository: https://github.com/wolfcw/libfaketime
>> >
>> > Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
>> > ---
>> >  .../libfaketime/libfaketime_0.9.10.bb         | 34 ++++++++++++++++++=
+
>> >  1 file changed, 34 insertions(+)
>> >  create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime_0.9.1=
0.bb
>> >
>> > diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/=
meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
>> > new file mode 100644
>> > index 000000000000..f26e5b0db872
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
>> > @@ -0,0 +1,34 @@
>> > +DESCRIPTION =3D "A library for faking the system time in user-space p=
rograms"
>> > +SECTION =3D "libs"
>> > +LICENSE =3D "GPL-2.0-only"
>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
>> > +
>> > +SRCREV =3D "d475b925943ad404c6c728ac868dc73949e7281c"
>> > +SRC_URI =3D "\
>> > +    git://git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;proto=
col=3Dhttps \
>> > +    "
>> > +
>> > +S =3D "${WORKDIR}/git"
>> > +
>> > +EXTRA_OEMAKE +=3D "\
>> > +    EXTRA_FLAGS=3D'-Wno-error=3Dnonnull-compare' \
>> > +    "
>> > +
>> > +do_configure[noexec] =3D "1"
>> > +do_compile () {
>> > +    oe_runmake
>> > +}
>> > +do_install () {
>> > +    install -d ${D}${libdir}/faketime
>> > +    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
>> > +    install -d ${D}${bindir}
>> > +    install -m 0755 src/faketime ${D}${bindir}
>> > +}
>> > +
>> > +PACKAGES =3D+ "lib${PN}"
>> > +
>> > +FILES:${PN} =3D "${bindir}/faketime"
>> > +FILES:lib${PN} =3D "${libdir}/faketime/*"
>> > +
>> > +INSANE_SKIP:${PN} +=3D "dev-so"
>> > +INSANE_SKIP:lib${PN} +=3D "dev-so"
>> > --
>> > 2.41.0
>> >
>> >
>> >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104494): https://lists.openembedded.org/g/openembedd=
ed-devel/message/104494
>> Mute This Topic: https://lists.openembedded.org/mt/100817966/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


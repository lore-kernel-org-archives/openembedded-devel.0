Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0818EC83F2E
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 16:09:49 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.1842.1693498179010033578
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Aug 2023 09:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cvXm2gCG;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-57361de8878so631414eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693498178; x=1694102978; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4gndnGdyW9UvSj9a0oZU6PTSO1hEkDA68lCaJ4kZhM=;
        b=cvXm2gCGIzBxsjIREU0tBK6XtRpB3EeF2ckTDM2XOxJBT9NUctIiDtTKQJNlVJ3qK5
         RE9t/j492MtT1AwVyGZYAr36zBYvLflmzAJhhEvtoyAJQcP4G384mQyzThHjBgQM0DDL
         fYIC3r2cu1jUFlTGIg5hGV4v5cEDcOD7rI+hr4Xfssvjy6zNzSxsJef1zAtaWGOrzRgB
         5vU6tfYBt7iTXpoYoyGWCluvJJmaex2SQuezdSrePMcasftd62w/lrPasW03tsXz4YGr
         BlR9gGnHmqyVLTdOGASGHchJHW/oyMheFCRylDkjHH35BVjzx35bkF9MvEOMOd+5hE0g
         cXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693498178; x=1694102978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4gndnGdyW9UvSj9a0oZU6PTSO1hEkDA68lCaJ4kZhM=;
        b=FSAJy5jB6ROUfMv4ySqOQLYDgf1dmZdtMs/tYLP9k9C7+ICx8feq85wpdwYLyJgDuI
         R0rey306t5NVyaODzBXX5p0GosYGhYzlX/TG5anssLK0qZnoXpuTo+BR6S4ZTtXwDhEK
         8FRXaxeOeYzQp7kowPnM6pCr/Rsceri6GvKhaqvX+fyuc9JrkBZoowtKpqrDuVvRny1z
         TOtRmp+PfVQRQ8HB680bsGxa00ONP3E1ZD3O6NMpFVIW9IgY7chJvasWyjV8rW2FC2Ca
         S/laB7AB5gAjqXgoTzz0d1FgLbf9iDU4JSQXBjUdK9W4pdpu5OkKpBIC1yqPuf5rOgtL
         n8Kw==
X-Gm-Message-State: AOJu0Yx/JjRcMC6FEnPON4lbXXq8dOYbFiL1PKfLK5As4Hv0JcxypsNT
	Q6W7OnVWXuo9VbvN1F2LdbQFpQ9B3afS/PSFQFYD2m1SmOc+Ag==
X-Google-Smtp-Source: AGHT+IGIEfb+kRy7Yx94s7WlNpp3PL03vjvzOkku/Cdb5bUOksCJwpLiiDpdPjO23YT91lm1vSAAFhx3xmN1VUw1s3w=
X-Received: by 2002:a4a:2a1c:0:b0:573:55f4:516a with SMTP id
 k28-20020a4a2a1c000000b0057355f4516amr5401629oof.3.1693498177866; Thu, 31 Aug
 2023 09:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230823085310.339821-1-tymoteusz.burak@3mdeb.com>
 <CAMKF1spPM9dRnHdyxuXbDXQn_x=uQ6b0WUGKzTaRTpfDnCP0vQ@mail.gmail.com> <ead6306d-653c-d105-5b74-4e802d22fadd@3mdeb.com>
In-Reply-To: <ead6306d-653c-d105-5b74-4e802d22fadd@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Aug 2023 09:09:11 -0700
Message-ID: <CAMKF1spC09VHNT_W+CmtH4r_W0YRK21hh3sXcnmpZ+-akJ9kfg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] libfaketime: add recipe
To: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 16:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104686

On Thu, Aug 31, 2023 at 2:35=E2=80=AFAM Tymoteusz Burak
<tymoteusz.burak@3mdeb.com> wrote:
>
> Hello everyone,
>
> I hope you're doing well. Your feedback is much appreciated, and I'd
> like to provide some context on a few matters.
>
> I understand that there's a reported Clang build failure with the patch.
> I'd like to clarify that I don't currently have Clang configured on my
> workstation, and I'm not entirely familiar with the steps required to
> address this issue. If someone could provide guidance on how to
> investigate and resolve this specific problem, I'd be grateful. The
> libfaketime recipe I submitted is from a few projects ago, and it worked
> successfully when I tested it in a fresh project environment. I aimed to
> contribute this recipe to the OpenEmbedded layer to benefit the
> community. I apologize for any inconvenience the build failure might be
> causing and appreciate your assistance in ensuring the patch's
> compatibility.

Thanks for your contribution. Although it had issues as reported, I went
ahead and fixed them myself, atleast for build matrix that I have including
clang issue. building with clang should be easier just include meta-clang
and follow the readme to enable it for your component under test.

https://github.com/yoedistro/meta-clang

obviously, it had more issues, as Martin figured out subsequently.

Usually when a patch is sent for upstream inclusion there are more
usecases users have that can bring out latent problems as seen here
I would expect you to keep this component in good shape from here
because getting it upstream is the first step, it follows up with
maintaining it in good shape for the rest of its life.

>
> ll happily review the RFC patch and adress other issues as i have to
> agree that the package name lib32-liblib32-libfaketime is quite ridiculou=
s
>
> Once again, thank you for your time and feedback. I look forward to your
> guidance and advice on how to proceed with resolving the issues raised.
>
> Best regards, Tymoteusz Burak
>
> On 8/24/23 09:54, Khem Raj wrote:
> > fails to compile with clang
> >
> > https://errors.yoctoproject.org/Errors/Details/732866/
> >
> > -Wno-nonnull-compare seems to be not a portable option
> >
> > On Wed, Aug 23, 2023 at 1:53=E2=80=AFAM Tymoteusz Burak
> > <tymoteusz.burak@3mdeb.com> wrote:
> >> This commit adds the libfaketime library recipe, which provides time
> >> manipulation capabilities for testing and debugging purposes. libfaket=
ime allows
> >> developers to modify the system time reported to applications, aiding =
in scenarios
> >> where accurate time emulation is required.
> >>
> >> I deleted the extra flags altogether as they seem to be only necessary
> >> for old versions of this project (0.9.6).
> >>
> >> CC: Khem Raj <raj.khem@gmail.com>
> >> Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> >> ---
> >>   .../libfaketime/libfaketime_0.9.10.bb         | 30 +++++++++++++++++=
++
> >>   1 file changed, 30 insertions(+)
> >>   create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime_0.9.=
10.bb
> >>
> >> diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/=
meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> >> new file mode 100644
> >> index 000000000000..7500e57658aa
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> >> @@ -0,0 +1,30 @@
> >> +DESCRIPTION =3D "A library for faking the system time in user-space p=
rograms"
> >> +SECTION =3D "libs"
> >> +LICENSE =3D "GPL-2.0-only"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
> >> +
> >> +SRCREV =3D "d475b925943ad404c6c728ac868dc73949e7281c"
> >> +SRC_URI =3D "\
> >> +    git://git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;proto=
col=3Dhttps \
> >> +    "
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +do_configure[noexec] =3D "1"
> >> +do_compile () {
> >> +    oe_runmake
> >> +}
> >> +do_install () {
> >> +    install -d ${D}${libdir}/faketime
> >> +    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
> >> +    install -d ${D}${bindir}
> >> +    install -m 0755 src/faketime ${D}${bindir}
> >> +}
> >> +
> >> +PACKAGES =3D+ "lib${PN}"
> >> +
> >> +FILES:${PN} =3D "${bindir}/faketime"
> >> +FILES:lib${PN} =3D "${libdir}/faketime/*"
> >> +
> >> +INSANE_SKIP:${PN} +=3D "dev-so"
> >> +INSANE_SKIP:lib${PN} +=3D "dev-so"
> >> --
> >> 2.41.0
> >>
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104682): https://lists.openembedded.org/g/openembedde=
d-devel/message/104682
> Mute This Topic: https://lists.openembedded.org/mt/100911255/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


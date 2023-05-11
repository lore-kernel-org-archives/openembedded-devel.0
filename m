Return-Path: <jun.nie@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534DAC7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 13:56:26 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.59923.1683813377583882622
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 06:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=AG/5xbkO;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: jun.nie@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ad819ab8a9so62789331fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683813375; x=1686405375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfwZKzpBoQWSvsAkPoiFCzdaQG/oznSeBzK9RUVoTa0=;
        b=AG/5xbkOF+3JVHLX9jJMYVcQFlcX3OlXcwTAX/BnW9Sl45lUWKMWuKOg3WV23AIbrq
         VKGO3vDtN32sKo6SfJJvRK0A8DvsyVSoJplo2op/VYd1XyN1TjIlroYLGrLJeCzNFhwP
         uf0yRnyOkHD/NWr7+AvDty/GG4f0Gneh9fh6mdS/Pm/5jM0miiSuiAzJwwgzZQB7bErH
         T+S2WdLr+u6hpxWbLqG6AemJGYE3yZ4XpE8mIVAJ2u80WOxEOrHaTUNynn5dkMhOnth0
         +ofCMZWSI69INEmCFSmcRF8O2QOJ1/5c2FMhHyFQj1FPmTUhnsnevUeZx5iRSGKE4o6O
         4ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683813375; x=1686405375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfwZKzpBoQWSvsAkPoiFCzdaQG/oznSeBzK9RUVoTa0=;
        b=XoKD76JGWBd+rWDGgQJfQG3kDxHZRMDoLIgFKJVk3H+TVSPi7Nyjm066nqT5xYk4KG
         xuA3B1kkOuh700dOpUVNFLiITvq7ziy4Vt52YDyTDHCcBOfJ01d0+MjwhievbGC6ftMu
         EF2BN3v6e6FKbhmj1WcKZ0kHEgBoCFQxfDSp7TtjTgxr+ckcfBMgBZ/6JAQp5RYBq2+y
         v1xhsMZmT7ufTzMA29q0tmamXy+TB5MdmeZRskMc3jBn068gq204J4GDPOSlry01HzFp
         uPSUy8o4VjAK8PxUGmLsk8zQZL80LHPnZlzqZ9A9B3CxynuzCdMoKVJRfai80j6Kjh8D
         xbbQ==
X-Gm-Message-State: AC+VfDy/W7iIaZcS4aBfPIYSdLbKcDYdq9DSRbedRD3anF6dXBheFtq9
	tp0dRrmVmloedE1OHF36MqsXwsp+mak2q7g82iqBKA==
X-Google-Smtp-Source: ACHHUZ6T4UWcJ4crrR9ZIKBhAw0hg8r7H6uM6Gfjp+jb/yqaCsOAgS578t3xySttItqVihQOofzpXwvBWeZljYoFs1Y=
X-Received: by 2002:a2e:7004:0:b0:2ab:365b:dc7d with SMTP id
 l4-20020a2e7004000000b002ab365bdc7dmr3119585ljc.27.1683813375220; Thu, 11 May
 2023 06:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230509065940.1584276-1-jun.nie@linaro.org> <20230509065940.1584276-2-jun.nie@linaro.org>
 <CAMKF1srFj1enrOfDR=X0Q+ue8OMKyEX8iJV_NcK6QuXoLoDOiw@mail.gmail.com>
In-Reply-To: <CAMKF1srFj1enrOfDR=X0Q+ue8OMKyEX8iJV_NcK6QuXoLoDOiw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 11 May 2023 21:58:32 +0800
Message-ID: <CABymUCNfF516hUWy9uzbUq+ih3_CNvtav-7AKSOjNnqnfvmm6A@mail.gmail.com>
Subject: Re: [meta-oe 1/3] libcbor: Add initial support
To: Khem Raj <raj.khem@gmail.com>
Cc: richard@hughsie.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 13:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102540

Khem Raj <raj.khem@gmail.com> =E4=BA=8E2023=E5=B9=B45=E6=9C=8810=E6=97=A5=
=E5=91=A8=E4=B8=89 08:28=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, May 8, 2023 at 11:58=E2=80=AFPM Jun Nie <jun.nie@linaro.org> wrot=
e:
> >
> > To handle the general-purpose schema-less binary data format
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  meta-oe/recipes-extended/libcbor/libcbor_git.bb | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100755 meta-oe/recipes-extended/libcbor/libcbor_git.bb
> >
> > diff --git a/meta-oe/recipes-extended/libcbor/libcbor_git.bb b/meta-oe/=
recipes-extended/libcbor/libcbor_git.bb
> > new file mode 100755
> > index 0000000000..53ba230533
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/libcbor/libcbor_git.bb
> > @@ -0,0 +1,13 @@
> > +SUMMARY =3D "library for CBOR"
> > +DESCRIPTION =3D " C library for parsing and generating CBOR, the gener=
al-purpose schema-less binary data format."
> > +
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D6f3b3881df62ca763a02d359=
a6e94071"
> > +
> > +SRC_URI =3D "git://github.com/PJK/libcbor.git;protocol=3Dhttps;branch=
=3Dmaster"
> > +SRCREV =3D "efa6c0886bae46bdaef9b679f61f4b9d8bc296ae"
> > +
>
> Please rename the recipe to reflect version libcbor_0.10.2.bb, you are
> using the right SHA1 for SRCREV above
>
> > +S =3D "${WORKDIR}/git"
> > +PV =3D "git${SRCPV}"
>
> Setting PV is not needed if its using a SRCREV corresponding to a release=
 tag
>
> > +
> > +inherit cmake
> > --
> > 2.34.1
> >

Thanks! Will rename the recipe and remove PV in future version.

For the "not a valid ELF file" issue, it is due to missing a CMAKE
argument. I did not find the error as
there is no issue in real use case. But dwarfdump cannot find any
information with the issue.
Is there any method to run QA test locally? Or the error notification
can be forwarded to patch owner
directly from auto-build server?

- Jun


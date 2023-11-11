Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819BCC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 19:01:46 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.1879.1699729300318727451
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 11:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EEeOt+Rs;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5845a94dae1so1590079eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 11:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699729299; x=1700334099; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMh979ke0vYGXbmy+EnzRM46BBD1WmU5LJE6maNhsZw=;
        b=EEeOt+RsjrnUb8z8R2cdR4ogvaSB8EBGTJQsO9UrVpqTNe6Qb4HUurR7NQvxYR+ewg
         Bn3Fc5DcVxmQjWygsmBLY7DUqoQ08nkv/TEdli0IMznRGh8Z5r999i6OlQEXu9J5M2XB
         FQ9IZ0W6RSlfEKd2HAKps0Py+ov2mv7AE+ObU50Jsxv+2OIL45FphfNTOeRfN7ol+Obs
         QDdGcGpQqAj7C8GQZtd4BfvyZWPBbNhg4IPnjIgIziorypZq6JghEf0P/torFnKSFdSL
         C4x+kyB5USpkZcp67TGd6oUZmSbRCCppjSIUJ7qISZzjiS8TiuwQ4A44bodquiZG3H69
         EAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699729299; x=1700334099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMh979ke0vYGXbmy+EnzRM46BBD1WmU5LJE6maNhsZw=;
        b=R6dbGePqLuEsLbfvP4O54agKlFNf0Kk6/AAXtB/R6APwI7H+HJ8vKhXgfqsGuiJ/LV
         w9RqAcpiOWPZTOS5qr4dMD/fUGhVCW1H9ht3hXWrT4jiSEz4XNlblSIU2GSWIL+Tz7KL
         QDWgOVVipDAQFqYtra+xITHDd9LLhDQFGYeS5dGmOlZCUKHpUW50rus5QuHnzBSl+KBF
         5A1HteGLkopG/7HvEyfDvsl5tJTHhMmSHTzllIzZCqItrGn1izepYOBcwepidSUNzQiG
         +xaaEqS8ZR969hbfNkjHvK+irB1BqKUREwcVPlq9qnPetshbrfGbnX1HOgUo+8QHB35I
         5uNg==
X-Gm-Message-State: AOJu0Yz68m3s2G2nmAOiXzedbFdpwypozftjoG+p6YqqmOlyhLVYYrRL
	v9q4RTNmTP2+y8clMuZV2iSch0XstyQb/kEIIqDjlwTURms=
X-Google-Smtp-Source: AGHT+IHJoIVbnoVwZ0whbVBG1j5+B/PY7c3eFiTMS9+/Rzo/Sjn37Et+1TvwrIpoNLPUEyKhZ4KAuv4Id4AchdCjLDM=
X-Received: by 2002:a05:6870:d86:b0:1ef:b0b6:7e14 with SMTP id
 mj6-20020a0568700d8600b001efb0b67e14mr1295906oab.10.1699729299534; Sat, 11
 Nov 2023 11:01:39 -0800 (PST)
MIME-Version: 1.0
References: <73831758-7C17-4540-AD08-572959D92E0E@getmailspring.com> <10AB6CF7-A6FF-435A-A35A-A2A35560F6BD@getmailspring.com>
In-Reply-To: <10AB6CF7-A6FF-435A-A35A-A2A35560F6BD@getmailspring.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Nov 2023 11:01:13 -0800
Message-ID: <CAMKF1sq718EwKbfEdWgGfZQq+2kRJCPaepp4aY9XsMXKckHQjw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 19:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106566

On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@w=
eb.de> wrote:
>
> It also needs a utf-8 locale to work. Else you have to force utf-8 mode w=
ith a flag. I haven't included this as dependency at this point.

you want to express all that is needed to get it running amicably.
keeping in mind that we have glibc and musl based systems to service
it will be good to check it on musl too.

>
> On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10@web.de> wro=
te:
>
> Glad that it arrived now! This is a really great resource monitor. It is =
building from the git repository. Do you think it is better to use the rele=
ase instead?
>
> On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem@gmail.com> wrote:
>
> Thanks for your contribution Jan
>
> On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10=
@web.de> wrote:
> >
> > ---
> > meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 +++++++++++++++++++++
> > 1 file changed, 23 insertions(+)
> > create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb
> >
> > diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/reci=
pes-support/btop/btop_1.2.13.bb
> > new file mode 100644
> > index 000000000..f780a993a
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > @@ -0,0 +1,23 @@
> > +SUMMARY =3D "Resource monitor that shows usage and stats for processor=
, memory, disks, network and processes."
> > +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> > +SECTION =3D "console/utils"
> > +
> > +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;b=
ranch=3Dmain"
> > +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
> > +FILES:${PN} +=3D " \
> > + /usr/share/icons \
>
> Lets use ${datadir} instead of hardcoded /usr/share
>
> > + /usr/share/icons/hicolor \
> > + /usr/share/icons/hicolor/48x48 \
> > + /usr/share/icons/hicolor/scalable \
> > + /usr/share/icons/hicolor/48x48/apps \
> > + /usr/share/icons/hicolor/48x48/apps/btop.png \
> > + /usr/share/icons/hicolor/scalable/apps \
> > + /usr/share/icons/hicolor/scalable/apps/btop.svg \
> > +"
> > --
> > 2.42.0
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#106559): https://lists.openembedded.org/g/openembed=
ded-devel/message/106559
> > Mute This Topic: https://lists.openembedded.org/mt/102530478/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F29DC7EE22
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 00:40:26 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.5554.1683679224111269040
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 17:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=L8yOFztU;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3942cd86697so23716b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 17:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683679223; x=1686271223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB2OJRZpMF0jjg35R5Fo17uJ8ajjO0PaxneSjdPkvSM=;
        b=L8yOFztUjjPfw3BKnOQ+gvXixJS02036wT3C/Ccs/FlTt4IzFiE5UnlXZ/PGI17laB
         wlyMYMzt62B77zKUswP89nKGaPWfVJzmPBnqxh+NaSyRShhAbmYM8rgMc3YQA922pP8x
         DhiWCYSayt5D4uvpYiK7iq/z+wL7Xkc75FKjonMf5C0/BC8TsdLd6hDcGgrAX9NkC6F1
         V1ufWuLiykkTL4ANpPpNAHENI579mfSymYFgHfKjwsxKhZUrTWvQ1jH21o2q1F0iQIyn
         D0vUligM7le7qtusCZ7fIND3bdag+rylqtf/vk9POow8GehpvVnp7iMEKilPfou1EfRM
         IsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683679223; x=1686271223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RB2OJRZpMF0jjg35R5Fo17uJ8ajjO0PaxneSjdPkvSM=;
        b=TJgx2tRzWMoHRbjA9ctSgYbA9qN8cOfBnmkiwXaJbFbakd0zq5I9SCpwSSgAFCJa+K
         yVGaxhAS7GgEinlVdnyQVXuVDccZlwx1aBw+jBfT+5uUIh8t2ZVXZ5f1M31oeN8UVgnx
         IaH4ytjXXKf9yLJj1hm3oEPLOuKld+6wl2nEPRpKjDVyYbOuTRHbGG0fzjmjCsaLwmmn
         7w3sofDIM5/C9iBH19XLEJHbHcf2zeHPNr9lhNdeEBHV6L4Wck89YMlIVbkuWN6hGTLN
         v7FIKEQSiLfs4DLIOyicWQJPVvcvfic2OxRC35YTs77U0qwPCZq45J4EClA6QVDOFzDX
         ohvw==
X-Gm-Message-State: AC+VfDzjAKcjdlp0l281uMmZZ+6XL+uAF6b7MI2ocKSaXknJAzQCxoxK
	sU82qQKVYC+/buk/1Mq0/0nKkmT7pMlUl5P77og=
X-Google-Smtp-Source: ACHHUZ7fBa1c4S8jWBXJjPqvDS5sz4NfS843FANSZ8DJ2vq8mZWIqT0hw7OsU2SGRethJdHeZJmoEhrl7xCqJbnAjK8=
X-Received: by 2002:a05:6808:492:b0:394:1c4e:b543 with SMTP id
 z18-20020a056808049200b003941c4eb543mr1383696oid.11.1683679223200; Tue, 09
 May 2023 17:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230509065940.1584276-1-jun.nie@linaro.org> <20230509065940.1584276-2-jun.nie@linaro.org>
 <CAMKF1srFj1enrOfDR=X0Q+ue8OMKyEX8iJV_NcK6QuXoLoDOiw@mail.gmail.com>
In-Reply-To: <CAMKF1srFj1enrOfDR=X0Q+ue8OMKyEX8iJV_NcK6QuXoLoDOiw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 May 2023 17:39:57 -0700
Message-ID: <CAMKF1sqiCYH5rf=5wFtct5QL2bHDtnq9HV+4i4CrYoeY3MO40w@mail.gmail.com>
Subject: Re: [meta-oe 1/3] libcbor: Add initial support
To: Jun Nie <jun.nie@linaro.org>
Cc: richard@hughsie.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 00:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102521

more errors in build QA

ERROR: libcbor-gitAUTOINC+efa6c0886b-r0 do_package: dwarfsrcfiles
failed with exit code 1 (cmd was ['dwarfsrcfiles',
'/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libcbor/gitAUTOIN=
C+efa6c0886b-r0
       /package/usr/lib/libcbor.a']):
  dwarfsrcfiles:
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libcbor/gitAUTOINC=
+efa6c0886b-r0/package/usr/lib/libcbor.a:
not a valid ELF file

On Tue, May 9, 2023 at 5:27=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
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


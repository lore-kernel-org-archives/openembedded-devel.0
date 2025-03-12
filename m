Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B55C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 07:13:37 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.31014.1741763608343875768
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 00:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IhvudAWm;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f6ab1b8fc1so2467365b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 00:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741763607; x=1742368407; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keOKR+/mMOTpPFfZzOnkRkmtnLTyKAvyonDM+7Up0oY=;
        b=IhvudAWmvIIYP/QQR4/1ISFRRWPB/7G2dQbGp2HyvBy8jPx/jY7QqHNR7P/lmLrlvj
         6orkSHrcisPcuOLmiiz0G0cUVTHvSDuV6Jxk65DQVqsft1p4+eiK2uwvfUcYOmGUBdvu
         H9LACqZbtn8AJ4FgYXTUSvjDKhvLR1Z3y36/qsJoJVb6akfr/Ui5r/f7EMFUNJf0V9Q3
         bT6KxG0aJH5oM9l6WHt3pqKyP7aLYzuzfiCQzsseUdKd4TD1NeRa0e4PSgBnlv9lm6jv
         q5UaQUi9CWCjF1CoYiQIuhzDFl3AzhooJ8w7Sq3pTG6szHthpsOEAcz3siNAe2DUnw9Q
         CsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741763607; x=1742368407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keOKR+/mMOTpPFfZzOnkRkmtnLTyKAvyonDM+7Up0oY=;
        b=KTxLE94KaGGcjU3zN+1m/4xZ55h+fG6UVQ6xWkERB05YoxfTsJzv3TGwbfzzji23TB
         usP4I4RR5iF3X6j34Uu/+A39+qlUJjQTbwHJA3BPY8QEZtN02KvsA4fQGcAfdMpOx2VC
         lD+vH3V+YSS6xRVJgZ8sWyom11+eIgsN+j9iA7dvJLosyfpQCBewCZxy2+Ty0x+x8nb8
         IEzubhLtETPfwmXGp+Q3ITfGsZItpk13MVHxRRkjdlSz85dWTN5jnEXYhavTI8Ebw/au
         wX0fZm2qYhmMqlxIVWA1jHiGmgOTAyMor2mwt0QZm24nMdlY0e9vUvYkPc/q2MnU/IEo
         XgqA==
X-Forwarded-Encrypted: i=1; AJvYcCV9nb+cUu1YXOE6QG1hDchRqyryfkh7lMq6wQgGqN0g7k+zm1AwiiznAiaBNWiuEZsRlXRPoMT2auXKWVkYueg3o2o=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxk1Egymw+RrPbZQO4DohPKMzrrOuntFV3ZSAiTfMtGMV0x8A3K
	WrpGCgr+QpJzsovJRzNSmfq7mWQgtBihDp8n27LQSmxCboarnnKpEOODWBFzSUp6XqTdr+qFL7v
	GKKwCgnyTBuJ2HlnE2YbSmlCMqcg=
X-Gm-Gg: ASbGncuVkuLOpBoLybvo617tMADaIjNOz8EvHk3sWB5wcd9zuYfCsA5dDjJjAv91+Z+
	KXxrbLoRN06Sim/fm9rDXo/xy52kFHOb4hiwbYLUqt2g46Q+IpBsguvUhAbGXia5ho74Ve4qfqn
	gtm13Tz2sWivLU5VRcfX1wttzt
X-Google-Smtp-Source: AGHT+IHECeTnLhhxeHhYXJj9XUEhCMgFKKXQ5riP8Pd/jJb8YrDLf+p3XvBpodFMBLjYQSbDbTj/tI78ryHDkFsHH7g=
X-Received: by 2002:a05:6808:191d:b0:3fb:177e:f987 with SMTP id
 5614622812f47-3fb177efb30mr2279021b6e.20.1741763607443; Wed, 12 Mar 2025
 00:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250312033439.2958141-1-mingli.yu@eng.windriver.com>
 <CAMKF1srf3Gs+TesLXd=oC-pL95SQq5-UBP5HREWcmaicM1N3=Q@mail.gmail.com> <95e9c398-375c-4862-8c76-5122424c853e@windriver.com>
In-Reply-To: <95e9c398-375c-4862-8c76-5122424c853e@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Mar 2025 00:13:01 -0700
X-Gm-Features: AQ5f1Jox6PFHfjdWyWgIe9Csu2PIFpVNJAKb5sYC8vvw3TLe3bkoLgIpGmJkNwI
Message-ID: <CAMKF1sp-ME40FKm+eMBhkvNhHY_FZWyiVQtdSuMnthp_Cv8=Gg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] minizip: Add new recipe
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: mingli.yu@eng.windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 07:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115911

On Tue, Mar 11, 2025 at 10:37=E2=80=AFPM Yu, Mingli <mingli.yu@windriver.co=
m> wrote:
>
> Hi Khem,
>
> On 3/12/25 11:45, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > its in meta-qt6, why do we want to promote it here into meta-oe ?
>
> Sorry for the noise!
>
> Adding the minizip recipe to a common layer such as meta-openembedded
> may be convenient for user who don't want to depend on other layer such
> as meta-qt6(https://code.qt.io/cgit/yocto/meta-qt6.git/).

Are there use cases where more than meta-qt6 needs it ?
that's what I am looking for

>
> Thanks,
> Mingli
>
> >
> > On Tue, Mar 11, 2025 at 8:34=E2=80=AFPM Yu, Mingli via lists.openembedd=
ed.org
> > <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
> >>
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> minizip [1] uses zlib [2] to support compressed archives.
> >>
> >> minizip is not part of zlib, but is included in the zlib
> >> distribution [1] as a third-party contribution in the contrib
> >> directory.
> >>
> >> [1] https://github.com/madler/zlib/tree/master/contrib/minizip
> >> [2] https://github.com/madler/zlib/tree/master
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   meta-oe/recipes-core/minizip/minizip_1.3.1.bb | 23 +++++++++++++++++=
++
> >>   1 file changed, 23 insertions(+)
> >>   create mode 100644 meta-oe/recipes-core/minizip/minizip_1.3.1.bb
> >>
> >> diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb b/meta-oe/r=
ecipes-core/minizip/minizip_1.3.1.bb
> >> new file mode 100644
> >> index 0000000000..c9c92ad6bd
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
> >> @@ -0,0 +1,23 @@
> >> +SUMMARY =3D "Minizip Compression Library"
> >> +DESCRIPTION =3D "Minizip is a general-purpose, patent-free, lossless =
data compression \
> >> +library which is used by many different programs."
> >> +HOMEPAGE =3D "http://www.winimage.com/zLibDll/minizip.html"
> >> +SECTION =3D "libs"
> >> +LICENSE =3D "Zlib"
> >> +LIC_FILES_CHKSUM =3D "file://zip.h;beginline=3D14;endline=3D30;md5=3D=
8eaa8535a3a1a2296b303f40f75385e7"
> >> +
> >> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/libpng/zlib/${PV}/zlib-${PV}.tar.g=
z"
> >> +UPSTREAM_CHECK_URI =3D "http://zlib.net/"
> >> +
> >> +S =3D "${WORKDIR}/zlib-${PV}/contrib/minizip"
> >> +
> >> +SRC_URI[sha256sum] =3D "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585=
b91eefb60f03b72df23"
> >> +
> >> +PACKAGECONFIG ??=3D "demos"
> >> +PACKAGECONFIG[demos] =3D "--enable-demos=3Dyes,,,"
> >> +
> >> +DEPENDS =3D "zlib"
> >> +
> >> +inherit autotools
> >> +
> >> +BBCLASSEXTEND =3D "native nativesdk"
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#115908): https://lists.openembedded.org/g/openembe=
dded-devel/message/115908
> >> Mute This Topic: https://lists.openembedded.org/mt/111654243/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>


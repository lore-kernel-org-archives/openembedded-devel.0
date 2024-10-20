Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2B3D3C92E
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 01:38:17 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.17659.1729388291244797342
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Oct 2024 18:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gaAwaJFz;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5eb5ea185daso1598009eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Oct 2024 18:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729388290; x=1729993090; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HEtvOCFT2Q3l1dKjEdmlAx9Ya/wGLFWCIrjIEXeYc0=;
        b=gaAwaJFzMb0yazICTzk47tKEV1+eUBbxRo7SqImy2XEqPf8t3OiTJXggvW+xrjSM87
         kWCWen7SZzU0sSiHg2Of9fABZYyGSRpAGanrPO7wSjded3li/+Psiv1tFGRhMaglFo8r
         OGuGkewrcvE7xA+EZuXHvylyLvNerfmi0/HDLapQyBDm3YchyVRicac0PXCQNvbPoCXY
         XwY5GXrQJWYehpB9NUtUC5dGZmtkzI8gkOQlJLEVC7cs+/rUxnffne4+s8Vs8g9D+ZwQ
         mFVDBGtUOSLA+QcsylJPUtDH+FXD7Yx9iadt0r1eWvlXT6mn5lfMCk94y6Cs43AbXVOF
         fFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729388290; x=1729993090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HEtvOCFT2Q3l1dKjEdmlAx9Ya/wGLFWCIrjIEXeYc0=;
        b=eEyeHdaDUyqJgsesHFUbNVfz9D3/BTitNuIba301bucnhu4Kd0ie4egF+uoVcYE4Qj
         G6Yo+z1COfcFkjxuD3hlqbf7d9loo95sYeJ8vpmTdylwFXszlpha4lE3YTQEBZePClv/
         5HEc3q4hSsoY/mKD/BaZ33/4gawi8XLEeppuOXUKfad1xBVT/RBVukIWNgtIWoIQajjZ
         qlvuUyM+Sea4utuxdFUoL4vNoMjS2NvHPEEmW/KkUoTMtrfNs8VFGrGKsgsdtVJSUz4j
         712LQMFj55RCxeL/x7E+JGhDeAAPQwCC05Cg7pqOGE64A6T+FtalSmfFejF6hCgMs3pJ
         m+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjWWuUdAny/FdwSEB9ZjGrzrETcRVNEboz8RZlOqrMYa1BgNBfcgVvVh7ItZrO99X2ZmCnFx00LdPlkd5tTnJgHdQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxKM9Y8g+djOwfAzsaGKnHO/4SuMNv/BlECFc9gqNnAnIEjtDhb
	RzVwPAFFPqvSTHMyf5bLTaedUBgm9tyY+Z0XDQaUgby9yYI8UlGNQKXMbarpvy+yCXIO4mff88H
	VPZ0wP+6X1LPnz2kE353fo23vJlM=
X-Google-Smtp-Source: AGHT+IGqUhLQ7+Chu/5BqwUc3Wc7f01J8Vyljw3tD59iwxZjIaUOZkIHBWq4lLssIt+1N7/U4+SSWuXKnZqtrUrVjJw=
X-Received: by 2002:a05:6820:1ad1:b0:5eb:821c:df26 with SMTP id
 006d021491bc7-5eb8b6e5aadmr5174230eaf.8.1729388290442; Sat, 19 Oct 2024
 18:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241019153231.175637-1-sanakazi720@gmail.com>
 <CAMKF1sqjGTMz5Fg1BvCdi5q_w13Xwq+S8d-RQxCa1Nv_RMPwSg@mail.gmail.com> <DB5PR02MB10213E1EE7E1C25B27E7CBCBFEF422@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213E1EE7E1C25B27E7CBCBFEF422@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Oct 2024 18:37:44 -0700
Message-ID: <CAMKF1sr5coTvJ4KvGbq97RMmH9qnvAjmO=aoCHRFB1yZd-wJSg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] configure: treat all openssl-3.x
 releases the same
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "sanakazi720@gmail.com" <sanakazi720@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 01:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113063

right and its also needed on master I believe since we have the same
version for libp11 in master too. In that case please send it for
master first after testing it
once its merged in master then send a backport request for scarthgap.

On Sat, Oct 19, 2024 at 6:15=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 19 oktober 2024 18:17
> > To: sanakazi720@gmail.com
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][scarthgap][PATCH] configure: treat all open=
ssl-3.x releases the same
>
> The subject prefix should be "libp11" rather than "configure".
>
> //Peter
>
> >
> > Thanks for fixing it. I would like to suggest couple of things
> >
> > 1. Use patch version number when its reworked and sent again v1, v2, v3
> >
> > and in the trailer document changes between versions, it helps
> > reviewers with context between two patch versions.
> > eg. see https://www.kernel.org/doc/html/v4.14/process/submitting-patche=
s.html#the-canonical-patch-format
> >
> > On Sat, Oct 19, 2024 at 9:10=E2=80=AFAM Sana Kazi via lists.openembedde=
d.org <sanakazi720=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > OpenSSL's soversion will not change for any 3.x minor release.
> > >
> > > https://www.openssl.org/policies/general/versioning-policy.html
> > >
> > > Signed-off-by: Sana <sanakazi720@gmail.com>
> > > ---
> > >  .../0002-detect-correct-openssl-3.x.patch     | 28 +++++++++++++++++=
++
> > >  .../recipes-support/libp11/libp11_0.4.12.bb   |  4 ++-
> > >  2 files changed, 31 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta-oe/recipes-support/libp11/files/0002-detect-=
correct-openssl-3.x.patch
> > >
> > > diff --git a/meta-oe/recipes-support/libp11/files/0002-detect-correct=
-openssl-3.x.patch b/meta-oe/recipes-support/libp11/files/0002-detect-corre=
ct-openssl-3.x.patch
> > > new file mode 100644
> > > index 000000000..b56e2602d
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/libp11/files/0002-detect-correct-openss=
l-3.x.patch
> > > @@ -0,0 +1,28 @@
> > > +From 74497e0fa5b69b15790d6697e1ebce13af842d4c Mon Sep 17 00:00:00 20=
01
> > > +From: Mike Gilbert <floppym@gentoo.org>
> > > +Date: Thu, 13 Jul 2023 13:52:54 -0400
> > > +Subject: [PATCH] configure: treat all openssl-3.x releases the same
> > > +
> > > +OpenSSL's soversion will not change for any 3.x minor release.
> > > +
> > > +https://www.openssl.org/policies/general/versioning-policy.html
> > > +---
> > > + configure.ac | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +Upstream-Status: Backport [https://github.com/OpenSC/libp11/commit/7=
4497e0fa5b69b15790d6697e1ebce13af842d4c.patch]
> > > +Signed-off-by: Sana Kazi sana.kazi@kpit.com
> > > +
> > > +diff --git a/configure.ac b/configure.ac
> > > +index b96979d9..c344e84a 100644
> > > +--- a/configure.ac
> > > ++++ b/configure.ac
> > > +@@ -33,7 +33,7 @@ AC_C_BIGENDIAN
> > > + # issues with applications linking to new openssl, old libp11, and =
vice versa
> > > + case "`$PKG_CONFIG --modversion --silence-errors libcrypto || \
> > > +        $PKG_CONFIG --modversion openssl`" in
> > > +-       3.0.*) # Predicted engines directory prefix for OpenSSL 3.x
> > > ++       3.*) # Predicted engines directory prefix for OpenSSL 3.x
> > > +            LIBP11_LT_OLDEST=3D"3"
> > > +            debian_ssl_prefix=3D"openssl-3.0.0";;
> > > +        1.1.*) # Predicted engines directory prefix for OpenSSL 1.1.=
x
> > > diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb b/meta-o=
e/recipes-support/libp11/libp11_0.4.12.bb
> > > index 223778200..87b26bf01 100644
> > > --- a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
> > > +++ b/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
> > > @@ -9,7 +9,9 @@ LICENSE =3D "LGPL-2.0-or-later"
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfad9b3332be894bab9bc50157=
2864b29"
> > >  DEPENDS =3D "libtool openssl"
> > >
> > > -SRC_URI =3D "git://github.com/OpenSC/libp11.git;branch=3Dmaster;prot=
ocol=3Dhttps"
> > > +SRC_URI =3D "git://github.com/OpenSC/libp11.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> > > +    file://0002-detect-correct-openssl-3.x.patch \
> > > +"
> > >  SRCREV =3D "53d65dc48cf436694f7edcfc805414e608e8a2bf"
> > >
> > >  UPSTREAM_CHECK_GITTAGREGEX =3D "libp11-(?P<pver>\d+(\.\d+)+)"
> > > --
> > > 2.25.1
>


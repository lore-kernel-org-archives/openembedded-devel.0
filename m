Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C0DC25B75
	for <webhook@archiver.kernel.org>; Sun, 19 May 2024 15:31:59 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.41150.1716132709899587712
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 May 2024 08:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mLPVVonN;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c9cc66c649so1261899b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 May 2024 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716132709; x=1716737509; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYLib8tH+aIVEV2rGZhGoO9pOJx34w8JHXzb1lW4yOc=;
        b=mLPVVonN4PKVWGSVSN5XC11NbzYAAlV6RXh3OrEJ/qLnGROf9RT+h+gwrVMKWUrJw9
         2CleGRJsYv+fqA3TeHrBJPMonHyfAra4an9X5BUzsECS8MEshW1NgMWxyCcYcVE8966K
         O10nOl9MuMbcg3Edx37KJgv/7NOHEeInPu5c+kUpdjR/vIXFN41WbhYtBRW6kvIA5Qhq
         W2wM8UXbDJu4hdc+t8pFHxBCV5k1HVAo3aj6Oc7GZWfu4OzK/rLZ7DMeUchnlpD/mA/7
         wBsa4RjFAY/GwYAt3Zf8DPfMy1Ek87MAQZAsLLJli8MJgV5PheLrBqPJrzcoVzpvEVSo
         2Qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716132709; x=1716737509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYLib8tH+aIVEV2rGZhGoO9pOJx34w8JHXzb1lW4yOc=;
        b=UIKF7AcTciOkLtRloZAJ+ALlWQ9m4urT9kei962bTbvhwJ64TfRzRcRTrCfE0cyPZO
         ieitMzudgVPSdeUx4MVJkSGrqp89MiiIFZybZvHCyq5vxIKcZL5QLa0yBM2CKZZDlWYk
         L+UiGL7rzv4P4o/BKUUK7mSI6N5SGONGJaAcLmemw4XR9V6OQXNS5CM+7a+6Lo2fQDIM
         YlUegtIGsFeZAlbxjn6/3JZDMMjYD7Y1kLUjCHHXoFWhiEcNg4wyKLJxVWvuVVw9pQxY
         /fAbetWfVfbxJTFxHJgli7TCH95YzulFExDRM852zI9uti39fKcPZfvJ2TDRLTkEOiLA
         IHgw==
X-Forwarded-Encrypted: i=1; AJvYcCUqT8Q+LKbNtQCZi+USmzbLdgWVmTYEbWEtRczXqjyGHzUIXMCctj9TjHSZVqt7JTEeplTLjy1AgeP4Y9SfKPBHCbYpxWJRjrb/EltW559genT3ZPbs0HtKkw==
X-Gm-Message-State: AOJu0Yw6/F84+eoRfMwin6YfeY/78H6Fzgn0RbopU1tAH4j7EhWnV8s7
	zu8ngw1HfWIA9noyShwPYeUu0xZ9Sojb7XoLEqBy1Ir4SSQNEFxEO4xEOZL3aEfKvnyKlZpXOMM
	ielOegurg0j5xUg03AAW/1dhCBwg=
X-Google-Smtp-Source: AGHT+IFPzxrT+y/auw4QaPitBGH0sf3zPKXl0WMQLanuoBFRYcLcbMNqfzOs39HDJNtUHnExYauZZH9mrTYGSKPW+VI=
X-Received: by 2002:a05:6871:7a81:b0:233:3734:e645 with SMTP id
 586e51a60fabf-24172fd7f3bmr30790365fac.59.1716132708971; Sun, 19 May 2024
 08:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240517130700.16442-1-alexandre.truong@smile.fr> <CA+chaQdyBMUhKLbHYbYWRy=yB=Oh+ruarj+_i=azyyyvAB_e6A@mail.gmail.com>
In-Reply-To: <CA+chaQdyBMUhKLbHYbYWRy=yB=Oh+ruarj+_i=azyyyvAB_e6A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 May 2024 08:31:22 -0700
Message-ID: <CAMKF1srdgGKRcT-YCuBufJjrUNbuzZYjxvXAPHnE_07QxLR3MQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] source-han-sans-*-fonts: fix SRC_URI
To: martin.jansa@gmail.com
Cc: alexandre.truong@smile.fr, openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 May 2024 15:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110436

On Sat, May 18, 2024 at 1:22=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Fri, May 17, 2024 at 3:07=E2=80=AFPM Alexandre Truong via
> lists.openembedded.org
> <alexandre.truong=3Dsmile.fr@lists.openembedded.org> wrote:
> >
> > We get fetch errors from the SRC_URI provided. See errors at [0].
> > svn protocol was used but it's deprecated.
>
> For the record the svn protocol itself isn't deprecated in bitbake
> fetcher, just github no longer provides a svn access as mentioned in:
> https://git.openembedded.org/bitbake/commit/?h=3Dmaster&id=3Da735898abcf0=
56f897c9350bb128a5637e6b4617
>
> * github no longer provides support for subversion clients:
> https://docs.github.com/en/enterprise-server@3.11/get-started/working-wit=
h-subversion-on-github/support-for-subversion-clients
> it was shut down on 2024-01-08:
> https://github.blog/2023-01-20-sunsetting-subversion-support/
>

Thanks for adding to information, I have added Martin's comments into
  commit msg on staged patch in master-next

  Thanks
  -Khem

> > So, a http url will be passed instead.
> >
> > The sha256sum has also been changed since the previous one was
> > for the 1.004 release's archive, while we are on 2.004.
> >
> > [0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds=
/353/steps/16/logs/errors
> >
> > Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> > Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb            | 7 ++-----
> >  .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb            | 7 ++-----
> >  .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb            | 7 ++-----
> >  .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb            | 7 ++-----
> >  4 files changed, 8 insertions(+), 20 deletions(-)
> >
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-font=
s_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.=
004.bb
> > index b4a598527..391d46557 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004=
.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004=
.bb
> > @@ -11,13 +11,10 @@ inherit allarch fontcache
> >  #EXCLUDE_FROM_WORLD =3D "1"
> >
> >  SRC_URI =3D " \
> > -    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/rel=
ease/SubsetOTF/CN;protocol=3Dhttp;rev=3D82 \
> > +    https://github.com/adobe-fonts/source-han-sans/releases/download/2=
.004R/SourceHanSansCN.zip;subdir=3D${BP} \
> >      file://44-source-han-sans-cn.conf \
> >  "
> > -SRC_URI[md5sum] =3D "d16abc21f6575bb08894efedbed484a2"
> > -SRC_URI[sha256sum] =3D "0a0e1d8e52833bc352d454d8242da03b82c0efc41323fb=
66f7435e5b39734a4f"
> > -
> > -S =3D "${WORKDIR}/SourceHanSansCN"
> > +SRC_URI[sha256sum] =3D "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c070=
347a2b2b200a1db4d6"
> >
> >  do_install() {
> >      install -d ${D}${sysconfdir}/fonts/conf.d/
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-font=
s_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.=
004.bb
> > index 6a4509048..f940478a8 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004=
.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004=
.bb
> > @@ -11,13 +11,10 @@ inherit allarch fontcache
> >  #EXCLUDE_FROM_WORLD =3D "1"
> >
> >  SRC_URI =3D " \
> > -    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/rel=
ease/SubsetOTF/JP;protocol=3Dhttp;rev=3D82 \
> > +    https://github.com/adobe-fonts/source-han-sans/releases/download/2=
.004R/SourceHanSansJP.zip;subdir=3D${BP} \
> >      file://44-source-han-sans-jp.conf \
> >  "
> > -SRC_URI[md5sum] =3D "908fbf97f3df04a6838708c093f1e900"
> > -SRC_URI[sha256sum] =3D "dc6dbae3fba35f220bac88ba7130b826c7efe1282f4727=
88fae3628b79be3f54"
> > -
> > -S =3D "${WORKDIR}/SourceHanSansJP"
> > +SRC_URI[sha256sum] =3D "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a67=
8c644cf9802750c17e"
> >
> >  do_install() {
> >      install -d ${D}${sysconfdir}/fonts/conf.d/
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-font=
s_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.=
004.bb
> > index 5ab5057d8..f536d1b61 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004=
.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004=
.bb
> > @@ -11,13 +11,10 @@ inherit allarch fontcache
> >  #EXCLUDE_FROM_WORLD =3D "1"
> >
> >  SRC_URI =3D " \
> > -    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/rel=
ease/SubsetOTF/TW;protocol=3Dhttp;rev=3D82 \
> > +    https://github.com/adobe-fonts/source-han-sans/releases/download/2=
.004R/SourceHanSansKR.zip;subdir=3D${BP} \
> >      file://44-source-han-sans-kr.conf \
> >  "
> > -SRC_URI[md5sum] =3D "f8d1bd6c87d8575afdb25e2f46bd81d4"
> > -SRC_URI[sha256sum] =3D "38fd15c80f9980492faaa1af39ff873d8a38e45027023f=
b17d5b10d4b4b0e6af"
> > -
> > -S =3D "${WORKDIR}/SourceHanSansKR"
> > +SRC_URI[sha256sum] =3D "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e=
79f076f10a6a8f4bfe"
> >
> >  do_install() {
> >      install -d ${D}${sysconfdir}/fonts/conf.d/
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-font=
s_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.=
004.bb
> > index a2b3fff07..0a4aff5e3 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004=
.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004=
.bb
> > @@ -11,13 +11,10 @@ inherit allarch fontcache
> >  #EXCLUDE_FROM_WORLD =3D "1"
> >
> >  SRC_URI =3D " \
> > -    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/rel=
ease/SubsetOTF/TW;protocol=3Dhttp;rev=3D82 \
> > +    https://github.com/adobe-fonts/source-han-sans/releases/download/2=
.004R/SourceHanSansTW.zip;subdir=3D${BP} \
> >      file://44-source-han-sans-tw.conf \
> >  "
> > -SRC_URI[md5sum] =3D "6533b71b31c19e548768f0fc963202f3"
> > -SRC_URI[sha256sum] =3D "92ba161921c5cdec5a8f8d5711676f0865b50cee071c25=
eb4bd4125b5af59fd0"
> > -
> > -S =3D "${WORKDIR}/SourceHanSansTW"
> > +SRC_URI[sha256sum] =3D "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d6=
8c8638e6ba170de806"
> >
> >  do_install() {
> >      install -d ${D}${sysconfdir}/fonts/conf.d/
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110434): https://lists.openembedded.org/g/openembedde=
d-devel/message/110434
> Mute This Topic: https://lists.openembedded.org/mt/106153340/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


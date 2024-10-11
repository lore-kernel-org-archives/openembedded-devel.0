Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9901BD0EE19
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 16:40:21 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.16763.1728664821126133521
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 09:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBvUGfgF;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5e7f551113dso994836eaf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 09:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728664820; x=1729269620; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHtINWvC/ZkmN8TRU692VI+87+FTARYdGlfimtdF/7s=;
        b=LBvUGfgFxyBKD+lFgF+5JIk1ZPDyB4RQK9IzI0QLBFV2HZrGzF0GhoumXd1Hvslt0R
         MFkzNu1RzZ/9rjXReXE5nAPjcrGoBN3nVpfs79CTireqHv92Yr+v7wxMNyGw6/6grlYl
         r+rCht2Er8xIRSF1pvEDnJ5nxuG7dwWG4rb4w758RIxsloXs/R10tnLB9Kzo20yM+1vH
         nb93UcmI49MhY2YjDQgteeoYmMRLUarHMT6XdvvfrZvLHs7QeERpUPE2Umrdq1ptblCf
         sskMN3Q0Tr8NLQKIeQt3I1k7s/9YJWyLpHSM6x/1azAWLLU1xK09+XviUqusVmWNB7sT
         NT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728664820; x=1729269620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHtINWvC/ZkmN8TRU692VI+87+FTARYdGlfimtdF/7s=;
        b=RDtowzMIBIHZNOsVPN2ASdHnmBKWzyD4N6SPQH3KZbKwvE5hGyMeubV4EbcgKl+FFZ
         G+5ezqP0k6sD5EUDpjhB2eGsMM/u8G5EacxhjCiyfgFzHVf/j0Ky0VsiG+fl0yK4Eipg
         rHs/HidsZxtORedrVXWXBxorbikbZhSNeN+haPoY5wm/dlsx1hn/KT3faJu0igvwVgA+
         6yDnZXpL9PEOdbGACXELDRSxlSy9utPo4Yga5cP15H4/CE0x4C5jclLHQWE++uUP5iTH
         upSNTl8ybFLD7l2+zyKxFc4iQW2zP7/mxyEyhK0ZYzHViJEkqYrYgQkP+Nlq25CoVUyq
         ERXQ==
X-Gm-Message-State: AOJu0YwsiYgfYRnO9ycNbKC6uAZPJ0fUw+pDeGR3eIDUqeuLYYt9uICr
	3a+vOYNwloAHlnOIl0ws4Hgy2fWnhIHXzH5maq6xDDw4h9aowfElE9ld5hjZ/8db5giYOFvwAyB
	L++lIXzjUp+272Ejz8rSakajIJyk=
X-Google-Smtp-Source: AGHT+IEXyLX9DRVerhalzC1JjvrTKuksVuTyZ13QcdStrvbZ9vVm+Kmy4TabkFV6JxyhDDMM2fwUWzf2gnPfDOGwwNY=
X-Received: by 2002:a05:6870:9127:b0:25e:e6d:5247 with SMTP id
 586e51a60fabf-28887336888mr183908fac.14.1728664820108; Fri, 11 Oct 2024
 09:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241011151023.1516957-1-yoann.congal@smile.fr>
 <CAMKF1sosOO0BEOewee+wJBazF9LMKmXXVypA6tJ77PV97gQsYg@mail.gmail.com>
 <CAMSfU+4x=KwZx3UbPH=DhNqwAOTGub9QOqvBHEHYiDKJMSRAaw@mail.gmail.com>
 <CAMKF1sqTxHSL3yhb0Y486YDB56jgsRj-Y9WhpOCYXomV1CKEhg@mail.gmail.com> <CAMSfU+5RCkCT+VytkR+PN_pv60O+wg5Zr0yOg_XjSqW9D7R6zQ@mail.gmail.com>
In-Reply-To: <CAMSfU+5RCkCT+VytkR+PN_pv60O+wg5Zr0yOg_XjSqW9D7R6zQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Oct 2024 09:39:52 -0700
Message-ID: <CAMKF1spOZbaabZrRkTq2dfRBeQempvhVhh+BAQzuDTez8zwpYg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gimp: fix buildpaths QA error by
 removing gimptool
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 16:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112812

On Fri, Oct 11, 2024 at 8:51=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
>
>
> Le ven. 11 oct. 2024 =C3=A0 17:37, Khem Raj <raj.khem@gmail.com> a =C3=A9=
crit :
>>
>> On Fri, Oct 11, 2024 at 8:34=E2=80=AFAM Yoann Congal <yoann.congal@smile=
.fr> wrote:
>> >
>> >
>> >
>> > Le ven. 11 oct. 2024 =C3=A0 17:15, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
>> >>
>> >> On Fri, Oct 11, 2024 at 8:10=E2=80=AFAM Yoann Congal via
>> >> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.or=
g>
>> >> wrote:
>> >> >
>> >> > From: Yoann Congal <yoann.congal@smile.fr>
>> >> >
>> >> > gimptool can be used in GIMP plugin compilation. It would make more
>> >> > sense as a native tool. It also contains the sysroot path which bre=
ak
>> >> > build with buildpaths QA error. Remove it from target packages.
>> >> >
>> >> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> >> > ---
>> >> >  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 7 +++++++
>> >> >  1 file changed, 7 insertions(+)
>> >> >
>> >> > diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gn=
ome/recipes-gimp/gimp/gimp_2.10.38.bb
>> >> > index a17e03b103..8755af94a9 100644
>> >> > --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>> >> > +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>> >> > @@ -70,6 +70,13 @@ do_compile:prepend() {
>> >> >      export GEGL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 =
-name 'gegl-*'`
>> >> >  }
>> >> >
>> >> > +do_install:append:class-target() {
>> >> > +    # gimptool can be used in GIMP plugin compilation. It would ma=
ke more sense
>> >> > +    # as a native tool. It also contains the sysroot path which br=
eak build
>> >> > +    # with buildpaths QA error. Remove it from target packages.
>> >> > +    rm ${D}/${bindir}/gimptool-2.0
>> >> > +}
>> >>
>> >> it does mean we can't build plugins in a usecase where an on-device
>> >> SDK is being used, even though it is a rare usecase.
>> >> Can we explore a way to omit the sysroot from being emitted into the
>> >> target version of gimptool ?
>> >
>> >
>> > Sure!
>> >
>> > Right now, Host CC is embedded in the target binary as a last-resort d=
efault to make gimptool output a reasonable CC for gimp plugins compilation=
.
>> > I don't see how to provide a good value to put there unless I can get =
the CC that will be used in the target SDK? (I don't think I can)
>> >
>>
>> Perhaps replacing instances of SYSROOT with target exec_prefix in CC
>> emitted to binary would be a workable solution.
>
>
> For Poky/qemux86-64, that would output
> CC=3D"x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -m=
fpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -=
Wformat-security -Werror=3Dformat-security --sysroot=3D/usr"
>
> Does this look correct to you? (I've never tried the target SDK) Is the c=
ompiler really called "x86_64-poky-linux-gcc" (or just "gcc")?
>

Just remove the --sysroot option completely.

>>
>> > What do you think about removing this last-resort default with a patch=
? That would make gimptool dependent on a correct CC being provided to it (=
but the target SDK should already do that)
>> >
>> >>
>> >> > +
>> >> >  FILES:${PN}  +=3D "${datadir}/metainfo"
>> >> >
>> >> >  RDEPENDS:${PN} +=3D "mypaint-brushes-1.0"
>> >> >
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> > Links: You receive all messages sent to this group.
>> >> > View/Reply Online (#112807): https://lists.openembedded.org/g/opene=
mbedded-devel/message/112807
>> >> > Mute This Topic: https://lists.openembedded.org/mt/108950447/199791=
4
>> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [raj.khem@gmail.com]
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >
>> >
>> >
>> >
>> > --
>> > Yoann Congal
>> > Smile ECS - Tech expert
>
>
>
> --
> Yoann Congal
> Smile ECS - Tech expert


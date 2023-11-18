Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9EBC2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 18:33:25 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.13920.1700332397612311513
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 10:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gSOzxp5z;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1ea98ad294cso1426120fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 10:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700332397; x=1700937197; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H2GeonL2qmqC5jJd0b6zZjjCgxIrpnSr/2M8wDhVnE8=;
        b=gSOzxp5z9XMUBLUibnXiC0rearEikA3Uc26+gISWigHTNfBrzDTIf8asR/NgeGLWQa
         e5btumZ8/J+90JjWNQ3ceGNC35Ljdfu3O+Bbpag0/j4px1rRpjBH0MDH0vm/O82C3XWL
         T0qljT8i9lKntvTySIPSfzLWQo7mt8ToY8rIecSaHYj+p0DZsEJ6wzKZZOuQJLrctP5e
         14gWCUBjV03DOdIZ0PAnivDMt3p9Zh9WIXC3JjB61+bM5ntMC/VVCcugo0PVEyicMN9z
         0+WMUZPD6QzYBdnxEQD5kAlUGApxJ7iASj/TJDJ+BWsozzLeIc2nGyMYkuaUmKGmxMmL
         MtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700332397; x=1700937197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2GeonL2qmqC5jJd0b6zZjjCgxIrpnSr/2M8wDhVnE8=;
        b=Sj4pkiVCK1eAuJUIMfdEQ4GwUYJutoSbynjcG2/K5L/IZk/A9ZY90VTMLvysjeCz8I
         HoufQaal2M1VPyLpLIsixsEXPgsEMdz9g7NYAco7FfkNNo3sU7+C0Zzl5djd9bHisgIb
         kJsX7KPZpjLHGn29Qxkn1bpRy5xnDkanhNOE+UHgbUEe6YImtZf7xQy25llPdidoZsl6
         jOoYTNAU34ltGDQ10LLe1H1JJq6J4ZSrOa/1u9Fkklx6orPD3vwNydqkuewBXnhyh1k1
         kHRRmevjkQog2M6jmBPZkpPQSQqATOc63ThzEfkHd/Cj5ndTf4wBrknm1s1Yo5mZqM1z
         YLkQ==
X-Gm-Message-State: AOJu0YzlL+yoQHtenBDFK/8y//QhVREHtjjMMmbidDQB59CiU0425T/w
	aSDw+ooazCkxLnU7cln6sbM+5SZe4YvXEyQln/s=
X-Google-Smtp-Source: AGHT+IHrN7tqKz8WxaFrHjinmfL15DiipVsdAL6hoZpvNxYD9OK3lEU38xmp0sgoGLs74XAC7Lus7mLwkjCbFCjgm0g=
X-Received: by 2002:a05:6870:2d1:b0:1e9:fe33:8176 with SMTP id
 r17-20020a05687002d100b001e9fe338176mr2688931oaf.5.1700332396406; Sat, 18 Nov
 2023 10:33:16 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sp9-aAaTxtYYcrBQh=sthmdRSaErMB5weXYGd1sbar1BA@mail.gmail.com>
 <D2DD7979-6682-4CDC-8CCD-E8F2845F9912@getmailspring.com>
In-Reply-To: <D2DD7979-6682-4CDC-8CCD-E8F2845F9912@getmailspring.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Nov 2023 10:33:05 -0800
Message-ID: <CAMKF1sq63_bX6NCadBCpRMiA8ts0H7bhndDqpQdjHbR9dA3cdA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007cecb7060a717c2c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 18:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106893

--0000000000007cecb7060a717c2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2023 at 10:27=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@w=
eb.de> wrote:

> No idea if I did that right now. I really don't understand why you guys
> use the email based merge requests, but well.
>

I can talk about it over a beer :)
Thanks for treading along.

>
> On Nov. 18 2023, at 5:45 pm, Khem Raj <raj.khem@gmail.com> wrote:
>
> thats fine and thanks for update. However, if you can resend it via
> git format-patch && git send-email then tools I use will capture the
> v2 properly.
>
> On Sat, Nov 18, 2023 at 5:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@=
web.de> wrote:
> >
> > So in this case it shoule be alright like this. The developer will have
> to take care to set its proper locale, but apart from that everything wor=
ks.
> >
> > From b242979231f4f32243b99cb8312fe4de07b0d87b Mon Sep 17 00:00:00 2001
> > From: =3D?UTF-8?q?Jan=3D20Clau=3DC3=3D9Fen?=3D <jan.claussen10@web.de>
> > Date: Sat, 18 Nov 2023 14:45:27 +0100
> > Subject: [PATCH] meta-oe: recipes-support: Add btop
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUTF-8
> > Content-Transfer-Encoding: 8bit
> >
> > Adds btop, the shell-based resource monitor that shows usage and stats
> for processor, memory, disks, network and processes.
> >
> > Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
> > ---
> > meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 +++++++++++++++++++++
> > 1 file changed, 23 insertions(+)
> > create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb
> >
> > diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb
> b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > new file mode 100644
> > index 000000000..a944fe7b5
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > @@ -0,0 +1,23 @@
> > +SUMMARY =3D "Resource monitor that shows usage and stats for processor=
,
> memory, disks, network and processes."
> > +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> > +SECTION =3D "console/utils"
> > +
> > +SRC_URI =3D "git://
> github.com/aristocratos/btop.git;protocol=3Dhttps;branch=3Dmain"
> > +SRCREV =3D "9edbf27f1b6d5844a97325fcda732762ba086a99"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
> > +FILES:${PN} +=3D " \
> > + ${datadir}/icons \
> > + ${datadir}/icons/hicolor \
> > + ${datadir}/icons/hicolor/48x48 \
> > + ${datadir}/icons/hicolor/scalable \
> > + ${datadir}/icons/hicolor/48x48/apps \
> > + ${datadir}/icons/hicolor/48x48/apps/btop.png \
> > + ${datadir}/icons/hicolor/scalable/apps \
> > + ${datadir}/icons/hicolor/scalable/apps/btop.svg \
> > +"
> > --
> > 2.42.1
> >
> > On Nov. 14 2023, at 9:43 pm, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Nov 14, 2023 at 12:38=E2=80=AFPM Jan Clau=C3=9Fen <jan.claussen=
10@web.de>
> wrote:
> > >
> > > So I have just tested btop on musl succesfully.
> > >
> >
> > OK
> >
> > > I am questioning the need for the locales though. You can run btop
> with the --utf-force flag and it will work well. If you want to run it
> without this flag, you'll need to not only install the locales, but also =
add
> > >
> > > LC_ALL=3Den_US.UTF-8
> > > LANG=3Den_US.UTF-8
> > >
> >
> > yeah if it can work without it, that would be great
> >
> > > to /etc/profile as a minimum. This would force the user to use these
> locales. It would also require a .bbappend on base-files and I don't thin=
k
> that this is a good idea.
> > >
> > > On Nov. 12 2023, at 9:24 pm, Jan Clau=C3=9Fen <jan.claussen10@web.de>
> wrote:
> > >
> > > How did you build it? I have sent you a PM on IRC
> > >
> > > On Nov. 12 2023, at 9:21 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Sun, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.clauss=
en10@web.de>
> wrote:
> > > >
> > > > No, it is an issue I have with images for the Pi Zero. I haven't
> build anything for musl at all, although it would probably a good choice
> for the Pi Zero.
> > > >
> > > > I have no issues using Raspberry Pi OS or other distros btw, so the
> device is not the issue
> > >
> > > As one point I have pi0 running fine perhaps something has regressed
> > > in meta-raspberrypi :( these things need TLC to keep going.
> > >
> > > > On Nov. 12 2023, at 7:49 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > hmm is that just seen with musl and works ok with glibc based image=
s
> ?
> > > >
> > > > TCLIBC=3Dmusl bitbake core-image-base
> > > >
> > > > eg. will produce a musl based image which is expected to work
> > > >
> > > > On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen <jan.clau=
ssen10@web.de>
> wrote:
> > > > >
> > > > > Unfortunately I can't test it unless this gets solved (or I buy a
> different Raspberry Pi)
> > > > >
> > > > > https://github.com/agherzan/meta-raspberrypi/issues/1229
> > > > >
> > > > > On Nov. 12 2023, at 6:43 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > > > >
> > > > > TCLIBC=3Dmusl bitbake <recipe>
> > > > >
> > > > > On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <jan.cla=
ussen10@web.de>
> wrote:
> > > > > >
> > > > > > How to test it against musl btw? Build a musl-based system for
> Raspberry Pi and see if it runs?
> > > > > >
> > > > > > On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10@w=
eb.de>
> wrote:
> > > > > >
> > > > > > Yes, the CMake support was added two months ago and the release
> is from 2022. Cmake is also not supported by the main developer who seems
> to favor an advanced Makefile. In any case, it is easier to fix than the
> Makefile. I will go with the git version for now then until there is a ne=
w
> release.
> > > > > >
> > > > > > On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem@gmail.com>
> wrote:
> > > > > >
> > > > > > On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <
> jan.claussen10@web.de> wrote:
> > > > > > >
> > > > > > > I am trying with the tarball but it is quite hard, since it
> doesn't come with a CMakeLists.txt.
> > > > > > > There is a recipe here, but it involves a lot of patching
> which could potentially be painful to maintain
> > > > > > >
> > > > > > >
> https://github.com/aristocratos/btop/issues/330#issuecomment-1123685779
> > > > > > >
> > > > > >
> > > > > > is it because cmake support was added later ? in that case mayb=
e
> using
> > > > > > git version is ok
> > > > > >
> > > > > > > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem@gmail.com>
> wrote:
> > > > > > >
> > > > > > > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <
> jan.claussen10@web.de> wrote:
> > > > > > > >
> > > > > > > > It also needs a utf-8 locale to work. Else you have to forc=
e
> utf-8 mode with a flag. I haven't included this as dependency at this poi=
nt.
> > > > > > >
> > > > > > > you want to express all that is needed to get it running
> amicably.
> > > > > > > keeping in mind that we have glibc and musl based systems to
> service
> > > > > > > it will be good to check it on musl too.
> > > > > > >
> > > > > > > >
> > > > > > > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <
> jan.claussen10@web.de> wrote:
> > > > > > > >
> > > > > > > > Glad that it arrived now! This is a really great resource
> monitor. It is building from the git repository. Do you think it is bette=
r
> to use the release instead?
> > > > > > > >
> > > > > > > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem@gmail.com>
> wrote:
> > > > > > > >
> > > > > > > > Thanks for your contribution Jan
> > > > > > > >
> > > > > > > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <
> jan.claussen10@web.de> wrote:
> > > > > > > > >
> > > > > > > > > ---
> > > > > > > > > meta-oe/recipes-support/btop/btop_1.2.13.bb | 23
> +++++++++++++++++++++
> > > > > > > > > 1 file changed, 23 insertions(+)
> > > > > > > > > create mode 100644 meta-oe/recipes-support/btop/
> btop_1.2.13.bb
> > > > > > > > >
> > > > > > > > > diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb
> b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > > > > > > > new file mode 100644
> > > > > > > > > index 000000000..f780a993a
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > > > > > > > @@ -0,0 +1,23 @@
> > > > > > > > > +SUMMARY =3D "Resource monitor that shows usage and stats
> for processor, memory, disks, network and processes."
> > > > > > > > > +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> > > > > > > > > +LICENSE =3D "Apache-2.0"
> > > > > > > > > +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
> > > > > > > > > +SECTION =3D "console/utils"
> > > > > > > > > +
> > > > > > > > > +SRC_URI =3D "git://
> github.com/aristocratos/btop.git;protocol=3Dhttps;branch=3Dmain"
> > > > > > > > > +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> > > > > > > > > +
> > > > > > > > > +S =3D "${WORKDIR}/git"
> > > > > > > > > +
> > > > > > > > > +inherit cmake
> > > > > > > > > +
> > > > > > > > > +FILES:${PN} +=3D " \
> > > > > > > > > + /usr/share/icons \
> > > > > > > >
> > > > > > > > Lets use ${datadir} instead of hardcoded /usr/share
> > > > > > > >
> > > > > > > > > + /usr/share/icons/hicolor \
> > > > > > > > > + /usr/share/icons/hicolor/48x48 \
> > > > > > > > > + /usr/share/icons/hicolor/scalable \
> > > > > > > > > + /usr/share/icons/hicolor/48x48/apps \
> > > > > > > > > + /usr/share/icons/hicolor/48x48/apps/btop.png \
> > > > > > > > > + /usr/share/icons/hicolor/scalable/apps \
> > > > > > > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg \
> > > > > > > > > +"
> > > > > > > > > --
> > > > > > > > > 2.42.0
> > > > > > > > >
> > > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > > > Links: You receive all messages sent to this group.
> > > > > > > > > View/Reply Online (#106559):
> https://lists.openembedded.org/g/openembedded-devel/message/106559
> > > > > > > > > Mute This Topic:
> https://lists.openembedded.org/mt/102530478/1997914
> > > > > > > > > Group Owner:
> openembedded-devel+owner@lists.openembedded.org
> > > > > > > > > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > > >
>
>

--0000000000007cecb7060a717c2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Nov 18, 2023 at 10:27=E2=80=AFAM Jan Clau=C3=9Fen &=
lt;<a href=3D"mailto:jan.claussen10@web.de">jan.claussen10@web.de</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div>No idea if I did that ri=
ght now. I really don&#39;t understand why you guys use the email based mer=
ge requests, but well.</div></blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I can talk about it over a beer :)</div><div dir=3D"auto">Thank=
s for treading along.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"auto"></div><br><div>On Nov. 18 2023, at 5:45 pm, Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wro=
te:</div><blockquote><div><div>thats fine and thanks for update. However, i=
f you can resend it via</div><div>git format-patch &amp;&amp; git send-emai=
l then tools I use will capture the</div><div>v2 properly.</div><br><div>On=
 Sat, Nov 18, 2023 at 5:51=E2=80=AFAM Jan Clau=C3=9Fen &lt;<a href=3D"mailt=
o:jan.claussen10@web.de" target=3D"_blank">jan.claussen10@web.de</a>&gt; wr=
ote:</div><div>&gt;</div><div>&gt; So in this case it shoule be alright lik=
e this. The developer will have to take care to set its proper locale, but =
apart from that everything works.</div><div>&gt;</div><div>&gt; From b24297=
9231f4f32243b99cb8312fe4de07b0d87b Mon Sep 17 00:00:00 2001</div><div>&gt; =
From: =3D?UTF-8?q?Jan=3D20Clau=3DC3=3D9Fen?=3D &lt;<a href=3D"mailto:jan.cl=
aussen10@web.de" target=3D"_blank">jan.claussen10@web.de</a>&gt;</div><div>=
&gt; Date: Sat, 18 Nov 2023 14:45:27 +0100</div><div>&gt; Subject: [PATCH] =
meta-oe: recipes-support: Add btop</div><div>&gt; MIME-Version: 1.0</div><d=
iv>&gt; Content-Type: text/plain; charset=3DUTF-8</div><div>&gt; Content-Tr=
ansfer-Encoding: 8bit</div><div>&gt;</div><div>&gt; Adds btop, the shell-ba=
sed resource monitor that shows usage and stats for processor, memory, disk=
s, network and processes.</div><div>&gt;</div><div>&gt; Signed-off-by: Jan =
Clau=C3=9Fen &lt;<a href=3D"mailto:jan.claussen10@web.de" target=3D"_blank"=
>jan.claussen10@web.de</a>&gt;</div><div>&gt; ---</div><div>&gt; meta-oe/re=
cipes-support/btop/<a href=3D"http://btop_1.2.13.bb" target=3D"_blank">btop=
_1.2.13.bb</a> | 23 +++++++++++++++++++++</div><div>&gt; 1 file changed, 23=
 insertions(+)</div><div>&gt; create mode 100644 meta-oe/recipes-support/bt=
op/<a href=3D"http://btop_1.2.13.bb" target=3D"_blank">btop_1.2.13.bb</a></=
div><div>&gt;</div><div>&gt; diff --git a/meta-oe/recipes-support/btop/<a h=
ref=3D"http://btop_1.2.13.bb" target=3D"_blank">btop_1.2.13.bb</a> b/meta-o=
e/recipes-support/btop/<a href=3D"http://btop_1.2.13.bb" target=3D"_blank">=
btop_1.2.13.bb</a></div><div>&gt; new file mode 100644</div><div>&gt; index=
 000000000..a944fe7b5</div><div>&gt; --- /dev/null</div><div>&gt; +++ b/met=
a-oe/recipes-support/btop/<a href=3D"http://btop_1.2.13.bb" target=3D"_blan=
k">btop_1.2.13.bb</a></div><div>&gt; @@ -0,0 +1,23 @@</div><div>&gt; +SUMMA=
RY =3D &quot;Resource monitor that shows usage and stats for processor, mem=
ory, disks, network and processes.&quot;</div><div>&gt; +HOMEPAGE =3D &quot=
;<a href=3D"https://github.com/aristocratos/btop" target=3D"_blank">https:/=
/github.com/aristocratos/btop</a>&quot;</div><div>&gt; +LICENSE =3D &quot;A=
pache-2.0&quot;</div><div>&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;m=
d5=3D3b83ef96387f14655fc854ddc3c6bd57&quot;</div><div>&gt; +SECTION =3D &qu=
ot;console/utils&quot;</div><div>&gt; +</div><div>&gt; +SRC_URI =3D &quot;g=
it://<a href=3D"http://github.com/aristocratos/btop.git;protocol=3Dhttps;br=
anch=3Dmain" target=3D"_blank">github.com/aristocratos/btop.git;protocol=3D=
https;branch=3Dmain</a>&quot;</div><div>&gt; +SRCREV =3D &quot;9edbf27f1b6d=
5844a97325fcda732762ba086a99&quot;</div><div>&gt; +</div><div>&gt; +S =3D &=
quot;${WORKDIR}/git&quot;</div><div>&gt; +</div><div>&gt; +inherit cmake</d=
iv><div>&gt; +</div><div>&gt; +FILES:${PN} +=3D &quot; \</div><div>&gt; + $=
{datadir}/icons \</div><div>&gt; + ${datadir}/icons/hicolor \</div><div>&gt=
; + ${datadir}/icons/hicolor/48x48 \</div><div>&gt; + ${datadir}/icons/hico=
lor/scalable \</div><div>&gt; + ${datadir}/icons/hicolor/48x48/apps \</div>=
<div>&gt; + ${datadir}/icons/hicolor/48x48/apps/btop.png \</div><div>&gt; +=
 ${datadir}/icons/hicolor/scalable/apps \</div><div>&gt; + ${datadir}/icons=
/hicolor/scalable/apps/btop.svg \</div><div>&gt; +&quot;</div><div>&gt; --<=
/div><div>&gt; 2.42.1</div><div>&gt;</div><div>&gt; On Nov. 14 2023, at 9:4=
3 pm, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt; wrote:</div><div>&gt;</div><div>&gt; On Tue, Nov=
 14, 2023 at 12:38=E2=80=AFPM Jan Clau=C3=9Fen &lt;<a href=3D"mailto:jan.cl=
aussen10@web.de" target=3D"_blank">jan.claussen10@web.de</a>&gt; wrote:</di=
v><div>&gt; &gt;</div><div>&gt; &gt; So I have just tested btop on musl suc=
cesfully.</div><div>&gt; &gt;</div><div>&gt;</div><div>&gt; OK</div><div>&g=
t;</div><div>&gt; &gt; I am questioning the need for the locales though. Yo=
u can run btop with the --utf-force flag and it will work well. If you want=
 to run it without this flag, you&#39;ll need to not only install the local=
es, but also add</div><div>&gt; &gt;</div><div>&gt; &gt; LC_ALL=3Den_US.UTF=
-8</div><div>&gt; &gt; LANG=3Den_US.UTF-8</div><div>&gt; &gt;</div><div>&gt=
;</div><div>&gt; yeah if it can work without it, that would be great</div><=
div>&gt;</div><div>&gt; &gt; to /etc/profile as a minimum. This would force=
 the user to use these locales. It would also require a .bbappend on base-f=
iles and I don&#39;t think that this is a good idea.</div><div>&gt; &gt;</d=
iv><div>&gt; &gt; On Nov. 12 2023, at 9:24 pm, Jan Clau=C3=9Fen &lt;<a href=
=3D"mailto:jan.claussen10@web.de" target=3D"_blank">jan.claussen10@web.de</=
a>&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; &gt; How did you build it?=
 I have sent you a PM on IRC</div><div>&gt; &gt;</div><div>&gt; &gt; On Nov=
. 12 2023, at 9:21 pm, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:</div><div>&gt; &gt;</div=
><div>&gt; &gt; On Sun, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen &=
lt;<a href=3D"mailto:jan.claussen10@web.de" target=3D"_blank">jan.claussen1=
0@web.de</a>&gt; wrote:</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; N=
o, it is an issue I have with images for the Pi Zero. I haven&#39;t build a=
nything for musl at all, although it would probably a good choice for the P=
i Zero.</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; I have no issues =
using Raspberry Pi OS or other distros btw, so the device is not the issue<=
/div><div>&gt; &gt;</div><div>&gt; &gt; As one point I have pi0 running fin=
e perhaps something has regressed</div><div>&gt; &gt; in meta-raspberrypi :=
( these things need TLC to keep going.</div><div>&gt; &gt;</div><div>&gt; &=
gt; &gt; On Nov. 12 2023, at 7:49 pm, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:</div><div=
>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; hmm is that just seen with musl an=
d works ok with glibc based images ?</div><div>&gt; &gt; &gt;</div><div>&gt=
; &gt; &gt; TCLIBC=3Dmusl bitbake core-image-base</div><div>&gt; &gt; &gt;<=
/div><div>&gt; &gt; &gt; eg. will produce a musl based image which is expec=
ted to work</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; On Sun, Nov 1=
2, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen &lt;<a href=3D"mailto:jan.clau=
ssen10@web.de" target=3D"_blank">jan.claussen10@web.de</a>&gt; wrote:</div>=
<div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; Unfortunately I can&=
#39;t test it unless this gets solved (or I buy a different Raspberry Pi)</=
div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; <a href=3D"https=
://github.com/agherzan/meta-raspberrypi/issues/1229" target=3D"_blank">http=
s://github.com/agherzan/meta-raspberrypi/issues/1229</a></div><div>&gt; &gt=
; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; On Nov. 12 2023, at 6:43 pm, Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt; wrote:</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &=
gt; &gt; TCLIBC=3Dmusl bitbake &lt;recipe&gt;</div><div>&gt; &gt; &gt; &gt;=
</div><div>&gt; &gt; &gt; &gt; On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan =
Clau=C3=9Fen &lt;<a href=3D"mailto:jan.claussen10@web.de" target=3D"_blank"=
>jan.claussen10@web.de</a>&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt;</d=
iv><div>&gt; &gt; &gt; &gt; &gt; How to test it against musl btw? Build a m=
usl-based system for Raspberry Pi and see if it runs?</div><div>&gt; &gt; &=
gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; On Nov. 12 2023, at 6:23 p=
m, Jan Clau=C3=9Fen &lt;<a href=3D"mailto:jan.claussen10@web.de" target=3D"=
_blank">jan.claussen10@web.de</a>&gt; wrote:</div><div>&gt; &gt; &gt; &gt; =
&gt;</div><div>&gt; &gt; &gt; &gt; &gt; Yes, the CMake support was added tw=
o months ago and the release is from 2022. Cmake is also not supported by t=
he main developer who seems to favor an advanced Makefile. In any case, it =
is easier to fix than the Makefile. I will go with the git version for now =
then until there is a new release.</div><div>&gt; &gt; &gt; &gt; &gt;</div>=
<div>&gt; &gt; &gt; &gt; &gt; On Nov. 12 2023, at 6:20 pm, Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt=
; &gt; On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen &lt;<a href=
=3D"mailto:jan.claussen10@web.de" target=3D"_blank">jan.claussen10@web.de</=
a>&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &=
gt; &gt; &gt; &gt; I am trying with the tarball but it is quite hard, since=
 it doesn&#39;t come with a CMakeLists.txt.</div><div>&gt; &gt; &gt; &gt; &=
gt; &gt; There is a recipe here, but it involves a lot of patching which co=
uld potentially be painful to maintain</div><div>&gt; &gt; &gt; &gt; &gt; &=
gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://github.com/a=
ristocratos/btop/issues/330#issuecomment-1123685779" target=3D"_blank">http=
s://github.com/aristocratos/btop/issues/330#issuecomment-1123685779</a></di=
v><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt;</di=
v><div>&gt; &gt; &gt; &gt; &gt; is it because cmake support was added later=
 ? in that case maybe using</div><div>&gt; &gt; &gt; &gt; &gt; git version =
is ok</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt;=
 &gt; On Nov. 11 2023, at 8:01 pm, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:</div><div>&g=
t; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; On Sat,=
 Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen &lt;<a href=3D"mailto:ja=
n.claussen10@web.de" target=3D"_blank">jan.claussen10@web.de</a>&gt; wrote:=
</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt;=
 &gt; &gt; &gt; It also needs a utf-8 locale to work. Else you have to forc=
e utf-8 mode with a flag. I haven&#39;t included this as dependency at this=
 point.</div><div>&gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &g=
t; &gt; &gt; you want to express all that is needed to get it running amica=
bly.</div><div>&gt; &gt; &gt; &gt; &gt; &gt; keeping in mind that we have g=
libc and musl based systems to service</div><div>&gt; &gt; &gt; &gt; &gt; &=
gt; it will be good to check it on musl too.</div><div>&gt; &gt; &gt; &gt; =
&gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; =
&gt; &gt; &gt; &gt; &gt; On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen &lt;=
<a href=3D"mailto:jan.claussen10@web.de" target=3D"_blank">jan.claussen10@w=
eb.de</a>&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div=
>&gt; &gt; &gt; &gt; &gt; &gt; &gt; Glad that it arrived now! This is a rea=
lly great resource monitor. It is building from the git repository. Do you =
think it is better to use the release instead?</div><div>&gt; &gt; &gt; &gt=
; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Nov. 11 20=
23, at 7:30 pm, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:</div><div>&gt; &gt; &gt; &gt;=
 &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; Thanks for you=
r contribution Jan</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&=
gt; &gt; &gt; &gt; &gt; &gt; &gt; On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM =
Jan Clau=C3=9Fen &lt;<a href=3D"mailto:jan.claussen10@web.de" target=3D"_bl=
ank">jan.claussen10@web.de</a>&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt=
; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ---</div=
><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; meta-oe/recipes-support/btop/=
<a href=3D"http://btop_1.2.13.bb" target=3D"_blank">btop_1.2.13.bb</a> | 23=
 +++++++++++++++++++++</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; 1 =
file changed, 23 insertions(+)</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;=
 &gt; create mode 100644 meta-oe/recipes-support/btop/<a href=3D"http://bto=
p_1.2.13.bb" target=3D"_blank">btop_1.2.13.bb</a></div><div>&gt; &gt; &gt; =
&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; =
diff --git a/meta-oe/recipes-support/btop/<a href=3D"http://btop_1.2.13.bb"=
 target=3D"_blank">btop_1.2.13.bb</a> b/meta-oe/recipes-support/btop/<a hre=
f=3D"http://btop_1.2.13.bb" target=3D"_blank">btop_1.2.13.bb</a></div><div>=
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; new file mode 100644</div><div>&gt;=
 &gt; &gt; &gt; &gt; &gt; &gt; &gt; index 000000000..f780a993a</div><div>&g=
t; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --- /dev/null</div><div>&gt; &gt; &gt=
; &gt; &gt; &gt; &gt; &gt; +++ b/meta-oe/recipes-support/btop/<a href=3D"ht=
tp://btop_1.2.13.bb" target=3D"_blank">btop_1.2.13.bb</a></div><div>&gt; &g=
t; &gt; &gt; &gt; &gt; &gt; &gt; @@ -0,0 +1,23 @@</div><div>&gt; &gt; &gt; =
&gt; &gt; &gt; &gt; &gt; +SUMMARY =3D &quot;Resource monitor that shows usa=
ge and stats for processor, memory, disks, network and processes.&quot;</di=
v><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +HOMEPAGE =3D &quot;<a href=
=3D"https://github.com/aristocratos/btop" target=3D"_blank">https://github.=
com/aristocratos/btop</a>&quot;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt=
; &gt; +LICENSE =3D &quot;Apache-2.0&quot;</div><div>&gt; &gt; &gt; &gt; &g=
t; &gt; &gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96=
387f14655fc854ddc3c6bd57&quot;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;=
 &gt; +SECTION =3D &quot;console/utils&quot;</div><div>&gt; &gt; &gt; &gt; =
&gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +SR=
C_URI =3D &quot;git://<a href=3D"http://github.com/aristocratos/btop.git;pr=
otocol=3Dhttps;branch=3Dmain" target=3D"_blank">github.com/aristocratos/bto=
p.git;protocol=3Dhttps;branch=3Dmain</a>&quot;</div><div>&gt; &gt; &gt; &gt=
; &gt; &gt; &gt; &gt; +SRCREV =3D &quot;2a864f6f2ea60df16b3f015885eb3c18a48=
b9b78&quot;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +</div><div>&=
gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;</d=
iv><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; =
&gt; &gt; &gt; &gt; &gt; +inherit cmake</div><div>&gt; &gt; &gt; &gt; &gt; =
&gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +FILES:$=
{PN} +=3D &quot; \</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr=
/share/icons \</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; =
&gt; &gt; &gt; &gt; &gt; &gt; Lets use ${datadir} instead of hardcoded /usr=
/share</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt=
; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor \</div><div>&gt; &gt;=
 &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/48x48 \</div><div=
>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/scalabl=
e \</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hi=
color/48x48/apps \</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr=
/share/icons/hicolor/48x48/apps/btop.png \</div><div>&gt; &gt; &gt; &gt; &g=
t; &gt; &gt; &gt; + /usr/share/icons/hicolor/scalable/apps \</div><div>&gt;=
 &gt; &gt; &gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/scalable/app=
s/btop.svg \</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&quot;</div=
><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --</div><div>&gt; &gt; &gt; &=
gt; &gt; &gt; &gt; &gt; 2.42.0</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt;=
 &gt;</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &=
gt; Links: You receive all messages sent to this group.</div><div>&gt; &gt;=
 &gt; &gt; &gt; &gt; &gt; &gt; View/Reply Online (#106559): <a href=3D"http=
s://lists.openembedded.org/g/openembedded-devel/message/106559" target=3D"_=
blank">https://lists.openembedded.org/g/openembedded-devel/message/106559</=
a></div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Mute This Topic: <a hr=
ef=3D"https://lists.openembedded.org/mt/102530478/1997914" target=3D"_blank=
">https://lists.openembedded.org/mt/102530478/1997914</a></div><div>&gt; &g=
t; &gt; &gt; &gt; &gt; &gt; &gt; Group Owner: <a href=3D"mailto:openembedde=
d-devel%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-deve=
l+owner@lists.openembedded.org</a></div><div>&gt; &gt; &gt; &gt; &gt; &gt; =
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" target=3D"_blank">https://lists.openembedded.org/g/openem=
bedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>]</div><div>&gt; &gt; &gt; &gt; &gt; &gt; &gt; &=
gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt; &gt; =
&gt; &gt; &gt; &gt; &gt;</div></div></blockquote></blockquote></div></div>

--0000000000007cecb7060a717c2c--


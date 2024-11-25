Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AA4D59D6E
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 20:50:56 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.29267.1732567854090696310
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 12:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DvneevKo;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-71d51a9a42bso634242a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 12:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732567853; x=1733172653; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EJKydZIw9kq/5Zj28qWvukf0J/t+Y/xux9jWeVpk6fY=;
        b=DvneevKoDYtCFLpMX1saRnDYOqkQdoAyyq57PCU9RDTdCLTdfK/fvbUC36kC4nvOCQ
         vVHuukFLmwaE2YrsbmmJ87oUGPYEWuVzzrp2rh1ERo83deS679X3tX3cv8/O+EaRiWbm
         /1UUijmpHxCX3bqR+NCH5dQ0wcqmIKyn4RQnLAeqc+LmPVEXwZxWUFrDJKbpPOUAaskR
         WaPO4tYfX1wNmeT6UiWREU4H0cw5MtRXqMxAEyGf0A01lyGLPEz79S/41W+OuiSOi9PH
         3VU+EjChg4N1O2XwYdFoJZJ7z5sVVK163e4cKJf4JstIk6uIOigUKcqgCImQ5wMFCYxR
         210w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732567853; x=1733172653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJKydZIw9kq/5Zj28qWvukf0J/t+Y/xux9jWeVpk6fY=;
        b=SGlnuQDehi/GuUYdQ2NMiX7c3bq9khs9AjM5dyVsTYlU2V/4eAo8FHO20WQiQ52W5n
         phKVQfBSPpSix4PPmTAGN+hBp4xBmEwy2+s3TOy+QjAgeuBLXSTvX0ErX7zmb6CJfsSq
         Jph7tr2cOPGmoiCZkQKrGvr/g5uvuHU/3bE1a5SazigAYblBxwRsjWrBBF4j215VzIxk
         5nPxvfrDXhMcWXY/w9saZT5HR7zGgwj5dRYq/wjNoTOc/kRUZ0TMcaT64sg/dJMd7mw7
         ejlSLZbsTY8v2tWjByTSEqLIqnPDEL1UByIbsTwec7naBecFccNbdVv6RmtNFbLG87fc
         Yp2Q==
X-Gm-Message-State: AOJu0YyM1+VgLILudLO5/YV9irYtHNHYFr/TLFSR7umlwhQBvOzubNxU
	KsT8nNF+uMamJIzH5dnh5KER0yYrhzOu+Vma1LwYz8X0NXsU6UsHYa10LSZHp4RjPEVJ4ztBY8e
	bbII63ZjMrq59+JW5BDG5QOOKouE=
X-Gm-Gg: ASbGnctDBGyLWQPoLiA0P5zxID3Z/yCDhsnEY7pMmM5rXYW12Fpj07DZt9iOMcobljq
	LkurCVTXp+1DmxfhZBqzMi/8hAgtSLVPQBDu+Nac3WhsCvrF7H9nMs4Pko9RTISB0
X-Google-Smtp-Source: AGHT+IEqlvO8OhzTLPo83JrqsH12rtRPjdcRVRpnw/JxwiEMOrG1lDsf2vXGPDS+fSSuq8ivT6DLt6z9VwCuU+WbOvI=
X-Received: by 2002:a05:6830:608a:b0:718:4073:428f with SMTP id
 46e09a7af769-71c04ba36d1mr15525252a34.16.1732567853292; Mon, 25 Nov 2024
 12:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20241125145307.5479-1-schonm@gmail.com> <20241125145307.5479-3-schonm@gmail.com>
 <CAMKF1sqgczUcaBXVYdZfF8vyJBhYb8sDA-hxvWF4s1zBE0HCDw@mail.gmail.com>
 <CABTo8gAi66eT6tnSMrbFk=JiPLgxguT2ggW3bhzzVQBjj4wNog@mail.gmail.com>
 <CAMKF1spOXeynnBDL-QYy6R2qixkSMT0XkG=7H87LPRZsJEDoQA@mail.gmail.com>
 <CABTo8gCDkLNOXFXaAw-PyYE6uUJbXcCDGKjpYK_MhXv5_47qRw@mail.gmail.com> <CABTo8gArNyLyWx0d9-=F0HXaHEU0Qpya1WrtFO7ex6130S_ViQ@mail.gmail.com>
In-Reply-To: <CABTo8gArNyLyWx0d9-=F0HXaHEU0Qpya1WrtFO7ex6130S_ViQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Nov 2024 12:50:42 -0800
Message-ID: <CAMKF1srp71Ue76GsvoW_gL_yfh7NYh-DuCkdJOK+HpKPMQZ2tQ@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 3/7] libxfce4ui: Upgrade 4.19.3 -> 4.19.4
To: "J. S." <schonm@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000071e3f20627c2e38c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 20:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114053

--00000000000071e3f20627c2e38c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 12:23=E2=80=AFPM J. S. <schonm@gmail.com> wrote:

> Khem,
>
> I'm still not seeing the problem on an Arm target.  So I will move to
> a riscv target to see if I can at least reproduce what you are seeing.
>
> I did  find this which provides a work around.  Although I'm also open
> to just dropping the update.
>
> https://bugs.gentoo.org/924321
>

Yeah this seems to be the exact problem I am seeing

Workaround fix is ok infact it=E2=80=99s a real bug


> I'll let you know what I see with the riscv build.
>
> Thanks,
> Jason
>
> On Mon, Nov 25, 2024 at 3:01=E2=80=AFPM J. S. <schonm@gmail.com> wrote:
> >
> > I've updated my DISTRO_FEATURES to have ld-is-lld and will let you
> > know what I find.
> >
> > On Mon, Nov 25, 2024 at 2:41=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > On Mon, Nov 25, 2024 at 11:33=E2=80=AFAM J. S. <schonm@gmail.com> wro=
te:
> > > >
> > > > Khem,
> > > >
> > > > I have TOOLCHAIN =3D "clang" in my local.conf file and was not seei=
ng
> > > > this error.  Is this perhaps riscv specific?
> > >
> > > I think you will also need ld-is-lld in DISTRO_FEATURES to reproduce
> > > it. It possible its RISCV specific but I think
> > > first thing is to get LLD linker going for build it and see if you ca=
n
> > > reproduce it too.
> > >
> > > >
> > > > I ask because I built core-image-minimal-xfce with raspberry PI 5
> > > > target as an arm 64 build.
> > > >
> > > > Thanks,
> > > > Jason.
> > > >
> > > > On Mon, Nov 25, 2024 at 1:46=E2=80=AFPM Khem Raj <raj.khem@gmail.co=
m> wrote:
> > > > >
> > > > > with lld linker I see errors like
> > > > >
> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference:
> IceSetIOErrorHandler
> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > > --no-allow-shlib-undefined)
> > > > >    |
> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference:
> IceAddConnectionWatch
> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > > --no-allow-shlib-undefined)
> > > > >    |
> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference:
> IceConnectionNumber
> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > > --no-allow-shlib-undefined)
> > > > >    |
> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference:
> IceProcessMessages
> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > > --no-allow-shlib-undefined)
> > > > >    |
> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference:
> > > > > IceSetShutdownNegotiation
> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > > --no-allow-shlib-undefined)
> > > > >    |
> > > > >    | riscv32-yoe-linux-ld.lld: error: undefined reference:
> IceCloseConnection
> > > > >    | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
> > > > > --no-allow-shlib-undefined)
> > > > >
> > > > > On Mon, Nov 25, 2024 at 6:54=E2=80=AFAM J. S. via lists.openembed=
ded.org
> > > > > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> > > > > >
> > > > > > Changelog:
> https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.19.4
> > > > > >
> > > > > > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > > > > > ---
> > > > > >  .../libxfce4ui/{libxfce4ui_4.19.3.bb =3D> libxfce4ui_4.19.4.bb=
}
>  | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.19.3.bb
> =3D> libxfce4ui_4.19.4.bb} (92%)
> > > > > >
> > > > > > diff --git a/meta-xfce/recipes-xfce/libxfce4ui/
> libxfce4ui_4.19.3.bb b/meta-xfce/recipes-xfce/libxfce4ui/
> libxfce4ui_4.19.4.bb
> > > > > > similarity index 92%
> > > > > > rename from meta-xfce/recipes-xfce/libxfce4ui/
> libxfce4ui_4.19.3.bb
> > > > > > rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.b=
b
> > > > > > index e53d01d00..ce711eb36 100644
> > > > > > --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
> > > > > > +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> > > > > > @@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D
> "${GTK3DISTROFEATURES}"
> > > > > >
> > > > > >  # TODO: Check if 0001-... can go
> > > > > >  SRC_URI +=3D
> "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
> > > > > > -SRC_URI[sha256sum] =3D
> "16815eef494ba9bac9c854e95c205c0bc5568c8022c31604348f9edadb02f227"
> > > > > > +SRC_URI[sha256sum] =3D
> "c873ec46d5dd448df60a8385e029892f85b40ad66200cc3c055ab7156d718796"
> > > > > >
> > > > > >  EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
> > > > > >  EXTRA_OECONF +=3D "--disable-vala"
> > > > > > --
> > > > > > 2.43.0
> > > > > >
> > > > > >
> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > Links: You receive all messages sent to this group.
> > > > > > View/Reply Online (#114040):
> https://lists.openembedded.org/g/openembedded-devel/message/114040
> > > > > > Mute This Topic:
> https://lists.openembedded.org/mt/109772240/1997914
> > > > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > > > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > >
>

--00000000000071e3f20627c2e38c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 25, 2024 at 12:23=E2=80=AFPM J. S. &lt;<a href=
=3D"mailto:schonm@gmail.com">schonm@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Khem,<br>
<br>
I&#39;m still not seeing the problem on an Arm target.=C2=A0 So I will move=
 to<br>
a riscv target to see if I can at least reproduce what you are seeing.<br>
<br>
I did=C2=A0 find this which provides a work around.=C2=A0 Although I&#39;m =
also open<br>
to just dropping the update.<br>
<br>
<a href=3D"https://bugs.gentoo.org/924321" rel=3D"noreferrer" target=3D"_bl=
ank">https://bugs.gentoo.org/924321</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah this seems =
to be the exact problem I am seeing=C2=A0</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Workaround fix is ok infact it=E2=80=99s a real bug=C2=A0=
</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
I&#39;ll let you know what I see with the riscv build.<br>
<br>
Thanks,<br>
Jason<br>
<br>
On Mon, Nov 25, 2024 at 3:01=E2=80=AFPM J. S. &lt;<a href=3D"mailto:schonm@=
gmail.com" target=3D"_blank">schonm@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I&#39;ve updated my DISTRO_FEATURES to have ld-is-lld and will let you=
<br>
&gt; know what I find.<br>
&gt;<br>
&gt; On Mon, Nov 25, 2024 at 2:41=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt; On Mon, Nov 25, 2024 at 11:33=E2=80=AFAM J. S. &lt;<a href=3D"mai=
lto:schonm@gmail.com" target=3D"_blank">schonm@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Khem,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have TOOLCHAIN =3D &quot;clang&quot; in my local.conf file=
 and was not seeing<br>
&gt; &gt; &gt; this error.=C2=A0 Is this perhaps riscv specific?<br>
&gt; &gt;<br>
&gt; &gt; I think you will also need ld-is-lld in DISTRO_FEATURES to reprod=
uce<br>
&gt; &gt; it. It possible its RISCV specific but I think<br>
&gt; &gt; first thing is to get LLD linker going for build it and see if yo=
u can<br>
&gt; &gt; reproduce it too.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I ask because I built core-image-minimal-xfce with raspberry=
 PI 5<br>
&gt; &gt; &gt; target as an arm 64 build.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; Jason.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Nov 25, 2024 at 1:46=E2=80=AFPM Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; with lld linker I see errors like<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | riscv32-yoe-linux-ld.lld: error: undefin=
ed reference: IceSetIOErrorHandler<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | &gt;&gt;&gt; referenced by ./.libs/libxf=
ce4ui-2.so (disallowed by<br>
&gt; &gt; &gt; &gt; --no-allow-shlib-undefined)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 |<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | riscv32-yoe-linux-ld.lld: error: undefin=
ed reference: IceAddConnectionWatch<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | &gt;&gt;&gt; referenced by ./.libs/libxf=
ce4ui-2.so (disallowed by<br>
&gt; &gt; &gt; &gt; --no-allow-shlib-undefined)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 |<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | riscv32-yoe-linux-ld.lld: error: undefin=
ed reference: IceConnectionNumber<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | &gt;&gt;&gt; referenced by ./.libs/libxf=
ce4ui-2.so (disallowed by<br>
&gt; &gt; &gt; &gt; --no-allow-shlib-undefined)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 |<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | riscv32-yoe-linux-ld.lld: error: undefin=
ed reference: IceProcessMessages<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | &gt;&gt;&gt; referenced by ./.libs/libxf=
ce4ui-2.so (disallowed by<br>
&gt; &gt; &gt; &gt; --no-allow-shlib-undefined)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 |<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | riscv32-yoe-linux-ld.lld: error: undefin=
ed reference:<br>
&gt; &gt; &gt; &gt; IceSetShutdownNegotiation<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | &gt;&gt;&gt; referenced by ./.libs/libxf=
ce4ui-2.so (disallowed by<br>
&gt; &gt; &gt; &gt; --no-allow-shlib-undefined)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 |<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | riscv32-yoe-linux-ld.lld: error: undefin=
ed reference: IceCloseConnection<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 | &gt;&gt;&gt; referenced by ./.libs/libxf=
ce4ui-2.so (disallowed by<br>
&gt; &gt; &gt; &gt; --no-allow-shlib-undefined)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Nov 25, 2024 at 6:54=E2=80=AFAM J. S. via <a hr=
ef=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">l=
ists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; &lt;schonm=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:=
<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Changelog: <a href=3D"https://gitlab.xfce.org/xfce=
/libxfce4ui/-/tags/libxfce4ui-4.19.4" rel=3D"noreferrer" target=3D"_blank">=
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.19.4</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Jason Schonberg &lt;<a href=3D"mail=
to:schonm@gmail.com" target=3D"_blank">schonm@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 .../libxfce4ui/{<a href=3D"http://libxfce4ui=
_4.19.3.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.19.3.bb</a> =
=3D&gt; <a href=3D"http://libxfce4ui_4.19.4.bb" rel=3D"noreferrer" target=
=3D"_blank">libxfce4ui_4.19.4.bb</a>}=C2=A0 =C2=A0| 2 +-<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-=
)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 rename meta-xfce/recipes-xfce/libxfce4ui/{<a=
 href=3D"http://libxfce4ui_4.19.3.bb" rel=3D"noreferrer" target=3D"_blank">=
libxfce4ui_4.19.3.bb</a> =3D&gt; <a href=3D"http://libxfce4ui_4.19.4.bb" re=
l=3D"noreferrer" target=3D"_blank">libxfce4ui_4.19.4.bb</a>} (92%)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/meta-xfce/recipes-xfce/libxfce4ui/<a =
href=3D"http://libxfce4ui_4.19.3.bb" rel=3D"noreferrer" target=3D"_blank">l=
ibxfce4ui_4.19.3.bb</a> b/meta-xfce/recipes-xfce/libxfce4ui/<a href=3D"http=
://libxfce4ui_4.19.4.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.=
19.4.bb</a><br>
&gt; &gt; &gt; &gt; &gt; similarity index 92%<br>
&gt; &gt; &gt; &gt; &gt; rename from meta-xfce/recipes-xfce/libxfce4ui/<a h=
ref=3D"http://libxfce4ui_4.19.3.bb" rel=3D"noreferrer" target=3D"_blank">li=
bxfce4ui_4.19.3.bb</a><br>
&gt; &gt; &gt; &gt; &gt; rename to meta-xfce/recipes-xfce/libxfce4ui/<a hre=
f=3D"http://libxfce4ui_4.19.4.bb" rel=3D"noreferrer" target=3D"_blank">libx=
fce4ui_4.19.4.bb</a><br>
&gt; &gt; &gt; &gt; &gt; index e53d01d00..ce711eb36 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/meta-xfce/recipes-xfce/libxfce4ui/<a href=3D=
"http://libxfce4ui_4.19.3.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4=
ui_4.19.3.bb</a><br>
&gt; &gt; &gt; &gt; &gt; +++ b/meta-xfce/recipes-xfce/libxfce4ui/<a href=3D=
"http://libxfce4ui_4.19.4.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4=
ui_4.19.4.bb</a><br>
&gt; &gt; &gt; &gt; &gt; @@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D &quot=
;${GTK3DISTROFEATURES}&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 # TODO: Check if 0001-... can go<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 SRC_URI +=3D &quot;file://0001-libxfce4kbd-p=
rivate-xfce4-keyboard-shortcuts.xml-fix.patch&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRC_URI[sha256sum] =3D &quot;16815eef494ba9bac9c8=
54e95c205c0bc5568c8022c31604348f9edadb02f227&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRC_URI[sha256sum] =3D &quot;c873ec46d5dd448df60a=
8385e029892f85b40ad66200cc3c055ab7156d718796&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 EXTRA_OECONF +=3D &quot;--with-vendor-info=
=3D${DISTRO}&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 EXTRA_OECONF +=3D &quot;--disable-vala&quot;=
<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; 2.43.0<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; &gt; &gt; Links: You receive all messages sent to this group=
.<br>
&gt; &gt; &gt; &gt; &gt; View/Reply Online (#114040): <a href=3D"https://li=
sts.openembedded.org/g/openembedded-devel/message/114040" rel=3D"noreferrer=
" target=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/mes=
sage/114040</a><br>
&gt; &gt; &gt; &gt; &gt; Mute This Topic: <a href=3D"https://lists.openembe=
dded.org/mt/109772240/1997914" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/mt/109772240/1997914</a><br>
&gt; &gt; &gt; &gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%=
2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel+owner@=
lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; &gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; &gt; &gt;<br>
</blockquote></div></div>

--00000000000071e3f20627c2e38c--


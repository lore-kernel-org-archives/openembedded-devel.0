Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E51C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 12:03:06 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.7726.1718107384315218687
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 05:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WNBCq9CO;
 spf=pass (domain: mvista.com, ip: 209.85.208.176, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebd95f136bso10111231fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 05:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718107382; x=1718712182; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o9Gf2Yem4TjoI8Y7R3ooIIHgabP/lgGIH42/xoseYGk=;
        b=WNBCq9COwC+y7RWkd4rPR95uw+lrOy9kLkOg3foaBSDwZ4oBzlZMGoNZD7h+odATne
         urH8jX8jDlWFg6lSTLp9HzmFJk8UEwIiq2yvR6sWejTlT7cFdfP2PeYx+OXN4OxrRd5a
         pLese0y/h1F58Y7rpkqhYFQHaypqF8BZi1ovU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718107382; x=1718712182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9Gf2Yem4TjoI8Y7R3ooIIHgabP/lgGIH42/xoseYGk=;
        b=SMzfGl4mdbSedzKzGoP410BActzARXGY+9YuoE7XKoQsqOxoCFt43m0t6W1W8e8QMQ
         ySbENaK8d0i0UfNpQMgfhtG8s9ZMLDdxqGe+ByMQ+98vytplpIodlLpeQXVJzxRUY4Lp
         at7MYj6468XQqtrbTYpFEpJ1mNK+kGFEb9/7T1ZGjz1lKfHUc5X4sMU8RLHA7Sl218xS
         cXbB/Ec7C28KAqTDTmNQH2QWTPkxjAUSHAKFoIH2XCADvsiH78XtjzjwUDoA+WTGlAx7
         5wtTe5C+XAk/aUFAMK1u4AwdAoD2kf/zkhVN24gWiBBp/Mah+qmzosXjdxP9mq4zIEUy
         y26Q==
X-Gm-Message-State: AOJu0YyGe3uJqXVcZU57zMTOSjmMLu+v8UJhBV7SUGv0gTs+ro+htx1i
	c+3e/ZIixPNbwNsg07QTeo7baeV00CWvQ7aIlVvif4j3iolSbN9HUCNqLvLNvqdxHeUlZGlHchG
	qLl19iorwIJPdMrLDEFiLg72+91BfCxKqv+MnAg==
X-Google-Smtp-Source: AGHT+IGkD2nKtPa8y8y+hW6EziDlKjr0hLi+LJVLcaoQ2PwW40s77r/xogLG+DhOmz/DD6KOIswMv5V9nEBHrGvnGUg=
X-Received: by 2002:a2e:98d8:0:b0:2e9:881b:5f02 with SMTP id
 38308e7fff4ca-2eadce838bdmr76660051fa.53.1718107382266; Tue, 11 Jun 2024
 05:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240611070857.825852-1-vanusuri@mvista.com> <a7f86b7f45c4becd011b034d028e3bf53cf0891a.camel@geanix.com>
In-Reply-To: <a7f86b7f45c4becd011b034d028e3bf53cf0891a.camel@geanix.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 11 Jun 2024 17:32:50 +0530
Message-ID: <CANQUz18C-E1Pp40wVeCsqiVC9FacuD9Zd1HvnvoZzHELwJBUmA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][scarthgap][PATCH] tipcutils: add systemd
 service file
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000034d5f5061a9c0c7e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 12:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110827

--00000000000034d5f5061a9c0c7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Martin.

As we explicitly loading tipc kernel module, it's better to use
modules-load.d .

I will send the v2 patch.

Thanks & Regards,
Vijay



On Tue, Jun 11, 2024 at 2:38=E2=80=AFPM Martin Hundeb=C3=B8ll <martin@geani=
x.com> wrote:

> Hi,
>
> On Tue, 2024-06-11 at 12:38 +0530, Vijay Anusuri via
> lists.openembedded.org wrote:
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Add systemd service file for tipcutils
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../tipcutils/tipcutils/tipcutils.service            | 12
> > ++++++++++++
> >  meta-oe/recipes-extended/tipcutils/tipcutils_git.bb  |  9 ++++++++-
> >  2 files changed, 20 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-
> > extended/tipcutils/tipcutils/tipcutils.service
> >
> > diff --git a/meta-oe/recipes-
> > extended/tipcutils/tipcutils/tipcutils.service b/meta-oe/recipes-
> > extended/tipcutils/tipcutils/tipcutils.service
> > new file mode 100644
> > index 000000000..42bf6517e
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.service
> > @@ -0,0 +1,12 @@
> > +[Unit]
> > +Description=3DTransparent Inter-Process Communication protocol
> > +After=3Dsyslog.target remote-fs.target
> > +
> > +[Service]
> > +Type=3Doneshot
> > +RemainAfterExit=3Dyes
> > +ExecStart=3Dmodprobe tipc
> > +ExecStop=3Drmmod tipc
>
> Wouldn't it be better to use modules-load.d instead:
> https://www.man7.org/linux/man-pages/man5/modules-load.d.5.html
>
> ?
>
> // Martin
>
> > +
> > +[Install]
> > +WantedBy=3Dmulti-user.target
> > diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> > b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> > index 596aa260e..335263009 100644
> > --- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> > +++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> > @@ -3,6 +3,7 @@ LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D
> > "file://tipclog/tipc.h;endline=3D35;md5=3D985b6ea8735818511d276c1b466cc=
e9
> > 8"
> >
> >  SRC_URI =3D "git://git.code.sf.net/p/tipc/tipcutils;branch=3Dmaster \
> > +           file://tipcutils.service \
> >
> > file://0001-include-sys-select.h-for-FD_-definitions.patch \
> >
> > file://0002-replace-non-standard-uint-with-unsigned-int.patch \
> >
> > file://0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch
> >  \
> > @@ -11,7 +12,7 @@ SRC_URI =3D
> > "git://git.code.sf.net/p/tipc/tipcutils;branch=3Dmaster \
> >  SRCREV =3D "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
> >  PV =3D "2.2.0+git"
> >
> > -inherit autotools pkgconfig
> > +inherit autotools pkgconfig systemd
> >
> >  DEPENDS +=3D "libdaemon"
> >
> > @@ -41,8 +42,14 @@ do_install:append() {
> >      install -d ${D}${sysconfdir}
> >      cp -R --no-dereference --preserve=3Dmode,links -v
> > ${S}/scripts/etc/* ${D}${sysconfdir}/
> >      chown -R root:root ${D}${sysconfdir}
> > +    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ];
> > then
> > +        install -d ${D}${systemd_unitdir}/system
> > +        install -m 0755 ${WORKDIR}/tipcutils.service
> > ${D}/${systemd_unitdir}/system
> > +    fi
> >  }
> >
> > +SYSTEMD_SERVICE:${PN} =3D "tipcutils.service"
> > +
> >  PACKAGES +=3D "${PN}-demos"
> >  FILES:${PN}-dbg +=3D "/opt/tipcutils/demos/*/.debug
> > /opt/tipcutils/ptts/.debug"
> >  FILES:${PN}-demos =3D "/opt/tipcutils/*"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#110818):
> > https://lists.openembedded.org/g/openembedded-devel/message/110818
> > Mute This Topic: https://lists.openembedded.org/mt/106609163/3618414
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-devel/unsub [
> > martin@geanix.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--00000000000034d5f5061a9c0c7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Thanks Martin.<br><br></div>As we explicitl=
y loading tipc kernel module, it&#39;s better to use modules-load.d .<br><b=
r></div>I will send the v2 patch.<br><br></div><div>Thanks &amp; Regards,</=
div><div>Vijay<br></div><div><div><br><br></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 11, 2024=
 at 2:38=E2=80=AFPM Martin Hundeb=C3=B8ll &lt;<a href=3D"mailto:martin@gean=
ix.com">martin@geanix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi,<br>
<br>
On Tue, 2024-06-11 at 12:38 +0530, Vijay Anusuri via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; <br>
&gt; Add systemd service file for tipcutils<br>
&gt; <br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../tipcutils/tipcutils/tipcutils.service=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12<br>
&gt; ++++++++++++<br>
&gt; =C2=A0meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a>=C2=A0 |=C2=
=A0 9 ++++++++-<br>
&gt; =C2=A02 files changed, 20 insertions(+), 1 deletion(-)<br>
&gt; =C2=A0create mode 100644 meta-oe/recipes-<br>
&gt; extended/tipcutils/tipcutils/tipcutils.service<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-<br>
&gt; extended/tipcutils/tipcutils/tipcutils.service b/meta-oe/recipes-<br>
&gt; extended/tipcutils/tipcutils/tipcutils.service<br>
&gt; new file mode 100644<br>
&gt; index 000000000..42bf6517e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.service<b=
r>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +[Unit]<br>
&gt; +Description=3DTransparent Inter-Process Communication protocol<br>
&gt; +After=3Dsyslog.target remote-fs.target<br>
&gt; +<br>
&gt; +[Service]<br>
&gt; +Type=3Doneshot<br>
&gt; +RemainAfterExit=3Dyes<br>
&gt; +ExecStart=3Dmodprobe tipc<br>
&gt; +ExecStop=3Drmmod tipc<br>
<br>
Wouldn&#39;t it be better to use modules-load.d instead:<br>
<a href=3D"https://www.man7.org/linux/man-pages/man5/modules-load.d.5.html"=
 rel=3D"noreferrer" target=3D"_blank">https://www.man7.org/linux/man-pages/=
man5/modules-load.d.5.html</a><br>
<br>
?<br>
<br>
// Martin<br>
<br>
&gt; +<br>
&gt; +[Install]<br>
&gt; +WantedBy=3Dmulti-user.target<br>
&gt; diff --git a/meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipc=
utils_git.bb" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a><br>
&gt; b/meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils_git.b=
b" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a><br>
&gt; index 596aa260e..335263009 100644<br>
&gt; --- a/meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a><br>
&gt; @@ -3,6 +3,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; =C2=A0LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://tipclog/tipc.h;endline=3D35;md5=3D985b6ea8735818511d276c1=
b466cce9<br>
&gt; 8&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.code.sf.net/p/tipc=
/tipcutils;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.code.s=
f.net/p/tipc/tipcutils;branch=3Dmaster</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://t=
ipcutils.service=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; file://0001-include-sys-select.h-for-FD_-definitions.patch=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; file://0002-replace-non-standard-uint-with-unsigned-int.patch=C2=A0\<b=
r>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; file://0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch=
<br>
&gt; =C2=A0\<br>
&gt; @@ -11,7 +12,7 @@ SRC_URI =3D<br>
&gt; &quot;git://<a href=3D"http://git.code.sf.net/p/tipc/tipcutils;branch=
=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.code.sf.net/p/tipc/tipc=
utils;branch=3Dmaster</a> \<br>
&gt; =C2=A0SRCREV =3D &quot;7ab2211b87414ba240b0b2e4af219c1057c9cf9a&quot;<=
br>
&gt; =C2=A0PV =3D &quot;2.2.0+git&quot;<br>
&gt; =C2=A0<br>
&gt; -inherit autotools pkgconfig<br>
&gt; +inherit autotools pkgconfig systemd<br>
&gt; =C2=A0<br>
&gt; =C2=A0DEPENDS +=3D &quot;libdaemon&quot;<br>
&gt; =C2=A0<br>
&gt; @@ -41,8 +42,14 @@ do_install:append() {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 cp -R --no-dereference --preserve=3Dmode,link=
s -v<br>
&gt; ${S}/scripts/etc/* ${D}${sysconfdir}/<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 chown -R root:root ${D}${sysconfdir}<br>
&gt; +=C2=A0=C2=A0=C2=A0 if [ &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES=
&#39;, &#39;systemd&#39;, d)}&quot; ];<br>
&gt; then<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${systemd_u=
nitdir}/system<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR}=
/tipcutils.service<br>
&gt; ${D}/${systemd_unitdir}/system<br>
&gt; +=C2=A0=C2=A0=C2=A0 fi<br>
&gt; =C2=A0}<br>
&gt; =C2=A0<br>
&gt; +SYSTEMD_SERVICE:${PN} =3D &quot;tipcutils.service&quot;<br>
&gt; +<br>
&gt; =C2=A0PACKAGES +=3D &quot;${PN}-demos&quot;<br>
&gt; =C2=A0FILES:${PN}-dbg +=3D &quot;/opt/tipcutils/demos/*/.debug<br>
&gt; /opt/tipcutils/ptts/.debug&quot;<br>
&gt; =C2=A0FILES:${PN}-demos =3D &quot;/opt/tipcutils/*&quot;<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#110818):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/110818" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-devel/message/110818</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10660916=
3/3618414" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/106609163/3618414</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub" =
rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/opene=
mbedded-devel/unsub</a>=C2=A0[<br>
&gt; <a href=3D"mailto:martin@geanix.com" target=3D"_blank">martin@geanix.c=
om</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--00000000000034d5f5061a9c0c7e--


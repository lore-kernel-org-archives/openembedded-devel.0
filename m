Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35618C433EF
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 19:54:51 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web12.846.1642881290470242565
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 11:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pqX1R06e;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id 2so23389164uax.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 11:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IouTIe6EjYdSULE6xBU0o+SBNeUWVt/5loudagNQYr8=;
        b=pqX1R06eEM6C1H4idtIOReFSJ61mbA8Gc4fwsHqyvtwJuT9aSCE7LDb0rQ9O0fOpJq
         2tRq0XY3SDTMO/qlE285vZN6G2nBjbTPZpQVkaqI6xOmIANB61/f8tE/JHE1w92bwcmg
         tvaD6VI5o/+3dUH/KXHENXU136zt3n6MNKF8DkA5kSe3LsTAYzmnq/m6D4NJYgryeWnm
         IEnX4MRSVF1FBxgtah4Vpprfccm3zFpyEi5dxGy+qrNWuvc8aASdx5j46vGPFLn+K0hf
         ex1stEcatnBz6dxAe82wXLRi5m6RBLs2XwPaM7tFFwNYusWfxbPHQE4nU+ujlud+NQO4
         O8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IouTIe6EjYdSULE6xBU0o+SBNeUWVt/5loudagNQYr8=;
        b=n45Du892zG9jLOEXU3nT0QcgEgre4nAXNu7aww1xB1Eh4WTrqKoccHchx08vYX0P82
         dflQ7mevHIsySTh/0bVEva/WZdnstPnPt+wpInahyXbZsuQShFxVF6zZyYazATzY0OfV
         uvHm684zSi3C03J2v5LiZeA6ogYRQDa6vyq+EfcUlDm8pzhc/258iZp7BwKZbM6rH0bf
         OpSZuU6dQFHNZoA6UAwZjX1fm8EuxXbDPpIb5Xu1YvBWz3osF+vh4UR66yi9YQNAZKwB
         L2gwb7l2baOvhhUIl8VKVCZeGA1zMBgLktL7rnUhpcBhQFqNsteb7a+y2WPfGn829QGf
         PGEQ==
X-Gm-Message-State: AOAM5304FlY0FhfdQVKu/Q9LLCh8TMhyKn2GuUvQunMFRMKJsKKL9G5X
	X8Ko2UH37EgB3rpqNRgLw8C8iKOcycX9LEeS7XI=
X-Google-Smtp-Source: 
 ABdhPJyZP5gBYoOflhDU8uX2quIdfQ+/mcsC2UeTKElzAmDXNPbGHeOtXqSdqLRzZnZkLk74ebpTvYpxay2lgC4Ut3I=
X-Received: by 2002:a67:d903:: with SMTP id t3mr3371793vsj.42.1642881289472;
 Sat, 22 Jan 2022 11:54:49 -0800 (PST)
MIME-Version: 1.0
References: <20220120203602.3833757-1-f_l_k@t-online.de>
 <33c62297-f753-3c63-d409-d6ed774ace94@t-online.de>
In-Reply-To: <33c62297-f753-3c63-d409-d6ed774ace94@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 22 Jan 2022 20:54:38 +0100
Message-ID: 
 <CANNYZj9V_6q9S-vovMMw7i3GdJjog==9EXDCJ_+SMnknCNxHuQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] folks: initial add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aacbfc05d6311b91"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jan 2022 19:54:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95005

--000000000000aacbfc05d6311b91
Content-Type: text/plain; charset="UTF-8"

Gobject introspection is inherently hostile to cross compilation
environments as it requires running a cross-compiled binary with the qemu
emulator. That does not always work, and if it does not, your build will
break. So there must be a way to turn it off when it happens.

Alex

On Sat, 22 Jan 2022 at 20:29, Markus Volk <f_l_k@t-online.de> wrote:

> I tried to make the 'folks' backends buildable and it turned out, that
> there are some more places where vala introspection is missing.
>
>
> https://github.com/openembedded/meta-openembedded/blob/461c04657c3151629b503fe134e9d672520aacbb/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb#L34
>
>
> https://github.com/openembedded/meta-openembedded/blob/566049b4f1ddc049c1f89a5838d1a71bb429faa3/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb#L17
>
>
> Most gnome projects meanwhile make gobject-introspection mandatory and i
> can really feel why they are doing so for two important reasons.
>
> First it is just mandatory if you want to be able to build the whole
> gnome universe and second it is in my option one of the greatest
> features of gtk to be able to write code for it in almost every language
> available. This should not be an optional feature so people could rely
> on it.
>
> In both recipes introspection is disabled by default and dependent on
> 'GI_DATA_ENABLED=true'. Wouldn't it be a good idea to just enable
> Introspection by default? We already inherit gobject-introspection anyway.
>
> There are also some more issues in libgdata and libical with
> introspection i was able to fix locally. Will send patches for it if
> it'll be ok making introspection mandatory.
>
> Am 20.01.22 um 21:36 schrieb Markus Volk:
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >   .../folks/folks_0.15.4.bb                     | 24 +++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> >   create mode 100644 meta-gnome/recipes-connectivity/folks/
> folks_0.15.4.bb
> >
> > diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> > new file mode 100644
> > index 000000000..b4ca551c8
> > --- /dev/null
> > +++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> > @@ -0,0 +1,24 @@
> > +SUMMARY = "Folks is a contact aggregation library."
> > +LICENSE = "LGPLv2.1"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> > +
> > +DEPENDS = " \
> > +    glib-2.0 \
> > +    libgee \
> > +    libxml2 \
> > +    dbus-glib \
> > +    telepathy-glib \
> > +"
> > +
> > +GNOMEBASEBUILDCLASS = "meson"
> > +
> > +# gobject-introspection is mandatory and cannot be configured
> > +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> > +GIR_MESON_OPTION = ""
> > +
> > +EXTRA_OEMESON = "-Deds_backend=false -Dbluez_backend=false
> -Dofono_backend=false -Dtelepathy_backend=false"
> > +
> > +inherit gnomebase gettext gobject-introspection vala features_check
> > +
> > +SRC_URI[archive.sha256sum] =
> "e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536afb79124af5f"
> > +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95004):
> https://lists.openembedded.org/g/openembedded-devel/message/95004
> Mute This Topic: https://lists.openembedded.org/mt/88611345/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000aacbfc05d6311b91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Gobject introspection is inherently hostile to cross =
compilation environments as it requires running a cross-compiled binary wit=
h the qemu emulator. That does not always work, and if it does not, your bu=
ild will break. So there must be a way to turn it off when it happens.</div=
><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Sat, 22 Jan 2022 at 20:29, Markus Vol=
k &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I tried to make=
 the &#39;folks&#39; backends buildable and it turned out, that <br>
there are some more places where vala introspection is missing.<br>
<br>
<a href=3D"https://github.com/openembedded/meta-openembedded/blob/461c04657=
c3151629b503fe134e9d672520aacbb/meta-gnome/recipes-gnome/evolution-data-ser=
ver/evolution-data-server.bb#L34" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/openembedded/meta-openembedded/blob/461c04657c3151629b503fe1=
34e9d672520aacbb/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.bb#L34</a><br>
<br>
<a href=3D"https://github.com/openembedded/meta-openembedded/blob/566049b4f=
1ddc049c1f89a5838d1a71bb429faa3/meta-oe/recipes-connectivity/telepathy/tele=
pathy-glib_0.24.1.bb#L17" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/openembedded/meta-openembedded/blob/566049b4f1ddc049c1f89a5838d1a71b=
b429faa3/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb#L1=
7</a><br>
<br>
<br>
Most gnome projects meanwhile make gobject-introspection mandatory and i <b=
r>
can really feel why they are doing so for two important reasons.<br>
<br>
First it is just mandatory if you want to be able to build the whole <br>
gnome universe and second it is in my option one of the greatest <br>
features of gtk to be able to write code for it in almost every language <b=
r>
available. This should not be an optional feature so people could rely <br>
on it.<br>
<br>
In both recipes introspection is disabled by default and dependent on <br>
&#39;GI_DATA_ENABLED=3Dtrue&#39;. Wouldn&#39;t it be a good idea to just en=
able <br>
Introspection by default? We already inherit gobject-introspection anyway.<=
br>
<br>
There are also some more issues in libgdata and libical with <br>
introspection i was able to fix locally. Will send patches for it if <br>
it&#39;ll be ok making introspection mandatory.<br>
<br>
Am 20.01.22 um 21:36 schrieb Markus Volk:<br>
&gt; Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" ta=
rget=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../folks/<a href=3D"http://folks_0.15.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">folks_0.15.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 24 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-gnome/recipes-connectivity/folks/<=
a href=3D"http://folks_0.15.4.bb" rel=3D"noreferrer" target=3D"_blank">folk=
s_0.15.4.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-gnome/recipes-connectivity/folks/<a href=3D"http://f=
olks_0.15.4.bb" rel=3D"noreferrer" target=3D"_blank">folks_0.15.4.bb</a> b/=
meta-gnome/recipes-connectivity/folks/<a href=3D"http://folks_0.15.4.bb" re=
l=3D"noreferrer" target=3D"_blank">folks_0.15.4.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..b4ca551c8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-gnome/recipes-connectivity/folks/<a href=3D"http://folks_0.=
15.4.bb" rel=3D"noreferrer" target=3D"_blank">folks_0.15.4.bb</a><br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +SUMMARY =3D &quot;Folks is a contact aggregation library.&quot;<br>
&gt; +LICENSE =3D &quot;LGPLv2.1&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2d5025d4aa3495befef8f=
17206a5b0a1&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 glib-2.0 \<br>
&gt; +=C2=A0 =C2=A0 libgee \<br>
&gt; +=C2=A0 =C2=A0 libxml2 \<br>
&gt; +=C2=A0 =C2=A0 dbus-glib \<br>
&gt; +=C2=A0 =C2=A0 telepathy-glib \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
&gt; +<br>
&gt; +# gobject-introspection is mandatory and cannot be configured<br>
&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data&quot;<b=
r>
&gt; +GIR_MESON_OPTION =3D &quot;&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMESON =3D &quot;-Deds_backend=3Dfalse -Dbluez_backend=3Dfalse=
 -Dofono_backend=3Dfalse -Dtelepathy_backend=3Dfalse&quot;<br>
&gt; +<br>
&gt; +inherit gnomebase gettext gobject-introspection vala features_check<b=
r>
&gt; +<br>
&gt; +SRC_URI[archive.sha256sum] =3D &quot;e71099afc9e88fad4e757ae134bc3fd6=
3e12b901ad62b0ed5536afb79124af5f&quot;<br>
&gt; +<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95004): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95004" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95004</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88611345/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88611345/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000aacbfc05d6311b91--


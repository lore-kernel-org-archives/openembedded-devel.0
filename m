Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F28C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 02:22:56 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.2594.1645582962514301803
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F0sPWA5J;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id s1so8397853edd.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmYWBK+P09OQEFjyTyFgEAH1U6Yk3QwDJuhF/Sy3SAk=;
        b=F0sPWA5Jwri2uK8YOV0cDweqcu6XpFJtshXn1rcpY63s3xWyN70Jj+JA1THSHn6ZAm
         kCNxRVsYQm/L2Nxu3/hk5lAIKyhHe3KjGAvkEdbcx37IY9k+6zVWK76xWGnbyNz6wHFI
         353cVcyaaXUxdNBrf3D6ZtQqC3IMcEKRlxAimOvB6CwrPveHqFfR8IQw+4wdAjKJ6Vct
         raT10G21Ip9W5fJ4yHP53uYU9Lhz5r4Oljhdsid5HE70qH1Ig+00uE6KTehRG7h3osRd
         eN897N0aSj9iEuXtn+HgRl+5GSxtrJwsEsRZdFIm/c1shEjEoZvRwgq46pgkYpdRawOe
         Tm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmYWBK+P09OQEFjyTyFgEAH1U6Yk3QwDJuhF/Sy3SAk=;
        b=4zTRoMv0jMN3J2WoOhLBnvo85m6BStRDLQAY3skCqUqtTbDcEOBAtxIwoBMN7ArsgD
         HBxfWHF5+QSs+E8okEIjQ03mjqXyome6VzEXHo9ONUKnhbQlAVKC3ZFuFMV6LeQKzyMi
         4fA5lQWzgJ6HYFdHyzyVR1zH4sBdyUVsyZhkbgA2/rdM6+yMAnw/M2AiqozZ0fyL/SJv
         0/z+Cuu1VRFxHn/rM8AxuEREK15auMdQ1VxKhkpBLXFD0HXpgNh4GeM6g0y2Kpzik34N
         eliIHBoBvtn2Bmw98AMIELLQeydahD4papkHvZbnxbKAlew2Q/fL6V42pLNBxmwj4Mct
         cBZQ==
X-Gm-Message-State: AOAM532slWg8+ivZuwFKJRJbYS5n6tenYDkb9c8y1qQwqNh94qSLyPOt
	0eS6qau/G8wzU3uuXhJeBIdj312L8hfv0eBtAsU=
X-Google-Smtp-Source: 
 ABdhPJy9LDdoaeHE8ya5l3jisDcpZ5DxovfAeCIfS8R3u5QK5EsBWPYmrWaiMTXtsgXh7Pv0936PPRhIOTHSDoHI3wQ=
X-Received: by 2002:a05:6402:b8f:b0:3fd:90e9:ddac with SMTP id
 cf15-20020a0564020b8f00b003fd90e9ddacmr29394514edb.405.1645582960705; Tue, 22
 Feb 2022 18:22:40 -0800 (PST)
MIME-Version: 1.0
References: <20220223021448.2395926-1-tim.orling@konsulko.com>
 <CAMKF1sr2v7FrBsMfJsSf7bUZ94X6hBvv8pGg8_ZmXqueDLrfTA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr2v7FrBsMfJsSf7bUZ94X6hBvv8pGg8_ZmXqueDLrfTA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 22 Feb 2022 18:22:29 -0800
Message-ID: 
 <CANx9H-D_qpd2vcwA8kfYuxTTJk5xK8aG3VZNW5qCLiRPLv+kRw@mail.gmail.com>
Subject: Re: [oe] [PATCH] all layers: LAYERSERIES_COMPAT => kirkstone
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="000000000000d2441405d8a62337"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 02:22:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95461

--000000000000d2441405d8a62337
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 22, 2022 at 6:20 PM Khem Raj <raj.khem@gmail.com> wrote:

> please update to latest master it has been fixed yesterday with
>
> https://git.openembedded.org/meta-openembedded/commit/?id=d9ec74d4c29fa3020d95a2ec0ada2e9a4f5767b6
>
> Ah, thank you. Sorry for the noise.


> On Tue, Feb 22, 2022 at 6:15 PM Tim Orling <ticotimo@gmail.com> wrote:
> >
> > Upstream oe-core is now testing for 'kirkstone' compatibility which
> > breaks any CI for meta-openembedded layers,
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  meta-filesystems/conf/layer.conf | 2 +-
> >  meta-gnome/conf/layer.conf       | 2 +-
> >  meta-initramfs/conf/layer.conf   | 2 +-
> >  meta-multimedia/conf/layer.conf  | 2 +-
> >  meta-networking/conf/layer.conf  | 2 +-
> >  meta-oe/conf/layer.conf          | 2 +-
> >  meta-perl/conf/layer.conf        | 2 +-
> >  meta-python/conf/layer.conf      | 2 +-
> >  meta-webserver/conf/layer.conf   | 2 +-
> >  meta-xfce/conf/layer.conf        | 2 +-
> >  10 files changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/meta-filesystems/conf/layer.conf
> b/meta-filesystems/conf/layer.conf
> > index 6a9357d2a9..b5f59d9bac 100644
> > --- a/meta-filesystems/conf/layer.conf
> > +++ b/meta-filesystems/conf/layer.conf
> > @@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
> >
> >  LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
> >
> > -LAYERSERIES_COMPAT_filesystems-layer = "honister"
> > +LAYERSERIES_COMPAT_filesystems-layer = "kirkstone"
> > diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> > index d2ee3e0692..3f6b4f7b76 100644
> > --- a/meta-gnome/conf/layer.conf
> > +++ b/meta-gnome/conf/layer.conf
> > @@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
> >
> >  LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
> >
> > -LAYERSERIES_COMPAT_gnome-layer = "honister"
> > +LAYERSERIES_COMPAT_gnome-layer = "kirkstone"
> >
> >  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
> >    faenza-icon-theme->gdk-pixbuf \
> > diff --git a/meta-initramfs/conf/layer.conf
> b/meta-initramfs/conf/layer.conf
> > index 11dd43178e..33e61d333f 100644
> > --- a/meta-initramfs/conf/layer.conf
> > +++ b/meta-initramfs/conf/layer.conf
> > @@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_meta-initramfs = "8"
> >  LAYERDEPENDS_meta-initramfs = "core"
> >
> > -LAYERSERIES_COMPAT_meta-initramfs = "honister"
> > +LAYERSERIES_COMPAT_meta-initramfs = "kirkstone"
> >
> >  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> >    dracut->virtual/kernel \
> > diff --git a/meta-multimedia/conf/layer.conf
> b/meta-multimedia/conf/layer.conf
> > index 56c3569d00..1fe9c80330 100644
> > --- a/meta-multimedia/conf/layer.conf
> > +++ b/meta-multimedia/conf/layer.conf
> > @@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
> >
> >  LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
> >
> > -LAYERSERIES_COMPAT_multimedia-layer = "honister"
> > +LAYERSERIES_COMPAT_multimedia-layer = "kirkstone"
> > diff --git a/meta-networking/conf/layer.conf
> b/meta-networking/conf/layer.conf
> > index 67fcda3d99..3f9699ad18 100644
> > --- a/meta-networking/conf/layer.conf
> > +++ b/meta-networking/conf/layer.conf
> > @@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
> >  LAYERDEPENDS_networking-layer += "openembedded-layer"
> >  LAYERDEPENDS_networking-layer += "meta-python"
> >
> > -LAYERSERIES_COMPAT_networking-layer = "honister"
> > +LAYERSERIES_COMPAT_networking-layer = "kirkstone"
> >
> >  LICENSE_PATH += "${LAYERDIR}/licenses"
> >
> > diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> > index d25db911ce..93f3dc5807 100644
> > --- a/meta-oe/conf/layer.conf
> > +++ b/meta-oe/conf/layer.conf
> > @@ -42,7 +42,7 @@ LAYERVERSION_openembedded-layer = "1"
> >
> >  LAYERDEPENDS_openembedded-layer = "core"
> >
> > -LAYERSERIES_COMPAT_openembedded-layer = "honister"
> > +LAYERSERIES_COMPAT_openembedded-layer = "kirkstone"
> >
> >  LICENSE_PATH += "${LAYERDIR}/licenses"
> >
> > diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
> > index 6a2dd7ff95..4f075e9a92 100644
> > --- a/meta-perl/conf/layer.conf
> > +++ b/meta-perl/conf/layer.conf
> > @@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
> >
> >  LAYERDEPENDS_perl-layer = "core openembedded-layer"
> >
> > -LAYERSERIES_COMPAT_perl-layer = "honister"
> > +LAYERSERIES_COMPAT_perl-layer = "kirkstone"
> > diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> > index ffad953f93..98f734152f 100644
> > --- a/meta-python/conf/layer.conf
> > +++ b/meta-python/conf/layer.conf
> > @@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
> >
> >  LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
> >
> > -LAYERSERIES_COMPAT_meta-python = "honister"
> > +LAYERSERIES_COMPAT_meta-python = "kirkstone"
> >
> >  LICENSE_PATH += "${LAYERDIR}/licenses"
> > diff --git a/meta-webserver/conf/layer.conf
> b/meta-webserver/conf/layer.conf
> > index 46d5a872a1..312c39b3b3 100644
> > --- a/meta-webserver/conf/layer.conf
> > +++ b/meta-webserver/conf/layer.conf
> > @@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
> >
> >  LAYERDEPENDS_webserver = "core openembedded-layer"
> >
> > -LAYERSERIES_COMPAT_webserver = "honister"
> > +LAYERSERIES_COMPAT_webserver = "kirkstone"
> >
> >  LICENSE_PATH += "${LAYERDIR}/licenses"
> >
> > diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> > index 81e7dc5ad3..be58708679 100644
> > --- a/meta-xfce/conf/layer.conf
> > +++ b/meta-xfce/conf/layer.conf
> > @@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
> >  LAYERDEPENDS_xfce-layer += "meta-python"
> >  LAYERDEPENDS_xfce-layer += "networking-layer"
> >
> > -LAYERSERIES_COMPAT_xfce-layer = "honister"
> > +LAYERSERIES_COMPAT_xfce-layer = "kirkstone"
> >
> >  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
> >    openzone->gdk-pixbuf \
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95459):
> https://lists.openembedded.org/g/openembedded-devel/message/95459
> > Mute This Topic: https://lists.openembedded.org/mt/89332953/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000d2441405d8a62337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 22, 2022 at 6:20 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">please upda=
te to latest master it has been fixed yesterday with<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3Dd9ec=
74d4c29fa3020d95a2ec0ada2e9a4f5767b6" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/meta-openembedded/commit/?id=3Dd9ec74d4c29fa30=
20d95a2ec0ada2e9a4f5767b6</a><br>
<br></blockquote><div>Ah, thank you. Sorry for the noise.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
On Tue, Feb 22, 2022 at 6:15 PM Tim Orling &lt;<a href=3D"mailto:ticotimo@g=
mail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Upstream oe-core is now testing for &#39;kirkstone&#39; compatibility =
which<br>
&gt; breaks any CI for meta-openembedded layers,<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-filesystems/conf/layer.conf | 2 +-<br>
&gt;=C2=A0 meta-gnome/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-initramfs/conf/layer.conf=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-multimedia/conf/layer.conf=C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-networking/conf/layer.conf=C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-=
<br>
&gt;=C2=A0 meta-perl/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-python/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-webserver/conf/layer.conf=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-xfce/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 10 files changed, 10 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/=
layer.conf<br>
&gt; index 6a9357d2a9..b5f59d9bac 100644<br>
&gt; --- a/meta-filesystems/conf/layer.conf<br>
&gt; +++ b/meta-filesystems/conf/layer.conf<br>
&gt; @@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 LAYERDEPENDS_filesystems-layer =3D &quot;core openembedded-layer=
&quot;<br>
&gt;<br>
&gt; -LAYERSERIES_COMPAT_filesystems-layer =3D &quot;honister&quot;<br>
&gt; +LAYERSERIES_COMPAT_filesystems-layer =3D &quot;kirkstone&quot;<br>
&gt; diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf<b=
r>
&gt; index d2ee3e0692..3f6b4f7b76 100644<br>
&gt; --- a/meta-gnome/conf/layer.conf<br>
&gt; +++ b/meta-gnome/conf/layer.conf<br>
&gt; @@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 LAYERDEPENDS_gnome-layer =3D &quot;core openembedded-layer netwo=
rking-layer&quot;<br>
&gt;<br>
&gt; -LAYERSERIES_COMPAT_gnome-layer =3D &quot;honister&quot;<br>
&gt; +LAYERSERIES_COMPAT_gnome-layer =3D &quot;kirkstone&quot;<br>
&gt;<br>
&gt;=C2=A0 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 faenza-icon-theme-&gt;gdk-pixbuf \<br>
&gt; diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/laye=
r.conf<br>
&gt; index 11dd43178e..33e61d333f 100644<br>
&gt; --- a/meta-initramfs/conf/layer.conf<br>
&gt; +++ b/meta-initramfs/conf/layer.conf<br>
&gt; @@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs :=3D &quot;^${LAYERDIR=
}/&quot;<br>
&gt;=C2=A0 BBFILE_PRIORITY_meta-initramfs =3D &quot;8&quot;<br>
&gt;=C2=A0 LAYERDEPENDS_meta-initramfs =3D &quot;core&quot;<br>
&gt;<br>
&gt; -LAYERSERIES_COMPAT_meta-initramfs =3D &quot;honister&quot;<br>
&gt; +LAYERSERIES_COMPAT_meta-initramfs =3D &quot;kirkstone&quot;<br>
&gt;<br>
&gt;=C2=A0 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 dracut-&gt;virtual/kernel \<br>
&gt; diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/la=
yer.conf<br>
&gt; index 56c3569d00..1fe9c80330 100644<br>
&gt; --- a/meta-multimedia/conf/layer.conf<br>
&gt; +++ b/meta-multimedia/conf/layer.conf<br>
&gt; @@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 LAYERDEPENDS_multimedia-layer =3D &quot;core openembedded-layer =
meta-python&quot;<br>
&gt;<br>
&gt; -LAYERSERIES_COMPAT_multimedia-layer =3D &quot;honister&quot;<br>
&gt; +LAYERSERIES_COMPAT_multimedia-layer =3D &quot;kirkstone&quot;<br>
&gt; diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/la=
yer.conf<br>
&gt; index 67fcda3d99..3f9699ad18 100644<br>
&gt; --- a/meta-networking/conf/layer.conf<br>
&gt; +++ b/meta-networking/conf/layer.conf<br>
&gt; @@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer =3D &quot;core&quot;<b=
r>
&gt;=C2=A0 LAYERDEPENDS_networking-layer +=3D &quot;openembedded-layer&quot=
;<br>
&gt;=C2=A0 LAYERDEPENDS_networking-layer +=3D &quot;meta-python&quot;<br>
&gt;<br>
&gt; -LAYERSERIES_COMPAT_networking-layer =3D &quot;honister&quot;<br>
&gt; +LAYERSERIES_COMPAT_networking-layer =3D &quot;kirkstone&quot;<br>
&gt;<br>
&gt;=C2=A0 LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf<br>
&gt; index d25db911ce..93f3dc5807 100644<br>
&gt; --- a/meta-oe/conf/layer.conf<br>
&gt; +++ b/meta-oe/conf/layer.conf<br>
&gt; @@ -42,7 +42,7 @@ LAYERVERSION_openembedded-layer =3D &quot;1&quot;<br=
>
&gt;<br>
&gt;=C2=A0 LAYERDEPENDS_openembedded-layer =3D &quot;core&quot;<br>
&gt;<br>
&gt; -LAYERSERIES_COMPAT_openembedded-layer =3D &quot;honister&quot;<br>
&gt; +LAYERSERIES_COMPAT_openembedded-layer =3D &quot;kirkstone&quot;<br>
&gt;<br>
&gt;=C2=A0 LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
&gt;<br>
&gt; diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf<br>
&gt; index 6a2dd7ff95..4f075e9a92 100644<br>
&gt; --- a/meta-perl/conf/layer.conf<br>
&gt; +++ b/meta-perl/conf/layer.conf<br>
&gt; @@ -15,4 +15,4 @@ LAYERVERSION_perl-layer =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 LAYERDEPENDS_perl-layer =3D &quot;core openembedded-layer&quot;<=
br>
&gt;<br>
&gt; -LAYERSERIES_COMPAT_perl-layer =3D &quot;honister&quot;<br>
&gt; +LAYERSERIES_COMPAT_perl-layer =3D &quot;kirkstone&quot;<br>
&gt; diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf=
<br>
&gt; index ffad953f93..98f734152f 100644<br>
&gt; --- a/meta-python/conf/layer.conf<br>
&gt; +++ b/meta-python/conf/layer.conf<br>
&gt; @@ -14,6 +14,6 @@ LAYERVERSION_meta-python =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 LAYERDEPENDS_meta-python =3D &quot;core (&gt;=3D 12) openembedde=
d-layer&quot;<br>
&gt;<br>
&gt; -LAYERSERIES_COMPAT_meta-python =3D &quot;honister&quot;<br>
&gt; +LAYERSERIES_COMPAT_meta-python =3D &quot;kirkstone&quot;<br>
&gt;<br>
&gt;=C2=A0 LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
&gt; diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/laye=
r.conf<br>
&gt; index 46d5a872a1..312c39b3b3 100644<br>
&gt; --- a/meta-webserver/conf/layer.conf<br>
&gt; +++ b/meta-webserver/conf/layer.conf<br>
&gt; @@ -17,7 +17,7 @@ LAYERVERSION_webserver =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 LAYERDEPENDS_webserver =3D &quot;core openembedded-layer&quot;<b=
r>
&gt;<br>
&gt; -LAYERSERIES_COMPAT_webserver =3D &quot;honister&quot;<br>
&gt; +LAYERSERIES_COMPAT_webserver =3D &quot;kirkstone&quot;<br>
&gt;<br>
&gt;=C2=A0 LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
&gt;<br>
&gt; diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf<br>
&gt; index 81e7dc5ad3..be58708679 100644<br>
&gt; --- a/meta-xfce/conf/layer.conf<br>
&gt; +++ b/meta-xfce/conf/layer.conf<br>
&gt; @@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer +=3D &quot;multimedia-layer&=
quot;<br>
&gt;=C2=A0 LAYERDEPENDS_xfce-layer +=3D &quot;meta-python&quot;<br>
&gt;=C2=A0 LAYERDEPENDS_xfce-layer +=3D &quot;networking-layer&quot;<br>
&gt;<br>
&gt; -LAYERSERIES_COMPAT_xfce-layer =3D &quot;honister&quot;<br>
&gt; +LAYERSERIES_COMPAT_xfce-layer =3D &quot;kirkstone&quot;<br>
&gt;<br>
&gt;=C2=A0 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 openzone-&gt;gdk-pixbuf \<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#95459): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/95459" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/95459</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89332953=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89332953/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000d2441405d8a62337--


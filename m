Return-Path: <windel.bouwman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FD2C433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 11:02:14 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.9603.1651575727646515522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 04:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pdrvfUqQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: windel.bouwman@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so1897122pju.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 04:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GKYJYXx/xOqQ0WwZ2oF2TSVUgWFvs1Csxhn56aaTExE=;
        b=pdrvfUqQ6BUm1skzUE0+YVve+C54jpJq1uLGyMlPrbv7aAHK3yRM01UpY9isuXPx+4
         y/fECGIVCAiUXD1XMtOkNd5wpqGutkEZViFdFh6JnTdE2LlOGtIhLjV2H/xURtmYTJRw
         x2FaJae8xGUJ7GpblseSmLVkg88S/KMFpv0LX2dAVC15ijOELC2OvMqEkP8q5WbB5sEw
         2C6kRENMsAi2EvqcWM08YQqYrEvKem+f/OdNYKcxjcTTiQ6TRBHSq4qeLSsUKOfFyfI8
         RbpMRNlSdMbrX5+M6v5rYnjH6rWyrwztjdiMbpJjj5z+XF8/oYdjH16pLA8LVT2QdWxP
         GAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GKYJYXx/xOqQ0WwZ2oF2TSVUgWFvs1Csxhn56aaTExE=;
        b=mXbdJS3mYfeCSsDdl2V8TJksP9MDkINakj43Rq26Qcthdk23O7u3Bpm0LRjkl4bFxE
         GG6iFH7o7+I3MqDG1Wq4mKbKZWjsNHv8fzfgRhRrL1QsBIHzLBwotDzTJzq5cIR7aXMh
         xFAe4TueeTUFwVdKS2lRkit+gaGb3jFVt0p+CSXTOxY2bSM1ZcVQSOhIVTXCeCaVynTu
         4N3FO1BqAdbT4lPbuO9+jnfmAmUD8iPEtT3bLk1fCvCWDJciJZE4Re3pqTzHRjdiCvsH
         WcFXmI2g4f2s6v+jeoeXdTPIyv/uQnQaQA7keDhfr9YWz8rUFVTDIi97c9VAQdk6W9X2
         kcFw==
X-Gm-Message-State: AOAM530WWHaw6BIVt6pCxQ5wt3ehFVq5Gz0vFnTf7Idk0zwFITAqhXgH
	5yoVuk+Libr734DPFoj5nN4wItwceGKr+CY1/fo=
X-Google-Smtp-Source: 
 ABdhPJzDrxCyQggNfs3wQYu6zJtWUJouq1stMMwZ4qAUd0ramQDDA8ID6GmbwKZcKXVTm1NqA5Qjq4/iOMsjZqpUDbk=
X-Received: by 2002:a17:902:7296:b0:14b:4bc6:e81 with SMTP id
 d22-20020a170902729600b0014b4bc60e81mr15966191pll.132.1651575727036; Tue, 03
 May 2022 04:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220502141441.26320-1-windel@windel.nl>
 <CAMKF1sr9BcOz32MEqhb723ALz5mWH4EDQm5Defc5n8=GKcf+rg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr9BcOz32MEqhb723ALz5mWH4EDQm5Defc5n8=GKcf+rg@mail.gmail.com>
From: Windel Bouwman <windel.bouwman@gmail.com>
Date: Tue, 3 May 2022 13:01:56 +0200
Message-ID: 
 <CAHMaQtBurE424MVsK4bt8ddpUo8kwfUaK3mE08MRUXovZ7BXFQ@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] Add zfs recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Windel Bouwman <windel@windel.nl>
Content-Type: multipart/alternative; boundary="000000000000879cc105de19707c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 May 2022 11:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96949

--000000000000879cc105de19707c
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

I tried to reproduce this build error, but the recipe builds fine at my
local setup.

What system did you use to test?

Regards,
Windel

On Mon, May 2, 2022 at 11:12 PM Khem Raj <raj.khem@gmail.com> wrote:

> looks better this time but fails in packaging
>
> https://errors.yoctoproject.org/Errors/Details/655897/
>
> On Mon, May 2, 2022 at 7:15 AM Windel Bouwman <windel.bouwman@gmail.com>
> wrote:
> >
> > Signed-off-by: Windel Bouwman <windel@windel.nl>
> > ---
> >  .../recipes-filesystems/zfs/zfs_2.1.4.bb      | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 meta-filesystems/recipes-filesystems/zfs/
> zfs_2.1.4.bb
> >
> > diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
> b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
> > new file mode 100644
> > index 000000000..01a64cc95
> > --- /dev/null
> > +++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
> > @@ -0,0 +1,46 @@
> > +
> > +SUMMARY = "OpenZFS on Linux and FreeBSD"
> > +DESCRIPTION = "OpenZFS on Linux and FreeBSD"
> > +LICENSE = "CDDL-1.0"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
> > +HOMEPAGE ="https://github.com/openzfs/zfs"
> > +
> > +SRC_URI = "
> https://github.com/openzfs/zfs/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz
> "
> > +SRC_URI[sha256sum] =
> "3b52c0d493f806f638dca87dde809f53861cd318c1ebb0e60daeaa061cf1acf6"
> > +
> > +# Using both 'module' and 'autotools' classes seems a bit odd, they both
> > +# define a do_compile function.
> > +# That's why we opt for module-base, also this prevents module
> splitting.
> > +inherit module-base pkgconfig autotools
> > +
> > +DEPENDS = "virtual/kernel zlib util-linux libtirpc openssl"
> > +
> > +EXTRA_OECONF:append = " \
> > +    --disable-pyzfs \
> > +    --with-linux=${STAGING_KERNEL_DIR}
> --with-linux-obj=${STAGING_KERNEL_BUILDDIR} \
> > +    --enable-systemd \
> > +    --disable-sysvinit \
> > +    --without-dracutdir \
> > +    "
> > +
> > +do_install:append() {
> > +    # /usr/share/zfs contains the zfs-tests folder which we do not need:
> > +    rm -rf ${D}${datadir}/zfs
> > +
> > +    rm -rf ${D}${datadir}/initramfs-tools
> > +}
> > +
> > +FILES:${PN} += "\
> > +    ${base_sbindir}/* \
> > +    ${base_libdir}/* \
> > +    ${sysconfdir}/* \
> > +    ${sbindir}/* \
> > +    ${bindir}/* \
> > +    ${libexecdir}/${BPN}/* \
> > +    ${libdir}/* \
> > +    "
> > +
> > +FILES:${PN}-dev += "\
> > +    ${prefix}/src/zfs-${PV}/* \
> > +    ${prefix}/src/spl-${PV}/* \
> > +    "
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#96929):
> https://lists.openembedded.org/g/openembedded-devel/message/96929
> > Mute This Topic: https://lists.openembedded.org/mt/90833225/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000879cc105de19707c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Khem,<div><br></div><div>I tried to reproduce this buil=
d error, but the recipe builds fine at my local setup.</div><div><br></div>=
<div>What system did you use to test?</div><div><br></div><div>Regards,</di=
v><div>Windel</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, May 2, 2022 at 11:12 PM Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">looks better this time but fai=
ls in packaging<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/655897/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/655897/</a><br>
<br>
On Mon, May 2, 2022 at 7:15 AM Windel Bouwman &lt;<a href=3D"mailto:windel.=
bouwman@gmail.com" target=3D"_blank">windel.bouwman@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Signed-off-by: Windel Bouwman &lt;<a href=3D"mailto:windel@windel.nl" =
target=3D"_blank">windel@windel.nl</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-filesystems/zfs/<a href=3D"http://zfs_2.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">zfs_2.1.4.bb</a>=C2=A0 =C2=A0 =C2=A0 | 46=
 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 46 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-filesystems/recipes-filesystems/zfs/<a h=
ref=3D"http://zfs_2.1.4.bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.1.4.=
bb</a><br>
&gt;<br>
&gt; diff --git a/meta-filesystems/recipes-filesystems/zfs/<a href=3D"http:=
//zfs_2.1.4.bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.1.4.bb</a> b/met=
a-filesystems/recipes-filesystems/zfs/<a href=3D"http://zfs_2.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">zfs_2.1.4.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..01a64cc95<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-filesystems/recipes-filesystems/zfs/<a href=3D"http://zfs_2=
.1.4.bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.1.4.bb</a><br>
&gt; @@ -0,0 +1,46 @@<br>
&gt; +<br>
&gt; +SUMMARY =3D &quot;OpenZFS on Linux and FreeBSD&quot;<br>
&gt; +DESCRIPTION =3D &quot;OpenZFS on Linux and FreeBSD&quot;<br>
&gt; +LICENSE =3D &quot;CDDL-1.0&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7087caaf1dc8a28565856=
19f4a787faa&quot;<br>
&gt; +HOMEPAGE =3D&quot;<a href=3D"https://github.com/openzfs/zfs" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/openzfs/zfs</a>&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://github.com/openzfs/zfs/releases/=
download/$%7BBPN%7D-$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/openzfs/zfs/releases/download/${BPN=
}-${PV}/${BPN}-${PV}.tar.gz</a>&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;3b52c0d493f806f638dca87dde809f53861cd318=
c1ebb0e60daeaa061cf1acf6&quot;<br>
&gt; +<br>
&gt; +# Using both &#39;module&#39; and &#39;autotools&#39; classes seems a=
 bit odd, they both<br>
&gt; +# define a do_compile function.<br>
&gt; +# That&#39;s why we opt for module-base, also this prevents module sp=
litting.<br>
&gt; +inherit module-base pkgconfig autotools<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;virtual/kernel zlib util-linux libtirpc openssl&quo=
t;<br>
&gt; +<br>
&gt; +EXTRA_OECONF:append =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 --disable-pyzfs \<br>
&gt; +=C2=A0 =C2=A0 --with-linux=3D${STAGING_KERNEL_DIR} --with-linux-obj=
=3D${STAGING_KERNEL_BUILDDIR} \<br>
&gt; +=C2=A0 =C2=A0 --enable-systemd \<br>
&gt; +=C2=A0 =C2=A0 --disable-sysvinit \<br>
&gt; +=C2=A0 =C2=A0 --without-dracutdir \<br>
&gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +do_install:append() {<br>
&gt; +=C2=A0 =C2=A0 # /usr/share/zfs contains the zfs-tests folder which we=
 do not need:<br>
&gt; +=C2=A0 =C2=A0 rm -rf ${D}${datadir}/zfs<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 rm -rf ${D}${datadir}/initramfs-tools<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES:${PN} +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${base_sbindir}/* \<br>
&gt; +=C2=A0 =C2=A0 ${base_libdir}/* \<br>
&gt; +=C2=A0 =C2=A0 ${sysconfdir}/* \<br>
&gt; +=C2=A0 =C2=A0 ${sbindir}/* \<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/* \<br>
&gt; +=C2=A0 =C2=A0 ${libexecdir}/${BPN}/* \<br>
&gt; +=C2=A0 =C2=A0 ${libdir}/* \<br>
&gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +FILES:${PN}-dev +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${prefix}/src/zfs-${PV}/* \<br>
&gt; +=C2=A0 =C2=A0 ${prefix}/src/spl-${PV}/* \<br>
&gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#96929): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/96929" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/96929</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90833225=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/90833225/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000879cc105de19707c--


Return-Path: <windel.bouwman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A53BC433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 06:35:05 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.6654.1651818898762338292
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 23:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JMUNiCW/;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: windel.bouwman@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id iq10so6232275pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 23:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dc2gbwnEscXqrRfss15CNZJ82B/77POgZccck1XJRqA=;
        b=JMUNiCW/L+95TKJ11uq4SWB7zcIKRn9S4rbrkBcmuColG9dZ3Yt7w7tpfdZlVpU/Cm
         gYt7Mug1TfAmPeJnbIa93dM8LI47lxwnpjjh4u3rNFBSrPTKhFTjoeEEHixaiX07w2eA
         iHoc7pn7kNHPNY//0bMycmsjTE1S9pZoxr4ZLTmbtFpc9lo3K9ob06GCYWnhMnL69y8c
         Pwm3xWnW8pGpofvC7p6qJsuturzXkL9lLTrQ5EP5FKIXKsRZbrPmgJGnMPFegDDFJc0E
         H8fsEsnRZ2R2EOsAuShURezOVROcMT8lHKLvKb5irlItf0XMpWHku9leUi6slaOrxWrF
         Bxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dc2gbwnEscXqrRfss15CNZJ82B/77POgZccck1XJRqA=;
        b=AVi/cfTNE67GlTA85zhLMYoWQxEbJQVgmi1hiRmTZZA3XIqrzsA2tiX/woaN+FwaRE
         kyURy75p/zalkXPfBQugOxKhQR7xhV6zEWw4j+FjBRst4+MjuvWNARIIb2eJ/52+Q0Mq
         2TlCjv8JTIP10Oo1zXaWKD0nqnUJXNUV+Yp4gU9jaudTXaqZH8Ipeidy0Ih/Zwro6s/c
         8GtgCIBEIkHrZOYqWJ3CKOtjkiC/G4e2jFDO5kTcyyDNQI28Phr4KcPMhlUipsKf6UXR
         vMxIoxzowYXj7WhmucXWut3jWBGh1T0J0QcYRxv+p/tdN4WqYnEiVms697zu6vAIyh6W
         pziA==
X-Gm-Message-State: AOAM532SSlICuu2YhepbdMElxUL+Gd5itD7EsI3rzheNZQ9LdQ6J/alb
	s+5dRe4Ci2El+UspP3bCcJa0803CNlkvlftCOkQ=
X-Google-Smtp-Source: 
 ABdhPJzMzFTWqT1DWpd39FAlqxeqjWeYLWgBJujhzAuIYkjp28/c4sWLiUcJBrm24omVoenPU9XYJubXmS3GEW7Ahow=
X-Received: by 2002:a17:90a:528f:b0:1dc:9a7c:4a3 with SMTP id
 w15-20020a17090a528f00b001dc9a7c04a3mr2415919pjh.112.1651818898083; Thu, 05
 May 2022 23:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220505142749.28938-1-windel@windel.nl>
 <CAMKF1sqsSF17W0ptD97PDUyMVXsJM4tw-LGVgBfABPPvdr9RVA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqsSF17W0ptD97PDUyMVXsJM4tw-LGVgBfABPPvdr9RVA@mail.gmail.com>
From: Windel Bouwman <windel.bouwman@gmail.com>
Date: Fri, 6 May 2022 08:34:47 +0200
Message-ID: 
 <CAHMaQtD-wjRttSi9FW_wrgvu2xY=h+qESmVTCqYvT-sr8DdW3w@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] Add zfs recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Windel Bouwman <windel@windel.nl>
Content-Type: multipart/alternative; boundary="000000000000a752bb05de520e55"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 May 2022 06:35:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96970

--000000000000a752bb05de520e55
Content-Type: text/plain; charset="UTF-8"

That's curious, but I guess you are right. I will add a depend on libcurl.
On my system, it was not required, and it compiles without libcurl as well.

On Thu, May 5, 2022 at 8:31 PM Khem Raj <raj.khem@gmail.com> wrote:

> I think it needs a dep on curl see
>
> https://errors.yoctoproject.org/Errors/Details/656276/
>
> On Thu, May 5, 2022 at 7:29 AM Windel Bouwman <windel.bouwman@gmail.com>
> wrote:
> >
> > Signed-off-by: Windel Bouwman <windel@windel.nl>
> > ---
> >  .../recipes-filesystems/zfs/zfs_2.1.4.bb      | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 meta-filesystems/recipes-filesystems/zfs/
> zfs_2.1.4.bb
> >
> > diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
> b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
> > new file mode 100644
> > index 000000000..ebe2ec39d
> > --- /dev/null
> > +++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
> > @@ -0,0 +1,54 @@
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
> > +PACKAGECONFIG[pam] = "--enable-pam
> --with-pamconfigsdir=${datadir}/pam-configs
> --with-pammoduledir=${libdir}/security, --disable-pam"
> > +
> > +EXTRA_OECONF:append = " \
> > +    --disable-pyzfs \
> > +    --with-linux=${STAGING_KERNEL_DIR}
> --with-linux-obj=${STAGING_KERNEL_BUILDDIR} \
> > +    --with-mounthelperdir=${base_sbin} \
> > +    --with-udevdir=${base_libdir}/udev \
> > +    --enable-systemd \
> > +    --disable-sysvinit \
> > +    --without-dracutdir \
> > +    "
> > +
> > +EXTRA_OEMAKE:append = " \
> > +    INSTALL_MOD_PATH=${D}${root_prefix} \
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
> > View/Reply Online (#96960):
> https://lists.openembedded.org/g/openembedded-devel/message/96960
> > Mute This Topic: https://lists.openembedded.org/mt/90833225/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000a752bb05de520e55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That&#39;s curious, but I guess you are right. I will add =
a depend on libcurl. On my system, it was not required, and it compiles wit=
hout libcurl as well.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 5, 2022 at 8:31 PM Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">I think it needs a dep on cur=
l see<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/656276/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/656276/</a><br>
<br>
On Thu, May 5, 2022 at 7:29 AM Windel Bouwman &lt;<a href=3D"mailto:windel.=
bouwman@gmail.com" target=3D"_blank">windel.bouwman@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Signed-off-by: Windel Bouwman &lt;<a href=3D"mailto:windel@windel.nl" =
target=3D"_blank">windel@windel.nl</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-filesystems/zfs/<a href=3D"http://zfs_2.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">zfs_2.1.4.bb</a>=C2=A0 =C2=A0 =C2=A0 | 54=
 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 54 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-filesystems/recipes-filesystems/zfs/<a h=
ref=3D"http://zfs_2.1.4.bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.1.4.=
bb</a><br>
&gt;<br>
&gt; diff --git a/meta-filesystems/recipes-filesystems/zfs/<a href=3D"http:=
//zfs_2.1.4.bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.1.4.bb</a> b/met=
a-filesystems/recipes-filesystems/zfs/<a href=3D"http://zfs_2.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">zfs_2.1.4.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..ebe2ec39d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-filesystems/recipes-filesystems/zfs/<a href=3D"http://zfs_2=
.1.4.bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.1.4.bb</a><br>
&gt; @@ -0,0 +1,54 @@<br>
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
&gt; +PACKAGECONFIG[pam] =3D &quot;--enable-pam --with-pamconfigsdir=3D${da=
tadir}/pam-configs --with-pammoduledir=3D${libdir}/security, --disable-pam&=
quot;<br>
&gt; +<br>
&gt; +EXTRA_OECONF:append =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 --disable-pyzfs \<br>
&gt; +=C2=A0 =C2=A0 --with-linux=3D${STAGING_KERNEL_DIR} --with-linux-obj=
=3D${STAGING_KERNEL_BUILDDIR} \<br>
&gt; +=C2=A0 =C2=A0 --with-mounthelperdir=3D${base_sbin} \<br>
&gt; +=C2=A0 =C2=A0 --with-udevdir=3D${base_libdir}/udev \<br>
&gt; +=C2=A0 =C2=A0 --enable-systemd \<br>
&gt; +=C2=A0 =C2=A0 --disable-sysvinit \<br>
&gt; +=C2=A0 =C2=A0 --without-dracutdir \<br>
&gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE:append =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 INSTALL_MOD_PATH=3D${D}${root_prefix} \<br>
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
&gt; View/Reply Online (#96960): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/96960" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/96960</a><br>
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

--000000000000a752bb05de520e55--


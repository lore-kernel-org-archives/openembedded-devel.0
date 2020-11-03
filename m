Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web08.82.1604377951257290711
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 20:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LeueICAC;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id g13so7235234qvu.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2020 20:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QKveD8nph7oRD9x1hU/0b1nDtysLz3+53hasuUA5ZlI=;
        b=LeueICACRgKYbnNPHLt6FSTr4eR8Uyr+3Nbb7wGUrn6yyJSZNzrQtf4YYi++9fkVrI
         fdTBBdc4coy+H6CXvpkJ0d3FF1lc8mRyusVPelYfHCc3E9aI8rT2qVsZOooKA7yKWBhL
         34Get4SVI0xrVgsfKe8cEJsI1J7dKF4CB0wPxBqiSlA+gAkrIMgl+R+WZbpQuIYHfW/x
         7xsZR9shFWIjp3g1c3iBD5lT6xK8qYqsFFB2cM0oE9x/g5f5EqXYw+xDVolRZz8QCfoU
         LXMQCcb8iuHEcsTou//GWT7foFNgZuwFoYli48T89E+LDuG4cEDE+cvWbJpXUnTupQUC
         cixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QKveD8nph7oRD9x1hU/0b1nDtysLz3+53hasuUA5ZlI=;
        b=BCZqLvCIZzQtyofXMsN0At+olx4WasSgkCtriaotBeEsudIbStUvAu6VnoPr11Atwg
         eXqSDNawwuTh3u2lKgKrKJREmBHQbN8WcmFjEDs/fq/U5i+Fc2dSYdR8MGKAQkW/xXOR
         IqohwzTMzoWO9sn/yKGdSO+paR7mAXLptut3tMgvNe4ISorrKU9D5ctCQkmShUpTStYc
         LIRa9TItjRwvch7FB3+lIH7CCvnLpSe4TIBGrDhN3jNo83bgkMd7sMi7civ03S87tKWW
         1kbOOR/UFbIjJOQbxe+j6UwYjhfhcX8OH4jKX16oJUmp7qo3R5cqoSBMK6jzxpyxh8Xa
         2a4Q==
X-Gm-Message-State: AOAM53036Ag9diI7/kNCbdLkEK8IIUtYZ8RbMdwuv7F6Png/zNzNGK/Y
	RqFbzAlqooORKjB0lqhSsQz2nuECDHSJYk6XMB4=
X-Google-Smtp-Source: ABdhPJzdPXZVQ0gyFOqrOblYo+cQ0ykDvv4U6rqI5yHDP4A85i3yMmwEHjOyRjxfgqgPM5b61bz1W5dgWsrbeTk2R7E=
X-Received: by 2002:a0c:b65b:: with SMTP id q27mr24416038qvf.8.1604377950326;
 Mon, 02 Nov 2020 20:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20201102091320.15732-1-yi.zhao@windriver.com> <CAMKF1sr721emgcyE=+GHPPiz1VZThqjWOXe01WQndv4qVMKDPw@mail.gmail.com>
 <ced6967d-c807-4352-1d0f-0e239aa2111f@windriver.com> <CAMKF1sqHR3_UK42eLMxQM2Ue_YHguAaCCHgY__1_9yG7rUMDGw@mail.gmail.com>
 <4b3ed683-da39-a447-688d-486af619c333@windriver.com>
In-Reply-To: <4b3ed683-da39-a447-688d-486af619c333@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 2 Nov 2020 20:32:19 -0800
Message-ID: <CAMKF1sqoNEJ6rL5Lh-RsM+9ZNin-0A34599NSnb-pJVdbFH5bQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] quagga: unify volatiles file name
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d092d505b32c5918"

--000000000000d092d505b32c5918
Content-Type: text/plain; charset="UTF-8"

Ok, thanks.

On Mon, Nov 2, 2020 at 6:50 PM Yi Zhao <yi.zhao@windriver.com> wrote:

>
> On 11/3/20 10:33 AM, Khem Raj wrote:
> > On Mon, Nov 2, 2020 at 6:31 PM Yi Zhao <yi.zhao@windriver.com> wrote:
> >>
> >> On 11/3/20 12:26 AM, Khem Raj wrote:
> >>> On Mon, Nov 2, 2020 at 1:13 AM Yi Zhao <yi.zhao@windriver.com> wrote:
> >>>> Make the volatiles file name starts with digital.
> >>> what does this get us ?
> >>
> >> Just want to make all volatiles file names uniform. I searched oe-core
> >> and meta-openembedded, only pulseaudio and quagga volatiles file names
> >> are not start with number value.
> >> $ ls /etc/default/volatiles
> >> 00_core  01_bootlogd  99_dbus  99_sshd  99_wpa_supplicant
> >> volatiles.03_quagga  volatiles.04_pulse
> > this will change the order of their execution, is the new order still
> > working without other side effects
>
>
> I have tested the changes and didn't find any side effects:
> 1. The volatile file only creates directories under /var/run or /var/log
> for its own package. It doesn't impact other packages.
> 2. The populate-volatile.sh service runs on RCS.d
> 3. The 00_create volatile file always run first to make sure the base
> directories /var/log, /var/run are created.
>
>
> //Yi
>
>
> >> //Yi
> >>
> >>
> >>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >>>> ---
> >>>>    meta-networking/recipes-protocols/quagga/quagga.inc | 4 ++--
> >>>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc
> b/meta-networking/recipes-protocols/quagga/quagga.inc
> >>>> index 11b7d576a..6df72427b 100644
> >>>> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> >>>> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> >>>> @@ -81,7 +81,7 @@ do_install () {
> >>>>        install -m 0644 ${WORKDIR}/watchquagga.default
> ${D}${sysconfdir}/default/watchquagga
> >>>>        install -m 0755 ${WORKDIR}/quagga.init
> ${D}${sysconfdir}/init.d/quagga
> >>>>        install -m 0755 ${WORKDIR}/watchquagga.init
> ${D}${sysconfdir}/init.d/watchquagga
> >>>> -    install -m 0644 ${WORKDIR}/volatiles.03_quagga
> ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
> >>>> +    install -m 0644 ${WORKDIR}/volatiles.03_quagga
> ${D}${sysconfdir}/default/volatiles/03_quagga
> >>>>
> >>>>        # Install sample configurations for the daemons
> >>>>        for f in bgpd vtysh isisd ospfd ripngd zebra ripd ospf6d; do
> >>>> @@ -106,7 +106,7 @@ do_install () {
> >>>>        sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/*
> >>>>        sed -i 's!/usr/bin/!${bindir}/!g'
> ${D}${sysconfdir}/init.d/quagga
> >>>>        sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/*
> ${D}${sysconfdir}/default/watchquagga
> >>>> -    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/*
> ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
> >>>> +    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/*
> ${D}${sysconfdir}/default/volatiles/03_quagga
> >>>>        sed -i
> 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!'
> ${D}${sysconfdir}/init.d/*
> >>>>        sed -i 's!--with-libtool-sysroot=[^ "]*!!'
> ${D}${includedir}/quagga/version.h
> >>>>
> >>>> --
> >>>> 2.17.1
> >>>>
> >>>>
> >>>> 
> >>>>
>

--000000000000d092d505b32c5918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Ok, thanks.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Nov 2, 2020 at 6:50 PM Yi Zhao &lt;<a href=3D"=
mailto:yi.zhao@windriver.com">yi.zhao@windriver.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)"><br>
On 11/3/20 10:33 AM, Khem Raj wrote:<br>
&gt; On Mon, Nov 2, 2020 at 6:31 PM Yi Zhao &lt;<a href=3D"mailto:yi.zhao@=
windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 11/3/20 12:26 AM, Khem Raj wrote:<br>
&gt;&gt;&gt; On Mon, Nov 2, 2020 at 1:13 AM Yi Zhao &lt;<a href=3D"mailto:=
yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt; wrot=
e:<br>
&gt;&gt;&gt;&gt; Make the volatiles file name starts with digital.<br>
&gt;&gt;&gt; what does this get us ?<br>
&gt;&gt;<br>
&gt;&gt; Just want to make all volatiles file names uniform. I searched oe=
-core<br>
&gt;&gt; and meta-openembedded, only pulseaudio and quagga volatiles file =
names<br>
&gt;&gt; are not start with number value.<br>
&gt;&gt; $ ls /etc/default/volatiles<br>
&gt;&gt; 00_core=C2=A0 01_bootlogd=C2=A0 99_dbus=C2=A0 99_sshd=C2=A0 99_wp=
a_supplicant<br>
&gt;&gt; volatiles.03_quagga=C2=A0 volatiles.04_pulse<br>
&gt; this will change the order of their execution, is the new order still=
<br>
&gt; working without other side effects<br>
<br>
<br>
I have tested the changes and didn&#39;t find any side effects:<br>
1. The volatile file only creates directories under /var/run or /var/log <=
br>
for its own package. It doesn&#39;t impact other packages.<br>
2. The populate-volatile.sh service runs on RCS.d<br>
3. The 00_create volatile file always run first to make sure the base <br>
directories /var/log, /var/run are created.<br>
<br>
<br>
//Yi<br>
<br>
<br>
&gt;&gt; //Yi<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@wind=
river.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 meta-networking/recipes-protocols/quagga/qua=
gga.inc | 4 ++--<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 2 insertions(+), 2 deletions=
(-)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/meta-networking/recipes-protocols/quagga/qua=
gga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc<br>
&gt;&gt;&gt;&gt; index 11b7d576a..6df72427b 100644<br>
&gt;&gt;&gt;&gt; --- a/meta-networking/recipes-protocols/quagga/quagga.inc=
<br>
&gt;&gt;&gt;&gt; +++ b/meta-networking/recipes-protocols/quagga/quagga.inc=
<br>
&gt;&gt;&gt;&gt; @@ -81,7 +81,7 @@ do_install () {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/wat=
chquagga.default ${D}${sysconfdir}/default/watchquagga<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/qua=
gga.init ${D}${sysconfdir}/init.d/quagga<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/wat=
chquagga.init ${D}${sysconfdir}/init.d/watchquagga<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/volatiles.03_qu=
agga=C2=A0 ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/volatiles.03_qu=
agga=C2=A0 ${D}${sysconfdir}/default/volatiles/03_quagga<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Install sample configuration=
s for the daemons<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in bgpd vtysh isisd ospf=
d ripngd zebra ripd ospf6d; do<br>
&gt;&gt;&gt;&gt; @@ -106,7 +106,7 @@ do_install () {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s!/usr/sbin/!${sbi=
ndir}/!g&#39; ${D}${sysconfdir}/init.d/*<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s!/usr/bin/!${bind=
ir}/!g&#39; ${D}${sysconfdir}/init.d/quagga<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s!/etc/!${sysconfd=
ir}/!g&#39; ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/watchquagg=
a<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 sed -i &#39;s!/var/!${localstatedir}/!g&#3=
9; ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/volatiles=
.03_quagga<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 sed -i &#39;s!/var/!${localstatedir}/!g&#3=
9; ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/03_quagga=
<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s!^PATH=3D.*!PATH=
=3D${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!&#39; ${D}${sysconf=
dir}/init.d/*<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s!--with-libtool-s=
ysroot=3D[^ &quot;]*!!&#39; ${D}${includedir}/quagga/version.h<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; 2.17.1<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;<br>
</blockquote></div></div>

--000000000000d092d505b32c5918--

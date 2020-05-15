Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.7071.1589513704022493979
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 20:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kZIKWTzO;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: mr.k.zawadzki@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id x5so1167322ioh.6
        for <Openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 20:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+3zziyaj1V/feytJxhyP6vV4nSe7dUqWQGJuGkkqyH0=;
        b=kZIKWTzOeu2vymtB2Zk74TNRiUbPU0F4Wch6TtTA8QwzFGucHemxiofRXF6lFcoaBD
         YrkmP9O0QvZOf2WYxYXdO0nI5rtExPaygZSbI9HME49gZE6j21F34P97w3X3AcqxeZu6
         LohZ91vHCboxKGP8Mqr+qz1qA1NmWR/0Q7geuuTuzVB7up9r1draYVOnJ1gMb7NoEZ2v
         sdUlNIkRXKj1wDdolE5IpUz3TVUnigfK7SSTq9Est61BfjcERoMgbujH87V73fC90FwU
         EwMDnf30UH/lw9XRddYbxuSCSfeiJo/5nUg2OHR44GioZJvlbjGxO2U58HOLilh8Uvr8
         XNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+3zziyaj1V/feytJxhyP6vV4nSe7dUqWQGJuGkkqyH0=;
        b=jWo468tMAB+eyff7esduZkCmQha+4lRczVHPHci7ktLeXW/udYNi0I/0CoX4dOy+Xm
         QC1sbaTdH26ETFDyKC2nb3G9A39e8PnetyrjALYjVdAOutC6uBa1d+F8JBV4pjc4kZ7O
         XweoeMz8gCrhSv9AdIACAieugwTwhjrl8szsAhbSMEmkqI7YH6wNzadl4dLq0eIta693
         EhfQFDT2e0dJVPgD2mQW4+oVsVOztI86hVXS4fwUjGF7CVdebmESrukwWJ6knP9zg0aP
         +WbYJNdSBJsNG1Y1ObSahZVZtmNW3FXa8PSULf06iqNCO4A0IWGcxOUyr9Qpdh+i5pIC
         PFfA==
X-Gm-Message-State: AOAM532X8O7ZKogoPScnTmlCAjhRZniwBh2ed1byS7F6XlbtHnVTVEZ5
	higaP8Y3hQ2+CdhiPi/YxIaekNtPlh/5nXHJ+Es=
X-Google-Smtp-Source: ABdhPJxj0JZFl/rhliotuTWTS4MBRrH5j+TEZBgKkXHk/EdUOV+OWvmC6fN/jW2eFvbByd54uaqGfT6Ga0YjdPgeGDI=
X-Received: by 2002:a05:6602:15d4:: with SMTP id f20mr1093218iow.92.1589513703477;
 Thu, 14 May 2020 20:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAFZh4h-4B99SbAFeSWE_Bq3=SprMQeoCmwD4L2E3xNabQVY1bA@mail.gmail.com>
In-Reply-To: <CAFZh4h-4B99SbAFeSWE_Bq3=SprMQeoCmwD4L2E3xNabQVY1bA@mail.gmail.com>
From: "Krzysztof Zawadzki" <mr.k.zawadzki@gmail.com>
Date: Fri, 15 May 2020 05:34:52 +0200
Message-ID: <CAKdBavF5xsoN_VBrzRHtLzgRWVWabE5cDdhxJAEzkw3ZaXRePw@mail.gmail.com>
Subject: Re: [oe] Looks like systemd is a split package ... but where is coredumpctl?
To: Brian Hutchinson <b.hutchman@gmail.com>
Cc: yocto@yoctoproject.org, Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a957c305a5a77fa6"

--000000000000a957c305a5a77fa6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/syst=
emd/systemd_245.5.bb?h=3Dmaster

I see that systemd recipe should prepare:

${bindir}/coredumpctl

Try to add to systemd recipe:

PACKAGECONFIG +=3D "coredump"

Best Regards,
Krzysztof Zawadzki

pt., 15 maj 2020 o 04:27 Brian Hutchinson <b.hutchman@gmail.com> napisa=C5=
=
=82(a):

> Hi,
>
> I'm trying to figure out how to configure /etc/systemd/coredump.conf in
> order to get coredump files.
>
> I don't appear to have coredumpctl nor can I find a recipe in Yocto or O=
E
> Core that looks like it builds it.  I've looked at all (I think) systemd
> packages that were generated when I built systemd and I don't see any th=
at
> include coredumpctl.
>
> Then I found this thread:
>
>
> https://www.openembedded.org/pipermail/openembedded-core/2018-July/15295=
9.html
>
> ... which left me even more confused.
>
> If I uncomment and define the settings in /etc/systemd/coredump.conf, wi=
ll
> that enable coredumps or is there more to it than that?  I'm not sure ho=
w
> to get systemd-coredump going on a core-image-base image and Google is j=
ust
> turning up noise from other distros that don't appear to match what I'm
> seeing in Yocto/OE.  It feels like there should be a systemd-coredump
> recipe like in Debian but I'm not seeing a layer that provides something
> like that.   Maybe I'm not looking in the right place but I've been doin=
g
> this a while and I'm kind of stumped.
>
> Thanks for any hints to point me in the right direction.
>
> Regards,
>
> Brian
>=20
>

--000000000000a957c305a5a77fa6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div>Hi,</div><div><br></d=
iv><div><a href=3D"http://cgit.openembedded.org/openembedded-core/tree/meta=
/recipes-core/systemd/systemd_245.5.bb?h=3Dmaster">http://cgit.openembedded=
.org/openembedded-core/tree/meta/recipes-core/systemd/systemd_245.5.bb?h=3D=
master</a></div><div><br></div><div>I see that systemd recipe should prepar=
e:
<pre><code><pre><span class=3D"gmail-s2">${bindir}/coredumpctl </span></pr=
e></code></pre><pre><span style=3D"font-family:arial,sans-serif">Try to add=
 to systemd recipe:</span><code><pre><span class=3D"gmail-nv">PACKAGECONFIG=
 +=3D &quot;</span><span class=3D"gmail-nv"><span class=3D"gmail-nv">coredu=
mp</span><span class=3D"gmail-p"></span>&quot;<br><br></span></pre></code><=
/pre></div></div><div>Best Regards,</div><div>Krzysztof Zawadzki<br></div><=
div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">pt., 15 maj 2020 o 04:27=C2=A0Brian Hutchinson &lt;<a href=3D"mailto:b.=
hutchman@gmail.com">b.hutchman@gmail.com</a>&gt; napisa=C5=82(a):<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi,=
</div><div><br></div><div>I&#39;m trying to figure out how to configure /et=
c/systemd/coredump.conf in order to get coredump files.</div><div><br></div=
><div>I don&#39;t appear to have coredumpctl nor can I find a recipe in Yoc=
to or OE Core that looks like it builds it.=C2=A0 I&#39;ve looked at all (I=
 think) systemd packages that were generated when I built systemd and I don=
&#39;t see any that include coredumpctl.</div><div><br></div><div>Then I fo=
und this thread:</div><div><br></div><div><span><span><a href=3D"https://ww=
w.openembedded.org/pipermail/openembedded-core/2018-July/152959.html" targe=
t=3D"_blank">https://www.openembedded.org/pipermail/openembedded-core/2018-=
July/152959.html</a></span></span></div><div><span><span><br></span></span>=
</div><div><span><span>... which left me even more confused.</span></span><=
/div><div><span><span><br></span></span></div><div><span><span>If I uncomme=
nt and define the settings in /etc/systemd/coredump.conf, will that enable =
coredumps or is there more to it than that?=C2=A0 I&#39;m not sure how to g=
et systemd-coredump going on a core-image-base image and Google is just tur=
ning up noise from other distros that don&#39;t appear to match what I&#39;=
m seeing in Yocto/OE.=C2=A0 It feels like there should be a systemd-coredum=
p recipe like in Debian but I&#39;m not seeing a layer that provides someth=
ing like that. =C2=A0 Maybe I&#39;m not looking in the right place but I&#3=
9;ve been doing this a while and I&#39;m kind of stumped.<br></span></span>=
</div><div><span><span><br></span></span></div><div><span><span>Thanks for =
any hints to point me in the right direction.</span></span></div><div><span=
><span><br></span></span></div><div><span><span>Regards,</span></span></div=
><div><span><span><br></span></span></div><div><span><span>Brian<br></span>=
</span></div></div>
<br>
</blockquote></div></div>

--000000000000a957c305a5a77fa6--

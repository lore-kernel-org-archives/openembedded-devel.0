Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E88ECDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 14:22:32 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.12920.1697120545134098176
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 07:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AD/JYQoF;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-57e4459aa29so499004eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697120544; x=1697725344; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kpzu+Lx7gRFJQDCUVXeZ3w/uCtkPafrjrzbMt8ERhfs=;
        b=AD/JYQoFP+f9s3wbU5/w8i8EFc0cJ2my1Ssi8KDSvq5kOkkJ9r6iJ18PlnD7n7PS1f
         ToKlv7WQjd4tYouKpk20w0UNoDLKw0xWxIWBDEnF4/Lrwl1PhmsqdEa/H33h3gkITFoF
         rx1bTj2rcctJi1208LZeJJaI82v2m+fyiNKm3VpIfGNgF1kzqW+V0X7eUhic7OdNbVwk
         ISr4nz5NVN7s7wc6jqO5cXJunk2Ty0QJSBV2dsIqyDTzAMjxCTsIl1xVXDM1WJRoWm18
         7zUFI7Kooh/sBHOOMim/Et/u81ZFWurUFCmPDRujP5J+PcAKFxsNDd+aLlN3KhzKQUht
         ggvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697120544; x=1697725344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpzu+Lx7gRFJQDCUVXeZ3w/uCtkPafrjrzbMt8ERhfs=;
        b=CAG3D5CDcO38kpd2Gv2ShGjL8Z2lnGgwGn5ZZ+Tr35AsWdZ29aN8+m9rPDnrdMZAMl
         tzYWNN1nA9toE3UcfKOFaItaHuX8eVGuN/fX6BfOZFkeoh/dazn/Ar/is1GIE6iLKKVU
         HqLvcOVR03ABFXXPzGCGZ6OodLSALlS1sPuzFWa8nL6Xcnnv8Hw95KMB+4yaeQ92o/ti
         MWp6aQzUZ/VfjCYoq7M7mFIwXSXK5dQrrMLKDZYsyJv3M+mIMc5k+Laz4em/QRiMdjQC
         sRoab0mf0aTFFY0SiIJw/Dna/f79hhNtwFS8LO308ejAwVzqvEOP9fJg4NU8cz65eF1h
         Rxsw==
X-Gm-Message-State: AOJu0Yzvcg/HH4Pumo1N+wHHVVsxDZPqQSA2dhOgxl1CUqLxJMga57qJ
	7EjsEaSs/UxQ3uJfOXEVaB+lX3DNr8Y0ZsQl7W2rVFkA
X-Google-Smtp-Source: AGHT+IEKbchA63CenlWZjFXG39u/H9SEOWUkPFGZV842opNE5yci+/1Q134duL1izPPti9jjQ4E6ho1WgljIotqRSgo=
X-Received: by 2002:a05:6870:d184:b0:1e9:722e:2004 with SMTP id
 a4-20020a056870d18400b001e9722e2004mr4590431oac.4.1697120544323; Thu, 12 Oct
 2023 07:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231011163346.1856498-1-luca.fancellu@arm.com>
 <20231011163346.1856498-4-luca.fancellu@arm.com> <CAMKF1so89orai-uOFF3pKRUze2v9BEC6s5Yy7K8DFjWFH_CPyQ@mail.gmail.com>
 <0AF6ED9B-AD74-4DC5-B65F-F1EE861818AA@arm.com>
In-Reply-To: <0AF6ED9B-AD74-4DC5-B65F-F1EE861818AA@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Oct 2023 07:22:13 -0700
Message-ID: <CAMKF1soL+SMx5cHLTBnTZQ5x_YKbYSr2TnCTdBqkEut9Ly=Kug@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] linuxptp: add systemd services
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002f7e10060785abb7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 14:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105454

--0000000000002f7e10060785abb7
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 12, 2023 at 2:56 AM Luca Fancellu <Luca.Fancellu@arm.com> wrote:

> Hi Khem,
>
> >>
> >> diff --git
> a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.service
> b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.service
> >> new file mode 100644
> >> index 000000000000..dd2512bdca11
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@
> .service
> >> @@ -0,0 +1,13 @@
> >> +[Unit]
> >> +Description=Synchronize system clock or PTP hardware clock (PHC)
> >> +Documentation=man:phc2sys
> >> +Requires=ptp4l.service
> >> +After=ptp4l.service
> >> +Before=time-sync.target
> >> +
> >> +[Service]
> >> +Type=simple
> >> +ExecStart=/usr/sbin/phc2sys -w -s %I
> >
> > Can these paths be derived from ${sbindir} during do_install.
> >
> >
> >> +
> >> +[Install]
> >> +WantedBy=multi-user.target
> >> diff --git
> a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.service
> b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.service
> >> new file mode 100644
> >> index 000000000000..1bad2d72df6b
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@
> .service
> >> @@ -0,0 +1,11 @@
> >> +[Unit]
> >> +Description=Precision Time Protocol (PTP) service for %I
> >> +Documentation=man:ptp4l
> >> +After=sys-subsystem-net-devices-%i.device
> >> +
> >> +[Service]
> >> +Type=simple
> >> +ExecStart=/usr/sbin/ptp4l -f /etc/linuxptp/ptp4l.conf -i %I
> >
> > Can these paths be derived from ${sbindir} and ${sysconfdir} bitbake
> variables
> > during do_install ? This should make them more portable
>
> Yes I can do that, for both ${sbindir} and ${sysconfdir}, I see the
> makefile sets
> sbindir = $(prefix)/sbin, we already pass ${prefix} in the make command
> line,
> do you think we should pass also sbindir= to ensure consistency?


I think it is that we store the origin service file as a template like
service.in and then when installing it during do_install substitute the
paths with original value of these variables there are many examples of
this in metadata

>
>
>

--0000000000002f7e10060785abb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 12, 2023 at 2:56 AM Luca Fancellu &lt;<a href=
=3D"mailto:Luca.Fancellu@arm.com">Luca.Fancellu@arm.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Hi Khem,<br>
<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/system=
d/phc2sys@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd=
/phc2sys@.service<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000000..dd2512bdca11<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2s=
ys@.service<br>
&gt;&gt; @@ -0,0 +1,13 @@<br>
&gt;&gt; +[Unit]<br>
&gt;&gt; +Description=3DSynchronize system clock or PTP hardware clock (PHC=
)<br>
&gt;&gt; +Documentation=3Dman:phc2sys<br>
&gt;&gt; +Requires=3Dptp4l.service<br>
&gt;&gt; +After=3Dptp4l.service<br>
&gt;&gt; +Before=3Dtime-sync.target<br>
&gt;&gt; +<br>
&gt;&gt; +[Service]<br>
&gt;&gt; +Type=3Dsimple<br>
&gt;&gt; +ExecStart=3D/usr/sbin/phc2sys -w -s %I<br>
&gt; <br>
&gt; Can these paths be derived from ${sbindir} during do_install.<br>
&gt; <br>
&gt; <br>
&gt;&gt; +<br>
&gt;&gt; +[Install]<br>
&gt;&gt; +WantedBy=3Dmulti-user.target<br>
&gt;&gt; diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/system=
d/ptp4l@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/p=
tp4l@.service<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000000..1bad2d72df6b<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l=
@.service<br>
&gt;&gt; @@ -0,0 +1,11 @@<br>
&gt;&gt; +[Unit]<br>
&gt;&gt; +Description=3DPrecision Time Protocol (PTP) service for %I<br>
&gt;&gt; +Documentation=3Dman:ptp4l<br>
&gt;&gt; +After=3Dsys-subsystem-net-devices-%i.device<br>
&gt;&gt; +<br>
&gt;&gt; +[Service]<br>
&gt;&gt; +Type=3Dsimple<br>
&gt;&gt; +ExecStart=3D/usr/sbin/ptp4l -f /etc/linuxptp/ptp4l.conf -i %I<br>
&gt; <br>
&gt; Can these paths be derived from ${sbindir} and ${sysconfdir} bitbake v=
ariables<br>
&gt; during do_install ? This should make them more portable<br>
<br>
Yes I can do that, for both ${sbindir} and ${sysconfdir}, I see the makefil=
e sets<br>
sbindir =3D $(prefix)/sbin, we already pass ${prefix} in the make command l=
ine,<br>
do you think we should pass also sbindir=3D to ensure consistency?</blockqu=
ote><div dir=3D"auto"><br></div><div dir=3D"auto">I think it is that we sto=
re the origin service file as a template like <a href=3D"http://service.in"=
>service.in</a> and then when installing it during do_install substitute th=
e paths with original value of these variables there are many examples of t=
his in metadata=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
</blockquote></div></div>

--0000000000002f7e10060785abb7--


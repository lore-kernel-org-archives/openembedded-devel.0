Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF07C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:28:24 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.1455.1639708104123116780
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nxmjfdf8;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id p19so1201911qtw.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SuQPeN1EBrA24yX61yOHQHsa1qYflqJrVV4dPF21Ugo=;
        b=Nxmjfdf8tZ+tQJviLzeG2fmsiaIBlRFqRQ4xAhgdYKU9byKxHxpAqe86LeZ92AczbH
         igH5TF0npyOdoxqb3GWiAE1+t6/W4MLpyaL+n0cvjaH8km+3EzdeAoAkoBvUUTTX/NBu
         aWdYZU/4rWFLD52wgoHjNMfjQqvypE/PDLH5c7xw3kkTgLfobYpLT6DicI5SV/iem4JD
         rXDDDmD48Kmyw/mxdNEA1Rqa45/hU0/qR929CoXzF9Z6qXXBSh9iBPtAX6R7Yzax5Sb/
         Pk1sa1IaxeU9fp1FKYRQaWXs2igA99B2JqYx7QGVc0wWGH1eDTbfOgFryYktSu/bz5Xb
         YR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SuQPeN1EBrA24yX61yOHQHsa1qYflqJrVV4dPF21Ugo=;
        b=tx7t801tZ4jaOuPbAW+P6IsZ7HtMMGQ2daMU1A09YpSiE0HfUnaeR8PvVVwMfIFFS7
         Kk5Ni84LZfWhbGAUIy8S8SIODA6oNMTmLhNAqe99uPTt8Hw0iX1QVKahb+txZ7vrR40i
         jnI8KqmOgrkIm/+gI6nEFpWyims3fpc75lS8llk5JULD4VsVdGv68Jbp3ioqhlSaC0N0
         ZtGdotfgw09UAfkpaswSmDL7HEo4hMFlX/rH5ReChM8+IMR7ubtneyl10HLBB5kJPI6G
         l3q7G0U9e0T4e2ZihESMJYz0t9L190NOqml8i2IlNvPauSMcmcmFdI8fMzvxYTMwiY/p
         ogmw==
X-Gm-Message-State: AOAM5327yCHdvz/XGjPn3u6BlIsT0SVIPZoO16aaKGkHEhr/BO+PGlQ2
	tAyGhQxQjlbTg8Cek5nJUnCdJUaMnJd2/FZWl6DxqXp8
X-Google-Smtp-Source: 
 ABdhPJzJ1v/qeAJ1B++rvZad2MUAoHx5q5JSX+jV2GbAV+n+DGHW2gxI8DhUOHbw12rdUdUzeNalwugGvbKRjVScFxM=
X-Received: by 2002:ac8:518e:: with SMTP id c14mr707671qtn.665.1639708103103;
 Thu, 16 Dec 2021 18:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20211216083115.417282-1-jk@codeconstruct.com.au>
 <20211216083115.417282-2-jk@codeconstruct.com.au>
 <CAMKF1srWwXbEGLwptNaFWChuFiKfeXNbPwqeKh8uk2DP5FoCkw@mail.gmail.com>
 <52d6b46ca28b6048f274499846e45daccb8d4ec1.camel@codeconstruct.com.au>
In-Reply-To: 
 <52d6b46ca28b6048f274499846e45daccb8d4ec1.camel@codeconstruct.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Dec 2021 18:28:12 -0800
Message-ID: 
 <CAMKF1sp9Uq-6vkvGNVcbh6Wk-cL0P91gLzUJY3=0qQV8jsnW9w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/2] mctp: install dbus service
 configuration
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000557f405d34e4b60"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 02:28:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94416

--0000000000000557f405d34e4b60
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 5:57 PM Jeremy Kerr <jk@codeconstruct.com.au> wrote:

> Hi Khem,
>
> > > +FILES:${PN} += " \
> > > +        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
> > > +                '${datadir}/dbus-1/system.d/mctpd.conf', '', d)} \
> > > +"
> > > +
> >
> > this should go below do_install and other functions.
>
> OK, can do! I'll send a v2 shortly.
>
> > You can run ./contrib/oe-stylize.py also to get some help on
> > formatting
>
> Hm, that seems to make a bit of a mess of the recipe - it moves a bunch
> of variable declarations to within the do_install:append() block.
>
> I'm no expert on the full syntax, but something like this might fix it:
>
> diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
> index e1ba1b321..eac096a80 100755
> --- a/contrib/oe-stylize.py
> +++ b/contrib/oe-stylize.py
> @@ -211,7 +211,7 @@ OE_vars = [
>  ]
>
>  varRegexp = r'^([a-zA-Z_0-9${}-]*)([ \t]*)([+.:]?=[+.]?)([ \t]*)([^\t]+)'
> -routineRegexp = r'^([a-zA-Z0-9_ ${}-]+?)\('
> +routineRegexp = r'^([a-zA-Z0-9_ ${}:-]+?)\('
>
>  # Variables seen in the processed .bb
>  seen_vars = {}
>
>
> - I can send that as a proper patch if that's the correct approach.
>

This seems fine we have new override operator and stylize script needs
adjusting


> Cheers,
>
>
> Jeremy
>

--0000000000000557f405d34e4b60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Dec 16, 2021 at 5:57 PM Jeremy Kerr &lt;<a href=3D"=
mailto:jk@codeconstruct.com.au">jk@codeconstruct.com.au</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)">Hi Khem,<br>
<br>
&gt; &gt; +FILES:${PN} +=3D &quot; \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains(=
&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#39;${datadir}/dbus-1/system.d/mctpd.conf&#39;=
, &#39;&#39;, d)} \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +<br>
&gt; <br>
&gt; this should go below do_install and other functions.<br>
<br>
OK, can do! I&#39;ll send a v2 shortly.<br>
<br>
&gt; You can run ./contrib/oe-stylize.py also to get some help on<br>
&gt; formatting<br>
<br>
Hm, that seems to make a bit of a mess of the recipe - it moves a bunch<br>
of variable declarations to within the do_install:append() block.<br>
<br>
I&#39;m no expert on the full syntax, but something like this might fix it:=
<br>
<br>
diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py<br>
index e1ba1b321..eac096a80 100755<br>
--- a/contrib/oe-stylize.py<br>
+++ b/contrib/oe-stylize.py<br>
@@ -211,7 +211,7 @@ OE_vars =3D [<br>
=C2=A0]<br>
<br>
=C2=A0varRegexp =3D r&#39;^([a-zA-Z_0-9${}-]*)([ \t]*)([+.:]?=3D[+.]?)([ \t=
]*)([^\t]+)&#39;<br>
-routineRegexp =3D r&#39;^([a-zA-Z0-9_ ${}-]+?)\(&#39;<br>
+routineRegexp =3D r&#39;^([a-zA-Z0-9_ ${}:-]+?)\(&#39;<br>
<br>
=C2=A0# Variables seen in the processed .bb<br>
=C2=A0seen_vars =3D {}<br>
<br>
<br>
- I can send that as a proper patch if that&#39;s the correct approach.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This seems fine =
we have new override operator and stylize script needs adjusting=C2=A0</div=
><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)"><br>
Cheers,<br>
<br>
<br>
Jeremy<br>
</blockquote></div></div>

--0000000000000557f405d34e4b60--


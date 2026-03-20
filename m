Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E581099B34
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 18:25:47 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19855.1774031142982876735
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 11:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwgOrD5s;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64c9ebd1369so2315196d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 11:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774031142; cv=none;
        d=google.com; s=arc-20240605;
        b=AZweQKO8z8hd4MGLQh1nwRAdxUbZ3BPFSR4SNFMuU5DUblyvYinp0NtM7gZTRqkrXD
         h/UPOfHhSSGlEORh+buahA7WVPjS/Tx8Sv4ZueSnCb6UUxeuUXQhKdXy0qZmUe3uN6/0
         lXYfc/6g0xr8xssuWag1lrdWL1ueAVlE8Xa4owEfH0qrOCltSBAjdE4OWZOqjojQa5A3
         VnHYRQIRPoqtVT6cXtY57YrwU18hsLKlhsGBpP1bQ59qiVB1MK64vyrXCu6sE3bscmW8
         9PxB6ctNHq/hpfdE9sG2rBHw35C5MZdsWgr+txHHiOImnD9/cO+BuJ3Z6S51w9aQ7V3k
         zEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ik/END/95fqWiTQyWOfTcaLq2wlRkaGkKINvvo38Uto=;
        fh=lmVfLuXiORWQ6/4diYrzJXM3e5aGWnwjhaIT8qJCvr0=;
        b=VzdBX8XIn/ZYXrVBYoSX0ywN8qED2mitZqnZJR9jtsbfrUNEIw61tKviBt5VLRoLyp
         Yw7MKBwtAdrxx5nZCIWdBMlDFHt2MuSOLRV9TeT/hK+WM37Bt3BFx6J3Qm/OAA+iWETJ
         4cVf/FjroqbLSykom+Gdwx7UJd7Y1A9HaApuADL2E/ycmWD9dIu6F0i4O1hBr/XSAMRS
         awoWMpAPJmXOZBifoCTAiivnUh2aFK2dG/D3ioApTAYwZX5bQwCsS79WPTXO5vCeF2xs
         u1hnr/g9nyCxum8kva4adjOvZJ7P0O/ZENTX/IGhB9LzfVs/+8sD4hTimRnKEULmEi1O
         LEMA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774031142; x=1774635942; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ik/END/95fqWiTQyWOfTcaLq2wlRkaGkKINvvo38Uto=;
        b=kwgOrD5sn8KNE9WUwIcb1JJ7dLELwCIc2rGrRQfgNbWBcksjrHgiLfYYXsBvxniZK6
         1RGV6YIKrqk+R6mJfrSRx5tBbbF9e1QWTajnHFCnXnZBYWUE0GUC9499XKGDidL/obv/
         I+QtvNZk6rQpFefg16zFLffOnj7jNDZPLS890wXjpsu7LFQBaSPPRGwbU7DaF+zCM60G
         IwIx4yskEe9w9ak423lA7VdOM0ckyVhxyE6xw2KHZR1+YjkTOBUFYUd1PMx9a7J38wKW
         R5yHviYpzW8Twtc8sC5+4aGurVm4iIDlHpd0/4I0XbiBOdkTOW9k45/5RleomyEOBKfD
         nI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031142; x=1774635942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik/END/95fqWiTQyWOfTcaLq2wlRkaGkKINvvo38Uto=;
        b=fEoXeNJDKPbWDuwmIvCDHu1neotMO8HzgVKgBrmgbXVm3vZWiNsqEEWatcYREovRcs
         hWeLUUFhsvresN+6alwmxkfDcCA3lS3G0RDEQka/SrDueB7PQiWRezZuS8LoZa7s6C3b
         PGYZZ2NYiFVG6XwBjbIGnuLXqQRAcXIC2wCnWUjaUWdZ9ixG7XKgYJfgDyww0vh22bE7
         r9YallbsDLU046Yg47zZEhTlRnED/LwyxP6a7ihRQU4dHzO4kFt1ulkPljJr5/NSbrg3
         aFZrLgiDYaoZxXb/oyVnRiF9PY6tF6kfNok8sG4TG8a5d987yzUhxW5tIutccGcHeVgh
         038A==
X-Gm-Message-State: AOJu0Ywy8q1Iv3EB7d+UF5tvySJoUixhhxYwGwT7WQTn+pZiB3OcoM5O
	wUjPb6I2KTt9RVzhmMUkSf0UkrWUjBKTKTX7TqJ2PbDtrK5A/OlODXHsqzQ5AaqZME4UONhA4e1
	c5euNxf+kB7wsfLos7Pbsgv4nyAM/pUZlPw==
X-Gm-Gg: ATEYQzzzElkSw+IQoA7r+SEcKbTpBj9dN4+MDZwuH8EZXvfx2uRpYocXvYxQFOZ287o
	CFELGfGEup7i+gN7Ql4nCE79VV6C+psXVoHDAyzDQY8bKDA22usGnT76Tg1iGDQ3mO+jNub8G3H
	5fb8lzUw5piF+b4g0tHry6tJ8NK2uYWvSC8oGV0S3qyPiqU/vDOQPgGUJubLL1md9ytksVTWY50
	2/TM8MpxWPg8/7tEkvJYxWS03J7goL5Lz7wuoFSsdXMJFabM6RmwAjZo5rne7HlSiDacTU2nyxT
	2rSvdZI0aR572ongV2kzjNsLZorF8jUPDj6sWCbkbfUMJ7xINt4745+pBfGfLg1rIKkE2w9/yM0
	pXWpFN7HieByhPAn+YN94PPr+sbo+xWsCFVK7pFdQutdfCw7kVoh4SeeAgsQ=
X-Received: by 2002:a05:690e:687:b0:64a:deac:d943 with SMTP id
 956f58d0204a3-64eaa69e091mr2627442d50.10.1774031141763; Fri, 20 Mar 2026
 11:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com> <c0e10c9a-39fd-4cf6-9868-e1b85649167e@gmail.com>
In-Reply-To: <c0e10c9a-39fd-4cf6-9868-e1b85649167e@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Mar 2026 11:25:30 -0700
X-Gm-Features: AaiRm508Y5RmOGUE6eFq_HLsH6WFzqY28kVNYzOoulUXBldf-5Ebn3gjXlTVUFQ
Message-ID: <CAMKF1spU5Au-=maJF42O7BoOPFNgnzRq6-UCs=LgN=qj+pBVdQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/8] python3-xstatic-font-awesome:
 Upgrade to 6.2.1.2
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000068005064d78d038"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 18:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125452

--000000000000068005064d78d038
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026, 10:11=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:

>
> On 3/20/26 18:01, Khem Raj via lists.openembedded.org wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > License-Update: Updated font-awesome version number to 6.2.1
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...e_6.2.1.1.bb =3D> python3-xstatic-font-awesome_6.2.1.2.bb} | 6 +++-=
--
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-python/recipes-devtools/python/{
> python3-xstatic-font-awesome_6.2.1.1.bb =3D>
> python3-xstatic-font-awesome_6.2.1.2.bb} (61%)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-xstatic-font-awesome_6.2.1.1.bb
> b/meta-python/recipes-devtools/python/
> python3-xstatic-font-awesome_6.2.1.2.bb
> > similarity index 61%
> > rename from meta-python/recipes-devtools/python/
> python3-xstatic-font-awesome_6.2.1.1.bb
> > rename to meta-python/recipes-devtools/python/
> python3-xstatic-font-awesome_6.2.1.2.bb
> > index 0562cc2671..934b236983 100644
> > --- a/meta-python/recipes-devtools/python/
> python3-xstatic-font-awesome_6.2.1.1.bb
> > +++ b/meta-python/recipes-devtools/python/
> python3-xstatic-font-awesome_6.2.1.2.bb
> > @@ -2,12 +2,12 @@ DESCRIPTION =3D "Font Awesome icons packaged for
> setuptools (easy_install) / pip."
> >  HOMEPAGE =3D "https://pypi.python.org/pypi/XStatic-Font-Awesome"
> >  SECTION =3D "devel/python"
> >  LICENSE =3D "Apache-2.0"
> > -LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;md5=3Df1a2fe131dcb2fc6243c26cf05ecdb36"
> > +LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;md5=3D7c083fdfe0b927a9de368a17fbf13b20"
>
>
> This file doesn't seem to say much about the license, only that it's the
> same as font-awesome. There is however a license file in
> xstatic/pkg/font_awesome/data/LICENSE.txt path, which seems to be the
> license it refers to. One thing worth noting is that searching for
> "apache" brings no results in that file.
>
> What if we would check that file instead of pkg-info, and switch to
> "OFL-1.0 & MIT & CC-BY-4.0" (or similar)?
>
>
> Sounds good to me
>


> >
> > -PYPI_PACKAGE =3D "XStatic-Font-Awesome"
> > +PYPI_PACKAGE =3D "xstatic_font_awesome"
> >  UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> >
> > -SRC_URI[sha256sum] =3D
> "f075871096128638f2e1539020d8227754c3d885dd68e7ee6de9a01235076828"
> > +SRC_URI[sha256sum] =3D
> "9f3cb2f038fad7d352722375d3f25af346da9ee093ed9dc2c8c46bd911ab1971"
> >
> >  DEPENDS +=3D " \
> >      python3-xstatic \
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#125441):
> https://lists.openembedded.org/g/openembedded-devel/message/125441
> > Mute This Topic: https://lists.openembedded.org/mt/118421458/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000068005064d78d038
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 20, 2026, 10:11=E2=
=80=AFAM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com">skandi=
graun@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
On 3/20/26 18:01, Khem Raj via <a href=3D"http://lists.openembedded.org" re=
l=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
&gt; <br>
&gt; License-Update: Updated font-awesome version number to 6.2.1<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...<a href=3D"http://e_6.2.1.1.bb" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">e_6.2.1.1.bb</a> =3D&gt; <a href=3D"http://python3-xstat=
ic-font-awesome_6.2.1.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>python3-xstatic-font-awesome_6.2.1.2.bb</a>} | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-xstatic-font-awesome_6.2.1.1.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">python3-xstatic-font-awesome_6.2.1.1.bb</a> =3D&gt; <a href=3D"=
http://python3-xstatic-font-awesome_6.2.1.2.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">python3-xstatic-font-awesome_6.2.1.2.bb</a>} (61%)<br>
&gt; <br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-xstatic-font-awesome_6.2.1.1.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">python3-xstatic-font-awesome_6.2.1.1.bb</a> b/meta-python/recip=
es-devtools/python/<a href=3D"http://python3-xstatic-font-awesome_6.2.1.2.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-xstatic-font-awe=
some_6.2.1.2.bb</a><br>
&gt; similarity index 61%<br>
&gt; rename from meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-xstatic-font-awesome_6.2.1.1.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">python3-xstatic-font-awesome_6.2.1.1.bb</a><br>
&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://python=
3-xstatic-font-awesome_6.2.1.2.bb" rel=3D"noreferrer noreferrer" target=3D"=
_blank">python3-xstatic-font-awesome_6.2.1.2.bb</a><br>
&gt; index 0562cc2671..934b236983 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-xs=
tatic-font-awesome_6.2.1.1.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">python3-xstatic-font-awesome_6.2.1.1.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-xs=
tatic-font-awesome_6.2.1.2.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">python3-xstatic-font-awesome_6.2.1.2.bb</a><br>
&gt; @@ -2,12 +2,12 @@ DESCRIPTION =3D &quot;Font Awesome icons packaged fo=
r setuptools (easy_install) / pip.&quot;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/XStat=
ic-Font-Awesome" rel=3D"noreferrer noreferrer" target=3D"_blank">https://py=
pi.python.org/pypi/XStatic-Font-Awesome</a>&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;devel/python&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3Df1a2fe131dcb2fc6243c=
26cf05ecdb36&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D7c083fdfe0b927a9de36=
8a17fbf13b20&quot;<br>
<br>
<br>
This file doesn&#39;t seem to say much about the license, only that it&#39;=
s the<br>
same as font-awesome. There is however a license file in<br>
xstatic/pkg/font_awesome/data/LICENSE.txt path, which seems to be the<br>
license it refers to. One thing worth noting is that searching for<br>
&quot;apache&quot; brings no results in that file.<br>
<br>
What if we would check that file instead of pkg-info, and switch to<br>
&quot;OFL-1.0 &amp; MIT &amp; CC-BY-4.0&quot; (or similar)?<br>
<br><br>Sounds good to me=C2=A0<br></blockquote></div></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_contai=
ner"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; -PYPI_PACKAGE =3D &quot;XStatic-Font-Awesome&quot;<br>
&gt; +PYPI_PACKAGE =3D &quot;xstatic_font_awesome&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
&gt; <br>
&gt; -SRC_URI[sha256sum] =3D &quot;f075871096128638f2e1539020d8227754c3d885=
dd68e7ee6de9a01235076828&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;9f3cb2f038fad7d352722375d3f25af346da9ee0=
93ed9dc2c8c46bd911ab1971&quot;<br>
&gt; <br>
&gt;=C2=A0 DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-xstatic \<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#125441): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/125441" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/125=
441</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11842145=
8/6084445" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/118421458/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:skandigr=
aun@gmail.com" target=3D"_blank" rel=3D"noreferrer">skandigraun@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000068005064d78d038--


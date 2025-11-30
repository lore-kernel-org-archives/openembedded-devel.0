Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD0FCFD376
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 18:39:16 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3004.1764527947695172805
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 10:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MgM5D8xL;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6420dc2e5feso2586206d50.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 10:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764527947; x=1765132747; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4X8OOokLzQt/YM/ijLCPnnpDsTLPJicjgv1pbl/0tKc=;
        b=MgM5D8xLBGcBEwVIGjhWT+NUmvkUmKiQOEp9QAuKcov1hA4HTS+eJKD35G9Prex4rH
         B1eMF4qp8sk/i0wcFe5MrHMVkieC+irryYDxcrppPlnx81t+ip9lQxJcKRSn/YbRUSLI
         YxjNMtV/pw07Yz89O2faA3Iwkj/sxcGpzjKaw1yXuZhJNfpL1xaSwYcUTHt8SmGSHR8V
         YtIsPHfbcT4Mg0xQNz44o/zBIgbda6mlr5Dy+0MEnXUGOq4QqhiOhUweJxs8ey3p4B9d
         iwDWHD7EtLVBSvdhC8A8cfX0v1Dkap71T7XqrvAKPsVuZmcfE1FlM37b4sNzHQ4iHSRL
         GrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764527947; x=1765132747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X8OOokLzQt/YM/ijLCPnnpDsTLPJicjgv1pbl/0tKc=;
        b=HmrEyYIJCxlhQqvN1zcZEdqNkrskLhxZkBpOc8VVDvD6wkCM6p/zL1gUp/bF1jAnY2
         Bg84zpXwR0keG0mXRxWY8o/b0JxnvZny/Y0aGhapM0jXdmrlwuFAVAR4olg5Itbtp6i8
         PBscjeKHcFSzsAq1i72T8zTfsODnpU/A65htIaoSPLJeq/WoVowMuAfRei2ttn5jJy1t
         DsaP/2Q0llyuB1iQx1H5fZFdLOa+qble7PQMOKy8yFJTaJDEtCljwqypW6USTXbI74C/
         YYCrdT9gGB+vz+goGTqnfPeUn7z898geUy7rIeJA2PcHDKr5Niw2/ukEUI+f/Cu1fjTp
         4R6g==
X-Gm-Message-State: AOJu0YyJys2oaErkMSAAHrxszif2Qy+YFLw9DAcurXIsO2BqMuUxmHvI
	C91cqeS9aNBPF54v4OYd7yOJWX+GOBWUS5j8+zHuaPNQ3TrhKSCis8FTZACU+o9lxzEwu4Y85lp
	4zsvTMjGPXybRJ3z+8Adj7xhaNk0gnMA8yBEP
X-Gm-Gg: ASbGncuI7w/QSz5j9D+FaadsCdbtKjy8Hsq6wJxt957vtJUOSIyvYPK7wB247uGrwdo
	ULME0YhHyTxpmxI7vzyWXRgpzsbpkQrVh2CXiGeL4YKrjyUJMnAa8XpPOlBAnftcw4T53wHEyKk
	Gh3er1mi5qkDHCfW/9ILKxRm8ILpWwZKklVZt73cLl3IOCv64xiyYBcZmWxXI3RXDeL1oa5dcgq
	cUH8NJXFVsId59PnbJh07sobEytvBZxdtYJ4HMVM7XDDLLjN6gfJuzdx3VLClxz0WrK7sMROpFD
	oOQrucCoegVCTO/om6uOnJ6R5kYv80gXU+fiGWBYjIFxct8xjvkzY7yhMtVYAZ2JcWtR7TTdH+u
	Bg466znnFLDJbap+yER8gqbGIzSdvN0zX7Y7wxy37ObN23g==
X-Google-Smtp-Source: AGHT+IGlg0HsYsMnuNbqtCnZjxKzWC1/v8x7+pscy6qWaWtmnoabsKFUucw544gwH5aduD1SdUoduGNrIR/Wu/RCgXE=
X-Received: by 2002:a05:690e:168d:b0:63f:b5d8:9da9 with SMTP id
 956f58d0204a3-64302a2f963mr23825963d50.12.1764527946596; Sun, 30 Nov 2025
 10:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20251130183450.101776-1-raj.khem@gmail.com> <CABF_=ygSAEuaz6agdxcySBq1uV32s_Jnmj-LGgGozTTJSEMBwA@mail.gmail.com>
In-Reply-To: <CABF_=ygSAEuaz6agdxcySBq1uV32s_Jnmj-LGgGozTTJSEMBwA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Nov 2025 10:38:40 -0800
X-Gm-Features: AWmQ_bkBG213m-BxP6ESYr49tZdOgu3b0LkbKQyIwPUrFB9x2BAmGLn1jstfkJk
Message-ID: <CAMKF1sqK_T9X1g3U1Pk9myS7=x=0b2JZzkjgTR34i7yDgCOYLg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-fastapi: Turn swagger-ui
 dependency into packageconfig
To: jan vermaete <jan.vermaete@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007406260644d42d38"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 18:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122172

--0000000000007406260644d42d38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 10:36=E2=80=AFAM jan vermaete <jan.vermaete@gmail.c=
om>
wrote:

> meta-xfce -> meta-webserver
>

ah good call. I will queue for a follow up.


>
> On Sun, Nov 30, 2025 at 7:34=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-devtools/python/python3-fastapi_0.122.0.bb    | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-fastapi_0.122.0.bb b/meta-python/recipes-devtools/python/
> python3-fastapi_0.122.0.bb
> > index 37a475ef8f..a5c9d257b0 100644
> > --- a/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-fastapi_0.122.0.bb
> > @@ -9,6 +9,12 @@ SRC_URI +=3D "file://run-ptest"
> >
> >  inherit pypi python_pdm ptest-python-pytest
> >
> > +PACKAGECONFIG ?=3D ""
> > +# swagger-ui is in meta-xfce that meta-python does not depend upon
> > +# Users can still enable it in their distros explicitly but its disabl=
ed
> > +# by default
> > +PACKAGECONFIG[swagger-ui] =3D ",,,swagger-ui"
> > +
> >  RDEPENDS:${PN} +=3D "\
> >      python3-annotated-doc \
> >      python3-fastapi-cli \
> > @@ -18,6 +24,4 @@ RDEPENDS:${PN} +=3D "\
> >      python3-typing-extensions \
> >  "
> >
> > -RRECOMMENDS:${PN} +=3D "swagger-ui"
> > -
> >  RDEPENDS:${PN}-ptest +=3D "python3-orjson"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#122170):
> https://lists.openembedded.org/g/openembedded-devel/message/122170
> > Mute This Topic: https://lists.openembedded.org/mt/116542571/2167232
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> jan.vermaete@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>

--0000000000007406260644d42d38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 30,=
 2025 at 10:36=E2=80=AFAM jan vermaete &lt;<a href=3D"mailto:jan.vermaete@g=
mail.com">jan.vermaete@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">meta-xfce -&gt; meta-webserver<br></blockq=
uote><div><br></div><div>ah good call. I will queue for a follow up.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On Sun, Nov 30, 2025 at 7:34=E2=80=AFPM Khem Raj via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3-fastapi_0.=
122.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi_0.122.0.bb</=
a>=C2=A0 =C2=A0 | 8 ++++++--<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-fastapi_0.122.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fasta=
pi_0.122.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://p=
ython3-fastapi_0.122.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fas=
tapi_0.122.0.bb</a><br>
&gt; index 37a475ef8f..a5c9d257b0 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-fa=
stapi_0.122.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi_0.12=
2.0.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-fa=
stapi_0.122.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi_0.12=
2.0.bb</a><br>
&gt; @@ -9,6 +9,12 @@ SRC_URI +=3D &quot;file://run-ptest&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit pypi python_pdm ptest-python-pytest<br>
&gt;<br>
&gt; +PACKAGECONFIG ?=3D &quot;&quot;<br>
&gt; +# swagger-ui is in meta-xfce that meta-python does not depend upon<br=
>
&gt; +# Users can still enable it in their distros explicitly but its disab=
led<br>
&gt; +# by default<br>
&gt; +PACKAGECONFIG[swagger-ui] =3D &quot;,,,swagger-ui&quot;<br>
&gt; +<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-annotated-doc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-fastapi-cli \<br>
&gt; @@ -18,6 +24,4 @@ RDEPENDS:${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-typing-extensions \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -RRECOMMENDS:${PN} +=3D &quot;swagger-ui&quot;<br>
&gt; -<br>
&gt;=C2=A0 RDEPENDS:${PN}-ptest +=3D &quot;python3-orjson&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#122170): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/122170" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/122170</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11654257=
1/2167232" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116542571/2167232</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:jan.vermaete@gmail.=
com" target=3D"_blank">jan.vermaete@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
Jan Vermaete<br>
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel<br=
>
</blockquote></div></div>

--0000000000007406260644d42d38--


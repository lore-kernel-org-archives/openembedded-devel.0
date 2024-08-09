Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FDBC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:34:37 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.88341.1723221275452088969
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OiT5ni0n;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fd9e6189d5so20768495ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221275; x=1723826075; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=utpt55638oZk8m26NnsLu/pUJ3KJjnJqZl7aveEBiAg=;
        b=OiT5ni0nzByrXn8kL4I0Ky1o7BhYt3nWS+gCLgePgysBBDMg0T19u878ZjdMW+GaMw
         Po8/+yeraNY03xBjAOROFVhvZH8WGCqGCBzrG82lAaokrm6Opq+9Sz+vT6+50WStX2B3
         HTV6gzHrvzGje32lIQXQaYmkcEuz25exZGc4VrlnfIH3mkIG/nBgKPCru3XVfT2YR2Be
         sv8+nG1tkXtlwNXVXlNXvOGPqCBvsJH3ZhMaGEL9BfUdfEo+AN/nVF7ttL+Y79djUDW9
         7DehjIPbr3HsRtVzxySZQmkkee4PhUQW3SvKjGBSOiROJAbmLnPO/e42cZjz4hFZfcP6
         bOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221275; x=1723826075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utpt55638oZk8m26NnsLu/pUJ3KJjnJqZl7aveEBiAg=;
        b=OVZP6ppRMhFB/vYdKuE3H9udGZ5yq42WGilymX/LupqqZibSpk4Sg1XhysPSANT6BV
         TDU7AI+HLu57AHk0pl+U8Lc1/0MfVDdDkeL8uix4MAn4dstDQVg4C1tVbCDpc5Ec/3jP
         u2osnAG3n2/DGVUzFquHbeWyb6iYXIJPdvwj6lBVPOpBlNeabw439bTYIUUhREVMrF4Y
         ItBholl0EXYXZFSkWmwMvVO1bo8PMdX2umcXid2gF9VvTQAx5dqtx+Gia0nWs7khxC8X
         RC7IHKNRXX3MAgDyf/guj0Qg95/qmVO/W7fFhg5BuBlZ7CfcaKEgEKVlCzRmCqFLMCOe
         FIng==
X-Gm-Message-State: AOJu0YyjCbT+ghowbn8/Kq+a7UD9FVvbi9siFgmiTlFCvauApzSN1EqW
	cPCDvoQ3wSN136ZiJiUX0BlfJ8GsotM2d14MawV/CIMiHCPLtl4zAaz8z63OJWtKrV+JriKnTjW
	ETpa+5xDjAsPWSR7tOvZGBRJQN+k=
X-Google-Smtp-Source: AGHT+IFNIVXoAA2P5SdjMQDi8vZHaSrtBhx9puYKllWBieMEWlwUi0LqgaQTvfQHey/GilVbNVW2wgsT0nckg0UAa5s=
X-Received: by 2002:a17:902:da8f:b0:1fd:ae10:7246 with SMTP id
 d9443c01a7336-200ae4dd97bmr20255335ad.5.1723221274567; Fri, 09 Aug 2024
 09:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240809154830.14927-1-alperyasinak1@gmail.com> <CAMKF1sqVrrAWb1nSvzhFa61zO48T4AUikmxxXnCS6o6i_W8v_g@mail.gmail.com>
In-Reply-To: <CAMKF1sqVrrAWb1nSvzhFa61zO48T4AUikmxxXnCS6o6i_W8v_g@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Fri, 9 Aug 2024 19:34:23 +0300
Message-ID: <CAGpma=701FzigC_n-Fkyv5zh95xqn8FWh9tSh1Mq-nnKi9C7Rw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 01/13] python3-service-identity: switch
 to PEP-517 build backend
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f0ace9061f42b7b1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111724

--000000000000f0ace9061f42b7b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I rebased it as you said. Only removed python3-argcomplete because
it was already updated by Leon Anavi.

Khem Raj <raj.khem@gmail.com>, 9 A=C4=9Fu 2024 Cum, 19:04 tarihinde =C5=9Fu=
nu yazd=C4=B1:

> Thanks for the patch series, Can you rebase them on top of master-next
> and resend please
>
> On Fri, Aug 9, 2024 at 8:48=E2=80=AFAM Alper Ak via lists.openembedded.or=
g
> <alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > The project has a proper pyproject.toml which declares the
> setuptools.build.meta PEP-517 backend.
> >
> > Fix:
> >
> > WARNING: python3-service-identity-21.1.0-r0 do_check_backend: QA Issue:
> inherits setuptools3 but has pyproject.toml with setuptools.build_meta, u=
se
> the correct class [pep517-backend]
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  .../recipes-devtools/python/python3-service-identity_21.1.0.bb  | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/
> python3-service-identity_21.1.0.bb
> > index 006fae290..267bbea13 100644
> > --- a/meta-python/recipes-devtools/python/
> python3-service-identity_21.1.0.bb
> > +++ b/meta-python/recipes-devtools/python/
> python3-service-identity_21.1.0.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8a0f079f4e6a215d6bd6f9d97cab4d5f"
> >  SRC_URI[md5sum] =3D "5e5c195d8fcedc72f9068be2ad9b5a13"
> >  SRC_URI[sha256sum] =3D
> "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34"
> >
> > -inherit pypi setuptools3 ptest
> > +inherit pypi python_setuptools_build_meta ptest
> >
> >  SRC_URI +=3D " \
> >         file://run-ptest \
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111697):
> https://lists.openembedded.org/g/openembedded-devel/message/111697
> > Mute This Topic: https://lists.openembedded.org/mt/107810496/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000f0ace9061f42b7b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, I rebased it as you said. Only removed python3-arg=
complete because it was already updated by Leon Anavi.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;, 9 A=C4=9Fu 2024 =
Cum, 19:04 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Thanks for the patch series, Can you rebase them=
 on top of master-next<br>
and resend please<br>
<br>
On Fri, Aug 9, 2024 at 8:48=E2=80=AFAM Alper Ak via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a><br>
&lt;alperyasinak1=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; The project has a proper pyproject.toml which declares the setuptools.=
build.meta PEP-517 backend.<br>
&gt;<br>
&gt; Fix:<br>
&gt;<br>
&gt; WARNING: python3-service-identity-21.1.0-r0 do_check_backend: QA Issue=
: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, u=
se the correct class [pep517-backend]<br>
&gt;<br>
&gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" =
target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3-service-id=
entity_21.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-service-iden=
tity_21.1.0.bb</a>=C2=A0 | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-service-identity_21.1.0.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-service-identity_21.1.0.bb</a> b/meta-python/recipes-devtools/python/<a =
href=3D"http://python3-service-identity_21.1.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-service-identity_21.1.0.bb</a><br>
&gt; index 006fae290..267bbea13 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-se=
rvice-identity_21.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-serv=
ice-identity_21.1.0.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-se=
rvice-identity_21.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-serv=
ice-identity_21.1.0.bb</a><br>
&gt; @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8a0f07=
9f4e6a215d6bd6f9d97cab4d5f&quot;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;5e5c195d8fcedc72f9068be2ad9b5a13&quot;=
<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;6e6c6086ca271dc11b033d17c3a8bea9f24=
ebff920c587da090afc9519419d34&quot;<br>
&gt;<br>
&gt; -inherit pypi setuptools3 ptest<br>
&gt; +inherit pypi python_setuptools_build_meta ptest<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#111697): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/111697" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/111697</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10781049=
6/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107810496/1997914</a><br>
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

--000000000000f0ace9061f42b7b1--


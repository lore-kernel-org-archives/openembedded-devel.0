Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A075B10AB82D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 22:45:57 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60257.1774565153434790227
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 15:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aRdDF8SS;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-798374d0f44so37669467b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774565152; cv=none;
        d=google.com; s=arc-20240605;
        b=ZnYheRuto2BR5wjTKmSKCMxTrkY9oATAWK7vOeK4+hiTSk7C8NMWfw5NlCmuGS1vNU
         u0l+UtQsaP0+w98deskOx6mCsoWcmu2ZuPIAmkocRtKSEPbk9IE5o+aOPDJ+jNmUvQHa
         SQgN8Lbu3cUpp+1BzC6+FVGd97F4aPSmYtUPmLnmrZhlmLS8SWg9sIlQqkE7gv6Ahg4X
         uEEwt3MUBV/1tUYtAOL4hoi+6zNcfDLOmmDu1R+vpVIsUmNVU6k2pdEx0VXt/lEtX+Fb
         mGbyxvkV+PUs0uMlCCplfJPfBrvjFsLpdymXVRUbjy/K/ad38/7FWIUZJ0wAy38uJNd0
         Hnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dKrvFradSyZtJJ3PFfmWcVauu4G1/8jWmfNtS+eLb/8=;
        fh=IYXrLiYg5Jykw+vvXJmV54Ty3OVteHaXD721zWjKHGs=;
        b=LR1QFG/9HNDUcnSwqUjoqyofJ8e1hObZbV9PAZuEYndo6ZfPqhkIgVMqRnQHwW7I64
         PBUK9m2z8ZYqnfGNd4b/1X6Pw6IpoZbkIViFKrrKQJKFZ0vprcG1rcEkgO6hUE0qBwyP
         QslfbvIsSOv1S3yvewKCz0QnrfBGFblRZfL5hWCsx+kBdz+Eykphqfsu7JYV73CPiUP8
         B2sq5N/kcGpL4sBcSUDC/SWBQg79MmIPSWeAaT1RJJZQI/bDY/mOSi6irDQwOcLRXajf
         2JcG1tjqFR5y/po5RfkzH2EpO3+XWqUY8Rc1a/8+8HbZ0hyiPC3EHmlJ1Dp0FAqPhGzI
         bChQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774565152; x=1775169952; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dKrvFradSyZtJJ3PFfmWcVauu4G1/8jWmfNtS+eLb/8=;
        b=aRdDF8SSlOFlLmn39NFdEIIVGUlVOIJ/gjNozg5cb2E4TMWoG8bzwa11ULNX/0ExIV
         kEYwVOHeEYe4p8EJaKtrpTpydGUSazpsN8g0jMY/62DpjboOl3esed4WLJzG0GblXZev
         AXbWISvX9rC2luvLQuPaCsjrJ92hTfQw1ebaUrER7ykunJkpQp+cNhsCsY6ioFqDs7fr
         95K5Iu0i5c6rcfnpZ4iYmC9q+7dV9dyElktqrB0dELz2+2+EtOcdwzJEOgCSyOQsW4rc
         YHs00YhAC7M1H8lGKRZNiP1Z7LpPz/YdwMdqH28qG25J6QhqdPC48VacJStNoWu4YSxa
         a+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774565152; x=1775169952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKrvFradSyZtJJ3PFfmWcVauu4G1/8jWmfNtS+eLb/8=;
        b=H+LFJFth4G4Z/B1OFN6izZ5Nub4bVvR7OjIFwmp6yJS5VtbyN/+1xRDwqY2vpe47O+
         6NUs5X7ODXzuYA2AxkEXeuOmoSeGM4+En7MOmXjbVGQchCyvb+tjlmAKMftkbD5Bl9QL
         djVVvChbkTbetMmLtlaxF1EQ0IVHKzsLNIZOOyrvJ8D7pITS/4BjCBrFymiiVaGqfBVH
         +KjMTwAvuYptZnQ1SLZtmQzVgpxtODTys1OUqpKThIbL7r04znAifSDcuFJLxy4Kq6t9
         nVbzeN0Gv87warbqRrIDkhqcBwgE7dFx2qfXJsMq6oatbNzRc3VkiMOSvnifXcDi03e2
         +7gg==
X-Forwarded-Encrypted: i=1; AJvYcCVPMylMoIL5R/0fg4UNKgtjJAvC6W8R/5TLTWNP/3bL/pASBBu5Gxtx2tFqJRbxgjB9PWqC93sfkRaJwF6uxj6Z+74=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxKOrc9GMBson4+BoI7amIB78YWxyD9N6w+yJTdj8F3c87FrGNb
	Hlf+kYCVT/PBxYcubOTr/RqXchJYo+r29JocsO2w4i/QNNtjHN6gThoLE46DrMJvs+WMdb6WoFU
	yD3amZIVEcyB+kIT2nvEdzruJYorq+ZvWccLc
X-Gm-Gg: ATEYQzz/iGuE2hCJCUEXO7SWKwvnh/t73mf/Ywg0SKsASrii6WETzCLxnXIH33XRe3N
	Sfzcf6AjELosvkva9D7IZSAh4J/6tgx+vvHQYUxtWxU5eq3v39ssN6gOpQVzGX4tPyA57PpZDWD
	2+nyo+nUbRT2+7sD89/I3mJMEiBgOQ+9qKcX+Vs7RAAEyfoaTWqMH5Bp6ewVQiufIANWBTkeYZI
	kKx8hvPcmhvEUw1cOhw9Kr4a738cPiTPLtDwf/g2eV6TG7ZKe8y0jZush7TbOyAqhi2dsqgDMVo
	XJwP5jWsHaX4GfdgB85j/iiUdoYHEGJZThil5m8KR0yFKtxmSLDpZy4Oad1JB8jSW/6ZXeI0d95
	j7h1lGDTJ2a56fNV9mpbYqk+H
X-Received: by 2002:a05:690e:134f:b0:64a:bde9:3425 with SMTP id
 956f58d0204a3-64ff84b3955mr97125d50.3.1774565152487; Thu, 26 Mar 2026
 15:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260326115634.1199-1-wangmy@fujitsu.com> <20260326115634.1199-53-wangmy@fujitsu.com>
 <CADySD0EoJtnQEGgouaAhYboVP-g_oViEBNujzpCtsD=Thej=yg@mail.gmail.com>
In-Reply-To: <CADySD0EoJtnQEGgouaAhYboVP-g_oViEBNujzpCtsD=Thej=yg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Mar 2026 15:45:25 -0700
X-Gm-Features: AQROBzABvsNcyJUmZXGwcceQJdSX4SVArbY--p2PoARG2jPcHaYFp0yo9WjTeNI
Message-ID: <CAMKF1sqTE4DuNBCr29EMvftWDuLDqVxbjaZY-Y8uL55Bon8XQw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 53/63] python3-ujson: upgrade 5.11.0 -> 5.12.0
To: ankur.tyagi85@gmail.com
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008b7bfb064df5251b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 22:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125773

--0000000000008b7bfb064df5251b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 2:19=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> On Fri, Mar 27, 2026 at 12:58=E2=80=AFAM wangmy via lists.openembedded.or=
g
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../python/{python3-ujson_5.11.0.bb =3D> python3-ujson_5.12.0.bb} | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python/{python3-ujson_5.11.0.bb =
=3D>
> python3-ujson_5.12.0.bb} (88%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.11.0.b=
b
> b/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
> > similarity index 88%
> > rename from meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb
> > rename to meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
> > index 95199de839..a1539d5c49 100644
> > --- a/meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
> > @@ -4,7 +4,7 @@ DESCRIPTION =3D "UltraJSON is an ultra fast JSON encode=
r
> and decoder written in pu
> >  LICENSE =3D "BSD-3-Clause"
>
> I think license should be updated to "BSD-3-Clause & TCL"
>
> https://github.com/ultrajson/ultrajson/pull/693/changes/675d9e18e14270c5d=
b117b6b55c466645fe85cdc
>
>
That is right, It will also need adding a template for TCL license text, I
do not see it in common-licenses in core or meta-python


> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D1e3768cfe2662fa77c49c9c2d3804d87"
> >
> > -SRC_URI[sha256sum] =3D
> "e204ae6f909f099ba6b6b942131cee359ddda2b6e4ea39c12eb8b991fe2010e0"
> > +SRC_URI[sha256sum] =3D
> "14b2e1eb528d77bc0f4c5bd1a7ebc05e02b5b41beefb7e8567c9675b8b13bcf4"
> >
> >  inherit pypi ptest-python-pytest python_setuptools_build_meta
> >
> > --
> > 2.43.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125772):
> https://lists.openembedded.org/g/openembedded-devel/message/125772
> Mute This Topic: https://lists.openembedded.org/mt/118516717/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008b7bfb064df5251b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 26,=
 2026 at 2:19=E2=80=AFPM Ankur Tyagi via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Mar=
 27, 2026 at 12:58=E2=80=AFAM wangmy via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org" target=
=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"=
_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" t=
arget=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/{<a href=3D"http://python3-ujson_5.11.0.bb" rel=3D"no=
referrer" target=3D"_blank">python3-ujson_5.11.0.bb</a> =3D&gt; <a href=3D"=
http://python3-ujson_5.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-ujson_5.12.0.bb</a>} | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-ujson_5.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ujson_5=
.11.0.bb</a> =3D&gt; <a href=3D"http://python3-ujson_5.12.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-ujson_5.12.0.bb</a>} (88%)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-ujson_5.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ujson_5.=
11.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-ujson_5.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ujson_5.12.0=
.bb</a><br>
&gt; similarity index 88%<br>
&gt; rename from meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-ujson_5.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ujson_5.1=
1.0.bb</a><br>
&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://python=
3-ujson_5.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ujson_5.12.=
0.bb</a><br>
&gt; index 95199de839..a1539d5c49 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-uj=
son_5.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ujson_5.11.0.bb=
</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-uj=
son_5.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ujson_5.12.0.bb=
</a><br>
&gt; @@ -4,7 +4,7 @@ DESCRIPTION =3D &quot;UltraJSON is an ultra fast JSON =
encoder and decoder written in pu<br>
&gt;=C2=A0 LICENSE =3D &quot;BSD-3-Clause&quot;<br>
<br>
I think license should be updated to &quot;BSD-3-Clause &amp; TCL&quot;<br>
<a href=3D"https://github.com/ultrajson/ultrajson/pull/693/changes/675d9e18=
e14270c5db117b6b55c466645fe85cdc" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/ultrajson/ultrajson/pull/693/changes/675d9e18e14270c5db117b6=
b55c466645fe85cdc</a><br>
<br></blockquote><div><br></div><div>That is right, It will also need addin=
g a template for TCL license text, I do not see it in common-licenses in co=
re or meta-python</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D1e3768cfe266=
2fa77c49c9c2d3804d87&quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;e204ae6f909f099ba6b6b942131cee359ddda2b6=
e4ea39c12eb8b991fe2010e0&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;14b2e1eb528d77bc0f4c5bd1a7ebc05e02b5b41b=
eefb7e8567c9675b8b13bcf4&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit pypi ptest-python-pytest python_setuptools_build_meta<br=
>
&gt;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125772): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125772" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125772</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118516717/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118516717/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000008b7bfb064df5251b--


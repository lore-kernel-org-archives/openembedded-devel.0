Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F36EC433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 21:11:23 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.12920.1645996282578088975
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Feb 2022 13:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M97yKsxF;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id q10so7387301qtw.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Feb 2022 13:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wf//BhutOijpubkGjnPAZz6J80HlFyY2VOKTb43TU0E=;
        b=M97yKsxFnlP5AUtCrre9g/daAF5bXi7elZ+OvD8/XDX+tvKt7AmJgr3zB1kdtRg1wo
         8/MG4hZNs4FixIpep8U1J1CiOBlhEOP8L1BsJ/bSx5APAXlw3r7v35AWxCm3VrnGsm+p
         js0ynJdmOijGQw2A3doQ2FTmGh95iEKQrRRB+lKvbZmt3njGxxp7veaObU3zyl0Bci2G
         1uSI7L8DXLbxyNI1QKCveXIK43z9ol4FIYC5gZ3VNr1Wk0+zZVt52tC6KOjBWaCcltMU
         0R/ipOtzma85YAL8niGJ++tH3K4MLCw/gF8WXNGWP2OLVVZ9WMJ/yYhzuklPIxlifiOq
         tOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wf//BhutOijpubkGjnPAZz6J80HlFyY2VOKTb43TU0E=;
        b=l3pnVr+9QnIDjzTPCb/75/53lguckeZwyimc+UVD0fG1xpK17w5YTd0Cu5m0Z8zqkq
         OqJ4KfmcdB0O70F8oTd+Zc+XLgYsf/i7D5aIYO9u7rf9nfjL+gGys7fIU827ffTQMYzr
         JFgV4drTF2Hm1Dc3mzs3S4A9DGAcex0GB5RIv4Nv9Npvgvse+MyoKLUZ7qNFz1LCVJBD
         wQ8Fpa1ZKNQal+ktsMVcYndGHPp6TDzySuUgeJla3G3Pq9CzReLD3YhHWReeuUr++zQX
         MSX7WoqY5FWN2AqtzYS/Q+MXXaAWPMuuJiFO92vGZth6EDF+3UiTY9lkcX0WRl8mXC4y
         WwpA==
X-Gm-Message-State: AOAM533TIpqmTu0lpyguKIWfgP+pmrSLaF6/scKSh/zMqJm6VtSKrYsY
	bUZ/anEpmuqP6F3FEpW10lxbh1EehCNow9iY8ms=
X-Google-Smtp-Source: 
 ABdhPJwfHhy5afa96KlaqUbzAdDaIKXIAxCKp0E75+ASkgMFsqJk8Gt/8cw2MrMLPhKzp9kEFwbNooGoNvcFOhc6kXA=
X-Received: by 2002:ac8:5a86:0:b0:2de:29af:5658 with SMTP id
 c6-20020ac85a86000000b002de29af5658mr14266019qtc.54.1645996281612; Sun, 27
 Feb 2022 13:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20220227075848.610467-1-raj.khem@gmail.com>
 <20220227075848.610467-5-raj.khem@gmail.com>
 <e58829eb-707e-5535-d01d-4f765b296f63@gmail.com>
In-Reply-To: <e58829eb-707e-5535-d01d-4f765b296f63@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Feb 2022 13:11:11 -0800
Message-ID: 
 <CAMKF1srQx4qSBypQ7nW5N8Zusfm1zN2HoG+R3qd8ynrfB7taGw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 5/6] guider: Set PYPA_WHEEL
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aace2705d9065f25"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Feb 2022 21:11:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95563

--000000000000aace2705d9065f25
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 27, 2022 at 8:09 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 2/26/22 23:58, Khem Raj wrote:
> > Fixes build with wheels
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta-oe/recipes-devtools/guider/guider_3.9.8.bb | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> > index 47d872a400..3c3f069df2 100644
> > --- a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> > +++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> > @@ -14,6 +14,7 @@ SRCREV = "a502cd93b13235b7539557a91328de00b7c51bc3"
> >   S = "${WORKDIR}/git"
> >
> >   inherit setuptools3
> > +PYPA_WHEEL =
> "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-3.9.8-*.whl"
> Any reason not to use PV here ?


PV is appended few lines above this code


PV = "3.9.8+git${SRCPV}"


> >
> >   RDEPENDS:${PN} = "python3 python3-core \
> >           python3-ctypes python3-shell python3-json"
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95558):
> https://lists.openembedded.org/g/openembedded-devel/message/95558
> > Mute This Topic: https://lists.openembedded.org/mt/89425252/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> akuster808@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>

--000000000000aace2705d9065f25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Feb 27, 2022 at 8:09 AM akuster808 &lt;<a href=3D"m=
ailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br>
<br>
On 2/26/22 23:58, Khem Raj wrote:<br>
&gt; Fixes build with wheels<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3=
.9.8.bb" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a> | 1 +<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_=
3.9.8.bb" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a> b/meta-o=
e/recipes-devtools/guider/<a href=3D"http://guider_3.9.8.bb" rel=3D"norefer=
rer" target=3D"_blank">guider_3.9.8.bb</a><br>
&gt; index 47d872a400..3c3f069df2 100644<br>
&gt; --- a/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.8.b=
b" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.8.b=
b" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a><br>
&gt; @@ -14,6 +14,7 @@ SRCREV =3D &quot;a502cd93b13235b7539557a91328de00b7c=
51bc3&quot;<br>
&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit setuptools3<br>
&gt; +PYPA_WHEEL =3D &quot;${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-=
3.9.8-*.whl&quot;<br>
Any reason not to use PV here ?</blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">PV is appended few lines above this code=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><table class=3D"highlight tab-size js=
-file-line-container js-code-nav-container js-tagsearch-file" style=3D"box-=
sizing:border-box;border-spacing:0px;border-collapse:collapse;color:rgb(36,=
41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,He=
lvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji=
&quot;;font-size:14px"><tbody style=3D"box-sizing:border-box"><tr style=3D"=
box-sizing:border-box"></tr><tr style=3D"box-sizing:border-box"><td id=3D"L=
C9" class=3D"blob-code blob-code-inner js-file-line" style=3D"box-sizing:bo=
rder-box;padding:0px 10px;line-height:20px;vertical-align:top;overflow:visi=
ble;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Conso=
las,&quot;Liberation Mono&quot;,monospace;font-size:12px;color:var(--color-=
fg-default);word-wrap:normal;white-space:pre"><br class=3D"Apple-interchang=
e-newline">PV =3D &quot;3.9.8+git${SRCPV}&quot;</td></tr><tr style=3D"box-s=
izing:border-box"><td id=3D"L10" class=3D"blob-num js-line-number js-code-n=
av-line-number js-blob-rnum" style=3D"box-sizing:border-box;padding:0px 10p=
x;width:50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,&quot;S=
F Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size=
:12px;line-height:20px;color:var(--color-fg-subtle);text-align:right;white-=
space:nowrap;vertical-align:top"></td><td id=3D"LC10" class=3D"blob-code bl=
ob-code-inner js-file-line" style=3D"box-sizing:border-box;padding:0px 10px=
;line-height:20px;vertical-align:top;overflow:visible;font-family:ui-monosp=
ace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono=
&quot;,monospace;font-size:12px;color:var(--color-fg-default);word-wrap:nor=
mal;white-space:pre">
</td></tr><tr style=3D"box-sizing:border-box"><td id=3D"L11" class=3D"blob-=
num js-line-number js-code-nav-line-number js-blob-rnum" style=3D"box-sizin=
g:border-box;padding:0px 10px;width:50px;min-width:50px;font-family:ui-mono=
space,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mo=
no&quot;,monospace;font-size:12px;line-height:20px;color:var(--color-fg-sub=
tle);text-align:right;white-space:nowrap;vertical-align:top"></td></tr></tb=
ody></table><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0RDEPENDS:${PN} =3D &quot;python3 python3-core \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-ctypes python3-shell p=
ython3-json&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#95558): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/95558" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/95558</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89425252=
/3616698" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89425252/3616698</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:akuster808@gmail.co=
m" target=3D"_blank">akuster808@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000aace2705d9065f25--


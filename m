Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C279DC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:10:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.1951.1683047441967013477
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 10:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WKUVkPao;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f315735514so178542785e9.1
        for <Openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 10:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683047440; x=1685639440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/JR2r1OThsTDvWnvlA04Ry2Je/+SXG/9GSuK3lB0XQM=;
        b=WKUVkPaof9gptrhGtw+u1D+dxld7o05ZT7C+2K508nImh2EWmSzD7dPbxOHQEAQnwB
         45BINRwtMOufJtrZ2ej+PVKnMiPrn5TgLlCVU/CXAD6T5Xw9UX3gHbHGQ9gmUAUAuk8O
         LVaX9uuNDzm1dhgxhuCMRswLsqFuVIxjpf41hfHwIYD9boXLkN5b1PrrH87BnvGkc3vR
         LT7YrSmkcZgX2r9SqJeUOVbITxwAfQc54yUJKbVNhGHXOc/toJEY2thnE3nSjfzaHZ8x
         YCRCo6pY4WONCvwHgbGH4h4tPZLzrEusHNirYsw6UltGkt8fFVzLq6kDUBCPWUgcz88+
         /Epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683047440; x=1685639440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JR2r1OThsTDvWnvlA04Ry2Je/+SXG/9GSuK3lB0XQM=;
        b=czX19kjkgX5oAAXqVffV1wGtV4M+Z+2orBL43EXM4bjM9RpOs/nAhTj38hgxEJM9i9
         ivELKsJh8l8trvjBSIUVwrx4T0HU4Rs9Aw7t+iOvXbDo38AuN+POMX6M7lh6aHFQjurc
         AFEPQumRf6ZXSvgntGsJY4kYQqSNClkBPSyODEMBXCK2JNUn6W8q0wuTZrM/c/QkZwtt
         lQ4yfcTPdswYOjdsJYCrQLFo2egmjLMeEYZzgOGsgpgA+EmXbBWGNYgSvH+YK1+w36yb
         IwqezPcKOvlE6Zr99uvz8rJ4RFnHI05iHCLtRA38KKBIhjx2XuowSZOnLeqagT5YG7Iy
         Hj9A==
X-Gm-Message-State: AC+VfDxhVgnzRcqo1AwJ9a9IW3oRcFJnyTUBqLwQMxTETW3K5Tzs3HQ4
	f0KJOvznBIGEsivekZ/WJ1pDMdGIsVRjF+dDKGE=
X-Google-Smtp-Source: ACHHUZ6qLNQeOQ19M7HOSGfyMNXsRfEFoMeNfnqz/2/fb/iNsiHOKMEKnLfNfKfarjQEQzHJc6zg1XeAeZp+uZ55L/c=
X-Received: by 2002:a5d:66d2:0:b0:2ef:eb45:2317 with SMTP id
 k18-20020a5d66d2000000b002efeb452317mr15577526wrw.9.1683047440262; Tue, 02
 May 2023 10:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230427164723.863197-1-rs@ti.com> <36d695de-8152-c528-4b17-f85ff1e4c4ff@gmail.com>
 <df484615-b1eb-d368-f48e-f9da599cd4c4@ti.com> <CA+chaQfpAZwtAk4kOG56xiCmOm62MGW6YPEG661-n7XqC08Rxg@mail.gmail.com>
 <055e898a-d85e-2f86-da85-b7b00db1cf54@ti.com>
In-Reply-To: <055e898a-d85e-2f86-da85-b7b00db1cf54@ti.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 2 May 2023 19:10:27 +0200
Message-ID: <CA+chaQeo5WeR+uJ87yVcEToNcp_Dc45RDG+O3G2TsGx+0wuyew@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [oe] [meta-oe][kirkstone][PATCHv2] glfw: add
 packageconfig and wayland dependencies
To: Randolph Sapp <rs@ti.com>
Cc: akuster808 <akuster808@gmail.com>, raj.khem@gmail.com, afd@ti.com, detheridge@ti.com, 
	reatmon@ti.com, denis@denix.org, Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d12b3605fab90410"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 17:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102274

--000000000000d12b3605fab90410
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 2, 2023 at 6:06=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:

> On 5/2/23 10:56, Martin Jansa wrote:
> > The version which was merged with:
> >
> > PACKAGECONFIG ??=3D "x11"
> >
> > Should still respect x11 in DISTRO_FEATURES, now this causes:
> >
> > ERROR: Nothing PROVIDES 'libxi' (but
> > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on
> or
> > otherwise requires it)
> > libxi was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> > ERROR: Nothing PROVIDES 'libxinerama' (but
> > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on
> or
> > otherwise requires it)
> > libxinerama was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> > ERROR: Nothing PROVIDES 'libxrandr' (but
> > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on
> or
> > otherwise requires it)
> > libxrandr was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> > ERROR: Nothing PROVIDES 'libglu' (but
> > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on
> or
> > otherwise requires it)
> > libglu was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> > ERROR: Nothing PROVIDES 'libxcursor' (but
> > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on
> or
> > otherwise requires it)
> > libxcursor was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> >
> > when wayland and opengl are in DISTRO_FEATURES, but x11 isn't.
> >
>
> Yeah, that's expected behavior at this point. You need to manually
> override the PACKAGECONFIG for wayland in this patch. Just slightly
> better than no wayland at all.
>

And slightly worse than before, because before it was automatically skipped
thanks to  REQUIRED_DISTRO_FEATURES and now it's pulled into world builds
even when it doesn't build at all.

The only way we can get around it is if this layer or one of it's
> dependencies decides to adopt extra-cmake-modules. They the
> packageconfig can automatically configure itself. Discussion on who's
> job it is to carry this package has yet to conclude.
>

There is also libglu in regular DEPENDS which has x11 in
REQUIRED_DISTRO_FEATURES.

After moving libglu to x11 PACKAGECONFIG and enabling x11 only when it's in
DISTRO_FEATURES as in:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Djansa/ma=
ster&id=3D721240c27e7a8ebe83f2730cf94e12a57932db82

it still fails with:
glfw/3.3+gitAUTOINC+781fbbadb0-r0/recipe-sysroot-native/usr/share/cmake-3.2=
5/Modules/FindPackageHandleStandardArgs.cmake:230
(message):
|   Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LIB)

Maybe return x11 to REQUIRED_DISTRO_FEATURES until the wayland discussion
is resolved somehow?

Regards,

--000000000000d12b3605fab90410
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Tue, May 2, 2023 at 6=
:06=E2=80=AFPM Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_bl=
ank">rs@ti.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 5/2/23 10:56, Martin Jansa wrot=
e:<br>
&gt; The version which was merged with:<br>
&gt; <br>
&gt; PACKAGECONFIG ??=3D &quot;x11&quot;<br>
&gt; <br>
&gt; Should still respect x11 in DISTRO_FEATURES, now this causes:<br>
&gt; <br>
&gt; ERROR: Nothing PROVIDES &#39;libxi&#39; (but <br>
&gt; meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">glfw_3.3.bb</a> &lt;<a href=3D"http://glfw_3.3.bb" =
rel=3D"noreferrer" target=3D"_blank">http://glfw_3.3.bb</a>&gt; DEPENDS on =
or <br>
&gt; otherwise requires it)<br>
&gt; libxi was skipped: missing required distro feature &#39;x11&#39; (not =
in <br>
&gt; DISTRO_FEATURES)<br>
&gt; ERROR: Nothing PROVIDES &#39;libxinerama&#39; (but <br>
&gt; meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">glfw_3.3.bb</a> &lt;<a href=3D"http://glfw_3.3.bb" =
rel=3D"noreferrer" target=3D"_blank">http://glfw_3.3.bb</a>&gt; DEPENDS on =
or <br>
&gt; otherwise requires it)<br>
&gt; libxinerama was skipped: missing required distro feature &#39;x11&#39;=
 (not in <br>
&gt; DISTRO_FEATURES)<br>
&gt; ERROR: Nothing PROVIDES &#39;libxrandr&#39; (but <br>
&gt; meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">glfw_3.3.bb</a> &lt;<a href=3D"http://glfw_3.3.bb" =
rel=3D"noreferrer" target=3D"_blank">http://glfw_3.3.bb</a>&gt; DEPENDS on =
or <br>
&gt; otherwise requires it)<br>
&gt; libxrandr was skipped: missing required distro feature &#39;x11&#39; (=
not in <br>
&gt; DISTRO_FEATURES)<br>
&gt; ERROR: Nothing PROVIDES &#39;libglu&#39; (but <br>
&gt; meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">glfw_3.3.bb</a> &lt;<a href=3D"http://glfw_3.3.bb" =
rel=3D"noreferrer" target=3D"_blank">http://glfw_3.3.bb</a>&gt; DEPENDS on =
or <br>
&gt; otherwise requires it)<br>
&gt; libglu was skipped: missing required distro feature &#39;x11&#39; (not=
 in <br>
&gt; DISTRO_FEATURES)<br>
&gt; ERROR: Nothing PROVIDES &#39;libxcursor&#39; (but <br>
&gt; meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">glfw_3.3.bb</a> &lt;<a href=3D"http://glfw_3.3.bb" =
rel=3D"noreferrer" target=3D"_blank">http://glfw_3.3.bb</a>&gt; DEPENDS on =
or <br>
&gt; otherwise requires it)<br>
&gt; libxcursor was skipped: missing required distro feature &#39;x11&#39; =
(not in <br>
&gt; DISTRO_FEATURES)<br>
&gt; <br>
&gt; when wayland and opengl are in DISTRO_FEATURES, but x11 isn&#39;t.<br>
&gt; <br>
<br>
Yeah, that&#39;s expected behavior at this point. You need to manually <br>
override the PACKAGECONFIG for wayland in this patch. Just slightly <br>
better than no wayland at all.<br></blockquote><div><br></div><div>And slig=
htly worse than before, because before it was automatically skipped thanks =
to=C2=A0 REQUIRED_DISTRO_FEATURES and now it&#39;s pulled into world builds=
 even when it doesn&#39;t build at all.</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
The only way we can get around it is if this layer or one of it&#39;s <br>
dependencies decides to adopt extra-cmake-modules. They the <br>
packageconfig can automatically configure itself. Discussion on who&#39;s <=
br>
job it is to carry this package has yet to conclude.<br></blockquote><div><=
br></div><div>There is also libglu in regular DEPENDS which has x11 in REQU=
IRED_DISTRO_FEATURES.</div><div><br></div><div>After moving libglu to x11 P=
ACKAGECONFIG and enabling x11 only when it&#39;s in DISTRO_FEATURES as in:<=
/div><div><a href=3D"https://git.openembedded.org/meta-openembedded-contrib=
/commit/?h=3Djansa/master&amp;id=3D721240c27e7a8ebe83f2730cf94e12a57932db82=
" target=3D"_blank">https://git.openembedded.org/meta-openembedded-contrib/=
commit/?h=3Djansa/master&amp;id=3D721240c27e7a8ebe83f2730cf94e12a57932db82<=
/a><br></div><div><br></div><div>it still fails with:</div><div>glfw/3.3+gi=
tAUTOINC+781fbbadb0-r0/recipe-sysroot-native/usr/share/cmake-3.25/Modules/F=
indPackageHandleStandardArgs.cmake:230 (message):=C2=A0 =C2=A0 =C2=A0=C2=A0=
</div>| =C2=A0 Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LI=
B)</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">May=
be return x11 to REQUIRED_DISTRO_FEATURES until the wayland discussion is r=
esolved somehow?</div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote">Regards,</div></div></div>

--000000000000d12b3605fab90410--


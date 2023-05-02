Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAEDC77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 15:56:24 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.177.1683042975435998565
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 08:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=G9h9spUj;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-2f27a9c7970so3711880f8f.2
        for <Openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683042973; x=1685634973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T41LjyP2srj7RwflVY0O+yrt8TOPniry9O4Go3xawuA=;
        b=G9h9spUj8+ors45upQvMFDTAkaCDxf/mhdfCVMCNPGaxm/JqDx6N8GtW/OSACjuXAe
         BXwR4NfDlzMSL6qn0oO6FPCD87fpaCma3lFpN59VDQg6zUGe7vu+WqY30rXCj/vjrJ9f
         xeDonAHYUjjlOd3FO6rW93VYsdcCj+CT705uuaaRpcxb+HxIYdyTscWw3MkFxqpIvtvE
         8xc1d4IJk/VAKLBTnFE5WQTEZE30azRKxurlTPZOK6iOdax3gsOXah/JXExWsQS0bf+h
         BUJC5qtfuBO89nsKs9IXfn2kqwpxGTNPwi0EJWkLSVpTz7hbvS4awVQB7hP5moWPrJT9
         WJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683042973; x=1685634973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T41LjyP2srj7RwflVY0O+yrt8TOPniry9O4Go3xawuA=;
        b=U+dgLSuA7MtxscpNojlYu1GBW+fmEZUl7+wYAqnm5XozXvZ14jUdH35Qy1M1IAEE5t
         uueRsZeUQkaBQ8l5IG3VjJNEqDtXAm97Ff/aafGLQsJJEM8eICDbJdOVFmooblALx+OI
         oL4FlFdnt224tVskNmjanB2ZqoTRwkFzLh/lDu1L+eMbAHMkuano3gZT51EOrEJXE6g9
         spn6X1P5wyTZRazJJ++uMX3PT2xfdr01d0fA/JXRlxtDdiYa0ifFyD5+n7cw6i8GP0Qm
         NCaQvR45z5sL6FwHg417W/OTBaLX6qccQpCEI0bLOIYb9Yhp1NeTuRNiphY8m2tirP6t
         Gw4g==
X-Gm-Message-State: AC+VfDxtbSYtNyflHA8kwcznpASB3Ev/XZvIca5Isi16IjOMAgVsTacw
	rpdHfwoYrof1hQs4FlxX2vB1BlprcMDlM9b13Rs=
X-Google-Smtp-Source: ACHHUZ4h8pay+9InNZMar+BbVfu0n/R7a0I0nfcpEIRsedE0Jf0+o0Rkxyy309XGEKZ4YSbzPsY7y92bqrVlGG0pJ74=
X-Received: by 2002:a5d:4dcc:0:b0:306:30de:6fb8 with SMTP id
 f12-20020a5d4dcc000000b0030630de6fb8mr3879361wru.29.1683042973500; Tue, 02
 May 2023 08:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230427164723.863197-1-rs@ti.com> <36d695de-8152-c528-4b17-f85ff1e4c4ff@gmail.com>
 <df484615-b1eb-d368-f48e-f9da599cd4c4@ti.com>
In-Reply-To: <df484615-b1eb-d368-f48e-f9da599cd4c4@ti.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 2 May 2023 17:56:01 +0200
Message-ID: <CA+chaQfpAZwtAk4kOG56xiCmOm62MGW6YPEG661-n7XqC08Rxg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCHv2] glfw: add packageconfig and
 wayland dependencies
To: rs@ti.com
Cc: akuster808 <akuster808@gmail.com>, raj.khem@gmail.com, afd@ti.com, detheridge@ti.com, 
	reatmon@ti.com, denis@denix.org, Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000093c9ab05fab7fae9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 15:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102261

--00000000000093c9ab05fab7fae9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The version which was merged with:

PACKAGECONFIG ??=3D "x11"

Should still respect x11 in DISTRO_FEATURES, now this causes:

ERROR: Nothing PROVIDES 'libxi' (but meta-oe/recipes-core/glfw/glfw_3.3.bb
DEPENDS on or otherwise requires it)
libxi was skipped: missing required distro feature 'x11' (not in
DISTRO_FEATURES)
ERROR: Nothing PROVIDES 'libxinerama' (but meta-oe/recipes-core/glfw/
glfw_3.3.bb DEPENDS on or otherwise requires it)
libxinerama was skipped: missing required distro feature 'x11' (not in
DISTRO_FEATURES)
ERROR: Nothing PROVIDES 'libxrandr' (but meta-oe/recipes-core/glfw/
glfw_3.3.bb DEPENDS on or otherwise requires it)
libxrandr was skipped: missing required distro feature 'x11' (not in
DISTRO_FEATURES)
ERROR: Nothing PROVIDES 'libglu' (but meta-oe/recipes-core/glfw/glfw_3.3.bb
DEPENDS on or otherwise requires it)
libglu was skipped: missing required distro feature 'x11' (not in
DISTRO_FEATURES)
ERROR: Nothing PROVIDES 'libxcursor' (but meta-oe/recipes-core/glfw/
glfw_3.3.bb DEPENDS on or otherwise requires it)
libxcursor was skipped: missing required distro feature 'x11' (not in
DISTRO_FEATURES)

when wayland and opengl are in DISTRO_FEATURES, but x11 isn't.

REQUIRED_DISTRO_FEATURES is satisfied by "opengl" and
ANY_OF_DISTRO_FEATURES by "wayland", but the default PACKAGECONFIG doesn't
match with that.

On Fri, Apr 28, 2023 at 6:32=E2=80=AFPM Randolph Sapp via lists.openembedde=
d.org
<rs=3Dti.com@lists.openembedded.org> wrote:

> On 4/28/23 06:16, akuster808 wrote:
> > Doesn't this need to land it Master first? Kirkstone is in the subject
> >
> > - armin
> >
>
> Perhaps, but I've only had a chance to test it against kirkstone so I
> flagged it as such. At this point I'm still vetting solutions to this
> dependency chain though. Looking for something this layer would actually
> like to carry.
>
> > On 4/27/23 12:47 PM, rs@ti.com wrote:
> >> From: Randolph Sapp <rs@ti.com>
> >>
> >> GLFW has the ability to use a wayland backend. This patch adds a confi=
g
> >> for it, but does not enable it by default because it has a dependency =
on
> >> extra-cmake-modules which is provided (most commonly) by meta-qt5-extr=
a.
> >>
> >> Signed-off-by: Randolph Sapp <rs@ti.com>
> >> ---
> >>   meta-oe/recipes-core/glfw/glfw_3.3.bb | 14 ++++++++++++--
> >>   1 file changed, 12 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >> b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >> index b31bba6b6b..5b0d61241e 100644
> >> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON
> >> -DGLFW_BUILD_DOCS=3DOFF"
> >>   CFLAGS +=3D "-fPIC"
> >> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi libxcurso=
r"
> >> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> >> +DEPENDS =3D "libpng libglu zlib"
> >> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> >> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
> >> +
> >> +# upstream considers x11 and wayland backends mutually exclusive and
> >> will
> >> +# prioritize wayland if it is enabled, but wayland has dependencies
> >> that cannot
> >> +# be satisfied by this layer so it is disabled by default
> >> +
> >> +PACKAGECONFIG ??=3D "x11"
> >> +
> >> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland
> >> wayland-native wayland-protocols extra-cmake-modules libxkbcommon"
> >> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
> >>   COMPATIBLE_HOST:libc-musl =3D "null"
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102225):
> https://lists.openembedded.org/g/openembedded-devel/message/102225
> Mute This Topic: https://lists.openembedded.org/mt/98540896/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000093c9ab05fab7fae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The version which was merged with:<div><br></div><div>PACK=
AGECONFIG ??=3D &quot;x11&quot;<br></div><div><br></div><div>Should still r=
espect x11 in DISTRO_FEATURES, now this causes:</div><div><br></div><div>ER=
ROR: Nothing PROVIDES &#39;libxi&#39; (but meta-oe/recipes-core/glfw/<a hre=
f=3D"http://glfw_3.3.bb">glfw_3.3.bb</a> DEPENDS on or otherwise requires i=
t)<br>libxi was skipped: missing required distro feature &#39;x11&#39; (not=
 in DISTRO_FEATURES)<br>ERROR: Nothing PROVIDES &#39;libxinerama&#39; (but =
meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb">glfw_3.3.bb</a> DE=
PENDS on or otherwise requires it)<br>libxinerama was skipped: missing requ=
ired distro feature &#39;x11&#39; (not in DISTRO_FEATURES)<br>ERROR: Nothin=
g PROVIDES &#39;libxrandr&#39; (but meta-oe/recipes-core/glfw/<a href=3D"ht=
tp://glfw_3.3.bb">glfw_3.3.bb</a> DEPENDS on or otherwise requires it)<br>l=
ibxrandr was skipped: missing required distro feature &#39;x11&#39; (not in=
 DISTRO_FEATURES)<br>ERROR: Nothing PROVIDES &#39;libglu&#39; (but meta-oe/=
recipes-core/glfw/<a href=3D"http://glfw_3.3.bb">glfw_3.3.bb</a> DEPENDS on=
 or otherwise requires it)<br>libglu was skipped: missing required distro f=
eature &#39;x11&#39; (not in DISTRO_FEATURES)<br>ERROR: Nothing PROVIDES &#=
39;libxcursor&#39; (but meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.=
3.bb">glfw_3.3.bb</a> DEPENDS on or otherwise requires it)<br>libxcursor wa=
s skipped: missing required distro feature &#39;x11&#39; (not in DISTRO_FEA=
TURES)<br></div><div><br></div><div>when wayland and opengl are in DISTRO_F=
EATURES, but x11 isn&#39;t.</div><div><br></div><div>REQUIRED_DISTRO_FEATUR=
ES is satisfied by &quot;opengl&quot; and ANY_OF_DISTRO_FEATURES by &quot;w=
ayland&quot;, but the default PACKAGECONFIG doesn&#39;t match with that.</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Apr 28, 2023 at 6:32=E2=80=AFPM Randolph Sapp via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;rs=3D<a href=3D"=
mailto:ti.com@lists.openembedded.org">ti.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 4/28/=
23 06:16, akuster808 wrote:<br>
&gt; Doesn&#39;t this need to land it Master first? Kirkstone is in the sub=
ject<br>
&gt; <br>
&gt; - armin<br>
&gt; <br>
<br>
Perhaps, but I&#39;ve only had a chance to test it against kirkstone so I <=
br>
flagged it as such. At this point I&#39;m still vetting solutions to this <=
br>
dependency chain though. Looking for something this layer would actually <b=
r>
like to carry.<br>
<br>
&gt; On 4/27/23 12:47 PM, <a href=3D"mailto:rs@ti.com" target=3D"_blank">rs=
@ti.com</a> wrote:<br>
&gt;&gt; From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_bl=
ank">rs@ti.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; GLFW has the ability to use a wayland backend. This patch adds a c=
onfig<br>
&gt;&gt; for it, but does not enable it by default because it has a depende=
ncy on<br>
&gt;&gt; extra-cmake-modules which is provided (most commonly) by meta-qt5-=
extra.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" targ=
et=3D"_blank">rs@ti.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb" re=
l=3D"noreferrer" target=3D"_blank">glfw_3.3.bb</a> | 14 ++++++++++++--<br>
&gt;&gt; =C2=A0 1 file changed, 12 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.=
bb" rel=3D"noreferrer" target=3D"_blank">glfw_3.3.bb</a> <br>
&gt;&gt; b/meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb" rel=3D"=
noreferrer" target=3D"_blank">glfw_3.3.bb</a><br>
&gt;&gt; index b31bba6b6b..5b0d61241e 100644<br>
&gt;&gt; --- a/meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb" rel=
=3D"noreferrer" target=3D"_blank">glfw_3.3.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb" rel=
=3D"noreferrer" target=3D"_blank">glfw_3.3.bb</a><br>
&gt;&gt; @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D &quot;-DBUILD_SHARED_LIBS=3D=
ON <br>
&gt;&gt; -DGLFW_BUILD_DOCS=3DOFF&quot;<br>
&gt;&gt; =C2=A0 CFLAGS +=3D &quot;-fPIC&quot;<br>
&gt;&gt; -DEPENDS =3D &quot;libpng libglu zlib libxrandr libxinerama libxi =
libxcursor&quot;<br>
&gt;&gt; -REQUIRED_DISTRO_FEATURES =3D &quot;x11 opengl&quot;<br>
&gt;&gt; +DEPENDS =3D &quot;libpng libglu zlib&quot;<br>
&gt;&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
&gt;&gt; +ANY_OF_DISTRO_FEATURES =3D &quot;wayland x11&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +# upstream considers x11 and wayland backends mutually exclusive =
and <br>
&gt;&gt; will<br>
&gt;&gt; +# prioritize wayland if it is enabled, but wayland has dependenci=
es <br>
&gt;&gt; that cannot<br>
&gt;&gt; +# be satisfied by this layer so it is disabled by default<br>
&gt;&gt; +<br>
&gt;&gt; +PACKAGECONFIG ??=3D &quot;x11&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +PACKAGECONFIG[wayland] =3D &quot;-DGLFW_USE_WAYLAND=3DON,,wayland=
 <br>
&gt;&gt; wayland-native wayland-protocols extra-cmake-modules libxkbcommon&=
quot;<br>
&gt;&gt; +PACKAGECONFIG[x11] =3D &quot;,,libxrandr libxinerama libxi libxcu=
rsor&quot;<br>
&gt;&gt; =C2=A0 COMPATIBLE_HOST:libc-musl =3D &quot;null&quot;<br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#102225): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/102225" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/102225</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98540896/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98540896/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000093c9ab05fab7fae9--


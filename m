Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D21C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 08:02:22 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.5958.1659513736171469941
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SZNgyP7+;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id s9so12110669ljs.6
        for <Openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dufnM4H5sEGe4c7VlMmFOz0Q1Nf8X3A6pW+EoSfYheY=;
        b=SZNgyP7+1hvd8Uh9vJRDwcZ4XdbO4QI7tlMHl7r4/UHEw+OeNt7sAVndFnhW81L9m4
         KuYEcEaJ7xZ//1C9l+E222q7BH7TKcLKtRI51wwedQ6LjwBs8hwKhm2xxDh/yKoEroMH
         TKEhBe5I35JgfSyuxvgNqilX/OryyeR2xMj8NlphPoC8RQRXRJlCntfwxGmt7yenGTpr
         H+itc930n59j1FVIOGOyeC4axxLofc1TFVZOhBowWcZoX3cOWbYLrXjINZ/+hke1ikTN
         SiEBbOsMV3CQ2gf8Fwz1vKtOPhia1SyYU3ZoFav3O8FWzQIIvOebW19CL9wqAaOCAvwk
         NC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dufnM4H5sEGe4c7VlMmFOz0Q1Nf8X3A6pW+EoSfYheY=;
        b=tubYd8K+YxWcGPwb3107SQa0dtJfaUvrYqkQC7XTKrhzGXR1PcoykBKYgr3txu9Zwz
         otazCdmEP/tVtU0RGqukbE4kvlDjdDbP0z3zAalIWnKsg74n8eYMl4QrDPIyoF8XA2aV
         t+avjHoZjk0hc5KRYo16oDSr/nhMM1xHuznFh5im6MoMrRqWwTltpsmJOBErzJWX5Qil
         PVZLSSpSnwkQrOuOA/aiV7Qi3OBNyjebTQz0eUISFN8A8lXdaxFMl4FICT/EFr12r+JH
         /WZuauD/OQstsiHVRM6n4lmNlkKzm+fBUHr85VAybPWSn/8mJec9CciuK+5PZYWSvNLh
         eq1A==
X-Gm-Message-State: ACgBeo0y5DUlu7pK4RVsSdo5EFYoBeqwKTK9KTN0rYyRlYJfpql3/88d
	QKFeb2RJcrsjBYrYgy+tAG2pxmBYYFlUIrLFi3U=
X-Google-Smtp-Source: 
 AA6agR6pG8OjG2/vrkuR/AfgaDr3591XXheRmocQ2InmDLuzpjkyc+c7XhJtzKwAqT/3NWsWgkNycluzrjPZ3fOZ0Uk=
X-Received: by 2002:a2e:8605:0:b0:25e:5fe4:9e6b with SMTP id
 a5-20020a2e8605000000b0025e5fe49e6bmr2068811lji.484.1659513733983; Wed, 03
 Aug 2022 01:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <1705E216AF68BD15.13030@lists.openembedded.org>
 <DB6PR06MB4008C6E4EF0C6C1E2F0BEDEDBC9C9@DB6PR06MB4008.eurprd06.prod.outlook.com>
In-Reply-To: 
 <DB6PR06MB4008C6E4EF0C6C1E2F0BEDEDBC9C9@DB6PR06MB4008.eurprd06.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Aug 2022 09:02:03 +0100
Message-ID: 
 <CAMKF1spbw9eH+3WSOhHh=+bmGBSLf1t9J0bCW7N8Hk7pBJVZXA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] python3-pystemd: Upgrade 0.8.0 ->
 0.10.0:
To: Armin Kuster <akuster808@gmail.com>,
	SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009d33da05e551a64d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 08:02:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98108

--0000000000009d33da05e551a64d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We usually do not do major version upgrade in release branches I will let
Armin chime in as well

On Wed, Aug 3, 2022 at 8:01 AM SCHNEIDER Johannes <
johannes.schneider@leica-geosystems.com> wrote:

> Hi,
>
>
> and thanks for merging my patch into meta-openembedded:master (-:
>
> since I observed these issues while running a kirkstone based system - an=
d
> others will likely run into them as well - could you also put these chang=
es
> on the kirkstone branch?
>
>
> thanks and regards
> ------------------------------
> *From:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> on behalf of Johannes
> Schneider via lists.openembedded.org <johannes.schneider=3D
> leica-geosystems.com@lists.openembedded.org>
> *Sent:* Thursday, July 28, 2022 05:56
> *To:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *Cc:* SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
> *Subject:* [oe] [meta-python][PATCH v2] python3-pystemd: Upgrade 0.8.0 ->
> 0.10.0:
>
> This email is not from Hexagon=E2=80=99s Office 365 instance. Please be c=
areful
> while clicking links, opening attachments, or replying to this email.
>
>
> most important fix: version 0.8.0 errors out on dbus-lib interaction,
> which is fixed with the most recent commit
>
> 505e2b5 (tag: v.0.10.0) add interactive_authorization options for buses
> 2d90700 pystemd: add copyright boilerplate to typing stubs
> 5b95888 pystemd: update branch name in github workflow
> 16817d2 Add type stub for pystemd.run
> 410fd77 (tag: v.0.9.0) update changelog for 0.9.0
> 71aae43 GetProcesses() - info about systemd version (#59)
> fcafd08 Also include .pxd and .pxi in the source distribution
> 475cd2f also support 3.9
> ea98275 some formatting options and start pystemd 0.9 development
> eb7d225 pystemd: update install instructions in README
> 6fdf2c8 Daily `arc lint --take BLACK`
> 50e61b7 add a LIBSYSTEMD_VERSION macro for gating new functions (#58)
>
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m
> >
> ---
>  .../{python3-pystemd_0.8.0.bb =3D> python3-pystemd_0.10.0.bb}  | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pystemd_0.8.0.bb =3D=
>
> python3-pystemd_0.10.0.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
> b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
> rename to meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
> index 0056a794f..da263fe94 100644
> --- a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
> @@ -2,13 +2,12 @@ SUMMARY =3D "Python bindings for interacting with syste=
md
> over DBus"
>  LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fbd65380cdd255951079008b3645=
16c"
>
> -SRC_URI[md5sum] =3D "f993739eca645749f18d4ccfd4a0fbf3"
> -SRC_URI[sha256sum] =3D
> "cac2e42043ab28d43adf33dab493c6a3cf8a99794f824ae8af6d9cd6458b9972"
> +SRC_URI[sha256sum] =3D
> "d74a814bfda01085db1a8ad90be3cb27daf23a51ab6b03e7e29ec811fa2ae859"
>
>  DEPENDS =3D "systemd"
>  RDEPENDS:${PN} +=3D "python3-xml python3-pprint"
>  REQUIRED_DISTRO_FEATURES =3D "systemd"
>
> -inherit pypi setuptools3 features_check
> +inherit pypi setuptools3 features_check pkgconfig
>
>  BBCLASSEXTEND =3D "native"
> --
> 2.25.1
>
>

--0000000000009d33da05e551a64d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">We usually do not do major version upgrade=
 in release branches I will let Armin chime in as well</div><div dir=3D"aut=
o"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, Aug 3, 2022 at 8:01 AM SCHNEIDER Johannes &lt;<a href=3D"=
mailto:johannes.schneider@leica-geosystems.com">johannes.schneider@leica-ge=
osystems.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
and thanks for merging my patch into meta-openembedded:master (-:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
since I observed these issues while running a kirkstone based system - and =
others will likely run into them as well - could you also put these changes=
 on the kirkstone branch?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
thanks and regards<br>
</div>
<div id=3D"m_-7348901752802270121appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-7348901752802270121divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_bl=
ank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"mailto:op=
enembedded-devel@lists.openembedded.org" target=3D"_blank">openembedded-dev=
el@lists.openembedded.org</a>&gt; on behalf of Johannes Schneider via <a hr=
ef=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.o=
rg</a>
 &lt;johannes.schneider=3D<a href=3D"mailto:leica-geosystems.com@lists.open=
embedded.org" target=3D"_blank">leica-geosystems.com@lists.openembedded.org=
</a>&gt;<br>
<b>Sent:</b> Thursday, July 28, 2022 05:56<br>
<b>To:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D=
"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openem=
bedded-devel@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> SCHNEIDER Johannes &lt;<a href=3D"mailto:johannes.schneider@leic=
a-geosystems.com" target=3D"_blank">johannes.schneider@leica-geosystems.com=
</a>&gt;<br>
<b>Subject:</b> [oe] [meta-python][PATCH v2] python3-pystemd: Upgrade 0.8.0=
 -&gt; 0.10.0:</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>This email is not from Hexagon=E2=80=99s Office 365 instance. Please b=
e careful while clicking links, opening attachments, or replying to this em=
ail.<br>
<br>
<br>
most important fix: version 0.8.0 errors out on dbus-lib interaction,<br>
which is fixed with the most recent commit<br>
<br>
505e2b5 (tag: v.0.10.0) add interactive_authorization options for buses<br>
2d90700 pystemd: add copyright boilerplate to typing stubs<br>
5b95888 pystemd: update branch name in github workflow<br>
16817d2 Add type stub for pystemd.run<br>
410fd77 (tag: v.0.9.0) update changelog for 0.9.0<br>
71aae43 GetProcesses() - info about systemd version (#59)<br>
fcafd08 Also include .pxd and .pxi in the source distribution<br>
475cd2f also support 3.9<br>
ea98275 some formatting options and start pystemd 0.9 development<br>
eb7d225 pystemd: update install instructions in README<br>
6fdf2c8 Daily `arc lint --take BLACK`<br>
50e61b7 add a LIBSYSTEMD_VERSION macro for gating new functions (#58)<br>
<br>
Signed-off-by: Johannes Schneider &lt;<a href=3D"mailto:johannes.schneider@=
leica-geosystems.com" target=3D"_blank">johannes.schneider@leica-geosystems=
.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-pystemd_0.8.0.bb" target=3D"_blank">py=
thon3-pystemd_0.8.0.bb</a> =3D&gt; <a href=3D"http://python3-pystemd_0.10.0=
.bb" target=3D"_blank">python3-pystemd_0.10.0.bb</a>}=C2=A0 | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pystemd_0.8.0.bb" target=3D"_blank">python3-pystemd_0.8.0.bb</a> =3D&gt; <=
a href=3D"http://python3-pystemd_0.10.0.bb" target=3D"_blank">python3-pyste=
md_0.10.0.bb</a>} (62%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pystemd_0.8.0.bb" target=3D"_blank">python3-pystemd_0.8.0.bb</a> b/meta-pyt=
hon/recipes-devtools/python/<a href=3D"http://python3-pystemd_0.10.0.bb" ta=
rget=3D"_blank">python3-pystemd_0.10.0.bb</a><br>
similarity index 62%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
ystemd_0.8.0.bb" target=3D"_blank">python3-pystemd_0.8.0.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-pys=
temd_0.10.0.bb" target=3D"_blank">python3-pystemd_0.10.0.bb</a><br>
index 0056a794f..da263fe94 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pystemd=
_0.8.0.bb" target=3D"_blank">python3-pystemd_0.8.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pystemd=
_0.10.0.bb" target=3D"_blank">python3-pystemd_0.10.0.bb</a><br>
@@ -2,13 +2,12 @@ SUMMARY =3D &quot;Python bindings for interacting with sy=
stemd over DBus&quot;<br>
=C2=A0LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;<a>file://LICENSE;md5=3D4fbd65380cdd255951=
079008b364516c</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;f993739eca645749f18d4ccfd4a0fbf3&quot;<br>
-SRC_URI[sha256sum] =3D &quot;cac2e42043ab28d43adf33dab493c6a3cf8a99794f824=
ae8af6d9cd6458b9972&quot;<br>
+SRC_URI[sha256sum] =3D &quot;d74a814bfda01085db1a8ad90be3cb27daf23a51ab6b0=
3e7e29ec811fa2ae859&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;systemd&quot;<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-xml python3-pprint&quot;<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
<br>
-inherit pypi setuptools3 features_check<br>
+inherit pypi setuptools3 features_check pkgconfig<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
--<br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>

</blockquote></div></div>

--0000000000009d33da05e551a64d--


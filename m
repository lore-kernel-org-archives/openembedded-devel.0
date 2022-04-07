Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F52DC47082
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.3712.1649314552718355300
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 23:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QLGwGjw7;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso5303547pjh.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GGmELKIWRYErdVHAmM1MvZQsedzElP58cRjj3j4Zn3A=;
        b=QLGwGjw7UOZ7eIvnrddesoCdJlaF7OevKHIfAQ05PRxOq3zzXk7jN80kdCDf6Q6A2T
         IExHTTPzPMqE6CYjp8Phubo6c+9VInf7naH4hKNOmCb5lbjTjVTAanXswSU+s7AESnBD
         CWxyFkIyw18w1i3ukrJI1gFFIqPnFOcZkaXIk7e7yR8tCcFdwMySC56bq9PTV8Fq74JD
         Lp8nkVX2d50nqyldwfgKrdgfDgT6VDiZd/0rRYAwipDJvZqMx+TFn5Dx61Uj5fps1hvr
         BG/5U2nbZuF0wGFh2/8aDSjiUljjWl8I13u+6yeUk2a1oF7SH+gLMNM/hh3mKEY/aS0K
         4g8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GGmELKIWRYErdVHAmM1MvZQsedzElP58cRjj3j4Zn3A=;
        b=mf3T8O3Kmnvc7ANBW6qV5IL//SUyw5q2elcfwaazbl+Kru1yUWZSzo8ftP/lQJyJZN
         usF1ZAQhZEtoGDwJBOQQH1dWO3ZzI8eZgYewz2xdvaDeTr9WoBHkpfDNYkhaMbsE9NNx
         tVgzkSqPcQlWmGg/x0iPt7YuGC29KySsQNuiyKjMYkwFFqeVzDpv7KwVFWYrwPMJ6QE8
         BPIR7r2mFEy4miVI+XBfOJcL3Au84/2mRn4/zEAssX4MIIMXKktOVCPVhKELMSMKN4QM
         kK4IN4QaI7DT0VvqdTKxXJNZsCmMRT37Qsb+vJ6GnG9tsQyWi1YdEKUfxt8v2oFhgOjw
         +R5A==
X-Gm-Message-State: AOAM532iP+VLRP9fopEzLHSlHqhO6f07ra7KBoTTURk4rsWeTUqsKahr
	SqZPxaOJjaZlUEwtu5OBrxL/M+PmY815nT2Z0qI=
X-Google-Smtp-Source: 
 ABdhPJz8yWc4Dpc8uXLHLq5Rtv4GJ88htyiPuiaP0Mniyazd3D7g+0vhYjo2bW/ZefLRKzuBTjvACSKaxbLeI8hM4tA=
X-Received: by 2002:a17:90b:4a88:b0:1c7:9bc:a72e with SMTP id
 lp8-20020a17090b4a8800b001c709bca72emr14080922pjb.112.1649314552127; Wed, 06
 Apr 2022 23:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220402032642.107153-1-liezhi.yang@windriver.com>
In-Reply-To: <20220402032642.107153-1-liezhi.yang@windriver.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Thu, 7 Apr 2022 09:55:41 +0300
Message-ID: 
 <CABXoSoWMamXg3MaxzvJmRovNAQDJqXa2ZZ9dBC=CFg5EJgvNGQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] wxwidgets: Fix checking for PACKAGECONFIG
 and DISTRO_FEATURES
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000000a50c05dc0af875"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96446

--00000000000000a50c05dc0af875
Content-Type: text/plain; charset="UTF-8"

This commit breaks builds when DISTRO_FEATURES has opengl, but not x11.

ERROR: //meta-openembedded/meta-oe/recipes-extended/wxwidgets/
wxwidgets_3.1.5.bb: wxwidgets: PACKAGECONFIG[no_gui] Conflict package
config 'opengl' set in PACKAGECONFIG.

On Sat, 2 Apr 2022 at 06:26, Robert Yang <liezhi.yang@windriver.com> wrote:

> The PACKAGECONFIG depends on DISTRO_FEATURES, not DISTRO_FEATURES depends
> on
> PACKAGECONFIG. And the REQUIRED_DISTRO_FEATURES is not needed since it can
> work
> with gtk or x11.
>
> Fixed when x11 is not in DISTRO_FEATURES:
> $ bitbake wxwidgets
> ERROR: Nothing PROVIDES 'wxwidgets'
> wxwidgets was skipped: missing required distro feature 'x11' (not in
> DISTRO_FEATURES)
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> index f9349b02a..b10742eac 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> @@ -10,10 +10,7 @@ LICENSE = "WXwindows"
>  LIC_FILES_CHKSUM =
> "file://docs/licence.txt;md5=981f50a934828620b08f44d75db557c6"
>
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake',
> d)}
> -inherit features_check lib_package binconfig pkgconfig
> -
> -# All toolkit-configs except 'no_gui' require x11 explicitly (see
> toolkit.cmake)
> -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG',
> 'no_gui', '', 'x11', d)}"
> +inherit lib_package binconfig pkgconfig
>
>  DEPENDS += " \
>      jpeg \
> @@ -46,7 +43,11 @@ EXTRA_OECMAKE:append:libc-musl = " \
>      -DHAVE_LOCALE_T=OFF \
>  "
>
> -PACKAGECONFIG ?= "gtk ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
> +# All toolkit-configs except 'no_gui' require x11 explicitly (see
> toolkit.cmake)
> +PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk',
> 'no_gui', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
> +"
> +
>  PACKAGECONFIG:remove:class-native = "opengl"
>
>  # Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk'
> / 'qt'
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96342):
> https://lists.openembedded.org/g/openembedded-devel/message/96342
> Mute This Topic: https://lists.openembedded.org/mt/90194835/3617605
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> samuli.piippo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000000a50c05dc0af875
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This commit breaks builds when DISTRO_FEATURES has op=
engl, but not x11.</div><div><br></div><div><span style=3D"font-family:mono=
space"><span style=3D"font-weight:bold;color:rgb(255,84,84);background-colo=
r:rgb(255,255,255)">ERROR</span><span style=3D"color:rgb(0,0,0);background-=
color:rgb(255,255,255)">: </span><span style=3D"color:rgb(178,24,24);backgr=
ound-color:rgb(255,255,255)">//meta-openembedded/meta-oe/recipes-extended/w=
xwidgets/<a href=3D"http://wxwidgets_3.1.5.bb">wxwidgets_3.1.5.bb</a>: wxwi=
dgets: PACKAGECONFIG[no_gui] Conflict package config &#39;opengl&#39; set i=
n PACKAGECONFIG.</span><br></span></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 2 Apr 2022 at 06:26, Robert=
 Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windrive=
r.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">The PACKAGECONFIG depends on DISTRO_FEATURES, not DISTRO_FEATURES depe=
nds on<br>
PACKAGECONFIG. And the REQUIRED_DISTRO_FEATURES is not needed since it can =
work<br>
with gtk or x11.<br>
<br>
Fixed when x11 is not in DISTRO_FEATURES:<br>
$ bitbake wxwidgets<br>
ERROR: Nothing PROVIDES &#39;wxwidgets&#39;<br>
wxwidgets was skipped: missing required distro feature &#39;x11&#39; (not i=
n DISTRO_FEATURES)<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3.1.5.=
bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.1.5.bb</a> | 11 ++++++=
-----<br>
=C2=A01 file changed, 6 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets=
_3.1.5.bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.1.5.bb</a> b/me=
ta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3.1.5.bb" rel=
=3D"noreferrer" target=3D"_blank">wxwidgets_3.1.5.bb</a><br>
index f9349b02a..b10742eac 100644<br>
--- a/meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3.1.5.=
bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.1.5.bb</a><br>
+++ b/meta-oe/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_3.1.5.=
bb" rel=3D"noreferrer" target=3D"_blank">wxwidgets_3.1.5.bb</a><br>
@@ -10,10 +10,7 @@ LICENSE =3D &quot;WXwindows&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://docs/licence.txt;md5=3D981f50a93482=
8620b08f44d75db557c6&quot;<br>
<br>
=C2=A0inherit ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;qt&#39;, &=
#39;cmake_qt5&#39;, &#39;cmake&#39;, d)}<br>
-inherit features_check lib_package binconfig pkgconfig<br>
-<br>
-# All toolkit-configs except &#39;no_gui&#39; require x11 explicitly (see =
toolkit.cmake)<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;no_gui&#39;, &#39;&#39;, &#39;x11&#39;, d)}&quot;<br>
+inherit lib_package binconfig pkgconfig<br>
<br>
=C2=A0DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0jpeg \<br>
@@ -46,7 +43,11 @@ EXTRA_OECMAKE:append:libc-musl =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-DHAVE_LOCALE_T=3DOFF \<br>
=C2=A0&quot;<br>
<br>
-PACKAGECONFIG ?=3D &quot;gtk ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;,=
 &#39;opengl&#39;, d)}&quot;<br>
+# All toolkit-configs except &#39;no_gui&#39; require x11 explicitly (see =
toolkit.cmake)<br>
+PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &=
#39;x11&#39;, &#39;gtk&#39;, &#39;no_gui&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#3=
9;, d)} \<br>
+&quot;<br>
+<br>
=C2=A0PACKAGECONFIG:remove:class-native =3D &quot;opengl&quot;<br>
<br>
=C2=A0# Note on toolkit-PACKAGECONFIGs: select exactly one of &#39;no_gui&#=
39; / &#39;gtk&#39; / &#39;qt&#39;<br>
-- <br>
2.31.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#96342): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/96342" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/96342</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90194835/3617=
605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90194835/3617605</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:samuli.piippo@gmail.com"=
 target=3D"_blank">samuli.piippo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000000a50c05dc0af875--


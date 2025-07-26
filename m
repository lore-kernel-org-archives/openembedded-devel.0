Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E117BC87FCA
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 12:19:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.40202.1753532382311857694
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Jul 2025 05:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x9u+uVPh;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so106504f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 05:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753532380; x=1754137180; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xeqe/V7gBjoLmSvkjKB0N8YKPRjvlatBkHwo1omRiNA=;
        b=x9u+uVPhqb8gzWg3UKKvCOjXRHSWIC2i83PYnV4ZvsR5g+QBwezSJcpuzaSerftL3B
         Nak9HxCdgtM7xqefGLn66iHYC+9mRuuqjw6nzwy+k2+Xek18A1eS6v6VVWUjUksOyJvZ
         LxM3mvP5pEmC3Mywv6bZHBY9UbN/Nn3I1Rx4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753532380; x=1754137180;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xeqe/V7gBjoLmSvkjKB0N8YKPRjvlatBkHwo1omRiNA=;
        b=v2oNdBmcxwgWe7cSJKTSjNsDLphfmcOHETHDL26mB9ONGo61GoYI15Y/jdvv4fG/47
         LbB0O+XhV5olV6ltI9JxwaOK5O98YneD9OqHT/3vuBx4Hg6qqpDSbhpLYiZwe8bK44tr
         QooejPoVBZqqlWySRZ2aHgyUjfXXuE6JKbRyBXkfD4hBUMMjxC5vGkAj90VPdnFP8YGD
         CjAnvEDriUEyZkmdVdEEq8p3ep/ob5355Kpwl2TOhHml573ZUsf9QaKAvfxHWHLoX2Ah
         GcJOL+Puf0qwsa1GGqfpSKGQ4Lfx3AdohRg+k1JBwRNVRbR/PGFFaLEJOzfjpFswiaqV
         IDiQ==
X-Gm-Message-State: AOJu0Yx0nkPX/3PWpYN4RCsk3avGBsyJ3/eeqYIQK00h/xpcX8GkiYOm
	l0WKZ6Sqqoy0cbhz297Th+B+Q64kv5CVbdFt57V5njUWdu3e6vq5CQfFfoxuLH+/8u5RKkLUFHw
	8aAnMF5Ykc/9Mrb7R1UxQVxgJGWq54J5NIIfhlqhx+Xlv8Pl8SVWD5zUhTPOn
X-Gm-Gg: ASbGncudfERoxipr7yzijh43QfWJMWtWv0FO03w1GPeZ3RJl3Z8qEgmwV9s9ch+/RNe
	k0hLb+exJkwFrZRkwULlBg2OE7dZx0Pf4kBXPPnE1B/+Gy6RfgFH0jOD68kifPoHGp15tc8zFP9
	u6YZXff/pjbMA+zyrF/7bcnEqBVCqqj0naZFlqaSN0TNawRMJJZM5emwExJyGjf7jdp/ZBwxZ85
	uM65yIjlihITo6A4+jwox54w+js26DMDpOyPtmvYg==
X-Google-Smtp-Source: AGHT+IFAJNw6LWSbEKlXtb/2HBQS/1N7DtG1v51gwANIiZn0VOCgo//CAvdb/v2fxUDHlmpxI45sd+9EqOpeDeaQ+34=
X-Received: by 2002:a05:6000:4313:b0:3b5:dafc:1525 with SMTP id
 ffacd0b85a97d-3b77663f17bmr3984777f8f.33.1753532379984; Sat, 26 Jul 2025
 05:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250725191958.1696481-1-yoann.congal@smile.fr> <20250725191958.1696481-2-yoann.congal@smile.fr>
In-Reply-To: <20250725191958.1696481-2-yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 26 Jul 2025 14:19:14 +0200
X-Gm-Features: Ac12FXwDvz3_eVar1-uiscfHS5S8A1pT06gt7AICQz_XhHT6Q8yoL3qhV9bHtoE
Message-ID: <CAMSfU+5pq+jHmu5Qh9oq+E5HY0gd_QVHpfm_NV3Pc=zsBBksqA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] qhull: add native variant
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009c9da3063ad412a5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 12:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118740

--0000000000009c9da3063ad412a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 25 juil. 2025 =C3=A0 21:20, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> From: Yoann Congal <yoann.congal@smile.fr>
>
> Since commit 4042e529b9cf ("python3-matplotlib: Upgrade to 3.10.1"),
> python3-matplotlib depends on qhull and has native variant, so qhull
> does need the native variant as well.
>
> Fixes this warning from AB[0]:
> WARNING: Nothing PROVIDES 'qhull-native' (but
> virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-open=
embedded/meta-python/recipes-devtools/python/
> python3-matplotlib_3.10.3.bb DEPENDS on or otherwise requires it). Close
> matches:
> [0]:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/377/st=
eps/12/logs/warnings


FWIW, that also fix
WARNING: Nothing RPROVIDES 'smem-native' (but
virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openem=
bedded/meta-oe/dynamic-layers/meta-python/recipes-support/smem/
smem_1.5.bb RDEPENDS on or otherwise requires it)

WARNING: Nothing RPROVIDES 'smem-dev-native' (but
virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openem=
bedded/meta-oe/dynamic-layers/meta-python/recipes-support/smem/
smem_1.5.bb RDEPENDS on or otherwise requires it)



> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta-oe/recipes-extended/qhull/qhull_2020.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
> b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
> index 9efadbc7f4..3e3d1007e9 100644
> --- a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
> +++ b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
> @@ -25,3 +25,5 @@ inherit cmake
>  SYSROOT_DIRS:append =3D " \
>      ${bindir} \
>  "
> +
> +BBCLASSEXTEND =3D "native"
>


--=20
Yoann Congal
Smile ECS

--0000000000009c9da3063ad412a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0ven. 25 juil. 2025 =C3=A0=C2=A021=
:20, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal=
@smile.fr</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote gmail_=
quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Yo=
ann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">y=
oann.congal@smile.fr</a>&gt;<br>
<br>
Since commit 4042e529b9cf (&quot;python3-matplotlib: Upgrade to 3.10.1&quot=
;),<br>
python3-matplotlib depends on qhull and has native variant, so qhull<br>
does need the native variant as well.<br>
<br>
Fixes this warning from AB[0]:<br>
WARNING: Nothing PROVIDES &#39;qhull-native&#39; (but virtual:native:/srv/p=
okybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/re=
cipes-devtools/python/<a href=3D"http://python3-matplotlib_3.10.3.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-matplotlib_3.10.3.bb</a> DEPENDS =
on or otherwise requires it). Close matches:<br>
[0]: <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/82=
/builds/377/steps/12/logs/warnings" rel=3D"noreferrer" target=3D"_blank">ht=
tps://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/377/steps/=
12/logs/warnings</a></blockquote><div><br></div><div>FWIW, that also fix</d=
iv><div><div class=3D"gmail-bb-logviewer-text-row" style=3D"height:18px;wid=
th:100%"><span class=3D"gmail-log_o"><span>WARNING: Nothing RPROVIDES &#39;=
smem-native&#39; (but virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mi=
rror/build/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-sup=
port/smem/<a href=3D"http://smem_1.5.bb">smem_1.5.bb</a> RDEPENDS on or oth=
erwise requires it)</span></span></div><div class=3D"gmail-bb-logviewer-tex=
t-row" style=3D"height:18px;width:100%"><span class=3D"gmail-log_o"><span><=
br></span></span></div><div class=3D"gmail-bb-logviewer-text-row" style=3D"=
height:18px;width:100%"><span class=3D"gmail-log_o"><span>WARNING: Nothing =
RPROVIDES &#39;smem-dev-native&#39; (but virtual:native:/srv/pokybuild/yoct=
o-worker/meta-oe-mirror/build/meta-openembedded/meta-oe/dynamic-layers/meta=
-python/recipes-support/smem/<a href=3D"http://smem_1.5.bb">smem_1.5.bb</a>=
 RDEPENDS on or otherwise requires it)</span></span></div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/qhull/<a href=3D"http://qhull_2020.2.bb" rel=
=3D"noreferrer" target=3D"_blank">qhull_2020.2.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-extended/qhull/<a href=3D"http://qhull_2020.2.=
bb" rel=3D"noreferrer" target=3D"_blank">qhull_2020.2.bb</a> b/meta-oe/reci=
pes-extended/qhull/<a href=3D"http://qhull_2020.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">qhull_2020.2.bb</a><br>
index 9efadbc7f4..3e3d1007e9 100644<br>
--- a/meta-oe/recipes-extended/qhull/<a href=3D"http://qhull_2020.2.bb" rel=
=3D"noreferrer" target=3D"_blank">qhull_2020.2.bb</a><br>
+++ b/meta-oe/recipes-extended/qhull/<a href=3D"http://qhull_2020.2.bb" rel=
=3D"noreferrer" target=3D"_blank">qhull_2020.2.bb</a><br>
@@ -25,3 +25,5 @@ inherit cmake<br>
=C2=A0SYSROOT_DIRS:append =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${bindir} \<br>
=C2=A0&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000009c9da3063ad412a5--


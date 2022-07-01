Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30823C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 13:22:48 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.38326.1656681760973579290
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N5WyVHBX;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id p11so1765611qkg.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QdJ9pNoDID7qltbW2jmrJL/xeTLpB0y4izJaL/BAJJA=;
        b=N5WyVHBX2CVsoj7P9z19ZDROhKfPy2oaKsweBDa+oaH5Lwpogb2eIkJlHMqMz9qGpy
         oN5hn+Mfd2ZSr+zhdqL9FcdCeyY+3fZRYLzISqKp/sVJbxDwByEKJLzNUuDyYhNVPkpV
         yFL0TEkCnZoKpbfc8t3D1iWVEEqpN6BQdjBhoCn0E0F9yr0KSF5MymLHwbgwPvvqVzHV
         lHB1d4XEbmvR5vrrnzwGauGKA35uXbYzK7j9M77UYMLbaIY6p7vBXt3QkCFSeTCIHvUX
         6Z9yNHfnSCGOHI6irGJ4HVOPzNB9KIvvNcbpQfN/xKEeb5Xp2XHzs0N/Ao6P8ACFh1er
         gKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QdJ9pNoDID7qltbW2jmrJL/xeTLpB0y4izJaL/BAJJA=;
        b=kwx7IhjtDSyHDwdPOOpM2Gs4E+c0qnwQKDVH7fUCGIfkjU1iNWDmI5jxaqnytFQG+o
         /tK76SL8dwMJ9HRKDfgDBYllnO8jdB7YKE9HMUYinxcEeu2cUuc37M5bosomAe3Vgqk7
         aeGRaY9b0GBlPcYEky9ZBNd1Wli54XTOldVA+HZYzOnpcaSr5MyzvK3gHvixv5aw64OL
         tauYt2mUtEetduXBBETUCKY/dpfLOqjib+IqvVmDU3lqHrwsh017U74GY+HS7zQZjqHl
         88g/+8TqLU7EYMu1tU5QHeQAFElhYTiPxAvh7SNnh6vXIGZi5R9XAaJD35HupOHCwReG
         9UGA==
X-Gm-Message-State: AJIora8A2x22NCVYyYFmolNbSFLW84Td4+SE6HJgUVoqnhWABHawGOMP
	hGHRhZGBBzg/5Fftfd682OE1WyUmpDU8224eDMBmjYD/F6I=
X-Google-Smtp-Source: 
 AGRyM1uMJmj5GZOlIFWPKGMOD7qIR9WJN1AbOMnvBGYtZqSMQcPX0T5gW5KhHsAGTbEF2tlUBVIHf7ODJBco9bJ4klY=
X-Received: by 2002:a05:620a:1786:b0:6af:6e0f:596c with SMTP id
 ay6-20020a05620a178600b006af6e0f596cmr10465660qkb.227.1656681759839; Fri, 01
 Jul 2022 06:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220701113559.290350-1-ross.burton@arm.com>
In-Reply-To: <20220701113559.290350-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2022 09:22:29 -0400
Message-ID: 
 <CAMKF1sp-1JYgxf-WJcoEBo2qY90fDJf9rjt8BLm=DTBWecy8-A@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/3] python3-hatchling: remove (now in oe-core)
To: Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cd1b3405e2be47af"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 13:22:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97668

--000000000000cd1b3405e2be47af
Content-Type: text/plain; charset="UTF-8"

I have staged a patch to remove all these in one patch yesterday

On Fri, Jul 1, 2022 at 7:36 AM Ross Burton <ross.burton@arm.com> wrote:

> As of 846e80 this is now in oe-core.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-python/classes/python_hatchling.bbclass  |  5 -----
>  .../python/python3-hatchling_1.3.0.bb         | 21 -------------------
>  2 files changed, 26 deletions(-)
>  delete mode 100644 meta-python/classes/python_hatchling.bbclass
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-hatchling_1.3.0.bb
>
> diff --git a/meta-python/classes/python_hatchling.bbclass
> b/meta-python/classes/python_hatchling.bbclass
> deleted file mode 100644
> index b3cbe23601..0000000000
> --- a/meta-python/classes/python_hatchling.bbclass
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -inherit python_pep517 python3native python3-dir setuptools3-base
> -
> -DEPENDS += "python3-hatchling-native"
> -
> -PEP517_BUILD_API = "hatchling.build"
> diff --git a/meta-python/recipes-devtools/python/
> python3-hatchling_1.3.0.bb b/meta-python/recipes-devtools/python/
> python3-hatchling_1.3.0.bb
> deleted file mode 100644
> index a6550a9732..0000000000
> --- a/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -SUMMARY = "The extensible, standards compliant build backend used by
> Hatch"
> -HOMEPAGE = "https://hatch.pypa.io/latest/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=cbe2fd33fc9297692812fc94b7d27fd9"
> -
> -inherit pypi python_hatchling
> -
> -DEPENDS += "python3-pluggy-native python3-tomli-native
> python3-pathspec-native python3-packaging-native python3-editables-native"
> -DEPENDS:remove:class-native = "python3-hatchling-native"
> -
> -SRC_URI[sha256sum] =
> "1401d45d3dd6a5910f64d539acaa943486d5e8b7dda1a97f2b0040fdddc5b85e"
> -
> -# Until we have a proper tool to invoke PEP517 builds, hatchling can't
> -# bootstrap itself automatically.
> -PEP517_BUILD_API = "hatchling.ouroboros"
> -
> -do_compile:prepend() {
> -    export PYTHONPATH=src
> -}
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97660):
> https://lists.openembedded.org/g/openembedded-devel/message/97660
> Mute This Topic: https://lists.openembedded.org/mt/92106450/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000cd1b3405e2be47af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I have staged a patch to remove all these in one patch ye=
sterday=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Jul 1, 2022 at 7:36 AM Ross Burton &lt;<a href=3D=
"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">As of 846e80 this is now in oe-core.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta-python/classes/python_hatchling.bbclass=C2=A0 |=C2=A0 5 -----<br=
>
=C2=A0.../python/<a href=3D"http://python3-hatchling_1.3.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-hatchling_1.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 21 -------------------<br>
=C2=A02 files changed, 26 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/classes/python_hatchling.bbclass<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-hatchling_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-hatchling_1.3.0.bb</a><br>
<br>
diff --git a/meta-python/classes/python_hatchling.bbclass b/meta-python/cla=
sses/python_hatchling.bbclass<br>
deleted file mode 100644<br>
index b3cbe23601..0000000000<br>
--- a/meta-python/classes/python_hatchling.bbclass<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-inherit python_pep517 python3native python3-dir setuptools3-base<br>
-<br>
-DEPENDS +=3D &quot;python3-hatchling-native&quot;<br>
-<br>
-PEP517_BUILD_API =3D &quot;hatchling.build&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
hatchling_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-hatchling_=
1.3.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-hatchling_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-hatchlin=
g_1.3.0.bb</a><br>
deleted file mode 100644<br>
index a6550a9732..0000000000<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-hatchli=
ng_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-hatchling_1.3.0.b=
b</a><br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-SUMMARY =3D &quot;The extensible, standards compliant build backend used b=
y Hatch&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://hatch.pypa.io/latest/" rel=3D"norefe=
rrer" target=3D"_blank">https://hatch.pypa.io/latest/</a>&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Dcbe2fd33fc9297692812fc=
94b7d27fd9&quot;<br>
-<br>
-inherit pypi python_hatchling<br>
-<br>
-DEPENDS +=3D &quot;python3-pluggy-native python3-tomli-native python3-path=
spec-native python3-packaging-native python3-editables-native&quot;<br>
-DEPENDS:remove:class-native =3D &quot;python3-hatchling-native&quot;<br>
-<br>
-SRC_URI[sha256sum] =3D &quot;1401d45d3dd6a5910f64d539acaa943486d5e8b7dda1a=
97f2b0040fdddc5b85e&quot;<br>
-<br>
-# Until we have a proper tool to invoke PEP517 builds, hatchling can&#39;t=
<br>
-# bootstrap itself automatically.<br>
-PEP517_BUILD_API =3D &quot;hatchling.ouroboros&quot;<br>
-<br>
-do_compile:prepend() {<br>
-=C2=A0 =C2=A0 export PYTHONPATH=3Dsrc<br>
-}<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97660): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97660" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97660</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92106450/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92106450/1997914</a><br>
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

--000000000000cd1b3405e2be47af--


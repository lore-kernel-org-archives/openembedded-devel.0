Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B60C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 17:20:25 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.477.1709832020030619180
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 09:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/LiqC/V;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-21fe1bc5fc4so494673fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 09:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709832019; x=1710436819; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ElchEb84C76wl6grpL9OXkPHB0TSbplW1qeTVoRg6SI=;
        b=M/LiqC/ViBEB6eWHthjGXM61oiq27CJg2A/KWE/mXJaDH10kay5QCD3Fz8xNvIO1Hp
         p3GRWYJsdegomD0UrilDkXgRyGq/5y+w5OM3CkgXw5wL9VRcRJOD1NzlCdVS0ggMfqMM
         XXgWqd/3rcDuUxDahWBPND1iR9gVrMTA8VT8Nc11XHX02Zafz8yS5lptFxWpi70AZURb
         jQn6urWy0dp2UCSe6TnatidHIElN6awltcX+JH+2sKK+YKQmmhQ0jtL3Em5WHAjRRy9r
         WuhFIIA3bilQkOfJdZG+0gChEkof1vWcGxKAJQwLmXIgvaXLrFdK1r+HCZ/OYIzdlO+u
         y79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709832019; x=1710436819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElchEb84C76wl6grpL9OXkPHB0TSbplW1qeTVoRg6SI=;
        b=SkJiZ6wFLvy1KQe8fgHqCnZidkwtrwSptK/UkJT0azkZcH3r/tq/WIsuy3sL7LH/Nm
         fBdc5atNj3LpP/EcLHYTUz1+V6IOzkB4xTyTfjbdYY4xQrfrqR7sZi5q8qYfm6l2XBo8
         Zw6tYVszuZ9ikzBZVAL29DpJk3tGR44+IRzdMBuRy57DNJq+zcKzXcirsD/2EKGmLSOF
         WaLd22KsdvJ5Ayw0il2bDvczhPi5T0H2e23nEAkjaZu3ePFuNpvURw6PNwOdS6jxdSMw
         IY3l0SVEvyOHHtgTuctKaoTKILMq2w/fQombcBYcx/eX2FXgInVvSX3krZHH9sjfr1YM
         M4sg==
X-Gm-Message-State: AOJu0Yz3V5efJ9DxMgKba6+5x8RLd/yjyRhFiCxXR+835AtTwQXO+fNr
	rAlDyn1Cl67vZRyMLIfPBSRXvK5zpRThQRsoKHWQkLSpwpSs2PQp+yaBB0BZeG2G/rXRfW6tOO8
	iL/HbW9Yz4zRqOheUpMcIk82/Erg=
X-Google-Smtp-Source: AGHT+IHRQw1VweaqvkxnGEbqjeqkg6ppD808cHZEIwwmkByURRgd7iG84VX5WWeokS0kiDMLKSncL4ST3N6WmVJpj9A=
X-Received: by 2002:a05:6871:20a:b0:21f:406:8ace with SMTP id
 t10-20020a056871020a00b0021f04068acemr207103oad.11.1709832018847; Thu, 07 Mar
 2024 09:20:18 -0800 (PST)
MIME-Version: 1.0
References: <20240307162712.9329-2-andre.paiusco@gmail.com> <20240307162712.9329-3-andre.paiusco@gmail.com>
In-Reply-To: <20240307162712.9329-3-andre.paiusco@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Mar 2024 09:20:07 -0800
Message-ID: <CAMKF1spbN+wPimXrd807d6VNHNk7uCipvt-p+2Zi3hRFtg2nQw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ydotool: Add new package
To: =?UTF-8?Q?Andr=C3=A9_Belmudes_Paiusco?= <andre.paiusco@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001beeba0613154a65"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 17:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109203

--0000000000001beeba0613154a65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 8:28=E2=80=AFAM Andr=C3=A9 Belmudes Paiusco <
andre.paiusco@gmail.com> wrote:

> CC: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Andre Paiusco <andre.paiusco@gmail.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb      |  1 +
>  .../recipes-graphics/ydotool/ydotool_git.bb    | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ydotool/ydotool_git.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 6e2012dae..dd033208b 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -611,6 +611,7 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D"\
>      xcursorgen \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver",
> "", d)} \
>      yad \
> +    ydotool \
>      parallel-deqp-runner \
>      ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts",
> "", d)} \
>      ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan",
> "vulkan-cts", "", d)} \
> diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
> b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
> new file mode 100644
> index 000000000..928f5f79b
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Generic Linux command-line automation tool (no X!)"
> +DESCRIPTION =3D "ydotool is not limited to Wayland. You can use it on
> anything as long as it accepts keyboard/mouse/whatever input."
> +LICENSE =3D "AGPL-3.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deb1e647870add0502f8f010b19de3=
2af"
> +
> +DEPENDS =3D "systemd"


This means it can only be used when systemd is in distro features so please
add that check as well


> +PV =3D "1.0.4+git"
> +
> +SRC_URI =3D "git://
> github.com/ReimuNotMoe/ydotool;protocol=3Dhttps;branch=3Dmaster"
> +SRCREV =3D "c07ae72be46c40912023b91b8ba737630d8720e1"
> +
> +inherit cmake systemd pkgconfig
> +
> +EXTRA_OECMAKE =3D "\
> +    -DBUILD_DOCS=3DOFF \
> +"
> +
> +SYSTEMD_SERVICE:${PN} =3D "ydotoold.service
> \ No newline at end of file
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109202):
> https://lists.openembedded.org/g/openembedded-devel/message/109202
> Mute This Topic: https://lists.openembedded.org/mt/104790839/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001beeba0613154a65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 7, 2024 at 8:28=E2=80=AFAM Andr=C3=A9 Belmudes =
Paiusco &lt;<a href=3D"mailto:andre.paiusco@gmail.com">andre.paiusco@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">CC: Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com=
</a>&gt;<br>
Signed-off-by: Andre Paiusco &lt;<a href=3D"mailto:andre.paiusco@gmail.com"=
 target=3D"_blank">andre.paiusco@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-oe.bb" rel=3D"n=
oreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
=C2=A0.../recipes-graphics/ydotool/<a href=3D"http://ydotool_git.bb" rel=3D=
"noreferrer" target=3D"_blank">ydotool_git.bb</a>=C2=A0 =C2=A0 | 18 +++++++=
+++++++++++<br>
=C2=A02 files changed, 19 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/ydotool/<a href=3D"http:/=
/ydotool_git.bb" rel=3D"noreferrer" target=3D"_blank">ydotool_git.bb</a><br=
>
<br>
diff --git a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegr=
oup-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.b=
b</a> b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-m=
eta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=
<br>
index 6e2012dae..dd033208b 100644<br>
--- a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><b=
r>
+++ b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><b=
r>
@@ -611,6 +611,7 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D&quot;\<br>
=C2=A0 =C2=A0 =C2=A0xcursorgen \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot=
;x11 pam&quot;, &quot;xscreensaver&quot;, &quot;&quot;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0yad \<br>
+=C2=A0 =C2=A0 ydotool \<br>
=C2=A0 =C2=A0 =C2=A0parallel-deqp-runner \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot=
;opengl&quot;, &quot;opengl-es-cts&quot;, &quot;&quot;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot=
;opengl vulkan&quot;, &quot;vulkan-cts&quot;, &quot;&quot;, d)} \<br>
diff --git a/meta-oe/recipes-graphics/ydotool/<a href=3D"http://ydotool_git=
.bb" rel=3D"noreferrer" target=3D"_blank">ydotool_git.bb</a> b/meta-oe/reci=
pes-graphics/ydotool/<a href=3D"http://ydotool_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">ydotool_git.bb</a><br>
new file mode 100644<br>
index 000000000..928f5f79b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/ydotool/<a href=3D"http://ydotool_git.bb" re=
l=3D"noreferrer" target=3D"_blank">ydotool_git.bb</a><br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;Generic Linux command-line automation tool (no X!)&quot;=
<br>
+DESCRIPTION =3D &quot;ydotool is not limited to Wayland. You can use it on=
 anything as long as it accepts keyboard/mouse/whatever input.&quot;<br>
+LICENSE =3D &quot;AGPL-3.0-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Deb1e647870add0502f8f010b19=
de32af&quot;<br>
+<br>
+DEPENDS =3D &quot;systemd&quot;</blockquote><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">This means it can only be used when systemd is in distro fe=
atures so please add that check as well=C2=A0</div><div dir=3D"auto"><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
+PV =3D &quot;1.0.4+git&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/ReimuNotMoe/ydotool;p=
rotocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/ReimuNotMoe/ydotool;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
+SRCREV =3D &quot;c07ae72be46c40912023b91b8ba737630d8720e1&quot;<br>
+<br>
+inherit cmake systemd pkgconfig<br>
+<br>
+EXTRA_OECMAKE =3D &quot;\<br>
+=C2=A0 =C2=A0 -DBUILD_DOCS=3DOFF \<br>
+&quot;<br>
+<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;ydotoold.service<br>
\ No newline at end of file<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109202): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109202" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109202</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104790839/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104790839/1997914</a><br>
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

--0000000000001beeba0613154a65--


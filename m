Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8DCC83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:23:51 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.8824.1693380221576040082
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=V++xJCat;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-307d20548adso4423613f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 00:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693380220; x=1693985020; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lY2hrIH8i4PrPWXTdiJw2qBuG2/0jYHOMH4g4WgAoVo=;
        b=V++xJCatFtHepwjX8a5m1bwPW7CY8BKE9L8UuwL4EvKsicnu2Y2uGxZleC5ocN4quL
         62scAqPT/X905sU7dFCozN13FYhFCwqaHBBlkfLqFO52/u4E4Uh2PPbFN/+wJgSctbvF
         jChaEADXmsgXyV9lWd61r2yWd6VSGGVJlzyrASkvsNNUJQ8H+ETTTGdhLJSVmWlnNiDd
         N6yF632fiHeXeQTMTmpPAc/FkFgJwVunA0KVSq6hFZxzefeqrIW11rhhucPVTMblZKYs
         Vu4qVbfwsCy9jr/7D3D+Sl5Gy/lFpEFbgZ9WIc9MBystKduAv4K3m1aAHkqPapZK8KSK
         ha/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693380220; x=1693985020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lY2hrIH8i4PrPWXTdiJw2qBuG2/0jYHOMH4g4WgAoVo=;
        b=AvTdMz/kTE9CgNfuYN/6JmuM/ZxTL/tEz12HXyT0yG5VG83A1zOo3TBkZbeZClr2K8
         hJ759PAlxxcNxIRGrC9LhYq5esPxMGQaSvnv/HQ3H2qZHfqW7ljDIYObuHhDslNCp5WB
         adtsYQntYQCGILYdmllWg+isbJiE5M77yEOttZrSY1ktl2FgEI/Jjk7Nvnlx//nilRUd
         Vte1FuLwwUhIlKKGeDnE1lgxVofCwzV66k8V/N38nipBPUOjhz24PrGLdWmb2aMxlJM/
         +WeCnY5PBEouyWDrNHEkj8fA2p4VTyCwVu0E3ob9B9K8U7fAWmhVEAANMO4wmYHJmAI3
         AE4Q==
X-Gm-Message-State: AOJu0YwtTsBhZgKINjMLcP3X3pic23rEgGSBoeslLjjWnIlW0OfE1GW9
	RXzRAeWApgNS70g+/t75oDUgXBDgEm1EvEBDBgpOWaC4Gjk=
X-Google-Smtp-Source: AGHT+IGqGGzuBrTwmaPJSqX9iQZzH5HK0vFpOCbwErVayAnbEYUx+puZVpVz8BkC3tGnathe0KKNJCRkJi/HpBSeWdY=
X-Received: by 2002:adf:f24d:0:b0:318:f7a:e3cb with SMTP id
 b13-20020adff24d000000b003180f7ae3cbmr1061147wrp.31.1693380219800; Wed, 30
 Aug 2023 00:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230825161733.3279-1-f_l_k@t-online.de>
In-Reply-To: <20230825161733.3279-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 09:23:16 +0200
Message-ID: <CA+chaQc7Em1wJ_h--KjSzYSdJ5bRCv8fcqvAdYRZyZzqdsrOpQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCHv3] spice-guest-vdagent: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000078907906041ece7f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104651

--00000000000078907906041ece7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 6:17=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:

> The spice-vdagent needs to be running alongside qemu-guest-agent on
> virtualizationguest systems that are using the spice protocol to
> get seamless integration.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../spice/spice-guest-vdagent_0.22.1.bb       | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-networking/recipes-support/spice/
> spice-guest-vdagent_0.22.1.bb
>
> diff --git a/meta-networking/recipes-support/spice/
> spice-guest-vdagent_0.22.1.bb b/meta-networking/recipes-support/spice/
> spice-guest-vdagent_0.22.1.bb
> new file mode 100644
> index 0000000000..b51e03899f
> --- /dev/null
> +++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Spice agent for Linux"
> +HOMEPAGE =3D "https://spice-space.org"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +
> +SRCREV =3D "aa08162f036840d3e33502dc0a836b03b9cec97c"
> +
> +SRC_URI =3D "git://
> gitlab.freedesktop.org/spice/linux/vd_agent.git;protocol=3Dhttps;branch=
=3Dmaster
> "
> +
> +S =3D "${WORKDIR}/git"
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>

Looks like it needs x11 as well together with few additional deps, in
builds without x11 enabled it fails with:

| checking for gtk4 >=3D 3.98... yes
| checking for gio-unix-2.0 >=3D 2.50... yes
| checking for xfixes xrandr >=3D 1.3 xinerama x11... no
| configure: error: Package requirements (xfixes xrandr >=3D 1.3 xinerama
x11) were not met:
|
| No package 'xfixes' found
| No package 'xrandr' found
| No package 'xinerama' found
| No package 'x11' found


> +
> +inherit autotools pkgconfig features_check
> +
> +DEPENDS =3D "glib-2.0 alsa-lib gtk4 dbus libdrm spice-protocol"
> +
> +EXTRA_OECONF =3D " \
> +       --with-gtk4 \
> +       --enable-pie \
> +"
> +
> +FILES:${PN} +=3D "${datadir}"
> +
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104610):
> https://lists.openembedded.org/g/openembedded-devel/message/104610
> Mute This Topic: https://lists.openembedded.org/mt/100958762/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000078907906041ece7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 25, 2023 at 6:17=E2=80=AF=
PM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
e spice-vdagent needs to be running alongside qemu-guest-agent on<br>
virtualizationguest systems that are using the spice protocol to<br>
get seamless integration.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../spice/<a href=3D"http://spice-guest-vdagent_0.22.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">spice-guest-vdagent_0.22.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 25 +++++++++++++++++++<br>
=C2=A01 file changed, 25 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/spice/<a href=3D"h=
ttp://spice-guest-vdagent_0.22.1.bb" rel=3D"noreferrer" target=3D"_blank">s=
pice-guest-vdagent_0.22.1.bb</a><br>
<br>
diff --git a/meta-networking/recipes-support/spice/<a href=3D"http://spice-=
guest-vdagent_0.22.1.bb" rel=3D"noreferrer" target=3D"_blank">spice-guest-v=
dagent_0.22.1.bb</a> b/meta-networking/recipes-support/spice/<a href=3D"htt=
p://spice-guest-vdagent_0.22.1.bb" rel=3D"noreferrer" target=3D"_blank">spi=
ce-guest-vdagent_0.22.1.bb</a><br>
new file mode 100644<br>
index 0000000000..b51e03899f<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/spice/<a href=3D"http://spice-guest-v=
dagent_0.22.1.bb" rel=3D"noreferrer" target=3D"_blank">spice-guest-vdagent_=
0.22.1.bb</a><br>
@@ -0,0 +1,25 @@<br>
+SUMMARY =3D &quot;Spice agent for Linux&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://spice-space.org" rel=3D"noreferrer" =
target=3D"_blank">https://spice-space.org</a>&quot;<br>
+LICENSE =3D &quot;GPL-3.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504&quot;<br>
+<br>
+SRCREV =3D &quot;aa08162f036840d3e33502dc0a836b03b9cec97c&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/spice/lin=
ux/vd_agent.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">gitlab.freedesktop.org/spice/linux/vd_agent.git;protocol=3Dhttp=
s;branch=3Dmaster</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br></blockquote><div><br><=
/div><div>Looks like it needs x11 as well together with few additional deps=
, in builds without x11 enabled it fails with:</div><div><br></div><div>| c=
hecking for gtk4 &gt;=3D 3.98... yes</div>| checking for gio-unix-2.0 &gt;=
=3D 2.50... yes<br>| checking for xfixes xrandr &gt;=3D 1.3 xinerama x11...=
 no<br>| configure: error: Package requirements (xfixes xrandr &gt;=3D 1.3 =
xinerama x11) were not met:<br>| <br>| No package &#39;xfixes&#39; found<br=
>| No package &#39;xrandr&#39; found<br>| No package &#39;xinerama&#39; fou=
nd<br>| No package &#39;x11&#39; found=C2=A0<div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">+<br>
+inherit autotools pkgconfig features_check<br>
+<br>
+DEPENDS =3D &quot;glib-2.0 alsa-lib gtk4 dbus libdrm spice-protocol&quot;<=
br>
+<br>
+EXTRA_OECONF =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--with-gtk4 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-pie \<br>
+&quot;<br>
+<br>
+FILES:${PN} +=3D &quot;${datadir}&quot;<br>
+<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104610): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104610" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104610</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100958762/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100958762/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000078907906041ece7f--


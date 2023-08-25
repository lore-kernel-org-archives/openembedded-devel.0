Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C620C79F66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 14:06:46 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.14333.1692972404437741945
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 07:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=G2/gjH4d;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1cca7cf6e01so588844fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 07:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692972403; x=1693577203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LEUa8sD3f63mwaJRAl4HyXjzGFDo4b0cfpu3TtfMRho=;
        b=G2/gjH4dgjDmlQ4p4FWOXZ/rvnqUSajyR8oifLjGTKGDugzBrtNihbAZpLBwxeI8qF
         bfzkPnM36Tk8/OkTqr8dfZXKoTSMBdMxDAxsroWwsrhS0wY+bS54QitQ8AtBeYbU+Juh
         mgqCzevVi4WvZmx4OMI17G2UWroU9WrIuOAxKtBM2g6PLp7erE43P1qICd+0wgtxofTB
         Iqs6f0P6yE6v4P+BwR3rsdEZZHBTplhXojhmwxYR1LeeSBYCHXAlxQ3psXWFS+xr6q1w
         Lyu3OuMOlxlYQYRE92ndYxx9nqPOFM0kBu6oCjow/Z/Cst0svXQPdxbU2uniFRXfo7dq
         sUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972403; x=1693577203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEUa8sD3f63mwaJRAl4HyXjzGFDo4b0cfpu3TtfMRho=;
        b=aUBgNjl4YuY84jiW/N3klxwem4kTpBhrUA6OxWdfgYEuHr4+74iJ25dkhu0dfIWAeI
         Jpv99Ak6QQWOuJr8ZqgLWZE/OAczcv6GfdKylx/ivlavYtm57eEn3UKIleXz8mH5LFhX
         YS9qnuaOS9rXtDiFn65JQcrrZeVjaoXsSRYf7kyUEGJjg3UxSBSbfGNuy4CGwgmyed4R
         h4zWZ8J3Q2wnZMV0AyUmZdFC//hTlgxFfWjPEzM+UGu7TR1bWbpgjH8ppHs4C0AkUNOM
         hDhwIUy+UOko2eFv7a0olvx4/I+XXJteLMvlKZ/Mj/z8DDXkqNPD38DMb07HLFvkEh65
         PJcw==
X-Gm-Message-State: AOJu0YyH3K29+0tw+AvEiHKPcaW1K3wKh2SJka6AQ5lsh4m4Mh22cyCU
	Oh0+2QFYoce+gDgKp8g/oHUxIajqYOmje418406S2Zn7d3o=
X-Google-Smtp-Source: AGHT+IF4+VfnCp01tvU5F//X1TsN1pJ5Pb+tO50Bj9R2n4ohI4Z2TrPdvVjSRwZNRJ6GD6HT+3KrTx6n7Yz+9VkhN2w=
X-Received: by 2002:a05:6871:b08:b0:1b3:8fed:c4a0 with SMTP id
 fq8-20020a0568710b0800b001b38fedc4a0mr3300283oab.1.1692972403343; Fri, 25 Aug
 2023 07:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230825081652.2664-1-f_l_k@t-online.de>
In-Reply-To: <20230825081652.2664-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Aug 2023 07:06:32 -0700
Message-ID: <CAMKF1srtWwErZ002thBDT5zzP1yiu-Tn=QsP02i72gzuqPga_g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCHv2] spice-guest-vdagent: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b748bd0603bfda07"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 14:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104609

--000000000000b748bd0603bfda07
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 25, 2023 at 1:17 AM Markus Volk <f_l_k@t-online.de> wrote:

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
> index 0000000000..93c6de545c
> --- /dev/null
> +++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Spice agent for Linux"
> +HOMEPAGE = "https://spice-space.org"
> +LICENSE = "GPL-3.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRCREV = "aa08162f036840d3e33502dc0a836b03b9cec97c"
> +
> +SRC_URI = "git://
> gitlab.freedesktop.org/spice/linux/vd_agent.git;protocol=https;branch=master
> "
> +
> +S = "${WORKDIR}/git"
> +
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +


Inherit feature-check bbclass is needed too

>
> +inherit autotools pkgconfig
> +
> +DEPENDS = "glib-2.0 alsa-lib gtk4 dbus libdrm spice-protocol"
> +
> +EXTRA_OECONF = " \
> +       --with-gtk4 \
> +       --enable-pie \
> +"
> +
> +FILES:${PN} += "${datadir}"
> +
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104602):
> https://lists.openembedded.org/g/openembedded-devel/message/104602
> Mute This Topic: https://lists.openembedded.org/mt/100952032/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b748bd0603bfda07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Aug 25, 2023 at 1:17 AM Markus Volk &lt;<a href=3D"=
mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">The spice-vdagent needs to be running alongside qem=
u-guest-agent on<br>
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
index 0000000000..93c6de545c<br>
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
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
+</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Inherit feature=
-check bbclass is needed too=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
+inherit autotools pkgconfig<br>
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
View/Reply Online (#104602): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104602" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104602</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100952032/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100952032/1997914</a><br>
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

--000000000000b748bd0603bfda07--


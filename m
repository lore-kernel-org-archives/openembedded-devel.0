Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.15464.1611783865532068089
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 13:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V3XDliQ3;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id d2so4286330edz.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 13:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x2JMyPqTepDELK0JY6a2JirJN/JeKt3C8nHhixePXQE=;
        b=V3XDliQ390m6HI7YnwtDQvd1yxuO9l9lr9Cv3e+mxVf5rrabyuUBImemjgGe4nmr5V
         f/7qN/74JrTToFI5WpzCmKsa/YTTfd9oFgwHLLgkD3OG2bM9LwfVPDhDn6kN2b7Fpbdb
         EK8N4OR8zE6Hezcfku69huThVklnFVMovoHhwA1Tw7N87KCxsgjnZ9uGxEIkKW/mBrFn
         TtHPHTcXqcwF454dfz4WzcJbWQVjUPNHvJQ8lq3cIr3W+KHZB4AeAw2fDWqaOyIf2n4H
         gGf9SHgZZSTNjimsaIgF41r69WmYMWhNX5NqD3MQfSJO02g/FT2Kn+naMMxeHUmNcu4h
         KQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x2JMyPqTepDELK0JY6a2JirJN/JeKt3C8nHhixePXQE=;
        b=gYmG9qnVUHsmZxMJXDQ/y1mLn5dnkKxJUXS8Z4nNIMbzYLyaeOZyBwQgAgTgCkvT1d
         A4OeiCj04nWWInJZS7bTCQ9yqVYRwF8Q18sg+gFXkSQ3msLnrwMDfflCBsRWcPTBI7J1
         sFbWsNxwwD09MDgJtbwkvr6nhhmpsAkbGrWul0abvkGmxr4HbXtBbK9EXxNHnVL8VVXd
         I6e7MxOnWl0euaLCgBAmOxm6dZ44FArL+w0bqpfTBKyqJHo1dNObOvKzjB+0uL1w7Qe5
         mhhr0tHYoGl64YL8wul2qMCJzrPHbPBolNVfHweb1XiWdAodzCbBug3NOacG/8gdWF69
         +PVw==
X-Gm-Message-State: AOAM5311CSzACHFpaFIhpNEhgV4tAyTtAangJ+yA6BMTUfp5JdLRXWld
	s4SoVQhQBH7qNQ2zoHSQeH+Nc5rG0XwRzqtKV3Y=
X-Google-Smtp-Source: ABdhPJxnNEWNrStMdwfyjYq69HClUskE8bAn4qFq2vJHsIY9XIvQBGfcSYia3x3+Pv4pWhUXHtYnfYL2SXPahkJSktM=
X-Received: by 2002:a05:6402:524a:: with SMTP id t10mr11003680edd.270.1611783863892;
 Wed, 27 Jan 2021 13:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20210127211356.2341996-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20210127211356.2341996-1-alexandre.belloni@bootlin.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 27 Jan 2021 22:44:12 +0100
Message-ID: <CA+chaQfHk5R0yvPdH9xN7Uw95uzfTf-6Bjr_u1OSb7kuFyErBA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: fix native inheritance order in recipes
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a97d4e05b9e8ac09"

--000000000000a97d4e05b9e8ac09
Content-Type: text/plain; charset="UTF-8"

Thanks.

Khem already sent these changes in 2 separate patches which are already in
master-next:
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=58a4c525ac1359f91ba8e97a26eb693e6468a362
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=6d5f8cc9d444e220d212dd23a497c82a2dfce1e2

On Wed, Jan 27, 2021 at 10:14 PM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Classes native/nativesdk must be inherited last to prevent unexpected
> behaviour.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb | 2 +-
>  meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb        | 2 +-
>  .../xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/autoconf-2.13/
> autoconf-2.13-native_2.13.bb b/meta-oe/recipes-devtools/autoconf-2.13/
> autoconf-2.13-native_2.13.bb
> index a54a7331df2d..604135839a7b 100644
> --- a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
> +++ b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
> @@ -19,7 +19,7 @@ S = "${WORKDIR}/${BPN}"
>  SRC_URI[md5sum] = "9de56d4a161a723228220b0f425dc711"
>  SRC_URI[sha256sum] =
> "f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e"
>
> -inherit native texinfo
> +inherit texinfo native
>
>  DEPENDS += "m4-native gnu-config-native"
>  RDEPENDS_${PN} = "m4-native gnu-config-native"
> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
> b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
> index 4305e3b4086e..4641b0181aef 100644
> --- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
> +++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
> @@ -1,6 +1,6 @@
>  require dfu-util_${PV}.bb
>
> -inherit native deploy
> +inherit deploy native
>
>  DEPENDS = "libusb1-native"
>
> diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/
> xserver-xorg-cvt-native_1.20.10.bb
> b/meta-oe/recipes-support/xserver-xorg-cvt/
> xserver-xorg-cvt-native_1.20.10.bb
> index 170e0bf785e4..becf9914884e 100644
> --- a/meta-oe/recipes-support/xserver-xorg-cvt/
> xserver-xorg-cvt-native_1.20.10.bb
> +++ b/meta-oe/recipes-support/xserver-xorg-cvt/
> xserver-xorg-cvt-native_1.20.10.bb
> @@ -14,7 +14,7 @@ SRC_URI[sha256sum] =
> "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780
>  S = "${WORKDIR}/${XORG_PN}-${PV}"
>  B = "${WORKDIR}/build"
>
> -inherit native pkgconfig
> +inherit pkgconfig native
>
>  do_configure[noexec] = "1"
>
> --
> 2.29.2
>
>
> 
>
>

--000000000000a97d4e05b9e8ac09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks.<div><br></div><div>Khem already sent these changes=
 in 2 separate patches which are already in master-next:</div><div><a href=
=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next=
&amp;id=3D58a4c525ac1359f91ba8e97a26eb693e6468a362">https://git.openembedde=
d.org/meta-openembedded/commit/?h=3Dmaster-next&amp;id=3D58a4c525ac1359f91b=
a8e97a26eb693e6468a362</a><br></div><div><a href=3D"https://git.openembedde=
d.org/meta-openembedded/commit/?h=3Dmaster-next&amp;id=3D6d5f8cc9d444e220d2=
12dd23a497c82a2dfce1e2">https://git.openembedded.org/meta-openembedded/comm=
it/?h=3Dmaster-next&amp;id=3D6d5f8cc9d444e220d212dd23a497c82a2dfce1e2</a><b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, Jan 27, 2021 at 10:14 PM Alexandre Belloni &lt;<a href=3D"m=
ailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Classes n=
ative/nativesdk must be inherited last to prevent unexpected<br>
behaviour.<br>
<br>
Signed-off-by: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@b=
ootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/autoconf-2.13/<a href=3D"http://autoconf-2.13-n=
ative_2.13.bb" rel=3D"noreferrer" target=3D"_blank">autoconf-2.13-native_2.=
13.bb</a> | 2 +-<br>
=C2=A0meta-oe/recipes-support/dfu-util/<a href=3D"http://dfu-util-native_0=
.10.bb" rel=3D"noreferrer" target=3D"_blank">dfu-util-native_0.10.bb</a>=C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../xserver-xorg-cvt/<a href=3D"http://xserver-xorg-cvt-native_1.20.=
10.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg-cvt-native_1.20.10=
.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/autoconf-2.13/<a href=3D"http://auto=
conf-2.13-native_2.13.bb" rel=3D"noreferrer" target=3D"_blank">autoconf-2.1=
3-native_2.13.bb</a> b/meta-oe/recipes-devtools/autoconf-2.13/<a href=3D"ht=
tp://autoconf-2.13-native_2.13.bb" rel=3D"noreferrer" target=3D"_blank">aut=
oconf-2.13-native_2.13.bb</a><br>
index a54a7331df2d..604135839a7b 100644<br>
--- a/meta-oe/recipes-devtools/autoconf-2.13/<a href=3D"http://autoconf-2.=
13-native_2.13.bb" rel=3D"noreferrer" target=3D"_blank">autoconf-2.13-nativ=
e_2.13.bb</a><br>
+++ b/meta-oe/recipes-devtools/autoconf-2.13/<a href=3D"http://autoconf-2.=
13-native_2.13.bb" rel=3D"noreferrer" target=3D"_blank">autoconf-2.13-nativ=
e_2.13.bb</a><br>
@@ -19,7 +19,7 @@ S =3D &quot;${WORKDIR}/${BPN}&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;9de56d4a161a723228220b0f425dc711&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;f0611136bee505811e9ca11ca7ac188ef5323a8=
e2ef19cffd3edb3cf08fd791e&quot;<br>
<br>
-inherit native texinfo<br>
+inherit texinfo native<br>
<br>
=C2=A0DEPENDS +=3D &quot;m4-native gnu-config-native&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot;m4-native gnu-config-native&quot;<br>
diff --git a/meta-oe/recipes-support/dfu-util/<a href=3D"http://dfu-util-n=
ative_0.10.bb" rel=3D"noreferrer" target=3D"_blank">dfu-util-native_0.10.bb=
</a> b/meta-oe/recipes-support/dfu-util/<a href=3D"http://dfu-util-native_0=
.10.bb" rel=3D"noreferrer" target=3D"_blank">dfu-util-native_0.10.bb</a><br=
>
index 4305e3b4086e..4641b0181aef 100644<br>
--- a/meta-oe/recipes-support/dfu-util/<a href=3D"http://dfu-util-native_0=
.10.bb" rel=3D"noreferrer" target=3D"_blank">dfu-util-native_0.10.bb</a><br=
>
+++ b/meta-oe/recipes-support/dfu-util/<a href=3D"http://dfu-util-native_0=
.10.bb" rel=3D"noreferrer" target=3D"_blank">dfu-util-native_0.10.bb</a><br=
>
@@ -1,6 +1,6 @@<br>
=C2=A0require dfu-util_${PV}.bb<br>
<br>
-inherit native deploy<br>
+inherit deploy native<br>
<br>
=C2=A0DEPENDS =3D &quot;libusb1-native&quot;<br>
<br>
diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/<a href=3D"http://xs=
erver-xorg-cvt-native_1.20.10.bb" rel=3D"noreferrer" target=3D"_blank">xser=
ver-xorg-cvt-native_1.20.10.bb</a> b/meta-oe/recipes-support/xserver-xorg-c=
vt/<a href=3D"http://xserver-xorg-cvt-native_1.20.10.bb" rel=3D"noreferrer"=
 target=3D"_blank">xserver-xorg-cvt-native_1.20.10.bb</a><br>
index 170e0bf785e4..becf9914884e 100644<br>
--- a/meta-oe/recipes-support/xserver-xorg-cvt/<a href=3D"http://xserver-x=
org-cvt-native_1.20.10.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xor=
g-cvt-native_1.20.10.bb</a><br>
+++ b/meta-oe/recipes-support/xserver-xorg-cvt/<a href=3D"http://xserver-x=
org-cvt-native_1.20.10.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xor=
g-cvt-native_1.20.10.bb</a><br>
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] =3D &quot;977420c082450dc808de301ef56=
af4856d653eea71519a973c3490a780<br>
=C2=A0S =3D &quot;${WORKDIR}/${XORG_PN}-${PV}&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
<br>
-inherit native pkgconfig<br>
+inherit pkgconfig native<br>
<br>
=C2=A0do_configure[noexec] =3D &quot;1&quot;<br>
<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a97d4e05b9e8ac09--

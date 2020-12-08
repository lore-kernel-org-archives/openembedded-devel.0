Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web08.12146.1607448512260376376
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Dec 2020 09:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=amRgLKLP;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id n26so25685533eju.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Dec 2020 09:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A8UiMg/dyd1CsGS22JA8GdM0SuVLFeHNRSDhnUuw/CE=;
        b=amRgLKLP4n+X7GyOZ611mdezlAi+uudYlaCKSB7glwo5qThWGpmFw/Hs7VmfJ6ueXo
         SdTf6ZXL2OviZNA6BeloCIzVbsS+Gdfsdc4SGAah1tNL3Q0HBGuy2/xfapqMHF43fUU0
         ajhP9iCrziPTuE2dI5+6uUxTEb7uHC+5kUtMsOYgq0BO0IHOvFMNqlXtqiZ62UgYY2SL
         yRjZljLxJs68pjq+MUyh85UNfMkSQ7j+gTBGGAe0tZKMC+DKnRjFYzNyUWBwk5zIsSgZ
         t5qOEs9qA74QrRZpKjRmPyu1TemrTdL++taHN3/t82m1QK/xsT971fFDBda/Zn2vn+dR
         fn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A8UiMg/dyd1CsGS22JA8GdM0SuVLFeHNRSDhnUuw/CE=;
        b=ijDa7/RXdn1SNkyEbfscXnO30xJ0oYgVV5FDSLjHq9ASE/One6ZrP71qFkKinfOM3E
         6l2Wyx/N28r7xgyz77m2kk+LZYLO3MWbE+CVRmNSXevWQ25RDxB5znGeLtnOCVqvmiv1
         PdTHwMUCYCvAXHWbyhYqAiMwTHRgy6pEAA79c0Pk1JFN2QNtsxkv631Y4p1NwpFQAUvd
         oIqI2z807987KiTJp6C6idy9BFzve4WoclabFwrLrsEdkCMRNSz9474kqtxjV9GrfRYQ
         DHIxxtkhXgCv8JyczxiaOY7ffU96foAjfCbCr7PIG09pd6v9n5p5D604evctXZNPhJLA
         joBQ==
X-Gm-Message-State: AOAM530OVX98DqjnQKr28fdf5j2ZHEAT+c8wW8qJxFSR1RbQhyn0uHcK
	d3zV/8stVd1+qqKt3I5dR9/AimPw+w/5pExiDbY=
X-Google-Smtp-Source: ABdhPJz4Im/b4FDgAX5WgR0HmYt5JsFyCEpfrD3jR+uOpZFpFhY1i7sm6vTX+70hDcUVSnuICAxk1Ds0OfnL2/J9qlk=
X-Received: by 2002:a17:906:7e43:: with SMTP id z3mr23911268ejr.67.1607448510617;
 Tue, 08 Dec 2020 09:28:30 -0800 (PST)
MIME-Version: 1.0
References: <1607447060-235494-1-git-send-email-r.karszniewicz@phytec.de>
In-Reply-To: <1607447060-235494-1-git-send-email-r.karszniewicz@phytec.de>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 8 Dec 2020 17:28:18 +0000
Message-ID: <CANPvuR=BTuOVExv62GCNpFGagz9nxo_znNg=GrMxTZbFbJgXgg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] firmwared: add recipe
To: Robert Karszniewicz <r.karszniewicz@phytec.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000785e7a05b5f745ca"

--000000000000785e7a05b5f745ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A ter=C3=A7a, 8/12/2020, 17:04, Robert Karszniewicz <r.karszniewicz@phytec.=
de>
escreveu:

> This program is needed for loading external firmware via Linux' fallback
> mechanism.
>
> Signed-off-by: Robert Karszniewicz <r.karszniewicz@phytec.de>
> ---
> Changes from v1:
> - remove PR setting
> - set PV to 0, not 1
> - inherit features_check and require systemd
> - use ${systemd_system_unitdir} instead of ${systemd_unitdir}/system
> - add firmwared to packagegroup-meta-oe
> - add do_configure_prepend() (I had made a mistake in testing earlier)
>
> Thank you all for your reviews earlier.
>
>  .../firmwared/firmwared/firmwared.service          |  9 ++++++
>  meta-oe/recipes-bsp/firmwared/firmwared_git.bb     | 34
> ++++++++++++++++++++++
>  .../packagegroups/packagegroup-meta-oe.bb          |  1 +
>  3 files changed, 44 insertions(+)
>  create mode 100644
> meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
>  create mode 100644 meta-oe/recipes-bsp/firmwared/firmwared_git.bb
>
> diff --git a/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
> b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
> new file mode 100644
> index 000000000000..c2106a25168c
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=3DLinux Firmware Loader Daemon
> +
> +[Service]
> +Type=3Dsimple
> +ExecStart=3D@BINDIR@/firmwared -d /lib/firmware
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> new file mode 100644
> index 000000000000..74341d80d38d
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "Linux Firmware Loader Daemon"
> +DESCRIPTION =3D "The Linux Firmware Loader Daemon monitors the kernel f=
or \
> +firmware requests and uploads the firmware blobs it has via the sysfs \
> +interface."
> +HOMEPAGE =3D "https://github.com/teg/firmwared"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE-APACHE;md5=3D7b486c2338d225a1405d979ed2c15ce8 \
> +                    file://COPYING;md5=3Ddaa868b8e1ae17d03228a1145b4060=
da"
> +
> +SRC_URI =3D "git://github.com/teg/firmwared.git \
> +           file://firmwared.service"
> +
> +PV =3D "0+git${SRCPV}"
> +SRCREV =3D "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS =3D "glib-2.0 systemd"
> +
> +inherit pkgconfig autotools systemd features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "systemd"
> +
> +SYSTEMD_SERVICE_${PN} =3D "firmwared.service"
> +
> +do_configure_prepend() {
> +    ${S}/autogen.sh
> +}
> +
> +do_install_append() {
> +    install -d ${D}${systemd_unitdir}/system


> systemd_system_unitdir can be used here


> +    install -m 0644 ${WORKDIR}/firmwared.service
> ${D}${systemd_system_unitdir}
> +    sed -i -e 's,@BINDIR@,${bindir},g'
> ${D}${systemd_unitdir}/system/firmwared.service
>

systemd_system_unitdir can be used here

+}
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 841e1cd1b3ab..2c46d21b705f 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -87,6 +87,7 @@ RDEPENDS_packagegroup-meta-oe-bsp =3D"\
>      acpitool \
>      cpufrequtils \
>      edac-utils \
> +    firmwared \
>      flashrom \
>      irda-utils \
>      lmsensors-config-cgi \
> --
> 2.7.4
>
>
>=20
>
>

--000000000000785e7a05b5f745ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">A ter=C3=A7a, 8/12/2020, 17:04, Robert Karszniewicz &l=
t;<a href=3D"mailto:r.karszniewicz@phytec.de">r.karszniewicz@phytec.de</a>&=
gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This program is neede=
d for loading external firmware via Linux&#39; fallback<br>
mechanism.<br>
<br>
Signed-off-by: Robert Karszniewicz &lt;<a href=3D"mailto:r.karszniewicz@ph=
ytec.de" target=3D"_blank" rel=3D"noreferrer">r.karszniewicz@phytec.de</a>&=
gt;<br>
---<br>
Changes from v1:<br>
- remove PR setting<br>
- set PV to 0, not 1<br>
- inherit features_check and require systemd<br>
- use ${systemd_system_unitdir} instead of ${systemd_unitdir}/system<br>
- add firmwared to packagegroup-meta-oe<br>
- add do_configure_prepend() (I had made a mistake in testing earlier)<br>
<br>
Thank you all for your reviews earlier.<br>
<br>
=C2=A0.../firmwared/firmwared/firmwared.service=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 9 ++++++<br>
=C2=A0meta-oe/recipes-bsp/firmwared/<a href=3D"http://firmwared_git.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">firmwared_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0| 34 ++++++++++++++++++++++<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-oe.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A03 files changed, 44 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/firmwared/firmwared/firmwared=
.service<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/firmwared/<a href=3D"http://f=
irmwared_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">firmwared_=
git.bb</a><br>
<br>
diff --git a/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service b/m=
eta-oe/recipes-bsp/firmwared/firmwared/firmwared.service<br>
new file mode 100644<br>
index 000000000000..c2106a25168c<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service<br>
@@ -0,0 +1,9 @@<br>
+[Unit]<br>
+Description=3DLinux Firmware Loader Daemon<br>
+<br>
+[Service]<br>
+Type=3Dsimple<br>
+ExecStart=3D@BINDIR@/firmwared -d /lib/firmware<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/meta-oe/recipes-bsp/firmwared/<a href=3D"http://firmwared_git=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">firmwared_git.bb</a> b=
/meta-oe/recipes-bsp/firmwared/<a href=3D"http://firmwared_git.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">firmwared_git.bb</a><br>
new file mode 100644<br>
index 000000000000..74341d80d38d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/firmwared/<a href=3D"http://firmwared_git.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">firmwared_git.bb</a><br>
@@ -0,0 +1,34 @@<br>
+SUMMARY =3D &quot;Linux Firmware Loader Daemon&quot;<br>
+DESCRIPTION =3D &quot;The Linux Firmware Loader Daemon monitors the kerne=
l for \<br>
+firmware requests and uploads the firmware blobs it has via the sysfs \<b=
r>
+interface.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/teg/firmwared" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://github.com/teg/firmwared</a>=
&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE-APACHE;md5=3D7b486c2338d225a140=
5d979ed2c15ce8 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://COPYING;md5=3Ddaa868b8e1ae17d03228a1145b4060da&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/teg/firmwared.git" r=
el=3D"noreferrer noreferrer" target=3D"_blank">github.com/teg/firmwared.git=
</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://firmwared.service&quot;<b=
r>
+<br>
+PV =3D &quot;0+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+DEPENDS =3D &quot;glib-2.0 systemd&quot;<br>
+<br>
+inherit pkgconfig autotools systemd features_check<br>
+<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
+<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;firmwared.service&quot;<br>
+<br>
+do_configure_prepend() {<br>
+=C2=A0 =C2=A0 ${S}/autogen.sh<br>
+}<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system</blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br></blockquote></div></div><div dir=3D"auto"><sp=
an style=3D"font-family:sans-serif">systemd_system_unitdir can be used here=
</span><br></div><div dir=3D"auto"><span style=3D"font-family:sans-serif"><=
br></span></div><div dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/firmwared.service ${D}${systemd_=
system_unitdir}<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s,@BINDIR@,${bindir},g&#39; ${D}${systemd_un=
itdir}/system/firmwared.service<br></blockquote></div></div><div dir=3D"aut=
o"><span style=3D"font-family:sans-serif"><br></span></div><div dir=3D"auto=
"><span style=3D"font-family:sans-serif">systemd_system_unitdir can be used=
 here</span><br></div><div dir=3D"auto"><span style=3D"font-family:sans-ser=
if"><br></span></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
+}<br>
diff --git a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packageg=
roup-meta-oe.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packagegro=
up-meta-oe.bb</a> b/meta-oe/recipes-core/packagegroups/<a href=3D"http://pa=
ckagegroup-meta-oe.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pack=
agegroup-meta-oe.bb</a><br>
index 841e1cd1b3ab..2c46d21b705f 100644<br>
--- a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-me=
ta-oe.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packagegroup-meta=
-oe.bb</a><br>
+++ b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-me=
ta-oe.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packagegroup-meta=
-oe.bb</a><br>
@@ -87,6 +87,7 @@ RDEPENDS_packagegroup-meta-oe-bsp =3D&quot;\<br>
=C2=A0 =C2=A0 =C2=A0acpitool \<br>
=C2=A0 =C2=A0 =C2=A0cpufrequtils \<br>
=C2=A0 =C2=A0 =C2=A0edac-utils \<br>
+=C2=A0 =C2=A0 firmwared \<br>
=C2=A0 =C2=A0 =C2=A0flashrom \<br>
=C2=A0 =C2=A0 =C2=A0irda-utils \<br>
=C2=A0 =C2=A0 =C2=A0lmsensors-config-cgi \<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000785e7a05b5f745ca--

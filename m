Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.3601.1609844310357011146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 02:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ttf2xoOp;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id w1so40611758ejf.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Jan 2021 02:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5aVdByuvJN8AL6a5YXYSaNXZxfA9PDu7QATE6qtvZMY=;
        b=Ttf2xoOpy4sADl+BvXB6RsW+47jgFPsckvHXvgJTq5IIgmnfzfVuExpQlPk3+FvnkA
         lNlA9rQtcJyvnEHFotSyxTfemDjWSk4SM96WmRi96cqhYFdKsJIHaZc6FNSbhbPUUq40
         Leqo9WOt5otaVpgjGh3QxusaKAUIhd9vDqygjT0Pt0of4FZjlqyZzdjU22ZO0zplfC/Z
         iZw41ipzaNeHFpFktde/HuhBUQ1j8nqmSajs8ZckSF05IDQMAV/zGEPqbEdrnFPCxsvG
         oSLxTbTvEtxZJgZstVqG3AgndcbgOGrrIkMtbIkh8I6fsCMhHO3emqS+2qMBhKO/D2p0
         KJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5aVdByuvJN8AL6a5YXYSaNXZxfA9PDu7QATE6qtvZMY=;
        b=njGvFl5mDCOQfCzzJYdFQNYJwgymD84RKWrQZ8HO6ALfamevfHwc/WO1rvNaB7w3YZ
         8qNOshsvIlmQJf82I0VADADRF9pcriNAGrWrwXQd1bXmx9CazBGLgMDs91l8iG+LGFzD
         2gRGHCvT7xsOyZNO3w13n6F7cJzRGeWfMsFM1ZX8ooXBdt+nLFuzGVT5T8H7OaTPe9WC
         F3fwobOp5QNUl9+ktnH24KXOYwb1GIUefiyLxhwNAVS8lcKvwf4bNlnpyH6FKxE36D7A
         u1wfW4Pe6n8EXIF1IMKUPfSopueF59M3zJcCTXAusGpzIypjQBq6LJPO5fY6qtgTLy9E
         cpuw==
X-Gm-Message-State: AOAM530wrny4OziggtSK7sWrRBbgk6Zar7NWOx2Yzei+8J6l52Hvw+Ls
	LcGAkJNTMY+Nb7yl0wQD56Abz7KHs7MNv4LQqiE=
X-Google-Smtp-Source: ABdhPJxDAVzi/A+shJG67N4PkCuqXpJS56rM8rmomEep7uqTOeFbSHxsdsmyO9Bj1uSxTUgj0+E56E36Oj1uWOralio=
X-Received: by 2002:a17:906:49c2:: with SMTP id w2mr21721852ejv.12.1609844308813;
 Tue, 05 Jan 2021 02:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20201231090331.223784-1-yi.zhao@windriver.com> <20201231090331.223784-2-yi.zhao@windriver.com>
In-Reply-To: <20201231090331.223784-2-yi.zhao@windriver.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 5 Jan 2021 10:58:17 +0000
Message-ID: <CANPvuRm7giL_om_Pdhus8Qe5teOSKmJgDxcEu8qoyGusqX55uA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/3] etbales: remove upstream ebtables-legacy-save
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002ba90805b8251679"

--0000000000002ba90805b8251679
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Fix typo in commit message:

-[oe] [meta-networking][PATCH 2/3] etbales: remove upstream
ebtables-legacy-save
+[oe] [meta-networking][PATCH 2/3] ebtables: remove upstream
ebtables-legacy-save


Yi Zhao <yi.zhao@windriver.com> escreveu no dia quinta, 31/12/2020 =C3=A0(=
s)
09:03:

> Remove the upstream ebtables-legacy-save before we install the local
> ones. And install it to ${sbindir} rather than ${base_sbindir}.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../ebtables/ebtables-2.0.11/ebtables-legacy-save           | 2 +-
>  meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb  | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  mode change 100755 =3D> 100644
> meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legacy-=
save
>
> diff --git
> a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legac=
y-save
> b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legac=
y-save
> old mode 100755
> new mode 100644
> index 2d7fc4ed7..2133600f7
> ---
> a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legac=
y-save
> +++
> b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-legac=
y-save
> @@ -1,6 +1,6 @@
>  #!/bin/bash
>
> -EBTABLES=3D"/sbin/ebtables"
> +EBTABLES=3D"/usr/sbin/ebtables-legacy"
>
>  [ -x "$EBTABLES" ] || exit 1
>
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
> b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
> index 08d4d661d..be21c372d 100644
> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
> @@ -28,11 +28,11 @@ do_install_append () {
>         #This file has been provided by netbase
>         rm -f ${D}${sysconfdir}/ethertypes
>
> -       install -d ${D}${base_sbindir}
>         # Replace upstream ebtables-save perl script with Fedora bash
> based rewrite
>         #
> http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-save
> -       install -m 0755 ${WORKDIR}/ebtables-legacy-save
> ${D}${base_sbindir}/ebtables-legacy-save
> -       sed -i 's!/sbin/!${base_sbindir}/!g'
> ${D}${base_sbindir}/ebtables-legacy-save
> +       rm -f ${D}${sbindir}/ebtables-legacy-save
> +       install -m 0755 ${WORKDIR}/ebtables-legacy-save
> ${D}${sbindir}/ebtables-legacy-save
> +
>         # Install systemd service files
>         if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
>                 install -d ${D}${systemd_unitdir}/system
> --
> 2.25.1
>
>
>=20
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--0000000000002ba90805b8251679
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(0,0,0)"></span><div>Hi,</div><div=
><br></div><div>Fix typo in commit message:</div><div><br></div><div>-[oe] =
[meta-networking][PATCH 2/3] etbales: remove upstream ebtables-legacy-save<=
/div><div><div>+[oe] [meta-networking][PATCH 2/3] ebtables: remove upstream=
 ebtables-legacy-save</div><div></div><div><span id=3D"gmail-:oj" class=3D"=
gmail-J-J5-Ji" style=3D"display:inline-flex;min-height:28px;vertical-align:=
bottom;font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:=
22px"><div class=3D"gmail-pG" id=3D"gmail-:om" style=3D"font-size:0px;paddi=
ng:0px;width:20px;height:20px;display:inline-block;margin:0px 8px 0px 0px">=
<br class=3D"gmail-Apple-interchange-newline"></div></span></div></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Yi Z=
hao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao@windriver.com</a>&=
gt; escreveu no dia quinta, 31/12/2020 =C3=A0(s) 09:03:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Remove the upstream ebtables-legacy=
-save before we install the local<br>
ones. And install it to ${sbindir} rather than ${base_sbindir}.<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../ebtables/ebtables-2.0.11/ebtables-legacy-save=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-networking/recipes-filter/ebtables/<a href=3D"http://ebtables_2=
.0.11.bb" rel=3D"noreferrer" target=3D"_blank">ebtables_2.0.11.bb</a>=C2=A0=
 | 6 +++---<br>
=C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
=C2=A0mode change 100755 =3D&gt; 100644 meta-networking/recipes-filter/ebt=
ables/ebtables-2.0.11/ebtables-legacy-save<br>
<br>
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtab=
les-legacy-save b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/e=
btables-legacy-save<br>
old mode 100755<br>
new mode 100644<br>
index 2d7fc4ed7..2133600f7<br>
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-leg=
acy-save<br>
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-leg=
acy-save<br>
@@ -1,6 +1,6 @@<br>
=C2=A0#!/bin/bash<br>
<br>
-EBTABLES=3D&quot;/sbin/ebtables&quot;<br>
+EBTABLES=3D&quot;/usr/sbin/ebtables-legacy&quot;<br>
<br>
=C2=A0[ -x &quot;$EBTABLES&quot; ] || exit 1<br>
<br>
diff --git a/meta-networking/recipes-filter/ebtables/<a href=3D"http://ebt=
ables_2.0.11.bb" rel=3D"noreferrer" target=3D"_blank">ebtables_2.0.11.bb</a=
> b/meta-networking/recipes-filter/ebtables/<a href=3D"http://ebtables_2.0.=
11.bb" rel=3D"noreferrer" target=3D"_blank">ebtables_2.0.11.bb</a><br>
index 08d4d661d..be21c372d 100644<br>
--- a/meta-networking/recipes-filter/ebtables/<a href=3D"http://ebtables_2=
.0.11.bb" rel=3D"noreferrer" target=3D"_blank">ebtables_2.0.11.bb</a><br>
+++ b/meta-networking/recipes-filter/ebtables/<a href=3D"http://ebtables_2=
.0.11.bb" rel=3D"noreferrer" target=3D"_blank">ebtables_2.0.11.bb</a><br>
@@ -28,11 +28,11 @@ do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #This file has been provided by netbase<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${sysconfdir}/ethertypes<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${base_sbindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Replace upstream ebtables-save perl script w=
ith Fedora bash based rewrite<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # <a href=3D"http://pkgs.fedoraproject.org/cgi=
t/rpms/ebtables.git/tree/ebtables-save" rel=3D"noreferrer" target=3D"_blank=
">http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-save</=
a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/ebtables-legacy-sav=
e ${D}${base_sbindir}/ebtables-legacy-save<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s!/sbin/!${base_sbindir}/!g&#39; $=
{D}${base_sbindir}/ebtables-legacy-save<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${sbindir}/ebtables-legacy-save<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/ebtables-legacy-sav=
e ${D}${sbindir}/ebtables-legacy-save<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Install systemd service files<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;, &#39;systemd&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${s=
ystemd_unitdir}/system<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Qua=
resma</div></div>

--0000000000002ba90805b8251679--

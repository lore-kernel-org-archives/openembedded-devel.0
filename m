Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7F0C021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 08:28:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.16868.1739521712968927201
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 00:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R3maBpvF;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f2c4382d1so250011f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 00:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739521711; x=1740126511; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uvdGQYJn+DOILTsQ5Mdqm8blSA43Y3vpeK2gEh2RARg=;
        b=R3maBpvFauVtQBb1k0WNYZDsB/5VpkxxV4UBdmwnuWKlba6wvF80uhEOOn1toWoe+d
         CY6YABM8Km1+03GiIE1eLpvuVZNfY4jQex//pubtFqvs3GkBI9AjsiI12DRS8vfH3dwR
         0PngJ9BWLm5BVljGoG/+P/xngnGvUG1nzUUZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739521711; x=1740126511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvdGQYJn+DOILTsQ5Mdqm8blSA43Y3vpeK2gEh2RARg=;
        b=uw+1uHlLuPK12g1y324hiX+pilcaZqUUlKrhHUkwzVcj5R/JvIufmaO3PBZ8vjKwjt
         y9ZX2AfBj01i/IcpIZVFhpPRoP83S6LJFoue6tbq0a6zSSWlVnHZMRBQNPYsscxLpGsb
         Ddjfofrjg+Hb9+5Dg998g+XCMEwBdeHUByB2r4y1EqW/6i8N+oK14d+/XdsZqRJXOwQo
         XAEnfhMTsNr4h+eJHx33UqShgPpJ9jYzqaBI4LTb8UWObXFnjCbTZXBDe2lO627bbnDM
         IsXCqQ9mtetRjlzTa+B/PpjsDJnXB7xhsZFnZ+2NJmRIJxjQfyquCvZ2AlGHs0IHNGoq
         2ikw==
X-Gm-Message-State: AOJu0YzoVkqHpP7SVrigjNqWhmhUnxMRKjmSm1GjkD7AIMUVq4y/ZeQc
	e+Bn4J5DedBmMwsln7t7jeq81x13WW1QFHJM4FXCnsiWI/hHHeZCL6NQjfYK4yRSIZB9WqhY+1I
	l6128VJSx2FPLSm5DiiubwEiuP9g9qVgJNzOxEjG+EPtsYkDB
X-Gm-Gg: ASbGncslhB9SvuP/VKTLuAbz0EolKhhqIwLZhD/VWM+N0a5SGGLp+0elMMdxNR+Tyep
	XKkilb7/i5NrlwWWupRFdNig9H2G0/rGD6Za7qUpcXtxCSq1yE2G7kch6x4+6JwP7Oh63ctzOC6
	jlr67RGdjUKYsxb/GkscmPK4Y/NBh8
X-Google-Smtp-Source: AGHT+IFJSMgCqd3qdReUpiRDynhNvYnYEVxw5uKqJT01o3pyrfZocKqoYkklZSIkExTjzTjk+kvCjQ9/CNcaAEajLm4=
X-Received: by 2002:a05:6000:41e8:b0:38d:d533:d9a2 with SMTP id
 ffacd0b85a97d-38f24d1012emr8186723f8f.13.1739521711363; Fri, 14 Feb 2025
 00:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20250213233333.129530-1-gavrosc.ref@yahoo.com> <20250213233333.129530-1-gavrosc@yahoo.com>
In-Reply-To: <20250213233333.129530-1-gavrosc@yahoo.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 14 Feb 2025 09:28:05 +0100
X-Gm-Features: AWEUYZkth6wZ7ZTb6q1OhgGkhA7ZnbD-Fx1Q12t1_v5vsVNSxRyHJuxjy0aye8g
Message-ID: <CAMSfU+413shmiBy9cc1yep+JMfFdkLKm_xhbfuZJ0METTGkPMg@mail.gmail.com>
Subject: Re: [meta-networking][PATCH v2] corosync: reproducibility issue
To: Christos Gavros <gavrosc@yahoo.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000af67b4062e15f5e0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 08:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115477

--000000000000af67b4062e15f5e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 14 f=C3=A9vr. 2025 =C3=A0 00:34, Christos Gavros <gavrosc@yahoo.com=
> a =C3=A9crit :

> Corosync is not reproducible due to change of value
> in NETSNMP_SYS_CONTACT which is set in net-snmp:
> NETSNMP_SYS_CONTACT =3D "$ME@$LOC"
> $ME =3D whoami
> $LOC assigned domain name from /etc/resolv.conf
>
> Use build in'--with-sys-contact' to overwrite it
>
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/30/ste=
ps/28/logs/stdio
>
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
> v1->v2
> * make NETSNMP_SYS_CONTACT configurable for every DISTRO
> ---
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 3 +++
>

Hello Christos,

Thanks for the patch, nice work :)

The title should say "net-snmp: ..." instead (and the commit message
explain that you do that to fix corosync reproducibility issue)

There is something weird going on: By tracking the reproducibility issue
from corosync, we ended up in net-snmp. But net-snmp did not fail the
reproducibility test!
No need to debug this further, your patch is valid as-is, I just wanted to
point out this weirdness.

Thanks!


>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> index d4945e482d..0840e4955b 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> @@ -55,6 +55,8 @@ PACKAGECONFIG[perl] =3D "--enable-embedded-perl
> --with-perl-modules=3Dyes, --disable
>  PACKAGECONFIG[smux] =3D ""
>  PACKAGECONFIG[systemd] =3D "--with-systemd, --without-systemd"
>
> +SYSCONTACT_DISTRO ?=3D "no-contact-set@example.com"
> +
>  EXTRA_OECONF =3D " \
>      --enable-shared \
>      --disable-manuals \
> @@ -63,6 +65,7 @@ EXTRA_OECONF =3D " \
>      --with-persistent-directory=3D${localstatedir}/lib/net-snmp \
>      --with-endianness=3D${@oe.utils.conditional('SITEINFO_ENDIANNESS',
> 'le', 'little', 'big', d)} \
>      --with-mib-modules=3D'${MIB_MODULES}' \
> +    --with-sys-contact=3D'${SYSCONTACT_DISTRO}' \
>  "
>
>  MIB_MODULES =3D ""
> --
> 2.34.1
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000af67b4062e15f5e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0ven. 14 f=C3=A9vr. 2025 =C3=A0=C2=
=A000:34, Christos Gavros &lt;<a href=3D"mailto:gavrosc@yahoo.com">gavrosc@=
yahoo.com</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote gmail_=
quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Corosync=
 is not reproducible due to change of value<br>
in NETSNMP_SYS_CONTACT which is set in net-snmp:<br>
NETSNMP_SYS_CONTACT =3D &quot;$ME@$LOC&quot;<br>
$ME =3D whoami<br>
$LOC assigned domain name from /etc/resolv.conf<br>
<br>
Use build in&#39;--with-sys-contact&#39; to overwrite it<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/buil=
ds/30/steps/28/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/valkyrie/#/builders/87/builds/30/steps/28/logs/st=
dio</a><br>
<br>
CC: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_bl=
ank">yoann.congal@smile.fr</a>&gt;<br>
CC: Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com" target=
=3D"_blank">randy.macleod@windriver.com</a>&gt;<br>
Signed-off-by: Christos Gavros &lt;<a href=3D"mailto:gavrosc@yahoo.com" tar=
get=3D"_blank">gavrosc@yahoo.com</a>&gt;<br>
---<br>
v1-&gt;v2<br>
* make NETSNMP_SYS_CONTACT configurable for every DISTRO<br>
---<br>
=C2=A0meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp=
_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb</a> | 3 +=
++<br></blockquote><div><br></div><div>Hello Christos,</div><div><br></div>=
<div>Thanks for the patch, nice work :)</div><div><br></div><div>The title =
should say &quot;net-snmp: ...&quot; instead (and the commit message explai=
n that you do that to fix corosync reproducibility issue)</div><div><br></d=
iv><div>There is something weird going on: By tracking the reproducibility =
issue from corosync, we ended up in net-snmp. But net-snmp did not fail the=
 reproducibility test!</div><div>No need to debug this further, your patch =
is valid as-is, I just wanted to point out this weirdness.</div><div><br></=
div><div>Thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://n=
et-snmp_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb</a=
> b/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp_5=
.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb</a><br>
index d4945e482d..0840e4955b 100644<br>
--- a/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp=
_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb</a><br>
+++ b/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp=
_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb</a><br>
@@ -55,6 +55,8 @@ PACKAGECONFIG[perl] =3D &quot;--enable-embedded-perl --wi=
th-perl-modules=3Dyes, --disable<br>
=C2=A0PACKAGECONFIG[smux] =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;--with-systemd, --without-systemd&qu=
ot;<br>
<br>
+SYSCONTACT_DISTRO ?=3D &quot;<a href=3D"mailto:no-contact-set@example.com"=
 target=3D"_blank">no-contact-set@example.com</a>&quot;<br>
+<br>
=C2=A0EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--enable-shared \<br>
=C2=A0 =C2=A0 =C2=A0--disable-manuals \<br>
@@ -63,6 +65,7 @@ EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--with-persistent-directory=3D${localstatedir}/lib/net-=
snmp \<br>
=C2=A0 =C2=A0 =C2=A0--with-endianness=3D${@oe.utils.conditional(&#39;SITEIN=
FO_ENDIANNESS&#39;, &#39;le&#39;, &#39;little&#39;, &#39;big&#39;, d)} \<br=
>
=C2=A0 =C2=A0 =C2=A0--with-mib-modules=3D&#39;${MIB_MODULES}&#39; \<br>
+=C2=A0 =C2=A0 --with-sys-contact=3D&#39;${SYSCONTACT_DISTRO}&#39; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0MIB_MODULES =3D &quot;&quot;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--000000000000af67b4062e15f5e0--


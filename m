Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBB3C46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 16:05:20 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.16963.1703001917232245771
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 08:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NYP/DMtf;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b9f727d94cso1681775b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 08:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703001916; x=1703606716; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rf9PeCbx5BS//baZzxWLVrxz/90lZZwxpXYBgYKbZJU=;
        b=NYP/DMtfnV28Vv3FIJYK8Z1poBfwlI6NfMVpuA90BTUhSKuaXIIESuRtcRoZ1NLKod
         ght8xCQ7W5W9pvqVXYLxB4R7vmR1i7sT01ZSX3t9uYJsQnxmaj80VyhzE5dyDQ0S4cJf
         JKfAuklDkPf/lmEyWO9J78ggC2t800MdAW0boxok8nlaN9rhjy5uFatN/Wa8NADqvjQH
         WlFRhtv8bweuKqPe9VavSzinWzTwI/0P9FonK7W4K9PVqf1AIKwC+ECb6MW6zzHq34HG
         XOYDlowF4nHZ7aprbp8LvqJ28KhM4K3khHDpc3wNznCYxXx2GkpkrMJ/rB6mnUiFbGq7
         M8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703001916; x=1703606716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rf9PeCbx5BS//baZzxWLVrxz/90lZZwxpXYBgYKbZJU=;
        b=dRUoO2mKHq2QFDn1hAe3gov35T+hz6w3YWn9UsPYUv/yj0w8GPIXZRRyPA5lNSawTo
         QvO5ssSxWUV1FZnmiRH98U3uE3WpTnPWKo5ugWJV7yhnnfHk/i8eBObyxVX5FtkPufy8
         iuzNpK6040U3inDVQ6+STGphmN9FUD8b/yhTbCggF5mZmCPBOft4jToGwfKFI0ovDSpj
         jj4AD9EE5hTbmNnuwqxygvoaMa5sS22LFXd29rKQN0LY6PQmqzbH3ZFxOWVEtvNfS1dF
         dfQjhTJgai/oAc6YPbbILiCkZmID6VTMswjlm5CC+cFoLABvg6RtK5D3oAUF2wjKzBn2
         E4LA==
X-Gm-Message-State: AOJu0YwQQcB9eDuB/O/Eb74zJJQRBIP5Lj6HfIjmPqEUoMGM5eE9VH3n
	VsydHwoH8u1jMspnr9FsGbdQUxH4KSg62BOm9LsKr3+rYUOKVg==
X-Google-Smtp-Source: AGHT+IGqq6Y3ECsFke1uXjdkPk8xcCTV47kY3sDHISDZeODRN4Z8z3gyNriYWgHiwxqu9LRo/VRzj1dGcZ7gM3B5REE=
X-Received: by 2002:a05:6808:11c3:b0:3b8:b063:8954 with SMTP id
 p3-20020a05680811c300b003b8b0638954mr12064148oiv.98.1703001916463; Tue, 19
 Dec 2023 08:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20231219155119.3859157-1-niko.mauno@vaisala.com>
In-Reply-To: <20231219155119.3859157-1-niko.mauno@vaisala.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 19 Dec 2023 16:05:05 +0000
Message-ID: <CANPvuR=x0pi8KNgk1cmVX=W6ffAAh=522iSNRUGqhFD=CYXa_Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pkcs11-provider: Add recipe
To: niko.mauno@vaisala.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000485ff9060cdf08af"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 16:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107637

--000000000000485ff9060cdf08af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Niko Mauno via lists.openembedded.org <niko.mauno=3D
vaisala.com@lists.openembedded.org> escreveu no dia ter=C3=A7a, 19/12/2023 =
=C3=A0(s)
15:51:

> From: Niko Mauno <niko.mauno@vaisala.com>
>
> Starting with version 3.0 the OpenSSL project introduced a new modular
> system to extend OpenSSL that replaces the deprecated Engine modules.
>
> Providers are loaded via configuration directives in the openssl
> configuration file (or directly loaded by applications).
>
> The pkcs11 provider allows applications linked to openssl to use keys
> and cryptographic operations from a hardware or software token via
> their PKCS #11 driver and the use of PCKS #11 URIs.
>
> The pkcs11 provider can be configured to be automatically loaded via
> openssl.cnf
>
> For more details, visit
>
> https://github.com/latchset/pkcs11-provider/blob/main/docs/provider-pkcs1=
1.7.md
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  .../pkcs11-provider/pkcs11-provider_git.bb    | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pkcs11-provider/
> pkcs11-provider_git.bb
>
> diff --git a/meta-oe/recipes-support/pkcs11-provider/
> pkcs11-provider_git.bb b/meta-oe/recipes-support/pkcs11-provider/
> pkcs11-provider_git.bb
> new file mode 100644
> index 000000000..12c0f5fae
> --- /dev/null
> +++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "An OpenSSL provider that allows direct interfacing with pkc=
s11
> drivers"
> +DESCRIPTION =3D "\
> +This is an Openssl 3.x provider to access Hardware or Software Tokens
> using \
> +the PKCS#11 Cryptographic Token Interface\
> +\
> +This code targets version 3.1 of the interface but should be backwards \
> +compatible to previous versions as well.\
> +"
> +HOMEPAGE =3D "https://github.com/latchset/pkcs11-provider"
> +SECTION =3D "libs"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db53b787444a60266932bd270d1cf2=
d45"
> +DEPENDS =3D "\
> +    autoconf-archive \
> +    openssl \
> +    p11-kit \
> +"
> +
> +SRCREV =3D "e2abc4a7ae33159f2fb21b9d87a05ea9e79ef584"
> +PV =3D "0.2+gitr${SRCPV}"
> +PKGV =3D "0.2+gitr${GITPKGV}"
> +
> +SRC_URI =3D "git://
> github.com/latchset/${BPN}.git;branch=3Dmain;protocol=3Dhttps
> <http://github.com/latchset/$%7BBPN%7D.git;branch=3Dmain;protocol=3Dhttps=
>"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools gitpkgv pkgconfig
>

Hi Niko,

Can the gitpkgv be removed and used with a bbappend on a custom layer?
This is not strictly necessary for the package and looks more aligned with
the product.

Jose


> +
> +FILES:${PN} +=3D "${libdir}/ossl-modules/pkcs11.so"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107634):
> https://lists.openembedded.org/g/openembedded-devel/message/107634
> Mute This Topic: https://lists.openembedded.org/mt/103264418/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000485ff9060cdf08af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Niko Mauno via <a href=3D"http://list=
s.openembedded.org">lists.openembedded.org</a> &lt;niko.mauno=3D<a href=3D"=
mailto:vaisala.com@lists.openembedded.org">vaisala.com@lists.openembedded.o=
rg</a>&gt; escreveu no dia ter=C3=A7a, 19/12/2023 =C3=A0(s) 15:51:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Niko Mauno &lt;<a =
href=3D"mailto:niko.mauno@vaisala.com" target=3D"_blank">niko.mauno@vaisala=
.com</a>&gt;<br>
<br>
Starting with version 3.0 the OpenSSL project introduced a new modular<br>
system to extend OpenSSL that replaces the deprecated Engine modules.<br>
<br>
Providers are loaded via configuration directives in the openssl<br>
configuration file (or directly loaded by applications).<br>
<br>
The pkcs11 provider allows applications linked to openssl to use keys<br>
and cryptographic operations from a hardware or software token via<br>
their PKCS #11 driver and the use of PCKS #11 URIs.<br>
<br>
The pkcs11 provider can be configured to be automatically loaded via<br>
openssl.cnf<br>
<br>
For more details, visit<br>
<a href=3D"https://github.com/latchset/pkcs11-provider/blob/main/docs/provi=
der-pkcs11.7.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/la=
tchset/pkcs11-provider/blob/main/docs/provider-pkcs11.7.md</a><br>
<br>
Signed-off-by: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com" tar=
get=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
---<br>
=C2=A0.../pkcs11-provider/<a href=3D"http://pkcs11-provider_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pkcs11-provider_git.bb</a>=C2=A0 =C2=A0 | 29 =
+++++++++++++++++++<br>
=C2=A01 file changed, 29 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/pkcs11-provider/<a href=3D=
"http://pkcs11-provider_git.bb" rel=3D"noreferrer" target=3D"_blank">pkcs11=
-provider_git.bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/pkcs11-provider/<a href=3D"http://pkcs=
11-provider_git.bb" rel=3D"noreferrer" target=3D"_blank">pkcs11-provider_gi=
t.bb</a> b/meta-oe/recipes-support/pkcs11-provider/<a href=3D"http://pkcs11=
-provider_git.bb" rel=3D"noreferrer" target=3D"_blank">pkcs11-provider_git.=
bb</a><br>
new file mode 100644<br>
index 000000000..12c0f5fae<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/pkcs11-provider/<a href=3D"http://pkcs11-prov=
ider_git.bb" rel=3D"noreferrer" target=3D"_blank">pkcs11-provider_git.bb</a=
><br>
@@ -0,0 +1,29 @@<br>
+SUMMARY =3D &quot;An OpenSSL provider that allows direct interfacing with =
pkcs11 drivers&quot;<br>
+DESCRIPTION =3D &quot;\<br>
+This is an Openssl 3.x provider to access Hardware or Software Tokens usin=
g \<br>
+the PKCS#11 Cryptographic Token Interface\<br>
+\<br>
+This code targets version 3.1 of the interface but should be backwards \<b=
r>
+compatible to previous versions as well.\<br>
+&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/latchset/pkcs11-provider"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/latchset/pkcs11-pr=
ovider</a>&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db53b787444a60266932bd270d1=
cf2d45&quot;<br>
+DEPENDS =3D &quot;\<br>
+=C2=A0 =C2=A0 autoconf-archive \<br>
+=C2=A0 =C2=A0 openssl \<br>
+=C2=A0 =C2=A0 p11-kit \<br>
+&quot;<br>
+<br>
+SRCREV =3D &quot;e2abc4a7ae33159f2fb21b9d87a05ea9e79ef584&quot;<br>
+PV =3D &quot;0.2+gitr${SRCPV}&quot;<br>
+PKGV =3D &quot;0.2+gitr${GITPKGV}&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/latchset/$%7BBPN%7D.g=
it;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/latchset/${BPN}.git;branch=3Dmain;protocol=3Dhttps</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools gitpkgv pkgconfig<br></blockquote><div><br>Hi Niko,<br><=
br>Can the gitpkgv be removed and used with a bbappend on a custom layer?<b=
r>This is not strictly necessary for the package and looks more aligned=C2=
=A0with the product.<br><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
+<br>
+FILES:${PN} +=3D &quot;${libdir}/ossl-modules/pkcs11.so&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107634): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107634" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107634</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103264418/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103264418/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000485ff9060cdf08af--


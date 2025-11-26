Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D84D10F20
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 10:19:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10313.1764152342228134398
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 02:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uG/cNoLG;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b566859ecso5713168f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 02:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764152340; x=1764757140; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nJPwDz6gxckQw+Xd4juDkytrMLAwinf5eGIZp2ipLwE=;
        b=uG/cNoLGwMbegrA6XJLu9We6tXO997NOswnhjJmCuBgPQqG5IS26w2AScf21DPA0rl
         1fmnLcP6pp3jL6Tdqsj0kkmPNsDSFR0/KkUKzkc/fKMrqWFtCPaFaxM8kIE+qb2kV5QH
         YWn1VMm5410iD+/UUcN82OdSRF27qzb3D00wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764152340; x=1764757140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJPwDz6gxckQw+Xd4juDkytrMLAwinf5eGIZp2ipLwE=;
        b=L4aqyqZIRHwkwf6E9oZhBC3wImbNRB7RCuTA9+Vgo9nl2gNEwjpoQVhQ8i0YoaFmhd
         4VhO6HWcTP4ZDH+mxDF6VTRf0Y+O/4dhCNTQ4JcjijCZrUq//2t5HQ4wA3wnB7ntaukQ
         QhvbnY8PXVsYm+VSYRh7KIMFDfQaJ2K8jdb/ZylUE6g2NT2DInjUCHxcvsVTAyiC6wVY
         BqBxt1w5ScE2Kt4k9tyQ0iEGFLrxEnuuVeuZfhvhN9FaG8jF79lgVBDvgJ8D6nC3E2Bj
         1Zj6zdcOt45mykgIM8nJYdWQ7wuX0AN9+QBXdxUV1BoIssXC4WmF4yBkOsnC8g55TnOx
         ZKcg==
X-Gm-Message-State: AOJu0Yxa1vTjbeQ2tdXIEbaXMBHcJinNCnGEBWCq/GL7RVWr1Q7/kjlN
	3lmRnd+3Oot8P6dHvs7rgVIinuRGkGgz7qutmee1nAM6DsvkGJFL2CUeMCu1Ev+TClJEDcYuJsl
	1oxtL2kX3sLE5FT302xeHUw/gn2GLk0WYe7NNrWPzxQ==
X-Gm-Gg: ASbGnctjoVHZKYjTL31/Fb5T0cDzF8Duuf4+kfTyeCjZGRpn9Ua7nOsCLE8RTq7Xj51
	R7e0XDxUq2of56ILx89GkHVoKcK1Hl4lZOYI9+7ZTyr15e85Q/1qe1adznWeI+YEkCtiMGEFmNH
	KEl4rqmt5OK3EDe9lGqmHW31xaNWZe/t8iGBOAfWdNvN+WOWW7VnhUQfQM3i0ByDvki5aR/jfEZ
	Lha2qEhgtVz5TYt9+TOD1c72B9WotP9ZrAbLUTiT2AAfbbvEZ7a6aeWsUGgQDF/TBiggheLOA==
X-Google-Smtp-Source: AGHT+IHAK1lcyF2MfD8tbQj3YK9/LViw3Px6pulnc3CFaO2h68paioAb3ymhBs0zl6RgA6nT8EfIdvDF4ZvpGBTkH1g=
X-Received: by 2002:a05:6000:4028:b0:42b:3366:632a with SMTP id
 ffacd0b85a97d-42e0f355caamr6067778f8f.39.1764152340336; Wed, 26 Nov 2025
 02:19:00 -0800 (PST)
MIME-Version: 1.0
References: <20251124115258.3337453-1-leon.anavi@konsulko.com> <20251124115258.3337453-2-leon.anavi@konsulko.com>
In-Reply-To: <20251124115258.3337453-2-leon.anavi@konsulko.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 26 Nov 2025 11:18:33 +0100
X-Gm-Features: AWmQ_bn9mLgWauwjYPEnoEYXCS7NR6v-ZKB6aY8I3VSq-D-f8mmkhrUFXb9TgCg
Message-ID: <CAMSfU+70YVWOWjQBVZyoK8QXvekbJ52WoF5A9Q8jBwyijauCVw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pikepdf: Add recipe
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000093631b06447cb9ee"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 10:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122077

--00000000000093631b06447cb9ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 24 nov. 2025 =C3=A0 12:53, Leon Anavi via lists.openembedded.org
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> a =C3=A9crit :

> Add recipe for v10.0.2:
>
> - Fixed presentation of strings using unparse_content_stream -
>   if the stream can be represented using PdfDocEncoding, it is
>   rendered in that way for ease of reading.
> - Reformatted C++ source.
>
> This work was sponsored by GOVCERT.LU.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../python/python3-pikepdf_10.0.2.bb          | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pikepdf_10.0.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.b=
b
> b/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
> new file mode 100644
> index 0000000000..4821e273d8
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Read and write PDFs with Python, powered by qpdf"
> +HOMEPAGE =3D "https://github.com/pikepdf/pikepdf"
> +LICENSE =3D "MPL-2.0"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D9741c346eef56131163e13b9db1241b3"
> +
> +SRC_URI[sha256sum] =3D
> "7c85a2526253e35575edb2e28cdc740d004be4b7c5fda954f0e721ee1c423a52"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +PYPI_PACKAGE =3D "pikepdf"
> +
> +DEPENDS +=3D " \
> +       python3-pybind11-native \
> +       qpdf \
> +"
> +
> +RDEPENDS:${PN} +=3D " \
> +       python3-pillow \
> +       python3-lxml \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
>

That creates warnings in CI:

stdio: WARNING: Nothing PROVIDES 'nativesdk-qpdf' (but
virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-ope=
nembedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
DEPENDS on or otherwise requires it). Close matches:
stdio: WARNING: Nothing PROVIDES 'qpdf-native' (but
virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openem=
bedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
DEPENDS on or otherwise requires it). Close matches:
stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pillow' (but
virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-ope=
nembedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pikepdf' (but
virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-ope=
nembedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pikepdf-dev' (but
virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-ope=
nembedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'python3-pikepdf-native' (but
virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openem=
bedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'python3-pikepdf-dev-native' (but
virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openem=
bedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
RDEPENDS on or otherwise requires it)

From
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/82/builds/526/ste=
ps/13/logs/stdio

Leon, can you look into it? (I guess some dependencies lack their
BBCLASSEXTEND)

Regards,

> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122008):
> https://lists.openembedded.org/g/openembedded-devel/message/122008
> Mute This Topic: https://lists.openembedded.org/mt/116449994/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000093631b06447cb9ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0lun. 24 nov. 2025 =C3=A0=C2=A012:=
53, Leon Anavi via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembe=
dded.org">konsulko.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</=
div><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Add recipe for v10.0.2:<br>
<br>
- Fixed presentation of strings using unparse_content_stream -<br>
=C2=A0 if the stream can be represented using PdfDocEncoding, it is<br>
=C2=A0 rendered in that way for ease of reading.<br>
- Reformatted C++ source.<br>
<br>
This work was sponsored by <a href=3D"http://GOVCERT.LU" rel=3D"noreferrer"=
 target=3D"_blank">GOVCERT.LU</a>.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-pikepdf_10.0.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-pikepdf_10.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 22 +++++++++++++++++++<br>
=C2=A01 file changed, 22 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pikepdf_10.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pikepdf_10.0.2.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pikepdf_10.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pikepdf_10.=
0.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pikepdf_10.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pikepdf_10.=
0.2.bb</a><br>
new file mode 100644<br>
index 0000000000..4821e273d8<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pikepdf=
_10.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pikepdf_10.0.2.bb<=
/a><br>
@@ -0,0 +1,22 @@<br>
+SUMMARY =3D &quot;Read and write PDFs with Python, powered by qpdf&quot;<b=
r>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/pikepdf/pikepdf" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/pikepdf/pikepdf</a>&quot;<b=
r>
+LICENSE =3D &quot;MPL-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D9741c346eef56131163e13=
b9db1241b3&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;7c85a2526253e35575edb2e28cdc740d004be4b7c5fda=
954f0e721ee1c423a52&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta<br>
+<br>
+PYPI_PACKAGE =3D &quot;pikepdf&quot;<br>
+<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pybind11-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qpdf \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pillow \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-lxml \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br></blockquote><div><br></=
div><div>That creates warnings in CI:</div><div><div><pre class=3D"gmail-bb=
-log-preview-contents gmail-select-content gmail-log"><div class=3D"gmail-l=
ogline"><span class=3D"gmail-log_o"><span>stdio: WARNING: Nothing PROVIDES =
&#39;nativesdk-qpdf&#39; (but virtual:nativesdk:/srv/pokybuild/yocto-worker=
/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python=
/<a href=3D"http://python3-pikepdf_10.0.2.bb">python3-pikepdf_10.0.2.bb</a>=
 DEPENDS on or otherwise requires it). Close matches:</span></span></div><d=
iv class=3D"gmail-logline"><span class=3D"gmail-log_o"><span>stdio: WARNING=
: Nothing PROVIDES &#39;qpdf-native&#39; (but virtual:native:/srv/pokybuild=
/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-de=
vtools/python/<a href=3D"http://python3-pikepdf_10.0.2.bb">python3-pikepdf_=
10.0.2.bb</a> DEPENDS on or otherwise requires it). Close matches:</span></=
span></div><div class=3D"gmail-logline"><span class=3D"gmail-log_o"><span>s=
tdio: WARNING: Nothing RPROVIDES &#39;nativesdk-python3-pillow&#39; (but vi=
rtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-opene=
mbedded/meta-python/recipes-devtools/python/<a href=3D"http://python3-pikep=
df_10.0.2.bb">python3-pikepdf_10.0.2.bb</a> RDEPENDS on or otherwise requir=
es it)</span></span></div><div class=3D"gmail-logline"><span class=3D"gmail=
-log_o"><span>stdio: WARNING: Nothing RPROVIDES &#39;nativesdk-python3-pike=
pdf&#39; (but virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/=
build/meta-openembedded/meta-python/recipes-devtools/python/<a href=3D"http=
://python3-pikepdf_10.0.2.bb">python3-pikepdf_10.0.2.bb</a> RDEPENDS on or =
otherwise requires it)</span></span></div><div class=3D"gmail-logline"><spa=
n class=3D"gmail-log_o"><span>stdio: WARNING: Nothing RPROVIDES &#39;native=
sdk-python3-pikepdf-dev&#39; (but virtual:nativesdk:/srv/pokybuild/yocto-wo=
rker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/py=
thon/<a href=3D"http://python3-pikepdf_10.0.2.bb">python3-pikepdf_10.0.2.bb=
</a> RDEPENDS on or otherwise requires it)</span></span></div><div class=3D=
"gmail-logline"><span class=3D"gmail-log_o"><span>stdio: WARNING: Nothing R=
PROVIDES &#39;python3-pikepdf-native&#39; (but virtual:native:/srv/pokybuil=
d/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/recipes-d=
evtools/python/<a href=3D"http://python3-pikepdf_10.0.2.bb">python3-pikepdf=
_10.0.2.bb</a> RDEPENDS on or otherwise requires it)</span></span></div><di=
v class=3D"gmail-logline"><span class=3D"gmail-log_o"><span>stdio: WARNING:=
 Nothing RPROVIDES &#39;python3-pikepdf-dev-native&#39; (but virtual:native=
:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-py=
thon/recipes-devtools/python/<a href=3D"http://python3-pikepdf_10.0.2.bb">p=
ython3-pikepdf_10.0.2.bb</a> RDEPENDS on or otherwise requires it)</span></=
span></div></pre></div></div><div>From <a href=3D"https://autobuilder.yocto=
project.org/valkyrie/?#/builders/82/builds/526/steps/13/logs/stdio">https:/=
/autobuilder.yoctoproject.org/valkyrie/?#/builders/82/builds/526/steps/13/l=
ogs/stdio</a></div><div><br></div><div>Leon, can you look into it? (I guess=
 some dependencies lack their BBCLASSEXTEND)</div><div><br></div><div>Regar=
ds,</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122008): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122008" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122008</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116449994/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116449994/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000093631b06447cb9ee--


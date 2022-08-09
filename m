Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7529CC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 11:12:27 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.10514.1660043540560377929
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Aug 2022 04:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jNFcei22;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id u1so16531251lfq.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Aug 2022 04:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=PExE0XtoskCXWq8unHOWU2TRc86kP8NLNd7rgfeDTcw=;
        b=jNFcei22WaM+GmIab+uZLau0S90D0qNGKRiUD9N3m7850lI54m0eCTrJ+RiIEOoSCQ
         O8NDWLd2DZVr5wt7wLLZtRLmjIwFIPSlwEuZbX8evDkXpATnAK/WOyYH71hjKfitUqr0
         zHjbgdCM9kF3V4SRonT9oWoV7VidI5L/7WmAJWsElxi6XfCNSEQeuO9ZPbzkHNgJEq0y
         hHxl0+tQagcI+XPSwE7BDSR7tzYCOD4N1lu7hTDoaTT6saFHVz9zXMuTRHnPntAXTpHV
         rQtPEHYuWB7iV0JSQLBP6IIpXfJiB0iwfXApthQjHrvwJUAllUZf0cvsZHaCJxPV+Z4g
         MokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PExE0XtoskCXWq8unHOWU2TRc86kP8NLNd7rgfeDTcw=;
        b=LS1O1JSPwBEC/vJZBz+fnVtPDDdvnvlBmy8ABjPaGFW+n62V8dKV08XmZa3xsy4CXk
         K28cxM+Wp3RhGqRBT0NIZnNkCxlXotfWoTbWRY6XK4R8gWl9FlBQtRHZj+Mo3ceD3rNV
         QiHTNM0MjO4emazdTiR5IaekxPEWN5aNkL/bGJ5mjKNvOq0SNYD5woP3xv2IoS0AHIND
         VcU0J96yL/PVHM/Spt6Ws+USQwkm3MyDN4+Y2sb4KTUKSLGAAQUo2/2Vf/IyTi0cfhX5
         wbNsvptI4ZVglWYAQnkM1ZdGKEvRLnXwxFg0d4bTgMSuJ5ZQQaCWkSIY0v0Ly0LiC+u9
         BJNQ==
X-Gm-Message-State: ACgBeo23PEjlkTNmkTFTIQjzm2NyZjrkx2aJML/guQLkO+4r9yNliJq/
	CELrDsxe/VoHOcYC+CORfe/qabpkCmUlcxkO1I0=
X-Google-Smtp-Source: 
 AA6agR6lT6LT4ogpC7Bd/pe56uG/iXGxn+mpCNsI7mFSubzuF3e93VYaxkQy8hml25c7uJFzfHneq9JsEhOqkGUAH/Y=
X-Received: by 2002:a05:6512:201a:b0:48d:1101:cc9b with SMTP id
 a26-20020a056512201a00b0048d1101cc9bmr966648lfb.152.1660043538584; Tue, 09
 Aug 2022 04:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220809110105.1524-1-matthias@extraklein.de>
In-Reply-To: <20220809110105.1524-1-matthias@extraklein.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 9 Aug 2022 12:12:07 +0100
Message-ID: 
 <CANPvuRkGobHfxBtdAKxPFSAOq68LvANLKuMx7uEtM8bLmpVKjw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libftdi: update to 1.5
To: Matthias Klein <matthias@extraklein.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006ddaf605e5cd0184"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Aug 2022 11:12:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98179

--0000000000006ddaf605e5cd0184
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matthias,

Matthias Klein <matthias@extraklein.de> escreveu no dia ter=C3=A7a, 9/08/20=
22
=C3=A0(s) 12:01:

> Signed-off-by: Matthias Klein <matthias@extraklein.de>
> ---
>  .../libftdi/{libftdi_1.4.bb =3D> libftdi_1.5.bb}             | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/libftdi/{libftdi_1.4.bb =3D> libftdi_1.5.=
bb}
> (79%)
>
> diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
> b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
> similarity index 79%
> rename from meta-oe/recipes-support/libftdi/libftdi_1.4.bb
> rename to meta-oe/recipes-support/libftdi/libftdi_1.5.bb
> index f142cb228..55105c7b2 100644
> --- a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
> +++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
> @@ -12,8 +12,8 @@ LIC_FILES_CHKSUM=3D "\
>  DEPENDS =3D "libusb1 python3 swig-native"
>
>  SRC_URI =3D "
> http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-${PV}.tar.b=
z2
> "
> -SRC_URI[md5sum] =3D "0c09fb2bb19a57c839fa6845c6c780a2"
> -SRC_URI[sha256sum] =3D
> "ec36fb49080f834690c24008328a5ef42d3cf584ef4060f3a35aa4681cb31b74"
> +SRC_URI[md5sum] =3D "f515d7d69170a9afc8b273e8f1466a80"
>

The md5sum is not used any more so you can drop it.

Jose


> +SRC_URI[sha256sum] =3D
> "7c7091e9c86196148bd41177b4590dccb1510bfe6cea5bf7407ff194482eb049"
>
>  S =3D "${WORKDIR}/${BPN}1-${PV}"
>
> @@ -22,7 +22,8 @@ inherit cmake binconfig pkgconfig python3native
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[cpp-wrapper] =3D "-DFTDI_BUILD_CPP=3Don
> -DFTDIPP=3Don,-DFTDI_BUILD_CPP=3Doff -DFTDIPP=3Doff,boost"
>
> -EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', =
'')} \
> +EXTRA_OECMAKE =3D "-DSTATICLIBS=3Doff -DEXAMPLES=3Doff -DFTDI_EEPROM=3Do=
ff \
> +                 -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', ''=
)} \
>
> -DPYTHON_LIBRARY=3D${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
>
> -DPYTHON_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98178):
> https://lists.openembedded.org/g/openembedded-devel/message/98178
> Mute This Topic: https://lists.openembedded.org/mt/92912244/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000006ddaf605e5cd0184
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Matthias,</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Matthias Klein &lt;<a href=3D"mailto:matt=
hias@extraklein.de">matthias@extraklein.de</a>&gt; escreveu no dia ter=C3=
=A7a, 9/08/2022 =C3=A0(s) 12:01:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Signed-off-by: Matthias Klein &lt;<a href=3D"mailto:matthi=
as@extraklein.de" target=3D"_blank">matthias@extraklein.de</a>&gt;<br>
---<br>
=C2=A0.../libftdi/{<a href=3D"http://libftdi_1.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libftdi_1.4.bb</a> =3D&gt; <a href=3D"http://libftdi_1.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">libftdi_1.5.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/libftdi/{<a href=3D"http://libftdi_1.4=
.bb" rel=3D"noreferrer" target=3D"_blank">libftdi_1.4.bb</a> =3D&gt; <a hre=
f=3D"http://libftdi_1.5.bb" rel=3D"noreferrer" target=3D"_blank">libftdi_1.=
5.bb</a>} (79%)<br>
<br>
diff --git a/meta-oe/recipes-support/libftdi/<a href=3D"http://libftdi_1.4.=
bb" rel=3D"noreferrer" target=3D"_blank">libftdi_1.4.bb</a> b/meta-oe/recip=
es-support/libftdi/<a href=3D"http://libftdi_1.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libftdi_1.5.bb</a><br>
similarity index 79%<br>
rename from meta-oe/recipes-support/libftdi/<a href=3D"http://libftdi_1.4.b=
b" rel=3D"noreferrer" target=3D"_blank">libftdi_1.4.bb</a><br>
rename to meta-oe/recipes-support/libftdi/<a href=3D"http://libftdi_1.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">libftdi_1.5.bb</a><br>
index f142cb228..55105c7b2 100644<br>
--- a/meta-oe/recipes-support/libftdi/<a href=3D"http://libftdi_1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libftdi_1.4.bb</a><br>
+++ b/meta-oe/recipes-support/libftdi/<a href=3D"http://libftdi_1.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libftdi_1.5.bb</a><br>
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM=3D &quot;\<br>
=C2=A0DEPENDS =3D &quot;libusb1 python3 swig-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.intra2net.com/en/developer/$%=
7BBPN%7D/download/$%7BBPN%7D1-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=
=3D"_blank">http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-$=
{PV}.tar.bz2</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;0c09fb2bb19a57c839fa6845c6c780a2&quot;<br>
-SRC_URI[sha256sum] =3D &quot;ec36fb49080f834690c24008328a5ef42d3cf584ef406=
0f3a35aa4681cb31b74&quot;<br>
+SRC_URI[md5sum] =3D &quot;f515d7d69170a9afc8b273e8f1466a80&quot;<br></bloc=
kquote><div><br></div><div>The md5sum is not used any more so you can drop =
it.</div><div><br></div><div>Jose<br>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
+SRC_URI[sha256sum] =3D &quot;7c7091e9c86196148bd41177b4590dccb1510bfe6cea5=
bf7407ff194482eb049&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${BPN}1-${PV}&quot;<br>
<br>
@@ -22,7 +22,8 @@ inherit cmake binconfig pkgconfig python3native<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[cpp-wrapper] =3D &quot;-DFTDI_BUILD_CPP=3Don -DFTDIPP=
=3Don,-DFTDI_BUILD_CPP=3Doff -DFTDIPP=3Doff,boost&quot;<br>
<br>
-EXTRA_OECMAKE =3D &quot;-DLIB_SUFFIX=3D${@d.getVar(&#39;baselib&#39;).repl=
ace(&#39;lib&#39;, &#39;&#39;)} \<br>
+EXTRA_OECMAKE =3D &quot;-DSTATICLIBS=3Doff -DEXAMPLES=3Doff -DFTDI_EEPROM=
=3Doff \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLIB_SUFFIX=
=3D${@d.getVar(&#39;baselib&#39;).replace(&#39;lib&#39;, &#39;&#39;)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DPYTHON_LIB=
RARY=3D${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DPYTHON_INC=
LUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}&quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98178): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98178" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/98178</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92912244/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92912244/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000006ddaf605e5cd0184--


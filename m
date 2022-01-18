Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72A8C433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 17:01:11 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.15581.1642525270771117277
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 09:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I73z9+Hj;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id a18so82465850edj.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 09:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dvpfpgqEvb1Ic4dG43mg3kD6zx1soCM1BGpb+F50R0I=;
        b=I73z9+Hjdlb9qt4H50jA+y9unNaKpZ3STn+vuCAMvMzXDKu0H/hA+JhJL56UpYlecD
         agfmg75shldvPPAAl1lUw0xFVvLaNJtNf7m6ZTQrnR43tmZieTbQUPzVsMsPictgY2FY
         rbliu5J0sC7IpLErzxq0orqgmZUq94/9Egx7nPNrilqWJuGXxLliiho8NoYaT+GzUM/i
         vOEkuQl+L+g0M00jEOqMm2TorW4JyPVaOFPhSbnQsX6NCFzw0QPny+O9HEXqO0ehW6nW
         2XMW2u9632Cf5IqIwAmStzldEJv5IWHTSw5Yihz3KLElkOdU2UUOU8bZI+9zaSp2UxOP
         mn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dvpfpgqEvb1Ic4dG43mg3kD6zx1soCM1BGpb+F50R0I=;
        b=3UcVIHVRwN95EfGqG8DG1fOoX6cznN9WG0KGLsUEEdUHkKKqDWITj3Rn2Ctz1qgc54
         gpfivNNuZVoAyPHr0pmGfztBveY4F9v1Tyf2yh/5aGgrHuaczbCu04Cwq/aRfLAOjdhd
         Qfs0ROlpqliyIHGLiC3mWmHAaCmYJx12n1pMsTkIl38PR1Xxk1GgdbcNO5r8pAPwVRKy
         /zm6Wf6WSLCtRxFOxH/caIMDLRUpUBRPxoa5z+iMURHrDX4SXGDrrOpCNWzy1Cva3F62
         OZjZbzrtLnAlL2C8Z9QPk+/u7GTtB5f9KJyH3dH/alJcviTo3WABEl7dYqHfsJ9fx0VH
         idOQ==
X-Gm-Message-State: AOAM531qtJb4O0NAj1rbm2HgGjS8ESfx3YyyevQ/DEqEC3KecUHUA9b2
	YTOztlLnpRhSsT5iuTMF5BcGAUvYpMaBzH3AKAM=
X-Google-Smtp-Source: 
 ABdhPJzwmXNxXrkwM9Vafk3IDl0HGdWF8l5q6+XuaeJbA4BVjUrhnx27tQtKdS5BwBqw7UfSo+bFixxiCx2LLDCPCtQ=
X-Received: by 2002:a05:6402:4b:: with SMTP id
 f11mr27012385edu.267.1642525269128;
 Tue, 18 Jan 2022 09:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20220118083234.2427848-1-Martin.Jansa@gmail.com>
In-Reply-To: <20220118083234.2427848-1-Martin.Jansa@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 18 Jan 2022 09:00:58 -0800
Message-ID: 
 <CANx9H-DfzVd4Xp_b+2jDDpO_DTO5J53MyEAagTgP8D_UG0KvGw@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] distutils-base: stop using
 distutils-common-base which now triggers warning about distutils removal in
 Python 3.12
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003379c605d5de3752"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 17:01:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94915

--0000000000003379c605d5de3752
Content-Type: text/plain; charset="UTF-8"

Thank you for this JaMa, it will make the move of distutils* classes to
meta-python smoother. And when we drop distutils-common-base from oe-core
it won't impact meta-python2.

Thank you also for maintaining meta-python2. I do appreciate it.

On Tue, Jan 18, 2022 at 12:32 AM Martin Jansa <Martin.Jansa@gmail.com>
wrote:

> * distutils removal in Python 3.12 doesn't affect already EOL Python2
> recipes
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
Acked-by: Tim Orlnig <tim.orling@konsulko.com>

> ---
>  classes/distutils-base.bbclass | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/classes/distutils-base.bbclass
> b/classes/distutils-base.bbclass
> index 803dc8b..26aadad 100644
> --- a/classes/distutils-base.bbclass
> +++ b/classes/distutils-base.bbclass
> @@ -1,4 +1,34 @@
>  DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}",
> ""][(d.getVar('PACKAGES') == '')]}"
>  RDEPENDS:${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' ==
> 'class-target']}"
>
> -inherit distutils-common-base pythonnative
> +inherit pythonnative
> +
> +# the rest is meta/classes/distutils-common-base.bbclass before the
> bb.warn was added in:
> +#
> https://git.openembedded.org/openembedded-core/commit/?id=54b455049ee94c01c78b31b6c744c8e32b5b7737
> +# as the distutils removal in Python 3.12 doesn't affect already EOL
> Python2 recipes
> +
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +
> +# LDSHARED is the ld *command* used to create shared library
> +export LDSHARED  = "${CCLD} -shared"
> +# LDXXSHARED is the ld *command* used to create shared library of C++
> +# objects
> +export LDCXXSHARED  = "${CXX} -shared"
> +# CCSHARED are the C *flags* used to create objects to go into a shared
> +# library (module)
> +export CCSHARED  = "-fPIC -DPIC"
> +# LINKFORSHARED are the flags passed to the $(CC) command that links
> +# the python executable
> +export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
> +
> +FILES:${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
> +
> +FILES:${PN}-staticdev += "\
> +  ${PYTHON_SITEPACKAGES_DIR}/*.a \
> +"
> +FILES:${PN}-dev += "\
> +  ${datadir}/pkgconfig \
> +  ${libdir}/pkgconfig \
> +  ${PYTHON_SITEPACKAGES_DIR}/*.la \
> +"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94910):
> https://lists.openembedded.org/g/openembedded-devel/message/94910
> Mute This Topic: https://lists.openembedded.org/mt/88505319/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003379c605d5de3752
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for this JaMa, it will make the move of dis=
tutils* classes to meta-python smoother. And when we drop distutils-common-=
base from oe-core it won&#39;t impact meta-python2.</div><div><br></div><di=
v>Thank you also for maintaining meta-python2. I do appreciate it.</div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, J=
an 18, 2022 at 12:32 AM Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gma=
il.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">* distutils removal in Python 3.12 doesn&#39;=
t affect already EOL Python2 recipes<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br></blockquote><div>Acked-=
by: Tim Orlnig &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.orling@ko=
nsulko.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
---<br>
=C2=A0classes/distutils-base.bbclass | 32 +++++++++++++++++++++++++++++++-<=
br>
=C2=A01 file changed, 31 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/classes/distutils-base.bbclass b/classes/distutils-base.bbclas=
s<br>
index 803dc8b..26aadad 100644<br>
--- a/classes/distutils-base.bbclass<br>
+++ b/classes/distutils-base.bbclass<br>
@@ -1,4 +1,34 @@<br>
=C2=A0DEPENDS=C2=A0 +=3D &quot;${@[&quot;${PYTHON_PN}-native ${PYTHON_PN}&q=
uot;, &quot;&quot;][(d.getVar(&#39;PACKAGES&#39;) =3D=3D &#39;&#39;)]}&quot=
;<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;${@[&#39;&#39;, &#39;${PYTHON_PN}-core&#39;=
][&#39;${CLASSOVERRIDE}&#39; =3D=3D &#39;class-target&#39;]}&quot;<br>
<br>
-inherit distutils-common-base pythonnative<br>
+inherit pythonnative<br>
+<br>
+# the rest is meta/classes/distutils-common-base.bbclass before the bb.war=
n was added in:<br>
+# <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D5=
4b455049ee94c01c78b31b6c744c8e32b5b7737" rel=3D"noreferrer" target=3D"_blan=
k">https://git.openembedded.org/openembedded-core/commit/?id=3D54b455049ee9=
4c01c78b31b6c744c8e32b5b7737</a><br>
+# as the distutils removal in Python 3.12 doesn&#39;t affect already EOL P=
ython2 recipes<br>
+<br>
+export STAGING_INCDIR<br>
+export STAGING_LIBDIR<br>
+<br>
+# LDSHARED is the ld *command* used to create shared library<br>
+export LDSHARED=C2=A0 =3D &quot;${CCLD} -shared&quot;<br>
+# LDXXSHARED is the ld *command* used to create shared library of C++<br>
+# objects<br>
+export LDCXXSHARED=C2=A0 =3D &quot;${CXX} -shared&quot;<br>
+# CCSHARED are the C *flags* used to create objects to go into a shared<br=
>
+# library (module)<br>
+export CCSHARED=C2=A0 =3D &quot;-fPIC -DPIC&quot;<br>
+# LINKFORSHARED are the flags passed to the $(CC) command that links<br>
+# the python executable<br>
+export LINKFORSHARED =3D &quot;${SECURITY_CFLAGS} -Xlinker -export-dynamic=
&quot;<br>
+<br>
+FILES:${PN} +=3D &quot;${libdir}/* ${libdir}/${PYTHON_DIR}/*&quot;<br>
+<br>
+FILES:${PN}-staticdev +=3D &quot;\<br>
+=C2=A0 ${PYTHON_SITEPACKAGES_DIR}/*.a \<br>
+&quot;<br>
+FILES:${PN}-dev +=3D &quot;\<br>
+=C2=A0 ${datadir}/pkgconfig \<br>
+=C2=A0 ${libdir}/pkgconfig \<br>
+=C2=A0 ${PYTHON_SITEPACKAGES_DIR}/*.la \<br>
+&quot;<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#94910): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/94910" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/94910</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88505319/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
88505319/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003379c605d5de3752--


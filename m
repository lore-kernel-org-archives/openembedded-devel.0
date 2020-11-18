Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.27119.1605717827918415099
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 08:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HfwDM48u;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id oq3so3682462ejb.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 08:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2dGB0XyUce241zmmuk9boDPN5Q1LG/4tdYXJFjkEgfU=;
        b=HfwDM48unxQjJJ0VVKz1nBBCL2gJQrnnEsFTWax2vTg7AZk+Ea3aVou+KX+3hWPNVB
         rXUw6JUVeL77V4T0LHWP+9muURJ38Aqs0zwAviGe51iKm6uX3AyqHwBtsK8SKyDPXkom
         7mq1Zu07buiPMB8zd2z/QxXrUzCez8ryNTgmYV0aVoa8eb+3WDEEdYCsDMZ35eRcNaQl
         f6+uzfphImV09HpzeibFUOCnXZlb1QNktfBfH4HFjwMqzL/GaS5d76iweUWBYbsUlYDH
         G8Pvb/a+ShA6/CLzyDCd/1l/eaR4k9SoC+6amsx1oXSx4B+jgZ06tLntC0qAehOrPRNA
         fNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2dGB0XyUce241zmmuk9boDPN5Q1LG/4tdYXJFjkEgfU=;
        b=HADKC1n0mrzQHXsSExBUsdq0L4OL0kFJlk8G8ZD4eo4UiLcSQdCKj7K7BFk8KnpcKg
         nvR5kkdBpqkbhj/kJuDFM2rjOb6OS8/42VlC/9M+jUM4xnu5vByhXvqgH7hpTpmI1QEi
         8xVAI/yQxmiXnzW7lyK5U0nQDrCwICr4smb0gp8520qjqeiTbp0XEGkMEfarbis9FBqq
         1eJex13NLqfoa5FoFjCQv865Pfj8m7uxTv0C1cIPxP0VtJ8Eze56H0nZo4BK7ey2h7Sk
         dvtBuliVIvB8Qu+HmXXOv2Tg8Dp9g8Gr6h1YeEcFtllRTF+s4RE0lRwsOo7iRiH8HQDG
         ihxw==
X-Gm-Message-State: AOAM5339jF65esM4Nb9Gi2RPeEJajmLXvXsQsuKeiH+OwZ5PKJ/dCeKl
	sgj0QZ2+eErUQNHlHeVHS0MN1qj2U7n9KqOnAOc=
X-Google-Smtp-Source: ABdhPJwcVSSlrlFOJSA+fRgk4FhhfVG5O1qDAJaCTCSaOXIS+3U2RjryjM+vZQHuiiyv/dIG273MOGn9gppilmhdmG0=
X-Received: by 2002:a17:906:fcdb:: with SMTP id qx27mr25208999ejb.470.1605717826423;
 Wed, 18 Nov 2020 08:43:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605711982.git.akuster808@gmail.com> <d89968b63f16f49ff04f37dbfb55fb078f5f2541.1605711982.git.akuster808@gmail.com>
In-Reply-To: <d89968b63f16f49ff04f37dbfb55fb078f5f2541.1605711982.git.akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 18 Nov 2020 17:43:35 +0100
Message-ID: <CA+chaQeVWur2fjdARtciisXLWcHaftyB6kwEx35Ephdsnw8a-Q@mail.gmail.com>
Subject: Re: [oe] [dunfell 13/17] libeigen: update SRC_URI to use gitlab git
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a750ee05b46450cc"

--000000000000a750ee05b46450cc
Content-Type: text/plain; charset="UTF-8"

I know this is just cherry-pick from master, but if someone wants to update
this in master, then nobranch isn't needed (anymore?), the tag is in 3.3
branch

eigen$ git branch -a --contains 21ae2afd4edaa1b69782c67a54182d34efe43f9c
  remotes/origin/3.3

On Wed, Nov 18, 2020 at 4:08 PM akuster <akuster808@gmail.com> wrote:

> From: Diego Rondini <diego.rondini@kynetics.com>
>
> Update SRC_URI to use gitlab git repository. As discussed here gitlab
> archive
> stability is not fully guaranteed, so repository is preferred:
> https://forum.gitlab.com/t/gitlab-release-tarball-stability/41888/3
>
> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit a6b2a0c3d045bd09d4049ca8fb155f881657c31f)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> index 9c3d962f41f..6ce318d0b59 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> @@ -4,11 +4,11 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
>  LICENSE = "MPL-2.0"
>  LIC_FILES_CHKSUM =
> "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
>
> -SRC_URI = "
> https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2"
> -SRC_URI[md5sum] = "b9e98a200d2455f06db9c661c5610496"
> -SRC_URI[sha256sum] =
> "685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11"
> +SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;nobranch=1"
>
> -S = "${WORKDIR}/eigen-${PV}"
> +SRCREV = "21ae2afd4edaa1b69782c67a54182d34efe43f9c"
> +
> +S = "${WORKDIR}/git"
>
>  inherit cmake
>
> --
> 2.17.1
>
>
> 
>
>

--000000000000a750ee05b46450cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I know this is just cherry-pick from master, but if someon=
e wants to update this in master, then nobranch isn&#39;t needed (anymore?)=
, the tag is in 3.3 branch<div><br></div><div>eigen$ git branch -a --contai=
ns 21ae2afd4edaa1b69782c67a54182d34efe43f9c<br>=C2=A0 remotes/origin/3.3<br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Nov 18, 2020 at 4:08 PM akuster &lt;<a href=3D"mailto:akuste=
r808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Diego Rondini &lt;<a href=3D"mail=
to:diego.rondini@kynetics.com" target=3D"_blank">diego.rondini@kynetics.com=
</a>&gt;<br>
<br>
Update SRC_URI to use gitlab git repository. As discussed here gitlab arch=
ive<br>
stability is not fully guaranteed, so repository is preferred:<br>
<a href=3D"https://forum.gitlab.com/t/gitlab-release-tarball-stability/418=
88/3" rel=3D"noreferrer" target=3D"_blank">https://forum.gitlab.com/t/gitla=
b-release-tarball-stability/41888/3</a><br>
<br>
Signed-off-by: Diego Rondini &lt;<a href=3D"mailto:diego.rondini@kynetics.=
com" target=3D"_blank">diego.rondini@kynetics.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
(cherry picked from commit a6b2a0c3d045bd09d4049ca8fb155f881657c31f)<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" ta=
rget=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.7.bb=
" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a> | 8 ++++----<b=
r>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3=
.3.7.bb" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a> b/meta-=
oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.7.bb" rel=3D"nor=
eferrer" target=3D"_blank">libeigen_3.3.7.bb</a><br>
index 9c3d962f41f..6ce318d0b59 100644<br>
--- a/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.7.bb=
" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a><br>
+++ b/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.7.bb=
" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a><br>
@@ -4,11 +4,11 @@ HOMEPAGE =3D &quot;<a href=3D"http://eigen.tuxfamily.org=
/" rel=3D"noreferrer" target=3D"_blank">http://eigen.tuxfamily.org/</a>&quo=
t;<br>
=C2=A0LICENSE =3D &quot;MPL-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.MPL2;md5=3D815ca599c9df247=
a0c7f619bab123dad&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://gitlab.com/libeigen/eigen/-/archive/=
$%7BPV%7D/eigen-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2</a>&quot=
;<br>
-SRC_URI[md5sum] =3D &quot;b9e98a200d2455f06db9c661c5610496&quot;<br>
-SRC_URI[sha256sum] =3D &quot;685adf14bd8e9c015b78097c1dc22f2f01343756f196=
acdc76a678e1ae352e11&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/libeigen/eigen.git;p=
rotocol=3Dhttp;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">gitlab.co=
m/libeigen/eigen.git;protocol=3Dhttp;nobranch=3D1</a>&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/eigen-${PV}&quot;<br>
+SRCREV =3D &quot;21ae2afd4edaa1b69782c67a54182d34efe43f9c&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a750ee05b46450cc--

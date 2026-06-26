Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F21C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:04:07 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37085.1782486238318903118
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C1803v6S;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6649fde483bso902969d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 08:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782486237; cv=none;
        d=google.com; s=arc-20260327;
        b=pEal4YqVTRfZjq5hctw2wpPY00VUu2pKzspTKuIYVMPmpIzDWzF6wlX/R6gIevU9GU
         QzvJYTb1LJ0i0xzdAdizR5QzDs2thVVf6jd/38OEwrEjaG389CiP4iMx7j05Cc6l2OOn
         jkMSen2z6Vm8Bj0oyiUHpVoG8w7IuHgUfegoEd8ve0mY20s2vgPsyAhlXYHzJ8IdQ8ns
         A819X+7T8391vBmPVcYwyJkNCpQfTNVsMYZ/mSMClKUrsW9OikPWsdQJSduMkUr2WzqI
         xWfsERfWbQhe8lxN3ROszdHu9rpzErimPiuFjWb4Dy04N7jZ75WgBVbAo7UuRfsp8aZT
         82pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z9UadtPNMUJVBnkwwcL1vA4ipmTamq12+HfjqnB5qwk=;
        fh=hWWaLsFaOe59cR4LOA7oTSO3bxLIWodZMwibn2oMu0w=;
        b=OWzftxanGgM1IGnvCTX3VmImXdNgUPlveO4DOIeRkirqaEr9fYzPojmpiQt7H6KkGn
         1G8v+mVmYfNcma5SUFcoIfAk4Ct4sNBT0balY/lzzNnJOcFisYcutXYvvB2XfZGTGCm/
         BTm41hlBcQfEQ2onJsLfKtafBY3PXL9gKdUfIJzGODCYquwo9E9h7Q/zm1aRC3zLbWVh
         9mk85goya0hOmCANk3Kbfu0vBmT2s1OA1wQHr05hInndFVe4ooK4veifmfTZo3xobia/
         AOotpb346nVQSToYPuuY1e+QtVuc6AFWcaKAML1IUzkO+cPavTqssPgbFWFHHplUlAjF
         T5jA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782486237; x=1783091037; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z9UadtPNMUJVBnkwwcL1vA4ipmTamq12+HfjqnB5qwk=;
        b=C1803v6SrDUW0oLzwdVMm4vx1IrBnMJWlbhGRBw8zLLrePKopNO877C964dfhPIZ69
         9F1AInFzLr7pbioKNUcHN8G1iPQdPIciEMn66s7hpnFhnhCnbIQduk6FouKhErujOmkJ
         Qat1QK5VrEUaLeZ8gR5mh3Wuf85b0F1obrHxkxv5Aw5GtN6+2MSg9L0aCP19KIAzyFTr
         R8+P6edvEtRmokVfi1JbnBwXdBhfY+uvgrtjzxtuw9iLVZi3GY0wwWFG8BNYzndXu+5k
         g7Sx9JyUucjRb1NlAs6jp+0Yfsde8ziPGaHz32bUaPI2aPrZeb96wSK6bvu7Bf1YHmJL
         Uypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486237; x=1783091037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9UadtPNMUJVBnkwwcL1vA4ipmTamq12+HfjqnB5qwk=;
        b=Y5PaE2/IED0PT9qYVxjeWc4C+H41qCtvxNTcEOLjlRGQFvL3RjrDtpV5w2ErV2Km0G
         AxxyvrZDwiC2Llt7iouqyL17+sTYZI7SBe3uEq4I5bgIzM3k/9HhjDy9ZoFf6M6d5WF/
         LDaVodJSlxy+0wJC982g1xMX7r9Ndwk02zrzWWI7D7FutNZEM4HaiZIxvzTZ7uZDrSdx
         QpdUKJYc9HzWbm5kaI+AjfVQbeEsZ6keqenHTsI+g+Z9qCthDPozcw/FdS114SN2dLBF
         dmGPmLhr8fPtofcCW9hgQyDVrJmLo/882eLWmr7xleseUVgTykSdI6/bpqUbnOF3jji7
         PWfQ==
X-Gm-Message-State: AOJu0YwddbdHHD0UeoSK+G49JUn060O1H/ZzHskhYyC3W92ESrepgfDw
	q2tuhc0yS4l2Ew2sn3oNuDz5rmLVFg0ru5+7mTAI4R9ZvYIbYyP06JP61fU6W6tRdPh6lIxOvkR
	VuewtN9Wx8uUGGAErRzYCgEH6FdkM/6U=
X-Gm-Gg: AfdE7cmRaWTIlbUxD6UGhOY2lIkjlMZQjf0416fxfv+sOLVwNAS/94CYWQCeWkuWlmW
	17WzqVqIEsKz2O/YCBIFt15l8QNzMPFIh9n9kPiL/xKixbQ8KhLetl6WmmlfhXqB6DxoWy7tvMJ
	9T47td6YEt3XqeVY9chrwCa6/W2XZ/awtBJ3WsVW/r4HSwNuwvpU5eZ3l7e/9WRmcn01av8CjRL
	6/978r5U0jIQovX7KuPt1QFR+G77sLj6bz9H+0B9NiKo2k6ozoC4gR7ECJB5YjdaOHC8z7irvdN
	GsP2LFBOXvn/j4rWaBXEwQvE2IkT0VUcKgBCj0LcF0OltnG6vzPh0qZYSI2TSNk+0JJDl5r6joI
	mCoxjDwj0nXGPFM5T7ETsURCQPF6KZFSl9uYqyK3i7e2/PE1Zf6hBn3qCCJPkXIq4d/rUcg==
X-Received: by 2002:a53:ed06:0:b0:664:ae6a:e9a4 with SMTP id
 956f58d0204a3-664ae6b0c61mr499471d50.74.1782486237002; Fri, 26 Jun 2026
 08:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260626113322.232336-1-ashwin.prabhakar@oss.qualcomm.com>
In-Reply-To: <20260626113322.232336-1-ashwin.prabhakar@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jun 2026 08:03:30 -0700
X-Gm-Features: AVVi8CdKKXzuP0lkZ3EcCO3OLaeJ2yFCfuN1Isz6jce41bpFCPDHqJlvxa8SRxA
Message-ID: <CAMKF1spN2c_wpYNTfJHdWntaDk-T7qxv=SJATXiZNqOd6GLUzg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] assimp: Add new recipe for Open Asset
 Import Library (Assimp)
To: ashwin.prabhakar@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org, anuj.mittal@oss.qualcomm.com
Content-Type: multipart/alternative; boundary="000000000000f93f290655296ad9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 15:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127800

--000000000000f93f290655296ad9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

these are already applied to master branch. if you are proposing it for
backports please prefix the subject with branch name appropriately
([wrynose]) and send v2

On Fri, Jun 26, 2026 at 5:57=E2=80=AFAM Ashwin Prabhakar via lists.openembe=
dded.org
<ashwin.prabhakar=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> From: Ashwin Prabhakar <ashwin.prabhakar@qti.qualcomm.com>
>
> Add a new recipe for the Open Asset Import Library (Assimp) using
> the latest upstream git source. This library provides a unified
> interface to import various 3D model formats.
>
> Signed-off-by: Ashwin Prabhakar <ashwin.prabhakar@qti.qualcomm.com>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> (cherry picked from commit ca1512c46f66fd5b555ca463c61ef08155fcdb57)
> ---
>  meta-oe/recipes-graphics/assimp/assimp_git.bb | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/assimp/assimp_git.bb
>
> diff --git a/meta-oe/recipes-graphics/assimp/assimp_git.bb
> b/meta-oe/recipes-graphics/assimp/assimp_git.bb
> new file mode 100644
> index 0000000000..13d1002946
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/assimp/assimp_git.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "Open Asset Import Library"
> +DESCRIPTION =3D "The Open Asset Import Library (assimp) is a portable Op=
en
> Source \
> +library to import various well-known 3D model formats in a uniform
> manner."
> +HOMEPAGE =3D "https://github.com/assimp/assimp"
> +SECTION =3D "devel"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df2d38c9e0d63058b051065fb7b110=
2a8"
> +
> +DEPENDS =3D "zlib"
> +
> +SRC_URI =3D "git://
> github.com/assimp/assimp.git;protocol=3Dhttps;branch=3Dmaster"
> +
> +SRCREV =3D "1962da5ac484434524e7a25d566046edd932f901"
> +
> +PV =3D "5.x+git${SRCPV}"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE =3D "\
> +    -DASSIMP_BUILD_ASSIMP_TOOLS=3DOFF \
> +    -DASSIMP_BUILD_TESTS=3DOFF \
> +    -DASSIMP_LIB_INSTALL_DIR=3D${baselib} \
> +    -DCMAKE_INSTALL_PREFIX=3D${prefix} \
> +    -DCMAKE_INSTALL_LIBDIR=3D${baselib} \
> +    -DCMAKE_SKIP_RPATH=3DON \
> +    -DCMAKE_BUILD_WITH_INSTALL_RPATH=3DOFF \
> +"
> +
> +do_install:append() {
> +
> +    sed -i \
> +        -e "s:${WORKDIR}.*:${prefix}:g" \
> +        -e "s:${TMPDIR}.*:${prefix}:g" \
> +        ${D}${libdir}/pkgconfig/assimp.pc
> +
> +    find ${D} -name "*assimp*cmake*" -delete
> +    find ${D} -name "*.la" -delete
> +}
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127792):
> https://lists.openembedded.org/g/openembedded-devel/message/127792
> Mute This Topic: https://lists.openembedded.org/mt/119988959/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f93f290655296ad9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">these are already applied to master branch. if you are pro=
posing it for backports please prefix the subject with branch name appropri=
ately ([wrynose]) and send v2</div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 26, 2026 at =
5:57=E2=80=AFAM Ashwin Prabhakar via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;ashwin.prabhakar=3D<a href=3D"mailto:oss=
.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Ashwin Prabhakar &lt;<a href=3D"mailto:ashwin.prabhakar@qti.qualcom=
m.com" target=3D"_blank">ashwin.prabhakar@qti.qualcomm.com</a>&gt;<br>
<br>
Add a new recipe for the Open Asset Import Library (Assimp) using<br>
the latest upstream git source. This library provides a unified<br>
interface to import various 3D model formats.<br>
<br>
Signed-off-by: Ashwin Prabhakar &lt;<a href=3D"mailto:ashwin.prabhakar@qti.=
qualcomm.com" target=3D"_blank">ashwin.prabhakar@qti.qualcomm.com</a>&gt;<b=
r>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" ta=
rget=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
(cherry picked from commit ca1512c46f66fd5b555ca463c61ef08155fcdb57)<br>
---<br>
=C2=A0meta-oe/recipes-graphics/assimp/<a href=3D"http://assimp_git.bb" rel=
=3D"noreferrer" target=3D"_blank">assimp_git.bb</a> | 39 ++++++++++++++++++=
+<br>
=C2=A01 file changed, 39 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/assimp/<a href=3D"http://=
assimp_git.bb" rel=3D"noreferrer" target=3D"_blank">assimp_git.bb</a><br>
<br>
diff --git a/meta-oe/recipes-graphics/assimp/<a href=3D"http://assimp_git.b=
b" rel=3D"noreferrer" target=3D"_blank">assimp_git.bb</a> b/meta-oe/recipes=
-graphics/assimp/<a href=3D"http://assimp_git.bb" rel=3D"noreferrer" target=
=3D"_blank">assimp_git.bb</a><br>
new file mode 100644<br>
index 0000000000..13d1002946<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/assimp/<a href=3D"http://assimp_git.bb" rel=
=3D"noreferrer" target=3D"_blank">assimp_git.bb</a><br>
@@ -0,0 +1,39 @@<br>
+SUMMARY =3D &quot;Open Asset Import Library&quot;<br>
+DESCRIPTION =3D &quot;The Open Asset Import Library (assimp) is a portable=
 Open Source \<br>
+library to import various well-known 3D model formats in a uniform manner.=
&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/assimp/assimp" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/assimp/assimp</a>&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df2d38c9e0d63058b051065fb7b=
1102a8&quot;<br>
+<br>
+DEPENDS =3D &quot;zlib&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/assimp/assimp.git;pro=
tocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.=
com/assimp/assimp.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
+<br>
+SRCREV =3D &quot;1962da5ac484434524e7a25d566046edd932f901&quot;<br>
+<br>
+PV =3D &quot;5.x+git${SRCPV}&quot;<br>
+<br>
+inherit cmake<br>
+<br>
+EXTRA_OECMAKE =3D &quot;\<br>
+=C2=A0 =C2=A0 -DASSIMP_BUILD_ASSIMP_TOOLS=3DOFF \<br>
+=C2=A0 =C2=A0 -DASSIMP_BUILD_TESTS=3DOFF \<br>
+=C2=A0 =C2=A0 -DASSIMP_LIB_INSTALL_DIR=3D${baselib} \<br>
+=C2=A0 =C2=A0 -DCMAKE_INSTALL_PREFIX=3D${prefix} \<br>
+=C2=A0 =C2=A0 -DCMAKE_INSTALL_LIBDIR=3D${baselib} \<br>
+=C2=A0 =C2=A0 -DCMAKE_SKIP_RPATH=3DON \<br>
+=C2=A0 =C2=A0 -DCMAKE_BUILD_WITH_INSTALL_RPATH=3DOFF \<br>
+&quot;<br>
+<br>
+do_install:append() {<br>
+<br>
+=C2=A0 =C2=A0 sed -i \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s:${WORKDIR}.*:${prefix}:g&quot; \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s:${TMPDIR}.*:${prefix}:g&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/pkgconfig/assimp.pc<br>
+<br>
+=C2=A0 =C2=A0 find ${D} -name &quot;*assimp*cmake*&quot; -delete<br>
+=C2=A0 =C2=A0 find ${D} -name &quot;*.la&quot; -delete<br>
+}<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127792): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127792" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127792</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119988959/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119988959/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f93f290655296ad9--


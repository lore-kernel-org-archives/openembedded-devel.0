Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A114AC5CFCF
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 02:22:47 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10832.1786587767003193179
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2026 19:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nFoHHrAU;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81ed000b507so16890717b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2026 19:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786587766; cv=none;
        d=google.com; s=arc-20260327;
        b=e/TH2Ne3+LNQ5VXraiUZDGMDDjgdmkzSfZixVjbTsX+OOaQEDSSVCrMYEUi/gyDtdt
         3RDxPTJVF9P8N7WWnQrf4LDufib2FL6O2/F2R6dw9GaZFAyyEeQmBoAMTK0uwqSGwxLL
         3IQPD5fPEtWtLVRUc4MtAhY/T26j35AoPRIzZZWfPT9zQe+Gdrknsxz2RFYvbzMohr8/
         eZKTQW2Wdbu6R5HOzVPzzUQaVXYA6Ec+ht/KNz6i3YCRZotdr20Cw1Tt2X92paRVH8u+
         NNH4Tj0A6SzAT8PWYyZbFs9gAQqGvpveCQ5R7k5J29wbUlYn2T8d70+cZJM2OQ6prhHC
         RpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZSe+0JMQOVmIaZdRVDPVGpQ1IJpaFQmLwzSj8URj/1A=;
        fh=x5atcx9DrkonsIAOzCVOtb4AuH7J/yMjI3oztfTp+Fo=;
        b=QT5jxyX3ToU5RmHGFMmwNilJP5K5vcqcG/GQE9/5sQOCdzyvA+ztgdclMXcjQaSJo1
         azMzoeStGhOzfu8+Cxxmz7GCpoOoJeS1C38kb+nBu0pkIrnyPC5gheoYHTMnszUznp70
         fGQe2URT7cV4GVjL0dIBWPB9BFSiMqFQISeMaHch84Kx4hKfeO6f5aq4aqKKiN2aKqJT
         SxzRoYVd2gnp9milCpJQKkuUD2PVeMLFP3W/8BlIHTFbQHxdgudDKy8GuRoLFzZu0+sA
         5busGUVn6e3efXwGkYphSSMQ75PAV4eOPES6P/4VSEeUuKnrZqRgW5608PtONFtAJ9zt
         UQCg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786587766; x=1787192566; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSe+0JMQOVmIaZdRVDPVGpQ1IJpaFQmLwzSj8URj/1A=;
        b=nFoHHrAUbQIV0gxhJRTYe4B7mnPfrSwqZcS2qWfeZREVf1Nm1cAT6sUF9ejkNlD9ek
         xBUbocyr20ut5xfIydyyBtgQ7gKHDHBNyp3mzIpfV29aUWECGNM+yHYuFtgPniPDmlrj
         oj97lRWVQD1dI+bcYp/6sri8/icDwK1aqPR7Bj16nrANmqwLaBA8BdDQbAmYzfBzIsra
         eVucssdOMPjd1lW9bJApzrx2PR5oNKPkDz5A4SOuoRiJ7V3uUnjeQpEn2qZd2zHhA4aV
         uekGv8k0GtrYKGkNwQcimCV6OhBsvzkuV7nv1h3WOZJ1XJa2eCNmvZnom6c+VXxXJ9g/
         uJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786587766; x=1787192566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZSe+0JMQOVmIaZdRVDPVGpQ1IJpaFQmLwzSj8URj/1A=;
        b=ZOw+w6reB47oymBdklvxgQniaK2cBi4HAshWubYsGAZxgVD2tDi1/XLErPo8GvRoAS
         1uqUEb4cgDDpvjE3tY1lGSW6MUtrmGVX36MIujCJz7EEAV8ioixVe0ovALgtXdXhCcfi
         MwNhn2dtobdfmvkPt8hN9QFF5BmVvjCDLAdlnaUR/dIvqMSjs3cILuVNGNiPyRvHjxR5
         W1ZwNwrjhVLCitfqYXeB0DyGJAldVRpqsphvB7OChbb7B5x48EzPQ4SjDsxfR4MKTMHM
         XVA3onTRmP+V+OKvUtVuI2y4vcFjTB6R3rDMUZWp3GYQhHs7RvVmZdV4wH8Pf339fs3z
         GCZg==
X-Gm-Message-State: AOJu0YwV06NoM+d8RG3cUPV6LlCBjcGdkZdStUW+/rxSSq9VDNnMJ8rG
	lGTAfF4dUN4ohKZZHuc0tB0jLyjQDR55JXiqOEYMFa1jMeKLN7UZtgwV3GvzeVT0f3sdx9mP4Sh
	yqeNLqaQWh9sRhOMuryY2HB0z0oFk1gc=
X-Gm-Gg: AR+sD128NwAfGqENcA3mnHW/Z95q6SHHe1CY662UesY8go5fpBN8AT33eFA1ZHnM7o3
	seqbop8PWkyidOhC2LY2nE1Cna07rqHClS9B8dyxzXl7VnyeTRX76v47Kd/hlha7wnnl/2DJks/
	BS2s7q7PEIcXjV3RsIxYFs7YmURVVKiq/vCOydZoHX7eJ51SpFOgwe4hVE0Q1qmrbw1C5swVwl6
	ZqdiIeFphV/tF1ffIT9oUxA+C1Si5K3WTKbxDZ6tWElh3wp3j1WQ2gp/LrsV4BI+V3ubIJsxlhP
	0Pm33BvuGNVNFUkQ//893F+3uIZoCOJ7qmm5zsbpbaJUpFsKRBszcLFoiAIzxZTCIC7BWH7UMSv
	iCTXtkxuEB5OiFs2/EugVeZ3o3E3R900VMtyUtk783u6DB7AoQdGcHwA7JCxt41Iy9KQfcegPzW
	78cRXh0OojSCQvS6tjerkAZtRfHULSH+6GnnunaHK+jdZ2BG49xJeDUinL6psQ+ZLhYInf3lvhI
	oEas/Z7WZMG
X-Received: by 2002:a05:690c:386:b0:812:996f:176f with SMTP id
 00721157ae682-834723c554fmr13228867b3.11.1786587765899; Wed, 12 Aug 2026
 19:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260811090511.1262734-1-ashwin.prabhakar@oss.qualcomm.com>
In-Reply-To: <20260811090511.1262734-1-ashwin.prabhakar@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Aug 2026 19:22:18 -0700
X-Gm-Features: AUfX_mxB6XDYhf0L9viS-Mew9eNEud2Pq-aSnzADOtRO5Zujz7VtoPKohrooBIE
Message-ID: <CAMKF1srEpQ50APyZuoa7XjhjC52wRTLa8HZy2BbUPi9Qs3JOxA@mail.gmail.com>
Subject: Re: [oe] [PATCH] assimp: use CXXFLAGS to suppress GCC 16
 unused-but-set-variable error
To: ashwin.prabhakar@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002586bd0658e461c2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 02:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128931

--0000000000002586bd0658e461c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 2:13=E2=80=AFAM Ashwin Prabhakar via lists.openembe=
dded.org
<ashwin.prabhakar=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> The CMake option -DASSIMP_WARNINGS_AS_ERRORS=3DOFF is not reliably honore=
d
> by the upstream build system, so the build still fails with GCC 16.
> Instead, pass -Wno-error=3Dunused-but-set-variable via CXXFLAGS to
> directly override the compiler behavior regardless of how upstream
> manages -Werror.
>

It seems you have root caused it to a certain extent, I would encourage to
report it upstream as well. We don't want to disable more than what
upstream allows us to


>
> Signed-off-by: Ashwin Prabhakar <ashwin.prabhakar@oss.qualcomm.com>
> ---
>  meta-oe/recipes-graphics/assimp/assimp_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/assimp/assimp_git.bb
> b/meta-oe/recipes-graphics/assimp/assimp_git.bb
> index 4cf2d1f787..32c5cdebb1 100644
> --- a/meta-oe/recipes-graphics/assimp/assimp_git.bb
> +++ b/meta-oe/recipes-graphics/assimp/assimp_git.bb
> @@ -17,10 +17,11 @@ PV =3D "5.x+git${SRCPV}"
>
>  inherit cmake
>
> +CXXFLAGS +=3D "-Wno-error=3Dunused-but-set-variable"
> +
>  EXTRA_OECMAKE =3D "\
>      -DASSIMP_BUILD_ASSIMP_TOOLS=3DOFF \
>      -DASSIMP_BUILD_TESTS=3DOFF \
> -    -DASSIMP_WARNINGS_AS_ERRORS=3DOFF \
>      -DASSIMP_LIB_INSTALL_DIR=3D${baselib} \
>      -DCMAKE_INSTALL_PREFIX=3D${prefix} \
>      -DCMAKE_INSTALL_LIBDIR=3D${baselib} \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128925):
> https://lists.openembedded.org/g/openembedded-devel/message/128925
> Mute This Topic: https://lists.openembedded.org/mt/120699011/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002586bd0658e461c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 11,=
 2026 at 2:13=E2=80=AFAM Ashwin Prabhakar via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;ashwin.prabhakar=3D<a href=3D"m=
ailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.opene=
mbedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The CMake option -DASSIMP_WARNINGS_AS_ERRORS=3DOFF is not reliab=
ly honored<br>
by the upstream build system, so the build still fails with GCC 16.<br>
Instead, pass -Wno-error=3Dunused-but-set-variable via CXXFLAGS to<br>
directly override the compiler behavior regardless of how upstream<br>
manages -Werror.<br></blockquote><div><br></div><div>It seems you have root=
 caused it to a certain extent, I would encourage to report it upstream as =
well. We don&#39;t want to disable more than what upstream allows us to</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Ashwin Prabhakar &lt;<a href=3D"mailto:ashwin.prabhakar@oss.=
qualcomm.com" target=3D"_blank">ashwin.prabhakar@oss.qualcomm.com</a>&gt;<b=
r>
---<br>
=C2=A0meta-oe/recipes-graphics/assimp/<a href=3D"http://assimp_git.bb" rel=
=3D"noreferrer" target=3D"_blank">assimp_git.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-graphics/assimp/<a href=3D"http://assimp_git.b=
b" rel=3D"noreferrer" target=3D"_blank">assimp_git.bb</a> b/meta-oe/recipes=
-graphics/assimp/<a href=3D"http://assimp_git.bb" rel=3D"noreferrer" target=
=3D"_blank">assimp_git.bb</a><br>
index 4cf2d1f787..32c5cdebb1 100644<br>
--- a/meta-oe/recipes-graphics/assimp/<a href=3D"http://assimp_git.bb" rel=
=3D"noreferrer" target=3D"_blank">assimp_git.bb</a><br>
+++ b/meta-oe/recipes-graphics/assimp/<a href=3D"http://assimp_git.bb" rel=
=3D"noreferrer" target=3D"_blank">assimp_git.bb</a><br>
@@ -17,10 +17,11 @@ PV =3D &quot;5.x+git${SRCPV}&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
+CXXFLAGS +=3D &quot;-Wno-error=3Dunused-but-set-variable&quot;<br>
+<br>
=C2=A0EXTRA_OECMAKE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0-DASSIMP_BUILD_ASSIMP_TOOLS=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DASSIMP_BUILD_TESTS=3DOFF \<br>
-=C2=A0 =C2=A0 -DASSIMP_WARNINGS_AS_ERRORS=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DASSIMP_LIB_INSTALL_DIR=3D${baselib} \<br>
=C2=A0 =C2=A0 =C2=A0-DCMAKE_INSTALL_PREFIX=3D${prefix} \<br>
=C2=A0 =C2=A0 =C2=A0-DCMAKE_INSTALL_LIBDIR=3D${baselib} \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128925): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128925" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128925</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120699011/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120699011/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002586bd0658e461c2--


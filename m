Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8931.1792858524121398335
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Oct 2026 09:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JwwpCNAZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b13c7bb0deso11789307b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 09:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792858523; cv=none;
        d=google.com; s=arc-20260327;
        b=Gj/qgilnVBU/hg7GatCawQYurJMjV0hPTN1Df/V9w1vPLpkIO0QZRnitZluI1qV2bi
         cVd6HbTojCUB8ub814dswC8tUt2de3lZgWRdM78IBnwTn6CMgAld742vZRWJIvbgB2K9
         4zfbqp2Kyh9lEvwXVnkfzbjvjDsXZAUKvC92QkimpAWGglxldrLof1XUqUktMcuePUa6
         XOe7MZKsByzR7LdPp9jeIe4MdnnQI+HnaG0INN3z1mwZJ4XwzNDlDLBHw/5qVcBr8fg6
         ZR+5+KYHGvKJUBN3lBx2RH36deYu4gvLVXq1+HvY61X/9DyeeybLLdG+aCbjvsIkG17H
         ebiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s5fvSyTbEeA0J/1NoizduJn3jLU/MpRUcJwtKGwi/Bg=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=Ndhjg2P/tedsU1O2NrZvhwbCpvE6BxPtglKdNOWPMLso78G2lOvQfhtpsh5jbgXapW
         wUmR67XvKRhH1MyyigNBCzdMg1ZOFWua2JLiRYCu/F0MLn3p0St2q/wiAbSEAv+EhoAs
         3W3Hj4o9/uVRsLeGLkVXam3q5AnLkkRXFDJxN7Ig1uZTLSjA6QStpPQVt3vtyY2MU/lE
         liFqJsCqBE5Lm3bik+/Lv3zl+I+iLQvuT4U/e2jINoeVoNTtct3DP0d3m/zUfTirYK7y
         58t7iTusvFsMri5un3YBHolNdEsWO5Rg9meLaHmJBElPzIdAssk/8ZN5o4fbeV1jbjRr
         n50Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858523; x=1793463323; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5fvSyTbEeA0J/1NoizduJn3jLU/MpRUcJwtKGwi/Bg=;
        b=JwwpCNAZA1MJfv3SNJ/UTbNKFwAVV/y+SPax13MO89KBvXFZgHPbVEpn1C8WAYc8YC
         v8gy5o8GraUqmvKYjnnRh/gsuOeWCIJkc0lj5+8/RklFFCtZJI/+qDue/PdkDPsdiCZ8
         7LdFa5wh/cfsIdSAR2QMoHnSywVt8uo3Wrwdi99w192GX3I0l+P8nDYN5wXcsbI5nwpm
         LOb1putxp/tL1FVTqMa9WK4rLY9C4TpWz6Oe7u9XmEr1CkdIspTaDVrew3dvp6gcTax6
         MwBkatCnvb16bwBXBCFpHcm5/dukvzjpJAivBgVuoDJIjOjel+qgXIXTI2RiApvuY6GE
         Hlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858523; x=1793463323;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s5fvSyTbEeA0J/1NoizduJn3jLU/MpRUcJwtKGwi/Bg=;
        b=ry2Ep+/iZg6M0KmiT4rLQYSB8VJG4EYVzFacVOGMFXt9G6EArQu/3njTJ7fUqmlNhy
         GKIYzIPKcqp9cv6Hn9aYAoDaXwOimJ+sPBi8rqyQqR2o3SjfJuEWrjqpzyzgUh2TRF+W
         EtTIdokDHCp8gn/v9CQAnN7jSQ4ZlbkHGfjoZueEd4kRpMj7dj6UJCMAAKhcnAzqLq43
         vNUv2opIwWpjUkMUsZLxrwjJ1coDc+RUjoOKJkVoxBePTiLGJkg6bHQf4Nh3Nv49DQOL
         lPzlJcqxxO1qtj4LEewAxvpMAn6jE1g1IaqT3Wqr++6TCF9vdLMmZGeKSvk5k6GyB939
         lGIA==
X-Gm-Message-State: AFq9FYJFF3nLXdjaAB4qFvbCeOFiuVSrxhZzx9JCiXyLjPukIn9Eu1nX
	Olyz1lQkwllWczmaiwbi0YrGLy3B/UnNDY+3WD/ueCN3jykVr8iwLg1QqHe5F2S6yF74q9a3Sem
	fmar8Hs9dr97HIUgBvoslLLXxZppgku1Fn9GG
X-Gm-Gg: AYBFou3BxDDtrzK4CGrJBtDHYfzLO6LYVSLrdMAmY64CJk0Fq3OBgN1E8h429a9xHA0
	kk7/kLm5dLVSuk/1uTbN5O8gdGS++sVD1MIFBkjcBtPpe+xNjCZPVkT9qpd3BlvmH1fWW0f4eVY
	P/AWcpLCBBLzqEwenvPQ1qL0d07/Cy0UtNSfSBNTwwxoFYlb08mLzOPk8nIvcxWMHZOUC7yYsIM
	ZAmnwbrGaAA7MMXkFW164F9oe2xuKD3jsaq4ZkQ37HD28O9mZD3dFjv0EkB86nTvy627MGKczmy
	o4XkdaKOiCvew/NAjaRUnUiRMkOH8r2jXkRG6w5Z/i89T+wbWjRpDiogmIQO2nNO/Zt+KqJBC/E
	y9guyO14t0+O6xnko+hXp3ZeS/1HybTuGfdHIH59diuAeQAGzC4lLX9YnxDDPMtxgzuOy9v1Dua
	Ss7lBxn207r1oFjULaBTgC3nqIEGYxDodIm29eqhpreu/oJvYJiSHsxsAIJCupbLlXNG6PDcp1N
	Oau+yHOUw62GgD+pw5f1w8qYkyDDl9YoqaYP/3+p/DACtyjE0tgVn+9dWC7yAJp9dwPOGLz7Ar8
	W9e+Z+zGS14HOyQyxiUyeoiB2UAladt4Vvs12eO1zwMSoG25xYaP6B7HADNHIvgzYEjfG4vQdY4
	fBPJtz0MqA1nq8szI2BOW9g==
X-Received: by 2002:a05:690c:9990:b0:8ae:8d28:77ca with SMTP id
 00721157ae682-8b166beb874mr15236897b3.33.1792858523044; Sat, 24 Oct 2026
 09:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20261023174401.3617912-1-leon.anavi@konsulko.com> <20261023174401.3617912-8-leon.anavi@konsulko.com>
In-Reply-To: <20261023174401.3617912-8-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Oct 2026 09:14:56 -0700
X-Gm-Features: AclHuK_K5FjPeSEWOqTd0Cx7CfpWeFNhhjooLeLDk5db98r5FcuvMbNAixmYIfQ
Message-ID: <CAMKF1sqq4K3sa3Ero0L_Ry_GrDnBOG0aS5Ufk1JS3i3_4xuPMQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 8/9] python3-jsonpatch: Upgrade 1.33 -> 1.36
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006611de065e9867b0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 16:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131403

--0000000000006611de065e9867b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch is exactly same patch submitted few days ago where I mentioned
that it has a failure

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1889/ste=
ps/17/logs/warnings

Please address this issue

On Fri, Oct 23, 2026 at 10:44=E2=80=AFAM Leon Anavi via lists.openembedded.=
org
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 1.36:
>
> - Honor optimization=3DFalse when generating patches
> - Preserve the original file when in-place CLI replacement fails
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-jsonpatch_1.33.bb =3D> python3-jsonpatch_1.36.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.33.bb =
=3D>
> python3-jsonpatch_1.36.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.b=
b
> b/meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
> rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
> index 6a1715c6df..3107eddb52 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D4f81c84f9a053e31fe9402a2a4e78864"
>
>  inherit pypi setuptools3
>
> -SRC_URI[sha256sum] =3D
> "9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee731d004e212e1ee5030c"
> +SRC_URI[sha256sum] =3D
> "7e110cb3c5a1c8768f7170bf8fb9887c4aa575fba74c95239e868b494bd9a522"
>
>  RDEPENDS:${PN} +=3D " \
>      python3-json \
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131387):
> https://lists.openembedded.org/g/openembedded-devel/message/131387
> Mute This Topic: https://lists.openembedded.org/mt/121904682/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006611de065e9867b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch is exactly same patch submitted few days ago wh=
ere I mentioned that it has a failure<div><br></div><div><a href=3D"https:/=
/autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1889/steps/17/l=
ogs/warnings">https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/b=
uilds/1889/steps/17/logs/warnings</a></div><div><br></div><div>Please addre=
ss this issue=C2=A0</div></div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 23, 2026 at 10:4=
4=E2=80=AFAM Leon Anavi via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists=
.openembedded.org">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade to release 1.=
36:<br>
<br>
- Honor optimization=3DFalse when generating patches<br>
- Preserve the original file when in-place CLI replacement fails<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-jsonpatch_1.33.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-jsonpatch_1.33.bb</a> =3D&gt; <a href=3D"http://p=
ython3-jsonpatch_1.36.bb" rel=3D"noreferrer" target=3D"_blank">python3-json=
patch_1.36.bb</a>}=C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-jsonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_=
1.33.bb</a> =3D&gt; <a href=3D"http://python3-jsonpatch_1.36.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-jsonpatch_1.36.bb</a>} (80%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
jsonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1=
.33.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
jsonpatch_1.36.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1=
.36.bb</a><br>
similarity index 80%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-j=
sonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.=
33.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-jso=
npatch_1.36.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.36=
.bb</a><br>
index 6a1715c6df..3107eddb52 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
ch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.33.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
ch_1.36.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.36.bb<=
/a><br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4f81c84f9a0=
53e31fe9402a2a4e78864&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-SRC_URI[sha256sum] =3D &quot;9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee7=
31d004e212e1ee5030c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7e110cb3c5a1c8768f7170bf8fb9887c4aa575fba74c9=
5239e868b494bd9a522&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-json \<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131387): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131387" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131387</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121904682/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121904682/1997914</a><br>
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

--0000000000006611de065e9867b0--

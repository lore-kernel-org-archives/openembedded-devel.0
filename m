Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82CDD262AB
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 22:36:02 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19007.1768948553747535933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 14:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JjtrQiC8;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-793fdbb8d3aso18408787b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 14:35:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768948553; cv=none;
        d=google.com; s=arc-20240605;
        b=ii5sZrn6qljI2917xvutFyg+p0EoscTiPRVBa+UgG1zVneRG3ctWzW5TF7nSVSeIk7
         dAz1L+REzklRqNiWntkbs9nzvXBisRV1oc58NYdLQjAXl02PZt+j8uZ5Hj0bBuNQSqP8
         HgX1DNB86Xnpmnd7cpsBHw77pXo0tktUSwgDTp+sm61Ta8jTXSqfsEa70lV7flyyDVwe
         lT87vTOKMrKYNn9U4TWCrnsvEDSEGgdbHsxa+kSVofuvetlCHL6RfS1/maQ6bbx7bvU8
         Qx7q9lcNyZonyAXfFh72AyfrWv242Je3bRfNysB3LPX21GVjcygGWLVmI84nA3NaXcdD
         8Mkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I/0LK6x5gSM3gVC5RluTn4K5P6yAyhLe1icuyUXf6g0=;
        fh=RnZMXDUlwXY8UgMJsCy3860tY0uphmLPDqFPKV9t5MY=;
        b=Cq8xKioF8ZDPR+EXfkMR7XLzGHheMlpbyW90j+pv+5lJkbhPoa4OlUokiPV+uCe4B2
         5QzIviQii+G8igiHSLP/t0PMQ2sgih77wZzZoQTQuAVb8+elqPLUTvd4OGZzd5cRpeC0
         k/9dz6Cz8t3ctUpfPdsooEFTemFF837LVxzT/LMciyqkLxtX6VigamesoWabXwyVt9g6
         rQgHSFKYzHH7xAwjIJRmCBa6z/fGiHQ9eh6m3eRASB89qbmCwk7UJpeZwrURQU4EPLk8
         /w4Emfe9z6XaTMEYYA3nsTGt83sHnrr3/HFj00Z3xjENgXktkseAuSEv2gL1a44Dkr/p
         PhiA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768948553; x=1769553353; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/0LK6x5gSM3gVC5RluTn4K5P6yAyhLe1icuyUXf6g0=;
        b=JjtrQiC89biUO9CVfyXkwTXkE8lFIVgXhB84n/AdEO1yYl5DLa2Y/dKS5+6hocvn35
         X1h6wD9BdZq6X/jCLjI2S+JSgkFhyUPlPwUg77DKvf0nvLgmPBpXsQevLccIVzRASXRu
         EpHMNyjN5xWdA6bKUub5oXp8ltA6n8Bs+yPC7X4Y38CGSyunJRuySLuizAGHyqSgIFuR
         USzOPsB+XLbWL6UD2a7oIBT1kFkjjrq4IotWPe61w9i2qguoTLpsNkCCRXyESL41C5Z0
         tCc34DBBOhydrqkclC4neZN7tu4lIJn/8x2CYAciq2iBC+UgfJNmVVrfgkGH3fPW4GNo
         VOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768948553; x=1769553353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/0LK6x5gSM3gVC5RluTn4K5P6yAyhLe1icuyUXf6g0=;
        b=HH9e9umkxNjyM1rzuhcyGAQk2xAIHEvBNxcjZ4E1gH1JGPxFmQaePLkJq/z4yLUbHQ
         xjHfaTyCINvbpIVOTEGmGSm8Z0nJ/+nLqIOYvGEssza6KkKzdSZANaIZcoUmK6USC5cD
         9mE8H0R6WAIk4O2SbB78wceq1PYXHabzUFDVsnsv4RJo3+0B5SwhsS+1sIkgq76P8AFZ
         sAi88InCgYhHKnROlM0PiKDkKnVk5spNKR7ZNbPOl5l1Bmb2fCXwtUZXyVGYaRMLGBxC
         HqCqGiWNHEWOTX/vz9khsMbQobRzN1dbmUezqWMEeZxScs4qCWX4jgsUHdhgmvcLw5Dl
         Gokg==
X-Gm-Message-State: AOJu0YwNMKsY65J+zW0JLee1IPxZ56+x6/EFZaEdf/n3i+wDudOc4FZt
	WcwfQkfSFEb8rvucrNVMKamG74Bxlf8h1RC1vVfFVf8tLcqB3pt9bbvK3fNkrLRSj7RIndfQ2ra
	23HtpN7VdsGlEdXOgOy15EldvLHay4Zg=
X-Gm-Gg: AZuq6aJDqz/DGEwqjIV8SqnwlagYpBpeRGw3RB4GHHDczuYWb95vP9R7FTN4icVRjwV
	2K0UzlSrRcb33K60cpyJBbOR+OxU+L6WTngpN2IuX+KGjDWWESxiqHDxfQxQ+7T4i3Lx/Ku22YQ
	H5HQhYJwc/KqDJJyjl6D+81y4atQbMm/tjUdx+GAwRSUs1wwGrNbC33efpffY1KOW0dbO2vejHB
	Ee3PulEY0n6srbTRDYpI+UJNakYu3KEtX4yZNHh566uGxOm1jJLYe0V7aSMf4+thhRCEYOuCkRQ
	vQoOZ+77iNjMsxazfPditrfmhDrmb2CbERQBkutrgCvaYjD7ktY8bhAvPv8S/F2vYFSY+sv6nyo
	arLtwMVub9Os2pwo08ALlvRHm6V5RdQApP6rFnZxM0VMCMFFOrQ==
X-Received: by 2002:a05:690c:7408:b0:792:6b2b:44dd with SMTP id
 00721157ae682-793c53c6767mr137643087b3.53.1768948552787; Tue, 20 Jan 2026
 14:35:52 -0800 (PST)
MIME-Version: 1.0
References: <20260120200835.160520-2-frederikbraendstrup@gmail.com>
In-Reply-To: <20260120200835.160520-2-frederikbraendstrup@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Jan 2026 14:35:26 -0800
X-Gm-Features: AZwV_Qj8drz6lk7bwgJmRRhBxXvSBHicK-HfayV7NfRCzaE-eX2p4dHh_5PkXZA
Message-ID: <CAMKF1sq+LTUxQ_G8nh0ykLNy09_i-XyB-EKVVfR0G3Wt8K8HqQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] glaze: improve recipe
To: frederikbraendstrup@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001d6c210648d96ec1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 22:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123681

--0000000000001d6c210648d96ec1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please merge/squash the changes into a single commit and send it as v2,
with description of what changed.

On Tue, Jan 20, 2026 at 12:09=E2=80=AFPM Frederik Br=C3=A6ndstrup via
lists.openembedded.org <frederikbraendstrup=3Dgmail.com@lists.openembedded.=
org>
wrote:

> The initial revision was lacking in some aspects. This is a followup to
> that
>
> Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
> ---
>  meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
> b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
> index f92777a25f..b11176cb52 100644
> --- a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
> +++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
> @@ -1,13 +1,23 @@
> -DESCRIPTION =3D "Extremely fast, in memory, JSON and reflection library =
for
> modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF "
> -HOMEPAGE =3D "https://stephenberry.github.io/glaze/"
> +SUMMARY =3D "Extremely fast, in memory, JSON and reflection library for
> modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF "
> +HOMEPAGE =3D "https://github.com/stephenberry/glaze/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4d29875d83fbbf50485c846dbbb=
ed8"
>
> -SRC_URI =3D "git://
> github.com/stephenberry/glaze;protocol=3Dhttps;branch=3Dmain;tag=3D${PV}
> <http://github.com/stephenberry/glaze;protocol=3Dhttps;branch=3Dmain;tag=
=3D$%7BPV%7D>
> "
> +SRC_URI =3D "git://
> github.com/stephenberry/glaze;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}
> <http://github.com/stephenberry/glaze;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv$%7BPV%7D>
> "
>
>  SRCREV =3D "a4af950700b8af2659f0d4a37a18a1b9c5300593"
>
>  inherit cmake
>
> -EXTRA_OECMAKE =3D "-Dglaze_BUILD_EXAMPLES=3DOFF -DBUILD_TESTING=3DOFF
> -Dglaze_ENABLE_FUZZING=3DOFF"
> +EXTRA_OECMAKE =3D "-Dglaze_BUILD_EXAMPLES=3DOFF -DBUILD_TESTING=3DOFF
> -Dglaze_ENABLE_FUZZING=3DOFF -Dglaze_DEVELOPER_MODE=3DOFF"
>
> +do_install:append() {
> +    install -d ${D}${datadir}/cmake/${BPN}
> +    mv -f ${D}${datadir}/${BPN}/*.cmake ${D}${datadir}/cmake/${BPN}
> +    rmdir -p --ignore-fail-on-non-empty ${D}${datadir}/${BPN}
> +}
> +
> +# Glaze is a header-only C++ library, so the main package will be empty.
> +ALLOW_EMPTY:${PN} =3D "1"
> +
> +BBCLASSEXTEND =3D "native"
> --
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123679):
> https://lists.openembedded.org/g/openembedded-devel/message/123679
> Mute This Topic: https://lists.openembedded.org/mt/117369931/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001d6c210648d96ec1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please merge/squash the changes into a single commit and s=
end it as v2, with description=C2=A0of what changed.</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Jan 20, 2026 at 12:09=E2=80=AFPM Frederik Br=C3=A6ndstrup via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;frederik=
braendstrup=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com=
@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">The initial revision was lacking in some aspects. Th=
is is a followup to<br>
that<br>
<br>
Signed-off-by: Frede Hoey Braendstrup &lt;<a href=3D"mailto:frederikbraends=
trup@gmail.com" target=3D"_blank">frederikbraendstrup@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/glaze/<a href=3D"http://glaze_7.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">glaze_7.0.1.bb</a> | 18 ++++++++++++++---=
-<br>
=C2=A01 file changed, 14 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/glaze/<a href=3D"http://glaze_7.0.1.bb=
" rel=3D"noreferrer" target=3D"_blank">glaze_7.0.1.bb</a> b/meta-oe/recipes=
-support/glaze/<a href=3D"http://glaze_7.0.1.bb" rel=3D"noreferrer" target=
=3D"_blank">glaze_7.0.1.bb</a><br>
index f92777a25f..b11176cb52 100644<br>
--- a/meta-oe/recipes-support/glaze/<a href=3D"http://glaze_7.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">glaze_7.0.1.bb</a><br>
+++ b/meta-oe/recipes-support/glaze/<a href=3D"http://glaze_7.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">glaze_7.0.1.bb</a><br>
@@ -1,13 +1,23 @@<br>
-DESCRIPTION =3D &quot;Extremely fast, in memory, JSON and reflection libra=
ry for modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF &quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://stephenberry.github.io/glaze/" rel=
=3D"noreferrer" target=3D"_blank">https://stephenberry.github.io/glaze/</a>=
&quot;<br>
+SUMMARY =3D &quot;Extremely fast, in memory, JSON and reflection library f=
or modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF &quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/stephenberry/glaze/" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/stephenberry/glaze/</a=
>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dea4d29875d83fbbf50485=
c846dbbbed8&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/stephenberry/glaze;pr=
otocol=3Dhttps;branch=3Dmain;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=3D"=
_blank">github.com/stephenberry/glaze;protocol=3Dhttps;branch=3Dmain;tag=3D=
${PV}</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/stephenberry/glaze;pr=
otocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D=
"_blank">github.com/stephenberry/glaze;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv${PV}</a>&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;a4af950700b8af2659f0d4a37a18a1b9c5300593&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
-EXTRA_OECMAKE =3D &quot;-Dglaze_BUILD_EXAMPLES=3DOFF -DBUILD_TESTING=3DOFF=
 -Dglaze_ENABLE_FUZZING=3DOFF&quot;<br>
+EXTRA_OECMAKE =3D &quot;-Dglaze_BUILD_EXAMPLES=3DOFF -DBUILD_TESTING=3DOFF=
 -Dglaze_ENABLE_FUZZING=3DOFF -Dglaze_DEVELOPER_MODE=3DOFF&quot;<br>
<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 install -d ${D}${datadir}/cmake/${BPN}<br>
+=C2=A0 =C2=A0 mv -f ${D}${datadir}/${BPN}/*.cmake ${D}${datadir}/cmake/${B=
PN}<br>
+=C2=A0 =C2=A0 rmdir -p --ignore-fail-on-non-empty ${D}${datadir}/${BPN}<br=
>
+}<br>
+<br>
+# Glaze is a header-only C++ library, so the main package will be empty.<b=
r>
+ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123679): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123679" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123679</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117369931/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117369931/1997914</a><br>
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

--0000000000001d6c210648d96ec1--


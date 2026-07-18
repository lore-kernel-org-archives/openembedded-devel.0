Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E40C4451B
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 15:54:32 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8339.1784390064625615173
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jul 2026 08:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tAy3PrOm;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81eff3ddba4so8397997b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 08:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784390064; cv=none;
        d=google.com; s=arc-20260327;
        b=Xo/O6n7azGd8/yYELr0WGYdeOEZx+TzunRMKauRz1WWCrxGPHmRTbJR6DA/XO9qtRE
         0BvZi88ENQqj512DMRBUlqaFcv2fpEAGr8w+YcRsePcBuNxW2PQbN+cYifrJMXiBcJN9
         pv+zcVeQ+krytUbBGlWl2jjWxViCDdBMY14/udNLi/+e7+LhN48Mkgj6lAhnv98broRz
         SFGact/XqcBUP8afzeRlUb4cPeQSxYcKYdwufiKGO/Tcw8w4bvrit9wYc6lX5kH2hXBy
         oTSbXdjki/RDWASOcv7VZUZZA4ZMcsbQjM2iOg5j3wc4HwQz2i6yXIj0Z3GTqsDMVXvY
         NHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/zrum2aUbz1uCKkvLjrXN0E8tm0Yc8YoUtR/7Egw9n8=;
        fh=22pJH0TZwvhXLe2PZQi9BZKg7t+YSJYux8BZayreD8I=;
        b=JziGOZqeKshjWpEtjr3gtKvK966Zf/nb7Ni93SOtWwrTx9khGdyxirSQM+Njk0+VCb
         60D55fEGIUMUukVdm9mkzRGMADB8t5kbVQwwHqscLPBnUtk5fVqH/IxbAWFOCpdPNVIx
         NPYWgb88uNPmeAZgnbdbOC8wZUjBWMYFVLxfqgOXvTmvDfKLHtP26bKoSzhT+yXuIbmh
         bxx9LvUtZ/XylHPxQKpkuXRpAO1vZBUNf+/qmBlKFOBe1PafiNktfsCYAeblTpmvFApe
         TlenkfYbieHlY3SRGOvHOaG1a/PaqBZXUcPAhQ+zl05lJIJkVBtti/ZyBIKaP9xxCwcR
         QY4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784390064; x=1784994864; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zrum2aUbz1uCKkvLjrXN0E8tm0Yc8YoUtR/7Egw9n8=;
        b=tAy3PrOmAVJfs9stRtNRRjsc2XcYOoGPZfOoKO0Sy0bwNn9LDApSX6qLQ9AIyVP+Nb
         0P/Tl+8Yg8JAJEptLjOnj6mKJC6D5TWfjIiJ12qISfVrEvlvLLEx2/xJfyUmCBVxxx1F
         ZrIVkCiJVuJ9q4wuzdvISGeqUf9c6TTH5z33qKm+gdJf5hrLnF0QSoTxZUsYybFuU2OZ
         aLrbCEUm4PSde3Vmp5EQaV+jdkdMlOFLLm2ueAoT21Jufw1hDRT1XnnutyGiP0ZX/SmN
         aMpl7jN9C0rmCHqHoxqHdVvCOgEilLauiy0neetQqKSx+gy8lpjz3lFMbQDjF6D3l0ax
         PO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784390064; x=1784994864;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zrum2aUbz1uCKkvLjrXN0E8tm0Yc8YoUtR/7Egw9n8=;
        b=k3Lhx/FW4EJfLM5sEnegTGLsGpGSZ88yC2IyhEn3EAV1SKhLu5wZNZCZh+V5coeyB2
         lJHmCNleUxolspCfv/MvDBwE7yQZU17rnROPMhYscCj089N2X1aLZ5ffL8/4e+y1IrL7
         SHtmHENNzoM9DL1pNeB832B30GqLjfq9a+sSB3qUgmBBqxEZimTQgdLzo7XYIpRrKpSt
         kWKMymfGhqxcB/JDAsTmqlRFZ77FAba+jOxN4SkZQw4ooVlu54boLiLCusyB3YkGBpYZ
         basVKncH/vrHUVtmULUrplvTmBnoC5s/n3gaDbhSoS+r6BIEIQ85eONaxipMTuftoBq5
         SmRw==
X-Gm-Message-State: AOJu0YwRR/dGh1fPGZ35o7vrhyBvNLbyfv0JBZrLjMDskzqQzNPHtn40
	Pc1NmOVNKRN0xHv7umKxagbdMVlBYkFi/Dplw3NGVcUmWuOx1BoJZSiD3CstffQ+qWCL+GWOMW9
	rJrG2T0Dpd/doadfw17AKLOyHrnUCgyvfH3Ru
X-Gm-Gg: AfdE7clt8FLNuSlSxyPQz7u1wdu77i9BawdLvj5gvJ6mkKvzwM5lBbL6wHLRs201XBc
	N6FdgWHNggJ3ZvM4Lir6cNrkFAIhYb08WnnlopNDPzpCujxeLNG/kwWRDSIos5+wL9NgEaQK4Z3
	6Ik/JFUGVmRPl9cG2FAw6UC63VVwLt3iaIu6+VNyg7w5AjiDPFGS96Q7rlutznUx8uZbQY2azal
	JLZwMmCku0vTzRDKfhavXtiXtMsiwU7YdfDPlSwCTREeWfBbnLTf32bAd2Ol9aNW4bpxZF42Tmm
	4YbrdSPIxkC7qqPa1AvRDkT/VqZxpPwBGn3DuyVYU4D5pjKvN1mR7Dvf/AMMvNBcwKdiEJvPWzG
	4ZGyzrOa//t7415ox1c9/9woENeEZyARnzV3a19ZfmfKvLRd39C9rS24djyw=
X-Received: by 2002:a05:690c:e1c:b0:81e:ae6d:cadb with SMTP id
 00721157ae682-81ef25a2692mr26810177b3.7.1784390063603; Sat, 18 Jul 2026
 08:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260717064109.50778-1-lianux.wang@processmission.com>
In-Reply-To: <20260717064109.50778-1-lianux.wang@processmission.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Jul 2026 08:53:57 -0700
X-Gm-Features: AUfX_mwurfFdb1ufUywdd_pTEDQoVKYm2uVRS3QPUgXcXYafqbbyzVhDZjUe-0U
Message-ID: <CAMKF1spYi5Cht8E4ShYqnfuVbpaD=PjQ8wVbwoMnagL74MFxHw@mail.gmail.com>
Subject: Re: [oe] [oe-devel][master][PATCH] wolfssl: upgrade 5.9.1 -> 5.9.2
To: lianux.mm@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Lian Wang <lianux.wang@processmission.com>
Content-Type: multipart/alternative; boundary="000000000000e1c77e0656e4af26"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 15:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128256

--000000000000e1c77e0656e4af26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seeing this

https://errors.yoctoproject.org/Errors/Details/950825/

Please investigate.

On Thu, Jul 16, 2026 at 11:41=E2=80=AFPM wang lian via lists.openembedded.o=
rg <
lianux.mm=3Dgmail.com@lists.openembedded.org> wrote:

> - Update SRCREV to v5.9.2-stable tag
> - All security fixes from 5.9.2 release included
>
> Signed-off-by: Lian Wang <lianux.wang@processmission.com>
> ---
>  .../wolfssl/{wolfssl_5.9.1.bb =3D> wolfssl_5.9.2.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.9.1.bb =
=3D>
> wolfssl_5.9.2.bb} (98%)
>
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.b=
b
> b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
> similarity index 98%
> rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
> rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
> index 2978ff1..9834c22 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
> @@ -17,7 +17,7 @@ SRC_URI =3D " \
>      file://run-ptest \
>  "
>
> -SRCREV =3D "1d363f3adceba9d1478230ede476a37b0dcdef24"
> +SRCREV =3D "a82476d144290bf6a786607a16c224acff63d882"
>
>
>  inherit autotools ptest
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128246):
> https://lists.openembedded.org/g/openembedded-devel/message/128246
> Mute This Topic: https://lists.openembedded.org/mt/120311285/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e1c77e0656e4af26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">seeing this=C2=A0<div><br></div><div><a href=3D"https://er=
rors.yoctoproject.org/Errors/Details/950825/">https://errors.yoctoproject.o=
rg/Errors/Details/950825/</a></div><div><br></div><div>Please investigate.<=
/div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Jul 16, 2026 at 11:41=E2=80=AFPM wang li=
an via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a>=
 &lt;<a href=3D"http://lianux.mm">lianux.mm</a>=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">- Update SRCREV =
to v5.9.2-stable tag<br>
- All security fixes from 5.9.2 release included<br>
<br>
Signed-off-by: Lian Wang &lt;<a href=3D"mailto:lianux.wang@processmission.c=
om" target=3D"_blank">lianux.wang@processmission.com</a>&gt;<br>
---<br>
=C2=A0.../wolfssl/{<a href=3D"http://wolfssl_5.9.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">wolfssl_5.9.1.bb</a> =3D&gt; <a href=3D"http://wolfssl_5.9=
.2.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.9.2.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-networking/recipes-connectivity/wolfssl/{<a href=3D"http:=
//wolfssl_5.9.1.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.9.1.bb</=
a> =3D&gt; <a href=3D"http://wolfssl_5.9.2.bb" rel=3D"noreferrer" target=3D=
"_blank">wolfssl_5.9.2.bb</a>} (98%)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/wolfssl/<a href=3D"http:/=
/wolfssl_5.9.1.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.9.1.bb</a=
> b/meta-networking/recipes-connectivity/wolfssl/<a href=3D"http://wolfssl_=
5.9.2.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.9.2.bb</a><br>
similarity index 98%<br>
rename from meta-networking/recipes-connectivity/wolfssl/<a href=3D"http://=
wolfssl_5.9.1.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.9.1.bb</a>=
<br>
rename to meta-networking/recipes-connectivity/wolfssl/<a href=3D"http://wo=
lfssl_5.9.2.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.9.2.bb</a><b=
r>
index 2978ff1..9834c22 100644<br>
--- a/meta-networking/recipes-connectivity/wolfssl/<a href=3D"http://wolfss=
l_5.9.1.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.9.1.bb</a><br>
+++ b/meta-networking/recipes-connectivity/wolfssl/<a href=3D"http://wolfss=
l_5.9.2.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.9.2.bb</a><br>
@@ -17,7 +17,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;1d363f3adceba9d1478230ede476a37b0dcdef24&quot;<br>
+SRCREV =3D &quot;a82476d144290bf6a786607a16c224acff63d882&quot;<br>
<br>
<br>
=C2=A0inherit autotools ptest<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128246): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128246" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128246</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120311285/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120311285/1997914</a><br>
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

--000000000000e1c77e0656e4af26--


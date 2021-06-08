Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.9103.1623135076127929756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rviW3OlL;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id ba2so21530438edb.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=stPGaJvHtl14iutAm5x4sUec8K+7DGWiGX9OMakB4gs=;
        b=rviW3OlLKa85HzjHxYggzly3py/GUM+lRY/5RkxwZ1G1rhtqjrr29xgLNxX5574OTP
         lEaWpA7AdMHgXBSqcmRMPGjO4vQ9uGjmJaiGIDYs8IfkFJrwib2IpzUruaHsNJ/xFZBf
         QJKSY0NRB8L0OaR9Gy/xBOpQuN17D6znid28Imngg90t05XpRTFa9aN3iHKIhsQyfwfP
         EGlk3WDt0I7juRL/+vmayKEdaNVCiUSLfJY7sub09pvjy6DIkU/2Iul1FHKaWxg0v8dx
         BbvgNAUhXmGWh9C12lp78iSE0vyqARboY0eXpDbegeP8uAutn5veHGUdGjMnm8f8KrLR
         YuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=stPGaJvHtl14iutAm5x4sUec8K+7DGWiGX9OMakB4gs=;
        b=L5CnuO550bMVheTXggUlEJqliyD8cSVboujG1WlOTLLcnGhZ2R3sYRZ+LYJADqb6+B
         uSHL6NP1GKlifELqlAKASP4saYZOEelMU4yyyiRCQ7ZPKNVw1gowPpI2rknQkN1VEkYz
         EzrlH4H4nW7rJwmYBPxZQNhKdKRNV2O4jGjTTenBrWKLzu2xjykSSs5yBbXbQpFkDaQ6
         sLhc86xU/v0QzaawDw1xFf4vsKsyR4TvGvEQYuUKpiqDxN9XQuu4XCYsHWTSmb5/ZQ7I
         qOK8/tEZ5r7DurY38luLiUUQXxV0iSi3ef4SJLg4o0eBkrLb0BlbZf3jMmlGQ5VGL8rr
         rVCg==
X-Gm-Message-State: AOAM5300AOflqUPN63yoZTYuNhpTzuenHiaRXd7OfWmnl/a4LQy7IhIC
	r53Js24wjshN/dd1S6nkk/FbP5zLYU8RISNtC6M=
X-Google-Smtp-Source: ABdhPJwJihlMI8Exxhqx/oSprhSQ9sRylszflR9Nk/VmKrymxmw6NfjX3uOHQ08NIy3CY8W9dNkxc4ZhJLp5zsWmcaM=
X-Received: by 2002:a05:6402:1609:: with SMTP id f9mr23500488edv.76.1623135074507;
 Mon, 07 Jun 2021 23:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <1623128205-11332-1-git-send-email-akash.hadke@kpit.com>
In-Reply-To: <1623128205-11332-1-git-send-email-akash.hadke@kpit.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 8 Jun 2021 08:51:03 +0200
Message-ID: <CA+chaQcW68dp9R8niR8gSfK5wOzgTpEPa3=A5H6ezMvRHP2sVA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] ostree: switch from BBFILE_COLLECTIONS to PTEST_ENABLED for ptest support
To: akash hadke <akash.hadke@kpit.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, 
	Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>, Mikko Rapeli <mikko.rapeli@bmw.de>
Content-Type: multipart/alternative; boundary="00000000000089e11805c43b959a"

--00000000000089e11805c43b959a
Content-Type: text/plain; charset="UTF-8"

NAK, this change is wrong, see how it looks in newer meta-oe:
https://git.openembedded.org/meta-openembedded/commit/?id=f6df0263f768108db5c5b8c098ef0d4c699841a4

On Tue, Jun 8, 2021 at 6:57 AM akash hadke <akash.hadke@kpit.com> wrote:

> From: Mikko Rapeli <mikko.rapeli@bmw.de>
>
> Just including a layer, like meta-python, should not change the way the
> recipes
> compile. Instead, if ptest support is enabled, then require the python
> dependency
> for running ptests in ostree. Fixes yocto-check-layer error.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> Signed-off-by: akash hadke <akash.hadke@kpit.com>
> ---
>  meta-oe/recipes-extended/ostree/ostree_2020.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
> b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
> index 8640745..e13bb1f 100644
> --- a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
> +++ b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
> @@ -176,7 +176,7 @@ RDEPENDS_${PN}-ptest += " \
>      util-linux \
>      xz \
>      ${PN}-trivial-httpd \
> -    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-python',
> 'python3-pyyaml', '', d)} \
> +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'python3-pyyaml', '', d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'gjs', 'gjs', '', d)} \
>  "
>  RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils
> glibc-localedata-en-us"
> --
> 2.7.4
>
>
> 
>
>

--00000000000089e11805c43b959a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">NAK, this change is wrong, see how it looks in newer meta-=
oe:<div><a href=3D"https://git.openembedded.org/meta-openembedded/commit/?i=
d=3Df6df0263f768108db5c5b8c098ef0d4c699841a4">https://git.openembedded.org/=
meta-openembedded/commit/?id=3Df6df0263f768108db5c5b8c098ef0d4c699841a4</a>=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Jun 8, 2021 at 6:57 AM akash hadke &lt;<a href=3D"mailto:=
akash.hadke@kpit.com">akash.hadke@kpit.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">From: Mikko Rapeli &lt;<a href=3D=
"mailto:mikko.rapeli@bmw.de" target=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<=
br>
<br>
Just including a layer, like meta-python, should not change the way the re=
cipes<br>
compile. Instead, if ptest support is enabled, then require the python dep=
endency<br>
for running ptests in ostree. Fixes yocto-check-layer error.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" tar=
get=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
Signed-off-by: akash hadke &lt;<a href=3D"mailto:akash.hadke@kpit.com" tar=
get=3D"_blank">akash.hadke@kpit.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/ostree/<a href=3D"http://ostree_2020.3.bb" =
rel=3D"noreferrer" target=3D"_blank">ostree_2020.3.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-extended/ostree/<a href=3D"http://ostree_2020=
.3.bb" rel=3D"noreferrer" target=3D"_blank">ostree_2020.3.bb</a> b/meta-oe/=
recipes-extended/ostree/<a href=3D"http://ostree_2020.3.bb" rel=3D"noreferr=
er" target=3D"_blank">ostree_2020.3.bb</a><br>
index 8640745..e13bb1f 100644<br>
--- a/meta-oe/recipes-extended/ostree/<a href=3D"http://ostree_2020.3.bb" =
rel=3D"noreferrer" target=3D"_blank">ostree_2020.3.bb</a><br>
+++ b/meta-oe/recipes-extended/ostree/<a href=3D"http://ostree_2020.3.bb" =
rel=3D"noreferrer" target=3D"_blank">ostree_2020.3.bb</a><br>
@@ -176,7 +176,7 @@ RDEPENDS_${PN}-ptest +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0util-linux \<br>
=C2=A0 =C2=A0 =C2=A0xz \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-trivial-httpd \<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;BBFILE_COLLECTIONS&#39;, &#39;met=
a-python&#39;, &#39;python3-pyyaml&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;, =
&#39;python3-pyyaml&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;gjs=
&#39;, &#39;gjs&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
=C2=A0RDEPENDS_${PN}-ptest_append_libc-glibc =3D &quot; glibc-utils glibc-=
localedata-en-us&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000089e11805c43b959a--

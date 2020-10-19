Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.12169.1603110134081542383
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 05:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=quXDuA4U;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id qp15so13606762ejb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Va4BcVYGwRLm0e8MI5cwVPNrH0fSXo2OLFt9A0rBV88=;
        b=quXDuA4UrSpI6cP9kE5oC21kpcL5ISzU7kAoWnTIWjmcgKZRxAy2RjV3NQ5c3pqfcM
         ClKSsGMjpi4NCH1TMbCX+WP90JUIT6GTvPFFa/Kk9Htbrnl8D6IwayICwgoLjMuhWRzE
         cVcH8lBaIYOzusBDHg1CpFRwaJoCj47x2UtrKqlXae+pity7ixvFi53c6rmTk0bwv/wg
         eO2cGhrNKnQx10CfeKvQz/KJopTisKKWC6dFyQQiPg7NlP3LiMcDfgu7BddCw1nGtgg2
         p+KGZNxIAeMXCfCKzeAHIWMuLbAoYK9f3zALba5GuYUpj2l8ApV+7lTTCdtccc8duJl+
         okWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Va4BcVYGwRLm0e8MI5cwVPNrH0fSXo2OLFt9A0rBV88=;
        b=IHEcR6hDg0nlNnA8hpeczCjmbwOlhubwnnf7T0VRoC1wB9tquG4NkZ+kvOnaYPOb35
         9HpeBCl7Yv9XcT1O0NSFErUpYjVNVt3SD0BTJ/xQdIArcmFWhRh7G9iSEgTyUq35WIsA
         ewiASv2RvGsjEm7kUZrNZ35JbBEYDERtkv1cJ9k4Jl5ENpsaDZ3go7ggxMEIqIVEpL8S
         qNqdvuhT4b8I1UsQPhDGE9Z1maqVtqNZY1WVyWN4sSlKc1VNPeBWkRaF1ftMMITwTfb7
         6defs1xcvScGzMgxQoZr9+h7IvN4tE7NR5MbL7exExhM+DXm1tgn1Hs7YgdTdtplNNk9
         kmQQ==
X-Gm-Message-State: AOAM533avyuKV84v33W6xHKrtqCetLVnT59dGO0ov4fqNoymJv2Dr5cg
	C/iTzrjNmMwThxfvAbwsPpo8579C6nYqmKPdGjs=
X-Google-Smtp-Source: ABdhPJxg6ju9NcZUOpEP/cSxJAoen78eG9ZtD62UcLbvM6LcuxKRby7FqyDrA+HPoc2Wne+LCy4xw+UpAyNJe/y5myc=
X-Received: by 2002:a17:906:bc57:: with SMTP id s23mr16846372ejv.94.1603110132540;
 Mon, 19 Oct 2020 05:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201016143742.23076-1-ticotimo@gmail.com>
In-Reply-To: <20201016143742.23076-1-ticotimo@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 19 Oct 2020 14:22:01 +0200
Message-ID: <CA+chaQctGbV_5AEqOoFvpmVHDijKKJCd6yX8kRTB+wutetqgLA@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] conf/layer.conf: LAYERSERIES_COMPAT gatesgarth
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fc6a3e05b205294c"

--000000000000fc6a3e05b205294c
Content-Type: text/plain; charset="UTF-8"

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Currently the last layer in my mix for LuneOS which doesn't parse until
this hits master branch.

Please merge it soon.

On Fri, Oct 16, 2020 at 4:37 PM Tim Orling <ticotimo@gmail.com> wrote:

> In preparation for the release of Yocto Project 3.2,
> "gatesgarth", change development branch to be only
> compatible with the new release.
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index b25c9ef9..a5738d96 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -14,6 +14,6 @@ LAYERVERSION_meta-python2 = "1"
>
>  LAYERDEPENDS_meta-python2 = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_meta-python2 = "dunfell"
> +LAYERSERIES_COMPAT_meta-python2 = "gatesgarth"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
> --
> 2.25.0
>
>
> 
>
>

--000000000000fc6a3e05b205294c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a>&gt;<br><div><br></div><div>Currently =
the last layer in my mix for LuneOS which doesn&#39;t parse until this hits=
 master branch.</div><div><br></div><div>Please merge it soon.</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 Oct 16, 2020 at 4:37 PM Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.co=
m">ticotimo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">In preparation for the release of Yocto Project 3.2,<b=
r>
&quot;gatesgarth&quot;, change development branch to be only<br>
compatible with the new release.<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=
=
=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
---<br>
=C2=A0conf/layer.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index b25c9ef9..a5738d96 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python2 =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_meta-python2 =3D &quot;core openembedded-layer&quot;<br=
>
<br>
-LAYERSERIES_COMPAT_meta-python2 =3D &quot;dunfell&quot;<br>
+LAYERSERIES_COMPAT_meta-python2 =3D &quot;gatesgarth&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
-- <br>
2.25.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000fc6a3e05b205294c--

Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9CCFA373D
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 01:57:53 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.1721.1666922271659623190
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 18:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pwZqXfL6;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id f27so9754064eje.1
        for <Openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 18:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NLV/fOJfM4b/PHQyAC8ujqR2Q0zNmgTNG3ty+/gf6K4=;
        b=pwZqXfL6rXaErGWNl7x6xTz8lZuewfDehx3Xlri0j4AX+G7hoM4B/RTD1LHFPweCrG
         dtwpW2qcfNH08042L+moNux7xib78eiO5ul7xbu2q1aud9H8EvGhKI+oDtV7jXNxUBXJ
         c8jw+L6zEJqTqMfR8S1sD2aRs6lJ2TxaSpTrpzPkB1vzidbhKOks8cGrfUEYSBuco07E
         mofhw3xZk47BCyZ45jfpr/ZaqztLhDPAfm6Wcy1I9APKgHn+LJ/dlIbpV61fLJrTfCtn
         J7l/lWEbtbOjHzjAzRj1Y/D9hR+N+T+CWUtc1pimfbCTuQuOy8e3jxDSbbY1hlbI3oDt
         skMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLV/fOJfM4b/PHQyAC8ujqR2Q0zNmgTNG3ty+/gf6K4=;
        b=ZMugWO7IO4mif+qvSVM1vqSrLQLzmpoBJoVB3AYaXJg7c9xoskZuD1WjGj2V1oc8QJ
         ieSc6NVavPdTTNuIs5VfrKlM+xDwyI4rcf6A58RPFMBAACJPSKiQ8EawshLVn7QfkZ+J
         rYjFykLMsYuzGwT2R1iech/p5YlSAGSDPUl4JeFQCyChVNqZE8IPH2rGo6MpTWYkJJZF
         fgcJiq78F4k+Nidnh+TGEPJsJwosl5+Bkz17DwDE82uVH6+uCzP368U9lo9p7uxSU3C6
         YrCLargiADhsczyWmxvAyvET2/6wtkXQx979mj0hUxazqsAWrmtxfra1YkKnNuV7YGJX
         choQ==
X-Gm-Message-State: ACrzQf2MI1Ch3fEbMiWknY7lXlj68tCTTf/5GvAuba+3rmz5EGKqnUB3
	bgo8OC0/J4EZVBGH/MRFgaafkIYq2WjTke7BIfs=
X-Google-Smtp-Source: AMsMyM55/7Ezw63CwW3yICDIQlw42czAtGTM+75hvWLSUFkdYXxHJUUPO/EgQ/6VqDCVjWXBGPyJGT1ijA1K31bwwFE=
X-Received: by 2002:a17:906:cc10:b0:78d:f741:9d87 with SMTP id
 ml16-20020a170906cc1000b0078df7419d87mr44747739ejb.295.1666922270092; Thu, 27
 Oct 2022 18:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221027142043.177983-1-JPEWhacker@gmail.com> <20221027173334.312517-1-JPEWhacker@gmail.com>
In-Reply-To: <20221027173334.312517-1-JPEWhacker@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 27 Oct 2022 18:57:39 -0700
Message-ID: <CANx9H-BFKJQT8tOoEfyi03Wwp46kfZPYRe9VRTvoM62uNH3HBg@mail.gmail.com>
Subject: Re: [oe][meta-webserver][PATCH v2] meta-webserver: nginx: Add ipv6 support
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c6f04b05ec0e955e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 01:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99326

--000000000000c6f04b05ec0e955e
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 10:33 AM Joshua Watt <JPEWhacker@gmail.com> wrote:

> Adds a PACKAGECONFIG to enable ipv6 in nginx
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index dfced3330..260f5f320 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -37,12 +37,13 @@ NGINX_USER   ?= "www"
>  EXTRA_OECONF = ""
>  DISABLE_STATIC = ""
>
> -PACKAGECONFIG ??= "ssl"
> +PACKAGECONFIG ??= "ssl ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"


much better, I was also going to suggest this

>
>
>  PACKAGECONFIG[gunzip] = "--with-http_gunzip_module,,"
>  PACKAGECONFIG[http2] = "--with-http_v2_module,,"
>  PACKAGECONFIG[ssl] = "--with-http_ssl_module,,openssl"
>  PACKAGECONFIG[http-auth-request] = "--with-http_auth_request_module,,"
> +PACKAGECONFIG[ipv6] = "--with-ipv6,,"
>
>  do_configure () {
>      if [ "${SITEINFO_BITS}" = "64" ]; then
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99325):
> https://lists.openembedded.org/g/openembedded-devel/message/99325
> Mute This Topic: https://lists.openembedded.org/mt/94609597/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c6f04b05ec0e955e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 27, 2022 at 10:33 AM Joshua Watt &lt;<a href=3D=
"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)">Adds a PACKAGECONFIG to enable ipv6 in nginx<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/=
recipes-httpd/nginx/nginx.inc<br>
index dfced3330..260f5f320 100644<br>
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc<br>
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc<br>
@@ -37,12 +37,13 @@ NGINX_USER=C2=A0 =C2=A0?=3D &quot;www&quot;<br>
=C2=A0EXTRA_OECONF =3D &quot;&quot;<br>
=C2=A0DISABLE_STATIC =3D &quot;&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;ssl&quot;<br>
+PACKAGECONFIG ??=3D &quot;ssl ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;=
, &#39;ipv6&#39;, d)}&quot;</blockquote><div dir=3D"auto"><br></div><div di=
r=3D"auto">much better, I was also going to suggest this</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,20=
4)" dir=3D"auto"><br>
<br>
=C2=A0PACKAGECONFIG[gunzip] =3D &quot;--with-http_gunzip_module,,&quot;<br>
=C2=A0PACKAGECONFIG[http2] =3D &quot;--with-http_v2_module,,&quot;<br>
=C2=A0PACKAGECONFIG[ssl] =3D &quot;--with-http_ssl_module,,openssl&quot;<br=
>
=C2=A0PACKAGECONFIG[http-auth-request] =3D &quot;--with-http_auth_request_m=
odule,,&quot;<br>
+PACKAGECONFIG[ipv6] =3D &quot;--with-ipv6,,&quot;<br>
<br>
=C2=A0do_configure () {<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;${SITEINFO_BITS}&quot; =3D &quot;64&quot; ];=
 then<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99325): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99325" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99325</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94609597/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94609597/924729</a><br>
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

--000000000000c6f04b05ec0e955e--


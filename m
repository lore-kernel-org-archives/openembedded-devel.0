Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.107742.1597916229286679854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 02:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hbAn3YWn;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id qc22so1719609ejb.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 02:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=og3Hta4momE6Li2zQXSX5QNDELQ5ZHTdf8+14xbillg=;
        b=hbAn3YWnAfJLgOQlcw7yWTj1Jo+07DWXcPJm/2RYt0dheWH+C6WVDoPUeDPvMTcXGu
         jMv7g+I3TeWt6G/P4yTqJArwPkJ7Onx6WDe2Ybz3l6g/fWPIWTis/BVem4BdGQ+CLta+
         9nozjlWJX5qJbxDCuwJmpS/wbg8ZuJyty/HjbpN1YKHUsXNeXXjRggrZV2NELvyI2ou/
         ST9PWbAETy/Ypm8nrfvEGZ93SYtyXR56bBdzr3Exi7RUMfIwbKlU3wgc0DvZBSS0m4er
         E1afwJFaRGkUM8OWSZ3MSFVKZZjVlNSC0fzXrrB2DedzUmw4MHsCYEtr/5ic7F5BjkJ+
         595w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=og3Hta4momE6Li2zQXSX5QNDELQ5ZHTdf8+14xbillg=;
        b=LQZxFzI7OvkS5dOf0NqQIibsphTzrTWbgU5HhGL1izotEWz63Ls4uVxhAIggyDfH04
         YDEVEpStRIi/2aI6LqgNIv/iLC1M2p5vFpzzOwQ35XB9lcLaZwMQw+bsMm5XYnicwG6B
         ajEGiaZOiWjj7L/OcYCiLOuFIEDH3LNxkM0FB+TCceyl3b7zO4qjnZIS/vmHrXapyjyQ
         iPIpFm7m10lLRvCFZa7YPXKaJl+5tRa4J5ehFY12HoG6PeSVuldAU0RRRAbef1dbjU9r
         /2uV0hPHD/h/fc5tGigDK/YLzdyTgVSPZ006mxxCr5mYqHF5c/3ix0c/M/pWqX4mKYLw
         smQw==
X-Gm-Message-State: AOAM5327u6Ui3qDEudP63IezPwlR9sNl8LQ0eTITx9EdqiswkCrnFx28
	0pLo4K+zz07olqXUpJniB7pXK2nTP8luBRYghjg=
X-Google-Smtp-Source: ABdhPJyZ6Sg0xA5kVlzFVhGhFIOT93xh4kmw4+ZwxWaINd8g40sxcPlSLHOfAQaauPM3urj1v+rRSrY1p/AmFn3C9NM=
X-Received: by 2002:a17:906:bc9a:: with SMTP id lv26mr2310105ejb.392.1597916227589;
 Thu, 20 Aug 2020 02:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200820085406.2785032-1-raj.khem@gmail.com>
In-Reply-To: <20200820085406.2785032-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2020 11:36:56 +0200
Message-ID: <CA+chaQdzEZXfO67425dmj-Ozit6VqkYOWHkX4QWf+7rX5rPKDQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] valijson: Move it to networking-layer under BBFILES_DYNAMIC
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Content-Type: multipart/alternative; boundary="000000000000205ace05ad4bdd5c"

--000000000000205ace05ad4bdd5c
Content-Type: text/plain; charset="UTF-8"

It needs to be moved also to:
meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend

Will send v2.

But thanks Khem for updating it quickly!

On Thu, Aug 20, 2020 at 10:54 AM Khem Raj <raj.khem@gmail.com> wrote:

> it has a hard dependency on curlpp package which comes from
> meta-networking
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta-oe/conf/layer.conf                                          | 1 +
>  .../networking-layer}/recipes-devtools/valijson/valijson_0.3.bb  | 0
>  2 files changed, 1 insertion(+)
>  rename meta-oe/{ =>
> dynamic-layers/networking-layer}/recipes-devtools/valijson/valijson_0.3.bb
> (100%)
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 5bf1f6cfd9..5178678da2 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -27,6 +27,7 @@ BBFILE_PRIORITY_openembedded-layer = "6"
>  # to ensure yocto compatibility check pass
>  BBFILES_DYNAMIC += " \
>  meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
> +networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*.bb
> \
>  perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \
>  "
>
> diff --git a/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
> b/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/
> valijson_0.3.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/valijson/valijson_0.3.bb
> rename to
> meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/
> valijson_0.3.bb
> --
> 2.28.0
>
>

--000000000000205ace05ad4bdd5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It needs to be moved also to:</div>meta-oe/dynamic-la=
yers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbapp=
end<br><div><br></div><div>Will send v2.</div><div><br></div><div>But thank=
s Khem for updating it quickly!</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 20, 2020 at 10:54 AM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">it has a ha=
rd dependency on curlpp package which comes from<br>
meta-networking<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt;<br>
Cc: Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk=
.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0.../networking-layer}/recipes-devtools/valijson/<a href=3D"http://val=
ijson_0.3.bb" rel=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a>=C2=
=A0 | 0<br>
=C2=A02 files changed, 1 insertion(+)<br>
=C2=A0rename meta-oe/{ =3D&gt; dynamic-layers/networking-layer}/recipes-dev=
tools/valijson/<a href=3D"http://valijson_0.3.bb" rel=3D"noreferrer" target=
=3D"_blank">valijson_0.3.bb</a> (100%)<br>
<br>
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf<br>
index 5bf1f6cfd9..5178678da2 100644<br>
--- a/meta-oe/conf/layer.conf<br>
+++ b/meta-oe/conf/layer.conf<br>
@@ -27,6 +27,7 @@ BBFILE_PRIORITY_openembedded-layer =3D &quot;6&quot;<br>
=C2=A0# to ensure yocto compatibility check pass<br>
=C2=A0BBFILES_DYNAMIC +=3D &quot; \<br>
=C2=A0meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \=
<br>
+networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*=
.bb \<br>
=C2=A0perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \<b=
r>
=C2=A0&quot;<br>
<br>
diff --git a/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_0=
.3.bb" rel=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a> b/meta-oe/d=
ynamic-layers/networking-layer/recipes-devtools/valijson/<a href=3D"http://=
valijson_0.3.bb" rel=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a><b=
r>
similarity index 100%<br>
rename from meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_0.=
3.bb" rel=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a><br>
rename to meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson=
/<a href=3D"http://valijson_0.3.bb" rel=3D"noreferrer" target=3D"_blank">va=
lijson_0.3.bb</a><br>
-- <br>
2.28.0<br>
<br>
</blockquote></div>

--000000000000205ace05ad4bdd5c--

Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.7743.1614688968612378887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 04:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CfXzjKzZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id mj10so14877257ejb.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 04:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sMFV08hekdbEwG7jP+yEsfwlMQcqH0rTmaNwYWffr/I=;
        b=CfXzjKzZxYUtlTcGtV7hc3XIxzy8hhqLu0pnWoGsuNmZ3E68K19anBytytliXU7Sz5
         KIFW7ApBy4Tm6VxhpSDXCM3Qmd+ER2ZLt56ffMj691Q1hP/NSen4r2erxLN7X5ql2qIH
         pitAocHUV1xvfI9RKCZIYiWkO9Z2hLBhw6D2puxqRnaqaF8UHvVw4LOEDddt3GCkt0Jc
         O7lU1/2NDYbjXrUQJ0J6C/x8T9Ysjmchi+W4wtI0J52adNzlrXWw30QWzZB6Tc4H90cR
         8JfIc62+tubdFLf3wUrM7Y6S3IbWOGecJ2JmqRooC18YPdThH/NNoGDdOHWnRUQ4qV3P
         TiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sMFV08hekdbEwG7jP+yEsfwlMQcqH0rTmaNwYWffr/I=;
        b=D9yPtK4E1Tj6cwN0bPlfCQZccKqNdxMjAdsnixwMjZtuK+4SFMq8ycaHkPg0t0W0uz
         STEMPEI5f+B225eoDCe+uTOTiAvUs+NnNB6HOxgxt6MDnx1+AHqW8XlUR6NHVXkz0kBs
         93XjWvgRbYq0jd5HL/7p73P/pglgthW+WNMBeBm60vOoop2z02YKmZmlGcXjHl6lig/A
         svyzBUYO9DBL3jW3qrKPzuq1Q1q1mEPwdti+84DUOTZvu+X7N5Q+ZWXIEZ1wU+1ENRBA
         vreVPxncJoQVVxq9N3RVuF8ESn+fkUFF/z0J5invW6423nYa0+BDBc35ZLNJgFQ4ePZm
         bg6A==
X-Gm-Message-State: AOAM531I1KrpcUwKr+qb2PHIEm/5/9j8RF6pNHa40/8TNNVf1LL/YcmY
	aWMjx5vyUp2qRYENa70MeHZ7QKd8Rj6Vz5fJu+Q=
X-Google-Smtp-Source: ABdhPJx+oH+B1kX8mYuAfCvlyHMEDpAqlTbYxAePxj112BMBNtac/3HAdROAdzIQv5ModIDicchT4krQzYMntV918A8=
X-Received: by 2002:a17:906:5902:: with SMTP id h2mr20252811ejq.137.1614688967046;
 Tue, 02 Mar 2021 04:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20210302123934.1585766-1-andrei@gherzan.com>
In-Reply-To: <20210302123934.1585766-1-andrei@gherzan.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 2 Mar 2021 13:42:35 +0100
Message-ID: <CA+chaQehnu+R80nbkGnaUgTt1_YiXuea4xnOBhMYoV_9cwoFMg@mail.gmail.com>
Subject: Re: [oe] [meta-python][dunfell][PATCH] python-grpcio-tools: Fix DEPENDS append to grpcio module
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000004db7fd05bc8d12ff"

--0000000000004db7fd05bc8d12ff
Content-Type: text/plain; charset="UTF-8"

This was already fixed in:
https://git.openembedded.org/meta-openembedded/commit/?h=dunfell&id=7fbe300c6d3b7e116dd7a56e16f85ff78d8f522c

On Tue, Mar 2, 2021 at 1:40 PM Andrei Gherzan <andrei@gherzan.com> wrote:

> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> There was a missing whitespace leading to errors like:
>
> ERROR: Nothing PROVIDES 'python3python3-grpcio' (but
> [...]/meta-openembedded/meta-python/recipes-devtools/python/
> python3-grpcio-tools_1.14.1.bb
> DEPENDS on
> or otherwise requires it). Close matches:
>   python3-grpcio
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  meta-python/recipes-devtools/python/python-grpcio-tools.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc
> b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
> index 1a15c48de..a3d34cf46 100644
> --- a/meta-python/recipes-devtools/python/python-grpcio-tools.inc
> +++ b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Google gRPC tools"
>  HOMEPAGE = "http://www.grpc.io/"
>  SECTION = "devel/python"
>
> -DEPENDS_append = "${PYTHON_PN}-grpcio"
> +DEPENDS += "${PYTHON_PN}-grpcio"
>  RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
>
>  LICENSE = "Apache-2.0"
> --
> 2.30.1
>
>
> 
>
>

--0000000000004db7fd05bc8d12ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This was already fixed in:<div><a href=3D"https://git.open=
embedded.org/meta-openembedded/commit/?h=3Ddunfell&amp;id=3D7fbe300c6d3b7e1=
16dd7a56e16f85ff78d8f522c">https://git.openembedded.org/meta-openembedded/c=
ommit/?h=3Ddunfell&amp;id=3D7fbe300c6d3b7e116dd7a56e16f85ff78d8f522c</a><br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Mar 2, 2021 at 1:40 PM Andrei Gherzan &lt;<a href=3D"mailto:=
andrei@gherzan.com">andrei@gherzan.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">From: Andrei Gherzan &lt;<a href=3D"m=
ailto:andrei.gherzan@huawei.com" target=3D"_blank">andrei.gherzan@huawei.co=
m</a>&gt;<br>
<br>
There was a missing whitespace leading to errors like:<br>
<br>
ERROR: Nothing PROVIDES &#39;python3python3-grpcio&#39; (but<br>
[...]/meta-openembedded/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-grpcio-tools_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-grpcio-tools_1.14.1.bb</a><br>
DEPENDS on<br>
or otherwise requires it). Close matches:<br>
=C2=A0 python3-grpcio<br>
<br>
Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherzan@huawei.=
com" target=3D"_blank">andrei.gherzan@huawei.com</a>&gt;<br>
---<br>
=C2=A0meta-python/recipes-devtools/python/python-grpcio-tools.inc | 2 +-<b=
r>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc b=
/meta-python/recipes-devtools/python/python-grpcio-tools.inc<br>
index 1a15c48de..a3d34cf46 100644<br>
--- a/meta-python/recipes-devtools/python/python-grpcio-tools.inc<br>
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools.inc<br>
@@ -2,7 +2,7 @@ DESCRIPTION =3D &quot;Google gRPC tools&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.grpc.io/" rel=3D"noreferrer=
" target=3D"_blank">http://www.grpc.io/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
<br>
-DEPENDS_append =3D &quot;${PYTHON_PN}-grpcio&quot;<br>
+DEPENDS +=3D &quot;${PYTHON_PN}-grpcio&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot;${PYTHON_PN}-grpcio&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
-- <br>
2.30.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000004db7fd05bc8d12ff--

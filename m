Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.3205.1610508901423648417
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 19:35:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tj415nAf;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id c7so492139qke.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 19:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JSD3hiwYdGJhGGpKYjXpxHoxX/1QMybmRUCtvrWdW5c=;
        b=tj415nAfpWNuglrxqKD5ZSMsEMLSx5KaeFSdE/a7VI/yvJ3QzaGt5ybqU3JIhTxPdI
         qAGJKgkAaErPHjIWtXhraW8ShNiK6baE1972vUF/oI2Ge9ojyxKt5LcBs3qLkjKanls3
         E9r0GOeIKcJd+Ly2B5bR2K3uzDaQ1g5dEo1r+XStTLWowbZ1u7yiGGFh/f+cVk++eooZ
         YLXtZTn/XmXBuRJwRNgCt6cWMINaSwY5xHCrRn+smG47hwBWdrmyYxJWcm0YKH/IvTUO
         vcP5vVOuLbYivo3vWh5EEzK0jWcR4iRFq/2jy7vCeetZZWpkX5LdT1TWRjoprN/Adw81
         HxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JSD3hiwYdGJhGGpKYjXpxHoxX/1QMybmRUCtvrWdW5c=;
        b=SaowrLZd7/2sixw8egWON+939D2GdhXpQxNAA9F4AJEvqPJs6f37SG6sKWlacPVatU
         OY5P5jUsvW+Mq01MHFry3XP/inMuGRLFXKnQxrl9lJQfXGBlrojiN7jL6wDMogXNAZHG
         RC/VEGcxPhzZyqcOqnqEAprHA3uGQOeer5GIfrjIRkvcU3j5RQ5HbyuZ6tBaUT7XEPhq
         QeWgrPCLIRkCpX4vwe/FF5hr1WSBKsMXPDbIAT0Q+gsP+Tzi7O2kCd3SZXMb+zVvEowT
         KhO5zLQhn5z7C82fsvhJ+dXv00b7CDLUY4gTiKwIqymc9GNqsrM9aBaBG2TVxGdpAu9O
         Fw1A==
X-Gm-Message-State: AOAM530pw+Ni4MAxs/4wvgXxzLbqPqYcL/okdEK5v2gcjQA0lkoU6eOt
	5jhdFWemKRTK/Onk2IW+5KWat72e55sQS9Qk7+w=
X-Google-Smtp-Source: ABdhPJwLD7zdRjW4uy+ZNGL7fBuy3NrT1xUxTL2RKCuC9TdTQkCOpEAttEA+sei3Prj7Jh5BoeTMlMCW231Tas4aJiA=
X-Received: by 2002:a37:88c2:: with SMTP id k185mr3113267qkd.474.1610508900449;
 Tue, 12 Jan 2021 19:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20210113031744.2245509-1-andrew@aj.id.au>
In-Reply-To: <20210113031744.2245509-1-andrew@aj.id.au>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 12 Jan 2021 19:34:49 -0800
Message-ID: <CAMKF1spY5Q-q15JUrVmdz28cQqncynzOWEfE=17dKt2ZRvPk1w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] meta-python: Add hexdump package
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eb41be05b8bfd248"

--000000000000eb41be05b8bfd248
Content-Type: text/plain; charset="UTF-8"

Please add it in packagegroup-meta-python as well

On Tue, Jan 12, 2021 at 7:18 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> The hexdump package appears to be abandoned, but it's used as the
> dependency of another project I'm packaging.
>
> Change-Id: Id90d770fb48fa502f3abeb541b7febef42799b21
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../python/python3-hexdump_3.3.bb             | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-hexdump_3.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
> b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
> new file mode 100644
> index 000000000000..eb4bf994d4f4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "view/edit your binary with any text editor"
> +
> +# The homepage listed on pypi is [1] but the repository has been removed.
> +# Instead, set the homepage to pypi.
> +#
> +# [1] https://bitbucket.org/techtonik/hexdump/
> +HOMEPAGE = "https://pypi.org/project/hexdump/"
> +
> +LICENSE = "PD"
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
> +
> +PYPI_PACKAGE_EXT = "zip"
> +
> +inherit pypi distutils3
> +
> +SRC_URI[sha256sum] =
> "d781a43b0c16ace3f9366aade73e8ad3a7bd5137d58f0b45ab2d3f54876f20db"
> +
> +S = "${WORKDIR}"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.27.0
>
>
> 
>
>

--000000000000eb41be05b8bfd248
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please add it in packagegroup-meta-python as well</div><d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Jan 12, 2021 at 7:18 PM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj=
.id.au">andrew@aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">The hexdum=
p package appears to be abandoned, but it&#39;s used as the<br>
dependency of another project I&#39;m packaging.<br>
<br>
Change-Id: Id90d770fb48fa502f3abeb541b7febef42799b21<br>
Signed-off-by: Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" targe=
t=3D"_blank">andrew@aj.id.au</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-hexdump_3.3.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-hexdump_3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 20 +++++++++++++++++++<br>
=C2=A01 file changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-hexdump_3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-h=
exdump_3.3.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-hexdump_3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-hexdump_3.3.b=
b</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-hexdu=
mp_3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-hexdump_3.3.bb</a><=
br>
new file mode 100644<br>
index 000000000000..eb4bf994d4f4<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-hexdum=
p_3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-hexdump_3.3.bb</a><b=
r>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;view/edit your binary with any text editor&quot;<br>
+<br>
+# The homepage listed on pypi is [1] but the repository has been removed.=
<br>
+# Instead, set the homepage to pypi.<br>
+#<br>
+# [1] <a href=3D"https://bitbucket.org/techtonik/hexdump/" rel=3D"norefer=
rer" target=3D"_blank">https://bitbucket.org/techtonik/hexdump/</a><br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/hexdump/" rel=3D"n=
oreferrer" target=3D"_blank">https://pypi.org/project/hexdump/</a>&quot;<br=
>
+<br>
+LICENSE =3D &quot;PD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common-licenses/=
PD;md5=3Db3597d12946881e13cb3b548d1173851&quot;<br>
+<br>
+PYPI_PACKAGE_EXT =3D &quot;zip&quot;<br>
+<br>
+inherit pypi distutils3<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;d781a43b0c16ace3f9366aade73e8ad3a7bd5137d58f=
0b45ab2d3f54876f20db&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000eb41be05b8bfd248--

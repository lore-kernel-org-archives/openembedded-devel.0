Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.9974.1625832460751466777
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jul 2021 05:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XizN6FFT;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id b2so15777785ejg.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jul 2021 05:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZnP2CEbBoSMD8fMPUHx53MSOu4n5ar24Ok71FPjwGQU=;
        b=XizN6FFTibb/wN7xM2u+u43u7bW57KKK/FSUqsJce1NNqPxe+T2Vhs9Krk/StZjyOL
         gQWPEHwb/rzc56gXOLsK+mahf5deyWbgN5n1jHQp2jpCKZrZuH9geJplfRoo+Wub/W5I
         KLn8Yn7K2VmkPYsOvMNSs9yOu/CimfhZGhmNZSxHx+MCW8/vN8MMQPmonPcD1pnY1uTp
         xU0R7rGlDv62b1eV53Hg8cNrMz5u+tBLELOtxCODE0/DuAw4bFvMbUXbK8Aa12u8M5b9
         z1FTAxm86xu9GMskS9ggq0MvT91pU3jITsejfrAnaVR60okLDXG6l2RFJ4cL9DE2nxHJ
         5L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZnP2CEbBoSMD8fMPUHx53MSOu4n5ar24Ok71FPjwGQU=;
        b=NYiR4PIqfUm8L/lm6VNI8xVFvuVks1vWvaZ+kZCapLgqAq0/Bvw60JAxO85/AfbQtK
         rCA7+2BpRbVHgsWw8gwqpu58kgwh9u+zeDxBZk12bJ1tp1g9XhcP58cQpfrHuh/yh/El
         2GjYjjPa9Y504J6mSpHtyGxngep6lWADn78ttXJqxAdKsmNXq3sE9iF+swH9Up9tvgsT
         BMEGwIQqoXwAnCa3jcchQJ0oRzyCcCnAIgAMwceZHcDOeWnAmMyUPXt/H8ENBa5oE4lG
         TlF7h1kL4SntB0m95eW6Vj88YSOdfXNKbF8FMBYWbG0MOsOKr7wNy0SH3tvK5ZDXUPtP
         hGmA==
X-Gm-Message-State: AOAM530BqHk/vnQ5Ar8iR9ppkAy4M08N5axnrlQokoNJ/UybtLpQEUc+
	3bOsU6bagPk8zc0dCICAbKmu71Rht0VxElrtsRc=
X-Google-Smtp-Source: ABdhPJyuV2YK+vfTJYV9FQi032PEG7zQma/ZTofjYMl/N8OzgqU4LOt907SzxwabZ3etshMJkntmpNFmtj2JaTWR6Sk=
X-Received: by 2002:a17:907:d28:: with SMTP id gn40mr37994235ejc.471.1625832459191;
 Fri, 09 Jul 2021 05:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210706181849.18345-1-joe.slater@windriver.com>
In-Reply-To: <20210706181849.18345-1-joe.slater@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 9 Jul 2021 14:07:28 +0200
Message-ID: <CA+chaQfgv6eu=ebwLwK+sa9_0uSAzoa=B+j3LCqmjpkyh9qcgQ@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH 1/1] python: use update-alternatives for python link
To: Joe Slater <joe.slater@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000031ca4b05c6af9ee8"

--00000000000031ca4b05c6af9ee8
Content-Type: text/plain; charset="UTF-8"

As this wasn't needed until now and python3 also doesn't use u-a for
${bindir}/python as all python3 scripts should explicitly call python3, why
do you think it would be worth adding to dead python2 recipe?

If you need this symlink would it make sense to use separate recipe
like python-is-python2/python-is-python3 packages in debian based systems
and create the symlink there instead of u-a in python itself?

On Tue, Jul 6, 2021 at 8:19 PM Joe Slater <joe.slater@windriver.com> wrote:

> Make the link of python to python2.7 an alternative.  This
> allows python3 to provide a link if we are not around, but
> makes our link override any python3 provides, assuming he
> uses the default priority.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-devtools/python/python_2.7.18.bb | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/python/python_2.7.18.bb
> b/recipes-devtools/python/python_2.7.18.bb
> index 7350562..3faf154 100644
> --- a/recipes-devtools/python/python_2.7.18.bb
> +++ b/recipes-devtools/python/python_2.7.18.bb
> @@ -34,7 +34,14 @@ SRC_URI += " \
>
>  S = "${WORKDIR}/Python-${PV}"
>
> -inherit autotools multilib_header python-dir pythonnative ptest
> +inherit autotools multilib_header python-dir pythonnative ptest
> update-alternatives
> +
> +# Make 'python' an alternative so that if python3 also provides it, we
> will be the default.
> +#
> +ALTERNATIVE_${PN}-core = "python"
> +ALTERNATIVE_LINK_NAME[python] = "${bindir}/python"
> +ALTERNATIVE_TARGET[python] = "${bindir}/python${PYTHON_MAJMIN}"
> +ALTERNATIVE_PRIORITY[python] = "50"
>
>  EXTRA_OECONF += "--with-system-ffi"
>
> --
> 2.29.2
>
>
> 
>
>

--00000000000031ca4b05c6af9ee8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As this wasn&#39;t needed until now and python3 also doesn=
&#39;t use u-a for ${bindir}/python as all python3 scripts should explicitl=
y call python3, why do you think it would be worth adding to dead python2 r=
ecipe?<div><br></div><div>If you need this symlink would it make sense to u=
se separate recipe like=C2=A0python-is-python2/python-is-python3 packages i=
n debian based systems and create the symlink there instead of u-a in pytho=
n itself?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jul 6, 2021 at 8:19 PM Joe Slater &lt;<a href=3D"m=
ailto:joe.slater@windriver.com">joe.slater@windriver.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Make the link of py=
thon to python2.7 an alternative.=C2=A0 This<br>
allows python3 to provide a link if we are not around, but<br>
makes our link override any python3 provides, assuming he<br>
uses the default priority.<br>
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" =
target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python_2.7.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">python_2.7.18.bb</a> | 9 ++++++++-<br>
=C2=A01 file changed, 8 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python_2.7.18.bb" r=
el=3D"noreferrer" target=3D"_blank">python_2.7.18.bb</a> b/recipes-devtools=
/python/<a href=3D"http://python_2.7.18.bb" rel=3D"noreferrer" target=3D"_b=
lank">python_2.7.18.bb</a><br>
index 7350562..3faf154 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python_2.7.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">python_2.7.18.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python_2.7.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">python_2.7.18.bb</a><br>
@@ -34,7 +34,14 @@ SRC_URI +=3D &quot; \<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/Python-${PV}&quot;<br>
<br>
-inherit autotools multilib_header python-dir pythonnative ptest<br>
+inherit autotools multilib_header python-dir pythonnative ptest update-al=
ternatives<br>
+<br>
+# Make &#39;python&#39; an alternative so that if python3 also provides i=
t, we will be the default.<br>
+#<br>
+ALTERNATIVE_${PN}-core =3D &quot;python&quot;<br>
+ALTERNATIVE_LINK_NAME[python] =3D &quot;${bindir}/python&quot;<br>
+ALTERNATIVE_TARGET[python] =3D &quot;${bindir}/python${PYTHON_MAJMIN}&quo=
t;<br>
+ALTERNATIVE_PRIORITY[python] =3D &quot;50&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--with-system-ffi&quot;<br>
<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000031ca4b05c6af9ee8--

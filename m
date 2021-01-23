Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.12603.1611435200980492755
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Jan 2021 12:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B1ia5YMu;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id k193so8842843qke.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Jan 2021 12:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vHQK4JcUIRE9R+NoEHl6df8xp5DCtAHBzHZJ6ycGaNo=;
        b=B1ia5YMuFUeaFzrrp1uLZsKxO3Aym1Br38wgUqIpRL3yP3etSmhBBp2lepCiicC8Ci
         IIyL2oY6Xu2Yu5mUHcBitQkGqnNuIM3cim/h8Ue8ttoozso8g1/SvxBEe+PvkI5L+XPC
         qptap8tPMtnO0Kehwbc3MUKE7M93di1Vjci/G8GDM46ugKIeV7d45ZfEL51qAosjg2Zz
         hqHB3rRGa/jrJbHJUQ8PeMfJjvRyIw0/0b/sIjJTUF+RiwtdbWshEonLyrtuEYlSPuU/
         IhMJFfeTv99hL7iQv1b9cwx09xZqeU6DNbDUTNL+s8lznJ2vvnt+nqNXnB6szErPJk36
         yInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vHQK4JcUIRE9R+NoEHl6df8xp5DCtAHBzHZJ6ycGaNo=;
        b=MUv9aaEFlH6XFS8pnPuHb4lhgffNZTeFsOvdPCjkKQl7yB2Tig+tP38mIaiqeDFCOY
         1Jwni9ooiXJNzwFYYfBRLqkHQr3eLFGLzGe1uduw9zpuNDEguAmwoifxsmTDfsY6SROR
         1HXDqyLde79CyRUQNSmtiHvog/sIb5aiQjNJvYXBFk2umx2RMejOxV+D+mLTwR99w5ON
         dahwD1yxnpw1cKKLchYVx4NQcUtWkZ8JusmouM8qNav/gPQpt8vXbt80JWpem5Y3ViA0
         0nApMakCFHH22iH44uVm6alrcRD5d7qWsTNEKBW5Lv1yklZbeAjH62PiZczRd8oVGc3Z
         BBpw==
X-Gm-Message-State: AOAM532ih2rpXr79vNwjwh1BRxfkVw4zxxEcQS/J72HHJ0Mv1hU4LQMz
	Q4uGNvP3oedoG0sv7EWh6OSFkueNMXLMAQF25x0=
X-Google-Smtp-Source: ABdhPJwYqEeMfeW7Q+IpDv1dFpD4p6ZBvO9/pzRnTrAdxGxXZLQmqAEiN4tAHTd6qwANGI7Ts48t/SoeNj+3y7fvwsw=
X-Received: by 2002:a37:2f82:: with SMTP id v124mr2277510qkh.212.1611435200146;
 Sat, 23 Jan 2021 12:53:20 -0800 (PST)
MIME-Version: 1.0
References: <20210123192513.2663547-1-schnitzeltony@gmail.com> <20210123192513.2663547-5-schnitzeltony@gmail.com>
In-Reply-To: <20210123192513.2663547-5-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 23 Jan 2021 12:53:09 -0800
Message-ID: <CAMKF1srUtq_JznajuTL68fa328m2tV6SO0hF9Tem0BpLFN+1cQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-typed-ast: Initial add 1.4.1
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, trevor.gamblin@windriver.com
Content-Type: multipart/alternative; boundary="000000000000aef1a405b9977e73"

--000000000000aef1a405b9977e73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please add the new packages to packagegroups too so it can appear in test
images

On Sat, Jan 23, 2021 at 11:25 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com>
wrote:

> Currently it lives in:
>
> * meta-microcontroller
> * meta-ros-common
> * meta-sca
>
> Seems important so add it to meta-python
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../python/python3-typed-ast_1.4.1.bb                | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-typed-ast_1.4.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-typed-ast_1.4.1.bb b/meta-python/recipes-devtools/python/
> python3-typed-ast_1.4.1.bb
> new file mode 100644
> index 000000000..2cc9f6c43
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "Modified fork of CPython's ast module that parses `# type:=
`
> comments"
> +HOMEPAGE =3D "https://github.com/python/typed_ast"
> +LICENSE =3D "Apache-2.0 & MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D97f1494e93daf66a5df47118407a=
4c4f"
> +
> +PYPI_PACKAGE =3D "typed_ast"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] =3D
> "8c8aaad94455178e3187ab22c8b01a3837f8ee50e09cf31f1ba129eb293ec30b"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.26.2
>
>
>=20
>
>

--000000000000aef1a405b9977e73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">Please add the new packages to packagegrou=
ps too so it can appear in test images=C2=A0</div><div dir=3D"auto"><br><di=
v class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">=
On Sat, Jan 23, 2021 at 11:25 AM Andreas M=C3=BCller &lt;<a href=3D"mailto:=
schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Currently it lives in:<br>
<br>
* meta-microcontroller<br>
* meta-ros-common<br>
* meta-sca<br>
<br>
Seems important so add it to meta-python<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gma=
il.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-typed-ast_1.4.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-typed-ast_1.4.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-typed-ast_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-typed-ast_1.4.1.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-typed-ast_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-typed-ast=
_1.4.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-typed-ast_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-typed-a=
st_1.4.1.bb</a><br>
new file mode 100644<br>
index 000000000..2cc9f6c43<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-typed-=
ast_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-typed-ast_1.4.1.=
bb</a><br>
@@ -0,0 +1,12 @@<br>
+SUMMARY =3D &quot;Modified fork of CPython&#39;s ast module that parses `=
# type:` comments&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/python/typed_ast" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/python/typed_ast</a>&quot=
;<br>
+LICENSE =3D &quot;Apache-2.0 &amp; MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D97f1494e93daf66a5df471184=
07a4c4f&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;typed_ast&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;8c8aaad94455178e3187ab22c8b01a3837f8ee50e09c=
f31f1ba129eb293ec30b&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.26.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000aef1a405b9977e73--

Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.9605.1586933087856607405
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 23:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G9J2Tnzq;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id v1so3244380edq.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 23:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=klsYtFjq0ORFJRa/8PYruWMiw7IxkYW7TqeVpx9U3/E=;
        b=G9J2TnzqtV3RbAViIVSpeY7FJlBFY913WBMIXzwG29LwM4EsxtO2qXJKqHpjBLNSRP
         MkgFfA22tuOS+pzbuz1nvJgdmFUJn7yqhUJXKYH2EnvBcNhzhYPQGwEu+mZxcVy3dGTi
         DmeGL9r8yXDHFWSSngyqwpPIHjXInF+bjxYJjVFJSZmgcIue6P/exjv0wxmPeQgGcA1K
         f3Axr6pDjDgG30AGwFEif10FLTiIspjrpmgBdFJKZkDgUJa4eRzsUnBrOhM1k6HZr6I5
         QxrmPxpM9ZCiYMe1Ujdntdcpynht8/sAWiqj/q3nuXXjbY1r9PWX9ocUttu+ACjQWvZM
         S9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=klsYtFjq0ORFJRa/8PYruWMiw7IxkYW7TqeVpx9U3/E=;
        b=amUZsP6DW8zR13evAbTLUPqMGBADPG/riK9trBEGxBbML3vOa+Akx2whMpoQLGQcJX
         MNe0NvmRe8Z6JcnSKu2MQ5g2KdvUohGpHoFv0bcshRFbulyRvdt762IW6eeOMarABRre
         FI00yz+hRj1Dk7SaNS8Wfzcn6oQZSdjxn/+I9BpPiXHDgWbY0A/4UdJKjDZny+fgKyum
         p0H31/ZlUafRslSJrV8BJAeIekwC7xaYQU+caBLoA1qNwH5Y1vux3vai1oWLP86zgtvN
         2fGowUjD5TmEIrGL8yEqGA5yFamUL0kq/iEuyWBzn0U84k3qZgTnmO8HlNne+dv4aPZn
         hKsQ==
X-Gm-Message-State: AGi0PubvFvjfjV/kPeccQbNHYbFz0hpTxKLxKpVhyPhUxP3YIhvVsXQy
	VudzyFGzWy1wCSZia0sCH3nbtVv4koAPb7QKyLA=
X-Google-Smtp-Source: APiQypJ25yMcty8w/LC2/ztBQeN8bzUq5C2ekJodU4KqKjbKYE9nXpNwQXwqI/Eg8OknVX/WPNqVcMPoLqvbVH6KUUM=
X-Received: by 2002:a50:ed19:: with SMTP id j25mr22799516eds.264.1586933086241;
 Tue, 14 Apr 2020 23:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <1585118838-33916-1-git-send-email-wangmy@cn.fujitsu.com> <1585118838-33916-4-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1585118838-33916-4-git-send-email-wangmy@cn.fujitsu.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 15 Apr 2020 08:44:35 +0200
Message-ID: <CA+chaQcOwFkMs5PpL_DCZABMaR42-L_R+zjFRDJGt9VnUSGPkg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] lapack: upgrade 3.8.0 -> 3.9.0
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e347bc05a34ea6c4"

--000000000000e347bc05a34ea6c4
Content-Type: text/plain; charset="UTF-8"

This causes
ERROR: lapack-3.9.0-r0 do_package_qa: QA Issue: lapack: SRC_URI uses
unstable GitHub archives [src-uri-bad]

Will send patch shortly.


On Wed, Mar 25, 2020 at 2:43 AM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../lapack/{lapack_3.8.0.bb => lapack_3.9.0.bb}             | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/lapack/{lapack_3.8.0.bb =>
> lapack_3.9.0.bb} (75%)
>
> diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
> b/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
> similarity index 75%
> rename from meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
> rename to meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
> index 7544744b3..56c01c533 100644
> --- a/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
> +++ b/meta-oe/recipes-devtools/lapack/lapack_3.9.0.bb
> @@ -13,9 +13,9 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=930f8aa500a47c7dab0f8efb5a1c9a40"
>
>  DEPENDS = "libgfortran"
>
> -SRC_URI = "http://www.netlib.org/lapack/lapack-${PV}.tar.gz"
> -SRC_URI[md5sum] = "96591affdbf58c450d45c1daa540dbd2"
> -SRC_URI[sha256sum] =
> "deb22cc4a6120bff72621155a9917f485f96ef8319ac074a7afbc68aab88bcf6"
> +SRC_URI = "
> https://github.com/Reference-LAPACK/lapack/archive/v${PV}.tar.gz"
> +SRC_URI[md5sum] = "0b251e2a8d5f949f99b50dd5e2200ee2"
> +SRC_URI[sha256sum] =
> "106087f1bb5f46afdfba7f569d0cbe23dacb9a07cd24733765a0e89dbe1ad573"
>
>  EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON "
>  OECMAKE_GENERATOR = "Unix Makefiles"
> --
> 2.17.1
>
>
>
> 
>

--000000000000e347bc05a34ea6c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This causes<div>ERROR: lapack-3.9.0-r0 do_package_qa: QA I=
ssue: lapack: SRC_URI uses unstable GitHub archives [src-uri-bad]<br></div>=
<div><br></div><div>Will send patch shortly.</div><div><br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Ma=
r 25, 2020 at 2:43 AM Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.c=
om">wangmy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:w=
angmy@cn.fujitsu.com" target=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../lapack/{<a href=3D"http://lapack_3.8.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">lapack_3.8.0.bb</a> =3D&gt; <a href=3D"http://lapack_3.9.0.=
bb" rel=3D"noreferrer" target=3D"_blank">lapack_3.9.0.bb</a>}=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-oe/recipes-devtools/lapack/{<a href=3D"http://lapack_3.8=
.0.bb" rel=3D"noreferrer" target=3D"_blank">lapack_3.8.0.bb</a> =3D&gt; <a =
href=3D"http://lapack_3.9.0.bb" rel=3D"noreferrer" target=3D"_blank">lapack=
_3.9.0.bb</a>} (75%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/lapack/<a href=3D"http://lapack_3.8.=
0.bb" rel=3D"noreferrer" target=3D"_blank">lapack_3.8.0.bb</a> b/meta-oe/re=
cipes-devtools/lapack/<a href=3D"http://lapack_3.9.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">lapack_3.9.0.bb</a><br>
similarity index 75%<br>
rename from meta-oe/recipes-devtools/lapack/<a href=3D"http://lapack_3.8.0=
.bb" rel=3D"noreferrer" target=3D"_blank">lapack_3.8.0.bb</a><br>
rename to meta-oe/recipes-devtools/lapack/<a href=3D"http://lapack_3.9.0.b=
b" rel=3D"noreferrer" target=3D"_blank">lapack_3.9.0.bb</a><br>
index 7544744b3..56c01c533 100644<br>
--- a/meta-oe/recipes-devtools/lapack/<a href=3D"http://lapack_3.8.0.bb" r=
el=3D"noreferrer" target=3D"_blank">lapack_3.8.0.bb</a><br>
+++ b/meta-oe/recipes-devtools/lapack/<a href=3D"http://lapack_3.9.0.bb" r=
el=3D"noreferrer" target=3D"_blank">lapack_3.9.0.bb</a><br>
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D930f8aa5=
00a47c7dab0f8efb5a1c9a40&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libgfortran&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://www.netlib.org/lapack/lapack-$%7BPV%7=
D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.netlib.org/lapack=
/lapack-${PV}.tar.gz</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;96591affdbf58c450d45c1daa540dbd2&quot;<br>
-SRC_URI[sha256sum] =3D &quot;deb22cc4a6120bff72621155a9917f485f96ef8319ac=
074a7afbc68aab88bcf6&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/Reference-LAPACK/lapack/a=
rchive/v$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/Reference-LAPACK/lapack/archive/v${PV}.tar.gz</a>&quot;<br>
+SRC_URI[md5sum] =3D &quot;0b251e2a8d5f949f99b50dd5e2200ee2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;106087f1bb5f46afdfba7f569d0cbe23dacb9a07cd24=
733765a0e89dbe1ad573&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE =3D &quot; -DBUILD_SHARED_LIBS=3DON &quot;<br>
=C2=A0OECMAKE_GENERATOR =3D &quot;Unix Makefiles&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e347bc05a34ea6c4--

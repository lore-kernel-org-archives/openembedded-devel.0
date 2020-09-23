Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.3511.1600887656332747655
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 12:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cpXHC3DZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id j11so1159795ejk.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2020 12:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4DEWeWb0nNwfpsQUGj6hxsZFxwC/eD91cUuTehPvHaU=;
        b=cpXHC3DZhX9yIdSWBnQWL47fd4IQl6kHc/8dIFSD9IR6kYblCY8/coV0S1yHFPbeT5
         q/aWT+cx1wLzQfCsrfdp9D9dR0ihToUn7OlHDmIHE2QajGt12kmGhPFVelc9L+jfQ/sn
         liKlTAhLTnmrEIssDgL+cnw4sOiQsJxhulQDpuus8AXU4CkqpIgWhxKZNdr9BwIK7YTJ
         jg2AXe4Y6n/3swBiRTsr9zyZTD5E6O2F05ib20bs//du9AtMmND3UUI+2tuXKI9G7Ihs
         LwwS0YQ+/a01TRMuwzx43nY6W73DhtZcJblj8qJ/qTYpeKifQDODBU0tbQvcDewERvBs
         51Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4DEWeWb0nNwfpsQUGj6hxsZFxwC/eD91cUuTehPvHaU=;
        b=AC2SqvSoFlaArsUuRTyWMVbKnS7O93xL2V5KZMxF53FxAg0vQ+QbMEpq3R/AML7A2s
         e1oKCU6NAhDj2cSxK+443StmcHi2iHD7jGHqsP01g0l9ofQbXNeK+sCAOSGnEpFJDGEt
         zJL8SHnnUxnnz0P3fWObrHtcMOtvmq4EklVHoLVtPH3JLOKzfP5XOzfgeT8pIkacFV8L
         oR2z/4h2HtwDc3STIlFKtZyGyZJzqv7dS645dWYeJe/Z5nBTnpBpUTxWbz357MQHO0OM
         1/UkI5Qfdin5LnxT8XnM+YM4BIasiYRKlFPLBOdqdlTPvD8NK9pbRUsBSLLbDKbaiE1g
         AppQ==
X-Gm-Message-State: AOAM531LYrWWAHrYbSELFft1gJYCEyuhIBlWCUVlS9Say8NJA92Sc3Xy
	dwFTNJgulh5PWZp3ehGBdRxz5IKxkFKh2DNGrZU=
X-Google-Smtp-Source: ABdhPJzCE2IgB3GwTi74fDC5Xy1G7m5aitjawVY8G8tbp+2bGo4y7zE+LQVZW696LVU6aCnljhTqURKNqKFb5cgaKeM=
X-Received: by 2002:a17:906:4b18:: with SMTP id y24mr1013125eju.471.1600887654716;
 Wed, 23 Sep 2020 12:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200923181124.1029-1-liu.ming50@gmail.com>
In-Reply-To: <20200923181124.1029-1-liu.ming50@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 23 Sep 2020 21:00:43 +0200
Message-ID: <CA+chaQdUcX+4f=RNM+LPWaSF_ZPqo3VCDLwoRVMk5yrhHaKtZw@mail.gmail.com>
Subject: Re: [oe] [meta-browser] [PATCH] chromium: change to python3
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fc1cc105afffb30f"

--000000000000fc1cc105afffb30f
Content-Type: text/plain; charset="UTF-8"

https://bugs.chromium.org/p/chromium/issues/detail?id=942720

is still far from finished.

Using python from host and assuming it's python2 is much worse than
pythonnative inherit and using meta-python2.

On Wed, Sep 23, 2020 at 8:11 PM Ming Liu <liu.ming50@gmail.com> wrote:

> From: Ming Liu <liu.ming50@gmail.com>
>
> python support has been dropped from OE since dunfell, let's change to
> python3.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-browser/chromium/chromium.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-browser/chromium/chromium.inc
> b/recipes-browser/chromium/chromium.inc
> index b351114..0d1a761 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -18,7 +18,7 @@ TOOLCHAIN = "clang"
>  # to build the native recipes (e.g. GN) with clang too.
>  TOOLCHAIN_class-native = "clang"
>
> -inherit pythonnative setuptools
> +inherit python3native setuptools3
>
>  # Chromium itself is licensed under the 3-clause BSD license. However, it
>  # depends upon several other projects whose copyright files are listed in
> --
> 2.28.0
>
>
> 
>
>

--000000000000fc1cc105afffb30f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://bugs.chromium.org/p/chromium/issues/det=
ail?id=3D942720">https://bugs.chromium.org/p/chromium/issues/detail?id=3D94=
2720</a><br><div><br></div><div>is still far from finished.</div><div><br><=
/div><div>Using python from host and assuming it&#39;s python2 is much wors=
e than pythonnative inherit and using meta-python2.</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23, 20=
20 at 8:11 PM Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming=
50@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" targ=
et=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
<br>
python support has been dropped from OE since dunfell, let&#39;s change to=
<br>
python3.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=
=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-browser/chromium/chromium.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chrom=
ium/chromium.inc<br>
index b351114..0d1a761 100644<br>
--- a/recipes-browser/chromium/chromium.inc<br>
+++ b/recipes-browser/chromium/chromium.inc<br>
@@ -18,7 +18,7 @@ TOOLCHAIN =3D &quot;clang&quot;<br>
=C2=A0# to build the native recipes (e.g. GN) with clang too.<br>
=C2=A0TOOLCHAIN_class-native =3D &quot;clang&quot;<br>
<br>
-inherit pythonnative setuptools<br>
+inherit python3native setuptools3<br>
<br>
=C2=A0# Chromium itself is licensed under the 3-clause BSD license. Howeve=
r, it<br>
=C2=A0# depends upon several other projects whose copyright files are list=
ed in<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000fc1cc105afffb30f--

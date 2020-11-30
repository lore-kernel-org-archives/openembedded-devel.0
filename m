Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web08.678.1606773220246525117
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 13:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vNVV57rx;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id n14so8640166iom.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Nov 2020 13:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eLTnBGM6YCcQMSVQhoxyFQOT3Be79XYU/1NPIVy8y4E=;
        b=vNVV57rxm2zKQVQVXHa2sHHw3N6mQtyNeh95nTfEh5yiqTsHnbITzzIXtRLgBlEG5p
         XXqch38CnOCc0n9POKHex56O0GM8gkMGGLOSytkmTZ2dPPPJ/85q1ZPG+tA+kdyfra4I
         /aeh2mS5Td4sApYPo4+mxt8/20cNW6aBvd63oYpkffevKeBbFg+UR0pOUNlnYMxITFum
         KjsTcRFWpCIA+fYLMBCrMD5mHEA3VV/31kdnxRNvO9txtw2LxP3xJGOXEG0YO01o38qL
         PKHZAC4AA8DSq1CNoiRXCSCst6j7l+Bua9arGhMQ3hxqhlCgvSrb7Jjd43dCJrRD/6iC
         Q3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eLTnBGM6YCcQMSVQhoxyFQOT3Be79XYU/1NPIVy8y4E=;
        b=nj/mlXgoqFYzjmUU+WzgaBzzcyTRTHnlWU7VTWtIClrrnJkvpBbJih8Pls6AV+8VT7
         AjKSuXOayFxn+E7dNnZMSS7qQaPqKXmewfz/01MXPU+E+CcNSWJGZ4MUGSCMaOUIZAB7
         nCYlc//z1jdzD3gfeW8EEPLqyfRe++Utj3vG4EaWi9X1tMADb1yDVw0luRG2OSX9ptJE
         NLWBzIg/aVUO0uRS5OjyotIMfxCOw1PApMIb/3QbCX+WX3W+H3qhtCj0eEDZTJxPa7jz
         OoReDIpBLdTiDHwXaYlKI32p0CnBMW/IUzMqL/d+wfoMRkIo5SEJIJcfmk6v75A3oLtU
         pF+g==
X-Gm-Message-State: AOAM531UDxzi1XYDLcbVzrxhhYjoEX1Dh4KOrikk4FpgNBSMSJXeHTmw
	RzlkPWxBG5IZioU4um/UbCJZ4XNceWtrUouxOP8=
X-Google-Smtp-Source: ABdhPJz2MOIuJghwdhDxzfa1zzjuYgE9BvzaA1iaj8GNdhhYSael+QKVGCCtVgcP2bW4gWjwuknFYG6ARgTKQqifuzg=
X-Received: by 2002:a02:ac7:: with SMTP id 190mr16507867jaw.46.1606773219427;
 Mon, 30 Nov 2020 13:53:39 -0800 (PST)
MIME-Version: 1.0
References: <20201130194013.74677-1-raj.khem@gmail.com>
In-Reply-To: <20201130194013.74677-1-raj.khem@gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 30 Nov 2020 13:53:28 -0800
Message-ID: <CANx9H-D=43ZdUmCcD7y7BvUpTFKbfLpq+Lo9Ko8zocPQR2ZOpA@mail.gmail.com>
Subject: Re: [meta-python][PATCH] packagegroup-meta-python: Remove packages moved to core
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fa8be305b55a0aab"

--000000000000fa8be305b55a0aab
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 11:40 AM Khem Raj <raj.khem@gmail.com> wrote:

> These packages are not in meta-python anymore
>

I knew I was forgetting something!

Acked-by: Tim Orling <ticotimo@gmail.com>


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Tim Orling <ticotimo@gmail.com>
> ---
>  .../packagegroups/packagegroup-meta-python.bb    | 16 ----------------
>  1 file changed, 16 deletions(-)
>
> diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> index 024503d5da..bf46896f1c 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -27,7 +27,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-asciitree \
>      python3-flask-sqlalchemy \
>      python3-gevent \
> -    python3-attrs \
>      python3-aenum \
>      python3-gast \
>      python3-blinker \
> @@ -56,7 +55,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-asn1crypto \
>      python3-async-timeout \
>      python3-absl \
> -    python3-atomicwrites \
>      python3-attr \
>      python3-flask \
>      python3-autobahn \
> @@ -151,7 +149,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-keras-applications \
>      python3-idna \
>      python3-sympy \
> -    python3-importlib-metadata \
>      python3-langtable \
>      python3-lockfile \
>      python3-nmap \
> @@ -170,10 +167,8 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-lorem \
>      python3-javaobj-py3 \
>      python3-passlib \
> -    python3-pathlib2 \
>      python3-pexpect \
>      python3-luma-oled \
> -    python3-pluggy \
>      python3-lxml \
>      python3-precise-runner \
>      python3-padaos \
> @@ -251,7 +246,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-natsort \
>      python3-polyline \
>      python3-ordered-set \
> -    python3-packaging \
>      python3-parso \
>      python3-pycparser \
>      python3-pycrypto \
> @@ -267,14 +261,12 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-pickleshare \
>      python3-pyopenssl \
>      python3-protobuf \
> -    python3-py \
>      python3-pyasn1-modules \
>      python3-pyscaffold \
>      python3-pyserial \
>      python3-pysocks \
>      python3-pytoml \
>      python3-pytest-helpers-namespace \
> -    python3-more-itertools \
>      python3-pytest-tempdir \
>      python3-pyflakes \
>      python3-pyrad \
> @@ -301,8 +293,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-pocketsphinx \
>      python3-sdnotify \
>      python3-pycodestyle \
> -    python3-pytest \
> -    python3-iniconfig \
>      python3-speaklater \
>      python3-wtforms \
>      python3-speedtest-cli \
> @@ -326,12 +316,10 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-trafaret \
>      python3-urllib3 \
>      python3-yappi \
> -    python3-zipp \
>      python3-texttable \
>      python3-humanize \
>      python3-strict-rfc3339 \
>      python3-supervisor \
> -    python3-toml \
>      python3-diskcache \
>      python3-requests-futures \
>      python3-matplotlib \
> @@ -339,7 +327,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-xlrd \
>      python3-xstatic \
>      python3-tzlocal \
> -    python3-wcwidth \
>      python3-ntplib \
>      python3-u-msgpack-python \
>      python3-python-vlc \
> @@ -383,7 +370,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-requests-file \
>      python3-requests-toolbelt \
>      python3-ruamel-yaml \
> -    python3-setuptools-scm \
>      python3-socketio \
>      python3-soupsieve \
>      python3-textparser \
> @@ -429,8 +415,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-dill \
>      python3-cerberus \
>      python3-cvxopt \
> -    python3-sortedcontainers \
> -    python3-hypothesis \
>      python3-jsonpath-rw \
>  "
>
> --
> 2.29.2
>
>

--000000000000fa8be305b55a0aab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 30, 2020 at 11:40 AM Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">These packages are not in meta-python anymore<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I knew I was for=
getting something!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Acked=
-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.co=
m</a>&gt;</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">=
ticotimo@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-python.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a>=C2=A0 =C2=
=A0 | 16 ----------------<br>
=C2=A01 file changed, 16 deletions(-)<br>
<br>
diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://packa=
gegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-m=
eta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=3D"http:=
//packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-python.bb</a><br>
index 024503d5da..bf46896f1c 100644<br>
--- a/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
+++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
@@ -27,7 +27,6 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-asciitree \<br>
=C2=A0 =C2=A0 =C2=A0python3-flask-sqlalchemy \<br>
=C2=A0 =C2=A0 =C2=A0python3-gevent \<br>
-=C2=A0 =C2=A0 python3-attrs \<br>
=C2=A0 =C2=A0 =C2=A0python3-aenum \<br>
=C2=A0 =C2=A0 =C2=A0python3-gast \<br>
=C2=A0 =C2=A0 =C2=A0python3-blinker \<br>
@@ -56,7 +55,6 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-asn1crypto \<br>
=C2=A0 =C2=A0 =C2=A0python3-async-timeout \<br>
=C2=A0 =C2=A0 =C2=A0python3-absl \<br>
-=C2=A0 =C2=A0 python3-atomicwrites \<br>
=C2=A0 =C2=A0 =C2=A0python3-attr \<br>
=C2=A0 =C2=A0 =C2=A0python3-flask \<br>
=C2=A0 =C2=A0 =C2=A0python3-autobahn \<br>
@@ -151,7 +149,6 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-keras-applications \<br>
=C2=A0 =C2=A0 =C2=A0python3-idna \<br>
=C2=A0 =C2=A0 =C2=A0python3-sympy \<br>
-=C2=A0 =C2=A0 python3-importlib-metadata \<br>
=C2=A0 =C2=A0 =C2=A0python3-langtable \<br>
=C2=A0 =C2=A0 =C2=A0python3-lockfile \<br>
=C2=A0 =C2=A0 =C2=A0python3-nmap \<br>
@@ -170,10 +167,8 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-lorem \<br>
=C2=A0 =C2=A0 =C2=A0python3-javaobj-py3 \<br>
=C2=A0 =C2=A0 =C2=A0python3-passlib \<br>
-=C2=A0 =C2=A0 python3-pathlib2 \<br>
=C2=A0 =C2=A0 =C2=A0python3-pexpect \<br>
=C2=A0 =C2=A0 =C2=A0python3-luma-oled \<br>
-=C2=A0 =C2=A0 python3-pluggy \<br>
=C2=A0 =C2=A0 =C2=A0python3-lxml \<br>
=C2=A0 =C2=A0 =C2=A0python3-precise-runner \<br>
=C2=A0 =C2=A0 =C2=A0python3-padaos \<br>
@@ -251,7 +246,6 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-natsort \<br>
=C2=A0 =C2=A0 =C2=A0python3-polyline \<br>
=C2=A0 =C2=A0 =C2=A0python3-ordered-set \<br>
-=C2=A0 =C2=A0 python3-packaging \<br>
=C2=A0 =C2=A0 =C2=A0python3-parso \<br>
=C2=A0 =C2=A0 =C2=A0python3-pycparser \<br>
=C2=A0 =C2=A0 =C2=A0python3-pycrypto \<br>
@@ -267,14 +261,12 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pickleshare \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyopenssl \<br>
=C2=A0 =C2=A0 =C2=A0python3-protobuf \<br>
-=C2=A0 =C2=A0 python3-py \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyasn1-modules \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyscaffold \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyserial \<br>
=C2=A0 =C2=A0 =C2=A0python3-pysocks \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytoml \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-helpers-namespace \<br>
-=C2=A0 =C2=A0 python3-more-itertools \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-tempdir \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyflakes \<br>
=C2=A0 =C2=A0 =C2=A0python3-pyrad \<br>
@@ -301,8 +293,6 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pocketsphinx \<br>
=C2=A0 =C2=A0 =C2=A0python3-sdnotify \<br>
=C2=A0 =C2=A0 =C2=A0python3-pycodestyle \<br>
-=C2=A0 =C2=A0 python3-pytest \<br>
-=C2=A0 =C2=A0 python3-iniconfig \<br>
=C2=A0 =C2=A0 =C2=A0python3-speaklater \<br>
=C2=A0 =C2=A0 =C2=A0python3-wtforms \<br>
=C2=A0 =C2=A0 =C2=A0python3-speedtest-cli \<br>
@@ -326,12 +316,10 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-trafaret \<br>
=C2=A0 =C2=A0 =C2=A0python3-urllib3 \<br>
=C2=A0 =C2=A0 =C2=A0python3-yappi \<br>
-=C2=A0 =C2=A0 python3-zipp \<br>
=C2=A0 =C2=A0 =C2=A0python3-texttable \<br>
=C2=A0 =C2=A0 =C2=A0python3-humanize \<br>
=C2=A0 =C2=A0 =C2=A0python3-strict-rfc3339 \<br>
=C2=A0 =C2=A0 =C2=A0python3-supervisor \<br>
-=C2=A0 =C2=A0 python3-toml \<br>
=C2=A0 =C2=A0 =C2=A0python3-diskcache \<br>
=C2=A0 =C2=A0 =C2=A0python3-requests-futures \<br>
=C2=A0 =C2=A0 =C2=A0python3-matplotlib \<br>
@@ -339,7 +327,6 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-xlrd \<br>
=C2=A0 =C2=A0 =C2=A0python3-xstatic \<br>
=C2=A0 =C2=A0 =C2=A0python3-tzlocal \<br>
-=C2=A0 =C2=A0 python3-wcwidth \<br>
=C2=A0 =C2=A0 =C2=A0python3-ntplib \<br>
=C2=A0 =C2=A0 =C2=A0python3-u-msgpack-python \<br>
=C2=A0 =C2=A0 =C2=A0python3-python-vlc \<br>
@@ -383,7 +370,6 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-requests-file \<br>
=C2=A0 =C2=A0 =C2=A0python3-requests-toolbelt \<br>
=C2=A0 =C2=A0 =C2=A0python3-ruamel-yaml \<br>
-=C2=A0 =C2=A0 python3-setuptools-scm \<br>
=C2=A0 =C2=A0 =C2=A0python3-socketio \<br>
=C2=A0 =C2=A0 =C2=A0python3-soupsieve \<br>
=C2=A0 =C2=A0 =C2=A0python3-textparser \<br>
@@ -429,8 +415,6 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-dill \<br>
=C2=A0 =C2=A0 =C2=A0python3-cerberus \<br>
=C2=A0 =C2=A0 =C2=A0python3-cvxopt \<br>
-=C2=A0 =C2=A0 python3-sortedcontainers \<br>
-=C2=A0 =C2=A0 python3-hypothesis \<br>
=C2=A0 =C2=A0 =C2=A0python3-jsonpath-rw \<br>
=C2=A0&quot;<br>
<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div></div>

--000000000000fa8be305b55a0aab--

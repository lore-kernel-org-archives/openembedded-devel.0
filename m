Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.5147.1599858162609127987
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 14:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cYXINzXP;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id r25so12595305ioj.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XJXjNoeqxmSI/jsl+jnnAN3fCg3JwjAfncm32XOVSmw=;
        b=cYXINzXPDxwN7cN4529jgUs+tPV4TwnukXaj/tiKAvdMNl+qoP0KGvGugQcTkAHOtM
         N9f/+DZbbz5wAZx6S8QQ36qiHG2cFO9BzqJO2htPMHuE5xYNWmFVPsyZHble7euwtaEm
         0gS8YKBhGrp5JsCwkqJIOMYxyJpY8LCd+0ZLtcHB7Ax7fhRlsieb3keNGufIKOs+iAKm
         wmvpmBe1f65QX2a5B6pAlSgKV9fObe8BWgc1s9lt0cpMHxDyeJ0ZRyxWDH+Oh16RaZJy
         +Yt1tVVb7/1z+j3RpSPEk9Bo/GZ2P7CH7ExIMqugJUBcLzCR9ffJ6RBS1nIP56OjSRuR
         c2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XJXjNoeqxmSI/jsl+jnnAN3fCg3JwjAfncm32XOVSmw=;
        b=kuyIUmjV84SK++z2bk9mjawYQhtwEOUFLGmV2Mg9bs8vinTt9od/ZfvMRJGaVAX7lj
         s5r1tSqypMRxmNk6Uahyha0MY4XlRtS313gYw+FJOy3JzVLRyjcAxdnYABn1B3x8mPSw
         l0sHBsS/kffQoHUr9DokZfrwUdmk8qPcgYAME+l/Qup+O/LwcS0zDq9ynRb4nQTNT0hQ
         aTsmkr7/tupQl5qMDPf5Y1T4kQX43VDrJ1NXghJ1fv7KD3vnzJQYR0LH8zGZ5iWIHqR2
         OR0GbT6UYdNExJjUojj/kKyGzM3XFQDPqZsx0afzXIdhTsv6I+1Sf2EnKl/SzCrmiWN4
         Adig==
X-Gm-Message-State: AOAM532Wt5A3NzNa/HKKpogsHX0a0YPJY+2Vzqp7rG4SeMB0O02mA6FK
	D5zqcHz3qMxNlCwNXV/k8I6U3hncrR6k8IX36rI=
X-Google-Smtp-Source: ABdhPJyQJM4SkpzaWEU3Y1/NYTXur9FuNebfaaZAvddF69zaJ9B0jH4VUygSjV6qcEOJow10nlf++P3lW3s2uuLTyho=
X-Received: by 2002:a02:9a0e:: with SMTP id b14mr3793907jal.22.1599858161633;
 Fri, 11 Sep 2020 14:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200911142637.1435646-1-trevor.gamblin@windriver.com>
In-Reply-To: <20200911142637.1435646-1-trevor.gamblin@windriver.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 11 Sep 2020 14:02:30 -0700
Message-ID: <CANx9H-CDW+55z5cHQX0pvnmoCsN72hATBpDz8+H_ud2ukiopRw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-django: add recipe for 3.1.1
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006a500f05af100183"

--0000000000006a500f05af100183
Content-Type: text/plain; charset="UTF-8"

The reason for Django 2.2 is it is LTS. This version will now override
unless the user sets PREFERRED_VERSION. The thrash on non-LTS Django is a
PITA to support...

On Fri, Sep 11, 2020 at 7:26 AM Trevor Gamblin <trevor.gamblin@windriver.com>
wrote:

> meta-python only contains a recipe for django 2.2.x, so
>
> add a recipe file for the newest branch.
>
>
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> ---
>
>  .../recipes-devtools/python/python3-django_3.1.1.bb      | 9 +++++++++
>
>  1 file changed, 9 insertions(+)
>
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-django_3.1.1.bb
>
>
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
> b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>
> new file mode 100644
>
> index 000000000..b36cfb699
>
> --- /dev/null
>
> +++ b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>
> @@ -0,0 +1,9 @@
>
> +require python-django.inc
>
> +inherit setuptools3
>
> +
>
> +SRC_URI[md5sum] = "d5e894fb3c46064e84e9dc68a08a46d0"
>
> +SRC_URI[sha256sum] =
> "59c8125ca873ed3bdae9c12b146fbbd6ed8d0f743e4cf5f5817af50c51f1fc2f"
>
> +
>
> +RDEPENDS_${PN} += "\
>
> +    ${PYTHON_PN}-sqlparse \
>
> +"
>
> --
>
> 2.26.2
>
>
>
> 
>
>

--0000000000006a500f05af100183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The reason for Django 2.2 is it is LTS. This version will=
 now override unless the user sets PREFERRED_VERSION. The thrash on non-LTS=
 Django is a PITA to support...</div><div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 11, 2020 at 7:26 AM Trevor =
Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.com">trevor.gamblin@=
windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">meta-p=
ython only contains a recipe for django 2.2.x, so<br><br>add a recipe file =
for the newest branch.<br><br><br><br>Signed-off-by: Trevor Gamblin &lt;<a =
href=3D"mailto:trevor.gamblin@windriver.com" target=3D"_blank">trevor.gambl=
in@windriver.com</a>&gt;<br><br>---<br><br>=C2=A0.../recipes-devtools/pytho=
n/<a href=3D"http://python3-django_3.1.1.bb" rel=3D"noreferrer" target=3D"_=
blank">python3-django_3.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 | 9 +++++++++<br><br=
>=C2=A01 file changed, 9 insertions(+)<br><br>=C2=A0create mode 100644 meta=
-python/recipes-devtools/python/<a href=3D"http://python3-django_3.1.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-django_3.1.1.bb</a><br><br><br=
><br>diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-django_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_3=
.1.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-django_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_3.1.1=
.bb</a><br><br>new file mode 100644<br><br>index 000000000..b36cfb699<br><b=
r>--- /dev/null<br><br>+++ b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-django_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-django_3.1.1.bb</a><br><br>@@ -0,0 +1,9 @@<br><br>+require python-django=
.inc<br><br>+inherit setuptools3<br><br>+<br><br>+SRC_URI[md5sum] =3D &quot=
;d5e894fb3c46064e84e9dc68a08a46d0&quot;<br><br>+SRC_URI[sha256sum] =3D &quo=
t;59c8125ca873ed3bdae9c12b146fbbd6ed8d0f743e4cf5f5817af50c51f1fc2f&quot;<br=
><br>+<br><br>+RDEPENDS_${PN} +=3D &quot;\<br><br>+=C2=A0 =C2=A0 ${PYTHON_P=
N}-sqlparse \<br><br>+&quot;<br><br>-- <br><br>2.26.2<br><br><br><br><br><b=
r></blockquote></div></div>

--0000000000006a500f05af100183--

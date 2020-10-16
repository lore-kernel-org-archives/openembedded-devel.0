Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.16921.1602858444996864586
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 07:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LiIDuzTC;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id p16so2853810ilq.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2020 07:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qHiTyvBxYPHi1SnOJMs2pZcEmlVQtR7CGBII0B396jU=;
        b=LiIDuzTCYoLuxLarUhrmqbahNQcWYx5Ca35o5GojjRoqmWEKIDNYJVhrzNVS0aEBky
         iQBQpplY5sHAMITo8iNTfk5qYg8R2aGLu6gUhXpDbpsFhRfGUpFdyXXw0tWJYfuNmwqj
         U2wocP40X3dbaZdvJzNwwwM+CzY14GIxnG7E5ylgg2rucPBgzHGKyQwi8zT4QakDR0Pt
         /b4Hus4lBSjD9IXVlxIcMEpzWJrnQ06kIAXP6j2j2juliG8sgN8Xgxi+RD12g0ZAXDAC
         j5AP1YZulgacyU/5WvquTG0l3Mpuz72WkHUMQdM1bm5VzOZoohOJgZ62dKfHgwtl49nC
         t3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qHiTyvBxYPHi1SnOJMs2pZcEmlVQtR7CGBII0B396jU=;
        b=L3aZR7CM5njlQ54DQ/QKrduEQZIU6+LLcu5TCJrVT5UTzuVI2Npcj4thEVSFFpbQQx
         Weu9Ao8VLCwoW2LAWJBGeEG6seANa1W8m0NTj98cH+qhnhpae3X0sm2iyKFOR/1rIvqc
         WcM8ZcexS9hQELdIjoryif0wKlh/CTskQRqqNZvzKhjAbjSX+FBIvnyLUFjQCfJ+B5Ar
         FQax/035GqoWxncjvTfPeGstwUlA1qzr5msf8bDuwz2nSqo0MzMAdunwihvbg6QFi5jh
         CQAK+j5c9x3Z9FFsEsqCeJ42srIW+nCNCHXzgDU01HV9VGk4oI3UGs/BC4eYxFJjkHNw
         Q0vg==
X-Gm-Message-State: AOAM531Rv6DVz2MBC/i7Sg80uuqzrUcfXHUdML53y3EUiz0W673wO0pd
	21pOwxkvsA6Tq1r2DJgbLW+FMsP3PZGoSv3zHVY=
X-Google-Smtp-Source: ABdhPJwViAAVg6E8fk+322AWVhPgj2CV1MnvIX4AwW3byq6oUOpHJgNeej/izA+Q/32dQfHynPRzo3E5YWOmpA/YnFs=
X-Received: by 2002:a92:d9cc:: with SMTP id n12mr2722500ilq.122.1602858444375;
 Fri, 16 Oct 2020 07:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201012004603.990-1-babak.sarashki@windriver.com>
In-Reply-To: <20201012004603.990-1-babak.sarashki@windriver.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 16 Oct 2020 07:27:13 -0700
Message-ID: <CANx9H-B38g=au5r6iVy8uVqCB+dq5NaxfmvCAmRnPBFQeL-LBw@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH 1/3] package port: python-kombu version 4.6.6
To: Babak Sarashki <babak.sarashki@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000033d8b205b1ca9058"

--00000000000033d8b205b1ca9058
Content-Type: text/plain; charset="UTF-8"

Please also submit a patch to add these three recipes to
packagroup-meta-python2
https://git.openembedded.org/meta-python2/tree/recipes-core/packagegroups/packagegroup-meta-python2.bb

The CI system behind this layer depends on the packagroup staying up to
date.

On Sun, Oct 11, 2020 at 5:46 PM Babak Sarashki <babak.sarashki@windriver.com>
wrote:

> Signed-off-by: Babak Sarashki <babak.sarashki@windriver.com>
> ---
>  recipes-devtools/python/python-kombu_4.6.6.bb | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 recipes-devtools/python/python-kombu_4.6.6.bb
>
> diff --git a/recipes-devtools/python/python-kombu_4.6.6.bb
> b/recipes-devtools/python/python-kombu_4.6.6.bb
> new file mode 100644
> index 0000000..72a9d90
> --- /dev/null
> +++ b/recipes-devtools/python/python-kombu_4.6.6.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "The aim of Kombu is to make messaging in Python as easy as
> possible by providing \
> +an idiomatic high-level interface for the AMQ protocol, and also provide
> proven and tested \
> +solutions to common messaging problems."
> +
> +DESCRIPTION = "A messaging framework for Python"
> +BUGTRACKER = "http://github.com/celery/kombu/issues/"
> +HOMEPAGE = "http://kombu.readthedocs.org"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
> +
> +SRC_URI[md5sum] = "5f751ea817b1f6a4293d4e3a01040d4f"
> +SRC_URI[sha256sum] =
> "1760b54b1d15a547c9a26d3598a1c8cdaf2436386ac1f5561934bc8a3cbbbd86"
> +
> +inherit setuptools pypi
> +
> +PYPI_PACKAGE = "kombu"
> +
> +FILES_${PN}-doc += "${datadir}/${SRCNAME}"
> +
> +RDEPENDS_${PN} = " \
> +        python-amqp \
> +        "
> --
> 2.17.1
>
>
> 
>
>

--00000000000033d8b205b1ca9058
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please also submit a patch to add these three recipes to p=
ackagroup-meta-python2<div><a href=3D"https://git.openembedded.org/meta-pyt=
hon2/tree/recipes-core/packagegroups/packagegroup-meta-python2.bb">https://=
git.openembedded.org/meta-python2/tree/recipes-core/packagegroups/packagegr=
oup-meta-python2.bb</a><br></div><div><br></div><div>The CI system behind t=
his layer depends on the packagroup staying up to date.</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 11=
, 2020 at 5:46 PM Babak Sarashki &lt;<a href=3D"mailto:babak.sarashki@windr=
iver.com">babak.sarashki@windriver.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Signed-off-by: Babak Sarashki &lt;<a =
href=3D"mailto:babak.sarashki@windriver.com" target=3D"_blank">babak.sarash=
ki@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-kombu_4.6.6.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python-kombu_4.6.6.bb</a> | 23 +++++++++=
++++++++++<br>
=C2=A01 file changed, 23 insertions(+)<br>
=C2=A0create mode 100644 recipes-devtools/python/<a href=3D"http://python-=
kombu_4.6.6.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.6.bb<=
/a><br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-kombu_4.6.6.=
bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.6.bb</a> b/recipe=
s-devtools/python/<a href=3D"http://python-kombu_4.6.6.bb" rel=3D"noreferre=
r" target=3D"_blank">python-kombu_4.6.6.bb</a><br>
new file mode 100644<br>
index 0000000..72a9d90<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/<a href=3D"http://python-kombu_4.6.6.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python-kombu_4.6.6.bb</a><br>
@@ -0,0 +1,23 @@<br>
+SUMMARY =3D &quot;The aim of Kombu is to make messaging in Python as easy=
 as possible by providing \<br>
+an idiomatic high-level interface for the AMQ protocol, and also provide =
proven and tested \<br>
+solutions to common messaging problems.&quot;<br>
+<br>
+DESCRIPTION =3D &quot;A messaging framework for Python&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"http://github.com/celery/kombu/issues/" r=
el=3D"noreferrer" target=3D"_blank">http://github.com/celery/kombu/issues/<=
/a>&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://kombu.readthedocs.org" rel=3D"norefe=
rrer" target=3D"_blank">http://kombu.readthedocs.org</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;BSD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddaea7c168428449fbee05e644=
df929f4&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;5f751ea817b1f6a4293d4e3a01040d4f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1760b54b1d15a547c9a26d3598a1c8cdaf2436386ac1=
f5561934bc8a3cbbbd86&quot;<br>
+<br>
+inherit setuptools pypi<br>
+<br>
+PYPI_PACKAGE =3D &quot;kombu&quot;<br>
+<br>
+FILES_${PN}-doc +=3D &quot;${datadir}/${SRCNAME}&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-amqp \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000033d8b205b1ca9058--

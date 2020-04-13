Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.766.1586817339860734749
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 15:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MwZNZd34;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id i19so11124110ioh.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2020 15:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6XY1AFQgqNR94ubACkXzmnah3xtJxF3vgYEpx/FCorY=;
        b=MwZNZd346fU0lWw9BDl6pogJvrUCoXwTajl/gBuzhv+5kjsqrngjPwrcq8ByUQ5yCQ
         yFNtvOjE093jpWOHusi1ccrF7gdD+A3ZDYBXbJUOdwr8OFRbU41RjlzyhBK/nsDGLCOZ
         mN9TlHLKP7izMHftMLBokag4zp/nsRRBvVLFncKyrmmYjYtY1AegoHU6BG7MlQ3+aqhP
         pRQb1qgEMlJyg3e4P7KkCJ9hsSzTJVeXUp9SVOoLj4v9B0iZZgu2Qk1rDxzrKse3zCMP
         wV0j/+7kY35LIFmc1K2ktDBsLodtOFk0vMI+yPhZnbv8H09c6B9e5BPygt4fpi1QYFKZ
         EOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6XY1AFQgqNR94ubACkXzmnah3xtJxF3vgYEpx/FCorY=;
        b=uebtQRSOrO8mvkffOrMEn8pb5FUIGQj8r4OQab9pDR0X+ElrM9cS0dLEu9d7uGTGrC
         8YCx4vyi2oR0BNgAT0iHFkhHN9RlQS6VyJ2XMaUQ+sZYMoyf3huCePkCc/i/zF2S+LCP
         Pr52TV63I5PChDtRVxWOg/VKxxZyvC+SDVKI2w6WYMjkAVDCmYYOqeCKFmjAuJ5992ZB
         HEfkN6Ehx64cHZd8SNTcR9TKyXG92Di2m+3iBbxA37B8gQDJRoldIjKMIEXuoLhCUOqD
         wAkrkbKYEV5sUd+yvtnhuqnDbM5GLqwKUYAZQHeoM2pMB8Ggx8aMN6LTm5+Tloa09q/R
         6Ndg==
X-Gm-Message-State: AGi0PuaBCF8J4tSQsyInc0e2C3BQpOz+S9/GYPLRbEVb51lpsPrwjTpT
	BJo+DXQxNOR0zml8KDC8BHvjHu0PG3fbmxfDWNA=
X-Google-Smtp-Source: APiQypIcmxiROMfxGOU29LdPyHmEY00WYQKHJpSSmpOaCg7tL0Pg7uKL9bblkK89X67NH13z6E5LMbRckBW4C7HTPuw=
X-Received: by 2002:a5d:8407:: with SMTP id i7mr18355102ion.210.1586817339155;
 Mon, 13 Apr 2020 15:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <1586807349-28557-1-git-send-email-leon.anavi@konsulko.com> <1586807349-28557-3-git-send-email-leon.anavi@konsulko.com>
In-Reply-To: <1586807349-28557-3-git-send-email-leon.anavi@konsulko.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 13 Apr 2020 15:35:28 -0700
Message-ID: <CANx9H-C2ghXKToh9qjFWThE1N_7e939JyFLEp2H2XEM2PdLThA@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH 3/3] python-docker: move from meta-virtualization
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d2e95d05a333b3ec"

--000000000000d2e95d05a333b3ec
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 13, 2020 at 12:49 PM Leon Anavi <leon.anavi@konsulko.com> wrote:

> Support for Python 2 has been dropped in meta-virtualization. Move
> python-docker recipes to meta-python2 for backward compatibility
> of legacy projects. Dependencies python-docker-pycreds and
> python-websocket-client should be also present in meta-python2.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  recipes-devtools/python/python-docker_4.1.0.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 recipes-devtools/python/python-docker_4.1.0.bb
>
> diff --git a/recipes-devtools/python/python-docker_4.1.0.bb
> b/recipes-devtools/python/python-docker_4.1.0.bb
> new file mode 100644
> index 0000000..434e463
> --- /dev/null
> +++ b/recipes-devtools/python/python-docker_4.1.0.bb


Latest upstream is 4.2.0. Can you look into an upgrade?

> <http://python-docker_4.1.0.bb>
> @@ -0,0 +1,18 @@
> +SUMMARY = "A Python library for the Docker Engine API."
> +HOMEPAGE = "https://github.com/docker/docker-py"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
> +
> +inherit pypi setuptools
> +
> +SRC_URI[md5sum] = "e1e8dc73e3220fe9eec1faf80b0290de"
> +SRC_URI[sha256sum] =
> "6e06c5e70ba4fad73e35f00c55a895a448398f3ada7faae072e2bb01348bafc1"
> +
> +RDEPENDS_${PN} += " \
> +       python-misc \
> +       python-six \
> +       python-docker-pycreds \
> +       python-requests \
> +       python-websocket-client \
> +       python-backports-ssl \
> +"
> --
> 2.7.4
>
> 
>

--000000000000d2e95d05a333b3ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 13, 2020 at 12:49 PM Leon Anavi &lt;<a href=3D=
"mailto:leon.anavi@konsulko.com">leon.anavi@konsulko.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Support for Python 2 has been dropped =
in meta-virtualization. Move<br>
python-docker recipes to meta-python2 for backward compatibility<br>
of legacy projects. Dependencies python-docker-pycreds and<br>
python-websocket-client should be also present in meta-python2.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-docker_4.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">python-docker_4.1.0.bb</a> | 18 ++++++++=
++++++++++<br>
=C2=A01 file changed, 18 insertions(+)<br>
=C2=A0create mode 100644 recipes-devtools/python/<a href=3D"http://python-=
docker_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-docker_4.1.0.b=
b</a><br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-docker_4.1.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python-docker_4.1.0.bb</a> b/reci=
pes-devtools/python/<a href=3D"http://python-docker_4.1.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-docker_4.1.0.bb</a><br>
new file mode 100644<br>
index 0000000..434e463<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/<a href=3D"http://python-docker_4.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">python-docker_4.1.0.bb</a></blockquote><=
div dir=3D"auto"><br></div><div dir=3D"auto">Latest upstream is 4.2.0. Can =
you look into an upgrade?</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><a href=3D"ht=
tp://python-docker_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank"></a><br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;A Python library for the Docker Engine API.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/docker/docker-py" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/docker/docker-py</a>&quot=
;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D34f3846f940453127309b920e=
eb89660&quot;<br>
+<br>
+inherit pypi setuptools<br>
+<br>
+SRC_URI[md5sum] =3D &quot;e1e8dc73e3220fe9eec1faf80b0290de&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6e06c5e70ba4fad73e35f00c55a895a448398f3ada7f=
aae072e2bb01348bafc1&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python-misc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python-six \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python-docker-pycreds \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python-requests \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python-websocket-client \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python-backports-ssl \<br>
+&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--000000000000d2e95d05a333b3ec--

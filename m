Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.7858.1626788457952622348
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 06:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fBWmauWn;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id x17so28466753edd.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=imJvPvzem40IysasD8bT+zjZvYtOTv9rQFsKZWrbW9k=;
        b=fBWmauWn4OIb0hTZJ9Kf9Ux7AKQedHyFJPksNiR205J2KcQUPeRDCEnXVsv8YxJ3S3
         VbPDck8RMRTVc8el4zVsPRME94E66mBKtCUrdK5meMRWPRK13mZ2mruruACM/GKh64Ed
         6m0lmBqKssF0DUj0XkLn01pDFMedAHPOs6oFMHcvoAiAd3RWRYxk97uDrmBqFUj/n7e1
         02bMg6X/8+0WIMQKAi2QStXG1uZK7rLmdQnJiyMdtoc5kPcrEtzuPJXuXECqx3mHQO0G
         g1W25Umooo0tQRkAB2OG8GnJ48FX82r9ypvhZKL29X/STBacv9fFRYWSN776ItKhdd+r
         WKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=imJvPvzem40IysasD8bT+zjZvYtOTv9rQFsKZWrbW9k=;
        b=PMPkT+RrDcEixD4hOGUkyZbIPoo/nAMjvwNJlFDSVfDvZ8yXHY8SsN1byKI9tIeRnZ
         cWo/JSAEDh+i79SMYRzaY7BXYN2xP7oKXTgzrMXAjrnevWVt38Dy+WX9vl70rycTYvfC
         j9TEYCF/XOzVd+utOv6vFqRMjA+q5HseVCQHOQ3lgdUhN3kbB0d7K+VVjQ36eWt5S5CR
         OucX0kQzHVaogz+LeZl7etHCrMrSHChQd7WGBl1TZQWV8TsPvbUsvE2AKOtMP0nEEmMr
         df3mzqPYmwBWWs4yFwKE5zLMJkvb2qkFDqjlDb/cDBDCdvSMsKwmp89taSIhKgbPHEMi
         ktwQ==
X-Gm-Message-State: AOAM5325z7JKXjdDu0s4OI2BIS4wGRzROCubQtWDFZshm9PXfOyy9K0I
	dEfcbW+fzf2NKXdJc7eyY7DU1UlOU6fX/yUQljk=
X-Google-Smtp-Source: ABdhPJwjUQGFKGXIuym769kaz23Gj/vVcRTgjjFpYr4vHONaj0LF3xI0NLht4ox+18mJMvLMhMSprTvHSnZHYx6t9Kc=
X-Received: by 2002:a05:6402:1601:: with SMTP id f1mr40577287edv.388.1626788456388;
 Tue, 20 Jul 2021 06:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210706181849.18345-1-joe.slater@windriver.com>
 <CA+chaQfgv6eu=ebwLwK+sa9_0uSAzoa=B+j3LCqmjpkyh9qcgQ@mail.gmail.com> <BY5PR11MB39929CA0D8D07C1689185FF488E19@BY5PR11MB3992.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB39929CA0D8D07C1689185FF488E19@BY5PR11MB3992.namprd11.prod.outlook.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 20 Jul 2021 15:40:45 +0200
Message-ID: <CA+chaQdbx5LUJJ_5OsPvO_SU+29gVB00j1SBGjsNAD4J3u-G6w@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH 1/1] python: use update-alternatives for python link
To: Joe Slater <joe.slater@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000115cc805c78e3491"

--000000000000115cc805c78e3491
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Would it make sense to replace shebang in such scripts to explicitly call
python3? As it's not only the u-a for the python symlink, but RDEPENDS of
the package should pull the right interpreter as well. Always installing
supported python3-core for blktrace scripts is IMHO much better than
allowing blktrace script so run with EOL python2 in some weird case when
python2 is in the image and python3 isn't.

At least that's what I'm doing with generic shebangs in meta-ros recipes.

Also as you might have noticed the target python is already blacklisted in
this layer.

On Mon, Jul 19, 2021 at 11:45 PM Joe Slater <joe.slater@windriver.com>
wrote:

> Sorry for the delay, but I your message got put in a folder I don=E2=80=
=99t look
> at much.  Some projects, like blktrace, have scripts that work with pyth=
on2
> or python3 and want to leave the shebangs =E2=80=9Cgeneric=E2=80=9D.  Of=
 course, that won=E2=80=99t
> work if python3 doesn=E2=80=99t supply =E2=80=9Cpython=E2=80=9D.  I admi=
t that wanting to put both
> python2 and python3 in an image is weird, but we could do it and have bo=
th
> versions supply =E2=80=9Cpython=E2=80=9D.
>
>
>
> I don=E2=80=99t see any downside to making =E2=80=9Cpython=E2=80=9D a u-=
a link.  It=E2=80=99s already a
> link.  I admit, though, that there is no guarantee python3 will be allow=
ed
> to supply a u-a link.
>
>
>
> Joe
>
>
>
> *From:* Martin Jansa <martin.jansa@gmail.com>
> *Sent:* Friday, July 9, 2021 5:07 AM
> *To:* Slater, Joseph <joe.slater@windriver.com>
> *Cc:* openembedded-devel <openembedded-devel@lists.openembedded.org>;
> MacLeod, Randy <Randy.MacLeod@windriver.com>
> *Subject:* Re: [oe] [meta-python2][PATCH 1/1] python: use
> update-alternatives for python link
>
>
>
> As this wasn't needed until now and python3 also doesn't use u-a for
> ${bindir}/python as all python3 scripts should explicitly call python3, =
why
> do you think it would be worth adding to dead python2 recipe?
>
>
>
> If you need this symlink would it make sense to use separate recipe
> like python-is-python2/python-is-python3 packages in debian based system=
s
> and create the symlink there instead of u-a in python itself?
>
>
>
> On Tue, Jul 6, 2021 at 8:19 PM Joe Slater <joe.slater@windriver.com>
> wrote:
>
> Make the link of python to python2.7 an alternative.  This
> allows python3 to provide a link if we are not around, but
> makes our link override any python3 provides, assuming he
> uses the default priority.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-devtools/python/python_2.7.18.bb
> <https://urldefense.com/v3/__http:/python_2.7.18.bb__;!!AjveYdw8EvQ!IzYw=
73MQjD6zus_YwfXCpL1kV27Ob5bh1iViRVPnJ4yt0eoqSXx8vPwZ9wdWmHEceZ8$>
> | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/python/python_2.7.18.bb
> <https://urldefense.com/v3/__http:/python_2.7.18.bb__;!!AjveYdw8EvQ!IzYw=
73MQjD6zus_YwfXCpL1kV27Ob5bh1iViRVPnJ4yt0eoqSXx8vPwZ9wdWmHEceZ8$>
> b/recipes-devtools/python/python_2.7.18.bb
> <https://urldefense.com/v3/__http:/python_2.7.18.bb__;!!AjveYdw8EvQ!IzYw=
73MQjD6zus_YwfXCpL1kV27Ob5bh1iViRVPnJ4yt0eoqSXx8vPwZ9wdWmHEceZ8$>
> index 7350562..3faf154 100644
> --- a/recipes-devtools/python/python_2.7.18.bb
> <https://urldefense.com/v3/__http:/python_2.7.18.bb__;!!AjveYdw8EvQ!IzYw=
73MQjD6zus_YwfXCpL1kV27Ob5bh1iViRVPnJ4yt0eoqSXx8vPwZ9wdWmHEceZ8$>
> +++ b/recipes-devtools/python/python_2.7.18.bb
> <https://urldefense.com/v3/__http:/python_2.7.18.bb__;!!AjveYdw8EvQ!IzYw=
73MQjD6zus_YwfXCpL1kV27Ob5bh1iViRVPnJ4yt0eoqSXx8vPwZ9wdWmHEceZ8$>
> @@ -34,7 +34,14 @@ SRC_URI +=3D " \
>
>  S =3D "${WORKDIR}/Python-${PV}"
>
> -inherit autotools multilib_header python-dir pythonnative ptest
> +inherit autotools multilib_header python-dir pythonnative ptest
> update-alternatives
> +
> +# Make 'python' an alternative so that if python3 also provides it, we
> will be the default.
> +#
> +ALTERNATIVE_${PN}-core =3D "python"
> +ALTERNATIVE_LINK_NAME[python] =3D "${bindir}/python"
> +ALTERNATIVE_TARGET[python] =3D "${bindir}/python${PYTHON_MAJMIN}"
> +ALTERNATIVE_PRIORITY[python] =3D "50"
>
>  EXTRA_OECONF +=3D "--with-system-ffi"
>
> --
> 2.29.2
>
>
>
>=20
>
>

--000000000000115cc805c78e3491
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would it make sense to replace shebang in such scripts to =
explicitly call python3? As it&#39;s not only the u-a for the python symlin=
k, but RDEPENDS of the package should pull the right interpreter as well. A=
lways installing supported python3-core for blktrace scripts is IMHO much b=
etter than allowing blktrace script so run with EOL python2 in some weird c=
ase when python2 is in the image and python3 isn&#39;t.<div><br></div><div>=
<div>At least that&#39;s what I&#39;m doing with generic shebangs in meta-r=
os recipes.</div></div><div><br></div><div>Also as you might have noticed t=
he target python is already blacklisted in this layer.</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 19,=
 2021 at 11:45 PM Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com=
">joe.slater@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"gmail-m_-7830879011287733446WordSection1">
<p class=3D"MsoNormal">Sorry for the delay, but I your message got put in =
a folder I don=E2=80=99t look at much.=C2=A0 Some projects, like blktrace, =
have scripts that work with python2 or python3 and want to leave the sheban=
gs =E2=80=9Cgeneric=E2=80=9D.=C2=A0 Of course, that won=E2=80=99t work if p=
ython3
 doesn=E2=80=99t supply =E2=80=9Cpython=E2=80=9D.=C2=A0 I admit that wanti=
ng to put both python2 and python3 in an image is weird, but we could do it=
 and have both versions supply =E2=80=9Cpython=E2=80=9D.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I don=E2=80=99t see any downside to making =E2=80=
=9Cpython=E2=80=9D a u-a link.=C2=A0 It=E2=80=99s already a link.=C2=A0 I =
admit, though, that there is no guarantee python3 will be allowed to supply=
 a u-a link.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Joe<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-=
left:1.5pt solid blue;padding:0in 0in 0in 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border=
-top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; <br>
<b>Sent:</b> Friday, July 9, 2021 5:07 AM<br>
<b>To:</b> Slater, Joseph &lt;<a href=3D"mailto:joe.slater@windriver.com" =
target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
<b>Cc:</b> openembedded-devel &lt;<a href=3D"mailto:openembedded-devel@lis=
ts.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedde=
d.org</a>&gt;; MacLeod, Randy &lt;<a href=3D"mailto:Randy.MacLeod@windriver=
.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
<b>Subject:</b> Re: [oe] [meta-python2][PATCH 1/1] python: use update-alte=
rnatives for python link<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">As this wasn&#39;t needed until now and python3 als=
o doesn&#39;t use u-a for ${bindir}/python as all python3 scripts should ex=
plicitly call python3, why do you think it would be worth adding to dead py=
thon2 recipe?<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">If you need this symlink would it make sense to use=
 separate recipe like=C2=A0python-is-python2/python-is-python3 packages in =
debian based systems and create the symlink there instead of u-a in python =
itself?<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, Jul 6, 2021 at 8:19 PM Joe Slater &lt;<a hr=
ef=3D"mailto:joe.slater@windriver.com" target=3D"_blank">joe.slater@windriv=
er.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;=
border-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:=
4.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Make the link of pytho=
n to python2.7 an alternative.=C2=A0 This<br>
allows python3 to provide a link if we are not around, but<br>
makes our link override any python3 provides, assuming he<br>
uses the default priority.<br>
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" =
target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__http:=
/python_2.7.18.bb__;!!AjveYdw8EvQ!IzYw73MQjD6zus_YwfXCpL1kV27Ob5bh1iViRVPnJ=
4yt0eoqSXx8vPwZ9wdWmHEceZ8$" target=3D"_blank">python_2.7.18.bb</a> | 9 +++=
+++++-<br>
=C2=A01 file changed, 8 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/=
__http:/python_2.7.18.bb__;!!AjveYdw8EvQ!IzYw73MQjD6zus_YwfXCpL1kV27Ob5bh1i=
ViRVPnJ4yt0eoqSXx8vPwZ9wdWmHEceZ8$" target=3D"_blank">python_2.7.18.bb</a> =
b/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__http:/pyth=
on_2.7.18.bb__;!!AjveYdw8EvQ!IzYw73MQjD6zus_YwfXCpL1kV27Ob5bh1iViRVPnJ4yt0e=
oqSXx8vPwZ9wdWmHEceZ8$" target=3D"_blank">python_2.7.18.bb</a><br>
index 7350562..3faf154 100644<br>
--- a/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__http:=
/python_2.7.18.bb__;!!AjveYdw8EvQ!IzYw73MQjD6zus_YwfXCpL1kV27Ob5bh1iViRVPnJ=
4yt0eoqSXx8vPwZ9wdWmHEceZ8$" target=3D"_blank">python_2.7.18.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__http:=
/python_2.7.18.bb__;!!AjveYdw8EvQ!IzYw73MQjD6zus_YwfXCpL1kV27Ob5bh1iViRVPnJ=
4yt0eoqSXx8vPwZ9wdWmHEceZ8$" target=3D"_blank">python_2.7.18.bb</a><br>
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
<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

<br>
<br>
<br>
</blockquote></div>

--000000000000115cc805c78e3491--

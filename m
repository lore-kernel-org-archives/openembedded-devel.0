Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.435.1626798787678302538
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 09:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KLf+HY4g;
 spf=pass (domain: linaro.org, ip: 209.85.218.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f52.google.com with SMTP id nd37so35242292ejc.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 09:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=SYfvez8memq7qHPRdzbVoeMv3PstiFs3mBRv8G+ZW8k=;
        b=KLf+HY4gRYCgFlZ8xFBcaUO3bIlV3UQUiI5424MAwGwmremsIqVpy7durTZ1UY7q60
         pleRdnHlCt2LkNL6Rbdim8AgoHkJnSXkEXz07BFmArEdXY+hBPH4fkmORyW0AdIf9Q6Y
         XU0kuBa54lv7X17u8Irn/5u+2SOwHvNSNgnR78eyyHPHJZhu2cC2Znsvn3qbhYm+dWeD
         8C9N1Qz7eB0CywzIhQd9UFjt2M6102uKhHIdNoZOR1XLbpp4YXTIKOBic8I49K7CnP6U
         Nt4o4xizxA6KgHqne+0YjTBLqYBP/tkcAQg12oyTQMBNrwnMSG90TqOZNgcVtHuhIVvY
         Ah3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=SYfvez8memq7qHPRdzbVoeMv3PstiFs3mBRv8G+ZW8k=;
        b=Q/lcc1kTHPFu1641vZeyIlp3UT8DNiSnzFJbaIgBl8wDqyGjVDylnkXjF8FpErUz7X
         LUTMVQl5ZvdcNsC81gH3qIJvyDWloEtiwxwbzRSO/zYhWaeOIuvFRjw7WZGpUTSOeiIm
         jwlW1/kSAwvtW4Pe5yp+VxCoY/CwEeE+oQHIAc2vhSDlPrIXoPtDaMANxGLu1O0IFDGB
         52aMeXy41T2EcZNSBmenYTXH8+R15FAn1nuRTOuzpRMEYvqHwcyus0YE31QQUBXbFbqz
         uslvFefDlvjZu30mEXHoWj37lIl+vOpn849FJDXQebDldgGRLyvX85QeVd+sGeDSEfqW
         4Xqg==
X-Gm-Message-State: AOAM531TxcWHLF3pn8hJL/WqFb9aI3hzOptrTerUs/ekiFRZM/0ThMXI
	FUsxfKs9psPlSoI62cBay7NZYldjOEeb20gVZtBzqw==
X-Google-Smtp-Source: ABdhPJyo7yhwsus3cboP/yJmUnrm7tTK5u4MQ1lybf71cyM/eVLGOynt2M+fSis/gY1uj1ZkMbGHwu2Nt7BNU31lhes=
X-Received: by 2002:a17:906:384c:: with SMTP id w12mr33649820ejc.445.1626798785945;
 Tue, 20 Jul 2021 09:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
In-Reply-To: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 20 Jul 2021 18:32:54 +0200
Message-ID: <CAP71Wjy6Ka+e5+F57uizPGuLHdJumYAXLP131GKdFO9+ndt0iw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Various fixes for YP compatible
To: akuster808 <akuster808@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c1f9ee05c7909ba6"

--000000000000c1f9ee05c7909ba6
Content-Type: text/plain; charset="UTF-8"

d'oh... I meant to add it in the prefix.. but these patches are for dunfell
branch.

On Tue, Jul 20, 2021 at 6:31 PM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

> There are some pending requests for YP compatible for layers which
> depend on meta-oe, meta-python and meta-networking. In dunfell, these
> layers do not PASS the yocto-check-layer compatibility script. With
> these patches applied, I am able to get this:
>
> INFO: Summary of results:
> INFO:
> INFO: meta-networking ... PASS
> INFO: meta-python ... PASS
> INFO: meta-oe ... PASS
>
> Khem Raj (1):
>   libdevmapper,lvm2: Do not inherit license
>
> Nicolas Dechesne (4):
>   python3-markupsafe: remove recipe
>   python3-jinja2: remove recipe
>   python3-{pyyaml,cython,pyparsing}: move from meta-python to meta-oe
>   ostree: Do not check for meta-python
>
>  .../recipes-devtools/python/python-cython.inc |  0
>  .../python/python3-cython_0.29.14.bb          |  0
>  .../python/python3-pyparsing_2.4.6.bb         |  0
>  .../python/python3-pyyaml_5.3.1.bb            |  0
>  .../recipes-extended/ostree/ostree_2020.3.bb  |  2 +-
>  meta-oe/recipes-support/lvm2/lvm2.inc         |  5 +--
>  .../python/python3-jinja2/run-ptest           |  3 --
>  .../python/python3-jinja2_2.11.2.bb           | 43 -------------------
>  .../python/python3-markupsafe/run-ptest       |  3 --
>  .../python/python3-markupsafe_1.1.1.bb        |  2 -
>  10 files changed, 3 insertions(+), 55 deletions(-)
>  rename {meta-python => meta-oe}/recipes-devtools/python/python-cython.inc
> (100%)
>  rename {meta-python => meta-oe}/recipes-devtools/python/
> python3-cython_0.29.14.bb (100%)
>  rename {meta-python => meta-oe}/recipes-devtools/python/
> python3-pyparsing_2.4.6.bb (100%)
>  rename {meta-python => meta-oe}/recipes-devtools/python/
> python3-pyyaml_5.3.1.bb (100%)
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-jinja2/run-ptest
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-jinja2_2.11.2.bb
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-markupsafe_1.1.1.bb
>
> --
> 2.29.2
>
>

--000000000000c1f9ee05c7909ba6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>d&#39;oh... I meant to add it in the prefix.. but the=
se patches are for dunfell branch.=C2=A0</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 20, 2021 at 6:31 PM Nic=
olas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.de=
chesne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">There are some pending requests for YP compatible for laye=
rs which<br>
depend on meta-oe, meta-python and meta-networking. In dunfell, these<br>
layers do not PASS the yocto-check-layer compatibility script. With<br>
these patches applied, I am able to get this:<br>
<br>
INFO: Summary of results:<br>
INFO:<br>
INFO: meta-networking ... PASS<br>
INFO: meta-python ... PASS<br>
INFO: meta-oe ... PASS<br>
<br>
Khem Raj (1):<br>
=C2=A0 libdevmapper,lvm2: Do not inherit license<br>
<br>
Nicolas Dechesne (4):<br>
=C2=A0 python3-markupsafe: remove recipe<br>
=C2=A0 python3-jinja2: remove recipe<br>
=C2=A0 python3-{pyyaml,cython,pyparsing}: move from meta-python to meta-oe<=
br>
=C2=A0 ostree: Do not check for meta-python<br>
<br>
=C2=A0.../recipes-devtools/python/python-cython.inc |=C2=A0 0<br>
=C2=A0.../python/<a href=3D"http://python3-cython_0.29.14.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-cython_0.29.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../python/<a href=3D"http://python3-pyparsing_2.4.6.bb" rel=3D"noref=
errer" target=3D"_blank">python3-pyparsing_2.4.6.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../python/<a href=3D"http://python3-pyyaml_5.3.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pyyaml_5.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../recipes-extended/ostree/<a href=3D"http://ostree_2020.3.bb" rel=
=3D"noreferrer" target=3D"_blank">ostree_2020.3.bb</a>=C2=A0 |=C2=A0 2 +-<b=
r>
=C2=A0meta-oe/recipes-support/lvm2/lvm2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 5 +--<br>
=C2=A0.../python/python3-jinja2/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 3 --<br>
=C2=A0.../python/<a href=3D"http://python3-jinja2_2.11.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-jinja2_2.11.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 43 -------------------<br>
=C2=A0.../python/python3-markupsafe/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 --<br>
=C2=A0.../python/<a href=3D"http://python3-markupsafe_1.1.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-markupsafe_1.1.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 -<br>
=C2=A010 files changed, 3 insertions(+), 55 deletions(-)<br>
=C2=A0rename {meta-python =3D&gt; meta-oe}/recipes-devtools/python/python-c=
ython.inc (100%)<br>
=C2=A0rename {meta-python =3D&gt; meta-oe}/recipes-devtools/python/<a href=
=3D"http://python3-cython_0.29.14.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-cython_0.29.14.bb</a> (100%)<br>
=C2=A0rename {meta-python =3D&gt; meta-oe}/recipes-devtools/python/<a href=
=3D"http://python3-pyparsing_2.4.6.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-pyparsing_2.4.6.bb</a> (100%)<br>
=C2=A0rename {meta-python =3D&gt; meta-oe}/recipes-devtools/python/<a href=
=3D"http://python3-pyyaml_5.3.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-pyyaml_5.3.1.bb</a> (100%)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2=
/run-ptest<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-jinja2_2.11.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
jinja2_2.11.2.bb</a><br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-markup=
safe/run-ptest<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-markupsafe_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-markupsafe_1.1.1.bb</a><br>
<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div></div>

--000000000000c1f9ee05c7909ba6--

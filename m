Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.21809.1590180177737752976
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 13:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cfdO3thn;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id x13so5366110qvr.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 13:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CaIcbRNrBERGOkJbLFPh1zGmfP/uRWSp6s0nklRES+I=;
        b=cfdO3thn16ff5+iDln6T4gX0Yr9XoLs8tKk/wCzLP8aktB6xJIm2kab3+Jr4eSWs1T
         9BH5F7X5i+X5zhwvQ8eZ4EADLTzI0Ry5J1XlNSj6SIXHJp5OKarwnzFGnWBwWTGekMjS
         QdDOYD1QZdHxRXSb6Nf5y/BWhBKqFcPrsGiysYtmOaw8aqbzs0KtXS3cvQXEvMTsmwqC
         cUcTYoleZTw5yTZ0q8EDM1X4s1eHjbyUA9GInv+zOYh7CqWJPc355YU1MV0krbOmx/rL
         laB20R2z1hDSx2IbNNFAth4sHCqhjplNd/nWej3l4FiJ1p85SaVTGSxwy4G3CGapdh/M
         UwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CaIcbRNrBERGOkJbLFPh1zGmfP/uRWSp6s0nklRES+I=;
        b=sBRDspaIzp8/iuEfUVdTiVsZgzCYy4DLuyMaHzQAOQyjWnM+SRRYYKJqngQZxUl1Xb
         QH8MGaaOHVFVhDSthqhjKTOZJNkV67kZ8K4uTjQ25rvhCkS9/u2pZDOz+4Oox9eDCYxK
         uqzmy3+qRjIIUXNpwLSq1zinVPh4V+10u5lVGz8vjL7b0xSJZSGURuRFXwpt6oFoB+o7
         5u1ebYpOMRXuhZ9guE3y7GquDWzuFrg+F6UaCpH/9JMtHDWXJ5Zq01+570RXFnIVmJfn
         9Sx890WdCbG0NNx0jW4X+NabU/KapgdiAj9kXtxCAseKHRswGIHbU5jO3w9xz5JBzRh4
         4wUw==
X-Gm-Message-State: AOAM531MvoB6MTnILYjbuJNam70igVTp7sQbr+xmY3KXeukc7D4EW/CP
	leh/ObzZCfBytdh6hE/YqwUYfOvcy4UMSeRXzZU=
X-Google-Smtp-Source: ABdhPJwyMWsogPqaOZ04+neGmIXgk+jzYKDBK8hAIfTPfsZ4HEy5Fco4ji3a8Z/WRT4mW1BvfvYyTcuif/psjGDDRwE=
X-Received: by 2002:a05:6214:3f0:: with SMTP id cf16mr5778590qvb.4.1590180176699;
 Fri, 22 May 2020 13:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200522121333.25045-1-domarys.correa@ossystems.com.br>
 <20200522121333.25045-2-domarys.correa@ossystems.com.br> <CAMKF1sq92HXavsXKHabghWhfMJQoxFfW1ER_-O7G6BtAESQXCg@mail.gmail.com>
 <CAJA1DWvAoAXHKzNkjZ5nJQJ9OFJqPnmiH+xwKqoRtQF-2VMsmg@mail.gmail.com> <CAMKF1sosNy+780rp7pPJtixmguePdKKrbO4psRiuBEb7PC_GKA@mail.gmail.com>
In-Reply-To: <CAMKF1sosNy+780rp7pPJtixmguePdKKrbO4psRiuBEb7PC_GKA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 22 May 2020 13:42:30 -0700
Message-ID: <CAMKF1soJ+m21B+o5yqy4TBQev12zMaRjcc4kYnPP-fXjkkJeJg@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/3] python3-pyudev: Update 0.21.0 -> 0.22.0
To: =?UTF-8?Q?Domarys_da_Silva_Corr=C3=AAa?= <domarys.correa@ossystems.com.br>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

They don't apply cleanly on top of master-next, can you see whats going on?

On Fri, May 22, 2020 at 1:37 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> I don't think so. Just rebase would be good
>
> On Fri, May 22, 2020 at 12:17 PM Domarys da Silva Corr=C3=AAa <domarys.c=
orrea@ossystems.com.br> wrote:
>>
>> Hello,
>>
>> I did the rebase, and tested it again successfully. Is there a specific=
 point that I should review?
>>
>> att,
>>
>> On Fri, May 22, 2020 at 12:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> Please rebase on top of master or master-next,
>>>
>>> Thanks
>>> Khem
>>>
>>> On Fri, May 22, 2020 at 5:13 AM Domarys Correa
>>> <domarys.correa@ossystems.com.br> wrote:
>>> >
>>> > Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
>>> > ---
>>> >  ...hon3-pyudev_0.21.0.bb =3D> python3-pyudev_0.22.0.bb} | 11 ++++++=
+----
>>> >  1 file changed, 7 insertions(+), 4 deletions(-)
>>> >  rename meta-python/recipes-devtools/python/{python3-pyudev_0.21.0.b=
b =3D> python3-pyudev_0.22.0.bb} (70%)
>>> >
>>> > diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21=
.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
>>> > similarity index 70%
>>> > rename from meta-python/recipes-devtools/python/python3-pyudev_0.21.=
0.bb
>>> > rename to meta-python/recipes-devtools/python/python3-pyudev_0.22.0.=
bb
>>> > index f39847ffa..d5bf058ed 100644
>>> > --- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
>>> > +++ b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
>>> > @@ -1,9 +1,9 @@
>>> >  SUMMARY =3D "A libudev binding"
>>> > +
>>> >  LICENSE =3D "LGPLv2.1+"
>>> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f3=
98e37343"
>>> >
>>> > -SRC_URI[md5sum] =3D "cf4d9db7d772622144ca1be6b5d9353b"
>>> > -SRC_URI[sha256sum] =3D "094b7a100150114748aaa3b70663485dd360457a709=
bfaaafe5a977371033f2b"
>>> > +SRC_URI[sha256sum] =3D "69bb1beb7ac52855b6d1b9fe909eefb0017f38d917c=
ba9939602c6880035b276"
>>> >
>>> >  inherit pypi setuptools3
>>> >
>>> > @@ -12,10 +12,13 @@ do_configure_prepend() {
>>> >      sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
>>> >  }
>>> >
>>> > -RDEPENDS_${PN} =3D "\
>>> > +RDEPENDS_${PN} +=3D "\
>>> > +    libudev \
>>> >      ${PYTHON_PN}-ctypes \
>>> > +    ${PYTHON_PN}-fcntl \
>>> >      ${PYTHON_PN}-misc \
>>> >      ${PYTHON_PN}-six \
>>> >      ${PYTHON_PN}-threading \
>>> > -    libudev \
>>> >  "
>>> > +
>>> > +BBCLASSEXTEND =3D "native nativesdk"
>>> > --
>>> > 2.17.1
>>> >
>>> >=20
>>
>>
>>
>> --
>> Domarys Corr=C3=AAa
>> (55) 5399100-2700
>> domaryscorrea@gmail.com
>> domarys.correa@ossystems.com.br

Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8147F3A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2019 06:35:22 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id r5so15010987qtd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Sep 2019 23:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LxM2EFQ45UBFj6UUOeQ5v21DLwgVFN3SrMnjCxw+Phg=;
	b=rX+pg7s5umBoFlxriIVSvlcAZXmCmJEzh1fRrsy/6R5idlZl54A5CgyxmpziVz9Jyv
	GqEGRIS7TeAQuZtAuLiejTJcrl2gbJZeQmKKC6QNMLXGHJV6lYi4L0PAnnaNqCNfJZ7Y
	wiMppPbEjFAxZuLC4NoWmFMEMU0OWvNn0FfmU3uEI/4mW3s9LC79M/n055tTKM5AK1K6
	5Mpy4ZGU5N2EpPtQW6fJtNoJ/iMZ8aaLmvQsDf4C056nDKFiQokl3Nkk04ryK/TPq1q0
	F8R6IciH7e1EZif4eNYQiCuWx3S4XqfjNAh/MA7jUvHT/aHrMwzXh8i7M0zmb5cDC0aC
	rc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LxM2EFQ45UBFj6UUOeQ5v21DLwgVFN3SrMnjCxw+Phg=;
	b=IucqjPjNKa5d6FPphhcrCJJjbpQgziVE7J/cVQ7hAYJj4jT4iGirGiUIVHizIF0Xyj
	Z+6dLVyhWecV3u77MGGa25b/liLrdf7RMAeDsVhRzvwZvSgKizl05lGQoG09+zfxmgIo
	c7TwIADV1Q+r25iQq9sWw3B1Ef0aS7MElWe0kf/Ux0cnBpsPjVCm19AjOLv/o01qD258
	eRIhZpFTB6BfN+/X1wODOVLoqgIlpohzkPBgSJwWLLkcyhGy4PXBRKDvkKJtAZmwPItW
	i5spapdcy9pHR3sqVAMCcwPoFRJfpCqmPW5P1ftjuzIYyNhKxZXWd+FlPICs6VyVJlm6
	n+6Q==
X-Gm-Message-State: APjAAAXoC+aErLbcqrKB4uQ+gS+4dTIXJ7KJEnccQ18ue/ueg50tP2YC
	2Qbglb7r2DOgoiUE8fh/GeJGoAoRU9JppCV2La+ooBLW
X-Google-Smtp-Source: APXvYqxSFL2UybPxu8g+X7SZnjv3Iwj6tdWdRSxVM7IpBBYVzANHT7wwe8t3INWyVO2G9zV7/EsYl3M81tqKhWfoSUg=
X-Received: by 2002:ad4:4c83:: with SMTP id bs3mr13171892qvb.65.1568010923085; 
	Sun, 08 Sep 2019 23:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <1567401728-113652-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAMKF1spnx4pPh5ObnVTyahxE6Z8y7GCkv3GC_oCwf-fL_eYu9A@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E0C3@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E0C3@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Sep 2019 23:34:57 -0700
Message-ID: <CAMKF1srGjO86q1Mg1po_mb0SKyhhAH69gyqGr76Ah1+STG_+tA@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-cmd2: Add python3 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Sep 2019 06:35:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, please do. or make this rdep optional

On Sun, Sep 8, 2019 at 11:18 PM Zheng, Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Hi Khem
>
> Now python3-colorama  is provided by meta-virtualization.
> Should I submit a new patch of python3-colorama  to meta-oe?
>
> Best regards
>
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
> > -----Original Message-----
> > From: Khem Raj [mailto:raj.khem@gmail.com]
> > Sent: Wednesday, September 04, 2019 1:11 PM
> > To: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu=
.com>
> > Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> > Subject: Re: [oe] [meta-python][PATCH] python-cmd2: Add python3 version
> >
> > 03:10:10 ERROR: Nothing RPROVIDES 'python3-colorama' (but
> > /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-
> > openembedded/meta-python/recipes-devtools/python/python3-
> > cmd2_0.9.16.bb
> > RDEPENDS on or otherwise requires it)
> > 03:10:10 ERROR: Nothing RPROVIDES 'python3-cmd2-dev' (but
> > /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-
> > openembedded/meta-python/recipes-devtools/python/python3-
> > cmd2_0.9.16.bb
> > RDEPENDS on or otherwise requires it)
> > 03:10:10 No eligible RPROVIDERs exist for 'python3-cmd2-dev'
> > 03:10:11 ERROR: Nothing RPROVIDES 'python3-cmd2' (but
> > /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-
> > openembedded/meta-python/recipes-devtools/python/python3-
> > cmd2_0.9.16.bb
> > RDEPENDS on or otherwise requires it)
> > 03:10:11 No eligible RPROVIDERs exist for 'python3-cmd2'
> >
> > On Sun, Sep 1, 2019 at 10:23 PM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.c=
om>
> > wrote:
> > >
> > > Providing a python3 version of python-cmd2.
> > >
> > > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > > ---
> > >  .../recipes-devtools/python/python-cmd2.inc       | 13 +++++++++++++
> > >  .../recipes-devtools/python/python-cmd2_0.9.16.bb | 15 ++-----------=
--
> > >  .../python/python3-cmd2_0.9.16.bb                 |  9 +++++++++
> > >  3 files changed, 24 insertions(+), 13 deletions(-)  create mode
> > > 100644 meta-python/recipes-devtools/python/python-cmd2.inc
> > >  create mode 100644
> > > meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc
> > > b/meta-python/recipes-devtools/python/python-cmd2.inc
> > > new file mode 100644
> > > index 000000000..1a0be778b
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python-cmd2.inc
> > > @@ -0,0 +1,13 @@
> > > +SUMMARY =3D "Extra features for standard library's cmd module"
> > > +HOMEPAGE =3D "http://packages.python.org/cmd2/"
> > > +LICENSE =3D "MIT"
> > > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D01aeabea7ae1529a8e4b674b7107d6bc"
> > > +
> > > +SRC_URI[md5sum] =3D "df35bb2dca8f5e1f6090e1f0aa02960a"
> > > +SRC_URI[sha256sum] =3D
> > "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
> > > +
> > > +inherit pypi
> > > +
> > > +DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
> > > +
> > > +BBCLASSEXTEND =3D "native nativesdk"
> > > diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.16.b=
b
> > > b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
> > > index 94db37a2d..17b6ae285 100644
> > > --- a/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
> > > +++ b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
> > > @@ -1,14 +1,5 @@
> > > -SUMMARY =3D "Extra features for standard library's cmd module"
> > > -HOMEPAGE =3D "http://packages.python.org/cmd2/"
> > > -LICENSE =3D "MIT"
> > > -LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D01aeabea7ae1529a8e4b674b7107d6bc"
> > > -
> > > -SRC_URI[md5sum] =3D "df35bb2dca8f5e1f6090e1f0aa02960a"
> > > -SRC_URI[sha256sum] =3D
> > "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
> > > -
> > > -inherit pypi setuptools
> > > -
> > > -DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
> > > +inherit setuptools
> > > +require python-cmd2.inc
> > >
> > >  RDEPENDS_${PN} +=3D "\
> > >      ${PYTHON_PN}-doctest \
> > > @@ -21,5 +12,3 @@ RDEPENDS_${PN} +=3D "\
> > >      ${PYTHON_PN}-threading \
> > >      ${PYTHON_PN}-textutils \
> > >      "
> > > -
> > > -BBCLASSEXTEND =3D "native nativesdk"
> > > diff --git
> > > a/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
> > > b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
> > > new file mode 100644
> > > index 000000000..f5c5c7e1a
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
> > > @@ -0,0 +1,9 @@
> > > +inherit setuptools3
> > > +require python-cmd2.inc
> > > +
> > > +RDEPENDS_${PN} +=3D "\
> > > +    ${PYTHON_PN}-pyperclip \
> > > +    ${PYTHON_PN}-colorama \
> > > +    ${PYTHON_PN}-attrs \
> > > +    ${PYTHON_PN}-wcwidth \
> > > +    "
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>
>
>


Return-Path: <shantanu@senic.com>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id CD4956D6DE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2019 02:56:34 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id n18-v6so14740096lji.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 18:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P6w/aB+weyUzTF0kphOEMh7VrJmC3ydzy7aGSS/Fyds=;
	b=ERKZM0rV3OUv//Mjpa1TAU4LXw52qATu3zAw4rD9FXDjdhTSuXmZgzJXlta55A1zVJ
	pJN+Fmew3jK8kuIIvdFCuC7191UNr+ke4cF6/Hsn3TeW/tqpz3GFEsKAUy4c2gXfL2AD
	oaQIbPnvpbWUijsFvactfquDYfxgwusIitfNdIVoXUXoUJhLxPWuFcMRyunDfIqIP8If
	8Z+m76SppQnveRwA+0eYxnk8LnbR4wzNMp0Hs3STfEItniZ5djwSaFmoTA9aJe8G9eJy
	hIMstsdhSLDNYMvm/QpGiN07WO9lV7uxGr1MkyRgq7zK5WnsLsrvGAOaGVQypFMwwlMi
	BM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P6w/aB+weyUzTF0kphOEMh7VrJmC3ydzy7aGSS/Fyds=;
	b=IvzyRm+lPrCljiVKXrUi/Y6Db/mz8MhMyluIBuxxhpEtc+TL7GO+xxEt0YItGUVVN5
	K7fMz1E2DU8dw/nzB4oXRsgDfqIp1uIgcxWEaSMZpbsEsMyFquP5GMg+OR9ZWEV1ken8
	Ugo5WfVFJbkz/bYk0xMMQTUFX/46HzM51YxYqknfOWiWOxo0xbwGc5zvJYziwCkbiRxB
	mZX+IZZohUN7+UkJJ3EVNxCXrPZiWbd8N31YRFCRcjmjBggjoMVxILsyml7XzR5Y4IEN
	KtdKr4dSTCQVPg3r637sJWwguTJx+8kjYja+J7YbwQmrRRTWgGmm06QS671INHmBH62d
	i0jg==
X-Gm-Message-State: AJcUukc73RpKkNRbV+qR2wXRnI3GydNEI4M0mO4su8zuGbgiDlbFcz00
	7R7KvNlzVfKJu6aTWhYfbnwO+2Lg5kwwavEVu2TqOg==
X-Google-Smtp-Source: ALg8bN6Y/j+Xan1/pFK8MKHR6e8wRs2ImgdWYH0cQnN9QrEnIgJiVQyX+XPnx9ebijcz/dgqxe1GD8dlXUrvhiicxDY=
X-Received: by 2002:a2e:8ec8:: with SMTP id
	e8-v6mr14934016ljl.162.1547952994842; 
	Sat, 19 Jan 2019 18:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20190119174544.19389-1-shantanu@senic.com>
	<CAMKF1sokeASo4H1JC6oFmZwvM2F_-PHZH0T-nYz04kaEaGd8xw@mail.gmail.com>
In-Reply-To: <CAMKF1sokeASo4H1JC6oFmZwvM2F_-PHZH0T-nYz04kaEaGd8xw@mail.gmail.com>
From: Shantanu Choudhary <shantanu@senic.com>
Date: Sun, 20 Jan 2019 08:26:23 +0530
Message-ID: <CAGeQtJT=5o8dp=vi5gziNZ0CzZtf-DHXB=jUCps1C0dOJ2oW6w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] Add recipe for python bindings of Berkeley DB
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
X-List-Received-Date: Sun, 20 Jan 2019 02:56:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

Thanks for the review and suggesting the fix,

On Sun, Jan 20, 2019 at 4:04 AM Khem Raj <raj.khem@gmail.com> wrote:

> This does not address the build problem that I mentioned, please send
> a fix the dep should be converted into rdep
>
> RDEPENDS_${PN} =3D "python3-core"
>

When I move python3-core to RDEPENDS_${PN} I start getting following error:

FileNotFoundError: [Errno 2] No such file or directory:
'[clipped]/python3-bsddb3/6.2.6-r0/recipe-sysroot/usr/lib/python3.5/config-=
3.5m/Makefile'

We are currently using Rocko 2.4 branch and that's where I am testing the
changes before submitting the patch.


>
> On Sat, Jan 19, 2019 at 9:46 AM Shantanu <shantanu@senic.com> wrote:
> >
> > Included correction suggested from Khem of using STAGING_EXECPREFIXDIR
> >
> > Signed-off-by: Shantanu <shantanu@senic.com>
> > ---
> >  .../python/python3-bsddb3_6.2.6.bb            | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-bsddb3_6.2.6.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.b=
b
> b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
> > new file mode 100644
> > index 000000000..81baf98fd
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY =3D "pybsddb is the Python binding for the Oracle Berkeley DB"
> > +HOMEPAGE =3D "https://www.jcea.es/programacion/pybsddb.htm"
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Db3c8796b7e1f8eda0aef7e242e18ed43"
> > +SRC_URI[sha256sum] =3D
> "42d621f4037425afcb16b67d5600c4556271a071a9a7f7f2c2b1ba65bc582d05"
> > +
> > +inherit pypi setuptools3
> > +
> > +PYPI_PACKAGE =3D "bsddb3"
> > +
> > +DEPENDS =3D "db \
> > +  python3-core \
> > +"
> > +
> > +DISTUTILS_BUILD_ARGS =3D "--berkeley-db=3D${STAGING_EXECPREFIXDIR}"
> > +DISTUTILS_INSTALL_ARGS =3D "--berkeley-db=3D${STAGING_EXECPREFIXDIR}"
> > +
> > +RDEPENDS_${PN} =3D "db"
> > \ No newline at end of file
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


--=20

*Shantanu *

Software Developer at Senic <https://www.senic.com>

Join Newsletter <https://senic.co/join-newsletter> =C2=B7 We're hiring
<https://senic.co/about-senic> =C2=B7 In the News <https://senic.co/in-the-=
news>

SENIC GmbH
Pfuelstr. 5
<https://maps.google.com/?q=3DPfuelstr.+5+10997+Berlin+Germany&entry=3Dgmai=
l&source=3Dg>
10997 Berlin
<https://maps.google.com/?q=3DPfuelstr.+5+10997+Berlin+Germany&entry=3Dgmai=
l&source=3Dg>
Germany
<https://maps.google.com/?q=3DPfuelstr.+5+10997+Berlin+Germany&entry=3Dgmai=
l&source=3Dg>


Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id E01C77C7A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 06:02:14 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id s7so18542221iob.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2019 23:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NbD3GZ+kHIkhc0rOPih+dO+JniQHUUZJxiy7L/5EwK4=;
	b=Yd9nM8L1MKKAWY/ZKfXBDD1HQAF2CYMqt69IgSWIOWClMdoBmu8haKOJYhJ1DQHNnR
	hgRaX/MRDoslNQcBEwB0m5m6T0UJrCfgS0cfVKhKTf0w9qPtnNmpw+CIiw4X+9fu2FtD
	PUb0W2cShkZ0A7GmBNBA6Yutkt0U3HZU6OYFgavVLi+T07Za/7py/1fKLQ/s5rxo3Aa4
	qT3y5kmymu1MPn49rJBiJMdqxe6pP+42zjOn3SOjRSxXd11FWy6GF5mJVE2i5QTvFJ9w
	ZYAyL1JfXBpWYJ8xjX3h4IgZ0LroQLZxXRC2eeUnm/TBUEuayap4fLh2Tlv13RPWzDoo
	RC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NbD3GZ+kHIkhc0rOPih+dO+JniQHUUZJxiy7L/5EwK4=;
	b=pyEfkfa7aCgxGiq3r9FkWYuJb6Ez/MnHPGuprOaYXsqDX88CHXOTawfbzqwcoVKyv0
	XkJK1+GCBYmp0erzjwc6lW3ZyhjmuebPj71kmQS9gBnn4l2XGHG6Qgj7oOrI5NLfjU2p
	CCn7yQWbwSap8qz9nCQVYGswnzAvIGi7jT4dN4bZ3VJS7gfLQNslTtgZZCwfUvCNKzjC
	gljyoLaIGpPf0f6XS0wkMMoTwzcI6hl9+RyusSSQ3Ycm5crsXJPWJLk9YgMT6Nl7Ol6v
	5OdgDevkADYCBRL4SIVmeZ3LXODlzUnGK4zmghPJRoUBSmnp9ym2QiH7VKryB3WQa35E
	wT8Q==
X-Gm-Message-State: APjAAAXc5oVrWzqIZuRyC/VTMI72NOD5vfzoX+vCROfFRNnikPa3jzmE
	q4iuBIUIHqr9AesBdQnfrvJp+4Hkxl0zHzpAdTw=
X-Google-Smtp-Source: APXvYqyZkuRrGsDfD+CGePsflvGcbvlOGqOp6PFyg95xuRXwjPCVxtC97zMWnSrzIwjufDbq5HwoeMG98ueuWCTLUtY=
X-Received: by 2002:a02:8a:: with SMTP id 132mr37997457jaa.89.1560751335629;
	Sun, 16 Jun 2019 23:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190601045815.30790-1-thstead@steadtechnology.co.uk>
	<CAMKF1spavEc8viLvhVV+VbXadEmssW8LiTFpFVAEJAOJ0E1NDg@mail.gmail.com>
In-Reply-To: <CAMKF1spavEc8viLvhVV+VbXadEmssW8LiTFpFVAEJAOJ0E1NDg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 16 Jun 2019 23:02:04 -0700
Message-ID: <CANx9H-CKt4UH1VHaa+gxLXz4gBttkpPMrJb_YnwE4aKKiSsyjw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Created recipes for python2 and python3 packages for pysnmp and its dependencies.
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
X-List-Received-Date: Mon, 17 Jun 2019 06:02:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also, the short log (subject) is awkward. Please follow the pattern of
other commits. Perhaps split into three commits for each of the modules?
=E2=80=9Dpython-foo: add recipe for v1.0=E2=80=9D

Also, Signed-off-by is a legal indication that you are the author and have
the rights to contribute. This means a legal name and not your nickname is
expected. Many folks do not realize the implications.

Thank you for contributing. We appreciate it.

On Sun, Jun 16, 2019 at 10:51 PM Khem Raj <raj.khem@gmail.com> wrote:

> this has gone stale and does not apply on top of master anymore. Can
> you please rebase it and send again
>
> On Fri, May 31, 2019 at 9:58 PM thstead <thstead@steadtechnology.co.uk>
> wrote:
> >
> > Created Python2 and Python 3 packages for:
> > - pysnmp
> > - ply
> > - pysmi
> >
> > Signed-off-by: thstead <thstead@steadtechnology.co.uk>
> > ---
> >  meta-python/recipes-devtools/python/python-ply.inc | 17 ++++++++++++++
> >  .../recipes-devtools/python/python-ply_3.10.bb     | 18 ++------------=
-
> >  .../recipes-devtools/python/python-pysmi.inc       | 19 ++++++++++++++=
+
> >  .../recipes-devtools/python/python-pysmi_0.1.2.bb  | 21
> ++---------------
> >  .../recipes-devtools/python/python-pysnmp.inc      | 21
> +++++++++++++++++
> >  .../recipes-devtools/python/python-pysnmp_4.4.9.bb | 27
> +++-------------------
> >  .../recipes-devtools/python/python3-ply_3.10.bb    |  3 +++
> >  .../recipes-devtools/python/python3-pysmi_0.1.2.bb |  3 +++
> >  .../python/python3-pysnmp_4.4.9.bb                 |  5 ++++
> >  9 files changed, 75 insertions(+), 59 deletions(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python-ply.inc
> >  create mode 100644 meta-python/recipes-devtools/python/python-pysmi.in=
c
> >  create mode 100644 meta-python/recipes-devtools/python/python-pysnmp.i=
nc
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-ply_3.10.bb
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-pysmi_0.1.2.bb
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-pysnmp_4.4.9.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python-ply.inc
> b/meta-python/recipes-devtools/python/python-ply.inc
> > new file mode 100644
> > index 000000000..8e61efa79
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-ply.inc
> > @@ -0,0 +1,17 @@
> > +SUMMARY =3D "Python Lex and Yacc"
> > +DESCRIPTION =3D "Python ply: PLY is yet another implementation of lex =
and
> yacc for Python"
> > +HOMEPAGE =3D "https://pypi.python.org/pypi/ply"
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://README.md;beginline=3D3;endline=3D30;md5=3Dfcb04bc2f765e46ab7084d=
6ab6e452bb"
> > +
> > +SRCNAME =3D "ply"
> > +
> > +SRC_URI =3D "
> https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${=
PV}.tar.gz
> "
> > +
> > +SRC_URI[md5sum] =3D "1d63c166ab250bab87d8dcc42dcca70e"
> > +SRC_URI[sha256sum] =3D
> "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
> > +
> > +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > +
> > +inherit setuptools
> > diff --git a/meta-python/recipes-devtools/python/python-ply_3.10.bb
> b/meta-python/recipes-devtools/python/python-ply_3.10.bb
> > index 8e61efa79..6f5c4e6c8 100644
> > --- a/meta-python/recipes-devtools/python/python-ply_3.10.bb
> > +++ b/meta-python/recipes-devtools/python/python-ply_3.10.bb
> > @@ -1,17 +1,3 @@
> > -SUMMARY =3D "Python Lex and Yacc"
> > -DESCRIPTION =3D "Python ply: PLY is yet another implementation of lex =
and
> yacc for Python"
> > -HOMEPAGE =3D "https://pypi.python.org/pypi/ply"
> > -SECTION =3D "devel/python"
> > -LICENSE =3D "BSD"
> > -LIC_FILES_CHKSUM =3D
> "file://README.md;beginline=3D3;endline=3D30;md5=3Dfcb04bc2f765e46ab7084d=
6ab6e452bb"
> > -
> > -SRCNAME =3D "ply"
> > -
> > -SRC_URI =3D "
> https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${=
PV}.tar.gz
> "
> > -
> > -SRC_URI[md5sum] =3D "1d63c166ab250bab87d8dcc42dcca70e"
> > -SRC_URI[sha256sum] =3D
> "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
> > -
> > -S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> >  inherit setuptools
> > +require python-ply.inc
> > +
> > diff --git a/meta-python/recipes-devtools/python/python-pysmi.inc
> b/meta-python/recipes-devtools/python/python-pysmi.inc
> > new file mode 100644
> > index 000000000..12ba0c68a
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-pysmi.inc
> > @@ -0,0 +1,19 @@
> > +SUMMARY =3D "SNMP SMI/MIB Parser"
> > +DESCRIPTION =3D "A pure-Python implementation of SNMP/SMI MIB \
> > +  parsing and conversion library. Can produce PySNMP MIB modules. \
> > +"
> > +HOMEPAGE =3D "https://pypi.python.org/pypi/pysmi"
> > +SECTION =3D "devel/python"
> > +
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.rst;md5=3Dd8b1bbadd635f187dee74d999a8c67b8"
> > +
> > +SRCNAME =3D "pysmi"
> > +
> > +SRC_URI =3D "
> https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${=
PV}.tar.gz
> "
> > +
> > +SRC_URI[md5sum] =3D "f8754e9ed75698cc16b40f125df85b12"
> > +SRC_URI[sha256sum] =3D
> "e0912180fc6faa9c264df78f97e7c451f77f84f5bd840098d2ce7b1bf70082bc"
> > +
> > +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > +
> > diff --git a/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
> b/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
> > index aa234dd70..2fe56ca04 100644
> > --- a/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
> > +++ b/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
> > @@ -1,22 +1,5 @@
> > -SUMMARY =3D "SNMP SMI/MIB Parser"
> > -DESCRIPTION =3D "A pure-Python implementation of SNMP/SMI MIB \
> > -  parsing and conversion library. Can produce PySNMP MIB modules. \
> > -"
> > -HOMEPAGE =3D "https://pypi.python.org/pypi/pysmi"
> > -SECTION =3D "devel/python"
> > -
> > -LICENSE =3D "BSD"
> > -LIC_FILES_CHKSUM =3D
> "file://LICENSE.rst;md5=3Dd8b1bbadd635f187dee74d999a8c67b8"
> > -
> > -SRCNAME =3D "pysmi"
> > -
> > -SRC_URI =3D "
> https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${=
PV}.tar.gz
> "
> > -
> > -SRC_URI[md5sum] =3D "f8754e9ed75698cc16b40f125df85b12"
> > -SRC_URI[sha256sum] =3D
> "e0912180fc6faa9c264df78f97e7c451f77f84f5bd840098d2ce7b1bf70082bc"
> > -
> > -S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> >  inherit setuptools
> > +require python-pysmi.inc
> >
> >  RDEPENDS_${PN} =3D "python-ply"
> > +
> > diff --git a/meta-python/recipes-devtools/python/python-pysnmp.inc
> b/meta-python/recipes-devtools/python/python-pysnmp.inc
> > new file mode 100644
> > index 000000000..9b67f6bc7
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-pysnmp.inc
> > @@ -0,0 +1,21 @@
> > +SUMMARY =3D "A pure-Python SNMPv1/v2c/v3 library"
> > +DESCRIPTION =3D "SNMP v1/v2c/v3 engine and apps written in pure-Python=
. \
> > +  Supports Manager/Agent/Proxy roles, scriptable MIBs, asynchronous \
> > +  operation (asyncio, twisted, asyncore) and multiple transports.\
> > +"
> > +HOMEPAGE =3D "https://pypi.python.org/pypi/pysnmp"
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.rst;md5=3Db15d29f500f748d1c2a15709769090a8"
> > +
> > +SRCNAME =3D "pysnmp"
> > +
> > +SRC_URI =3D "
> https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${=
PV}.tar.gz
> "
> > +
> > +SRC_URI[md5sum] =3D "6d1b514997326bed18f1ae1510f6b1c9"
> > +SRC_URI[sha256sum] =3D
> "d5d1e59780126e963dd92e25993b783295734e71bef181f602e51f7393260441"
> > +
> > +
> > +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > +
> > +RDEPENDS_${PN} +=3D "python-pycrypto"
> > diff --git a/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
> b/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
> > index 9ff4df2c9..c36d69b6a 100644
> > --- a/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
> > +++ b/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
> > @@ -1,26 +1,5 @@
> > -SUMMARY =3D "A pure-Python SNMPv1/v2c/v3 library"
> > -DESCRIPTION =3D "SNMP v1/v2c/v3 engine and apps written in pure-Python=
. \
> > -  Supports Manager/Agent/Proxy roles, scriptable MIBs, asynchronous \
> > -  operation (asyncio, twisted, asyncore) and multiple transports.\
> > -"
> > -HOMEPAGE =3D "https://pypi.python.org/pypi/pysnmp"
> > -SECTION =3D "devel/python"
> > -LICENSE =3D "BSD"
> > -LIC_FILES_CHKSUM =3D
> "file://LICENSE.rst;md5=3Db15d29f500f748d1c2a15709769090a8"
> > -
> > -SRCNAME =3D "pysnmp"
> > -
> > -SRC_URI =3D "
> https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${=
PV}.tar.gz
> "
> > -
> > -SRC_URI[md5sum] =3D "6d1b514997326bed18f1ae1510f6b1c9"
> > -SRC_URI[sha256sum] =3D
> "d5d1e59780126e963dd92e25993b783295734e71bef181f602e51f7393260441"
> > -
> > -
> > -S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> >  inherit setuptools
> > +require python-pysnmp.inc
> > +
> > +RDEPENDS_${PN} +=3D "python-pyasn1 python-pysmi"
> >
> > -RDEPENDS_${PN} +=3D "python-pycrypto \
> > -                   python-pyasn1 \
> > -                   python-pysmi \
> > -"
> > diff --git a/meta-python/recipes-devtools/python/python3-ply_3.10.bb
> b/meta-python/recipes-devtools/python/python3-ply_3.10.bb
> > new file mode 100644
> > index 000000000..401dd0df5
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-ply_3.10.bb
> > @@ -0,0 +1,3 @@
> > +inherit setuptools3
> > +require python-ply.inc
> > +
> > diff --git a/meta-python/recipes-devtools/python/python3-pysmi_0.1.2.bb
> b/meta-python/recipes-devtools/python/python3-pysmi_0.1.2.bb
> > new file mode 100644
> > index 000000000..829f16682
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pysmi_0.1.2.bb
> > @@ -0,0 +1,3 @@
> > +inherit setuptools3
> > +require python-pysmi.inc
> > +RDEPENDS_${PN} =3D "python3-ply"
> > diff --git a/meta-python/recipes-devtools/python/python3-pysnmp_4.4.9.b=
b
> b/meta-python/recipes-devtools/python/python3-pysnmp_4.4.9.bb
> > new file mode 100644
> > index 000000000..046d3e5d0
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pysnmp_4.4.9.bb
> > @@ -0,0 +1,5 @@
> > +inherit setuptools3
> > +require python-pysnmp.inc
> > +
> > +RDEPENDS_${PN} +=3D "python3-pyasn1 python3-pysmi"
> > +
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


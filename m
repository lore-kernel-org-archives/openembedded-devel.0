Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6803178792
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 19:14:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBMJE5Da013924
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 22 Dec 2017 11:14:05 -0800
Received: from yow-masselst-lx1.localnet (128.224.25.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 22 Dec 2017 11:14:04 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Derek Straka <derek@asterius.io>
Date: Fri, 22 Dec 2017 14:14:03 -0500
Message-ID: <2031282.qIZEEbByNN@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CADNbA1pb59ECauMpz0Yu6Fbq5+J9BK8K2VSTLucJw7dd+yoGGw@mail.gmail.com>
References: <1513952166-4501-1-git-send-email-derek@asterius.io>
	<CAPuovEK=atyENNhdMSbvi42d7mUdLQcWNnSZ6U5KpcowevMTYw@mail.gmail.com>
	<CADNbA1pb59ECauMpz0Yu6Fbq5+J9BK8K2VSTLucJw7dd+yoGGw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-automat: fix build dependencies to avoid download during do_compile
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
X-List-Received-Date: Fri, 22 Dec 2017 19:14:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, December 22, 2017 2:11:20 PM EST Derek Straka wrote:
> Sure.  I'm waiting for confirmation it fixes the issue from the ML before
> requesting any backports.

Sounds good. Thanks.

Mark

> 
> On Fri, Dec 22, 2017 at 2:00 PM, Mark Asselstine <
> 
> mark.asselstine@windriver.com> wrote:
> > On Fri, Dec 22, 2017 at 9:16 AM, Derek Straka <derek@asterius.io> wrote:
> > > Add the correct version of python{3}-setuptools-scm-native
> > > Remove the dependency on m2r
> > 
> > Derek,
> > 
> > Can you please ensure this and other fixes for python-automat are
> > applied to the rocko branch. Recall I had requested this recipe be
> > cherry-picked to rocko to ensure python-twisted was usable on rocko.
> > 
> > Thanks,
> > Mark
> > 
> > > Signed-off-by: Derek Straka <derek@asterius.io>
> > > ---
> > > 
> > >  .../recipes-devtools/python/python-automat.inc     |  8 ++++
> > >  ...001-setup.py-remove-the-dependency-on-m2r.patch | 52
> > 
> > ++++++++++++++++++++++
> > 
> > >  2 files changed, 60 insertions(+)
> > >  create mode 100644 meta-python/recipes-devtools/
> > 
> > python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
> > 
> > > diff --git a/meta-python/recipes-devtools/python/python-automat.inc
> > 
> > b/meta-python/recipes-devtools/python/python-automat.inc
> > 
> > > index 1ac5d3b..43b9ce9 100644
> > > --- a/meta-python/recipes-devtools/python/python-automat.inc
> > > +++ b/meta-python/recipes-devtools/python/python-automat.inc
> > > @@ -3,6 +3,8 @@ HOMEPAGE = "https://github.com/glyph/Automat"
> > > 
> > >  LICENSE = "MIT"
> > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c874
> > 
> > 77"
> > 
> > > +FILESEXTRAPATHS_prepend := "${THISDIR}/python-automat:"
> > > +
> > > 
> > >  SRC_URI[md5sum] = "ad7bba58d262d8956d732330cb5ef53d"
> > >  SRC_URI[sha256sum] = "3c1fd04ecf08ac87b4dd3feae40954
> > 
> > 2e9bf7827257097b2b6ed5692f69d6f6a8"
> > 
> > > @@ -10,6 +12,12 @@ PYPI_PACKAGE = "Automat"
> > > 
> > >  inherit pypi
> > > 
> > > +SRC_URI_append = " \
> > > +    file://0001-setup.py-remove-the-dependency-on-m2r.patch \
> > > +"
> > > +
> > > +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> > > +
> > > 
> > >  RDEPENDS_${PN} += "\
> > >  
> > >     ${PYTHON_PN}-attrs \
> > >     ${PYTHON_PN}-six \
> > > 
> > > diff --git a/meta-python/recipes-devtools/python/python-
> > 
> > automat/0001-setup.py-remove-the-dependency-on-m2r.patch
> > b/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-
> > the-dependency-on-m2r.patch
> > 
> > > new file mode 100644
> > > index 0000000..0ebb220
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python-
> > 
> > automat/0001-setup.py-remove-the-dependency-on-m2r.patch
> > 
> > > @@ -0,0 +1,52 @@
> > > +From d5ebe479fc8fe11c5c75e7f35484849320349222 Mon Sep 17 00:00:00 2001
> > > +From: Derek Straka <derek@asterius.io>
> > > +Date: Fri, 22 Dec 2017 09:07:00 -0500
> > > +Subject: [PATCH] setup.py: remove the dependency on m2r
> > > +
> > > +The dependency on m2r is removed here as it only provides the
> > > +long_description value that is optional.  This item is just the
> > > +text that would be present on PyPi, so it doesn't provide much
> > > +value in this case
> > > +
> > > +Upstream-Status: Inappropriate (OE specific)
> > > +
> > > +Signed-off-by: Derek Straka <derek@asterius.io>
> > > +---
> > > + setup.py | 10 ----------
> > > + 1 file changed, 10 deletions(-)
> > > +
> > > +diff --git a/setup.py b/setup.py
> > > +index d360c64..7b4180a 100644
> > > +--- a/setup.py
> > > ++++ b/setup.py
> > > +@@ -4,14 +4,6 @@ Setup file for automat
> > > +
> > > + from setuptools import setup, find_packages
> > > +
> > > +-try:
> > > +-    from m2r import parse_from_file
> > > +-    long_description = parse_from_file('README.md')
> > > +-except(IOError, ImportError):
> > > +-    print("\n\n!!! m2r not found, long_description is bad, don't
> > 
> > upload this to PyPI !!!\n\n")
> > 
> > > +-    import io
> > > +-    long_description = io.open('README.md', encoding="utf-8").read()
> > > +-
> > > + setup(
> > > +     name='Automat',
> > > +     use_scm_version=True,
> > > +@@ -19,12 +11,10 @@ setup(
> > > +     description="""
> > > +     Self-service finite-state machines for the programmer on the go.
> > > +     """.strip(),
> > > +-    long_description=long_description,
> > > +     packages=find_packages(exclude=[]),
> > > +     package_dir={'automat': 'automat'},
> > > +     setup_requires=[
> > > +         'setuptools-scm',
> > > +-        'm2r',
> > > +     ],
> > > +     install_requires=[
> > > +         "attrs>=16.1.0",
> > > +--
> > > +2.7.4
> > > +
> > > --
> > > 2.7.4
> > > 
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel




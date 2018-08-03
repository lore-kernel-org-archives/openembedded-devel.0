Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	by mail.openembedded.org (Postfix) with ESMTP id 67498745D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 03:19:52 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1EA46C0002;
	Fri,  3 Aug 2018 03:19:51 +0000 (UTC)
Message-ID: <1533266389.1986.6.camel@redrectangle.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 02 Aug 2018 20:19:49 -0700
In-Reply-To: <CAMKF1srNOQX4hDPYSr3=nMPdk8dM3o8Z3GToudKbCkd4O8tOgw@mail.gmail.com>
References: <20180731030937.3685-1-robert.joslyn@redrectangle.org>
	<20180731030937.3685-5-robert.joslyn@redrectangle.org>
	<CAMKF1srNOQX4hDPYSr3=nMPdk8dM3o8Z3GToudKbCkd4O8tOgw@mail.gmail.com>
X-Mailer: Evolution 3.24.6 
Mime-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 4/5] python-parse-type: Add Python 3 recipe
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
X-List-Received-Date: Fri, 03 Aug 2018 03:19:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-08-02 at 11:11 -0700, Khem Raj wrote:
> On Mon, Jul 30, 2018 at 8:11 PM Robert Joslyn
> <robert.joslyn@redrectangle.org> wrote:
> > 
> > Clarify license from BSD to BSD-3-Clause.
> > ---
> >  meta-python/recipes-devtools/python/python-parse-type.inc   | 12
> > ++++++++++++
> >  .../recipes-devtools/python/python-parse-type_0.4.2.bb      | 13
> > ++-----------
> >  .../recipes-devtools/python/python3-parse-type_0.4.2.bb     |  2
> > ++
> >  3 files changed, 16 insertions(+), 11 deletions(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python-
> > parse-type.inc
> >  create mode 100644 meta-python/recipes-devtools/python/python3-
> > parse-type_0.4.2.bb
> > 
> > diff --git a/meta-python/recipes-devtools/python/python-parse-
> > type.inc b/meta-python/recipes-devtools/python/python-parse-
> > type.inc
> > new file mode 100644
> > index 000000000..4549ec98b
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-parse-type.inc
> > @@ -0,0 +1,12 @@
> > +SUMMARY = "Simplifies building parse types based on the parse
> > module"
> > +HOMEPAGE = "https://github.com/jenisys/parse_type"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
> > +
> > +SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
> > +SRC_URI[sha256sum] =
> > "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
> > +
> > +PYPI_PACKAGE = "parse_type"
> > +inherit pypi
> > +
> > +RDEPENDS_${PN} += "${PYTHON_PN}-parse"
> 
> there is no recipe for python3-parse but this does mean that
> python3-parse-type will rdep on it and fail the dep check like below
> 
> ERROR: Nothing RPROVIDES 'python3-parse' (but
> /mnt/a/oe/sources/meta-openembedded/meta-python/recipes-
> devtools/python/python3-parse-type_0.4.2.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-parse' is unbuildable, removing...

I added python3-parse as patch 3 of the series, but that patch got
dropped since another patch to the recipe was pulled in to master
first. I'll resend the series rebased on master, which will fix both
issues.

Thanks,
Robert

> > diff --git a/meta-python/recipes-devtools/python/python-parse-
> > type_0.4.2.bb b/meta-python/recipes-devtools/python/python-parse-
> > type_0.4.2.bb
> > index b516c5912..8e10e801c 100644
> > --- a/meta-python/recipes-devtools/python/python-parse-
> > type_0.4.2.bb
> > +++ b/meta-python/recipes-devtools/python/python-parse-
> > type_0.4.2.bb
> > @@ -1,11 +1,2 @@
> > -SUMMARY = "Simplifies building parse types based on the parse
> > module"
> > -LICENSE = "BSD"
> > -LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
> > -PYPI_PACKAGE = "parse_type"
> > -
> > -SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
> > -SRC_URI[sha256sum] =
> > "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
> > -
> > -RDEPENDS_${PN} += "python-parse"
> > -
> > -inherit pypi setuptools
> > +inherit setuptools
> > +require python-parse-type.inc
> > diff --git a/meta-python/recipes-devtools/python/python3-parse-
> > type_0.4.2.bb b/meta-python/recipes-devtools/python/python3-parse-
> > type_0.4.2.bb
> > new file mode 100644
> > index 000000000..91d9ce2d4
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-parse-
> > type_0.4.2.bb
> > @@ -0,0 +1,2 @@
> > +inherit setuptools3
> > +require python-parse-type.inc
> > --
> > 2.16.4
> > 
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel



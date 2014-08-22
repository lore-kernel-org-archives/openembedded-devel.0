Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7A080707D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 04:36:15 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id c11so8962511lbj.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=312oUNI1NYtlGjklcGXqCq4A2z2bxbIngylCJj49T1s=;
	b=UPlwiLgCHEXXsfhYkcU3L9ejA3cMH2WLG8arONsrtJsBnI6woEjqoHRMx3tz0lMxqB
	NvTTMiIcx+U9E6O7djXS6z2wqb8H9OuKTHUqXE+d+er2r6B1C0bkU/CTLWS7EfSxqa11
	gmniMmfRcWfTiwOYPbv5mBRZ92STQnPdY3pPINJOlzp9lqTjwjbXZcGC3WnpS17yvzW6
	mQyDZYCuVPknq3MsOe/eFBBPRRnbHj7pnmUDRAVcgxWZeOAEk9fTyT1d5l9xlLAJ7JQy
	ioLbk3GlbWqXaD+l/Wqe4zoTgRe8szlhuv+vOXm2p/n+Mo14fUtIIbAURECPlRJNevAH
	pZpg==
MIME-Version: 1.0
X-Received: by 10.112.128.233 with SMTP id nr9mr2267447lbb.43.1408682175814;
	Thu, 21 Aug 2014 21:36:15 -0700 (PDT)
Received: by 10.25.209.81 with HTTP; Thu, 21 Aug 2014 21:36:15 -0700 (PDT)
In-Reply-To: <2646587.gJzHJE2pH7@peggleto-mobl5.ger.corp.intel.com>
References: <1408603607-32536-1-git-send-email-sujith.h@gmail.com>
	<2646587.gJzHJE2pH7@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 21 Aug 2014 21:36:15 -0700
Message-ID: <CANx9H-DwW-abesYFg1TLz-zGszB3pRA2gUbUnZjpQvMieWf-cA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-python][PATCH] python-pyparted: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Aug 2014 04:36:20 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 21, 2014 at 6:47 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Hi Sujith,
>
> I think this recipe is almost there, just some minor tweaks:
>
> On Thursday 21 August 2014 12:16:47 Sujith H wrote:
> > From: Sujith H <Sujith_Haridasan@mentor.com>
> >
> > This recipe will provide a set of Python modules that
> > provide Python programmers an interface to libparted,
> > the GNU parted library for disk partitioning and filesystem
> > manipulation.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
>
Tested-by: Tim Orling <TicoTimo@gmail.com>
(qemuarm, core-image-sato)

NOTES:
(1) In order to get help for this module,
IMAGE_INSTALL_append = " python-pyparted python-pydoc python-pkgutil
python-io"
$ python
>>>import parted
>>>help(parted)

(2) I used the examples (list_devices.py, list_partitions.py) from the
following to test:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=692503

 > ---
> >  .../python-pyparted/python-pyparted_3.9.bb          | 21
> > +++++++++++++++++++++ 1 file changed, 21 insertions(+)
> >  create mode 100644
> > meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
> >
> > diff --git
> > a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
> > b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
> new
> > file mode 100644
> > index 0000000..db1b936
> > --- /dev/null
> > +++ b/meta-python/recipes-extended/python-pyparted/
> python-pyparted_3.9.bb
> > @@ -0,0 +1,21 @@
> > +DESCRIPTION = "pyparted is a set of Python modules that provide Python
> > programmers \ +an interface to libparted, the GNU parted library for disk
> > partitioning and \ +filesystem manipulation."
> > +SUMMARY = "Python bindings for libparted"
> > +HOMEPAGE = "https://fedorahosted.org/pyparted/"
> > +LICENSE = "GPL-2.0+"
> > +LIC_FILES_CHKSUM = "\
> > +    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> > +
> >
> file://src/_pedmodule.c;startline=10;endline=22;md5=70c62bd73782a03f56a0571
> > a9f08ea46 \ +"
> > +DEPENDS += "parted"
> > +RDEPENDS_${PN} += "python-stringold python-codecs python-math"
>
> Could you please move the RDEPENDS line down to just before the
> BBCLASSEXTEND
> line? (i.e. where any other definitions that concern packaging would
> appear).
>
> > +
> > +S="${WORKDIR}/pyparted-${PV}"
>
> Please move this after the SRC_URI / checksums and add spaces around the =
> .
>
> if you could also please ensure that your next version is marked [PATCH v3]
> (if it will be the third version of this patch) rather than just [PATCH] so
> that it's clear that it supersedes an earlier version.
>

I agree completely with Paul and meant to mention that on the previous
patch [PATCH v2].

Regards,

Tim


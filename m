Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D07ED7C89C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:30:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46KCPT13b3z4b;
	Thu, 29 Aug 2019 21:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567107022;
	bh=KGkl8J5IF57CMEAIrZQ/GZOH5lQzn20tiW8wFReec+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sjdd/UKM3WaoDwxcWASa2znnmwKSTskBGYrd4C0GzduZALZ2zwmZMkiiTYqglCDSN
	zDeqjdxcj1Ua336j0i+rPWwC4WbTwBXBUwYkHaDw4ETX+mhOi3gNBZJiabmddOBbIb
	evxQCTqS+utPfBdqc6bwDsYEUiueUidBOytHWA8s9zbedQxKuo9HsJZMHb5Lfocu1f
	Sf9ML6BEsHtM3/8SEmYV+nyZiJVdv7hKRlpBxk7UPFFUiPuvLnndO3Vd/1MVzQYQOV
	WawztLPuUr9uqZHxzI0MPTYeCLwmZrs9JqGOBeSyEvdkDl+PDQPt2n/Sq+NS6D7for
	GAHTGi0stNHIkm5PZxIr1inkXjGyb0kHhUqVBQ3T8KYlmd5y3UUtNUVaMWb6dBZvM9
	S9RgTumIarGjEwCWz7sJts6ehbXN1Jv6k+kG3+VptkOH+25d38OgVnPBR1TlkNLkfI
	yqtvydKooTo6mCt6tuvOcuPaU+DmcMP53ztvFzkWUyWpMWW6jdTZ9+R4kEZ9ziui9h
	1QHvVblmcWaUBYVrLjnjvNbZ8j5Ns96nz/s0GO/TfbJXncaly8rXCXvzpSSs7GIxEm
	XzB5CwTeAMa1LTmKX0+bNqN3A+ONVCh9pwNPE3cE2jHKz8cqZ1VtusBl7q7WMdjXL5
	W+rBe/dsncNrdF/ZJMrppMZk=
Date: Thu, 29 Aug 2019 22:30:18 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190829193018.GB24691@localhost>
References: <20190829143506.19291-1-christophe.priouzeau@st.com>
	<20190829155122.GA17820@localhost>
	<CAMKF1so-8_SBFQHtwx_8DVaDsGgMSBTF35muc-adweze8hOr7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so-8_SBFQHtwx_8DVaDsGgMSBTF35muc-adweze8hOr7g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] python-script: update license md5sum
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
X-List-Received-Date: Thu, 29 Aug 2019 19:30:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 29, 2019 at 11:44:16AM -0700, Khem Raj wrote:
> On Thu, Aug 29, 2019 at 8:51 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, Aug 29, 2019 at 02:35:07PM +0000, Christophe PRIOUZEAU wrote:
> > > Update md5sum of license file.
> > >...
> > > --- a/meta-python/recipes-devtools/python/python-scrypt.inc
> > > +++ b/meta-python/recipes-devtools/python/python-scrypt.inc
> > > @@ -1,6 +1,6 @@
> > >  DESCRIPTION = "Bindings for the scrypt key derivation function library"
> > >  LICENSE = "BSD-2-Clause"
> > > -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378"
> > > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f"
> > >...
> >
> > The actual problem is that this does not do what LIC_FILES_CHKSUM is
> > supposed to do.
> >
> > LIC_FILES_CHKSUM should verify that the license information in the
> > software hasn't changed when upgrading it.
> >
> 
> thats right and in most cases thats what it does too.
> 
> > These recipes check the copy of the license text in OE instead,
> > which wouldn't change if the license of python-scrypt would change.
> >
> 
> some packages just use license and do not include a license file
> in which case the recipe stubs it in.
> Not ideal but it is a band aid for such recipes.

You need some license information somewhere, legal default is that it is 
illegal to use or to distribute.


In reality this is just bad practice copied from one recipe to another.

For scrypt, see scrypt-0.8.6/LICENSE

python-intervals is even more funny:
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

$ grep ^License: python-intervals-1.5.4/PKG-INFO 
License: LGPL3


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



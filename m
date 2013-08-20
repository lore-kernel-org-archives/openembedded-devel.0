Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id E9B4B61883
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 11:53:29 +0000 (UTC)
Received: from [174.115.226.96] (port=44008 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VBkV7-0001yV-Dd for openembedded-devel@lists.openembedded.org;
	Tue, 20 Aug 2013 07:53:29 -0400
Date: Tue, 20 Aug 2013 07:53:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1376206543.27470.24.camel@ted>
Message-ID: <alpine.DEB.2.02.1308200751240.23277@oneiric>
References: <alpine.DEB.2.02.1308091242270.18531@oneiric>
	<1376206543.27470.24.camel@ted>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: what sources are *not* fetched by a "-c fetchall"?
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
X-List-Received-Date: Tue, 20 Aug 2013 11:53:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 11 Aug 2013, Richard Purdie wrote:

> On Fri, 2013-08-09 at 12:46 -0400, Robert P. J. Day wrote:
> >   currently testing a build for my beaglebone black using the meta-ti
> > layer and, as i am wont to do, i did a:
> >
> >   $ bitbake -c fetchall core-image-minimal
> >
> > to (allegedly) fetch everything i would need for such a build.
> >
> >   at that point, i did:
> >
> >   $ bitbake core-image-minimal
> >
> > and while this is running, i can see more source tarballs being pulled
> > into the downloads directory -- examples:
> >
> >   * file-5.13.tar.gz
> >   * icu4c-50_1_2-src.tgz
> >   * mklibs_0.1.34.tar.gz
> >   * pcre-8.32.tar.bz2
> >
> > and perhaps more since the build is not yet done.
> >
> >   what is it about these particular packages that doesn't fall under
> > the regular fetching from "-c fetchall"?
>
> Which version of bitbake and the metadata was this with? There were some
> issues fixed in that area fairly recently if I remember rightly.

  the newest version of bitbake seems to resolve this, but i now
remember when i first tripped across this, and this was with the
setting of:

  EXTRA_IMAGEDEPENDS += "u-boot"

where the "fetchall" didn't seem to process the variable
EXTRA_IMAGEDEPENDS, which resulted in the appropriate source for
u-boot not being fetched until build time. do you know if that was
addressed? thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


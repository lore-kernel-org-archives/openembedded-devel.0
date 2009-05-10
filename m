Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M3F5Y-0004R5-RK
	for openembedded-devel@openembedded.org; Sun, 10 May 2009 21:53:34 +0200
Received: (qmail 7528 invoked from network); 10 May 2009 19:47:05 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 10 May 2009 12:47:05 -0700
Date: Sun, 10 May 2009 12:47:04 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090510194704.GZ7973@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<20090429161224.GB18788@smtp.west.cox.net> <49FCA524.10102@dls.net>
	<c384c5ea0905030529n585de20awfcc6bb835a282483@mail.gmail.com>
	<20090503165318.GA7973@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090503165318.GA7973@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 May 2009 19:53:38 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, May 03, 2009 at 09:53:18AM -0700, Tom Rini wrote:
> On Sun, May 03, 2009 at 02:29:53PM +0200, Leon Woestenberg wrote:
> > Hello,
> > 
> > On Sat, May 2, 2009 at 9:55 PM, Mike (mwester) <mwester@dls.net> wrote:
> > > Acked-by: Mike Westerhof <mwester@dls.net>
> > >
> > I think we can add this functionality now.
> > 
> > By the recent merge of "micro.conf" and "micro-uclibc.conf", a new
> > TODO is to merge the LIBC feature into micro distro as well.
> > See "[oe] Pull request from DoréDevelopment - New: Micro distro/image"
> 
> I'll push this out Monday AM us.  IMHO, for micro and micro-uclibc (and
> similar for minimal/minimal-uclibc) is to merge them back into one and
> make LIBC an easy override.

So, here's a problem we've run into now.  With distros that use
debian.bbclass, having an OVERRIDE of 'glibc' added causes the glibc
recipe to not create a 'glibc' package, nor a 'libc6' package.  The
libc6-dev package is created.  For eglibc, libc6 and libc6-dev are
created.  For the uclibc recipe uclibc and uclibc-dev packages are
still created.  DISTRO=angstrom-2008.1 LIBC={eglibc,glibc,uclibc} will
show this.

-- 
Tom Rini



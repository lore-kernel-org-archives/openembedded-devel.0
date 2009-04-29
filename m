Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LzI2B-0001zI-D4
	for openembedded-devel@openembedded.org; Thu, 30 Apr 2009 00:13:43 +0200
Received: (qmail 10738 invoked from network); 29 Apr 2009 20:21:43 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 29 Apr 2009 13:21:43 -0700
Date: Wed, 29 Apr 2009 13:21:43 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090429202142.GH18788@smtp.west.cox.net>
References: <1240945982.12505.23.camel@utx.utx.cz>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF7A7@hiob.intern.dresearch.de>
	<49F8463B.7040102@balister.org>
	<20090429141544.GZ18788@smtp.west.cox.net>
	<1241022375.4064.21.camel@hammer.suse.cz>
	<20090429164500.GE18788@smtp.west.cox.net>
	<1241026345.4064.45.camel@hammer.suse.cz>
	<20090429201712.GG18788@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090429201712.GG18788@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] gcc_4.2.4.bb: QA Issue: No GNU_HASH in theelf	binary
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
X-List-Received-Date: Wed, 29 Apr 2009 22:13:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2009 at 01:17:12PM -0700, Tom Rini wrote:
> On Wed, Apr 29, 2009 at 07:32:25PM +0200, Stanislav Brabec wrote:
> > Tom Rini wrote:
> > > > +	sed -i 's/^LDFLAGS = $/LDFLAGS = @LDFLAGS@/' ${S}/Makefile.in ${S}/Makefile.tpl
> > 
> > > I'll pull this in locally, and build everything today.  Just need to
> > > have the buildbot finish the failure on everything first.
> > 
> > Well, without "if test -f" it will fail for gcc-4.4.0. This one would be
> > safer for the final commit. Patching each gcc version separately would
> > be even more safe, but also more work.
> 
> OK, some unpacking and grepping and such done.  4.3.x, 4.4.0 and oddly,
> 4.0.x are good.  The rest are not.  But, I don't see how the if works,

I take that back.  The 4.0.x ldflags.patch is good.  What I get for
doing a -c patch unstead of -c unpack :)

-- 
Tom Rini



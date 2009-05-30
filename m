Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MAVgc-0006QH-BK
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 23:01:50 +0200
Received: (qmail 27979 invoked from network); 30 May 2009 20:53:16 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 13:53:16 -0700
Date: Sat, 30 May 2009 13:53:15 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090530205315.GO23842@smtp.west.cox.net>
References: <1243246822.4869.19.camel@lenovo.internal.reciva.com>
	<1243250313-10392-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243253873.4869.31.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1243253873.4869.31.camel@lenovo.internal.reciva.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] gnome.bbclass: remove unneeded scrollkeeper stuff	from gnome packages.
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
X-List-Received-Date: Sat, 30 May 2009 21:01:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 25, 2009 at 01:17:53PM +0100, Phil Blundell wrote:
> On Mon, 2009-05-25 at 14:18 +0300, Ihar Hrachyshka wrote:
> > Scrollkeeper generates its XML database for every package when
> > installing it. The problem is that while building it sees only specific
> > package scrollkeeper stuff so we get wrong scrollkeeper xml file
> > generated for every gnome.bbclass package. Including the file into every
> > gnome package results in package contents conflicts.
> >  
> > -PACKAGES =+ "${PN}-scrollkeeper-leftovers"
> > -FILES_${PN}-scrollkeeper-leftovers = "${localstatedir}/lib/scrollkeeper"
> > -
> >  gnome_stage_includes() {
> >  	autotools_stage_includes
> >  }
> > +
> > +do_install_append() {
> > +	rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
> > +}
> > +
> 
> That change looks pretty reasonable to me, though maybe you want to
> delete ${localstatedir}/lib/scrollkeeper itself (and its parents, if
> they're empty) as well as the contents of the directory.
> 
> In the longer term I guess we should figure out a general-purpose
> solution to all this scrollkeeper stuff.  I see that some packages are
> configuring themselves --disable-scrollkeeper, others seem to be
> patching the scrollkeeper bits out of their configure scripts and yet
> others (notably empathy) have, effectively, a local copy of the bits
> you've just removed from gnome.bbclass.

Do you want more changes still?  I don't see a SOB line, so...  Thanks.

-- 
Tom Rini



Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MAYKd-0003jq-9M
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 01:51:19 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MAYCJ-0002YI-4F
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 00:42:43 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1243724815.4869.93.camel@lenovo.internal.reciva.com>
References: <1243246822.4869.19.camel@lenovo.internal.reciva.com>
	<1243250313-10392-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243253873.4869.31.camel@lenovo.internal.reciva.com>
	<20090530205315.GO23842@smtp.west.cox.net>
	<1243724815.4869.93.camel@lenovo.internal.reciva.com>
Date: Sun, 31 May 2009 00:42:41 +0100
Message-Id: <1243726961.4869.101.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] gnome.bbclass: remove unneeded scrollkeeper	stuff	from gnome packages.
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
X-List-Received-Date: Sat, 30 May 2009 23:51:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-05-31 at 00:06 +0100, Phil Blundell wrote:
> On Sat, 2009-05-30 at 13:53 -0700, Tom Rini wrote:
> > On Mon, May 25, 2009 at 01:17:53PM +0100, Phil Blundell wrote:
> > > On Mon, 2009-05-25 at 14:18 +0300, Ihar Hrachyshka wrote:
> > > > Scrollkeeper generates its XML database for every package when
> > > > installing it. The problem is that while building it sees only specific
> > > > package scrollkeeper stuff so we get wrong scrollkeeper xml file
> > > > generated for every gnome.bbclass package. Including the file into every
> > > > gnome package results in package contents conflicts.
> > > >  
> > > > -PACKAGES =+ "${PN}-scrollkeeper-leftovers"
> > > > -FILES_${PN}-scrollkeeper-leftovers = "${localstatedir}/lib/scrollkeeper"
> > > > -
> > > >  gnome_stage_includes() {
> > > >  	autotools_stage_includes
> > > >  }
> > > > +
> > > > +do_install_append() {
> > > > +	rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
> > > > +}
> > > > +
> > > 
> > > That change looks pretty reasonable to me, though maybe you want to
> > > delete ${localstatedir}/lib/scrollkeeper itself (and its parents, if
> > > they're empty) as well as the contents of the directory.
> > > 
> > > In the longer term I guess we should figure out a general-purpose
> > > solution to all this scrollkeeper stuff.  I see that some packages are
> > > configuring themselves --disable-scrollkeeper, others seem to be
> > > patching the scrollkeeper bits out of their configure scripts and yet
> > > others (notably empathy) have, effectively, a local copy of the bits
> > > you've just removed from gnome.bbclass.
> > 
> > Do you want more changes still?  I don't see a SOB line, so...  Thanks.
> 
> I think it's fine to go in as it is.  We can always enhance it later.

Per Tom's request :-)

Acked-by: Phil Blundell <philb@gnu.org>

p.





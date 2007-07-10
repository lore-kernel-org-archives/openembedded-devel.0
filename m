Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1I8D53-0004Lk-31
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2007 12:36:30 +0200
Received: from xora.org.uk ([::ffff:87.246.78.27])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Tue, 10 Jul 2007 11:30:44 +0100
	id 0003090C.46935FD4.000066B7
Date: Tue, 10 Jul 2007 11:29:34 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: Paul Sokolovsky <pmiscml@gmail.com>
Message-ID: <20070710102933.GA4280@p3n3tr4t0r.internal>
References: <E1I8BNL-0002lu-BC@linuxtogo.org>
	<986250811.20070710125440@gmail.com>
Mime-Version: 1.0
In-Reply-To: <986250811.20070710125440@gmail.com>
User-Agent: Mutt/1.5.15 (2007-04-06)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev packages/glib-2.0/glib.inc : remove	bogus ${PN}-dev from packages.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2007 10:36:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 10, 2007 at 12:54:40PM +0300, Paul Sokolovsky wrote:
> > --- packages/glib-2.0/glib.inc 
> > 09c2d1615f7c249f8ab1c68778bafbc98293ff6b
> > +++ packages/glib-2.0/glib.inc 
> > 3b5260371e84b9c12db9a8cdc8c5809bab8d2ec5
> > @@ -8,7 +8,7 @@ DEPENDS += "virtual/libiconv virtual/lib
> >  PRIORITY = "optional"
> >  DEPENDS += "glib-2.0-native gtk-doc"
> >  DEPENDS += "virtual/libiconv virtual/libintl"
> > -PACKAGES =+ "${PN}-dev glib-2.0-utils "
> > +PACKAGES =+ " glib-2.0-utils "
> 
>   This is not bogus. For this package, -dev must be packaged before
> the main package, or the latter will get *.h and *.m4 files. Putting
> something in packages twice works after all, and we should either
> accept its usage fro such cases, or find other solution to do proper
> flexible packaging (and that would be a bit hard on syntax. Maybe add
> UNFILES?)
> 
It works, you just get a 5 line error from bitbake.

ERROR: -------------------
ERROR: glib-2.0-dev is listed in PACKAGES mutliple times, this leads to packaging errors.
ERROR: Please fix the metadata/report this as bug to OE bugtracker.
ERROR: -------------------

This means the change is wrong (tm) or bitbake is wrong (tm) but the initial
submitter should have fixed one or other or at least left a not in the commit
telling people what was going on. None of this was done.

As it was I accepted the instruction given by bitbake and fixed the metadata.

Graeme




Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OqswX-0002ZD-3q
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 21:25:58 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L8300AM11XYZBE1@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	01 Sep 2010 14:25:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4CDC614AF64; Wed,
	01 Sep 2010 15:25:10 -0400 (EDT)
Date: Wed, 01 Sep 2010 15:25:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100901192510.GA24544@denix.org>
References: <10034543.559431283349469680.JavaMail.defaultUser@defaultHost>
	<AANLkTi=U33a2xMK4SWWmF8c6hPi18vnedSaoTARuMwPn@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTi=U33a2xMK4SWWmF8c6hPi18vnedSaoTARuMwPn@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opkg vs dpkg/rpm
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
X-List-Received-Date: Wed, 01 Sep 2010 19:25:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Sep 01, 2010 at 07:43:38AM -0700, Chris Larson wrote:
> In addition to package writing, there's the IMAGE_PKGTYPE varaible which
> controls which of the rootfs_<pkgtype> bbclasses is used to construct the
> root filesystem.  You can inherit multiple packaging formats, resulting in
> multiple formats being emitted, but one has to be selected specifically for
> the filesystem.  If you only inherit one packaging class (i.e. package_ipk)
> it will automatically set the image packaging type to match.  So, to switch:
> 
> 1) INHERIT += "package_rpm"
> 2) IMAGE_PKGTYPE = "rpm"

Just a small clarification for Chris' excelent explanation - the change of the 
above variables will require a complete rebuild/repackage of all the packages 
and the filesystem image. And it's not possible to make the switch for an 
existing image or add another package manager to an existing image w/o losing 
the database of installed packages...

-- 
Denys


> On Wed, Sep 1, 2010 at 6:57 AM, l.bolognini@tiscali.it <
> l.bolognini@tiscali.it> wrote:
> 
> > Hi all,
> > I'm working on a beagleboard.
> > I'm wondering if there is a
> > quick
> > way to change package manager from opkg to dpkg or to rpm, both
> > on the
> > host and on the target.
> > I think that including dpkg package in,
> > for
> > example, arago-console-image is not enough because all packages
> > are
> > built with ipkg/opkg.
> > Moreover the directory /usr/lib/opkg/info
> > with
> > all postinst/prerm scripts could not be used anymore.
> >
> > I report a
> > small
> > extract from openembedded manual:
> > "The package_write task is
> >
> > responsible for taking each packages subdirectory and creating any
> >
> > actual
> > installation package, such as .ipk, .deb or .rpm. Currently .
> > ipk
> > is the only fully supported packing
> > format although .deb packages
> > are
> > being actively worked on."
> >
> > Has anyone tried a .deb or .rpm based
> >
> > rootfs (built with oe/bitbake) on beagleboard or in another target?
> >
> >
> >
> > Thanks for your attention,
> > best regards,
> > Luca
> >
> >
> > Risparmia con Tutto Incluso Light: telefono + adsl 8 mega a soli 19,95 ??? al
> > mese per un anno!  SCONTO DI 120 EURO!
> > http://abbonati.tiscali.it/telefono-adsl/prodotti/tc/tuttoincluso_light/?WT.mc_id=01fw
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> 
> 
> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



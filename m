Received: from [213.39.232.198] (helo=moskovskaya.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <di@mail.fh-wedel.de>) id 1Hepoc-0004en-5b
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2007 11:54:06 +0200
Received: from di by moskovskaya.fh-wedel.de with local (Exim 4.50)
	id 1Hepob-0006C7-8d for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2007 11:54:05 +0200
Date: Fri, 20 Apr 2007 11:54:05 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070420095405.GA23328@fh-wedel.de>
References: <E1HeU56-0006o4-VP@linuxtogo.org>
	<157361400.20070419145713@vanille-media.de>
	<1176998423.5833.99.camel@localhost.localdomain>
	<20070419162539.GA29294@fh-wedel.de>
	<432beae0704190938o5ae0bf04k81fe388e8faa2c09@mail.gmail.com>
	<1177001559.5833.106.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1177001559.5833.106.camel@localhost.localdomain>
X-PGP-Fingerprint: C98D 598A DA73 DF9F 610D  632E 4468 B911 BF9B 8D95
X-PGP-Key-ID: 0xBF9B8D95
User-Agent: Mutt/1.5.9i
Sender: Martin Dietze <di@mail.fh-wedel.de>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: di@mail.fh-wedel.de
Subject: Re: [oe-commits] org.oe.dev mtx-3a.conf, nylon-image-base.bb:	removed remaints from old OE code (PACKAGE_INSTALL instead of IPKG_INSTALL)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Apr 2007 09:54:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, April 19, 2007, Richard Purdie wrote:

> > > I just noticed that not inheriting image_ipk actually gives me
> > > problems because ipkg-native is no longer automatically
> > > DEPENDed. Is this a bug or a featuer? In the latter case -
> > > where are maintainers supposed to put the necessary
> > > configuration?
> 
> Is this in OE.dev or in a different branch and which bitbake version?
> There have been some recent changes that had potential to stop certain
> DEPENDS from appearing.

I am using bitbake 1.6.3 and OE.dev. I also tried bitbake 1.8.0
but this does not seem to make any difference.

> > I believe that is meant to be inherited on a distro level. The images
> > are generic and the distro chooses what package format it wants to
> > use.
> 
> Kind of. image_ipk.bbclass no longer exists in OE.dev which is why I've
> said it won't work. The top of image.bbclass does:
> 
> inherit rootfs_${IMAGE_PKGTYPE}
> 
> IMAGE_PKGTYPE is set by both package_ipk.bbclass and package_deb.bbclass

Yes, I've seen this, but it does not seem to have the effect I
want. I had another look at it again today.

> Users (or distros) have to inherit one or more of these to enable
> packaging. The first one inherited is used for rootfs generation. Having
> to select a package type isn't a problem in practise since rootfs
> generation currently depends on packages.

If I understand all this correctly this is supposed to be done
by this:

INHERIT += "package_ipk ..."

... in conf/distro/my-distro.conf, which I expect to be used
here:

classes/package_ipk.bbclass:IMAGE_PKGTYPE ?= "ipk"

... and which is then expanded here:

classes/image.bbclass:inherit rootfs_${IMAGE_PKGTYPE}

Unfortunately this does not work! The only way I get this to
work is by adding a "inherit rootfs_ipk" in the different
images' bitbake files, but this is surely not the way it is
meant to be?

Cheers,

Martin

-- 
-------------- Martin Dietze --------------- / -- 4G Systeme GmbH Hamburg ---
-- martin@the-little-red-haired-girl.org -- / ---- dietze@4g-systems.com ----
------------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Perl ist der gegl?ckte Versuch, einen braindump direkt ausf?hrbar zu
machen.  -- Lutz Donnerhacke in dasr



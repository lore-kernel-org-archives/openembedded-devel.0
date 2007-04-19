Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HeZsD-000121-3x
	for openembedded-devel@openembedded.org; Thu, 19 Apr 2007 18:52:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3JGqj1r005471
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Apr 2007 17:52:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05193-05 for <openembedded-devel@openembedded.org>;
	Thu, 19 Apr 2007 17:52:42 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3JGqdcs005464
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Apr 2007 17:52:39 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <432beae0704190938o5ae0bf04k81fe388e8faa2c09@mail.gmail.com>
References: <E1HeU56-0006o4-VP@linuxtogo.org>
	<157361400.20070419145713@vanille-media.de>
	<1176998423.5833.99.camel@localhost.localdomain>
	<20070419162539.GA29294@fh-wedel.de>
	<432beae0704190938o5ae0bf04k81fe388e8faa2c09@mail.gmail.com>
Date: Thu, 19 Apr 2007 17:52:39 +0100
Message-Id: <1177001559.5833.106.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 19 Apr 2007 16:52:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-04-19 at 09:38 -0700, Justin Patrin wrote:
> On 4/19/07, Martin Dietze <di@fh-wedel.de> wrote:
> > > image_ipk is incorrect and I'd mentioned this being a problem on the
> > > mailing list - it was causing parsing errors. We have multiple image
> > > generation types now and selecting them like that in .bb files doesn't
> > > make sense so images just inherit image.
> >
> > I just noticed that not inheriting image_ipk actually gives me
> > problems because ipkg-native is no longer automatically
> > DEPENDed. Is this a bug or a featuer? In the latter case -
> > where are maintainers supposed to put the necessary
> > configuration?

Is this in OE.dev or in a different branch and which bitbake version?
There have been some recent changes that had potential to stop certain
DEPENDS from appearing.

> I believe that is meant to be inherited on a distro level. The images
> are generic and the distro chooses what package format it wants to
> use.

Kind of. image_ipk.bbclass no longer exists in OE.dev which is why I've
said it won't work. The top of image.bbclass does:

inherit rootfs_${IMAGE_PKGTYPE}

IMAGE_PKGTYPE is set by both package_ipk.bbclass and package_deb.bbclass

Users (or distros) have to inherit one or more of these to enable
packaging. The first one inherited is used for rootfs generation. Having
to select a package type isn't a problem in practise since rootfs
generation currently depends on packages.

Cheers,

Richard




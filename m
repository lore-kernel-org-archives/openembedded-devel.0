Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HetTa-0006W4-ER
	for openembedded-devel@openembedded.org; Fri, 20 Apr 2007 15:48:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3KDmZkU018956;
	Fri, 20 Apr 2007 14:48:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18595-06; Fri, 20 Apr 2007 14:48:33 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3KDmS9v018944
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 20 Apr 2007 14:48:28 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <20070420122255.GA1923@fh-wedel.de>
References: <E1HeU56-0006o4-VP@linuxtogo.org>
	<157361400.20070419145713@vanille-media.de>
	<1176998423.5833.99.camel@localhost.localdomain>
	<20070419162539.GA29294@fh-wedel.de>
	<432beae0704190938o5ae0bf04k81fe388e8faa2c09@mail.gmail.com>
	<1177001559.5833.106.camel@localhost.localdomain>
	<20070420095405.GA23328@fh-wedel.de>
	<20070420122255.GA1923@fh-wedel.de>
Date: Fri, 20 Apr 2007 14:48:28 +0100
Message-Id: <1177076908.5842.11.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev mtx-3a.conf, nylon-image-base.bb:	removed remaints from old OE code (PACKAGE_INSTALL	instead of IPKG_INSTALL)
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
X-List-Received-Date: Fri, 20 Apr 2007 13:48:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-04-20 at 14:22 +0200, Martin Dietze wrote:
> [I just wrote]
> 
> > Having played around with this for another while it seems like
> > classes/rootfs_ipk should be patched as follows:
> > 
> > --- rootfs_ipk.bbclass-orig     2007-04-20 14:13:53.534848585 +0200
> > +++ rootfs_ipk.bbclass  2007-04-20 14:10:43.406456119 +0200
> > @@ -9,6 +9,7 @@
> > 
> >  IPKG_ARGS = "-f ${T}/ipkg.conf -o ${IMAGE_ROOTFS}"
> > 
> > +DEPENDS += "ipkg-native"
> >  RDEPENDS += "ipkg ipkg-collateral"
> >  PACKAGE_INSTALL += "ipkg ipkg-collateral"

This shouldn't be needed as you later point out.

> > How about this? I would tend to believe that rootfs_deb
> > may need something similar...
>
> At second glance this does not look much better either. From
> classes/base.bbclass:
>
> #
> # Various backwards compatibility stuff to be removed
> # when we switch to bitbake 1.8.2+ as a minimum version
> #
> 
> [...]
> 
>     if bb.data.inherits_class('rootfs_ipk', d):
>         depends = "ipkg-native ipkg-utils-native fakeroot-native " + depends
> 
> I read from this that these dependencies should have been set
> somewhere else already. So where do they come from?

That is the code which is supposed to set them for bitbake 1.6.3.

For bitbake 1.8.1+, rootfs_ipk.bbclass says:

do_rootfs[depends] += "ipkg-native:do_populate_staging ipkg-utils-native:do_populate_staging"

Regards,

Richard






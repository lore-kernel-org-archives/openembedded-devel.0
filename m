Received: from [206.46.173.13] (helo=vms173013pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mo7xk-00043Y-C8
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 05:47:19 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQ300229JT7UZGD@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Sep 2009 22:46:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5FB0714AF5F; Wed,
	16 Sep 2009 23:46:19 -0400 (EDT)
Date: Wed, 16 Sep 2009 23:46:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090917034619.GA5465@denix.org>
References: <18e217240909161025p279a35f4ma8a714bddb63ec0@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <18e217240909161025p279a35f4ma8a714bddb63ec0@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: slight different confirurations for a package
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
X-List-Received-Date: Thu, 17 Sep 2009 03:47:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Sep 16, 2009 at 10:25:17AM -0700, C Michael Sundius wrote:
> I'd like to be able to build several different configurations of the same
> package and I'm wondering if the community might have some good input on the
> best way to organize this. My project has several images that are built for
> various products and customers and hardware. Generally all of the software
> is the same save a few key packages. (really even the kernel is constant
> across all platforms). and right now I have a different disto.conf file that
> corresponds to an image recipe for each platform.
> 
> I want to be able to build all of the platforms together within the same out
> dir. (so I don't have to rebuild the bulk of the software wasting disk space
> and time).
> 
> I've thought about defining separate recipes:
>      (foo-config1.bb, foo-config2.bb)

Quick and dirty: If you use the same distro, but have separate recipes 
(foo-config1.bb and foo-config2.bb), you can place them under separate 
tasks/images (image1.bb and image2.bb) and build both images. All the 
packages, except foo-* and image1/2 will be shared and built only once, so no 
wasting of disk space and time.

> or simply using a variable to define ${PN} from within the recipe:
> 
>     PN = ${DISTRO_CONFIG}
> 
>  I suppose these could work, but I'm wondering if I can create a whole new
> directory under work and staging like when I set PACKAGE_ARCH =
> ${MACHINE_ARCH} for the kernel and drivers.
> 
> as I said, right now I have a separate distro/*.conf file for each image
> (and thus configuration) I build, really the difference between these is the
> configuration of just a few packages all other software is built w/ the same
> recipe and configs. Is there a way anyone can think of to consolidate these
> so I can build everything without
> changing the local.conf (DISTRO variable).
> 
> I realize this is a nebulous question, but if anyone has an experience
> similar where they have had to organize various builds and found a clean or
> better way to build them all for both development and production or you have
> some opinions about how you made your decisions to do things one way or
> another , I'd love to hear your comments.
> 
> Thank you
> Mike
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



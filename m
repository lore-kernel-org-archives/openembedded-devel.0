Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MCOdN-0006c7-5h
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 03:54:17 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KKQ004F1SUD5QID@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	04 Jun 2009 20:44:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8902D14AF5F; Thu,
	04 Jun 2009 21:44:37 -0400 (EDT)
Date: Thu, 04 Jun 2009 21:44:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090605014437.GA3406@denix.org>
References: <loom.20090604T233316-304@post.gmane.org>
MIME-version: 1.0
In-reply-to: <loom.20090604T233316-304@post.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: GPE Application Development Questions
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
X-List-Received-Date: Fri, 05 Jun 2009 01:54:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jun 04, 2009 at 11:56:15PM +0000, NBeing wrote:
> The "angstrom-2008.1-test-20090104-armv5te-linux-gnueabi-toolchain-gpe.tar.bz2" 
> sets up the environment like so:
> 
> export PATH=/usr/local/angstrom/arm/bin:$PATH
> 
> export PKG_CONFIG_SYSROOT_DIR=/usr/local/angstrom/arm/arm-angstrom-linux-
> gnueabi
> 
> export PKG_CONFIG_PATH=/usr/local/angstrom/arm/arm-angstrom-linux-
> gnueabi/usr/lib/pkgconfig
> 
> export CONFIG_SITE=/usr/local/angstrom/arm/site-config
> 
> alias opkg='LD_LIBRARY_PATH=/usr/local/angstrom/arm/lib 
> /usr/local/angstrom/arm/bin/opkg-cl -f /usr/local/angstrom/arm/etc/opkg-
> sdk.conf -o /usr/local/angstrom/arm'
> 
> alias opkg-target='LD_LIBRARY_PATH=/usr/local/angstrom/arm/lib 
> /usr/local/angstrom/arm/bin/opkg-cl -f /usr/local/angstrom/arm/arm-angstrom-
> linux-gnueabi/etc/opkg.conf -o /usr/local/angstrom/arm/arm-angstrom-linux-
> gnueabi'
> 
> 
> 
> I'm using an "angstrom-2009.X-test-XXXX" image so believe I need to build my 
> own toolchain.  I built the image with the latest OE and everything runs on the 
> board, however, I'm unable to build the simple "gpe-hello" app.  I believe the 
> problem has to do with my mapping of the above paths.  This is what I have, 
> would someone be able to confirm, fix, give advance on what I have wrong with 
> them?  Or a different way/tutorial I should be following on GPE Application 
> Developemnt?  Basically I used the "cross" folder when I could, then staging, 
> then rootfs.
> 
> export PATH=${HOME}/oe/build/tmp/cross/armv5te/bin:$PATH
> 
> export PKG_CONFIG_SYSROOT_DIR=${HOME}/oe/build/tmp/cross/armv5te/arm-angstrom-
> linux-gnueabi
> 
> export PKG_CONFIG_PATH=${HOME}/oe/build/tmp/staging/armv5te-angstrom-linux-
> gnueabi/usr/lib/pkgconfig
> 
> export CONFIG_SITE= ???? (Left Out)
> 
> alias opkg='LD_LIBRARY_PATH=${HOME}/oe/build/tmp/cross/armv5te/lib 
> ${HOME}/oe/build/tmp/rootfs/x11-image/usr/bin/opkg-cl -f 
> ${HOME}/oe/build/tmp/staging/i686-linux/etc/opkg-sdk.conf -o 
> ${HOME}/oe/build/tmp/cross/armv5te'
> 
> alias opkg-target='LD_LIBRARY_PATH=${HOME}/oe/build/tmp/cross/armv5te/lib 
> ${HOME}/oe/build/tmp/rootfs/x11-image/usr/bin/opkg-cl -f 
> ${HOME}/oe/build/tmp/rootfs/x11-image/etc/opkg.conf -o 
> ${HOME}/oe/build/tmp/cross/armv5te/arm-angstrom-linux-gnueabi'

The whole point of the toolchain/SDK is to be able to build apps 
like "gpe-hello" w/o having OE around, i.e. w/o cross, staging or rootfs.

> Also while I'm here, in the deploy directory there is a "modules-2.6.28-r9-
> at91sam9261ek.tgz" file build, however, I'm unsure what I'm suppose to do with 
> it?  If I'm suppose to flash it to my board where would I find the address to 
> flash too?  Thanks

That's just a tarball with kernel modules. They should already be in your 
filesystem image.

-- 
Denys



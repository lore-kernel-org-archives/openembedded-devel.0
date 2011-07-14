Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QhUNv-0007Qy-E7
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 00:27:55 +0200
Received: (qmail invoked by alias); 14 Jul 2011 22:23:55 -0000
Received: from p4FDF0026.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.0.38]
	by mail.gmx.net (mp060) with SMTP; 15 Jul 2011 00:23:55 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/1XgcJ1i71bv1p3A/BpVFnQnH2eP1lyRbZkAb7nB
	otAfN9aCNExN88
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2011 00:25:55 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <311EE95A63F86C4E960B402004EAD7E310AF74E158@ZEUS.schoeps.local>
	<201107131909.27208.schnitzeltony@gmx.de>
	<311EE95A63F86C4E960B402004EAD7E310AF74E175@ZEUS.schoeps.local>
In-Reply-To: <311EE95A63F86C4E960B402004EAD7E310AF74E175@ZEUS.schoeps.local>
MIME-Version: 1.0
Message-Id: <201107150025.56255.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: using i2c on a mx28evk
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
X-List-Received-Date: Thu, 14 Jul 2011 22:27:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, July 14, 2011 12:29:47 PM Christian Borutta wrote:
> On Wednesday, July 13, 2011 06:46:45 PM Andreas Mueller wrote:
> > I checked the recipe i2c: In the file I2c.init this recipe wants to
> > modprobe i2c- pxa. Without having further background on this recipe it
> > seems that it is not meant for any board but pxa based ( can anybody
> > confirm ? )
> > Additional this packet wants to modprobe i2c-dev. This is not the
> > oe-devel- packet but a wrapper kernel-module for creating a device node
> > in /dev. I will later modify the kernel configuration so that i2c-dev is
> > created and see which modules are created...
> >
> >In file i2c-api.c you can find
> >
> >*   @file   i2c-api.c
> >*
> >*   @brief  This file contains the implementation for performing I2C
> >operations *           on the gumstix.
> >
> >that does not look generic...
> >
> >Anyway: I will create a patch so that the package kernel-module-i2c-dev is
> >created.
> 
> I've tried your patch, but it didn't help. Maybe we need to set
> CONFIG_I2C_GPIO in the kernel configuration?
Did you install  kernel-module-i2c-dev? Do you have an i2c dev node then? How 
about removing i2c-pxa form the i2c init script?
> 
> >A bit off-topic: Would you like to test the oe-core version with the meta
> >layer found in https://gitorious.org/schnitzeltony-oe-meta/meta-freescale
> >?
> 
> I would like to test your oe-core version with meta layer but I'm not shure
> how to do that.
Something like http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-
angstrom/tree/README and http://sakrah.homelinux.org/blog/2011/03/using-
openembedded-core-to-build-angstrom-for-qemu/

o    git clone git://git.angstrom-distribution.org/setup-scripts
o    cd setup-scripts
o    git checkout origin/oe-core -b oe-core
o    add in sources/layers a line with
         openembedded-core,git://gitorious.org/schnitzeltony-oe-meta/meta-
freescale.git,master,HEAD
o    ./oebb.sh config mx28evk
o    ./oebb.sh update
o    check if the settings in conf/*.conf meat your directory preferences
o    check if you find ${TOPDIR}/sources/meta-openembedded/meta-xfce \ in 
bblayers.conf
o    bitbake console-image

Hope it helps

Andreas



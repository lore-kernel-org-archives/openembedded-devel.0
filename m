Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Nl5Id-0007yQ-PE
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 19:52:32 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYG00DSBPLJ703K@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	26 Feb 2010 12:49:07 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F199114AF60; Fri,
	26 Feb 2010 13:48:54 -0500 (EST)
Date: Fri, 26 Feb 2010 13:48:54 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100226184854.GA15391@denix.org>
References: <1267202357-8614-1-git-send-email-Martin.Jansa@gmail.com>
	<201002261754.25997.marcin@juszkiewicz.com.pl>
	<1267204061.18176.561.camel@trini-m4400>
MIME-version: 1.0
In-reply-to: <1267204061.18176.561.camel@trini-m4400>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Generating slightly different images for different	IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 26 Feb 2010 18:52:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 26, 2010 at 10:07:41AM -0700, Tom Rini wrote:
> On Fri, 2010-02-26 at 17:54 +0100, Marcin Juszkiewicz wrote:
> > Dnia pi??tek, 26 lutego 2010 o 17:39:16 Martin Jansa napisa??(a):
> > 
> > > We're slowly stripping packages not really needed, but it would be
> > > nice to remove whole /boot with kernel-image.
> > 
> > > Is there better way to solve it or should we try harder to save space
> > >  somewhere else?
> > 
> > Learn about ROOTFS_POSTPROCESS_COMMAND variable present in 
> > classes/rootfs_*.bbclass files. You can use it to launch your function after 
> > rootfs is populated.
> > 
> > So for example your shr-lite-image has drop_kernel_from_boot function in which 
> > you check "MACHINE==om-gta01" and if it is then "rm -rf /boot/uImage". After 
> > your function all normal ext2/ubifs/jffs2/tarball images will be created 
> > without kernel in them.
> 
> Or (as there's a number of ways to do this):
> PACKAGE_REMOVE = "kernel-image-*"
> ROOTFS_POSTPROCESS_COMMAND_om-gta01 += "opkg-cl ${IPKG_ARGS}
> -force-depends \
>                                 remove ${PACKAGE_REMOVE};"

This worked for me:

RDEPENDS_kernel-base = ""


As kernel.bbclass suggests the following:

# Allow machines to override this dependency if kernel image files are
# not wanted in images as standard
RDEPENDS_kernel-base ?= "kernel-image"

-- 
Denys



Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Lt8SW-00034R-5H
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Apr 2009 00:47:33 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 13 Apr 2009 00:43:55 +0200
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Mon, 13 Apr 2009 00:43:55 +0200
Received: from [192.168.1.107] ([79.51.163.216]) by FBCMCL01B05.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 13 Apr 2009 00:43:55 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <6978a1740904080132p2ad3149el52a598576982adad@mail.gmail.com>
References: <6978a1740904080132p2ad3149el52a598576982adad@mail.gmail.com>
Date: Mon, 13 Apr 2009 00:46:28 +0200
Message-Id: <1239576388.12787.3.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 12 Apr 2009 22:43:55.0225 (UTC)
	FILETIME=[28F85C90:01C9BBC0]
X-SA-Exim-Connect-IP: 85.33.2.25
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Trying to add Compulab CM-X300 machine configuration files, don't work as expected.
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
X-List-Received-Date: Sun, 12 Apr 2009 22:47:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-04-08 at 10:32 +0200, s hakkesteegt wrote:
> I'm currently trying to add the machine configuration files for the Compulab
> CM-X300 and I'm experiencing some problems.
> What I currently have can be found here: http://www.xAs Kernel I'm using
> 2.6.26, with patch provided bij Compulab, there they provide a working
> example from this kernel with a rootfs, it seemed to me to be a good
> starting point for
> me.s4all.nl/~hakkest1/oe/cm-x300.conf<http://www.xs4all.nl/%7Ehakkest1/oe/cm-x300.conf>
> 
> 
> problem 1)
> When I create an Angstrom-console image (using oe dev branch), in a fresh
> tmp directory, it creates a rootfs, only containing the following
> directories: *bin, dev, etc, lib, sbin, usr. *
> So it seems there is missing quite a lot, and the .jffs2 image is only 2.2
> MB. Can this be because of a mistake in my machine .conf file or might it be
> something different?
Maybe try angstrom directly(not console-image but full angstrom)
> 
> problem 2)
> But when I first run *bitbake console-image* for the CM-X270 and then for
> the CM-X300 then the rootfs seems to be normal, but I don't know if it is,
> because I experience quite some problems using it. When I flash the machine
> with the created kernel and rootfs, It gives me most of the time
> segmentation faults and kernel oops, as you can see in the next file:
> http://www.xs4all.nl/~hakkest1/oe/boot_1st_time_cm-x300.txt<http://www.xs4all.nl/%7Ehakkest1/oe/boot_1st_time_cm-x300.txt>
> 
> I don't think it is a hardware based problem, because the example kernel and
> rootfs from Compulab work fine on the machine, without these errors.
> 
> As Kernel I'm using 2.6.26, with patch provided bij Compulab, there they
> provide a working example from this kernel with a rootfs, it seemed to me to
> be a good starting point for me.
> 
> When I use the example kernel provided by Compulab, with my, with OE
> created, rootfs, it gives me the segmentation faults and kernel oops aswell
> (and some errors about not found modules, wich seems logical there the
> modules dir is in a different location in the example rootfs). So I suspect
> there is something wrong with my own created rootfs / jffs2 images, but I
> have no Idea what it can be.
Could it be that you have a kenrel from Compulab and incompatibles
kernel modules from openembedded in your filesystem?

Denis.




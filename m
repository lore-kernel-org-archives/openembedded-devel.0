Received: from [62.169.194.2] (helo=fesscrpp1.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1HixHv-0001Nj-TA
	for openembedded-devel@openembedded.org; Tue, 01 May 2007 20:41:24 +0200
Received: from dias (62.169.211.226) by fesscrpp1.tellas.gr (7.3.117)
	id 462338C4002431EF for openembedded-devel@openembedded.org;
	Tue, 1 May 2007 21:31:07 +0300
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@openembedded.org>
Date: Tue, 1 May 2007 21:32:01 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHKEFLKOAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <4636F787.8030902@whitby.id.au>
Importance: Normal
Subject: squasfs jffs2 default image settings
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
X-List-Received-Date: Tue, 01 May 2007 18:41:25 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

After a day of "head scratching" i realized the the reason an image i was
building, failed to load on a powerpc target was that the default settings
for squashfs squashfs-lzma and jffs2 were set to little endian architecture

//snip from  bitbake.conf

EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x40000"
EXTRA_IMAGECMD_squashfs = "-le -b 16384"
EXTRA_IMAGECMD_squashfs-lzma = "-le -b 16384"

These look like they were set for a specific machine (maybe i am wrong), but
shouldn't the default settings be at least architecture neutral ?
(Even the block sizes shouldn't be defined there as a machine might be
better suited by another size)

Any objections to have EXTRA_IMAGECMD for these types of images default to
no specific settings  ?

Stelios S. Koroneos

Digital OPSiS - Embedded Inteligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of
> Rod Whitby
> Sent: Tuesday, May 01, 2007 11:17 AM
> To: openembedded-devel@openembedded.org
> Subject: [oe] RFC: Rename MACHINE_TASK_PROVIDER to DEFAULT_TASK_PROVIDER
>
>
> > <rwhitby> so in my mokoslug distro, I set MACHINE_TASK_PROVIDER
> to task-boot or task-base, depending on flash size.
> > <rwhitby> what is MACHINE_TASK_PROVIDER really meant to be used for?
> > <koen> to distinguish between task-bootstrap and task-base
> > <rwhitby> does task-bootstrap still exist?
> > <koen> rwhitby: I hope not
> > <rwhitby> koen: so MACHINE_TASK_PROVIDER has no current reason
> for existence then?
> > <rwhitby> (and no definition of what it should be used for if
> it did have a current reason for existence)
> > <koen> rwhitby: not that I know off, but your task-boot
> suggestion would make sense
> > <rwhitby> koen: So it really should now be called something
> like BOOTSTRAP_IMAGE_FOUNDATION_TASK or something?
> > <rwhitby> (since it doesn't have anything to do with MACHINEs)
> > <koen> nor with BOOTSTRAP
> > <koen> something like DEFAULT_TASK_PROVIDER?
> > <rwhitby> yep, DEFAULT_TASK_PROVIDER floats my boat.
> > <koen> do you want to write an RFC for that?
>
> The proposal is to replace MACHINE_TASK_PROVIDER with
> DEFAULT_TASK_PROVIDER throughout OE, and encourage all image-foo.bb
> maintainers to base their image on DEFAULT_TASK_PROVIDER (which can be
> set to task-boot, or task-base, or perhaps some other distro-specific
> single task-foo value), plus other image-specific stuff.
>
> Comments?  Objections?
>
> BTW, task-bootstrap existence is as follows:
>
> > ./conf/distro/generic.conf:PREFERRED_PROVIDER_task-bootstrap =
> "task-bootstrap"
> >
> ./conf/distro/include/oplinux.inc:PREFERRED_PROVIDER_task-bootstra
> p = "task-base"
> >
> ./conf/distro/angstrom-2007.1.conf:PREFERRED_PROVIDER_task-bootstr
> ap = "task-bootstrap"
> >
> ./conf/distro/jlime-donkey.conf:PREFERRED_PROVIDER_task-bootstrap
> = "task-bootstrap"
> >
> ./conf/distro/openprotium.conf:#PREFERRED_PROVIDER_task-bootstrap
> = "task-bootstrap"
> > ./conf/machine/gumstix.conf:PREFERRED_VERSION_task-bootstrap =
> "1.0unionroot"
> > ./packages/obsolete/tasks/task-bootstrap-unionroot.bb:PROVIDES
> = "task-bootstrap"
> > ./packages/obsolete/tasks/task-bootstrap-unionroot.bb:RPROVIDES
> = "task-bootstrap"
> > ./packages/obsolete/tasks/task-bootstrap-unionroot.bb:require
> task-bootstrap.inc
> > ./packages/obsolete/tasks/task-bootstrap.bb:require task-bootstrap.inc
> > ./packages/images/jlime-opie.bb:DEPENDS = "task-bootstrap task-opie"
> > ./packages/images/jlime-opie.bb:INSTALL_PACKAGES =
> "task-bootstrap task-opie-base task-opie-base-applets \
> > ./removal.txt:Package Name:   task-bootstrap*
>
> -- Rod
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>





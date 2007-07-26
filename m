Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <palmira@rhodos.klever.net>) id 1IE3Ia-0000ur-ER
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jul 2007 15:22:40 +0200
Received: from pd953a60b.dip0.t-ipconnect.de ([217.83.166.11]
	helo=olympus.klever.net) by rhodos.klever.net with esmtpa (Exim 4.67)
	(envelope-from <palmira@rhodos.klever.net>) id 1IE3HA-00023A-1g
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jul 2007 15:21:12 +0200
Message-ID: <46A89F67.5080907@klever.net>
Date: Thu, 26 Jul 2007 15:19:35 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.4 (X11/20070619)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46A88A22.5010608@dominion.kabel.utwente.nl>
In-Reply-To: <46A88A22.5010608@dominion.kabel.utwente.nl>
Sender: palmira@rhodos.klever.net
X-Spam_score: -1.4
X-Spam_score_int: -13
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "rhodos.klever.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	the administrator of that system for details.
	Content preview:  I have never looked into all this machinery,
	but since we
	have, e.g. x11-image-spitz.tar.gz and zImage-spitz.bin symlinks,
	I'd guess
	that we can do without these somewhat ugly when unnecessary
	`ls|sort|uniq|tail` things, can't we? [...] 
	Content analysis details:   (-1.4 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.4 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: Re: [RFC] make building working zaurus images easier
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2007 13:22:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have never looked into all this machinery, but since we have, e.g.
x11-image-spitz.tar.gz and zImage-spitz.bin symlinks, I'd guess that we 
can do without these somewhat ugly when unnecessary `ls|sort|uniq|tail` 
things, can't we?

Love,
H
Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> Building a working zaurus image is tedious since you have *manually* rename a bunch of
> files before the on-board flashing software will accept it.
> 
> I therefore want to propose 2 small scripts that can be run as EXTRA_IMAGECMD to make life
> a lot easier for both developers and users:
> 
> [beware of line wrapping]
> 
> For c7x0:
> 
> #!/bin/sh
> cd ${DEPLOY_DIR_IMAGE}
> mkdir ${IMAGE_NAME}-installkit/
> cp `ls zImage-2* | sort -b | uniq |tail -n1` ${IMAGE_NAME}-installkit/zImage.bin
> cp `ls ${IMAGE_NAME}.rootfs*jffs2 | sort -b | uniq |tail -n1`
> ${IMAGE_NAME}-installkit/initrd.bin
> cp updater.sh.${MACHINE} ${IMAGE_NAME}-installkit/updater.sh
> tar cjf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tar.bz2
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/
> rm -rf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/
> 
> 
> For Spitz:
> 
> #!/bin/sh
> cd ${DEPLOY_DIR_IMAGE}
> mkdir ${IMAGE_NAME}-installkit/
> cp `ls zImage-2* | sort -b | uniq |tail -n1` ${IMAGE_NAME}-installkit/zImage.bin
> cp `ls ${IMAGE_NAME}.rootfs*gz | sort -b | uniq |tail -n1`
> ${IMAGE_NAME}-installkit/hdimage1.tgz
> cp updater.sh.${MACHINE} ${IMAGE_NAME}-installkit/updater.sh
> cp gnu-tar ${IMAGE_NAME}-installkit/
> tar cjf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tar.bz2
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/
> rm -rf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/
> 
> 
> These are just proof of concept scripts, but would something like this be acceptable to
> the zaurus maintainers in OE? Having something like this would make live for distro people
> a lot easier and should confuse OE newbies a bit less.
> 
> I have added something similar for bootldr based ipaqs in OE that writes out a reflash.ctl
> automagically, which has been a great success.
> 
> Comments/improvements/flames?
> 
> regards,
> 
> Koen
> 
> 
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFGqIoiMkyGM64RGpERApzOAJ9LGbvsDEOdsILrWbausHIFB8gCxACeIrR+
> 53PH8E27hgzdmkaYtC4EciE=
> =6q4E
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



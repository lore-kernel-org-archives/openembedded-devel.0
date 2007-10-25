Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Il1n2-0006z8-R3
	for openembedded-devel@openembedded.org; Thu, 25 Oct 2007 14:26:23 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9PCIpUo004702 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2007 14:18:52 +0200
Message-ID: <472089B1.4090706@student.utwente.nl>
Date: Thu, 25 Oct 2007 14:18:57 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20071025120035.49703327@cimmeria>
In-Reply-To: <20071025120035.49703327@cimmeria>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Kernel Packages/Modules and Versioning
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
X-List-Received-Date: Thu, 25 Oct 2007 12:26:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Graeme Gregory schreef:
> Hi, writing this with my OpenMoko hat on.

Put the kernel in the rootfs instead of in some partition :)


> Currently kernel modules create packages with names of the form
> 
> kernel-module-umaga_${PV}-${PR}.ipk
> 
> This I feel is not a good idea for mobile system that can have package
> upgrades in the field. It is my feeling that kernel modules/images
> should never upgrade without attendance from the user.

The user had to type 'ipkg upgrade' him/herself, right?

> On reason for this is to make sure user is plugged into sufficient
> power and has facilities to fix device before doing such a drastic
> upgrade.

The user had to type 'ipkg upgrade' him/herself, right?

> I would like to suggest all kernel packages are actually packaged as
> 
> kernel-module-umaga-${PV}_${RELEASE_NO}-${PV}.ipk

That is what PARALLEL_INSTALL_MODULES did and we removed that from OE.

> and that a kernel-updater is developed to guide user through kernel
> upgrades with less danger of broken devices at the end.

Your proposal would make it real easy for people to overfill their flash
by having multiple module trees in /lib/module/

> Obviously some policy would be needed so that ${RELEASE_NO}-${PV} is
> guaranteed to load on all kernel-image-${PV} kernels.
> 
> Anyway I thought I would expose this to the wider audience for more
> comments than just openmoko lists. I know this is suitable for all
> devices so Id like opinions.

We have to distinguish the case of kernel-in-rootfs and
kernel-in-own-partition before starting to discuss this.

Related: why is kernel-image packaged as kernel-image-PV_PV-PR.ipk? I
now have 5 kernel images in /boot on my a780....

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHIImxMkyGM64RGpERAozrAJ9M+aX4HPb0mxwAhhalPYA/nC5TYwCeOrvT
lUfBf0Od5UeTCF1tIdS5McU=
=+um9
-----END PGP SIGNATURE-----



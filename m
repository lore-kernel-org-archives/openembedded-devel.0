Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IyokK-00055A-K5
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 14:20:32 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB2DH7nk008120; Sun, 2 Dec 2007 14:17:07 +0100
Message-ID: <4752B053.1040909@student.utwente.nl>
Date: Sun, 02 Dec 2007 14:17:07 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <475207FB.8020405@whitby.id.au>
	<47522D46.1050309@whitby.id.au>	<475269FD.60409@student.utwente.nl>
	<1196595074.6648.11.camel@localhost.localdomain>
In-Reply-To: <1196595074.6648.11.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: [Angstrom-devel] RFC: Add ipkg to minimal image
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
X-List-Received-Date: Sun, 02 Dec 2007 13:20:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Sun, 2007-12-02 at 09:17 +0100, Koen Kooi wrote:
>> Rod Whitby schreef:
>>> Rod Whitby wrote:
>>>> I just realised that minimal-image.bb doesn't include ipkg, whereas the
>>>> first image which does include ipkg (console-image) includes a whole lot
>>>> of other stuff which could be installed using ipkg after first boot and
>>>> network access, and which make the image too big for a machine with
>>>> limited flash space (like an NSLU2).
>>> RFC #1:
>>>> Is there a reason why minimal-image does not include ipkg?  What exactly
>>>> is the definition of what should be in minimal-image which excludes the
>>>> ability to install further packages?
>> Marcin and I had a discussion about that, but I can't remember the
>> outcome. So "I have no strong opinions on that".
> 
> I think minimal was really intended for people trying to boot systems
> for the first time and really is 'the bare essentials to boot'. Having
> said that I appreciate the problem of creating an image cut down enough
> for the NSLU2. 
> 
> Ideally, MACHINE=nslu2 should make the console image become small enough
> to be usable for the device even if that different compared to the
> minimal image is just the package manager due to size constraints...
> 
> On a related but different note, the presence of a package manager or
> not sounds like an DISTRO_FEATURE. Perhaps we should add
> "package-manager" as a DISTRO_FEATURE and then use this to decide
> whether a package manager should be installed into an image. The package
> manager to install should determined by the class building the image so
> you end up with a package manager appropriate to the image - ipkg or
> dpkg+apt currently.

For angstrom it's an IMAGE_FEATURE, since some images need it (e.g.
console-image) and others don't (e.g. initramfs).
Right not you can set ANGSTROM_PKG_FORMAT to 'deb' or 'ipkg' to create
images using .ipk or .deb packages, with no rebuild needed, changing it
halfway during a build and restarting bitbake "Just Works(TM)". Any
changes to how a packagemanager is installed must keep that
'automagical' feature. The only thing missing in Rods patch is to set
the packagemanager var in
conf/distro/include/angstrom-package-{deb,ipkg}.inc.


regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHUrBTMkyGM64RGpERAgfWAJ41XtwMfcwzdUvVb7B8wlPgyzyl7ACeO3Ee
XzEKgGuHGPodrllIEg/eI7Y=
=9K0Z
-----END PGP SIGNATURE-----



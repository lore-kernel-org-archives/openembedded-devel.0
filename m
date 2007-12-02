Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IyuJ2-0004Xt-IN
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 20:16:44 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB2JDIiq018741; Sun, 2 Dec 2007 20:13:18 +0100
Message-ID: <475303CD.2080401@student.utwente.nl>
Date: Sun, 02 Dec 2007 20:13:17 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <475207FB.8020405@whitby.id.au>	<47522D46.1050309@whitby.id.au>	<475269FD.60409@student.utwente.nl>	<1196595074.6648.11.camel@localhost.localdomain>	<4752B053.1040909@student.utwente.nl>	<4752D0C5.5080001@student.utwente.nl>
	<1196616132.6648.20.camel@localhost.localdomain>
In-Reply-To: <1196616132.6648.20.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Sun, 02 Dec 2007 19:16:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Sun, 2007-12-02 at 16:35 +0100, Koen Kooi wrote:
>> To make it a bit more clear:
>>
>> There are 3 seperate items being discusses here:
>>
>>  1. how to stop a packagemanager getting into an image
>>  2. selecting which packageformat the build should use
>>  3. selecting which packagemanager handles which packageformat (ipkg can
>> handle .debs for example)
> 
> An image built with rootfs_deb needs to dpkg+apt, an image built with
> rootfs_ipk needs to use ipkg. The two will not currently work the other
> way around.

You can use rootfs_ipk to build a rootfs from .debs. ipkg only cares
about the files being an ar-wrapped-tarball, not the suffix. It requires
a small changes to the bbclass, but it is possible.

regards,

Koen

> Until that is addressed, points 2 and 3 are the same thing.
> 
>> ANGSTROM_PKG_FORMAT handles 2. and 3., but not 1. (yet)
> 
> The setting of IMG_PKGTYPE used or the inherit order of the package
> classes determine this. Do we need the angstrom specific variable?
> 
>> I think having a flag indicating *which* packagemanager gets is (like
>> Rods patch does) is a good thing, but a flag toggling the presence of
>> the packagemanager wouldn't be, since you can't distinguish the
>> resulting images from each other.
>> I think creating e.g. <foo>-nopm.bb recipes that do 'require <foo>.bb ;
>> PACKAGE_MANAGER = " "' would be the least confusing option.
> 
> I agree that specific images should have specific feature sets. This
> comes back to my point about the machine=nslu2 needing to make the
> console image usable.
> 
> Has anyone looked at how Poky does its IMAGE_FEATURES magic (see
> poky-image.bbclass)? Adding package-manager as an IMAGE_FEATURE style
> option and not as a DISTRO_FEATURE as I previously suggested could
> perhaps be a way forward...
> 
> Cheers,
> 
> Richard
> 
> 
> 
> _______________________________________________
> Angstrom-distro-devel mailing list
> Angstrom-distro-devel@linuxtogo.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/angstrom-distro-devel
> 


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHUwPNMkyGM64RGpERArb0AJ49JilRuw6f/Tj2VZ0VAJ5K52XWMACfdqKe
glVjhPyQNEeBOPy7MjHFDIM=
=r8/t
-----END PGP SIGNATURE-----



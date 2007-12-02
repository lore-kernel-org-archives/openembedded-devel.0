Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iyk43-00043f-D5
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 09:20:35 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB28H1iq000782; Sun, 2 Dec 2007 09:17:01 +0100
Message-ID: <475269FD.60409@student.utwente.nl>
Date: Sun, 02 Dec 2007 09:17:01 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <475207FB.8020405@whitby.id.au> <47522D46.1050309@whitby.id.au>
In-Reply-To: <47522D46.1050309@whitby.id.au>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: openembedded-devel <openembedded-devel@openembedded.org>
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
X-List-Received-Date: Sun, 02 Dec 2007 08:20:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> Rod Whitby wrote:
>> I just realised that minimal-image.bb doesn't include ipkg, whereas the
>> first image which does include ipkg (console-image) includes a whole lot
>> of other stuff which could be installed using ipkg after first boot and
>> network access, and which make the image too big for a machine with
>> limited flash space (like an NSLU2).
> 
> RFC #1:
>> Is there a reason why minimal-image does not include ipkg?  What exactly
>> is the definition of what should be in minimal-image which excludes the
>> ability to install further packages?

Marcin and I had a discussion about that, but I can't remember the
outcome. So "I have no strong opinions on that".

> RFC #2:
>> Does anyone object to me adding ipkg support to minimal-image?

I'll stick with "I have no strong opinions on that". :)


> OK, of course the choice of ipkg as the package manager is
> distro-specific, and depends on the distro including feed configuration
> (although just having a package manager on hand even with a feed
> configuration would be a useful addition to a minimal image).
> 
> So my revised RFC #2 is to add a DISTRO_PACKAGE_MANAGER variable, which
> DISTROs define 

DISTRO_PACKAGE_MANAGER is in package-space, so it should only show up in
R*, right? Sounds like a pretty good idea. As a side note, distros will
need to do more than that to switch packageformat or packagemanager, but
that's outside the scope of this discussion.

regards,

Koen


> -- Rod
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

iD8DBQFHUmn8MkyGM64RGpERAjowAJ95XuhuVSK6vxB0Wqff0jqduYxJlACbBl2U
rt+wJMZ5N89FQS67lG2UOfE=
=BkC3
-----END PGP SIGNATURE-----



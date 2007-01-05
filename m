Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H2ltB-0002LI-8M
	for openembedded-devel@openembedded.org; Fri, 05 Jan 2007 11:01:42 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l05A01ox025466 for <openembedded-devel@openembedded.org>;
	Fri, 5 Jan 2007 11:00:01 +0100
Message-ID: <459E219E.3000104@dominion.kabel.utwente.nl>
Date: Fri, 05 Jan 2007 10:59:58 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <76520598.20070105093334@gmail.com>	<459E18AF.5040308@dominion.kabel.utwente.nl>
	<1725097716.20070105113313@gmail.com>
In-Reply-To: <1725097716.20070105113313@gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Fixing ipkg-make-index slowness
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
X-List-Received-Date: Fri, 05 Jan 2007 10:01:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Koen,
> 
> Friday, January 5, 2007, 11:21:51 AM, you wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
> 
>> Paul Sokolovsky schreef:
> 
>>> Richard, what were the reasons for such conservative file matching?
>>> Filename matching should be just enough, as per OE convention, any
>>> package source changes leading to changes in the package metadata must
>>> lead to bumping of package recipe's PR, and that in turn updates package
>>> filename.
> 
>> It isn't enough. If you repackages the exact same files at a later date, the timestamps in
>> the tarball have changed, and hence the md5 will be different. When a user will download a
>> package ipkg will check the md5sum present in the index and abort if it doesn't match.
> 
>   Then we probably need to separate image building from feed
> creation/setup. IIRC, i-m-i currently run during image building
> too, and it steals precious minutes from each developer (vs
> distro/feed maintainer) multiple times a day. Having Packages
> to be updated only by explicit "bitbake package-index" seems
> like good compromise and corresponds to the docs which suggest
> to do that explicitly.

You just broke image creation with your suggestion.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFniGeMkyGM64RGpERAuWLAJ4y9QdBlHDOykCtrTeaXUlAIt43swCggJEw
0hcn6JzjHod58DCGCLNtJ64=
=9Gmb
-----END PGP SIGNATURE-----



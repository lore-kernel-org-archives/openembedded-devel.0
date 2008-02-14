Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JPhF5-00021T-4A
	for openembedded-devel@openembedded.org; Thu, 14 Feb 2008 17:47:23 +0100
Received: from Powerbook-2.local (vpn006019.vpn.utwente.nl [130.89.6.19])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m1EGl9nr018966 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2008 17:47:09 +0100
Message-ID: <47B4708B.6050008@student.utwente.nl>
Date: Thu, 14 Feb 2008 17:47:07 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <20080214155508.GA4163@deadlock.dhs.org>
In-Reply-To: <20080214155508.GA4163@deadlock.dhs.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: building uClinux using OE
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
X-List-Received-Date: Thu, 14 Feb 2008 16:47:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sergey 'Jin' Bostandzhyan schreef:
| Hi,
|
| I'd like to be able to build uClinux using OE and I hope to gather some
| pointers to the right direction.
|
| I think it would generally be a nice thing to have, so I would like to do
| the work in a way that it could be incorporated in OE, provided that you
| guys are interested.
|
| According to the post below the toolchain should not be a problem:
| http://mailman.uclinux.org/pipermail/uclinux-dev/2007-May/042993.html
| "uClinux development on ARM now uses a standard arm-linux targeted
tool chain.
|  We add the elf2flt tool, but it is otherwise a standard arm-linux
toolchain."
|
| As far as I know the uClinux/ARM kernel patches are already in the
mainline:
| http://opensrc.sec.samsung.com/
|
| uClibc is also already supported by OE, not sure if I would have to add
| an option for uC-libc.
|
| So basically it seems that almost everything that is needed is already
there.
|
| What is missing?
|
| - applying elf2flt processing to produced binaries

That should happen automagically, we just need to stage some more
binutils-cross headers for elf2flt to build

| - have a way of knowing that the particular build is done for the uClinux
|   targets (maybe for some tweaks in .bb files if required or to apply
patches
|   only when necessary, allthough ifdef __uClinux__ defines could be used)
|
| - not sure what else?

Since you can't (practically) do shared libraries, all packaging (and
probably staging) will be wrong, since you won't have libfoo.so.1, but
something different.

| I do not have any uClinux experience yet, and it seems to be quite
difficult
| to gather all the bits and pieces of information, so I'd appreciate
comments
| and suggestions, especially if you see that I am missing something.
|
| I'd also be interested in your thoughts on what would be the best way to
| integrate it into OE.

I had a go at this a while ago, but I had to halt working on it since
the uboot on the blackfin site refuses to load the uImage on the
blackfin site, leaving me without a good testing target.
I think forcing static linking would be the fastest way to get an image
built, we can work on details (flat, shared-flat, fdpic, etc) after that.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHtHCLMkyGM64RGpERAl7KAJ4sD85YqG+OrTVUx+eLuCb9js4TvQCffI35
7wUmhJZu6YpoBfu6e4kbEg0=
=Ez6i
-----END PGP SIGNATURE-----



Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HoE8s-0007aL-Kp
	for openembedded-devel@openembedded.org; Wed, 16 May 2007 09:41:51 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l4G7fVLr011434 for <openembedded-devel@openembedded.org>;
	Wed, 16 May 2007 09:41:31 +0200
Message-ID: <464AB5A8.8070500@dominion.kabel.utwente.nl>
Date: Wed, 16 May 2007 09:41:28 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <464613B3.8090003@dominion.kabel.utwente.nl>	<46461B73.8070900@trolltech.com>	<46461D72.4020206@dominion.kabel.utwente.nl>
	<20070516031329.GA5205@twibble.org>
In-Reply-To: <20070516031329.GA5205@twibble.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: uclibc 0.9.29 recipe
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
X-List-Received-Date: Wed, 16 May 2007 07:41:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jamie Lenehan schreef:
> On Sat, May 12, 2007 at 10:02:58PM +0200, Koen Kooi wrote:
> [...]
>> I'll add it once I solved the linux-libc-headers problems. Machine and distro maintainers
>> need to provide their parts of the uclibc configs to make it usefull, though.
> 
> Do we really need different distro based settings? 

I tried to adhere to the existing uclibc infrastructure when adding 0.9.29, but maybe it's
time to rethink and overhaul it.

> It's always been a
> bit annoying that some things will build with uclibc for one build
> but not another due to differing uclibc settings - things are a lot
> easier if there's only a single configuration.
> 
> For now I'd like to see a
> 
>   mtn -e mv uclibc-0.9.29/angstrom/uClibc.distro uclibc-0.9.29/uClibc.distro

Fine by me, could you do that?

> and then only add distro based configuration if it turns out to be
> really needed by some distro. This'll also gives us a default
> configuration for people using other distros.

And gives us a better way to keep our site-files in sync.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGSrWoMkyGM64RGpERAnrXAJwJFcLlBdZpiwEsf1Uw8DBL9agFtgCaA0ny
EleWYKtPe+qa1D9PIgGiJps=
=ByLX
-----END PGP SIGNATURE-----



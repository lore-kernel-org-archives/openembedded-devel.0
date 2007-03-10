Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HQ7tn-0004Pd-Vu
	for openembedded-devel@openembedded.org; Sat, 10 Mar 2007 21:10:45 +0100
Received: from [130.89.6.62] (vpn006062.vpn.utwente.nl [130.89.6.62])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l2AKASLr002425 for <openembedded-devel@openembedded.org>;
	Sat, 10 Mar 2007 21:10:32 +0100
Message-ID: <45F310AE.50307@dominion.kabel.utwente.nl>
Date: Sat, 10 Mar 2007 21:10:22 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <74d0deb30703100820p5f840c5bief6d31baa9672c0b@mail.gmail.com>
In-Reply-To: <74d0deb30703100820p5f840c5bief6d31baa9672c0b@mail.gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Can cross binutils and gcc be made independent of ARM version?
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
X-List-Received-Date: Sat, 10 Mar 2007 20:10:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:
> Hi,
> 
> currently binutils-cross, glibc-intermediate and gcc-cross have the
> PACKAGE_ARCH set by the MACHINE, in my case armv4t or armv5te,
> depending on the device. This causes them to be built twice,
> overwriting each other in CROSS_DIR when building a single
> distribution for all machines. Is it possible to change PACKAGE_ARCH
> to just "arm" for arm cross packages and glibc-intermediate so that
> binutils/gcc only have to be built once?

libgcc and libc6.so arm architecture specific, so they indeed need to get built multiple
times. You don't want every app to SIGILL because you built your machines in the wrong
order :(

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF8xCLMkyGM64RGpERAuPkAKCqd0TzQb3BoHbj5tAj9pHh62871gCgqgRN
ZSMVbK5zi7gmM+Jq8o4JccU=
=4BVU
-----END PGP SIGNATURE-----



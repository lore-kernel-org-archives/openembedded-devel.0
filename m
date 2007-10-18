Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IiVm9-0001ed-UK
	for openembedded-devel@openembedded.org; Thu, 18 Oct 2007 15:51:07 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9IDiCUo018653 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2007 15:44:12 +0200
Message-ID: <47176330.2000200@student.utwente.nl>
Date: Thu, 18 Oct 2007 15:44:16 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <4510693243.20071017152524@vanille-media.de>	<471729ED.9080208@student.utwente.nl>
	<1192708743.6158.25.camel@localhost.localdomain>
In-Reply-To: <1192708743.6158.25.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Cleaning up SDK/Toolchain
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
X-List-Received-Date: Thu, 18 Oct 2007 13:51:21 -0000
X-List-Received-Date: Thu, 18 Oct 2007 13:51:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Thu, 2007-10-18 at 11:39 +0200, Koen Kooi wrote:
>> Apart from the libc flaw I pointed out in another mail, the naming of the toolchains is
>> broken as well:
>>
>> angstrom-2007.9-test-20071017-arm-linux-gnueabi-toolchain.tar.bz2
>> angstrom-2007.9-test-20071017-arm-linux-uclibcgnueabi-toolchain.tar.bz2
>> angstrom-2007.9-test-20071018-powerpc-linux-toolchain.tar.bz2
>> angstrom-2007.9-test-20071018-powerpc-linux-uclibc-toolchain.tar.bz2
>>
>> There's no way to see if the arm ones are armv4t, armv5te or armv6 and the powerpc ones
>> ppc405, ppc440 or ppc603e. For compiling 'hello world' that doesn't matter, but libc6.so
>> and libgcc_s.so will contain instruction not available on other cpus of that arch (e.g.
>> clz is not in armv4t), so your binary will probably not work on your device.
>>
>> My idea is to use PACKAGE_ARCH (e.g. armv5te or ppc603e) instead of TARGET_ARCH.
>>
>> Comments/hints/ideas?
> 
> We actually have a bigger problem. Staging uses an arm directory, not an
> armv5te one so the armv5te binaries mix up with the armv4 ones etc.
> 
> This isn't a problem with images built from packages where everything
> dynamically links since the right packages are used. The moment someone
> tries to statically link an armv4 binary with armv5te in staging, game
> over though.
> 
> So both the meta-toolchain and staging need some thought (and are
> related since meta-toolchain has knowledge to rebuild bits of staging
> for use in its "shortcut an OE build by skipping the toolchain" mode.
> 
> I agreed we probably need to add in some PACKAGE_ARCHs in places but its
> yet another thing that needs some careful thought and we'll probably
> break people's existing builds. I hope to look at/think about it soon if
> nobody beats me too it...

Can't we put it in at the same time as the staging /usr changes? We'll
be breaking stuff anyway...


regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHF2MwMkyGM64RGpERAkTbAJoDh5qic4QmFPw7N857kQm0rDabjgCgtcJ0
hqYD4JywIUYGwPtw8dgJnTM=
=Hlfq
-----END PGP SIGNATURE-----



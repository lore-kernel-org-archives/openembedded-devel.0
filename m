Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H3yzB-0002eo-64
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 19:12:41 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l08IAwLr002830 for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Jan 2007 19:10:59 +0100
Message-ID: <45A2892E.5030906@dominion.kabel.utwente.nl>
Date: Mon, 08 Jan 2007 19:10:54 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200701081618.46665.openembedded@hrw.one.pl>	<f96d234e0701080819q7a8017d3q922b055670163c54@mail.gmail.com>	<45A26FE1.9050705@dominion.kabel.utwente.nl>
	<1168278774.5605.127.camel@localhost.localdomain>
In-Reply-To: <1168278774.5605.127.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Status of ARM machines in OE
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
X-List-Received-Date: Mon, 08 Jan 2007 18:12:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Mon, 2007-01-08 at 17:22 +0100, Koen Kooi wrote:
>> only (soft)fpa, not (soft)vfp.
>>
>>> I recently added a note in the kernel bb.  Softfloat is
>>> working fine.  Is there any easy way in angstrom to specify oabi?
>> DISTRO="angstrom-2007.1-oabi"
> 
> Perhaps its time to introduce some kind of marking in the machine.conf
> files like:
> 
> COMPATIBLE_ARM_ABI = "(oabi|eabi)" which angstrom can then error on
> accordingly?

s/error on/adjust abi accordingly/ ideally.

Note that you can run eabi on strongarm by forcing -no-thumb-interwork, which requires
some glibc hacking to remove -Werror from various makefiles. This doesn't buy you much,
since you still need seperate feeds for armv4, armv4t, armv5te and armv6 (and powerpc,
x86, etc).

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFookuMkyGM64RGpERAnAiAJ9XK6nh97vfWaeOkoAqQannDB/h3wCgnvNs
5Q3+GJMeI/oD++cJEHpfxZk=
=U+WC
-----END PGP SIGNATURE-----



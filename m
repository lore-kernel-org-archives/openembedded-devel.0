Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GapU4-0000dC-NK
	for openembedded-devel@openembedded.org; Fri, 20 Oct 2006 10:12:04 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9K84rFh002944 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 10:04:54 +0200
Message-ID: <45388347.3090009@dominion.kabel.utwente.nl>
Date: Fri, 20 Oct 2006 10:05:27 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1GadpR-0005SF-6I@linuxtogo.org>	<20061019213932.GA30714@twibble.org>
	<200610200904.08999.openembedded@hrw.one.pl>
In-Reply-To: <200610200904.08999.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	k9K84rFh002944
Subject: Re: [oe-commits] org.oe.dev glibc: drop 2.4, since it is confirmed to be nonworking on arm
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 08:12:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Dnia czwartek, 19 pa=C5=BAdziernika 2006 23:39, Jamie Lenehan napisa=C5=
=82:
>> On Thu, Oct 19, 2006 at 09:45:21PM +0200, "koen commit" wrote:
>>> glibc: drop 2.4, since it is confirmed to be nonworking on arm
>=20
> Koen: next time *check* does something use what you plan to remove.=20
> Especially with such *important* packages like toolchain/libc ones.

Right, sorry about that.

>> Hmm, was this really necessary? Surely marking it broken for arm
>> would have been enough for now?
>=20
> Should be enough.

Actually, no. Given the breadth and seriousness of the breakage we should=
 start
whitelisting architectures (or may be even machines).


> I reverted koen's changeset and added DEFAULT_PREFERENCE_arm =3D "-1" s=
o ARM=20
> builds will skip it.

That's untrue as well. I added a compatible_host mask to make it only bui=
ld for x86 (hi
mickey!) and shX (hi Jamie!)

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFOINHMkyGM64RGpERAjHXAKC6ERbJ9m6067RRBGKCBM6VDajyUwCeNXcb
wJUrok6d9qTZnXZfUprJg5w=3D
=3DqjEZ
-----END PGP SIGNATURE-----



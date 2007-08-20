Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IN5ia-0000Je-77
	for openembedded-devel@openembedded.org; Mon, 20 Aug 2007 13:46:48 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7KBjo1R027611 for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2007 13:45:51 +0200
Message-ID: <46C97EFE.2080007@dominion.kabel.utwente.nl>
Date: Mon, 20 Aug 2007 13:46:06 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1IIPXa-0005bT-C3@linuxtogo.org>	<1186499800.5653.62.camel@localhost.localdomain>
	<200708201332.29985.openembedded@hrw.one.pl>
In-Reply-To: <200708201332.29985.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l7KBjo1R027611
Subject: Re: [oe-commits] org.oe.dev linux 2.6.22: Alix boards use bzImage kernels
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
X-List-Received-Date: Mon, 20 Aug 2007 11:46:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Dnia wtorek, 7 sierpnia 2007, Richard Purdie napisa=C5=82:
>> On Tue, 2007-08-07 at 15:56 +0200, hrw commit wrote:
>>> packages/linux/linux.inc	86d436757b3b9cb61a1a381d76950ef21596b40c
>>> +++ packages/linux/linux.inc	a948d889b8d420c7a04eb140caaa353601fa7722
>>> @@ -11,6 +11,7 @@ inherit kernel
>>>
>>>  inherit kernel
>>>
>>> +KERNEL_IMAGETYPE_alix =3D "bzImage"
>>>  KERNEL_IMAGETYPE_progear =3D "bzImage"
>>>  KERNEL_IMAGETYPE_simpad =3D "zImage"
>>>  KERNEL_IMAGETYPE_kb9202 =3D "uImage"
>> Should these not really go into the machine.conf files?
>=20
> Right - I looked at it and prepared patch. It removes=20
> KERNEL_IMAGETYPE =3D "zImage" entries from kernel recipes and also sets
> this variable into bzImage for x86 machines which already use that type
> of kernels. Rest of machines are untouched (yet) - I can convert them i=
f
> we reach consensus about it.
>=20
> Please review and comment.

What about poking machine maintainer to start using linux.inc direcly as =
well instead of
duplicating it?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGyX7+MkyGM64RGpERAsD0AKCSAYvY2XbMLFZAXpr5IHpi1TZLiQCfQzP5
seC/1I7mSPzgum86h+ldOZI=3D
=3DBCK8
-----END PGP SIGNATURE-----



Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GhOsW-0006Hj-7l
	for openembedded-devel@openembedded.org; Tue, 07 Nov 2006 12:12:28 +0100
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kA7BB1ox022159 for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Nov 2006 12:11:02 +0100
Message-ID: <455069C5.10807@dominion.kabel.utwente.nl>
Date: Tue, 07 Nov 2006 12:11:01 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <454EEA21.7050108@dominion.kabel.utwente.nl>
	<1162850089.5544.18.camel@localhost.localdomain>
In-Reply-To: <1162850089.5544.18.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	kA7BB1ox022159
Subject: Re: [RFC] New MACHINE_FEATURE: 'screen'
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
X-List-Received-Date: Tue, 07 Nov 2006 11:12:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Mon, 2006-11-06 at 08:54 +0100, Koen Kooi wrote:
>> I was building an =C3=85ngstr=C3=B6m bootstrap image for my loft[1] an=
d noticed it was building
>> psplash. Since the loft lacks support for graphical output (except usb=
-vga adaptors), it
>> would be nice to leave out stuff like bootsplashes. What do you think =
about adding
>> 'screen' to MACHINE_FEATURES?
>=20
> I think you've illustrated the need :)

I've added 'screen' and 'pci' to MACHINE_FEATURES. I ran into troubles wi=
th wpa-supplicant
0.5.1, that needs 'pci' for depending on madwifi-ng.
Both are still unused in the metadata, but at least task-base lists them =
now

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFUGnEMkyGM64RGpERAp7XAJ9RF1r8+Yo/oJ3KOidKjQqEJ8S6XQCdFkkj
z2wBGCKZ41O2YS9cdsnjbyM=3D
=3DQ0Ec
-----END PGP SIGNATURE-----



Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IPaoN-0004ge-JB
	for openembedded-devel@openembedded.org; Mon, 27 Aug 2007 11:23:07 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7R9LQ1R011862 for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2007 11:21:26 +0200
Message-ID: <46D297B6.3010305@dominion.kabel.utwente.nl>
Date: Mon, 27 Aug 2007 11:21:58 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <1188204435.2137.46.camel@localhost.localdomain>
In-Reply-To: <1188204435.2137.46.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l7R9LQ1R011862
Subject: Re: Why Not Remove Src after Install
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
X-List-Received-Date: Mon, 27 Aug 2007 09:23:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

=E6=9D=A8=E5=90=8C=E5=B3=B0 schreef:
> Hello EveryOne :=20
>            when I use OE to build OpenMoko , I found my disk has not
> enough space .and the project has cost 13 G .=20
>    we know that when finish of do_fetch ,the source will unpack to tmp
> dir .  My question is why not remove the dir=20
>    which uppack create to save usr's disk space ?=20
>=20
>           Another question is that where the file install to  ,and how
> can i set it ?=20
>            If i want to remove source files after install ,how can i do
> it ?
>=20
>            Thank you !=20

INHERIT +=3D "rm_work"

That should remove ${S} after completing the build.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG0pe2MkyGM64RGpERAtftAJ4nlRd3oqK0zQKaJZBj71Cn+3PQZACeJHTF
sxhHpIpdxO0yMYihYU/kMBU=3D
=3DWHjh
-----END PGP SIGNATURE-----



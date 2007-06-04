Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HvCUu-00087n-3x
	for openembedded-devel@openembedded.org; Mon, 04 Jun 2007 15:21:26 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l54DJDLr014908 for <openembedded-devel@openembedded.org>;
	Mon, 4 Jun 2007 15:19:13 +0200
Message-ID: <46641153.2050207@dominion.kabel.utwente.nl>
Date: Mon, 04 Jun 2007 15:19:15 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>	<73D8EBA5-2F97-43F0-B474-6BD6B7023BA3@gmx.net>	<ae36f8040706032019q12a628fcte0325229297a9076@mail.gmail.com>	<4663C0AC.7020804@dominion.kabel.utwente.nl>
	<ae36f8040706040555s79d65114r57f7f514c6c746d5@mail.gmail.com>
In-Reply-To: <ae36f8040706040555s79d65114r57f7f514c6c746d5@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l54DJDLr014908
Subject: Re: problems doing bitbake task-base
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
X-List-Received-Date: Mon, 04 Jun 2007 13:21:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Lu=C3=ADs Cargnini schreef:
> maybe because of this configuration lines:
> #ASSUME_PROVIDED +=3D "/opt/eldk/usr/bin"
> ASSUME_PROVIDED +=3D " virtual/${TARGET_PREFIX}gcc "
> ASSUME_PROVIDED +=3D " virtual/glibc "
> # Select between multiple alternative providers, if more than one is
> eligible.
> PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
> PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
> PREFERRED_PROVIDERS +=3D "
> virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
> PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
> PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"

Yes, remove all of those.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGZBFSMkyGM64RGpERAuTGAJ43KPrYYSHjLdFpvwooa66bGoFSFACcCGKk
lJdmmKosSpqTvdl+Q4MPvGI=3D
=3D6jKp
-----END PGP SIGNATURE-----



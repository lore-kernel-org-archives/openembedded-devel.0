Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1JhC3w-0005Og-NW
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Apr 2008 01:08:12 +0200
Received: (qmail invoked by alias); 02 Apr 2008 23:08:10 -0000
Received: from e179073138.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.179.73.138]
	by mail.gmx.net (mp053) with SMTP; 03 Apr 2008 01:08:10 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18io4YPAd8ie6UOu/KKFzSZOr4O7Qi5Lvn/TI7dml
	+7vbcJilKYneqi
Message-ID: <47F411D6.2090602@gmx.net>
Date: Thu, 03 Apr 2008 01:08:06 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47F185E1.9070307@gmx.net> <fsslqt$uhe$2@ger.gmane.org>
In-Reply-To: <fsslqt$uhe$2@ger.gmane.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: trouble with cp command in autotools.bbclass
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
X-List-Received-Date: Wed, 02 Apr 2008 23:08:12 -0000
X-Groupsio-MsgNum: 4901
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigA430B6EA208DCFDE355C68EC"

--------------enigA430B6EA208DCFDE355C68EC
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi.

Koen Kooi schrieb:
> Robert Schuster schreef:
> | # (The find command handles an empty ${STAGE_TEMP/${libdir} correctly=
)
> | echo "find ${STAGE_TEMP}/${libdir} -mindepth 1 -maxdepth 1 -exec cp
> | -fpPR {} ${STAGING_LIBDIR}" \;
> |
> | find ${STAGE_TEMP}/${libdir} -mindepth 1 -maxdepth 1 -exec cp -fpPR {=
}
> | ${STAGING_LIBDIR} \;
> |
> | Ok for commit?
>=20
> or use:
>=20
> autotools_stage_dir ${STAGE_TEMP}/${libdir} ${STAGING_LIBDIR}
Looks better, indeed.

I committed it this way.

Regards
Robert
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




--------------enigA430B6EA208DCFDE355C68EC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH9BHYG9cfwmwwEtoRCGErAJ9Z6klGlaK+/8/V9WTZ5BI2CH2eFwCeIY9h
moKBJUr7twuoV1zSbzoDTRQ=
=hkAC
-----END PGP SIGNATURE-----

--------------enigA430B6EA208DCFDE355C68EC--

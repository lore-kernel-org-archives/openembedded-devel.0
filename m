Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1JgUe6-0000Na-3e
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 02:46:38 +0200
Received: (qmail invoked by alias); 01 Apr 2008 00:46:34 -0000
Received: from brln-4db98571.pool.einsundeins.de (EHLO [192.168.4.110])
	[77.185.133.113]
	by mail.gmx.net (mp001) with SMTP; 01 Apr 2008 02:46:34 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19hOvpZUa5hRnAmT+7Xkb3e1pCUgXHArc+Hh8mnS4
	zktc844uaC8cAW
Message-ID: <47F185E1.9070307@gmx.net>
Date: Tue, 01 Apr 2008 02:46:25 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: trouble with cp command in autotools.bbclass
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
X-List-Received-Date: Tue, 01 Apr 2008 00:46:38 -0000
X-Groupsio-MsgNum: 4870
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig714C4AAC387E5B9610CDA8CC"

--------------enig714C4AAC387E5B9610CDA8CC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
lately the following copy operation has been added to autotools.bbclass:

# Otherwise libtool wasn't used, and lib/ can be copied
# directly.
echo "cp -fpPR ${STAGE_TEMP}/${libdir}/* ${STAGING_LIBDIR}"
cp -fpPR ${STAGE_TEMP}/${libdir}/* ${STAGING_LIBDIR}

I have trouble with this and a package that creates an empty ${libdir}.
Shell globbing (*) wont find a file and instead tries to copy a file
named "*" ... and fails and so does my built.

I would like to replace this with the following lines which uses find
and is more robust:

# (The find command handles an empty ${STAGE_TEMP/${libdir} correctly)
echo "find ${STAGE_TEMP}/${libdir} -mindepth 1 -maxdepth 1 -exec cp
-fpPR {} ${STAGING_LIBDIR}" \;

find ${STAGE_TEMP}/${libdir} -mindepth 1 -maxdepth 1 -exec cp -fpPR {}
${STAGING_LIBDIR} \;

Ok for commit?

Regards
Robert


--------------enig714C4AAC387E5B9610CDA8CC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH8YXkG9cfwmwwEtoRCHz1AJ4mUeR+E2oQlnp00IjOv49HBAHEHACfcKLu
fGIZhJ7A+7N9WGNQH+jj7TA=
=DPPQ
-----END PGP SIGNATURE-----

--------------enig714C4AAC387E5B9610CDA8CC--

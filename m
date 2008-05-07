Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <julian_chu@openmoko.com>) id 1Jth2U-0003Jr-Bh
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 May 2008 12:38:23 +0200
Received: from [172.16.23.119] (helo=Macintosh.local)
	by aakash.openmoko.org with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <julian_chu@openmoko.com>) id 1Jth1l-0002By-3J
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 May 2008 18:37:48 +0800
Message-ID: <482186E4.8020102@openmoko.com>
Date: Wed, 07 May 2008 18:39:32 +0800
From: Julian <julian_chu@openmoko.com>
User-Agent: Thunderbird 2.0.0.14 (Macintosh/20080421)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.7.1210068010.31555.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.7.1210068010.31555.openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 0.95.6
X-SA-Exim-Connect-IP: 172.16.23.119
X-SA-Exim-Mail-From: julian_chu@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: qa_staging failed with recipe which inherit sdk.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 May 2008 10:38:23 -0000
X-Groupsio-MsgNum: 5084
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigCCDE97196B1668EE4433BAE5"

--------------enigCCDE97196B1668EE4433BAE5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Date: Mon, 05 May 2008 18:02:41 +0100
> From: Richard Purdie <rpurdie@rpsys.net>
> Subject: Re: [oe] qa_staging failed with recipe which inherit
> 	sdk.bbclass
> To: openembedded-devel@openembedded.org
> Message-ID: <1210006961.5113.25.camel@dax.rpnet.com>
> Content-Type: text/plain
>=20
> This happens when your BUILD_ARCH and your TARGET_ARCH are the same and=

> its a known issue. Previously Poky worked around this by setting
> HOST_VENDOR to TARGET_VENDOR but that causes subtle problems with the
> toolchain building (it becomes a Canadian Cross).
>=20
> I made a change in Poky recently to sdk.bbclass which will probably
> help, I'll sync that to OE...
>=20
> Regards,
>=20
> Richard


Hi ,

I got the change and modify sdk.bbclass by hand before I propogate from o=
e.
Now I build gdb-cross-sdk successfully.

Thanks :-)

-Julian


--------------enigCCDE97196B1668EE4433BAE5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.8 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkghhvUACgkQPvWtVv2QI0C0qQCgnbcnBZE9U8LX3AmGggk+9gcg
MWwAn3chctsVeaROf16num8RZ4kqlWko
=uWhp
-----END PGP SIGNATURE-----

--------------enigCCDE97196B1668EE4433BAE5--

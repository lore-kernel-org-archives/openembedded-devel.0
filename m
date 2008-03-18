Received: from [209.85.146.179] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <summatusmentis@gmail.com>) id 1Jba5Y-00031x-QV
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Mar 2008 12:34:42 +0100
Received: by wa-out-1112.google.com with SMTP id l24so8698145waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2008 04:34:37 -0700 (PDT)
Received: by 10.114.13.1 with SMTP id 1mr1430532wam.4.1205840077569;
	Tue, 18 Mar 2008 04:34:37 -0700 (PDT)
Received: from beatitas.local ( [72.168.202.219])
	by mx.google.com with ESMTPS id 62sm31115745wri.30.2008.03.18.04.34.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 Mar 2008 04:34:36 -0700 (PDT)
Message-ID: <47DFA8BB.7000902@gmail.com>
Date: Tue, 18 Mar 2008 07:34:19 -0400
From: Jacob Thebault-Spieker <summatusmentis@gmail.com>
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>	<200803181056.43273.openembedded@haerwu.biz>	<fro4dk$tut$1@ger.gmane.org>
	<fro6b3$4qo$1@ger.gmane.org>
In-Reply-To: <fro6b3$4qo$1@ger.gmane.org>
X-Enigmail-Version: 0.95.6
X-SA-Exim-Connect-IP: 209.85.146.179
X-SA-Exim-Mail-From: summatusmentis@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Tue, 18 Mar 2008 11:34:43 -0000
X-Groupsio-MsgNum: 4675
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig3CFF82B369138B4F81108688"

--------------enig3CFF82B369138B4F81108688
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Don't know if my opinion matters that much, but +1 from me

--
Jacob Thebault-Spieker
Cell: (207) 717-5114


Koen Kooi wrote:
> Koen Kooi schreef:
> | Marcin Juszkiewicz schreef:
> |
> | | Few things:
> | |
> | | 1. There is no such thing as 'opkg-utils' - we still use
> | ipkg-utils-native
> | |    for creating packages.
> |
> | fixed
> |
> | | 2. You missed image.bbclass change:
> | |
> | | --- a/trunk/meta/classes/image.bbclass
> | | +++ b/trunk/meta/classes/image.bbclass
> | | @@ -85,8 +85,6 @@ fakeroot do_rootfs () {
> | |
> | |      insert_feed_uris
> | |
> | | -    rm -f ${IMAGE_ROOTFS}${libdir}/ipkg/lists/*
> | | -
> | |      ${IMAGE_PREPROCESS_COMMAND}
> | |
> | |      export TOPDIR=3D${TOPDIR}
> | |
> | | 3. Meta/meta-toolchain.bb recipe also use ipkg and this also was ch=
anged
> | |    in Poky.
> | |
> | | 4. You did not set SRCREV for opkg-sdk recipe.
> |
> | attached is a version with a less restricted diff.
>=20
> And as a bonus:
>=20
> http://rafb.net/p/mDhfsf98.txt

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--------------enig3CFF82B369138B4F81108688
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.8 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkffqMAACgkQtXjjJ1zu9YCWsQCdGsU7HF+6E9GFbumnUvxQ4bBR
hwsAoKtbR8cj5onPmw9sxaKx4bhpOn9U
=yzcg
-----END PGP SIGNATURE-----

--------------enig3CFF82B369138B4F81108688--

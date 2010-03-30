Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1Nwh7y-0002mp-Jj
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 21:29:53 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1Nwh4n-0005Jx-Eh
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 23:26:17 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Mar 2010 22:23:15 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <E1Nwfep-0007c6-NX@melo.openembedded.org>
	<1269976486.6277.80.camel@trini-m4400>
In-Reply-To: <1269976486.6277.80.camel@trini-m4400>
MIME-Version: 1.0
Message-Id: <201003302323.18157.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Roman I Khimov : clamav-0.94.2: remove deprecated options from config file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Tue, 30 Mar 2010 19:29:53 -0000
X-Groupsio-MsgNum: 18280
Content-Type: multipart/signed; boundary="nextPart1901555.QV6On0T6vM";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1901555.QV6On0T6vM
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 30 =D0=BC=D0=B0=D1=80=D1=82=D0=
=B0 2010 23:14:46 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Tom Rini =D0=BD=D0=B0=D0=
=BF=D0=B8=D1=81=D0=B0=D0=BB:
>> +do_install_append() {
>> +	# Remove deprecated options
>> +	sed -ri "/Archive(Block)?Max/d" ${D}/${sysconfdir}/clamd.conf
>> +}
>> \ No newline at end of file
>=20
> Maybe we should start making this per version?  I know we're
> inconsistent about this stuff a good bit, but it seems like that's the
> best way to handle incompatible config files.  I say this since it seems
> possible that come April we have the old stuff in the conf file and no
> versions that need it.  Now that I've said this in public, someone might
> make a note to make sure that doesn't happen, but I think the point is
> still valid ;)

As of today, this takes less bytes than storing whole another config, so it=
's=20
done this way. And I have had clamd.conf update planned as part of ClamAV <=
=20
0.95 removal, "EXTRA_OECONF" will also be moved into .inc.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1901555.QV6On0T6vM
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuyT6YACgkQXJ70z+XgVcMnkwCg4oFgtD2j8k9zZFLfBI8r99YB
pSoAoNFVf2WYoqwttkUWqRjcIFFXzgyX
=cHS3
-----END PGP SIGNATURE-----

--nextPart1901555.QV6On0T6vM--

Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1JCHcE-00072t-Iv
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 17:47:50 +0100
Received: (qmail invoked by alias); 08 Jan 2008 16:40:48 -0000
Received: from e178115083.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.115.83]
	by mail.gmx.net (mp008) with SMTP; 08 Jan 2008 17:40:48 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX193I8MXr2B3t6+11PyYjUBLZsd/0fUX9UgDJmF0I4
	EClBY5jjXGnhGS
Message-ID: <4783A78E.9030405@gmx.net>
Date: Tue, 08 Jan 2008 17:40:46 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47836C9B.3000407@gmx.net>
	<1199798327.6053.11.camel@localhost.localdomain>
In-Reply-To: <1199798327.6053.11.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: RFC: add osso version of libtool and libatk
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
X-List-Received-Date: Tue, 08 Jan 2008 16:47:51 -0000
X-Groupsio-MsgNum: 3821
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig6022689C2FA9BF4B1B62B5CD"

--------------enig6022689C2FA9BF4B1B62B5CD
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
with Holger's help I pulled out an old version of libtool 1.5.6. I added
it to the tree again with DEFAULT_PREFERENCE =3D "-1" and a note for why
it exists ...

I'll have a look at unifying the libtool recipes later. They all look
very similar indeed ...

Regards
Robert

Richard Purdie schrieb:
> On Tue, 2008-01-08 at 13:29 +0100, Robert Schuster wrote:
>> on IRC it was suggested to put this on the mailing list.
>>
>> I want some osso versions (Maemo-specific) of some software packages i=
n
>> OE to be able to build compatible packages:
>>
>> http://bugs.openembedded.org/show_bug.cgi?id=3D3384
>>
>> If no one objects I would like to apply the patches there.
>=20
> I have two concerns:
>=20
> a) libtool at least duplicates a lot of recipe, we should be encouragin=
g
> more .inc usage.
> b) packages is becoming large and unwieldy
>=20
> There could be a case for splitting packages into say:
>=20
> packages/=20
> packages-gpe/
> packages-maemo/
> packages-openmoko/
> packages-opie/
>=20
> Sadly these two points don't work well together since .inc/patch sharin=
g
> with collections enabled doesn't work. This is something I think we nee=
d
> to fix as a priority.
>=20
> The advantage to b) is I can then remove groups of files from the
> equation easily and speed up parsing and reduce the chances of bad
> things like  maemo packages breaking my normal ones...
>=20
> This disadvantage is that you end up with libtool in two places and if
> one is updated, the other could be missed.
>=20
> Reluctantly I'd therefore say it could be committed now if an .inc file=

> is created for libtool and maybe improved for atk but we should conside=
r
> the wider issue.
>=20
> I'd also make a case for given vendor 'hacked' versions a
> DEFAULT_PREFERENCE =3D "-1" so you have to explicitly select them.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



--------------enig6022689C2FA9BF4B1B62B5CD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD4DBQFHg6eOG9cfwmwwEtoRCKRfAJ4tGH4dao2C9PIQPWMJ+ncFpVRu7wCYoiKh
wWPMEM+fah57DjS2zQ9zyw==
=mTS5
-----END PGP SIGNATURE-----

--------------enig6022689C2FA9BF4B1B62B5CD--

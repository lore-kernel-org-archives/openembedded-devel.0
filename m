Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Uc1iB-0006Ce-6C
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 00:59:24 +0200
Received: (qmail 3242 invoked by uid 1003); 13 May 2013 22:41:02 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@71.171.30.249)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	13 May 2013 22:41:02 -0000
Message-ID: <51916BFD.5090903@balister.org>
Date: Mon, 13 May 2013 18:41:01 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1368448471-2941-1-git-send-email-jukka.rissanen@linux.intel.com>
	<kmrj87$g8t$1@ger.gmane.org>
In-Reply-To: <kmrj87$g8t$1@ger.gmane.org>
X-Enigmail-Version: 1.5.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-networking][PATCH] vpnc: Runtime dependency to perl was missing
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
X-List-Received-Date: Mon, 13 May 2013 22:59:40 -0000
X-Groupsio-MsgNum: 44692
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="----enig2BJWORSDGVIUNNNOAUVGG"

------enig2BJWORSDGVIUNNNOAUVGG
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 05/13/2013 04:42 PM, Koen Kooi wrote:
> Op 13-05-13 14:34, Jukka Rissanen schreef:
>> Generated package contains perl script but dependecy to perl was
>> missing.
>=20
>> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com> ---=20
>> meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 2 +- 1 file
>> changed, 1 insertion(+), 1 deletion(-)
>=20
>> diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
>> b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb index
>> 2ce9530..df90234 100644 ---
>> a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb +++
>> b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb @@ -6,7 +6,7=
 @@
>> PRIORITY =3D "optional" LICENSE =3D "GPL-2.0+" LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D173b74cb8ac640a9992c03f3bce22a33" DEPENDS =3D
>> "libgcrypt" -RDEPENDS_${PN} =3D "kernel-module-tun" +RDEPENDS_${PN} =3D=

>> "kernel-module-tun perl"
>=20
> I've seen a number of patches doing this and I hate it for 2 reasons:
>=20
> 1) the perl stuff should be looked at and split out in a subpackage whe=
never
> possible
> 2) it doesn't actually fix the problem, since you need to specify the
> perl-modules it needs as well.

Another way to annoy Koen :), is to suck in all the perl-modules rather
than work out which ones are really need.

Philip

>=20
> So patches like this drag in perl while at the same time not actually f=
ixing
> the problem of failing runtimes, only papering over RPM bitching out
> dependencies.
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
>=20


------enig2BJWORSDGVIUNNNOAUVGG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJRkWv9AAoJEMDJd4rr0merCPoIAJ6jnL9xtXzGJfGYvv3dFUFz
uvusH9XmThzGwYGDiWArJ+vOdd7iK1QqbelcxyluVSFjNsNWDxGa30RqS1UsZfnJ
irDu5yMa4epuKkPzp09u9O727me337FZBZUx/IbCsFGgKzy9xdWTFX+hXmk4m289
AbwKBoQ7of05xFm+UINgBkOaaky0VMBG6nldHA7VJnbfURQMczlwTeDs0ITohmy8
H2ssWtlBF5wi1sUWn2m6cKldr4D5cJXFL0jXf8dujVaCJAOPOYkzoo4n87YCKo4l
KyGFYByH/DPczWlvF9P+moAjcbDrJ1pvWAvoTlXGPHJnRo3HfZSSWes6HpiUZ/0=
=5v/D
-----END PGP SIGNATURE-----

------enig2BJWORSDGVIUNNNOAUVGG--

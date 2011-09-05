Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R0ggq-0004kY-BT for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 23:26:48 +0200
Received: from f053041232.adsl.alicedsl.de ([78.53.41.232]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R0gc3-0004sd-Qs for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 21:21:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 05 Sep 2011 23:21:48 +0200
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04CE2F5D@nzc-ap-xch-02.ap.trimblecorp.net>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04CE2F5D@nzc-ap-xch-02.ap.trimblecorp.net>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315257709.16863.59.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: Error building gnome image ... xsltproc
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
X-List-Received-Date: Mon, 05 Sep 2011 21:26:48 -0000
X-Groupsio-MsgNum: 34070
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Cq1UB5taXgen6U1FaZuv"

--=-Cq1UB5taXgen6U1FaZuv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Bernard,


Am Dienstag, den 06.09.2011, 07:23 +1200 schrieb Bernard Mentink:
> Hi Guys,
>=20
> Am trying to build the systemd-gnome-image and I get a error when
> executing xsltproc on docbook.xsl, error is:
>=20
>  xsltproc -nonet
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> udisks-daemon.xml
> I/O error : Attempt to load network entity
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> warning: failed to load external entity
> "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> "
> cannot parse
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
>=20
> I suspect this is a proxy issue: Anyone have a solution for this.

I do not know if you use oe-core/meta-oe or oe.dev/oe-classic. For
oe.dev you have to install it on the build host.

	$ sudo aptitude install docbook-xsl


Thanks,

Paul

--=-Cq1UB5taXgen6U1FaZuv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5lPWwACgkQPX1aK2wOHViZkgCfaIbS1TqPmOlSiyhaabrymnWc
a1YAn2FJSUV7cKcRfDPV7GykLTkW5va1
=uTUB
-----END PGP SIGNATURE-----

--=-Cq1UB5taXgen6U1FaZuv--

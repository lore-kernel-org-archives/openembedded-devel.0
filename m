Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PyMiR-0003ce-FY for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 12:10:35 +0100
Received: from f053032177.adsl.alicedsl.de ([78.53.32.177]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PyMgt-0002g1-1a for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 11:08:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1299084995.3857.68.camel@mattotaupa>
References: <1299076864.3857.46.camel@mattotaupa>
	<20110302154001.GA13969@mi.fu-berlin.de>
	<1299084995.3857.68.camel@mattotaupa>
Date: Sat, 12 Mar 2011 12:08:57 +0100
Message-ID: <1299928137.3680.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: minimal-uclibc: alsa-utils_1.0.24.2: task compile fails with `warning: incompatible implicit declaration of built-in function 'exp10'`
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
X-List-Received-Date: Sat, 12 Mar 2011 11:10:35 -0000
X-Groupsio-MsgNum: 30121
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+bVPWo2PZwZ+8bxKpyYQ"

--=-+bVPWo2PZwZ+8bxKpyYQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 02.03.2011, 17:56 +0100 schrieb Paul Menzel:
> Am Mittwoch, den 02.03.2011, 16:40 +0100 schrieb Henning Heinold:
> > You didnt tell us your uclibc version. Try git.
>=20
> I have nothing in my `conf/local.conf` and therefore uclibc_git is used
> by default. A line from the build log.
>=20
>     NOTE: package uclibc-initial-git-r35.8+gitr0+094d82d3b3e8f8c8460a802b=
7a9548f3ae4fda46

Just to clarify, since I was a little confused, since
`DEFAULT_PREFERENCE =3D "-1"` is in `uclibc_git.bb`.

        $ git grep PREFERRED_UCLIBC
        conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_ucl=
ibc                    ?=3D "${PREFERRED_UCLIBC_VERSION}"
        conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_ucl=
ibc-initial            ?=3D "${PREFERRED_UCLIBC_VERSION}"
        conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_ucl=
ibc-cross              ?=3D "${PREFERRED_UCLIBC_VERSION}"
        conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_ucl=
ibc-cross-sdk          ?=3D "${PREFERRED_UCLIBC_VERSION}"
        conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_ucl=
ibc-cross-initial      ?=3D "${PREFERRED_UCLIBC_VERSION}"
        conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_ucl=
ibc-cross-intermediate ?=3D "${PREFERRED_UCLIBC_VERSION}"
        conf/distro/include/sane-toolchain.inc:PREFERRED_UCLIBC_VERSION    =
         ?=3D "git"

So `minimal-uclibc` uses `uclibc_git.bb` by default.


Thanks,

Paul

--=-+bVPWo2PZwZ+8bxKpyYQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk17VEAACgkQPX1aK2wOHVgjUwCeJL5933z+eKhE1uUsD5s9HTg1
jGoAnRy8yGbMldcoICPyieeYIHSSwH4v
=q9XN
-----END PGP SIGNATURE-----

--=-+bVPWo2PZwZ+8bxKpyYQ--

Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qob60-0001g6-ON for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 15:02:49 +0200
Received: from f053043040.adsl.alicedsl.de ([78.53.43.40]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qob1t-0000Kf-39 for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 12:58:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4E39412E.8030507@googlemail.com>
References: <1312311949-3788-1-git-send-email-josua.mayer97@googlemail.com>
	<1312370150.19311.163.camel@mattotaupa>
	<4E39412E.8030507@googlemail.com>
Date: Wed, 03 Aug 2011 14:58:26 +0200
Message-ID: <1312376306.19311.270.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: `machines/{ion.conf, includes/tune-atom.inc}`: `Your PACKAGE_ARCHS field contains duplicates.` (was: [PATCH v2] mplayer_git: Fix linker error on x86 machines)
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
X-List-Received-Date: Wed, 03 Aug 2011 13:02:49 -0000
X-Groupsio-MsgNum: 33492
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-TeBIaojP017o3QRLTGOT"

--=-TeBIaojP017o3QRLTGOT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 03.08.2011, 14:38 +0200 schrieb Josua Mayer:

[=E2=80=A6]

> I wasn't sure if a PR bump was needed as the patch does not change
> mplayer in a way that would require people to update it, it only matters
> to platforms where it didnt compile before so it wasnt available anyway.

True. I just did it because Eric had done it in ff57f14c [1].

> The bitbake error comes from tune-atom.inc:
> PACKAGE_EXTRA_ARCHS +=3D "x86 i386 i486 i586 i686"
> I removed the i696 there and it would work. I cant send a patch for this
> as I do not know whats the correct way to fix this problem.

I do not know that either. Maybe it is fixed in oe-core or meta-oe
somewhere because they build for x86 more often.


Thanks,

Paul

--=-TeBIaojP017o3QRLTGOT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk45RfIACgkQPX1aK2wOHVjuHgCfXFDZexujFJ0uSJ3qtI2udogq
BgAAn2hDKlUeZS5PB+e7XhyGpLCpFJyE
=/YHh
-----END PGP SIGNATURE-----

--=-TeBIaojP017o3QRLTGOT--

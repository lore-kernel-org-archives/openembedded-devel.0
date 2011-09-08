Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R1nZ1-0005ES-DN for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 00:59:19 +0200
Received: from f053034059.adsl.alicedsl.de ([78.53.34.59]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R1nUH-0003Fn-E4 for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 22:54:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 09 Sep 2011 00:54:14 +0200
In-Reply-To: <CAPhDKbGVg+ysR6L9EBHo8KopFCpE7R53YiU4Qaq7rfKH08OF=Q@mail.gmail.com>
References: <1315435137-5591-1-git-send-email-errordeveloper@gmail.com>
	<1315473897.17658.42.camel@mattotaupa>
	<CAPhDKbGVg+ysR6L9EBHo8KopFCpE7R53YiU4Qaq7rfKH08OF=Q@mail.gmail.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315522456.17658.174.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Thu, 08 Sep 2011 22:59:19 -0000
X-Groupsio-MsgNum: 34157
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-ZFjfRvgx6v4GppqKoShT"

--=-ZFjfRvgx6v4GppqKoShT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 08.09.2011, 23:33 +0100 schrieb Ilya Dmitrichenko:
> On 8 September 2011 10:24, Paul Menzel wrote:
> > thank you for your patch. Unfortunately we cannot apply it as is. Pleas=
e
> > read [1] for the reason.
> >
> > [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-Septem=
ber/034885.html
>=20
> The only work around that I see is to write a new bb recipe file for
> 2.20.1a, and update the old recipe with SRC_URI to point to a mirror
> which holds that old tarball.
> Please advise on how you usually would handle these issues, cause the
> above solution is not reliable either.

Please move/rename the recipe to 2.20.1a as done in the referenced link
and kind of in [1].

> I agree that it's a bit tricky, though if bitbake been told that 1.2.3
> and 1.2.3a are equivalents, it would be quite nice :) Of course
> different projects have their own versioning schemes, and
> often  it implies kaos, however I presume that gnu toolchain team has
> a very clear pattern and that could be relied upon and implemented in
> the .inc files.
> Something like VERSION_SUFFIX_IGNORE=3D$regex ...

Patches are welcome I guess. But you should check with the BitBake guys.


Thanks,

Paul


[1] http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df4faecdb=
d0b7c83e5787735ef1495a34aca861e4

--=-ZFjfRvgx6v4GppqKoShT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5pR5cACgkQPX1aK2wOHVhY8gCdGpnFB7Ozzn6w6dPTSYBhjfXh
z94AnivM0dXKo2oICuM182uAvftCpzPl
=Ro54
-----END PGP SIGNATURE-----

--=-ZFjfRvgx6v4GppqKoShT--

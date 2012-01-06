Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rj5Os-0006L2-A5 for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 09:43:48 +0100
Received: from f053040054.adsl.alicedsl.de ([78.53.40.54]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rj5Ht-0001U8-Iq; Fri, 06 Jan 2012 08:36:33 +0000
Message-ID: <1325838981.3742.155.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 06 Jan 2012 09:36:21 +0100
In-Reply-To: <1325767984.22038.4.camel@localhost.localdomain>
References: <1325767984.22038.4.camel@localhost.localdomain>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Cc: Philby John <pjohn@mvista.com>
Subject: Re: [PATCH] Fix typo in ctcs that causes build failure
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
X-List-Received-Date: Fri, 06 Jan 2012 08:43:48 -0000
X-Groupsio-MsgNum: 36390
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-L34nQ12mZwlbbalpj1G7"

--=-L34nQ12mZwlbbalpj1G7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Philby,


thank you for the patch.

Am Donnerstag, den 05.01.2012, 18:23 +0530 schrieb philby john:
> From: Philby John <pjohn@mvista.com>
> Date: Thu, 5 Jan 2012 18:01:11 +0530
> Subject: [PATCH] Fix typo in ctcs that causes build failure

Please adhere to the commit policy. Especially prefix the commit summary
with the package name.

> RDEPENDS includes a line perl-module-tcntl, which is
> clearly a typo for perl-module-fcntl, without which
> you get a build failure.

I see that this is an error and will push your improved patch. But I
tried `bitbake -k ctcs` with `angstrom-2010.x` for `MACHINE =3D
"beagleboard"` and it worked without problems. What command did you use
to get a build error and how does it look like? I guess it is in the
final image creation that the error occurs?

> Signed-off-by: Philby John <pjohn@mvista.com>
> ---
>  recipes/ctorrent/ctcs_1.4.1.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

[=E2=80=A6]


Thanks,

Paul


[1] http://www.openembedded.org/wiki/Commit_Policy

--=-L34nQ12mZwlbbalpj1G7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk8GsoYACgkQPX1aK2wOHVgxegCfW/+jCHDd8FKc4kKBoWPnPFDy
YJQAmgKv7vZ5UfkGvhHQfbC6HfEguQ8M
=k25G
-----END PGP SIGNATURE-----

--=-L34nQ12mZwlbbalpj1G7--

Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLOfr-0004PR-Uy for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 01:55:07 +0200
Received: from f053039080.adsl.alicedsl.de ([78.53.39.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLOeY-0006Xu-OL for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 23:53:46 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTikVtDGTO=04H8kkPdJLH2UtN9JR2A@mail.gmail.com>
References: <BANLkTikVtDGTO=04H8kkPdJLH2UtN9JR2A@mail.gmail.com>
Date: Sun, 15 May 2011 01:52:18 +0200
Message-ID: <1305417138.3876.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: patch for acpid-1.0.10, building for i586-generic on x86_64
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
X-List-Received-Date: Sat, 14 May 2011 23:55:08 -0000
X-Groupsio-MsgNum: 32028
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-BsvzRd5bfis9MsKuiTYk"

--=-BsvzRd5bfis9MsKuiTYk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


thank you for your patch.

Am Samstag, den 14.05.2011, 10:25 -0400 schrieb Christian Betz:
> acpid-1.0.10 fails building due to a compiler warning:
>=20
>  libnetlink.c:521:56: error: comparison between signed and unsigned
> integer expressions
>=20
> I noticed another user mentioning this issue not too long ago. I can't
> say whether the i586 machine type or x86_64 host is the issue, but the
> fix is easy: just add a missing cast.
>=20
> Christian
>=20
> ----
>=20
> This is a patch to a patch since the entire libnetlink.c file is part
> of the existing netlink.diff patch
>=20
> --- a/recipes/acpid/acpid-1.0.10/netlink.diff
> +++ b/recipes/acpid/acpid-1.0.10/netlink.diff
> @@ -2019,7 +2019,7 @@ diff -ruN acpid-1.0.10/libnetlink.c
> acpid-1.0.10-netlink2/libnetlink.c
>  +
>  +int addraw_l(struct nlmsghdr *n, int maxlen, const void *data, int len)
>  +{
> -+      if ((int)NLMSG_ALIGN(n->nlmsg_len) + NLMSG_ALIGN(len) > maxlen) {
> ++      if ((int)NLMSG_ALIGN(n->nlmsg_len) + (int)NLMSG_ALIGN(len) > maxl=
en) {
>  +              fprintf(stderr, "addraw_l ERROR: message exceeded bound o=
f %d\n",maxlen);
>  +              return -1;
>  +      }

Could you please resend the patch adhering to the commit policy, e. g.
your Signed-off-by line is missing, and formatted such away, that we can
use `git am` to apply it. You should use `git format-patch` and for
example `git send-email`.

If you have a little more time, could you figure out if those patches
have been sent upstream and if not send them upstream if needed. That
would be awesome.


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Policy

--=-BsvzRd5bfis9MsKuiTYk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3PFaQACgkQPX1aK2wOHVi6pgCggwv1sfwAxISeE1At7t+nmaIr
lmsAnj2VvqzoCIdrQeMFON7go/VIyTTX
=DYJh
-----END PGP SIGNATURE-----

--=-BsvzRd5bfis9MsKuiTYk--

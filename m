Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLYoJ-00074H-2s for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 12:44:31 +0200
Received: from f053043231.adsl.alicedsl.de ([78.53.43.231]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLYn0-0008LJ-FW for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 10:43:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305433012-13000-2-git-send-email-christian.betz@gmail.com>
References: <BANLkTikVtDGTO=04H8kkPdJLH2UtN9JR2A@mail.gmail.com>
	<1305433012-13000-2-git-send-email-christian.betz@gmail.com>
Date: Sun, 15 May 2011 12:41:40 +0200
Message-ID: <1305456100.5838.16.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] fix acpid compiler warning on some platforms
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
X-List-Received-Date: Sun, 15 May 2011 10:44:31 -0000
X-Groupsio-MsgNum: 32045
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7jeZjNGCqGApl4EYm12s"

--=-7jeZjNGCqGApl4EYm12s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


Am Sonntag, den 15.05.2011, 00:16 -0400 schrieb Christian Betz:

thank you for your fast response. Next time please also add the commit
message. The one you provided in your first message would have been
enough. You can even change/improve commit messages using `git commit
--amend` (or `git rebase =E2=80=A6`) before doing `git format-patch =E2=80=
=A6`.

I will add the commit message when applying your patch.

You also forgot your Signed-off-by line. Please reply to this message
with just that line since it is required by our commit policy.

Passing `-s` to `git commit` or `git format-patch` adds that line
automatically to  the commit message.

> ---
>  recipes/acpid/acpid-1.0.10/netlink.diff |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/acpid/acpid-1.0.10/netlink.diff b/recipes/acpid/acpi=
d-1.0.10/netlink.diff
> index 635c550..ebdec58 100644
> --- a/recipes/acpid/acpid-1.0.10/netlink.diff
> +++ b/recipes/acpid/acpid-1.0.10/netlink.diff
> @@ -2019,7 +2019,7 @@ diff -ruN acpid-1.0.10/libnetlink.c acpid-1.0.10-ne=
tlink2/libnetlink.c
>  +
>  +int addraw_l(struct nlmsghdr *n, int maxlen, const void *data, int len)
>  +{
> -+	if ((int)NLMSG_ALIGN(n->nlmsg_len) + NLMSG_ALIGN(len) > maxlen) {
> ++	if ((int)NLMSG_ALIGN(n->nlmsg_len) + (int)NLMSG_ALIGN(len) > maxlen) {
>  +		fprintf(stderr, "addraw_l ERROR: message exceeded bound of %d\n",maxl=
en);
>  +		return -1;
>  +	}


Thanks,

Paul

--=-7jeZjNGCqGApl4EYm12s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3PrdgACgkQPX1aK2wOHViE/gCeP2m94QcyDPnIgbeSK/G12Hyl
vzMAn2odQI1MwSuBldN7YGeaUW9iKeZ5
=xYjj
-----END PGP SIGNATURE-----

--=-7jeZjNGCqGApl4EYm12s--

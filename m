Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NCUZH-0003op-8z for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 09:46:46 +0100
Received: from f053035190.adsl.alicedsl.de ([78.53.35.190]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NCUY7-0003Uz-My for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 08:45:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258962999-5106-1-git-send-email-Ed.Swarthout@hwdebug.com>
References: <1258962999-5106-1-git-send-email-Ed.Swarthout@hwdebug.com>
Date: Mon, 23 Nov 2009 09:45:10 +0100
Message-ID: <1258965910.3189.2.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] x11vnc-0.9.8 fix xshm header
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
X-List-Received-Date: Mon, 23 Nov 2009 08:46:46 -0000
X-Groupsio-MsgNum: 14600
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/EYOkmITYvGwm7OQZ/UY"

--=-/EYOkmITYvGwm7OQZ/UY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 23.11.2009, 01:56 -0600 schrieb Ed Swarthout:

[=E2=80=A6]

> diff --git a/recipes/vnc/files/x11vnc-0.9.8-xshm-header-fix.patch b/recip=
es/vnc/files/x11vnc-0.9.8-xshm-header-fix.patch
> new file mode 100644
> index 0000000..3383f63
> --- /dev/null
> +++ b/recipes/vnc/files/x11vnc-0.9.8-xshm-header-fix.patch
> @@ -0,0 +1,15 @@
> +Looks like X_ShmAttach is considered private to the library and has been=
 removed from its headers.
> +Just hardcode the value, it's only usd to print some help in case of an =
shm attach error.

s/usd/used/


Thanks,

Paul

--=-/EYOkmITYvGwm7OQZ/UY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAksKS5AACgkQPX1aK2wOHVi6gQCeOX0mLFQQ/FXTqoecwtbNUqdT
qN0An2DdXT+6y1f5PGRM0fDhZ7cLnQp6
=GWrb
-----END PGP SIGNATURE-----

--=-/EYOkmITYvGwm7OQZ/UY--

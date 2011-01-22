Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pgf6A-0000Qj-A3 for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 16:09:54 +0100
Received: from f053037250.adsl.alicedsl.de ([78.53.37.250]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pgf5V-0000u6-9b for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 15:09:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1295708387-28440-1-git-send-email-a.sappia@gmail.com>
References: <1295708387-28440-1-git-send-email-a.sappia@gmail.com>
Date: Sat, 22 Jan 2011 16:09:11 +0100
Message-ID: <1295708951.3850.166.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] Corrected a typo in qtdemo-init script
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
X-List-Received-Date: Sat, 22 Jan 2011 15:09:54 -0000
X-Groupsio-MsgNum: 28310
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-LJ9p0eJQHVRpPd65QEys"

--=-LJ9p0eJQHVRpPd65QEys
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Alessandro,


Am Samstag, den 22.01.2011, 15:59 +0100 schrieb Alessandro Sappia:

please take a look at the commit policy regarding the commit
summary/message [1].

> Signed-off-by: Alessandro Sappia <a.sappia@gmail.com>
> ---
>  recipes/qt4/qt-demo-init/qtdemo-init |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/qt4/qt-demo-init/qtdemo-init b/recipes/qt4/qt-demo-i=
nit/qtdemo-init
> index ee84be2..affb958 100644
> --- a/recipes/qt4/qt-demo-init/qtdemo-init
> +++ b/recipes/qt4/qt-demo-init/qtdemo-init
> @@ -3,7 +3,7 @@
>  set -e
> =20
>  if [ -f /usr/bin/qtdemo ]; then
> -	QTDEMO=3D"qtdemo > /var/log/Xsession.log 2>&1"
> +	QTDEMO=3D"qtdemo > /var/log/Xsession.log 2> &1"

What is wrong with this? Errors are sent to standard output and the
version without space is the one I know too.

>  else
>  	QTDEMO=3D"qtdemoE -qws"
>  fi


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Policy

--=-LJ9p0eJQHVRpPd65QEys
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk068xcACgkQPX1aK2wOHVgx8QCdEnjIE9ojfN06urCWMGnF7LL2
LWkAn25uRGzLedK7EGeltIppD6iAzmlQ
=/WLf
-----END PGP SIGNATURE-----

--=-LJ9p0eJQHVRpPd65QEys--

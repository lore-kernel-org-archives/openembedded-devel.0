Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RK7es-0001aR-WA for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 14:05:07 +0200
Received: from g225082113.adsl.alicedsl.de ([92.225.82.113]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RK7ZH-0001wp-5A for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 11:59:19 +0000
Message-ID: <1319889545.3756.10.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 13:59:05 +0200
In-Reply-To: <941836c79ce4b08c62672c36c77f47d3a8b89b83.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<941836c79ce4b08c62672c36c77f47d3a8b89b83.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-efl][meta-oe 09/12] task-x11-server: import from Angstrom
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
X-List-Received-Date: Sat, 29 Oct 2011 12:05:07 -0000
X-Groupsio-MsgNum: 35063
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-QReyLZE5Os1+4oYQAFrd"

--=-QReyLZE5Os1+4oYQAFrd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Martin,


Am Samstag, den 29.10.2011, 12:29 +0200 schrieb Martin Jansa:
> * from meta-angstrom revision 8aa9581a920abae8878df2f3faf9857474edd1f8

I am not knowledgeable about the new infrastructure, so I cannot comment
on the import.

> * added RPROVIDES to be able to drop server part from task-x11
> * updated DESCRIPTION to match
> * renamed to task-x11-server for upgradeable path
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-core/tasks/task-x11-server_1.0.bb |   24 +++++++++++++++=
++++++
>  1 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
>=20
> diff --git a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb b/meta-oe/=
recipes-core/tasks/task-x11-server_1.0.bb
> new file mode 100644
> index 0000000..86de1ec
> --- /dev/null
> +++ b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "Task for a image with Xserver"

s/a image/an image/

> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
> +PR =3D "r9"
> +
> +inherit task
> +
> +# for backwards compatibility
> +RPROVIDES_${PN} =3D "task-x11-server"
> +
> +XSERVER ?=3D "xserver-xorg \
> +           xf86-input-evdev \
> +           xf86-input-mouse \
> +           xf86-video-fbdev \
> +           xf86-input-keyboard \
> +"
> +
> +
> +RDEPENDS_${PN} =3D " \
> +  ${XSERVER} \
> +"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +

No newline needed at the end?


Thanks,

Paul

--=-QReyLZE5Os1+4oYQAFrd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6r6okACgkQPX1aK2wOHVjdeACeKFQbnYqxqmQpK2fsntsvAPl4
O/gAn28RMwUWCmCJrQpKj25frsSmxT4w
=lbDv
-----END PGP SIGNATURE-----

--=-QReyLZE5Os1+4oYQAFrd--

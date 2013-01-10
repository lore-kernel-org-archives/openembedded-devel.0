Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtGOk-000281-No
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:34:16 +0100
Received: by mail-da0-f48.google.com with SMTP id k18so200986dae.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XzwsZ3nbcccqAjqUxE0aH8b3RMGdfUO1tnKgG2tT+Ck=;
	b=CGlKApVjHqWuZEi3SjEOSrurTyiNX8VCI18GYODsrGSxssuI+W98l/L40CYaH/AAtH
	SpS/BGLPY69/EG/VPCMYSI60/rKHShaYYP/LpPD3jQ5ygtiQSaN0TRG2NQzUGt+txQ/Y
	XSnJbvtVVZXPEHzeB5WjUVr61yNsJv4KME9/qGgW3zS9aHN2JiuQPWXnEEOPHUCUzuW+
	/Nn1XPkbVPnfIORi3gxriqRhIIZr43fzxyrhrRR88PBQB1OZDZOow9yDJKN4HUuQRgzq
	yKRDWSwD0cAYZTJgG6WaDXYwMuhheKoYDCl7UZbKYca62EWc46hZ5zX/RVGU2kECRoSI
	y3Eg==
X-Received: by 10.68.203.137 with SMTP id kq9mr215268434pbc.115.1357816740847; 
	Thu, 10 Jan 2013 03:19:00 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ho4sm650051pbc.54.2013.01.10.03.18.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 03:18:59 -0800 (PST)
Date: Thu, 10 Jan 2013 12:19:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130110111905.GY3722@jama.palm1.palmone.com>
References: <1357709614-12266-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1357709614-12266-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome][PATCH] obexd: Include unistd.h to get ssize_t definition
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
X-List-Received-Date: Thu, 10 Jan 2013 11:34:27 -0000
X-Groupsio-MsgNum: 42625
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fBT78PV5vI5fyuAn"
Content-Disposition: inline

--fBT78PV5vI5fyuAn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 08, 2013 at 09:33:34PM -0800, Khem Raj wrote:
> This error is exposed with eglibc 2.17

Merged, thanks!

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../obex/obexd/ssize_t_definition.patch            |   32 ++++++++++++++=
++++++
>  meta-gnome/recipes-connectivity/obex/obexd_0.44.bb |    6 ++--
>  2 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 meta-gnome/recipes-connectivity/obex/obexd/ssize_t_de=
finition.patch
>=20
> diff --git a/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definitio=
n.patch b/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.pat=
ch
> new file mode 100644
> index 0000000..2009dcd
> --- /dev/null
> +++ b/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch
> @@ -0,0 +1,32 @@
> +include unistd.h to get ssize_t definitions
> +
> +Fixes errors like
> +
> +| In file included from plugins/mas.c:36:0:
> +| ./src/obex.h:39:1: error: unknown type name 'ssize_t'
> +| ./src/obex.h:49:1: error: unknown type name 'ssize_t'
> +| ./src/obex.h:50:1: error: unknown type name 'ssize_t'
> +| In file included from plugins/mas.c:38:0:
> +| ./src/mimetype.h:36:2: error: expected specifier-qualifier-list before=
 'ssize_t'
> +| In file included from plugins/mas.c:39:0:
> +| plugins/filesystem.h:24:1: error: unknown type name 'ssize_t'
> +| plugins/mas.c:550:1: error: unknown type name 'ssize_t'
> +| plugins/mas.c:557:1: error: unknown type name 'ssize_t'
> +| plugins/mas.c: In function 'any_read':
> +| plugins/mas.c:560:2: error: unknown type name 'ssize_t'
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Index: obexd-0.44/plugins/mas.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- obexd-0.44.orig/plugins/mas.c	2012-01-11 14:53:53.000000000 -0800
> ++++ obexd-0.44/plugins/mas.c	2013-01-08 12:51:12.681882174 -0800
> +@@ -29,6 +29,7 @@
> + #include <glib.h>
> + #include <fcntl.h>
> + #include <inttypes.h>
> ++#include <unistd.h>
> +=20
> + #include "obexd.h"
> + #include "plugin.h"
> diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb b/meta-gn=
ome/recipes-connectivity/obex/obexd_0.44.bb
> index 77d7f1e..384ce05 100644
> --- a/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
> +++ b/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
> @@ -4,9 +4,11 @@ DEPENDS =3D "openobex glib-2.0 dbus bluez4 libical"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "files://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4=
ca7e"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
> -SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.g=
z"
> +SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.g=
z \
> +           file://ssize_t_definition.patch \
> +          "
>  SRC_URI[md5sum] =3D "3fb9cb9d7ab119753253ff784235a364"
>  SRC_URI[sha256sum] =3D "104fc50eb8bf41d690d31588c3a4829a75dc7738b1c76cf2=
60171d8f525da758"
> =20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fBT78PV5vI5fyuAn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDuo6kACgkQN1Ujt2V2gBzlRACfbHL/i9B4GUWeKq8plVbqvkG+
uuUAn0vWqjIpGUN32QbdB+cI5uz9ERAr
=7QTX
-----END PGP SIGNATURE-----

--fBT78PV5vI5fyuAn--

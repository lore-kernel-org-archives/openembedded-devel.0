Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SjvEU-0004jU-Rj
	for openembedded-devel@openembedded.org; Wed, 27 Jun 2012 18:36:46 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id D09BDEA040;
	Wed, 27 Jun 2012 18:32:34 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 460A0604DE; Wed, 27 Jun 2012 18:25:52 +0200 (CEST)
Date: Wed, 27 Jun 2012 18:25:52 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Message-ID: <20120627162551.GB25892@hermes>
References: <1340055995-14534-1-git-send-email-apelete@seketeli.net>
	<1340055995-14534-3-git-send-email-apelete@seketeli.net>
	<20120619203738.GD4845@hermes> <20120619204030.GE4845@hermes>
	<20120619204305.GF4845@hermes>
MIME-Version: 1.0
In-Reply-To: <20120619204305.GF4845@hermes>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [oe-classic][udev][PATCH v2 2/2] udev: Update attr recipe SRC_URI
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
X-List-Received-Date: Wed, 27 Jun 2012 16:36:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Le 19-Jun-12, Apelete Seketeli a =E9crit:
> This updates the attr recipe SRC_URI since mirror.its.uidaho.edu seems
> to be down.
> Fetch attr package from download.savannah.gnu.org from now on.
>=20
> Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> ---
>  recipes/udev/attr_2.4.44.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes/udev/attr_2.4.44.bb b/recipes/udev/attr_2.4.44.bb
> index 00aafce..1b95c58 100644
> --- a/recipes/udev/attr_2.4.44.bb
> +++ b/recipes/udev/attr_2.4.44.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "GPLv2"
> =20
>  PR =3D "r4"
> =20
> -SRC_URI =3D "http://mirror.its.uidaho.edu/pub/savannah/attr/attr-${PV}=
.src.tar.gz"
> +SRC_URI =3D "http://download.savannah.gnu.org/releases/attr/attr-${PV}=
.src.tar.gz"
> =20
>  inherit gettext autotools lib_package
>  EXTRA_OECONF =3D " --enable-gettext=3Dyes \
> --=20
> 1.7.10

I need those two patches for attr and acl in order to build
muffinman-image in oe-classic (it does not build anymore in its
current state). Can someone please review those patches ?

Cheers.
--=20
        Apelete



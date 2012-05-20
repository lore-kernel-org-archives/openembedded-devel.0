Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SWCc9-0004gs-By
	for openembedded-devel@openembedded.org; Sun, 20 May 2012 22:20:29 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 76121EA040;
	Sun, 20 May 2012 22:21:56 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id E9C6464387; Sun, 20 May 2012 22:10:22 +0200 (CEST)
Date: Sun, 20 May 2012 22:10:22 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Message-ID: <20120520201022.GQ19142@hermes>
MIME-Version: 1.0
In-Reply-To: <1337032989-28606-2-git-send-email-apelete@seketeli.net>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [PATCH 1/1] util-linux-ng: Update SRC_URI to kernel.org valid URI
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
X-List-Received-Date: Sun, 20 May 2012 20:20:29 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Le 15-May-12, Apelete Seketeli a =E9crit:
> This updates SRC_URI as the former kernel.org URI was no longer valid.
>=20
> Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> ---
>  recipes/util-linux-ng/util-linux-ng.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-lin=
ux-ng/util-linux-ng.inc
> index 9c2a5da..7d5faf0 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -11,7 +11,7 @@ INC_PR =3D "r36"
>  # allows for a release candidate
>  RC ?=3D ""
> =20
> -SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${PV}/=
util-linux-ng-${PV}${RC}.tar.bz2;name=3Darchive"
> +SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/utils/util-linux/v${PV}/uti=
l-linux-ng-${PV}${RC}.tar.bz2;name=3Darchive"
> =20
>  SRC_URI_append_chinook-compat =3D " file://chinook_libtool.patch "
> =20
> --=20
> 1.7.9.5
>=20

I need util-linux-ng to build muffinman-image in oe-classic, can
someone please review this patch ?
Kristoffer, you can get it from here if needed:

http://patchwork.openembedded.org/patch/27737/

Regards.
--=20
        Apelete



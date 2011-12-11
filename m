Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RZfpz-00011h-8X
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Dec 2011 10:36:51 +0100
Received: by eekb15 with SMTP id b15so2141456eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Dec 2011 01:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c44Lrv4oGuHOCQBclPu0/eMchqR133ANR6StXopq6fw=;
	b=gsdS7Da7EThD0Y6BjvWaarwpUJrSc16L0PZI0SVlcUKRxILjYgiWisglVu0ePIZaJt
	nPykH5D5pHkb/BhZNZ5NmJFS/WDp6+XcoO5JoGrM3dkWqOoLZEnF9AbWLGvJopvcNOdj
	fMTCstoYzm3c4TBsdcgPg+DKuIlGYW8CXmGfo=
Received: by 10.14.7.73 with SMTP id 49mr1909948eeo.81.1323595795363;
	Sun, 11 Dec 2011 01:29:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm58321352eeh.5.2011.12.11.01.29.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 11 Dec 2011 01:29:53 -0800 (PST)
Date: Sun, 11 Dec 2011 10:29:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111211092940.GD3986@jama.jama.net>
References: <1323360390-12622-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1323360390-12622-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH] zaurus.inc: adapt jffs2 and sum.jffs2 to changes in oe-core
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
X-List-Received-Date: Sun, 11 Dec 2011 09:36:52 -0000
X-Groupsio-MsgNum: 36029
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline

--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 08, 2011 at 05:06:30PM +0100, Andrea Adami wrote:
> * in oe-core jffs2 summary has been added to image_types.bbclass and
> * IMAGE_CMD_jffs2 now includes '-n' to skip cleanmarkers node creation
> * so we need to customize only padding, endianness and compression mode
> * While there remove compression settings which are handled in kernel.
> * This allows us to use the same string for mkfs.jffs2 and for sumtool.
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  conf/machine/include/zaurus.inc |   13 +++----------
>  1 files changed, 3 insertions(+), 10 deletions(-)
>=20
> diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zauru=
s.inc
> index b488f37..0a9b1c5 100644
> --- a/conf/machine/include/zaurus.inc
> +++ b/conf/machine/include/zaurus.inc
> @@ -9,18 +9,11 @@ ERASEBLOCKSIZE_akita =3D "0x20000"
>  # C3100 and C3200 have same 128MiB NAND device as akita
>  ERASEBLOCKSIZE_spitz =3D "0x20000"
> =20
> -IMAGE_FSTYPES +=3D "jffs2 tar.gz"
> +IMAGE_FSTYPES +=3D "tar.gz jffs2 sum.jffs2"

Do you really need jffs2 if there is sum.jffs2? IMAGE_CMD_sum.jffs2
produces both now, doesn't it?

IIRC there was discussion about using +=3D IMAGE_FSTYPES, I don't remember
the result, but can we use ?=3D here? Just to make easier for someone to
limit images in local.conf ie just
IMAGE_FSTYPES =3D "tar.gz"


>  # kernel now supports favourlzo
> -IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime -m f=
avourlzo \
> -                   --output=3D${T}/${IMAGE_NAME}.rootfs.jffs2 --pad --li=
ttle-endian --eraseblock=3D${ERASEBLOCKSIZE} -n \
> -                   && sumtool -i ${T}/${IMAGE_NAME}.rootfs.jffs2 \
> -                   -o ${T}/${IMAGE_NAME}.rootfs.jffs2.summary \
> -                   --eraseblock=3D${ERASEBLOCKSIZE} -l -p; \
> -                   cat ${T}/${IMAGE_NAME}.rootfs.jffs2 > ${DEPLOY_DIR_IM=
AGE}/${IMAGE_NAME}.rootfs.jffs2; \
> -                   rm ${T}/${IMAGE_NAME}.rootfs.jffs2; \
> -                   cat ${T}/${IMAGE_NAME}.rootfs.jffs2.summary > ${DEPLO=
Y_DIR_IMAGE}/${IMAGE_NAME}.rootfs.summary.jffs2; \
> -                   rm ${T}/${IMAGE_NAME}.rootfs.jffs2.summary;"
> +EXTRA_IMAGECMD_jffs2 =3D "-p -l --eraseblock=3D${ERASEBLOCKSIZE}"
> +EXTRA_IMAGECMD_sum.jffs2 =3D "${EXTRA_IMAGECMD_jffs2}"
> =20
>  EXTRA_IMAGEDEPENDS +=3D "zaurus-installer"
> =20
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7keAQACgkQN1Ujt2V2gBzvGwCglz2Xx/kecSOymwZV1rJn++sF
V5sAoJ1jnaYjfHb3ddzIk1MD8LLkS70T
=rQ1s
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--

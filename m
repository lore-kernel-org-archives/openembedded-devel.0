Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id B9F5173CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 10:07:54 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so20883958wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 03:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=14QTewu0XthvyWhmaglsrptqcgnoIL9YDGUy23sfrBQ=;
	b=b04Pbv4f94EQX29jKWDJXb5skCIzvW1ThhMkKMRUXddusEHAyC/RL+b9i6lAMkrtmm
	n0iE2oSmz8n3XiQpCFmk0CccU2tGfyj7gumlfJ08QGDj3S1wZkqH5PDInc51v+FDAmQi
	OnSmrK22MNi2Cn8fl6zUA9syjyH81CdhXjbizMH5ATPff1aCsih8QT1qHE6ai2DinSfK
	tYv/hEJ7vVCwD2/uPHt4/sizx6NkNLZYKMUxKQXnHlBJO/N9MINqSttSvGondTdQdTEj
	SJ8JqHOzruoRQ0Tqh86QoW1id/eZvBTxtz2o2w36vt7MA3BPCmsyFpgBhXFA84VX94B6
	DkGA==
X-Received: by 10.180.76.177 with SMTP id l17mr3075805wiw.16.1444298874280;
	Thu, 08 Oct 2015 03:07:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id z2sm6558277wij.1.2015.10.08.03.07.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 03:07:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 12:08:05 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151008100805.GD2385@jama>
References: <1443597600-29477-1-git-send-email-adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <1443597600-29477-1-git-send-email-adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] meta-oe: recipes-graphics: add libvncserver recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2015 10:07:55 -0000
X-Groupsio-MsgNum: 57730
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline

--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 10:20:00AM +0300, Ioan-Adrian Ratiu wrote:
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../libvncserver/libvncserver_0.9.10.bb              | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_0.=
9.10.bb
>=20
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb=
 b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
> new file mode 100644
> index 0000000..841506a
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "library for easy implementation of a RDP/VNC server"
> +HOMEPAGE =3D "https://libvnc.github.io"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D361b6b837cad26c6900a926b62aad=
a5f"
> +
> +DEPENDS +=3D "zlib jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
> +RDEPENDS_${PN} +=3D "libpng gtk+ libgcrypt"

It conflicts with x11vnc:
http://errors.yoctoproject.org/Errors/Details/20233/

> +
> +inherit autotools pkgconfig
> +
> +SRC_URI  =3D "https://github.com/LibVNC/libvncserver/archive/LibVNCServe=
r-0.9.10.tar.gz"

github archives don't have stable SRC_URI checksums, because they can be
re-generated from time to time, use git directly.

> +SRC_URI[md5sum] =3D "e1b888fae717b06896f8aec100163d27"
> +SRC_URI[sha256sum] =3D "ed10819a5bfbf269969f97f075939cc38273cc1b6d28bccf=
b0999fba489411f7"
> +
> +S =3D "${WORKDIR}/${PN}-LibVNCServer-${PV}"
> +
> +EXTRA_OEMAKE_append=3D" SUBDIRS=3D'libvncserver' "
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWQIQACgkQN1Ujt2V2gBzlMwCfYR6+PfmmJfeAo/WOUN+pMT2A
vVEAn2i1DiUrseMtByZnLBciy2z+itjx
=cOAm
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--

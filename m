Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id C8AC67054B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 14:03:30 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id n12so958926wgh.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 07:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Crfoa8e+2uUCuwVlzVDo1N/O82jUUkDFAf/IjS0PTvc=;
	b=SOUPJ2W4KXDtNKueNmafxMJiLKH4OmI0ArFp9OSj0MKTrWBFnJlx5Z8FSY8sQwUoLx
	y+n9yI2a4g2mjcFQzfjSwmd/WRIbjmbjKNsKh49bkVFJ8wR+8pcN5vJTSFjY6s31kd8T
	Ggir0q8j//Cv2VvGBoyo/cv/6cgzFS5II6B3PGjgR4QnS15bq90VL+9cLi7wXWioRiPJ
	QzzEPzldMoZx20/6HsFPGHN0iGoY9llBBczbAVCs5UgoYu3815xCt+xUoJ+bR6o8nDC1
	6quhHc5WVTtIp33YIEYiVmbm82lOosJFYtzrJbUqGidRIm7Oy8DzP071RtQ5KzdBgwux
	EGYg==
X-Received: by 10.181.11.232 with SMTP id el8mr14185283wid.57.1405519411269;
	Wed, 16 Jul 2014 07:03:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cx5sm39992866wjb.8.2014.07.16.07.03.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 07:03:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 16:03:41 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716140341.GC2433@jama>
References: <1405058909-12162-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1405058909-12162-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 2/3][meta-perl] libxml-filter-buffertext-perl: add recipe
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
X-List-Received-Date: Wed, 16 Jul 2014 14:03:33 -0000
X-Groupsio-MsgNum: 51005
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D402Py2zjJjzbYTp"
Content-Disposition: inline

--D402Py2zjJjzbYTp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2014 at 02:08:29PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../libxml/libxml-filter-buffertext-perl_1.01.bb   |   27 ++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libxml/libxml-filter-buffertex=
t-perl_1.01.bb
>=20
> diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_=
1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.=
bb
> new file mode 100644
> index 0000000..0fbeeb5
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "XML::Filter::BufferText - Filter to put all characters() in=
 one event"
> +DESCRIPTION =3D "\
> +The XML::Filter::BufferText module is a very simple filter.  One common \
> +cause of grief (and programmer error) is that XML parsers aren't require=
d \
> +to provide character events in one chunk.  They can, but are not forced \
> +to, and most don't.  This filter does the trivial but oft-repeated task \
> +of putting all characters into a single event. \
> +"
> +SECTION =3D "libs"
> +LICENSE =3D "Artistic-1.0 | GPLv1+"
> +HOMEPAGE =3D "http://search.cpan.org/dist/XML-Filter-BufferText/"
> +DEPENDS +=3D "libxml-sax-perl-native"
> +RDEPENDS_${PN} +=3D "libxml-sax-perl"
> +
> +SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RB/RBERJON/XML-Fil=
ter-BufferText-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "2992c0387632583b966ab9c965b25512"
> +SRC_URI[sha256sum] =3D "8fd2126d3beec554df852919f4739e689202cbba6a17506e=
9b66ea165841a75c"
> +
> +LIC_FILES_CHKSUM =3D "file://BufferText.pm;beginline=3D88;endline=3D90;m=
d5=3D497aa6d79cc84c3d769a2a0016bee928"
> +
> +S =3D "${WORKDIR}/XML-Filter-BufferText-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND =3D "native"
> +
> +PACKAGE_ARCH =3D "all"

This doesn't seem right, see
http://lists.openembedded.org/pipermail/openembedded-core/2014-July/094409.=
html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--D402Py2zjJjzbYTp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGhj0ACgkQN1Ujt2V2gBwKnwCgl2nDQr8o3dpTZFPcQx9yjGrv
r40AoJBiilAVve4O7QX5XU8qiXxp/5eK
=49uj
-----END PGP SIGNATURE-----

--D402Py2zjJjzbYTp--

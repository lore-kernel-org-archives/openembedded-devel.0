Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id C0B3C65FE5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 11:14:20 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so2579401wes.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 04:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CLxNoFvbhPhUq6ri/SpFeqgaEq3s/C8pTVpR/VtKQBA=;
	b=haWPhzVh0+lDjCsT9GC5L2nizuysujEUgzF6StqHhlBSFov+Yy8m7jzN9Kf0EkqPpQ
	+4qGuUTzwIkYrP2FWtZtsLLNjlkyhnJMOJXQ1DaSLD4uIxgA1lu6MeFstLT1rfqj4frG
	Xx3kwyaZ53LpWwOneDWYX+SD/kq51oWBgBFVY60uuAkG9TpCYt/4CEyT2zLOqfTU75og
	LPt6R+xJ7xMYqgJZF5pYgoeOeOVtp+3gEmdTwfDe6UpPpS3/fLbrFmHQpSLr+vBBnJB+
	L21tu2l24Gv9Sy11LLW704S4jcW8cwjfGP9Om/8IMEUMpy6itfMd3S4jh+QuZwTUHqH5
	KBWg==
X-Received: by 10.194.63.228 with SMTP id j4mr11338080wjs.7.1406200461557;
	Thu, 24 Jul 2014 04:14:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm14997824wjx.26.2014.07.24.04.14.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 04:14:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Jul 2014 13:14:38 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140724111438.GI2492@jama>
References: <1406012813-21233-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1406012813-21233-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH v2][meta-perl] libxml-sax-writer-perl: add recipe
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
X-List-Received-Date: Thu, 24 Jul 2014 11:14:22 -0000
X-Groupsio-MsgNum: 51229
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g4MvFqI7wmANiPDo"
Content-Disposition: inline

--g4MvFqI7wmANiPDo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2014 at 03:06:53PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>

Sorry, but it still isn't correct even with allarch, because there is
dependency on TUNE_PKGARCH perl:

ERROR: libxml-filter-buffertext-perl different signature for task do_config=
ure.sigdata between qemux86copy and qemuarm
Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed from a58=
27c8deafb0ace555794c62c44e19f to 1a07f7ac7ad2a2750b58dfa60136114b

ERROR: libxml-sax-writer-perl different signature for task do_configure.sig=
data between qemux86copy and qemuarm
Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed from a58=
27c8deafb0ace555794c62c44e19f to 1a07f7ac7ad2a2750b58dfa60136114b

> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../libxml/libxml-sax-writer-perl_0.54.bb          |   25 ++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_=
0.54.bb
>=20
> diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb=
 b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
> new file mode 100644
> index 0000000..52458e4
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "XML::SAX::Writer - SAX2 Writer"
> +DESCRIPTION =3D "\
> +XML::SAX::Writer helps to serialize SAX2 representations of XML document=
s to \
> +strings, files, and other flat representations. It handles charset encod=
ings, \
> +XML escaping conventions, and so forth. It is still considered alpha, \
> +although it has been put to limited use in settings such as XML::LibXML =
and \
> +the AxKit XML Application Server. \
> +"
> +SECTION =3D "libs"
> +LICENSE =3D "Artistic-1.0 | GPLv1+"
> +HOMEPAGE =3D "http://search.cpan.org/dist/XML-SAX-Writer/"
> +DEPENDS +=3D "libxml-filter-buffertext-perl-native"
> +RDEPENDS_${PN} +=3D "libxml-filter-buffertext-perl"
> +
> +SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-SA=
X-Writer-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "383139d76418a82b9800dc4f8b568891"
> +SRC_URI[sha256sum] =3D "a1b4d959aed8f8337523c4cef4b431e56e619c795dc6f99a=
868548952101cf3d"
> +
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D45;endline=3D46;md5=3Dd4=
1d8cd98f00b204e9800998ecf8427e"
> +
> +S =3D "${WORKDIR}/XML-SAX-Writer-${PV}"
> +
> +inherit cpan allarch
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g4MvFqI7wmANiPDo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPQ6p4ACgkQN1Ujt2V2gBwmvwCgs3l742NVPh4ZXRCVF2RvB61c
1ssAn1Dm/Sc9SKenoblgCinOFfTA/gHY
=vf8+
-----END PGP SIGNATURE-----

--g4MvFqI7wmANiPDo--

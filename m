Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id E31BA65CFE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:26:27 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so2892410eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YYSVvkas1piu3Cyn5HFJWDQNMGExZZxS5g8GwEove0U=;
	b=fVtasgcf4pOA8dvODLgLXUJak8aTjGsjc/KMvYxK2vWhDFzlfqBmpgcRTbrB/pU6Er
	rGheZ9z7vUgBrAkqSmUBkRORhGpCeYNjBCMgUjjGqS900N7wKz4PVjfmt+ESoWj6dW4C
	jLtFqqunXp+bZA3yEdFxb8NfQ1EfCUxeGWKVUxymBsot++vhzsStxLsu5V8fzTFXD/KA
	PW9kIfzs1fUqQpBKqUoWDsz3BUKQWpKWXW1YcwFIXKOGy2Fz4BG5B9SehOHvYRnTY/6t
	XqWo73nAdb01Wmd3FMDbYbms/VgJ+Anl+soWjlcUKaUdt/Wed+FNWDY031FsfiUKs011
	zjgA==
X-Received: by 10.14.218.193 with SMTP id k41mr37233990eep.16.1397985988027;
	Sun, 20 Apr 2014 02:26:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u1sm92994875eex.31.2014.04.20.02.26.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:26:27 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:26:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420092632.GE2486@jama>
References: <1397028897-4991-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397028897-4991-1-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] swig: add native wrapper for SWIGLIB
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
X-List-Received-Date: Sun, 20 Apr 2014 09:26:31 -0000
X-Groupsio-MsgNum: 49312
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YCGSkTKVt49j0xAo"
Content-Disposition: inline

--YCGSkTKVt49j0xAo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 03:34:57PM +0800, Kai Kang wrote:
> Native swig will read data from hard-coded SWIGLIB or the same
> environment variable.
>=20
> While using sstate, the hard-coded SWIGLIB will point to the project
> that create original sstates. This would cause build issues, so add
> a wrapper to set the environment variable SWIGLIB to a relative path
> on current sysroot.

Merged, thanks!

>=20
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-devtools/swig/swig.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-dev=
tools/swig/swig.inc
> index 8e83526..96cd02a 100644
> --- a/meta-oe/recipes-devtools/swig/swig.inc
> +++ b/meta-oe/recipes-devtools/swig/swig.inc
> @@ -50,3 +50,10 @@ do_configure() {
>      oe_runconf
>  }
> =20
> +def swiglib_relpath(d):
> +    swiglib =3D d.getVar('datadir', True) + "/" + d.getVar('BPN', True) =
+ "/" + d.getVar('PV', True)
> +    return os.path.relpath(swiglib, d.getVar('bindir', True))
> +
> +do_install_append_class-native() {
> +       create_wrapper ${D}${bindir}/swig SWIG_LIB=3D'`dirname $''realpat=
h`'/${@swiglib_relpath(d)}
> +}
> --=20
> 1.8.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YCGSkTKVt49j0xAo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTksgACgkQN1Ujt2V2gByjuQCguJN8CK9xveKzoF4nCbYilalV
BvIAoLQLxvgrnFebvTuwd9R6UlCVhJaq
=KVXs
-----END PGP SIGNATURE-----

--YCGSkTKVt49j0xAo--

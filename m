Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7128F65D19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 08:39:45 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2776730eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Sdq6FcP/yTFP1j3P9/Xqwesc0JDGd7x2RzpgHdvHpnY=;
	b=FuQ9BJ0a/WhbSwn89A0eqPG/PsZ27+eSXa2Av/HA0B4EF0RvNPYhbIwyamOPObnI1x
	IMjF3j6AGvli56B0BiUU133UvmKMVW+MUzW6JTufBfa3U0ZyhfyxMpqLqbKb79gDVlp6
	oCSRGsF1ISPWEIdsSRAZXbI+kfu5y7n1UV2m1IRw2cn5aa9TuZg7Hx56mEfl2V8qxrQb
	UrMLt1+RDaZ0Makd1eaaGna3xIh86seyUOPiPvqHudUzjXGMJj6GRZojTHUund+QC2D8
	QchldHEknkuVG59VaXyGPMDHQmzz2c6/EloUs8psb61kcLk83ocvVvhzSGOhdxZRtefG
	NmjA==
X-Received: by 10.15.51.141 with SMTP id n13mr19427826eew.17.1397119186847;
	Thu, 10 Apr 2014 01:39:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm8256236eeu.23.2014.04.10.01.39.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 01:39:45 -0700 (PDT)
Date: Thu, 10 Apr 2014 10:39:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140410083953.GP2132@jama>
References: <1397028897-4991-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397028897-4991-1-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
X-List-Received-Date: Thu, 10 Apr 2014 08:39:50 -0000
X-Groupsio-MsgNum: 49156
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A7FgPGrDEcSmmdo/"
Content-Disposition: inline

--A7FgPGrDEcSmmdo/
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

This should use 4 spaces for indentation, but I'll fix it while
cherry-picking =3D> no need to resend.

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

--A7FgPGrDEcSmmdo/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNGWNkACgkQN1Ujt2V2gBzCNACgpimmQgcXcfG08AWgXaYFbOzK
eakAn2gv/S4hrH5DQYi83nPmrJrKwGJS
=BD8d
-----END PGP SIGNATURE-----

--A7FgPGrDEcSmmdo/--

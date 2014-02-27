Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1806EFCB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:58:44 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id b10so728974eae.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 01:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OQBE38ufui77rKfoO0l8fFvVmgJZQbS7f5AYNi59mRg=;
	b=BDRYTI8FnDc6aNJ3iSjEqgTEV7eeMRHVkzZaQjNKKGZ/3McWAmPFkC3OWB587Tkh0J
	Qh/lUc92yfPbLDLMiPyAfOA249pqmUoy8Juad57TZ8g9YDGxzrGgfjezmFnJEFgnurWB
	FfXIyI2Lc9b4WSqSVLVe4CbztTw9PKGU4Bmc6CaAo/46p+pd9V/R36QtkCr1IMq+3prU
	lupbGAo3M2KUfCAseUvgD5rotr4y0zFbiXqDXQ3dEJNmXkO2H0QBbZs9vP9bmg/UONyJ
	cgv1QYEIfoVF85CZNncru0QLCu9qIujS81r42B14D1yDpgFRwF4clQ4hmabh9KpWZxRv
	lhDQ==
X-Received: by 10.14.88.131 with SMTP id a3mr12750137eef.64.1393495125285;
	Thu, 27 Feb 2014 01:58:45 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm14863078eep.11.2014.02.27.01.58.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 01:58:44 -0800 (PST)
Date: Thu, 27 Feb 2014 10:58:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140227095844.GZ26981@jama>
References: <1393456501-30516-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393456501-30516-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH 1/2] ode: Explicitly disable double-precision with PACKAGECONFIG
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
X-List-Received-Date: Thu, 27 Feb 2014 09:58:47 -0000
X-Groupsio-MsgNum: 48397
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pIpim1HsfXagChBe"
Content-Disposition: inline

--pIpim1HsfXagChBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2014 at 12:15:00AM +0100, Martin Jansa wrote:
> * when it's left for autodetection, configure fails for qemux86* when
>    =3D=3D  and configure calls AC_TRY_RUN

Missing "$build_os" =3D=3D "$target_os" added in master-next branch.

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/ode/ode_0.9.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/ode/ode_0.9.bb b/meta-oe/recipes-sup=
port/ode/ode_0.9.bb
> index 1f3a5ca..8b9955e 100644
> --- a/meta-oe/recipes-support/ode/ode_0.9.bb
> +++ b/meta-oe/recipes-support/ode/ode_0.9.bb
> @@ -22,3 +22,7 @@ do_configure_append() {
> =20
>  FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> =20
> +PACKAGECONFIG ?=3D ""
> +# if it isn't explicitly selected and "$build_os" =3D=3D "$target_os", t=
hen configure will run
> +# series of AC_TRY_RUN which won't work for cross-compilation and config=
ure fails
> +PACKAGECONFIG[double-precision] =3D "--enable-double-precision,--disable=
-double-precision"
> --=20
> 1.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pIpim1HsfXagChBe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMPDFQACgkQN1Ujt2V2gBzEmwCeI+3alSnFIQcP/5JbYqN7Tpfs
BIkAniW2SKb++4WmfEfX1NNm1+wxqj+A
=/t8f
-----END PGP SIGNATURE-----

--pIpim1HsfXagChBe--

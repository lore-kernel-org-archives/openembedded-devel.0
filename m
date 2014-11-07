Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id EC54271F4E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 14:18:01 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id n12so3832055wgh.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Nov 2014 06:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tM6HjDAFynFaHpvwk6icZ9Wpe8X0kbBHMIaiFlY+zuI=;
	b=W/wXjEDEongPcCz25ABTGuzmwhbGLNyxfL1W+stNLe9ZyUmSOqPDx8hiDk3ahJCB3k
	xlp4xJUG0SLGiQd6Peqi50f/mvJpKTx5VMBnIPA0a/ETDfLkP8/wo0y4yy+/EZAqwpos
	92O6eSyN4I4vu1spxD2/W7CQOiGP/ZgkZouIQRHh2kqFP0hPx2Zkcvy1s525U87eFuo4
	K3bjhcIcWjrr/B5tXkfM9JMu4Oq4U9NlKsc8myAkimkeFIlpfvbvehhsN0THvv14VjZ2
	OgKEjgg6Eisgv+y+6nW0790efQ156+388wjgdRHxUIcRiDCINNQDTDTGiumDd1CyC4i/
	1+3A==
X-Received: by 10.180.109.17 with SMTP id ho17mr5507415wib.4.1415369881485;
	Fri, 07 Nov 2014 06:18:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hk9sm11933347wjb.46.2014.11.07.06.18.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Nov 2014 06:18:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 7 Nov 2014 15:18:06 +0100
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20141107141806.GA2444@jama>
References: <cover.1415347548.git.hongxu.jia@windriver.com>
	<47eeb76160e122e9545f8ce4831d91653a6f238e.1415347548.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <47eeb76160e122e9545f8ce4831d91653a6f238e.1415347548.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] curlpp: use libcurlpp as curlpp's provider
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
X-List-Received-Date: Fri, 07 Nov 2014 14:18:04 -0000
X-Groupsio-MsgNum: 52768
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 04:08:06PM +0800, Hongxu Jia wrote:
> The package curlpp does not exist, so we use libcurlpp as the provider.
> It avoids the do_rootfs failure while IMAGE_INSTALL +=3D "curlpp"

Why don't you fix your IMAGE_INSTALL instead?

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/met=
a-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> index 48f5178..3134335 100644
> --- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> +++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> @@ -74,6 +74,7 @@ pkg_postinst_${PN}() {
>  }
> =20
>  PACKAGES =3D+ "libcurlpp libcurlpp-dev libcurlpp-staticdev"
> +RPROVIDES_lib${BPN} =3D "${PN}"
> =20
>  FILES_lib${BPN} =3D "${libdir}/lib*.so.* \
>  		"
> --=20
> 1.9.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRc1J4ACgkQN1Ujt2V2gBzCJQCeI90ZGVh4fIg5tFxy/uLIx39l
18IAn3H5JSXVIer8GOioR4wkzmR/hJFr
=KviX
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--

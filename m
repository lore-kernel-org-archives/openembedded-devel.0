Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5061776E70
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 15:57:36 +0000 (UTC)
Received: by wijp11 with SMTP id p11so54409044wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tyuQ6WuhOShBOOsievR+d4IuuHKhDxW0UcjVqLgQkGc=;
	b=Y3kVZRRDfzZecf1beaUIxkbVIsN+fKL004mLH7NjNf1F/QdxtMQmFPqdos2FVH+d/x
	NyXMLknhnsJmAXjq22TlVyl7bAVA3tq8SmqtFdHqZo0aSXjdN3RDkSgALE9VqzT392nz
	HEs1xNqDR3AR+n/O91IGELJqdJVsNpRWBQRZYaiN5YA2b0bT1nee8vFclUke31fzODLK
	ypeTQfnSOE3gxNTcYsZ8k4y48hIZMxY942mAoPhW4v1fiP2Yg4WQ3aFCDyCilmYKpN2o
	YmV1BSc0VgUNgc6z+31r6sH/cyBP0MbVkp1NHTBTkW/1VoJtlFH+HAh3VA8CEkjbPVwk
	Pczw==
X-Received: by 10.180.198.233 with SMTP id jf9mr23503349wic.66.1445356656370; 
	Tue, 20 Oct 2015 08:57:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a9sm19890640wiy.11.2015.10.20.08.57.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Oct 2015 08:57:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Oct 2015 17:57:49 +0200
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20151020155749.GB2557@jama>
References: <1444704238-7057-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1444704238-7057-1-git-send-email-Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/4] rrdtool: fix useless-rpath QA issue
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
X-List-Received-Date: Tue, 20 Oct 2015 15:57:39 -0000
X-Groupsio-MsgNum: 57928
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline

--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 10:43:55AM +0800, Chen Qi wrote:
> When building rrdtool, we would meet the following error.

Now it fails for qemuarm and qemux86, not sure which change is causing
that:

http://errors.yoctoproject.org/Errors/Details/20597/
http://errors.yoctoproject.org/Errors/Details/20601/

>=20
>   ERROR: QA Issue: rrdtool-python: work/core2-64-poky-linux/rrdtool
>   /1.5.4-r0/packages-split/rrdtool-python/usr/lib/python2.7/site-packages
>   /rrdtool.so contains probably-redundant RPATH /usr/lib [useless-rpaths]
>=20
> Fix this issue by removing the redundante RPATH section from rrdtool.so.
>=20
> As we use '--disable-rpath' in EXTRA_OECONF, we don't need to the `sed'
> line in do_configure.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/=
recipes-extended/rrdtool/rrdtool_1.5.4.bb
> index 91a30cf..f2ded65 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
> @@ -71,7 +71,6 @@ do_configure() {
>      PYTHON_INCLUDES=3D"-I=3D/usr/include/python${PYTHON_BASEVERSION}"' \
>          ${S}/m4/acinclude.m4
>      #remove the hardcoded $(libdir) rpath
> -    sed -i -e 's|--rpath=3D$(libdir)||g' ${S}/bindings/Makefile.am
> =20
>      autotools_do_configure
> =20
> @@ -100,6 +99,11 @@ do_configure() {
>          ${B}/examples/*.pl
>  }
> =20
> +do_compile_append() {
> +    # Remove useless rpath
> +    find ${B}/bindings/python/build -name "rrdtool.so" | xargs chrpath -d
> +}
> +
>  PACKAGES =3D+ "${PN}-perl ${PN}-python"
> =20
>  FILES_${PN}-doc +=3D "${datadir}/examples"
> --=20
> 1.9.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYmZGgACgkQN1Ujt2V2gBw/2QCfQB5nZ+rJVH/tdVcOQfkRw3aa
608AnjqoLLirJiheit1ReB9TGU7fN6kK
=VF+D
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--

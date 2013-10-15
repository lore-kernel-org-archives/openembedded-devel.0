Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id DEA8D6CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 11:39:52 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so3974397eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 04:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=InOPOR4r4EHWDvI0s3Zk2xNgg3kNGqBMo+D/QVTSo6E=;
	b=osLl+76cjtUj02TL/AA4EXVprLKpix70Noe3LiLmbXH+4ocl3IxMg+xt8BIyTRYhPW
	K8iOEgNwYDiM/SROJFiKsy34bLqk4oSR3vWmSh3Q8nO/WEG7A9+WhkcEJRsykCE0Lx3Z
	Uel9PwlAxvjf9HHcrR378X2sSVmTPmzZBAucCaPx27pmpWI8ntiV30fe+2nRFpHtwtdk
	iDNW5rwERpUNRe/y03CFvVYFCZ5DIeDXav2pB0DC1Qe7OpC2jBUSuAn7ND0Jibw6nyHZ
	8Jqv9dtcvsVHuVFOhNwLuokuPD5yd2aCWrNMMpKZofGpOjAV41Kankj2/XRnmsc3B5Cl
	u6Ww==
X-Received: by 10.14.109.66 with SMTP id r42mr110738eeg.43.1381837194183;
	Tue, 15 Oct 2013 04:39:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm165669787eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 04:39:53 -0700 (PDT)
Date: Tue, 15 Oct 2013 13:39:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131015113956.GB3703@jama>
References: <1381777605-6312-1-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1381777605-6312-1-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] orc: update to version 0.4.18
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
X-List-Received-Date: Tue, 15 Oct 2013 11:39:54 -0000
X-Groupsio-MsgNum: 46723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

For some reason patchwork replaces your full name in commit author with
just e-mail:
http://patchwork.openembedded.org/patch/59857/

I've fixed it manually when adding to contrib/jansa/in-test

can you please check if there is something strange in your pw account?

On Mon, Oct 14, 2013 at 09:06:45PM +0200, Carlos Rafael Giani wrote:
> This is the minimum required version for the Orc support in GStreamer 1.2
>=20
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta-oe/recipes-devtools/orc/orc_0.4.16.bb | 6 ------
>  meta-oe/recipes-devtools/orc/orc_0.4.18.bb | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/orc/orc_0.4.16.bb
>  create mode 100644 meta-oe/recipes-devtools/orc/orc_0.4.18.bb
>=20
> diff --git a/meta-oe/recipes-devtools/orc/orc_0.4.16.bb b/meta-oe/recipes=
-devtools/orc/orc_0.4.16.bb
> deleted file mode 100644
> index bb193ab..0000000
> --- a/meta-oe/recipes-devtools/orc/orc_0.4.16.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require orc.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[orc.md5sum] =3D "e482932e544c847761449b106ecbc483"
> -SRC_URI[orc.sha256sum] =3D "700e4edba20a0ed42164b645da26ce515b883d4c4633=
b222302f1e541f2a58ab"
> diff --git a/meta-oe/recipes-devtools/orc/orc_0.4.18.bb b/meta-oe/recipes=
-devtools/orc/orc_0.4.18.bb
> new file mode 100644
> index 0000000..2375d8c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/orc/orc_0.4.18.bb
> @@ -0,0 +1,6 @@
> +require orc.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[orc.md5sum] =3D "1a2552e8d127526c48d644fe6437b377"
> +SRC_URI[orc.sha256sum] =3D "34d3c8a7259f42bed4dcfbc106c5e3d0cc8e17eeaa73=
128d1c5eaf92883a6a24"
> --=20
> 1.8.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJdKYwACgkQN1Ujt2V2gByyPACeJOpQvYOBwO2IwMdQCzsQj3ZI
THkAnA0ShAG54x6NCrQuSq4izkHYVnAT
=CxiQ
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--

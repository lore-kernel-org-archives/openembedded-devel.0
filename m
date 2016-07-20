Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 378E7606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 13:59:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o80so7197826wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=x6e77vh/sm11YXjESqRWeHAIbLBRz8u7tVB8AOnTJF4=;
	b=EbyO01Evdy129LCJzwjsu+W9KyXkT3L/XVETtkyrPBLcaJBlBAIQ9+XCUya04c/Bc9
	fZZQIEnGsE18aR6EoBvHB7Sm8BWudqy43BuJeJbNzoSUeXN1LVAWWFye94i2rBSF7SkX
	UrqfI16WDfUYCf6fj9rniXV0u/ZP9oJcJtbPWeUF7IK09UwEkotoiKUjH+Kfn7alK2HS
	DvVmmklPd791L52jjNB9rXF9q26LW/prMbGwNKiJf+5wLeJNbMY9pjinczZRAJAqJM4D
	wCXRWqg/uaQfJEAFlTfi67pPvbltYk6qYDKapqliOerdthCU0Ys4oE4F8yuJBM7GOtSM
	Fphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=x6e77vh/sm11YXjESqRWeHAIbLBRz8u7tVB8AOnTJF4=;
	b=ago3UmsoI82qn0oMoHjiDCu4NB4Bmco+SaUGtp/UUh7echaV6i1Mq5Q5Qqbp9SvonF
	oOVJSa3IezkCfk75Kfc4CT2ltFq2mcvbwiS640eHkLyVjSJlWTPJmU8J1hrx0KHDNuaJ
	/GwCe4ADWPeZVK8qYdVvLKQ7q1bXGE0wWID6O+6d+BDfUY4wRGBqjwNrcnDGnubjk8uQ
	uubJiG708jENNlH3yqaIsCoBtFlm98E6Udj0qaWTgGROhvIt9nH0a4k7pMRdksVcHsSF
	AIkOkPygJXYYr3r7mTNO8Dg5et7fjdeYQBTg9uMTRsGzbBzq+Oj4bvEZVeWtX9czHM//
	OIrA==
X-Gm-Message-State: ALyK8tLFOO9C1k0FZ5gBxD2ggqvHkXvnYcFzVZpUFmbxDoRguy7eWwt3Txiab2zE6yJc4w==
X-Received: by 10.194.161.6 with SMTP id xo6mr1468441wjb.84.1469023144777;
	Wed, 20 Jul 2016 06:59:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	v134sm31725056wmf.10.2016.07.20.06.59.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Jul 2016 06:59:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 Jul 2016 15:59:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160720135910.hs6ucmxt3mxv6zu7@jama>
References: <1468508914-17420-1-git-send-email-cynthia.ms.chiu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1468508914-17420-1-git-send-email-cynthia.ms.chiu@gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH v2] CANopenNode: recipe for building the CANopenSocket tools
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2016 13:59:05 -0000
X-Groupsio-MsgNum: 62263
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="62fqvarj6cqti3d4"
Content-Disposition: inline

--62fqvarj6cqti3d4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2016 at 09:08:34AM -0600, cynthiachiu wrote:
> Initial check-in for the CANopenSocket tools recipe.
>=20
> Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
>=20
> Including a specific revision for the recipe.
>=20
> Using gitsm.
>=20
> Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
> ---
>  .../canopennode/canopensocket_git.bb               | 25 ++++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/canopennode/canopensocket_gi=
t.bb
>=20
> diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb b/=
meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> new file mode 100644
> index 0000000..7c58a26
> --- /dev/null
> +++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Linux CANOpen tools"
> +DESCRIPTION =3D "Linux CANOpen Protocol Stack Tools"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"

canopensocket-git: canopensocket: LIC_FILES_CHKSUM points to an invalid
file:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/can=
opensocket/git-r0/git/gpl-2.0.txt
[license-checksum]

> +
> +SRC_URI =3D "gitsm://github.com/CANopenNode/CANopenSocket.git"
> +SRCREV =3D "7777653da3a630b0dc02b3fa5ff029d9bc57cd26"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_compile() {
> +    cd ${S}/canopend
> +    make
> +    cd ${S}/canopencomm
> +    make
> +    cd ${S}/canopencgi
> +    make
> +}
> +
> +do_install(){
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/canopend/app/canopend ${D}${bindir}
> +    install -m 0755 ${S}/canopencomm/canopencomm ${D}${bindir}
> +    install -m 0755 ${S}/canopencgi/canopen.cgi ${D}${bindir}
> +}
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--62fqvarj6cqti3d4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlePg54ACgkQN1Ujt2V2gBwBXgCeKicA8P0/gSnEk3SjK5NuvlqE
fWcAoKNv7DfVNjv9O0io0xv/Ekl87UnQ
=mAsi
-----END PGP SIGNATURE-----

--62fqvarj6cqti3d4--

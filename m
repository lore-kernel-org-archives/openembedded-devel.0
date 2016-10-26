Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 630B571998
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 14:27:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o81so3731700wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 07:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JHV9qUHti0PfuE3foykVdF2jkEj9F81lFT3yf1tLki4=;
	b=QdwMN9tp7RwMePccx19WI3JWZtFZMZHF4T4oGkdM+X8+u9IarR6aCLgGua0YtkXRf0
	u9O35o6DI0PNQBXDUWiGYIWT9QEF+wfHS2uM88uxL9/R6zDpL5Z8fIRwDXXYPih60HKF
	6anMga3O8xDqHs3SrrCvMfPPrfosHIZGZ/rAQ2Lg1eE1HGXsA//iJn1QzMNvyYqAUnf0
	GimQgI9e/mdxWOfGxGyRRs79n+GPtnCKiNPbC596WTgisiapyFY1GbZUqDNwmuuB9XRx
	VLkSNXDsGJc817+JQ+3lU4SvOE3OZhuenh4dm0QjQ7Ohh34q4vfaGxTOKhG9ZUFOPNqk
	ZN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JHV9qUHti0PfuE3foykVdF2jkEj9F81lFT3yf1tLki4=;
	b=Q+F2D5w73Tv+UO6xfYgbdzmNJroBwsfoHylXogWk2aWooZRJD2O1XQN+uxCt1LOA2I
	tDhBwe/qXbly/cEcXDRfDcyeBdlPBk2+3VqmC3hH1KxExl56fXCfJ9qWDviGmFCHroXj
	UJkgZSvw/mHCgrMtyLrfZtP3AG5tz8/fHmaXDj00zZ49vC2hwNxsnYiI15kKPCzN7S6X
	aj6ZQipceyrUZXi1p9Mwf1XotBdca87byAKX1t5iW6dDhXD1zgtGGcIu4IP/7UTJFky7
	cTZ5ZO8bNOEXTEZIYh8kVf9Gc6MAuFZwx0ZA1MCm+z8hLe4jcLgwDpVBR9I1aS6cD65U
	DtrA==
X-Gm-Message-State: ABUngvez6McXiwK6+jpJ+ZFGExBzAxIe7aR+otpXHWAUdgwNu4Pvmtu1EMtNKRJVm7Zg9g==
X-Received: by 10.194.80.74 with SMTP id p10mr2469928wjx.121.1477492022575;
	Wed, 26 Oct 2016 07:27:02 -0700 (PDT)
Received: from localhost (ip-89-176-50-133.net.upcbroadband.cz.
	[89.176.50.133]) by smtp.gmail.com with ESMTPSA id
	x127sm9887428wmd.21.2016.10.26.07.27.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Oct 2016 07:27:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Oct 2016 16:27:02 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161026142702.GD4096@jama>
References: <1477469034-23992-1-git-send-email-jianchuan.wang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1477469034-23992-1-git-send-email-jianchuan.wang@windriver.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [PATCH] netmap: Rename the _count to _recount for kernel v4.8
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
X-List-Received-Date: Wed, 26 Oct 2016 14:27:02 -0000
X-Groupsio-MsgNum: 63612
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline

--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2016 at 04:03:54PM +0800, jianchuan.wang@windriver.com wrot=
e:
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>=20
> Rename the _count to _recount since Adjusting the member of struct page
> in the kernel v4.8

Did you forgot to unblacklist netmap-modules?

ERROR: Nothing PROVIDES 'netmap-modules' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb
DEPENDS on or otherwise requires it)
ERROR: netmap-modules was skipped: Recipe is blacklisted: BROKEN: not
compatible with default kernel version 4.8
ERROR: Nothing RPROVIDES 'netmap' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb
RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'netmap'
NOTE: Runtime target 'netmap' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['netmap']
ERROR: Nothing RPROVIDES 'netmap-dev' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb
RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'netmap-dev'
NOTE: Runtime target 'netmap-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['netmap-dev']

>=20
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>  ...0001-netmap-Rename-the-_conut-to-_recount.patch | 31 ++++++++++++++++=
++++++
>  .../recipes-kernel/netmap/netmap-modules_git.bb    |  2 ++
>  .../recipes-kernel/netmap/netmap_git.bb            |  2 --
>  3 files changed, 33 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-kernel/netmap/files/0001-netm=
ap-Rename-the-_conut-to-_recount.patch
>=20
> diff --git a/meta-networking/recipes-kernel/netmap/files/0001-netmap-Rena=
me-the-_conut-to-_recount.patch b/meta-networking/recipes-kernel/netmap/fil=
es/0001-netmap-Rename-the-_conut-to-_recount.patch
> new file mode 100644
> index 0000000..4a92a13
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/netmap/files/0001-netmap-Rename-the-=
_conut-to-_recount.patch
> @@ -0,0 +1,31 @@
> +From 3de3d534c0b85f2d0378f699160e1a026a7317a7 Mon Sep 17 00:00:00 2001
> +From: Jianchuan Wang <jianchuan.wang@windriver.com>
> +Date: Wed, 26 Oct 2016 03:11:27 -0400
> +Subject: [PATCH] netmap: Rename the _conut to _recount
> +
> +Rename the _count into _refcount since Adjusting the member of
> +struct page in the kernel v4.8.
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> +---
> + LINUX/bsd_glue.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/LINUX/bsd_glue.h b/LINUX/bsd_glue.h
> +index 9a116a0..8df6838 100644
> +--- a/LINUX/bsd_glue.h
> ++++ b/LINUX/bsd_glue.h
> +@@ -130,7 +130,7 @@ struct net_device_ops {
> + 	do {						  \
> + 		int i_;					  \
> + 		for (i_ =3D 1; i_ < (1 << (order)); i_++)	  \
> +-			atomic_set(&(page)[i_]._count, 1);\
> ++			atomic_set(&(page)[i_]._refcount, 1);\
> + 	} while (0)
> + #endif /* HAVE_SPLIT_PAGE */
> +=20
> +--=20
> +2.8.1
> +
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb =
b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> index e9eea56..009f9bc 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -44,6 +44,8 @@ python __anonymous () {
>  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
>  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
> =20
> +SRC_URI +=3D "file://0001-netmap-Rename-the-_conut-to-_recount.patch"
> +
>  do_configure () {
>      cd ${S}/LINUX
>      ./configure ${EXTRA_OECONF}
> diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-n=
etworking/recipes-kernel/netmap/netmap_git.bb
> index 667e7cc..a5bc57a 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
> @@ -33,5 +33,3 @@ FILES_${PN} +=3D "${bindir}"
>  RDEPENDS_${PN} =3D "kernel-module-netmap"
>  RRECOMMENDS_${PN} =3D "kernel-module-netmap"
> =20
> -# http://errors.yoctoproject.org/Errors/Details/69733/
> -PNBLACKLIST[netmap] ?=3D "BROKEN: Tries to build kernel module and fails=
, either it should be disabled or there should be dependency on kernel like=
 in netmap-modules"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgQvTUACgkQN1Ujt2V2gBy0ngCfTR3mC4cbIY1eBhYM2SjJ0F9Q
2asAn3Ou8HRPctD8cJh0yfphc4jo0QWl
=rJTH
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--

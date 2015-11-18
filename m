Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6393E6010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:25:40 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so192015031wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 02:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KiydNWTVpAosWre+q5AZnNq1D8rjzafQ396PyLGt590=;
	b=RXU7F7+VGJtAta8pIGZZx6HENXd0mcKc16EGLWwEQhrR/qatdC3wlyi0xdc66E/9sF
	hAGsnPbgs/Ko7DojWNiuRuLFG5CRZipjYi9u3RiRpPI+cZuGZkaICxyB8YYafQW+oKrZ
	WxwlLIc4VB9RL/gns3575rJ5uMLBLP/HTI6SwRjcnFs1sPPIunJr0rxbdnRS4OJRG94V
	UBeF2YQf85tdBsPHMviuYkdx26G786FogscTzgcdqCQmY1wpwVn9c+E/czYwF+ULi3aS
	0Vskb7vZsz1lra9INCYCbh95O/UhmD4DMS6WHsCkXT/DQB3UXqdEj5sDDMpeXPrpcXd8
	XOgA==
X-Received: by 10.28.135.67 with SMTP id j64mr3250804wmd.93.1447842340958;
	Wed, 18 Nov 2015 02:25:40 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z131sm2564262wme.7.2015.11.18.02.25.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 02:25:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Nov 2015 11:25:55 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151118102555.GB2213@jama>
References: <1447840941-29496-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1447840941-29496-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] netmap-modules: make deterministic builds for drivers
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
X-List-Received-Date: Wed, 18 Nov 2015 10:25:41 -0000
X-Groupsio-MsgNum: 58702
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline

--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2015 at 06:02:21PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The driver builds are optional, but for deterministic builds,
> we should should be able to explicitly enable/disable the
> builds for them in a proper place (maybe in BSP).
> But we can't use PACKAGECONFIG since there is no option for
> each driver, and the options are:
>  --no-drivers    do not compile any driver
>  --no-drivers=3D   do not compile the given drivers (comma sep.)
>  --drivers=3D      only compile the given drivers (comma sep.)
>=20
> So use NETMAP_DRIVERS to list the needed drivers and add proper
> configs to EXTRA_OECONF, the default is no drivers, and all
> supported drivers are listed in NETMAP_ALL_DRIVERS.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-kernel/netmap/netmap-modules_git.bb    | 31 ++++++++++++++++=
+++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb =
b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> index 6365fee..cfe5ce9 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -15,7 +15,36 @@ EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUIL=
DDIR} \
>                  --driver-suffix=3D"-netmap" \
>                  "
> =20
> -EXTRA_OECONF +=3D "--no-drivers=3Dixgbe --no-drivers=3Dvirtio_net.c"
> +# The driver builds are optional, but for deterministic builds,
> +# we should be able to explicitly enable/disable the builds
> +# for them in a proper place (maybe in BSP).
> +# But we can't use PACKAGECONFIG since there is no option for
> +# each driver, and the options are:
> +#  --no-drivers    do not compile any driver
> +#  --no-drivers=3D   do not compile the given drivers (comma sep.)
> +#  --drivers=3D      only compile the given drivers (comma sep.)
> +#
> +# So use NETMAP_DRIVERS and the following python code to add proper
> +# configs to EXTRA_OECONF and skip arch test for kernel modules.
> +#
> +# The default is no-drivers, and all supported drivers are listed
> +# in NETMAP_ALL_DRIVERS.
> +NETMAP_DRIVERS ??=3D ""
> +NETMAP_ALL_DRIVERS =3D "ixgbe igb e1000e e1000 veth.c forcedeth.c virtio=
_net.c r8169.c"
> +
> +python __anonymous () {
> +    drivers_list =3D d.getVar("NETMAP_DRIVERS", True).split()
> +    all_drivers_list =3D d.getVar("NETMAP_ALL_DRIVERS", True).split()
> +    config_drivers =3D "--drivers=3D" + ",".join(drivers_list)
> +
> +    extra_oeconf_drivers =3D bb.utils.contains_any('NETMAP_DRIVERS', all=
_drivers_list, config_drivers, '--no-drivers', d)
> +    d.appendVar("EXTRA_OECONF", extra_oeconf_drivers)

This part looks good to me, thanks for fixing virtio_net.c change (I've
merged that one by accident).

> +
> +    # skip the arch test for kernel modules
> +    if drivers_list:
> +        for driver in drivers_list:
> +            d.setVar("INSANE_SKIP_kernel-module-%s-netmap" % driver, "ar=
ch")

Why is this needed? Shouldn't the kernel modules build with correct
architecture? And e.g. r8169.c creates kernel-module-r8169.c-netmap package?
I hope the .c is stripped somewhere in the build.


> +}
> =20
>  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
>  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
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

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZMUjIACgkQN1Ujt2V2gBxt/ACgkJFgbGfaG8hZPsezaTIbSIxf
lP8An1NgH33RKuSIDcyJTV+OfGBuenBo
=caf0
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--

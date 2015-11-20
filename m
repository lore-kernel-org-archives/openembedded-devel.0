Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id E9DFE60118
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 11:53:20 +0000 (UTC)
Received: by wmec201 with SMTP id c201so68459088wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 03:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vpZQvdZ8+RZYwe9DpBeqOoe/oc5/XjVB2zJEK1WBZPw=;
	b=QeKA/kLaSpOIz7B/FlB8fEL/clvYaGis6b2YZ513CSR/WobFwNBJends1jDNXqKl6k
	StGIzO1K6zASs3yorLZWPXlvwXWgwPMhrtePgCzXzy2yDHxrNSmhVb0FxKwgR9EzgdUl
	Kf1/ytkXCtC8d7IjcR7/mRqEPC92ytDJ49Y8dBu+eU/yBvFvlAdnMCStzun8dn7/1ZGH
	N3eSVnRez5gU3W/yYccFfRVwkFJ6BTbXCXAuU6xBaJvlwVBo2tPw++wnmgA0hBzhzUYy
	bhKoYsbN4LztbMb7qwfHNwQ1VTZRidy/TZHaHd6ADSGdPwmPyaP3vx7y1RN0qUXf+HiD
	m4Pg==
X-Received: by 10.28.87.72 with SMTP id l69mr1881352wmb.70.1448020400716;
	Fri, 20 Nov 2015 03:53:20 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bh5sm12316693wjb.42.2015.11.20.03.53.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Nov 2015 03:53:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Nov 2015 12:53:43 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151120115343.GE2241@jama>
References: <1448018662-16386-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1448018662-16386-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH v2] netmap-modules: make deterministic builds for drivers
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
X-List-Received-Date: Fri, 20 Nov 2015 11:53:21 -0000
X-Groupsio-MsgNum: 58763
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Content-Disposition: inline

--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2015 at 07:24:22PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The driver builds are optional, but for deterministic builds,
> we should should be able to explicitly enable/disable the
> builds for them in a proper place (maybe in BSP).
>=20
> We use PACKAGECONFIG for listing enabled drivers but can't use
> it's arguments since there is no option for each driver, and
> the options for drivers are:
>  --no-drivers    do not compile any driver
>  --no-drivers=3D   do not compile the given drivers (comma sep.)
>  --drivers=3D      only compile the given drivers (comma sep.)
>=20
> So add additional logic to add proper configs to EXTRA_OECONF
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-kernel/netmap/netmap-modules_git.bb    | 53 ++++++++++++++++=
+++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb =
b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> index 6365fee..c6da691 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -15,7 +15,58 @@ EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUIL=
DDIR} \
>                  --driver-suffix=3D"-netmap" \
>                  "
> =20
> -EXTRA_OECONF +=3D "--no-drivers=3Dixgbe --no-drivers=3Dvirtio_net.c"
> +# The driver builds are optional, but for deterministic builds,
> +# we should be able to explicitly enable/disable the builds
> +# for them in a proper place (maybe in BSP).
> +# We use PACKAGECONFIG for listing enabled drivers but can't use
> +# it's arguments since there is no option for each driver, and
> +# the options for drivers are:
> +#  --no-drivers    do not compile any driver
> +#  --no-drivers=3D   do not compile the given drivers (comma sep.)
> +#  --drivers=3D      only compile the given drivers (comma sep.)
> +#
> +# So use the following python code to add proper configs to
> +# EXTRA_OECONF and skip arch test for kernel modules.
> +#
> +# The default is no-drivers, and all supported drivers are listed
> +# as PACKAGECONFIG flags.
> +PACKAGECONFIG ??=3D ""
> +
> +# List all supported drivers, get from "./configure --show-drivers",
> +# Add "dri_" prefix for easy distinguishing from other configure
> +# options.
> +PACKAGECONFIG[dri_ixgbe] =3D ",,,"
> +PACKAGECONFIG[dri_igb] =3D ",,,"
> +PACKAGECONFIG[dri_e1000e] =3D ",,,"
> +PACKAGECONFIG[dri_e1000] =3D ",,,"
> +PACKAGECONFIG[dri_veth.c] =3D ",,,"
> +PACKAGECONFIG[dri_forcedeth.c] =3D ",,,"
> +PACKAGECONFIG[dri_virtio_net.c] =3D ",,,"
> +PACKAGECONFIG[dri_r8169.c] =3D ",,,"
> +
> +python __anonymous () {
> +    pkgconfigs =3D d.getVar("PACKAGECONFIG", True).split()
> +    pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG").keys()
> +
> +    # This is needed since there may be non-driver flags in PACKAGECONFIG
> +    all_drivers_list =3D []
> +    for f in pkgconfigflags:
> +        if f.startswith('dri_'):
> +            all_drivers_list.append(f)
> +    drivers_list =3D []
> +    for i in pkgconfigs:
> +        if i in all_drivers_list:
> +            drivers_list.append(i[len('dri_'):])
> +
> +    config_drivers =3D "--drivers=3D" + ",".join(drivers_list)
> +    extra_oeconf_drivers =3D bb.utils.contains_any('PACKAGECONFIG', all_=
drivers_list, config_drivers, '--no-drivers', d)
> +    d.appendVar("EXTRA_OECONF", extra_oeconf_drivers)
> +
> +    # skip the arch test for kernel modules
> +    if drivers_list:
> +        for driver in drivers_list:
> +            d.setVar("INSANE_SKIP_kernel-module-%s-netmap" % bb.utils.pr=
une_suffix(driver, ['.c'], d), "arch")

either move this to separate patch or add the explanation from your
other change to the commit message.

It still looks wrong to me.

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

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZPCccACgkQN1Ujt2V2gBz8bACgrt/DlwQO1LVxubitjFNGoT0b
Hq8An2rGRJDZ4X/P7LY3M7SVDdF4/Hwd
=5hqg
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--

Received: from gateway-2929.mvista.com ([206.112.117.47])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1NXMGw-0004xv-A2
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 23:10:05 +0100
Received: from [10.50.1.165] (unknown [10.50.1.165])
	by hermes.mvista.com (Postfix) with ESMTP id 381141D89C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 14:07:45 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1077)
From: Christopher Larson <clarson@mvista.com>
In-Reply-To: <1263938187-20935-1-git-send-email-clarson@mvista.com>
Date: Tue, 19 Jan 2010 15:07:44 -0700
Message-Id: <285A50B1-2FB3-4BF7-BC79-C964C6A13ECF@mvista.com>
References: <1263938187-20935-1-git-send-email-clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 206.112.117.47
X-SA-Exim-Mail-From: clarson@mvista.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] image, rootfs_ipk: implement IMAGE_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2010 22:10:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Jan 19, 2010, at 2:56 PM, Chris Larson wrote:
>=20
> This adds the ability to include groups of packages in an image.  It =
is
> similar in concept to the IMAGE_FEATURES used in Poky, but here we use
> IMAGE_FEATURE_<feature> and IMAGE_FEATURE_<feature>_OPTIONAL, rather =
than
> base_contains calls.
>=20
> Initially defined groups:
> base - the packages requested via IMAGE_INSTALL & IMAGE_VARS
> dbg - debug packages
> dev - development packages
> doc - documentation packages (of limited use at the moment due to =
task.bbclass)
> vmlinux - kernel debugging packages (just kernel-vmlinux at the =
moment)
>=20
> To add one of these to an image, you can either append to =
IMAGE_FEATURES or override IMAGE_FEATURES.
>=20
> Examples:
> IMAGE_FEATURES_append =3D " dbg"
>=20
> IMAGE_FEATURES =3D "base dbg vmlinux"
>=20
> To add a new package group:
> IMAGE_FEATURE_myfeature =3D "gstreamer python pulseaudio"
>=20
> Signed-off-by: Chris Larson <clarson@mvista.com>
> ---
> classes/image.bbclass      |  100 =
+++++++++++++++++++++++++++++++++++++++++++-
> classes/rootfs_ipk.bbclass |    2 +-
> 2 files changed, 99 insertions(+), 3 deletions(-)
>=20
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index 9dce609..fa7cc9e 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -28,11 +28,10 @@ ${IMAGE_DEV_MANAGER} \
> ${IMAGE_INIT_MANAGER} \
> ${IMAGE_LOGIN_MANAGER} "
>=20
> -RDEPENDS +=3D "${IMAGE_INSTALL} ${IMAGE_BOOT}"
> +RDEPENDS +=3D "${__PACKAGE_INSTALL}"
>=20
> # "export IMAGE_BASENAME" not supported at this time
> IMAGE_BASENAME[export] =3D "1"
> -export PACKAGE_INSTALL ?=3D "${IMAGE_INSTALL} ${IMAGE_BOOT}"
>=20
> # We need to recursively follow RDEPENDS and RRECOMMENDS for images
> do_rootfs[recrdeptask] +=3D "do_deploy do_populate_staging"
> @@ -60,6 +59,7 @@ python () {
>     bb.data.setVarFlag('do_rootfs', 'depends', deps, d)
>=20
>     runtime_mapping_rename("PACKAGE_INSTALL", d)
> +    runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", d)
> }
>=20
> #
> @@ -106,6 +106,102 @@ IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
>=20
> LINGUAS_INSTALL =3D "${@" ".join(map(lambda s: "locale-base-%s" % s, =
bb.data.getVar('IMAGE_LINGUAS', d, 1).split()))}"
>=20
> +def __pkgmap(d):
> +    from os import listdir
> +    from os.path import isdir, join, dirname
> +
> +    os =3D d.getVar("TARGET_OS", True)
> +    vendor =3D d.getVar("TARGET_VENDOR", True)
> +    basedir =3D dirname(d.getVar("PKGDATA_DIR", True))
> +
> +    dirs =3D ("%s%s-%s" % (arch, vendor, os)
> +            for arch in d.getVar("PACKAGE_ARCHS", True).split())
> +
> +    for pkgdatadir in (join(basedir, sys) for sys in dirs):
> +        try:
> +            files =3D listdir(pkgdatadir)
> +        except OSError:
> +            continue
> +
> +        for pn in filter(lambda f: not isdir(join(pkgdatadir, f)), =
files):
> +            try:
> +                pkgdata =3D read_pkgdatafile(join(pkgdatadir, pn))
> +            except OSError:
> +                continue
> +
> +            for pkg in pkgdata["PACKAGES"].split():
> +                yield pkg, pn
> +
> +def pkgmap(d):
> +    pkgmap_data =3D d.getVar("__pkgmap_data", False)
> +    if pkgmap_data is None:
> +        pkgmap_data =3D dict(__pkgmap(d))
> +        d.setVar("__pkgmap_data", pkgmap_data)
> +
> +    return pkgmap_data
> +
> +def recipename(pkg, d):
> +    return pkgmap(d).get(pkg)
> +
> +def pkgjoin(l):
> +    return ' '.join(set(l))
> +
> +def pkgsplit(var, d):
> +    return (d.getVar(var, True) or "").split()
> +
> +def __packages(features, d):
> +    for feature in features:
> +        for pkg in pkgsplit('IMAGE_FEATURE_%s' % feature, d):
> +            yield pkg
> +
> +def required_packages(features, d):
> +    for pkg in __packages((f for f in features if not =
d.getVar("IMAGE_FEATURE_%s_OPTIONAL" % f, True)), d):
> +        yield pkg
> +
> +def optional_packages(features, d):
> +    for pkg in __packages((f for f in features if =
d.getVar("IMAGE_FEATURE_%s_OPTIONAL" % f, True)), d):
> +        yield pkg
> +
> +def active_packages(features, d):
> +    from itertools import chain
> +
> +    for pkg in chain(required_packages(features, d), =
optional_packages(features, d)):
> +        yield pkg
> +
> +def active_recipes(features, d):
> +    for pkg in active_packages(features, d):
> +        recipe =3D recipename(pkg, d)
> +        if recipe:
> +            yield recipe
> +
> +def image_features_noextras(d):
> +    for f in d.getVar("IMAGE_FEATURES", True).split():
> +        if not f in ('dbg', 'dev', 'doc'):
> +            yield f
> +
> +def dbg_packages(d):
> +    from itertools import chain
> +
> +    features =3D image_features_noextras(d)
> +    return pkgjoin("%s-dbg" % pkg for pkg in =
chain(active_packages(features, d), active_recipes(features, d)))
> +
> +__PACKAGE_INSTALL =3D "${@' =
'.join(required_packages(d.getVar('IMAGE_FEATURES', True).split(), d))}"
> +PACKAGE_INSTALL =3D "${__PACKAGE_INSTALL}"
> +PACKAGE_INSTALL_ATTEMPTONLY =3D "${@' =
'.join(optional_packages(d.getVar('IMAGE_FEATURES', True).split(), d))}"
> +
> +IMAGE_FEATURES ?=3D "base"
> +
> +# Define our default available image features
> +IMAGE_FEATURE_base =3D "${IMAGE_INSTALL} ${IMAGE_VARS}"
> +IMAGE_FEATURE_vmlinux =3D "kernel-vmlinux"
> +
> +IMAGE_FEATURE_dbg =3D "${@dbg_packages(d)}"
> +IMAGE_FEATURE_dbg_OPTIONAL =3D "1"
> +IMAGE_FEATURE_dev =3D "${@pkgjoin('%s-dev' % pn for pn in =
active_recipes(image_features_noextras(d), d))}"
> +IMAGE_FEATURE_dev_OPTIONAL =3D "1"
> +IMAGE_FEATURE_doc =3D "${@pkgjoin('%s-doc' % pn for pn in =
active_recipes(image_features_noextras(d), d))}"
> +IMAGE_FEATURE_doc_OPTIONAL =3D "1"
> +
> do_rootfs[nostamp] =3D "1"
> do_rootfs[dirs] =3D "${TOPDIR}"
> do_build[nostamp] =3D "1"
> diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
> index 16dd511..66bd7aa 100644
> --- a/classes/rootfs_ipk.bbclass
> +++ b/classes/rootfs_ipk.bbclass
> @@ -23,7 +23,7 @@ BAD_RECOMMENDATIONS ?=3D ""
> IPKG_VARIANT ?=3D "opkg"
>=20
> RDEPENDS_append =3D " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", =
"none", "", "${IPKG_VARIANT} opkg-collateral", d)}"
> -PACKAGE_INSTALL_append =3D " =
${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", =
"${IPKG_VARIANT} opkg-collateral", d)}"
> +IMAGE_INSTALL_append =3D " =
${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", =
"${IPKG_VARIANT} opkg-collateral", d)}"
>=20
> fakeroot rootfs_ipk_do_rootfs () {
> 	set -x
> --=20
> 1.6.6
>=20

Erm, forgot to fix the IMAGE_VARS vs IMAGE_BOOT thing.  Well, you get =
the idea :)
--=20
Chris Larson
Software Engineer
MontaVista Software, Inc.
Work: 480-517-5031
Home: 480-963-2636
Email: clarson AT mvista DOT com
Email: clarson AT kergoth DOT com




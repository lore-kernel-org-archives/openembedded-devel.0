Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2086013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 14:44:33 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ZFkOo-0001rM-7M from Joe_MacDonald@mentor.com ;
	Thu, 16 Jul 2015 07:44:34 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 16 Jul 2015 07:44:33 -0700
Received: by burninator (Postfix, from userid 1000)	id 35A2C5835B3; Thu, 16
	Jul 2015 10:44:09 -0400 (EDT)
Date: Thu, 16 Jul 2015 10:44:09 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <rongqing.li@windriver.com>
Message-ID: <20150716144408.GB4432@mentor.com>
References: <1436236091-31779-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1436236091-31779-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] ypbind-mt: get parameters from dhcp
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
X-List-Received-Date: Thu, 16 Jul 2015 14:44:38 -0000
X-Groupsio-MsgNum: 56265
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [PATCH][meta-networking] ypbind-mt: get parameters from dhcp] On 15.0=
7.07 (Tue 10:28) rongqing.li@windriver.com wrote:

> From: Li Wang <li.wang@windriver.com>
>=20
> the script nis.sh is called by dhcp client,
> it can get some parameters from dhcp.
>=20
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
>  .../recipes-support/nis/ypbind-mt/nis.sh           | 41 ++++++++++++++++=
++++++
>  .../recipes-support/nis/ypbind-mt/yp.conf          |  1 +
>  .../recipes-support/nis/ypbind-mt_1.38.bb          |  6 ++++
>  3 files changed, 48 insertions(+)
>  create mode 100755 meta-networking/recipes-support/nis/ypbind-mt/nis.sh
>  create mode 100644 meta-networking/recipes-support/nis/ypbind-mt/yp.conf
>=20
> diff --git a/meta-networking/recipes-support/nis/ypbind-mt/nis.sh b/meta-=
networking/recipes-support/nis/ypbind-mt/nis.sh
> new file mode 100755
> index 0000000..a06a977
> --- /dev/null
> +++ b/meta-networking/recipes-support/nis/ypbind-mt/nis.sh
> @@ -0,0 +1,41 @@
> +#!/bin/bash

I wasn't able to find anything bash-specific in this script, can you
change this to /bin/sh, please?

> +#
> +# nis.sh: dhclient-script plugin for NIS settings,
> +#         place in /etc/dhcp/dhclient.d and 'chmod +x nis.sh' to enable
> +#
> +
> +CONF=3D/etc/yp.conf
> +SAVECONF=3D${SAVEDIR}/${CONF##*/}.predhclient.${interface}

Where's SAVEDIR set again?  It comes from the calling environment?

> +
> +nis_replace_conf() {
> +        echo "$1" | diff -q ${CONF} - > /dev/null 2>&1
> +        if [ $? -eq 1 ]; then
> +            echo "$1" > ${CONF}
> +#            restorecon ${CONF} >/dev/null 2>&1

I'm not sure what to make of this, maybe you want to make a parameter to
optionally run restorecon?  Or maybe a separate patch for meta-selinux
with restorecon stuff in it?  Either way, please don't leave this as
dead code.

> +            service ypbind restart >/dev/null 2>&1
> +        fi
> +}
> +
> +nis_config() {
> +    if [ -n "${new_nis_domain}" ] && [ -n "${new_nis_servers}" ] &&
> +        [ -e ${CONF} ] && [ -d ${SAVEDIR} ]; then
> +        local conf=3D$(grep -v '^domain .*  # added by /sbin/dhclient-sc=
ript$' < ${CONF})
> +
> +        conf=3D$(echo "$conf"
> +            for s in ${new_nis_servers}; do
> +                echo "domain ${new_nis_domain} server ${s}  # added by /=
sbin/dhclient-script"
> +            done)
> +
> +        [ -f ${SAVECONF} ] || touch ${SAVECONF}
> +        nis_replace_conf "$conf"
> +    fi
> +}
> +
> +nis_restore() {
> +    if [ -e ${CONF} ] && [ -f ${SAVECONF} ]; then
> +        local conf=3D$(grep -v '^domain .*  # added by /sbin/dhclient-sc=
ript$' < ${CONF})

Would this really be necessary if you saved $CONF to $SAVECONF and
restored it later?  (See below)

> +
> +        nis_replace_conf "$conf"
> +        rm -f ${SAVECONF}

Does anything get copied to $SAVECONF?  All I see is the one touch
above, but wouldn't it be easier all around if you were making copies of
the CONF file to restore later?

> +    fi
> +}
> diff --git a/meta-networking/recipes-support/nis/ypbind-mt/yp.conf b/meta=
-networking/recipes-support/nis/ypbind-mt/yp.conf
> new file mode 100644
> index 0000000..792d600
> --- /dev/null
> +++ b/meta-networking/recipes-support/nis/ypbind-mt/yp.conf
> @@ -0,0 +1 @@
> +#

Presumably this is necessary to support the 'nis.sh' script, but since
it's just an empty file, why not create it at do_install time (or better
still just have the script handle a missing one in some sensible way and
thus allow another layer to provide their own yp.conf if they need to)?

I'd encourage you to look at:

https://git.centos.org/raw/rpms!ypbind.git/5a592e88374f067679276488430ebdf5=
1152c358/SOURCES!nis.sh;jsessionid=3D1xhm7099hzkgm1w0ke7bmqaut4

since they seem to share a common ancestry anyway and adopt that (or
something very like it) instead.

-J.

> diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta=
-networking/recipes-support/nis/ypbind-mt_1.38.bb
> index d25ef5c..f0c1cea 100644
> --- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
> +++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
> @@ -28,6 +28,8 @@ PROVIDES +=3D "ypbind"
>  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
>             file://ypbind-yocto.init \
>             file://ypbind.service \
> +           file://yp.conf \
> +           file://nis.sh \
>  "
>  SRC_URI[md5sum] =3D "094088c0e282fa7f3b3dd6cc51d0a4e1"
>  SRC_URI[sha256sum] =3D "1930ce19f6ccfe10400f3497b31867f71690d2bcd3f5b575=
199fa915559b7746"
> @@ -44,10 +46,14 @@ do_install_append () {
>      install -d ${D}${sysconfdir}/init.d
>      install -d ${D}${sysconfdir}/rcS.d
> =20
> +    install -m 0744 ${WORKDIR}/yp.conf ${D}${sysconfdir}/
>      install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.=
d/ypbind
> =20
>      install -d ${D}${systemd_unitdir}/system
>      install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/sys=
tem
> +
> +    install -d ${D}/${sysconfdir}/dhcp/dhclient.d
> +    install -m 755 ${WORKDIR}/nis.sh ${D}/${sysconfdir}/dhcp/dhclient.d/
>  }
> =20
> =20
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVp8M4AAoJEEn8ffcsOfaWwxUH/118ChSwti7Z15yx9BlqSpTo
cbWUVTCLbWOxzexPjx0eCllHiA7rXhq4AULfP0h5JCwooFDOp+vIy999ZKZSGfPA
evH6IalyUFrECOCnXcEmmHL2PAY8Nd7KhCi95GdwY0ZcgvnVHDClKfgCJbQ+7UHX
VjfbkbYnZQFH9vZvriSs5elrb611KkzSt6gHyGSmf8qcbraq/1DF7/aBcHytJrbn
QIjt6Kiah1EZX0PAnGpBJuqrSGYnD7DnCKWdaeLEnPPk7u4NKtTNWGhR1ooQvQYc
0BgZlzmWwxk7tpMH+vVYysbQtWvfHWBICBbDMWs6QeOnhQoGK7HNiBqSRiDvb3g=
=088G
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--

Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 720EE6013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 15:07:05 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1ZFkkb-0000lt-Bt from Joe_MacDonald@mentor.com ;
	Thu, 16 Jul 2015 08:07:05 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 16 Jul 2015 08:07:04 -0700
Received: by burninator (Postfix, from userid 1000)	id 939E55835B3; Thu, 16
	Jul 2015 11:06:39 -0400 (EDT)
Date: Thu, 16 Jul 2015 11:06:39 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <rongqing.li@windriver.com>
Message-ID: <20150716150639.GC4432@mentor.com>
References: <1436236099-31819-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1436236099-31819-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] ntp: get parameters from dhcp
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
X-List-Received-Date: Thu, 16 Jul 2015 15:07:07 -0000
X-Groupsio-MsgNum: 56266
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline

--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [PATCH][meta-networking] ntp: get parameters from dhcp] On 15.07.07 (=
Tue 10:28) rongqing.li@windriver.com wrote:

> From: Li Wang <li.wang@windriver.com>
>=20
> the script ntp.sh is called by dhcp client,
> it can get some parameters from dhcp.
>=20
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/files/ntp.sh   | 59 ++++++++++++++++=
++++++
>  meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb |  5 ++
>  2 files changed, 64 insertions(+)
>  create mode 100755 meta-networking/recipes-support/ntp/files/ntp.sh
>=20
> diff --git a/meta-networking/recipes-support/ntp/files/ntp.sh b/meta-netw=
orking/recipes-support/ntp/files/ntp.sh
> new file mode 100755
> index 0000000..fc109b5
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntp/files/ntp.sh
> @@ -0,0 +1,59 @@
> +#!/bin/bash

As with the other one, I couldn't find any bashisms in this, so if
we're going to have our own and not harvest it from the package, maybe
change this to /bin/sh.

> +#
> +# ntp.sh: dhclient-script plugin for NTP settings,
> +#         place in /etc/dhcp/dhclient.d and 'chmod +x ntp.sh' to enable
> +#
> +# Copyright (C) 2008 Red Hat, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +# Author(s): David Cantrell <dcantrell@redhat.com>
> +#            Miroslav Lichvar <mlichvar@redhat.com>
> +#
> +
> +CONF=3D/etc/ntp.conf
> +SAVECONF=3D${SAVEDIR}/${CONF##*/}.predhclient.${interface}
> +
> +ntp_replace_conf() {
> +        echo "$1" | diff -q ${CONF} - > /dev/null 2>&1
> +        if [ $? -eq 1 ]; then
> +            echo "$1" > ${CONF}
> +#            restorecon ${CONF} >/dev/null 2>&1

Please do something about this, too.

-J.

> +            service ntpd restart >/dev/null 2>&1
> +        fi
> +}
> +
> +ntp_config() {
> +    if [ ! "${PEERNTP}" =3D "no" ] && [ -n "${new_ntp_servers}" ] &&
> +        [ -e ${CONF} ] && [ -d ${SAVEDIR} ]; then
> +        local conf=3D$(grep -v '^server .*  # added by /sbin/dhclient-sc=
ript$' < ${CONF})
> +
> +        conf=3D$(echo "$conf"
> +            for s in ${new_ntp_servers}; do
> +                echo "server ${s} ${NTPSERVERARGS}  # added by /sbin/dhc=
lient-script"
> +            done)
> +
> +        [ -f ${SAVECONF} ] || touch ${SAVECONF}
> +        ntp_replace_conf "$conf"
> +    fi
> +}
> +
> +ntp_restore() {
> +    if [ -e ${CONF} ] && [ -f ${SAVECONF} ]; then
> +        local conf=3D$(grep -v '^server .*  # added by /sbin/dhclient-sc=
ript$' < ${CONF})
> +
> +        ntp_replace_conf "$conf"
> +        rm -f ${SAVECONF}
> +    fi
> +}
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb b/meta-ne=
tworking/recipes-support/ntp/ntp_4.2.8p2.bb
> index c54da43..b963584 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/n=
tp4/ntp-4.2/ntp-${PV}.tar.g
>             file://sntp.service \
>             file://sntp \
>             file://ntpd.list \
> +           file://ntp.sh \
>  "
> =20
>  SRC_URI[md5sum] =3D "fa37049383316322d060ec9061ac23a9"
> @@ -93,6 +94,9 @@ do_install_append() {
> =20
>      install -d ${D}${systemd_unitdir}/ntp-units.d
>      install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-unit=
s.d/60-ntpd.list
> +
> +    install -d ${D}/${sysconfdir}/dhcp/dhclient.d
> +    install -m 755 ${WORKDIR}/ntp.sh ${D}/${sysconfdir}/dhcp/dhclient.d/
>  }
> =20
>  PACKAGES +=3D "ntpdate sntp ${PN}-tickadj ${PN}-utils"
> @@ -124,6 +128,7 @@ RSUGGESTS_${PN} =3D "iana-etc"
>  FILES_${PN} =3D "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/in=
it.d/ntpd ${libdir} \
>      ${NTP_USER_HOME} \
>      ${systemd_unitdir}/ntp-units.d/60-ntpd.list \
> +    ${sysconfdir}/dhcp/dhclient.d/ntp.sh \
>  "
>  FILES_${PN}-tickadj =3D "${sbindir}/tickadj"
>  FILES_${PN}-utils =3D "${sbindir} ${datadir}/ntp/lib"
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVp8h/AAoJEEn8ffcsOfaWRgUIAIzh7z2HwHOZxGYq/0qmt+5H
9rpV6XuoL0JQT8kAI04iqX2dGJDEyrI8vOs3LXXWKmG7BrMVc66jnuuiKs1LFz83
E0xCcN56f2YddmIjbzJHFWqDMv0m8kJGM8AbLhTZGzVfBzuSpEpqmMhyN7kHkQDm
BcGHHJFAXrutLsFswQhea8x09qDZuzc7sLkL9KJCBdgKdOExiXJggr6mp/1nl3sh
M33ZgZ73A21Dq47RXtvYh/3YE0pyUr65kh+LSqawk3lbm+T/y1uYNKZv1GLK60Cq
79pKSFjh2UHj9bNWhr+RLD7CVr4GDCVg2fxfBj/dNplCsZGunIoRYYi6wCsJtk8=
=y6Da
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--

Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5E46C60167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 16:59:37 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ZKrBB-0005kY-SZ from Joe_MacDonald@mentor.com ;
	Thu, 30 Jul 2015 09:59:37 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 30 Jul 2015 09:59:37 -0700
Received: by burninator (Postfix, from userid 1000)	id AFC0058162E; Thu, 30
	Jul 2015 12:59:02 -0400 (EDT)
Date: Thu, 30 Jul 2015 12:59:02 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <rongqing.li@windriver.com>
Message-ID: <20150730165902.GE6457@mentor.com>
References: <1438050989-15233-1-git-send-email-rongqing.li@windriver.com>
	<1438050989-15233-2-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1438050989-15233-2-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] ntp: get parameters from dhcp
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
X-List-Received-Date: Thu, 30 Jul 2015 16:59:37 -0000
X-Groupsio-MsgNum: 56443
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Content-Disposition: inline

--//IivP0gvsAy3Can
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [PATCH 2/2] ntp: get parameters from dhcp] On 15.07.28 (Tue 10:36) ro=
ngqing.li@windriver.com wrote:

> From: Li Wang <li.wang@windriver.com>
>=20
> the script ntp.sh is called by dhcp client,
> it can get some parameters from dhcp.
>=20
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/files/ntp.sh   | 61 ++++++++++++++++=
++++++
>  meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb |  5 ++
>  2 files changed, 66 insertions(+)
>  create mode 100755 meta-networking/recipes-support/ntp/files/ntp.sh
>=20
> diff --git a/meta-networking/recipes-support/ntp/files/ntp.sh b/meta-netw=
orking/recipes-support/ntp/files/ntp.sh
> new file mode 100755
> index 0000000..ca53a97
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntp/files/ntp.sh
> @@ -0,0 +1,61 @@
> +#!/bin/sh
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

Same comment here about the hard-coded CONF location rather than having
it reflect ${sysconfdir}.

-J.

> +SAVECONF=3D${SAVEDIR}/${CONF##*/}.predhclient.${interface}
> +
> +ntp_replace_conf() {
> +        echo "$1" | diff -q ${CONF} - > /dev/null 2>&1
> +        if [ $? -eq 1 ]; then
> +            echo "$1" > ${CONF}
> +	    if [ -x /sbin/restorecon ]; then
> +                restorecon ${CONF} >/dev/null 2>&1
> +            fi
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
> 2.1.4
>=20
--=20
-Joe MacDonald.
:wq

--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVulfWAAoJEEn8ffcsOfaWOKMH/A3K4MgW2IAPQvD1LGhNHzV0
DLcUwAXs3f1yDcbOeDF7t52sojskEpKQ+9xhv/nAjXrxfymCzZ63dZ9xhbWaDpnu
oXTnWPTiCtK5UJvlvsLfn7tpo99boIPJrUTuGisGafFG7gH5PgZ1RZZttYOXezJ4
8nfMJA0TyKEVmQ2+N14jqIgq6tZQcCsdQo9BYEpZ5O5MNYK+TDY6xkYyUKwBQIOn
Bb5bTRrMdglXLIfnC5Ot9aeXK9OlqGko7JmDOf7eZZyNz6rIYCY/cYvadCgz2ShL
jBtOBCQ7gfe3tBJPf0SDTaAR1DXOECQTtAZsPZkrrfkpxvPgL/WLzK53zTkcbA4=
=bh+g
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--

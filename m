Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8F75A7147B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 20:55:02 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XvBWJ-0004Lq-EF from Joe_MacDonald@mentor.com ;
	Sun, 30 Nov 2014 12:55:03 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Sun, 30 Nov 2014 12:55:02 -0800
Received: by burninator (Postfix, from userid 1000)	id 5165058044A; Sun, 30
	Nov 2014 15:55:02 -0500 (EST)
Date: Sun, 30 Nov 2014 15:55:02 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Message-ID: <20141130205502.GS3886@mentor.com>
References: <20141121140331.GA20204@mentor.com>
	<1417075397-2168-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417075397-2168-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] open-iscsi : add recipe
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
X-List-Received-Date: Sun, 30 Nov 2014 20:55:03 -0000
X-Groupsio-MsgNum: 53094
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BVQ1RKc6+nLPB5pT"
Content-Disposition: inline

--BVQ1RKc6+nLPB5pT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.  I made one minor tweak to the "add includes" patch to
remove trailing whitespace.

-J.

[[oe] [meta-networking][PATCH v2] open-iscsi : add recipe] On 14.11.27 (Thu=
 16:03) Li xin wrote:

> Open-iSCSI project is a high performance, transport
> independent, multi-platform implementation of RFC3720.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../files/iscsi_sysfs.c-add-include-files.patch    | 26 +++++++++++++++++
>  .../open-iscsi/files/open-iscsi.service            | 18 ++++++++++++
>  .../open-iscsi/open-iscsi_2.0-871.bb               | 34 ++++++++++++++++=
++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/open-iscsi/files/iscs=
i_sysfs.c-add-include-files.patch
>  create mode 100644 meta-networking/recipes-daemons/open-iscsi/files/open=
-iscsi.service
>  create mode 100644 meta-networking/recipes-daemons/open-iscsi/open-iscsi=
_2.0-871.bb
>=20
> diff --git a/meta-networking/recipes-daemons/open-iscsi/files/iscsi_sysfs=
=2Ec-add-include-files.patch b/meta-networking/recipes-daemons/open-iscsi/f=
iles/iscsi_sysfs.c-add-include-files.patch
> new file mode 100644
> index 0000000..43c1c36
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/open-iscsi/files/iscsi_sysfs.c-add-=
include-files.patch
> @@ -0,0 +1,26 @@
> +From e8ecb307b6402b39d033e20f4df4f3374e7c0685 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 21 Nov 2014 12:02:51 +0900
> +Subject: [PATCH] usr/iscsi_sysfs.c : add include files
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + usr/iscsi_sysfs.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/usr/iscsi_sysfs.c b/usr/iscsi_sysfs.c
> +index cb9a5a1..f6bd78a 100644
> +--- a/usr/iscsi_sysfs.c
> ++++ b/usr/iscsi_sysfs.c
> +@@ -14,6 +14,8 @@
> +  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> +  * General Public License for more details.
> +  */
> ++#include <sys/types.h>=20
> ++#include <sys/stat.h>=20
> + #include <fcntl.h>
> + #include <unistd.h>
> + #include <stdlib.h>
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-networking/recipes-daemons/open-iscsi/files/open-iscsi.=
service b/meta-networking/recipes-daemons/open-iscsi/files/open-iscsi.servi=
ce
> new file mode 100644
> index 0000000..debb2d6
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/open-iscsi/files/open-iscsi.service
> @@ -0,0 +1,18 @@
> +[Unit]
> +Description=3DOpen-iSCSI
> +Documentation=3Dman:iscsid(8) man:iscsiadm(8)
> +After=3Dnetwork.target
> +
> +[Service]
> +Type=3Dforking
> +PIDFile=3D/var/run/iscsid.pid
> +ExecStartPre=3D-/sbin/modprobe -q iscsi_tcp
> +ExecStartPre=3D-/sbin/modprobe -q ib_iser
> +ExecStart=3D/usr/sbin/iscsid -p /var/run/iscsid.pid
> +ExecStartPost=3D-/usr/sbin/iscsiadm -m node --loginall=3Dautomatic
> +ExecStopPost=3D/bin/sync
> +ExecStopPost=3D-/sbin/modprobe -r ib_iser
> +ExecStopPost=3D-/sbin/modprobe -r iscsi_tcp
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-daemons/open-iscsi/open-iscsi_2.0-87=
1.bb b/meta-networking/recipes-daemons/open-iscsi/open-iscsi_2.0-871.bb
> new file mode 100644
> index 0000000..99f8657
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/open-iscsi/open-iscsi_2.0-871.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "Open-iSCSI project is a high performance, transport \
> +independent, multi-platform implementation of RFC3720."
> +HOMEPAGE =3D "http://www.open-iscsi.org/"
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f=
833"
> +
> +SRC_URI =3D "http://www.open-iscsi.org/bits/${BP}.tar.gz"
> +SRC_URI[md5sum] =3D "0c403e8c9ad41607571ba0e6e8ff196e"
> +SRC_URI[sha256sum] =3D "bcea8746ae82f2ada7bc05d2aa59bcda1ca0d5197f05f2e1=
6744aae59f0a7dcb"
> +SRC_URI +=3D "file://iscsi_sysfs.c-add-include-files.patch \
> +    file://open-iscsi.service"
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +
> +do_compile () {
> +    oe_runmake user
> +}
> +
> +do_install_append () {
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/open-iscsi.service ${D}${systemd_unit=
dir}/system/
> +    fi
> +}
> +
> +do_install () {
> +    oe_runmake DESTDIR=3D"${D}" install_user
> +}
> +
> +inherit ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','syste=
md','',d)}
> +
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "open-iscsi.service"
> +SYSTEMD_AUTO_ENABLE =3D "enable"
> --=20
> 1.8.4.2
>=20
--=20
-Joe MacDonald.
:wq

--BVQ1RKc6+nLPB5pT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUe4QmAAoJEEn8ffcsOfaWJlEH/0WOFuTjnh/tg83LAW4i2tqe
UDpq+6Y4E/Q8I9LGApV0zrDQ1hITr6bIDgXHFiLoNoPUaZaJOd55yvV+mxi25Hqd
IKrXeKZEzX2gqo7G6UlUdlcGrheDrnns09NBUuA2lWG42R/RIZBKbYbgjIWABaCZ
r4HQ+bHJofw4kwyhCq2p8Mgekgc2K5O0KncQDPFslEp95BGWLLAZ2q+7vZ6+ags+
Hwcj03cI/GtcFtw7q019pRMRJf243GXy6PfwmG2nfV+jV6R65g3AxEsIm7iq6m4i
dCmJhlmaNaQV5cOFPq4wfShIhw/NAIvh6Qc+CfSc+AcUFAWHcjFzSXVOV9V69RI=
=R1pm
-----END PGP SIGNATURE-----

--BVQ1RKc6+nLPB5pT--

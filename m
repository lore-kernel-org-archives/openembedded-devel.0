Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0C07C60030
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 17:41:02 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XvrRe-00037W-8p from Joe_MacDonald@mentor.com ;
	Tue, 02 Dec 2014 09:41:02 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 2 Dec 2014 09:41:01 -0800
Received: by burninator (Postfix, from userid 1000)	id 51EB95814AD; Tue,  2
	Dec 2014 12:41:01 -0500 (EST)
Date: Tue, 2 Dec 2014 12:41:01 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20141202174101.GB12784@mentor.com>
References: <20141121140331.GA20204@mentor.com>
	<1417075397-2168-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20141130205502.GS3886@mentor.com> <m5koqm$ahc$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <m5koqm$ahc$1@ger.gmane.org>
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
X-List-Received-Date: Tue, 02 Dec 2014 17:41:05 -0000
X-Groupsio-MsgNum: 53155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline

--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH v2] open-iscsi : add recipe] On 14.12.02 =
(Tue 17:19) Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Joe MacDonald schreef op 30-11-14 21:55:
> > Merged, thanks.  I made one minor tweak to the "add includes" patch to=
=20
> > remove trailing whitespace.
>=20
> None of the review comments were addressed, the hardcoded paths one is a
> serious bug :/

None?  Since v2 was in master-next I had thought the issue had been
discussed off-line or on IRC, as happens with merges to master from
time-to-time, AFAICT.  Looking now, obviously the do_install* should
have been a red flag anyway, so I'm dumping the recipe.

-J.

> > [[oe] [meta-networking][PATCH v2] open-iscsi : add recipe] On 14.11.27
> > (Thu 16:03) Li xin wrote:
> >=20
> >> Open-iSCSI project is a high performance, transport independent,
> >> multi-platform implementation of RFC3720.
> >>=20
> >> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com> ---=20
> >> .../files/iscsi_sysfs.c-add-include-files.patch    | 26
> >> +++++++++++++++++ .../open-iscsi/files/open-iscsi.service            |
> >> 18 ++++++++++++ .../open-iscsi/open-iscsi_2.0-871.bb               | 34
> >> ++++++++++++++++++++++ 3 files changed, 78 insertions(+) create mode
> >> 100644
> >> meta-networking/recipes-daemons/open-iscsi/files/iscsi_sysfs.c-add-inc=
lude-files.patch
> >>
> >>=20
> create mode 100644
> meta-networking/recipes-daemons/open-iscsi/files/open-iscsi.service
> >> create mode 100644
> >> meta-networking/recipes-daemons/open-iscsi/open-iscsi_2.0-871.bb
> >>=20
> >> diff --git
> >> a/meta-networking/recipes-daemons/open-iscsi/files/iscsi_sysfs.c-add-i=
nclude-files.patch
> >> b/meta-networking/recipes-daemons/open-iscsi/files/iscsi_sysfs.c-add-i=
nclude-files.patch
> >>
> >>=20
> new file mode 100644
> >> index 0000000..43c1c36 --- /dev/null +++
> >> b/meta-networking/recipes-daemons/open-iscsi/files/iscsi_sysfs.c-add-i=
nclude-files.patch
> >>
> >>=20
> @@ -0,0 +1,26 @@
> >> +From e8ecb307b6402b39d033e20f4df4f3374e7c0685 Mon Sep 17 00:00:00
> >> 2001 +From: Li xin <lixin.fnst@cn.fujitsu.com> +Date: Fri, 21 Nov 2014
> >> 12:02:51 +0900 +Subject: [PATCH] usr/iscsi_sysfs.c : add include files=
=20
> >> + +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com> +--- +
> >> usr/iscsi_sysfs.c | 2 ++ + 1 file changed, 2 insertions(+) + +diff
> >> --git a/usr/iscsi_sysfs.c b/usr/iscsi_sysfs.c +index cb9a5a1..f6bd78a
> >> 100644 +--- a/usr/iscsi_sysfs.c ++++ b/usr/iscsi_sysfs.c +@@ -14,6
> >> +14,8 @@ +  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> >> the GNU +  * General Public License for more details. +  */ ++#include
> >> <sys/types.h> ++#include <sys/stat.h> + #include <fcntl.h> + #include
> >> <unistd.h> + #include <stdlib.h> +-- +1.8.4.2 + diff --git
> >> a/meta-networking/recipes-daemons/open-iscsi/files/open-iscsi.service
> >> b/meta-networking/recipes-daemons/open-iscsi/files/open-iscsi.service=
=20
> >> new file mode 100644 index 0000000..debb2d6 --- /dev/null +++
> >> b/meta-networking/recipes-daemons/open-iscsi/files/open-iscsi.service=
=20
> >> @@ -0,0 +1,18 @@ +[Unit] +Description=3DOpen-iSCSI=20
> >> +Documentation=3Dman:iscsid(8) man:iscsiadm(8) +After=3Dnetwork.target=
 +=20
> >> +[Service] +Type=3Dforking +PIDFile=3D/var/run/iscsid.pid=20
> >> +ExecStartPre=3D-/sbin/modprobe -q iscsi_tcp=20
> >> +ExecStartPre=3D-/sbin/modprobe -q ib_iser +ExecStart=3D/usr/sbin/iscs=
id -p
> >> /var/run/iscsid.pid +ExecStartPost=3D-/usr/sbin/iscsiadm -m node
> >> --loginall=3Dautomatic +ExecStopPost=3D/bin/sync=20
> >> +ExecStopPost=3D-/sbin/modprobe -r ib_iser +ExecStopPost=3D-/sbin/modp=
robe
> >> -r iscsi_tcp + +[Install] +WantedBy=3Dmulti-user.target diff --git
> >> a/meta-networking/recipes-daemons/open-iscsi/open-iscsi_2.0-871.bb
> >> b/meta-networking/recipes-daemons/open-iscsi/open-iscsi_2.0-871.bb new
> >> file mode 100644 index 0000000..99f8657 --- /dev/null +++
> >> b/meta-networking/recipes-daemons/open-iscsi/open-iscsi_2.0-871.bb @@
> >> -0,0 +1,34 @@ +DESCRIPTION =3D "Open-iSCSI project is a high performan=
ce,
> >> transport \ +independent, multi-platform implementation of RFC3720."=
=20
> >> +HOMEPAGE =3D "http://www.open-iscsi.org/" +LICENSE =3D "GPL-2.0"=20
> >> +LIC_FILES_CHKSUM =3D
> >> "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833" + +SRC_URI =3D
> >> "http://www.open-iscsi.org/bits/${BP}.tar.gz" +SRC_URI[md5sum] =3D
> >> "0c403e8c9ad41607571ba0e6e8ff196e" +SRC_URI[sha256sum] =3D
> >> "bcea8746ae82f2ada7bc05d2aa59bcda1ca0d5197f05f2e16744aae59f0a7dcb"=20
> >> +SRC_URI +=3D "file://iscsi_sysfs.c-add-include-files.patch \ +
> >> file://open-iscsi.service" + +TARGET_CC_ARCH +=3D "${LDFLAGS}" +=20
> >> +do_compile () { +    oe_runmake user +} + +do_install_append () { +
> >> if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
> >> then +        install -d ${D}${systemd_unitdir}/system +        install
> >> -m 0644 ${WORKDIR}/open-iscsi.service ${D}${systemd_unitdir}/system/ +
> >> fi +} + +do_install () { +    oe_runmake DESTDIR=3D"${D}" install_user=
=20
> >> +} + +inherit
> >> ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd',''=
,d)}
> >>
> >>=20
> +
> >> +SYSTEMD_PACKAGES =3D "${PN}" +SYSTEMD_SERVICE_${PN} =3D
> >> "open-iscsi.service" +SYSTEMD_AUTO_ENABLE =3D "enable" -- 1.8.4.2
> >>=20
> >>=20
> >>=20
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFUfeaWMkyGM64RGpERAjs1AJ9GBotz/SKNVovuZeTajFipaC/gbwCeLOTG
> 0IdRSUGTf1eYpvVHW9lmvPI=3D
> =3DT/wZ
> -----END PGP SIGNATURE-----
>=20
--=20
-Joe MacDonald.
:wq

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUffmtAAoJEEn8ffcsOfaWVwAIAKGivRTcTVcPIbcyjyHzYszD
gcUuBErE9SH4wydY3UtEel9cerRhWfmTdJjbcy2cDDqpVhXr2g9qiqpp7SqdhWjw
AJAskXqMOW2M+AgfEjuTLBOnZ9zgHU9nglrf6OgoDQJbFbMjgb48/WgDxo+iXT0H
ttZoRGY35oG+OR+WfVkYv22G8A/E9sn3KFI1P2FEY3PezlajcLGZwdY48RXro7sG
V7Un5Hm04cOzvrUGUOTBr9IouDMbkMSVWXsRlnH2RPQXFz821Tr3w4+xwW0r9Tho
bmp3QBs1LxQnNQAuOlg3qJPY/QwkLDgKPTcQjK5cEVcoKMRnwL+uJDe3cbQqs8c=
=Dnt9
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--

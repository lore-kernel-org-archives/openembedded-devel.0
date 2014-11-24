Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 769B6722E2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 11:32:09 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so12049023wgh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 03:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aKUh24NuDEncNdnKMEI1gLUVhHpwPYt6GiRHjWHDP+Y=;
	b=s8kCRxHaRFgz1vER763BFV7T3bjGMkON3nKDQ6bNLgkfDU74fIQBKc/hqZaJ2jU2qs
	GEDGhjkGQygP2S8MzVy9+uo/4tau3XWOBGLcsD/Th+TLK5Sey+H6WQhCcLxhzAiv9vRs
	EARpNGybtgVDXmdWXBj8wj5MUw6GN9/0YEYYkUbUCbiCzvCAJcy+2G5RE/HREeI04TYj
	cpjLHxCPSUL6Wl/pTVhHKFnMUbbheHLS8Kgo2uA9aHqhQbc0smyogzakmasvctW21I6I
	iPxjI7PreRJJKMczlPIupe/SYDGwpJ2VzYpuPNeBe5dGRsuNrhZCgs+DsFjKEuRwXRi7
	Z3FA==
X-Received: by 10.180.84.198 with SMTP id b6mr21023490wiz.41.1416828729995;
	Mon, 24 Nov 2014 03:32:09 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ga1sm11663841wib.1.2014.11.24.03.32.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Nov 2014 03:32:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Nov 2014 12:32:18 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141124113218.GD2456@jama>
References: <1416555843-1935-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1416555843-1935-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] open-iscsi : add new recipe
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
X-List-Received-Date: Mon, 24 Nov 2014 11:32:11 -0000
X-Groupsio-MsgNum: 53008
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline

--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2014 at 03:44:03PM +0800, Li xin wrote:
> Open-iSCSI project is a high performance, transport independent,
> multi-platform implementation of RFC3720.

Causes new QA warning:

open-iscsi-2.0-871: open-iscsi requires /bin/bash, but no providers in its =
RDEPENDS [file-rdeps]


>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../files/iscsi_sysfs.c-add-include-files.patch    | 26 ++++++++++++++++
>  .../open-iscsi/files/open-iscsi.service            | 18 +++++++++++
>  .../open-iscsi/open-iscsi_2.0-871.bb               | 35 ++++++++++++++++=
++++++
>  3 files changed, 79 insertions(+)
>  create mode 100644 meta-oe/recipes-support/open-iscsi/files/iscsi_sysfs.=
c-add-include-files.patch
>  create mode 100644 meta-oe/recipes-support/open-iscsi/files/open-iscsi.s=
ervice
>  create mode 100644 meta-oe/recipes-support/open-iscsi/open-iscsi_2.0-871=
=2Ebb
>=20
> diff --git a/meta-oe/recipes-support/open-iscsi/files/iscsi_sysfs.c-add-i=
nclude-files.patch b/meta-oe/recipes-support/open-iscsi/files/iscsi_sysfs.c=
-add-include-files.patch
> new file mode 100644
> index 0000000..43c1c36
> --- /dev/null
> +++ b/meta-oe/recipes-support/open-iscsi/files/iscsi_sysfs.c-add-include-=
files.patch
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
> diff --git a/meta-oe/recipes-support/open-iscsi/files/open-iscsi.service =
b/meta-oe/recipes-support/open-iscsi/files/open-iscsi.service
> new file mode 100644
> index 0000000..debb2d6
> --- /dev/null
> +++ b/meta-oe/recipes-support/open-iscsi/files/open-iscsi.service
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
> diff --git a/meta-oe/recipes-support/open-iscsi/open-iscsi_2.0-871.bb b/m=
eta-oe/recipes-support/open-iscsi/open-iscsi_2.0-871.bb
> new file mode 100644
> index 0000000..c8a87d3
> --- /dev/null
> +++ b/meta-oe/recipes-support/open-iscsi/open-iscsi_2.0-871.bb
> @@ -0,0 +1,35 @@
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
> +
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRzF0IACgkQN1Ujt2V2gBwR1QCgq/cVXhb5+Xt+IXY/+HC4heD3
wKYAoKaGOjua7d3UyBSLc1m2mADL9WFw
=oTGC
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--

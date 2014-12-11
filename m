Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id DC05872571
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 03:28:07 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lf10so3549390pab.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 19:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=ME+H+YvJ3Og03d+a6fziaNoVT/QuSD4TCq7AieWNhBM=;
	b=mT0Xips0uO9bb8WTp0VhclrwuGQnQnQOQ5y49aXj4MexK3sFpejCv9RPAp0JKhBCLe
	c0YKhlBJuMP+X+PPLLA2fl/6sMzLoOaWHsZbKeeDsplyw5uuyw+mkPh8pa4pgVJI5jXR
	8tTMIK1Xs+ngVyt049vmLu/M0WxvqjiSe2c9f3clM1AcCtifnKpjcbf/crQVGdcT1ZJo
	TZgvdPaAdMvqZDU7UTONkf17GuPsN2E3tbp6lqFuoMBKKWt1sPGaafDyWCZQp0INMxN1
	KYw2BtFzsaFwBXpH6gia5A1N6ARxtAf2dACgBogxYqFirtctW/zBU4vu2ybvE/loiu8R
	9Tvg==
X-Received: by 10.66.231.141 with SMTP id tg13mr13234590pac.122.1418268488530; 
	Wed, 10 Dec 2014 19:28:08 -0800 (PST)
Received: from [192.168.0.27] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id fr1sm5462733pbb.32.2014.12.10.19.28.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Dec 2014 19:28:07 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1418268031-26550-1-git-send-email-biannm@cn.fujitsu.com>
Date: Wed, 10 Dec 2014 19:28:06 -0800
Message-Id: <074B11CB-6F17-4FDA-82C6-D373E8CF7F87@gmail.com>
References: <1418268031-26550-1-git-send-email-biannm@cn.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1993)
Subject: Re: [meta-networking][PATCH] drbd: Add recipes
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
X-List-Received-Date: Thu, 11 Dec 2014 03:28:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 10, 2014, at 7:20 PM, Bian Naimeng <biannm@cn.fujitsu.com> =
wrote:
>=20
> DRBD is a block device which is designed to build high availability =
clusters.
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
> .../recipes-support/drbd/drbd/drbd.service         | 12 +++++
> meta-networking/recipes-support/drbd/drbd_8.4.4.bb | 55 =
++++++++++++++++++++++
> 2 files changed, 67 insertions(+)
> create mode 100644 =
meta-networking/recipes-support/drbd/drbd/drbd.service
> create mode 100644 meta-networking/recipes-support/drbd/drbd_8.4.4.bb
>=20
> diff --git a/meta-networking/recipes-support/drbd/drbd/drbd.service =
b/meta-networking/recipes-support/drbd/drbd/drbd.service
> new file mode 100644
> index 0000000..6b6ab30
> --- /dev/null
> +++ b/meta-networking/recipes-support/drbd/drbd/drbd.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=3DDRBD Service
> +After=3Dnetwork.target
> +
> +[Service]
> +Type=3Doneshot
> +RemainAfterExit=3Dyes
> +ExecStart=3D@LIBEXECDIR@/drbd-helper startxxx

is that a typo ? or did you mean startxxx

> +ExecStop=3D@LIBEXECDIR@/drbd-helper stop
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb =
b/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
> new file mode 100644
> index 0000000..c7a6973
> --- /dev/null
> +++ b/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
> @@ -0,0 +1,55 @@
> +SUMMARY =3D "BD driver for Linux"
> +DESCRIPTION =3D "DRBD mirrors a block device over the network to =
another machine.\
> +DRBD mirrors a block device over the network to another machine.\
> +Think of it as networked raid 1. It is a building block for\
> +setting up high availability (HA) clusters."
> +
> +HOMEPAGE =3D "http://www.drbd.org/"
> +SECTION =3D "kernel/userland"
> +
> +RDEPENDS_${PN} +=3D "bash perl"
> +
> +LICENSE =3D "GPLv2+"
> +
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D5574c6965ae5f583e55880e397fbb018"
> +
> +SRC_URI =3D "http://oss.linbit.com/${BPN}/8.4/${BPN}-${PV}.tar.gz \
> +           file://drbd.service \
> +          "
> +
> +SRC_URI[md5sum] =3D "b51815343c1a9151e2936b3b97520388"
> +SRC_URI[sha256sum] =3D =
"a056219c5c23b079c3354179f7a1b9f55d47e573a4cd3178f2ef4c15604288f0"
> +
> +inherit autotools-brokensep systemd

why brokensep ?

> +
> +EXTRA_OECONF =3D "--with-utils                  \
> +                --without-km                  \
> +                --with-initdir=3D/etc/init.d    \
> +                --without-pacemaker           \
> +                --without-rgmanager           \
> +                --without-bashcompletion      \
> +                --with-distro debian          \
> +               "
> +
> +do_configure (){
> +    oe_runconf
> +}
> +
> +SYSTEMD_SERVICE_${PN} =3D "drbd.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +do_install_append() {
> +    if =
${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}/${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/drbd.service =
${D}/${systemd_unitdir}/system
> +        install -d ${D}/${libexecdir}
> +        install -m 755 ${D}/${sysconfdir}/init.d/drbd =
${D}/${libexecdir}/drbd-helper
> +
> +        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
> +            ${D}${systemd_unitdir}/system/drbd.service
> +    fi
> +}
> +
> +FILES_${PN} +=3D =E2=80=9Crun"

should this be relative to prefix or something ?

> +FILES_${PN} +=3D "${base_libdir}/drbd"
> +FILES_${PN}-dbg +=3D "${base_libdir}/drbd/.debug"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



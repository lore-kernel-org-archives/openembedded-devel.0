Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id A9D277783E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Mar 2017 10:16:09 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g10so3500691wrg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Mar 2017 02:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7y1XQ7xmf1iiV1PJuPCFtG3EYAxxVUR4ekYWAdprxzk=;
	b=RY9aVHjCyWNfRZzEGtrvPRiQ8BBX+/wf0QDDDiqkXJRrL8h5binC464M9RO8w7acCm
	VeeeWmcR7x+LW9xOzm1Ut4qbzMAXu2Vy+qofWpGDDES6oHUK1ezGYBNRxx8bosP+ET7W
	6ODhq+boE3ykBGBOQel/CMyj9nAau5W5lyMOJpxVleCJP2XiZv5Ib/9AtPSpV80YmOQT
	EeZOGkOfCiSlsk+5ybB2lmDptJxbMjWUloiGTfa2UIJr5zDrAROFpvdMm02fRvxuf3uz
	jB7NNH80fwD8ZfVhSIXG16Jgbdyx+Fh4fsIGY/RR7Nb0SMFSQ8prn1bhlsSnUYAfzJyp
	ps/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7y1XQ7xmf1iiV1PJuPCFtG3EYAxxVUR4ekYWAdprxzk=;
	b=Bir73azzKBwfTPeBOpP3JPBqctWIw007MipLoNW8iZn5NxLhRzLC1R7XOXAMnW8zDL
	zPpMjEsX47FTxUaPDt1CvBATR6XCRqf9qhLYJg7IxzCKYk6NSYb4o2pt8IyAL4/zpvQv
	PrQOzwsSB8DvzC3svLEKRXEEmza95u70YYeXCnUZHs0Vi992lr8N28zGQVjHWQy6XMGT
	/4CI8fRfZovaS0I/6TnAJJZw0szT2pN5A8zfujHqOprzmsvDO765ySv3RLRyxspvqV8T
	ihacqkMG+fleSc5JvRQ9Vh5vOc3RvhWLLF3l7A+Bg03TnE8e9hRa9qkCoi5AgqiSlMxr
	Sh3A==
X-Gm-Message-State: AMke39mohf7nt36V+4mk3WjKtWbZFD38/CgXJLluvUCWjgrWjqGeB01lm5HqI5WOrCv5tA==
X-Received: by 10.223.139.154 with SMTP id o26mr4271276wra.56.1488968169934;
	Wed, 08 Mar 2017 02:16:09 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id y1sm4047305wme.15.2017.03.08.02.16.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Mar 2017 02:16:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Mar 2017 11:16:10 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170308101610.GA3279@jama>
References: <20170307071349.16444-1-raj.khem@gmail.com>
	<20170307071349.16444-4-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170307071349.16444-4-raj.khem@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 04/14] gpm: Update to use git src uri
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
X-List-Received-Date: Wed, 08 Mar 2017 10:16:10 -0000
X-Groupsio-MsgNum: 65720
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2017 at 11:13:39PM -0800, Khem Raj wrote:
> Additional patches are upstream to fix build with gcc6 and clang
> Add systemd unit file
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  =20
=2E..
>  =20
> diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.patch b/=
meta-oe/recipes-support/gpm/gpm/processcreds.patch
> similarity index 100%
> rename from meta-oe/recipes-support/gpm/gpm-1.99.7/processcreds.patch
> rename to meta-oe/recipes-support/gpm/gpm/processcreds.patch
> diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb b/meta-oe/recipes-=
support/gpm/gpm_1.99.7.bb
> index bbb8c28ac..7697772ca 100644
> --- a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
> +++ b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
> @@ -5,49 +5,39 @@ SECTION =3D "console/utils"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://gpm2/core/main.c;endline=3D19;md5=3D66d3c20=
5c4e7ee5704b2ee351dfed72f"

NOTE: recipe gpm-1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2:
task do_populate_lic: Started
WARNING: gpm-1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2
do_populate_lic: Could not copy license file
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/gpm=
/1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2/git/gpm2/core/main.c
to
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/gpm=
/1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2/license-destdir/gpm/=
main.c:
[Errno 2] No such file or directory:
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/gp=
m/1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2/git/gpm2/core/main.=
c'
ERROR: gpm-1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2
do_populate_lic: QA Issue: gpm: LIC_FILES_CHKSUM points to an invalid
file:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/gpm=
/1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2/git/gpm2/core/main.c
[license-checksum]
NOTE: recipe gpm-1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2:
task do_configure: Started
NOTE: recipe gpm-1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2:
task do_populate_lic: Succeeded

> =20
> +PV .=3D"+git${SRCREV}"

Isn't it better to rename the recipe to gpm_git.bb and set whole version
inside the recipe?

>  PR =3D "r2"
> =20
>  DEPENDS =3D "ncurses"
> =20
> -SRC_URI =3D "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
> +SRC_URI =3D "git://github.com/telmich/gpm;protocol=3Dgit;branch=3Dmaster=
 \

You can drop protocol and branch parameters as it's default.

>             file://no-docs.patch \
>             file://processcreds.patch \
> -           file://eglibc-2.17.patch \
> -           file://remove_nested_functions.patch \
>             file://init"
> =20
> -inherit autotools-brokensep update-rc.d
> +SRCREV =3D "1fd19417b8a4dd9945347e98dfa97e4cfd798d77"
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools-brokensep update-rc.d systemd
> =20
>  INITSCRIPT_NAME =3D "gpm"
>  INITSCRIPT_PARAMS =3D "defaults"
> =20
> -#export LIBS =3D "-lm"
> -
> -# all fields are /* FIXME: gpm 1.99.13 */
> -# gpm-1.99.7/src/lib/libhigh.c:171:43: error: parameter 'clientdata' set=
 but not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/lib/report-lib.c:28:21: error: parameter 'line' set but=
 not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/lib/report-lib.c:28:33: error: parameter 'file' set but=
 not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/drivers/empty/i.c:26:23: error: parameter 'fd' set but =
not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/drivers/empty/i.c:26:42: error: parameter 'flags' set b=
ut not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/drivers/etouch/i.c:34:43: error: parameter 'flags' set =
but not used [-Werror=3Dunused-but-set-parameter]
> -# gpm-1.99.7/src/drivers/msc/r.c:32:12: error: variable 'dy' set but not=
 used [-Werror=3Dunused-but-set-variable]
> -# gpm-1.99.7/src/drivers/msc/r.c:32:8: error: variable 'dx' set but not =
used [-Werror=3Dunused-but-set-variable]
> -# cc1: all warnings being treated as errors
> -CFLAGS +=3D "-Wno-extra -Wno-error=3Dunused-but-set-parameter -Wno-error=
=3Dunused-but-set-variable"
> -
> -# twiddler is WIP in 1.99.7 and probably not worth fixing (a lot of chan=
ges in gpm-2-dev after 1.99.7
> -# gpm-1.99.7/src/drivers/twid/twiddler.c:503:14: error: cast to pointer =
=66rom integer of different size [-Werror=3Dint-to-pointer-cast]
> -# /gpm-1.99.7/src/mice.c:221:5: error: (near initialization for 'mice[32=
].init') [-Werror]
> -CFLAGS +=3D "-Wno-error=3Dint-to-pointer-cast -Wno-error"
> -
> -do_install () {
> -    oe_runmake 'DESTDIR=3D${D}' install
> -    install -m 0644 src/headers/gpm.h ${D}${includedir}
> -    install -d ${D}/${sysconfdir}/init.d
> -    install -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
> -    cd ${D}${libdir} && ln -sf libgpm.so.1.19.0 libgpm.so.1
> +do_configure_prepend() {
> +    (cd ${S};./autogen.sh;cd -)
> +}
> +
> +do_install_append () {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
> +        install -d ${D}${systemd_system_unitdir}
> +        sed 's:@bindir@:${bindir}:' < ${WORKDIR}/gpm.service.in >${D}${s=
ystemd_system_unitdir}/gpm.service
> +    fi
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fals=
e', d)}; then
> +        install -D -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
> +    fi
> +    install -D -m 0644 ${S}/src/headers/gpm.h ${D}${includedir}/gpm.h
>  }
> -SRC_URI[md5sum] =3D "9fdddf5f53cb11d40bb2bb671d3ac544"
> -SRC_URI[sha256sum] =3D "6071378b24494e36ca3ef6377606e7e565040413c8670475=
3a162d2180af32ee"
> +
> +SYSTEMD_SERVICE_${PN} =3D "gpm.service"
> =20
>  FILES_${PN} +=3D "${datadir}/emacs"
> --=20
> 2.12.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWL/Z6QAKCRA3VSO3ZXaA
HBnEAKCd/5S1DQ9mzxRp4jjaNsu0/Ra+lgCeLe3dlq5ypKfmg1NxAfynq5Q/h+Q=
=jymD
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--

Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QK2mz-0007Rd-F1
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 08:20:53 +0200
Received: by ewy5 with SMTP id 5so52505ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 23:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=RpQHO4Mean80ooSgiOxsgc0Mk2oGRQQ9i3KYEA07nQo=;
	b=FxAzG6VC216h45qz3ZudavoDFaqEUCIgJPNAGm89wctS73aRwGNTpAN25Qzs9YeQpm
	fneppT3CHnFOvXec/6ctX1jIhqwTQaeAijynXTa8nFNzlft7tHSgXlTyab3qfsBkVhQE
	mbsn8MQB0+0/2OSQTPSQajTAxxeWh/eBOY04Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=i1Usphrc/IRSPfegZTcBoWe3+/eCEb6rMlQr6F3b+G7QJYtocC3Y9LZ7/b4GwyTtjI
	s6fZ5g3NgoLtRzK2/49pG8FSQTAqvfHmdFVD/Og1ULuTra+n+N7jPQFd91+711tSkI+j
	gxmWs0pqUmflrUYsW7dy2w537J27Kxc+djP8I=
Received: by 10.14.15.78 with SMTP id e54mr4131479eee.80.1305094687204; Tue,
	10 May 2011 23:18:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Tue, 10 May 2011 23:17:37 -0700 (PDT)
In-Reply-To: <fe1c32740aeeb35847e5da470d9dec1583ba9610.1305027503.git.Martin.Jansa@gmail.com>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
	<fe1c32740aeeb35847e5da470d9dec1583ba9610.1305027503.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 May 2011 23:17:37 -0700
Message-ID: <BANLkTik6=EJ0vt59kQM2KR0GJji1M+nvdA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/9] xinput-calibrator: add new version 0.7.5 and include .inc to recipe directly
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
X-List-Received-Date: Wed, 11 May 2011 06:20:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 4:40 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =C2=A0.../xinput-calibrator/xinput-calibrator.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 12 ----------
> =C2=A0.../xinput-calibrator/xinput-calibrator_0.6.1.bb =C2=A0 | =C2=A0 17=
 ---------------
> =C2=A0.../xinput-calibrator/xinput-calibrator_0.7.5.bb =C2=A0 | =C2=A0 22=
 ++++++++++++++++++++
> =C2=A03 files changed, 22 insertions(+), 29 deletions(-)
> =C2=A0delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinpu=
t-calibrator.inc
> =C2=A0delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinpu=
t-calibrator_0.6.1.bb
> =C2=A0create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinpu=
t-calibrator_0.7.5.bb
>
> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator=
.inc b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc
> deleted file mode 100644
> index 691a45c..0000000
> --- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DESCRIPTION =3D "A generic touchscreen calibration program for X.Org"
> -HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/xinput_calibrator=
"
> -LICENSE =3D "MIT/X11"
> -DEPENDS =3D "virtual/libx11 libxi"
> -
> -INC_PR =3D "r8"
> -
> -inherit autotools
> -
> -RDEPENDS_${PN} =3D "xinput"
> -RRECOMMENDS_${PN} =3D "pointercal-xinput"
> -
> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator=
_0.6.1.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.=
6.1.bb
> deleted file mode 100644
> index 2eb3cc9..0000000
> --- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.6.1.=
bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -require xinput-calibrator.inc
> -
> -LIC_FILES_CHKSUM =3D "file://src/calibrator.cpp;endline=3D22;md5=3D998e2=
38a7638a7446eaeb02398f691fc"
> -SRC_URI =3D "git://github.com/tias/xinput_calibrator.git;protocol=3Dgit"
> -
> -SRCREV =3D "d2ce98b3f638667dd64b6d718721379b2dc750a7"
> -PR =3D "${INC_PR}.0"
> -S =3D "${WORKDIR}/git/"
> -
> -do_install_append() {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 scripts/xinput_calibrator_po=
intercal.sh ${D}${bindir}/xinput_calibrator_once.sh
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${bindir}/xinput_calibrator_x11 ${D}${=
bindir}/xinput_calibrator
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/applications/
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 scripts/xinput_calibrator.de=
sktop ${D}${datadir}/applications/xinput-calibrator.desktop
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 scripts/xinput_calibrator_ge=
t_hal_calibration.sh ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
> -}
> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator=
_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.=
7.5.bb
> new file mode 100644
> index 0000000..4024883
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.=
bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "A generic touchscreen calibration program for X.Org"
> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/xinput_calibrator=
"
> +LICENSE =3D "MIT/X11"
> +LIC_FILES_CHKSUM =3D "file://src/calibrator.cpp;endline=3D22;md5=3D998e2=
38a7638a7446eaeb02398f691fc"
> +DEPENDS =3D "virtual/libx11 libxi"
> +
> +inherit autotools
> +
> +RDEPENDS_${PN} =3D "xinput"
> +RRECOMMENDS_${PN} =3D "pointercal-xinput"
> +
> +SRC_URI =3D "http://github.com/downloads/tias/xinput_calibrator/xinput_c=
alibrator-${PV}.tar.gz"


this is causing some gripe.

$ wget http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator=
-0.7.5.tar.gz
--2011-05-10 23:16:17--
http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-0.7.5.=
tar.gz
Resolving github.com... 207.97.227.239
Connecting to github.com|207.97.227.239|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://github.com/downloads/tias/xinput_calibrator/xinput_calibr=
ator-0.7.5.tar.gz
[following]
--2011-05-10 23:16:17--
https://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-0.7.5=
.tar.gz
Connecting to github.com|207.97.227.239|:443... connected.
ERROR: certificate common name `*.github.com' doesn't match requested
host name `github.com'.
To connect to github.com insecurely, use `--no-check-certificate'.


Which seems to be a known problem with wget as described here
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D409938

So one option we  have is to cache the tar on angstrom mirror.

> +SRC_URI[md5sum] =3D "20da0a2055a5a75962add8c6b44f60fa"
> +SRC_URI[sha256sum] =3D "baa4ddca49ec94c27ba4c715bfa26692fec1132103e92721=
3c3169e475d3d971"
> +
> +S =3D "${WORKDIR}/xinput_calibrator-${PV}"
> +
> +do_install_append() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 scripts/xinput_calibrator_po=
intercal.sh ${D}${bindir}/xinput_calibrator_once.sh
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 scripts/xinput_calibrator_ge=
t_hal_calibration.sh ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
> +}
> --
> 1.7.5.rc3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



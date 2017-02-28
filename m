Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 03F2472FC4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:27:17 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id l37so2259656wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 08:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iId3uSSp/ePG19o8f99KFx+H+It1zfMB3CVzInhkFCI=;
	b=RacV8OIOnb7MgzrGibpHcGxrgYZeYY8RqYfQwBaN9exm8fvu+hJujpGlZ7PtJztRz7
	jLeXLQOB+fvO3iOt0XbC+Il/0ky3LyNtR+1eD3E2j4sfeOUaYW+udVtAo0iZ4cUBlor8
	f6wlA3pe7bf4EEbT0dWRRb7SN7a+aydBMnZ0EvPsTZhoXwA4S1N40SQdPbffPthOpWCS
	AA+7eakDJ5Ft+lcF9UP8cWl2wfFCehMeoWOyIpcEandMQlqyaCYlbTasvetP/K24iu5y
	aYO2jv3e4JnO1OUbeOv+6c+N2UiolHZTGbCasQcvv+TboIQbli573PMLD/RsoXEN80OT
	BrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iId3uSSp/ePG19o8f99KFx+H+It1zfMB3CVzInhkFCI=;
	b=gecmIpY9DvwVSC8aSxVwyPMM/NdHGbZ1kEBx9i+nbrgrsvA9N3tuVNMlveBd1F0HLJ
	9wud5JJnqgG+tMBCuLMlyQUwYoy+r5bEKRJ90JtyoWIZj/rohbCftnKdQ5wQ0KUF7CxS
	f6uRxhMSoah4mV04mCFBd6x8znotXzm9wFrF2QOb4isFCw2fRtOVNodbwYQkFOoQ0nFo
	g/wEgLCP4dmVGJzIJcp10IWO0qFOLyduTS1owl2BPR+2lWSf1pY+UNz/zqHLTSUNn/vF
	tQBli/NTeS4ukzEYo0YYDLFWqrq39wzO0Bp58fTMI5xFBOrZeNVg2zQaza4AuG1+UKxR
	DLdg==
X-Gm-Message-State: AMke39kBbSI44aAsp5l/qTwzQc1hQceDyZ06gMa4sefEbWFz390VrM1DChTNmN8MWi0Isg==
X-Received: by 10.223.139.83 with SMTP id v19mr2980929wra.142.1488299238417;
	Tue, 28 Feb 2017 08:27:18 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v18sm2973016wrc.41.2017.02.28.08.27.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 Feb 2017 08:27:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 28 Feb 2017 17:27:20 +0100
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20170228162720.GC3275@jama>
References: <20170228155405.15144-1-pkj@axis.com>
MIME-Version: 1.0
In-Reply-To: <20170228155405.15144-1-pkj@axis.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] syslog-ng: Run autoreconf twice to avoid problems with libtool
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
X-List-Received-Date: Tue, 28 Feb 2017 16:27:18 -0000
X-Groupsio-MsgNum: 65612
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline

--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 04:54:04PM +0100, Peter Kjellerstedt wrote:
> syslog-ng has sub-projects with their own autotools configurations.
> Something has been messed up after the switch to RSS and now it
> requires autoreconf to be run twice to fully update all files.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc      | 11 ++++++++++-
>  meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb |  2 --
>  2 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/re=
cipes-support/syslog-ng/syslog-ng.inc
> index 21d1748..a5e1bfe 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -22,7 +22,7 @@ SRC_URI =3D "http://www.balabit.com/downloads/files/sys=
log-ng/sources/${PV}/source
>             file://configure.ac-add-option-enable-thread-tls-to-manage-.p=
atch \
>  "
> =20
> -inherit autotools systemd pkgconfig update-rc.d
> +inherit autotools gettext systemd pkgconfig update-rc.d
> =20
>  EXTRA_OECONF =3D " \
>      --enable-dynamic-linking \
> @@ -55,6 +55,15 @@ PACKAGECONFIG[json] =3D "--enable-json,--disable-json,=
json-c,"
>  PACKAGECONFIG[tcp-wrapper] =3D "--enable-tcp-wrapper,--disable-tcp-wrapp=
er,tcp-wrappers,"
>  PACKAGECONFIG[geoip] =3D "--enable-geoip,--disable-geoip,geoip,"
> =20
> +do_configure_prepend() {
> +	olddir=3D$(pwd)
> +	cd ${AUTOTOOLS_SCRIPT_PATH}
> +
> +	ACLOCAL=3D"$ACLOCAL" autoreconf -Wcross --verbose --install --force ${E=
XTRA_AUTORECONF} -I ${S}/m4 ${ACLOCALEXTRAPATH} || die "extra autoreconf ex=
ecution failed."
> +
> +	cd $olddir

Please don't use tabs, all layers except oe-core are using 4 spaces for
indentation.

> +}
> +
>  do_install_prepend() {
>      sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
>      sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/system=
d/*.service
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb b/meta-=
oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> index bee1e19..73609af 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> @@ -13,5 +13,3 @@ SRC_URI +=3D " \
> =20
>  SRC_URI[md5sum] =3D "e9f401615e92e5eb27396c995c1446ba"
>  SRC_URI[sha256sum] =3D "7be11df31ac7d716f1f952e22b5ae8e2049edd633a41b223=
776a853d9106f4e7"
> -
> -PNBLACKLIST[syslog-ng] ?=3D "Fails to build with RSS http://errors.yocto=
project.org/Errors/Details/130631/"
> --=20
> 2.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLWk5wAKCRA3VSO3ZXaA
HEX1AJ9UIigSQXaqdQaCE6blDYX6WFnqtACfXwxNxWwl4jzHhU903rVaHoJ7N18=
=BfBo
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--

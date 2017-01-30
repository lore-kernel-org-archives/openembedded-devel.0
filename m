Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A64276022F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 22:13:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so11590376wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 14:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0tJPBF8j4G9kw9ikY4k8z4DWGfN9x6NuehD6L+4E9HE=;
	b=exbcW4jKy35c159/SBLtlV6sgf5vcaaYKuijh0D65iM4XBO8zkTXWGQdeNiw2jX/1G
	5smuYR22QtonCW1+VqGiC/jsPUWltxvvEcXuUS59B3vnnlEy/eKE1QXvZZ4HwUk9+GjE
	feywm6C4eKeFJ9F3klhh+2ShVFPuf0MiGlUF/h+iwoggqBPR/uKYiLKDL9TVxiw4Wrvi
	EzRTJ9LG/fg4hdVGQnZHDc7LvU9lOAoLnKJPIyuF+k+qjkgE2YOwigpI+3wfFB1r23nH
	C+8EzzkA96FKa3D7w3JTqZkNNKyOq4b7eugu+EwCwspqTUfn1XT4TQyAl7uFHWTmJJeD
	xdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0tJPBF8j4G9kw9ikY4k8z4DWGfN9x6NuehD6L+4E9HE=;
	b=AmUHxK0H6ORCDgnzLGItsFOQ/iRfJCkKPmxy+BO62gm+upErk1vc6mnZHy2GbN4mkv
	39AHa9n+kO9e4f7xbEwF+EamnbmLwh3Y+mZYfg0OJLhVTRpuHhwP3KhRci/E54gYi3T8
	uDjePvsBGmiKLGHCZoufyk7yEwkmuSAyv9t4kJkzlTfmRORoXlmqNHQz3mao+wbl7LDo
	8bYgnT6+hyIBCz7pPiUQJ87fsYOPURmf0KFvks9B22N84Hk0+jExotzUXWMXYT23odr8
	9psLZsEF5aB04pNzy8lYfzqdEiB+YoJ1/UMKyujoi/Ffk2StYc2b05zJh3HI0gno1TXb
	iecg==
X-Gm-Message-State: AIkVDXJ6LuOz6RHcvaHWOB/HwtBFrZVIZ9IVb5VegytqwzeNtOFg41N6hTsCmC5O8ymBzQ==
X-Received: by 10.28.87.19 with SMTP id l19mr16528703wmb.95.1485814397130;
	Mon, 30 Jan 2017 14:13:17 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x25sm24947411wrx.27.2017.01.30.14.13.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 14:13:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Jan 2017 23:13:17 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170130221317.GD13746@jama>
References: <F44878C7-F939-43ED-A849-F9392C7B604D@viavisolutions.com>
MIME-Version: 1.0
In-Reply-To: <F44878C7-F939-43ED-A849-F9392C7B604D@viavisolutions.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-qt5] populate_sdk_ext fails
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
X-List-Received-Date: Mon, 30 Jan 2017 22:13:18 -0000
X-Groupsio-MsgNum: 64943
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Content-Disposition: inline

--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 08:23:28PM +0000, Mike Nicholson wrote:
> Hello,
>=20
> I sent the following the the openembedded-issues email list last month wi=
th no response.  I wanted to follow up with openembedded-devel in case =E2=
=80=98issues=E2=80=99 wasn=E2=80=99t the right mailing list.

This ML is correct one, openembedded-issues is quite dead with only 3
e-mails in last 5 years.

> I=E2=80=99m attempting to generate an extensible SDK that includes the me=
ta-qt5 layer.  Generating a standard sdk via Yocto works just fine but gene=
rating the extensible sdk fails with the following error:
> =20
> | NOTE: Executing create_sdk_files ...
> | DEBUG: Executing shell function create_sdk_files
> | touch: cannot touch '/home/nic47222/Projects/viavi-platform/viavi-bsp/b=
uild/tmp/work/mts-poky-linux-gnueabi/viavi-image-qt5/1.0-r0/sdk-ext/image//=
opt/poky/2.1.1/sysroots/x86_64-pokysdk-linux/usr/bin/qt5/qt.conf': No such =
file or directory
> =20
> It appears that here https://github.com/meta-qt5/meta-qt5/blob/9aa870eecf=
6dc7a87678393bd55b97e21033ab48/classes/populate_sdk_qt5_base.bbclass#L7 the=
 directory that should contain the qt.conf file does not exist.
> =20
> Are there known issues with the populate_sdk_ext command and the meta-qt5=
 layer?
> =20
> I can get generate the extensible SDK just fine if I make the following c=
hanges:

This looks OK to me, not sure why you're first one to report that (I'm
not using extensible SDKs), could you please send proper patch with this
(as described in README file)?

> diff --git a/classes/populate_sdk_qt5_base.bbclass b/classes/populate_sdk=
_qt5_base.bbclass
> index b6ce596..b66fe25 100644
> --- a/classes/populate_sdk_qt5_base.bbclass
> +++ b/classes/populate_sdk_qt5_base.bbclass
> @@ -4,6 +4,7 @@ inherit qmake5_paths
> create_sdk_files_prepend () {
>      # Generate a qt.conf file to be deployed with the SDK
>      qtconf=3D${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt=
=2Econf
> +    mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}
>      touch $qtconf
>      echo '[Paths]' >> $qtconf
>      echo 'Prefix =3D ${OE_QMAKE_PATH_PREFIX}' >> $qtconf
> --
> 2.7.4
> =20
> =20
> Thank you in advance for any help.
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWI+6fQAKCRA3VSO3ZXaA
HN91AKCmxqnRybhf9eYSUEpaytNM8UzdRwCgibGkBJiShDskFvnIkqmZX/LPNlg=
=eL1s
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--

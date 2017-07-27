Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 215A577E83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 04:45:42 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id k190so27363951pgk.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 21:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=TmBXDFA1H1ziW2xGHuWkrIONsBLdFaakaNWBaiDSRoc=;
	b=H66484N35GAW6adxzspAsBu086W34HkgGPBavJ7J+tm/egzVo05Q3bUDysn/E0Uvir
	I2I0i0TbUT8S3wWMiAnP+6R9TFnQ5JKkw6lAeyeJfUtDcIdlOq1df3RQpyPFlC6Mypne
	o7srMBLSvQn7jbt+/HxWagHrEjRUAHHcKo3Ce6qt7LzDNT7oDdOIOnN4HLctG8rkL5bd
	wfujtnkTaD+FrEFjezO8ctHAu/zL0TGBGxdx02bk8SjJ2VuJqTN2J24sufIzdDqI1lOo
	t/r3QuT7o8HmcKW+8jfNAmnbHgkFAJZBp2s9nhObIX1+qwNZrMWwd/AWoSuKKXNWbLR1
	77Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=TmBXDFA1H1ziW2xGHuWkrIONsBLdFaakaNWBaiDSRoc=;
	b=uK72VRsF0dzUTVy+XaT7xO/xr7GepkERd5giEHc/w3sFkd7xV4mAZvEufaeSXDtTo6
	NxqONmk8OhiLAuvGgm4+bWGt4h19mZ0v309D+cV0bV4VWm6fweHmsHbcUAxcJAXjMRL2
	kmD7QaOfIeOYuSeak+o5i63wFIAMcrJmE5PJtppCc/CANPqMtACm0eBG3N67I1kz8jep
	tV3qBt0iTzUsQJ32eDxDJJGd0/eOHc6NCumT/rCjkkN8Z7z8HwFhjwn4jd/jbCStMCgP
	73GvlMP+j20uvxjSekz3JhTOL3HsgI18nN03Od/Usk+tQEGsiZx0mGLlG6BqO3yo2D32
	eLkw==
X-Gm-Message-State: AIVw110gvXoi4IhuVq6Rwg9t24XgPHr+oHyJ7w0ACfe90aoY6w0m5GDq
	sXhCIuEYwZEnrg==
X-Received: by 10.84.133.193 with SMTP id f59mr3144369plf.316.1501130743430;
	Wed, 26 Jul 2017 21:45:43 -0700 (PDT)
Received: from Khems-MacBook-Pro.local ([2601:646:8882:b8c::397b])
	by smtp.gmail.com with ESMTPSA id p78sm976190pfa.46.2017.07.26.21.45.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 21:45:42 -0700 (PDT)
To: Flavian Manea <flavian.manea@rinftech.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <VI1PR10MB068863542F730ACA8867F5FE8FB90@VI1PR10MB0688.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <158b26cc-6342-3521-6508-7d8ca0e5a03a@gmail.com>
Date: Wed, 26 Jul 2017 21:45:36 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:55.0)
	Gecko/20100101 Thunderbird/55.0
MIME-Version: 1.0
In-Reply-To: <VI1PR10MB068863542F730ACA8867F5FE8FB90@VI1PR10MB0688.EURPRD10.PROD.OUTLOOK.COM>
Cc: Stefan Andritoiu <stefan.andritoiu@rinftech.com>
Subject: Re: OpenJdk9
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
X-List-Received-Date: Thu, 27 Jul 2017 04:45:43 -0000
X-Groupsio-MsgNum: 67886
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="QCW1LkXrrvvi58WTWESAJkWctSpjGdCBk"

--QCW1LkXrrvvi58WTWESAJkWctSpjGdCBk
Content-Type: multipart/mixed; boundary="MIQtv8PQje2wPAdJwUIv8gikqnNQaMR2g";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Flavian Manea <flavian.manea@rinftech.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: Stefan Andritoiu <stefan.andritoiu@rinftech.com>
Message-ID: <158b26cc-6342-3521-6508-7d8ca0e5a03a@gmail.com>
Subject: Re: [oe] OpenJdk9
References: <VI1PR10MB068863542F730ACA8867F5FE8FB90@VI1PR10MB0688.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <VI1PR10MB068863542F730ACA8867F5FE8FB90@VI1PR10MB0688.EURPRD10.PROD.OUTLOOK.COM>

--MIQtv8PQje2wPAdJwUIv8gikqnNQaMR2g
Content-Type: text/plain; charset=windows-1250
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/26/17 9:22 AM, Flavian Manea wrote:
> Hello guys,
>=20
>=20
>=20
> I am trying to make an openJdk9, based on what have been done on the op=
enJdk8 recipes (excluding patches)., and I am struggling with some proble=
ms relating to "./configure" part, in the do_configure step (which is not=
 specified in the recipe).
>=20
>=20
> I suspect that yocto/autotools/autoconf tries to look for configure.ac,=
 but in our case, the ./configure script comes directly configured from t=
he repository and there is no need "regenerate" it.
>=20
>=20
> A part of the log can be seen here:
>=20
> "
>=20
> | autoreconf: configure.ac: tracing
> | autoreconf: configure.ac: creating directory $TOPDIR/common/autoconf/=
build-aux
> | autoreconf: cannot create $TOPDIR/common/autoconf/build-aux: No such =
file or directory
> | autoreconf: configure.ac: not using Libtool
> | autoreconf: running: /home/fmanea/buildPulsar8/wr-core/build-intel-x8=
6/tmp/sysroots/x86_64-linux/usr/bin/autoconf --include=3D/home/fmanea/bui=
ldPulsar8/wr-core/build-intel-x86/tmp/work/x86_64-linux/openjdk-9-native/=
102b14-r0/jdk9-d2982a786f53/common/autoconf/ --include=3D/home/fmanea/bui=
ldPulsar8/wr-core/build-intel-x86/tmp/work/x86_64-linux/openjdk-9-native/=
102b14-r0/jdk9-d2982a786f53/common/autoconf/build-aux/ --force
> | autoreconf: configure.ac: not using Autoheader
> | autoreconf: configure.ac: not using Automake
> | autoreconf: running: gnu-configize
> | gnu-configize: cannot create $TOPDIR/common/autoconf/build-aux: No su=
ch file or directory
> | cp: cannot create regular file '/common/autoconf/build-aux/': No such=
 file or directory
> | gnu-configize: cp failed with exit status: 1
> | autoreconf: gnu-configize failed with exit status: 1
> | ERROR: autoreconf execution failed.
> | ERROR: Function failed: do_configure (log file is located at /home/fm=
anea/buildPulsar8/wr-core/build-intel-x86/tmp/work/x86_64-linux/openjdk-9=
-native/102b14-r0/temp/log.do_configure.16943)
> "
>=20
>=20
> Has anyone struggled with ./configure/make parts in yocto, or is this i=
ssue familiar to someone?
>=20

you can override do_configure if you dont want default behavior as
defined in autotools class which is to regenerate configure scripts
using autoreconf. you could do something like

do_configure() {
    oe_runconf
}

>=20
> Thank you,
>=20
> Flavian
>=20
>=20
> RINF Tech
> Flavian Manea
> flavian.manea<mailto:gabriel.simion@rinftech.com>@rinftech.com<mailto:g=
abriel.simion@rinftech.com> | www.rinftech.com<http://www.rinftech.com>
> 4 Gara Herastrau Street, Building B =96 Skanska Green Court, 3rd floor,=
 2nd District, Bucharest Romania
>=20


--MIQtv8PQje2wPAdJwUIv8gikqnNQaMR2g--

--QCW1LkXrrvvi58WTWESAJkWctSpjGdCBk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAll5b/QACgkQuwUzVZGdMxRxBwCfV8q/z9AfgOoOPUAzTph1fdaP
sTgAnRCmNCS6NWj5+ygjl3/CgjCw+z4B
=YKyF
-----END PGP SIGNATURE-----

--QCW1LkXrrvvi58WTWESAJkWctSpjGdCBk--

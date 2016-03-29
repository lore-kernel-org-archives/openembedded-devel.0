Return-Path: <jobol@koumoul.net>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id A598D6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 08:20:01 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id e185so9853110vkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-transfer-encoding;
	bh=eugzM7/ZI8NQfmHesifx3rP9HRFCiNCAQsWzexNpgVY=;
	b=LjiApIC/l0TNzHWWvnrdYksXahgeXL3BQwkjO8VIFPiSwR59Fav44WrOKeAfa1q+Nt
	wtEHwEs+DJ3O+icuvuJyAtKAFlsREEUhczhjh6uNAJj18gsEzRpy8ApDljIPX8Nfh3BN
	D8+YW/EcMbRWPQ1wgl99rImYeFxc8KG5T2eyA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-transfer-encoding;
	bh=eugzM7/ZI8NQfmHesifx3rP9HRFCiNCAQsWzexNpgVY=;
	b=p1uR23+bTpcJ1kJj3GFzGfAvYcNROAvFlIt12Qs8XUHepedrOXh+Q+p/8sU3RbH8LL
	yD+yvCrhKFmVmOoof7pb5VTADsQY+R6O4gsvpQHr6lUtOF58vxVWDFSrs3zluzUMzl7L
	MfgdMRTvP5cJPzBHYwlIuDB9yxYpfN8GvIFtvs91Q9JeHAbYVtC8hz2UqyqdeBs+UoAJ
	uYcWB/THRIBMhS1mXmQ8OrfLl1FnChmiPmCbA+zDve1J7DibJJrY8YYF4oPoCbT/tYXU
	n0j0LNyB3Bbx0++6D2JP+Wq7Nwpq4HLNg3aOfIr0n3iyF5ftc6smBV4IQ6kfoz+HcyMZ
	Qg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=eugzM7/ZI8NQfmHesifx3rP9HRFCiNCAQsWzexNpgVY=;
	b=Aekos+xOZGBIYa6xpy2xooDpduA02HYyfeXYbc4SQPdGsIEawm0psDd2PlbhuVVMJP
	UcD0bo6Suc+kubkE9LbSL4mCBvYViMx2m9T9ZKvl11uLrtK1dO98SCBiVDoOGInhbdn9
	+ZQuHuvUi61MGHdFrgV+cNHeZ3+z3W0OwQ7TEe/hbz0hDm0erg5Og9j2gMr7G83n6IUh
	+Vm40jgaSXxj3u5EuX9JvZgcY5567qj8J9TQe1x0Qgs/k6LRMQYOoGGab7SgehNOVlt7
	yHpUYc+Rp+OFIpkJACVmTSg7rcC9aJ8C9+fb5j2h+uZMqp/BHRXtM1fDeofbk7E9fDn2
	J2iw==
X-Gm-Message-State: AD7BkJJcMMeF3/1u8Nqp9SY4iNWDKPRZQjokki09rtNo3o1Vic/eAX/CyD6zuebfgwp0X2gaqYXCdwSuvKZ2Pw==
MIME-Version: 1.0
X-Received: by 10.31.44.77 with SMTP id s74mr487349vks.4.1459239602691; Tue,
	29 Mar 2016 01:20:02 -0700 (PDT)
Reply-To: jose.bollo@iot.bzh
Sender: jobol@koumoul.net
Received: by 10.159.35.143 with HTTP; Tue, 29 Mar 2016 01:20:02 -0700 (PDT)
X-Originating-IP: [2a01:e34:ee5c:ee50:d6be:d9ff:fea3:db03]
In-Reply-To: <56FA39A7.4030205@mlbassoc.com>
References: <1459238795-12674-1-git-send-email-jose.bollo@iot.bzh>
	<56FA39A7.4030205@mlbassoc.com>
Date: Tue, 29 Mar 2016 10:20:02 +0200
X-Google-Sender-Auth: gobS85ZBd4RIj9LcGK4ACZ-zKuI
Message-ID: <CA+LDafABV55oxnpcwB4i_zbSG63A=HvNNR_Wzxd=pD+ZRxkHaw@mail.gmail.com>
From: =?UTF-8?Q?Jos=C3=A9_Bollo?= <jose.bollo@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libmicrohttp: update to version 0.9.48
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
X-List-Received-Date: Tue, 29 Mar 2016 08:20:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

spdy? because it merely disappeared.
regards
Jos=C3=A9
Jos=C3=A9 Bollo - Senior Software Engineer
www.iot.bzh



2016-03-29 10:15 GMT+02:00 Gary Thomas <gary@mlbassoc.com>:
> On 2016-03-29 10:06, jose.bollo@iot.bzh wrote:
>>
>> From: Jos=C3=A9 Bollo <jose.bollo@iot.bzh>
>>
>> Change-Id: I33a1acf8360d074a3310f9691ac939fe70a99f3e
>> Signed-off-by: Jos=C3=A9 Bollo <jose.bollo@iot.bzh>
>> ---
>>   .../libmicrohttpd/libmicrohttpd_0.9.34.bb          | 27
>> ----------------------
>>   .../libmicrohttpd/libmicrohttpd_0.9.48.bb          | 27
>> ++++++++++++++++++++++
>>   2 files changed, 27 insertions(+), 27 deletions(-)
>>   delete mode 100644
>> meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>>   create mode 100644
>> meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>>
>> diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.=
bb
>> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>> deleted file mode 100644
>> index e3c833b..0000000
>> --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>> +++ /dev/null
>> @@ -1,27 +0,0 @@
>> -DESCRIPTION =3D "A small C library that is supposed to make it easy to =
run
>> an HTTP server as part of another application"
>> -HOMEPAGE =3D "http://www.gnu.org/software/libmicrohttpd/"
>> -LICENSE =3D "LGPL-2.1+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9331186f4f80db7da0e724bdd655=
4ee5"
>> -SECTION =3D "net"
>> -DEPENDS =3D "libgcrypt gnutls file"
>> -
>> -SRC_URI =3D "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
>> -SRC_URI[md5sum] =3D "2947eee13c2c8affb95023a0cb6fda0c"
>> -SRC_URI[sha256sum] =3D
>> "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843be421a040be1b25a88"
>> -
>> -inherit autotools lib_package
>> -
>> -# disable spdy, because it depends on openssl
>> -EXTRA_OECONF +=3D "--disable-static --with-gnutls=3D${STAGING_LIBDIR}/.=
./
>> --disable-spdy"
>> -
>> -PACKAGECONFIG ?=3D "curl"
>> -PACKAGECONFIG_append_class-target =3D "\
>> -        ${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile', '=
',
>> d)} \
>> -"
>> -PACKAGECONFIG[largefile] =3D "--enable-largefile,--disable-largefile,,"
>> -PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl,"
>> -
>> -do_compile_append() {
>> -       sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
>> -}
>> -
>> diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.=
bb
>> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>> new file mode 100644
>> index 0000000..892009e
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION =3D "A small C library that is supposed to make it easy to =
run
>> an HTTP server as part of another application"
>> +HOMEPAGE =3D "http://www.gnu.org/software/libmicrohttpd/"
>> +LICENSE =3D "LGPL-2.1+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9331186f4f80db7da0e724bdd655=
4ee5"
>> +SECTION =3D "net"
>> +DEPENDS =3D "libgcrypt gnutls file"
>> +
>> +SRC_URI =3D "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
>> +SRC_URI[md5sum] =3D "9c298c890088a91fe0d7ac3fec9d0097"
>> +SRC_URI[sha256sum] =3D
>> "87667e158f2bf8c691a002e256ffe30885d4121a9ee4143af0320c47cdf8a2a4"
>> +
>> +inherit autotools lib_package
>> +
>> +# disable spdy, because it depends on openssl
>> +EXTRA_OECONF +=3D "--disable-static --with-gnutls=3D${STAGING_LIBDIR}/.=
./"
>
>
> Why not make this a PACKAGECONFIG choice?
>
>> +
>> +PACKAGECONFIG ?=3D "curl"
>> +PACKAGECONFIG_append_class-target =3D "\
>> +        ${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile', '=
',
>> d)} \
>> +"
>> +PACKAGECONFIG[largefile] =3D "--enable-largefile,--disable-largefile,,"
>> +PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl,"
>> +
>> +do_compile_append() {
>> +       sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
>> +}
>> +
>>
>
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Return-Path: <jobol@koumoul.net>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id E52F660118
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 14:26:29 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id k1so20238305vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 07:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-transfer-encoding;
	bh=QYgIQh+yVIa6Me0V5gdAlGUfYG1lx1AtTtZTJxpbbpM=;
	b=UIeztag7nxCGluuEtgCTKh58wOQ1AEf9dwvQl1TNQTQ4xhmlK9jZ1hQFXbkx8UUvkY
	6yyTA8NeD8NfX9L7zyYplr8rZwJsp5EqUzfwY7qPFNTearqCTbjOAIcokATvWvMFOzm9
	Wl8QCLaooJHeQh06i9gIVzrUR7AkmIRNy/sDQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-transfer-encoding;
	bh=QYgIQh+yVIa6Me0V5gdAlGUfYG1lx1AtTtZTJxpbbpM=;
	b=cEDeQIYYMO2ZwKmGaiVCu/vNfTZ1BmUwH8TpVGjNEDutMJggxHw6qNjTXvpoqB2bDC
	h7AkbqU36O3oZyhV6UQuJknVHTLZMwXppYFMSwg7zYvhck1BrYwYsZVkxld3PRQyH0Jo
	Wxi4sJddYJSK9h8faAce/2ZPo6I5ILUD33l2eonB1ggIkJSc5jqTdi2/50+smcSWGRgD
	qLTseHptSSlsQ4d5AvdJKRFuxc3fj5F+SAVxwW/d1xfUsDuY61HEav2HnYoyCXK3ypND
	LUyf0+Yu5zCCek4IZ2YBYYPXYWZ6eJpo/gjqy+5cQ7DoDeH7g+NJqbEAWHdKKoIUaqm5
	/h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=QYgIQh+yVIa6Me0V5gdAlGUfYG1lx1AtTtZTJxpbbpM=;
	b=XEYW7DyyN/smlckiCt7ZyUkfdMeIxMVhlAI1ab6XdKYTuLrl6U7HwFp6DwVPtkIKxL
	wbTUchX3Fci/vWE4nUGGpBnbDuXzCmawqqglCYNezi1Xo46FNj7i58meabMf1YvmjZxA
	XKUg6fk3NMKfTNWCMkam2ti+zfToR6I5GU4FEqixzwyJLDXP1ohEU5AB3K/YxuVaSAqO
	ifKL0OrXFaS7mWDVli/hyK2DawfZGV0+Mwc+hPtNKvi4Ew1irOUZLtWbx7AgI1O41cRO
	AS3Fb2NoKk7R+IcG8RG38z7+pDKbhG1mDKllncuInwkd5UTxry1irtM0xmzHwS7jxj8b
	Wluw==
X-Gm-Message-State: AD7BkJIcQPdsTmSVsSppO+No/faKZnhCJIqgS8HLqnPgFBtzjza1AS2yZm2UvKkD2VNZE/ejwIS3F+MS2ZFdGA==
MIME-Version: 1.0
X-Received: by 10.159.33.172 with SMTP id 41mr1426465uac.5.1459261589444; Tue,
	29 Mar 2016 07:26:29 -0700 (PDT)
Reply-To: jose.bollo@iot.bzh
Sender: jobol@koumoul.net
Received: by 10.159.35.143 with HTTP; Tue, 29 Mar 2016 07:26:29 -0700 (PDT)
X-Originating-IP: [78.229.206.229]
In-Reply-To: <56FA4173.7030206@mlbassoc.com>
References: <1459238795-12674-1-git-send-email-jose.bollo@iot.bzh>
	<56FA39A7.4030205@mlbassoc.com>
	<CA+LDafABV55oxnpcwB4i_zbSG63A=HvNNR_Wzxd=pD+ZRxkHaw@mail.gmail.com>
	<56FA4173.7030206@mlbassoc.com>
Date: Tue, 29 Mar 2016 16:26:29 +0200
X-Google-Sender-Auth: 9XNm91rZf4JDGZpEXKJ5x8W5DhQ
Message-ID: <CA+LDafAyyiAxVDWhT_sx5OCKAOiygA84=to9UwNHp+z6GtNGPQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Mar 2016 14:26:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

well i'll not do it but if you want to improve it please
Jos=C3=A9 Bollo - Senior Software Engineer
www.iot.bzh



2016-03-29 10:48 GMT+02:00 Gary Thomas <gary@mlbassoc.com>:
> On 2016-03-29 10:20, Jos=C3=A9 Bollo wrote:
>>
>> spdy? because it merely disappeared.
>> regards
>> Jos=C3=A9
>> Jos=C3=A9 Bollo - Senior Software Engineer
>> www.iot.bzh
>>
>
> Then please improve the comment above this line as it doesn't really
> convey this information very well.
>
>
>>
>> 2016-03-29 10:15 GMT+02:00 Gary Thomas <gary@mlbassoc.com>:
>>>
>>> On 2016-03-29 10:06, jose.bollo@iot.bzh wrote:
>>>>
>>>>
>>>> From: Jos=C3=A9 Bollo <jose.bollo@iot.bzh>
>>>>
>>>> Change-Id: I33a1acf8360d074a3310f9691ac939fe70a99f3e
>>>> Signed-off-by: Jos=C3=A9 Bollo <jose.bollo@iot.bzh>
>>>> ---
>>>>    .../libmicrohttpd/libmicrohttpd_0.9.34.bb          | 27
>>>> ----------------------
>>>>    .../libmicrohttpd/libmicrohttpd_0.9.48.bb          | 27
>>>> ++++++++++++++++++++++
>>>>    2 files changed, 27 insertions(+), 27 deletions(-)
>>>>    delete mode 100644
>>>> meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>>>>    create mode 100644
>>>> meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>>>>
>>>> diff --git
>>>> a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>>>> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>>>> deleted file mode 100644
>>>> index e3c833b..0000000
>>>> --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>>>> +++ /dev/null
>>>> @@ -1,27 +0,0 @@
>>>> -DESCRIPTION =3D "A small C library that is supposed to make it easy t=
o
>>>> run
>>>> an HTTP server as part of another application"
>>>> -HOMEPAGE =3D "http://www.gnu.org/software/libmicrohttpd/"
>>>> -LICENSE =3D "LGPL-2.1+"
>>>> -LIC_FILES_CHKSUM =3D
>>>> "file://COPYING;md5=3D9331186f4f80db7da0e724bdd6554ee5"
>>>> -SECTION =3D "net"
>>>> -DEPENDS =3D "libgcrypt gnutls file"
>>>> -
>>>> -SRC_URI =3D "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz=
"
>>>> -SRC_URI[md5sum] =3D "2947eee13c2c8affb95023a0cb6fda0c"
>>>> -SRC_URI[sha256sum] =3D
>>>> "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843be421a040be1b25a88"
>>>> -
>>>> -inherit autotools lib_package
>>>> -
>>>> -# disable spdy, because it depends on openssl
>>>> -EXTRA_OECONF +=3D "--disable-static --with-gnutls=3D${STAGING_LIBDIR}=
/../
>>>> --disable-spdy"
>>>> -
>>>> -PACKAGECONFIG ?=3D "curl"
>>>> -PACKAGECONFIG_append_class-target =3D "\
>>>> -        ${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile',
>>>> '',
>>>> d)} \
>>>> -"
>>>> -PACKAGECONFIG[largefile] =3D "--enable-largefile,--disable-largefile,=
,"
>>>> -PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl,"
>>>> -
>>>> -do_compile_append() {
>>>> -       sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
>>>> -}
>>>> -
>>>> diff --git
>>>> a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>>>> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>>>> new file mode 100644
>>>> index 0000000..892009e
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>>>> @@ -0,0 +1,27 @@
>>>> +DESCRIPTION =3D "A small C library that is supposed to make it easy t=
o
>>>> run
>>>> an HTTP server as part of another application"
>>>> +HOMEPAGE =3D "http://www.gnu.org/software/libmicrohttpd/"
>>>> +LICENSE =3D "LGPL-2.1+"
>>>> +LIC_FILES_CHKSUM =3D
>>>> "file://COPYING;md5=3D9331186f4f80db7da0e724bdd6554ee5"
>>>> +SECTION =3D "net"
>>>> +DEPENDS =3D "libgcrypt gnutls file"
>>>> +
>>>> +SRC_URI =3D "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz=
"
>>>> +SRC_URI[md5sum] =3D "9c298c890088a91fe0d7ac3fec9d0097"
>>>> +SRC_URI[sha256sum] =3D
>>>> "87667e158f2bf8c691a002e256ffe30885d4121a9ee4143af0320c47cdf8a2a4"
>>>> +
>>>> +inherit autotools lib_package
>>>> +
>>>> +# disable spdy, because it depends on openssl
>>>> +EXTRA_OECONF +=3D "--disable-static --with-gnutls=3D${STAGING_LIBDIR}=
/../"
>>>
>>>
>>>
>>> Why not make this a PACKAGECONFIG choice?
>>>
>>>> +
>>>> +PACKAGECONFIG ?=3D "curl"
>>>> +PACKAGECONFIG_append_class-target =3D "\
>>>> +        ${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile',
>>>> '',
>>>> d)} \
>>>> +"
>>>> +PACKAGECONFIG[largefile] =3D "--enable-largefile,--disable-largefile,=
,"
>>>> +PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl,"
>>>> +
>>>> +do_compile_append() {
>>>> +       sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
>>>> +}
>>>> +
>
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


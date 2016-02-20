Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5052A772BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Feb 2016 15:04:42 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id c10so69636233pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Feb 2016 07:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=HeW6KsiWc3QmSfW0ztEVVMiiOsJISSHc8/lq9g2lEMU=;
	b=tCZ7dNJVjURcUYwIOMugj9SGE/aIOiDghcodllwUyXQmHruhIFdY/8hjC71Sdjx2wA
	EoW0GjV5IOrBaCU77jMJE7ctJ7l8Y5vG8ffKwaVovvXZNkQkFpwYUV17KkigDzzfTv6u
	pnsowrx/+XLnQHC9xp+SAahE97V8mX4FtTFqCjs9uHFErMbEDsQRXGQv0O+iiNB07SO+
	V1zU9rGKaXFoZnXciF871yojhb6KItaGNeTr8SYoEdFmnugZZ8HHnh6aMi/wXIUEAqcL
	onErWKdTcupd47UWYTTxIRF+I7ibyiItxBhbwNhfEtDTCo1YT8mkl4O3Y3Udl9l8RgBj
	aFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=HeW6KsiWc3QmSfW0ztEVVMiiOsJISSHc8/lq9g2lEMU=;
	b=T2ASE5cygmPn9aa3MW6iK9U8J41rbls13qnEyc6/EOS00u1XEqe26IYBJ2H2EnnkQd
	QBBsNJX/zy/5aArLwz/ds6YcNIfnFXLTZEVftjMAf2iYp+6jUNDQPyWxHlPtvBpWzyzX
	ayzRRVxTsaLhOSxy/QMqbA29Xd+Jvw6p52RkzmL/wdjmz5H1EXcxWLWgthzOVE4j5WOe
	XbEruhGYjcOlmRIpAp9w2nPHjQ0LXXcBkLR3GhrIcG+ewM5QFheltWekxJzXmZU4MCOh
	p9xZFNzTKvv+p22okTLYseAu31PHsXT6pA4rq8lqekUGJWnEKfAi69m0kXb/3+8Jc60K
	04aA==
X-Gm-Message-State: AG10YOQMjCYNqLQEjbzlVhDLJHXK08PJSpBKcX4qQIJM+O0AmrF5UgdxGOB/3OtwbWwFXA==
X-Received: by 10.98.34.209 with SMTP id p78mr25924192pfj.154.1455980683631;
	Sat, 20 Feb 2016 07:04:43 -0800 (PST)
Received: from [192.168.0.76] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	i23sm25172673pfj.68.2016.02.20.07.04.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 20 Feb 2016 07:04:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160220135824.GC2589@jama>
Date: Sat, 20 Feb 2016 07:04:42 -0800
Message-Id: <479214D5-4709-49EF-8150-6C05FFCE4A65@gmail.com>
References: <1455736575-2561-1-git-send-email-raj.khem@gmail.com>
	<20160220135824.GC2589@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-oe][PATCH] hostapd: Upgrade to 2.5
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
X-List-Received-Date: Sat, 20 Feb 2016 15:04:46 -0000
X-Groupsio-MsgNum: 60053
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4BE43E1E-A6E9-4D2E-9BA0-304E676F417C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4BE43E1E-A6E9-4D2E-9BA0-304E676F417C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 20, 2016, at 5:58 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Wed, Feb 17, 2016 at 11:16:15AM -0800, Khem Raj wrote:
>> Change-Id: I8e4a44297492b213dd1001d8b1499864e95b17c2
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> You're few months late:

it was on top of jethro now I see. Never mind ignore it.

>=20
> commit fcb7b50851884264dbd9764ba9781ba0b84900e7
> Author:     fan.xin <fan.xin@jp.fujitsu.com>
> AuthorDate: Mon Dec 7 14:43:16 2015 +0900
> Commit:     Martin Jansa <Martin.Jansa@gmail.com>
> CommitDate: Fri Dec 18 12:43:22 2015 +0100
>=20
>    hostapd: upgrade 2.4 -> 2.5
>=20
>> ---
>> .../recipes-connectivity/hostapd/{hostapd_2.4.bb =3D> hostapd_2.5.bb} =
 | 5 ++---
>> 1 file changed, 2 insertions(+), 3 deletions(-)
>> rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.4.bb =3D> =
hostapd_2.5.bb} (90%)
>>=20
>> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb =
b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
>> similarity index 90%
>> rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
>> rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
>> index 901c7ea..e9158ca 100644
>> --- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
>> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
>> @@ -17,6 +17,8 @@ SRC_URI =3D " \
>>     file://init \
>>     file://hostapd.service \
>> "
>> +SRC_URI[md5sum] =3D "69f9cec3f76d74f402864a43e4f8624f"
>> +SRC_URI[sha256sum] =3D =
"8e272d954dc0d7026c264b79b15389ec2b2c555b32970de39f506b9f463ec74a"
>>=20
>> S =3D "${WORKDIR}/hostapd-${PV}/hostapd"
>>=20
>> @@ -41,6 +43,3 @@ do_install() {
>> }
>>=20
>> CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
>> -
>> -SRC_URI[md5sum] =3D "04578f3f2c3eb1bec1adf30473813912"
>> -SRC_URI[sha256sum] =3D =
"6fe0eb6bd1c9cbd24952ece8586b6f7bd14ab358edfda99794e79b9b9dbd657f"
>> --
>> 2.7.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_4BE43E1E-A6E9-4D2E-9BA0-304E676F417C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbIgIoACgkQuwUzVZGdMxTtfACff7seYpeoDQkvFjhYDEYDowr4
DMAAnRFP7mNN8jPxlSZ4gBQP+yG+xJOz
=CcJu
-----END PGP SIGNATURE-----

--Apple-Mail=_4BE43E1E-A6E9-4D2E-9BA0-304E676F417C--

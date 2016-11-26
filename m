Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6F96FEF3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 06:03:04 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p66so7284538pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 22:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:subject:date:references:to:in-reply-to:message-id; 
	bh=UzoMK/IOnj/e/ITk0KJ33TFSmKlL8ugsEdoC7fcm1Ig=;
	b=k4UDdmfhEsRA3XaMTF9kB4UPC6T10Us1jxzJ0Yc99KfPuKpz1eZc2aZ3IWQCLMz+QE
	XL65uKEchCdsJHPnM+Vl8sQArV8xqMUN78YkyBed3IGfIYSigpziHBYHiHg9X6XR/Tfe
	joGrYcLsZaQNckByNf268xqCXi01FF5v3zEELTPkt+md3TJ+TXgwfs1nHqJUitOFOvmc
	9oaJJVC9wmwp8bRwdsRVKReu+h1WRSpcoRb0+3gK+rMfd4fcj9TT3kN3Ya2wtmVXEimL
	fczhhI24wannpxJmLxzDMwfKyncXdhgQCgjN7nMNWs6EhCaP1Re9QyZ8syq+xeYKrfZG
	JZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:subject:date:references:to
	:in-reply-to:message-id;
	bh=UzoMK/IOnj/e/ITk0KJ33TFSmKlL8ugsEdoC7fcm1Ig=;
	b=SnkWiZJuLqrGYTlbAWnp/0l/Jaw18SUPl/sazU34VvzEoAAwThusR1vcHdBVOr5I8C
	cyDcYO+ioubNHRRmBCXMk6xjL9crhVtJ29cmhbNEMk+V88CKMCM3YkZmsGwlbrW1HVIM
	Bukf9ty7F8nty74PQrHnvDmJ1LXDz4A+xAPDC720Vw119cUh+1sOlTCTDfFiI80ZS1Qq
	bTRgM3sfz687CPplNPLMoff6v+i9BQ3pzb/NScFp3CyszNC0N0sqUfhE0D2LjQfvnWZc
	IlTxy2GVmqFNkt57MnpDMvyPKHTiUZ8NyNdfMnf+ZytGFWG1Wrquf9E4OYcKrsbrtSBM
	V3Ug==
X-Gm-Message-State: AKaTC03hKBNOsD0qXYIBtLG1I9YAUZubTtvQHSPsZK6/k9e4BHKs4OOvphgeiPHbV+ZaBw==
X-Received: by 10.99.66.198 with SMTP id p189mr20981262pga.30.1480140186167;
	Fri, 25 Nov 2016 22:03:06 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:e574:db7a:d1a9:c4a6?
	([2601:646:8882:b8c:e574:db7a:d1a9:c4a6])
	by smtp.gmail.com with ESMTPSA id 2sm1526574pgy.27.2016.11.25.22.03.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 22:03:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Fri, 25 Nov 2016 22:03:04 -0800
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-29-raj.khem@gmail.com>
	<20161126001614.GC8369@jama>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20161126001614.GC8369@jama>
Message-Id: <4C69AE7B-EF59-471E-A2A4-2C115B84D011@gmail.com>
X-Mailer: Apple Mail (2.3251)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH 29/49] dante: Add recipe for 1.4.1
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
X-List-Received-Date: Sat, 26 Nov 2016 06:03:05 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 25, 2016, at 4:16 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Wed, Nov 23, 2016 at 01:21:49AM -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../recipes-protocols/dante/dante_1.4.1.bb         | 47 =
++++++++++++++++++++++
>> 1 file changed, 47 insertions(+)
>> create mode 100644 =
meta-networking/recipes-protocols/dante/dante_1.4.1.bb
>>=20
>> diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb =
b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
>> new file mode 100644
>> index 0000000..dbb86fb
>> --- /dev/null
>> +++ b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
>> @@ -0,0 +1,47 @@
>> +SECTION =3D "console/utils"
>> +SUMMARY =3D "A free SOCKS server"
>> +DESCRIPTION =3D "Dante consists of a SOCKS server and a SOCKS =
client,\
>> +implementing RFC 1928 and related standards. It is a flexible =
product\
>> +that can be used to provide convenient and secure network\
>> +connectivity. Once installed, Dante can in most cases be made\
>> +transparent to clients, providing functionality somewhat similar to\
>> +what could be described as a non-transparent Layer 4 router."
>> +HOMEPAGE =3D "http://www.inet.no/dante/"
>> +
>> +LICENSE =3D "BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D221118dda731fe93a85d0ed973467249"
>> +
>> +SRC_URI =3D "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
>> +          "
>> +SRC_URI[md5sum] =3D "68c2ce12119e12cea11a90c7a80efa8f"
>> +SRC_URI[sha256sum] =3D =
"b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d804b50b48f261c4f53"
>> +
>> +# without --without-gssapi, config.log will contain reference to =
/usr/lib
>> +# as a consequence of GSSAPI path being set to /usr by default.
>> +# --with-gssapi-path=3DPATH specify gssapi path
>> +# --without-gssapi        disable gssapi support
>> +# --enable-release        build prerelease as full release
>> +EXTRA_OECONF +=3D "--without-gssapi --sbindir=3D${bindir}"
>> +
>> +DEPENDS +=3D "flex-native bison-native"
>> +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', =
'libpam', '', d)}"
>=20
> Autodetects bunch of dependencies:
> =
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/1=
10050.html =
<http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/=
110050.html>

libpam is a hard requirement. So I have added a required distro feature =
for pam=20

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>


Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9FEF56007C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:42:14 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md12so2454426pbc.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 09:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=0LovOIL+j1y8iQf2kFdaaUYn09FKv8BeQyIyY4ICdjU=;
	b=VsOaEtmNXYDztBniPHQJ3lG+HcjgmEscQoBxOgdD36QdrVLbiMuxDLTmv0iln5XNfI
	Llp39fUMHTqQ7JnQgQvJPA12sHBlQH497A0OA5qI47DdPSDqIr/SKtJn0nQFZQLJ2jlS
	naZrtEp60xcorPUdqJU1qtR7ZLo+qBbwflHmxMbWmfabQi1r1WvbJJMhbDJ0mkjNARyV
	r5gjHSqebGpHyOKZPa5xu1gXoBhgyWPIg2THhP0TywpKl3FXscY1lJKXPpO/o3xeKt0J
	rpQQfFMM7y8XWypUV0CfYVFdqx55qU2Qu5binYr/jrsaBS15lew74mT2UNSp+L2tZzLT
	3tZA==
X-Received: by 10.68.36.230 with SMTP id t6mr12372441pbj.15.1372437735691;
	Fri, 28 Jun 2013 09:42:15 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id i16sm9703705pag.18.2013.06.28.09.42.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 09:42:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130624124241.GA3823@windriver.com>
Date: Fri, 28 Jun 2013 09:42:12 -0700
Message-Id: <D4C3EBB5-5EE3-4F1E-9F9F-8CBB1CF8E962@gmail.com>
References: <1372043456-22739-1-git-send-email-raj.khem@gmail.com>
	<20130624124241.GA3823@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Subject: Re: [meta-networking][PATCH] netcat-openbsd: Update to 1.105
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
X-List-Received-Date: Fri, 28 Jun 2013 16:42:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 24, 2013, at 5:42 AM, Joe MacDonald <Joe.MacDonald@windriver.com> =
wrote:

> [[oe] [meta-networking][PATCH] netcat-openbsd: Update to 1.105] On =
13.06.23 (Sun 20:10) Khem Raj wrote:
>=20
>> Add the missing dependency on libbsd
>> it was not building otherwise. libbsd recipes for OE-Core
>> has been ported please wait until they are applied
>>=20
>> | netcat.c:99:24: fatal error: bsd/stdlib.h: No such file or =
directory
>> |  #include <bsd/stdlib.h>
>> |                         ^
>> | compilation terminated.
>> | make: *** [netcat.o] Error 1
>> | make: *** Waiting for unfinished jobs....
>> | socks.c:41:32: fatal error: bsd/readpassphrase.h: No such file or =
directory
>> |  #include <bsd/readpassphrase.h>
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>=20
> Is there any option to disable the dependency on libbsd in the new
> version?  If it's at all possible, I'd prefer to have this as an
> optional dependency.

No there isn't. After all It a bsd tool We can hack and chop and beat it =
to submission but thats exactly why libbsd shim exists
to elegantly build BSD apps on linux without murdering them

>=20
> -J.
>=20
>> .../recipes-support/netcat/netcat-openbsd_1.105.bb |   31 =
+++++++++++++++++++
>> .../recipes-support/netcat/netcat-openbsd_1.89.bb  |   32 =
--------------------
>> 2 files changed, 31 insertions(+), 32 deletions(-)
>> create mode 100644 =
meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
>> delete mode 100644 =
meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
>>=20
>> diff --git =
a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb =
b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
>> new file mode 100644
>> index 0000000..8f6cc54
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
>> @@ -0,0 +1,31 @@
>> +require netcat.inc
>> +DESCRIPTION =3D "OpenBSD Netcat"
>> +HOMEPAGE =3D "http://ftp.debian.org"
>> +LICENSE =3D "BSD-3-Clause"
>> +
>> +DEPENDS +=3D "glib-2.0 libbsd"
>> +
>> +SRC_URI =3D =
"${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;n=
ame=3Dnetcat \
>> +           =
${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7.debian.tar.g=
z;name=3Dnetcat-patch"
>> +
>> +SRC_URI[netcat.md5sum] =3D "7e67b22f1ad41a1b7effbb59ff28fca1"
>> +SRC_URI[netcat.sha256sum] =3D =
"40653fe66c1516876b61b07e093d826e2a5463c5d994f1b7e6ce328f3edb211e"
>> +SRC_URI[netcat-patch.md5sum] =3D "e914f8eb7eda5c75c679dd77787ac76b"
>> +SRC_URI[netcat-patch.sha256sum] =3D =
"eee759327ffea293e81d0dde67921b7fcfcad279ffd7a2c9d037bbc8f882b363"
>> +
>> +S =3D "${WORKDIR}/${BPN}-${PV}"
>> +
>> +do_configure[noexec] =3D "1"
>> +
>> +do_compile() {
>> +    cd ${S}
>> +    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; =
done < ${WORKDIR}/debian/patches/series
>> +    pkgrel=3D4
>> +    oe_runmake CFLAGS=3D"$CFLAGS =
-DDEBIAN_VERSION=3D\"\\\"${pkgrel}\\\"\""
>> +}
>> +
>> +do_install() {
>> +    install -d ${D}${bindir}
>> +    install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>> +}
>> +ALTERNATIVE_PRIORITY =3D "50"
>> diff --git =
a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb =
b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
>> deleted file mode 100644
>> index 0a30de6..0000000
>> --- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -require netcat.inc
>> -DESCRIPTION =3D "OpenBSD Netcat"
>> -HOMEPAGE =3D "http://ftp.debian.org"
>> -LICENSE =3D "BSD-3-Clause"
>> -PR =3D "r2"
>> -
>> -DEPENDS +=3D "glib-2.0"
>> -
>> -SRC_URI =3D =
"${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89.orig.tar.gz;na=
me=3Dnetcat \
>> -           =
${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz;name=3D=
netcat-patch"
>> -
>> -SRC_URI[netcat.md5sum] =3D "7238ce15aae43069e96ba7faf03f153e"
>> -SRC_URI[netcat.sha256sum] =3D =
"72e844dde8a2a7cba61971d493758dbea9ef0b164bccef15fd4a36490dc77f2b"
>> -SRC_URI[netcat-patch.md5sum] =3D "00c65aa22243b76998174c733cbb64cc"
>> -SRC_URI[netcat-patch.sha256sum] =3D =
"d5b6b2bd9788114bdcfbb71acad0263720b4fdc41529e287adf451b8610f84f1"
>> -
>> -S =3D "${WORKDIR}/${BPN}-${PV}.orig"
>> -
>> -do_configure[noexec] =3D "1"
>> -
>> -do_compile() {
>> -    cd ${S}
>> -    while read line; do patch -p1 <debian/patches/$line; done =
<debian/patches/series
>> -    pkgrel=3D4
>> -    oe_runmake CFLAGS=3D"$CFLAGS =
-DDEBIAN_VERSION=3D\"\\\"${pkgrel}\\\"\""
>> -}
>> -
>> -do_install() {
>> -    install -d ${D}${bindir}
>> -    install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>> -}
>> -ALTERNATIVE_PRIORITY =3D "50"
> --=20
> -Joe MacDonald.
> :wq
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



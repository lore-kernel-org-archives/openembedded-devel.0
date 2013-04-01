Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UMjXN-0007ni-OM
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 20:32:57 +0200
Received: by mail-ea0-f175.google.com with SMTP id r16so1120701ead.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 11:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Cn3s7aeOz8RinY2W4kYIi1q8mLbuJII+YtuxtxT98So=;
	b=Y+Y24CEERpShvGmxsFlU9oAPg3eYstPOg1OGYiqAcwZkdl8C/BqnFMjLcRZjzHjG4T
	PVJsmyZHF07KPSK+2cyW20kvW6JRDHYhBuo92yldPcWIMWivE+JG4Y3zAf60iek0Rdit
	b9G5A5E/KUIRLZO1U0egSz613rmtaWFzbpXK5qyZia3nbKefecmvYGXjFPNkO7b35DpS
	OGKWVy+EMq0Gk4MihNVX3pebgWs91o9BsUsVToxmiF1GbHbxDecfo9uFIkUHbbPBlA47
	xDvAgZKs+mpanfErKIpPjklJVPkBdlguod/P/l7nRof5ntSrOYaWBEj7bwaGRR2sbQxw
	GMdw==
X-Received: by 10.14.5.137 with SMTP id 9mr40019459eel.30.1364840149003;
	Mon, 01 Apr 2013 11:15:49 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6dbb:127c:be1:5b31?
	([2001:610:612:0:6dbb:127c:be1:5b31])
	by mx.google.com with ESMTPS id ca4sm22423139eeb.15.2013.04.01.11.15.46
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 11:15:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130401181357.GK10672@windriver.com>
Date: Mon, 1 Apr 2013 20:15:47 +0200
Message-Id: <23CA3232-CC08-4140-A95E-4B6E1F10186F@dominion.thruhere.net>
References: <1364567102-6409-1-git-send-email-koen@dominion.thruhere.net>
	<20130401181357.GK10672@windriver.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkBYOXDKNJ+iOM/INvy5RAWnJdrW+KyAKV83Mx6uiiny62xx7u/99+z18wdJAZxuMYMqjL5
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add 0.21.1
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
X-List-Received-Date: Mon, 01 Apr 2013 18:32:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 apr. 2013, om 20:13 heeft Joe MacDonald =
<Joe.MacDonald@windriver.com> het volgende geschreven:

> Hey Koen,
>=20
> [[oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add =
0.21.1] On 13.03.29 (Fri 15:25) Koen Kooi wrote:
>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> ...y-link-in-sysroot-not-in-host-directories.patch | 39 =
++++++++++++++++++++++
>> .../python/python-m2crypto_0.21.1.bb               | 19 +++++++++++
>> 2 files changed, 58 insertions(+)
>> create mode 100644 =
meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysr=
oot-not-in-host-directories.patch
>> create mode 100644 =
meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
>>=20
>> diff --git =
a/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sy=
sroot-not-in-host-directories.patch =
b/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sy=
sroot-not-in-host-directories.patch
>> new file mode 100644
>> index 0000000..bcbdf24
>> --- /dev/null
>> +++ =
b/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sy=
sroot-not-in-host-directories.patch
>> @@ -0,0 +1,39 @@
>> +=46rom f11b9c71080513f9b867ba8f40613ba2ebc6e960 Mon Sep 17 00:00:00 =
2001
>> +From: Koen Kooi <koen@dominion.thruhere.net>
>> +Date: Fri, 29 Mar 2013 15:17:17 +0100
>> +Subject: [PATCH] setup.py: link in sysroot, not in host directories
>> +
>> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> +
>> +Upstream-status: Unknown
>=20
> Does this mean you haven't determined if it should be sent upstream =
yet,
> or you did and it's gone off into an apparent black hole of a mailing
> list somewhere?

The former

>=20
> -J.
>=20
>> +---
>> + setup.py | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/setup.py b/setup.py
>> +index e7c49eb..8deaa34 100644
>> +--- a/setup.py
>> ++++ b/setup.py
>> +@@ -40,7 +40,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
>> +             self.openssl =3D 'c:\\pkg'
>> +         else:
>> +             self.libraries =3D ['ssl', 'crypto']
>> +-            self.openssl =3D '/usr'
>> ++            self.openssl =3D os.environ.get( "STAGING_DIR" )
>> +       =20
>> +    =20
>> +     def finalize_options(self):
>> +@@ -49,8 +49,8 @@ class _M2CryptoBuildExt(build_ext.build_ext):
>> +=20
>> +         build_ext.build_ext.finalize_options(self)
>> +=20
>> +-        opensslIncludeDir =3D os.path.join(self.openssl, 'include')
>> +-        opensslLibraryDir =3D os.path.join(self.openssl, 'lib')
>> ++        opensslIncludeDir =3D os.environ.get( "STAGING_INCDIR" )
>> ++        opensslLibraryDir =3D os.environ.get( "STAGING_LIBDIR" )
>> +        =20
>> +         self.swig_opts =3D ['-I%s' % i for i in self.include_dirs + =
\
>> +                           [opensslIncludeDir]]
>> +--=20
>> +1.8.1.4
>> +
>> diff --git =
a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb =
b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
>> new file mode 100644
>> index 0000000..9babc04
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION =3D "A Python crypto and SSL toolkit"
>> +HOMEPAGE =3D =
"http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
>> +
>> +DEPENDS =3D "openssl swig-native"
>> +
>> +LICENSE =3D "BSD"
>> +LIC_FILES_CHKSUM =3D =
"file://LICENCE;md5=3Db0e1f0b7d0ce8a62c18b1287b991800e"
>> +
>> +SRC_URI =3D =
"http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz =
\
>> +           =
file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch"
>> +
>> +SRC_URI[md5sum] =3D "f93d8462ff7646397a9f77a2fe602d17"
>> +SRC_URI[sha256sum] =3D =
"25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
>> +
>> +S =3D "${WORKDIR}/M2Crypto-${PV}"
>> +
>> +inherit setuptools
>> +
>> +BBCLASSEXTEND =3D "native"
> --=20
> -Joe MacDonald.
> :wq




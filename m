Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UMlgk-0001vD-AM
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 22:50:46 +0200
Received: by mail-ea0-f169.google.com with SMTP id n15so1214433ead.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 13:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Lmh+1afGn0yZMA8yAGICfnd0k4O53etdBoUFMvBRM+c=;
	b=ok0L217OT7QSKrCE12n7/NBCw73s6ixCauCSiaXCtTpHnZrkJeFoa2sO5P8QqNk1rj
	JltFkKYdTD+w3koLsQvS9mo47FlfGuH69TFyF3fjfzL1dovuQWfp0zx9d1JTU9/woAsC
	fyzlpODm6CH4CNtkY9wtaY0ma5ZIi9u7A9y33M06gt2vCyd1WrUD5wr2SR8+3vbN63Ri
	JCGG+u4VDwCvAHq3+2Up7LAyICc6v/fqPGwhwr59/ICSynYWy6YB+Pps6RQB0wFNzCvx
	WWiUoOOaPA+F+6simDK9iGgYUFndnQHXOzn9mVSoEEE+IO4w9k12C9+6+gPyPko6dFlb
	uPzQ==
X-Received: by 10.14.184.68 with SMTP id r44mr29126923eem.40.1364848417368;
	Mon, 01 Apr 2013 13:33:37 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6dbb:127c:be1:5b31?
	([2001:610:612:0:6dbb:127c:be1:5b31])
	by mx.google.com with ESMTPS id h5sm23244584eem.1.2013.04.01.13.33.34
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 13:33:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130401182131.GL10672@windriver.com>
Date: Mon, 1 Apr 2013 22:33:36 +0200
Message-Id: <3B6011D6-AA55-4A46-849A-07484DEEA060@dominion.thruhere.net>
References: <1364567102-6409-1-git-send-email-koen@dominion.thruhere.net>
	<20130401181357.GK10672@windriver.com>
	<23CA3232-CC08-4140-A95E-4B6E1F10186F@dominion.thruhere.net>
	<20130401182131.GL10672@windriver.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmZiD6Uk1QnrTus4Qx+virqeSUzmeb6ofEoz/YckQJSj5NXQ7MXy54bmfwbVoMOsSKODxMR
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
X-List-Received-Date: Mon, 01 Apr 2013 20:50:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 apr. 2013, om 20:21 heeft Joe MacDonald =
<Joe.MacDonald@windriver.com> het volgende geschreven:

> [Re: [oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add =
0.21.1] On 13.04.01 (Mon 20:15) Koen Kooi wrote:
>=20
>>=20
>> Op 1 apr. 2013, om 20:13 heeft Joe MacDonald =
<Joe.MacDonald@windriver.com> het volgende geschreven:
>>=20
>>> Hey Koen,
>>>=20
>>> [[oe] [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add =
0.21.1] On 13.03.29 (Fri 15:25) Koen Kooi wrote:
>>>=20
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>> ---
>>>> ...y-link-in-sysroot-not-in-host-directories.patch | 39 =
++++++++++++++++++++++
>>>> .../python/python-m2crypto_0.21.1.bb               | 19 +++++++++++
>>>> 2 files changed, 58 insertions(+)
>>>> create mode 100644 =
meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysr=
oot-not-in-host-directories.patch
>>>> create mode 100644 =
meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
>>>>=20
>>>> diff --git =
a/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sy=
sroot-not-in-host-directories.patch =
b/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sy=
sroot-not-in-host-directories.patch
>>>> new file mode 100644
>>>> index 0000000..bcbdf24
>>>> --- /dev/null
>>>> +++ =
b/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sy=
sroot-not-in-host-directories.patch
>>>> @@ -0,0 +1,39 @@
>>>> +=46rom f11b9c71080513f9b867ba8f40613ba2ebc6e960 Mon Sep 17 =
00:00:00 2001
>>>> +From: Koen Kooi <koen@dominion.thruhere.net>
>>>> +Date: Fri, 29 Mar 2013 15:17:17 +0100
>>>> +Subject: [PATCH] setup.py: link in sysroot, not in host =
directories
>>>> +
>>>> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>> +
>>>> +Upstream-status: Unknown
>>>=20
>>> Does this mean you haven't determined if it should be sent upstream =
yet,
>>> or you did and it's gone off into an apparent black hole of a =
mailing
>>> list somewhere?
>>=20
>> The former
>=20
> Okay.  Isn't that normally 'Pending' then?  I can make that tweak in =
my
> merge, but I wanted to confirm I had the right information there =
first.

If you think 'Pending' reflects the status better than 'Unknown', go for =
it, but 'Pending' has been the catch-all for Upstream-status fields, so =
anytime you see 'Pending' you know you can't trust the Upstream-status =
field.=20

>=20
> -J.
>=20
>>=20
>>>=20
>>> -J.
>>>=20
>>>> +---
>>>> + setup.py | 6 +++---
>>>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>>>> +
>>>> +diff --git a/setup.py b/setup.py
>>>> +index e7c49eb..8deaa34 100644
>>>> +--- a/setup.py
>>>> ++++ b/setup.py
>>>> +@@ -40,7 +40,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
>>>> +             self.openssl =3D 'c:\\pkg'
>>>> +         else:
>>>> +             self.libraries =3D ['ssl', 'crypto']
>>>> +-            self.openssl =3D '/usr'
>>>> ++            self.openssl =3D os.environ.get( "STAGING_DIR" )
>>>> +       =20
>>>> +    =20
>>>> +     def finalize_options(self):
>>>> +@@ -49,8 +49,8 @@ class _M2CryptoBuildExt(build_ext.build_ext):
>>>> +=20
>>>> +         build_ext.build_ext.finalize_options(self)
>>>> +=20
>>>> +-        opensslIncludeDir =3D os.path.join(self.openssl, =
'include')
>>>> +-        opensslLibraryDir =3D os.path.join(self.openssl, 'lib')
>>>> ++        opensslIncludeDir =3D os.environ.get( "STAGING_INCDIR" )
>>>> ++        opensslLibraryDir =3D os.environ.get( "STAGING_LIBDIR" )
>>>> +        =20
>>>> +         self.swig_opts =3D ['-I%s' % i for i in self.include_dirs =
+ \
>>>> +                           [opensslIncludeDir]]
>>>> +--=20
>>>> +1.8.1.4
>>>> +
>>>> diff --git =
a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb =
b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
>>>> new file mode 100644
>>>> index 0000000..9babc04
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
>>>> @@ -0,0 +1,19 @@
>>>> +DESCRIPTION =3D "A Python crypto and SSL toolkit"
>>>> +HOMEPAGE =3D =
"http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
>>>> +
>>>> +DEPENDS =3D "openssl swig-native"
>>>> +
>>>> +LICENSE =3D "BSD"
>>>> +LIC_FILES_CHKSUM =3D =
"file://LICENCE;md5=3Db0e1f0b7d0ce8a62c18b1287b991800e"
>>>> +
>>>> +SRC_URI =3D =
"http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz =
\
>>>> +           =
file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch"
>>>> +
>>>> +SRC_URI[md5sum] =3D "f93d8462ff7646397a9f77a2fe602d17"
>>>> +SRC_URI[sha256sum] =3D =
"25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
>>>> +
>>>> +S =3D "${WORKDIR}/M2Crypto-${PV}"
>>>> +
>>>> +inherit setuptools
>>>> +
>>>> +BBCLASSEXTEND =3D "native"
>>> --=20
>>> -Joe MacDonald.
>>> :wq
>>=20
>=20
> --=20
> -Joe MacDonald.
> :wq




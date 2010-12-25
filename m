Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWaaW-0004bW-9c for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 21:19:36 +0100
Received: from f053037080.adsl.alicedsl.de ([78.53.37.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWaaN-0002qG-0G for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 20:19:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1293217263.4027.38.camel@mattotaupa>
References: <1293197342.4027.2.camel@mattotaupa>
	<1293217263.4027.38.camel@mattotaupa>
Date: Sat, 25 Dec 2010 21:19:25 +0100
Message-ID: <1293308365.4089.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAyLzIgdjJdIHhibWNfc3ZuOiBhcHBseSB1cHN0cmVhbSBwYXRjaCDCu2NvbXBsZXRlIHJlcGxhY2VtZW50IG9mIGxpYmx6byB3aXRoIGxpYmx6bzIsIGxpbnV4IHdhcyBhbHJlYWR5IGxpYmx6bzLCqw==?=
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
X-List-Received-Date: Sat, 25 Dec 2010 20:19:36 -0000
X-Groupsio-MsgNum: 27516
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-NX9BKhpCKmnXoPD7cK3r"

--=-NX9BKhpCKmnXoPD7cK3r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 24.12.2010, 20:01 +0100 schrieb Paul Menzel:
> Date: Tue, 30 Nov 2010 16:45:26 +0100

This is commit 17ccf452 [4]. My thanks go to Khem for pushing this
patch.

> Task `compile` fails with `/bin/grep: /usr/lib/libz.la: No such file or d=
irectory`.

As you can see below the actual error is the following.

	tools/TexturePacker/XBMCTex.cpp:394: undefined reference to `__lzo_init2'

[=E2=80=A6]

> 	| arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/bui=
ld/angstrom-dev/sysroots/armv7a
> 	-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-r=
egisters -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inlines-=
hidden -fPIC -DPIC -D_REENTRANT -
> 	D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfl=
oat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a=
8 -mfpu=3Dneon -mvectorize-with-neon-quad -
> 	isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr=
/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer =
-O2 -ggdb2 -fpermissive
> 	 -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOU=
RCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mn=
o-apcs-stack-check -Wa,-march=3Darmv7a=20
> 	-mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -isystem/oe/bu=
ild/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpen=
sive-optimizations -frename
> 	-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-inl=
ines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_B=
ITS=3D64 -g -D_DEBUG -Wall -O2 -mfl
> 	oat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcorte=
x-a8 -mfpu=3Dneon -mvectorize-with-neon-quad SDL_anigif.o XBTFWriter.o XBMC=
Tex.o ../../guilib/XBTF.o      -L/home/pa
> 	ul/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib =
-Wl,-rpath-link,/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnuea=
bi/usr/lib -Wl,-O1 -Wl,
> 	--hash-style=3Dgnu ../../xbmc/lib/libsquish/libsquish-arm.a -lSDL_image =
-lSDL -llzo2 -o TexturePacker
> 	| XBMCTex.o: In function `main':
> 	| /oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r=
9+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/git/tools/TexturePacker/XB=
MCTex.cpp:394: undefined reference to `__lzo_init2'
> 	| collect2: ld returned 1 exit status
> 	| make[1]: *** [TexturePacker] Error 1
> 	| make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angstro=
m-linux-gnueabi/xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d6402088c714adcb=
e/git/tools/TexturePacker'
> 	| make: *** [tools/TexturePacker/TexturePacker] Error 2
> 	| FATAL: oe_runmake failed
> 	| ERROR: Function do_compile failed
> 	NOTE: package xbmc-10.05-r9+gitr0+e2ab481ebe964321c358ab9d6402088c714adc=
be: task do_compile: Failed
> 	ERROR: TaskFailed event exception, aborting
> 	ERROR: Build of /oe/openembedded/recipes/xbmc/xbmc_svn.bb do_compile fai=
led
> 	ERROR: Task 13 (/oe/openembedded/recipes/xbmc/xbmc_svn.bb, do_compile) f=
ailed with 256
> 	ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed
> 	ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed
> 	ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed

I am sorry for messing that up.

[=E2=80=A6]


Thanks,

Paul


[4] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D17ccf45=
2ed2744555dfd70c2b25bbe7b2b5d5460

--=-NX9BKhpCKmnXoPD7cK3r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0WUcYACgkQPX1aK2wOHViTfACfYYXvL2qqvG5qKlXOZSCYMklE
LfMAniAlMS1f77+Ek1tr5pi4YeBG+Pkx
=v3Zy
-----END PGP SIGNATURE-----

--=-NX9BKhpCKmnXoPD7cK3r--

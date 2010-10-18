Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7p3t-00023k-O2 for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 14:43:34 +0200
Received: from f053035105.adsl.alicedsl.de ([78.53.35.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7p3O-00020x-Mo for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 12:43:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 14:43:01 +0200
Message-ID: <1287405781.3928.22.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: opensp_1.5: `do_compile` fails with for example `RastEventHandler.cxx:(.text+0x7f0): undefined reference to `OpenSP::Sd::execToInternal(char const*) const'`
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
X-List-Received-Date: Mon, 18 Oct 2010 12:43:34 -0000
X-Groupsio-MsgNum: 25029
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-AkKYWVgYcSrckaanMYK4"

--=-AkKYWVgYcSrckaanMYK4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


trying to build openjade to test ab83ea [1], task `do_compile` of
`opensp_1.5.bb` [2] fails with the following error with `minimal`
(eglibc) for `MACHINE =3D "beagleboard"`.

	[=E2=80=A6]
	| /bin/sh ../arm-oe-linux-gnueabi-libtool --tag=3DCXX   --mode=3Dlink arm-=
oe-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mflo=
at-abi=3Dsoftfp -mthumb-interwork -mno-thumb  -isystem/oe/build-minimal-egl=
ibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include -fexpensive-op=
timizations -fomit-frame-pointer -frename-registers -Os -fpermissive -fvisi=
bility-inlines-hidden  -L/oe/build-minimal-eglibc/minimal-dev/sysroots/armv=
7a-oe-linux-gnueabi/usr/lib -Wl,-rpath-link,/oe/build-minimal-eglibc/minima=
l-dev/sysroots/armv7a-oe-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dg=
nu -o onsgmls nsgmls.o SgmlsEventHandler.o RastEventHandler.o StringSet.o n=
sgmls_inst.o ../lib/libosp.la -lpthread
	| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-g++ -march=3Dar=
mv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwor=
k -mno-thumb -isystem/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-o=
e-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer =
-frename-registers -Os -fpermissive -fvisibility-inlines-hidden -Wl,-rpath-=
link -Wl,/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnue=
abi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -o .libs/onsgmls nsgmls.o SgmlsE=
ventHandler.o RastEventHandler.o StringSet.o nsgmls_inst.o  -L/oe/build-min=
imal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/lib ../lib/.li=
bs/libosp.so /oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-=
gnueabi/usr/lib/libstdc++.so -lm -lpthread -Wl,-rpath -Wl,/usr/lib -Wl,-rpa=
th -Wl,/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueab=
i/usr/lib
	| SgmlsEventHandler.o: In function `OpenSP::SgmlsEventHandler::startElemen=
t(OpenSP::StartElementEvent*)':
	| SgmlsEventHandler.cxx:(.text+0x1374): undefined reference to `OpenSP::St=
artElementEvent::mustOmitEnd() const'
	| RastEventHandler.o: In function `OpenSP::RastEventHandler::sgmlDecl(Open=
SP::SgmlDeclEvent*)':
	| RastEventHandler.cxx:(.text+0x7f0): undefined reference to `OpenSP::Sd::=
execToInternal(char const*) const'
	| RastEventHandler.cxx:(.text+0x814): undefined reference to `OpenSP::Sd::=
execToInternal(char const*) const'
	| RastEventHandler.cxx:(.text+0x838): undefined reference to `OpenSP::Sd::=
execToInternal(char const*) const'
	| RastEventHandler.cxx:(.text+0x85c): undefined reference to `OpenSP::Sd::=
execToInternal(char const*) const'
	| RastEventHandler.o: In function `OpenSP::RastEventHandler::attributeInfo=
(OpenSP::AttributeList const&, OpenSP::RastSubdocState::AttributeType)':
	| RastEventHandler.cxx:(.text+0x16fc): undefined reference to `OpenSP::Tok=
enizedAttributeValue::tokenLocation(unsigned int) const'
	| collect2: ld returned 1 exit status
	| make[3]: *** [onsgmls] Error 1
	| make[3]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/ar=
mv7a-oe-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5/nsgmls'
	| make[2]: *** [all] Error 2
	| make[2]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/ar=
mv7a-oe-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5/nsgmls'
	| make[1]: *** [all-recursive] Error 1
	| make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/ar=
mv7a-oe-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5'
	| make: *** [all] Error 2
	| FATAL: oe_runmake failed
	| ERROR: Function do_compile failed
	NOTE: package opensp-1.5-r2: task do_compile: Failed
	ERROR: TaskFailed event exception, aborting
	ERROR: Build of /oe/openembedded/recipes/opensp/opensp_1.5.bb do_compile f=
ailed
	ERROR: Task 12 (/oe/openembedded/recipes/opensp/opensp_1.5.bb, do_compile)=
 failed with 256
	ERROR: '/oe/openembedded/recipes/opensp/opensp_1.5.bb' failed
	ERROR: '/oe/openembedded/recipes/opensp/opensp_1.5.bb' failed

Does anyone know what might cause this?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dab83ea3=
d6e6b881480cb6665e9921b65f9b6e682
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/opensp/=
?id=3D6fe7cef27069415f2eba36bc640cf59013d4979b

--=-AkKYWVgYcSrckaanMYK4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky8QNUACgkQPX1aK2wOHVgWngCfV83WeQwDg4uq9mfohEWyiVhX
8U4An0/f1NxY1ebUgLzb12P6SzCEzGym
=hsFR
-----END PGP SIGNATURE-----

--=-AkKYWVgYcSrckaanMYK4--

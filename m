Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMFyx-000603-5Q for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 10:50:23 +0200
Received: from f053033076.adsl.alicedsl.de ([78.53.33.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMFwC-0004Zx-Ji; Tue, 17 May 2011 08:47:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2011 10:47:30 +0200
Message-ID: <1305622050.4065.31.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Graham Gower <graham.gower@gmail.com>
Subject: gs_8.64: task compile fails with `./obj/mkromfs: error while loading shared libraries: libfontconfig.so.1: cannot open shared object file: No such file or directory`
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
X-List-Received-Date: Tue, 17 May 2011 08:50:23 -0000
X-Groupsio-MsgNum: 32135
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-y00BQX3mCeIUQqPjSoVT"

--=-y00BQX3mCeIUQqPjSoVT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Graham, dear OE folks,


in commit 74d7b8e7 [1] you improved the Ghostscript recipe. Checking out
that revision

	git checkout 74d7b8e7a0c52178a8a111415586eb15d802a88b

task compile fails with the following error.

	[=E2=80=A6]=09
	arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon =
-mfloat-abi=3Dsoftfp -L/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a=
-oe-linux-gnueabi/usr/lib -Wl
	,-rpath-link,/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux=
-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -mthumb-interwork -mno-thum=
b  -DHAVE_MKSTEMP -DHAV
	E_HYPOT -DHAVE_FILE64 -DHAVE_MKSTEMP64 -DHAVE_FONTCONFIG -O2 -isystem/oe/b=
uild-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/includ=
e  -Wall -Wstrict-pro
	totypes -Wundef -Wmissing-declarations -Wmissing-prototypes -Wwrite-string=
s -Wno-strict-aliasing -Wdeclaration-after-statement -fno-builtin -fno-comm=
on -DHAVE_STDINT_H -DGX_COLOR_I
	NDEX_TYPE=3D"unsigned long long" -isystem/oe/build-minimal-eglibc/minimal-=
dev/sysroots/armv7a-oe-linux-gnueabi/usr/include -fexpensive-optimizations =
-fomit-frame-pointer -f
	rename-registers -Os -fPIC  -I./psi -I./obj -I./obj -I./base  -o ./obj/gs.=
o -c ./psi/gs.c
	rm -f ./obj/gscdefs.c
	cp ./base/gscdef.c ./obj/gscdefs.c
	./obj/mkromfs -o ./obj/gsromfs1.c \
		      -X .svn -X CVS  \
		         \
		      -c -P ./lib/../Resource/ -d Resource/ CIDFont/ CMap/ ColorSpace/ De=
coding/ Encoding/ Font/ IdiomSet/ Init/ ProcSet/ SubstCID/ -d lib/ -P ./lib=
/=20
	./obj/mkromfs: error while loading shared libraries: libfontconfig.so.1: c=
annot open shared object file: No such file or directory
	make: *** [obj/gsromfs1.c] Error 127
	make: *** Waiting for unfinished jobs....
	arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon =
-mfloat-abi=3Dsoftfp -L/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a=
-oe-linux-gnueabi/usr/lib -Wl,-rpath-link,/oe/build-minimal-eglibc/minimal-=
dev/sysroots/armv7a-oe-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -mthumb-interwork -mno-thumb  -DHAVE_MKSTEMP -DHAVE_HYPOT -DHAVE_FILE64 -D=
HAVE_MKSTEMP64 -DHAVE_FONTCONFIG -O2 -isystem/oe/build-minimal-eglibc/minim=
al-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include  -Wall -Wstrict-prototy=
pes -Wundef -Wmissing-declarations -Wmissing-prototypes -Wwrite-strings -Wn=
o-strict-aliasing -Wdeclaration-after-statement -fno-builtin -fno-common -D=
HAVE_STDINT_H -DGX_COLOR_INDEX_TYPE=3D"unsigned long long" -isystem/oe/buil=
d-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include -=
fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -fPIC =
 -I./obj -I./base  -o ./obj/gscdefs.o -c ./obj/gscdefs.c
	+ die 'oe_runmake failed'
	+ oefatal 'oe_runmake failed'
	+ echo FATAL

Do you maybe know how to fix this?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D74d7b8e=
7a0c52178a8a111415586eb15d802a88b

--=-y00BQX3mCeIUQqPjSoVT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3SNiIACgkQPX1aK2wOHVgPrQCdEhr0TnzXxsf/E14wf8HShpjO
aWEAn3tdfB4J9lEWkztFosLhJbMlkpF7
=BK4C
-----END PGP SIGNATURE-----

--=-y00BQX3mCeIUQqPjSoVT--

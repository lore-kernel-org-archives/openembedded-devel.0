Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eren@hambedded.org>) id 1TnDP9-0001Oh-A1
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2012 20:09:39 +0100
Received: by mail-ea0-f180.google.com with SMTP id f13so2940927eai.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2012 10:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent:x-gm-message-state;
	bh=gv3tyzb4LNNGMliPNL4TKj06isLS0zdsbKUZgSWrvs8=;
	b=lULhr/jBIsSpClggO3o5h+LJrFHzg7iFGVZ7MGg+MaujIu75rxTT3j7ACUBj5cdBmE
	FYl8kNkjNh9ee1bvW/GWLH6LqTzpz+vhDLCj49oYxreDmaNXPSO1obLbeGG0B7tQyw14
	ZDCeFXpwXq4U1hglFB8Hvk86gUBmorrj0R3viI0xwNRCZz3xgR1lCdXiBLo0rFsr7gjH
	yEvBvRjxW6hOsYLyayn55Vm8irz3EElbVsXsvQdHBIVvgan4GT+L8h695kXBzxaZ9AXV
	rEvqrNGjmVSfLY3j/+YXYHigCq7958LwrtjpUhV1ShPpCikk2AQgiqhxnG+94f2CAzF0
	FiRA==
X-Received: by 10.14.216.70 with SMTP id f46mr57553215eep.12.1356375288929;
	Mon, 24 Dec 2012 10:54:48 -0800 (PST)
Received: from gmail.com ([46.196.117.99])
	by mx.google.com with ESMTPS id w3sm43082090eel.17.2012.12.24.10.54.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Dec 2012 10:54:47 -0800 (PST)
Date: Mon, 24 Dec 2012 20:54:36 +0200
From: Eren =?iso-8859-1?Q?T=FCrkay?= <eren@hambedded.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20121224185436.GA1230@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQm3GWLDQ4fuIzJL/u30hQcc3CT4n0Gn45SAwsT5s8vkAVVCHbNZULOUcJY3k33mnmqZftE/
Subject: Linker Problem: Unrecognized '-Wl,-O1'
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
X-List-Received-Date: Mon, 24 Dec 2012 19:09:52 -0000
X-Groupsio-MsgNum: 42408
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I am packaging 'arpx' [0] daemon and I have a problem in linking stage.
The linker complains about unrecognized options "-Wl,-O1". It is strange
that i586-poky-linux-ld does not have an option for linker hash table
optimization, which seems to be around for a long time [1]

"-Wl,-O1" is provided by bitbake by default so I think that it is
expected to run but it fails in my configuration. What am I missing
here? I would really appreciate a hand for fixing this.

[0]: https://github.com/hambedded-linux
[1]: https://lwn.net/Articles/192624/

#### START: Stripped Bitbake Output ####

Build Configuration:
BB_VERSION        =3D "1.16.0"
TARGET_ARCH       =3D "i586"
TARGET_OS         =3D "linux"
MACHINE           =3D "alix3d3"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.3"
TUNE_FEATURES     =3D "m32 i586"
TARGET_FPU        =3D ""
meta             =20
meta-yocto        =3D "danny:09031ac2fc0f30ec577ee823fc61ff0e5d852e21"
meta-alix3d3      =3D "master:02f8693c35789471f4a3296358f0add538a1142a"
meta-hamradio     =3D "master:1e440d60699e1b03c5aec78a64a98bc3f5494e5f"

i586-poky-linux-ld --sysroot=3D/home/eren/sourcebox/yocto/poky-1.3/build/tm=
p/sysroots/alix3d3 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed  -o aprx =
aprx.o ttyreader.o ax25.o aprsis.o beacon.o config.o netax25.o erlang.o apr=
xpolls.o telemetry.o igate.o cellmalloc.o historydb.o keyhash.o parse_aprs.=
o dupecheck.o  kiss.o interface.o pbuf.o digipeater.o valgrind.o filter.o d=
prsgw.o  crc.o  agwpesocket.o netresolver.o -lpthread  -lutil    -lm
i586-poky-linux-ld: unrecognized option '-Wl,-O1'
i586-poky-linux-ld: use the --help option for usage information
make: *** [aprx] Error 1

#### END: Stripped Bitbake Output ####

--=20
    . 73! DE TA1AET
      http://linkedin.com/in/erenturkay

--huq684BweRXVnRxX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (Darwin)

iQIcBAEBAgAGBQJQ2KTrAAoJEOM7bMm6HhcTlYQP/ickdDCYprTJYmXCuMi9A38H
Gymr7rpSX2AJ/ljBUfqM+9WhTmy7K3Vha/X+61/QhkNi/6xjY+mygR6/eTPjWT3k
c1RkiSgeYP3cZYrIxusvHmpkvl9tN7vCSnxyRYeOHi2/oYO78cYAR5enLm/0MGMr
0tmGa/59+Viir/FVe+epb2Poz1PVOEl6MpO15fFW/2e5epokQTXZxHA8OdJv7vjk
2JJEeaOS8z7NPaJGl4vgL838hlRZCczse2IFdokS+NXrQ1F7WPhzjyx5LvGseR7x
dmoWIxsko7fuVYPFLUKssrZPvMddVJjFiYsz19wu046NIxEPEccIVhIEOkS19TJ1
c98pf1vKzGlCeEChEdCSPNid3+ZaKBiM4H2Lsd7z1xVB2OfAg5HDTNjBW2uultEw
UOhVjqgze905LND3+cGoipHSlbxCkU4dyhIzGf9IroGLpWRlZ0JsRmm/C5Mt3dWZ
wPovDL3yje5RaFDcdfPBFEtNJS2u89xjMSrs4eRkLp6YmBT2crdAb5+guI6WOoEH
eQjaCr6ILSjhKC4jKf5Pe677xHrpLQMslD0UTTx2wdKk7n1cltReByy5V0bM+s0p
eTTfvOkAjsyT7zE7dEvzhIC3XQCMaGEc9f5chV96/p66EfaFV3B79tBicgsyDLb3
a605ydFlsVe9RwREo0tI
=crGw
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

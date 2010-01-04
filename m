Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NRwkE-0006lw-J5 for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 00:53:57 +0100
Received: from g225142234.adsl.alicedsl.de ([92.225.142.234]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NRwiH-0007Wk-KL for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 23:51:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 05 Jan 2010 00:51:47 +0100
Message-ID: <1262649107.3238.44.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [bitbake vdr] /arm-angstrom-linux-gnueabi/bin/ld: cannot find -lintl
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
X-List-Received-Date: Mon, 04 Jan 2010 23:53:57 -0000
X-Groupsio-MsgNum: 15394
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+vz9iHlxMaSQHfNZ7YAJ"

--=-+vz9iHlxMaSQHfNZ7YAJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OpenEmbedded hackers,


I tried to build the new VDR recipe [1] with the following command.

        $ bitbake -c clean vdr
        $ bitbake vdr

But I get the following error.

        NOTE: Running task 802 of 813 (ID: 8, /oe/openembedded/recipes/vdr/=
vdr_1.7.10.bb, do_compile)
        ERROR: function do_compile failed

The log shows the following.

        [=E2=80=A6]
        arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -isystem/oe/angstrom-dev/staging/armv7a-a=
ngstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-regist=
ers -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-inlines-hidde=
n -rdynamic audio.o channels.o ci.o config.o cutter.o device.o diseqc.o dvb=
device.o dvbci.o dvbosd.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.=
o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o=
 nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o =
recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skinc=
lassic.o skins.o skinsttng.o sources.o spu.o status.o svdrp.o themes.o thre=
ad.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpthread -ldl -lc=
ap -lrt -lfreetype -lfontconfig -lintl -L/oe/angstrom-dev/staging/armv7a-an=
gstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/oe/angstrom-dev/staging/armv7=
a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu  ./libsi/li=
bsi.a -o vdr
        /oe/angstrom-dev/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.=
3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: cannot find -lintl
        collect2: ld returned 1 exit status
        make: *** [vdr] Error 1
        FATAL: oe_runmake failed

Without knowing what I have to do, I tried the fix it by adding a
dependency on `virtual/libintl` according to [2] to no avail. (It had
todo with lintl. ;-))

        diff --git a/recipes/vdr/vdr_1.7.10.bb b/recipes/vdr/vdr_1.7.10.bb
        index 64b89b8..49c9079 100644
        --- a/recipes/vdr/vdr_1.7.10.bb
        +++ b/recipes/vdr/vdr_1.7.10.bb
        @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
         HOMEPAGE =3D "http://www.tvdr.de"
         PR =3D "r0"
        =20
        -DEPENDS =3D "fontconfig freetype gettext libcap jpeg"
        +DEPENDS =3D "fontconfig freetype gettext libcap jpeg virtual/libin=
tl"
        =20
         SRC_URI =3D "ftp://ftp.tvdr.de/vdr/Developer/${P}.tar.bz2 \
                    file://fixpaths.patch;patch=3D1 \

Can someone help me please.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/vdr/vdr=
_1.7.10.bb
[2] http://lists.linuxtogo.org/pipermail/openembedded-commits/2009-Septembe=
r/031178.html

--=-+vz9iHlxMaSQHfNZ7YAJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEABECAAYFAktCfxIACgkQPX1aK2wOHVidWwCYzS2CH2H/decRAJg7RDe3EPBh
awCfbYWoLwSKKkKCUCtecXSEGdrtoXQ=
=H/l+
-----END PGP SIGNATURE-----

--=-+vz9iHlxMaSQHfNZ7YAJ--

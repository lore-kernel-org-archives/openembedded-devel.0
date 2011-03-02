Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PunG2-0001HN-S7 for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 15:42:30 +0100
Received: from f053041235.adsl.alicedsl.de ([78.53.41.235]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PunEf-0005nh-MI for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 14:41:05 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 02 Mar 2011 15:41:04 +0100
Message-ID: <1299076864.3857.46.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: minimal-uclibc: alsa-utils_1.0.24.2: task compile fails with `warning: incompatible implicit declaration of built-in function 'exp10'`
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
X-List-Received-Date: Wed, 02 Mar 2011 14:42:30 -0000
X-Groupsio-MsgNum: 29859
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-lB1ysvqJw30M23phnQX2"

--=-lB1ysvqJw30M23phnQX2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,



task compile of `alsa-utils_1.0.24.2` committed in 679b4bb0 [1] fails
with the following error message using `minimal-uclibc` for
`MACHINE=3D"beagleboard"`.

	arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-=
minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAV=
E_CONFIG_H -I. -I../include    -I/oe/build-minimal-uclibc/minimal-uclibc-de=
v/sysroots/i686-linux/usr/include -I/oe/build-minimal-uclibc/minimal-uclibc=
-dev/sysroots/i686-linux/usr/include/ncurses -DCURSESINC=3D"<ncurses.h>" -f=
expensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -=
I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include -MT utils.o -MD -MP -MF .deps/utils.Tpo -c -o utils.o uti=
ls.c
	arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-=
minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAV=
E_CONFIG_H -I. -I../include    -I/oe/build-minimal-uclibc/minimal-uclibc-de=
v/sysroots/i686-linux/usr/include -I/oe/build-minimal-uclibc/minimal-uclibc=
-dev/sysroots/i686-linux/usr/include/ncurses -DCURSESINC=3D"<ncurses.h>" -f=
expensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -=
I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include -MT volume_mapping.o -MD -MP -MF .deps/volume_mapping.Tpo=
 -c -o volume_mapping.o volume_mapping.c
	volume_mapping.c: In function 'get_normalized_volume':
	volume_mapping.c:112:15: warning: incompatible implicit declaration of bui=
lt-in function 'exp10'
	volume_mapping.c: In function 'set_normalized_volume':
	volume_mapping.c:147:14: warning: incompatible implicit declaration of bui=
lt-in function 'exp10'
	mv -f .deps/mixer_widget.Tpo .deps/mixer_widget.Po
	arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-=
minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAV=
E_CONFIG_H -I. -I../include    -I/oe/build-minimal-uclibc/minimal-uclibc-de=
v/sysroots/i686-linux/usr/include -I/oe/build-minimal-uclibc/minimal-uclibc=
-dev/sysroots/i686-linux/usr/include/ncurses -DCURSESINC=3D"<ncurses.h>" -f=
expensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -=
I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/include -MT widget.o -MD -MP -MF .deps/widget.Tpo -c -o widget.o =
widget.c
	mv -f .deps/utils.Tpo .deps/utils.Po
	mv -f .deps/volume_mapping.Tpo .deps/volume_mapping.Po
	mv -f .deps/widget.Tpo .deps/widget.Po
	mv -f .deps/mixer_display.Tpo .deps/mixer_display.Po
	arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-=
minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -I/oe=
/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/include -I=
/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/include=
/ncurses -DCURSESINC=3D"<ncurses.h>" -fexpensive-optimizations -fomit-frame=
-pointer -frename-registers -Os -pipe -I/oe/build-minimal-uclibc/minimal-uc=
libc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/include  -Wl,-O1 -Wl,--has=
h-style=3Dgnu  -L/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7=
a-oe-linux-uclibceabi/usr/lib -o alsamixer card_select.o cli.o colors.o dev=
ice_name.o die.o mainloop.o mem.o mixer_controls.o mixer_display.o mixer_wi=
dget.o proc_files.o textbox.o utils.o volume_mapping.o widget.o -L/oe/build=
-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/lib -lform -lmen=
u -lpanel -lncurses -ltinfo -lasound -L/oe/build-minimal-uclibc/minimal-ucl=
ibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib -lm -ldl -lpthread
	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclib=
ceabi/usr/lib/libasound.so: warning: gethostbyname is obsolescent, use getn=
ameinfo() instead.
	volume_mapping.o: In function `get_normalized_volume':
	volume_mapping.c:(.text+0x124): undefined reference to `exp10'
	volume_mapping.c:(.text+0x154): undefined reference to `exp10'
	volume_mapping.o: In function `set_normalized_volume':
	volume_mapping.c:(.text+0x2d4): undefined reference to `exp10'
	collect2: ld returned 1 exit status
	make[1]: *** [alsamixer] Error 1
	make[1]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/wo=
rk/armv7a-oe-linux-uclibceabi/alsa-utils-1.0.24.2-r0/alsa-utils-1.0.24.2/al=
samixer'
	make: *** [all-recursive] Error 1

Could you take a look please. I did not find any patches regarding this
issue in `alsa-utils_1.0.23.bb`.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D679b4bb=
094bd0467847525967cdbe265a17d4ef5

--=-lB1ysvqJw30M23phnQX2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1uVwAACgkQPX1aK2wOHVjmUwCeNRuNhnDCnbAKsrm8OxEpgw/N
U8QAnRjpbJhGy6GlV50HHULcYne8mfFz
=dlF+
-----END PGP SIGNATURE-----

--=-lB1ysvqJw30M23phnQX2--

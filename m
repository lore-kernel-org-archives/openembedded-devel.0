Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ph64K-00042X-2n for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 20:57:48 +0100
Received: from f053040085.adsl.alicedsl.de ([78.53.40.85]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ph63d-0002v7-ID for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 19:57:05 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1295798887.12751.6.camel@mattotaupa>
References: <1295608972.12720.47.camel@mattotaupa>
	<AANLkTinbMr38A4-yGjyLkNL+ydrwS+R6r_OWZo2fh7KP@mail.gmail.com>
	<1295653195.4105.56.camel@mattotaupa>
	<1295684244.4098.2.camel@mattotaupa>
	<1295720592.3850.290.camel@mattotaupa>
	<AANLkTin86VuRC4KSVfY=zAqnV+EXEmVh37mwiJ0X4BRU@mail.gmail.com>
	<1295798887.12751.6.camel@mattotaupa>
Date: Sun, 23 Jan 2011 20:57:04 +0100
Message-ID: <1295812624.3570.13.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: vdr: minimal-uclibc: task `compile` fails with `undefined reference to `_nl_msg_cat_cntr'`
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
X-List-Received-Date: Sun, 23 Jan 2011 19:57:48 -0000
X-Groupsio-MsgNum: 28346
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-NZhFYj/vFDiYLVRr6B/J"

--=-NZhFYj/vFDiYLVRr6B/J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 23.01.2011, 17:08 +0100 schrieb Paul Menzel:
> Am Samstag, den 22.01.2011, 11:48 -0800 schrieb Khem Raj:
> > On Sat, Jan 22, 2011 at 10:23 AM, Paul Menzel wrote:
> > > The commit since when building fails is a88aca1d [6].
> > >
> > >        commit a88aca1d7dfa3a08957dd49cb61bac850f197106
> > >        Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> > >        Date:   Wed Jan 12 20:34:55 2011 +0100
> > >
> > >            autotools.bbclass: pass distro_imposed_configure_flags
> > >
> > >            Acked-by: Khem Raj <raj.khem@gmail.com>
> > >            Acked-by: Tom Rini <tom_rini@mentor.com>
> > >            Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail=
.com>
> > >
> > > Any idea?
> >=20
> > I see. I think its to do with enable-ipv6 or somesuch. Can you run
> > do_configure for vdr before and after this commit and port
> > the contents of line invoking configure.
>=20
> Strange. VDR just uses a plain Makefile and no Autotools. Since this
> commit, it seems that `-lintl` is not passed.
>=20
> ### works
>=20
> 	arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build-mi=
nimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/inc=
lude -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os =
-fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 -Wl,--hash-style=
=3Dgnu audio.o channels.o ci.o config.o cutter.o device.o diseqc.o dvbdevic=
e.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.o epg.o filter=
.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o nit.o osdbase=
.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o recording.o re=
mote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skinclassic.o skins=
.o skinsttng.o sourceparams.o sources.o spu.o status.o svdrp.o themes.o thr=
ead.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpthread -ldl -l=
cap -lrt -lfreetype -lfontconfig -lintl  ./libsi/libsi.a -o vdr
>=20
> ### fails
>=20
> 	arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build-mi=
nimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/inc=
lude -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os =
-pipe -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 -Wl,--hash=
-style=3Dgnu audio.o channels.o ci.o config.o cutter.o device.o diseqc.o dv=
bdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.o epg.o =
filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o nit.o o=
sdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o recordin=
g.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skinclassic.o=
 skins.o skinsttng.o sourceparams.o sources.o spu.o status.o svdrp.o themes=
.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpthread -=
ldl -lcap -lrt -lfreetype -lfontconfig  ./libsi/libsi.a -o vdr
>=20
> 	$ wdiff log.do_compile.*
> 	arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build-mi=
nimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/inc=
lude -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os =
[--pipe-] -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 -Wl,--=
hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o device.o diseqc.=
o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.o ep=
g.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o nit=
.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o reco=
rding.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skinclass=
ic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o svdrp.o th=
emes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpthre=
ad -ldl -lcap -lrt -lfreetype -lfontconfig {+-lintl+}  ./libsi/libsi.a -o v=
dr
>=20
> Now the question is why is the patch not applied [7] and why did it start=
 breaking with this commit.

Ok, I am sorry, my last report was messed up. I did not reset to
a88aca1d but 49891de0 [8], where 7190532c [9]

        commit 7190532c5a810ef886e8607ce042a319020f06c6
        Author: Tom Rini <tom_rini@mentor.com>
        Date:   Tue Jan 18 17:58:02 2011 -0700
       =20
            vdr: Switch to libc-uclibc
           =20
            Signed-off-by: Tom Rini <tom_rini@mentor.com>

is applied, which seems to be the reason the patch is not applied and
therefore `-lintl` not added.

Comparing the options passed in 67d127a5 (builds) and a88aca1d (fails) I
cannot see any differences for VDR=E2=80=99s recipe.

So I assume, that I have to rebuild everything disabling some things in
`DISTRO_FEATURES`. I will start with leaving `nls` out.


Sorry and thanks,

Paul


> [7] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/vdr/v=
dr_1.7.16.bb?id=3D7190532c5a810ef886e8607ce042a319020f06c6#n8
[8] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/vdr/vdr=
_1.7.16.bb?id=3D49891de0b13c86c2fdcc5e0fdabd4faa867e83bc
[9] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/vdr/vdr=
_1.7.16.bb?id=3D7190532c5a810ef886e8607ce042a319020f06c6

--=-NZhFYj/vFDiYLVRr6B/J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk08iBAACgkQPX1aK2wOHVjCkQCfckhbPBQctziFpdZoAOhzdnsk
JcQAn1RqYied7LkyjnOCAbYCGN4HBIgx
=O7kt
-----END PGP SIGNATURE-----

--=-NZhFYj/vFDiYLVRr6B/J--

Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ph2Ul-0001oL-C4 for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 17:08:51 +0100
Received: from f053040085.adsl.alicedsl.de ([78.53.40.85]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ph2U5-0004lU-37 for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 16:08:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTin86VuRC4KSVfY=zAqnV+EXEmVh37mwiJ0X4BRU@mail.gmail.com>
References: <1295608972.12720.47.camel@mattotaupa>
	<AANLkTinbMr38A4-yGjyLkNL+ydrwS+R6r_OWZo2fh7KP@mail.gmail.com>
	<1295653195.4105.56.camel@mattotaupa>
	<1295684244.4098.2.camel@mattotaupa>
	<1295720592.3850.290.camel@mattotaupa>
	<AANLkTin86VuRC4KSVfY=zAqnV+EXEmVh37mwiJ0X4BRU@mail.gmail.com>
Date: Sun, 23 Jan 2011 17:08:07 +0100
Message-ID: <1295798887.12751.6.camel@mattotaupa>
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
X-List-Received-Date: Sun, 23 Jan 2011 16:08:51 -0000
X-Groupsio-MsgNum: 28341
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-AWAHSWQww9fbyzj2H5/1"

--=-AWAHSWQww9fbyzj2H5/1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 22.01.2011, 11:48 -0800 schrieb Khem Raj:
> On Sat, Jan 22, 2011 at 10:23 AM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> > The commit since when building fails is a88aca1d [6].
> >
> >        commit a88aca1d7dfa3a08957dd49cb61bac850f197106
> >        Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> >        Date:   Wed Jan 12 20:34:55 2011 +0100
> >
> >            autotools.bbclass: pass distro_imposed_configure_flags
> >
> >            Acked-by: Khem Raj <raj.khem@gmail.com>
> >            Acked-by: Tom Rini <tom_rini@mentor.com>
> >            Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.c=
om>
> >
> > Any idea?
>=20
> I see. I think its to do with enable-ipv6 or somesuch. Can you run
> do_configure for vdr before and after this commit and port
> the contents of line invoking configure.

Strange. VDR just uses a plain Makefile and no Autotools. Since this
commit, it seems that `-lintl` is not passed.

### works

	arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build-mini=
mal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/inclu=
de -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -f=
permissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 -Wl,--hash-style=
=3Dgnu audio.o channels.o ci.o config.o cutter.o device.o diseqc.o dvbdevic=
e.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.o epg.o filter=
.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o nit.o osdbase=
.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o recording.o re=
mote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skinclassic.o skins=
.o skinsttng.o sourceparams.o sources.o spu.o status.o svdrp.o themes.o thr=
ead.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpthread -ldl -l=
cap -lrt -lfreetype -lfontconfig -lintl  ./libsi/libsi.a -o vdr

### fails

	arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build-mini=
mal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/inclu=
de -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -p=
ipe -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 -Wl,--hash-s=
tyle=3Dgnu audio.o channels.o ci.o config.o cutter.o device.o diseqc.o dvbd=
evice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.o epg.o fi=
lter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o nit.o osd=
base.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o recording.=
o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skinclassic.o s=
kins.o skinsttng.o sourceparams.o sources.o spu.o status.o svdrp.o themes.o=
 thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpthread -ld=
l -lcap -lrt -lfreetype -lfontconfig  ./libsi/libsi.a -o vdr

	$ wdiff log.do_compile.*
	arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build-mini=
mal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/inclu=
de -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os [-=
-pipe-] -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 -Wl,--ha=
sh-style=3Dgnu audio.o channels.o ci.o config.o cutter.o device.o diseqc.o =
dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.o epg.=
o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o nit.o=
 osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o record=
ing.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skinclassic=
.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o svdrp.o them=
es.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpthread=
 -ldl -lcap -lrt -lfreetype -lfontconfig {+-lintl+}  ./libsi/libsi.a -o vdr

Now the question is why is the patch not applied [7] and why did it start b=
reaking with this commit.


Thanks,

Paul


[7] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/vdr/vdr=
_1.7.16.bb?id=3D7190532c5a810ef886e8607ce042a319020f06c6#n8

--=-AWAHSWQww9fbyzj2H5/1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk08UmIACgkQPX1aK2wOHVjEkwCfUzq9WMoDghugpHgpGauL/CsC
hPcAnjpwR1opIR1GcbmzfQWDjgiqgzuu
=+R++
-----END PGP SIGNATURE-----

--=-AWAHSWQww9fbyzj2H5/1--

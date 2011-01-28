Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PirKA-0004Sb-IA for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 17:37:28 +0100
Received: from f053044076.adsl.alicedsl.de ([78.53.44.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PirJO-00047J-QQ for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 16:36:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1295832268.7645.54.camel@mattotaupa>
References: <1295608972.12720.47.camel@mattotaupa>
	<AANLkTinbMr38A4-yGjyLkNL+ydrwS+R6r_OWZo2fh7KP@mail.gmail.com>
	<1295653195.4105.56.camel@mattotaupa>
	<1295684244.4098.2.camel@mattotaupa>
	<1295720592.3850.290.camel@mattotaupa>
	<AANLkTin86VuRC4KSVfY=zAqnV+EXEmVh37mwiJ0X4BRU@mail.gmail.com>
	<1295798887.12751.6.camel@mattotaupa>
	<1295812624.3570.13.camel@mattotaupa>
	<AANLkTi=0vr9MZ28ZtvzvpSGK0k39BjoXC-sH-fJZs4j_@mail.gmail.com>
	<1295832268.7645.54.camel@mattotaupa>
Date: Fri, 28 Jan 2011 17:36:38 +0100
Message-ID: <1296232598.21132.21.camel@mattotaupa>
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
X-List-Received-Date: Fri, 28 Jan 2011 16:37:28 -0000
X-Groupsio-MsgNum: 28573
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ZArIu2RS3lIj5wiTGa0X"

--=-ZArIu2RS3lIj5wiTGa0X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 24.01.2011, 02:24 +0100 schrieb Paul Menzel:
> Am Sonntag, den 23.01.2011, 14:09 -0800 schrieb Khem Raj:
> > On Sun, Jan 23, 2011 at 11:57 AM, Paul Menzel wrote:
> > > Am Sonntag, den 23.01.2011, 17:08 +0100 schrieb Paul Menzel:
> > >> Am Samstag, den 22.01.2011, 11:48 -0800 schrieb Khem Raj:
> > >> > On Sat, Jan 22, 2011 at 10:23 AM, Paul Menzel wrote:
> > >> > > The commit since when building fails is a88aca1d [6].
> > >> > >
> > >> > >        commit a88aca1d7dfa3a08957dd49cb61bac850f197106
> > >> > >        Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> > >> > >        Date:   Wed Jan 12 20:34:55 2011 +0100
> > >> > >
> > >> > >            autotools.bbclass: pass distro_imposed_configure_flag=
s
> > >> > >
> > >> > >            Acked-by: Khem Raj <raj.khem@gmail.com>
> > >> > >            Acked-by: Tom Rini <tom_rini@mentor.com>
> > >> > >            Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@=
gmail.com>
> > >> > >
> > >> > > Any idea?
> > >> >
> > >> > I see. I think its to do with enable-ipv6 or somesuch. Can you run
> > >> > do_configure for vdr before and after this commit and port
> > >> > the contents of line invoking configure.
> > >>
> > >> Strange. VDR just uses a plain Makefile and no Autotools. Since this
> > >> commit, it seems that `-lintl` is not passed.
> > >>
> > >> ### works
> > >>
> > >>       arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a=
8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-regi=
sters -Os -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 -Wl,--=
hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o device.o diseqc.=
o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.o ep=
g.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o nit=
.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o reco=
rding.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skinclass=
ic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o svdrp.o th=
emes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpthre=
ad -ldl -lcap -lrt -lfreetype -lfontconfig -lintl  ./libsi/libsi.a -o vdr
> > >>
> > >> ### fails
> > >>
> > >>       arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a=
8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-regi=
sters -Os -pipe -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 =
-Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o device.o d=
iseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitsca=
n.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems=
.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.=
o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o ski=
nclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o svdr=
p.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -=
lpthread -ldl -lcap -lrt -lfreetype -lfontconfig  ./libsi/libsi.a -o vdr
> > >>
> > >>       $ wdiff log.do_compile.*
> > >>       arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a=
8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-regi=
sters -Os [--pipe-] -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,=
-O1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o device=
.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o ei=
tscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menui=
tems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recor=
der.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o=
 skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o =
svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljp=
eg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig {+-lintl+}  ./libsi/li=
bsi.a -o vdr
> > >>
> > >> Now the question is why is the patch not applied [7] and why did it =
start breaking with this commit.
> > >
> > > Ok, I am sorry, my last report was messed up. I did not reset to
> > > a88aca1d but 49891de0 [8], where 7190532c [9]
> > >
> > >        commit 7190532c5a810ef886e8607ce042a319020f06c6
> > >        Author: Tom Rini <tom_rini@mentor.com>
> > >        Date:   Tue Jan 18 17:58:02 2011 -0700
> > >
> > >            vdr: Switch to libc-uclibc
> > >
> > >            Signed-off-by: Tom Rini <tom_rini@mentor.com>
> > >
> > > is applied, which seems to be the reason the patch is not applied and
> > > therefore `-lintl` not added.
> >=20
> > I have fixed a typo in it.
>=20
> Thank you for fixing this in cb23dffd [10].
>=20
> > Please retry latest master.
>=20
> Unfortunately the build still fails.
>=20
> I also tried to disable the features `largefile` and (second run
> additionally) `ipv6` in `conf/distro/minimal-uclibc.conf` and run
> `bitbake -k vdr` from scratch each time, but it failed too.
>=20
> Was that the right way to debug this? Do you have any other ideas?

I encounter a strange thing from clean builds.

        bitbake -k vdr # fails
        bitbake -k console-image # works
        bitbake -k x11-image # works
        USE_NLS=3D"yes" bitbake -k # fails

I have no clue what could cause this. I guess that `console-image` or
`x11-image` force some different options to the internationalization
programs and that this got changed with the `autotools.bbclass` change.

Does anyone have a hint?


Thanks,

Paul


> [10] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dcb23=
dffdbe3c3a7432c2e2eb19742c254163c05a

--=-ZArIu2RS3lIj5wiTGa0X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1C8JYACgkQPX1aK2wOHVitMwCdG4WdJ+xgnAj97VdfoZnVf3FV
qZsAn074jguqO2qS1DDQN5JpQgohLuhf
=BGKh
-----END PGP SIGNATURE-----

--=-ZArIu2RS3lIj5wiTGa0X--

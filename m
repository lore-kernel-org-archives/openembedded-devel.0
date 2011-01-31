Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PjxfW-0002oV-NX for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 18:36:02 +0100
Received: from f053033079.adsl.alicedsl.de ([78.53.33.79]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pjxeh-0007lY-1c for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 17:35:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1296232598.21132.21.camel@mattotaupa>
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
	<1296232598.21132.21.camel@mattotaupa>
Date: Mon, 31 Jan 2011 18:35:09 +0100
Message-ID: <1296495309.3819.0.camel@mattotaupa>
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
X-List-Received-Date: Mon, 31 Jan 2011 17:36:02 -0000
X-Groupsio-MsgNum: 28660
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7E/o7dgGuf5xIYDIv4Cv"

--=-7E/o7dgGuf5xIYDIv4Cv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 28.01.2011, 17:36 +0100 schrieb Paul Menzel:
> Am Montag, den 24.01.2011, 02:24 +0100 schrieb Paul Menzel:
> > Am Sonntag, den 23.01.2011, 14:09 -0800 schrieb Khem Raj:
> > > On Sun, Jan 23, 2011 at 11:57 AM, Paul Menzel wrote:
> > > > Am Sonntag, den 23.01.2011, 17:08 +0100 schrieb Paul Menzel:
> > > >> Am Samstag, den 22.01.2011, 11:48 -0800 schrieb Khem Raj:
> > > >> > On Sat, Jan 22, 2011 at 10:23 AM, Paul Menzel wrote:
> > > >> > > The commit since when building fails is a88aca1d [6].
> > > >> > >
> > > >> > >        commit a88aca1d7dfa3a08957dd49cb61bac850f197106
> > > >> > >        Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com=
>
> > > >> > >        Date:   Wed Jan 12 20:34:55 2011 +0100
> > > >> > >
> > > >> > >            autotools.bbclass: pass distro_imposed_configure_fl=
ags
> > > >> > >
> > > >> > >            Acked-by: Khem Raj <raj.khem@gmail.com>
> > > >> > >            Acked-by: Tom Rini <tom_rini@mentor.com>
> > > >> > >            Signed-off-by: Bernhard Reutner-Fischer <rep.dot.no=
p@gmail.com>
> > > >> > >
> > > >> > > Any idea?
> > > >> >
> > > >> > I see. I think its to do with enable-ipv6 or somesuch. Can you r=
un
> > > >> > do_configure for vdr before and after this commit and port
> > > >> > the contents of line invoking configure.
> > > >>
> > > >> Strange. VDR just uses a plain Makefile and no Autotools. Since th=
is
> > > >> commit, it seems that `-lintl` is not passed.
> > > >>
> > > >> ### works
> > > >>
> > > >>       arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem=
/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibc=
eabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-re=
gisters -Os -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 -Wl,=
--hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o device.o diseq=
c.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.o =
epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o n=
it.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o re=
cording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skincla=
ssic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o svdrp.o =
themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpth=
read -ldl -lcap -lrt -lfreetype -lfontconfig -lintl  ./libsi/libsi.a -o vdr
> > > >>
> > > >> ### fails
> > > >>
> > > >>       arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem=
/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibc=
eabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-re=
gisters -Os -pipe -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O=
1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o device.o=
 diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eits=
can.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuite=
ms.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorde=
r.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o s=
kinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o sv=
drp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg=
 -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig  ./libsi/libsi.a -o vdr
> > > >>
> > > >>       $ wdiff log.do_compile.*
> > > >>       arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem=
/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibc=
eabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-re=
gisters -Os [--pipe-] -fpermissive -fvisibility-inlines-hidden -rdynamic -W=
l,-O1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o devi=
ce.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o =
eitscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o men=
uitems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o rec=
order.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown=
.o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.=
o svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -l=
jpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig {+-lintl+}  ./libsi/=
libsi.a -o vdr
> > > >>
> > > >> Now the question is why is the patch not applied [7] and why did i=
t start breaking with this commit.
> > > >
> > > > Ok, I am sorry, my last report was messed up. I did not reset to
> > > > a88aca1d but 49891de0 [8], where 7190532c [9]
> > > >
> > > >        commit 7190532c5a810ef886e8607ce042a319020f06c6
> > > >        Author: Tom Rini <tom_rini@mentor.com>
> > > >        Date:   Tue Jan 18 17:58:02 2011 -0700
> > > >
> > > >            vdr: Switch to libc-uclibc
> > > >
> > > >            Signed-off-by: Tom Rini <tom_rini@mentor.com>
> > > >
> > > > is applied, which seems to be the reason the patch is not applied a=
nd
> > > > therefore `-lintl` not added.
> > >=20
> > > I have fixed a typo in it.
> >=20
> > Thank you for fixing this in cb23dffd [10].
> >=20
> > > Please retry latest master.
> >=20
> > Unfortunately the build still fails.
> >=20
> > I also tried to disable the features `largefile` and (second run
> > additionally) `ipv6` in `conf/distro/minimal-uclibc.conf` and run
> > `bitbake -k vdr` from scratch each time, but it failed too.
> >=20
> > Was that the right way to debug this? Do you have any other ideas?
>=20
> I encounter a strange thing from clean builds.
>=20
>         bitbake -k vdr # fails
>         bitbake -k console-image # works
>         bitbake -k x11-image # works
>         USE_NLS=3D"yes" bitbake -k # fails
>=20
> I have no clue what could cause this. I guess that `console-image` or
> `x11-image` force some different options to the internationalization
> programs and that this got changed with the `autotools.bbclass` change.
>=20
> Does anyone have a hint?

Just a breadcrumb please? ;-)


Thanks,

Paul


> > [10] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dcb=
23dffdbe3c3a7432c2e2eb19742c254163c05a

--=-7E/o7dgGuf5xIYDIv4Cv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1G8scACgkQPX1aK2wOHVicOwCcDAxwMNff4Dp5Pi/OFqFCYXOD
VkgAn0USlP0F17urcC2V08SeBYt3baz1
=hVBl
-----END PGP SIGNATURE-----

--=-7E/o7dgGuf5xIYDIv4Cv--

Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PoAJk-0000VS-9U for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 08:54:56 +0100
Received: from f053043157.adsl.alicedsl.de ([78.53.43.157]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PoAIh-0000ru-TG for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 07:53:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=Ta_fk1kzBtKSqyXykNJdM1=Hqsv4QyGsW1ZyL@mail.gmail.com>
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
	<1296495309.3819.0.camel@mattotaupa>
	<1297381611.3877.37.camel@mattotaupa>
	<AANLkTi=Ta_fk1kzBtKSqyXykNJdM1=Hqsv4QyGsW1ZyL@mail.gmail.com>
Date: Sat, 12 Feb 2011 08:53:50 +0100
Message-ID: <1297497230.6433.3.camel@mattotaupa>
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
X-List-Received-Date: Sat, 12 Feb 2011 07:54:56 -0000
X-Groupsio-MsgNum: 29114
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-CZyaEZGIYWnBCQXcGxz+"

--=-CZyaEZGIYWnBCQXcGxz+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 11.02.2011, 09:37 -0800 schrieb Khem Raj:
> On Thu, Feb 10, 2011 at 3:46 PM, Paul Menzel wrote:
> > Am Montag, den 31.01.2011, 18:35 +0100 schrieb Paul Menzel:
> >> Am Freitag, den 28.01.2011, 17:36 +0100 schrieb Paul Menzel:
> >> > Am Montag, den 24.01.2011, 02:24 +0100 schrieb Paul Menzel:
> >> > > Am Sonntag, den 23.01.2011, 14:09 -0800 schrieb Khem Raj:
> >> > > > On Sun, Jan 23, 2011 at 11:57 AM, Paul Menzel wrote:
> >> > > > > Am Sonntag, den 23.01.2011, 17:08 +0100 schrieb Paul Menzel:
> >> > > > >> Am Samstag, den 22.01.2011, 11:48 -0800 schrieb Khem Raj:
> >> > > > >> > On Sat, Jan 22, 2011 at 10:23 AM, Paul Menzel wrote:
> >> > > > >> > > The commit since when building fails is a88aca1d [6].
> >> > > > >> > >
> >> > > > >> > >        commit a88aca1d7dfa3a08957dd49cb61bac850f197106
> >> > > > >> > >        Author: Bernhard Reutner-Fischer <rep.dot.nop@gmai=
l.com>
> >> > > > >> > >        Date:   Wed Jan 12 20:34:55 2011 +0100
> >> > > > >> > >
> >> > > > >> > >            autotools.bbclass: pass distro_imposed_configu=
re_flags
> >> > > > >> > >
> >> > > > >> > >            Acked-by: Khem Raj <raj.khem@gmail.com>
> >> > > > >> > >            Acked-by: Tom Rini <tom_rini@mentor.com>
> >> > > > >> > >            Signed-off-by: Bernhard Reutner-Fischer <rep.d=
ot.nop@gmail.com>
> >> > > > >> > >
> >> > > > >> > > Any idea?
> >> > > > >> >
> >> > > > >> > I see. I think its to do with enable-ipv6 or somesuch. Can =
you run
> >> > > > >> > do_configure for vdr before and after this commit and port
> >> > > > >> > the contents of line invoking configure.
> >> > > > >>
> >> > > > >> Strange. VDR just uses a plain Makefile and no Autotools. Sin=
ce this
> >> > > > >> commit, it seems that `-lintl` is not passed.
> >> > > > >>
> >> > > > >> ### works
> >> > > > >>
> >> > > > >>       arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -is=
ystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frena=
me-registers -Os -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1=
 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o device.o =
diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitsc=
an.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitem=
s.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder=
.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o sk=
inclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o svd=
rp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg =
-lpthread -ldl -lcap -lrt -lfreetype -lfontconfig -lintl  ./libsi/libsi.a -=
o vdr
> >> > > > >>
> >> > > > >> ### fails
> >> > > > >>
> >> > > > >>       arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -is=
ystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frena=
me-registers -Os -pipe -fpermissive -fvisibility-inlines-hidden -rdynamic -=
Wl,-O1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o dev=
ice.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o=
 eitscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o me=
nuitems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o re=
corder.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdow=
n.o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status=
.o svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -=
ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig  ./libsi/libsi.a -o=
 vdr
> >> > > > >>
> >> > > > >>       $ wdiff log.do_compile.*
> >> > > > >>       arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -is=
ystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-u=
clibceabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frena=
me-registers -Os [--pipe-] -fpermissive -fvisibility-inlines-hidden -rdynam=
ic -Wl,-O1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o=
 device.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o e=
it.o eitscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.=
o menuitems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.=
o recorder.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shu=
tdown.o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o st=
atus.o svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir=
.o -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig {+-lintl+}  ./l=
ibsi/libsi.a -o vdr
> >> > > > >>
> >> > > > >> Now the question is why is the patch not applied [7] and why =
did it start breaking with this commit.
> >> > > > >
> >> > > > > Ok, I am sorry, my last report was messed up. I did not reset =
to
> >> > > > > a88aca1d but 49891de0 [8], where 7190532c [9]
> >> > > > >
> >> > > > >        commit 7190532c5a810ef886e8607ce042a319020f06c6
> >> > > > >        Author: Tom Rini <tom_rini@mentor.com>
> >> > > > >        Date:   Tue Jan 18 17:58:02 2011 -0700
> >> > > > >
> >> > > > >            vdr: Switch to libc-uclibc
> >> > > > >
> >> > > > >            Signed-off-by: Tom Rini <tom_rini@mentor.com>
> >> > > > >
> >> > > > > is applied, which seems to be the reason the patch is not appl=
ied and
> >> > > > > therefore `-lintl` not added.
> >> > > >
> >> > > > I have fixed a typo in it.
> >> > >
> >> > > Thank you for fixing this in cb23dffd [10].
> >> > >
> >> > > > Please retry latest master.
> >> > >
> >> > > Unfortunately the build still fails.
> >> > >
> >> > > I also tried to disable the features `largefile` and (second run
> >> > > additionally) `ipv6` in `conf/distro/minimal-uclibc.conf` and run
> >> > > `bitbake -k vdr` from scratch each time, but it failed too.
> >> > >
> >> > > Was that the right way to debug this? Do you have any other ideas?
> >> >
> >> > I encounter a strange thing from clean builds.
> >> >
> >> >         bitbake -k vdr # fails
> >> >         bitbake -k console-image # works
> >> >         bitbake -k x11-image # works
> >> >         USE_NLS=3D"yes" bitbake -k # fails
> >> >
> >> > I have no clue what could cause this. I guess that `console-image` o=
r
> >> > `x11-image` force some different options to the internationalization
> >> > programs and that this got changed with the `autotools.bbclass` chan=
ge.
> >> >
> >> > Does anyone have a hint?
> >>
> >> Just a breadcrumb please? ;-)
> >
> > Bernhard, have you had time to take a look?
>=20
> vdr built fine on minimal-uclibc/qemuarm on latest oe/master

I did too with a clean build directory and `minimal-uclibc`.

	MACHINE =3D "qemuarm" bitbake -k vdr

It failed for me again.

> unless its reproducible what you are seeing
> It will be hard to fix it.

I can reproduce this every time when I build from a clean build
directory (`rm -rf minimal-uclibc-dev`).

As written above I cannot reproduce this when having built
`console-image` or `x11-image` before. So I am wondering what =E2=80=9Clang=
uage
specific options=E2=80=9D they set or pass to the recipes.


Thanks,

Paul


> >> > > [10] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=
=3Dcb23dffdbe3c3a7432c2e2eb19742c254163c05a

--=-CZyaEZGIYWnBCQXcGxz+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1WPIMACgkQPX1aK2wOHVj6NgCdFs8z0DMpyv/SYqQ3//Ox3wKW
rJ8AnjU+oZuT3YgLZ04dyPkAurUWQSMO
=N9Aw
-----END PGP SIGNATURE-----

--=-CZyaEZGIYWnBCQXcGxz+--

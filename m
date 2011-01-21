Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgF5Z-0002kV-A7 for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 12:23:33 +0100
Received: from f053036037.adsl.alicedsl.de ([78.53.36.37]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgF4v-0000Aw-MD for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 11:22:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jan 2011 12:22:52 +0100
Message-ID: <1295608972.12720.47.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: vdr: minimal-uclibc: task `compile` fails with `undefined reference to `_nl_msg_cat_cntr'`
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
X-List-Received-Date: Fri, 21 Jan 2011 11:23:33 -0000
X-Groupsio-MsgNum: 28266
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Xci03uxPBtBYj6lL0gFj"

--=-Xci03uxPBtBYj6lL0gFj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


task `compile` of `vdr_1.7.16` fails with the following error messages.

        ar ru libsi.a util.o si.o section.o descriptor.o
        ar: creating libsi.a
        make[1]: Leaving directory `/home/paul/oe/build-minimal-uclibc/mini=
mal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/vdr-1.7.16-r1/vdr-1.7.16/lib=
si'
        arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/home/p=
aul/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename=
-registers -Os -pipe -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl=
,-O1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o devic=
e.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o e=
itscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menu=
items.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o reco=
rder.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.=
o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o=
 svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -lj=
peg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig  ./libsi/libsi.a -o v=
dr
        tools.o: In function `TouchFile(char const*)':
        tools.c:(.text+0xb54): warning: the use of OBSOLESCENT `utime' is d=
iscouraged, use `utimes'
        i18n.o: In function `SetEnvLanguage(char const*)':
        i18n.c:(.text+0xb0): undefined reference to `_nl_msg_cat_cntr'
        i18n.o: In function `I18nRegister(char const*)':
        i18n.c:(.text+0xd4): undefined reference to `bindtextdomain'
        i18n.o: In function `I18nTranslate(char const*, char const*)':
        i18n.c:(.text+0x1c0): undefined reference to `dgettext'
        i18n.c:(.text+0x1c8): undefined reference to `gettext'
        i18n.o: In function `I18nInitialize(char const*)':
        i18n.c:(.text+0x550): undefined reference to `textdomain'
        i18n.c:(.text+0x55c): undefined reference to `bindtextdomain'
        i18n.c:(.text+0x600): undefined reference to `gettext'
        i18n.c:(.text+0x684): undefined reference to `gettext'
        collect2: ld returned 1 exit status
        make: *** [vdr] Error 1
        FATAL: oe_runmake failed
        ERROR: Function do_compile failed

`bitbake -k vdr` was executed with 6db34075 (uClibc 0.9.32-rc2) [1] and
`minimal-uclibc` for `MACHINE =3D "beagleboard"`. I guess it is related to
the uClibc upgrade.

Using `angstrom-2008.1` or `minimal` the recipe builds fine.


Thanks,

Paul


PS: Another off topic question. Is there a guideline how to deal with

        warning: the use of OBSOLESCENT `utime' is discouraged, use `utimes=
'

since I found it a lot on the WWW and [3] says `utime` should be used
over `utimes`. Or this this also related to the build error as well? I
do not see it using EGLIBC.


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D6db3407=
58e2c6674d06fec02b0c34fc1689153aa
[2] https://dev.openwrt.org/changeset/24899
[3] http://www.t2-project.org/irclogs/t2-2005-01-25.html (=C2=BButime() rep=
laces utimes()=C2=AB)

--=-Xci03uxPBtBYj6lL0gFj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk05bIwACgkQPX1aK2wOHVivZgCghzo4B+utSd7sub7U94Ro658e
xaUAni9NaTmGzzKldsyR2itIT3UWXyz2
=CoOb
-----END PGP SIGNATURE-----

--=-Xci03uxPBtBYj6lL0gFj--

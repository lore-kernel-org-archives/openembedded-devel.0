Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PnwxS-0005xY-1x
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 18:39:02 +0100
Received: by iyj8 with SMTP id 8so2619125iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 09:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=1jQeODup+FLOTbxsXiHBvCglh+TWlpmJJ/MnsfUfTMk=;
	b=SvMA3pmAZq0/wAH/YwnfkiLquk9GG3/kBd74LH52sWLhSHbrc5IDdDEPuoJeLBQKlZ
	n7QBT9QFqKtziLKRXftsge2mzPEEI9jx8F+fO763em2GX2V8OJshKg0illaXahNyo9nq
	kODhbhbdV+6URY2o2HD8kdTGiPK4xQ0GmyP5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=LIhUxKtcpCB8iRgAoIBfEJYAjOwqC03wCgOyrke/1Rr1i5Kj8qvyk527OWvuieHbpg
	EwLwd2vs9+XCfcl0Ivhg8128+0vzsbda52jNFnSsaqHOKWPG0eDmGs+vxN3zzxaNif7e
	WvpUa5JD/AKhI8rCrSjiMCmGSHb/4kKQIXFHQ=
Received: by 10.42.171.2 with SMTP id h2mr948902icz.397.1297445873361; Fri, 11
	Feb 2011 09:37:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.153.130 with HTTP; Fri, 11 Feb 2011 09:37:33 -0800 (PST)
In-Reply-To: <1297381611.3877.37.camel@mattotaupa>
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
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Feb 2011 09:37:33 -0800
Message-ID: <AANLkTi=Ta_fk1kzBtKSqyXykNJdM1=Hqsv4QyGsW1ZyL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 11 Feb 2011 17:39:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2011 at 3:46 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Montag, den 31.01.2011, 18:35 +0100 schrieb Paul Menzel:
>> Am Freitag, den 28.01.2011, 17:36 +0100 schrieb Paul Menzel:
>> > Am Montag, den 24.01.2011, 02:24 +0100 schrieb Paul Menzel:
>> > > Am Sonntag, den 23.01.2011, 14:09 -0800 schrieb Khem Raj:
>> > > > On Sun, Jan 23, 2011 at 11:57 AM, Paul Menzel wrote:
>> > > > > Am Sonntag, den 23.01.2011, 17:08 +0100 schrieb Paul Menzel:
>> > > > >> Am Samstag, den 22.01.2011, 11:48 -0800 schrieb Khem Raj:
>> > > > >> > On Sat, Jan 22, 2011 at 10:23 AM, Paul Menzel wrote:
>> > > > >> > > The commit since when building fails is a88aca1d [6].
>> > > > >> > >
>> > > > >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0commit a88aca1d7dfa3a08957dd49cb=
61bac850f197106
>> > > > >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0Author: Bernhard Reutner-Fischer=
 <rep.dot.nop@gmail.com>
>> > > > >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0Date: =C2=A0 Wed Jan 12 20:34:55=
 2011 +0100
>> > > > >> > >
>> > > > >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools.bbclass:=
 pass distro_imposed_configure_flags
>> > > > >> > >
>> > > > >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Acked-by: Khem Raj=
 <raj.khem@gmail.com>
>> > > > >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Acked-by: Tom Rini=
 <tom_rini@mentor.com>
>> > > > >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Ber=
nhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> > > > >> > >
>> > > > >> > > Any idea?
>> > > > >> >
>> > > > >> > I see. I think its to do with enable-ipv6 or somesuch. Can yo=
u run
>> > > > >> > do_configure for vdr before and after this commit and port
>> > > > >> > the contents of line invoking configure.
>> > > > >>
>> > > > >> Strange. VDR just uses a plain Makefile and no Autotools. Since=
 this
>> > > > >> commit, it seems that `-lintl` is not passed.
>> > > > >>
>> > > > >> ### works
>> > > > >>
>> > > > >> =C2=A0 =C2=A0 =C2=A0 arm-oe-linux-uclibceabi-g++ -march=3Darmv7=
-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -=
mno-thumb -isystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv=
7a-oe-linux-uclibceabi/usr/include -fexpensive-optimizations -fomit-frame-p=
ointer -frename-registers -Os -fpermissive -fvisibility-inlines-hidden -rdy=
namic -Wl,-O1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutte=
r.o device.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.=
o eit.o eitscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o me=
nu.o menuitems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiv=
er.o recorder.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o =
shutdown.o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o=
 status.o svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o video=
dir.o -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig -lintl =C2=
=A0./libsi/libsi.a -o vdr
>> > > > >>
>> > > > >> ### fails
>> > > > >>
>> > > > >> =C2=A0 =C2=A0 =C2=A0 arm-oe-linux-uclibceabi-g++ -march=3Darmv7=
-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -=
mno-thumb -isystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv=
7a-oe-linux-uclibceabi/usr/include -fexpensive-optimizations -fomit-frame-p=
ointer -frename-registers -Os -pipe -fpermissive -fvisibility-inlines-hidde=
n -rdynamic -Wl,-O1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o=
 cutter.o device.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsub=
title.o eit.o eitscan.o epg.o filter.o font.o i18n.o interface.o keys.o lir=
c.o menu.o menuitems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o =
receiver.o recorder.o recording.o remote.o remux.o ringbuffer.o sdt.o secti=
ons.o shutdown.o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o=
 spu.o status.o svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o=
 videodir.o -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig =C2=A0=
./libsi/libsi.a -o vdr
>> > > > >>
>> > > > >> =C2=A0 =C2=A0 =C2=A0 $ wdiff log.do_compile.*
>> > > > >> =C2=A0 =C2=A0 =C2=A0 arm-oe-linux-uclibceabi-g++ -march=3Darmv7=
-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -=
mno-thumb -isystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv=
7a-oe-linux-uclibceabi/usr/include -fexpensive-optimizations -fomit-frame-p=
ointer -frename-registers -Os [--pipe-] -fpermissive -fvisibility-inlines-h=
idden -rdynamic -Wl,-O1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o conf=
ig.o cutter.o device.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dv=
bsubtitle.o eit.o eitscan.o epg.o filter.o font.o i18n.o interface.o keys.o=
 lirc.o menu.o menuitems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rc=
u.o receiver.o recorder.o recording.o remote.o remux.o ringbuffer.o sdt.o s=
ections.o shutdown.o skinclassic.o skins.o skinsttng.o sourceparams.o sourc=
es.o spu.o status.o svdrp.o themes.o thread.o timers.o tools.o transfer.o v=
dr.o videodir.o -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig {+=
-lintl+} =C2=A0./libsi/libsi.a -o vdr
>> > > > >>
>> > > > >> Now the question is why is the patch not applied [7] and why di=
d it start breaking with this commit.
>> > > > >
>> > > > > Ok, I am sorry, my last report was messed up. I did not reset to
>> > > > > a88aca1d but 49891de0 [8], where 7190532c [9]
>> > > > >
>> > > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0commit 7190532c5a810ef886e8607ce042a3=
19020f06c6
>> > > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0Author: Tom Rini <tom_rini@mentor.com=
>
>> > > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0Date: =C2=A0 Tue Jan 18 17:58:02 2011=
 -0700
>> > > > >
>> > > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdr: Switch to libc-ucl=
ibc
>> > > > >
>> > > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Tom Rini=
 <tom_rini@mentor.com>
>> > > > >
>> > > > > is applied, which seems to be the reason the patch is not applie=
d and
>> > > > > therefore `-lintl` not added.
>> > > >
>> > > > I have fixed a typo in it.
>> > >
>> > > Thank you for fixing this in cb23dffd [10].
>> > >
>> > > > Please retry latest master.
>> > >
>> > > Unfortunately the build still fails.
>> > >
>> > > I also tried to disable the features `largefile` and (second run
>> > > additionally) `ipv6` in `conf/distro/minimal-uclibc.conf` and run
>> > > `bitbake -k vdr` from scratch each time, but it failed too.
>> > >
>> > > Was that the right way to debug this? Do you have any other ideas?
>> >
>> > I encounter a strange thing from clean builds.
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake -k vdr # fails
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake -k console-image # works
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake -k x11-image # works
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 USE_NLS=3D"yes" bitbake -k # fails
>> >
>> > I have no clue what could cause this. I guess that `console-image` or
>> > `x11-image` force some different options to the internationalization
>> > programs and that this got changed with the `autotools.bbclass` change=
.
>> >
>> > Does anyone have a hint?
>>
>> Just a breadcrumb please? ;-)
>
> Bernhard, have you had time to take a look?
>
>

vdr built fine on minimal-uclibc/qemuarm on latest oe/master unless
its reproducible what you are seeing
It will be hard to fix it.

>
> Thanks,
>
> Paul
>
>
>> > > [10] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=
=3Dcb23dffdbe3c3a7432c2e2eb19742c254163c05a
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



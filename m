Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ph88e-0006uj-Rb
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 23:10:25 +0100
Received: by gwaa12 with SMTP id a12so1209701gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jan 2011 14:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=3pOAi1anlAVj5vsIqPY7kUn4fPXQWRMk5rSCnGf3hlo=;
	b=rWtlbnqfzs8UbQjI8YrBkj37kcpnsE/RgaaE1t1YKuc/1ama3XXvBtqzLY05Qn1Jdu
	6AVr7L1dLOX/TyrHEFe2oH5wZ9zGJS3k3/VPLP5Ncp5JuwEdixziDEdIklSwo7vXFpCi
	FMf63KVBZomivBKhx6CW7U+/ofsMxz6eB5rLo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Di9JxzN2a1ggoWznIydTwiGkcnj69+Nqj6HhchDiDM/26QFOkrV3nI7bHHZYoyp3n+
	rawRKAsSiqfii3JuSBUU0PkFfXEv1nN2SOBVREDckafwCPycSrYc7ShK4O9fAxsrM7tI
	P6PVcZl64V3RZ6f1badbNhNIEcKyECH1wCjGo=
Received: by 10.90.100.4 with SMTP id x4mr4035238agb.4.1295820579513; Sun, 23
	Jan 2011 14:09:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Sun, 23 Jan 2011 14:09:19 -0800 (PST)
In-Reply-To: <1295812624.3570.13.camel@mattotaupa>
References: <1295608972.12720.47.camel@mattotaupa>
	<AANLkTinbMr38A4-yGjyLkNL+ydrwS+R6r_OWZo2fh7KP@mail.gmail.com>
	<1295653195.4105.56.camel@mattotaupa>
	<1295684244.4098.2.camel@mattotaupa>
	<1295720592.3850.290.camel@mattotaupa>
	<AANLkTin86VuRC4KSVfY=zAqnV+EXEmVh37mwiJ0X4BRU@mail.gmail.com>
	<1295798887.12751.6.camel@mattotaupa>
	<1295812624.3570.13.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Jan 2011 14:09:19 -0800
Message-ID: <AANLkTi=0vr9MZ28ZtvzvpSGK0k39BjoXC-sH-fJZs4j_@mail.gmail.com>
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
X-List-Received-Date: Sun, 23 Jan 2011 22:10:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 23, 2011 at 11:57 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Sonntag, den 23.01.2011, 17:08 +0100 schrieb Paul Menzel:
>> Am Samstag, den 22.01.2011, 11:48 -0800 schrieb Khem Raj:
>> > On Sat, Jan 22, 2011 at 10:23 AM, Paul Menzel wrote:
>> > > The commit since when building fails is a88aca1d [6].
>> > >
>> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0commit a88aca1d7dfa3a08957dd49cb61bac850f=
197106
>> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0Author: Bernhard Reutner-Fischer <rep.dot=
.nop@gmail.com>
>> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0Date: =C2=A0 Wed Jan 12 20:34:55 2011 +01=
00
>> > >
>> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools.bbclass: pass dis=
tro_imposed_configure_flags
>> > >
>> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Acked-by: Khem Raj <raj.khe=
m@gmail.com>
>> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Acked-by: Tom Rini <tom_rin=
i@mentor.com>
>> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Bernhard Reu=
tner-Fischer <rep.dot.nop@gmail.com>
>> > >
>> > > Any idea?
>> >
>> > I see. I think its to do with enable-ipv6 or somesuch. Can you run
>> > do_configure for vdr before and after this commit and port
>> > the contents of line invoking configure.
>>
>> Strange. VDR just uses a plain Makefile and no Autotools. Since this
>> commit, it seems that `-lintl` is not passed.
>>
>> ### works
>>
>> =C2=A0 =C2=A0 =C2=A0 arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=
=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb=
 -isystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-lin=
ux-uclibceabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -Os -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl=
,-O1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o devic=
e.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o e=
itscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menu=
items.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o reco=
rder.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.=
o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o=
 svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -lj=
peg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig -lintl =C2=A0./libsi/=
libsi.a -o vdr
>>
>> ### fails
>>
>> =C2=A0 =C2=A0 =C2=A0 arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=
=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb=
 -isystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-lin=
ux-uclibceabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -Os -pipe -fpermissive -fvisibility-inlines-hidden -rdynam=
ic -Wl,-O1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutter.o=
 device.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o e=
it.o eitscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.=
o menuitems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.=
o recorder.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shu=
tdown.o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o st=
atus.o svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir=
.o -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig =C2=A0./libsi/l=
ibsi.a -o vdr
>>
>> =C2=A0 =C2=A0 =C2=A0 $ wdiff log.do_compile.*
>> =C2=A0 =C2=A0 =C2=A0 arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=
=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb=
 -isystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-lin=
ux-uclibceabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -Os [--pipe-] -fpermissive -fvisibility-inlines-hidden -rd=
ynamic -Wl,-O1 -Wl,--hash-style=3Dgnu audio.o channels.o ci.o config.o cutt=
er.o device.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle=
.o eit.o eitscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o m=
enu.o menuitems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o recei=
ver.o recorder.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o=
 shutdown.o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.=
o status.o svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o vide=
odir.o -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig {+-lintl+} =
=C2=A0./libsi/libsi.a -o vdr
>>
>> Now the question is why is the patch not applied [7] and why did it star=
t breaking with this commit.
>
> Ok, I am sorry, my last report was messed up. I did not reset to
> a88aca1d but 49891de0 [8], where 7190532c [9]
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0commit 7190532c5a810ef886e8607ce042a319020f06c=
6
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Author: Tom Rini <tom_rini@mentor.com>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Date: =C2=A0 Tue Jan 18 17:58:02 2011 -0700
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdr: Switch to libc-uclibc
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Tom Rini <tom_rin=
i@mentor.com>
>
> is applied, which seems to be the reason the patch is not applied and
> therefore `-lintl` not added.

I have fixed a typo in it. Please retry latest master.

-Khem



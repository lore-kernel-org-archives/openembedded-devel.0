Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PoMVj-0007uk-EP
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 21:56:07 +0100
Received: by pzk12 with SMTP id 12so591893pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 12:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=S/wVhEb01Yo3KCMQM0V/4Z2WuAPiTJitW+ER6vmly/s=;
	b=aQl3dpgmL/0p9JKHgmZXUkTVUbqGecIWBKiAc7FHVB3tFuSupkw0Y/4bn0CloSYdF1
	GEWM1dk3yrDl5TiHBZNE1N+Ow+j31g58sKr194ugHZkBmEswQOt4SPubS0r8zqVf18Tt
	KPxvZy6jDIN8wuvh7MvTjDyTje9CDd6cqQ4pk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=uZMlfyBNp8O+ppy887pJaBEy537i9JF4Jis/JytKGaT7ElDB0cnDECwj+VGv3/Ia6b
	HgWpGnuFPBeigK8IHdXiN2p/s2WbZIvfpNV74BzhRhzw9d4fecXRay4P7RkrLEc0K4sm
	E92Zn8VGuB3qFMzVAY90RlhOaQZTm/toRjM4g=
Received: by 10.142.203.18 with SMTP id a18mr1582957wfg.328.1297544099166;
	Sat, 12 Feb 2011 12:54:59 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm1346118wfa.23.2011.02.12.12.54.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Feb 2011 12:54:56 -0800 (PST)
Date: Sat, 12 Feb 2011 12:54:48 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110212205448.GA5098@gmail.com>
References: <AANLkTin86VuRC4KSVfY=zAqnV+EXEmVh37mwiJ0X4BRU@mail.gmail.com>
	<1295798887.12751.6.camel@mattotaupa>
	<1295812624.3570.13.camel@mattotaupa>
	<AANLkTi=0vr9MZ28ZtvzvpSGK0k39BjoXC-sH-fJZs4j_@mail.gmail.com>
	<1295832268.7645.54.camel@mattotaupa>
	<1296232598.21132.21.camel@mattotaupa>
	<1296495309.3819.0.camel@mattotaupa>
	<1297381611.3877.37.camel@mattotaupa>
	<AANLkTi=Ta_fk1kzBtKSqyXykNJdM1=Hqsv4QyGsW1ZyL@mail.gmail.com>
	<1297497230.6433.3.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1297497230.6433.3.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Sat, 12 Feb 2011 20:56:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (12/02/11 08:53), Paul Menzel wrote:
> Am Freitag, den 11.02.2011, 09:37 -0800 schrieb Khem Raj:
> > On Thu, Feb 10, 2011 at 3:46 PM, Paul Menzel wrote:
> > > Am Montag, den 31.01.2011, 18:35 +0100 schrieb Paul Menzel:
> > >> Am Freitag, den 28.01.2011, 17:36 +0100 schrieb Paul Menzel:
> > >> > Am Montag, den 24.01.2011, 02:24 +0100 schrieb Paul Menzel:
> > >> > > Am Sonntag, den 23.01.2011, 14:09 -0800 schrieb Khem Raj:
> > >> > > > On Sun, Jan 23, 2011 at 11:57 AM, Paul Menzel wrote:
> > >> > > > > Am Sonntag, den 23.01.2011, 17:08 +0100 schrieb Paul Menzel:
> > >> > > > >> Am Samstag, den 22.01.2011, 11:48 -0800 schrieb Khem Raj:
> > >> > > > >> > On Sat, Jan 22, 2011 at 10:23 AM, Paul Menzel wrote:
> > >> > > > >> > > The commit since when building fails is a88aca1d [6].
> > >> > > > >> > >
> > >> > > > >> > >        commit a88aca1d7dfa3a08957dd49cb61bac850f197106
> > >> > > > >> > >        Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> > >> > > > >> > >        Date:   Wed Jan 12 20:34:55 2011 +0100
> > >> > > > >> > >
> > >> > > > >> > >            autotools.bbclass: pass distro_imposed_configure_flags
> > >> > > > >> > >
> > >> > > > >> > >            Acked-by: Khem Raj <raj.khem@gmail.com>
> > >> > > > >> > >            Acked-by: Tom Rini <tom_rini@mentor.com>
> > >> > > > >> > >            Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> > >> > > > >> > >
> > >> > > > >> > > Any idea?
> > >> > > > >> >
> > >> > > > >> > I see. I think its to do with enable-ipv6 or somesuch. Can you run
> > >> > > > >> > do_configure for vdr before and after this commit and port
> > >> > > > >> > the contents of line invoking configure.
> > >> > > > >>
> > >> > > > >> Strange. VDR just uses a plain Makefile and no Autotools. Since this
> > >> > > > >> commit, it seems that `-lintl` is not passed.
> > >> > > > >>
> > >> > > > >> ### works
> > >> > > > >>
> > >> > > > >>       arm-oe-linux-uclibceabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb -isystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 -Wl,--hash-style=gnu audio.o channels.o ci.o config.o cutter.o device.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig -lintl  ./libsi/libsi.a -o vdr
> > >> > > > >>
> > >> > > > >> ### fails
> > >> > > > >>
> > >> > > > >>       arm-oe-linux-uclibceabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb -isystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 -Wl,--hash-style=gnu audio.o channels.o ci.o config.o cutter.o device.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig  ./libsi/libsi.a -o vdr
> > >> > > > >>
> > >> > > > >>       $ wdiff log.do_compile.*
> > >> > > > >>       arm-oe-linux-uclibceabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb -isystem/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os [--pipe-] -fpermissive -fvisibility-inlines-hidden -rdynamic -Wl,-O1 -Wl,--hash-style=gnu audio.o channels.o ci.o config.o cutter.o device.o diseqc.o dvbdevice.o dvbci.o dvbplayer.o dvbspu.o dvbsubtitle.o eit.o eitscan.o epg.o filter.o font.o i18n.o interface.o keys.o lirc.o menu.o menuitems.o nit.o osdbase.o osd.o pat.o player.o plugin.o rcu.o receiver.o recorder.o recording.o remote.o remux.o ringbuffer.o sdt.o sections.o shutdown.o skinclassic.o skins.o skinsttng.o sourceparams.o sources.o spu.o status.o svdrp.o themes.o thread.o timers.o tools.o transfer.o vdr.o videodir.o -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig {+-lintl+}  ./libsi/libsi.a -o vdr
> > >> > > > >>
> > >> > > > >> Now the question is why is the patch not applied [7] and why did it start breaking with this commit.
> > >> > > > >
> > >> > > > > Ok, I am sorry, my last report was messed up. I did not reset to
> > >> > > > > a88aca1d but 49891de0 [8], where 7190532c [9]
> > >> > > > >
> > >> > > > >        commit 7190532c5a810ef886e8607ce042a319020f06c6
> > >> > > > >        Author: Tom Rini <tom_rini@mentor.com>
> > >> > > > >        Date:   Tue Jan 18 17:58:02 2011 -0700
> > >> > > > >
> > >> > > > >            vdr: Switch to libc-uclibc
> > >> > > > >
> > >> > > > >            Signed-off-by: Tom Rini <tom_rini@mentor.com>
> > >> > > > >
> > >> > > > > is applied, which seems to be the reason the patch is not applied and
> > >> > > > > therefore `-lintl` not added.
> > >> > > >
> > >> > > > I have fixed a typo in it.
> > >> > >
> > >> > > Thank you for fixing this in cb23dffd [10].
> > >> > >
> > >> > > > Please retry latest master.
> > >> > >
> > >> > > Unfortunately the build still fails.
> > >> > >
> > >> > > I also tried to disable the features `largefile` and (second run
> > >> > > additionally) `ipv6` in `conf/distro/minimal-uclibc.conf` and run
> > >> > > `bitbake -k vdr` from scratch each time, but it failed too.
> > >> > >
> > >> > > Was that the right way to debug this? Do you have any other ideas?
> > >> >
> > >> > I encounter a strange thing from clean builds.
> > >> >
> > >> >         bitbake -k vdr # fails
> > >> >         bitbake -k console-image # works
> > >> >         bitbake -k x11-image # works
> > >> >         USE_NLS="yes" bitbake -k # fails
> > >> >
> > >> > I have no clue what could cause this. I guess that `console-image` or
> > >> > `x11-image` force some different options to the internationalization
> > >> > programs and that this got changed with the `autotools.bbclass` change.
> > >> >
> > >> > Does anyone have a hint?
> > >>
> > >> Just a breadcrumb please? ;-)
> > >
> > > Bernhard, have you had time to take a look?
> > 
> > vdr built fine on minimal-uclibc/qemuarm on latest oe/master
> 
> I did too with a clean build directory and `minimal-uclibc`.
> 
> 	MACHINE = "qemuarm" bitbake -k vdr
> 
> It failed for me again.
> 
> > unless its reproducible what you are seeing
> > It will be hard to fix it.
> 
> I can reproduce this every time when I build from a clean build
> directory (`rm -rf minimal-uclibc-dev`).

I see I think its due to catch 22 of gettext and libintl probably. Let me
see if it can be reproduced here. As it builds fine into familiar images
its
not that critical
> 
> As written above I cannot reproduce this when having built
> `console-image` or `x11-image` before. So I am wondering what “language
> specific options” they set or pass to the recipes.
> 
> 
> Thanks,
> 
> Paul
> 
> 
> > >> > > [10] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=cb23dffdbe3c3a7432c2e2eb19742c254163c05a



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




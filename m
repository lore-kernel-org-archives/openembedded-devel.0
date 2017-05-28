Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B43C060191
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 May 2017 19:11:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g15so12882558wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 May 2017 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ADUrtJscqNC7+pF2mS819qbUox51kdxcmiIWsCqon28=;
	b=DphjKlCIaogwlCr2H5tBpoJwL61VharCGLSn/m9pmKZBjRdLsgHBO3QfHHif72iK+6
	/fYEKi+OTGgZ8hU+JPJBT8TYoz5KTiHHV9JSPG0auraEVgdSwjTDvdXO8WTE8ly6AbtY
	zvX4NqT/ojyfbN3Imu6IRrmaMidv/qJ6rFfaJaw6zgSKvN2BrKyjQ1i3qQ0FngWodbRZ
	FGtKguXzS1W6KUq0hD4EEK8p3N0AF+6tz+k+zOw2ZCZZSHOQ6tqo17zZ/HqFY8NBC4iL
	xZvLQiXDKTLUnH4i7sg37drvjKGm3QfsGSO+hnLbRwH3YPRUy3QQ3eAflM1hdqNoK0b7
	w9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ADUrtJscqNC7+pF2mS819qbUox51kdxcmiIWsCqon28=;
	b=LU/HTZnHuIOooWg628noIZx9/BpT6E/iIPEAba+2SFGORMt0kSHMHT7kKLWTiigsi7
	Lc982Bv2CRs/It1owYcKscKaMzU0nV3UVHtuEhHZcyrcohuI/G4TKKMG5ZgXNstB/lsd
	tikasTUGQ+cCSnW9XA1tOlr7Sl6gfWn1FY5vV2Ozb9D/twF0L4DenUzSafEQAI0LTvTK
	CZnjcamSrmm9SSWU0Y5zl9r8AaRQbP541oJQs5wyppUQujtVOVC54/HAIP/NshfqZtNk
	5pqDzzdN2No4ciTFT7S1RTqn0ukqBNZFjr/yQrLftMBcMQeF0nThW6TQc32v8OQOgORH
	3IVw==
X-Gm-Message-State: AODbwcBFBBncjud6cxcHglSimORwbnQW5kIPHQJ2MuQd+gUuTBwUUCJk
	l5C9Tof8rWOlla949PaosKH0+Sav7p8i
X-Received: by 10.80.180.155 with SMTP id w27mr10113303edd.42.1495998716777;
	Sun, 28 May 2017 12:11:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Sun, 28 May 2017 12:11:26 -0700 (PDT)
In-Reply-To: <1495995096.3000.8.camel@gmail.com>
References: <20170528111040.22809-1-max.krummenacher@toradex.com>
	<CAMKF1sptWiD9vH0CVB86mFhaQMpiSY+3sAGd8E-B+hT2O08O9Q@mail.gmail.com>
	<1495995096.3000.8.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 28 May 2017 12:11:26 -0700
Message-ID: <CAMKF1spk821vLwfV_4GMEVZnVnNazEJqPwkA9FuHNcXJUt5m4A@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-oe][PATCH 1/2] gpsd: don't compile with gold
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 May 2017 19:11:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 28, 2017 at 11:11 AM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> Am Sonntag, den 28.05.2017, 09:04 -0700 schrieb Khem Raj:
>> On Sun, May 28, 2017 at 4:10 AM, Max Krummenacher <max.oss.09@gmail.com> wrote:
>> > When linking with gold libgps and libgpsd error out with:
>> >  | ./libgpsd.so: error: undefined reference to 'atan2'
>> >  | ./libgpsd.so: error: undefined reference to 'pow'
>> >  | ./libgpsd.so: error: undefined reference to 'sqrt'
>> >  | ./libgpsd.so: error: undefined reference to 'sin'
>> >  | ./libgpsd.so: error: undefined reference to 'cos'
>> >  | collect2: error: ld returned 1 exit status
>> >
>> > Using the bfd linker fixes the issue.
>>
>> It seems packages dont have proper linker rules.
>> perhaps a better fix is to add -lm to linker cmdline.
> -lm is part of the linker cmdline.
>
>  | arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=hard -
> -sysroot=/home/res/develop/oe-core/build/tmp-glibc/sysroots/apalis-imx6 -o gpsd -Wl,-O1 -Wl,--hash
> -style=gnu -Wl,--as-needed --sysroot=/home/res/develop/oe-core/build/tmp-glibc/sysroots/apalis-imx6
> -pthread -Wl,-rpath=/home/res/develop/oe-core/build/tmp-glibc/work/armv7at2hf-neon-angstrom-linux
> -gnueabi/gpsd/3.14-r0/gpsd-3.14 gpsd.o timehint.o shmexport.o dbusexport.o sd_socket.o -L.
> -L/home/res/develop/oe-core/build/tmp-glibc/sysroots/apalis-imx6/usr/lib -lrt -lbluetooth -ldbus-1
> -lgpsd -lusb-1.0 -lbluetooth -lgps -lm -ldbus-1
>
> One can get this link by linking the two shared objects '-lgps -lm' swapped '-lm -lgps', however I
> do not understand why that order matters.
> It does not help to add -lm when linking libgps.so.
>
> gpsd 3.16 seems do not be affected, the scons file however has been given quite same change.
>
> So, IMHO I'd rather use the linker which we now produces working binaries than to add yet one more
> patch to the scons file. That gives a commit we can use to backport for pyro and morty.
> Going forward we can use the update to 3.16 which allows to drop the majority of the patches we have
> now and builds also with gold.

its fine to use a workaround if there is no better solution. Lets try
to understand the root cause too while here before resorting to
shunning gold here. Since if we do it once issue will go latent.

gold warns about undefined symbols in shared libraries for which gold
has seen all the DT_NEEDED entries.  So if  shared libraries rely on
picking up symbols from other shared libraries that they do not
explicitly depend on, you will get an undefined symbol error. Which
could be the case with libgps.so here and if so that should be fixed
by correcting the linker cmd of libgps.so. alternatively that can be
avoided by using the --allow-shlib-undefined option.

>
> Max
>
>> >
>> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>> > ---
>> >  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes
>> > -navigation/gpsd/gpsd_3.14.bb
>> > index 4d00fea6d..fb02f9598 100644
>> > --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
>> > +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
>> > @@ -36,6 +36,8 @@ SYSTEMD_OESCONS = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
>> > 'f
>> >  export STAGING_INCDIR
>> >  export STAGING_LIBDIR
>> >
>> > +LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '',
>> > d)}"
>> > +
>> >  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
>> >  PACKAGECONFIG[bluez] = "bluez='true',bluez='false',${BLUEZ}"
>> >  PACKAGECONFIG[qt] = "qt='yes',qt='no',qt4-x11-free"
>> > --
>> > 2.12.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vijay.rathi@gmail.com>) id 1NKwVY-0003nm-5q
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 17:13:51 +0100
Received: by pwi18 with SMTP id 18so714094pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2009 08:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=DpBSo5fKhYQZikIz74xfJIkke7seaNRIQcJMIGjw9mc=;
	b=dq7PNltdeY2lqdrhot2oEUITtpuZnNHEryRRMDo2OlXlFbPEBpqWU6G+vkuJjp09ZX
	gIwmm4J2VoxGCkttPrFJ75zSmKJ8WfL22jCvGbc+c3aX1Bi8x4EPGhBIjZvZDlQe88kT
	mniS+W6uO78iQX6LYac5UgrwAs/dG9UXxWFBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=etnxZb44svg/DU76g8uZ694om5EmX15YzJCoJCGqtk4a2k6w5hYpiSv+z5Wpw1qY5C
	C5qRvbQ+8Z2CNxiGK1Wf7BZrwkNR/xehd4I2dg1DjGfiO3tiX48rNURb5hXmP9JWQhao
	BT9JPqIgWSo4yivy6vS62rmAwRpUIkFuFEi9Q=
MIME-Version: 1.0
Received: by 10.141.107.9 with SMTP id j9mr846189rvm.254.1260979919916; Wed, 
	16 Dec 2009 08:11:59 -0800 (PST)
In-Reply-To: <b381e0f80912160514m25966eex30346d116a3d0176@mail.gmail.com>
References: <b381e0f80912150646v710aa0ecy4c4526d78f5acde3@mail.gmail.com>
	<b381e0f80912160336t7a5a447as34fe2684abcc3649@mail.gmail.com>
	<4B28C8D2.3000101@kernelconcepts.de>
	<b381e0f80912160454t1fa01b67id1a1426bbe97c722@mail.gmail.com>
	<4B28D9D8.90102@balister.org>
	<b381e0f80912160514m25966eex30346d116a3d0176@mail.gmail.com>
Date: Wed, 16 Dec 2009 21:41:59 +0530
Message-ID: <b381e0f80912160811o56992c75l211de1c21ef07291@mail.gmail.com>
From: Vijay Rathi <vijay.rathi@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: vijay.rathi@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Issue with bitbake
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
X-List-Received-Date: Wed, 16 Dec 2009 16:13:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Everyone,

It seems that while compiling libsdlnative it is not able to find libts.

I checked log and found following.

NOTE: make
/bin/sh ./libtool --mode=link ccache gcc -o build/libSDL.la build/SDL.lo
build/SDL_error.lo build/SDL_fatal.lo build/SDL_audio.lo
build/SDL_audiocvt.lo build/SDL_audiodev.lo build/SDL_mixer.lo
build/SDL_mixer_MMX.lo build/SDL_mixer_MMX_VC.lo build/SDL_mixer_m68k.lo
build/SDL_wave.lo build/SDL_cdrom.lo build/SDL_cpuinfo.lo
build/SDL_active.lo build/SDL_events.lo build/SDL_expose.lo
build/SDL_keyboard.lo build/SDL_mouse.lo build/SDL_quit.lo
build/SDL_resize.lo build/SDL_rwops.lo build/SDL_joystick.lo
build/SDL_getenv.lo build/SDL_iconv.lo build/SDL_malloc.lo
build/SDL_qsort.lo build/SDL_stdlib.lo build/SDL_string.lo
build/SDL_thread.lo build/SDL_timer.lo build/SDL_RLEaccel.lo
build/SDL_blit.lo build/SDL_blit_0.lo build/SDL_blit_1.lo
build/SDL_blit_A.lo build/SDL_blit_N.lo build/SDL_bmp.lo build/SDL_cursor.lo
build/SDL_gamma.lo build/SDL_pixels.lo build/SDL_stretch.lo
build/SDL_surface.lo build/SDL_video.lo build/SDL_yuv.lo
build/SDL_yuv_mmx.lo build/SDL_yuv_sw.lo build/SDL_dummyaudio.lo
build/SDL_sysloadso.lo build/SDL_systhread.lo build/SDL_syssem.lo
build/SDL_sysmutex.lo build/SDL_syscond.lo build/SDL_sysjoystick.lo
build/SDL_systimer.lo build/SDL_syscdrom.lo
-L/home/dev/OE/angstrom-dev/staging/i686-linux/usr/lib
-Wl,-rpath-link,/home/dev/OE/angstrom-dev/staging/i686-linux/usr/lib
-Wl,-rpath,/home/dev/OE/angstrom-dev/staging/i686-linux/usr/lib -Wl,-O1 -lm
-ldl -lts -lpthread -no-undefined -rpath
/home/dev/OE/angstrom-dev/staging/i686-linux/usr/lib -release 1.2
-version-info 11:0:11
ccache gcc -shared  build/.libs/SDL.o build/.libs/SDL_error.o
build/.libs/SDL_fatal.o build/.libs/SDL_audio.o build/.libs/SDL_audiocvt.o
build/.libs/SDL_audiodev.o build/.libs/SDL_mixer.o
build/.libs/SDL_mixer_MMX.o build/.libs/SDL_mixer_MMX_VC.o
build/.libs/SDL_mixer_m68k.o build/.libs/SDL_wave.o build/.libs/SDL_cdrom.o
build/.libs/SDL_cpuinfo.o build/.libs/SDL_active.o build/.libs/SDL_events.o
build/.libs/SDL_expose.o build/.libs/SDL_keyboard.o build/.libs/SDL_mouse.o
build/.libs/SDL_quit.o build/.libs/SDL_resize.o build/.libs/SDL_rwops.o
build/.libs/SDL_joystick.o build/.libs/SDL_getenv.o build/.libs/SDL_iconv.o
build/.libs/SDL_malloc.o build/.libs/SDL_qsort.o build/.libs/SDL_stdlib.o
build/.libs/SDL_string.o build/.libs/SDL_thread.o build/.libs/SDL_timer.o
build/.libs/SDL_RLEaccel.o build/.libs/SDL_blit.o build/.libs/SDL_blit_0.o
build/.libs/SDL_blit_1.o build/.libs/SDL_blit_A.o build/.libs/SDL_blit_N.o
build/.libs/SDL_bmp.o build/.libs/SDL_cursor.o build/.libs/SDL_gamma.o
build/.libs/SDL_pixels.o build/.libs/SDL_stretch.o build/.libs/SDL_surface.o
build/.libs/SDL_video.o build/.libs/SDL_yuv.o build/.libs/SDL_yuv_mmx.o
build/.libs/SDL_yuv_sw.o build/.libs/SDL_dummyaudio.o
build/.libs/SDL_sysloadso.o build/.libs/SDL_systhread.o
build/.libs/SDL_syssem.o build/.libs/SDL_sysmutex.o
build/.libs/SDL_syscond.o build/.libs/SDL_sysjoystick.o
build/.libs/SDL_systimer.o build/.libs/SDL_syscdrom.o
-L/home/dev/OE/angstrom-dev/staging/i686-linux/usr/lib -lm -ldl -lts
-lpthread  -Wl,-rpath-link
-Wl,/home/dev/OE/angstrom-dev/staging/i686-linux/usr/lib -Wl,-rpath
-Wl,/home/dev/OE/angstrom-dev/staging/i686-linux/usr/lib -Wl,-O1 -Wl,-soname
-Wl,libSDL-1.2.so.0 -o build/.libs/libSDL-1.2.so.0.11.0
/usr/bin/ld: cannot find -lts
collect2: ld returned 1 exit status
make: *** [build/libSDL.la] Error 1
FATAL: oe_runmake failed

It seems that dependency is not set properly.

Regards,
Vijay

On Wed, Dec 16, 2009 at 6:44 PM, Vijay Rathi <vijay.rathi@gmail.com> wrote:

> Hi,
>
> Even after git pull, I am getting same build result.
> Is this branch broken? OR Am  I missing some dependency?
>
> I am not using -b option with bitbake anywhere.
>
> Regards,
> Vijay
>
>
> On Wed, Dec 16, 2009 at 6:30 PM, Philip Balister <philip@balister.org>wrote:
>
>> On 12/16/2009 07:54 AM, Vijay Rathi wrote:
>>
>>> Hi,
>>>
>>> Thanks for quick reply.
>>>
>>> I followed steps mentioned at :
>>>
>>> http://www.angstrom-distribution.org/building-angstrom
>>>
>>> I tried using two approach in different directory/environment
>>>
>>> 1. As mentioned in online manual, I added ->  MACHINE ?= "beagleboard"
>>> (which
>>> i feel incorrect)
>>> 2. As mentioned in online manual, I added ->  MACHINE = "beagleboard"
>>>
>>> But I had same results with - bitbake base-image ie. libsdl-native...
>>> failed
>>>
>>> I am using Fedora Core 9 on my host.
>>>
>>> Am I missing something?
>>>
>>
>> Try a git pull and restart the build.
>>
>> Philip
>>
>>
>>
>>
>>
>>> Regards,
>>> Vijay
>>>
>>> On Wed, Dec 16, 2009 at 5:17 PM, Florian Boor<
>>> florian.boor@kernelconcepts.de>  wrote:
>>>
>>>  Hi,
>>>>
>>>> Vijay Rathi schrieb:
>>>>
>>>>> I have recently setup the bitbake, OE development tree as per the  wiki
>>>>>
>>>> for
>>>>
>>>>> beagleboard.
>>>>>
>>>>
>>>> it would be good to have a link to which instruction you are referring.
>>>>
>>>>
>>>>> /home/dev/OE/angstrom-dev/work/i686-linux/libsdl-native-1.2.11-r2/temp/log.do_compile.12862
>>>>
>>>>> NOTE: Task failed:
>>>>>
>>>>> /home/dev/OE/angstrom-dev/work/i686-linux/libsdl-native-1.2.11-r2/temp/log.do_compile.12862
>>>>
>>>> these logs should provide the information to find out what's wrong. You
>>>> should
>>>> try to provide them through some pastebin if you need help to find out
>>>> what
>>>> actually went wrong.
>>>>
>>>> Greetings
>>>>
>>>> Florian
>>>>
>>>> --
>>>> The dream of yesterday                  Florian Boor
>>>> is the hope of today                    Tel: +49 271-771091-15
>>>> and the reality of tomorrow.            Fax: +49 271-771091-19
>>>> [Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
>>>>                                        http://www.kernelconcepts.de/en
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>>  _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>


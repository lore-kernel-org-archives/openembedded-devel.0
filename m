Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id DC1FF6FFFB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 07:10:09 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id y13so3816421oty.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 23:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=KLTez5d38u0QD8otfvBC78EGHqvlmea3EmJM+pBWHSU=;
	b=hrzT7KQFPS4cntDD8AyiM/iavvg9tufrK0e0UeoaKGG6yLmV85/e+/FQsrKnh7zm6R
	euzt02/hjxbqjcLLB/Ac6IXVkZcv8Xz54iymFavB1eZuknV0mtaJOiA2XvIjo2vGjeCO
	d8HY2RdC0N8emdb+UKqXmHuwXh1yp0aFRXk1gKl9qYz2gj0HpVT0jpxSd7tZOcbKnyvI
	exfNtxiJKG8ziqCmrt0rQtpnorqTUS6UELyhfiUetTjH1fNRSV9WZOmzVkC4vY1YJE2e
	fGwB4+jP+l5941YpauaxkGvIGt4womX8wfqbJULZStuajVa94njz7GdPulnrzmVFMncp
	xh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=KLTez5d38u0QD8otfvBC78EGHqvlmea3EmJM+pBWHSU=;
	b=V/hjrF9YkzaFM7BPQknUqgWl1mQu0z5X11QW4ZagkBUgdgRfmr8st0bw5TPhjDlNsI
	gaCGRoXSNir8Z7z8fGh+UbHjqv05SxcfVBZYXgL2LWnI73Fv7Dv/EbtJp1LJwt10reDF
	6hIwRjvANHF5JDsvchuoXLMct9PyLgrMZaFdeKcjQkElrofAflVhYf6AhyNbIilhDllD
	1ZGnV+uwa9E6fOli2/4P7z0QVb+ul3+//lLUWTSKxjyvwPwAuIOq69SzzB1HHLxQSHQR
	p4fI2M3Swaq+GrZI7IZuNx2vttmpn0ANPn/f/EiQqmhcvfnVbWtl7fuWtpuTu530JCwp
	yX9Q==
X-Gm-Message-State: AMke39kvlu7MxoVwVzcM7eBGlbl+NQQb1tNg/jjkaMbcr3fUoukSUOSWBi05Kl/j+WgM80S5HOkBeLJ1N7PjDw==
X-Received: by 10.157.66.27 with SMTP id q27mr4102463ote.246.1487315409384;
	Thu, 16 Feb 2017 23:10:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.82.86 with HTTP; Thu, 16 Feb 2017 23:10:08 -0800 (PST)
In-Reply-To: <CAMKF1spszaA1G0aMSzDXZ0uA56nFty4L=XPakXTd-O6_fExyEQ@mail.gmail.com>
References: <CALwQErrncghs0kw=JXCHHFbwZWN4f=9K4t2nH+Qdv=d1zf1WPw@mail.gmail.com>
	<CAMKF1spszaA1G0aMSzDXZ0uA56nFty4L=XPakXTd-O6_fExyEQ@mail.gmail.com>
From: Shrikant Bobade <bobadeshrikant@gmail.com>
Date: Fri, 17 Feb 2017 12:40:08 +0530
Message-ID: <CALwQErpSm7PMZrJ6jPzq24pXNh01KJ5oRSiF6NgO2rgiPTYZfw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Query regarding segfault during gstreamer playback with libx32
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
X-List-Received-Date: Fri, 17 Feb 2017 07:10:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 16, 2017 at 9:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Feb 16, 2017 at 2:28 AM, Shrikant Bobade
> <bobadeshrikant@gmail.com> wrote:
> > Hi All,
> >
> > I have prepared core-image-sato from poky: morty:
> > 6a1f33cc40bfac33cf030fe41e1a8efd1e5fad6f HEAD with libx32 support w.r.to
> > section 4.6.3 under
> > http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#support
,
> > while using gst. playback I am getting segfault, below are the setup
> > details & logs. Dose anyone else faced similar issue?
> >
> > Thanks
> > Shrikant
> >
> >
> > 1.with libx32 support: added below stuff to local.conf
> >
> > MACHINE = "qemux86-64"
> > DEFAULTTUNE = "x86-64-x32"
> > baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE',
True) \
> >          or 'INVALID'), True) or 'lib'}"
> >
> > 2. gstreamer1.0-plugins-good/base/bad available with image.
> >
> > 3. build conf:
> > Build Configuration:
> > BB_VERSION        = "1.32.0"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "universal-4.8"
> > TARGET_SYS        = "x86_64-poky-linux-gnux32"
> > MACHINE           = "qemux86-64"
> > DISTRO            = "poky"
> > DISTRO_VERSION    = "2.2.1"
> > TUNE_FEATURES     = "mx32"
> > TARGET_FPU        = ""
> > meta
> > meta-poky
> > meta-yocto-bsp    = "morty:6a1f33cc40bfac33cf030fe41e1a8efd1e5fad6f"
> >
> > 4. bt log
> > #0  0xf67ef8fd in poll () from /libx32/libc.so.6
> > #1  0xf6d04eb5 in ?? () from /usr/libx32/libglib-2.0.so.0
> > #2  0xf6d05222 in g_main_loop_run () from /usr/libx32/libglib-2.0.so.0
> > #3  0xf724f01e in gst_bus_poll () from /usr/libx32/libgstreamer-1.0.so.0
> > #4  0x00403a78 in ?? ()
> > #5  0x00402a25 in ?? ()
> > #6  0xf672e54d in __libc_start_main () from /libx32/libc.so.6
> > #7  0x00403048 in ?? ()
> >
>
> may be you can add debug info to image to get better trace.

thanks , yes with more debug info getting segfault in
gst_audio_sink_ring_buffer_acquire around orc_memset,

debug trace:

Thread 1 "gst-launch-1.0" hit Breakpoint 1, gst_bus_poll
(bus=bus@entry=0x6c4b98,
events=events@entry=GST_MESSAGE_ANY, timeout=18446744073709551615)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstbus.c:1132
1132 {
(gdb) n
1137  g_return_val_if_fail (GST_IS_BUS (bus), NULL);
(gdb) n
1139  poll_data = g_slice_new (GstBusPollData);
(gdb) n

Thread 11 "aqueue:src" received signal SIGSEGV, Segmentation fault.
[Switching to LWP 1049]
0xf7f8a0c4 in ?? ()
(gdb) bt
#0  0xf7f8a0c4 in ?? ()
#1  0xf4ff432b in orc_memset () from /usr/libx32/liborc-0.4.so.0
#2  0xf593d08c in gst_audio_sink_ring_buffer_acquire (buf=<optimized out>,
spec=<optimized out>)
    at
/usr/src/debug/gstreamer1.0-plugins-base/1.8.3-r0/gst-plugins-base-1.8.3/gst-libs/gst/audio/gstaudiosink.c:419
#3  0xf5918ec2 in gst_audio_ring_buffer_acquire (buf=<optimized out>,
spec=spec@entry=0x7560d8)
    at
/usr/src/debug/gstreamer1.0-plugins-base/1.8.3-r0/gst-plugins-base-1.8.3/gst-libs/gst/audio/gstaudioringbuffer.c:571
#4  0xf5937213 in gst_audio_base_sink_setcaps (bsink=<optimized out>,
caps=<optimized out>)
    at
/usr/src/debug/gstreamer1.0-plugins-base/1.8.3-r0/gst-plugins-base-1.8.3/gst-libs/gst/audio/gstaudiobasesink.c:975
#5  0xf52792db in gst_base_sink_default_event (basesink=<optimized out>,
event=<optimized out>) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/libs/gst/base/gstbasesink.c:3146
#6  0xf5274d04 in gst_base_sink_event (pad=<optimized out>,
parent=<optimized out>, event=<optimized out>)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/libs/gst/base/gstbasesink.c:3252
#7  0xf7b2332f in gst_pad_send_event_unchecked (pad=pad@entry=0x745428,
event=event@entry=0xf443a5c0, type=<optimized out>, type@entry
=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5587
#8  0xf7b2361d in gst_pad_push_event_unchecked (pad=pad@entry=0xf4464a48,
event=0xf443a5c0, type=type@entry=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5245
#9  0xf7b23c08 in push_sticky (pad=pad@entry=0xf4464a48,
ev=ev@entry=0xe295efd0,
user_data=user_data@entry=0xe295f030)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3790
#10 0xf7b21910 in events_foreach (pad=pad@entry=0xf4464a48,
func=func@entry=0xf7b23ac0
<push_sticky>, user_data=user_data@entry=0xe295f030)
    at /usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:603
#11 0xf7b2d713 in check_sticky (event=0xf443a5c0, pad=0xf4464a48) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3847
#12 gst_pad_push_event (pad=pad@entry=0xf4464a48, event=<optimized out>) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5376
#13 0xf7b2d887 in event_forward_func (pad=pad@entry=0xf4464a48,
data=data@entry=0xe295f140) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:2993
#14 0xf7b293d1 in gst_pad_forward (pad=<optimized out>,
forward=forward@entry=0xf7b2d7d0 <event_forward_func>,
user_data=user_data@entry=0xe295f140)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:2947
#15 0xf7b2950b in gst_pad_event_default (pad=<optimized out>,
parent=<optimized out>, event=<optimized out>) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3044
#16 0xf7b2332f in gst_pad_send_event_unchecked (pad=pad@entry=0xf4493098,
event=event@entry=0xf443a5c0, type=<optimized out>, type@entry
=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5587
#17 0xf7b2361d in gst_pad_push_event_unchecked (pad=pad@entry=0xf4497578,
event=0xf443a5c0, type=type@entry=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5245
#18 0xf7b23c08 in push_sticky (pad=pad@entry=0xf4497578,
ev=ev@entry=0xe295f2e0,
user_data=user_data@entry=0xe295f340)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3790
#19 0xf7b21910 in events_foreach (pad=pad@entry=0xf4497578,
func=func@entry=0xf7b23ac0
<push_sticky>, user_data=user_data@entry=0xe295f340)
    at /usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:603
#20 0xf7b2d713 in check_sticky (event=0xf443a5c0, pad=0xf4497578) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3847
#21 gst_pad_push_event (pad=pad@entry=0xf4497578, event=<optimized out>) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5376
#22 0xf528f5d8 in gst_pad_set_caps (caps=<optimized out>, pad=0xf4497578)
at /usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstcompat.h:58
#23 gst_base_transform_setcaps (trans=trans@entry=0xf449c178,
pad=<optimized out>, incaps=<optimized out>)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/libs/gst/base/gstbasetransform.c:1387
#24 0xf52909bc in gst_base_transform_sink_eventfunc (trans=<optimized out>,
event=<optimized out>)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/libs/gst/base/gstbasetransform.c:1939
#25 0xf7b2332f in gst_pad_send_event_unchecked (pad=pad@entry=0xf4497428,
event=event@entry=0xf443a578, type=<optimized out>, type@entry
=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5587
#26 0xf7b2361d in gst_pad_push_event_unchecked (pad=pad@entry=0xf4497ab8,
event=0xf443a578, type=type@entry=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5245
#27 0xf7b23c08 in push_sticky (pad=pad@entry=0xf4497ab8,
ev=ev@entry=0xe295f600,
user_data=user_data@entry=0xe295f660)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3790
#28 0xf7b21910 in events_foreach (pad=pad@entry=0xf4497ab8,
func=func@entry=0xf7b23ac0
<push_sticky>, user_data=user_data@entry=0xe295f660)
    at /usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:603
#29 0xf7b2d713 in check_sticky (event=0xf443a578, pad=0xf4497ab8) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3847
#30 gst_pad_push_event (pad=pad@entry=0xf4497ab8, event=<optimized out>) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5376
---Type <return> to continue, or q <return> to quit---
#31 0xf528f5d8 in gst_pad_set_caps (caps=<optimized out>, pad=0xf4497ab8)
at /usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstcompat.h:58
#32 gst_base_transform_setcaps (trans=trans@entry=0xf44a23b0,
pad=<optimized out>, incaps=<optimized out>)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/libs/gst/base/gstbasetransform.c:1387
#33 0xf52909bc in gst_base_transform_sink_eventfunc (trans=<optimized out>,
event=<optimized out>)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/libs/gst/base/gstbasetransform.c:1939
#34 0xf7b2332f in gst_pad_send_event_unchecked (pad=pad@entry=0xf4497ea8,
event=event@entry=0xf443a530, type=<optimized out>, type@entry
=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5587
#35 0xf7b2361d in gst_pad_push_event_unchecked (pad=pad@entry=0xf4497d58,
event=0xf443a530, type=type@entry=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5245
#36 0xf7b23c08 in push_sticky (pad=pad@entry=0xf4497d58,
ev=ev@entry=0xe295f920,
user_data=user_data@entry=0xe295f980)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3790
#37 0xf7b21910 in events_foreach (pad=pad@entry=0xf4497d58,
func=func@entry=0xf7b23ac0
<push_sticky>, user_data=user_data@entry=0xe295f980)
    at /usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:603
#38 0xf7b2d713 in check_sticky (event=0xf443a530, pad=0xf4497d58) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3847
#39 gst_pad_push_event (pad=pad@entry=0xf4497d58, event=<optimized out>) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5376
#40 0xf528f5d8 in gst_pad_set_caps (caps=<optimized out>, pad=0xf4497d58)
at /usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstcompat.h:58
#41 gst_base_transform_setcaps (trans=trans@entry=0xf44a0a90,
pad=<optimized out>, incaps=<optimized out>)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/libs/gst/base/gstbasetransform.c:1387
#42 0xf52909bc in gst_base_transform_sink_eventfunc (trans=<optimized out>,
event=<optimized out>)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/libs/gst/base/gstbasetransform.c:1939
#43 0xf7b2332f in gst_pad_send_event_unchecked (pad=pad@entry=0xf4497c08,
event=event@entry=0xf3a08628, type=<optimized out>, type@entry
=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5587
#44 0xf7b2361d in gst_pad_push_event_unchecked (pad=pad@entry=0x749e98,
event=0xf3a08628, type=type@entry=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5245
#45 0xf7b23c08 in push_sticky (pad=pad@entry=0x749e98, ev=ev@entry=0xe295fc40,
user_data=user_data@entry=0xe295fca0) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3790
#46 0xf7b21910 in events_foreach (pad=pad@entry=0x749e98,
func=func@entry=0xf7b23ac0
<push_sticky>, user_data=user_data@entry=0xe295fca0)
    at /usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:603
#47 0xf7b2d713 in check_sticky (event=0xf3a08628, pad=0x749e98) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3847
#48 gst_pad_push_event (pad=pad@entry=0x749e98, event=<optimized out>) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5376
#49 0xf7b2d887 in event_forward_func (pad=pad@entry=0x749e98,
data=data@entry=0xe295fdb0) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:2993
#50 0xf7b293d1 in gst_pad_forward (pad=<optimized out>,
forward=forward@entry=0xf7b2d7d0 <event_forward_func>,
user_data=user_data@entry=0xe295fdb0)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:2947
#51 0xf7b2950b in gst_pad_event_default (pad=pad@entry=0xf44648d8,
parent=parent@entry=0xf4497030, event=<optimized out>)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3044
#52 0xf6044286 in gst_play_sink_convert_bin_sink_event (pad=<optimized
out>, parent=<optimized out>, event=<optimized out>)
    at
/usr/src/debug/gstreamer1.0-plugins-base/1.8.3-r0/gst-plugins-base-1.8.3/gst/playback/gstplaysinkconvertbin.c:260
#53 0xf7b2332f in gst_pad_send_event_unchecked (pad=pad@entry=0xf44648d8,
event=event@entry=0xf3a08628, type=<optimized out>, type@entry
=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5587
#54 0xf7b2361d in gst_pad_push_event_unchecked (pad=pad@entry=0xf4485ea0,
event=0xf3a08628, type=type@entry=GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5245
#55 0xf7b23c08 in push_sticky (pad=pad@entry=0xf4485ea0,
ev=ev@entry=0xe295ffb0,
user_data=user_data@entry=0xe2960010)
    at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3790
#56 0xf7b21910 in events_foreach (pad=pad@entry=0xf4485ea0,
func=func@entry=0xf7b23ac0
<push_sticky>, user_data=user_data@entry=0xe2960010)
    at /usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:603
#57 0xf7b2d713 in check_sticky (event=0xf3a08628, pad=0xf4485ea0) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:3847
#58 gst_pad_push_event (pad=<optimized out>, event=event@entry=0xf3a08628)
at /usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gstpad.c:5376
#59 0xf4db9a5a in gst_queue_push_one (queue=0x6eed28) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/plugins/elements/gstqueue.c:1432
#60 gst_queue_loop (pad=<optimized out>) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/plugins/elements/gstqueue.c:1509
#61 0xf7b55a63 in gst_task_func (task=<optimized out>) at
/usr/src/debug/gstreamer1.0/1.8.3-r0/gstreamer-1.8.3/gst/gsttask.c:332
#62 0xf75d4c04 in g_thread_pool_thread_proxy (data=<optimized out>) at
/usr/src/debug/glib-2.0/1_2.48.2-r0/glib-2.48.2/glib/gthreadpool.c:307
---Type <return> to continue, or q <return> to quit---
#63 0xf75d4258 in g_thread_proxy (data=<optimized out>) at
/usr/src/debug/glib-2.0/1_2.48.2-r0/glib-2.48.2/glib/gthread.c:780
#64 0xf7357c54 in start_thread (arg=<optimized out>) at
/usr/src/debug/glibc/2.24-r0/git/nptl/pthread_create.c:333
#65 0xf70a200f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:105
(gdb)

debugging further, meanwhile any pointers will be helpful.

Thanks
Shrikant

>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


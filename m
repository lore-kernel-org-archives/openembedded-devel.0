Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id 075C96AD81
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 12:29:57 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id w16so4594784vbb.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 05:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=l3Ze1bHw/IkDzr5U5qInL/hoflHu8fXee+SX/Lg1UBw=;
	b=n6EvhP6pYt5Der92vH8tODCG1Gt5F/COmLS0z/7kMoQzUm8/00FlnSssb6XFtAg3DQ
	M7Uop0TJ8GXka7U0/cjrToGrcGInnCTPN2JI3dI7QyKA5T8aMLrUbcLvFbs/CLqsa6Nv
	OW8NG//5NpN3K2TyLI8M9/KgeNrDI4oXS3Mfj1iSl8T/lvsTkLZceznYmzJHQy35WVgm
	OjxPaCTGbEVlA7SizXgmpChvGFoYH2i6ekwiRqhzSx6FZkVszWq0/Gb1QjB4VHJsyhxC
	Z67cj7QNkla08XM2sN36xvsr+1FdsU3mfu4qs/J7EaQPropzF81wGE1BZ9ukhHEElqCj
	A/UA==
X-Received: by 10.220.98.68 with SMTP id p4mr2584573vcn.28.1371731398508; Thu,
	20 Jun 2013 05:29:58 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Thu, 20 Jun 2013 05:29:18 -0700 (PDT)
In-Reply-To: <1371564585-12373-1-git-send-email-philip@balister.org>
References: <1371564585-12373-1-git-send-email-philip@balister.org>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 20 Jun 2013 13:29:18 +0100
X-Google-Sender-Auth: HyuYZtvVPLT0ZLVAtfI4MAdaIgE
Message-ID: <CANyK_8cBxFzaRDi16ZZHiUsLERzoSUj_WfzQSVNQhH1h27iLLg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gnuradio : Update to 3.6.5. Also fix for docs, packaging, and grc RDEPENDS.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jun 2013 12:29:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 June 2013 15:09, Philip Balister <philip@balister.org> wrote:
>  * Fix packaging so grc and examples packages are not empty.
>  * Account for addition of gr-modtool.
>  * Update to version 3.6.5 of GNU Radio.
>  * Update RDEPENDS for grc to add python-netserver.
>  * Try even harder to stop docs from getting built.

Just tried building gnuradio with this patch applied. The system
topped out at 5GB RAM and 4GB swap used (everything on the system)
then:

[ 94%] Building CXX object
gr-analog/swig/CMakeFiles/_analog_swig.dir/analog_swigPYTHON_wrap.cxx.o
cd /home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-analog/swig
&& /home/pbarker/build/20130619_poky/build/tmp/sysroots/x86_64-lin
ux/usr/bin/armv6-vfp-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++
-DENABLE_GR_LOG -D_analog_swig_EXPORTS -march=armv6 -mthumb-interwork
-mfloat-abi=softfp   --sysroot=/home/pbarker/build/
20130619_poky/build/tmp/sysroots/raspberrypi  -O2 -pipe -g
-feliminate-unused-debug-types -fpermissive
-fvisibility-inlines-hidden -fpermissive -O2 -pipe -g
-feliminate-unused-debug-types  -
O2 -pipe -g -feliminate-unused-debug-types -fpermissive
-fvisibility-inlines-hidden -DNDEBUG -fPIC
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.
6.5-r0/git/gr-analog/include
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-analog/include
-I/home/pbarker/build/20130619_poky
/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gr-filter/lib
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gr-filt
er/include -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-filter/lib
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-
vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-filter/include
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/l
ib/runtime -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gnuradio-core/src/lib/general
-I/home/pbarker/build/20130619_poky/build
/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/general
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/g
it/build/gnuradio-core/src/lib/gengen
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/gengen
-I/home/pbarker/build
/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gnuradio-core/src/lib/filter
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gn
ueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/filter
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/missing
-
I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/reed-solomon
-I/home/pbarker/build/20130619_poky/build/tmp/work/arm
v6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/viterbi
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-c
ore/src/lib/io -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gnuradio-core/src/lib/swig
-I/home/pbarker/build/20130619_poky/buil
d/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/swig
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git
/gnuradio-core/src/lib/hier
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build
-I/home/pbarker/build/20130619_poky/build/tmp/work/arm
v6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gruel/src/swig
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gruel/src/swig
-I/h
ome/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gruel/src/include
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gn
ueabi/gnuradio/3.6.5-r0/git/build/gruel/src/include
-I/home/pbarker/build/20130619_poky/build/tmp/sysroots/raspberrypi/usr/include
-I/home/pbarker/build/20130619_poky/build/tmp/sysroots/rasp
berrypi/usr/include/python2.7
-I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gr-analog/swig
-I/home/pbarker/build/20130619_poky/build/t
mp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-analog/swig
   -fvisibility=hidden -Wsign-compare -Wall -Wno-uninitialized -o
CMakeFiles/_analog_swig.dir/analog_swigPYTHO
N_wrap.cxx.o -c
/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-analog/swig/analog_swigPYTHON_wrap.cxx
arm-poky-linux-gnueabi-g++: internal compiler error: Killed (program cc1plus)
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.

Should this really be using over 1GB RAM per cc1plus process to
compile this? I think something broke somewhere. I'll try building
this from scratch in a new build directory and let you know how it
goes.

This is with MACHINE=raspberrypi and using gcc 4.7.2.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id BFDA360810
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 14:18:17 +0000 (UTC)
Received: (qmail 6883 invoked by uid 1003); 20 Jun 2013 14:18:17 -0000
Received: from unknown (HELO ?192.168.1.122?) (philip@opensdr.com@71.171.20.82)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	20 Jun 2013 14:18:17 -0000
Message-ID: <51C30F28.2090607@balister.org>
Date: Thu, 20 Jun 2013 10:18:16 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1371564585-12373-1-git-send-email-philip@balister.org>
	<CANyK_8cBxFzaRDi16ZZHiUsLERzoSUj_WfzQSVNQhH1h27iLLg@mail.gmail.com>
In-Reply-To: <CANyK_8cBxFzaRDi16ZZHiUsLERzoSUj_WfzQSVNQhH1h27iLLg@mail.gmail.com>
X-Enigmail-Version: 1.5.1
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
X-List-Received-Date: Thu, 20 Jun 2013 14:18:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/20/2013 08:29 AM, Paul Barker wrote:
> On 18 June 2013 15:09, Philip Balister <philip@balister.org> wrote:
>>  * Fix packaging so grc and examples packages are not empty.
>>  * Account for addition of gr-modtool.
>>  * Update to version 3.6.5 of GNU Radio.
>>  * Update RDEPENDS for grc to add python-netserver.
>>  * Try even harder to stop docs from getting built.
> 
> Just tried building gnuradio with this patch applied. The system
> topped out at 5GB RAM and 4GB swap used (everything on the system)
> then:

My machine says:

[balister@thuvia ~]$ free -g
             total       used       free     shared    buffers     cached
Mem:            19         16          3          0          1          7
-/+ buffers/cache:          7         12
Swap:            5          0          5


Compiling the c++ output of swig is known to consume loads of ram.

Philip


> 
> [ 94%] Building CXX object
> gr-analog/swig/CMakeFiles/_analog_swig.dir/analog_swigPYTHON_wrap.cxx.o
> cd /home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-analog/swig
> && /home/pbarker/build/20130619_poky/build/tmp/sysroots/x86_64-lin
> ux/usr/bin/armv6-vfp-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++
> -DENABLE_GR_LOG -D_analog_swig_EXPORTS -march=armv6 -mthumb-interwork
> -mfloat-abi=softfp   --sysroot=/home/pbarker/build/
> 20130619_poky/build/tmp/sysroots/raspberrypi  -O2 -pipe -g
> -feliminate-unused-debug-types -fpermissive
> -fvisibility-inlines-hidden -fpermissive -O2 -pipe -g
> -feliminate-unused-debug-types  -
> O2 -pipe -g -feliminate-unused-debug-types -fpermissive
> -fvisibility-inlines-hidden -DNDEBUG -fPIC
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.
> 6.5-r0/git/gr-analog/include
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-analog/include
> -I/home/pbarker/build/20130619_poky
> /build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gr-filter/lib
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gr-filt
> er/include -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-filter/lib
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-
> vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-filter/include
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/l
> ib/runtime -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gnuradio-core/src/lib/general
> -I/home/pbarker/build/20130619_poky/build
> /tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/general
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/g
> it/build/gnuradio-core/src/lib/gengen
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/gengen
> -I/home/pbarker/build
> /20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gnuradio-core/src/lib/filter
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gn
> ueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/filter
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/missing
> -
> I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/reed-solomon
> -I/home/pbarker/build/20130619_poky/build/tmp/work/arm
> v6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/viterbi
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-c
> ore/src/lib/io -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gnuradio-core/src/lib/swig
> -I/home/pbarker/build/20130619_poky/buil
> d/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gnuradio-core/src/lib/swig
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git
> /gnuradio-core/src/lib/hier
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build
> -I/home/pbarker/build/20130619_poky/build/tmp/work/arm
> v6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gruel/src/swig
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gruel/src/swig
> -I/h
> ome/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gruel/src/include
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gn
> ueabi/gnuradio/3.6.5-r0/git/build/gruel/src/include
> -I/home/pbarker/build/20130619_poky/build/tmp/sysroots/raspberrypi/usr/include
> -I/home/pbarker/build/20130619_poky/build/tmp/sysroots/rasp
> berrypi/usr/include/python2.7
> -I/home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/gr-analog/swig
> -I/home/pbarker/build/20130619_poky/build/t
> mp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-analog/swig
>    -fvisibility=hidden -Wsign-compare -Wall -Wno-uninitialized -o
> CMakeFiles/_analog_swig.dir/analog_swigPYTHO
> N_wrap.cxx.o -c
> /home/pbarker/build/20130619_poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/gnuradio/3.6.5-r0/git/build/gr-analog/swig/analog_swigPYTHON_wrap.cxx
> arm-poky-linux-gnueabi-g++: internal compiler error: Killed (program cc1plus)
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://gcc.gnu.org/bugs.html> for instructions.
> 
> Should this really be using over 1GB RAM per cc1plus process to
> compile this? I think something broke somewhere. I'll try building
> this from scratch in a new build directory and let you know how it
> goes.
> 
> This is with MACHINE=raspberrypi and using gcc 4.7.2.
> 
> --
> Paul Barker
> 
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 


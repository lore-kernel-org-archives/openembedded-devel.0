Return-Path: <andrei@gherzan.ro>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5255C6AC85
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Aug 2014 23:06:49 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id q5so3283680wiv.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Aug 2014 16:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=9Bw8W2438xkdxsGC3ubJDhiJ0/zBRcVouXiXgCeiwlk=;
	b=HpgVKwPl0TNIE8sLwhAg/5QODAALjRqoxNGftx+4WKn5Fcp6iWnGIdcw5mNWhbI1D+
	XVvSb2+KBS1XlhicQ6Lifwv1FWNRIPm+t1VgtozkNuUDXDu7VwRq2gRmVliwlJDYY+ob
	6OU4bzzKPNw4DP5UtowQryDANJucWR6AbcSVyPhiwXuah7UHTDwwRQ9JNvKDs2zg3o2W
	I1ZamNAi9qeoD/tfuDwMKxrVn62ikP5xuw0nIfJW7bM1BAyvQbEEF+NGsOirfHuP2qPV
	008Ib4h2DPO0R6UXsrlv84NnGG5r2MCa2Yb0yhoimqtbeCaCFyuUgiZEXaUHXs4mWwwD
	/SMQ==
X-Gm-Message-State: ALoCoQkwJZXXyj8dDfBYv75MLtGtNP2+s2Iz3jsT7CjC2dYVJOswSGGysAskMQ6E12GLHU6YgFKG
X-Received: by 10.180.184.20 with SMTP id eq20mr6756329wic.37.1409353610232;
	Fri, 29 Aug 2014 16:06:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.76.5 with HTTP; Fri, 29 Aug 2014 16:06:30 -0700 (PDT)
X-Originating-IP: [195.249.189.34]
In-Reply-To: <20140827120857.GD20524@jama>
References: <1408903501-5728-1-git-send-email-andrei@gherzan.ro>
	<20140827120857.GD20524@jama>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sat, 30 Aug 2014 01:06:30 +0200
Message-ID: <CAK18fxEBqgkznp0dBMeP+6X=VwMzzR4RgZ6Jc6F=d3o9JqousA@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH V2 1/1] xbmc: Update to v13.2
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
X-List-Received-Date: Fri, 29 Aug 2014 23:06:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 27, 2014 at 2:08 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Sun, Aug 24, 2014 at 08:05:01PM +0200, Andrei Gherzan wrote:
> > * refactor dependencies
> > * remove already merged patches
> > * define PACKAGECONFIG for different configurations
> > * have above PACKAGECONFIG values activated by default
> > * various cleanups and refactoring
> > * use internal ffmpeg - there are some known issues while compiling
> > with external libav
> > * define --with-arch to be passed to internal ffmpeg configuration
> > script
> > * add support for qemuarm
> > * add libcec, rtmpdump to DEPENDS
> > * add libpulsecommon to RDEPENDS
> >
> > Tested on Fedora 20 host using poky + meta-oe master:
> > 1. build only qemux86
> > 2. build only qemuarm
> > 3. build and runtime test raspberrypi - (patches to come).
>
> Fails in world builds for qemux86-64 with:
>
> | [ 48%] Building CXX object CMakeFiles/projectM.dir/fftsg.cpp.o
> | CC    libavfilter/vf_histeq.o
> | CC    libavfilter/vf_histogram.o
> | CPP     xbmc/utils/SortUtils.o
> | CPP     xbmc/utils/Splash.o
> | depbase=`echo ../common.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
> |       x86_64-oe-linux-g++  -m64 -march=core2 -mtune=core2 -msse3
> -mfpmath=sse
> --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64
> -DHAVE_CONFIG_H -I. -I../..  -DPKGDATADIR=\"/usr/share/rsxs\" -I./..
> -I../../lib  -D_LINUX -DXBMC    -O2  -O2 -pipe -g
> -feliminate-unused-debug-types -fvisibility-inlines-hidden -fPIC -DPIC
> -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -D_DEBUG -Wall
> -MT ../common.o -MD -MP -MF $depbase.Tpo -c -o ../common.o ../common.cc &&\
> |       mv -f $depbase.Tpo $depbase.Po
> | CC    libavfilter/vf_hqdn3d.o
> | CPP     xbmc/guilib/GUIListGroup.o
> | CPP     xbmc/utils/Stopwatch.o
> | CPP     xbmc/utils/StreamDetails.o
> | CC    libavfilter/vf_hue.o
> | In file included from ../common.cc:50:0:
> |
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include/c++/4.9.1/ctime:70:11:
> error: '::gmtime' has not been declared
> |    using ::gmtime;
> |            ^
> |
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include/c++/4.9.1/ctime:71:11:
> error: '::localtime' has not been declared
> |    using ::localtime;
> |            ^
> | make[5]: *** [../common.o] Error 1
> | make[5]: Leaving directory
> `/home/jenkins/oe/world/shr-core/tmp-eglibc/work/core2-64-oe-linux/xbmc/13.2-r0/git/xbmc/screensavers/rsxs-0.9/src/euphoria'
> | make[4]: *** [all-recursive] Error 1
>
> (this is the same error which was mentioned in PNBLACKLIST before)
>

Will try to reproduce it on 64.


>
> and qemuarm:
> | CC      lib/vgmstream/src/coding/mpeg_decoder.o
> | OpenMaxVideo.cpp:59:8: error: 'PFNEGLCREATEIMAGEKHRPROC' does not name a
> type
> |  static PFNEGLCREATEIMAGEKHRPROC eglCreateImageKHR;
> |         ^
> | OpenMaxVideo.cpp:60:8: error: 'PFNEGLDESTROYIMAGEKHRPROC' does not name
> a type
> |  static PFNEGLDESTROYIMAGEKHRPROC eglDestroyImageKHR;
> |         ^
> ....
> | In file included from OpenMaxVideo.cpp:32:0:
> | DVDVideoCodec.h:48:7: error: forward declaration of 'class COpenMaxVideo'
> |  class COpenMaxVideo;
> |        ^
>
>
I tested build on quemuarm and it worked on my host. This is strange...


-- 
*Andrei Gherzan*


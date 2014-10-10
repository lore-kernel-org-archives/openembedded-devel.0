Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 06F3D6AC7B;
	Fri, 10 Oct 2014 10:50:43 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hy10so2449229vcb.1
	for <multiple recipients>; Fri, 10 Oct 2014 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xFN6pKNQjkHNTX58pMqUJo73hpyYVOHrfJkcjOYRq7s=;
	b=Qi19cRVi54S6H+j3zUf+o84+5rQNsVQDSmN43brDhXywn4k2iWYgCmWhbtGrQpsU/X
	6ZdrXzjSKJW9Wq+bR4aJJcXZUELJpYAgRSrI84qxr8Fk/i+91YwYbfbUIUYF6SWGUllF
	Du2l8EMLvyVaklEgxet0HaLn97nfn4fxERsCAh+esV7giC9HbCh5uLVbAljQE6SNMcEz
	LtlHSPcZAix0FhDBhoxc+T1IxnezptlEQv+Pasxhp3ViID3BhKW/2HCYTSWxX18IAdfR
	apunBKWCUklJVO1ZjpAhkWDlSeQ2Dciv1aKvMY3JYK/oXj0xUz5QF3CkLi+z836VFd6+
	sYJw==
MIME-Version: 1.0
X-Received: by 10.220.167.9 with SMTP id o9mr3737281vcy.22.1412938245069; Fri,
	10 Oct 2014 03:50:45 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Fri, 10 Oct 2014 03:50:44 -0700 (PDT)
In-Reply-To: <20141010103438.GI12322@jama>
References: <20141010103438.GI12322@jama>
Date: Fri, 10 Oct 2014 12:50:44 +0200
Message-ID: <CALbNGRQ3LiR5wFH2waQmDQ5ppd2JXZeAiGbhBZN=fNiKAzuGbQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2014-10-10, QA issues
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
X-List-Received-Date: Fri, 10 Oct 2014 10:50:50 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 10, 2014 at 12:34 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Both issues are caused by pending reviews (vlc is
> broken by opencv upgrade). So this is the first "clean"
> report (except that couple fixes are still only in
> jansa/master branches and on MLs, but not yet merged).
>
> Next goal: clean QA log, see bellow.
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2014-10-10 ==
>
> === common (2) ===
>     * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/
> vlc_2.1.4.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb,
> do_configure
>
> === common-x86 (0) ===
>
> === qemuarm (0) ===
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks ===
> {| class=wikitable
> |-
> ||qemuarm       ||2     ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141009_050706.log/||http://errors.yoctoproject.org:80/Errors/Search/1/2906/
> |-
> ||qemux86       ||2     ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141009_060811.log/||http://errors.yoctoproject.org:80/Errors/Search/1/2907/
> |-
> ||qemux86_64    ||2     ||
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141009_071120.log/||http://errors.yoctoproject.org:80/Errors/Search/1/2908/
> |}
>
> QA issues (per issue type, because of spam from new file-deps check)
>
> $ logs="log.world.2014100*"; for t in already-stripped libdir textrel
> build-deps file-rdeps version-going-backwards; do count=`cat $logs/qa.log |
> sort -u | grep "\[$t\]" | wc -l`; echo "$count   $t:"; done; for t in
> already-stripped libdir textrel build-deps file-rdeps
> version-going-backwards; do count=`cat $logs/qa.log | sort -u | grep
> "\[$t\]" | wc -l`; echo "$count $t:"; cat $logs/qa.log | sort -u | grep
> "\[$t\]" | sed 's#/home/jenkins/oe/world/shr-core/tmp-glibc/#/tmp/#g';
> echo; echo; done
>
> 3       already-stripped:
> 2       libdir:
> 18      textrel:
> 18      build-deps:
> 361     file-rdeps:
> 36      version-going-backwards:
>
> 3       already-stripped:
> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped,
> this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already
> stripped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so'
> from qwt was already stripped, this will prevent future debugging!
> [already-stripped]
>
>
> 2       libdir:
> chromium-37.0.2062.94: chromium: found library in wrong location:
> /usr/bin/chrome/libffmpegsumo.so [libdir]
> chromium-dbg: found library in wrong location:
> /usr/bin/chrome/.debug/libffmpegsumo.so [libdir]
>
>
> 18      textrel:
> chromium-37.0.2062.94: ELF binary
> '/tmp/work/i586-oe-linux/chromium/37.0.2062.94-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so'
> has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.1: ELF binary
> '/tmp/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.4.1-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so'
> has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.1: ELF binary
> '/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.4.1-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/armv5te-oe-linux-gnueabi/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavfilter/usr/lib/libavfilter.so.3.3.0'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavformat/usr/lib/libavformat.so.54.20.4'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavresample/usr/lib/libavresample.so.1.0.1'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavutil/usr/lib/libavutil.so.52.3.0'
> has relocations in .text [textrel]
> libav-9.16: ELF binary
> '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.1'
> has relocations in .text [textrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
> '/tmp/work/armv5te-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'
> has relocations in .text [textrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
> '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'
> has relocations in .text [textrel]
> mpg123-1.19.0: ELF binary
> '/tmp/work/i586-oe-linux/mpg123/1.19.0-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.40.1'
> has relocations in .text [textrel]
> qtwebengine-5.3.2: ELF binary
> '/tmp/work/armv5te-oe-linux-gnueabi/qtwebengine/5.3.2-r0/packages-split/qtwebengine/usr/lib/libQt0WebEngineCore.so.0.9.0'
> has relocations in .text [textrel]
> qtwebkit-5.3.2: ELF binary
> '/tmp/work/i586-oe-linux/qtwebkit/5.3.2-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.3.2'
> has relocations in .text [textrel]
> webkit-efl-1.11.0: ELF binary
> '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0'
> has relocations in .text [textrel]
> webkit-gtk-1.8.3: ELF binary
> '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4'
> has relocations in .text [textrel]
>
>
> 18      build-deps:
> exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions,
> but it isn't a build dependency? [build-deps]
> gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build
> dependency? [build-deps]
> irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it
> isn't a build dependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build
> dependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build
> dependency? [build-deps]
> opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-highgui rdepends
> on gtk+3, but it isn't a build dependency? [build-deps]
> opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends
> on gstreamer1.0, but it isn't a build dependency? [build-deps]
> opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends
> on libgstapp-1.0, but it isn't a build dependency? [build-deps]
> opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends
> on libgstpbutils-1.0, but it isn't a build dependency? [build-deps]
> opencv-2.99+3.0.0-alpha+gitAUTOINC+fb9a143429: libopencv-videoio rdepends
> on libgstriff-1.0, but it isn't a build dependency? [build-deps]
> proftpd-1.3.4b: proftpd rdepends on initscripts-functions, but it isn't a
> build dependency? [build-deps]
> sysklogd-1.5: sysklogd rdepends on initscripts-functions, but it isn't a
> build dependency? [build-deps]
> tracker-0.14.2: tracker rdepends on libnmglib, but it isn't a build
> dependency? [build-deps]
> tracker-0.14.2: tracker rdepends on libnmutil, but it isn't a build
> dependency? [build-deps]
> tracker-0.14.2: tracker rdepends on nss, but it isn't a build dependency?
> [build-deps]
> tumbler-0.1.30: tumbler rdepends on gstreamer1.0, but it isn't a build
> dependency? [build-deps]
> tumbler-0.1.30: tumbler rdepends on libgsttag-1.0, but it isn't a build
> dependency? [build-deps]
> xinetd-2.3.15: xinetd rdepends on initscripts-functions, but it isn't a
> build dependency? [build-deps]
>
>
> 361     file-rdeps:
> chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers
> in its RDEPENDS [file-rdeps]
> chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its
> RDEPENDS [file-rdeps]
> cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS
> [file-rdeps]
> cpu-0.0.1+svnr82070: cpu requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> cpu-0.0.1+svnr82070: cpu requires libpulsecommon-5.0.so, but no providers
> in its RDEPENDS [file-rdeps]
> diskio-0.0.1+svnr82070: diskio requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> diskio-0.0.1+svnr82070: diskio requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> docbook-xsl-stylesheets-1.78.1: docbook-xsl-stylesheets requires
> /usr/bin/perl, /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> dpkg-1.17.4: dpkg requires /usr/bin/perl, but no providers in its RDEPENDS
> [file-rdeps]
> dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit),
> libdvbapi.so()(64bit), libdvbcfg.so()(64bit), libdvben50221.so()(64bit),
> libdvbsec.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so,
> libdvbsec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS
> [file-rdeps]
> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no providers
> in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in its
> RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit),
> libdvbapi.so()(64bit), libdvbcfg.so()(64bit), but no providers in its
> RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so,
> libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit),
> libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no
> providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers in
> its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its
> RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in its
> RDEPENDS [file-rdeps]
> e-wm-0.18.8: e-wm requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> e-wm-0.18.8: e-wm requires libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> efl-1.11.2: ecore-audio requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> efl-1.11.2: ecore-audio requires libpulsecommon-5.0.so, but no providers
> in its RDEPENDS [file-rdeps]
> efl-1.11.2: edje requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> efl-1.11.2: edje requires libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> efl-1.11.2: ethumb requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> efl-1.11.2: ethumb requires libpulsecommon-5.0.so, but no providers in
> its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary-accessibility requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary-accessibility requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary-tests requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> elementary-1.11.2: elementary-tests requires libpulsecommon-5.0.so, but
> no providers in its RDEPENDS [file-rdeps]
> elfe-0.0.1+gitrAUTOINC+1ec0e7713c: elfe requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> elfe-0.0.1+gitrAUTOINC+1ec0e7713c: elfe requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> estardict-0.7: estardict requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> estardict-0.7: estardict requires libpulsecommon-5.0.so, but no providers
> in its RDEPENDS [file-rdeps]
> exalt-client-0.0.1+svnr82070: exalt-client requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> exalt-client-0.0.1+svnr82070: exalt-client requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> exquisite-0.0.1+svnr82070: exquisite requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> exquisite-0.0.1+svnr82070: exquisite requires libpulsecommon-5.0.so, but
> no providers in its RDEPENDS [file-rdeps]
> fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
> fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no
> providers in its RDEPENDS [file-rdeps]
> flame-0.0.3+svnr82070: flame requires libpulsecommon-5.0.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> flame-0.0.3+svnr82070: flame requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> fluidsynth-1.1.6: fluidsynth requires libpulsecommon-5.0.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> fluidsynth-1.1.6: fluidsynth requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> forecasts-0.2.0+svnr82070: forecasts requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> forecasts-0.2.0+svnr82070: forecasts requires libpulsecommon-5.0.so, but
> no providers in its RDEPENDS [file-rdeps]
> foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but
> no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-accelerometer-kxsd9 requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-accelerometer-kxsd9 requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-accelerometer-lis302 requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-accelerometer-lis302 requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-backlight-omappanel requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-backlight-omappanel requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-n900-quirks requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-n900-quirks requires libfsodevice.so,
> but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-openmoko-powercontrol requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-openmoko-powercontrol requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-vibrator-omapvibe requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-vibrator-omapvibe requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-vibrator-timedoutputclass requires
> libfsodevice.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> fsodeviced-0.12.0: fsodeviced-module-vibrator-timedoutputclass requires
> libfsodevice.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-lowlevel-motorola-ezx requires libfsogsm.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-lowlevel-motorola-ezx requires libfsogsm.so, but no
> providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-openmoko
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-lowlevel-openmoko
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-lowlevel-samsung-crespo requires libfsogsm.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-lowlevel-samsung-crespo requires libfsogsm.so, but no
> providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-modem-freescale-neptune requires libfsogsm.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c:
> fsogsmd-module-modem-freescale-neptune requires libfsogsm.so, but no
> providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-nokia-isi
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-nokia-isi
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-option-gtm601
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-option-gtm601
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-qualcomm-htc
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-qualcomm-htc
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-samsung
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-samsung
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-ti-calypso
> requires libfsogsm.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> fsogsmd-0.12.99+gitrAUTOINC+12843f053c: fsogsmd-module-modem-ti-calypso
> requires libfsogsm.so, but no providers in its RDEPENDS [file-rdeps]
> gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS
> [file-rdeps]
> gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
> gateone-1.2: gateone requires /usr/bin/perl, /bin/bash, but no providers
> in its RDEPENDS [file-rdeps]
> giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in its
> RDEPENDS [file-rdeps]
> glibmm-2.36.2: glibmm-dev requires /usr/bin/perl, but no providers in its
> RDEPENDS [file-rdeps]
> gmtk-1.0.5: gmtk requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> gmtk-1.0.5: gmtk requires libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no
> providers in its RDEPENDS [file-rdeps]
> gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no providers
> in its RDEPENDS [file-rdeps]
> groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS
> [file-rdeps]
> gst-plugins-good-0.10.31: gst-plugins-good-pulse requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> gst-plugins-good-0.10.31: gst-plugins-good-pulse requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> gstreamer1.0-plugins-good-1.4.1: gstreamer1.0-plugins-good-pulse requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> gstreamer1.0-plugins-good-1.4.1: gstreamer1.0-plugins-good-pulse requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in its
> RDEPENDS [file-rdeps]
> hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in its
> RDEPENDS [file-rdeps]
> libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in
> its RDEPENDS [file-rdeps]
> libcanberra-0.29: libcanberra-pulse requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> libcanberra-0.29: libcanberra-pulse requires libpulsecommon-5.0.so, but
> no providers in its RDEPENDS [file-rdeps]
> libeflvala-2011.01.13.1+svnr82070: libeflvala requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> libeflvala-2011.01.13.1+svnr82070: libeflvala requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> libeweather-0.0.0+svnr82070: libeweather requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> libeweather-0.0.0+svnr82070: libeweather requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> libeweather-0.0.0+svnr82070: libeweather-plugins requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> libeweather-0.0.0+svnr82070: libeweather-plugins requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> libgphoto2-2.4.11: libgphoto2 requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
> libhugetlbfs-2.18: libhugetlbfs requires /bin/bash, /usr/bin/perl, but no
> providers in its RDEPENDS [file-rdeps]
> libhugetlbfs-2.18: libhugetlbfs-tests requires /bin/bash, but no providers
> in its RDEPENDS [file-rdeps]
> libmikmod-3.3.6: libmikmod requires libpulsecommon-5.0.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> libmikmod-3.3.6: libmikmod requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> libnewt-0.52.17: whiptail requires libnewt.so()(64bit), but no providers
> in its RDEPENDS [file-rdeps]
> libnewt-0.52.17: whiptail requires libnewt.so, but no providers in its
> RDEPENDS [file-rdeps]
> libnewt-python-0.52.17: libnewt-python requires libnewt.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.17: libnewt-python requires libnewt.so, but no
> providers in its RDEPENDS [file-rdeps]
> libphone-ui-shr-0.0.1+gitrAUTOINC+25e6160710: libphone-ui-shr requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> libphone-ui-shr-0.0.1+gitrAUTOINC+25e6160710: libphone-ui-shr requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no
> providers in its RDEPENDS [file-rdeps]
> lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but
> no providers in its RDEPENDS [file-rdeps]
> lxdm-0.5.0+gitAUTOINC+07fb151a99: lxdm requires /bin/bash, but no
> providers in its RDEPENDS [file-rdeps]
> mime-support-3.48: mime-support requires /usr/bin/perl, but no providers
> in its RDEPENDS [file-rdeps]
> mpg123-1.19.0: mpg123 requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> mpg123-1.19.0: mpg123 requires libpulsecommon-5.0.so, but no providers in
> its RDEPENDS [file-rdeps]
> nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPENDS
> [file-rdeps]
> numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash,
> /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
> pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in
> its RDEPENDS [file-rdeps]
> php-5.4.33: php requires
> /tmp/work/armv5te-oe-linux-gnueabi/php/5.4.33-r0/image/usr/bin/php, but no
> providers in its RDEPENDS [file-rdeps]
> php-5.4.33: php requires
> /tmp/work/core2-64-oe-linux/php/5.4.33-r0/image/usr/bin/php, but no
> providers in its RDEPENDS [file-rdeps]
> php-5.4.33: php requires
> /tmp/work/i586-oe-linux/php/5.4.33-r0/image/usr/bin/php, but no providers
> in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-aim requires liboscar.so.0()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-aim requires liboscar.so.0, but no
> providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-icq requires liboscar.so.0()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-icq requires liboscar.so.0, but no
> providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-xmpp requires libjabber.so.0()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-xmpp requires libjabber.so.0, but no
> providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-yahoo requires libymsg.so.0()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-yahoo requires libymsg.so.0, but no
> providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-yahoojp requires libymsg.so.0()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pidgin-2.10.9: libpurple-protocol-yahoojp requires libymsg.so.0, but no
> providers in its RDEPENDS [file-rdeps]
> places-0.1.0+svnr82070: places requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> places-0.1.0+svnr82070: places requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: libpulse requires libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulse requires libpulsecommon-5.0.so, but no providers
> in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulse-mainloop-glib requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulse-mainloop-glib requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulse-simple requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulse-simple requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulsecore requires libpulsecommon-5.0.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: libpulsecore requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-alsa-util requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-alsa-util requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-avahi-wrap requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-avahi-wrap requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-bluez4-util requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-bluez4-util requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-cli requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-cli requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-oss-util requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-oss-util requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-cli requires libcli.so,
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-cli requires libpulsecommon-5.0.so()(64bit),
> libcli.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-esound requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-esound requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-http requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-http requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-native requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-native requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-simple requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-protocol-simple requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-rtp requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-lib-rtp requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-misc requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-misc requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-card requires libpulsecommon-5.0.so()(64bit),
> libalsa-util.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-card requires libpulsecommon-5.0.so,
> libalsa-util.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-sink requires libpulsecommon-5.0.so()(64bit),
> libalsa-util.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-sink requires libpulsecommon-5.0.so,
> libalsa-util.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-source requires
> libpulsecommon-5.0.so()(64bit), libalsa-util.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-alsa-source requires
> libpulsecommon-5.0.so, libalsa-util.so, but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-always-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-always-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-augment-properties requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-augment-properties requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluetooth-discover requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluetooth-discover requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluetooth-policy requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluetooth-policy requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluez4-device requires
> libbluez4-util.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluez4-device requires
> libpulsecommon-5.0.so()(64bit), libbluez4-util.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluez4-discover requires
> libbluez4-util.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-bluez4-discover requires
> libpulsecommon-5.0.so()(64bit), libbluez4-util.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-card-restore requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-card-restore requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli requires libcli.so,
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli requires libpulsecommon-5.0.so()(64bit),
> libcli.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli-protocol-tcp requires
> libprotocol-cli.so, libcli.so, libpulsecommon-5.0.so, but no providers in
> its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli-protocol-tcp requires
> libpulsecommon-5.0.so()(64bit), libcli.so()(64bit),
> libprotocol-cli.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli-protocol-unix requires
> libprotocol-cli.so, libcli.so, libpulsecommon-5.0.so, but no providers in
> its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-cli-protocol-unix requires
> libpulsecommon-5.0.so()(64bit), libcli.so()(64bit),
> libprotocol-cli.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-combine requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-combine requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-combine-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-combine-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-console-kit requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-console-kit requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-dbus-protocol requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-dbus-protocol requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-default-device-restore requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-default-device-restore requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-detect requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-detect requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-device-manager requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-device-manager requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-device-restore requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-device-restore requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-echo-cancel requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-echo-cancel requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-compat-spawnfd requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-compat-spawnfd requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-compat-spawnpid requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-compat-spawnpid requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires
> libprotocol-esound.so()(64bit), libpulsecommon-5.0.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires
> libprotocol-esound.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-protocol-tcp requires
> libpulsecommon-5.0.so, libprotocol-esound.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-protocol-unix requires
> libprotocol-esound.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-protocol-unix requires
> libpulsecommon-5.0.so()(64bit), libprotocol-esound.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-esound-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-filter-apply requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-filter-apply requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-filter-heuristics requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-filter-heuristics requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-gconf requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-gconf requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-http-protocol-tcp requires
> libprotocol-http.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-http-protocol-tcp requires
> libpulsecommon-5.0.so()(64bit), libprotocol-http.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-http-protocol-unix requires
> libprotocol-http.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-http-protocol-unix requires
> libpulsecommon-5.0.so()(64bit), libprotocol-http.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-intended-roles requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-intended-roles requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-ladspa-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-ladspa-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-loopback requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-loopback requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-match requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-match requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-mmkbd-evdev requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-mmkbd-evdev requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-fd requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-fd requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-tcp requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-tcp requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-unix requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-native-protocol-unix requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-null-sink requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-null-sink requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-null-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-null-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-oss requires liboss-util.so,
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-oss requires libpulsecommon-5.0.so()(64bit),
> liboss-util.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-pipe-sink requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-pipe-sink requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-pipe-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-pipe-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-position-event-sounds requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-position-event-sounds requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-remap-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-remap-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-remap-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-remap-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rescue-streams requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rescue-streams requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-role-cork requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-role-cork requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-role-ducking requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-role-ducking requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rtp-recv requires libpulsecommon-5.0.so()(64bit),
> librtp.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rtp-recv requires librtp.so,
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rtp-send requires libpulsecommon-5.0.so()(64bit),
> librtp.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rtp-send requires librtp.so,
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rygel-media-server requires
> libprotocol-http.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-rygel-media-server requires
> libpulsecommon-5.0.so()(64bit), libprotocol-http.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-simple-protocol-tcp requires
> libprotocol-simple.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-simple-protocol-tcp requires
> libpulsecommon-5.0.so()(64bit), libprotocol-simple.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-simple-protocol-unix requires
> libprotocol-simple.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-simple-protocol-unix requires
> libpulsecommon-5.0.so()(64bit), libprotocol-simple.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-sine requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-sine requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-sine-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-sine-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-stream-restore requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-stream-restore requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-suspend-on-idle requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-suspend-on-idle requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-switch-on-connect requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-switch-on-connect requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-switch-on-port-available requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-switch-on-port-available requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-systemd-login requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-systemd-login requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-sink-new requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-sink-new requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-source-new requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-tunnel-source-new requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-udev-detect requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-udev-detect requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-source requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-source requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-surround-sink requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-virtual-surround-sink requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-volume-restore requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-volume-restore requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-bell requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-bell requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-cork-request requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-cork-request requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-publish requires
> libprotocol-native.so, libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-publish requires
> libpulsecommon-5.0.so()(64bit), libprotocol-native.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-xsmp requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-x11-xsmp requires libpulsecommon-5.0.so,
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-zeroconf-discover requires
> libavahi-wrap.so, libpulsecommon-5.0.so, but no providers in its RDEPENDS
> [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-zeroconf-discover requires
> libpulsecommon-5.0.so()(64bit), libavahi-wrap.so()(64bit), but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires
> libavahi-wrap.so, libpulsecommon-5.0.so, libprotocol-native.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires
> libprotocol-native.so()(64bit), libpulsecommon-5.0.so()(64bit),
> libavahi-wrap.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-module-zeroconf-publish requires
> libprotocol-native.so, libavahi-wrap.so, libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-server requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> pulseaudio-5.0: pulseaudio-server requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in
> its RDEPENDS [file-rdeps]
> qtbase-5.3.2: qtbase-mkspecs requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
> rain-0.0.3+svnr82070: rain requires libpulsecommon-5.0.so()(64bit), but
> no providers in its RDEPENDS [file-rdeps]
> rain-0.0.3+svnr82070: rain requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> shr-e-gadgets-0.0.0+gitrAUTOINC+42806ea24f: shr-e-gadgets requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> shr-e-gadgets-0.0.0+gitrAUTOINC+42806ea24f: shr-e-gadgets requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> shr-wizard-0.0.0+gitrAUTOINC+1dae79221f: shr-wizard requires
> libpulsecommon-5.0.so()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> shr-wizard-0.0.0+gitrAUTOINC+1dae79221f: shr-wizard requires
> libpulsecommon-5.0.so, but no providers in its RDEPENDS [file-rdeps]
> sox-14.4.0: sox requires libpulsecommon-5.0.so()(64bit), but no providers
> in its RDEPENDS [file-rdeps]
> sox-14.4.0: sox requires libpulsecommon-5.0.so, but no providers in its
> RDEPENDS [file-rdeps]
> syslog-ng-3.5.4.1: syslog-ng requires /usr/bin/awk, but no providers in
> its RDEPENDS [file-rdeps]
> systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires
> /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires
> libnautilus-extension.so.1()(64bit), but no providers in its RDEPENDS
> [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires
> libnautilus-extension.so.1, but no providers in its RDEPENDS [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but
> no providers in its RDEPENDS [file-rdeps]
> unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in
> its RDEPENDS [file-rdeps]
> uptime-0.0.2+svnr82070: uptime requires libpulsecommon-5.0.so()(64bit),
> but no providers in its RDEPENDS [file-rdeps]
> uptime-0.0.2+svnr82070: uptime requires libpulsecommon-5.0.so, but no
> providers in its RDEPENDS [file-rdeps]
> usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in
> its RDEPENDS [file-rdeps]
> webmin-1.700: webmin-module-ajaxterm requires /sbin/runscript, but no
> providers in its RDEPENDS [file-rdeps]
> wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its
> RDEPENDS [file-rdeps]
> xfce4-dev-tools-4.11.0: xfce4-dev-tools requires /bin/bash, but no
> providers in its RDEPENDS [file-rdeps]
> xmlto-0.0.25: xmlto requires /bin/bash, but no providers in its RDEPENDS
> [file-rdeps]
>
> a bit off topic (but only a bit :)

I don't see these except file-rdeps. IIRC I did a setting to enable
file-rdeps but I cannot remember where it was. So to take care: Where can I
enable all the qa warnings?

Andreas


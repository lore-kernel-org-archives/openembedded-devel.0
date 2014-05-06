Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5A99165E8C;
	Tue,  6 May 2014 20:41:47 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id s7so41149lbd.28
	for <multiple recipients>; Tue, 06 May 2014 13:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xrJInbslU8tdChSqDYjAsx3/GpX8fUdfTALlhlOnu6M=;
	b=HmoG6lnb29gypQgerM2V2DZPaJI4FC0bNTm0qQ1xkMaT1W9FV5jFFcyvtNuc5kzO7v
	PSnzFH7cr2PxnZqFYhfHnaeig1+XwNJQIUJ5AMvMQVIdIkr3ce9/oVVactjy9BFUDH3B
	AfYUrBOu5c8nVQxxPGUKTTvcICgPSKR/DWO7iZUrVMH2uLrS1/wgEYhWSf0q3MSVtEbr
	jGPhaK7qBnTwOsHU5Z9DiiS4R/KdjUkNGkViVDI7pmgqQbsAVshHVskEek5NQSktZ1kL
	603NhH5e78LSuv4JqS8lJXZPlACuOIf5EfChaWqrbQforsgkYC5CTJurO4PEgqdMWcAA
	ut4g==
MIME-Version: 1.0
X-Received: by 10.112.35.202 with SMTP id k10mr34168871lbj.14.1399408907709;
	Tue, 06 May 2014 13:41:47 -0700 (PDT)
Received: by 10.114.216.4 with HTTP; Tue, 6 May 2014 13:41:47 -0700 (PDT)
In-Reply-To: <20140506195144.GC30955@jama>
References: <20140418183632.GG2486@jama> <20140425010009.GN2486@jama>
	<20140506195144.GC30955@jama>
Date: Tue, 6 May 2014 13:41:47 -0700
Message-ID: <CANx9H-CbwytcOd-j3UZNLUPHvp4JhyMkXuvOBF0p8yBrYaVxVw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] State of bitbake world, test-dependencies 2014-05-06
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
X-List-Received-Date: Tue, 06 May 2014 20:41:52 -0000
Content-Type: text/plain; charset=UTF-8

I will work on vlc/libvlc.

--Tim


On Tue, May 6, 2014 at 12:51 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Fri, Apr 25, 2014 at 03:00:09AM +0200, Martin Jansa wrote:
> > On Fri, Apr 18, 2014 at 08:36:32PM +0200, Martin Jansa wrote:
> > > On Thu, Apr 03, 2014 at 03:06:09PM +0200, Martin Jansa wrote:
> > > > I've just started this long test-dependencies build so jenkins will
> be busy
> > > > for next 14 days or so, but I'll send complete qa.log in advance as
> soon as
> > > > it finishes building world from scratch.
> >
> > This one is only "incremental" (so testing only recipes which failed in
> > previous run) and it took only 3,5 days to finish :).
> >
> > Mostly because of firefox (libnotify) and efl/lua fix we're down to 72
> recipes with
> > issues (instead of 187 found in previous run or 100 w/o firefox*)
>
> I've sent couple of WIP patches to oe-devel ML and now we're down to 50
> recipes with issues, there are still 2 days to send patches for daisy,
> so hurry up.
>
> Complete logs:
>
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.dependencies.20140506_041120.log/
>
> No min or max failed issues (all these were fixed in WIP patches)
>
> I'll look at qtbase, python-edje, python-elementary than maybe gst* and
> libao.
>
> Found differences:
> ccid/ccid/latest lost dependency on  flex
> console-tools/console-tools/latest lost dependency on  flex
> consolekit/consolekit/latest lost dependency on  polkit
> directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma tiff
> engrave/engrave/latest lost dependency on  flex
> epiphany/epiphany/latest lost dependency on  libavahi-client
> libavahi-common libavahi-gobject libnotify
> expedite/expedite/latest lost dependency on  libsdl
> flashrom/flashrom/latest lost dependency on  libftdi
> gammu/gammu/latest lost dependency on  glib-2.0 libgudev-1.0
> gammu/libgammu/latest lost dependency on  glib-2.0
> gimp/gimp/latest lost dependency on  jasper libxmu libxpm
> glade3/glade3/latest lost dependency on  dbus-glib dbus-lib gconf
> gnome-vfs libart-lgpl libavahi-client libavahi-common libavahi-glib
> libbonobo libbonoboui libcanberra libcap libgcrypt libgnome
> libgnome-keyring libgnomecanvas libgnomeui libgpg-error libice libltdl
> libogg libsm libvorbis libxcomposite libxcursor libxdamage libxfixes
> libxrandr orbit2 popt util-linux-libuuid
> gmtk/gmtk/latest lost dependency on  cairo-gobject dbus-lib gtk+3 json-c
> libcap libice libpulse libpulse-mainloop-glib libpulsecommon libsm
> libsndfile1 libx11-xcb libxi libxtst util-linux-libuuid
> gnokii/libgnokii/latest lost dependency on  bluez4 libical libusb-compat
> libusb1 pcsc-lite-lib
> gnome-panel/gnome-panel/latest lost dependency on  dbus-lib
> gst-plugins-bad/gst-plugins-bad-meta/latest lost dependency on
>  gst-plugins-bad-dc1394 gst-plugins-bad-faac gst-plugins-bad-schro
> gst-plugins-good/gst-plugins-good-ximagesrc/latest lost dependency on
>  libxdamage
> gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc/latest lost
> dependency on  libxdamage
> guile/guile/latest lost dependency on  libgc ncurses-libncurses readline
> libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
> libungif/libungif/latest lost dependency on  libice libsm libx11 libxau
> libxcb libxdmcp util-linux-libuuid
> libungif/libungif-utils/latest lost dependency on  libx11
> maliit-framework/maliit-framework-gtk/latest lost dependency on  eglibc
> glib-2.0 gtk+ gtk+3 libgcc libqtcore4 maliit-framework pango
> midori/midori/latest lost dependency on  libxscrnsaver
> mongodb/mongodb/latest lost dependency on  libpcap
> mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda
> libcdio-paranoia libjack libmms libmodplug libopus mpg123 openal-soft
> wavpack yajl
> mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
> mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl
> openal-soft portaudio-v19 tslib
> navit/navit/latest lost dependency on  fribidi
> navit/navit-graphics-gtk/latest lost dependency on  imlib2
> navit/navit-graphics-sdl/latest lost dependency on  eglibc freetype
> libjpeg-turbo liblzma libpng libsdl libsdl-image tiff tslib zlib
> opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
> oscam/oscam/latest lost dependency on  pcsc-lite-lib
> piglit/piglit/latest lost dependency on  libxrender
> protobuf/protobuf/latest lost dependency on  zlib
> python-efl/python-edje/latest lost dependency on  edje eglibc eina
> libpython2
> python-efl/python-elementary/latest lost dependency on  eglibc eina
> elementary evas libpython2
> qtbase/qtbase-plugins/latest lost dependency on  libxcb-render
> xcb-util-renderutil
> sox/sox/latest lost dependency on  libao
> stunnel/stunnel/latest lost dependency on  libwrap zlib
> synergy/synergy/latest lost dependency on  libxinerama
> tracker/tracker/latest lost dependency on  dbus-glib enca gnutls gtk+3
> libgee libgsf libgudev-1.0 libnmglib libnmutil libtasn1 libudev
> libunistring upower
> tracker/tracker-dev/latest lost dependency on  cairo enca expat fontconfig
> freetype giflib gstreamer lcms libbz2 libgsf libgstpbutils-0.10
> libgsttag-0.10 liblzma libpoppler libpoppler-glib libunistring libx11
> libxau libxcb libxcb-render libxcb-shm libxdmcp libxext libxrender pixman
> taglib taglib-c tiff
> tracker/tracker-nautilus-extension/latest lost dependency on  atk cairo
> eglibc expat fontconfig freetype gdk-pixbuf glib-2.0 gtk+ harfbuzz libffi
> libpng libsqlite3 libunistring libx11 libxau libxcb libxcb-render
> libxcb-shm libxdmcp libxext libxrender pango pixman tracker
> util-linux-libuuid zlib
> tumbler/tumbler/latest lost dependency on  gstreamer1.0 libbz2 libgsf
> libgsttag-1.0 libxml2
> vagalume/vagalume/latest lost dependency on  libproxy
> vlc/libvlc/latest lost dependency on  libidn
> vlc/vlc/latest lost dependency on  atk dbus-glib enca gconf gnome-vfs gtk+
> libass libavahi-glib libdc1394 libebml libidn libjpeg-turbo liblzma
> libmatroska libmodplug libmpeg2 libmtp libnotify libopencv-calib3d
> libopencv-contrib libopencv-core libopencv-features2d libopencv-flann
> libopencv-gpu libopencv-highgui libopencv-imgproc libopencv-legacy
> libopencv-ml libopencv-nonfree libopencv-objdetect libopencv-ocl
> libopencv-photo libopencv-stitching libopencv-superres libopencv-video
> libopencv-videostab libopus liborc-0.4 libraw1394 libsdl-image libusb1
> libxinerama libxpm schroedinger taglib tiff xcb-util-keysyms
> weston/weston/latest lost dependency on  lcms
> weston/weston-examples/latest lost dependency on  libpoppler-glib
> wv/wv/latest lost dependency on  libpng
> wvstreams/wvstreams/latest lost dependency on  dbus-lib libwvstreams-base
> readline
> xdelta3/xdelta3/latest lost dependency on  liblzma
> xfce4-settings/xfce4-settings/latest lost dependency on  upower
> xfce4-weather-plugin/xfce4-weather-plugin/latest lost dependency on
>  dbus-glib dbus-lib upower
> xserver-xorg/xserver-xorg/latest lost dependency on  libunwind
> xserver-xorg/xserver-xorg-xvfb/latest lost dependency on  libunwind
> xterm/xterm/latest lost dependency on  fontconfig libxft
> perf/perf/latest lost dependency on  libunwind
>
> Found errors:
> gst-plugins-bad/gst-plugins-bad-dc1394/latest doesn't exist
> gst-plugins-bad/gst-plugins-bad-dc1394-dev/latest doesn't exist
> gst-plugins-bad/gst-plugins-bad-faac/latest doesn't exist
> gst-plugins-bad/gst-plugins-bad-faac-dev/latest doesn't exist
> gst-plugins-bad/gst-plugins-bad-schro/latest doesn't exist
> gst-plugins-bad/gst-plugins-bad-schro-dev/latest doesn't exist
> libao/libao-plugin-libalsa/latest doesn't exist
> libao/libao-plugin-libalsa-dbg/latest doesn't exist
> libao/libao-plugin-libpulse/latest doesn't exist
> libao/libao-plugin-libpulse-dbg/latest doesn't exist
>
> 62696.90user 72534.50system 15:04:50elapsed 249%CPU (0avgtext+0avgdata
> 4476160maxresident)k
> 5358728inputs+23799696outputs (1082major+2565040779minor)pagefaults 0swaps
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


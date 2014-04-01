Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 750136B592;
	Tue,  1 Apr 2014 01:17:24 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id jw12so9059296veb.13
	for <multiple recipients>; Mon, 31 Mar 2014 18:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=No92TsmjrSRxTxgfUmjxEMxeyleWwXPcpCt2XaCWUr4=;
	b=pcOrTqFnPFnCkEjgr9i8XAta1/Y2q+7GHmvcwOGmwidcm5d+X3+Q/26ApXdLW/xasv
	SShE6YomxntW86+uvC8qawP7adpX219XCHkJO9zKlNN+q2+uU+xJj0cPBQUm20I7l7WO
	RaYEr7AHlhX2IWIgQ16MvYXoqShdsdRWFZ2Hne3bNdn7Cg2MkYkcGEdHfuucjck8lfJV
	rp20vRMfQKjCbX5cMEzwd7i56IwTNio1mDlJD27feayDzthg7kGvHHsXzPy4j/uZpaa1
	G71HqXdIPTPe7a0B88JXOHba5AJPkFWCvvElRgK0qnA43ebMIg7fjDxs0aD3pxyGTOqN
	VbYQ==
MIME-Version: 1.0
X-Received: by 10.52.173.165 with SMTP id bl5mr21771440vdc.13.1396315045261;
	Mon, 31 Mar 2014 18:17:25 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Mon, 31 Mar 2014 18:17:25 -0700 (PDT)
In-Reply-To: <20140330002800.GC2428@jama>
References: <20140329225432.GA2428@jama>
	<20140330002800.GC2428@jama>
Date: Mon, 31 Mar 2014 18:17:25 -0700
Message-ID: <CAFeBWL5+deT_P8_Cu_tdDqFJ+-gT-_A_qrv5pa9iJGWGZpj5Tw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2014-03-29
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
X-List-Received-Date: Tue, 01 Apr 2014 01:17:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

I took a look into these three (in hopes of free beer):

polkit-gnome: configure was passed unrecognised options:
--disable-scrollkeeper --disable-man-pages

gnome-bluetooth-2.32.0: gnome-bluetooth: configure was passed
unrecognised options: --disable-schemas-install

openobex-1.5: openobex: configure was passed unrecognised options:
--with-usb --with-bluez


And it looks like all three package recipes are more or less the same
as the ones in Dora. So I am confused why they haven't come up before
(say, in Dora). Are we doing more strict config flag checking anywhere
that I am unaware of?

Also, sound-theme-freedesktop has been blocking my build for a while. I see
JaMa has a local commit, but I am not sure if that's the fix for the build
failure we see in the report. Can someone provide tips on that nasty
undefined macro?

Thank you,

Adam

On Sat, Mar 29, 2014 at 5:28 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Sat, Mar 29, 2014 at 11:54:32PM +0100, Martin Jansa wrote:
> > On Wed, Mar 26, 2014 at 06:11:36PM +0100, Martin Jansa wrote:
> > > On Sun, Mar 23, 2014 at 09:43:24PM +0100, Martin Jansa wrote:
> > > > On Tue, Mar 18, 2014 at 07:50:08PM +0100, Martin Jansa wrote:
> > > > > On Sat, Mar 15, 2014 at 03:10:46PM +0100, Martin Jansa wrote:
> > > > > > On Tue, Mar 11, 2014 at 02:50:14PM +0100, Martin Jansa wrote:
> > > > > > > On Tue, Mar 11, 2014 at 02:45:04PM +0100, Martin Jansa wrote:
> > > > > > > > Biggest difference from last e-mail is aclocal changes which
> can possibly explain
> > > > > > > > increased number of do_configure failures, I've asked
> Richard to delay merging B!=S
> > > > > > > > change until we resolve or at least analyze these new
> failures, so any help with
> > > > > > > > would be highly appreciated.
> >
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > == Failed tasks 2014-03-29 ==
>
> Be aware that I plan to run test-dependencies script for next few days,
> so changes to meta-oe will be delayed until it's finished and I can use
> jenkins again to test incoming changes.
>
> If you want to do something really useful and you're not confident with
> "big" changes, please scan qa.log files in URLs in report and send some
> small patches to resolve unrecognized configure options (check the
> configure
> script if the option was replaced by something or if there is typo or if
> it is applied by some bbclass which possibly shouldn't be used e.g.
> gnome/gnombase). I offer beer on ELC for everybody who sends 10 changes
> like this :).
>
> It won't show much, because a lot of recipes are still blocked by issues
> listed bellow, but because release is close it's better to run it now
> and fix at least found issues, before the release.
>
> I also have couple of local changes which I haven't sent yet, because
> they aren't properly tested:
>
> f2e1f65 libgnomecanvas: add intltool dependency
> cc3dac2 edbus: remove test-gui option
> eff6aaa zram: include whole sysconfdir in PN
> d308e37 atftp: include whole sysconfdir in PN
> cdfd489 metacity: inherit only gnomebase
> f415c1f gtksourceview2: inherit only gnomebase
> 85550a0 goffice: inherit only gnomebase
> 22a1a79 zenity: inherit only gnomebase
> 29c844e gnome-themes: inherit only gnomebase
> 561c24c gnome-backgrounds: inherit only gnomebase
> 49fb47b gcr: inherit only gnomebase
> b470935 modemmanager: inherit only gnomebase
> bdc4cd9 libbonobo: inherit only gnomebase
> 2b13d00 libgnome-keyring: inherit only gnomebase
> fb2406f gnome-disk-utility: inherit only gnomebase
> 58a1d87 libgdata: inherit only gnomebase
> 6141925 libgtop: inherit only gnomebase
> 8c021f1 gnome-bluetooth: inherit only gnomebase
> 8723ea9 dconf: inherit only gnomebase
> e63ca45 babl: inherit only gnomebase
> bea1f1d gnome-menus: inherit only gnomebase
> a33e667 wvstreams: fix QA warning
> 7aa1b5e elementary: remove --disable-web
> 6e3a7c8 libwnck*: inherit only gnomebase
> 7855b14 tracker: inherit only gnomebase, fix QA warn
> 3251a4e gnome-control-center: include datadir/mime in PN
> 0ee66bb freerdp: move to nonworking
> de68ce6 sound-theme-freedesktop: add glib-2.0 dependenecy
> 5fac747 libdc1394: add libsdl dependency
> 4609314 mplayer2: bump SRCREV to fix build issues with newer live555
> e403bec gvfs-gdu-volume-monitor: Define build dependency on
> libgnome-keyring
>
> If you have some patches for issues bellow and you haven't sent them
> because
> you want to test them more, please send them with [WIP] in subject and I'll
> include them in master-next for test-depedencies build (better to test
> recipe
> which is possibly broken in runtime than not testing it and it's
> dependents at
> all)
>
> I'll probably start it on Wed and last time it took 11 days.
>
> > === common (23) ===
> >     * meta-openembedded/meta-gnome/recipes-gnome/devilspie/
> devilspie2_0.24.bb, do_compile
> >     * meta-openembedded/meta-gnome/recipes-gnome/libgnome/
> libgnomecanvas_2.30.3.bb, do_configure
> >     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/
> xbmc_git.bb, do_compile
> >     * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/
> libdc1394_git.bb, do_configure
> >     * meta-openembedded/meta-networking/recipes-protocols/quagga/
> quagga_0.99.21.bb, do_compile
> >     * meta-openembedded/meta-networking/recipes-support/traceroute/
> traceroute_2.0.18.bb, do_compile
> >     * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb,
> do_install
> >     * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb,
> do_compile
> >     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb,
> do_compile
> >     * meta-openembedded/meta-oe/recipes-extended/gnuplot/
> gnuplot_4.4.4.bb, do_compile
> >     * meta-openembedded/meta-oe/recipes-extended/mml-widget/
> gtkmathview_0.8.0.bb, do_compile
> >     * meta-openembedded/meta-oe/recipes-multimedia/mplayer/
> mplayer2_git.bb, do_configure
> >     * meta-openembedded/meta-oe/recipes-multimedia/sound-themes/
> sound-theme-freedesktop_0.8.bb, do_configure
> >     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb,
> do_compile
> >     * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb,
> do_compile
> >     * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb,
> do_install
> >     * meta-openembedded/meta-oe/recipes-support/open-vcdiff/
> open-vcdiff_0.8.3.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-apps/mousepad/
> mousepad_0.3.0.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-apps/xarchiver/
> xarchiver_git.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-apps/xfce4-taskmanager/
> xfce4-taskmanager_git.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-panel-plugins/closebutton/
> xfce4-closebutton-plugin_git.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/
> xfce4-settings_git.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb,
> do_configure
> >
> > === common-x86 (3) ===
> >     * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb,
> do_compile
> >     * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb,
> do_compile
> >     * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
> >
> > === qemuarm (3) ===
> >     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb,
> do_compile
> >     * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
> >     * openembedded-core/meta/recipes-support/libunistring/
> libunistring_0.9.3.bb, do_compile
> >
> > === qemux86 (1) ===
> >     * meta-openembedded/meta-initramfs/recipes-kernel/linux/
> linux-yocto-tiny-kexecboot_3.10.bb, do_compile
> >
> > === qemux86_64 (1) ===
> >     * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/
> libimobiledevice_1.1.4.bb, do_configure
> >
> > === Number of failed tasks ===
> > {| class=wikitable
> > |-
> > ||qemuarm       ||26    ||
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140327_005335.log/
> > |-
> > ||qemux86       ||27    ||
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140327_235230.log/
> > |-
> > ||qemux86_64    ||27    ||
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140329_001343.log/
> > |}
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
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


On Sat, Mar 29, 2014 at 5:28 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Sat, Mar 29, 2014 at 11:54:32PM +0100, Martin Jansa wrote:
> > On Wed, Mar 26, 2014 at 06:11:36PM +0100, Martin Jansa wrote:
> > > On Sun, Mar 23, 2014 at 09:43:24PM +0100, Martin Jansa wrote:
> > > > On Tue, Mar 18, 2014 at 07:50:08PM +0100, Martin Jansa wrote:
> > > > > On Sat, Mar 15, 2014 at 03:10:46PM +0100, Martin Jansa wrote:
> > > > > > On Tue, Mar 11, 2014 at 02:50:14PM +0100, Martin Jansa wrote:
> > > > > > > On Tue, Mar 11, 2014 at 02:45:04PM +0100, Martin Jansa wrote:
> > > > > > > > Biggest difference from last e-mail is aclocal changes which
> can possibly explain
> > > > > > > > increased number of do_configure failures, I've asked
> Richard to delay merging B!=S
> > > > > > > > change until we resolve or at least analyze these new
> failures, so any help with
> > > > > > > > would be highly appreciated.
> >
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > == Failed tasks 2014-03-29 ==
>
> Be aware that I plan to run test-dependencies script for next few days,
> so changes to meta-oe will be delayed until it's finished and I can use
> jenkins again to test incoming changes.
>
> If you want to do something really useful and you're not confident with
> "big" changes, please scan qa.log files in URLs in report and send some
> small patches to resolve unrecognized configure options (check the
> configure
> script if the option was replaced by something or if there is typo or if
> it is applied by some bbclass which possibly shouldn't be used e.g.
> gnome/gnombase). I offer beer on ELC for everybody who sends 10 changes
> like this :).
>
> It won't show much, because a lot of recipes are still blocked by issues
> listed bellow, but because release is close it's better to run it now
> and fix at least found issues, before the release.
>
> I also have couple of local changes which I haven't sent yet, because
> they aren't properly tested:
>
> f2e1f65 libgnomecanvas: add intltool dependency
> cc3dac2 edbus: remove test-gui option
> eff6aaa zram: include whole sysconfdir in PN
> d308e37 atftp: include whole sysconfdir in PN
> cdfd489 metacity: inherit only gnomebase
> f415c1f gtksourceview2: inherit only gnomebase
> 85550a0 goffice: inherit only gnomebase
> 22a1a79 zenity: inherit only gnomebase
> 29c844e gnome-themes: inherit only gnomebase
> 561c24c gnome-backgrounds: inherit only gnomebase
> 49fb47b gcr: inherit only gnomebase
> b470935 modemmanager: inherit only gnomebase
> bdc4cd9 libbonobo: inherit only gnomebase
> 2b13d00 libgnome-keyring: inherit only gnomebase
> fb2406f gnome-disk-utility: inherit only gnomebase
> 58a1d87 libgdata: inherit only gnomebase
> 6141925 libgtop: inherit only gnomebase
> 8c021f1 gnome-bluetooth: inherit only gnomebase
> 8723ea9 dconf: inherit only gnomebase
> e63ca45 babl: inherit only gnomebase
> bea1f1d gnome-menus: inherit only gnomebase
> a33e667 wvstreams: fix QA warning
> 7aa1b5e elementary: remove --disable-web
> 6e3a7c8 libwnck*: inherit only gnomebase
> 7855b14 tracker: inherit only gnomebase, fix QA warn
> 3251a4e gnome-control-center: include datadir/mime in PN
> 0ee66bb freerdp: move to nonworking
> de68ce6 sound-theme-freedesktop: add glib-2.0 dependenecy
> 5fac747 libdc1394: add libsdl dependency
> 4609314 mplayer2: bump SRCREV to fix build issues with newer live555
> e403bec gvfs-gdu-volume-monitor: Define build dependency on
> libgnome-keyring
>
> If you have some patches for issues bellow and you haven't sent them
> because
> you want to test them more, please send them with [WIP] in subject and I'll
> include them in master-next for test-depedencies build (better to test
> recipe
> which is possibly broken in runtime than not testing it and it's
> dependents at
> all)
>
> I'll probably start it on Wed and last time it took 11 days.
>
> > === common (23) ===
> >     * meta-openembedded/meta-gnome/recipes-gnome/devilspie/
> devilspie2_0.24.bb, do_compile
> >     * meta-openembedded/meta-gnome/recipes-gnome/libgnome/
> libgnomecanvas_2.30.3.bb, do_configure
> >     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/
> xbmc_git.bb, do_compile
> >     * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/
> libdc1394_git.bb, do_configure
> >     * meta-openembedded/meta-networking/recipes-protocols/quagga/
> quagga_0.99.21.bb, do_compile
> >     * meta-openembedded/meta-networking/recipes-support/traceroute/
> traceroute_2.0.18.bb, do_compile
> >     * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb,
> do_install
> >     * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb,
> do_compile
> >     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb,
> do_compile
> >     * meta-openembedded/meta-oe/recipes-extended/gnuplot/
> gnuplot_4.4.4.bb, do_compile
> >     * meta-openembedded/meta-oe/recipes-extended/mml-widget/
> gtkmathview_0.8.0.bb, do_compile
> >     * meta-openembedded/meta-oe/recipes-multimedia/mplayer/
> mplayer2_git.bb, do_configure
> >     * meta-openembedded/meta-oe/recipes-multimedia/sound-themes/
> sound-theme-freedesktop_0.8.bb, do_configure
> >     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb,
> do_compile
> >     * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb,
> do_compile
> >     * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb,
> do_install
> >     * meta-openembedded/meta-oe/recipes-support/open-vcdiff/
> open-vcdiff_0.8.3.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-apps/mousepad/
> mousepad_0.3.0.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-apps/xarchiver/
> xarchiver_git.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-apps/xfce4-taskmanager/
> xfce4-taskmanager_git.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-panel-plugins/closebutton/
> xfce4-closebutton-plugin_git.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/
> xfce4-settings_git.bb, do_configure
> >     * meta-openembedded/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb,
> do_configure
> >
> > === common-x86 (3) ===
> >     * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb,
> do_compile
> >     * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb,
> do_compile
> >     * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
> >
> > === qemuarm (3) ===
> >     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb,
> do_compile
> >     * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
> >     * openembedded-core/meta/recipes-support/libunistring/
> libunistring_0.9.3.bb, do_compile
> >
> > === qemux86 (1) ===
> >     * meta-openembedded/meta-initramfs/recipes-kernel/linux/
> linux-yocto-tiny-kexecboot_3.10.bb, do_compile
> >
> > === qemux86_64 (1) ===
> >     * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/
> libimobiledevice_1.1.4.bb, do_configure
> >
> > === Number of failed tasks ===
> > {| class=wikitable
> > |-
> > ||qemuarm       ||26    ||
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140327_005335.log/
> > |-
> > ||qemux86       ||27    ||
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140327_235230.log/
> > |-
> > ||qemux86_64    ||27    ||
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140329_001343.log/
> > |}
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
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


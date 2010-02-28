Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Nlr2d-0007lU-VY
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 22:51:16 +0100
Received: (qmail 28416 invoked by uid 1003); 28 Feb 2010 21:48:21 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 28 Feb 2010 21:48:21 -0000
Message-ID: <4B8AE4A4.70504@balister.org>
Date: Sun, 28 Feb 2010 16:48:20 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
In-Reply-To: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] duplicate recipes
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
X-List-Received-Date: Sun, 28 Feb 2010 21:51:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2010 03:01 PM, Frans Meulenbroeks wrote:
> Below is a list of all recipes that have 5 or more versions.
> Guess a lot of these are deadwood.
> Proposal is to do some cleaning for these.
>
> Probably the best scenario is to remove all versions which
> - are not the latest version
> - are not  pinned with  PREFERRED_VERSION  in conf/distro/*
> - do not have the largest DEFAULT_PREFERENCE
>
> What do people feel about this?

No, as noted elsewhere we have no idea who might be using older 
versions. In general, I support people who are actively involved in 
specific recipes, who are familiar with the user base of the recipe in 
cleaning up recipes (including removing old recipes)

I do not support cleaning up recipes for the sake of "cleaning up".

Philip

>
> Frans.
>
>       26 glib-2.0/glib-2.0
>       26 gcc/gcc-cross
>       25 gcc/gcc-cross-intermediate
>       25 gcc/gcc-cross-initial
>       25 gcc/gcc
>       24 linux/linux
>       22 binutils/binutils-cross
>       22 binutils/binutils
>       18 gcc/gcc-cross-sdk
>       16 glibc/glibc
>       15 xserver-common/xserver-common
>       14 linux-libc-headers/linux-libc-headers
>       14 gtk+/gtk+
>       14 binutils/binutils-cross-sdk
>       13 xorg-lib/pixman
>       12 u-boot/u-boot
>       12 mozilla/firefox
>       11 networkmanager/networkmanager
>       11 gtk-webcore/midori
>       11 glibc/glibc-initial
>       10 xorg-xserver/xserver-xorg
>       10 xorg-driver/xf86-input-evdev
>       10 transmission/transmission
>       10 pango/pango
>       10 linux/linux-omap1
>       10 connman/connman
>       10 cairo/cairo
>       10 bluez/bluez4
>        9 xorg-xserver/xserver-kdrive
>        9 xorg-lib/libx11
>        9 xorg-app/xinit
>        9 rxvt-unicode/rxvt-unicode
>        9 freetype/freetype
>        9 evince/evince
>        9 busybox/busybox
>        8 xorg-lib/libx11-native
>        8 xorg-driver/xf86-video-nv
>        8 wpa-supplicant/wpa-supplicant
>        8 telepathy/empathy
>        8 nautilus/nautilus
>        8 matchbox-panel/matchbox-panel
>        8 linux/linux-ixp4xx
>        8 libgpepimc/libgpepimc
>        8 intltool/intltool
>        8 gpe-todo/gpe-todo
>        8 gpe-mini-browser/gpe-mini-browser
>        8 gpe-clock/gpe-clock
>        8 gnome/libgsf
>        8 gnome/libgnomeui
>        8 gnome/libgnome
>        8 gnome/gnome-keyring
>        8 gnome/gnome-desktop
>        8 glib-2.0/glib-2.0-native
>        8 gimp/gimp
>        8 directfb/directfb
>        8 apt/apt
>        8 alsa/alsa-utils
>        8 alsa/alsa-lib
>        8 abiword/abiword
>        7 xorg-util/util-macros-native
>        7 xorg-util/util-macros
>        7 xorg-proto/inputproto
>        7 xorg-lib/xtrans
>        7 xorg-lib/libxfont
>        7 xorg-driver/xf86-video-geode
>        7 xorg-driver/xf86-input-mouse
>        7 udev/udev
>        7 uclibc/uclibc-initial
>        7 uclibc/uclibc
>        7 pulseaudio/pulseaudio
>        7 openvpn/openvpn
>        7 openssh/openssh
>        7 minilite/minilite
>        7 mesa/mesa
>        7 lirc/lirc-modules
>        7 linux/linux-omap
>        7 linux/linux-handhelds-2.6
>        7 libtool/libtool
>        7 libeventdb/libeventdb
>        7 intltool/intltool-native
>        7 hal/hal
>        7 gphoto2/gphoto2
>        7 gpe-what/gpe-what
>        7 gpe-ownerinfo/gpe-ownerinfo
>        7 gpe-conf/gpe-conf
>        7 gpe-bluetooth/gpe-bluetooth
>        7 gnome/libsoup-2.4
>        7 gnome/gnome-panel
>        7 gnome/gnome-menus
>        7 gnome/epiphany
>        7 e2fsprogs-libs/e2fsprogs-libs
>        7 avahi/avahi
>        6 xorg-proto/xproto-native
>        6 xorg-proto/xproto
>        6 xorg-lib/libxi
>        6 xorg-driver/xf86-video-vmware
>        6 xorg-driver/xf86-video-i128
>        6 xorg-driver/xf86-video-ati
>        6 xorg-driver/xf86-input-keyboard
>        6 xorg-app/xdm
>        6 xcb/xcb-proto
>        6 xcb/libxcb
>        6 tzdata/tzdata
>        6 scummvm/scummvm
>        6 poppler/poppler
>        6 patchutils/patchutils
>        6 mesa/mesa-dri
>        6 libxsettings-client/libxsettings-client
>        6 libtool/libtool-native
>        6 libtool/libtool-cross
>        6 libtododb/libtododb
>        6 libgpevtype/libgpevtype
>        6 libglade/libglade
>        6 kexecboot/linux-kexecboot
>        6 hal/hal-info
>        6 gphoto2/libgphoto2
>        6 gpephone/gpe-applauncher
>        6 gpe-filemanager/gpe-filemanager
>        6 gnome/libgnomecanvas
>        6 gnash/gnash
>        6 gdb/gdb-cross
>        6 gdb/gdb
>        6 freetype/freetype-native
>        6 fontconfig/fontconfig
>        6 ekiga/ptlib
>        6 ekiga/opal
>        6 ekiga/ekiga
>        6 dri/libdrm
>        6 devio/devio-native
>        6 devio/devio
>        6 asterisk/asterisk
>        6 apt/apt-native
>        6 acpid/acpid
>        6 abiword/abiword-plugins
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



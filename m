Received: from smtp-out114.alice.it ([85.37.17.114])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NR76o-0001uS-6h
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 17:45:49 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out114.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 2 Jan 2010 17:43:43 +0100
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 2 Jan 2010 17:43:43 +0100
Received: from [192.168.1.116] ([79.11.151.179]) by FBCMCL01B02.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 2 Jan 2010 17:43:42 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 02 Jan 2010 17:43:40 +0100
Message-Id: <1262450620.5161.33.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 02 Jan 2010 16:43:42.0833 (UTC)
	FILETIME=[BE72CE10:01CA8BCA]
X-SA-Exim-Connect-IP: 85.37.17.114
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: DOLT(doltlibtool)
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
X-List-Received-Date: Sat, 02 Jan 2010 16:45:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

What is dolt:
-------------
Dolt is an m4 macro which speed up compilation caching libtool results
From http://dolt.freedesktop.org/ :

If you use automake, autoconf, and libtool, then using dolt just
requires two steps:

     1. add DOLT after the call to LT_INIT, AC_PATH_LIBTOOL, or
        AM_PATH_LIBTOOL in your configure.ac or configure.in script, and
     2. append dolt.m4 to your project's acinclude.m4.

For any platform Dolt does not support, it will transparently fall back
to libtool.

So if someone wants to remove dolt he just have to remove DOLT from
configure.ac and it won't have other issues than increased compile time

The m4 macro can be viewed here:
http://cgit.freedesktop.org/dolt/tree/dolt.m4

The problem:
------------
It doesn't work on my setup:
Every compilation of a software using dolt ends up like that(output
stripped):
.../doltlibtool: exec: .../libtool: cannot execute: No such file or
directory
In the topdir in the unpacked software there is this instead:
i686-angstrom-linux-libtool
(I "cross-compile" for x86,see my setup at the end of the mail)

Possible fixes:
---------------
The best fix that I found is the removal of DOLT from the configure.ac
Some other fixes would be to pass LIBTOOL=i686-angstrom-linux-libtool to
oe_runmake

How to deploy the fix:
----------------------
So far I identified 4 software using dolt:
*abiword 2.8.1
*goffice 0.7.4
*xf86-video-intel 2.9.1
*gmime 2.4.10

Given the high number of packages and the lack of time on my part I
thought that,instead of fixing the m4 macro I could propose to deploy a
sed fix in the autotools.bbclass
It would have needed to find all configure.ac and sed them(they could be
in a sub directory)

I asked on IRC:
Dec 31 00:11:14 <GNUtoo>        mmm maybe we could teach to remove DOLT
to a class?
Dec 31 00:11:55 <woglinde>      gnutoo abiword is using dolt?
Dec 31 00:12:01 <GNUtoo>        s/a class/autotools.bbclass
Dec 31 00:12:02 <GNUtoo>        yes
Dec 31 00:12:09 <GNUtoo>        3 packages identified so far
Dec 31 00:12:14 <GNUtoo>        I bet there are more
Dec 31 00:12:23 <woglinde>      remove just the marco invokation in
configure.in/ac
Dec 31 00:12:27 <woglinde>      that should be enough
Dec 31 00:12:31 <GNUtoo>        the 2.8.1 is using it
Dec 31 00:12:36 <woglinde>      normal libtoll should take over
Dec 31 00:12:41 <GNUtoo>        yes that's I wanted to do
Dec 31 00:12:44 <woglinde>      as far as I read dolt.m4
Dec 31 00:12:50 <GNUtoo>        but my question was where to do it
Dec 31 00:13:06 <GNUtoo>        if I do it in autotools.bbclass is it
ok(would need review)
Dec 31 00:13:22 <GNUtoo>        and the fix work(removing DOLT)
Dec 31 00:14:39 <woglinde>      no
Dec 31 00:14:44 <woglinde>      please fix per recipe
Dec 31 00:15:03 <woglinde>      you dont know the software uses dolt
Dec 31 00:15:26 <GNUtoo>        sed ?
Dec 31 00:16:07 <GNUtoo>        what I'm afraid is if every autotool
based program start using dolt
Dec 31 00:16:12 <woglinde>      what is dolt is used in a private .m4
file?
Dec 31 00:16:18 <woglinde>      no
Dec 31 00:18:15 <GNUtoo>        ok thanks a lot
Dec 31 00:18:30 *       jeremy_laine has quit (Remote closed the
connection)
Dec 31 00:18:38 <GNUtoo>        I'll patch or sed inside the recipe
themselves and not in autotools.bbclass
Dec 31 00:18:48 <woglinde>      why sed?
Dec 31 00:18:52 <woglinde>      I would make a patch
Dec 31 00:19:02 <GNUtoo>        ok I'll make a patch

So I ended up patching the 4 softwares

Introduction to the problem
---------------------------
But there was a problem:
<ich> GNUtoo: who reviewed the changes?
* ich is now known as zecke
<CIA-54> (11 lines omitted)
<GNUtoo> zecke, I asked for some of the changes to woglinde (dolt)
<zecke> GNUtoo: have you checked that this is broken for anyone but you?
<GNUtoo> zecke, removing dolt doesn't harm 
<GNUtoo> zecke, basically dolt only speed up things a bit
<zecke> GNUtoo: this is where you are wrong. It harms to diverge from
upstream.
[...]
<GNUtoo> will you revert the commit or should I do it?
<zecke> GNUtoo: no rush, let us talk about it by mail

My setup:
---------
Here's my target(some things like i915 instead of intel and the lack of
xf86-input-synaptics are wrong but it's not the topic here):

#-----------------------------------------------------------------------------
#@TYPE: Machine
#@NAME: eeepc 701
#@DESCRIPTION: Machine configuration for the eeepc 701 netbook
#-----------------------------------------------------------------------------

require i686-generic.conf

PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
PREFERRED_PROVIDER_virtual/libgl = "mesa-dri"
MACHINE_DRI_MODULES = "i915"

XSERVER = "xserver-xorg xf86-video-intel xf86-input-evdev
xf86-input-keyboard xf86-input-mouse"

MACHINE_FEATURES +=" wifi alsa "
MACHINE_DISPLAY_WIDTH_PIXELS = "800"
MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
MACHINE_DISPLAY_ORIENTATION = "0"
XSERVER ?= "xserver-xorg \
           xf86-video-intel \
           xf86-input-evdev \
   xf86-input-keyboard \
   xf86-input-mouse"

IMAGE_FSTYPES += "tar.gz"

And here's my build system:

Portage 2.2_rc46 (selinux/2007.0/x86, gcc-4.3.2, glibc-2.8_p20080602-r1,
2.6.31_port4_piix i686)
=================================================================
System uname:
Linux-2.6.31_port4_piix-i686-Intel-R-_Pentium-R-_M_processor_2.00GHz-with-gentoo-2.0.1
Timestamp of tree: Sat, 07 Nov 2009 23:00:01 +0000
distcc 2.18.3 i686-pc-linux-gnu (protocols 1 and 2) (default port 3632)
[disabled]
ccache version 2.4 [disabled]
app-shells/bash:     3.2_p39
dev-java/java-config: 1.3.7-r1, 2.1.7
dev-lang/python:     2.5.4-r3, 2.6.2
dev-python/pycrypto: 2.0.1-r8
dev-util/ccache:     2.4-r7
dev-util/cmake:      2.6.2-r1
sys-apps/baselayout: 2.0.1
sys-apps/openrc:     0.5.2-r1
sys-apps/sandbox:    1.6-r2
sys-devel/autoconf:  2.13, 2.63
sys-devel/automake:  1.4_p6, 1.5, 1.6.3, 1.7.9-r1, 1.8.5-r3, 1.9.6-r2,
1.10.2
sys-devel/binutils:  2.18-r3
sys-devel/gcc-config: 1.4.1
sys-devel/libtool:   2.2.6a
virtual/os-headers:  2.6.29
ACCEPT_KEYWORDS="x86"
CBUILD="i686-pc-linux-gnu"
CFLAGS="-O2 -march=pentium-m -pipe -g -ggdb"
CHOST="i686-pc-linux-gnu"
CONFIG_PROTECT="/etc /usr/share/config /var/bind"
CONFIG_PROTECT_MASK="/etc/ca-certificates.conf /etc/env.d /etc/env.d/java/ 
/etc/fonts/fonts.conf /etc/gconf /etc/gentoo-release 
/etc/php/apache2-php5/ext-active/ /etc/php/cgi-php5/ext-active/ 
/etc/php/cli-php5/ext-active/ /etc/revdep-rebuild /etc/sandbox.d 
/etc/terminfo /etc/texmf/language.dat.d /etc/texmf/language.def.d 
/etc/texmf/updmap.d /etc/texmf/web2c /etc/udev/rules.d"
CXXFLAGS="-O2 -march=pentium-m -pipe -g -ggdb"
DISTDIR="/usr/portage/distfiles"
FEATURES="assume-digests distlocks fixpackages loadpolicy news nostrip
parallel-fetch preserve-libs protect-owned sandbox selinux sesandbox
sfperms strict unmerge-logs unmerge-orphans userfetch"
GENTOO_MIRRORS="http://distfiles.gentoo.org
http://distro.ibiblio.org/pub/linux/distributions/gentoo"
LANG="en_US.utf8"
LC_ALL="en_US.utf8"
LDFLAGS="-Wl,-O1"
LINGUAS="en en_GB en_US"
MAKEOPTS="-j2"
PKGDIR="/usr/portage/packages"
PORTAGE_CONFIGROOT="/"
PORTAGE_RSYNC_OPTS="--recursive --links --safe-links --perms --times
--compress --force --whole-file --delete --stats --timeout=180
--exclude=/distfiles --exclude=/local --exclude=/packages"
PORTAGE_TMPDIR="/var/tmp"
PORTDIR="/usr/portage"
PORTDIR_OVERLAY="/usr/local/portage/layman/java-gcj-overlay /usr/overlay"
SYNC="rsync://192.168.1.1/gentoo-portage"
USE="7zip X a52 aac acl acpi adns adplug aiglx alsa amr apache2 asf
asyncns automount avahi bash-completion beagle berkdb bl blender-game
bluetooth branding bs2b bzip2 cairo caps cdaudio cdda cddb cdparanoia
cdr celt chardet clearcase cli consolekit contrarius cracklib cran crypt
css cups curl cvs dbus dga dia dirac disk-partition divx djvu dri dtmf
dts dv dvb dvd dvdnav dvdr dvdread ebook editor effects emacs enca
encode examples exif expat faac faad fam fat ffmpeg firefox flac
foomaticdb fping freesound fuse gdal gif gimp gimpprint glsa gmedia gmp
gnome gnome-keyring gnomecd gnutls gphoto2 gps gsm gstreamer gtk h281
h323 hal hfs httpd icecast iconv idn ieee1394 imagemagick inkjar
inquisitio irmc jabber java java5 java6 jfs jpeg jpeg2k kde kqemu lame
laptop lcms libnotify libsamplerate lzo mad maps marble matroska melt
mikmod mjpeg mmx mmxext mng modplug modules mp2 mp3 mp4 mpi mplayer mtp
mudflap musepack nautilus ncurses network nfs nntp nptl nsplugin ntfs
ofa ogg openal openexr opengl openmp osgapps p2p pam pcre pda pdf
perforce perl phonon php plugin png pnm policykit postscript ppds pppd
profile projectm pulseaudio python qa qos quicktime quotas raw readline
realmedia reflection reiser4 reiserfs rt2500pci rtc rtsp samba sasl
scenarios schroedinger sdl selinux session shmvideo sid skins slang sox
speex spell spl sqlite srteam sse sse2 ssl startup-notification stream
subtitles subversion svg swat tga theora threads tiff timidity tordns
tracker truetype tta unicode usb v4l v4l2 vcd vde video vidx vlm vorbis
vxml wav wavpack webkit wifi wma wmf wmp wxwindows x86 xanim xcb xfs
xine xml xmp xorg xprint xrandr xulrunner xv xvid xvmc yahoo yv12 zlib
zrtp zsh" ALSA_CARDS="ali5451 als4000 atiixp atiixp-modem bt87x ca0106
cmipci emu10k1 emu10k1x ens1370 ens1371 es1938 es1968 fm801 hda-intel
intel8x0 intel8x0m maestro3 trident usb-audio via82xx via82xx-modem
ymfpci" ALSA_PCM_PLUGINS="adpcm alaw asym copy dmix dshare dsnoop empty
extplug file hooks iec958 ioplug ladspa lfloat linear meter mmap_emul
mulaw multi null plug rate route share shm softvol"
APACHE2_MODULES="access auth auth_dbm auth_anon auth_digest alias
file-cache echo charset-lite cache disk-cache mem-cache ext-filter
case_filter  case-filter-in deflate mime-magic cern-meta expires headers
usertrack unique-id proxy proxy-connect proxy-ftp proxy-http info
include cgi cgid dav dav-fs  vhost-alias speling rewrite log_config
logio env setenvif mime status autoindex asis negotiation dir imap
actions userdir so filter unique_id authz_host" ELIBC="glibc"
INPUT_DEVICES="wacom evdev keyboard mouse" KERNEL="linux"
LCD_DEVICES="bayrad cfontz cfontz633 glk hd44780 lb216 lcdm001 mtxorb
ncurses text" LINGUAS="en en_GB en_US" SANE_BACKENDS="plustek pixma"
USERLAND="GNU" VIDEO_CARDS="radeon" 
Unset:  CPPFLAGS, CTARGET, EMERGE_DEFAULT_OPTS, FFLAGS, INSTALL_MASK,
PORTAGE_COMPRESS, PORTAGE_COMPRESS_FLAGS, PORTAGE_RSYNC_EXTRA_OPTS

Denis.






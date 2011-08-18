Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtyMi-0007bX-17 for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:54:16 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtyIE-0006ur-Rl for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:49:38 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 10:49:38 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 10:49:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 18 Aug 2011 10:49:26 +0200
Message-ID: <j2ijmm$rcq$1@dough.gmane.org>
References: <1f806520f152cbda2bc4aa7cbfde0dbfea7dc9b7.1313655444.git.Martin.Jansa@gmail.com>
	<30fb538629c6a307b0e574028a11ae196e8a791f.1313655444.git.Martin.Jansa@gmail.com>
	<1313656223.4016.12.camel@mattotaupa>
	<20110818083723.GA6465@jama.jama.net>
	<1313657121.4016.21.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <1313657121.4016.21.camel@mattotaupa>
X-Enigmail-Version: 1.3
Subject: Re: [meta-efl][PATCH 2/2] e-wm: remove SHR specific patch
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
X-List-Received-Date: Thu, 18 Aug 2011 08:54:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-08-11 10:45, Paul Menzel schreef:
> Am Donnerstag, den 18.08.2011, 10:37 +0200 schrieb Martin Jansa:
>> On Thu, Aug 18, 2011 at 10:30:23AM +0200, Paul Menzel wrote:
> 
> […]
> 
>>> sorry for bothering. I do not have an overview yet. Could somebody elaborate if such distribution overrides are now deprecated? Will that patch be applied in the SHR layer?
>> 
>> yes, distributions now have own layers to apply own patches and other changes with .bbappend
>> 
>> the same should apply to machine overrides
> 
> Thank you for the explanation. So to find out if some distribution or machine adapts something I might find interesting I need to look in all layer (repositories) to find it instead of looking in one recipe. Is there trick to do that or is that generally not needed?

koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xdotool$ bitbake-layers show_appends
<string>:1: DeprecationWarning: Call to deprecated function bb.parse.parse_py.BBHandler.vars_from_file: Please use bb.parse.vars_from_file instead.
<string>:6: DeprecationWarning: Call to deprecated function bb.which: Please use bb.utils.which instead.
Parsing recipes..WARNING: No bb files matched BBFILE_PATTERN_htc-layer '^/OE/tentacle/sources/meta-smartphone/meta-htc/'
WARNING: No bb files matched BBFILE_PATTERN_nokia-layer '^/OE/tentacle/sources/meta-smartphone/meta-nokia/'
done.
State of append files:
atk_1.32.0.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-support/atk/atk_1.32.0.bbappend
base-files_3.0.14.bb:
  /OE/tentacle/sources/meta-angstrom/recipes-core/base-files/base-files_3.0.14.bbappend
clutter_git.bb:
  /OE/tentacle/sources/meta-intel/meta-emenlow/recipes-graphics/clutter/clutter_git.bbappend
clutter-1.6_1.6.14.bb:
  /OE/tentacle/sources/meta-intel/meta-emenlow/recipes-graphics/clutter/clutter-1.6_1.6.14.bbappend
formfactor_0.0.bb:
  /OE/tentacle/sources/meta-intel/meta-sugarbay/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-crownbay/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-emenlow/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-fishriver/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-n450/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /OE/tentacle/sources/meta-openpandora/recipes-bsp/formfactor/formfactor_0.0.bbappend
  /OE/tentacle/sources/meta-texasinstruments/recipes-bsp/formfactor/formfactor_0.0.bbappend
gcc_4.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc_4.6.bbappend
WARNING: gcc_4.5.bb: missing append for preferred version
gcc-cross_4.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross_4.6.bbappend
WARNING: gcc-cross_4.5.bb: missing append for preferred version
gcc-cross-canadian_4.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-canadian_4.6.bbappend
WARNING: gcc-cross-canadian_4.5.bb: missing append for preferred version
gcc-cross-initial_4.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.6.bbappend
WARNING: gcc-cross-initial_4.5.bb: missing append for preferred version
gcc-cross-intermediate_4.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bbappend
WARNING: gcc-cross-intermediate_4.5.bb: missing append for preferred version
gcc-crosssdk_4.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-crosssdk_4.6.bbappend
WARNING: gcc-crosssdk_4.5.bb: missing append for preferred version
gcc-crosssdk-initial_4.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bbappend
WARNING: gcc-crosssdk-initial_4.5.bb: missing append for preferred version
gcc-crosssdk-intermediate_4.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bbappend
WARNING: gcc-crosssdk-intermediate_4.5.bb: missing append for preferred version
gcc-runtime_4.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-runtime_4.6.bbappend
WARNING: gcc-runtime_4.5.bb: missing append for preferred version
libgcc_4.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/libgcc_4.6.bbappend
WARNING: libgcc_4.5.bb: missing append for preferred version
libgcrypt_1.4.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bbappend
libgpg-error_1.10.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend
librsvg_2.32.1.bb:
  /OE/tentacle/sources/meta-openembedded/meta-gnome/recipes-gnome/librsvg/librsvg_2.32.1.bbappend
libusb-compat_0.1.3.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
libusb1_1.0.8.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend
libxcb_1.7.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xcb/libxcb_1.7.bbappend
libxft_2.2.0.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxft_2.2.0.bbappend
libxrender_0.9.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
linux-omap_2.6.39.bb:
  /OE/tentacle/sources/meta-igep/recipes-kernel/linux/linux-omap_2.6.39.bbappend
netbase_4.45.bb:
  /OE/tentacle/sources/meta-openpandora/recipes-core/netbase/netbase_4.45.bbappend
  /OE/tentacle/sources/meta-texasinstruments/recipes-core/netbase/netbase_4.45.bbappend
qt4-embedded_4.7.3.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend
qt4-x11-free_4.7.3.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend
  /OE/tentacle/sources/meta-intel/meta-emenlow/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend
renderproto_0.11.1.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bbappend
sysvinit_2.88dsf.bb:
  /OE/tentacle/sources/meta-angstrom/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend
task-core-sdk-gmae.bb:
  /OE/tentacle/sources/meta-intel/meta-emenlow/recipes-gnome/tasks/task-core-sdk-gmae.bbappend
task-core-standalone-gmae-sdk-target.bb:
  /OE/tentacle/sources/meta-intel/meta-emenlow/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bbappend
task-core-tools.bb:
  /OE/tentacle/sources/meta-intel/meta-sugarbay/recipes-core/tasks/task-core-tools.bbappend
  /OE/tentacle/sources/meta-intel/meta-crownbay/recipes-core/tasks/task-core-tools.bbappend
  /OE/tentacle/sources/meta-intel/meta-emenlow/recipes-core/tasks/task-core-tools.bbappend
  /OE/tentacle/sources/meta-intel/meta-fishriver/recipes-core/tasks/task-core-tools.bbappend
  /OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-core/tasks/task-core-tools.bbappend
  /OE/tentacle/sources/meta-intel/meta-n450/recipes-core/tasks/task-core-tools.bbappend
tiff_3.8.2.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-multimedia/libtiff/tiff_3.8.2.bbappend
u-boot_git.bb:
  /OE/tentacle/sources/meta-smartphone/meta-palm/recipes-bsp/u-boot/u-boot_git.bbappend
WARNING: u-boot_2011.06.bb: missing append for preferred version
x-load_git.bb:
  /OE/tentacle/sources/meta-smartphone/meta-palm/recipes-bsp/x-load/x-load_git.bbappend
x-load_git.bb:
  /OE/tentacle/sources/meta-smartphone/meta-palm/recipes-bsp/x-load/x-load_git.bbappend
xcb-proto_1.6.bb:
  /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xcb/xcb-proto_1.6.bbappend
xserver-xf86-config_0.1.bb:
  /OE/tentacle/sources/meta-intel/meta-sugarbay/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /OE/tentacle/sources/meta-intel/meta-crownbay/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /OE/tentacle/sources/meta-intel/meta-emenlow/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /OE/tentacle/sources/meta-intel/meta-fishriver/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
  /OE/tentacle/sources/meta-intel/meta-n450/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
xserver-xf86-dri-lite_1.9.3.bb (skipped):
  /OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bbappend
initramfs-live-install_1.0.bb (skipped):
  /OE/tentacle/sources/meta-intel/meta-sugarbay/../common/recipes-core/initrdscripts/initramfs-live-install_1.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-jasperforest/../common/recipes-core/initrdscripts/initramfs-live-install_1.0.bbappend
u-boot_git.bb (skipped):
  /OE/tentacle/sources/meta-smartphone/meta-palm/recipes-bsp/u-boot/u-boot_git.bbappend
linux-yocto-rt_3.0.bb (skipped):
  /OE/tentacle/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto-rt_3.0.bbappend
linux-yocto_2.6.37.bb (skipped):
  /OE/tentacle/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/linux-yocto_2.6.37.bbappend
  /OE/tentacle/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-yocto_2.6.37.bbappend
  /OE/tentacle/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yocto_2.6.37.bbappend
  /OE/tentacle/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-yocto_2.6.37.bbappend
  /OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/linux-yocto_2.6.37.bbappend
  /OE/tentacle/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto_2.6.37.bbappend
linux-yocto_2.6.34.bb (skipped):
  /OE/tentacle/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-yocto_2.6.34.bbappend
  /OE/tentacle/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yocto_2.6.34.bbappend
  /OE/tentacle/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-yocto_2.6.34.bbappend
  /OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/linux-yocto_2.6.34.bbappend
  /OE/tentacle/sources/meta-intel/meta-n450/recipes-kernel/linux/linux-yocto_2.6.34.bbappend
linux-yocto_3.0.bb (skipped):
  /OE/tentacle/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/linux-yocto_3.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-yocto_3.0.bbappend
  /OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/linux-yocto_3.0.bbappend
xserver-xf86-dri-lite_1.9.3.bb (skipped):
  /OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bbappend
xserver-xf86-dri-lite_1.9.3.bb (skipped):
  /OE/tentacle/sources/meta-intel/meta-jasperforest/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bbappend
koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xdotool$
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOTNIWMkyGM64RGpERAtloAJ9Hu0799ZRiFQQCYB2BtlFcLUN3SwCdG+zG
mog3wHI/7XYRHHpNBkTMSJY=
=y07A
-----END PGP SIGNATURE-----




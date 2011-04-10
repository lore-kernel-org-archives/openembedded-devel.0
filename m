Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q8wI0-0006wB-J9
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 17:11:01 +0200
Received: by iye7 with SMTP id 7so5256064iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2011 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=tQv/2/v02VLC/L1ZtmTBDyg+sRWxOVTKaXjq1Rn52as=;
	b=okazDi+VDbGBccUhWuFBnXNHO9EEtLgnsOo6iHiS18jd5qgZxoGnMLe3LL9SB1kjV0
	8sk6FG6bs8OtlAVWTyRrvrhBxeJK3LzJoIAiwenZx+RzuFxYW4vVNkSaid9vRFw1MxCl
	ZLNwt7cZJEWVDvaJnldG5TFbkvgS4fU8mp5Nw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=BCj3RJKf6JJ6enp17p6G4Y4QLrlFw+GHQp/PbOkpOeoM56IvHLLpD1Fxd+a21OadYi
	nl5Ur3nuPmVoOYnFZiPg8c8BGTL5y87BlUDwRZWtpOoIBtbfeVFAVg2iFTkG+En+hf3z
	Ma1TT5K5NNNmS0TNVayZkytaZHnXu9CVa46xE=
Received: by 10.43.62.67 with SMTP id wz3mr6422260icb.185.1302448125052;
	Sun, 10 Apr 2011 08:08:45 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g16sm3500704ibb.3.2011.04.10.08.08.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Apr 2011 08:08:43 -0700 (PDT)
Date: Sun, 10 Apr 2011 08:09:00 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110410150900.GA13532@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1302439112.git.Martin.Jansa@gmail.com>
	<ac66eb7d7814147603134ac0db9f94118302093e.1302439112.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac66eb7d7814147603134ac0db9f94118302093e.1302439112.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 3/3] recipes, classes: import a lot of recipes from meta-shr
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
X-List-Received-Date: Sun, 10 Apr 2011 15:11:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/04/11 14:42), Martin Jansa wrote:
> * tested on shr-lite-image for om-gta02 and nokia900 (with meta-shr layer)
> ---
>  meta-oe/classes/gitpkgv.bbclass                    |   84 +
>  meta-oe/classes/gitver.bbclass                     |   80 +
>  meta-oe/classes/glx-use-tls.bbclass                |    7 +
>  meta-oe/classes/gpe.bbclass                        |   17 +
>  meta-oe/classes/srctree.bbclass                    |  123 +
>  meta-oe/recipes-connectivity/bluez/bluez4.inc      |   71 +
>  .../bluez/bluez4/bluetooth.conf                    |   16 +

can we call is bluez as we may not import bluez 3.x

>  .../fix-dfutool-usb-declaration-mismatch.patch     |   13 +
>  .../bluez/bluez4/hid2hci_usb_init.patch            |   33 +
>  .../bluez/bluez4/sbc-thumb.patch                   |   11 +
>  meta-oe/recipes-connectivity/bluez/bluez4_4.91.bb  |   15 +
>  meta-oe/recipes-connectivity/connman/connman.inc   |   79 +
>  .../recipes-connectivity/connman/connman/connman   |   42 +
>  .../connman/connman/link-against-libnl2.patch      |   13 +
>  .../connman/connman/shr/connman                    |   42 +
>  .../recipes-connectivity/connman/connman_0.72.bb   |   31 +
>  .../phonet-utils/phonet-utils_git.bb               |   18 +
>  meta-oe/recipes-core/meta/distro-feed-configs.bb   |   32 +
>  meta-oe/recipes-core/tasks/task-cli-tools.bb       |   52 +
>  meta-oe/recipes-core/tasks/task-x11.bb             |   43 +
>  .../gdbus-binding-tool/gdbus-binding-tool/COPYING  |  482 +
>  .../gdbus-binding-tool/gdbus-binding-tool_git.bb   |   37 +
>  .../use-usr-bin-env-for-python.patch               |   20 +
>  .../gobject-introspection_0.9.10.bb                |   32 +
>  .../recipes-devtools/json-glib/json-glib_0.10.4.bb |   14 +
>  .../libcanberra-increase-buffer-size.patch         |   13 +
>  .../libcanberra/libcanberra_0.26.bb                |   56 +
>  meta-oe/recipes-devtools/libgee/libgee.inc         |   18 +
>  meta-oe/recipes-devtools/libgee/libgee_0.6.0.bb    |   12 +
>  .../python/python-dateutil_1.4.1.bb                |   24 +
>  .../python/python-numeric/no-lapack.patch          |   33 +
>  .../recipes-devtools/python/python-numeric_24.2.bb |   15 +
>  .../recipes-devtools/python/python-pexpect_2.3.bb  |   24 +
>  .../python/python-phoneutils_git.bb                |   15 +
>  .../python/python-pyalsaaudio_0.4.bb               |   16 +
>  .../recipes-devtools/python/python-pyserial_2.4.bb |   23 +
>  .../recipes-devtools/python/python-pyyaml/setup.py |   64 +
>  .../recipes-devtools/python/python-pyyaml_svn.bb   |   22 +
>  .../python/python-vobject_0.8.1c.bb                |   17 +
>  .../vala-dbus-binding-tool.inc                     |   16 +
>  .../vala-dbus-binding-tool_git.bb                  |    6 +
>  meta-oe/recipes-devtools/vala/vala.inc             |   25 +
>  meta-oe/recipes-devtools/vala/vala_0.12.0.bb       |    7 +
>  meta-oe/recipes-extended/tzcode/tzcode-native.inc  |   18 +
>  .../recipes-extended/tzcode/tzcode-native_2011e.bb |   19 +
>  meta-oe/recipes-extended/tzdata/tzdata.inc         |  178 +
>  meta-oe/recipes-extended/tzdata/tzdata_2011e.bb    |   13 +

can you propose the tzcode/tzdata updates to oe-core too ?

>  .../recipes-graphics/drm/libdrm-2.4.24/glamo.patch | 1095 ++
>  .../drm/libdrm-2.4.24/installtests.patch           |   43 +
>  meta-oe/recipes-graphics/drm/libdrm_2.4.24.bb      |   39 +
>  meta-oe/recipes-graphics/mesa/README               |   12 +
>  meta-oe/recipes-graphics/mesa/mesa-7.10.2.inc      |   19 +
>  .../recipes-graphics/mesa/mesa-7.10.2/glamo.patch  | 2425 +++
>  .../recipes-graphics/mesa/mesa-7.10.2/uclibc.patch |   26 +
>  meta-oe/recipes-graphics/mesa/mesa-common.inc      |   53 +
>  meta-oe/recipes-graphics/mesa/mesa-dri.inc         |   10 +
>  meta-oe/recipes-graphics/mesa/mesa-dri_7.10.2.bb   |    4 +
>  meta-oe/recipes-graphics/mesa/mesa-xlib.inc        |    2 +
>  meta-oe/recipes-graphics/mesa/mesa-xlib_7.10.2.bb  |    4 +
>  meta-oe/recipes-graphics/mesa/mesa_7.10.2.bb       |    6 +
>  .../recipes-graphics/tasks/task-fonts-truetype.bb  |   40 +
>  .../ttf-fonts/ttf-liberation_0.2.bb                |   23 +
>  .../pointercal-xinput/iphone3g/pointercal.xinput   |    1 +
>  .../pointercal-xinput/nokia900/pointercal.xinput   |    2 +
>  .../pointercal-xinput/om-gta01/pointercal.xinput   |    2 +
>  .../pointercal-xinput/om-gta02/pointercal.xinput   |    2 +
>  .../pointercal-xinput/pointercal.xinput            |    1 +
>  .../xinput-calibrator/pointercal-xinput_0.0.bb     |   21 +
>  .../xinput-calibrator/xinput-calibrator.inc        |    8 +
>  .../xinput-calibrator/xinput-calibrator_0.6.1.bb   |   17 +
>  meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb     |   10 +
>  meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb  |    8 +
>  .../recipes-graphics/xorg-app/xorg-app-common.inc  |   15 +
>  .../recipes-graphics/xorg-doc/xorg-doc-common.inc  |   12 +
>  .../xorg-doc/xorg-sgml-doctools_1.7.bb             |    8 +
>  .../xorg-driver/xf86-input-keyboard_1.6.0.bb       |   17 +
>  .../xorg-driver/xf86-input-mouse_1.7.0.bb          |   17 +
>  .../xf86-input-tslib/10-x11-input-tslib.fdi        |   11 +
>  .../xf86-input-tslib/99-xf86-input-tslib.rules     |    5 +
>  .../xf86-input-tslib/double-free-crash.patch       |   20 +
>  .../xserver-174-XGetPointerControl.patch           |   34 +
>  .../xorg-driver/xf86-input-tslib_0.0.6.bb          |   32 +
>  .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    9 +
>  ...efine-GLAMO_CMDQ_MAX_COUNT-instead-of-mag.patch |   66 +
>  .../xorg-driver/xf86-video-glamo_git.bb            |   19 +
>  .../xorg-driver/xorg-driver-common.inc             |   40 +
>  .../xorg-driver/xorg-driver-input.inc              |    4 +
>  .../xorg-driver/xorg-driver-video.inc              |    4 +
>  .../xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch |   55 +
>  .../recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb  |   14 +
>  .../xorg-lib/libx11-1.4.1/keysymdef_include.patch  |   19 +
>  .../libx11-1.4.1/x11_disable_makekeys.patch        |   29 +
>  .../xorg-lib/libx11-1.4.3/keysymdef_include.patch  |   19 +
>  .../libx11-1.4.3/x11_disable_makekeys.patch        |   29 +
>  meta-oe/recipes-graphics/xorg-lib/libx11.inc       |   52 +
>  meta-oe/recipes-graphics/xorg-lib/libx11_1.4.1.bb  |   12 +
>  meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb  |   12 +
>  meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb  |   28 +
>  meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb |   22 +
>  meta-oe/recipes-graphics/xorg-lib/libxi_1.4.2.bb   |   21 +
>  .../recipes-graphics/xorg-lib/libxkbui_1.0.2.bb    |   10 +
>  meta-oe/recipes-graphics/xorg-lib/libxt_1.1.1.bb   |   37 +
>  meta-oe/recipes-graphics/xorg-lib/pixman_0.20.0.bb |    4 +-
>  meta-oe/recipes-graphics/xorg-lib/pixman_0.21.4.bb |    4 +-
>  .../recipes-graphics/xorg-lib/xorg-lib-common.inc  |    3 +-
>  .../recipes-graphics/xorg-proto/fixesproto_5.0.bb  |   21 +
>  .../recipes-graphics/xorg-proto/xextproto_7.2.0.bb |   19 +
>  .../xorg-proto/xorg-proto-common.inc               |    4 +-
>  .../recipes-graphics/xorg-proto/xproto_7.0.21.bb   |   16 +
>  .../xorg-util/util-macros_1.13.0.bb                |   15 +
>  .../xorg-util/xorg-util-common.inc                 |   11 +
>  .../xorg-xserver/xorg-xserver-common.inc           |  112 +
>  ...ack-assume-pixman-supports-overlapped-blt.patch |   14 +
>  .../hack-fbdev-ignore-return-mode.patch            |   39 +
>  .../xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch |   22 +
>  ...ack-assume-pixman-supports-overlapped-blt.patch |   14 +
>  .../hack-fbdev-ignore-return-mode.patch            |   39 +
>  .../xserver-xorg-1.9.4/randr-support.patch         |  102 +
>  .../xserver-xorg-conf/am3517-evm/xorg.conf         |   29 +
>  .../xserver-xorg-conf/am37x-evm/xorg.conf          |   29 +
>  .../xserver-xorg-conf/archos5/xorg.conf            |   29 +
>  .../xserver-xorg-conf/archos5it/xorg.conf          |   29 +
>  .../xserver-xorg-conf/at91sam9263ek/xorg.conf      |   11 +
>  .../xserver-xorg-conf/at91sam9g45ek/xorg.conf      |   23 +
>  .../xserver-xorg-conf/babbage/xorg.conf            |   56 +
>  .../xserver-xorg-conf/beagleboard/xorg.conf        |   29 +
>  .../xorg-xserver/xserver-xorg-conf/bug/xorg.conf   |   75 +
>  .../xorg-xserver/xserver-xorg-conf/bug20/xorg.conf |   37 +
>  .../xserver-xorg-conf/cm-t35/xorg.conf             |   29 +
>  .../xserver-xorg-conf/dm37x-evm/xorg.conf          |   29 +
>  .../xserver-xorg-conf/eee701/xorg.conf             |   97 +
>  .../xserver-xorg-conf/htcdream/xorg.conf           |   69 +
>  .../xserver-xorg-conf/htcleo/xorg.conf             |   73 +
>  .../xserver-xorg-conf/igep0020/xorg.conf           |   29 +
>  .../xorg-xserver/xserver-xorg-conf/ion/xorg.conf   |   51 +
>  .../xserver-xorg-conf/iphone3g/xorg.conf           |   29 +
>  .../xorg-xserver/xserver-xorg-conf/mh355/xorg.conf |   47 +
>  .../xserver-xorg-conf/nokia800/xorg.conf           |   29 +
>  .../xserver-xorg-conf/nokia900/xorg.conf           |   62 +
>  .../xserver-xorg-conf/om-gta01/xorg.conf           |   49 +
>  .../xserver-xorg-conf/om-gta02/xorg.conf           |   55 +
>  .../xserver-xorg-conf/omap3-pandora/xorg.conf      |   24 +
>  .../xserver-xorg-conf/omap3-touchbook/xorg.conf    |   25 +
>  .../xorg-xserver/xserver-xorg-conf/omap3/xorg.conf |   29 +
>  .../xserver-xorg-conf/omap3evm/xorg.conf           |   29 +
>  .../xserver-xorg-conf/omapzoom/xorg.conf           |   29 +
>  .../xserver-xorg-conf/omapzoom2/xorg.conf          |   29 +
>  .../xserver-xorg-conf/omapzoom36x/xorg.conf        |   29 +
>  .../xorg-xserver/xserver-xorg-conf/overo/xorg.conf |   29 +
>  .../xserver-xorg-conf/palmpre/xorg.conf            |   58 +
>  .../xserver-xorg-conf/ronetix-pm9263/xorg.conf     |   47 +
>  .../xorg-xserver/xserver-xorg-conf/spitz/xorg.conf |   49 +
>  .../xserver-xorg-conf/vortex86sx/xorg.conf         |   13 +
>  .../xserver-xorg-conf/xilinx-ml507/xorg.conf       |   39 +
>  .../xserver-xorg-conf/xilinx-virtex5/xorg.conf     |   38 +
>  .../xorg-xserver/xserver-xorg-conf_0.1.bb          |   17 +
>  .../xorg-xserver/xserver-xorg_1.10.0.901.bb        |   29 +
>  .../xorg-xserver/xserver-xorg_1.9.4.bb             |   31 +
>  .../xorg-xserver/xserver-xorg_git.bb               |   38 +
>  .../89xTs_Calibrate.xinput_calibrator.patch        |   12 +
>  .../xserver-common-1.34/89xdgautostart.sh          |    9 +
>  .../xserver-common-1.34/90xXWindowManager.patch    |   11 +
>  .../Xserver.add.dpi.for.gta.patch                  |   29 +
>  .../Xserver.add.nocursor.for.gta.patch             |   20 +
>  .../Xserver.add.xserver-system.patch               |   12 +
>  .../xserver-common-1.34/Xserver.n900.patch         |   17 +
>  .../xserver-common-1.34/gplv2-license.patch        |  353 +
>  .../xserver-common/xserver-common-1.34/setDPI.sh   |   92 +
>  .../xserver-common/xserver-common_1.34.bb          |   38 +
>  .../xserver-nodm-init-2.0/gplv2-license.patch      |  353 +
>  .../xserver-nodm-init-2.0/xserver-nodm             |   44 +
>  .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   27 +
>  .../ca-certificates_20090814+nmu2.bb               |   40 +
>  .../ca-certificates/files/remove-c-rehash.patch    |   29 +
>  .../dfu-util/dfu-util-native_svn.bb                |   16 +
>  meta-oe/recipes-support/dfu-util/dfu-util.inc      |   13 +
>  meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb   |    7 +
>  meta-oe/recipes-support/dfu-util/dfu-util_svn.bb   |   16 +
>  .../recipes-support/farsight/farsight2_0.0.22.bb   |   23 +
>  meta-oe/recipes-support/farsight/libnice_0.0.13.bb |   25 +
>  .../recipes-support/fbset/fbset-2.1/makefile.patch |   11 +
>  meta-oe/recipes-support/fbset/fbset-modes.bb       |   17 +
>  meta-oe/recipes-support/fbset/fbset-modes/fb.modes |    3 +
>  .../fbset/fbset-modes/om-gta01/fb.modes            |   29 +
>  .../fbset/fbset-modes/omap3-pandora/fb.modes       |    6 +
>  .../fbset/fbset-modes/qemuarm/fb.modes             |   17 +
>  .../fbset/fbset-modes/qemumips/fb.modes            |   17 +
>  meta-oe/recipes-support/fbset/fbset_2.1.bb         |   38 +
>  meta-oe/recipes-support/lcms/lcms_1.17.bb          |   14 +
>  .../libiconv/libiconv-1.13.1/autoconf.patch        |16018 ++++++++++++++++++++
>  meta-oe/recipes-support/libiconv/libiconv.inc      |   15 +
>  .../recipes-support/libiconv/libiconv_1.13.1.bb    |   25 +
>  meta-oe/recipes-support/libnl/libnl.inc            |    9 +
>  .../recipes-support/libnl/libnl/fix-pc-file.patch  |   11 +
>  .../libnl/libnl/fix-pktloc-dep-race.patch          |   20 +
>  meta-oe/recipes-support/libnl/libnl_2.0.bb         |   23 +
>  meta-oe/recipes-support/libnl/libnl_git.bb         |   20 +
>  .../libsdl-ttf/libsdl-ttf-2.0.10/configure.patch   |   13 +
>  .../libsdl-ttf/libsdl-ttf_2.0.10.bb                |   30 +
>  meta-oe/recipes-support/libyaml/libyaml_0.1.3.bb   |   14 +
>  .../lzma/lzma-4.65/001-large_files.patch           |   13 +
>  .../recipes-support/lzma/lzma-4.65/002-lzmp.patch  | 1059 ++
>  .../lzma/lzma-4.65/003-compile_fixes.patch         |   26 +
>  .../lzma/lzma-4.65/100-static_library.patch        |   70 +
>  .../lzma/lzma-4.65/makefile-cleanup.patch          |   18 +
>  meta-oe/recipes-support/lzma/lzma.inc              |   36 +
>  meta-oe/recipes-support/lzma/lzma_4.65.bb          |    5 +
>  .../mpfr/mpfr-3.0.0/long-long-thumb.patch          |   11 +
>  meta-oe/recipes-support/mpfr/mpfr-3.0.0/p4.patch   | 1752 +++
>  meta-oe/recipes-support/mpfr/mpfr_3.0.0.bb         |   30 +

mpfr-3.0.0 is also in oe-core so I wonder if it would be better
to provide these updates to oe-core instead

>  .../nano/nano-2.2.5/ncursesw.includedir.patch      |   12 +
>  meta-oe/recipes-support/nano/nano.inc              |   19 +
>  meta-oe/recipes-support/nano/nano_2.2.5.bb         |    8 +
>  meta-oe/recipes-support/pidgin/pidgin.inc          |   88 +
>  .../pidgin/pidgin/pidgin-cross-python-265.patch    |   16 +
>  .../pidgin/pidgin/pidgin.desktop-set-icon.patch    |   11 +
>  .../pidgin/pidgin/purple-OE-branding-25.patch      |   16 +
>  .../pidgin/pidgin/sanitize-configure.ac.patch      |   33 +
>  meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb     |   22 +
>  .../recipes-support/poppler/poppler-data_0.4.0.bb  |   24 +
>  meta-oe/recipes-support/poppler/poppler-fpu.inc    |    6 +
>  meta-oe/recipes-support/poppler/poppler.inc        |   25 +
>  meta-oe/recipes-support/poppler/poppler_0.12.3.bb  |   10 +
>  .../samsung-soc-utils/s3c24xx-gpio_svn.bb          |   19 +
>  .../samsung-soc-utils/s3c64xx-gpio_svn.bb          |   19 +
>  .../samsung-soc-utils/sjf2410-linux-native_svn.bb  |   34 +
>  meta-oe/recipes-support/talloc/talloc_2.0.1.bb     |   27 +
>  meta-oe/recipes-support/tangogps/tangogps.inc      |   15 +
>  .../recipes-support/tangogps/tangogps_0.99.4.bb    |    4 +
>  meta-oe/recipes-support/usbpath/usbpath_svn.bb     |   19 +
>  .../vala-terminal/vala-terminal_git.bb             |   18 +
>  meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb |   20 +
>  232 files changed, 29616 insertions(+), 7 deletions(-)
>  create mode 100644 meta-oe/classes/gitpkgv.bbclass
>  create mode 100644 meta-oe/classes/gitver.bbclass
>  create mode 100644 meta-oe/classes/glx-use-tls.bbclass
>  create mode 100644 meta-oe/classes/gpe.bbclass
>  create mode 100644 meta-oe/classes/srctree.bbclass
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4.inc
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/bluetooth.conf
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/fix-dfutool-usb-declaration-mismatch.patch
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/hid2hci_usb_init.patch
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/sbc-thumb.patch
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4_4.91.bb
>  create mode 100644 meta-oe/recipes-connectivity/connman/connman.inc
>  create mode 100755 meta-oe/recipes-connectivity/connman/connman/connman
>  create mode 100644 meta-oe/recipes-connectivity/connman/connman/link-against-libnl2.patch
>  create mode 100755 meta-oe/recipes-connectivity/connman/connman/shr/connman
>  create mode 100644 meta-oe/recipes-connectivity/connman/connman_0.72.bb
>  create mode 100644 meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
>  create mode 100644 meta-oe/recipes-core/meta/distro-feed-configs.bb
>  create mode 100644 meta-oe/recipes-core/tasks/task-cli-tools.bb
>  create mode 100644 meta-oe/recipes-core/tasks/task-x11.bb
>  create mode 100644 meta-oe/recipes-devtools/gdbus-binding-tool/gdbus-binding-tool/COPYING
>  create mode 100644 meta-oe/recipes-devtools/gdbus-binding-tool/gdbus-binding-tool_git.bb
>  create mode 100644 meta-oe/recipes-devtools/gobject-introspection/gobject-introspection/use-usr-bin-env-for-python.patch
>  create mode 100644 meta-oe/recipes-devtools/gobject-introspection/gobject-introspection_0.9.10.bb
>  create mode 100644 meta-oe/recipes-devtools/json-glib/json-glib_0.10.4.bb
>  create mode 100644 meta-oe/recipes-devtools/libcanberra/libcanberra/libcanberra-increase-buffer-size.patch
>  create mode 100644 meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
>  create mode 100644 meta-oe/recipes-devtools/libgee/libgee.inc
>  create mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.6.0.bb
>  create mode 100644 meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
>  create mode 100644 meta-oe/recipes-devtools/python/python-numeric/no-lapack.patch
>  create mode 100644 meta-oe/recipes-devtools/python/python-numeric_24.2.bb
>  create mode 100644 meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
>  create mode 100644 meta-oe/recipes-devtools/python/python-phoneutils_git.bb
>  create mode 100644 meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
>  create mode 100644 meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
>  create mode 100644 meta-oe/recipes-devtools/python/python-pyyaml/setup.py
>  create mode 100644 meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
>  create mode 100644 meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
>  create mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
>  create mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
>  create mode 100644 meta-oe/recipes-devtools/vala/vala.inc
>  create mode 100644 meta-oe/recipes-devtools/vala/vala_0.12.0.bb
>  create mode 100644 meta-oe/recipes-extended/tzcode/tzcode-native.inc
>  create mode 100644 meta-oe/recipes-extended/tzcode/tzcode-native_2011e.bb
>  create mode 100644 meta-oe/recipes-extended/tzdata/tzdata.inc
>  create mode 100644 meta-oe/recipes-extended/tzdata/tzdata_2011e.bb
>  create mode 100644 meta-oe/recipes-graphics/drm/libdrm-2.4.24/glamo.patch
>  create mode 100644 meta-oe/recipes-graphics/drm/libdrm-2.4.24/installtests.patch
>  create mode 100644 meta-oe/recipes-graphics/drm/libdrm_2.4.24.bb
>  create mode 100644 meta-oe/recipes-graphics/mesa/README
>  create mode 100644 meta-oe/recipes-graphics/mesa/mesa-7.10.2.inc
>  create mode 100644 meta-oe/recipes-graphics/mesa/mesa-7.10.2/glamo.patch
>  create mode 100644 meta-oe/recipes-graphics/mesa/mesa-7.10.2/uclibc.patch
>  create mode 100644 meta-oe/recipes-graphics/mesa/mesa-common.inc
>  create mode 100644 meta-oe/recipes-graphics/mesa/mesa-dri.inc
>  create mode 100644 meta-oe/recipes-graphics/mesa/mesa-dri_7.10.2.bb
>  create mode 100644 meta-oe/recipes-graphics/mesa/mesa-xlib.inc
>  create mode 100644 meta-oe/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
>  create mode 100644 meta-oe/recipes-graphics/mesa/mesa_7.10.2.bb
>  create mode 100644 meta-oe/recipes-graphics/tasks/task-fonts-truetype.bb
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointercal.xinput
>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointercal.xinput
>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointercal.xinput
>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointercal.xinput
>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc
>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.6.1.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/xinput_1.5.3.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/xorg-app-common.inc
>  create mode 100644 meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
>  create mode 100644 meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/10-x11-input-tslib.fdi
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/99-xf86-input-tslib.rules
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/double-free-crash.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xserver-174-XGetPointerControl.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-drm-define-GLAMO_CMDQ_MAX_COUNT-instead-of-mag.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xorg-driver-common.inc
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xorg-driver-input.inc
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xorg-driver-video.inc
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/keysymdef_include.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/keysymdef_include.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11.inc
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11_1.4.1.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxi_1.4.2.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxt_1.1.1.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-proto/xextproto_7.2.0.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-proto/xproto_7.0.21.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-util/util-macros_1.13.0.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-util/xorg-util-common.inc
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.901/hack-assume-pixman-supports-overlapped-blt.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.0.901/hack-fbdev-ignore-return-mode.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-assume-pixman-supports-overlapped-blt.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/hack-fbdev-ignore-return-mode.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.9.4/randr-support.patch
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am3517-evm/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/am37x-evm/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/archos5it/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9263ek/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/at91sam9g45ek/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/babbage/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/beagleboard/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/cm-t35/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/dm37x-evm/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/eee701/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcdream/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/htcleo/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ion/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/mh355/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia800/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/nokia900/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta01/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/om-gta02/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3-touchbook/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omap3evm/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom2/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/omapzoom36x/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/overo/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/ronetix-pm9263/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/spitz/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/vortex86sx/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf/xorg.conf
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-conf_0.1.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.10.0.901.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.9.4.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
>  create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/89xTs_Calibrate.xinput_calibrator.patch
>  create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/89xdgautostart.sh
>  create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/90xXWindowManager.patch
>  create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.dpi.for.gta.patch
>  create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.nocursor.for.gta.patch
>  create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.xserver-system.patch
>  create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.n900.patch
>  create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/gplv2-license.patch
>  create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/setDPI.sh
>  create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
>  create mode 100644 meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/gplv2-license.patch
>  create mode 100755 meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm
>  create mode 100644 meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
>  create mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates_20090814+nmu2.bb
>  create mode 100644 meta-oe/recipes-support/ca-certificates/files/remove-c-rehash.patch
>  create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb
>  create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util.inc
>  create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
>  create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
>  create mode 100644 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
>  create mode 100644 meta-oe/recipes-support/farsight/libnice_0.0.13.bb
>  create mode 100644 meta-oe/recipes-support/fbset/fbset-2.1/makefile.patch
>  create mode 100644 meta-oe/recipes-support/fbset/fbset-modes.bb
>  create mode 100644 meta-oe/recipes-support/fbset/fbset-modes/fb.modes
>  create mode 100644 meta-oe/recipes-support/fbset/fbset-modes/om-gta01/fb.modes
>  create mode 100644 meta-oe/recipes-support/fbset/fbset-modes/omap3-pandora/fb.modes
>  create mode 100644 meta-oe/recipes-support/fbset/fbset-modes/qemuarm/fb.modes
>  create mode 100644 meta-oe/recipes-support/fbset/fbset-modes/qemumips/fb.modes
>  create mode 100644 meta-oe/recipes-support/fbset/fbset_2.1.bb
>  create mode 100644 meta-oe/recipes-support/lcms/lcms_1.17.bb
>  create mode 100644 meta-oe/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
>  create mode 100644 meta-oe/recipes-support/libiconv/libiconv.inc
>  create mode 100644 meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
>  create mode 100644 meta-oe/recipes-support/libnl/libnl.inc
>  create mode 100644 meta-oe/recipes-support/libnl/libnl/fix-pc-file.patch
>  create mode 100644 meta-oe/recipes-support/libnl/libnl/fix-pktloc-dep-race.patch
>  create mode 100644 meta-oe/recipes-support/libnl/libnl_2.0.bb
>  create mode 100644 meta-oe/recipes-support/libnl/libnl_git.bb
>  create mode 100644 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf-2.0.10/configure.patch
>  create mode 100644 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
>  create mode 100644 meta-oe/recipes-support/libyaml/libyaml_0.1.3.bb
>  create mode 100644 meta-oe/recipes-support/lzma/lzma-4.65/001-large_files.patch
>  create mode 100644 meta-oe/recipes-support/lzma/lzma-4.65/002-lzmp.patch
>  create mode 100644 meta-oe/recipes-support/lzma/lzma-4.65/003-compile_fixes.patch
>  create mode 100644 meta-oe/recipes-support/lzma/lzma-4.65/100-static_library.patch
>  create mode 100644 meta-oe/recipes-support/lzma/lzma-4.65/makefile-cleanup.patch
>  create mode 100644 meta-oe/recipes-support/lzma/lzma.inc
>  create mode 100644 meta-oe/recipes-support/lzma/lzma_4.65.bb
>  create mode 100644 meta-oe/recipes-support/mpfr/mpfr-3.0.0/long-long-thumb.patch
>  create mode 100644 meta-oe/recipes-support/mpfr/mpfr-3.0.0/p4.patch
>  create mode 100644 meta-oe/recipes-support/mpfr/mpfr_3.0.0.bb
>  create mode 100644 meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
>  create mode 100644 meta-oe/recipes-support/nano/nano.inc
>  create mode 100644 meta-oe/recipes-support/nano/nano_2.2.5.bb
>  create mode 100644 meta-oe/recipes-support/pidgin/pidgin.inc
>  create mode 100644 meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
>  create mode 100644 meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
>  create mode 100644 meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
>  create mode 100644 meta-oe/recipes-support/pidgin/pidgin/sanitize-configure.ac.patch
>  create mode 100644 meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
>  create mode 100644 meta-oe/recipes-support/poppler/poppler-data_0.4.0.bb
>  create mode 100644 meta-oe/recipes-support/poppler/poppler-fpu.inc
>  create mode 100644 meta-oe/recipes-support/poppler/poppler.inc
>  create mode 100644 meta-oe/recipes-support/poppler/poppler_0.12.3.bb
>  create mode 100644 meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
>  create mode 100644 meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
>  create mode 100644 meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
>  create mode 100644 meta-oe/recipes-support/talloc/talloc_2.0.1.bb
>  create mode 100644 meta-oe/recipes-support/tangogps/tangogps.inc
>  create mode 100644 meta-oe/recipes-support/tangogps/tangogps_0.99.4.bb
>  create mode 100644 meta-oe/recipes-support/usbpath/usbpath_svn.bb
>  create mode 100644 meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
>  create mode 100644 meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
> 

have you tried to boot some qemu targets ? with this changeset



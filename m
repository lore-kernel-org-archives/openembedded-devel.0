Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1MwF9y-0003dV-RW
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 15:05:30 +0200
Received: by fxm3 with SMTP id 3so7267887fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2009 06:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Z4HjrkJ6pS2CCu51IV7JuD9e6unD6BzMtoKKs0wcW3s=;
	b=RDhGIuUfPm3i3m+T8jt0r1oDPFG+gupJjuGWAGAM2n/YarJtNzNd3U7yL+1LMZLTn+
	sntqUuNwn59/NE1VQyYVFOPDDEN0xSYOLISWQvSAOSWcS4577a85GixycPL0ivO6e+WE
	jzjUWur3Q0/RUx7e541W0OS5k5dsSj6zhYUtI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=dHG+9xvYpaF+OtUUE1OjbjSaOQPq+BHqdEuIzFb/FeTnAu8T5ZLNUhgXQUOEx8Sk4f
	0NIqUu3RrmDND0iro2zMD2W1eNVTT5+ZjfTYVNGIh7giI2xu86PFaIJ9SzPBxi7i2kAl
	wcY2e2/YqS9xQCCOfaOTmdMi/xWR4K/oFevF8=
Received: by 10.103.80.18 with SMTP id h18mr1086505mul.65.1255093475592;
	Fri, 09 Oct 2009 06:04:35 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 23sm3474921mun.28.2009.10.09.06.04.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 09 Oct 2009 06:04:34 -0700 (PDT)
From: "Martin.Jansa" <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Oct 2009 15:04:25 +0200
Message-Id: <1255093465-29918-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.rc2
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Add latest xorg stuff for xserver-1.7, script for easy recipe bump and xf86-video-glamo-kms
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
X-List-Received-Date: Fri, 09 Oct 2009 13:05:30 -0000

---
 .../include/preferred-xorg-versions-live.inc       |  637 ++++++++++++++++++++
 conf/distro/include/sane-srcrevs.inc               |    3 +-
 .../bump.preferred-xorg-versions-live.sh           |   68 +++
 recipes/dri/libdrm-glamo_git.bb                    |   17 +
 recipes/xorg-app/appres_1.0.2.bb                   |    7 +
 recipes/xorg-app/bdftopcf-native_1.0.2.bb          |    8 +
 recipes/xorg-app/bdftopcf_1.0.2.bb                 |    7 +
 recipes/xorg-app/bitmap_1.0.4.bb                   |    3 +
 recipes/xorg-app/constype_1.0.2.bb                 |    5 +
 recipes/xorg-app/editres_1.0.4.bb                  |    5 +
 recipes/xorg-app/luit_1.0.4.bb                     |    4 +
 recipes/xorg-app/mkcomposecache_1.2.1.bb           |    3 +
 recipes/xorg-app/mkfontscale-native_1.0.6.bb       |    7 +
 recipes/xorg-app/mkfontscale_1.0.6.bb              |    5 +
 recipes/xorg-app/rstart_1.0.3.bb                   |    5 +
 recipes/xorg-app/setxkbmap_1.1.0.bb                |    7 +
 recipes/xorg-app/xauth_1.0.4.bb                    |    5 +
 recipes/xorg-app/xbacklight_1.1.1.bb               |    6 +
 recipes/xorg-app/xclock_1.0.4.bb                   |    4 +
 recipes/xorg-app/xdm_1.1.9.bb                      |   10 +
 recipes/xorg-app/xedit_1.1.2.bb                    |    5 +
 recipes/xorg-app/xeyes_1.0.991.bb                  |    4 +
 recipes/xorg-app/xfs_1.1.0.bb                      |    5 +
 recipes/xorg-app/xinit_1.1.1.bb                    |    6 +
 recipes/xorg-app/xinput_1.4.99.3.bb                |    4 +
 recipes/xorg-app/xkbcomp-native_1.1.1.bb           |   11 +
 recipes/xorg-app/xkbcomp_1.1.1.bb                  |    5 +
 recipes/xorg-app/xmag_1.0.3.bb                     |    5 +
 recipes/xorg-app/xmodmap_1.0.4.bb                  |    5 +
 recipes/xorg-app/xrandr_1.3.2.bb                   |    8 +
 recipes/xorg-app/xrx_1.0.3.bb                      |    5 +
 recipes/xorg-app/xset_1.1.0.bb                     |   11 +
 recipes/xorg-data/xcursor-themes_1.0.2.bb          |    7 +
 recipes/xorg-doc/xorg-docs_1.4.99.901.bb           |   12 +
 recipes/xorg-doc/xorg-sgml-doctools_1.2.99.901.bb  |    4 +
 recipes/xorg-driver/xf86-input-acecad_1.4.0.bb     |    5 +
 recipes/xorg-driver/xf86-input-aiptek_1.3.0.bb     |    2 +
 recipes/xorg-driver/xf86-input-citron_2.2.2.bb     |    5 +
 recipes/xorg-driver/xf86-input-evdev_2.2.99.2.bb   |    4 +
 recipes/xorg-driver/xf86-input-fpit_1.3.0.bb       |    3 +
 recipes/xorg-driver/xf86-input-hyperpen_1.3.0.bb   |    3 +
 .../xorg-driver/xf86-input-joystick_1.4.99.2.bb    |    4 +
 recipes/xorg-driver/xf86-input-keyboard_1.4.0.bb   |    6 +
 recipes/xorg-driver/xf86-input-mouse_1.5.0.bb      |    4 +
 recipes/xorg-driver/xf86-input-mutouch_1.2.1.bb    |    4 +
 recipes/xorg-driver/xf86-input-penmount_1.4.0.bb   |    4 +
 recipes/xorg-driver/xf86-input-synaptics_1.2.0.bb  |    4 +
 recipes/xorg-driver/xf86-input-vmmouse_12.6.5.bb   |    6 +
 recipes/xorg-driver/xf86-input-void_1.3.0.bb       |    4 +
 recipes/xorg-driver/xf86-video-apm_1.2.2.bb        |    8 +
 recipes/xorg-driver/xf86-video-ark_0.7.2.bb        |    6 +
 recipes/xorg-driver/xf86-video-ast_0.89.9.bb       |    2 +
 recipes/xorg-driver/xf86-video-ati_6.12.4.bb       |    5 +
 recipes/xorg-driver/xf86-video-chips_1.2.2.bb      |    4 +
 recipes/xorg-driver/xf86-video-cirrus_1.3.2.bb     |    4 +
 recipes/xorg-driver/xf86-video-dummy_0.3.2.bb      |    6 +
 recipes/xorg-driver/xf86-video-geode_2.11.6.bb     |    5 +
 recipes/xorg-driver/xf86-video-glamo-kms_git.bb    |   12 +
 recipes/xorg-driver/xf86-video-glamo_git.bb        |   13 +-
 recipes/xorg-driver/xf86-video-glint_1.2.4.bb      |    6 +
 recipes/xorg-driver/xf86-video-i128_1.3.3.bb       |    4 +
 recipes/xorg-driver/xf86-video-i740_1.3.2.bb       |    5 +
 recipes/xorg-driver/xf86-video-intel_2.9.0.bb      |    5 +
 recipes/xorg-driver/xf86-video-mach64_6.8.2.bb     |    5 +
 recipes/xorg-driver/xf86-video-mga_1.9.100.bb      |    4 +
 recipes/xorg-driver/xf86-video-neomagic_1.2.4.bb   |    8 +
 recipes/xorg-driver/xf86-video-newport_0.2.3.bb    |    7 +
 recipes/xorg-driver/xf86-video-nv_2.1.15.bb        |    4 +
 .../xorg-driver/xf86-video-openchrome_0.2.904.bb   |    9 +
 recipes/xorg-driver/xf86-video-r128_6.8.1.bb       |    4 +
 recipes/xorg-driver/xf86-video-radeonhd_1.2.5.bb   |    9 +
 recipes/xorg-driver/xf86-video-rendition_4.2.3.bb  |    6 +
 recipes/xorg-driver/xf86-video-s3_0.6.3.bb         |    4 +
 recipes/xorg-driver/xf86-video-s3virge_1.10.4.bb   |    4 +
 recipes/xorg-driver/xf86-video-savage_2.3.1.bb     |   12 +
 .../xorg-driver/xf86-video-siliconmotion_1.7.3.bb  |    4 +
 recipes/xorg-driver/xf86-video-sis_0.10.2.bb       |   11 +
 recipes/xorg-driver/xf86-video-sisusb_0.9.3.bb     |    6 +
 recipes/xorg-driver/xf86-video-suncg14_1.1.1.bb    |    2 +
 recipes/xorg-driver/xf86-video-suncg3_1.1.1.bb     |    2 +
 recipes/xorg-driver/xf86-video-suncg6_1.1.1.bb     |    2 +
 recipes/xorg-driver/xf86-video-sunffb_1.2.1.bb     |    2 +
 recipes/xorg-driver/xf86-video-suntcx_1.1.1.bb     |    2 +
 recipes/xorg-driver/xf86-video-tdfx_1.4.3.bb       |   12 +
 recipes/xorg-driver/xf86-video-tga_1.2.1.bb        |    8 +
 recipes/xorg-driver/xf86-video-trident_1.3.3.bb    |    5 +
 recipes/xorg-driver/xf86-video-tseng_1.2.3.bb      |    6 +
 recipes/xorg-driver/xf86-video-vesa_2.2.1.bb       |    9 +
 recipes/xorg-driver/xf86-video-vmware_10.16.8.bb   |    6 +
 recipes/xorg-driver/xf86-video-voodoo_1.2.3.bb     |    6 +
 recipes/xorg-driver/xf86-video-wsfb_0.3.0.bb       |    4 +
 recipes/xorg-driver/xf86-video-xgi_1.5.1.bb        |    6 +
 recipes/xorg-driver/xf86-video-xgixp_1.7.99.4.bb   |    6 +
 recipes/xorg-font/font-screen-cyrillic_1.0.1.bb    |    2 +
 recipes/xorg-font/font-util-native_1.0.2.bb        |    8 +
 recipes/xorg-font/font-util_1.0.2.bb               |   11 +
 recipes/xorg-lib/libapplewm_1.4.0.bb               |    7 +
 recipes/xorg-lib/libdmx_1.1.0.bb                   |    6 +
 recipes/xorg-lib/libfontenc-native_1.0.5.bb        |    8 +
 recipes/xorg-lib/libfontenc_1.0.5.bb               |    7 +
 recipes/xorg-lib/libfs_1.0.2.bb                    |    7 +
 recipes/xorg-lib/libice-native_1.0.6.bb            |    8 +
 recipes/xorg-lib/libice_1.0.6.bb                   |    9 +
 recipes/xorg-lib/libpciaccess_0.10.9.bb            |    5 +
 recipes/xorg-lib/libsm-native_1.1.1.bb             |    7 +
 recipes/xorg-lib/libsm_1.1.1.bb                    |    8 +
 recipes/xorg-lib/libwindowswm_1.0.1.bb             |    6 +
 recipes/xorg-lib/libx11-native_1.3.bb              |    8 +
 recipes/xorg-lib/libx11/dolt-fix.patch             |   21 +
 .../libx11/x11_disable_makekeys.1.6.3.patch        |   24 +
 recipes/xorg-lib/libx11_1.3.bb                     |   32 +
 recipes/xorg-lib/libxau-native_1.0.5.bb            |    9 +
 recipes/xorg-lib/libxau_1.0.5.bb                   |    8 +
 recipes/xorg-lib/libxaw_1.0.6.bb                   |   21 +
 recipes/xorg-lib/libxcomposite_0.4.1.bb            |    9 +
 recipes/xorg-lib/libxcursor-native_1.1.10.bb       |    6 +
 recipes/xorg-lib/libxcursor_1.1.10.bb              |    9 +
 recipes/xorg-lib/libxdamage_1.1.2.bb               |   10 +
 recipes/xorg-lib/libxdmcp-native_1.0.3.bb          |   10 +
 recipes/xorg-lib/libxdmcp_1.0.3.bb                 |    9 +
 recipes/xorg-lib/libxext-native_1.1.bb             |   12 +
 recipes/xorg-lib/libxext_1.1.bb                    |    9 +
 recipes/xorg-lib/libxfixes-native_4.0.4.bb         |    6 +
 recipes/xorg-lib/libxfixes_4.0.4.bb                |    8 +
 recipes/xorg-lib/libxfont-native_1.4.0.bb          |   10 +
 recipes/xorg-lib/libxfont_1.4.0.bb                 |   11 +
 recipes/xorg-lib/libxfontcache_1.0.5.bb            |    8 +
 recipes/xorg-lib/libxi_1.3.bb                      |    8 +
 recipes/xorg-lib/libxinerama_1.1.bb                |    9 +
 recipes/xorg-lib/libxkbfile-native_1.0.6.bb        |    8 +
 recipes/xorg-lib/libxkbfile_1.0.6.bb               |    7 +
 recipes/xorg-lib/libxmu_1.0.5.bb                   |   16 +
 recipes/xorg-lib/libxrender-native_0.9.5.bb        |    6 +
 recipes/xorg-lib/libxrender_0.9.5.bb               |    9 +
 recipes/xorg-lib/libxscrnsaver_1.2.0.bb            |   11 +
 recipes/xorg-lib/libxt-native_1.0.7.bb             |    8 +
 recipes/xorg-lib/libxt_1.0.7.bb                    |   19 +
 recipes/xorg-lib/libxtst_1.1.0.bb                  |    9 +
 recipes/xorg-lib/libxv_1.0.5.bb                    |    8 +
 recipes/xorg-lib/libxvmc_1.0.5.bb                  |    8 +
 recipes/xorg-lib/libxxf86dga_1.1.1.bb              |    8 +
 recipes/xorg-lib/libxxf86misc_1.0.2.bb             |    9 +
 recipes/xorg-lib/libxxf86vm_1.1.0.bb               |    8 +
 recipes/xorg-lib/pixman_0.16.2.bb                  |   17 +
 recipes/xorg-lib/xtrans-native_1.2.4.bb            |    5 +
 recipes/xorg-lib/xtrans_1.2.4.bb                   |   14 +
 recipes/xorg-proto/applewmproto_1.4.1.bb           |    4 +
 recipes/xorg-proto/bigreqsproto-native_1.1.0.bb    |    7 +
 recipes/xorg-proto/bigreqsproto_1.1.0.bb           |    6 +
 recipes/xorg-proto/compositeproto_0.4.1.bb         |    6 +
 recipes/xorg-proto/damageproto_1.2.0.bb            |    7 +
 recipes/xorg-proto/dmxproto_2.3.bb                 |    4 +
 recipes/xorg-proto/dri2proto_2.1.bb                |    3 +
 recipes/xorg-proto/evieext_1.1.0.bb                |    4 +
 recipes/xorg-proto/fixesproto-native_4.1.1.bb      |    7 +
 recipes/xorg-proto/fixesproto_4.1.1.bb             |    7 +
 recipes/xorg-proto/fontcacheproto-native_0.1.3.bb  |    7 +
 recipes/xorg-proto/fontcacheproto_0.1.3.bb         |    4 +
 recipes/xorg-proto/fontsproto-native_2.1.0.bb      |    9 +
 recipes/xorg-proto/fontsproto_2.1.0.bb             |    4 +
 recipes/xorg-proto/glproto_1.4.10.bb               |    4 +
 recipes/xorg-proto/inputproto-native_2.0.bb        |    7 +
 recipes/xorg-proto/inputproto_2.0.bb               |    6 +
 recipes/xorg-proto/randrproto_1.3.1.bb             |    7 +
 recipes/xorg-proto/recordproto_1.14.bb             |    5 +
 recipes/xorg-proto/renderproto-native_0.11.bb      |    7 +
 recipes/xorg-proto/renderproto_0.11.bb             |    4 +
 recipes/xorg-proto/resourceproto_1.1.0.bb          |    5 +
 recipes/xorg-proto/scrnsaverproto_1.2.0.bb         |    4 +
 recipes/xorg-proto/videoproto_2.3.0.bb             |    4 +
 recipes/xorg-proto/windowswmproto_1.0.4.bb         |    4 +
 recipes/xorg-proto/xcmiscproto-native_1.2.0.bb     |    7 +
 recipes/xorg-proto/xcmiscproto_1.2.0.bb            |    6 +
 recipes/xorg-proto/xextproto-native_7.1.1.bb       |    7 +
 recipes/xorg-proto/xextproto_7.1.1.bb              |    3 +
 .../xorg-proto/xf86bigfontproto-native_1.2.0.bb    |    7 +
 recipes/xorg-proto/xf86bigfontproto_1.2.0.bb       |    6 +
 recipes/xorg-proto/xf86dgaproto_2.1.bb             |    5 +
 recipes/xorg-proto/xf86driproto_2.1.0.bb           |    3 +
 recipes/xorg-proto/xf86vidmodeproto_2.3.bb         |    5 +
 recipes/xorg-proto/xineramaproto_1.2.bb            |    4 +
 recipes/xorg-proto/xproto-native_7.0.16.bb         |    5 +
 recipes/xorg-proto/xproto_7.0.16.bb                |    8 +
 recipes/xorg-util/util-macros-native_1.3.0.bb      |    7 +
 recipes/xorg-util/util-macros_1.3.0.bb             |    6 +
 recipes/xorg-xserver/xorg-xserver-common.inc       |    4 +-
 .../xserver-xorg-1.7.0/randr-support-1.7.0.patch   |   96 +++
 recipes/xorg-xserver/xserver-xorg_1.7.0.bb         |   19 +
 188 files changed, 2083 insertions(+), 8 deletions(-)
 create mode 100644 conf/distro/include/preferred-xorg-versions-live.inc
 create mode 100755 contrib/source-checker/bump.preferred-xorg-versions-live.sh
 create mode 100644 recipes/dri/libdrm-glamo_git.bb
 create mode 100644 recipes/xorg-app/appres_1.0.2.bb
 create mode 100644 recipes/xorg-app/bdftopcf-native_1.0.2.bb
 create mode 100644 recipes/xorg-app/bdftopcf_1.0.2.bb
 create mode 100644 recipes/xorg-app/bitmap_1.0.4.bb
 create mode 100644 recipes/xorg-app/constype_1.0.2.bb
 create mode 100644 recipes/xorg-app/editres_1.0.4.bb
 create mode 100644 recipes/xorg-app/luit_1.0.4.bb
 create mode 100644 recipes/xorg-app/mkcomposecache_1.2.1.bb
 create mode 100644 recipes/xorg-app/mkfontscale-native_1.0.6.bb
 create mode 100644 recipes/xorg-app/mkfontscale_1.0.6.bb
 create mode 100644 recipes/xorg-app/rstart_1.0.3.bb
 create mode 100644 recipes/xorg-app/setxkbmap_1.1.0.bb
 create mode 100644 recipes/xorg-app/xauth_1.0.4.bb
 create mode 100644 recipes/xorg-app/xbacklight_1.1.1.bb
 create mode 100644 recipes/xorg-app/xclock_1.0.4.bb
 create mode 100644 recipes/xorg-app/xdm_1.1.9.bb
 create mode 100644 recipes/xorg-app/xedit_1.1.2.bb
 create mode 100644 recipes/xorg-app/xeyes_1.0.991.bb
 create mode 100644 recipes/xorg-app/xfs_1.1.0.bb
 create mode 100644 recipes/xorg-app/xinit_1.1.1.bb
 create mode 100644 recipes/xorg-app/xinput_1.4.99.3.bb
 create mode 100644 recipes/xorg-app/xkbcomp-native_1.1.1.bb
 create mode 100644 recipes/xorg-app/xkbcomp_1.1.1.bb
 create mode 100644 recipes/xorg-app/xmag_1.0.3.bb
 create mode 100644 recipes/xorg-app/xmodmap_1.0.4.bb
 create mode 100644 recipes/xorg-app/xrandr_1.3.2.bb
 create mode 100644 recipes/xorg-app/xrx_1.0.3.bb
 create mode 100644 recipes/xorg-app/xset_1.1.0.bb
 create mode 100644 recipes/xorg-data/xcursor-themes_1.0.2.bb
 create mode 100644 recipes/xorg-doc/xorg-docs_1.4.99.901.bb
 create mode 100644 recipes/xorg-doc/xorg-sgml-doctools_1.2.99.901.bb
 create mode 100644 recipes/xorg-driver/xf86-input-acecad_1.4.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-aiptek_1.3.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-citron_2.2.2.bb
 create mode 100644 recipes/xorg-driver/xf86-input-evdev_2.2.99.2.bb
 create mode 100644 recipes/xorg-driver/xf86-input-fpit_1.3.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-hyperpen_1.3.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-joystick_1.4.99.2.bb
 create mode 100644 recipes/xorg-driver/xf86-input-keyboard_1.4.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-mouse_1.5.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-mutouch_1.2.1.bb
 create mode 100644 recipes/xorg-driver/xf86-input-penmount_1.4.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-synaptics_1.2.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-vmmouse_12.6.5.bb
 create mode 100644 recipes/xorg-driver/xf86-input-void_1.3.0.bb
 create mode 100644 recipes/xorg-driver/xf86-video-apm_1.2.2.bb
 create mode 100644 recipes/xorg-driver/xf86-video-ark_0.7.2.bb
 create mode 100644 recipes/xorg-driver/xf86-video-ast_0.89.9.bb
 create mode 100644 recipes/xorg-driver/xf86-video-ati_6.12.4.bb
 create mode 100644 recipes/xorg-driver/xf86-video-chips_1.2.2.bb
 create mode 100644 recipes/xorg-driver/xf86-video-cirrus_1.3.2.bb
 create mode 100644 recipes/xorg-driver/xf86-video-dummy_0.3.2.bb
 create mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.6.bb
 create mode 100644 recipes/xorg-driver/xf86-video-glamo-kms_git.bb
 create mode 100644 recipes/xorg-driver/xf86-video-glint_1.2.4.bb
 create mode 100644 recipes/xorg-driver/xf86-video-i128_1.3.3.bb
 create mode 100644 recipes/xorg-driver/xf86-video-i740_1.3.2.bb
 create mode 100644 recipes/xorg-driver/xf86-video-intel_2.9.0.bb
 create mode 100644 recipes/xorg-driver/xf86-video-mach64_6.8.2.bb
 create mode 100644 recipes/xorg-driver/xf86-video-mga_1.9.100.bb
 create mode 100644 recipes/xorg-driver/xf86-video-neomagic_1.2.4.bb
 create mode 100644 recipes/xorg-driver/xf86-video-newport_0.2.3.bb
 create mode 100644 recipes/xorg-driver/xf86-video-nv_2.1.15.bb
 create mode 100644 recipes/xorg-driver/xf86-video-openchrome_0.2.904.bb
 create mode 100644 recipes/xorg-driver/xf86-video-r128_6.8.1.bb
 create mode 100644 recipes/xorg-driver/xf86-video-radeonhd_1.2.5.bb
 create mode 100644 recipes/xorg-driver/xf86-video-rendition_4.2.3.bb
 create mode 100644 recipes/xorg-driver/xf86-video-s3_0.6.3.bb
 create mode 100644 recipes/xorg-driver/xf86-video-s3virge_1.10.4.bb
 create mode 100644 recipes/xorg-driver/xf86-video-savage_2.3.1.bb
 create mode 100644 recipes/xorg-driver/xf86-video-siliconmotion_1.7.3.bb
 create mode 100644 recipes/xorg-driver/xf86-video-sis_0.10.2.bb
 create mode 100644 recipes/xorg-driver/xf86-video-sisusb_0.9.3.bb
 create mode 100644 recipes/xorg-driver/xf86-video-suncg14_1.1.1.bb
 create mode 100644 recipes/xorg-driver/xf86-video-suncg3_1.1.1.bb
 create mode 100644 recipes/xorg-driver/xf86-video-suncg6_1.1.1.bb
 create mode 100644 recipes/xorg-driver/xf86-video-sunffb_1.2.1.bb
 create mode 100644 recipes/xorg-driver/xf86-video-suntcx_1.1.1.bb
 create mode 100644 recipes/xorg-driver/xf86-video-tdfx_1.4.3.bb
 create mode 100644 recipes/xorg-driver/xf86-video-tga_1.2.1.bb
 create mode 100644 recipes/xorg-driver/xf86-video-trident_1.3.3.bb
 create mode 100644 recipes/xorg-driver/xf86-video-tseng_1.2.3.bb
 create mode 100644 recipes/xorg-driver/xf86-video-vesa_2.2.1.bb
 create mode 100644 recipes/xorg-driver/xf86-video-vmware_10.16.8.bb
 create mode 100644 recipes/xorg-driver/xf86-video-voodoo_1.2.3.bb
 create mode 100644 recipes/xorg-driver/xf86-video-wsfb_0.3.0.bb
 create mode 100644 recipes/xorg-driver/xf86-video-xgi_1.5.1.bb
 create mode 100644 recipes/xorg-driver/xf86-video-xgixp_1.7.99.4.bb
 create mode 100644 recipes/xorg-font/font-screen-cyrillic_1.0.1.bb
 create mode 100644 recipes/xorg-font/font-util-native_1.0.2.bb
 create mode 100644 recipes/xorg-font/font-util_1.0.2.bb
 create mode 100644 recipes/xorg-lib/libapplewm_1.4.0.bb
 create mode 100644 recipes/xorg-lib/libdmx_1.1.0.bb
 create mode 100644 recipes/xorg-lib/libfontenc-native_1.0.5.bb
 create mode 100644 recipes/xorg-lib/libfontenc_1.0.5.bb
 create mode 100644 recipes/xorg-lib/libfs_1.0.2.bb
 create mode 100644 recipes/xorg-lib/libice-native_1.0.6.bb
 create mode 100644 recipes/xorg-lib/libice_1.0.6.bb
 create mode 100644 recipes/xorg-lib/libpciaccess_0.10.9.bb
 create mode 100644 recipes/xorg-lib/libsm-native_1.1.1.bb
 create mode 100644 recipes/xorg-lib/libsm_1.1.1.bb
 create mode 100644 recipes/xorg-lib/libwindowswm_1.0.1.bb
 create mode 100644 recipes/xorg-lib/libx11-native_1.3.bb
 create mode 100644 recipes/xorg-lib/libx11/dolt-fix.patch
 create mode 100644 recipes/xorg-lib/libx11/x11_disable_makekeys.1.6.3.patch
 create mode 100644 recipes/xorg-lib/libx11_1.3.bb
 create mode 100644 recipes/xorg-lib/libxau-native_1.0.5.bb
 create mode 100644 recipes/xorg-lib/libxau_1.0.5.bb
 create mode 100644 recipes/xorg-lib/libxaw_1.0.6.bb
 create mode 100644 recipes/xorg-lib/libxcomposite_0.4.1.bb
 create mode 100644 recipes/xorg-lib/libxcursor-native_1.1.10.bb
 create mode 100644 recipes/xorg-lib/libxcursor_1.1.10.bb
 create mode 100644 recipes/xorg-lib/libxdamage_1.1.2.bb
 create mode 100644 recipes/xorg-lib/libxdmcp-native_1.0.3.bb
 create mode 100644 recipes/xorg-lib/libxdmcp_1.0.3.bb
 create mode 100644 recipes/xorg-lib/libxext-native_1.1.bb
 create mode 100644 recipes/xorg-lib/libxext_1.1.bb
 create mode 100644 recipes/xorg-lib/libxfixes-native_4.0.4.bb
 create mode 100644 recipes/xorg-lib/libxfixes_4.0.4.bb
 create mode 100644 recipes/xorg-lib/libxfont-native_1.4.0.bb
 create mode 100644 recipes/xorg-lib/libxfont_1.4.0.bb
 create mode 100644 recipes/xorg-lib/libxfontcache_1.0.5.bb
 create mode 100644 recipes/xorg-lib/libxi_1.3.bb
 create mode 100644 recipes/xorg-lib/libxinerama_1.1.bb
 create mode 100644 recipes/xorg-lib/libxkbfile-native_1.0.6.bb
 create mode 100644 recipes/xorg-lib/libxkbfile_1.0.6.bb
 create mode 100644 recipes/xorg-lib/libxmu_1.0.5.bb
 create mode 100644 recipes/xorg-lib/libxrender-native_0.9.5.bb
 create mode 100644 recipes/xorg-lib/libxrender_0.9.5.bb
 create mode 100644 recipes/xorg-lib/libxscrnsaver_1.2.0.bb
 create mode 100644 recipes/xorg-lib/libxt-native_1.0.7.bb
 create mode 100644 recipes/xorg-lib/libxt_1.0.7.bb
 create mode 100644 recipes/xorg-lib/libxtst_1.1.0.bb
 create mode 100644 recipes/xorg-lib/libxv_1.0.5.bb
 create mode 100644 recipes/xorg-lib/libxvmc_1.0.5.bb
 create mode 100644 recipes/xorg-lib/libxxf86dga_1.1.1.bb
 create mode 100644 recipes/xorg-lib/libxxf86misc_1.0.2.bb
 create mode 100644 recipes/xorg-lib/libxxf86vm_1.1.0.bb
 create mode 100644 recipes/xorg-lib/pixman_0.16.2.bb
 create mode 100644 recipes/xorg-lib/xtrans-native_1.2.4.bb
 create mode 100644 recipes/xorg-lib/xtrans_1.2.4.bb
 create mode 100644 recipes/xorg-proto/applewmproto_1.4.1.bb
 create mode 100644 recipes/xorg-proto/bigreqsproto-native_1.1.0.bb
 create mode 100644 recipes/xorg-proto/bigreqsproto_1.1.0.bb
 create mode 100644 recipes/xorg-proto/compositeproto_0.4.1.bb
 create mode 100644 recipes/xorg-proto/damageproto_1.2.0.bb
 create mode 100644 recipes/xorg-proto/dmxproto_2.3.bb
 create mode 100644 recipes/xorg-proto/dri2proto_2.1.bb
 create mode 100644 recipes/xorg-proto/evieext_1.1.0.bb
 create mode 100644 recipes/xorg-proto/fixesproto-native_4.1.1.bb
 create mode 100644 recipes/xorg-proto/fixesproto_4.1.1.bb
 create mode 100644 recipes/xorg-proto/fontcacheproto-native_0.1.3.bb
 create mode 100644 recipes/xorg-proto/fontcacheproto_0.1.3.bb
 create mode 100644 recipes/xorg-proto/fontsproto-native_2.1.0.bb
 create mode 100644 recipes/xorg-proto/fontsproto_2.1.0.bb
 create mode 100644 recipes/xorg-proto/glproto_1.4.10.bb
 create mode 100644 recipes/xorg-proto/inputproto-native_2.0.bb
 create mode 100644 recipes/xorg-proto/inputproto_2.0.bb
 create mode 100644 recipes/xorg-proto/randrproto_1.3.1.bb
 create mode 100644 recipes/xorg-proto/recordproto_1.14.bb
 create mode 100644 recipes/xorg-proto/renderproto-native_0.11.bb
 create mode 100644 recipes/xorg-proto/renderproto_0.11.bb
 create mode 100644 recipes/xorg-proto/resourceproto_1.1.0.bb
 create mode 100644 recipes/xorg-proto/scrnsaverproto_1.2.0.bb
 create mode 100644 recipes/xorg-proto/videoproto_2.3.0.bb
 create mode 100644 recipes/xorg-proto/windowswmproto_1.0.4.bb
 create mode 100644 recipes/xorg-proto/xcmiscproto-native_1.2.0.bb
 create mode 100644 recipes/xorg-proto/xcmiscproto_1.2.0.bb
 create mode 100644 recipes/xorg-proto/xextproto-native_7.1.1.bb
 create mode 100644 recipes/xorg-proto/xextproto_7.1.1.bb
 create mode 100644 recipes/xorg-proto/xf86bigfontproto-native_1.2.0.bb
 create mode 100644 recipes/xorg-proto/xf86bigfontproto_1.2.0.bb
 create mode 100644 recipes/xorg-proto/xf86dgaproto_2.1.bb
 create mode 100644 recipes/xorg-proto/xf86driproto_2.1.0.bb
 create mode 100644 recipes/xorg-proto/xf86vidmodeproto_2.3.bb
 create mode 100644 recipes/xorg-proto/xineramaproto_1.2.bb
 create mode 100644 recipes/xorg-proto/xproto-native_7.0.16.bb
 create mode 100644 recipes/xorg-proto/xproto_7.0.16.bb
 create mode 100644 recipes/xorg-util/util-macros-native_1.3.0.bb
 create mode 100644 recipes/xorg-util/util-macros_1.3.0.bb
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.0/randr-support-1.7.0.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg_1.7.0.bb

diff --git a/conf/distro/include/preferred-xorg-versions-live.inc b/conf/distro/include/preferred-xorg-versions-live.inc
new file mode 100644
index 0000000..95906cd
--- /dev/null
+++ b/conf/distro/include/preferred-xorg-versions-live.inc
@@ -0,0 +1,637 @@
+#Fri Oct  9 13:22:53 CEST 2009
+PREFERRED_VERSION_appres ?= "1.0.2"
+PREFERRED_VERSION_appres-native ?= "1.0.2"
+PREFERRED_VERSION_bdftopcf ?= "1.0.2"
+PREFERRED_VERSION_bdftopcf-native ?= "1.0.2"
+PREFERRED_VERSION_beforelight ?= "1.0.3"
+PREFERRED_VERSION_beforelight-native ?= "1.0.3"
+PREFERRED_VERSION_bitmap ?= "1.0.4"
+PREFERRED_VERSION_bitmap-native ?= "1.0.4"
+PREFERRED_VERSION_compiz ?= "0.5.0"
+PREFERRED_VERSION_compiz-native ?= "0.5.0"
+PREFERRED_VERSION_constype ?= "1.0.2"
+PREFERRED_VERSION_constype-native ?= "1.0.2"
+PREFERRED_VERSION_editres ?= "1.0.4"
+PREFERRED_VERSION_editres-native ?= "1.0.4"
+PREFERRED_VERSION_fonttosfnt ?= "1.0.4"
+PREFERRED_VERSION_fonttosfnt-native ?= "1.0.4"
+PREFERRED_VERSION_fslsfonts ?= "1.0.2"
+PREFERRED_VERSION_fslsfonts-native ?= "1.0.2"
+PREFERRED_VERSION_fstobdf ?= "1.0.3"
+PREFERRED_VERSION_fstobdf-native ?= "1.0.3"
+PREFERRED_VERSION_grandr ?= "0.1"
+PREFERRED_VERSION_grandr-native ?= "0.1"
+PREFERRED_VERSION_iceauth ?= "1.0.2"
+PREFERRED_VERSION_iceauth-native ?= "1.0.2"
+PREFERRED_VERSION_ico ?= "1.0.2"
+PREFERRED_VERSION_ico-native ?= "1.0.2"
+PREFERRED_VERSION_intel-gpu-tools ?= "1.0.2"
+PREFERRED_VERSION_intel-gpu-tools-native ?= "1.0.2"
+PREFERRED_VERSION_lbxproxy ?= "1.0.1"
+PREFERRED_VERSION_lbxproxy-native ?= "1.0.1"
+PREFERRED_VERSION_listres ?= "1.0.1"
+PREFERRED_VERSION_listres-native ?= "1.0.1"
+PREFERRED_VERSION_luit ?= "1.0.4"
+PREFERRED_VERSION_luit-native ?= "1.0.4"
+PREFERRED_VERSION_mkcfm ?= "1.0.1"
+PREFERRED_VERSION_mkcfm-native ?= "1.0.1"
+PREFERRED_VERSION_mkcomposecache ?= "1.2.1"
+PREFERRED_VERSION_mkcomposecache-native ?= "1.2.1"
+PREFERRED_VERSION_mkfontdir ?= "1.0.4"
+PREFERRED_VERSION_mkfontdir-native ?= "1.0.4"
+PREFERRED_VERSION_mkfontscale ?= "1.0.6"
+PREFERRED_VERSION_mkfontscale-native ?= "1.0.6"
+PREFERRED_VERSION_oclock ?= "1.0.1"
+PREFERRED_VERSION_oclock-native ?= "1.0.1"
+PREFERRED_VERSION_proxymngr ?= "1.0.1"
+PREFERRED_VERSION_proxymngr-native ?= "1.0.1"
+PREFERRED_VERSION_rendercheck ?= "1.3"
+PREFERRED_VERSION_rendercheck-native ?= "1.3"
+PREFERRED_VERSION_rgb ?= "1.0.3"
+PREFERRED_VERSION_rgb-native ?= "1.0.3"
+PREFERRED_VERSION_rstart ?= "1.0.3"
+PREFERRED_VERSION_rstart-native ?= "1.0.3"
+PREFERRED_VERSION_scripts ?= "1.0.1"
+PREFERRED_VERSION_scripts-native ?= "1.0.1"
+PREFERRED_VERSION_sessreg ?= "1.0.4"
+PREFERRED_VERSION_sessreg-native ?= "1.0.4"
+PREFERRED_VERSION_setxkbmap ?= "1.1.0"
+PREFERRED_VERSION_setxkbmap-native ?= "1.1.0"
+PREFERRED_VERSION_showfont ?= "1.0.2"
+PREFERRED_VERSION_showfont-native ?= "1.0.2"
+PREFERRED_VERSION_smproxy ?= "1.0.2"
+PREFERRED_VERSION_smproxy-native ?= "1.0.2"
+PREFERRED_VERSION_twm ?= "1.0.4"
+PREFERRED_VERSION_twm-native ?= "1.0.4"
+PREFERRED_VERSION_viewres ?= "1.0.1"
+PREFERRED_VERSION_viewres-native ?= "1.0.1"
+PREFERRED_VERSION_x11perf ?= "1.5"
+PREFERRED_VERSION_x11perf-native ?= "1.5"
+PREFERRED_VERSION_xauth ?= "1.0.4"
+PREFERRED_VERSION_xauth-native ?= "1.0.4"
+PREFERRED_VERSION_xbacklight ?= "1.1.1"
+PREFERRED_VERSION_xbacklight-native ?= "1.1.1"
+PREFERRED_VERSION_xbiff ?= "1.0.1"
+PREFERRED_VERSION_xbiff-native ?= "1.0.1"
+PREFERRED_VERSION_xcalc ?= "1.0.2"
+PREFERRED_VERSION_xcalc-native ?= "1.0.2"
+PREFERRED_VERSION_xclipboard ?= "1.0.1"
+PREFERRED_VERSION_xclipboard-native ?= "1.0.1"
+PREFERRED_VERSION_xclock ?= "1.0.4"
+PREFERRED_VERSION_xclock-native ?= "1.0.4"
+PREFERRED_VERSION_xcmsdb ?= "1.0.1"
+PREFERRED_VERSION_xcmsdb-native ?= "1.0.1"
+PREFERRED_VERSION_xcompmgr ?= "1.1.4"
+PREFERRED_VERSION_xcompmgr-native ?= "1.1.4"
+PREFERRED_VERSION_xconsole ?= "1.0.3"
+PREFERRED_VERSION_xconsole-native ?= "1.0.3"
+PREFERRED_VERSION_xcursorgen ?= "1.0.2"
+PREFERRED_VERSION_xcursorgen-native ?= "1.0.2"
+PREFERRED_VERSION_xdbedizzy ?= "1.0.2"
+PREFERRED_VERSION_xdbedizzy-native ?= "1.0.2"
+PREFERRED_VERSION_xditview ?= "1.0.1"
+PREFERRED_VERSION_xditview-native ?= "1.0.1"
+PREFERRED_VERSION_xdm ?= "1.1.9"
+PREFERRED_VERSION_xdm-native ?= "1.1.9"
+PREFERRED_VERSION_xdpyinfo ?= "1.0.3"
+PREFERRED_VERSION_xdpyinfo-native ?= "1.0.3"
+PREFERRED_VERSION_xdriinfo ?= "1.0.2"
+PREFERRED_VERSION_xdriinfo-native ?= "1.0.2"
+PREFERRED_VERSION_xedit ?= "1.1.2"
+PREFERRED_VERSION_xedit-native ?= "1.1.2"
+PREFERRED_VERSION_xev ?= "1.0.3"
+PREFERRED_VERSION_xev-native ?= "1.0.3"
+PREFERRED_VERSION_xeyes ?= "1.0.991"
+PREFERRED_VERSION_xeyes-native ?= "1.0.991"
+PREFERRED_VERSION_xf86dga ?= "1.0.2"
+PREFERRED_VERSION_xf86dga-native ?= "1.0.2"
+PREFERRED_VERSION_xfd ?= "1.0.1"
+PREFERRED_VERSION_xfd-native ?= "1.0.1"
+PREFERRED_VERSION_xfindproxy ?= "1.0.1"
+PREFERRED_VERSION_xfindproxy-native ?= "1.0.1"
+PREFERRED_VERSION_xfontsel ?= "1.0.2"
+PREFERRED_VERSION_xfontsel-native ?= "1.0.2"
+PREFERRED_VERSION_xfs ?= "1.1.0"
+PREFERRED_VERSION_xfs-native ?= "1.1.0"
+PREFERRED_VERSION_xfsinfo ?= "1.0.2"
+PREFERRED_VERSION_xfsinfo-native ?= "1.0.2"
+PREFERRED_VERSION_xfwp ?= "1.0.1"
+PREFERRED_VERSION_xfwp-native ?= "1.0.1"
+PREFERRED_VERSION_xgamma ?= "1.0.2"
+PREFERRED_VERSION_xgamma-native ?= "1.0.2"
+PREFERRED_VERSION_xgc ?= "1.0.1"
+PREFERRED_VERSION_xgc-native ?= "1.0.1"
+PREFERRED_VERSION_xhost ?= "1.0.2"
+PREFERRED_VERSION_xhost-native ?= "1.0.2"
+PREFERRED_VERSION_xinit ?= "1.1.1"
+PREFERRED_VERSION_xinit-native ?= "1.1.1"
+PREFERRED_VERSION_xinput ?= "1.4.99.3"
+PREFERRED_VERSION_xinput-native ?= "1.4.99.3"
+PREFERRED_VERSION_xkbcomp ?= "1.1.1"
+PREFERRED_VERSION_xkbcomp-native ?= "1.1.1"
+PREFERRED_VERSION_xkbevd ?= "1.0.2"
+PREFERRED_VERSION_xkbevd-native ?= "1.0.2"
+PREFERRED_VERSION_xkbprint ?= "1.0.1"
+PREFERRED_VERSION_xkbprint-native ?= "1.0.1"
+PREFERRED_VERSION_xkbutils ?= "1.0.1"
+PREFERRED_VERSION_xkbutils-native ?= "1.0.1"
+PREFERRED_VERSION_xkill ?= "1.0.1"
+PREFERRED_VERSION_xkill-native ?= "1.0.1"
+PREFERRED_VERSION_xload ?= "1.0.2"
+PREFERRED_VERSION_xload-native ?= "1.0.2"
+PREFERRED_VERSION_xlogo ?= "1.0.1"
+PREFERRED_VERSION_xlogo-native ?= "1.0.1"
+PREFERRED_VERSION_xlsatoms ?= "1.0.1"
+PREFERRED_VERSION_xlsatoms-native ?= "1.0.1"
+PREFERRED_VERSION_xlsclients ?= "1.0.1"
+PREFERRED_VERSION_xlsclients-native ?= "1.0.1"
+PREFERRED_VERSION_xlsfonts ?= "1.0.2"
+PREFERRED_VERSION_xlsfonts-native ?= "1.0.2"
+PREFERRED_VERSION_xmag ?= "1.0.3"
+PREFERRED_VERSION_xmag-native ?= "1.0.3"
+PREFERRED_VERSION_xman ?= "1.0.3"
+PREFERRED_VERSION_xman-native ?= "1.0.3"
+PREFERRED_VERSION_xmessage ?= "1.0.2"
+PREFERRED_VERSION_xmessage-native ?= "1.0.2"
+PREFERRED_VERSION_xmh ?= "1.0.1"
+PREFERRED_VERSION_xmh-native ?= "1.0.1"
+PREFERRED_VERSION_xmodmap ?= "1.0.4"
+PREFERRED_VERSION_xmodmap-native ?= "1.0.4"
+PREFERRED_VERSION_xmore ?= "1.0.1"
+PREFERRED_VERSION_xmore-native ?= "1.0.1"
+PREFERRED_VERSION_xphelloworld ?= "1.0.1"
+PREFERRED_VERSION_xphelloworld-native ?= "1.0.1"
+PREFERRED_VERSION_xplsprinters ?= "1.0.1"
+PREFERRED_VERSION_xplsprinters-native ?= "1.0.1"
+PREFERRED_VERSION_xpr ?= "1.0.2"
+PREFERRED_VERSION_xpr-native ?= "1.0.2"
+PREFERRED_VERSION_xprehashprinterlist ?= "1.0.1"
+PREFERRED_VERSION_xprehashprinterlist-native ?= "1.0.1"
+PREFERRED_VERSION_xprop ?= "1.0.4"
+PREFERRED_VERSION_xprop-native ?= "1.0.4"
+PREFERRED_VERSION_xrandr ?= "1.3.2"
+PREFERRED_VERSION_xrandr-native ?= "1.3.2"
+PREFERRED_VERSION_xrdb ?= "1.0.5"
+PREFERRED_VERSION_xrdb-native ?= "1.0.5"
+PREFERRED_VERSION_xrefresh ?= "1.0.2"
+PREFERRED_VERSION_xrefresh-native ?= "1.0.2"
+PREFERRED_VERSION_xrx ?= "1.0.3"
+PREFERRED_VERSION_xrx-native ?= "1.0.3"
+PREFERRED_VERSION_xscope ?= "1.2"
+PREFERRED_VERSION_xscope-native ?= "1.2"
+PREFERRED_VERSION_xset ?= "1.1.0"
+PREFERRED_VERSION_xset-native ?= "1.1.0"
+PREFERRED_VERSION_xsetmode ?= "1.0.0"
+PREFERRED_VERSION_xsetmode-native ?= "1.0.0"
+PREFERRED_VERSION_xsetpointer ?= "1.0.1"
+PREFERRED_VERSION_xsetpointer-native ?= "1.0.1"
+PREFERRED_VERSION_xsetroot ?= "1.0.2"
+PREFERRED_VERSION_xsetroot-native ?= "1.0.2"
+PREFERRED_VERSION_xsm ?= "1.0.1"
+PREFERRED_VERSION_xsm-native ?= "1.0.1"
+PREFERRED_VERSION_xstdcmap ?= "1.0.1"
+PREFERRED_VERSION_xstdcmap-native ?= "1.0.1"
+PREFERRED_VERSION_xtrap ?= "1.0.2"
+PREFERRED_VERSION_xtrap-native ?= "1.0.2"
+PREFERRED_VERSION_xvidtune ?= "1.0.1"
+PREFERRED_VERSION_xvidtune-native ?= "1.0.1"
+PREFERRED_VERSION_xvinfo ?= "1.0.2"
+PREFERRED_VERSION_xvinfo-native ?= "1.0.2"
+PREFERRED_VERSION_xwd ?= "1.0.2"
+PREFERRED_VERSION_xwd-native ?= "1.0.2"
+PREFERRED_VERSION_xwininfo ?= "1.0.4"
+PREFERRED_VERSION_xwininfo-native ?= "1.0.4"
+PREFERRED_VERSION_xwud ?= "1.0.1"
+PREFERRED_VERSION_xwud-native ?= "1.0.1"
+PREFERRED_VERSION_xbitmaps ?= "1.0.1"
+PREFERRED_VERSION_xbitmaps-native ?= "1.0.1"
+PREFERRED_VERSION_xcursor-themes ?= "1.0.2"
+PREFERRED_VERSION_xcursor-themes-native ?= "1.0.2"
+PREFERRED_VERSION_xkbdata ?= "1.0.1"
+PREFERRED_VERSION_xkbdata-native ?= "1.0.1"
+PREFERRED_VERSION_xkeyboard-config ?= "1.4"
+PREFERRED_VERSION_xkeyboard-config-native ?= "1.4"
+PREFERRED_VERSION_xorg-docs ?= "1.4.99.901"
+PREFERRED_VERSION_xorg-docs-native ?= "1.4.99.901"
+PREFERRED_VERSION_xorg-sgml-doctools ?= "1.2.99.901"
+PREFERRED_VERSION_xorg-sgml-doctools-native ?= "1.2.99.901"
+PREFERRED_VERSION_xf86-input-acecad ?= "1.4.0"
+PREFERRED_VERSION_xf86-input-acecad-native ?= "1.4.0"
+PREFERRED_VERSION_xf86-input-aiptek ?= "1.3.0"
+PREFERRED_VERSION_xf86-input-aiptek-native ?= "1.3.0"
+PREFERRED_VERSION_xf86-input-calcomp ?= "1.1.2"
+PREFERRED_VERSION_xf86-input-calcomp-native ?= "1.1.2"
+PREFERRED_VERSION_xf86-input-citron ?= "2.2.2"
+PREFERRED_VERSION_xf86-input-citron-native ?= "2.2.2"
+PREFERRED_VERSION_xf86-input-digitaledge ?= "1.1.1"
+PREFERRED_VERSION_xf86-input-digitaledge-native ?= "1.1.1"
+PREFERRED_VERSION_xf86-input-dmc ?= "1.1.2"
+PREFERRED_VERSION_xf86-input-dmc-native ?= "1.1.2"
+PREFERRED_VERSION_xf86-input-dynapro ?= "1.1.2"
+PREFERRED_VERSION_xf86-input-dynapro-native ?= "1.1.2"
+PREFERRED_VERSION_xf86-input-elo2300 ?= "1.1.2"
+PREFERRED_VERSION_xf86-input-elo2300-native ?= "1.1.2"
+PREFERRED_VERSION_xf86-input-elographics ?= "1.2.3"
+PREFERRED_VERSION_xf86-input-elographics-native ?= "1.2.3"
+PREFERRED_VERSION_xf86-input-evdev ?= "2.2.99.2"
+PREFERRED_VERSION_xf86-input-evdev-native ?= "2.2.99.2"
+PREFERRED_VERSION_xf86-input-fpit ?= "1.3.0"
+PREFERRED_VERSION_xf86-input-fpit-native ?= "1.3.0"
+PREFERRED_VERSION_xf86-input-hyperpen ?= "1.3.0"
+PREFERRED_VERSION_xf86-input-hyperpen-native ?= "1.3.0"
+PREFERRED_VERSION_xf86-input-jamstudio ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-jamstudio-native ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-joystick ?= "1.4.99.2"
+PREFERRED_VERSION_xf86-input-joystick-native ?= "1.4.99.2"
+PREFERRED_VERSION_xf86-input-keyboard ?= "1.4.0"
+PREFERRED_VERSION_xf86-input-keyboard-native ?= "1.4.0"
+PREFERRED_VERSION_xf86-input-magellan ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-magellan-native ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-magictouch ?= "1.0.0.5"
+PREFERRED_VERSION_xf86-input-magictouch-native ?= "1.0.0.5"
+PREFERRED_VERSION_xf86-input-microtouch ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-microtouch-native ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-mouse ?= "1.5.0"
+PREFERRED_VERSION_xf86-input-mouse-native ?= "1.5.0"
+PREFERRED_VERSION_xf86-input-mutouch ?= "1.2.1"
+PREFERRED_VERSION_xf86-input-mutouch-native ?= "1.2.1"
+PREFERRED_VERSION_xf86-input-palmax ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-palmax-native ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-penmount ?= "1.4.0"
+PREFERRED_VERSION_xf86-input-penmount-native ?= "1.4.0"
+PREFERRED_VERSION_xf86-input-spaceorb ?= "1.1.1"
+PREFERRED_VERSION_xf86-input-spaceorb-native ?= "1.1.1"
+PREFERRED_VERSION_xf86-input-summa ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-summa-native ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-synaptics ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-synaptics-native ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-tek4957 ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-tek4957-native ?= "1.2.0"
+PREFERRED_VERSION_xf86-input-ur98 ?= "1.1.0"
+PREFERRED_VERSION_xf86-input-ur98-native ?= "1.1.0"
+PREFERRED_VERSION_xf86-input-vmmouse ?= "12.6.5"
+PREFERRED_VERSION_xf86-input-vmmouse-native ?= "12.6.5"
+PREFERRED_VERSION_xf86-input-void ?= "1.3.0"
+PREFERRED_VERSION_xf86-input-void-native ?= "1.3.0"
+PREFERRED_VERSION_xf86-video-amd ?= "2.7.7.7"
+PREFERRED_VERSION_xf86-video-amd-native ?= "2.7.7.7"
+PREFERRED_VERSION_xf86-video-apm ?= "1.2.2"
+PREFERRED_VERSION_xf86-video-apm-native ?= "1.2.2"
+PREFERRED_VERSION_xf86-video-ark ?= "0.7.2"
+PREFERRED_VERSION_xf86-video-ark-native ?= "0.7.2"
+PREFERRED_VERSION_xf86-video-ast ?= "0.89.9"
+PREFERRED_VERSION_xf86-video-ast-native ?= "0.89.9"
+PREFERRED_VERSION_xf86-video-ati ?= "6.12.4"
+PREFERRED_VERSION_xf86-video-ati-native ?= "6.12.4"
+PREFERRED_VERSION_xf86-video-chips ?= "1.2.2"
+PREFERRED_VERSION_xf86-video-chips-native ?= "1.2.2"
+PREFERRED_VERSION_xf86-video-cirrus ?= "1.3.2"
+PREFERRED_VERSION_xf86-video-cirrus-native ?= "1.3.2"
+PREFERRED_VERSION_xf86-video-cyrix ?= "1.1.0"
+PREFERRED_VERSION_xf86-video-cyrix-native ?= "1.1.0"
+PREFERRED_VERSION_xf86-video-dummy ?= "0.3.2"
+PREFERRED_VERSION_xf86-video-dummy-native ?= "0.3.2"
+PREFERRED_VERSION_xf86-video-fbdev ?= "0.4.1"
+PREFERRED_VERSION_xf86-video-fbdev-native ?= "0.4.1"
+PREFERRED_VERSION_xf86-video-geode ?= "2.11.6"
+PREFERRED_VERSION_xf86-video-geode-native ?= "2.11.6"
+PREFERRED_VERSION_xf86-video-glide ?= "1.0.3"
+PREFERRED_VERSION_xf86-video-glide-native ?= "1.0.3"
+PREFERRED_VERSION_xf86-video-glint ?= "1.2.4"
+PREFERRED_VERSION_xf86-video-glint-native ?= "1.2.4"
+PREFERRED_VERSION_xf86-video-i128 ?= "1.3.3"
+PREFERRED_VERSION_xf86-video-i128-native ?= "1.3.3"
+PREFERRED_VERSION_xf86-video-i740 ?= "1.3.2"
+PREFERRED_VERSION_xf86-video-i740-native ?= "1.3.2"
+PREFERRED_VERSION_xf86-video-i810 ?= "1.7.4"
+PREFERRED_VERSION_xf86-video-i810-native ?= "1.7.4"
+PREFERRED_VERSION_xf86-video-impact ?= "0.2.0"
+PREFERRED_VERSION_xf86-video-impact-native ?= "0.2.0"
+PREFERRED_VERSION_xf86-video-imstt ?= "1.1.0"
+PREFERRED_VERSION_xf86-video-imstt-native ?= "1.1.0"
+PREFERRED_VERSION_xf86-video-intel ?= "2.9.0"
+PREFERRED_VERSION_xf86-video-intel-native ?= "2.9.0"
+PREFERRED_VERSION_xf86-video-mach64 ?= "6.8.2"
+PREFERRED_VERSION_xf86-video-mach64-native ?= "6.8.2"
+PREFERRED_VERSION_xf86-video-mga ?= "1.9.100"
+PREFERRED_VERSION_xf86-video-mga-native ?= "1.9.100"
+PREFERRED_VERSION_xf86-video-neomagic ?= "1.2.4"
+PREFERRED_VERSION_xf86-video-neomagic-native ?= "1.2.4"
+PREFERRED_VERSION_xf86-video-newport ?= "0.2.3"
+PREFERRED_VERSION_xf86-video-newport-native ?= "0.2.3"
+PREFERRED_VERSION_xf86-video-nsc ?= "2.8.3"
+PREFERRED_VERSION_xf86-video-nsc-native ?= "2.8.3"
+PREFERRED_VERSION_xf86-video-nv ?= "2.1.15"
+PREFERRED_VERSION_xf86-video-nv-native ?= "2.1.15"
+PREFERRED_VERSION_xf86-video-openchrome ?= "0.2.904"
+PREFERRED_VERSION_xf86-video-openchrome-native ?= "0.2.904"
+PREFERRED_VERSION_xf86-video-r128 ?= "6.8.1"
+PREFERRED_VERSION_xf86-video-r128-native ?= "6.8.1"
+PREFERRED_VERSION_xf86-video-radeonhd ?= "1.2.5"
+PREFERRED_VERSION_xf86-video-radeonhd-native ?= "1.2.5"
+PREFERRED_VERSION_xf86-video-rendition ?= "4.2.3"
+PREFERRED_VERSION_xf86-video-rendition-native ?= "4.2.3"
+PREFERRED_VERSION_xf86-video-s3 ?= "0.6.3"
+PREFERRED_VERSION_xf86-video-s3-native ?= "0.6.3"
+PREFERRED_VERSION_xf86-video-s3virge ?= "1.10.4"
+PREFERRED_VERSION_xf86-video-s3virge-native ?= "1.10.4"
+PREFERRED_VERSION_xf86-video-savage ?= "2.3.1"
+PREFERRED_VERSION_xf86-video-savage-native ?= "2.3.1"
+PREFERRED_VERSION_xf86-video-siliconmotion ?= "1.7.3"
+PREFERRED_VERSION_xf86-video-siliconmotion-native ?= "1.7.3"
+PREFERRED_VERSION_xf86-video-sis ?= "0.10.2"
+PREFERRED_VERSION_xf86-video-sis-native ?= "0.10.2"
+PREFERRED_VERSION_xf86-video-sisusb ?= "0.9.3"
+PREFERRED_VERSION_xf86-video-sisusb-native ?= "0.9.3"
+PREFERRED_VERSION_xf86-video-sunbw2 ?= "1.1.0"
+PREFERRED_VERSION_xf86-video-sunbw2-native ?= "1.1.0"
+PREFERRED_VERSION_xf86-video-suncg14 ?= "1.1.1"
+PREFERRED_VERSION_xf86-video-suncg14-native ?= "1.1.1"
+PREFERRED_VERSION_xf86-video-suncg3 ?= "1.1.1"
+PREFERRED_VERSION_xf86-video-suncg3-native ?= "1.1.1"
+PREFERRED_VERSION_xf86-video-suncg6 ?= "1.1.1"
+PREFERRED_VERSION_xf86-video-suncg6-native ?= "1.1.1"
+PREFERRED_VERSION_xf86-video-sunffb ?= "1.2.1"
+PREFERRED_VERSION_xf86-video-sunffb-native ?= "1.2.1"
+PREFERRED_VERSION_xf86-video-sunleo ?= "1.2.0"
+PREFERRED_VERSION_xf86-video-sunleo-native ?= "1.2.0"
+PREFERRED_VERSION_xf86-video-suntcx ?= "1.1.1"
+PREFERRED_VERSION_xf86-video-suntcx-native ?= "1.1.1"
+PREFERRED_VERSION_xf86-video-tdfx ?= "1.4.3"
+PREFERRED_VERSION_xf86-video-tdfx-native ?= "1.4.3"
+PREFERRED_VERSION_xf86-video-tga ?= "1.2.1"
+PREFERRED_VERSION_xf86-video-tga-native ?= "1.2.1"
+PREFERRED_VERSION_xf86-video-trident ?= "1.3.3"
+PREFERRED_VERSION_xf86-video-trident-native ?= "1.3.3"
+PREFERRED_VERSION_xf86-video-tseng ?= "1.2.3"
+PREFERRED_VERSION_xf86-video-tseng-native ?= "1.2.3"
+PREFERRED_VERSION_xf86-video-v4l ?= "0.2.0"
+PREFERRED_VERSION_xf86-video-v4l-native ?= "0.2.0"
+PREFERRED_VERSION_xf86-video-vermilion ?= "1.0.1"
+PREFERRED_VERSION_xf86-video-vermilion-native ?= "1.0.1"
+PREFERRED_VERSION_xf86-video-vesa ?= "2.2.1"
+PREFERRED_VERSION_xf86-video-vesa-native ?= "2.2.1"
+PREFERRED_VERSION_xf86-video-vga ?= "4.1.0"
+PREFERRED_VERSION_xf86-video-vga-native ?= "4.1.0"
+PREFERRED_VERSION_xf86-video-via ?= "0.2.2"
+PREFERRED_VERSION_xf86-video-via-native ?= "0.2.2"
+PREFERRED_VERSION_xf86-video-vmware ?= "10.16.8"
+PREFERRED_VERSION_xf86-video-vmware-native ?= "10.16.8"
+PREFERRED_VERSION_xf86-video-voodoo ?= "1.2.3"
+PREFERRED_VERSION_xf86-video-voodoo-native ?= "1.2.3"
+PREFERRED_VERSION_xf86-video-wsfb ?= "0.3.0"
+PREFERRED_VERSION_xf86-video-wsfb-native ?= "0.3.0"
+PREFERRED_VERSION_xf86-video-xgi ?= "1.5.1"
+PREFERRED_VERSION_xf86-video-xgi-native ?= "1.5.1"
+PREFERRED_VERSION_xf86-video-xgixp ?= "1.7.99.4"
+PREFERRED_VERSION_xf86-video-xgixp-native ?= "1.7.99.4"
+PREFERRED_VERSION_encodings ?= "1.0.2"
+PREFERRED_VERSION_encodings-native ?= "1.0.2"
+PREFERRED_VERSION_font-adobe-100dpi ?= "1.0.0"
+PREFERRED_VERSION_font-adobe-100dpi-native ?= "1.0.0"
+PREFERRED_VERSION_font-adobe-75dpi ?= "1.0.0"
+PREFERRED_VERSION_font-adobe-75dpi-native ?= "1.0.0"
+PREFERRED_VERSION_font-adobe-utopia-100dpi ?= "1.0.1"
+PREFERRED_VERSION_font-adobe-utopia-100dpi-native ?= "1.0.1"
+PREFERRED_VERSION_font-adobe-utopia-75dpi ?= "1.0.1"
+PREFERRED_VERSION_font-adobe-utopia-75dpi-native ?= "1.0.1"
+PREFERRED_VERSION_font-adobe-utopia-type1 ?= "1.0.1"
+PREFERRED_VERSION_font-adobe-utopia-type1-native ?= "1.0.1"
+PREFERRED_VERSION_font-alias ?= "1.0.1"
+PREFERRED_VERSION_font-alias-native ?= "1.0.1"
+PREFERRED_VERSION_font-arabic-misc ?= "1.0.0"
+PREFERRED_VERSION_font-arabic-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-bh-100dpi ?= "1.0.0"
+PREFERRED_VERSION_font-bh-100dpi-native ?= "1.0.0"
+PREFERRED_VERSION_font-bh-75dpi ?= "1.0.0"
+PREFERRED_VERSION_font-bh-75dpi-native ?= "1.0.0"
+PREFERRED_VERSION_font-bh-lucidatypewriter-100dpi ?= "1.0.0"
+PREFERRED_VERSION_font-bh-lucidatypewriter-100dpi-native ?= "1.0.0"
+PREFERRED_VERSION_font-bh-lucidatypewriter-75dpi ?= "1.0.0"
+PREFERRED_VERSION_font-bh-lucidatypewriter-75dpi-native ?= "1.0.0"
+PREFERRED_VERSION_font-bh-ttf ?= "1.0.0"
+PREFERRED_VERSION_font-bh-ttf-native ?= "1.0.0"
+PREFERRED_VERSION_font-bh-type1 ?= "1.0.0"
+PREFERRED_VERSION_font-bh-type1-native ?= "1.0.0"
+PREFERRED_VERSION_font-bitstream-100dpi ?= "1.0.0"
+PREFERRED_VERSION_font-bitstream-100dpi-native ?= "1.0.0"
+PREFERRED_VERSION_font-bitstream-75dpi ?= "1.0.0"
+PREFERRED_VERSION_font-bitstream-75dpi-native ?= "1.0.0"
+PREFERRED_VERSION_font-bitstream-speedo ?= "1.0.0"
+PREFERRED_VERSION_font-bitstream-speedo-native ?= "1.0.0"
+PREFERRED_VERSION_font-bitstream-type1 ?= "1.0.0"
+PREFERRED_VERSION_font-bitstream-type1-native ?= "1.0.0"
+PREFERRED_VERSION_font-cronyx-cyrillic ?= "1.0.0"
+PREFERRED_VERSION_font-cronyx-cyrillic-native ?= "1.0.0"
+PREFERRED_VERSION_font-cursor-misc ?= "1.0.0"
+PREFERRED_VERSION_font-cursor-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-daewoo-misc ?= "1.0.0"
+PREFERRED_VERSION_font-daewoo-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-dec-misc ?= "1.0.0"
+PREFERRED_VERSION_font-dec-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-ibm-type1 ?= "1.0.0"
+PREFERRED_VERSION_font-ibm-type1-native ?= "1.0.0"
+PREFERRED_VERSION_font-isas-misc ?= "1.0.0"
+PREFERRED_VERSION_font-isas-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-jis-misc ?= "1.0.0"
+PREFERRED_VERSION_font-jis-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-micro-misc ?= "1.0.0"
+PREFERRED_VERSION_font-micro-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-misc-cyrillic ?= "1.0.0"
+PREFERRED_VERSION_font-misc-cyrillic-native ?= "1.0.0"
+PREFERRED_VERSION_font-misc-ethiopic ?= "1.0.0"
+PREFERRED_VERSION_font-misc-ethiopic-native ?= "1.0.0"
+PREFERRED_VERSION_font-misc-meltho ?= "1.0.0"
+PREFERRED_VERSION_font-misc-meltho-native ?= "1.0.0"
+PREFERRED_VERSION_font-misc-misc ?= "1.0.0"
+PREFERRED_VERSION_font-misc-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-mutt-misc ?= "1.0.0"
+PREFERRED_VERSION_font-mutt-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-schumacher-misc ?= "1.0.0"
+PREFERRED_VERSION_font-schumacher-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-screen-cyrillic ?= "1.0.1"
+PREFERRED_VERSION_font-screen-cyrillic-native ?= "1.0.1"
+PREFERRED_VERSION_font-sony-misc ?= "1.0.0"
+PREFERRED_VERSION_font-sony-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-sun-misc ?= "1.0.0"
+PREFERRED_VERSION_font-sun-misc-native ?= "1.0.0"
+PREFERRED_VERSION_font-util ?= "1.0.2"
+PREFERRED_VERSION_font-util-native ?= "1.0.2"
+PREFERRED_VERSION_font-winitzki-cyrillic ?= "1.0.0"
+PREFERRED_VERSION_font-winitzki-cyrillic-native ?= "1.0.0"
+PREFERRED_VERSION_font-xfree86-type1 ?= "1.0.1"
+PREFERRED_VERSION_font-xfree86-type1-native ?= "1.0.1"
+PREFERRED_VERSION_libapplewm ?= "1.4.0"
+PREFERRED_VERSION_libapplewm-native ?= "1.4.0"
+PREFERRED_VERSION_libdmx ?= "1.1.0"
+PREFERRED_VERSION_libdmx-native ?= "1.1.0"
+PREFERRED_VERSION_libfontenc ?= "1.0.5"
+PREFERRED_VERSION_libfontenc-native ?= "1.0.5"
+PREFERRED_VERSION_libfs ?= "1.0.2"
+PREFERRED_VERSION_libfs-native ?= "1.0.2"
+PREFERRED_VERSION_libice ?= "1.0.6"
+PREFERRED_VERSION_libice-native ?= "1.0.6"
+PREFERRED_VERSION_liblbxutil ?= "1.0.1"
+PREFERRED_VERSION_liblbxutil-native ?= "1.0.1"
+PREFERRED_VERSION_liboldx ?= "1.0.1"
+PREFERRED_VERSION_liboldx-native ?= "1.0.1"
+PREFERRED_VERSION_libpciaccess ?= "0.10.9"
+PREFERRED_VERSION_libpciaccess-native ?= "0.10.9"
+PREFERRED_VERSION_libpthread-stubs ?= "0.1"
+PREFERRED_VERSION_libpthread-stubs-native ?= "0.1"
+PREFERRED_VERSION_libsm ?= "1.1.1"
+PREFERRED_VERSION_libsm-native ?= "1.1.1"
+PREFERRED_VERSION_libwindowswm ?= "1.0.1"
+PREFERRED_VERSION_libwindowswm-native ?= "1.0.1"
+PREFERRED_VERSION_libx11 ?= "1.3"
+PREFERRED_VERSION_libx11-native ?= "1.3"
+PREFERRED_VERSION_libxau ?= "1.0.5"
+PREFERRED_VERSION_libxau-native ?= "1.0.5"
+PREFERRED_VERSION_libxaw ?= "1.0.6"
+PREFERRED_VERSION_libxaw-native ?= "1.0.6"
+PREFERRED_VERSION_libxcomposite ?= "0.4.1"
+PREFERRED_VERSION_libxcomposite-native ?= "0.4.1"
+PREFERRED_VERSION_libxcursor ?= "1.1.10"
+PREFERRED_VERSION_libxcursor-native ?= "1.1.10"
+PREFERRED_VERSION_libxdamage ?= "1.1.2"
+PREFERRED_VERSION_libxdamage-native ?= "1.1.2"
+PREFERRED_VERSION_libxdmcp ?= "1.0.3"
+PREFERRED_VERSION_libxdmcp-native ?= "1.0.3"
+PREFERRED_VERSION_libxevie ?= "1.0.2"
+PREFERRED_VERSION_libxevie-native ?= "1.0.2"
+PREFERRED_VERSION_libxext ?= "1.1"
+PREFERRED_VERSION_libxext-native ?= "1.1"
+PREFERRED_VERSION_libxfixes ?= "4.0.4"
+PREFERRED_VERSION_libxfixes-native ?= "4.0.4"
+PREFERRED_VERSION_libxfont ?= "1.4.0"
+PREFERRED_VERSION_libxfont-native ?= "1.4.0"
+PREFERRED_VERSION_libxfontcache ?= "1.0.5"
+PREFERRED_VERSION_libxfontcache-native ?= "1.0.5"
+PREFERRED_VERSION_libxft ?= "2.1.13"
+PREFERRED_VERSION_libxft-native ?= "2.1.13"
+PREFERRED_VERSION_libxi ?= "1.3"
+PREFERRED_VERSION_libxi-native ?= "1.3"
+PREFERRED_VERSION_libxinerama ?= "1.1"
+PREFERRED_VERSION_libxinerama-native ?= "1.1"
+PREFERRED_VERSION_libxkbfile ?= "1.0.6"
+PREFERRED_VERSION_libxkbfile-native ?= "1.0.6"
+PREFERRED_VERSION_libxkbui ?= "1.0.2"
+PREFERRED_VERSION_libxkbui-native ?= "1.0.2"
+PREFERRED_VERSION_libxmu ?= "1.0.5"
+PREFERRED_VERSION_libxmu-native ?= "1.0.5"
+PREFERRED_VERSION_libxp ?= "1.0.0"
+PREFERRED_VERSION_libxp-native ?= "1.0.0"
+PREFERRED_VERSION_libxpm ?= "3.5.7"
+PREFERRED_VERSION_libxpm-native ?= "3.5.7"
+PREFERRED_VERSION_libxprintapputil ?= "1.0.1"
+PREFERRED_VERSION_libxprintapputil-native ?= "1.0.1"
+PREFERRED_VERSION_libxprintutil ?= "1.0.1"
+PREFERRED_VERSION_libxprintutil-native ?= "1.0.1"
+PREFERRED_VERSION_libxrandr ?= "1.3.0"
+PREFERRED_VERSION_libxrandr-native ?= "1.3.0"
+PREFERRED_VERSION_libxrender ?= "0.9.5"
+PREFERRED_VERSION_libxrender-native ?= "0.9.5"
+PREFERRED_VERSION_libxres ?= "1.0.3"
+PREFERRED_VERSION_libxres-native ?= "1.0.3"
+PREFERRED_VERSION_libxscrnsaver ?= "1.2.0"
+PREFERRED_VERSION_libxscrnsaver-native ?= "1.2.0"
+PREFERRED_VERSION_libxt ?= "1.0.7"
+PREFERRED_VERSION_libxt-native ?= "1.0.7"
+PREFERRED_VERSION_libxtrap ?= "1.0.0"
+PREFERRED_VERSION_libxtrap-native ?= "1.0.0"
+PREFERRED_VERSION_libxtst ?= "1.1.0"
+PREFERRED_VERSION_libxtst-native ?= "1.1.0"
+PREFERRED_VERSION_libxv ?= "1.0.5"
+PREFERRED_VERSION_libxv-native ?= "1.0.5"
+PREFERRED_VERSION_libxvmc ?= "1.0.5"
+PREFERRED_VERSION_libxvmc-native ?= "1.0.5"
+PREFERRED_VERSION_libxxf86dga ?= "1.1.1"
+PREFERRED_VERSION_libxxf86dga-native ?= "1.1.1"
+PREFERRED_VERSION_libxxf86misc ?= "1.0.2"
+PREFERRED_VERSION_libxxf86misc-native ?= "1.0.2"
+PREFERRED_VERSION_libxxf86vm ?= "1.1.0"
+PREFERRED_VERSION_libxxf86vm-native ?= "1.1.0"
+PREFERRED_VERSION_pixman ?= "0.16.2"
+PREFERRED_VERSION_pixman-native ?= "0.16.2"
+PREFERRED_VERSION_xtrans ?= "1.2.4"
+PREFERRED_VERSION_xtrans-native ?= "1.2.4"
+PREFERRED_VERSION_applewmproto ?= "1.4.1"
+PREFERRED_VERSION_applewmproto-native ?= "1.4.1"
+PREFERRED_VERSION_bigreqsproto ?= "1.1.0"
+PREFERRED_VERSION_bigreqsproto-native ?= "1.1.0"
+PREFERRED_VERSION_compositeproto ?= "0.4.1"
+PREFERRED_VERSION_compositeproto-native ?= "0.4.1"
+PREFERRED_VERSION_damageproto ?= "1.2.0"
+PREFERRED_VERSION_damageproto-native ?= "1.2.0"
+PREFERRED_VERSION_dmxproto ?= "2.3"
+PREFERRED_VERSION_dmxproto-native ?= "2.3"
+PREFERRED_VERSION_dri2proto ?= "2.1"
+PREFERRED_VERSION_dri2proto-native ?= "2.1"
+PREFERRED_VERSION_evieext ?= "1.1.0"
+PREFERRED_VERSION_evieext-native ?= "1.1.0"
+PREFERRED_VERSION_fixesproto ?= "4.1.1"
+PREFERRED_VERSION_fixesproto-native ?= "4.1.1"
+PREFERRED_VERSION_fontcacheproto ?= "0.1.3"
+PREFERRED_VERSION_fontcacheproto-native ?= "0.1.3"
+PREFERRED_VERSION_fontsproto ?= "2.1.0"
+PREFERRED_VERSION_fontsproto-native ?= "2.1.0"
+PREFERRED_VERSION_glproto ?= "1.4.10"
+PREFERRED_VERSION_glproto-native ?= "1.4.10"
+PREFERRED_VERSION_inputproto ?= "2.0"
+PREFERRED_VERSION_inputproto-native ?= "2.0"
+PREFERRED_VERSION_kbproto ?= "1.0.3"
+PREFERRED_VERSION_kbproto-native ?= "1.0.3"
+PREFERRED_VERSION_printproto ?= "1.0.4"
+PREFERRED_VERSION_printproto-native ?= "1.0.4"
+PREFERRED_VERSION_randrproto ?= "1.3.1"
+PREFERRED_VERSION_randrproto-native ?= "1.3.1"
+PREFERRED_VERSION_recordproto ?= "1.14"
+PREFERRED_VERSION_recordproto-native ?= "1.14"
+PREFERRED_VERSION_renderproto ?= "0.11"
+PREFERRED_VERSION_renderproto-native ?= "0.11"
+PREFERRED_VERSION_resourceproto ?= "1.1.0"
+PREFERRED_VERSION_resourceproto-native ?= "1.1.0"
+PREFERRED_VERSION_scrnsaverproto ?= "1.2.0"
+PREFERRED_VERSION_scrnsaverproto-native ?= "1.2.0"
+PREFERRED_VERSION_trapproto ?= "3.4.3"
+PREFERRED_VERSION_trapproto-native ?= "3.4.3"
+PREFERRED_VERSION_videoproto ?= "2.3.0"
+PREFERRED_VERSION_videoproto-native ?= "2.3.0"
+PREFERRED_VERSION_windowswmproto ?= "1.0.4"
+PREFERRED_VERSION_windowswmproto-native ?= "1.0.4"
+PREFERRED_VERSION_xcmiscproto ?= "1.2.0"
+PREFERRED_VERSION_xcmiscproto-native ?= "1.2.0"
+PREFERRED_VERSION_xextproto ?= "7.1.1"
+PREFERRED_VERSION_xextproto-native ?= "7.1.1"
+PREFERRED_VERSION_xf86bigfontproto ?= "1.2.0"
+PREFERRED_VERSION_xf86bigfontproto-native ?= "1.2.0"
+PREFERRED_VERSION_xf86dgaproto ?= "2.1"
+PREFERRED_VERSION_xf86dgaproto-native ?= "2.1"
+PREFERRED_VERSION_xf86driproto ?= "2.1.0"
+PREFERRED_VERSION_xf86driproto-native ?= "2.1.0"
+PREFERRED_VERSION_xf86miscproto ?= "0.9.2"
+PREFERRED_VERSION_xf86miscproto-native ?= "0.9.2"
+PREFERRED_VERSION_xf86rushproto ?= "1.1.2"
+PREFERRED_VERSION_xf86rushproto-native ?= "1.1.2"
+PREFERRED_VERSION_xf86vidmodeproto ?= "2.3"
+PREFERRED_VERSION_xf86vidmodeproto-native ?= "2.3"
+PREFERRED_VERSION_xineramaproto ?= "1.2"
+PREFERRED_VERSION_xineramaproto-native ?= "1.2"
+PREFERRED_VERSION_xproto ?= "7.0.16"
+PREFERRED_VERSION_xproto-native ?= "7.0.16"
+PREFERRED_VERSION_xproxymanagementprotocol ?= "1.0.2"
+PREFERRED_VERSION_xproxymanagementprotocol-native ?= "1.0.2"
+PREFERRED_VERSION_gccmakedep ?= "1.0.2"
+PREFERRED_VERSION_gccmakedep-native ?= "1.0.2"
+PREFERRED_VERSION_imake ?= "1.0.2"
+PREFERRED_VERSION_imake-native ?= "1.0.2"
+PREFERRED_VERSION_lndir ?= "1.0.1"
+PREFERRED_VERSION_lndir-native ?= "1.0.1"
+PREFERRED_VERSION_makedepend ?= "1.0.1"
+PREFERRED_VERSION_makedepend-native ?= "1.0.1"
+PREFERRED_VERSION_util-macros ?= "1.3.0"
+PREFERRED_VERSION_util-macros-native ?= "1.3.0"
+PREFERRED_VERSION_xorg-cf-files ?= "1.0.2"
+PREFERRED_VERSION_xorg-cf-files-native ?= "1.0.2"
+PREFERRED_VERSION_xserver-xorg ?= "1.7.0"
+PREFERRED_VERSION_xserver-xorg-native ?= "1.7.0"
diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 580702b..7df13da 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -237,7 +237,8 @@ SRCREV_pn-webkit-gtk ?= "48579"
 SRCREV_pn-wlan-ng-modules ?= "1859"
 SRCREV_pn-wlan-ng-utils ?= "1859"
 SRCREV_pn-wmiconfig ?= "5394"
-SRCREV_pn-xf86-video-glamo ?= "25c4b0e80e93e04e6f7d4b8bca6d007fb9de6da8"
+SRCREV_pn-xf86-video-glamo ?= "15954340b4b7aaf6ab850c149c2f75c1555d9360"
+SRCREV_pn-xf86-video-glamo-kms ?= "15954340b4b7aaf6ab850c149c2f75c1555d9360"
 SRCREV_pn-xoo ?= "1971"
 SRCREV_pn-xserver-kdrive-glamo ?= "9b28d998424c77fbc057dd3a022ccbb122793a52"
 
diff --git a/contrib/source-checker/bump.preferred-xorg-versions-live.sh b/contrib/source-checker/bump.preferred-xorg-versions-live.sh
new file mode 100755
index 0000000..c5c0b19
--- /dev/null
+++ b/contrib/source-checker/bump.preferred-xorg-versions-live.sh
@@ -0,0 +1,68 @@
+#!/bin/bash
+DATE=`date +%Y%m%d`
+SCRDIR=`dirname $0`
+DIR=${SCRDIR}/${DATE}
+PREFIX=http://xorg.freedesktop.org/releases/individual/
+GRPS="app data doc driver font lib proto util xserver"
+OETREE=${SCRDIR}/../..
+PREFS_LIVE=${OETREE}/conf/distro/include/preferred-xorg-versions-live.inc
+BBS=${OETREE}/recipes/xorg-
+OUT_LOG=${DIR}.log
+OUT_CMD=${DIR}.cmd
+
+export LC_ALL=c
+
+mkdir -p ${DIR}
+
+function latest {
+  IN=$1
+  OUT=$2
+  echo "Parsing latest from ${IN} to ${OUT}"
+  sed "s/<a href=\"/\nPKG=/g" ${IN} | grep "^PKG=" | sed "s/^\([^\"]*\)\">.*$/\1/g" | grep "bz2$" | sort -V > ${IN}.tmp
+  for PKG in `sed "s/^\(.*\)-\([^-]*\)$/\1/g" ${IN}.tmp | sort -u`; do
+    grep ${PKG} ${IN}.tmp | tail -n 1 | sed 's/xorg-server/xserver-xorg/g' >> ${OUT};
+  done
+}
+
+function updateVersions {
+  PKG=$1
+  GRP=$2
+  VER=$3
+  BB_VER=`ls -1 ${BBS}${GRP}/${PKG}_*.bb 2>/dev/null | sed "s%${BBS}${GRP}/${PKG}_%%g; s%.bb$%%g" | grep -v X11R7.0 | grep -v cvs | grep -v git | grep -v svn | sort -V | tail -n 1`
+  #echo ${GRP}/${PKG}/${VER} ${PREF_VER} ${BB_VER}
+  echo "PREFERRED_VERSION_${PKG} ?= \"${VER}\"" >> ${PREFS_LIVE}
+  if [[ -n ${BB_VER} && ${BB_VER} != ${VER} ]] ; then
+    echo "bump: $GRP ${PKG} ${BB_VER} -> ${VER}" | tee -a ${OUT_LOG}
+    echo "cp ${BBS}${GRP}/${PKG}_${BB_VER}.bb ${BBS}${GRP}/${PKG}_${VER}.bb" >> ${OUT_CMD}
+  fi
+  if [[ -z ${BB_VER} ]] ; then
+    echo "new ${GRP} ${PKG}/${VER}" | tee -a ${OUT_LOG}
+  fi
+}
+
+for GRP in ${GRPS}; do
+  if [[ ! -e ${DIR}/${GRP}.html ]] ; then
+    wget http://xorg.freedesktop.org/releases/individual/${GRP} -O ${DIR}/${GRP}.html
+  fi
+  latest ${DIR}/${GRP}.html ${DIR}/${GRP}.txt
+  sed "s/PKG=/${GRP}\//g; s/-\([^-]*\).tar.bz2$/\/\1/g;" ${DIR}/${GRP}.txt | gawk '{ print tolower($0) }' >> ${DIR}/latest.txt
+done
+
+sort -u ${DIR}/latest.txt > ${DIR}/latest.sort.txt
+ 
+echo "#`date`" > ${PREFS_LIVE}
+
+echo "#`date`" > ${OUT_LOG}
+echo "#`date`" > ${OUT_CMD}
+
+cat ${DIR}/latest.sort.txt | while read LINE; do
+  #echo ${LINE};
+  PKG=`echo ${LINE} | sed "s%^\(.*\)\/\(.*\)\/\(.*\)$%\2%g;"`
+  GRP=`echo ${LINE} | sed "s%^\(.*\)\/\(.*\)\/\(.*\)$%\1%g;"`
+  VER=`echo ${LINE} | sed "s%^\(.*\)\/\(.*\)\/\(.*\)$%\3%g;"`
+  updateVersions ${PKG} ${GRP} ${VER}
+  updateVersions ${PKG}-native ${GRP} ${VER}
+done
+
+echo "Check ${OUT_LOG} if there is something new and interesting"
+echo "You can update prefs or copy bbfiles with commands from ${OUT_CMD}"
diff --git a/recipes/dri/libdrm-glamo_git.bb b/recipes/dri/libdrm-glamo_git.bb
new file mode 100644
index 0000000..337cca9
--- /dev/null
+++ b/recipes/dri/libdrm-glamo_git.bb
@@ -0,0 +1,17 @@
+SECTION = "x11/base"
+LICENSE = "MIT"
+SRC_URI = "git://git.bitwiz.org.uk/libdrm.git;protocol=git;branch=glamo"
+PROVIDES = "drm"
+DEPENDS = "libpthread-stubs virtual/kernel"
+
+PV=2.4.4+gitr${SRCPV}
+
+DEFAULT_PREFERENCE = "-1"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+do_stage() {
+	autotools_stage_all
+}
diff --git a/recipes/xorg-app/appres_1.0.2.bb b/recipes/xorg-app/appres_1.0.2.bb
new file mode 100644
index 0000000..4b6447a
--- /dev/null
+++ b/recipes/xorg-app/appres_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+PE = "1"
+
+DESCRIPTION = "The appres program prints the resources seen by an application."
+
+DEPENDS += " virtual/libx11 libxt"
+
diff --git a/recipes/xorg-app/bdftopcf-native_1.0.2.bb b/recipes/xorg-app/bdftopcf-native_1.0.2.bb
new file mode 100644
index 0000000..4104994
--- /dev/null
+++ b/recipes/xorg-app/bdftopcf-native_1.0.2.bb
@@ -0,0 +1,8 @@
+inherit native
+require xorg-app-common.inc
+PE = "1"
+
+XORG_PN = "bdftopcf"
+
+DEPENDS = "libxfont-native"
+
diff --git a/recipes/xorg-app/bdftopcf_1.0.2.bb b/recipes/xorg-app/bdftopcf_1.0.2.bb
new file mode 100644
index 0000000..6af52c9
--- /dev/null
+++ b/recipes/xorg-app/bdftopcf_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+PE = "1"
+
+DESCRIPTION = "converts BDF fonts to PCF fonts"
+
+DEPENDS += " libxfont"
+
diff --git a/recipes/xorg-app/bitmap_1.0.4.bb b/recipes/xorg-app/bitmap_1.0.4.bb
new file mode 100644
index 0000000..561489f
--- /dev/null
+++ b/recipes/xorg-app/bitmap_1.0.4.bb
@@ -0,0 +1,3 @@
+require xorg-app-common.inc
+DEPENDS += " virtual/libx11 libxmu xbitmaps libxt"
+PE = "1"
diff --git a/recipes/xorg-app/constype_1.0.2.bb b/recipes/xorg-app/constype_1.0.2.bb
new file mode 100644
index 0000000..96b340c
--- /dev/null
+++ b/recipes/xorg-app/constype_1.0.2.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "print an X window dump"
+DEPENDS += " libxmu virtual/libx11"
+PE = "1"
diff --git a/recipes/xorg-app/editres_1.0.4.bb b/recipes/xorg-app/editres_1.0.4.bb
new file mode 100644
index 0000000..a307941
--- /dev/null
+++ b/recipes/xorg-app/editres_1.0.4.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+PE = "1"
+
+DEPENDS += " virtual/libx11 libxt libxmu libxaw"
+
diff --git a/recipes/xorg-app/luit_1.0.4.bb b/recipes/xorg-app/luit_1.0.4.bb
new file mode 100644
index 0000000..01645af
--- /dev/null
+++ b/recipes/xorg-app/luit_1.0.4.bb
@@ -0,0 +1,4 @@
+require xorg-app-common.inc
+DESCRIPTION = "a filter for locale and ISO 2022 support on Unicode terminals"
+DEPENDS += " zlib zlib virtual/libx11 libfontenc"
+PE = "1"
diff --git a/recipes/xorg-app/mkcomposecache_1.2.1.bb b/recipes/xorg-app/mkcomposecache_1.2.1.bb
new file mode 100644
index 0000000..5c80f67
--- /dev/null
+++ b/recipes/xorg-app/mkcomposecache_1.2.1.bb
@@ -0,0 +1,3 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "used for creating global (system-wide) Compose cache files"
diff --git a/recipes/xorg-app/mkfontscale-native_1.0.6.bb b/recipes/xorg-app/mkfontscale-native_1.0.6.bb
new file mode 100644
index 0000000..bae3416
--- /dev/null
+++ b/recipes/xorg-app/mkfontscale-native_1.0.6.bb
@@ -0,0 +1,7 @@
+inherit native
+require mkfontscale_${PV}.bb
+
+DEPENDS = "libx11-native libfontenc-native freetype-native"
+
+S="${WORKDIR}/mkfontscale-${PV}"
+XORG_PN="mkfontscale"
diff --git a/recipes/xorg-app/mkfontscale_1.0.6.bb b/recipes/xorg-app/mkfontscale_1.0.6.bb
new file mode 100644
index 0000000..126918b
--- /dev/null
+++ b/recipes/xorg-app/mkfontscale_1.0.6.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "a program to create an index of scalable font files for X"
+
+DEPENDS += " zlib libfontenc freetype virtual/libx11"
diff --git a/recipes/xorg-app/rstart_1.0.3.bb b/recipes/xorg-app/rstart_1.0.3.bb
new file mode 100644
index 0000000..aafaddc
--- /dev/null
+++ b/recipes/xorg-app/rstart_1.0.3.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+PE = "1"
+
+DEPENDS += " virtual/libx11"
+
diff --git a/recipes/xorg-app/setxkbmap_1.1.0.bb b/recipes/xorg-app/setxkbmap_1.1.0.bb
new file mode 100644
index 0000000..9b97cf4
--- /dev/null
+++ b/recipes/xorg-app/setxkbmap_1.1.0.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+PE = "1"
+
+#DESCRIPTION = ""
+
+DEPENDS += " libxkbfile virtual/libx11"
+
diff --git a/recipes/xorg-app/xauth_1.0.4.bb b/recipes/xorg-app/xauth_1.0.4.bb
new file mode 100644
index 0000000..e3cd44c
--- /dev/null
+++ b/recipes/xorg-app/xauth_1.0.4.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "X authority file utility"
+DEPENDS += "libxau libxext libxmu"
+PE = "1"
diff --git a/recipes/xorg-app/xbacklight_1.1.1.bb b/recipes/xorg-app/xbacklight_1.1.1.bb
new file mode 100644
index 0000000..ab911de
--- /dev/null
+++ b/recipes/xorg-app/xbacklight_1.1.1.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+
+DESCRIPTION = "adjust backlight brightness using RandR extension"
+
+DEPENDS += " virtual/libx11 libxrender libxrandr"
diff --git a/recipes/xorg-app/xclock_1.0.4.bb b/recipes/xorg-app/xclock_1.0.4.bb
new file mode 100644
index 0000000..0e73c64
--- /dev/null
+++ b/recipes/xorg-app/xclock_1.0.4.bb
@@ -0,0 +1,4 @@
+require xorg-app-common.inc
+DESCRIPTION = "analog / digital clock for X"
+DEPENDS += " virtual/libx11 libxaw libxrender libxft libxkbfile libxt"
+PE = "1"
diff --git a/recipes/xorg-app/xdm_1.1.9.bb b/recipes/xorg-app/xdm_1.1.9.bb
new file mode 100644
index 0000000..eb153b1
--- /dev/null
+++ b/recipes/xorg-app/xdm_1.1.9.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+PE = "1"
+
+DESCRIPTION = "X display manager"
+
+DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau virtual/libx11 libxext libxdmcp libxt libxaw"
+
+EXTRA_OECONF += " --with-random-device=/dev/urandom"
+
+FILES_${PN}-dbg += "${libdir}/X11/xdm/.debug/*"
diff --git a/recipes/xorg-app/xedit_1.1.2.bb b/recipes/xorg-app/xedit_1.1.2.bb
new file mode 100644
index 0000000..e98f981
--- /dev/null
+++ b/recipes/xorg-app/xedit_1.1.2.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+PE = "1"
+
+DEPENDS += " libxaw libxprintutil libxp libxt"
+
diff --git a/recipes/xorg-app/xeyes_1.0.991.bb b/recipes/xorg-app/xeyes_1.0.991.bb
new file mode 100644
index 0000000..07ce072
--- /dev/null
+++ b/recipes/xorg-app/xeyes_1.0.991.bb
@@ -0,0 +1,4 @@
+require xorg-app-common.inc
+PE = "1"
+
+DEPENDS += " virtual/libx11 libxau libxt libxext libxmu"
diff --git a/recipes/xorg-app/xfs_1.1.0.bb b/recipes/xorg-app/xfs_1.1.0.bb
new file mode 100644
index 0000000..8cef4bd
--- /dev/null
+++ b/recipes/xorg-app/xfs_1.1.0.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "X fontserver"
+DEPENDS += " libfs libxfont xtrans"
+PE = "1"
diff --git a/recipes/xorg-app/xinit_1.1.1.bb b/recipes/xorg-app/xinit_1.1.1.bb
new file mode 100644
index 0000000..ce82fb0
--- /dev/null
+++ b/recipes/xorg-app/xinit_1.1.1.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "X Window System initializer"
+PE = "1"
+
+FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/xorg-app/xinput_1.4.99.3.bb b/recipes/xorg-app/xinput_1.4.99.3.bb
new file mode 100644
index 0000000..a95753c
--- /dev/null
+++ b/recipes/xorg-app/xinput_1.4.99.3.bb
@@ -0,0 +1,4 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "a utility to configure and test XInput devices"
+DEPENDS += " libxi"
diff --git a/recipes/xorg-app/xkbcomp-native_1.1.1.bb b/recipes/xorg-app/xkbcomp-native_1.1.1.bb
new file mode 100644
index 0000000..ee7c25c
--- /dev/null
+++ b/recipes/xorg-app/xkbcomp-native_1.1.1.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "The X Keyboard Extension essentially replaces the core protocol definition of keyboard."
+
+SECTION = "x11/applications"
+LICENSE = "MIT-X"
+S="${WORKDIR}/xkbcomp-${PV}"
+
+DEPENDS = "libx11-native libxkbfile-native"
+
+SRC_URI = "${XORG_MIRROR}/individual/app/xkbcomp-${PV}.tar.bz2"
+
+inherit native autotools pkgconfig
diff --git a/recipes/xorg-app/xkbcomp_1.1.1.bb b/recipes/xorg-app/xkbcomp_1.1.1.bb
new file mode 100644
index 0000000..ca6cdb8
--- /dev/null
+++ b/recipes/xorg-app/xkbcomp_1.1.1.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "The X Keyboard Extension essentially replaces the core protocol definition of keyboard."
+
+DEPENDS += " virtual/libx11 libxkbfile"
diff --git a/recipes/xorg-app/xmag_1.0.3.bb b/recipes/xorg-app/xmag_1.0.3.bb
new file mode 100644
index 0000000..4c13594
--- /dev/null
+++ b/recipes/xorg-app/xmag_1.0.3.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "magnify parts of the screen"
+DEPENDS += " libxaw libxt"
+PE = "1"
diff --git a/recipes/xorg-app/xmodmap_1.0.4.bb b/recipes/xorg-app/xmodmap_1.0.4.bb
new file mode 100644
index 0000000..4b03129
--- /dev/null
+++ b/recipes/xorg-app/xmodmap_1.0.4.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "utility for modifying keymaps and pointer button mappings in X"
+LICENSE = "MIT"
+PE = "1"
diff --git a/recipes/xorg-app/xrandr_1.3.2.bb b/recipes/xorg-app/xrandr_1.3.2.bb
new file mode 100644
index 0000000..05ef6af
--- /dev/null
+++ b/recipes/xorg-app/xrandr_1.3.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "X Resize and Rotate extension command."
+LICENSE= "BSD-X"
+DEPENDS += "libxrandr libxrender"
+PE = "1"
+
+SRC_URI += "file://resolve_symbol_clash.patch;patch=1"
diff --git a/recipes/xorg-app/xrx_1.0.3.bb b/recipes/xorg-app/xrx_1.0.3.bb
new file mode 100644
index 0000000..cf18e2e
--- /dev/null
+++ b/recipes/xorg-app/xrx_1.0.3.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+PE = "1"
+
+DEPENDS += " libxaw virtual/libx11 libxt libxext xtrans xproxymngproto libxau"
+
diff --git a/recipes/xorg-app/xset_1.1.0.bb b/recipes/xorg-app/xset_1.1.0.bb
new file mode 100644
index 0000000..fa2e4c2
--- /dev/null
+++ b/recipes/xorg-app/xset_1.1.0.bb
@@ -0,0 +1,11 @@
+require xorg-app-common.inc
+
+DESCRIPTION = "user preference utility for X"
+LICENSE = "MIT"
+DEPENDS += "libxext libxxf86misc libxfontcache libxmu libxp libxau"
+PE = "1"
+
+SRC_URI += "file://disable-xkb.patch;patch=1"
+
+CFLAGS += "-D_GNU_SOURCE"
+EXTRA_OECONF = "--disable-xkb"
diff --git a/recipes/xorg-data/xcursor-themes_1.0.2.bb b/recipes/xorg-data/xcursor-themes_1.0.2.bb
new file mode 100644
index 0000000..1107d08
--- /dev/null
+++ b/recipes/xorg-data/xcursor-themes_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-data-common.inc
+PE = "1"
+
+DEPENDS += " libxcursor xcursorgen-native"
+
+FILES_${PN} += "${datadir}/icons"
+
diff --git a/recipes/xorg-doc/xorg-docs_1.4.99.901.bb b/recipes/xorg-doc/xorg-docs_1.4.99.901.bb
new file mode 100644
index 0000000..6b5cbad
--- /dev/null
+++ b/recipes/xorg-doc/xorg-docs_1.4.99.901.bb
@@ -0,0 +1,12 @@
+require xorg-doc-common.inc
+
+DESCRIPTION = "The documentation in this package is from xc/doc in the monolithic \
+source tree."
+
+DEPENDS += " intltool"
+
+PE = "1"
+
+FILES_${PN} += " /usr/share/X11/doc"
+
+EXTRA_OECONF += " ac_cv_file__usr_share_sgml_X11_defs_ent=no "
diff --git a/recipes/xorg-doc/xorg-sgml-doctools_1.2.99.901.bb b/recipes/xorg-doc/xorg-sgml-doctools_1.2.99.901.bb
new file mode 100644
index 0000000..053ca2e
--- /dev/null
+++ b/recipes/xorg-doc/xorg-sgml-doctools_1.2.99.901.bb
@@ -0,0 +1,4 @@
+require xorg-doc-common.inc
+PE = "1"
+
+FILES_${PN} += " /usr/share/X11/sgml"
diff --git a/recipes/xorg-driver/xf86-input-acecad_1.4.0.bb b/recipes/xorg-driver/xf86-input-acecad_1.4.0.bb
new file mode 100644
index 0000000..c993bc7
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-acecad_1.4.0.bb
@@ -0,0 +1,5 @@
+require xorg-driver-input.inc
+
+DESCRIPTION = "X.Org X server -- AceCad input driver"
+PE = "1"
+
diff --git a/recipes/xorg-driver/xf86-input-aiptek_1.3.0.bb b/recipes/xorg-driver/xf86-input-aiptek_1.3.0.bb
new file mode 100644
index 0000000..34a4974
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-aiptek_1.3.0.bb
@@ -0,0 +1,2 @@
+require xorg-driver-input.inc
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-input-citron_2.2.2.bb b/recipes/xorg-driver/xf86-input-citron_2.2.2.bb
new file mode 100644
index 0000000..4c449b1
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-citron_2.2.2.bb
@@ -0,0 +1,5 @@
+require xorg-driver-input.inc
+
+DESCRIPTION = "X.Org X Server -- Citron input driver"
+PE = "1"
+
diff --git a/recipes/xorg-driver/xf86-input-evdev_2.2.99.2.bb b/recipes/xorg-driver/xf86-input-evdev_2.2.99.2.bb
new file mode 100644
index 0000000..7929096
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-evdev_2.2.99.2.bb
@@ -0,0 +1,4 @@
+require xorg-driver-input.inc
+
+DESCRIPTION = "X.Org X server -- evdev input driver"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-input-fpit_1.3.0.bb b/recipes/xorg-driver/xf86-input-fpit_1.3.0.bb
new file mode 100644
index 0000000..311caf6
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-fpit_1.3.0.bb
@@ -0,0 +1,3 @@
+require xorg-driver-input.inc
+PE = "1"
+
diff --git a/recipes/xorg-driver/xf86-input-hyperpen_1.3.0.bb b/recipes/xorg-driver/xf86-input-hyperpen_1.3.0.bb
new file mode 100644
index 0000000..311caf6
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-hyperpen_1.3.0.bb
@@ -0,0 +1,3 @@
+require xorg-driver-input.inc
+PE = "1"
+
diff --git a/recipes/xorg-driver/xf86-input-joystick_1.4.99.2.bb b/recipes/xorg-driver/xf86-input-joystick_1.4.99.2.bb
new file mode 100644
index 0000000..a53297f
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-joystick_1.4.99.2.bb
@@ -0,0 +1,4 @@
+require xorg-driver-input.inc
+
+DESCRIPTION = "X.Org X server -- joystick input driver"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-input-keyboard_1.4.0.bb b/recipes/xorg-driver/xf86-input-keyboard_1.4.0.bb
new file mode 100644
index 0000000..28a834a
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-keyboard_1.4.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+
+DESCRIPTION = "X.Org X server -- keyboard input driver"
+
+DEPENDS += " kbproto"
diff --git a/recipes/xorg-driver/xf86-input-mouse_1.5.0.bb b/recipes/xorg-driver/xf86-input-mouse_1.5.0.bb
new file mode 100644
index 0000000..e632567
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-mouse_1.5.0.bb
@@ -0,0 +1,4 @@
+require xorg-driver-input.inc
+
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-input-mutouch_1.2.1.bb b/recipes/xorg-driver/xf86-input-mutouch_1.2.1.bb
new file mode 100644
index 0000000..cce8e75
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-mutouch_1.2.1.bb
@@ -0,0 +1,4 @@
+require xorg-driver-input.inc
+PE = "1"
+
+DESCRIPTION = "X.Org X server -- muTouch input driver"
diff --git a/recipes/xorg-driver/xf86-input-penmount_1.4.0.bb b/recipes/xorg-driver/xf86-input-penmount_1.4.0.bb
new file mode 100644
index 0000000..1ed62d4
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-penmount_1.4.0.bb
@@ -0,0 +1,4 @@
+require xorg-driver-input.inc
+
+DESCRIPTION = "X.Org X server -- Penmount input driver"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-input-synaptics_1.2.0.bb b/recipes/xorg-driver/xf86-input-synaptics_1.2.0.bb
new file mode 100644
index 0000000..e632567
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-synaptics_1.2.0.bb
@@ -0,0 +1,4 @@
+require xorg-driver-input.inc
+
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-input-vmmouse_12.6.5.bb b/recipes/xorg-driver/xf86-input-vmmouse_12.6.5.bb
new file mode 100644
index 0000000..7a433df
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-vmmouse_12.6.5.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+
+DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
+PE = "1"
+
+COMPATIBLE_HOST = 'i.86.*-linux'
diff --git a/recipes/xorg-driver/xf86-input-void_1.3.0.bb b/recipes/xorg-driver/xf86-input-void_1.3.0.bb
new file mode 100644
index 0000000..2fa7021
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-void_1.3.0.bb
@@ -0,0 +1,4 @@
+require xorg-driver-input.inc
+
+DESCRIPTION = "X.Org X server -- void input driver"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-apm_1.2.2.bb b/recipes/xorg-driver/xf86-video-apm_1.2.2.bb
new file mode 100644
index 0000000..1cef0fb
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-apm_1.2.2.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "This is the Alliance Promotion driver for XFree86 4.0+"
+
+DEPENDS += " xf86rushproto"
+
+SRC_URI += "file://get-rid-of-host-includes.patch;patch=1"
diff --git a/recipes/xorg-driver/xf86-video-ark_0.7.2.bb b/recipes/xorg-driver/xf86-video-ark_0.7.2.bb
new file mode 100644
index 0000000..f62f5a3
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-ark_0.7.2.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "X.Org X server -- ark display driver"
+
+SRC_URI += "file://get-rid-of-host-includes.patch;patch=1"
diff --git a/recipes/xorg-driver/xf86-video-ast_0.89.9.bb b/recipes/xorg-driver/xf86-video-ast_0.89.9.bb
new file mode 100644
index 0000000..c2b6b76
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-ast_0.89.9.bb
@@ -0,0 +1,2 @@
+require xorg-driver-video.inc
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-ati_6.12.4.bb b/recipes/xorg-driver/xf86-video-ati_6.12.4.bb
new file mode 100644
index 0000000..4aae05a
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-ati_6.12.4.bb
@@ -0,0 +1,5 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- ATI display driver"
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-chips_1.2.2.bb b/recipes/xorg-driver/xf86-video-chips_1.2.2.bb
new file mode 100644
index 0000000..9e09d8e
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-chips_1.2.2.bb
@@ -0,0 +1,4 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "X.Org X server -- Chips display driver"
diff --git a/recipes/xorg-driver/xf86-video-cirrus_1.3.2.bb b/recipes/xorg-driver/xf86-video-cirrus_1.3.2.bb
new file mode 100644
index 0000000..ce19dd4
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-cirrus_1.3.2.bb
@@ -0,0 +1,4 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "X.Org X server -- Cirrus display driver"
diff --git a/recipes/xorg-driver/xf86-video-dummy_0.3.2.bb b/recipes/xorg-driver/xf86-video-dummy_0.3.2.bb
new file mode 100644
index 0000000..d85ae16
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-dummy_0.3.2.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "X.Org X server -- dummy display driver"
+
+SRC_URI += "file://get-rid-of-host-includes.patch;patch=1"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.6.bb b/recipes/xorg-driver/xf86-video-geode_2.11.6.bb
new file mode 100644
index 0000000..380ce2e
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-geode_2.11.6.bb
@@ -0,0 +1,5 @@
+require xorg-driver-video.inc
+PE = "1"
+
+COMPATIBLE_HOST = 'i.86.*-linux'
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
diff --git a/recipes/xorg-driver/xf86-video-glamo-kms_git.bb b/recipes/xorg-driver/xf86-video-glamo-kms_git.bb
new file mode 100644
index 0000000..eb8fd30
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-glamo-kms_git.bb
@@ -0,0 +1,12 @@
+require xorg-driver-video.inc
+SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=kms"
+PROVIDES = "xf86-video-glamo"
+
+S = "${WORKDIR}/git"
+
+PV=1.0.0+gitr${SRCREV}
+PR = "r1"
+
+RDEPENDS = "xserver-xorg-extension-dri xserver-xorg-extension-dri2 xserver-xorg-extension-glx"
+
+DESCRIPTION = "X.Org X server -- Glamo display driver with KMS support"
diff --git a/recipes/xorg-driver/xf86-video-glamo_git.bb b/recipes/xorg-driver/xf86-video-glamo_git.bb
index fecba81..57044ce 100644
--- a/recipes/xorg-driver/xf86-video-glamo_git.bb
+++ b/recipes/xorg-driver/xf86-video-glamo_git.bb
@@ -1,11 +1,12 @@
 require xorg-driver-video.inc
-SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo;protocol=git;branch=master"
-PV = "0.1+gitr${SRCREV}"
-PE = "1"
-
-DESCRIPTION = "X.Org X server -- fbdev display driver"
+SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=master \
+  file://0001-dpms.h-dpmsconst.h.patch;patch=1"
 
 S = "${WORKDIR}/git"
 
-ARM_INSTRUCTION_SET = "arm"
+PV="1.0.0+gitr${SRCREV}"
+PR = "r2"
+
+RDEPENDS = "xserver-xorg-extension-dri xserver-xorg-extension-dri2 xserver-xorg-extension-glx"
 
+DESCRIPTION = "X.Org X server -- Glamo display driver"
diff --git a/recipes/xorg-driver/xf86-video-glint_1.2.4.bb b/recipes/xorg-driver/xf86-video-glint_1.2.4.bb
new file mode 100644
index 0000000..eac23c7
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-glint_1.2.4.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- Glint display driver"
+
+DEPENDS += " xf86dgaproto drm xf86driproto"
+
diff --git a/recipes/xorg-driver/xf86-video-i128_1.3.3.bb b/recipes/xorg-driver/xf86-video-i128_1.3.3.bb
new file mode 100644
index 0000000..78d5eda
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-i128_1.3.3.bb
@@ -0,0 +1,4 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- i128 display driver"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-i740_1.3.2.bb b/recipes/xorg-driver/xf86-video-i740_1.3.2.bb
new file mode 100644
index 0000000..6c2ea74
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-i740_1.3.2.bb
@@ -0,0 +1,5 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- i740 display driver"
+
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-intel_2.9.0.bb b/recipes/xorg-driver/xf86-video-intel_2.9.0.bb
new file mode 100644
index 0000000..eed1fcb
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-intel_2.9.0.bb
@@ -0,0 +1,5 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-mach64_6.8.2.bb b/recipes/xorg-driver/xf86-video-mach64_6.8.2.bb
new file mode 100644
index 0000000..eed1fcb
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-mach64_6.8.2.bb
@@ -0,0 +1,5 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-mga_1.9.100.bb b/recipes/xorg-driver/xf86-video-mga_1.9.100.bb
new file mode 100644
index 0000000..0ed0d28
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-mga_1.9.100.bb
@@ -0,0 +1,4 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- MGA display driver"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-neomagic_1.2.4.bb b/recipes/xorg-driver/xf86-video-neomagic_1.2.4.bb
new file mode 100644
index 0000000..b519e60
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-neomagic_1.2.4.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+
+PE = "1"
+
+DESCRIPTION = "X11 driver for NeoMagic 2200, 2160, 2097, 2093, 2090, 2070"
+
+DEPENDS += " xf86dgaproto"
+
diff --git a/recipes/xorg-driver/xf86-video-newport_0.2.3.bb b/recipes/xorg-driver/xf86-video-newport_0.2.3.bb
new file mode 100644
index 0000000..b9f88fc
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-newport_0.2.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "This is an unaccelerated driver for the SGI newport cards."
+
+#DEPENDS += " "
+
diff --git a/recipes/xorg-driver/xf86-video-nv_2.1.15.bb b/recipes/xorg-driver/xf86-video-nv_2.1.15.bb
new file mode 100644
index 0000000..0d4ee2e
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-nv_2.1.15.bb
@@ -0,0 +1,4 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- NV display driver"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-openchrome_0.2.904.bb b/recipes/xorg-driver/xf86-video-openchrome_0.2.904.bb
new file mode 100644
index 0000000..facae89
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-openchrome_0.2.904.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- openchrome display driver"
+PE = "1"
+
+do_configure_prepend() {
+	rm ${S}/acinclude.m4 || true
+}
+
diff --git a/recipes/xorg-driver/xf86-video-r128_6.8.1.bb b/recipes/xorg-driver/xf86-video-r128_6.8.1.bb
new file mode 100644
index 0000000..994ea24
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-r128_6.8.1.bb
@@ -0,0 +1,4 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- r128 display driver"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-radeonhd_1.2.5.bb b/recipes/xorg-driver/xf86-video-radeonhd_1.2.5.bb
new file mode 100644
index 0000000..ee92c36
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-radeonhd_1.2.5.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "X.Org X server -- AMD/ATI r5xx, r6xx display driver"
+
+EXTRA_OECONF += " \
+  ac_cv_file___src_AtomBios_includes_atombios_h=yes \
+  ac_cv_file___src_AtomBios_includes_Decoder_h=yes \
+"
diff --git a/recipes/xorg-driver/xf86-video-rendition_4.2.3.bb b/recipes/xorg-driver/xf86-video-rendition_4.2.3.bb
new file mode 100644
index 0000000..e6c89a8
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-rendition_4.2.3.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "X11 driver supporting cards based on the V1000 or the V2x00."
+
+#DEPENDS += " "
diff --git a/recipes/xorg-driver/xf86-video-s3_0.6.3.bb b/recipes/xorg-driver/xf86-video-s3_0.6.3.bb
new file mode 100644
index 0000000..b5fef82
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-s3_0.6.3.bb
@@ -0,0 +1,4 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "X.Org X server -- legacy S3 display driver"
diff --git a/recipes/xorg-driver/xf86-video-s3virge_1.10.4.bb b/recipes/xorg-driver/xf86-video-s3virge_1.10.4.bb
new file mode 100644
index 0000000..5f7dd35
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-s3virge_1.10.4.bb
@@ -0,0 +1,4 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "X.Org X server -- S3 ViRGE display driver"
diff --git a/recipes/xorg-driver/xf86-video-savage_2.3.1.bb b/recipes/xorg-driver/xf86-video-savage_2.3.1.bb
new file mode 100644
index 0000000..eafe389
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-savage_2.3.1.bb
@@ -0,0 +1,12 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "X.Org X server -- Savage display driver"
+
+DEPENDS += " drm xf86driproto"
+
+EXTRA_OECONF += " \
+  ac_cv_file__usr_include_xorg_dri_h=yes \
+  ac_cv_file__usr_include_xorg_sarea_h=yes \
+  ac_cv_file__usr_include_xorg_dristruct_h=yes \
+"
diff --git a/recipes/xorg-driver/xf86-video-siliconmotion_1.7.3.bb b/recipes/xorg-driver/xf86-video-siliconmotion_1.7.3.bb
new file mode 100644
index 0000000..5b9b4fc
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-siliconmotion_1.7.3.bb
@@ -0,0 +1,4 @@
+require xorg-driver-video.inc
+
+PE = "1"
+DESCRIPTION = "X.Org X server -- SiliconMotion display driver"
diff --git a/recipes/xorg-driver/xf86-video-sis_0.10.2.bb b/recipes/xorg-driver/xf86-video-sis_0.10.2.bb
new file mode 100644
index 0000000..dc083b3
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-sis_0.10.2.bb
@@ -0,0 +1,11 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- SiS display driver"
+DEPENDS += " xineramaproto xf86miscproto xf86dgaproto drm xf86driproto"
+PE = "1"
+
+EXTRA_OECONF += " \
+  ac_cv_file__usr_include_xorg_dri_h=yes \
+  ac_cv_file__usr_include_xorg_sarea_h=yes \
+  ac_cv_file__usr_include_xorg_dristruct_h=yes \
+"
diff --git a/recipes/xorg-driver/xf86-video-sisusb_0.9.3.bb b/recipes/xorg-driver/xf86-video-sisusb_0.9.3.bb
new file mode 100644
index 0000000..8f6dfae
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-sisusb_0.9.3.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+
+PE = "1"
+
+DESCRIPTION = "X.Org X server -- SiS USB display driver"
+DEPENDS += " xineramaproto xf86miscproto"
diff --git a/recipes/xorg-driver/xf86-video-suncg14_1.1.1.bb b/recipes/xorg-driver/xf86-video-suncg14_1.1.1.bb
new file mode 100644
index 0000000..c2b6b76
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-suncg14_1.1.1.bb
@@ -0,0 +1,2 @@
+require xorg-driver-video.inc
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-suncg3_1.1.1.bb b/recipes/xorg-driver/xf86-video-suncg3_1.1.1.bb
new file mode 100644
index 0000000..c2b6b76
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-suncg3_1.1.1.bb
@@ -0,0 +1,2 @@
+require xorg-driver-video.inc
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-suncg6_1.1.1.bb b/recipes/xorg-driver/xf86-video-suncg6_1.1.1.bb
new file mode 100644
index 0000000..c2b6b76
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-suncg6_1.1.1.bb
@@ -0,0 +1,2 @@
+require xorg-driver-video.inc
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-sunffb_1.2.1.bb b/recipes/xorg-driver/xf86-video-sunffb_1.2.1.bb
new file mode 100644
index 0000000..c2b6b76
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-sunffb_1.2.1.bb
@@ -0,0 +1,2 @@
+require xorg-driver-video.inc
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-suntcx_1.1.1.bb b/recipes/xorg-driver/xf86-video-suntcx_1.1.1.bb
new file mode 100644
index 0000000..c2b6b76
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-suntcx_1.1.1.bb
@@ -0,0 +1,2 @@
+require xorg-driver-video.inc
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-tdfx_1.4.3.bb b/recipes/xorg-driver/xf86-video-tdfx_1.4.3.bb
new file mode 100644
index 0000000..fe52f5e
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-tdfx_1.4.3.bb
@@ -0,0 +1,12 @@
+require xorg-driver-video.inc
+PE = "1"
+
+#DESCRIPTION = ""
+
+DEPENDS += " drm xf86driproto"
+
+EXTRA_OECONF += " \
+  ac_cv_file__usr_include_xorg_dri_h=yes \
+  ac_cv_file__usr_include_xorg_sarea_h=yes \
+  ac_cv_file__usr_include_xorg_dristruct_h=yes \
+"
diff --git a/recipes/xorg-driver/xf86-video-tga_1.2.1.bb b/recipes/xorg-driver/xf86-video-tga_1.2.1.bb
new file mode 100644
index 0000000..d3cf65f
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-tga_1.2.1.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+
+PE = "1"
+
+DESCRIPTION = "DEC 21030 X11 driver"
+
+DEPENDS += " xf86dgaproto"
+
diff --git a/recipes/xorg-driver/xf86-video-trident_1.3.3.bb b/recipes/xorg-driver/xf86-video-trident_1.3.3.bb
new file mode 100644
index 0000000..fe37be5
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-trident_1.3.3.bb
@@ -0,0 +1,5 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.org X server -- Trident display driver"
+DEPENDS += " xf86dgaproto"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-tseng_1.2.3.bb b/recipes/xorg-driver/xf86-video-tseng_1.2.3.bb
new file mode 100644
index 0000000..843aa70
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-tseng_1.2.3.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+
+#DESCRIPTION = ""
+
+#DEPENDS += " "
diff --git a/recipes/xorg-driver/xf86-video-vesa_2.2.1.bb b/recipes/xorg-driver/xf86-video-vesa_2.2.1.bb
new file mode 100644
index 0000000..bd2f7cf
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-vesa_2.2.1.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+PE = "1"
+
+SRC_URI += "file://fix-includepath.patch;patch=1 \
+            file://fix-configure-includes.patch;patch=1"
+
+#DESCRIPTION = ""
+
+#DEPENDS += " "
diff --git a/recipes/xorg-driver/xf86-video-vmware_10.16.8.bb b/recipes/xorg-driver/xf86-video-vmware_10.16.8.bb
new file mode 100644
index 0000000..994b8b6
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-vmware_10.16.8.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+
+#DESCRIPTION = ""
+
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
diff --git a/recipes/xorg-driver/xf86-video-voodoo_1.2.3.bb b/recipes/xorg-driver/xf86-video-voodoo_1.2.3.bb
new file mode 100644
index 0000000..bfceb29
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-voodoo_1.2.3.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+
+DESCRIPTION = "X11 driver for Voodoo/Voodoo2"
+
+DEPENDS += " xf86dgaproto"
diff --git a/recipes/xorg-driver/xf86-video-wsfb_0.3.0.bb b/recipes/xorg-driver/xf86-video-wsfb_0.3.0.bb
new file mode 100644
index 0000000..ea1c005
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-wsfb_0.3.0.bb
@@ -0,0 +1,4 @@
+require xorg-driver-video.inc
+
+DESCRIPTION = "X.Org X server -- wsfb display driver"
+PE = "1"
diff --git a/recipes/xorg-driver/xf86-video-xgi_1.5.1.bb b/recipes/xorg-driver/xf86-video-xgi_1.5.1.bb
new file mode 100644
index 0000000..994b8b6
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-xgi_1.5.1.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+
+#DESCRIPTION = ""
+
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
diff --git a/recipes/xorg-driver/xf86-video-xgixp_1.7.99.4.bb b/recipes/xorg-driver/xf86-video-xgixp_1.7.99.4.bb
new file mode 100644
index 0000000..994b8b6
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-xgixp_1.7.99.4.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+
+#DESCRIPTION = ""
+
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
diff --git a/recipes/xorg-font/font-screen-cyrillic_1.0.1.bb b/recipes/xorg-font/font-screen-cyrillic_1.0.1.bb
new file mode 100644
index 0000000..60ef06f
--- /dev/null
+++ b/recipes/xorg-font/font-screen-cyrillic_1.0.1.bb
@@ -0,0 +1,2 @@
+require xorg-font-common.inc
+PE = "1"
diff --git a/recipes/xorg-font/font-util-native_1.0.2.bb b/recipes/xorg-font/font-util-native_1.0.2.bb
new file mode 100644
index 0000000..32ea62c
--- /dev/null
+++ b/recipes/xorg-font/font-util-native_1.0.2.bb
@@ -0,0 +1,8 @@
+inherit native
+require xorg-font-common.inc
+
+XORG_PN = "font-util"
+
+DEPENDS = "bdftopcf-native"
+
+PE = "1"
diff --git a/recipes/xorg-font/font-util_1.0.2.bb b/recipes/xorg-font/font-util_1.0.2.bb
new file mode 100644
index 0000000..3ba1c05
--- /dev/null
+++ b/recipes/xorg-font/font-util_1.0.2.bb
@@ -0,0 +1,11 @@
+require xorg-font-common.inc
+
+PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
+
+DESCRIPTION = "X font utils."
+
+DEPENDS = "encodings"
+RDEPENDS = "mkfontdir mkfontscale encodings"
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-lib/libapplewm_1.4.0.bb b/recipes/xorg-lib/libapplewm_1.4.0.bb
new file mode 100644
index 0000000..bc502fb
--- /dev/null
+++ b/recipes/xorg-lib/libapplewm_1.4.0.bb
@@ -0,0 +1,7 @@
+require xorg-lib-common.inc
+
+DEPENDS += "libxext applewmproto"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libAppleWM"
diff --git a/recipes/xorg-lib/libdmx_1.1.0.bb b/recipes/xorg-lib/libdmx_1.1.0.bb
new file mode 100644
index 0000000..9b66101
--- /dev/null
+++ b/recipes/xorg-lib/libdmx_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 Distributed Multihead extension library"
+DEPENDS += "libxext dmxproto"
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-lib/libfontenc-native_1.0.5.bb b/recipes/xorg-lib/libfontenc-native_1.0.5.bb
new file mode 100644
index 0000000..a907e08
--- /dev/null
+++ b/recipes/xorg-lib/libfontenc-native_1.0.5.bb
@@ -0,0 +1,8 @@
+require libfontenc_${PV}.bb
+
+DEPENDS = "zlib-native xproto-native"
+PE = "1"
+
+XORG_PN = "libfontenc"
+
+inherit native
diff --git a/recipes/xorg-lib/libfontenc_1.0.5.bb b/recipes/xorg-lib/libfontenc_1.0.5.bb
new file mode 100644
index 0000000..654fc72
--- /dev/null
+++ b/recipes/xorg-lib/libfontenc_1.0.5.bb
@@ -0,0 +1,7 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 font encoding library"
+LICENSE = "BSD-X"
+DEPENDS += "zlib xproto"
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-lib/libfs_1.0.2.bb b/recipes/xorg-lib/libfs_1.0.2.bb
new file mode 100644
index 0000000..2bc6b0a
--- /dev/null
+++ b/recipes/xorg-lib/libfs_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 Font Services library"
+DEPENDS += "xproto fontsproto xtrans"
+PE = "1"
+
+XORG_PN = "libFS"
diff --git a/recipes/xorg-lib/libice-native_1.0.6.bb b/recipes/xorg-lib/libice-native_1.0.6.bb
new file mode 100644
index 0000000..fd835b6
--- /dev/null
+++ b/recipes/xorg-lib/libice-native_1.0.6.bb
@@ -0,0 +1,8 @@
+require libice_${PV}.bb
+
+DEPENDS = "libx11-native xproto-native xtrans-native"
+PROVIDES = "ice-native"
+
+inherit native
+
+XORG_PN = "libICE"
diff --git a/recipes/xorg-lib/libice_1.0.6.bb b/recipes/xorg-lib/libice_1.0.6.bb
new file mode 100644
index 0000000..e4a6557
--- /dev/null
+++ b/recipes/xorg-lib/libice_1.0.6.bb
@@ -0,0 +1,9 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 Inter-Client Exchange library"
+DEPENDS += "xproto xtrans"
+PROVIDES = "ice"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libICE"
diff --git a/recipes/xorg-lib/libpciaccess_0.10.9.bb b/recipes/xorg-lib/libpciaccess_0.10.9.bb
new file mode 100644
index 0000000..26d1d95
--- /dev/null
+++ b/recipes/xorg-lib/libpciaccess_0.10.9.bb
@@ -0,0 +1,5 @@
+require xorg-lib-common.inc
+
+DEPENDS += "xproto virtual/libx11"
+
+PR="r1"
diff --git a/recipes/xorg-lib/libsm-native_1.1.1.bb b/recipes/xorg-lib/libsm-native_1.1.1.bb
new file mode 100644
index 0000000..78268a1
--- /dev/null
+++ b/recipes/xorg-lib/libsm-native_1.1.1.bb
@@ -0,0 +1,7 @@
+require libsm_${PV}.bb
+
+inherit native
+
+DEPENDS = "libx11-native libice-native xproto-native xtrans-native"
+
+XORG_PN = "libSM"
diff --git a/recipes/xorg-lib/libsm_1.1.1.bb b/recipes/xorg-lib/libsm_1.1.1.bb
new file mode 100644
index 0000000..7a30898
--- /dev/null
+++ b/recipes/xorg-lib/libsm_1.1.1.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 Session management library"
+DEPENDS += "libice xproto xtrans e2fsprogs-libs"
+PR = "r0"
+PE = "1"
+
+XORG_PN = "libSM"
diff --git a/recipes/xorg-lib/libwindowswm_1.0.1.bb b/recipes/xorg-lib/libwindowswm_1.0.1.bb
new file mode 100644
index 0000000..a03d495
--- /dev/null
+++ b/recipes/xorg-lib/libwindowswm_1.0.1.bb
@@ -0,0 +1,6 @@
+require xorg-lib-common.inc
+
+DEPENDS += "libxext windowswmproto"
+PE = "1"
+
+XORG_PN = "libWindowsWM"
diff --git a/recipes/xorg-lib/libx11-native_1.3.bb b/recipes/xorg-lib/libx11-native_1.3.bb
new file mode 100644
index 0000000..71b45af
--- /dev/null
+++ b/recipes/xorg-lib/libx11-native_1.3.bb
@@ -0,0 +1,8 @@
+require libx11_${PV}.bb
+
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libx11"
+
+DEPENDS = "xproto-native xextproto-native libxau-native xtrans-native libxdmcp-native xcmiscproto-native xf86bigfontproto-native kbproto-native inputproto-native bigreqsproto-native util-macros-native"
+PROVIDES = ""
+
+inherit native
diff --git a/recipes/xorg-lib/libx11/dolt-fix.patch b/recipes/xorg-lib/libx11/dolt-fix.patch
new file mode 100644
index 0000000..ea1a8bd
--- /dev/null
+++ b/recipes/xorg-lib/libx11/dolt-fix.patch
@@ -0,0 +1,21 @@
+diff -uNr libX11-1.2.99.901.orig/acinclude.m4 libX11-1.2.99.901/acinclude.m4
+--- libX11-1.2.99.901.orig/acinclude.m4	2009-09-05 10:57:11.000000000 +0200
++++ libX11-1.2.99.901/acinclude.m4	2009-09-05 10:59:14.000000000 +0200
+@@ -197,7 +197,7 @@
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -213,7 +213,7 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
diff --git a/recipes/xorg-lib/libx11/x11_disable_makekeys.1.6.3.patch b/recipes/xorg-lib/libx11/x11_disable_makekeys.1.6.3.patch
new file mode 100644
index 0000000..4358f79
--- /dev/null
+++ b/recipes/xorg-lib/libx11/x11_disable_makekeys.1.6.3.patch
@@ -0,0 +1,24 @@
+diff -uNr libX11-1.2.99.901.orig/src/util/Makefile.am libX11-1.2.99.901/src/util/Makefile.am
+--- libX11-1.2.99.901.orig/src/util/Makefile.am	2009-08-12 13:21:19.000000000 +0200
++++ libX11-1.2.99.901/src/util/Makefile.am	2009-08-12 13:22:21.000000000 +0200
+@@ -1,20 +1,3 @@
+ # $XdotOrg: lib/X11/src/util/Makefile.am,v 1.4 2006-02-19 02:14:12 jamey Exp $
+ 
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS=$(X11_CFLAGS)
+-
+-CC = @CC_FOR_BUILD@
+-
+ EXTRA_DIST = mkks.sh
+-
+-if LINT
+-# Check source code with tools like lint & sparse
+-
+-ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
+-		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
+-
+-lint:
+-	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
+-
+-endif LINT
diff --git a/recipes/xorg-lib/libx11_1.3.bb b/recipes/xorg-lib/libx11_1.3.bb
new file mode 100644
index 0000000..796ed1e
--- /dev/null
+++ b/recipes/xorg-lib/libx11_1.3.bb
@@ -0,0 +1,32 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "Base X libs."
+DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
+            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
+PROVIDES = "virtual/libx11"
+PE = "1"
+PR = "r3"
+
+XORG_PN = "libX11"
+
+SRC_URI += "file://x11_disable_makekeys.1.6.3.patch;patch=1 \
+            file://dolt-fix.patch;patch=1 \
+            file://keysymdef_include.patch;patch=1"
+
+EXTRA_OECONF += "--without-xcb --with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h"
+
+do_compile() {
+	(
+		unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS
+		cd src/util; 
+		mv makekeys.c.orig makekeys.c || true
+		touch makekeys-makekeys.o ; gcc makekeys.c -o makekeys
+		mv to stop it getting rebuilt
+		mv makekeys.c makekeys.c.orig
+		cd ../../
+	) || exit 1
+	oe_runmake
+}
+
+FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
+FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
diff --git a/recipes/xorg-lib/libxau-native_1.0.5.bb b/recipes/xorg-lib/libxau-native_1.0.5.bb
new file mode 100644
index 0000000..3fc07b6
--- /dev/null
+++ b/recipes/xorg-lib/libxau-native_1.0.5.bb
@@ -0,0 +1,9 @@
+require libxau_${PV}.bb
+
+DEPENDS = "xproto-native util-macros-native"
+PROVIDES = ""
+PR = "r1"
+
+XORG_PN = "libXau"
+
+inherit native
diff --git a/recipes/xorg-lib/libxau_1.0.5.bb b/recipes/xorg-lib/libxau_1.0.5.bb
new file mode 100644
index 0000000..3a77534
--- /dev/null
+++ b/recipes/xorg-lib/libxau_1.0.5.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "A Sample Authorization Protocol for X"
+DEPENDS += " xproto"
+PROVIDES = "xau"
+PE = "1"
+
+XORG_PN = "libXau"
diff --git a/recipes/xorg-lib/libxaw_1.0.6.bb b/recipes/xorg-lib/libxaw_1.0.6.bb
new file mode 100644
index 0000000..f45431e
--- /dev/null
+++ b/recipes/xorg-lib/libxaw_1.0.6.bb
@@ -0,0 +1,21 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X Athena Widget Set"
+DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
+PROVIDES = "xaw"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXaw"
+
+do_stage_append () {
+	ln -sf libXaw6.so.6 ${STAGING_LIBDIR}/libXaw.so.6
+	ln -sf libXaw7.so.7 ${STAGING_LIBDIR}/libXaw.so.7
+	ln -sf libXaw7.so.7 ${STAGING_LIBDIR}/libXaw.so
+}
+
+PACKAGES =+ "libxaw6 libxaw7 libxaw8"
+
+FILES_libxaw6 = "${libdir}/libXaw6.so.6*"
+FILES_libxaw7 = "${libdir}/libXaw7.so.7*"
+FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
diff --git a/recipes/xorg-lib/libxcomposite_0.4.1.bb b/recipes/xorg-lib/libxcomposite_0.4.1.bb
new file mode 100644
index 0000000..55a91b7
--- /dev/null
+++ b/recipes/xorg-lib/libxcomposite_0.4.1.bb
@@ -0,0 +1,9 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X Composite extension library."
+LICENSE= "BSD-X"
+DEPENDS += " compositeproto virtual/libx11 libxfixes libxext"
+PROVIDES = "xcomposite"
+PE = "1"
+
+XORG_PN = "libXcomposite"
diff --git a/recipes/xorg-lib/libxcursor-native_1.1.10.bb b/recipes/xorg-lib/libxcursor-native_1.1.10.bb
new file mode 100644
index 0000000..403030e
--- /dev/null
+++ b/recipes/xorg-lib/libxcursor-native_1.1.10.bb
@@ -0,0 +1,6 @@
+require libxcursor_${PV}.bb
+
+DEPENDS = "libx11-native fixesproto-native libxfixes-native"
+PE = "1"
+
+inherit native
diff --git a/recipes/xorg-lib/libxcursor_1.1.10.bb b/recipes/xorg-lib/libxcursor_1.1.10.bb
new file mode 100644
index 0000000..4713ecc
--- /dev/null
+++ b/recipes/xorg-lib/libxcursor_1.1.10.bb
@@ -0,0 +1,9 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X cursor management library"
+LICENSE= "BSD-X"
+DEPENDS += "libxrender libxfixes"
+PR = "r2"
+PE = "1"
+
+XORG_PN = "libXcursor"
diff --git a/recipes/xorg-lib/libxdamage_1.1.2.bb b/recipes/xorg-lib/libxdamage_1.1.2.bb
new file mode 100644
index 0000000..e56d1d0
--- /dev/null
+++ b/recipes/xorg-lib/libxdamage_1.1.2.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 damaged region extension library"
+LICENSE= "BSD-X"
+DEPENDS += "damageproto libxfixes"
+PROVIDES = "xdamage"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXdamage"
diff --git a/recipes/xorg-lib/libxdmcp-native_1.0.3.bb b/recipes/xorg-lib/libxdmcp-native_1.0.3.bb
new file mode 100644
index 0000000..873e939
--- /dev/null
+++ b/recipes/xorg-lib/libxdmcp-native_1.0.3.bb
@@ -0,0 +1,10 @@
+require libxdmcp_${PV}.bb
+
+DEPENDS = "xproto-native util-macros-native"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXdmcp"
+PROVIDES = ""
+
+inherit native
diff --git a/recipes/xorg-lib/libxdmcp_1.0.3.bb b/recipes/xorg-lib/libxdmcp_1.0.3.bb
new file mode 100644
index 0000000..0aa95b4
--- /dev/null
+++ b/recipes/xorg-lib/libxdmcp_1.0.3.bb
@@ -0,0 +1,9 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X Display Manager Control Protocol library"
+DEPENDS += "xproto"
+PROVIDES = "xdmcp"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXdmcp"
diff --git a/recipes/xorg-lib/libxext-native_1.1.bb b/recipes/xorg-lib/libxext-native_1.1.bb
new file mode 100644
index 0000000..531242e
--- /dev/null
+++ b/recipes/xorg-lib/libxext-native_1.1.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 miscellaneous extension library"
+DEPENDS += "xproto-native libx11-native xextproto-native libxau-native util-macros-native"
+PROVIDES = "xext-native"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXext"
+
+inherit native 
+
diff --git a/recipes/xorg-lib/libxext_1.1.bb b/recipes/xorg-lib/libxext_1.1.bb
new file mode 100644
index 0000000..81231a8
--- /dev/null
+++ b/recipes/xorg-lib/libxext_1.1.bb
@@ -0,0 +1,9 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 miscellaneous extension library"
+DEPENDS += "xproto virtual/libx11 xextproto libxau"
+PROVIDES = "xext"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXext"
diff --git a/recipes/xorg-lib/libxfixes-native_4.0.4.bb b/recipes/xorg-lib/libxfixes-native_4.0.4.bb
new file mode 100644
index 0000000..5ef6ded
--- /dev/null
+++ b/recipes/xorg-lib/libxfixes-native_4.0.4.bb
@@ -0,0 +1,6 @@
+require libxfixes_${PV}.bb
+
+DEPENDS = "libx11-native"
+PE = "1"
+
+inherit native
diff --git a/recipes/xorg-lib/libxfixes_4.0.4.bb b/recipes/xorg-lib/libxfixes_4.0.4.bb
new file mode 100644
index 0000000..5b2100a
--- /dev/null
+++ b/recipes/xorg-lib/libxfixes_4.0.4.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X Fixes extension library."
+LICENSE= "BSD-X"
+DEPENDS += "virtual/libx11 xproto fixesproto xextproto"
+PE = "1"
+
+XORG_PN = "libXfixes"
diff --git a/recipes/xorg-lib/libxfont-native_1.4.0.bb b/recipes/xorg-lib/libxfont-native_1.4.0.bb
new file mode 100644
index 0000000..efd1e07
--- /dev/null
+++ b/recipes/xorg-lib/libxfont-native_1.4.0.bb
@@ -0,0 +1,10 @@
+require libxfont_${PV}.bb
+
+DEPENDS = "xproto-native zlib-native fontcacheproto-native fontsproto-native \
+           libfontenc-native xtrans-native freetype-native util-macros-native"
+PE = "1"
+
+# no need for patch used in libxfont
+SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.bz2"
+
+inherit native
diff --git a/recipes/xorg-lib/libxfont_1.4.0.bb b/recipes/xorg-lib/libxfont_1.4.0.bb
new file mode 100644
index 0000000..a5afe7e
--- /dev/null
+++ b/recipes/xorg-lib/libxfont_1.4.0.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 font rasterisation library"
+LICENSE= "BSD-X"
+DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
+PROVIDES = "xfont"
+PE = "1"
+
+#SRC_URI += "file://no-scalable-crash.patch;patch=1"
+
+XORG_PN = "libXfont"
diff --git a/recipes/xorg-lib/libxfontcache_1.0.5.bb b/recipes/xorg-lib/libxfontcache_1.0.5.bb
new file mode 100644
index 0000000..ee999de
--- /dev/null
+++ b/recipes/xorg-lib/libxfontcache_1.0.5.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X-TrueType font cache extension client library"
+DEPENDS += "libxext fontcacheproto"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXfontcache"
diff --git a/recipes/xorg-lib/libxi_1.3.bb b/recipes/xorg-lib/libxi_1.3.bb
new file mode 100644
index 0000000..31e3b49
--- /dev/null
+++ b/recipes/xorg-lib/libxi_1.3.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 Input extension library"
+DEPENDS += "libxext inputproto"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXi"
diff --git a/recipes/xorg-lib/libxinerama_1.1.bb b/recipes/xorg-lib/libxinerama_1.1.bb
new file mode 100644
index 0000000..b7135bc
--- /dev/null
+++ b/recipes/xorg-lib/libxinerama_1.1.bb
@@ -0,0 +1,9 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 Xinerama extension library"
+DEPENDS += "libxext xineramaproto"
+PROVIDES = "xinerama"
+PR = "r3"
+PE = "1"
+
+XORG_PN = "libXinerama"
diff --git a/recipes/xorg-lib/libxkbfile-native_1.0.6.bb b/recipes/xorg-lib/libxkbfile-native_1.0.6.bb
new file mode 100644
index 0000000..27c5dce
--- /dev/null
+++ b/recipes/xorg-lib/libxkbfile-native_1.0.6.bb
@@ -0,0 +1,8 @@
+require libxkbfile_${PV}.bb
+
+DEPENDS = "libx11-native kbproto-native"
+PE = "1"
+
+XORG_PN = "libxkbfile"
+
+inherit native
diff --git a/recipes/xorg-lib/libxkbfile_1.0.6.bb b/recipes/xorg-lib/libxkbfile_1.0.6.bb
new file mode 100644
index 0000000..a404180
--- /dev/null
+++ b/recipes/xorg-lib/libxkbfile_1.0.6.bb
@@ -0,0 +1,7 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 keyboard file manipulation library"
+LICENSE= "GPL"
+DEPENDS += "virtual/libx11 kbproto"
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-lib/libxmu_1.0.5.bb b/recipes/xorg-lib/libxmu_1.0.5.bb
new file mode 100644
index 0000000..9a02bf8
--- /dev/null
+++ b/recipes/xorg-lib/libxmu_1.0.5.bb
@@ -0,0 +1,16 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 miscellaneous utility library"
+DEPENDS += "libxt libxext"
+PROVIDES = "xmu"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXmu"
+
+LEAD_SONAME = "libXmu"
+
+PACKAGES =+ "libxmuu libxmuu-dev"
+
+FILES_libxmuu = "${libdir}/libXmuu.so.*"
+FILES_libxmuu-dev = "${libdir}/libXmuu.so"
diff --git a/recipes/xorg-lib/libxrender-native_0.9.5.bb b/recipes/xorg-lib/libxrender-native_0.9.5.bb
new file mode 100644
index 0000000..a4f4ba9
--- /dev/null
+++ b/recipes/xorg-lib/libxrender-native_0.9.5.bb
@@ -0,0 +1,6 @@
+require libxrender_${PV}.bb
+
+DEPENDS = "libx11-native renderproto-native"
+PE = "1"
+
+inherit native
diff --git a/recipes/xorg-lib/libxrender_0.9.5.bb b/recipes/xorg-lib/libxrender_0.9.5.bb
new file mode 100644
index 0000000..ad833a8
--- /dev/null
+++ b/recipes/xorg-lib/libxrender_0.9.5.bb
@@ -0,0 +1,9 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 Rendering Extension client library"
+LICENSE = "BSD-X"
+DEPENDS += "virtual/libx11 renderproto xproto xdmcp"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXrender"
diff --git a/recipes/xorg-lib/libxscrnsaver_1.2.0.bb b/recipes/xorg-lib/libxscrnsaver_1.2.0.bb
new file mode 100644
index 0000000..ff22c33
--- /dev/null
+++ b/recipes/xorg-lib/libxscrnsaver_1.2.0.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X Screen Saver extension library"
+LICENSE = "GPL"
+DEPENDS += "libxext scrnsaverproto"
+PROVIDES = "libxss"
+RREPLACES = "libxss"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXScrnSaver"
diff --git a/recipes/xorg-lib/libxt-native_1.0.7.bb b/recipes/xorg-lib/libxt-native_1.0.7.bb
new file mode 100644
index 0000000..9745f65
--- /dev/null
+++ b/recipes/xorg-lib/libxt-native_1.0.7.bb
@@ -0,0 +1,8 @@
+require libxt_${PV}.bb
+
+DEPENDS = "libx11-native libsm-native kbproto-native"
+PROVIDES = "xt-native"
+
+inherit native
+
+XORG_PN = "libXt"
diff --git a/recipes/xorg-lib/libxt_1.0.7.bb b/recipes/xorg-lib/libxt_1.0.7.bb
new file mode 100644
index 0000000..4190a11
--- /dev/null
+++ b/recipes/xorg-lib/libxt_1.0.7.bb
@@ -0,0 +1,19 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 toolkit intrinsics library"
+DEPENDS += "libsm virtual/libx11 kbproto"
+PROVIDES = "xt"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXt"
+
+EXTRA_OECONF += "--disable-install-makestrs --disable-xkb"
+
+do_compile() {
+	(
+		unset CC LD CXX CCLD
+		oe_runmake -C util 'XT_CFLAGS=' 'CC=${BUILD_CC}' 'LD=${BUILD_LD}' 'CXX=${BUILD_CXX}' 'CCLD=${BUILD_CCLD}' 'CFLAGS=-D_GNU_SOURCE -I${STAGING_INCDIR_NATIVE} ${BUILD_CFLAGS}' 'LDFLAGS=${BUILD_LDFLAGS}' 'CXXFLAGS=${BUILD_CXXFLAGS}' 'CPPFLAGS=${BUILD_CPPFLAGS}' makestrs
+	) || exit 1
+	oe_runmake
+}
diff --git a/recipes/xorg-lib/libxtst_1.1.0.bb b/recipes/xorg-lib/libxtst_1.1.0.bb
new file mode 100644
index 0000000..174046f
--- /dev/null
+++ b/recipes/xorg-lib/libxtst_1.1.0.bb
@@ -0,0 +1,9 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X Test Extension: client side library"
+DEPENDS += "libxext recordproto inputproto libxi"
+PROVIDES = "xtst"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXtst"
diff --git a/recipes/xorg-lib/libxv_1.0.5.bb b/recipes/xorg-lib/libxv_1.0.5.bb
new file mode 100644
index 0000000..6014326
--- /dev/null
+++ b/recipes/xorg-lib/libxv_1.0.5.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 Video extension library"
+LICENSE = "GPL"
+DEPENDS += "libxext videoproto"
+PR = "r1"
+
+XORG_PN = "libXv"
diff --git a/recipes/xorg-lib/libxvmc_1.0.5.bb b/recipes/xorg-lib/libxvmc_1.0.5.bb
new file mode 100644
index 0000000..64943ce
--- /dev/null
+++ b/recipes/xorg-lib/libxvmc_1.0.5.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X Video Motion Compensation extension library"
+DEPENDS += "libxext libxv videoproto"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXvMC"
diff --git a/recipes/xorg-lib/libxxf86dga_1.1.1.bb b/recipes/xorg-lib/libxxf86dga_1.1.1.bb
new file mode 100644
index 0000000..47492d7
--- /dev/null
+++ b/recipes/xorg-lib/libxxf86dga_1.1.1.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 Direct Graphics Access extension library"
+DEPENDS += "libxext xf86dgaproto"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXxf86dga"
diff --git a/recipes/xorg-lib/libxxf86misc_1.0.2.bb b/recipes/xorg-lib/libxxf86misc_1.0.2.bb
new file mode 100644
index 0000000..d1f8719
--- /dev/null
+++ b/recipes/xorg-lib/libxxf86misc_1.0.2.bb
@@ -0,0 +1,9 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 XFree86 miscellaneous extension library"
+DEPENDS += "libxext xf86miscproto"
+PROVIDES = "xxf86misc"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "libXxf86misc"
diff --git a/recipes/xorg-lib/libxxf86vm_1.1.0.bb b/recipes/xorg-lib/libxxf86vm_1.1.0.bb
new file mode 100644
index 0000000..2d1af9c
--- /dev/null
+++ b/recipes/xorg-lib/libxxf86vm_1.1.0.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "X11 XFree86 video mode extension library"
+DEPENDS += "libxext xf86vidmodeproto"
+PR = "r0"
+PE = "1"
+
+XORG_PN = "libXxf86vm"
diff --git a/recipes/xorg-lib/pixman_0.16.2.bb b/recipes/xorg-lib/pixman_0.16.2.bb
new file mode 100644
index 0000000..9e25cd8
--- /dev/null
+++ b/recipes/xorg-lib/pixman_0.16.2.bb
@@ -0,0 +1,17 @@
+SECTION = "libs"
+PRIORITY = "optional"
+DESCRIPTION = "Low-level pixel manipulation library."
+LICENSE = "X11"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "http://cairographics.org/releases/pixman-${PV}.tar.gz \
+	  "
+
+inherit autotools
+
+AUTOTOOLS_STAGE_PKGCONFIG = "1"
+do_stage () {
+ 	autotools_stage_all
+}
+
diff --git a/recipes/xorg-lib/xtrans-native_1.2.4.bb b/recipes/xorg-lib/xtrans-native_1.2.4.bb
new file mode 100644
index 0000000..c7988c7
--- /dev/null
+++ b/recipes/xorg-lib/xtrans-native_1.2.4.bb
@@ -0,0 +1,5 @@
+require xtrans_${PV}.bb
+
+DEPENDS = "util-macros-native"
+
+inherit native
diff --git a/recipes/xorg-lib/xtrans_1.2.4.bb b/recipes/xorg-lib/xtrans_1.2.4.bb
new file mode 100644
index 0000000..81464f4
--- /dev/null
+++ b/recipes/xorg-lib/xtrans_1.2.4.bb
@@ -0,0 +1,14 @@
+require xorg-lib-common.inc
+
+DESCRIPTION = "network API translation layer to insulate X applications and \
+libraries from OS network vageries."
+PE = "1"
+PR = "r0"
+
+ALLOW_EMPTY = "1"
+
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/xtrans"
+
+RDEPENDS_${PN}-dev = ""
+
+XORG_PN = "xtrans"
diff --git a/recipes/xorg-proto/applewmproto_1.4.1.bb b/recipes/xorg-proto/applewmproto_1.4.1.bb
new file mode 100644
index 0000000..9f09fff
--- /dev/null
+++ b/recipes/xorg-proto/applewmproto_1.4.1.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/bigreqsproto-native_1.1.0.bb b/recipes/xorg-proto/bigreqsproto-native_1.1.0.bb
new file mode 100644
index 0000000..e864171
--- /dev/null
+++ b/recipes/xorg-proto/bigreqsproto-native_1.1.0.bb
@@ -0,0 +1,7 @@
+require bigreqsproto_${PV}.bb
+
+PR = "r1"
+
+XORG_PN = "bigreqsproto"
+
+inherit native
diff --git a/recipes/xorg-proto/bigreqsproto_1.1.0.bb b/recipes/xorg-proto/bigreqsproto_1.1.0.bb
new file mode 100644
index 0000000..ffe3bce
--- /dev/null
+++ b/recipes/xorg-proto/bigreqsproto_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
+
+XORG_PN = "bigreqsproto"
diff --git a/recipes/xorg-proto/compositeproto_0.4.1.bb b/recipes/xorg-proto/compositeproto_0.4.1.bb
new file mode 100644
index 0000000..b7bb50e
--- /dev/null
+++ b/recipes/xorg-proto/compositeproto_0.4.1.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+
+CONFLICTS = "compositeext"
+PE = "1"
+
+XORG_PN = "compositeproto"
diff --git a/recipes/xorg-proto/damageproto_1.2.0.bb b/recipes/xorg-proto/damageproto_1.2.0.bb
new file mode 100644
index 0000000..e7abb31
--- /dev/null
+++ b/recipes/xorg-proto/damageproto_1.2.0.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+
+CONFLICTS = "damageext"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "damageproto"
diff --git a/recipes/xorg-proto/dmxproto_2.3.bb b/recipes/xorg-proto/dmxproto_2.3.bb
new file mode 100644
index 0000000..9f09fff
--- /dev/null
+++ b/recipes/xorg-proto/dmxproto_2.3.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/dri2proto_2.1.bb b/recipes/xorg-proto/dri2proto_2.1.bb
new file mode 100644
index 0000000..a0e1fd3
--- /dev/null
+++ b/recipes/xorg-proto/dri2proto_2.1.bb
@@ -0,0 +1,3 @@
+DESCRIPTION = "DRI2 extension headers"
+
+require xorg-proto-common.inc
diff --git a/recipes/xorg-proto/evieext_1.1.0.bb b/recipes/xorg-proto/evieext_1.1.0.bb
new file mode 100644
index 0000000..9f09fff
--- /dev/null
+++ b/recipes/xorg-proto/evieext_1.1.0.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/fixesproto-native_4.1.1.bb b/recipes/xorg-proto/fixesproto-native_4.1.1.bb
new file mode 100644
index 0000000..927e004
--- /dev/null
+++ b/recipes/xorg-proto/fixesproto-native_4.1.1.bb
@@ -0,0 +1,7 @@
+require fixesproto_${PV}.bb
+
+PR = "r1"
+
+XORG_PN = "fixesproto"
+
+inherit native
diff --git a/recipes/xorg-proto/fixesproto_4.1.1.bb b/recipes/xorg-proto/fixesproto_4.1.1.bb
new file mode 100644
index 0000000..f9bc9d9
--- /dev/null
+++ b/recipes/xorg-proto/fixesproto_4.1.1.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+
+CONFLICTS = "fixesext"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "fixesproto"
diff --git a/recipes/xorg-proto/fontcacheproto-native_0.1.3.bb b/recipes/xorg-proto/fontcacheproto-native_0.1.3.bb
new file mode 100644
index 0000000..f6df67f
--- /dev/null
+++ b/recipes/xorg-proto/fontcacheproto-native_0.1.3.bb
@@ -0,0 +1,7 @@
+require fontcacheproto_${PV}.bb
+
+PR = "r1"
+
+XORG_PN = "fontcacheproto"
+
+inherit native
diff --git a/recipes/xorg-proto/fontcacheproto_0.1.3.bb b/recipes/xorg-proto/fontcacheproto_0.1.3.bb
new file mode 100644
index 0000000..9f09fff
--- /dev/null
+++ b/recipes/xorg-proto/fontcacheproto_0.1.3.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/fontsproto-native_2.1.0.bb b/recipes/xorg-proto/fontsproto-native_2.1.0.bb
new file mode 100644
index 0000000..4371a07
--- /dev/null
+++ b/recipes/xorg-proto/fontsproto-native_2.1.0.bb
@@ -0,0 +1,9 @@
+require fontsproto_${PV}.bb
+
+PR = "r1"
+
+XORG_PN = "fontsproto"
+
+S = "${WORKDIR}/fontsproto-${PV}"
+
+inherit native
diff --git a/recipes/xorg-proto/fontsproto_2.1.0.bb b/recipes/xorg-proto/fontsproto_2.1.0.bb
new file mode 100644
index 0000000..9f09fff
--- /dev/null
+++ b/recipes/xorg-proto/fontsproto_2.1.0.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/glproto_1.4.10.bb b/recipes/xorg-proto/glproto_1.4.10.bb
new file mode 100644
index 0000000..9f09fff
--- /dev/null
+++ b/recipes/xorg-proto/glproto_1.4.10.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/inputproto-native_2.0.bb b/recipes/xorg-proto/inputproto-native_2.0.bb
new file mode 100644
index 0000000..11e0dae
--- /dev/null
+++ b/recipes/xorg-proto/inputproto-native_2.0.bb
@@ -0,0 +1,7 @@
+require inputproto_${PV}.bb
+
+PR = "r1"
+
+XORG_PN = "inputproto"
+
+inherit native
diff --git a/recipes/xorg-proto/inputproto_2.0.bb b/recipes/xorg-proto/inputproto_2.0.bb
new file mode 100644
index 0000000..e3a8b09
--- /dev/null
+++ b/recipes/xorg-proto/inputproto_2.0.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
+
+XORG_PN = "inputproto"
diff --git a/recipes/xorg-proto/randrproto_1.3.1.bb b/recipes/xorg-proto/randrproto_1.3.1.bb
new file mode 100644
index 0000000..85000cc
--- /dev/null
+++ b/recipes/xorg-proto/randrproto_1.3.1.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+
+CONFLICTS = "randrext"
+PR = "r1"
+PE = "1"
+
+XORG_PN = "randrproto"
diff --git a/recipes/xorg-proto/recordproto_1.14.bb b/recipes/xorg-proto/recordproto_1.14.bb
new file mode 100644
index 0000000..af63403
--- /dev/null
+++ b/recipes/xorg-proto/recordproto_1.14.bb
@@ -0,0 +1,5 @@
+require xorg-proto-common.inc
+
+CONFLICTS = "recordext"
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/renderproto-native_0.11.bb b/recipes/xorg-proto/renderproto-native_0.11.bb
new file mode 100644
index 0000000..8d83c99
--- /dev/null
+++ b/recipes/xorg-proto/renderproto-native_0.11.bb
@@ -0,0 +1,7 @@
+require renderproto_${PV}.bb
+
+PR = "r1"
+
+XORG_PN = "renderproto"
+
+inherit native
diff --git a/recipes/xorg-proto/renderproto_0.11.bb b/recipes/xorg-proto/renderproto_0.11.bb
new file mode 100644
index 0000000..3d20b24
--- /dev/null
+++ b/recipes/xorg-proto/renderproto_0.11.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+CONFLICTS = "renderext"
+PE = "1"
diff --git a/recipes/xorg-proto/resourceproto_1.1.0.bb b/recipes/xorg-proto/resourceproto_1.1.0.bb
new file mode 100644
index 0000000..1fb8aa7
--- /dev/null
+++ b/recipes/xorg-proto/resourceproto_1.1.0.bb
@@ -0,0 +1,5 @@
+require xorg-proto-common.inc
+
+CONFLICTS = "resourceext"
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/scrnsaverproto_1.2.0.bb b/recipes/xorg-proto/scrnsaverproto_1.2.0.bb
new file mode 100644
index 0000000..9f09fff
--- /dev/null
+++ b/recipes/xorg-proto/scrnsaverproto_1.2.0.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/videoproto_2.3.0.bb b/recipes/xorg-proto/videoproto_2.3.0.bb
new file mode 100644
index 0000000..9f09fff
--- /dev/null
+++ b/recipes/xorg-proto/videoproto_2.3.0.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/windowswmproto_1.0.4.bb b/recipes/xorg-proto/windowswmproto_1.0.4.bb
new file mode 100644
index 0000000..9f09fff
--- /dev/null
+++ b/recipes/xorg-proto/windowswmproto_1.0.4.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/xcmiscproto-native_1.2.0.bb b/recipes/xorg-proto/xcmiscproto-native_1.2.0.bb
new file mode 100644
index 0000000..417a2aa
--- /dev/null
+++ b/recipes/xorg-proto/xcmiscproto-native_1.2.0.bb
@@ -0,0 +1,7 @@
+require xcmiscproto_${PV}.bb
+
+PR = "r1"
+
+XORG_PN = "xcmiscproto"
+
+inherit native
diff --git a/recipes/xorg-proto/xcmiscproto_1.2.0.bb b/recipes/xorg-proto/xcmiscproto_1.2.0.bb
new file mode 100644
index 0000000..8f48ecd
--- /dev/null
+++ b/recipes/xorg-proto/xcmiscproto_1.2.0.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
+
+XORG_PN = "xcmiscproto"
diff --git a/recipes/xorg-proto/xextproto-native_7.1.1.bb b/recipes/xorg-proto/xextproto-native_7.1.1.bb
new file mode 100644
index 0000000..ff2bc4f
--- /dev/null
+++ b/recipes/xorg-proto/xextproto-native_7.1.1.bb
@@ -0,0 +1,7 @@
+require xextproto_${PV}.bb
+
+PR = "r1"
+
+XORG_PN = "xextproto"
+
+inherit native
diff --git a/recipes/xorg-proto/xextproto_7.1.1.bb b/recipes/xorg-proto/xextproto_7.1.1.bb
new file mode 100644
index 0000000..3637929
--- /dev/null
+++ b/recipes/xorg-proto/xextproto_7.1.1.bb
@@ -0,0 +1,3 @@
+require xorg-proto-common.inc
+
+PE = "1"
diff --git a/recipes/xorg-proto/xf86bigfontproto-native_1.2.0.bb b/recipes/xorg-proto/xf86bigfontproto-native_1.2.0.bb
new file mode 100644
index 0000000..b0ac594
--- /dev/null
+++ b/recipes/xorg-proto/xf86bigfontproto-native_1.2.0.bb
@@ -0,0 +1,7 @@
+require xf86bigfontproto_${PV}.bb
+
+PR = "r1"
+
+XORG_PN = "xf86bigfontproto"
+
+inherit native
diff --git a/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb b/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb
new file mode 100644
index 0000000..f29fdb8
--- /dev/null
+++ b/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
+
+XORG_PN = "xf86bigfontproto"
diff --git a/recipes/xorg-proto/xf86dgaproto_2.1.bb b/recipes/xorg-proto/xf86dgaproto_2.1.bb
new file mode 100644
index 0000000..2e0e734
--- /dev/null
+++ b/recipes/xorg-proto/xf86dgaproto_2.1.bb
@@ -0,0 +1,5 @@
+require xorg-proto-common.inc
+
+CONFLICTS = "xxf86dgaext"
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/xf86driproto_2.1.0.bb b/recipes/xorg-proto/xf86driproto_2.1.0.bb
new file mode 100644
index 0000000..3637929
--- /dev/null
+++ b/recipes/xorg-proto/xf86driproto_2.1.0.bb
@@ -0,0 +1,3 @@
+require xorg-proto-common.inc
+
+PE = "1"
diff --git a/recipes/xorg-proto/xf86vidmodeproto_2.3.bb b/recipes/xorg-proto/xf86vidmodeproto_2.3.bb
new file mode 100644
index 0000000..946be11
--- /dev/null
+++ b/recipes/xorg-proto/xf86vidmodeproto_2.3.bb
@@ -0,0 +1,5 @@
+require xorg-proto-common.inc
+
+CONFLICTS = "xxf86vmext"
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/xineramaproto_1.2.bb b/recipes/xorg-proto/xineramaproto_1.2.bb
new file mode 100644
index 0000000..9f09fff
--- /dev/null
+++ b/recipes/xorg-proto/xineramaproto_1.2.bb
@@ -0,0 +1,4 @@
+require xorg-proto-common.inc
+
+PR = "r1"
+PE = "1"
diff --git a/recipes/xorg-proto/xproto-native_7.0.16.bb b/recipes/xorg-proto/xproto-native_7.0.16.bb
new file mode 100644
index 0000000..cc7b6f6
--- /dev/null
+++ b/recipes/xorg-proto/xproto-native_7.0.16.bb
@@ -0,0 +1,5 @@
+require xproto_${PV}.bb
+
+DEPENDS += "util-macros-native"
+
+inherit native
diff --git a/recipes/xorg-proto/xproto_7.0.16.bb b/recipes/xorg-proto/xproto_7.0.16.bb
new file mode 100644
index 0000000..513c78b
--- /dev/null
+++ b/recipes/xorg-proto/xproto_7.0.16.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+
+PR = "r0"
+PE = "1"
+
+DEPENDS += "util-macros"
+
+XORG_PN = "xproto"
diff --git a/recipes/xorg-util/util-macros-native_1.3.0.bb b/recipes/xorg-util/util-macros-native_1.3.0.bb
new file mode 100644
index 0000000..618e78f
--- /dev/null
+++ b/recipes/xorg-util/util-macros-native_1.3.0.bb
@@ -0,0 +1,7 @@
+require util-macros_${PV}.bb
+
+inherit native
+
+XORG_PN = "util-macros"
+
+S = "${WORKDIR}/util-macros-${PV}"
diff --git a/recipes/xorg-util/util-macros_1.3.0.bb b/recipes/xorg-util/util-macros_1.3.0.bb
new file mode 100644
index 0000000..4775fc6
--- /dev/null
+++ b/recipes/xorg-util/util-macros_1.3.0.bb
@@ -0,0 +1,6 @@
+require xorg-util-common.inc
+
+DESCRIPTION = "X autotools macros"
+PE = "1"
+
+ALLOW_EMPTY = "1"
diff --git a/recipes/xorg-xserver/xorg-xserver-common.inc b/recipes/xorg-xserver/xorg-xserver-common.inc
index cfd350e..a6cfa09 100644
--- a/recipes/xorg-xserver/xorg-xserver-common.inc
+++ b/recipes/xorg-xserver/xorg-xserver-common.inc
@@ -47,7 +47,7 @@ FILES_${PN}-sdl = "${bindir}/Xsdl"
 FILES_${PN}-xprint = "${libdir}/X11/xserver/*/print"
 FILES_${PN}-xvfb = "${bindir}/Xvfb"
 FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
-FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules ${libdir}/xorg/modules /etc/X11 "
+FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules ${libdir}/xorg/modules /etc/X11 ${libdir}/xorg/protocol.txt"
 FILES_${PN}-doc += "${libdir}/X11/doc /usr/share/X11/xkb/compiled/README.compiled"
 FILES_${PN}-xephyr = "${bindir}/Xephyr"
 
@@ -67,6 +67,7 @@ FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
 #  84.0k   libxf4bpp.so
 
 PACKAGES =+ "${PN}-extension-dri \
+             ${PN}-extension-dri2 \
              ${PN}-extension-glx \
              ${PN}-module-libint10 \
              ${PN}-module-libafb \
@@ -78,6 +79,7 @@ PACKAGES =+ "${PN}-extension-dri \
              ${PN}-module-libxf4bpp"
 
 FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
+FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
 FILES_${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
 FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
 FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.0/randr-support-1.7.0.patch b/recipes/xorg-xserver/xserver-xorg-1.7.0/randr-support-1.7.0.patch
new file mode 100644
index 0000000..fb8d381
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.7.0/randr-support-1.7.0.patch
@@ -0,0 +1,96 @@
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c
+--- xorg-server-1.7.0.orig/hw/xfree86/common/xf86Xinput.c	2009-09-24 07:12:00.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/common/xf86Xinput.c	2009-10-08 11:45:50.000000000 +0200
+@@ -95,6 +95,8 @@
+ 
+ #include "os.h"
+ 
++#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
++
+ EventListPtr xf86Events = NULL;
+ 
+ /**
+@@ -1086,4 +1088,67 @@
+     EnableDevice(dev, TRUE);
+ }
+ 
++/* Taken from evdev-properties.h. */
++#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
++#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
++
++/* This is a hack until we get device -> CRTC association. */
++void
++xf86InputRotationNotify(Rotation rotation)
++{
++    DeviceIntPtr dev;
++    LocalDevicePtr local;
++    int ret;
++    int swap_axes = 0;
++    CARD8 invert[2] = { 0, 0 };
++    static Atom prop_swap = 0, prop_invert = 0;
++    static int atom_generation = -1;
++    
++    if (atom_generation != serverGeneration) {
++        prop_swap = 0;
++        prop_invert = 0;
++    }
++
++    switch (rotation & RR_Rotate_All) {
++    case RR_Rotate_0:
++        break;
++    case RR_Rotate_90:
++        swap_axes = 1;
++        invert[0] = 1;
++        break;
++    case RR_Rotate_180:
++        invert[0] = 1;
++        invert[1] = 1;
++        break;
++    case RR_Rotate_270:
++        swap_axes = 1;
++        invert[1] = 1;
++        break;
++    }
++
++    if (!prop_swap)
++        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
++                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
++    if (!prop_invert)
++        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
++                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
++
++    for (dev = inputInfo.devices; dev; dev = dev->next) {
++        local = dev->public.devicePrivate;
++        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
++                                     PropModeReplace, 1, &swap_axes, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
++            continue;
++        }
++        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
++                                     PropModeReplace, 2, invert, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing invert property failed!\n");
++            continue;
++        }
++    }
++}
++
++
+ /* end of xf86Xinput.c */
+diff -Nur xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c
+--- xorg-server-1.7.0.orig/hw/xfree86/modes/xf86Crtc.c	2009-10-01 08:27:36.000000000 +0200
++++ xorg-server-1.7.0/hw/xfree86/modes/xf86Crtc.c	2009-10-08 11:28:42.000000000 +0200
+@@ -391,6 +391,12 @@
+     if (didLock)
+ 	crtc->funcs->unlock (crtc);
+ 
++    /*
++     * Rotate Touchscreen
++     */
++    xf86InputRotationNotify(crtc->rotation);
++
++    
+     return ret;
+ }
+ 
diff --git a/recipes/xorg-xserver/xserver-xorg_1.7.0.bb b/recipes/xorg-xserver/xserver-xorg_1.7.0.bb
new file mode 100644
index 0000000..58b3614
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg_1.7.0.bb
@@ -0,0 +1,19 @@
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl dri2proto glproto mesa xorg-minimal-fonts"
+PE = "2"
+PR = "r1"
+
+SRC_URI += "file://sysroot_fix.patch;patch=1 \
+            file://dolt-fix.patch;patch=1 \
+            file://randr-support-1.7.0.patch;patch=1 \
+           "
+do_install_prepend() {
+        mkdir -p ${D}/${libdir}/X11/fonts
+}
+
+EXTRA_OECONF += "--disable-xephyr --disable-config-hal --disable-xinerama --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " --disable-glx-tls --enable-dri2 --disable-unit-tests "
+
+export LDFLAGS += " -ldl "
-- 
1.6.5.rc2




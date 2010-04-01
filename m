Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NxM6l-0002pZ-DU
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 17:16:01 +0200
Received: by fg-out-1718.google.com with SMTP id e12so741102fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=3gfcajnnJDwyD4s776WL0zmJGCbm9HHWisBz+m3iY1c=;
	b=LBAe8tHDSUgSMv9pZGzffZnvq3ioFj2y8383kwSEQA4I5upB7CZQahgKPeJYtQCDiw
	vWfKxpgimXIzMjLkiYnnctdHZeG6XwWnzDCnl3InmTOqxVCns7xXw1v8QS4ALI+RMNz8
	vmVJA9BtQQNnF+gk8sYvqTr+W4BxVdEYyCr/w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kyYUCOpxFGRKhkMEqANJuoR0erdXV+7PWOsjFMRc/7ouDAPsp0J4kcCsrBhkbw4+2c
	S5kVqfmt1eo0OZjjNWAiNO+aMaeMMqg+BmzFB5hLUqIaoWxmXKiTJ4ap1L3pGXesgdoZ
	6LtHIxrE8BiYN0n9t4v/v7ObW9u3vwuhm3S70=
Received: by 10.87.71.7 with SMTP id y7mr2193643fgk.63.1270134704591;
	Thu, 01 Apr 2010 08:11:44 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm5658441fxm.12.2010.04.01.08.11.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Apr 2010 08:11:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Apr 2010 17:11:51 +0200
Message-Id: <1270134711-32158-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.3
In-Reply-To: <1270134711-32158-1-git-send-email-Martin.Jansa@gmail.com>
References: <1270134711-32158-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] sane-srcrevs: move SRCREVs to recipes
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
X-List-Received-Date: Thu, 01 Apr 2010 15:16:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/sane-srcrevs.inc               |  123 +-------------------
 recipes/accelges/accelges_svn.bb                   |    2 +
 recipes/aircrack/aircrack-ng_1.0-svn.bb            |    2 +
 recipes/bootchart-lite/bootchart-lite_svn.bb       |    1 +
 recipes/cdparanoia/cdparanoia_svn.bb               |    1 +
 recipes/clutter/clutter-box2d_svn.bb               |    1 +
 recipes/clutter/clutter-cairo_svn.bb               |    1 +
 recipes/clutter/clutter-gst_svn.bb                 |    1 +
 recipes/clutter/clutter_0.4svn.bb                  |    1 +
 recipes/clutter/clutter_0.6svn.bb                  |    1 +
 recipes/clutter/clutter_svn.bb                     |    1 +
 recipes/clutter/table_svn.bb                       |    1 +
 recipes/comic-reader/comic-reader_svn.bb           |    2 +-
 recipes/dasher/dasher-gpe_0.0-svn.bb               |    1 +
 recipes/dbus/dbus-c++_svn.bb                       |    1 +
 recipes/ebrainy/ebrainy_svn.bb                     |    1 +
 recipes/eds/eds-dbus_svn.bb                        |    1 +
 recipes/epdfview/epdfview_svn.bb                   |    1 +
 recipes/ezx/ezx-boot-usb-native_svn.bb             |    1 +
 recipes/ezx/ezx-gen-blob_svn.bb                    |    4 +-
 recipes/ezx/ezx-gpiotool_1877.bb                   |   26 ----
 recipes/ezx/ezx-gpiotool_svn.bb                    |   28 +++++
 recipes/ezx/ezxd_svn.bb                            |    1 +
 recipes/fbgrab/fbgrab-viewer-native_1.0.bb         |    1 +
 recipes/flashrom/flashrom_svn.bb                   |    1 +
 recipes/fstests/fstests.bb                         |   20 ---
 recipes/fstests/fstests_svn.bb                     |   22 ++++
 recipes/gabriel/gabriel_svn.bb                     |    1 +
 recipes/gnet/gnet_svn.bb                           |    1 +
 recipes/gnome/epiphany_svn.bb                      |    1 +
 recipes/gnome/gconf-dbus_svn.bb                    |    2 +
 recipes/gpe-conf/gpe-conf_svn.bb                   |    1 +
 recipes/gpe-contacts/gpe-contacts_svn.bb           |    1 +
 recipes/gpe-gallery/gpe-gallery_svn.bb             |    1 +
 recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb  |    2 +-
 recipes/gpe-mini-browser/gpe-mini-browser_svn.bb   |    2 +
 recipes/gpe-sketchbook/gpe-sketchbook_svn.bb       |    1 +
 recipes/gpephone/contact_svn.bb                    |    1 +
 recipes/gpephone/libcalenabler2_svn.bb             |    4 +-
 recipes/gpephone/libiac2_svn.bb                    |    4 +-
 recipes/gpephone/libiac_svn.bb                     |    4 +-
 recipes/gsm/gsmd.inc                               |    1 +
 recipes/gtk-webcore/osb-browser_svn.bb             |    1 +
 recipes/gtk-webcore/osb-jscore_svn.bb              |    1 +
 recipes/gtk-webcore/osb-nrcit_svn.bb               |    1 +
 recipes/gtk-webcore/osb-nrcore_svn.bb              |    1 +
 recipes/gtkhtml2/gtkhtml2_svn.bb                   |    1 +
 recipes/kismet/kismet-newcore_svn.bb               |    1 +
 recipes/kismet/kismet_svn.bb                       |    1 +
 recipes/libfakekey/libfakekey_svn.bb               |    1 +
 recipes/libowl/libowl_svn.bb                       |    1 +
 recipes/librfid/librfid_svn.bb                     |    1 +
 recipes/libw100/libw100_svn.bb                     |    1 +
 recipes/libxosd/libxosd_svn.bb                     |    1 +
 recipes/linux/linux-bfin_svn.bb                    |    1 +
 recipes/linux/linux-hackndev-2.6_git.bb            |    3 +
 recipes/linux/linux-ixp4xx.inc                     |    1 +
 recipes/llvm/llvm-gcc4-cross_svn.bb                |    1 +
 recipes/llvm/llvm-gcc4_svn.bb                      |    1 +
 recipes/maemo-mapper/maemo-mapper_svn.bb           |    1 +
 .../matchbox-config-gtk/matchbox-config-gtk_svn.bb |    1 +
 .../matchbox-keyboard-inputmethod_svn.bb           |    1 +
 recipes/matchbox-keyboard/matchbox-keyboard_svn.bb |    1 +
 recipes/matchbox-stroke/matchbox-stroke_svn.bb     |    1 +
 recipes/matchbox-terminal/matchbox-terminal_svn.bb |    1 +
 recipes/matchbox2/matchbox-desktop-2_svn.bb        |    1 +
 .../matchbox-panel-2-icon-themes_0.0.1.bb          |    1 +
 recipes/matchbox2/matchbox-panel-2_svn.bb          |    1 +
 recipes/matchbox2/matchbox-wm-2_svn.bb             |    1 +
 recipes/mplayer/mplayer-maemo_svn.bb               |    1 +
 recipes/multitap-pad/multitap-pad_svn.bb           |    1 +
 recipes/net-snmp/libsnmp-perl_svn.bb               |    1 +
 recipes/net-snmp/net-snmp_svn.bb                   |    1 +
 recipes/netsurf/netsurf_svn.bb                     |    1 +
 recipes/openocd/openocd_svn.bb                     |    1 +
 recipes/opkg-utils/opkg-utils-native_svn.bb        |    1 +
 recipes/opkg-utils/opkg-utils_svn.bb               |    1 +
 recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb       |    2 -
 recipes/opkg/opkg-nogpg-nocurl_svn.bb              |    2 -
 recipes/opkg/opkg-nogpg_svn.bb                     |    2 -
 recipes/opkg/opkg.inc                              |    1 +
 recipes/oprofile/oprofileui-svn.inc                |    1 +
 recipes/portaudio/portaudio-v19_svn.bb             |    1 +
 recipes/psplash/psplash.inc                        |    1 +
 recipes/puzzles/oh-puzzles_svn.bb                  |    1 +
 recipes/pythm/pythm_svn.bb                         |    1 +
 recipes/python/python-coherence_svn.bb             |    1 +
 recipes/python/python-connexion_svn.bb             |    1 +
 recipes/python/python-pyyaml_svn.bb                |    1 +
 recipes/settings-daemon/settings-daemon_svn.bb     |    1 +
 recipes/socketcan/socketcan-modules_svn.bb         |    1 +
 recipes/socketcan/socketcan-utils-test_svn.bb      |    1 +
 recipes/sphyrna/sphyrna-python_svn.bb              |    1 +
 recipes/tinymail/tmut_svn.bb                       |    1 +
 recipes/tslib/tslib_svn.bb                         |    1 +
 recipes/u-boot/u-boot-bug_svn.bb                   |    2 +-
 recipes/uclibc/bfin-uclibc_svn.bb                  |    1 +
 recipes/uclibc/elf2flt_svn.bb                      |    1 +
 recipes/usbpath/usbpath_svn.bb                     |    1 +
 recipes/wlan-ng/wlan-ng-modules_svn.bb             |    1 +
 recipes/wlan-ng/wlan-ng-utils_svn.bb               |    1 +
 recipes/xoo/xoo_svn.bb                             |    1 +
 102 files changed, 160 insertions(+), 180 deletions(-)
 delete mode 100644 recipes/ezx/ezx-gpiotool_1877.bb
 create mode 100644 recipes/ezx/ezx-gpiotool_svn.bb
 delete mode 100644 recipes/fstests/fstests.bb
 create mode 100644 recipes/fstests/fstests_svn.bb

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index fa62616..5f35c8b 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -1,40 +1,16 @@
-# Generated with 
-# bitbake -s | grep svnr  | awk '{print "SRCREV_pn-" $1 "=" $2}' | \
-# sed -e s:\+:\=:g -e s:svnr::g| awk -F "=" '{print $1 " ?=\" " $3}' | \
-# awk -F "-r" '{print $1"\""}'
-
-# This will miss recipes that have skippackage set (e.g. uclibc)
-
 # this is alphabetical!
+# only SRCREVs included in more recipes should be here, otherwise put sane SRCREV to recipe directly
 
-# yes, really!
-
-# you know what that means? like... a, b, c, d, e, f, g...
-
-SRCREV_pn-accelges ?= "206"
 SRCREV_pn-advancedcaching ?= "9c3661f5573d2dd712437f1590070153d12e4c02"
-SRCREV_pn-aircrack-ng ?= "802"
 SRCREV_pn-alsa-scenario ?= "8bd7f83d847424eb44704cf1649974b2fda8d8f1"
 SRCREV_pn-aufs2-util ?= "f35ba2292fe40aa94aa83713e0b2719f35a25768"
-SRCREV_pn-bfin-uclibc ?= "1857"
 SRCREV_pn-blipomoko ?= "93295f36f7b45c691df247cb2a65227facf13654"
-SRCREV_pn-bootchart-lite ?= "4"
 SRCREV_pn-bt-configure ?= "9654c88ff74bca89cf747937cbec67421d2f1cbc"
 SRCREV_pn-calc ?= "cff7c833d4fce0d39de0812bfc9ed9e0eb8fac09"
 SRCREV_pn-calibrateproto ?= "1da6fd1e2c7a49648245c98481fabea8b9690a8c"
-SRCREV_pn-cdparanoia ?= "16684"
-SRCREV_pn-clutter ?= "3240"
-SRCREV_pn-clutter-box2d ?= "3197"
-SRCREV_pn-clutter-cairo ?= "3210"
-SRCREV_pn-clutter-gst ?= "3188"
 SRCREV_pn-clutter-gtk ?= "70f4b0cbd568dfa265484a03be3bd08ad15ed12e"
 SRCREV_pn-clutter-gtk-0.6 ?= "2ba362a1a223c2b28541030a80aa11191615340a"
 SRCREV_pn-clutter-gtk-0.8 ?= "7d3c3230376e731c06c21afa9d8c1d44dbea27cd"
-SRCREV_pn-comic-reader ?= "54"
-SRCREV_pn-contact ?= "1410"
-SRCREV_pn-dasher-gpe ?= "1251"
-SRCREV_pn-dbus-c++ ?= "13131"
-SRCREV_pn-dbus-c++-native ?= "13131"
 SRCREV_pn-disko ?= "f52597b8d5d584811cbe8f9e0bf25ea372526953"
 SRCREV_pn-e-wm-illume-dict-pl ?= "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
 SRCREV_pn-e-wm-menu-shr ?= "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
@@ -43,133 +19,51 @@ SRCREV_pn-e-wm-theme-illume-gry ?= "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
 SRCREV_pn-e-wm-theme-illume-niebiee ?= "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
 SRCREV_pn-e-wm-theme-illume-shr ?= "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
 SRCREV_pn-e-wm-theme-illume-sixteen ?= "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-SRCREV_pn-ebrainy ?= "21"
-SRCREV_pn-eds-dbus ?= "736"
 SRCREV_pn-elementary-theme-gry ?= "2b62d1c9b02da047071105a7b5695acd6c6dbcca"
 SRCREV_pn-elementary-theme-niebiee ?= "2ac643cc273d144bb731a8cbb8ec6b3615de43a0"
 SRCREV_pn-elementary-theme-sixteen ?= "2ac643cc273d144bb731a8cbb8ec6b3615de43a0"
-SRCREV_pn-elf2flt ?= "1786"
-SRCREV_pn-epdfview ?= "346"
-SRCREV_pn-epiphany ?= "7837"
-SRCREV_pn-ezx-boot-usb-native ?= "2512"
-SRCREV_pn-ezx-gen-blob ?= "2517"
-SRCREV_pn-ezxd ?= "2513"
-SRCREV_pn-fbgrab-viewer-native ?= "1943"
-SRCREV_pn-flashrom ?= "3682"
 SRCREV_pn-fsod ?= "2a33e5ffe96c611e6a6b8b6c33d2a83ba656f55b"
-SRCREV_pn-fstests ?= "204"
-SRCREV_pn-gabriel ?= "38"
-SRCREV_pn-gabriel-native ?= "38"
-SRCREV_pn-gconf-dbus ?= "641"
 SRCREV_pn-glamo-dri-tests ?= "080b8db3d9dbfae38ebb00439887b5535ab1d380"
-SRCREV_pn-gnet ?= "495"
-SRCREV_pn-gpe-conf ?= "9900"
-SRCREV_pn-gpe-contacts ?= "9312"
-SRCREV_pn-gpe-gallery ?= "9376"
-SRCREV_pn-gpe-mini-browser2 ?= "9900"
-SRCREV_pn-gpe-sketchbook ?= "9547"
-SRCREV_pn-gtkhtml2 ?= "1158"
-SRCREV_pn-gypsy ?= "134"
-SRCREV_pn-hildon-1 ?= "14429"
 SRCREV_pn-illume-theme-freesmartphone ?= "b1b0f6adc59e6f72a3929771058e3750bf181bc5"
-SRCREV_pn-kismet ?= "2285"
-SRCREV_pn-kismet-newcore ?= "2285"
-SRCREV_pn-libcalenabler2 ?= "1410"
-SRCREV_pn-libfakekey ?= "1455"
 SRCREV_pn-libgdbus ?= "aeab6e3c0185b271ca343b439470491b99cc587f"
 SRCREV_pn-libgee ?= "a86abd4240622ec377bbc5773850a4593e13f7eb"
 SRCREV_pn-libgee-native ?= "a86abd4240622ec377bbc5773850a4593e13f7eb"
-SRCREV_pn-libgsmd ?= "4505"
-SRCREV_pn-libiac ?= "1590"
 SRCREV_pn-libmodulo ?= "7d2f657d248bd86377e66c329aa6826459d406da"
 SRCREV_pn-libnl2 ?= "8808743839b0f459394ecd00cb0f7c1896c0ab7a"
-SRCREV_pn-libowl ?= "277"
 SRCREV_pn-libphone-ui ?= "08ccc9710b1f33c93cc8f1c20be9c658ef5040dd"
 SRCREV_pn-libphone-ui-shr ?= "2106165a2be62053f9d0019d50813823a84b8421"
-SRCREV_pn-librfid ?= "2094"
-SRCREV_pn-libsnmp-perl ?= "17367"
 SRCREV_pn-libsynthesis ?= "70f0065aa3b085bdf059830f95e5b5766eecb0bb"
-SRCREV_pn-libw100 ?= "47"
 SRCREV_pn-libxcalibrate ?= "209d83af61ed38a002c8096377deac292b3e396c"
-SRCREV_pn-libxosd ?= "627"
-SRCREV_pn-linux-bfin ?= "3758"
 SRCREV_pn-linux-eten ?= "ab2d414f4f13816af0ec0401b608133ca946624a"
-SRCREV_pn-linux-hackndev-2.6 ?= "1308"
-SRCREV_pn-linux-ixp4xx ?= "1089"
 SRCREV_pn-linux-sgh-i900 ?= "7e5f8bd3864485e5fc66cb946e09f18b5a32cebc"
-SRCREV_pn-llvm-gcc4 ?= "374"
-SRCREV_pn-llvm-gcc4-cross ?= "374"
 SRCREV_pn-madbutterfly ?= "ecd1842714b5e982f3138cbdd358517d57be6aa3"
-SRCREV_pn-maemo-mapper ?= "118"
 SRCREV_pn-mamona-input-methods ?= "4a8f11973021b8b4f157f5743e00f9f9a3c4802b"
 SRCREV_pn-mamonaim-e-applet ?= "a1ba7e8a388ffce3cca92bad059cd801e7733a7a"
-SRCREV_pn-matchbox-config-gtk ?= "1614"
-SRCREV_pn-matchbox-desktop-2 ?= "2096"
-SRCREV_pn-matchbox-keyboard ?= "1910"
-SRCREV_pn-matchbox-keyboard-inputmethod ?= "1910"
-SRCREV_pn-matchbox-panel-2 ?= "2098"
-SRCREV_pn-matchbox-panel-2-icon-themes ?= "1907"
-SRCREV_pn-matchbox-stroke ?= "1820"
-SRCREV_pn-matchbox-terminal ?= "1612"
-SRCREV_pn-matchbox-wm-2 ?= "2087"
 SRCREV_pn-midori ?= "400139644371c0b675723f9a986ddab4445a8794"
 SRCREV_pn-mobile-broadband-provider-info ?= "bc536218490377ccbd09c4e5858d37c91c2f03f7"
 SRCREV_pn-moblin-proto ?= "8f2cb524fe06555182c25b4ba3202d7b368ac0ce"
-SRCREV_pn-mpd-alsa ?= "6952"
-SRCREV_pn-mplayer-maemo ?= "342"
 SRCREV_pn-msn-pecan ?= "e795b33b29d792f19fcf699275eb966dc68be257"
-SRCREV_pn-multitap-pad ?= "373"
 SRCREV_pn-mux ?= "72460e890dbb15edbf7dc193116be0dcf9794a8b"
-SRCREV_pn-net-snmp ?= "17367"
-SRCREV_pn-netsurf ?= "3859"
-SRCREV_pn-oh-puzzles ?= "22"
 SRCREV_pn-ohm ?= "edfe25d49d67884bf004de7ae0724c162bb5e65e"
 SRCREV_pn-ologicd ?= "4a32af91a9479ebd4d1d39057354ac9904d74cbb"
 SRCREV_pn-om-locations ?= "942e88a1b689ffe3f11a2d982cce389cc965b2ec"
 SRCREV_pn-openbsc ?= "5e68183a201ab92f29cd2467df5209f7b351a66d"
 SRCREV_pn-openbsc-onwaves ?= "0d9ed87d5c7d5b6e21dc3bbb282e215068742566"
 SRCREV_pn-openezx-kernel ?= "b390bb1ee708277297fdfd38e26d955b17d81c2e"
-SRCREV_pn-openmoko-footer ?= "2354"
-SRCREV_pn-openmoko-terminal2 ?= "4782"
 SRCREV_pn-openmoocow ?= "39648419825cddfea1cb1321e552a12b71fede14"
-SRCREV_pn-openocd ?= "517"
-SRCREV_pn-openocd-native ?= "517"
 SRCREV_pn-opimd-utils ?= "1872cdebe1209123710259e25cb8c8b47a627112"
-SRCREV_pn-opkg ?= "527"
-SRCREV_pn-opkg-native ?= "526"
-SRCREV_pn-opkg-sdk ?= "526"
-SRCREV_pn-opkg-utils ?= "4578"
-SRCREV_pn-opkg-utils-native ?= "4595"
-SRCREV_pn-oprofileui ?= "173"
-SRCREV_pn-osb-browser ?= "125"
-SRCREV_pn-osb-jscore ?= "117"
-SRCREV_pn-osb-nrcit ?= "125"
-SRCREV_pn-osb-nrcore ?= "126"
 SRCREV_pn-packagekit ?= "96823118e98515dd41748e8c7bdb9cf7b1d4a95f"
 SRCREV_pn-paroli ?= "bb9fb1969acdfbaa48b55902675a6d8949014c6d"
 SRCREV_pn-phonefsod ?= "de3eab1df1682cb41abfd105bb6767fedfbbf7b4"
 SRCREV_pn-phoneui-apps ?= "d349e764400d7a4eaaa12f359d6c64b3ca55faaf"
 SRCREV_pn-phoneuid ?= "30e063783b4b3fe5a411e7739d76dc85129452aa"
-SRCREV_pn-portaudio-v19 ?= "1387"
-SRCREV_pn-psplash ?= "249"
 SRCREV_pn-pty-forward-native ?= "4662b55fdba528bb5b3349f83055bf236af5d63b"
 SRCREV_pn-pygsm ?= "976477f6b403f422b4ea730f71ebf409f6671141"
 SRCREV_pn-pyphonelog ?= "d631b6242b75ce49e2fe8c4e50fec46d5d80bc97"
-SRCREV_pn-pythm ?= "19"
-SRCREV_pn-python-coherence ?= "1161"
-SRCREV_pn-python-connexion ?= "1439"
-SRCREV_pn-python-formencode ?= "3148"
-SRCREV_pn-python-gsmd ?= "148"
 SRCREV_pn-python-pycrypto ?= "d087280d7e9643a3e3f68f209932119fe6738b3c"
-SRCREV_pn-python-pyyaml ?= "344"
-QEMUSRCREV ?= "4242"
-SRCREV_pn-qemu ?= "${QEMUSRCREV}"
-SRCREV_pn-qemu-native ?= "${QEMUSRCREV}"
-SRCREV_pn-qemu-sdk ?= "${QEMUSRCREV}"
 SRCREV_pn-qtwebkit-performance-utilities ?= "27a630a74518ebb7810ed5886182e676b36c07a5"
 SRCREV_pn-qtwebkit-performance-utilities-e ?= "27a630a74518ebb7810ed5886182e676b36c07a5"
 SRCREV_pn-serial-forward ?= "50cf4ff2198589a8db369789fc038604a892a54d"
-SRCREV_pn-settings-daemon ?= "2006"
 SRCREV_pn-shr-config ?= "37dd7ac950e2bfd438801faf34c29fccfdbbaccf"
 SRCREV_pn-shr-installer ?= "8608816ea1a1ac14b6e9faaa3685dd2b6450e889"
 SRCREV_pn-shr-settings ?= "b6aed65934cf047f1abd3d8f630d87f900422c38"
@@ -185,28 +79,15 @@ SRCREV_pn-shr-theme ?= "730da87ad75c814c16c856ca138605d985b6efdb"
 SRCREV_pn-shr-theme-gtk-e17lookalike ?= "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
 SRCREV_pn-shr-today ?= "7b69649a9df0e85f0c0f7985fd1d93543c3b11e2"
 SRCREV_pn-shr-wizard ?= "24450cba257e7057045ad576530f158a03bd0f8b"
-SRCREV_pn-socketcan-modules ?= "917"
-SRCREV_pn-socketcan-utils-test ?= "917"
-SRCREV_pn-sphyrna-python ?= "45"
-SRCREV_pn-starling ?= "9574"
 SRCREV_pn-stopwatch ?= "89644b91e02151fc72989755f20c1ffb144ef5e2"
-SRCREV_pn-table ?= "2191"
 SRCREV_pn-tichy ?= "ab68d849502009cf3214df48ffa8075a10cc2177"
-SRCREV_pn-tmut ?= "60"
 SRCREV_pn-toscoterm ?= "f02add76f365a2fecd2dbefc230ceaab20244f96"
-SRCREV_pn-tslib ?= "77"
-SRCREV_pn-u-boot-bug ?= "8674"
 SRCREV_pn-u-boot-openmoko ?= "650149a53dbdd48bf6dfef90930c8ab182adb512"
 SRCREV_pn-u-boot-openmoko-devel ?= "ba029a1426bfca169572bf80d50a8b190a6b0e19"
-SRCREV_pn-usbpath ?= "3172"
-SRCREV_pn-usbpath-native ?= "3172"
 SRCREV_pn-webkit-efl ?= "3a5ee77664c898ed51a2b2d5759822f8c0a06472"
-SRCREV_pn-wesnoth ?= "39828"
-SRCREV_pn-wlan-ng-modules ?= "1859"
-SRCREV_pn-wlan-ng-utils ?= "1859"
-SRCREV_pn-xoo ?= "1971"
 SRCREV_pn-xserver-kdrive-glamo ?= "9b28d998424c77fbc057dd3a022ccbb122793a52"
 
+OPKG_SRCREV ?= "527"
 EFL_SRCREV ?= "47642"
 
 require conf/distro/include/sane-srcrevs-fso.inc
diff --git a/recipes/accelges/accelges_svn.bb b/recipes/accelges/accelges_svn.bb
index 3c3c8ac..b351d41 100644
--- a/recipes/accelges/accelges_svn.bb
+++ b/recipes/accelges/accelges_svn.bb
@@ -7,6 +7,8 @@ SECTION = "openmoko/utilities"
 PV = "0.2+svnr${SRCPV}"
 PR = "r2"
 PE = "1"
+SRCREV = "206"
+
 DEPENDS = "dbus dbus-glib libxrandr libnotify notification-daemon curl gtk+"
 RDEPENDS = "dbus dbus-glib libxrandr libnotify notification-daemon libcurl gtk+"
 
diff --git a/recipes/aircrack/aircrack-ng_1.0-svn.bb b/recipes/aircrack/aircrack-ng_1.0-svn.bb
index 37af3d5..1fa93ed 100644
--- a/recipes/aircrack/aircrack-ng_1.0-svn.bb
+++ b/recipes/aircrack/aircrack-ng_1.0-svn.bb
@@ -5,6 +5,8 @@ LICENSE = "GPLv2"
 DEPENDS = "openssl zlib sqlite3"
 PV = "0.9.99+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "802"
+
 SRC_URI = "svn://trac.aircrack-ng.org/svn/branch;module=1.0-dev;proto=http"
  
 S="${WORKDIR}/1.0-dev"
diff --git a/recipes/bootchart-lite/bootchart-lite_svn.bb b/recipes/bootchart-lite/bootchart-lite_svn.bb
index 1368c92..38480f2 100644
--- a/recipes/bootchart-lite/bootchart-lite_svn.bb
+++ b/recipes/bootchart-lite/bootchart-lite_svn.bb
@@ -5,6 +5,7 @@ SECTION = "console/utils"
 HOMEPAGE = "http://code.google.com/p/bootchart-lite/"
 PV = "0.1+svnr${SRCPV}"
 PR = "r0"
+SRCREV = "4"
 
 SRC_URI = "svn://bootchart-lite.googlecode.com/svn/;module=trunk;proto=http"
 S = "${WORKDIR}/trunk"
diff --git a/recipes/cdparanoia/cdparanoia_svn.bb b/recipes/cdparanoia/cdparanoia_svn.bb
index 783d507..724a9a1 100644
--- a/recipes/cdparanoia/cdparanoia_svn.bb
+++ b/recipes/cdparanoia/cdparanoia_svn.bb
@@ -6,6 +6,7 @@ PR = "r2"
 LICENSE = "GPL"
 
 PV = "10.2+svnr${SRCPV}"
+SRCREV = "16684"
 
 SRC_URI = "svn://svn.xiph.org/trunk;module=cdparanoia;proto=http \
 	 file://fixes10.patch;patch=1 \
diff --git a/recipes/clutter/clutter-box2d_svn.bb b/recipes/clutter/clutter-box2d_svn.bb
index 8ef7a03..aa2156a 100644
--- a/recipes/clutter/clutter-box2d_svn.bb
+++ b/recipes/clutter/clutter-box2d_svn.bb
@@ -2,6 +2,7 @@ require clutter-box2d.inc
 
 PV = "0.0+svnr${SRCPV}"
 PR = "r4"
+SRCREV = "3197"
 
 SRC_URI = "svn://svn.o-hand.com/repos/clutter/trunk;module=${PN};proto=http"
 
diff --git a/recipes/clutter/clutter-cairo_svn.bb b/recipes/clutter/clutter-cairo_svn.bb
index f4919ac..bd09579 100644
--- a/recipes/clutter/clutter-cairo_svn.bb
+++ b/recipes/clutter/clutter-cairo_svn.bb
@@ -1,6 +1,7 @@
 require clutter-cairo.inc
 
 PV = "0.8.0+svnr${SRCPV}"
+SRCREV = "3210"
 
 SRC_URI = "svn://svn.o-hand.com/repos/clutter/trunk;module=${PN};proto=http \
            file://enable_examples.patch;patch=1"
diff --git a/recipes/clutter/clutter-gst_svn.bb b/recipes/clutter/clutter-gst_svn.bb
index 3e122c7..74798ac 100644
--- a/recipes/clutter/clutter-gst_svn.bb
+++ b/recipes/clutter/clutter-gst_svn.bb
@@ -1,6 +1,7 @@
 require clutter-gst.inc
 
 PV = "0.8.0+svnr${SRCPV}"
+SRCREV = "3188"
 
 SRC_URI = "svn://svn.o-hand.com/repos/clutter/trunk;module=${PN};proto=http \
            file://autofoo.patch;patch=1"
diff --git a/recipes/clutter/clutter_0.4svn.bb b/recipes/clutter/clutter_0.4svn.bb
index 121b964..aea2a4c 100644
--- a/recipes/clutter/clutter_0.4svn.bb
+++ b/recipes/clutter/clutter_0.4svn.bb
@@ -2,6 +2,7 @@ require clutter.inc
 
 PV = "0.4.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
+SRCREV = "3240"
 
 SRC_URI = "svn://svn.o-hand.com/repos/clutter/branches;module=clutter-0-4;proto=http \
 	   file://enable_tests-0.4.patch;patch=1 "
diff --git a/recipes/clutter/clutter_0.6svn.bb b/recipes/clutter/clutter_0.6svn.bb
index 21cafef..8bb56a7 100644
--- a/recipes/clutter/clutter_0.6svn.bb
+++ b/recipes/clutter/clutter_0.6svn.bb
@@ -2,6 +2,7 @@ require clutter.inc
 
 PV = "0.6.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
+SRCREV = "3240"
 
 SRC_URI = "svn://svn.o-hand.com/repos/clutter/branches;module=clutter-0-6;proto=http \
 	   file://enable_tests-0.6.patch;patch=1 "
diff --git a/recipes/clutter/clutter_svn.bb b/recipes/clutter/clutter_svn.bb
index d8d623c..26eb359 100644
--- a/recipes/clutter/clutter_svn.bb
+++ b/recipes/clutter/clutter_svn.bb
@@ -4,6 +4,7 @@ DEFAULT_PREFERENCE = "-1"
 
 PV = "0.8.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
+SRCREV = "3240"
 
 SRC_URI = "svn://svn.o-hand.com/repos/clutter/trunk;module=clutter;proto=http \
            file://enable_tests.patch;patch=1;maxrev=2989 \
diff --git a/recipes/clutter/table_svn.bb b/recipes/clutter/table_svn.bb
index 039f903..e02ff73 100644
--- a/recipes/clutter/table_svn.bb
+++ b/recipes/clutter/table_svn.bb
@@ -1,5 +1,6 @@
 require table.inc
 
+SRCREV = "2191"
 PV = "0.3.0+svnr${SRCPV}"
 
 SRC_URI = "svn://svn.o-hand.com/repos/clutter/trunk/toys;module=table;proto=http \
diff --git a/recipes/comic-reader/comic-reader_svn.bb b/recipes/comic-reader/comic-reader_svn.bb
index 372d1d0..411b642 100644
--- a/recipes/comic-reader/comic-reader_svn.bb
+++ b/recipes/comic-reader/comic-reader_svn.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "http://code.google.com/p/comic-reader/"
 LICENSE = "GPLv3"
 DEPENDS = "evas edje ecore etk eet edbus"
 PR = "r3"
+SRCREV = "56"
 
 SRC_URI = "svn://comic-reader.googlecode.com/svn/;module=trunk;proto=http"
 
-SRCREV = "${AUTOREV}"
 S = "${WORKDIR}/trunk"
 
 inherit autotools pkgconfig
diff --git a/recipes/dasher/dasher-gpe_0.0-svn.bb b/recipes/dasher/dasher-gpe_0.0-svn.bb
index d4f9b20..1185b85 100644
--- a/recipes/dasher/dasher-gpe_0.0-svn.bb
+++ b/recipes/dasher/dasher-gpe_0.0-svn.bb
@@ -1,6 +1,7 @@
 LICENSE="GPL"
 PV = "0.0+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "1251"
 DEPENDS = "libxsettings-client libglade libxtst gconf gtk+"
 SECTION = "gpe"
 SRC_URI = "svn://svn.gnome.org/svn/dasher;module=trunk \
diff --git a/recipes/dbus/dbus-c++_svn.bb b/recipes/dbus/dbus-c++_svn.bb
index 5be5874..80e6f14 100644
--- a/recipes/dbus/dbus-c++_svn.bb
+++ b/recipes/dbus/dbus-c++_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "C++ bindings for dbus"
 LICENSE = "LGPL"
 SECTION = "libs"
 DEPENDS = "dbus dbus-c++-native expat"
+SRCREV = "13131"
 
 SRC_URI = "svn://dev.openwengo.org/svn/openwengo/wengophone-ng/branches/wengophone-dbus-api/libs;module=dbus;proto=http"
 #           file://fix-linking.patch;patch=1"
diff --git a/recipes/ebrainy/ebrainy_svn.bb b/recipes/ebrainy/ebrainy_svn.bb
index 699aa1b..166cb55 100644
--- a/recipes/ebrainy/ebrainy_svn.bb
+++ b/recipes/ebrainy/ebrainy_svn.bb
@@ -7,6 +7,7 @@ RDEPENDS = "elementary sqlite3 python-sqlalchemy python-mysqldb python-netserver
 
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r1"
+SRCREV = "21"
 SRC_URI = "svn://ebrainy.googlecode.com/svn/trunk;module=.;proto=http"
 S = "${WORKDIR}"
 
diff --git a/recipes/eds/eds-dbus_svn.bb b/recipes/eds/eds-dbus_svn.bb
index 6bccb3d..274f55d 100644
--- a/recipes/eds/eds-dbus_svn.bb
+++ b/recipes/eds/eds-dbus_svn.bb
@@ -5,6 +5,7 @@ DEPENDS = "intltool-native libglade glib-2.0 gtk+ gconf dbus db gnome-common vir
 
 PV = "1.4.0+svnr${SRCPV}"
 PR = "r7"
+SRCREV = "736"
 
 SRC_URI = "svn://svn.o-hand.com/repos/${PN};module=trunk;proto=http \
            file://no_libdb.patch;patch=1;maxrev=659 \
diff --git a/recipes/epdfview/epdfview_svn.bb b/recipes/epdfview/epdfview_svn.bb
index 1c8e9e9..72faec3 100644
--- a/recipes/epdfview/epdfview_svn.bb
+++ b/recipes/epdfview/epdfview_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 SECTION = "x11/applications"
 DEPENDS = "poppler gtk+ cups"
 
+SRCREV = "346"
 PV = "0.1.7+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/ezx/ezx-boot-usb-native_svn.bb b/recipes/ezx/ezx-boot-usb-native_svn.bb
index 237d06b..3e24c59 100644
--- a/recipes/ezx/ezx-boot-usb-native_svn.bb
+++ b/recipes/ezx/ezx-boot-usb-native_svn.bb
@@ -3,6 +3,7 @@ DEPENDS = "virtual/libusb0-native virtual/kernel"
 SECTION = "devel"
 AUTHOR = "Team OpenEZX <openezx-devel@lists.openezx.org>"
 LICENSE = "GPL"
+SRCREV = "2512"
 PV = "0.3.0+svnr${SRCPV}"
 
 SRC_URI = "svn://svn.openezx.org/trunk/src/host;module=boot_usb;proto=http" 
diff --git a/recipes/ezx/ezx-gen-blob_svn.bb b/recipes/ezx/ezx-gen-blob_svn.bb
index 5841407..cf9f117 100644
--- a/recipes/ezx/ezx-gen-blob_svn.bb
+++ b/recipes/ezx/ezx-gen-blob_svn.bb
@@ -5,7 +5,9 @@ HOMEPAGE = "http://people.openezx.org/wyrm/gen-blob"
 LICENSE = "GPL"
 PROVIDES = "virtual/bootloader"
 DEPENDS = "virtual/kernel"
-PV = "1.0.0+${SRCREV}"
+SRCREV = "2517"
+PV = "1.0.0+svnr${SRCPV}"
+PE = "1"
 PR = "r1"
 
 SRC_URI = "\
diff --git a/recipes/ezx/ezx-gpiotool_1877.bb b/recipes/ezx/ezx-gpiotool_1877.bb
deleted file mode 100644
index 81a1ecc..0000000
--- a/recipes/ezx/ezx-gpiotool_1877.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "Gpiotool can read/write gpio configuration from userspace."
-SECTION = "devel"
-LICENSE = "GPL"
-HOMEPAGE = "http://www.openezx.org"
-AUTHOR = "Harald Welte"
-PR = "r0"
-
-SRC_URI = "svn://svn.openezx.org/trunk/src/userspace;module=gpiotool;proto=http;rev=${PV}"
-S = "${WORKDIR}/gpiotool"
-
-do_compile() {
-	for i in mmio.c gpiotool.c gpio.c
-	do
-		${CC} ${CFLAGS} -c $i
-	done
-	${CC} ${CFLAGS} -o ezx-gpiotool mmio.o gpiotool.o gpio.o
-}
-
-do_stage() {
-	:
-}
-
-do_install() {
-	install -d ${D}${sbindir}
-	install -m 0755 ezx-gpiotool ${D}${sbindir}
-}
diff --git a/recipes/ezx/ezx-gpiotool_svn.bb b/recipes/ezx/ezx-gpiotool_svn.bb
new file mode 100644
index 0000000..ef232e6
--- /dev/null
+++ b/recipes/ezx/ezx-gpiotool_svn.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Gpiotool can read/write gpio configuration from userspace."
+SECTION = "devel"
+LICENSE = "GPL"
+HOMEPAGE = "http://www.openezx.org"
+AUTHOR = "Harald Welte"
+SRCREV = "1877"
+PV = "${SRCPV}"
+PR = "r0"
+
+SRC_URI = "svn://svn.openezx.org/trunk/src/userspace;module=gpiotool;proto=http"
+S = "${WORKDIR}/gpiotool"
+
+do_compile() {
+	for i in mmio.c gpiotool.c gpio.c
+	do
+		${CC} ${CFLAGS} -c $i
+	done
+	${CC} ${CFLAGS} -o ezx-gpiotool mmio.o gpiotool.o gpio.o
+}
+
+do_stage() {
+	:
+}
+
+do_install() {
+	install -d ${D}${sbindir}
+	install -m 0755 ezx-gpiotool ${D}${sbindir}
+}
diff --git a/recipes/ezx/ezxd_svn.bb b/recipes/ezx/ezxd_svn.bb
index 19bbd93..f738b5f 100644
--- a/recipes/ezx/ezxd_svn.bb
+++ b/recipes/ezx/ezxd_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "GPLv2"
 SECTION = "devel"
 AUTHOR = "Daniel Ribeiro"
 
+SRCREV = "2513"
 PV = "0.0+svnr${SRCPV}"
 PR = "r4"
 
diff --git a/recipes/fbgrab/fbgrab-viewer-native_1.0.bb b/recipes/fbgrab/fbgrab-viewer-native_1.0.bb
index 2494918..5300d14 100644
--- a/recipes/fbgrab/fbgrab-viewer-native_1.0.bb
+++ b/recipes/fbgrab/fbgrab-viewer-native_1.0.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://svn.openezx.org/trunk/src/userspace/fbgrab/"
 LICENSE = "GPL"
 SECTION = "console/network"
 DEPENDS = "libpng-native"
+SRCREV = "1943"
 PV = "0.0+svn${SRCDATE}"
 PR = "r30"
 
diff --git a/recipes/flashrom/flashrom_svn.bb b/recipes/flashrom/flashrom_svn.bb
index f90b6ee..7193c13 100644
--- a/recipes/flashrom/flashrom_svn.bb
+++ b/recipes/flashrom/flashrom_svn.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://www.coreboot.org/Flashrom"
 LICENSE = "GPL"
 DEPENDS = "zlib pciutils"
 
+SRCREV = "3682"
 PV = "0.0+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/fstests/fstests.bb b/recipes/fstests/fstests.bb
deleted file mode 100644
index 027a990..0000000
--- a/recipes/fstests/fstests.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Various benchmarking tests for X"
-HOMEPAGE = "http://www.o-hand.com"
-SECTION = "devel"
-LICENSE = "GPL"
-PV = "0.0+svn${SRCDATE}"
-PR = "r2"
-
-DEPENDS = "gtk+"
-
-inherit autotools
-
-SRC_URI = \
-    "svn://svn.o-hand.com/repos/misc/trunk;module=fstests;proto=http"
-
-S = "${WORKDIR}/fstests/tests"
-
-do_install() {
-    install -d ${D}${bindir}
-    find . -name "test-*" -type f -perm -755 -exec install -m 0755 {} ${D}${bindir} \;
-}
diff --git a/recipes/fstests/fstests_svn.bb b/recipes/fstests/fstests_svn.bb
new file mode 100644
index 0000000..d143ee5
--- /dev/null
+++ b/recipes/fstests/fstests_svn.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Various benchmarking tests for X"
+HOMEPAGE = "http://www.o-hand.com"
+SECTION = "devel"
+LICENSE = "GPL"
+
+SRCREV = "204"
+PV = "0.0+svn${SRCDATE}"
+PR = "r2"
+
+DEPENDS = "gtk+"
+
+inherit autotools
+
+SRC_URI = \
+    "svn://svn.o-hand.com/repos/misc/trunk;module=fstests;proto=http"
+
+S = "${WORKDIR}/fstests/tests"
+
+do_install() {
+    install -d ${D}${bindir}
+    find . -name "test-*" -type f -perm -755 -exec install -m 0755 {} ${D}${bindir} \;
+}
diff --git a/recipes/gabriel/gabriel_svn.bb b/recipes/gabriel/gabriel_svn.bb
index f525885..3da92e1 100644
--- a/recipes/gabriel/gabriel_svn.bb
+++ b/recipes/gabriel/gabriel_svn.bb
@@ -4,6 +4,7 @@ a dbus daemon running on a remote machine."
 LICENSE = "GPL"
 DEPENDS = "libssh glib-2.0 dbus dbus-glib"
 SECTION = "console/network"
+SRCREV = "38"
 PV = "0.0.0+svnr${SRCPV}"
 
 SRC_URI = "svn://gabriel.svn.sourceforge.net/svnroot/gabriel;module=gabriel;proto=https"
diff --git a/recipes/gnet/gnet_svn.bb b/recipes/gnet/gnet_svn.bb
index f6b27e3..8132ab5 100644
--- a/recipes/gnet/gnet_svn.bb
+++ b/recipes/gnet/gnet_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "LGPL"
 SECTION = "libs/network"
 HOMEPAGE = "http://www.gnetlibrary.org"
 DEPENDS = "glib-2.0"
+SRCREV = "495"
 PV = "2.0.7+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/gnome/epiphany_svn.bb b/recipes/gnome/epiphany_svn.bb
index 12f2bc5..6629c5b 100644
--- a/recipes/gnome/epiphany_svn.bb
+++ b/recipes/gnome/epiphany_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "GNOME default webbrowser"
 DEPENDS = "gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
 RDEPENDS = "gnome-vfs-plugin-http iso-codes"
 
+SRCREV = "7837"
 PV = "2.20.1+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/gnome/gconf-dbus_svn.bb b/recipes/gnome/gconf-dbus_svn.bb
index 671d9f4..4deae57 100644
--- a/recipes/gnome/gconf-dbus_svn.bb
+++ b/recipes/gnome/gconf-dbus_svn.bb
@@ -5,6 +5,8 @@ SECTION = "x11/utils"
 PROVIDES = "gconf"
 RPROVIDES_${PN} = "gconf"
 RPROVIDES_${PN}-dev = "gconf-dev"
+
+SRCREV = "641"
 PV = "2.16.0+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/gpe-conf/gpe-conf_svn.bb b/recipes/gpe-conf/gpe-conf_svn.bb
index e18c8a8..f32b6f8 100644
--- a/recipes/gpe-conf/gpe-conf_svn.bb
+++ b/recipes/gpe-conf/gpe-conf_svn.bb
@@ -11,6 +11,7 @@ RDEPENDS_gpe-conf-panel = "gpe-conf"
 
 inherit autotools gpe
 
+SRCREV = "9900"
 PV = "0.2.8+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/gpe-contacts/gpe-contacts_svn.bb b/recipes/gpe-contacts/gpe-contacts_svn.bb
index 2050b60..bad9aad 100644
--- a/recipes/gpe-contacts/gpe-contacts_svn.bb
+++ b/recipes/gpe-contacts/gpe-contacts_svn.bb
@@ -3,6 +3,7 @@ SECTION = "gpe"
 LICENSE = "GPL"
 DEPENDS = "libcontactsdb libgpewidget libgpepimc libdisplaymigration libgpevtype dbus"
 RDEPENDS = "gpe-icons"
+SRCREV = "9312"
 PV = "0.47+svnr${SRCPV}"
 PR = "r2"
 
diff --git a/recipes/gpe-gallery/gpe-gallery_svn.bb b/recipes/gpe-gallery/gpe-gallery_svn.bb
index 8d7bf3a..14a1ea0 100644
--- a/recipes/gpe-gallery/gpe-gallery_svn.bb
+++ b/recipes/gpe-gallery/gpe-gallery_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "GPE image viewer application"
 SECTION = "gpe"
 LICENSE = "GPL"
 DEPENDS = "libgpewidget"
+SRCREV = "9376"
 PV = "0.97+svnr${SRCPV}"
 
 inherit autotools 
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb b/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb
index b919e1a..6bc89c8 100644
--- a/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb
+++ b/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb
@@ -2,7 +2,7 @@ DEPENDS = "gtk+ glib-2.0 libgpewidget webkit-gtk"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r0"
 
-SRCREV = "9819"
+SRCREV = "9900"
 
 inherit autotools
 
diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb b/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
index 30d9d83..d382706 100644
--- a/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
+++ b/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
@@ -1,5 +1,7 @@
 DEPENDS = "sqlite gettext gtk+ glib-2.0 osb-nrcit libgpewidget"
 RRECOMMENDS = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg"
+
+SRCREV = "9900"
 PV = "0.20+svn${SRCDATE}"
 PR = "r0"
 
diff --git a/recipes/gpe-sketchbook/gpe-sketchbook_svn.bb b/recipes/gpe-sketchbook/gpe-sketchbook_svn.bb
index f52f58d..049fe36 100644
--- a/recipes/gpe-sketchbook/gpe-sketchbook_svn.bb
+++ b/recipes/gpe-sketchbook/gpe-sketchbook_svn.bb
@@ -3,6 +3,7 @@ SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "libgpewidget sqlite"
+SRCREV = "9547"
 PV = "0.2.9+svnr${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/gpephone/contact_svn.bb b/recipes/gpephone/contact_svn.bb
index ef4d270..4d0c7a5 100644
--- a/recipes/gpephone/contact_svn.bb
+++ b/recipes/gpephone/contact_svn.bb
@@ -5,6 +5,7 @@ LICENSE = "LiPS"
 DEPENDS = "gtk+ libgpephone dbus-glib libabenabler2 librecord2 libgemwidget"
 PV = "0.0+svnr-${SRCREV}"
 PR = "r0"
+SRCREV = "1410"
 
 inherit gpephone autotools
 
diff --git a/recipes/gpephone/libcalenabler2_svn.bb b/recipes/gpephone/libcalenabler2_svn.bb
index e3bf129..c5c77f7 100644
--- a/recipes/gpephone/libcalenabler2_svn.bb
+++ b/recipes/gpephone/libcalenabler2_svn.bb
@@ -3,7 +3,9 @@ SECTION = "gpe/libs"
 PRIORITY = "optional"
 LICENSE = "LiPS"
 DEPENDS = "glib-2.0 sqlite3 libical libalmmgr"
-PV = "0.0+svnr-${SRCREV}"
+SRCREV = "1410"
+PV = "0.0+svnr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 
diff --git a/recipes/gpephone/libiac2_svn.bb b/recipes/gpephone/libiac2_svn.bb
index 7ae0c7b..cea56f0 100644
--- a/recipes/gpephone/libiac2_svn.bb
+++ b/recipes/gpephone/libiac2_svn.bb
@@ -3,7 +3,9 @@ SECTION = "gpe/libs"
 PRIORITY = "optional"
 LICENSE = "LiPS"
 DEPENDS = "gtk+ gtk-doc dbus-glib"
-PV = "0.0+svnr-${SRCREV}"
+SRCREV = "1590"
+PV = "0.0+svnr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 inherit gpephone pkgconfig autotools
diff --git a/recipes/gpephone/libiac_svn.bb b/recipes/gpephone/libiac_svn.bb
index 0cd1d64..f6f4c0c 100644
--- a/recipes/gpephone/libiac_svn.bb
+++ b/recipes/gpephone/libiac_svn.bb
@@ -3,7 +3,9 @@ SECTION = "gpe/libs"
 PRIORITY = "optional"
 LICENSE = "LiPS"
 DEPENDS = "gtk+ gtk-doc"
-PV = "1.0+svnr-${SRCREV}"
+SRCREV = "1590"
+PV = "1.0+svnr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 inherit gpephone pkgconfig autotools
diff --git a/recipes/gsm/gsmd.inc b/recipes/gsm/gsmd.inc
index 453a8b3..2e0aad1 100644
--- a/recipes/gsm/gsmd.inc
+++ b/recipes/gsm/gsmd.inc
@@ -4,6 +4,7 @@ LICENSE = "GPL LGPL"
 SECTION = "libs/gsm"
 PROVIDES += "gsmd"
 RPROVIDES_${PN} = "libgsmd0 libgsmd gsmd gsmd-devel"
+SRCREV = "4505"
 PV = "0.1+svnr${SRCPV}"
 PR = "r44"
 
diff --git a/recipes/gtk-webcore/osb-browser_svn.bb b/recipes/gtk-webcore/osb-browser_svn.bb
index aae2799..b6fc792 100644
--- a/recipes/gtk-webcore/osb-browser_svn.bb
+++ b/recipes/gtk-webcore/osb-browser_svn.bb
@@ -5,6 +5,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "osb-nrcit gtk+ glib-2.0 libglade"
 RRECOMMENDS = "gdk-pixbuf-loader-gif gdk-pixbuf-loader-ico gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png"
+SRCREV = "125"
 PV = "0.5.0+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/gtk-webcore/osb-jscore_svn.bb b/recipes/gtk-webcore/osb-jscore_svn.bb
index af85764..434a5f1 100644
--- a/recipes/gtk-webcore/osb-jscore_svn.bb
+++ b/recipes/gtk-webcore/osb-jscore_svn.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://gtk-webcore.sourceforge.net/"
 LICENSE = "GPL"
 PRIORITY = "optional"
 
+SRCREV = "117"
 PV = "0.5.2+svnr${SRCPV}"
 PR = "r2"
 
diff --git a/recipes/gtk-webcore/osb-nrcit_svn.bb b/recipes/gtk-webcore/osb-nrcit_svn.bb
index dea075b..aff5df6 100644
--- a/recipes/gtk-webcore/osb-nrcit_svn.bb
+++ b/recipes/gtk-webcore/osb-nrcit_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "nokia"
 PRIORITY = "optional"
 SECTION = "gpe"
 
+SRCREV = "125"
 PV = "0.5.2+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/gtk-webcore/osb-nrcore_svn.bb b/recipes/gtk-webcore/osb-nrcore_svn.bb
index e0f7c88..1579a36 100644
--- a/recipes/gtk-webcore/osb-nrcore_svn.bb
+++ b/recipes/gtk-webcore/osb-nrcore_svn.bb
@@ -1,5 +1,6 @@
 require osb-nrcore.inc
 
+SRCREV = "126"
 PV = "0.5.2+svnr${SRCPV}"
 PR = "r3"
 
diff --git a/recipes/gtkhtml2/gtkhtml2_svn.bb b/recipes/gtkhtml2/gtkhtml2_svn.bb
index 18dfdd0..ada9195 100644
--- a/recipes/gtkhtml2/gtkhtml2_svn.bb
+++ b/recipes/gtkhtml2/gtkhtml2_svn.bb
@@ -2,6 +2,7 @@ SECTION = "libs"
 DEPENDS = "gtk+ glib-2.0 libxml2"
 DESCRIPTION = "A GTK+ HTML rendering library."
 LICENSE = "GPL"
+SRCREV = "1158"
 PV = "2.11.0+svnr${SRCPV}"
 
 SRC_URI = "svn://anonymous@svn.gnome.org/svn/gtkhtml2/;module=trunk \
diff --git a/recipes/kismet/kismet-newcore_svn.bb b/recipes/kismet/kismet-newcore_svn.bb
index aaa0727..1db0ce6 100644
--- a/recipes/kismet/kismet-newcore_svn.bb
+++ b/recipes/kismet/kismet-newcore_svn.bb
@@ -2,6 +2,7 @@ require kismet.inc
 
 DEFAULT_PREFERENCE = "-1"
 
+SRCREV = "2285"
 PV = "0.0+svnr${SRCPV}"
 PR = "r3"
 
diff --git a/recipes/kismet/kismet_svn.bb b/recipes/kismet/kismet_svn.bb
index aa60062..1321a7a 100644
--- a/recipes/kismet/kismet_svn.bb
+++ b/recipes/kismet/kismet_svn.bb
@@ -2,6 +2,7 @@ require kismet.inc
 
 DEFAULT_PREFERENCE = "-1"
 
+SRCREV = "2285"
 PV = "2007-10-R1+svnr${SRCPV}"
 PR = "r2"
 
diff --git a/recipes/libfakekey/libfakekey_svn.bb b/recipes/libfakekey/libfakekey_svn.bb
index 88cada8..94aa8c5 100644
--- a/recipes/libfakekey/libfakekey_svn.bb
+++ b/recipes/libfakekey/libfakekey_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Matchbox keyboard"
 LICENSE = "GPL"
 DEPENDS = "libxtst"
 SECTION = "x11/wm"
+SRCREV = "1455"
 PV = "0.2+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/libowl/libowl_svn.bb b/recipes/libowl/libowl_svn.bb
index 677a25f..fa1254f 100644
--- a/recipes/libowl/libowl_svn.bb
+++ b/recipes/libowl/libowl_svn.bb
@@ -12,6 +12,7 @@ HOMEPAGE = "http://www.o-hand.com"
 LICENSE = "LGPL"
 SECTION = "libs"
 DEPENDS = "gtk+"
+SRCREV = "277"
 PV = "0.0+svnr${SRCPV}"
 PR = "r3"
 
diff --git a/recipes/librfid/librfid_svn.bb b/recipes/librfid/librfid_svn.bb
index 7df31ee..cfa9659 100644
--- a/recipes/librfid/librfid_svn.bb
+++ b/recipes/librfid/librfid_svn.bb
@@ -5,6 +5,7 @@ LICENSE = "GPL"
 DEPENDS = "virtual/libusb0"
 SRCNAME = "librfid"
 
+SRCREV = "2094"
 PV = "0.2.0+svnr${SRCPV}"
 PR = "r5"
 
diff --git a/recipes/libw100/libw100_svn.bb b/recipes/libw100/libw100_svn.bb
index 9e01a2a..343d530 100644
--- a/recipes/libw100/libw100_svn.bb
+++ b/recipes/libw100/libw100_svn.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Acceleration library for ATI imageon chipsets (w100 and w3220)"
 LICENSE = "GPLv2"
 
+SRCREV = "47"
 PV = "0.0.2+svnr${SRCPV}"
 PE = "1"
 SRC_URI = "svn://libw100.svn.sourceforge.net/svnroot/libw100;module=trunk;proto=https"
diff --git a/recipes/libxosd/libxosd_svn.bb b/recipes/libxosd/libxosd_svn.bb
index bc40b34..b760e24 100644
--- a/recipes/libxosd/libxosd_svn.bb
+++ b/recipes/libxosd/libxosd_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "A library for displaying a TV-like on-screen display in X."
 SECTION = "libs/x11"
 DEPENDS = "virtual/libx11 libxext"
 LICENSE = "LGPL"
+SRCREV = "627"
 PV = "2.2.15+svnr${SRCPV}"
 PR = "r5"
 
diff --git a/recipes/linux/linux-bfin_svn.bb b/recipes/linux/linux-bfin_svn.bb
index 9b1b4e1..192bd22 100644
--- a/recipes/linux/linux-bfin_svn.bb
+++ b/recipes/linux/linux-bfin_svn.bb
@@ -2,6 +2,7 @@ require linux.inc
 
 COMPATIBLE_HOST = 'bfin.*-uclinux'
 
+SRCREV = "3758"
 PV = "2.6.22.10+svnr${SRCPV}"
 
 SRC_URI = "svn://sources.blackfin.uclinux.org/linux-kernel/;module=trunk \
diff --git a/recipes/linux/linux-hackndev-2.6_git.bb b/recipes/linux/linux-hackndev-2.6_git.bb
index 4c577d2..a302bee 100644
--- a/recipes/linux/linux-hackndev-2.6_git.bb
+++ b/recipes/linux/linux-hackndev-2.6_git.bb
@@ -2,6 +2,9 @@ DESCRIPTION = "Hack&Dev's Linux kernel for Palm devices."
 HOMEPAGE = "http://www.hackndev.com/"
 SECTION = "kernel"
 LICENSE = "GPLv2"
+# This was in sane-srcrevs.inc - doesn't look sane to me (for git recipe)
+# SRCREV_pn-linux-hackndev-2.6 ?= "1308"
+SRCREV = "8f62c3b8a7e7de042846211f387a867f6703f272"
 PR = "r14"
 
 COMPATIBLE_MACHINE = "(palmld|palmtc|palmtt3|palmtt5|palmtx|palmz31|palmz72|palmt650)"
diff --git a/recipes/linux/linux-ixp4xx.inc b/recipes/linux/linux-ixp4xx.inc
index 9c4dd37..f00c4c4 100644
--- a/recipes/linux/linux-ixp4xx.inc
+++ b/recipes/linux/linux-ixp4xx.inc
@@ -1,6 +1,7 @@
 # linux-ixp4xx.inc
 #
 DESCRIPTION = "Linux 2.6.x kernel for IXP4xx devices"
+SRCREV = "1089"
 
 COMPATIBLE_HOST = 'arm.*-linux.*'
 COMPATIBLE_MACHINE = '(ixp4xx|nslu2|syhl1)'
diff --git a/recipes/llvm/llvm-gcc4-cross_svn.bb b/recipes/llvm/llvm-gcc4-cross_svn.bb
index 5257713..adf8cb4 100644
--- a/recipes/llvm/llvm-gcc4-cross_svn.bb
+++ b/recipes/llvm/llvm-gcc4-cross_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "various"
 
 DEPENDS = "llvm2.5-native"
 
+SRCREV = "374"
 PV = "2.1+svnr${SRCPV}"
 
 PR = "r1"
diff --git a/recipes/llvm/llvm-gcc4_svn.bb b/recipes/llvm/llvm-gcc4_svn.bb
index 74ac580..363be8e 100644
--- a/recipes/llvm/llvm-gcc4_svn.bb
+++ b/recipes/llvm/llvm-gcc4_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "various"
 
 DEPENDS = "llvm2.5-native"
 
+SRCREV = "374"
 PV = "2.0+svnr${SRCPV}"
 
 PR = "r1"
diff --git a/recipes/maemo-mapper/maemo-mapper_svn.bb b/recipes/maemo-mapper/maemo-mapper_svn.bb
index afc2d93..2c1bb4c 100644
--- a/recipes/maemo-mapper/maemo-mapper_svn.bb
+++ b/recipes/maemo-mapper/maemo-mapper_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "GPL"
 DEPENDS = "gdbm libconic sqlite3 gtk+ libhildonfm libosso osso-ic-oss libosso-help gnome-vfs dbus bluez-libs"
 RDEPENDS = "bluez-utils"
 RRECOMMENDS = "gpsd flite"
+SRCREV = "118"
 PV = "2.0.3+svnr${SRCPV}"
 PR = "r2"
 
diff --git a/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb b/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
index f791dce..c2d44d9 100644
--- a/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
+++ b/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "GPL"
 DEPENDS = "gconf gtk+"
 RDEPENDS = "settings-daemon"
 
+SRCREV = "1614"
 PV = "0.0+svnr${SRCPV}"
 
 S = "${WORKDIR}/${PN}"
diff --git a/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb b/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb
index 5e749ae..3343b6f 100644
--- a/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb
+++ b/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb
@@ -4,6 +4,7 @@ DEPENDS = "libfakekey expat libxft gtk+ matchbox-panel-2"
 RCONFLICTS_${PN} = "matchbox-keyboard"
 RPROVIDES_${PN} = "matchbox-keyboard"
 SECTION = "x11"
+SRCREV = "1910"
 PV = "0.0+svnr${SRCPV}"
 PR = "r11"
 
diff --git a/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb b/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
index 27d87b7..dd820e6 100644
--- a/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
+++ b/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
@@ -4,6 +4,7 @@ DEPENDS = "libfakekey expat libxft"
 RCONFLICTS = matchbox-keyboard-inputmethod
 RPROVIDES_${PN} = matchbox-keyboard-inputmethod
 SECTION = "x11"
+SRCREV = "1910"
 PV = "0.0+svnr${SRCPV}"
 PR ="r7"
 
diff --git a/recipes/matchbox-stroke/matchbox-stroke_svn.bb b/recipes/matchbox-stroke/matchbox-stroke_svn.bb
index 4c1d201..2afe1ca 100644
--- a/recipes/matchbox-stroke/matchbox-stroke_svn.bb
+++ b/recipes/matchbox-stroke/matchbox-stroke_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Matchbox keyboard"
 LICENSE = "GPL"
 DEPENDS = "libfakekey expat libxft"
 SECTION = "x11/wm"
+SRCREV = "1820"
 PV = "0.0+svnr${SRCPV}"
 
 PR ="r2"
diff --git a/recipes/matchbox-terminal/matchbox-terminal_svn.bb b/recipes/matchbox-terminal/matchbox-terminal_svn.bb
index e6263ec..3ca6d13 100644
--- a/recipes/matchbox-terminal/matchbox-terminal_svn.bb
+++ b/recipes/matchbox-terminal/matchbox-terminal_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Matchbox Terminal"
 LICENSE = "GPL"
 DEPENDS = "gtk+ vte"
 SECTION = "x11/utils"
+SRCREV = "1612"
 PV = "0.0+svnr${SRCPV}"
 
 SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=${PN};proto=http"
diff --git a/recipes/matchbox2/matchbox-desktop-2_svn.bb b/recipes/matchbox2/matchbox-desktop-2_svn.bb
index 5c3a468..0a50bac 100644
--- a/recipes/matchbox2/matchbox-desktop-2_svn.bb
+++ b/recipes/matchbox2/matchbox-desktop-2_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "GPL"
 SECTION = "x11/panels"
 DEPENDS = "gtk+ startup-notification"
 RDEPENDS = "matchbox-common"
+SRCREV = "2096"
 PV = "2.0+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb b/recipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb
index 0dc89e6..bcd7706 100644
--- a/recipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb
+++ b/recipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb
@@ -5,6 +5,7 @@ DEPENDS = "imagemagick-native"
 RPROVIDES_${PN} = "matchbox-panel-2-icon-theme"
 PACKAGE_ARCH = "all"
 SRCREV_FORMAT = "startup"
+SRCREV = "1907"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/matchbox2/matchbox-panel-2_svn.bb b/recipes/matchbox2/matchbox-panel-2_svn.bb
index ae3b122..eff83f7 100644
--- a/recipes/matchbox2/matchbox-panel-2_svn.bb
+++ b/recipes/matchbox2/matchbox-panel-2_svn.bb
@@ -6,6 +6,7 @@ DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 RDEPENDS_${PN} = "matchbox-panel-2-icon-theme"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+SRCREV = "2098"
 PV = "2.0+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/matchbox2/matchbox-wm-2_svn.bb b/recipes/matchbox2/matchbox-wm-2_svn.bb
index b716cf2..a31f121 100644
--- a/recipes/matchbox2/matchbox-wm-2_svn.bb
+++ b/recipes/matchbox2/matchbox-wm-2_svn.bb
@@ -1,4 +1,5 @@
 DEPENDS = "gtk+ startup-notification dbus dbus-glib"
+SRCREV = "2087"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/mplayer/mplayer-maemo_svn.bb b/recipes/mplayer/mplayer-maemo_svn.bb
index af0e7a5..c85d711 100644
--- a/recipes/mplayer/mplayer-maemo_svn.bb
+++ b/recipes/mplayer/mplayer-maemo_svn.bb
@@ -6,6 +6,7 @@ DEPENDS = "virtual/libsdl xsp libmad zlib libpng jpeg liba52 freetype fontconfig
 
 DEFAULT_PREFERENCE_avr32 = "-1"
 
+SRCREV = "6952"
 PV = "0.0+1.0rc1+svnr${SRCPV}"
 PE = "1"
 
diff --git a/recipes/multitap-pad/multitap-pad_svn.bb b/recipes/multitap-pad/multitap-pad_svn.bb
index fcc7249..efa7f04 100644
--- a/recipes/multitap-pad/multitap-pad_svn.bb
+++ b/recipes/multitap-pad/multitap-pad_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "GPL"
 DEPENDS = "libfakekey gtk+ matchbox-panel-2"
 RCONFLICTS = matchbox-keyboard-inputmethod
 SECTION = "x11"
+SRCREV = "373"
 PV = "0.0+svnr${SRCPV}"
 
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=${PN};proto=http \
diff --git a/recipes/net-snmp/libsnmp-perl_svn.bb b/recipes/net-snmp/libsnmp-perl_svn.bb
index 5355f1d..4d828c8 100644
--- a/recipes/net-snmp/libsnmp-perl_svn.bb
+++ b/recipes/net-snmp/libsnmp-perl_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Perl module from net-snmp"
 SECTION = "libs"
 LICENSE = "BSD"
 DEPENDS = "net-snmp"
+SRCREV = "17367"
 PR = "r2"
 
 SRC_URI = "svn://net-snmp.svn.sourceforge.net/svnroot/net-snmp/trunk;module=net-snmp;proto=https"
diff --git a/recipes/net-snmp/net-snmp_svn.bb b/recipes/net-snmp/net-snmp_svn.bb
index 0d27d06..689a416 100644
--- a/recipes/net-snmp/net-snmp_svn.bb
+++ b/recipes/net-snmp/net-snmp_svn.bb
@@ -1,5 +1,6 @@
 require net-snmp.inc
 DEPENDS += "libtool libtool-native libtool-cross"
+SRCREV = "17367"
 PR = "${INC_PR}.0"
 
 S = "${WORKDIR}/net-snmp"
diff --git a/recipes/netsurf/netsurf_svn.bb b/recipes/netsurf/netsurf_svn.bb
index c08c879..33c5d4e 100644
--- a/recipes/netsurf/netsurf_svn.bb
+++ b/recipes/netsurf/netsurf_svn.bb
@@ -3,6 +3,7 @@ web standards in use today."
 HOMEPAGE = "http://www.netsurf-browser.org/"
 SECTION = "x11/network"
 LICENSE = "GPLv2"
+SRCREV = "3859"
 PV = "1.1+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/openocd/openocd_svn.bb b/recipes/openocd/openocd_svn.bb
index 11f5e77..763665b 100644
--- a/recipes/openocd/openocd_svn.bb
+++ b/recipes/openocd/openocd_svn.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Free and Open On-Chip Debugging, In-System Programming and Boundary-Scan Testing"
 HOMEPAGE = "http://openocd.berlios.de/"
 LICENSE = "GPL"
+SRCREV = "517"
 PV = "0.0+svnr${SRCPV}"
 PR = "r3"
 
diff --git a/recipes/opkg-utils/opkg-utils-native_svn.bb b/recipes/opkg-utils/opkg-utils-native_svn.bb
index 0495b1e..49b8e98 100644
--- a/recipes/opkg-utils/opkg-utils-native_svn.bb
+++ b/recipes/opkg-utils/opkg-utils-native_svn.bb
@@ -1,4 +1,5 @@
 require opkg-utils_svn.bb
+SRCREV = "4595"
 
 RDEPENDS = ""
 
diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_svn.bb
index 4c3c090..d049bb7 100644
--- a/recipes/opkg-utils/opkg-utils_svn.bb
+++ b/recipes/opkg-utils/opkg-utils_svn.bb
@@ -3,6 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
 RDEPENDS = "python"
+SRCREV = "4578"
 PR = "r2"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http"
diff --git a/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb b/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
index 5491a28..253bded 100644
--- a/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
+++ b/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
@@ -26,8 +26,6 @@ SRC_URI += " \
 	   "
 PR = "${INC_PR}"
 
-SRCREV = "${SRCREV_pn-opkg}"
-
 EXTRA_OECONF += "--disable-gpg --enable-static --disable-shared"
 
 # Not sure this is needed; needs to be investigated and removed if not
diff --git a/recipes/opkg/opkg-nogpg-nocurl_svn.bb b/recipes/opkg/opkg-nogpg-nocurl_svn.bb
index cd8751a..66e8dbc 100644
--- a/recipes/opkg/opkg-nogpg-nocurl_svn.bb
+++ b/recipes/opkg/opkg-nogpg-nocurl_svn.bb
@@ -5,8 +5,6 @@ PROVIDES += "opkg"
 
 PR = "${INC_PR}"
 
-SRCREV = "${SRCREV_pn-opkg}"
-
 EXTRA_OECONF += " --disable-curl --enable-static --disable-shared"
 
 # The nogpg version isn't getting much love and has an unused variable which trips up -Werror
diff --git a/recipes/opkg/opkg-nogpg_svn.bb b/recipes/opkg/opkg-nogpg_svn.bb
index 33d9987..bee639f 100644
--- a/recipes/opkg/opkg-nogpg_svn.bb
+++ b/recipes/opkg/opkg-nogpg_svn.bb
@@ -5,8 +5,6 @@ PROVIDES += "opkg"
 
 PR = "${INC_PR}.1"
 
-SRCREV = "${SRCREV_pn-opkg}"
-
 EXTRA_OECONF += " --disable-gpg \ 
                   --disable-openssl \ 
                   --disable-ssl-curl \
diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index 9a3d3dc..7865f1a 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -3,6 +3,7 @@ DESCRIPTION_libopkg = "Opkg Package Manager Library"
 SECTION = "base"
 LICENSE = "GPLv2"
 DEPENDS = "curl gpgme openssl"
+SRCREV = ${OPKG_SRCREV}
 PV = "0.1.6+svnr${SRCPV}"
 INC_PR = "r21"
 
diff --git a/recipes/oprofile/oprofileui-svn.inc b/recipes/oprofile/oprofileui-svn.inc
index c274643..c6e5967 100644
--- a/recipes/oprofile/oprofileui-svn.inc
+++ b/recipes/oprofile/oprofileui-svn.inc
@@ -1,5 +1,6 @@
 require oprofileui.inc
 
+SRCREV = "173"
 PV = "0.0+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/portaudio/portaudio-v19_svn.bb b/recipes/portaudio/portaudio-v19_svn.bb
index 5e3097d..fb715b4 100644
--- a/recipes/portaudio/portaudio-v19_svn.bb
+++ b/recipes/portaudio/portaudio-v19_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "A portable audio library"
 SECTION = "libs/multimedia"
 PRIORITY = "optional"
 LICENSE = "GPL"
+SRCREV = "1387"
 PV = "v19+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
index f2be0b3..7319b96 100644
--- a/recipes/psplash/psplash.inc
+++ b/recipes/psplash/psplash.inc
@@ -7,6 +7,7 @@ PROVIDES = "virtual/psplash"
 RPROVIDES_${PN} = "virtual-psplash"
 RCONFLICTS_${PN} = "exquisite"
 
+SRCREV = "249"
 PV = "0.0+svnr${SRCPV}"
 PR = "r23"
 
diff --git a/recipes/puzzles/oh-puzzles_svn.bb b/recipes/puzzles/oh-puzzles_svn.bb
index f5796e4..42079e7 100644
--- a/recipes/puzzles/oh-puzzles_svn.bb
+++ b/recipes/puzzles/oh-puzzles_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Portable Puzzle Collection"
 LICENSE = "MIT"
 SECTION = "x11"
 DEPENDS = "gtk+ gconf intltool-native librsvg libowl"
+SRCREV = "22"
 PV = "0.1+svnr${SRCPV}"
 PR = "r5"
 
diff --git a/recipes/pythm/pythm_svn.bb b/recipes/pythm/pythm_svn.bb
index fdffb21..556ea33 100644
--- a/recipes/pythm/pythm_svn.bb
+++ b/recipes/pythm/pythm_svn.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "http://projects.openmoko.org/projects/pythm/"
 SECTION = "application/multimedia"
 LICENSE = "GPLv2"
 SRCNAME = "pythm"
+SRCREV = "19"
 PV = "0.5.1+svnr${SRCPV}"
 PR = "r3"
 SRC_URI = "svn://svn.projects.openmoko.org/svnroot/;module=pythm \
diff --git a/recipes/python/python-coherence_svn.bb b/recipes/python/python-coherence_svn.bb
index 46e6e3e..59a38f3 100644
--- a/recipes/python/python-coherence_svn.bb
+++ b/recipes/python/python-coherence_svn.bb
@@ -3,6 +3,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 HOMEPAGE = "http://coherence.beebits.net/wiki"
 
+SRCREV = "1161"
 PR = "r1"
 
 PV = "0.6.0+svnr${SRCPV}"
diff --git a/recipes/python/python-connexion_svn.bb b/recipes/python/python-connexion_svn.bb
index 8136fe4..801b2fe 100644
--- a/recipes/python/python-connexion_svn.bb
+++ b/recipes/python/python-connexion_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "A versatile network connection library"
 HOMEPAGE = "http://www.radlinux.org/connexion/"
 SECTION = "devel/python"
 LICENSE = "GPL"
+SRCREV = "1439"
 BV = "0.4.6"
 PV = "${BV}+svnr${SRCPV}"
 PR = "ml1"
diff --git a/recipes/python/python-pyyaml_svn.bb b/recipes/python/python-pyyaml_svn.bb
index 117eb9b..512dd38 100644
--- a/recipes/python/python-pyyaml_svn.bb
+++ b/recipes/python/python-pyyaml_svn.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://www.pyyaml.org"
 SECTION = "devel/python"
 LICENSE = "MIT"
 DEPENDS = "libyaml python-cython-native"
+SRCREV = "344"
 PV = "3.08+svnr${SRCPV}"
 PR = "ml0"
 
diff --git a/recipes/settings-daemon/settings-daemon_svn.bb b/recipes/settings-daemon/settings-daemon_svn.bb
index de92053..0b94830 100644
--- a/recipes/settings-daemon/settings-daemon_svn.bb
+++ b/recipes/settings-daemon/settings-daemon_svn.bb
@@ -3,6 +3,7 @@ LICENSE = "GPL"
 DEPENDS = "gconf glib-2.0 gtk+"
 RDEPENDS = "xrdb"
 SECTION = "x11"
+SRCREV = "2006"
 PV = "0.0+svnr${SRCPV}"
 
 PR = "r2"
diff --git a/recipes/socketcan/socketcan-modules_svn.bb b/recipes/socketcan/socketcan-modules_svn.bb
index b24f456..e19f7bb 100644
--- a/recipes/socketcan/socketcan-modules_svn.bb
+++ b/recipes/socketcan/socketcan-modules_svn.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://developer.berlios.de/projects/socketcan/"
 SECTION = "kernel/modules"
 LICENSE = "GPL"
 DEPENDS = "virtual/kernel"
+SRCREV = "917"
 PV = "0.0+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/socketcan/socketcan-utils-test_svn.bb b/recipes/socketcan/socketcan-utils-test_svn.bb
index 4a3d52d..ca4c23a 100644
--- a/recipes/socketcan/socketcan-utils-test_svn.bb
+++ b/recipes/socketcan/socketcan-utils-test_svn.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://developer.berlios.de/projects/socketcan/"
 SECTION = "console/utils"
 LICENSE = "GPL"
 
+SRCREV = "917"
 PV = "0.0+svnr${SRCPV}"
 
 SRC_URI = "svn://svn.berlios.de/socketcan;module=trunk;proto=svn \
diff --git a/recipes/sphyrna/sphyrna-python_svn.bb b/recipes/sphyrna/sphyrna-python_svn.bb
index 5b4ee8a..348f1b1 100644
--- a/recipes/sphyrna/sphyrna-python_svn.bb
+++ b/recipes/sphyrna/sphyrna-python_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Sphyrna - Hammerhead Reverse Engineering"
 HOMEPAGE = "http://projects.linuxtogo.org/projects/sphyrna"
 LICENSE = "GPLv2"
 DEPENDS = "readline python-native"
+SRCREV = "45"
 PV = "0.0+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/recipes/tinymail/tmut_svn.bb b/recipes/tinymail/tmut_svn.bb
index 2eb7b8d..7f7a61b 100644
--- a/recipes/tinymail/tmut_svn.bb
+++ b/recipes/tinymail/tmut_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Tmut is a really small E-Mail client based on Tinymail"
 SECTION = "x11/utils"
 LICENSE = "LGPL"
 DEPENDS = "gtk+ glib-2.0 gnome-vfs gconf libtinymail"
+SRCREV = "60"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r3"
 
diff --git a/recipes/tslib/tslib_svn.bb b/recipes/tslib/tslib_svn.bb
index 77127c7..5b1d32b 100644
--- a/recipes/tslib/tslib_svn.bb
+++ b/recipes/tslib/tslib_svn.bb
@@ -1,5 +1,6 @@
 SRC_URI = "svn://svn.berlios.de/tslib/trunk;module=tslib"
 S = "${WORKDIR}/tslib"
+SRCREV = "77"
 PV = "1.0+svnr${SRCPV}"
 PR = "${INC_PR}.1"
 
diff --git a/recipes/u-boot/u-boot-bug_svn.bb b/recipes/u-boot/u-boot-bug_svn.bb
index 485cfd8..dffeea1 100644
--- a/recipes/u-boot/u-boot-bug_svn.bb
+++ b/recipes/u-boot/u-boot-bug_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 SECTION = "bootloader"
 PRIORITY = "optional"
 PV = "1.3.2+svnr${SRCPV}"
-SRCREV = "${AUTOREV}"
+SRCREV = "8674"
 PR = "r6"
 
 SRC_URI = "\
diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-uclibc_svn.bb
index 80efd26..e8cb63e 100644
--- a/recipes/uclibc/bfin-uclibc_svn.bb
+++ b/recipes/uclibc/bfin-uclibc_svn.bb
@@ -11,6 +11,7 @@ PV = "${UCLIBC_BASE}+svnr${SRCPV}"
 
 require uclibc.inc
 PR = "${INC_PR}.0"
+SRCREV = "1857"
 PROVIDES_append_bfin = " virtual/${TARGET_PREFIX}libc-for-gcc "
 
 #recent versions uclibc require real kernel headers
diff --git a/recipes/uclibc/elf2flt_svn.bb b/recipes/uclibc/elf2flt_svn.bb
index e16da36..9f8ceb4 100644
--- a/recipes/uclibc/elf2flt_svn.bb
+++ b/recipes/uclibc/elf2flt_svn.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Elf2flt is a wrapper around the linker for uclinux platforms"
 DEPENDS = "binutils-cross"
 
+SRCREV = "1786"
 PV = "0.0+svnr${SRCPV}"
 
 inherit autotools cross
diff --git a/recipes/usbpath/usbpath_svn.bb b/recipes/usbpath/usbpath_svn.bb
index 16e7b0e..1cedf33 100644
--- a/recipes/usbpath/usbpath_svn.bb
+++ b/recipes/usbpath/usbpath_svn.bb
@@ -4,6 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "virtual/libusb0"
 
+SRCREV = "3172"
 PV = "0.0+svnr${SRCPV}"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host;module=usbpath;proto=http"
diff --git a/recipes/wlan-ng/wlan-ng-modules_svn.bb b/recipes/wlan-ng/wlan-ng-modules_svn.bb
index f62ab37..2e8892b 100644
--- a/recipes/wlan-ng/wlan-ng-modules_svn.bb
+++ b/recipes/wlan-ng/wlan-ng-modules_svn.bb
@@ -1,5 +1,6 @@
 require wlan-ng-modules.inc
 
+SRCREV = "1859"
 PR = "r0"
 
 PV = "0.2.8+svnr${SRCPV}"
diff --git a/recipes/wlan-ng/wlan-ng-utils_svn.bb b/recipes/wlan-ng/wlan-ng-utils_svn.bb
index bc02eb7..059dc0e 100644
--- a/recipes/wlan-ng/wlan-ng-utils_svn.bb
+++ b/recipes/wlan-ng/wlan-ng-utils_svn.bb
@@ -1,5 +1,6 @@
 require wlan-ng-utils.inc
 
+SRCREV = "1859"
 PR = "r0"
 
 PV = "0.2.8+svnr${SRCPV}"
diff --git a/recipes/xoo/xoo_svn.bb b/recipes/xoo/xoo_svn.bb
index efceab4..351a82c 100644
--- a/recipes/xoo/xoo_svn.bb
+++ b/recipes/xoo/xoo_svn.bb
@@ -4,6 +4,7 @@ It is intended for embedded developers that want to simulate a target device \
 HOMEPAGE = "http://projects.o-hand.com/xoo"
 LICENSE = "GPL"
 DEPENDS = "virtual/libx11 libxtst gtk+ libglade expat"
+SRCREV = "1971"
 PV = "0.7+svnr${SRCPV}"
 PR = "r1"
 
-- 
1.7.0.3




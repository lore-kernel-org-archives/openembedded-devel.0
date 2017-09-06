Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3377377B95
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTUn9027091
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:31 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:30 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:22:58 -0500
Message-ID: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 00/31] Numerous patches to resolve yocto-compat-layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 19:29:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This patch set attempts to address the 'yocto-compat-layer.py' failures.

Many of the patches seem like obvious fixes or changes to me.. however some
of them are clearly dubious.

I would not suggestion treating this as a single take them all or take none,
but as individual changes.. (a few of them may require prior changes...)

Besides the standard git summary (below), I have attempted to summaries the
individual patches here to help with review:

[01/31] iproute2: Move tipc enablement to oe-core
[02/31] libml: Move to oe-core
- I will be sending up a corresponding patch to oe-core for these.  See the
other email ( iproute2: Move tipc enablement to oe-core ) for a description
of why this is necessary.

[03/31] openipmi: Move to meta-networking requires net-snmp
- openipmi in meta-oe requires net-snmp, but meta-oe doesn't depend on
meta-networking.  Easiest resolution was to move it.

[04/31] glmark2: Set required distro features to opengl
- Should be one of the 'obvious' fixes

[05/31] openlmi-tools: Only build if the necessary python
- This is one of the dubious patches.  I could not figure out an appropriate
place to 'move' this to that requires meta-python -- as the item itself does
not appear to be appriopriate to put into meta-python.

[06/31] xorg-drivers: Add opengl distro flag requirement to ati
[07/31] boinc-client: Add distro flag, requires opengl
- Another set of the 'obvious' fixes

[08/31] networkmanager-openvpn: requires openvpn from meta-networking
- requires openvpn from meta-networking, but meta-oe doesn't depend on
meta-networking.  Easiest resolution was to move it.

[09/31] telepathy-python: Move to meta-python, requires python-dbus
- This seems like a reasonable move to meta-python

[10/31] networkmanager: Move to meta-networking, requires dnsmasq
- This moves the rest of networkmanager to meta-networking

[11/31] python-ldap: Move to meta-networking, requires cyrus-sasl
- I originally was going to move to meta-python, but that doesn't depend on
meta-networking... so move it there instead

[12/31] python-networkmanager: Move to networking, requires networkmanager
- Due to the prior moves, move this as well to meta-networking

[13/31] corosync: Requires net-snmp from meta-networking
- Again move to meta-networking due to dep

[14/31] pywbem: Requires python-m2crypto-native (and others)
- This is one I'm not sure if it's the right thing or not.. but it does
require meta-python.. so move it.

[15/31] dlm: requires corosync, from meta-networking
- Again move to meta-networking due to prior move

[16/31] open-vm-tools: only build if meta-networking and meta-filesystems
- open-vm-tools requires libdnet (meta-networking) and fuse (meta-filesystem)
I think this is a dubious way to 'fix' the issue, but I really couldn't think
of a better way.

[17/31] miniupnpd: Move to meta-networking, requires libnetfilter-conntrack
- Move to meta-networking due to dependency...

[18/31] enable_gnome.conf: Move the AVAHI_GTK setting
- The yp-compat script does not allow a layer to modify the system wide
configuration (including modifying other recipe behavior).  The AVHAI_GTK
changes the behavior of that recipe, which is detected by the script.  So
I choose to move this to a configuration file that will need to be required
by the user IF they want avahi to use GTK.  I'm not happy with this, but I
don't see any other way to meet the requirements.

[19/31] glade3: Move PACKAGECONFIG setting to enable_gnome.conf
- Similar to the above, but with PACKAGECONFIG this time.

[20/31] libart-lgpg: Obsolete, replaced by version in oe-core
- OE core already has this version, remove it.

[21/31] pinpoint: Add dependency on opengl for cogl
- Add the required distro flag...

[22/31] vim: Remove xfce vim bbappend
- This breaks the same rule as 18 and 19.  I didn't see a way to 'fix it',
so I just removed the change.

[23/31] layer.conf: Add meta-networking for the networkmanager
- add meta-networking as a dependency to meta-gnome for networkmanager
this is due to the move above

[24/31] meta-xfce: depend on meta-multimedia
- There was a duplicate openembedded-layer entry, but I think it was
supposed to be for meta-multimedia.  This resolves a bunch of dependency
errors.

[25/31] mpv: Requires ffmpeg which has a LICENSE_FLAGS =
[26/31] recipes-multimedia: Add LICENSE_FLAGS
[27/31] recipes-multimedia: Add LICENSE_FLAGS
- Above items all get LICENSE_FLAGS added to match their dependencies.  This
resolves a dependency issue where the required item(s) are not avaialable.

[28/31] libmtp: remove 'mtp-tools' from PACKAGES
- This is a real bug in mtp-tools, and needs to be fixed.

[29/31] xfce4-mixer: Remove, gstreamer-0.10 is obsolete
- There is no 'fix' for xfce4-mixer using gstreamer-0.10, so remove it...

[30/31] florence: update 0.6.3
- Use Andreas Muller's patch from Oct 2016 to git rid of the gstreamer-0.10
dependency.  Resolve the issue with requiring gtk+3.

[31/31] gstreamer-0.10: Remove as all users are gone and it is
- Remove gstreamer-0.10 as all of the users are now gone.  (This resolves
various preferred provider issues I observed..)


Andreas Müller (1):
  florence: update 0.6.3

Mark Hatle (30):
  iproute2: Move tipc enablement to oe-core
  libml: Move to oe-core
  openipmi: Move to meta-networking requires net-snmp
  glmark2: Set required distro features to opengl
  openlmi-tools: Only build if the necessary python pieces are available
  xorg-drivers: Add opengl distro flag requirement to ati and nouveau
  boinc-client: Add distro flag, requires opengl
  networkmanager-openvpn: requires openvpn from meta-networking
  telepathy-python: Move to meta-python, requires python-dbus
  networkmanager: Move to meta-networking, requires dnsmasq
  python-ldap: Move to meta-networking, requires cyrus-sasl
  python-networkmanager: Move to networking, requires networkmanager
  corosync: Requires net-snmp from meta-networking
  pywbem: Requires python-m2crypto-native (and others) from meta-python
  dlm: requires corosync, from meta-networking
  open-vm-tools: only build if meta-networking and meta-filesystems is
    available
  miniupnpd: Move to meta-networking, requires libnetfilter-conntrack
  enable_gnome.conf: Move the AVAHI_GTK setting
  glade3: Move PACKAGECONFIG setting to enable_gnome.conf
  libart-lgpg: Obsolete, replaced by version in oe-core
  pinpoint: Add dependency on opengl for cogl
  vim: Remove xfce vim bbappend
  layer.conf: Add meta-networking for the networkmanager
  meta-xfce: depend on meta-multimedia
  mpv: Requires ffmpeg which has a LICENSE_FLAGS = commercial set
  recipes-multimedia: Add LICENSE_FLAGS
  recipes-multimedia: Add LICENSE_FLAGS
  libmtp: remove 'mtp-tools' from PACKAGES
  xfce4-mixer: Remove, gstreamer-0.10 is obsolete
  gstreamer-0.10: Remove as all users are gone and it is obsolete

 meta-gnome/README                                  |   5 +
 meta-gnome/conf/enable_gnome.conf                  |   3 +
 meta-gnome/conf/layer.conf                         |   4 +-
 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb   |   5 +-
 .../recipes-devtools/glade/glade3_%.bbappend       |   1 -
 .../libart-lgpl/libart-lgpl/Makefile.am.patch      |  17 -
 .../libart-lgpl/libart-lgpl/aarch64/art_config.h   |  10 -
 .../libart-lgpl/libart-lgpl/aarch64be/art_config.h |  10 -
 .../libart-lgpl/aarch64be_32/art_config.h          |  10 -
 .../libart-lgpl/libart-lgpl/arm/art_config.h       |  10 -
 .../libart-lgpl/libart-lgpl/armeb/art_config.h     |  10 -
 .../libart-lgpl/libart-lgpl/i386/art_config.h      |  10 -
 .../libart-lgpl/libart-lgpl/i586/art_config.h      |  10 -
 .../libart-lgpl/libart-lgpl/i686/art_config.h      |  10 -
 .../libart-lgpl/libart-lgpl/mips/art_config.h      |  10 -
 .../libart-lgpl/libart-lgpl/mips64/art_config.h    |  10 -
 .../libart-lgpl/libart-lgpl/mips64el/art_config.h  |  10 -
 .../libart-lgpl/libart-lgpl/mipsel/art_config.h    |  10 -
 .../libart-lgpl/libart-lgpl/powerpc/art_config.h   |  10 -
 .../libart-lgpl/libart-lgpl/powerpc64/art_config.h |  10 -
 .../libart-lgpl/libart-lgpl/x86_64/art_config.h    |  10 -
 .../libart-lgpl/libart-lgpl_2.3.21.bb              |  28 -
 .../florence/files/fix-no-atspi-compile.patch      |  30 -
 .../recipes-support/florence/florence_0.5.4.bb     |  20 -
 .../recipes-support/florence/florence_0.6.3.bb     |  19 +
 .../miniupnpd/miniupnpd_2.0.bb                     |  37 --
 .../gst-ffmpeg-0.10.13/lower-rank.diff             |  16 -
 .../gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb      |  14 -
 .../gst-fluendo-mpegdemux_0.10.85.bb               |  12 -
 .../gstreamer-0.10/gst-fluendo.inc                 |  14 -
 .../gstreamer-0.10/gst-meta-base_0.10.bb           |  73 ---
 .../gstreamer-0.10/gst-openmax/gcc_4.6.patch       |  18 -
 .../gstreamer-0.10/gst-openmax/ptr-array.patch     |  46 --
 .../gstreamer-0.10/gst-openmax_0.10.1.bb           |  35 --
 .../gst-plugins-bad/buffer-overflow-mp4.patch      |  36 --
 .../gstreamer-0.10/gst-plugins-bad_0.10.23.bb      |  61 --
 ...l.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch |  32 --
 ...le-Fix-build-on-x86-if-emmintrin.h-is-ava.patch |  37 --
 .../configure.ac-fix-subparse-plugin.patch         |  27 -
 .../gst-plugins-base-tremor.patch                  |  20 -
 .../gstreamer-0.10/gst-plugins-base_0.10.36.bb     |  44 --
 ...-conditional-gl-framebuffer-undefined-use.patch |  35 --
 .../gst-plugins-gl/rpi-egl-gles2-dep.patch         |  22 -
 .../gstreamer-0.10/gst-plugins-gl_0.10.3.bb        |  27 -
 ...ild-with-recent-kernels-the-v4l2_buffer-i.patch |  33 --
 ...define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |  45 --
 .../0407-mulawdec-fix-integer-overrun.patch        |  47 --
 .../gstreamer-0.10/gst-plugins-good_0.10.31.bb     |  47 --
 ...sate-for-libcdio-s-recent-cd-text-api-cha.patch | 193 -------
 .../0002-Fix-opencore-include-paths.patch          |  58 --
 .../gstreamer-0.10/gst-plugins-ugly_0.10.19.bb     |  35 --
 .../gstreamer-0.10/gst-plugins.inc                 |  29 -
 ...ecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch |  34 --
 .../gstreamer-0.10/gst-rtsp_0.10.8.bb              |  18 -
 ...ix-self-comparison-always-evaluates-to-tr.patch |  32 --
 ...01-parse-make-grammar.y-work-with-Bison-3.patch |  35 --
 ...2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch |  32 --
 .../gstreamer-0.10.36/check_fix.patch              |  19 -
 .../gst-inspect-check-error.patch                  |  16 -
 .../gstreamer-0.10.36/gstregistrybinary.c          | 487 ----------------
 .../gstreamer-0.10.36/gstregistrybinary.h          | 194 -------
 .../gstreamer-0.10/gstreamer_0.10.36.bb            |  53 --
 .../recipes-multimedia/musicpd/mpd_0.19.21.bb      |   3 +
 .../recipes-multimedia/sox/sox_14.4.0.bb           |   3 +
 .../streamripper/streamripper_1.64.6.bb            |   3 +
 meta-multimedia/recipes-multimedia/vlc/vlc.inc     |   3 +
 .../iproute2/iproute2_%.bbappend                   |   2 -
 .../miniupnpd/miniupnpd_2.0.bb                     |  37 ++
 .../networkmanager/networkmanager-openvpn_1.2.8.bb |  39 ++
 ...adjust-net-headers-for-musl-compatibility.patch |  82 +++
 .../0001-check-for-strndupa-before-using-it.patch  |  67 +++
 ...dns-resolved-add-systemd-resolved-backend.patch | 621 +++++++++++++++++++++
 ...ed-also-check-for-etc-resolv-conf.systemd.patch |  29 +
 ...o-run-sbin-dhclient-to-get-the-version-nu.patch |  36 ++
 ...stemd-xlocale.h-is-dropped-by-newer-glibc.patch |  29 +
 .../0002-Fix-nm-version-macro-includes.patch       |  58 ++
 ...et-util.h-Include-linux-sockios.h-on-musl.patch |  30 +
 ...-string-in-g_dbus_message_new_method_erro.patch |  67 +++
 .../networkmanager/0003-Define-ETH_ALEN.patch      |  39 ++
 ...Define-missing-features-to-cater-for-musl.patch |  93 +++
 ...emove-net-ethernet.h-seems-to-be-over-spe.patch |  36 ++
 .../networkmanager/networkmanager_1.4.4.bb         | 132 +++++
 .../python-networkmanager_2.0.1.bb                 |  13 +
 .../recipes-devtools/python/python-ldap_2.4.41.bb  |  29 +
 .../recipes-extended/corosync/corosync_2.4.2.bb    |  78 +++
 .../respect-ldflags-also-from-bin_ldflags.patch    |  36 ++
 meta-networking/recipes-extended/dlm/dlm_4.0.2.bb  |  51 ++
 .../recipes-filter/libmnl/libmnl_1.0.4.bb          |  13 -
 ...ame-struct-parameter-printf-for-namespace.patch | 618 ++++++++++++++++++++
 .../files/do-not-install-pyc-and-pyo.patch         |  25 +
 .../fix-symlink-install-error-in-cmdlang.patch     |  22 +
 .../openipmi/files/include_sys_types.patch         |  17 +
 .../files/ipmi-init-fix-the-arguments.patch        |  41 ++
 .../recipes-support/openipmi/files/ipmi.service    |  12 +
 .../recipes-support/openipmi/files/openipmi-helper | 512 +++++++++++++++++
 .../files/openipmi-no-openipmigui-man.patch        |  26 +
 ...openipmi-remove-host-path-from-la_LDFLAGS.patch |  50 ++
 .../recipes-support/openipmi/openipmi_2.0.24.bb    | 110 ++++
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   |   4 +-
 .../recipes-connectivity/libmtp/libmtp_1.1.5.bb    |   4 +-
 .../networkmanager/networkmanager-openvpn_1.2.8.bb |  39 --
 ...adjust-net-headers-for-musl-compatibility.patch |  82 ---
 .../0001-check-for-strndupa-before-using-it.patch  |  67 ---
 ...dns-resolved-add-systemd-resolved-backend.patch | 621 ---------------------
 ...ed-also-check-for-etc-resolv-conf.systemd.patch |  29 -
 ...o-run-sbin-dhclient-to-get-the-version-nu.patch |  36 --
 ...stemd-xlocale.h-is-dropped-by-newer-glibc.patch |  29 -
 .../0002-Fix-nm-version-macro-includes.patch       |  58 --
 ...et-util.h-Include-linux-sockios.h-on-musl.patch |  30 -
 ...-string-in-g_dbus_message_new_method_erro.patch |  67 ---
 .../networkmanager/0003-Define-ETH_ALEN.patch      |  39 --
 ...Define-missing-features-to-cater-for-musl.patch |  93 ---
 ...emove-net-ethernet.h-seems-to-be-over-spe.patch |  36 --
 .../networkmanager/networkmanager_1.4.4.bb         | 132 -----
 .../telepathy-python-0.15.19/parallel_make.patch   |  43 --
 .../remove_duplicate_install.patch                 |  26 -
 .../telepathy-python_fix_for_automake_1.12.patch   |  26 -
 .../telepathy/telepathy-python_0.15.19.bb          |  32 --
 .../recipes-extended/boinc/boinc-client_7.6.33.bb  |   4 +-
 .../recipes-extended/corosync/corosync_2.4.2.bb    |  78 ---
 .../respect-ldflags-also-from-bin_ldflags.patch    |  36 --
 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb          |  51 --
 .../openlmi/openlmi-tools_0.10.5.bb                |   5 +
 meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb    |  36 --
 .../xorg-driver/xf86-video-ati_7.8.0.bb            |   3 +
 .../xorg-driver/xf86-video-nouveau_1.0.15.bb       |   4 +
 meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb   |   3 +
 .../open-vm-tools/open-vm-tools_10.1.5.bb          |   7 +
 ...ame-struct-parameter-printf-for-namespace.patch | 618 --------------------
 .../files/do-not-install-pyc-and-pyo.patch         |  25 -
 .../fix-symlink-install-error-in-cmdlang.patch     |  22 -
 .../openipmi/files/include_sys_types.patch         |  17 -
 .../files/ipmi-init-fix-the-arguments.patch        |  41 --
 .../recipes-support/openipmi/files/ipmi.service    |  12 -
 .../recipes-support/openipmi/files/openipmi-helper | 512 -----------------
 .../files/openipmi-no-openipmigui-man.patch        |  26 -
 ...openipmi-remove-host-path-from-la_LDFLAGS.patch |  50 --
 .../recipes-support/openipmi/openipmi_2.0.24.bb    | 110 ----
 .../python-networkmanager_2.0.1.bb                 |  13 -
 .../telepathy-python-0.15.19/parallel_make.patch   |  43 ++
 .../remove_duplicate_install.patch                 |  26 +
 .../telepathy-python_fix_for_automake_1.12.patch   |  26 +
 .../telepathy/telepathy-python_0.15.19.bb          |  32 ++
 .../recipes-devtools/python/python-ldap_2.4.41.bb  |  29 -
 .../recipes-extended/pywbem/pywbem_0.8.0.bb        |  36 ++
 meta-xfce/conf/layer.conf                          |   2 +-
 .../recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb |  14 -
 .../packagegroups/packagegroup-xfce-multimedia.bb  |   4 +
 .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb     |   3 +
 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb  |   3 +
 meta-xfce/recipes-support/vim/vim_%.bbappend       |   6 -
 .../packagegroups/packagegroup-xfce-extended.bb    |   1 -
 152 files changed, 3283 insertions(+), 5465 deletions(-)
 create mode 100644 meta-gnome/conf/enable_gnome.conf
 delete mode 100644 meta-gnome/recipes-devtools/glade/glade3_%.bbappend
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/Makefile.am.patch
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be_32/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/arm/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/armeb/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i386/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i586/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i686/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64el/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mipsel/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc64/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/x86_64/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb
 delete mode 100644 meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
 delete mode 100644 meta-gnome/recipes-support/florence/florence_0.5.4.bb
 create mode 100644 meta-gnome/recipes-support/florence/florence_0.6.3.bb
 delete mode 100644 meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/lower-rank.diff
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo.inc
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/gcc_4.6.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/ptr-array.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad/buffer-overflow-mp4.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/0001-aclocal.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/rpi-egl-gles2-dep.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0002-Fix-opencore-include-paths.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-parse-make-grammar.y-work-with-Bison-3.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/check_fix.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gst-inspect-check-error.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.c
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.h
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
 delete mode 100644 meta-networking/recipes-connectivity/iproute2/iproute2_%.bbappend
 create mode 100644 meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-check-for-strndupa-before-using-it.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fix-nm-version-macro-includes.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
 create mode 100644 meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
 create mode 100644 meta-networking/recipes-devtools/python/python-ldap_2.4.41.bb
 create mode 100644 meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
 create mode 100644 meta-networking/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
 create mode 100644 meta-networking/recipes-extended/dlm/dlm_4.0.2.bb
 delete mode 100644 meta-networking/recipes-filter/libmnl/libmnl_1.0.4.bb
 create mode 100644 meta-networking/recipes-support/openipmi/files/0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/include_sys_types.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/ipmi.service
 create mode 100755 meta-networking/recipes-support/openipmi/files/openipmi-helper
 create mode 100644 meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
 create mode 100644 meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
 create mode 100644 meta-networking/recipes-support/openipmi/openipmi_2.0.24.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-check-for-strndupa-before-using-it.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-Fix-nm-version-macro-includes.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
 delete mode 100644 meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
 delete mode 100644 meta-oe/recipes-extended/dlm/dlm/respect-ldflags-also-from-bin_ldflags.patch
 delete mode 100644 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
 delete mode 100644 meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
 delete mode 100644 meta-oe/recipes-support/openipmi/files/0001-lanserv-Rename-struct-parameter-printf-for-namespace.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/do-not-install-pyc-and-pyo.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/include_sys_types.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/ipmi.service
 delete mode 100755 meta-oe/recipes-support/openipmi/files/openipmi-helper
 delete mode 100644 meta-oe/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
 delete mode 100644 meta-oe/recipes-support/openipmi/openipmi_2.0.24.bb
 delete mode 100644 meta-python/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
 create mode 100644 meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
 create mode 100644 meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
 create mode 100644 meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
 create mode 100644 meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-ldap_2.4.41.bb
 create mode 100644 meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb
 delete mode 100644 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
 delete mode 100644 meta-xfce/recipes-support/vim/vim_%.bbappend

-- 
1.8.3.1



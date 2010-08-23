Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OnOcp-0003Oo-EK
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 06:27:36 +0200
Received: by pvg6 with SMTP id 6so2175725pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 21:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=1wtU5t1cDLLiUB5U8jxn9P4WxsGtrmlpPUNWnbmiSa0=;
	b=t43UzhT6F0Wyvfh2wLXhbcUrTZNS3a13JwCNYIEuBz39Eq/6BxNRVCy2st3HeMYSA2
	efJGSbmLmWW6uLdkoprpmeQzRtO/bnFz2VgN69Co4qlm8WWnqv8inBa2hT+P8Yx7Q39P
	PCDhsuMHKs3Cz1Pr825fso8uzccnRFVLrfnPI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ppPUUz4dvXrey6+IuJKdLDW4vIGBEGkRELvFm7jboNN5LQ9zcsQOIaMdnxQ+qsV4z8
	1lcHAaeFNcQMwWTrykMAFdRfamKcL1Maax5/DmS17yvJGGCRg5OjCl0jZzfZPdeN/YlW
	BCEEXnzDhE4bfI/sfbuS7ShlTqM6efw/vDLQM=
Received: by 10.114.111.1 with SMTP id j1mr5293103wac.207.1282537601339;
	Sun, 22 Aug 2010 21:26:41 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s5sm11692086wak.12.2010.08.22.21.26.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 22 Aug 2010 21:26:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 21:26:34 -0700
Message-Id: <1282537594-18263-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,URI_HEX
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH,v2] ncurses_5.7.bb,recipes: Make DEFAULT_PREFERENCE
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
X-List-Received-Date: Mon, 23 Aug 2010 04:27:36 -0000

* Select 5.7 if none pinned.
* Bump PR for recipes which have ncurses dependency.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/aalib/aalib_1.4rc5.bb                   |    2 +-
 recipes/alsa/alsa-scenario_0.2.bb               |    2 +-
 recipes/alsa/alsa-scenario_git.bb               |    2 +-
 recipes/alsa/alsa-utils_1.0.17.bb               |    1 +
 recipes/alsa/alsa-utils_1.0.18.bb               |    2 +-
 recipes/alsa/alsa-utils_1.0.19.bb               |    3 +--
 recipes/alsa/alsa-utils_1.0.20.bb               |    3 +--
 recipes/asterisk/asterisk_1.2.24.bb             |    2 +-
 recipes/asterisk/asterisk_1.2.28.bb             |    2 +-
 recipes/aumix/aumix_2.8.bb                      |    1 +
 recipes/avrdude/avrdude_5.10.bb                 |    1 +
 recipes/bash/bash_3.0.bb                        |    2 +-
 recipes/bash/bash_3.2.bb                        |    2 +-
 recipes/blassic/blassic_0.10.1.bb               |    1 +
 recipes/btscanner/btscanner_1.0.bb              |    2 +-
 recipes/btscanner/btscanner_2.0.bb              |    2 +-
 recipes/bvi/bvi_1.3.1.bb                        |    2 +-
 recipes/bwm-ng/bwm-ng_0.6.bb                    |    2 +-
 recipes/bwmon/bwmon_1.3.bb                      |    2 +-
 recipes/bzflag/bzflag-server_1.10.6.20040515.bb |    1 +
 recipes/bzflag/bzflag_1.10.6.20040515.bb        |    2 ++
 recipes/centerim/centerim.inc                   |    2 +-
 recipes/centerim/centerim_4.22.5.bb             |    2 +-
 recipes/cscope/cscope_15.7a.bb                  |    1 +
 recipes/dialog/dialog-static_1.1-20080819.bb    |    2 ++
 recipes/dialog/dialog.inc                       |    2 ++
 recipes/dialog/dialog_1.0-20050306.bb           |    2 ++
 recipes/dialog/dialog_1.1-20080819.bb           |    1 +
 recipes/elvis/elvis_2.2.0.bb                    |    1 +
 recipes/emul/emul_1.0.5.bb                      |    2 +-
 recipes/erlang/erlang_R11B.1.bb                 |    3 +++
 recipes/erlang/erlang_R13B01.bb                 |    2 +-
 recipes/ettercap/ettercap-ng_0.7.3.bb           |    2 +-
 recipes/fluidsynth/fluidsynth_1.0.8.bb          |    2 ++
 recipes/frotz/frotz_2.42.bb                     |    2 ++
 recipes/frotz/frotz_2.43.bb                     |    2 ++
 recipes/gdb/gdb_6.3.bb                          |    2 +-
 recipes/gdb/gdb_6.4.bb                          |    2 +-
 recipes/gdb/gdb_6.6.bb                          |    2 +-
 recipes/gdb/gdb_6.7.1.bb                        |    2 +-
 recipes/gdb/gdb_6.8.bb                          |    2 +-
 recipes/gdb/gdb_7.0.bb                          |    2 +-
 recipes/gdb/gdb_7.1.bb                          |    2 +-
 recipes/gettext/gettext_0.17.bb                 |    2 +-
 recipes/gettext/gettext_0.18.bb                 |    2 +-
 recipes/giftcurs/giftcurs_0.6.2.bb              |    2 +-
 recipes/gpm/gpm_1.20.1.bb                       |    2 +-
 recipes/gpm/gpm_1.99.7.bb                       |    2 +-
 recipes/gpsd/gpsd.inc                           |    4 ++--
 recipes/gutenprint/gutenprint_5.1.3.bb          |    4 ++--
 recipes/hnb/hnb_1.9.17+1.9.18pre7.bb            |    2 ++
 recipes/htop/htop_0.7.bb                        |    5 ++---
 recipes/inetutils/inetutils_1.4.2.bb            |    2 ++
 recipes/inetutils/inetutils_1.5.bb              |    2 +-
 recipes/inetutils/inetutils_1.8.bb              |    2 +-
 recipes/iptraf/iptraf_3.0.0.bb                  |    2 +-
 recipes/iptstate/iptstate.inc                   |    2 +-
 recipes/irssi/irssi_0.8.10.bb                   |    2 +-
 recipes/irssi/irssi_0.8.13.bb                   |    1 +
 recipes/irssi/irssi_svn.bb                      |    2 +-
 recipes/joe/joe_3.1.bb                          |    5 ++---
 recipes/lcd4linux/lcd4linux_0.10.0.bb           |    2 +-
 recipes/lcd4linux/lcd4linux_0.11.0-SVN.bb       |    2 +-
 recipes/lcdproc/lcdproc_0.4.5.bb                |    1 +
 recipes/lcdproc/lcdproc_0.4.99+cvs20060123.bb   |    1 +
 recipes/lcdproc/lcdproc_0.5.0.bb                |    2 ++
 recipes/lcdproc/lcdproc_0.5.1.bb                |    2 +-
 recipes/lcdproc/lcdproc_cvs.bb                  |    1 +
 recipes/less/less_418.bb                        |    1 +
 recipes/libedit/libedit_20050118.bb             |    2 +-
 recipes/libtorrent/rtorrent_0.8.6.bb            |    2 +-
 recipes/lxt/lxt_1.0.bb                          |    2 +-
 recipes/mc/mc.inc                               |    2 +-
 recipes/mcabber/mcabber_0.9.9.bb                |    1 +
 recipes/micro-emacs/micro-emacs_20060909.bb     |    1 +
 recipes/mikmod/mikmod_3.2.2-beta1.bb            |    2 +-
 recipes/minicom/minicom_2.1.bb                  |    2 ++
 recipes/minicom/minicom_2.3.bb                  |    2 +-
 recipes/moc/moc_2.4.3.bb                        |    1 +
 recipes/mp3blaster/mp3blaster_3.1.3.bb          |    2 +-
 recipes/mp3blaster/mp3blaster_3.2.0.bb          |    1 +
 recipes/mp3blaster/mp3blaster_3.2.3.bb          |    1 +
 recipes/mp3blaster/mp3blaster_3.2.5.bb          |    1 +
 recipes/mplayer/mplayer-maemo_svn.bb            |    2 +-
 recipes/mplayer/mplayer_0.0+1.0rc1.bb           |    2 +-
 recipes/mplayer/mplayer_0.0+1.0rc2.bb           |    2 +-
 recipes/mplayer/mplayer_git.bb                  |    2 +-
 recipes/mplayer/mplayer_svn.bb                  |    2 +-
 recipes/musicpd/ncmpc_0.11.1.bb                 |    1 +
 recipes/mutt/mutt_1.5.15.bb                     |    2 +-
 recipes/mutt/mutt_1.5.19.bb                     |    2 +-
 recipes/mutt/mutt_1.5.4i.bb                     |    2 +-
 recipes/mutt/mutt_1.5.9i.bb                     |    2 +-
 recipes/mysql/mysql5_5.1.40.inc                 |    2 +-
 recipes/mysql/mysql_4.1.22.bb                   |    2 +-
 recipes/naim/naim_0.11.8.3.1.bb                 |    1 +
 recipes/nano/nano.inc                           |    5 ++---
 recipes/ncdu/ncdu_1.3.bb                        |    1 +
 recipes/ncurses/ncurses_5.7.bb                  |    3 ---
 recipes/netkit-telnet/netkit-telnet_0.17.bb     |    2 +-
 recipes/nmixer/nmixer_2.0.bb                    |    1 +
 recipes/nmon/nmon_13g.bb                        |    1 +
 recipes/nonworking/r/r_2.0.0.bb                 |    1 +
 recipes/nonworking/tetex/tetex_3.0.bb           |    2 +-
 recipes/nzbget/nzbget.inc                       |    2 +-
 recipes/octave/octave.inc                       |    2 ++
 recipes/octave/octave_2.1.73.bb                 |    2 +-
 recipes/octave/octave_2.9.19.bb                 |    2 +-
 recipes/octave/octave_3.0.0.bb                  |    2 +-
 recipes/octave/octave_3.0.3.bb                  |    2 +-
 recipes/octave/octave_3.2.4.bb                  |    1 +
 recipes/orpheus/orpheus_1.5.bb                  |    2 ++
 recipes/perl/libcurses-perl_1.28.bb             |    2 +-
 recipes/pidgin/pidgin.inc                       |    2 +-
 recipes/pine/pine_4.64.bb                       |    1 +
 recipes/powertop/powertop.inc                   |    2 +-
 recipes/procps/procps.inc                       |    5 ++---
 recipes/psmisc/psmisc_20.2.bb                   |    2 +-
 recipes/psmisc/psmisc_21.8.bb                   |    2 +-
 recipes/psmisc/psmisc_22.2.bb                   |    2 +-
 recipes/quagga/quagga.inc                       |    2 +-
 recipes/readline/readline_4.3.bb                |    2 +-
 recipes/readline/readline_5.2.bb                |    2 +-
 recipes/readline/readline_6.1.bb                |    2 +-
 recipes/scli/scli_0.4.0.bb                      |    2 +-
 recipes/screen/screen_4.0.2.bb                  |    2 +-
 recipes/screen/screen_4.0.3.bb                  |    2 +-
 recipes/sl/sl_3.03.bb                           |    1 +
 recipes/sqlite/sqlite3.inc                      |    1 +
 recipes/sqlite/sqlite3_3.6.13.bb                |    1 +
 recipes/sqlite/sqlite3_3.6.20.bb                |    2 +-
 recipes/sqlite/sqlite3_3.6.23.1.bb              |    1 +
 recipes/sqlite/sqlite_2.8.17.bb                 |    2 +-
 recipes/squidview/squidview_0.72.bb             |    2 +-
 recipes/tcpick/tcpick_0.1.22.bb                 |    2 ++
 recipes/tcptrack/tcptrack_1.1.2.bb              |    2 +-
 recipes/testdisk/testdisk_6.5+6.6-WIP.bb        |    1 +
 recipes/texinfo/texinfo_4.13a.bb                |    2 +-
 recipes/texinfo/texinfo_4.8a.bb                 |    2 +-
 recipes/tin/tin.inc                             |    1 +
 recipes/tin/tin_1.9.1.bb                        |    2 +-
 recipes/tmsnc/tmsnc_0.3.2.bb                    |    2 +-
 recipes/tn5250/tn5250_0.16.5.bb                 |    2 +-
 recipes/uim/uim_1.3.1.bb                        |    2 +-
 recipes/uml-utilities/uml-utilities_20040406.bb |    2 +-
 recipes/util-linux-ng/util-linux-ng.inc         |    2 +-
 recipes/util-linux/util-linux.inc               |    2 +-
 recipes/util-linux/util-linux_2.12.bb           |    3 +--
 recipes/util-linux/util-linux_2.12o.bb          |    3 +--
 recipes/util-linux/util-linux_2.12q.bb          |    3 +--
 recipes/util-linux/util-linux_2.12r.bb          |    3 +--
 recipes/vim/vim.inc                             |    2 +-
 recipes/vte/vte_0.16.14.bb                      |    2 +-
 recipes/vte/vte_0.21.5.bb                       |    1 +
 recipes/vte/vte_0.24.0.bb                       |    2 +-
 recipes/xawtv/xawtv_3.93.bb                     |    1 +
 recipes/xorg-app/xterm_207.bb                   |    2 +-
 recipes/xorg-app/xterm_251.bb                   |    2 +-
 recipes/zile/zile_1.7+2.0beta6.bb               |    2 +-
 recipes/zile/zile_2.2.15.bb                     |    2 +-
 recipes/zsh/zsh_4.3.10.bb                       |    2 +-
 161 files changed, 182 insertions(+), 129 deletions(-)

diff --git a/recipes/aalib/aalib_1.4rc5.bb b/recipes/aalib/aalib_1.4rc5.bb
index a958608..a44c550 100644
--- a/recipes/aalib/aalib_1.4rc5.bb
+++ b/recipes/aalib/aalib_1.4rc5.bb
@@ -2,7 +2,7 @@ DEPENDS = "ncurses"
 DESCRIPTION = "An ASCII art gfx library."
 SECTION = "libs"
 LICENSE="LGPL"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/aa-project/aalib-${PV}.tar.gz \
 	   file://configure.patch"
diff --git a/recipes/alsa/alsa-scenario_0.2.bb b/recipes/alsa/alsa-scenario_0.2.bb
index 72afc8d..f08de93 100644
--- a/recipes/alsa/alsa-scenario_0.2.bb
+++ b/recipes/alsa/alsa-scenario_0.2.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "alsa-lib ncurses"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 SRC_URI = "http://sources.slimlogic.co.uk/libscenario/scenario-lib-0.2.0.tar.bz2"
diff --git a/recipes/alsa/alsa-scenario_git.bb b/recipes/alsa/alsa-scenario_git.bb
index ffe2d10..277f296 100644
--- a/recipes/alsa/alsa-scenario_git.bb
+++ b/recipes/alsa/alsa-scenario_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 DEPENDS = "alsa-lib ncurses"
 SRCREV = "8bd7f83d847424eb44704cf1649974b2fda8d8f1"
 PV = "0.2+gitr${SRCREV}"
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/alsa/alsa-utils_1.0.17.bb b/recipes/alsa/alsa-utils_1.0.17.bb
index 174dfd4..f8487c4 100644
--- a/recipes/alsa/alsa-utils_1.0.17.bb
+++ b/recipes/alsa/alsa-utils_1.0.17.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "alsa-lib ncurses"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://alsa-utils-automake.patch \
diff --git a/recipes/alsa/alsa-utils_1.0.18.bb b/recipes/alsa/alsa-utils_1.0.18.bb
index f53de13..cff13ea 100644
--- a/recipes/alsa/alsa-utils_1.0.18.bb
+++ b/recipes/alsa/alsa-utils_1.0.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "alsa-lib ncurses"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://alsa-utils-automake.patch \
diff --git a/recipes/alsa/alsa-utils_1.0.19.bb b/recipes/alsa/alsa-utils_1.0.19.bb
index f4b92bb..597a605 100644
--- a/recipes/alsa/alsa-utils_1.0.19.bb
+++ b/recipes/alsa/alsa-utils_1.0.19.bb
@@ -3,12 +3,11 @@ HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "alsa-lib ncurses"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
 	   file://alsa-utils-remove-xmlto-1.0.19plus.patch \
 	  "
-	
 
 inherit autotools
 
diff --git a/recipes/alsa/alsa-utils_1.0.20.bb b/recipes/alsa/alsa-utils_1.0.20.bb
index 462d919..cca2980 100644
--- a/recipes/alsa/alsa-utils_1.0.20.bb
+++ b/recipes/alsa/alsa-utils_1.0.20.bb
@@ -3,12 +3,11 @@ HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "alsa-lib ncurses"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
 	   file://alsa-utils-remove-xmlto-1.0.19plus.patch \
 	  "
-	
 
 inherit gettext autotools
 
diff --git a/recipes/asterisk/asterisk_1.2.24.bb b/recipes/asterisk/asterisk_1.2.24.bb
index 5610e58..fb2fd4b 100644
--- a/recipes/asterisk/asterisk_1.2.24.bb
+++ b/recipes/asterisk/asterisk_1.2.24.bb
@@ -5,7 +5,7 @@ HOMEPAGE="www.asterisk.org"
 LICENSE="GPL"
 DEPENDS="ncurses zlib openssl curl alsa-lib libogg libvorbis speex"
 SECTION = "console/telephony"
-PR = "r1"
+PR = "r2"
 
 SRC_URI="http://downloads.asterisk.org/pub/telephony/asterisk/releases/${P}.tar.gz \
 	 file://uclibc-compat-getloadavg.patch \
diff --git a/recipes/asterisk/asterisk_1.2.28.bb b/recipes/asterisk/asterisk_1.2.28.bb
index 89e6a95..e49e68d 100644
--- a/recipes/asterisk/asterisk_1.2.28.bb
+++ b/recipes/asterisk/asterisk_1.2.28.bb
@@ -5,7 +5,7 @@ HOMEPAGE="www.asterisk.org"
 LICENSE="GPL"
 DEPENDS="ncurses zlib openssl curl alsa-lib libogg libvorbis speex"
 SECTION = "console/telephony"
-PR = "r1"
+PR = "r2"
 
 SRC_URI="http://ftp.digium.com/pub/asterisk/releases/asterisk-${PV}.tar.gz \
 	 file://uclibc-compat-getloadavg.patch \
diff --git a/recipes/aumix/aumix_2.8.bb b/recipes/aumix/aumix_2.8.bb
index 3599d0d..a4f0af7 100644
--- a/recipes/aumix/aumix_2.8.bb
+++ b/recipes/aumix/aumix_2.8.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "A mixer for the terminal or X11, with mouse support."
 SECTION = "console/multimedia"
 LICENSE = "GPLV2"
 DEPENDS = "ncurses"
+PR = "r1"
 
 SRC_URI = "http://jpj.net/~trevor/aumix/aumix-${PV}.tar.bz2 \
 	   file://configure.patch"
diff --git a/recipes/avrdude/avrdude_5.10.bb b/recipes/avrdude/avrdude_5.10.bb
index 95899d9..e033a11 100644
--- a/recipes/avrdude/avrdude_5.10.bb
+++ b/recipes/avrdude/avrdude_5.10.bb
@@ -1,4 +1,5 @@
 require avrdude.inc
+PR = "r1"
 
 SRC_URI[md5sum] = "69b082683047e054348088fd63bad2ff"
 SRC_URI[sha256sum] = "81501b63d5b8699874d00c9eca42837b85695bc0820ba9843b17f573ce38be5e"
diff --git a/recipes/bash/bash_3.0.bb b/recipes/bash/bash_3.0.bb
index bdbbb83..60e6707 100644
--- a/recipes/bash/bash_3.0.bb
+++ b/recipes/bash/bash_3.0.bb
@@ -1,5 +1,5 @@
 require bash.inc
-PR = "r12"
+PR = "r13"
 
 SRC_URI += "\
   file://bash-3.0-fixes.patch \
diff --git a/recipes/bash/bash_3.2.bb b/recipes/bash/bash_3.2.bb
index 5cf854b..4b8201f 100644
--- a/recipes/bash/bash_3.2.bb
+++ b/recipes/bash/bash_3.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI += "\
            file://builtins.patch \
diff --git a/recipes/blassic/blassic_0.10.1.bb b/recipes/blassic/blassic_0.10.1.bb
index 1a2b4ea..c1882d3 100644
--- a/recipes/blassic/blassic_0.10.1.bb
+++ b/recipes/blassic/blassic_0.10.1.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "classic basic interpreter"
 LICENSE = "GPLv2"
 DEPENDS = "ncurses"
+PR = "r1"
 
 SRC_URI = "http://www.blassic.org/bin/blassic-${PV}.tgz"
 
diff --git a/recipes/btscanner/btscanner_1.0.bb b/recipes/btscanner/btscanner_1.0.bb
index a475b95..d48d05a 100644
--- a/recipes/btscanner/btscanner_1.0.bb
+++ b/recipes/btscanner/btscanner_1.0.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.pentest.co.uk/cgi-bin/viewcat.cgi?cat=downloads&section=01_bluetooth"
 DEPENDS = "bluez-libs gdbm ncurses"
-PR = "r3"
+PR = "r4"
 LICENSE = "GPLv2"
 
 SRC_URI = "http://www.pentest.co.uk/src/btscanner-${PV}.tar.gz \
diff --git a/recipes/btscanner/btscanner_2.0.bb b/recipes/btscanner/btscanner_2.0.bb
index ce101c9..ec5bf66 100644
--- a/recipes/btscanner/btscanner_2.0.bb
+++ b/recipes/btscanner/btscanner_2.0.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.pentest.co.uk/cgi-bin/viewcat.cgi?cat=downloads&section=01_bluetooth"
 DEPENDS = "bluez-libs gdbm ncurses libxml2"
-PR = "r2"
+PR = "r3"
 LICENSE = "GPLv2"
 
 SRC_URI = "http://www.pentest.co.uk/src/btscanner-${PV}.tar.bz2 \
diff --git a/recipes/bvi/bvi_1.3.1.bb b/recipes/bvi/bvi_1.3.1.bb
index 120ef8d..d906e42 100644
--- a/recipes/bvi/bvi_1.3.1.bb
+++ b/recipes/bvi/bvi_1.3.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "binary vi (binary file editor)"
 SECTION = "console/utils"
 DEPENDS = "ncurses"
 LICENSE = "GPL"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz \
 	   file://configure.patch \
diff --git a/recipes/bwm-ng/bwm-ng_0.6.bb b/recipes/bwm-ng/bwm-ng_0.6.bb
index 7fbeed5..3f43d13 100644
--- a/recipes/bwm-ng/bwm-ng_0.6.bb
+++ b/recipes/bwm-ng/bwm-ng_0.6.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Lightweight console network and disk bandwidth monitor"
 LICENSE = "GPLv2"
 DEPENDS = "ncurses"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/bwmng/bwm-ng-${PV}.tar.gz"
 
diff --git a/recipes/bwmon/bwmon_1.3.bb b/recipes/bwmon/bwmon_1.3.bb
index 1e509a1..abdae41 100644
--- a/recipes/bwmon/bwmon_1.3.bb
+++ b/recipes/bwmon/bwmon_1.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Linux bandwidth monitor"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/bwmon/${P}.tar.gz \
            file://makefile.patch"
diff --git a/recipes/bzflag/bzflag-server_1.10.6.20040515.bb b/recipes/bzflag/bzflag-server_1.10.6.20040515.bb
index fb62d79..1885b94 100644
--- a/recipes/bzflag/bzflag-server_1.10.6.20040515.bb
+++ b/recipes/bzflag/bzflag-server_1.10.6.20040515.bb
@@ -1,6 +1,7 @@
 SECTION = "console/network"
 DEPENDS = "adns ncurses"
 LICENSE = "LGPL"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/bzflag/bzflag-${PV}.tar.bz2"
 S = "${WORKDIR}/bzflag-${PV}"
diff --git a/recipes/bzflag/bzflag_1.10.6.20040515.bb b/recipes/bzflag/bzflag_1.10.6.20040515.bb
index e66703f..1c139cc 100644
--- a/recipes/bzflag/bzflag_1.10.6.20040515.bb
+++ b/recipes/bzflag/bzflag_1.10.6.20040515.bb
@@ -1,6 +1,8 @@
 DEPENDS = "adns ncurses virtual/libx11"
 SECTION = "x11/games"
 LICENSE = "LGPL"
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/bzflag/bzflag-${PV}.tar.bz2"
 S = "${WORKDIR}/bzflag-${PV}"
 
diff --git a/recipes/centerim/centerim.inc b/recipes/centerim/centerim.inc
index e0ec6f7..554ccf7 100644
--- a/recipes/centerim/centerim.inc
+++ b/recipes/centerim/centerim.inc
@@ -8,5 +8,5 @@ DEPENDS = "openssl ncurses"
 inherit autotools
 
 SRC_URI = "http://www.centerim.org/download/releases/centerim-4.22.5.tar.gz "
-         
+
 EXTRA_OECONF = "--with-ssl --with-openssl=${STAGING_LIBDIR}/.."
diff --git a/recipes/centerim/centerim_4.22.5.bb b/recipes/centerim/centerim_4.22.5.bb
index 6947fb3..eb57c3e 100644
--- a/recipes/centerim/centerim_4.22.5.bb
+++ b/recipes/centerim/centerim_4.22.5.bb
@@ -1,6 +1,6 @@
 require centerim.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "9bbbdb34ab678d29387171139ae835e1"
 SRC_URI[sha256sum] = "c68abb59043602a2b28fb55d45361d0b22fc1566848cc0c255580914df7b3eb3"
diff --git a/recipes/cscope/cscope_15.7a.bb b/recipes/cscope/cscope_15.7a.bb
index 851855b..3d54404 100644
--- a/recipes/cscope/cscope_15.7a.bb
+++ b/recipes/cscope/cscope_15.7a.bb
@@ -2,6 +2,7 @@ DEPENDS = "ncurses"
 DESCRIPTION = "A text screen-based source browser."
 SECTION = "console/utils"
 LICENSE = "BSD"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cscope/cscope-${PV}.tar.bz2;name=src"
 SRC_URI[src.md5sum] = "da43987622ace8c36bbf14c15a350ec1"
diff --git a/recipes/dialog/dialog-static_1.1-20080819.bb b/recipes/dialog/dialog-static_1.1-20080819.bb
index bfe7690..ddb4ae3 100644
--- a/recipes/dialog/dialog-static_1.1-20080819.bb
+++ b/recipes/dialog/dialog-static_1.1-20080819.bb
@@ -1,4 +1,6 @@
 require dialog.inc
+PR = "${INC_PR}.0"
+
 LDFLAGS += "-static"
 S="${WORKDIR}/dialog-${PV}"
 
diff --git a/recipes/dialog/dialog.inc b/recipes/dialog/dialog.inc
index 8fe0d98..9393634 100644
--- a/recipes/dialog/dialog.inc
+++ b/recipes/dialog/dialog.inc
@@ -5,6 +5,8 @@ DESCRIPTION = "Dialog lets you to present a variety of questions \
 or display messages using dialog boxes from a shell \
 script (or any scripting language)."
 
+INC_PR = "r1"
+
 SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz"
 
 inherit autotools
diff --git a/recipes/dialog/dialog_1.0-20050306.bb b/recipes/dialog/dialog_1.0-20050306.bb
index 030b016..a0645eb 100644
--- a/recipes/dialog/dialog_1.0-20050306.bb
+++ b/recipes/dialog/dialog_1.0-20050306.bb
@@ -1 +1,3 @@
 require dialog.inc
+PR = "${INC_PR}.0"
+
diff --git a/recipes/dialog/dialog_1.1-20080819.bb b/recipes/dialog/dialog_1.1-20080819.bb
index 260d2e4..4a0e838 100644
--- a/recipes/dialog/dialog_1.1-20080819.bb
+++ b/recipes/dialog/dialog_1.1-20080819.bb
@@ -1,4 +1,5 @@
 require dialog.inc
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "3caebd641a9f337b980becb4444336c5"
 SRC_URI[sha256sum] = "c5d49b39c5998bcecd124c05cc6f096d22ccdc378ad455214611ae41a2f4b7d9"
diff --git a/recipes/elvis/elvis_2.2.0.bb b/recipes/elvis/elvis_2.2.0.bb
index cff6f92..0071a0e 100644
--- a/recipes/elvis/elvis_2.2.0.bb
+++ b/recipes/elvis/elvis_2.2.0.bb
@@ -3,6 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "Perl Clarified Artistic License"
 DEPENDS = "ncurses"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.cs.pdx.edu/pub/elvis/elvis-2.2_0.tar.gz"
 S = "${WORKDIR}/elvis-2.2_0"
diff --git a/recipes/emul/emul_1.0.5.bb b/recipes/emul/emul_1.0.5.bb
index cc0bcf3..8fcf645 100644
--- a/recipes/emul/emul_1.0.5.bb
+++ b/recipes/emul/emul_1.0.5.bb
@@ -3,7 +3,7 @@ SECTION = "libs/network"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "virtual/libusb0 ncurses"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://download.berlios.de/emul/emul-${PV}.tar.gz"
 
diff --git a/recipes/erlang/erlang_R11B.1.bb b/recipes/erlang/erlang_R11B.1.bb
index a2a30c9..dc24cd7 100644
--- a/recipes/erlang/erlang_R11B.1.bb
+++ b/recipes/erlang/erlang_R11B.1.bb
@@ -1,4 +1,7 @@
 include erlang.inc
+
+PR = "r1"
+
 DEPENDS += "erlang-native openssl"
 
 SRC_URI += "file://erts-configure.in.patch \
diff --git a/recipes/erlang/erlang_R13B01.bb b/recipes/erlang/erlang_R13B01.bb
index 570b3bb..e2cc6ac 100644
--- a/recipes/erlang/erlang_R13B01.bb
+++ b/recipes/erlang/erlang_R13B01.bb
@@ -1,7 +1,7 @@
 include erlang.inc
 DEPENDS += "erlang-native openssl"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "\
             file://erts-emulator-Makefile.in.patch \
diff --git a/recipes/ettercap/ettercap-ng_0.7.3.bb b/recipes/ettercap/ettercap-ng_0.7.3.bb
index 701a19c..4da5e40 100644
--- a/recipes/ettercap/ettercap-ng_0.7.3.bb
+++ b/recipes/ettercap/ettercap-ng_0.7.3.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 DEPENDS = "virtual/libiconv libnet libpcap openssl libpcre ncurses zlib libtool"
 LICENSE = "GPL"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ettercap/ettercap-NG-${PV}.tar.gz \
            file://autotools.patch \
diff --git a/recipes/fluidsynth/fluidsynth_1.0.8.bb b/recipes/fluidsynth/fluidsynth_1.0.8.bb
index 5f76657..ecf716c 100644
--- a/recipes/fluidsynth/fluidsynth_1.0.8.bb
+++ b/recipes/fluidsynth/fluidsynth_1.0.8.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "Fluidsynth is a software synthesizer"
 HOMEPAGE = "http://www.fluidsynth.org/"
 SECTION = "libs/multimedia"
 LICENSE = "GPLv2"
+PR = "r1"
+
 DEPENDS = "alsa-lib ncurses"
 
 SRC_URI = "http://savannah.nongnu.org/download/fluid/${P}.tar.gz"
diff --git a/recipes/frotz/frotz_2.42.bb b/recipes/frotz/frotz_2.42.bb
index f102305..6faf415 100644
--- a/recipes/frotz/frotz_2.42.bb
+++ b/recipes/frotz/frotz_2.42.bb
@@ -2,6 +2,8 @@ LICENSE = "GPL"
 DESCRIPTION = "Frotz is an interpreter for Infocom games and other Z-machine games."
 HOMEPAGE = "http://www.cs.csubak.edu/~dgriffi/proj/frotz/"
 SECTION = "console/games"
+PR = "r1"
+
 DEPENDS = "ncurses"
 
 SRC_URI = "http://www.cs.csubak.edu/~dgriffi/proj/frotz/files/frotz-${PV}.tar.gz \
diff --git a/recipes/frotz/frotz_2.43.bb b/recipes/frotz/frotz_2.43.bb
index 3a28295..b59f708 100644
--- a/recipes/frotz/frotz_2.43.bb
+++ b/recipes/frotz/frotz_2.43.bb
@@ -2,6 +2,8 @@ LICENSE = "GPL"
 DESCRIPTION = "Frotz is an interpreter for Infocom games and other Z-machine games."
 HOMEPAGE = "http://www.cs.csubak.edu/~dgriffi/proj/frotz/"
 SECTION = "console/games"
+PR = "r1"
+
 DEPENDS = "ncurses"
 
 SRC_URI = "http://www.cs.csubak.edu/~dgriffi/proj/frotz/files/frotz-${PV}.tar.gz \
diff --git a/recipes/gdb/gdb_6.3.bb b/recipes/gdb/gdb_6.3.bb
index 7a227fc..0ebc2e0 100644
--- a/recipes/gdb/gdb_6.3.bb
+++ b/recipes/gdb/gdb_6.3.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv2"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI[md5sum] = "812de9e756d53c749ea5516d9ffa5905"
 SRC_URI[sha256sum] = "c06bf9715436b3a28c189163aa5ca42b46af8286659827f033eaaf7d8b1fc342"
diff --git a/recipes/gdb/gdb_6.4.bb b/recipes/gdb/gdb_6.4.bb
index ff9e3d4..9eff83f 100644
--- a/recipes/gdb/gdb_6.4.bb
+++ b/recipes/gdb/gdb_6.4.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv2"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "7dc98022ee96bba5331f195dc8a5491a"
 SRC_URI[sha256sum] = "719f2bbd79d55cdd6f5e31b49cec49df71ddb32a4439dba678de0e09330096da"
diff --git a/recipes/gdb/gdb_6.6.bb b/recipes/gdb/gdb_6.6.bb
index dab1c7d..24c193f 100644
--- a/recipes/gdb/gdb_6.6.bb
+++ b/recipes/gdb/gdb_6.6.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv2"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI += "file://early_debug_in_nptl.patch;striplevel=0"
 
diff --git a/recipes/gdb/gdb_6.7.1.bb b/recipes/gdb/gdb_6.7.1.bb
index 5fe7bcd..9f59978 100644
--- a/recipes/gdb/gdb_6.7.1.bb
+++ b/recipes/gdb/gdb_6.7.1.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv3"
 
-PR = "r2"
+PR = "r3"
 
 DEFAULT_PREFERENCE_avr32 = "99"
 SRC_URI_avr32 = " http://avr32linux.org/twiki/pub/Main/GDBPatches/gdb-6.7.1.atmel.1.0.3.tar.bz2"
diff --git a/recipes/gdb/gdb_6.8.bb b/recipes/gdb/gdb_6.8.bb
index 51310f3..630ca9e 100644
--- a/recipes/gdb/gdb_6.8.bb
+++ b/recipes/gdb/gdb_6.8.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 SRC_URI += "file://gcc-4.3-build-error.patch;striplevel=0 \
             file://gdb-6.8-fix-compile-karmic.patch"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI[md5sum] = "925695333524108291dc4012c4c9cbb8"
 SRC_URI[sha256sum] = "a3c5455f30ffb3e6eeafb9e54598b48f9fbf46e3e99f431120360c183ddcc889"
diff --git a/recipes/gdb/gdb_7.0.bb b/recipes/gdb/gdb_7.0.bb
index df38a5f..96c267c 100644
--- a/recipes/gdb/gdb_7.0.bb
+++ b/recipes/gdb/gdb_7.0.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv3"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "\
             file://gdb-6.8-fix-compile-karmic.patch"
diff --git a/recipes/gdb/gdb_7.1.bb b/recipes/gdb/gdb_7.1.bb
index 0a2abc7..082a51e 100644
--- a/recipes/gdb/gdb_7.1.bb
+++ b/recipes/gdb/gdb_7.1.bb
@@ -1,7 +1,7 @@
 require gdb.inc
 LICENSE = "GPLv3"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://gdb-6.8-fix-compile-karmic.patch \
 	    file://gdb-tcsetpgrp.patch \
diff --git a/recipes/gettext/gettext_0.17.bb b/recipes/gettext/gettext_0.17.bb
index 0a8b6e8..ff2ae74 100644
--- a/recipes/gettext/gettext_0.17.bb
+++ b/recipes/gettext/gettext_0.17.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The GNU internationalization library."
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
 LICENSE = "GPLv3"
-PR = "r7"
+PR = "r8"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl"
diff --git a/recipes/gettext/gettext_0.18.bb b/recipes/gettext/gettext_0.18.bb
index 98fabf9..b295afb 100644
--- a/recipes/gettext/gettext_0.18.bb
+++ b/recipes/gettext/gettext_0.18.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The GNU internationalization library."
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
 LICENSE = "GPLv3"
-PR = "r1"
+PR = "r2"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl"
diff --git a/recipes/giftcurs/giftcurs_0.6.2.bb b/recipes/giftcurs/giftcurs_0.6.2.bb
index f95cdd3..f86a96f 100644
--- a/recipes/giftcurs/giftcurs_0.6.2.bb
+++ b/recipes/giftcurs/giftcurs_0.6.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 DESCRIPTION = "giFTcurs is a cursed frontend to the giFT daemon and \
 has been described as 'seriously slick'. It wont work that well \
 without giFT, which you should have already."
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://fnord.csbnet.se/giftcurs/giFTcurs-${PV}.tar.gz \
 	   file://m4.patch"
diff --git a/recipes/gpm/gpm_1.20.1.bb b/recipes/gpm/gpm_1.20.1.bb
index c9422bb..f21f22f 100644
--- a/recipes/gpm/gpm_1.20.1.bb
+++ b/recipes/gpm/gpm_1.20.1.bb
@@ -5,7 +5,7 @@ SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
 
-PR = "r3"
+PR = "r4"
 PARALLEL_MAKE = ""
 
 SRC_URI = "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
diff --git a/recipes/gpm/gpm_1.99.7.bb b/recipes/gpm/gpm_1.99.7.bb
index bc24472..4f5ef02 100644
--- a/recipes/gpm/gpm_1.99.7.bb
+++ b/recipes/gpm/gpm_1.99.7.bb
@@ -5,7 +5,7 @@ SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
 	   file://no-docs.patch \
diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
index 01a941b..778afa5 100644
--- a/recipes/gpsd/gpsd.inc
+++ b/recipes/gpsd/gpsd.inc
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "dbus-glib ncurses python"
 PROVIDES = "virtual/gpsd"
-INC_PR = "r7"
+INC_PR = "r8"
 
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
                 --x-libraries=${STAGING_LIBDIR} \
@@ -15,7 +15,7 @@ SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=gpsd \
            file://gpsd-default \
            file://gpsd \
            file://60-gpsd.rules"
-			   
+
 inherit autotools update-rc.d python-dir
 
 INITSCRIPT_NAME = "gpsd"
diff --git a/recipes/gutenprint/gutenprint_5.1.3.bb b/recipes/gutenprint/gutenprint_5.1.3.bb
index afe2ecd..3ccb7ee 100644
--- a/recipes/gutenprint/gutenprint_5.1.3.bb
+++ b/recipes/gutenprint/gutenprint_5.1.3.bb
@@ -1,6 +1,6 @@
 require gutenprint.inc
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "glib-2.0 ijs ncurses cups tiff jpeg libpng gutenprint-native espgs"
 
@@ -25,7 +25,7 @@ EXTRA_OECONF = "\
 		--with-user-guide \
 		--with-samples \
 		--with-escputil \
-		 "		   		   
+		 "
 
 do_configure() {
         gnu-configize
diff --git a/recipes/hnb/hnb_1.9.17+1.9.18pre7.bb b/recipes/hnb/hnb_1.9.17+1.9.18pre7.bb
index d2c9f0b..0f8eb45 100644
--- a/recipes/hnb/hnb_1.9.17+1.9.18pre7.bb
+++ b/recipes/hnb/hnb_1.9.17+1.9.18pre7.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "hnb is a text-mode hierarchical outliner"
 SECTION = "console/pim"
 HOMEPAGE = "http://hnb.sf.net"
 LICENSE = "GPL"
+PR = "r1"
+
 DEPENDS = "ncurses"
 
 SRC_URI = "http://hnb.sourceforge.net/.files/hnb-1.9.18.pre7.tar.gz"
diff --git a/recipes/htop/htop_0.7.bb b/recipes/htop/htop_0.7.bb
index b42489f..5697638 100644
--- a/recipes/htop/htop_0.7.bb
+++ b/recipes/htop/htop_0.7.bb
@@ -3,12 +3,11 @@ HOMEPAGE = "http://htop.sf.net"
 SECTION = "console/utils"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
+PR = "r2"
 
 DEPENDS = "ncurses"
-# actually RDEPENDS, but ncurses-terminfo is only in ncurses-5.7, so RRECOMMENDS for now
-RRECOMMENDS_${PN} = "ncurses-terminfo"
+RDEPENDS_${PN} = "ncurses-terminfo"
 
-PR = "r1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/htop/htop-${PV}.tar.gz \
            file://remove-proc-test.patch"
 
diff --git a/recipes/inetutils/inetutils_1.4.2.bb b/recipes/inetutils/inetutils_1.4.2.bb
index fa38ade..ec79349 100644
--- a/recipes/inetutils/inetutils_1.4.2.bb
+++ b/recipes/inetutils/inetutils_1.4.2.bb
@@ -6,6 +6,8 @@ networking utilities and servers including ftp, ftpd, rcp, \
 rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
 talkd, telnet, telnetd, tftp, tftpd, and uucpd."
 
+PR = "r1"
+
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
 	   file://configure.patch"
 
diff --git a/recipes/inetutils/inetutils_1.5.bb b/recipes/inetutils/inetutils_1.5.bb
index 0795f47..ea69de1 100644
--- a/recipes/inetutils/inetutils_1.5.bb
+++ b/recipes/inetutils/inetutils_1.5.bb
@@ -6,7 +6,7 @@ networking utilities and servers including ftp, ftpd, rcp, \
 rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
 talkd, telnet, telnetd, tftp, tftpd, and uucpd."
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
 "
diff --git a/recipes/inetutils/inetutils_1.8.bb b/recipes/inetutils/inetutils_1.8.bb
index d333206..c6003b4 100644
--- a/recipes/inetutils/inetutils_1.8.bb
+++ b/recipes/inetutils/inetutils_1.8.bb
@@ -6,7 +6,7 @@ networking utilities and servers including ftp, ftpd, rcp, \
 rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
 talkd, telnet, telnetd, tftp, tftpd, and uucpd."
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
 "
diff --git a/recipes/iptraf/iptraf_3.0.0.bb b/recipes/iptraf/iptraf_3.0.0.bb
index 242ec13..0943aa3 100644
--- a/recipes/iptraf/iptraf_3.0.0.bb
+++ b/recipes/iptraf/iptraf_3.0.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Heavyweight console network bandwidth monitor"
 LICENSE = "GPLv2"
 DEPENDS = "ncurses"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = " \
     ${DEBIAN_MIRROR}/main/i/iptraf/iptraf_${PV}.orig.tar.gz;name=archive \
diff --git a/recipes/iptstate/iptstate.inc b/recipes/iptstate/iptstate.inc
index 233526f..fef384c 100644
--- a/recipes/iptstate/iptstate.inc
+++ b/recipes/iptstate/iptstate.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.phildev.net/iptstate/"
 SECTION = "console/network"
 LICENSE = "zlib"
 DEPENDS = "ncurses libnetfilter-conntrack"
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/iptstate/iptstate-${PV}.tar.bz2;name=iptstate-${PV}"
 
diff --git a/recipes/irssi/irssi_0.8.10.bb b/recipes/irssi/irssi_0.8.10.bb
index 6af6569..68634f7 100644
--- a/recipes/irssi/irssi_0.8.10.bb
+++ b/recipes/irssi/irssi_0.8.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://irssi.org/"
 SECTION = "console/network"
 LICENSE = "GPL"
 DEPENDS += "ncurses glib-2.0"
-PR = "r2"
+PR = "r3"
 
 PACKAGES += "${PN}-common"
 FILES_${PN} = "${bindir}/irssi"
diff --git a/recipes/irssi/irssi_0.8.13.bb b/recipes/irssi/irssi_0.8.13.bb
index 363087b..df56dee 100644
--- a/recipes/irssi/irssi_0.8.13.bb
+++ b/recipes/irssi/irssi_0.8.13.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://irssi.org/"
 SECTION = "console/network"
 LICENSE = "GPL"
 DEPENDS += "ncurses glib-2.0"
+PR = "r1"
 
 PACKAGES += "${PN}-common"
 FILES_${PN} = "${bindir}/irssi"
diff --git a/recipes/irssi/irssi_svn.bb b/recipes/irssi/irssi_svn.bb
index 1fc3151..1848400 100644
--- a/recipes/irssi/irssi_svn.bb
+++ b/recipes/irssi/irssi_svn.bb
@@ -4,7 +4,7 @@ SECTION = "console/network"
 LICENSE = "GPL"
 DEPENDS += "ncurses glib-2.0"
 PV = "0.8.11+svn${SRCDATE}"
-PR = "r4"
+PR = "r5"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/joe/joe_3.1.bb b/recipes/joe/joe_3.1.bb
index 003721b..96e78f7 100644
--- a/recipes/joe/joe_3.1.bb
+++ b/recipes/joe/joe_3.1.bb
@@ -2,11 +2,10 @@ SECTION = "console/utils"
 DESCRIPTION = "Console text editor with good functionality, good choice for vi-haters."
 HOMEPAGE = "http://joe-editor.sourceforge.net/"
 LICENSE ="GPL"
-# actually RDEPENDS, but ncurses-terminfo is only in ncurses-5.7, so RRECOMMENDS for now
-RRECOMMENDS_${PN} = "ncurses-terminfo"
+RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/joe-editor/joe-${PV}.tar.gz"
-PR = "r2"
+PR = "r3"
 
 inherit autotools
 
diff --git a/recipes/lcd4linux/lcd4linux_0.10.0.bb b/recipes/lcd4linux/lcd4linux_0.10.0.bb
index 5c7272b..ecb64b4 100644
--- a/recipes/lcd4linux/lcd4linux_0.10.0.bb
+++ b/recipes/lcd4linux/lcd4linux_0.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 DEPENDS = "virtual/libusb0 ncurses readline virtual/libx11"
 
 PV = "0.10.0+0.10.1-RC2"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://ssl.bulix.org/projects/lcd4linux/raw-attachment/wiki/Download/lcd4linux-0.10.1-RC2.tar.gz \
            file://libusb-compat.diff \ 
diff --git a/recipes/lcd4linux/lcd4linux_0.11.0-SVN.bb b/recipes/lcd4linux/lcd4linux_0.11.0-SVN.bb
index 910ce42..a202fd0 100644
--- a/recipes/lcd4linux/lcd4linux_0.11.0-SVN.bb
+++ b/recipes/lcd4linux/lcd4linux_0.11.0-SVN.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 DEPENDS = "virtual/libusb0 ncurses readline virtual/libx11"
 
 PV = "0.11.0-SVN"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF = " --with-glib-prefix=${STAGING_LIBDIR}/.. \
 		--with-glib-exec-prefix=${STAGING_LIBDIR}/.. \
diff --git a/recipes/lcdproc/lcdproc_0.4.5.bb b/recipes/lcdproc/lcdproc_0.4.5.bb
index c70977c..fc63e2a 100644
--- a/recipes/lcdproc/lcdproc_0.4.5.bb
+++ b/recipes/lcdproc/lcdproc_0.4.5.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "http://lcdproc.org"
 LICENSE ="GPL"
 PRIORITY = "optional"
 SECTION = "utils"
+PR = "r1"
 
 DEPENDS = "${@((bb.data.getVar('LCDPROC_DRIVERS',d) or 'curses,text').find('curses') != -1) and 'ncurses' or ''}"
 
diff --git a/recipes/lcdproc/lcdproc_0.4.99+cvs20060123.bb b/recipes/lcdproc/lcdproc_0.4.99+cvs20060123.bb
index 31d88c8..45c8065 100644
--- a/recipes/lcdproc/lcdproc_0.4.99+cvs20060123.bb
+++ b/recipes/lcdproc/lcdproc_0.4.99+cvs20060123.bb
@@ -5,6 +5,7 @@ HOMEPAGE = "http://lcdproc.org"
 LICENSE = "GPL"
 PRIORITY = "optional"
 SECTION = "utils"
+PR = "r1"
 
 DEPENDS = "${@((bb.data.getVar('LCDPROC_DRIVERS',d) or 'curses,text').find('curses') != -1) and 'ncurses' or ''}"
 RRECOMMENDS_lcdproc = "lcdd"
diff --git a/recipes/lcdproc/lcdproc_0.5.0.bb b/recipes/lcdproc/lcdproc_0.5.0.bb
index f5fd037..6bed4d2 100644
--- a/recipes/lcdproc/lcdproc_0.5.0.bb
+++ b/recipes/lcdproc/lcdproc_0.5.0.bb
@@ -1,3 +1,5 @@
 require lcdproc5.inc
+PR = "r1"
+
 SRC_URI[md5sum] = "4b67e421c19063fa322611a849ab5b80"
 SRC_URI[sha256sum] = "a7567f3f68517008e68d15b33630f36ba539540fbb361a2f9c440ce2ceb8393b"
diff --git a/recipes/lcdproc/lcdproc_0.5.1.bb b/recipes/lcdproc/lcdproc_0.5.1.bb
index 3816a3a..3b821f4 100644
--- a/recipes/lcdproc/lcdproc_0.5.1.bb
+++ b/recipes/lcdproc/lcdproc_0.5.1.bb
@@ -3,7 +3,7 @@ require lcdproc5.inc
 DEPENDS += "libg15 g15daemon libg15render"
 DEPENDS_lcdd-driver-all += "lcdd-driver-g15"
 
-PR = "r3"
+PR = "r4"
 
 do_install_append () {
 	# binaries
diff --git a/recipes/lcdproc/lcdproc_cvs.bb b/recipes/lcdproc/lcdproc_cvs.bb
index b330f88..b27f56a 100644
--- a/recipes/lcdproc/lcdproc_cvs.bb
+++ b/recipes/lcdproc/lcdproc_cvs.bb
@@ -6,6 +6,7 @@ LICENSE = "GPL"
 PRIORITY = "optional"
 SECTION = "utils"
 PV = "0.4.99+cvs${SRCDATE}"
+PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/less/less_418.bb b/recipes/less/less_418.bb
index 8a63001..ed36bb8 100644
--- a/recipes/less/less_418.bb
+++ b/recipes/less/less_418.bb
@@ -5,6 +5,7 @@ HOMEPAGE = "http://www.greenwoodsoftware.com/"
 SECTION = "console/utils"
 LICENSE = "BSD"
 DEPENDS = "ncurses"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/less/less-${PV}.tar.gz"
 
diff --git a/recipes/libedit/libedit_20050118.bb b/recipes/libedit/libedit_20050118.bb
index 0963165..4c5ae19 100644
--- a/recipes/libedit/libedit_20050118.bb
+++ b/recipes/libedit/libedit_20050118.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://cvsweb.netbsd.org/bsdweb.cgi/src/lib/libedit/"
 SECTION = "libs"
 LICENSE="BSD"
 DEPENDS = "ncurses"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.linux.ee/pub/gentoo/distfiles/distfiles/libedit-${PV}.tar.bz2 \
 	file://20031222-debian-to-gentoo.patch \
diff --git a/recipes/libtorrent/rtorrent_0.8.6.bb b/recipes/libtorrent/rtorrent_0.8.6.bb
index 38b32e4..d2a4750 100644
--- a/recipes/libtorrent/rtorrent_0.8.6.bb
+++ b/recipes/libtorrent/rtorrent_0.8.6.bb
@@ -7,7 +7,7 @@ DEPENDS = "libtorrent curl ncurses gnutls libgpg-error"
 SRC_URI = "http://libtorrent.rakshasa.no/downloads/rtorrent-${PV}.tar.gz \
            file://autoconf-cross-fix.patch"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools
 
diff --git a/recipes/lxt/lxt_1.0.bb b/recipes/lxt/lxt_1.0.bb
index c7a4cf5..70385b9 100644
--- a/recipes/lxt/lxt_1.0.bb
+++ b/recipes/lxt/lxt_1.0.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 DESCRIPTION = "lxt ncurses filemanager xtree clone"
 PRIORITY = "optional"
 DEPENDS = "ncurses"
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/lxt-1.0"
+PR = "r1"
 
 SRC_URI = "http://www.xtreefanpage.org/download/lxt-1.0.tgz \
 	   file://lxt.patch"
diff --git a/recipes/mc/mc.inc b/recipes/mc/mc.inc
index db52b6b..ef0ae94 100644
--- a/recipes/mc/mc.inc
+++ b/recipes/mc/mc.inc
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 PRIORITY = "optional"
 DEPENDS = "ncurses glib-2.0 glib-2.0-native"
 RDEPENDS_${PN} = "ncurses-terminfo"
-INC_PR = "r5"
+INC_PR = "r6"
 
 SRC_URI = "http://www.ibiblio.org/pub/Linux/utils/file/managers/mc/mc-${PV}.tar.gz"
 
diff --git a/recipes/mcabber/mcabber_0.9.9.bb b/recipes/mcabber/mcabber_0.9.9.bb
index 8177a50..01880f1 100644
--- a/recipes/mcabber/mcabber_0.9.9.bb
+++ b/recipes/mcabber/mcabber_0.9.9.bb
@@ -4,6 +4,7 @@ AUTHOR = "Mikael Berthe"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "ncurses openssl gpgme"
+PR = "r1"
 
 SRC_URI = "http://www.lilotux.net/~mikael/mcabber/files/mcabber-${PV}.tar.bz2"
 
diff --git a/recipes/micro-emacs/micro-emacs_20060909.bb b/recipes/micro-emacs/micro-emacs_20060909.bb
index 1fb7af1..310389c 100644
--- a/recipes/micro-emacs/micro-emacs_20060909.bb
+++ b/recipes/micro-emacs/micro-emacs_20060909.bb
@@ -3,6 +3,7 @@ SECTION = "console/utils"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
+PR = "r1"
 
 S = "${WORKDIR}/me060909"
 
diff --git a/recipes/mikmod/mikmod_3.2.2-beta1.bb b/recipes/mikmod/mikmod_3.2.2-beta1.bb
index 91b140b..86bf79b 100644
--- a/recipes/mikmod/mikmod_3.2.2-beta1.bb
+++ b/recipes/mikmod/mikmod_3.2.2-beta1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A module player based on libmikmod."
 SECTION = "console/multimedia"
 HOMEPAGE = "http://mikmod.raphnet.net"
 DEPENDS = "ncurses libmikmod"
-PR = "r1"
+PR = "r2"
 LICENSE = "GPL"
 SRC_URI = "http://mikmod.raphnet.net/files/mikmod-${PV}.tar.bz2 \
            file://m4.patch"
diff --git a/recipes/minicom/minicom_2.1.bb b/recipes/minicom/minicom_2.1.bb
index 36880a2..de73211 100644
--- a/recipes/minicom/minicom_2.1.bb
+++ b/recipes/minicom/minicom_2.1.bb
@@ -6,6 +6,8 @@ SRC_URI = "http://alioth.debian.org/download.php/123/minicom-${PV}.tar.gz \
 	file://gcc4-scope.patch \
 	file://gcc4-scope2.patch"
 
+PR = "r1"
+
 inherit autotools gettext
 
 do_install() {
diff --git a/recipes/minicom/minicom_2.3.bb b/recipes/minicom/minicom_2.3.bb
index 69939e6..9042594 100644
--- a/recipes/minicom/minicom_2.3.bb
+++ b/recipes/minicom/minicom_2.3.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 SRC_URI = "http://alioth.debian.org/frs/download.php/2332/minicom-${PV}.tar.gz \
 	file://rename-conflicting-functions.patch \
 	"
-
+PR = "r1"
 inherit autotools gettext
 
 do_install() {
diff --git a/recipes/moc/moc_2.4.3.bb b/recipes/moc/moc_2.4.3.bb
index 3ce627b..badc7af 100644
--- a/recipes/moc/moc_2.4.3.bb
+++ b/recipes/moc/moc_2.4.3.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "http://moc.daper.net/"
 SECTION = "console/multimedia"
 LICENSE = "GPL"
 DEPENDS = "ncurses flac"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.daper.net/pub/soft/moc/stable/${PN}-${PV}.tar.bz2"
 
diff --git a/recipes/mp3blaster/mp3blaster_3.1.3.bb b/recipes/mp3blaster/mp3blaster_3.1.3.bb
index 337d37e..207ea4a 100644
--- a/recipes/mp3blaster/mp3blaster_3.1.3.bb
+++ b/recipes/mp3blaster/mp3blaster_3.1.3.bb
@@ -2,7 +2,7 @@ LICENSE = "GPL"
 SECTION = "console/multimedia"
 DESCRIPTION = "A console MP3 player based on ncurses"
 DEPENDS = "ncurses libsidplay libogg libvorbis"
-
+PR = "r1"
 SRC_URI = "http://www.stack.nl/~brama/mp3blaster/src/mp3blaster-${PV}.tar.gz \
 	   file://includedir.patch"
 
diff --git a/recipes/mp3blaster/mp3blaster_3.2.0.bb b/recipes/mp3blaster/mp3blaster_3.2.0.bb
index d57c3ac..fc1f6b6 100644
--- a/recipes/mp3blaster/mp3blaster_3.2.0.bb
+++ b/recipes/mp3blaster/mp3blaster_3.2.0.bb
@@ -2,6 +2,7 @@ LICENSE = "GPL"
 SECTION = "console/multimedia"
 DESCRIPTION = "A console MP3 player based on ncurses"
 DEPENDS = "ncurses libsidplay libogg libvorbis"
+PR = "r1"
 
 SRC_URI = "http://www.stack.nl/~brama/mp3blaster/src/mp3blaster-${PV}.tar.gz \
 	   file://includedir.patch"
diff --git a/recipes/mp3blaster/mp3blaster_3.2.3.bb b/recipes/mp3blaster/mp3blaster_3.2.3.bb
index 4df85b3..4c32bf3 100644
--- a/recipes/mp3blaster/mp3blaster_3.2.3.bb
+++ b/recipes/mp3blaster/mp3blaster_3.2.3.bb
@@ -2,6 +2,7 @@ LICENSE = "GPL"
 SECTION = "console/multimedia"
 DESCRIPTION = "A console MP3 player based on ncurses"
 DEPENDS = "ncurses libogg libvorbis"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/mp3blaster/mp3blaster-${PV}.tar.gz file://includedir.patch"
 
diff --git a/recipes/mp3blaster/mp3blaster_3.2.5.bb b/recipes/mp3blaster/mp3blaster_3.2.5.bb
index 3a80a5a..a8020d9 100644
--- a/recipes/mp3blaster/mp3blaster_3.2.5.bb
+++ b/recipes/mp3blaster/mp3blaster_3.2.5.bb
@@ -2,6 +2,7 @@ LICENSE = "GPL"
 SECTION = "console/multimedia"
 DESCRIPTION = "A console MP3 player based on ncurses"
 DEPENDS = "ncurses libogg libvorbis"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/mp3blaster/mp3blaster-${PV}.tar.gz;name=tarball \
            file://includedir.patch"
diff --git a/recipes/mplayer/mplayer-maemo_svn.bb b/recipes/mplayer/mplayer-maemo_svn.bb
index 1206b51..83229af 100644
--- a/recipes/mplayer/mplayer-maemo_svn.bb
+++ b/recipes/mplayer/mplayer-maemo_svn.bb
@@ -9,7 +9,7 @@ DEFAULT_PREFERENCE_avr32 = "-1"
 SRCREV = "6952"
 PV = "0.0+1.0rc1+svnr${SRCPV}"
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 RCONFLICTS_${PN} = "mplayer"
 
diff --git a/recipes/mplayer/mplayer_0.0+1.0rc1.bb b/recipes/mplayer/mplayer_0.0+1.0rc1.bb
index 5f02394..271d92b 100644
--- a/recipes/mplayer/mplayer_0.0+1.0rc1.bb
+++ b/recipes/mplayer/mplayer_0.0+1.0rc1.bb
@@ -41,7 +41,7 @@ ARM_INSTRUCTION_SET = "ARM"
 
 RCONFLICTS_${PN} = "mplayer-atty"
 RREPLACES_${PN} = "mplayer-atty"
-PR = "r19"
+PR = "r20"
 
 PARALLEL_MAKE = ""
 
diff --git a/recipes/mplayer/mplayer_0.0+1.0rc2.bb b/recipes/mplayer/mplayer_0.0+1.0rc2.bb
index 298aa7e..4c4d590 100644
--- a/recipes/mplayer/mplayer_0.0+1.0rc2.bb
+++ b/recipes/mplayer/mplayer_0.0+1.0rc2.bb
@@ -46,7 +46,7 @@ ARM_INSTRUCTION_SET = "ARM"
 RCONFLICTS_${PN} = "mplayer-atty"
 RREPLACES_${PN} = "mplayer-atty"
 
-PR = "r15"
+PR = "r16"
 
 PARALLEL_MAKE = ""
 
diff --git a/recipes/mplayer/mplayer_git.bb b/recipes/mplayer/mplayer_git.bb
index ca41174..b9cb16c 100644
--- a/recipes/mplayer/mplayer_git.bb
+++ b/recipes/mplayer/mplayer_git.bb
@@ -35,7 +35,7 @@ RCONFLICTS_${PN} = "mplayer-atty"
 RREPLACES_${PN} = "mplayer-atty"
 
 PV = "0.0+1.0rc4+gitr${SRCPV}"
-PR = "r3"
+PR = "r4"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_shr = "2"
 
diff --git a/recipes/mplayer/mplayer_svn.bb b/recipes/mplayer/mplayer_svn.bb
index 13ffb89..42907d1 100644
--- a/recipes/mplayer/mplayer_svn.bb
+++ b/recipes/mplayer/mplayer_svn.bb
@@ -43,7 +43,7 @@ RCONFLICTS_${PN} = "mplayer-atty"
 RREPLACES_${PN} = "mplayer-atty"
 
 PV = "0.0+1.0rc3+svnr${SRCPV}"
-PR = "r24"
+PR = "r25"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_angstrom = "1"
 DEFAULT_PREFERENCE_shr = "1"
diff --git a/recipes/musicpd/ncmpc_0.11.1.bb b/recipes/musicpd/ncmpc_0.11.1.bb
index 4e19e0c..93909a5 100644
--- a/recipes/musicpd/ncmpc_0.11.1.bb
+++ b/recipes/musicpd/ncmpc_0.11.1.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://www.musicpd.org/ncmpc.shtml"
 SECTION = "console/multimedia"
 LICENSE = "GPLv2"
 DEPENDS = "ncurses glib-2.0"
+PR = "r1"
 
 SRC_URI = "http://mercury.chem.pitt.edu/~shank/ncmpc-${PV}.tar.gz"
 
diff --git a/recipes/mutt/mutt_1.5.15.bb b/recipes/mutt/mutt_1.5.15.bb
index 6fa1586..dadeda0 100644
--- a/recipes/mutt/mutt_1.5.15.bb
+++ b/recipes/mutt/mutt_1.5.15.bb
@@ -7,7 +7,7 @@ bindings, keyboard macros, mail threading, regular expression \
 searches, and a powerful pattern matching language for selecting \
 groups of messages."
 LICENSE = "GPL"
-PR = "r0"
+PR = "r1"
 SRC_URI = "ftp://ftp.mutt.org/mutt/devel/mutt-${PV}.tar.gz;name=archive \
            http://mutt.org.ua/download/mutt-1.5.15/patch-1.5.15.vvv.nntp.2.gz;apply=yes;name=patch1 \
            http://mutt.org.ua/download/mutt-1.5.15/patch-1.5.15.vvv.initials.gz;apply=yes;name=patch2 \
diff --git a/recipes/mutt/mutt_1.5.19.bb b/recipes/mutt/mutt_1.5.19.bb
index e6ae2f7..672e629 100644
--- a/recipes/mutt/mutt_1.5.19.bb
+++ b/recipes/mutt/mutt_1.5.19.bb
@@ -7,7 +7,7 @@ bindings, keyboard macros, mail threading, regular expression \
 searches, and a powerful pattern matching language for selecting \
 groups of messages."
 LICENSE = "GPL"
-PR = "r1"
+PR = "r2"
 SRC_URI = "ftp://ftp.mutt.org/mutt/devel/mutt-${PV}.tar.gz \
            file://patch-1.5.19.sidebar.20090522.txt;apply=yes \
 	   file://529838-gnutls-autoconf.patch \
diff --git a/recipes/mutt/mutt_1.5.4i.bb b/recipes/mutt/mutt_1.5.4i.bb
index 8237a09..201580a 100644
--- a/recipes/mutt/mutt_1.5.4i.bb
+++ b/recipes/mutt/mutt_1.5.4i.bb
@@ -7,7 +7,7 @@ bindings, keyboard macros, mail threading, regular expression \
 searches, and a powerful pattern matching language for selecting \
 groups of messages."
 LICENSE = "GPL"
-PR = "r1"
+PR = "r2"
 SRC_URI = "ftp://ftp.mutt.org/mutt/devel/mutt-${PV}.tar.gz;name=archive \
 	   http://mutt.kiev.ua/download/mutt-1.5.4/patch-1.5.4.rr.compressed.gz;apply=yes;name=patch1 \
 	   http://mutt.kiev.ua/download/mutt-1.5.4/patch-1.5.4.vvv.nntp.gz;apply=yes;name=patch2 \
diff --git a/recipes/mutt/mutt_1.5.9i.bb b/recipes/mutt/mutt_1.5.9i.bb
index 700834d..4678121 100644
--- a/recipes/mutt/mutt_1.5.9i.bb
+++ b/recipes/mutt/mutt_1.5.9i.bb
@@ -7,7 +7,7 @@ bindings, keyboard macros, mail threading, regular expression \
 searches, and a powerful pattern matching language for selecting \
 groups of messages."
 LICENSE = "GPL"
-PR = "r0"
+PR = "r1"
 SRC_URI = "ftp://ftp.mutt.org/mutt/devel/mutt-${PV}.tar.gz;name=archive \
 	   http://www.mutt.org.ua/download/mutt-1.5.9/patch-1.5.9.rr.compressed.gz;apply=yes;name=rr \
 	   http://www.mutt.org.ua/download/mutt-1.5.9/patch-1.5.9.vvv.nntp.gz;apply=yes;name=nntp \
diff --git a/recipes/mysql/mysql5_5.1.40.inc b/recipes/mysql/mysql5_5.1.40.inc
index 363273f..aa60947 100644
--- a/recipes/mysql/mysql5_5.1.40.inc
+++ b/recipes/mysql/mysql5_5.1.40.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.mysql.com/"
 SECTION = "libs"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
            file://configure.in.patch \
diff --git a/recipes/mysql/mysql_4.1.22.bb b/recipes/mysql/mysql_4.1.22.bb
index d3a4bc9..a97d130 100644
--- a/recipes/mysql/mysql_4.1.22.bb
+++ b/recipes/mysql/mysql_4.1.22.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.mysql.com/"
 SECTION = "libs"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://downloads.mysql.com/archives/mysql-4.1/mysql-${PV}.tar.gz \
            file://autofoo.patch \
diff --git a/recipes/naim/naim_0.11.8.3.1.bb b/recipes/naim/naim_0.11.8.3.1.bb
index b3eac7c..a910838 100644
--- a/recipes/naim/naim_0.11.8.3.1.bb
+++ b/recipes/naim/naim_0.11.8.3.1.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "A console AIM/IRC/ICQ and Lily client"
 SECTION = "console/apps"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
+PR = "r1"
 
 SRC_URI = "http://naim.googlecode.com/files/naim-0.11.8.3.1.tar.bz2"
 
diff --git a/recipes/nano/nano.inc b/recipes/nano/nano.inc
index 41f21ec..cc8c75d 100644
--- a/recipes/nano/nano.inc
+++ b/recipes/nano/nano.inc
@@ -5,10 +5,9 @@ HOMEPAGE = "http://www.nano-editor.org/"
 LICENSE = "GPLv2"
 SECTION = "console/utils"
 DEPENDS = "ncurses"
-# actually RDEPENDS, but ncurses-terminfo is only in ncurses-5.7, so RRECOMMENDS for now
-RRECOMMENDS_${PN} = "ncurses-terminfo"
+RDEPENDS_${PN} = "ncurses-terminfo"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 PV_MAJOR = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 
diff --git a/recipes/ncdu/ncdu_1.3.bb b/recipes/ncdu/ncdu_1.3.bb
index a51af71..9de18f0 100644
--- a/recipes/ncdu/ncdu_1.3.bb
+++ b/recipes/ncdu/ncdu_1.3.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "NCurses Disk Usage"
 DEPENDS = "ncurses"
+PR = "r1"
 
 SRC_URI = "http://dev.yorhel.nl/download/ncdu-${PV}.tar.gz"
 
diff --git a/recipes/ncurses/ncurses_5.7.bb b/recipes/ncurses/ncurses_5.7.bb
index ab029ae..57374ec 100644
--- a/recipes/ncurses/ncurses_5.7.bb
+++ b/recipes/ncurses/ncurses_5.7.bb
@@ -6,9 +6,6 @@ PATCHDATE = "20100501"
 PKGV = "${PV}+${PATCHDATE}"
 PR = "r11"
 
-# recipe is experimental for now...
-DEFAULT_PREFERENCE = "-99"
-
 DEPENDS = "ncurses-native unifdef-native"
 DEPENDS_virtclass-native = "unifdef-native"
 
diff --git a/recipes/netkit-telnet/netkit-telnet_0.17.bb b/recipes/netkit-telnet/netkit-telnet_0.17.bb
index 2b935f7..317cb79 100644
--- a/recipes/netkit-telnet/netkit-telnet_0.17.bb
+++ b/recipes/netkit-telnet/netkit-telnet_0.17.bb
@@ -2,7 +2,7 @@ SECTION = "base"
 DESCRIPTION = "netkit-telnet includes the telnet daemon and client."
 DEPENDS = "ncurses"
 LICENSE = "BSD"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/netkit-telnet-${PV}.tar.gz \
            file://netkit-telnet-debian_0.17-36.diff \
diff --git a/recipes/nmixer/nmixer_2.0.bb b/recipes/nmixer/nmixer_2.0.bb
index 641a00c..2189b1c 100644
--- a/recipes/nmixer/nmixer_2.0.bb
+++ b/recipes/nmixer/nmixer_2.0.bb
@@ -3,6 +3,7 @@ SECTION = "console/multimedia"
 PRIORITY = "optional"
 DEPENDS = "ncurses"
 LICENSE = "GPL"
+PR = "r1"
 SRC_URI = "http://www.stack.nl/~brama/projects/nmixer/src/nmixer-${PV}.tar.gz"
 
 inherit autotools
diff --git a/recipes/nmon/nmon_13g.bb b/recipes/nmon/nmon_13g.bb
index 0aa4095..623171a 100644
--- a/recipes/nmon/nmon_13g.bb
+++ b/recipes/nmon/nmon_13g.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://nmon.sf.net"
 SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nmon/lmon13g.c"
 
diff --git a/recipes/nonworking/r/r_2.0.0.bb b/recipes/nonworking/r/r_2.0.0.bb
index 0815869..ce25c19 100644
--- a/recipes/nonworking/r/r_2.0.0.bb
+++ b/recipes/nonworking/r/r_2.0.0.bb
@@ -4,6 +4,7 @@ linear and nonlinear modelling, statistical tests, time series analysis, classif
 SECTION = "console/scientific"
 PRIORITY = "optional"
 DEPENDS = "ncurses readline less perl-native r-native"
+PR = "r1"
 
 SRC_URI = "http://www.stats.bris.ac.uk/R/src/base/R-2/R-${PV}.tar.gz \
 	file://configure.patch \
diff --git a/recipes/nonworking/tetex/tetex_3.0.bb b/recipes/nonworking/tetex/tetex_3.0.bb
index ee0f84c..85fa6df 100644
--- a/recipes/nonworking/tetex/tetex_3.0.bb
+++ b/recipes/nonworking/tetex/tetex_3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.tug.org/tetex"
 LICENSE = "GPL"
 SECTION = "console/utils"
 DEPENDS = "tetex-native flex gd ncurses libpng t1lib virtual/libx11 libxau libxext libxt zlib"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "ftp://dante.ctan.org/tex-archive/systems/unix/teTeX/current/distrib/tetex-src-${PV}.tar.gz \
            file://configure.patch"
diff --git a/recipes/nzbget/nzbget.inc b/recipes/nzbget/nzbget.inc
index 33dac31..0a5d102 100644
--- a/recipes/nzbget/nzbget.inc
+++ b/recipes/nzbget/nzbget.inc
@@ -3,7 +3,7 @@ SECTION = "net"
 LICENSE = "GPL"
 HOMEPAGE = "http://nzbget.sourceforge.net/Main_Page"
 DEPENDS = "libsigc++-2.0 libpar2 ncurses libxml2"
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nzbget/nzbget-stable/nzbget-${PV}.tar.gz"
 S = "${WORKDIR}/nzbget-${PV}"
diff --git a/recipes/octave/octave.inc b/recipes/octave/octave.inc
index f7c2978..f28c984 100644
--- a/recipes/octave/octave.inc
+++ b/recipes/octave/octave.inc
@@ -2,6 +2,8 @@ DESCRIPTION = "Matlab alternative for numerical computations"
 HOMEPAGE = "http://www.gnu.org/software/octave/"
 SECTION = "console/scientific"
 LICENSE = "GPL"
+INC_PR = "r3"
+
 DEPENDS = "gperf-native readline ncurses fftw"
 RDEPENDS_${PN} = "libfftw3"
 # fftw compiled with --disable-fortran
diff --git a/recipes/octave/octave_2.1.73.bb b/recipes/octave/octave_2.1.73.bb
index 6d9ead5..5179a40 100644
--- a/recipes/octave/octave_2.1.73.bb
+++ b/recipes/octave/octave_2.1.73.bb
@@ -2,7 +2,7 @@ require octave.inc
 
 SRC_URI = "ftp://ftp.octave.org/pub/octave/obsolete/${PN}-${PV}.tar.gz"
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 PACKAGES =+ "libcruft-dev liboctave-dev liboctinterp-dev"
 
diff --git a/recipes/octave/octave_2.9.19.bb b/recipes/octave/octave_2.9.19.bb
index d3d8f3e..dd4a3e9 100644
--- a/recipes/octave/octave_2.9.19.bb
+++ b/recipes/octave/octave_2.9.19.bb
@@ -6,7 +6,7 @@ SRC_URI = "ftp://ftp.octave.org/pub/octave/${PN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "32cb8153463ebc6ab27bee8b4e538b1a"
 SRC_URI[sha256sum] = "c888ee643451396fc2677a16577d9a2b31cac1b816769d5c915c1a82bbea3cc4"
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 PACKAGES =+ "libcruft liboctave liboctinterp octave-oct \
 	     libcruft-dev liboctave-dev liboctinterp-dev \
diff --git a/recipes/octave/octave_3.0.0.bb b/recipes/octave/octave_3.0.0.bb
index 017a91f..c12113c 100644
--- a/recipes/octave/octave_3.0.0.bb
+++ b/recipes/octave/octave_3.0.0.bb
@@ -3,7 +3,7 @@ require octave.inc
 SRC_URI = "ftp://ftp.octave.org/pub/octave/${PN}-${PV}.tar.gz \
            file://configure.patch"
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 PACKAGES =+ "libcruft liboctave liboctinterp octave-oct \
 	     libcruft-dev liboctave-dev liboctinterp-dev \
diff --git a/recipes/octave/octave_3.0.3.bb b/recipes/octave/octave_3.0.3.bb
index b994f61..bc69178 100644
--- a/recipes/octave/octave_3.0.3.bb
+++ b/recipes/octave/octave_3.0.3.bb
@@ -1,6 +1,6 @@
 require octave.inc
 
-PR = "r2"
+PR = "${INC_PR}.0"
 
 SRC_URI = "ftp://ftp.octave.org/pub/octave/${PN}-${PV}.tar.gz \
            file://configure.patch"
diff --git a/recipes/octave/octave_3.2.4.bb b/recipes/octave/octave_3.2.4.bb
index d2d4d4f..5c1f4b2 100644
--- a/recipes/octave/octave_3.2.4.bb
+++ b/recipes/octave/octave_3.2.4.bb
@@ -1,4 +1,5 @@
 DEFAULT_PREFERENCE = "-1"
+PR = "${INC_PR}.0"
 
 require octave.inc
 
diff --git a/recipes/orpheus/orpheus_1.5.bb b/recipes/orpheus/orpheus_1.5.bb
index 69a416c..de4ef55 100644
--- a/recipes/orpheus/orpheus_1.5.bb
+++ b/recipes/orpheus/orpheus_1.5.bb
@@ -4,6 +4,8 @@ window-driven audio player application for CDs and files in \
 MP3 and Vorbis OGG format."
 DEPENDS = "ncurses"
 LICENSE = "GPL"
+PR = "r1"
+
 SRC_URI = "http://thekonst.net/download/orpheus-${PV}.tar.bz2 \
 	   file://m4.patch"
 S = "${WORKDIR}/orpheus-${PV}"
diff --git a/recipes/perl/libcurses-perl_1.28.bb b/recipes/perl/libcurses-perl_1.28.bb
index 873533c..6b4a886 100644
--- a/recipes/perl/libcurses-perl_1.28.bb
+++ b/recipes/perl/libcurses-perl_1.28.bb
@@ -4,7 +4,7 @@ LICENSE = "Artistic|GPL"
 DEPENDS = "ncurses"
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GI/GIRAFFED/Curses-${PV}.tgz;name=curses-perl-${PV}"
 SRC_URI[curses-perl-1.28.md5sum] = "ed9f7ddf2d90f4266da91c3dc9fad9c9"
diff --git a/recipes/pidgin/pidgin.inc b/recipes/pidgin/pidgin.inc
index 3215268..b93a6d1 100644
--- a/recipes/pidgin/pidgin.inc
+++ b/recipes/pidgin/pidgin.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "multi-protocol instant messaging client"
 SECTION = "x11/network"
 LICENSE = "GPL"
 DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus"
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit autotools gettext pkgconfig gconf
 
diff --git a/recipes/pine/pine_4.64.bb b/recipes/pine/pine_4.64.bb
index bd2d16e..9e66e46 100644
--- a/recipes/pine/pine_4.64.bb
+++ b/recipes/pine/pine_4.64.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Pine(R) - a Program for Internet News & Email"
 SECTION = "console/network"
 LICENSE = "Pine"
 DEPENDS = "ncurses openssl"
+PR = "r1"
 RDEPENDS_pine = "pico"
 HOMEPAGE = "http://www.washington.edu/pine/"
 
diff --git a/recipes/powertop/powertop.inc b/recipes/powertop/powertop.inc
index a113b93..37944b7 100644
--- a/recipes/powertop/powertop.inc
+++ b/recipes/powertop/powertop.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.linuxpowertop.org/"
 LICENSE = "GPLv2"
 DEPENDS = "virtual/libintl ncurses"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "http://www.lesswatts.org/projects/powertop/download/powertop-${PV}.tar.gz \
 	   file://ldflags.patch \
diff --git a/recipes/procps/procps.inc b/recipes/procps/procps.inc
index d720310..fbad8e7 100644
--- a/recipes/procps/procps.inc
+++ b/recipes/procps/procps.inc
@@ -7,10 +7,9 @@ SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
-# actually RDEPENDS, but ncurses-terminfo is only in ncurses-5.7, so RRECOMMENDS for now
-RRECOMMENDS_${PN} = "ncurses-terminfo"
+RDEPENDS_${PN} = "ncurses-terminfo"
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 SRC_URI = "http://procps.sourceforge.net/procps-${PV}.tar.gz;name=tarball \
 	   file://sysctl.conf \
diff --git a/recipes/psmisc/psmisc_20.2.bb b/recipes/psmisc/psmisc_20.2.bb
index 9c72ed8..0e8ab6e 100644
--- a/recipes/psmisc/psmisc_20.2.bb
+++ b/recipes/psmisc/psmisc_20.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "procfs tools"
 SECTION = "base"
 PRIORITY = "required"
 DEPENDS = "ncurses"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
 	   file://gettext.patch"
diff --git a/recipes/psmisc/psmisc_21.8.bb b/recipes/psmisc/psmisc_21.8.bb
index 981f872..6f1ac8b 100644
--- a/recipes/psmisc/psmisc_21.8.bb
+++ b/recipes/psmisc/psmisc_21.8.bb
@@ -1,5 +1,5 @@
 require psmisc.inc
-PR = "r2"
+PR = "r3"
 SRC_URI += "file://signames-header-fix.patch"
 
 SRC_URI[md5sum] = "d6276e071c10ddf4b0d98856e5573e1a"
diff --git a/recipes/psmisc/psmisc_22.2.bb b/recipes/psmisc/psmisc_22.2.bb
index f9c59a2..a883f6d 100644
--- a/recipes/psmisc/psmisc_22.2.bb
+++ b/recipes/psmisc/psmisc_22.2.bb
@@ -1,5 +1,5 @@
 require psmisc.inc
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "77737c817a40ef2c160a7194b5b64337"
 SRC_URI[sha256sum] = "6bca237485a352362133792e000a3c8e367a26b0312c5c607db7c2a97717d15f"
diff --git a/recipes/quagga/quagga.inc b/recipes/quagga/quagga.inc
index 4c95b74..8e86970 100644
--- a/recipes/quagga/quagga.inc
+++ b/recipes/quagga/quagga.inc
@@ -21,7 +21,7 @@ RDEPENDS_${PN}-watchquagga = "${PN}"
 # the "ip" command from busybox is not sufficient (flush by protocol flushes all routes)
 RDEPENDS_${PN}          += "iproute2"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 QUAGGASUBDIR = ""
 
diff --git a/recipes/readline/readline_4.3.bb b/recipes/readline/readline_4.3.bb
index 15be6c8..6d79029 100644
--- a/recipes/readline/readline_4.3.bb
+++ b/recipes/readline/readline_4.3.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 DEPENDS += "ncurses"
 RPROVIDES_${PN} += "readline"
 LEAD_SONAME = "libreadline.so"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${GNU_MIRROR}/readline/readline-${PV}.tar.gz \
 	   file://shlink-termcap.patch \
diff --git a/recipes/readline/readline_5.2.bb b/recipes/readline/readline_5.2.bb
index 845a668..aadb619 100644
--- a/recipes/readline/readline_5.2.bb
+++ b/recipes/readline/readline_5.2.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 DEPENDS += "ncurses"
 RPROVIDES_${PN} += "readline"
 LEAD_SONAME = "libreadline.so"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "\
   ftp://ftp.gnu.org/gnu/readline/readline-${PV}.tar.gz \
diff --git a/recipes/readline/readline_6.1.bb b/recipes/readline/readline_6.1.bb
index c9f0c58..bc821f8 100644
--- a/recipes/readline/readline_6.1.bb
+++ b/recipes/readline/readline_6.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "ncurses"
 LEAD_SONAME = "libreadline.so"
 
 PKGV = "${PV}+p2"
-PR = "r1"
+PR = "r2"
 
 # Don't bring it in silently because there was a switch from GPLv2
 # to GPLv3.  It might require newer ncurses 5.7 too which are not
diff --git a/recipes/scli/scli_0.4.0.bb b/recipes/scli/scli_0.4.0.bb
index 3d24910..3421481 100644
--- a/recipes/scli/scli_0.4.0.bb
+++ b/recipes/scli/scli_0.4.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SNMP Command Line Interface"
 SECTION = "console/network"
 LICENSE = "GPLv2"
 DEPENDS = "gsnmp readline libxml2 ncurses"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.ibr.cs.tu-bs.de/pub/local/scli/scli-${PV}.tar.gz"
 
diff --git a/recipes/screen/screen_4.0.2.bb b/recipes/screen/screen_4.0.2.bb
index 69058d9..bcbd1d4 100644
--- a/recipes/screen/screen_4.0.2.bb
+++ b/recipes/screen/screen_4.0.2.bb
@@ -4,7 +4,7 @@ processes, typically interactive shells."
 LICENSE = "GPL"
 SECTION = "console/utils"
 DEPENDS = "ncurses"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://screen_4.0.2-4.1sarge1.diff.gz \
diff --git a/recipes/screen/screen_4.0.3.bb b/recipes/screen/screen_4.0.3.bb
index a29ab81..4494793 100644
--- a/recipes/screen/screen_4.0.3.bb
+++ b/recipes/screen/screen_4.0.3.bb
@@ -4,7 +4,7 @@ processes, typically interactive shells."
 LICENSE = "GPL"
 SECTION = "console/utils"
 DEPENDS = "ncurses"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://cross-compile.patch \
diff --git a/recipes/sl/sl_3.03.bb b/recipes/sl/sl_3.03.bb
index 5fe3ce1..399e488 100644
--- a/recipes/sl/sl_3.03.bb
+++ b/recipes/sl/sl_3.03.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Corrects you if you type sl by mistake"
 SECTION = "console/games"
 LICENSE = "unknown"
 DEPENDS = "ncurses"
+PR = "r1"
 
 SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/universe/s/sl/sl_3.03.orig.tar.gz;name=archive \
            http://archive.ubuntu.com/ubuntu/pool/universe/s/sl/sl_3.03-14.diff.gz;name=patch"
diff --git a/recipes/sqlite/sqlite3.inc b/recipes/sqlite/sqlite3.inc
index 191c83c..4198f56 100644
--- a/recipes/sqlite/sqlite3.inc
+++ b/recipes/sqlite/sqlite3.inc
@@ -3,6 +3,7 @@ SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "tcl-native readline ncurses"
 LICENSE = "PD"
+INC_PR = "r1"
 
 SRC_URI = "http://www.sqlite.org/sqlite-${PV}.tar.gz \
 	   file://libtool.patch"
diff --git a/recipes/sqlite/sqlite3_3.6.13.bb b/recipes/sqlite/sqlite3_3.6.13.bb
index 610c1b9..b636c5f 100644
--- a/recipes/sqlite/sqlite3_3.6.13.bb
+++ b/recipes/sqlite/sqlite3_3.6.13.bb
@@ -1,4 +1,5 @@
 require sqlite3.inc
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "652a01797e7538811e4997a5847bc026"
 SRC_URI[sha256sum] = "2ca2591847df72224dd6f99c8fffe35bb63bf41a8519d8e15ad48141aa841bfa"
diff --git a/recipes/sqlite/sqlite3_3.6.20.bb b/recipes/sqlite/sqlite3_3.6.20.bb
index 14fce66..edfc220 100644
--- a/recipes/sqlite/sqlite3_3.6.20.bb
+++ b/recipes/sqlite/sqlite3_3.6.20.bb
@@ -1,5 +1,5 @@
 require sqlite3.inc
-
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "0faf8fc8ccff5297513c6532b2b4ce23"
 SRC_URI[sha256sum] = "c172ce97dc7201f38acdff22df467e1514e7225b88c636145e72a66a4ca6d07d"
diff --git a/recipes/sqlite/sqlite3_3.6.23.1.bb b/recipes/sqlite/sqlite3_3.6.23.1.bb
index abc8914..7bed4d4 100644
--- a/recipes/sqlite/sqlite3_3.6.23.1.bb
+++ b/recipes/sqlite/sqlite3_3.6.23.1.bb
@@ -1,4 +1,5 @@
 require sqlite3.inc
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "d99f1b31da0eb33271464bee15cec701"
 SRC_URI[sha256sum] = "1a0517438a573a68ab73e8ed75d194086d55d75883542ab1d5ae1080bbddd492"
diff --git a/recipes/sqlite/sqlite_2.8.17.bb b/recipes/sqlite/sqlite_2.8.17.bb
index e6c4fc5..b83c583 100644
--- a/recipes/sqlite/sqlite_2.8.17.bb
+++ b/recipes/sqlite/sqlite_2.8.17.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "readline ncurses"
 LICENSE = "PD"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.hwaci.com/sw/sqlite/sqlite-${PV}.tar.gz \
        file://mainmk_build_dynamic.patch \
diff --git a/recipes/squidview/squidview_0.72.bb b/recipes/squidview/squidview_0.72.bb
index 017d8cc..efdbb93 100644
--- a/recipes/squidview/squidview_0.72.bb
+++ b/recipes/squidview/squidview_0.72.bb
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
 RDEPENDS_${PN} = "squid"
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/squidview-${PV}"
 
diff --git a/recipes/tcpick/tcpick_0.1.22.bb b/recipes/tcpick/tcpick_0.1.22.bb
index 2c61241..353086e 100644
--- a/recipes/tcpick/tcpick_0.1.22.bb
+++ b/recipes/tcpick/tcpick_0.1.22.bb
@@ -3,6 +3,8 @@ SECTION = "console/network"
 PRIORITY = "required"
 DEPENDS = "ncurses"
 LICENSE = "GPL"
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/tcpick/tcpick-${PV}.tar.gz"
 S = "${WORKDIR}/tcpick-${PV}"
 
diff --git a/recipes/tcptrack/tcptrack_1.1.2.bb b/recipes/tcptrack/tcptrack_1.1.2.bb
index efcdb4b..de9e26a 100644
--- a/recipes/tcptrack/tcptrack_1.1.2.bb
+++ b/recipes/tcptrack/tcptrack_1.1.2.bb
@@ -4,7 +4,7 @@ connections on a specified network interface, tracks their states, and lists \
 them in a manner similar to the Unix 'top' command."
 LICENSE = "LGPL"
 DEPENDS = "ncurses libpcap"
-
+PR = "r1"
 SRC_URI = "http://www.rhythm.cx/~steve/devel/tcptrack/release/${PV}/source/tcptrack-${PV}.tar.gz \
 	   file://macros.patch"
 S = "${WORKDIR}/tcptrack-${PV}"
diff --git a/recipes/testdisk/testdisk_6.5+6.6-WIP.bb b/recipes/testdisk/testdisk_6.5+6.6-WIP.bb
index 89a2308..cd8ea92 100644
--- a/recipes/testdisk/testdisk_6.5+6.6-WIP.bb
+++ b/recipes/testdisk/testdisk_6.5+6.6-WIP.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "TestDisk is a powerful free data recovery software! It was primarily designed to help recover lost partitions and/or make non-booting disks bootable again when these symptoms are caused by faulty software, certain types of viruses or human error (such as accidentally deleting your Partition Table)."
 LICENSE = "GPLv2"
+PR = "r1"
 
 DEPENDS = "jpeg ncurses e2fsprogs"
 
diff --git a/recipes/texinfo/texinfo_4.13a.bb b/recipes/texinfo/texinfo_4.13a.bb
index 04cb0dd..e33537a 100644
--- a/recipes/texinfo/texinfo_4.13a.bb
+++ b/recipes/texinfo/texinfo_4.13a.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/texinfo/"
 SECTION = "console/utils"
 LICENSE = "GPLv3"
 DEPENDS = "ncurses"
-
+PR = "r1"
 SRC_URI = "${GNU_MIRROR}/texinfo/texinfo-${PV}.tar.gz \
            file://gettext.patch \
           "
diff --git a/recipes/texinfo/texinfo_4.8a.bb b/recipes/texinfo/texinfo_4.8a.bb
index fa3b977..57a8d56 100644
--- a/recipes/texinfo/texinfo_4.8a.bb
+++ b/recipes/texinfo/texinfo_4.8a.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/texinfo/"
 SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
-
+PR = "r1"
 SRC_URI = "${GNU_MIRROR}/texinfo/texinfo-${PV}.tar.bz2"
 
 inherit autotools gettext
diff --git a/recipes/tin/tin.inc b/recipes/tin/tin.inc
index 6839628..026cb8e 100644
--- a/recipes/tin/tin.inc
+++ b/recipes/tin/tin.inc
@@ -2,6 +2,7 @@ DESCRIPTION = "Tin is a powerful text mode news reader."
 SECTION = "console/network"
 DEPENDS = "ncurses libpcre"
 LICENSE = "BSD"
+INC_PR = "r2"
 
 inherit autotools 
 
diff --git a/recipes/tin/tin_1.9.1.bb b/recipes/tin/tin_1.9.1.bb
index e38d4bf..e01adcd 100644
--- a/recipes/tin/tin_1.9.1.bb
+++ b/recipes/tin/tin_1.9.1.bb
@@ -1,6 +1,6 @@
 require tin.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 SRC_URI = "ftp://ftp.tin.org/pub/news/clients/tin/v1.9/tin-${PV}.tar.gz \
 	   file://m4.patch"
diff --git a/recipes/tmsnc/tmsnc_0.3.2.bb b/recipes/tmsnc/tmsnc_0.3.2.bb
index 0bf498d..8821f63 100644
--- a/recipes/tmsnc/tmsnc_0.3.2.bb
+++ b/recipes/tmsnc/tmsnc_0.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tmsnc.sf.net"
 SECTION = "console/network"
 LICENSE = "Modified BSD"
 DEPENDS = "ncurses openssl"
-
+PR = "r1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/tmsnc/${P}.tar.gz"
 
 EXTRA_OECONF = "--with-openssl --with-openssl=${STAGING_LIBDIR}/.. --with-includedir=${STAGING_INCDIR}"
diff --git a/recipes/tn5250/tn5250_0.16.5.bb b/recipes/tn5250/tn5250_0.16.5.bb
index 4cab03d..a3ffc88 100644
--- a/recipes/tn5250/tn5250_0.16.5.bb
+++ b/recipes/tn5250/tn5250_0.16.5.bb
@@ -4,7 +4,7 @@ to IBM's AS/400 (now known as eServer iSeries) midrange computers."
 HOMEPAGE = "http://tn5250.sourceforge.net/"
 LICENSE = "LGPL"
 DEPENDS = "ncurses openssl"
-PR ="r1"
+PR ="r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/tn5250/tn5250-${PV}.tar.gz \
 	   file://compile.patch"
diff --git a/recipes/uim/uim_1.3.1.bb b/recipes/uim/uim_1.3.1.bb
index c7ad67b..a993d0d 100644
--- a/recipes/uim/uim_1.3.1.bb
+++ b/recipes/uim/uim_1.3.1.bb
@@ -1,7 +1,7 @@
 require uim.inc
 DEPENDS = "gtk+ uim-native anthy fontconfig libxft libxt glib-2.0 ncurses"
 SECTION_uim-gtk2.0 = "x11/inputmethods"
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://uim-module-manager.patch"
 
diff --git a/recipes/uml-utilities/uml-utilities_20040406.bb b/recipes/uml-utilities/uml-utilities_20040406.bb
index 0d26b7a..db5ad17 100644
--- a/recipes/uml-utilities/uml-utilities_20040406.bb
+++ b/recipes/uml-utilities/uml-utilities_20040406.bb
@@ -2,7 +2,7 @@ SECTION = "console/utils"
 DESCRIPTION = "Utilities for User-Mode-Linux"
 LICENSE = "GPL"
 DEPENDS = "zlib ncurses readline"
-
+PR = "r1"
 SRC_URI = "http://mirror.usermodelinux.org/uml/uml_utilities_${PV}.tar.bz2 \
            file://fix-ldflags.patch"
 SRC_URI[md5sum] = "2c1ccd9efacbfb39e42d482b89b2550a"
diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 5e1f62f..cbdf68d 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -8,7 +8,7 @@ inherit autotools gettext
 
 DEFAULT_PREFERENCE = "-1"
 
-INC_PR = "r26"
+INC_PR = "r27"
 
 # allows for a release candidate
 RC ?= ""
diff --git a/recipes/util-linux/util-linux.inc b/recipes/util-linux/util-linux.inc
index 01b0ad6..eef4645 100644
--- a/recipes/util-linux/util-linux.inc
+++ b/recipes/util-linux/util-linux.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Util-linux is a suite of essential utilities for any Linux system
 SECTION = "base"
 LICENSE = "GPL"
 DEPENDS = "zlib ncurses"
-
+INC_PR = "r16"
 inherit autotools
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux/util-linux-${PV}.tar.bz2 \
diff --git a/recipes/util-linux/util-linux_2.12.bb b/recipes/util-linux/util-linux_2.12.bb
index 79a5572..ee7a3d6 100644
--- a/recipes/util-linux/util-linux_2.12.bb
+++ b/recipes/util-linux/util-linux_2.12.bb
@@ -1,6 +1,5 @@
-PR = "r5"
-
 require util-linux.inc
+PR = "${INC_PR}.0"
 
 SRC_URI = "http://ftp.cwi.nl/aeb/util-linux/util-linux-${PV}.tar.gz \
            file://MCONFIG \
diff --git a/recipes/util-linux/util-linux_2.12o.bb b/recipes/util-linux/util-linux_2.12o.bb
index 2039371..66abb46 100644
--- a/recipes/util-linux/util-linux_2.12o.bb
+++ b/recipes/util-linux/util-linux_2.12o.bb
@@ -1,6 +1,5 @@
 require util-linux.inc
-
-PR = "r8"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "a7c0c2729ed27beac39cf656d2097dd3"
 SRC_URI[sha256sum] = "913a83f69a370b6ee858577f8f1d218cfe899fd39d7b8a380df4971b6059e8e0"
diff --git a/recipes/util-linux/util-linux_2.12q.bb b/recipes/util-linux/util-linux_2.12q.bb
index a7f6c1d..8ff8e0a 100644
--- a/recipes/util-linux/util-linux_2.12q.bb
+++ b/recipes/util-linux/util-linux_2.12q.bb
@@ -3,8 +3,7 @@
 ARM_INSTRUCTION_SET = "arm"
 
 require util-linux.inc
-
-PR = "r7"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "54320aa1abbce00c0dc030e2c3afe5d7"
 SRC_URI[sha256sum] = "2e68a53d1393e97926340d9b21e1bde488aaef05ab3e8bcab4849d1859115c6d"
diff --git a/recipes/util-linux/util-linux_2.12r.bb b/recipes/util-linux/util-linux_2.12r.bb
index 0a7f69c..09ffd5d 100644
--- a/recipes/util-linux/util-linux_2.12r.bb
+++ b/recipes/util-linux/util-linux_2.12r.bb
@@ -1,4 +1,5 @@
 require util-linux.inc
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://util-linux_2.12r-12.diff.gz"
 SRC_URI += "file://glibc-fix.patch"
@@ -6,7 +7,5 @@ SRC_URI += "file://glibc-umount2.patch"
 SRC_URI += "file://fdiskbsdlabel-avr32.patch" 
 SRC_URI += "file://util-linux-2.12r-cramfs-1.patch" 
 
-PR = "r15"
-
 SRC_URI[md5sum] = "af9d9e03038481fbf79ea3ac33f116f9"
 SRC_URI[sha256sum] = "b8e499b338ce9fbd1fb315194b26540ec823c0afc46c9e145ac7a3e38ad57e6b"
diff --git a/recipes/vim/vim.inc b/recipes/vim/vim.inc
index 054d7d8..aa93527 100644
--- a/recipes/vim/vim.inc
+++ b/recipes/vim/vim.inc
@@ -5,7 +5,7 @@ DEPENDS = "ncurses"
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRC_URI = "ftp://ftp.vim.org/pub/vim/unix/vim-${PV}.tar.bz2;name=vim${PV}tarbz2 \
            ftp://ftp.vim.org/pub/vim/extra/vim-${PV}-extra.tar.gz;name=vim${PV}extratargz \
diff --git a/recipes/vte/vte_0.16.14.bb b/recipes/vte/vte_0.16.14.bb
index 854a35a..23f0a8d 100644
--- a/recipes/vte/vte_0.16.14.bb
+++ b/recipes/vte/vte_0.16.14.bb
@@ -1,5 +1,5 @@
 require vte.inc
-PR = "r1"
+PR = "r2"
 
 SRC_URI[archive.md5sum] = "9df3e35b81b209952ac1cf7904f7b620"
 SRC_URI[archive.sha256sum] = "40cf321980d3139c8f084e818504e1366be81bed817eeeec9021257e04c1c0db"
diff --git a/recipes/vte/vte_0.21.5.bb b/recipes/vte/vte_0.21.5.bb
index eca9740..a5e3f64 100644
--- a/recipes/vte/vte_0.21.5.bb
+++ b/recipes/vte/vte_0.21.5.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "vte is a virtual terminal emulator"
 LICENSE = "LGPL"
 DEPENDS += "glib-2.0 gtk+ intltool-native ncurses"
+PR = "r1"
 
 inherit gnome
 
diff --git a/recipes/vte/vte_0.24.0.bb b/recipes/vte/vte_0.24.0.bb
index 6afc089..b6144be 100644
--- a/recipes/vte/vte_0.24.0.bb
+++ b/recipes/vte/vte_0.24.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "vte is a virtual terminal emulator"
 LICENSE = "LGPL"
 DEPENDS += "glib-2.0 gtk+ intltool-native ncurses"
-
+PR = "r1"
 inherit gnome
 
 SRC_URI[archive.md5sum] = "c381f6019448a6e84470ec0acfd78c63"
diff --git a/recipes/xawtv/xawtv_3.93.bb b/recipes/xawtv/xawtv_3.93.bb
index f61a2b4..39d4af4 100644
--- a/recipes/xawtv/xawtv_3.93.bb
+++ b/recipes/xawtv/xawtv_3.93.bb
@@ -4,6 +4,7 @@ DESCRIPTION = "XawTV is a simple Xaw-based TV program which uses the bttw \
 driver or video4linux.  It also contains various command-line utilities for \
 grabbing images and AVI movies, tuning in TV stations, etc."
 DEPENDS = "libxaw libxmu libxt libxpm libxext virtual/libx11 ncurses libxft fs jpeg"
+PR = "r1"
 
 SRC_URI = "http://dl.bytesex.org/releases/xawtv/xawtv-${PV}.tar.gz \
 	   file://make.patch"
diff --git a/recipes/xorg-app/xterm_207.bb b/recipes/xorg-app/xterm_207.bb
index e1d5e20..ac485a7 100644
--- a/recipes/xorg-app/xterm_207.bb
+++ b/recipes/xorg-app/xterm_207.bb
@@ -1,7 +1,7 @@
 require xorg-app-common.inc
 DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
 DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "${XORG_MIRROR}/development/X11R7.0-RC4/extras/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "3de8a3756c284a46a08c6d0308909486"
diff --git a/recipes/xorg-app/xterm_251.bb b/recipes/xorg-app/xterm_251.bb
index 52c8974..388fbc3 100644
--- a/recipes/xorg-app/xterm_251.bb
+++ b/recipes/xorg-app/xterm_251.bb
@@ -1,7 +1,7 @@
 require xorg-app-common.inc
 DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
 DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "ftp://invisible-island.net/xterm/${PN}-${PV}.tgz"
 SRC_URI[md5sum] = "343a4ce213f70c53cf65979f163bebc3"
diff --git a/recipes/zile/zile_1.7+2.0beta6.bb b/recipes/zile/zile_1.7+2.0beta6.bb
index 76c293c..2634525 100644
--- a/recipes/zile/zile_1.7+2.0beta6.bb
+++ b/recipes/zile/zile_1.7+2.0beta6.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 DEPENDS = "ncurses"
 PRIORITY = "optional"
 SECTION = "console/editors"
-PR = "r1"
+PR = "r2"
 
 UV = "${@bb.data.getVar('PV', d, 1).split('+')[1]}"
 
diff --git a/recipes/zile/zile_2.2.15.bb b/recipes/zile/zile_2.2.15.bb
index 7fb4c15..bc7a128 100644
--- a/recipes/zile/zile_2.2.15.bb
+++ b/recipes/zile/zile_2.2.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://zile.sourceforge.net/"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
 SECTION = "console/editors"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/zile/zile-${PV}.tar.gz"
 
diff --git a/recipes/zsh/zsh_4.3.10.bb b/recipes/zsh/zsh_4.3.10.bb
index b6ae18d..b5f13d6 100644
--- a/recipes/zsh/zsh_4.3.10.bb
+++ b/recipes/zsh/zsh_4.3.10.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The Zsh shell"
 SECTION = "base/shell"
 PRIORITY = "optional"
 DEPENDS = "ncurses libpcre"
-PR = "r1"
+PR = "r2"
 LICENSE = "zsh"
 
 SRC_URI = "http://www.zsh.org/pub/zsh-${PV}.tar.bz2 \
-- 
1.7.1




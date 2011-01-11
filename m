Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgas-0000Zw-N1
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:57:11 +0100
Received: by eya28 with SMTP id 28so8986747eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ojrrvPWQV2kwD/k8pC6xS+ZhZwRyAxLtIr52jcc0o3c=;
	b=jiFCoNYzfpPLeGkWUEyurBX73cMVzfR0b6nlOjP5HdjlH+lgSdHcfA06GprQtCzZWY
	Kw7Fd+Bqxo8iMCJWBnYeApTWNKpYoK02yR4s9nWxyXcLUaU1ZTlJE7ctkbuGxdjLF585
	CvhVvAn+msidB/5brBLbz+COHp/iA+nsdZ+xI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PHuAgmEcZ+fFCYTjCWBLwA0AU0k4Ejuv89hbXl+y3o3rHHGJOUwTL9VQG8Ww7b9guG
	LS0rA6kqHDhH4fF/ejrOXsNOViY583r/zwOW6vIKcN3/DCPsBIc0M/XfLgqRhCOvsfpc
	zc4rDirf7TiGSPZc45EX6945VvW3XpsoGImo0=
Received: by 10.223.106.134 with SMTP id x6mr3081487fao.73.1294761401740;
	Tue, 11 Jan 2011 07:56:41 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n7sm7445272fam.35.2011.01.11.07.56.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:26 +0100
Message-Id: <1294761389-13634-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 09/12] xorg-app: obsolete old versions
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
X-List-Received-Date: Tue, 11 Jan 2011 15:57:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg-app/appres_1.0.2.bb          |    8 ++
 recipes/obsolete/xorg-app/bdftopcf_1.0.2.bb        |   10 +++
 recipes/obsolete/xorg-app/beforelight_1.0.3.bb     |    8 ++
 recipes/obsolete/xorg-app/bitmap_1.0.4.bb          |    7 ++
 recipes/obsolete/xorg-app/constype_1.0.2.bb        |    8 ++
 recipes/obsolete/xorg-app/editres_1.0.4.bb         |    7 ++
 recipes/obsolete/xorg-app/fslsfonts_1.0.2.bb       |    7 ++
 recipes/obsolete/xorg-app/fstobdf_1.0.3.bb         |    7 ++
 recipes/obsolete/xorg-app/iceauth_1.0.3.bb         |    8 ++
 recipes/obsolete/xorg-app/ico_1.0.2.bb             |    8 ++
 recipes/obsolete/xorg-app/listres_1.0.1.bb         |    7 ++
 recipes/obsolete/xorg-app/luit_1.0.4.bb            |    8 ++
 recipes/obsolete/xorg-app/mkfontdir_1.0.5.bb       |   10 +++
 recipes/obsolete/xorg-app/mkfontscale_1.0.7.bb     |    9 ++
 recipes/obsolete/xorg-app/oclock_1.0.1.bb          |    7 ++
 recipes/obsolete/xorg-app/proxymngr_1.0.1.bb       |    7 ++
 recipes/obsolete/xorg-app/rendercheck_1.3.bb       |    7 ++
 recipes/obsolete/xorg-app/rgb_1.0.3.bb             |    9 ++
 recipes/obsolete/xorg-app/rstart_1.0.3.bb          |    6 ++
 recipes/obsolete/xorg-app/sessreg_1.0.5.bb         |    7 ++
 recipes/obsolete/xorg-app/setxkbmap_1.1.0.bb       |    7 ++
 recipes/obsolete/xorg-app/showfont_1.0.2.bb        |    7 ++
 recipes/obsolete/xorg-app/smproxy_1.0.3.bb         |    7 ++
 recipes/obsolete/xorg-app/twm_1.0.4.bb             |   13 +++
 recipes/obsolete/xorg-app/viewres_1.0.1.bb         |    7 ++
 recipes/obsolete/xorg-app/x11perf_1.5.1.bb         |   10 +++
 recipes/obsolete/xorg-app/xauth_1.0.4.bb           |    8 ++
 recipes/obsolete/xorg-app/xbacklight_1.1.1.bb      |    8 ++
 recipes/obsolete/xorg-app/xbiff_1.0.1.bb           |    7 ++
 recipes/obsolete/xorg-app/xcalc_1.0.2.bb           |    8 ++
 recipes/obsolete/xorg-app/xclipboard_1.1.0.bb      |    7 ++
 recipes/obsolete/xorg-app/xclock_1.0.4.bb          |    8 ++
 recipes/obsolete/xorg-app/xcmsdb_1.0.2.bb          |    6 ++
 recipes/obsolete/xorg-app/xcompmgr_1.1.4.bb        |    9 ++
 recipes/obsolete/xorg-app/xconsole_1.0.3.bb        |    8 ++
 recipes/obsolete/xorg-app/xcursorgen_1.0.3.bb      |   10 +++
 recipes/obsolete/xorg-app/xdbedizzy_1.0.2.bb       |    7 ++
 recipes/obsolete/xorg-app/xditview_1.0.1.bb        |    7 ++
 recipes/obsolete/xorg-app/xdm_1.1.9.bb             |   15 ++++
 .../obsolete/xorg-app/xdpyinfo/disable-xkb.patch   |   18 +++++
 recipes/obsolete/xorg-app/xdpyinfo_1.1.0.bb        |   12 +++
 recipes/obsolete/xorg-app/xdriinfo_1.0.3.bb        |    8 ++
 recipes/obsolete/xorg-app/xedit_1.1.2.bb           |    7 ++
 recipes/obsolete/xorg-app/xev/diet-x11.patch       |   80 ++++++++++++++++++++
 recipes/obsolete/xorg-app/xev_1.0.4.bb             |    9 ++
 recipes/obsolete/xorg-app/xeyes_1.1.0.bb           |    7 ++
 recipes/obsolete/xorg-app/xf86dga_1.0.2.bb         |    7 ++
 recipes/obsolete/xorg-app/xfd_1.0.1.bb             |    7 ++
 recipes/obsolete/xorg-app/xfontsel_1.0.2.bb        |    7 ++
 recipes/obsolete/xorg-app/xfs_1.1.0.bb             |    8 ++
 recipes/obsolete/xorg-app/xfsinfo_1.0.2.bb         |    7 ++
 recipes/obsolete/xorg-app/xgamma_1.0.3.bb          |    8 ++
 recipes/obsolete/xorg-app/xgc_1.0.1.bb             |    7 ++
 recipes/obsolete/xorg-app/xhost_1.0.3.bb           |    9 ++
 recipes/obsolete/xorg-app/xinit_1.1.1.bb           |    9 ++
 recipes/obsolete/xorg-app/xinput_1.5.0.bb          |    7 ++
 recipes/obsolete/xorg-app/xkbcomp_1.1.1.bb         |    9 ++
 recipes/obsolete/xorg-app/xkbevd_1.1.0.bb          |    7 ++
 recipes/obsolete/xorg-app/xkbprint_1.0.1.bb        |    7 ++
 recipes/obsolete/xorg-app/xkbutils_1.0.2.bb        |    6 ++
 recipes/obsolete/xorg-app/xkill_1.0.2.bb           |    7 ++
 recipes/obsolete/xorg-app/xload_1.0.2.bb           |    8 ++
 recipes/obsolete/xorg-app/xlogo_1.0.1.bb           |    7 ++
 recipes/obsolete/xorg-app/xlsatoms_1.0.2.bb        |    7 ++
 recipes/obsolete/xorg-app/xlsclients_1.0.2.bb      |    7 ++
 recipes/obsolete/xorg-app/xlsfonts_1.0.2.bb        |    6 ++
 recipes/obsolete/xorg-app/xmag_1.0.3.bb            |    8 ++
 recipes/obsolete/xorg-app/xman_1.1.0.bb            |   11 +++
 recipes/obsolete/xorg-app/xmessage_1.0.2.bb        |    8 ++
 recipes/obsolete/xorg-app/xmh_1.0.1.bb             |    7 ++
 recipes/obsolete/xorg-app/xmodmap_1.0.4.bb         |    8 ++
 recipes/obsolete/xorg-app/xmore_1.0.1.bb           |    7 ++
 recipes/obsolete/xorg-app/xprop_1.1.0.bb           |    8 ++
 .../xorg-app/xrandr/resolve_symbol_clash.patch     |   33 ++++++++
 recipes/obsolete/xorg-app/xrandr_1.3.2.bb          |   10 +++
 recipes/obsolete/xorg-app/xrdb_1.0.6.bb            |    9 ++
 recipes/obsolete/xorg-app/xrefresh_1.0.3.bb        |    6 ++
 recipes/obsolete/xorg-app/xrx_1.0.3.bb             |    7 ++
 .../obsolete/xorg-app/xset-1.1.0/disable-xkb.patch |   18 +++++
 recipes/obsolete/xorg-app/xset_1.1.0.bb            |   14 ++++
 recipes/obsolete/xorg-app/xsetroot_1.0.3.bb        |    9 ++
 recipes/obsolete/xorg-app/xsm_1.0.1.bb             |    8 ++
 recipes/obsolete/xorg-app/xstdcmap_1.0.1.bb        |    7 ++
 recipes/obsolete/xorg-app/xterm_207.bb             |   21 +++++
 recipes/obsolete/xorg-app/xterm_251.bb             |   21 +++++
 recipes/obsolete/xorg-app/xvidtune_1.0.1.bb        |    9 ++
 recipes/obsolete/xorg-app/xvinfo_1.1.0.bb          |    8 ++
 recipes/obsolete/xorg-app/xwd_1.0.3.bb             |    7 ++
 recipes/obsolete/xorg-app/xwininfo_1.0.5.bb        |    7 ++
 recipes/obsolete/xorg-app/xwud_1.0.2.bb            |    6 ++
 recipes/xorg-app/appres_1.0.2.bb                   |    8 --
 recipes/xorg-app/bdftopcf_1.0.2.bb                 |   10 ---
 recipes/xorg-app/beforelight_1.0.3.bb              |    8 --
 recipes/xorg-app/bitmap_1.0.4.bb                   |    7 --
 recipes/xorg-app/constype_1.0.2.bb                 |    8 --
 recipes/xorg-app/editres_1.0.4.bb                  |    7 --
 recipes/xorg-app/fslsfonts_1.0.2.bb                |    7 --
 recipes/xorg-app/fstobdf_1.0.3.bb                  |    7 --
 recipes/xorg-app/iceauth_1.0.3.bb                  |    8 --
 recipes/xorg-app/ico_1.0.2.bb                      |    8 --
 recipes/xorg-app/listres_1.0.1.bb                  |    7 --
 recipes/xorg-app/luit_1.0.4.bb                     |    8 --
 .../mkbold-mkitalic-native-0.11/makebifonts        |    5 +
 .../xorg-app/mkbold-mkitalic-native/makebifonts    |    5 -
 recipes/xorg-app/mkfontdir_1.0.5.bb                |   10 ---
 recipes/xorg-app/mkfontscale_1.0.7.bb              |    9 --
 recipes/xorg-app/oclock_1.0.1.bb                   |    7 --
 recipes/xorg-app/proxymngr_1.0.1.bb                |    7 --
 recipes/xorg-app/rendercheck_1.3.bb                |    7 --
 recipes/xorg-app/rgb_1.0.3.bb                      |    9 --
 recipes/xorg-app/rstart_1.0.3.bb                   |    6 --
 recipes/xorg-app/sessreg_1.0.5.bb                  |    7 --
 recipes/xorg-app/setxkbmap_1.1.0.bb                |    7 --
 recipes/xorg-app/showfont_1.0.2.bb                 |    7 --
 recipes/xorg-app/smproxy_1.0.3.bb                  |    7 --
 recipes/xorg-app/twm_1.0.4.bb                      |   13 ---
 recipes/xorg-app/viewres_1.0.1.bb                  |    7 --
 recipes/xorg-app/x11perf_1.5.1.bb                  |   10 ---
 recipes/xorg-app/xauth_1.0.4.bb                    |    8 --
 recipes/xorg-app/xbacklight_1.1.1.bb               |    8 --
 recipes/xorg-app/xbiff_1.0.1.bb                    |    7 --
 recipes/xorg-app/xcalc_1.0.2.bb                    |    8 --
 recipes/xorg-app/xclipboard_1.1.0.bb               |    7 --
 recipes/xorg-app/xclock_1.0.4.bb                   |    8 --
 recipes/xorg-app/xcmsdb_1.0.2.bb                   |    6 --
 recipes/xorg-app/xcompmgr_1.1.4.bb                 |    9 --
 recipes/xorg-app/xconsole_1.0.3.bb                 |    8 --
 recipes/xorg-app/xcursorgen_1.0.3.bb               |   10 ---
 recipes/xorg-app/xdbedizzy_1.0.2.bb                |    7 --
 recipes/xorg-app/xditview_1.0.1.bb                 |    7 --
 recipes/xorg-app/xdm_1.1.9.bb                      |   15 ----
 recipes/xorg-app/xdpyinfo-1.2.0/disable-xkb.patch  |   18 +++++
 recipes/xorg-app/xdpyinfo/disable-xkb.patch        |   18 -----
 recipes/xorg-app/xdpyinfo_1.1.0.bb                 |   12 ---
 recipes/xorg-app/xdriinfo_1.0.3.bb                 |    8 --
 recipes/xorg-app/xedit_1.1.2.bb                    |    7 --
 recipes/xorg-app/xev/diet-x11.patch                |   80 --------------------
 recipes/xorg-app/xev_1.0.4.bb                      |    9 --
 recipes/xorg-app/xeyes_1.1.0.bb                    |    7 --
 recipes/xorg-app/xf86dga_1.0.2.bb                  |    7 --
 recipes/xorg-app/xfd_1.0.1.bb                      |    7 --
 recipes/xorg-app/xfontsel_1.0.2.bb                 |    7 --
 recipes/xorg-app/xfs_1.1.0.bb                      |    8 --
 recipes/xorg-app/xfsinfo_1.0.2.bb                  |    7 --
 recipes/xorg-app/xgamma_1.0.3.bb                   |    8 --
 recipes/xorg-app/xgc_1.0.1.bb                      |    7 --
 recipes/xorg-app/xhost_1.0.3.bb                    |    9 --
 recipes/xorg-app/xinit_1.1.1.bb                    |    9 --
 recipes/xorg-app/xinput_1.5.0.bb                   |    7 --
 recipes/xorg-app/xkbcomp_1.1.1.bb                  |    9 --
 recipes/xorg-app/xkbevd_1.1.0.bb                   |    7 --
 recipes/xorg-app/xkbprint_1.0.1.bb                 |    7 --
 recipes/xorg-app/xkbutils_1.0.2.bb                 |    6 --
 recipes/xorg-app/xkill_1.0.2.bb                    |    7 --
 recipes/xorg-app/xload_1.0.2.bb                    |    8 --
 recipes/xorg-app/xlogo_1.0.1.bb                    |    7 --
 recipes/xorg-app/xlsatoms_1.0.2.bb                 |    7 --
 recipes/xorg-app/xlsclients_1.0.2.bb               |    7 --
 recipes/xorg-app/xlsfonts_1.0.2.bb                 |    6 --
 recipes/xorg-app/xmag_1.0.3.bb                     |    8 --
 recipes/xorg-app/xman_1.1.0.bb                     |   11 ---
 recipes/xorg-app/xmessage_1.0.2.bb                 |    8 --
 recipes/xorg-app/xmh_1.0.1.bb                      |    7 --
 recipes/xorg-app/xmodmap_1.0.4.bb                  |    8 --
 recipes/xorg-app/xmore_1.0.1.bb                    |    7 --
 recipes/xorg-app/xprop_1.1.0.bb                    |    8 --
 recipes/xorg-app/xrandr/resolve_symbol_clash.patch |   33 --------
 recipes/xorg-app/xrandr_1.3.2.bb                   |   10 ---
 recipes/xorg-app/xrdb_1.0.6.bb                     |    9 --
 recipes/xorg-app/xrefresh_1.0.3.bb                 |    6 --
 recipes/xorg-app/xrx_1.0.3.bb                      |    7 --
 recipes/xorg-app/xset-1.1.0/disable-xkb.patch      |   18 -----
 recipes/xorg-app/xset_1.1.0.bb                     |   14 ----
 recipes/xorg-app/xsetroot_1.0.3.bb                 |    9 --
 recipes/xorg-app/xsm_1.0.1.bb                      |    8 --
 recipes/xorg-app/xstdcmap_1.0.1.bb                 |    7 --
 recipes/xorg-app/xterm_207.bb                      |   21 -----
 recipes/xorg-app/xterm_251.bb                      |   21 -----
 recipes/xorg-app/xvidtune_1.0.1.bb                 |    9 --
 recipes/xorg-app/xvinfo_1.1.0.bb                   |    8 --
 recipes/xorg-app/xwd_1.0.3.bb                      |    7 --
 recipes/xorg-app/xwininfo_1.0.5.bb                 |    7 --
 recipes/xorg-app/xwud_1.0.2.bb                     |    6 --
 183 files changed, 882 insertions(+), 864 deletions(-)
 create mode 100644 recipes/obsolete/xorg-app/appres_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/bdftopcf_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/beforelight_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/bitmap_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg-app/constype_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/editres_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg-app/fslsfonts_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/fstobdf_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/iceauth_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/ico_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/listres_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/luit_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg-app/mkfontdir_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg-app/mkfontscale_1.0.7.bb
 create mode 100644 recipes/obsolete/xorg-app/oclock_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/proxymngr_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/rendercheck_1.3.bb
 create mode 100644 recipes/obsolete/xorg-app/rgb_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/rstart_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/sessreg_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg-app/setxkbmap_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-app/showfont_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/smproxy_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/twm_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg-app/viewres_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/x11perf_1.5.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xauth_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg-app/xbacklight_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xbiff_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xcalc_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xclipboard_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-app/xclock_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg-app/xcmsdb_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xcompmgr_1.1.4.bb
 create mode 100644 recipes/obsolete/xorg-app/xconsole_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/xcursorgen_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/xdbedizzy_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xditview_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xdm_1.1.9.bb
 create mode 100644 recipes/obsolete/xorg-app/xdpyinfo/disable-xkb.patch
 create mode 100644 recipes/obsolete/xorg-app/xdpyinfo_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-app/xdriinfo_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/xedit_1.1.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xev/diet-x11.patch
 create mode 100644 recipes/obsolete/xorg-app/xev_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg-app/xeyes_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-app/xf86dga_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xfd_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xfontsel_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xfs_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-app/xfsinfo_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xgamma_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/xgc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xhost_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/xinit_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xinput_1.5.0.bb
 create mode 100644 recipes/obsolete/xorg-app/xkbcomp_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xkbevd_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-app/xkbprint_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xkbutils_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xkill_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xload_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xlogo_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xlsatoms_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xlsclients_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xlsfonts_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xmag_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/xman_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-app/xmessage_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xmh_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xmodmap_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg-app/xmore_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xprop_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-app/xrandr/resolve_symbol_clash.patch
 create mode 100644 recipes/obsolete/xorg-app/xrandr_1.3.2.bb
 create mode 100644 recipes/obsolete/xorg-app/xrdb_1.0.6.bb
 create mode 100644 recipes/obsolete/xorg-app/xrefresh_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/xrx_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/xset-1.1.0/disable-xkb.patch
 create mode 100644 recipes/obsolete/xorg-app/xset_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-app/xsetroot_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/xsm_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xstdcmap_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xterm_207.bb
 create mode 100644 recipes/obsolete/xorg-app/xterm_251.bb
 create mode 100644 recipes/obsolete/xorg-app/xvidtune_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-app/xvinfo_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-app/xwd_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-app/xwininfo_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg-app/xwud_1.0.2.bb
 delete mode 100644 recipes/xorg-app/appres_1.0.2.bb
 delete mode 100644 recipes/xorg-app/bdftopcf_1.0.2.bb
 delete mode 100644 recipes/xorg-app/beforelight_1.0.3.bb
 delete mode 100644 recipes/xorg-app/bitmap_1.0.4.bb
 delete mode 100644 recipes/xorg-app/constype_1.0.2.bb
 delete mode 100644 recipes/xorg-app/editres_1.0.4.bb
 delete mode 100644 recipes/xorg-app/fslsfonts_1.0.2.bb
 delete mode 100644 recipes/xorg-app/fstobdf_1.0.3.bb
 delete mode 100644 recipes/xorg-app/iceauth_1.0.3.bb
 delete mode 100644 recipes/xorg-app/ico_1.0.2.bb
 delete mode 100644 recipes/xorg-app/listres_1.0.1.bb
 delete mode 100644 recipes/xorg-app/luit_1.0.4.bb
 create mode 100644 recipes/xorg-app/mkbold-mkitalic-native-0.11/makebifonts
 delete mode 100644 recipes/xorg-app/mkbold-mkitalic-native/makebifonts
 delete mode 100644 recipes/xorg-app/mkfontdir_1.0.5.bb
 delete mode 100644 recipes/xorg-app/mkfontscale_1.0.7.bb
 delete mode 100644 recipes/xorg-app/oclock_1.0.1.bb
 delete mode 100644 recipes/xorg-app/proxymngr_1.0.1.bb
 delete mode 100644 recipes/xorg-app/rendercheck_1.3.bb
 delete mode 100644 recipes/xorg-app/rgb_1.0.3.bb
 delete mode 100644 recipes/xorg-app/rstart_1.0.3.bb
 delete mode 100644 recipes/xorg-app/sessreg_1.0.5.bb
 delete mode 100644 recipes/xorg-app/setxkbmap_1.1.0.bb
 delete mode 100644 recipes/xorg-app/showfont_1.0.2.bb
 delete mode 100644 recipes/xorg-app/smproxy_1.0.3.bb
 delete mode 100644 recipes/xorg-app/twm_1.0.4.bb
 delete mode 100644 recipes/xorg-app/viewres_1.0.1.bb
 delete mode 100644 recipes/xorg-app/x11perf_1.5.1.bb
 delete mode 100644 recipes/xorg-app/xauth_1.0.4.bb
 delete mode 100644 recipes/xorg-app/xbacklight_1.1.1.bb
 delete mode 100644 recipes/xorg-app/xbiff_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xcalc_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xclipboard_1.1.0.bb
 delete mode 100644 recipes/xorg-app/xclock_1.0.4.bb
 delete mode 100644 recipes/xorg-app/xcmsdb_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xcompmgr_1.1.4.bb
 delete mode 100644 recipes/xorg-app/xconsole_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xcursorgen_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xdbedizzy_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xditview_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xdm_1.1.9.bb
 create mode 100644 recipes/xorg-app/xdpyinfo-1.2.0/disable-xkb.patch
 delete mode 100644 recipes/xorg-app/xdpyinfo/disable-xkb.patch
 delete mode 100644 recipes/xorg-app/xdpyinfo_1.1.0.bb
 delete mode 100644 recipes/xorg-app/xdriinfo_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xedit_1.1.2.bb
 delete mode 100644 recipes/xorg-app/xev/diet-x11.patch
 delete mode 100644 recipes/xorg-app/xev_1.0.4.bb
 delete mode 100644 recipes/xorg-app/xeyes_1.1.0.bb
 delete mode 100644 recipes/xorg-app/xf86dga_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xfd_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xfontsel_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xfs_1.1.0.bb
 delete mode 100644 recipes/xorg-app/xfsinfo_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xgamma_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xgc_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xhost_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xinit_1.1.1.bb
 delete mode 100644 recipes/xorg-app/xinput_1.5.0.bb
 delete mode 100644 recipes/xorg-app/xkbcomp_1.1.1.bb
 delete mode 100644 recipes/xorg-app/xkbevd_1.1.0.bb
 delete mode 100644 recipes/xorg-app/xkbprint_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xkbutils_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xkill_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xload_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xlogo_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xlsatoms_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xlsclients_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xlsfonts_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xmag_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xman_1.1.0.bb
 delete mode 100644 recipes/xorg-app/xmessage_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xmh_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xmodmap_1.0.4.bb
 delete mode 100644 recipes/xorg-app/xmore_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xprop_1.1.0.bb
 delete mode 100644 recipes/xorg-app/xrandr/resolve_symbol_clash.patch
 delete mode 100644 recipes/xorg-app/xrandr_1.3.2.bb
 delete mode 100644 recipes/xorg-app/xrdb_1.0.6.bb
 delete mode 100644 recipes/xorg-app/xrefresh_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xrx_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xset-1.1.0/disable-xkb.patch
 delete mode 100644 recipes/xorg-app/xset_1.1.0.bb
 delete mode 100644 recipes/xorg-app/xsetroot_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xsm_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xstdcmap_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xterm_207.bb
 delete mode 100644 recipes/xorg-app/xterm_251.bb
 delete mode 100644 recipes/xorg-app/xvidtune_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xvinfo_1.1.0.bb
 delete mode 100644 recipes/xorg-app/xwd_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xwininfo_1.0.5.bb
 delete mode 100644 recipes/xorg-app/xwud_1.0.2.bb

diff --git a/recipes/obsolete/xorg-app/appres_1.0.2.bb b/recipes/obsolete/xorg-app/appres_1.0.2.bb
new file mode 100644
index 0000000..bb76f3e
--- /dev/null
+++ b/recipes/obsolete/xorg-app/appres_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "The appres program prints the resources seen by an application."
+DEPENDS += " libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6f2f5d9f41669d498b56d73dc3206951"
+SRC_URI[archive.sha256sum] = "37d0fbb16c553fa09878d107f29f26c2ca4206c98dd23c44a0cb670ace531e36"
diff --git a/recipes/obsolete/xorg-app/bdftopcf_1.0.2.bb b/recipes/obsolete/xorg-app/bdftopcf_1.0.2.bb
new file mode 100644
index 0000000..450eb63
--- /dev/null
+++ b/recipes/obsolete/xorg-app/bdftopcf_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "converts BDF fonts to PCF fonts"
+DEPENDS += " libxfont"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "148f20d28caaa69bbe7dcca7c2674fb6"
+SRC_URI[archive.sha256sum] = "11017f0dd637fd3228bd56fdbbd72193fd747c10d893a711c25bf6734c4da06b"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg-app/beforelight_1.0.3.bb b/recipes/obsolete/xorg-app/beforelight_1.0.3.bb
new file mode 100644
index 0000000..4d45541
--- /dev/null
+++ b/recipes/obsolete/xorg-app/beforelight_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "a sample implementation of a screen saver for X"
+DEPENDS += " libxscrnsaver libxt libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d55b0e7196dafcfeb4db3886af2e1969"
+SRC_URI[archive.sha256sum] = "cae9427fa083a0ec3f2d1a3a6391508b31a2cf0220cb8d732c5d473a8c995c4e"
diff --git a/recipes/obsolete/xorg-app/bitmap_1.0.4.bb b/recipes/obsolete/xorg-app/bitmap_1.0.4.bb
new file mode 100644
index 0000000..f9cb165
--- /dev/null
+++ b/recipes/obsolete/xorg-app/bitmap_1.0.4.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu xbitmaps libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7d0c1ac193be2491c72a91ccf37ef18e"
+SRC_URI[archive.sha256sum] = "2517aaa015795a348435e4e83bafe7642d4b2fe1976ee982a5d652cf417f79d8"
diff --git a/recipes/obsolete/xorg-app/constype_1.0.2.bb b/recipes/obsolete/xorg-app/constype_1.0.2.bb
new file mode 100644
index 0000000..c72a171
--- /dev/null
+++ b/recipes/obsolete/xorg-app/constype_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "print an X window dump"
+DEPENDS += " libxmu "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "83f623f961400ecc56ff52a716308173"
+SRC_URI[archive.sha256sum] = "70375ea6b3e17cabc35492f87b5b138295c8f0258d65b0fbba998e3ff69bb634"
diff --git a/recipes/obsolete/xorg-app/editres_1.0.4.bb b/recipes/obsolete/xorg-app/editres_1.0.4.bb
new file mode 100644
index 0000000..fd09300
--- /dev/null
+++ b/recipes/obsolete/xorg-app/editres_1.0.4.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxt libxmu libxaw"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1800dda934ebb7c588ea686278a10e9f"
+SRC_URI[archive.sha256sum] = "d7ce4c0bb214e055cb7680d8b88b9f551610fc40c28269cb51649133862f3302"
diff --git a/recipes/obsolete/xorg-app/fslsfonts_1.0.2.bb b/recipes/obsolete/xorg-app/fslsfonts_1.0.2.bb
new file mode 100644
index 0000000..b792a08
--- /dev/null
+++ b/recipes/obsolete/xorg-app/fslsfonts_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libfs"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a61be25c87ee42169ee4dc8344acc9e2"
+SRC_URI[archive.sha256sum] = "9c8e7d573284272c633b5cf18e3358830b27bde72f4bc1ae83a1ab337d463a92"
diff --git a/recipes/obsolete/xorg-app/fstobdf_1.0.3.bb b/recipes/obsolete/xorg-app/fstobdf_1.0.3.bb
new file mode 100644
index 0000000..0d92d5b
--- /dev/null
+++ b/recipes/obsolete/xorg-app/fstobdf_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libfs"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "49a6225380f6c18fff664a043cd569b1"
+SRC_URI[archive.sha256sum] = "f2242720045c69f69dc9e18320a1c6402e92234d40c237367560fae3d210f7b0"
diff --git a/recipes/obsolete/xorg-app/iceauth_1.0.3.bb b/recipes/obsolete/xorg-app/iceauth_1.0.3.bb
new file mode 100644
index 0000000..5be63a0
--- /dev/null
+++ b/recipes/obsolete/xorg-app/iceauth_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "a tool for manipulating ICE protocol authorization records"
+DEPENDS += " libice"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "975ade3f238c1eb10705da0a91e6e8e7"
+SRC_URI[archive.sha256sum] = "abca3ff6c9f2da2600a474f0e92ae5e62c43914f7bd3d948b91b0a7f9117d81e"
diff --git a/recipes/obsolete/xorg-app/ico_1.0.2.bb b/recipes/obsolete/xorg-app/ico_1.0.2.bb
new file mode 100644
index 0000000..040017c
--- /dev/null
+++ b/recipes/obsolete/xorg-app/ico_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "an X graphics demo using an animated polyhedron"
+DEPENDS += " libxau libxdmcp"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5711827c5c2563620b56c33aababbc63"
+SRC_URI[archive.sha256sum] = "db2e96e18a2bcc29b91b9de7b758a7c67cebee27772fb540c44c7bc2c2218aa5"
diff --git a/recipes/obsolete/xorg-app/listres_1.0.1.bb b/recipes/obsolete/xorg-app/listres_1.0.1.bb
new file mode 100644
index 0000000..7b466d8
--- /dev/null
+++ b/recipes/obsolete/xorg-app/listres_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "827a1ac5adf9aadd0c13b54a897e297b"
+SRC_URI[archive.sha256sum] = "7156e58025e240a501d5b32244b923b283bb35014ea5a4081b70044af8aef7a3"
diff --git a/recipes/obsolete/xorg-app/luit_1.0.4.bb b/recipes/obsolete/xorg-app/luit_1.0.4.bb
new file mode 100644
index 0000000..71a2910
--- /dev/null
+++ b/recipes/obsolete/xorg-app/luit_1.0.4.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "a filter for locale and ISO 2022 support on Unicode terminals"
+DEPENDS += " zlib zlib libfontenc"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4e45233e310d72dce307709761cf241b"
+SRC_URI[archive.sha256sum] = "d11cd500975f652060f89d79cb8034011d99ee9aa6c82951680fc0621ecb8252"
diff --git a/recipes/obsolete/xorg-app/mkfontdir_1.0.5.bb b/recipes/obsolete/xorg-app/mkfontdir_1.0.5.bb
new file mode 100644
index 0000000..0786a90
--- /dev/null
+++ b/recipes/obsolete/xorg-app/mkfontdir_1.0.5.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "a program to create an index of X font files in a directory"
+RDEPENDS_${PN} += "mkfontscale"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "9365ac66d19186eaf030482d312fca06"
+SRC_URI[archive.sha256sum] = "a534650cff503619f9101577d816cde283da993bc039273477bd8dfbd01a2d0b"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg-app/mkfontscale_1.0.7.bb b/recipes/obsolete/xorg-app/mkfontscale_1.0.7.bb
new file mode 100644
index 0000000..8655664
--- /dev/null
+++ b/recipes/obsolete/xorg-app/mkfontscale_1.0.7.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "a program to create an index of scalable font files for X"
+DEPENDS += " zlib libfontenc freetype "
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "96ca346f185c0ab48e42bf5bb0375da5"
+SRC_URI[archive.sha256sum] = "8306b229cca233216a6582cb1ff60af78e37c47d6412ac823d7d41c3d7de7127"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg-app/oclock_1.0.1.bb b/recipes/obsolete/xorg-app/oclock_1.0.1.bb
new file mode 100644
index 0000000..1ffa51a
--- /dev/null
+++ b/recipes/obsolete/xorg-app/oclock_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu libxext libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "91f49547f9ed3cd0137c8b7c3183e360"
+SRC_URI[archive.sha256sum] = "49ab7d4f6402fbbe30714012ee38b49da17789f3a29ac41917987ce18c74217c"
diff --git a/recipes/obsolete/xorg-app/proxymngr_1.0.1.bb b/recipes/obsolete/xorg-app/proxymngr_1.0.1.bb
new file mode 100644
index 0000000..a7cea51
--- /dev/null
+++ b/recipes/obsolete/xorg-app/proxymngr_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libice libxt xproxymngproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "aad44d0f65b97fd6d564b1d2ae510bb1"
+SRC_URI[archive.sha256sum] = "e9f5d4553411562477a0605fb0f0ec728016499e37230138a5e207dec79525c5"
diff --git a/recipes/obsolete/xorg-app/rendercheck_1.3.bb b/recipes/obsolete/xorg-app/rendercheck_1.3.bb
new file mode 100644
index 0000000..911a093
--- /dev/null
+++ b/recipes/obsolete/xorg-app/rendercheck_1.3.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DESCRIPTION = "a program to test Render extension implementations"
+DEPENDS += "libxrender"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "eb6a358b79b0aeaf03d56c5e1f394365"
+SRC_URI[archive.sha256sum] = "60e83bebab37c2754ae77cc359c0b67e8bc72b46821c7fa260ccc5c811bd741f"
diff --git a/recipes/obsolete/xorg-app/rgb_1.0.3.bb b/recipes/obsolete/xorg-app/rgb_1.0.3.bb
new file mode 100644
index 0000000..b4eb11c
--- /dev/null
+++ b/recipes/obsolete/xorg-app/rgb_1.0.3.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DEPENDS += " xproto util-macros"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "44ea16cc3104de6401bc74035f642357"
+SRC_URI[archive.sha256sum] = "162111c0192c8f78e99a6ee9a3df5eb149251c5800896c993399da005ec7fe95"
+
+FILES_${PN} += "${datadir}/X11"
diff --git a/recipes/obsolete/xorg-app/rstart_1.0.3.bb b/recipes/obsolete/xorg-app/rstart_1.0.3.bb
new file mode 100644
index 0000000..b82c821
--- /dev/null
+++ b/recipes/obsolete/xorg-app/rstart_1.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e09c14cf1ac78260f95a9aa45bccab4c"
+SRC_URI[archive.sha256sum] = "d6ee7becf9ece2fcc30ce50f7e9be31f231cce0cb3a8ba09d1697ac2822c3fcc"
diff --git a/recipes/obsolete/xorg-app/sessreg_1.0.5.bb b/recipes/obsolete/xorg-app/sessreg_1.0.5.bb
new file mode 100644
index 0000000..6fc2ee0
--- /dev/null
+++ b/recipes/obsolete/xorg-app/sessreg_1.0.5.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DESCRIPTION = "a simple program for managing utmp/wtmp entries"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "00e834c3cbfd990e9d7d5ddc834242df"
+SRC_URI[archive.sha256sum] = "3308fbd0018d53bb818fee9de1cde484965b740073d5d240efa4cfc881c9d1a9"
diff --git a/recipes/obsolete/xorg-app/setxkbmap_1.1.0.bb b/recipes/obsolete/xorg-app/setxkbmap_1.1.0.bb
new file mode 100644
index 0000000..ba7b46e
--- /dev/null
+++ b/recipes/obsolete/xorg-app/setxkbmap_1.1.0.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxkbfile "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2f902e0a89aaf2b19e06e7f26c6efb3a"
+SRC_URI[archive.sha256sum] = "932f2b314a4bf6dfccd16d63c633073abf650d8e136f481904e972ef3d4faf64"
diff --git a/recipes/obsolete/xorg-app/showfont_1.0.2.bb b/recipes/obsolete/xorg-app/showfont_1.0.2.bb
new file mode 100644
index 0000000..217745a
--- /dev/null
+++ b/recipes/obsolete/xorg-app/showfont_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libfs"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8f83d774ed4cc2a6dca86edd856d820a"
+SRC_URI[archive.sha256sum] = "9bd0373659b2f24120dba887fd155f99aed02e4a7c2afae69e7db1c1fa05e88c"
diff --git a/recipes/obsolete/xorg-app/smproxy_1.0.3.bb b/recipes/obsolete/xorg-app/smproxy_1.0.3.bb
new file mode 100644
index 0000000..3b44ef6
--- /dev/null
+++ b/recipes/obsolete/xorg-app/smproxy_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxt libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ba7dbde81be24fc1bd4156b360e5f8cf"
+SRC_URI[archive.sha256sum] = "1b8dd25483280fc2a4a7d977b4a43dc4228b9c65e904c3d4ee68245705d4ae35"
diff --git a/recipes/obsolete/xorg-app/twm_1.0.4.bb b/recipes/obsolete/xorg-app/twm_1.0.4.bb
new file mode 100644
index 0000000..96cbf14
--- /dev/null
+++ b/recipes/obsolete/xorg-app/twm_1.0.4.bb
@@ -0,0 +1,13 @@
+require xorg-app-common.inc
+DESCRIPTION = "tiny window manager"
+DEPENDS += " libxext libxt libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0865e14c73c08fa8c501ae877298ee9f"
+SRC_URI[archive.sha256sum] = "daa088f9ae231508929b7bd4746e942212b53f2802ca4cee450139fabc8de1fa"
+
+ALTERNATIVE_NAME = "x-window-manager"
+ALTERNATIVE_PATH = "${bindir}/twm"
+ALTERNATIVE_LINK = "${bindir}/x-window-manager"
+ALTERNATIVE_PRIORITY = "1"
diff --git a/recipes/obsolete/xorg-app/viewres_1.0.1.bb b/recipes/obsolete/xorg-app/viewres_1.0.1.bb
new file mode 100644
index 0000000..60c9ef6
--- /dev/null
+++ b/recipes/obsolete/xorg-app/viewres_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cdbed540daf7975b56000420c9aa5bf9"
+SRC_URI[archive.sha256sum] = "bf49cd45ffb197a6992b3b7c99c94161eaf7cf6a2b661d3905ac382bedce34b8"
diff --git a/recipes/obsolete/xorg-app/x11perf_1.5.1.bb b/recipes/obsolete/xorg-app/x11perf_1.5.1.bb
new file mode 100644
index 0000000..76a0457
--- /dev/null
+++ b/recipes/obsolete/xorg-app/x11perf_1.5.1.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "X11 server performance test program"
+DEPENDS += "libxmu libxrender libxft libxext fontconfig"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "66e4aa4645f83809071eb69553ed0222"
+SRC_URI[archive.sha256sum] = "ab4c6a579f93fa9485ef5be8760a3da0d22acfa743f2114057c5262b77ff7056"
+
+FILES_${PN} += "/usr/lib/X11/x11perfcomp/*"
diff --git a/recipes/obsolete/xorg-app/xauth_1.0.4.bb b/recipes/obsolete/xorg-app/xauth_1.0.4.bb
new file mode 100644
index 0000000..4233097
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xauth_1.0.4.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "X authority file utility"
+DEPENDS += "libxau libxext libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fa00078c414c4a57cab7a6d89a0c8734"
+SRC_URI[archive.sha256sum] = "f91190c8b8bb18270b86b00f30da5684bb5e5bd1ed0ccf352322f8145e076a59"
diff --git a/recipes/obsolete/xorg-app/xbacklight_1.1.1.bb b/recipes/obsolete/xorg-app/xbacklight_1.1.1.bb
new file mode 100644
index 0000000..a8d4825
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xbacklight_1.1.1.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "adjust backlight brightness using RandR extension"
+DEPENDS += " libxrender libxrandr"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3e39eec6d0fd5c587ca6d55aa7bb8fe1"
+SRC_URI[archive.sha256sum] = "5d32d891c83b9c0089231f4f1c424ab02301b627ce26e5c2e6e397b8ea606fb2"
diff --git a/recipes/obsolete/xorg-app/xbiff_1.0.1.bb b/recipes/obsolete/xorg-app/xbiff_1.0.1.bb
new file mode 100644
index 0000000..ac2eefb
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xbiff_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw xbitmaps libxext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "404f5add4537d22dd109c33e518a5190"
+SRC_URI[archive.sha256sum] = "9845b1fa8a1cfd408f01fd69b66808068e847cdc925d114c7723c17934a96503"
diff --git a/recipes/obsolete/xorg-app/xcalc_1.0.2.bb b/recipes/obsolete/xorg-app/xcalc_1.0.2.bb
new file mode 100644
index 0000000..b35ab5c
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xcalc_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "scientific calculator for X"
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d31a99795b9668f047aa11bf36df6df0"
+SRC_URI[archive.sha256sum] = "96375e2d212e7249d14d0beac73c1a6d89252b5fcf571bd9f5c7303a14bb4a32"
diff --git a/recipes/obsolete/xorg-app/xclipboard_1.1.0.bb b/recipes/obsolete/xorg-app/xclipboard_1.1.0.bb
new file mode 100644
index 0000000..7509998
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xclipboard_1.1.0.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "113eccea3ee73a1ef7b43d2291ca1e09"
+SRC_URI[archive.sha256sum] = "de0f37c7bf69c3aac3362bc0cbe470a622c2a85b62c5483c113ea88512232710"
diff --git a/recipes/obsolete/xorg-app/xclock_1.0.4.bb b/recipes/obsolete/xorg-app/xclock_1.0.4.bb
new file mode 100644
index 0000000..ae74aea
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xclock_1.0.4.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "analog / digital clock for X"
+DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "bb9fd5e00d39c348a0078b97fdf8258f"
+SRC_URI[archive.sha256sum] = "69b903b6305211c9fc5db394f3d08c0a696aa51942d73db7f594422e7be6edf0"
diff --git a/recipes/obsolete/xorg-app/xcmsdb_1.0.2.bb b/recipes/obsolete/xorg-app/xcmsdb_1.0.2.bb
new file mode 100644
index 0000000..3a177a8
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xcmsdb_1.0.2.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7f2bed9f4dd3301d18d83eb296c3be0d"
+SRC_URI[archive.sha256sum] = "bfcac66634ea4d4a1607f1c8a4170e6089db13355357fc143281a6fc0216face"
diff --git a/recipes/obsolete/xorg-app/xcompmgr_1.1.4.bb b/recipes/obsolete/xorg-app/xcompmgr_1.1.4.bb
new file mode 100644
index 0000000..d781958
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xcompmgr_1.1.4.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Compositing Manager"
+PRIORITY = "optional"
+LICENSE = "BSD-X"
+DEPENDS += "libxdamage libxcomposite libxrender"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3eb1c2b7a6ceaec4ee872cb06d202d91"
+SRC_URI[archive.sha256sum] = "4bf647745b4de940ef75796fc8ad4e1f83c276e474f7b6779f317fcd070de884"
diff --git a/recipes/obsolete/xorg-app/xconsole_1.0.3.bb b/recipes/obsolete/xorg-app/xconsole_1.0.3.bb
new file mode 100644
index 0000000..3f8ffb6
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xconsole_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "monitor system console messages with X"
+DEPENDS += " libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0e1a3110bebabecc2897d67a973526b0"
+SRC_URI[archive.sha256sum] = "1b1ec25fefad34f5c33c74474358c1f5a8702d8c04defc854826bccb7a46bc45"
diff --git a/recipes/obsolete/xorg-app/xcursorgen_1.0.3.bb b/recipes/obsolete/xorg-app/xcursorgen_1.0.3.bb
new file mode 100644
index 0000000..65260e5
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xcursorgen_1.0.3.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "create an X cursor file from a collection of PNG images"
+DEPENDS += " libxcursor libpng"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "69df079b3950a0db4e5f4e6f0e00ddee"
+SRC_URI[archive.sha256sum] = "ed5f3ffe881c21ffca85406e5a5f553ed4985cc5e9acdb535f682c33bebac254"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg-app/xdbedizzy_1.0.2.bb b/recipes/obsolete/xorg-app/xdbedizzy_1.0.2.bb
new file mode 100644
index 0000000..63c04ee
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xdbedizzy_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxp libxprintutil libxp libxau libxext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ecef9cfd197d00980e0d69ee4126d890"
+SRC_URI[archive.sha256sum] = "74e882e9fee7ebeb274caf43071afff92531b8a41f34650376146a131166012d"
diff --git a/recipes/obsolete/xorg-app/xditview_1.0.1.bb b/recipes/obsolete/xorg-app/xditview_1.0.1.bb
new file mode 100644
index 0000000..d23a028
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xditview_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e9a7192ef29453b8c810ddd556a463c0"
+SRC_URI[archive.sha256sum] = "177194e5f83b31c2f934e3a0b573e8ae359edf2ef1a2403ee8e1dad383558117"
diff --git a/recipes/obsolete/xorg-app/xdm_1.1.9.bb b/recipes/obsolete/xorg-app/xdm_1.1.9.bb
new file mode 100644
index 0000000..a6796b5
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xdm_1.1.9.bb
@@ -0,0 +1,15 @@
+require xorg-app-common.inc
+DESCRIPTION = "X display manager"
+DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "030ae4bd9b8d428749d68bfdf56ce8a5"
+SRC_URI[archive.sha256sum] = "e7b1db0e1b0d0113a301d94e40b0314e55f7e0006415f50a9cf06f636b11b134"
+
+EXTRA_OECONF += "\
+        --with-random-device=/dev/urandom --with-utmp-file=/var/run/utmp \
+        --with-wtmp-file=/var/log/wtmp \
+        "
+
+FILES_${PN}-dbg += "${libdir}/X11/xdm/.debug/*"
diff --git a/recipes/obsolete/xorg-app/xdpyinfo/disable-xkb.patch b/recipes/obsolete/xorg-app/xdpyinfo/disable-xkb.patch
new file mode 100644
index 0000000..24af21f
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xdpyinfo/disable-xkb.patch
@@ -0,0 +1,18 @@
+--- xdpyinfo-1.0.1/configure.ac.orig	2006-03-08 16:33:05.000000000 +0100
++++ xdpyinfo-1.0.1/configure.ac	2006-03-08 16:41:59.000000000 +0100
+@@ -45,11 +45,15 @@
+ 	AC_CHECK_HEADERS([X11/extensions/multibuf.h X11/extensions/XShm.h],,,[#include <X11/Xlib.h>])
+ 	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
+ 
++AC_ARG_ENABLE(xkb, AC_HELP_STRING([--disable-xkb], [Disable XKB support]),
++        XKB="$enableval", XKB="yes")
++if test "x$XKB" = "xyes" ; then
+ PKG_CHECK_MODULES(DPY_XKB, x11, 
+ 	[SAVE_CPPFLAGS="$CPPFLAGS"
+ 	CPPFLAGS="$CPPFLAGS $DPY_XKB_CFLAGS $DPY_X11_CFLAGS"
+ 	AC_CHECK_HEADERS([X11/extensions/XKB.h X11/XKBlib.h],,,[#include <X11/Xlib.h>])
+ 	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
++fi
+ 
+ PKG_CHECK_MODULES(DPY_XF86VIDMODE, xxf86vm, 
+ 	[SAVE_CPPFLAGS="$CPPFLAGS"
diff --git a/recipes/obsolete/xorg-app/xdpyinfo_1.1.0.bb b/recipes/obsolete/xorg-app/xdpyinfo_1.1.0.bb
new file mode 100644
index 0000000..f7b3134
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xdpyinfo_1.1.0.bb
@@ -0,0 +1,12 @@
+require xorg-app-common.inc
+DESCRIPTION = "X display information utility"
+LICENSE = "MIT"
+DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi libxrender libxinerama libdmx libxp libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://disable-xkb.patch"
+SRC_URI[archive.md5sum] = "d1d516610316138105cd07064b257c5c"
+SRC_URI[archive.sha256sum] = "780d8dfe65653f42ee26d35928ab7f72f5f27ab08eda692fe4baad05126a0631"
+
+EXTRA_OECONF = "--disable-xkb"
diff --git a/recipes/obsolete/xorg-app/xdriinfo_1.0.3.bb b/recipes/obsolete/xorg-app/xdriinfo_1.0.3.bb
new file mode 100644
index 0000000..a123cad
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xdriinfo_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "query configuration information of DRI drivers"
+DEPENDS += " glproto virtual/libgl"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cb304d1ce562ac48b68eedeba38c662f"
+SRC_URI[archive.sha256sum] = "2b762afd08c798d79fd6dacfd6280da39105927fa2bd91e3b1ba75b8cddc259c"
diff --git a/recipes/obsolete/xorg-app/xedit_1.1.2.bb b/recipes/obsolete/xorg-app/xedit_1.1.2.bb
new file mode 100644
index 0000000..2b16fb8
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xedit_1.1.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxprintutil libxp libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "67193be728414d45a1922911e6437991"
+SRC_URI[archive.sha256sum] = "a38823a8b7919e2efa689bc4c279e12314e45b41131c39ce9ca523e54f42fa1f"
diff --git a/recipes/obsolete/xorg-app/xev/diet-x11.patch b/recipes/obsolete/xorg-app/xev/diet-x11.patch
new file mode 100644
index 0000000..9f515e8
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xev/diet-x11.patch
@@ -0,0 +1,80 @@
+---
+ xev.c |   16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+Index: xev-1.0.2/xev.c
+===================================================================
+--- xev-1.0.2.orig/xev.c	2006-06-02 00:25:44.000000000 +0100
++++ xev-1.0.2/xev.c	2007-05-10 15:22:07.000000000 +0100
+@@ -109,7 +109,7 @@ do_KeyPress (XEvent *eventp)
+     nbytes = XLookupString (e, str, 256, &ks, NULL);
+ 
+     /* not supposed to call XmbLookupString on a key release event */
+-    if (e->type == KeyPress && xic) {
++    /*if (e->type == KeyPress && xic) {
+         do {
+             nmbbytes = XmbLookupString (xic, e, buf, bsize - 1, &ks, &status);
+             buf[nmbbytes] = '\0';
+@@ -119,7 +119,7 @@ do_KeyPress (XEvent *eventp)
+                 buf = realloc (buf, bsize);
+             }
+         } while (status == XBufferOverflow);
+-    }
++    }*/
+ 
+     if (ks == NoSymbol)
+ 	ksname = "NoSymbol";
+@@ -149,7 +149,7 @@ do_KeyPress (XEvent *eventp)
+     }
+ 
+     /* not supposed to call XmbLookupString on a key release event */
+-    if (e->type == KeyPress && xic) {
++    /*if (e->type == KeyPress && xic) {
+         printf ("    XmbLookupString gives %d bytes: ", nmbbytes);
+         if (nmbbytes > 0) {
+            dump (buf, nmbbytes);
+@@ -157,7 +157,7 @@ do_KeyPress (XEvent *eventp)
+         } else {
+     	   printf ("\n");
+         }
+-    }
++    } */
+ 
+     printf ("    XFilterEvent returns: %s\n", 
+ 	    XFilterEvent (eventp, e->window) ? "True" : "False");
+@@ -804,7 +804,7 @@ main (int argc, char **argv)
+         fprintf (stderr, "%s:  XSetLocaleModifiers failed\n", ProgramName);
+     }
+ 
+-    xim = XOpenIM (dpy, NULL, NULL, NULL);
++    /*xim = XOpenIM (dpy, NULL, NULL, NULL);
+     if (xim == NULL) {
+         fprintf (stderr, "%s:  XOpenIM failed\n", ProgramName);
+     }
+@@ -831,7 +831,7 @@ main (int argc, char **argv)
+             }
+             XFree (xim_styles);
+         }
+-    } 
++    }*/
+ 
+     screen = DefaultScreen (dpy);
+ 
+@@ -891,7 +891,7 @@ main (int argc, char **argv)
+ 	printf ("Outer window is 0x%lx, inner window is 0x%lx\n", w, subw);
+     }
+ 
+-    if (xim && xim_style) {
++    /*if (xim && xim_style) {
+         xic = XCreateIC (xim, 
+                          XNInputStyle, xim_style, 
+                          XNClientWindow, w, 
+@@ -901,7 +901,7 @@ main (int argc, char **argv)
+         if (xic == NULL) {
+             fprintf (stderr, "XCreateIC failed\n");
+         }
+-    }
++    }*/
+ 
+     for (done = 0; !done; ) {
+ 	XEvent event;
diff --git a/recipes/obsolete/xorg-app/xev_1.0.4.bb b/recipes/obsolete/xorg-app/xev_1.0.4.bb
new file mode 100644
index 0000000..6154c8c
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xev_1.0.4.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Event Viewer"
+LICENSE = "MIT"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://diet-x11.patch"
+SRC_URI[archive.md5sum] = "5f98c0a2725a33d60ef4956befe078fb"
+SRC_URI[archive.sha256sum] = "7fad9c9755a624e677f44633dee218e9c22b4ba9a83e6709a6cbf8c1a501fde8"
diff --git a/recipes/obsolete/xorg-app/xeyes_1.1.0.bb b/recipes/obsolete/xorg-app/xeyes_1.1.0.bb
new file mode 100644
index 0000000..fc382ba
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xeyes_1.1.0.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxau libxt libxext libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "933f6d2b132d14f707f1f3c87b39ebe2"
+SRC_URI[archive.sha256sum] = "996b9641fea06e2f0dde9cbf5fb31b5cd139376198057a88ca59820fdb94d507"
diff --git a/recipes/obsolete/xorg-app/xf86dga_1.0.2.bb b/recipes/obsolete/xorg-app/xf86dga_1.0.2.bb
new file mode 100644
index 0000000..aff21db
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xf86dga_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxxf86dga libxt libxaw libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "66feef21fb4e769cc1e2f193ae461a8c"
+SRC_URI[archive.sha256sum] = "650633b83796e5a24d4c5ec30adfeb3958f75d9d0785060d5c42bab55ccc1857"
diff --git a/recipes/obsolete/xorg-app/xfd_1.0.1.bb b/recipes/obsolete/xorg-app/xfd_1.0.1.bb
new file mode 100644
index 0000000..dc46464
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xfd_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw freetype fontconfig libxft libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c72abd90f50ef459bc14b39ec9fcc7f8"
+SRC_URI[archive.sha256sum] = "111baa16780429d6739ab69b7393a18d75a10b7615dcc8cd0b0878ab9a5e2e1e"
diff --git a/recipes/obsolete/xorg-app/xfontsel_1.0.2.bb b/recipes/obsolete/xorg-app/xfontsel_1.0.2.bb
new file mode 100644
index 0000000..aed93b5
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xfontsel_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DESCRIPTION = "point and click selection of X11 font names"
+DEPENDS += " libxaw"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "288fe4cf8a990e4e602aac16dd9109fb"
+SRC_URI[archive.sha256sum] = "7a66ba3910bd7e39d58f9d4a4a588f191a874b8607369fe2cc9203a7115006a9"
diff --git a/recipes/obsolete/xorg-app/xfs_1.1.0.bb b/recipes/obsolete/xorg-app/xfs_1.1.0.bb
new file mode 100644
index 0000000..efc2c62
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xfs_1.1.0.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "X fontserver"
+DEPENDS += " libfs libxfont xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5cfc06a320f74f07a0aa73da62307e9a"
+SRC_URI[archive.sha256sum] = "47bad4bbcd0488a8e573aa6efe3438076c4d27c498d6f642f3aa27262eb95f6d"
diff --git a/recipes/obsolete/xorg-app/xfsinfo_1.0.2.bb b/recipes/obsolete/xorg-app/xfsinfo_1.0.2.bb
new file mode 100644
index 0000000..5ca440c
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xfsinfo_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libfs"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e6c0071f6d5436113982f4a575d3f94b"
+SRC_URI[archive.sha256sum] = "95aaca84f948fc7e25d82c58d3fdbba44911b99f3e205378ce82a786c11bb96f"
diff --git a/recipes/obsolete/xorg-app/xgamma_1.0.3.bb b/recipes/obsolete/xorg-app/xgamma_1.0.3.bb
new file mode 100644
index 0000000..ebd483c
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xgamma_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "Alter a monitor's gamma correction through the X server"
+DEPENDS += " libxxf86vm"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e8a88bf1a18f35b724619849dca97f4f"
+SRC_URI[archive.sha256sum] = "e5eb2588fbbdc5c2db5571b304204487a9c22eed15ac6cb816f605ec403e6e1a"
diff --git a/recipes/obsolete/xorg-app/xgc_1.0.1.bb b/recipes/obsolete/xorg-app/xgc_1.0.1.bb
new file mode 100644
index 0000000..5cd8c1e
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xgc_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "72fc8dd68f585000c0a542eba0264571"
+SRC_URI[archive.sha256sum] = "7caddfc6c34f62a4ab2dba2ba34085f6b2343b36ec1bec3b522a2188170e1093"
diff --git a/recipes/obsolete/xorg-app/xhost_1.0.3.bb b/recipes/obsolete/xorg-app/xhost_1.0.3.bb
new file mode 100644
index 0000000..a6b3a43
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xhost_1.0.3.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "Server access control program for X"
+LICENSE = "MIT"
+DEPENDS += "libxmu libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c7f91b4a750d297f269c2a0a3206a1b2"
+SRC_URI[archive.sha256sum] = "2d63007c65e89fe273a43f3e45b3c0133acbc3ceeda6bfc9671388409134ad17"
diff --git a/recipes/obsolete/xorg-app/xinit_1.1.1.bb b/recipes/obsolete/xorg-app/xinit_1.1.1.bb
new file mode 100644
index 0000000..89b047e
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xinit_1.1.1.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Window System initializer"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "93c73705ed9eb1e1a6b6938405672f2b"
+SRC_URI[archive.sha256sum] = "b103d2cf9e1cd8b049e28bb1109f3da3a14287bbce3ab8b2f427d55a6e5f4785"
+
+FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/obsolete/xorg-app/xinput_1.5.0.bb b/recipes/obsolete/xorg-app/xinput_1.5.0.bb
new file mode 100644
index 0000000..04355de
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xinput_1.5.0.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DESCRIPTION = "a utility to configure and test XInput devices"
+DEPENDS += " libxi"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3e8a5f1faccc8ab00c6190e5a34e0a45"
+SRC_URI[archive.sha256sum] = "a84728e34bb5edd36ecc1b5489f48ad1467ad5aab1f74f1b7789f826a1ffcaf9"
diff --git a/recipes/obsolete/xorg-app/xkbcomp_1.1.1.bb b/recipes/obsolete/xorg-app/xkbcomp_1.1.1.bb
new file mode 100644
index 0000000..d32be77
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xkbcomp_1.1.1.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "The X Keyboard Extension essentially replaces the core protocol definition of keyboard."
+DEPENDS += " libxkbfile"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "38c387bacdc01038c8ac280588792bcf"
+SRC_URI[archive.sha256sum] = "9775bcfd43d9ffa41e2865e5b2c933f419bf983d7a529b3103656c76fd82e663"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg-app/xkbevd_1.1.0.bb b/recipes/obsolete/xorg-app/xkbevd_1.1.0.bb
new file mode 100644
index 0000000..2da02ec
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xkbevd_1.1.0.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxkbfile "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8d3c1485c2dd62ea7395a37377958a39"
+SRC_URI[archive.sha256sum] = "46037add20321ff13954ad91aa5f5f5ec52d78006f9d7c52aa6167622b34a2df"
diff --git a/recipes/obsolete/xorg-app/xkbprint_1.0.1.bb b/recipes/obsolete/xorg-app/xkbprint_1.0.1.bb
new file mode 100644
index 0000000..58a34d2
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xkbprint_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxkbfile "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b98ae2d8b21c545b7b322d0b302efefa"
+SRC_URI[archive.sha256sum] = "008dffea5b213880cb3ebd40d0b9bf0cc10392fb0349831efdebf2a428dd2e17"
diff --git a/recipes/obsolete/xorg-app/xkbutils_1.0.2.bb b/recipes/obsolete/xorg-app/xkbutils_1.0.2.bb
new file mode 100644
index 0000000..c4bfe76
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xkbutils_1.0.2.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxkbfile "
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "369a21641b7ca983d6641298e51d97f8"
+SRC_URI[archive.sha256sum] = "12a37d4594a4deb2642b1659f3827068c24bb8791a20b927c5f3b7fdb0c70bee"
diff --git a/recipes/obsolete/xorg-app/xkill_1.0.2.bb b/recipes/obsolete/xorg-app/xkill_1.0.2.bb
new file mode 100644
index 0000000..b221ead
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xkill_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "dca031355b4afcf8517a8258eeb730c3"
+SRC_URI[archive.sha256sum] = "532df0398d3f4eab1cba8d0367c02a293ca74f2d89a27ef014854a2bde9a5a27"
diff --git a/recipes/obsolete/xorg-app/xload_1.0.2.bb b/recipes/obsolete/xorg-app/xload_1.0.2.bb
new file mode 100644
index 0000000..5b706c4
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xload_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "system load average display for X"
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b41ed6b4bcfc9897366c27a94d2bf150"
+SRC_URI[archive.sha256sum] = "86b176b6efc52557b1c7631bfdd5c17e7060a438e1e85ce15ec9657be356c50b"
diff --git a/recipes/obsolete/xorg-app/xlogo_1.0.1.bb b/recipes/obsolete/xorg-app/xlogo_1.0.1.bb
new file mode 100644
index 0000000..6c05ea1
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xlogo_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxprintutil libxp libxrender libxft libxext libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4c5482552f38a7d42398a694cc9b2ee6"
+SRC_URI[archive.sha256sum] = "de59f9be3d45fe93f445f39bec3cea09753a671e56863ce77e3a797d2df526b2"
diff --git a/recipes/obsolete/xorg-app/xlsatoms_1.0.2.bb b/recipes/obsolete/xorg-app/xlsatoms_1.0.2.bb
new file mode 100644
index 0000000..0e1e123
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xlsatoms_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "dc8b420bbfa35091ea30edf57c952ec2"
+SRC_URI[archive.sha256sum] = "d66cd7682e5ea2a52e8da8a75ea6154f40a3a69938c6c2cf5d5c1e012f5c121b"
diff --git a/recipes/obsolete/xorg-app/xlsclients_1.0.2.bb b/recipes/obsolete/xorg-app/xlsclients_1.0.2.bb
new file mode 100644
index 0000000..1a531f9
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xlsclients_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "df270f7dd5528ae1b7d80c47585d8278"
+SRC_URI[archive.sha256sum] = "8527cdd29d4fcc67df014bc8b371be98901c9082b8de81ea2302bf705c887698"
diff --git a/recipes/obsolete/xorg-app/xlsfonts_1.0.2.bb b/recipes/obsolete/xorg-app/xlsfonts_1.0.2.bb
new file mode 100644
index 0000000..17c9fe3
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xlsfonts_1.0.2.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+DESCRIPTION = "server font list displayer for X"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "28958248590ff60ecd70e8f590d977b7"
+SRC_URI[archive.sha256sum] = "cc6e519b783b082a2fe4cd06ea5b3693ee6bdb23f4b36e7a72753c524ef5111c"
diff --git a/recipes/obsolete/xorg-app/xmag_1.0.3.bb b/recipes/obsolete/xorg-app/xmag_1.0.3.bb
new file mode 100644
index 0000000..0e1025c
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xmag_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "magnify parts of the screen"
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "32f7ed4c089365cadb9382f6fbd750a9"
+SRC_URI[archive.sha256sum] = "0368268a352d302d0b84229a71e3ea0e8d1c44019b1f06b6301ad7a106418553"
diff --git a/recipes/obsolete/xorg-app/xman_1.1.0.bb b/recipes/obsolete/xorg-app/xman_1.1.0.bb
new file mode 100644
index 0000000..ff65cf5
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xman_1.1.0.bb
@@ -0,0 +1,11 @@
+require xorg-app-common.inc
+DESCRIPTION = "manual page browser for X"
+DEPENDS += " libxaw libxprintutil libxp libxt"
+RDEPENDS_${PN} = " man"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5e5b3351bac26cc1f8490faf1c1402bb"
+SRC_URI[archive.sha256sum] = "9d617ed760fe2147baae5ad9cbbdd85f1bb7534acfc3327bb51dad42e8bcc8b0"
+
+FILES_${PN} += " /usr/share/X11/xman.help"
diff --git a/recipes/obsolete/xorg-app/xmessage_1.0.2.bb b/recipes/obsolete/xorg-app/xmessage_1.0.2.bb
new file mode 100644
index 0000000..ec9aec3
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xmessage_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "xmessage displays a message or query in a window."
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b4b561ef11fd184989a6062962e86748"
+SRC_URI[archive.sha256sum] = "02b4016e93acab94105fa61f6dbe13082669276ab4650b871835fb7884b0c3c3"
diff --git a/recipes/obsolete/xorg-app/xmh_1.0.1.bb b/recipes/obsolete/xorg-app/xmh_1.0.1.bb
new file mode 100644
index 0000000..37fb734
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xmh_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "656bcbdd41818a8b5a9f7dba77a3eeba"
+SRC_URI[archive.sha256sum] = "9471fb455ce0bfc582b865722ab7417c587c9fea82342181e9cd0a9629c2c6fa"
diff --git a/recipes/obsolete/xorg-app/xmodmap_1.0.4.bb b/recipes/obsolete/xorg-app/xmodmap_1.0.4.bb
new file mode 100644
index 0000000..762fc42
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xmodmap_1.0.4.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "utility for modifying keymaps and pointer button mappings in X"
+LICENSE = "MIT"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "bbe021f812e0014a8ee3692317788119"
+SRC_URI[archive.sha256sum] = "805a63525d99f59d60a11aa89121fb9cdb001c8d542237ac4deafbadc7bd0bed"
diff --git a/recipes/obsolete/xorg-app/xmore_1.0.1.bb b/recipes/obsolete/xorg-app/xmore_1.0.1.bb
new file mode 100644
index 0000000..90782d1
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xmore_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxprintutil libxp libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d36e918dce779a9d207b7a266f4e87c8"
+SRC_URI[archive.sha256sum] = "653566be73c474bc45f1a6631e14b008445c74557a8f6f46effee1ac3e8f2527"
diff --git a/recipes/obsolete/xorg-app/xprop_1.1.0.bb b/recipes/obsolete/xorg-app/xprop_1.1.0.bb
new file mode 100644
index 0000000..48f37c3
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xprop_1.1.0.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "a property displayer for X"
+DEPENDS += " libxmu "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f0bacbd30f0dd1c1e9ccafe97687b7a4"
+SRC_URI[archive.sha256sum] = "cc8e07901574895f113baffda19272c54545879e02012314527ebbf2dcc66226"
diff --git a/recipes/obsolete/xorg-app/xrandr/resolve_symbol_clash.patch b/recipes/obsolete/xorg-app/xrandr/resolve_symbol_clash.patch
new file mode 100644
index 0000000..1ecf956
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xrandr/resolve_symbol_clash.patch
@@ -0,0 +1,33 @@
+---
+ xrandr.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- xrandr-1.2.2.orig/xrandr.c
++++ xrandr-1.2.2/xrandr.c
+@@ -189,7 +189,7 @@
+ 
+ #if HAS_RANDR_1_2
+ typedef enum _policy {
+-    clone, extend
++    policy_clone, extend
+ } policy_t;
+ 
+ typedef enum _relation {
+@@ -1602,7 +1602,7 @@
+     int		ret = 0;
+ #if HAS_RANDR_1_2
+     output_t	*output = NULL;
+-    policy_t	policy = clone;
++    policy_t	policy = policy_clone;
+     Bool    	setit_1_2 = False;
+     Bool    	query_1_2 = False;
+     Bool	modeit = False;
+@@ -1863,7 +1863,7 @@
+ 	    continue;
+ 	}
+ 	if (!strcmp ("--clone", argv[i])) {
+-	    policy = clone;
++	    policy = policy_clone;
+ 	    setit_1_2 = True;
+ 	    continue;
+ 	}
diff --git a/recipes/obsolete/xorg-app/xrandr_1.3.2.bb b/recipes/obsolete/xorg-app/xrandr_1.3.2.bb
new file mode 100644
index 0000000..34c0168
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xrandr_1.3.2.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Resize and Rotate extension command."
+LICENSE = "BSD-X"
+DEPENDS += "libxrandr libxrender"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://resolve_symbol_clash.patch"
+SRC_URI[archive.md5sum] = "2cb19bb1c19ccf77c40032b03dbe06f0"
+SRC_URI[archive.sha256sum] = "34d4334644a6494573141bb8647feb8f91c0ce8c8d3b6883b4861e038e912249"
diff --git a/recipes/obsolete/xorg-app/xrdb_1.0.6.bb b/recipes/obsolete/xorg-app/xrdb_1.0.6.bb
new file mode 100644
index 0000000..a5f90f3
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xrdb_1.0.6.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X server resource database utility"
+LICENSE = "xrdb"
+DEPENDS += "libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8dd881cd5a7dcb6e456549817f0fb475"
+SRC_URI[archive.sha256sum] = "8d062a3764665fcf22b14df4a5aca6af1e6d7d613296875b31b68e74ef66fc99"
diff --git a/recipes/obsolete/xorg-app/xrefresh_1.0.3.bb b/recipes/obsolete/xorg-app/xrefresh_1.0.3.bb
new file mode 100644
index 0000000..dd4bfab
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xrefresh_1.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8f4fafcfb77b3c6972cc44bb3f1c899c"
+SRC_URI[archive.sha256sum] = "3ee0a5f7aeb14bbffbcafcff8e7806c9a59f08e1a58322a50f5fca023a7d7ed9"
diff --git a/recipes/obsolete/xorg-app/xrx_1.0.3.bb b/recipes/obsolete/xorg-app/xrx_1.0.3.bb
new file mode 100644
index 0000000..a412479
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xrx_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt libxext xtrans xproxymngproto libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c121945afcfc84e99af17158fda68be9"
+SRC_URI[archive.sha256sum] = "9cb0fc67153ce935550d61dfd3d021cb3e6833274453538885b7cddff9fe8abe"
diff --git a/recipes/obsolete/xorg-app/xset-1.1.0/disable-xkb.patch b/recipes/obsolete/xorg-app/xset-1.1.0/disable-xkb.patch
new file mode 100644
index 0000000..6060fbb
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xset-1.1.0/disable-xkb.patch
@@ -0,0 +1,18 @@
+--- xset-1.0.1/configure.ac.orig	2006-03-08 19:46:59.000000000 +0100
++++ xset-1.0.1/configure.ac	2006-03-08 19:47:40.000000000 +0100
+@@ -42,11 +42,15 @@
+ 	AC_CHECK_HEADERS([X11/extensions/dpms.h X11/extensions/MITMisc.h],,,[#include <X11/Xlib.h>])
+ 	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
+ 
++AC_ARG_ENABLE(xkb, AC_HELP_STRING([--disable-xkb], [Disable XKB support]),
++        XKB="$enableval", XKB="yes")
++if test "x$XKB" = "xyes" ; then
+ PKG_CHECK_MODULES(SET_XKB, x11, 
+ 	[SAVE_CPPFLAGS="$CPPFLAGS"
+ 	CPPFLAGS="$CPPFLAGS $SET_XKB_CFLAGS $SET_X11_CFLAGS"
+ 	AC_CHECK_HEADERS([X11/XKBlib.h],,,[#include <X11/Xlib.h>])
+ 	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
++fi
+ 
+ PKG_CHECK_MODULES(SET_XF86MISC, xxf86misc, 
+ 	[SAVE_CPPFLAGS="$CPPFLAGS"
diff --git a/recipes/obsolete/xorg-app/xset_1.1.0.bb b/recipes/obsolete/xorg-app/xset_1.1.0.bb
new file mode 100644
index 0000000..8592ad2
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xset_1.1.0.bb
@@ -0,0 +1,14 @@
+require xorg-app-common.inc
+DESCRIPTION = "user preference utility for X"
+LICENSE = "MIT"
+DEPENDS += "libxext libxxf86misc libxfontcache libxmu libxp libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://disable-xkb.patch"
+SRC_URI[archive.md5sum] = "eeb0d02f69c76bd40470dede99b4bd49"
+SRC_URI[archive.sha256sum] = "72c859c6030890a25cf828d0b2743454e50eadab30f6be8c17172fe97a554643"
+
+EXTRA_OECONF = "--disable-xkb"
+
+CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/obsolete/xorg-app/xsetroot_1.0.3.bb b/recipes/obsolete/xorg-app/xsetroot_1.0.3.bb
new file mode 100644
index 0000000..08a0e68
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xsetroot_1.0.3.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "Sets the visual appearance of the X root window"
+LICENSE = "MIT"
+DEPENDS += "libxmu xbitmaps"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cbda9b9b8da5af4614110883d5a276b8"
+SRC_URI[archive.sha256sum] = "d7e512cc686de3ab5fcd3c9f9e605d7cae68a4b50f2c0786f0f09ce08c728f48"
diff --git a/recipes/obsolete/xorg-app/xsm_1.0.1.bb b/recipes/obsolete/xorg-app/xsm_1.0.1.bb
new file mode 100644
index 0000000..b0ee345
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xsm_1.0.1.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Session Manager"
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cce867ff7d0df9c0b9e682591779952c"
+SRC_URI[archive.sha256sum] = "2f2535b5394d59be0a4bb15c12ea1b19b873a0096446ecc4c71aa81f0d99b29a"
diff --git a/recipes/obsolete/xorg-app/xstdcmap_1.0.1.bb b/recipes/obsolete/xorg-app/xstdcmap_1.0.1.bb
new file mode 100644
index 0000000..748b079
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xstdcmap_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "86ab558441edfb86f853639e4290a754"
+SRC_URI[archive.sha256sum] = "0d920660137dee514599f63b5a8c8ce14d2474607e28e32c973cafb360f7e738"
diff --git a/recipes/obsolete/xorg-app/xterm_207.bb b/recipes/obsolete/xorg-app/xterm_207.bb
new file mode 100644
index 0000000..ac485a7
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xterm_207.bb
@@ -0,0 +1,21 @@
+require xorg-app-common.inc
+DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
+DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
+PR = "${INC_PR}.1"
+
+SRC_URI = "${XORG_MIRROR}/development/X11R7.0-RC4/extras/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "3de8a3756c284a46a08c6d0308909486"
+SRC_URI[sha256sum] = "652f579171e6e8f73c13ab6b060d2447ae35ebfbd39a6002b7c05a1dfc0f7eb8"
+
+EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
+                 --x-libraries=${STAGING_LIBDIR} \
+                 FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
+                 --disable-imake \
+                 --disable-setuid"
+
+do_configure() {
+        sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
+        oe_runconf
+}
+
+FILES_${PN} += " /usr/lib/X11"
diff --git a/recipes/obsolete/xorg-app/xterm_251.bb b/recipes/obsolete/xorg-app/xterm_251.bb
new file mode 100644
index 0000000..388fbc3
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xterm_251.bb
@@ -0,0 +1,21 @@
+require xorg-app-common.inc
+DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
+DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
+PR = "${INC_PR}.1"
+
+SRC_URI = "ftp://invisible-island.net/xterm/${PN}-${PV}.tgz"
+SRC_URI[md5sum] = "343a4ce213f70c53cf65979f163bebc3"
+SRC_URI[sha256sum] = "2ff9a4ae66cf9a48829023d1d007b0e84ee9cc60feb48107f9c1ea9dd7570ce7"
+
+EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
+                 --x-libraries=${STAGING_LIBDIR} \
+                 FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
+                 --disable-imake \
+                 --disable-setuid"
+
+do_configure() {
+        sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
+        oe_runconf
+}
+
+FILES_${PN} += " /usr/lib/X11"
diff --git a/recipes/obsolete/xorg-app/xvidtune_1.0.1.bb b/recipes/obsolete/xorg-app/xvidtune_1.0.1.bb
new file mode 100644
index 0000000..e052500
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xvidtune_1.0.1.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxxf86vm libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e0744594f4e5969b20df28d897781318"
+SRC_URI[archive.sha256sum] = "6d0feb42c2f1d6011d97c776b9d580fd589cdf3cfe246cd99437c406a2740d36"
+
+FILES_${PN} += " ${datadir}/X11/app-defaults/Xvidtune "
diff --git a/recipes/obsolete/xorg-app/xvinfo_1.1.0.bb b/recipes/obsolete/xorg-app/xvinfo_1.1.0.bb
new file mode 100644
index 0000000..37c66de
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xvinfo_1.1.0.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "Print out X-Video extension adaptor information"
+DEPENDS += " libxv"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8cc299b2cb636b5f7fe672610789d3d4"
+SRC_URI[archive.sha256sum] = "0a318f6ca0d92bd5cc2ab9d2690f6120b3e1537b7902ce110469864869e86efb"
diff --git a/recipes/obsolete/xorg-app/xwd_1.0.3.bb b/recipes/obsolete/xorg-app/xwd_1.0.3.bb
new file mode 100644
index 0000000..fe84b4d
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xwd_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "007cea1f389abde5c93162dcd5541351"
+SRC_URI[archive.sha256sum] = "fff2dbea086c554463d4309209ee05e026b7f19900598f55e0a24a6d7a7ee3fd"
diff --git a/recipes/obsolete/xorg-app/xwininfo_1.0.5.bb b/recipes/obsolete/xorg-app/xwininfo_1.0.5.bb
new file mode 100644
index 0000000..348e4af
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xwininfo_1.0.5.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu libxext "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "908f8bc3255f639effa9780fb1c19ea4"
+SRC_URI[archive.sha256sum] = "8db6b81a7b0bc4e7acce6c6d41df9747b0b19e12c21c5a70b51bbc63a42cdcd9"
diff --git a/recipes/obsolete/xorg-app/xwud_1.0.2.bb b/recipes/obsolete/xorg-app/xwud_1.0.2.bb
new file mode 100644
index 0000000..de77cf2
--- /dev/null
+++ b/recipes/obsolete/xorg-app/xwud_1.0.2.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "20bc5d85634964d4ceee77cdfcd131ed"
+SRC_URI[archive.sha256sum] = "84345dfbff0dc411689639aada2407758640af71eb61a1be332bfa24d8b90ac1"
diff --git a/recipes/xorg-app/appres_1.0.2.bb b/recipes/xorg-app/appres_1.0.2.bb
deleted file mode 100644
index bb76f3e..0000000
--- a/recipes/xorg-app/appres_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "The appres program prints the resources seen by an application."
-DEPENDS += " libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6f2f5d9f41669d498b56d73dc3206951"
-SRC_URI[archive.sha256sum] = "37d0fbb16c553fa09878d107f29f26c2ca4206c98dd23c44a0cb670ace531e36"
diff --git a/recipes/xorg-app/bdftopcf_1.0.2.bb b/recipes/xorg-app/bdftopcf_1.0.2.bb
deleted file mode 100644
index 450eb63..0000000
--- a/recipes/xorg-app/bdftopcf_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "converts BDF fonts to PCF fonts"
-DEPENDS += " libxfont"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "148f20d28caaa69bbe7dcca7c2674fb6"
-SRC_URI[archive.sha256sum] = "11017f0dd637fd3228bd56fdbbd72193fd747c10d893a711c25bf6734c4da06b"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/beforelight_1.0.3.bb b/recipes/xorg-app/beforelight_1.0.3.bb
deleted file mode 100644
index 4d45541..0000000
--- a/recipes/xorg-app/beforelight_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a sample implementation of a screen saver for X"
-DEPENDS += " libxscrnsaver libxt libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d55b0e7196dafcfeb4db3886af2e1969"
-SRC_URI[archive.sha256sum] = "cae9427fa083a0ec3f2d1a3a6391508b31a2cf0220cb8d732c5d473a8c995c4e"
diff --git a/recipes/xorg-app/bitmap_1.0.4.bb b/recipes/xorg-app/bitmap_1.0.4.bb
deleted file mode 100644
index f9cb165..0000000
--- a/recipes/xorg-app/bitmap_1.0.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu xbitmaps libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7d0c1ac193be2491c72a91ccf37ef18e"
-SRC_URI[archive.sha256sum] = "2517aaa015795a348435e4e83bafe7642d4b2fe1976ee982a5d652cf417f79d8"
diff --git a/recipes/xorg-app/constype_1.0.2.bb b/recipes/xorg-app/constype_1.0.2.bb
deleted file mode 100644
index c72a171..0000000
--- a/recipes/xorg-app/constype_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "print an X window dump"
-DEPENDS += " libxmu "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "83f623f961400ecc56ff52a716308173"
-SRC_URI[archive.sha256sum] = "70375ea6b3e17cabc35492f87b5b138295c8f0258d65b0fbba998e3ff69bb634"
diff --git a/recipes/xorg-app/editres_1.0.4.bb b/recipes/xorg-app/editres_1.0.4.bb
deleted file mode 100644
index fd09300..0000000
--- a/recipes/xorg-app/editres_1.0.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxt libxmu libxaw"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1800dda934ebb7c588ea686278a10e9f"
-SRC_URI[archive.sha256sum] = "d7ce4c0bb214e055cb7680d8b88b9f551610fc40c28269cb51649133862f3302"
diff --git a/recipes/xorg-app/fslsfonts_1.0.2.bb b/recipes/xorg-app/fslsfonts_1.0.2.bb
deleted file mode 100644
index b792a08..0000000
--- a/recipes/xorg-app/fslsfonts_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libfs"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a61be25c87ee42169ee4dc8344acc9e2"
-SRC_URI[archive.sha256sum] = "9c8e7d573284272c633b5cf18e3358830b27bde72f4bc1ae83a1ab337d463a92"
diff --git a/recipes/xorg-app/fstobdf_1.0.3.bb b/recipes/xorg-app/fstobdf_1.0.3.bb
deleted file mode 100644
index 0d92d5b..0000000
--- a/recipes/xorg-app/fstobdf_1.0.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libfs"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "49a6225380f6c18fff664a043cd569b1"
-SRC_URI[archive.sha256sum] = "f2242720045c69f69dc9e18320a1c6402e92234d40c237367560fae3d210f7b0"
diff --git a/recipes/xorg-app/iceauth_1.0.3.bb b/recipes/xorg-app/iceauth_1.0.3.bb
deleted file mode 100644
index 5be63a0..0000000
--- a/recipes/xorg-app/iceauth_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a tool for manipulating ICE protocol authorization records"
-DEPENDS += " libice"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "975ade3f238c1eb10705da0a91e6e8e7"
-SRC_URI[archive.sha256sum] = "abca3ff6c9f2da2600a474f0e92ae5e62c43914f7bd3d948b91b0a7f9117d81e"
diff --git a/recipes/xorg-app/ico_1.0.2.bb b/recipes/xorg-app/ico_1.0.2.bb
deleted file mode 100644
index 040017c..0000000
--- a/recipes/xorg-app/ico_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "an X graphics demo using an animated polyhedron"
-DEPENDS += " libxau libxdmcp"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5711827c5c2563620b56c33aababbc63"
-SRC_URI[archive.sha256sum] = "db2e96e18a2bcc29b91b9de7b758a7c67cebee27772fb540c44c7bc2c2218aa5"
diff --git a/recipes/xorg-app/listres_1.0.1.bb b/recipes/xorg-app/listres_1.0.1.bb
deleted file mode 100644
index 7b466d8..0000000
--- a/recipes/xorg-app/listres_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "827a1ac5adf9aadd0c13b54a897e297b"
-SRC_URI[archive.sha256sum] = "7156e58025e240a501d5b32244b923b283bb35014ea5a4081b70044af8aef7a3"
diff --git a/recipes/xorg-app/luit_1.0.4.bb b/recipes/xorg-app/luit_1.0.4.bb
deleted file mode 100644
index 71a2910..0000000
--- a/recipes/xorg-app/luit_1.0.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a filter for locale and ISO 2022 support on Unicode terminals"
-DEPENDS += " zlib zlib libfontenc"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4e45233e310d72dce307709761cf241b"
-SRC_URI[archive.sha256sum] = "d11cd500975f652060f89d79cb8034011d99ee9aa6c82951680fc0621ecb8252"
diff --git a/recipes/xorg-app/mkbold-mkitalic-native-0.11/makebifonts b/recipes/xorg-app/mkbold-mkitalic-native-0.11/makebifonts
new file mode 100644
index 0000000..dc09895
--- /dev/null
+++ b/recipes/xorg-app/mkbold-mkitalic-native-0.11/makebifonts
@@ -0,0 +1,5 @@
+#!/bin/sh
+cat $1.bdf | bdftopcf | gzip -c -3 > $2/$3.pcf.gz
+cat $1.bdf | mkbold | bdftopcf | gzip -c -3 > $2/$3_b.pcf.gz
+cat $1.bdf | mkitalic | bdftopcf | gzip -c -3 > $2/$3_i.pcf.gz
+cat $1.bdf | mkbolditalic | bdftopcf | gzip -c -3 > $2/$3_bi.pcf.gz
diff --git a/recipes/xorg-app/mkbold-mkitalic-native/makebifonts b/recipes/xorg-app/mkbold-mkitalic-native/makebifonts
deleted file mode 100644
index dc09895..0000000
--- a/recipes/xorg-app/mkbold-mkitalic-native/makebifonts
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-cat $1.bdf | bdftopcf | gzip -c -3 > $2/$3.pcf.gz
-cat $1.bdf | mkbold | bdftopcf | gzip -c -3 > $2/$3_b.pcf.gz
-cat $1.bdf | mkitalic | bdftopcf | gzip -c -3 > $2/$3_i.pcf.gz
-cat $1.bdf | mkbolditalic | bdftopcf | gzip -c -3 > $2/$3_bi.pcf.gz
diff --git a/recipes/xorg-app/mkfontdir_1.0.5.bb b/recipes/xorg-app/mkfontdir_1.0.5.bb
deleted file mode 100644
index 0786a90..0000000
--- a/recipes/xorg-app/mkfontdir_1.0.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a program to create an index of X font files in a directory"
-RDEPENDS_${PN} += "mkfontscale"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "9365ac66d19186eaf030482d312fca06"
-SRC_URI[archive.sha256sum] = "a534650cff503619f9101577d816cde283da993bc039273477bd8dfbd01a2d0b"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/mkfontscale_1.0.7.bb b/recipes/xorg-app/mkfontscale_1.0.7.bb
deleted file mode 100644
index 8655664..0000000
--- a/recipes/xorg-app/mkfontscale_1.0.7.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a program to create an index of scalable font files for X"
-DEPENDS += " zlib libfontenc freetype "
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "96ca346f185c0ab48e42bf5bb0375da5"
-SRC_URI[archive.sha256sum] = "8306b229cca233216a6582cb1ff60af78e37c47d6412ac823d7d41c3d7de7127"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/oclock_1.0.1.bb b/recipes/xorg-app/oclock_1.0.1.bb
deleted file mode 100644
index 1ffa51a..0000000
--- a/recipes/xorg-app/oclock_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu libxext libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "91f49547f9ed3cd0137c8b7c3183e360"
-SRC_URI[archive.sha256sum] = "49ab7d4f6402fbbe30714012ee38b49da17789f3a29ac41917987ce18c74217c"
diff --git a/recipes/xorg-app/proxymngr_1.0.1.bb b/recipes/xorg-app/proxymngr_1.0.1.bb
deleted file mode 100644
index a7cea51..0000000
--- a/recipes/xorg-app/proxymngr_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libice libxt xproxymngproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "aad44d0f65b97fd6d564b1d2ae510bb1"
-SRC_URI[archive.sha256sum] = "e9f5d4553411562477a0605fb0f0ec728016499e37230138a5e207dec79525c5"
diff --git a/recipes/xorg-app/rendercheck_1.3.bb b/recipes/xorg-app/rendercheck_1.3.bb
deleted file mode 100644
index 911a093..0000000
--- a/recipes/xorg-app/rendercheck_1.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a program to test Render extension implementations"
-DEPENDS += "libxrender"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "eb6a358b79b0aeaf03d56c5e1f394365"
-SRC_URI[archive.sha256sum] = "60e83bebab37c2754ae77cc359c0b67e8bc72b46821c7fa260ccc5c811bd741f"
diff --git a/recipes/xorg-app/rgb_1.0.3.bb b/recipes/xorg-app/rgb_1.0.3.bb
deleted file mode 100644
index b4eb11c..0000000
--- a/recipes/xorg-app/rgb_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " xproto util-macros"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "44ea16cc3104de6401bc74035f642357"
-SRC_URI[archive.sha256sum] = "162111c0192c8f78e99a6ee9a3df5eb149251c5800896c993399da005ec7fe95"
-
-FILES_${PN} += "${datadir}/X11"
diff --git a/recipes/xorg-app/rstart_1.0.3.bb b/recipes/xorg-app/rstart_1.0.3.bb
deleted file mode 100644
index b82c821..0000000
--- a/recipes/xorg-app/rstart_1.0.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e09c14cf1ac78260f95a9aa45bccab4c"
-SRC_URI[archive.sha256sum] = "d6ee7becf9ece2fcc30ce50f7e9be31f231cce0cb3a8ba09d1697ac2822c3fcc"
diff --git a/recipes/xorg-app/sessreg_1.0.5.bb b/recipes/xorg-app/sessreg_1.0.5.bb
deleted file mode 100644
index 6fc2ee0..0000000
--- a/recipes/xorg-app/sessreg_1.0.5.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a simple program for managing utmp/wtmp entries"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "00e834c3cbfd990e9d7d5ddc834242df"
-SRC_URI[archive.sha256sum] = "3308fbd0018d53bb818fee9de1cde484965b740073d5d240efa4cfc881c9d1a9"
diff --git a/recipes/xorg-app/setxkbmap_1.1.0.bb b/recipes/xorg-app/setxkbmap_1.1.0.bb
deleted file mode 100644
index ba7b46e..0000000
--- a/recipes/xorg-app/setxkbmap_1.1.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxkbfile "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2f902e0a89aaf2b19e06e7f26c6efb3a"
-SRC_URI[archive.sha256sum] = "932f2b314a4bf6dfccd16d63c633073abf650d8e136f481904e972ef3d4faf64"
diff --git a/recipes/xorg-app/showfont_1.0.2.bb b/recipes/xorg-app/showfont_1.0.2.bb
deleted file mode 100644
index 217745a..0000000
--- a/recipes/xorg-app/showfont_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libfs"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8f83d774ed4cc2a6dca86edd856d820a"
-SRC_URI[archive.sha256sum] = "9bd0373659b2f24120dba887fd155f99aed02e4a7c2afae69e7db1c1fa05e88c"
diff --git a/recipes/xorg-app/smproxy_1.0.3.bb b/recipes/xorg-app/smproxy_1.0.3.bb
deleted file mode 100644
index 3b44ef6..0000000
--- a/recipes/xorg-app/smproxy_1.0.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxt libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ba7dbde81be24fc1bd4156b360e5f8cf"
-SRC_URI[archive.sha256sum] = "1b8dd25483280fc2a4a7d977b4a43dc4228b9c65e904c3d4ee68245705d4ae35"
diff --git a/recipes/xorg-app/twm_1.0.4.bb b/recipes/xorg-app/twm_1.0.4.bb
deleted file mode 100644
index 96cbf14..0000000
--- a/recipes/xorg-app/twm_1.0.4.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "tiny window manager"
-DEPENDS += " libxext libxt libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0865e14c73c08fa8c501ae877298ee9f"
-SRC_URI[archive.sha256sum] = "daa088f9ae231508929b7bd4746e942212b53f2802ca4cee450139fabc8de1fa"
-
-ALTERNATIVE_NAME = "x-window-manager"
-ALTERNATIVE_PATH = "${bindir}/twm"
-ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PRIORITY = "1"
diff --git a/recipes/xorg-app/viewres_1.0.1.bb b/recipes/xorg-app/viewres_1.0.1.bb
deleted file mode 100644
index 60c9ef6..0000000
--- a/recipes/xorg-app/viewres_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "cdbed540daf7975b56000420c9aa5bf9"
-SRC_URI[archive.sha256sum] = "bf49cd45ffb197a6992b3b7c99c94161eaf7cf6a2b661d3905ac382bedce34b8"
diff --git a/recipes/xorg-app/x11perf_1.5.1.bb b/recipes/xorg-app/x11perf_1.5.1.bb
deleted file mode 100644
index 76a0457..0000000
--- a/recipes/xorg-app/x11perf_1.5.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X11 server performance test program"
-DEPENDS += "libxmu libxrender libxft libxext fontconfig"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "66e4aa4645f83809071eb69553ed0222"
-SRC_URI[archive.sha256sum] = "ab4c6a579f93fa9485ef5be8760a3da0d22acfa743f2114057c5262b77ff7056"
-
-FILES_${PN} += "/usr/lib/X11/x11perfcomp/*"
diff --git a/recipes/xorg-app/xauth_1.0.4.bb b/recipes/xorg-app/xauth_1.0.4.bb
deleted file mode 100644
index 4233097..0000000
--- a/recipes/xorg-app/xauth_1.0.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X authority file utility"
-DEPENDS += "libxau libxext libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fa00078c414c4a57cab7a6d89a0c8734"
-SRC_URI[archive.sha256sum] = "f91190c8b8bb18270b86b00f30da5684bb5e5bd1ed0ccf352322f8145e076a59"
diff --git a/recipes/xorg-app/xbacklight_1.1.1.bb b/recipes/xorg-app/xbacklight_1.1.1.bb
deleted file mode 100644
index a8d4825..0000000
--- a/recipes/xorg-app/xbacklight_1.1.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "adjust backlight brightness using RandR extension"
-DEPENDS += " libxrender libxrandr"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3e39eec6d0fd5c587ca6d55aa7bb8fe1"
-SRC_URI[archive.sha256sum] = "5d32d891c83b9c0089231f4f1c424ab02301b627ce26e5c2e6e397b8ea606fb2"
diff --git a/recipes/xorg-app/xbiff_1.0.1.bb b/recipes/xorg-app/xbiff_1.0.1.bb
deleted file mode 100644
index ac2eefb..0000000
--- a/recipes/xorg-app/xbiff_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw xbitmaps libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "404f5add4537d22dd109c33e518a5190"
-SRC_URI[archive.sha256sum] = "9845b1fa8a1cfd408f01fd69b66808068e847cdc925d114c7723c17934a96503"
diff --git a/recipes/xorg-app/xcalc_1.0.2.bb b/recipes/xorg-app/xcalc_1.0.2.bb
deleted file mode 100644
index b35ab5c..0000000
--- a/recipes/xorg-app/xcalc_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "scientific calculator for X"
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d31a99795b9668f047aa11bf36df6df0"
-SRC_URI[archive.sha256sum] = "96375e2d212e7249d14d0beac73c1a6d89252b5fcf571bd9f5c7303a14bb4a32"
diff --git a/recipes/xorg-app/xclipboard_1.1.0.bb b/recipes/xorg-app/xclipboard_1.1.0.bb
deleted file mode 100644
index 7509998..0000000
--- a/recipes/xorg-app/xclipboard_1.1.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "113eccea3ee73a1ef7b43d2291ca1e09"
-SRC_URI[archive.sha256sum] = "de0f37c7bf69c3aac3362bc0cbe470a622c2a85b62c5483c113ea88512232710"
diff --git a/recipes/xorg-app/xclock_1.0.4.bb b/recipes/xorg-app/xclock_1.0.4.bb
deleted file mode 100644
index ae74aea..0000000
--- a/recipes/xorg-app/xclock_1.0.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "analog / digital clock for X"
-DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "bb9fd5e00d39c348a0078b97fdf8258f"
-SRC_URI[archive.sha256sum] = "69b903b6305211c9fc5db394f3d08c0a696aa51942d73db7f594422e7be6edf0"
diff --git a/recipes/xorg-app/xcmsdb_1.0.2.bb b/recipes/xorg-app/xcmsdb_1.0.2.bb
deleted file mode 100644
index 3a177a8..0000000
--- a/recipes/xorg-app/xcmsdb_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7f2bed9f4dd3301d18d83eb296c3be0d"
-SRC_URI[archive.sha256sum] = "bfcac66634ea4d4a1607f1c8a4170e6089db13355357fc143281a6fc0216face"
diff --git a/recipes/xorg-app/xcompmgr_1.1.4.bb b/recipes/xorg-app/xcompmgr_1.1.4.bb
deleted file mode 100644
index d781958..0000000
--- a/recipes/xorg-app/xcompmgr_1.1.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Compositing Manager"
-PRIORITY = "optional"
-LICENSE = "BSD-X"
-DEPENDS += "libxdamage libxcomposite libxrender"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3eb1c2b7a6ceaec4ee872cb06d202d91"
-SRC_URI[archive.sha256sum] = "4bf647745b4de940ef75796fc8ad4e1f83c276e474f7b6779f317fcd070de884"
diff --git a/recipes/xorg-app/xconsole_1.0.3.bb b/recipes/xorg-app/xconsole_1.0.3.bb
deleted file mode 100644
index 3f8ffb6..0000000
--- a/recipes/xorg-app/xconsole_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "monitor system console messages with X"
-DEPENDS += " libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0e1a3110bebabecc2897d67a973526b0"
-SRC_URI[archive.sha256sum] = "1b1ec25fefad34f5c33c74474358c1f5a8702d8c04defc854826bccb7a46bc45"
diff --git a/recipes/xorg-app/xcursorgen_1.0.3.bb b/recipes/xorg-app/xcursorgen_1.0.3.bb
deleted file mode 100644
index 65260e5..0000000
--- a/recipes/xorg-app/xcursorgen_1.0.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "create an X cursor file from a collection of PNG images"
-DEPENDS += " libxcursor libpng"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "69df079b3950a0db4e5f4e6f0e00ddee"
-SRC_URI[archive.sha256sum] = "ed5f3ffe881c21ffca85406e5a5f553ed4985cc5e9acdb535f682c33bebac254"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/xdbedizzy_1.0.2.bb b/recipes/xorg-app/xdbedizzy_1.0.2.bb
deleted file mode 100644
index 63c04ee..0000000
--- a/recipes/xorg-app/xdbedizzy_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxp libxprintutil libxp libxau libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ecef9cfd197d00980e0d69ee4126d890"
-SRC_URI[archive.sha256sum] = "74e882e9fee7ebeb274caf43071afff92531b8a41f34650376146a131166012d"
diff --git a/recipes/xorg-app/xditview_1.0.1.bb b/recipes/xorg-app/xditview_1.0.1.bb
deleted file mode 100644
index d23a028..0000000
--- a/recipes/xorg-app/xditview_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e9a7192ef29453b8c810ddd556a463c0"
-SRC_URI[archive.sha256sum] = "177194e5f83b31c2f934e3a0b573e8ae359edf2ef1a2403ee8e1dad383558117"
diff --git a/recipes/xorg-app/xdm_1.1.9.bb b/recipes/xorg-app/xdm_1.1.9.bb
deleted file mode 100644
index a6796b5..0000000
--- a/recipes/xorg-app/xdm_1.1.9.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X display manager"
-DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "030ae4bd9b8d428749d68bfdf56ce8a5"
-SRC_URI[archive.sha256sum] = "e7b1db0e1b0d0113a301d94e40b0314e55f7e0006415f50a9cf06f636b11b134"
-
-EXTRA_OECONF += "\
-        --with-random-device=/dev/urandom --with-utmp-file=/var/run/utmp \
-        --with-wtmp-file=/var/log/wtmp \
-        "
-
-FILES_${PN}-dbg += "${libdir}/X11/xdm/.debug/*"
diff --git a/recipes/xorg-app/xdpyinfo-1.2.0/disable-xkb.patch b/recipes/xorg-app/xdpyinfo-1.2.0/disable-xkb.patch
new file mode 100644
index 0000000..24af21f
--- /dev/null
+++ b/recipes/xorg-app/xdpyinfo-1.2.0/disable-xkb.patch
@@ -0,0 +1,18 @@
+--- xdpyinfo-1.0.1/configure.ac.orig	2006-03-08 16:33:05.000000000 +0100
++++ xdpyinfo-1.0.1/configure.ac	2006-03-08 16:41:59.000000000 +0100
+@@ -45,11 +45,15 @@
+ 	AC_CHECK_HEADERS([X11/extensions/multibuf.h X11/extensions/XShm.h],,,[#include <X11/Xlib.h>])
+ 	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
+ 
++AC_ARG_ENABLE(xkb, AC_HELP_STRING([--disable-xkb], [Disable XKB support]),
++        XKB="$enableval", XKB="yes")
++if test "x$XKB" = "xyes" ; then
+ PKG_CHECK_MODULES(DPY_XKB, x11, 
+ 	[SAVE_CPPFLAGS="$CPPFLAGS"
+ 	CPPFLAGS="$CPPFLAGS $DPY_XKB_CFLAGS $DPY_X11_CFLAGS"
+ 	AC_CHECK_HEADERS([X11/extensions/XKB.h X11/XKBlib.h],,,[#include <X11/Xlib.h>])
+ 	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
++fi
+ 
+ PKG_CHECK_MODULES(DPY_XF86VIDMODE, xxf86vm, 
+ 	[SAVE_CPPFLAGS="$CPPFLAGS"
diff --git a/recipes/xorg-app/xdpyinfo/disable-xkb.patch b/recipes/xorg-app/xdpyinfo/disable-xkb.patch
deleted file mode 100644
index 24af21f..0000000
--- a/recipes/xorg-app/xdpyinfo/disable-xkb.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- xdpyinfo-1.0.1/configure.ac.orig	2006-03-08 16:33:05.000000000 +0100
-+++ xdpyinfo-1.0.1/configure.ac	2006-03-08 16:41:59.000000000 +0100
-@@ -45,11 +45,15 @@
- 	AC_CHECK_HEADERS([X11/extensions/multibuf.h X11/extensions/XShm.h],,,[#include <X11/Xlib.h>])
- 	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
- 
-+AC_ARG_ENABLE(xkb, AC_HELP_STRING([--disable-xkb], [Disable XKB support]),
-+        XKB="$enableval", XKB="yes")
-+if test "x$XKB" = "xyes" ; then
- PKG_CHECK_MODULES(DPY_XKB, x11, 
- 	[SAVE_CPPFLAGS="$CPPFLAGS"
- 	CPPFLAGS="$CPPFLAGS $DPY_XKB_CFLAGS $DPY_X11_CFLAGS"
- 	AC_CHECK_HEADERS([X11/extensions/XKB.h X11/XKBlib.h],,,[#include <X11/Xlib.h>])
- 	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
-+fi
- 
- PKG_CHECK_MODULES(DPY_XF86VIDMODE, xxf86vm, 
- 	[SAVE_CPPFLAGS="$CPPFLAGS"
diff --git a/recipes/xorg-app/xdpyinfo_1.1.0.bb b/recipes/xorg-app/xdpyinfo_1.1.0.bb
deleted file mode 100644
index f7b3134..0000000
--- a/recipes/xorg-app/xdpyinfo_1.1.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X display information utility"
-LICENSE = "MIT"
-DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi libxrender libxinerama libdmx libxp libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://disable-xkb.patch"
-SRC_URI[archive.md5sum] = "d1d516610316138105cd07064b257c5c"
-SRC_URI[archive.sha256sum] = "780d8dfe65653f42ee26d35928ab7f72f5f27ab08eda692fe4baad05126a0631"
-
-EXTRA_OECONF = "--disable-xkb"
diff --git a/recipes/xorg-app/xdriinfo_1.0.3.bb b/recipes/xorg-app/xdriinfo_1.0.3.bb
deleted file mode 100644
index a123cad..0000000
--- a/recipes/xorg-app/xdriinfo_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "query configuration information of DRI drivers"
-DEPENDS += " glproto virtual/libgl"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "cb304d1ce562ac48b68eedeba38c662f"
-SRC_URI[archive.sha256sum] = "2b762afd08c798d79fd6dacfd6280da39105927fa2bd91e3b1ba75b8cddc259c"
diff --git a/recipes/xorg-app/xedit_1.1.2.bb b/recipes/xorg-app/xedit_1.1.2.bb
deleted file mode 100644
index 2b16fb8..0000000
--- a/recipes/xorg-app/xedit_1.1.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxprintutil libxp libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "67193be728414d45a1922911e6437991"
-SRC_URI[archive.sha256sum] = "a38823a8b7919e2efa689bc4c279e12314e45b41131c39ce9ca523e54f42fa1f"
diff --git a/recipes/xorg-app/xev/diet-x11.patch b/recipes/xorg-app/xev/diet-x11.patch
deleted file mode 100644
index 9f515e8..0000000
--- a/recipes/xorg-app/xev/diet-x11.patch
+++ /dev/null
@@ -1,80 +0,0 @@
----
- xev.c |   16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-Index: xev-1.0.2/xev.c
-===================================================================
---- xev-1.0.2.orig/xev.c	2006-06-02 00:25:44.000000000 +0100
-+++ xev-1.0.2/xev.c	2007-05-10 15:22:07.000000000 +0100
-@@ -109,7 +109,7 @@ do_KeyPress (XEvent *eventp)
-     nbytes = XLookupString (e, str, 256, &ks, NULL);
- 
-     /* not supposed to call XmbLookupString on a key release event */
--    if (e->type == KeyPress && xic) {
-+    /*if (e->type == KeyPress && xic) {
-         do {
-             nmbbytes = XmbLookupString (xic, e, buf, bsize - 1, &ks, &status);
-             buf[nmbbytes] = '\0';
-@@ -119,7 +119,7 @@ do_KeyPress (XEvent *eventp)
-                 buf = realloc (buf, bsize);
-             }
-         } while (status == XBufferOverflow);
--    }
-+    }*/
- 
-     if (ks == NoSymbol)
- 	ksname = "NoSymbol";
-@@ -149,7 +149,7 @@ do_KeyPress (XEvent *eventp)
-     }
- 
-     /* not supposed to call XmbLookupString on a key release event */
--    if (e->type == KeyPress && xic) {
-+    /*if (e->type == KeyPress && xic) {
-         printf ("    XmbLookupString gives %d bytes: ", nmbbytes);
-         if (nmbbytes > 0) {
-            dump (buf, nmbbytes);
-@@ -157,7 +157,7 @@ do_KeyPress (XEvent *eventp)
-         } else {
-     	   printf ("\n");
-         }
--    }
-+    } */
- 
-     printf ("    XFilterEvent returns: %s\n", 
- 	    XFilterEvent (eventp, e->window) ? "True" : "False");
-@@ -804,7 +804,7 @@ main (int argc, char **argv)
-         fprintf (stderr, "%s:  XSetLocaleModifiers failed\n", ProgramName);
-     }
- 
--    xim = XOpenIM (dpy, NULL, NULL, NULL);
-+    /*xim = XOpenIM (dpy, NULL, NULL, NULL);
-     if (xim == NULL) {
-         fprintf (stderr, "%s:  XOpenIM failed\n", ProgramName);
-     }
-@@ -831,7 +831,7 @@ main (int argc, char **argv)
-             }
-             XFree (xim_styles);
-         }
--    } 
-+    }*/
- 
-     screen = DefaultScreen (dpy);
- 
-@@ -891,7 +891,7 @@ main (int argc, char **argv)
- 	printf ("Outer window is 0x%lx, inner window is 0x%lx\n", w, subw);
-     }
- 
--    if (xim && xim_style) {
-+    /*if (xim && xim_style) {
-         xic = XCreateIC (xim, 
-                          XNInputStyle, xim_style, 
-                          XNClientWindow, w, 
-@@ -901,7 +901,7 @@ main (int argc, char **argv)
-         if (xic == NULL) {
-             fprintf (stderr, "XCreateIC failed\n");
-         }
--    }
-+    }*/
- 
-     for (done = 0; !done; ) {
- 	XEvent event;
diff --git a/recipes/xorg-app/xev_1.0.4.bb b/recipes/xorg-app/xev_1.0.4.bb
deleted file mode 100644
index 6154c8c..0000000
--- a/recipes/xorg-app/xev_1.0.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Event Viewer"
-LICENSE = "MIT"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://diet-x11.patch"
-SRC_URI[archive.md5sum] = "5f98c0a2725a33d60ef4956befe078fb"
-SRC_URI[archive.sha256sum] = "7fad9c9755a624e677f44633dee218e9c22b4ba9a83e6709a6cbf8c1a501fde8"
diff --git a/recipes/xorg-app/xeyes_1.1.0.bb b/recipes/xorg-app/xeyes_1.1.0.bb
deleted file mode 100644
index fc382ba..0000000
--- a/recipes/xorg-app/xeyes_1.1.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxau libxt libxext libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "933f6d2b132d14f707f1f3c87b39ebe2"
-SRC_URI[archive.sha256sum] = "996b9641fea06e2f0dde9cbf5fb31b5cd139376198057a88ca59820fdb94d507"
diff --git a/recipes/xorg-app/xf86dga_1.0.2.bb b/recipes/xorg-app/xf86dga_1.0.2.bb
deleted file mode 100644
index aff21db..0000000
--- a/recipes/xorg-app/xf86dga_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxxf86dga libxt libxaw libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "66feef21fb4e769cc1e2f193ae461a8c"
-SRC_URI[archive.sha256sum] = "650633b83796e5a24d4c5ec30adfeb3958f75d9d0785060d5c42bab55ccc1857"
diff --git a/recipes/xorg-app/xfd_1.0.1.bb b/recipes/xorg-app/xfd_1.0.1.bb
deleted file mode 100644
index dc46464..0000000
--- a/recipes/xorg-app/xfd_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw freetype fontconfig libxft libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c72abd90f50ef459bc14b39ec9fcc7f8"
-SRC_URI[archive.sha256sum] = "111baa16780429d6739ab69b7393a18d75a10b7615dcc8cd0b0878ab9a5e2e1e"
diff --git a/recipes/xorg-app/xfontsel_1.0.2.bb b/recipes/xorg-app/xfontsel_1.0.2.bb
deleted file mode 100644
index aed93b5..0000000
--- a/recipes/xorg-app/xfontsel_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "point and click selection of X11 font names"
-DEPENDS += " libxaw"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "288fe4cf8a990e4e602aac16dd9109fb"
-SRC_URI[archive.sha256sum] = "7a66ba3910bd7e39d58f9d4a4a588f191a874b8607369fe2cc9203a7115006a9"
diff --git a/recipes/xorg-app/xfs_1.1.0.bb b/recipes/xorg-app/xfs_1.1.0.bb
deleted file mode 100644
index efc2c62..0000000
--- a/recipes/xorg-app/xfs_1.1.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X fontserver"
-DEPENDS += " libfs libxfont xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5cfc06a320f74f07a0aa73da62307e9a"
-SRC_URI[archive.sha256sum] = "47bad4bbcd0488a8e573aa6efe3438076c4d27c498d6f642f3aa27262eb95f6d"
diff --git a/recipes/xorg-app/xfsinfo_1.0.2.bb b/recipes/xorg-app/xfsinfo_1.0.2.bb
deleted file mode 100644
index 5ca440c..0000000
--- a/recipes/xorg-app/xfsinfo_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libfs"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e6c0071f6d5436113982f4a575d3f94b"
-SRC_URI[archive.sha256sum] = "95aaca84f948fc7e25d82c58d3fdbba44911b99f3e205378ce82a786c11bb96f"
diff --git a/recipes/xorg-app/xgamma_1.0.3.bb b/recipes/xorg-app/xgamma_1.0.3.bb
deleted file mode 100644
index ebd483c..0000000
--- a/recipes/xorg-app/xgamma_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "Alter a monitor's gamma correction through the X server"
-DEPENDS += " libxxf86vm"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e8a88bf1a18f35b724619849dca97f4f"
-SRC_URI[archive.sha256sum] = "e5eb2588fbbdc5c2db5571b304204487a9c22eed15ac6cb816f605ec403e6e1a"
diff --git a/recipes/xorg-app/xgc_1.0.1.bb b/recipes/xorg-app/xgc_1.0.1.bb
deleted file mode 100644
index 5cd8c1e..0000000
--- a/recipes/xorg-app/xgc_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "72fc8dd68f585000c0a542eba0264571"
-SRC_URI[archive.sha256sum] = "7caddfc6c34f62a4ab2dba2ba34085f6b2343b36ec1bec3b522a2188170e1093"
diff --git a/recipes/xorg-app/xhost_1.0.3.bb b/recipes/xorg-app/xhost_1.0.3.bb
deleted file mode 100644
index a6b3a43..0000000
--- a/recipes/xorg-app/xhost_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "Server access control program for X"
-LICENSE = "MIT"
-DEPENDS += "libxmu libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c7f91b4a750d297f269c2a0a3206a1b2"
-SRC_URI[archive.sha256sum] = "2d63007c65e89fe273a43f3e45b3c0133acbc3ceeda6bfc9671388409134ad17"
diff --git a/recipes/xorg-app/xinit_1.1.1.bb b/recipes/xorg-app/xinit_1.1.1.bb
deleted file mode 100644
index 89b047e..0000000
--- a/recipes/xorg-app/xinit_1.1.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Window System initializer"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "93c73705ed9eb1e1a6b6938405672f2b"
-SRC_URI[archive.sha256sum] = "b103d2cf9e1cd8b049e28bb1109f3da3a14287bbce3ab8b2f427d55a6e5f4785"
-
-FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/xorg-app/xinput_1.5.0.bb b/recipes/xorg-app/xinput_1.5.0.bb
deleted file mode 100644
index 04355de..0000000
--- a/recipes/xorg-app/xinput_1.5.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a utility to configure and test XInput devices"
-DEPENDS += " libxi"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3e8a5f1faccc8ab00c6190e5a34e0a45"
-SRC_URI[archive.sha256sum] = "a84728e34bb5edd36ecc1b5489f48ad1467ad5aab1f74f1b7789f826a1ffcaf9"
diff --git a/recipes/xorg-app/xkbcomp_1.1.1.bb b/recipes/xorg-app/xkbcomp_1.1.1.bb
deleted file mode 100644
index d32be77..0000000
--- a/recipes/xorg-app/xkbcomp_1.1.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "The X Keyboard Extension essentially replaces the core protocol definition of keyboard."
-DEPENDS += " libxkbfile"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "38c387bacdc01038c8ac280588792bcf"
-SRC_URI[archive.sha256sum] = "9775bcfd43d9ffa41e2865e5b2c933f419bf983d7a529b3103656c76fd82e663"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/xkbevd_1.1.0.bb b/recipes/xorg-app/xkbevd_1.1.0.bb
deleted file mode 100644
index 2da02ec..0000000
--- a/recipes/xorg-app/xkbevd_1.1.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxkbfile "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8d3c1485c2dd62ea7395a37377958a39"
-SRC_URI[archive.sha256sum] = "46037add20321ff13954ad91aa5f5f5ec52d78006f9d7c52aa6167622b34a2df"
diff --git a/recipes/xorg-app/xkbprint_1.0.1.bb b/recipes/xorg-app/xkbprint_1.0.1.bb
deleted file mode 100644
index 58a34d2..0000000
--- a/recipes/xorg-app/xkbprint_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxkbfile "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b98ae2d8b21c545b7b322d0b302efefa"
-SRC_URI[archive.sha256sum] = "008dffea5b213880cb3ebd40d0b9bf0cc10392fb0349831efdebf2a428dd2e17"
diff --git a/recipes/xorg-app/xkbutils_1.0.2.bb b/recipes/xorg-app/xkbutils_1.0.2.bb
deleted file mode 100644
index c4bfe76..0000000
--- a/recipes/xorg-app/xkbutils_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxkbfile "
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "369a21641b7ca983d6641298e51d97f8"
-SRC_URI[archive.sha256sum] = "12a37d4594a4deb2642b1659f3827068c24bb8791a20b927c5f3b7fdb0c70bee"
diff --git a/recipes/xorg-app/xkill_1.0.2.bb b/recipes/xorg-app/xkill_1.0.2.bb
deleted file mode 100644
index b221ead..0000000
--- a/recipes/xorg-app/xkill_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "dca031355b4afcf8517a8258eeb730c3"
-SRC_URI[archive.sha256sum] = "532df0398d3f4eab1cba8d0367c02a293ca74f2d89a27ef014854a2bde9a5a27"
diff --git a/recipes/xorg-app/xload_1.0.2.bb b/recipes/xorg-app/xload_1.0.2.bb
deleted file mode 100644
index 5b706c4..0000000
--- a/recipes/xorg-app/xload_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "system load average display for X"
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b41ed6b4bcfc9897366c27a94d2bf150"
-SRC_URI[archive.sha256sum] = "86b176b6efc52557b1c7631bfdd5c17e7060a438e1e85ce15ec9657be356c50b"
diff --git a/recipes/xorg-app/xlogo_1.0.1.bb b/recipes/xorg-app/xlogo_1.0.1.bb
deleted file mode 100644
index 6c05ea1..0000000
--- a/recipes/xorg-app/xlogo_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxprintutil libxp libxrender libxft libxext libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4c5482552f38a7d42398a694cc9b2ee6"
-SRC_URI[archive.sha256sum] = "de59f9be3d45fe93f445f39bec3cea09753a671e56863ce77e3a797d2df526b2"
diff --git a/recipes/xorg-app/xlsatoms_1.0.2.bb b/recipes/xorg-app/xlsatoms_1.0.2.bb
deleted file mode 100644
index 0e1e123..0000000
--- a/recipes/xorg-app/xlsatoms_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "dc8b420bbfa35091ea30edf57c952ec2"
-SRC_URI[archive.sha256sum] = "d66cd7682e5ea2a52e8da8a75ea6154f40a3a69938c6c2cf5d5c1e012f5c121b"
diff --git a/recipes/xorg-app/xlsclients_1.0.2.bb b/recipes/xorg-app/xlsclients_1.0.2.bb
deleted file mode 100644
index 1a531f9..0000000
--- a/recipes/xorg-app/xlsclients_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "df270f7dd5528ae1b7d80c47585d8278"
-SRC_URI[archive.sha256sum] = "8527cdd29d4fcc67df014bc8b371be98901c9082b8de81ea2302bf705c887698"
diff --git a/recipes/xorg-app/xlsfonts_1.0.2.bb b/recipes/xorg-app/xlsfonts_1.0.2.bb
deleted file mode 100644
index 17c9fe3..0000000
--- a/recipes/xorg-app/xlsfonts_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "server font list displayer for X"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "28958248590ff60ecd70e8f590d977b7"
-SRC_URI[archive.sha256sum] = "cc6e519b783b082a2fe4cd06ea5b3693ee6bdb23f4b36e7a72753c524ef5111c"
diff --git a/recipes/xorg-app/xmag_1.0.3.bb b/recipes/xorg-app/xmag_1.0.3.bb
deleted file mode 100644
index 0e1025c..0000000
--- a/recipes/xorg-app/xmag_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "magnify parts of the screen"
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "32f7ed4c089365cadb9382f6fbd750a9"
-SRC_URI[archive.sha256sum] = "0368268a352d302d0b84229a71e3ea0e8d1c44019b1f06b6301ad7a106418553"
diff --git a/recipes/xorg-app/xman_1.1.0.bb b/recipes/xorg-app/xman_1.1.0.bb
deleted file mode 100644
index ff65cf5..0000000
--- a/recipes/xorg-app/xman_1.1.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "manual page browser for X"
-DEPENDS += " libxaw libxprintutil libxp libxt"
-RDEPENDS_${PN} = " man"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5e5b3351bac26cc1f8490faf1c1402bb"
-SRC_URI[archive.sha256sum] = "9d617ed760fe2147baae5ad9cbbdd85f1bb7534acfc3327bb51dad42e8bcc8b0"
-
-FILES_${PN} += " /usr/share/X11/xman.help"
diff --git a/recipes/xorg-app/xmessage_1.0.2.bb b/recipes/xorg-app/xmessage_1.0.2.bb
deleted file mode 100644
index ec9aec3..0000000
--- a/recipes/xorg-app/xmessage_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "xmessage displays a message or query in a window."
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b4b561ef11fd184989a6062962e86748"
-SRC_URI[archive.sha256sum] = "02b4016e93acab94105fa61f6dbe13082669276ab4650b871835fb7884b0c3c3"
diff --git a/recipes/xorg-app/xmh_1.0.1.bb b/recipes/xorg-app/xmh_1.0.1.bb
deleted file mode 100644
index 37fb734..0000000
--- a/recipes/xorg-app/xmh_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "656bcbdd41818a8b5a9f7dba77a3eeba"
-SRC_URI[archive.sha256sum] = "9471fb455ce0bfc582b865722ab7417c587c9fea82342181e9cd0a9629c2c6fa"
diff --git a/recipes/xorg-app/xmodmap_1.0.4.bb b/recipes/xorg-app/xmodmap_1.0.4.bb
deleted file mode 100644
index 762fc42..0000000
--- a/recipes/xorg-app/xmodmap_1.0.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "utility for modifying keymaps and pointer button mappings in X"
-LICENSE = "MIT"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "bbe021f812e0014a8ee3692317788119"
-SRC_URI[archive.sha256sum] = "805a63525d99f59d60a11aa89121fb9cdb001c8d542237ac4deafbadc7bd0bed"
diff --git a/recipes/xorg-app/xmore_1.0.1.bb b/recipes/xorg-app/xmore_1.0.1.bb
deleted file mode 100644
index 90782d1..0000000
--- a/recipes/xorg-app/xmore_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxprintutil libxp libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d36e918dce779a9d207b7a266f4e87c8"
-SRC_URI[archive.sha256sum] = "653566be73c474bc45f1a6631e14b008445c74557a8f6f46effee1ac3e8f2527"
diff --git a/recipes/xorg-app/xprop_1.1.0.bb b/recipes/xorg-app/xprop_1.1.0.bb
deleted file mode 100644
index 48f37c3..0000000
--- a/recipes/xorg-app/xprop_1.1.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a property displayer for X"
-DEPENDS += " libxmu "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f0bacbd30f0dd1c1e9ccafe97687b7a4"
-SRC_URI[archive.sha256sum] = "cc8e07901574895f113baffda19272c54545879e02012314527ebbf2dcc66226"
diff --git a/recipes/xorg-app/xrandr/resolve_symbol_clash.patch b/recipes/xorg-app/xrandr/resolve_symbol_clash.patch
deleted file mode 100644
index 1ecf956..0000000
--- a/recipes/xorg-app/xrandr/resolve_symbol_clash.patch
+++ /dev/null
@@ -1,33 +0,0 @@
----
- xrandr.c |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- xrandr-1.2.2.orig/xrandr.c
-+++ xrandr-1.2.2/xrandr.c
-@@ -189,7 +189,7 @@
- 
- #if HAS_RANDR_1_2
- typedef enum _policy {
--    clone, extend
-+    policy_clone, extend
- } policy_t;
- 
- typedef enum _relation {
-@@ -1602,7 +1602,7 @@
-     int		ret = 0;
- #if HAS_RANDR_1_2
-     output_t	*output = NULL;
--    policy_t	policy = clone;
-+    policy_t	policy = policy_clone;
-     Bool    	setit_1_2 = False;
-     Bool    	query_1_2 = False;
-     Bool	modeit = False;
-@@ -1863,7 +1863,7 @@
- 	    continue;
- 	}
- 	if (!strcmp ("--clone", argv[i])) {
--	    policy = clone;
-+	    policy = policy_clone;
- 	    setit_1_2 = True;
- 	    continue;
- 	}
diff --git a/recipes/xorg-app/xrandr_1.3.2.bb b/recipes/xorg-app/xrandr_1.3.2.bb
deleted file mode 100644
index 34c0168..0000000
--- a/recipes/xorg-app/xrandr_1.3.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Resize and Rotate extension command."
-LICENSE = "BSD-X"
-DEPENDS += "libxrandr libxrender"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://resolve_symbol_clash.patch"
-SRC_URI[archive.md5sum] = "2cb19bb1c19ccf77c40032b03dbe06f0"
-SRC_URI[archive.sha256sum] = "34d4334644a6494573141bb8647feb8f91c0ce8c8d3b6883b4861e038e912249"
diff --git a/recipes/xorg-app/xrdb_1.0.6.bb b/recipes/xorg-app/xrdb_1.0.6.bb
deleted file mode 100644
index a5f90f3..0000000
--- a/recipes/xorg-app/xrdb_1.0.6.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X server resource database utility"
-LICENSE = "xrdb"
-DEPENDS += "libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8dd881cd5a7dcb6e456549817f0fb475"
-SRC_URI[archive.sha256sum] = "8d062a3764665fcf22b14df4a5aca6af1e6d7d613296875b31b68e74ef66fc99"
diff --git a/recipes/xorg-app/xrefresh_1.0.3.bb b/recipes/xorg-app/xrefresh_1.0.3.bb
deleted file mode 100644
index dd4bfab..0000000
--- a/recipes/xorg-app/xrefresh_1.0.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8f4fafcfb77b3c6972cc44bb3f1c899c"
-SRC_URI[archive.sha256sum] = "3ee0a5f7aeb14bbffbcafcff8e7806c9a59f08e1a58322a50f5fca023a7d7ed9"
diff --git a/recipes/xorg-app/xrx_1.0.3.bb b/recipes/xorg-app/xrx_1.0.3.bb
deleted file mode 100644
index a412479..0000000
--- a/recipes/xorg-app/xrx_1.0.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt libxext xtrans xproxymngproto libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c121945afcfc84e99af17158fda68be9"
-SRC_URI[archive.sha256sum] = "9cb0fc67153ce935550d61dfd3d021cb3e6833274453538885b7cddff9fe8abe"
diff --git a/recipes/xorg-app/xset-1.1.0/disable-xkb.patch b/recipes/xorg-app/xset-1.1.0/disable-xkb.patch
deleted file mode 100644
index 6060fbb..0000000
--- a/recipes/xorg-app/xset-1.1.0/disable-xkb.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- xset-1.0.1/configure.ac.orig	2006-03-08 19:46:59.000000000 +0100
-+++ xset-1.0.1/configure.ac	2006-03-08 19:47:40.000000000 +0100
-@@ -42,11 +42,15 @@
- 	AC_CHECK_HEADERS([X11/extensions/dpms.h X11/extensions/MITMisc.h],,,[#include <X11/Xlib.h>])
- 	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
- 
-+AC_ARG_ENABLE(xkb, AC_HELP_STRING([--disable-xkb], [Disable XKB support]),
-+        XKB="$enableval", XKB="yes")
-+if test "x$XKB" = "xyes" ; then
- PKG_CHECK_MODULES(SET_XKB, x11, 
- 	[SAVE_CPPFLAGS="$CPPFLAGS"
- 	CPPFLAGS="$CPPFLAGS $SET_XKB_CFLAGS $SET_X11_CFLAGS"
- 	AC_CHECK_HEADERS([X11/XKBlib.h],,,[#include <X11/Xlib.h>])
- 	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
-+fi
- 
- PKG_CHECK_MODULES(SET_XF86MISC, xxf86misc, 
- 	[SAVE_CPPFLAGS="$CPPFLAGS"
diff --git a/recipes/xorg-app/xset_1.1.0.bb b/recipes/xorg-app/xset_1.1.0.bb
deleted file mode 100644
index 8592ad2..0000000
--- a/recipes/xorg-app/xset_1.1.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "user preference utility for X"
-LICENSE = "MIT"
-DEPENDS += "libxext libxxf86misc libxfontcache libxmu libxp libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://disable-xkb.patch"
-SRC_URI[archive.md5sum] = "eeb0d02f69c76bd40470dede99b4bd49"
-SRC_URI[archive.sha256sum] = "72c859c6030890a25cf828d0b2743454e50eadab30f6be8c17172fe97a554643"
-
-EXTRA_OECONF = "--disable-xkb"
-
-CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/xorg-app/xsetroot_1.0.3.bb b/recipes/xorg-app/xsetroot_1.0.3.bb
deleted file mode 100644
index 08a0e68..0000000
--- a/recipes/xorg-app/xsetroot_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "Sets the visual appearance of the X root window"
-LICENSE = "MIT"
-DEPENDS += "libxmu xbitmaps"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "cbda9b9b8da5af4614110883d5a276b8"
-SRC_URI[archive.sha256sum] = "d7e512cc686de3ab5fcd3c9f9e605d7cae68a4b50f2c0786f0f09ce08c728f48"
diff --git a/recipes/xorg-app/xsm_1.0.1.bb b/recipes/xorg-app/xsm_1.0.1.bb
deleted file mode 100644
index b0ee345..0000000
--- a/recipes/xorg-app/xsm_1.0.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Session Manager"
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "cce867ff7d0df9c0b9e682591779952c"
-SRC_URI[archive.sha256sum] = "2f2535b5394d59be0a4bb15c12ea1b19b873a0096446ecc4c71aa81f0d99b29a"
diff --git a/recipes/xorg-app/xstdcmap_1.0.1.bb b/recipes/xorg-app/xstdcmap_1.0.1.bb
deleted file mode 100644
index 748b079..0000000
--- a/recipes/xorg-app/xstdcmap_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "86ab558441edfb86f853639e4290a754"
-SRC_URI[archive.sha256sum] = "0d920660137dee514599f63b5a8c8ce14d2474607e28e32c973cafb360f7e738"
diff --git a/recipes/xorg-app/xterm_207.bb b/recipes/xorg-app/xterm_207.bb
deleted file mode 100644
index ac485a7..0000000
--- a/recipes/xorg-app/xterm_207.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
-DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
-PR = "${INC_PR}.1"
-
-SRC_URI = "${XORG_MIRROR}/development/X11R7.0-RC4/extras/${PN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "3de8a3756c284a46a08c6d0308909486"
-SRC_URI[sha256sum] = "652f579171e6e8f73c13ab6b060d2447ae35ebfbd39a6002b7c05a1dfc0f7eb8"
-
-EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
-                 --x-libraries=${STAGING_LIBDIR} \
-                 FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
-                 --disable-imake \
-                 --disable-setuid"
-
-do_configure() {
-        sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
-        oe_runconf
-}
-
-FILES_${PN} += " /usr/lib/X11"
diff --git a/recipes/xorg-app/xterm_251.bb b/recipes/xorg-app/xterm_251.bb
deleted file mode 100644
index 388fbc3..0000000
--- a/recipes/xorg-app/xterm_251.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
-DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
-PR = "${INC_PR}.1"
-
-SRC_URI = "ftp://invisible-island.net/xterm/${PN}-${PV}.tgz"
-SRC_URI[md5sum] = "343a4ce213f70c53cf65979f163bebc3"
-SRC_URI[sha256sum] = "2ff9a4ae66cf9a48829023d1d007b0e84ee9cc60feb48107f9c1ea9dd7570ce7"
-
-EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
-                 --x-libraries=${STAGING_LIBDIR} \
-                 FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
-                 --disable-imake \
-                 --disable-setuid"
-
-do_configure() {
-        sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
-        oe_runconf
-}
-
-FILES_${PN} += " /usr/lib/X11"
diff --git a/recipes/xorg-app/xvidtune_1.0.1.bb b/recipes/xorg-app/xvidtune_1.0.1.bb
deleted file mode 100644
index e052500..0000000
--- a/recipes/xorg-app/xvidtune_1.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxxf86vm libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e0744594f4e5969b20df28d897781318"
-SRC_URI[archive.sha256sum] = "6d0feb42c2f1d6011d97c776b9d580fd589cdf3cfe246cd99437c406a2740d36"
-
-FILES_${PN} += " ${datadir}/X11/app-defaults/Xvidtune "
diff --git a/recipes/xorg-app/xvinfo_1.1.0.bb b/recipes/xorg-app/xvinfo_1.1.0.bb
deleted file mode 100644
index 37c66de..0000000
--- a/recipes/xorg-app/xvinfo_1.1.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "Print out X-Video extension adaptor information"
-DEPENDS += " libxv"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8cc299b2cb636b5f7fe672610789d3d4"
-SRC_URI[archive.sha256sum] = "0a318f6ca0d92bd5cc2ab9d2690f6120b3e1537b7902ce110469864869e86efb"
diff --git a/recipes/xorg-app/xwd_1.0.3.bb b/recipes/xorg-app/xwd_1.0.3.bb
deleted file mode 100644
index fe84b4d..0000000
--- a/recipes/xorg-app/xwd_1.0.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "007cea1f389abde5c93162dcd5541351"
-SRC_URI[archive.sha256sum] = "fff2dbea086c554463d4309209ee05e026b7f19900598f55e0a24a6d7a7ee3fd"
diff --git a/recipes/xorg-app/xwininfo_1.0.5.bb b/recipes/xorg-app/xwininfo_1.0.5.bb
deleted file mode 100644
index 348e4af..0000000
--- a/recipes/xorg-app/xwininfo_1.0.5.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu libxext "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "908f8bc3255f639effa9780fb1c19ea4"
-SRC_URI[archive.sha256sum] = "8db6b81a7b0bc4e7acce6c6d41df9747b0b19e12c21c5a70b51bbc63a42cdcd9"
diff --git a/recipes/xorg-app/xwud_1.0.2.bb b/recipes/xorg-app/xwud_1.0.2.bb
deleted file mode 100644
index de77cf2..0000000
--- a/recipes/xorg-app/xwud_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "20bc5d85634964d4ceee77cdfcd131ed"
-SRC_URI[archive.sha256sum] = "84345dfbff0dc411689639aada2407758640af71eb61a1be332bfa24d8b90ac1"
-- 
1.7.4.rc1




Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol1dt-00067K-CE
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 17:30:36 +0200
Received: by mail-fx0-f47.google.com with SMTP id 6so3100953fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 08:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=fJxHJWRXEbkHhPbfI1wpAdciI7br90MCCBGqZIWU/Ck=;
	b=TO29MbIntrlmgqh8AUL/XyfykJ+ylhYyQU/WxbZ/AWcYwJX7BB23B3Vp/QNeV/HiKW
	fu3KTAZDU+YIPk9s+Tuiv6YhJ+Dlw3gCgyLpuzjiXlw4jXNaLvjqRj0W2Yewpg36C6mK
	AFQv2lqYNYt3iFhvFlBaxYepMKiVNfSqcwx/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=q3SzRVyI0EtGEdwq6XiZpOZAqRTj/wYcMFISuL9XOv5DkQFwryo54HADbsjwe7Jp6Y
	idVnsbBY4/fTCKIWIpfK7AdPW/0B8PUeSiLc9FwJLmGGzy/enXO8NHKP2c21ZVnxxM68
	N4y2CeJErki9EwscoSN5tqDbuUkFI6M5eeq0c=
Received: by 10.223.118.11 with SMTP id t11mr5329553faq.51.1281972614488;
	Mon, 16 Aug 2010 08:30:14 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k25sm2499626fac.41.2010.08.16.08.30.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 08:30:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:30:12 +0200
Message-Id: <1281972620-7317-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/9] xorg-app: move older not pinned versions to obsolete dir
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
X-List-Received-Date: Mon, 16 Aug 2010 15:30:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg/xorg-app/appres_1.0.1.bb     |    8 +
 recipes/obsolete/xorg/xorg-app/bdftopcf_1.0.1.bb   |   10 ++
 .../obsolete/xorg/xorg-app/beforelight_1.0.2.bb    |    7 +
 recipes/obsolete/xorg/xorg-app/bitmap_1.0.2.bb     |    7 +
 recipes/obsolete/xorg/xorg-app/bitmap_1.0.3.bb     |    7 +
 recipes/obsolete/xorg/xorg-app/constype_1.0.1.bb   |    8 +
 recipes/obsolete/xorg/xorg-app/editres_1.0.2.bb    |    7 +
 recipes/obsolete/xorg/xorg-app/editres_1.0.3.bb    |    7 +
 recipes/obsolete/xorg/xorg-app/fonttosfnt_1.0.3.bb |    7 +
 recipes/obsolete/xorg/xorg-app/fslsfonts_1.0.1.bb  |    7 +
 recipes/obsolete/xorg/xorg-app/fstobdf_1.0.2.bb    |    7 +
 recipes/obsolete/xorg/xorg-app/iceauth_1.0.2.bb    |    8 +
 recipes/obsolete/xorg/xorg-app/lbxproxy_1.0.1.bb   |    9 +
 recipes/obsolete/xorg/xorg-app/luit_1.0.2.bb       |    7 +
 recipes/obsolete/xorg/xorg-app/luit_1.0.3.bb       |    8 +
 .../obsolete/xorg/xorg-app/mkcomposecache_1.2.bb   |    6 +
 recipes/obsolete/xorg/xorg-app/mkfontdir_1.0.3.bb  |   10 ++
 recipes/obsolete/xorg/xorg-app/mkfontdir_1.0.4.bb  |   10 ++
 .../obsolete/xorg/xorg-app/mkfontscale_1.0.3.bb    |    9 +
 .../obsolete/xorg/xorg-app/mkfontscale_1.0.4.bb    |    9 +
 .../obsolete/xorg/xorg-app/mkfontscale_1.0.5.bb    |    9 +
 recipes/obsolete/xorg/xorg-app/rgb_1.0.1.bb        |    9 +
 recipes/obsolete/xorg/xorg-app/rstart_1.0.2.bb     |    6 +
 recipes/obsolete/xorg/xorg-app/sessreg_1.0.2.bb    |    6 +
 recipes/obsolete/xorg/xorg-app/sessreg_1.0.3.bb    |    6 +
 recipes/obsolete/xorg/xorg-app/sessreg_1.0.4.bb    |    7 +
 recipes/obsolete/xorg/xorg-app/setxkbmap_1.0.3.bb  |    7 +
 recipes/obsolete/xorg/xorg-app/setxkbmap_1.0.4.bb  |    7 +
 recipes/obsolete/xorg/xorg-app/showfont_1.0.1.bb   |    7 +
 recipes/obsolete/xorg/xorg-app/smproxy_1.0.2.bb    |    7 +
 recipes/obsolete/xorg/xorg-app/twm_1.0.3.bb        |   13 ++
 recipes/obsolete/xorg/xorg-app/x11perf_1.4.1.bb    |    8 +
 recipes/obsolete/xorg/xorg-app/x11perf_1.5.bb      |   10 ++
 recipes/obsolete/xorg/xorg-app/xauth_1.0.2.bb      |    8 +
 recipes/obsolete/xorg/xorg-app/xauth_1.0.3.bb      |    8 +
 recipes/obsolete/xorg/xorg-app/xbacklight_1.1.bb   |    8 +
 recipes/obsolete/xorg/xorg-app/xcalc_1.0.1.bb      |    7 +
 recipes/obsolete/xorg/xorg-app/xclipboard_1.0.1.bb |    7 +
 recipes/obsolete/xorg/xorg-app/xclock_1.0.2.bb     |    7 +
 recipes/obsolete/xorg/xorg-app/xclock_1.0.3.bb     |    8 +
 recipes/obsolete/xorg/xorg-app/xcmsdb_1.0.1.bb     |    6 +
 recipes/obsolete/xorg/xorg-app/xconsole_1.0.2.bb   |    7 +
 recipes/obsolete/xorg/xorg-app/xcursorgen_1.0.1.bb |    9 +
 recipes/obsolete/xorg/xorg-app/xcursorgen_1.0.2.bb |   10 ++
 recipes/obsolete/xorg/xorg-app/xdm_1.1.3.bb        |   10 ++
 recipes/obsolete/xorg/xorg-app/xdm_1.1.4.bb        |   10 ++
 recipes/obsolete/xorg/xorg-app/xdm_1.1.6.bb        |   12 ++
 recipes/obsolete/xorg/xorg-app/xdm_1.1.7.bb        |   12 ++
 recipes/obsolete/xorg/xorg-app/xdm_1.1.8.bb        |   12 ++
 recipes/obsolete/xorg/xorg-app/xdpyinfo_1.0.2.bb   |   12 ++
 recipes/obsolete/xorg/xorg-app/xdpyinfo_1.0.3.bb   |   12 ++
 recipes/obsolete/xorg/xorg-app/xdriinfo_1.0.1.bb   |    7 +
 recipes/obsolete/xorg/xorg-app/xdriinfo_1.0.2.bb   |    8 +
 recipes/obsolete/xorg/xorg-app/xedit_1.0.2.bb      |    7 +
 recipes/obsolete/xorg/xorg-app/xev_1.0.2.bb        |    9 +
 recipes/obsolete/xorg/xorg-app/xev_1.0.3.bb        |    9 +
 recipes/obsolete/xorg/xorg-app/xeyes_1.0.1.bb      |    7 +
 recipes/obsolete/xorg/xorg-app/xfs_1.0.4.bb        |    8 +
 recipes/obsolete/xorg/xorg-app/xfs_1.0.5.bb        |    8 +
 recipes/obsolete/xorg/xorg-app/xfs_1.0.6.bb        |    8 +
 recipes/obsolete/xorg/xorg-app/xfs_1.0.8.bb        |    8 +
 recipes/obsolete/xorg/xorg-app/xfsinfo_1.0.1.bb    |    7 +
 recipes/obsolete/xorg/xorg-app/xgamma_1.0.1.bb     |    7 +
 recipes/obsolete/xorg/xorg-app/xgamma_1.0.2.bb     |    8 +
 recipes/obsolete/xorg/xorg-app/xhost_1.0.2.bb      |    9 +
 recipes/obsolete/xorg/xorg-app/xinit_1.0.3.bb      |    8 +
 recipes/obsolete/xorg/xorg-app/xinit_1.0.4.bb      |    9 +
 recipes/obsolete/xorg/xorg-app/xinit_1.0.5.bb      |    9 +
 recipes/obsolete/xorg/xorg-app/xinit_1.0.7.bb      |    9 +
 recipes/obsolete/xorg/xorg-app/xinit_1.0.8.bb      |    9 +
 recipes/obsolete/xorg/xorg-app/xinit_1.0.9.bb      |    9 +
 recipes/obsolete/xorg/xorg-app/xinit_1.1.0.bb      |    9 +
 recipes/obsolete/xorg/xorg-app/xinit_1.2.0.bb      |   10 ++
 recipes/obsolete/xorg/xorg-app/xinput_1.3.0.bb     |    7 +
 recipes/obsolete/xorg/xorg-app/xinput_1.4.2.bb     |    7 +
 recipes/obsolete/xorg/xorg-app/xinput_1.5.1.bb     |    7 +
 recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.3.bb    |    9 +
 recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.4.bb    |    9 +
 recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.5.bb    |    9 +
 recipes/obsolete/xorg/xorg-app/xkbevd_1.0.2.bb     |    7 +
 recipes/obsolete/xorg/xorg-app/xkbutils_1.0.1.bb   |    6 +
 recipes/obsolete/xorg/xorg-app/xkill_1.0.1.bb      |    7 +
 recipes/obsolete/xorg/xorg-app/xload_1.0.1.bb      |    7 +
 recipes/obsolete/xorg/xorg-app/xlsatoms_1.0.1.bb   |    7 +
 recipes/obsolete/xorg/xorg-app/xlsclients_1.0.1.bb |    7 +
 recipes/obsolete/xorg/xorg-app/xlsfonts_1.0.1.bb   |    5 +
 recipes/obsolete/xorg/xorg-app/xmag_1.0.1.bb       |    7 +
 recipes/obsolete/xorg/xorg-app/xmag_1.0.2.bb       |    8 +
 recipes/obsolete/xorg/xorg-app/xman_1.0.2.bb       |   10 ++
 recipes/obsolete/xorg/xorg-app/xman_1.0.3.bb       |   11 ++
 recipes/obsolete/xorg/xorg-app/xmessage_1.0.1.bb   |    8 +
 .../obsolete/xorg/xorg-app/xmodmap/autofoo.patch   |  109 ++++++++++++++
 recipes/obsolete/xorg/xorg-app/xmodmap_1.0.2.bb    |    8 +
 recipes/obsolete/xorg/xorg-app/xmodmap_1.0.3.bb    |    8 +
 recipes/obsolete/xorg/xorg-app/xpr_1.0.1.bb        |    7 +
 recipes/obsolete/xorg/xorg-app/xpr_1.0.2.bb        |    8 +
 recipes/obsolete/xorg/xorg-app/xprop/autofoo.patch |  157 ++++++++++++++++++++
 recipes/obsolete/xorg/xorg-app/xprop_1.0.2.bb      |    7 +
 recipes/obsolete/xorg/xorg-app/xprop_1.0.4.bb      |    8 +
 recipes/obsolete/xorg/xorg-app/xrandr_1.2.2.bb     |   10 ++
 recipes/obsolete/xorg/xorg-app/xrandr_1.2.3.bb     |   10 ++
 recipes/obsolete/xorg/xorg-app/xrdb/autofoo.patch  |  132 ++++++++++++++++
 recipes/obsolete/xorg/xorg-app/xrdb_1.0.3.bb       |    9 +
 recipes/obsolete/xorg/xorg-app/xrdb_1.0.4.bb       |    9 +
 recipes/obsolete/xorg/xorg-app/xrdb_1.0.5.bb       |    9 +
 recipes/obsolete/xorg/xorg-app/xrefresh_1.0.2.bb   |    6 +
 recipes/obsolete/xorg/xorg-app/xrx_1.0.1.bb        |    7 +
 recipes/obsolete/xorg/xorg-app/xset/autofoo.patch  |  109 ++++++++++++++
 .../obsolete/xorg/xorg-app/xset/disable-xkb.patch  |   18 +++
 recipes/obsolete/xorg/xorg-app/xset_1.0.2.bb       |   14 ++
 recipes/obsolete/xorg/xorg-app/xset_1.0.3.bb       |   14 ++
 recipes/obsolete/xorg/xorg-app/xset_1.0.4.bb       |   14 ++
 .../obsolete/xorg/xorg-app/xsetpointer_1.0.0.bb    |    7 +
 recipes/obsolete/xorg/xorg-app/xsetroot_1.0.1.bb   |    9 +
 recipes/obsolete/xorg/xorg-app/xsetroot_1.0.2.bb   |    9 +
 recipes/obsolete/xorg/xorg-app/xvinfo_1.0.1.bb     |    8 +
 recipes/obsolete/xorg/xorg-app/xvinfo_1.0.2.bb     |    8 +
 recipes/obsolete/xorg/xorg-app/xwd_1.0.1.bb        |    7 +
 recipes/obsolete/xorg/xorg-app/xwd_1.0.2.bb        |    7 +
 recipes/obsolete/xorg/xorg-app/xwininfo_1.0.2.bb   |    7 +
 recipes/obsolete/xorg/xorg-app/xwininfo_1.0.3.bb   |    8 +
 recipes/obsolete/xorg/xorg-app/xwininfo_1.0.4.bb   |    7 +
 recipes/obsolete/xorg/xorg-app/xwud_1.0.1.bb       |    6 +
 recipes/xorg-app/appres_1.0.1.bb                   |    8 -
 recipes/xorg-app/bdftopcf_1.0.1.bb                 |   10 --
 recipes/xorg-app/beforelight_1.0.2.bb              |    7 -
 recipes/xorg-app/bitmap_1.0.2.bb                   |    7 -
 recipes/xorg-app/bitmap_1.0.3.bb                   |    7 -
 recipes/xorg-app/constype_1.0.1.bb                 |    8 -
 recipes/xorg-app/editres_1.0.2.bb                  |    7 -
 recipes/xorg-app/editres_1.0.3.bb                  |    7 -
 recipes/xorg-app/fonttosfnt_1.0.3.bb               |    7 -
 recipes/xorg-app/fslsfonts_1.0.1.bb                |    7 -
 recipes/xorg-app/fstobdf_1.0.2.bb                  |    7 -
 recipes/xorg-app/iceauth_1.0.2.bb                  |    8 -
 recipes/xorg-app/lbxproxy_1.0.1.bb                 |    9 -
 recipes/xorg-app/luit_1.0.2.bb                     |    7 -
 recipes/xorg-app/luit_1.0.3.bb                     |    8 -
 recipes/xorg-app/mkcomposecache_1.2.bb             |    6 -
 recipes/xorg-app/mkfontdir_1.0.3.bb                |   10 --
 recipes/xorg-app/mkfontdir_1.0.4.bb                |   10 --
 recipes/xorg-app/mkfontscale_1.0.3.bb              |    9 -
 recipes/xorg-app/mkfontscale_1.0.4.bb              |    9 -
 recipes/xorg-app/mkfontscale_1.0.5.bb              |    9 -
 recipes/xorg-app/rgb_1.0.1.bb                      |    9 -
 recipes/xorg-app/rstart_1.0.2.bb                   |    6 -
 recipes/xorg-app/sessreg_1.0.2.bb                  |    6 -
 recipes/xorg-app/sessreg_1.0.3.bb                  |    6 -
 recipes/xorg-app/sessreg_1.0.4.bb                  |    7 -
 recipes/xorg-app/setxkbmap_1.0.3.bb                |    7 -
 recipes/xorg-app/setxkbmap_1.0.4.bb                |    7 -
 recipes/xorg-app/showfont_1.0.1.bb                 |    7 -
 recipes/xorg-app/smproxy_1.0.2.bb                  |    7 -
 recipes/xorg-app/twm_1.0.3.bb                      |   13 --
 recipes/xorg-app/x11perf_1.4.1.bb                  |    8 -
 recipes/xorg-app/x11perf_1.5.bb                    |   10 --
 recipes/xorg-app/xauth_1.0.2.bb                    |    8 -
 recipes/xorg-app/xauth_1.0.3.bb                    |    8 -
 recipes/xorg-app/xbacklight_1.1.bb                 |    8 -
 recipes/xorg-app/xcalc_1.0.1.bb                    |    7 -
 recipes/xorg-app/xclipboard_1.0.1.bb               |    7 -
 recipes/xorg-app/xclock_1.0.2.bb                   |    7 -
 recipes/xorg-app/xclock_1.0.3.bb                   |    8 -
 recipes/xorg-app/xcmsdb_1.0.1.bb                   |    6 -
 recipes/xorg-app/xconsole_1.0.2.bb                 |    7 -
 recipes/xorg-app/xcursorgen_1.0.1.bb               |    9 -
 recipes/xorg-app/xcursorgen_1.0.2.bb               |   10 --
 recipes/xorg-app/xdm_1.1.3.bb                      |   10 --
 recipes/xorg-app/xdm_1.1.4.bb                      |   10 --
 recipes/xorg-app/xdm_1.1.6.bb                      |   12 --
 recipes/xorg-app/xdm_1.1.7.bb                      |   12 --
 recipes/xorg-app/xdm_1.1.8.bb                      |   12 --
 recipes/xorg-app/xdpyinfo_1.0.2.bb                 |   12 --
 recipes/xorg-app/xdpyinfo_1.0.3.bb                 |   12 --
 recipes/xorg-app/xdriinfo_1.0.1.bb                 |    7 -
 recipes/xorg-app/xdriinfo_1.0.2.bb                 |    8 -
 recipes/xorg-app/xedit_1.0.2.bb                    |    7 -
 recipes/xorg-app/xev_1.0.2.bb                      |    9 -
 recipes/xorg-app/xev_1.0.3.bb                      |    9 -
 recipes/xorg-app/xeyes_1.0.1.bb                    |    7 -
 recipes/xorg-app/xfs_1.0.4.bb                      |    8 -
 recipes/xorg-app/xfs_1.0.5.bb                      |    8 -
 recipes/xorg-app/xfs_1.0.6.bb                      |    8 -
 recipes/xorg-app/xfs_1.0.8.bb                      |    8 -
 recipes/xorg-app/xfsinfo_1.0.1.bb                  |    7 -
 recipes/xorg-app/xgamma_1.0.1.bb                   |    7 -
 recipes/xorg-app/xgamma_1.0.2.bb                   |    8 -
 recipes/xorg-app/xhost_1.0.2.bb                    |    9 -
 recipes/xorg-app/xinit_1.0.3.bb                    |    8 -
 recipes/xorg-app/xinit_1.0.4.bb                    |    9 -
 recipes/xorg-app/xinit_1.0.5.bb                    |    9 -
 recipes/xorg-app/xinit_1.0.7.bb                    |    9 -
 recipes/xorg-app/xinit_1.0.8.bb                    |    9 -
 recipes/xorg-app/xinit_1.0.9.bb                    |    9 -
 recipes/xorg-app/xinit_1.1.0.bb                    |    9 -
 recipes/xorg-app/xinit_1.2.0.bb                    |   10 --
 recipes/xorg-app/xinput_1.3.0.bb                   |    7 -
 recipes/xorg-app/xinput_1.4.2.bb                   |    7 -
 recipes/xorg-app/xinput_1.5.1.bb                   |    7 -
 recipes/xorg-app/xkbcomp_1.0.3.bb                  |    9 -
 recipes/xorg-app/xkbcomp_1.0.4.bb                  |    9 -
 recipes/xorg-app/xkbcomp_1.0.5.bb                  |    9 -
 recipes/xorg-app/xkbevd_1.0.2.bb                   |    7 -
 recipes/xorg-app/xkbutils_1.0.1.bb                 |    6 -
 recipes/xorg-app/xkill_1.0.1.bb                    |    7 -
 recipes/xorg-app/xload_1.0.1.bb                    |    7 -
 recipes/xorg-app/xlsatoms_1.0.1.bb                 |    7 -
 recipes/xorg-app/xlsclients_1.0.1.bb               |    7 -
 recipes/xorg-app/xlsfonts_1.0.1.bb                 |    5 -
 recipes/xorg-app/xmag_1.0.1.bb                     |    7 -
 recipes/xorg-app/xmag_1.0.2.bb                     |    8 -
 recipes/xorg-app/xman_1.0.2.bb                     |   10 --
 recipes/xorg-app/xman_1.0.3.bb                     |   11 --
 recipes/xorg-app/xmessage_1.0.1.bb                 |    8 -
 recipes/xorg-app/xmodmap/autofoo.patch             |  109 --------------
 recipes/xorg-app/xmodmap_1.0.2.bb                  |    8 -
 recipes/xorg-app/xmodmap_1.0.3.bb                  |    8 -
 recipes/xorg-app/xpr_1.0.1.bb                      |    7 -
 recipes/xorg-app/xpr_1.0.2.bb                      |    8 -
 recipes/xorg-app/xprop/autofoo.patch               |  157 --------------------
 recipes/xorg-app/xprop_1.0.2.bb                    |    7 -
 recipes/xorg-app/xprop_1.0.4.bb                    |    8 -
 recipes/xorg-app/xrandr_1.2.2.bb                   |   10 --
 recipes/xorg-app/xrandr_1.2.3.bb                   |   10 --
 recipes/xorg-app/xrdb/autofoo.patch                |  132 ----------------
 recipes/xorg-app/xrdb_1.0.3.bb                     |    9 -
 recipes/xorg-app/xrdb_1.0.4.bb                     |    9 -
 recipes/xorg-app/xrdb_1.0.5.bb                     |    9 -
 recipes/xorg-app/xrefresh_1.0.2.bb                 |    6 -
 recipes/xorg-app/xrx_1.0.1.bb                      |    7 -
 recipes/xorg-app/xset/autofoo.patch                |  109 --------------
 recipes/xorg-app/xset/disable-xkb.patch            |   18 ---
 recipes/xorg-app/xset_1.0.2.bb                     |   14 --
 recipes/xorg-app/xset_1.0.3.bb                     |   14 --
 recipes/xorg-app/xset_1.0.4.bb                     |   14 --
 recipes/xorg-app/xsetpointer_1.0.0.bb              |    7 -
 recipes/xorg-app/xsetroot_1.0.1.bb                 |    9 -
 recipes/xorg-app/xsetroot_1.0.2.bb                 |    9 -
 recipes/xorg-app/xvinfo_1.0.1.bb                   |    8 -
 recipes/xorg-app/xvinfo_1.0.2.bb                   |    8 -
 recipes/xorg-app/xwd_1.0.1.bb                      |    7 -
 recipes/xorg-app/xwd_1.0.2.bb                      |    7 -
 recipes/xorg-app/xwininfo_1.0.2.bb                 |    7 -
 recipes/xorg-app/xwininfo_1.0.3.bb                 |    8 -
 recipes/xorg-app/xwininfo_1.0.4.bb                 |    7 -
 recipes/xorg-app/xwud_1.0.1.bb                     |    6 -
 246 files changed, 1501 insertions(+), 1501 deletions(-)
 create mode 100644 recipes/obsolete/xorg/xorg-app/appres_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/bdftopcf_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/beforelight_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/bitmap_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/bitmap_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/constype_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/editres_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/editres_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/fonttosfnt_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/fslsfonts_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/fstobdf_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/iceauth_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/lbxproxy_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/luit_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/luit_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/mkcomposecache_1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/mkfontdir_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/mkfontdir_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/rgb_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/rstart_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/sessreg_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/sessreg_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/sessreg_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/setxkbmap_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/setxkbmap_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/showfont_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/smproxy_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/twm_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/x11perf_1.4.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/x11perf_1.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xauth_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xauth_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xbacklight_1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xcalc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xclipboard_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xclock_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xclock_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xcmsdb_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xconsole_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xcursorgen_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xcursorgen_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xdm_1.1.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xdm_1.1.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xdm_1.1.6.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xdm_1.1.7.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xdm_1.1.8.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xdpyinfo_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xdpyinfo_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xdriinfo_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xdriinfo_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xedit_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xev_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xev_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xeyes_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xfs_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xfs_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xfs_1.0.6.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xfs_1.0.8.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xfsinfo_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xgamma_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xgamma_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xhost_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xinit_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xinit_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xinit_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xinit_1.0.7.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xinit_1.0.8.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xinit_1.0.9.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xinit_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xinit_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xinput_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xinput_1.4.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xinput_1.5.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xkbevd_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xkbutils_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xkill_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xload_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xlsatoms_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xlsclients_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xlsfonts_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xmag_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xmag_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xman_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xman_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xmessage_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xmodmap/autofoo.patch
 create mode 100644 recipes/obsolete/xorg/xorg-app/xmodmap_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xmodmap_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xpr_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xpr_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xprop/autofoo.patch
 create mode 100644 recipes/obsolete/xorg/xorg-app/xprop_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xprop_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xrandr_1.2.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xrandr_1.2.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xrdb/autofoo.patch
 create mode 100644 recipes/obsolete/xorg/xorg-app/xrdb_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xrdb_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xrdb_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xrefresh_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xrx_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xset/autofoo.patch
 create mode 100644 recipes/obsolete/xorg/xorg-app/xset/disable-xkb.patch
 create mode 100644 recipes/obsolete/xorg/xorg-app/xset_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xset_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xset_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xsetpointer_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xsetroot_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xsetroot_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xvinfo_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xvinfo_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xwd_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xwd_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xwininfo_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xwininfo_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xwininfo_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-app/xwud_1.0.1.bb
 delete mode 100644 recipes/xorg-app/appres_1.0.1.bb
 delete mode 100644 recipes/xorg-app/bdftopcf_1.0.1.bb
 delete mode 100644 recipes/xorg-app/beforelight_1.0.2.bb
 delete mode 100644 recipes/xorg-app/bitmap_1.0.2.bb
 delete mode 100644 recipes/xorg-app/bitmap_1.0.3.bb
 delete mode 100644 recipes/xorg-app/constype_1.0.1.bb
 delete mode 100644 recipes/xorg-app/editres_1.0.2.bb
 delete mode 100644 recipes/xorg-app/editres_1.0.3.bb
 delete mode 100644 recipes/xorg-app/fonttosfnt_1.0.3.bb
 delete mode 100644 recipes/xorg-app/fslsfonts_1.0.1.bb
 delete mode 100644 recipes/xorg-app/fstobdf_1.0.2.bb
 delete mode 100644 recipes/xorg-app/iceauth_1.0.2.bb
 delete mode 100644 recipes/xorg-app/lbxproxy_1.0.1.bb
 delete mode 100644 recipes/xorg-app/luit_1.0.2.bb
 delete mode 100644 recipes/xorg-app/luit_1.0.3.bb
 delete mode 100644 recipes/xorg-app/mkcomposecache_1.2.bb
 delete mode 100644 recipes/xorg-app/mkfontdir_1.0.3.bb
 delete mode 100644 recipes/xorg-app/mkfontdir_1.0.4.bb
 delete mode 100644 recipes/xorg-app/mkfontscale_1.0.3.bb
 delete mode 100644 recipes/xorg-app/mkfontscale_1.0.4.bb
 delete mode 100644 recipes/xorg-app/mkfontscale_1.0.5.bb
 delete mode 100644 recipes/xorg-app/rgb_1.0.1.bb
 delete mode 100644 recipes/xorg-app/rstart_1.0.2.bb
 delete mode 100644 recipes/xorg-app/sessreg_1.0.2.bb
 delete mode 100644 recipes/xorg-app/sessreg_1.0.3.bb
 delete mode 100644 recipes/xorg-app/sessreg_1.0.4.bb
 delete mode 100644 recipes/xorg-app/setxkbmap_1.0.3.bb
 delete mode 100644 recipes/xorg-app/setxkbmap_1.0.4.bb
 delete mode 100644 recipes/xorg-app/showfont_1.0.1.bb
 delete mode 100644 recipes/xorg-app/smproxy_1.0.2.bb
 delete mode 100644 recipes/xorg-app/twm_1.0.3.bb
 delete mode 100644 recipes/xorg-app/x11perf_1.4.1.bb
 delete mode 100644 recipes/xorg-app/x11perf_1.5.bb
 delete mode 100644 recipes/xorg-app/xauth_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xauth_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xbacklight_1.1.bb
 delete mode 100644 recipes/xorg-app/xcalc_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xclipboard_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xclock_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xclock_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xcmsdb_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xconsole_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xcursorgen_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xcursorgen_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xdm_1.1.3.bb
 delete mode 100644 recipes/xorg-app/xdm_1.1.4.bb
 delete mode 100644 recipes/xorg-app/xdm_1.1.6.bb
 delete mode 100644 recipes/xorg-app/xdm_1.1.7.bb
 delete mode 100644 recipes/xorg-app/xdm_1.1.8.bb
 delete mode 100644 recipes/xorg-app/xdpyinfo_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xdpyinfo_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xdriinfo_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xdriinfo_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xedit_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xev_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xev_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xeyes_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xfs_1.0.4.bb
 delete mode 100644 recipes/xorg-app/xfs_1.0.5.bb
 delete mode 100644 recipes/xorg-app/xfs_1.0.6.bb
 delete mode 100644 recipes/xorg-app/xfs_1.0.8.bb
 delete mode 100644 recipes/xorg-app/xfsinfo_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xgamma_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xgamma_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xhost_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xinit_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xinit_1.0.4.bb
 delete mode 100644 recipes/xorg-app/xinit_1.0.5.bb
 delete mode 100644 recipes/xorg-app/xinit_1.0.7.bb
 delete mode 100644 recipes/xorg-app/xinit_1.0.8.bb
 delete mode 100644 recipes/xorg-app/xinit_1.0.9.bb
 delete mode 100644 recipes/xorg-app/xinit_1.1.0.bb
 delete mode 100644 recipes/xorg-app/xinit_1.2.0.bb
 delete mode 100644 recipes/xorg-app/xinput_1.3.0.bb
 delete mode 100644 recipes/xorg-app/xinput_1.4.2.bb
 delete mode 100644 recipes/xorg-app/xinput_1.5.1.bb
 delete mode 100644 recipes/xorg-app/xkbcomp_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xkbcomp_1.0.4.bb
 delete mode 100644 recipes/xorg-app/xkbcomp_1.0.5.bb
 delete mode 100644 recipes/xorg-app/xkbevd_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xkbutils_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xkill_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xload_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xlsatoms_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xlsclients_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xlsfonts_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xmag_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xmag_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xman_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xman_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xmessage_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xmodmap/autofoo.patch
 delete mode 100644 recipes/xorg-app/xmodmap_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xmodmap_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xpr_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xpr_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xprop/autofoo.patch
 delete mode 100644 recipes/xorg-app/xprop_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xprop_1.0.4.bb
 delete mode 100644 recipes/xorg-app/xrandr_1.2.2.bb
 delete mode 100644 recipes/xorg-app/xrandr_1.2.3.bb
 delete mode 100644 recipes/xorg-app/xrdb/autofoo.patch
 delete mode 100644 recipes/xorg-app/xrdb_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xrdb_1.0.4.bb
 delete mode 100644 recipes/xorg-app/xrdb_1.0.5.bb
 delete mode 100644 recipes/xorg-app/xrefresh_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xrx_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xset/autofoo.patch
 delete mode 100644 recipes/xorg-app/xset/disable-xkb.patch
 delete mode 100644 recipes/xorg-app/xset_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xset_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xset_1.0.4.bb
 delete mode 100644 recipes/xorg-app/xsetpointer_1.0.0.bb
 delete mode 100644 recipes/xorg-app/xsetroot_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xsetroot_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xvinfo_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xvinfo_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xwd_1.0.1.bb
 delete mode 100644 recipes/xorg-app/xwd_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xwininfo_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xwininfo_1.0.3.bb
 delete mode 100644 recipes/xorg-app/xwininfo_1.0.4.bb
 delete mode 100644 recipes/xorg-app/xwud_1.0.1.bb

diff --git a/recipes/obsolete/xorg/xorg-app/appres_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/appres_1.0.1.bb
new file mode 100644
index 0000000..698b7c4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/appres_1.0.1.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "The appres program prints the resources seen by an application."
+DEPENDS += " libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "420e6cdf38bb771ec8b00228bf09e8ff"
+SRC_URI[archive.sha256sum] = "15fef83a202b8dcee3420c88dba4aeed1f8fc840ab537487fb5411b99a2eb962"
diff --git a/recipes/obsolete/xorg/xorg-app/bdftopcf_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/bdftopcf_1.0.1.bb
new file mode 100644
index 0000000..d5ddd50
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/bdftopcf_1.0.1.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "converts BDF fonts to PCF fonts"
+DEPENDS += " libxfont"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "9685fab33d39954ab8a0d22e0969d5a4"
+SRC_URI[archive.sha256sum] = "aaaa45ab361781aebda2093fdc7eb5c187f6215b4ba308dd6b9ff2b727e805d3"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-app/beforelight_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/beforelight_1.0.2.bb
new file mode 100644
index 0000000..09852db
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/beforelight_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxscrnsaver libxt libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8bc2e35cdcd2e6a80eab1b77c41f2a46"
+SRC_URI[archive.sha256sum] = "00e217559c93779fe04fd948017820af118a3981d6b4371ace95107cb3b047a7"
diff --git a/recipes/obsolete/xorg/xorg-app/bitmap_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/bitmap_1.0.2.bb
new file mode 100644
index 0000000..70be2aa
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/bitmap_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu xbitmaps libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "78e8ab5c1830e2cdfbff7a952162a5a7"
+SRC_URI[archive.sha256sum] = "83719927ac4309f42e3cadde125a52cfba2e9c951115ac4c017f292f6e4c14bc"
diff --git a/recipes/obsolete/xorg/xorg-app/bitmap_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/bitmap_1.0.3.bb
new file mode 100644
index 0000000..9a83106
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/bitmap_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu xbitmaps libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "98200c358e5401d648b980564d9ae39d"
+SRC_URI[archive.sha256sum] = "863f673518af19f9ae35ee221b30bf8c8b695c76c543d18b3ac400a51b855c41"
diff --git a/recipes/obsolete/xorg/xorg-app/constype_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/constype_1.0.1.bb
new file mode 100644
index 0000000..d8a957b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/constype_1.0.1.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "print an X window dump"
+DEPENDS += " libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9f99bee77ff3c565b4898663810fbef5"
+SRC_URI[archive.sha256sum] = "11403054cb407cdf31da48216f55d1b5943798cb442bcab69faa0a3d7d167541"
diff --git a/recipes/obsolete/xorg/xorg-app/editres_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/editres_1.0.2.bb
new file mode 100644
index 0000000..23956d3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/editres_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxt libxmu libxaw"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9db49742bd4c17966fff7d76ac566d31"
+SRC_URI[archive.sha256sum] = "978fbc134eef3da8a5f363c9e93494a3d7399e8f2b435ac6b1f2c63f09c167df"
diff --git a/recipes/obsolete/xorg/xorg-app/editres_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/editres_1.0.3.bb
new file mode 100644
index 0000000..56cadc1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/editres_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxt libxmu libxaw"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a25f931cc6c8d03daaed434f5db5df2d"
+SRC_URI[archive.sha256sum] = "a2a56b32eaa92ad6f667853f023177ffad9128cfa0361afc2872323598aeceae"
diff --git a/recipes/obsolete/xorg/xorg-app/fonttosfnt_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/fonttosfnt_1.0.3.bb
new file mode 100644
index 0000000..71e147c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/fonttosfnt_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " xproto freetype libfontenc"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b0ebd86029571239b9d7b0c61191b591"
+SRC_URI[archive.sha256sum] = "9d2b0149ea49a097ab6c563801c06af9975e98f9fa4c8af1a8ac3238e4fd5243"
diff --git a/recipes/obsolete/xorg/xorg-app/fslsfonts_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/fslsfonts_1.0.1.bb
new file mode 100644
index 0000000..c1040ad
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/fslsfonts_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libfs"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c7b2f8a938749d41dc86db6bd1e6a4ca"
+SRC_URI[archive.sha256sum] = "3feb006a25f36856924e26249fe84b27142678f97175780960f085e1e263a62e"
diff --git a/recipes/obsolete/xorg/xorg-app/fstobdf_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/fstobdf_1.0.2.bb
new file mode 100644
index 0000000..6c3148c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/fstobdf_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libfs"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "99144743ab3cbb9cf37090fdc9e747db"
+SRC_URI[archive.sha256sum] = "690e45b252cd96036dd9b89af8624eb423e16d4bd662b07d264a3f876ce7ac22"
diff --git a/recipes/obsolete/xorg/xorg-app/iceauth_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/iceauth_1.0.2.bb
new file mode 100644
index 0000000..bcda802
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/iceauth_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "a tool for manipulating ICE protocol authorization records"
+DEPENDS += " libice"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7ab8b64edf0212a9d9a3c8129901a450"
+SRC_URI[archive.sha256sum] = "06401591de57a2c4cf2255e3d5230ea19351c5516cf8dae98c61092392bab5bb"
diff --git a/recipes/obsolete/xorg/xorg-app/lbxproxy_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/lbxproxy_1.0.1.bb
new file mode 100644
index 0000000..7b35f1b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/lbxproxy_1.0.1.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "Applications that would like to take advantage of the Low Bandwidth \
+extension to X (LBX) must make their connections to an lbxproxy."
+DEPENDS += " xtrans libxext liblbxutil libice xproxymngproto bigreqsproto zlib"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9d5045a5c76b1fe360221b967a5aa0e9"
+SRC_URI[archive.sha256sum] = "e2e757986724a5d2ee299aa7616a3d9985af45e363021b486b7abbcac4ca01c2"
diff --git a/recipes/obsolete/xorg/xorg-app/luit_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/luit_1.0.2.bb
new file mode 100644
index 0000000..d8c3475
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/luit_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " zlib zlib libfontenc"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "aacda46598ce3af8ca16e2a8132db1b2"
+SRC_URI[archive.sha256sum] = "c0c4d76df0350c626df7ce62bf3df7915f9959557d76abce96222857d782389c"
diff --git a/recipes/obsolete/xorg/xorg-app/luit_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/luit_1.0.3.bb
new file mode 100644
index 0000000..4baac79
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/luit_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "a filter for locale and ISO 2022 support on Unicode terminals"
+DEPENDS += " zlib zlib libfontenc"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b01e4f71c20fc1c79ed727759c1df40c"
+SRC_URI[archive.sha256sum] = "2010f2152eee89a67f02edc3041574fb07442d075ca46fbcf84f981f0977a5d7"
diff --git a/recipes/obsolete/xorg/xorg-app/mkcomposecache_1.2.bb b/recipes/obsolete/xorg/xorg-app/mkcomposecache_1.2.bb
new file mode 100644
index 0000000..8de1fad
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/mkcomposecache_1.2.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+DESCRIPTION = "used for creating global (system-wide) Compose cache files"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c8237b4aea1ae0c15441deab6b12c5c0"
+SRC_URI[archive.sha256sum] = "8c34cdd03f7d11ac86c681349d39a4faf88854faaad928f0663da55f125aedfb"
diff --git a/recipes/obsolete/xorg/xorg-app/mkfontdir_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/mkfontdir_1.0.3.bb
new file mode 100644
index 0000000..e3d1782
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/mkfontdir_1.0.3.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "a program to create an index of X font files in a directory"
+RDEPENDS_${PN} += "mkfontscale"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "4d0f89a23f77e22f1671a77bf0898955"
+SRC_URI[archive.sha256sum] = "2a786e03611a53c7f6263db446c0c9ef76e94bcf930b0b5867cc6a9c19653074"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-app/mkfontdir_1.0.4.bb b/recipes/obsolete/xorg/xorg-app/mkfontdir_1.0.4.bb
new file mode 100644
index 0000000..dbc0884
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/mkfontdir_1.0.4.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "a program to create an index of X font files in a directory"
+RDEPENDS_${PN} += "mkfontscale"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "35394bf3f746a57fba624dba52fdbba3"
+SRC_URI[archive.sha256sum] = "6f9a3cc70d27704ee8e4ff01d5d69c974b059fd7e470172b68cfa477c7caf8e3"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.3.bb
new file mode 100644
index 0000000..10d511f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.3.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "a program to create an index of scalable font files for X"
+DEPENDS += " zlib libfontenc freetype "
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "1d608771aca9695b828cec1e34178fd1"
+SRC_URI[archive.sha256sum] = "0458a3a5525b4ab458a018648ef8575afc191f904364c00e27876a7bd53af020"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.4.bb b/recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.4.bb
new file mode 100644
index 0000000..6a29088
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.4.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "a program to create an index of scalable font files for X"
+DEPENDS += " zlib libfontenc freetype "
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "e5d7373c4266973b3b13aac5d1a4655b"
+SRC_URI[archive.sha256sum] = "dc9b946cc23490c960fbca8b32e4bba4bc23ce404a8d7e1c0e916894c83b4227"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.5.bb b/recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.5.bb
new file mode 100644
index 0000000..5e37e8e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/mkfontscale_1.0.5.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "a program to create an index of scalable font files for X"
+DEPENDS += " zlib libfontenc freetype "
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "5e6e210b70adfef1264b0212aab1f758"
+SRC_URI[archive.sha256sum] = "f79dff54153dc3beb9eb3f2e4776dbc55ed2a4d3d0adbf9c8a2d9eb230ed3850"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-app/rgb_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/rgb_1.0.1.bb
new file mode 100644
index 0000000..c78047f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/rgb_1.0.1.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DEPENDS += " xproto util-macros"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "255222b3ab3af671289a6b4844e9f393"
+SRC_URI[archive.sha256sum] = "f635bc02f72f62c248af8a19aa6931e9f2d061cca258c12c1468d486602990ad"
+
+FILES_${PN} += "${datadir}/X11"
diff --git a/recipes/obsolete/xorg/xorg-app/rstart_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/rstart_1.0.2.bb
new file mode 100644
index 0000000..2f17f8a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/rstart_1.0.2.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "99aea04a27197056368a4431f30f9cdb"
+SRC_URI[archive.sha256sum] = "02fc48b5069018e4262f0e5ebb669acedc04167307c98f0fdb2ca22e568e9596"
diff --git a/recipes/obsolete/xorg/xorg-app/sessreg_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/sessreg_1.0.2.bb
new file mode 100644
index 0000000..e7bede7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/sessreg_1.0.2.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "bee5d87d40615e67c84ab0b0c65049ba"
+SRC_URI[archive.sha256sum] = "c23c12259854c7cec6d19bf397afff4a542a22170b14de73b321aa8cafcf3a86"
diff --git a/recipes/obsolete/xorg/xorg-app/sessreg_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/sessreg_1.0.3.bb
new file mode 100644
index 0000000..5482af9
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/sessreg_1.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "07665816f2623ec82e665fb7d31c6cef"
+SRC_URI[archive.sha256sum] = "7d0c145d53246ddf09fc749f91324897ed9a3da0064808f99b789c37470080dc"
diff --git a/recipes/obsolete/xorg/xorg-app/sessreg_1.0.4.bb b/recipes/obsolete/xorg/xorg-app/sessreg_1.0.4.bb
new file mode 100644
index 0000000..9738608
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/sessreg_1.0.4.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DESCRIPTION = "a simple program for managing utmp/wtmp entries"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "839e968d7197b9563f0fd8a5a3aac2e3"
+SRC_URI[archive.sha256sum] = "23e163502e208ac16f04a12b15f7f8dcd9919f0149c714353b7f92539b7e9802"
diff --git a/recipes/obsolete/xorg/xorg-app/setxkbmap_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/setxkbmap_1.0.3.bb
new file mode 100644
index 0000000..f9434d7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/setxkbmap_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxkbfile "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2b53542095a35a8a5731164118643883"
+SRC_URI[archive.sha256sum] = "086f67c8272ceca059c64e127dbdb66ccad8de6f532aee02d22786543718a508"
diff --git a/recipes/obsolete/xorg/xorg-app/setxkbmap_1.0.4.bb b/recipes/obsolete/xorg/xorg-app/setxkbmap_1.0.4.bb
new file mode 100644
index 0000000..8a9558b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/setxkbmap_1.0.4.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxkbfile "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6fab3bb176be9e510c5613d054ef1ca4"
+SRC_URI[archive.sha256sum] = "9b5b139238419757d57de584c2ad30b853367245eef49221ce02a3b403cf2bac"
diff --git a/recipes/obsolete/xorg/xorg-app/showfont_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/showfont_1.0.1.bb
new file mode 100644
index 0000000..a5ffa3a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/showfont_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libfs"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "339b2faf1ca5114fda414338e15b6e21"
+SRC_URI[archive.sha256sum] = "87db3cf12914abc6b074d12b35c7f39c8fd7b5d3933b339e2c1260a51061760c"
diff --git a/recipes/obsolete/xorg/xorg-app/smproxy_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/smproxy_1.0.2.bb
new file mode 100644
index 0000000..0ef6033
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/smproxy_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxt libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "31da204a0255ba8c6a65386e65dc1c90"
+SRC_URI[archive.sha256sum] = "76d22f0cf07c8c4386a15c5c935b58319bd747befb940a0f03f652d59c4f67d2"
diff --git a/recipes/obsolete/xorg/xorg-app/twm_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/twm_1.0.3.bb
new file mode 100644
index 0000000..feaebdd
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/twm_1.0.3.bb
@@ -0,0 +1,13 @@
+require xorg-app-common.inc
+DESCRIPTION = "tiny window manager"
+DEPENDS += " libxext libxt libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a56b71dc40249195b32b304633c28a3e"
+SRC_URI[archive.sha256sum] = "5b41550477a893bf2b82ab73fc7fb6c839ba52d0deac059be1a473dd7bb92a4e"
+
+ALTERNATIVE_NAME = "x-window-manager"
+ALTERNATIVE_PATH = "${bindir}/twm"
+ALTERNATIVE_LINK = "${bindir}/x-window-manager"
+ALTERNATIVE_PRIORITY = "1"
diff --git a/recipes/obsolete/xorg/xorg-app/x11perf_1.4.1.bb b/recipes/obsolete/xorg/xorg-app/x11perf_1.4.1.bb
new file mode 100644
index 0000000..7c61228
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/x11perf_1.4.1.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "X11 server performance test program"
+DEPENDS += "libxmu libxrender libxft libxext fontconfig"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fd06c8b8e3572a0e14af65a49e0dd7d1"
+SRC_URI[archive.sha256sum] = "c81819618ec596fda55b950ef80f2ee02e5ce149ea99f1f741cedb459b4d3064"
diff --git a/recipes/obsolete/xorg/xorg-app/x11perf_1.5.bb b/recipes/obsolete/xorg/xorg-app/x11perf_1.5.bb
new file mode 100644
index 0000000..9cff277
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/x11perf_1.5.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "X11 server performance test program"
+DEPENDS += "libxmu libxrender libxft libxext fontconfig"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "31283bfc3c78718ac1bd71e510d4e774"
+SRC_URI[archive.sha256sum] = "4729da53dde0b7e1748db4bb771f9b7aaf2e2b1e67293a3a5b96d54043ce1233"
+
+FILES_${PN} += "/usr/lib/X11/x11perfcomp/*"
diff --git a/recipes/obsolete/xorg/xorg-app/xauth_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xauth_1.0.2.bb
new file mode 100644
index 0000000..bd391a2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xauth_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "X authority file utility"
+DEPENDS += "libxau libxext libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "31b956edaeb453ddaa640420e97b25b2"
+SRC_URI[archive.sha256sum] = "569e5a581e5eb16abf1c04a66da22c6dade14578ab34e5e78b8724bb655f1f17"
diff --git a/recipes/obsolete/xorg/xorg-app/xauth_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/xauth_1.0.3.bb
new file mode 100644
index 0000000..7adb51d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xauth_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "X authority file utility"
+DEPENDS += "libxau libxext libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e91e10ace1df0d5f2cbc74ead256407a"
+SRC_URI[archive.sha256sum] = "1fd18b53fda74ea4649eb9577b1cf86538a25d171f10251eeb30d11cdd5bda8c"
diff --git a/recipes/obsolete/xorg/xorg-app/xbacklight_1.1.bb b/recipes/obsolete/xorg/xorg-app/xbacklight_1.1.bb
new file mode 100644
index 0000000..287b2b1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xbacklight_1.1.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "adjust backlight brightness using RandR extension"
+DEPENDS += " libxrender libxrandr"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "51b4a1c0ae2b3bd77417306fd78a3e94"
+SRC_URI[archive.sha256sum] = "c795001f15974569e16f25b201ac2ac7666c5a646f8d0de3afa0c3a1ba5d64a4"
diff --git a/recipes/obsolete/xorg/xorg-app/xcalc_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xcalc_1.0.1.bb
new file mode 100644
index 0000000..ff042f0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xcalc_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "07b948cf671fde88df1a59bfb0cab3b8"
+SRC_URI[archive.sha256sum] = "17484e5fec0ebe7dd8df7218fde1449c52be3f4c6377a85a9fd86e377a7f4248"
diff --git a/recipes/obsolete/xorg/xorg-app/xclipboard_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xclipboard_1.0.1.bb
new file mode 100644
index 0000000..06aeda2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xclipboard_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2c6ecedb10dc51adbb64c95f22fd99c2"
+SRC_URI[archive.sha256sum] = "3399a27101285112ea578e1855c8374254afa8d427a3c5943458abc27c4d70fc"
diff --git a/recipes/obsolete/xorg/xorg-app/xclock_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xclock_1.0.2.bb
new file mode 100644
index 0000000..0bf6117
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xclock_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6b930326f71993fb54b7203902b387cd"
+SRC_URI[archive.sha256sum] = "ced648762382eab09e0ccb87371cb745646ede08ffcb068faa6025d20c4d1f3d"
diff --git a/recipes/obsolete/xorg/xorg-app/xclock_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/xclock_1.0.3.bb
new file mode 100644
index 0000000..73ac39c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xclock_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "analog / digital clock for X"
+DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2b1a3d030d87e62a591db8ee4c0072e6"
+SRC_URI[archive.sha256sum] = "10b5777ae9ef2a10d4cf447bd1bf13372d7061573835c2c87d5c948b65e9577f"
diff --git a/recipes/obsolete/xorg/xorg-app/xcmsdb_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xcmsdb_1.0.1.bb
new file mode 100644
index 0000000..770db7e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xcmsdb_1.0.1.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8579d5f50ba7f0c4a5bf16b9670fea01"
+SRC_URI[archive.sha256sum] = "e275a39f41ffae854db77b2c5decfad2cac32afbcd158842032dc9ca04efe92e"
diff --git a/recipes/obsolete/xorg/xorg-app/xconsole_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xconsole_1.0.2.bb
new file mode 100644
index 0000000..a7eacc3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xconsole_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8678ddd23573022d68dcd883ae239be8"
+SRC_URI[archive.sha256sum] = "45db847e810a932bb962041a4c242f97779142f7e36feec64ec5f9073bd9b377"
diff --git a/recipes/obsolete/xorg/xorg-app/xcursorgen_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xcursorgen_1.0.1.bb
new file mode 100644
index 0000000..39c6aa2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xcursorgen_1.0.1.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DEPENDS += " libxcursor libpng"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "39e1e62f5bd92603b0230b8b948c2fc4"
+SRC_URI[archive.sha256sum] = "18d3e0d64853089c2154f1f867df087fc15f87e03e09fabc98ee5e265d8a53ef"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-app/xcursorgen_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xcursorgen_1.0.2.bb
new file mode 100644
index 0000000..a058a88
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xcursorgen_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "create an X cursor file from a collection of PNG images"
+DEPENDS += " libxcursor libpng"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "6fc90896b8c786cb1a2100b4167f7874"
+SRC_URI[archive.sha256sum] = "e009322bd2afef8d4ad91bcb6b17874e1cd00b1aaf397e7019a82cc44f3c174e"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-app/xdm_1.1.3.bb b/recipes/obsolete/xorg/xorg-app/xdm_1.1.3.bb
new file mode 100644
index 0000000..02df29e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xdm_1.1.3.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "X display manager"
+DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "619d0549c6c20ca15aa77769f2fbabe2"
+SRC_URI[archive.sha256sum] = "9e640974c132ef1faafedc77e4602d55457b2791006b677cec071ee8afbf9a74"
+
+EXTRA_OECONF += " --with-random-device=/dev/urandom"
diff --git a/recipes/obsolete/xorg/xorg-app/xdm_1.1.4.bb b/recipes/obsolete/xorg/xorg-app/xdm_1.1.4.bb
new file mode 100644
index 0000000..c0268c5
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xdm_1.1.4.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "X display manager"
+DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a2b4c280f3e324d081a0d9ed76a8a123"
+SRC_URI[archive.sha256sum] = "928238ea20e074372659b2902de0e0d754083196911319319795fdbfd1ca6073"
+
+EXTRA_OECONF += " --with-random-device=/dev/urandom"
diff --git a/recipes/obsolete/xorg/xorg-app/xdm_1.1.6.bb b/recipes/obsolete/xorg/xorg-app/xdm_1.1.6.bb
new file mode 100644
index 0000000..9a4d7d3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xdm_1.1.6.bb
@@ -0,0 +1,12 @@
+require xorg-app-common.inc
+DESCRIPTION = "X display manager"
+DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c89f8bc74fda4d19e5f374f59c88810f"
+SRC_URI[archive.sha256sum] = "c41ac89d9da5c3f5424e9c4871d363ff17acf0fd2a46830931c447ba0b5a8bcd"
+
+EXTRA_OECONF += " --with-random-device=/dev/urandom"
+
+FILES_${PN}-dbg += "${libdir}/X11/xdm/.debug/*"
diff --git a/recipes/obsolete/xorg/xorg-app/xdm_1.1.7.bb b/recipes/obsolete/xorg/xorg-app/xdm_1.1.7.bb
new file mode 100644
index 0000000..844413c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xdm_1.1.7.bb
@@ -0,0 +1,12 @@
+require xorg-app-common.inc
+DESCRIPTION = "X display manager"
+DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "92effdb698d9ecc9113fe4f49294bd90"
+SRC_URI[archive.sha256sum] = "6a7bceccb1eb9ce3d14259be7a6cc8268bc9e1f127298480b9322ceb6f032d6d"
+
+EXTRA_OECONF += " --with-random-device=/dev/urandom"
+
+FILES_${PN}-dbg += "${libdir}/X11/xdm/.debug/*"
diff --git a/recipes/obsolete/xorg/xorg-app/xdm_1.1.8.bb b/recipes/obsolete/xorg/xorg-app/xdm_1.1.8.bb
new file mode 100644
index 0000000..fc8fa99
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xdm_1.1.8.bb
@@ -0,0 +1,12 @@
+require xorg-app-common.inc
+DESCRIPTION = "X display manager"
+DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cc1816bc62a3722ad509373b0b7f30fe"
+SRC_URI[archive.sha256sum] = "e1169058775a44b0898351d2f645039b4d8946360285831e553587a147b735e9"
+
+EXTRA_OECONF += " --with-random-device=/dev/urandom"
+
+FILES_${PN}-dbg += "${libdir}/X11/xdm/.debug/*"
diff --git a/recipes/obsolete/xorg/xorg-app/xdpyinfo_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xdpyinfo_1.0.2.bb
new file mode 100644
index 0000000..80f4bf7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xdpyinfo_1.0.2.bb
@@ -0,0 +1,12 @@
+require xorg-app-common.inc
+DESCRIPTION = "X display information utility"
+LICENSE = "MIT"
+DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi libxrender libxinerama libdmx libxp libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://disable-xkb.patch"
+SRC_URI[archive.md5sum] = "c9ee60ae52c97c51d4ca327e53f0cb61"
+SRC_URI[archive.sha256sum] = "c9927fc33e8a4422d74b1ebee0d19dd5a16d9ebc435e8f47f0aa546501ccfed3"
+
+EXTRA_OECONF = "--disable-xkb"
diff --git a/recipes/obsolete/xorg/xorg-app/xdpyinfo_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/xdpyinfo_1.0.3.bb
new file mode 100644
index 0000000..eff9c09
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xdpyinfo_1.0.3.bb
@@ -0,0 +1,12 @@
+require xorg-app-common.inc
+DESCRIPTION = "X display information utility"
+LICENSE = "MIT"
+DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi libxrender libxinerama libdmx libxp libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://disable-xkb.patch"
+SRC_URI[archive.md5sum] = "b7cbab6cbcd12bf7ad65dbc12d86e104"
+SRC_URI[archive.sha256sum] = "4294768751bd4ffb47e5ebacfc7b5b9f95a1a2f4d221d8af64474382473e1962"
+
+EXTRA_OECONF = "--disable-xkb"
diff --git a/recipes/obsolete/xorg/xorg-app/xdriinfo_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xdriinfo_1.0.1.bb
new file mode 100644
index 0000000..8a349d9
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xdriinfo_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " glproto virtual/libgl"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "be3c5a9b242a57226b5bb5f22ec341ca"
+SRC_URI[archive.sha256sum] = "f693977bdaea7eb6b095a6b6bc60b8a62110ecdef4c455211346e592f59c3772"
diff --git a/recipes/obsolete/xorg/xorg-app/xdriinfo_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xdriinfo_1.0.2.bb
new file mode 100644
index 0000000..6f27ff2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xdriinfo_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "query configuration information of DRI drivers"
+DEPENDS += " glproto virtual/libgl"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a5ec51ed9f0a55dc3462d90d52ff899c"
+SRC_URI[archive.sha256sum] = "7b03ac095b6c79688c20ad61e3576d4698e3f16c09a7f3f1e7c50826814e7265"
diff --git a/recipes/obsolete/xorg/xorg-app/xedit_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xedit_1.0.2.bb
new file mode 100644
index 0000000..001cbcd
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xedit_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxprintutil libxp libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c56160e93c24ddf17e69891ed50deb72"
+SRC_URI[archive.sha256sum] = "2658d78bbaf8c9effac261f3c229c035fbfda817fa9636dea1e46078213362df"
diff --git a/recipes/obsolete/xorg/xorg-app/xev_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xev_1.0.2.bb
new file mode 100644
index 0000000..402db0b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xev_1.0.2.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Event Viewer"
+LICENSE = "MIT"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://diet-x11.patch"
+SRC_URI[archive.md5sum] = "e3008eb0655da3026c162a5597d70869"
+SRC_URI[archive.sha256sum] = "cac2771b67942d9a00b46532176feb18b2f82c434e0f6ece578d95953ef33053"
diff --git a/recipes/obsolete/xorg/xorg-app/xev_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/xev_1.0.3.bb
new file mode 100644
index 0000000..a0990d2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xev_1.0.3.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Event Viewer"
+LICENSE = "MIT"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://diet-x11.patch"
+SRC_URI[archive.md5sum] = "a9532c3d1683c99bb5df1895cb3a60b1"
+SRC_URI[archive.sha256sum] = "d4ac7ae154ee9733be27a5f55586abb9362c768f5fb8a4fc7fd2645100a9313a"
diff --git a/recipes/obsolete/xorg/xorg-app/xeyes_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xeyes_1.0.1.bb
new file mode 100644
index 0000000..6382df4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xeyes_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxau libxt libxext libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "033f14f7c4e30d1f4edbb22d5ef86883"
+SRC_URI[archive.sha256sum] = "530902e8732130e37d9b46e73eecff90d6dbc5d5628620fded74a4e054aa8029"
diff --git a/recipes/obsolete/xorg/xorg-app/xfs_1.0.4.bb b/recipes/obsolete/xorg/xorg-app/xfs_1.0.4.bb
new file mode 100644
index 0000000..f50eaf4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xfs_1.0.4.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "X fontserver"
+DEPENDS += " libfs libxfont xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f43cb64d623b748208dfd9012d17b654"
+SRC_URI[archive.sha256sum] = "452dde2923c7ae5a2b8cb4b9735507c579c1c55a0e5e45a34210e52574ee641b"
diff --git a/recipes/obsolete/xorg/xorg-app/xfs_1.0.5.bb b/recipes/obsolete/xorg/xorg-app/xfs_1.0.5.bb
new file mode 100644
index 0000000..1d31d21
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xfs_1.0.5.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "X fontserver"
+DEPENDS += " libfs libxfont xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3fc73b5e39a1fe8b8d96563c8144cffe"
+SRC_URI[archive.sha256sum] = "f586f2101d42e512e7d20a6a6715c3c2cad19cacbee3b4034a0818de349e38f9"
diff --git a/recipes/obsolete/xorg/xorg-app/xfs_1.0.6.bb b/recipes/obsolete/xorg/xorg-app/xfs_1.0.6.bb
new file mode 100644
index 0000000..24028ac
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xfs_1.0.6.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "X fontserver"
+DEPENDS += " libfs libxfont xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a62ea490a8b97f74b53732df8fc309d8"
+SRC_URI[archive.sha256sum] = "5a3ad18fdc67e261454740217f7c02d1b6825013abcebdcd778a4865fd823353"
diff --git a/recipes/obsolete/xorg/xorg-app/xfs_1.0.8.bb b/recipes/obsolete/xorg/xorg-app/xfs_1.0.8.bb
new file mode 100644
index 0000000..6324d81
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xfs_1.0.8.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "X fontserver"
+DEPENDS += " libfs libxfont xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f10717e45535b64eb45226aac571dac2"
+SRC_URI[archive.sha256sum] = "34b5040b3db7552fc1cdfa46f926ce5b7217ea5d77cfafbbddf94fbae6b4f482"
diff --git a/recipes/obsolete/xorg/xorg-app/xfsinfo_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xfsinfo_1.0.1.bb
new file mode 100644
index 0000000..2df9b2a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xfsinfo_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libfs"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e98b18fbce1261de30b1de819d86f48a"
+SRC_URI[archive.sha256sum] = "adc33443b3a7f334d2407de702004a0491f24708e0e1abe74cd8ae114cd60cd9"
diff --git a/recipes/obsolete/xorg/xorg-app/xgamma_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xgamma_1.0.1.bb
new file mode 100644
index 0000000..d6245ee
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xgamma_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxxf86vm"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "45d8fa3c85d4bfda87251798fd605a45"
+SRC_URI[archive.sha256sum] = "085330064fdb90a152d2d44474fa20bb81ccb6c587c144f5f9c323cb9cc31eee"
diff --git a/recipes/obsolete/xorg/xorg-app/xgamma_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xgamma_1.0.2.bb
new file mode 100644
index 0000000..2b11285
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xgamma_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "Alter a monitor's gamma correction through the X server"
+DEPENDS += " libxxf86vm"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f13ddedaa63a608d3b025d326f4f5b5d"
+SRC_URI[archive.sha256sum] = "5d3d5b230fc60aefae8f4865c17add133b5fb11377fd61c80897ef94fcccf41e"
diff --git a/recipes/obsolete/xorg/xorg-app/xhost_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xhost_1.0.2.bb
new file mode 100644
index 0000000..1a42fb1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xhost_1.0.2.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "Server access control program for X"
+LICENSE = "MIT"
+DEPENDS += "libxmu libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f746aba36f075ae4cae313d849a94f4e"
+SRC_URI[archive.sha256sum] = "edab2cc49d230f58e54c0f7b83fd726fec5fc31356668a11589649f19ba90db6"
diff --git a/recipes/obsolete/xorg/xorg-app/xinit_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/xinit_1.0.3.bb
new file mode 100644
index 0000000..703f825
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xinit_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f04a903cc0e18b3c338f58eb90f6caf8"
+SRC_URI[archive.sha256sum] = "c77a58cba815eb1dde2242a819e80d7d84d753678837ac24d385e3ec65d33186"
+
+FILES_${PN} += "  /usr/lib/X11/xinit"
diff --git a/recipes/obsolete/xorg/xorg-app/xinit_1.0.4.bb b/recipes/obsolete/xorg/xorg-app/xinit_1.0.4.bb
new file mode 100644
index 0000000..2ff99ce
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xinit_1.0.4.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Window System initializer"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9df52a504dc04313a6650fae364ae04a"
+SRC_URI[archive.sha256sum] = "1e7056db4441ccb0dff0f77503e3fd49a370aecdecf95ce6066116ca8244bf52"
+
+FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/obsolete/xorg/xorg-app/xinit_1.0.5.bb b/recipes/obsolete/xorg/xorg-app/xinit_1.0.5.bb
new file mode 100644
index 0000000..120f42f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xinit_1.0.5.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Window System initializer"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9a2aad51042141a0e6ad066015397595"
+SRC_URI[archive.sha256sum] = "95d55283f32d241c8e6750b7998408da43e910d2b918c80089a3012684f1c62d"
+
+FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/obsolete/xorg/xorg-app/xinit_1.0.7.bb b/recipes/obsolete/xorg/xorg-app/xinit_1.0.7.bb
new file mode 100644
index 0000000..50c4270
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xinit_1.0.7.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Window System initializer"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8b882d9e2deed9d85469a3beaec566a3"
+SRC_URI[archive.sha256sum] = "15781cf2b15af8a2535ecc49acce77cc16573571344a71dcbe198ec12e5bb774"
+
+FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/obsolete/xorg/xorg-app/xinit_1.0.8.bb b/recipes/obsolete/xorg/xorg-app/xinit_1.0.8.bb
new file mode 100644
index 0000000..1771578
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xinit_1.0.8.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Window System initializer"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "521574088fbd688edbf91e6bae674265"
+SRC_URI[archive.sha256sum] = "06c1049f6b63d1c368a1e03e2392097919b22ff24899e190de3577bffe6fe524"
+
+FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/obsolete/xorg/xorg-app/xinit_1.0.9.bb b/recipes/obsolete/xorg/xorg-app/xinit_1.0.9.bb
new file mode 100644
index 0000000..7d8270a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xinit_1.0.9.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Window System initializer"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "224c36057e4416205d4e421af01a2f15"
+SRC_URI[archive.sha256sum] = "b4218fd4ca5e431bf69cba848c21e91235fda30504634b9f6b6cd011dcbd8999"
+
+FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/obsolete/xorg/xorg-app/xinit_1.1.0.bb b/recipes/obsolete/xorg/xorg-app/xinit_1.1.0.bb
new file mode 100644
index 0000000..1829819
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xinit_1.1.0.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Window System initializer"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9144097186c3d2454beffe8ac3b53c6e"
+SRC_URI[archive.sha256sum] = "c79ec1a4d60404715a626f2832f1b62f43b9d52a1e4642b40af743ee41362590"
+
+FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/obsolete/xorg/xorg-app/xinit_1.2.0.bb b/recipes/obsolete/xorg/xorg-app/xinit_1.2.0.bb
new file mode 100644
index 0000000..fc5ca59
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xinit_1.2.0.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Window System initializer"
+DEPENDS += "util-linux-ng"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fe1696cab2fbed6fa059d0cd1c53ac13"
+SRC_URI[archive.sha256sum] = "ab61663a4421753132d4aac97a873ed20697c4761cb434640f48f350fb65087f"
+
+FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/obsolete/xorg/xorg-app/xinput_1.3.0.bb b/recipes/obsolete/xorg/xorg-app/xinput_1.3.0.bb
new file mode 100644
index 0000000..dac3150
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xinput_1.3.0.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DESCRIPTION = "a utility to configure and test XInput devices"
+DEPENDS += " libxi"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "977d657e8d7b59f7d82c98ebef444b28"
+SRC_URI[archive.sha256sum] = "330c3e5188abf256131c162c456060804f369349e9a0e7aa3efbc54add802e45"
diff --git a/recipes/obsolete/xorg/xorg-app/xinput_1.4.2.bb b/recipes/obsolete/xorg/xorg-app/xinput_1.4.2.bb
new file mode 100644
index 0000000..9e58205
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xinput_1.4.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DESCRIPTION = "a utility to configure and test XInput devices"
+DEPENDS += " libxi"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "58e619576cbf4b6057eebb7a97fe2ddf"
+SRC_URI[archive.sha256sum] = "3195916b6cebf109eb571b939d7cea7075ef1933782526a6d8fbbb353bc3924b"
diff --git a/recipes/obsolete/xorg/xorg-app/xinput_1.5.1.bb b/recipes/obsolete/xorg/xorg-app/xinput_1.5.1.bb
new file mode 100644
index 0000000..9b990b0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xinput_1.5.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DESCRIPTION = "a utility to configure and test XInput devices"
+DEPENDS += " libxi"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "82400f0ba63217df9b00d825532cea7d"
+SRC_URI[archive.sha256sum] = "e33c8361c2b6cb13db9a7157753d417c168c8203c8b7027e9dda2fbeef00fd33"
diff --git a/recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.3.bb
new file mode 100644
index 0000000..ebc8375
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.3.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "The X Keyboard Extension essentially replaces the core protocol definition of keyboard."
+DEPENDS += " libxkbfile"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "2fbcae1323c266edf5b6c61751f2e343"
+SRC_URI[archive.sha256sum] = "0635bae5dae3c933ebba997475ae14fa213aee1f2ea8aaff2ca76c50f8aec716"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.4.bb b/recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.4.bb
new file mode 100644
index 0000000..64b2370
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.4.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "The X Keyboard Extension essentially replaces the core protocol definition of keyboard."
+DEPENDS += " libxkbfile"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "d5122f1d5a91725a81c843f3bd388244"
+SRC_URI[archive.sha256sum] = "fefc574bf639d64348939edf9654306af2bb3c20447be9cff493cb06d87cb672"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.5.bb b/recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.5.bb
new file mode 100644
index 0000000..bcd1455
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xkbcomp_1.0.5.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "The X Keyboard Extension essentially replaces the core protocol definition of keyboard."
+DEPENDS += " libxkbfile"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "6cc96c3e4ed5d9802fe717beac008f19"
+SRC_URI[archive.sha256sum] = "204403e0388e83127212109310037d17f56c3c3fd3c96d7dcaa0df99684f00c1"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-app/xkbevd_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xkbevd_1.0.2.bb
new file mode 100644
index 0000000..66b6937
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xkbevd_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxkbfile "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "68f2a143716c23b566f8509d9498f516"
+SRC_URI[archive.sha256sum] = "4b78e316ecf9a9498291f634a7e9ee712ba429d5606f300c0a27eacdaaa1f72b"
diff --git a/recipes/obsolete/xorg/xorg-app/xkbutils_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xkbutils_1.0.1.bb
new file mode 100644
index 0000000..7547e96
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xkbutils_1.0.1.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxkbfile "
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "84396a3dd75337caaae29d8fa5616fb1"
+SRC_URI[archive.sha256sum] = "aaad73ed8db764978a18bc6ba774d38a4c1330c86622c0b47ae3ced09c175856"
diff --git a/recipes/obsolete/xorg/xorg-app/xkill_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xkill_1.0.1.bb
new file mode 100644
index 0000000..ba95dbe
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xkill_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f66d76abb0f75514ca32272e23cca757"
+SRC_URI[archive.sha256sum] = "77a11aac6e4ae2132d8b7b4335be77de26655e6aa88b40e51fd2ee802f14a9de"
diff --git a/recipes/obsolete/xorg/xorg-app/xload_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xload_1.0.1.bb
new file mode 100644
index 0000000..9b72817
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xload_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ba013813f9c21eb015559466f8d02a44"
+SRC_URI[archive.sha256sum] = "8d51184d6b18eea2f64e0c5b88cd95edff8353ce6529e780f95b1f2347babbf2"
diff --git a/recipes/obsolete/xorg/xorg-app/xlsatoms_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xlsatoms_1.0.1.bb
new file mode 100644
index 0000000..3acd54f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xlsatoms_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "69adcda848479acc3b82b3928812d191"
+SRC_URI[archive.sha256sum] = "456d575a0cdb37fc9415578a3ad34ba3cf9eb5eb0f6e5a25f97ca41db416d55a"
diff --git a/recipes/obsolete/xorg/xorg-app/xlsclients_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xlsclients_1.0.1.bb
new file mode 100644
index 0000000..9b32088
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xlsclients_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "44473b880d26bfbe8b3d4d72b183cba7"
+SRC_URI[archive.sha256sum] = "988c71c6dc3519523fe5844ee3e49d91f843a83c783dd0baa20526d9d2981698"
diff --git a/recipes/obsolete/xorg/xorg-app/xlsfonts_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xlsfonts_1.0.1.bb
new file mode 100644
index 0000000..5a88403
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xlsfonts_1.0.1.bb
@@ -0,0 +1,5 @@
+require xorg-app-common.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ca9c6c88d0b83360b7b5092615fbf591"
+SRC_URI[archive.sha256sum] = "c8d826194299b2b8e3c6edce7070f05421465b0118ed47135a0195d12fe8a720"
diff --git a/recipes/obsolete/xorg/xorg-app/xmag_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xmag_1.0.1.bb
new file mode 100644
index 0000000..c09140d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xmag_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "058d168d1c7c991b8d12158433ea5f63"
+SRC_URI[archive.sha256sum] = "1f239057cdfb2164b2e8fc229e2518d20b27a853f975e73618a4a81f09ebeb02"
diff --git a/recipes/obsolete/xorg/xorg-app/xmag_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xmag_1.0.2.bb
new file mode 100644
index 0000000..2856093
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xmag_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "magnify parts of the screen"
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7c6a783e42c88360ac31d259a864a19d"
+SRC_URI[archive.sha256sum] = "51dd943e607ddd8067fd13cd597998fb00560cbf06450a8c374563a78a86da43"
diff --git a/recipes/obsolete/xorg/xorg-app/xman_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xman_1.0.2.bb
new file mode 100644
index 0000000..1844180
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xman_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxprintutil libxp libxt"
+RDEPENDS_${PN} = " man"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "855f2dbfa2aff58b8b9cd6a1c1120fad"
+SRC_URI[archive.sha256sum] = "00bc616892388c94505b09564daffbad2df2e7c684686dea2d78dbcd210212f2"
+
+FILES_${PN} += " /usr/share/X11/xman.help"
diff --git a/recipes/obsolete/xorg/xorg-app/xman_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/xman_1.0.3.bb
new file mode 100644
index 0000000..d1dcf65
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xman_1.0.3.bb
@@ -0,0 +1,11 @@
+require xorg-app-common.inc
+DESCRIPTION = "manual page browser for X"
+DEPENDS += " libxaw libxprintutil libxp libxt"
+RDEPENDS_${PN} = " man"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3d3a4b310a65ccce82472ef83acbbf97"
+SRC_URI[archive.sha256sum] = "38e03bfa2d3d109d55342e3539be952268e405fb458fb8c4f87739594a25394a"
+
+FILES_${PN} += " /usr/share/X11/xman.help"
diff --git a/recipes/obsolete/xorg/xorg-app/xmessage_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xmessage_1.0.1.bb
new file mode 100644
index 0000000..5ecfae0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xmessage_1.0.1.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "xmessage displays a message or query in a window."
+DEPENDS += " libxaw libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b3674c3a00a089764d86aa94e257ccec"
+SRC_URI[archive.sha256sum] = "b921aef62c2a2f5c32048502cd96630e9d42493cd39d1841fde247274f24bbda"
diff --git a/recipes/obsolete/xorg/xorg-app/xmodmap/autofoo.patch b/recipes/obsolete/xorg/xorg-app/xmodmap/autofoo.patch
new file mode 100644
index 0000000..f309add
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xmodmap/autofoo.patch
@@ -0,0 +1,109 @@
+diff -urN xmodmap.orig/Makefile.am xmodmap/Makefile.am
+--- xmodmap.orig/Makefile.am	1970-01-01 01:00:00.000000000 +0100
++++ xmodmap/Makefile.am	2004-08-31 19:49:33.000000000 +0200
+@@ -0,0 +1,53 @@
++# 
++#  $Id: Makefile.am,v 1.2 2004/06/25 19:38:50 markh Exp $
++# 
++#  Copyright © 2003 Keith Packard
++# 
++#  Permission to use, copy, modify, distribute, and sell this software and its
++#  documentation for any purpose is hereby granted without fee, provided that
++#  the above copyright notice appear in all copies and that both that
++#  copyright notice and this permission notice appear in supporting
++#  documentation, and that the name of Keith Packard not be used in
++#  advertising or publicity pertaining to distribution of the software without
++#  specific, written prior permission.  Keith Packard makes no
++#  representations about the suitability of this software for any purpose.  It
++#  is provided "as is" without express or implied warranty.
++# 
++#  KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
++#  INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
++#  EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
++#  CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
++#  DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
++#  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
++#  PERFORMANCE OF THIS SOFTWARE.
++#
++
++AUTOMAKE_OPTIONS = 1.7 foreign
++
++AM_CFLAGS = @XMODMAP_CFLAGS@
++
++bin_PROGRAMS = xmodmap
++
++xmodmap_SOURCES = exec.c handle.c pf.c wq.h xmodmap.c xmodmap.h
++
++xmodmap_LDADD = @XMODMAP_LIBS@
++
++man5_MANS=xmodmap.man
++
++EXTRA_DIST= $(man5_MANS)
++
++MAINTAINERCLEANFILES = configure \
++config.guess \
++config.sub \
++install-sh \
++ltmain.sh \
++missing \
++mkinstalldirs \
++aclocal.m4 \
++Makefile.in \
++depcomp \
++autoscan.log \
++configure.scan \
++config.h \
++config.h.in \
++$(man5_MANS)
+diff -urN xmodmap.orig/autogen.sh xmodmap/autogen.sh
+--- xmodmap.orig/autogen.sh	1970-01-01 01:00:00.000000000 +0100
++++ xmodmap/autogen.sh	2004-08-31 19:46:14.000000000 +0200
+@@ -0,0 +1,3 @@
++#! /bin/sh
++autoreconf -v --install || exit 1
++./configure --enable-maintainer-mode "$@"
+diff -urN xmodmap.orig/configure.ac xmodmap/configure.ac
+--- xmodmap.orig/configure.ac	1970-01-01 01:00:00.000000000 +0100
++++ xmodmap/configure.ac	2004-08-31 20:27:03.000000000 +0200
+@@ -0,0 +1,41 @@
++dnl
++dnl $Id: configure.ac,v 1.1 2003/10/09 06:16:59 keithp Exp $
++dnl
++dnl Copyright © 2003 Keith Packard
++dnl
++dnl Permission to use, copy, modify, distribute, and sell this software and its
++dnl documentation for any purpose is hereby granted without fee, provided that
++dnl the above copyright notice appear in all copies and that both that
++dnl copyright notice and this permission notice appear in supporting
++dnl documentation, and that the name of Keith Packard not be used in
++dnl advertising or publicity pertaining to distribution of the software without
++dnl specific, written prior permission.  Keith Packard makes no
++dnl representations about the suitability of this software for any purpose.  It
++dnl is provided "as is" without express or implied warranty.
++dnl
++dnl KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
++dnl INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
++dnl EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
++dnl CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
++dnl DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
++dnl TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
++dnl PERFORMANCE OF THIS SOFTWARE.
++dnl
++
++AC_PREREQ(2.57)
++AC_INIT([xmodmap],4.4.0,[],xmodmap)
++AC_CONFIG_SRCDIR([Makefile.am])
++AM_INIT_AUTOMAKE([dist-bzip2])
++AM_MAINTAINER_MODE
++AM_CONFIG_HEADER(config.h)
++
++AC_PROG_CC
++AC_PROG_INSTALL
++AC_PROG_LN_S
++AC_LIBTOOL_WIN32_DLL
++AM_PROG_LIBTOOL
++AC_PROG_MAKE_SET
++
++PKG_CHECK_MODULES(XMODMAP, x11)
++
++AC_OUTPUT([Makefile])
diff --git a/recipes/obsolete/xorg/xorg-app/xmodmap_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xmodmap_1.0.2.bb
new file mode 100644
index 0000000..17bbc7e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xmodmap_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "utility for modifying keymaps and pointer button mappings in X"
+LICENSE = "MIT"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ea78b3e32e27c3662f86ea68b3aec22f"
+SRC_URI[archive.sha256sum] = "4bed79ba6efcaabb3ce055cf88419a5190f8ab9d3408e7b14d722351cbaf4b44"
diff --git a/recipes/obsolete/xorg/xorg-app/xmodmap_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/xmodmap_1.0.3.bb
new file mode 100644
index 0000000..ab245b3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xmodmap_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "utility for modifying keymaps and pointer button mappings in X"
+LICENSE = "MIT"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "626731003ec22a74ecf9e44ed098bbdf"
+SRC_URI[archive.sha256sum] = "c3bfc724792858222c138c1ae9a017e69e7d3bdda3fc9f5da38b232ab031147f"
diff --git a/recipes/obsolete/xorg/xorg-app/xpr_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xpr_1.0.1.bb
new file mode 100644
index 0000000..5e70d01
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xpr_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "01c0a14755fc91369e8c011c9f881d5d"
+SRC_URI[archive.sha256sum] = "b871221d23dc4fc50398e9fe0e2a6a4e951aa6c9df2c5671d069ad88f0fd6249"
diff --git a/recipes/obsolete/xorg/xorg-app/xpr_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xpr_1.0.2.bb
new file mode 100644
index 0000000..f117bd8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xpr_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "print an X window dump"
+DEPENDS += " libxmu "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6b3a6896081f628bf5a2c9129417c86f"
+SRC_URI[archive.sha256sum] = "c325a9896d1cda43a681f1c2a6a2bbb1c580ade57a882b0a8f84ffa359238adf"
diff --git a/recipes/obsolete/xorg/xorg-app/xprop/autofoo.patch b/recipes/obsolete/xorg/xorg-app/xprop/autofoo.patch
new file mode 100644
index 0000000..2526d95
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xprop/autofoo.patch
@@ -0,0 +1,157 @@
+diff -urN xprop.orig/Makefile.am xprop/Makefile.am
+--- xprop.orig/Makefile.am	1970-01-01 01:00:00.000000000 +0100
++++ xprop/Makefile.am	2004-08-15 18:49:43.000000000 +0200
+@@ -0,0 +1,53 @@
++# 
++#  $Id: Makefile.am,v 1.2 2004/06/25 19:38:50 markh Exp $
++# 
++#  Copyright © 2003 Keith Packard
++# 
++#  Permission to use, copy, modify, distribute, and sell this software and its
++#  documentation for any purpose is hereby granted without fee, provided that
++#  the above copyright notice appear in all copies and that both that
++#  copyright notice and this permission notice appear in supporting
++#  documentation, and that the name of Keith Packard not be used in
++#  advertising or publicity pertaining to distribution of the software without
++#  specific, written prior permission.  Keith Packard makes no
++#  representations about the suitability of this software for any purpose.  It
++#  is provided "as is" without express or implied warranty.
++# 
++#  KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
++#  INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
++#  EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
++#  CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
++#  DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
++#  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
++#  PERFORMANCE OF THIS SOFTWARE.
++#
++
++AUTOMAKE_OPTIONS = 1.7 foreign
++
++AM_CFLAGS = @XPROP_CFLAGS@
++
++bin_PROGRAMS = xprop
++
++xprop_SOURCES = dsimple.c dsimple.h xprop.c
++
++xprop_LDADD = @XPROP_LIBS@
++
++man5_MANS=xprop.man
++
++EXTRA_DIST= $(man5_MANS)
++
++MAINTAINERCLEANFILES = configure \
++config.guess \
++config.sub \
++install-sh \
++ltmain.sh \
++missing \
++mkinstalldirs \
++aclocal.m4 \
++Makefile.in \
++depcomp \
++autoscan.log \
++configure.scan \
++config.h \
++config.h.in \
++$(man5_MANS)
+diff -urN xprop.orig/configure.ac xprop/configure.ac
+--- xprop.orig/configure.ac	1970-01-01 01:00:00.000000000 +0100
++++ xprop/configure.ac	2004-08-15 19:00:43.000000000 +0200
+@@ -0,0 +1,44 @@
++dnl
++dnl $Id: configure.ac,v 1.1 2003/10/09 06:16:59 keithp Exp $
++dnl
++dnl Copyright © 2003 Keith Packard
++dnl
++dnl Permission to use, copy, modify, distribute, and sell this software and its
++dnl documentation for any purpose is hereby granted without fee, provided that
++dnl the above copyright notice appear in all copies and that both that
++dnl copyright notice and this permission notice appear in supporting
++dnl documentation, and that the name of Keith Packard not be used in
++dnl advertising or publicity pertaining to distribution of the software without
++dnl specific, written prior permission.  Keith Packard makes no
++dnl representations about the suitability of this software for any purpose.  It
++dnl is provided "as is" without express or implied warranty.
++dnl
++dnl KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
++dnl INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
++dnl EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
++dnl CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
++dnl DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
++dnl TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
++dnl PERFORMANCE OF THIS SOFTWARE.
++dnl
++
++AC_PREREQ(2.57)
++AC_INIT([xprop],4.4.0,[],xprop)
++AC_CONFIG_SRCDIR([Makefile.am])
++AM_INIT_AUTOMAKE([dist-bzip2])
++AM_MAINTAINER_MODE
++AM_CONFIG_HEADER(config.h)
++
++AC_PROG_CC
++AC_PROG_INSTALL
++AC_PROG_LN_S
++AC_LIBTOOL_WIN32_DLL
++AM_PROG_LIBTOOL
++AC_PROG_MAKE_SET
++
++PKG_CHECK_MODULES(XPROP, xext xmuu x11)
++
++AC_CHECK_HEADERS([wchar.h])
++AC_CHECK_HEADERS([wctype.h])
++
++AC_OUTPUT([Makefile])
+diff -urN xprop.orig/dsimple.c xprop/dsimple.c
+--- xprop.orig/dsimple.c	2003-11-14 16:54:54.000000000 +0100
++++ xprop/dsimple.c	2004-08-15 19:19:32.000000000 +0200
+@@ -27,11 +27,16 @@
+ 
+ */
+ 
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
+ #include <X11/Xos.h>
+ #include <X11/Xlib.h>
+ #include <X11/Xutil.h>
+ #include <X11/cursorfont.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ /*
+  * Other_stuff.h: Definitions of routines in other_stuff.
+  *
+@@ -69,7 +74,7 @@
+ char *Malloc(size)
+      unsigned size;
+ {
+-	char *data, *malloc();
++	char *data;
+ 
+ 	if (!(data = malloc(size)))
+ 	  Fatal_Error("Out of memory!");
+@@ -85,7 +90,7 @@
+         char *ptr;
+         int size;
+ {
+-	char *new_ptr, *realloc();
++	char *new_ptr;
+ 
+ 	if (!ptr)
+ 	  return(Malloc(size));
+diff -urN xprop.orig/xprop.c xprop/xprop.c
+--- xprop.orig/xprop.c	2004-04-23 21:55:03.000000000 +0200
++++ xprop/xprop.c	2004-08-15 19:23:13.000000000 +0200
+@@ -30,6 +30,10 @@
+ /* $XFree86: xc/programs/xprop/xprop.c,v 1.15 2003/09/24 02:43:38 dawes Exp $ */
+ 
+ 
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
+ #include <X11/Xlib.h>
+ #include <X11/Xos.h>
+ #include <X11/Xfuncs.h>
diff --git a/recipes/obsolete/xorg/xorg-app/xprop_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xprop_1.0.2.bb
new file mode 100644
index 0000000..f57c8de
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xprop_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5b6f02a3b1cda0cadc35f84814fe53d4"
+SRC_URI[archive.sha256sum] = "88b1e65703c68f14ac6cb735737d1a0e52751a18fdc8a39d2d1e5eaa07875ca0"
diff --git a/recipes/obsolete/xorg/xorg-app/xprop_1.0.4.bb b/recipes/obsolete/xorg/xorg-app/xprop_1.0.4.bb
new file mode 100644
index 0000000..526db7b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xprop_1.0.4.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "a property displayer for X"
+DEPENDS += " libxmu "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "48aa8fd78802f477dcbf9ef0dfd9f783"
+SRC_URI[archive.sha256sum] = "daa47cba7d5a919ca1bd053d8a8b6af4904f77eded4bdb055cd915aa5f5cd772"
diff --git a/recipes/obsolete/xorg/xorg-app/xrandr_1.2.2.bb b/recipes/obsolete/xorg/xorg-app/xrandr_1.2.2.bb
new file mode 100644
index 0000000..b09b16b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xrandr_1.2.2.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Resize and Rotate extension command."
+LICENSE = "BSD-X"
+DEPENDS += "libxrandr libxrender"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://resolve_symbol_clash.patch"
+SRC_URI[archive.md5sum] = "c6ec9dc42396e3b3a2da932f3feca6ec"
+SRC_URI[archive.sha256sum] = "632f3ff492a07f8279807ffbafe4f89af069bb0e7b4934b3ddf7379509aa9303"
diff --git a/recipes/obsolete/xorg/xorg-app/xrandr_1.2.3.bb b/recipes/obsolete/xorg/xorg-app/xrandr_1.2.3.bb
new file mode 100644
index 0000000..6923ce3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xrandr_1.2.3.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "X Resize and Rotate extension command."
+LICENSE = "BSD-X"
+DEPENDS += "libxrandr libxrender"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://resolve_symbol_clash.patch"
+SRC_URI[archive.md5sum] = "41a9d0cc073fa6165a31fbf9e85f68a6"
+SRC_URI[archive.sha256sum] = "ab06b77f3a2b8866279e096f9d2702ac644681424eb0aec39e4eb7199f152207"
diff --git a/recipes/obsolete/xorg/xorg-app/xrdb/autofoo.patch b/recipes/obsolete/xorg/xorg-app/xrdb/autofoo.patch
new file mode 100644
index 0000000..b30a46b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xrdb/autofoo.patch
@@ -0,0 +1,132 @@
+diff -urN xrdb.orig/Imakefile xrdb/Imakefile
+--- xrdb.orig/Imakefile	2004-04-23 21:55:03.000000000 +0200
++++ xrdb/Imakefile	1970-01-01 01:00:00.000000000 +0100
+@@ -1,19 +0,0 @@
+-XCOMM $Xorg: Imakefile,v 1.3 2000/08/17 19:54:56 cpqbld Exp $
+-
+-
+-
+-
+-XCOMM $XFree86: xc/programs/xrdb/Imakefile,v 3.6tsi Exp $
+-
+-#ifdef PatheticCpp
+-        CPPDEFS = -DPATHETICCPP
+-#endif
+-#if HasMkstemp
+-        CPPDEFS = -DHAS_MKSTEMP
+-#endif
+-XCOMM Due to ill make parsing the cpp is passed directly in source file
+-        DEFINES = -DCPP="\"$(CPP)\"" $(CPPDEFS)
+-        DEPLIBS = $(DEPXMUULIB) $(DEPXONLYLIB)
+-LOCAL_LIBRARIES = $(XMUULIB) $(XONLYLIB)
+-
+-SimpleProgramTarget(xrdb)
+diff -urN xrdb.orig/Makefile.am xrdb/Makefile.am
+--- xrdb.orig/Makefile.am	1970-01-01 01:00:00.000000000 +0100
++++ xrdb/Makefile.am	2004-08-14 16:05:01.000000000 +0200
+@@ -0,0 +1,53 @@
++# 
++#  $Id: Makefile.am,v 1.2 2004/06/25 19:38:50 markh Exp $
++# 
++#  Copyright © 2003 Keith Packard
++# 
++#  Permission to use, copy, modify, distribute, and sell this software and its
++#  documentation for any purpose is hereby granted without fee, provided that
++#  the above copyright notice appear in all copies and that both that
++#  copyright notice and this permission notice appear in supporting
++#  documentation, and that the name of Keith Packard not be used in
++#  advertising or publicity pertaining to distribution of the software without
++#  specific, written prior permission.  Keith Packard makes no
++#  representations about the suitability of this software for any purpose.  It
++#  is provided "as is" without express or implied warranty.
++# 
++#  KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
++#  INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
++#  EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
++#  CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
++#  DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
++#  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
++#  PERFORMANCE OF THIS SOFTWARE.
++#
++
++AUTOMAKE_OPTIONS = 1.7 foreign
++
++AM_CFLAGS = @XRDB_CFLAGS@
++
++bin_PROGRAMS = xrdb
++
++xrdb_SOURCES = xrdb.c
++
++xrdb_LDADD = @XRDB_LIBS@
++
++man5_MANS=xrdb.man
++
++EXTRA_DIST= $(man5_MANS)
++
++MAINTAINERCLEANFILES = configure \
++config.guess \
++config.sub \
++install-sh \
++ltmain.sh \
++missing \
++mkinstalldirs \
++aclocal.m4 \
++Makefile.in \
++depcomp \
++autoscan.log \
++configure.scan \
++config.h \
++config.h.in \
++$(man5_MANS)
+diff -urN xrdb.orig/autogen.sh xrdb/autogen.sh
+--- xrdb.orig/autogen.sh	1970-01-01 01:00:00.000000000 +0100
++++ xrdb/autogen.sh	2004-08-14 15:57:35.000000000 +0200
+@@ -0,0 +1,3 @@
++#! /bin/sh
++autoreconf -v --install || exit 1
++./configure --enable-maintainer-mode "$@"
+diff -urN xrdb.orig/configure.ac xrdb/configure.ac
+--- xrdb.orig/configure.ac	1970-01-01 01:00:00.000000000 +0100
++++ xrdb/configure.ac	2004-08-14 16:03:31.000000000 +0200
+@@ -0,0 +1,41 @@
++dnl
++dnl $Id: configure.ac,v 1.1 2003/10/09 06:16:59 keithp Exp $
++dnl
++dnl Copyright © 2003 Keith Packard
++dnl
++dnl Permission to use, copy, modify, distribute, and sell this software and its
++dnl documentation for any purpose is hereby granted without fee, provided that
++dnl the above copyright notice appear in all copies and that both that
++dnl copyright notice and this permission notice appear in supporting
++dnl documentation, and that the name of Keith Packard not be used in
++dnl advertising or publicity pertaining to distribution of the software without
++dnl specific, written prior permission.  Keith Packard makes no
++dnl representations about the suitability of this software for any purpose.  It
++dnl is provided "as is" without express or implied warranty.
++dnl
++dnl KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
++dnl INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
++dnl EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
++dnl CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
++dnl DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
++dnl TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
++dnl PERFORMANCE OF THIS SOFTWARE.
++dnl
++
++AC_PREREQ(2.57)
++AC_INIT([xrdb],4.4.0,[],xrdb)
++AC_CONFIG_SRCDIR([Makefile.am])
++AM_INIT_AUTOMAKE([dist-bzip2])
++AM_MAINTAINER_MODE
++AM_CONFIG_HEADER(config.h)
++
++AC_PROG_CC
++AC_PROG_INSTALL
++AC_PROG_LN_S
++AC_LIBTOOL_WIN32_DLL
++AM_PROG_LIBTOOL
++AC_PROG_MAKE_SET
++
++PKG_CHECK_MODULES(XRDB, xext xmuu x11)
++
++AC_OUTPUT([Makefile])
diff --git a/recipes/obsolete/xorg/xorg-app/xrdb_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/xrdb_1.0.3.bb
new file mode 100644
index 0000000..6c4d86d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xrdb_1.0.3.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X server resource database utility"
+LICENSE = "xrdb"
+DEPENDS += "libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "380b2ef545306354cc150834de567be7"
+SRC_URI[archive.sha256sum] = "a4a3b8cd821adc201a072f8c0214d73ee6a7e7b898de90e18f7d89a4453fb12c"
diff --git a/recipes/obsolete/xorg/xorg-app/xrdb_1.0.4.bb b/recipes/obsolete/xorg/xorg-app/xrdb_1.0.4.bb
new file mode 100644
index 0000000..7181dc9
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xrdb_1.0.4.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X server resource database utility"
+LICENSE = "xrdb"
+DEPENDS += "libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "34eb2311a0c5279e7b4f492e826f63d1"
+SRC_URI[archive.sha256sum] = "3f8cde77e8cbeb6d0a5f232b7a2ee51dd49b677916d52ab0986d320a5f9e8000"
diff --git a/recipes/obsolete/xorg/xorg-app/xrdb_1.0.5.bb b/recipes/obsolete/xorg/xorg-app/xrdb_1.0.5.bb
new file mode 100644
index 0000000..d474dc8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xrdb_1.0.5.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "X server resource database utility"
+LICENSE = "xrdb"
+DEPENDS += "libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9c30b8e1709d5367beb7706146640c07"
+SRC_URI[archive.sha256sum] = "c24d08939250f10238fd1b984707bfa0901ba9c55fa36b67d91eb12b500500aa"
diff --git a/recipes/obsolete/xorg/xorg-app/xrefresh_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xrefresh_1.0.2.bb
new file mode 100644
index 0000000..a97f1af
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xrefresh_1.0.2.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1228f890f86148e4e6ae22aa73118cbb"
+SRC_URI[archive.sha256sum] = "522831fd29c0b250f29735a01b02e96e311f200a675e45c8b3d187b6f86b32f5"
diff --git a/recipes/obsolete/xorg/xorg-app/xrx_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xrx_1.0.1.bb
new file mode 100644
index 0000000..25f0c80
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xrx_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt libxext xtrans xproxymngproto libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5f65e24f8a225e255beb2059e33d6b37"
+SRC_URI[archive.sha256sum] = "a51ac7c607f2f79de771807f590ccfe8b1819dae6f30dd615dd2afbe6007c4e4"
diff --git a/recipes/obsolete/xorg/xorg-app/xset/autofoo.patch b/recipes/obsolete/xorg/xorg-app/xset/autofoo.patch
new file mode 100644
index 0000000..039d131
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xset/autofoo.patch
@@ -0,0 +1,109 @@
+diff -urN xset.orig/Makefile.am xset/Makefile.am
+--- xset.orig/Makefile.am	1970-01-01 01:00:00.000000000 +0100
++++ xset/Makefile.am	2004-08-14 16:32:10.000000000 +0200
+@@ -0,0 +1,53 @@
++# 
++#  $Id: Makefile.am,v 1.2 2004/06/25 19:38:50 markh Exp $
++# 
++#  Copyright © 2003 Keith Packard
++# 
++#  Permission to use, copy, modify, distribute, and sell this software and its
++#  documentation for any purpose is hereby granted without fee, provided that
++#  the above copyright notice appear in all copies and that both that
++#  copyright notice and this permission notice appear in supporting
++#  documentation, and that the name of Keith Packard not be used in
++#  advertising or publicity pertaining to distribution of the software without
++#  specific, written prior permission.  Keith Packard makes no
++#  representations about the suitability of this software for any purpose.  It
++#  is provided "as is" without express or implied warranty.
++# 
++#  KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
++#  INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
++#  EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
++#  CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
++#  DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
++#  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
++#  PERFORMANCE OF THIS SOFTWARE.
++#
++
++AUTOMAKE_OPTIONS = 1.7 foreign
++
++AM_CFLAGS = @XSET_CFLAGS@
++
++bin_PROGRAMS = xset
++
++xset_SOURCES = xset.c
++
++xset_LDADD = @XSET_LIBS@
++
++man5_MANS=xset.man
++
++EXTRA_DIST= $(man5_MANS)
++
++MAINTAINERCLEANFILES = configure \
++config.guess \
++config.sub \
++install-sh \
++ltmain.sh \
++missing \
++mkinstalldirs \
++aclocal.m4 \
++Makefile.in \
++depcomp \
++autoscan.log \
++configure.scan \
++config.h \
++config.h.in \
++$(man5_MANS)
+diff -urN xset.orig/autogen.sh xset/autogen.sh
+--- xset.orig/autogen.sh	1970-01-01 01:00:00.000000000 +0100
++++ xset/autogen.sh	2004-08-14 16:27:56.000000000 +0200
+@@ -0,0 +1,3 @@
++#! /bin/sh
++autoreconf -v --install || exit 1
++./configure --enable-maintainer-mode "$@"
+diff -urN xset.orig/configure.ac xset/configure.ac
+--- xset.orig/configure.ac	1970-01-01 01:00:00.000000000 +0100
++++ xset/configure.ac	2004-08-17 14:21:25.000000000 +0200
+@@ -0,0 +1,41 @@
++dnl
++dnl $Id: configure.ac,v 1.1 2003/10/09 06:16:59 keithp Exp $
++dnl
++dnl Copyright © 2003 Keith Packard
++dnl
++dnl Permission to use, copy, modify, distribute, and sell this software and its
++dnl documentation for any purpose is hereby granted without fee, provided that
++dnl the above copyright notice appear in all copies and that both that
++dnl copyright notice and this permission notice appear in supporting
++dnl documentation, and that the name of Keith Packard not be used in
++dnl advertising or publicity pertaining to distribution of the software without
++dnl specific, written prior permission.  Keith Packard makes no
++dnl representations about the suitability of this software for any purpose.  It
++dnl is provided "as is" without express or implied warranty.
++dnl
++dnl KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
++dnl INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
++dnl EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
++dnl CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
++dnl DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
++dnl TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
++dnl PERFORMANCE OF THIS SOFTWARE.
++dnl
++
++AC_PREREQ(2.57)
++AC_INIT([xset],4.4.0,[],xset)
++AC_CONFIG_SRCDIR([Makefile.am])
++AM_INIT_AUTOMAKE([dist-bzip2])
++AM_MAINTAINER_MODE
++AM_CONFIG_HEADER(config.h)
++
++AC_PROG_CC
++AC_PROG_INSTALL
++AC_PROG_LN_S
++AC_LIBTOOL_WIN32_DLL
++AM_PROG_LIBTOOL
++AC_PROG_MAKE_SET
++
++PKG_CHECK_MODULES(XSET, xext xextensions xmuu x11)
++
++AC_OUTPUT([Makefile])
diff --git a/recipes/obsolete/xorg/xorg-app/xset/disable-xkb.patch b/recipes/obsolete/xorg/xorg-app/xset/disable-xkb.patch
new file mode 100644
index 0000000..6060fbb
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xset/disable-xkb.patch
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
diff --git a/recipes/obsolete/xorg/xorg-app/xset_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xset_1.0.2.bb
new file mode 100644
index 0000000..35aebe5
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xset_1.0.2.bb
@@ -0,0 +1,14 @@
+require xorg-app-common.inc
+DESCRIPTION = "user preference utility for X"
+LICENSE = "MIT"
+DEPENDS += "libxext libxxf86misc libxfontcache libxmu libxp libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://disable-xkb.patch"
+SRC_URI[archive.md5sum] = "1b781a0802c7b8fb9619a6665607b3f0"
+SRC_URI[archive.sha256sum] = "ce1e17c513a4499526e648a59c39ba01777c99c86093433cf392f27654b795c9"
+
+EXTRA_OECONF = "--disable-xkb"
+
+CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/obsolete/xorg/xorg-app/xset_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/xset_1.0.3.bb
new file mode 100644
index 0000000..c37b4bb
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xset_1.0.3.bb
@@ -0,0 +1,14 @@
+require xorg-app-common.inc
+DESCRIPTION = "user preference utility for X"
+LICENSE = "MIT"
+DEPENDS += "libxext libxxf86misc libxfontcache libxmu libxp libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://disable-xkb.patch"
+SRC_URI[archive.md5sum] = "657bbb43ce5470c33665d187c1740566"
+SRC_URI[archive.sha256sum] = "0e3fd7d9902442df13c954316a194251e9b9acc197ae939d8b2fae66b8864d11"
+
+EXTRA_OECONF = "--disable-xkb"
+
+CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/obsolete/xorg/xorg-app/xset_1.0.4.bb b/recipes/obsolete/xorg/xorg-app/xset_1.0.4.bb
new file mode 100644
index 0000000..24c35e0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xset_1.0.4.bb
@@ -0,0 +1,14 @@
+require xorg-app-common.inc
+DESCRIPTION = "user preference utility for X"
+LICENSE = "MIT"
+DEPENDS += "libxext libxxf86misc libxfontcache libxmu libxp libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://disable-xkb.patch"
+SRC_URI[archive.md5sum] = "2f41fd983ba4d89419204854936025e2"
+SRC_URI[archive.sha256sum] = "6c3e74bb36beab92b918f0db12198d2526675276c724558a1de71d7789d0bdad"
+
+EXTRA_OECONF = "--disable-xkb"
+
+CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/obsolete/xorg/xorg-app/xsetpointer_1.0.0.bb b/recipes/obsolete/xorg/xorg-app/xsetpointer_1.0.0.bb
new file mode 100644
index 0000000..409ea16
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xsetpointer_1.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxi "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c94ea103e27e370e4e5030e50c5d5d69"
+SRC_URI[archive.sha256sum] = "7d65f450420b4f764dcf38e4ccee9d608b5a5874706e716cb861bfe2586b7d4a"
diff --git a/recipes/obsolete/xorg/xorg-app/xsetroot_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xsetroot_1.0.1.bb
new file mode 100644
index 0000000..c81a319
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xsetroot_1.0.1.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "Sets the visual appearance of the X root window"
+LICENSE = "MIT"
+DEPENDS += "libxmu xbitmaps"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fc7eeb7130bb54345671a9dbaab567ac"
+SRC_URI[archive.sha256sum] = "897d77acd3f4a366472386139827eaac24cc423c811ef0e65e0d5eca099a3155"
diff --git a/recipes/obsolete/xorg/xorg-app/xsetroot_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xsetroot_1.0.2.bb
new file mode 100644
index 0000000..dc79d52
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xsetroot_1.0.2.bb
@@ -0,0 +1,9 @@
+require xorg-app-common.inc
+DESCRIPTION = "Sets the visual appearance of the X root window"
+LICENSE = "MIT"
+DEPENDS += "libxmu xbitmaps"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9af7db9f3052aef0b11636720b3101dd"
+SRC_URI[archive.sha256sum] = "4f9a751f4830d479fae8ccb68ed04896dc99612789310b7917bd15c04aa3351d"
diff --git a/recipes/obsolete/xorg/xorg-app/xvinfo_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xvinfo_1.0.1.bb
new file mode 100644
index 0000000..ee77b80
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xvinfo_1.0.1.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "Print out X-Video extension adaptor information"
+DEPENDS += " libxv"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0a5bd8e43de6eb8ff5b5bc673204401d"
+SRC_URI[archive.sha256sum] = "439b3c7ad96fc7b1ef9156c716e10b607883a9a58b777f8dc02f03284eb33fb3"
diff --git a/recipes/obsolete/xorg/xorg-app/xvinfo_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xvinfo_1.0.2.bb
new file mode 100644
index 0000000..8422d34
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xvinfo_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "Print out X-Video extension adaptor information"
+DEPENDS += " libxv"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e1e318436f49e2f0f3764593dadd9ad2"
+SRC_URI[archive.sha256sum] = "126e2a612ac723f9688904fcfa612688d62e520ce55c56eb34eb5390074cf150"
diff --git a/recipes/obsolete/xorg/xorg-app/xwd_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xwd_1.0.1.bb
new file mode 100644
index 0000000..bfe181b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xwd_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "911addfb7fa402217ddac63e5c1d97c7"
+SRC_URI[archive.sha256sum] = "c8bd9bcd64df439c2cd09eaa3e83a1297fbfed5c7d3dd8117342b3a25eeae131"
diff --git a/recipes/obsolete/xorg/xorg-app/xwd_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xwd_1.0.2.bb
new file mode 100644
index 0000000..597aa05
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xwd_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0a6ef08a2ac08ad5c4dd1522eb3788a3"
+SRC_URI[archive.sha256sum] = "ab8974e010c1957a9a65a54656215463dea324adcaa9954147ecdcc6e9307f61"
diff --git a/recipes/obsolete/xorg/xorg-app/xwininfo_1.0.2.bb b/recipes/obsolete/xorg/xorg-app/xwininfo_1.0.2.bb
new file mode 100644
index 0000000..288af54
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xwininfo_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu libxext "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e5dbc8866a55958297f5f38205b6be1e"
+SRC_URI[archive.sha256sum] = "9fdfd3259b335531cdba831872ec0e32c5f6df01e14b87c3187b494be75b7b66"
diff --git a/recipes/obsolete/xorg/xorg-app/xwininfo_1.0.3.bb b/recipes/obsolete/xorg/xorg-app/xwininfo_1.0.3.bb
new file mode 100644
index 0000000..01f6c9b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xwininfo_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "window information utility for X"
+DEPENDS += " libxmu libxext "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "721f84332c98c33152460bb22ba9ded6"
+SRC_URI[archive.sha256sum] = "fbe3a1aafbc6fa113e58971ff2a82605a7e106af8b810eea4b7512de58a5478a"
diff --git a/recipes/obsolete/xorg/xorg-app/xwininfo_1.0.4.bb b/recipes/obsolete/xorg/xorg-app/xwininfo_1.0.4.bb
new file mode 100644
index 0000000..317aa1d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xwininfo_1.0.4.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxmu libxext "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e2a9bf5ab7f2a0866700a3b49dd8c6bf"
+SRC_URI[archive.sha256sum] = "df9a52788632cd3338e7bd7107ac732b11b8e2c367d4600578cd77e350428ee4"
diff --git a/recipes/obsolete/xorg/xorg-app/xwud_1.0.1.bb b/recipes/obsolete/xorg/xorg-app/xwud_1.0.1.bb
new file mode 100644
index 0000000..53d06df
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-app/xwud_1.0.1.bb
@@ -0,0 +1,6 @@
+require xorg-app-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6e3c5d0297d88e890b6f5df31f73dd60"
+SRC_URI[archive.sha256sum] = "d2de2d39b4479e23adc92d131f66e87db41441aae11b72991bb01d5f6c93336c"
diff --git a/recipes/xorg-app/appres_1.0.1.bb b/recipes/xorg-app/appres_1.0.1.bb
deleted file mode 100644
index 698b7c4..0000000
--- a/recipes/xorg-app/appres_1.0.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "The appres program prints the resources seen by an application."
-DEPENDS += " libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "420e6cdf38bb771ec8b00228bf09e8ff"
-SRC_URI[archive.sha256sum] = "15fef83a202b8dcee3420c88dba4aeed1f8fc840ab537487fb5411b99a2eb962"
diff --git a/recipes/xorg-app/bdftopcf_1.0.1.bb b/recipes/xorg-app/bdftopcf_1.0.1.bb
deleted file mode 100644
index d5ddd50..0000000
--- a/recipes/xorg-app/bdftopcf_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "converts BDF fonts to PCF fonts"
-DEPENDS += " libxfont"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "9685fab33d39954ab8a0d22e0969d5a4"
-SRC_URI[archive.sha256sum] = "aaaa45ab361781aebda2093fdc7eb5c187f6215b4ba308dd6b9ff2b727e805d3"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/beforelight_1.0.2.bb b/recipes/xorg-app/beforelight_1.0.2.bb
deleted file mode 100644
index 09852db..0000000
--- a/recipes/xorg-app/beforelight_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxscrnsaver libxt libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8bc2e35cdcd2e6a80eab1b77c41f2a46"
-SRC_URI[archive.sha256sum] = "00e217559c93779fe04fd948017820af118a3981d6b4371ace95107cb3b047a7"
diff --git a/recipes/xorg-app/bitmap_1.0.2.bb b/recipes/xorg-app/bitmap_1.0.2.bb
deleted file mode 100644
index 70be2aa..0000000
--- a/recipes/xorg-app/bitmap_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu xbitmaps libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "78e8ab5c1830e2cdfbff7a952162a5a7"
-SRC_URI[archive.sha256sum] = "83719927ac4309f42e3cadde125a52cfba2e9c951115ac4c017f292f6e4c14bc"
diff --git a/recipes/xorg-app/bitmap_1.0.3.bb b/recipes/xorg-app/bitmap_1.0.3.bb
deleted file mode 100644
index 9a83106..0000000
--- a/recipes/xorg-app/bitmap_1.0.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu xbitmaps libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "98200c358e5401d648b980564d9ae39d"
-SRC_URI[archive.sha256sum] = "863f673518af19f9ae35ee221b30bf8c8b695c76c543d18b3ac400a51b855c41"
diff --git a/recipes/xorg-app/constype_1.0.1.bb b/recipes/xorg-app/constype_1.0.1.bb
deleted file mode 100644
index d8a957b..0000000
--- a/recipes/xorg-app/constype_1.0.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "print an X window dump"
-DEPENDS += " libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9f99bee77ff3c565b4898663810fbef5"
-SRC_URI[archive.sha256sum] = "11403054cb407cdf31da48216f55d1b5943798cb442bcab69faa0a3d7d167541"
diff --git a/recipes/xorg-app/editres_1.0.2.bb b/recipes/xorg-app/editres_1.0.2.bb
deleted file mode 100644
index 23956d3..0000000
--- a/recipes/xorg-app/editres_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxt libxmu libxaw"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9db49742bd4c17966fff7d76ac566d31"
-SRC_URI[archive.sha256sum] = "978fbc134eef3da8a5f363c9e93494a3d7399e8f2b435ac6b1f2c63f09c167df"
diff --git a/recipes/xorg-app/editres_1.0.3.bb b/recipes/xorg-app/editres_1.0.3.bb
deleted file mode 100644
index 56cadc1..0000000
--- a/recipes/xorg-app/editres_1.0.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxt libxmu libxaw"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a25f931cc6c8d03daaed434f5db5df2d"
-SRC_URI[archive.sha256sum] = "a2a56b32eaa92ad6f667853f023177ffad9128cfa0361afc2872323598aeceae"
diff --git a/recipes/xorg-app/fonttosfnt_1.0.3.bb b/recipes/xorg-app/fonttosfnt_1.0.3.bb
deleted file mode 100644
index 71e147c..0000000
--- a/recipes/xorg-app/fonttosfnt_1.0.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " xproto freetype libfontenc"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b0ebd86029571239b9d7b0c61191b591"
-SRC_URI[archive.sha256sum] = "9d2b0149ea49a097ab6c563801c06af9975e98f9fa4c8af1a8ac3238e4fd5243"
diff --git a/recipes/xorg-app/fslsfonts_1.0.1.bb b/recipes/xorg-app/fslsfonts_1.0.1.bb
deleted file mode 100644
index c1040ad..0000000
--- a/recipes/xorg-app/fslsfonts_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libfs"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c7b2f8a938749d41dc86db6bd1e6a4ca"
-SRC_URI[archive.sha256sum] = "3feb006a25f36856924e26249fe84b27142678f97175780960f085e1e263a62e"
diff --git a/recipes/xorg-app/fstobdf_1.0.2.bb b/recipes/xorg-app/fstobdf_1.0.2.bb
deleted file mode 100644
index 6c3148c..0000000
--- a/recipes/xorg-app/fstobdf_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libfs"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "99144743ab3cbb9cf37090fdc9e747db"
-SRC_URI[archive.sha256sum] = "690e45b252cd96036dd9b89af8624eb423e16d4bd662b07d264a3f876ce7ac22"
diff --git a/recipes/xorg-app/iceauth_1.0.2.bb b/recipes/xorg-app/iceauth_1.0.2.bb
deleted file mode 100644
index bcda802..0000000
--- a/recipes/xorg-app/iceauth_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a tool for manipulating ICE protocol authorization records"
-DEPENDS += " libice"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7ab8b64edf0212a9d9a3c8129901a450"
-SRC_URI[archive.sha256sum] = "06401591de57a2c4cf2255e3d5230ea19351c5516cf8dae98c61092392bab5bb"
diff --git a/recipes/xorg-app/lbxproxy_1.0.1.bb b/recipes/xorg-app/lbxproxy_1.0.1.bb
deleted file mode 100644
index 7b35f1b..0000000
--- a/recipes/xorg-app/lbxproxy_1.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "Applications that would like to take advantage of the Low Bandwidth \
-extension to X (LBX) must make their connections to an lbxproxy."
-DEPENDS += " xtrans libxext liblbxutil libice xproxymngproto bigreqsproto zlib"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9d5045a5c76b1fe360221b967a5aa0e9"
-SRC_URI[archive.sha256sum] = "e2e757986724a5d2ee299aa7616a3d9985af45e363021b486b7abbcac4ca01c2"
diff --git a/recipes/xorg-app/luit_1.0.2.bb b/recipes/xorg-app/luit_1.0.2.bb
deleted file mode 100644
index d8c3475..0000000
--- a/recipes/xorg-app/luit_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " zlib zlib libfontenc"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "aacda46598ce3af8ca16e2a8132db1b2"
-SRC_URI[archive.sha256sum] = "c0c4d76df0350c626df7ce62bf3df7915f9959557d76abce96222857d782389c"
diff --git a/recipes/xorg-app/luit_1.0.3.bb b/recipes/xorg-app/luit_1.0.3.bb
deleted file mode 100644
index 4baac79..0000000
--- a/recipes/xorg-app/luit_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a filter for locale and ISO 2022 support on Unicode terminals"
-DEPENDS += " zlib zlib libfontenc"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b01e4f71c20fc1c79ed727759c1df40c"
-SRC_URI[archive.sha256sum] = "2010f2152eee89a67f02edc3041574fb07442d075ca46fbcf84f981f0977a5d7"
diff --git a/recipes/xorg-app/mkcomposecache_1.2.bb b/recipes/xorg-app/mkcomposecache_1.2.bb
deleted file mode 100644
index 8de1fad..0000000
--- a/recipes/xorg-app/mkcomposecache_1.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "used for creating global (system-wide) Compose cache files"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c8237b4aea1ae0c15441deab6b12c5c0"
-SRC_URI[archive.sha256sum] = "8c34cdd03f7d11ac86c681349d39a4faf88854faaad928f0663da55f125aedfb"
diff --git a/recipes/xorg-app/mkfontdir_1.0.3.bb b/recipes/xorg-app/mkfontdir_1.0.3.bb
deleted file mode 100644
index e3d1782..0000000
--- a/recipes/xorg-app/mkfontdir_1.0.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a program to create an index of X font files in a directory"
-RDEPENDS_${PN} += "mkfontscale"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "4d0f89a23f77e22f1671a77bf0898955"
-SRC_URI[archive.sha256sum] = "2a786e03611a53c7f6263db446c0c9ef76e94bcf930b0b5867cc6a9c19653074"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/mkfontdir_1.0.4.bb b/recipes/xorg-app/mkfontdir_1.0.4.bb
deleted file mode 100644
index dbc0884..0000000
--- a/recipes/xorg-app/mkfontdir_1.0.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a program to create an index of X font files in a directory"
-RDEPENDS_${PN} += "mkfontscale"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "35394bf3f746a57fba624dba52fdbba3"
-SRC_URI[archive.sha256sum] = "6f9a3cc70d27704ee8e4ff01d5d69c974b059fd7e470172b68cfa477c7caf8e3"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/mkfontscale_1.0.3.bb b/recipes/xorg-app/mkfontscale_1.0.3.bb
deleted file mode 100644
index 10d511f..0000000
--- a/recipes/xorg-app/mkfontscale_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a program to create an index of scalable font files for X"
-DEPENDS += " zlib libfontenc freetype "
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "1d608771aca9695b828cec1e34178fd1"
-SRC_URI[archive.sha256sum] = "0458a3a5525b4ab458a018648ef8575afc191f904364c00e27876a7bd53af020"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/mkfontscale_1.0.4.bb b/recipes/xorg-app/mkfontscale_1.0.4.bb
deleted file mode 100644
index 6a29088..0000000
--- a/recipes/xorg-app/mkfontscale_1.0.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a program to create an index of scalable font files for X"
-DEPENDS += " zlib libfontenc freetype "
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "e5d7373c4266973b3b13aac5d1a4655b"
-SRC_URI[archive.sha256sum] = "dc9b946cc23490c960fbca8b32e4bba4bc23ce404a8d7e1c0e916894c83b4227"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/mkfontscale_1.0.5.bb b/recipes/xorg-app/mkfontscale_1.0.5.bb
deleted file mode 100644
index 5e37e8e..0000000
--- a/recipes/xorg-app/mkfontscale_1.0.5.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a program to create an index of scalable font files for X"
-DEPENDS += " zlib libfontenc freetype "
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "5e6e210b70adfef1264b0212aab1f758"
-SRC_URI[archive.sha256sum] = "f79dff54153dc3beb9eb3f2e4776dbc55ed2a4d3d0adbf9c8a2d9eb230ed3850"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/rgb_1.0.1.bb b/recipes/xorg-app/rgb_1.0.1.bb
deleted file mode 100644
index c78047f..0000000
--- a/recipes/xorg-app/rgb_1.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " xproto util-macros"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "255222b3ab3af671289a6b4844e9f393"
-SRC_URI[archive.sha256sum] = "f635bc02f72f62c248af8a19aa6931e9f2d061cca258c12c1468d486602990ad"
-
-FILES_${PN} += "${datadir}/X11"
diff --git a/recipes/xorg-app/rstart_1.0.2.bb b/recipes/xorg-app/rstart_1.0.2.bb
deleted file mode 100644
index 2f17f8a..0000000
--- a/recipes/xorg-app/rstart_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "99aea04a27197056368a4431f30f9cdb"
-SRC_URI[archive.sha256sum] = "02fc48b5069018e4262f0e5ebb669acedc04167307c98f0fdb2ca22e568e9596"
diff --git a/recipes/xorg-app/sessreg_1.0.2.bb b/recipes/xorg-app/sessreg_1.0.2.bb
deleted file mode 100644
index e7bede7..0000000
--- a/recipes/xorg-app/sessreg_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "bee5d87d40615e67c84ab0b0c65049ba"
-SRC_URI[archive.sha256sum] = "c23c12259854c7cec6d19bf397afff4a542a22170b14de73b321aa8cafcf3a86"
diff --git a/recipes/xorg-app/sessreg_1.0.3.bb b/recipes/xorg-app/sessreg_1.0.3.bb
deleted file mode 100644
index 5482af9..0000000
--- a/recipes/xorg-app/sessreg_1.0.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "07665816f2623ec82e665fb7d31c6cef"
-SRC_URI[archive.sha256sum] = "7d0c145d53246ddf09fc749f91324897ed9a3da0064808f99b789c37470080dc"
diff --git a/recipes/xorg-app/sessreg_1.0.4.bb b/recipes/xorg-app/sessreg_1.0.4.bb
deleted file mode 100644
index 9738608..0000000
--- a/recipes/xorg-app/sessreg_1.0.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a simple program for managing utmp/wtmp entries"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "839e968d7197b9563f0fd8a5a3aac2e3"
-SRC_URI[archive.sha256sum] = "23e163502e208ac16f04a12b15f7f8dcd9919f0149c714353b7f92539b7e9802"
diff --git a/recipes/xorg-app/setxkbmap_1.0.3.bb b/recipes/xorg-app/setxkbmap_1.0.3.bb
deleted file mode 100644
index f9434d7..0000000
--- a/recipes/xorg-app/setxkbmap_1.0.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxkbfile "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2b53542095a35a8a5731164118643883"
-SRC_URI[archive.sha256sum] = "086f67c8272ceca059c64e127dbdb66ccad8de6f532aee02d22786543718a508"
diff --git a/recipes/xorg-app/setxkbmap_1.0.4.bb b/recipes/xorg-app/setxkbmap_1.0.4.bb
deleted file mode 100644
index 8a9558b..0000000
--- a/recipes/xorg-app/setxkbmap_1.0.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxkbfile "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6fab3bb176be9e510c5613d054ef1ca4"
-SRC_URI[archive.sha256sum] = "9b5b139238419757d57de584c2ad30b853367245eef49221ce02a3b403cf2bac"
diff --git a/recipes/xorg-app/showfont_1.0.1.bb b/recipes/xorg-app/showfont_1.0.1.bb
deleted file mode 100644
index a5ffa3a..0000000
--- a/recipes/xorg-app/showfont_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libfs"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "339b2faf1ca5114fda414338e15b6e21"
-SRC_URI[archive.sha256sum] = "87db3cf12914abc6b074d12b35c7f39c8fd7b5d3933b339e2c1260a51061760c"
diff --git a/recipes/xorg-app/smproxy_1.0.2.bb b/recipes/xorg-app/smproxy_1.0.2.bb
deleted file mode 100644
index 0ef6033..0000000
--- a/recipes/xorg-app/smproxy_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxt libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "31da204a0255ba8c6a65386e65dc1c90"
-SRC_URI[archive.sha256sum] = "76d22f0cf07c8c4386a15c5c935b58319bd747befb940a0f03f652d59c4f67d2"
diff --git a/recipes/xorg-app/twm_1.0.3.bb b/recipes/xorg-app/twm_1.0.3.bb
deleted file mode 100644
index feaebdd..0000000
--- a/recipes/xorg-app/twm_1.0.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "tiny window manager"
-DEPENDS += " libxext libxt libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a56b71dc40249195b32b304633c28a3e"
-SRC_URI[archive.sha256sum] = "5b41550477a893bf2b82ab73fc7fb6c839ba52d0deac059be1a473dd7bb92a4e"
-
-ALTERNATIVE_NAME = "x-window-manager"
-ALTERNATIVE_PATH = "${bindir}/twm"
-ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PRIORITY = "1"
diff --git a/recipes/xorg-app/x11perf_1.4.1.bb b/recipes/xorg-app/x11perf_1.4.1.bb
deleted file mode 100644
index 7c61228..0000000
--- a/recipes/xorg-app/x11perf_1.4.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X11 server performance test program"
-DEPENDS += "libxmu libxrender libxft libxext fontconfig"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fd06c8b8e3572a0e14af65a49e0dd7d1"
-SRC_URI[archive.sha256sum] = "c81819618ec596fda55b950ef80f2ee02e5ce149ea99f1f741cedb459b4d3064"
diff --git a/recipes/xorg-app/x11perf_1.5.bb b/recipes/xorg-app/x11perf_1.5.bb
deleted file mode 100644
index 9cff277..0000000
--- a/recipes/xorg-app/x11perf_1.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X11 server performance test program"
-DEPENDS += "libxmu libxrender libxft libxext fontconfig"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "31283bfc3c78718ac1bd71e510d4e774"
-SRC_URI[archive.sha256sum] = "4729da53dde0b7e1748db4bb771f9b7aaf2e2b1e67293a3a5b96d54043ce1233"
-
-FILES_${PN} += "/usr/lib/X11/x11perfcomp/*"
diff --git a/recipes/xorg-app/xauth_1.0.2.bb b/recipes/xorg-app/xauth_1.0.2.bb
deleted file mode 100644
index bd391a2..0000000
--- a/recipes/xorg-app/xauth_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X authority file utility"
-DEPENDS += "libxau libxext libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "31b956edaeb453ddaa640420e97b25b2"
-SRC_URI[archive.sha256sum] = "569e5a581e5eb16abf1c04a66da22c6dade14578ab34e5e78b8724bb655f1f17"
diff --git a/recipes/xorg-app/xauth_1.0.3.bb b/recipes/xorg-app/xauth_1.0.3.bb
deleted file mode 100644
index 7adb51d..0000000
--- a/recipes/xorg-app/xauth_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X authority file utility"
-DEPENDS += "libxau libxext libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e91e10ace1df0d5f2cbc74ead256407a"
-SRC_URI[archive.sha256sum] = "1fd18b53fda74ea4649eb9577b1cf86538a25d171f10251eeb30d11cdd5bda8c"
diff --git a/recipes/xorg-app/xbacklight_1.1.bb b/recipes/xorg-app/xbacklight_1.1.bb
deleted file mode 100644
index 287b2b1..0000000
--- a/recipes/xorg-app/xbacklight_1.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "adjust backlight brightness using RandR extension"
-DEPENDS += " libxrender libxrandr"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "51b4a1c0ae2b3bd77417306fd78a3e94"
-SRC_URI[archive.sha256sum] = "c795001f15974569e16f25b201ac2ac7666c5a646f8d0de3afa0c3a1ba5d64a4"
diff --git a/recipes/xorg-app/xcalc_1.0.1.bb b/recipes/xorg-app/xcalc_1.0.1.bb
deleted file mode 100644
index ff042f0..0000000
--- a/recipes/xorg-app/xcalc_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "07b948cf671fde88df1a59bfb0cab3b8"
-SRC_URI[archive.sha256sum] = "17484e5fec0ebe7dd8df7218fde1449c52be3f4c6377a85a9fd86e377a7f4248"
diff --git a/recipes/xorg-app/xclipboard_1.0.1.bb b/recipes/xorg-app/xclipboard_1.0.1.bb
deleted file mode 100644
index 06aeda2..0000000
--- a/recipes/xorg-app/xclipboard_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2c6ecedb10dc51adbb64c95f22fd99c2"
-SRC_URI[archive.sha256sum] = "3399a27101285112ea578e1855c8374254afa8d427a3c5943458abc27c4d70fc"
diff --git a/recipes/xorg-app/xclock_1.0.2.bb b/recipes/xorg-app/xclock_1.0.2.bb
deleted file mode 100644
index 0bf6117..0000000
--- a/recipes/xorg-app/xclock_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6b930326f71993fb54b7203902b387cd"
-SRC_URI[archive.sha256sum] = "ced648762382eab09e0ccb87371cb745646ede08ffcb068faa6025d20c4d1f3d"
diff --git a/recipes/xorg-app/xclock_1.0.3.bb b/recipes/xorg-app/xclock_1.0.3.bb
deleted file mode 100644
index 73ac39c..0000000
--- a/recipes/xorg-app/xclock_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "analog / digital clock for X"
-DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2b1a3d030d87e62a591db8ee4c0072e6"
-SRC_URI[archive.sha256sum] = "10b5777ae9ef2a10d4cf447bd1bf13372d7061573835c2c87d5c948b65e9577f"
diff --git a/recipes/xorg-app/xcmsdb_1.0.1.bb b/recipes/xorg-app/xcmsdb_1.0.1.bb
deleted file mode 100644
index 770db7e..0000000
--- a/recipes/xorg-app/xcmsdb_1.0.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8579d5f50ba7f0c4a5bf16b9670fea01"
-SRC_URI[archive.sha256sum] = "e275a39f41ffae854db77b2c5decfad2cac32afbcd158842032dc9ca04efe92e"
diff --git a/recipes/xorg-app/xconsole_1.0.2.bb b/recipes/xorg-app/xconsole_1.0.2.bb
deleted file mode 100644
index a7eacc3..0000000
--- a/recipes/xorg-app/xconsole_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8678ddd23573022d68dcd883ae239be8"
-SRC_URI[archive.sha256sum] = "45db847e810a932bb962041a4c242f97779142f7e36feec64ec5f9073bd9b377"
diff --git a/recipes/xorg-app/xcursorgen_1.0.1.bb b/recipes/xorg-app/xcursorgen_1.0.1.bb
deleted file mode 100644
index 39c6aa2..0000000
--- a/recipes/xorg-app/xcursorgen_1.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxcursor libpng"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "39e1e62f5bd92603b0230b8b948c2fc4"
-SRC_URI[archive.sha256sum] = "18d3e0d64853089c2154f1f867df087fc15f87e03e09fabc98ee5e265d8a53ef"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/xcursorgen_1.0.2.bb b/recipes/xorg-app/xcursorgen_1.0.2.bb
deleted file mode 100644
index a058a88..0000000
--- a/recipes/xorg-app/xcursorgen_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "create an X cursor file from a collection of PNG images"
-DEPENDS += " libxcursor libpng"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "6fc90896b8c786cb1a2100b4167f7874"
-SRC_URI[archive.sha256sum] = "e009322bd2afef8d4ad91bcb6b17874e1cd00b1aaf397e7019a82cc44f3c174e"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/xdm_1.1.3.bb b/recipes/xorg-app/xdm_1.1.3.bb
deleted file mode 100644
index 02df29e..0000000
--- a/recipes/xorg-app/xdm_1.1.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X display manager"
-DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "619d0549c6c20ca15aa77769f2fbabe2"
-SRC_URI[archive.sha256sum] = "9e640974c132ef1faafedc77e4602d55457b2791006b677cec071ee8afbf9a74"
-
-EXTRA_OECONF += " --with-random-device=/dev/urandom"
diff --git a/recipes/xorg-app/xdm_1.1.4.bb b/recipes/xorg-app/xdm_1.1.4.bb
deleted file mode 100644
index c0268c5..0000000
--- a/recipes/xorg-app/xdm_1.1.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X display manager"
-DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a2b4c280f3e324d081a0d9ed76a8a123"
-SRC_URI[archive.sha256sum] = "928238ea20e074372659b2902de0e0d754083196911319319795fdbfd1ca6073"
-
-EXTRA_OECONF += " --with-random-device=/dev/urandom"
diff --git a/recipes/xorg-app/xdm_1.1.6.bb b/recipes/xorg-app/xdm_1.1.6.bb
deleted file mode 100644
index 9a4d7d3..0000000
--- a/recipes/xorg-app/xdm_1.1.6.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X display manager"
-DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c89f8bc74fda4d19e5f374f59c88810f"
-SRC_URI[archive.sha256sum] = "c41ac89d9da5c3f5424e9c4871d363ff17acf0fd2a46830931c447ba0b5a8bcd"
-
-EXTRA_OECONF += " --with-random-device=/dev/urandom"
-
-FILES_${PN}-dbg += "${libdir}/X11/xdm/.debug/*"
diff --git a/recipes/xorg-app/xdm_1.1.7.bb b/recipes/xorg-app/xdm_1.1.7.bb
deleted file mode 100644
index 844413c..0000000
--- a/recipes/xorg-app/xdm_1.1.7.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X display manager"
-DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "92effdb698d9ecc9113fe4f49294bd90"
-SRC_URI[archive.sha256sum] = "6a7bceccb1eb9ce3d14259be7a6cc8268bc9e1f127298480b9322ceb6f032d6d"
-
-EXTRA_OECONF += " --with-random-device=/dev/urandom"
-
-FILES_${PN}-dbg += "${libdir}/X11/xdm/.debug/*"
diff --git a/recipes/xorg-app/xdm_1.1.8.bb b/recipes/xorg-app/xdm_1.1.8.bb
deleted file mode 100644
index fc8fa99..0000000
--- a/recipes/xorg-app/xdm_1.1.8.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X display manager"
-DEPENDS += " libxmu libxinerama libxpm libxdmcp libxau libxext libxdmcp libxt libxaw"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "cc1816bc62a3722ad509373b0b7f30fe"
-SRC_URI[archive.sha256sum] = "e1169058775a44b0898351d2f645039b4d8946360285831e553587a147b735e9"
-
-EXTRA_OECONF += " --with-random-device=/dev/urandom"
-
-FILES_${PN}-dbg += "${libdir}/X11/xdm/.debug/*"
diff --git a/recipes/xorg-app/xdpyinfo_1.0.2.bb b/recipes/xorg-app/xdpyinfo_1.0.2.bb
deleted file mode 100644
index 80f4bf7..0000000
--- a/recipes/xorg-app/xdpyinfo_1.0.2.bb
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
-SRC_URI[archive.md5sum] = "c9ee60ae52c97c51d4ca327e53f0cb61"
-SRC_URI[archive.sha256sum] = "c9927fc33e8a4422d74b1ebee0d19dd5a16d9ebc435e8f47f0aa546501ccfed3"
-
-EXTRA_OECONF = "--disable-xkb"
diff --git a/recipes/xorg-app/xdpyinfo_1.0.3.bb b/recipes/xorg-app/xdpyinfo_1.0.3.bb
deleted file mode 100644
index eff9c09..0000000
--- a/recipes/xorg-app/xdpyinfo_1.0.3.bb
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
-SRC_URI[archive.md5sum] = "b7cbab6cbcd12bf7ad65dbc12d86e104"
-SRC_URI[archive.sha256sum] = "4294768751bd4ffb47e5ebacfc7b5b9f95a1a2f4d221d8af64474382473e1962"
-
-EXTRA_OECONF = "--disable-xkb"
diff --git a/recipes/xorg-app/xdriinfo_1.0.1.bb b/recipes/xorg-app/xdriinfo_1.0.1.bb
deleted file mode 100644
index 8a349d9..0000000
--- a/recipes/xorg-app/xdriinfo_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " glproto virtual/libgl"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "be3c5a9b242a57226b5bb5f22ec341ca"
-SRC_URI[archive.sha256sum] = "f693977bdaea7eb6b095a6b6bc60b8a62110ecdef4c455211346e592f59c3772"
diff --git a/recipes/xorg-app/xdriinfo_1.0.2.bb b/recipes/xorg-app/xdriinfo_1.0.2.bb
deleted file mode 100644
index 6f27ff2..0000000
--- a/recipes/xorg-app/xdriinfo_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "query configuration information of DRI drivers"
-DEPENDS += " glproto virtual/libgl"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a5ec51ed9f0a55dc3462d90d52ff899c"
-SRC_URI[archive.sha256sum] = "7b03ac095b6c79688c20ad61e3576d4698e3f16c09a7f3f1e7c50826814e7265"
diff --git a/recipes/xorg-app/xedit_1.0.2.bb b/recipes/xorg-app/xedit_1.0.2.bb
deleted file mode 100644
index 001cbcd..0000000
--- a/recipes/xorg-app/xedit_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxprintutil libxp libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c56160e93c24ddf17e69891ed50deb72"
-SRC_URI[archive.sha256sum] = "2658d78bbaf8c9effac261f3c229c035fbfda817fa9636dea1e46078213362df"
diff --git a/recipes/xorg-app/xev_1.0.2.bb b/recipes/xorg-app/xev_1.0.2.bb
deleted file mode 100644
index 402db0b..0000000
--- a/recipes/xorg-app/xev_1.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Event Viewer"
-LICENSE = "MIT"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://diet-x11.patch"
-SRC_URI[archive.md5sum] = "e3008eb0655da3026c162a5597d70869"
-SRC_URI[archive.sha256sum] = "cac2771b67942d9a00b46532176feb18b2f82c434e0f6ece578d95953ef33053"
diff --git a/recipes/xorg-app/xev_1.0.3.bb b/recipes/xorg-app/xev_1.0.3.bb
deleted file mode 100644
index a0990d2..0000000
--- a/recipes/xorg-app/xev_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Event Viewer"
-LICENSE = "MIT"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://diet-x11.patch"
-SRC_URI[archive.md5sum] = "a9532c3d1683c99bb5df1895cb3a60b1"
-SRC_URI[archive.sha256sum] = "d4ac7ae154ee9733be27a5f55586abb9362c768f5fb8a4fc7fd2645100a9313a"
diff --git a/recipes/xorg-app/xeyes_1.0.1.bb b/recipes/xorg-app/xeyes_1.0.1.bb
deleted file mode 100644
index 6382df4..0000000
--- a/recipes/xorg-app/xeyes_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxau libxt libxext libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "033f14f7c4e30d1f4edbb22d5ef86883"
-SRC_URI[archive.sha256sum] = "530902e8732130e37d9b46e73eecff90d6dbc5d5628620fded74a4e054aa8029"
diff --git a/recipes/xorg-app/xfs_1.0.4.bb b/recipes/xorg-app/xfs_1.0.4.bb
deleted file mode 100644
index f50eaf4..0000000
--- a/recipes/xorg-app/xfs_1.0.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X fontserver"
-DEPENDS += " libfs libxfont xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f43cb64d623b748208dfd9012d17b654"
-SRC_URI[archive.sha256sum] = "452dde2923c7ae5a2b8cb4b9735507c579c1c55a0e5e45a34210e52574ee641b"
diff --git a/recipes/xorg-app/xfs_1.0.5.bb b/recipes/xorg-app/xfs_1.0.5.bb
deleted file mode 100644
index 1d31d21..0000000
--- a/recipes/xorg-app/xfs_1.0.5.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X fontserver"
-DEPENDS += " libfs libxfont xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3fc73b5e39a1fe8b8d96563c8144cffe"
-SRC_URI[archive.sha256sum] = "f586f2101d42e512e7d20a6a6715c3c2cad19cacbee3b4034a0818de349e38f9"
diff --git a/recipes/xorg-app/xfs_1.0.6.bb b/recipes/xorg-app/xfs_1.0.6.bb
deleted file mode 100644
index 24028ac..0000000
--- a/recipes/xorg-app/xfs_1.0.6.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X fontserver"
-DEPENDS += " libfs libxfont xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a62ea490a8b97f74b53732df8fc309d8"
-SRC_URI[archive.sha256sum] = "5a3ad18fdc67e261454740217f7c02d1b6825013abcebdcd778a4865fd823353"
diff --git a/recipes/xorg-app/xfs_1.0.8.bb b/recipes/xorg-app/xfs_1.0.8.bb
deleted file mode 100644
index 6324d81..0000000
--- a/recipes/xorg-app/xfs_1.0.8.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X fontserver"
-DEPENDS += " libfs libxfont xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f10717e45535b64eb45226aac571dac2"
-SRC_URI[archive.sha256sum] = "34b5040b3db7552fc1cdfa46f926ce5b7217ea5d77cfafbbddf94fbae6b4f482"
diff --git a/recipes/xorg-app/xfsinfo_1.0.1.bb b/recipes/xorg-app/xfsinfo_1.0.1.bb
deleted file mode 100644
index 2df9b2a..0000000
--- a/recipes/xorg-app/xfsinfo_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libfs"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e98b18fbce1261de30b1de819d86f48a"
-SRC_URI[archive.sha256sum] = "adc33443b3a7f334d2407de702004a0491f24708e0e1abe74cd8ae114cd60cd9"
diff --git a/recipes/xorg-app/xgamma_1.0.1.bb b/recipes/xorg-app/xgamma_1.0.1.bb
deleted file mode 100644
index d6245ee..0000000
--- a/recipes/xorg-app/xgamma_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxxf86vm"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "45d8fa3c85d4bfda87251798fd605a45"
-SRC_URI[archive.sha256sum] = "085330064fdb90a152d2d44474fa20bb81ccb6c587c144f5f9c323cb9cc31eee"
diff --git a/recipes/xorg-app/xgamma_1.0.2.bb b/recipes/xorg-app/xgamma_1.0.2.bb
deleted file mode 100644
index 2b11285..0000000
--- a/recipes/xorg-app/xgamma_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "Alter a monitor's gamma correction through the X server"
-DEPENDS += " libxxf86vm"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f13ddedaa63a608d3b025d326f4f5b5d"
-SRC_URI[archive.sha256sum] = "5d3d5b230fc60aefae8f4865c17add133b5fb11377fd61c80897ef94fcccf41e"
diff --git a/recipes/xorg-app/xhost_1.0.2.bb b/recipes/xorg-app/xhost_1.0.2.bb
deleted file mode 100644
index 1a42fb1..0000000
--- a/recipes/xorg-app/xhost_1.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "Server access control program for X"
-LICENSE = "MIT"
-DEPENDS += "libxmu libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f746aba36f075ae4cae313d849a94f4e"
-SRC_URI[archive.sha256sum] = "edab2cc49d230f58e54c0f7b83fd726fec5fc31356668a11589649f19ba90db6"
diff --git a/recipes/xorg-app/xinit_1.0.3.bb b/recipes/xorg-app/xinit_1.0.3.bb
deleted file mode 100644
index 703f825..0000000
--- a/recipes/xorg-app/xinit_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f04a903cc0e18b3c338f58eb90f6caf8"
-SRC_URI[archive.sha256sum] = "c77a58cba815eb1dde2242a819e80d7d84d753678837ac24d385e3ec65d33186"
-
-FILES_${PN} += "  /usr/lib/X11/xinit"
diff --git a/recipes/xorg-app/xinit_1.0.4.bb b/recipes/xorg-app/xinit_1.0.4.bb
deleted file mode 100644
index 2ff99ce..0000000
--- a/recipes/xorg-app/xinit_1.0.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Window System initializer"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9df52a504dc04313a6650fae364ae04a"
-SRC_URI[archive.sha256sum] = "1e7056db4441ccb0dff0f77503e3fd49a370aecdecf95ce6066116ca8244bf52"
-
-FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/xorg-app/xinit_1.0.5.bb b/recipes/xorg-app/xinit_1.0.5.bb
deleted file mode 100644
index 120f42f..0000000
--- a/recipes/xorg-app/xinit_1.0.5.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Window System initializer"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9a2aad51042141a0e6ad066015397595"
-SRC_URI[archive.sha256sum] = "95d55283f32d241c8e6750b7998408da43e910d2b918c80089a3012684f1c62d"
-
-FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/xorg-app/xinit_1.0.7.bb b/recipes/xorg-app/xinit_1.0.7.bb
deleted file mode 100644
index 50c4270..0000000
--- a/recipes/xorg-app/xinit_1.0.7.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Window System initializer"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8b882d9e2deed9d85469a3beaec566a3"
-SRC_URI[archive.sha256sum] = "15781cf2b15af8a2535ecc49acce77cc16573571344a71dcbe198ec12e5bb774"
-
-FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/xorg-app/xinit_1.0.8.bb b/recipes/xorg-app/xinit_1.0.8.bb
deleted file mode 100644
index 1771578..0000000
--- a/recipes/xorg-app/xinit_1.0.8.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Window System initializer"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "521574088fbd688edbf91e6bae674265"
-SRC_URI[archive.sha256sum] = "06c1049f6b63d1c368a1e03e2392097919b22ff24899e190de3577bffe6fe524"
-
-FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/xorg-app/xinit_1.0.9.bb b/recipes/xorg-app/xinit_1.0.9.bb
deleted file mode 100644
index 7d8270a..0000000
--- a/recipes/xorg-app/xinit_1.0.9.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Window System initializer"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "224c36057e4416205d4e421af01a2f15"
-SRC_URI[archive.sha256sum] = "b4218fd4ca5e431bf69cba848c21e91235fda30504634b9f6b6cd011dcbd8999"
-
-FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/xorg-app/xinit_1.1.0.bb b/recipes/xorg-app/xinit_1.1.0.bb
deleted file mode 100644
index 1829819..0000000
--- a/recipes/xorg-app/xinit_1.1.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Window System initializer"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9144097186c3d2454beffe8ac3b53c6e"
-SRC_URI[archive.sha256sum] = "c79ec1a4d60404715a626f2832f1b62f43b9d52a1e4642b40af743ee41362590"
-
-FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/xorg-app/xinit_1.2.0.bb b/recipes/xorg-app/xinit_1.2.0.bb
deleted file mode 100644
index fc5ca59..0000000
--- a/recipes/xorg-app/xinit_1.2.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X Window System initializer"
-DEPENDS += "util-linux-ng"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fe1696cab2fbed6fa059d0cd1c53ac13"
-SRC_URI[archive.sha256sum] = "ab61663a4421753132d4aac97a873ed20697c4761cb434640f48f350fb65087f"
-
-FILES_${PN} += "${libdir}X11/xinit"
diff --git a/recipes/xorg-app/xinput_1.3.0.bb b/recipes/xorg-app/xinput_1.3.0.bb
deleted file mode 100644
index dac3150..0000000
--- a/recipes/xorg-app/xinput_1.3.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a utility to configure and test XInput devices"
-DEPENDS += " libxi"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "977d657e8d7b59f7d82c98ebef444b28"
-SRC_URI[archive.sha256sum] = "330c3e5188abf256131c162c456060804f369349e9a0e7aa3efbc54add802e45"
diff --git a/recipes/xorg-app/xinput_1.4.2.bb b/recipes/xorg-app/xinput_1.4.2.bb
deleted file mode 100644
index 9e58205..0000000
--- a/recipes/xorg-app/xinput_1.4.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a utility to configure and test XInput devices"
-DEPENDS += " libxi"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "58e619576cbf4b6057eebb7a97fe2ddf"
-SRC_URI[archive.sha256sum] = "3195916b6cebf109eb571b939d7cea7075ef1933782526a6d8fbbb353bc3924b"
diff --git a/recipes/xorg-app/xinput_1.5.1.bb b/recipes/xorg-app/xinput_1.5.1.bb
deleted file mode 100644
index 9b990b0..0000000
--- a/recipes/xorg-app/xinput_1.5.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a utility to configure and test XInput devices"
-DEPENDS += " libxi"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "82400f0ba63217df9b00d825532cea7d"
-SRC_URI[archive.sha256sum] = "e33c8361c2b6cb13db9a7157753d417c168c8203c8b7027e9dda2fbeef00fd33"
diff --git a/recipes/xorg-app/xkbcomp_1.0.3.bb b/recipes/xorg-app/xkbcomp_1.0.3.bb
deleted file mode 100644
index ebc8375..0000000
--- a/recipes/xorg-app/xkbcomp_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "The X Keyboard Extension essentially replaces the core protocol definition of keyboard."
-DEPENDS += " libxkbfile"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "2fbcae1323c266edf5b6c61751f2e343"
-SRC_URI[archive.sha256sum] = "0635bae5dae3c933ebba997475ae14fa213aee1f2ea8aaff2ca76c50f8aec716"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/xkbcomp_1.0.4.bb b/recipes/xorg-app/xkbcomp_1.0.4.bb
deleted file mode 100644
index 64b2370..0000000
--- a/recipes/xorg-app/xkbcomp_1.0.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "The X Keyboard Extension essentially replaces the core protocol definition of keyboard."
-DEPENDS += " libxkbfile"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "d5122f1d5a91725a81c843f3bd388244"
-SRC_URI[archive.sha256sum] = "fefc574bf639d64348939edf9654306af2bb3c20447be9cff493cb06d87cb672"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/xkbcomp_1.0.5.bb b/recipes/xorg-app/xkbcomp_1.0.5.bb
deleted file mode 100644
index bcd1455..0000000
--- a/recipes/xorg-app/xkbcomp_1.0.5.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "The X Keyboard Extension essentially replaces the core protocol definition of keyboard."
-DEPENDS += " libxkbfile"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "6cc96c3e4ed5d9802fe717beac008f19"
-SRC_URI[archive.sha256sum] = "204403e0388e83127212109310037d17f56c3c3fd3c96d7dcaa0df99684f00c1"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-app/xkbevd_1.0.2.bb b/recipes/xorg-app/xkbevd_1.0.2.bb
deleted file mode 100644
index 66b6937..0000000
--- a/recipes/xorg-app/xkbevd_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxkbfile "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "68f2a143716c23b566f8509d9498f516"
-SRC_URI[archive.sha256sum] = "4b78e316ecf9a9498291f634a7e9ee712ba429d5606f300c0a27eacdaaa1f72b"
diff --git a/recipes/xorg-app/xkbutils_1.0.1.bb b/recipes/xorg-app/xkbutils_1.0.1.bb
deleted file mode 100644
index 7547e96..0000000
--- a/recipes/xorg-app/xkbutils_1.0.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxkbfile "
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "84396a3dd75337caaae29d8fa5616fb1"
-SRC_URI[archive.sha256sum] = "aaad73ed8db764978a18bc6ba774d38a4c1330c86622c0b47ae3ced09c175856"
diff --git a/recipes/xorg-app/xkill_1.0.1.bb b/recipes/xorg-app/xkill_1.0.1.bb
deleted file mode 100644
index ba95dbe..0000000
--- a/recipes/xorg-app/xkill_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f66d76abb0f75514ca32272e23cca757"
-SRC_URI[archive.sha256sum] = "77a11aac6e4ae2132d8b7b4335be77de26655e6aa88b40e51fd2ee802f14a9de"
diff --git a/recipes/xorg-app/xload_1.0.1.bb b/recipes/xorg-app/xload_1.0.1.bb
deleted file mode 100644
index 9b72817..0000000
--- a/recipes/xorg-app/xload_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ba013813f9c21eb015559466f8d02a44"
-SRC_URI[archive.sha256sum] = "8d51184d6b18eea2f64e0c5b88cd95edff8353ce6529e780f95b1f2347babbf2"
diff --git a/recipes/xorg-app/xlsatoms_1.0.1.bb b/recipes/xorg-app/xlsatoms_1.0.1.bb
deleted file mode 100644
index 3acd54f..0000000
--- a/recipes/xorg-app/xlsatoms_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "69adcda848479acc3b82b3928812d191"
-SRC_URI[archive.sha256sum] = "456d575a0cdb37fc9415578a3ad34ba3cf9eb5eb0f6e5a25f97ca41db416d55a"
diff --git a/recipes/xorg-app/xlsclients_1.0.1.bb b/recipes/xorg-app/xlsclients_1.0.1.bb
deleted file mode 100644
index 9b32088..0000000
--- a/recipes/xorg-app/xlsclients_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "44473b880d26bfbe8b3d4d72b183cba7"
-SRC_URI[archive.sha256sum] = "988c71c6dc3519523fe5844ee3e49d91f843a83c783dd0baa20526d9d2981698"
diff --git a/recipes/xorg-app/xlsfonts_1.0.1.bb b/recipes/xorg-app/xlsfonts_1.0.1.bb
deleted file mode 100644
index 5a88403..0000000
--- a/recipes/xorg-app/xlsfonts_1.0.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require xorg-app-common.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ca9c6c88d0b83360b7b5092615fbf591"
-SRC_URI[archive.sha256sum] = "c8d826194299b2b8e3c6edce7070f05421465b0118ed47135a0195d12fe8a720"
diff --git a/recipes/xorg-app/xmag_1.0.1.bb b/recipes/xorg-app/xmag_1.0.1.bb
deleted file mode 100644
index c09140d..0000000
--- a/recipes/xorg-app/xmag_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "058d168d1c7c991b8d12158433ea5f63"
-SRC_URI[archive.sha256sum] = "1f239057cdfb2164b2e8fc229e2518d20b27a853f975e73618a4a81f09ebeb02"
diff --git a/recipes/xorg-app/xmag_1.0.2.bb b/recipes/xorg-app/xmag_1.0.2.bb
deleted file mode 100644
index 2856093..0000000
--- a/recipes/xorg-app/xmag_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "magnify parts of the screen"
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7c6a783e42c88360ac31d259a864a19d"
-SRC_URI[archive.sha256sum] = "51dd943e607ddd8067fd13cd597998fb00560cbf06450a8c374563a78a86da43"
diff --git a/recipes/xorg-app/xman_1.0.2.bb b/recipes/xorg-app/xman_1.0.2.bb
deleted file mode 100644
index 1844180..0000000
--- a/recipes/xorg-app/xman_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxprintutil libxp libxt"
-RDEPENDS_${PN} = " man"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "855f2dbfa2aff58b8b9cd6a1c1120fad"
-SRC_URI[archive.sha256sum] = "00bc616892388c94505b09564daffbad2df2e7c684686dea2d78dbcd210212f2"
-
-FILES_${PN} += " /usr/share/X11/xman.help"
diff --git a/recipes/xorg-app/xman_1.0.3.bb b/recipes/xorg-app/xman_1.0.3.bb
deleted file mode 100644
index d1dcf65..0000000
--- a/recipes/xorg-app/xman_1.0.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "manual page browser for X"
-DEPENDS += " libxaw libxprintutil libxp libxt"
-RDEPENDS_${PN} = " man"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3d3a4b310a65ccce82472ef83acbbf97"
-SRC_URI[archive.sha256sum] = "38e03bfa2d3d109d55342e3539be952268e405fb458fb8c4f87739594a25394a"
-
-FILES_${PN} += " /usr/share/X11/xman.help"
diff --git a/recipes/xorg-app/xmessage_1.0.1.bb b/recipes/xorg-app/xmessage_1.0.1.bb
deleted file mode 100644
index 5ecfae0..0000000
--- a/recipes/xorg-app/xmessage_1.0.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "xmessage displays a message or query in a window."
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b3674c3a00a089764d86aa94e257ccec"
-SRC_URI[archive.sha256sum] = "b921aef62c2a2f5c32048502cd96630e9d42493cd39d1841fde247274f24bbda"
diff --git a/recipes/xorg-app/xmodmap/autofoo.patch b/recipes/xorg-app/xmodmap/autofoo.patch
deleted file mode 100644
index f309add..0000000
--- a/recipes/xorg-app/xmodmap/autofoo.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-diff -urN xmodmap.orig/Makefile.am xmodmap/Makefile.am
---- xmodmap.orig/Makefile.am	1970-01-01 01:00:00.000000000 +0100
-+++ xmodmap/Makefile.am	2004-08-31 19:49:33.000000000 +0200
-@@ -0,0 +1,53 @@
-+# 
-+#  $Id: Makefile.am,v 1.2 2004/06/25 19:38:50 markh Exp $
-+# 
-+#  Copyright © 2003 Keith Packard
-+# 
-+#  Permission to use, copy, modify, distribute, and sell this software and its
-+#  documentation for any purpose is hereby granted without fee, provided that
-+#  the above copyright notice appear in all copies and that both that
-+#  copyright notice and this permission notice appear in supporting
-+#  documentation, and that the name of Keith Packard not be used in
-+#  advertising or publicity pertaining to distribution of the software without
-+#  specific, written prior permission.  Keith Packard makes no
-+#  representations about the suitability of this software for any purpose.  It
-+#  is provided "as is" without express or implied warranty.
-+# 
-+#  KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
-+#  INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
-+#  EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
-+#  CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
-+#  DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
-+#  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-+#  PERFORMANCE OF THIS SOFTWARE.
-+#
-+
-+AUTOMAKE_OPTIONS = 1.7 foreign
-+
-+AM_CFLAGS = @XMODMAP_CFLAGS@
-+
-+bin_PROGRAMS = xmodmap
-+
-+xmodmap_SOURCES = exec.c handle.c pf.c wq.h xmodmap.c xmodmap.h
-+
-+xmodmap_LDADD = @XMODMAP_LIBS@
-+
-+man5_MANS=xmodmap.man
-+
-+EXTRA_DIST= $(man5_MANS)
-+
-+MAINTAINERCLEANFILES = configure \
-+config.guess \
-+config.sub \
-+install-sh \
-+ltmain.sh \
-+missing \
-+mkinstalldirs \
-+aclocal.m4 \
-+Makefile.in \
-+depcomp \
-+autoscan.log \
-+configure.scan \
-+config.h \
-+config.h.in \
-+$(man5_MANS)
-diff -urN xmodmap.orig/autogen.sh xmodmap/autogen.sh
---- xmodmap.orig/autogen.sh	1970-01-01 01:00:00.000000000 +0100
-+++ xmodmap/autogen.sh	2004-08-31 19:46:14.000000000 +0200
-@@ -0,0 +1,3 @@
-+#! /bin/sh
-+autoreconf -v --install || exit 1
-+./configure --enable-maintainer-mode "$@"
-diff -urN xmodmap.orig/configure.ac xmodmap/configure.ac
---- xmodmap.orig/configure.ac	1970-01-01 01:00:00.000000000 +0100
-+++ xmodmap/configure.ac	2004-08-31 20:27:03.000000000 +0200
-@@ -0,0 +1,41 @@
-+dnl
-+dnl $Id: configure.ac,v 1.1 2003/10/09 06:16:59 keithp Exp $
-+dnl
-+dnl Copyright © 2003 Keith Packard
-+dnl
-+dnl Permission to use, copy, modify, distribute, and sell this software and its
-+dnl documentation for any purpose is hereby granted without fee, provided that
-+dnl the above copyright notice appear in all copies and that both that
-+dnl copyright notice and this permission notice appear in supporting
-+dnl documentation, and that the name of Keith Packard not be used in
-+dnl advertising or publicity pertaining to distribution of the software without
-+dnl specific, written prior permission.  Keith Packard makes no
-+dnl representations about the suitability of this software for any purpose.  It
-+dnl is provided "as is" without express or implied warranty.
-+dnl
-+dnl KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
-+dnl INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
-+dnl EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
-+dnl CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
-+dnl DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
-+dnl TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-+dnl PERFORMANCE OF THIS SOFTWARE.
-+dnl
-+
-+AC_PREREQ(2.57)
-+AC_INIT([xmodmap],4.4.0,[],xmodmap)
-+AC_CONFIG_SRCDIR([Makefile.am])
-+AM_INIT_AUTOMAKE([dist-bzip2])
-+AM_MAINTAINER_MODE
-+AM_CONFIG_HEADER(config.h)
-+
-+AC_PROG_CC
-+AC_PROG_INSTALL
-+AC_PROG_LN_S
-+AC_LIBTOOL_WIN32_DLL
-+AM_PROG_LIBTOOL
-+AC_PROG_MAKE_SET
-+
-+PKG_CHECK_MODULES(XMODMAP, x11)
-+
-+AC_OUTPUT([Makefile])
diff --git a/recipes/xorg-app/xmodmap_1.0.2.bb b/recipes/xorg-app/xmodmap_1.0.2.bb
deleted file mode 100644
index 17bbc7e..0000000
--- a/recipes/xorg-app/xmodmap_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "utility for modifying keymaps and pointer button mappings in X"
-LICENSE = "MIT"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ea78b3e32e27c3662f86ea68b3aec22f"
-SRC_URI[archive.sha256sum] = "4bed79ba6efcaabb3ce055cf88419a5190f8ab9d3408e7b14d722351cbaf4b44"
diff --git a/recipes/xorg-app/xmodmap_1.0.3.bb b/recipes/xorg-app/xmodmap_1.0.3.bb
deleted file mode 100644
index ab245b3..0000000
--- a/recipes/xorg-app/xmodmap_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "utility for modifying keymaps and pointer button mappings in X"
-LICENSE = "MIT"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "626731003ec22a74ecf9e44ed098bbdf"
-SRC_URI[archive.sha256sum] = "c3bfc724792858222c138c1ae9a017e69e7d3bdda3fc9f5da38b232ab031147f"
diff --git a/recipes/xorg-app/xpr_1.0.1.bb b/recipes/xorg-app/xpr_1.0.1.bb
deleted file mode 100644
index 5e70d01..0000000
--- a/recipes/xorg-app/xpr_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "01c0a14755fc91369e8c011c9f881d5d"
-SRC_URI[archive.sha256sum] = "b871221d23dc4fc50398e9fe0e2a6a4e951aa6c9df2c5671d069ad88f0fd6249"
diff --git a/recipes/xorg-app/xpr_1.0.2.bb b/recipes/xorg-app/xpr_1.0.2.bb
deleted file mode 100644
index f117bd8..0000000
--- a/recipes/xorg-app/xpr_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "print an X window dump"
-DEPENDS += " libxmu "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6b3a6896081f628bf5a2c9129417c86f"
-SRC_URI[archive.sha256sum] = "c325a9896d1cda43a681f1c2a6a2bbb1c580ade57a882b0a8f84ffa359238adf"
diff --git a/recipes/xorg-app/xprop/autofoo.patch b/recipes/xorg-app/xprop/autofoo.patch
deleted file mode 100644
index 2526d95..0000000
--- a/recipes/xorg-app/xprop/autofoo.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-diff -urN xprop.orig/Makefile.am xprop/Makefile.am
---- xprop.orig/Makefile.am	1970-01-01 01:00:00.000000000 +0100
-+++ xprop/Makefile.am	2004-08-15 18:49:43.000000000 +0200
-@@ -0,0 +1,53 @@
-+# 
-+#  $Id: Makefile.am,v 1.2 2004/06/25 19:38:50 markh Exp $
-+# 
-+#  Copyright © 2003 Keith Packard
-+# 
-+#  Permission to use, copy, modify, distribute, and sell this software and its
-+#  documentation for any purpose is hereby granted without fee, provided that
-+#  the above copyright notice appear in all copies and that both that
-+#  copyright notice and this permission notice appear in supporting
-+#  documentation, and that the name of Keith Packard not be used in
-+#  advertising or publicity pertaining to distribution of the software without
-+#  specific, written prior permission.  Keith Packard makes no
-+#  representations about the suitability of this software for any purpose.  It
-+#  is provided "as is" without express or implied warranty.
-+# 
-+#  KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
-+#  INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
-+#  EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
-+#  CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
-+#  DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
-+#  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-+#  PERFORMANCE OF THIS SOFTWARE.
-+#
-+
-+AUTOMAKE_OPTIONS = 1.7 foreign
-+
-+AM_CFLAGS = @XPROP_CFLAGS@
-+
-+bin_PROGRAMS = xprop
-+
-+xprop_SOURCES = dsimple.c dsimple.h xprop.c
-+
-+xprop_LDADD = @XPROP_LIBS@
-+
-+man5_MANS=xprop.man
-+
-+EXTRA_DIST= $(man5_MANS)
-+
-+MAINTAINERCLEANFILES = configure \
-+config.guess \
-+config.sub \
-+install-sh \
-+ltmain.sh \
-+missing \
-+mkinstalldirs \
-+aclocal.m4 \
-+Makefile.in \
-+depcomp \
-+autoscan.log \
-+configure.scan \
-+config.h \
-+config.h.in \
-+$(man5_MANS)
-diff -urN xprop.orig/configure.ac xprop/configure.ac
---- xprop.orig/configure.ac	1970-01-01 01:00:00.000000000 +0100
-+++ xprop/configure.ac	2004-08-15 19:00:43.000000000 +0200
-@@ -0,0 +1,44 @@
-+dnl
-+dnl $Id: configure.ac,v 1.1 2003/10/09 06:16:59 keithp Exp $
-+dnl
-+dnl Copyright © 2003 Keith Packard
-+dnl
-+dnl Permission to use, copy, modify, distribute, and sell this software and its
-+dnl documentation for any purpose is hereby granted without fee, provided that
-+dnl the above copyright notice appear in all copies and that both that
-+dnl copyright notice and this permission notice appear in supporting
-+dnl documentation, and that the name of Keith Packard not be used in
-+dnl advertising or publicity pertaining to distribution of the software without
-+dnl specific, written prior permission.  Keith Packard makes no
-+dnl representations about the suitability of this software for any purpose.  It
-+dnl is provided "as is" without express or implied warranty.
-+dnl
-+dnl KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
-+dnl INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
-+dnl EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
-+dnl CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
-+dnl DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
-+dnl TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-+dnl PERFORMANCE OF THIS SOFTWARE.
-+dnl
-+
-+AC_PREREQ(2.57)
-+AC_INIT([xprop],4.4.0,[],xprop)
-+AC_CONFIG_SRCDIR([Makefile.am])
-+AM_INIT_AUTOMAKE([dist-bzip2])
-+AM_MAINTAINER_MODE
-+AM_CONFIG_HEADER(config.h)
-+
-+AC_PROG_CC
-+AC_PROG_INSTALL
-+AC_PROG_LN_S
-+AC_LIBTOOL_WIN32_DLL
-+AM_PROG_LIBTOOL
-+AC_PROG_MAKE_SET
-+
-+PKG_CHECK_MODULES(XPROP, xext xmuu x11)
-+
-+AC_CHECK_HEADERS([wchar.h])
-+AC_CHECK_HEADERS([wctype.h])
-+
-+AC_OUTPUT([Makefile])
-diff -urN xprop.orig/dsimple.c xprop/dsimple.c
---- xprop.orig/dsimple.c	2003-11-14 16:54:54.000000000 +0100
-+++ xprop/dsimple.c	2004-08-15 19:19:32.000000000 +0200
-@@ -27,11 +27,16 @@
- 
- */
- 
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
-+
- #include <X11/Xos.h>
- #include <X11/Xlib.h>
- #include <X11/Xutil.h>
- #include <X11/cursorfont.h>
- #include <stdio.h>
-+#include <stdlib.h>
- /*
-  * Other_stuff.h: Definitions of routines in other_stuff.
-  *
-@@ -69,7 +74,7 @@
- char *Malloc(size)
-      unsigned size;
- {
--	char *data, *malloc();
-+	char *data;
- 
- 	if (!(data = malloc(size)))
- 	  Fatal_Error("Out of memory!");
-@@ -85,7 +90,7 @@
-         char *ptr;
-         int size;
- {
--	char *new_ptr, *realloc();
-+	char *new_ptr;
- 
- 	if (!ptr)
- 	  return(Malloc(size));
-diff -urN xprop.orig/xprop.c xprop/xprop.c
---- xprop.orig/xprop.c	2004-04-23 21:55:03.000000000 +0200
-+++ xprop/xprop.c	2004-08-15 19:23:13.000000000 +0200
-@@ -30,6 +30,10 @@
- /* $XFree86: xc/programs/xprop/xprop.c,v 1.15 2003/09/24 02:43:38 dawes Exp $ */
- 
- 
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
-+
- #include <X11/Xlib.h>
- #include <X11/Xos.h>
- #include <X11/Xfuncs.h>
diff --git a/recipes/xorg-app/xprop_1.0.2.bb b/recipes/xorg-app/xprop_1.0.2.bb
deleted file mode 100644
index f57c8de..0000000
--- a/recipes/xorg-app/xprop_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5b6f02a3b1cda0cadc35f84814fe53d4"
-SRC_URI[archive.sha256sum] = "88b1e65703c68f14ac6cb735737d1a0e52751a18fdc8a39d2d1e5eaa07875ca0"
diff --git a/recipes/xorg-app/xprop_1.0.4.bb b/recipes/xorg-app/xprop_1.0.4.bb
deleted file mode 100644
index 526db7b..0000000
--- a/recipes/xorg-app/xprop_1.0.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "a property displayer for X"
-DEPENDS += " libxmu "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "48aa8fd78802f477dcbf9ef0dfd9f783"
-SRC_URI[archive.sha256sum] = "daa47cba7d5a919ca1bd053d8a8b6af4904f77eded4bdb055cd915aa5f5cd772"
diff --git a/recipes/xorg-app/xrandr_1.2.2.bb b/recipes/xorg-app/xrandr_1.2.2.bb
deleted file mode 100644
index b09b16b..0000000
--- a/recipes/xorg-app/xrandr_1.2.2.bb
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
-SRC_URI[archive.md5sum] = "c6ec9dc42396e3b3a2da932f3feca6ec"
-SRC_URI[archive.sha256sum] = "632f3ff492a07f8279807ffbafe4f89af069bb0e7b4934b3ddf7379509aa9303"
diff --git a/recipes/xorg-app/xrandr_1.2.3.bb b/recipes/xorg-app/xrandr_1.2.3.bb
deleted file mode 100644
index 6923ce3..0000000
--- a/recipes/xorg-app/xrandr_1.2.3.bb
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
-SRC_URI[archive.md5sum] = "41a9d0cc073fa6165a31fbf9e85f68a6"
-SRC_URI[archive.sha256sum] = "ab06b77f3a2b8866279e096f9d2702ac644681424eb0aec39e4eb7199f152207"
diff --git a/recipes/xorg-app/xrdb/autofoo.patch b/recipes/xorg-app/xrdb/autofoo.patch
deleted file mode 100644
index b30a46b..0000000
--- a/recipes/xorg-app/xrdb/autofoo.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-diff -urN xrdb.orig/Imakefile xrdb/Imakefile
---- xrdb.orig/Imakefile	2004-04-23 21:55:03.000000000 +0200
-+++ xrdb/Imakefile	1970-01-01 01:00:00.000000000 +0100
-@@ -1,19 +0,0 @@
--XCOMM $Xorg: Imakefile,v 1.3 2000/08/17 19:54:56 cpqbld Exp $
--
--
--
--
--XCOMM $XFree86: xc/programs/xrdb/Imakefile,v 3.6tsi Exp $
--
--#ifdef PatheticCpp
--        CPPDEFS = -DPATHETICCPP
--#endif
--#if HasMkstemp
--        CPPDEFS = -DHAS_MKSTEMP
--#endif
--XCOMM Due to ill make parsing the cpp is passed directly in source file
--        DEFINES = -DCPP="\"$(CPP)\"" $(CPPDEFS)
--        DEPLIBS = $(DEPXMUULIB) $(DEPXONLYLIB)
--LOCAL_LIBRARIES = $(XMUULIB) $(XONLYLIB)
--
--SimpleProgramTarget(xrdb)
-diff -urN xrdb.orig/Makefile.am xrdb/Makefile.am
---- xrdb.orig/Makefile.am	1970-01-01 01:00:00.000000000 +0100
-+++ xrdb/Makefile.am	2004-08-14 16:05:01.000000000 +0200
-@@ -0,0 +1,53 @@
-+# 
-+#  $Id: Makefile.am,v 1.2 2004/06/25 19:38:50 markh Exp $
-+# 
-+#  Copyright © 2003 Keith Packard
-+# 
-+#  Permission to use, copy, modify, distribute, and sell this software and its
-+#  documentation for any purpose is hereby granted without fee, provided that
-+#  the above copyright notice appear in all copies and that both that
-+#  copyright notice and this permission notice appear in supporting
-+#  documentation, and that the name of Keith Packard not be used in
-+#  advertising or publicity pertaining to distribution of the software without
-+#  specific, written prior permission.  Keith Packard makes no
-+#  representations about the suitability of this software for any purpose.  It
-+#  is provided "as is" without express or implied warranty.
-+# 
-+#  KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
-+#  INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
-+#  EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
-+#  CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
-+#  DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
-+#  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-+#  PERFORMANCE OF THIS SOFTWARE.
-+#
-+
-+AUTOMAKE_OPTIONS = 1.7 foreign
-+
-+AM_CFLAGS = @XRDB_CFLAGS@
-+
-+bin_PROGRAMS = xrdb
-+
-+xrdb_SOURCES = xrdb.c
-+
-+xrdb_LDADD = @XRDB_LIBS@
-+
-+man5_MANS=xrdb.man
-+
-+EXTRA_DIST= $(man5_MANS)
-+
-+MAINTAINERCLEANFILES = configure \
-+config.guess \
-+config.sub \
-+install-sh \
-+ltmain.sh \
-+missing \
-+mkinstalldirs \
-+aclocal.m4 \
-+Makefile.in \
-+depcomp \
-+autoscan.log \
-+configure.scan \
-+config.h \
-+config.h.in \
-+$(man5_MANS)
-diff -urN xrdb.orig/autogen.sh xrdb/autogen.sh
---- xrdb.orig/autogen.sh	1970-01-01 01:00:00.000000000 +0100
-+++ xrdb/autogen.sh	2004-08-14 15:57:35.000000000 +0200
-@@ -0,0 +1,3 @@
-+#! /bin/sh
-+autoreconf -v --install || exit 1
-+./configure --enable-maintainer-mode "$@"
-diff -urN xrdb.orig/configure.ac xrdb/configure.ac
---- xrdb.orig/configure.ac	1970-01-01 01:00:00.000000000 +0100
-+++ xrdb/configure.ac	2004-08-14 16:03:31.000000000 +0200
-@@ -0,0 +1,41 @@
-+dnl
-+dnl $Id: configure.ac,v 1.1 2003/10/09 06:16:59 keithp Exp $
-+dnl
-+dnl Copyright © 2003 Keith Packard
-+dnl
-+dnl Permission to use, copy, modify, distribute, and sell this software and its
-+dnl documentation for any purpose is hereby granted without fee, provided that
-+dnl the above copyright notice appear in all copies and that both that
-+dnl copyright notice and this permission notice appear in supporting
-+dnl documentation, and that the name of Keith Packard not be used in
-+dnl advertising or publicity pertaining to distribution of the software without
-+dnl specific, written prior permission.  Keith Packard makes no
-+dnl representations about the suitability of this software for any purpose.  It
-+dnl is provided "as is" without express or implied warranty.
-+dnl
-+dnl KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
-+dnl INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
-+dnl EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
-+dnl CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
-+dnl DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
-+dnl TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-+dnl PERFORMANCE OF THIS SOFTWARE.
-+dnl
-+
-+AC_PREREQ(2.57)
-+AC_INIT([xrdb],4.4.0,[],xrdb)
-+AC_CONFIG_SRCDIR([Makefile.am])
-+AM_INIT_AUTOMAKE([dist-bzip2])
-+AM_MAINTAINER_MODE
-+AM_CONFIG_HEADER(config.h)
-+
-+AC_PROG_CC
-+AC_PROG_INSTALL
-+AC_PROG_LN_S
-+AC_LIBTOOL_WIN32_DLL
-+AM_PROG_LIBTOOL
-+AC_PROG_MAKE_SET
-+
-+PKG_CHECK_MODULES(XRDB, xext xmuu x11)
-+
-+AC_OUTPUT([Makefile])
diff --git a/recipes/xorg-app/xrdb_1.0.3.bb b/recipes/xorg-app/xrdb_1.0.3.bb
deleted file mode 100644
index 6c4d86d..0000000
--- a/recipes/xorg-app/xrdb_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X server resource database utility"
-LICENSE = "xrdb"
-DEPENDS += "libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "380b2ef545306354cc150834de567be7"
-SRC_URI[archive.sha256sum] = "a4a3b8cd821adc201a072f8c0214d73ee6a7e7b898de90e18f7d89a4453fb12c"
diff --git a/recipes/xorg-app/xrdb_1.0.4.bb b/recipes/xorg-app/xrdb_1.0.4.bb
deleted file mode 100644
index 7181dc9..0000000
--- a/recipes/xorg-app/xrdb_1.0.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X server resource database utility"
-LICENSE = "xrdb"
-DEPENDS += "libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "34eb2311a0c5279e7b4f492e826f63d1"
-SRC_URI[archive.sha256sum] = "3f8cde77e8cbeb6d0a5f232b7a2ee51dd49b677916d52ab0986d320a5f9e8000"
diff --git a/recipes/xorg-app/xrdb_1.0.5.bb b/recipes/xorg-app/xrdb_1.0.5.bb
deleted file mode 100644
index d474dc8..0000000
--- a/recipes/xorg-app/xrdb_1.0.5.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X server resource database utility"
-LICENSE = "xrdb"
-DEPENDS += "libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9c30b8e1709d5367beb7706146640c07"
-SRC_URI[archive.sha256sum] = "c24d08939250f10238fd1b984707bfa0901ba9c55fa36b67d91eb12b500500aa"
diff --git a/recipes/xorg-app/xrefresh_1.0.2.bb b/recipes/xorg-app/xrefresh_1.0.2.bb
deleted file mode 100644
index a97f1af..0000000
--- a/recipes/xorg-app/xrefresh_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1228f890f86148e4e6ae22aa73118cbb"
-SRC_URI[archive.sha256sum] = "522831fd29c0b250f29735a01b02e96e311f200a675e45c8b3d187b6f86b32f5"
diff --git a/recipes/xorg-app/xrx_1.0.1.bb b/recipes/xorg-app/xrx_1.0.1.bb
deleted file mode 100644
index 25f0c80..0000000
--- a/recipes/xorg-app/xrx_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt libxext xtrans xproxymngproto libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5f65e24f8a225e255beb2059e33d6b37"
-SRC_URI[archive.sha256sum] = "a51ac7c607f2f79de771807f590ccfe8b1819dae6f30dd615dd2afbe6007c4e4"
diff --git a/recipes/xorg-app/xset/autofoo.patch b/recipes/xorg-app/xset/autofoo.patch
deleted file mode 100644
index 039d131..0000000
--- a/recipes/xorg-app/xset/autofoo.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-diff -urN xset.orig/Makefile.am xset/Makefile.am
---- xset.orig/Makefile.am	1970-01-01 01:00:00.000000000 +0100
-+++ xset/Makefile.am	2004-08-14 16:32:10.000000000 +0200
-@@ -0,0 +1,53 @@
-+# 
-+#  $Id: Makefile.am,v 1.2 2004/06/25 19:38:50 markh Exp $
-+# 
-+#  Copyright © 2003 Keith Packard
-+# 
-+#  Permission to use, copy, modify, distribute, and sell this software and its
-+#  documentation for any purpose is hereby granted without fee, provided that
-+#  the above copyright notice appear in all copies and that both that
-+#  copyright notice and this permission notice appear in supporting
-+#  documentation, and that the name of Keith Packard not be used in
-+#  advertising or publicity pertaining to distribution of the software without
-+#  specific, written prior permission.  Keith Packard makes no
-+#  representations about the suitability of this software for any purpose.  It
-+#  is provided "as is" without express or implied warranty.
-+# 
-+#  KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
-+#  INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
-+#  EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
-+#  CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
-+#  DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
-+#  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-+#  PERFORMANCE OF THIS SOFTWARE.
-+#
-+
-+AUTOMAKE_OPTIONS = 1.7 foreign
-+
-+AM_CFLAGS = @XSET_CFLAGS@
-+
-+bin_PROGRAMS = xset
-+
-+xset_SOURCES = xset.c
-+
-+xset_LDADD = @XSET_LIBS@
-+
-+man5_MANS=xset.man
-+
-+EXTRA_DIST= $(man5_MANS)
-+
-+MAINTAINERCLEANFILES = configure \
-+config.guess \
-+config.sub \
-+install-sh \
-+ltmain.sh \
-+missing \
-+mkinstalldirs \
-+aclocal.m4 \
-+Makefile.in \
-+depcomp \
-+autoscan.log \
-+configure.scan \
-+config.h \
-+config.h.in \
-+$(man5_MANS)
-diff -urN xset.orig/autogen.sh xset/autogen.sh
---- xset.orig/autogen.sh	1970-01-01 01:00:00.000000000 +0100
-+++ xset/autogen.sh	2004-08-14 16:27:56.000000000 +0200
-@@ -0,0 +1,3 @@
-+#! /bin/sh
-+autoreconf -v --install || exit 1
-+./configure --enable-maintainer-mode "$@"
-diff -urN xset.orig/configure.ac xset/configure.ac
---- xset.orig/configure.ac	1970-01-01 01:00:00.000000000 +0100
-+++ xset/configure.ac	2004-08-17 14:21:25.000000000 +0200
-@@ -0,0 +1,41 @@
-+dnl
-+dnl $Id: configure.ac,v 1.1 2003/10/09 06:16:59 keithp Exp $
-+dnl
-+dnl Copyright © 2003 Keith Packard
-+dnl
-+dnl Permission to use, copy, modify, distribute, and sell this software and its
-+dnl documentation for any purpose is hereby granted without fee, provided that
-+dnl the above copyright notice appear in all copies and that both that
-+dnl copyright notice and this permission notice appear in supporting
-+dnl documentation, and that the name of Keith Packard not be used in
-+dnl advertising or publicity pertaining to distribution of the software without
-+dnl specific, written prior permission.  Keith Packard makes no
-+dnl representations about the suitability of this software for any purpose.  It
-+dnl is provided "as is" without express or implied warranty.
-+dnl
-+dnl KEITH PACKARD DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
-+dnl INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
-+dnl EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
-+dnl CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
-+dnl DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
-+dnl TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-+dnl PERFORMANCE OF THIS SOFTWARE.
-+dnl
-+
-+AC_PREREQ(2.57)
-+AC_INIT([xset],4.4.0,[],xset)
-+AC_CONFIG_SRCDIR([Makefile.am])
-+AM_INIT_AUTOMAKE([dist-bzip2])
-+AM_MAINTAINER_MODE
-+AM_CONFIG_HEADER(config.h)
-+
-+AC_PROG_CC
-+AC_PROG_INSTALL
-+AC_PROG_LN_S
-+AC_LIBTOOL_WIN32_DLL
-+AM_PROG_LIBTOOL
-+AC_PROG_MAKE_SET
-+
-+PKG_CHECK_MODULES(XSET, xext xextensions xmuu x11)
-+
-+AC_OUTPUT([Makefile])
diff --git a/recipes/xorg-app/xset/disable-xkb.patch b/recipes/xorg-app/xset/disable-xkb.patch
deleted file mode 100644
index 6060fbb..0000000
--- a/recipes/xorg-app/xset/disable-xkb.patch
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
diff --git a/recipes/xorg-app/xset_1.0.2.bb b/recipes/xorg-app/xset_1.0.2.bb
deleted file mode 100644
index 35aebe5..0000000
--- a/recipes/xorg-app/xset_1.0.2.bb
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
-SRC_URI[archive.md5sum] = "1b781a0802c7b8fb9619a6665607b3f0"
-SRC_URI[archive.sha256sum] = "ce1e17c513a4499526e648a59c39ba01777c99c86093433cf392f27654b795c9"
-
-EXTRA_OECONF = "--disable-xkb"
-
-CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/xorg-app/xset_1.0.3.bb b/recipes/xorg-app/xset_1.0.3.bb
deleted file mode 100644
index c37b4bb..0000000
--- a/recipes/xorg-app/xset_1.0.3.bb
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
-SRC_URI[archive.md5sum] = "657bbb43ce5470c33665d187c1740566"
-SRC_URI[archive.sha256sum] = "0e3fd7d9902442df13c954316a194251e9b9acc197ae939d8b2fae66b8864d11"
-
-EXTRA_OECONF = "--disable-xkb"
-
-CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/xorg-app/xset_1.0.4.bb b/recipes/xorg-app/xset_1.0.4.bb
deleted file mode 100644
index 24c35e0..0000000
--- a/recipes/xorg-app/xset_1.0.4.bb
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
-SRC_URI[archive.md5sum] = "2f41fd983ba4d89419204854936025e2"
-SRC_URI[archive.sha256sum] = "6c3e74bb36beab92b918f0db12198d2526675276c724558a1de71d7789d0bdad"
-
-EXTRA_OECONF = "--disable-xkb"
-
-CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/xorg-app/xsetpointer_1.0.0.bb b/recipes/xorg-app/xsetpointer_1.0.0.bb
deleted file mode 100644
index 409ea16..0000000
--- a/recipes/xorg-app/xsetpointer_1.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxi "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c94ea103e27e370e4e5030e50c5d5d69"
-SRC_URI[archive.sha256sum] = "7d65f450420b4f764dcf38e4ccee9d608b5a5874706e716cb861bfe2586b7d4a"
diff --git a/recipes/xorg-app/xsetroot_1.0.1.bb b/recipes/xorg-app/xsetroot_1.0.1.bb
deleted file mode 100644
index c81a319..0000000
--- a/recipes/xorg-app/xsetroot_1.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "Sets the visual appearance of the X root window"
-LICENSE = "MIT"
-DEPENDS += "libxmu xbitmaps"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fc7eeb7130bb54345671a9dbaab567ac"
-SRC_URI[archive.sha256sum] = "897d77acd3f4a366472386139827eaac24cc423c811ef0e65e0d5eca099a3155"
diff --git a/recipes/xorg-app/xsetroot_1.0.2.bb b/recipes/xorg-app/xsetroot_1.0.2.bb
deleted file mode 100644
index dc79d52..0000000
--- a/recipes/xorg-app/xsetroot_1.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "Sets the visual appearance of the X root window"
-LICENSE = "MIT"
-DEPENDS += "libxmu xbitmaps"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9af7db9f3052aef0b11636720b3101dd"
-SRC_URI[archive.sha256sum] = "4f9a751f4830d479fae8ccb68ed04896dc99612789310b7917bd15c04aa3351d"
diff --git a/recipes/xorg-app/xvinfo_1.0.1.bb b/recipes/xorg-app/xvinfo_1.0.1.bb
deleted file mode 100644
index ee77b80..0000000
--- a/recipes/xorg-app/xvinfo_1.0.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "Print out X-Video extension adaptor information"
-DEPENDS += " libxv"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0a5bd8e43de6eb8ff5b5bc673204401d"
-SRC_URI[archive.sha256sum] = "439b3c7ad96fc7b1ef9156c716e10b607883a9a58b777f8dc02f03284eb33fb3"
diff --git a/recipes/xorg-app/xvinfo_1.0.2.bb b/recipes/xorg-app/xvinfo_1.0.2.bb
deleted file mode 100644
index 8422d34..0000000
--- a/recipes/xorg-app/xvinfo_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "Print out X-Video extension adaptor information"
-DEPENDS += " libxv"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e1e318436f49e2f0f3764593dadd9ad2"
-SRC_URI[archive.sha256sum] = "126e2a612ac723f9688904fcfa612688d62e520ce55c56eb34eb5390074cf150"
diff --git a/recipes/xorg-app/xwd_1.0.1.bb b/recipes/xorg-app/xwd_1.0.1.bb
deleted file mode 100644
index bfe181b..0000000
--- a/recipes/xorg-app/xwd_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "911addfb7fa402217ddac63e5c1d97c7"
-SRC_URI[archive.sha256sum] = "c8bd9bcd64df439c2cd09eaa3e83a1297fbfed5c7d3dd8117342b3a25eeae131"
diff --git a/recipes/xorg-app/xwd_1.0.2.bb b/recipes/xorg-app/xwd_1.0.2.bb
deleted file mode 100644
index 597aa05..0000000
--- a/recipes/xorg-app/xwd_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0a6ef08a2ac08ad5c4dd1522eb3788a3"
-SRC_URI[archive.sha256sum] = "ab8974e010c1957a9a65a54656215463dea324adcaa9954147ecdcc6e9307f61"
diff --git a/recipes/xorg-app/xwininfo_1.0.2.bb b/recipes/xorg-app/xwininfo_1.0.2.bb
deleted file mode 100644
index 288af54..0000000
--- a/recipes/xorg-app/xwininfo_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu libxext "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e5dbc8866a55958297f5f38205b6be1e"
-SRC_URI[archive.sha256sum] = "9fdfd3259b335531cdba831872ec0e32c5f6df01e14b87c3187b494be75b7b66"
diff --git a/recipes/xorg-app/xwininfo_1.0.3.bb b/recipes/xorg-app/xwininfo_1.0.3.bb
deleted file mode 100644
index 01f6c9b..0000000
--- a/recipes/xorg-app/xwininfo_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "window information utility for X"
-DEPENDS += " libxmu libxext "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "721f84332c98c33152460bb22ba9ded6"
-SRC_URI[archive.sha256sum] = "fbe3a1aafbc6fa113e58971ff2a82605a7e106af8b810eea4b7512de58a5478a"
diff --git a/recipes/xorg-app/xwininfo_1.0.4.bb b/recipes/xorg-app/xwininfo_1.0.4.bb
deleted file mode 100644
index 317aa1d..0000000
--- a/recipes/xorg-app/xwininfo_1.0.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxmu libxext "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e2a9bf5ab7f2a0866700a3b49dd8c6bf"
-SRC_URI[archive.sha256sum] = "df9a52788632cd3338e7bd7107ac732b11b8e2c367d4600578cd77e350428ee4"
diff --git a/recipes/xorg-app/xwud_1.0.1.bb b/recipes/xorg-app/xwud_1.0.1.bb
deleted file mode 100644
index 53d06df..0000000
--- a/recipes/xorg-app/xwud_1.0.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-app-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6e3c5d0297d88e890b6f5df31f73dd60"
-SRC_URI[archive.sha256sum] = "d2de2d39b4479e23adc92d131f66e87db41441aae11b72991bb01d5f6c93336c"
-- 
1.7.2




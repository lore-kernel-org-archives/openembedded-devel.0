Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol1e2-00067K-4e
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 17:30:38 +0200
Received: by mail-fx0-f47.google.com with SMTP id 6so3100953fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 08:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=nSIF8y3scQAlkHtfY704Gu+wMAyKsLCFgJag7NcKWuo=;
	b=oYXAj+0ofJHuARyBuhHeMYgcvdXGFeF3DINbb/U3FpmO0KL+9ppZEEJABBg2MuZCiz
	cBHNewPRn8V5qFDwjh1Acg4nODJ/nx8mmRiCKlvz/rA397BCMB4HnYO/fLGaOGu+ac8x
	VLPKG+8Wtapp4INjAJufOHDFBKyC2JovEx0h0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=pMsYJgbAs1VEKuKnCWbY5H2T7AdxKPWrZwfYlfF3/Yn75YwotzEUM/GcGfEUDnMTfh
	0vGZEptsSMwir8fEQ6EQzB+C1QoSglwnHp8LzKqDQBg5sm8gb40YugWn5t77Ly8LQbZM
	3ENoDLrhkH6CUJHz0mTid9e56yK+9iGdUhIsA=
Received: by 10.223.122.146 with SMTP id l18mr5295511far.82.1281972623230;
	Mon, 16 Aug 2010 08:30:23 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d15sm696618faa.1.2010.08.16.08.30.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 08:30:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:30:13 +0200
Message-Id: <1281972620-7317-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Scanned: No (on linuxtogo.org);
	Message bigger than SAmaxbody (256000)
Subject: [PATCH 2/9] xorg-lib: move older not pinned versions to obsolete dir
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
X-List-Received-Date: Mon, 16 Aug 2010 15:30:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.1.bb   |   12 +
 recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.2.bb   |   10 +
 recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.3.bb   |   10 +
 recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.4.bb   |   10 +
 recipes/obsolete/xorg/xorg-lib/libapplewm_1.0.0.bb |    9 +
 recipes/obsolete/xorg/xorg-lib/libdmx_1.0.2.bb     |    8 +
 recipes/obsolete/xorg/xorg-lib/libfontenc_1.0.4.bb |   11 +
 recipes/obsolete/xorg/xorg-lib/libfs_1.0.0.bb      |   10 +
 recipes/obsolete/xorg/xorg-lib/libfs_1.0.1.bb      |   10 +
 recipes/obsolete/xorg/xorg-lib/libice_1.0.3.bb     |   12 +
 recipes/obsolete/xorg/xorg-lib/libice_1.0.4.bb     |   12 +
 .../xorg/xorg-lib/liblbxutil/mkg3states.patch      |   51 +
 recipes/obsolete/xorg/xorg-lib/liblbxutil_1.0.1.bb |   11 +
 .../xorg-lib/libpciaccess/fix-mtrr-check.patch     |   19 +
 .../obsolete/xorg/xorg-lib/libpciaccess_0.10.3.bb  |    7 +
 .../obsolete/xorg/xorg-lib/libpciaccess_0.11.0.bb  |    6 +
 recipes/obsolete/xorg/xorg-lib/libsm_1.0.2.bb      |   13 +
 recipes/obsolete/xorg/xorg-lib/libsm_1.0.3.bb      |   12 +
 recipes/obsolete/xorg/xorg-lib/libsm_1.1.0.bb      |   12 +
 .../obsolete/xorg/xorg-lib/libwindowswm_1.0.0.bb   |    9 +
 .../xorg-lib/libx11-1.0.1/keysymdef_include.patch  |   62 +
 .../libx11-1.0.1/x11_disable_makekeys.patch        |   15 +
 .../xorg-lib/libx11-1.0.3/keysymdef_include.patch  |   62 +
 .../libx11-1.0.3/x11_disable_makekeys.patch        |   15 +
 .../xorg-lib/libx11-1.1.1/keysymdef_include.patch  |   62 +
 .../xorg-lib/libx11-1.1.2/keysymdef_include.patch  |   62 +
 .../xorg-lib/libx11-1.1.3/keysymdef_include.patch  |   62 +
 .../xorg-lib/libx11-1.1.4/keysymdef_include.patch  |   62 +
 .../xorg-lib/libx11-1.2/x11_disable_makekeys.patch |   23 +
 .../xorg/xorg-lib/libx11-1.3.3+git/dolt-fix.patch  |   22 +
 .../libx11-1.3.3+git/keysymdef_include.patch       |   29 +
 .../libx11-1.3.3+git/x11_disable_makekeys.patch    |   26 +
 .../libx11-1.3.3/x11_disable_makekeys.patch        |   23 +
 .../xorg/xorg-lib/libx11-1.3.4/dolt-fix.patch      |   22 +
 .../xorg-lib/libx11-1.3.4/keysymdef_include.patch  |   21 +
 .../libx11-1.3.4/x11_disable_makekeys.patch        |   29 +
 recipes/obsolete/xorg/xorg-lib/libx11/ruutf8.patch |   12 +
 .../obsolete/xorg/xorg-lib/libx11/xchar2b.patch    |   13 +
 recipes/obsolete/xorg/xorg-lib/libx11/xim.patch    |   55 +
 recipes/obsolete/xorg/xorg-lib/libx11_1.0.1.bb     |   10 +
 recipes/obsolete/xorg/xorg-lib/libx11_1.0.3.bb     |   10 +
 recipes/obsolete/xorg/xorg-lib/libx11_1.1.1.bb     |    9 +
 recipes/obsolete/xorg/xorg-lib/libx11_1.1.2.bb     |    8 +
 recipes/obsolete/xorg/xorg-lib/libx11_1.1.3.bb     |    8 +
 recipes/obsolete/xorg/xorg-lib/libx11_1.1.4.bb     |    8 +
 recipes/obsolete/xorg/xorg-lib/libx11_1.2.bb       |    9 +
 recipes/obsolete/xorg/xorg-lib/libx11_1.3.3.bb     |    6 +
 recipes/obsolete/xorg/xorg-lib/libx11_1.3.4.bb     |    6 +
 recipes/obsolete/xorg/xorg-lib/libx11_git.bb       |   14 +
 recipes/obsolete/xorg/xorg-lib/libxau_1.0.3.bb     |   12 +
 recipes/obsolete/xorg/xorg-lib/libxau_1.0.4.bb     |   12 +
 recipes/obsolete/xorg/xorg-lib/libxaw_1.0.3.bb     |   22 +
 recipes/obsolete/xorg/xorg-lib/libxaw_1.0.4.bb     |   22 +
 .../libxcomposite/change-include-order.patch       |   14 +
 .../obsolete/xorg/xorg-lib/libxcomposite_0.3.1.bb  |   12 +
 .../obsolete/xorg/xorg-lib/libxcomposite_0.4.0.bb  |   12 +
 recipes/obsolete/xorg/xorg-lib/libxcursor_1.1.8.bb |   13 +
 recipes/obsolete/xorg/xorg-lib/libxcursor_1.1.9.bb |   13 +
 recipes/obsolete/xorg/xorg-lib/libxdamage_1.0.4.bb |   11 +
 recipes/obsolete/xorg/xorg-lib/libxdamage_1.1.1.bb |   11 +
 recipes/obsolete/xorg/xorg-lib/libxdmcp_1.0.2.bb   |   12 +
 recipes/obsolete/xorg/xorg-lib/libxext_1.0.2.bb    |   13 +
 recipes/obsolete/xorg/xorg-lib/libxext_1.0.3.bb    |   12 +
 recipes/obsolete/xorg/xorg-lib/libxext_1.0.4.bb    |   12 +
 recipes/obsolete/xorg/xorg-lib/libxext_1.0.5.bb    |   12 +
 recipes/obsolete/xorg/xorg-lib/libxfixes_4.0.3.bb  |   13 +
 .../builtinreaddirectory-no-side-effect.patch      |  188 +++
 .../xorg/xorg-lib/libxfont/no-scalable-crash.patch |   22 +
 recipes/obsolete/xorg/xorg-lib/libxfont_1.2.7.bb   |   15 +
 recipes/obsolete/xorg/xorg-lib/libxfont_1.2.8.bb   |   15 +
 recipes/obsolete/xorg/xorg-lib/libxfont_1.3.0.bb   |   15 +
 recipes/obsolete/xorg/xorg-lib/libxfont_1.3.1.bb   |   14 +
 recipes/obsolete/xorg/xorg-lib/libxfont_1.3.2.bb   |   14 +
 recipes/obsolete/xorg/xorg-lib/libxfont_1.3.3.bb   |   13 +
 .../obsolete/xorg/xorg-lib/libxfontcache_1.0.4.bb  |   10 +
 recipes/obsolete/xorg/xorg-lib/libxft_2.1.12.bb    |   21 +
 recipes/obsolete/xorg/xorg-lib/libxft_2.1.13.bb    |   21 +
 recipes/obsolete/xorg/xorg-lib/libxi_1.0.2.bb      |   10 +
 recipes/obsolete/xorg/xorg-lib/libxi_1.1.0.bb      |   10 +
 recipes/obsolete/xorg/xorg-lib/libxi_1.1.2.bb      |   10 +
 recipes/obsolete/xorg/xorg-lib/libxi_1.1.3.bb      |   10 +
 recipes/obsolete/xorg/xorg-lib/libxi_1.2.0.bb      |   10 +
 .../obsolete/xorg/xorg-lib/libxinerama_1.0.2.bb    |   10 +
 .../obsolete/xorg/xorg-lib/libxinerama_1.0.3.bb    |   10 +
 recipes/obsolete/xorg/xorg-lib/libxkbfile_1.0.4.bb |   11 +
 recipes/obsolete/xorg/xorg-lib/libxkbfile_1.0.5.bb |   11 +
 recipes/obsolete/xorg/xorg-lib/libxmu_1.0.3.bb     |   17 +
 recipes/obsolete/xorg/xorg-lib/libxmu_1.0.4.bb     |   17 +
 recipes/obsolete/xorg/xorg-lib/libxpm_3.5.6.bb     |   16 +
 recipes/obsolete/xorg/xorg-lib/libxpm_3.5.7.bb     |   16 +
 recipes/obsolete/xorg/xorg-lib/libxrandr_1.1.2.bb  |   13 +
 recipes/obsolete/xorg/xorg-lib/libxrandr_1.2.2.bb  |   13 +
 recipes/obsolete/xorg/xorg-lib/libxrandr_1.2.3.bb  |   13 +
 recipes/obsolete/xorg/xorg-lib/libxrender_0.9.2.bb |   13 +
 recipes/obsolete/xorg/xorg-lib/libxrender_0.9.3.bb |   13 +
 recipes/obsolete/xorg/xorg-lib/libxrender_0.9.4.bb |   13 +
 recipes/obsolete/xorg/xorg-lib/libxres_1.0.3.bb    |   10 +
 .../obsolete/xorg/xorg-lib/libxscrnsaver_1.1.2.bb  |   13 +
 .../obsolete/xorg/xorg-lib/libxscrnsaver_1.1.3.bb  |   13 +
 .../xorg/xorg-lib/libxt/pr10970-header-fix.patch   |  512 ++++++
 recipes/obsolete/xorg/xorg-lib/libxt_1.0.4.bb      |   24 +
 recipes/obsolete/xorg/xorg-lib/libxt_1.0.5.bb      |   23 +
 recipes/obsolete/xorg/xorg-lib/libxtst_1.0.2.bb    |   10 +
 recipes/obsolete/xorg/xorg-lib/libxtst_1.0.3.bb    |   10 +
 recipes/obsolete/xorg/xorg-lib/libxv_1.0.3.bb      |   10 +
 recipes/obsolete/xorg/xorg-lib/libxv_1.0.4.bb      |   10 +
 recipes/obsolete/xorg/xorg-lib/libxvmc/drm.patch   |    9 +
 recipes/obsolete/xorg/xorg-lib/libxvmc/true.patch  |   11 +
 recipes/obsolete/xorg/xorg-lib/libxvmc/via.patch   |   23 +
 recipes/obsolete/xorg/xorg-lib/libxvmc_1.0.4.bb    |   10 +
 recipes/obsolete/xorg/xorg-lib/libxvmc_1.0.5.bb    |   10 +
 .../obsolete/xorg/xorg-lib/libxxf86dga_1.0.1.bb    |   10 +
 .../obsolete/xorg/xorg-lib/libxxf86dga_1.0.2.bb    |   10 +
 .../obsolete/xorg/xorg-lib/libxxf86misc_1.0.1.bb   |   10 +
 recipes/obsolete/xorg/xorg-lib/libxxf86vm_1.0.1.bb |   10 +
 recipes/obsolete/xorg/xorg-lib/libxxf86vm_1.0.2.bb |   10 +
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 ++
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 ++
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 ++
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 ++
 .../xorg/xorg-lib/pixman-0.17.8/1-composite.patch  |  161 ++
 .../xorg/xorg-lib/pixman-0.17.8/2-composite.patch  |  102 ++
 .../xorg/xorg-lib/pixman-0.17.8/3-composite.patch  |  108 ++
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 ++
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 ++
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 ++
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 ++
 ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  169 ++
 .../xorg/xorg-lib/pixman-0.18.0/565-scanline.patch |  257 +++
 .../pixman-0.18.0/missing-cache-preload.diff       |   28 +
 .../dont-copy-unused-bits-to-alpha-channel.patch   |   29 +
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 ++
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 ++
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 ++
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 ++
 ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  169 ++
 ...SIMD-Try-without-any-CFLAGS-before-forcin.patch |   53 +
 recipes/obsolete/xorg/xorg-lib/pixman/calloc.patch |   23 +
 .../xorg/xorg-lib/pixman/nearest-neighbour.patch   | 1040 ++++++++++++
 .../xorg/xorg-lib/pixman/over-n-8-0565.patch       |  231 +++
 .../xorg/xorg-lib/pixman/pixman-28986.patch        |   32 +
 .../obsolete/xorg/xorg-lib/pixman/prefetch.patch   |  298 ++++
 .../xorg/xorg-lib/pixman/remove-broken.patch       |  826 ++++++++++
 .../xorg/xorg-lib/pixman/src-8888-0565.patch       |  324 ++++
 recipes/obsolete/xorg/xorg-lib/pixman/tls.patch    |   59 +
 recipes/obsolete/xorg/xorg-lib/pixman_0.10.0.bb    |    5 +
 recipes/obsolete/xorg/xorg-lib/pixman_0.11.4.bb    |    7 +
 recipes/obsolete/xorg/xorg-lib/pixman_0.11.8.bb    |    9 +
 recipes/obsolete/xorg/xorg-lib/pixman_0.15.18.bb   |    7 +
 recipes/obsolete/xorg/xorg-lib/pixman_0.15.6.bb    |    7 +
 recipes/obsolete/xorg/xorg-lib/pixman_0.17.12.bb   |   24 +
 recipes/obsolete/xorg/xorg-lib/pixman_0.17.8.bb    |   23 +
 recipes/obsolete/xorg/xorg-lib/pixman_0.18.0.bb    |   24 +
 recipes/obsolete/xorg/xorg-lib/pixman_0.9.4.bb     |    7 +
 recipes/obsolete/xorg/xorg-lib/pixman_0.9.5.bb     |    8 +
 recipes/obsolete/xorg/xorg-lib/pixman_git.bb       |   27 +
 .../xorg-lib/xtrans/fix-missing-includepath.patch  |   13 +
 recipes/obsolete/xorg/xorg-lib/xtrans_1.0.3.bb     |   15 +
 recipes/obsolete/xorg/xorg-lib/xtrans_1.0.4.bb     |   15 +
 recipes/obsolete/xorg/xorg-lib/xtrans_1.1.bb       |   15 +
 recipes/obsolete/xorg/xorg-lib/xtrans_1.2.1.bb     |   15 +
 recipes/obsolete/xorg/xorg-lib/xtrans_1.2.3.bb     |   15 +
 recipes/obsolete/xorg/xorg-lib/xtrans_1.2.bb       |   15 +
 recipes/xorg-lib/diet-x11_1.1.1.bb                 |   12 -
 recipes/xorg-lib/diet-x11_1.1.2.bb                 |   10 -
 recipes/xorg-lib/diet-x11_1.1.3.bb                 |   10 -
 recipes/xorg-lib/diet-x11_1.1.4.bb                 |   10 -
 recipes/xorg-lib/libapplewm_1.0.0.bb               |    9 -
 recipes/xorg-lib/libdmx_1.0.2.bb                   |    8 -
 recipes/xorg-lib/libfontenc_1.0.4.bb               |   11 -
 recipes/xorg-lib/libfs_1.0.0.bb                    |   10 -
 recipes/xorg-lib/libfs_1.0.1.bb                    |   10 -
 recipes/xorg-lib/libice_1.0.3.bb                   |   12 -
 recipes/xorg-lib/libice_1.0.4.bb                   |   12 -
 .../xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch |   55 +
 recipes/xorg-lib/liblbxutil/mkg3states-1.1.patch   |   55 -
 recipes/xorg-lib/liblbxutil/mkg3states.patch       |   51 -
 recipes/xorg-lib/liblbxutil_1.0.1.bb               |   11 -
 recipes/xorg-lib/libpciaccess/fix-mtrr-check.patch |   19 -
 recipes/xorg-lib/libpciaccess_0.10.3.bb            |    7 -
 recipes/xorg-lib/libpciaccess_0.11.0.bb            |    6 -
 recipes/xorg-lib/libsm_1.0.2.bb                    |   13 -
 recipes/xorg-lib/libsm_1.0.3.bb                    |   12 -
 recipes/xorg-lib/libsm_1.1.0.bb                    |   12 -
 recipes/xorg-lib/libwindowswm_1.0.0.bb             |    9 -
 .../xorg-lib/libx11-1.0.1/keysymdef_include.patch  |   62 -
 .../libx11-1.0.1/x11_disable_makekeys.patch        |   15 -
 .../xorg-lib/libx11-1.0.3/keysymdef_include.patch  |   62 -
 .../libx11-1.0.3/x11_disable_makekeys.patch        |   15 -
 .../xorg-lib/libx11-1.1.1/keysymdef_include.patch  |   62 -
 .../xorg-lib/libx11-1.1.2/keysymdef_include.patch  |   62 -
 .../xorg-lib/libx11-1.1.3/keysymdef_include.patch  |   62 -
 .../xorg-lib/libx11-1.1.4/keysymdef_include.patch  |   62 -
 recipes/xorg-lib/libx11-1.1.5/X18NCMSstubs.diff    |  528 ++++++
 recipes/xorg-lib/libx11-1.1.5/dolt-fix.patch       |   21 +
 .../xorg-lib/libx11-1.1.5/fix-disable-xlocale.diff |   14 +
 .../libx11-1.1.5/fix-utf8-wrong-define.patch       |   16 +
 .../xorg-lib/libx11-1.1.5/keysymdef_include.patch  |   29 +
 .../xorg-lib/libx11-1.1.5/makekeys-update.patch    |   87 +
 .../libx11-1.1.5/x11_disable_makekeys.patch        |   30 +
 .../xorg-lib/libx11-1.2/x11_disable_makekeys.patch |   23 -
 recipes/xorg-lib/libx11-1.3.2/dolt-fix.patch       |   21 +
 .../xorg-lib/libx11-1.3.2/keysymdef_include.patch  |   29 +
 recipes/xorg-lib/libx11-1.3.3+git/dolt-fix.patch   |   22 -
 .../libx11-1.3.3+git/keysymdef_include.patch       |   29 -
 .../libx11-1.3.3+git/x11_disable_makekeys.patch    |   26 -
 .../libx11-1.3.3/x11_disable_makekeys.patch        |   23 -
 recipes/xorg-lib/libx11-1.3.4/dolt-fix.patch       |   22 -
 .../xorg-lib/libx11-1.3.4/keysymdef_include.patch  |   21 -
 .../libx11-1.3.4/x11_disable_makekeys.patch        |   29 -
 recipes/xorg-lib/libx11/X18NCMSstubs.diff          |  528 ------
 recipes/xorg-lib/libx11/dolt-fix.patch             |   21 -
 recipes/xorg-lib/libx11/fix-disable-xlocale.diff   |   14 -
 .../xorg-lib/libx11/fix-utf8-wrong-define.patch    |   16 -
 recipes/xorg-lib/libx11/keysymdef_include.patch    |   29 -
 recipes/xorg-lib/libx11/makekeys-update.patch      |   87 -
 recipes/xorg-lib/libx11/ruutf8.patch               |   12 -
 recipes/xorg-lib/libx11/x11_disable_makekeys.patch |   30 -
 recipes/xorg-lib/libx11/xchar2b.patch              |   13 -
 recipes/xorg-lib/libx11/xim.patch                  |   55 -
 recipes/xorg-lib/libx11_1.0.1.bb                   |   10 -
 recipes/xorg-lib/libx11_1.0.3.bb                   |   10 -
 recipes/xorg-lib/libx11_1.1.1.bb                   |    9 -
 recipes/xorg-lib/libx11_1.1.2.bb                   |    8 -
 recipes/xorg-lib/libx11_1.1.3.bb                   |    8 -
 recipes/xorg-lib/libx11_1.1.4.bb                   |    8 -
 recipes/xorg-lib/libx11_1.2.bb                     |    9 -
 recipes/xorg-lib/libx11_1.3.3.bb                   |    6 -
 recipes/xorg-lib/libx11_1.3.4.bb                   |    6 -
 recipes/xorg-lib/libx11_git.bb                     |   14 -
 recipes/xorg-lib/libxau_1.0.3.bb                   |   12 -
 recipes/xorg-lib/libxau_1.0.4.bb                   |   12 -
 recipes/xorg-lib/libxaw_1.0.3.bb                   |   22 -
 recipes/xorg-lib/libxaw_1.0.4.bb                   |   22 -
 .../libxcomposite/change-include-order.patch       |   14 -
 recipes/xorg-lib/libxcomposite_0.3.1.bb            |   12 -
 recipes/xorg-lib/libxcomposite_0.4.0.bb            |   12 -
 recipes/xorg-lib/libxcursor_1.1.8.bb               |   13 -
 recipes/xorg-lib/libxcursor_1.1.9.bb               |   13 -
 recipes/xorg-lib/libxdamage_1.0.4.bb               |   11 -
 recipes/xorg-lib/libxdamage_1.1.1.bb               |   11 -
 recipes/xorg-lib/libxdmcp_1.0.2.bb                 |   12 -
 recipes/xorg-lib/libxext_1.0.2.bb                  |   13 -
 recipes/xorg-lib/libxext_1.0.3.bb                  |   12 -
 recipes/xorg-lib/libxext_1.0.4.bb                  |   12 -
 recipes/xorg-lib/libxext_1.0.5.bb                  |   12 -
 recipes/xorg-lib/libxfixes_4.0.3.bb                |   13 -
 .../builtinreaddirectory-no-side-effect.patch      |  188 ---
 recipes/xorg-lib/libxfont/no-scalable-crash.patch  |   22 -
 recipes/xorg-lib/libxfont_1.2.7.bb                 |   15 -
 recipes/xorg-lib/libxfont_1.2.8.bb                 |   15 -
 recipes/xorg-lib/libxfont_1.3.0.bb                 |   15 -
 recipes/xorg-lib/libxfont_1.3.1.bb                 |   14 -
 recipes/xorg-lib/libxfont_1.3.2.bb                 |   14 -
 recipes/xorg-lib/libxfont_1.3.3.bb                 |   13 -
 recipes/xorg-lib/libxfontcache_1.0.4.bb            |   10 -
 recipes/xorg-lib/libxft_2.1.12.bb                  |   21 -
 recipes/xorg-lib/libxft_2.1.13.bb                  |   21 -
 recipes/xorg-lib/libxi_1.0.2.bb                    |   10 -
 recipes/xorg-lib/libxi_1.1.0.bb                    |   10 -
 recipes/xorg-lib/libxi_1.1.2.bb                    |   10 -
 recipes/xorg-lib/libxi_1.1.3.bb                    |   10 -
 recipes/xorg-lib/libxi_1.2.0.bb                    |   10 -
 recipes/xorg-lib/libxinerama_1.0.2.bb              |   10 -
 recipes/xorg-lib/libxinerama_1.0.3.bb              |   10 -
 recipes/xorg-lib/libxkbfile_1.0.4.bb               |   11 -
 recipes/xorg-lib/libxkbfile_1.0.5.bb               |   11 -
 recipes/xorg-lib/libxmu_1.0.3.bb                   |   17 -
 recipes/xorg-lib/libxmu_1.0.4.bb                   |   17 -
 recipes/xorg-lib/libxpm_3.5.6.bb                   |   16 -
 recipes/xorg-lib/libxpm_3.5.7.bb                   |   16 -
 recipes/xorg-lib/libxrandr_1.1.2.bb                |   13 -
 recipes/xorg-lib/libxrandr_1.2.2.bb                |   13 -
 recipes/xorg-lib/libxrandr_1.2.3.bb                |   13 -
 recipes/xorg-lib/libxrender_0.9.2.bb               |   13 -
 recipes/xorg-lib/libxrender_0.9.3.bb               |   13 -
 recipes/xorg-lib/libxrender_0.9.4.bb               |   13 -
 recipes/xorg-lib/libxres_1.0.3.bb                  |   10 -
 recipes/xorg-lib/libxscrnsaver_1.1.2.bb            |   13 -
 recipes/xorg-lib/libxscrnsaver_1.1.3.bb            |   13 -
 recipes/xorg-lib/libxt/pr10970-header-fix.patch    |  512 ------
 recipes/xorg-lib/libxt_1.0.4.bb                    |   24 -
 recipes/xorg-lib/libxt_1.0.5.bb                    |   23 -
 recipes/xorg-lib/libxtst_1.0.2.bb                  |   10 -
 recipes/xorg-lib/libxtst_1.0.3.bb                  |   10 -
 recipes/xorg-lib/libxv_1.0.3.bb                    |   10 -
 recipes/xorg-lib/libxv_1.0.4.bb                    |   10 -
 recipes/xorg-lib/libxvmc/drm.patch                 |    9 -
 recipes/xorg-lib/libxvmc/true.patch                |   11 -
 recipes/xorg-lib/libxvmc/via.patch                 |   23 -
 recipes/xorg-lib/libxvmc_1.0.4.bb                  |   10 -
 recipes/xorg-lib/libxvmc_1.0.5.bb                  |   10 -
 recipes/xorg-lib/libxxf86dga_1.0.1.bb              |   10 -
 recipes/xorg-lib/libxxf86dga_1.0.2.bb              |   10 -
 recipes/xorg-lib/libxxf86misc_1.0.1.bb             |   10 -
 recipes/xorg-lib/libxxf86vm_1.0.1.bb               |   10 -
 recipes/xorg-lib/libxxf86vm_1.0.2.bb               |   10 -
 recipes/xorg-lib/pixman-0.12.0/pixman-arm.patch    |  632 ++++++++
 .../xorg-lib/pixman-0.12.0/pixman-x888-565.patch   |   68 +
 .../pixman-0.13.2/pixman-0.13.2-neon1.patch        | 1702 ++++++++++++++++++++
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 --
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 --
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 --
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 --
 recipes/xorg-lib/pixman-0.17.8/1-composite.patch   |  161 --
 recipes/xorg-lib/pixman-0.17.8/2-composite.patch   |  102 --
 recipes/xorg-lib/pixman-0.17.8/3-composite.patch   |  108 --
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 --
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 --
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 --
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 --
 ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  169 --
 recipes/xorg-lib/pixman-0.18.0/565-scanline.patch  |  257 ---
 .../pixman-0.18.0/missing-cache-preload.diff       |   28 -
 .../dont-copy-unused-bits-to-alpha-channel.patch   |   29 -
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 --
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 --
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 --
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 --
 ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  169 --
 ...SIMD-Try-without-any-CFLAGS-before-forcin.patch |   53 -
 recipes/xorg-lib/pixman/calloc.patch               |   23 -
 recipes/xorg-lib/pixman/nearest-neighbour.patch    | 1040 ------------
 recipes/xorg-lib/pixman/over-n-8-0565.patch        |  231 ---
 recipes/xorg-lib/pixman/pixman-0.13.2-neon1.patch  | 1702 --------------------
 recipes/xorg-lib/pixman/pixman-28986.patch         |   32 -
 recipes/xorg-lib/pixman/pixman-arm.patch           |  632 --------
 recipes/xorg-lib/pixman/pixman-x888-565.patch      |   68 -
 recipes/xorg-lib/pixman/prefetch.patch             |  298 ----
 recipes/xorg-lib/pixman/remove-broken.patch        |  826 ----------
 recipes/xorg-lib/pixman/src-8888-0565.patch        |  324 ----
 recipes/xorg-lib/pixman/tls.patch                  |   59 -
 recipes/xorg-lib/pixman_0.10.0.bb                  |    5 -
 recipes/xorg-lib/pixman_0.11.4.bb                  |    7 -
 recipes/xorg-lib/pixman_0.11.8.bb                  |    9 -
 recipes/xorg-lib/pixman_0.15.18.bb                 |    7 -
 recipes/xorg-lib/pixman_0.15.6.bb                  |    7 -
 recipes/xorg-lib/pixman_0.17.12.bb                 |   24 -
 recipes/xorg-lib/pixman_0.17.8.bb                  |   23 -
 recipes/xorg-lib/pixman_0.18.0.bb                  |   24 -
 recipes/xorg-lib/pixman_0.9.4.bb                   |    7 -
 recipes/xorg-lib/pixman_0.9.5.bb                   |    8 -
 recipes/xorg-lib/pixman_git.bb                     |   27 -
 .../xorg-lib/xtrans/fix-missing-includepath.patch  |   13 -
 recipes/xorg-lib/xtrans_1.0.3.bb                   |   15 -
 recipes/xorg-lib/xtrans_1.0.4.bb                   |   15 -
 recipes/xorg-lib/xtrans_1.1.bb                     |   15 -
 recipes/xorg-lib/xtrans_1.2.1.bb                   |   15 -
 recipes/xorg-lib/xtrans_1.2.3.bb                   |   15 -
 recipes/xorg-lib/xtrans_1.2.bb                     |   15 -
 350 files changed, 11141 insertions(+), 11091 deletions(-)
 create mode 100644 recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libapplewm_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libdmx_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libfontenc_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libfs_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libfs_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libice_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libice_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/liblbxutil/mkg3states.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/liblbxutil_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libpciaccess/fix-mtrr-check.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libpciaccess_0.10.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libpciaccess_0.11.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libsm_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libsm_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libsm_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libwindowswm_1.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.0.1/keysymdef_include.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.0.1/x11_disable_makekeys.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.0.3/keysymdef_include.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.0.3/x11_disable_makekeys.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.1.1/keysymdef_include.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.1.2/keysymdef_include.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.1.3/keysymdef_include.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.1.4/keysymdef_include.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.2/x11_disable_makekeys.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/dolt-fix.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/keysymdef_include.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/x11_disable_makekeys.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/dolt-fix.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/keysymdef_include.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11/ruutf8.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11/xchar2b.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11/xim.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11_1.1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11_1.1.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11_1.1.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11_1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11_1.3.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11_1.3.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libx11_git.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxau_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxau_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxaw_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxaw_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxcomposite/change-include-order.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxcomposite_0.3.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxcomposite_0.4.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxcursor_1.1.8.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxcursor_1.1.9.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxdamage_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxdamage_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxdmcp_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxext_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxext_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxext_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxext_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxfixes_4.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxfont/builtinreaddirectory-no-side-effect.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxfont/no-scalable-crash.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxfont_1.2.7.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxfont_1.2.8.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxfont_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxfont_1.3.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxfont_1.3.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxfont_1.3.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxfontcache_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxft_2.1.12.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxft_2.1.13.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxi_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxi_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxi_1.1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxi_1.1.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxi_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxinerama_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxinerama_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxkbfile_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxkbfile_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxmu_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxmu_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxpm_3.5.6.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxpm_3.5.7.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxrandr_1.1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxrandr_1.2.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxrandr_1.2.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxrender_0.9.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxrender_0.9.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxrender_0.9.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxres_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxscrnsaver_1.1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxscrnsaver_1.1.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxt/pr10970-header-fix.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxt_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxt_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxtst_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxtst_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxv_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxv_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxvmc/drm.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxvmc/true.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxvmc/via.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxvmc_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxvmc_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxxf86dga_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxxf86dga_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxxf86misc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxxf86vm_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/libxxf86vm_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/1-composite.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/2-composite.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/3-composite.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/565-scanline.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/missing-cache-preload.diff
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman-0.9.5/dont-copy-unused-bits-to-alpha-channel.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/calloc.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/nearest-neighbour.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/over-n-8-0565.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/pixman-28986.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/prefetch.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/remove-broken.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/src-8888-0565.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman/tls.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman_0.10.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman_0.11.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman_0.11.8.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman_0.15.18.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman_0.15.6.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman_0.17.12.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman_0.17.8.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman_0.18.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman_0.9.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman_0.9.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/pixman_git.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/xtrans/fix-missing-includepath.patch
 create mode 100644 recipes/obsolete/xorg/xorg-lib/xtrans_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/xtrans_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/xtrans_1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/xtrans_1.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/xtrans_1.2.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-lib/xtrans_1.2.bb
 delete mode 100644 recipes/xorg-lib/diet-x11_1.1.1.bb
 delete mode 100644 recipes/xorg-lib/diet-x11_1.1.2.bb
 delete mode 100644 recipes/xorg-lib/diet-x11_1.1.3.bb
 delete mode 100644 recipes/xorg-lib/diet-x11_1.1.4.bb
 delete mode 100644 recipes/xorg-lib/libapplewm_1.0.0.bb
 delete mode 100644 recipes/xorg-lib/libdmx_1.0.2.bb
 delete mode 100644 recipes/xorg-lib/libfontenc_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libfs_1.0.0.bb
 delete mode 100644 recipes/xorg-lib/libfs_1.0.1.bb
 delete mode 100644 recipes/xorg-lib/libice_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libice_1.0.4.bb
 create mode 100644 recipes/xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch
 delete mode 100644 recipes/xorg-lib/liblbxutil/mkg3states-1.1.patch
 delete mode 100644 recipes/xorg-lib/liblbxutil/mkg3states.patch
 delete mode 100644 recipes/xorg-lib/liblbxutil_1.0.1.bb
 delete mode 100644 recipes/xorg-lib/libpciaccess/fix-mtrr-check.patch
 delete mode 100644 recipes/xorg-lib/libpciaccess_0.10.3.bb
 delete mode 100644 recipes/xorg-lib/libpciaccess_0.11.0.bb
 delete mode 100644 recipes/xorg-lib/libsm_1.0.2.bb
 delete mode 100644 recipes/xorg-lib/libsm_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libsm_1.1.0.bb
 delete mode 100644 recipes/xorg-lib/libwindowswm_1.0.0.bb
 delete mode 100644 recipes/xorg-lib/libx11-1.0.1/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.0.1/x11_disable_makekeys.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.0.3/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.0.3/x11_disable_makekeys.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.1.1/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.1.2/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.1.3/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.1.4/keysymdef_include.patch
 create mode 100644 recipes/xorg-lib/libx11-1.1.5/X18NCMSstubs.diff
 create mode 100644 recipes/xorg-lib/libx11-1.1.5/dolt-fix.patch
 create mode 100644 recipes/xorg-lib/libx11-1.1.5/fix-disable-xlocale.diff
 create mode 100644 recipes/xorg-lib/libx11-1.1.5/fix-utf8-wrong-define.patch
 create mode 100644 recipes/xorg-lib/libx11-1.1.5/keysymdef_include.patch
 create mode 100644 recipes/xorg-lib/libx11-1.1.5/makekeys-update.patch
 create mode 100644 recipes/xorg-lib/libx11-1.1.5/x11_disable_makekeys.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.2/x11_disable_makekeys.patch
 create mode 100644 recipes/xorg-lib/libx11-1.3.2/dolt-fix.patch
 create mode 100644 recipes/xorg-lib/libx11-1.3.2/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.3+git/dolt-fix.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.3+git/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.3+git/x11_disable_makekeys.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.4/dolt-fix.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.4/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch
 delete mode 100644 recipes/xorg-lib/libx11/X18NCMSstubs.diff
 delete mode 100644 recipes/xorg-lib/libx11/dolt-fix.patch
 delete mode 100644 recipes/xorg-lib/libx11/fix-disable-xlocale.diff
 delete mode 100644 recipes/xorg-lib/libx11/fix-utf8-wrong-define.patch
 delete mode 100644 recipes/xorg-lib/libx11/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11/makekeys-update.patch
 delete mode 100644 recipes/xorg-lib/libx11/ruutf8.patch
 delete mode 100644 recipes/xorg-lib/libx11/x11_disable_makekeys.patch
 delete mode 100644 recipes/xorg-lib/libx11/xchar2b.patch
 delete mode 100644 recipes/xorg-lib/libx11/xim.patch
 delete mode 100644 recipes/xorg-lib/libx11_1.0.1.bb
 delete mode 100644 recipes/xorg-lib/libx11_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libx11_1.1.1.bb
 delete mode 100644 recipes/xorg-lib/libx11_1.1.2.bb
 delete mode 100644 recipes/xorg-lib/libx11_1.1.3.bb
 delete mode 100644 recipes/xorg-lib/libx11_1.1.4.bb
 delete mode 100644 recipes/xorg-lib/libx11_1.2.bb
 delete mode 100644 recipes/xorg-lib/libx11_1.3.3.bb
 delete mode 100644 recipes/xorg-lib/libx11_1.3.4.bb
 delete mode 100644 recipes/xorg-lib/libx11_git.bb
 delete mode 100644 recipes/xorg-lib/libxau_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libxau_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxaw_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libxaw_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxcomposite/change-include-order.patch
 delete mode 100644 recipes/xorg-lib/libxcomposite_0.3.1.bb
 delete mode 100644 recipes/xorg-lib/libxcomposite_0.4.0.bb
 delete mode 100644 recipes/xorg-lib/libxcursor_1.1.8.bb
 delete mode 100644 recipes/xorg-lib/libxcursor_1.1.9.bb
 delete mode 100644 recipes/xorg-lib/libxdamage_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxdamage_1.1.1.bb
 delete mode 100644 recipes/xorg-lib/libxdmcp_1.0.2.bb
 delete mode 100644 recipes/xorg-lib/libxext_1.0.2.bb
 delete mode 100644 recipes/xorg-lib/libxext_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libxext_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxext_1.0.5.bb
 delete mode 100644 recipes/xorg-lib/libxfixes_4.0.3.bb
 delete mode 100644 recipes/xorg-lib/libxfont/builtinreaddirectory-no-side-effect.patch
 delete mode 100644 recipes/xorg-lib/libxfont/no-scalable-crash.patch
 delete mode 100644 recipes/xorg-lib/libxfont_1.2.7.bb
 delete mode 100644 recipes/xorg-lib/libxfont_1.2.8.bb
 delete mode 100644 recipes/xorg-lib/libxfont_1.3.0.bb
 delete mode 100644 recipes/xorg-lib/libxfont_1.3.1.bb
 delete mode 100644 recipes/xorg-lib/libxfont_1.3.2.bb
 delete mode 100644 recipes/xorg-lib/libxfont_1.3.3.bb
 delete mode 100644 recipes/xorg-lib/libxfontcache_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxft_2.1.12.bb
 delete mode 100644 recipes/xorg-lib/libxft_2.1.13.bb
 delete mode 100644 recipes/xorg-lib/libxi_1.0.2.bb
 delete mode 100644 recipes/xorg-lib/libxi_1.1.0.bb
 delete mode 100644 recipes/xorg-lib/libxi_1.1.2.bb
 delete mode 100644 recipes/xorg-lib/libxi_1.1.3.bb
 delete mode 100644 recipes/xorg-lib/libxi_1.2.0.bb
 delete mode 100644 recipes/xorg-lib/libxinerama_1.0.2.bb
 delete mode 100644 recipes/xorg-lib/libxinerama_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libxkbfile_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxkbfile_1.0.5.bb
 delete mode 100644 recipes/xorg-lib/libxmu_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libxmu_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxpm_3.5.6.bb
 delete mode 100644 recipes/xorg-lib/libxpm_3.5.7.bb
 delete mode 100644 recipes/xorg-lib/libxrandr_1.1.2.bb
 delete mode 100644 recipes/xorg-lib/libxrandr_1.2.2.bb
 delete mode 100644 recipes/xorg-lib/libxrandr_1.2.3.bb
 delete mode 100644 recipes/xorg-lib/libxrender_0.9.2.bb
 delete mode 100644 recipes/xorg-lib/libxrender_0.9.3.bb
 delete mode 100644 recipes/xorg-lib/libxrender_0.9.4.bb
 delete mode 100644 recipes/xorg-lib/libxres_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libxscrnsaver_1.1.2.bb
 delete mode 100644 recipes/xorg-lib/libxscrnsaver_1.1.3.bb
 delete mode 100644 recipes/xorg-lib/libxt/pr10970-header-fix.patch
 delete mode 100644 recipes/xorg-lib/libxt_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxt_1.0.5.bb
 delete mode 100644 recipes/xorg-lib/libxtst_1.0.2.bb
 delete mode 100644 recipes/xorg-lib/libxtst_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libxv_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libxv_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxvmc/drm.patch
 delete mode 100644 recipes/xorg-lib/libxvmc/true.patch
 delete mode 100644 recipes/xorg-lib/libxvmc/via.patch
 delete mode 100644 recipes/xorg-lib/libxvmc_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxvmc_1.0.5.bb
 delete mode 100644 recipes/xorg-lib/libxxf86dga_1.0.1.bb
 delete mode 100644 recipes/xorg-lib/libxxf86dga_1.0.2.bb
 delete mode 100644 recipes/xorg-lib/libxxf86misc_1.0.1.bb
 delete mode 100644 recipes/xorg-lib/libxxf86vm_1.0.1.bb
 delete mode 100644 recipes/xorg-lib/libxxf86vm_1.0.2.bb
 create mode 100644 recipes/xorg-lib/pixman-0.12.0/pixman-arm.patch
 create mode 100644 recipes/xorg-lib/pixman-0.12.0/pixman-x888-565.patch
 create mode 100644 recipes/xorg-lib/pixman-0.13.2/pixman-0.13.2-neon1.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.17.8/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.17.8/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.17.8/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.17.8/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.17.8/1-composite.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.17.8/2-composite.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.17.8/3-composite.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.0/565-scanline.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.0/missing-cache-preload.diff
 delete mode 100644 recipes/xorg-lib/pixman-0.9.5/dont-copy-unused-bits-to-alpha-channel.patch
 delete mode 100644 recipes/xorg-lib/pixman/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 delete mode 100644 recipes/xorg-lib/pixman/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 delete mode 100644 recipes/xorg-lib/pixman/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 delete mode 100644 recipes/xorg-lib/pixman/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 delete mode 100644 recipes/xorg-lib/pixman/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
 delete mode 100644 recipes/xorg-lib/pixman/0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch
 delete mode 100644 recipes/xorg-lib/pixman/calloc.patch
 delete mode 100644 recipes/xorg-lib/pixman/nearest-neighbour.patch
 delete mode 100644 recipes/xorg-lib/pixman/over-n-8-0565.patch
 delete mode 100644 recipes/xorg-lib/pixman/pixman-0.13.2-neon1.patch
 delete mode 100644 recipes/xorg-lib/pixman/pixman-28986.patch
 delete mode 100644 recipes/xorg-lib/pixman/pixman-arm.patch
 delete mode 100644 recipes/xorg-lib/pixman/pixman-x888-565.patch
 delete mode 100644 recipes/xorg-lib/pixman/prefetch.patch
 delete mode 100644 recipes/xorg-lib/pixman/remove-broken.patch
 delete mode 100644 recipes/xorg-lib/pixman/src-8888-0565.patch
 delete mode 100644 recipes/xorg-lib/pixman/tls.patch
 delete mode 100644 recipes/xorg-lib/pixman_0.10.0.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.11.4.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.11.8.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.15.18.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.15.6.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.17.12.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.17.8.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.18.0.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.9.4.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.9.5.bb
 delete mode 100644 recipes/xorg-lib/pixman_git.bb
 delete mode 100644 recipes/xorg-lib/xtrans/fix-missing-includepath.patch
 delete mode 100644 recipes/xorg-lib/xtrans_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/xtrans_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/xtrans_1.1.bb
 delete mode 100644 recipes/xorg-lib/xtrans_1.2.1.bb
 delete mode 100644 recipes/xorg-lib/xtrans_1.2.3.bb
 delete mode 100644 recipes/xorg-lib/xtrans_1.2.bb

diff --git a/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.1.bb b/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.1.bb
new file mode 100644
index 0000000..593ba34
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.1.bb
@@ -0,0 +1,12 @@
+require libx11_${PV}.bb
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://X18NCMSstubs.diff \
+            file://fix-disable-xlocale.diff \
+            file://fix-utf8-wrong-define.patch \
+            file://xim.patch \
+            file://xchar2b.patch"
+
+EXTRA_OECONF += "--without-xcb --disable-udc --enable-xcms --disable-xlocale --disable-xkb"
+
+CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.2.bb b/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.2.bb
new file mode 100644
index 0000000..f6291a9
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.2.bb
@@ -0,0 +1,10 @@
+require libx11_${PV}.bb
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://X18NCMSstubs.diff \
+            file://fix-disable-xlocale.diff \
+            file://fix-utf8-wrong-define.patch"
+
+EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale --disable-xkb"
+
+CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.3.bb b/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.3.bb
new file mode 100644
index 0000000..f6291a9
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.3.bb
@@ -0,0 +1,10 @@
+require libx11_${PV}.bb
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://X18NCMSstubs.diff \
+            file://fix-disable-xlocale.diff \
+            file://fix-utf8-wrong-define.patch"
+
+EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale --disable-xkb"
+
+CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.4.bb b/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.4.bb
new file mode 100644
index 0000000..f6291a9
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/diet-x11_1.1.4.bb
@@ -0,0 +1,10 @@
+require libx11_${PV}.bb
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://X18NCMSstubs.diff \
+            file://fix-disable-xlocale.diff \
+            file://fix-utf8-wrong-define.patch"
+
+EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale --disable-xkb"
+
+CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/obsolete/xorg/xorg-lib/libapplewm_1.0.0.bb b/recipes/obsolete/xorg/xorg-lib/libapplewm_1.0.0.bb
new file mode 100644
index 0000000..6e746b4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libapplewm_1.0.0.bb
@@ -0,0 +1,9 @@
+require xorg-lib-common.inc
+DEPENDS += "libxext applewmproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "48a403c45be2206ee900729ced3a0e62"
+SRC_URI[archive.sha256sum] = "ecd2ff407a418eb4ac673f48b4d0a9c5b6860a13cef7211a32fe8f3d3db0407e"
+
+XORG_PN = "libAppleWM"
diff --git a/recipes/obsolete/xorg/xorg-lib/libdmx_1.0.2.bb b/recipes/obsolete/xorg/xorg-lib/libdmx_1.0.2.bb
new file mode 100644
index 0000000..7d6e025
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libdmx_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Distributed Multihead extension library"
+DEPENDS += "libxext dmxproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4d866967210d06098fc9f302ed4c79b1"
+SRC_URI[archive.sha256sum] = "fa3ff31a543f7cea04762c08f48b418e75230de8b4dfdf9d2d3ae9e2af26b9c4"
diff --git a/recipes/obsolete/xorg/xorg-lib/libfontenc_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libfontenc_1.0.4.bb
new file mode 100644
index 0000000..f16cb77
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libfontenc_1.0.4.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 font encoding library"
+LICENSE = "BSD-X"
+DEPENDS += "zlib xproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5cd16a2e51ca7b96a3081c7486ff98b9"
+SRC_URI[archive.sha256sum] = "b993aa3d17e845a12a49160b5d96993059ce919c7ba902005b910b867b6258c8"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-lib/libfs_1.0.0.bb b/recipes/obsolete/xorg/xorg-lib/libfs_1.0.0.bb
new file mode 100644
index 0000000..7f81054
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libfs_1.0.0.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Font Services library"
+DEPENDS += "xproto fontsproto xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "dfd5de47e232db0891410bec8ee6707b"
+SRC_URI[archive.sha256sum] = "2f18f9fa0e18a3eab3c154ba820ad64b5c6ee364e147524055a553a130ccfdde"
+
+XORG_PN = "libFS"
diff --git a/recipes/obsolete/xorg/xorg-lib/libfs_1.0.1.bb b/recipes/obsolete/xorg/xorg-lib/libfs_1.0.1.bb
new file mode 100644
index 0000000..fe1f774
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libfs_1.0.1.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Font Services library"
+DEPENDS += "xproto fontsproto xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "81521249353fa33be7a4bb0062c2fbb9"
+SRC_URI[archive.sha256sum] = "9bf92ffdb51e69e07682cd1a6c0101f2a833b16b9bfa5d601491ff46a35a2cf5"
+
+XORG_PN = "libFS"
diff --git a/recipes/obsolete/xorg/xorg-lib/libice_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libice_1.0.3.bb
new file mode 100644
index 0000000..52c9de0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libice_1.0.3.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Inter-Client Exchange library"
+DEPENDS += "xproto xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "071f96648ac25c8e87a3de11a7de2d8a"
+SRC_URI[archive.sha256sum] = "ffd46270dae30cad147d73559142a701a8ff8d0658f4abfb2341edefabb8161d"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libICE"
diff --git a/recipes/obsolete/xorg/xorg-lib/libice_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libice_1.0.4.bb
new file mode 100644
index 0000000..29303c1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libice_1.0.4.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Inter-Client Exchange library"
+DEPENDS += "xproto xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4ab4e67e0b8845aa201e984153087f4a"
+SRC_URI[archive.sha256sum] = "13055e2f4c645cbd135ce97a7974a5866f9ba3ed8988e686b552f55c30514f04"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libICE"
diff --git a/recipes/obsolete/xorg/xorg-lib/liblbxutil/mkg3states.patch b/recipes/obsolete/xorg/xorg-lib/liblbxutil/mkg3states.patch
new file mode 100644
index 0000000..58463db
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/liblbxutil/mkg3states.patch
@@ -0,0 +1,51 @@
+--- liblbxutil-1.0.0/configure.ac.old	2006-03-31 02:38:44.000000000 -0500
++++ liblbxutil-1.0.0/configure.ac	2006-03-31 02:39:06.000000000 -0500
+@@ -60,4 +60,5 @@ XORG_RELEASE_VERSION
+ 
+ AC_OUTPUT([Makefile
+ 	   src/Makefile
++	   src/image/Makefile
+ 	   lbxutil.pc])
+--- liblbxutil-1.0.0/src/Makefile.am.old	2006-03-31 02:38:51.000000000 -0500
++++ liblbxutil-1.0.0/src/Makefile.am	2006-03-31 02:39:49.000000000 -0500
+@@ -1,9 +1,6 @@
+ lib_LTLIBRARIES = liblbxutil.la
+ 
+-noinst_PROGRAMS = mkg3states
+-
+-mkg3states_SOURCES =				\
+-	$(srcdir)/image/mkg3states.c
++SUBDIRS = image
+ 
+ liblbxutil_la_SOURCES =				\
+ 	$(srcdir)/lbx_zlib/reqstats.h		\
+@@ -28,9 +25,8 @@ INCLUDES = @LBXUTIL_CFLAGS@ 
+ 
+ $(srcdir)/image/dfaxg42d.c: g3states.h
+ 
+-g3states.h: mkg3states
+-	-rm -f g3states.h
+-	./mkg3states -c > g3states.h_ && mv g3states.h_ g3states.h
++g3states.h: image/mkg3states
++	./image/mkg3states -c > g3states.h_ && mv g3states.h_ g3states.h
+ 
+ liblbxutil_la_LDFLAGS = -version-number 1:0:0
+ 
+--- liblbxutil-1.0.0/src/image/Makefile.am.old	2006-03-31 02:41:19.000000000 -0500
++++ liblbxutil-1.0.0/src/image/Makefile.am	2006-03-31 02:40:40.000000000 -0500
+@@ -0,0 +1,15 @@
++# evil hack
++CFLAGS=$(CFLAGS_FOR_BUILD)
++CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++LDFLAGS=$(LDFLAGS_FOR_BUILD)
++
++CC=$(CC_FOR_BUILD)
++LIBTOOL = @LIBTOOL@ --tag=CC
++
++noinst_PROGRAMS = mkg3states
++
++mkg3states_SOURCES =				\
++	mkg3states.c
++
++mkg3states_CFLAGS=$(CFLAGS_FOR_BUILD)
++mkg3states_LDFLAGS=$(LDFLAGS_FOR_BUILD)
diff --git a/recipes/obsolete/xorg/xorg-lib/liblbxutil_1.0.1.bb b/recipes/obsolete/xorg/xorg-lib/liblbxutil_1.0.1.bb
new file mode 100644
index 0000000..f51d5ab
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/liblbxutil_1.0.1.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+DESCRIPTION = "XFIXES Extension"
+DEPENDS += " xextproto xproto zlib"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://mkg3states.patch"
+SRC_URI[archive.md5sum] = "b73cbd5bc3cd268722a624a5f1318fde"
+SRC_URI[archive.sha256sum] = "94c31c7090106d3a95e2a7c083961efca1321b970118fe103ab06e5d927b7258"
+
+export CC_FOR_BUILD = "gcc"
diff --git a/recipes/obsolete/xorg/xorg-lib/libpciaccess/fix-mtrr-check.patch b/recipes/obsolete/xorg/xorg-lib/libpciaccess/fix-mtrr-check.patch
new file mode 100644
index 0000000..e2d9f62
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libpciaccess/fix-mtrr-check.patch
@@ -0,0 +1,19 @@
+---
+ configure.ac |    2 --
+ 1 file changed, 2 deletions(-)
+
+--- libpciaccess-0.10.3.orig/configure.ac
++++ libpciaccess-0.10.3/configure.ac
+@@ -89,12 +89,10 @@ esac
+ AM_CONDITIONAL(LINUX, [test "x$linux" = xyes])
+ AM_CONDITIONAL(FREEBSD, [test "x$freebsd" = xyes])
+ AM_CONDITIONAL(OPENBSD, [test "x$openbsd" = xyes])
+ AM_CONDITIONAL(SOLARIS, [test "x$solaris" = xyes])
+ 
+-AC_CHECK_FILE([/usr/include/asm/mtrr.h],
+-              [have_mtrr_h="yes"], [have_mtrr_h="no"])
+ if test "x$have_mtrr_h" = xyes; then
+     AC_DEFINE(HAVE_MTRR, 1, [Use MTRRs on mappings])
+ fi
+ 
+ AC_SUBST(PCIACCESS_CFLAGS)
diff --git a/recipes/obsolete/xorg/xorg-lib/libpciaccess_0.10.3.bb b/recipes/obsolete/xorg/xorg-lib/libpciaccess_0.10.3.bb
new file mode 100644
index 0000000..c594dc0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libpciaccess_0.10.3.bb
@@ -0,0 +1,7 @@
+require xorg-lib-common.inc
+DEPENDS += "xproto virtual/libx11"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://fix-mtrr-check.patch"
+SRC_URI[archive.md5sum] = "6d5468debf76fac84576ca26c9535821"
+SRC_URI[archive.sha256sum] = "2f609ad3b5688ae66dcd18d7cdd1fc6b68531a2a85f89798f6cfb5eda6d680dc"
diff --git a/recipes/obsolete/xorg/xorg-lib/libpciaccess_0.11.0.bb b/recipes/obsolete/xorg/xorg-lib/libpciaccess_0.11.0.bb
new file mode 100644
index 0000000..aca0a2f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libpciaccess_0.11.0.bb
@@ -0,0 +1,6 @@
+require xorg-lib-common.inc
+DEPENDS += "xproto virtual/libx11"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "686320dcec98daad0bdfb8894d4f2a2b"
+SRC_URI[archive.sha256sum] = "6e38be12b656c83c66a6fd8ba56c041d8188218278219c88ee635242ec1c7dab"
diff --git a/recipes/obsolete/xorg/xorg-lib/libsm_1.0.2.bb b/recipes/obsolete/xorg/xorg-lib/libsm_1.0.2.bb
new file mode 100644
index 0000000..ee2ff16
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libsm_1.0.2.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "Session management library"
+PRIORITY = "optional"
+DEPENDS += " libice xproto xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a254771550c01db372e88d1a1dc2e13a"
+SRC_URI[archive.sha256sum] = "e290614797bd626c1b92bac8f83e8954b99bd66e6ecdaa1e935e176df099eba8"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libSM"
diff --git a/recipes/obsolete/xorg/xorg-lib/libsm_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libsm_1.0.3.bb
new file mode 100644
index 0000000..8ca90fe
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libsm_1.0.3.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Session management library"
+DEPENDS += "libice xproto xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "184cbf502b3cd5d7ba5f9d1290a99606"
+SRC_URI[archive.sha256sum] = "57f42d3557effe452cd348362977ff90fa61009885c23b3aca8cb0219b5dec04"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libSM"
diff --git a/recipes/obsolete/xorg/xorg-lib/libsm_1.1.0.bb b/recipes/obsolete/xorg/xorg-lib/libsm_1.1.0.bb
new file mode 100644
index 0000000..1b51b89
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libsm_1.1.0.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Session management library"
+DEPENDS += "libice xproto xtrans util-linux-ng"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "05a04c2b6382fb0054f6c70494e22733"
+SRC_URI[archive.sha256sum] = "7536ac382e1ff82014d3a0defba0c61b3a30984f4e5bc7707960d6debcb92a82"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libSM"
diff --git a/recipes/obsolete/xorg/xorg-lib/libwindowswm_1.0.0.bb b/recipes/obsolete/xorg/xorg-lib/libwindowswm_1.0.0.bb
new file mode 100644
index 0000000..35457cb
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libwindowswm_1.0.0.bb
@@ -0,0 +1,9 @@
+require xorg-lib-common.inc
+DEPENDS += "libxext windowswmproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "337b379fd00a67345b083100c4e6ba95"
+SRC_URI[archive.sha256sum] = "6ad87266173d21ba7e0e4506db0c094769fd58c3f0b741b37f30c297deec166a"
+
+XORG_PN = "libWindowsWM"
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.0.1/keysymdef_include.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.0.1/keysymdef_include.patch
new file mode 100644
index 0000000..5653088
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.0.1/keysymdef_include.patch
@@ -0,0 +1,62 @@
+---
+ configure.ac |   44 ++++++++++++++++++++++++--------------------
+ 1 file changed, 24 insertions(+), 20 deletions(-)
+
+Index: libX11-1.1.2/configure.ac
+===================================================================
+--- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
++++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
+@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
+ #
+ KEYSYMDEF=""
+ AC_MSG_CHECKING([keysymdef.h])
+-for flag in $XPROTO_CFLAGS -I/usr/include; do
+-	case "$KEYSYMDEF" in
+-	"")
+-		case "$flag" in
+-		*-I*)
+-			dir=`echo "$flag" | sed 's/ *-I//'`
+-			file="$dir/X11/keysymdef.h"
+-			if test -f "$file"; then
+-				KEYSYMDEF="$file"
+-			fi
++AC_ARG_WITH(keysymdef,
++	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
++	KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++	for flag in $XPROTO_CFLAGS -I/usr/include; do
++		case "$KEYSYMDEF" in
++		"")
++			case "$flag" in
++			*-I*)
++				dir=`echo "$flag" | sed 's/ *-I//'`
++				file="$dir/X11/keysymdef.h"
++				if test -f "$file"; then
++					KEYSYMDEF="$file"
++				fi
++				;;
++			esac
+ 			;;
+ 		esac
+-		;;
+-	esac
+-done
+-case "$KEYSYMDEF" in
+-"")
+-	AC_MSG_ERROR([Cannot find keysymdef.h])
+-	;;
+-*)
++	done
++fi
++
++if test -f "$KEYSYMDEF"; then
+ 	AC_MSG_RESULT([$KEYSYMDEF])
+-        ;;
+-esac
++else
++	AC_MSG_ERROR([Cannot find keysymdef.h])
++fi
+ AC_SUBST(KEYSYMDEF)
+ 
+ AC_ARG_ENABLE(udc,
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.0.1/x11_disable_makekeys.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.0.1/x11_disable_makekeys.patch
new file mode 100644
index 0000000..ad8b6fc
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.0.1/x11_disable_makekeys.patch
@@ -0,0 +1,15 @@
+Index: libX11-1.0.1/src/util/Makefile.am
+===================================================================
+--- libX11-1.0.1.old/src/util/Makefile.am
++++ libX11-1.0.1/src/util/Makefile.am
+@@ -1,10 +1 @@
+-# $XdotOrg: lib/X11/src/util/Makefile.am,v 1.4 2006-02-19 02:14:12 jamey Exp $
+-
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS=$(X11_CFLAGS)
+-
+-#override CC = gcc
+-LINK = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+-
+ EXTRA_DIST = mkks.sh
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.0.3/keysymdef_include.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.0.3/keysymdef_include.patch
new file mode 100644
index 0000000..5653088
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.0.3/keysymdef_include.patch
@@ -0,0 +1,62 @@
+---
+ configure.ac |   44 ++++++++++++++++++++++++--------------------
+ 1 file changed, 24 insertions(+), 20 deletions(-)
+
+Index: libX11-1.1.2/configure.ac
+===================================================================
+--- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
++++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
+@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
+ #
+ KEYSYMDEF=""
+ AC_MSG_CHECKING([keysymdef.h])
+-for flag in $XPROTO_CFLAGS -I/usr/include; do
+-	case "$KEYSYMDEF" in
+-	"")
+-		case "$flag" in
+-		*-I*)
+-			dir=`echo "$flag" | sed 's/ *-I//'`
+-			file="$dir/X11/keysymdef.h"
+-			if test -f "$file"; then
+-				KEYSYMDEF="$file"
+-			fi
++AC_ARG_WITH(keysymdef,
++	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
++	KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++	for flag in $XPROTO_CFLAGS -I/usr/include; do
++		case "$KEYSYMDEF" in
++		"")
++			case "$flag" in
++			*-I*)
++				dir=`echo "$flag" | sed 's/ *-I//'`
++				file="$dir/X11/keysymdef.h"
++				if test -f "$file"; then
++					KEYSYMDEF="$file"
++				fi
++				;;
++			esac
+ 			;;
+ 		esac
+-		;;
+-	esac
+-done
+-case "$KEYSYMDEF" in
+-"")
+-	AC_MSG_ERROR([Cannot find keysymdef.h])
+-	;;
+-*)
++	done
++fi
++
++if test -f "$KEYSYMDEF"; then
+ 	AC_MSG_RESULT([$KEYSYMDEF])
+-        ;;
+-esac
++else
++	AC_MSG_ERROR([Cannot find keysymdef.h])
++fi
+ AC_SUBST(KEYSYMDEF)
+ 
+ AC_ARG_ENABLE(udc,
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.0.3/x11_disable_makekeys.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.0.3/x11_disable_makekeys.patch
new file mode 100644
index 0000000..ad8b6fc
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.0.3/x11_disable_makekeys.patch
@@ -0,0 +1,15 @@
+Index: libX11-1.0.1/src/util/Makefile.am
+===================================================================
+--- libX11-1.0.1.old/src/util/Makefile.am
++++ libX11-1.0.1/src/util/Makefile.am
+@@ -1,10 +1 @@
+-# $XdotOrg: lib/X11/src/util/Makefile.am,v 1.4 2006-02-19 02:14:12 jamey Exp $
+-
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS=$(X11_CFLAGS)
+-
+-#override CC = gcc
+-LINK = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+-
+ EXTRA_DIST = mkks.sh
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.1.1/keysymdef_include.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.1.1/keysymdef_include.patch
new file mode 100644
index 0000000..5653088
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.1.1/keysymdef_include.patch
@@ -0,0 +1,62 @@
+---
+ configure.ac |   44 ++++++++++++++++++++++++--------------------
+ 1 file changed, 24 insertions(+), 20 deletions(-)
+
+Index: libX11-1.1.2/configure.ac
+===================================================================
+--- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
++++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
+@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
+ #
+ KEYSYMDEF=""
+ AC_MSG_CHECKING([keysymdef.h])
+-for flag in $XPROTO_CFLAGS -I/usr/include; do
+-	case "$KEYSYMDEF" in
+-	"")
+-		case "$flag" in
+-		*-I*)
+-			dir=`echo "$flag" | sed 's/ *-I//'`
+-			file="$dir/X11/keysymdef.h"
+-			if test -f "$file"; then
+-				KEYSYMDEF="$file"
+-			fi
++AC_ARG_WITH(keysymdef,
++	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
++	KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++	for flag in $XPROTO_CFLAGS -I/usr/include; do
++		case "$KEYSYMDEF" in
++		"")
++			case "$flag" in
++			*-I*)
++				dir=`echo "$flag" | sed 's/ *-I//'`
++				file="$dir/X11/keysymdef.h"
++				if test -f "$file"; then
++					KEYSYMDEF="$file"
++				fi
++				;;
++			esac
+ 			;;
+ 		esac
+-		;;
+-	esac
+-done
+-case "$KEYSYMDEF" in
+-"")
+-	AC_MSG_ERROR([Cannot find keysymdef.h])
+-	;;
+-*)
++	done
++fi
++
++if test -f "$KEYSYMDEF"; then
+ 	AC_MSG_RESULT([$KEYSYMDEF])
+-        ;;
+-esac
++else
++	AC_MSG_ERROR([Cannot find keysymdef.h])
++fi
+ AC_SUBST(KEYSYMDEF)
+ 
+ AC_ARG_ENABLE(udc,
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.1.2/keysymdef_include.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.1.2/keysymdef_include.patch
new file mode 100644
index 0000000..5653088
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.1.2/keysymdef_include.patch
@@ -0,0 +1,62 @@
+---
+ configure.ac |   44 ++++++++++++++++++++++++--------------------
+ 1 file changed, 24 insertions(+), 20 deletions(-)
+
+Index: libX11-1.1.2/configure.ac
+===================================================================
+--- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
++++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
+@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
+ #
+ KEYSYMDEF=""
+ AC_MSG_CHECKING([keysymdef.h])
+-for flag in $XPROTO_CFLAGS -I/usr/include; do
+-	case "$KEYSYMDEF" in
+-	"")
+-		case "$flag" in
+-		*-I*)
+-			dir=`echo "$flag" | sed 's/ *-I//'`
+-			file="$dir/X11/keysymdef.h"
+-			if test -f "$file"; then
+-				KEYSYMDEF="$file"
+-			fi
++AC_ARG_WITH(keysymdef,
++	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
++	KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++	for flag in $XPROTO_CFLAGS -I/usr/include; do
++		case "$KEYSYMDEF" in
++		"")
++			case "$flag" in
++			*-I*)
++				dir=`echo "$flag" | sed 's/ *-I//'`
++				file="$dir/X11/keysymdef.h"
++				if test -f "$file"; then
++					KEYSYMDEF="$file"
++				fi
++				;;
++			esac
+ 			;;
+ 		esac
+-		;;
+-	esac
+-done
+-case "$KEYSYMDEF" in
+-"")
+-	AC_MSG_ERROR([Cannot find keysymdef.h])
+-	;;
+-*)
++	done
++fi
++
++if test -f "$KEYSYMDEF"; then
+ 	AC_MSG_RESULT([$KEYSYMDEF])
+-        ;;
+-esac
++else
++	AC_MSG_ERROR([Cannot find keysymdef.h])
++fi
+ AC_SUBST(KEYSYMDEF)
+ 
+ AC_ARG_ENABLE(udc,
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.1.3/keysymdef_include.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.1.3/keysymdef_include.patch
new file mode 100644
index 0000000..5653088
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.1.3/keysymdef_include.patch
@@ -0,0 +1,62 @@
+---
+ configure.ac |   44 ++++++++++++++++++++++++--------------------
+ 1 file changed, 24 insertions(+), 20 deletions(-)
+
+Index: libX11-1.1.2/configure.ac
+===================================================================
+--- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
++++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
+@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
+ #
+ KEYSYMDEF=""
+ AC_MSG_CHECKING([keysymdef.h])
+-for flag in $XPROTO_CFLAGS -I/usr/include; do
+-	case "$KEYSYMDEF" in
+-	"")
+-		case "$flag" in
+-		*-I*)
+-			dir=`echo "$flag" | sed 's/ *-I//'`
+-			file="$dir/X11/keysymdef.h"
+-			if test -f "$file"; then
+-				KEYSYMDEF="$file"
+-			fi
++AC_ARG_WITH(keysymdef,
++	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
++	KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++	for flag in $XPROTO_CFLAGS -I/usr/include; do
++		case "$KEYSYMDEF" in
++		"")
++			case "$flag" in
++			*-I*)
++				dir=`echo "$flag" | sed 's/ *-I//'`
++				file="$dir/X11/keysymdef.h"
++				if test -f "$file"; then
++					KEYSYMDEF="$file"
++				fi
++				;;
++			esac
+ 			;;
+ 		esac
+-		;;
+-	esac
+-done
+-case "$KEYSYMDEF" in
+-"")
+-	AC_MSG_ERROR([Cannot find keysymdef.h])
+-	;;
+-*)
++	done
++fi
++
++if test -f "$KEYSYMDEF"; then
+ 	AC_MSG_RESULT([$KEYSYMDEF])
+-        ;;
+-esac
++else
++	AC_MSG_ERROR([Cannot find keysymdef.h])
++fi
+ AC_SUBST(KEYSYMDEF)
+ 
+ AC_ARG_ENABLE(udc,
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.1.4/keysymdef_include.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.1.4/keysymdef_include.patch
new file mode 100644
index 0000000..5653088
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.1.4/keysymdef_include.patch
@@ -0,0 +1,62 @@
+---
+ configure.ac |   44 ++++++++++++++++++++++++--------------------
+ 1 file changed, 24 insertions(+), 20 deletions(-)
+
+Index: libX11-1.1.2/configure.ac
+===================================================================
+--- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
++++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
+@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
+ #
+ KEYSYMDEF=""
+ AC_MSG_CHECKING([keysymdef.h])
+-for flag in $XPROTO_CFLAGS -I/usr/include; do
+-	case "$KEYSYMDEF" in
+-	"")
+-		case "$flag" in
+-		*-I*)
+-			dir=`echo "$flag" | sed 's/ *-I//'`
+-			file="$dir/X11/keysymdef.h"
+-			if test -f "$file"; then
+-				KEYSYMDEF="$file"
+-			fi
++AC_ARG_WITH(keysymdef,
++	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
++	KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++	for flag in $XPROTO_CFLAGS -I/usr/include; do
++		case "$KEYSYMDEF" in
++		"")
++			case "$flag" in
++			*-I*)
++				dir=`echo "$flag" | sed 's/ *-I//'`
++				file="$dir/X11/keysymdef.h"
++				if test -f "$file"; then
++					KEYSYMDEF="$file"
++				fi
++				;;
++			esac
+ 			;;
+ 		esac
+-		;;
+-	esac
+-done
+-case "$KEYSYMDEF" in
+-"")
+-	AC_MSG_ERROR([Cannot find keysymdef.h])
+-	;;
+-*)
++	done
++fi
++
++if test -f "$KEYSYMDEF"; then
+ 	AC_MSG_RESULT([$KEYSYMDEF])
+-        ;;
+-esac
++else
++	AC_MSG_ERROR([Cannot find keysymdef.h])
++fi
+ AC_SUBST(KEYSYMDEF)
+ 
+ AC_ARG_ENABLE(udc,
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.2/x11_disable_makekeys.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.2/x11_disable_makekeys.patch
new file mode 100644
index 0000000..9e9e75e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.2/x11_disable_makekeys.patch
@@ -0,0 +1,23 @@
+--- /tmp/Makefile.am	2009-05-27 22:19:39.000000000 +0200
++++ libX11-1.2/src/util/Makefile.am	2009-05-27 22:21:31.000000000 +0200
+@@ -1,20 +1 @@
+-# $XdotOrg: lib/X11/src/util/Makefile.am,v 1.4 2006-02-19 02:14:12 jamey Exp $
+-
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
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/dolt-fix.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/dolt-fix.patch
new file mode 100644
index 0000000..7e96075
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/dolt-fix.patch
@@ -0,0 +1,22 @@
+Index: libX11-1.3.4/m4/dolt.m4
+===================================================================
+--- libX11-1.3.4/m4/dolt.m4
++++ libX11-1.3.4/m4/dolt.m4
+@@ -155,7 +155,7 @@ dnl without '=', because automake does n
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -171,7 +171,7 @@ done
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/keysymdef_include.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/keysymdef_include.patch
new file mode 100644
index 0000000..07487b6
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/keysymdef_include.patch
@@ -0,0 +1,29 @@
+Index: libX11-1.1.5/configure.ac
+===================================================================
+--- libX11-1.1.5.orig/configure.ac	2008-10-28 11:36:49.000000000 +0000
++++ libX11-1.1.5/configure.ac	2008-10-28 11:40:05.000000000 +0000
+@@ -221,13 +221,21 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysymdef.h])
+-dir=`pkg-config --variable=includedir xproto`
+-KEYSYMDEF="$dir/X11/keysymdef.h"
++AC_ARG_WITH(keysymdef,
++	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
++	KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++	dir=`pkg-config --variable=includedir xproto`
++	KEYSYMDEF="$dir/X11/keysymdef.h"
++fi
++
+ if test -f "$KEYSYMDEF"; then
+-        AC_MSG_RESULT([$KEYSYMDEF])
++	AC_MSG_RESULT([$KEYSYMDEF])
+ else
+ 	AC_MSG_ERROR([Cannot find keysymdef.h])
+ fi
++
+ AC_SUBST(KEYSYMDEF)
+ 
+ AM_CONDITIONAL(UDC, test xfalse = xtrue)
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/x11_disable_makekeys.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/x11_disable_makekeys.patch
new file mode 100644
index 0000000..0739632
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3+git/x11_disable_makekeys.patch
@@ -0,0 +1,26 @@
+Index: git/src/util/Makefile.am
+===================================================================
+--- git.orig/src/util/Makefile.am
++++ git/src/util/Makefile.am
+@@ -1,21 +1 @@
+-
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS = \
+-	$(X11_CFLAGS) \
+-	$(CWARNFLAGS)
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
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch
new file mode 100644
index 0000000..5d0a24c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch
@@ -0,0 +1,23 @@
+diff -uNr libX11-1.3.3.orig/src/util/Makefile.am libX11-1.3.3/src/util/Makefile.am
+--- libX11-1.3.3.orig/src/util/Makefile.am	2010-01-15 02:11:36.000000000 +0100
++++ libX11-1.3.3/src/util/Makefile.am	2010-01-18 14:48:27.000000000 +0100
+@@ -1,19 +1 @@
+-
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
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/dolt-fix.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/dolt-fix.patch
new file mode 100644
index 0000000..7e96075
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/dolt-fix.patch
@@ -0,0 +1,22 @@
+Index: libX11-1.3.4/m4/dolt.m4
+===================================================================
+--- libX11-1.3.4/m4/dolt.m4
++++ libX11-1.3.4/m4/dolt.m4
+@@ -155,7 +155,7 @@ dnl without '=', because automake does n
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -171,7 +171,7 @@ done
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/keysymdef_include.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/keysymdef_include.patch
new file mode 100644
index 0000000..0cab165
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/keysymdef_include.patch
@@ -0,0 +1,21 @@
+Index: libX11-1.3.4/configure.ac
+===================================================================
+--- libX11-1.3.4.orig/configure.ac
++++ libX11-1.3.4/configure.ac
+@@ -355,8 +355,14 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysymdef.h])
+-dir=`$PKG_CONFIG --variable=includedir xproto`
+-KEYSYMDEF="$dir/X11/keysymdef.h"
++AC_ARG_WITH(keysymdef,
++        AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
++        KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++        dir=`${PKG_CONFIG} --variable=includedir xproto`
++        KEYSYMDEF="$dir/X11/keysymdef.h"
++fi
+ if test -f "$KEYSYMDEF"; then
+         AC_MSG_RESULT([$KEYSYMDEF])
+ else
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch
new file mode 100644
index 0000000..9763313
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch
@@ -0,0 +1,29 @@
+Index: libX11-1.3.4/src/util/Makefile.am
+===================================================================
+--- libX11-1.3.4.orig/src/util/Makefile.am
++++ libX11-1.3.4/src/util/Makefile.am
+@@ -1,24 +1 @@
+-
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS = \
+-	$(X11_CFLAGS) \
+-	$(CWARNFLAGS)
+-
+-CC = @CC_FOR_BUILD@
+-CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+-CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@
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
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11/ruutf8.patch b/recipes/obsolete/xorg/xorg-lib/libx11/ruutf8.patch
new file mode 100644
index 0000000..0822b30
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11/ruutf8.patch
@@ -0,0 +1,12 @@
+diff --git a/nls/locale.alias.pre b/nls/locale.alias.pre
+index a74ca75..ff5bc3f 100644
+--- a/nls/locale.alias.pre
++++ b/nls/locale.alias.pre
+@@ -898,6 +898,7 @@ ru_RU.cp1251:					ru_RU.CP1251
+ ru_RU.microsoftcp1251:				ru_RU.CP1251
+ ru_RU.microsoft-cp1251:				ru_RU.CP1251
+ ru_RU.MICROSOFT-CP1251:				ru_RU.CP1251
++ru_RU.utf8:					ru_RU.UTF-8
+ #if defined(INCLUDE_ru_SU)
+ XCOMM ru_SU is redundant now
+ ru_SU:						ru_RU.KOI8-R
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11/xchar2b.patch b/recipes/obsolete/xorg/xorg-lib/libx11/xchar2b.patch
new file mode 100644
index 0000000..31da58f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11/xchar2b.patch
@@ -0,0 +1,13 @@
+http://www.koka-in.org/~kensyu/zaurus/diary/20030618.html
+
+--- /tmp/Xlib.h	2006-12-01 14:40:27.000000000 +0100
++++ libX11-X11R7.1-1.0.1/include/X11/Xlib.h	2006-12-01 14:40:56.948254000 +0100
+@@ -1067,7 +1067,7 @@
+ typedef struct {		/* normal 16 bit characters are two bytes */
+     unsigned char byte1;
+     unsigned char byte2;
+-} XChar2b;
++} __attribute__ ((packed)) XChar2b;
+ 
+ typedef struct {
+     XChar2b *chars;		/* two byte characters */
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11/xim.patch b/recipes/obsolete/xorg/xorg-lib/libx11/xim.patch
new file mode 100644
index 0000000..0eab197
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11/xim.patch
@@ -0,0 +1,55 @@
+--- libX11-6.2.1/src/X18NCMSstubs.c	2003-12-04 22:47:47.000000000 +0000
++++ libX11-6.2.1/src/X18NCMSstubs.c-new	2005-12-09 12:09:03.000000000 +0000
+@@ -90,6 +90,52 @@
+   return;
+ }
+ 
++XIM
++XOpenIM (
++    Display* display,
++    struct _XrmHashBucketRec* rdb,
++    char* res_name,
++    char* res_class)
++{
++  return (XIM) NULL;
++}
++
++Status
++XCloseIM ( XIM im )
++{
++  return NULL;
++}
++
++XIC
++XCreateIC ( XIM im, ...)
++{
++  return NULL;
++}
++
++void
++XDestroyIC ( XIC ic )
++{
++  return;
++}
++
++int
++XmbLookupString (
++    XIC ic,
++    XKeyPressedEvent* ev,
++    char* buffer,
++    int nbytes,
++    KeySym* keysym,
++    Status* status)
++{
++  return XLookupNone;
++}
++
++char *
++XGetICValues( XIC ic, ...)
++{
++  return (char *) NULL;
++}
++
+ XPointer
+ _XimGetLocaleCode ( _Xconst char* encoding_name )
+ {
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11_1.0.1.bb b/recipes/obsolete/xorg/xorg-lib/libx11_1.0.1.bb
new file mode 100644
index 0000000..734a31d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11_1.0.1.bb
@@ -0,0 +1,10 @@
+require libx11.inc
+LICENSE = "XFree86"
+DEPENDS = "${COMMON_DEPENDS}"
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://ruutf8.patch"
+SRC_URI[archive.md5sum] = "58f0537f21183e27149cf906a1b6bef9"
+SRC_URI[archive.sha256sum] = "f99e4ce6d8e3b8833957978fe22223897b0e636c83580f2b07eff0388eb75294"
+
+EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libx11_1.0.3.bb
new file mode 100644
index 0000000..40cbeb5
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11_1.0.3.bb
@@ -0,0 +1,10 @@
+require libx11.inc
+LICENSE = "XFree86"
+DEPENDS = "${COMMON_DEPENDS}"
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://ruutf8.patch"
+SRC_URI[archive.md5sum] = "60b787a812c92d33f71860e4e19cb59d"
+SRC_URI[archive.sha256sum] = "fb42f2400c3709a0c2c17f27cc4a902c191ebd6228c70698891bf3a13ea5b3ac"
+
+EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11_1.1.1.bb b/recipes/obsolete/xorg/xorg-lib/libx11_1.1.1.bb
new file mode 100644
index 0000000..368dd7b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11_1.1.1.bb
@@ -0,0 +1,9 @@
+require libx11.inc
+DEPENDS = "${COMMON_DEPENDS}"
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://ruutf8.patch"
+SRC_URI[archive.md5sum] = "848b80f77b20ae1fa5c882bbfa531ebc"
+SRC_URI[archive.sha256sum] = "5359db57793430429786b648ac570d4ab205797306e049bf1e8675250af21541"
+
+EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11_1.1.2.bb b/recipes/obsolete/xorg/xorg-lib/libx11_1.1.2.bb
new file mode 100644
index 0000000..60093c1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11_1.1.2.bb
@@ -0,0 +1,8 @@
+require libx11.inc
+DEPENDS = "${COMMON_DEPENDS}"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "710bf38a9477a5a1b235bc94f1d0593c"
+SRC_URI[archive.sha256sum] = "b77e4fd2bbd4092e7e78d0964760ad8ab160caccd4bc6d7d0c87a23febaea85e"
+
+EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11_1.1.3.bb b/recipes/obsolete/xorg/xorg-lib/libx11_1.1.3.bb
new file mode 100644
index 0000000..d6aa199
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11_1.1.3.bb
@@ -0,0 +1,8 @@
+require libx11.inc
+DEPENDS = "${COMMON_DEPENDS}"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4d43d3e472c552d2f191ecdd4e75112c"
+SRC_URI[archive.sha256sum] = "4a2f566e2ea5dd955c875cb8fa9c18dd725324fc5cf4e23c803442e31ab8917a"
+
+EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11_1.1.4.bb b/recipes/obsolete/xorg/xorg-lib/libx11_1.1.4.bb
new file mode 100644
index 0000000..3eeeece
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11_1.1.4.bb
@@ -0,0 +1,8 @@
+require libx11.inc
+DEPENDS = "${COMMON_DEPENDS}"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1469a5a8aa8d288dce6f4c45d2f68dc3"
+SRC_URI[archive.sha256sum] = "bdbd6d239435c1736f5c532b12e8078761db8db5f37ab3195fe11c3e5b692c1c"
+
+EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11_1.2.bb b/recipes/obsolete/xorg/xorg-lib/libx11_1.2.bb
new file mode 100644
index 0000000..0cea5f8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11_1.2.bb
@@ -0,0 +1,9 @@
+require libx11.inc
+DEPENDS = "${COMMON_DEPENDS}"
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://dolt-fix.patch"
+SRC_URI[archive.md5sum] = "c6265b59ea2b594fd68e33f9125b4d20"
+SRC_URI[archive.sha256sum] = "e4863cdf5d471763806e9bcae25ea47606a56cd91a5546a34c093aa3de181051"
+
+EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11_1.3.3.bb b/recipes/obsolete/xorg/xorg-lib/libx11_1.3.3.bb
new file mode 100644
index 0000000..8c40a99
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11_1.3.3.bb
@@ -0,0 +1,6 @@
+require libx11.inc
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://dolt-fix.patch"
+SRC_URI[archive.md5sum] = "5d74971360f194ce33d2bd2e4d9b066c"
+SRC_URI[archive.sha256sum] = "8c7f867918a3739dc7cabe955179539d4a7ecc52cb42becfd261e5dfbff511ac"
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11_1.3.4.bb b/recipes/obsolete/xorg/xorg-lib/libx11_1.3.4.bb
new file mode 100644
index 0000000..e55d720
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11_1.3.4.bb
@@ -0,0 +1,6 @@
+require libx11.inc
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://dolt-fix.patch"
+SRC_URI[archive.md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
+SRC_URI[archive.sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
diff --git a/recipes/obsolete/xorg/xorg-lib/libx11_git.bb b/recipes/obsolete/xorg/xorg-lib/libx11_git.bb
new file mode 100644
index 0000000..eac68d8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libx11_git.bb
@@ -0,0 +1,14 @@
+require libx11.inc
+PV = "1.3.3+git"
+PR = "${INC_PR}.0"
+
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libX11;protocol=git"
+SRC_URI += " file://keysymdef_include.patch \
+             file://x11_disable_makekeys.patch \
+             file://dolt-fix.patch \
+"
+
+SRCREV = "c3f3e4a9e531d010312c97e753d6e543e607094d"
+S = "${WORKDIR}/git"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxau_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libxau_1.0.3.bb
new file mode 100644
index 0000000..cd4f79b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxau_1.0.3.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "A Sample Authorization Protocol for X"
+DEPENDS += " xproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "75a9f2b85cd1617b5ca98c9095323853"
+SRC_URI[archive.sha256sum] = "d6c30a88770a720e96e0bd7e13e0334f9ef60f1b475a92556764828005c19e3b"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXau"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxau_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libxau_1.0.4.bb
new file mode 100644
index 0000000..293fc63
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxau_1.0.4.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "A Sample Authorization Protocol for X"
+DEPENDS += " xproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0f2b88d857e0a3f5898e4759c541af46"
+SRC_URI[archive.sha256sum] = "10d3ffa5f00d0c0a4083309ba68bdfa01dfdf912ef4cf2141e3f260b2edeb22c"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXau"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxaw_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libxaw_1.0.3.bb
new file mode 100644
index 0000000..87ec70e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxaw_1.0.3.bb
@@ -0,0 +1,22 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Athena Widget Set"
+DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ee215536ea78798268ab3a444d10135a"
+SRC_URI[archive.sha256sum] = "45ca55bdac904a07b8118618c65ddb5bf8826e626c4c927e3c2508c58e231514"
+
+do_install_append () {
+    ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
+    ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
+    ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
+}
+
+PACKAGES =+ "libxaw6 libxaw7 libxaw8"
+
+FILES_libxaw6 = "${libdir}/libXaw6.so.6*"
+FILES_libxaw7 = "${libdir}/libXaw7.so.7*"
+FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
+
+XORG_PN = "libXaw"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxaw_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libxaw_1.0.4.bb
new file mode 100644
index 0000000..2ed715d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxaw_1.0.4.bb
@@ -0,0 +1,22 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Athena Widget Set"
+DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "73671d8f1cf36fdd81395328cc3539c9"
+SRC_URI[archive.sha256sum] = "11f4ab184fb8dc853fd95238d4de7b251427dd036643d11fd2a669232fa35af9"
+
+do_install_append () {
+    ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
+    ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
+    ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
+}
+
+PACKAGES =+ "libxaw6 libxaw7 libxaw8"
+
+FILES_libxaw6 = "${libdir}/libXaw6.so.6*"
+FILES_libxaw7 = "${libdir}/libXaw7.so.7*"
+FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
+
+XORG_PN = "libXaw"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxcomposite/change-include-order.patch b/recipes/obsolete/xorg/xorg-lib/libxcomposite/change-include-order.patch
new file mode 100644
index 0000000..630b881
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxcomposite/change-include-order.patch
@@ -0,0 +1,14 @@
+This patch makes the build use its own Xcomposite.h over rather than an
+older Xcomposite.h that might already be installed in the staging dir.
+
+--- libXcomposite-X11R7.0-0.2.2.2/src/Makefile.am.orig	2006-03-12 20:10:17.000000000 +0100
++++ libXcomposite-X11R7.0-0.2.2.2/src/Makefile.am	2006-03-12 20:10:35.000000000 +0100
+@@ -21,7 +21,7 @@
+ #  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+ #  PERFORMANCE OF THIS SOFTWARE.
+ 
+-AM_CFLAGS = $(XCOMPOSITE_CFLAGS) $(XCOMPOSITE_CFLAGS) $(X_CFLAGS) -I$(top_srcdir)/include
++AM_CFLAGS = -I$(top_srcdir)/include $(XCOMPOSITE_CFLAGS) $(XCOMPOSITE_CFLAGS) $(X_CFLAGS)
+ 
+ lib_LTLIBRARIES = libXcomposite.la
+ 
diff --git a/recipes/obsolete/xorg/xorg-lib/libxcomposite_0.3.1.bb b/recipes/obsolete/xorg/xorg-lib/libxcomposite_0.3.1.bb
new file mode 100644
index 0000000..d7f8beb
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxcomposite_0.3.1.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Composite extension library."
+LICENSE = "BSD-X"
+DEPENDS += " compositeproto virtual/libx11 libxfixes"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://change-include-order.patch"
+SRC_URI[archive.md5sum] = "a80650d660486ea7bb2e5fd84a83799a"
+SRC_URI[archive.sha256sum] = "d42b59d3c38dae5e4fec375d12e56e7a5764ba10e8b8ec70f9ce951fc9cec72b"
+
+XORG_PN = "libXcomposite"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxcomposite_0.4.0.bb b/recipes/obsolete/xorg/xorg-lib/libxcomposite_0.4.0.bb
new file mode 100644
index 0000000..2dff14a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxcomposite_0.4.0.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Composite extension library."
+LICENSE = "BSD-X"
+DEPENDS += " compositeproto virtual/libx11 libxfixes libxext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://change-include-order.patch"
+SRC_URI[archive.md5sum] = "7e95395dea89be21bae929b9b7f16641"
+SRC_URI[archive.sha256sum] = "7db759e82dd1f68094e4c4d257025f7893dafb2913ed249e00cbe18fa13c7510"
+
+XORG_PN = "libXcomposite"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxcursor_1.1.8.bb b/recipes/obsolete/xorg/xorg-lib/libxcursor_1.1.8.bb
new file mode 100644
index 0000000..3f175e8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxcursor_1.1.8.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X cursor management library"
+LICENSE = "BSD-X"
+DEPENDS += "libxrender libxfixes"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ec2acd10a7736a85dd1e1ed9ea5bec96"
+SRC_URI[archive.sha256sum] = "8f039f81af52c88d583fba48b878abd074542221cb0030638ad52336b4ae1377"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXcursor"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxcursor_1.1.9.bb b/recipes/obsolete/xorg/xorg-lib/libxcursor_1.1.9.bb
new file mode 100644
index 0000000..2b363a5
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxcursor_1.1.9.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X cursor management library"
+LICENSE = "BSD-X"
+DEPENDS += "libxrender libxfixes"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "99b7554037a92b260891091e81815a0a"
+SRC_URI[archive.sha256sum] = "1dffb3542271c8ce964066d561474caec5b639d6588b257b21cfb8225a15d2b4"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXcursor"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxdamage_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libxdamage_1.0.4.bb
new file mode 100644
index 0000000..452c634
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxdamage_1.0.4.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Damage extension library."
+LICENSE = "BSD-X"
+DEPENDS += " virtual/libx11 damageproto libxfixes fixesproto xextproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4d0eece7a8372a7754db1de08c2be324"
+SRC_URI[archive.sha256sum] = "5df90f0efa77e1d6f9e1768a2b0adfc896d09c7a3d8680ed0980511b3625c636"
+
+XORG_PN = "libXdamage"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxdamage_1.1.1.bb b/recipes/obsolete/xorg/xorg-lib/libxdamage_1.1.1.bb
new file mode 100644
index 0000000..cb7eca1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxdamage_1.1.1.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 damaged region extension library"
+LICENSE = "BSD-X"
+DEPENDS += "damageproto libxfixes"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ac0ce6b0063a9858c8f24ddb4c60487d"
+SRC_URI[archive.sha256sum] = "0102754db23952a1c3adf7881bbf191f91ca3e3d183e1b0179452bce932fae2e"
+
+XORG_PN = "libXdamage"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxdmcp_1.0.2.bb b/recipes/obsolete/xorg/xorg-lib/libxdmcp_1.0.2.bb
new file mode 100644
index 0000000..1226afb
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxdmcp_1.0.2.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Display Manager Control Protocol library"
+DEPENDS += "xproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "10facf2bc7cbd5e5c1a698b8a210a582"
+SRC_URI[archive.sha256sum] = "f3e50c1847599145c22784a2f15818821960652ee91d21d905817fb7c10f96a8"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXdmcp"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxext_1.0.2.bb b/recipes/obsolete/xorg/xorg-lib/libxext_1.0.2.bb
new file mode 100644
index 0000000..02326de
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxext_1.0.2.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Server Extension library"
+PRIORITY = "optional"
+DEPENDS += " xproto virtual/libx11 xextproto libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cce89c5b941a493512b534f4847c6111"
+SRC_URI[archive.sha256sum] = "368e4cf5117febd998e6fc40d096b3af19a571adccc5ed49b9d16e482b3a8f8e"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXext"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxext_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libxext_1.0.3.bb
new file mode 100644
index 0000000..f8d76b4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxext_1.0.3.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 miscellaneous extension library"
+DEPENDS += "xproto virtual/libx11 xextproto libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1bf6fa1c26f9957d7cc0bd90b038dfa6"
+SRC_URI[archive.sha256sum] = "2d706baf206d1cb422c8e0ceb6c5a8546bc3f0587cf090eba51e75a295d9c3f0"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXext"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxext_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libxext_1.0.4.bb
new file mode 100644
index 0000000..1317e5c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxext_1.0.4.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 miscellaneous extension library"
+DEPENDS += "xproto virtual/libx11 xextproto libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a91f1f722ac80c597cf0b75dcb8b48c0"
+SRC_URI[archive.sha256sum] = "2dfd8eace1cafacc87b4055c57efeb771a740e24141d3f113de58c2a9eebd21f"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXext"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxext_1.0.5.bb b/recipes/obsolete/xorg/xorg-lib/libxext_1.0.5.bb
new file mode 100644
index 0000000..40dbece
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxext_1.0.5.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 miscellaneous extension library"
+DEPENDS += "xproto virtual/libx11 xextproto libxau libxdmcp"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "aa11d859cc8e9a0bad3bb55e1666547b"
+SRC_URI[archive.sha256sum] = "1280af98466cb4484a89858ede3347ba9d7785baeb80b11f2066142dc2317d97"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXext"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxfixes_4.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libxfixes_4.0.3.bb
new file mode 100644
index 0000000..d574764
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxfixes_4.0.3.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Fixes extension library."
+LICENSE = "BSD-X"
+DEPENDS += "virtual/libx11 xproto fixesproto xextproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1990d19725a3c7f32290037f02d3737f"
+SRC_URI[archive.sha256sum] = "547e093c5037c4b85ce653ce26f5bd70a97b177f9b582f5351a626d8e0a829dd"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXfixes"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxfont/builtinreaddirectory-no-side-effect.patch b/recipes/obsolete/xorg/xorg-lib/libxfont/builtinreaddirectory-no-side-effect.patch
new file mode 100644
index 0000000..dd30743
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxfont/builtinreaddirectory-no-side-effect.patch
@@ -0,0 +1,188 @@
+commit 7670d4a2720c61fbc7b989fed14c676f04ac3ad1
+Author: Dodji Seketeli <dodji@openedhand.com>
+Date:   Mon Jul 16 12:24:34 2007 +0200
+
+    Remove side effects from BuiltinReadDirectory()
+    
+    The first time BuiltinReadDirectory() is called,
+    save the content of builtin_dir and builtin_alias,
+    before calling FontFileAddFontFile(), because that fonction
+    will modify those.
+    
+    Then, in subsequent calls to BuiltinReadDirectory(), restore
+    builtin_dir and builtin_alias so that the side effect incurred
+    by the first call disappears.
+
+diff --git a/src/builtins/dir.c b/src/builtins/dir.c
+index c272449..97f1e1e 100644
+--- a/src/builtins/dir.c
++++ b/src/builtins/dir.c
+@@ -29,6 +29,133 @@
+ #endif
+ #include "builtin.h"
+ 
++BuiltinDirPtr
++BuiltinDirsDup (const BuiltinDirPtr a_dirs,
++                int a_dirs_len)
++{
++    BuiltinDirPtr dirs=NULL ;
++    int i=0 ;
++
++    if (!a_dirs)
++        return NULL ;
++
++    dirs = xcalloc (a_dirs_len, sizeof (BuiltinDirRec)) ;
++    if (!dirs)
++        return NULL ;
++
++    for (i=0; i < a_dirs_len; i++) {
++        int len = strlen (a_dirs[i].file_name) ;
++        dirs[i].file_name = xcalloc (1, len) ;
++        memmove (dirs[i].file_name, a_dirs[i].file_name, len);
++        len = strlen (a_dirs[i].font_name) ;
++        dirs[i].font_name = xcalloc (1, len) ;
++        memmove (dirs[i].font_name, a_dirs[i].font_name, len);
++    }
++    return dirs ;
++}
++
++/**
++ * Copy a_save back into a_cur
++ * @param a_cur the instance of BuiltinDir to restore
++ * @param a_saved the saved instance of BuiltinDir to copy into a_cur
++ * @return 0 if went okay, 1 otherwise.
++ */
++int
++BuiltinDirRestore (BuiltinDirPtr a_cur,
++                   const BuiltinDirPtr a_saved)
++{
++    if (!a_cur)
++        return 1 ;
++    if (!a_saved)
++        return 0 ;
++
++    if (a_saved->font_name)
++        memmove (a_cur->font_name, a_saved->font_name, strlen (a_saved->font_name)) ;
++    return 0 ;
++}
++
++
++int
++BuiltinDirsRestore (BuiltinDirPtr a_cur_tab,
++                    const BuiltinDirPtr a_saved_tab,
++                    int a_tab_len)
++{
++    int i=0 ;
++
++    if (!a_cur_tab)
++        return 1 ;
++    if (!a_saved_tab)
++        return 0 ;
++
++    for (i=0 ; i < a_tab_len; i++) {
++        if (BuiltinDirRestore (&a_cur_tab[i], &a_saved_tab[i]))
++            return 1 ;
++    }
++    return 0 ;
++}
++
++BuiltinAliasPtr
++BuiltinAliasesDup (const BuiltinAliasPtr a_aliases,
++                   int a_aliases_len)
++{
++    BuiltinAliasPtr aliases=NULL ;
++    int i=0 ;
++
++    if (!a_aliases)
++        return NULL ;
++
++    aliases = xcalloc (a_aliases_len, sizeof (BuiltinAliasRec)) ;
++    if (!aliases)
++        return NULL ;
++
++    for (i=0; i < a_aliases_len; i++) {
++        int len = strlen (a_aliases[i].font_name) ;
++        aliases[i].font_name = xcalloc (1, len) ;
++        memmove (aliases[i].font_name, a_aliases[i].font_name, len);
++    }
++    return aliases ;
++}
++
++/**
++ * Copy a_save back into a_cur
++ * @param a_cur the instance of BuiltinAlias to restore
++ * @param a_saved the saved instance of BuiltinAlias to copy into a_cur
++ * @return 0 if went okay, 1 otherwise.
++ */
++int
++BuiltinAliasRestore (BuiltinAliasPtr a_cur,
++                     const BuiltinAliasPtr a_save)
++{
++    if (!a_cur)
++        return 1 ;
++    if (!a_save)
++        return 0 ;
++    if (a_save->alias_name)
++        memmove (a_cur->alias_name, a_save->alias_name, strlen (a_save->alias_name)) ;
++    if (a_save->font_name)
++        memmove (a_cur->font_name, a_save->font_name, strlen (a_save->font_name)) ;
++    return 0 ;
++}
++
++int
++BuiltinAliasesRestore (BuiltinAliasPtr a_cur_tab,
++                       const BuiltinAliasPtr a_saved_tab,
++                       int a_tab_len)
++{
++    int i=0 ;
++
++    if (!a_cur_tab)
++        return 1 ;
++    if (!a_saved_tab)
++        return 0 ;
++
++    for (i=0 ; i < a_tab_len; i++) {
++        if (BuiltinAliasRestore (&a_cur_tab[i], &a_saved_tab[i]))
++            return 1 ;
++    }
++    return 0 ;
++}
++
+ int
+ BuiltinReadDirectory (char *directory, FontDirectoryPtr *pdir)
+ {
+@@ -36,6 +163,34 @@ BuiltinReadDirectory (char *directory, FontDirectoryPtr *pdir)
+     int			i;
+ 
+     dir = FontFileMakeDir ("", builtin_dir_count);
++    static BuiltinDirPtr saved_builtin_dir ;
++    static BuiltinAliasPtr saved_builtin_alias ;
++
++
++    if (saved_builtin_dir)
++    {
++        BuiltinDirsRestore ((BuiltinDirPtr) builtin_dir,
++                            saved_builtin_dir,
++                            builtin_dir_count) ;
++    }
++    else
++    {
++        saved_builtin_dir = BuiltinDirsDup ((const BuiltinDirPtr) builtin_dir,
++                                            builtin_dir_count) ;
++    }
++
++    if (saved_builtin_alias)
++    {
++        BuiltinAliasesRestore ((BuiltinAliasPtr) builtin_alias,
++                               saved_builtin_alias,
++                               builtin_alias_count) ;
++    }
++    else
++    {
++        saved_builtin_alias = BuiltinAliasesDup ((const BuiltinAliasPtr) builtin_alias,
++                                                 builtin_alias_count) ;
++    }
++
+     for (i = 0; i < builtin_dir_count; i++)
+     {
+ 	if (!FontFileAddFontFile (dir,
diff --git a/recipes/obsolete/xorg/xorg-lib/libxfont/no-scalable-crash.patch b/recipes/obsolete/xorg/xorg-lib/libxfont/no-scalable-crash.patch
new file mode 100644
index 0000000..90bded6
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxfont/no-scalable-crash.patch
@@ -0,0 +1,22 @@
+--- /tmp/fontdir.c	2006-08-01 16:17:22.000000000 +0200
++++ libXfont-1.2.0/src/fontfile/fontdir.c	2006-08-01 16:20:37.248306000 +0200
+@@ -695,6 +695,11 @@
+      */
+     if (isscale)
+     {
++	/* If the fontname says it is scalable, make sure that the
++  	 * renderer supports OpenScalable and GetInfoScalable.
++	 */
++       if (renderer->OpenScalable && renderer->GetInfoScalable)
++       {
+ 	if (vals.values_supplied & SIZE_SPECIFY_MASK)
+ 	{
+ 	    bzero((char *)&zeroVals, sizeof(zeroVals));
+@@ -794,6 +799,7 @@
+                                            bitmap->name.name);
+             }
+ 	}
++       }
+     }
+     return TRUE;
+ }
diff --git a/recipes/obsolete/xorg/xorg-lib/libxfont_1.2.7.bb b/recipes/obsolete/xorg/xorg-lib/libxfont_1.2.7.bb
new file mode 100644
index 0000000..b470c8b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxfont_1.2.7.bb
@@ -0,0 +1,15 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X font library (used by the X server)."
+PRIORITY = "optional"
+LICENSE = "BSD-X"
+DEPENDS += " freetype fontcacheproto zlib xproto xtrans fontsproto libfontenc"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://no-scalable-crash.patch"
+SRC_URI[archive.md5sum] = "2f2085310f75900044d9dcd469637d26"
+SRC_URI[archive.sha256sum] = "2f8c004c0b914d460e6fd2b48d8b425cf4778d415467fc1f1d938b200462d18b"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXfont"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxfont_1.2.8.bb b/recipes/obsolete/xorg/xorg-lib/libxfont_1.2.8.bb
new file mode 100644
index 0000000..3794cf2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxfont_1.2.8.bb
@@ -0,0 +1,15 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X font library (used by the X server)."
+PRIORITY = "optional"
+LICENSE = "BSD-X"
+DEPENDS += " freetype fontcacheproto zlib xproto xtrans fontsproto libfontenc"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://no-scalable-crash.patch"
+SRC_URI[archive.md5sum] = "83b8e21f6ee22512a8f72ba51e2d74f6"
+SRC_URI[archive.sha256sum] = "374a2ca12f62a4d9f09a17a34765a5289cefa9db7f9f0913e1c3731b4088aad8"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXfont"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.0.bb b/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.0.bb
new file mode 100644
index 0000000..c3c9377
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.0.bb
@@ -0,0 +1,15 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 font rasterisation library"
+LICENSE = "BSD-X"
+DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://no-scalable-crash.patch \
+            file://builtinreaddirectory-no-side-effect.patch"
+SRC_URI[archive.md5sum] = "d1d3fa170d74b066f1f23ca8574e7c90"
+SRC_URI[archive.sha256sum] = "07567b9880f28d1a404389c024a185419bfe81136aef3d9eda52407f34c3d3dd"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXfont"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.1.bb b/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.1.bb
new file mode 100644
index 0000000..671fd58
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.1.bb
@@ -0,0 +1,14 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 font rasterisation library"
+LICENSE = "BSD-X"
+DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://no-scalable-crash.patch"
+SRC_URI[archive.md5sum] = "b2f396b62633819bbdd9748383876e21"
+SRC_URI[archive.sha256sum] = "dcfb7dc980a16ad98ac984b98321148864ea8b4637d3dd3773e483a14158a9b1"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXfont"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.2.bb b/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.2.bb
new file mode 100644
index 0000000..250433a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.2.bb
@@ -0,0 +1,14 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 font rasterisation library"
+LICENSE = "BSD-X"
+DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://no-scalable-crash.patch"
+SRC_URI[archive.md5sum] = "64f510ebf9679f3a97a3d633cbee4f50"
+SRC_URI[archive.sha256sum] = "c167cfd529b7c67f496ee0bed3c0b43e0107de0f689d387c1c0e23ef7cf3d2f2"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXfont"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.3.bb b/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.3.bb
new file mode 100644
index 0000000..65b5415
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxfont_1.3.3.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 font rasterisation library"
+LICENSE = "BSD-X"
+DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4f174b9613f87cf00d731da428a1b194"
+SRC_URI[archive.sha256sum] = "6171e6bca4bd6333611bd9c63cccc8e8e412d876c72097f0dddc490a9df51d5a"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXfont"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxfontcache_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libxfontcache_1.0.4.bb
new file mode 100644
index 0000000..f4a079e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxfontcache_1.0.4.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X-TrueType font cache extension client library"
+DEPENDS += "libxext fontcacheproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1adca018aa7bf2d215f20a69c10828ad"
+SRC_URI[archive.sha256sum] = "ffe747cfbf81cdd862af1b05d021ad1ab83b623eab5b32b0a618efb4c0f3e01c"
+
+XORG_PN = "libXfontcache"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxft_2.1.12.bb b/recipes/obsolete/xorg/xorg-lib/libxft_2.1.12.bb
new file mode 100644
index 0000000..14beef39
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxft_2.1.12.bb
@@ -0,0 +1,21 @@
+require xorg-lib-common.inc
+DESCRIPTION = "FreeType-based font drawing library for X"
+DEPENDS += "libxrender freetype fontconfig"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1309301e2d979bd475dc58325cb8c056"
+SRC_URI[archive.sha256sum] = "68b46f85caaf0b30c876bd983abe144c25755bee7532e8738ab7ebe29a428986"
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
+                ${libdir}/*.a ${libdir}/pkgconfig \
+                ${datadir}/aclocal ${bindir} ${sbindir}"
+
+python do_package() {
+        if bb.data.getVar('DEBIAN_NAMES', d, 1):
+            bb.data.setVar('PKG_${PN}', 'libxft2', d)
+        bb.build.exec_func('package_do_package', d)
+}
+
+XORG_PN = "libXft"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxft_2.1.13.bb b/recipes/obsolete/xorg/xorg-lib/libxft_2.1.13.bb
new file mode 100644
index 0000000..a2219c9
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxft_2.1.13.bb
@@ -0,0 +1,21 @@
+require xorg-lib-common.inc
+DESCRIPTION = "FreeType-based font drawing library for X"
+DEPENDS += "libxrender freetype fontconfig"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "bc8881851f3bd8dcc625fac37350a1c6"
+SRC_URI[archive.sha256sum] = "ce7688258af34c14af421bcfb306d4310245b727d2417ac968b7f6b2facfde8c"
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
+                ${libdir}/*.a ${libdir}/pkgconfig \
+                ${datadir}/aclocal ${bindir} ${sbindir}"
+
+python do_package() {
+        if bb.data.getVar('DEBIAN_NAMES', d, 1):
+            bb.data.setVar('PKG_${PN}', 'libxft2', d)
+        bb.build.exec_func('package_do_package', d)
+}
+
+XORG_PN = "libXft"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxi_1.0.2.bb b/recipes/obsolete/xorg/xorg-lib/libxi_1.0.2.bb
new file mode 100644
index 0000000..12e49f0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxi_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Input extension library."
+DEPENDS += " xproto virtual/libx11 xextproto libxext inputproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4a5207a29a6b220e5462129854689844"
+SRC_URI[archive.sha256sum] = "7e6339539d3d0a4fc95cc23ca2b13ae67dd783e011b3cc5ca76040e376bff57f"
+
+XORG_PN = "libXi"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxi_1.1.0.bb b/recipes/obsolete/xorg/xorg-lib/libxi_1.1.0.bb
new file mode 100644
index 0000000..3ad5dfc
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxi_1.1.0.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Input extension library."
+DEPENDS += " xproto virtual/libx11 xextproto libxext inputproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c25abbe604029855eb11a3a75fb1f386"
+SRC_URI[archive.sha256sum] = "0f90d7e27d8a7d6bccf9350b6283ffe122e5347fa51d4ea9055653b297339989"
+
+XORG_PN = "libXi"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxi_1.1.2.bb b/recipes/obsolete/xorg/xorg-lib/libxi_1.1.2.bb
new file mode 100644
index 0000000..bff8ba4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxi_1.1.2.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Input extension library"
+DEPENDS += "libxext inputproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9c4dd85f3e2a75bfb60bd288502bc288"
+SRC_URI[archive.sha256sum] = "4deda13613f03e4524d3cf0ac14b9e20be5044d415cb8478713ecbe47f4de862"
+
+XORG_PN = "libXi"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxi_1.1.3.bb b/recipes/obsolete/xorg/xorg-lib/libxi_1.1.3.bb
new file mode 100644
index 0000000..039bfc8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxi_1.1.3.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Input extension library"
+DEPENDS += "libxext inputproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7c510abb0cad8dc20493fb27ff7859d8"
+SRC_URI[archive.sha256sum] = "c77a5bbe97d0d0a6493adefcf1bd57aca91bc33279633b3f6cf1d2bb8812153f"
+
+XORG_PN = "libXi"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxi_1.2.0.bb b/recipes/obsolete/xorg/xorg-lib/libxi_1.2.0.bb
new file mode 100644
index 0000000..e6b3da7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxi_1.2.0.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Input extension library"
+DEPENDS += "libxext inputproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4b88e07d7dd77ca1e786f09066b58c02"
+SRC_URI[archive.sha256sum] = "7c0125ffb864e121ebfb5a20b1cfdff60562c2f2dfbb4e77c5eac81f36e15f3a"
+
+XORG_PN = "libXi"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxinerama_1.0.2.bb b/recipes/obsolete/xorg/xorg-lib/libxinerama_1.0.2.bb
new file mode 100644
index 0000000..786c294
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxinerama_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Xinerama extension library"
+DEPENDS += "libxext xineramaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f6fb08eafd3c2909d515f1a07bfca8fd"
+SRC_URI[archive.sha256sum] = "d245d7ae4c766ecbc4e5cc2666e2e78198d8386dbaa06b35c3d1b1457ee5d03d"
+
+XORG_PN = "libXinerama"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxinerama_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libxinerama_1.0.3.bb
new file mode 100644
index 0000000..4e7cc91
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxinerama_1.0.3.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Xinerama extension library"
+DEPENDS += "libxext xineramaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cd9f7c46439ac40e0517a302d2434d2c"
+SRC_URI[archive.sha256sum] = "07b3564cd56154c20580b56230b7a95d74fe6582c80cedf0550d8d7955181219"
+
+XORG_PN = "libXinerama"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxkbfile_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libxkbfile_1.0.4.bb
new file mode 100644
index 0000000..d02cec5
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxkbfile_1.0.4.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 keyboard file manipulation library"
+LICENSE = "GPL"
+DEPENDS += "virtual/libx11 kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "12b4ceb5d42b520228b5fb40a96ae6c5"
+SRC_URI[archive.sha256sum] = "468ade4eaa3951a7c34b6ae1c290ab1a1d364ee36c5c455ef0df15550825b8ae"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxkbfile_1.0.5.bb b/recipes/obsolete/xorg/xorg-lib/libxkbfile_1.0.5.bb
new file mode 100644
index 0000000..60d3a1b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxkbfile_1.0.5.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 keyboard file manipulation library"
+LICENSE = "GPL"
+DEPENDS += "virtual/libx11 kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0726a845fe5a56551de2718c9f6b0e35"
+SRC_URI[archive.sha256sum] = "0ab628271fc9cb6d05f861d9823573088d81d510aca95b87ac0504b2e558965f"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxmu_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libxmu_1.0.3.bb
new file mode 100644
index 0000000..b5bc535
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxmu_1.0.3.bb
@@ -0,0 +1,17 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 miscellaneous utility library"
+DEPENDS += "libxt libxext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b926b95b811ece3e19cd590db85ee615"
+SRC_URI[archive.sha256sum] = "b56e308e36da8d9cb48433ddb81fd04e26b4f1c695586ac8106ac48a35466d66"
+
+PACKAGES =+ "libxmuu libxmuu-dev"
+
+FILES_libxmuu = "${libdir}/libXmuu.so.*"
+FILES_libxmuu-dev = "${libdir}/libXmuu.so"
+
+LEAD_SONAME = "libXmu"
+
+XORG_PN = "libXmu"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxmu_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libxmu_1.0.4.bb
new file mode 100644
index 0000000..7ebe4c8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxmu_1.0.4.bb
@@ -0,0 +1,17 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 miscellaneous utility library"
+DEPENDS += "libxt libxext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fb372a5f3ab42b5ba16d7af4d833a0cb"
+SRC_URI[archive.sha256sum] = "f83c00d6ed8f4c08effa9dcc2d7f1ff6f5a753f2b9fe1babda16618c2afa18f0"
+
+PACKAGES =+ "libxmuu libxmuu-dev"
+
+FILES_libxmuu = "${libdir}/libXmuu.so.*"
+FILES_libxmuu-dev = "${libdir}/libXmuu.so"
+
+LEAD_SONAME = "libXmu"
+
+XORG_PN = "libXmu"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxpm_3.5.6.bb b/recipes/obsolete/xorg/xorg-lib/libxpm_3.5.6.bb
new file mode 100644
index 0000000..977f015
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxpm_3.5.6.bb
@@ -0,0 +1,16 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Pixmap library"
+LICENSE = "X-BSD"
+DEPENDS += "libxext libsm libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "37b7d1826c6a02107269632a93b8791f"
+SRC_URI[archive.sha256sum] = "2d5c5242b8417db6aa758e5be387de33385d9960ff21c801af7d6a4730b4fd0d"
+
+PACKAGES =+ "sxpm cxpm"
+
+FILES_cxpm = "${bindir}/cxpm"
+FILES_sxpm = "${bindir}/sxpm"
+
+XORG_PN = "libXpm"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxpm_3.5.7.bb b/recipes/obsolete/xorg/xorg-lib/libxpm_3.5.7.bb
new file mode 100644
index 0000000..b8ed813
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxpm_3.5.7.bb
@@ -0,0 +1,16 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Pixmap library"
+LICENSE = "X-BSD"
+DEPENDS += "libxext libsm libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cd15ee542d9f515538b4462a6f79d977"
+SRC_URI[archive.sha256sum] = "64701ae67ce5b0797307b75d8255bec3a0d371d0c50715ea618f5a68bcc92baa"
+
+PACKAGES =+ "sxpm cxpm"
+
+FILES_cxpm = "${bindir}/cxpm"
+FILES_sxpm = "${bindir}/sxpm"
+
+XORG_PN = "libXpm"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxrandr_1.1.2.bb b/recipes/obsolete/xorg/xorg-lib/libxrandr_1.1.2.bb
new file mode 100644
index 0000000..4fb614c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxrandr_1.1.2.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Resize and Rotate extension library."
+LICENSE = "BSD-X"
+DEPENDS += " virtual/libx11 randrproto libxext xextproto libxrender renderproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "962946952a01650bb43206043a3c0e12"
+SRC_URI[archive.sha256sum] = "ba5adedc37da835a5c9e5a5d457dce13feead64fc364bc4719c41720ca0a3c50"
+
+BBCLASSEXTEND = "nativesdk"
+
+XORG_PN = "libXrandr"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxrandr_1.2.2.bb b/recipes/obsolete/xorg/xorg-lib/libxrandr_1.2.2.bb
new file mode 100644
index 0000000..2038f8a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxrandr_1.2.2.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Resize and Rotate extension library"
+LICENSE = "BSD-X"
+DEPENDS += "randrproto libxrender libxext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1b244b5d19f0ccab01d7083436cd3558"
+SRC_URI[archive.sha256sum] = "206f8dc850f12b1213fb73dbef09fafa1bb8fb8c3ddfe4d39721c1e2dec12a98"
+
+BBCLASSEXTEND = "nativesdk"
+
+XORG_PN = "libXrandr"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxrandr_1.2.3.bb b/recipes/obsolete/xorg/xorg-lib/libxrandr_1.2.3.bb
new file mode 100644
index 0000000..22ab29d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxrandr_1.2.3.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Resize and Rotate extension library"
+LICENSE = "BSD-X"
+DEPENDS += "randrproto libxrender libxext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5cd67cc02a50c9644ba0a1846ea3b08e"
+SRC_URI[archive.sha256sum] = "f8edfe26b8c4c3677a3a949f81a8b09a5fad62972020bfd230401e11cc0ed267"
+
+BBCLASSEXTEND = "nativesdk"
+
+XORG_PN = "libXrandr"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxrender_0.9.2.bb b/recipes/obsolete/xorg/xorg-lib/libxrender_0.9.2.bb
new file mode 100644
index 0000000..c67495a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxrender_0.9.2.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Rendering Extension client library"
+LICENSE = "BSD-X"
+DEPENDS += "virtual/libx11 renderproto xproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2f1b2c6e8dcbcb6d760e59f445abd92c"
+SRC_URI[archive.sha256sum] = "0f749183ab1a0ece14d33c3299b3f70893122349c0bfa9d7bd0e66ce19d1802a"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXrender"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxrender_0.9.3.bb b/recipes/obsolete/xorg/xorg-lib/libxrender_0.9.3.bb
new file mode 100644
index 0000000..82b0143
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxrender_0.9.3.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Rendering Extension client library"
+LICENSE = "BSD-X"
+DEPENDS += "virtual/libx11 renderproto xproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "307132fce2e551ad2c641bddf8480f16"
+SRC_URI[archive.sha256sum] = "9882ba2d74e9ca5cfd0c2231ac8eba14d8fc59d538c787fa639f8d77c996bbef"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXrender"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxrender_0.9.4.bb b/recipes/obsolete/xorg/xorg-lib/libxrender_0.9.4.bb
new file mode 100644
index 0000000..4543a9e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxrender_0.9.4.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Rendering Extension client library"
+LICENSE = "BSD-X"
+DEPENDS += "virtual/libx11 renderproto xproto libxdmcp"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "dc266e850c51368f964e0d67bf5fb5e6"
+SRC_URI[archive.sha256sum] = "5682d343dd4e7ef291a6577e956c331946ce5801d8fa076284a01b41de3017ec"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXrender"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxres_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libxres_1.0.3.bb
new file mode 100644
index 0000000..9a1aa01
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxres_1.0.3.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Resource extension library"
+DEPENDS += "libxext resourceproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "de66ffb657aba64c9d6dbdeabb757f3e"
+SRC_URI[archive.sha256sum] = "a6d5ba7573f5ec0f091095f01b51d1e671dd0f14acb5b8559cdf366e398a0230"
+
+XORG_PN = "libXres"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxscrnsaver_1.1.2.bb b/recipes/obsolete/xorg/xorg-lib/libxscrnsaver_1.1.2.bb
new file mode 100644
index 0000000..db164d2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxscrnsaver_1.1.2.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Screen Saver extension library"
+LICENSE = "GPL"
+DEPENDS += "libxext scrnsaverproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ac2d697dd02f51e5c15f7104f4be5328"
+SRC_URI[archive.sha256sum] = "6c75debca746060e0c2408a6ca119613ae02d1054adebd4b26ff8beee79bcc67"
+
+RREPLACES_${PN} = "libxss"
+
+XORG_PN = "libXScrnSaver"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxscrnsaver_1.1.3.bb b/recipes/obsolete/xorg/xorg-lib/libxscrnsaver_1.1.3.bb
new file mode 100644
index 0000000..2cc2c81
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxscrnsaver_1.1.3.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Screen Saver extension library"
+LICENSE = "GPL"
+DEPENDS += "libxext scrnsaverproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "93f84b6797f2f29cae1ce23b0355d00d"
+SRC_URI[archive.sha256sum] = "4b90245093c15a24aaaf2fc6e09f075137aad994f72043e098597997d9b2c988"
+
+RREPLACES_${PN} = "libxss"
+
+XORG_PN = "libXScrnSaver"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxt/pr10970-header-fix.patch b/recipes/obsolete/xorg/xorg-lib/libxt/pr10970-header-fix.patch
new file mode 100644
index 0000000..2acafb8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxt/pr10970-header-fix.patch
@@ -0,0 +1,512 @@
+diff --git a/include/X11/CallbackI.h b/include/X11/CallbackI.h
+index 4ae08ab..64e8152 100644
+--- a/include/X11/CallbackI.h
++++ b/include/X11/CallbackI.h
+@@ -58,6 +58,8 @@ typedef XrmResource **CallbackTable;
+ #define _XtCBCalling 1
+ #define _XtCBFreeAfterCalling 2
+ 
++_XFUNCPROTOBEGIN
++
+ typedef struct internalCallbackRec {
+     unsigned short count;
+     char	   is_padded;	/* contains NULL padding for external form */
+@@ -115,3 +117,5 @@ extern void _XtCallConditionalCallbackList(
+     XtPointer			/* call_data */,
+     _XtConditionProc		/* cond_proc */
+ );
++
++_XFUNCPROTOEND
+diff --git a/include/X11/CompositeP.h b/include/X11/CompositeP.h
+index ed055b2..e93275a 100644
+--- a/include/X11/CompositeP.h
++++ b/include/X11/CompositeP.h
+@@ -52,6 +52,8 @@ SOFTWARE.
+ 
+ #include <X11/Composite.h>
+ 
++_XFUNCPROTOBEGIN
++
+ /************************************************************************
+  *
+  * Additional instance fields for widgets of (sub)class 'Composite' 
+@@ -101,6 +103,8 @@ typedef struct _CompositeClassRec {
+ 
+ externalref CompositeClassRec compositeClassRec;
+ 
++_XFUNCPROTOEND
++
+ #define XtCompositeExtensionVersion 2L
+ #define XtInheritGeometryManager ((XtGeometryHandler) _XtInherit)
+ #define XtInheritChangeManaged ((XtWidgetProc) _XtInherit)
+diff --git a/include/X11/ConstrainP.h b/include/X11/ConstrainP.h
+index a90d19a..7030a34 100644
+--- a/include/X11/ConstrainP.h
++++ b/include/X11/ConstrainP.h
+@@ -52,6 +52,8 @@ SOFTWARE.
+ 
+ #include <X11/Constraint.h>
+ 
++_XFUNCPROTOBEGIN
++
+ typedef struct _ConstraintPart {
+     XtPointer   mumble;		/* No new fields, keep C compiler happy */
+ } ConstraintPart;
+@@ -88,6 +90,8 @@ typedef struct _ConstraintClassRec {
+ 
+ externalref ConstraintClassRec constraintClassRec;
+ 
++_XFUNCPROTOEND
++
+ #define XtConstraintExtensionVersion 1L
+ 
+ #endif /* _XtConstraintP_h */
+diff --git a/include/X11/Constraint.h b/include/X11/Constraint.h
+index 9bb962e..b8bd902 100644
+--- a/include/X11/Constraint.h
++++ b/include/X11/Constraint.h
+@@ -50,11 +50,15 @@ SOFTWARE.
+ #ifndef _XtConstraint_h
+ #define _XtConstraint_h
+ 
++_XFUNCPROTOBEGIN
++
+ typedef struct _ConstraintClassRec *ConstraintWidgetClass;
+ 
+ #ifndef CONSTRAINT
+ externalref WidgetClass constraintWidgetClass;
+ #endif
+ 
++_XFUNCPROTOEND
++
+ #endif /* _XtConstraint_h */
+ /* DON'T ADD STUFF AFTER THIS #endif */
+diff --git a/include/X11/ConvertI.h b/include/X11/ConvertI.h
+index 02c0e5c..f3f7fb0 100644
+--- a/include/X11/ConvertI.h
++++ b/include/X11/ConvertI.h
+@@ -48,6 +48,8 @@ SOFTWARE.
+ ******************************************************************/
+ /* $XFree86: xc/lib/Xt/ConvertI.h,v 1.3 2001/12/14 19:56:09 dawes Exp $ */
+ 
++_XFUNCPROTOBEGIN
++
+ /* Representation types */
+ 
+ extern	XrmQuark  _XtQString;
+@@ -94,3 +96,4 @@ extern Boolean _XtConvert(
+ 
+ void _XtConvertInitialize(void);
+ 
++_XFUNCPROTOEND
+diff --git a/include/X11/Core.h b/include/X11/Core.h
+index ff6cb75..e1a7c28 100644
+--- a/include/X11/Core.h
++++ b/include/X11/Core.h
+@@ -53,6 +53,8 @@ SOFTWARE.
+ #ifndef _XtCore_h
+ #define _XtCore_h
+ 
++_XFUNCPROTOBEGIN
++
+ typedef struct _WidgetClassRec *CoreWidgetClass;
+ typedef struct _WidgetRec *CoreWidget;
+ externalref WidgetClass coreWidgetClass;
+@@ -62,5 +64,7 @@ externalref WidgetClass widgetClass;
+ 
+ #endif
+ 
++_XFUNCPROTOEND
++
+ #endif /* _XtCore_h */
+ /* DON'T ADD STUFF AFTER THIS #endif */
+diff --git a/include/X11/CoreP.h b/include/X11/CoreP.h
+index e07f085..57836e6 100644
+--- a/include/X11/CoreP.h
++++ b/include/X11/CoreP.h
+@@ -55,6 +55,8 @@ SOFTWARE.
+ 
+ #include <X11/Core.h>
+ 
++_XFUNCPROTOBEGIN
++
+ externalref int _XtInheritTranslations;
+ 
+ #define XtInheritTranslations  ((String) &_XtInheritTranslations)
+@@ -167,5 +169,7 @@ typedef struct _WidgetClassRec {
+ externalref WidgetClassRec widgetClassRec;
+ #define coreClassRec widgetClassRec
+ 
++_XFUNCPROTOEND
++
+ #endif /* _XtCoreP_h */
+ /* DON'T ADD STUFF AFTER THIS #endif */
+diff --git a/include/X11/CreateI.h b/include/X11/CreateI.h
+index 87abb1d..e0ca9a3 100644
+--- a/include/X11/CreateI.h
++++ b/include/X11/CreateI.h
+@@ -3,6 +3,8 @@
+ #ifndef _XtcreateI_h
+ #define _XtcreateI_h
+ 
++_XFUNCPROTOBEGIN
++
+ extern Widget _XtCreateWidget(String name, WidgetClass widget_class,
+ 			      Widget parent, ArgList args, Cardinal num_args,
+ 			      XtTypedArgList typed_args,
+@@ -18,9 +20,12 @@ extern Widget _XtAppCreateShell(String name, String class,
+ 				Cardinal num_typed_args);
+ extern Widget _XtCreateHookObj(Screen *screen);
+ 
++_XFUNCPROTOEND
+ 
+ #include <stdarg.h>
+ 
++_XFUNCPROTOBEGIN
++
+ /* VarCreate.c */
+ extern Widget _XtVaOpenApplication(XtAppContext *app_context_return,
+ 			_Xconst char* application_class,
+@@ -34,4 +39,6 @@ extern Widget _XtVaAppInitialize(XtAppContext *app_context_return,
+ 			int *argc_in_out, String *argv_in_out,
+ 			String *fallback_resources, va_list var_args);
+ 
++_XFUNCPROTOEND
++
+ #endif /* _XtcreateI_h */
+diff --git a/include/X11/EventI.h b/include/X11/EventI.h
+index 00858e7..d2d1d0f 100644
+--- a/include/X11/EventI.h
++++ b/include/X11/EventI.h
+@@ -65,6 +65,8 @@ typedef struct _XtGrabRec  *XtGrabList;
+ 
+ #include "PassivGraI.h"
+ 
++_XFUNCPROTOBEGIN
++
+ extern void _XtEventInitialize(
+     void
+ );
+@@ -131,4 +133,6 @@ extern void _XtFillAncestorList(Widget **listPtr, int *maxElemsPtr,
+ /* NextEvent.c */
+ extern Boolean XtAppPeekEvent_SkipTimer;
+ 
++_XFUNCPROTOEND
++
+ #endif /* _Event_h_ */
+diff --git a/include/X11/HookObjI.h b/include/X11/HookObjI.h
+index c9a22a2..c0858c2 100644
+--- a/include/X11/HookObjI.h
++++ b/include/X11/HookObjI.h
+@@ -29,6 +29,8 @@ in this Software without prior written authorization from The Open Group.
+ #ifndef _XtHookObjI_h
+ #define _XtHookObjI_h
+ 
++_XFUNCPROTOBEGIN
++
+ /* This object is implementation-dependent and private to the library. */
+ 
+ typedef struct _HookObjRec *HookObject;
+@@ -66,6 +68,8 @@ typedef struct _HookObjClassRec {
+ 
+ externalref HookObjClassRec hookObjClassRec;
+ 
++_XFUNCPROTOEND
++
+ #endif /* ifndef _Xt_HookObjI_h */
+ 
+ 
+diff --git a/include/X11/InitialI.h b/include/X11/InitialI.h
+index c2fe47c..2ae9b74 100644
+--- a/include/X11/InitialI.h
++++ b/include/X11/InitialI.h
+@@ -84,6 +84,8 @@ SOFTWARE.
+ #include <X11/Xos.h>
+ #include <X11/Xpoll.h>
+ 
++_XFUNCPROTOBEGIN
++
+ typedef struct _TimerEventRec {
+         struct timeval        te_timer_value;
+ 	struct _TimerEventRec *te_next;
+@@ -426,4 +428,6 @@ extern XrmDatabase _XtPreparseCommandLine(XrmOptionDescRec *urlist,
+ 			String *applName, String *displayName,
+ 			String *language);
+ 
++_XFUNCPROTOEND
++
+ #endif /* _XtinitialI_h */
+diff --git a/include/X11/IntrinsicI.h b/include/X11/IntrinsicI.h
+index d749867..d88166f 100644
+--- a/include/X11/IntrinsicI.h
++++ b/include/X11/IntrinsicI.h
+@@ -194,6 +194,8 @@ SOFTWARE.
+ #define ERRORDB "/usr/lib/X11/XtErrorDB"
+ #endif
+ 
++_XFUNCPROTOBEGIN
++
+ extern String XtCXtToolkitError;
+ 
+ extern void _XtAllocError(
+@@ -257,5 +259,7 @@ extern char* __XtCalloc (
+ #define __XtCalloc XtCalloc
+ #endif
+ 
++_XFUNCPROTOEND
++
+ #endif /* _XtintrinsicI_h */
+ /* DON'T ADD STUFF AFTER THIS #endif */
+diff --git a/include/X11/Object.h b/include/X11/Object.h
+index 96723b1..2c84aaf 100644
+--- a/include/X11/Object.h
++++ b/include/X11/Object.h
+@@ -50,11 +50,16 @@ SOFTWARE.
+ #ifndef _XtObject_h
+ #define _XtObject_h
+ 
++_XFUNCPROTOBEGIN
++
+ typedef struct _ObjectRec *Object;
+ typedef struct _ObjectClassRec *ObjectClass;
+ 
+ #ifndef OBJECT
+ externalref WidgetClass objectClass;
+ #endif
++
++_XFUNCPROTOEND
++
+ #endif /* _XtObject_h */
+ /* DON'T ADD STUFF AFTER THIS #endif */
+diff --git a/include/X11/ObjectP.h b/include/X11/ObjectP.h
+index a24564e..0f484d2 100644
+--- a/include/X11/ObjectP.h
++++ b/include/X11/ObjectP.h
+@@ -52,6 +52,8 @@ SOFTWARE.
+ 
+ #include <X11/Object.h>
+ 
++_XFUNCPROTOBEGIN
++
+ /**********************************************************
+  * Object Instance Data Structures
+  *
+@@ -132,6 +134,8 @@ typedef struct _ObjectClassRec {
+ 
+ externalref ObjectClassRec objectClassRec;
+ 
++_XFUNCPROTOEND
++
+ #define XtObjectExtensionVersion 1L
+ #define XtInheritAllocate ((XtAllocateProc) _XtInherit)
+ #define XtInheritDeallocate ((XtDeallocateProc) _XtInherit)
+diff --git a/include/X11/PassivGraI.h b/include/X11/PassivGraI.h
+index 02e2964..10591ac 100644
+--- a/include/X11/PassivGraI.h
++++ b/include/X11/PassivGraI.h
+@@ -60,6 +60,8 @@ in this Software without prior written authorization from The Open Group.
+ #define KEYBOARD TRUE
+ #define POINTER  FALSE
+ 
++_XFUNCPROTOBEGIN
++
+ typedef enum {
+     XtNoServerGrab, 
+     XtPassiveServerGrab,
+@@ -183,4 +185,6 @@ extern void _XtClearAncestorCache(
+     Widget		/* widget */
+ );
+ 
++_XFUNCPROTOEND
++
+ #endif /* _PDI_h_ */
+diff --git a/include/X11/RectObj.h b/include/X11/RectObj.h
+index 07615fa..dced5c3 100644
+--- a/include/X11/RectObj.h
++++ b/include/X11/RectObj.h
+@@ -50,11 +50,16 @@ SOFTWARE.
+ #ifndef _XtRect_h
+ #define _XtRect_h
+ 
++_XFUNCPROTOBEGIN
++
+ typedef struct _RectObjRec *RectObj;
+ typedef struct _RectObjClassRec *RectObjClass;
+ 
+ #ifndef RECTOBJ
+ externalref WidgetClass rectObjClass;
+ #endif
++
++_XFUNCPROTOEND
++
+ #endif /* _XtRect_h */
+ /* DON'T ADD STUFF AFTER THIS #endif */
+diff --git a/include/X11/RectObjP.h b/include/X11/RectObjP.h
+index ca3b8ad..d6ffb78 100644
+--- a/include/X11/RectObjP.h
++++ b/include/X11/RectObjP.h
+@@ -53,6 +53,8 @@ SOFTWARE.
+ #include <X11/RectObj.h>
+ #include <X11/ObjectP.h>
+ 
++_XFUNCPROTOBEGIN
++
+ /**********************************************************
+  * Rectangle Object Instance Data Structures
+  *
+@@ -126,4 +128,6 @@ typedef struct _RectObjClassRec {
+ 
+ externalref RectObjClassRec rectObjClassRec;
+ 
++_XFUNCPROTOEND
++
+ #endif /*_Xt_RectObjP_h_*/
+diff --git a/include/X11/ResourceI.h b/include/X11/ResourceI.h
+index d6ed1df..3db97f8 100644
+--- a/include/X11/ResourceI.h
++++ b/include/X11/ResourceI.h
+@@ -61,6 +61,8 @@ SOFTWARE.
+ #define StringToName(string) XrmStringToName(string)
+ #define StringToClass(string) XrmStringToClass(string)
+ 
++_XFUNCPROTOBEGIN
++
+ extern void _XtDependencies(
+     XtResourceList  * /* class_resp */,
+     Cardinal	    * /* class_num_resp */,
+@@ -96,5 +98,6 @@ extern XrmResourceList* _XtCreateIndirectionTable(XtResourceList resources,
+ 						  Cardinal num_resources);
+ extern void _XtResourceListInitialize(void);
+ 
++_XFUNCPROTOEND
+ 
+ #endif /* _XtresourceI_h */
+diff --git a/include/X11/ShellP.h b/include/X11/ShellP.h
+index 2b08c3f..7297d33 100644
+--- a/include/X11/ShellP.h
++++ b/include/X11/ShellP.h
+@@ -67,6 +67,8 @@ SOFTWARE.
+  * *****
+  */
+ 
++_XFUNCPROTOBEGIN
++
+ /***********************************************************************
+  *
+  * Shell Widget Private Data
+@@ -214,8 +216,12 @@ typedef  struct {
+ 	WMShellPart	wm;
+ } WMShellRec, *WMShellWidget;
+ 
++_XFUNCPROTOEND
++
+ #include <X11/VendorP.h>
+ 
++_XFUNCPROTOBEGIN
++
+ /***********************************************************************
+  *
+  * TransientShell Widget Private Data
+@@ -425,4 +431,6 @@ typedef  struct {
+ 	SessionShellPart session;
+ } SessionShellRec, *SessionShellWidget;
+ 
++_XFUNCPROTOEND
++
+ #endif /* _XtShellPrivate_h */
+diff --git a/include/X11/ThreadsI.h b/include/X11/ThreadsI.h
+index 1492d77..28cbc98 100644
+--- a/include/X11/ThreadsI.h
++++ b/include/X11/ThreadsI.h
+@@ -81,6 +81,8 @@ typedef void (*ThreadAppRestoreLockProc)(
+     Boolean* /* pushed_thread */
+ );
+ 
++_XFUNCPROTOBEGIN
++
+ extern void (*_XtProcessLock)(
+     void
+ );
+@@ -93,6 +95,8 @@ extern void (*_XtInitAppLock)(
+     XtAppContext /* app */
+ );
+ 
++_XFUNCPROTOEND
++
+ #define INIT_APP_LOCK(app) if(_XtInitAppLock) (*_XtInitAppLock)(app)
+ #define FREE_APP_LOCK(app) if(app && app->free_lock)(*app->free_lock)(app)
+ 
+diff --git a/include/X11/TranslateI.h b/include/X11/TranslateI.h
+index 1224875..6cc3099 100644
+--- a/include/X11/TranslateI.h
++++ b/include/X11/TranslateI.h
+@@ -342,6 +342,8 @@ typedef struct _TMGlobalRec{
+ #endif /* TRACE_TM */
+ }TMGlobalRec;
+ 
++_XFUNCPROTOBEGIN
++
+ extern TMGlobalRec _XtGlobalTM;
+ 
+ #define TM_MOD_SEGMENT_SIZE 	16
+@@ -604,3 +606,4 @@ extern void _XtUnmergeTranslations(
+ /* TMKey.c */
+ extern void _XtAllocTMContext(XtPerDisplay pd);
+ 
++_XFUNCPROTOEND
+diff --git a/include/X11/VarargsI.h b/include/X11/VarargsI.h
+index e15404a..76ce9bc 100644
+--- a/include/X11/VarargsI.h
++++ b/include/X11/VarargsI.h
+@@ -34,6 +34,8 @@ in this Software without prior written authorization from The Open Group.
+  
+ /* private routines */
+ 
++_XFUNCPROTOBEGIN
++
+ extern void _XtCountVaList(
+     va_list /*var*/, int* /*total_count*/, int* /*typed_count*/
+ );
+@@ -62,4 +64,6 @@ extern void _XtGetSubresources(
+     Widget /*w*/, XtPointer /*base*/, const char* /*name*/, const char* /*class*/, XtResourceList /*resources*/, Cardinal /*num_resources*/, ArgList /*args*/, Cardinal /*num_args*/, XtTypedArgList /*typed_args*/, Cardinal /*num_typed_args*/
+ );
+ 
++_XFUNCPROTOEND
++
+ #endif /* _VarargsI_h_ */
+diff --git a/include/X11/Vendor.h b/include/X11/Vendor.h
+index 65e7c38..633d17a 100644
+--- a/include/X11/Vendor.h
++++ b/include/X11/Vendor.h
+@@ -65,7 +65,11 @@ SOFTWARE.
+ 
+ typedef struct _VendorShellClassRec *VendorShellWidgetClass;
+ 
++_XFUNCPROTOBEGIN
++
+ externalref WidgetClass vendorShellWidgetClass;
+ 
++_XFUNCPROTOEND
++
+ #endif /* _XtVendor_h */
+ /* DON'T ADD STUFF AFTER THIS #endif */
+diff --git a/include/X11/VendorP.h b/include/X11/VendorP.h
+index 08bf689..e60857d 100644
+--- a/include/X11/VendorP.h
++++ b/include/X11/VendorP.h
+@@ -72,6 +72,8 @@ SOFTWARE.
+ 
+ /* New fields for the VendorShell widget class record */
+ 
++_XFUNCPROTOBEGIN
++
+ typedef struct {
+     XtPointer       extension;          /* pointer to extension record      */
+ } VendorShellClassPart;
+@@ -100,4 +102,6 @@ typedef  struct {
+ 	VendorShellPart	vendor;
+ } VendorShellRec, *VendorShellWidget;
+ 
++_XFUNCPROTOEND
++
+ #endif  /* _XtVendorPrivate_h */
diff --git a/recipes/obsolete/xorg/xorg-lib/libxt_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libxt_1.0.4.bb
new file mode 100644
index 0000000..7dd9863
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxt_1.0.4.bb
@@ -0,0 +1,24 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Toolkit Intrinsics"
+PRIORITY = "optional"
+DEPENDS += " libsm virtual/libx11 xproto kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://pr10970-header-fix.patch"
+SRC_URI[archive.md5sum] = "937735f342c046db239852fec0413f6c"
+SRC_URI[archive.sha256sum] = "ec7088b2ffe8f56c177525283601fb048decaf6f175d9ee5db01e12810a4d345"
+
+EXTRA_OECONF = "--enable-malloc0returnsnull --disable-install-makestrs --disable-xkb"
+
+do_compile() {
+        (
+                unset CC LD CXX CCLD
+                oe_runmake -C util 'XT_CFLAGS=' 'CC=${BUILD_CC}' 'LD=${BUILD_LD}' 'CXX=${BUILD_CXX}' 'CCLD=${BUILD_CCLD}' 'CFLAGS=-D_GNU_SOURCE ${BUILD_CFLAGS}' 'LDFLAGS=${BUILD_LDFLAGS}' 'CXXFLAGS=${BUILD_CXXFLAGS}' 'CPPFLAGS=${BUILD_CPPFLAGS}' makestrs
+        ) || exit 1
+        oe_runmake
+}
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXt"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxt_1.0.5.bb b/recipes/obsolete/xorg/xorg-lib/libxt_1.0.5.bb
new file mode 100644
index 0000000..7bdf252
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxt_1.0.5.bb
@@ -0,0 +1,23 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 toolkit intrinsics library"
+DEPENDS += "libsm virtual/libx11 kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://pr10970-header-fix.patch"
+SRC_URI[archive.md5sum] = "f3bdd67785ace8cd0b23249e9d8c9975"
+SRC_URI[archive.sha256sum] = "43c472ada59a04428a463225cd4cd42cb81bc43eb687cc1890f2f1c81a3e9cf4"
+
+EXTRA_OECONF += "--disable-install-makestrs --disable-xkb"
+
+do_compile() {
+        (
+                unset CC LD CXX CCLD
+                oe_runmake -C util 'XT_CFLAGS=' 'CC=${BUILD_CC}' 'LD=${BUILD_LD}' 'CXX=${BUILD_CXX}' 'CCLD=${BUILD_CCLD}' 'CFLAGS=-D_GNU_SOURCE -I${STAGING_INCDIR_NATIVE} ${BUILD_CFLAGS}' 'LDFLAGS=${BUILD_LDFLAGS}' 'CXXFLAGS=${BUILD_CXXFLAGS}' 'CPPFLAGS=${BUILD_CPPFLAGS}' makestrs
+        ) || exit 1
+        oe_runmake
+}
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXt"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxtst_1.0.2.bb b/recipes/obsolete/xorg/xorg-lib/libxtst_1.0.2.bb
new file mode 100644
index 0000000..ff87f7c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxtst_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Test Extension: client side library"
+DEPENDS += "libxext recordproto inputproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "032d5c1d3914fc0224837328c88aef96"
+SRC_URI[archive.sha256sum] = "eef98ad3d35254384c3714cd63826fc2009f9b394f2b489718aba9be7be0a10b"
+
+XORG_PN = "libXtst"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxtst_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libxtst_1.0.3.bb
new file mode 100644
index 0000000..56dfae5
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxtst_1.0.3.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Test Extension: client side library"
+DEPENDS += "libxext recordproto inputproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "090c1ad04e34982eada5cf3b1a0792fd"
+SRC_URI[archive.sha256sum] = "b4a8dd3d9ceb04cd7322c1f7e5d2320d6ccf85ba8c81d736fd6d6c83c658c905"
+
+XORG_PN = "libXtst"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxv_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/libxv_1.0.3.bb
new file mode 100644
index 0000000..4f19126
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxv_1.0.3.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Video extension library"
+LICENSE = "GPL"
+DEPENDS += "libxext videoproto"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f1c4109fa804aeaf7188b66c5cdd9f57"
+SRC_URI[archive.sha256sum] = "f87ae65be39a3c26dc3c87159d9126daf2af1b8c5e7f2ffc38b9f72b9236261b"
+
+XORG_PN = "libXv"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxv_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libxv_1.0.4.bb
new file mode 100644
index 0000000..be5a50c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxv_1.0.4.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Video extension library"
+LICENSE = "GPL"
+DEPENDS += "libxext videoproto"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "723a0275227165383e967a1ca8899b52"
+SRC_URI[archive.sha256sum] = "4d3cc49b6f4da6d396196054eca23a91df1a41001c736dcfd22fec5a5c7428c8"
+
+XORG_PN = "libXv"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxvmc/drm.patch b/recipes/obsolete/xorg/xorg-lib/libxvmc/drm.patch
new file mode 100644
index 0000000..d48cdb3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxvmc/drm.patch
@@ -0,0 +1,9 @@
+--- XvMC/hw/via/Makefile.am.old	2005-03-06 11:25:11.000000000 +0000
++++ XvMC/hw/via/Makefile.am	2005-03-06 11:25:22.000000000 +0000
+@@ -1,5 +1,5 @@
+ AM_CFLAGS = $(XVMC_CFLAGS)
+-libviaXvMC_la_LIBADD = $(XVMC_LIBS) -lxf86drm
++libviaXvMC_la_LIBADD = $(XVMC_LIBS) -ldrm
+ 
+ lib_LTLIBRARIES = libviaXvMC.la
+ 
diff --git a/recipes/obsolete/xorg/xorg-lib/libxvmc/true.patch b/recipes/obsolete/xorg/xorg-lib/libxvmc/true.patch
new file mode 100644
index 0000000..7059295
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxvmc/true.patch
@@ -0,0 +1,11 @@
+--- XvMC/hw/via/viaXvMC.c.old	2004-10-18 20:54:49.000000000 +0100
++++ XvMC/hw/via/viaXvMC.c	2004-10-18 20:55:03.000000000 +0100
+@@ -43,6 +43,8 @@
+ #include <xf86drm.h>
+ #include <pthread.h>
+ #include "vldXvMC.h"
++
++#define TRUE 1
+     
+ #define SAREAPTR(ctx) ((ViaXvMCSAreaPriv *) \
+ 		       (((CARD8 *)(ctx)->sAreaAddress) +	\
diff --git a/recipes/obsolete/xorg/xorg-lib/libxvmc/via.patch b/recipes/obsolete/xorg/xorg-lib/libxvmc/via.patch
new file mode 100644
index 0000000..21cdfbd
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxvmc/via.patch
@@ -0,0 +1,23 @@
+--- XvMC/configure.ac.old	2004-09-18 13:16:31.000000000 +0100
++++ XvMC/configure.ac	2004-09-18 13:16:32.000000000 +0100
+@@ -14,4 +14,5 @@
+ AC_OUTPUT([Makefile
+            hw/Makefile
+ 	   hw/i810/Makefile
++	   hw/via/Makefile
+            xvmc.pc])
+--- /dev/null	2004-06-13 02:32:19.000000000 +0100
++++ XvMC/hw/via/Makefile.am	2004-09-18 13:16:01.000000000 +0100
+@@ -0,0 +1,7 @@
++AM_CFLAGS = $(XVMC_CFLAGS)
++libviaXvMC_la_LIBADD = $(XVMC_LIBS) -lxf86drm
++
++lib_LTLIBRARIES = libviaXvMC.la
++
++libviaXvMC_la_SOURCES = viaXvMC.c viaXvMC.h viaLowLevel.c viaLowLevel.h \
++		viaXvMCPriv.h
+--- XvMC/hw/Makefile.am.old	2004-10-17 22:34:27.000000000 +0100
++++ XvMC/hw/Makefile.am	2004-10-17 22:34:31.000000000 +0100
+@@ -1 +1 @@
+-SUBDIRS = i810
++SUBDIRS = i810 via
diff --git a/recipes/obsolete/xorg/xorg-lib/libxvmc_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/libxvmc_1.0.4.bb
new file mode 100644
index 0000000..003c5be
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxvmc_1.0.4.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Video Motion Compensation extension library"
+DEPENDS += "libxext libxv videoproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b54600573daf9d1a29b952e8d35b389e"
+SRC_URI[archive.sha256sum] = "1217825ba8d66198466ee8306d0d6d237d2dd80d0f0783c98701296791833abb"
+
+XORG_PN = "libXvMC"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxvmc_1.0.5.bb b/recipes/obsolete/xorg/xorg-lib/libxvmc_1.0.5.bb
new file mode 100644
index 0000000..cdd965a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxvmc_1.0.5.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Video Motion Compensation extension library"
+DEPENDS += "libxext libxv videoproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "16c3a11add14979beb7510e44623cac6"
+SRC_URI[archive.sha256sum] = "0644c768d28343af0efe0cb09fc9e0220b8ad755642bb498a3038cee328fde7f"
+
+XORG_PN = "libXvMC"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxxf86dga_1.0.1.bb b/recipes/obsolete/xorg/xorg-lib/libxxf86dga_1.0.1.bb
new file mode 100644
index 0000000..6d51967
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxxf86dga_1.0.1.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Direct Graphics Access extension library"
+DEPENDS += "libxext xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5b0e752c71a23e9d1290cad44a7c7c75"
+SRC_URI[archive.sha256sum] = "8c68f429942b1258cff0fb27505645a463690374ecf318ae660ff4cde7a03db9"
+
+XORG_PN = "libXxf86dga"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxxf86dga_1.0.2.bb b/recipes/obsolete/xorg/xorg-lib/libxxf86dga_1.0.2.bb
new file mode 100644
index 0000000..b311537
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxxf86dga_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Direct Graphics Access extension library"
+DEPENDS += "libxext xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6f5f621804ee652b6cc6f2025c517c78"
+SRC_URI[archive.sha256sum] = "59175230a00a1fb359148f36eadb50fc6cb080849379ccb0e43c6cbb97309a25"
+
+XORG_PN = "libXxf86dga"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxxf86misc_1.0.1.bb b/recipes/obsolete/xorg/xorg-lib/libxxf86misc_1.0.1.bb
new file mode 100644
index 0000000..91a7123
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxxf86misc_1.0.1.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 XFree86 miscellaneous extension library"
+DEPENDS += "libxext xf86miscproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7cee0df63903cef7f7a3fb68cdd99eef"
+SRC_URI[archive.sha256sum] = "2122d67d49aaa06eeaeb3db173ea8a7048f3b52665e5135874bc5cadada91289"
+
+XORG_PN = "libXxf86misc"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxxf86vm_1.0.1.bb b/recipes/obsolete/xorg/xorg-lib/libxxf86vm_1.0.1.bb
new file mode 100644
index 0000000..b13707c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxxf86vm_1.0.1.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 XFree86 video mode extension library"
+DEPENDS += "libxext xf86vidmodeproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8de1ca6c55aaad7d8cae19b4f0b3da32"
+SRC_URI[archive.sha256sum] = "e08fc2c1611c422f751ed02810491b45bf7faa4207d762a11f11815263c9285a"
+
+XORG_PN = "libXxf86vm"
diff --git a/recipes/obsolete/xorg/xorg-lib/libxxf86vm_1.0.2.bb b/recipes/obsolete/xorg/xorg-lib/libxxf86vm_1.0.2.bb
new file mode 100644
index 0000000..e693362
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/libxxf86vm_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 XFree86 video mode extension library"
+DEPENDS += "libxext xf86vidmodeproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "304d37bd0a10d9b58aa9b64469ad73e5"
+SRC_URI[archive.sha256sum] = "3cb3c3c6552a4fbc686ba6c2dbeb6e4ba2a27103279908831d56363de73951de"
+
+XORG_PN = "libXxf86vm"
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
new file mode 100644
index 0000000..25ce7ee
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
@@ -0,0 +1,114 @@
+From c29c9fa826b7112156fd6150b5f1564227935c05 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:27:33 +0300
+Subject: [PATCH 3/6] Generic C implementation of pixman_blt with overlapping support
+
+Uses memcpy/memmove functions to copy pixels, can handle the
+case when both source and destination areas are in the same
+image (this is useful for scrolling).
+
+It is assumed that copying direction is only important when
+using the same image for both source and destination (and
+src_stride == dst_stride). Copying direction is undefined
+for the images with different source and destination stride
+which happen to be in the overlapped areas (but this is an
+unrealistic case anyway).
+---
+ pixman/pixman-general.c |   21 ++++++++++++++++++---
+ pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
+index c96a3f9..d71a299 100644
+--- a/pixman/pixman-general.c
++++ b/pixman/pixman-general.c
+@@ -300,9 +300,24 @@ general_blt (pixman_implementation_t *imp,
+              int                      width,
+              int                      height)
+ {
+-    /* We can't blit unless we have sse2 or mmx */
+-
+-    return FALSE;
++    uint8_t *dst_bytes = (uint8_t *)dst_bits;
++    uint8_t *src_bytes = (uint8_t *)src_bits;
++    int bpp;
++
++    if (src_bpp != dst_bpp || src_bpp & 7)
++	return FALSE;
++
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
++                       dst_bytes + dst_y * dst_stride + dst_x * bpp,
++                       src_stride,
++                       dst_stride,
++                       width,
++                       height);
++    return TRUE;
+ }
+ 
+ static pixman_bool_t
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index 5000f91..8c5d4fd 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -10,6 +10,7 @@
+ 
+ #include "pixman.h"
+ #include <time.h>
++#include <string.h>
+ #include <assert.h>
+ 
+ #include "pixman-compiler.h"
+@@ -794,4 +795,46 @@ void pixman_timer_register (pixman_timer_t *timer);
+ 
+ #endif /* PIXMAN_TIMERS */
+ 
++/* a helper function, can blit 8-bit images with src/dst overlapping support */
++static inline void
++pixman_blt_helper (uint8_t *src_bytes,
++                   uint8_t *dst_bytes,
++                   int      src_stride,
++                   int      dst_stride,
++                   int      width,
++                   int      height)
++{
++    /*
++     * The second part of this check is not strictly needed, but it prevents
++     * unnecessary upside-down processing of areas which belong to different
++     * images. Upside-down processing can be slower with fixed-distance-ahead
++     * prefetch and perceived as having more tearing.
++     */
++    if (src_bytes < dst_bytes + width &&
++	src_bytes + src_stride * height > dst_bytes)
++    {
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++	/* Horizontal scrolling to the left needs memmove */
++	if (src_bytes + width > dst_bytes)
++	{
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return;
++	}
++    }
++    while (--height >= 0)
++    {
++	memcpy (dst_bytes, src_bytes, width);
++	dst_bytes += dst_stride;
++	src_bytes += src_stride;
++    }
++}
++
+ #endif /* PIXMAN_PRIVATE_H */
+-- 
+1.6.2.4
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
new file mode 100644
index 0000000..74c7b45
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
@@ -0,0 +1,91 @@
+From 7ca32542c957ff308a6ca7e3715e6552a65ae395 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:47 +0300
+Subject: [PATCH 4/6] Support of overlapping src/dst for pixman_blt_mmx
+
+---
+ pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
+index 819e3a0..dcccadb 100644
+--- a/pixman/pixman-mmx.c
++++ b/pixman/pixman-mmx.c
+@@ -3002,34 +3002,43 @@ pixman_blt_mmx (uint32_t *src_bits,
+ {
+     uint8_t *   src_bytes;
+     uint8_t *   dst_bytes;
+-    int byte_width;
++    int         bpp;
+ 
+-    if (src_bpp != dst_bpp)
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
+-    if (src_bpp == 16)
+-    {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
+-	src_bytes = (uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 2 * width;
+-	src_stride *= 2;
+-	dst_stride *= 2;
+-    }
+-    else if (src_bpp == 32)
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
+     {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
+-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 4 * width;
+-	src_stride *= 4;
+-	dst_stride *= 4;
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
+     }
+-    else
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
+     {
+-	return FALSE;
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using MMX */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
+     }
+ 
+     while (height--)
+@@ -3039,7 +3048,7 @@ pixman_blt_mmx (uint32_t *src_bits,
+ 	uint8_t *d = dst_bytes;
+ 	src_bytes += src_stride;
+ 	dst_bytes += dst_stride;
+-	w = byte_width;
++	w = width;
+ 
+ 	while (w >= 2 && ((unsigned long)d & 3))
+ 	{
+-- 
+1.6.2.4
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
new file mode 100644
index 0000000..3704fbf
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
@@ -0,0 +1,91 @@
+From edc80b41c6480b7c80ec5f7c835c92b2debb3774 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:54 +0300
+Subject: [PATCH 5/6] Support of overlapping src/dst for pixman_blt_sse2
+
+---
+ pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
+index 78b0ad1..b84636b 100644
+--- a/pixman/pixman-sse2.c
++++ b/pixman/pixman-sse2.c
+@@ -5300,34 +5300,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
+ {
+     uint8_t *   src_bytes;
+     uint8_t *   dst_bytes;
+-    int byte_width;
++    int         bpp;
+ 
+-    if (src_bpp != dst_bpp)
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
+-    if (src_bpp == 16)
+-    {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
+-	src_bytes =(uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 2 * width;
+-	src_stride *= 2;
+-	dst_stride *= 2;
+-    }
+-    else if (src_bpp == 32)
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
+     {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
+-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 4 * width;
+-	src_stride *= 4;
+-	dst_stride *= 4;
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
+     }
+-    else
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
+     {
+-	return FALSE;
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using SSE2 */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
+     }
+ 
+     cache_prefetch ((__m128i*)src_bytes);
+@@ -5340,7 +5349,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
+ 	uint8_t *d = dst_bytes;
+ 	src_bytes += src_stride;
+ 	dst_bytes += dst_stride;
+-	w = byte_width;
++	w = width;
+ 
+ 	cache_prefetch_next ((__m128i*)s);
+ 	cache_prefetch_next ((__m128i*)d);
+-- 
+1.6.2.4
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
new file mode 100644
index 0000000..7c22483
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
@@ -0,0 +1,94 @@
+From 86870ff530b5e435034bd80207e5758466d96cff Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Wed, 18 Nov 2009 06:08:48 +0200
+Subject: [PATCH 6/6] Support of overlapping src/dst for pixman_blt_neon
+
+---
+ pixman/pixman-arm-neon.c |   63 ++++++++++++++++++++++++++++++++++++++-------
+ 1 files changed, 53 insertions(+), 10 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 495fda4..c632ff5 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -357,26 +357,66 @@
+                  int       width,
+                  int       height)
+ {
+-    if (src_bpp != dst_bpp)
++    uint8_t *   src_bytes;
++    uint8_t *   dst_bytes;
++    int         bpp;
++
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
++    {
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
++    }
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
++    {
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using NEON */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
++    }
++
+     switch (src_bpp)
+     {
+     case 16:
+ 	pixman_composite_src_0565_0565_asm_neon (
+-		width, height,
+-		(uint16_t *)(((char *) dst_bits) +
+-		dst_y * dst_stride * 4 + dst_x * 2), dst_stride * 2,
+-		(uint16_t *)(((char *) src_bits) +
+-		src_y * src_stride * 4 + src_x * 2), src_stride * 2);
++		width >> 1,
++		height,
++		(uint16_t *) dst_bytes,
++		dst_stride >> 1,
++		(uint16_t *) src_bytes,
++		src_stride >> 1);
+ 	return TRUE;
+     case 32:
+ 	pixman_composite_src_8888_8888_asm_neon (
+-		width, height,
+-		(uint32_t *)(((char *) dst_bits) +
+-		dst_y * dst_stride * 4 + dst_x * 4), dst_stride,
+-		(uint32_t *)(((char *) src_bits) +
+-		src_y * src_stride * 4 + src_x * 4), src_stride);
++		width >> 2,
++		height,
++		(uint32_t *) dst_bytes,
++		dst_stride >> 2,
++		(uint32_t *) src_bytes,
++		src_stride >> 2);
+ 	return TRUE;
+     default:
+ 	return FALSE;
+-- 
+1.6.2.4
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/1-composite.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/1-composite.patch
new file mode 100644
index 0000000..31bfa39
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/1-composite.patch
@@ -0,0 +1,161 @@
+From 78652135f48c6a304fc2e75bc0e440b8b2034a4d Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Tue, 23 Feb 2010 23:44:00 +0000
+Subject: ARM: added 'neon_composite_over_n_8888_8888_ca' fast path
+
+This fast path function improves performance of 'firefox-talos-gfx'
+cairo-perf trace.
+
+Benchmark from ARM Cortex-A8 @720MHz
+
+before:
+
+[ # ]  backend                         test   min(s) median(s) stddev. count
+[  0]    image            firefox-talos-gfx  139.969  141.176   0.35%    6/6
+
+after:
+
+[ # ]  backend                         test   min(s) median(s) stddev. count
+[  0]    image            firefox-talos-gfx  111.810  112.196   0.23%    6/6
+---
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index 2986884..e90d662 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -1026,6 +1026,111 @@ generate_composite_function \
+ 
+ /******************************************************************************/
+ 
++.macro pixman_composite_over_n_8888_8888_ca_process_pixblock_head
++    /*
++     * 'combine_mask_ca' replacement
++     *
++     * input:  solid src (n) in {d8,  d9,  d10, d11}
++     *         dest in          {d4,  d5,  d6,  d7 }
++     *         mask in          {d24, d25, d26, d27}
++     * output: updated src in   {d0,  d1,  d2,  d3 }
++     *         updated mask in  {d24, d25, d26, d3 }
++     */
++    vmull.u8    q0,  d24, d8
++    vmull.u8    q1,  d25, d9
++    vmull.u8    q6,  d26, d10
++    vmull.u8    q7,  d27, d11
++    vmull.u8    q9,  d11, d25
++    vmull.u8    q12, d11, d24
++    vmull.u8    q13, d11, d26
++    vrshr.u16   q8,  q0,  #8
++    vrshr.u16   q10, q1,  #8
++    vrshr.u16   q11, q6,  #8
++    vraddhn.u16 d0,  q0,  q8
++    vraddhn.u16 d1,  q1,  q10
++    vraddhn.u16 d2,  q6,  q11
++    vrshr.u16   q11, q12, #8
++    vrshr.u16   q8,  q9,  #8
++    vrshr.u16   q6,  q13, #8
++    vrshr.u16   q10, q7,  #8
++    vraddhn.u16 d24, q12, q11
++    vraddhn.u16 d25, q9,  q8
++    vraddhn.u16 d26, q13, q6
++    vraddhn.u16 d3,  q7,  q10
++    /*
++     * 'combine_over_ca' replacement
++     *
++     * output: updated dest in {d28, d29, d30, d31}
++     */
++    vmvn.8      d24, d24
++    vmvn.8      d25, d25
++    vmull.u8    q8,  d24, d4
++    vmull.u8    q9,  d25, d5
++    vmvn.8      d26, d26
++    vmvn.8      d27, d3
++    vmull.u8    q10, d26, d6
++    vmull.u8    q11, d27, d7
++.endm
++
++.macro pixman_composite_over_n_8888_8888_ca_process_pixblock_tail
++    /* ... continue 'combine_over_ca' replacement */
++    vrshr.u16   q14, q8,  #8
++    vrshr.u16   q15, q9,  #8
++    vrshr.u16   q6,  q10, #8
++    vrshr.u16   q7,  q11, #8
++    vraddhn.u16 d28, q14, q8
++    vraddhn.u16 d29, q15, q9
++    vraddhn.u16 d30, q6,  q10
++    vraddhn.u16 d31, q7,  q11
++    vqadd.u8    q14, q0,  q14
++    vqadd.u8    q15, q1,  q15
++.endm
++
++.macro pixman_composite_over_n_8888_8888_ca_process_pixblock_tail_head
++        vrshr.u16   q14, q8, #8
++        vrshr.u16   q15, q9, #8
++    vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
++        vrshr.u16   q6, q10, #8
++        vrshr.u16   q7, q11, #8
++        vraddhn.u16 d28, q14, q8
++        vraddhn.u16 d29, q15, q9
++        vraddhn.u16 d30, q6, q10
++        vraddhn.u16 d31, q7, q11
++    vld4.8      {d24, d25, d26, d27}, [MASK]!
++        vqadd.u8    q14, q0, q14
++        vqadd.u8    q15, q1, q15
++    cache_preload 8, 8
++    pixman_composite_over_n_8888_8888_ca_process_pixblock_head
++    vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
++.endm
++
++.macro pixman_composite_over_n_8888_8888_ca_init
++    add         DUMMY, sp, #ARGS_STACK_OFFSET
++    vpush       {d8-d15}
++    vld1.32     {d11[0]}, [DUMMY]
++    vdup.8      d8, d11[0]
++    vdup.8      d9, d11[1]
++    vdup.8      d10, d11[2]
++    vdup.8      d11, d11[3]
++.endm
++
++.macro pixman_composite_over_n_8888_8888_ca_cleanup
++    vpop        {d8-d15}
++.endm
++
++generate_composite_function \
++    pixman_composite_over_n_8888_8888_ca_asm_neon, 0, 32, 32, \
++    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    5, /* prefetch distance */ \
++    pixman_composite_over_n_8888_8888_ca_init, \
++    pixman_composite_over_n_8888_8888_ca_cleanup, \
++    pixman_composite_over_n_8888_8888_ca_process_pixblock_head, \
++    pixman_composite_over_n_8888_8888_ca_process_pixblock_tail, \
++    pixman_composite_over_n_8888_8888_ca_process_pixblock_tail_head
++
++/******************************************************************************/
++
+ .macro pixman_composite_add_n_8_8_process_pixblock_head
+     /* expecting source data in {d8, d9, d10, d11} */
+     /* d8 - blue, d9 - green, d10 - red, d11 - alpha */
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 557301e..3f0e18e 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -269,6 +269,7 @@ BIND_SRC_NULL_DST(over_8888_8888, uint32_t, 1, uint32_t, 1)
+ 
+ BIND_N_MASK_DST(over_n_8_0565, uint8_t, 1, uint16_t, 1)
+ BIND_N_MASK_DST(over_n_8_8888, uint8_t, 1, uint32_t, 1)
++BIND_N_MASK_DST(over_n_8888_8888_ca, uint32_t, 1, uint32_t, 1)
+ BIND_N_MASK_DST(add_n_8_8, uint8_t, 1, uint8_t, 1)
+ 
+ BIND_SRC_N_DST(over_8888_n_8888, uint32_t, 1, uint32_t, 1)
+@@ -412,6 +413,10 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
+     PIXMAN_STD_FAST_PATH (OVER, solid,    null,     r5g6b5,   neon_composite_over_n_0565),
+     PIXMAN_STD_FAST_PATH (OVER, solid,    null,     a8r8g8b8, neon_composite_over_n_8888),
+     PIXMAN_STD_FAST_PATH (OVER, solid,    null,     x8r8g8b8, neon_composite_over_n_8888),
++    PIXMAN_STD_FAST_PATH_CA (OVER, solid, a8r8g8b8, a8r8g8b8, neon_composite_over_n_8888_8888_ca),
++    PIXMAN_STD_FAST_PATH_CA (OVER, solid, a8r8g8b8, x8r8g8b8, neon_composite_over_n_8888_8888_ca),
++    PIXMAN_STD_FAST_PATH_CA (OVER, solid, a8b8g8r8, a8b8g8r8, neon_composite_over_n_8888_8888_ca),
++    PIXMAN_STD_FAST_PATH_CA (OVER, solid, a8b8g8r8, x8b8g8r8, neon_composite_over_n_8888_8888_ca),
+     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, solid,    a8r8g8b8, neon_composite_over_8888_n_8888),
+     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, solid,    x8r8g8b8, neon_composite_over_8888_n_8888),
+     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, a8,       a8r8g8b8, neon_composite_over_8888_8_8888),
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/2-composite.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/2-composite.patch
new file mode 100644
index 0000000..84d4d9c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/2-composite.patch
@@ -0,0 +1,102 @@
+From 6e0df74dbfca26f92a18d968e1bf410bae134c8a Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Wed, 24 Feb 2010 00:26:57 +0000
+Subject: ARM: added 'neon_composite_src_x888_8888' fast path
+
+This fast path function improves performance of 'gnome-system-monitor'
+cairo-perf trace.
+
+Benchmark from ARM Cortex-A8 @720MHz
+
+before:
+
+[ # ]  backend                         test   min(s) median(s) stddev. count
+[  0]    image         gnome-system-monitor   68.838   68.899   0.05%    5/6
+
+after:
+
+[ # ]  backend                         test   min(s) median(s) stddev. count
+[  0]    image         gnome-system-monitor   53.336   53.384   0.09%    6/6
+---
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index e90d662..f2643de 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -947,6 +947,44 @@ generate_composite_function \
+ 
+ /******************************************************************************/
+ 
++.macro pixman_composite_src_x888_8888_process_pixblock_head
++    vorr     q0, q0, q2
++    vorr     q1, q1, q2
++.endm
++
++.macro pixman_composite_src_x888_8888_process_pixblock_tail
++.endm
++
++.macro pixman_composite_src_x888_8888_process_pixblock_tail_head
++    vst1.32 {d0, d1, d2, d3}, [DST_W, :128]!
++    vld1.32 {d0, d1, d2, d3}, [SRC]!
++    vorr     q0, q0, q2
++    vorr     q1, q1, q2
++    cache_preload 8, 8
++.endm
++
++.macro pixman_composite_src_x888_8888_init
++    vmov.u8  q2, #0xFF
++    vshl.u32 q2, q2, #24
++.endm
++
++generate_composite_function \
++    pixman_composite_src_x888_8888_asm_neon, 32, 0, 32, \
++    FLAG_DST_WRITEONLY, \
++    8, /* number of pixels, processed in a single block */ \
++    10, /* prefetch distance */ \
++    pixman_composite_src_x888_8888_init, \
++    default_cleanup, \
++    pixman_composite_src_x888_8888_process_pixblock_head, \
++    pixman_composite_src_x888_8888_process_pixblock_tail, \
++    pixman_composite_src_x888_8888_process_pixblock_tail_head, \
++    0, /* dst_w_basereg */ \
++    0, /* dst_r_basereg */ \
++    0, /* src_basereg   */ \
++    0  /* mask_basereg  */
++
++/******************************************************************************/
++
+ .macro pixman_composite_over_n_8_8888_process_pixblock_head
+     /* expecting deinterleaved source data in {d8, d9, d10, d11} */
+     /* d8 - blue, d9 - green, d10 - red, d11 - alpha */
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 3f0e18e..0a7ac31 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -251,6 +251,7 @@ neon_composite_##name (pixman_implementation_t *imp,                    \
+ 
+ 
+ BIND_SRC_NULL_DST(src_8888_8888, uint32_t, 1, uint32_t, 1)
++BIND_SRC_NULL_DST(src_x888_8888, uint32_t, 1, uint32_t, 1)
+ BIND_SRC_NULL_DST(src_0565_0565, uint16_t, 1, uint16_t, 1)
+ BIND_SRC_NULL_DST(src_0888_0888, uint8_t, 3, uint8_t, 3)
+ BIND_SRC_NULL_DST(src_8888_0565, uint32_t, 1, uint16_t, 1)
+@@ -400,6 +401,10 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
+     PIXMAN_STD_FAST_PATH (SRC,  x8r8g8b8, null,     x8r8g8b8, neon_composite_src_8888_8888),
+     PIXMAN_STD_FAST_PATH (SRC,  a8b8g8r8, null,     x8b8g8r8, neon_composite_src_8888_8888),
+     PIXMAN_STD_FAST_PATH (SRC,  x8b8g8r8, null,     x8b8g8r8, neon_composite_src_8888_8888),
++    PIXMAN_STD_FAST_PATH (SRC,  a8r8g8b8, null,     a8r8g8b8, neon_composite_src_8888_8888),
++    PIXMAN_STD_FAST_PATH (SRC,  a8b8g8r8, null,     a8b8g8r8, neon_composite_src_8888_8888),
++    PIXMAN_STD_FAST_PATH (SRC,  x8r8g8b8, null,     a8r8g8b8, neon_composite_src_x888_8888),
++    PIXMAN_STD_FAST_PATH (SRC,  x8b8g8r8, null,     a8b8g8r8, neon_composite_src_x888_8888),
+     PIXMAN_STD_FAST_PATH (SRC,  r8g8b8,   null,     r8g8b8,   neon_composite_src_0888_0888),
+     PIXMAN_STD_FAST_PATH (SRC,  b8g8r8,   null,     x8r8g8b8, neon_composite_src_0888_8888_rev),
+     PIXMAN_STD_FAST_PATH (SRC,  b8g8r8,   null,     r5g6b5,   neon_composite_src_0888_0565_rev),
+@@ -430,6 +435,7 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
+     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, null,     x8r8g8b8, neon_composite_over_8888_8888),
+     PIXMAN_STD_FAST_PATH (OVER, a8b8g8r8, null,     a8b8g8r8, neon_composite_over_8888_8888),
+     PIXMAN_STD_FAST_PATH (OVER, a8b8g8r8, null,     x8b8g8r8, neon_composite_over_8888_8888),
++    PIXMAN_STD_FAST_PATH (OVER, x8r8g8b8, null,     a8r8g8b8, neon_composite_src_x888_8888),
+     PIXMAN_STD_FAST_PATH (ADD,  solid,    a8,       a8,       neon_composite_add_n_8_8),
+     PIXMAN_STD_FAST_PATH (ADD,  a8,       a8,       a8,       neon_composite_add_8_8_8),
+     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, a8r8g8b8, a8r8g8b8, neon_composite_add_8888_8888_8888),
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/3-composite.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/3-composite.patch
new file mode 100644
index 0000000..06e40fe
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.17.8/3-composite.patch
@@ -0,0 +1,108 @@
+From 19fc0c4c8d28796f0fbc2c8f47edc130851ae3a5 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Wed, 24 Feb 2010 02:14:45 +0000
+Subject: ARM: added 'neon_composite_over_reverse_n_8888' fast path
+
+This fast path function improves performance of 'poppler' cairo-perf trace.
+
+Benchmark from ARM Cortex-A8 @720MHz
+
+before:
+
+[ # ]  backend                         test   min(s) median(s) stddev. count
+[  0]    image                      poppler   38.986   39.158   0.23%    6/6
+
+after:
+
+[ # ]  backend                         test   min(s) median(s) stddev. count
+[  0]    image                      poppler   24.981   25.136   0.28%    6/6
+---
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index f2643de..eb8cc4c 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -680,6 +680,61 @@ generate_composite_function \
+ 
+ /******************************************************************************/
+ 
++.macro pixman_composite_over_reverse_n_8888_process_pixblock_tail_head
++        vrshr.u16   q14, q8, #8
++                                    PF add PF_X, PF_X, #8
++                                    PF tst PF_CTL, #0xF
++        vrshr.u16   q15, q9, #8
++        vrshr.u16   q12, q10, #8
++        vrshr.u16   q13, q11, #8
++                                    PF addne PF_X, PF_X, #8
++                                    PF subne PF_CTL, PF_CTL, #1
++        vraddhn.u16 d28, q14, q8
++        vraddhn.u16 d29, q15, q9
++                                    PF cmp PF_X, ORIG_W
++        vraddhn.u16 d30, q12, q10
++        vraddhn.u16 d31, q13, q11
++        vqadd.u8    q14, q0, q14
++        vqadd.u8    q15, q1, q15
++    vld4.8      {d0, d1, d2, d3}, [DST_R, :128]!
++    vmvn.8      d22, d3
++                                    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
++        vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
++                                    PF subge PF_X, PF_X, ORIG_W
++    vmull.u8    q8, d22, d4
++                                    PF subges PF_CTL, PF_CTL, #0x10
++    vmull.u8    q9, d22, d5
++    vmull.u8    q10, d22, d6
++                                    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
++    vmull.u8    q11, d22, d7
++.endm
++
++.macro pixman_composite_over_reverse_n_8888_init
++    add         DUMMY, sp, #ARGS_STACK_OFFSET
++    vld1.32     {d7[0]}, [DUMMY]
++    vdup.8      d4, d7[0]
++    vdup.8      d5, d7[1]
++    vdup.8      d6, d7[2]
++    vdup.8      d7, d7[3]
++.endm
++
++generate_composite_function \
++    pixman_composite_over_reverse_n_8888_asm_neon, 0, 0, 32, \
++    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    5, /* prefetch distance */ \
++    pixman_composite_over_reverse_n_8888_init, \
++    default_cleanup, \
++    pixman_composite_over_8888_8888_process_pixblock_head, \
++    pixman_composite_over_8888_8888_process_pixblock_tail, \
++    pixman_composite_over_reverse_n_8888_process_pixblock_tail_head, \
++    28, /* dst_w_basereg */ \
++    0,  /* dst_r_basereg */ \
++    4,  /* src_basereg   */ \
++    24  /* mask_basereg  */
++
++/******************************************************************************/
++
+ .macro pixman_composite_over_n_8_0565_process_pixblock_head
+     /* in */
+     vmull.u8    q0, d24, d8
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 0a7ac31..30c5056 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -264,6 +264,7 @@ BIND_SRC_NULL_DST(add_8888_8888, uint32_t, 1, uint32_t, 1)
+ 
+ BIND_N_NULL_DST(over_n_0565, uint16_t, 1)
+ BIND_N_NULL_DST(over_n_8888, uint32_t, 1)
++BIND_N_NULL_DST(over_reverse_n_8888, uint32_t, 1)
+ 
+ BIND_SRC_NULL_DST(over_8888_0565, uint32_t, 1, uint16_t, 1)
+ BIND_SRC_NULL_DST(over_8888_8888, uint32_t, 1, uint32_t, 1)
+@@ -442,6 +443,8 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
+     PIXMAN_STD_FAST_PATH (ADD,  a8,       null,     a8,       neon_composite_add_8000_8000),
+     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, null,     a8r8g8b8, neon_composite_add_8888_8888),
+     PIXMAN_STD_FAST_PATH (ADD,  a8b8g8r8, null,     a8b8g8r8, neon_composite_add_8888_8888),
++    PIXMAN_STD_FAST_PATH (OVER_REVERSE, solid, null, a8r8g8b8, neon_composite_over_reverse_n_8888),
++    PIXMAN_STD_FAST_PATH (OVER_REVERSE, solid, null, a8b8g8r8, neon_composite_over_reverse_n_8888),
+ 
+     { PIXMAN_OP_NONE },
+ };
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
new file mode 100644
index 0000000..06b07a3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
@@ -0,0 +1,114 @@
+From 5234e3c2c161ed5fc92caa336ae78f89112c7d77 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Tue, 16 Mar 2010 16:55:28 +0100
+Subject: [PATCH 1/5] Generic C implementation of pixman_blt with overlapping support
+
+Uses memcpy/memmove functions to copy pixels, can handle the
+case when both source and destination areas are in the same
+image (this is useful for scrolling).
+
+It is assumed that copying direction is only important when
+using the same image for both source and destination (and
+src_stride == dst_stride). Copying direction is undefined
+for the images with different source and destination stride
+which happen to be in the overlapped areas (but this is an
+unrealistic case anyway).
+---
+ pixman/pixman-general.c |   21 ++++++++++++++++++---
+ pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
+index bddf79a..f525744 100644
+--- a/pixman/pixman-general.c
++++ b/pixman/pixman-general.c
+@@ -285,9 +285,24 @@ general_blt (pixman_implementation_t *imp,
+              int                      width,
+              int                      height)
+ {
+-    /* We can't blit unless we have sse2 or mmx */
+-
+-    return FALSE;
++    uint8_t *dst_bytes = (uint8_t *)dst_bits;
++    uint8_t *src_bytes = (uint8_t *)src_bits;
++    int bpp;
++
++    if (src_bpp != dst_bpp || src_bpp & 7)
++	return FALSE;
++
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
++                       dst_bytes + dst_y * dst_stride + dst_x * bpp,
++                       src_stride,
++                       dst_stride,
++                       width,
++                       height);
++    return TRUE;
+ }
+ 
+ static pixman_bool_t
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index d5767af..eeb677d 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -10,6 +10,7 @@
+ 
+ #include "pixman.h"
+ #include <time.h>
++#include <string.h>
+ #include <assert.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -867,4 +868,46 @@ void pixman_timer_register (pixman_timer_t *timer);
+ 
+ #endif /* PIXMAN_TIMERS */
+ 
++/* a helper function, can blit 8-bit images with src/dst overlapping support */
++static inline void
++pixman_blt_helper (uint8_t *src_bytes,
++                   uint8_t *dst_bytes,
++                   int      src_stride,
++                   int      dst_stride,
++                   int      width,
++                   int      height)
++{
++    /*
++     * The second part of this check is not strictly needed, but it prevents
++     * unnecessary upside-down processing of areas which belong to different
++     * images. Upside-down processing can be slower with fixed-distance-ahead
++     * prefetch and perceived as having more tearing.
++     */
++    if (src_bytes < dst_bytes + width &&
++	src_bytes + src_stride * height > dst_bytes)
++    {
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++	/* Horizontal scrolling to the left needs memmove */
++	if (src_bytes + width > dst_bytes)
++	{
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return;
++	}
++    }
++    while (--height >= 0)
++    {
++	memcpy (dst_bytes, src_bytes, width);
++	dst_bytes += dst_stride;
++	src_bytes += src_stride;
++    }
++}
++
+ #endif /* PIXMAN_PRIVATE_H */
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
new file mode 100644
index 0000000..bf6e58c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
@@ -0,0 +1,91 @@
+From f607cd0250d398077b0c51201258775e372cb3c3 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:47 +0300
+Subject: [PATCH 2/5] Support of overlapping src/dst for pixman_blt_mmx
+
+---
+ pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
+index e084e7f..6212b31 100644
+--- a/pixman/pixman-mmx.c
++++ b/pixman/pixman-mmx.c
+@@ -2994,34 +2994,43 @@ pixman_blt_mmx (uint32_t *src_bits,
+ {
+     uint8_t *   src_bytes;
+     uint8_t *   dst_bytes;
+-    int byte_width;
++    int         bpp;
+ 
+-    if (src_bpp != dst_bpp)
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
+-    if (src_bpp == 16)
+-    {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
+-	src_bytes = (uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 2 * width;
+-	src_stride *= 2;
+-	dst_stride *= 2;
+-    }
+-    else if (src_bpp == 32)
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
+     {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
+-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 4 * width;
+-	src_stride *= 4;
+-	dst_stride *= 4;
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
+     }
+-    else
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
+     {
+-	return FALSE;
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using MMX */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
+     }
+ 
+     while (height--)
+@@ -3031,7 +3040,7 @@ pixman_blt_mmx (uint32_t *src_bits,
+ 	uint8_t *d = dst_bytes;
+ 	src_bytes += src_stride;
+ 	dst_bytes += dst_stride;
+-	w = byte_width;
++	w = width;
+ 
+ 	while (w >= 2 && ((unsigned long)d & 3))
+ 	{
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
new file mode 100644
index 0000000..c1f3b2e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
@@ -0,0 +1,91 @@
+From 45a9a537f94a7feab47bd82171c7d620f0d34e3f Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:54 +0300
+Subject: [PATCH 3/5] Support of overlapping src/dst for pixman_blt_sse2
+
+---
+ pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
+index 946e7ba..66053ae 100644
+--- a/pixman/pixman-sse2.c
++++ b/pixman/pixman-sse2.c
+@@ -5299,34 +5299,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
+ {
+     uint8_t *   src_bytes;
+     uint8_t *   dst_bytes;
+-    int byte_width;
++    int         bpp;
+ 
+-    if (src_bpp != dst_bpp)
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
+-    if (src_bpp == 16)
+-    {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
+-	src_bytes =(uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 2 * width;
+-	src_stride *= 2;
+-	dst_stride *= 2;
+-    }
+-    else if (src_bpp == 32)
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
+     {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
+-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 4 * width;
+-	src_stride *= 4;
+-	dst_stride *= 4;
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
+     }
+-    else
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
+     {
+-	return FALSE;
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using SSE2 */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
+     }
+ 
+     cache_prefetch ((__m128i*)src_bytes);
+@@ -5339,7 +5348,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
+ 	uint8_t *d = dst_bytes;
+ 	src_bytes += src_stride;
+ 	dst_bytes += dst_stride;
+-	w = byte_width;
++	w = width;
+ 
+ 	cache_prefetch_next ((__m128i*)s);
+ 	cache_prefetch_next ((__m128i*)d);
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
new file mode 100644
index 0000000..c37673e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
@@ -0,0 +1,94 @@
+From 4cf5bfc72a724fb653c48338b93e91dccea238af Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Wed, 18 Nov 2009 06:08:48 +0200
+Subject: [PATCH 4/5] Support of overlapping src/dst for pixman_blt_neon
+
+---
+ pixman/pixman-arm-neon.c |   62 +++++++++++++++++++++++++++++++++++++--------
+ 1 files changed, 51 insertions(+), 11 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 6808b36..7feee1d 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -168,26 +168,66 @@ pixman_blt_neon (uint32_t *src_bits,
+                  int       width,
+                  int       height)
+ {
+-    if (src_bpp != dst_bpp)
++    uint8_t *   src_bytes;
++    uint8_t *   dst_bytes;
++    int         bpp;
++
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
++    {
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
++    }
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
++    {
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using NEON */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
++    }
++
+     switch (src_bpp)
+     {
+     case 16:
+ 	pixman_composite_src_0565_0565_asm_neon (
+-		width, height,
+-		(uint16_t *)(((char *) dst_bits) +
+-		dst_y * dst_stride * 4 + dst_x * 2), dst_stride * 2,
+-		(uint16_t *)(((char *) src_bits) +
+-		src_y * src_stride * 4 + src_x * 2), src_stride * 2);
++		width >> 1,
++		height,
++		(uint16_t *) dst_bytes,
++		dst_stride >> 1,
++		(uint16_t *) src_bytes,
++		src_stride >> 1);
+ 	return TRUE;
+     case 32:
+ 	pixman_composite_src_8888_8888_asm_neon (
+-		width, height,
+-		(uint32_t *)(((char *) dst_bits) +
+-		dst_y * dst_stride * 4 + dst_x * 4), dst_stride,
+-		(uint32_t *)(((char *) src_bits) +
+-		src_y * src_stride * 4 + src_x * 4), src_stride);
++		width >> 2,
++		height,
++		(uint32_t *) dst_bytes,
++		dst_stride >> 2,
++		(uint32_t *) src_bytes,
++		src_stride >> 2);
+ 	return TRUE;
+     default:
+ 	return FALSE;
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
new file mode 100644
index 0000000..d776574
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
@@ -0,0 +1,169 @@
+From d1410558827fce8aac354274a7150fa915881c50 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 10 Dec 2009 00:51:50 +0200
+Subject: [PATCH 5/5] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
+
+---
+ pixman/pixman-access.c       |   23 ++++++++++++++++++++++-
+ pixman/pixman-arm-neon-asm.S |   20 ++++++++++++++++++++
+ pixman/pixman-arm-neon.c     |   41 +++++++++++++++++++++++++++++++++++++++++
+ pixman/pixman-private.h      |    5 +++++
+ 4 files changed, 88 insertions(+), 1 deletions(-)
+
+diff --git a/pixman/pixman-access.c b/pixman/pixman-access.c
+index fa0a267..5bb3e09 100644
+--- a/pixman/pixman-access.c
++++ b/pixman/pixman-access.c
+@@ -2748,7 +2748,7 @@ typedef struct
+ 	    store_scanline_ ## format, store_scanline_generic_64	\
+     }
+ 
+-static const format_info_t accessors[] =
++static format_info_t accessors[] =
+ {
+ /* 32 bpp formats */
+     FORMAT_INFO (a8r8g8b8),
+@@ -2891,6 +2891,27 @@ _pixman_bits_image_setup_raw_accessors (bits_image_t *image)
+ 	setup_accessors (image);
+ }
+ 
++void
++_pixman_bits_override_accessors (pixman_format_code_t format,
++                                 fetch_scanline_t     fetch_func,
++                                 store_scanline_t     store_func)
++{
++    format_info_t *info = accessors;
++
++    while (info->format != PIXMAN_null)
++    {
++	if (info->format == format)
++	{
++	    if (fetch_func)
++		info->fetch_scanline_raw_32 = fetch_func;
++	    if (store_func)
++		info->store_scanline_raw_32 = store_func;
++	    return;
++	}
++	info++;
++    }
++}
++
+ #else
+ 
+ void
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index 51bc347..f30869e 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -458,6 +458,16 @@ generate_composite_function \
+     pixman_composite_src_8888_0565_process_pixblock_tail, \
+     pixman_composite_src_8888_0565_process_pixblock_tail_head
+ 
++generate_composite_function_single_scanline \
++    pixman_store_scanline_r5g6b5_asm_neon, 32, 0, 16, \
++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    default_init, \
++    default_cleanup, \
++    pixman_composite_src_8888_0565_process_pixblock_head, \
++    pixman_composite_src_8888_0565_process_pixblock_tail, \
++    pixman_composite_src_8888_0565_process_pixblock_tail_head
++
+ /******************************************************************************/
+ 
+ .macro pixman_composite_src_0565_8888_process_pixblock_head
+@@ -493,6 +503,16 @@ generate_composite_function \
+     pixman_composite_src_0565_8888_process_pixblock_tail, \
+     pixman_composite_src_0565_8888_process_pixblock_tail_head
+ 
++generate_composite_function_single_scanline \
++    pixman_fetch_scanline_r5g6b5_asm_neon, 16, 0, 32, \
++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    default_init, \
++    default_cleanup, \
++    pixman_composite_src_0565_8888_process_pixblock_head, \
++    pixman_composite_src_0565_8888_process_pixblock_tail, \
++    pixman_composite_src_0565_8888_process_pixblock_tail_head
++
+ /******************************************************************************/
+ 
+ .macro pixman_composite_add_8000_8000_process_pixblock_head
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 7feee1d..fda7a09 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -375,6 +375,43 @@ neon_combine_##name##_u (pixman_implementation_t *imp,                   \
+ BIND_COMBINE_U (over)
+ BIND_COMBINE_U (add)
+ 
++void
++pixman_fetch_scanline_r5g6b5_asm_neon (int             width,
++                                       uint32_t       *buffer,
++                                       const uint16_t *pixel);
++void
++pixman_store_scanline_r5g6b5_asm_neon (int             width,
++                                       uint16_t       *pixel,
++                                       const uint32_t *values);
++
++static void
++neon_fetch_scanline_r5g6b5 (pixman_image_t *image,
++                            int             x,
++                            int             y,
++                            int             width,
++                            uint32_t *      buffer,
++                            const uint32_t *mask,
++                            uint32_t        mask_bits)
++{
++    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
++    const uint16_t *pixel = (const uint16_t *)bits + x;
++
++    pixman_fetch_scanline_r5g6b5_asm_neon (width, buffer, pixel);
++}
++
++static void
++neon_store_scanline_r5g6b5 (bits_image_t *  image,
++                            int             x,
++                            int             y,
++                            int             width,
++                            const uint32_t *values)
++{
++    uint32_t *bits = image->bits + image->rowstride * y;
++    uint16_t *pixel = ((uint16_t *) bits) + x;
++
++    pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
++}
++
+ pixman_implementation_t *
+ _pixman_implementation_create_arm_neon (void)
+ {
+@@ -385,6 +422,10 @@ _pixman_implementation_create_arm_neon (void)
+     imp->combine_32[PIXMAN_OP_OVER] = neon_combine_over_u;
+     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
+ 
++    _pixman_bits_override_accessors (PIXMAN_r5g6b5,
++                                     neon_fetch_scanline_r5g6b5,
++                                     neon_store_scanline_r5g6b5);
++
+     imp->blt = arm_neon_blt;
+     imp->fill = arm_neon_fill;
+ 
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index eeb677d..ba2d401 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -220,6 +220,11 @@ void
+ _pixman_bits_image_setup_raw_accessors (bits_image_t *image);
+ 
+ void
++_pixman_bits_override_accessors (pixman_format_code_t format,
++                                 fetch_scanline_t     fetch_func,
++                                 store_scanline_t     store_func);
++
++void
+ _pixman_image_get_scanline_generic_64  (pixman_image_t *image,
+                                         int             x,
+                                         int             y,
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/565-scanline.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/565-scanline.patch
new file mode 100644
index 0000000..8461a46
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/565-scanline.patch
@@ -0,0 +1,257 @@
+From deef1daf5896062f47fa61b94e1e77c7c0041820 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Fri, 04 Dec 2009 16:49:19 +0000
+Subject: A copy-paste version of 16bpp bilinear scanline fetcher
+
+---
+diff --git a/pixman/pixman-bits-image.c b/pixman/pixman-bits-image.c
+index 3d78ff0..1656975 100644
+--- a/pixman/pixman-bits-image.c
++++ b/pixman/pixman-bits-image.c
+@@ -535,6 +535,212 @@ bits_image_fetch_bilinear_no_repeat_8888 (pixman_image_t * ima,
+ 	*buffer++ = 0;
+ }
+ 
++static void
++bits_image_fetch_bilinear_no_repeat_0565 (pixman_image_t * ima,
++					  int              offset,
++					  int              line,
++					  int              width,
++					  uint32_t *       buffer,
++					  const uint32_t * mask,
++					  uint32_t         mask_bits)
++{
++    bits_image_t *bits = &ima->bits;
++    pixman_fixed_t x_top, x_bottom, x;
++    pixman_fixed_t ux_top, ux_bottom, ux;
++    pixman_vector_t v;
++    uint32_t top_mask, bottom_mask;
++    uint16_t *top_row;
++    uint16_t *bottom_row;
++    uint32_t *end;
++    uint16_t zero[2] = { 0, 0 };
++    int y, y1, y2;
++    int disty;
++    int mask_inc;
++    int w;
++
++    /* reference point is the center of the pixel */
++    v.vector[0] = pixman_int_to_fixed (offset) + pixman_fixed_1 / 2;
++    v.vector[1] = pixman_int_to_fixed (line) + pixman_fixed_1 / 2;
++    v.vector[2] = pixman_fixed_1;
++
++    if (!pixman_transform_point_3d (bits->common.transform, &v))
++	return;
++
++    ux = ux_top = ux_bottom = bits->common.transform->matrix[0][0];
++    x = x_top = x_bottom = v.vector[0] - pixman_fixed_1/2;
++
++    y = v.vector[1] - pixman_fixed_1/2;
++    disty = (y >> 8) & 0xff;
++
++    /* Load the pointers to the first and second lines from the source
++     * image that bilinear code must read.
++     *
++     * The main trick in this code is about the check if any line are
++     * outside of the image;
++     *
++     * When I realize that a line (any one) is outside, I change
++     * the pointer to a dummy area with zeros. Once I change this, I
++     * must be sure the pointer will not change, so I set the
++     * variables to each pointer increments inside the loop.
++     */
++    y1 = pixman_fixed_to_int (y);
++    y2 = y1 + 1;
++
++    if (y1 < 0 || y1 >= bits->height)
++    {
++	top_row = zero;
++	x_top = 0;
++	ux_top = 0;
++    }
++    else
++    {
++	top_row = bits->bits + y1 * bits->rowstride;
++	x_top = x;
++	ux_top = ux;
++    }
++
++    if (y2 < 0 || y2 >= bits->height)
++    {
++	bottom_row = zero;
++	x_bottom = 0;
++	ux_bottom = 0;
++    }
++    else
++    {
++	bottom_row = bits->bits + y2 * bits->rowstride;
++	x_bottom = x;
++	ux_bottom = ux;
++    }
++
++    /* Instead of checking whether the operation uses the mast in
++     * each loop iteration, verify this only once and prepare the
++     * variables to make the code smaller inside the loop.
++     */
++    if (!mask)
++    {
++        mask_inc = 0;
++        mask_bits = 1;
++        mask = &mask_bits;
++    }
++    else
++    {
++        /* If have a mask, prepare the variables to check it */
++        mask_inc = 1;
++    }
++
++    /* If both are zero, then the whole thing is zero */
++    if (top_row == zero && bottom_row == zero)
++    {
++	memset (buffer, 0, width * sizeof (uint32_t));
++	return;
++    }
++    else
++    {
++	if (top_row == zero)
++	{
++	    top_mask = 0;
++	    bottom_mask = 0xff000000;
++	}
++	else if (bottom_row == zero)
++	{
++	    top_mask = 0xff000000;
++	    bottom_mask = 0;
++	}
++	else
++	{
++	    top_mask = 0xff000000;
++	    bottom_mask = 0xff000000;
++	}
++    }
++
++    end = buffer + width;
++
++    /* Zero fill to the left of the image */
++    while (buffer < end && x < pixman_fixed_minus_1)
++    {
++	*buffer++ = 0;
++	x += ux;
++	x_top += ux_top;
++	x_bottom += ux_bottom;
++	mask += mask_inc;
++    }
++
++    /* Left edge
++     */
++    while (buffer < end && x < 0)
++    {
++	uint32_t tr, br;
++	int32_t distx;
++
++	tr = CONVERT_0565_TO_0888 (top_row[pixman_fixed_to_int (x_top) + 1]) | top_mask;
++	br = CONVERT_0565_TO_0888 (bottom_row[pixman_fixed_to_int (x_bottom) + 1]) | bottom_mask;
++
++	distx = (x >> 8) & 0xff;
++
++	*buffer++ = bilinear_interpolation (0, tr, 0, br, distx, disty);
++
++	x += ux;
++	x_top += ux_top;
++	x_bottom += ux_bottom;
++	mask += mask_inc;
++    }
++
++    /* Main part */
++    w = pixman_int_to_fixed (bits->width - 1);
++
++    while (buffer < end  &&  x < w)
++    {
++	if (*mask)
++	{
++	    uint32_t tl, tr, bl, br;
++	    int32_t distx;
++
++	    tl = CONVERT_0565_TO_0888 (top_row [pixman_fixed_to_int (x_top)]) | top_mask;
++	    tr = CONVERT_0565_TO_0888 (top_row [pixman_fixed_to_int (x_top) + 1]) | top_mask;
++	    bl = CONVERT_0565_TO_0888 (bottom_row [pixman_fixed_to_int (x_bottom)]) | bottom_mask;
++	    br = CONVERT_0565_TO_0888 (bottom_row [pixman_fixed_to_int (x_bottom) + 1]) | bottom_mask;
++
++	    distx = (x >> 8) & 0xff;
++
++	    *buffer = bilinear_interpolation (tl, tr, bl, br, distx, disty);
++	}
++
++	buffer++;
++	x += ux;
++	x_top += ux_top;
++	x_bottom += ux_bottom;
++	mask += mask_inc;
++    }
++
++    /* Right Edge */
++    w = pixman_int_to_fixed (bits->width);
++    while (buffer < end  &&  x < w)
++    {
++	if (*mask)
++	{
++	    uint32_t tl, bl;
++	    int32_t distx;
++
++	    tl = CONVERT_0565_TO_0888 (top_row [pixman_fixed_to_int (x_top)]) | top_mask;
++	    bl = CONVERT_0565_TO_0888 (bottom_row [pixman_fixed_to_int (x_bottom)]) | bottom_mask;
++
++	    distx = (x >> 8) & 0xff;
++
++	    *buffer = bilinear_interpolation (tl, 0, bl, 0, distx, disty);
++	}
++
++	buffer++;
++	x += ux;
++	x_top += ux_top;
++	x_bottom += ux_bottom;
++	mask += mask_inc;
++    }
++
++    /* Zero fill to the left of the image */
++    while (buffer < end)
++	*buffer++ = 0;
++}
++
+ static force_inline uint32_t
+ bits_image_fetch_pixel_convolution (bits_image_t   *image,
+ 				    pixman_fixed_t  x,
+@@ -917,14 +1123,26 @@ bits_image_property_changed (pixman_image_t *image)
+ 	     (bits->common.filter == PIXMAN_FILTER_BILINEAR ||
+ 	      bits->common.filter == PIXMAN_FILTER_GOOD	    ||
+ 	      bits->common.filter == PIXMAN_FILTER_BEST)		&&
+-	     bits->common.repeat == PIXMAN_REPEAT_NONE			&&
+-	     (bits->format == PIXMAN_a8r8g8b8	||
+-	      bits->format == PIXMAN_x8r8g8b8))
++	     bits->common.repeat == PIXMAN_REPEAT_NONE)
+     {
+ 	image->common.get_scanline_64 =
+ 	    _pixman_image_get_scanline_generic_64;
+-	image->common.get_scanline_32 =
+-	    bits_image_fetch_bilinear_no_repeat_8888;
++
++	if (bits->format == PIXMAN_a8r8g8b8 || bits->format == PIXMAN_x8r8g8b8)
++	{
++	    image->common.get_scanline_32 =
++		bits_image_fetch_bilinear_no_repeat_8888;
++	}
++	else if (bits->format == PIXMAN_r5g6b5)
++	{
++	    image->common.get_scanline_32 =
++		bits_image_fetch_bilinear_no_repeat_0565;
++	}
++	else
++	{
++	    image->common.get_scanline_32 =
++		bits_image_fetch_transformed;
++	}
+     }
+     else
+     {
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/missing-cache-preload.diff b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/missing-cache-preload.diff
new file mode 100644
index 0000000..475bb35
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.18.0/missing-cache-preload.diff
@@ -0,0 +1,28 @@
+From 4f45c7688e6b767a5f7b7f5cced51b4797a3c288 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Fri, 21 May 2010 13:31:03 +0000
+Subject: ARM: added missing cache preload
+
+---
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index 51bc347..a99555a 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -388,6 +388,7 @@ generate_composite_function \
+     vld1.16     {d4, d5}, [DST_R, :128]!
+     vst1.16     {d28, d29}, [DST_W, :128]!
+     pixman_composite_over_n_0565_process_pixblock_head
++    cache_preload 8, 8
+ .endm
+ 
+ .macro pixman_composite_over_n_0565_init
+@@ -660,6 +661,7 @@ generate_composite_function_single_scanline \
+     vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
+     vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
+     pixman_composite_over_8888_8888_process_pixblock_head
++    cache_preload 8, 8
+ .endm
+ 
+ .macro pixman_composite_over_n_8888_init
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman-0.9.5/dont-copy-unused-bits-to-alpha-channel.patch b/recipes/obsolete/xorg/xorg-lib/pixman-0.9.5/dont-copy-unused-bits-to-alpha-channel.patch
new file mode 100644
index 0000000..05fe829
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman-0.9.5/dont-copy-unused-bits-to-alpha-channel.patch
@@ -0,0 +1,29 @@
+From: Carl Worth <cworth@cworth.org>
+
+Don't copy unused bits to an alpha channel
+
+This bug was identified by cairo's rgb24-ignore-alpha test which
+blends RGB24 over ARGB32 and notices that "alpha" values are
+making it from the source to the destination.
+
+Index: a/pixman/pixman-pict.c
+===================================================================
+--- a/pixman/pixman-pict.c b8b7b767b3ed1fc57ba177c38187e1eb3daf4de8
++++ b/pixman/pixman-pict.c c7d73fc532c2da313041906ac0f48dba1b10d3bc
+@@ -1778,7 +1778,6 @@ pixman_image_composite (pixman_op_t     
+ 		    break;
+ 		case PIXMAN_x8r8g8b8:
+ 		    switch (pDst->bits.format) {
+-		    case PIXMAN_a8r8g8b8:
+ 		    case PIXMAN_x8r8g8b8:
+ #ifdef USE_MMX
+ 			if (pixman_have_mmx())
+@@ -1790,7 +1789,6 @@ pixman_image_composite (pixman_op_t     
+ 		    }
+ 		case PIXMAN_x8b8g8r8:
+ 		    switch (pDst->bits.format) {
+-		    case PIXMAN_a8b8g8r8:
+ 		    case PIXMAN_x8b8g8r8:
+ #ifdef USE_MMX
+ 			if (pixman_have_mmx())
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/obsolete/xorg/xorg-lib/pixman/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
new file mode 100644
index 0000000..a2cda24
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
@@ -0,0 +1,114 @@
+From 8ea1a333de202018a862a7b04b94479d3109274b Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Tue, 16 Mar 2010 16:55:28 +0100
+Subject: [PATCH 1/5] Generic C implementation of pixman_blt with overlapping support
+
+Uses memcpy/memmove functions to copy pixels, can handle the
+case when both source and destination areas are in the same
+image (this is useful for scrolling).
+
+It is assumed that copying direction is only important when
+using the same image for both source and destination (and
+src_stride == dst_stride). Copying direction is undefined
+for the images with different source and destination stride
+which happen to be in the overlapped areas (but this is an
+unrealistic case anyway).
+---
+ pixman/pixman-general.c |   21 ++++++++++++++++++---
+ pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
+index bddf79a..f525744 100644
+--- a/pixman/pixman-general.c
++++ b/pixman/pixman-general.c
+@@ -285,9 +285,24 @@ general_blt (pixman_implementation_t *imp,
+              int                      width,
+              int                      height)
+ {
+-    /* We can't blit unless we have sse2 or mmx */
+-
+-    return FALSE;
++    uint8_t *dst_bytes = (uint8_t *)dst_bits;
++    uint8_t *src_bytes = (uint8_t *)src_bits;
++    int bpp;
++
++    if (src_bpp != dst_bpp || src_bpp & 7)
++	return FALSE;
++
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
++                       dst_bytes + dst_y * dst_stride + dst_x * bpp,
++                       src_stride,
++                       dst_stride,
++                       width,
++                       height);
++    return TRUE;
+ }
+ 
+ static pixman_bool_t
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index d5767af..eeb677d 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -10,6 +10,7 @@
+ 
+ #include "pixman.h"
+ #include <time.h>
++#include <string.h>
+ #include <assert.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -867,4 +868,46 @@ void pixman_timer_register (pixman_timer_t *timer);
+ 
+ #endif /* PIXMAN_TIMERS */
+ 
++/* a helper function, can blit 8-bit images with src/dst overlapping support */
++static inline void
++pixman_blt_helper (uint8_t *src_bytes,
++                   uint8_t *dst_bytes,
++                   int      src_stride,
++                   int      dst_stride,
++                   int      width,
++                   int      height)
++{
++    /*
++     * The second part of this check is not strictly needed, but it prevents
++     * unnecessary upside-down processing of areas which belong to different
++     * images. Upside-down processing can be slower with fixed-distance-ahead
++     * prefetch and perceived as having more tearing.
++     */
++    if (src_bytes < dst_bytes + width &&
++	src_bytes + src_stride * height > dst_bytes)
++    {
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++	/* Horizontal scrolling to the left needs memmove */
++	if (src_bytes + width > dst_bytes)
++	{
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return;
++	}
++    }
++    while (--height >= 0)
++    {
++	memcpy (dst_bytes, src_bytes, width);
++	dst_bytes += dst_stride;
++	src_bytes += src_stride;
++    }
++}
++
+ #endif /* PIXMAN_PRIVATE_H */
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/obsolete/xorg/xorg-lib/pixman/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
new file mode 100644
index 0000000..003337f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
@@ -0,0 +1,91 @@
+From 3170d9f5e927681a2516bcec52b317d1d4785e25 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:47 +0300
+Subject: [PATCH 2/5] Support of overlapping src/dst for pixman_blt_mmx
+
+---
+ pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
+index e084e7f..6212b31 100644
+--- a/pixman/pixman-mmx.c
++++ b/pixman/pixman-mmx.c
+@@ -2994,34 +2994,43 @@ pixman_blt_mmx (uint32_t *src_bits,
+ {
+     uint8_t *   src_bytes;
+     uint8_t *   dst_bytes;
+-    int byte_width;
++    int         bpp;
+ 
+-    if (src_bpp != dst_bpp)
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
+-    if (src_bpp == 16)
+-    {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
+-	src_bytes = (uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 2 * width;
+-	src_stride *= 2;
+-	dst_stride *= 2;
+-    }
+-    else if (src_bpp == 32)
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
+     {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
+-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 4 * width;
+-	src_stride *= 4;
+-	dst_stride *= 4;
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
+     }
+-    else
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
+     {
+-	return FALSE;
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using MMX */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
+     }
+ 
+     while (height--)
+@@ -3031,7 +3040,7 @@ pixman_blt_mmx (uint32_t *src_bits,
+ 	uint8_t *d = dst_bytes;
+ 	src_bytes += src_stride;
+ 	dst_bytes += dst_stride;
+-	w = byte_width;
++	w = width;
+ 
+ 	while (w >= 2 && ((unsigned long)d & 3))
+ 	{
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/obsolete/xorg/xorg-lib/pixman/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
new file mode 100644
index 0000000..7e8f34f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
@@ -0,0 +1,91 @@
+From f07cd58c643b490dcb1ef7be2642926cfeca1e69 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:54 +0300
+Subject: [PATCH 3/5] Support of overlapping src/dst for pixman_blt_sse2
+
+---
+ pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
+index 946e7ba..66053ae 100644
+--- a/pixman/pixman-sse2.c
++++ b/pixman/pixman-sse2.c
+@@ -5299,34 +5299,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
+ {
+     uint8_t *   src_bytes;
+     uint8_t *   dst_bytes;
+-    int byte_width;
++    int         bpp;
+ 
+-    if (src_bpp != dst_bpp)
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
+-    if (src_bpp == 16)
+-    {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
+-	src_bytes =(uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 2 * width;
+-	src_stride *= 2;
+-	dst_stride *= 2;
+-    }
+-    else if (src_bpp == 32)
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
+     {
+-	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
+-	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
+-	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
+-	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
+-	byte_width = 4 * width;
+-	src_stride *= 4;
+-	dst_stride *= 4;
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
+     }
+-    else
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
+     {
+-	return FALSE;
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using SSE2 */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
+     }
+ 
+     cache_prefetch ((__m128i*)src_bytes);
+@@ -5339,7 +5348,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
+ 	uint8_t *d = dst_bytes;
+ 	src_bytes += src_stride;
+ 	dst_bytes += dst_stride;
+-	w = byte_width;
++	w = width;
+ 
+ 	cache_prefetch_next ((__m128i*)s);
+ 	cache_prefetch_next ((__m128i*)d);
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/obsolete/xorg/xorg-lib/pixman/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
new file mode 100644
index 0000000..0ba5b84
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
@@ -0,0 +1,94 @@
+From e0542866c466ad512d69292df098d4b880e35e52 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Wed, 18 Nov 2009 06:08:48 +0200
+Subject: [PATCH 4/5] Support of overlapping src/dst for pixman_blt_neon
+
+---
+ pixman/pixman-arm-neon.c |   62 +++++++++++++++++++++++++++++++++++++--------
+ 1 files changed, 51 insertions(+), 11 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 24ceeeb..134493d 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -360,26 +360,66 @@ pixman_blt_neon (uint32_t *src_bits,
+                  int       width,
+                  int       height)
+ {
+-    if (src_bpp != dst_bpp)
++    uint8_t *   src_bytes;
++    uint8_t *   dst_bytes;
++    int         bpp;
++
++    if (src_bpp != dst_bpp || src_bpp & 7)
+ 	return FALSE;
+ 
++    bpp = src_bpp >> 3;
++    width *= bpp;
++    src_stride *= 4;
++    dst_stride *= 4;
++    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
++    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
++
++    if (src_bpp != 16 && src_bpp != 32)
++    {
++	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
++	                   width, height);
++	return TRUE;
++    }
++
++    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
++    {
++	src_bytes += src_stride * height - src_stride;
++	dst_bytes += dst_stride * height - dst_stride;
++	dst_stride = -dst_stride;
++	src_stride = -src_stride;
++
++	if (src_bytes + width > dst_bytes)
++	{
++	    /* TODO: reverse scanline copy using NEON */
++	    while (--height >= 0)
++	    {
++		memmove (dst_bytes, src_bytes, width);
++		dst_bytes += dst_stride;
++		src_bytes += src_stride;
++	    }
++	    return TRUE;
++	}
++    }
++
+     switch (src_bpp)
+     {
+     case 16:
+ 	pixman_composite_src_0565_0565_asm_neon (
+-		width, height,
+-		(uint16_t *)(((char *) dst_bits) +
+-		dst_y * dst_stride * 4 + dst_x * 2), dst_stride * 2,
+-		(uint16_t *)(((char *) src_bits) +
+-		src_y * src_stride * 4 + src_x * 2), src_stride * 2);
++		width >> 1,
++		height,
++		(uint16_t *) dst_bytes,
++		dst_stride >> 1,
++		(uint16_t *) src_bytes,
++		src_stride >> 1);
+ 	return TRUE;
+     case 32:
+ 	pixman_composite_src_8888_8888_asm_neon (
+-		width, height,
+-		(uint32_t *)(((char *) dst_bits) +
+-		dst_y * dst_stride * 4 + dst_x * 4), dst_stride,
+-		(uint32_t *)(((char *) src_bits) +
+-		src_y * src_stride * 4 + src_x * 4), src_stride);
++		width >> 2,
++		height,
++		(uint32_t *) dst_bytes,
++		dst_stride >> 2,
++		(uint32_t *) src_bytes,
++		src_stride >> 2);
+ 	return TRUE;
+     default:
+ 	return FALSE;
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/recipes/obsolete/xorg/xorg-lib/pixman/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
new file mode 100644
index 0000000..769ed2e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
@@ -0,0 +1,169 @@
+From d51b10a2750d99543a0c92ca44802aa7a4d70e54 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 10 Dec 2009 00:51:50 +0200
+Subject: [PATCH 5/5] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
+
+---
+ pixman/pixman-access.c       |   23 ++++++++++++++++++++++-
+ pixman/pixman-arm-neon-asm.S |   20 ++++++++++++++++++++
+ pixman/pixman-arm-neon.c     |   41 +++++++++++++++++++++++++++++++++++++++++
+ pixman/pixman-private.h      |    5 +++++
+ 4 files changed, 88 insertions(+), 1 deletions(-)
+
+diff --git a/pixman/pixman-access.c b/pixman/pixman-access.c
+index fa0a267..5bb3e09 100644
+--- a/pixman/pixman-access.c
++++ b/pixman/pixman-access.c
+@@ -2748,7 +2748,7 @@ typedef struct
+ 	    store_scanline_ ## format, store_scanline_generic_64	\
+     }
+ 
+-static const format_info_t accessors[] =
++static format_info_t accessors[] =
+ {
+ /* 32 bpp formats */
+     FORMAT_INFO (a8r8g8b8),
+@@ -2891,6 +2891,27 @@ _pixman_bits_image_setup_raw_accessors (bits_image_t *image)
+ 	setup_accessors (image);
+ }
+ 
++void
++_pixman_bits_override_accessors (pixman_format_code_t format,
++                                 fetch_scanline_t     fetch_func,
++                                 store_scanline_t     store_func)
++{
++    format_info_t *info = accessors;
++
++    while (info->format != PIXMAN_null)
++    {
++	if (info->format == format)
++	{
++	    if (fetch_func)
++		info->fetch_scanline_raw_32 = fetch_func;
++	    if (store_func)
++		info->store_scanline_raw_32 = store_func;
++	    return;
++	}
++	info++;
++    }
++}
++
+ #else
+ 
+ void
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index eb8cc4c..6ab3301 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -454,6 +454,16 @@ generate_composite_function \
+     pixman_composite_src_8888_0565_process_pixblock_tail, \
+     pixman_composite_src_8888_0565_process_pixblock_tail_head
+ 
++generate_composite_function_single_scanline \
++    pixman_store_scanline_r5g6b5_asm_neon, 32, 0, 16, \
++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    default_init, \
++    default_cleanup, \
++    pixman_composite_src_8888_0565_process_pixblock_head, \
++    pixman_composite_src_8888_0565_process_pixblock_tail, \
++    pixman_composite_src_8888_0565_process_pixblock_tail_head
++
+ /******************************************************************************/
+ 
+ .macro pixman_composite_src_0565_8888_process_pixblock_head
+@@ -489,6 +499,16 @@ generate_composite_function \
+     pixman_composite_src_0565_8888_process_pixblock_tail, \
+     pixman_composite_src_0565_8888_process_pixblock_tail_head
+ 
++generate_composite_function_single_scanline \
++    pixman_fetch_scanline_r5g6b5_asm_neon, 16, 0, 32, \
++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    default_init, \
++    default_cleanup, \
++    pixman_composite_src_0565_8888_process_pixblock_head, \
++    pixman_composite_src_0565_8888_process_pixblock_tail, \
++    pixman_composite_src_0565_8888_process_pixblock_tail_head
++
+ /******************************************************************************/
+ 
+ .macro pixman_composite_add_8000_8000_process_pixblock_head
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 134493d..2245b52 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -567,6 +567,43 @@ neon_combine_##name##_u (pixman_implementation_t *imp,                   \
+ BIND_COMBINE_U (over)
+ BIND_COMBINE_U (add)
+ 
++void
++pixman_fetch_scanline_r5g6b5_asm_neon (int             width,
++                                       uint32_t       *buffer,
++                                       const uint16_t *pixel);
++void
++pixman_store_scanline_r5g6b5_asm_neon (int             width,
++                                       uint16_t       *pixel,
++                                       const uint32_t *values);
++
++static void
++neon_fetch_scanline_r5g6b5 (pixman_image_t *image,
++                            int             x,
++                            int             y,
++                            int             width,
++                            uint32_t *      buffer,
++                            const uint32_t *mask,
++                            uint32_t        mask_bits)
++{
++    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
++    const uint16_t *pixel = (const uint16_t *)bits + x;
++
++    pixman_fetch_scanline_r5g6b5_asm_neon (width, buffer, pixel);
++}
++
++static void
++neon_store_scanline_r5g6b5 (bits_image_t *  image,
++                            int             x,
++                            int             y,
++                            int             width,
++                            const uint32_t *values)
++{
++    uint32_t *bits = image->bits + image->rowstride * y;
++    uint16_t *pixel = ((uint16_t *) bits) + x;
++
++    pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
++}
++
+ pixman_implementation_t *
+ _pixman_implementation_create_arm_neon (void)
+ {
+@@ -577,6 +614,10 @@ _pixman_implementation_create_arm_neon (void)
+     imp->combine_32[PIXMAN_OP_OVER] = neon_combine_over_u;
+     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
+ 
++    _pixman_bits_override_accessors (PIXMAN_r5g6b5,
++                                     neon_fetch_scanline_r5g6b5,
++                                     neon_store_scanline_r5g6b5);
++
+     imp->blt = arm_neon_blt;
+     imp->fill = arm_neon_fill;
+ 
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index eeb677d..ba2d401 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -220,6 +220,11 @@ void
+ _pixman_bits_image_setup_raw_accessors (bits_image_t *image);
+ 
+ void
++_pixman_bits_override_accessors (pixman_format_code_t format,
++                                 fetch_scanline_t     fetch_func,
++                                 store_scanline_t     store_func);
++
++void
+ _pixman_image_get_scanline_generic_64  (pixman_image_t *image,
+                                         int             x,
+                                         int             y,
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch b/recipes/obsolete/xorg/xorg-lib/pixman/0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch
new file mode 100644
index 0000000..3d8d4e8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch
@@ -0,0 +1,53 @@
+From 7f0adaef68c5b0bb1c5eb9f5db5792b71b8b8beb Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 19 Mar 2010 10:44:09 +0100
+Subject: [PATCH 6/6] Revert "ARM: SIMD: Try without any CFLAGS before forcing -mcpu="
+
+This forces -marm that results in runtime SIGILL on thumb userspace
+
+This reverts commit 18f0de452dc7e12e4cb544d761a626d5c6031663.
+---
+ configure.ac |   20 +++++---------------
+ 1 files changed, 5 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fc3ee24..f84a4dc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -363,28 +363,18 @@ AM_CONDITIONAL(USE_VMX, test $have_vmx_intrinsics = yes)
+ 
+ dnl ===========================================================================
+ dnl Check for ARM SIMD instructions
+-ARM_SIMD_CFLAGS=""
++ARM_SIMD_CFLAGS="-mcpu=arm1136j-s"
+ 
+ have_arm_simd=no
+ AC_MSG_CHECKING(whether to use ARM SIMD assembler)
+-# check with default CFLAGS in case the toolchain turns on a sufficiently recent -mcpu=
++xserver_save_CFLAGS=$CFLAGS
++CFLAGS="$ARM_SIMD_CFLAGS $CFLAGS"
+ AC_COMPILE_IFELSE([
+ int main () {
+     asm("uqadd8 r1, r1, r2");
+     return 0;
+-}], have_arm_simd=yes,
+-    # check again with an explicit -mcpu= in case the toolchain defaults to an
+-    # older one; note that uqadd8 isn't available in Thumb mode on arm1136j-s
+-    # so we force ARM mode
+-    ARM_SIMD_CFLAGS="-mcpu=arm1136j-s -marm"
+-    xserver_save_CFLAGS=$CFLAGS
+-    CFLAGS="$ARM_SIMD_CFLAGS $CFLAGS"
+-    AC_COMPILE_IFELSE([
+-    int main () {
+-        asm("uqadd8 r1, r1, r2");
+-        return 0;
+-    }], have_arm_simd=yes)
+-    CFLAGS=$xserver_save_CFLAGS)
++}], have_arm_simd=yes)
++CFLAGS=$xserver_save_CFLAGS
+ 
+ AC_ARG_ENABLE(arm-simd,
+    [AC_HELP_STRING([--disable-arm-simd],
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/calloc.patch b/recipes/obsolete/xorg/xorg-lib/pixman/calloc.patch
new file mode 100644
index 0000000..4a60d7e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/calloc.patch
@@ -0,0 +1,23 @@
+From 634ba33b5b1fcfd5a0e7910f9991b4ed4f674549 Mon Sep 17 00:00:00 2001
+From: Søren Sandmann Pedersen <ssp@redhat.com>
+Date: Wed, 07 Apr 2010 05:39:14 +0000
+Subject: Fix uninitialized cache when pthreads are used
+
+The thread local cache is allocated with malloc(), but we rely on it
+being initialized to zero, so allocate it with calloc() instead.
+---
+diff --git a/pixman/pixman-compiler.h b/pixman/pixman-compiler.h
+index a4e3f88..cdac0d8 100644
+--- a/pixman/pixman-compiler.h
++++ b/pixman/pixman-compiler.h
+@@ -101,7 +101,7 @@
+     static type *							\
+     tls_ ## name ## _alloc (key)					\
+     {									\
+-	type *value = malloc (sizeof (type));				\
++	type *value = calloc (1, sizeof (type));			\
+ 	if (value)							\
+ 	    pthread_setspecific (key, value);				\
+ 	return value;							\
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/nearest-neighbour.patch b/recipes/obsolete/xorg/xorg-lib/pixman/nearest-neighbour.patch
new file mode 100644
index 0000000..29b140f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/nearest-neighbour.patch
@@ -0,0 +1,1040 @@
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Fri, 17 Jul 2009 10:22:23 +0000 (+0300)
+Subject: Fastpath for nearest neighbour scaled compositing operations.
+X-Git-Url: http://siarhei.siamashka.name/gitweb/?p=pixman.git;a=commitdiff_plain;h=247531c6978725a88fd3706129b9d3e339026f54
+
+Fastpath for nearest neighbour scaled compositing operations.
+
+OVER 8888x8888, OVER 8888x0565, SRC 8888x8888, SRC 8888x0565
+and SRC 0565x0565 cases are supported.
+---
+
+diff --git a/pixman/pixman-fast-path.c b/pixman/pixman-fast-path.c
+index 7f80578..7f3a6ad 100644
+--- a/pixman/pixman-fast-path.c
++++ b/pixman/pixman-fast-path.c
+@@ -1261,6 +1261,993 @@ fast_composite_src_scale_nearest (pixman_implementation_t *imp,
+     }
+ }
+ 
++/*
++ * Functions, which implement the core inner loops for the nearest neighbour
++ * scaled fastpath compositing operations. The do not need to do clipping
++ * checks, also the loops are unrolled to process two pixels per iteration
++ * for better performance on most CPU architectures (superscalar processors
++ * can issue several operations simultaneously, other processors can hide
++ * instructions latencies by pipelining operations). Unrolling more
++ * does not make much sense because the compiler will start running out
++ * of spare registers soon.
++ */
++
++#undef READ
++#undef WRITE
++#define READ(img,x) (*(x))
++#define WRITE(img,ptr,v) ((*(ptr)) = (v))
++
++#define UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(x, a, y) do {                     \
++        UN8x4_MUL_UN8_ADD_UN8x4(x, a, y);                                      \
++        x = CONVERT_8888_TO_0565(x);                                       \
++    } while (0)
++
++static void fbCompositeTransformNearestNonrotatedAffineTrivialclipOver_8888x0565 (
++    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
++    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
++{
++    uint16_t *dstLine;
++    uint32_t *srcFirstLine;
++    uint32_t  d;
++    uint32_t  s1, s2;
++    uint8_t   a1, a2;
++    int       w;
++    int       x1, x2, y;
++    int32_t   orig_vx = vx;
++
++    uint32_t *src;
++    uint16_t *dst;
++    int       srcStride, dstStride;
++    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
++    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
++     * transformed from destination space to source space */
++    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
++
++    while (--height >= 0)
++    {
++        dst = dstLine;
++        dstLine += dstStride;
++
++        y = vy >> 16;
++        vy += unit_y;
++
++        if ((y < 0) || (y >= pSrc->bits.height)) {
++            continue;
++        }
++
++        src = srcFirstLine + srcStride * y;
++
++        w = width;
++        vx = orig_vx;
++        while ((w -= 2) >= 0)
++        {
++            x1 = vx >> 16;
++            vx += unit_x;
++            s1 = READ(pSrc, src + x1);
++
++            x2 = vx >> 16;
++            vx += unit_x;
++            s2 = READ(pSrc, src + x2);
++
++            a1 = s1 >> 24;
++            a2 = s2 >> 24;
++
++            if (a1 == 0xff)
++                WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
++            else if (s1) {
++                d = CONVERT_0565_TO_0888(READ(pDst, dst));
++                a1 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a1, s1);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++
++            if (a2 == 0xff)
++                WRITE(pDst, dst, CONVERT_8888_TO_0565(s2));
++            else if (s2) {
++                d = CONVERT_0565_TO_0888(READ(pDst, dst));
++                a2 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a2, s2);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++        }
++        if (w & 1) {
++            x1 = vx >> 16;
++            vx += unit_x;
++            s1 = READ(pSrc, src + x1);
++
++            a1 = s1 >> 24;
++            if (a1 == 0xff)
++                WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
++            else if (s1) {
++                d = CONVERT_0565_TO_0888(READ(pDst, dst));
++                a1 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a1, s1);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++        }
++    }
++}
++
++static void fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatOver_8888x0565 (
++    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
++    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
++{
++    uint16_t *dstLine;
++    uint32_t *srcFirstLine;
++    uint32_t  d;
++    uint32_t  s1, s2;
++    uint8_t   a1, a2;
++    int       w;
++    int       x1, x2, y;
++    int32_t   orig_vx = vx;
++    int32_t   max_vx, max_vy;
++
++    uint32_t *src;
++    uint16_t *dst;
++    int       srcStride, dstStride;
++    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
++    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
++     * transformed from destination space to source space */
++    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
++
++    max_vx = pSrc->bits.width << 16;
++    max_vy = pSrc->bits.height << 16;
++
++    while (orig_vx < 0) orig_vx += max_vx;
++    while (vy < 0) vy += max_vy;
++    while (orig_vx >= max_vx) orig_vx -= max_vx;
++    while (vy >= max_vy) vy -= max_vy;
++
++    while (--height >= 0)
++    {
++        dst = dstLine;
++        dstLine += dstStride;
++
++        y = vy >> 16;
++        vy += unit_y;
++        while (vy >= max_vy) vy -= max_vy;
++
++        src = srcFirstLine + srcStride * y;
++
++        w = width;
++        vx = orig_vx;
++        while ((w -= 2) >= 0)
++        {
++            x1 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s1 = READ(pSrc, src + x1);
++
++            x2 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s2 = READ(pSrc, src + x2);
++
++            a1 = s1 >> 24;
++            a2 = s2 >> 24;
++
++            if (a1 == 0xff)
++                WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
++            else if (s1) {
++                d = CONVERT_0565_TO_0888(READ(pDst, dst));
++                a1 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a1, s1);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++
++            if (a2 == 0xff)
++                WRITE(pDst, dst, CONVERT_8888_TO_0565(s2));
++            else if (s2) {
++                d = CONVERT_0565_TO_0888(READ(pDst, dst));
++                a2 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a2, s2);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++        }
++        if (w & 1) {
++            x1 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s1 = READ(pSrc, src + x1);
++
++            a1 = s1 >> 24;
++            if (a1 == 0xff)
++                WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
++            else if (s1) {
++                d = CONVERT_0565_TO_0888(READ(pDst, dst));
++                a1 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a1, s1);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++        }
++    }
++}
++
++static void fbCompositeTransformNearestNonrotatedAffineTrivialclipOver_8888x8888 (
++    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
++    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
++{
++    uint32_t *dstLine;
++    uint32_t *srcFirstLine;
++    uint32_t  d;
++    uint32_t  s1, s2;
++    uint8_t   a1, a2;
++    int       w;
++    int       x1, x2, y;
++    int32_t   orig_vx = vx;
++
++    uint32_t *src, *dst;
++    int       srcStride, dstStride;
++    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
++    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
++     * transformed from destination space to source space */
++    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
++
++    while (--height >= 0)
++    {
++        dst = dstLine;
++        dstLine += dstStride;
++
++        y = vy >> 16;
++        vy += unit_y;
++
++        if ((y < 0) || (y >= pSrc->bits.height)) {
++            continue;
++        }
++
++        src = srcFirstLine + srcStride * y;
++
++        w = width;
++        vx = orig_vx;
++        while ((w -= 2) >= 0)
++        {
++            x1 = vx >> 16;
++            vx += unit_x;
++            s1 = READ(pSrc, src + x1);
++
++            x2 = vx >> 16;
++            vx += unit_x;
++            s2 = READ(pSrc, src + x2);
++
++            a1 = s1 >> 24;
++            a2 = s2 >> 24;
++
++            if (a1 == 0xff)
++                WRITE(pDst, dst, s1);
++            else if (s1) {
++                d = READ(pDst, dst);
++                a1 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4(d, a1, s1);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++
++            if (a2 == 0xff)
++                WRITE(pDst, dst, s2);
++            else if (s2) {
++                d = READ(pDst, dst);
++                a2 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4(d, a2, s2);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++        }
++        if (w & 1) {
++            x1 = vx >> 16;
++            vx += unit_x;
++            s1 = READ(pSrc, src + x1);
++
++            a1 = s1 >> 24;
++            if (a1 == 0xff)
++                WRITE(pDst, dst, s1);
++            else if (s1) {
++                d = READ(pDst, dst);
++                a1 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4(d, a1, s1);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++        }
++    }
++}
++
++static void fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatOver_8888x8888 (
++    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
++    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
++{
++    uint32_t *dstLine;
++    uint32_t *srcFirstLine;
++    uint32_t  d;
++    uint32_t  s1, s2;
++    uint8_t   a1, a2;
++    int       w;
++    int       x1, x2, y;
++    int32_t   orig_vx = vx;
++    int32_t   max_vx, max_vy;
++
++    uint32_t *src, *dst;
++    int       srcStride, dstStride;
++    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
++    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
++     * transformed from destination space to source space */
++    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
++
++    max_vx = pSrc->bits.width << 16;
++    max_vy = pSrc->bits.height << 16;
++
++    while (orig_vx < 0) orig_vx += max_vx;
++    while (vy < 0) vy += max_vy;
++    while (orig_vx >= max_vx) orig_vx -= max_vx;
++    while (vy >= max_vy) vy -= max_vy;
++
++    while (--height >= 0)
++    {
++        dst = dstLine;
++        dstLine += dstStride;
++
++        y = vy >> 16;
++        vy += unit_y;
++        while (vy >= max_vy) vy -= max_vy;
++
++        src = srcFirstLine + srcStride * y;
++
++        w = width;
++        vx = orig_vx;
++        while ((w -= 2) >= 0)
++        {
++            x1 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s1 = READ(pSrc, src + x1);
++
++            x2 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s2 = READ(pSrc, src + x2);
++
++            a1 = s1 >> 24;
++            a2 = s2 >> 24;
++
++            if (a1 == 0xff)
++                WRITE(pDst, dst, s1);
++            else if (s1) {
++                d = READ(pDst, dst);
++                a1 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4(d, a1, s1);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++
++            if (a2 == 0xff)
++                WRITE(pDst, dst, s2);
++            else if (s2) {
++                d = READ(pDst, dst);
++                a2 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4(d, a2, s2);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++        }
++        if (w & 1) {
++            x1 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s1 = READ(pSrc, src + x1);
++
++            a1 = s1 >> 24;
++            if (a1 == 0xff)
++                WRITE(pDst, dst, s1);
++            else if (s1) {
++                d = READ(pDst, dst);
++                a1 ^= 0xff;
++                UN8x4_MUL_UN8_ADD_UN8x4(d, a1, s1);
++                WRITE(pDst, dst, d);
++            }
++            dst++;
++        }
++    }
++}
++
++static void fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_8888x8888 (
++    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
++    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
++{
++    uint32_t *dstLine;
++    uint32_t *srcFirstLine;
++    uint32_t  s1, s2;
++    int       w;
++    int       x1, x2, y;
++    int32_t   orig_vx = vx;
++
++    uint32_t *src, *dst;
++    int       srcStride, dstStride;
++    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
++    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
++     * transformed from destination space to source space */
++    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
++
++    while (--height >= 0)
++    {
++        dst = dstLine;
++        dstLine += dstStride;
++
++        y = vy >> 16;
++        vy += unit_y;
++
++        if ((y < 0) || (y >= pSrc->bits.height)) {
++            memset(dst, 0, width * sizeof(*dst));
++            continue;
++        }
++
++        src = srcFirstLine + srcStride * y;
++
++        w = width;
++        vx = orig_vx;
++        while ((w -= 2) >= 0)
++        {
++            x1 = vx >> 16;
++            vx += unit_x;
++            s1 = READ(pSrc, src + x1);
++
++            x2 = vx >> 16;
++            vx += unit_x;
++            s2 = READ(pSrc, src + x2);
++
++            WRITE(pDst, dst, s1);
++            dst++;
++            WRITE(pDst, dst, s2);
++            dst++;
++        }
++        if (w & 1) {
++            x1 = vx >> 16;
++            vx += unit_x;
++            s1 = READ(pSrc, src + x1);
++            WRITE(pDst, dst, s1);
++            dst++;
++        }
++    }
++}
++
++static void fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_8888x8888 (
++    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
++    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
++{
++    uint32_t *dstLine;
++    uint32_t *srcFirstLine;
++    uint32_t  s1, s2;
++    int       w;
++    int       x1, x2, y;
++    int32_t   orig_vx = vx;
++    int32_t   max_vx, max_vy;
++
++    uint32_t *src, *dst;
++    int       srcStride, dstStride;
++    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
++    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
++     * transformed from destination space to source space */
++    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
++
++    max_vx = pSrc->bits.width << 16;
++    max_vy = pSrc->bits.height << 16;
++
++    while (orig_vx < 0) orig_vx += max_vx;
++    while (vy < 0) vy += max_vy;
++    while (orig_vx >= max_vx) orig_vx -= max_vx;
++    while (vy >= max_vy) vy -= max_vy;
++
++    while (--height >= 0)
++    {
++        dst = dstLine;
++        dstLine += dstStride;
++
++        y = vy >> 16;
++        vy += unit_y;
++        while (vy >= max_vy) vy -= max_vy;
++
++        src = srcFirstLine + srcStride * y;
++
++        w = width;
++        vx = orig_vx;
++        while ((w -= 2) >= 0)
++        {
++            x1 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s1 = READ(pSrc, src + x1);
++
++            x2 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s2 = READ(pSrc, src + x2);
++
++            WRITE(pDst, dst, s1);
++            dst++;
++            WRITE(pDst, dst, s2);
++            dst++;
++        }
++        if (w & 1) {
++            x1 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s1 = READ(pSrc, src + x1);
++
++            WRITE(pDst, dst, s1);
++            dst++;
++        }
++    }
++}
++
++static void fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_0565x0565 (
++    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
++    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
++{
++    uint16_t *dstLine;
++    uint16_t *srcFirstLine;
++    uint16_t  s1, s2;
++    int       w;
++    int       x1, x2, y;
++    int32_t   orig_vx = vx;
++
++    uint16_t *src, *dst;
++    int       srcStride, dstStride;
++    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
++    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
++     * transformed from destination space to source space */
++    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint16_t, srcStride, srcFirstLine, 1);
++
++    while (--height >= 0)
++    {
++        dst = dstLine;
++        dstLine += dstStride;
++
++        y = vy >> 16;
++        vy += unit_y;
++
++        if ((y < 0) || (y >= pSrc->bits.height)) {
++            memset(dst, 0, width * sizeof(*dst));
++            continue;
++        }
++
++        src = srcFirstLine + srcStride * y;
++
++        w = width;
++        vx = orig_vx;
++        while ((w -= 2) >= 0)
++        {
++            x1 = vx >> 16;
++            vx += unit_x;
++            s1 = READ(pSrc, src + x1);
++
++            x2 = vx >> 16;
++            vx += unit_x;
++            s2 = READ(pSrc, src + x2);
++
++            WRITE(pDst, dst, s1);
++            dst++;
++            WRITE(pDst, dst, s2);
++            dst++;
++        }
++        if (w & 1) {
++            x1 = vx >> 16;
++            vx += unit_x;
++            s1 = READ(pSrc, src + x1);
++            WRITE(pDst, dst, s1);
++            dst++;
++        }
++    }
++}
++
++static void fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_0565x0565 (
++    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
++    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
++{
++    uint16_t *dstLine;
++    uint16_t *srcFirstLine;
++    uint16_t  s1, s2;
++    int       w;
++    int       x1, x2, y;
++    int32_t   orig_vx = vx;
++    int32_t   max_vx, max_vy;
++
++    uint16_t *src, *dst;
++    int       srcStride, dstStride;
++    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
++    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
++     * transformed from destination space to source space */
++    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint16_t, srcStride, srcFirstLine, 1);
++
++    max_vx = pSrc->bits.width << 16;
++    max_vy = pSrc->bits.height << 16;
++
++    while (orig_vx < 0) orig_vx += max_vx;
++    while (vy < 0) vy += max_vy;
++    while (orig_vx >= max_vx) orig_vx -= max_vx;
++    while (vy >= max_vy) vy -= max_vy;
++
++    while (--height >= 0)
++    {
++        dst = dstLine;
++        dstLine += dstStride;
++
++        y = vy >> 16;
++        vy += unit_y;
++        while (vy >= max_vy) vy -= max_vy;
++
++        src = srcFirstLine + srcStride * y;
++
++        w = width;
++        vx = orig_vx;
++        while ((w -= 2) >= 0)
++        {
++            x1 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s1 = READ(pSrc, src + x1);
++
++            x2 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s2 = READ(pSrc, src + x2);
++
++            WRITE(pDst, dst, s1);
++            dst++;
++            WRITE(pDst, dst, s2);
++            dst++;
++        }
++        if (w & 1) {
++            x1 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s1 = READ(pSrc, src + x1);
++
++            WRITE(pDst, dst, s1);
++            dst++;
++        }
++    }
++}
++
++static void fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_8888x0565 (
++    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
++    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
++{
++    uint16_t *dstLine;
++    uint32_t *srcFirstLine;
++    uint32_t  s1, s2;
++    int       w;
++    int       x1, x2, y;
++    int32_t   orig_vx = vx;
++
++    uint32_t *src;
++    uint16_t *dst;
++    int       srcStride, dstStride;
++    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
++    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
++     * transformed from destination space to source space */
++    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
++
++    while (--height >= 0)
++    {
++        dst = dstLine;
++        dstLine += dstStride;
++
++        y = vy >> 16;
++        vy += unit_y;
++
++        if ((y < 0) || (y >= pSrc->bits.height)) {
++            memset(dst, 0, width * sizeof(*dst));
++            continue;
++        }
++
++        src = srcFirstLine + srcStride * y;
++
++        w = width;
++        vx = orig_vx;
++        while ((w -= 2) >= 0)
++        {
++            x1 = vx >> 16;
++            vx += unit_x;
++            s1 = READ(pSrc, src + x1);
++
++            x2 = vx >> 16;
++            vx += unit_x;
++            s2 = READ(pSrc, src + x2);
++
++            WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
++            dst++;
++            WRITE(pDst, dst, CONVERT_8888_TO_0565(s2));
++            dst++;
++        }
++        if (w & 1) {
++            x1 = vx >> 16;
++            vx += unit_x;
++            s1 = READ(pSrc, src + x1);
++            WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
++            dst++;
++        }
++    }
++}
++
++static void fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_8888x0565 (
++    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
++    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
++{
++    uint16_t *dstLine;
++    uint32_t *srcFirstLine;
++    uint32_t  s1, s2;
++    int       w;
++    int       x1, x2, y;
++    int32_t   orig_vx = vx;
++    int32_t   max_vx, max_vy;
++
++    uint32_t *src;
++    uint16_t *dst;
++    int       srcStride, dstStride;
++    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
++    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
++     * transformed from destination space to source space */
++    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
++
++    max_vx = pSrc->bits.width << 16;
++    max_vy = pSrc->bits.height << 16;
++
++    while (orig_vx < 0) orig_vx += max_vx;
++    while (vy < 0) vy += max_vy;
++    while (orig_vx >= max_vx) orig_vx -= max_vx;
++    while (vy >= max_vy) vy -= max_vy;
++
++    while (--height >= 0)
++    {
++        dst = dstLine;
++        dstLine += dstStride;
++
++        y = vy >> 16;
++        vy += unit_y;
++        while (vy >= max_vy) vy -= max_vy;
++
++        src = srcFirstLine + srcStride * y;
++
++        w = width;
++        vx = orig_vx;
++        while ((w -= 2) >= 0)
++        {
++            x1 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s1 = READ(pSrc, src + x1);
++
++            x2 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s2 = READ(pSrc, src + x2);
++
++            WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
++            dst++;
++            WRITE(pDst, dst, CONVERT_8888_TO_0565(s2));
++            dst++;
++        }
++        if (w & 1) {
++            x1 = vx >> 16;
++            vx += unit_x;
++            while (vx >= max_vx) vx -= max_vx;
++            s1 = READ(pSrc, src + x1);
++
++            WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
++            dst++;
++        }
++    }
++}
++
++/*
++ * Check if the clipping boundary is crossed on horizontal scaling
++ */
++static inline pixman_bool_t
++fbTransformVerifyHorizontalClipping(pixman_image_t *pict, int width, int32_t vx, int32_t unit_x)
++{
++    while (--width >= 0) {
++        int x = vx >> 16;
++        if ((x < 0) || (x >= pict->bits.width)) return 1;
++        vx += unit_x;
++    }
++    return 0;
++}
++
++/*
++ * Check if the clipping boundary is crossed on vertical scaling
++ */
++static inline pixman_bool_t
++fbTransformVerifyVerticalClipping(pixman_image_t *pict, int height, int32_t vy, int32_t unit_y)
++{
++    while (--height >= 0) {
++        int y = vy >> 16;
++        if ((y < 0) || (y >= pict->bits.height)) return 1;
++        vy += unit_y;
++    }
++    return 0;
++}
++
++/*
++ * Easy case of transform without rotation or complex clipping
++ * Returns 1 in the case if it was able to handle this operation and 0 otherwise
++ */
++static pixman_bool_t
++fbCompositeTransformNonrotatedAffineTrivialclip (
++			    pixman_op_t     op,
++			    pixman_image_t *pSrc,
++			    pixman_image_t *pMask,
++			    pixman_image_t *pDst,
++			    int16_t         xSrc,
++			    int16_t         ySrc,
++			    int16_t         xMask,
++			    int16_t         yMask,
++			    int16_t         xDst,
++			    int16_t         yDst,
++			    uint16_t        width,
++			    uint16_t        height)
++{
++    pixman_vector_t v, unit;
++    int skipdst_x = 0, skipdst_y = 0;
++
++    /* Handle destination clipping */
++    if (xDst < pDst->common.clip_region.extents.x1) {
++        skipdst_x = pDst->common.clip_region.extents.x1 - xDst;
++        if (skipdst_x >= (int)width)
++            return 1;
++        xDst = pDst->common.clip_region.extents.x1;
++        width -= skipdst_x;
++    }
++
++    if (yDst < pDst->common.clip_region.extents.y1) {
++        skipdst_y = pDst->common.clip_region.extents.y1 - yDst;
++        if (skipdst_y >= (int)height)
++            return 1;
++        yDst = pDst->common.clip_region.extents.y1;
++        height -= skipdst_y;
++    }
++
++    if (xDst >= pDst->common.clip_region.extents.x2 ||
++        yDst >= pDst->common.clip_region.extents.y2)
++    {
++        return 1;
++    }
++
++    if (xDst + width > pDst->common.clip_region.extents.x2)
++        width = pDst->common.clip_region.extents.x2 - xDst;
++    if (yDst + height > pDst->common.clip_region.extents.y2)
++        height = pDst->common.clip_region.extents.y2 - yDst;
++
++    /* reference point is the center of the pixel */
++    v.vector[0] = pixman_int_to_fixed(xSrc) + pixman_fixed_1 / 2;
++    v.vector[1] = pixman_int_to_fixed(ySrc) + pixman_fixed_1 / 2;
++    v.vector[2] = pixman_fixed_1;
++
++    if (!pixman_transform_point_3d (pSrc->common.transform, &v))
++        return 0;
++
++    /* Round down to closest integer, ensuring that 0.5 rounds to 0, not 1 */
++    v.vector[0] -= pixman_fixed_e;
++    v.vector[1] -= pixman_fixed_e;
++
++    unit.vector[0] = pSrc->common.transform->matrix[0][0];
++    unit.vector[1] = pSrc->common.transform->matrix[1][1];
++
++    v.vector[0] += unit.vector[0] * skipdst_x;
++    v.vector[1] += unit.vector[1] * skipdst_y;
++
++    /* Check for possible fixed point arithmetics problems/overflows */
++    if (unit.vector[0] <= 0 || unit.vector[1] <= 0)
++        return 0;
++    if (width == 0 || height == 0)
++        return 0;
++    if ((uint32_t)width + (unit.vector[0] >> 16) >= 0x7FFF)
++        return 0;
++    if ((uint32_t)height + (unit.vector[1] >> 16) >= 0x7FFF)
++        return 0;
++
++    /* Horizontal source clipping is only supported for NORMAL repeat */
++    if (pSrc->common.repeat != PIXMAN_REPEAT_NORMAL
++        && fbTransformVerifyHorizontalClipping(pSrc, width, v.vector[0], unit.vector[0])) {
++        return 0;
++    }
++
++    /* Vertical source clipping is only supported for NONE and NORMAL repeat */
++    if (pSrc->common.repeat != PIXMAN_REPEAT_NONE && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL
++        && fbTransformVerifyVerticalClipping(pSrc, height, v.vector[1], unit.vector[1])) {
++        return 0;
++    }
++
++    if (op == PIXMAN_OP_OVER && pSrc->bits.format == PIXMAN_a8r8g8b8
++            && (pDst->bits.format == PIXMAN_x8r8g8b8 || pDst->bits.format == PIXMAN_a8r8g8b8))
++    {
++        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL) {
++            fbCompositeTransformNearestNonrotatedAffineTrivialclipOver_8888x8888(
++                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
++                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
++            return 1;
++        }
++        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat == PIXMAN_REPEAT_NORMAL) {
++            fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatOver_8888x8888(
++                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
++                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
++            return 1;
++        }
++    }
++
++    if (op == PIXMAN_OP_SRC && (pSrc->bits.format == PIXMAN_x8r8g8b8 || pSrc->bits.format == PIXMAN_a8r8g8b8)
++            && (pDst->bits.format == PIXMAN_x8r8g8b8 || pDst->bits.format == pSrc->bits.format))
++    {
++        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL) {
++            fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_8888x8888(
++                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
++                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
++            return 1;
++        }
++        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat == PIXMAN_REPEAT_NORMAL) {
++            fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_8888x8888(
++                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
++                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
++            return 1;
++        }
++    }
++
++    if (op == PIXMAN_OP_OVER && pSrc->bits.format == PIXMAN_a8r8g8b8 && pDst->bits.format == PIXMAN_r5g6b5)
++    {
++        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL) {
++            fbCompositeTransformNearestNonrotatedAffineTrivialclipOver_8888x0565(
++                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
++                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
++            return 1;
++        }
++        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat == PIXMAN_REPEAT_NORMAL) {
++            fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatOver_8888x0565(
++                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
++                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
++            return 1;
++        }
++    }
++
++    if (op == PIXMAN_OP_SRC && pSrc->bits.format == PIXMAN_r5g6b5 && pDst->bits.format == PIXMAN_r5g6b5)
++    {
++        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL) {
++            fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_0565x0565(
++                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
++                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
++            return 1;
++        }
++        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat == PIXMAN_REPEAT_NORMAL) {
++            fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_0565x0565(
++                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
++                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
++            return 1;
++        }
++    }
++
++    if (op == PIXMAN_OP_SRC && (pSrc->bits.format == PIXMAN_x8r8g8b8 || pSrc->bits.format == PIXMAN_a8r8g8b8)
++        && pDst->bits.format == PIXMAN_r5g6b5)
++    {
++        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL) {
++            fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_8888x0565(
++                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
++                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
++            return 1;
++        }
++        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat == PIXMAN_REPEAT_NORMAL) {
++            fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_8888x0565(
++                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
++                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
++            return 1;
++        }
++    }
++
++    /* No fastpath scaling implemented for this case */
++    return 0;
++}
++
+ static void
+ fast_path_composite (pixman_implementation_t *imp,
+                      pixman_op_t              op,
+@@ -1279,6 +2266,30 @@ fast_path_composite (pixman_implementation_t *imp,
+     if (src->type == BITS
+         && src->common.transform
+         && !mask
++        && !src->common.alpha_map && !dest->common.alpha_map
++        && (src->common.filter == PIXMAN_FILTER_NEAREST)
++        && !src->bits.read_func && !src->bits.write_func
++        && !dest->bits.read_func && !dest->bits.write_func)
++    {
++        /* ensure that the transform matrix only has a scale */
++        if (src->common.transform->matrix[0][1] == 0 &&
++            src->common.transform->matrix[1][0] == 0 &&
++            src->common.transform->matrix[2][0] == 0 &&
++            src->common.transform->matrix[2][1] == 0 &&
++            src->common.transform->matrix[2][2] == pixman_fixed_1 &&
++            dest->common.clip_region.data == NULL)
++        {
++            if (fbCompositeTransformNonrotatedAffineTrivialclip (op, src, mask, dest,
++                    src_x, src_y, mask_x, mask_y, dest_x, dest_y, width, height))
++            {
++                return;
++            }
++        }
++    }
++
++    if (src->type == BITS
++        && src->common.transform
++        && !mask
+         && op == PIXMAN_OP_SRC
+         && !src->common.alpha_map && !dest->common.alpha_map
+         && (src->common.filter == PIXMAN_FILTER_NEAREST)
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/over-n-8-0565.patch b/recipes/obsolete/xorg/xorg-lib/pixman/over-n-8-0565.patch
new file mode 100644
index 0000000..3911068
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/over-n-8-0565.patch
@@ -0,0 +1,231 @@
+From de2221a32d0b6628116565563f7b4ccd0a44e8b6 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 04 Mar 2010 23:20:25 +0000
+Subject: ARM: added 'armv6_composite_over_n_8_0565' fast path
+
+Provides ~3x performance improvement when working with
+data in L1 cache and memory. This fast path is important
+for fonts rendering when using 16bpp desktop.
+
+Microbenchmark from N800 (ARM11 @ 400MHz), measured in MPix/s:
+
+before:
+
+ over_n_8_0565 = L1:   2.99 M:  2.86
+
+after:
+
+ over_n_8_0565 = L1:   9.07 M:  8.05
+---
+diff --git a/pixman/pixman-arm-simd.c b/pixman/pixman-arm-simd.c
+index 09a2888..c375c01 100644
+--- a/pixman/pixman-arm-simd.c
++++ b/pixman/pixman-arm-simd.c
+@@ -419,6 +419,193 @@ arm_composite_over_n_8_8888 (pixman_implementation_t * impl,
+     }
+ }
+ 
++#if defined(__ARM_EABI__) && defined(__linux__)
++/*
++ * ARMv6 assembly optimized version of 'composite_over_n_8_0565'. It is
++ * a bare metal 'naked' function which uses all the available CPU registers
++ * and is compatible with ARM EABI. It might (or might not) break when used
++ * with a different ABI, anyway it is better to be safe than sorry.
++ */
++static void __attribute__((naked)) armv6_composite_over_n_8_0565_asm (
++    uint16_t *dst, uint8_t *mask, uint32_t src, int w,
++    int dst_stride_delta, int mask_stride_delta, int h)
++{
++    asm volatile (
++        ".macro composite_internal_armv6_asm opaque_flag\n"
++            /* save all registers (8 words) to stack */
++            "stmdb   sp!, {r4-r11, ip, lr}\n"
++            /* some register aliases for better readability */
++            "DST     .req  r0\n"
++            "MASK    .req  r1\n"
++            "S       .req  r2\n"
++            "W       .req  r3\n"
++            "A       .req  r8\n"
++            "D       .req  r10\n"
++            "C0000FF .req  r11\n"
++            "C00001F .req  r9\n"
++            "C800080 .req  ip\n"
++            "CE000E0 .req  lr\n"
++            /* precalculate some stuff and put it on stack */
++            "mov     r6, #0xF8\n"
++            "mov     r7, #0xFC\n"
++
++            "str     W, [sp, #-8]!\n"
++
++            ".if \\opaque_flag\n"
++                /* precalculate and save it to stack for later use:
++                 * ((src >> 3) & 0x001F) |
++                 * ((src >> 5) & 0x07E0) |
++                 * ((src >> 8) & 0xF800)
++                 */
++                "mov     A, #0x1F\n"
++                "and     D, A, S, lsr #3\n"
++                "and     r4, S, #0xF80000\n"
++                "and     r5, S, #0xFC00\n"
++                "orr     D, r4, lsr #8\n"
++                "orr     D, r5, lsr #5\n"
++                "str     D, [sp, #4]\n"
++            ".endif\n"
++
++            "ldr     D, [sp, #(8 + 10*4 + 8)]\n" /* h */
++            "ldr     A, =0xFF00FF\n"
++            "ldr     C800080, =0x800080\n"
++            "ldr     CE000E0, =0xE000E0\n"
++            "ldr     C0000FF, =0xFF\n"
++            "ldr     C00001F, =0x1F\n"
++            "and     r4, A, S\n"           /* r4 = src & 0x00FF00FF */
++            "and     r5, A, S, lsr #8\n"   /* r5 = (src >> 8) & 0x00FF00FF */
++            "stmdb   sp!, {r4, r5, r6, r7}\n"
++        "0:\n"
++            "subs    D, D, #1\n"
++            "blt     6f\n"
++        "1:\n"
++            "subs    W, W, #1\n"
++            "blt     5f\n"
++        "2:\n"
++            "ldrb    A, [MASK], #1\n"
++            "ldmia   sp, {r4, r5, r6, r7}\n" /* load constants from stack */
++            "add     DST, DST, #2\n"
++            "cmp     A, #0\n"
++            "beq     1b\n"
++
++            ".if \\opaque_flag\n"
++                "cmp     A, #0xFF\n"
++                "bne     3f\n"
++                "ldr     D, [sp, #(4*4 + 4)]\n" /* load precalculated value */
++                "subs    W, #1\n"
++                "strh    D, [DST, #-2]\n"
++                "bge     2b\n"
++            ".endif\n"
++
++        "3:\n"
++            "ldrh    D, [DST, #-2]\n"
++            "mla     r4, A, r4, C800080\n"
++            "mla     r5, A, r5, C800080\n"
++            "and     r6, r6, D, lsl #3\n" /* & 0xF8 */
++            "and     r7, r7, D, lsr #3\n" /* & 0xFC */
++            "and     D, D, #0xF800\n"
++            "bic     S, r4, #0xFF0000\n"
++            "bic     A, r5, #0xFF0000\n"
++            "add     r4, r4, S, lsr #8\n"
++            "add     r5, r5, A, lsr #8\n"
++
++            "and     S, r7, #0xC0\n"
++            "orr     r6, r6, D, lsl #8\n"
++            "and     D, r6, CE000E0\n"
++            "eor     A, C0000FF, r5, lsr #24\n"
++            "orr     r6, D, lsr #5\n"
++            "orr     r7, S, lsr #6\n"
++
++            "mla     r6, A, r6, C800080\n"
++            "mla     r7, A, r7, C800080\n"
++            "subs    W, #1\n"
++            "bic     D, r6, #0xFF0000\n"
++            "bic     A, r7, #0xFF0000\n"
++            "add     r6, r6, D, lsr #8\n"
++            "uqadd8  r4, r4, r6\n"
++            "add     r7, r7, A, lsr #8\n"
++            "uqadd8  r5, r5, r7\n"
++            "and     D, C00001F, r4, lsr #11\n"
++            "and     r4, r4, #0xF8000000\n"
++            "and     r5, r5, #0xFC00\n"
++            "orr     D, r4, lsr #16\n"
++            "orr     D, r5, lsr #5\n"
++            "strh    D, [DST, #-2]\n"
++            "bge     2b\n"
++        "5:\n"
++            "ldr     r6, [sp, #(4*4 + 8 + 10*4 + 8)]\n" /* h */
++            "ldr     r4, [sp, #(4*4 + 8 + 10*4 + 4)]\n" /* mask stride */
++            "ldr     r5, [sp, #(4*4 + 8 + 10*4 + 0)]\n" /* dst stride */
++            "ldr     W, [sp, #(4*4)]\n"
++            "subs    r6, r6, #1\n" /* h */
++            "str     r6, [sp, #(4*4 + 8 + 10*4 + 8)]\n" /* h */
++            "add     MASK, MASK, r4\n"
++            "add     DST, DST, r5, lsl #1\n"
++            "bgt     1b\n"
++        "6:\n"
++            "add     sp, sp, #(4*4 + 8)\n"
++            /* restore all registers and return */
++            "ldmia   sp!, {r4-r11, ip, pc}\n"
++            ".unreq DST\n"
++            ".unreq MASK\n"
++            ".unreq S\n"
++            ".unreq W\n"
++            ".unreq A\n"
++            ".unreq D\n"
++            ".unreq C0000FF\n"
++            ".unreq C00001F\n"
++            ".unreq C800080\n"
++            ".unreq CE000E0\n"
++        ".endm\n"
++
++        "mov     ip, r2, lsr #24\n"
++        "cmp     ip, #0xFF\n"
++        "beq     9f\n"
++        "composite_internal_armv6_asm 0\n"
++    "9:\n"
++        "composite_internal_armv6_asm 1\n"
++        ".ltorg\n"
++        ".purgem composite_internal_armv6_asm\n"
++    );
++}
++
++static void
++armv6_composite_over_n_8_0565 (pixman_implementation_t * impl,
++			       pixman_op_t               op,
++			       pixman_image_t *          src_image,
++			       pixman_image_t *          mask_image,
++			       pixman_image_t *          dst_image,
++			       int32_t                   src_x,
++			       int32_t                   src_y,
++			       int32_t                   mask_x,
++			       int32_t                   mask_y,
++			       int32_t                   dest_x,
++			       int32_t                   dest_y,
++			       int32_t                   width,
++			       int32_t                   height)
++{
++    uint32_t src;
++    uint16_t *dst;
++    uint8_t  *mask;
++    int dst_stride, mask_stride;
++
++    src = _pixman_image_get_solid (src_image, dst_image->bits.format);
++
++    /* bail out if fully transparent */
++    if (src == 0)
++	return;
++
++    PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, uint16_t,
++			   dst_stride, dst, 1);
++    PIXMAN_IMAGE_GET_LINE (mask_image, mask_x, mask_y, uint8_t,
++			   mask_stride, mask, 1);
++
++    armv6_composite_over_n_8_0565_asm (dst, mask, src, width,
++	dst_stride - width, mask_stride - width, height);
++}
++
++#endif
++
+ static const pixman_fast_path_t arm_simd_fast_paths[] =
+ {
+     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, null, a8r8g8b8, arm_composite_over_8888_8888),
+@@ -434,7 +621,10 @@ static const pixman_fast_path_t arm_simd_fast_paths[] =
+     PIXMAN_STD_FAST_PATH (OVER, solid, a8, x8r8g8b8, arm_composite_over_n_8_8888),
+     PIXMAN_STD_FAST_PATH (OVER, solid, a8, a8b8g8r8, arm_composite_over_n_8_8888),
+     PIXMAN_STD_FAST_PATH (OVER, solid, a8, x8b8g8r8, arm_composite_over_n_8_8888),
+-
++#if defined(__ARM_EABI__) && defined(__linux__)
++    PIXMAN_STD_FAST_PATH (OVER, solid, a8, r5g6b5, armv6_composite_over_n_8_0565),
++    PIXMAN_STD_FAST_PATH (OVER, solid, a8, b5g6r5, armv6_composite_over_n_8_0565),
++#endif
+     { PIXMAN_OP_NONE },
+ };
+ 
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/pixman-28986.patch b/recipes/obsolete/xorg/xorg-lib/pixman/pixman-28986.patch
new file mode 100644
index 0000000..f5ba4c3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/pixman-28986.patch
@@ -0,0 +1,32 @@
+From 7b7860d61fb1526acdf010dd8fd644bbf1396b9e Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Fri, 28 Aug 2009 22:34:21 +0300
+Subject: [PATCH] ARM: workaround for gcc bug in vshll_n_u8 intrinsic
+
+Some versions of gcc (cs2009q1, 4.4.1) incorrectly reject
+shift operand having value >= 8, claiming that it is out of
+range. So inline assembly is used as a workaround.
+---
+ pixman/pixman-arm-neon.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 4125d1b..3e7f566 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -64,6 +64,12 @@ unpack0565 (uint16x8_t rgb)
+     return res;
+ }
+ 
++#ifdef USE_GCC_INLINE_ASM
++/* Some versions of gcc have problems with vshll_n_u8 intrinsic (Bug 23576) */
++#define vshll_n_u8(a, n) ({ uint16x8_t r; \
++    asm ("vshll.u8 %q0, %P1, %2\n" : "=w" (r) : "w" (a), "i" (n)); r; })
++#endif
++
+ static force_inline uint16x8_t
+ pack0565 (uint8x8x4_t s)
+ {
+-- 
+1.5.4.3
+
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/prefetch.patch b/recipes/obsolete/xorg/xorg-lib/pixman/prefetch.patch
new file mode 100644
index 0000000..c2e856e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/prefetch.patch
@@ -0,0 +1,298 @@
+From d0044bfbd596f22ed1560579ea6537b39f3dc1af Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 29 Oct 2009 19:06:42 +0000
+Subject: ARM: Don't emit prefetch code if prefetch distance is set to 0
+
+Also it is now possible to disable prefetch globally with
+a configuration macro
+---
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index bca499a..35e6a7e 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -219,33 +219,33 @@
+     vshrn.u16   d7, q2, #3
+     vsli.u16    q2, q2, #5
+         vshll.u8    q14, d16, #8
+-                                    add PF_X, PF_X, #8
++                                    PF add PF_X, PF_X, #8
+         vshll.u8    q8, d19, #8
+-                                    tst PF_CTL, #0xF
++                                    PF tst PF_CTL, #0xF
+     vsri.u8     d6, d6, #5
+-                                    addne PF_X, PF_X, #8
++                                    PF addne PF_X, PF_X, #8
+     vmvn.8      d3, d3
+-                                    subne PF_CTL, PF_CTL, #1
++                                    PF subne PF_CTL, PF_CTL, #1
+     vsri.u8     d7, d7, #6
+     vshrn.u16   d30, q2, #2
+     vmull.u8    q10, d3, d6
+-                                    pld [PF_SRC, PF_X, lsl #src_bpp_shift]
++                                    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
+     vmull.u8    q11, d3, d7
+     vmull.u8    q12, d3, d30
+-                                    pld [PF_DST, PF_X, lsl #dst_bpp_shift]
++                                    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
+         vsri.u16    q14, q8, #5
+-                                    cmp PF_X, ORIG_W
++                                    PF cmp PF_X, ORIG_W
+         vshll.u8    q9, d18, #8
+     vrshr.u16   q13, q10, #8
+-                                    subge PF_X, PF_X, ORIG_W
++                                    PF subge PF_X, PF_X, ORIG_W
+     vrshr.u16   q3, q11, #8
+     vrshr.u16   q15, q12, #8
+-                                    subges PF_CTL, PF_CTL, #0x10
++                                    PF subges PF_CTL, PF_CTL, #0x10
+         vsri.u16    q14, q9, #11
+-                                    ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
++                                    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
+     vraddhn.u16 d20, q10, q13
+     vraddhn.u16 d23, q11, q3
+-                                    ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
++                                    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
+     vraddhn.u16 d22, q12, q15
+         vst1.16     {d28, d29}, [DST_W, :128]!
+ .endm
+@@ -323,20 +323,20 @@ generate_composite_function \
+ 
+ .macro pixman_composite_src_8888_0565_process_pixblock_tail_head
+         vsri.u16    q14, q8, #5
+-                                    add PF_X, PF_X, #8
+-                                    tst PF_CTL, #0xF
++                                    PF add PF_X, PF_X, #8
++                                    PF tst PF_CTL, #0xF
+     vld4.8      {d0, d1, d2, d3}, [SRC]!
+-                                    addne PF_X, PF_X, #8
+-                                    subne PF_CTL, PF_CTL, #1
++                                    PF addne PF_X, PF_X, #8
++                                    PF subne PF_CTL, PF_CTL, #1
+         vsri.u16    q14, q9, #11
+-                                    cmp PF_X, ORIG_W
+-                                    pld [PF_SRC, PF_X, lsl #src_bpp_shift]
++                                    PF cmp PF_X, ORIG_W
++                                    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
+     vshll.u8    q8, d1, #8
+         vst1.16     {d28, d29}, [DST_W, :128]!
+-                                    subge PF_X, PF_X, ORIG_W
+-                                    subges PF_CTL, PF_CTL, #0x10
++                                    PF subge PF_X, PF_X, ORIG_W
++                                    PF subges PF_CTL, PF_CTL, #0x10
+     vshll.u8    q14, d2, #8
+-                                    ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
++                                    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
+     vshll.u8    q9, d0, #8
+ .endm
+ 
+@@ -363,20 +363,20 @@ generate_composite_function \
+ 
+ .macro pixman_composite_add_8000_8000_process_pixblock_tail_head
+     vld1.8      {d0, d1, d2, d3}, [SRC]!
+-                                    add PF_X, PF_X, #32
+-                                    tst PF_CTL, #0xF
++                                    PF add PF_X, PF_X, #32
++                                    PF tst PF_CTL, #0xF
+     vld1.8      {d4, d5, d6, d7}, [DST_R, :128]!
+-                                    addne PF_X, PF_X, #32
+-                                    subne PF_CTL, PF_CTL, #1
++                                    PF addne PF_X, PF_X, #32
++                                    PF subne PF_CTL, PF_CTL, #1
+         vst1.8      {d28, d29, d30, d31}, [DST_W, :128]!
+-                                    cmp PF_X, ORIG_W
+-                                    pld [PF_SRC, PF_X, lsl #src_bpp_shift]
+-                                    pld [PF_DST, PF_X, lsl #dst_bpp_shift]
+-                                    subge PF_X, PF_X, ORIG_W
+-                                    subges PF_CTL, PF_CTL, #0x10
++                                    PF cmp PF_X, ORIG_W
++                                    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
++                                    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
++                                    PF subge PF_X, PF_X, ORIG_W
++                                    PF subges PF_CTL, PF_CTL, #0x10
+     vqadd.u8    q14, q0, q2
+-                                    ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
+-                                    ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
++                                    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
++                                    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
+     vqadd.u8    q15, q1, q3
+ .endm
+ 
+@@ -418,32 +418,32 @@ generate_composite_function \
+ .macro pixman_composite_over_8888_8888_process_pixblock_tail_head
+     vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
+         vrshr.u16   q14, q8, #8
+-                                    add PF_X, PF_X, #8
+-                                    tst PF_CTL, #0xF
++                                    PF add PF_X, PF_X, #8
++                                    PF tst PF_CTL, #0xF
+         vrshr.u16   q15, q9, #8
+         vrshr.u16   q12, q10, #8
+         vrshr.u16   q13, q11, #8
+-                                    addne PF_X, PF_X, #8
+-                                    subne PF_CTL, PF_CTL, #1
++                                    PF addne PF_X, PF_X, #8
++                                    PF subne PF_CTL, PF_CTL, #1
+         vraddhn.u16 d28, q14, q8
+         vraddhn.u16 d29, q15, q9
+-                                    cmp PF_X, ORIG_W
++                                    PF cmp PF_X, ORIG_W
+         vraddhn.u16 d30, q12, q10
+         vraddhn.u16 d31, q13, q11
+         vqadd.u8    q14, q0, q14
+         vqadd.u8    q15, q1, q15
+     vld4.8      {d0, d1, d2, d3}, [SRC]!
+-                                    pld [PF_SRC, PF_X, lsl #src_bpp_shift]
++                                    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
+     vmvn.8      d22, d3
+-                                    pld [PF_DST, PF_X, lsl #dst_bpp_shift]
++                                    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
+         vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
+-                                    subge PF_X, PF_X, ORIG_W
++                                    PF subge PF_X, PF_X, ORIG_W
+     vmull.u8    q8, d22, d4
+-                                    subges PF_CTL, PF_CTL, #0x10
++                                    PF subges PF_CTL, PF_CTL, #0x10
+     vmull.u8    q9, d22, d5
+-                                    ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
++                                    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
+     vmull.u8    q10, d22, d6
+-                                    ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
++                                    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
+     vmull.u8    q11, d22, d7
+ .endm
+ 
+diff --git a/pixman/pixman-arm-neon-asm.h b/pixman/pixman-arm-neon-asm.h
+index d276ab9..a2941ae 100644
+--- a/pixman/pixman-arm-neon-asm.h
++++ b/pixman/pixman-arm-neon-asm.h
+@@ -58,6 +58,11 @@
+ #define RESPECT_STRICT_ALIGNMENT 1
+ 
+ /*
++ * If set to nonzero value, prefetch is globally disabled
++ */
++#define PREFETCH_GLOBALLY_DISABLED 0 
++
++/*
+  * Definitions of supplementary pixld/pixst macros (for partial load/store of
+  * pixel data)
+  */
+@@ -218,37 +223,43 @@
+  * pixels processing like simple copy. Anyway, having prefetch is a must
+  * when working with graphics data.
+  */
++.macro PF a, x:vararg
++.if (ADVANCED_PREFETCH_ENABLED != 0) && (PREFETCH_GLOBALLY_DISABLED == 0)
++    a x
++.endif
++.endm
++
+ .macro cache_preload std_increment, boost_increment
+ .if (src_bpp_shift >= 0) || (dst_r_bpp != 0) || (mask_bpp_shift >= 0)
+ .if regs_shortage
+-    ldr ORIG_W, [sp] /* If we are short on regs, ORIG_W is kept on stack */
++    PF ldr ORIG_W, [sp] /* If we are short on regs, ORIG_W is kept on stack */
+ .endif
+ .if std_increment != 0
+-    add PF_X, PF_X, #std_increment
++    PF add PF_X, PF_X, #std_increment
+ .endif
+-    tst PF_CTL, #0xF
+-    addne PF_X, PF_X, #boost_increment
+-    subne PF_CTL, PF_CTL, #1
+-    cmp PF_X, ORIG_W
++    PF tst PF_CTL, #0xF
++    PF addne PF_X, PF_X, #boost_increment
++    PF subne PF_CTL, PF_CTL, #1
++    PF cmp PF_X, ORIG_W
+ .if src_bpp_shift >= 0
+-    pld [PF_SRC, PF_X, lsl #src_bpp_shift]
++    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
+ .endif
+ .if dst_r_bpp != 0
+-    pld [PF_DST, PF_X, lsl #dst_bpp_shift]
++    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
+ .endif
+ .if mask_bpp_shift >= 0
+-    pld [PF_MASK, PF_X, lsl #mask_bpp_shift]
++    PF pld, [PF_MASK, PF_X, lsl #mask_bpp_shift]
+ .endif
+-    subge PF_X, PF_X, ORIG_W
+-    subges PF_CTL, PF_CTL, #0x10
++    PF subge PF_X, PF_X, ORIG_W
++    PF subges PF_CTL, PF_CTL, #0x10
+ .if src_bpp_shift >= 0
+-    ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
++    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
+ .endif
+ .if dst_r_bpp != 0
+-    ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
++    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
+ .endif
+ .if mask_bpp_shift >= 0
+-    ldrgeb DUMMY, [PF_MASK, MASK_STRIDE, lsl #mask_bpp_shift]!
++    PF ldrgeb DUMMY, [PF_MASK, MASK_STRIDE, lsl #mask_bpp_shift]!
+ .endif
+ .endif
+ .endm
+@@ -297,6 +308,12 @@ fname:
+     PF_DST      .req        r12
+     PF_MASK     .req        r14
+ 
++.if prefetch_distance == 0
++    .set ADVANCED_PREFETCH_ENABLED, 0
++.else
++    .set ADVANCED_PREFETCH_ENABLED, 1
++.endif
++
+ .if mask_bpp == 0
+     ORIG_W      .req        r7      /* saved original width */
+     DUMMY       .req        r8      /* temporary register */
+@@ -374,12 +391,12 @@ fname:
+     ldr         MASK_STRIDE, [sp, #52]
+ .endif
+     mov         DST_R, DST_W
+-    mov         PF_SRC, SRC
+-    mov         PF_DST, DST_R
+-    mov         PF_MASK, MASK
+-    mov         PF_CTL, H, lsl #4
+-    /* pf_ctl = 10 | ((h - 1) << 4) */
+-    add         PF_CTL, #(prefetch_distance - 0x10)
++    PF mov      PF_SRC, SRC
++    PF mov      PF_DST, DST_R
++    PF mov      PF_MASK, MASK
++    /* PF_CTL = prefetch_distance | ((h - 1) << 4) */
++    PF mov      PF_CTL, H, lsl #4
++    PF add      PF_CTL, #(prefetch_distance - 0x10)
+ 
+     init
+ .if regs_shortage
+@@ -412,7 +429,7 @@ fname:
+ .else
+     add         DST_R, DST_R, #lowbit
+ .endif
+-    add         PF_X, PF_X, #(lowbit * 8 / dst_w_bpp)
++    PF add      PF_X, PF_X, #(lowbit * 8 / dst_w_bpp)
+     sub         W, W, #(lowbit * 8 / dst_w_bpp)
+ 1:
+ .endif
+@@ -444,7 +461,7 @@ fname:
+                 (src_basereg - pixblock_size * src_bpp / 64), SRC
+     pixld       pixblock_size, mask_bpp, \
+                 (mask_basereg - pixblock_size * mask_bpp / 64), MASK
+-    add         PF_X, PF_X, #pixblock_size
++    PF add      PF_X, PF_X, #pixblock_size
+     process_pixblock_head
+     cache_preload 0, pixblock_size
+     subs        W, W, #(pixblock_size * 2)
+@@ -468,7 +485,7 @@ fname:
+     pixld       chunk_size, src_bpp, src_basereg, SRC
+     pixld       chunk_size, mask_bpp, mask_basereg, MASK
+     pixld_a     chunk_size, dst_r_bpp, dst_r_basereg, DST_R
+-    add         PF_X, PF_X, #chunk_size
++    PF add      PF_X, PF_X, #chunk_size
+ 1:
+ .endif
+ .endr
+--
+cgit v0.8.2
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/remove-broken.patch b/recipes/obsolete/xorg/xorg-lib/pixman/remove-broken.patch
new file mode 100644
index 0000000..fd025b4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/remove-broken.patch
@@ -0,0 +1,826 @@
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Sun, 26 Jul 2009 22:21:26 +0000 (+0300)
+Subject: ARM: Removal of unused/broken NEON code
+X-Git-Url: http://siarhei.siamashka.name/gitweb/?p=pixman.git;a=commitdiff_plain;h=7ef2322eefcccc28a2d45c0da22c0fee88b8f464
+
+ARM: Removal of unused/broken NEON code
+---
+
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 4125d1b..9404c70 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -1895,710 +1895,6 @@ pixman_fill_neon (uint32_t *bits,
+ #endif
+ }
+ 
+-/* TODO: is there a more generic way of doing this being introduced? */
+-#define NEON_SCANLINE_BUFFER_PIXELS (1024)
+-
+-static inline void
+-neon_quadword_copy (void *   dst,
+-		    void *   src,
+-		    uint32_t count,         /* of quadwords */
+-		    uint32_t trailer_count  /* of bytes */)
+-{
+-    uint8_t *t_dst = dst, *t_src = src;
+-
+-    /* Uses aligned multi-register loads to maximise read bandwidth
+-     * on uncached memory such as framebuffers
+-     * The accesses do not have the aligned qualifiers, so that the copy
+-     * may convert between aligned-uncached and unaligned-cached memory.
+-     * It is assumed that the CPU can infer alignedness from the address.
+-     */
+-
+-#ifdef USE_GCC_INLINE_ASM
+-
+-    asm volatile (
+-        "	cmp       %[count], #8				\n"
+-        "	blt 1f    @ skip oversized fragments		\n"
+-        "0: @ start with eight quadwords at a time		\n"
+-        "	sub       %[count], %[count], #8		\n"
+-        "	vld1.8    {d16, d17, d18, d19}, [%[src]]!		\n"
+-        "	vld1.8    {d20, d21, d22, d23}, [%[src]]!		\n"
+-        "	vld1.8    {d24, d25, d26, d27}, [%[src]]!		\n"
+-        "	vld1.8    {d28, d29, d30, d31}, [%[src]]!		\n"
+-        "	cmp       %[count], #8				\n"
+-        "	vst1.8    {d16, d17, d18, d19}, [%[dst]]!		\n"
+-        "	vst1.8    {d20, d21, d22, d23}, [%[dst]]!		\n"
+-        "	vst1.8    {d24, d25, d26, d27}, [%[dst]]!		\n"
+-        "	vst1.8    {d28, d29, d30, d31}, [%[dst]]!		\n"
+-        "	bge 0b						\n"
+-        "1: @ four quadwords					\n"
+-        "	tst       %[count], #4				\n"
+-        "	beq 2f    @ skip oversized fragment		\n"
+-        "	vld1.8    {d16, d17, d18, d19}, [%[src]]!		\n"
+-        "	vld1.8    {d20, d21, d22, d23}, [%[src]]!		\n"
+-        "	vst1.8    {d16, d17, d18, d19}, [%[dst]]!		\n"
+-        "	vst1.8    {d20, d21, d22, d23}, [%[dst]]!		\n"
+-        "2: @ two quadwords					\n"
+-        "	tst       %[count], #2				\n"
+-        "	beq 3f    @ skip oversized fragment		\n"
+-        "	vld1.8    {d16, d17, d18, d19}, [%[src]]!		\n"
+-        "	vst1.8    {d16, d17, d18, d19}, [%[dst]]!		\n"
+-        "3: @ one quadword					\n"
+-        "	tst       %[count], #1				\n"
+-        "	beq 4f    @ skip oversized fragment		\n"
+-        "	vld1.8    {d16, d17}, [%[src]]!			\n"
+-        "	vst1.8    {d16, d17}, [%[dst]]!			\n"
+-        "4: @ end						\n"
+-
+-        /* Clobbered input registers marked as input/outputs */
+-	: [dst] "+r" (t_dst), [src] "+r" (t_src), [count] "+r" (count)
+-
+-	  /* No unclobbered inputs */
+-	:
+-
+-        /* Clobbered vector registers */
+-	: "d16", "d17", "d18", "d19", "d20", "d21", "d22", "d23", "d24", "d25",
+-	  "d26", "d27", "d28", "d29", "d30", "d31", "cc", "memory");
+-
+-#else
+-
+-    while (count >= 8)
+-    {
+-	uint8x16x4_t t1 = vld4q_u8 (t_src);
+-	uint8x16x4_t t2 = vld4q_u8 (t_src + sizeof(uint8x16x4_t));
+-	
+-	t_src += sizeof(uint8x16x4_t) * 2;
+-	vst4q_u8 (t_dst, t1);
+-	vst4q_u8 (t_dst + sizeof(uint8x16x4_t), t2);
+-	t_dst += sizeof(uint8x16x4_t) * 2;
+-	count -= 8;
+-    }
+-
+-    if (count & 4)
+-    {
+-	uint8x16x4_t t1 = vld4q_u8 (t_src);
+-	
+-	t_src += sizeof(uint8x16x4_t);
+-	vst4q_u8 (t_dst, t1);
+-	t_dst += sizeof(uint8x16x4_t);
+-    }
+-
+-    if (count & 2)
+-    {
+-	uint8x8x4_t t1 = vld4_u8 (t_src);
+-	
+-	t_src += sizeof(uint8x8x4_t);
+-	vst4_u8 (t_dst, t1);
+-	t_dst += sizeof(uint8x8x4_t);
+-    }
+-
+-    if (count & 1)
+-    {
+-	uint8x16_t t1 = vld1q_u8 (t_src);
+-	
+-	t_src += sizeof(uint8x16_t);
+-	vst1q_u8 (t_dst, t1);
+-	t_dst += sizeof(uint8x16_t);
+-    }
+-
+-#endif  /* !USE_GCC_INLINE_ASM */
+-
+-    if (trailer_count)
+-    {
+-	if (trailer_count & 8)
+-	{
+-	    uint8x8_t t1 = vld1_u8 (t_src);
+-	    
+-	    t_src += sizeof(uint8x8_t);
+-	    vst1_u8 (t_dst, t1);
+-	    t_dst += sizeof(uint8x8_t);
+-	}
+-
+-	if (trailer_count & 4)
+-	{
+-	    *((uint32_t*) t_dst) = *((uint32_t*) t_src);
+-	    
+-	    t_dst += 4;
+-	    t_src += 4;
+-	}
+-
+-	if (trailer_count & 2)
+-	{
+-	    *((uint16_t*) t_dst) = *((uint16_t*) t_src);
+-	    
+-	    t_dst += 2;
+-	    t_src += 2;
+-	}
+-
+-	if (trailer_count & 1)
+-	{
+-	    *t_dst++ = *t_src++;
+-	}
+-    }
+-}
+-
+-static inline void
+-solid_over_565_8_pix_neon (uint32_t  glyph_colour,
+-                           uint16_t *dest,
+-                           uint8_t * in_mask,
+-                           uint32_t  dest_stride,    /* bytes, not elements */
+-                           uint32_t  mask_stride,
+-                           uint32_t  count           /* 8-pixel groups */)
+-{
+-    /* Inner loop of glyph blitter (solid colour, alpha mask) */
+-
+-#ifdef USE_GCC_INLINE_ASM
+-
+-    asm volatile (
+-        "	vld4.8 {d20[], d21[], d22[], d23[]}, [%[glyph_colour]]  @ splat solid colour components	\n"
+-        "0:	@ loop																				\n"
+-        "	vld1.16   {d0, d1}, [%[dest]]         @ load first pixels from framebuffer			\n"
+-        "	vld1.8    {d17}, [%[in_mask]]         @ load alpha mask of glyph						\n"
+-        "	vmull.u8  q9, d17, d23               @ apply glyph colour alpha to mask				\n"
+-        "	vshrn.u16 d17, q9, #8                @ reformat it to match original mask			\n"
+-        "	vmvn      d18, d17                   @ we need the inverse mask for the background	\n"
+-        "	vsli.u16  q3, q0, #5                 @ duplicate framebuffer blue bits				\n"
+-        "	vshrn.u16 d2, q0, #8                 @ unpack red from framebuffer pixels			\n"
+-        "	vshrn.u16 d4, q0, #3                 @ unpack green									\n"
+-        "	vsri.u8   d2, d2, #5                 @ duplicate red bits (extend 5 to 8)			\n"
+-        "	vshrn.u16 d6, q3, #2                 @ unpack extended blue (truncate 10 to 8)		\n"
+-        "	vsri.u8   d4, d4, #6                 @ duplicate green bits (extend 6 to 8)			\n"
+-        "	vmull.u8  q1, d2, d18                @ apply inverse mask to background red...		\n"
+-        "	vmull.u8  q2, d4, d18                @ ...green...									\n"
+-        "	vmull.u8  q3, d6, d18                @ ...blue										\n"
+-        "	subs      %[count], %[count], #1     @ decrement/test loop counter					\n"
+-        "	vmlal.u8  q1, d17, d22               @ add masked foreground red...					\n"
+-        "	vmlal.u8  q2, d17, d21               @ ...green...									\n"
+-        "	vmlal.u8  q3, d17, d20               @ ...blue										\n"
+-        "	add %[in_mask], %[in_mask], %[mask_stride] @ advance mask pointer, while we wait		\n"
+-        "	vsri.16   q1, q2, #5                 @ pack green behind red						\n"
+-        "	vsri.16   q1, q3, #11                @ pack blue into pixels						\n"
+-        "	vst1.16   {d2, d3}, [%[dest]]         @ store composited pixels						\n"
+-        "	add %[dest], %[dest], %[dest_stride]  @ advance framebuffer pointer					\n"
+-        "	bne 0b                               @ next please									\n"
+-
+-	/* Clobbered registers marked as input/outputs */
+-	: [dest] "+r" (dest), [in_mask] "+r" (in_mask), [count] "+r" (count)
+-	  
+-	  /* Inputs */
+-	: [dest_stride] "r" (dest_stride), [mask_stride] "r" (mask_stride), [glyph_colour] "r" (&glyph_colour)
+-
+-	  /* Clobbers, including the inputs we modify, and potentially lots of memory */
+-	: "d0", "d1", "d2", "d3", "d4", "d5", "d6", "d7", "d17", "d18", "d19",
+-	  "d20", "d21", "d22", "d23", "d24", "d25", "cc", "memory"
+-        );
+-
+-#else
+-
+-    uint8x8x4_t solid_colour = vld4_dup_u8 ((uint8_t*) &glyph_colour);
+-
+-    while (count--)
+-    {
+-	uint16x8_t pixels = vld1q_u16 (dest);
+-	uint8x8_t mask = vshrn_n_u16 (vmull_u8 (solid_colour.val[3], vld1_u8 (in_mask)), 8);
+-	uint8x8_t mask_image = vmvn_u8 (mask);
+-
+-	uint8x8_t t_red   = vshrn_n_u16 (pixels, 8);
+-	uint8x8_t t_green = vshrn_n_u16 (pixels, 3);
+-	uint8x8_t t_blue  = vshrn_n_u16 (vsli_n_u8 (pixels, pixels, 5), 2);
+-
+-	uint16x8_t s_red   = vmull_u8 (vsri_n_u8 (t_red, t_red, 5), mask_image);
+-	uint16x8_t s_green = vmull_u8 (vsri_n_u8 (t_green, t_green, 6), mask_image);
+-	uint16x8_t s_blue  = vmull_u8 (t_blue, mask_image);
+-
+-	s_red   = vmlal (s_red, mask, solid_colour.val[2]);
+-	s_green = vmlal (s_green, mask, solid_colour.val[1]);
+-	s_blue  = vmlal (s_blue, mask, solid_colour.val[0]);
+-
+-	pixels = vsri_n_u16 (s_red, s_green, 5);
+-	pixels = vsri_n_u16 (pixels, s_blue, 11);
+-	vst1q_u16 (dest, pixels);
+-
+-	dest += dest_stride;
+-	mask += mask_stride;
+-    }
+-
+-#endif
+-}
+-
+-#if 0 /* this is broken currently */
+-static void
+-neon_composite_over_n_8_0565 (pixman_implementation_t * impl,
+-                              pixman_op_t               op,
+-                              pixman_image_t *          src_image,
+-                              pixman_image_t *          mask_image,
+-                              pixman_image_t *          dst_image,
+-                              int32_t                   src_x,
+-                              int32_t                   src_y,
+-                              int32_t                   mask_x,
+-                              int32_t                   mask_y,
+-                              int32_t                   dest_x,
+-                              int32_t                   dest_y,
+-                              int32_t                   width,
+-                              int32_t                   height)
+-{
+-    uint32_t  src, srca;
+-    uint16_t *dst_line, *aligned_line;
+-    uint8_t  *mask_line;
+-    uint32_t  dst_stride, mask_stride;
+-    uint32_t  kernel_count, copy_count, copy_tail;
+-    uint8_t   kernel_offset, copy_offset;
+-
+-    src = _pixman_image_get_solid (src_image, dst_image->bits.format);
+-
+-    /* bail out if fully transparent or degenerate */
+-    srca = src >> 24;
+-    if (src == 0)
+-	return;
+-
+-    if (width == 0 || height == 0)
+-	return;
+-
+-    if (width > NEON_SCANLINE_BUFFER_PIXELS)
+-    {
+-	/* split the blit, so we can use a fixed-size scanline buffer
+-	 * TODO: there must be a more elegant way of doing this.
+-	 */
+-	int x;
+-	for (x = 0; x < width; x += NEON_SCANLINE_BUFFER_PIXELS)
+-	{
+-	    neon_composite_over_n_8_0565 (
+-		impl, op,
+-		src_image, mask_image, dst_image,
+-		src_x + x, src_y, mask_x + x, mask_y, dest_x + x, dest_y,
+-		(x + NEON_SCANLINE_BUFFER_PIXELS > width) ? width - x : NEON_SCANLINE_BUFFER_PIXELS, height);
+-	}
+-
+-	return;
+-    }
+-    
+-    PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, uint16_t, dst_stride, dst_line, 1);
+-    PIXMAN_IMAGE_GET_LINE (mask_image, mask_x, mask_y, uint8_t, mask_stride, mask_line, 1);
+-
+-    /* keep within minimum number of aligned quadwords on width
+-     * while also keeping the minimum number of columns to process
+-     */
+-    {
+-	unsigned long aligned_left = (unsigned long)(dst_line) & ~0xF;
+-	unsigned long aligned_right = (((unsigned long)(dst_line + width)) + 0xF) & ~0xF;
+-	unsigned long ceiling_length = (((unsigned long) width) * sizeof(*dst_line) + 0xF) & ~0xF;
+-
+-	/* the fast copy should be quadword aligned */
+-	copy_offset = dst_line - ((uint16_t*) aligned_left);
+-	aligned_line = dst_line - copy_offset;
+-	copy_count = (uint32_t) ((aligned_right - aligned_left) >> 4);
+-	copy_tail = 0;
+-
+-	if (aligned_right - aligned_left > ceiling_length)
+-	{
+-	    /* unaligned routine is tightest */
+-	    kernel_count = (uint32_t) (ceiling_length >> 4);
+-	    kernel_offset = copy_offset;
+-	}
+-	else
+-	{
+-	    /* aligned routine is equally tight, so it is safer to align */
+-	    kernel_count = copy_count;
+-	    kernel_offset = 0;
+-	}
+-
+-	/* We should avoid reading beyond scanline ends for safety */
+-	if (aligned_line < (dst_line - dest_x) ||
+-	    (aligned_line + (copy_count * 16 / sizeof(*dst_line))) > ((dst_line - dest_x) + dst_image->bits.width))
+-	{
+-	    /* switch to precise read */
+-	    copy_offset = kernel_offset = 0;
+-	    aligned_line = dst_line;
+-	    kernel_count = (uint32_t) (ceiling_length >> 4);
+-	    copy_count = (width * sizeof(*dst_line)) >> 4;
+-	    copy_tail = (width * sizeof(*dst_line)) & 0xF;
+-	}
+-    }
+-
+-    {
+-	uint16_t scan_line[NEON_SCANLINE_BUFFER_PIXELS + 8];         /* deliberately not initialised */
+-	uint8_t glyph_line[NEON_SCANLINE_BUFFER_PIXELS + 8];
+-	int y = height;
+-
+-	/* row-major order */
+-	/* left edge, middle block, right edge */
+-	for ( ; y--; mask_line += mask_stride, aligned_line += dst_stride, dst_line += dst_stride)
+-	{
+-	    /* We don't want to overrun the edges of the glyph,
+-	     * so realign the edge data into known buffers
+-	     */
+-	    neon_quadword_copy (glyph_line + copy_offset, mask_line, width >> 4, width & 0xF);
+-
+-	    /* Uncached framebuffer access is really, really slow
+-	     * if we do it piecemeal. It should be much faster if we
+-	     * grab it all at once. One scanline should easily fit in
+-	     * L1 cache, so this should not waste RAM bandwidth.
+-	     */
+-	    neon_quadword_copy (scan_line, aligned_line, copy_count, copy_tail);
+-
+-	    /* Apply the actual filter */
+-	    solid_over_565_8_pix_neon (
+-		src, scan_line + kernel_offset,
+-		glyph_line + kernel_offset, 8 * sizeof(*dst_line),
+-		8, kernel_count);
+-
+-	    /* Copy the modified scanline back */
+-	    neon_quadword_copy (dst_line, scan_line + copy_offset,
+-				width >> 3, (width & 7) * 2);
+-	}
+-    }
+-}
+-#endif
+-
+-#ifdef USE_GCC_INLINE_ASM
+-
+-static inline void
+-plain_over_565_8_pix_neon (uint32_t  colour,
+-			   uint16_t *dest,
+-			   uint32_t  dest_stride,     /* bytes, not elements */
+-			   uint32_t  count            /* 8-pixel groups */)
+-{
+-    /* Inner loop for plain translucent rects
+-     * (solid colour without alpha mask)
+-     */
+-    asm volatile (
+-        "	vld4.8   {d20[], d21[], d22[], d23[]}, [%[colour]]  @ solid colour load/splat \n"
+-        "	vmull.u8  q12, d23, d22              @ premultiply alpha red   \n"
+-        "	vmull.u8  q13, d23, d21              @ premultiply alpha green \n"
+-        "	vmull.u8  q14, d23, d20              @ premultiply alpha blue  \n"
+-        "	vmvn      d18, d23                   @ inverse alpha for background \n"
+-        "0:	@ loop\n"
+-        "	vld1.16   {d0, d1}, [%[dest]]         @ load first pixels from framebuffer	\n"
+-        "	vshrn.u16 d2, q0, #8                 @ unpack red from framebuffer pixels	\n"
+-        "	vshrn.u16 d4, q0, #3                 @ unpack green				\n"
+-        "	vsli.u16  q3, q0, #5                 @ duplicate framebuffer blue bits		\n"
+-        "	vsri.u8   d2, d2, #5                 @ duplicate red bits (extend 5 to 8)	\n"
+-        "	vsri.u8   d4, d4, #6                 @ duplicate green bits (extend 6 to 8)	\n"
+-        "	vshrn.u16 d6, q3, #2                 @ unpack extended blue (truncate 10 to 8)	\n"
+-        "	vmov      q0, q12                    @ retrieve foreground red   \n"
+-        "	vmlal.u8  q0, d2, d18                @ blend red - my kingdom for a four-operand MLA \n"
+-        "	vmov      q1, q13                    @ retrieve foreground green \n"
+-        "	vmlal.u8  q1, d4, d18                @ blend green               \n"
+-        "	vmov      q2, q14                    @ retrieve foreground blue  \n"
+-        "	vmlal.u8  q2, d6, d18                @ blend blue                \n"
+-        "	subs      %[count], %[count], #1     @ decrement/test loop counter		\n"
+-        "	vsri.16   q0, q1, #5                 @ pack green behind red			\n"
+-        "	vsri.16   q0, q2, #11                @ pack blue into pixels			\n"
+-        "	vst1.16   {d0, d1}, [%[dest]]         @ store composited pixels			\n"
+-        "	add %[dest], %[dest], %[dest_stride]  @ advance framebuffer pointer		\n"
+-        "	bne 0b                               @ next please				\n"
+-
+-        /* Clobbered registers marked as input/outputs */
+-	: [dest] "+r" (dest), [count] "+r" (count)
+-
+-	  /* Inputs */
+-	: [dest_stride] "r" (dest_stride), [colour] "r" (&colour)
+-
+-	  /* Clobbers, including the inputs we modify, and
+-	   * potentially lots of memory
+-	   */
+-	: "d0", "d1", "d2", "d3", "d4", "d5", "d6", "d7", "d18", "d19",
+-	  "d20", "d21", "d22", "d23", "d24", "d25", "d26", "d27", "d28", "d29",
+-	  "cc", "memory"
+-        );
+-}
+-
+-static void
+-neon_composite_over_n_0565 (pixman_implementation_t * impl,
+-                            pixman_op_t               op,
+-                            pixman_image_t *          src_image,
+-                            pixman_image_t *          mask_image,
+-                            pixman_image_t *          dst_image,
+-                            int32_t                   src_x,
+-                            int32_t                   src_y,
+-                            int32_t                   mask_x,
+-                            int32_t                   mask_y,
+-                            int32_t                   dest_x,
+-                            int32_t                   dest_y,
+-                            int32_t                   width,
+-                            int32_t                   height)
+-{
+-    uint32_t src, srca;
+-    uint16_t    *dst_line, *aligned_line;
+-    uint32_t dst_stride;
+-    uint32_t kernel_count, copy_count, copy_tail;
+-    uint8_t kernel_offset, copy_offset;
+-
+-    src = _pixman_image_get_solid (src_image, dst_image->bits.format);
+-
+-    /* bail out if fully transparent */
+-    srca = src >> 24;
+-    if (src == 0)
+-	return;
+-    
+-    if (width == 0 || height == 0)
+-	return;
+-
+-    if (width > NEON_SCANLINE_BUFFER_PIXELS)
+-    {
+-	/* split the blit, so we can use a fixed-size scanline buffer *
+-	 * TODO: there must be a more elegant way of doing this.
+-	 */
+-	int x;
+-	
+-	for (x = 0; x < width; x += NEON_SCANLINE_BUFFER_PIXELS)
+-	{
+-	    neon_composite_over_n_0565 (
+-		impl, op,
+-		src_image, mask_image, dst_image,
+-		src_x + x, src_y, mask_x + x, mask_y, dest_x + x, dest_y,
+-		(x + NEON_SCANLINE_BUFFER_PIXELS > width) ? width - x : NEON_SCANLINE_BUFFER_PIXELS, height);
+-	}
+-	return;
+-    }
+-
+-    PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, uint16_t, dst_stride, dst_line, 1);
+-
+-    /* keep within minimum number of aligned quadwords on width
+-     * while also keeping the minimum number of columns to process
+-     */
+-    {
+-	unsigned long aligned_left = (unsigned long)(dst_line) & ~0xF;
+-	unsigned long aligned_right = (((unsigned long)(dst_line + width)) + 0xF) & ~0xF;
+-	unsigned long ceiling_length = (((unsigned long) width) * sizeof(*dst_line) + 0xF) & ~0xF;
+-
+-	/* the fast copy should be quadword aligned */
+-	copy_offset = dst_line - ((uint16_t*) aligned_left);
+-	aligned_line = dst_line - copy_offset;
+-	copy_count = (uint32_t) ((aligned_right - aligned_left) >> 4);
+-	copy_tail = 0;
+-
+-	if (aligned_right - aligned_left > ceiling_length)
+-	{
+-	    /* unaligned routine is tightest */
+-	    kernel_count = (uint32_t) (ceiling_length >> 4);
+-	    kernel_offset = copy_offset;
+-	}
+-	else
+-	{
+-	    /* aligned routine is equally tight, so it is safer to align */
+-	    kernel_count = copy_count;
+-	    kernel_offset = 0;
+-	}
+-
+-	/* We should avoid reading beyond scanline ends for safety */
+-	if (aligned_line < (dst_line - dest_x) ||
+-	    (aligned_line + (copy_count * 16 / sizeof(*dst_line))) > ((dst_line - dest_x) + dst_image->bits.width))
+-	{
+-	    /* switch to precise read */
+-	    copy_offset = kernel_offset = 0;
+-	    aligned_line = dst_line;
+-	    kernel_count = (uint32_t) (ceiling_length >> 4);
+-	    copy_count = (width * sizeof(*dst_line)) >> 4;
+-	    copy_tail = (width * sizeof(*dst_line)) & 0xF;
+-	}
+-    }
+-
+-    {
+-	uint16_t scan_line[NEON_SCANLINE_BUFFER_PIXELS + 8];  /* deliberately not initialised */
+-
+-	/* row-major order */
+-	/* left edge, middle block, right edge */
+-	for ( ; height--; aligned_line += dst_stride, dst_line += dst_stride)
+-	{
+-	    /* Uncached framebuffer access is really, really slow if we do it piecemeal.
+-	     * It should be much faster if we grab it all at once.
+-	     * One scanline should easily fit in L1 cache, so this should
+-	     * not waste RAM bandwidth.
+-	     */
+-	    neon_quadword_copy (scan_line, aligned_line, copy_count, copy_tail);
+-
+-	    /* Apply the actual filter */
+-	    plain_over_565_8_pix_neon (
+-		src, scan_line + kernel_offset, 8 * sizeof(*dst_line), kernel_count);
+-
+-	    /* Copy the modified scanline back */
+-	    neon_quadword_copy (
+-		dst_line, scan_line + copy_offset, width >> 3, (width & 7) * 2);
+-	}
+-    }
+-}
+-
+-static inline void
+-ARGB8_over_565_8_pix_neon (uint32_t *src,
+-                           uint16_t *dest,
+-                           uint32_t  src_stride,     /* bytes, not elements */
+-                           uint32_t  count           /* 8-pixel groups */)
+-{
+-    asm volatile (
+-        "0:	@ loop\n"
+-        "	pld   [%[src], %[src_stride]]         @ preload from next scanline	\n"
+-        "	vld1.16   {d0, d1}, [%[dest]]         @ load pixels from framebuffer	\n"
+-        "	vld4.8   {d20, d21, d22, d23},[%[src]]! @ load source image pixels		\n"
+-        "	vsli.u16  q3, q0, #5                 @ duplicate framebuffer blue bits		\n"
+-        "	vshrn.u16 d2, q0, #8                 @ unpack red from framebuffer pixels	\n"
+-        "	vshrn.u16 d4, q0, #3                 @ unpack green				\n"
+-        "	vmvn      d18, d23                   @ we need the inverse alpha for the background	\n"
+-        "	vsri.u8   d2, d2, #5                 @ duplicate red bits (extend 5 to 8)	\n"
+-        "	vshrn.u16 d6, q3, #2                 @ unpack extended blue (truncate 10 to 8)	\n"
+-        "	vsri.u8   d4, d4, #6                 @ duplicate green bits (extend 6 to 8)	\n"
+-        "	vmull.u8  q1, d2, d18                @ apply inverse alpha to background red...	\n"
+-        "	vmull.u8  q2, d4, d18                @ ...green...				\n"
+-        "	vmull.u8  q3, d6, d18                @ ...blue					\n"
+-        "	subs      %[count], %[count], #1     @ decrement/test loop counter		\n"
+-        "	vmlal.u8  q1, d23, d22               @ add blended foreground red...		\n"
+-        "	vmlal.u8  q2, d23, d21               @ ...green...				\n"
+-        "	vmlal.u8  q3, d23, d20               @ ...blue					\n"
+-        "	vsri.16   q1, q2, #5                 @ pack green behind red			\n"
+-        "	vsri.16   q1, q3, #11                @ pack blue into pixels			\n"
+-        "	vst1.16   {d2, d3}, [%[dest]]!        @ store composited pixels			\n"
+-        "	bne 0b                               @ next please				\n"
+-
+-        /* Clobbered registers marked as input/outputs */
+-	: [dest] "+r" (dest), [src] "+r" (src), [count] "+r" (count)
+-
+-	  /* Inputs */
+-	: [src_stride] "r" (src_stride)
+-
+-	  /* Clobbers, including the inputs we modify, and potentially lots of memory */
+-	: "d0", "d1", "d2", "d3", "d4", "d5", "d6", "d7", "d17", "d18", "d20",
+-	  "d21", "d22", "d23", "cc", "memory"
+-        );
+-}
+-
+-static void
+-neon_composite_over_8888_0565 (pixman_implementation_t * impl,
+-                               pixman_op_t               op,
+-                               pixman_image_t *          src_image,
+-                               pixman_image_t *          mask_image,
+-                               pixman_image_t *          dst_image,
+-                               int32_t                   src_x,
+-                               int32_t                   src_y,
+-                               int32_t                   mask_x,
+-                               int32_t                   mask_y,
+-                               int32_t                   dest_x,
+-                               int32_t                   dest_y,
+-                               int32_t                   width,
+-                               int32_t                   height)
+-{
+-    uint32_t    *src_line;
+-    uint16_t    *dst_line, *aligned_line;
+-    uint32_t dst_stride, src_stride;
+-    uint32_t kernel_count, copy_count, copy_tail;
+-    uint8_t kernel_offset, copy_offset;
+-
+-    /* we assume mask is opaque 
+-     * so the only alpha to deal with is embedded in src
+-     */
+-    if (width > NEON_SCANLINE_BUFFER_PIXELS)
+-    {
+-	/* split the blit, so we can use a fixed-size scanline buffer */
+-	int x;
+-	for (x = 0; x < width; x += NEON_SCANLINE_BUFFER_PIXELS)
+-	{
+-	    neon_composite_over_8888_0565 (
+-		impl, op,
+-		src_image, mask_image, dst_image,
+-		src_x + x, src_y, mask_x + x, mask_y, dest_x + x, dest_y,
+-		(x + NEON_SCANLINE_BUFFER_PIXELS > width) ? width - x : NEON_SCANLINE_BUFFER_PIXELS, height);
+-	}
+-	return;
+-    }
+-
+-    PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, uint16_t, dst_stride, dst_line, 1);
+-    PIXMAN_IMAGE_GET_LINE (src_image, src_x, src_y, uint32_t, src_stride, src_line, 1);
+-
+-    /* keep within minimum number of aligned quadwords on width
+-     * while also keeping the minimum number of columns to process
+-     */
+-    {
+-	unsigned long aligned_left = (unsigned long)(dst_line) & ~0xF;
+-	unsigned long aligned_right = (((unsigned long)(dst_line + width)) + 0xF) & ~0xF;
+-	unsigned long ceiling_length = (((unsigned long) width) * sizeof(*dst_line) + 0xF) & ~0xF;
+-
+-	/* the fast copy should be quadword aligned */
+-	copy_offset = dst_line - ((uint16_t*) aligned_left);
+-	aligned_line = dst_line - copy_offset;
+-	copy_count = (uint32_t) ((aligned_right - aligned_left) >> 4);
+-	copy_tail = 0;
+-
+-	if (aligned_right - aligned_left > ceiling_length)
+-	{
+-	    /* unaligned routine is tightest */
+-	    kernel_count = (uint32_t) (ceiling_length >> 4);
+-	    kernel_offset = copy_offset;
+-	}
+-	else
+-	{
+-	    /* aligned routine is equally tight, so it is safer to align */
+-	    kernel_count = copy_count;
+-	    kernel_offset = 0;
+-	}
+-
+-	/* We should avoid reading beyond scanline ends for safety */
+-	if (aligned_line < (dst_line - dest_x) ||
+-	    (aligned_line + (copy_count * 16 / sizeof(*dst_line))) > ((dst_line - dest_x) + dst_image->bits.width))
+-	{
+-	    /* switch to precise read */
+-	    copy_offset = kernel_offset = 0;
+-	    aligned_line = dst_line;
+-	    kernel_count = (uint32_t) (ceiling_length >> 4);
+-	    copy_count = (width * sizeof(*dst_line)) >> 4;
+-	    copy_tail = (width * sizeof(*dst_line)) & 0xF;
+-	}
+-    }
+-
+-    /* Preload the first input scanline */
+-    {
+-	uint8_t *src_ptr = (uint8_t*) src_line;
+-	uint32_t count = (width + 15) / 16;
+-
+-#ifdef USE_GCC_INLINE_ASM
+-	asm volatile (
+-	    "0: @ loop						\n"
+-	    "	subs    %[count], %[count], #1			\n"
+-	    "	pld     [%[src]]				\n"
+-	    "	add     %[src], %[src], #64			\n"
+-	    "	bgt 0b						\n"
+-
+-	    /* Clobbered input registers marked as input/outputs */
+-	    : [src] "+r" (src_ptr), [count] "+r" (count)
+-	    :     /* no unclobbered inputs */
+-	    : "cc"
+-	    );
+-#else
+-	do
+-	{
+-	    __pld (src_ptr);
+-	    src_ptr += 64;
+-	}
+-	while (--count);
+-#endif
+-    }
+-
+-    {
+-	uint16_t scan_line[NEON_SCANLINE_BUFFER_PIXELS + 8]; /* deliberately not initialised */
+-
+-	/* row-major order */
+-	/* left edge, middle block, right edge */
+-	for ( ; height--; src_line += src_stride, aligned_line += dst_stride)
+-	{
+-	    /* Uncached framebuffer access is really, really slow if we do
+-	     * it piecemeal. It should be much faster if we grab it all at
+-	     * once. One scanline should easily fit in L1 cache, so this
+-	     * should not waste RAM bandwidth.
+-	     */
+-	    neon_quadword_copy (scan_line, aligned_line, copy_count, copy_tail);
+-
+-	    /* Apply the actual filter */
+-	    ARGB8_over_565_8_pix_neon (
+-		src_line, scan_line + kernel_offset,
+-		src_stride * sizeof(*src_line), kernel_count);
+-
+-	    /* Copy the modified scanline back */
+-	    neon_quadword_copy (dst_line,
+-				scan_line + copy_offset,
+-				width >> 3, (width & 7) * 2);
+-	}
+-    }
+-}
+-
+-#endif  /* USE_GCC_INLINE_ASM */
+-
+ static const pixman_fast_path_t arm_neon_fast_path_array[] =
+ {
+     { PIXMAN_OP_ADD,  PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8,       neon_composite_add_8888_8_8,     0 },
+@@ -2612,12 +1908,6 @@ static const pixman_fast_path_t arm_neon_fast_path_array[] =
+ #ifdef USE_GCC_INLINE_ASM
+     { PIXMAN_OP_SRC,  PIXMAN_r5g6b5,   PIXMAN_null,     PIXMAN_r5g6b5,   neon_composite_src_16_16,        0 },
+     { PIXMAN_OP_SRC,  PIXMAN_b5g6r5,   PIXMAN_null,     PIXMAN_b5g6r5,   neon_composite_src_16_16,        0 },
+-#if 0 /* this code has some bugs */
+-    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_null,     PIXMAN_r5g6b5,   neon_composite_over_n_0565,      0 },
+-    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_null,     PIXMAN_b5g6r5,   neon_composite_over_n_0565,      0 },
+-    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_r5g6b5,   neon_composite_over_8888_0565,   0 },
+-    { PIXMAN_OP_OVER, PIXMAN_a8b8g8r8, PIXMAN_null,     PIXMAN_b5g6r5,   neon_composite_over_8888_0565,   0 },
+-#endif
+ #endif
+     { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_a8r8g8b8, neon_composite_over_8888_8888,   0 },
+     { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_x8r8g8b8, neon_composite_over_8888_8888,   0 },
+@@ -2668,79 +1958,6 @@ arm_neon_composite (pixman_implementation_t *imp,
+ }
+ 
+ static pixman_bool_t
+-pixman_blt_neon (void *src_bits,
+-                 void *dst_bits,
+-                 int   src_stride,
+-                 int   dst_stride,
+-                 int   src_bpp,
+-                 int   dst_bpp,
+-                 int   src_x,
+-                 int   src_y,
+-                 int   dst_x,
+-                 int   dst_y,
+-                 int   width,
+-                 int   height)
+-{
+-    if (!width || !height)
+-	return TRUE;
+-
+-    /* accelerate only straight copies involving complete bytes */
+-    if (src_bpp != dst_bpp || (src_bpp & 7))
+-	return FALSE;
+-
+-    {
+-	uint32_t bytes_per_pixel = src_bpp >> 3;
+-	uint32_t byte_width = width * bytes_per_pixel;
+-	/* parameter is in words for some reason */
+-	int32_t src_stride_bytes = src_stride * 4;
+-	int32_t dst_stride_bytes = dst_stride * 4;
+-	uint8_t *src_bytes = ((uint8_t*) src_bits) +
+-	    src_y * src_stride_bytes + src_x * bytes_per_pixel;
+-	uint8_t *dst_bytes = ((uint8_t*) dst_bits) +
+-	    dst_y * dst_stride_bytes + dst_x * bytes_per_pixel;
+-	uint32_t quadword_count = byte_width / 16;
+-	uint32_t offset         = byte_width % 16;
+-
+-	while (height--)
+-	{
+-	    neon_quadword_copy (dst_bytes, src_bytes, quadword_count, offset);
+-	    src_bytes += src_stride_bytes;
+-	    dst_bytes += dst_stride_bytes;
+-	}
+-    }
+-
+-    return TRUE;
+-}
+-
+-static pixman_bool_t
+-arm_neon_blt (pixman_implementation_t *imp,
+-              uint32_t *               src_bits,
+-              uint32_t *               dst_bits,
+-              int                      src_stride,
+-              int                      dst_stride,
+-              int                      src_bpp,
+-              int                      dst_bpp,
+-              int                      src_x,
+-              int                      src_y,
+-              int                      dst_x,
+-              int                      dst_y,
+-              int                      width,
+-              int                      height)
+-{
+-    if (pixman_blt_neon (
+-            src_bits, dst_bits, src_stride, dst_stride, src_bpp, dst_bpp,
+-            src_x, src_y, dst_x, dst_y, width, height))
+-    {
+-	return TRUE;
+-    }
+-
+-    return _pixman_implementation_blt (
+-               imp->delegate,
+-               src_bits, dst_bits, src_stride, dst_stride, src_bpp, dst_bpp,
+-               src_x, src_y, dst_x, dst_y, width, height);
+-}
+-
+-static pixman_bool_t
+ arm_neon_fill (pixman_implementation_t *imp,
+                uint32_t *               bits,
+                int                      stride,
+@@ -2765,9 +1982,6 @@ _pixman_implementation_create_arm_neon (void)
+     pixman_implementation_t *imp = _pixman_implementation_create (simd);
+ 
+     imp->composite = arm_neon_composite;
+-#if 0 /* this code has some bugs */
+-    imp->blt = arm_neon_blt;
+-#endif
+     imp->fill = arm_neon_fill;
+ 
+     return imp;
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/src-8888-0565.patch b/recipes/obsolete/xorg/xorg-lib/pixman/src-8888-0565.patch
new file mode 100644
index 0000000..c544225
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/src-8888-0565.patch
@@ -0,0 +1,324 @@
+From 6494f9ae8820078d0e6109bf8f294156f7a5da4c Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Fri, 05 Mar 2010 00:40:34 +0000
+Subject: ARM: added 'armv6_composite_src_8888_0565' fast path
+
+Provides ~3x performance improvement when working with
+data in L1 cache, and ~80% performace improvement when working
+with memory. This fast path is important for 32bpp -> 16bpp
+color format conversion and is commonly used with 16bpp desktop.
+
+Microbenchmark from N800 (ARM11 @ 400MHz), measured in MPix/s:
+
+before:
+
+ src_8888_0565 = L1:  21.54 M: 15.62
+
+after (armv4):
+
+ src_8888_0565 = L1:  45.26 M: 23.29
+
+after (armv6):
+
+ src_8888_0565 = L1:  60.62 M: 28.37
+---
+diff --git a/pixman/pixman-arm-simd.c b/pixman/pixman-arm-simd.c
+index c375c01..69243c1 100644
+--- a/pixman/pixman-arm-simd.c
++++ b/pixman/pixman-arm-simd.c
+@@ -604,6 +604,282 @@ armv6_composite_over_n_8_0565 (pixman_implementation_t * impl,
+ 	dst_stride - width, mask_stride - width, height);
+ }
+ 
++static inline void
++armv4_composite_src_8888_0565_asm (
++    uint16_t *dst, uint32_t *src, int w, int dst_stride,
++    int src_stride, int h)
++{
++    uint32_t a, x, y, c1F001F = 0x1F001F, cFFFF = 0xFFFF;
++    int backup_w = w;
++    while (h--)
++    {
++        w = backup_w;
++        if (w > 0 && (uintptr_t)dst & 2)
++        {
++            x = *src++;
++
++            a = (x >> 3) & c1F001F;
++            x &= 0xFC00;
++            a |= a >> 5;
++            a |= x >> 5;
++
++            *dst++ = a;
++            w--;
++        }
++
++        asm volatile(
++            "subs  %[w], %[w], #2\n"
++            "blt   2f\n"
++        "1:\n"
++            "ldr   %[x], [%[src]], #4\n"
++            "ldr   %[y], [%[src]], #4\n"
++            "subs  %[w], %[w], #2\n"
++
++            "and   %[a], %[c1F001F], %[x], lsr #3\n"
++            "and   %[x], %[x], #0xFC00\n\n"
++            "orr   %[a], %[a], %[a], lsr #5\n"
++            "orr   %[x], %[a], %[x], lsr #5\n"
++
++            "and   %[a], %[c1F001F], %[y], lsr #3\n"
++            "and   %[y], %[y], #0xFC00\n\n"
++            "orr   %[a], %[a], %[a], lsr #5\n"
++            "orr   %[y], %[a], %[y], lsr #5\n"
++            /*
++             * Writing single 32-bit value is much faster than two
++             * separate 16-bit values for older CPUs without (efficient)
++             * write combining, even though it costs an extra instruction.
++             */
++            "and   %[x], %[x], %[cFFFF]\n"
++            "orr   %[x], %[x], %[y], lsl #16\n"
++            "str   %[x], [%[dst]], #4\n"
++            "bge   1b\n"
++        "2:\n"
++        : [c1F001F] "+&r" (c1F001F), [cFFFF] "+&r" (cFFFF),
++          [src] "+&r" (src), [dst] "+&r" (dst), [a] "=&r" (a),
++          [x] "=&r" (x), [y] "=&r" (y), [w] "+&r" (w)
++        );
++
++        if (w & 1)
++        {
++            x = *src++;
++
++            a = (x >> 3) & c1F001F;
++            x = x & 0xFC00;
++            a |= a >> 5;
++            a |= x >> 5;
++
++            *dst++ = a;
++        }
++
++        src += src_stride - backup_w;
++        dst += dst_stride - backup_w;
++    }
++}
++
++/*
++ * Conversion x8r8g8b8 -> r5g6b5
++ *
++ * Note: 'w' must be >= 7 here
++ */
++static void __attribute__((naked))
++armv6_composite_src_8888_0565_asm (
++    uint16_t *dst, uint32_t *src, int w, int dst_stride,
++    int src_stride, int h)
++{
++    asm volatile(
++        /* define supplementary macros */
++        ".macro cvt8888to565 PIX\n"
++            "and   A, C1F001F, \\PIX, lsr #3\n"
++            "and   \\PIX, \\PIX, #0xFC00\n\n"
++            "orr   A, A, A, lsr #5\n"
++            "orr   \\PIX, A, \\PIX, lsr #5\n"
++        ".endm\n"
++
++        ".macro combine_pixels_pair PIX1, PIX2\n"
++            /* Note: assume little endian byte order */
++            "pkhbt \\PIX1, \\PIX1, \\PIX2, lsl #16\n"
++        ".endm\n"
++
++        /* function entry, save all registers (10 words) to stack */
++        "stmdb   sp!, {r4-r11, ip, lr}\n"
++
++        /* define some aliases */
++        "DST     .req  r0\n"
++        "SRC     .req  r1\n"
++        "W       .req  r2\n"
++        "H       .req  r3\n"
++
++        "TMP1    .req  r4\n"
++        "TMP2    .req  r5\n"
++        "TMP3    .req  r6\n"
++        "TMP4    .req  r7\n"
++        "TMP5    .req  r8\n"
++        "TMP6    .req  r9\n"
++        "TMP7    .req  r10\n"
++        "TMP8    .req  r11\n"
++
++        "C1F001F .req  ip\n"
++        "A       .req  lr\n"
++
++        "ldr     TMP1, [sp, #(10*4+0)]\n" /* load src_stride */
++        "ldr     C1F001F, =0x1F001F\n"
++        "sub     r3, r3, W\n"
++        "str     r3, [sp, #(10*4+0)]\n" /* store (dst_stride-w) */
++        "ldr     r3, [sp, #(10*4+4)]\n" /* load h */
++        "sub     TMP1, TMP1, W\n"
++        "str     TMP1, [sp, #(10*4+4)]\n" /* store (src_stride-w) */
++
++        "str     W, [sp, #(8*4)]\n" /* saved ip = W */
++
++    "0:\n"
++        "subs    H, H, #1\n"
++        "blt     6f\n"
++    "1:\n"
++        /* align DST at 4 byte boundary */
++        "tst     DST, #2\n"
++        "beq     2f\n"
++        "ldr     TMP1, [SRC], #4\n"
++        "sub     W, W, #1\n"
++        "cvt8888to565 TMP1\n"
++        "strh    TMP1, [DST], #2\n"
++    "2:"
++        /* align DST at 8 byte boundary */
++        "tst     DST, #4\n"
++        "beq     2f\n"
++        "ldmia   SRC!, {TMP1, TMP2}\n"
++        "sub     W, W, #2\n"
++        "cvt8888to565 TMP1\n"
++        "cvt8888to565 TMP2\n"
++        "combine_pixels_pair TMP1, TMP2\n"
++        "str     TMP1, [DST], #4\n"
++    "2:"
++        /* align DST at 16 byte boundary */
++        "tst     DST, #8\n"
++        "beq     2f\n"
++        "ldmia   SRC!, {TMP1, TMP2, TMP3, TMP4}\n"
++        "sub     W, W, #4\n"
++        "cvt8888to565 TMP1\n"
++        "cvt8888to565 TMP2\n"
++        "cvt8888to565 TMP3\n"
++        "cvt8888to565 TMP4\n"
++        "combine_pixels_pair TMP1, TMP2\n"
++        "combine_pixels_pair TMP3, TMP4\n"
++        "stmia DST!, {TMP1, TMP3}\n"
++    "2:"
++        /* inner loop, process 8 pixels per iteration */
++        "subs    W, W, #8\n"
++        "blt     4f\n"
++    "3:\n"
++        "ldmia   SRC!, {TMP1, TMP2, TMP3, TMP4, TMP5, TMP6, TMP7, TMP8}\n"
++        "subs    W, W, #8\n"
++        "cvt8888to565 TMP1\n"
++        "cvt8888to565 TMP2\n"
++        "cvt8888to565 TMP3\n"
++        "cvt8888to565 TMP4\n"
++        "cvt8888to565 TMP5\n"
++        "cvt8888to565 TMP6\n"
++        "cvt8888to565 TMP7\n"
++        "cvt8888to565 TMP8\n"
++        "combine_pixels_pair TMP1, TMP2\n"
++        "combine_pixels_pair TMP3, TMP4\n"
++        "combine_pixels_pair TMP5, TMP6\n"
++        "combine_pixels_pair TMP7, TMP8\n"
++        "stmia   DST!, {TMP1, TMP3, TMP5, TMP7}\n"
++        "bge     3b\n"
++    "4:\n"
++
++        /* process the remaining pixels */
++        "tst     W, #4\n"
++        "beq     4f\n"
++        "ldmia   SRC!, {TMP1, TMP2, TMP3, TMP4}\n"
++        "cvt8888to565 TMP1\n"
++        "cvt8888to565 TMP2\n"
++        "cvt8888to565 TMP3\n"
++        "cvt8888to565 TMP4\n"
++        "combine_pixels_pair TMP1, TMP2\n"
++        "combine_pixels_pair TMP3, TMP4\n"
++        "stmia   DST!, {TMP1, TMP3}\n"
++    "4:\n"
++        "tst     W, #2\n"
++        "beq     4f\n"
++        "ldmia   SRC!, {TMP1, TMP2}\n"
++        "cvt8888to565 TMP1\n"
++        "cvt8888to565 TMP2\n"
++        "combine_pixels_pair TMP1, TMP2\n"
++        "str     TMP1, [DST], #4\n"
++    "4:\n"
++        "tst     W, #1\n"
++        "beq     4f\n"
++        "ldr     TMP1, [SRC], #4\n"
++        "cvt8888to565 TMP1\n"
++        "strh    TMP1, [DST], #2\n"
++    "4:\n"
++        "ldr     TMP1, [sp, #(10*4+0)]\n" /* (dst_stride-w) */
++        "ldr     TMP2, [sp, #(10*4+4)]\n" /* (src_stride-w) */
++        "ldr     W, [sp, #(8*4)]\n"
++        "subs    H, H, #1\n"
++        "add     DST, DST, TMP1, lsl #1\n"
++        "add     SRC, SRC, TMP2, lsl #2\n"
++        "bge     1b\n"
++    "6:\n"
++        /* restore all registers and return */
++        "ldmia   sp!, {r4-r11, ip, pc}\n"
++        ".ltorg\n"
++
++        ".unreq   DST\n"
++        ".unreq   SRC\n"
++        ".unreq   W\n"
++        ".unreq   H\n"
++
++        ".unreq   TMP1\n"
++        ".unreq   TMP2\n"
++        ".unreq   TMP3\n"
++        ".unreq   TMP4\n"
++        ".unreq   TMP5\n"
++        ".unreq   TMP6\n"
++        ".unreq   TMP7\n"
++        ".unreq   TMP8\n"
++
++        ".unreq   C1F001F\n"
++        ".unreq   A\n"
++
++        ".purgem  cvt8888to565\n"
++        ".purgem  combine_pixels_pair\n"
++    );
++}
++
++static void
++armv6_composite_src_8888_0565 (pixman_implementation_t * impl,
++			       pixman_op_t               op,
++			       pixman_image_t *          src_image,
++			       pixman_image_t *          mask_image,
++			       pixman_image_t *          dst_image,
++			       int32_t                   src_x,
++			       int32_t                   src_y,
++			       int32_t                   mask_x,
++			       int32_t                   mask_y,
++			       int32_t                   dest_x,
++			       int32_t                   dest_y,
++			       int32_t                   width,
++			       int32_t                   height)
++{
++    uint32_t *src;
++    uint16_t *dst;
++    int src_stride, dst_stride;
++
++    PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, uint16_t,
++			   dst_stride, dst, 1);
++    PIXMAN_IMAGE_GET_LINE (src_image, src_x, src_y, uint32_t,
++			   src_stride, src, 1);
++
++    if (width < 7)
++	armv4_composite_src_8888_0565_asm (dst, src, width,
++					   dst_stride, src_stride, height);
++    else
++	armv6_composite_src_8888_0565_asm (dst, src, width,
++					   dst_stride, src_stride, height);
++}
++
+ #endif
+ 
+ static const pixman_fast_path_t arm_simd_fast_paths[] =
+@@ -624,6 +900,10 @@ static const pixman_fast_path_t arm_simd_fast_paths[] =
+ #if defined(__ARM_EABI__) && defined(__linux__)
+     PIXMAN_STD_FAST_PATH (OVER, solid, a8, r5g6b5, armv6_composite_over_n_8_0565),
+     PIXMAN_STD_FAST_PATH (OVER, solid, a8, b5g6r5, armv6_composite_over_n_8_0565),
++    PIXMAN_STD_FAST_PATH (SRC, a8r8g8b8, null, r5g6b5, armv6_composite_src_8888_0565),
++    PIXMAN_STD_FAST_PATH (SRC, x8r8g8b8, null, r5g6b5, armv6_composite_src_8888_0565),
++    PIXMAN_STD_FAST_PATH (SRC, a8b8g8r8, null, b5g6r5, armv6_composite_src_8888_0565),
++    PIXMAN_STD_FAST_PATH (SRC, x8b8g8r8, null, b5g6r5, armv6_composite_src_8888_0565),
+ #endif
+     { PIXMAN_OP_NONE },
+ };
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman/tls.patch b/recipes/obsolete/xorg/xorg-lib/pixman/tls.patch
new file mode 100644
index 0000000..316caed
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman/tls.patch
@@ -0,0 +1,59 @@
+From 714559dccda3165a72f0a9935c1edc3aef535f30 Mon Sep 17 00:00:00 2001
+From: Søren Sandmann Pedersen <ssp@redhat.com>
+Date: Wed, 07 Apr 2010 05:44:12 +0000
+Subject: Fixes for pthread thread local storage.
+
+The tls_name_key variable is passed to tls_name_get(), and the first
+time this happens it isn't initialized. tls_name_get() then passes it
+on to tls_name_alloc() which passes it on to pthread_setspecific()
+leading to undefined behavior.
+
+None of this is actually necessary at all because there is only one
+such variable per thread local variable, so it doesn't need to passed
+as a parameter at all.
+
+All of this was pointed out by Tor Lillqvist on the cairo mailing
+list.
+---
+diff --git a/pixman/pixman-compiler.h b/pixman/pixman-compiler.h
+index cdac0d8..531c8c9 100644
+--- a/pixman/pixman-compiler.h
++++ b/pixman/pixman-compiler.h
+@@ -99,16 +99,16 @@
+     }									\
+ 									\
+     static type *							\
+-    tls_ ## name ## _alloc (key)					\
++    tls_ ## name ## _alloc (void)					\
+     {									\
+ 	type *value = calloc (1, sizeof (type));			\
+ 	if (value)							\
+-	    pthread_setspecific (key, value);				\
++	    pthread_setspecific (tls_ ## name ## _key, value);		\
+ 	return value;							\
+     }									\
+ 									\
+     static force_inline type *						\
+-    tls_ ## name ## _get (key)						\
++    tls_ ## name ## _get (void)						\
+     {									\
+ 	type *value = NULL;						\
+ 	if (pthread_once (&tls_ ## name ## _once_control,		\
+@@ -116,13 +116,13 @@
+ 	{								\
+ 	    value = pthread_getspecific (tls_ ## name ## _key);		\
+ 	    if (!value)							\
+-		value = tls_ ## name ## _alloc (key);			\
++		value = tls_ ## name ## _alloc ();			\
+ 	}								\
+ 	return value;							\
+     }
+ 
+ #   define PIXMAN_GET_THREAD_LOCAL(name)				\
+-    tls_ ## name ## _get (tls_ ## name ## _key)
++    tls_ ## name ## _get ()
+ 
+ #else
+ 
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman_0.10.0.bb b/recipes/obsolete/xorg/xorg-lib/pixman_0.10.0.bb
new file mode 100644
index 0000000..8690818
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman_0.10.0.bb
@@ -0,0 +1,5 @@
+require pixman.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "41804ac38025102dcc9891dfd4a3d105"
+SRC_URI[archive.sha256sum] = "48625f6b5ce130672942503c683d306d957ee40f59f8e59be6ca30a245ad47d0"
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman_0.11.4.bb b/recipes/obsolete/xorg/xorg-lib/pixman_0.11.4.bb
new file mode 100644
index 0000000..b058104
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman_0.11.4.bb
@@ -0,0 +1,7 @@
+require pixman.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8c8afc259af61d42aa9b3d8ec5a9a03b"
+SRC_URI[archive.sha256sum] = "d034f4afb4329c38e8789a5a7a384194c7402094b4c2b7600d2d86d8589e8571"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman_0.11.8.bb b/recipes/obsolete/xorg/xorg-lib/pixman_0.11.8.bb
new file mode 100644
index 0000000..d7c6717
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman_0.11.8.bb
@@ -0,0 +1,9 @@
+require pixman.inc
+PR = "${INC_PR}.0"
+
+SRC_URI += " \
+           file://pixman-arm.patch \
+           file://pixman-x888-565.patch \
+          "
+SRC_URI[archive.md5sum] = "7b5db768c51337b5e5e954fc9c961cd3"
+SRC_URI[archive.sha256sum] = "720db5ef6ed0e744b9bac5360ade9a7c024f9fb3fab05c83a90ee28b08e66e01"
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman_0.15.18.bb b/recipes/obsolete/xorg/xorg-lib/pixman_0.15.18.bb
new file mode 100644
index 0000000..4811a01
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman_0.15.18.bb
@@ -0,0 +1,7 @@
+require pixman.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9b60fe7623621b546b76777b8b7d2490"
+SRC_URI[archive.sha256sum] = "3a5003cf6c7d5b03ed5977c108ee11410cfd7849eea370eb4feae98f2822c795"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman_0.15.6.bb b/recipes/obsolete/xorg/xorg-lib/pixman_0.15.6.bb
new file mode 100644
index 0000000..a09de4e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman_0.15.6.bb
@@ -0,0 +1,7 @@
+require pixman.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fe922698df46b21d7e19f28ded4ca100"
+SRC_URI[archive.sha256sum] = "3438437c131c9847b34106225a728c11e522776ac454bb8740a9bc7aea409f22"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman_0.17.12.bb b/recipes/obsolete/xorg/xorg-lib/pixman_0.17.12.bb
new file mode 100644
index 0000000..b476aaa
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman_0.17.12.bb
@@ -0,0 +1,24 @@
+require pixman.inc
+PR = "${INC_PR}.0"
+
+SRC_URI += "\
+           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
+           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
+           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
+           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
+           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
+           file://0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch \
+           file://over-n-8-0565.patch \
+           file://src-8888-0565.patch \
+"
+SRC_URI[archive.md5sum] = "331415d7a110145cf27aa00e11d0a683"
+SRC_URI[archive.sha256sum] = "8cce103af1b4200a13bedca5b763f74c9bc99a55985ab44ca92ba532dac6b57f"
+
+NEON = " --disable-arm-neon "
+NEON_armv7a = " "
+
+EXTRA_OECONF = "${NEON} --disable-gtk"
+
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_angstrom = "2"
+DEFAULT_PREFERENCE_shr = "2"
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman_0.17.8.bb b/recipes/obsolete/xorg/xorg-lib/pixman_0.17.8.bb
new file mode 100644
index 0000000..55c70c8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman_0.17.8.bb
@@ -0,0 +1,23 @@
+require pixman.inc
+PR = "${INC_PR}.0"
+
+SRC_URI += " \
+           file://0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
+           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
+           file://0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
+           file://0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
+           file://1-composite.patch \
+           file://2-composite.patch \
+           file://3-composite.patch \
+          "
+SRC_URI[archive.md5sum] = "a7deb2ff6b286b676d67aa6ae91317ae"
+SRC_URI[archive.sha256sum] = "ea24e9003455a0881bd43bf7e4169f2b34c90c8521405103e3490553876a81b4"
+
+NEON = " --disable-arm-neon "
+NEON_armv7a = " "
+
+EXTRA_OECONF = "${NEON} --disable-gtk"
+
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_angstrom = "2"
+DEFAULT_PREFERENCE_shr = "2"
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman_0.18.0.bb b/recipes/obsolete/xorg/xorg-lib/pixman_0.18.0.bb
new file mode 100644
index 0000000..c099b77
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman_0.18.0.bb
@@ -0,0 +1,24 @@
+require pixman.inc
+PR = "${INC_PR}.3"
+
+SRC_URI += "\
+           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
+           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
+           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
+           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
+           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
+           file://calloc.patch \
+           file://tls.patch \
+           file://565-scanline.patch \
+           file://missing-cache-preload.diff \
+"
+SRC_URI[archive.md5sum] = "a4fb870fc325be258089f1683642e976"
+SRC_URI[archive.sha256sum] = "b305291bba3d9271a4481e5eedf901025ac8ba4ec8f7b76ccafc5094610cd4ff"
+
+NEON = " --disable-arm-neon "
+NEON_armv7a = " "
+
+EXTRA_OECONF = "${NEON} --disable-gtk"
+
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_shr = "2"
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman_0.9.4.bb b/recipes/obsolete/xorg/xorg-lib/pixman_0.9.4.bb
new file mode 100644
index 0000000..254bf61
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman_0.9.4.bb
@@ -0,0 +1,7 @@
+require xorg-lib-common.inc
+DESCRIPTION = "Library for lowlevel pixel operations"
+DEPENDS = "virtual/libx11"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c354ab5b0da10227226d3ef604254875"
+SRC_URI[archive.sha256sum] = "261d239e9e3070a0a81e5b3eab92e6236c6295979bdae0a1ded05cbef93f67aa"
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman_0.9.5.bb b/recipes/obsolete/xorg/xorg-lib/pixman_0.9.5.bb
new file mode 100644
index 0000000..6259dea
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman_0.9.5.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+DESCRIPTION = "Library for lowlevel pixel operations"
+DEPENDS = "virtual/libx11"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://dont-copy-unused-bits-to-alpha-channel.patch"
+SRC_URI[archive.md5sum] = "f9fea77e46ec7a3a16e925e137f146e7"
+SRC_URI[archive.sha256sum] = "a9d4545b5dfc018cdd33fd21bc73c3f1b3c9c207f1bb6843606cc180eb10c6c8"
diff --git a/recipes/obsolete/xorg/xorg-lib/pixman_git.bb b/recipes/obsolete/xorg/xorg-lib/pixman_git.bb
new file mode 100644
index 0000000..12140c1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/pixman_git.bb
@@ -0,0 +1,27 @@
+require pixman.inc
+PV = "0.17.13"
+PR = "${INC_PR}.2"
+PR_append = "+gitr${SRCPV}"
+
+SRC_URI = "git://anongit.freedesktop.org/pixman;protocol=git;branch=master \
+           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
+           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
+           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
+           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
+           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
+           file://0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch \
+           file://over-n-8-0565.patch \
+           file://src-8888-0565.patch \
+           file://calloc.patch \
+           file://tls.patch \
+"
+
+SRCREV = "69f1ec9a7827aeb522fcae99846237ef0f896e7b"
+S = "${WORKDIR}/git"
+
+NEON = " --disable-arm-neon "
+NEON_armv7a = " "
+
+EXTRA_OECONF = "${NEON} --disable-gtk"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/obsolete/xorg/xorg-lib/xtrans/fix-missing-includepath.patch b/recipes/obsolete/xorg/xorg-lib/xtrans/fix-missing-includepath.patch
new file mode 100644
index 0000000..043d14f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/xtrans/fix-missing-includepath.patch
@@ -0,0 +1,13 @@
+
+#
+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+#
+
+--- xtrans-X11R7.0-1.0.0/xtrans.pc.in~fix-missing-includepath	2005-07-02 20:00:50.000000000 +0200
++++ xtrans-X11R7.0-1.0.0/xtrans.pc.in	2006-08-11 19:27:58.000000000 +0200
+@@ -6,4 +6,4 @@
+ Name: XTrans
+ Description: Abstract network code for X
+ Version: @PACKAGE_VERSION@
+-Cflags: -I${includedir} -D_BSD_SOURCE @fchown_define@ @sticky_bit_define@
++Cflags: -I${includedir} -I${includedir}/X11/Xtrans -D_BSD_SOURCE @fchown_define@ @sticky_bit_define@
diff --git a/recipes/obsolete/xorg/xorg-lib/xtrans_1.0.3.bb b/recipes/obsolete/xorg/xorg-lib/xtrans_1.0.3.bb
new file mode 100644
index 0000000..19a56fa
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/xtrans_1.0.3.bb
@@ -0,0 +1,15 @@
+require xorg-lib-common.inc
+DESCRIPTION = "network API translation layer to insulate X applications and \
+libraries from OS network vageries."
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://fix-missing-includepath.patch"
+SRC_URI[archive.md5sum] = "bb196907ea1e182dcb396eb22f7d2c1a"
+SRC_URI[archive.sha256sum] = "e1a3c4986f16a5fbca611d0547cc7499a1fa47ca2096593644037e2609363085"
+
+FILESPATHPKG .= ":xtrans-${PV}:xtrans"
+
+ALLOW_EMPTY = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/obsolete/xorg/xorg-lib/xtrans_1.0.4.bb b/recipes/obsolete/xorg/xorg-lib/xtrans_1.0.4.bb
new file mode 100644
index 0000000..d19a6c0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/xtrans_1.0.4.bb
@@ -0,0 +1,15 @@
+require xorg-lib-common.inc
+DESCRIPTION = "network API translation layer to insulate X applications and \
+libraries from OS network vageries."
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://fix-missing-includepath.patch"
+SRC_URI[archive.md5sum] = "8b36cdf08df12be96615e3d550236626"
+SRC_URI[archive.sha256sum] = "765219fa822edeffb0650e93458e4ebf63c23176e58fce06806fb251fbfe7d8c"
+
+FILESPATHPKG .= ":xtrans-${PV}:xtrans"
+
+ALLOW_EMPTY = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/obsolete/xorg/xorg-lib/xtrans_1.1.bb b/recipes/obsolete/xorg/xorg-lib/xtrans_1.1.bb
new file mode 100644
index 0000000..1f3fcb4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/xtrans_1.1.bb
@@ -0,0 +1,15 @@
+require xorg-lib-common.inc
+DESCRIPTION = "network API translation layer to insulate X applications and \
+libraries from OS network vageries."
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://fix-missing-includepath.patch"
+SRC_URI[archive.md5sum] = "8546e3a060aefb42c889eaa4b5db33af"
+SRC_URI[archive.sha256sum] = "16bc4646f105efd3d0dd105899ac19035d67acf50950ca8c70cf68772508272d"
+
+FILESPATHPKG .= ":xtrans-${PV}:xtrans"
+
+ALLOW_EMPTY = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/obsolete/xorg/xorg-lib/xtrans_1.2.1.bb b/recipes/obsolete/xorg/xorg-lib/xtrans_1.2.1.bb
new file mode 100644
index 0000000..e695e35
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/xtrans_1.2.1.bb
@@ -0,0 +1,15 @@
+require xorg-lib-common.inc
+DESCRIPTION = "network API translation layer to insulate X applications and \
+libraries from OS network vageries."
+RDEPENDS_${PN}-dev = ""
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "96e142331edd498a9364887b2548f1bb"
+SRC_URI[archive.sha256sum] = "9ff21a8d9ea524ca9b7cb6d6b4d522b4cb20b1c35edeb8995a9e9265a0df64bd"
+
+FILESPATHPKG .= ":xtrans-${PV}:xtrans"
+
+ALLOW_EMPTY = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/obsolete/xorg/xorg-lib/xtrans_1.2.3.bb b/recipes/obsolete/xorg/xorg-lib/xtrans_1.2.3.bb
new file mode 100644
index 0000000..1f0ec39
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/xtrans_1.2.3.bb
@@ -0,0 +1,15 @@
+require xorg-lib-common.inc
+DESCRIPTION = "network API translation layer to insulate X applications and \
+libraries from OS network vageries."
+RDEPENDS_${PN}-dev = ""
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f9cf791dfad59cf044e276aab3a71e1d"
+SRC_URI[archive.sha256sum] = "a67a8b09d9530021e2bd4b93136f385e72a8d8e4f2c26a99aeb169bee88facf0"
+
+FILESPATHPKG .= ":xtrans-${PV}:xtrans"
+
+ALLOW_EMPTY = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/obsolete/xorg/xorg-lib/xtrans_1.2.bb b/recipes/obsolete/xorg/xorg-lib/xtrans_1.2.bb
new file mode 100644
index 0000000..8a4ddca
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-lib/xtrans_1.2.bb
@@ -0,0 +1,15 @@
+require xorg-lib-common.inc
+DESCRIPTION = "network API translation layer to insulate X applications and \
+libraries from OS network vageries."
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://fix-missing-includepath.patch"
+SRC_URI[archive.md5sum] = "a91fef8b932b21992af7dfff7b2643f3"
+SRC_URI[archive.sha256sum] = "d6c3cabd5ecd0183a8a9bc6b3471545df8e2c78956b4c4cfd48f0c545a88c9a4"
+
+FILESPATHPKG .= ":xtrans-${PV}:xtrans"
+
+ALLOW_EMPTY = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/xorg-lib/diet-x11_1.1.1.bb b/recipes/xorg-lib/diet-x11_1.1.1.bb
deleted file mode 100644
index 593ba34..0000000
--- a/recipes/xorg-lib/diet-x11_1.1.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require libx11_${PV}.bb
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://X18NCMSstubs.diff \
-            file://fix-disable-xlocale.diff \
-            file://fix-utf8-wrong-define.patch \
-            file://xim.patch \
-            file://xchar2b.patch"
-
-EXTRA_OECONF += "--without-xcb --disable-udc --enable-xcms --disable-xlocale --disable-xkb"
-
-CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/xorg-lib/diet-x11_1.1.2.bb b/recipes/xorg-lib/diet-x11_1.1.2.bb
deleted file mode 100644
index f6291a9..0000000
--- a/recipes/xorg-lib/diet-x11_1.1.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require libx11_${PV}.bb
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://X18NCMSstubs.diff \
-            file://fix-disable-xlocale.diff \
-            file://fix-utf8-wrong-define.patch"
-
-EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale --disable-xkb"
-
-CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/xorg-lib/diet-x11_1.1.3.bb b/recipes/xorg-lib/diet-x11_1.1.3.bb
deleted file mode 100644
index f6291a9..0000000
--- a/recipes/xorg-lib/diet-x11_1.1.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require libx11_${PV}.bb
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://X18NCMSstubs.diff \
-            file://fix-disable-xlocale.diff \
-            file://fix-utf8-wrong-define.patch"
-
-EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale --disable-xkb"
-
-CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/xorg-lib/diet-x11_1.1.4.bb b/recipes/xorg-lib/diet-x11_1.1.4.bb
deleted file mode 100644
index f6291a9..0000000
--- a/recipes/xorg-lib/diet-x11_1.1.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require libx11_${PV}.bb
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://X18NCMSstubs.diff \
-            file://fix-disable-xlocale.diff \
-            file://fix-utf8-wrong-define.patch"
-
-EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale --disable-xkb"
-
-CFLAGS += "-D_GNU_SOURCE"
diff --git a/recipes/xorg-lib/libapplewm_1.0.0.bb b/recipes/xorg-lib/libapplewm_1.0.0.bb
deleted file mode 100644
index 6e746b4..0000000
--- a/recipes/xorg-lib/libapplewm_1.0.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-lib-common.inc
-DEPENDS += "libxext applewmproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "48a403c45be2206ee900729ced3a0e62"
-SRC_URI[archive.sha256sum] = "ecd2ff407a418eb4ac673f48b4d0a9c5b6860a13cef7211a32fe8f3d3db0407e"
-
-XORG_PN = "libAppleWM"
diff --git a/recipes/xorg-lib/libdmx_1.0.2.bb b/recipes/xorg-lib/libdmx_1.0.2.bb
deleted file mode 100644
index 7d6e025..0000000
--- a/recipes/xorg-lib/libdmx_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Distributed Multihead extension library"
-DEPENDS += "libxext dmxproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4d866967210d06098fc9f302ed4c79b1"
-SRC_URI[archive.sha256sum] = "fa3ff31a543f7cea04762c08f48b418e75230de8b4dfdf9d2d3ae9e2af26b9c4"
diff --git a/recipes/xorg-lib/libfontenc_1.0.4.bb b/recipes/xorg-lib/libfontenc_1.0.4.bb
deleted file mode 100644
index f16cb77..0000000
--- a/recipes/xorg-lib/libfontenc_1.0.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 font encoding library"
-LICENSE = "BSD-X"
-DEPENDS += "zlib xproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5cd16a2e51ca7b96a3081c7486ff98b9"
-SRC_URI[archive.sha256sum] = "b993aa3d17e845a12a49160b5d96993059ce919c7ba902005b910b867b6258c8"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-lib/libfs_1.0.0.bb b/recipes/xorg-lib/libfs_1.0.0.bb
deleted file mode 100644
index 7f81054..0000000
--- a/recipes/xorg-lib/libfs_1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Font Services library"
-DEPENDS += "xproto fontsproto xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "dfd5de47e232db0891410bec8ee6707b"
-SRC_URI[archive.sha256sum] = "2f18f9fa0e18a3eab3c154ba820ad64b5c6ee364e147524055a553a130ccfdde"
-
-XORG_PN = "libFS"
diff --git a/recipes/xorg-lib/libfs_1.0.1.bb b/recipes/xorg-lib/libfs_1.0.1.bb
deleted file mode 100644
index fe1f774..0000000
--- a/recipes/xorg-lib/libfs_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Font Services library"
-DEPENDS += "xproto fontsproto xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "81521249353fa33be7a4bb0062c2fbb9"
-SRC_URI[archive.sha256sum] = "9bf92ffdb51e69e07682cd1a6c0101f2a833b16b9bfa5d601491ff46a35a2cf5"
-
-XORG_PN = "libFS"
diff --git a/recipes/xorg-lib/libice_1.0.3.bb b/recipes/xorg-lib/libice_1.0.3.bb
deleted file mode 100644
index 52c9de0..0000000
--- a/recipes/xorg-lib/libice_1.0.3.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Inter-Client Exchange library"
-DEPENDS += "xproto xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "071f96648ac25c8e87a3de11a7de2d8a"
-SRC_URI[archive.sha256sum] = "ffd46270dae30cad147d73559142a701a8ff8d0658f4abfb2341edefabb8161d"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libICE"
diff --git a/recipes/xorg-lib/libice_1.0.4.bb b/recipes/xorg-lib/libice_1.0.4.bb
deleted file mode 100644
index 29303c1..0000000
--- a/recipes/xorg-lib/libice_1.0.4.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Inter-Client Exchange library"
-DEPENDS += "xproto xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4ab4e67e0b8845aa201e984153087f4a"
-SRC_URI[archive.sha256sum] = "13055e2f4c645cbd135ce97a7974a5866f9ba3ed8988e686b552f55c30514f04"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libICE"
diff --git a/recipes/xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch b/recipes/xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch
new file mode 100644
index 0000000..f9f4a63
--- /dev/null
+++ b/recipes/xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch
@@ -0,0 +1,55 @@
+diff -uNr liblbxutil-1.1.0.orig/configure.ac liblbxutil-1.1.0/configure.ac
+--- liblbxutil-1.1.0.orig/configure.ac	2009-12-04 23:52:04.000000000 +0100
++++ liblbxutil-1.1.0/configure.ac	2009-12-16 10:45:00.000000000 +0100
+@@ -50,4 +50,5 @@
+ 
+ AC_OUTPUT([Makefile
+ 	   src/Makefile
++	   src/image/Makefile
+ 	   lbxutil.pc])
+diff -uNr liblbxutil-1.1.0.orig/src/image/Makefile.am liblbxutil-1.1.0/src/image/Makefile.am
+--- liblbxutil-1.1.0.orig/src/image/Makefile.am	1970-01-01 01:00:00.000000000 +0100
++++ liblbxutil-1.1.0/src/image/Makefile.am	2009-12-16 10:45:00.000000000 +0100
+@@ -0,0 +1,15 @@
++# evil hack
++CFLAGS=$(CFLAGS_FOR_BUILD)
++CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++LDFLAGS=$(LDFLAGS_FOR_BUILD)
++
++CC=$(CC_FOR_BUILD)
++LIBTOOL = @LIBTOOL@ --tag=CC
++
++noinst_PROGRAMS = mkg3states
++
++mkg3states_SOURCES =				\
++	mkg3states.c
++
++mkg3states_CFLAGS=$(CFLAGS_FOR_BUILD)
++mkg3states_LDFLAGS=$(LDFLAGS_FOR_BUILD)
+diff -uNr liblbxutil-1.1.0.orig/src/Makefile.am liblbxutil-1.1.0/src/Makefile.am
+--- liblbxutil-1.1.0.orig/src/Makefile.am	2009-12-16 10:48:11.000000000 +0100
++++ liblbxutil-1.1.0/src/Makefile.am	2009-12-16 10:46:47.000000000 +0100
+@@ -3,10 +3,7 @@
+ AM_CFLAGS = $(CWARNFLAGS) $(LBXUTIL_CFLAGS)
+ INCLUDES = -I$(top_srcdir)/include
+ 
+-noinst_PROGRAMS = mkg3states
+-
+-mkg3states_SOURCES =				\
+-	$(srcdir)/image/mkg3states.c
++SUBDIRS = image
+ 
+ liblbxutil_la_SOURCES =				\
+ 	$(srcdir)/lbx_zlib/reqstats.h		\
+@@ -38,9 +35,8 @@
+ 
+ $(srcdir)/image/dfaxg42d.c: g3states.h
+ 
+-g3states.h: mkg3states
+-	-rm -f g3states.h
+-	$(AM_V_GEN) ./mkg3states -c > g3states.h_ && mv g3states.h_ g3states.h
++g3states.h: image/mkg3states
++	$(AM_V_GEN) ./image/mkg3states -c > g3states.h_ && mv g3states.h_ g3states.h
+ 
+ liblbxutil_la_LDFLAGS = -version-number 1:0:0 -no-undefined
+ 
diff --git a/recipes/xorg-lib/liblbxutil/mkg3states-1.1.patch b/recipes/xorg-lib/liblbxutil/mkg3states-1.1.patch
deleted file mode 100644
index f9f4a63..0000000
--- a/recipes/xorg-lib/liblbxutil/mkg3states-1.1.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-diff -uNr liblbxutil-1.1.0.orig/configure.ac liblbxutil-1.1.0/configure.ac
---- liblbxutil-1.1.0.orig/configure.ac	2009-12-04 23:52:04.000000000 +0100
-+++ liblbxutil-1.1.0/configure.ac	2009-12-16 10:45:00.000000000 +0100
-@@ -50,4 +50,5 @@
- 
- AC_OUTPUT([Makefile
- 	   src/Makefile
-+	   src/image/Makefile
- 	   lbxutil.pc])
-diff -uNr liblbxutil-1.1.0.orig/src/image/Makefile.am liblbxutil-1.1.0/src/image/Makefile.am
---- liblbxutil-1.1.0.orig/src/image/Makefile.am	1970-01-01 01:00:00.000000000 +0100
-+++ liblbxutil-1.1.0/src/image/Makefile.am	2009-12-16 10:45:00.000000000 +0100
-@@ -0,0 +1,15 @@
-+# evil hack
-+CFLAGS=$(CFLAGS_FOR_BUILD)
-+CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
-+LDFLAGS=$(LDFLAGS_FOR_BUILD)
-+
-+CC=$(CC_FOR_BUILD)
-+LIBTOOL = @LIBTOOL@ --tag=CC
-+
-+noinst_PROGRAMS = mkg3states
-+
-+mkg3states_SOURCES =				\
-+	mkg3states.c
-+
-+mkg3states_CFLAGS=$(CFLAGS_FOR_BUILD)
-+mkg3states_LDFLAGS=$(LDFLAGS_FOR_BUILD)
-diff -uNr liblbxutil-1.1.0.orig/src/Makefile.am liblbxutil-1.1.0/src/Makefile.am
---- liblbxutil-1.1.0.orig/src/Makefile.am	2009-12-16 10:48:11.000000000 +0100
-+++ liblbxutil-1.1.0/src/Makefile.am	2009-12-16 10:46:47.000000000 +0100
-@@ -3,10 +3,7 @@
- AM_CFLAGS = $(CWARNFLAGS) $(LBXUTIL_CFLAGS)
- INCLUDES = -I$(top_srcdir)/include
- 
--noinst_PROGRAMS = mkg3states
--
--mkg3states_SOURCES =				\
--	$(srcdir)/image/mkg3states.c
-+SUBDIRS = image
- 
- liblbxutil_la_SOURCES =				\
- 	$(srcdir)/lbx_zlib/reqstats.h		\
-@@ -38,9 +35,8 @@
- 
- $(srcdir)/image/dfaxg42d.c: g3states.h
- 
--g3states.h: mkg3states
--	-rm -f g3states.h
--	$(AM_V_GEN) ./mkg3states -c > g3states.h_ && mv g3states.h_ g3states.h
-+g3states.h: image/mkg3states
-+	$(AM_V_GEN) ./image/mkg3states -c > g3states.h_ && mv g3states.h_ g3states.h
- 
- liblbxutil_la_LDFLAGS = -version-number 1:0:0 -no-undefined
- 
diff --git a/recipes/xorg-lib/liblbxutil/mkg3states.patch b/recipes/xorg-lib/liblbxutil/mkg3states.patch
deleted file mode 100644
index 58463db..0000000
--- a/recipes/xorg-lib/liblbxutil/mkg3states.patch
+++ /dev/null
@@ -1,51 +0,0 @@
---- liblbxutil-1.0.0/configure.ac.old	2006-03-31 02:38:44.000000000 -0500
-+++ liblbxutil-1.0.0/configure.ac	2006-03-31 02:39:06.000000000 -0500
-@@ -60,4 +60,5 @@ XORG_RELEASE_VERSION
- 
- AC_OUTPUT([Makefile
- 	   src/Makefile
-+	   src/image/Makefile
- 	   lbxutil.pc])
---- liblbxutil-1.0.0/src/Makefile.am.old	2006-03-31 02:38:51.000000000 -0500
-+++ liblbxutil-1.0.0/src/Makefile.am	2006-03-31 02:39:49.000000000 -0500
-@@ -1,9 +1,6 @@
- lib_LTLIBRARIES = liblbxutil.la
- 
--noinst_PROGRAMS = mkg3states
--
--mkg3states_SOURCES =				\
--	$(srcdir)/image/mkg3states.c
-+SUBDIRS = image
- 
- liblbxutil_la_SOURCES =				\
- 	$(srcdir)/lbx_zlib/reqstats.h		\
-@@ -28,9 +25,8 @@ INCLUDES = @LBXUTIL_CFLAGS@ 
- 
- $(srcdir)/image/dfaxg42d.c: g3states.h
- 
--g3states.h: mkg3states
--	-rm -f g3states.h
--	./mkg3states -c > g3states.h_ && mv g3states.h_ g3states.h
-+g3states.h: image/mkg3states
-+	./image/mkg3states -c > g3states.h_ && mv g3states.h_ g3states.h
- 
- liblbxutil_la_LDFLAGS = -version-number 1:0:0
- 
---- liblbxutil-1.0.0/src/image/Makefile.am.old	2006-03-31 02:41:19.000000000 -0500
-+++ liblbxutil-1.0.0/src/image/Makefile.am	2006-03-31 02:40:40.000000000 -0500
-@@ -0,0 +1,15 @@
-+# evil hack
-+CFLAGS=$(CFLAGS_FOR_BUILD)
-+CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
-+LDFLAGS=$(LDFLAGS_FOR_BUILD)
-+
-+CC=$(CC_FOR_BUILD)
-+LIBTOOL = @LIBTOOL@ --tag=CC
-+
-+noinst_PROGRAMS = mkg3states
-+
-+mkg3states_SOURCES =				\
-+	mkg3states.c
-+
-+mkg3states_CFLAGS=$(CFLAGS_FOR_BUILD)
-+mkg3states_LDFLAGS=$(LDFLAGS_FOR_BUILD)
diff --git a/recipes/xorg-lib/liblbxutil_1.0.1.bb b/recipes/xorg-lib/liblbxutil_1.0.1.bb
deleted file mode 100644
index f51d5ab..0000000
--- a/recipes/xorg-lib/liblbxutil_1.0.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "XFIXES Extension"
-DEPENDS += " xextproto xproto zlib"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://mkg3states.patch"
-SRC_URI[archive.md5sum] = "b73cbd5bc3cd268722a624a5f1318fde"
-SRC_URI[archive.sha256sum] = "94c31c7090106d3a95e2a7c083961efca1321b970118fe103ab06e5d927b7258"
-
-export CC_FOR_BUILD = "gcc"
diff --git a/recipes/xorg-lib/libpciaccess/fix-mtrr-check.patch b/recipes/xorg-lib/libpciaccess/fix-mtrr-check.patch
deleted file mode 100644
index e2d9f62..0000000
--- a/recipes/xorg-lib/libpciaccess/fix-mtrr-check.patch
+++ /dev/null
@@ -1,19 +0,0 @@
----
- configure.ac |    2 --
- 1 file changed, 2 deletions(-)
-
---- libpciaccess-0.10.3.orig/configure.ac
-+++ libpciaccess-0.10.3/configure.ac
-@@ -89,12 +89,10 @@ esac
- AM_CONDITIONAL(LINUX, [test "x$linux" = xyes])
- AM_CONDITIONAL(FREEBSD, [test "x$freebsd" = xyes])
- AM_CONDITIONAL(OPENBSD, [test "x$openbsd" = xyes])
- AM_CONDITIONAL(SOLARIS, [test "x$solaris" = xyes])
- 
--AC_CHECK_FILE([/usr/include/asm/mtrr.h],
--              [have_mtrr_h="yes"], [have_mtrr_h="no"])
- if test "x$have_mtrr_h" = xyes; then
-     AC_DEFINE(HAVE_MTRR, 1, [Use MTRRs on mappings])
- fi
- 
- AC_SUBST(PCIACCESS_CFLAGS)
diff --git a/recipes/xorg-lib/libpciaccess_0.10.3.bb b/recipes/xorg-lib/libpciaccess_0.10.3.bb
deleted file mode 100644
index c594dc0..0000000
--- a/recipes/xorg-lib/libpciaccess_0.10.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-lib-common.inc
-DEPENDS += "xproto virtual/libx11"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://fix-mtrr-check.patch"
-SRC_URI[archive.md5sum] = "6d5468debf76fac84576ca26c9535821"
-SRC_URI[archive.sha256sum] = "2f609ad3b5688ae66dcd18d7cdd1fc6b68531a2a85f89798f6cfb5eda6d680dc"
diff --git a/recipes/xorg-lib/libpciaccess_0.11.0.bb b/recipes/xorg-lib/libpciaccess_0.11.0.bb
deleted file mode 100644
index aca0a2f..0000000
--- a/recipes/xorg-lib/libpciaccess_0.11.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-lib-common.inc
-DEPENDS += "xproto virtual/libx11"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "686320dcec98daad0bdfb8894d4f2a2b"
-SRC_URI[archive.sha256sum] = "6e38be12b656c83c66a6fd8ba56c041d8188218278219c88ee635242ec1c7dab"
diff --git a/recipes/xorg-lib/libsm_1.0.2.bb b/recipes/xorg-lib/libsm_1.0.2.bb
deleted file mode 100644
index ee2ff16..0000000
--- a/recipes/xorg-lib/libsm_1.0.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "Session management library"
-PRIORITY = "optional"
-DEPENDS += " libice xproto xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a254771550c01db372e88d1a1dc2e13a"
-SRC_URI[archive.sha256sum] = "e290614797bd626c1b92bac8f83e8954b99bd66e6ecdaa1e935e176df099eba8"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libSM"
diff --git a/recipes/xorg-lib/libsm_1.0.3.bb b/recipes/xorg-lib/libsm_1.0.3.bb
deleted file mode 100644
index 8ca90fe..0000000
--- a/recipes/xorg-lib/libsm_1.0.3.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Session management library"
-DEPENDS += "libice xproto xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "184cbf502b3cd5d7ba5f9d1290a99606"
-SRC_URI[archive.sha256sum] = "57f42d3557effe452cd348362977ff90fa61009885c23b3aca8cb0219b5dec04"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libSM"
diff --git a/recipes/xorg-lib/libsm_1.1.0.bb b/recipes/xorg-lib/libsm_1.1.0.bb
deleted file mode 100644
index 1b51b89..0000000
--- a/recipes/xorg-lib/libsm_1.1.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Session management library"
-DEPENDS += "libice xproto xtrans util-linux-ng"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "05a04c2b6382fb0054f6c70494e22733"
-SRC_URI[archive.sha256sum] = "7536ac382e1ff82014d3a0defba0c61b3a30984f4e5bc7707960d6debcb92a82"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libSM"
diff --git a/recipes/xorg-lib/libwindowswm_1.0.0.bb b/recipes/xorg-lib/libwindowswm_1.0.0.bb
deleted file mode 100644
index 35457cb..0000000
--- a/recipes/xorg-lib/libwindowswm_1.0.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-lib-common.inc
-DEPENDS += "libxext windowswmproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "337b379fd00a67345b083100c4e6ba95"
-SRC_URI[archive.sha256sum] = "6ad87266173d21ba7e0e4506db0c094769fd58c3f0b741b37f30c297deec166a"
-
-XORG_PN = "libWindowsWM"
diff --git a/recipes/xorg-lib/libx11-1.0.1/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.0.1/keysymdef_include.patch
deleted file mode 100644
index 5653088..0000000
--- a/recipes/xorg-lib/libx11-1.0.1/keysymdef_include.patch
+++ /dev/null
@@ -1,62 +0,0 @@
----
- configure.ac |   44 ++++++++++++++++++++++++--------------------
- 1 file changed, 24 insertions(+), 20 deletions(-)
-
-Index: libX11-1.1.2/configure.ac
-===================================================================
---- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
-+++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
-@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
- #
- KEYSYMDEF=""
- AC_MSG_CHECKING([keysymdef.h])
--for flag in $XPROTO_CFLAGS -I/usr/include; do
--	case "$KEYSYMDEF" in
--	"")
--		case "$flag" in
--		*-I*)
--			dir=`echo "$flag" | sed 's/ *-I//'`
--			file="$dir/X11/keysymdef.h"
--			if test -f "$file"; then
--				KEYSYMDEF="$file"
--			fi
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
-+	KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+	for flag in $XPROTO_CFLAGS -I/usr/include; do
-+		case "$KEYSYMDEF" in
-+		"")
-+			case "$flag" in
-+			*-I*)
-+				dir=`echo "$flag" | sed 's/ *-I//'`
-+				file="$dir/X11/keysymdef.h"
-+				if test -f "$file"; then
-+					KEYSYMDEF="$file"
-+				fi
-+				;;
-+			esac
- 			;;
- 		esac
--		;;
--	esac
--done
--case "$KEYSYMDEF" in
--"")
--	AC_MSG_ERROR([Cannot find keysymdef.h])
--	;;
--*)
-+	done
-+fi
-+
-+if test -f "$KEYSYMDEF"; then
- 	AC_MSG_RESULT([$KEYSYMDEF])
--        ;;
--esac
-+else
-+	AC_MSG_ERROR([Cannot find keysymdef.h])
-+fi
- AC_SUBST(KEYSYMDEF)
- 
- AC_ARG_ENABLE(udc,
diff --git a/recipes/xorg-lib/libx11-1.0.1/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.0.1/x11_disable_makekeys.patch
deleted file mode 100644
index ad8b6fc..0000000
--- a/recipes/xorg-lib/libx11-1.0.1/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: libX11-1.0.1/src/util/Makefile.am
-===================================================================
---- libX11-1.0.1.old/src/util/Makefile.am
-+++ libX11-1.0.1/src/util/Makefile.am
-@@ -1,10 +1 @@
--# $XdotOrg: lib/X11/src/util/Makefile.am,v 1.4 2006-02-19 02:14:12 jamey Exp $
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS=$(X11_CFLAGS)
--
--#override CC = gcc
--LINK = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
--
- EXTRA_DIST = mkks.sh
diff --git a/recipes/xorg-lib/libx11-1.0.3/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.0.3/keysymdef_include.patch
deleted file mode 100644
index 5653088..0000000
--- a/recipes/xorg-lib/libx11-1.0.3/keysymdef_include.patch
+++ /dev/null
@@ -1,62 +0,0 @@
----
- configure.ac |   44 ++++++++++++++++++++++++--------------------
- 1 file changed, 24 insertions(+), 20 deletions(-)
-
-Index: libX11-1.1.2/configure.ac
-===================================================================
---- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
-+++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
-@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
- #
- KEYSYMDEF=""
- AC_MSG_CHECKING([keysymdef.h])
--for flag in $XPROTO_CFLAGS -I/usr/include; do
--	case "$KEYSYMDEF" in
--	"")
--		case "$flag" in
--		*-I*)
--			dir=`echo "$flag" | sed 's/ *-I//'`
--			file="$dir/X11/keysymdef.h"
--			if test -f "$file"; then
--				KEYSYMDEF="$file"
--			fi
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
-+	KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+	for flag in $XPROTO_CFLAGS -I/usr/include; do
-+		case "$KEYSYMDEF" in
-+		"")
-+			case "$flag" in
-+			*-I*)
-+				dir=`echo "$flag" | sed 's/ *-I//'`
-+				file="$dir/X11/keysymdef.h"
-+				if test -f "$file"; then
-+					KEYSYMDEF="$file"
-+				fi
-+				;;
-+			esac
- 			;;
- 		esac
--		;;
--	esac
--done
--case "$KEYSYMDEF" in
--"")
--	AC_MSG_ERROR([Cannot find keysymdef.h])
--	;;
--*)
-+	done
-+fi
-+
-+if test -f "$KEYSYMDEF"; then
- 	AC_MSG_RESULT([$KEYSYMDEF])
--        ;;
--esac
-+else
-+	AC_MSG_ERROR([Cannot find keysymdef.h])
-+fi
- AC_SUBST(KEYSYMDEF)
- 
- AC_ARG_ENABLE(udc,
diff --git a/recipes/xorg-lib/libx11-1.0.3/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.0.3/x11_disable_makekeys.patch
deleted file mode 100644
index ad8b6fc..0000000
--- a/recipes/xorg-lib/libx11-1.0.3/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: libX11-1.0.1/src/util/Makefile.am
-===================================================================
---- libX11-1.0.1.old/src/util/Makefile.am
-+++ libX11-1.0.1/src/util/Makefile.am
-@@ -1,10 +1 @@
--# $XdotOrg: lib/X11/src/util/Makefile.am,v 1.4 2006-02-19 02:14:12 jamey Exp $
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS=$(X11_CFLAGS)
--
--#override CC = gcc
--LINK = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
--
- EXTRA_DIST = mkks.sh
diff --git a/recipes/xorg-lib/libx11-1.1.1/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.1.1/keysymdef_include.patch
deleted file mode 100644
index 5653088..0000000
--- a/recipes/xorg-lib/libx11-1.1.1/keysymdef_include.patch
+++ /dev/null
@@ -1,62 +0,0 @@
----
- configure.ac |   44 ++++++++++++++++++++++++--------------------
- 1 file changed, 24 insertions(+), 20 deletions(-)
-
-Index: libX11-1.1.2/configure.ac
-===================================================================
---- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
-+++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
-@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
- #
- KEYSYMDEF=""
- AC_MSG_CHECKING([keysymdef.h])
--for flag in $XPROTO_CFLAGS -I/usr/include; do
--	case "$KEYSYMDEF" in
--	"")
--		case "$flag" in
--		*-I*)
--			dir=`echo "$flag" | sed 's/ *-I//'`
--			file="$dir/X11/keysymdef.h"
--			if test -f "$file"; then
--				KEYSYMDEF="$file"
--			fi
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
-+	KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+	for flag in $XPROTO_CFLAGS -I/usr/include; do
-+		case "$KEYSYMDEF" in
-+		"")
-+			case "$flag" in
-+			*-I*)
-+				dir=`echo "$flag" | sed 's/ *-I//'`
-+				file="$dir/X11/keysymdef.h"
-+				if test -f "$file"; then
-+					KEYSYMDEF="$file"
-+				fi
-+				;;
-+			esac
- 			;;
- 		esac
--		;;
--	esac
--done
--case "$KEYSYMDEF" in
--"")
--	AC_MSG_ERROR([Cannot find keysymdef.h])
--	;;
--*)
-+	done
-+fi
-+
-+if test -f "$KEYSYMDEF"; then
- 	AC_MSG_RESULT([$KEYSYMDEF])
--        ;;
--esac
-+else
-+	AC_MSG_ERROR([Cannot find keysymdef.h])
-+fi
- AC_SUBST(KEYSYMDEF)
- 
- AC_ARG_ENABLE(udc,
diff --git a/recipes/xorg-lib/libx11-1.1.2/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.1.2/keysymdef_include.patch
deleted file mode 100644
index 5653088..0000000
--- a/recipes/xorg-lib/libx11-1.1.2/keysymdef_include.patch
+++ /dev/null
@@ -1,62 +0,0 @@
----
- configure.ac |   44 ++++++++++++++++++++++++--------------------
- 1 file changed, 24 insertions(+), 20 deletions(-)
-
-Index: libX11-1.1.2/configure.ac
-===================================================================
---- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
-+++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
-@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
- #
- KEYSYMDEF=""
- AC_MSG_CHECKING([keysymdef.h])
--for flag in $XPROTO_CFLAGS -I/usr/include; do
--	case "$KEYSYMDEF" in
--	"")
--		case "$flag" in
--		*-I*)
--			dir=`echo "$flag" | sed 's/ *-I//'`
--			file="$dir/X11/keysymdef.h"
--			if test -f "$file"; then
--				KEYSYMDEF="$file"
--			fi
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
-+	KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+	for flag in $XPROTO_CFLAGS -I/usr/include; do
-+		case "$KEYSYMDEF" in
-+		"")
-+			case "$flag" in
-+			*-I*)
-+				dir=`echo "$flag" | sed 's/ *-I//'`
-+				file="$dir/X11/keysymdef.h"
-+				if test -f "$file"; then
-+					KEYSYMDEF="$file"
-+				fi
-+				;;
-+			esac
- 			;;
- 		esac
--		;;
--	esac
--done
--case "$KEYSYMDEF" in
--"")
--	AC_MSG_ERROR([Cannot find keysymdef.h])
--	;;
--*)
-+	done
-+fi
-+
-+if test -f "$KEYSYMDEF"; then
- 	AC_MSG_RESULT([$KEYSYMDEF])
--        ;;
--esac
-+else
-+	AC_MSG_ERROR([Cannot find keysymdef.h])
-+fi
- AC_SUBST(KEYSYMDEF)
- 
- AC_ARG_ENABLE(udc,
diff --git a/recipes/xorg-lib/libx11-1.1.3/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.1.3/keysymdef_include.patch
deleted file mode 100644
index 5653088..0000000
--- a/recipes/xorg-lib/libx11-1.1.3/keysymdef_include.patch
+++ /dev/null
@@ -1,62 +0,0 @@
----
- configure.ac |   44 ++++++++++++++++++++++++--------------------
- 1 file changed, 24 insertions(+), 20 deletions(-)
-
-Index: libX11-1.1.2/configure.ac
-===================================================================
---- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
-+++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
-@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
- #
- KEYSYMDEF=""
- AC_MSG_CHECKING([keysymdef.h])
--for flag in $XPROTO_CFLAGS -I/usr/include; do
--	case "$KEYSYMDEF" in
--	"")
--		case "$flag" in
--		*-I*)
--			dir=`echo "$flag" | sed 's/ *-I//'`
--			file="$dir/X11/keysymdef.h"
--			if test -f "$file"; then
--				KEYSYMDEF="$file"
--			fi
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
-+	KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+	for flag in $XPROTO_CFLAGS -I/usr/include; do
-+		case "$KEYSYMDEF" in
-+		"")
-+			case "$flag" in
-+			*-I*)
-+				dir=`echo "$flag" | sed 's/ *-I//'`
-+				file="$dir/X11/keysymdef.h"
-+				if test -f "$file"; then
-+					KEYSYMDEF="$file"
-+				fi
-+				;;
-+			esac
- 			;;
- 		esac
--		;;
--	esac
--done
--case "$KEYSYMDEF" in
--"")
--	AC_MSG_ERROR([Cannot find keysymdef.h])
--	;;
--*)
-+	done
-+fi
-+
-+if test -f "$KEYSYMDEF"; then
- 	AC_MSG_RESULT([$KEYSYMDEF])
--        ;;
--esac
-+else
-+	AC_MSG_ERROR([Cannot find keysymdef.h])
-+fi
- AC_SUBST(KEYSYMDEF)
- 
- AC_ARG_ENABLE(udc,
diff --git a/recipes/xorg-lib/libx11-1.1.4/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.1.4/keysymdef_include.patch
deleted file mode 100644
index 5653088..0000000
--- a/recipes/xorg-lib/libx11-1.1.4/keysymdef_include.patch
+++ /dev/null
@@ -1,62 +0,0 @@
----
- configure.ac |   44 ++++++++++++++++++++++++--------------------
- 1 file changed, 24 insertions(+), 20 deletions(-)
-
-Index: libX11-1.1.2/configure.ac
-===================================================================
---- libX11-1.1.2.orig/configure.ac	2008-01-02 15:30:47.000000000 +0000
-+++ libX11-1.1.2/configure.ac	2008-01-02 15:47:25.000000000 +0000
-@@ -207,29 +207,33 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
- #
- KEYSYMDEF=""
- AC_MSG_CHECKING([keysymdef.h])
--for flag in $XPROTO_CFLAGS -I/usr/include; do
--	case "$KEYSYMDEF" in
--	"")
--		case "$flag" in
--		*-I*)
--			dir=`echo "$flag" | sed 's/ *-I//'`
--			file="$dir/X11/keysymdef.h"
--			if test -f "$file"; then
--				KEYSYMDEF="$file"
--			fi
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),  
-+	KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+	for flag in $XPROTO_CFLAGS -I/usr/include; do
-+		case "$KEYSYMDEF" in
-+		"")
-+			case "$flag" in
-+			*-I*)
-+				dir=`echo "$flag" | sed 's/ *-I//'`
-+				file="$dir/X11/keysymdef.h"
-+				if test -f "$file"; then
-+					KEYSYMDEF="$file"
-+				fi
-+				;;
-+			esac
- 			;;
- 		esac
--		;;
--	esac
--done
--case "$KEYSYMDEF" in
--"")
--	AC_MSG_ERROR([Cannot find keysymdef.h])
--	;;
--*)
-+	done
-+fi
-+
-+if test -f "$KEYSYMDEF"; then
- 	AC_MSG_RESULT([$KEYSYMDEF])
--        ;;
--esac
-+else
-+	AC_MSG_ERROR([Cannot find keysymdef.h])
-+fi
- AC_SUBST(KEYSYMDEF)
- 
- AC_ARG_ENABLE(udc,
diff --git a/recipes/xorg-lib/libx11-1.1.5/X18NCMSstubs.diff b/recipes/xorg-lib/libx11-1.1.5/X18NCMSstubs.diff
new file mode 100644
index 0000000..54b1727
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.1.5/X18NCMSstubs.diff
@@ -0,0 +1,528 @@
+--- libX11-X11R7.0-1.0.0/src/imConv.c.orig	2006-03-08 09:46:03.000000000 +0100
++++ libX11-X11R7.0-1.0.0/src/imConv.c	2006-03-08 10:50:10.000000000 +0100
+@@ -83,6 +83,7 @@
+  * from UCS char to specified charset char.
+  * This converter is needed for _XimGetCharCode subroutine.
+  */
++#ifdef XLOCALE
+ XPointer
+ _XimGetLocaleCode (
+     _Xconst char*	encoding_name)
+@@ -96,6 +97,7 @@
+     }
+     return cvt;
+ }
++#endif
+ 
+ /*
+  * Returns the locale dependent representation of a keysym.
+@@ -107,6 +109,7 @@
+  * locale
+  */
+ /*ARGSUSED*/
++#ifdef XLOCALE
+ int 
+ _XimGetCharCode (
+     XPointer            ucs_conv,
+@@ -135,6 +138,7 @@
+         buf[count]= '\0';
+     return count;
+ }
++#endif
+ 
+ #ifdef XKB
+ static int lookup_string(
+--- libX11-X11R7.0-1.0.0/src/X18NCMSstubs.c.orig	2006-03-08 08:43:19.000000000 +0100
++++ libX11-X11R7.0-1.0.0/src/X18NCMSstubs.c	2006-03-08 11:41:28.000000000 +0100
+@@ -0,0 +1,428 @@
++/*
++ * X18NCMSstubs.c
++ * - Provides stubs and dummy funcs needed when Xcms and XLocale stuff removed
++ *
++ * Copyright � 2003 Matthew Allum
++ *
++ * Permission to use, copy, modify, distribute, and sell this software and its
++ * documentation for any purpose is hereby granted without fee, provided that
++ * the above copyright notice appear in all copies and that both that
++ * copyright notice and this permission notice appear in supporting
++ * documentation, and that the name of Matthew Allum not be used in
++ * advertising or publicity pertaining to distribution of the software without
++ * specific, written prior permission.  Keith Packard and Compaq makes no
++ * representations about the suitability of this software for any purpose.  It
++ * is provided "as is" without express or implied warranty.
++ *
++ * MATTHEW ALLUM DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS 
++ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, 
++ * IN NO EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
++ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
++ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
++ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
++ * PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#include <stdlib.h>
++#include "Xlibint.h"
++#include "Xlcint.h"
++#include <X11/Xlocale.h>
++#include <X11/Xos.h>
++#ifdef WIN32
++#undef close
++#endif
++#include <X11/Xutil.h>
++#include "XlcPubI.h"
++
++#include "Xcmsint.h" 		/* for XcmsCCC type  */
++#include "XlcPubI.h"            /* for XLCd type */
++#include "config.h"
++
++#if ! XLOCALE
++
++Bool
++XSupportsLocale()
++{
++  return False; 		
++}
++
++char *
++XSetLocaleModifiers(
++    const char *modifiers)
++{
++  return NULL;
++}
++
++XLCd
++_XOpenLC(
++    char *name)
++{
++  return NULL;
++}
++
++XLCd
++_XlcCurrentLC()
++{
++  return NULL;
++}
++
++void
++_XlcVaToArgList(
++    va_list var,
++    int count,
++    XlcArgList *args_ret)
++{
++  return;
++}
++
++void
++_XlcCountVaList(
++    va_list var,
++    int *count_ret)
++{
++  return;
++}
++
++void
++_XCloseLC(
++    XLCd lcd)
++{
++  return;
++}
++
++int
++_XlcConvert(
++    XlcConv conv,
++    XPointer *from,
++    int *from_left,
++    XPointer *to,
++    int *to_left,
++    XPointer *args,
++    int num_args)
++{
++  return 0;
++}
++
++/* XIM Stubs */
++
++XPointer
++_XimGetLocaleCode ( _Xconst char* encoding_name )
++{
++  return NULL;
++}
++
++int
++_XimGetCharCode (
++    XPointer            ucs_conv,
++    KeySym              keysym,
++    unsigned char*      buf,
++    int                 nbytes)
++{
++  return 0;
++}
++
++/* Xrm Stubs */
++
++XrmMethods
++_XrmInitParseInfo(
++    XPointer *state)
++{
++    return (XrmMethods) NULL;
++}
++
++/* Xwc Stubs */
++
++int
++XwcTextExtents(
++    XFontSet            font_set,
++    _Xconst wchar_t    *text,
++    int                 text_len,
++    XRectangle         *overall_ink_extents,
++    XRectangle         *overall_logical_extents)
++{
++  return 0;
++}
++
++void 
++XwcDrawString(Display *display,
++	      Drawable d,
++	      XFontSet font_set,
++	      GC gc,
++	      int x, int y,
++	      _Xconst wchar_t *string,
++	      int num_wchars)
++{
++  ;
++}
++
++void
++XwcDrawText(
++    Display            *dpy,
++    Drawable            d,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    XwcTextItem        *text_items,
++    int                 nitems)
++{
++  ;
++}
++
++void
++XwcDrawImageString(
++    Display            *dpy,
++    Drawable            d,
++    XFontSet            font_set,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    _Xconst wchar_t    *text,
++    int                 text_len)
++{
++  ;
++}
++
++int
++XwcTextEscapement(
++    XFontSet            font_set,
++    _Xconst wchar_t    *text,
++    int                 text_len)
++{
++  return 0;
++}
++
++Status
++XwcTextPerCharExtents(
++    XFontSet            font_set,
++    _Xconst wchar_t    *text,
++    int                 text_len,
++    XRectangle         *ink_extents_buffer,
++    XRectangle         *logical_extents_buffer,
++    int                 buffer_size,
++    int                *num_chars,
++    XRectangle         *max_ink_extents,
++    XRectangle         *max_logical_extents)
++{
++  ;
++}
++
++int
++XwcTextPropertyToTextList(
++    Display *dpy,
++    const XTextProperty *text_prop,
++    wchar_t ***list_ret,
++    int *count_ret)
++{
++  return 0;
++}
++
++int
++XwcTextListToTextProperty(
++    Display *dpy,
++    wchar_t **list,
++    int count,
++    XICCEncodingStyle style,
++    XTextProperty *text_prop)
++{
++  return 0;
++}
++
++void
++XwcFreeStringList(wchar_t **list)
++{
++  return;
++}
++
++
++void XmbSetWMProperties (        /* Actually from mbWMProps.c */
++    Display *dpy,
++    Window w,
++    _Xconst char *windowName,
++    _Xconst char *iconName,
++    char **argv,
++    int argc,
++    XSizeHints *sizeHints,
++    XWMHints *wmHints,
++    XClassHint *classHints)
++{
++  return;
++}
++
++int
++XmbTextPropertyToTextList(
++    Display *dpy,
++    const XTextProperty *text_prop,
++    char ***list_ret,
++    int *count_ret)
++{
++  return XLocaleNotSupported;
++}
++
++int
++XmbTextListToTextProperty(
++    Display *dpy,
++    char **list,
++    int count,
++    XICCEncodingStyle style,
++    XTextProperty *text_prop)
++{
++  return XLocaleNotSupported;
++}
++
++int
++XmbTextExtents(
++    XFontSet        font_set,
++    _Xconst char   *text,
++    int             text_len,
++    XRectangle     *overall_ink_extents,
++    XRectangle     *overall_logical_extents)
++{
++  return 0;
++}
++
++void
++XmbDrawText(
++    Display            *dpy,
++    Drawable            d,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    XmbTextItem        *text_items,
++    int                 nitems)
++{
++  ;
++}
++
++void
++XmbDrawString(
++    Display            *dpy,
++    Drawable            d,
++    XFontSet            font_set,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    _Xconst char       *text,
++    int                 text_len)
++{
++  ;
++}
++
++void
++XmbDrawImageString(
++    Display            *dpy,
++    Drawable            d,
++    XFontSet            font_set,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    _Xconst char       *text,
++    int                 text_len)
++{
++  ;
++}
++
++int
++XmbTextEscapement(
++    XFontSet        font_set,
++    _Xconst char   *text,
++    int             text_len)
++{
++  return 0;
++}
++
++Status
++XmbTextPerCharExtents(
++    XFontSet        font_set,
++    _Xconst char   *text,
++    int             text_len,
++    XRectangle     *ink_extents_buffer,
++    XRectangle     *logical_extents_buffer,
++    int             buffer_size,
++    int            *num_chars,
++    XRectangle     *max_ink_extents,
++    XRectangle     *max_logical_extents)
++{
++  return 0;
++}
++
++unsigned int
++KeySymToUcs4(KeySym keysym)
++{
++  return 0;
++}
++
++#endif 
++
++#if ! XCMS
++
++XcmsCCC 
++XcmsCCCOfColormap(dpy, cmap)
++    Display *dpy;
++    Colormap cmap;
++{
++  return NULL;
++}
++
++Status
++_XcmsResolveColorString (
++    XcmsCCC ccc,
++    const char **color_string,
++    XcmsColor *pColor_exact_return,
++    XcmsColorFormat result_format)
++{
++  return(XcmsFailure);
++}
++
++void
++_XcmsUnresolveColor(
++    XcmsCCC ccc,
++    XcmsColor *pColor)
++{
++  return;
++}
++
++void
++_XUnresolveColor(
++    XcmsCCC ccc,
++    XColor *pXColor)
++{
++  return;
++}
++
++XcmsCmapRec *
++_XcmsAddCmapRec(dpy, cmap, windowID, visual)
++    Display *dpy;
++    Colormap cmap;
++    Window windowID;
++    Visual *visual;
++{
++  return NULL;
++}
++
++void
++_XcmsRGB_to_XColor(
++    XcmsColor *pColors,
++    XColor *pXColors,
++    unsigned int nColors)
++{
++  return;
++}
++
++XcmsCmapRec *
++_XcmsCopyCmapRecAndFree(
++    Display *dpy,
++    Colormap src_cmap,
++    Colormap copy_cmap)
++{
++  return NULL;
++}
++
++void
++_XcmsDeleteCmapRec(
++    Display *dpy,
++    Colormap cmap)
++{
++  return;
++}
++
++#endif
+--- libX11-X11R7.0-1.0.0/src/Makefile.am.orig	2006-03-08 08:31:09.000000000 +0100
++++ libX11-X11R7.0-1.0.0/src/Makefile.am	2006-03-08 09:36:23.000000000 +0100
+@@ -331,6 +331,8 @@
+ libX11_la_SOURCES+=UIThrStubs.c
+ endif
+ 
++libX11_la_SOURCES+=X18NCMSstubs.c
++
+ x11datadir = @X11_DATADIR@
+ x11data_DATA = XKeysymDB XErrorDB
+ 
+@@ -338,7 +340,8 @@
+ 	$(x11data_DATA) \
+ 	os2Stubs.c \
+ 	udcInf.c \
+-	UIThrStubs.c 
++	UIThrStubs.c \
++	X18NCMSstubs.c
+ 
+ #
+ # Figure out which sub-libraries to link into Xlib
+--- libX11-X11R7.0-1.0.0/src/locking.c.orig	2006-03-08 11:05:56.000000000 +0100
++++ libX11-X11R7.0-1.0.0/src/locking.c	2006-03-08 11:06:37.000000000 +0100
+@@ -55,7 +55,9 @@
+ #define NUM_FREE_CVLS 4
+ 
+ /* in lcWrap.c */
++#ifdef XLOCALE
+ extern LockInfoPtr _Xi18n_lock;
++#endif
+ 
+ #ifdef WIN32
+ static DWORD _X_TlsIndex = (DWORD)-1;
+@@ -625,9 +627,11 @@
+     _Xglobal_lock = &global_lock;
+     xmutex_init(_Xglobal_lock->lock);
+     xmutex_set_name(_Xglobal_lock->lock, "Xlib global");
++#ifdef XLOCALE
+     _Xi18n_lock = &i18n_lock;
+     xmutex_init(_Xi18n_lock->lock);
+     xmutex_set_name(_Xi18n_lock->lock, "Xlib i18n");
++#endif
+     _XLockMutex_fn = _XLockMutex;
+     _XUnlockMutex_fn = _XUnlockMutex;
+     _XCreateMutex_fn = _XCreateMutex;
+--- libX11-X11R7.0-1.0.0/configure.ac.orig	2006-03-08 10:03:57.000000000 +0100
++++ libX11-X11R7.0-1.0.0/configure.ac	2006-03-08 10:06:01.000000000 +0100
+@@ -215,7 +215,14 @@
+ esac
+ AC_SUBST(KEYSYMDEF)
+ 
+-AM_CONDITIONAL(UDC, test xfalse = xtrue)
++AC_ARG_ENABLE(udc,
++              AC_HELP_STRING([--disable-udc],
++                [Disable Xlib support for UDC *EXPERIMENTAL*]),
++              [UDC=$enableval],[UDC=yes])
++AM_CONDITIONAL(UDC, [test x$UDC = xyes ])
++if test x"$UDC" = "xyes"; then
++	AC_DEFINE(UDC,1,[Include support for UDC])
++fi
+ 
+ AC_ARG_ENABLE(xcms, 
+               AC_HELP_STRING([--disable-xcms],
diff --git a/recipes/xorg-lib/libx11-1.1.5/dolt-fix.patch b/recipes/xorg-lib/libx11-1.1.5/dolt-fix.patch
new file mode 100644
index 0000000..ea1a8bd
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.1.5/dolt-fix.patch
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
diff --git a/recipes/xorg-lib/libx11-1.1.5/fix-disable-xlocale.diff b/recipes/xorg-lib/libx11-1.1.5/fix-disable-xlocale.diff
new file mode 100644
index 0000000..9dbf6da
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.1.5/fix-disable-xlocale.diff
@@ -0,0 +1,14 @@
+--- libX11-X11R7.0-1.0.0/src/Font.c.orig	2006-03-12 18:35:42.000000000 +0100
++++ libX11-X11R7.0-1.0.0/src/Font.c	2006-03-12 18:40:27.000000000 +0100
+@@ -701,7 +701,11 @@
+     }
+     if (l - 2 - (p - charset) < 0)
+ 	return 0;
++#ifdef XLOCALE
+     if (_XlcNCompareISOLatin1(name + l - 2 - (p - charset), charset, p - charset))
++#else
++    if (strncasecmp(name + l - 2 - (p - charset), charset, p - charset))
++#endif
+ 	return 0;
+     if (strlen(p + 1) + l - 1 >= sizeof(buf) - 1)
+ 	return 0;
diff --git a/recipes/xorg-lib/libx11-1.1.5/fix-utf8-wrong-define.patch b/recipes/xorg-lib/libx11-1.1.5/fix-utf8-wrong-define.patch
new file mode 100644
index 0000000..a098db1
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.1.5/fix-utf8-wrong-define.patch
@@ -0,0 +1,16 @@
+
+#
+# Patch managed by http://www.holgerschurig.de/patcher.html
+#
+
+--- libX11-X11R7.0-1.0.0/include/X11/Xlib.h~fix-utf8-wrong-define
++++ libX11-X11R7.0-1.0.0/include/X11/Xlib.h
+@@ -103,7 +103,7 @@
+ 
+ /* API mentioning "UTF8" or "utf8" is an XFree86 extension, introduced in
+    November 2000. Its presence is indicated through the following macro. */
+-#define X_HAVE_UTF8_STRING 1
++#undef X_HAVE_UTF8_STRING
+ 
+ typedef char *XPointer;
+ 
diff --git a/recipes/xorg-lib/libx11-1.1.5/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.1.5/keysymdef_include.patch
new file mode 100644
index 0000000..07487b6
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.1.5/keysymdef_include.patch
@@ -0,0 +1,29 @@
+Index: libX11-1.1.5/configure.ac
+===================================================================
+--- libX11-1.1.5.orig/configure.ac	2008-10-28 11:36:49.000000000 +0000
++++ libX11-1.1.5/configure.ac	2008-10-28 11:40:05.000000000 +0000
+@@ -221,13 +221,21 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysymdef.h])
+-dir=`pkg-config --variable=includedir xproto`
+-KEYSYMDEF="$dir/X11/keysymdef.h"
++AC_ARG_WITH(keysymdef,
++	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
++	KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++	dir=`pkg-config --variable=includedir xproto`
++	KEYSYMDEF="$dir/X11/keysymdef.h"
++fi
++
+ if test -f "$KEYSYMDEF"; then
+-        AC_MSG_RESULT([$KEYSYMDEF])
++	AC_MSG_RESULT([$KEYSYMDEF])
+ else
+ 	AC_MSG_ERROR([Cannot find keysymdef.h])
+ fi
++
+ AC_SUBST(KEYSYMDEF)
+ 
+ AM_CONDITIONAL(UDC, test xfalse = xtrue)
diff --git a/recipes/xorg-lib/libx11-1.1.5/makekeys-update.patch b/recipes/xorg-lib/libx11-1.1.5/makekeys-update.patch
new file mode 100644
index 0000000..323dbbb
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.1.5/makekeys-update.patch
@@ -0,0 +1,87 @@
+From f8613deafdc7c6f3be49c3448e011426bcfdf78e Mon Sep 17 00:00:00 2001
+From: Holger Hans Peter Freyther <zecke@selfish.org>
+Date: Tue, 28 Jul 2009 03:20:20 +0200
+Subject: [PATCH] makekeys.c: Replace with the latest version to fix a segfault
+
+Fix a crash..
+---
+ src/util/makekeys.c |   28 +++++++++++++++++-----------
+ 1 files changed, 17 insertions(+), 11 deletions(-)
+
+diff --git a/src/util/makekeys.c b/src/util/makekeys.c
+index 214ea5c..3fe8a96 100644
+--- a/src/util/makekeys.c
++++ b/src/util/makekeys.c
+@@ -36,13 +36,10 @@ from The Open Group.
+ #include <X11/keysymdef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#if defined(macII) && !defined(__STDC__)  /* stdlib.h fails to define these */
+-char *malloc();
+-#endif /* macII */
+ 
+ typedef unsigned long Signature;
+ 
+-#define KTNUM 3000
++#define KTNUM 4000
+ 
+ static struct info {
+     char	*name;
+@@ -52,11 +49,11 @@ static struct info {
+ #define MIN_REHASH 15
+ #define MATCHES 10
+ 
+-char tab[KTNUM];
+-unsigned short offsets[KTNUM];
+-unsigned short indexes[KTNUM];
+-KeySym values[KTNUM];
+-char buf[1024];
++static char tab[KTNUM];
++static unsigned short offsets[KTNUM];
++static unsigned short indexes[KTNUM];
++static KeySym values[KTNUM];
++static char buf[1024];
+ 
+ int
+ main(int argc, char *argv[])
+@@ -103,12 +100,11 @@ main(int argc, char *argv[])
+ 		    key);
+ 	    continue;
+ 	}
+-	name = malloc((unsigned)strlen(key)+1);
++	name = strdup(key);
+ 	if (!name) {
+ 	    fprintf(stderr, "makekeys: out of memory!\n");
+ 	    exit(1);
+ 	}
+-	(void)strcpy(name, key);
+ 	info[ksnum].name = name;
+ 	ksnum++;
+ 	if (ksnum == KTNUM) {
+@@ -157,6 +153,11 @@ next1:	;
+     }
+ 
+     z = best_z;
++    if (z == 0) {
++	fprintf(stderr, "makekeys: failed to find small enough hash!\n"
++		"Try increasing KTNUM in makekeys.c\n");
++	exit(1);
++    }
+     printf("#ifdef NEEDKTABLE\n");
+     printf("const unsigned char _XkeyTable[] = {\n");
+     printf("0,\n");
+@@ -237,6 +238,11 @@ next2:	;
+     }
+ 
+     z = best_z;
++    if (z == 0) {
++	fprintf(stderr, "makekeys: failed to find small enough hash!\n"
++		"Try increasing KTNUM in makekeys.c\n");
++	exit(1);
++    }
+     for (i = z; --i >= 0;)
+ 	offsets[i] = 0;
+     for (i = 0; i < ksnum; i++) {
+-- 
+1.6.3.3
+
diff --git a/recipes/xorg-lib/libx11-1.1.5/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.1.5/x11_disable_makekeys.patch
new file mode 100644
index 0000000..2a8a55c
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.1.5/x11_disable_makekeys.patch
@@ -0,0 +1,30 @@
+---
+ src/util/Makefile.am |   17 -----------------
+ 1 file changed, 17 deletions(-)
+
+Index: libX11-1.1.2/src/util/Makefile.am
+===================================================================
+--- libX11-1.1.2.orig/src/util/Makefile.am	2007-08-22 14:17:42.000000000 +0100
++++ libX11-1.1.2/src/util/Makefile.am	2007-08-22 14:18:04.000000000 +0100
+@@ -1,21 +1,4 @@
+ # $XdotOrg: lib/X11/src/util/Makefile.am,v 1.4 2006-02-19 02:14:12 jamey Exp $
+ 
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS=$(X11_CFLAGS)
+-
+-#override CC = gcc
+-LINK = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
+-
+ EXTRA_DIST = mkks.sh
+ 
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
diff --git a/recipes/xorg-lib/libx11-1.2/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.2/x11_disable_makekeys.patch
deleted file mode 100644
index 9e9e75e..0000000
--- a/recipes/xorg-lib/libx11-1.2/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,23 +0,0 @@
---- /tmp/Makefile.am	2009-05-27 22:19:39.000000000 +0200
-+++ libX11-1.2/src/util/Makefile.am	2009-05-27 22:21:31.000000000 +0200
-@@ -1,20 +1 @@
--# $XdotOrg: lib/X11/src/util/Makefile.am,v 1.4 2006-02-19 02:14:12 jamey Exp $
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS=$(X11_CFLAGS)
--
--CC = @CC_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
--
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/recipes/xorg-lib/libx11-1.3.2/dolt-fix.patch b/recipes/xorg-lib/libx11-1.3.2/dolt-fix.patch
new file mode 100644
index 0000000..ea1a8bd
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.3.2/dolt-fix.patch
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
diff --git a/recipes/xorg-lib/libx11-1.3.2/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.3.2/keysymdef_include.patch
new file mode 100644
index 0000000..07487b6
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.3.2/keysymdef_include.patch
@@ -0,0 +1,29 @@
+Index: libX11-1.1.5/configure.ac
+===================================================================
+--- libX11-1.1.5.orig/configure.ac	2008-10-28 11:36:49.000000000 +0000
++++ libX11-1.1.5/configure.ac	2008-10-28 11:40:05.000000000 +0000
+@@ -221,13 +221,21 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysymdef.h])
+-dir=`pkg-config --variable=includedir xproto`
+-KEYSYMDEF="$dir/X11/keysymdef.h"
++AC_ARG_WITH(keysymdef,
++	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
++	KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++	dir=`pkg-config --variable=includedir xproto`
++	KEYSYMDEF="$dir/X11/keysymdef.h"
++fi
++
+ if test -f "$KEYSYMDEF"; then
+-        AC_MSG_RESULT([$KEYSYMDEF])
++	AC_MSG_RESULT([$KEYSYMDEF])
+ else
+ 	AC_MSG_ERROR([Cannot find keysymdef.h])
+ fi
++
+ AC_SUBST(KEYSYMDEF)
+ 
+ AM_CONDITIONAL(UDC, test xfalse = xtrue)
diff --git a/recipes/xorg-lib/libx11-1.3.3+git/dolt-fix.patch b/recipes/xorg-lib/libx11-1.3.3+git/dolt-fix.patch
deleted file mode 100644
index 7e96075..0000000
--- a/recipes/xorg-lib/libx11-1.3.3+git/dolt-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: libX11-1.3.4/m4/dolt.m4
-===================================================================
---- libX11-1.3.4/m4/dolt.m4
-+++ libX11-1.3.4/m4/dolt.m4
-@@ -155,7 +155,7 @@ dnl without '=', because automake does n
-     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
- #!$DOLT_BASH
- __DOLTLIBTOOL__EOF__
--    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
-+    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
- top_builddir_slash="${0%%doltlibtool}"
- : ${top_builddir_slash:=./}
- args=()
-@@ -171,7 +171,7 @@ done
- if $modeok && $tagok ; then
-     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
- else
--    exec ${top_builddir_slash}libtool "$[]@"
-+    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
- fi
- __DOLTLIBTOOL__EOF__
- 
diff --git a/recipes/xorg-lib/libx11-1.3.3+git/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.3.3+git/keysymdef_include.patch
deleted file mode 100644
index 07487b6..0000000
--- a/recipes/xorg-lib/libx11-1.3.3+git/keysymdef_include.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Index: libX11-1.1.5/configure.ac
-===================================================================
---- libX11-1.1.5.orig/configure.ac	2008-10-28 11:36:49.000000000 +0000
-+++ libX11-1.1.5/configure.ac	2008-10-28 11:40:05.000000000 +0000
-@@ -221,13 +221,21 @@
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysymdef.h])
--dir=`pkg-config --variable=includedir xproto`
--KEYSYMDEF="$dir/X11/keysymdef.h"
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
-+	KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+	dir=`pkg-config --variable=includedir xproto`
-+	KEYSYMDEF="$dir/X11/keysymdef.h"
-+fi
-+
- if test -f "$KEYSYMDEF"; then
--        AC_MSG_RESULT([$KEYSYMDEF])
-+	AC_MSG_RESULT([$KEYSYMDEF])
- else
- 	AC_MSG_ERROR([Cannot find keysymdef.h])
- fi
-+
- AC_SUBST(KEYSYMDEF)
- 
- AM_CONDITIONAL(UDC, test xfalse = xtrue)
diff --git a/recipes/xorg-lib/libx11-1.3.3+git/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.3.3+git/x11_disable_makekeys.patch
deleted file mode 100644
index 0739632..0000000
--- a/recipes/xorg-lib/libx11-1.3.3+git/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Index: git/src/util/Makefile.am
-===================================================================
---- git.orig/src/util/Makefile.am
-+++ git/src/util/Makefile.am
-@@ -1,21 +1 @@
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS = \
--	$(X11_CFLAGS) \
--	$(CWARNFLAGS)
--
--CC = @CC_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
--
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/recipes/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch
deleted file mode 100644
index 5d0a24c..0000000
--- a/recipes/xorg-lib/libx11-1.3.3/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-diff -uNr libX11-1.3.3.orig/src/util/Makefile.am libX11-1.3.3/src/util/Makefile.am
---- libX11-1.3.3.orig/src/util/Makefile.am	2010-01-15 02:11:36.000000000 +0100
-+++ libX11-1.3.3/src/util/Makefile.am	2010-01-18 14:48:27.000000000 +0100
-@@ -1,19 +1 @@
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS=$(X11_CFLAGS)
--
--CC = @CC_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
--
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/recipes/xorg-lib/libx11-1.3.4/dolt-fix.patch b/recipes/xorg-lib/libx11-1.3.4/dolt-fix.patch
deleted file mode 100644
index 7e96075..0000000
--- a/recipes/xorg-lib/libx11-1.3.4/dolt-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: libX11-1.3.4/m4/dolt.m4
-===================================================================
---- libX11-1.3.4/m4/dolt.m4
-+++ libX11-1.3.4/m4/dolt.m4
-@@ -155,7 +155,7 @@ dnl without '=', because automake does n
-     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
- #!$DOLT_BASH
- __DOLTLIBTOOL__EOF__
--    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
-+    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
- top_builddir_slash="${0%%doltlibtool}"
- : ${top_builddir_slash:=./}
- args=()
-@@ -171,7 +171,7 @@ done
- if $modeok && $tagok ; then
-     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
- else
--    exec ${top_builddir_slash}libtool "$[]@"
-+    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
- fi
- __DOLTLIBTOOL__EOF__
- 
diff --git a/recipes/xorg-lib/libx11-1.3.4/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.3.4/keysymdef_include.patch
deleted file mode 100644
index 0cab165..0000000
--- a/recipes/xorg-lib/libx11-1.3.4/keysymdef_include.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Index: libX11-1.3.4/configure.ac
-===================================================================
---- libX11-1.3.4.orig/configure.ac
-+++ libX11-1.3.4/configure.ac
-@@ -355,8 +355,14 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL,
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysymdef.h])
--dir=`$PKG_CONFIG --variable=includedir xproto`
--KEYSYMDEF="$dir/X11/keysymdef.h"
-+AC_ARG_WITH(keysymdef,
-+        AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
-+        KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+        dir=`${PKG_CONFIG} --variable=includedir xproto`
-+        KEYSYMDEF="$dir/X11/keysymdef.h"
-+fi
- if test -f "$KEYSYMDEF"; then
-         AC_MSG_RESULT([$KEYSYMDEF])
- else
diff --git a/recipes/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch
deleted file mode 100644
index 9763313..0000000
--- a/recipes/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Index: libX11-1.3.4/src/util/Makefile.am
-===================================================================
---- libX11-1.3.4.orig/src/util/Makefile.am
-+++ libX11-1.3.4/src/util/Makefile.am
-@@ -1,24 +1 @@
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS = \
--	$(X11_CFLAGS) \
--	$(CWARNFLAGS)
--
--CC = @CC_FOR_BUILD@
--CPPFLAGS = @CPPFLAGS_FOR_BUILD@
--CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
--
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/recipes/xorg-lib/libx11/X18NCMSstubs.diff b/recipes/xorg-lib/libx11/X18NCMSstubs.diff
deleted file mode 100644
index 54b1727..0000000
--- a/recipes/xorg-lib/libx11/X18NCMSstubs.diff
+++ /dev/null
@@ -1,528 +0,0 @@
---- libX11-X11R7.0-1.0.0/src/imConv.c.orig	2006-03-08 09:46:03.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/src/imConv.c	2006-03-08 10:50:10.000000000 +0100
-@@ -83,6 +83,7 @@
-  * from UCS char to specified charset char.
-  * This converter is needed for _XimGetCharCode subroutine.
-  */
-+#ifdef XLOCALE
- XPointer
- _XimGetLocaleCode (
-     _Xconst char*	encoding_name)
-@@ -96,6 +97,7 @@
-     }
-     return cvt;
- }
-+#endif
- 
- /*
-  * Returns the locale dependent representation of a keysym.
-@@ -107,6 +109,7 @@
-  * locale
-  */
- /*ARGSUSED*/
-+#ifdef XLOCALE
- int 
- _XimGetCharCode (
-     XPointer            ucs_conv,
-@@ -135,6 +138,7 @@
-         buf[count]= '\0';
-     return count;
- }
-+#endif
- 
- #ifdef XKB
- static int lookup_string(
---- libX11-X11R7.0-1.0.0/src/X18NCMSstubs.c.orig	2006-03-08 08:43:19.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/src/X18NCMSstubs.c	2006-03-08 11:41:28.000000000 +0100
-@@ -0,0 +1,428 @@
-+/*
-+ * X18NCMSstubs.c
-+ * - Provides stubs and dummy funcs needed when Xcms and XLocale stuff removed
-+ *
-+ * Copyright � 2003 Matthew Allum
-+ *
-+ * Permission to use, copy, modify, distribute, and sell this software and its
-+ * documentation for any purpose is hereby granted without fee, provided that
-+ * the above copyright notice appear in all copies and that both that
-+ * copyright notice and this permission notice appear in supporting
-+ * documentation, and that the name of Matthew Allum not be used in
-+ * advertising or publicity pertaining to distribution of the software without
-+ * specific, written prior permission.  Keith Packard and Compaq makes no
-+ * representations about the suitability of this software for any purpose.  It
-+ * is provided "as is" without express or implied warranty.
-+ *
-+ * MATTHEW ALLUM DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS 
-+ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, 
-+ * IN NO EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
-+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
-+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
-+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-+ * PERFORMANCE OF THIS SOFTWARE.
-+ */
-+
-+#include <stdlib.h>
-+#include "Xlibint.h"
-+#include "Xlcint.h"
-+#include <X11/Xlocale.h>
-+#include <X11/Xos.h>
-+#ifdef WIN32
-+#undef close
-+#endif
-+#include <X11/Xutil.h>
-+#include "XlcPubI.h"
-+
-+#include "Xcmsint.h" 		/* for XcmsCCC type  */
-+#include "XlcPubI.h"            /* for XLCd type */
-+#include "config.h"
-+
-+#if ! XLOCALE
-+
-+Bool
-+XSupportsLocale()
-+{
-+  return False; 		
-+}
-+
-+char *
-+XSetLocaleModifiers(
-+    const char *modifiers)
-+{
-+  return NULL;
-+}
-+
-+XLCd
-+_XOpenLC(
-+    char *name)
-+{
-+  return NULL;
-+}
-+
-+XLCd
-+_XlcCurrentLC()
-+{
-+  return NULL;
-+}
-+
-+void
-+_XlcVaToArgList(
-+    va_list var,
-+    int count,
-+    XlcArgList *args_ret)
-+{
-+  return;
-+}
-+
-+void
-+_XlcCountVaList(
-+    va_list var,
-+    int *count_ret)
-+{
-+  return;
-+}
-+
-+void
-+_XCloseLC(
-+    XLCd lcd)
-+{
-+  return;
-+}
-+
-+int
-+_XlcConvert(
-+    XlcConv conv,
-+    XPointer *from,
-+    int *from_left,
-+    XPointer *to,
-+    int *to_left,
-+    XPointer *args,
-+    int num_args)
-+{
-+  return 0;
-+}
-+
-+/* XIM Stubs */
-+
-+XPointer
-+_XimGetLocaleCode ( _Xconst char* encoding_name )
-+{
-+  return NULL;
-+}
-+
-+int
-+_XimGetCharCode (
-+    XPointer            ucs_conv,
-+    KeySym              keysym,
-+    unsigned char*      buf,
-+    int                 nbytes)
-+{
-+  return 0;
-+}
-+
-+/* Xrm Stubs */
-+
-+XrmMethods
-+_XrmInitParseInfo(
-+    XPointer *state)
-+{
-+    return (XrmMethods) NULL;
-+}
-+
-+/* Xwc Stubs */
-+
-+int
-+XwcTextExtents(
-+    XFontSet            font_set,
-+    _Xconst wchar_t    *text,
-+    int                 text_len,
-+    XRectangle         *overall_ink_extents,
-+    XRectangle         *overall_logical_extents)
-+{
-+  return 0;
-+}
-+
-+void 
-+XwcDrawString(Display *display,
-+	      Drawable d,
-+	      XFontSet font_set,
-+	      GC gc,
-+	      int x, int y,
-+	      _Xconst wchar_t *string,
-+	      int num_wchars)
-+{
-+  ;
-+}
-+
-+void
-+XwcDrawText(
-+    Display            *dpy,
-+    Drawable            d,
-+    GC                  gc,
-+    int                 x,
-+    int                 y,
-+    XwcTextItem        *text_items,
-+    int                 nitems)
-+{
-+  ;
-+}
-+
-+void
-+XwcDrawImageString(
-+    Display            *dpy,
-+    Drawable            d,
-+    XFontSet            font_set,
-+    GC                  gc,
-+    int                 x,
-+    int                 y,
-+    _Xconst wchar_t    *text,
-+    int                 text_len)
-+{
-+  ;
-+}
-+
-+int
-+XwcTextEscapement(
-+    XFontSet            font_set,
-+    _Xconst wchar_t    *text,
-+    int                 text_len)
-+{
-+  return 0;
-+}
-+
-+Status
-+XwcTextPerCharExtents(
-+    XFontSet            font_set,
-+    _Xconst wchar_t    *text,
-+    int                 text_len,
-+    XRectangle         *ink_extents_buffer,
-+    XRectangle         *logical_extents_buffer,
-+    int                 buffer_size,
-+    int                *num_chars,
-+    XRectangle         *max_ink_extents,
-+    XRectangle         *max_logical_extents)
-+{
-+  ;
-+}
-+
-+int
-+XwcTextPropertyToTextList(
-+    Display *dpy,
-+    const XTextProperty *text_prop,
-+    wchar_t ***list_ret,
-+    int *count_ret)
-+{
-+  return 0;
-+}
-+
-+int
-+XwcTextListToTextProperty(
-+    Display *dpy,
-+    wchar_t **list,
-+    int count,
-+    XICCEncodingStyle style,
-+    XTextProperty *text_prop)
-+{
-+  return 0;
-+}
-+
-+void
-+XwcFreeStringList(wchar_t **list)
-+{
-+  return;
-+}
-+
-+
-+void XmbSetWMProperties (        /* Actually from mbWMProps.c */
-+    Display *dpy,
-+    Window w,
-+    _Xconst char *windowName,
-+    _Xconst char *iconName,
-+    char **argv,
-+    int argc,
-+    XSizeHints *sizeHints,
-+    XWMHints *wmHints,
-+    XClassHint *classHints)
-+{
-+  return;
-+}
-+
-+int
-+XmbTextPropertyToTextList(
-+    Display *dpy,
-+    const XTextProperty *text_prop,
-+    char ***list_ret,
-+    int *count_ret)
-+{
-+  return XLocaleNotSupported;
-+}
-+
-+int
-+XmbTextListToTextProperty(
-+    Display *dpy,
-+    char **list,
-+    int count,
-+    XICCEncodingStyle style,
-+    XTextProperty *text_prop)
-+{
-+  return XLocaleNotSupported;
-+}
-+
-+int
-+XmbTextExtents(
-+    XFontSet        font_set,
-+    _Xconst char   *text,
-+    int             text_len,
-+    XRectangle     *overall_ink_extents,
-+    XRectangle     *overall_logical_extents)
-+{
-+  return 0;
-+}
-+
-+void
-+XmbDrawText(
-+    Display            *dpy,
-+    Drawable            d,
-+    GC                  gc,
-+    int                 x,
-+    int                 y,
-+    XmbTextItem        *text_items,
-+    int                 nitems)
-+{
-+  ;
-+}
-+
-+void
-+XmbDrawString(
-+    Display            *dpy,
-+    Drawable            d,
-+    XFontSet            font_set,
-+    GC                  gc,
-+    int                 x,
-+    int                 y,
-+    _Xconst char       *text,
-+    int                 text_len)
-+{
-+  ;
-+}
-+
-+void
-+XmbDrawImageString(
-+    Display            *dpy,
-+    Drawable            d,
-+    XFontSet            font_set,
-+    GC                  gc,
-+    int                 x,
-+    int                 y,
-+    _Xconst char       *text,
-+    int                 text_len)
-+{
-+  ;
-+}
-+
-+int
-+XmbTextEscapement(
-+    XFontSet        font_set,
-+    _Xconst char   *text,
-+    int             text_len)
-+{
-+  return 0;
-+}
-+
-+Status
-+XmbTextPerCharExtents(
-+    XFontSet        font_set,
-+    _Xconst char   *text,
-+    int             text_len,
-+    XRectangle     *ink_extents_buffer,
-+    XRectangle     *logical_extents_buffer,
-+    int             buffer_size,
-+    int            *num_chars,
-+    XRectangle     *max_ink_extents,
-+    XRectangle     *max_logical_extents)
-+{
-+  return 0;
-+}
-+
-+unsigned int
-+KeySymToUcs4(KeySym keysym)
-+{
-+  return 0;
-+}
-+
-+#endif 
-+
-+#if ! XCMS
-+
-+XcmsCCC 
-+XcmsCCCOfColormap(dpy, cmap)
-+    Display *dpy;
-+    Colormap cmap;
-+{
-+  return NULL;
-+}
-+
-+Status
-+_XcmsResolveColorString (
-+    XcmsCCC ccc,
-+    const char **color_string,
-+    XcmsColor *pColor_exact_return,
-+    XcmsColorFormat result_format)
-+{
-+  return(XcmsFailure);
-+}
-+
-+void
-+_XcmsUnresolveColor(
-+    XcmsCCC ccc,
-+    XcmsColor *pColor)
-+{
-+  return;
-+}
-+
-+void
-+_XUnresolveColor(
-+    XcmsCCC ccc,
-+    XColor *pXColor)
-+{
-+  return;
-+}
-+
-+XcmsCmapRec *
-+_XcmsAddCmapRec(dpy, cmap, windowID, visual)
-+    Display *dpy;
-+    Colormap cmap;
-+    Window windowID;
-+    Visual *visual;
-+{
-+  return NULL;
-+}
-+
-+void
-+_XcmsRGB_to_XColor(
-+    XcmsColor *pColors,
-+    XColor *pXColors,
-+    unsigned int nColors)
-+{
-+  return;
-+}
-+
-+XcmsCmapRec *
-+_XcmsCopyCmapRecAndFree(
-+    Display *dpy,
-+    Colormap src_cmap,
-+    Colormap copy_cmap)
-+{
-+  return NULL;
-+}
-+
-+void
-+_XcmsDeleteCmapRec(
-+    Display *dpy,
-+    Colormap cmap)
-+{
-+  return;
-+}
-+
-+#endif
---- libX11-X11R7.0-1.0.0/src/Makefile.am.orig	2006-03-08 08:31:09.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/src/Makefile.am	2006-03-08 09:36:23.000000000 +0100
-@@ -331,6 +331,8 @@
- libX11_la_SOURCES+=UIThrStubs.c
- endif
- 
-+libX11_la_SOURCES+=X18NCMSstubs.c
-+
- x11datadir = @X11_DATADIR@
- x11data_DATA = XKeysymDB XErrorDB
- 
-@@ -338,7 +340,8 @@
- 	$(x11data_DATA) \
- 	os2Stubs.c \
- 	udcInf.c \
--	UIThrStubs.c 
-+	UIThrStubs.c \
-+	X18NCMSstubs.c
- 
- #
- # Figure out which sub-libraries to link into Xlib
---- libX11-X11R7.0-1.0.0/src/locking.c.orig	2006-03-08 11:05:56.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/src/locking.c	2006-03-08 11:06:37.000000000 +0100
-@@ -55,7 +55,9 @@
- #define NUM_FREE_CVLS 4
- 
- /* in lcWrap.c */
-+#ifdef XLOCALE
- extern LockInfoPtr _Xi18n_lock;
-+#endif
- 
- #ifdef WIN32
- static DWORD _X_TlsIndex = (DWORD)-1;
-@@ -625,9 +627,11 @@
-     _Xglobal_lock = &global_lock;
-     xmutex_init(_Xglobal_lock->lock);
-     xmutex_set_name(_Xglobal_lock->lock, "Xlib global");
-+#ifdef XLOCALE
-     _Xi18n_lock = &i18n_lock;
-     xmutex_init(_Xi18n_lock->lock);
-     xmutex_set_name(_Xi18n_lock->lock, "Xlib i18n");
-+#endif
-     _XLockMutex_fn = _XLockMutex;
-     _XUnlockMutex_fn = _XUnlockMutex;
-     _XCreateMutex_fn = _XCreateMutex;
---- libX11-X11R7.0-1.0.0/configure.ac.orig	2006-03-08 10:03:57.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/configure.ac	2006-03-08 10:06:01.000000000 +0100
-@@ -215,7 +215,14 @@
- esac
- AC_SUBST(KEYSYMDEF)
- 
--AM_CONDITIONAL(UDC, test xfalse = xtrue)
-+AC_ARG_ENABLE(udc,
-+              AC_HELP_STRING([--disable-udc],
-+                [Disable Xlib support for UDC *EXPERIMENTAL*]),
-+              [UDC=$enableval],[UDC=yes])
-+AM_CONDITIONAL(UDC, [test x$UDC = xyes ])
-+if test x"$UDC" = "xyes"; then
-+	AC_DEFINE(UDC,1,[Include support for UDC])
-+fi
- 
- AC_ARG_ENABLE(xcms, 
-               AC_HELP_STRING([--disable-xcms],
diff --git a/recipes/xorg-lib/libx11/dolt-fix.patch b/recipes/xorg-lib/libx11/dolt-fix.patch
deleted file mode 100644
index ea1a8bd..0000000
--- a/recipes/xorg-lib/libx11/dolt-fix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -uNr libX11-1.2.99.901.orig/acinclude.m4 libX11-1.2.99.901/acinclude.m4
---- libX11-1.2.99.901.orig/acinclude.m4	2009-09-05 10:57:11.000000000 +0200
-+++ libX11-1.2.99.901/acinclude.m4	2009-09-05 10:59:14.000000000 +0200
-@@ -197,7 +197,7 @@
-     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
- #!$DOLT_BASH
- __DOLTLIBTOOL__EOF__
--    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
-+    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
- top_builddir_slash="${0%%doltlibtool}"
- : ${top_builddir_slash:=./}
- args=()
-@@ -213,7 +213,7 @@
- if $modeok && $tagok ; then
-     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
- else
--    exec ${top_builddir_slash}libtool "$[]@"
-+    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
- fi
- __DOLTLIBTOOL__EOF__
- 
diff --git a/recipes/xorg-lib/libx11/fix-disable-xlocale.diff b/recipes/xorg-lib/libx11/fix-disable-xlocale.diff
deleted file mode 100644
index 9dbf6da..0000000
--- a/recipes/xorg-lib/libx11/fix-disable-xlocale.diff
+++ /dev/null
@@ -1,14 +0,0 @@
---- libX11-X11R7.0-1.0.0/src/Font.c.orig	2006-03-12 18:35:42.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/src/Font.c	2006-03-12 18:40:27.000000000 +0100
-@@ -701,7 +701,11 @@
-     }
-     if (l - 2 - (p - charset) < 0)
- 	return 0;
-+#ifdef XLOCALE
-     if (_XlcNCompareISOLatin1(name + l - 2 - (p - charset), charset, p - charset))
-+#else
-+    if (strncasecmp(name + l - 2 - (p - charset), charset, p - charset))
-+#endif
- 	return 0;
-     if (strlen(p + 1) + l - 1 >= sizeof(buf) - 1)
- 	return 0;
diff --git a/recipes/xorg-lib/libx11/fix-utf8-wrong-define.patch b/recipes/xorg-lib/libx11/fix-utf8-wrong-define.patch
deleted file mode 100644
index a098db1..0000000
--- a/recipes/xorg-lib/libx11/fix-utf8-wrong-define.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- libX11-X11R7.0-1.0.0/include/X11/Xlib.h~fix-utf8-wrong-define
-+++ libX11-X11R7.0-1.0.0/include/X11/Xlib.h
-@@ -103,7 +103,7 @@
- 
- /* API mentioning "UTF8" or "utf8" is an XFree86 extension, introduced in
-    November 2000. Its presence is indicated through the following macro. */
--#define X_HAVE_UTF8_STRING 1
-+#undef X_HAVE_UTF8_STRING
- 
- typedef char *XPointer;
- 
diff --git a/recipes/xorg-lib/libx11/keysymdef_include.patch b/recipes/xorg-lib/libx11/keysymdef_include.patch
deleted file mode 100644
index 07487b6..0000000
--- a/recipes/xorg-lib/libx11/keysymdef_include.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Index: libX11-1.1.5/configure.ac
-===================================================================
---- libX11-1.1.5.orig/configure.ac	2008-10-28 11:36:49.000000000 +0000
-+++ libX11-1.1.5/configure.ac	2008-10-28 11:40:05.000000000 +0000
-@@ -221,13 +221,21 @@
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysymdef.h])
--dir=`pkg-config --variable=includedir xproto`
--KEYSYMDEF="$dir/X11/keysymdef.h"
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
-+	KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+	dir=`pkg-config --variable=includedir xproto`
-+	KEYSYMDEF="$dir/X11/keysymdef.h"
-+fi
-+
- if test -f "$KEYSYMDEF"; then
--        AC_MSG_RESULT([$KEYSYMDEF])
-+	AC_MSG_RESULT([$KEYSYMDEF])
- else
- 	AC_MSG_ERROR([Cannot find keysymdef.h])
- fi
-+
- AC_SUBST(KEYSYMDEF)
- 
- AM_CONDITIONAL(UDC, test xfalse = xtrue)
diff --git a/recipes/xorg-lib/libx11/makekeys-update.patch b/recipes/xorg-lib/libx11/makekeys-update.patch
deleted file mode 100644
index 323dbbb..0000000
--- a/recipes/xorg-lib/libx11/makekeys-update.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From f8613deafdc7c6f3be49c3448e011426bcfdf78e Mon Sep 17 00:00:00 2001
-From: Holger Hans Peter Freyther <zecke@selfish.org>
-Date: Tue, 28 Jul 2009 03:20:20 +0200
-Subject: [PATCH] makekeys.c: Replace with the latest version to fix a segfault
-
-Fix a crash..
----
- src/util/makekeys.c |   28 +++++++++++++++++-----------
- 1 files changed, 17 insertions(+), 11 deletions(-)
-
-diff --git a/src/util/makekeys.c b/src/util/makekeys.c
-index 214ea5c..3fe8a96 100644
---- a/src/util/makekeys.c
-+++ b/src/util/makekeys.c
-@@ -36,13 +36,10 @@ from The Open Group.
- #include <X11/keysymdef.h>
- #include <stdio.h>
- #include <stdlib.h>
--#if defined(macII) && !defined(__STDC__)  /* stdlib.h fails to define these */
--char *malloc();
--#endif /* macII */
- 
- typedef unsigned long Signature;
- 
--#define KTNUM 3000
-+#define KTNUM 4000
- 
- static struct info {
-     char	*name;
-@@ -52,11 +49,11 @@ static struct info {
- #define MIN_REHASH 15
- #define MATCHES 10
- 
--char tab[KTNUM];
--unsigned short offsets[KTNUM];
--unsigned short indexes[KTNUM];
--KeySym values[KTNUM];
--char buf[1024];
-+static char tab[KTNUM];
-+static unsigned short offsets[KTNUM];
-+static unsigned short indexes[KTNUM];
-+static KeySym values[KTNUM];
-+static char buf[1024];
- 
- int
- main(int argc, char *argv[])
-@@ -103,12 +100,11 @@ main(int argc, char *argv[])
- 		    key);
- 	    continue;
- 	}
--	name = malloc((unsigned)strlen(key)+1);
-+	name = strdup(key);
- 	if (!name) {
- 	    fprintf(stderr, "makekeys: out of memory!\n");
- 	    exit(1);
- 	}
--	(void)strcpy(name, key);
- 	info[ksnum].name = name;
- 	ksnum++;
- 	if (ksnum == KTNUM) {
-@@ -157,6 +153,11 @@ next1:	;
-     }
- 
-     z = best_z;
-+    if (z == 0) {
-+	fprintf(stderr, "makekeys: failed to find small enough hash!\n"
-+		"Try increasing KTNUM in makekeys.c\n");
-+	exit(1);
-+    }
-     printf("#ifdef NEEDKTABLE\n");
-     printf("const unsigned char _XkeyTable[] = {\n");
-     printf("0,\n");
-@@ -237,6 +238,11 @@ next2:	;
-     }
- 
-     z = best_z;
-+    if (z == 0) {
-+	fprintf(stderr, "makekeys: failed to find small enough hash!\n"
-+		"Try increasing KTNUM in makekeys.c\n");
-+	exit(1);
-+    }
-     for (i = z; --i >= 0;)
- 	offsets[i] = 0;
-     for (i = 0; i < ksnum; i++) {
--- 
-1.6.3.3
-
diff --git a/recipes/xorg-lib/libx11/ruutf8.patch b/recipes/xorg-lib/libx11/ruutf8.patch
deleted file mode 100644
index 0822b30..0000000
--- a/recipes/xorg-lib/libx11/ruutf8.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff --git a/nls/locale.alias.pre b/nls/locale.alias.pre
-index a74ca75..ff5bc3f 100644
---- a/nls/locale.alias.pre
-+++ b/nls/locale.alias.pre
-@@ -898,6 +898,7 @@ ru_RU.cp1251:					ru_RU.CP1251
- ru_RU.microsoftcp1251:				ru_RU.CP1251
- ru_RU.microsoft-cp1251:				ru_RU.CP1251
- ru_RU.MICROSOFT-CP1251:				ru_RU.CP1251
-+ru_RU.utf8:					ru_RU.UTF-8
- #if defined(INCLUDE_ru_SU)
- XCOMM ru_SU is redundant now
- ru_SU:						ru_RU.KOI8-R
diff --git a/recipes/xorg-lib/libx11/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11/x11_disable_makekeys.patch
deleted file mode 100644
index 2a8a55c..0000000
--- a/recipes/xorg-lib/libx11/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,30 +0,0 @@
----
- src/util/Makefile.am |   17 -----------------
- 1 file changed, 17 deletions(-)
-
-Index: libX11-1.1.2/src/util/Makefile.am
-===================================================================
---- libX11-1.1.2.orig/src/util/Makefile.am	2007-08-22 14:17:42.000000000 +0100
-+++ libX11-1.1.2/src/util/Makefile.am	2007-08-22 14:18:04.000000000 +0100
-@@ -1,21 +1,4 @@
- # $XdotOrg: lib/X11/src/util/Makefile.am,v 1.4 2006-02-19 02:14:12 jamey Exp $
- 
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS=$(X11_CFLAGS)
--
--#override CC = gcc
--LINK = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
--
- EXTRA_DIST = mkks.sh
- 
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/recipes/xorg-lib/libx11/xchar2b.patch b/recipes/xorg-lib/libx11/xchar2b.patch
deleted file mode 100644
index 31da58f..0000000
--- a/recipes/xorg-lib/libx11/xchar2b.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-http://www.koka-in.org/~kensyu/zaurus/diary/20030618.html
-
---- /tmp/Xlib.h	2006-12-01 14:40:27.000000000 +0100
-+++ libX11-X11R7.1-1.0.1/include/X11/Xlib.h	2006-12-01 14:40:56.948254000 +0100
-@@ -1067,7 +1067,7 @@
- typedef struct {		/* normal 16 bit characters are two bytes */
-     unsigned char byte1;
-     unsigned char byte2;
--} XChar2b;
-+} __attribute__ ((packed)) XChar2b;
- 
- typedef struct {
-     XChar2b *chars;		/* two byte characters */
diff --git a/recipes/xorg-lib/libx11/xim.patch b/recipes/xorg-lib/libx11/xim.patch
deleted file mode 100644
index 0eab197..0000000
--- a/recipes/xorg-lib/libx11/xim.patch
+++ /dev/null
@@ -1,55 +0,0 @@
---- libX11-6.2.1/src/X18NCMSstubs.c	2003-12-04 22:47:47.000000000 +0000
-+++ libX11-6.2.1/src/X18NCMSstubs.c-new	2005-12-09 12:09:03.000000000 +0000
-@@ -90,6 +90,52 @@
-   return;
- }
- 
-+XIM
-+XOpenIM (
-+    Display* display,
-+    struct _XrmHashBucketRec* rdb,
-+    char* res_name,
-+    char* res_class)
-+{
-+  return (XIM) NULL;
-+}
-+
-+Status
-+XCloseIM ( XIM im )
-+{
-+  return NULL;
-+}
-+
-+XIC
-+XCreateIC ( XIM im, ...)
-+{
-+  return NULL;
-+}
-+
-+void
-+XDestroyIC ( XIC ic )
-+{
-+  return;
-+}
-+
-+int
-+XmbLookupString (
-+    XIC ic,
-+    XKeyPressedEvent* ev,
-+    char* buffer,
-+    int nbytes,
-+    KeySym* keysym,
-+    Status* status)
-+{
-+  return XLookupNone;
-+}
-+
-+char *
-+XGetICValues( XIC ic, ...)
-+{
-+  return (char *) NULL;
-+}
-+
- XPointer
- _XimGetLocaleCode ( _Xconst char* encoding_name )
- {
diff --git a/recipes/xorg-lib/libx11_1.0.1.bb b/recipes/xorg-lib/libx11_1.0.1.bb
deleted file mode 100644
index 734a31d..0000000
--- a/recipes/xorg-lib/libx11_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require libx11.inc
-LICENSE = "XFree86"
-DEPENDS = "${COMMON_DEPENDS}"
-PR = "${INC_PR}.0"
-
-SRC_URI += " file://ruutf8.patch"
-SRC_URI[archive.md5sum] = "58f0537f21183e27149cf906a1b6bef9"
-SRC_URI[archive.sha256sum] = "f99e4ce6d8e3b8833957978fe22223897b0e636c83580f2b07eff0388eb75294"
-
-EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/xorg-lib/libx11_1.0.3.bb b/recipes/xorg-lib/libx11_1.0.3.bb
deleted file mode 100644
index 40cbeb5..0000000
--- a/recipes/xorg-lib/libx11_1.0.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require libx11.inc
-LICENSE = "XFree86"
-DEPENDS = "${COMMON_DEPENDS}"
-PR = "${INC_PR}.0"
-
-SRC_URI += " file://ruutf8.patch"
-SRC_URI[archive.md5sum] = "60b787a812c92d33f71860e4e19cb59d"
-SRC_URI[archive.sha256sum] = "fb42f2400c3709a0c2c17f27cc4a902c191ebd6228c70698891bf3a13ea5b3ac"
-
-EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/xorg-lib/libx11_1.1.1.bb b/recipes/xorg-lib/libx11_1.1.1.bb
deleted file mode 100644
index 368dd7b..0000000
--- a/recipes/xorg-lib/libx11_1.1.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require libx11.inc
-DEPENDS = "${COMMON_DEPENDS}"
-PR = "${INC_PR}.0"
-
-SRC_URI += " file://ruutf8.patch"
-SRC_URI[archive.md5sum] = "848b80f77b20ae1fa5c882bbfa531ebc"
-SRC_URI[archive.sha256sum] = "5359db57793430429786b648ac570d4ab205797306e049bf1e8675250af21541"
-
-EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/xorg-lib/libx11_1.1.2.bb b/recipes/xorg-lib/libx11_1.1.2.bb
deleted file mode 100644
index 60093c1..0000000
--- a/recipes/xorg-lib/libx11_1.1.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libx11.inc
-DEPENDS = "${COMMON_DEPENDS}"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "710bf38a9477a5a1b235bc94f1d0593c"
-SRC_URI[archive.sha256sum] = "b77e4fd2bbd4092e7e78d0964760ad8ab160caccd4bc6d7d0c87a23febaea85e"
-
-EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/xorg-lib/libx11_1.1.3.bb b/recipes/xorg-lib/libx11_1.1.3.bb
deleted file mode 100644
index d6aa199..0000000
--- a/recipes/xorg-lib/libx11_1.1.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libx11.inc
-DEPENDS = "${COMMON_DEPENDS}"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4d43d3e472c552d2f191ecdd4e75112c"
-SRC_URI[archive.sha256sum] = "4a2f566e2ea5dd955c875cb8fa9c18dd725324fc5cf4e23c803442e31ab8917a"
-
-EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/xorg-lib/libx11_1.1.4.bb b/recipes/xorg-lib/libx11_1.1.4.bb
deleted file mode 100644
index 3eeeece..0000000
--- a/recipes/xorg-lib/libx11_1.1.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libx11.inc
-DEPENDS = "${COMMON_DEPENDS}"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1469a5a8aa8d288dce6f4c45d2f68dc3"
-SRC_URI[archive.sha256sum] = "bdbd6d239435c1736f5c532b12e8078761db8db5f37ab3195fe11c3e5b692c1c"
-
-EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/xorg-lib/libx11_1.2.bb b/recipes/xorg-lib/libx11_1.2.bb
deleted file mode 100644
index 0cea5f8..0000000
--- a/recipes/xorg-lib/libx11_1.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require libx11.inc
-DEPENDS = "${COMMON_DEPENDS}"
-PR = "${INC_PR}.0"
-
-SRC_URI += " file://dolt-fix.patch"
-SRC_URI[archive.md5sum] = "c6265b59ea2b594fd68e33f9125b4d20"
-SRC_URI[archive.sha256sum] = "e4863cdf5d471763806e9bcae25ea47606a56cd91a5546a34c093aa3de181051"
-
-EXTRA_OECONF += " --without-xcb"
diff --git a/recipes/xorg-lib/libx11_1.3.3.bb b/recipes/xorg-lib/libx11_1.3.3.bb
deleted file mode 100644
index 8c40a99..0000000
--- a/recipes/xorg-lib/libx11_1.3.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libx11.inc
-PR = "${INC_PR}.0"
-
-SRC_URI += " file://dolt-fix.patch"
-SRC_URI[archive.md5sum] = "5d74971360f194ce33d2bd2e4d9b066c"
-SRC_URI[archive.sha256sum] = "8c7f867918a3739dc7cabe955179539d4a7ecc52cb42becfd261e5dfbff511ac"
diff --git a/recipes/xorg-lib/libx11_1.3.4.bb b/recipes/xorg-lib/libx11_1.3.4.bb
deleted file mode 100644
index e55d720..0000000
--- a/recipes/xorg-lib/libx11_1.3.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libx11.inc
-PR = "${INC_PR}.0"
-
-SRC_URI += " file://dolt-fix.patch"
-SRC_URI[archive.md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
-SRC_URI[archive.sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
diff --git a/recipes/xorg-lib/libx11_git.bb b/recipes/xorg-lib/libx11_git.bb
deleted file mode 100644
index eac68d8..0000000
--- a/recipes/xorg-lib/libx11_git.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require libx11.inc
-PV = "1.3.3+git"
-PR = "${INC_PR}.0"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libX11;protocol=git"
-SRC_URI += " file://keysymdef_include.patch \
-             file://x11_disable_makekeys.patch \
-             file://dolt-fix.patch \
-"
-
-SRCREV = "c3f3e4a9e531d010312c97e753d6e543e607094d"
-S = "${WORKDIR}/git"
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/xorg-lib/libxau_1.0.3.bb b/recipes/xorg-lib/libxau_1.0.3.bb
deleted file mode 100644
index cd4f79b..0000000
--- a/recipes/xorg-lib/libxau_1.0.3.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "A Sample Authorization Protocol for X"
-DEPENDS += " xproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "75a9f2b85cd1617b5ca98c9095323853"
-SRC_URI[archive.sha256sum] = "d6c30a88770a720e96e0bd7e13e0334f9ef60f1b475a92556764828005c19e3b"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXau"
diff --git a/recipes/xorg-lib/libxau_1.0.4.bb b/recipes/xorg-lib/libxau_1.0.4.bb
deleted file mode 100644
index 293fc63..0000000
--- a/recipes/xorg-lib/libxau_1.0.4.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "A Sample Authorization Protocol for X"
-DEPENDS += " xproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0f2b88d857e0a3f5898e4759c541af46"
-SRC_URI[archive.sha256sum] = "10d3ffa5f00d0c0a4083309ba68bdfa01dfdf912ef4cf2141e3f260b2edeb22c"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXau"
diff --git a/recipes/xorg-lib/libxaw_1.0.3.bb b/recipes/xorg-lib/libxaw_1.0.3.bb
deleted file mode 100644
index 87ec70e..0000000
--- a/recipes/xorg-lib/libxaw_1.0.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Athena Widget Set"
-DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ee215536ea78798268ab3a444d10135a"
-SRC_URI[archive.sha256sum] = "45ca55bdac904a07b8118618c65ddb5bf8826e626c4c927e3c2508c58e231514"
-
-do_install_append () {
-    ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-    ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
-    ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
-}
-
-PACKAGES =+ "libxaw6 libxaw7 libxaw8"
-
-FILES_libxaw6 = "${libdir}/libXaw6.so.6*"
-FILES_libxaw7 = "${libdir}/libXaw7.so.7*"
-FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
-
-XORG_PN = "libXaw"
diff --git a/recipes/xorg-lib/libxaw_1.0.4.bb b/recipes/xorg-lib/libxaw_1.0.4.bb
deleted file mode 100644
index 2ed715d..0000000
--- a/recipes/xorg-lib/libxaw_1.0.4.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Athena Widget Set"
-DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "73671d8f1cf36fdd81395328cc3539c9"
-SRC_URI[archive.sha256sum] = "11f4ab184fb8dc853fd95238d4de7b251427dd036643d11fd2a669232fa35af9"
-
-do_install_append () {
-    ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-    ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
-    ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
-}
-
-PACKAGES =+ "libxaw6 libxaw7 libxaw8"
-
-FILES_libxaw6 = "${libdir}/libXaw6.so.6*"
-FILES_libxaw7 = "${libdir}/libXaw7.so.7*"
-FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
-
-XORG_PN = "libXaw"
diff --git a/recipes/xorg-lib/libxcomposite/change-include-order.patch b/recipes/xorg-lib/libxcomposite/change-include-order.patch
deleted file mode 100644
index 630b881..0000000
--- a/recipes/xorg-lib/libxcomposite/change-include-order.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-This patch makes the build use its own Xcomposite.h over rather than an
-older Xcomposite.h that might already be installed in the staging dir.
-
---- libXcomposite-X11R7.0-0.2.2.2/src/Makefile.am.orig	2006-03-12 20:10:17.000000000 +0100
-+++ libXcomposite-X11R7.0-0.2.2.2/src/Makefile.am	2006-03-12 20:10:35.000000000 +0100
-@@ -21,7 +21,7 @@
- #  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
- #  PERFORMANCE OF THIS SOFTWARE.
- 
--AM_CFLAGS = $(XCOMPOSITE_CFLAGS) $(XCOMPOSITE_CFLAGS) $(X_CFLAGS) -I$(top_srcdir)/include
-+AM_CFLAGS = -I$(top_srcdir)/include $(XCOMPOSITE_CFLAGS) $(XCOMPOSITE_CFLAGS) $(X_CFLAGS)
- 
- lib_LTLIBRARIES = libXcomposite.la
- 
diff --git a/recipes/xorg-lib/libxcomposite_0.3.1.bb b/recipes/xorg-lib/libxcomposite_0.3.1.bb
deleted file mode 100644
index d7f8beb..0000000
--- a/recipes/xorg-lib/libxcomposite_0.3.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Composite extension library."
-LICENSE = "BSD-X"
-DEPENDS += " compositeproto virtual/libx11 libxfixes"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += " file://change-include-order.patch"
-SRC_URI[archive.md5sum] = "a80650d660486ea7bb2e5fd84a83799a"
-SRC_URI[archive.sha256sum] = "d42b59d3c38dae5e4fec375d12e56e7a5764ba10e8b8ec70f9ce951fc9cec72b"
-
-XORG_PN = "libXcomposite"
diff --git a/recipes/xorg-lib/libxcomposite_0.4.0.bb b/recipes/xorg-lib/libxcomposite_0.4.0.bb
deleted file mode 100644
index 2dff14a..0000000
--- a/recipes/xorg-lib/libxcomposite_0.4.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Composite extension library."
-LICENSE = "BSD-X"
-DEPENDS += " compositeproto virtual/libx11 libxfixes libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += " file://change-include-order.patch"
-SRC_URI[archive.md5sum] = "7e95395dea89be21bae929b9b7f16641"
-SRC_URI[archive.sha256sum] = "7db759e82dd1f68094e4c4d257025f7893dafb2913ed249e00cbe18fa13c7510"
-
-XORG_PN = "libXcomposite"
diff --git a/recipes/xorg-lib/libxcursor_1.1.8.bb b/recipes/xorg-lib/libxcursor_1.1.8.bb
deleted file mode 100644
index 3f175e8..0000000
--- a/recipes/xorg-lib/libxcursor_1.1.8.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X cursor management library"
-LICENSE = "BSD-X"
-DEPENDS += "libxrender libxfixes"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ec2acd10a7736a85dd1e1ed9ea5bec96"
-SRC_URI[archive.sha256sum] = "8f039f81af52c88d583fba48b878abd074542221cb0030638ad52336b4ae1377"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXcursor"
diff --git a/recipes/xorg-lib/libxcursor_1.1.9.bb b/recipes/xorg-lib/libxcursor_1.1.9.bb
deleted file mode 100644
index 2b363a5..0000000
--- a/recipes/xorg-lib/libxcursor_1.1.9.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X cursor management library"
-LICENSE = "BSD-X"
-DEPENDS += "libxrender libxfixes"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "99b7554037a92b260891091e81815a0a"
-SRC_URI[archive.sha256sum] = "1dffb3542271c8ce964066d561474caec5b639d6588b257b21cfb8225a15d2b4"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXcursor"
diff --git a/recipes/xorg-lib/libxdamage_1.0.4.bb b/recipes/xorg-lib/libxdamage_1.0.4.bb
deleted file mode 100644
index 452c634..0000000
--- a/recipes/xorg-lib/libxdamage_1.0.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Damage extension library."
-LICENSE = "BSD-X"
-DEPENDS += " virtual/libx11 damageproto libxfixes fixesproto xextproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4d0eece7a8372a7754db1de08c2be324"
-SRC_URI[archive.sha256sum] = "5df90f0efa77e1d6f9e1768a2b0adfc896d09c7a3d8680ed0980511b3625c636"
-
-XORG_PN = "libXdamage"
diff --git a/recipes/xorg-lib/libxdamage_1.1.1.bb b/recipes/xorg-lib/libxdamage_1.1.1.bb
deleted file mode 100644
index cb7eca1..0000000
--- a/recipes/xorg-lib/libxdamage_1.1.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 damaged region extension library"
-LICENSE = "BSD-X"
-DEPENDS += "damageproto libxfixes"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ac0ce6b0063a9858c8f24ddb4c60487d"
-SRC_URI[archive.sha256sum] = "0102754db23952a1c3adf7881bbf191f91ca3e3d183e1b0179452bce932fae2e"
-
-XORG_PN = "libXdamage"
diff --git a/recipes/xorg-lib/libxdmcp_1.0.2.bb b/recipes/xorg-lib/libxdmcp_1.0.2.bb
deleted file mode 100644
index 1226afb..0000000
--- a/recipes/xorg-lib/libxdmcp_1.0.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Display Manager Control Protocol library"
-DEPENDS += "xproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "10facf2bc7cbd5e5c1a698b8a210a582"
-SRC_URI[archive.sha256sum] = "f3e50c1847599145c22784a2f15818821960652ee91d21d905817fb7c10f96a8"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXdmcp"
diff --git a/recipes/xorg-lib/libxext_1.0.2.bb b/recipes/xorg-lib/libxext_1.0.2.bb
deleted file mode 100644
index 02326de..0000000
--- a/recipes/xorg-lib/libxext_1.0.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Server Extension library"
-PRIORITY = "optional"
-DEPENDS += " xproto virtual/libx11 xextproto libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "cce89c5b941a493512b534f4847c6111"
-SRC_URI[archive.sha256sum] = "368e4cf5117febd998e6fc40d096b3af19a571adccc5ed49b9d16e482b3a8f8e"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXext"
diff --git a/recipes/xorg-lib/libxext_1.0.3.bb b/recipes/xorg-lib/libxext_1.0.3.bb
deleted file mode 100644
index f8d76b4..0000000
--- a/recipes/xorg-lib/libxext_1.0.3.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 miscellaneous extension library"
-DEPENDS += "xproto virtual/libx11 xextproto libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1bf6fa1c26f9957d7cc0bd90b038dfa6"
-SRC_URI[archive.sha256sum] = "2d706baf206d1cb422c8e0ceb6c5a8546bc3f0587cf090eba51e75a295d9c3f0"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXext"
diff --git a/recipes/xorg-lib/libxext_1.0.4.bb b/recipes/xorg-lib/libxext_1.0.4.bb
deleted file mode 100644
index 1317e5c..0000000
--- a/recipes/xorg-lib/libxext_1.0.4.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 miscellaneous extension library"
-DEPENDS += "xproto virtual/libx11 xextproto libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a91f1f722ac80c597cf0b75dcb8b48c0"
-SRC_URI[archive.sha256sum] = "2dfd8eace1cafacc87b4055c57efeb771a740e24141d3f113de58c2a9eebd21f"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXext"
diff --git a/recipes/xorg-lib/libxext_1.0.5.bb b/recipes/xorg-lib/libxext_1.0.5.bb
deleted file mode 100644
index 40dbece..0000000
--- a/recipes/xorg-lib/libxext_1.0.5.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 miscellaneous extension library"
-DEPENDS += "xproto virtual/libx11 xextproto libxau libxdmcp"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "aa11d859cc8e9a0bad3bb55e1666547b"
-SRC_URI[archive.sha256sum] = "1280af98466cb4484a89858ede3347ba9d7785baeb80b11f2066142dc2317d97"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXext"
diff --git a/recipes/xorg-lib/libxfixes_4.0.3.bb b/recipes/xorg-lib/libxfixes_4.0.3.bb
deleted file mode 100644
index d574764..0000000
--- a/recipes/xorg-lib/libxfixes_4.0.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Fixes extension library."
-LICENSE = "BSD-X"
-DEPENDS += "virtual/libx11 xproto fixesproto xextproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1990d19725a3c7f32290037f02d3737f"
-SRC_URI[archive.sha256sum] = "547e093c5037c4b85ce653ce26f5bd70a97b177f9b582f5351a626d8e0a829dd"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXfixes"
diff --git a/recipes/xorg-lib/libxfont/builtinreaddirectory-no-side-effect.patch b/recipes/xorg-lib/libxfont/builtinreaddirectory-no-side-effect.patch
deleted file mode 100644
index dd30743..0000000
--- a/recipes/xorg-lib/libxfont/builtinreaddirectory-no-side-effect.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-commit 7670d4a2720c61fbc7b989fed14c676f04ac3ad1
-Author: Dodji Seketeli <dodji@openedhand.com>
-Date:   Mon Jul 16 12:24:34 2007 +0200
-
-    Remove side effects from BuiltinReadDirectory()
-    
-    The first time BuiltinReadDirectory() is called,
-    save the content of builtin_dir and builtin_alias,
-    before calling FontFileAddFontFile(), because that fonction
-    will modify those.
-    
-    Then, in subsequent calls to BuiltinReadDirectory(), restore
-    builtin_dir and builtin_alias so that the side effect incurred
-    by the first call disappears.
-
-diff --git a/src/builtins/dir.c b/src/builtins/dir.c
-index c272449..97f1e1e 100644
---- a/src/builtins/dir.c
-+++ b/src/builtins/dir.c
-@@ -29,6 +29,133 @@
- #endif
- #include "builtin.h"
- 
-+BuiltinDirPtr
-+BuiltinDirsDup (const BuiltinDirPtr a_dirs,
-+                int a_dirs_len)
-+{
-+    BuiltinDirPtr dirs=NULL ;
-+    int i=0 ;
-+
-+    if (!a_dirs)
-+        return NULL ;
-+
-+    dirs = xcalloc (a_dirs_len, sizeof (BuiltinDirRec)) ;
-+    if (!dirs)
-+        return NULL ;
-+
-+    for (i=0; i < a_dirs_len; i++) {
-+        int len = strlen (a_dirs[i].file_name) ;
-+        dirs[i].file_name = xcalloc (1, len) ;
-+        memmove (dirs[i].file_name, a_dirs[i].file_name, len);
-+        len = strlen (a_dirs[i].font_name) ;
-+        dirs[i].font_name = xcalloc (1, len) ;
-+        memmove (dirs[i].font_name, a_dirs[i].font_name, len);
-+    }
-+    return dirs ;
-+}
-+
-+/**
-+ * Copy a_save back into a_cur
-+ * @param a_cur the instance of BuiltinDir to restore
-+ * @param a_saved the saved instance of BuiltinDir to copy into a_cur
-+ * @return 0 if went okay, 1 otherwise.
-+ */
-+int
-+BuiltinDirRestore (BuiltinDirPtr a_cur,
-+                   const BuiltinDirPtr a_saved)
-+{
-+    if (!a_cur)
-+        return 1 ;
-+    if (!a_saved)
-+        return 0 ;
-+
-+    if (a_saved->font_name)
-+        memmove (a_cur->font_name, a_saved->font_name, strlen (a_saved->font_name)) ;
-+    return 0 ;
-+}
-+
-+
-+int
-+BuiltinDirsRestore (BuiltinDirPtr a_cur_tab,
-+                    const BuiltinDirPtr a_saved_tab,
-+                    int a_tab_len)
-+{
-+    int i=0 ;
-+
-+    if (!a_cur_tab)
-+        return 1 ;
-+    if (!a_saved_tab)
-+        return 0 ;
-+
-+    for (i=0 ; i < a_tab_len; i++) {
-+        if (BuiltinDirRestore (&a_cur_tab[i], &a_saved_tab[i]))
-+            return 1 ;
-+    }
-+    return 0 ;
-+}
-+
-+BuiltinAliasPtr
-+BuiltinAliasesDup (const BuiltinAliasPtr a_aliases,
-+                   int a_aliases_len)
-+{
-+    BuiltinAliasPtr aliases=NULL ;
-+    int i=0 ;
-+
-+    if (!a_aliases)
-+        return NULL ;
-+
-+    aliases = xcalloc (a_aliases_len, sizeof (BuiltinAliasRec)) ;
-+    if (!aliases)
-+        return NULL ;
-+
-+    for (i=0; i < a_aliases_len; i++) {
-+        int len = strlen (a_aliases[i].font_name) ;
-+        aliases[i].font_name = xcalloc (1, len) ;
-+        memmove (aliases[i].font_name, a_aliases[i].font_name, len);
-+    }
-+    return aliases ;
-+}
-+
-+/**
-+ * Copy a_save back into a_cur
-+ * @param a_cur the instance of BuiltinAlias to restore
-+ * @param a_saved the saved instance of BuiltinAlias to copy into a_cur
-+ * @return 0 if went okay, 1 otherwise.
-+ */
-+int
-+BuiltinAliasRestore (BuiltinAliasPtr a_cur,
-+                     const BuiltinAliasPtr a_save)
-+{
-+    if (!a_cur)
-+        return 1 ;
-+    if (!a_save)
-+        return 0 ;
-+    if (a_save->alias_name)
-+        memmove (a_cur->alias_name, a_save->alias_name, strlen (a_save->alias_name)) ;
-+    if (a_save->font_name)
-+        memmove (a_cur->font_name, a_save->font_name, strlen (a_save->font_name)) ;
-+    return 0 ;
-+}
-+
-+int
-+BuiltinAliasesRestore (BuiltinAliasPtr a_cur_tab,
-+                       const BuiltinAliasPtr a_saved_tab,
-+                       int a_tab_len)
-+{
-+    int i=0 ;
-+
-+    if (!a_cur_tab)
-+        return 1 ;
-+    if (!a_saved_tab)
-+        return 0 ;
-+
-+    for (i=0 ; i < a_tab_len; i++) {
-+        if (BuiltinAliasRestore (&a_cur_tab[i], &a_saved_tab[i]))
-+            return 1 ;
-+    }
-+    return 0 ;
-+}
-+
- int
- BuiltinReadDirectory (char *directory, FontDirectoryPtr *pdir)
- {
-@@ -36,6 +163,34 @@ BuiltinReadDirectory (char *directory, FontDirectoryPtr *pdir)
-     int			i;
- 
-     dir = FontFileMakeDir ("", builtin_dir_count);
-+    static BuiltinDirPtr saved_builtin_dir ;
-+    static BuiltinAliasPtr saved_builtin_alias ;
-+
-+
-+    if (saved_builtin_dir)
-+    {
-+        BuiltinDirsRestore ((BuiltinDirPtr) builtin_dir,
-+                            saved_builtin_dir,
-+                            builtin_dir_count) ;
-+    }
-+    else
-+    {
-+        saved_builtin_dir = BuiltinDirsDup ((const BuiltinDirPtr) builtin_dir,
-+                                            builtin_dir_count) ;
-+    }
-+
-+    if (saved_builtin_alias)
-+    {
-+        BuiltinAliasesRestore ((BuiltinAliasPtr) builtin_alias,
-+                               saved_builtin_alias,
-+                               builtin_alias_count) ;
-+    }
-+    else
-+    {
-+        saved_builtin_alias = BuiltinAliasesDup ((const BuiltinAliasPtr) builtin_alias,
-+                                                 builtin_alias_count) ;
-+    }
-+
-     for (i = 0; i < builtin_dir_count; i++)
-     {
- 	if (!FontFileAddFontFile (dir,
diff --git a/recipes/xorg-lib/libxfont/no-scalable-crash.patch b/recipes/xorg-lib/libxfont/no-scalable-crash.patch
deleted file mode 100644
index 90bded6..0000000
--- a/recipes/xorg-lib/libxfont/no-scalable-crash.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- /tmp/fontdir.c	2006-08-01 16:17:22.000000000 +0200
-+++ libXfont-1.2.0/src/fontfile/fontdir.c	2006-08-01 16:20:37.248306000 +0200
-@@ -695,6 +695,11 @@
-      */
-     if (isscale)
-     {
-+	/* If the fontname says it is scalable, make sure that the
-+  	 * renderer supports OpenScalable and GetInfoScalable.
-+	 */
-+       if (renderer->OpenScalable && renderer->GetInfoScalable)
-+       {
- 	if (vals.values_supplied & SIZE_SPECIFY_MASK)
- 	{
- 	    bzero((char *)&zeroVals, sizeof(zeroVals));
-@@ -794,6 +799,7 @@
-                                            bitmap->name.name);
-             }
- 	}
-+       }
-     }
-     return TRUE;
- }
diff --git a/recipes/xorg-lib/libxfont_1.2.7.bb b/recipes/xorg-lib/libxfont_1.2.7.bb
deleted file mode 100644
index b470c8b..0000000
--- a/recipes/xorg-lib/libxfont_1.2.7.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X font library (used by the X server)."
-PRIORITY = "optional"
-LICENSE = "BSD-X"
-DEPENDS += " freetype fontcacheproto zlib xproto xtrans fontsproto libfontenc"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://no-scalable-crash.patch"
-SRC_URI[archive.md5sum] = "2f2085310f75900044d9dcd469637d26"
-SRC_URI[archive.sha256sum] = "2f8c004c0b914d460e6fd2b48d8b425cf4778d415467fc1f1d938b200462d18b"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXfont"
diff --git a/recipes/xorg-lib/libxfont_1.2.8.bb b/recipes/xorg-lib/libxfont_1.2.8.bb
deleted file mode 100644
index 3794cf2..0000000
--- a/recipes/xorg-lib/libxfont_1.2.8.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X font library (used by the X server)."
-PRIORITY = "optional"
-LICENSE = "BSD-X"
-DEPENDS += " freetype fontcacheproto zlib xproto xtrans fontsproto libfontenc"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://no-scalable-crash.patch"
-SRC_URI[archive.md5sum] = "83b8e21f6ee22512a8f72ba51e2d74f6"
-SRC_URI[archive.sha256sum] = "374a2ca12f62a4d9f09a17a34765a5289cefa9db7f9f0913e1c3731b4088aad8"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXfont"
diff --git a/recipes/xorg-lib/libxfont_1.3.0.bb b/recipes/xorg-lib/libxfont_1.3.0.bb
deleted file mode 100644
index c3c9377..0000000
--- a/recipes/xorg-lib/libxfont_1.3.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 font rasterisation library"
-LICENSE = "BSD-X"
-DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://no-scalable-crash.patch \
-            file://builtinreaddirectory-no-side-effect.patch"
-SRC_URI[archive.md5sum] = "d1d3fa170d74b066f1f23ca8574e7c90"
-SRC_URI[archive.sha256sum] = "07567b9880f28d1a404389c024a185419bfe81136aef3d9eda52407f34c3d3dd"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXfont"
diff --git a/recipes/xorg-lib/libxfont_1.3.1.bb b/recipes/xorg-lib/libxfont_1.3.1.bb
deleted file mode 100644
index 671fd58..0000000
--- a/recipes/xorg-lib/libxfont_1.3.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 font rasterisation library"
-LICENSE = "BSD-X"
-DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://no-scalable-crash.patch"
-SRC_URI[archive.md5sum] = "b2f396b62633819bbdd9748383876e21"
-SRC_URI[archive.sha256sum] = "dcfb7dc980a16ad98ac984b98321148864ea8b4637d3dd3773e483a14158a9b1"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXfont"
diff --git a/recipes/xorg-lib/libxfont_1.3.2.bb b/recipes/xorg-lib/libxfont_1.3.2.bb
deleted file mode 100644
index 250433a..0000000
--- a/recipes/xorg-lib/libxfont_1.3.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 font rasterisation library"
-LICENSE = "BSD-X"
-DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://no-scalable-crash.patch"
-SRC_URI[archive.md5sum] = "64f510ebf9679f3a97a3d633cbee4f50"
-SRC_URI[archive.sha256sum] = "c167cfd529b7c67f496ee0bed3c0b43e0107de0f689d387c1c0e23ef7cf3d2f2"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXfont"
diff --git a/recipes/xorg-lib/libxfont_1.3.3.bb b/recipes/xorg-lib/libxfont_1.3.3.bb
deleted file mode 100644
index 65b5415..0000000
--- a/recipes/xorg-lib/libxfont_1.3.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 font rasterisation library"
-LICENSE = "BSD-X"
-DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4f174b9613f87cf00d731da428a1b194"
-SRC_URI[archive.sha256sum] = "6171e6bca4bd6333611bd9c63cccc8e8e412d876c72097f0dddc490a9df51d5a"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXfont"
diff --git a/recipes/xorg-lib/libxfontcache_1.0.4.bb b/recipes/xorg-lib/libxfontcache_1.0.4.bb
deleted file mode 100644
index f4a079e..0000000
--- a/recipes/xorg-lib/libxfontcache_1.0.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X-TrueType font cache extension client library"
-DEPENDS += "libxext fontcacheproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1adca018aa7bf2d215f20a69c10828ad"
-SRC_URI[archive.sha256sum] = "ffe747cfbf81cdd862af1b05d021ad1ab83b623eab5b32b0a618efb4c0f3e01c"
-
-XORG_PN = "libXfontcache"
diff --git a/recipes/xorg-lib/libxft_2.1.12.bb b/recipes/xorg-lib/libxft_2.1.12.bb
deleted file mode 100644
index 14beef39..0000000
--- a/recipes/xorg-lib/libxft_2.1.12.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "FreeType-based font drawing library for X"
-DEPENDS += "libxrender freetype fontconfig"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1309301e2d979bd475dc58325cb8c056"
-SRC_URI[archive.sha256sum] = "68b46f85caaf0b30c876bd983abe144c25755bee7532e8738ab7ebe29a428986"
-
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-                ${libdir}/*.a ${libdir}/pkgconfig \
-                ${datadir}/aclocal ${bindir} ${sbindir}"
-
-python do_package() {
-        if bb.data.getVar('DEBIAN_NAMES', d, 1):
-            bb.data.setVar('PKG_${PN}', 'libxft2', d)
-        bb.build.exec_func('package_do_package', d)
-}
-
-XORG_PN = "libXft"
diff --git a/recipes/xorg-lib/libxft_2.1.13.bb b/recipes/xorg-lib/libxft_2.1.13.bb
deleted file mode 100644
index a2219c9..0000000
--- a/recipes/xorg-lib/libxft_2.1.13.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "FreeType-based font drawing library for X"
-DEPENDS += "libxrender freetype fontconfig"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "bc8881851f3bd8dcc625fac37350a1c6"
-SRC_URI[archive.sha256sum] = "ce7688258af34c14af421bcfb306d4310245b727d2417ac968b7f6b2facfde8c"
-
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-                ${libdir}/*.a ${libdir}/pkgconfig \
-                ${datadir}/aclocal ${bindir} ${sbindir}"
-
-python do_package() {
-        if bb.data.getVar('DEBIAN_NAMES', d, 1):
-            bb.data.setVar('PKG_${PN}', 'libxft2', d)
-        bb.build.exec_func('package_do_package', d)
-}
-
-XORG_PN = "libXft"
diff --git a/recipes/xorg-lib/libxi_1.0.2.bb b/recipes/xorg-lib/libxi_1.0.2.bb
deleted file mode 100644
index 12e49f0..0000000
--- a/recipes/xorg-lib/libxi_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Input extension library."
-DEPENDS += " xproto virtual/libx11 xextproto libxext inputproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4a5207a29a6b220e5462129854689844"
-SRC_URI[archive.sha256sum] = "7e6339539d3d0a4fc95cc23ca2b13ae67dd783e011b3cc5ca76040e376bff57f"
-
-XORG_PN = "libXi"
diff --git a/recipes/xorg-lib/libxi_1.1.0.bb b/recipes/xorg-lib/libxi_1.1.0.bb
deleted file mode 100644
index 3ad5dfc..0000000
--- a/recipes/xorg-lib/libxi_1.1.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Input extension library."
-DEPENDS += " xproto virtual/libx11 xextproto libxext inputproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c25abbe604029855eb11a3a75fb1f386"
-SRC_URI[archive.sha256sum] = "0f90d7e27d8a7d6bccf9350b6283ffe122e5347fa51d4ea9055653b297339989"
-
-XORG_PN = "libXi"
diff --git a/recipes/xorg-lib/libxi_1.1.2.bb b/recipes/xorg-lib/libxi_1.1.2.bb
deleted file mode 100644
index bff8ba4..0000000
--- a/recipes/xorg-lib/libxi_1.1.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Input extension library"
-DEPENDS += "libxext inputproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9c4dd85f3e2a75bfb60bd288502bc288"
-SRC_URI[archive.sha256sum] = "4deda13613f03e4524d3cf0ac14b9e20be5044d415cb8478713ecbe47f4de862"
-
-XORG_PN = "libXi"
diff --git a/recipes/xorg-lib/libxi_1.1.3.bb b/recipes/xorg-lib/libxi_1.1.3.bb
deleted file mode 100644
index 039bfc8..0000000
--- a/recipes/xorg-lib/libxi_1.1.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Input extension library"
-DEPENDS += "libxext inputproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7c510abb0cad8dc20493fb27ff7859d8"
-SRC_URI[archive.sha256sum] = "c77a5bbe97d0d0a6493adefcf1bd57aca91bc33279633b3f6cf1d2bb8812153f"
-
-XORG_PN = "libXi"
diff --git a/recipes/xorg-lib/libxi_1.2.0.bb b/recipes/xorg-lib/libxi_1.2.0.bb
deleted file mode 100644
index e6b3da7..0000000
--- a/recipes/xorg-lib/libxi_1.2.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Input extension library"
-DEPENDS += "libxext inputproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4b88e07d7dd77ca1e786f09066b58c02"
-SRC_URI[archive.sha256sum] = "7c0125ffb864e121ebfb5a20b1cfdff60562c2f2dfbb4e77c5eac81f36e15f3a"
-
-XORG_PN = "libXi"
diff --git a/recipes/xorg-lib/libxinerama_1.0.2.bb b/recipes/xorg-lib/libxinerama_1.0.2.bb
deleted file mode 100644
index 786c294..0000000
--- a/recipes/xorg-lib/libxinerama_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Xinerama extension library"
-DEPENDS += "libxext xineramaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f6fb08eafd3c2909d515f1a07bfca8fd"
-SRC_URI[archive.sha256sum] = "d245d7ae4c766ecbc4e5cc2666e2e78198d8386dbaa06b35c3d1b1457ee5d03d"
-
-XORG_PN = "libXinerama"
diff --git a/recipes/xorg-lib/libxinerama_1.0.3.bb b/recipes/xorg-lib/libxinerama_1.0.3.bb
deleted file mode 100644
index 4e7cc91..0000000
--- a/recipes/xorg-lib/libxinerama_1.0.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Xinerama extension library"
-DEPENDS += "libxext xineramaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "cd9f7c46439ac40e0517a302d2434d2c"
-SRC_URI[archive.sha256sum] = "07b3564cd56154c20580b56230b7a95d74fe6582c80cedf0550d8d7955181219"
-
-XORG_PN = "libXinerama"
diff --git a/recipes/xorg-lib/libxkbfile_1.0.4.bb b/recipes/xorg-lib/libxkbfile_1.0.4.bb
deleted file mode 100644
index d02cec5..0000000
--- a/recipes/xorg-lib/libxkbfile_1.0.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 keyboard file manipulation library"
-LICENSE = "GPL"
-DEPENDS += "virtual/libx11 kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "12b4ceb5d42b520228b5fb40a96ae6c5"
-SRC_URI[archive.sha256sum] = "468ade4eaa3951a7c34b6ae1c290ab1a1d364ee36c5c455ef0df15550825b8ae"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-lib/libxkbfile_1.0.5.bb b/recipes/xorg-lib/libxkbfile_1.0.5.bb
deleted file mode 100644
index 60d3a1b..0000000
--- a/recipes/xorg-lib/libxkbfile_1.0.5.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 keyboard file manipulation library"
-LICENSE = "GPL"
-DEPENDS += "virtual/libx11 kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0726a845fe5a56551de2718c9f6b0e35"
-SRC_URI[archive.sha256sum] = "0ab628271fc9cb6d05f861d9823573088d81d510aca95b87ac0504b2e558965f"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-lib/libxmu_1.0.3.bb b/recipes/xorg-lib/libxmu_1.0.3.bb
deleted file mode 100644
index b5bc535..0000000
--- a/recipes/xorg-lib/libxmu_1.0.3.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 miscellaneous utility library"
-DEPENDS += "libxt libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b926b95b811ece3e19cd590db85ee615"
-SRC_URI[archive.sha256sum] = "b56e308e36da8d9cb48433ddb81fd04e26b4f1c695586ac8106ac48a35466d66"
-
-PACKAGES =+ "libxmuu libxmuu-dev"
-
-FILES_libxmuu = "${libdir}/libXmuu.so.*"
-FILES_libxmuu-dev = "${libdir}/libXmuu.so"
-
-LEAD_SONAME = "libXmu"
-
-XORG_PN = "libXmu"
diff --git a/recipes/xorg-lib/libxmu_1.0.4.bb b/recipes/xorg-lib/libxmu_1.0.4.bb
deleted file mode 100644
index 7ebe4c8..0000000
--- a/recipes/xorg-lib/libxmu_1.0.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 miscellaneous utility library"
-DEPENDS += "libxt libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fb372a5f3ab42b5ba16d7af4d833a0cb"
-SRC_URI[archive.sha256sum] = "f83c00d6ed8f4c08effa9dcc2d7f1ff6f5a753f2b9fe1babda16618c2afa18f0"
-
-PACKAGES =+ "libxmuu libxmuu-dev"
-
-FILES_libxmuu = "${libdir}/libXmuu.so.*"
-FILES_libxmuu-dev = "${libdir}/libXmuu.so"
-
-LEAD_SONAME = "libXmu"
-
-XORG_PN = "libXmu"
diff --git a/recipes/xorg-lib/libxpm_3.5.6.bb b/recipes/xorg-lib/libxpm_3.5.6.bb
deleted file mode 100644
index 977f015..0000000
--- a/recipes/xorg-lib/libxpm_3.5.6.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Pixmap library"
-LICENSE = "X-BSD"
-DEPENDS += "libxext libsm libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "37b7d1826c6a02107269632a93b8791f"
-SRC_URI[archive.sha256sum] = "2d5c5242b8417db6aa758e5be387de33385d9960ff21c801af7d6a4730b4fd0d"
-
-PACKAGES =+ "sxpm cxpm"
-
-FILES_cxpm = "${bindir}/cxpm"
-FILES_sxpm = "${bindir}/sxpm"
-
-XORG_PN = "libXpm"
diff --git a/recipes/xorg-lib/libxpm_3.5.7.bb b/recipes/xorg-lib/libxpm_3.5.7.bb
deleted file mode 100644
index b8ed813..0000000
--- a/recipes/xorg-lib/libxpm_3.5.7.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Pixmap library"
-LICENSE = "X-BSD"
-DEPENDS += "libxext libsm libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "cd15ee542d9f515538b4462a6f79d977"
-SRC_URI[archive.sha256sum] = "64701ae67ce5b0797307b75d8255bec3a0d371d0c50715ea618f5a68bcc92baa"
-
-PACKAGES =+ "sxpm cxpm"
-
-FILES_cxpm = "${bindir}/cxpm"
-FILES_sxpm = "${bindir}/sxpm"
-
-XORG_PN = "libXpm"
diff --git a/recipes/xorg-lib/libxrandr_1.1.2.bb b/recipes/xorg-lib/libxrandr_1.1.2.bb
deleted file mode 100644
index 4fb614c..0000000
--- a/recipes/xorg-lib/libxrandr_1.1.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Resize and Rotate extension library."
-LICENSE = "BSD-X"
-DEPENDS += " virtual/libx11 randrproto libxext xextproto libxrender renderproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "962946952a01650bb43206043a3c0e12"
-SRC_URI[archive.sha256sum] = "ba5adedc37da835a5c9e5a5d457dce13feead64fc364bc4719c41720ca0a3c50"
-
-BBCLASSEXTEND = "nativesdk"
-
-XORG_PN = "libXrandr"
diff --git a/recipes/xorg-lib/libxrandr_1.2.2.bb b/recipes/xorg-lib/libxrandr_1.2.2.bb
deleted file mode 100644
index 2038f8a..0000000
--- a/recipes/xorg-lib/libxrandr_1.2.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Resize and Rotate extension library"
-LICENSE = "BSD-X"
-DEPENDS += "randrproto libxrender libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1b244b5d19f0ccab01d7083436cd3558"
-SRC_URI[archive.sha256sum] = "206f8dc850f12b1213fb73dbef09fafa1bb8fb8c3ddfe4d39721c1e2dec12a98"
-
-BBCLASSEXTEND = "nativesdk"
-
-XORG_PN = "libXrandr"
diff --git a/recipes/xorg-lib/libxrandr_1.2.3.bb b/recipes/xorg-lib/libxrandr_1.2.3.bb
deleted file mode 100644
index 22ab29d..0000000
--- a/recipes/xorg-lib/libxrandr_1.2.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Resize and Rotate extension library"
-LICENSE = "BSD-X"
-DEPENDS += "randrproto libxrender libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5cd67cc02a50c9644ba0a1846ea3b08e"
-SRC_URI[archive.sha256sum] = "f8edfe26b8c4c3677a3a949f81a8b09a5fad62972020bfd230401e11cc0ed267"
-
-BBCLASSEXTEND = "nativesdk"
-
-XORG_PN = "libXrandr"
diff --git a/recipes/xorg-lib/libxrender_0.9.2.bb b/recipes/xorg-lib/libxrender_0.9.2.bb
deleted file mode 100644
index c67495a..0000000
--- a/recipes/xorg-lib/libxrender_0.9.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Rendering Extension client library"
-LICENSE = "BSD-X"
-DEPENDS += "virtual/libx11 renderproto xproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2f1b2c6e8dcbcb6d760e59f445abd92c"
-SRC_URI[archive.sha256sum] = "0f749183ab1a0ece14d33c3299b3f70893122349c0bfa9d7bd0e66ce19d1802a"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXrender"
diff --git a/recipes/xorg-lib/libxrender_0.9.3.bb b/recipes/xorg-lib/libxrender_0.9.3.bb
deleted file mode 100644
index 82b0143..0000000
--- a/recipes/xorg-lib/libxrender_0.9.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Rendering Extension client library"
-LICENSE = "BSD-X"
-DEPENDS += "virtual/libx11 renderproto xproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "307132fce2e551ad2c641bddf8480f16"
-SRC_URI[archive.sha256sum] = "9882ba2d74e9ca5cfd0c2231ac8eba14d8fc59d538c787fa639f8d77c996bbef"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXrender"
diff --git a/recipes/xorg-lib/libxrender_0.9.4.bb b/recipes/xorg-lib/libxrender_0.9.4.bb
deleted file mode 100644
index 4543a9e..0000000
--- a/recipes/xorg-lib/libxrender_0.9.4.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Rendering Extension client library"
-LICENSE = "BSD-X"
-DEPENDS += "virtual/libx11 renderproto xproto libxdmcp"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "dc266e850c51368f964e0d67bf5fb5e6"
-SRC_URI[archive.sha256sum] = "5682d343dd4e7ef291a6577e956c331946ce5801d8fa076284a01b41de3017ec"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXrender"
diff --git a/recipes/xorg-lib/libxres_1.0.3.bb b/recipes/xorg-lib/libxres_1.0.3.bb
deleted file mode 100644
index 9a1aa01..0000000
--- a/recipes/xorg-lib/libxres_1.0.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Resource extension library"
-DEPENDS += "libxext resourceproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "de66ffb657aba64c9d6dbdeabb757f3e"
-SRC_URI[archive.sha256sum] = "a6d5ba7573f5ec0f091095f01b51d1e671dd0f14acb5b8559cdf366e398a0230"
-
-XORG_PN = "libXres"
diff --git a/recipes/xorg-lib/libxscrnsaver_1.1.2.bb b/recipes/xorg-lib/libxscrnsaver_1.1.2.bb
deleted file mode 100644
index db164d2..0000000
--- a/recipes/xorg-lib/libxscrnsaver_1.1.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Screen Saver extension library"
-LICENSE = "GPL"
-DEPENDS += "libxext scrnsaverproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ac2d697dd02f51e5c15f7104f4be5328"
-SRC_URI[archive.sha256sum] = "6c75debca746060e0c2408a6ca119613ae02d1054adebd4b26ff8beee79bcc67"
-
-RREPLACES_${PN} = "libxss"
-
-XORG_PN = "libXScrnSaver"
diff --git a/recipes/xorg-lib/libxscrnsaver_1.1.3.bb b/recipes/xorg-lib/libxscrnsaver_1.1.3.bb
deleted file mode 100644
index 2cc2c81..0000000
--- a/recipes/xorg-lib/libxscrnsaver_1.1.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Screen Saver extension library"
-LICENSE = "GPL"
-DEPENDS += "libxext scrnsaverproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "93f84b6797f2f29cae1ce23b0355d00d"
-SRC_URI[archive.sha256sum] = "4b90245093c15a24aaaf2fc6e09f075137aad994f72043e098597997d9b2c988"
-
-RREPLACES_${PN} = "libxss"
-
-XORG_PN = "libXScrnSaver"
diff --git a/recipes/xorg-lib/libxt/pr10970-header-fix.patch b/recipes/xorg-lib/libxt/pr10970-header-fix.patch
deleted file mode 100644
index 2acafb8..0000000
--- a/recipes/xorg-lib/libxt/pr10970-header-fix.patch
+++ /dev/null
@@ -1,512 +0,0 @@
-diff --git a/include/X11/CallbackI.h b/include/X11/CallbackI.h
-index 4ae08ab..64e8152 100644
---- a/include/X11/CallbackI.h
-+++ b/include/X11/CallbackI.h
-@@ -58,6 +58,8 @@ typedef XrmResource **CallbackTable;
- #define _XtCBCalling 1
- #define _XtCBFreeAfterCalling 2
- 
-+_XFUNCPROTOBEGIN
-+
- typedef struct internalCallbackRec {
-     unsigned short count;
-     char	   is_padded;	/* contains NULL padding for external form */
-@@ -115,3 +117,5 @@ extern void _XtCallConditionalCallbackList(
-     XtPointer			/* call_data */,
-     _XtConditionProc		/* cond_proc */
- );
-+
-+_XFUNCPROTOEND
-diff --git a/include/X11/CompositeP.h b/include/X11/CompositeP.h
-index ed055b2..e93275a 100644
---- a/include/X11/CompositeP.h
-+++ b/include/X11/CompositeP.h
-@@ -52,6 +52,8 @@ SOFTWARE.
- 
- #include <X11/Composite.h>
- 
-+_XFUNCPROTOBEGIN
-+
- /************************************************************************
-  *
-  * Additional instance fields for widgets of (sub)class 'Composite' 
-@@ -101,6 +103,8 @@ typedef struct _CompositeClassRec {
- 
- externalref CompositeClassRec compositeClassRec;
- 
-+_XFUNCPROTOEND
-+
- #define XtCompositeExtensionVersion 2L
- #define XtInheritGeometryManager ((XtGeometryHandler) _XtInherit)
- #define XtInheritChangeManaged ((XtWidgetProc) _XtInherit)
-diff --git a/include/X11/ConstrainP.h b/include/X11/ConstrainP.h
-index a90d19a..7030a34 100644
---- a/include/X11/ConstrainP.h
-+++ b/include/X11/ConstrainP.h
-@@ -52,6 +52,8 @@ SOFTWARE.
- 
- #include <X11/Constraint.h>
- 
-+_XFUNCPROTOBEGIN
-+
- typedef struct _ConstraintPart {
-     XtPointer   mumble;		/* No new fields, keep C compiler happy */
- } ConstraintPart;
-@@ -88,6 +90,8 @@ typedef struct _ConstraintClassRec {
- 
- externalref ConstraintClassRec constraintClassRec;
- 
-+_XFUNCPROTOEND
-+
- #define XtConstraintExtensionVersion 1L
- 
- #endif /* _XtConstraintP_h */
-diff --git a/include/X11/Constraint.h b/include/X11/Constraint.h
-index 9bb962e..b8bd902 100644
---- a/include/X11/Constraint.h
-+++ b/include/X11/Constraint.h
-@@ -50,11 +50,15 @@ SOFTWARE.
- #ifndef _XtConstraint_h
- #define _XtConstraint_h
- 
-+_XFUNCPROTOBEGIN
-+
- typedef struct _ConstraintClassRec *ConstraintWidgetClass;
- 
- #ifndef CONSTRAINT
- externalref WidgetClass constraintWidgetClass;
- #endif
- 
-+_XFUNCPROTOEND
-+
- #endif /* _XtConstraint_h */
- /* DON'T ADD STUFF AFTER THIS #endif */
-diff --git a/include/X11/ConvertI.h b/include/X11/ConvertI.h
-index 02c0e5c..f3f7fb0 100644
---- a/include/X11/ConvertI.h
-+++ b/include/X11/ConvertI.h
-@@ -48,6 +48,8 @@ SOFTWARE.
- ******************************************************************/
- /* $XFree86: xc/lib/Xt/ConvertI.h,v 1.3 2001/12/14 19:56:09 dawes Exp $ */
- 
-+_XFUNCPROTOBEGIN
-+
- /* Representation types */
- 
- extern	XrmQuark  _XtQString;
-@@ -94,3 +96,4 @@ extern Boolean _XtConvert(
- 
- void _XtConvertInitialize(void);
- 
-+_XFUNCPROTOEND
-diff --git a/include/X11/Core.h b/include/X11/Core.h
-index ff6cb75..e1a7c28 100644
---- a/include/X11/Core.h
-+++ b/include/X11/Core.h
-@@ -53,6 +53,8 @@ SOFTWARE.
- #ifndef _XtCore_h
- #define _XtCore_h
- 
-+_XFUNCPROTOBEGIN
-+
- typedef struct _WidgetClassRec *CoreWidgetClass;
- typedef struct _WidgetRec *CoreWidget;
- externalref WidgetClass coreWidgetClass;
-@@ -62,5 +64,7 @@ externalref WidgetClass widgetClass;
- 
- #endif
- 
-+_XFUNCPROTOEND
-+
- #endif /* _XtCore_h */
- /* DON'T ADD STUFF AFTER THIS #endif */
-diff --git a/include/X11/CoreP.h b/include/X11/CoreP.h
-index e07f085..57836e6 100644
---- a/include/X11/CoreP.h
-+++ b/include/X11/CoreP.h
-@@ -55,6 +55,8 @@ SOFTWARE.
- 
- #include <X11/Core.h>
- 
-+_XFUNCPROTOBEGIN
-+
- externalref int _XtInheritTranslations;
- 
- #define XtInheritTranslations  ((String) &_XtInheritTranslations)
-@@ -167,5 +169,7 @@ typedef struct _WidgetClassRec {
- externalref WidgetClassRec widgetClassRec;
- #define coreClassRec widgetClassRec
- 
-+_XFUNCPROTOEND
-+
- #endif /* _XtCoreP_h */
- /* DON'T ADD STUFF AFTER THIS #endif */
-diff --git a/include/X11/CreateI.h b/include/X11/CreateI.h
-index 87abb1d..e0ca9a3 100644
---- a/include/X11/CreateI.h
-+++ b/include/X11/CreateI.h
-@@ -3,6 +3,8 @@
- #ifndef _XtcreateI_h
- #define _XtcreateI_h
- 
-+_XFUNCPROTOBEGIN
-+
- extern Widget _XtCreateWidget(String name, WidgetClass widget_class,
- 			      Widget parent, ArgList args, Cardinal num_args,
- 			      XtTypedArgList typed_args,
-@@ -18,9 +20,12 @@ extern Widget _XtAppCreateShell(String name, String class,
- 				Cardinal num_typed_args);
- extern Widget _XtCreateHookObj(Screen *screen);
- 
-+_XFUNCPROTOEND
- 
- #include <stdarg.h>
- 
-+_XFUNCPROTOBEGIN
-+
- /* VarCreate.c */
- extern Widget _XtVaOpenApplication(XtAppContext *app_context_return,
- 			_Xconst char* application_class,
-@@ -34,4 +39,6 @@ extern Widget _XtVaAppInitialize(XtAppContext *app_context_return,
- 			int *argc_in_out, String *argv_in_out,
- 			String *fallback_resources, va_list var_args);
- 
-+_XFUNCPROTOEND
-+
- #endif /* _XtcreateI_h */
-diff --git a/include/X11/EventI.h b/include/X11/EventI.h
-index 00858e7..d2d1d0f 100644
---- a/include/X11/EventI.h
-+++ b/include/X11/EventI.h
-@@ -65,6 +65,8 @@ typedef struct _XtGrabRec  *XtGrabList;
- 
- #include "PassivGraI.h"
- 
-+_XFUNCPROTOBEGIN
-+
- extern void _XtEventInitialize(
-     void
- );
-@@ -131,4 +133,6 @@ extern void _XtFillAncestorList(Widget **listPtr, int *maxElemsPtr,
- /* NextEvent.c */
- extern Boolean XtAppPeekEvent_SkipTimer;
- 
-+_XFUNCPROTOEND
-+
- #endif /* _Event_h_ */
-diff --git a/include/X11/HookObjI.h b/include/X11/HookObjI.h
-index c9a22a2..c0858c2 100644
---- a/include/X11/HookObjI.h
-+++ b/include/X11/HookObjI.h
-@@ -29,6 +29,8 @@ in this Software without prior written authorization from The Open Group.
- #ifndef _XtHookObjI_h
- #define _XtHookObjI_h
- 
-+_XFUNCPROTOBEGIN
-+
- /* This object is implementation-dependent and private to the library. */
- 
- typedef struct _HookObjRec *HookObject;
-@@ -66,6 +68,8 @@ typedef struct _HookObjClassRec {
- 
- externalref HookObjClassRec hookObjClassRec;
- 
-+_XFUNCPROTOEND
-+
- #endif /* ifndef _Xt_HookObjI_h */
- 
- 
-diff --git a/include/X11/InitialI.h b/include/X11/InitialI.h
-index c2fe47c..2ae9b74 100644
---- a/include/X11/InitialI.h
-+++ b/include/X11/InitialI.h
-@@ -84,6 +84,8 @@ SOFTWARE.
- #include <X11/Xos.h>
- #include <X11/Xpoll.h>
- 
-+_XFUNCPROTOBEGIN
-+
- typedef struct _TimerEventRec {
-         struct timeval        te_timer_value;
- 	struct _TimerEventRec *te_next;
-@@ -426,4 +428,6 @@ extern XrmDatabase _XtPreparseCommandLine(XrmOptionDescRec *urlist,
- 			String *applName, String *displayName,
- 			String *language);
- 
-+_XFUNCPROTOEND
-+
- #endif /* _XtinitialI_h */
-diff --git a/include/X11/IntrinsicI.h b/include/X11/IntrinsicI.h
-index d749867..d88166f 100644
---- a/include/X11/IntrinsicI.h
-+++ b/include/X11/IntrinsicI.h
-@@ -194,6 +194,8 @@ SOFTWARE.
- #define ERRORDB "/usr/lib/X11/XtErrorDB"
- #endif
- 
-+_XFUNCPROTOBEGIN
-+
- extern String XtCXtToolkitError;
- 
- extern void _XtAllocError(
-@@ -257,5 +259,7 @@ extern char* __XtCalloc (
- #define __XtCalloc XtCalloc
- #endif
- 
-+_XFUNCPROTOEND
-+
- #endif /* _XtintrinsicI_h */
- /* DON'T ADD STUFF AFTER THIS #endif */
-diff --git a/include/X11/Object.h b/include/X11/Object.h
-index 96723b1..2c84aaf 100644
---- a/include/X11/Object.h
-+++ b/include/X11/Object.h
-@@ -50,11 +50,16 @@ SOFTWARE.
- #ifndef _XtObject_h
- #define _XtObject_h
- 
-+_XFUNCPROTOBEGIN
-+
- typedef struct _ObjectRec *Object;
- typedef struct _ObjectClassRec *ObjectClass;
- 
- #ifndef OBJECT
- externalref WidgetClass objectClass;
- #endif
-+
-+_XFUNCPROTOEND
-+
- #endif /* _XtObject_h */
- /* DON'T ADD STUFF AFTER THIS #endif */
-diff --git a/include/X11/ObjectP.h b/include/X11/ObjectP.h
-index a24564e..0f484d2 100644
---- a/include/X11/ObjectP.h
-+++ b/include/X11/ObjectP.h
-@@ -52,6 +52,8 @@ SOFTWARE.
- 
- #include <X11/Object.h>
- 
-+_XFUNCPROTOBEGIN
-+
- /**********************************************************
-  * Object Instance Data Structures
-  *
-@@ -132,6 +134,8 @@ typedef struct _ObjectClassRec {
- 
- externalref ObjectClassRec objectClassRec;
- 
-+_XFUNCPROTOEND
-+
- #define XtObjectExtensionVersion 1L
- #define XtInheritAllocate ((XtAllocateProc) _XtInherit)
- #define XtInheritDeallocate ((XtDeallocateProc) _XtInherit)
-diff --git a/include/X11/PassivGraI.h b/include/X11/PassivGraI.h
-index 02e2964..10591ac 100644
---- a/include/X11/PassivGraI.h
-+++ b/include/X11/PassivGraI.h
-@@ -60,6 +60,8 @@ in this Software without prior written authorization from The Open Group.
- #define KEYBOARD TRUE
- #define POINTER  FALSE
- 
-+_XFUNCPROTOBEGIN
-+
- typedef enum {
-     XtNoServerGrab, 
-     XtPassiveServerGrab,
-@@ -183,4 +185,6 @@ extern void _XtClearAncestorCache(
-     Widget		/* widget */
- );
- 
-+_XFUNCPROTOEND
-+
- #endif /* _PDI_h_ */
-diff --git a/include/X11/RectObj.h b/include/X11/RectObj.h
-index 07615fa..dced5c3 100644
---- a/include/X11/RectObj.h
-+++ b/include/X11/RectObj.h
-@@ -50,11 +50,16 @@ SOFTWARE.
- #ifndef _XtRect_h
- #define _XtRect_h
- 
-+_XFUNCPROTOBEGIN
-+
- typedef struct _RectObjRec *RectObj;
- typedef struct _RectObjClassRec *RectObjClass;
- 
- #ifndef RECTOBJ
- externalref WidgetClass rectObjClass;
- #endif
-+
-+_XFUNCPROTOEND
-+
- #endif /* _XtRect_h */
- /* DON'T ADD STUFF AFTER THIS #endif */
-diff --git a/include/X11/RectObjP.h b/include/X11/RectObjP.h
-index ca3b8ad..d6ffb78 100644
---- a/include/X11/RectObjP.h
-+++ b/include/X11/RectObjP.h
-@@ -53,6 +53,8 @@ SOFTWARE.
- #include <X11/RectObj.h>
- #include <X11/ObjectP.h>
- 
-+_XFUNCPROTOBEGIN
-+
- /**********************************************************
-  * Rectangle Object Instance Data Structures
-  *
-@@ -126,4 +128,6 @@ typedef struct _RectObjClassRec {
- 
- externalref RectObjClassRec rectObjClassRec;
- 
-+_XFUNCPROTOEND
-+
- #endif /*_Xt_RectObjP_h_*/
-diff --git a/include/X11/ResourceI.h b/include/X11/ResourceI.h
-index d6ed1df..3db97f8 100644
---- a/include/X11/ResourceI.h
-+++ b/include/X11/ResourceI.h
-@@ -61,6 +61,8 @@ SOFTWARE.
- #define StringToName(string) XrmStringToName(string)
- #define StringToClass(string) XrmStringToClass(string)
- 
-+_XFUNCPROTOBEGIN
-+
- extern void _XtDependencies(
-     XtResourceList  * /* class_resp */,
-     Cardinal	    * /* class_num_resp */,
-@@ -96,5 +98,6 @@ extern XrmResourceList* _XtCreateIndirectionTable(XtResourceList resources,
- 						  Cardinal num_resources);
- extern void _XtResourceListInitialize(void);
- 
-+_XFUNCPROTOEND
- 
- #endif /* _XtresourceI_h */
-diff --git a/include/X11/ShellP.h b/include/X11/ShellP.h
-index 2b08c3f..7297d33 100644
---- a/include/X11/ShellP.h
-+++ b/include/X11/ShellP.h
-@@ -67,6 +67,8 @@ SOFTWARE.
-  * *****
-  */
- 
-+_XFUNCPROTOBEGIN
-+
- /***********************************************************************
-  *
-  * Shell Widget Private Data
-@@ -214,8 +216,12 @@ typedef  struct {
- 	WMShellPart	wm;
- } WMShellRec, *WMShellWidget;
- 
-+_XFUNCPROTOEND
-+
- #include <X11/VendorP.h>
- 
-+_XFUNCPROTOBEGIN
-+
- /***********************************************************************
-  *
-  * TransientShell Widget Private Data
-@@ -425,4 +431,6 @@ typedef  struct {
- 	SessionShellPart session;
- } SessionShellRec, *SessionShellWidget;
- 
-+_XFUNCPROTOEND
-+
- #endif /* _XtShellPrivate_h */
-diff --git a/include/X11/ThreadsI.h b/include/X11/ThreadsI.h
-index 1492d77..28cbc98 100644
---- a/include/X11/ThreadsI.h
-+++ b/include/X11/ThreadsI.h
-@@ -81,6 +81,8 @@ typedef void (*ThreadAppRestoreLockProc)(
-     Boolean* /* pushed_thread */
- );
- 
-+_XFUNCPROTOBEGIN
-+
- extern void (*_XtProcessLock)(
-     void
- );
-@@ -93,6 +95,8 @@ extern void (*_XtInitAppLock)(
-     XtAppContext /* app */
- );
- 
-+_XFUNCPROTOEND
-+
- #define INIT_APP_LOCK(app) if(_XtInitAppLock) (*_XtInitAppLock)(app)
- #define FREE_APP_LOCK(app) if(app && app->free_lock)(*app->free_lock)(app)
- 
-diff --git a/include/X11/TranslateI.h b/include/X11/TranslateI.h
-index 1224875..6cc3099 100644
---- a/include/X11/TranslateI.h
-+++ b/include/X11/TranslateI.h
-@@ -342,6 +342,8 @@ typedef struct _TMGlobalRec{
- #endif /* TRACE_TM */
- }TMGlobalRec;
- 
-+_XFUNCPROTOBEGIN
-+
- extern TMGlobalRec _XtGlobalTM;
- 
- #define TM_MOD_SEGMENT_SIZE 	16
-@@ -604,3 +606,4 @@ extern void _XtUnmergeTranslations(
- /* TMKey.c */
- extern void _XtAllocTMContext(XtPerDisplay pd);
- 
-+_XFUNCPROTOEND
-diff --git a/include/X11/VarargsI.h b/include/X11/VarargsI.h
-index e15404a..76ce9bc 100644
---- a/include/X11/VarargsI.h
-+++ b/include/X11/VarargsI.h
-@@ -34,6 +34,8 @@ in this Software without prior written authorization from The Open Group.
-  
- /* private routines */
- 
-+_XFUNCPROTOBEGIN
-+
- extern void _XtCountVaList(
-     va_list /*var*/, int* /*total_count*/, int* /*typed_count*/
- );
-@@ -62,4 +64,6 @@ extern void _XtGetSubresources(
-     Widget /*w*/, XtPointer /*base*/, const char* /*name*/, const char* /*class*/, XtResourceList /*resources*/, Cardinal /*num_resources*/, ArgList /*args*/, Cardinal /*num_args*/, XtTypedArgList /*typed_args*/, Cardinal /*num_typed_args*/
- );
- 
-+_XFUNCPROTOEND
-+
- #endif /* _VarargsI_h_ */
-diff --git a/include/X11/Vendor.h b/include/X11/Vendor.h
-index 65e7c38..633d17a 100644
---- a/include/X11/Vendor.h
-+++ b/include/X11/Vendor.h
-@@ -65,7 +65,11 @@ SOFTWARE.
- 
- typedef struct _VendorShellClassRec *VendorShellWidgetClass;
- 
-+_XFUNCPROTOBEGIN
-+
- externalref WidgetClass vendorShellWidgetClass;
- 
-+_XFUNCPROTOEND
-+
- #endif /* _XtVendor_h */
- /* DON'T ADD STUFF AFTER THIS #endif */
-diff --git a/include/X11/VendorP.h b/include/X11/VendorP.h
-index 08bf689..e60857d 100644
---- a/include/X11/VendorP.h
-+++ b/include/X11/VendorP.h
-@@ -72,6 +72,8 @@ SOFTWARE.
- 
- /* New fields for the VendorShell widget class record */
- 
-+_XFUNCPROTOBEGIN
-+
- typedef struct {
-     XtPointer       extension;          /* pointer to extension record      */
- } VendorShellClassPart;
-@@ -100,4 +102,6 @@ typedef  struct {
- 	VendorShellPart	vendor;
- } VendorShellRec, *VendorShellWidget;
- 
-+_XFUNCPROTOEND
-+
- #endif  /* _XtVendorPrivate_h */
diff --git a/recipes/xorg-lib/libxt_1.0.4.bb b/recipes/xorg-lib/libxt_1.0.4.bb
deleted file mode 100644
index 7dd9863..0000000
--- a/recipes/xorg-lib/libxt_1.0.4.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Toolkit Intrinsics"
-PRIORITY = "optional"
-DEPENDS += " libsm virtual/libx11 xproto kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://pr10970-header-fix.patch"
-SRC_URI[archive.md5sum] = "937735f342c046db239852fec0413f6c"
-SRC_URI[archive.sha256sum] = "ec7088b2ffe8f56c177525283601fb048decaf6f175d9ee5db01e12810a4d345"
-
-EXTRA_OECONF = "--enable-malloc0returnsnull --disable-install-makestrs --disable-xkb"
-
-do_compile() {
-        (
-                unset CC LD CXX CCLD
-                oe_runmake -C util 'XT_CFLAGS=' 'CC=${BUILD_CC}' 'LD=${BUILD_LD}' 'CXX=${BUILD_CXX}' 'CCLD=${BUILD_CCLD}' 'CFLAGS=-D_GNU_SOURCE ${BUILD_CFLAGS}' 'LDFLAGS=${BUILD_LDFLAGS}' 'CXXFLAGS=${BUILD_CXXFLAGS}' 'CPPFLAGS=${BUILD_CPPFLAGS}' makestrs
-        ) || exit 1
-        oe_runmake
-}
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXt"
diff --git a/recipes/xorg-lib/libxt_1.0.5.bb b/recipes/xorg-lib/libxt_1.0.5.bb
deleted file mode 100644
index 7bdf252..0000000
--- a/recipes/xorg-lib/libxt_1.0.5.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 toolkit intrinsics library"
-DEPENDS += "libsm virtual/libx11 kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://pr10970-header-fix.patch"
-SRC_URI[archive.md5sum] = "f3bdd67785ace8cd0b23249e9d8c9975"
-SRC_URI[archive.sha256sum] = "43c472ada59a04428a463225cd4cd42cb81bc43eb687cc1890f2f1c81a3e9cf4"
-
-EXTRA_OECONF += "--disable-install-makestrs --disable-xkb"
-
-do_compile() {
-        (
-                unset CC LD CXX CCLD
-                oe_runmake -C util 'XT_CFLAGS=' 'CC=${BUILD_CC}' 'LD=${BUILD_LD}' 'CXX=${BUILD_CXX}' 'CCLD=${BUILD_CCLD}' 'CFLAGS=-D_GNU_SOURCE -I${STAGING_INCDIR_NATIVE} ${BUILD_CFLAGS}' 'LDFLAGS=${BUILD_LDFLAGS}' 'CXXFLAGS=${BUILD_CXXFLAGS}' 'CPPFLAGS=${BUILD_CPPFLAGS}' makestrs
-        ) || exit 1
-        oe_runmake
-}
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXt"
diff --git a/recipes/xorg-lib/libxtst_1.0.2.bb b/recipes/xorg-lib/libxtst_1.0.2.bb
deleted file mode 100644
index ff87f7c..0000000
--- a/recipes/xorg-lib/libxtst_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Test Extension: client side library"
-DEPENDS += "libxext recordproto inputproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "032d5c1d3914fc0224837328c88aef96"
-SRC_URI[archive.sha256sum] = "eef98ad3d35254384c3714cd63826fc2009f9b394f2b489718aba9be7be0a10b"
-
-XORG_PN = "libXtst"
diff --git a/recipes/xorg-lib/libxtst_1.0.3.bb b/recipes/xorg-lib/libxtst_1.0.3.bb
deleted file mode 100644
index 56dfae5..0000000
--- a/recipes/xorg-lib/libxtst_1.0.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Test Extension: client side library"
-DEPENDS += "libxext recordproto inputproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "090c1ad04e34982eada5cf3b1a0792fd"
-SRC_URI[archive.sha256sum] = "b4a8dd3d9ceb04cd7322c1f7e5d2320d6ccf85ba8c81d736fd6d6c83c658c905"
-
-XORG_PN = "libXtst"
diff --git a/recipes/xorg-lib/libxv_1.0.3.bb b/recipes/xorg-lib/libxv_1.0.3.bb
deleted file mode 100644
index 4f19126..0000000
--- a/recipes/xorg-lib/libxv_1.0.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Video extension library"
-LICENSE = "GPL"
-DEPENDS += "libxext videoproto"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f1c4109fa804aeaf7188b66c5cdd9f57"
-SRC_URI[archive.sha256sum] = "f87ae65be39a3c26dc3c87159d9126daf2af1b8c5e7f2ffc38b9f72b9236261b"
-
-XORG_PN = "libXv"
diff --git a/recipes/xorg-lib/libxv_1.0.4.bb b/recipes/xorg-lib/libxv_1.0.4.bb
deleted file mode 100644
index be5a50c..0000000
--- a/recipes/xorg-lib/libxv_1.0.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Video extension library"
-LICENSE = "GPL"
-DEPENDS += "libxext videoproto"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "723a0275227165383e967a1ca8899b52"
-SRC_URI[archive.sha256sum] = "4d3cc49b6f4da6d396196054eca23a91df1a41001c736dcfd22fec5a5c7428c8"
-
-XORG_PN = "libXv"
diff --git a/recipes/xorg-lib/libxvmc/drm.patch b/recipes/xorg-lib/libxvmc/drm.patch
deleted file mode 100644
index d48cdb3..0000000
--- a/recipes/xorg-lib/libxvmc/drm.patch
+++ /dev/null
@@ -1,9 +0,0 @@
---- XvMC/hw/via/Makefile.am.old	2005-03-06 11:25:11.000000000 +0000
-+++ XvMC/hw/via/Makefile.am	2005-03-06 11:25:22.000000000 +0000
-@@ -1,5 +1,5 @@
- AM_CFLAGS = $(XVMC_CFLAGS)
--libviaXvMC_la_LIBADD = $(XVMC_LIBS) -lxf86drm
-+libviaXvMC_la_LIBADD = $(XVMC_LIBS) -ldrm
- 
- lib_LTLIBRARIES = libviaXvMC.la
- 
diff --git a/recipes/xorg-lib/libxvmc/true.patch b/recipes/xorg-lib/libxvmc/true.patch
deleted file mode 100644
index 7059295..0000000
--- a/recipes/xorg-lib/libxvmc/true.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- XvMC/hw/via/viaXvMC.c.old	2004-10-18 20:54:49.000000000 +0100
-+++ XvMC/hw/via/viaXvMC.c	2004-10-18 20:55:03.000000000 +0100
-@@ -43,6 +43,8 @@
- #include <xf86drm.h>
- #include <pthread.h>
- #include "vldXvMC.h"
-+
-+#define TRUE 1
-     
- #define SAREAPTR(ctx) ((ViaXvMCSAreaPriv *) \
- 		       (((CARD8 *)(ctx)->sAreaAddress) +	\
diff --git a/recipes/xorg-lib/libxvmc/via.patch b/recipes/xorg-lib/libxvmc/via.patch
deleted file mode 100644
index 21cdfbd..0000000
--- a/recipes/xorg-lib/libxvmc/via.patch
+++ /dev/null
@@ -1,23 +0,0 @@
---- XvMC/configure.ac.old	2004-09-18 13:16:31.000000000 +0100
-+++ XvMC/configure.ac	2004-09-18 13:16:32.000000000 +0100
-@@ -14,4 +14,5 @@
- AC_OUTPUT([Makefile
-            hw/Makefile
- 	   hw/i810/Makefile
-+	   hw/via/Makefile
-            xvmc.pc])
---- /dev/null	2004-06-13 02:32:19.000000000 +0100
-+++ XvMC/hw/via/Makefile.am	2004-09-18 13:16:01.000000000 +0100
-@@ -0,0 +1,7 @@
-+AM_CFLAGS = $(XVMC_CFLAGS)
-+libviaXvMC_la_LIBADD = $(XVMC_LIBS) -lxf86drm
-+
-+lib_LTLIBRARIES = libviaXvMC.la
-+
-+libviaXvMC_la_SOURCES = viaXvMC.c viaXvMC.h viaLowLevel.c viaLowLevel.h \
-+		viaXvMCPriv.h
---- XvMC/hw/Makefile.am.old	2004-10-17 22:34:27.000000000 +0100
-+++ XvMC/hw/Makefile.am	2004-10-17 22:34:31.000000000 +0100
-@@ -1 +1 @@
--SUBDIRS = i810
-+SUBDIRS = i810 via
diff --git a/recipes/xorg-lib/libxvmc_1.0.4.bb b/recipes/xorg-lib/libxvmc_1.0.4.bb
deleted file mode 100644
index 003c5be..0000000
--- a/recipes/xorg-lib/libxvmc_1.0.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Video Motion Compensation extension library"
-DEPENDS += "libxext libxv videoproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b54600573daf9d1a29b952e8d35b389e"
-SRC_URI[archive.sha256sum] = "1217825ba8d66198466ee8306d0d6d237d2dd80d0f0783c98701296791833abb"
-
-XORG_PN = "libXvMC"
diff --git a/recipes/xorg-lib/libxvmc_1.0.5.bb b/recipes/xorg-lib/libxvmc_1.0.5.bb
deleted file mode 100644
index cdd965a..0000000
--- a/recipes/xorg-lib/libxvmc_1.0.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Video Motion Compensation extension library"
-DEPENDS += "libxext libxv videoproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "16c3a11add14979beb7510e44623cac6"
-SRC_URI[archive.sha256sum] = "0644c768d28343af0efe0cb09fc9e0220b8ad755642bb498a3038cee328fde7f"
-
-XORG_PN = "libXvMC"
diff --git a/recipes/xorg-lib/libxxf86dga_1.0.1.bb b/recipes/xorg-lib/libxxf86dga_1.0.1.bb
deleted file mode 100644
index 6d51967..0000000
--- a/recipes/xorg-lib/libxxf86dga_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Direct Graphics Access extension library"
-DEPENDS += "libxext xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5b0e752c71a23e9d1290cad44a7c7c75"
-SRC_URI[archive.sha256sum] = "8c68f429942b1258cff0fb27505645a463690374ecf318ae660ff4cde7a03db9"
-
-XORG_PN = "libXxf86dga"
diff --git a/recipes/xorg-lib/libxxf86dga_1.0.2.bb b/recipes/xorg-lib/libxxf86dga_1.0.2.bb
deleted file mode 100644
index b311537..0000000
--- a/recipes/xorg-lib/libxxf86dga_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Direct Graphics Access extension library"
-DEPENDS += "libxext xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6f5f621804ee652b6cc6f2025c517c78"
-SRC_URI[archive.sha256sum] = "59175230a00a1fb359148f36eadb50fc6cb080849379ccb0e43c6cbb97309a25"
-
-XORG_PN = "libXxf86dga"
diff --git a/recipes/xorg-lib/libxxf86misc_1.0.1.bb b/recipes/xorg-lib/libxxf86misc_1.0.1.bb
deleted file mode 100644
index 91a7123..0000000
--- a/recipes/xorg-lib/libxxf86misc_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 XFree86 miscellaneous extension library"
-DEPENDS += "libxext xf86miscproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7cee0df63903cef7f7a3fb68cdd99eef"
-SRC_URI[archive.sha256sum] = "2122d67d49aaa06eeaeb3db173ea8a7048f3b52665e5135874bc5cadada91289"
-
-XORG_PN = "libXxf86misc"
diff --git a/recipes/xorg-lib/libxxf86vm_1.0.1.bb b/recipes/xorg-lib/libxxf86vm_1.0.1.bb
deleted file mode 100644
index b13707c..0000000
--- a/recipes/xorg-lib/libxxf86vm_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 XFree86 video mode extension library"
-DEPENDS += "libxext xf86vidmodeproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8de1ca6c55aaad7d8cae19b4f0b3da32"
-SRC_URI[archive.sha256sum] = "e08fc2c1611c422f751ed02810491b45bf7faa4207d762a11f11815263c9285a"
-
-XORG_PN = "libXxf86vm"
diff --git a/recipes/xorg-lib/libxxf86vm_1.0.2.bb b/recipes/xorg-lib/libxxf86vm_1.0.2.bb
deleted file mode 100644
index e693362..0000000
--- a/recipes/xorg-lib/libxxf86vm_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 XFree86 video mode extension library"
-DEPENDS += "libxext xf86vidmodeproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "304d37bd0a10d9b58aa9b64469ad73e5"
-SRC_URI[archive.sha256sum] = "3cb3c3c6552a4fbc686ba6c2dbeb6e4ba2a27103279908831d56363de73951de"
-
-XORG_PN = "libXxf86vm"
diff --git a/recipes/xorg-lib/pixman-0.12.0/pixman-arm.patch b/recipes/xorg-lib/pixman-0.12.0/pixman-arm.patch
new file mode 100644
index 0000000..91dda03
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.12.0/pixman-arm.patch
@@ -0,0 +1,632 @@
+From: Jeff Muizelaar <jmuizelaar@mozilla.com>
+Date: Wed, 17 Sep 2008 19:53:20 +0000 (-0400)
+Subject: Add support for ARMv6 SIMD fastpaths.
+X-Git-Url: http://gitweb.freedesktop.org/?p=pixman.git;a=commitdiff;h=d0b181f347ef4720d130beee3f03196afbd28aba
+
+Add support for ARMv6 SIMD fastpaths.
+---
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -277,6 +277,44 @@ AC_SUBST(VMX_CFLAGS)
+ 
+ AM_CONDITIONAL(USE_VMX, test $have_vmx_intrinsics = yes)
+ 
++dnl Check for ARM
++
++have_armv6_simd=no
++AC_MSG_CHECKING(whether to use ARM assembler)
++xserver_save_CFLAGS=$CFLAGS
++CFLAGS="$CFLAGS $ARM_CFLAGS"
++AC_COMPILE_IFELSE([
++int main () {
++    asm("uqadd8 r1, r1, r2");
++    return 0;
++}], have_armv6_simd=yes)
++CFLAGS=$xserver_save_CFLAGS
++
++AC_ARG_ENABLE(arm,
++   [AC_HELP_STRING([--disable-arm],
++                   [disable ARM fast paths])],
++   [enable_arm=$enableval], [enable_arm=auto])
++
++if test $enable_arm = no ; then
++   have_armv6_simd=disabled
++fi
++
++if test $have_armv6_simd = yes ; then
++   AC_DEFINE(USE_ARM, 1, [use ARM compiler intrinsics])
++else
++   ARM_CFLAGS=
++fi
++
++AC_MSG_RESULT($have_armv6_simd)
++if test $enable_arm = yes && test $have_armv6_simd = no ; then
++   AC_MSG_ERROR([ARM intrinsics not detected])
++fi
++
++AC_SUBST(ARM_CFLAGS)
++
++AM_CONDITIONAL(USE_ARM, test $have_armv6_simd = yes)
++
++
+ AC_ARG_ENABLE(gtk,
+    [AC_HELP_STRING([--enable-gtk],
+                    [enable tests using GTK+ [default=auto]])],
+--- a/pixman/Makefile.am
++++ b/pixman/Makefile.am
+@@ -79,3 +79,15 @@ libpixman_sse2_la_LIBADD = $(DEP_LIBS)
+ libpixman_1_la_LIBADD += libpixman-sse2.la
+ endif
+ 
++# arm code
++if USE_ARM
++noinst_LTLIBRARIES += libpixman-arm.la
++libpixman_arm_la_SOURCES = \
++	pixman-arm.c \
++	pixman-arm.h
++libpixman_arm_la_CFLAGS = $(DEP_CFLAGS) $(ARM_CFLAGS)
++libpixman_arm_la_LIBADD = $(DEP_LIBS)
++libpixman_1_la_LIBADD += libpixman-arm.la
++endif
++
++
+--- /dev/null
++++ b/pixman/pixman-arm.c
+@@ -0,0 +1,409 @@
++/*
++ * Copyright Â© 2008 Mozilla Corporation
++ *
++ * Permission to use, copy, modify, distribute, and sell this software and its
++ * documentation for any purpose is hereby granted without fee, provided that
++ * the above copyright notice appear in all copies and that both that
++ * copyright notice and this permission notice appear in supporting
++ * documentation, and that the name of Mozilla Corporation not be used in
++ * advertising or publicity pertaining to distribution of the software without
++ * specific, written prior permission.  Mozilla Corporation makes no
++ * representations about the suitability of this software for any purpose.  It
++ * is provided "as is" without express or implied warranty.
++ *
++ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
++ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
++ * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
++ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
++ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
++ * SOFTWARE.
++ *
++ * Author:  Jeff Muizelaar (jeff@infidigm.net)
++ *
++ */
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#include "pixman-arm.h"
++
++void
++fbCompositeSrcAdd_8000x8000arm (pixman_op_t op,
++				pixman_image_t * pSrc,
++				pixman_image_t * pMask,
++				pixman_image_t * pDst,
++				int16_t      xSrc,
++				int16_t      ySrc,
++				int16_t      xMask,
++				int16_t      yMask,
++				int16_t      xDst,
++				int16_t      yDst,
++				uint16_t     width,
++				uint16_t     height)
++{
++    uint8_t	*dstLine, *dst;
++    uint8_t	*srcLine, *src;
++    int	dstStride, srcStride;
++    uint16_t	w;
++    uint8_t	s, d;
++
++    fbComposeGetStart (pSrc, xSrc, ySrc, uint8_t, srcStride, srcLine, 1);
++    fbComposeGetStart (pDst, xDst, yDst, uint8_t, dstStride, dstLine, 1);
++
++    while (height--)
++    {
++	dst = dstLine;
++	dstLine += dstStride;
++	src = srcLine;
++	srcLine += srcStride;
++	w = width;
++
++	while (w && (unsigned long)dst & 3)
++	{
++	    s = *src;
++	    d = *dst;
++	    asm("uqadd8 %0, %1, %2" : "+r"(d) : "r"(s));
++	    *dst = d;
++
++	    dst++;
++	    src++;
++	    w--;
++	}
++
++	while (w >= 4)
++	{
++	    asm("uqadd8 %0, %1, %2" : "=r"(*(uint32_t*)dst) : "r"(*(uint32_t*)src), "r"(*(uint32_t*)dst));
++	    dst += 4;
++	    src += 4;
++	    w -= 4;
++	}
++
++	while (w)
++	{
++	    s = *src;
++	    d = *dst;
++	    asm("uqadd8 %0, %1, %2" : "+r"(d) : "r"(s));
++	    *dst = d;
++
++	    dst++;
++	    src++;
++	    w--;
++	}
++    }
++
++}
++
++void
++fbCompositeSrc_8888x8888arm (pixman_op_t op,
++			 pixman_image_t * pSrc,
++			 pixman_image_t * pMask,
++			 pixman_image_t * pDst,
++			 int16_t      xSrc,
++			 int16_t      ySrc,
++			 int16_t      xMask,
++			 int16_t      yMask,
++			 int16_t      xDst,
++			 int16_t      yDst,
++			 uint16_t     width,
++			 uint16_t     height)
++{
++    uint32_t	*dstLine, *dst;
++    uint32_t	*srcLine, *src;
++    int	dstStride, srcStride;
++    uint16_t	w;
++    uint32_t component_half = 0x800080;
++    uint32_t upper_component_mask = 0xff00ff00;
++    uint32_t alpha_mask = 0xff;
++
++    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
++    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
++
++    while (height--)
++    {
++	dst = dstLine;
++	dstLine += dstStride;
++	src = srcLine;
++	srcLine += srcStride;
++	w = width;
++
++//#define inner_branch
++	asm volatile (
++			"cmp %[w], #0\n\t"
++			"beq 2f\n\t"
++			"1:\n\t"
++			/* load dest */
++			"ldr r5, [%[src]], #4\n\t"
++#ifdef inner_branch
++			/* We can avoid doing the multiplication in two cases: 0x0 or 0xff.
++			 * The 0x0 case also allows us to avoid doing an unecessary data
++			 * write which is more valuable so we only check for that */
++			"cmp r5, #0x1000000\n\t"
++			"blt 3f\n\t"
++
++			/* = 255 - alpha */
++			"sub r8, %[alpha_mask], r5, lsr #24\n\t"
++
++			"ldr r4, [%[dest]] \n\t"
++
++#else
++			"ldr r4, [%[dest]] \n\t"
++
++			/* = 255 - alpha */
++			"sub r8, %[alpha_mask], r5, lsr #24\n\t"
++#endif
++			"uxtb16 r6, r4\n\t"
++			"uxtb16 r7, r4, ror #8\n\t"
++
++			/* multiply by 257 and divide by 65536 */
++			"mla r6, r6, r8, %[component_half]\n\t"
++			"mla r7, r7, r8, %[component_half]\n\t"
++
++			"uxtab16 r6, r6, r6, ror #8\n\t"
++			"uxtab16 r7, r7, r7, ror #8\n\t"
++
++			/* recombine the 0xff00ff00 bytes of r6 and r7 */
++			"and r7, %[upper_component_mask]\n\t"
++			"uxtab16 r6, r7, r6, ror #8\n\t"
++
++			"uqadd8 r5, r6, r5\n\t"
++
++#ifdef inner_branch
++			"3:\n\t"
++
++#endif
++			"str r5, [%[dest]], #4\n\t"
++			/* increment counter and jmp to top */
++			"subs	%[w], %[w], #1\n\t"
++			"bne	1b\n\t"
++			"2:\n\t"
++			: [w] "+r" (w), [dest] "+r" (dst), [src] "+r" (src)
++			: [component_half] "r" (component_half), [upper_component_mask] "r" (upper_component_mask),
++			  [alpha_mask] "r" (alpha_mask)
++			: "r4", "r5", "r6", "r7", "r8", "cc", "memory"
++			);
++    }
++}
++
++void
++fbCompositeSrc_8888x8x8888arm (pixman_op_t op,
++			       pixman_image_t * pSrc,
++			       pixman_image_t * pMask,
++			       pixman_image_t * pDst,
++			       int16_t	xSrc,
++			       int16_t	ySrc,
++			       int16_t      xMask,
++			       int16_t      yMask,
++			       int16_t      xDst,
++			       int16_t      yDst,
++			       uint16_t     width,
++			       uint16_t     height)
++{
++    uint32_t	*dstLine, *dst;
++    uint32_t	*srcLine, *src;
++    uint32_t	mask;
++    int	dstStride, srcStride;
++    uint16_t	w;
++    uint32_t component_half = 0x800080;
++    uint32_t alpha_mask = 0xff;
++
++    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
++    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
++
++    fbComposeGetSolid (pMask, mask, pDst->bits.format);
++    mask = (mask) >> 24;
++
++    while (height--)
++    {
++	dst = dstLine;
++	dstLine += dstStride;
++	src = srcLine;
++	srcLine += srcStride;
++	w = width;
++
++//#define inner_branch
++	asm volatile (
++			"cmp %[w], #0\n\t"
++			"beq 2f\n\t"
++			"1:\n\t"
++			/* load dest */
++			"ldr r5, [%[src]], #4\n\t"
++#ifdef inner_branch
++			/* We can avoid doing the multiplication in two cases: 0x0 or 0xff.
++			 * The 0x0 case also allows us to avoid doing an unecessary data
++			 * write which is more valuable so we only check for that */
++			"cmp r5, #0x1000000\n\t"
++			"blt 3f\n\t"
++
++#endif
++			"ldr r4, [%[dest]] \n\t"
++
++			"uxtb16 r6, r5\n\t"
++			"uxtb16 r7, r5, ror #8\n\t"
++
++			/* multiply by alpha (r8) then by 257 and divide by 65536 */
++			"mla r6, r6, %[mask_alpha], %[component_half]\n\t"
++			"mla r7, r7, %[mask_alpha], %[component_half]\n\t"
++
++			"uxtab16 r6, r6, r6, ror #8\n\t"
++			"uxtab16 r7, r7, r7, ror #8\n\t"
++
++			"uxtb16 r6, r6, ror #8\n\t"
++			"uxtb16 r7, r7, ror #8\n\t"
++
++			/* recombine */
++			"orr r5, r6, r7, lsl #8\n\t"
++
++			"uxtb16 r6, r4\n\t"
++			"uxtb16 r7, r4, ror #8\n\t"
++
++			/* 255 - alpha */
++			"sub r8, %[alpha_mask], r5, lsr #24\n\t"
++
++			/* multiply by alpha (r8) then by 257 and divide by 65536 */
++			"mla r6, r6, r8, %[component_half]\n\t"
++			"mla r7, r7, r8, %[component_half]\n\t"
++
++			"uxtab16 r6, r6, r6, ror #8\n\t"
++			"uxtab16 r7, r7, r7, ror #8\n\t"
++
++			"uxtb16 r6, r6, ror #8\n\t"
++			"uxtb16 r7, r7, ror #8\n\t"
++
++			/* recombine */
++			"orr r6, r6, r7, lsl #8\n\t"
++
++			"uqadd8 r5, r6, r5\n\t"
++
++#ifdef inner_branch
++			"3:\n\t"
++
++#endif
++			"str r5, [%[dest]], #4\n\t"
++			/* increment counter and jmp to top */
++			"subs	%[w], %[w], #1\n\t"
++			"bne	1b\n\t"
++			"2:\n\t"
++			: [w] "+r" (w), [dest] "+r" (dst), [src] "+r" (src)
++			: [component_half] "r" (component_half), [mask_alpha] "r" (mask),
++			  [alpha_mask] "r" (alpha_mask)
++			: "r4", "r5", "r6", "r7", "r8", "r9", "cc", "memory"
++			);
++    }
++}
++
++void
++fbCompositeSolidMask_nx8x8888arm (pixman_op_t      op,
++			       pixman_image_t * pSrc,
++			       pixman_image_t * pMask,
++			       pixman_image_t * pDst,
++			       int16_t      xSrc,
++			       int16_t      ySrc,
++			       int16_t      xMask,
++			       int16_t      yMask,
++			       int16_t      xDst,
++			       int16_t      yDst,
++			       uint16_t     width,
++			       uint16_t     height)
++{
++    uint32_t	 src, srca;
++    uint32_t	*dstLine, *dst;
++    uint8_t	*maskLine, *mask;
++    int		 dstStride, maskStride;
++    uint16_t	 w;
++
++    fbComposeGetSolid(pSrc, src, pDst->bits.format);
++
++    srca = src >> 24;
++    if (src == 0)
++	return;
++
++    uint32_t component_mask = 0xff00ff;
++    uint32_t component_half = 0x800080;
++
++    uint32_t src_hi = (src >> 8) & component_mask;
++    uint32_t src_lo = src & component_mask;
++
++    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
++    fbComposeGetStart (pMask, xMask, yMask, uint8_t, maskStride, maskLine, 1);
++
++    while (height--)
++    {
++	dst = dstLine;
++	dstLine += dstStride;
++	mask = maskLine;
++	maskLine += maskStride;
++	w = width;
++
++//#define inner_branch
++	asm volatile (
++			"cmp %[w], #0\n\t"
++			"beq 2f\n\t"
++			"1:\n\t"
++			/* load mask */
++			"ldrb r5, [%[mask]], #1\n\t"
++#ifdef inner_branch
++			/* We can avoid doing the multiplication in two cases: 0x0 or 0xff.
++			 * The 0x0 case also allows us to avoid doing an unecessary data
++			 * write which is more valuable so we only check for that */
++			/* 0x1000000 is the least value that contains alpha all values
++			 * less than it have a 0 alpha value */
++			"cmp r5, #0x0\n\t"
++			"beq 3f\n\t"
++
++#endif
++			"ldr r4, [%[dest]] \n\t"
++
++			/* multiply by alpha (r8) then by 257 and divide by 65536 */
++			"mla r6, %[src_lo], r5, %[component_half]\n\t"
++			"mla r7, %[src_hi], r5, %[component_half]\n\t"
++
++			"uxtab16 r6, r6, r6, ror #8\n\t"
++			"uxtab16 r7, r7, r7, ror #8\n\t"
++
++			"uxtb16 r6, r6, ror #8\n\t"
++			"uxtb16 r7, r7, ror #8\n\t"
++
++			/* recombine */
++			"orr r5, r6, r7, lsl #8\n\t"
++
++			"uxtb16 r6, r4\n\t"
++			"uxtb16 r7, r4, ror #8\n\t"
++
++			/* we could simplify this to use 'sub' if we were
++			 * willing to give up a register for alpha_mask */
++			"mvn r8, r5\n\t"
++			"mov r8, r8, lsr #24\n\t"
++
++			/* multiply by alpha (r8) then by 257 and divide by 65536 */
++			"mla r6, r6, r8, %[component_half]\n\t"
++			"mla r7, r7, r8, %[component_half]\n\t"
++
++			"uxtab16 r6, r6, r6, ror #8\n\t"
++			"uxtab16 r7, r7, r7, ror #8\n\t"
++
++			"uxtb16 r6, r6, ror #8\n\t"
++			"uxtb16 r7, r7, ror #8\n\t"
++
++			/* recombine */
++			"orr r6, r6, r7, lsl #8\n\t"
++
++			"uqadd8 r5, r6, r5\n\t"
++
++#ifdef inner_branch
++			"3:\n\t"
++
++#endif
++			"str r5, [%[dest]], #4\n\t"
++			/* increment counter and jmp to top */
++			"subs	%[w], %[w], #1\n\t"
++			"bne	1b\n\t"
++			"2:\n\t"
++			: [w] "+r" (w), [dest] "+r" (dst), [src] "+r" (src), [mask] "+r" (mask)
++			: [component_half] "r" (component_half),
++			  [src_hi] "r" (src_hi), [src_lo] "r" (src_lo)
++			: "r4", "r5", "r6", "r7", "r8", "cc", "memory"
++			);
++    }
++}
+--- /dev/null
++++ b/pixman/pixman-arm.h
+@@ -0,0 +1,94 @@
++/*
++ * Copyright Â© 2008 Mozilla Corporation
++ *
++ * Permission to use, copy, modify, distribute, and sell this software and its
++ * documentation for any purpose is hereby granted without fee, provided that
++ * the above copyright notice appear in all copies and that both that
++ * copyright notice and this permission notice appear in supporting
++ * documentation, and that the name of Mozilla Corporation not be used in
++ * advertising or publicity pertaining to distribution of the software without
++ * specific, written prior permission.  Mozilla Corporation makes no
++ * representations about the suitability of this software for any purpose.  It
++ * is provided "as is" without express or implied warranty.
++ *
++ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
++ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
++ * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
++ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
++ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
++ * SOFTWARE.
++ *
++ * Author:  Jeff Muizelaar (jeff@infidigm.net)
++ *
++ */
++
++#include "pixman-private.h"
++
++#ifdef USE_ARM
++
++static inline pixman_bool_t pixman_have_arm(void) { return TRUE; }
++
++#else
++#define pixman_have_arm() FALSE
++#endif
++
++#ifdef USE_ARM
++
++void
++fbCompositeSrcAdd_8000x8000arm (pixman_op_t op,
++				pixman_image_t * pSrc,
++				pixman_image_t * pMask,
++				pixman_image_t * pDst,
++				int16_t      xSrc,
++				int16_t      ySrc,
++				int16_t      xMask,
++				int16_t      yMask,
++				int16_t      xDst,
++				int16_t      yDst,
++				uint16_t     width,
++				uint16_t     height);
++void
++fbCompositeSrc_8888x8888arm (pixman_op_t op,
++			 pixman_image_t * pSrc,
++			 pixman_image_t * pMask,
++			 pixman_image_t * pDst,
++			 int16_t      xSrc,
++			 int16_t      ySrc,
++			 int16_t      xMask,
++			 int16_t      yMask,
++			 int16_t      xDst,
++			 int16_t      yDst,
++			 uint16_t     width,
++			 uint16_t     height);
++
++void
++fbCompositeSrc_8888x8x8888arm (pixman_op_t op,
++			 pixman_image_t * pSrc,
++			 pixman_image_t * pMask,
++			 pixman_image_t * pDst,
++			 int16_t      xSrc,
++			 int16_t      ySrc,
++			 int16_t      xMask,
++			 int16_t      yMask,
++			 int16_t      xDst,
++			 int16_t      yDst,
++			 uint16_t     width,
++			 uint16_t     height);
++void
++fbCompositeSolidMask_nx8x8888arm (pixman_op_t op,
++			 pixman_image_t * pSrc,
++			 pixman_image_t * pMask,
++			 pixman_image_t * pDst,
++			 int16_t      xSrc,
++			 int16_t      ySrc,
++			 int16_t      xMask,
++			 int16_t      yMask,
++			 int16_t      xDst,
++			 int16_t      yDst,
++			 uint16_t     width,
++			 uint16_t     height);
++
++
++#endif /* USE_ARM */
+--- a/pixman/pixman-pict.c
++++ b/pixman/pixman-pict.c
+@@ -34,6 +34,7 @@
+ #include "pixman-mmx.h"
+ #include "pixman-vmx.h"
+ #include "pixman-sse2.h"
++#include "pixman-arm.h"
+ #include "pixman-combine32.h"
+ 
+ #ifdef __GNUC__
+@@ -1479,6 +1480,26 @@ static const FastPathInfo vmx_fast_paths
+ };
+ #endif
+ 
++#ifdef USE_ARM
++static const FastPathInfo arm_fast_paths[] =
++{
++    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_a8r8g8b8, fbCompositeSrc_8888x8888arm,      0 },
++    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,	PIXMAN_x8r8g8b8, fbCompositeSrc_8888x8888arm,	   0 },
++    { PIXMAN_OP_OVER, PIXMAN_a8b8g8r8, PIXMAN_null,	PIXMAN_a8b8g8r8, fbCompositeSrc_8888x8888arm,	   0 },
++    { PIXMAN_OP_OVER, PIXMAN_a8b8g8r8, PIXMAN_null,	PIXMAN_x8b8g8r8, fbCompositeSrc_8888x8888arm,	   0 },
++    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_a8,       PIXMAN_a8r8g8b8, fbCompositeSrc_8888x8x8888arm,    NEED_SOLID_MASK },
++    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_a8,       PIXMAN_x8r8g8b8, fbCompositeSrc_8888x8x8888arm,	   NEED_SOLID_MASK },
++
++    { PIXMAN_OP_ADD, PIXMAN_a8,        PIXMAN_null,     PIXMAN_a8,       fbCompositeSrcAdd_8000x8000arm,   0 },
++
++    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8r8g8b8, fbCompositeSolidMask_nx8x8888arm,     0 },
++    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_x8r8g8b8, fbCompositeSolidMask_nx8x8888arm,     0 },
++    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8b8g8r8, fbCompositeSolidMask_nx8x8888arm,     0 },
++    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_x8b8g8r8, fbCompositeSolidMask_nx8x8888arm,     0 },
++
++    { PIXMAN_OP_NONE },
++};
++#endif
+ 
+ static const FastPathInfo c_fast_paths[] =
+ {
+@@ -1829,6 +1850,12 @@ pixman_image_composite (pixman_op_t     
+ 	if (!info && pixman_have_vmx())
+ 	    info = get_fast_path (vmx_fast_paths, op, pSrc, pMask, pDst, pixbuf);
+ #endif
++
++#ifdef USE_ARM
++	if (!info && pixman_have_arm())
++	    info = get_fast_path (arm_fast_paths, op, pSrc, pMask, pDst, pixbuf);
++#endif
++
+         if (!info)
+ 	    info = get_fast_path (c_fast_paths, op, pSrc, pMask, pDst, pixbuf);
+ 
diff --git a/recipes/xorg-lib/pixman-0.12.0/pixman-x888-565.patch b/recipes/xorg-lib/pixman-0.12.0/pixman-x888-565.patch
new file mode 100644
index 0000000..a3fa331
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.12.0/pixman-x888-565.patch
@@ -0,0 +1,68 @@
+From: Vladimir Vukicevic <vladimir@slide.(none)>
+Date: Wed, 17 Sep 2008 20:01:31 +0000 (-0400)
+Subject: Add SRC x888x0565 C fast path
+X-Git-Url: http://gitweb.freedesktop.org/?p=pixman.git;a=commitdiff;h=7180230d4d87c55dfef1e17a0cc3b125d45aa3a0
+
+Add SRC x888x0565 C fast path
+---
+
+--- a/pixman/pixman-pict.c
++++ b/pixman/pixman-pict.c
+@@ -759,6 +759,46 @@ fbCompositeSrc_8888x0565 (pixman_op_t op
+     }
+ }
+ 
++
++void
++fbCompositeSrc_x888x0565 (pixman_op_t op,
++                          pixman_image_t * pSrc,
++                          pixman_image_t * pMask,
++                          pixman_image_t * pDst,
++                          int16_t      xSrc,
++                          int16_t      ySrc,
++                          int16_t      xMask,
++                          int16_t      yMask,
++                          int16_t      xDst,
++                          int16_t      yDst,
++                          uint16_t     width,
++                          uint16_t     height)
++{
++    uint16_t	*dstLine, *dst;
++    uint32_t	*srcLine, *src, s;
++    int	dstStride, srcStride;
++    uint16_t	w;
++
++    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
++    fbComposeGetStart (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
++
++    while (height--)
++    {
++	dst = dstLine;
++	dstLine += dstStride;
++	src = srcLine;
++	srcLine += srcStride;
++	w = width;
++
++	while (w--)
++	{
++	    s = READ(pSrc, src++);
++	    WRITE(pDst, dst, cvt8888to0565(s));
++	    dst++;
++	}
++    }
++}
++
+ void
+ fbCompositeSrcAdd_8000x8000 (pixman_op_t	op,
+ 			     pixman_image_t * pSrc,
+@@ -1568,6 +1608,10 @@ static const FastPathInfo c_fast_paths[]
+     { PIXMAN_OP_SRC, PIXMAN_r5g6b5,    PIXMAN_null,     PIXMAN_r5g6b5,   fbCompositeSrcSrc_nxn, 0 },
+     { PIXMAN_OP_SRC, PIXMAN_b5g6r5,    PIXMAN_null,     PIXMAN_b5g6r5,   fbCompositeSrcSrc_nxn, 0 },
+ #endif
++    { PIXMAN_OP_SRC, PIXMAN_a8r8g8b8,  PIXMAN_null,     PIXMAN_r5g6b5,   fbCompositeSrc_x888x0565, 0 },
++    { PIXMAN_OP_SRC, PIXMAN_x8r8g8b8,  PIXMAN_null,     PIXMAN_r5g6b5,   fbCompositeSrc_x888x0565, 0 },
++    { PIXMAN_OP_SRC, PIXMAN_a8b8g8r8,  PIXMAN_null,     PIXMAN_b5g6r5,   fbCompositeSrc_x888x0565, 0 },
++    { PIXMAN_OP_SRC, PIXMAN_x8b8g8r8,  PIXMAN_null,     PIXMAN_b5g6r5,   fbCompositeSrc_x888x0565, 0 },
+     { PIXMAN_OP_IN,  PIXMAN_a8,        PIXMAN_null,     PIXMAN_a8,       fbCompositeSrcIn_8x8,   0 },
+     { PIXMAN_OP_IN,  PIXMAN_solid,     PIXMAN_a8,	PIXMAN_a8,	 fbCompositeSolidMaskIn_nx8x8, 0 },
+     { PIXMAN_OP_NONE },
diff --git a/recipes/xorg-lib/pixman-0.13.2/pixman-0.13.2-neon1.patch b/recipes/xorg-lib/pixman-0.13.2/pixman-0.13.2-neon1.patch
new file mode 100644
index 0000000..b3bb762
--- /dev/null
+++ b/recipes/xorg-lib/pixman-0.13.2/pixman-0.13.2-neon1.patch
@@ -0,0 +1,1702 @@
+diff --git a/configure.ac b/configure.ac
+index 063f6eb..bada55c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -278,11 +278,12 @@ AC_SUBST(VMX_CFLAGS)
+ AM_CONDITIONAL(USE_VMX, test $have_vmx_intrinsics = yes)
+ 
+ dnl Check for ARM SIMD instructions
++ARM_SIMD_CFLAGS=""
+ 
+ have_arm_simd=no
+ AC_MSG_CHECKING(whether to use ARM SIMD assembler)
+ xserver_save_CFLAGS=$CFLAGS
+-CFLAGS="$CFLAGS $ARM_CFLAGS"
++CFLAGS="$CFLAGS $ARM_SIMD_CFLAGS"
+ AC_COMPILE_IFELSE([
+ int main () {
+     asm("uqadd8 r1, r1, r2");
+@@ -302,7 +303,7 @@ fi
+ if test $have_arm_simd = yes ; then
+    AC_DEFINE(USE_ARM_SIMD, 1, [use ARM SIMD compiler intrinsics])
+ else
+-   ARM_CFLAGS=
++   ARM_SIMD_CFLAGS=
+ fi
+ 
+ AC_MSG_RESULT($have_arm_simd)
+@@ -310,9 +311,48 @@ if test $enable_arm_simd = yes && test $have_arm_simd = no ; then
+    AC_MSG_ERROR([ARM SIMD intrinsics not detected])
+ fi
+ 
+-AC_SUBST(ARM_CFLAGS)
++dnl Check for ARM NEON instructions
++ARM_NEON_CFLAGS="-mcpu=cortex-a8 -mfpu=neon"
++
++have_arm_neon=no
++AC_MSG_CHECKING(whether to use ARM NEON)
++xserver_save_CFLAGS=$CFLAGS
++CFLAGS="$CFLAGS $ARM_NEON_CFLAGS"
++AC_COMPILE_IFELSE([
++#include <arm_neon.h>
++int main () {
++    uint8x8_t neon_test=vmov_n_u8(0);
++    return 0;
++}], have_arm_neon=yes)
++CFLAGS=$xserver_save_CFLAGS
++
++AC_ARG_ENABLE(arm-neon,
++   [AC_HELP_STRING([--disable-arm-neon],
++                   [disable ARM NEON fast paths])],
++   [enable_arm_neon=$enableval], [enable_arm_neon=auto])
++
++if test $enable_arm_neon = no ; then
++   have_arm_neon=disabled
++fi
++
++if test $have_arm_neon = yes ; then
++   AC_DEFINE(USE_ARM_NEON, 1, [use ARM NEON compiler intrinsics])
++else
++   ARM_NEON_CFLAGS=
++fi
++
++AC_MSG_RESULT($have_arm_neon)
++if test $enable_arm_neon = yes && test $have_arm_neon = no ; then
++   AC_MSG_ERROR([ARM NEON intrinsics not detected])
++fi
++
++
++AC_SUBST(ARM_SIMD_CFLAGS)
++AC_SUBST(ARM_NEON_CFLAGS)
+ 
+ AM_CONDITIONAL(USE_ARM_SIMD, test $have_arm_simd = yes)
++AM_CONDITIONAL(USE_ARM_NEON, test $have_arm_neon = yes)
++
+ 
+ 
+ AC_ARG_ENABLE(gtk,
+diff --git a/pixman/Makefile.am b/pixman/Makefile.am
+index c4612ea..4c1ec6b 100644
+--- a/pixman/Makefile.am
++++ b/pixman/Makefile.am
+@@ -80,15 +80,26 @@ libpixman_sse2_la_LIBADD = $(DEP_LIBS)
+ libpixman_1_la_LIBADD += libpixman-sse2.la
+ endif
+ 
+-# arm code
++# arm simd code
+ if USE_ARM_SIMD
+ noinst_LTLIBRARIES += libpixman-arm-simd.la
+ libpixman_arm_simd_la_SOURCES = \
+ 	pixman-arm-simd.c \
+ 	pixman-arm-simd.h
+-libpixman_arm_simd_la_CFLAGS = $(DEP_CFLAGS) $(ARM_CFLAGS)
++libpixman_arm_simd_la_CFLAGS = $(DEP_CFLAGS) $(ARM_SIMD_CFLAGS)
+ libpixman_arm_simd_la_LIBADD = $(DEP_LIBS)
+ libpixman_1_la_LIBADD += libpixman-arm-simd.la
+ endif
+ 
++# arm neon code
++if USE_ARM_NEON
++noinst_LTLIBRARIES += libpixman-arm-neon.la
++libpixman_arm_neon_la_SOURCES = \
++        pixman-arm-neon.c \
++        pixman-arm-neon.h
++libpixman_arm_neon_la_CFLAGS = $(DEP_CFLAGS) $(ARM_NEON_CFLAGS)
++libpixman_arm_neon_la_LIBADD = $(DEP_LIBS)
++libpixman_1_la_LIBADD += libpixman-arm-neon.la
++endif
++
+ 
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+new file mode 100644
+index 0000000..10050e4
+--- /dev/null
++++ b/pixman/pixman-arm-neon.c
+@@ -0,0 +1,1387 @@
++/*
++ * Copyright © 2009 Mozilla Corporation
++ *
++ * Permission to use, copy, modify, distribute, and sell this software and its
++ * documentation for any purpose is hereby granted without fee, provided that
++ * the above copyright notice appear in all copies and that both that
++ * copyright notice and this permission notice appear in supporting
++ * documentation, and that the name of Mozilla Corporation not be used in
++ * advertising or publicity pertaining to distribution of the software without
++ * specific, written prior permission.  Mozilla Corporation makes no
++ * representations about the suitability of this software for any purpose.  It
++ * is provided "as is" without express or implied warranty.
++ *
++ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
++ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
++ * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
++ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
++ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
++ * SOFTWARE.
++ *
++ * Author:  Ian Rickards (ian.rickards@arm.com) 
++ *
++ */
++
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#include "pixman-arm-neon.h"
++
++#include <arm_neon.h>
++
++
++#if !defined(__ARMCC_VERSION) && !defined(FORCE_NO_NEON_INLINE_ASM)
++// [both armcc & gcc set __GNUC__]
++// Use GNU style inline asm on gcc, for best performance
++// Use intrinsics on armcc
++// This switch determines if any GNU style inline asm is allowed
++#define USE_NEON_INLINE_ASM
++#endif
++
++
++static force_inline uint8x8x4_t unpack0565(uint16x8_t rgb)
++{
++    uint16x8_t gb, b;
++    uint8x8x4_t res;
++
++    res.val[3] = vdup_n_u8(0);
++    gb = vshrq_n_u16(rgb, 5);
++    b = vshrq_n_u16(rgb, 5+6);
++    res.val[0] = vmovn_u16(rgb);  // get low 5 bits
++    res.val[1] = vmovn_u16(gb);   // get mid 6 bits
++    res.val[2] = vmovn_u16(b);    // get top 5 bits
++
++    res.val[0] = vshl_n_u8(res.val[0], 3); // shift to top
++    res.val[1] = vshl_n_u8(res.val[1], 2); // shift to top
++    res.val[2] = vshl_n_u8(res.val[2], 3); // shift to top
++
++    res.val[0] = vsri_n_u8(res.val[0], res.val[0], 5); 
++    res.val[1] = vsri_n_u8(res.val[1], res.val[1], 6);
++    res.val[2] = vsri_n_u8(res.val[2], res.val[2], 5);
++
++    return res;
++}
++
++static force_inline uint16x8_t pack0565(uint8x8x4_t s)
++{
++    uint16x8_t rgb, val_g, val_r;
++
++    rgb = vshll_n_u8(s.val[2],8);
++    val_g = vshll_n_u8(s.val[1],8);
++    val_r = vshll_n_u8(s.val[0],8);
++    rgb = vsriq_n_u16(rgb, val_g, 5);
++    rgb = vsriq_n_u16(rgb, val_r, 5+6);
++
++    return rgb;
++}
++
++static force_inline uint8x8_t neon2mul(uint8x8_t x, uint8x8_t alpha)
++{
++    uint16x8_t tmp,tmp2;
++    uint8x8_t res;
++
++    tmp = vmull_u8(x,alpha);
++    tmp2 = vrshrq_n_u16(tmp,8);
++    res = vraddhn_u16(tmp,tmp2);
++
++    return res;
++}
++
++static force_inline uint8x8x4_t neon8mul(uint8x8x4_t x, uint8x8_t alpha)
++{
++    uint16x8x4_t tmp;
++    uint8x8x4_t res;
++    uint16x8_t qtmp1,qtmp2;
++
++    tmp.val[0] = vmull_u8(x.val[0],alpha);
++    tmp.val[1] = vmull_u8(x.val[1],alpha);
++    tmp.val[2] = vmull_u8(x.val[2],alpha);
++    tmp.val[3] = vmull_u8(x.val[3],alpha);
++
++    qtmp1 = vrshrq_n_u16(tmp.val[0],8);
++    qtmp2 = vrshrq_n_u16(tmp.val[1],8);
++    res.val[0] = vraddhn_u16(tmp.val[0],qtmp1);
++    qtmp1 = vrshrq_n_u16(tmp.val[2],8);
++    res.val[1] = vraddhn_u16(tmp.val[1],qtmp2);
++    qtmp2 = vrshrq_n_u16(tmp.val[3],8);
++    res.val[2] = vraddhn_u16(tmp.val[2],qtmp1);
++    res.val[3] = vraddhn_u16(tmp.val[3],qtmp2);
++
++    return res;
++}
++
++static force_inline uint8x8x4_t neon8qadd(uint8x8x4_t x, uint8x8x4_t y)
++{
++    uint8x8x4_t res;
++
++    res.val[0] = vqadd_u8(x.val[0],y.val[0]);
++    res.val[1] = vqadd_u8(x.val[1],y.val[1]);
++    res.val[2] = vqadd_u8(x.val[2],y.val[2]);
++    res.val[3] = vqadd_u8(x.val[3],y.val[3]);
++
++    return res;
++}
++
++
++void
++fbCompositeSrcAdd_8000x8000neon (pixman_op_t op,
++                                pixman_image_t * pSrc,
++                                pixman_image_t * pMask,
++                                pixman_image_t * pDst,
++                                int16_t      xSrc,
++                                int16_t      ySrc,
++                                int16_t      xMask,
++                                int16_t      yMask,
++                                int16_t      xDst,
++                                int16_t      yDst,
++                                uint16_t     width,
++                                uint16_t     height)
++{
++    uint8_t     *dstLine, *dst;
++    uint8_t     *srcLine, *src;
++    int dstStride, srcStride;
++    uint16_t    w;
++
++    fbComposeGetStart (pSrc, xSrc, ySrc, uint8_t, srcStride, srcLine, 1);
++    fbComposeGetStart (pDst, xDst, yDst, uint8_t, dstStride, dstLine, 1);
++
++    if (width>=8)
++    {
++        // Use overlapping 8-pixel method
++        while (height--)
++        {
++            dst = dstLine;
++            dstLine += dstStride;
++            src = srcLine;
++            srcLine += srcStride;
++            w = width;
++
++            uint8_t *keep_dst;
++
++#ifndef USE_NEON_INLINE_ASM
++            uint8x8_t sval,dval,temp;
++
++            sval = vld1_u8((void*)src);
++            dval = vld1_u8((void*)dst);
++            keep_dst = dst;
++
++            temp = vqadd_u8(dval,sval);
++
++            src += (w & 7);
++            dst += (w & 7);
++            w -= (w & 7);
++
++            while (w)
++            {
++                sval = vld1_u8((void*)src);
++                dval = vld1_u8((void*)dst);
++
++                vst1_u8((void*)keep_dst,temp);
++                keep_dst = dst;
++
++                temp = vqadd_u8(dval,sval);
++
++                src+=8;
++                dst+=8;
++                w-=8;
++            }
++            vst1_u8((void*)keep_dst,temp);
++#else
++            asm volatile (
++// avoid using d8-d15 (q4-q7) aapcs callee-save registers
++                        "vld1.8  {d0}, [%[src]]\n\t"
++                        "vld1.8  {d4}, [%[dst]]\n\t"
++                        "mov     %[keep_dst], %[dst]\n\t"
++
++                        "and ip, %[w], #7\n\t"
++                        "add %[src], %[src], ip\n\t"
++                        "add %[dst], %[dst], ip\n\t"
++                        "subs %[w], %[w], ip\n\t"
++                        "b 9f\n\t"
++// LOOP
++                        "2:\n\t"
++                        "vld1.8  {d0}, [%[src]]!\n\t"
++                        "vld1.8  {d4}, [%[dst]]!\n\t"
++                        "vst1.8  {d20}, [%[keep_dst]]\n\t"
++                        "sub     %[keep_dst], %[dst], #8\n\t"
++                        "subs %[w], %[w], #8\n\t"
++                        "9:\n\t"
++                        "vqadd.u8 d20, d0, d4\n\t"
++
++                        "bne 2b\n\t"
++
++                        "1:\n\t"
++                        "vst1.8  {d20}, [%[keep_dst]]\n\t"
++
++                        : [w] "+r" (w), [src] "+r" (src), [dst] "+r" (dst), [keep_dst] "+r" (keep_dst)
++                        :
++                        : "ip", "cc", "memory", "d0","d4",
++                          "d20"
++                        );
++#endif
++        }
++    }
++    else
++    {
++        while (height--)
++        {
++            dst = dstLine;
++            dstLine += dstStride;
++            src = srcLine;
++            srcLine += srcStride;
++            w = width;
++            uint8x8_t sval, dval;
++            uint8_t *dst4, *dst2;
++
++            if (w&4)
++            {
++                sval = vreinterpret_u8_u32(vld1_lane_u32((void*)src,vreinterpret_u32_u8(sval),1));
++                dval = vreinterpret_u8_u32(vld1_lane_u32((void*)dst,vreinterpret_u32_u8(dval),1));
++                dst4=dst;
++                src+=4;
++                dst+=4;
++            }
++            if (w&2)
++            {
++                sval = vreinterpret_u8_u16(vld1_lane_u16((void*)src,vreinterpret_u16_u8(sval),1));
++                dval = vreinterpret_u8_u16(vld1_lane_u16((void*)dst,vreinterpret_u16_u8(dval),1));
++                dst2=dst;
++                src+=2;
++                dst+=2;
++            }
++            if (w&1)
++            {
++                sval = vld1_lane_u8((void*)src,sval,1);
++                dval = vld1_lane_u8((void*)dst,dval,1);
++            }
++
++            dval = vqadd_u8(dval,sval);
++
++            if (w&1)
++                vst1_lane_u8((void*)dst,dval,1);
++            if (w&2)
++                vst1_lane_u16((void*)dst2,vreinterpret_u16_u8(dval),1);
++            if (w&4)
++                vst1_lane_u32((void*)dst4,vreinterpret_u32_u8(dval),1);
++        }
++    }
++}
++
++
++void
++fbCompositeSrc_8888x8888neon (pixman_op_t op,
++			 pixman_image_t * pSrc,
++			 pixman_image_t * pMask,
++			 pixman_image_t * pDst,
++			 int16_t      xSrc,
++			 int16_t      ySrc,
++			 int16_t      xMask,
++			 int16_t      yMask,
++			 int16_t      xDst,
++			 int16_t      yDst,
++			 uint16_t     width,
++			 uint16_t     height)
++{
++    uint32_t	*dstLine, *dst;
++    uint32_t	*srcLine, *src;
++    int	dstStride, srcStride;
++    uint32_t	w;
++
++    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
++    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
++
++    if (width>=8)
++    {
++        // Use overlapping 8-pixel method  
++        while (height--)
++        {
++	    dst = dstLine;
++	    dstLine += dstStride;
++	    src = srcLine;
++	    srcLine += srcStride;
++	    w = width;
++
++            uint32_t *keep_dst;
++
++#ifndef USE_NEON_INLINE_ASM
++            uint8x8x4_t sval,dval,temp;
++
++            sval = vld4_u8((void*)src);
++            dval = vld4_u8((void*)dst);
++            keep_dst = dst;
++
++            temp = neon8mul(dval,vmvn_u8(sval.val[3]));
++            temp = neon8qadd(sval,temp);
++
++            src += (w & 7);
++            dst += (w & 7);
++            w -= (w & 7);
++
++            while (w)
++            {
++                sval = vld4_u8((void*)src);
++                dval = vld4_u8((void*)dst);
++
++                vst4_u8((void*)keep_dst,temp);
++                keep_dst = dst;
++
++                temp = neon8mul(dval,vmvn_u8(sval.val[3]));
++                temp = neon8qadd(sval,temp);
++
++                src+=8;
++                dst+=8;
++                w-=8;
++            }
++            vst4_u8((void*)keep_dst,temp);
++#else
++            asm volatile (
++// avoid using d8-d15 (q4-q7) aapcs callee-save registers
++                        "vld4.8  {d0-d3}, [%[src]]\n\t"
++                        "vld4.8  {d4-d7}, [%[dst]]\n\t"
++                        "mov     %[keep_dst], %[dst]\n\t"
++
++                        "and ip, %[w], #7\n\t"
++                        "add %[src], %[src], ip, LSL#2\n\t"
++                        "add %[dst], %[dst], ip, LSL#2\n\t"
++                        "subs %[w], %[w], ip\n\t"
++                        "b 9f\n\t"
++// LOOP
++                        "2:\n\t"
++                        "vld4.8  {d0-d3}, [%[src]]!\n\t"
++                        "vld4.8  {d4-d7}, [%[dst]]!\n\t"
++                        "vst4.8  {d20-d23}, [%[keep_dst]]\n\t"
++                        "sub     %[keep_dst], %[dst], #8*4\n\t"
++                        "subs %[w], %[w], #8\n\t"
++                        "9:\n\t"
++                        "vmvn.8  d31, d3\n\t"
++                        "vmull.u8 q10, d31, d4\n\t"
++                        "vmull.u8 q11, d31, d5\n\t"
++                        "vmull.u8 q12, d31, d6\n\t"
++                        "vmull.u8 q13, d31, d7\n\t"
++                        "vrshr.u16 q8, q10, #8\n\t"
++                        "vrshr.u16 q9, q11, #8\n\t"
++                        "vraddhn.u16 d20, q10, q8\n\t"
++                        "vraddhn.u16 d21, q11, q9\n\t"
++                        "vrshr.u16 q8, q12, #8\n\t"
++                        "vrshr.u16 q9, q13, #8\n\t"
++                        "vraddhn.u16 d22, q12, q8\n\t"
++                        "vraddhn.u16 d23, q13, q9\n\t"
++// result in d20-d23
++                        "vqadd.u8 d20, d0, d20\n\t"
++                        "vqadd.u8 d21, d1, d21\n\t"
++                        "vqadd.u8 d22, d2, d22\n\t"
++                        "vqadd.u8 d23, d3, d23\n\t"
++
++                        "bne 2b\n\t"
++
++                        "1:\n\t"
++                        "vst4.8  {d20-d23}, [%[keep_dst]]\n\t"
++
++                        : [w] "+r" (w), [src] "+r" (src), [dst] "+r" (dst), [keep_dst] "+r" (keep_dst)
++                        : 
++                        : "ip", "cc", "memory", "d0","d1","d2","d3","d4","d5","d6","d7",
++                          "d16","d17","d18","d19","d20","d21","d22","d23"
++                        );
++#endif
++        }
++    }
++    else
++    {
++        uint8x8_t    alpha_selector=vreinterpret_u8_u64(vcreate_u64(0x0707070703030303ULL));
++
++        // Handle width<8
++        while (height--)
++        {
++            dst = dstLine;
++            dstLine += dstStride;
++            src = srcLine;
++            srcLine += srcStride;
++            w = width;
++
++            while (w>=2)
++            {
++                uint8x8_t sval,dval;
++
++                /* two 32-bit pixels packed into D-reg; ad-hoc vectorization */
++                sval = vreinterpret_u8_u32(vld1_u32((void*)src));
++                dval = vreinterpret_u8_u32(vld1_u32((void*)dst));
++                dval = neon2mul(dval,vtbl1_u8(vmvn_u8(sval),alpha_selector));
++                vst1_u8((void*)dst,vqadd_u8(sval,dval));
++
++                src+=2;
++                dst+=2;
++                w-=2;
++            }
++
++            if (w)
++            {
++                uint8x8_t sval,dval;
++
++                /* single 32-bit pixel in lane 0 */
++                sval = vreinterpret_u8_u32(vld1_dup_u32((void*)src));  // only interested in lane 0
++                dval = vreinterpret_u8_u32(vld1_dup_u32((void*)dst));  // only interested in lane 0
++                dval = neon2mul(dval,vtbl1_u8(vmvn_u8(sval),alpha_selector));
++                vst1_lane_u32((void*)dst,vreinterpret_u32_u8(vqadd_u8(sval,dval)),0);
++            }
++        }
++    }
++}
++
++
++
++void
++fbCompositeSrc_x888x0565neon (pixman_op_t op,
++                          pixman_image_t * pSrc,
++                          pixman_image_t * pMask,
++                          pixman_image_t * pDst,
++                          int16_t      xSrc,
++                          int16_t      ySrc,
++                          int16_t      xMask,
++                          int16_t      yMask,
++                          int16_t      xDst,
++                          int16_t      yDst,
++                          uint16_t     width,
++                          uint16_t     height)
++{
++    uint16_t    *dstLine, *dst;
++    uint32_t    *srcLine, *src;
++    int dstStride, srcStride;
++    uint32_t    w;
++
++    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
++    fbComposeGetStart (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
++
++    if (width>=8)
++    {
++        while (height--)
++        {
++            dst = dstLine;
++            dstLine += dstStride;
++            src = srcLine;
++            srcLine += srcStride;
++            w = width;
++
++	    do {
++	        while (w>=8)
++	        {
++#ifndef USE_NEON_INLINE_ASM
++	            vst1q_u16(dst, pack0565(vld4_u8((void*)src)));
++#else
++                    asm volatile (
++                        "vld4.8       {d4-d7}, [%[src]]\n\t"
++                        "vshll.u8     q0, d6, #8\n\t"
++                        "vshll.u8     q1, d5, #8\n\t"
++                        "vsriq.u16    q0, q1, #5\t\n"
++                        "vshll.u8     q1, d4, #8\n\t"
++                        "vsriq.u16    q0, q1, #11\t\n"
++                        "vst1.16      {q0}, [%[dst]]\n\t"
++                        :
++                        : [dst] "r" (dst), [src] "r" (src)
++                        : "memory", "d0","d1","d2","d3","d4","d5","d6","d7"
++                        );
++#endif
++	            src+=8;
++	            dst+=8;
++	            w-=8;
++          	}
++                if (w != 0)
++                {
++                    src -= (8-w);
++                    dst -= (8-w);
++                    w = 8;  // do another vector
++                }
++            } while (w!=0);
++        }
++    }
++    else
++    {
++        // Handle width<8
++        while (height--)
++        {
++            dst = dstLine;
++            dstLine += dstStride;
++            src = srcLine;
++            srcLine += srcStride;
++            w = width;
++
++	    while (w>=2)
++	    {
++	        uint32x2_t sval, rgb, g, b;
++	        sval = vld1_u32(src);
++	        rgb = vshr_n_u32(sval,8-5); // r (5 bits) 
++	        g = vshr_n_u32(sval,8+8-6);  // g to bottom byte
++	        rgb = vsli_n_u32(rgb, g, 5);
++	        b = vshr_n_u32(sval,8+8+8-5);  // b to bottom byte
++                rgb = vsli_n_u32(rgb, b, 11);
++	        vst1_lane_u16(dst++,vreinterpret_u16_u32(rgb),0);
++	        vst1_lane_u16(dst++,vreinterpret_u16_u32(rgb),2);
++	        src+=2;
++	        w-=2;
++	    }
++            if (w)
++            {
++                uint32x2_t sval, rgb, g, b;
++                sval = vld1_dup_u32(src);
++                rgb = vshr_n_u32(sval,8-5); // r (5 bits)
++                g = vshr_n_u32(sval,8+8-6);  // g to bottom byte
++                rgb = vsli_n_u32(rgb, g, 5);
++                b = vshr_n_u32(sval,8+8+8-5);  // b to bottom byte
++                rgb = vsli_n_u32(rgb, b, 11);
++                vst1_lane_u16(dst++,vreinterpret_u16_u32(rgb),0);
++            }
++	}
++    }
++}
++
++
++void
++fbCompositeSrc_8888x8x8888neon (pixman_op_t op,
++			       pixman_image_t * pSrc,
++			       pixman_image_t * pMask,
++			       pixman_image_t * pDst,
++			       int16_t	xSrc,
++			       int16_t	ySrc,
++			       int16_t      xMask,
++			       int16_t      yMask,
++			       int16_t      xDst,
++			       int16_t      yDst,
++			       uint16_t     width,
++			       uint16_t     height)
++{
++    uint32_t	*dstLine, *dst;
++    uint32_t	*srcLine, *src;
++    uint32_t	mask;
++    int	dstStride, srcStride;
++    uint32_t	w;
++    uint8x8_t mask_alpha;
++
++    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
++    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
++
++    fbComposeGetSolid (pMask, mask, pDst->bits.format);
++    mask_alpha = vdup_n_u8((mask) >> 24);
++
++    if (width>=8)
++    {
++        // Use overlapping 8-pixel method
++        while (height--)
++        {
++            dst = dstLine;
++            dstLine += dstStride;
++            src = srcLine;
++            srcLine += srcStride;
++            w = width;
++
++            uint32_t *keep_dst;
++
++#ifndef USE_NEON_INLINE_ASM
++            uint8x8x4_t sval,dval,temp;
++
++            sval = vld4_u8((void*)src);
++            dval = vld4_u8((void*)dst);
++            keep_dst = dst;
++
++            sval = neon8mul(sval,mask_alpha);
++            temp = neon8mul(dval,vmvn_u8(sval.val[3]));
++            temp = neon8qadd(sval,temp);
++
++            src += (w & 7);
++            dst += (w & 7);
++            w -= (w & 7);
++
++            while (w)
++            {
++                sval = vld4_u8((void*)src);
++                dval = vld4_u8((void*)dst);
++
++                vst4_u8((void*)keep_dst,temp);
++                keep_dst = dst;
++
++                sval = neon8mul(sval,mask_alpha);
++                temp = neon8mul(dval,vmvn_u8(sval.val[3]));
++                temp = neon8qadd(sval,temp);
++
++                src+=8;
++                dst+=8;
++                w-=8;
++            }
++            vst4_u8((void*)keep_dst,temp);
++#else
++            asm volatile (
++// avoid using d8-d15 (q4-q7) aapcs callee-save registers
++                        "vdup.32      d30, %[mask]\n\t"
++                        "vdup.8       d30, d30[3]\n\t"
++
++                        "vld4.8       {d0-d3}, [%[src]]\n\t"
++                        "vld4.8       {d4-d7}, [%[dst]]\n\t"
++                        "mov  %[keep_dst], %[dst]\n\t"
++
++                        "and  ip, %[w], #7\n\t"
++                        "add  %[src], %[src], ip, LSL#2\n\t"
++                        "add  %[dst], %[dst], ip, LSL#2\n\t"
++                        "subs  %[w], %[w], ip\n\t"
++                        "b 9f\n\t"
++// LOOP
++                        "2:\n\t"
++                        "vld4.8       {d0-d3}, [%[src]]!\n\t"
++                        "vld4.8       {d4-d7}, [%[dst]]!\n\t"
++                        "vst4.8       {d20-d23}, [%[keep_dst]]\n\t"
++                        "sub  %[keep_dst], %[dst], #8*4\n\t"
++                        "subs  %[w], %[w], #8\n\t"
++
++                        "9:\n\t"
++                        "vmull.u8     q10, d30, d0\n\t"
++                        "vmull.u8     q11, d30, d1\n\t"
++                        "vmull.u8     q12, d30, d2\n\t"
++                        "vmull.u8     q13, d30, d3\n\t"
++                        "vrshr.u16    q8, q10, #8\n\t"
++                        "vrshr.u16    q9, q11, #8\n\t"
++                        "vraddhn.u16  d0, q10, q8\n\t"
++                        "vraddhn.u16  d1, q11, q9\n\t"
++                        "vrshr.u16    q9, q13, #8\n\t"
++                        "vrshr.u16    q8, q12, #8\n\t"
++                        "vraddhn.u16  d3, q13, q9\n\t"
++                        "vraddhn.u16  d2, q12, q8\n\t"
++
++                        "vmvn.8       d31, d3\n\t"
++                        "vmull.u8     q10, d31, d4\n\t"
++                        "vmull.u8     q11, d31, d5\n\t"
++                        "vmull.u8     q12, d31, d6\n\t"
++                        "vmull.u8     q13, d31, d7\n\t"
++                        "vrshr.u16    q8, q10, #8\n\t"
++                        "vrshr.u16    q9, q11, #8\n\t"
++                        "vraddhn.u16  d20, q10, q8\n\t"
++                        "vrshr.u16    q8, q12, #8\n\t"
++                        "vraddhn.u16  d21, q11, q9\n\t"
++                        "vrshr.u16    q9, q13, #8\n\t"
++                        "vraddhn.u16  d22, q12, q8\n\t"
++                        "vraddhn.u16  d23, q13, q9\n\t"
++// result in d20-d23
++                        "vqadd.u8     d20, d0, d20\n\t"
++                        "vqadd.u8     d21, d1, d21\n\t"
++                        "vqadd.u8     d22, d2, d22\n\t"
++                        "vqadd.u8     d23, d3, d23\n\t"
++
++                        "bne  2b\n\t"
++
++                        "1:\n\t"
++                        "vst4.8       {d20-d23}, [%[keep_dst]]\n\t"
++
++                        : [w] "+r" (w), [src] "+r" (src), [dst] "+r" (dst), [keep_dst] "+r" (keep_dst)
++                        : [mask] "r" (mask)
++                        : "ip", "cc", "memory", "d0","d1","d2","d3","d4","d5","d6","d7",
++                          "d16","d17","d18","d19","d20","d21","d22","d23","d24","d25","d26","d27",
++                          "d30","d31"
++                        );
++#endif
++        }
++    }
++    else
++    {
++        uint8x8_t    alpha_selector=vreinterpret_u8_u64(vcreate_u64(0x0707070703030303ULL));
++
++        // Handle width<8
++        while (height--)
++        {
++            dst = dstLine;
++            dstLine += dstStride;
++            src = srcLine;
++            srcLine += srcStride;
++            w = width;
++
++            while (w>=2)
++            {
++                uint8x8_t sval,dval;
++
++                sval = vreinterpret_u8_u32(vld1_u32((void*)src));
++                dval = vreinterpret_u8_u32(vld1_u32((void*)dst));
++
++                /* sval * const alpha_mul */
++                sval = neon2mul(sval,mask_alpha);
++
++                /* dval * 255-(src alpha) */
++                dval = neon2mul(dval,vtbl1_u8(vmvn_u8(sval), alpha_selector));
++
++                vst1_u8((void*)dst,vqadd_u8(sval,dval));
++
++                src+=2;
++                dst+=2;
++                w-=2;
++            }
++
++            if (w)
++            {
++                uint8x8_t sval,dval;
++
++                sval = vreinterpret_u8_u32(vld1_dup_u32((void*)src));
++                dval = vreinterpret_u8_u32(vld1_dup_u32((void*)dst));
++
++                /* sval * const alpha_mul */
++                sval = neon2mul(sval,mask_alpha);
++
++                /* dval * 255-(src alpha) */
++                dval = neon2mul(dval,vtbl1_u8(vmvn_u8(sval), alpha_selector));
++
++                vst1_lane_u32((void*)dst,vreinterpret_u32_u8(vqadd_u8(sval,dval)),0);
++            }
++        }
++    }
++}
++
++
++
++void
++fbCompositeSolidMask_nx8x0565neon (pixman_op_t op,
++                               pixman_image_t * pSrc,
++                               pixman_image_t * pMask,
++                               pixman_image_t * pDst,
++                               int16_t      xSrc,
++                               int16_t      ySrc,
++                               int16_t      xMask,
++                               int16_t      yMask,
++                               int16_t      xDst,
++                               int16_t      yDst,
++                               uint16_t     width,
++                               uint16_t     height)
++{
++    uint32_t     src, srca;
++    uint16_t    *dstLine, *dst;
++    uint8_t     *maskLine, *mask;
++    int          dstStride, maskStride;
++    uint32_t     w;
++    uint8x8_t    sval2;
++    uint8x8x4_t  sval8;
++
++    fbComposeGetSolid(pSrc, src, pDst->bits.format);
++
++    srca = src >> 24;
++    if (src == 0)
++        return;
++
++    sval2=vreinterpret_u8_u32(vdup_n_u32(src));
++    sval8.val[0]=vdup_lane_u8(sval2,0);
++    sval8.val[1]=vdup_lane_u8(sval2,1);
++    sval8.val[2]=vdup_lane_u8(sval2,2);
++    sval8.val[3]=vdup_lane_u8(sval2,3);
++
++    fbComposeGetStart (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
++    fbComposeGetStart (pMask, xMask, yMask, uint8_t, maskStride, maskLine, 1);
++
++    if (width>=8)
++    {
++        // Use overlapping 8-pixel method, modified to avoid rewritten dest being reused
++        while (height--)
++        {
++            uint16_t *keep_dst;
++
++            dst = dstLine;
++            dstLine += dstStride;
++            mask = maskLine;
++            maskLine += maskStride;
++            w = width;
++
++#ifndef USE_NEON_INLINE_ASM
++            uint8x8_t alpha;
++            uint16x8_t dval, temp; 
++            uint8x8x4_t sval8temp;
++
++            alpha = vld1_u8((void*)mask);
++            dval = vld1q_u16((void*)dst);
++            keep_dst = dst;
++
++            sval8temp = neon8mul(sval8,alpha);
++            temp = pack0565(neon8qadd(sval8temp,neon8mul(unpack0565(dval),vmvn_u8(sval8temp.val[3]))));
++
++            mask += (w & 7);
++            dst += (w & 7);
++            w -= (w & 7);
++
++            while (w)
++            {
++                dval = vld1q_u16((void*)dst);
++	        alpha = vld1_u8((void*)mask);
++
++                vst1q_u16((void*)keep_dst,temp);
++                keep_dst = dst;
++
++                sval8temp = neon8mul(sval8,alpha);
++                temp = pack0565(neon8qadd(sval8temp,neon8mul(unpack0565(dval),vmvn_u8(sval8temp.val[3]))));
++
++                mask+=8;
++                dst+=8;
++                w-=8;
++            }
++            vst1q_u16((void*)keep_dst,temp);
++#else
++        asm volatile (
++                        "vdup.32      d0, %[src]\n\t"
++                        "vdup.8       d1, d0[1]\n\t"
++                        "vdup.8       d2, d0[2]\n\t"
++                        "vdup.8       d3, d0[3]\n\t"
++                        "vdup.8       d0, d0[0]\n\t"
++
++                        "vld1.8       {q12}, [%[dst]]\n\t"
++                        "vld1.8       {d31}, [%[mask]]\n\t"
++                        "mov  %[keep_dst], %[dst]\n\t"
++
++                        "and  ip, %[w], #7\n\t"
++                        "add  %[mask], %[mask], ip\n\t"
++                        "add  %[dst], %[dst], ip, LSL#1\n\t"
++                        "subs  %[w], %[w], ip\n\t"
++                        "b  9f\n\t"
++// LOOP
++                        "2:\n\t"
++
++                        "vld1.16      {q12}, [%[dst]]!\n\t"
++                        "vld1.8       {d31}, [%[mask]]!\n\t"
++                        "vst1.16      {q10}, [%[keep_dst]]\n\t"
++                        "sub  %[keep_dst], %[dst], #8*2\n\t"
++                        "subs  %[w], %[w], #8\n\t"
++                        "9:\n\t"
++// expand 0565 q12 to 8888 {d4-d7}
++                        "vmovn.u16    d4, q12\t\n"
++                        "vshr.u16     q11, q12, #5\t\n"
++                        "vshr.u16     q10, q12, #6+5\t\n"
++                        "vmovn.u16    d5, q11\t\n"
++                        "vmovn.u16    d6, q10\t\n"
++                        "vshl.u8      d4, d4, #3\t\n"
++                        "vshl.u8      d5, d5, #2\t\n"
++                        "vshl.u8      d6, d6, #3\t\n"
++                        "vsri.u8      d4, d4, #5\t\n"
++                        "vsri.u8      d5, d5, #6\t\n"
++                        "vsri.u8      d6, d6, #5\t\n"
++
++                        "vmull.u8     q10, d31, d0\n\t"
++                        "vmull.u8     q11, d31, d1\n\t"
++                        "vmull.u8     q12, d31, d2\n\t"
++                        "vmull.u8     q13, d31, d3\n\t"
++                        "vrshr.u16    q8, q10, #8\n\t"
++                        "vrshr.u16    q9, q11, #8\n\t"
++                        "vraddhn.u16  d20, q10, q8\n\t"
++                        "vraddhn.u16  d21, q11, q9\n\t"
++                        "vrshr.u16    q9, q13, #8\n\t"
++                        "vrshr.u16    q8, q12, #8\n\t"
++                        "vraddhn.u16  d23, q13, q9\n\t"
++                        "vraddhn.u16  d22, q12, q8\n\t"
++
++// duplicate in 4/2/1 & 8pix vsns
++                        "vmvn.8       d30, d23\n\t"
++                        "vmull.u8     q14, d30, d6\n\t"
++                        "vmull.u8     q13, d30, d5\n\t"
++                        "vmull.u8     q12, d30, d4\n\t"
++                        "vrshr.u16    q8, q14, #8\n\t"
++                        "vrshr.u16    q9, q13, #8\n\t"
++                        "vraddhn.u16  d6, q14, q8\n\t"
++                        "vrshr.u16    q8, q12, #8\n\t"
++                        "vraddhn.u16  d5, q13, q9\n\t"
++                        "vqadd.u8     d6, d6, d22\n\t"  // moved up
++                        "vraddhn.u16  d4, q12, q8\n\t"
++// intentionally don't calculate alpha
++// result in d4-d6
++
++//                      "vqadd.u8     d6, d6, d22\n\t"  ** moved up
++                        "vqadd.u8     d5, d5, d21\n\t"
++                        "vqadd.u8     d4, d4, d20\n\t"
++
++// pack 8888 {d20-d23} to 0565 q10
++                        "vshll.u8     q10, d6, #8\n\t"
++                        "vshll.u8     q3, d5, #8\n\t"
++                        "vshll.u8     q2, d4, #8\n\t"
++                        "vsri.u16     q10, q3, #5\t\n"
++                        "vsri.u16     q10, q2, #11\t\n"
++
++                        "bne 2b\n\t"
++
++                        "1:\n\t"
++                        "vst1.16      {q10}, [%[keep_dst]]\n\t"
++
++                        : [w] "+r" (w), [dst] "+r" (dst), [mask] "+r" (mask), [keep_dst] "+r" (keep_dst)
++                        : [src] "r" (src)
++                        : "ip", "cc", "memory", "d0","d1","d2","d3","d4","d5","d6","d7",
++                          "d16","d17","d18","d19","d20","d21","d22","d23","d24","d25","d26","d27","d28","d29",
++                          "d30","d31"
++                        );
++#endif
++        }
++    }
++    else
++    {
++        while (height--)
++        {
++            void *dst4, *dst2;
++
++            dst = dstLine;
++            dstLine += dstStride;
++            mask = maskLine;
++            maskLine += maskStride;
++            w = width;
++
++
++#ifndef USE_NEON_INLINE_ASM
++            uint8x8_t alpha;
++            uint16x8_t dval, temp;
++            uint8x8x4_t sval8temp;
++
++            if (w&4)
++            {
++                alpha = vreinterpret_u8_u32(vld1_lane_u32((void*)mask,vreinterpret_u32_u8(alpha),1));
++                dval = vreinterpretq_u16_u64(vld1q_lane_u64((void*)dst,vreinterpretq_u64_u16(dval),1));
++                dst4=dst;
++                mask+=4;
++                dst+=4;
++            }
++            if (w&2)
++            {
++                alpha = vreinterpret_u8_u16(vld1_lane_u16((void*)mask,vreinterpret_u16_u8(alpha),1));
++                dval = vreinterpretq_u16_u32(vld1q_lane_u32((void*)dst,vreinterpretq_u32_u16(dval),1));
++                dst2=dst;
++                mask+=2;
++                dst+=2;
++            }
++            if (w&1)
++            {
++                alpha = vld1_lane_u8((void*)mask,alpha,1);
++                dval = vld1q_lane_u16((void*)dst,dval,1);
++            }
++
++            sval8temp = neon8mul(sval8,alpha);
++            temp = pack0565(neon8qadd(sval8temp,neon8mul(unpack0565(dval),vmvn_u8(sval8temp.val[3]))));
++
++            if (w&1)
++                vst1q_lane_u16((void*)dst,temp,1);
++            if (w&2)
++                vst1q_lane_u32((void*)dst2,vreinterpretq_u32_u16(temp),1);
++            if (w&4)
++                vst1q_lane_u64((void*)dst4,vreinterpretq_u64_u16(temp),1);
++#else
++            asm volatile (
++                        "vdup.32      d0, %[src]\n\t"
++                        "vdup.8       d1, d0[1]\n\t"
++                        "vdup.8       d2, d0[2]\n\t"
++                        "vdup.8       d3, d0[3]\n\t"
++                        "vdup.8       d0, d0[0]\n\t"
++
++                        "tst  %[w], #4\t\n"
++                        "beq  skip_load4\t\n"
++
++                        "vld1.64      {d25}, [%[dst]]\n\t"
++                        "vld1.32      {d31[1]}, [%[mask]]\n\t"
++                        "mov  %[dst4], %[dst]\t\n"
++                        "add  %[mask], %[mask], #4\t\n"
++                        "add  %[dst], %[dst], #4*2\t\n"
++
++                        "skip_load4:\t\n"
++                        "tst  %[w], #2\t\n"
++                        "beq  skip_load2\t\n"
++                        "vld1.32      {d24[1]}, [%[dst]]\n\t"
++                        "vld1.16      {d31[1]}, [%[mask]]\n\t"
++                        "mov  %[dst2], %[dst]\t\n"
++                        "add  %[mask], %[mask], #2\t\n"
++                        "add  %[dst], %[dst], #2*2\t\n"
++
++                        "skip_load2:\t\n"
++                        "tst  %[w], #1\t\n"
++                        "beq  skip_load1\t\n"
++                        "vld1.16      {d24[1]}, [%[dst]]\n\t"
++                        "vld1.8       {d31[1]}, [%[mask]]\n\t"
++
++                        "skip_load1:\t\n"
++// expand 0565 q12 to 8888 {d4-d7}
++                        "vmovn.u16    d4, q12\t\n"
++                        "vshr.u16     q11, q12, #5\t\n"
++                        "vshr.u16     q10, q12, #6+5\t\n"
++                        "vmovn.u16    d5, q11\t\n"
++                        "vmovn.u16    d6, q10\t\n"
++                        "vshl.u8      d4, d4, #3\t\n"
++                        "vshl.u8      d5, d5, #2\t\n"
++                        "vshl.u8      d6, d6, #3\t\n"
++                        "vsri.u8      d4, d4, #5\t\n"
++                        "vsri.u8      d5, d5, #6\t\n"
++                        "vsri.u8      d6, d6, #5\t\n"
++
++                        "vmull.u8     q10, d31, d0\n\t"
++                        "vmull.u8     q11, d31, d1\n\t"
++                        "vmull.u8     q12, d31, d2\n\t"
++                        "vmull.u8     q13, d31, d3\n\t"
++                        "vrshr.u16    q8, q10, #8\n\t"
++                        "vrshr.u16    q9, q11, #8\n\t"
++                        "vraddhn.u16  d20, q10, q8\n\t"
++                        "vraddhn.u16  d21, q11, q9\n\t"
++                        "vrshr.u16    q9, q13, #8\n\t"
++                        "vrshr.u16    q8, q12, #8\n\t"
++                        "vraddhn.u16  d23, q13, q9\n\t"
++                        "vraddhn.u16  d22, q12, q8\n\t"
++
++// duplicate in 4/2/1 & 8pix vsns
++                        "vmvn.8       d30, d23\n\t"
++                        "vmull.u8     q14, d30, d6\n\t"
++                        "vmull.u8     q13, d30, d5\n\t"
++                        "vmull.u8     q12, d30, d4\n\t"
++                        "vrshr.u16    q8, q14, #8\n\t"
++                        "vrshr.u16    q9, q13, #8\n\t"
++                        "vraddhn.u16  d6, q14, q8\n\t"
++                        "vrshr.u16    q8, q12, #8\n\t"
++                        "vraddhn.u16  d5, q13, q9\n\t"
++                        "vqadd.u8     d6, d6, d22\n\t"  // moved up
++                        "vraddhn.u16  d4, q12, q8\n\t"
++// intentionally don't calculate alpha
++// result in d4-d6
++
++//                      "vqadd.u8     d6, d6, d22\n\t"  ** moved up
++                        "vqadd.u8     d5, d5, d21\n\t"
++                        "vqadd.u8     d4, d4, d20\n\t"
++
++// pack 8888 {d20-d23} to 0565 q10
++                        "vshll.u8     q10, d6, #8\n\t"
++                        "vshll.u8     q3, d5, #8\n\t"
++                        "vshll.u8     q2, d4, #8\n\t"
++                        "vsri.u16     q10, q3, #5\t\n"
++                        "vsri.u16     q10, q2, #11\t\n"
++
++                        "tst  %[w], #1\n\t"
++                        "beq skip_store1\t\n"
++                        "vst1.16      {d20[1]}, [%[dst]]\t\n"
++                        "skip_store1:\t\n"
++                        "tst  %[w], #2\n\t"
++                        "beq  skip_store2\t\n"
++                        "vst1.32      {d20[1]}, [%[dst2]]\t\n"
++                        "skip_store2:\t\n"
++                        "tst  %[w], #4\n\t"
++                        "beq skip_store4\t\n"
++                        "vst1.16      {d21}, [%[dst4]]\t\n"
++                        "skip_store4:\t\n"
++
++                        : [w] "+r" (w), [dst] "+r" (dst), [mask] "+r" (mask), [dst4] "+r" (dst4), [dst2] "+r" (dst2)
++                        : [src] "r" (src)
++                        : "ip", "cc", "memory", "d0","d1","d2","d3","d4","d5","d6","d7",
++                          "d16","d17","d18","d19","d20","d21","d22","d23","d24","d25","d26","d27","d28","d29",
++                          "d30","d31"
++                        );
++#endif
++        }
++    }
++}
++
++
++void
++fbCompositeSolidMask_nx8x8888neon (pixman_op_t      op,
++			       pixman_image_t * pSrc,
++			       pixman_image_t * pMask,
++			       pixman_image_t * pDst,
++			       int16_t      xSrc,
++			       int16_t      ySrc,
++			       int16_t      xMask,
++			       int16_t      yMask,
++			       int16_t      xDst,
++			       int16_t      yDst,
++			       uint16_t     width,
++			       uint16_t     height)
++{
++    uint32_t	 src, srca;
++    uint32_t	*dstLine, *dst;
++    uint8_t	*maskLine, *mask;
++    int		 dstStride, maskStride;
++    uint32_t	 w;
++    uint8x8_t    sval2;
++    uint8x8x4_t  sval8;
++    uint8x8_t    mask_selector=vreinterpret_u8_u64(vcreate_u64(0x0101010100000000ULL));
++    uint8x8_t    alpha_selector=vreinterpret_u8_u64(vcreate_u64(0x0707070703030303ULL));
++
++    fbComposeGetSolid(pSrc, src, pDst->bits.format);
++
++    srca = src >> 24;
++    if (src == 0)
++	return;
++
++    sval2=vreinterpret_u8_u32(vdup_n_u32(src));
++    sval8.val[0]=vdup_lane_u8(sval2,0);
++    sval8.val[1]=vdup_lane_u8(sval2,1);
++    sval8.val[2]=vdup_lane_u8(sval2,2);
++    sval8.val[3]=vdup_lane_u8(sval2,3);
++
++    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
++    fbComposeGetStart (pMask, xMask, yMask, uint8_t, maskStride, maskLine, 1);
++
++    if (width>=8)
++    {
++        // Use overlapping 8-pixel method, modified to avoid rewritten dest being reused
++        while (height--)
++        {
++            uint32_t *keep_dst;
++
++            dst = dstLine;
++            dstLine += dstStride;
++            mask = maskLine;
++            maskLine += maskStride;
++            w = width;
++
++#ifndef USE_NEON_INLINE_ASM
++            uint8x8_t alpha;
++            uint8x8x4_t dval, temp;
++
++            alpha = vld1_u8((void*)mask);
++            dval = vld4_u8((void*)dst);
++            keep_dst = dst;
++
++            temp = neon8mul(sval8,alpha);
++            dval = neon8mul(dval,vmvn_u8(temp.val[3]));
++            temp = neon8qadd(temp,dval);
++
++            mask += (w & 7);
++            dst += (w & 7);
++            w -= (w & 7);
++
++            while (w)
++            {
++                alpha = vld1_u8((void*)mask);
++                dval = vld4_u8((void*)dst);
++
++                vst4_u8((void*)keep_dst,temp);
++                keep_dst = dst;
++
++                temp = neon8mul(sval8,alpha);
++                dval = neon8mul(dval,vmvn_u8(temp.val[3]));
++                temp = neon8qadd(temp,dval);
++
++                mask+=8;
++                dst+=8;
++                w-=8;
++            }
++            vst4_u8((void*)keep_dst,temp);
++#else
++        asm volatile (
++                        "vdup.32      d0, %[src]\n\t"
++                        "vdup.8       d1, d0[1]\n\t"
++                        "vdup.8       d2, d0[2]\n\t"
++                        "vdup.8       d3, d0[3]\n\t"
++                        "vdup.8       d0, d0[0]\n\t"
++
++                        "vld4.8       {d4-d7}, [%[dst]]\n\t"
++                        "vld1.8       {d31}, [%[mask]]\n\t"
++                        "mov  %[keep_dst], %[dst]\n\t"
++
++                        "and  ip, %[w], #7\n\t"
++                        "add  %[mask], %[mask], ip\n\t"
++                        "add  %[dst], %[dst], ip, LSL#2\n\t"
++                        "subs  %[w], %[w], ip\n\t"
++                        "b 9f\n\t"
++// LOOP
++                        "2:\n\t" 
++                        "vld4.8       {d4-d7}, [%[dst]]!\n\t"
++                        "vld1.8       {d31}, [%[mask]]!\n\t"
++                        "vst4.8       {d20-d23}, [%[keep_dst]]\n\t"
++                        "sub  %[keep_dst], %[dst], #8*4\n\t"
++                        "subs  %[w], %[w], #8\n\t"
++                        "9:\n\t"
++
++                        "vmull.u8     q10, d31, d0\n\t"
++                        "vmull.u8     q11, d31, d1\n\t"
++                        "vmull.u8     q12, d31, d2\n\t"
++                        "vmull.u8     q13, d31, d3\n\t"
++                        "vrshr.u16    q8, q10, #8\n\t"
++                        "vrshr.u16    q9, q11, #8\n\t"
++                        "vraddhn.u16  d20, q10, q8\n\t"
++                        "vraddhn.u16  d21, q11, q9\n\t"
++                        "vrshr.u16    q9, q13, #8\n\t"
++                        "vrshr.u16    q8, q12, #8\n\t"
++                        "vraddhn.u16  d23, q13, q9\n\t"
++                        "vraddhn.u16  d22, q12, q8\n\t"
++
++                        "vmvn.8       d30, d23\n\t"
++                        "vmull.u8     q12, d30, d4\n\t"
++                        "vmull.u8     q13, d30, d5\n\t"
++                        "vmull.u8     q14, d30, d6\n\t"
++                        "vmull.u8     q15, d30, d7\n\t"
++
++                        "vrshr.u16    q8, q12, #8\n\t"
++                        "vrshr.u16    q9, q13, #8\n\t"
++                        "vraddhn.u16  d4, q12, q8\n\t"
++                        "vrshr.u16    q8, q14, #8\n\t"
++                        "vraddhn.u16  d5, q13, q9\n\t"
++                        "vrshr.u16    q9, q15, #8\n\t"
++                        "vraddhn.u16  d6, q14, q8\n\t"
++                        "vraddhn.u16  d7, q15, q9\n\t"
++// result in d4-d7
++
++                        "vqadd.u8     d20, d4, d20\n\t"
++                        "vqadd.u8     d21, d5, d21\n\t"
++                        "vqadd.u8     d22, d6, d22\n\t"
++                        "vqadd.u8     d23, d7, d23\n\t"
++
++                        "bne 2b\n\t"
++
++                        "1:\n\t"
++                        "vst4.8       {d20-d23}, [%[keep_dst]]\n\t"
++
++                        : [w] "+r" (w), [dst] "+r" (dst), [mask] "+r" (mask), [keep_dst] "+r" (keep_dst)
++                        : [src] "r" (src) 
++                        : "ip", "cc", "memory", "d0","d1","d2","d3","d4","d5","d6","d7",
++                          "d16","d17","d18","d19","d20","d21","d22","d23","d24","d25","d26","d27","d28","d29",
++                          "d30","d31"
++                        );
++#endif
++        }
++    }
++    else
++    {
++        while (height--)
++        {
++            uint8x8_t alpha;
++
++            dst = dstLine;
++            dstLine += dstStride;
++            mask = maskLine;
++            maskLine += maskStride;
++            w = width;
++
++            while (w>=2)
++            {
++                uint8x8_t dval, temp, res;
++
++                alpha = vtbl1_u8(vreinterpret_u8_u16(vld1_dup_u16((void*)mask)), mask_selector);
++                dval = vld1_u8((void*)dst);
++
++                temp = neon2mul(sval2,alpha);
++                res = vqadd_u8(temp,neon2mul(dval,vtbl1_u8(vmvn_u8(temp), alpha_selector)));
++
++                vst1_u8((void*)dst,res);
++
++                mask+=2;
++                dst+=2;
++                w-=2;
++            }
++            if (w)
++            {
++                uint8x8_t dval, temp, res;
++
++                alpha = vtbl1_u8(vld1_dup_u8((void*)mask), mask_selector);
++                dval = vreinterpret_u8_u32(vld1_dup_u32((void*)dst));
++
++                temp = neon2mul(sval2,alpha);
++                res = vqadd_u8(temp,neon2mul(dval,vtbl1_u8(vmvn_u8(temp), alpha_selector)));
++
++                vst1_lane_u32((void*)dst,vreinterpret_u32_u8(res),0);
++            }
++        }
++    }
++}
++
++
++void
++fbCompositeSrcAdd_8888x8x8neon (pixman_op_t op,
++                            pixman_image_t * pSrc,
++                            pixman_image_t * pMask,
++                            pixman_image_t * pDst,
++                            int16_t      xSrc,
++                            int16_t      ySrc,
++                            int16_t      xMask,
++                            int16_t      yMask,
++                            int16_t      xDst,
++                            int16_t      yDst,
++                            uint16_t     width,
++                            uint16_t     height)
++{
++    uint8_t     *dstLine, *dst;
++    uint8_t     *maskLine, *mask;
++    int dstStride, maskStride;
++    uint32_t    w;
++    uint32_t    src;
++    uint8x8_t   sa;
++
++    fbComposeGetStart (pDst, xDst, yDst, uint8_t, dstStride, dstLine, 1);
++    fbComposeGetStart (pMask, xMask, yMask, uint8_t, maskStride, maskLine, 1);
++    fbComposeGetSolid (pSrc, src, pDst->bits.format);
++    sa = vdup_n_u8((src) >> 24);
++
++    if (width>=8)
++    {
++        // Use overlapping 8-pixel method, modified to avoid rewritten dest being reused
++        while (height--)
++        {
++            dst = dstLine;
++            dstLine += dstStride;
++            mask = maskLine;
++            maskLine += maskStride;
++            w = width;
++
++            uint8x8_t mval, dval, res;
++            uint8_t     *keep_dst;
++
++            mval = vld1_u8((void *)mask);
++            dval = vld1_u8((void *)dst);
++            keep_dst = dst;
++
++            res = vqadd_u8(neon2mul(mval,sa),dval);
++
++            mask += (w & 7);
++            dst += (w & 7);
++            w -= w & 7;
++
++            while (w)
++            {
++                mval = vld1_u8((void *)mask);
++                dval = vld1_u8((void *)dst);
++                vst1_u8((void *)keep_dst, res);
++                keep_dst = dst;
++
++                res = vqadd_u8(neon2mul(mval,sa),dval);
++
++                mask += 8;
++                dst += 8;
++                w -= 8;
++            }
++            vst1_u8((void *)keep_dst, res);
++        }
++    }
++    else
++    {
++        // Use 4/2/1 load/store method to handle 1-7 pixels
++        while (height--)
++        {
++            dst = dstLine;
++            dstLine += dstStride;
++            mask = maskLine;
++            maskLine += maskStride;
++            w = width;
++
++            uint8x8_t mval, dval, res;
++            uint8_t *dst4, *dst2;
++
++            if (w&4)
++            {
++                mval = vreinterpret_u8_u32(vld1_lane_u32((void *)mask, vreinterpret_u32_u8(mval), 1));
++                dval = vreinterpret_u8_u32(vld1_lane_u32((void *)dst, vreinterpret_u32_u8(dval), 1));
++
++                dst4 = dst;
++                mask += 4;
++                dst += 4;
++            }
++            if (w&2)
++            {
++                mval = vreinterpret_u8_u16(vld1_lane_u16((void *)mask, vreinterpret_u16_u8(mval), 1));
++                dval = vreinterpret_u8_u16(vld1_lane_u16((void *)dst, vreinterpret_u16_u8(dval), 1));
++                dst2 = dst;
++                mask += 2;
++                dst += 2;
++            }
++            if (w&1)
++            {
++                mval = vld1_lane_u8((void *)mask, mval, 1);
++                dval = vld1_lane_u8((void *)dst, dval, 1);
++            }
++
++            res = vqadd_u8(neon2mul(mval,sa),dval);
++
++            if (w&1)
++                vst1_lane_u8((void *)dst, res, 1);
++            if (w&2)
++                vst1_lane_u16((void *)dst2, vreinterpret_u16_u8(res), 1);
++            if (w&4)
++                vst1_lane_u32((void *)dst4, vreinterpret_u32_u8(res), 1);
++        }
++    }
++}
++
+diff --git a/pixman/pixman-arm-neon.h b/pixman/pixman-arm-neon.h
+new file mode 100644
+index 0000000..bab4dee
+--- /dev/null
++++ b/pixman/pixman-arm-neon.h
+@@ -0,0 +1,137 @@
++/*
++ * Copyright © 2009 Mozilla Corporation
++ *
++ * Permission to use, copy, modify, distribute, and sell this software and its
++ * documentation for any purpose is hereby granted without fee, provided that
++ * the above copyright notice appear in all copies and that both that
++ * copyright notice and this permission notice appear in supporting
++ * documentation, and that the name of Mozilla Corporation not be used in
++ * advertising or publicity pertaining to distribution of the software without
++ * specific, written prior permission.  Mozilla Corporation makes no
++ * representations about the suitability of this software for any purpose.  It
++ * is provided "as is" without express or implied warranty.
++ *
++ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
++ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
++ * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
++ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
++ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
++ * SOFTWARE.
++ *
++ * Author:  Ian Rickards (ian.rickards@arm.com)
++ *
++ */
++
++#include "pixman-private.h"
++
++#ifdef USE_ARM_NEON
++
++static inline pixman_bool_t pixman_have_arm_neon(void) { return TRUE; }
++
++#else
++#define pixman_have_arm_neon() FALSE
++#endif
++
++#ifdef USE_ARM_NEON
++
++void
++fbCompositeSrcAdd_8000x8000neon (pixman_op_t op,
++                        pixman_image_t * pSrc,
++                        pixman_image_t * pMask,
++                        pixman_image_t * pDst,
++                        int16_t      xSrc,
++                        int16_t      ySrc,
++                        int16_t      xMask,
++                        int16_t      yMask,
++                        int16_t      xDst,
++                        int16_t      yDst,
++                        uint16_t     width,
++                        uint16_t     height);
++
++void
++fbCompositeSrc_8888x8888neon (pixman_op_t op,
++			pixman_image_t * pSrc,
++			pixman_image_t * pMask,
++			pixman_image_t * pDst,
++			int16_t      xSrc,
++			int16_t      ySrc,
++			int16_t      xMask,
++			int16_t      yMask,
++			int16_t      xDst,
++			int16_t      yDst,
++			uint16_t     width,
++			uint16_t     height);
++
++void
++fbCompositeSrc_8888x8x8888neon (pixman_op_t op,
++			pixman_image_t * pSrc,
++			pixman_image_t * pMask,
++			pixman_image_t * pDst,
++			int16_t      xSrc,
++			int16_t      ySrc,
++			int16_t      xMask,
++			int16_t      yMask,
++			int16_t      xDst,
++			int16_t      yDst,
++			uint16_t     width,
++			uint16_t     height);
++
++void
++fbCompositeSolidMask_nx8x0565neon (pixman_op_t op,
++                        pixman_image_t * pSrc,
++                        pixman_image_t * pMask,
++                        pixman_image_t * pDst,
++                        int16_t      xSrc,
++                        int16_t      ySrc,
++                        int16_t      xMask,
++                        int16_t      yMask,
++                        int16_t      xDst,
++                        int16_t      yDst,
++                        uint16_t     width,
++                        uint16_t     height);
++
++void
++fbCompositeSolidMask_nx8x8888neon (pixman_op_t op,
++			pixman_image_t * pSrc,
++			pixman_image_t * pMask,
++			pixman_image_t * pDst,
++			int16_t      xSrc,
++			int16_t      ySrc,
++			int16_t      xMask,
++			int16_t      yMask,
++			int16_t      xDst,
++			int16_t      yDst,
++		 	uint16_t     width,
++			uint16_t     height);
++
++void
++fbCompositeSrc_x888x0565neon (pixman_op_t op,
++                        pixman_image_t * pSrc,
++                        pixman_image_t * pMask,
++                        pixman_image_t * pDst,
++                        int16_t      xSrc,
++                        int16_t      ySrc,
++                        int16_t      xMask,
++                        int16_t      yMask,
++                        int16_t      xDst,
++                        int16_t      yDst,
++                        uint16_t     width,
++                        uint16_t     height);
++
++void
++fbCompositeSrcAdd_8888x8x8neon (pixman_op_t op,
++                        pixman_image_t * pSrc,
++                        pixman_image_t * pMask,
++                        pixman_image_t * pDst,
++                        int16_t      xSrc,
++                        int16_t      ySrc,
++                        int16_t      xMask,
++                        int16_t      yMask,
++                        int16_t      xDst,
++                        int16_t      yDst,
++                        uint16_t     width,
++                        uint16_t     height);
++
++#endif /* USE_ARM_NEON */
+diff --git a/pixman/pixman-pict.c b/pixman/pixman-pict.c
+index 1388517..b13947a 100644
+--- a/pixman/pixman-pict.c
++++ b/pixman/pixman-pict.c
+@@ -34,6 +34,7 @@
+ #include "pixman-mmx.h"
+ #include "pixman-vmx.h"
+ #include "pixman-sse2.h"
++#include "pixman-arm-neon.h"
+ #include "pixman-arm-simd.h"
+ #include "pixman-combine32.h"
+ 
+@@ -1518,6 +1519,31 @@ static const FastPathInfo vmx_fast_paths[] =
+ };
+ #endif
+ 
++#ifdef USE_ARM_NEON
++static const FastPathInfo arm_neon_fast_paths[] =
++{
++    { PIXMAN_OP_ADD,  PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8,       fbCompositeSrcAdd_8888x8x8neon,        0 },
++    { PIXMAN_OP_ADD,  PIXMAN_a8,       PIXMAN_null,     PIXMAN_a8,       fbCompositeSrcAdd_8000x8000neon,       0 },
++    { PIXMAN_OP_SRC,  PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_r5g6b5,   fbCompositeSrc_x888x0565neon,          0 },
++    { PIXMAN_OP_SRC,  PIXMAN_x8r8g8b8, PIXMAN_null,     PIXMAN_r5g6b5,   fbCompositeSrc_x888x0565neon,          0 },
++    { PIXMAN_OP_SRC,  PIXMAN_a8b8g8r8, PIXMAN_null,     PIXMAN_b5g6r5,   fbCompositeSrc_x888x0565neon,          0 },
++    { PIXMAN_OP_SRC,  PIXMAN_x8b8g8r8, PIXMAN_null,     PIXMAN_b5g6r5,   fbCompositeSrc_x888x0565neon,          0 },
++    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_a8r8g8b8, fbCompositeSrc_8888x8888neon,          0 },
++    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_x8r8g8b8, fbCompositeSrc_8888x8888neon,          0 },
++    { PIXMAN_OP_OVER, PIXMAN_a8b8g8r8, PIXMAN_null,     PIXMAN_a8b8g8r8, fbCompositeSrc_8888x8888neon,          0 },
++    { PIXMAN_OP_OVER, PIXMAN_a8b8g8r8, PIXMAN_null,     PIXMAN_x8b8g8r8, fbCompositeSrc_8888x8888neon,          0 },
++    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_a8,       PIXMAN_a8r8g8b8, fbCompositeSrc_8888x8x8888neon,        NEED_SOLID_MASK },
++    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_a8,       PIXMAN_x8r8g8b8, fbCompositeSrc_8888x8x8888neon,        NEED_SOLID_MASK },
++    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_r5g6b5,   fbCompositeSolidMask_nx8x0565neon,     0 },
++    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_b5g6r5,   fbCompositeSolidMask_nx8x0565neon,     0 },
++    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8r8g8b8, fbCompositeSolidMask_nx8x8888neon,     0 },
++    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_x8r8g8b8, fbCompositeSolidMask_nx8x8888neon,     0 },
++    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8b8g8r8, fbCompositeSolidMask_nx8x8888neon,     0 },
++    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_x8b8g8r8, fbCompositeSolidMask_nx8x8888neon,     0 },
++    { PIXMAN_OP_NONE },
++};
++#endif
++
+ #ifdef USE_ARM_SIMD
+ static const FastPathInfo arm_simd_fast_paths[] =
+ {
+@@ -1893,6 +1919,11 @@ pixman_image_composite (pixman_op_t      op,
+ 	    info = get_fast_path (vmx_fast_paths, op, pSrc, pMask, pDst, pixbuf);
+ #endif
+ 
++#ifdef USE_ARM_NEON
++        if (!info && pixman_have_arm_neon())
++            info = get_fast_path (arm_neon_fast_paths, op, pSrc, pMask, pDst, pixbuf);
++#endif
++
+ #ifdef USE_ARM_SIMD
+ 	if (!info && pixman_have_arm_simd())
+ 	    info = get_fast_path (arm_simd_fast_paths, op, pSrc, pMask, pDst, pixbuf);
diff --git a/recipes/xorg-lib/pixman-0.17.8/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/xorg-lib/pixman-0.17.8/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
deleted file mode 100644
index 25ce7ee..0000000
--- a/recipes/xorg-lib/pixman-0.17.8/0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From c29c9fa826b7112156fd6150b5f1564227935c05 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:27:33 +0300
-Subject: [PATCH 3/6] Generic C implementation of pixman_blt with overlapping support
-
-Uses memcpy/memmove functions to copy pixels, can handle the
-case when both source and destination areas are in the same
-image (this is useful for scrolling).
-
-It is assumed that copying direction is only important when
-using the same image for both source and destination (and
-src_stride == dst_stride). Copying direction is undefined
-for the images with different source and destination stride
-which happen to be in the overlapped areas (but this is an
-unrealistic case anyway).
----
- pixman/pixman-general.c |   21 ++++++++++++++++++---
- pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 61 insertions(+), 3 deletions(-)
-
-diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
-index c96a3f9..d71a299 100644
---- a/pixman/pixman-general.c
-+++ b/pixman/pixman-general.c
-@@ -300,9 +300,24 @@ general_blt (pixman_implementation_t *imp,
-              int                      width,
-              int                      height)
- {
--    /* We can't blit unless we have sse2 or mmx */
--
--    return FALSE;
-+    uint8_t *dst_bytes = (uint8_t *)dst_bits;
-+    uint8_t *src_bytes = (uint8_t *)src_bits;
-+    int bpp;
-+
-+    if (src_bpp != dst_bpp || src_bpp & 7)
-+	return FALSE;
-+
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
-+                       dst_bytes + dst_y * dst_stride + dst_x * bpp,
-+                       src_stride,
-+                       dst_stride,
-+                       width,
-+                       height);
-+    return TRUE;
- }
- 
- static pixman_bool_t
-diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index 5000f91..8c5d4fd 100644
---- a/pixman/pixman-private.h
-+++ b/pixman/pixman-private.h
-@@ -10,6 +10,7 @@
- 
- #include "pixman.h"
- #include <time.h>
-+#include <string.h>
- #include <assert.h>
- 
- #include "pixman-compiler.h"
-@@ -794,4 +795,46 @@ void pixman_timer_register (pixman_timer_t *timer);
- 
- #endif /* PIXMAN_TIMERS */
- 
-+/* a helper function, can blit 8-bit images with src/dst overlapping support */
-+static inline void
-+pixman_blt_helper (uint8_t *src_bytes,
-+                   uint8_t *dst_bytes,
-+                   int      src_stride,
-+                   int      dst_stride,
-+                   int      width,
-+                   int      height)
-+{
-+    /*
-+     * The second part of this check is not strictly needed, but it prevents
-+     * unnecessary upside-down processing of areas which belong to different
-+     * images. Upside-down processing can be slower with fixed-distance-ahead
-+     * prefetch and perceived as having more tearing.
-+     */
-+    if (src_bytes < dst_bytes + width &&
-+	src_bytes + src_stride * height > dst_bytes)
-+    {
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+	/* Horizontal scrolling to the left needs memmove */
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return;
-+	}
-+    }
-+    while (--height >= 0)
-+    {
-+	memcpy (dst_bytes, src_bytes, width);
-+	dst_bytes += dst_stride;
-+	src_bytes += src_stride;
-+    }
-+}
-+
- #endif /* PIXMAN_PRIVATE_H */
--- 
-1.6.2.4
-
diff --git a/recipes/xorg-lib/pixman-0.17.8/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/xorg-lib/pixman-0.17.8/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
deleted file mode 100644
index 74c7b45..0000000
--- a/recipes/xorg-lib/pixman-0.17.8/0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 7ca32542c957ff308a6ca7e3715e6552a65ae395 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:47 +0300
-Subject: [PATCH 4/6] Support of overlapping src/dst for pixman_blt_mmx
-
----
- pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
-index 819e3a0..dcccadb 100644
---- a/pixman/pixman-mmx.c
-+++ b/pixman/pixman-mmx.c
-@@ -3002,34 +3002,43 @@ pixman_blt_mmx (uint32_t *src_bits,
- {
-     uint8_t *   src_bytes;
-     uint8_t *   dst_bytes;
--    int byte_width;
-+    int         bpp;
- 
--    if (src_bpp != dst_bpp)
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
--    if (src_bpp == 16)
--    {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
--	src_bytes = (uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 2 * width;
--	src_stride *= 2;
--	dst_stride *= 2;
--    }
--    else if (src_bpp == 32)
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-     {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
--	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 4 * width;
--	src_stride *= 4;
--	dst_stride *= 4;
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-     }
--    else
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-     {
--	return FALSE;
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using MMX */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-     }
- 
-     while (height--)
-@@ -3039,7 +3048,7 @@ pixman_blt_mmx (uint32_t *src_bits,
- 	uint8_t *d = dst_bytes;
- 	src_bytes += src_stride;
- 	dst_bytes += dst_stride;
--	w = byte_width;
-+	w = width;
- 
- 	while (w >= 2 && ((unsigned long)d & 3))
- 	{
--- 
-1.6.2.4
-
diff --git a/recipes/xorg-lib/pixman-0.17.8/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/xorg-lib/pixman-0.17.8/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
deleted file mode 100644
index 3704fbf..0000000
--- a/recipes/xorg-lib/pixman-0.17.8/0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From edc80b41c6480b7c80ec5f7c835c92b2debb3774 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:54 +0300
-Subject: [PATCH 5/6] Support of overlapping src/dst for pixman_blt_sse2
-
----
- pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
-index 78b0ad1..b84636b 100644
---- a/pixman/pixman-sse2.c
-+++ b/pixman/pixman-sse2.c
-@@ -5300,34 +5300,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
- {
-     uint8_t *   src_bytes;
-     uint8_t *   dst_bytes;
--    int byte_width;
-+    int         bpp;
- 
--    if (src_bpp != dst_bpp)
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
--    if (src_bpp == 16)
--    {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
--	src_bytes =(uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 2 * width;
--	src_stride *= 2;
--	dst_stride *= 2;
--    }
--    else if (src_bpp == 32)
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-     {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
--	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 4 * width;
--	src_stride *= 4;
--	dst_stride *= 4;
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-     }
--    else
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-     {
--	return FALSE;
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using SSE2 */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-     }
- 
-     cache_prefetch ((__m128i*)src_bytes);
-@@ -5340,7 +5349,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
- 	uint8_t *d = dst_bytes;
- 	src_bytes += src_stride;
- 	dst_bytes += dst_stride;
--	w = byte_width;
-+	w = width;
- 
- 	cache_prefetch_next ((__m128i*)s);
- 	cache_prefetch_next ((__m128i*)d);
--- 
-1.6.2.4
-
diff --git a/recipes/xorg-lib/pixman-0.17.8/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/xorg-lib/pixman-0.17.8/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
deleted file mode 100644
index 7c22483..0000000
--- a/recipes/xorg-lib/pixman-0.17.8/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 86870ff530b5e435034bd80207e5758466d96cff Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Wed, 18 Nov 2009 06:08:48 +0200
-Subject: [PATCH 6/6] Support of overlapping src/dst for pixman_blt_neon
-
----
- pixman/pixman-arm-neon.c |   63 ++++++++++++++++++++++++++++++++++++++-------
- 1 files changed, 53 insertions(+), 10 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 495fda4..c632ff5 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -357,26 +357,66 @@
-                  int       width,
-                  int       height)
- {
--    if (src_bpp != dst_bpp)
-+    uint8_t *   src_bytes;
-+    uint8_t *   dst_bytes;
-+    int         bpp;
-+
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-+    {
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-+    }
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-+    {
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using NEON */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-+    }
-+
-     switch (src_bpp)
-     {
-     case 16:
- 	pixman_composite_src_0565_0565_asm_neon (
--		width, height,
--		(uint16_t *)(((char *) dst_bits) +
--		dst_y * dst_stride * 4 + dst_x * 2), dst_stride * 2,
--		(uint16_t *)(((char *) src_bits) +
--		src_y * src_stride * 4 + src_x * 2), src_stride * 2);
-+		width >> 1,
-+		height,
-+		(uint16_t *) dst_bytes,
-+		dst_stride >> 1,
-+		(uint16_t *) src_bytes,
-+		src_stride >> 1);
- 	return TRUE;
-     case 32:
- 	pixman_composite_src_8888_8888_asm_neon (
--		width, height,
--		(uint32_t *)(((char *) dst_bits) +
--		dst_y * dst_stride * 4 + dst_x * 4), dst_stride,
--		(uint32_t *)(((char *) src_bits) +
--		src_y * src_stride * 4 + src_x * 4), src_stride);
-+		width >> 2,
-+		height,
-+		(uint32_t *) dst_bytes,
-+		dst_stride >> 2,
-+		(uint32_t *) src_bytes,
-+		src_stride >> 2);
- 	return TRUE;
-     default:
- 	return FALSE;
--- 
-1.6.2.4
-
diff --git a/recipes/xorg-lib/pixman-0.17.8/1-composite.patch b/recipes/xorg-lib/pixman-0.17.8/1-composite.patch
deleted file mode 100644
index 31bfa39..0000000
--- a/recipes/xorg-lib/pixman-0.17.8/1-composite.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From 78652135f48c6a304fc2e75bc0e440b8b2034a4d Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Tue, 23 Feb 2010 23:44:00 +0000
-Subject: ARM: added 'neon_composite_over_n_8888_8888_ca' fast path
-
-This fast path function improves performance of 'firefox-talos-gfx'
-cairo-perf trace.
-
-Benchmark from ARM Cortex-A8 @720MHz
-
-before:
-
-[ # ]  backend                         test   min(s) median(s) stddev. count
-[  0]    image            firefox-talos-gfx  139.969  141.176   0.35%    6/6
-
-after:
-
-[ # ]  backend                         test   min(s) median(s) stddev. count
-[  0]    image            firefox-talos-gfx  111.810  112.196   0.23%    6/6
----
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index 2986884..e90d662 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -1026,6 +1026,111 @@ generate_composite_function \
- 
- /******************************************************************************/
- 
-+.macro pixman_composite_over_n_8888_8888_ca_process_pixblock_head
-+    /*
-+     * 'combine_mask_ca' replacement
-+     *
-+     * input:  solid src (n) in {d8,  d9,  d10, d11}
-+     *         dest in          {d4,  d5,  d6,  d7 }
-+     *         mask in          {d24, d25, d26, d27}
-+     * output: updated src in   {d0,  d1,  d2,  d3 }
-+     *         updated mask in  {d24, d25, d26, d3 }
-+     */
-+    vmull.u8    q0,  d24, d8
-+    vmull.u8    q1,  d25, d9
-+    vmull.u8    q6,  d26, d10
-+    vmull.u8    q7,  d27, d11
-+    vmull.u8    q9,  d11, d25
-+    vmull.u8    q12, d11, d24
-+    vmull.u8    q13, d11, d26
-+    vrshr.u16   q8,  q0,  #8
-+    vrshr.u16   q10, q1,  #8
-+    vrshr.u16   q11, q6,  #8
-+    vraddhn.u16 d0,  q0,  q8
-+    vraddhn.u16 d1,  q1,  q10
-+    vraddhn.u16 d2,  q6,  q11
-+    vrshr.u16   q11, q12, #8
-+    vrshr.u16   q8,  q9,  #8
-+    vrshr.u16   q6,  q13, #8
-+    vrshr.u16   q10, q7,  #8
-+    vraddhn.u16 d24, q12, q11
-+    vraddhn.u16 d25, q9,  q8
-+    vraddhn.u16 d26, q13, q6
-+    vraddhn.u16 d3,  q7,  q10
-+    /*
-+     * 'combine_over_ca' replacement
-+     *
-+     * output: updated dest in {d28, d29, d30, d31}
-+     */
-+    vmvn.8      d24, d24
-+    vmvn.8      d25, d25
-+    vmull.u8    q8,  d24, d4
-+    vmull.u8    q9,  d25, d5
-+    vmvn.8      d26, d26
-+    vmvn.8      d27, d3
-+    vmull.u8    q10, d26, d6
-+    vmull.u8    q11, d27, d7
-+.endm
-+
-+.macro pixman_composite_over_n_8888_8888_ca_process_pixblock_tail
-+    /* ... continue 'combine_over_ca' replacement */
-+    vrshr.u16   q14, q8,  #8
-+    vrshr.u16   q15, q9,  #8
-+    vrshr.u16   q6,  q10, #8
-+    vrshr.u16   q7,  q11, #8
-+    vraddhn.u16 d28, q14, q8
-+    vraddhn.u16 d29, q15, q9
-+    vraddhn.u16 d30, q6,  q10
-+    vraddhn.u16 d31, q7,  q11
-+    vqadd.u8    q14, q0,  q14
-+    vqadd.u8    q15, q1,  q15
-+.endm
-+
-+.macro pixman_composite_over_n_8888_8888_ca_process_pixblock_tail_head
-+        vrshr.u16   q14, q8, #8
-+        vrshr.u16   q15, q9, #8
-+    vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
-+        vrshr.u16   q6, q10, #8
-+        vrshr.u16   q7, q11, #8
-+        vraddhn.u16 d28, q14, q8
-+        vraddhn.u16 d29, q15, q9
-+        vraddhn.u16 d30, q6, q10
-+        vraddhn.u16 d31, q7, q11
-+    vld4.8      {d24, d25, d26, d27}, [MASK]!
-+        vqadd.u8    q14, q0, q14
-+        vqadd.u8    q15, q1, q15
-+    cache_preload 8, 8
-+    pixman_composite_over_n_8888_8888_ca_process_pixblock_head
-+    vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
-+.endm
-+
-+.macro pixman_composite_over_n_8888_8888_ca_init
-+    add         DUMMY, sp, #ARGS_STACK_OFFSET
-+    vpush       {d8-d15}
-+    vld1.32     {d11[0]}, [DUMMY]
-+    vdup.8      d8, d11[0]
-+    vdup.8      d9, d11[1]
-+    vdup.8      d10, d11[2]
-+    vdup.8      d11, d11[3]
-+.endm
-+
-+.macro pixman_composite_over_n_8888_8888_ca_cleanup
-+    vpop        {d8-d15}
-+.endm
-+
-+generate_composite_function \
-+    pixman_composite_over_n_8888_8888_ca_asm_neon, 0, 32, 32, \
-+    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    5, /* prefetch distance */ \
-+    pixman_composite_over_n_8888_8888_ca_init, \
-+    pixman_composite_over_n_8888_8888_ca_cleanup, \
-+    pixman_composite_over_n_8888_8888_ca_process_pixblock_head, \
-+    pixman_composite_over_n_8888_8888_ca_process_pixblock_tail, \
-+    pixman_composite_over_n_8888_8888_ca_process_pixblock_tail_head
-+
-+/******************************************************************************/
-+
- .macro pixman_composite_add_n_8_8_process_pixblock_head
-     /* expecting source data in {d8, d9, d10, d11} */
-     /* d8 - blue, d9 - green, d10 - red, d11 - alpha */
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 557301e..3f0e18e 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -269,6 +269,7 @@ BIND_SRC_NULL_DST(over_8888_8888, uint32_t, 1, uint32_t, 1)
- 
- BIND_N_MASK_DST(over_n_8_0565, uint8_t, 1, uint16_t, 1)
- BIND_N_MASK_DST(over_n_8_8888, uint8_t, 1, uint32_t, 1)
-+BIND_N_MASK_DST(over_n_8888_8888_ca, uint32_t, 1, uint32_t, 1)
- BIND_N_MASK_DST(add_n_8_8, uint8_t, 1, uint8_t, 1)
- 
- BIND_SRC_N_DST(over_8888_n_8888, uint32_t, 1, uint32_t, 1)
-@@ -412,6 +413,10 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
-     PIXMAN_STD_FAST_PATH (OVER, solid,    null,     r5g6b5,   neon_composite_over_n_0565),
-     PIXMAN_STD_FAST_PATH (OVER, solid,    null,     a8r8g8b8, neon_composite_over_n_8888),
-     PIXMAN_STD_FAST_PATH (OVER, solid,    null,     x8r8g8b8, neon_composite_over_n_8888),
-+    PIXMAN_STD_FAST_PATH_CA (OVER, solid, a8r8g8b8, a8r8g8b8, neon_composite_over_n_8888_8888_ca),
-+    PIXMAN_STD_FAST_PATH_CA (OVER, solid, a8r8g8b8, x8r8g8b8, neon_composite_over_n_8888_8888_ca),
-+    PIXMAN_STD_FAST_PATH_CA (OVER, solid, a8b8g8r8, a8b8g8r8, neon_composite_over_n_8888_8888_ca),
-+    PIXMAN_STD_FAST_PATH_CA (OVER, solid, a8b8g8r8, x8b8g8r8, neon_composite_over_n_8888_8888_ca),
-     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, solid,    a8r8g8b8, neon_composite_over_8888_n_8888),
-     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, solid,    x8r8g8b8, neon_composite_over_8888_n_8888),
-     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, a8,       a8r8g8b8, neon_composite_over_8888_8_8888),
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman-0.17.8/2-composite.patch b/recipes/xorg-lib/pixman-0.17.8/2-composite.patch
deleted file mode 100644
index 84d4d9c..0000000
--- a/recipes/xorg-lib/pixman-0.17.8/2-composite.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 6e0df74dbfca26f92a18d968e1bf410bae134c8a Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Wed, 24 Feb 2010 00:26:57 +0000
-Subject: ARM: added 'neon_composite_src_x888_8888' fast path
-
-This fast path function improves performance of 'gnome-system-monitor'
-cairo-perf trace.
-
-Benchmark from ARM Cortex-A8 @720MHz
-
-before:
-
-[ # ]  backend                         test   min(s) median(s) stddev. count
-[  0]    image         gnome-system-monitor   68.838   68.899   0.05%    5/6
-
-after:
-
-[ # ]  backend                         test   min(s) median(s) stddev. count
-[  0]    image         gnome-system-monitor   53.336   53.384   0.09%    6/6
----
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index e90d662..f2643de 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -947,6 +947,44 @@ generate_composite_function \
- 
- /******************************************************************************/
- 
-+.macro pixman_composite_src_x888_8888_process_pixblock_head
-+    vorr     q0, q0, q2
-+    vorr     q1, q1, q2
-+.endm
-+
-+.macro pixman_composite_src_x888_8888_process_pixblock_tail
-+.endm
-+
-+.macro pixman_composite_src_x888_8888_process_pixblock_tail_head
-+    vst1.32 {d0, d1, d2, d3}, [DST_W, :128]!
-+    vld1.32 {d0, d1, d2, d3}, [SRC]!
-+    vorr     q0, q0, q2
-+    vorr     q1, q1, q2
-+    cache_preload 8, 8
-+.endm
-+
-+.macro pixman_composite_src_x888_8888_init
-+    vmov.u8  q2, #0xFF
-+    vshl.u32 q2, q2, #24
-+.endm
-+
-+generate_composite_function \
-+    pixman_composite_src_x888_8888_asm_neon, 32, 0, 32, \
-+    FLAG_DST_WRITEONLY, \
-+    8, /* number of pixels, processed in a single block */ \
-+    10, /* prefetch distance */ \
-+    pixman_composite_src_x888_8888_init, \
-+    default_cleanup, \
-+    pixman_composite_src_x888_8888_process_pixblock_head, \
-+    pixman_composite_src_x888_8888_process_pixblock_tail, \
-+    pixman_composite_src_x888_8888_process_pixblock_tail_head, \
-+    0, /* dst_w_basereg */ \
-+    0, /* dst_r_basereg */ \
-+    0, /* src_basereg   */ \
-+    0  /* mask_basereg  */
-+
-+/******************************************************************************/
-+
- .macro pixman_composite_over_n_8_8888_process_pixblock_head
-     /* expecting deinterleaved source data in {d8, d9, d10, d11} */
-     /* d8 - blue, d9 - green, d10 - red, d11 - alpha */
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 3f0e18e..0a7ac31 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -251,6 +251,7 @@ neon_composite_##name (pixman_implementation_t *imp,                    \
- 
- 
- BIND_SRC_NULL_DST(src_8888_8888, uint32_t, 1, uint32_t, 1)
-+BIND_SRC_NULL_DST(src_x888_8888, uint32_t, 1, uint32_t, 1)
- BIND_SRC_NULL_DST(src_0565_0565, uint16_t, 1, uint16_t, 1)
- BIND_SRC_NULL_DST(src_0888_0888, uint8_t, 3, uint8_t, 3)
- BIND_SRC_NULL_DST(src_8888_0565, uint32_t, 1, uint16_t, 1)
-@@ -400,6 +401,10 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
-     PIXMAN_STD_FAST_PATH (SRC,  x8r8g8b8, null,     x8r8g8b8, neon_composite_src_8888_8888),
-     PIXMAN_STD_FAST_PATH (SRC,  a8b8g8r8, null,     x8b8g8r8, neon_composite_src_8888_8888),
-     PIXMAN_STD_FAST_PATH (SRC,  x8b8g8r8, null,     x8b8g8r8, neon_composite_src_8888_8888),
-+    PIXMAN_STD_FAST_PATH (SRC,  a8r8g8b8, null,     a8r8g8b8, neon_composite_src_8888_8888),
-+    PIXMAN_STD_FAST_PATH (SRC,  a8b8g8r8, null,     a8b8g8r8, neon_composite_src_8888_8888),
-+    PIXMAN_STD_FAST_PATH (SRC,  x8r8g8b8, null,     a8r8g8b8, neon_composite_src_x888_8888),
-+    PIXMAN_STD_FAST_PATH (SRC,  x8b8g8r8, null,     a8b8g8r8, neon_composite_src_x888_8888),
-     PIXMAN_STD_FAST_PATH (SRC,  r8g8b8,   null,     r8g8b8,   neon_composite_src_0888_0888),
-     PIXMAN_STD_FAST_PATH (SRC,  b8g8r8,   null,     x8r8g8b8, neon_composite_src_0888_8888_rev),
-     PIXMAN_STD_FAST_PATH (SRC,  b8g8r8,   null,     r5g6b5,   neon_composite_src_0888_0565_rev),
-@@ -430,6 +435,7 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
-     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, null,     x8r8g8b8, neon_composite_over_8888_8888),
-     PIXMAN_STD_FAST_PATH (OVER, a8b8g8r8, null,     a8b8g8r8, neon_composite_over_8888_8888),
-     PIXMAN_STD_FAST_PATH (OVER, a8b8g8r8, null,     x8b8g8r8, neon_composite_over_8888_8888),
-+    PIXMAN_STD_FAST_PATH (OVER, x8r8g8b8, null,     a8r8g8b8, neon_composite_src_x888_8888),
-     PIXMAN_STD_FAST_PATH (ADD,  solid,    a8,       a8,       neon_composite_add_n_8_8),
-     PIXMAN_STD_FAST_PATH (ADD,  a8,       a8,       a8,       neon_composite_add_8_8_8),
-     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, a8r8g8b8, a8r8g8b8, neon_composite_add_8888_8888_8888),
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman-0.17.8/3-composite.patch b/recipes/xorg-lib/pixman-0.17.8/3-composite.patch
deleted file mode 100644
index 06e40fe..0000000
--- a/recipes/xorg-lib/pixman-0.17.8/3-composite.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 19fc0c4c8d28796f0fbc2c8f47edc130851ae3a5 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Wed, 24 Feb 2010 02:14:45 +0000
-Subject: ARM: added 'neon_composite_over_reverse_n_8888' fast path
-
-This fast path function improves performance of 'poppler' cairo-perf trace.
-
-Benchmark from ARM Cortex-A8 @720MHz
-
-before:
-
-[ # ]  backend                         test   min(s) median(s) stddev. count
-[  0]    image                      poppler   38.986   39.158   0.23%    6/6
-
-after:
-
-[ # ]  backend                         test   min(s) median(s) stddev. count
-[  0]    image                      poppler   24.981   25.136   0.28%    6/6
----
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index f2643de..eb8cc4c 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -680,6 +680,61 @@ generate_composite_function \
- 
- /******************************************************************************/
- 
-+.macro pixman_composite_over_reverse_n_8888_process_pixblock_tail_head
-+        vrshr.u16   q14, q8, #8
-+                                    PF add PF_X, PF_X, #8
-+                                    PF tst PF_CTL, #0xF
-+        vrshr.u16   q15, q9, #8
-+        vrshr.u16   q12, q10, #8
-+        vrshr.u16   q13, q11, #8
-+                                    PF addne PF_X, PF_X, #8
-+                                    PF subne PF_CTL, PF_CTL, #1
-+        vraddhn.u16 d28, q14, q8
-+        vraddhn.u16 d29, q15, q9
-+                                    PF cmp PF_X, ORIG_W
-+        vraddhn.u16 d30, q12, q10
-+        vraddhn.u16 d31, q13, q11
-+        vqadd.u8    q14, q0, q14
-+        vqadd.u8    q15, q1, q15
-+    vld4.8      {d0, d1, d2, d3}, [DST_R, :128]!
-+    vmvn.8      d22, d3
-+                                    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
-+        vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
-+                                    PF subge PF_X, PF_X, ORIG_W
-+    vmull.u8    q8, d22, d4
-+                                    PF subges PF_CTL, PF_CTL, #0x10
-+    vmull.u8    q9, d22, d5
-+    vmull.u8    q10, d22, d6
-+                                    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
-+    vmull.u8    q11, d22, d7
-+.endm
-+
-+.macro pixman_composite_over_reverse_n_8888_init
-+    add         DUMMY, sp, #ARGS_STACK_OFFSET
-+    vld1.32     {d7[0]}, [DUMMY]
-+    vdup.8      d4, d7[0]
-+    vdup.8      d5, d7[1]
-+    vdup.8      d6, d7[2]
-+    vdup.8      d7, d7[3]
-+.endm
-+
-+generate_composite_function \
-+    pixman_composite_over_reverse_n_8888_asm_neon, 0, 0, 32, \
-+    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    5, /* prefetch distance */ \
-+    pixman_composite_over_reverse_n_8888_init, \
-+    default_cleanup, \
-+    pixman_composite_over_8888_8888_process_pixblock_head, \
-+    pixman_composite_over_8888_8888_process_pixblock_tail, \
-+    pixman_composite_over_reverse_n_8888_process_pixblock_tail_head, \
-+    28, /* dst_w_basereg */ \
-+    0,  /* dst_r_basereg */ \
-+    4,  /* src_basereg   */ \
-+    24  /* mask_basereg  */
-+
-+/******************************************************************************/
-+
- .macro pixman_composite_over_n_8_0565_process_pixblock_head
-     /* in */
-     vmull.u8    q0, d24, d8
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 0a7ac31..30c5056 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -264,6 +264,7 @@ BIND_SRC_NULL_DST(add_8888_8888, uint32_t, 1, uint32_t, 1)
- 
- BIND_N_NULL_DST(over_n_0565, uint16_t, 1)
- BIND_N_NULL_DST(over_n_8888, uint32_t, 1)
-+BIND_N_NULL_DST(over_reverse_n_8888, uint32_t, 1)
- 
- BIND_SRC_NULL_DST(over_8888_0565, uint32_t, 1, uint16_t, 1)
- BIND_SRC_NULL_DST(over_8888_8888, uint32_t, 1, uint32_t, 1)
-@@ -442,6 +443,8 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
-     PIXMAN_STD_FAST_PATH (ADD,  a8,       null,     a8,       neon_composite_add_8000_8000),
-     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, null,     a8r8g8b8, neon_composite_add_8888_8888),
-     PIXMAN_STD_FAST_PATH (ADD,  a8b8g8r8, null,     a8b8g8r8, neon_composite_add_8888_8888),
-+    PIXMAN_STD_FAST_PATH (OVER_REVERSE, solid, null, a8r8g8b8, neon_composite_over_reverse_n_8888),
-+    PIXMAN_STD_FAST_PATH (OVER_REVERSE, solid, null, a8b8g8r8, neon_composite_over_reverse_n_8888),
- 
-     { PIXMAN_OP_NONE },
- };
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman-0.18.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/xorg-lib/pixman-0.18.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
deleted file mode 100644
index 06b07a3..0000000
--- a/recipes/xorg-lib/pixman-0.18.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 5234e3c2c161ed5fc92caa336ae78f89112c7d77 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Tue, 16 Mar 2010 16:55:28 +0100
-Subject: [PATCH 1/5] Generic C implementation of pixman_blt with overlapping support
-
-Uses memcpy/memmove functions to copy pixels, can handle the
-case when both source and destination areas are in the same
-image (this is useful for scrolling).
-
-It is assumed that copying direction is only important when
-using the same image for both source and destination (and
-src_stride == dst_stride). Copying direction is undefined
-for the images with different source and destination stride
-which happen to be in the overlapped areas (but this is an
-unrealistic case anyway).
----
- pixman/pixman-general.c |   21 ++++++++++++++++++---
- pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 61 insertions(+), 3 deletions(-)
-
-diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
-index bddf79a..f525744 100644
---- a/pixman/pixman-general.c
-+++ b/pixman/pixman-general.c
-@@ -285,9 +285,24 @@ general_blt (pixman_implementation_t *imp,
-              int                      width,
-              int                      height)
- {
--    /* We can't blit unless we have sse2 or mmx */
--
--    return FALSE;
-+    uint8_t *dst_bytes = (uint8_t *)dst_bits;
-+    uint8_t *src_bytes = (uint8_t *)src_bits;
-+    int bpp;
-+
-+    if (src_bpp != dst_bpp || src_bpp & 7)
-+	return FALSE;
-+
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
-+                       dst_bytes + dst_y * dst_stride + dst_x * bpp,
-+                       src_stride,
-+                       dst_stride,
-+                       width,
-+                       height);
-+    return TRUE;
- }
- 
- static pixman_bool_t
-diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index d5767af..eeb677d 100644
---- a/pixman/pixman-private.h
-+++ b/pixman/pixman-private.h
-@@ -10,6 +10,7 @@
- 
- #include "pixman.h"
- #include <time.h>
-+#include <string.h>
- #include <assert.h>
- #include <stdio.h>
- #include <string.h>
-@@ -867,4 +868,46 @@ void pixman_timer_register (pixman_timer_t *timer);
- 
- #endif /* PIXMAN_TIMERS */
- 
-+/* a helper function, can blit 8-bit images with src/dst overlapping support */
-+static inline void
-+pixman_blt_helper (uint8_t *src_bytes,
-+                   uint8_t *dst_bytes,
-+                   int      src_stride,
-+                   int      dst_stride,
-+                   int      width,
-+                   int      height)
-+{
-+    /*
-+     * The second part of this check is not strictly needed, but it prevents
-+     * unnecessary upside-down processing of areas which belong to different
-+     * images. Upside-down processing can be slower with fixed-distance-ahead
-+     * prefetch and perceived as having more tearing.
-+     */
-+    if (src_bytes < dst_bytes + width &&
-+	src_bytes + src_stride * height > dst_bytes)
-+    {
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+	/* Horizontal scrolling to the left needs memmove */
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return;
-+	}
-+    }
-+    while (--height >= 0)
-+    {
-+	memcpy (dst_bytes, src_bytes, width);
-+	dst_bytes += dst_stride;
-+	src_bytes += src_stride;
-+    }
-+}
-+
- #endif /* PIXMAN_PRIVATE_H */
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman-0.18.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/xorg-lib/pixman-0.18.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
deleted file mode 100644
index bf6e58c..0000000
--- a/recipes/xorg-lib/pixman-0.18.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From f607cd0250d398077b0c51201258775e372cb3c3 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:47 +0300
-Subject: [PATCH 2/5] Support of overlapping src/dst for pixman_blt_mmx
-
----
- pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
-index e084e7f..6212b31 100644
---- a/pixman/pixman-mmx.c
-+++ b/pixman/pixman-mmx.c
-@@ -2994,34 +2994,43 @@ pixman_blt_mmx (uint32_t *src_bits,
- {
-     uint8_t *   src_bytes;
-     uint8_t *   dst_bytes;
--    int byte_width;
-+    int         bpp;
- 
--    if (src_bpp != dst_bpp)
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
--    if (src_bpp == 16)
--    {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
--	src_bytes = (uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 2 * width;
--	src_stride *= 2;
--	dst_stride *= 2;
--    }
--    else if (src_bpp == 32)
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-     {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
--	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 4 * width;
--	src_stride *= 4;
--	dst_stride *= 4;
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-     }
--    else
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-     {
--	return FALSE;
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using MMX */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-     }
- 
-     while (height--)
-@@ -3031,7 +3040,7 @@ pixman_blt_mmx (uint32_t *src_bits,
- 	uint8_t *d = dst_bytes;
- 	src_bytes += src_stride;
- 	dst_bytes += dst_stride;
--	w = byte_width;
-+	w = width;
- 
- 	while (w >= 2 && ((unsigned long)d & 3))
- 	{
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman-0.18.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/xorg-lib/pixman-0.18.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
deleted file mode 100644
index c1f3b2e..0000000
--- a/recipes/xorg-lib/pixman-0.18.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 45a9a537f94a7feab47bd82171c7d620f0d34e3f Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:54 +0300
-Subject: [PATCH 3/5] Support of overlapping src/dst for pixman_blt_sse2
-
----
- pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
-index 946e7ba..66053ae 100644
---- a/pixman/pixman-sse2.c
-+++ b/pixman/pixman-sse2.c
-@@ -5299,34 +5299,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
- {
-     uint8_t *   src_bytes;
-     uint8_t *   dst_bytes;
--    int byte_width;
-+    int         bpp;
- 
--    if (src_bpp != dst_bpp)
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
--    if (src_bpp == 16)
--    {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
--	src_bytes =(uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 2 * width;
--	src_stride *= 2;
--	dst_stride *= 2;
--    }
--    else if (src_bpp == 32)
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-     {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
--	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 4 * width;
--	src_stride *= 4;
--	dst_stride *= 4;
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-     }
--    else
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-     {
--	return FALSE;
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using SSE2 */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-     }
- 
-     cache_prefetch ((__m128i*)src_bytes);
-@@ -5339,7 +5348,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
- 	uint8_t *d = dst_bytes;
- 	src_bytes += src_stride;
- 	dst_bytes += dst_stride;
--	w = byte_width;
-+	w = width;
- 
- 	cache_prefetch_next ((__m128i*)s);
- 	cache_prefetch_next ((__m128i*)d);
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman-0.18.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/xorg-lib/pixman-0.18.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
deleted file mode 100644
index c37673e..0000000
--- a/recipes/xorg-lib/pixman-0.18.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 4cf5bfc72a724fb653c48338b93e91dccea238af Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Wed, 18 Nov 2009 06:08:48 +0200
-Subject: [PATCH 4/5] Support of overlapping src/dst for pixman_blt_neon
-
----
- pixman/pixman-arm-neon.c |   62 +++++++++++++++++++++++++++++++++++++--------
- 1 files changed, 51 insertions(+), 11 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 6808b36..7feee1d 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -168,26 +168,66 @@ pixman_blt_neon (uint32_t *src_bits,
-                  int       width,
-                  int       height)
- {
--    if (src_bpp != dst_bpp)
-+    uint8_t *   src_bytes;
-+    uint8_t *   dst_bytes;
-+    int         bpp;
-+
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-+    {
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-+    }
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-+    {
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using NEON */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-+    }
-+
-     switch (src_bpp)
-     {
-     case 16:
- 	pixman_composite_src_0565_0565_asm_neon (
--		width, height,
--		(uint16_t *)(((char *) dst_bits) +
--		dst_y * dst_stride * 4 + dst_x * 2), dst_stride * 2,
--		(uint16_t *)(((char *) src_bits) +
--		src_y * src_stride * 4 + src_x * 2), src_stride * 2);
-+		width >> 1,
-+		height,
-+		(uint16_t *) dst_bytes,
-+		dst_stride >> 1,
-+		(uint16_t *) src_bytes,
-+		src_stride >> 1);
- 	return TRUE;
-     case 32:
- 	pixman_composite_src_8888_8888_asm_neon (
--		width, height,
--		(uint32_t *)(((char *) dst_bits) +
--		dst_y * dst_stride * 4 + dst_x * 4), dst_stride,
--		(uint32_t *)(((char *) src_bits) +
--		src_y * src_stride * 4 + src_x * 4), src_stride);
-+		width >> 2,
-+		height,
-+		(uint32_t *) dst_bytes,
-+		dst_stride >> 2,
-+		(uint32_t *) src_bytes,
-+		src_stride >> 2);
- 	return TRUE;
-     default:
- 	return FALSE;
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman-0.18.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/recipes/xorg-lib/pixman-0.18.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
deleted file mode 100644
index d776574..0000000
--- a/recipes/xorg-lib/pixman-0.18.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From d1410558827fce8aac354274a7150fa915881c50 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 10 Dec 2009 00:51:50 +0200
-Subject: [PATCH 5/5] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
-
----
- pixman/pixman-access.c       |   23 ++++++++++++++++++++++-
- pixman/pixman-arm-neon-asm.S |   20 ++++++++++++++++++++
- pixman/pixman-arm-neon.c     |   41 +++++++++++++++++++++++++++++++++++++++++
- pixman/pixman-private.h      |    5 +++++
- 4 files changed, 88 insertions(+), 1 deletions(-)
-
-diff --git a/pixman/pixman-access.c b/pixman/pixman-access.c
-index fa0a267..5bb3e09 100644
---- a/pixman/pixman-access.c
-+++ b/pixman/pixman-access.c
-@@ -2748,7 +2748,7 @@ typedef struct
- 	    store_scanline_ ## format, store_scanline_generic_64	\
-     }
- 
--static const format_info_t accessors[] =
-+static format_info_t accessors[] =
- {
- /* 32 bpp formats */
-     FORMAT_INFO (a8r8g8b8),
-@@ -2891,6 +2891,27 @@ _pixman_bits_image_setup_raw_accessors (bits_image_t *image)
- 	setup_accessors (image);
- }
- 
-+void
-+_pixman_bits_override_accessors (pixman_format_code_t format,
-+                                 fetch_scanline_t     fetch_func,
-+                                 store_scanline_t     store_func)
-+{
-+    format_info_t *info = accessors;
-+
-+    while (info->format != PIXMAN_null)
-+    {
-+	if (info->format == format)
-+	{
-+	    if (fetch_func)
-+		info->fetch_scanline_raw_32 = fetch_func;
-+	    if (store_func)
-+		info->store_scanline_raw_32 = store_func;
-+	    return;
-+	}
-+	info++;
-+    }
-+}
-+
- #else
- 
- void
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index 51bc347..f30869e 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -458,6 +458,16 @@ generate_composite_function \
-     pixman_composite_src_8888_0565_process_pixblock_tail, \
-     pixman_composite_src_8888_0565_process_pixblock_tail_head
- 
-+generate_composite_function_single_scanline \
-+    pixman_store_scanline_r5g6b5_asm_neon, 32, 0, 16, \
-+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    default_init, \
-+    default_cleanup, \
-+    pixman_composite_src_8888_0565_process_pixblock_head, \
-+    pixman_composite_src_8888_0565_process_pixblock_tail, \
-+    pixman_composite_src_8888_0565_process_pixblock_tail_head
-+
- /******************************************************************************/
- 
- .macro pixman_composite_src_0565_8888_process_pixblock_head
-@@ -493,6 +503,16 @@ generate_composite_function \
-     pixman_composite_src_0565_8888_process_pixblock_tail, \
-     pixman_composite_src_0565_8888_process_pixblock_tail_head
- 
-+generate_composite_function_single_scanline \
-+    pixman_fetch_scanline_r5g6b5_asm_neon, 16, 0, 32, \
-+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    default_init, \
-+    default_cleanup, \
-+    pixman_composite_src_0565_8888_process_pixblock_head, \
-+    pixman_composite_src_0565_8888_process_pixblock_tail, \
-+    pixman_composite_src_0565_8888_process_pixblock_tail_head
-+
- /******************************************************************************/
- 
- .macro pixman_composite_add_8000_8000_process_pixblock_head
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 7feee1d..fda7a09 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -375,6 +375,43 @@ neon_combine_##name##_u (pixman_implementation_t *imp,                   \
- BIND_COMBINE_U (over)
- BIND_COMBINE_U (add)
- 
-+void
-+pixman_fetch_scanline_r5g6b5_asm_neon (int             width,
-+                                       uint32_t       *buffer,
-+                                       const uint16_t *pixel);
-+void
-+pixman_store_scanline_r5g6b5_asm_neon (int             width,
-+                                       uint16_t       *pixel,
-+                                       const uint32_t *values);
-+
-+static void
-+neon_fetch_scanline_r5g6b5 (pixman_image_t *image,
-+                            int             x,
-+                            int             y,
-+                            int             width,
-+                            uint32_t *      buffer,
-+                            const uint32_t *mask,
-+                            uint32_t        mask_bits)
-+{
-+    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
-+    const uint16_t *pixel = (const uint16_t *)bits + x;
-+
-+    pixman_fetch_scanline_r5g6b5_asm_neon (width, buffer, pixel);
-+}
-+
-+static void
-+neon_store_scanline_r5g6b5 (bits_image_t *  image,
-+                            int             x,
-+                            int             y,
-+                            int             width,
-+                            const uint32_t *values)
-+{
-+    uint32_t *bits = image->bits + image->rowstride * y;
-+    uint16_t *pixel = ((uint16_t *) bits) + x;
-+
-+    pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
-+}
-+
- pixman_implementation_t *
- _pixman_implementation_create_arm_neon (void)
- {
-@@ -385,6 +422,10 @@ _pixman_implementation_create_arm_neon (void)
-     imp->combine_32[PIXMAN_OP_OVER] = neon_combine_over_u;
-     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
- 
-+    _pixman_bits_override_accessors (PIXMAN_r5g6b5,
-+                                     neon_fetch_scanline_r5g6b5,
-+                                     neon_store_scanline_r5g6b5);
-+
-     imp->blt = arm_neon_blt;
-     imp->fill = arm_neon_fill;
- 
-diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index eeb677d..ba2d401 100644
---- a/pixman/pixman-private.h
-+++ b/pixman/pixman-private.h
-@@ -220,6 +220,11 @@ void
- _pixman_bits_image_setup_raw_accessors (bits_image_t *image);
- 
- void
-+_pixman_bits_override_accessors (pixman_format_code_t format,
-+                                 fetch_scanline_t     fetch_func,
-+                                 store_scanline_t     store_func);
-+
-+void
- _pixman_image_get_scanline_generic_64  (pixman_image_t *image,
-                                         int             x,
-                                         int             y,
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman-0.18.0/565-scanline.patch b/recipes/xorg-lib/pixman-0.18.0/565-scanline.patch
deleted file mode 100644
index 8461a46..0000000
--- a/recipes/xorg-lib/pixman-0.18.0/565-scanline.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From deef1daf5896062f47fa61b94e1e77c7c0041820 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Fri, 04 Dec 2009 16:49:19 +0000
-Subject: A copy-paste version of 16bpp bilinear scanline fetcher
-
----
-diff --git a/pixman/pixman-bits-image.c b/pixman/pixman-bits-image.c
-index 3d78ff0..1656975 100644
---- a/pixman/pixman-bits-image.c
-+++ b/pixman/pixman-bits-image.c
-@@ -535,6 +535,212 @@ bits_image_fetch_bilinear_no_repeat_8888 (pixman_image_t * ima,
- 	*buffer++ = 0;
- }
- 
-+static void
-+bits_image_fetch_bilinear_no_repeat_0565 (pixman_image_t * ima,
-+					  int              offset,
-+					  int              line,
-+					  int              width,
-+					  uint32_t *       buffer,
-+					  const uint32_t * mask,
-+					  uint32_t         mask_bits)
-+{
-+    bits_image_t *bits = &ima->bits;
-+    pixman_fixed_t x_top, x_bottom, x;
-+    pixman_fixed_t ux_top, ux_bottom, ux;
-+    pixman_vector_t v;
-+    uint32_t top_mask, bottom_mask;
-+    uint16_t *top_row;
-+    uint16_t *bottom_row;
-+    uint32_t *end;
-+    uint16_t zero[2] = { 0, 0 };
-+    int y, y1, y2;
-+    int disty;
-+    int mask_inc;
-+    int w;
-+
-+    /* reference point is the center of the pixel */
-+    v.vector[0] = pixman_int_to_fixed (offset) + pixman_fixed_1 / 2;
-+    v.vector[1] = pixman_int_to_fixed (line) + pixman_fixed_1 / 2;
-+    v.vector[2] = pixman_fixed_1;
-+
-+    if (!pixman_transform_point_3d (bits->common.transform, &v))
-+	return;
-+
-+    ux = ux_top = ux_bottom = bits->common.transform->matrix[0][0];
-+    x = x_top = x_bottom = v.vector[0] - pixman_fixed_1/2;
-+
-+    y = v.vector[1] - pixman_fixed_1/2;
-+    disty = (y >> 8) & 0xff;
-+
-+    /* Load the pointers to the first and second lines from the source
-+     * image that bilinear code must read.
-+     *
-+     * The main trick in this code is about the check if any line are
-+     * outside of the image;
-+     *
-+     * When I realize that a line (any one) is outside, I change
-+     * the pointer to a dummy area with zeros. Once I change this, I
-+     * must be sure the pointer will not change, so I set the
-+     * variables to each pointer increments inside the loop.
-+     */
-+    y1 = pixman_fixed_to_int (y);
-+    y2 = y1 + 1;
-+
-+    if (y1 < 0 || y1 >= bits->height)
-+    {
-+	top_row = zero;
-+	x_top = 0;
-+	ux_top = 0;
-+    }
-+    else
-+    {
-+	top_row = bits->bits + y1 * bits->rowstride;
-+	x_top = x;
-+	ux_top = ux;
-+    }
-+
-+    if (y2 < 0 || y2 >= bits->height)
-+    {
-+	bottom_row = zero;
-+	x_bottom = 0;
-+	ux_bottom = 0;
-+    }
-+    else
-+    {
-+	bottom_row = bits->bits + y2 * bits->rowstride;
-+	x_bottom = x;
-+	ux_bottom = ux;
-+    }
-+
-+    /* Instead of checking whether the operation uses the mast in
-+     * each loop iteration, verify this only once and prepare the
-+     * variables to make the code smaller inside the loop.
-+     */
-+    if (!mask)
-+    {
-+        mask_inc = 0;
-+        mask_bits = 1;
-+        mask = &mask_bits;
-+    }
-+    else
-+    {
-+        /* If have a mask, prepare the variables to check it */
-+        mask_inc = 1;
-+    }
-+
-+    /* If both are zero, then the whole thing is zero */
-+    if (top_row == zero && bottom_row == zero)
-+    {
-+	memset (buffer, 0, width * sizeof (uint32_t));
-+	return;
-+    }
-+    else
-+    {
-+	if (top_row == zero)
-+	{
-+	    top_mask = 0;
-+	    bottom_mask = 0xff000000;
-+	}
-+	else if (bottom_row == zero)
-+	{
-+	    top_mask = 0xff000000;
-+	    bottom_mask = 0;
-+	}
-+	else
-+	{
-+	    top_mask = 0xff000000;
-+	    bottom_mask = 0xff000000;
-+	}
-+    }
-+
-+    end = buffer + width;
-+
-+    /* Zero fill to the left of the image */
-+    while (buffer < end && x < pixman_fixed_minus_1)
-+    {
-+	*buffer++ = 0;
-+	x += ux;
-+	x_top += ux_top;
-+	x_bottom += ux_bottom;
-+	mask += mask_inc;
-+    }
-+
-+    /* Left edge
-+     */
-+    while (buffer < end && x < 0)
-+    {
-+	uint32_t tr, br;
-+	int32_t distx;
-+
-+	tr = CONVERT_0565_TO_0888 (top_row[pixman_fixed_to_int (x_top) + 1]) | top_mask;
-+	br = CONVERT_0565_TO_0888 (bottom_row[pixman_fixed_to_int (x_bottom) + 1]) | bottom_mask;
-+
-+	distx = (x >> 8) & 0xff;
-+
-+	*buffer++ = bilinear_interpolation (0, tr, 0, br, distx, disty);
-+
-+	x += ux;
-+	x_top += ux_top;
-+	x_bottom += ux_bottom;
-+	mask += mask_inc;
-+    }
-+
-+    /* Main part */
-+    w = pixman_int_to_fixed (bits->width - 1);
-+
-+    while (buffer < end  &&  x < w)
-+    {
-+	if (*mask)
-+	{
-+	    uint32_t tl, tr, bl, br;
-+	    int32_t distx;
-+
-+	    tl = CONVERT_0565_TO_0888 (top_row [pixman_fixed_to_int (x_top)]) | top_mask;
-+	    tr = CONVERT_0565_TO_0888 (top_row [pixman_fixed_to_int (x_top) + 1]) | top_mask;
-+	    bl = CONVERT_0565_TO_0888 (bottom_row [pixman_fixed_to_int (x_bottom)]) | bottom_mask;
-+	    br = CONVERT_0565_TO_0888 (bottom_row [pixman_fixed_to_int (x_bottom) + 1]) | bottom_mask;
-+
-+	    distx = (x >> 8) & 0xff;
-+
-+	    *buffer = bilinear_interpolation (tl, tr, bl, br, distx, disty);
-+	}
-+
-+	buffer++;
-+	x += ux;
-+	x_top += ux_top;
-+	x_bottom += ux_bottom;
-+	mask += mask_inc;
-+    }
-+
-+    /* Right Edge */
-+    w = pixman_int_to_fixed (bits->width);
-+    while (buffer < end  &&  x < w)
-+    {
-+	if (*mask)
-+	{
-+	    uint32_t tl, bl;
-+	    int32_t distx;
-+
-+	    tl = CONVERT_0565_TO_0888 (top_row [pixman_fixed_to_int (x_top)]) | top_mask;
-+	    bl = CONVERT_0565_TO_0888 (bottom_row [pixman_fixed_to_int (x_bottom)]) | bottom_mask;
-+
-+	    distx = (x >> 8) & 0xff;
-+
-+	    *buffer = bilinear_interpolation (tl, 0, bl, 0, distx, disty);
-+	}
-+
-+	buffer++;
-+	x += ux;
-+	x_top += ux_top;
-+	x_bottom += ux_bottom;
-+	mask += mask_inc;
-+    }
-+
-+    /* Zero fill to the left of the image */
-+    while (buffer < end)
-+	*buffer++ = 0;
-+}
-+
- static force_inline uint32_t
- bits_image_fetch_pixel_convolution (bits_image_t   *image,
- 				    pixman_fixed_t  x,
-@@ -917,14 +1123,26 @@ bits_image_property_changed (pixman_image_t *image)
- 	     (bits->common.filter == PIXMAN_FILTER_BILINEAR ||
- 	      bits->common.filter == PIXMAN_FILTER_GOOD	    ||
- 	      bits->common.filter == PIXMAN_FILTER_BEST)		&&
--	     bits->common.repeat == PIXMAN_REPEAT_NONE			&&
--	     (bits->format == PIXMAN_a8r8g8b8	||
--	      bits->format == PIXMAN_x8r8g8b8))
-+	     bits->common.repeat == PIXMAN_REPEAT_NONE)
-     {
- 	image->common.get_scanline_64 =
- 	    _pixman_image_get_scanline_generic_64;
--	image->common.get_scanline_32 =
--	    bits_image_fetch_bilinear_no_repeat_8888;
-+
-+	if (bits->format == PIXMAN_a8r8g8b8 || bits->format == PIXMAN_x8r8g8b8)
-+	{
-+	    image->common.get_scanline_32 =
-+		bits_image_fetch_bilinear_no_repeat_8888;
-+	}
-+	else if (bits->format == PIXMAN_r5g6b5)
-+	{
-+	    image->common.get_scanline_32 =
-+		bits_image_fetch_bilinear_no_repeat_0565;
-+	}
-+	else
-+	{
-+	    image->common.get_scanline_32 =
-+		bits_image_fetch_transformed;
-+	}
-     }
-     else
-     {
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman-0.18.0/missing-cache-preload.diff b/recipes/xorg-lib/pixman-0.18.0/missing-cache-preload.diff
deleted file mode 100644
index 475bb35..0000000
--- a/recipes/xorg-lib/pixman-0.18.0/missing-cache-preload.diff
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4f45c7688e6b767a5f7b7f5cced51b4797a3c288 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Fri, 21 May 2010 13:31:03 +0000
-Subject: ARM: added missing cache preload
-
----
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index 51bc347..a99555a 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -388,6 +388,7 @@ generate_composite_function \
-     vld1.16     {d4, d5}, [DST_R, :128]!
-     vst1.16     {d28, d29}, [DST_W, :128]!
-     pixman_composite_over_n_0565_process_pixblock_head
-+    cache_preload 8, 8
- .endm
- 
- .macro pixman_composite_over_n_0565_init
-@@ -660,6 +661,7 @@ generate_composite_function_single_scanline \
-     vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
-     vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
-     pixman_composite_over_8888_8888_process_pixblock_head
-+    cache_preload 8, 8
- .endm
- 
- .macro pixman_composite_over_n_8888_init
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman-0.9.5/dont-copy-unused-bits-to-alpha-channel.patch b/recipes/xorg-lib/pixman-0.9.5/dont-copy-unused-bits-to-alpha-channel.patch
deleted file mode 100644
index 05fe829..0000000
--- a/recipes/xorg-lib/pixman-0.9.5/dont-copy-unused-bits-to-alpha-channel.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From: Carl Worth <cworth@cworth.org>
-
-Don't copy unused bits to an alpha channel
-
-This bug was identified by cairo's rgb24-ignore-alpha test which
-blends RGB24 over ARGB32 and notices that "alpha" values are
-making it from the source to the destination.
-
-Index: a/pixman/pixman-pict.c
-===================================================================
---- a/pixman/pixman-pict.c b8b7b767b3ed1fc57ba177c38187e1eb3daf4de8
-+++ b/pixman/pixman-pict.c c7d73fc532c2da313041906ac0f48dba1b10d3bc
-@@ -1778,7 +1778,6 @@ pixman_image_composite (pixman_op_t     
- 		    break;
- 		case PIXMAN_x8r8g8b8:
- 		    switch (pDst->bits.format) {
--		    case PIXMAN_a8r8g8b8:
- 		    case PIXMAN_x8r8g8b8:
- #ifdef USE_MMX
- 			if (pixman_have_mmx())
-@@ -1790,7 +1789,6 @@ pixman_image_composite (pixman_op_t     
- 		    }
- 		case PIXMAN_x8b8g8r8:
- 		    switch (pDst->bits.format) {
--		    case PIXMAN_a8b8g8r8:
- 		    case PIXMAN_x8b8g8r8:
- #ifdef USE_MMX
- 			if (pixman_have_mmx())
-
diff --git a/recipes/xorg-lib/pixman/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/xorg-lib/pixman/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
deleted file mode 100644
index a2cda24..0000000
--- a/recipes/xorg-lib/pixman/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 8ea1a333de202018a862a7b04b94479d3109274b Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Tue, 16 Mar 2010 16:55:28 +0100
-Subject: [PATCH 1/5] Generic C implementation of pixman_blt with overlapping support
-
-Uses memcpy/memmove functions to copy pixels, can handle the
-case when both source and destination areas are in the same
-image (this is useful for scrolling).
-
-It is assumed that copying direction is only important when
-using the same image for both source and destination (and
-src_stride == dst_stride). Copying direction is undefined
-for the images with different source and destination stride
-which happen to be in the overlapped areas (but this is an
-unrealistic case anyway).
----
- pixman/pixman-general.c |   21 ++++++++++++++++++---
- pixman/pixman-private.h |   43 +++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 61 insertions(+), 3 deletions(-)
-
-diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
-index bddf79a..f525744 100644
---- a/pixman/pixman-general.c
-+++ b/pixman/pixman-general.c
-@@ -285,9 +285,24 @@ general_blt (pixman_implementation_t *imp,
-              int                      width,
-              int                      height)
- {
--    /* We can't blit unless we have sse2 or mmx */
--
--    return FALSE;
-+    uint8_t *dst_bytes = (uint8_t *)dst_bits;
-+    uint8_t *src_bytes = (uint8_t *)src_bits;
-+    int bpp;
-+
-+    if (src_bpp != dst_bpp || src_bpp & 7)
-+	return FALSE;
-+
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
-+                       dst_bytes + dst_y * dst_stride + dst_x * bpp,
-+                       src_stride,
-+                       dst_stride,
-+                       width,
-+                       height);
-+    return TRUE;
- }
- 
- static pixman_bool_t
-diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index d5767af..eeb677d 100644
---- a/pixman/pixman-private.h
-+++ b/pixman/pixman-private.h
-@@ -10,6 +10,7 @@
- 
- #include "pixman.h"
- #include <time.h>
-+#include <string.h>
- #include <assert.h>
- #include <stdio.h>
- #include <string.h>
-@@ -867,4 +868,46 @@ void pixman_timer_register (pixman_timer_t *timer);
- 
- #endif /* PIXMAN_TIMERS */
- 
-+/* a helper function, can blit 8-bit images with src/dst overlapping support */
-+static inline void
-+pixman_blt_helper (uint8_t *src_bytes,
-+                   uint8_t *dst_bytes,
-+                   int      src_stride,
-+                   int      dst_stride,
-+                   int      width,
-+                   int      height)
-+{
-+    /*
-+     * The second part of this check is not strictly needed, but it prevents
-+     * unnecessary upside-down processing of areas which belong to different
-+     * images. Upside-down processing can be slower with fixed-distance-ahead
-+     * prefetch and perceived as having more tearing.
-+     */
-+    if (src_bytes < dst_bytes + width &&
-+	src_bytes + src_stride * height > dst_bytes)
-+    {
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+	/* Horizontal scrolling to the left needs memmove */
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return;
-+	}
-+    }
-+    while (--height >= 0)
-+    {
-+	memcpy (dst_bytes, src_bytes, width);
-+	dst_bytes += dst_stride;
-+	src_bytes += src_stride;
-+    }
-+}
-+
- #endif /* PIXMAN_PRIVATE_H */
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/xorg-lib/pixman/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
deleted file mode 100644
index 003337f..0000000
--- a/recipes/xorg-lib/pixman/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 3170d9f5e927681a2516bcec52b317d1d4785e25 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:47 +0300
-Subject: [PATCH 2/5] Support of overlapping src/dst for pixman_blt_mmx
-
----
- pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
-index e084e7f..6212b31 100644
---- a/pixman/pixman-mmx.c
-+++ b/pixman/pixman-mmx.c
-@@ -2994,34 +2994,43 @@ pixman_blt_mmx (uint32_t *src_bits,
- {
-     uint8_t *   src_bytes;
-     uint8_t *   dst_bytes;
--    int byte_width;
-+    int         bpp;
- 
--    if (src_bpp != dst_bpp)
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
--    if (src_bpp == 16)
--    {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
--	src_bytes = (uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 2 * width;
--	src_stride *= 2;
--	dst_stride *= 2;
--    }
--    else if (src_bpp == 32)
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-     {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
--	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 4 * width;
--	src_stride *= 4;
--	dst_stride *= 4;
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-     }
--    else
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-     {
--	return FALSE;
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using MMX */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-     }
- 
-     while (height--)
-@@ -3031,7 +3040,7 @@ pixman_blt_mmx (uint32_t *src_bits,
- 	uint8_t *d = dst_bytes;
- 	src_bytes += src_stride;
- 	dst_bytes += dst_stride;
--	w = byte_width;
-+	w = width;
- 
- 	while (w >= 2 && ((unsigned long)d & 3))
- 	{
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/xorg-lib/pixman/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
deleted file mode 100644
index 7e8f34f..0000000
--- a/recipes/xorg-lib/pixman/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From f07cd58c643b490dcb1ef7be2642926cfeca1e69 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:54 +0300
-Subject: [PATCH 3/5] Support of overlapping src/dst for pixman_blt_sse2
-
----
- pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
-index 946e7ba..66053ae 100644
---- a/pixman/pixman-sse2.c
-+++ b/pixman/pixman-sse2.c
-@@ -5299,34 +5299,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
- {
-     uint8_t *   src_bytes;
-     uint8_t *   dst_bytes;
--    int byte_width;
-+    int         bpp;
- 
--    if (src_bpp != dst_bpp)
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
--    if (src_bpp == 16)
--    {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 2;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 2;
--	src_bytes =(uint8_t *)(((uint16_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint16_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 2 * width;
--	src_stride *= 2;
--	dst_stride *= 2;
--    }
--    else if (src_bpp == 32)
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-     {
--	src_stride = src_stride * (int) sizeof (uint32_t) / 4;
--	dst_stride = dst_stride * (int) sizeof (uint32_t) / 4;
--	src_bytes = (uint8_t *)(((uint32_t *)src_bits) + src_stride * (src_y) + (src_x));
--	dst_bytes = (uint8_t *)(((uint32_t *)dst_bits) + dst_stride * (dst_y) + (dst_x));
--	byte_width = 4 * width;
--	src_stride *= 4;
--	dst_stride *= 4;
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-     }
--    else
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-     {
--	return FALSE;
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using SSE2 */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-     }
- 
-     cache_prefetch ((__m128i*)src_bytes);
-@@ -5339,7 +5348,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
- 	uint8_t *d = dst_bytes;
- 	src_bytes += src_stride;
- 	dst_bytes += dst_stride;
--	w = byte_width;
-+	w = width;
- 
- 	cache_prefetch_next ((__m128i*)s);
- 	cache_prefetch_next ((__m128i*)d);
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/xorg-lib/pixman/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
deleted file mode 100644
index 0ba5b84..0000000
--- a/recipes/xorg-lib/pixman/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From e0542866c466ad512d69292df098d4b880e35e52 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Wed, 18 Nov 2009 06:08:48 +0200
-Subject: [PATCH 4/5] Support of overlapping src/dst for pixman_blt_neon
-
----
- pixman/pixman-arm-neon.c |   62 +++++++++++++++++++++++++++++++++++++--------
- 1 files changed, 51 insertions(+), 11 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 24ceeeb..134493d 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -360,26 +360,66 @@ pixman_blt_neon (uint32_t *src_bits,
-                  int       width,
-                  int       height)
- {
--    if (src_bpp != dst_bpp)
-+    uint8_t *   src_bytes;
-+    uint8_t *   dst_bytes;
-+    int         bpp;
-+
-+    if (src_bpp != dst_bpp || src_bpp & 7)
- 	return FALSE;
- 
-+    bpp = src_bpp >> 3;
-+    width *= bpp;
-+    src_stride *= 4;
-+    dst_stride *= 4;
-+    src_bytes = (uint8_t *)src_bits + src_y * src_stride + src_x * bpp;
-+    dst_bytes = (uint8_t *)dst_bits + dst_y * dst_stride + dst_x * bpp;
-+
-+    if (src_bpp != 16 && src_bpp != 32)
-+    {
-+	pixman_blt_helper (src_bytes, dst_bytes, src_stride, dst_stride,
-+	                   width, height);
-+	return TRUE;
-+    }
-+
-+    if (src_bytes < dst_bytes && src_bytes + src_stride * height > dst_bytes)
-+    {
-+	src_bytes += src_stride * height - src_stride;
-+	dst_bytes += dst_stride * height - dst_stride;
-+	dst_stride = -dst_stride;
-+	src_stride = -src_stride;
-+
-+	if (src_bytes + width > dst_bytes)
-+	{
-+	    /* TODO: reverse scanline copy using NEON */
-+	    while (--height >= 0)
-+	    {
-+		memmove (dst_bytes, src_bytes, width);
-+		dst_bytes += dst_stride;
-+		src_bytes += src_stride;
-+	    }
-+	    return TRUE;
-+	}
-+    }
-+
-     switch (src_bpp)
-     {
-     case 16:
- 	pixman_composite_src_0565_0565_asm_neon (
--		width, height,
--		(uint16_t *)(((char *) dst_bits) +
--		dst_y * dst_stride * 4 + dst_x * 2), dst_stride * 2,
--		(uint16_t *)(((char *) src_bits) +
--		src_y * src_stride * 4 + src_x * 2), src_stride * 2);
-+		width >> 1,
-+		height,
-+		(uint16_t *) dst_bytes,
-+		dst_stride >> 1,
-+		(uint16_t *) src_bytes,
-+		src_stride >> 1);
- 	return TRUE;
-     case 32:
- 	pixman_composite_src_8888_8888_asm_neon (
--		width, height,
--		(uint32_t *)(((char *) dst_bits) +
--		dst_y * dst_stride * 4 + dst_x * 4), dst_stride,
--		(uint32_t *)(((char *) src_bits) +
--		src_y * src_stride * 4 + src_x * 4), src_stride);
-+		width >> 2,
-+		height,
-+		(uint32_t *) dst_bytes,
-+		dst_stride >> 2,
-+		(uint32_t *) src_bytes,
-+		src_stride >> 2);
- 	return TRUE;
-     default:
- 	return FALSE;
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/recipes/xorg-lib/pixman/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
deleted file mode 100644
index 769ed2e..0000000
--- a/recipes/xorg-lib/pixman/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From d51b10a2750d99543a0c92ca44802aa7a4d70e54 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 10 Dec 2009 00:51:50 +0200
-Subject: [PATCH 5/5] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
-
----
- pixman/pixman-access.c       |   23 ++++++++++++++++++++++-
- pixman/pixman-arm-neon-asm.S |   20 ++++++++++++++++++++
- pixman/pixman-arm-neon.c     |   41 +++++++++++++++++++++++++++++++++++++++++
- pixman/pixman-private.h      |    5 +++++
- 4 files changed, 88 insertions(+), 1 deletions(-)
-
-diff --git a/pixman/pixman-access.c b/pixman/pixman-access.c
-index fa0a267..5bb3e09 100644
---- a/pixman/pixman-access.c
-+++ b/pixman/pixman-access.c
-@@ -2748,7 +2748,7 @@ typedef struct
- 	    store_scanline_ ## format, store_scanline_generic_64	\
-     }
- 
--static const format_info_t accessors[] =
-+static format_info_t accessors[] =
- {
- /* 32 bpp formats */
-     FORMAT_INFO (a8r8g8b8),
-@@ -2891,6 +2891,27 @@ _pixman_bits_image_setup_raw_accessors (bits_image_t *image)
- 	setup_accessors (image);
- }
- 
-+void
-+_pixman_bits_override_accessors (pixman_format_code_t format,
-+                                 fetch_scanline_t     fetch_func,
-+                                 store_scanline_t     store_func)
-+{
-+    format_info_t *info = accessors;
-+
-+    while (info->format != PIXMAN_null)
-+    {
-+	if (info->format == format)
-+	{
-+	    if (fetch_func)
-+		info->fetch_scanline_raw_32 = fetch_func;
-+	    if (store_func)
-+		info->store_scanline_raw_32 = store_func;
-+	    return;
-+	}
-+	info++;
-+    }
-+}
-+
- #else
- 
- void
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index eb8cc4c..6ab3301 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -454,6 +454,16 @@ generate_composite_function \
-     pixman_composite_src_8888_0565_process_pixblock_tail, \
-     pixman_composite_src_8888_0565_process_pixblock_tail_head
- 
-+generate_composite_function_single_scanline \
-+    pixman_store_scanline_r5g6b5_asm_neon, 32, 0, 16, \
-+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    default_init, \
-+    default_cleanup, \
-+    pixman_composite_src_8888_0565_process_pixblock_head, \
-+    pixman_composite_src_8888_0565_process_pixblock_tail, \
-+    pixman_composite_src_8888_0565_process_pixblock_tail_head
-+
- /******************************************************************************/
- 
- .macro pixman_composite_src_0565_8888_process_pixblock_head
-@@ -489,6 +499,16 @@ generate_composite_function \
-     pixman_composite_src_0565_8888_process_pixblock_tail, \
-     pixman_composite_src_0565_8888_process_pixblock_tail_head
- 
-+generate_composite_function_single_scanline \
-+    pixman_fetch_scanline_r5g6b5_asm_neon, 16, 0, 32, \
-+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    default_init, \
-+    default_cleanup, \
-+    pixman_composite_src_0565_8888_process_pixblock_head, \
-+    pixman_composite_src_0565_8888_process_pixblock_tail, \
-+    pixman_composite_src_0565_8888_process_pixblock_tail_head
-+
- /******************************************************************************/
- 
- .macro pixman_composite_add_8000_8000_process_pixblock_head
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 134493d..2245b52 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -567,6 +567,43 @@ neon_combine_##name##_u (pixman_implementation_t *imp,                   \
- BIND_COMBINE_U (over)
- BIND_COMBINE_U (add)
- 
-+void
-+pixman_fetch_scanline_r5g6b5_asm_neon (int             width,
-+                                       uint32_t       *buffer,
-+                                       const uint16_t *pixel);
-+void
-+pixman_store_scanline_r5g6b5_asm_neon (int             width,
-+                                       uint16_t       *pixel,
-+                                       const uint32_t *values);
-+
-+static void
-+neon_fetch_scanline_r5g6b5 (pixman_image_t *image,
-+                            int             x,
-+                            int             y,
-+                            int             width,
-+                            uint32_t *      buffer,
-+                            const uint32_t *mask,
-+                            uint32_t        mask_bits)
-+{
-+    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
-+    const uint16_t *pixel = (const uint16_t *)bits + x;
-+
-+    pixman_fetch_scanline_r5g6b5_asm_neon (width, buffer, pixel);
-+}
-+
-+static void
-+neon_store_scanline_r5g6b5 (bits_image_t *  image,
-+                            int             x,
-+                            int             y,
-+                            int             width,
-+                            const uint32_t *values)
-+{
-+    uint32_t *bits = image->bits + image->rowstride * y;
-+    uint16_t *pixel = ((uint16_t *) bits) + x;
-+
-+    pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
-+}
-+
- pixman_implementation_t *
- _pixman_implementation_create_arm_neon (void)
- {
-@@ -577,6 +614,10 @@ _pixman_implementation_create_arm_neon (void)
-     imp->combine_32[PIXMAN_OP_OVER] = neon_combine_over_u;
-     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
- 
-+    _pixman_bits_override_accessors (PIXMAN_r5g6b5,
-+                                     neon_fetch_scanline_r5g6b5,
-+                                     neon_store_scanline_r5g6b5);
-+
-     imp->blt = arm_neon_blt;
-     imp->fill = arm_neon_fill;
- 
-diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index eeb677d..ba2d401 100644
---- a/pixman/pixman-private.h
-+++ b/pixman/pixman-private.h
-@@ -220,6 +220,11 @@ void
- _pixman_bits_image_setup_raw_accessors (bits_image_t *image);
- 
- void
-+_pixman_bits_override_accessors (pixman_format_code_t format,
-+                                 fetch_scanline_t     fetch_func,
-+                                 store_scanline_t     store_func);
-+
-+void
- _pixman_image_get_scanline_generic_64  (pixman_image_t *image,
-                                         int             x,
-                                         int             y,
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman/0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch b/recipes/xorg-lib/pixman/0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch
deleted file mode 100644
index 3d8d4e8..0000000
--- a/recipes/xorg-lib/pixman/0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 7f0adaef68c5b0bb1c5eb9f5db5792b71b8b8beb Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 19 Mar 2010 10:44:09 +0100
-Subject: [PATCH 6/6] Revert "ARM: SIMD: Try without any CFLAGS before forcing -mcpu="
-
-This forces -marm that results in runtime SIGILL on thumb userspace
-
-This reverts commit 18f0de452dc7e12e4cb544d761a626d5c6031663.
----
- configure.ac |   20 +++++---------------
- 1 files changed, 5 insertions(+), 15 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fc3ee24..f84a4dc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -363,28 +363,18 @@ AM_CONDITIONAL(USE_VMX, test $have_vmx_intrinsics = yes)
- 
- dnl ===========================================================================
- dnl Check for ARM SIMD instructions
--ARM_SIMD_CFLAGS=""
-+ARM_SIMD_CFLAGS="-mcpu=arm1136j-s"
- 
- have_arm_simd=no
- AC_MSG_CHECKING(whether to use ARM SIMD assembler)
--# check with default CFLAGS in case the toolchain turns on a sufficiently recent -mcpu=
-+xserver_save_CFLAGS=$CFLAGS
-+CFLAGS="$ARM_SIMD_CFLAGS $CFLAGS"
- AC_COMPILE_IFELSE([
- int main () {
-     asm("uqadd8 r1, r1, r2");
-     return 0;
--}], have_arm_simd=yes,
--    # check again with an explicit -mcpu= in case the toolchain defaults to an
--    # older one; note that uqadd8 isn't available in Thumb mode on arm1136j-s
--    # so we force ARM mode
--    ARM_SIMD_CFLAGS="-mcpu=arm1136j-s -marm"
--    xserver_save_CFLAGS=$CFLAGS
--    CFLAGS="$ARM_SIMD_CFLAGS $CFLAGS"
--    AC_COMPILE_IFELSE([
--    int main () {
--        asm("uqadd8 r1, r1, r2");
--        return 0;
--    }], have_arm_simd=yes)
--    CFLAGS=$xserver_save_CFLAGS)
-+}], have_arm_simd=yes)
-+CFLAGS=$xserver_save_CFLAGS
- 
- AC_ARG_ENABLE(arm-simd,
-    [AC_HELP_STRING([--disable-arm-simd],
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman/calloc.patch b/recipes/xorg-lib/pixman/calloc.patch
deleted file mode 100644
index 4a60d7e..0000000
--- a/recipes/xorg-lib/pixman/calloc.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 634ba33b5b1fcfd5a0e7910f9991b4ed4f674549 Mon Sep 17 00:00:00 2001
-From: Søren Sandmann Pedersen <ssp@redhat.com>
-Date: Wed, 07 Apr 2010 05:39:14 +0000
-Subject: Fix uninitialized cache when pthreads are used
-
-The thread local cache is allocated with malloc(), but we rely on it
-being initialized to zero, so allocate it with calloc() instead.
----
-diff --git a/pixman/pixman-compiler.h b/pixman/pixman-compiler.h
-index a4e3f88..cdac0d8 100644
---- a/pixman/pixman-compiler.h
-+++ b/pixman/pixman-compiler.h
-@@ -101,7 +101,7 @@
-     static type *							\
-     tls_ ## name ## _alloc (key)					\
-     {									\
--	type *value = malloc (sizeof (type));				\
-+	type *value = calloc (1, sizeof (type));			\
- 	if (value)							\
- 	    pthread_setspecific (key, value);				\
- 	return value;							\
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman/nearest-neighbour.patch b/recipes/xorg-lib/pixman/nearest-neighbour.patch
deleted file mode 100644
index 29b140f..0000000
--- a/recipes/xorg-lib/pixman/nearest-neighbour.patch
+++ /dev/null
@@ -1,1040 +0,0 @@
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Fri, 17 Jul 2009 10:22:23 +0000 (+0300)
-Subject: Fastpath for nearest neighbour scaled compositing operations.
-X-Git-Url: http://siarhei.siamashka.name/gitweb/?p=pixman.git;a=commitdiff_plain;h=247531c6978725a88fd3706129b9d3e339026f54
-
-Fastpath for nearest neighbour scaled compositing operations.
-
-OVER 8888x8888, OVER 8888x0565, SRC 8888x8888, SRC 8888x0565
-and SRC 0565x0565 cases are supported.
----
-
-diff --git a/pixman/pixman-fast-path.c b/pixman/pixman-fast-path.c
-index 7f80578..7f3a6ad 100644
---- a/pixman/pixman-fast-path.c
-+++ b/pixman/pixman-fast-path.c
-@@ -1261,6 +1261,993 @@ fast_composite_src_scale_nearest (pixman_implementation_t *imp,
-     }
- }
- 
-+/*
-+ * Functions, which implement the core inner loops for the nearest neighbour
-+ * scaled fastpath compositing operations. The do not need to do clipping
-+ * checks, also the loops are unrolled to process two pixels per iteration
-+ * for better performance on most CPU architectures (superscalar processors
-+ * can issue several operations simultaneously, other processors can hide
-+ * instructions latencies by pipelining operations). Unrolling more
-+ * does not make much sense because the compiler will start running out
-+ * of spare registers soon.
-+ */
-+
-+#undef READ
-+#undef WRITE
-+#define READ(img,x) (*(x))
-+#define WRITE(img,ptr,v) ((*(ptr)) = (v))
-+
-+#define UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(x, a, y) do {                     \
-+        UN8x4_MUL_UN8_ADD_UN8x4(x, a, y);                                      \
-+        x = CONVERT_8888_TO_0565(x);                                       \
-+    } while (0)
-+
-+static void fbCompositeTransformNearestNonrotatedAffineTrivialclipOver_8888x0565 (
-+    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
-+    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
-+{
-+    uint16_t *dstLine;
-+    uint32_t *srcFirstLine;
-+    uint32_t  d;
-+    uint32_t  s1, s2;
-+    uint8_t   a1, a2;
-+    int       w;
-+    int       x1, x2, y;
-+    int32_t   orig_vx = vx;
-+
-+    uint32_t *src;
-+    uint16_t *dst;
-+    int       srcStride, dstStride;
-+    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
-+    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
-+     * transformed from destination space to source space */
-+    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
-+
-+    while (--height >= 0)
-+    {
-+        dst = dstLine;
-+        dstLine += dstStride;
-+
-+        y = vy >> 16;
-+        vy += unit_y;
-+
-+        if ((y < 0) || (y >= pSrc->bits.height)) {
-+            continue;
-+        }
-+
-+        src = srcFirstLine + srcStride * y;
-+
-+        w = width;
-+        vx = orig_vx;
-+        while ((w -= 2) >= 0)
-+        {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            s1 = READ(pSrc, src + x1);
-+
-+            x2 = vx >> 16;
-+            vx += unit_x;
-+            s2 = READ(pSrc, src + x2);
-+
-+            a1 = s1 >> 24;
-+            a2 = s2 >> 24;
-+
-+            if (a1 == 0xff)
-+                WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
-+            else if (s1) {
-+                d = CONVERT_0565_TO_0888(READ(pDst, dst));
-+                a1 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a1, s1);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+
-+            if (a2 == 0xff)
-+                WRITE(pDst, dst, CONVERT_8888_TO_0565(s2));
-+            else if (s2) {
-+                d = CONVERT_0565_TO_0888(READ(pDst, dst));
-+                a2 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a2, s2);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+        }
-+        if (w & 1) {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            s1 = READ(pSrc, src + x1);
-+
-+            a1 = s1 >> 24;
-+            if (a1 == 0xff)
-+                WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
-+            else if (s1) {
-+                d = CONVERT_0565_TO_0888(READ(pDst, dst));
-+                a1 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a1, s1);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+        }
-+    }
-+}
-+
-+static void fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatOver_8888x0565 (
-+    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
-+    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
-+{
-+    uint16_t *dstLine;
-+    uint32_t *srcFirstLine;
-+    uint32_t  d;
-+    uint32_t  s1, s2;
-+    uint8_t   a1, a2;
-+    int       w;
-+    int       x1, x2, y;
-+    int32_t   orig_vx = vx;
-+    int32_t   max_vx, max_vy;
-+
-+    uint32_t *src;
-+    uint16_t *dst;
-+    int       srcStride, dstStride;
-+    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
-+    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
-+     * transformed from destination space to source space */
-+    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
-+
-+    max_vx = pSrc->bits.width << 16;
-+    max_vy = pSrc->bits.height << 16;
-+
-+    while (orig_vx < 0) orig_vx += max_vx;
-+    while (vy < 0) vy += max_vy;
-+    while (orig_vx >= max_vx) orig_vx -= max_vx;
-+    while (vy >= max_vy) vy -= max_vy;
-+
-+    while (--height >= 0)
-+    {
-+        dst = dstLine;
-+        dstLine += dstStride;
-+
-+        y = vy >> 16;
-+        vy += unit_y;
-+        while (vy >= max_vy) vy -= max_vy;
-+
-+        src = srcFirstLine + srcStride * y;
-+
-+        w = width;
-+        vx = orig_vx;
-+        while ((w -= 2) >= 0)
-+        {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s1 = READ(pSrc, src + x1);
-+
-+            x2 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s2 = READ(pSrc, src + x2);
-+
-+            a1 = s1 >> 24;
-+            a2 = s2 >> 24;
-+
-+            if (a1 == 0xff)
-+                WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
-+            else if (s1) {
-+                d = CONVERT_0565_TO_0888(READ(pDst, dst));
-+                a1 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a1, s1);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+
-+            if (a2 == 0xff)
-+                WRITE(pDst, dst, CONVERT_8888_TO_0565(s2));
-+            else if (s2) {
-+                d = CONVERT_0565_TO_0888(READ(pDst, dst));
-+                a2 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a2, s2);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+        }
-+        if (w & 1) {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s1 = READ(pSrc, src + x1);
-+
-+            a1 = s1 >> 24;
-+            if (a1 == 0xff)
-+                WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
-+            else if (s1) {
-+                d = CONVERT_0565_TO_0888(READ(pDst, dst));
-+                a1 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4_store_r5g6b5(d, a1, s1);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+        }
-+    }
-+}
-+
-+static void fbCompositeTransformNearestNonrotatedAffineTrivialclipOver_8888x8888 (
-+    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
-+    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
-+{
-+    uint32_t *dstLine;
-+    uint32_t *srcFirstLine;
-+    uint32_t  d;
-+    uint32_t  s1, s2;
-+    uint8_t   a1, a2;
-+    int       w;
-+    int       x1, x2, y;
-+    int32_t   orig_vx = vx;
-+
-+    uint32_t *src, *dst;
-+    int       srcStride, dstStride;
-+    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
-+    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
-+     * transformed from destination space to source space */
-+    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
-+
-+    while (--height >= 0)
-+    {
-+        dst = dstLine;
-+        dstLine += dstStride;
-+
-+        y = vy >> 16;
-+        vy += unit_y;
-+
-+        if ((y < 0) || (y >= pSrc->bits.height)) {
-+            continue;
-+        }
-+
-+        src = srcFirstLine + srcStride * y;
-+
-+        w = width;
-+        vx = orig_vx;
-+        while ((w -= 2) >= 0)
-+        {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            s1 = READ(pSrc, src + x1);
-+
-+            x2 = vx >> 16;
-+            vx += unit_x;
-+            s2 = READ(pSrc, src + x2);
-+
-+            a1 = s1 >> 24;
-+            a2 = s2 >> 24;
-+
-+            if (a1 == 0xff)
-+                WRITE(pDst, dst, s1);
-+            else if (s1) {
-+                d = READ(pDst, dst);
-+                a1 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4(d, a1, s1);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+
-+            if (a2 == 0xff)
-+                WRITE(pDst, dst, s2);
-+            else if (s2) {
-+                d = READ(pDst, dst);
-+                a2 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4(d, a2, s2);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+        }
-+        if (w & 1) {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            s1 = READ(pSrc, src + x1);
-+
-+            a1 = s1 >> 24;
-+            if (a1 == 0xff)
-+                WRITE(pDst, dst, s1);
-+            else if (s1) {
-+                d = READ(pDst, dst);
-+                a1 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4(d, a1, s1);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+        }
-+    }
-+}
-+
-+static void fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatOver_8888x8888 (
-+    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
-+    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
-+{
-+    uint32_t *dstLine;
-+    uint32_t *srcFirstLine;
-+    uint32_t  d;
-+    uint32_t  s1, s2;
-+    uint8_t   a1, a2;
-+    int       w;
-+    int       x1, x2, y;
-+    int32_t   orig_vx = vx;
-+    int32_t   max_vx, max_vy;
-+
-+    uint32_t *src, *dst;
-+    int       srcStride, dstStride;
-+    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
-+    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
-+     * transformed from destination space to source space */
-+    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
-+
-+    max_vx = pSrc->bits.width << 16;
-+    max_vy = pSrc->bits.height << 16;
-+
-+    while (orig_vx < 0) orig_vx += max_vx;
-+    while (vy < 0) vy += max_vy;
-+    while (orig_vx >= max_vx) orig_vx -= max_vx;
-+    while (vy >= max_vy) vy -= max_vy;
-+
-+    while (--height >= 0)
-+    {
-+        dst = dstLine;
-+        dstLine += dstStride;
-+
-+        y = vy >> 16;
-+        vy += unit_y;
-+        while (vy >= max_vy) vy -= max_vy;
-+
-+        src = srcFirstLine + srcStride * y;
-+
-+        w = width;
-+        vx = orig_vx;
-+        while ((w -= 2) >= 0)
-+        {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s1 = READ(pSrc, src + x1);
-+
-+            x2 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s2 = READ(pSrc, src + x2);
-+
-+            a1 = s1 >> 24;
-+            a2 = s2 >> 24;
-+
-+            if (a1 == 0xff)
-+                WRITE(pDst, dst, s1);
-+            else if (s1) {
-+                d = READ(pDst, dst);
-+                a1 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4(d, a1, s1);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+
-+            if (a2 == 0xff)
-+                WRITE(pDst, dst, s2);
-+            else if (s2) {
-+                d = READ(pDst, dst);
-+                a2 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4(d, a2, s2);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+        }
-+        if (w & 1) {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s1 = READ(pSrc, src + x1);
-+
-+            a1 = s1 >> 24;
-+            if (a1 == 0xff)
-+                WRITE(pDst, dst, s1);
-+            else if (s1) {
-+                d = READ(pDst, dst);
-+                a1 ^= 0xff;
-+                UN8x4_MUL_UN8_ADD_UN8x4(d, a1, s1);
-+                WRITE(pDst, dst, d);
-+            }
-+            dst++;
-+        }
-+    }
-+}
-+
-+static void fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_8888x8888 (
-+    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
-+    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
-+{
-+    uint32_t *dstLine;
-+    uint32_t *srcFirstLine;
-+    uint32_t  s1, s2;
-+    int       w;
-+    int       x1, x2, y;
-+    int32_t   orig_vx = vx;
-+
-+    uint32_t *src, *dst;
-+    int       srcStride, dstStride;
-+    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
-+    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
-+     * transformed from destination space to source space */
-+    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
-+
-+    while (--height >= 0)
-+    {
-+        dst = dstLine;
-+        dstLine += dstStride;
-+
-+        y = vy >> 16;
-+        vy += unit_y;
-+
-+        if ((y < 0) || (y >= pSrc->bits.height)) {
-+            memset(dst, 0, width * sizeof(*dst));
-+            continue;
-+        }
-+
-+        src = srcFirstLine + srcStride * y;
-+
-+        w = width;
-+        vx = orig_vx;
-+        while ((w -= 2) >= 0)
-+        {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            s1 = READ(pSrc, src + x1);
-+
-+            x2 = vx >> 16;
-+            vx += unit_x;
-+            s2 = READ(pSrc, src + x2);
-+
-+            WRITE(pDst, dst, s1);
-+            dst++;
-+            WRITE(pDst, dst, s2);
-+            dst++;
-+        }
-+        if (w & 1) {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            s1 = READ(pSrc, src + x1);
-+            WRITE(pDst, dst, s1);
-+            dst++;
-+        }
-+    }
-+}
-+
-+static void fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_8888x8888 (
-+    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
-+    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
-+{
-+    uint32_t *dstLine;
-+    uint32_t *srcFirstLine;
-+    uint32_t  s1, s2;
-+    int       w;
-+    int       x1, x2, y;
-+    int32_t   orig_vx = vx;
-+    int32_t   max_vx, max_vy;
-+
-+    uint32_t *src, *dst;
-+    int       srcStride, dstStride;
-+    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
-+    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
-+     * transformed from destination space to source space */
-+    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
-+
-+    max_vx = pSrc->bits.width << 16;
-+    max_vy = pSrc->bits.height << 16;
-+
-+    while (orig_vx < 0) orig_vx += max_vx;
-+    while (vy < 0) vy += max_vy;
-+    while (orig_vx >= max_vx) orig_vx -= max_vx;
-+    while (vy >= max_vy) vy -= max_vy;
-+
-+    while (--height >= 0)
-+    {
-+        dst = dstLine;
-+        dstLine += dstStride;
-+
-+        y = vy >> 16;
-+        vy += unit_y;
-+        while (vy >= max_vy) vy -= max_vy;
-+
-+        src = srcFirstLine + srcStride * y;
-+
-+        w = width;
-+        vx = orig_vx;
-+        while ((w -= 2) >= 0)
-+        {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s1 = READ(pSrc, src + x1);
-+
-+            x2 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s2 = READ(pSrc, src + x2);
-+
-+            WRITE(pDst, dst, s1);
-+            dst++;
-+            WRITE(pDst, dst, s2);
-+            dst++;
-+        }
-+        if (w & 1) {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s1 = READ(pSrc, src + x1);
-+
-+            WRITE(pDst, dst, s1);
-+            dst++;
-+        }
-+    }
-+}
-+
-+static void fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_0565x0565 (
-+    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
-+    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
-+{
-+    uint16_t *dstLine;
-+    uint16_t *srcFirstLine;
-+    uint16_t  s1, s2;
-+    int       w;
-+    int       x1, x2, y;
-+    int32_t   orig_vx = vx;
-+
-+    uint16_t *src, *dst;
-+    int       srcStride, dstStride;
-+    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
-+    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
-+     * transformed from destination space to source space */
-+    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint16_t, srcStride, srcFirstLine, 1);
-+
-+    while (--height >= 0)
-+    {
-+        dst = dstLine;
-+        dstLine += dstStride;
-+
-+        y = vy >> 16;
-+        vy += unit_y;
-+
-+        if ((y < 0) || (y >= pSrc->bits.height)) {
-+            memset(dst, 0, width * sizeof(*dst));
-+            continue;
-+        }
-+
-+        src = srcFirstLine + srcStride * y;
-+
-+        w = width;
-+        vx = orig_vx;
-+        while ((w -= 2) >= 0)
-+        {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            s1 = READ(pSrc, src + x1);
-+
-+            x2 = vx >> 16;
-+            vx += unit_x;
-+            s2 = READ(pSrc, src + x2);
-+
-+            WRITE(pDst, dst, s1);
-+            dst++;
-+            WRITE(pDst, dst, s2);
-+            dst++;
-+        }
-+        if (w & 1) {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            s1 = READ(pSrc, src + x1);
-+            WRITE(pDst, dst, s1);
-+            dst++;
-+        }
-+    }
-+}
-+
-+static void fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_0565x0565 (
-+    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
-+    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
-+{
-+    uint16_t *dstLine;
-+    uint16_t *srcFirstLine;
-+    uint16_t  s1, s2;
-+    int       w;
-+    int       x1, x2, y;
-+    int32_t   orig_vx = vx;
-+    int32_t   max_vx, max_vy;
-+
-+    uint16_t *src, *dst;
-+    int       srcStride, dstStride;
-+    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
-+    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
-+     * transformed from destination space to source space */
-+    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint16_t, srcStride, srcFirstLine, 1);
-+
-+    max_vx = pSrc->bits.width << 16;
-+    max_vy = pSrc->bits.height << 16;
-+
-+    while (orig_vx < 0) orig_vx += max_vx;
-+    while (vy < 0) vy += max_vy;
-+    while (orig_vx >= max_vx) orig_vx -= max_vx;
-+    while (vy >= max_vy) vy -= max_vy;
-+
-+    while (--height >= 0)
-+    {
-+        dst = dstLine;
-+        dstLine += dstStride;
-+
-+        y = vy >> 16;
-+        vy += unit_y;
-+        while (vy >= max_vy) vy -= max_vy;
-+
-+        src = srcFirstLine + srcStride * y;
-+
-+        w = width;
-+        vx = orig_vx;
-+        while ((w -= 2) >= 0)
-+        {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s1 = READ(pSrc, src + x1);
-+
-+            x2 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s2 = READ(pSrc, src + x2);
-+
-+            WRITE(pDst, dst, s1);
-+            dst++;
-+            WRITE(pDst, dst, s2);
-+            dst++;
-+        }
-+        if (w & 1) {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s1 = READ(pSrc, src + x1);
-+
-+            WRITE(pDst, dst, s1);
-+            dst++;
-+        }
-+    }
-+}
-+
-+static void fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_8888x0565 (
-+    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
-+    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
-+{
-+    uint16_t *dstLine;
-+    uint32_t *srcFirstLine;
-+    uint32_t  s1, s2;
-+    int       w;
-+    int       x1, x2, y;
-+    int32_t   orig_vx = vx;
-+
-+    uint32_t *src;
-+    uint16_t *dst;
-+    int       srcStride, dstStride;
-+    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
-+    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
-+     * transformed from destination space to source space */
-+    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
-+
-+    while (--height >= 0)
-+    {
-+        dst = dstLine;
-+        dstLine += dstStride;
-+
-+        y = vy >> 16;
-+        vy += unit_y;
-+
-+        if ((y < 0) || (y >= pSrc->bits.height)) {
-+            memset(dst, 0, width * sizeof(*dst));
-+            continue;
-+        }
-+
-+        src = srcFirstLine + srcStride * y;
-+
-+        w = width;
-+        vx = orig_vx;
-+        while ((w -= 2) >= 0)
-+        {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            s1 = READ(pSrc, src + x1);
-+
-+            x2 = vx >> 16;
-+            vx += unit_x;
-+            s2 = READ(pSrc, src + x2);
-+
-+            WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
-+            dst++;
-+            WRITE(pDst, dst, CONVERT_8888_TO_0565(s2));
-+            dst++;
-+        }
-+        if (w & 1) {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            s1 = READ(pSrc, src + x1);
-+            WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
-+            dst++;
-+        }
-+    }
-+}
-+
-+static void fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_8888x0565 (
-+    pixman_image_t *pSrc, pixman_image_t *pDst, int xSrc, int ySrc, int xDst, int yDst,
-+    int width, int height, int32_t vx, int32_t vy, int32_t unit_x, int32_t unit_y)
-+{
-+    uint16_t *dstLine;
-+    uint32_t *srcFirstLine;
-+    uint32_t  s1, s2;
-+    int       w;
-+    int       x1, x2, y;
-+    int32_t   orig_vx = vx;
-+    int32_t   max_vx, max_vy;
-+
-+    uint32_t *src;
-+    uint16_t *dst;
-+    int       srcStride, dstStride;
-+    PIXMAN_IMAGE_GET_LINE (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
-+    /* pass in 0 instead of xSrc and ySrc because xSrc and ySrc need to be
-+     * transformed from destination space to source space */
-+    PIXMAN_IMAGE_GET_LINE (pSrc, 0, 0, uint32_t, srcStride, srcFirstLine, 1);
-+
-+    max_vx = pSrc->bits.width << 16;
-+    max_vy = pSrc->bits.height << 16;
-+
-+    while (orig_vx < 0) orig_vx += max_vx;
-+    while (vy < 0) vy += max_vy;
-+    while (orig_vx >= max_vx) orig_vx -= max_vx;
-+    while (vy >= max_vy) vy -= max_vy;
-+
-+    while (--height >= 0)
-+    {
-+        dst = dstLine;
-+        dstLine += dstStride;
-+
-+        y = vy >> 16;
-+        vy += unit_y;
-+        while (vy >= max_vy) vy -= max_vy;
-+
-+        src = srcFirstLine + srcStride * y;
-+
-+        w = width;
-+        vx = orig_vx;
-+        while ((w -= 2) >= 0)
-+        {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s1 = READ(pSrc, src + x1);
-+
-+            x2 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s2 = READ(pSrc, src + x2);
-+
-+            WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
-+            dst++;
-+            WRITE(pDst, dst, CONVERT_8888_TO_0565(s2));
-+            dst++;
-+        }
-+        if (w & 1) {
-+            x1 = vx >> 16;
-+            vx += unit_x;
-+            while (vx >= max_vx) vx -= max_vx;
-+            s1 = READ(pSrc, src + x1);
-+
-+            WRITE(pDst, dst, CONVERT_8888_TO_0565(s1));
-+            dst++;
-+        }
-+    }
-+}
-+
-+/*
-+ * Check if the clipping boundary is crossed on horizontal scaling
-+ */
-+static inline pixman_bool_t
-+fbTransformVerifyHorizontalClipping(pixman_image_t *pict, int width, int32_t vx, int32_t unit_x)
-+{
-+    while (--width >= 0) {
-+        int x = vx >> 16;
-+        if ((x < 0) || (x >= pict->bits.width)) return 1;
-+        vx += unit_x;
-+    }
-+    return 0;
-+}
-+
-+/*
-+ * Check if the clipping boundary is crossed on vertical scaling
-+ */
-+static inline pixman_bool_t
-+fbTransformVerifyVerticalClipping(pixman_image_t *pict, int height, int32_t vy, int32_t unit_y)
-+{
-+    while (--height >= 0) {
-+        int y = vy >> 16;
-+        if ((y < 0) || (y >= pict->bits.height)) return 1;
-+        vy += unit_y;
-+    }
-+    return 0;
-+}
-+
-+/*
-+ * Easy case of transform without rotation or complex clipping
-+ * Returns 1 in the case if it was able to handle this operation and 0 otherwise
-+ */
-+static pixman_bool_t
-+fbCompositeTransformNonrotatedAffineTrivialclip (
-+			    pixman_op_t     op,
-+			    pixman_image_t *pSrc,
-+			    pixman_image_t *pMask,
-+			    pixman_image_t *pDst,
-+			    int16_t         xSrc,
-+			    int16_t         ySrc,
-+			    int16_t         xMask,
-+			    int16_t         yMask,
-+			    int16_t         xDst,
-+			    int16_t         yDst,
-+			    uint16_t        width,
-+			    uint16_t        height)
-+{
-+    pixman_vector_t v, unit;
-+    int skipdst_x = 0, skipdst_y = 0;
-+
-+    /* Handle destination clipping */
-+    if (xDst < pDst->common.clip_region.extents.x1) {
-+        skipdst_x = pDst->common.clip_region.extents.x1 - xDst;
-+        if (skipdst_x >= (int)width)
-+            return 1;
-+        xDst = pDst->common.clip_region.extents.x1;
-+        width -= skipdst_x;
-+    }
-+
-+    if (yDst < pDst->common.clip_region.extents.y1) {
-+        skipdst_y = pDst->common.clip_region.extents.y1 - yDst;
-+        if (skipdst_y >= (int)height)
-+            return 1;
-+        yDst = pDst->common.clip_region.extents.y1;
-+        height -= skipdst_y;
-+    }
-+
-+    if (xDst >= pDst->common.clip_region.extents.x2 ||
-+        yDst >= pDst->common.clip_region.extents.y2)
-+    {
-+        return 1;
-+    }
-+
-+    if (xDst + width > pDst->common.clip_region.extents.x2)
-+        width = pDst->common.clip_region.extents.x2 - xDst;
-+    if (yDst + height > pDst->common.clip_region.extents.y2)
-+        height = pDst->common.clip_region.extents.y2 - yDst;
-+
-+    /* reference point is the center of the pixel */
-+    v.vector[0] = pixman_int_to_fixed(xSrc) + pixman_fixed_1 / 2;
-+    v.vector[1] = pixman_int_to_fixed(ySrc) + pixman_fixed_1 / 2;
-+    v.vector[2] = pixman_fixed_1;
-+
-+    if (!pixman_transform_point_3d (pSrc->common.transform, &v))
-+        return 0;
-+
-+    /* Round down to closest integer, ensuring that 0.5 rounds to 0, not 1 */
-+    v.vector[0] -= pixman_fixed_e;
-+    v.vector[1] -= pixman_fixed_e;
-+
-+    unit.vector[0] = pSrc->common.transform->matrix[0][0];
-+    unit.vector[1] = pSrc->common.transform->matrix[1][1];
-+
-+    v.vector[0] += unit.vector[0] * skipdst_x;
-+    v.vector[1] += unit.vector[1] * skipdst_y;
-+
-+    /* Check for possible fixed point arithmetics problems/overflows */
-+    if (unit.vector[0] <= 0 || unit.vector[1] <= 0)
-+        return 0;
-+    if (width == 0 || height == 0)
-+        return 0;
-+    if ((uint32_t)width + (unit.vector[0] >> 16) >= 0x7FFF)
-+        return 0;
-+    if ((uint32_t)height + (unit.vector[1] >> 16) >= 0x7FFF)
-+        return 0;
-+
-+    /* Horizontal source clipping is only supported for NORMAL repeat */
-+    if (pSrc->common.repeat != PIXMAN_REPEAT_NORMAL
-+        && fbTransformVerifyHorizontalClipping(pSrc, width, v.vector[0], unit.vector[0])) {
-+        return 0;
-+    }
-+
-+    /* Vertical source clipping is only supported for NONE and NORMAL repeat */
-+    if (pSrc->common.repeat != PIXMAN_REPEAT_NONE && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL
-+        && fbTransformVerifyVerticalClipping(pSrc, height, v.vector[1], unit.vector[1])) {
-+        return 0;
-+    }
-+
-+    if (op == PIXMAN_OP_OVER && pSrc->bits.format == PIXMAN_a8r8g8b8
-+            && (pDst->bits.format == PIXMAN_x8r8g8b8 || pDst->bits.format == PIXMAN_a8r8g8b8))
-+    {
-+        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL) {
-+            fbCompositeTransformNearestNonrotatedAffineTrivialclipOver_8888x8888(
-+                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
-+                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
-+            return 1;
-+        }
-+        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat == PIXMAN_REPEAT_NORMAL) {
-+            fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatOver_8888x8888(
-+                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
-+                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
-+            return 1;
-+        }
-+    }
-+
-+    if (op == PIXMAN_OP_SRC && (pSrc->bits.format == PIXMAN_x8r8g8b8 || pSrc->bits.format == PIXMAN_a8r8g8b8)
-+            && (pDst->bits.format == PIXMAN_x8r8g8b8 || pDst->bits.format == pSrc->bits.format))
-+    {
-+        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL) {
-+            fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_8888x8888(
-+                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
-+                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
-+            return 1;
-+        }
-+        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat == PIXMAN_REPEAT_NORMAL) {
-+            fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_8888x8888(
-+                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
-+                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
-+            return 1;
-+        }
-+    }
-+
-+    if (op == PIXMAN_OP_OVER && pSrc->bits.format == PIXMAN_a8r8g8b8 && pDst->bits.format == PIXMAN_r5g6b5)
-+    {
-+        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL) {
-+            fbCompositeTransformNearestNonrotatedAffineTrivialclipOver_8888x0565(
-+                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
-+                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
-+            return 1;
-+        }
-+        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat == PIXMAN_REPEAT_NORMAL) {
-+            fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatOver_8888x0565(
-+                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
-+                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
-+            return 1;
-+        }
-+    }
-+
-+    if (op == PIXMAN_OP_SRC && pSrc->bits.format == PIXMAN_r5g6b5 && pDst->bits.format == PIXMAN_r5g6b5)
-+    {
-+        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL) {
-+            fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_0565x0565(
-+                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
-+                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
-+            return 1;
-+        }
-+        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat == PIXMAN_REPEAT_NORMAL) {
-+            fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_0565x0565(
-+                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
-+                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
-+            return 1;
-+        }
-+    }
-+
-+    if (op == PIXMAN_OP_SRC && (pSrc->bits.format == PIXMAN_x8r8g8b8 || pSrc->bits.format == PIXMAN_a8r8g8b8)
-+        && pDst->bits.format == PIXMAN_r5g6b5)
-+    {
-+        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat != PIXMAN_REPEAT_NORMAL) {
-+            fbCompositeTransformNearestNonrotatedAffineTrivialclipSrc_8888x0565(
-+                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
-+                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
-+            return 1;
-+        }
-+        if (pSrc->common.filter == PIXMAN_FILTER_NEAREST && pSrc->common.repeat == PIXMAN_REPEAT_NORMAL) {
-+            fbCompositeTransformNearestNonrotatedAffineTrivialclipRepeatSrc_8888x0565(
-+                pSrc, pDst, xSrc, ySrc, xDst, yDst, width, height,
-+                v.vector[0], v.vector[1], unit.vector[0], unit.vector[1]);
-+            return 1;
-+        }
-+    }
-+
-+    /* No fastpath scaling implemented for this case */
-+    return 0;
-+}
-+
- static void
- fast_path_composite (pixman_implementation_t *imp,
-                      pixman_op_t              op,
-@@ -1279,6 +2266,30 @@ fast_path_composite (pixman_implementation_t *imp,
-     if (src->type == BITS
-         && src->common.transform
-         && !mask
-+        && !src->common.alpha_map && !dest->common.alpha_map
-+        && (src->common.filter == PIXMAN_FILTER_NEAREST)
-+        && !src->bits.read_func && !src->bits.write_func
-+        && !dest->bits.read_func && !dest->bits.write_func)
-+    {
-+        /* ensure that the transform matrix only has a scale */
-+        if (src->common.transform->matrix[0][1] == 0 &&
-+            src->common.transform->matrix[1][0] == 0 &&
-+            src->common.transform->matrix[2][0] == 0 &&
-+            src->common.transform->matrix[2][1] == 0 &&
-+            src->common.transform->matrix[2][2] == pixman_fixed_1 &&
-+            dest->common.clip_region.data == NULL)
-+        {
-+            if (fbCompositeTransformNonrotatedAffineTrivialclip (op, src, mask, dest,
-+                    src_x, src_y, mask_x, mask_y, dest_x, dest_y, width, height))
-+            {
-+                return;
-+            }
-+        }
-+    }
-+
-+    if (src->type == BITS
-+        && src->common.transform
-+        && !mask
-         && op == PIXMAN_OP_SRC
-         && !src->common.alpha_map && !dest->common.alpha_map
-         && (src->common.filter == PIXMAN_FILTER_NEAREST)
diff --git a/recipes/xorg-lib/pixman/over-n-8-0565.patch b/recipes/xorg-lib/pixman/over-n-8-0565.patch
deleted file mode 100644
index 3911068..0000000
--- a/recipes/xorg-lib/pixman/over-n-8-0565.patch
+++ /dev/null
@@ -1,231 +0,0 @@
-From de2221a32d0b6628116565563f7b4ccd0a44e8b6 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 04 Mar 2010 23:20:25 +0000
-Subject: ARM: added 'armv6_composite_over_n_8_0565' fast path
-
-Provides ~3x performance improvement when working with
-data in L1 cache and memory. This fast path is important
-for fonts rendering when using 16bpp desktop.
-
-Microbenchmark from N800 (ARM11 @ 400MHz), measured in MPix/s:
-
-before:
-
- over_n_8_0565 = L1:   2.99 M:  2.86
-
-after:
-
- over_n_8_0565 = L1:   9.07 M:  8.05
----
-diff --git a/pixman/pixman-arm-simd.c b/pixman/pixman-arm-simd.c
-index 09a2888..c375c01 100644
---- a/pixman/pixman-arm-simd.c
-+++ b/pixman/pixman-arm-simd.c
-@@ -419,6 +419,193 @@ arm_composite_over_n_8_8888 (pixman_implementation_t * impl,
-     }
- }
- 
-+#if defined(__ARM_EABI__) && defined(__linux__)
-+/*
-+ * ARMv6 assembly optimized version of 'composite_over_n_8_0565'. It is
-+ * a bare metal 'naked' function which uses all the available CPU registers
-+ * and is compatible with ARM EABI. It might (or might not) break when used
-+ * with a different ABI, anyway it is better to be safe than sorry.
-+ */
-+static void __attribute__((naked)) armv6_composite_over_n_8_0565_asm (
-+    uint16_t *dst, uint8_t *mask, uint32_t src, int w,
-+    int dst_stride_delta, int mask_stride_delta, int h)
-+{
-+    asm volatile (
-+        ".macro composite_internal_armv6_asm opaque_flag\n"
-+            /* save all registers (8 words) to stack */
-+            "stmdb   sp!, {r4-r11, ip, lr}\n"
-+            /* some register aliases for better readability */
-+            "DST     .req  r0\n"
-+            "MASK    .req  r1\n"
-+            "S       .req  r2\n"
-+            "W       .req  r3\n"
-+            "A       .req  r8\n"
-+            "D       .req  r10\n"
-+            "C0000FF .req  r11\n"
-+            "C00001F .req  r9\n"
-+            "C800080 .req  ip\n"
-+            "CE000E0 .req  lr\n"
-+            /* precalculate some stuff and put it on stack */
-+            "mov     r6, #0xF8\n"
-+            "mov     r7, #0xFC\n"
-+
-+            "str     W, [sp, #-8]!\n"
-+
-+            ".if \\opaque_flag\n"
-+                /* precalculate and save it to stack for later use:
-+                 * ((src >> 3) & 0x001F) |
-+                 * ((src >> 5) & 0x07E0) |
-+                 * ((src >> 8) & 0xF800)
-+                 */
-+                "mov     A, #0x1F\n"
-+                "and     D, A, S, lsr #3\n"
-+                "and     r4, S, #0xF80000\n"
-+                "and     r5, S, #0xFC00\n"
-+                "orr     D, r4, lsr #8\n"
-+                "orr     D, r5, lsr #5\n"
-+                "str     D, [sp, #4]\n"
-+            ".endif\n"
-+
-+            "ldr     D, [sp, #(8 + 10*4 + 8)]\n" /* h */
-+            "ldr     A, =0xFF00FF\n"
-+            "ldr     C800080, =0x800080\n"
-+            "ldr     CE000E0, =0xE000E0\n"
-+            "ldr     C0000FF, =0xFF\n"
-+            "ldr     C00001F, =0x1F\n"
-+            "and     r4, A, S\n"           /* r4 = src & 0x00FF00FF */
-+            "and     r5, A, S, lsr #8\n"   /* r5 = (src >> 8) & 0x00FF00FF */
-+            "stmdb   sp!, {r4, r5, r6, r7}\n"
-+        "0:\n"
-+            "subs    D, D, #1\n"
-+            "blt     6f\n"
-+        "1:\n"
-+            "subs    W, W, #1\n"
-+            "blt     5f\n"
-+        "2:\n"
-+            "ldrb    A, [MASK], #1\n"
-+            "ldmia   sp, {r4, r5, r6, r7}\n" /* load constants from stack */
-+            "add     DST, DST, #2\n"
-+            "cmp     A, #0\n"
-+            "beq     1b\n"
-+
-+            ".if \\opaque_flag\n"
-+                "cmp     A, #0xFF\n"
-+                "bne     3f\n"
-+                "ldr     D, [sp, #(4*4 + 4)]\n" /* load precalculated value */
-+                "subs    W, #1\n"
-+                "strh    D, [DST, #-2]\n"
-+                "bge     2b\n"
-+            ".endif\n"
-+
-+        "3:\n"
-+            "ldrh    D, [DST, #-2]\n"
-+            "mla     r4, A, r4, C800080\n"
-+            "mla     r5, A, r5, C800080\n"
-+            "and     r6, r6, D, lsl #3\n" /* & 0xF8 */
-+            "and     r7, r7, D, lsr #3\n" /* & 0xFC */
-+            "and     D, D, #0xF800\n"
-+            "bic     S, r4, #0xFF0000\n"
-+            "bic     A, r5, #0xFF0000\n"
-+            "add     r4, r4, S, lsr #8\n"
-+            "add     r5, r5, A, lsr #8\n"
-+
-+            "and     S, r7, #0xC0\n"
-+            "orr     r6, r6, D, lsl #8\n"
-+            "and     D, r6, CE000E0\n"
-+            "eor     A, C0000FF, r5, lsr #24\n"
-+            "orr     r6, D, lsr #5\n"
-+            "orr     r7, S, lsr #6\n"
-+
-+            "mla     r6, A, r6, C800080\n"
-+            "mla     r7, A, r7, C800080\n"
-+            "subs    W, #1\n"
-+            "bic     D, r6, #0xFF0000\n"
-+            "bic     A, r7, #0xFF0000\n"
-+            "add     r6, r6, D, lsr #8\n"
-+            "uqadd8  r4, r4, r6\n"
-+            "add     r7, r7, A, lsr #8\n"
-+            "uqadd8  r5, r5, r7\n"
-+            "and     D, C00001F, r4, lsr #11\n"
-+            "and     r4, r4, #0xF8000000\n"
-+            "and     r5, r5, #0xFC00\n"
-+            "orr     D, r4, lsr #16\n"
-+            "orr     D, r5, lsr #5\n"
-+            "strh    D, [DST, #-2]\n"
-+            "bge     2b\n"
-+        "5:\n"
-+            "ldr     r6, [sp, #(4*4 + 8 + 10*4 + 8)]\n" /* h */
-+            "ldr     r4, [sp, #(4*4 + 8 + 10*4 + 4)]\n" /* mask stride */
-+            "ldr     r5, [sp, #(4*4 + 8 + 10*4 + 0)]\n" /* dst stride */
-+            "ldr     W, [sp, #(4*4)]\n"
-+            "subs    r6, r6, #1\n" /* h */
-+            "str     r6, [sp, #(4*4 + 8 + 10*4 + 8)]\n" /* h */
-+            "add     MASK, MASK, r4\n"
-+            "add     DST, DST, r5, lsl #1\n"
-+            "bgt     1b\n"
-+        "6:\n"
-+            "add     sp, sp, #(4*4 + 8)\n"
-+            /* restore all registers and return */
-+            "ldmia   sp!, {r4-r11, ip, pc}\n"
-+            ".unreq DST\n"
-+            ".unreq MASK\n"
-+            ".unreq S\n"
-+            ".unreq W\n"
-+            ".unreq A\n"
-+            ".unreq D\n"
-+            ".unreq C0000FF\n"
-+            ".unreq C00001F\n"
-+            ".unreq C800080\n"
-+            ".unreq CE000E0\n"
-+        ".endm\n"
-+
-+        "mov     ip, r2, lsr #24\n"
-+        "cmp     ip, #0xFF\n"
-+        "beq     9f\n"
-+        "composite_internal_armv6_asm 0\n"
-+    "9:\n"
-+        "composite_internal_armv6_asm 1\n"
-+        ".ltorg\n"
-+        ".purgem composite_internal_armv6_asm\n"
-+    );
-+}
-+
-+static void
-+armv6_composite_over_n_8_0565 (pixman_implementation_t * impl,
-+			       pixman_op_t               op,
-+			       pixman_image_t *          src_image,
-+			       pixman_image_t *          mask_image,
-+			       pixman_image_t *          dst_image,
-+			       int32_t                   src_x,
-+			       int32_t                   src_y,
-+			       int32_t                   mask_x,
-+			       int32_t                   mask_y,
-+			       int32_t                   dest_x,
-+			       int32_t                   dest_y,
-+			       int32_t                   width,
-+			       int32_t                   height)
-+{
-+    uint32_t src;
-+    uint16_t *dst;
-+    uint8_t  *mask;
-+    int dst_stride, mask_stride;
-+
-+    src = _pixman_image_get_solid (src_image, dst_image->bits.format);
-+
-+    /* bail out if fully transparent */
-+    if (src == 0)
-+	return;
-+
-+    PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, uint16_t,
-+			   dst_stride, dst, 1);
-+    PIXMAN_IMAGE_GET_LINE (mask_image, mask_x, mask_y, uint8_t,
-+			   mask_stride, mask, 1);
-+
-+    armv6_composite_over_n_8_0565_asm (dst, mask, src, width,
-+	dst_stride - width, mask_stride - width, height);
-+}
-+
-+#endif
-+
- static const pixman_fast_path_t arm_simd_fast_paths[] =
- {
-     PIXMAN_STD_FAST_PATH (OVER, a8r8g8b8, null, a8r8g8b8, arm_composite_over_8888_8888),
-@@ -434,7 +621,10 @@ static const pixman_fast_path_t arm_simd_fast_paths[] =
-     PIXMAN_STD_FAST_PATH (OVER, solid, a8, x8r8g8b8, arm_composite_over_n_8_8888),
-     PIXMAN_STD_FAST_PATH (OVER, solid, a8, a8b8g8r8, arm_composite_over_n_8_8888),
-     PIXMAN_STD_FAST_PATH (OVER, solid, a8, x8b8g8r8, arm_composite_over_n_8_8888),
--
-+#if defined(__ARM_EABI__) && defined(__linux__)
-+    PIXMAN_STD_FAST_PATH (OVER, solid, a8, r5g6b5, armv6_composite_over_n_8_0565),
-+    PIXMAN_STD_FAST_PATH (OVER, solid, a8, b5g6r5, armv6_composite_over_n_8_0565),
-+#endif
-     { PIXMAN_OP_NONE },
- };
- 
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman/pixman-0.13.2-neon1.patch b/recipes/xorg-lib/pixman/pixman-0.13.2-neon1.patch
deleted file mode 100644
index b3bb762..0000000
--- a/recipes/xorg-lib/pixman/pixman-0.13.2-neon1.patch
+++ /dev/null
@@ -1,1702 +0,0 @@
-diff --git a/configure.ac b/configure.ac
-index 063f6eb..bada55c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -278,11 +278,12 @@ AC_SUBST(VMX_CFLAGS)
- AM_CONDITIONAL(USE_VMX, test $have_vmx_intrinsics = yes)
- 
- dnl Check for ARM SIMD instructions
-+ARM_SIMD_CFLAGS=""
- 
- have_arm_simd=no
- AC_MSG_CHECKING(whether to use ARM SIMD assembler)
- xserver_save_CFLAGS=$CFLAGS
--CFLAGS="$CFLAGS $ARM_CFLAGS"
-+CFLAGS="$CFLAGS $ARM_SIMD_CFLAGS"
- AC_COMPILE_IFELSE([
- int main () {
-     asm("uqadd8 r1, r1, r2");
-@@ -302,7 +303,7 @@ fi
- if test $have_arm_simd = yes ; then
-    AC_DEFINE(USE_ARM_SIMD, 1, [use ARM SIMD compiler intrinsics])
- else
--   ARM_CFLAGS=
-+   ARM_SIMD_CFLAGS=
- fi
- 
- AC_MSG_RESULT($have_arm_simd)
-@@ -310,9 +311,48 @@ if test $enable_arm_simd = yes && test $have_arm_simd = no ; then
-    AC_MSG_ERROR([ARM SIMD intrinsics not detected])
- fi
- 
--AC_SUBST(ARM_CFLAGS)
-+dnl Check for ARM NEON instructions
-+ARM_NEON_CFLAGS="-mcpu=cortex-a8 -mfpu=neon"
-+
-+have_arm_neon=no
-+AC_MSG_CHECKING(whether to use ARM NEON)
-+xserver_save_CFLAGS=$CFLAGS
-+CFLAGS="$CFLAGS $ARM_NEON_CFLAGS"
-+AC_COMPILE_IFELSE([
-+#include <arm_neon.h>
-+int main () {
-+    uint8x8_t neon_test=vmov_n_u8(0);
-+    return 0;
-+}], have_arm_neon=yes)
-+CFLAGS=$xserver_save_CFLAGS
-+
-+AC_ARG_ENABLE(arm-neon,
-+   [AC_HELP_STRING([--disable-arm-neon],
-+                   [disable ARM NEON fast paths])],
-+   [enable_arm_neon=$enableval], [enable_arm_neon=auto])
-+
-+if test $enable_arm_neon = no ; then
-+   have_arm_neon=disabled
-+fi
-+
-+if test $have_arm_neon = yes ; then
-+   AC_DEFINE(USE_ARM_NEON, 1, [use ARM NEON compiler intrinsics])
-+else
-+   ARM_NEON_CFLAGS=
-+fi
-+
-+AC_MSG_RESULT($have_arm_neon)
-+if test $enable_arm_neon = yes && test $have_arm_neon = no ; then
-+   AC_MSG_ERROR([ARM NEON intrinsics not detected])
-+fi
-+
-+
-+AC_SUBST(ARM_SIMD_CFLAGS)
-+AC_SUBST(ARM_NEON_CFLAGS)
- 
- AM_CONDITIONAL(USE_ARM_SIMD, test $have_arm_simd = yes)
-+AM_CONDITIONAL(USE_ARM_NEON, test $have_arm_neon = yes)
-+
- 
- 
- AC_ARG_ENABLE(gtk,
-diff --git a/pixman/Makefile.am b/pixman/Makefile.am
-index c4612ea..4c1ec6b 100644
---- a/pixman/Makefile.am
-+++ b/pixman/Makefile.am
-@@ -80,15 +80,26 @@ libpixman_sse2_la_LIBADD = $(DEP_LIBS)
- libpixman_1_la_LIBADD += libpixman-sse2.la
- endif
- 
--# arm code
-+# arm simd code
- if USE_ARM_SIMD
- noinst_LTLIBRARIES += libpixman-arm-simd.la
- libpixman_arm_simd_la_SOURCES = \
- 	pixman-arm-simd.c \
- 	pixman-arm-simd.h
--libpixman_arm_simd_la_CFLAGS = $(DEP_CFLAGS) $(ARM_CFLAGS)
-+libpixman_arm_simd_la_CFLAGS = $(DEP_CFLAGS) $(ARM_SIMD_CFLAGS)
- libpixman_arm_simd_la_LIBADD = $(DEP_LIBS)
- libpixman_1_la_LIBADD += libpixman-arm-simd.la
- endif
- 
-+# arm neon code
-+if USE_ARM_NEON
-+noinst_LTLIBRARIES += libpixman-arm-neon.la
-+libpixman_arm_neon_la_SOURCES = \
-+        pixman-arm-neon.c \
-+        pixman-arm-neon.h
-+libpixman_arm_neon_la_CFLAGS = $(DEP_CFLAGS) $(ARM_NEON_CFLAGS)
-+libpixman_arm_neon_la_LIBADD = $(DEP_LIBS)
-+libpixman_1_la_LIBADD += libpixman-arm-neon.la
-+endif
-+
- 
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-new file mode 100644
-index 0000000..10050e4
---- /dev/null
-+++ b/pixman/pixman-arm-neon.c
-@@ -0,0 +1,1387 @@
-+/*
-+ * Copyright © 2009 Mozilla Corporation
-+ *
-+ * Permission to use, copy, modify, distribute, and sell this software and its
-+ * documentation for any purpose is hereby granted without fee, provided that
-+ * the above copyright notice appear in all copies and that both that
-+ * copyright notice and this permission notice appear in supporting
-+ * documentation, and that the name of Mozilla Corporation not be used in
-+ * advertising or publicity pertaining to distribution of the software without
-+ * specific, written prior permission.  Mozilla Corporation makes no
-+ * representations about the suitability of this software for any purpose.  It
-+ * is provided "as is" without express or implied warranty.
-+ *
-+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
-+ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
-+ * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
-+ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
-+ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
-+ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
-+ * SOFTWARE.
-+ *
-+ * Author:  Ian Rickards (ian.rickards@arm.com) 
-+ *
-+ */
-+
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
-+
-+#include "pixman-arm-neon.h"
-+
-+#include <arm_neon.h>
-+
-+
-+#if !defined(__ARMCC_VERSION) && !defined(FORCE_NO_NEON_INLINE_ASM)
-+// [both armcc & gcc set __GNUC__]
-+// Use GNU style inline asm on gcc, for best performance
-+// Use intrinsics on armcc
-+// This switch determines if any GNU style inline asm is allowed
-+#define USE_NEON_INLINE_ASM
-+#endif
-+
-+
-+static force_inline uint8x8x4_t unpack0565(uint16x8_t rgb)
-+{
-+    uint16x8_t gb, b;
-+    uint8x8x4_t res;
-+
-+    res.val[3] = vdup_n_u8(0);
-+    gb = vshrq_n_u16(rgb, 5);
-+    b = vshrq_n_u16(rgb, 5+6);
-+    res.val[0] = vmovn_u16(rgb);  // get low 5 bits
-+    res.val[1] = vmovn_u16(gb);   // get mid 6 bits
-+    res.val[2] = vmovn_u16(b);    // get top 5 bits
-+
-+    res.val[0] = vshl_n_u8(res.val[0], 3); // shift to top
-+    res.val[1] = vshl_n_u8(res.val[1], 2); // shift to top
-+    res.val[2] = vshl_n_u8(res.val[2], 3); // shift to top
-+
-+    res.val[0] = vsri_n_u8(res.val[0], res.val[0], 5); 
-+    res.val[1] = vsri_n_u8(res.val[1], res.val[1], 6);
-+    res.val[2] = vsri_n_u8(res.val[2], res.val[2], 5);
-+
-+    return res;
-+}
-+
-+static force_inline uint16x8_t pack0565(uint8x8x4_t s)
-+{
-+    uint16x8_t rgb, val_g, val_r;
-+
-+    rgb = vshll_n_u8(s.val[2],8);
-+    val_g = vshll_n_u8(s.val[1],8);
-+    val_r = vshll_n_u8(s.val[0],8);
-+    rgb = vsriq_n_u16(rgb, val_g, 5);
-+    rgb = vsriq_n_u16(rgb, val_r, 5+6);
-+
-+    return rgb;
-+}
-+
-+static force_inline uint8x8_t neon2mul(uint8x8_t x, uint8x8_t alpha)
-+{
-+    uint16x8_t tmp,tmp2;
-+    uint8x8_t res;
-+
-+    tmp = vmull_u8(x,alpha);
-+    tmp2 = vrshrq_n_u16(tmp,8);
-+    res = vraddhn_u16(tmp,tmp2);
-+
-+    return res;
-+}
-+
-+static force_inline uint8x8x4_t neon8mul(uint8x8x4_t x, uint8x8_t alpha)
-+{
-+    uint16x8x4_t tmp;
-+    uint8x8x4_t res;
-+    uint16x8_t qtmp1,qtmp2;
-+
-+    tmp.val[0] = vmull_u8(x.val[0],alpha);
-+    tmp.val[1] = vmull_u8(x.val[1],alpha);
-+    tmp.val[2] = vmull_u8(x.val[2],alpha);
-+    tmp.val[3] = vmull_u8(x.val[3],alpha);
-+
-+    qtmp1 = vrshrq_n_u16(tmp.val[0],8);
-+    qtmp2 = vrshrq_n_u16(tmp.val[1],8);
-+    res.val[0] = vraddhn_u16(tmp.val[0],qtmp1);
-+    qtmp1 = vrshrq_n_u16(tmp.val[2],8);
-+    res.val[1] = vraddhn_u16(tmp.val[1],qtmp2);
-+    qtmp2 = vrshrq_n_u16(tmp.val[3],8);
-+    res.val[2] = vraddhn_u16(tmp.val[2],qtmp1);
-+    res.val[3] = vraddhn_u16(tmp.val[3],qtmp2);
-+
-+    return res;
-+}
-+
-+static force_inline uint8x8x4_t neon8qadd(uint8x8x4_t x, uint8x8x4_t y)
-+{
-+    uint8x8x4_t res;
-+
-+    res.val[0] = vqadd_u8(x.val[0],y.val[0]);
-+    res.val[1] = vqadd_u8(x.val[1],y.val[1]);
-+    res.val[2] = vqadd_u8(x.val[2],y.val[2]);
-+    res.val[3] = vqadd_u8(x.val[3],y.val[3]);
-+
-+    return res;
-+}
-+
-+
-+void
-+fbCompositeSrcAdd_8000x8000neon (pixman_op_t op,
-+                                pixman_image_t * pSrc,
-+                                pixman_image_t * pMask,
-+                                pixman_image_t * pDst,
-+                                int16_t      xSrc,
-+                                int16_t      ySrc,
-+                                int16_t      xMask,
-+                                int16_t      yMask,
-+                                int16_t      xDst,
-+                                int16_t      yDst,
-+                                uint16_t     width,
-+                                uint16_t     height)
-+{
-+    uint8_t     *dstLine, *dst;
-+    uint8_t     *srcLine, *src;
-+    int dstStride, srcStride;
-+    uint16_t    w;
-+
-+    fbComposeGetStart (pSrc, xSrc, ySrc, uint8_t, srcStride, srcLine, 1);
-+    fbComposeGetStart (pDst, xDst, yDst, uint8_t, dstStride, dstLine, 1);
-+
-+    if (width>=8)
-+    {
-+        // Use overlapping 8-pixel method
-+        while (height--)
-+        {
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            src = srcLine;
-+            srcLine += srcStride;
-+            w = width;
-+
-+            uint8_t *keep_dst;
-+
-+#ifndef USE_NEON_INLINE_ASM
-+            uint8x8_t sval,dval,temp;
-+
-+            sval = vld1_u8((void*)src);
-+            dval = vld1_u8((void*)dst);
-+            keep_dst = dst;
-+
-+            temp = vqadd_u8(dval,sval);
-+
-+            src += (w & 7);
-+            dst += (w & 7);
-+            w -= (w & 7);
-+
-+            while (w)
-+            {
-+                sval = vld1_u8((void*)src);
-+                dval = vld1_u8((void*)dst);
-+
-+                vst1_u8((void*)keep_dst,temp);
-+                keep_dst = dst;
-+
-+                temp = vqadd_u8(dval,sval);
-+
-+                src+=8;
-+                dst+=8;
-+                w-=8;
-+            }
-+            vst1_u8((void*)keep_dst,temp);
-+#else
-+            asm volatile (
-+// avoid using d8-d15 (q4-q7) aapcs callee-save registers
-+                        "vld1.8  {d0}, [%[src]]\n\t"
-+                        "vld1.8  {d4}, [%[dst]]\n\t"
-+                        "mov     %[keep_dst], %[dst]\n\t"
-+
-+                        "and ip, %[w], #7\n\t"
-+                        "add %[src], %[src], ip\n\t"
-+                        "add %[dst], %[dst], ip\n\t"
-+                        "subs %[w], %[w], ip\n\t"
-+                        "b 9f\n\t"
-+// LOOP
-+                        "2:\n\t"
-+                        "vld1.8  {d0}, [%[src]]!\n\t"
-+                        "vld1.8  {d4}, [%[dst]]!\n\t"
-+                        "vst1.8  {d20}, [%[keep_dst]]\n\t"
-+                        "sub     %[keep_dst], %[dst], #8\n\t"
-+                        "subs %[w], %[w], #8\n\t"
-+                        "9:\n\t"
-+                        "vqadd.u8 d20, d0, d4\n\t"
-+
-+                        "bne 2b\n\t"
-+
-+                        "1:\n\t"
-+                        "vst1.8  {d20}, [%[keep_dst]]\n\t"
-+
-+                        : [w] "+r" (w), [src] "+r" (src), [dst] "+r" (dst), [keep_dst] "+r" (keep_dst)
-+                        :
-+                        : "ip", "cc", "memory", "d0","d4",
-+                          "d20"
-+                        );
-+#endif
-+        }
-+    }
-+    else
-+    {
-+        while (height--)
-+        {
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            src = srcLine;
-+            srcLine += srcStride;
-+            w = width;
-+            uint8x8_t sval, dval;
-+            uint8_t *dst4, *dst2;
-+
-+            if (w&4)
-+            {
-+                sval = vreinterpret_u8_u32(vld1_lane_u32((void*)src,vreinterpret_u32_u8(sval),1));
-+                dval = vreinterpret_u8_u32(vld1_lane_u32((void*)dst,vreinterpret_u32_u8(dval),1));
-+                dst4=dst;
-+                src+=4;
-+                dst+=4;
-+            }
-+            if (w&2)
-+            {
-+                sval = vreinterpret_u8_u16(vld1_lane_u16((void*)src,vreinterpret_u16_u8(sval),1));
-+                dval = vreinterpret_u8_u16(vld1_lane_u16((void*)dst,vreinterpret_u16_u8(dval),1));
-+                dst2=dst;
-+                src+=2;
-+                dst+=2;
-+            }
-+            if (w&1)
-+            {
-+                sval = vld1_lane_u8((void*)src,sval,1);
-+                dval = vld1_lane_u8((void*)dst,dval,1);
-+            }
-+
-+            dval = vqadd_u8(dval,sval);
-+
-+            if (w&1)
-+                vst1_lane_u8((void*)dst,dval,1);
-+            if (w&2)
-+                vst1_lane_u16((void*)dst2,vreinterpret_u16_u8(dval),1);
-+            if (w&4)
-+                vst1_lane_u32((void*)dst4,vreinterpret_u32_u8(dval),1);
-+        }
-+    }
-+}
-+
-+
-+void
-+fbCompositeSrc_8888x8888neon (pixman_op_t op,
-+			 pixman_image_t * pSrc,
-+			 pixman_image_t * pMask,
-+			 pixman_image_t * pDst,
-+			 int16_t      xSrc,
-+			 int16_t      ySrc,
-+			 int16_t      xMask,
-+			 int16_t      yMask,
-+			 int16_t      xDst,
-+			 int16_t      yDst,
-+			 uint16_t     width,
-+			 uint16_t     height)
-+{
-+    uint32_t	*dstLine, *dst;
-+    uint32_t	*srcLine, *src;
-+    int	dstStride, srcStride;
-+    uint32_t	w;
-+
-+    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
-+    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
-+
-+    if (width>=8)
-+    {
-+        // Use overlapping 8-pixel method  
-+        while (height--)
-+        {
-+	    dst = dstLine;
-+	    dstLine += dstStride;
-+	    src = srcLine;
-+	    srcLine += srcStride;
-+	    w = width;
-+
-+            uint32_t *keep_dst;
-+
-+#ifndef USE_NEON_INLINE_ASM
-+            uint8x8x4_t sval,dval,temp;
-+
-+            sval = vld4_u8((void*)src);
-+            dval = vld4_u8((void*)dst);
-+            keep_dst = dst;
-+
-+            temp = neon8mul(dval,vmvn_u8(sval.val[3]));
-+            temp = neon8qadd(sval,temp);
-+
-+            src += (w & 7);
-+            dst += (w & 7);
-+            w -= (w & 7);
-+
-+            while (w)
-+            {
-+                sval = vld4_u8((void*)src);
-+                dval = vld4_u8((void*)dst);
-+
-+                vst4_u8((void*)keep_dst,temp);
-+                keep_dst = dst;
-+
-+                temp = neon8mul(dval,vmvn_u8(sval.val[3]));
-+                temp = neon8qadd(sval,temp);
-+
-+                src+=8;
-+                dst+=8;
-+                w-=8;
-+            }
-+            vst4_u8((void*)keep_dst,temp);
-+#else
-+            asm volatile (
-+// avoid using d8-d15 (q4-q7) aapcs callee-save registers
-+                        "vld4.8  {d0-d3}, [%[src]]\n\t"
-+                        "vld4.8  {d4-d7}, [%[dst]]\n\t"
-+                        "mov     %[keep_dst], %[dst]\n\t"
-+
-+                        "and ip, %[w], #7\n\t"
-+                        "add %[src], %[src], ip, LSL#2\n\t"
-+                        "add %[dst], %[dst], ip, LSL#2\n\t"
-+                        "subs %[w], %[w], ip\n\t"
-+                        "b 9f\n\t"
-+// LOOP
-+                        "2:\n\t"
-+                        "vld4.8  {d0-d3}, [%[src]]!\n\t"
-+                        "vld4.8  {d4-d7}, [%[dst]]!\n\t"
-+                        "vst4.8  {d20-d23}, [%[keep_dst]]\n\t"
-+                        "sub     %[keep_dst], %[dst], #8*4\n\t"
-+                        "subs %[w], %[w], #8\n\t"
-+                        "9:\n\t"
-+                        "vmvn.8  d31, d3\n\t"
-+                        "vmull.u8 q10, d31, d4\n\t"
-+                        "vmull.u8 q11, d31, d5\n\t"
-+                        "vmull.u8 q12, d31, d6\n\t"
-+                        "vmull.u8 q13, d31, d7\n\t"
-+                        "vrshr.u16 q8, q10, #8\n\t"
-+                        "vrshr.u16 q9, q11, #8\n\t"
-+                        "vraddhn.u16 d20, q10, q8\n\t"
-+                        "vraddhn.u16 d21, q11, q9\n\t"
-+                        "vrshr.u16 q8, q12, #8\n\t"
-+                        "vrshr.u16 q9, q13, #8\n\t"
-+                        "vraddhn.u16 d22, q12, q8\n\t"
-+                        "vraddhn.u16 d23, q13, q9\n\t"
-+// result in d20-d23
-+                        "vqadd.u8 d20, d0, d20\n\t"
-+                        "vqadd.u8 d21, d1, d21\n\t"
-+                        "vqadd.u8 d22, d2, d22\n\t"
-+                        "vqadd.u8 d23, d3, d23\n\t"
-+
-+                        "bne 2b\n\t"
-+
-+                        "1:\n\t"
-+                        "vst4.8  {d20-d23}, [%[keep_dst]]\n\t"
-+
-+                        : [w] "+r" (w), [src] "+r" (src), [dst] "+r" (dst), [keep_dst] "+r" (keep_dst)
-+                        : 
-+                        : "ip", "cc", "memory", "d0","d1","d2","d3","d4","d5","d6","d7",
-+                          "d16","d17","d18","d19","d20","d21","d22","d23"
-+                        );
-+#endif
-+        }
-+    }
-+    else
-+    {
-+        uint8x8_t    alpha_selector=vreinterpret_u8_u64(vcreate_u64(0x0707070703030303ULL));
-+
-+        // Handle width<8
-+        while (height--)
-+        {
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            src = srcLine;
-+            srcLine += srcStride;
-+            w = width;
-+
-+            while (w>=2)
-+            {
-+                uint8x8_t sval,dval;
-+
-+                /* two 32-bit pixels packed into D-reg; ad-hoc vectorization */
-+                sval = vreinterpret_u8_u32(vld1_u32((void*)src));
-+                dval = vreinterpret_u8_u32(vld1_u32((void*)dst));
-+                dval = neon2mul(dval,vtbl1_u8(vmvn_u8(sval),alpha_selector));
-+                vst1_u8((void*)dst,vqadd_u8(sval,dval));
-+
-+                src+=2;
-+                dst+=2;
-+                w-=2;
-+            }
-+
-+            if (w)
-+            {
-+                uint8x8_t sval,dval;
-+
-+                /* single 32-bit pixel in lane 0 */
-+                sval = vreinterpret_u8_u32(vld1_dup_u32((void*)src));  // only interested in lane 0
-+                dval = vreinterpret_u8_u32(vld1_dup_u32((void*)dst));  // only interested in lane 0
-+                dval = neon2mul(dval,vtbl1_u8(vmvn_u8(sval),alpha_selector));
-+                vst1_lane_u32((void*)dst,vreinterpret_u32_u8(vqadd_u8(sval,dval)),0);
-+            }
-+        }
-+    }
-+}
-+
-+
-+
-+void
-+fbCompositeSrc_x888x0565neon (pixman_op_t op,
-+                          pixman_image_t * pSrc,
-+                          pixman_image_t * pMask,
-+                          pixman_image_t * pDst,
-+                          int16_t      xSrc,
-+                          int16_t      ySrc,
-+                          int16_t      xMask,
-+                          int16_t      yMask,
-+                          int16_t      xDst,
-+                          int16_t      yDst,
-+                          uint16_t     width,
-+                          uint16_t     height)
-+{
-+    uint16_t    *dstLine, *dst;
-+    uint32_t    *srcLine, *src;
-+    int dstStride, srcStride;
-+    uint32_t    w;
-+
-+    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
-+    fbComposeGetStart (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
-+
-+    if (width>=8)
-+    {
-+        while (height--)
-+        {
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            src = srcLine;
-+            srcLine += srcStride;
-+            w = width;
-+
-+	    do {
-+	        while (w>=8)
-+	        {
-+#ifndef USE_NEON_INLINE_ASM
-+	            vst1q_u16(dst, pack0565(vld4_u8((void*)src)));
-+#else
-+                    asm volatile (
-+                        "vld4.8       {d4-d7}, [%[src]]\n\t"
-+                        "vshll.u8     q0, d6, #8\n\t"
-+                        "vshll.u8     q1, d5, #8\n\t"
-+                        "vsriq.u16    q0, q1, #5\t\n"
-+                        "vshll.u8     q1, d4, #8\n\t"
-+                        "vsriq.u16    q0, q1, #11\t\n"
-+                        "vst1.16      {q0}, [%[dst]]\n\t"
-+                        :
-+                        : [dst] "r" (dst), [src] "r" (src)
-+                        : "memory", "d0","d1","d2","d3","d4","d5","d6","d7"
-+                        );
-+#endif
-+	            src+=8;
-+	            dst+=8;
-+	            w-=8;
-+          	}
-+                if (w != 0)
-+                {
-+                    src -= (8-w);
-+                    dst -= (8-w);
-+                    w = 8;  // do another vector
-+                }
-+            } while (w!=0);
-+        }
-+    }
-+    else
-+    {
-+        // Handle width<8
-+        while (height--)
-+        {
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            src = srcLine;
-+            srcLine += srcStride;
-+            w = width;
-+
-+	    while (w>=2)
-+	    {
-+	        uint32x2_t sval, rgb, g, b;
-+	        sval = vld1_u32(src);
-+	        rgb = vshr_n_u32(sval,8-5); // r (5 bits) 
-+	        g = vshr_n_u32(sval,8+8-6);  // g to bottom byte
-+	        rgb = vsli_n_u32(rgb, g, 5);
-+	        b = vshr_n_u32(sval,8+8+8-5);  // b to bottom byte
-+                rgb = vsli_n_u32(rgb, b, 11);
-+	        vst1_lane_u16(dst++,vreinterpret_u16_u32(rgb),0);
-+	        vst1_lane_u16(dst++,vreinterpret_u16_u32(rgb),2);
-+	        src+=2;
-+	        w-=2;
-+	    }
-+            if (w)
-+            {
-+                uint32x2_t sval, rgb, g, b;
-+                sval = vld1_dup_u32(src);
-+                rgb = vshr_n_u32(sval,8-5); // r (5 bits)
-+                g = vshr_n_u32(sval,8+8-6);  // g to bottom byte
-+                rgb = vsli_n_u32(rgb, g, 5);
-+                b = vshr_n_u32(sval,8+8+8-5);  // b to bottom byte
-+                rgb = vsli_n_u32(rgb, b, 11);
-+                vst1_lane_u16(dst++,vreinterpret_u16_u32(rgb),0);
-+            }
-+	}
-+    }
-+}
-+
-+
-+void
-+fbCompositeSrc_8888x8x8888neon (pixman_op_t op,
-+			       pixman_image_t * pSrc,
-+			       pixman_image_t * pMask,
-+			       pixman_image_t * pDst,
-+			       int16_t	xSrc,
-+			       int16_t	ySrc,
-+			       int16_t      xMask,
-+			       int16_t      yMask,
-+			       int16_t      xDst,
-+			       int16_t      yDst,
-+			       uint16_t     width,
-+			       uint16_t     height)
-+{
-+    uint32_t	*dstLine, *dst;
-+    uint32_t	*srcLine, *src;
-+    uint32_t	mask;
-+    int	dstStride, srcStride;
-+    uint32_t	w;
-+    uint8x8_t mask_alpha;
-+
-+    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
-+    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
-+
-+    fbComposeGetSolid (pMask, mask, pDst->bits.format);
-+    mask_alpha = vdup_n_u8((mask) >> 24);
-+
-+    if (width>=8)
-+    {
-+        // Use overlapping 8-pixel method
-+        while (height--)
-+        {
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            src = srcLine;
-+            srcLine += srcStride;
-+            w = width;
-+
-+            uint32_t *keep_dst;
-+
-+#ifndef USE_NEON_INLINE_ASM
-+            uint8x8x4_t sval,dval,temp;
-+
-+            sval = vld4_u8((void*)src);
-+            dval = vld4_u8((void*)dst);
-+            keep_dst = dst;
-+
-+            sval = neon8mul(sval,mask_alpha);
-+            temp = neon8mul(dval,vmvn_u8(sval.val[3]));
-+            temp = neon8qadd(sval,temp);
-+
-+            src += (w & 7);
-+            dst += (w & 7);
-+            w -= (w & 7);
-+
-+            while (w)
-+            {
-+                sval = vld4_u8((void*)src);
-+                dval = vld4_u8((void*)dst);
-+
-+                vst4_u8((void*)keep_dst,temp);
-+                keep_dst = dst;
-+
-+                sval = neon8mul(sval,mask_alpha);
-+                temp = neon8mul(dval,vmvn_u8(sval.val[3]));
-+                temp = neon8qadd(sval,temp);
-+
-+                src+=8;
-+                dst+=8;
-+                w-=8;
-+            }
-+            vst4_u8((void*)keep_dst,temp);
-+#else
-+            asm volatile (
-+// avoid using d8-d15 (q4-q7) aapcs callee-save registers
-+                        "vdup.32      d30, %[mask]\n\t"
-+                        "vdup.8       d30, d30[3]\n\t"
-+
-+                        "vld4.8       {d0-d3}, [%[src]]\n\t"
-+                        "vld4.8       {d4-d7}, [%[dst]]\n\t"
-+                        "mov  %[keep_dst], %[dst]\n\t"
-+
-+                        "and  ip, %[w], #7\n\t"
-+                        "add  %[src], %[src], ip, LSL#2\n\t"
-+                        "add  %[dst], %[dst], ip, LSL#2\n\t"
-+                        "subs  %[w], %[w], ip\n\t"
-+                        "b 9f\n\t"
-+// LOOP
-+                        "2:\n\t"
-+                        "vld4.8       {d0-d3}, [%[src]]!\n\t"
-+                        "vld4.8       {d4-d7}, [%[dst]]!\n\t"
-+                        "vst4.8       {d20-d23}, [%[keep_dst]]\n\t"
-+                        "sub  %[keep_dst], %[dst], #8*4\n\t"
-+                        "subs  %[w], %[w], #8\n\t"
-+
-+                        "9:\n\t"
-+                        "vmull.u8     q10, d30, d0\n\t"
-+                        "vmull.u8     q11, d30, d1\n\t"
-+                        "vmull.u8     q12, d30, d2\n\t"
-+                        "vmull.u8     q13, d30, d3\n\t"
-+                        "vrshr.u16    q8, q10, #8\n\t"
-+                        "vrshr.u16    q9, q11, #8\n\t"
-+                        "vraddhn.u16  d0, q10, q8\n\t"
-+                        "vraddhn.u16  d1, q11, q9\n\t"
-+                        "vrshr.u16    q9, q13, #8\n\t"
-+                        "vrshr.u16    q8, q12, #8\n\t"
-+                        "vraddhn.u16  d3, q13, q9\n\t"
-+                        "vraddhn.u16  d2, q12, q8\n\t"
-+
-+                        "vmvn.8       d31, d3\n\t"
-+                        "vmull.u8     q10, d31, d4\n\t"
-+                        "vmull.u8     q11, d31, d5\n\t"
-+                        "vmull.u8     q12, d31, d6\n\t"
-+                        "vmull.u8     q13, d31, d7\n\t"
-+                        "vrshr.u16    q8, q10, #8\n\t"
-+                        "vrshr.u16    q9, q11, #8\n\t"
-+                        "vraddhn.u16  d20, q10, q8\n\t"
-+                        "vrshr.u16    q8, q12, #8\n\t"
-+                        "vraddhn.u16  d21, q11, q9\n\t"
-+                        "vrshr.u16    q9, q13, #8\n\t"
-+                        "vraddhn.u16  d22, q12, q8\n\t"
-+                        "vraddhn.u16  d23, q13, q9\n\t"
-+// result in d20-d23
-+                        "vqadd.u8     d20, d0, d20\n\t"
-+                        "vqadd.u8     d21, d1, d21\n\t"
-+                        "vqadd.u8     d22, d2, d22\n\t"
-+                        "vqadd.u8     d23, d3, d23\n\t"
-+
-+                        "bne  2b\n\t"
-+
-+                        "1:\n\t"
-+                        "vst4.8       {d20-d23}, [%[keep_dst]]\n\t"
-+
-+                        : [w] "+r" (w), [src] "+r" (src), [dst] "+r" (dst), [keep_dst] "+r" (keep_dst)
-+                        : [mask] "r" (mask)
-+                        : "ip", "cc", "memory", "d0","d1","d2","d3","d4","d5","d6","d7",
-+                          "d16","d17","d18","d19","d20","d21","d22","d23","d24","d25","d26","d27",
-+                          "d30","d31"
-+                        );
-+#endif
-+        }
-+    }
-+    else
-+    {
-+        uint8x8_t    alpha_selector=vreinterpret_u8_u64(vcreate_u64(0x0707070703030303ULL));
-+
-+        // Handle width<8
-+        while (height--)
-+        {
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            src = srcLine;
-+            srcLine += srcStride;
-+            w = width;
-+
-+            while (w>=2)
-+            {
-+                uint8x8_t sval,dval;
-+
-+                sval = vreinterpret_u8_u32(vld1_u32((void*)src));
-+                dval = vreinterpret_u8_u32(vld1_u32((void*)dst));
-+
-+                /* sval * const alpha_mul */
-+                sval = neon2mul(sval,mask_alpha);
-+
-+                /* dval * 255-(src alpha) */
-+                dval = neon2mul(dval,vtbl1_u8(vmvn_u8(sval), alpha_selector));
-+
-+                vst1_u8((void*)dst,vqadd_u8(sval,dval));
-+
-+                src+=2;
-+                dst+=2;
-+                w-=2;
-+            }
-+
-+            if (w)
-+            {
-+                uint8x8_t sval,dval;
-+
-+                sval = vreinterpret_u8_u32(vld1_dup_u32((void*)src));
-+                dval = vreinterpret_u8_u32(vld1_dup_u32((void*)dst));
-+
-+                /* sval * const alpha_mul */
-+                sval = neon2mul(sval,mask_alpha);
-+
-+                /* dval * 255-(src alpha) */
-+                dval = neon2mul(dval,vtbl1_u8(vmvn_u8(sval), alpha_selector));
-+
-+                vst1_lane_u32((void*)dst,vreinterpret_u32_u8(vqadd_u8(sval,dval)),0);
-+            }
-+        }
-+    }
-+}
-+
-+
-+
-+void
-+fbCompositeSolidMask_nx8x0565neon (pixman_op_t op,
-+                               pixman_image_t * pSrc,
-+                               pixman_image_t * pMask,
-+                               pixman_image_t * pDst,
-+                               int16_t      xSrc,
-+                               int16_t      ySrc,
-+                               int16_t      xMask,
-+                               int16_t      yMask,
-+                               int16_t      xDst,
-+                               int16_t      yDst,
-+                               uint16_t     width,
-+                               uint16_t     height)
-+{
-+    uint32_t     src, srca;
-+    uint16_t    *dstLine, *dst;
-+    uint8_t     *maskLine, *mask;
-+    int          dstStride, maskStride;
-+    uint32_t     w;
-+    uint8x8_t    sval2;
-+    uint8x8x4_t  sval8;
-+
-+    fbComposeGetSolid(pSrc, src, pDst->bits.format);
-+
-+    srca = src >> 24;
-+    if (src == 0)
-+        return;
-+
-+    sval2=vreinterpret_u8_u32(vdup_n_u32(src));
-+    sval8.val[0]=vdup_lane_u8(sval2,0);
-+    sval8.val[1]=vdup_lane_u8(sval2,1);
-+    sval8.val[2]=vdup_lane_u8(sval2,2);
-+    sval8.val[3]=vdup_lane_u8(sval2,3);
-+
-+    fbComposeGetStart (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
-+    fbComposeGetStart (pMask, xMask, yMask, uint8_t, maskStride, maskLine, 1);
-+
-+    if (width>=8)
-+    {
-+        // Use overlapping 8-pixel method, modified to avoid rewritten dest being reused
-+        while (height--)
-+        {
-+            uint16_t *keep_dst;
-+
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            mask = maskLine;
-+            maskLine += maskStride;
-+            w = width;
-+
-+#ifndef USE_NEON_INLINE_ASM
-+            uint8x8_t alpha;
-+            uint16x8_t dval, temp; 
-+            uint8x8x4_t sval8temp;
-+
-+            alpha = vld1_u8((void*)mask);
-+            dval = vld1q_u16((void*)dst);
-+            keep_dst = dst;
-+
-+            sval8temp = neon8mul(sval8,alpha);
-+            temp = pack0565(neon8qadd(sval8temp,neon8mul(unpack0565(dval),vmvn_u8(sval8temp.val[3]))));
-+
-+            mask += (w & 7);
-+            dst += (w & 7);
-+            w -= (w & 7);
-+
-+            while (w)
-+            {
-+                dval = vld1q_u16((void*)dst);
-+	        alpha = vld1_u8((void*)mask);
-+
-+                vst1q_u16((void*)keep_dst,temp);
-+                keep_dst = dst;
-+
-+                sval8temp = neon8mul(sval8,alpha);
-+                temp = pack0565(neon8qadd(sval8temp,neon8mul(unpack0565(dval),vmvn_u8(sval8temp.val[3]))));
-+
-+                mask+=8;
-+                dst+=8;
-+                w-=8;
-+            }
-+            vst1q_u16((void*)keep_dst,temp);
-+#else
-+        asm volatile (
-+                        "vdup.32      d0, %[src]\n\t"
-+                        "vdup.8       d1, d0[1]\n\t"
-+                        "vdup.8       d2, d0[2]\n\t"
-+                        "vdup.8       d3, d0[3]\n\t"
-+                        "vdup.8       d0, d0[0]\n\t"
-+
-+                        "vld1.8       {q12}, [%[dst]]\n\t"
-+                        "vld1.8       {d31}, [%[mask]]\n\t"
-+                        "mov  %[keep_dst], %[dst]\n\t"
-+
-+                        "and  ip, %[w], #7\n\t"
-+                        "add  %[mask], %[mask], ip\n\t"
-+                        "add  %[dst], %[dst], ip, LSL#1\n\t"
-+                        "subs  %[w], %[w], ip\n\t"
-+                        "b  9f\n\t"
-+// LOOP
-+                        "2:\n\t"
-+
-+                        "vld1.16      {q12}, [%[dst]]!\n\t"
-+                        "vld1.8       {d31}, [%[mask]]!\n\t"
-+                        "vst1.16      {q10}, [%[keep_dst]]\n\t"
-+                        "sub  %[keep_dst], %[dst], #8*2\n\t"
-+                        "subs  %[w], %[w], #8\n\t"
-+                        "9:\n\t"
-+// expand 0565 q12 to 8888 {d4-d7}
-+                        "vmovn.u16    d4, q12\t\n"
-+                        "vshr.u16     q11, q12, #5\t\n"
-+                        "vshr.u16     q10, q12, #6+5\t\n"
-+                        "vmovn.u16    d5, q11\t\n"
-+                        "vmovn.u16    d6, q10\t\n"
-+                        "vshl.u8      d4, d4, #3\t\n"
-+                        "vshl.u8      d5, d5, #2\t\n"
-+                        "vshl.u8      d6, d6, #3\t\n"
-+                        "vsri.u8      d4, d4, #5\t\n"
-+                        "vsri.u8      d5, d5, #6\t\n"
-+                        "vsri.u8      d6, d6, #5\t\n"
-+
-+                        "vmull.u8     q10, d31, d0\n\t"
-+                        "vmull.u8     q11, d31, d1\n\t"
-+                        "vmull.u8     q12, d31, d2\n\t"
-+                        "vmull.u8     q13, d31, d3\n\t"
-+                        "vrshr.u16    q8, q10, #8\n\t"
-+                        "vrshr.u16    q9, q11, #8\n\t"
-+                        "vraddhn.u16  d20, q10, q8\n\t"
-+                        "vraddhn.u16  d21, q11, q9\n\t"
-+                        "vrshr.u16    q9, q13, #8\n\t"
-+                        "vrshr.u16    q8, q12, #8\n\t"
-+                        "vraddhn.u16  d23, q13, q9\n\t"
-+                        "vraddhn.u16  d22, q12, q8\n\t"
-+
-+// duplicate in 4/2/1 & 8pix vsns
-+                        "vmvn.8       d30, d23\n\t"
-+                        "vmull.u8     q14, d30, d6\n\t"
-+                        "vmull.u8     q13, d30, d5\n\t"
-+                        "vmull.u8     q12, d30, d4\n\t"
-+                        "vrshr.u16    q8, q14, #8\n\t"
-+                        "vrshr.u16    q9, q13, #8\n\t"
-+                        "vraddhn.u16  d6, q14, q8\n\t"
-+                        "vrshr.u16    q8, q12, #8\n\t"
-+                        "vraddhn.u16  d5, q13, q9\n\t"
-+                        "vqadd.u8     d6, d6, d22\n\t"  // moved up
-+                        "vraddhn.u16  d4, q12, q8\n\t"
-+// intentionally don't calculate alpha
-+// result in d4-d6
-+
-+//                      "vqadd.u8     d6, d6, d22\n\t"  ** moved up
-+                        "vqadd.u8     d5, d5, d21\n\t"
-+                        "vqadd.u8     d4, d4, d20\n\t"
-+
-+// pack 8888 {d20-d23} to 0565 q10
-+                        "vshll.u8     q10, d6, #8\n\t"
-+                        "vshll.u8     q3, d5, #8\n\t"
-+                        "vshll.u8     q2, d4, #8\n\t"
-+                        "vsri.u16     q10, q3, #5\t\n"
-+                        "vsri.u16     q10, q2, #11\t\n"
-+
-+                        "bne 2b\n\t"
-+
-+                        "1:\n\t"
-+                        "vst1.16      {q10}, [%[keep_dst]]\n\t"
-+
-+                        : [w] "+r" (w), [dst] "+r" (dst), [mask] "+r" (mask), [keep_dst] "+r" (keep_dst)
-+                        : [src] "r" (src)
-+                        : "ip", "cc", "memory", "d0","d1","d2","d3","d4","d5","d6","d7",
-+                          "d16","d17","d18","d19","d20","d21","d22","d23","d24","d25","d26","d27","d28","d29",
-+                          "d30","d31"
-+                        );
-+#endif
-+        }
-+    }
-+    else
-+    {
-+        while (height--)
-+        {
-+            void *dst4, *dst2;
-+
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            mask = maskLine;
-+            maskLine += maskStride;
-+            w = width;
-+
-+
-+#ifndef USE_NEON_INLINE_ASM
-+            uint8x8_t alpha;
-+            uint16x8_t dval, temp;
-+            uint8x8x4_t sval8temp;
-+
-+            if (w&4)
-+            {
-+                alpha = vreinterpret_u8_u32(vld1_lane_u32((void*)mask,vreinterpret_u32_u8(alpha),1));
-+                dval = vreinterpretq_u16_u64(vld1q_lane_u64((void*)dst,vreinterpretq_u64_u16(dval),1));
-+                dst4=dst;
-+                mask+=4;
-+                dst+=4;
-+            }
-+            if (w&2)
-+            {
-+                alpha = vreinterpret_u8_u16(vld1_lane_u16((void*)mask,vreinterpret_u16_u8(alpha),1));
-+                dval = vreinterpretq_u16_u32(vld1q_lane_u32((void*)dst,vreinterpretq_u32_u16(dval),1));
-+                dst2=dst;
-+                mask+=2;
-+                dst+=2;
-+            }
-+            if (w&1)
-+            {
-+                alpha = vld1_lane_u8((void*)mask,alpha,1);
-+                dval = vld1q_lane_u16((void*)dst,dval,1);
-+            }
-+
-+            sval8temp = neon8mul(sval8,alpha);
-+            temp = pack0565(neon8qadd(sval8temp,neon8mul(unpack0565(dval),vmvn_u8(sval8temp.val[3]))));
-+
-+            if (w&1)
-+                vst1q_lane_u16((void*)dst,temp,1);
-+            if (w&2)
-+                vst1q_lane_u32((void*)dst2,vreinterpretq_u32_u16(temp),1);
-+            if (w&4)
-+                vst1q_lane_u64((void*)dst4,vreinterpretq_u64_u16(temp),1);
-+#else
-+            asm volatile (
-+                        "vdup.32      d0, %[src]\n\t"
-+                        "vdup.8       d1, d0[1]\n\t"
-+                        "vdup.8       d2, d0[2]\n\t"
-+                        "vdup.8       d3, d0[3]\n\t"
-+                        "vdup.8       d0, d0[0]\n\t"
-+
-+                        "tst  %[w], #4\t\n"
-+                        "beq  skip_load4\t\n"
-+
-+                        "vld1.64      {d25}, [%[dst]]\n\t"
-+                        "vld1.32      {d31[1]}, [%[mask]]\n\t"
-+                        "mov  %[dst4], %[dst]\t\n"
-+                        "add  %[mask], %[mask], #4\t\n"
-+                        "add  %[dst], %[dst], #4*2\t\n"
-+
-+                        "skip_load4:\t\n"
-+                        "tst  %[w], #2\t\n"
-+                        "beq  skip_load2\t\n"
-+                        "vld1.32      {d24[1]}, [%[dst]]\n\t"
-+                        "vld1.16      {d31[1]}, [%[mask]]\n\t"
-+                        "mov  %[dst2], %[dst]\t\n"
-+                        "add  %[mask], %[mask], #2\t\n"
-+                        "add  %[dst], %[dst], #2*2\t\n"
-+
-+                        "skip_load2:\t\n"
-+                        "tst  %[w], #1\t\n"
-+                        "beq  skip_load1\t\n"
-+                        "vld1.16      {d24[1]}, [%[dst]]\n\t"
-+                        "vld1.8       {d31[1]}, [%[mask]]\n\t"
-+
-+                        "skip_load1:\t\n"
-+// expand 0565 q12 to 8888 {d4-d7}
-+                        "vmovn.u16    d4, q12\t\n"
-+                        "vshr.u16     q11, q12, #5\t\n"
-+                        "vshr.u16     q10, q12, #6+5\t\n"
-+                        "vmovn.u16    d5, q11\t\n"
-+                        "vmovn.u16    d6, q10\t\n"
-+                        "vshl.u8      d4, d4, #3\t\n"
-+                        "vshl.u8      d5, d5, #2\t\n"
-+                        "vshl.u8      d6, d6, #3\t\n"
-+                        "vsri.u8      d4, d4, #5\t\n"
-+                        "vsri.u8      d5, d5, #6\t\n"
-+                        "vsri.u8      d6, d6, #5\t\n"
-+
-+                        "vmull.u8     q10, d31, d0\n\t"
-+                        "vmull.u8     q11, d31, d1\n\t"
-+                        "vmull.u8     q12, d31, d2\n\t"
-+                        "vmull.u8     q13, d31, d3\n\t"
-+                        "vrshr.u16    q8, q10, #8\n\t"
-+                        "vrshr.u16    q9, q11, #8\n\t"
-+                        "vraddhn.u16  d20, q10, q8\n\t"
-+                        "vraddhn.u16  d21, q11, q9\n\t"
-+                        "vrshr.u16    q9, q13, #8\n\t"
-+                        "vrshr.u16    q8, q12, #8\n\t"
-+                        "vraddhn.u16  d23, q13, q9\n\t"
-+                        "vraddhn.u16  d22, q12, q8\n\t"
-+
-+// duplicate in 4/2/1 & 8pix vsns
-+                        "vmvn.8       d30, d23\n\t"
-+                        "vmull.u8     q14, d30, d6\n\t"
-+                        "vmull.u8     q13, d30, d5\n\t"
-+                        "vmull.u8     q12, d30, d4\n\t"
-+                        "vrshr.u16    q8, q14, #8\n\t"
-+                        "vrshr.u16    q9, q13, #8\n\t"
-+                        "vraddhn.u16  d6, q14, q8\n\t"
-+                        "vrshr.u16    q8, q12, #8\n\t"
-+                        "vraddhn.u16  d5, q13, q9\n\t"
-+                        "vqadd.u8     d6, d6, d22\n\t"  // moved up
-+                        "vraddhn.u16  d4, q12, q8\n\t"
-+// intentionally don't calculate alpha
-+// result in d4-d6
-+
-+//                      "vqadd.u8     d6, d6, d22\n\t"  ** moved up
-+                        "vqadd.u8     d5, d5, d21\n\t"
-+                        "vqadd.u8     d4, d4, d20\n\t"
-+
-+// pack 8888 {d20-d23} to 0565 q10
-+                        "vshll.u8     q10, d6, #8\n\t"
-+                        "vshll.u8     q3, d5, #8\n\t"
-+                        "vshll.u8     q2, d4, #8\n\t"
-+                        "vsri.u16     q10, q3, #5\t\n"
-+                        "vsri.u16     q10, q2, #11\t\n"
-+
-+                        "tst  %[w], #1\n\t"
-+                        "beq skip_store1\t\n"
-+                        "vst1.16      {d20[1]}, [%[dst]]\t\n"
-+                        "skip_store1:\t\n"
-+                        "tst  %[w], #2\n\t"
-+                        "beq  skip_store2\t\n"
-+                        "vst1.32      {d20[1]}, [%[dst2]]\t\n"
-+                        "skip_store2:\t\n"
-+                        "tst  %[w], #4\n\t"
-+                        "beq skip_store4\t\n"
-+                        "vst1.16      {d21}, [%[dst4]]\t\n"
-+                        "skip_store4:\t\n"
-+
-+                        : [w] "+r" (w), [dst] "+r" (dst), [mask] "+r" (mask), [dst4] "+r" (dst4), [dst2] "+r" (dst2)
-+                        : [src] "r" (src)
-+                        : "ip", "cc", "memory", "d0","d1","d2","d3","d4","d5","d6","d7",
-+                          "d16","d17","d18","d19","d20","d21","d22","d23","d24","d25","d26","d27","d28","d29",
-+                          "d30","d31"
-+                        );
-+#endif
-+        }
-+    }
-+}
-+
-+
-+void
-+fbCompositeSolidMask_nx8x8888neon (pixman_op_t      op,
-+			       pixman_image_t * pSrc,
-+			       pixman_image_t * pMask,
-+			       pixman_image_t * pDst,
-+			       int16_t      xSrc,
-+			       int16_t      ySrc,
-+			       int16_t      xMask,
-+			       int16_t      yMask,
-+			       int16_t      xDst,
-+			       int16_t      yDst,
-+			       uint16_t     width,
-+			       uint16_t     height)
-+{
-+    uint32_t	 src, srca;
-+    uint32_t	*dstLine, *dst;
-+    uint8_t	*maskLine, *mask;
-+    int		 dstStride, maskStride;
-+    uint32_t	 w;
-+    uint8x8_t    sval2;
-+    uint8x8x4_t  sval8;
-+    uint8x8_t    mask_selector=vreinterpret_u8_u64(vcreate_u64(0x0101010100000000ULL));
-+    uint8x8_t    alpha_selector=vreinterpret_u8_u64(vcreate_u64(0x0707070703030303ULL));
-+
-+    fbComposeGetSolid(pSrc, src, pDst->bits.format);
-+
-+    srca = src >> 24;
-+    if (src == 0)
-+	return;
-+
-+    sval2=vreinterpret_u8_u32(vdup_n_u32(src));
-+    sval8.val[0]=vdup_lane_u8(sval2,0);
-+    sval8.val[1]=vdup_lane_u8(sval2,1);
-+    sval8.val[2]=vdup_lane_u8(sval2,2);
-+    sval8.val[3]=vdup_lane_u8(sval2,3);
-+
-+    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
-+    fbComposeGetStart (pMask, xMask, yMask, uint8_t, maskStride, maskLine, 1);
-+
-+    if (width>=8)
-+    {
-+        // Use overlapping 8-pixel method, modified to avoid rewritten dest being reused
-+        while (height--)
-+        {
-+            uint32_t *keep_dst;
-+
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            mask = maskLine;
-+            maskLine += maskStride;
-+            w = width;
-+
-+#ifndef USE_NEON_INLINE_ASM
-+            uint8x8_t alpha;
-+            uint8x8x4_t dval, temp;
-+
-+            alpha = vld1_u8((void*)mask);
-+            dval = vld4_u8((void*)dst);
-+            keep_dst = dst;
-+
-+            temp = neon8mul(sval8,alpha);
-+            dval = neon8mul(dval,vmvn_u8(temp.val[3]));
-+            temp = neon8qadd(temp,dval);
-+
-+            mask += (w & 7);
-+            dst += (w & 7);
-+            w -= (w & 7);
-+
-+            while (w)
-+            {
-+                alpha = vld1_u8((void*)mask);
-+                dval = vld4_u8((void*)dst);
-+
-+                vst4_u8((void*)keep_dst,temp);
-+                keep_dst = dst;
-+
-+                temp = neon8mul(sval8,alpha);
-+                dval = neon8mul(dval,vmvn_u8(temp.val[3]));
-+                temp = neon8qadd(temp,dval);
-+
-+                mask+=8;
-+                dst+=8;
-+                w-=8;
-+            }
-+            vst4_u8((void*)keep_dst,temp);
-+#else
-+        asm volatile (
-+                        "vdup.32      d0, %[src]\n\t"
-+                        "vdup.8       d1, d0[1]\n\t"
-+                        "vdup.8       d2, d0[2]\n\t"
-+                        "vdup.8       d3, d0[3]\n\t"
-+                        "vdup.8       d0, d0[0]\n\t"
-+
-+                        "vld4.8       {d4-d7}, [%[dst]]\n\t"
-+                        "vld1.8       {d31}, [%[mask]]\n\t"
-+                        "mov  %[keep_dst], %[dst]\n\t"
-+
-+                        "and  ip, %[w], #7\n\t"
-+                        "add  %[mask], %[mask], ip\n\t"
-+                        "add  %[dst], %[dst], ip, LSL#2\n\t"
-+                        "subs  %[w], %[w], ip\n\t"
-+                        "b 9f\n\t"
-+// LOOP
-+                        "2:\n\t" 
-+                        "vld4.8       {d4-d7}, [%[dst]]!\n\t"
-+                        "vld1.8       {d31}, [%[mask]]!\n\t"
-+                        "vst4.8       {d20-d23}, [%[keep_dst]]\n\t"
-+                        "sub  %[keep_dst], %[dst], #8*4\n\t"
-+                        "subs  %[w], %[w], #8\n\t"
-+                        "9:\n\t"
-+
-+                        "vmull.u8     q10, d31, d0\n\t"
-+                        "vmull.u8     q11, d31, d1\n\t"
-+                        "vmull.u8     q12, d31, d2\n\t"
-+                        "vmull.u8     q13, d31, d3\n\t"
-+                        "vrshr.u16    q8, q10, #8\n\t"
-+                        "vrshr.u16    q9, q11, #8\n\t"
-+                        "vraddhn.u16  d20, q10, q8\n\t"
-+                        "vraddhn.u16  d21, q11, q9\n\t"
-+                        "vrshr.u16    q9, q13, #8\n\t"
-+                        "vrshr.u16    q8, q12, #8\n\t"
-+                        "vraddhn.u16  d23, q13, q9\n\t"
-+                        "vraddhn.u16  d22, q12, q8\n\t"
-+
-+                        "vmvn.8       d30, d23\n\t"
-+                        "vmull.u8     q12, d30, d4\n\t"
-+                        "vmull.u8     q13, d30, d5\n\t"
-+                        "vmull.u8     q14, d30, d6\n\t"
-+                        "vmull.u8     q15, d30, d7\n\t"
-+
-+                        "vrshr.u16    q8, q12, #8\n\t"
-+                        "vrshr.u16    q9, q13, #8\n\t"
-+                        "vraddhn.u16  d4, q12, q8\n\t"
-+                        "vrshr.u16    q8, q14, #8\n\t"
-+                        "vraddhn.u16  d5, q13, q9\n\t"
-+                        "vrshr.u16    q9, q15, #8\n\t"
-+                        "vraddhn.u16  d6, q14, q8\n\t"
-+                        "vraddhn.u16  d7, q15, q9\n\t"
-+// result in d4-d7
-+
-+                        "vqadd.u8     d20, d4, d20\n\t"
-+                        "vqadd.u8     d21, d5, d21\n\t"
-+                        "vqadd.u8     d22, d6, d22\n\t"
-+                        "vqadd.u8     d23, d7, d23\n\t"
-+
-+                        "bne 2b\n\t"
-+
-+                        "1:\n\t"
-+                        "vst4.8       {d20-d23}, [%[keep_dst]]\n\t"
-+
-+                        : [w] "+r" (w), [dst] "+r" (dst), [mask] "+r" (mask), [keep_dst] "+r" (keep_dst)
-+                        : [src] "r" (src) 
-+                        : "ip", "cc", "memory", "d0","d1","d2","d3","d4","d5","d6","d7",
-+                          "d16","d17","d18","d19","d20","d21","d22","d23","d24","d25","d26","d27","d28","d29",
-+                          "d30","d31"
-+                        );
-+#endif
-+        }
-+    }
-+    else
-+    {
-+        while (height--)
-+        {
-+            uint8x8_t alpha;
-+
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            mask = maskLine;
-+            maskLine += maskStride;
-+            w = width;
-+
-+            while (w>=2)
-+            {
-+                uint8x8_t dval, temp, res;
-+
-+                alpha = vtbl1_u8(vreinterpret_u8_u16(vld1_dup_u16((void*)mask)), mask_selector);
-+                dval = vld1_u8((void*)dst);
-+
-+                temp = neon2mul(sval2,alpha);
-+                res = vqadd_u8(temp,neon2mul(dval,vtbl1_u8(vmvn_u8(temp), alpha_selector)));
-+
-+                vst1_u8((void*)dst,res);
-+
-+                mask+=2;
-+                dst+=2;
-+                w-=2;
-+            }
-+            if (w)
-+            {
-+                uint8x8_t dval, temp, res;
-+
-+                alpha = vtbl1_u8(vld1_dup_u8((void*)mask), mask_selector);
-+                dval = vreinterpret_u8_u32(vld1_dup_u32((void*)dst));
-+
-+                temp = neon2mul(sval2,alpha);
-+                res = vqadd_u8(temp,neon2mul(dval,vtbl1_u8(vmvn_u8(temp), alpha_selector)));
-+
-+                vst1_lane_u32((void*)dst,vreinterpret_u32_u8(res),0);
-+            }
-+        }
-+    }
-+}
-+
-+
-+void
-+fbCompositeSrcAdd_8888x8x8neon (pixman_op_t op,
-+                            pixman_image_t * pSrc,
-+                            pixman_image_t * pMask,
-+                            pixman_image_t * pDst,
-+                            int16_t      xSrc,
-+                            int16_t      ySrc,
-+                            int16_t      xMask,
-+                            int16_t      yMask,
-+                            int16_t      xDst,
-+                            int16_t      yDst,
-+                            uint16_t     width,
-+                            uint16_t     height)
-+{
-+    uint8_t     *dstLine, *dst;
-+    uint8_t     *maskLine, *mask;
-+    int dstStride, maskStride;
-+    uint32_t    w;
-+    uint32_t    src;
-+    uint8x8_t   sa;
-+
-+    fbComposeGetStart (pDst, xDst, yDst, uint8_t, dstStride, dstLine, 1);
-+    fbComposeGetStart (pMask, xMask, yMask, uint8_t, maskStride, maskLine, 1);
-+    fbComposeGetSolid (pSrc, src, pDst->bits.format);
-+    sa = vdup_n_u8((src) >> 24);
-+
-+    if (width>=8)
-+    {
-+        // Use overlapping 8-pixel method, modified to avoid rewritten dest being reused
-+        while (height--)
-+        {
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            mask = maskLine;
-+            maskLine += maskStride;
-+            w = width;
-+
-+            uint8x8_t mval, dval, res;
-+            uint8_t     *keep_dst;
-+
-+            mval = vld1_u8((void *)mask);
-+            dval = vld1_u8((void *)dst);
-+            keep_dst = dst;
-+
-+            res = vqadd_u8(neon2mul(mval,sa),dval);
-+
-+            mask += (w & 7);
-+            dst += (w & 7);
-+            w -= w & 7;
-+
-+            while (w)
-+            {
-+                mval = vld1_u8((void *)mask);
-+                dval = vld1_u8((void *)dst);
-+                vst1_u8((void *)keep_dst, res);
-+                keep_dst = dst;
-+
-+                res = vqadd_u8(neon2mul(mval,sa),dval);
-+
-+                mask += 8;
-+                dst += 8;
-+                w -= 8;
-+            }
-+            vst1_u8((void *)keep_dst, res);
-+        }
-+    }
-+    else
-+    {
-+        // Use 4/2/1 load/store method to handle 1-7 pixels
-+        while (height--)
-+        {
-+            dst = dstLine;
-+            dstLine += dstStride;
-+            mask = maskLine;
-+            maskLine += maskStride;
-+            w = width;
-+
-+            uint8x8_t mval, dval, res;
-+            uint8_t *dst4, *dst2;
-+
-+            if (w&4)
-+            {
-+                mval = vreinterpret_u8_u32(vld1_lane_u32((void *)mask, vreinterpret_u32_u8(mval), 1));
-+                dval = vreinterpret_u8_u32(vld1_lane_u32((void *)dst, vreinterpret_u32_u8(dval), 1));
-+
-+                dst4 = dst;
-+                mask += 4;
-+                dst += 4;
-+            }
-+            if (w&2)
-+            {
-+                mval = vreinterpret_u8_u16(vld1_lane_u16((void *)mask, vreinterpret_u16_u8(mval), 1));
-+                dval = vreinterpret_u8_u16(vld1_lane_u16((void *)dst, vreinterpret_u16_u8(dval), 1));
-+                dst2 = dst;
-+                mask += 2;
-+                dst += 2;
-+            }
-+            if (w&1)
-+            {
-+                mval = vld1_lane_u8((void *)mask, mval, 1);
-+                dval = vld1_lane_u8((void *)dst, dval, 1);
-+            }
-+
-+            res = vqadd_u8(neon2mul(mval,sa),dval);
-+
-+            if (w&1)
-+                vst1_lane_u8((void *)dst, res, 1);
-+            if (w&2)
-+                vst1_lane_u16((void *)dst2, vreinterpret_u16_u8(res), 1);
-+            if (w&4)
-+                vst1_lane_u32((void *)dst4, vreinterpret_u32_u8(res), 1);
-+        }
-+    }
-+}
-+
-diff --git a/pixman/pixman-arm-neon.h b/pixman/pixman-arm-neon.h
-new file mode 100644
-index 0000000..bab4dee
---- /dev/null
-+++ b/pixman/pixman-arm-neon.h
-@@ -0,0 +1,137 @@
-+/*
-+ * Copyright © 2009 Mozilla Corporation
-+ *
-+ * Permission to use, copy, modify, distribute, and sell this software and its
-+ * documentation for any purpose is hereby granted without fee, provided that
-+ * the above copyright notice appear in all copies and that both that
-+ * copyright notice and this permission notice appear in supporting
-+ * documentation, and that the name of Mozilla Corporation not be used in
-+ * advertising or publicity pertaining to distribution of the software without
-+ * specific, written prior permission.  Mozilla Corporation makes no
-+ * representations about the suitability of this software for any purpose.  It
-+ * is provided "as is" without express or implied warranty.
-+ *
-+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
-+ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
-+ * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
-+ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
-+ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
-+ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
-+ * SOFTWARE.
-+ *
-+ * Author:  Ian Rickards (ian.rickards@arm.com)
-+ *
-+ */
-+
-+#include "pixman-private.h"
-+
-+#ifdef USE_ARM_NEON
-+
-+static inline pixman_bool_t pixman_have_arm_neon(void) { return TRUE; }
-+
-+#else
-+#define pixman_have_arm_neon() FALSE
-+#endif
-+
-+#ifdef USE_ARM_NEON
-+
-+void
-+fbCompositeSrcAdd_8000x8000neon (pixman_op_t op,
-+                        pixman_image_t * pSrc,
-+                        pixman_image_t * pMask,
-+                        pixman_image_t * pDst,
-+                        int16_t      xSrc,
-+                        int16_t      ySrc,
-+                        int16_t      xMask,
-+                        int16_t      yMask,
-+                        int16_t      xDst,
-+                        int16_t      yDst,
-+                        uint16_t     width,
-+                        uint16_t     height);
-+
-+void
-+fbCompositeSrc_8888x8888neon (pixman_op_t op,
-+			pixman_image_t * pSrc,
-+			pixman_image_t * pMask,
-+			pixman_image_t * pDst,
-+			int16_t      xSrc,
-+			int16_t      ySrc,
-+			int16_t      xMask,
-+			int16_t      yMask,
-+			int16_t      xDst,
-+			int16_t      yDst,
-+			uint16_t     width,
-+			uint16_t     height);
-+
-+void
-+fbCompositeSrc_8888x8x8888neon (pixman_op_t op,
-+			pixman_image_t * pSrc,
-+			pixman_image_t * pMask,
-+			pixman_image_t * pDst,
-+			int16_t      xSrc,
-+			int16_t      ySrc,
-+			int16_t      xMask,
-+			int16_t      yMask,
-+			int16_t      xDst,
-+			int16_t      yDst,
-+			uint16_t     width,
-+			uint16_t     height);
-+
-+void
-+fbCompositeSolidMask_nx8x0565neon (pixman_op_t op,
-+                        pixman_image_t * pSrc,
-+                        pixman_image_t * pMask,
-+                        pixman_image_t * pDst,
-+                        int16_t      xSrc,
-+                        int16_t      ySrc,
-+                        int16_t      xMask,
-+                        int16_t      yMask,
-+                        int16_t      xDst,
-+                        int16_t      yDst,
-+                        uint16_t     width,
-+                        uint16_t     height);
-+
-+void
-+fbCompositeSolidMask_nx8x8888neon (pixman_op_t op,
-+			pixman_image_t * pSrc,
-+			pixman_image_t * pMask,
-+			pixman_image_t * pDst,
-+			int16_t      xSrc,
-+			int16_t      ySrc,
-+			int16_t      xMask,
-+			int16_t      yMask,
-+			int16_t      xDst,
-+			int16_t      yDst,
-+		 	uint16_t     width,
-+			uint16_t     height);
-+
-+void
-+fbCompositeSrc_x888x0565neon (pixman_op_t op,
-+                        pixman_image_t * pSrc,
-+                        pixman_image_t * pMask,
-+                        pixman_image_t * pDst,
-+                        int16_t      xSrc,
-+                        int16_t      ySrc,
-+                        int16_t      xMask,
-+                        int16_t      yMask,
-+                        int16_t      xDst,
-+                        int16_t      yDst,
-+                        uint16_t     width,
-+                        uint16_t     height);
-+
-+void
-+fbCompositeSrcAdd_8888x8x8neon (pixman_op_t op,
-+                        pixman_image_t * pSrc,
-+                        pixman_image_t * pMask,
-+                        pixman_image_t * pDst,
-+                        int16_t      xSrc,
-+                        int16_t      ySrc,
-+                        int16_t      xMask,
-+                        int16_t      yMask,
-+                        int16_t      xDst,
-+                        int16_t      yDst,
-+                        uint16_t     width,
-+                        uint16_t     height);
-+
-+#endif /* USE_ARM_NEON */
-diff --git a/pixman/pixman-pict.c b/pixman/pixman-pict.c
-index 1388517..b13947a 100644
---- a/pixman/pixman-pict.c
-+++ b/pixman/pixman-pict.c
-@@ -34,6 +34,7 @@
- #include "pixman-mmx.h"
- #include "pixman-vmx.h"
- #include "pixman-sse2.h"
-+#include "pixman-arm-neon.h"
- #include "pixman-arm-simd.h"
- #include "pixman-combine32.h"
- 
-@@ -1518,6 +1519,31 @@ static const FastPathInfo vmx_fast_paths[] =
- };
- #endif
- 
-+#ifdef USE_ARM_NEON
-+static const FastPathInfo arm_neon_fast_paths[] =
-+{
-+    { PIXMAN_OP_ADD,  PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8,       fbCompositeSrcAdd_8888x8x8neon,        0 },
-+    { PIXMAN_OP_ADD,  PIXMAN_a8,       PIXMAN_null,     PIXMAN_a8,       fbCompositeSrcAdd_8000x8000neon,       0 },
-+    { PIXMAN_OP_SRC,  PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_r5g6b5,   fbCompositeSrc_x888x0565neon,          0 },
-+    { PIXMAN_OP_SRC,  PIXMAN_x8r8g8b8, PIXMAN_null,     PIXMAN_r5g6b5,   fbCompositeSrc_x888x0565neon,          0 },
-+    { PIXMAN_OP_SRC,  PIXMAN_a8b8g8r8, PIXMAN_null,     PIXMAN_b5g6r5,   fbCompositeSrc_x888x0565neon,          0 },
-+    { PIXMAN_OP_SRC,  PIXMAN_x8b8g8r8, PIXMAN_null,     PIXMAN_b5g6r5,   fbCompositeSrc_x888x0565neon,          0 },
-+    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_a8r8g8b8, fbCompositeSrc_8888x8888neon,          0 },
-+    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_x8r8g8b8, fbCompositeSrc_8888x8888neon,          0 },
-+    { PIXMAN_OP_OVER, PIXMAN_a8b8g8r8, PIXMAN_null,     PIXMAN_a8b8g8r8, fbCompositeSrc_8888x8888neon,          0 },
-+    { PIXMAN_OP_OVER, PIXMAN_a8b8g8r8, PIXMAN_null,     PIXMAN_x8b8g8r8, fbCompositeSrc_8888x8888neon,          0 },
-+    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_a8,       PIXMAN_a8r8g8b8, fbCompositeSrc_8888x8x8888neon,        NEED_SOLID_MASK },
-+    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_a8,       PIXMAN_x8r8g8b8, fbCompositeSrc_8888x8x8888neon,        NEED_SOLID_MASK },
-+    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_r5g6b5,   fbCompositeSolidMask_nx8x0565neon,     0 },
-+    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_b5g6r5,   fbCompositeSolidMask_nx8x0565neon,     0 },
-+    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8r8g8b8, fbCompositeSolidMask_nx8x8888neon,     0 },
-+    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_x8r8g8b8, fbCompositeSolidMask_nx8x8888neon,     0 },
-+    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8b8g8r8, fbCompositeSolidMask_nx8x8888neon,     0 },
-+    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_x8b8g8r8, fbCompositeSolidMask_nx8x8888neon,     0 },
-+    { PIXMAN_OP_NONE },
-+};
-+#endif
-+
- #ifdef USE_ARM_SIMD
- static const FastPathInfo arm_simd_fast_paths[] =
- {
-@@ -1893,6 +1919,11 @@ pixman_image_composite (pixman_op_t      op,
- 	    info = get_fast_path (vmx_fast_paths, op, pSrc, pMask, pDst, pixbuf);
- #endif
- 
-+#ifdef USE_ARM_NEON
-+        if (!info && pixman_have_arm_neon())
-+            info = get_fast_path (arm_neon_fast_paths, op, pSrc, pMask, pDst, pixbuf);
-+#endif
-+
- #ifdef USE_ARM_SIMD
- 	if (!info && pixman_have_arm_simd())
- 	    info = get_fast_path (arm_simd_fast_paths, op, pSrc, pMask, pDst, pixbuf);
diff --git a/recipes/xorg-lib/pixman/pixman-28986.patch b/recipes/xorg-lib/pixman/pixman-28986.patch
deleted file mode 100644
index f5ba4c3..0000000
--- a/recipes/xorg-lib/pixman/pixman-28986.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7b7860d61fb1526acdf010dd8fd644bbf1396b9e Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Fri, 28 Aug 2009 22:34:21 +0300
-Subject: [PATCH] ARM: workaround for gcc bug in vshll_n_u8 intrinsic
-
-Some versions of gcc (cs2009q1, 4.4.1) incorrectly reject
-shift operand having value >= 8, claiming that it is out of
-range. So inline assembly is used as a workaround.
----
- pixman/pixman-arm-neon.c |    6 ++++++
- 1 files changed, 6 insertions(+), 0 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 4125d1b..3e7f566 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -64,6 +64,12 @@ unpack0565 (uint16x8_t rgb)
-     return res;
- }
- 
-+#ifdef USE_GCC_INLINE_ASM
-+/* Some versions of gcc have problems with vshll_n_u8 intrinsic (Bug 23576) */
-+#define vshll_n_u8(a, n) ({ uint16x8_t r; \
-+    asm ("vshll.u8 %q0, %P1, %2\n" : "=w" (r) : "w" (a), "i" (n)); r; })
-+#endif
-+
- static force_inline uint16x8_t
- pack0565 (uint8x8x4_t s)
- {
--- 
-1.5.4.3
-
diff --git a/recipes/xorg-lib/pixman/pixman-arm.patch b/recipes/xorg-lib/pixman/pixman-arm.patch
deleted file mode 100644
index 91dda03..0000000
--- a/recipes/xorg-lib/pixman/pixman-arm.patch
+++ /dev/null
@@ -1,632 +0,0 @@
-From: Jeff Muizelaar <jmuizelaar@mozilla.com>
-Date: Wed, 17 Sep 2008 19:53:20 +0000 (-0400)
-Subject: Add support for ARMv6 SIMD fastpaths.
-X-Git-Url: http://gitweb.freedesktop.org/?p=pixman.git;a=commitdiff;h=d0b181f347ef4720d130beee3f03196afbd28aba
-
-Add support for ARMv6 SIMD fastpaths.
----
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -277,6 +277,44 @@ AC_SUBST(VMX_CFLAGS)
- 
- AM_CONDITIONAL(USE_VMX, test $have_vmx_intrinsics = yes)
- 
-+dnl Check for ARM
-+
-+have_armv6_simd=no
-+AC_MSG_CHECKING(whether to use ARM assembler)
-+xserver_save_CFLAGS=$CFLAGS
-+CFLAGS="$CFLAGS $ARM_CFLAGS"
-+AC_COMPILE_IFELSE([
-+int main () {
-+    asm("uqadd8 r1, r1, r2");
-+    return 0;
-+}], have_armv6_simd=yes)
-+CFLAGS=$xserver_save_CFLAGS
-+
-+AC_ARG_ENABLE(arm,
-+   [AC_HELP_STRING([--disable-arm],
-+                   [disable ARM fast paths])],
-+   [enable_arm=$enableval], [enable_arm=auto])
-+
-+if test $enable_arm = no ; then
-+   have_armv6_simd=disabled
-+fi
-+
-+if test $have_armv6_simd = yes ; then
-+   AC_DEFINE(USE_ARM, 1, [use ARM compiler intrinsics])
-+else
-+   ARM_CFLAGS=
-+fi
-+
-+AC_MSG_RESULT($have_armv6_simd)
-+if test $enable_arm = yes && test $have_armv6_simd = no ; then
-+   AC_MSG_ERROR([ARM intrinsics not detected])
-+fi
-+
-+AC_SUBST(ARM_CFLAGS)
-+
-+AM_CONDITIONAL(USE_ARM, test $have_armv6_simd = yes)
-+
-+
- AC_ARG_ENABLE(gtk,
-    [AC_HELP_STRING([--enable-gtk],
-                    [enable tests using GTK+ [default=auto]])],
---- a/pixman/Makefile.am
-+++ b/pixman/Makefile.am
-@@ -79,3 +79,15 @@ libpixman_sse2_la_LIBADD = $(DEP_LIBS)
- libpixman_1_la_LIBADD += libpixman-sse2.la
- endif
- 
-+# arm code
-+if USE_ARM
-+noinst_LTLIBRARIES += libpixman-arm.la
-+libpixman_arm_la_SOURCES = \
-+	pixman-arm.c \
-+	pixman-arm.h
-+libpixman_arm_la_CFLAGS = $(DEP_CFLAGS) $(ARM_CFLAGS)
-+libpixman_arm_la_LIBADD = $(DEP_LIBS)
-+libpixman_1_la_LIBADD += libpixman-arm.la
-+endif
-+
-+
---- /dev/null
-+++ b/pixman/pixman-arm.c
-@@ -0,0 +1,409 @@
-+/*
-+ * Copyright Â© 2008 Mozilla Corporation
-+ *
-+ * Permission to use, copy, modify, distribute, and sell this software and its
-+ * documentation for any purpose is hereby granted without fee, provided that
-+ * the above copyright notice appear in all copies and that both that
-+ * copyright notice and this permission notice appear in supporting
-+ * documentation, and that the name of Mozilla Corporation not be used in
-+ * advertising or publicity pertaining to distribution of the software without
-+ * specific, written prior permission.  Mozilla Corporation makes no
-+ * representations about the suitability of this software for any purpose.  It
-+ * is provided "as is" without express or implied warranty.
-+ *
-+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
-+ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
-+ * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
-+ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
-+ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
-+ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
-+ * SOFTWARE.
-+ *
-+ * Author:  Jeff Muizelaar (jeff@infidigm.net)
-+ *
-+ */
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
-+
-+#include "pixman-arm.h"
-+
-+void
-+fbCompositeSrcAdd_8000x8000arm (pixman_op_t op,
-+				pixman_image_t * pSrc,
-+				pixman_image_t * pMask,
-+				pixman_image_t * pDst,
-+				int16_t      xSrc,
-+				int16_t      ySrc,
-+				int16_t      xMask,
-+				int16_t      yMask,
-+				int16_t      xDst,
-+				int16_t      yDst,
-+				uint16_t     width,
-+				uint16_t     height)
-+{
-+    uint8_t	*dstLine, *dst;
-+    uint8_t	*srcLine, *src;
-+    int	dstStride, srcStride;
-+    uint16_t	w;
-+    uint8_t	s, d;
-+
-+    fbComposeGetStart (pSrc, xSrc, ySrc, uint8_t, srcStride, srcLine, 1);
-+    fbComposeGetStart (pDst, xDst, yDst, uint8_t, dstStride, dstLine, 1);
-+
-+    while (height--)
-+    {
-+	dst = dstLine;
-+	dstLine += dstStride;
-+	src = srcLine;
-+	srcLine += srcStride;
-+	w = width;
-+
-+	while (w && (unsigned long)dst & 3)
-+	{
-+	    s = *src;
-+	    d = *dst;
-+	    asm("uqadd8 %0, %1, %2" : "+r"(d) : "r"(s));
-+	    *dst = d;
-+
-+	    dst++;
-+	    src++;
-+	    w--;
-+	}
-+
-+	while (w >= 4)
-+	{
-+	    asm("uqadd8 %0, %1, %2" : "=r"(*(uint32_t*)dst) : "r"(*(uint32_t*)src), "r"(*(uint32_t*)dst));
-+	    dst += 4;
-+	    src += 4;
-+	    w -= 4;
-+	}
-+
-+	while (w)
-+	{
-+	    s = *src;
-+	    d = *dst;
-+	    asm("uqadd8 %0, %1, %2" : "+r"(d) : "r"(s));
-+	    *dst = d;
-+
-+	    dst++;
-+	    src++;
-+	    w--;
-+	}
-+    }
-+
-+}
-+
-+void
-+fbCompositeSrc_8888x8888arm (pixman_op_t op,
-+			 pixman_image_t * pSrc,
-+			 pixman_image_t * pMask,
-+			 pixman_image_t * pDst,
-+			 int16_t      xSrc,
-+			 int16_t      ySrc,
-+			 int16_t      xMask,
-+			 int16_t      yMask,
-+			 int16_t      xDst,
-+			 int16_t      yDst,
-+			 uint16_t     width,
-+			 uint16_t     height)
-+{
-+    uint32_t	*dstLine, *dst;
-+    uint32_t	*srcLine, *src;
-+    int	dstStride, srcStride;
-+    uint16_t	w;
-+    uint32_t component_half = 0x800080;
-+    uint32_t upper_component_mask = 0xff00ff00;
-+    uint32_t alpha_mask = 0xff;
-+
-+    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
-+    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
-+
-+    while (height--)
-+    {
-+	dst = dstLine;
-+	dstLine += dstStride;
-+	src = srcLine;
-+	srcLine += srcStride;
-+	w = width;
-+
-+//#define inner_branch
-+	asm volatile (
-+			"cmp %[w], #0\n\t"
-+			"beq 2f\n\t"
-+			"1:\n\t"
-+			/* load dest */
-+			"ldr r5, [%[src]], #4\n\t"
-+#ifdef inner_branch
-+			/* We can avoid doing the multiplication in two cases: 0x0 or 0xff.
-+			 * The 0x0 case also allows us to avoid doing an unecessary data
-+			 * write which is more valuable so we only check for that */
-+			"cmp r5, #0x1000000\n\t"
-+			"blt 3f\n\t"
-+
-+			/* = 255 - alpha */
-+			"sub r8, %[alpha_mask], r5, lsr #24\n\t"
-+
-+			"ldr r4, [%[dest]] \n\t"
-+
-+#else
-+			"ldr r4, [%[dest]] \n\t"
-+
-+			/* = 255 - alpha */
-+			"sub r8, %[alpha_mask], r5, lsr #24\n\t"
-+#endif
-+			"uxtb16 r6, r4\n\t"
-+			"uxtb16 r7, r4, ror #8\n\t"
-+
-+			/* multiply by 257 and divide by 65536 */
-+			"mla r6, r6, r8, %[component_half]\n\t"
-+			"mla r7, r7, r8, %[component_half]\n\t"
-+
-+			"uxtab16 r6, r6, r6, ror #8\n\t"
-+			"uxtab16 r7, r7, r7, ror #8\n\t"
-+
-+			/* recombine the 0xff00ff00 bytes of r6 and r7 */
-+			"and r7, %[upper_component_mask]\n\t"
-+			"uxtab16 r6, r7, r6, ror #8\n\t"
-+
-+			"uqadd8 r5, r6, r5\n\t"
-+
-+#ifdef inner_branch
-+			"3:\n\t"
-+
-+#endif
-+			"str r5, [%[dest]], #4\n\t"
-+			/* increment counter and jmp to top */
-+			"subs	%[w], %[w], #1\n\t"
-+			"bne	1b\n\t"
-+			"2:\n\t"
-+			: [w] "+r" (w), [dest] "+r" (dst), [src] "+r" (src)
-+			: [component_half] "r" (component_half), [upper_component_mask] "r" (upper_component_mask),
-+			  [alpha_mask] "r" (alpha_mask)
-+			: "r4", "r5", "r6", "r7", "r8", "cc", "memory"
-+			);
-+    }
-+}
-+
-+void
-+fbCompositeSrc_8888x8x8888arm (pixman_op_t op,
-+			       pixman_image_t * pSrc,
-+			       pixman_image_t * pMask,
-+			       pixman_image_t * pDst,
-+			       int16_t	xSrc,
-+			       int16_t	ySrc,
-+			       int16_t      xMask,
-+			       int16_t      yMask,
-+			       int16_t      xDst,
-+			       int16_t      yDst,
-+			       uint16_t     width,
-+			       uint16_t     height)
-+{
-+    uint32_t	*dstLine, *dst;
-+    uint32_t	*srcLine, *src;
-+    uint32_t	mask;
-+    int	dstStride, srcStride;
-+    uint16_t	w;
-+    uint32_t component_half = 0x800080;
-+    uint32_t alpha_mask = 0xff;
-+
-+    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
-+    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
-+
-+    fbComposeGetSolid (pMask, mask, pDst->bits.format);
-+    mask = (mask) >> 24;
-+
-+    while (height--)
-+    {
-+	dst = dstLine;
-+	dstLine += dstStride;
-+	src = srcLine;
-+	srcLine += srcStride;
-+	w = width;
-+
-+//#define inner_branch
-+	asm volatile (
-+			"cmp %[w], #0\n\t"
-+			"beq 2f\n\t"
-+			"1:\n\t"
-+			/* load dest */
-+			"ldr r5, [%[src]], #4\n\t"
-+#ifdef inner_branch
-+			/* We can avoid doing the multiplication in two cases: 0x0 or 0xff.
-+			 * The 0x0 case also allows us to avoid doing an unecessary data
-+			 * write which is more valuable so we only check for that */
-+			"cmp r5, #0x1000000\n\t"
-+			"blt 3f\n\t"
-+
-+#endif
-+			"ldr r4, [%[dest]] \n\t"
-+
-+			"uxtb16 r6, r5\n\t"
-+			"uxtb16 r7, r5, ror #8\n\t"
-+
-+			/* multiply by alpha (r8) then by 257 and divide by 65536 */
-+			"mla r6, r6, %[mask_alpha], %[component_half]\n\t"
-+			"mla r7, r7, %[mask_alpha], %[component_half]\n\t"
-+
-+			"uxtab16 r6, r6, r6, ror #8\n\t"
-+			"uxtab16 r7, r7, r7, ror #8\n\t"
-+
-+			"uxtb16 r6, r6, ror #8\n\t"
-+			"uxtb16 r7, r7, ror #8\n\t"
-+
-+			/* recombine */
-+			"orr r5, r6, r7, lsl #8\n\t"
-+
-+			"uxtb16 r6, r4\n\t"
-+			"uxtb16 r7, r4, ror #8\n\t"
-+
-+			/* 255 - alpha */
-+			"sub r8, %[alpha_mask], r5, lsr #24\n\t"
-+
-+			/* multiply by alpha (r8) then by 257 and divide by 65536 */
-+			"mla r6, r6, r8, %[component_half]\n\t"
-+			"mla r7, r7, r8, %[component_half]\n\t"
-+
-+			"uxtab16 r6, r6, r6, ror #8\n\t"
-+			"uxtab16 r7, r7, r7, ror #8\n\t"
-+
-+			"uxtb16 r6, r6, ror #8\n\t"
-+			"uxtb16 r7, r7, ror #8\n\t"
-+
-+			/* recombine */
-+			"orr r6, r6, r7, lsl #8\n\t"
-+
-+			"uqadd8 r5, r6, r5\n\t"
-+
-+#ifdef inner_branch
-+			"3:\n\t"
-+
-+#endif
-+			"str r5, [%[dest]], #4\n\t"
-+			/* increment counter and jmp to top */
-+			"subs	%[w], %[w], #1\n\t"
-+			"bne	1b\n\t"
-+			"2:\n\t"
-+			: [w] "+r" (w), [dest] "+r" (dst), [src] "+r" (src)
-+			: [component_half] "r" (component_half), [mask_alpha] "r" (mask),
-+			  [alpha_mask] "r" (alpha_mask)
-+			: "r4", "r5", "r6", "r7", "r8", "r9", "cc", "memory"
-+			);
-+    }
-+}
-+
-+void
-+fbCompositeSolidMask_nx8x8888arm (pixman_op_t      op,
-+			       pixman_image_t * pSrc,
-+			       pixman_image_t * pMask,
-+			       pixman_image_t * pDst,
-+			       int16_t      xSrc,
-+			       int16_t      ySrc,
-+			       int16_t      xMask,
-+			       int16_t      yMask,
-+			       int16_t      xDst,
-+			       int16_t      yDst,
-+			       uint16_t     width,
-+			       uint16_t     height)
-+{
-+    uint32_t	 src, srca;
-+    uint32_t	*dstLine, *dst;
-+    uint8_t	*maskLine, *mask;
-+    int		 dstStride, maskStride;
-+    uint16_t	 w;
-+
-+    fbComposeGetSolid(pSrc, src, pDst->bits.format);
-+
-+    srca = src >> 24;
-+    if (src == 0)
-+	return;
-+
-+    uint32_t component_mask = 0xff00ff;
-+    uint32_t component_half = 0x800080;
-+
-+    uint32_t src_hi = (src >> 8) & component_mask;
-+    uint32_t src_lo = src & component_mask;
-+
-+    fbComposeGetStart (pDst, xDst, yDst, uint32_t, dstStride, dstLine, 1);
-+    fbComposeGetStart (pMask, xMask, yMask, uint8_t, maskStride, maskLine, 1);
-+
-+    while (height--)
-+    {
-+	dst = dstLine;
-+	dstLine += dstStride;
-+	mask = maskLine;
-+	maskLine += maskStride;
-+	w = width;
-+
-+//#define inner_branch
-+	asm volatile (
-+			"cmp %[w], #0\n\t"
-+			"beq 2f\n\t"
-+			"1:\n\t"
-+			/* load mask */
-+			"ldrb r5, [%[mask]], #1\n\t"
-+#ifdef inner_branch
-+			/* We can avoid doing the multiplication in two cases: 0x0 or 0xff.
-+			 * The 0x0 case also allows us to avoid doing an unecessary data
-+			 * write which is more valuable so we only check for that */
-+			/* 0x1000000 is the least value that contains alpha all values
-+			 * less than it have a 0 alpha value */
-+			"cmp r5, #0x0\n\t"
-+			"beq 3f\n\t"
-+
-+#endif
-+			"ldr r4, [%[dest]] \n\t"
-+
-+			/* multiply by alpha (r8) then by 257 and divide by 65536 */
-+			"mla r6, %[src_lo], r5, %[component_half]\n\t"
-+			"mla r7, %[src_hi], r5, %[component_half]\n\t"
-+
-+			"uxtab16 r6, r6, r6, ror #8\n\t"
-+			"uxtab16 r7, r7, r7, ror #8\n\t"
-+
-+			"uxtb16 r6, r6, ror #8\n\t"
-+			"uxtb16 r7, r7, ror #8\n\t"
-+
-+			/* recombine */
-+			"orr r5, r6, r7, lsl #8\n\t"
-+
-+			"uxtb16 r6, r4\n\t"
-+			"uxtb16 r7, r4, ror #8\n\t"
-+
-+			/* we could simplify this to use 'sub' if we were
-+			 * willing to give up a register for alpha_mask */
-+			"mvn r8, r5\n\t"
-+			"mov r8, r8, lsr #24\n\t"
-+
-+			/* multiply by alpha (r8) then by 257 and divide by 65536 */
-+			"mla r6, r6, r8, %[component_half]\n\t"
-+			"mla r7, r7, r8, %[component_half]\n\t"
-+
-+			"uxtab16 r6, r6, r6, ror #8\n\t"
-+			"uxtab16 r7, r7, r7, ror #8\n\t"
-+
-+			"uxtb16 r6, r6, ror #8\n\t"
-+			"uxtb16 r7, r7, ror #8\n\t"
-+
-+			/* recombine */
-+			"orr r6, r6, r7, lsl #8\n\t"
-+
-+			"uqadd8 r5, r6, r5\n\t"
-+
-+#ifdef inner_branch
-+			"3:\n\t"
-+
-+#endif
-+			"str r5, [%[dest]], #4\n\t"
-+			/* increment counter and jmp to top */
-+			"subs	%[w], %[w], #1\n\t"
-+			"bne	1b\n\t"
-+			"2:\n\t"
-+			: [w] "+r" (w), [dest] "+r" (dst), [src] "+r" (src), [mask] "+r" (mask)
-+			: [component_half] "r" (component_half),
-+			  [src_hi] "r" (src_hi), [src_lo] "r" (src_lo)
-+			: "r4", "r5", "r6", "r7", "r8", "cc", "memory"
-+			);
-+    }
-+}
---- /dev/null
-+++ b/pixman/pixman-arm.h
-@@ -0,0 +1,94 @@
-+/*
-+ * Copyright Â© 2008 Mozilla Corporation
-+ *
-+ * Permission to use, copy, modify, distribute, and sell this software and its
-+ * documentation for any purpose is hereby granted without fee, provided that
-+ * the above copyright notice appear in all copies and that both that
-+ * copyright notice and this permission notice appear in supporting
-+ * documentation, and that the name of Mozilla Corporation not be used in
-+ * advertising or publicity pertaining to distribution of the software without
-+ * specific, written prior permission.  Mozilla Corporation makes no
-+ * representations about the suitability of this software for any purpose.  It
-+ * is provided "as is" without express or implied warranty.
-+ *
-+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
-+ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
-+ * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
-+ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
-+ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
-+ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
-+ * SOFTWARE.
-+ *
-+ * Author:  Jeff Muizelaar (jeff@infidigm.net)
-+ *
-+ */
-+
-+#include "pixman-private.h"
-+
-+#ifdef USE_ARM
-+
-+static inline pixman_bool_t pixman_have_arm(void) { return TRUE; }
-+
-+#else
-+#define pixman_have_arm() FALSE
-+#endif
-+
-+#ifdef USE_ARM
-+
-+void
-+fbCompositeSrcAdd_8000x8000arm (pixman_op_t op,
-+				pixman_image_t * pSrc,
-+				pixman_image_t * pMask,
-+				pixman_image_t * pDst,
-+				int16_t      xSrc,
-+				int16_t      ySrc,
-+				int16_t      xMask,
-+				int16_t      yMask,
-+				int16_t      xDst,
-+				int16_t      yDst,
-+				uint16_t     width,
-+				uint16_t     height);
-+void
-+fbCompositeSrc_8888x8888arm (pixman_op_t op,
-+			 pixman_image_t * pSrc,
-+			 pixman_image_t * pMask,
-+			 pixman_image_t * pDst,
-+			 int16_t      xSrc,
-+			 int16_t      ySrc,
-+			 int16_t      xMask,
-+			 int16_t      yMask,
-+			 int16_t      xDst,
-+			 int16_t      yDst,
-+			 uint16_t     width,
-+			 uint16_t     height);
-+
-+void
-+fbCompositeSrc_8888x8x8888arm (pixman_op_t op,
-+			 pixman_image_t * pSrc,
-+			 pixman_image_t * pMask,
-+			 pixman_image_t * pDst,
-+			 int16_t      xSrc,
-+			 int16_t      ySrc,
-+			 int16_t      xMask,
-+			 int16_t      yMask,
-+			 int16_t      xDst,
-+			 int16_t      yDst,
-+			 uint16_t     width,
-+			 uint16_t     height);
-+void
-+fbCompositeSolidMask_nx8x8888arm (pixman_op_t op,
-+			 pixman_image_t * pSrc,
-+			 pixman_image_t * pMask,
-+			 pixman_image_t * pDst,
-+			 int16_t      xSrc,
-+			 int16_t      ySrc,
-+			 int16_t      xMask,
-+			 int16_t      yMask,
-+			 int16_t      xDst,
-+			 int16_t      yDst,
-+			 uint16_t     width,
-+			 uint16_t     height);
-+
-+
-+#endif /* USE_ARM */
---- a/pixman/pixman-pict.c
-+++ b/pixman/pixman-pict.c
-@@ -34,6 +34,7 @@
- #include "pixman-mmx.h"
- #include "pixman-vmx.h"
- #include "pixman-sse2.h"
-+#include "pixman-arm.h"
- #include "pixman-combine32.h"
- 
- #ifdef __GNUC__
-@@ -1479,6 +1480,26 @@ static const FastPathInfo vmx_fast_paths
- };
- #endif
- 
-+#ifdef USE_ARM
-+static const FastPathInfo arm_fast_paths[] =
-+{
-+    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_a8r8g8b8, fbCompositeSrc_8888x8888arm,      0 },
-+    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,	PIXMAN_x8r8g8b8, fbCompositeSrc_8888x8888arm,	   0 },
-+    { PIXMAN_OP_OVER, PIXMAN_a8b8g8r8, PIXMAN_null,	PIXMAN_a8b8g8r8, fbCompositeSrc_8888x8888arm,	   0 },
-+    { PIXMAN_OP_OVER, PIXMAN_a8b8g8r8, PIXMAN_null,	PIXMAN_x8b8g8r8, fbCompositeSrc_8888x8888arm,	   0 },
-+    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_a8,       PIXMAN_a8r8g8b8, fbCompositeSrc_8888x8x8888arm,    NEED_SOLID_MASK },
-+    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_a8,       PIXMAN_x8r8g8b8, fbCompositeSrc_8888x8x8888arm,	   NEED_SOLID_MASK },
-+
-+    { PIXMAN_OP_ADD, PIXMAN_a8,        PIXMAN_null,     PIXMAN_a8,       fbCompositeSrcAdd_8000x8000arm,   0 },
-+
-+    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8r8g8b8, fbCompositeSolidMask_nx8x8888arm,     0 },
-+    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_x8r8g8b8, fbCompositeSolidMask_nx8x8888arm,     0 },
-+    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8b8g8r8, fbCompositeSolidMask_nx8x8888arm,     0 },
-+    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_a8,       PIXMAN_x8b8g8r8, fbCompositeSolidMask_nx8x8888arm,     0 },
-+
-+    { PIXMAN_OP_NONE },
-+};
-+#endif
- 
- static const FastPathInfo c_fast_paths[] =
- {
-@@ -1829,6 +1850,12 @@ pixman_image_composite (pixman_op_t     
- 	if (!info && pixman_have_vmx())
- 	    info = get_fast_path (vmx_fast_paths, op, pSrc, pMask, pDst, pixbuf);
- #endif
-+
-+#ifdef USE_ARM
-+	if (!info && pixman_have_arm())
-+	    info = get_fast_path (arm_fast_paths, op, pSrc, pMask, pDst, pixbuf);
-+#endif
-+
-         if (!info)
- 	    info = get_fast_path (c_fast_paths, op, pSrc, pMask, pDst, pixbuf);
- 
diff --git a/recipes/xorg-lib/pixman/pixman-x888-565.patch b/recipes/xorg-lib/pixman/pixman-x888-565.patch
deleted file mode 100644
index a3fa331..0000000
--- a/recipes/xorg-lib/pixman/pixman-x888-565.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From: Vladimir Vukicevic <vladimir@slide.(none)>
-Date: Wed, 17 Sep 2008 20:01:31 +0000 (-0400)
-Subject: Add SRC x888x0565 C fast path
-X-Git-Url: http://gitweb.freedesktop.org/?p=pixman.git;a=commitdiff;h=7180230d4d87c55dfef1e17a0cc3b125d45aa3a0
-
-Add SRC x888x0565 C fast path
----
-
---- a/pixman/pixman-pict.c
-+++ b/pixman/pixman-pict.c
-@@ -759,6 +759,46 @@ fbCompositeSrc_8888x0565 (pixman_op_t op
-     }
- }
- 
-+
-+void
-+fbCompositeSrc_x888x0565 (pixman_op_t op,
-+                          pixman_image_t * pSrc,
-+                          pixman_image_t * pMask,
-+                          pixman_image_t * pDst,
-+                          int16_t      xSrc,
-+                          int16_t      ySrc,
-+                          int16_t      xMask,
-+                          int16_t      yMask,
-+                          int16_t      xDst,
-+                          int16_t      yDst,
-+                          uint16_t     width,
-+                          uint16_t     height)
-+{
-+    uint16_t	*dstLine, *dst;
-+    uint32_t	*srcLine, *src, s;
-+    int	dstStride, srcStride;
-+    uint16_t	w;
-+
-+    fbComposeGetStart (pSrc, xSrc, ySrc, uint32_t, srcStride, srcLine, 1);
-+    fbComposeGetStart (pDst, xDst, yDst, uint16_t, dstStride, dstLine, 1);
-+
-+    while (height--)
-+    {
-+	dst = dstLine;
-+	dstLine += dstStride;
-+	src = srcLine;
-+	srcLine += srcStride;
-+	w = width;
-+
-+	while (w--)
-+	{
-+	    s = READ(pSrc, src++);
-+	    WRITE(pDst, dst, cvt8888to0565(s));
-+	    dst++;
-+	}
-+    }
-+}
-+
- void
- fbCompositeSrcAdd_8000x8000 (pixman_op_t	op,
- 			     pixman_image_t * pSrc,
-@@ -1568,6 +1608,10 @@ static const FastPathInfo c_fast_paths[]
-     { PIXMAN_OP_SRC, PIXMAN_r5g6b5,    PIXMAN_null,     PIXMAN_r5g6b5,   fbCompositeSrcSrc_nxn, 0 },
-     { PIXMAN_OP_SRC, PIXMAN_b5g6r5,    PIXMAN_null,     PIXMAN_b5g6r5,   fbCompositeSrcSrc_nxn, 0 },
- #endif
-+    { PIXMAN_OP_SRC, PIXMAN_a8r8g8b8,  PIXMAN_null,     PIXMAN_r5g6b5,   fbCompositeSrc_x888x0565, 0 },
-+    { PIXMAN_OP_SRC, PIXMAN_x8r8g8b8,  PIXMAN_null,     PIXMAN_r5g6b5,   fbCompositeSrc_x888x0565, 0 },
-+    { PIXMAN_OP_SRC, PIXMAN_a8b8g8r8,  PIXMAN_null,     PIXMAN_b5g6r5,   fbCompositeSrc_x888x0565, 0 },
-+    { PIXMAN_OP_SRC, PIXMAN_x8b8g8r8,  PIXMAN_null,     PIXMAN_b5g6r5,   fbCompositeSrc_x888x0565, 0 },
-     { PIXMAN_OP_IN,  PIXMAN_a8,        PIXMAN_null,     PIXMAN_a8,       fbCompositeSrcIn_8x8,   0 },
-     { PIXMAN_OP_IN,  PIXMAN_solid,     PIXMAN_a8,	PIXMAN_a8,	 fbCompositeSolidMaskIn_nx8x8, 0 },
-     { PIXMAN_OP_NONE },
diff --git a/recipes/xorg-lib/pixman/prefetch.patch b/recipes/xorg-lib/pixman/prefetch.patch
deleted file mode 100644
index c2e856e..0000000
--- a/recipes/xorg-lib/pixman/prefetch.patch
+++ /dev/null
@@ -1,298 +0,0 @@
-From d0044bfbd596f22ed1560579ea6537b39f3dc1af Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 29 Oct 2009 19:06:42 +0000
-Subject: ARM: Don't emit prefetch code if prefetch distance is set to 0
-
-Also it is now possible to disable prefetch globally with
-a configuration macro
----
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index bca499a..35e6a7e 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -219,33 +219,33 @@
-     vshrn.u16   d7, q2, #3
-     vsli.u16    q2, q2, #5
-         vshll.u8    q14, d16, #8
--                                    add PF_X, PF_X, #8
-+                                    PF add PF_X, PF_X, #8
-         vshll.u8    q8, d19, #8
--                                    tst PF_CTL, #0xF
-+                                    PF tst PF_CTL, #0xF
-     vsri.u8     d6, d6, #5
--                                    addne PF_X, PF_X, #8
-+                                    PF addne PF_X, PF_X, #8
-     vmvn.8      d3, d3
--                                    subne PF_CTL, PF_CTL, #1
-+                                    PF subne PF_CTL, PF_CTL, #1
-     vsri.u8     d7, d7, #6
-     vshrn.u16   d30, q2, #2
-     vmull.u8    q10, d3, d6
--                                    pld [PF_SRC, PF_X, lsl #src_bpp_shift]
-+                                    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
-     vmull.u8    q11, d3, d7
-     vmull.u8    q12, d3, d30
--                                    pld [PF_DST, PF_X, lsl #dst_bpp_shift]
-+                                    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
-         vsri.u16    q14, q8, #5
--                                    cmp PF_X, ORIG_W
-+                                    PF cmp PF_X, ORIG_W
-         vshll.u8    q9, d18, #8
-     vrshr.u16   q13, q10, #8
--                                    subge PF_X, PF_X, ORIG_W
-+                                    PF subge PF_X, PF_X, ORIG_W
-     vrshr.u16   q3, q11, #8
-     vrshr.u16   q15, q12, #8
--                                    subges PF_CTL, PF_CTL, #0x10
-+                                    PF subges PF_CTL, PF_CTL, #0x10
-         vsri.u16    q14, q9, #11
--                                    ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
-+                                    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
-     vraddhn.u16 d20, q10, q13
-     vraddhn.u16 d23, q11, q3
--                                    ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
-+                                    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
-     vraddhn.u16 d22, q12, q15
-         vst1.16     {d28, d29}, [DST_W, :128]!
- .endm
-@@ -323,20 +323,20 @@ generate_composite_function \
- 
- .macro pixman_composite_src_8888_0565_process_pixblock_tail_head
-         vsri.u16    q14, q8, #5
--                                    add PF_X, PF_X, #8
--                                    tst PF_CTL, #0xF
-+                                    PF add PF_X, PF_X, #8
-+                                    PF tst PF_CTL, #0xF
-     vld4.8      {d0, d1, d2, d3}, [SRC]!
--                                    addne PF_X, PF_X, #8
--                                    subne PF_CTL, PF_CTL, #1
-+                                    PF addne PF_X, PF_X, #8
-+                                    PF subne PF_CTL, PF_CTL, #1
-         vsri.u16    q14, q9, #11
--                                    cmp PF_X, ORIG_W
--                                    pld [PF_SRC, PF_X, lsl #src_bpp_shift]
-+                                    PF cmp PF_X, ORIG_W
-+                                    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
-     vshll.u8    q8, d1, #8
-         vst1.16     {d28, d29}, [DST_W, :128]!
--                                    subge PF_X, PF_X, ORIG_W
--                                    subges PF_CTL, PF_CTL, #0x10
-+                                    PF subge PF_X, PF_X, ORIG_W
-+                                    PF subges PF_CTL, PF_CTL, #0x10
-     vshll.u8    q14, d2, #8
--                                    ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
-+                                    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
-     vshll.u8    q9, d0, #8
- .endm
- 
-@@ -363,20 +363,20 @@ generate_composite_function \
- 
- .macro pixman_composite_add_8000_8000_process_pixblock_tail_head
-     vld1.8      {d0, d1, d2, d3}, [SRC]!
--                                    add PF_X, PF_X, #32
--                                    tst PF_CTL, #0xF
-+                                    PF add PF_X, PF_X, #32
-+                                    PF tst PF_CTL, #0xF
-     vld1.8      {d4, d5, d6, d7}, [DST_R, :128]!
--                                    addne PF_X, PF_X, #32
--                                    subne PF_CTL, PF_CTL, #1
-+                                    PF addne PF_X, PF_X, #32
-+                                    PF subne PF_CTL, PF_CTL, #1
-         vst1.8      {d28, d29, d30, d31}, [DST_W, :128]!
--                                    cmp PF_X, ORIG_W
--                                    pld [PF_SRC, PF_X, lsl #src_bpp_shift]
--                                    pld [PF_DST, PF_X, lsl #dst_bpp_shift]
--                                    subge PF_X, PF_X, ORIG_W
--                                    subges PF_CTL, PF_CTL, #0x10
-+                                    PF cmp PF_X, ORIG_W
-+                                    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
-+                                    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
-+                                    PF subge PF_X, PF_X, ORIG_W
-+                                    PF subges PF_CTL, PF_CTL, #0x10
-     vqadd.u8    q14, q0, q2
--                                    ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
--                                    ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
-+                                    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
-+                                    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
-     vqadd.u8    q15, q1, q3
- .endm
- 
-@@ -418,32 +418,32 @@ generate_composite_function \
- .macro pixman_composite_over_8888_8888_process_pixblock_tail_head
-     vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
-         vrshr.u16   q14, q8, #8
--                                    add PF_X, PF_X, #8
--                                    tst PF_CTL, #0xF
-+                                    PF add PF_X, PF_X, #8
-+                                    PF tst PF_CTL, #0xF
-         vrshr.u16   q15, q9, #8
-         vrshr.u16   q12, q10, #8
-         vrshr.u16   q13, q11, #8
--                                    addne PF_X, PF_X, #8
--                                    subne PF_CTL, PF_CTL, #1
-+                                    PF addne PF_X, PF_X, #8
-+                                    PF subne PF_CTL, PF_CTL, #1
-         vraddhn.u16 d28, q14, q8
-         vraddhn.u16 d29, q15, q9
--                                    cmp PF_X, ORIG_W
-+                                    PF cmp PF_X, ORIG_W
-         vraddhn.u16 d30, q12, q10
-         vraddhn.u16 d31, q13, q11
-         vqadd.u8    q14, q0, q14
-         vqadd.u8    q15, q1, q15
-     vld4.8      {d0, d1, d2, d3}, [SRC]!
--                                    pld [PF_SRC, PF_X, lsl #src_bpp_shift]
-+                                    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
-     vmvn.8      d22, d3
--                                    pld [PF_DST, PF_X, lsl #dst_bpp_shift]
-+                                    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
-         vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
--                                    subge PF_X, PF_X, ORIG_W
-+                                    PF subge PF_X, PF_X, ORIG_W
-     vmull.u8    q8, d22, d4
--                                    subges PF_CTL, PF_CTL, #0x10
-+                                    PF subges PF_CTL, PF_CTL, #0x10
-     vmull.u8    q9, d22, d5
--                                    ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
-+                                    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
-     vmull.u8    q10, d22, d6
--                                    ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
-+                                    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
-     vmull.u8    q11, d22, d7
- .endm
- 
-diff --git a/pixman/pixman-arm-neon-asm.h b/pixman/pixman-arm-neon-asm.h
-index d276ab9..a2941ae 100644
---- a/pixman/pixman-arm-neon-asm.h
-+++ b/pixman/pixman-arm-neon-asm.h
-@@ -58,6 +58,11 @@
- #define RESPECT_STRICT_ALIGNMENT 1
- 
- /*
-+ * If set to nonzero value, prefetch is globally disabled
-+ */
-+#define PREFETCH_GLOBALLY_DISABLED 0 
-+
-+/*
-  * Definitions of supplementary pixld/pixst macros (for partial load/store of
-  * pixel data)
-  */
-@@ -218,37 +223,43 @@
-  * pixels processing like simple copy. Anyway, having prefetch is a must
-  * when working with graphics data.
-  */
-+.macro PF a, x:vararg
-+.if (ADVANCED_PREFETCH_ENABLED != 0) && (PREFETCH_GLOBALLY_DISABLED == 0)
-+    a x
-+.endif
-+.endm
-+
- .macro cache_preload std_increment, boost_increment
- .if (src_bpp_shift >= 0) || (dst_r_bpp != 0) || (mask_bpp_shift >= 0)
- .if regs_shortage
--    ldr ORIG_W, [sp] /* If we are short on regs, ORIG_W is kept on stack */
-+    PF ldr ORIG_W, [sp] /* If we are short on regs, ORIG_W is kept on stack */
- .endif
- .if std_increment != 0
--    add PF_X, PF_X, #std_increment
-+    PF add PF_X, PF_X, #std_increment
- .endif
--    tst PF_CTL, #0xF
--    addne PF_X, PF_X, #boost_increment
--    subne PF_CTL, PF_CTL, #1
--    cmp PF_X, ORIG_W
-+    PF tst PF_CTL, #0xF
-+    PF addne PF_X, PF_X, #boost_increment
-+    PF subne PF_CTL, PF_CTL, #1
-+    PF cmp PF_X, ORIG_W
- .if src_bpp_shift >= 0
--    pld [PF_SRC, PF_X, lsl #src_bpp_shift]
-+    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
- .endif
- .if dst_r_bpp != 0
--    pld [PF_DST, PF_X, lsl #dst_bpp_shift]
-+    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
- .endif
- .if mask_bpp_shift >= 0
--    pld [PF_MASK, PF_X, lsl #mask_bpp_shift]
-+    PF pld, [PF_MASK, PF_X, lsl #mask_bpp_shift]
- .endif
--    subge PF_X, PF_X, ORIG_W
--    subges PF_CTL, PF_CTL, #0x10
-+    PF subge PF_X, PF_X, ORIG_W
-+    PF subges PF_CTL, PF_CTL, #0x10
- .if src_bpp_shift >= 0
--    ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
-+    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
- .endif
- .if dst_r_bpp != 0
--    ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
-+    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
- .endif
- .if mask_bpp_shift >= 0
--    ldrgeb DUMMY, [PF_MASK, MASK_STRIDE, lsl #mask_bpp_shift]!
-+    PF ldrgeb DUMMY, [PF_MASK, MASK_STRIDE, lsl #mask_bpp_shift]!
- .endif
- .endif
- .endm
-@@ -297,6 +308,12 @@ fname:
-     PF_DST      .req        r12
-     PF_MASK     .req        r14
- 
-+.if prefetch_distance == 0
-+    .set ADVANCED_PREFETCH_ENABLED, 0
-+.else
-+    .set ADVANCED_PREFETCH_ENABLED, 1
-+.endif
-+
- .if mask_bpp == 0
-     ORIG_W      .req        r7      /* saved original width */
-     DUMMY       .req        r8      /* temporary register */
-@@ -374,12 +391,12 @@ fname:
-     ldr         MASK_STRIDE, [sp, #52]
- .endif
-     mov         DST_R, DST_W
--    mov         PF_SRC, SRC
--    mov         PF_DST, DST_R
--    mov         PF_MASK, MASK
--    mov         PF_CTL, H, lsl #4
--    /* pf_ctl = 10 | ((h - 1) << 4) */
--    add         PF_CTL, #(prefetch_distance - 0x10)
-+    PF mov      PF_SRC, SRC
-+    PF mov      PF_DST, DST_R
-+    PF mov      PF_MASK, MASK
-+    /* PF_CTL = prefetch_distance | ((h - 1) << 4) */
-+    PF mov      PF_CTL, H, lsl #4
-+    PF add      PF_CTL, #(prefetch_distance - 0x10)
- 
-     init
- .if regs_shortage
-@@ -412,7 +429,7 @@ fname:
- .else
-     add         DST_R, DST_R, #lowbit
- .endif
--    add         PF_X, PF_X, #(lowbit * 8 / dst_w_bpp)
-+    PF add      PF_X, PF_X, #(lowbit * 8 / dst_w_bpp)
-     sub         W, W, #(lowbit * 8 / dst_w_bpp)
- 1:
- .endif
-@@ -444,7 +461,7 @@ fname:
-                 (src_basereg - pixblock_size * src_bpp / 64), SRC
-     pixld       pixblock_size, mask_bpp, \
-                 (mask_basereg - pixblock_size * mask_bpp / 64), MASK
--    add         PF_X, PF_X, #pixblock_size
-+    PF add      PF_X, PF_X, #pixblock_size
-     process_pixblock_head
-     cache_preload 0, pixblock_size
-     subs        W, W, #(pixblock_size * 2)
-@@ -468,7 +485,7 @@ fname:
-     pixld       chunk_size, src_bpp, src_basereg, SRC
-     pixld       chunk_size, mask_bpp, mask_basereg, MASK
-     pixld_a     chunk_size, dst_r_bpp, dst_r_basereg, DST_R
--    add         PF_X, PF_X, #chunk_size
-+    PF add      PF_X, PF_X, #chunk_size
- 1:
- .endif
- .endr
---
-cgit v0.8.2
diff --git a/recipes/xorg-lib/pixman/remove-broken.patch b/recipes/xorg-lib/pixman/remove-broken.patch
deleted file mode 100644
index fd025b4..0000000
--- a/recipes/xorg-lib/pixman/remove-broken.patch
+++ /dev/null
@@ -1,826 +0,0 @@
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Sun, 26 Jul 2009 22:21:26 +0000 (+0300)
-Subject: ARM: Removal of unused/broken NEON code
-X-Git-Url: http://siarhei.siamashka.name/gitweb/?p=pixman.git;a=commitdiff_plain;h=7ef2322eefcccc28a2d45c0da22c0fee88b8f464
-
-ARM: Removal of unused/broken NEON code
----
-
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 4125d1b..9404c70 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -1895,710 +1895,6 @@ pixman_fill_neon (uint32_t *bits,
- #endif
- }
- 
--/* TODO: is there a more generic way of doing this being introduced? */
--#define NEON_SCANLINE_BUFFER_PIXELS (1024)
--
--static inline void
--neon_quadword_copy (void *   dst,
--		    void *   src,
--		    uint32_t count,         /* of quadwords */
--		    uint32_t trailer_count  /* of bytes */)
--{
--    uint8_t *t_dst = dst, *t_src = src;
--
--    /* Uses aligned multi-register loads to maximise read bandwidth
--     * on uncached memory such as framebuffers
--     * The accesses do not have the aligned qualifiers, so that the copy
--     * may convert between aligned-uncached and unaligned-cached memory.
--     * It is assumed that the CPU can infer alignedness from the address.
--     */
--
--#ifdef USE_GCC_INLINE_ASM
--
--    asm volatile (
--        "	cmp       %[count], #8				\n"
--        "	blt 1f    @ skip oversized fragments		\n"
--        "0: @ start with eight quadwords at a time		\n"
--        "	sub       %[count], %[count], #8		\n"
--        "	vld1.8    {d16, d17, d18, d19}, [%[src]]!		\n"
--        "	vld1.8    {d20, d21, d22, d23}, [%[src]]!		\n"
--        "	vld1.8    {d24, d25, d26, d27}, [%[src]]!		\n"
--        "	vld1.8    {d28, d29, d30, d31}, [%[src]]!		\n"
--        "	cmp       %[count], #8				\n"
--        "	vst1.8    {d16, d17, d18, d19}, [%[dst]]!		\n"
--        "	vst1.8    {d20, d21, d22, d23}, [%[dst]]!		\n"
--        "	vst1.8    {d24, d25, d26, d27}, [%[dst]]!		\n"
--        "	vst1.8    {d28, d29, d30, d31}, [%[dst]]!		\n"
--        "	bge 0b						\n"
--        "1: @ four quadwords					\n"
--        "	tst       %[count], #4				\n"
--        "	beq 2f    @ skip oversized fragment		\n"
--        "	vld1.8    {d16, d17, d18, d19}, [%[src]]!		\n"
--        "	vld1.8    {d20, d21, d22, d23}, [%[src]]!		\n"
--        "	vst1.8    {d16, d17, d18, d19}, [%[dst]]!		\n"
--        "	vst1.8    {d20, d21, d22, d23}, [%[dst]]!		\n"
--        "2: @ two quadwords					\n"
--        "	tst       %[count], #2				\n"
--        "	beq 3f    @ skip oversized fragment		\n"
--        "	vld1.8    {d16, d17, d18, d19}, [%[src]]!		\n"
--        "	vst1.8    {d16, d17, d18, d19}, [%[dst]]!		\n"
--        "3: @ one quadword					\n"
--        "	tst       %[count], #1				\n"
--        "	beq 4f    @ skip oversized fragment		\n"
--        "	vld1.8    {d16, d17}, [%[src]]!			\n"
--        "	vst1.8    {d16, d17}, [%[dst]]!			\n"
--        "4: @ end						\n"
--
--        /* Clobbered input registers marked as input/outputs */
--	: [dst] "+r" (t_dst), [src] "+r" (t_src), [count] "+r" (count)
--
--	  /* No unclobbered inputs */
--	:
--
--        /* Clobbered vector registers */
--	: "d16", "d17", "d18", "d19", "d20", "d21", "d22", "d23", "d24", "d25",
--	  "d26", "d27", "d28", "d29", "d30", "d31", "cc", "memory");
--
--#else
--
--    while (count >= 8)
--    {
--	uint8x16x4_t t1 = vld4q_u8 (t_src);
--	uint8x16x4_t t2 = vld4q_u8 (t_src + sizeof(uint8x16x4_t));
--	
--	t_src += sizeof(uint8x16x4_t) * 2;
--	vst4q_u8 (t_dst, t1);
--	vst4q_u8 (t_dst + sizeof(uint8x16x4_t), t2);
--	t_dst += sizeof(uint8x16x4_t) * 2;
--	count -= 8;
--    }
--
--    if (count & 4)
--    {
--	uint8x16x4_t t1 = vld4q_u8 (t_src);
--	
--	t_src += sizeof(uint8x16x4_t);
--	vst4q_u8 (t_dst, t1);
--	t_dst += sizeof(uint8x16x4_t);
--    }
--
--    if (count & 2)
--    {
--	uint8x8x4_t t1 = vld4_u8 (t_src);
--	
--	t_src += sizeof(uint8x8x4_t);
--	vst4_u8 (t_dst, t1);
--	t_dst += sizeof(uint8x8x4_t);
--    }
--
--    if (count & 1)
--    {
--	uint8x16_t t1 = vld1q_u8 (t_src);
--	
--	t_src += sizeof(uint8x16_t);
--	vst1q_u8 (t_dst, t1);
--	t_dst += sizeof(uint8x16_t);
--    }
--
--#endif  /* !USE_GCC_INLINE_ASM */
--
--    if (trailer_count)
--    {
--	if (trailer_count & 8)
--	{
--	    uint8x8_t t1 = vld1_u8 (t_src);
--	    
--	    t_src += sizeof(uint8x8_t);
--	    vst1_u8 (t_dst, t1);
--	    t_dst += sizeof(uint8x8_t);
--	}
--
--	if (trailer_count & 4)
--	{
--	    *((uint32_t*) t_dst) = *((uint32_t*) t_src);
--	    
--	    t_dst += 4;
--	    t_src += 4;
--	}
--
--	if (trailer_count & 2)
--	{
--	    *((uint16_t*) t_dst) = *((uint16_t*) t_src);
--	    
--	    t_dst += 2;
--	    t_src += 2;
--	}
--
--	if (trailer_count & 1)
--	{
--	    *t_dst++ = *t_src++;
--	}
--    }
--}
--
--static inline void
--solid_over_565_8_pix_neon (uint32_t  glyph_colour,
--                           uint16_t *dest,
--                           uint8_t * in_mask,
--                           uint32_t  dest_stride,    /* bytes, not elements */
--                           uint32_t  mask_stride,
--                           uint32_t  count           /* 8-pixel groups */)
--{
--    /* Inner loop of glyph blitter (solid colour, alpha mask) */
--
--#ifdef USE_GCC_INLINE_ASM
--
--    asm volatile (
--        "	vld4.8 {d20[], d21[], d22[], d23[]}, [%[glyph_colour]]  @ splat solid colour components	\n"
--        "0:	@ loop																				\n"
--        "	vld1.16   {d0, d1}, [%[dest]]         @ load first pixels from framebuffer			\n"
--        "	vld1.8    {d17}, [%[in_mask]]         @ load alpha mask of glyph						\n"
--        "	vmull.u8  q9, d17, d23               @ apply glyph colour alpha to mask				\n"
--        "	vshrn.u16 d17, q9, #8                @ reformat it to match original mask			\n"
--        "	vmvn      d18, d17                   @ we need the inverse mask for the background	\n"
--        "	vsli.u16  q3, q0, #5                 @ duplicate framebuffer blue bits				\n"
--        "	vshrn.u16 d2, q0, #8                 @ unpack red from framebuffer pixels			\n"
--        "	vshrn.u16 d4, q0, #3                 @ unpack green									\n"
--        "	vsri.u8   d2, d2, #5                 @ duplicate red bits (extend 5 to 8)			\n"
--        "	vshrn.u16 d6, q3, #2                 @ unpack extended blue (truncate 10 to 8)		\n"
--        "	vsri.u8   d4, d4, #6                 @ duplicate green bits (extend 6 to 8)			\n"
--        "	vmull.u8  q1, d2, d18                @ apply inverse mask to background red...		\n"
--        "	vmull.u8  q2, d4, d18                @ ...green...									\n"
--        "	vmull.u8  q3, d6, d18                @ ...blue										\n"
--        "	subs      %[count], %[count], #1     @ decrement/test loop counter					\n"
--        "	vmlal.u8  q1, d17, d22               @ add masked foreground red...					\n"
--        "	vmlal.u8  q2, d17, d21               @ ...green...									\n"
--        "	vmlal.u8  q3, d17, d20               @ ...blue										\n"
--        "	add %[in_mask], %[in_mask], %[mask_stride] @ advance mask pointer, while we wait		\n"
--        "	vsri.16   q1, q2, #5                 @ pack green behind red						\n"
--        "	vsri.16   q1, q3, #11                @ pack blue into pixels						\n"
--        "	vst1.16   {d2, d3}, [%[dest]]         @ store composited pixels						\n"
--        "	add %[dest], %[dest], %[dest_stride]  @ advance framebuffer pointer					\n"
--        "	bne 0b                               @ next please									\n"
--
--	/* Clobbered registers marked as input/outputs */
--	: [dest] "+r" (dest), [in_mask] "+r" (in_mask), [count] "+r" (count)
--	  
--	  /* Inputs */
--	: [dest_stride] "r" (dest_stride), [mask_stride] "r" (mask_stride), [glyph_colour] "r" (&glyph_colour)
--
--	  /* Clobbers, including the inputs we modify, and potentially lots of memory */
--	: "d0", "d1", "d2", "d3", "d4", "d5", "d6", "d7", "d17", "d18", "d19",
--	  "d20", "d21", "d22", "d23", "d24", "d25", "cc", "memory"
--        );
--
--#else
--
--    uint8x8x4_t solid_colour = vld4_dup_u8 ((uint8_t*) &glyph_colour);
--
--    while (count--)
--    {
--	uint16x8_t pixels = vld1q_u16 (dest);
--	uint8x8_t mask = vshrn_n_u16 (vmull_u8 (solid_colour.val[3], vld1_u8 (in_mask)), 8);
--	uint8x8_t mask_image = vmvn_u8 (mask);
--
--	uint8x8_t t_red   = vshrn_n_u16 (pixels, 8);
--	uint8x8_t t_green = vshrn_n_u16 (pixels, 3);
--	uint8x8_t t_blue  = vshrn_n_u16 (vsli_n_u8 (pixels, pixels, 5), 2);
--
--	uint16x8_t s_red   = vmull_u8 (vsri_n_u8 (t_red, t_red, 5), mask_image);
--	uint16x8_t s_green = vmull_u8 (vsri_n_u8 (t_green, t_green, 6), mask_image);
--	uint16x8_t s_blue  = vmull_u8 (t_blue, mask_image);
--
--	s_red   = vmlal (s_red, mask, solid_colour.val[2]);
--	s_green = vmlal (s_green, mask, solid_colour.val[1]);
--	s_blue  = vmlal (s_blue, mask, solid_colour.val[0]);
--
--	pixels = vsri_n_u16 (s_red, s_green, 5);
--	pixels = vsri_n_u16 (pixels, s_blue, 11);
--	vst1q_u16 (dest, pixels);
--
--	dest += dest_stride;
--	mask += mask_stride;
--    }
--
--#endif
--}
--
--#if 0 /* this is broken currently */
--static void
--neon_composite_over_n_8_0565 (pixman_implementation_t * impl,
--                              pixman_op_t               op,
--                              pixman_image_t *          src_image,
--                              pixman_image_t *          mask_image,
--                              pixman_image_t *          dst_image,
--                              int32_t                   src_x,
--                              int32_t                   src_y,
--                              int32_t                   mask_x,
--                              int32_t                   mask_y,
--                              int32_t                   dest_x,
--                              int32_t                   dest_y,
--                              int32_t                   width,
--                              int32_t                   height)
--{
--    uint32_t  src, srca;
--    uint16_t *dst_line, *aligned_line;
--    uint8_t  *mask_line;
--    uint32_t  dst_stride, mask_stride;
--    uint32_t  kernel_count, copy_count, copy_tail;
--    uint8_t   kernel_offset, copy_offset;
--
--    src = _pixman_image_get_solid (src_image, dst_image->bits.format);
--
--    /* bail out if fully transparent or degenerate */
--    srca = src >> 24;
--    if (src == 0)
--	return;
--
--    if (width == 0 || height == 0)
--	return;
--
--    if (width > NEON_SCANLINE_BUFFER_PIXELS)
--    {
--	/* split the blit, so we can use a fixed-size scanline buffer
--	 * TODO: there must be a more elegant way of doing this.
--	 */
--	int x;
--	for (x = 0; x < width; x += NEON_SCANLINE_BUFFER_PIXELS)
--	{
--	    neon_composite_over_n_8_0565 (
--		impl, op,
--		src_image, mask_image, dst_image,
--		src_x + x, src_y, mask_x + x, mask_y, dest_x + x, dest_y,
--		(x + NEON_SCANLINE_BUFFER_PIXELS > width) ? width - x : NEON_SCANLINE_BUFFER_PIXELS, height);
--	}
--
--	return;
--    }
--    
--    PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, uint16_t, dst_stride, dst_line, 1);
--    PIXMAN_IMAGE_GET_LINE (mask_image, mask_x, mask_y, uint8_t, mask_stride, mask_line, 1);
--
--    /* keep within minimum number of aligned quadwords on width
--     * while also keeping the minimum number of columns to process
--     */
--    {
--	unsigned long aligned_left = (unsigned long)(dst_line) & ~0xF;
--	unsigned long aligned_right = (((unsigned long)(dst_line + width)) + 0xF) & ~0xF;
--	unsigned long ceiling_length = (((unsigned long) width) * sizeof(*dst_line) + 0xF) & ~0xF;
--
--	/* the fast copy should be quadword aligned */
--	copy_offset = dst_line - ((uint16_t*) aligned_left);
--	aligned_line = dst_line - copy_offset;
--	copy_count = (uint32_t) ((aligned_right - aligned_left) >> 4);
--	copy_tail = 0;
--
--	if (aligned_right - aligned_left > ceiling_length)
--	{
--	    /* unaligned routine is tightest */
--	    kernel_count = (uint32_t) (ceiling_length >> 4);
--	    kernel_offset = copy_offset;
--	}
--	else
--	{
--	    /* aligned routine is equally tight, so it is safer to align */
--	    kernel_count = copy_count;
--	    kernel_offset = 0;
--	}
--
--	/* We should avoid reading beyond scanline ends for safety */
--	if (aligned_line < (dst_line - dest_x) ||
--	    (aligned_line + (copy_count * 16 / sizeof(*dst_line))) > ((dst_line - dest_x) + dst_image->bits.width))
--	{
--	    /* switch to precise read */
--	    copy_offset = kernel_offset = 0;
--	    aligned_line = dst_line;
--	    kernel_count = (uint32_t) (ceiling_length >> 4);
--	    copy_count = (width * sizeof(*dst_line)) >> 4;
--	    copy_tail = (width * sizeof(*dst_line)) & 0xF;
--	}
--    }
--
--    {
--	uint16_t scan_line[NEON_SCANLINE_BUFFER_PIXELS + 8];         /* deliberately not initialised */
--	uint8_t glyph_line[NEON_SCANLINE_BUFFER_PIXELS + 8];
--	int y = height;
--
--	/* row-major order */
--	/* left edge, middle block, right edge */
--	for ( ; y--; mask_line += mask_stride, aligned_line += dst_stride, dst_line += dst_stride)
--	{
--	    /* We don't want to overrun the edges of the glyph,
--	     * so realign the edge data into known buffers
--	     */
--	    neon_quadword_copy (glyph_line + copy_offset, mask_line, width >> 4, width & 0xF);
--
--	    /* Uncached framebuffer access is really, really slow
--	     * if we do it piecemeal. It should be much faster if we
--	     * grab it all at once. One scanline should easily fit in
--	     * L1 cache, so this should not waste RAM bandwidth.
--	     */
--	    neon_quadword_copy (scan_line, aligned_line, copy_count, copy_tail);
--
--	    /* Apply the actual filter */
--	    solid_over_565_8_pix_neon (
--		src, scan_line + kernel_offset,
--		glyph_line + kernel_offset, 8 * sizeof(*dst_line),
--		8, kernel_count);
--
--	    /* Copy the modified scanline back */
--	    neon_quadword_copy (dst_line, scan_line + copy_offset,
--				width >> 3, (width & 7) * 2);
--	}
--    }
--}
--#endif
--
--#ifdef USE_GCC_INLINE_ASM
--
--static inline void
--plain_over_565_8_pix_neon (uint32_t  colour,
--			   uint16_t *dest,
--			   uint32_t  dest_stride,     /* bytes, not elements */
--			   uint32_t  count            /* 8-pixel groups */)
--{
--    /* Inner loop for plain translucent rects
--     * (solid colour without alpha mask)
--     */
--    asm volatile (
--        "	vld4.8   {d20[], d21[], d22[], d23[]}, [%[colour]]  @ solid colour load/splat \n"
--        "	vmull.u8  q12, d23, d22              @ premultiply alpha red   \n"
--        "	vmull.u8  q13, d23, d21              @ premultiply alpha green \n"
--        "	vmull.u8  q14, d23, d20              @ premultiply alpha blue  \n"
--        "	vmvn      d18, d23                   @ inverse alpha for background \n"
--        "0:	@ loop\n"
--        "	vld1.16   {d0, d1}, [%[dest]]         @ load first pixels from framebuffer	\n"
--        "	vshrn.u16 d2, q0, #8                 @ unpack red from framebuffer pixels	\n"
--        "	vshrn.u16 d4, q0, #3                 @ unpack green				\n"
--        "	vsli.u16  q3, q0, #5                 @ duplicate framebuffer blue bits		\n"
--        "	vsri.u8   d2, d2, #5                 @ duplicate red bits (extend 5 to 8)	\n"
--        "	vsri.u8   d4, d4, #6                 @ duplicate green bits (extend 6 to 8)	\n"
--        "	vshrn.u16 d6, q3, #2                 @ unpack extended blue (truncate 10 to 8)	\n"
--        "	vmov      q0, q12                    @ retrieve foreground red   \n"
--        "	vmlal.u8  q0, d2, d18                @ blend red - my kingdom for a four-operand MLA \n"
--        "	vmov      q1, q13                    @ retrieve foreground green \n"
--        "	vmlal.u8  q1, d4, d18                @ blend green               \n"
--        "	vmov      q2, q14                    @ retrieve foreground blue  \n"
--        "	vmlal.u8  q2, d6, d18                @ blend blue                \n"
--        "	subs      %[count], %[count], #1     @ decrement/test loop counter		\n"
--        "	vsri.16   q0, q1, #5                 @ pack green behind red			\n"
--        "	vsri.16   q0, q2, #11                @ pack blue into pixels			\n"
--        "	vst1.16   {d0, d1}, [%[dest]]         @ store composited pixels			\n"
--        "	add %[dest], %[dest], %[dest_stride]  @ advance framebuffer pointer		\n"
--        "	bne 0b                               @ next please				\n"
--
--        /* Clobbered registers marked as input/outputs */
--	: [dest] "+r" (dest), [count] "+r" (count)
--
--	  /* Inputs */
--	: [dest_stride] "r" (dest_stride), [colour] "r" (&colour)
--
--	  /* Clobbers, including the inputs we modify, and
--	   * potentially lots of memory
--	   */
--	: "d0", "d1", "d2", "d3", "d4", "d5", "d6", "d7", "d18", "d19",
--	  "d20", "d21", "d22", "d23", "d24", "d25", "d26", "d27", "d28", "d29",
--	  "cc", "memory"
--        );
--}
--
--static void
--neon_composite_over_n_0565 (pixman_implementation_t * impl,
--                            pixman_op_t               op,
--                            pixman_image_t *          src_image,
--                            pixman_image_t *          mask_image,
--                            pixman_image_t *          dst_image,
--                            int32_t                   src_x,
--                            int32_t                   src_y,
--                            int32_t                   mask_x,
--                            int32_t                   mask_y,
--                            int32_t                   dest_x,
--                            int32_t                   dest_y,
--                            int32_t                   width,
--                            int32_t                   height)
--{
--    uint32_t src, srca;
--    uint16_t    *dst_line, *aligned_line;
--    uint32_t dst_stride;
--    uint32_t kernel_count, copy_count, copy_tail;
--    uint8_t kernel_offset, copy_offset;
--
--    src = _pixman_image_get_solid (src_image, dst_image->bits.format);
--
--    /* bail out if fully transparent */
--    srca = src >> 24;
--    if (src == 0)
--	return;
--    
--    if (width == 0 || height == 0)
--	return;
--
--    if (width > NEON_SCANLINE_BUFFER_PIXELS)
--    {
--	/* split the blit, so we can use a fixed-size scanline buffer *
--	 * TODO: there must be a more elegant way of doing this.
--	 */
--	int x;
--	
--	for (x = 0; x < width; x += NEON_SCANLINE_BUFFER_PIXELS)
--	{
--	    neon_composite_over_n_0565 (
--		impl, op,
--		src_image, mask_image, dst_image,
--		src_x + x, src_y, mask_x + x, mask_y, dest_x + x, dest_y,
--		(x + NEON_SCANLINE_BUFFER_PIXELS > width) ? width - x : NEON_SCANLINE_BUFFER_PIXELS, height);
--	}
--	return;
--    }
--
--    PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, uint16_t, dst_stride, dst_line, 1);
--
--    /* keep within minimum number of aligned quadwords on width
--     * while also keeping the minimum number of columns to process
--     */
--    {
--	unsigned long aligned_left = (unsigned long)(dst_line) & ~0xF;
--	unsigned long aligned_right = (((unsigned long)(dst_line + width)) + 0xF) & ~0xF;
--	unsigned long ceiling_length = (((unsigned long) width) * sizeof(*dst_line) + 0xF) & ~0xF;
--
--	/* the fast copy should be quadword aligned */
--	copy_offset = dst_line - ((uint16_t*) aligned_left);
--	aligned_line = dst_line - copy_offset;
--	copy_count = (uint32_t) ((aligned_right - aligned_left) >> 4);
--	copy_tail = 0;
--
--	if (aligned_right - aligned_left > ceiling_length)
--	{
--	    /* unaligned routine is tightest */
--	    kernel_count = (uint32_t) (ceiling_length >> 4);
--	    kernel_offset = copy_offset;
--	}
--	else
--	{
--	    /* aligned routine is equally tight, so it is safer to align */
--	    kernel_count = copy_count;
--	    kernel_offset = 0;
--	}
--
--	/* We should avoid reading beyond scanline ends for safety */
--	if (aligned_line < (dst_line - dest_x) ||
--	    (aligned_line + (copy_count * 16 / sizeof(*dst_line))) > ((dst_line - dest_x) + dst_image->bits.width))
--	{
--	    /* switch to precise read */
--	    copy_offset = kernel_offset = 0;
--	    aligned_line = dst_line;
--	    kernel_count = (uint32_t) (ceiling_length >> 4);
--	    copy_count = (width * sizeof(*dst_line)) >> 4;
--	    copy_tail = (width * sizeof(*dst_line)) & 0xF;
--	}
--    }
--
--    {
--	uint16_t scan_line[NEON_SCANLINE_BUFFER_PIXELS + 8];  /* deliberately not initialised */
--
--	/* row-major order */
--	/* left edge, middle block, right edge */
--	for ( ; height--; aligned_line += dst_stride, dst_line += dst_stride)
--	{
--	    /* Uncached framebuffer access is really, really slow if we do it piecemeal.
--	     * It should be much faster if we grab it all at once.
--	     * One scanline should easily fit in L1 cache, so this should
--	     * not waste RAM bandwidth.
--	     */
--	    neon_quadword_copy (scan_line, aligned_line, copy_count, copy_tail);
--
--	    /* Apply the actual filter */
--	    plain_over_565_8_pix_neon (
--		src, scan_line + kernel_offset, 8 * sizeof(*dst_line), kernel_count);
--
--	    /* Copy the modified scanline back */
--	    neon_quadword_copy (
--		dst_line, scan_line + copy_offset, width >> 3, (width & 7) * 2);
--	}
--    }
--}
--
--static inline void
--ARGB8_over_565_8_pix_neon (uint32_t *src,
--                           uint16_t *dest,
--                           uint32_t  src_stride,     /* bytes, not elements */
--                           uint32_t  count           /* 8-pixel groups */)
--{
--    asm volatile (
--        "0:	@ loop\n"
--        "	pld   [%[src], %[src_stride]]         @ preload from next scanline	\n"
--        "	vld1.16   {d0, d1}, [%[dest]]         @ load pixels from framebuffer	\n"
--        "	vld4.8   {d20, d21, d22, d23},[%[src]]! @ load source image pixels		\n"
--        "	vsli.u16  q3, q0, #5                 @ duplicate framebuffer blue bits		\n"
--        "	vshrn.u16 d2, q0, #8                 @ unpack red from framebuffer pixels	\n"
--        "	vshrn.u16 d4, q0, #3                 @ unpack green				\n"
--        "	vmvn      d18, d23                   @ we need the inverse alpha for the background	\n"
--        "	vsri.u8   d2, d2, #5                 @ duplicate red bits (extend 5 to 8)	\n"
--        "	vshrn.u16 d6, q3, #2                 @ unpack extended blue (truncate 10 to 8)	\n"
--        "	vsri.u8   d4, d4, #6                 @ duplicate green bits (extend 6 to 8)	\n"
--        "	vmull.u8  q1, d2, d18                @ apply inverse alpha to background red...	\n"
--        "	vmull.u8  q2, d4, d18                @ ...green...				\n"
--        "	vmull.u8  q3, d6, d18                @ ...blue					\n"
--        "	subs      %[count], %[count], #1     @ decrement/test loop counter		\n"
--        "	vmlal.u8  q1, d23, d22               @ add blended foreground red...		\n"
--        "	vmlal.u8  q2, d23, d21               @ ...green...				\n"
--        "	vmlal.u8  q3, d23, d20               @ ...blue					\n"
--        "	vsri.16   q1, q2, #5                 @ pack green behind red			\n"
--        "	vsri.16   q1, q3, #11                @ pack blue into pixels			\n"
--        "	vst1.16   {d2, d3}, [%[dest]]!        @ store composited pixels			\n"
--        "	bne 0b                               @ next please				\n"
--
--        /* Clobbered registers marked as input/outputs */
--	: [dest] "+r" (dest), [src] "+r" (src), [count] "+r" (count)
--
--	  /* Inputs */
--	: [src_stride] "r" (src_stride)
--
--	  /* Clobbers, including the inputs we modify, and potentially lots of memory */
--	: "d0", "d1", "d2", "d3", "d4", "d5", "d6", "d7", "d17", "d18", "d20",
--	  "d21", "d22", "d23", "cc", "memory"
--        );
--}
--
--static void
--neon_composite_over_8888_0565 (pixman_implementation_t * impl,
--                               pixman_op_t               op,
--                               pixman_image_t *          src_image,
--                               pixman_image_t *          mask_image,
--                               pixman_image_t *          dst_image,
--                               int32_t                   src_x,
--                               int32_t                   src_y,
--                               int32_t                   mask_x,
--                               int32_t                   mask_y,
--                               int32_t                   dest_x,
--                               int32_t                   dest_y,
--                               int32_t                   width,
--                               int32_t                   height)
--{
--    uint32_t    *src_line;
--    uint16_t    *dst_line, *aligned_line;
--    uint32_t dst_stride, src_stride;
--    uint32_t kernel_count, copy_count, copy_tail;
--    uint8_t kernel_offset, copy_offset;
--
--    /* we assume mask is opaque 
--     * so the only alpha to deal with is embedded in src
--     */
--    if (width > NEON_SCANLINE_BUFFER_PIXELS)
--    {
--	/* split the blit, so we can use a fixed-size scanline buffer */
--	int x;
--	for (x = 0; x < width; x += NEON_SCANLINE_BUFFER_PIXELS)
--	{
--	    neon_composite_over_8888_0565 (
--		impl, op,
--		src_image, mask_image, dst_image,
--		src_x + x, src_y, mask_x + x, mask_y, dest_x + x, dest_y,
--		(x + NEON_SCANLINE_BUFFER_PIXELS > width) ? width - x : NEON_SCANLINE_BUFFER_PIXELS, height);
--	}
--	return;
--    }
--
--    PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, uint16_t, dst_stride, dst_line, 1);
--    PIXMAN_IMAGE_GET_LINE (src_image, src_x, src_y, uint32_t, src_stride, src_line, 1);
--
--    /* keep within minimum number of aligned quadwords on width
--     * while also keeping the minimum number of columns to process
--     */
--    {
--	unsigned long aligned_left = (unsigned long)(dst_line) & ~0xF;
--	unsigned long aligned_right = (((unsigned long)(dst_line + width)) + 0xF) & ~0xF;
--	unsigned long ceiling_length = (((unsigned long) width) * sizeof(*dst_line) + 0xF) & ~0xF;
--
--	/* the fast copy should be quadword aligned */
--	copy_offset = dst_line - ((uint16_t*) aligned_left);
--	aligned_line = dst_line - copy_offset;
--	copy_count = (uint32_t) ((aligned_right - aligned_left) >> 4);
--	copy_tail = 0;
--
--	if (aligned_right - aligned_left > ceiling_length)
--	{
--	    /* unaligned routine is tightest */
--	    kernel_count = (uint32_t) (ceiling_length >> 4);
--	    kernel_offset = copy_offset;
--	}
--	else
--	{
--	    /* aligned routine is equally tight, so it is safer to align */
--	    kernel_count = copy_count;
--	    kernel_offset = 0;
--	}
--
--	/* We should avoid reading beyond scanline ends for safety */
--	if (aligned_line < (dst_line - dest_x) ||
--	    (aligned_line + (copy_count * 16 / sizeof(*dst_line))) > ((dst_line - dest_x) + dst_image->bits.width))
--	{
--	    /* switch to precise read */
--	    copy_offset = kernel_offset = 0;
--	    aligned_line = dst_line;
--	    kernel_count = (uint32_t) (ceiling_length >> 4);
--	    copy_count = (width * sizeof(*dst_line)) >> 4;
--	    copy_tail = (width * sizeof(*dst_line)) & 0xF;
--	}
--    }
--
--    /* Preload the first input scanline */
--    {
--	uint8_t *src_ptr = (uint8_t*) src_line;
--	uint32_t count = (width + 15) / 16;
--
--#ifdef USE_GCC_INLINE_ASM
--	asm volatile (
--	    "0: @ loop						\n"
--	    "	subs    %[count], %[count], #1			\n"
--	    "	pld     [%[src]]				\n"
--	    "	add     %[src], %[src], #64			\n"
--	    "	bgt 0b						\n"
--
--	    /* Clobbered input registers marked as input/outputs */
--	    : [src] "+r" (src_ptr), [count] "+r" (count)
--	    :     /* no unclobbered inputs */
--	    : "cc"
--	    );
--#else
--	do
--	{
--	    __pld (src_ptr);
--	    src_ptr += 64;
--	}
--	while (--count);
--#endif
--    }
--
--    {
--	uint16_t scan_line[NEON_SCANLINE_BUFFER_PIXELS + 8]; /* deliberately not initialised */
--
--	/* row-major order */
--	/* left edge, middle block, right edge */
--	for ( ; height--; src_line += src_stride, aligned_line += dst_stride)
--	{
--	    /* Uncached framebuffer access is really, really slow if we do
--	     * it piecemeal. It should be much faster if we grab it all at
--	     * once. One scanline should easily fit in L1 cache, so this
--	     * should not waste RAM bandwidth.
--	     */
--	    neon_quadword_copy (scan_line, aligned_line, copy_count, copy_tail);
--
--	    /* Apply the actual filter */
--	    ARGB8_over_565_8_pix_neon (
--		src_line, scan_line + kernel_offset,
--		src_stride * sizeof(*src_line), kernel_count);
--
--	    /* Copy the modified scanline back */
--	    neon_quadword_copy (dst_line,
--				scan_line + copy_offset,
--				width >> 3, (width & 7) * 2);
--	}
--    }
--}
--
--#endif  /* USE_GCC_INLINE_ASM */
--
- static const pixman_fast_path_t arm_neon_fast_path_array[] =
- {
-     { PIXMAN_OP_ADD,  PIXMAN_solid,    PIXMAN_a8,       PIXMAN_a8,       neon_composite_add_8888_8_8,     0 },
-@@ -2612,12 +1908,6 @@ static const pixman_fast_path_t arm_neon_fast_path_array[] =
- #ifdef USE_GCC_INLINE_ASM
-     { PIXMAN_OP_SRC,  PIXMAN_r5g6b5,   PIXMAN_null,     PIXMAN_r5g6b5,   neon_composite_src_16_16,        0 },
-     { PIXMAN_OP_SRC,  PIXMAN_b5g6r5,   PIXMAN_null,     PIXMAN_b5g6r5,   neon_composite_src_16_16,        0 },
--#if 0 /* this code has some bugs */
--    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_null,     PIXMAN_r5g6b5,   neon_composite_over_n_0565,      0 },
--    { PIXMAN_OP_OVER, PIXMAN_solid,    PIXMAN_null,     PIXMAN_b5g6r5,   neon_composite_over_n_0565,      0 },
--    { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_r5g6b5,   neon_composite_over_8888_0565,   0 },
--    { PIXMAN_OP_OVER, PIXMAN_a8b8g8r8, PIXMAN_null,     PIXMAN_b5g6r5,   neon_composite_over_8888_0565,   0 },
--#endif
- #endif
-     { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_a8r8g8b8, neon_composite_over_8888_8888,   0 },
-     { PIXMAN_OP_OVER, PIXMAN_a8r8g8b8, PIXMAN_null,     PIXMAN_x8r8g8b8, neon_composite_over_8888_8888,   0 },
-@@ -2668,79 +1958,6 @@ arm_neon_composite (pixman_implementation_t *imp,
- }
- 
- static pixman_bool_t
--pixman_blt_neon (void *src_bits,
--                 void *dst_bits,
--                 int   src_stride,
--                 int   dst_stride,
--                 int   src_bpp,
--                 int   dst_bpp,
--                 int   src_x,
--                 int   src_y,
--                 int   dst_x,
--                 int   dst_y,
--                 int   width,
--                 int   height)
--{
--    if (!width || !height)
--	return TRUE;
--
--    /* accelerate only straight copies involving complete bytes */
--    if (src_bpp != dst_bpp || (src_bpp & 7))
--	return FALSE;
--
--    {
--	uint32_t bytes_per_pixel = src_bpp >> 3;
--	uint32_t byte_width = width * bytes_per_pixel;
--	/* parameter is in words for some reason */
--	int32_t src_stride_bytes = src_stride * 4;
--	int32_t dst_stride_bytes = dst_stride * 4;
--	uint8_t *src_bytes = ((uint8_t*) src_bits) +
--	    src_y * src_stride_bytes + src_x * bytes_per_pixel;
--	uint8_t *dst_bytes = ((uint8_t*) dst_bits) +
--	    dst_y * dst_stride_bytes + dst_x * bytes_per_pixel;
--	uint32_t quadword_count = byte_width / 16;
--	uint32_t offset         = byte_width % 16;
--
--	while (height--)
--	{
--	    neon_quadword_copy (dst_bytes, src_bytes, quadword_count, offset);
--	    src_bytes += src_stride_bytes;
--	    dst_bytes += dst_stride_bytes;
--	}
--    }
--
--    return TRUE;
--}
--
--static pixman_bool_t
--arm_neon_blt (pixman_implementation_t *imp,
--              uint32_t *               src_bits,
--              uint32_t *               dst_bits,
--              int                      src_stride,
--              int                      dst_stride,
--              int                      src_bpp,
--              int                      dst_bpp,
--              int                      src_x,
--              int                      src_y,
--              int                      dst_x,
--              int                      dst_y,
--              int                      width,
--              int                      height)
--{
--    if (pixman_blt_neon (
--            src_bits, dst_bits, src_stride, dst_stride, src_bpp, dst_bpp,
--            src_x, src_y, dst_x, dst_y, width, height))
--    {
--	return TRUE;
--    }
--
--    return _pixman_implementation_blt (
--               imp->delegate,
--               src_bits, dst_bits, src_stride, dst_stride, src_bpp, dst_bpp,
--               src_x, src_y, dst_x, dst_y, width, height);
--}
--
--static pixman_bool_t
- arm_neon_fill (pixman_implementation_t *imp,
-                uint32_t *               bits,
-                int                      stride,
-@@ -2765,9 +1982,6 @@ _pixman_implementation_create_arm_neon (void)
-     pixman_implementation_t *imp = _pixman_implementation_create (simd);
- 
-     imp->composite = arm_neon_composite;
--#if 0 /* this code has some bugs */
--    imp->blt = arm_neon_blt;
--#endif
-     imp->fill = arm_neon_fill;
- 
-     return imp;
diff --git a/recipes/xorg-lib/pixman/src-8888-0565.patch b/recipes/xorg-lib/pixman/src-8888-0565.patch
deleted file mode 100644
index c544225..0000000
--- a/recipes/xorg-lib/pixman/src-8888-0565.patch
+++ /dev/null
@@ -1,324 +0,0 @@
-From 6494f9ae8820078d0e6109bf8f294156f7a5da4c Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Fri, 05 Mar 2010 00:40:34 +0000
-Subject: ARM: added 'armv6_composite_src_8888_0565' fast path
-
-Provides ~3x performance improvement when working with
-data in L1 cache, and ~80% performace improvement when working
-with memory. This fast path is important for 32bpp -> 16bpp
-color format conversion and is commonly used with 16bpp desktop.
-
-Microbenchmark from N800 (ARM11 @ 400MHz), measured in MPix/s:
-
-before:
-
- src_8888_0565 = L1:  21.54 M: 15.62
-
-after (armv4):
-
- src_8888_0565 = L1:  45.26 M: 23.29
-
-after (armv6):
-
- src_8888_0565 = L1:  60.62 M: 28.37
----
-diff --git a/pixman/pixman-arm-simd.c b/pixman/pixman-arm-simd.c
-index c375c01..69243c1 100644
---- a/pixman/pixman-arm-simd.c
-+++ b/pixman/pixman-arm-simd.c
-@@ -604,6 +604,282 @@ armv6_composite_over_n_8_0565 (pixman_implementation_t * impl,
- 	dst_stride - width, mask_stride - width, height);
- }
- 
-+static inline void
-+armv4_composite_src_8888_0565_asm (
-+    uint16_t *dst, uint32_t *src, int w, int dst_stride,
-+    int src_stride, int h)
-+{
-+    uint32_t a, x, y, c1F001F = 0x1F001F, cFFFF = 0xFFFF;
-+    int backup_w = w;
-+    while (h--)
-+    {
-+        w = backup_w;
-+        if (w > 0 && (uintptr_t)dst & 2)
-+        {
-+            x = *src++;
-+
-+            a = (x >> 3) & c1F001F;
-+            x &= 0xFC00;
-+            a |= a >> 5;
-+            a |= x >> 5;
-+
-+            *dst++ = a;
-+            w--;
-+        }
-+
-+        asm volatile(
-+            "subs  %[w], %[w], #2\n"
-+            "blt   2f\n"
-+        "1:\n"
-+            "ldr   %[x], [%[src]], #4\n"
-+            "ldr   %[y], [%[src]], #4\n"
-+            "subs  %[w], %[w], #2\n"
-+
-+            "and   %[a], %[c1F001F], %[x], lsr #3\n"
-+            "and   %[x], %[x], #0xFC00\n\n"
-+            "orr   %[a], %[a], %[a], lsr #5\n"
-+            "orr   %[x], %[a], %[x], lsr #5\n"
-+
-+            "and   %[a], %[c1F001F], %[y], lsr #3\n"
-+            "and   %[y], %[y], #0xFC00\n\n"
-+            "orr   %[a], %[a], %[a], lsr #5\n"
-+            "orr   %[y], %[a], %[y], lsr #5\n"
-+            /*
-+             * Writing single 32-bit value is much faster than two
-+             * separate 16-bit values for older CPUs without (efficient)
-+             * write combining, even though it costs an extra instruction.
-+             */
-+            "and   %[x], %[x], %[cFFFF]\n"
-+            "orr   %[x], %[x], %[y], lsl #16\n"
-+            "str   %[x], [%[dst]], #4\n"
-+            "bge   1b\n"
-+        "2:\n"
-+        : [c1F001F] "+&r" (c1F001F), [cFFFF] "+&r" (cFFFF),
-+          [src] "+&r" (src), [dst] "+&r" (dst), [a] "=&r" (a),
-+          [x] "=&r" (x), [y] "=&r" (y), [w] "+&r" (w)
-+        );
-+
-+        if (w & 1)
-+        {
-+            x = *src++;
-+
-+            a = (x >> 3) & c1F001F;
-+            x = x & 0xFC00;
-+            a |= a >> 5;
-+            a |= x >> 5;
-+
-+            *dst++ = a;
-+        }
-+
-+        src += src_stride - backup_w;
-+        dst += dst_stride - backup_w;
-+    }
-+}
-+
-+/*
-+ * Conversion x8r8g8b8 -> r5g6b5
-+ *
-+ * Note: 'w' must be >= 7 here
-+ */
-+static void __attribute__((naked))
-+armv6_composite_src_8888_0565_asm (
-+    uint16_t *dst, uint32_t *src, int w, int dst_stride,
-+    int src_stride, int h)
-+{
-+    asm volatile(
-+        /* define supplementary macros */
-+        ".macro cvt8888to565 PIX\n"
-+            "and   A, C1F001F, \\PIX, lsr #3\n"
-+            "and   \\PIX, \\PIX, #0xFC00\n\n"
-+            "orr   A, A, A, lsr #5\n"
-+            "orr   \\PIX, A, \\PIX, lsr #5\n"
-+        ".endm\n"
-+
-+        ".macro combine_pixels_pair PIX1, PIX2\n"
-+            /* Note: assume little endian byte order */
-+            "pkhbt \\PIX1, \\PIX1, \\PIX2, lsl #16\n"
-+        ".endm\n"
-+
-+        /* function entry, save all registers (10 words) to stack */
-+        "stmdb   sp!, {r4-r11, ip, lr}\n"
-+
-+        /* define some aliases */
-+        "DST     .req  r0\n"
-+        "SRC     .req  r1\n"
-+        "W       .req  r2\n"
-+        "H       .req  r3\n"
-+
-+        "TMP1    .req  r4\n"
-+        "TMP2    .req  r5\n"
-+        "TMP3    .req  r6\n"
-+        "TMP4    .req  r7\n"
-+        "TMP5    .req  r8\n"
-+        "TMP6    .req  r9\n"
-+        "TMP7    .req  r10\n"
-+        "TMP8    .req  r11\n"
-+
-+        "C1F001F .req  ip\n"
-+        "A       .req  lr\n"
-+
-+        "ldr     TMP1, [sp, #(10*4+0)]\n" /* load src_stride */
-+        "ldr     C1F001F, =0x1F001F\n"
-+        "sub     r3, r3, W\n"
-+        "str     r3, [sp, #(10*4+0)]\n" /* store (dst_stride-w) */
-+        "ldr     r3, [sp, #(10*4+4)]\n" /* load h */
-+        "sub     TMP1, TMP1, W\n"
-+        "str     TMP1, [sp, #(10*4+4)]\n" /* store (src_stride-w) */
-+
-+        "str     W, [sp, #(8*4)]\n" /* saved ip = W */
-+
-+    "0:\n"
-+        "subs    H, H, #1\n"
-+        "blt     6f\n"
-+    "1:\n"
-+        /* align DST at 4 byte boundary */
-+        "tst     DST, #2\n"
-+        "beq     2f\n"
-+        "ldr     TMP1, [SRC], #4\n"
-+        "sub     W, W, #1\n"
-+        "cvt8888to565 TMP1\n"
-+        "strh    TMP1, [DST], #2\n"
-+    "2:"
-+        /* align DST at 8 byte boundary */
-+        "tst     DST, #4\n"
-+        "beq     2f\n"
-+        "ldmia   SRC!, {TMP1, TMP2}\n"
-+        "sub     W, W, #2\n"
-+        "cvt8888to565 TMP1\n"
-+        "cvt8888to565 TMP2\n"
-+        "combine_pixels_pair TMP1, TMP2\n"
-+        "str     TMP1, [DST], #4\n"
-+    "2:"
-+        /* align DST at 16 byte boundary */
-+        "tst     DST, #8\n"
-+        "beq     2f\n"
-+        "ldmia   SRC!, {TMP1, TMP2, TMP3, TMP4}\n"
-+        "sub     W, W, #4\n"
-+        "cvt8888to565 TMP1\n"
-+        "cvt8888to565 TMP2\n"
-+        "cvt8888to565 TMP3\n"
-+        "cvt8888to565 TMP4\n"
-+        "combine_pixels_pair TMP1, TMP2\n"
-+        "combine_pixels_pair TMP3, TMP4\n"
-+        "stmia DST!, {TMP1, TMP3}\n"
-+    "2:"
-+        /* inner loop, process 8 pixels per iteration */
-+        "subs    W, W, #8\n"
-+        "blt     4f\n"
-+    "3:\n"
-+        "ldmia   SRC!, {TMP1, TMP2, TMP3, TMP4, TMP5, TMP6, TMP7, TMP8}\n"
-+        "subs    W, W, #8\n"
-+        "cvt8888to565 TMP1\n"
-+        "cvt8888to565 TMP2\n"
-+        "cvt8888to565 TMP3\n"
-+        "cvt8888to565 TMP4\n"
-+        "cvt8888to565 TMP5\n"
-+        "cvt8888to565 TMP6\n"
-+        "cvt8888to565 TMP7\n"
-+        "cvt8888to565 TMP8\n"
-+        "combine_pixels_pair TMP1, TMP2\n"
-+        "combine_pixels_pair TMP3, TMP4\n"
-+        "combine_pixels_pair TMP5, TMP6\n"
-+        "combine_pixels_pair TMP7, TMP8\n"
-+        "stmia   DST!, {TMP1, TMP3, TMP5, TMP7}\n"
-+        "bge     3b\n"
-+    "4:\n"
-+
-+        /* process the remaining pixels */
-+        "tst     W, #4\n"
-+        "beq     4f\n"
-+        "ldmia   SRC!, {TMP1, TMP2, TMP3, TMP4}\n"
-+        "cvt8888to565 TMP1\n"
-+        "cvt8888to565 TMP2\n"
-+        "cvt8888to565 TMP3\n"
-+        "cvt8888to565 TMP4\n"
-+        "combine_pixels_pair TMP1, TMP2\n"
-+        "combine_pixels_pair TMP3, TMP4\n"
-+        "stmia   DST!, {TMP1, TMP3}\n"
-+    "4:\n"
-+        "tst     W, #2\n"
-+        "beq     4f\n"
-+        "ldmia   SRC!, {TMP1, TMP2}\n"
-+        "cvt8888to565 TMP1\n"
-+        "cvt8888to565 TMP2\n"
-+        "combine_pixels_pair TMP1, TMP2\n"
-+        "str     TMP1, [DST], #4\n"
-+    "4:\n"
-+        "tst     W, #1\n"
-+        "beq     4f\n"
-+        "ldr     TMP1, [SRC], #4\n"
-+        "cvt8888to565 TMP1\n"
-+        "strh    TMP1, [DST], #2\n"
-+    "4:\n"
-+        "ldr     TMP1, [sp, #(10*4+0)]\n" /* (dst_stride-w) */
-+        "ldr     TMP2, [sp, #(10*4+4)]\n" /* (src_stride-w) */
-+        "ldr     W, [sp, #(8*4)]\n"
-+        "subs    H, H, #1\n"
-+        "add     DST, DST, TMP1, lsl #1\n"
-+        "add     SRC, SRC, TMP2, lsl #2\n"
-+        "bge     1b\n"
-+    "6:\n"
-+        /* restore all registers and return */
-+        "ldmia   sp!, {r4-r11, ip, pc}\n"
-+        ".ltorg\n"
-+
-+        ".unreq   DST\n"
-+        ".unreq   SRC\n"
-+        ".unreq   W\n"
-+        ".unreq   H\n"
-+
-+        ".unreq   TMP1\n"
-+        ".unreq   TMP2\n"
-+        ".unreq   TMP3\n"
-+        ".unreq   TMP4\n"
-+        ".unreq   TMP5\n"
-+        ".unreq   TMP6\n"
-+        ".unreq   TMP7\n"
-+        ".unreq   TMP8\n"
-+
-+        ".unreq   C1F001F\n"
-+        ".unreq   A\n"
-+
-+        ".purgem  cvt8888to565\n"
-+        ".purgem  combine_pixels_pair\n"
-+    );
-+}
-+
-+static void
-+armv6_composite_src_8888_0565 (pixman_implementation_t * impl,
-+			       pixman_op_t               op,
-+			       pixman_image_t *          src_image,
-+			       pixman_image_t *          mask_image,
-+			       pixman_image_t *          dst_image,
-+			       int32_t                   src_x,
-+			       int32_t                   src_y,
-+			       int32_t                   mask_x,
-+			       int32_t                   mask_y,
-+			       int32_t                   dest_x,
-+			       int32_t                   dest_y,
-+			       int32_t                   width,
-+			       int32_t                   height)
-+{
-+    uint32_t *src;
-+    uint16_t *dst;
-+    int src_stride, dst_stride;
-+
-+    PIXMAN_IMAGE_GET_LINE (dst_image, dest_x, dest_y, uint16_t,
-+			   dst_stride, dst, 1);
-+    PIXMAN_IMAGE_GET_LINE (src_image, src_x, src_y, uint32_t,
-+			   src_stride, src, 1);
-+
-+    if (width < 7)
-+	armv4_composite_src_8888_0565_asm (dst, src, width,
-+					   dst_stride, src_stride, height);
-+    else
-+	armv6_composite_src_8888_0565_asm (dst, src, width,
-+					   dst_stride, src_stride, height);
-+}
-+
- #endif
- 
- static const pixman_fast_path_t arm_simd_fast_paths[] =
-@@ -624,6 +900,10 @@ static const pixman_fast_path_t arm_simd_fast_paths[] =
- #if defined(__ARM_EABI__) && defined(__linux__)
-     PIXMAN_STD_FAST_PATH (OVER, solid, a8, r5g6b5, armv6_composite_over_n_8_0565),
-     PIXMAN_STD_FAST_PATH (OVER, solid, a8, b5g6r5, armv6_composite_over_n_8_0565),
-+    PIXMAN_STD_FAST_PATH (SRC, a8r8g8b8, null, r5g6b5, armv6_composite_src_8888_0565),
-+    PIXMAN_STD_FAST_PATH (SRC, x8r8g8b8, null, r5g6b5, armv6_composite_src_8888_0565),
-+    PIXMAN_STD_FAST_PATH (SRC, a8b8g8r8, null, b5g6r5, armv6_composite_src_8888_0565),
-+    PIXMAN_STD_FAST_PATH (SRC, x8b8g8r8, null, b5g6r5, armv6_composite_src_8888_0565),
- #endif
-     { PIXMAN_OP_NONE },
- };
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman/tls.patch b/recipes/xorg-lib/pixman/tls.patch
deleted file mode 100644
index 316caed..0000000
--- a/recipes/xorg-lib/pixman/tls.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 714559dccda3165a72f0a9935c1edc3aef535f30 Mon Sep 17 00:00:00 2001
-From: Søren Sandmann Pedersen <ssp@redhat.com>
-Date: Wed, 07 Apr 2010 05:44:12 +0000
-Subject: Fixes for pthread thread local storage.
-
-The tls_name_key variable is passed to tls_name_get(), and the first
-time this happens it isn't initialized. tls_name_get() then passes it
-on to tls_name_alloc() which passes it on to pthread_setspecific()
-leading to undefined behavior.
-
-None of this is actually necessary at all because there is only one
-such variable per thread local variable, so it doesn't need to passed
-as a parameter at all.
-
-All of this was pointed out by Tor Lillqvist on the cairo mailing
-list.
----
-diff --git a/pixman/pixman-compiler.h b/pixman/pixman-compiler.h
-index cdac0d8..531c8c9 100644
---- a/pixman/pixman-compiler.h
-+++ b/pixman/pixman-compiler.h
-@@ -99,16 +99,16 @@
-     }									\
- 									\
-     static type *							\
--    tls_ ## name ## _alloc (key)					\
-+    tls_ ## name ## _alloc (void)					\
-     {									\
- 	type *value = calloc (1, sizeof (type));			\
- 	if (value)							\
--	    pthread_setspecific (key, value);				\
-+	    pthread_setspecific (tls_ ## name ## _key, value);		\
- 	return value;							\
-     }									\
- 									\
-     static force_inline type *						\
--    tls_ ## name ## _get (key)						\
-+    tls_ ## name ## _get (void)						\
-     {									\
- 	type *value = NULL;						\
- 	if (pthread_once (&tls_ ## name ## _once_control,		\
-@@ -116,13 +116,13 @@
- 	{								\
- 	    value = pthread_getspecific (tls_ ## name ## _key);		\
- 	    if (!value)							\
--		value = tls_ ## name ## _alloc (key);			\
-+		value = tls_ ## name ## _alloc ();			\
- 	}								\
- 	return value;							\
-     }
- 
- #   define PIXMAN_GET_THREAD_LOCAL(name)				\
--    tls_ ## name ## _get (tls_ ## name ## _key)
-+    tls_ ## name ## _get ()
- 
- #else
- 
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman_0.10.0.bb b/recipes/xorg-lib/pixman_0.10.0.bb
deleted file mode 100644
index 8690818..0000000
--- a/recipes/xorg-lib/pixman_0.10.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require pixman.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "41804ac38025102dcc9891dfd4a3d105"
-SRC_URI[archive.sha256sum] = "48625f6b5ce130672942503c683d306d957ee40f59f8e59be6ca30a245ad47d0"
diff --git a/recipes/xorg-lib/pixman_0.11.4.bb b/recipes/xorg-lib/pixman_0.11.4.bb
deleted file mode 100644
index b058104..0000000
--- a/recipes/xorg-lib/pixman_0.11.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require pixman.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8c8afc259af61d42aa9b3d8ec5a9a03b"
-SRC_URI[archive.sha256sum] = "d034f4afb4329c38e8789a5a7a384194c7402094b4c2b7600d2d86d8589e8571"
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/xorg-lib/pixman_0.11.8.bb b/recipes/xorg-lib/pixman_0.11.8.bb
deleted file mode 100644
index d7c6717..0000000
--- a/recipes/xorg-lib/pixman_0.11.8.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require pixman.inc
-PR = "${INC_PR}.0"
-
-SRC_URI += " \
-           file://pixman-arm.patch \
-           file://pixman-x888-565.patch \
-          "
-SRC_URI[archive.md5sum] = "7b5db768c51337b5e5e954fc9c961cd3"
-SRC_URI[archive.sha256sum] = "720db5ef6ed0e744b9bac5360ade9a7c024f9fb3fab05c83a90ee28b08e66e01"
diff --git a/recipes/xorg-lib/pixman_0.15.18.bb b/recipes/xorg-lib/pixman_0.15.18.bb
deleted file mode 100644
index 4811a01..0000000
--- a/recipes/xorg-lib/pixman_0.15.18.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require pixman.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9b60fe7623621b546b76777b8b7d2490"
-SRC_URI[archive.sha256sum] = "3a5003cf6c7d5b03ed5977c108ee11410cfd7849eea370eb4feae98f2822c795"
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/xorg-lib/pixman_0.15.6.bb b/recipes/xorg-lib/pixman_0.15.6.bb
deleted file mode 100644
index a09de4e..0000000
--- a/recipes/xorg-lib/pixman_0.15.6.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require pixman.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fe922698df46b21d7e19f28ded4ca100"
-SRC_URI[archive.sha256sum] = "3438437c131c9847b34106225a728c11e522776ac454bb8740a9bc7aea409f22"
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/xorg-lib/pixman_0.17.12.bb b/recipes/xorg-lib/pixman_0.17.12.bb
deleted file mode 100644
index b476aaa..0000000
--- a/recipes/xorg-lib/pixman_0.17.12.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require pixman.inc
-PR = "${INC_PR}.0"
-
-SRC_URI += "\
-           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
-           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
-           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
-           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
-           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
-           file://0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch \
-           file://over-n-8-0565.patch \
-           file://src-8888-0565.patch \
-"
-SRC_URI[archive.md5sum] = "331415d7a110145cf27aa00e11d0a683"
-SRC_URI[archive.sha256sum] = "8cce103af1b4200a13bedca5b763f74c9bc99a55985ab44ca92ba532dac6b57f"
-
-NEON = " --disable-arm-neon "
-NEON_armv7a = " "
-
-EXTRA_OECONF = "${NEON} --disable-gtk"
-
-DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_angstrom = "2"
-DEFAULT_PREFERENCE_shr = "2"
diff --git a/recipes/xorg-lib/pixman_0.17.8.bb b/recipes/xorg-lib/pixman_0.17.8.bb
deleted file mode 100644
index 55c70c8..0000000
--- a/recipes/xorg-lib/pixman_0.17.8.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require pixman.inc
-PR = "${INC_PR}.0"
-
-SRC_URI += " \
-           file://0003-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
-           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
-           file://0005-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
-           file://0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
-           file://1-composite.patch \
-           file://2-composite.patch \
-           file://3-composite.patch \
-          "
-SRC_URI[archive.md5sum] = "a7deb2ff6b286b676d67aa6ae91317ae"
-SRC_URI[archive.sha256sum] = "ea24e9003455a0881bd43bf7e4169f2b34c90c8521405103e3490553876a81b4"
-
-NEON = " --disable-arm-neon "
-NEON_armv7a = " "
-
-EXTRA_OECONF = "${NEON} --disable-gtk"
-
-DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_angstrom = "2"
-DEFAULT_PREFERENCE_shr = "2"
diff --git a/recipes/xorg-lib/pixman_0.18.0.bb b/recipes/xorg-lib/pixman_0.18.0.bb
deleted file mode 100644
index c099b77..0000000
--- a/recipes/xorg-lib/pixman_0.18.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require pixman.inc
-PR = "${INC_PR}.3"
-
-SRC_URI += "\
-           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
-           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
-           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
-           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
-           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
-           file://calloc.patch \
-           file://tls.patch \
-           file://565-scanline.patch \
-           file://missing-cache-preload.diff \
-"
-SRC_URI[archive.md5sum] = "a4fb870fc325be258089f1683642e976"
-SRC_URI[archive.sha256sum] = "b305291bba3d9271a4481e5eedf901025ac8ba4ec8f7b76ccafc5094610cd4ff"
-
-NEON = " --disable-arm-neon "
-NEON_armv7a = " "
-
-EXTRA_OECONF = "${NEON} --disable-gtk"
-
-DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_shr = "2"
diff --git a/recipes/xorg-lib/pixman_0.9.4.bb b/recipes/xorg-lib/pixman_0.9.4.bb
deleted file mode 100644
index 254bf61..0000000
--- a/recipes/xorg-lib/pixman_0.9.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "Library for lowlevel pixel operations"
-DEPENDS = "virtual/libx11"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c354ab5b0da10227226d3ef604254875"
-SRC_URI[archive.sha256sum] = "261d239e9e3070a0a81e5b3eab92e6236c6295979bdae0a1ded05cbef93f67aa"
diff --git a/recipes/xorg-lib/pixman_0.9.5.bb b/recipes/xorg-lib/pixman_0.9.5.bb
deleted file mode 100644
index 6259dea..0000000
--- a/recipes/xorg-lib/pixman_0.9.5.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "Library for lowlevel pixel operations"
-DEPENDS = "virtual/libx11"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://dont-copy-unused-bits-to-alpha-channel.patch"
-SRC_URI[archive.md5sum] = "f9fea77e46ec7a3a16e925e137f146e7"
-SRC_URI[archive.sha256sum] = "a9d4545b5dfc018cdd33fd21bc73c3f1b3c9c207f1bb6843606cc180eb10c6c8"
diff --git a/recipes/xorg-lib/pixman_git.bb b/recipes/xorg-lib/pixman_git.bb
deleted file mode 100644
index 12140c1..0000000
--- a/recipes/xorg-lib/pixman_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-require pixman.inc
-PV = "0.17.13"
-PR = "${INC_PR}.2"
-PR_append = "+gitr${SRCPV}"
-
-SRC_URI = "git://anongit.freedesktop.org/pixman;protocol=git;branch=master \
-           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
-           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
-           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
-           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
-           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
-           file://0006-Revert-ARM-SIMD-Try-without-any-CFLAGS-before-forcin.patch \
-           file://over-n-8-0565.patch \
-           file://src-8888-0565.patch \
-           file://calloc.patch \
-           file://tls.patch \
-"
-
-SRCREV = "69f1ec9a7827aeb522fcae99846237ef0f896e7b"
-S = "${WORKDIR}/git"
-
-NEON = " --disable-arm-neon "
-NEON_armv7a = " "
-
-EXTRA_OECONF = "${NEON} --disable-gtk"
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/xorg-lib/xtrans/fix-missing-includepath.patch b/recipes/xorg-lib/xtrans/fix-missing-includepath.patch
deleted file mode 100644
index 043d14f..0000000
--- a/recipes/xorg-lib/xtrans/fix-missing-includepath.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
---- xtrans-X11R7.0-1.0.0/xtrans.pc.in~fix-missing-includepath	2005-07-02 20:00:50.000000000 +0200
-+++ xtrans-X11R7.0-1.0.0/xtrans.pc.in	2006-08-11 19:27:58.000000000 +0200
-@@ -6,4 +6,4 @@
- Name: XTrans
- Description: Abstract network code for X
- Version: @PACKAGE_VERSION@
--Cflags: -I${includedir} -D_BSD_SOURCE @fchown_define@ @sticky_bit_define@
-+Cflags: -I${includedir} -I${includedir}/X11/Xtrans -D_BSD_SOURCE @fchown_define@ @sticky_bit_define@
diff --git a/recipes/xorg-lib/xtrans_1.0.3.bb b/recipes/xorg-lib/xtrans_1.0.3.bb
deleted file mode 100644
index 19a56fa..0000000
--- a/recipes/xorg-lib/xtrans_1.0.3.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "network API translation layer to insulate X applications and \
-libraries from OS network vageries."
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://fix-missing-includepath.patch"
-SRC_URI[archive.md5sum] = "bb196907ea1e182dcb396eb22f7d2c1a"
-SRC_URI[archive.sha256sum] = "e1a3c4986f16a5fbca611d0547cc7499a1fa47ca2096593644037e2609363085"
-
-FILESPATHPKG .= ":xtrans-${PV}:xtrans"
-
-ALLOW_EMPTY = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/xorg-lib/xtrans_1.0.4.bb b/recipes/xorg-lib/xtrans_1.0.4.bb
deleted file mode 100644
index d19a6c0..0000000
--- a/recipes/xorg-lib/xtrans_1.0.4.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "network API translation layer to insulate X applications and \
-libraries from OS network vageries."
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://fix-missing-includepath.patch"
-SRC_URI[archive.md5sum] = "8b36cdf08df12be96615e3d550236626"
-SRC_URI[archive.sha256sum] = "765219fa822edeffb0650e93458e4ebf63c23176e58fce06806fb251fbfe7d8c"
-
-FILESPATHPKG .= ":xtrans-${PV}:xtrans"
-
-ALLOW_EMPTY = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/xorg-lib/xtrans_1.1.bb b/recipes/xorg-lib/xtrans_1.1.bb
deleted file mode 100644
index 1f3fcb4..0000000
--- a/recipes/xorg-lib/xtrans_1.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "network API translation layer to insulate X applications and \
-libraries from OS network vageries."
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://fix-missing-includepath.patch"
-SRC_URI[archive.md5sum] = "8546e3a060aefb42c889eaa4b5db33af"
-SRC_URI[archive.sha256sum] = "16bc4646f105efd3d0dd105899ac19035d67acf50950ca8c70cf68772508272d"
-
-FILESPATHPKG .= ":xtrans-${PV}:xtrans"
-
-ALLOW_EMPTY = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/xorg-lib/xtrans_1.2.1.bb b/recipes/xorg-lib/xtrans_1.2.1.bb
deleted file mode 100644
index e695e35..0000000
--- a/recipes/xorg-lib/xtrans_1.2.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "network API translation layer to insulate X applications and \
-libraries from OS network vageries."
-RDEPENDS_${PN}-dev = ""
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "96e142331edd498a9364887b2548f1bb"
-SRC_URI[archive.sha256sum] = "9ff21a8d9ea524ca9b7cb6d6b4d522b4cb20b1c35edeb8995a9e9265a0df64bd"
-
-FILESPATHPKG .= ":xtrans-${PV}:xtrans"
-
-ALLOW_EMPTY = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/xorg-lib/xtrans_1.2.3.bb b/recipes/xorg-lib/xtrans_1.2.3.bb
deleted file mode 100644
index 1f0ec39..0000000
--- a/recipes/xorg-lib/xtrans_1.2.3.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "network API translation layer to insulate X applications and \
-libraries from OS network vageries."
-RDEPENDS_${PN}-dev = ""
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f9cf791dfad59cf044e276aab3a71e1d"
-SRC_URI[archive.sha256sum] = "a67a8b09d9530021e2bd4b93136f385e72a8d8e4f2c26a99aeb169bee88facf0"
-
-FILESPATHPKG .= ":xtrans-${PV}:xtrans"
-
-ALLOW_EMPTY = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/xorg-lib/xtrans_1.2.bb b/recipes/xorg-lib/xtrans_1.2.bb
deleted file mode 100644
index 8a4ddca..0000000
--- a/recipes/xorg-lib/xtrans_1.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "network API translation layer to insulate X applications and \
-libraries from OS network vageries."
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://fix-missing-includepath.patch"
-SRC_URI[archive.md5sum] = "a91fef8b932b21992af7dfff7b2643f3"
-SRC_URI[archive.sha256sum] = "d6c3cabd5ecd0183a8a9bc6b3471545df8e2c78956b4c4cfd48f0c545a88c9a4"
-
-FILESPATHPKG .= ":xtrans-${PV}:xtrans"
-
-ALLOW_EMPTY = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.2




Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgap-0000ZV-UA
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:57:08 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so19263452fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=IQ4fb2Jb9eVbjaKHEh+cAnYa0TkdKVoK8h422lH4NcE=;
	b=V7fuD0veTvyB5wtX/+GO8wCFySuFUdT1WDSlAr01Mj9VUv421IkkIwjRLEMh+iBAmH
	/dU1DVvAUI1fZTjDwU8/3oPLUGDA0j/qtgSfD1UK14UYFhsUQZxChAPQMy9q0VZqUaJ+
	n9XjCuyq2iz3OE86yWzQ9iKwc3e/g7TOddnMc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=t0RsQZelAOsQmpMSa3k4pEv5WGsNdDjXDLswul93lFMswIMsX96lrfltJH+E1S/3B8
	cz1N7J6TNYpWgo9lw1zQdM3hilDBAu6sosb9BOtmZIluSNSuD9aSdEi4XEj94xQlowWj
	iTwv742aGelP65DxpIf1gsMIEDb9QwfY2cimk=
Received: by 10.223.81.70 with SMTP id w6mr4421298fak.62.1294761399311;
	Tue, 11 Jan 2011 07:56:39 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o17sm7447434fal.1.2011.01.11.07.56.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:25 +0100
Message-Id: <1294761389-13634-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/12] xorg-lib: obsolete old versions
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
X-List-Received-Date: Tue, 11 Jan 2011 15:57:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg-lib/libdmx_1.1.0.bb          |    8 +
 recipes/obsolete/xorg-lib/libfontenc_1.0.5.bb      |   11 +
 recipes/obsolete/xorg-lib/libfs_1.0.2.bb           |   10 +
 recipes/obsolete/xorg-lib/libice_1.0.6.bb          |   12 +
 recipes/obsolete/xorg-lib/libpciaccess_0.10.9.bb   |    6 +
 recipes/obsolete/xorg-lib/libsm_1.1.1.bb           |   12 +
 .../xorg-lib/libx11-1.3.2/configure.ac-nios2.patch |   33 +
 .../obsolete/xorg-lib/libx11-1.3.2/dolt-fix.patch  |   21 +
 .../xorg-lib/libx11-1.3.2/keysymdef_include.patch  |   29 +
 .../libx11-1.3.2/x11_disable_makekeys.patch        |   23 +
 .../xorg-lib/libx11-1.3.6/configure.ac-nios2.patch |   33 +
 .../obsolete/xorg-lib/libx11-1.3.6/dolt-fix.patch  |   22 +
 .../xorg-lib/libx11-1.3.6/keysymdef_include.patch  |   19 +
 .../libx11-1.3.6/x11_disable_makekeys.patch        |   29 +
 recipes/obsolete/xorg-lib/libx11_1.3.2.bb          |   11 +
 recipes/obsolete/xorg-lib/libx11_1.3.6.bb          |    7 +
 recipes/obsolete/xorg-lib/libxau_1.0.5.bb          |   12 +
 recipes/obsolete/xorg-lib/libxaw_1.0.7.bb          |   25 +
 recipes/obsolete/xorg-lib/libxcomposite_0.4.1.bb   |   11 +
 recipes/obsolete/xorg-lib/libxcursor_1.1.10.bb     |   13 +
 recipes/obsolete/xorg-lib/libxdamage_1.1.2.bb      |   11 +
 recipes/obsolete/xorg-lib/libxdmcp_1.0.3.bb        |   12 +
 recipes/obsolete/xorg-lib/libxevie_1.0.2.bb        |   10 +
 recipes/obsolete/xorg-lib/libxext_1.1.1.bb         |   12 +
 recipes/obsolete/xorg-lib/libxfixes_4.0.4.bb       |   13 +
 recipes/obsolete/xorg-lib/libxfont_1.4.1.bb        |   16 +
 .../xorg-lib/libxft-2.1.14/autotools.patch         |   54 ++
 recipes/obsolete/xorg-lib/libxft_2.1.14.bb         |   22 +
 recipes/obsolete/xorg-lib/libxi_1.3.bb             |   10 +
 recipes/obsolete/xorg-lib/libxinerama_1.1.bb       |   10 +
 recipes/obsolete/xorg-lib/libxkbfile_1.0.6.bb      |   11 +
 recipes/obsolete/xorg-lib/libxmu_1.0.5.bb          |   17 +
 recipes/obsolete/xorg-lib/libxpm_3.5.8.bb          |   16 +
 recipes/obsolete/xorg-lib/libxrandr_1.2.1.bb       |   13 +
 recipes/obsolete/xorg-lib/libxrandr_1.3.0.bb       |   13 +
 recipes/obsolete/xorg-lib/libxrender_0.9.5.bb      |   13 +
 recipes/obsolete/xorg-lib/libxres_1.0.4.bb         |   10 +
 recipes/obsolete/xorg-lib/libxscrnsaver_1.2.0.bb   |   13 +
 recipes/obsolete/xorg-lib/libxt_1.0.7.bb           |   22 +
 recipes/obsolete/xorg-lib/libxtst_1.1.0.bb         |   10 +
 recipes/obsolete/xorg-lib/libxv_1.0.5.bb           |   10 +
 recipes/obsolete/xorg-lib/libxxf86dga_1.1.1.bb     |   10 +
 recipes/obsolete/xorg-lib/libxxf86misc_1.0.2.bb    |   10 +
 recipes/obsolete/xorg-lib/libxxf86vm_1.1.0.bb      |   10 +
 .../xorg-lib/pixman-0.12.0/pixman-arm.patch        |  632 ++++++++++++++++++++
 .../xorg-lib/pixman-0.12.0/pixman-x888-565.patch   |   68 +++
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 ++++
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 +++
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 +++
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 +++
 ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  169 ++++++
 ...e-version-of-16bpp-bilinear-scanline-fetc.patch |  261 ++++++++
 .../0007-ARM-added-missing-cache-preload.patch     |   32 +
 .../xorg-lib/pixman-0.18.4/565-over-neon.patch     |   23 +
 .../xorg-lib/pixman-0.18.4/neon-reverse-u.patch    |  175 ++++++
 .../0000-Add-pixman_bits_override_accessors.patch  |   77 +++
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 ++++
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 +++
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 +++
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 +++
 ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  109 ++++
 ...EON-optimizations-for-fetch-store-a8-scan.patch |  148 +++++
 ...EON-optimizations-for-fetching-x8r8g8b8-s.patch |   77 +++
 ...ation-for-scaled-src_0565_0565-operation-.patch |  172 ++++++
 recipes/obsolete/xorg-lib/pixman_0.12.0.bb         |    9 +
 recipes/obsolete/xorg-lib/pixman_0.16.2.bb         |    7 +
 recipes/obsolete/xorg-lib/pixman_0.18.4.bb         |   21 +
 recipes/obsolete/xorg-lib/pixman_0.20.0.bb         |   23 +
 recipes/obsolete/xorg-lib/xtrans_1.2.5.bb          |   13 +
 recipes/xorg-lib/libdmx_1.1.0.bb                   |    8 -
 recipes/xorg-lib/libfontenc_1.0.5.bb               |   11 -
 recipes/xorg-lib/libfs_1.0.2.bb                    |   10 -
 recipes/xorg-lib/libice_1.0.6.bb                   |   12 -
 recipes/xorg-lib/libpciaccess_0.10.9.bb            |    6 -
 recipes/xorg-lib/libsm_1.1.1.bb                    |   12 -
 .../xorg-lib/libx11-1.3.2/configure.ac-nios2.patch |   33 -
 recipes/xorg-lib/libx11-1.3.2/dolt-fix.patch       |   21 -
 .../xorg-lib/libx11-1.3.2/keysymdef_include.patch  |   29 -
 .../libx11-1.3.2/x11_disable_makekeys.patch        |   23 -
 .../xorg-lib/libx11-1.3.6/configure.ac-nios2.patch |   33 -
 recipes/xorg-lib/libx11-1.3.6/dolt-fix.patch       |   22 -
 .../xorg-lib/libx11-1.3.6/keysymdef_include.patch  |   19 -
 .../libx11-1.3.6/x11_disable_makekeys.patch        |   29 -
 recipes/xorg-lib/libx11_1.3.2.bb                   |   11 -
 recipes/xorg-lib/libx11_1.3.6.bb                   |    7 -
 recipes/xorg-lib/libxau_1.0.5.bb                   |   12 -
 recipes/xorg-lib/libxaw_1.0.7.bb                   |   25 -
 recipes/xorg-lib/libxcomposite_0.4.1.bb            |   11 -
 recipes/xorg-lib/libxcursor_1.1.10.bb              |   13 -
 recipes/xorg-lib/libxdamage_1.1.2.bb               |   11 -
 recipes/xorg-lib/libxdmcp_1.0.3.bb                 |   12 -
 recipes/xorg-lib/libxevie_1.0.2.bb                 |   10 -
 recipes/xorg-lib/libxext_1.1.1.bb                  |   12 -
 recipes/xorg-lib/libxfixes_4.0.4.bb                |   13 -
 recipes/xorg-lib/libxfont_1.4.1.bb                 |   16 -
 recipes/xorg-lib/libxft-2.1.14/autotools.patch     |   54 --
 recipes/xorg-lib/libxft_2.1.14.bb                  |   22 -
 recipes/xorg-lib/libxi_1.3.bb                      |   10 -
 recipes/xorg-lib/libxinerama_1.1.bb                |   10 -
 recipes/xorg-lib/libxkbfile_1.0.6.bb               |   11 -
 recipes/xorg-lib/libxmu_1.0.5.bb                   |   17 -
 recipes/xorg-lib/libxpm_3.5.8.bb                   |   16 -
 recipes/xorg-lib/libxrandr_1.2.1.bb                |   13 -
 recipes/xorg-lib/libxrandr_1.3.0.bb                |   13 -
 recipes/xorg-lib/libxrender_0.9.5.bb               |   13 -
 recipes/xorg-lib/libxres_1.0.4.bb                  |   10 -
 recipes/xorg-lib/libxscrnsaver_1.2.0.bb            |   13 -
 recipes/xorg-lib/libxt_1.0.7.bb                    |   22 -
 recipes/xorg-lib/libxtst_1.1.0.bb                  |   10 -
 recipes/xorg-lib/libxv_1.0.5.bb                    |   10 -
 recipes/xorg-lib/libxxf86dga_1.1.1.bb              |   10 -
 recipes/xorg-lib/libxxf86misc_1.0.2.bb             |   10 -
 recipes/xorg-lib/libxxf86vm_1.1.0.bb               |   10 -
 recipes/xorg-lib/pixman-0.12.0/pixman-arm.patch    |  632 --------------------
 .../xorg-lib/pixman-0.12.0/pixman-x888-565.patch   |   68 ---
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 ----
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 ---
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 ---
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 ---
 ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  169 ------
 ...e-version-of-16bpp-bilinear-scanline-fetc.patch |  261 --------
 .../0007-ARM-added-missing-cache-preload.patch     |   32 -
 recipes/xorg-lib/pixman-0.18.4/565-over-neon.patch |   23 -
 .../xorg-lib/pixman-0.18.4/neon-reverse-u.patch    |  175 ------
 .../0000-Add-pixman_bits_override_accessors.patch  |   77 ---
 ...mplementation-of-pixman_blt-with-overlapp.patch |  114 ----
 ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 ---
 ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 ---
 ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 ---
 ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  109 ----
 ...EON-optimizations-for-fetch-store-a8-scan.patch |  148 -----
 ...EON-optimizations-for-fetching-x8r8g8b8-s.patch |   77 ---
 ...ation-for-scaled-src_0565_0565-operation-.patch |  172 ------
 recipes/xorg-lib/pixman_0.12.0.bb                  |    9 -
 recipes/xorg-lib/pixman_0.16.2.bb                  |    7 -
 recipes/xorg-lib/pixman_0.18.4.bb                  |   21 -
 recipes/xorg-lib/pixman_0.20.0.bb                  |   23 -
 recipes/xorg-lib/xtrans_1.2.5.bb                   |   13 -
 138 files changed, 3491 insertions(+), 3491 deletions(-)
 create mode 100644 recipes/obsolete/xorg-lib/libdmx_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-lib/libfontenc_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg-lib/libfs_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-lib/libice_1.0.6.bb
 create mode 100644 recipes/obsolete/xorg-lib/libpciaccess_0.10.9.bb
 create mode 100644 recipes/obsolete/xorg-lib/libsm_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
 create mode 100644 recipes/obsolete/xorg-lib/libx11-1.3.2/dolt-fix.patch
 create mode 100644 recipes/obsolete/xorg-lib/libx11-1.3.2/keysymdef_include.patch
 create mode 100644 recipes/obsolete/xorg-lib/libx11-1.3.2/x11_disable_makekeys.patch
 create mode 100644 recipes/obsolete/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
 create mode 100644 recipes/obsolete/xorg-lib/libx11-1.3.6/dolt-fix.patch
 create mode 100644 recipes/obsolete/xorg-lib/libx11-1.3.6/keysymdef_include.patch
 create mode 100644 recipes/obsolete/xorg-lib/libx11-1.3.6/x11_disable_makekeys.patch
 create mode 100644 recipes/obsolete/xorg-lib/libx11_1.3.2.bb
 create mode 100644 recipes/obsolete/xorg-lib/libx11_1.3.6.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxau_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxaw_1.0.7.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxcomposite_0.4.1.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxcursor_1.1.10.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxdamage_1.1.2.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxdmcp_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxevie_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxext_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxfixes_4.0.4.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxfont_1.4.1.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxft-2.1.14/autotools.patch
 create mode 100644 recipes/obsolete/xorg-lib/libxft_2.1.14.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxi_1.3.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxinerama_1.1.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxkbfile_1.0.6.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxmu_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxpm_3.5.8.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxrandr_1.2.1.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxrandr_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxrender_0.9.5.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxres_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxscrnsaver_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxt_1.0.7.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxtst_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxv_1.0.5.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxxf86dga_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxxf86misc_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-lib/libxxf86vm_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.12.0/pixman-arm.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.12.0/pixman-x888-565.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.18.4/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.18.4/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.18.4/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.18.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.18.4/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.18.4/0006-A-copy-paste-version-of-16bpp-bilinear-scanline-fetc.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.18.4/0007-ARM-added-missing-cache-preload.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.18.4/565-over-neon.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.18.4/neon-reverse-u.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch
 create mode 100644 recipes/obsolete/xorg-lib/pixman_0.12.0.bb
 create mode 100644 recipes/obsolete/xorg-lib/pixman_0.16.2.bb
 create mode 100644 recipes/obsolete/xorg-lib/pixman_0.18.4.bb
 create mode 100644 recipes/obsolete/xorg-lib/pixman_0.20.0.bb
 create mode 100644 recipes/obsolete/xorg-lib/xtrans_1.2.5.bb
 delete mode 100644 recipes/xorg-lib/libdmx_1.1.0.bb
 delete mode 100644 recipes/xorg-lib/libfontenc_1.0.5.bb
 delete mode 100644 recipes/xorg-lib/libfs_1.0.2.bb
 delete mode 100644 recipes/xorg-lib/libice_1.0.6.bb
 delete mode 100644 recipes/xorg-lib/libpciaccess_0.10.9.bb
 delete mode 100644 recipes/xorg-lib/libsm_1.1.1.bb
 delete mode 100644 recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.2/dolt-fix.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.2/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.2/x11_disable_makekeys.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.6/dolt-fix.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.6/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.3.6/x11_disable_makekeys.patch
 delete mode 100644 recipes/xorg-lib/libx11_1.3.2.bb
 delete mode 100644 recipes/xorg-lib/libx11_1.3.6.bb
 delete mode 100644 recipes/xorg-lib/libxau_1.0.5.bb
 delete mode 100644 recipes/xorg-lib/libxaw_1.0.7.bb
 delete mode 100644 recipes/xorg-lib/libxcomposite_0.4.1.bb
 delete mode 100644 recipes/xorg-lib/libxcursor_1.1.10.bb
 delete mode 100644 recipes/xorg-lib/libxdamage_1.1.2.bb
 delete mode 100644 recipes/xorg-lib/libxdmcp_1.0.3.bb
 delete mode 100644 recipes/xorg-lib/libxevie_1.0.2.bb
 delete mode 100644 recipes/xorg-lib/libxext_1.1.1.bb
 delete mode 100644 recipes/xorg-lib/libxfixes_4.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxfont_1.4.1.bb
 delete mode 100644 recipes/xorg-lib/libxft-2.1.14/autotools.patch
 delete mode 100644 recipes/xorg-lib/libxft_2.1.14.bb
 delete mode 100644 recipes/xorg-lib/libxi_1.3.bb
 delete mode 100644 recipes/xorg-lib/libxinerama_1.1.bb
 delete mode 100644 recipes/xorg-lib/libxkbfile_1.0.6.bb
 delete mode 100644 recipes/xorg-lib/libxmu_1.0.5.bb
 delete mode 100644 recipes/xorg-lib/libxpm_3.5.8.bb
 delete mode 100644 recipes/xorg-lib/libxrandr_1.2.1.bb
 delete mode 100644 recipes/xorg-lib/libxrandr_1.3.0.bb
 delete mode 100644 recipes/xorg-lib/libxrender_0.9.5.bb
 delete mode 100644 recipes/xorg-lib/libxres_1.0.4.bb
 delete mode 100644 recipes/xorg-lib/libxscrnsaver_1.2.0.bb
 delete mode 100644 recipes/xorg-lib/libxt_1.0.7.bb
 delete mode 100644 recipes/xorg-lib/libxtst_1.1.0.bb
 delete mode 100644 recipes/xorg-lib/libxv_1.0.5.bb
 delete mode 100644 recipes/xorg-lib/libxxf86dga_1.1.1.bb
 delete mode 100644 recipes/xorg-lib/libxxf86misc_1.0.2.bb
 delete mode 100644 recipes/xorg-lib/libxxf86vm_1.1.0.bb
 delete mode 100644 recipes/xorg-lib/pixman-0.12.0/pixman-arm.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.12.0/pixman-x888-565.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.4/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.4/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.4/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.4/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.4/0006-A-copy-paste-version-of-16bpp-bilinear-scanline-fetc.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.4/0007-ARM-added-missing-cache-preload.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.4/565-over-neon.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.18.4/neon-reverse-u.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
 delete mode 100644 recipes/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch
 delete mode 100644 recipes/xorg-lib/pixman_0.12.0.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.16.2.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.18.4.bb
 delete mode 100644 recipes/xorg-lib/pixman_0.20.0.bb
 delete mode 100644 recipes/xorg-lib/xtrans_1.2.5.bb

diff --git a/recipes/obsolete/xorg-lib/libdmx_1.1.0.bb b/recipes/obsolete/xorg-lib/libdmx_1.1.0.bb
new file mode 100644
index 0000000..5a806a4
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libdmx_1.1.0.bb
@@ -0,0 +1,8 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Distributed Multihead extension library"
+DEPENDS += "libxext dmxproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a2fcf0382837888d3781b714489a8999"
+SRC_URI[archive.sha256sum] = "1904a8f848cc5d76105cb07707890aca095540a37fb0a63d359f71da51d3e2d5"
diff --git a/recipes/obsolete/xorg-lib/libfontenc_1.0.5.bb b/recipes/obsolete/xorg-lib/libfontenc_1.0.5.bb
new file mode 100644
index 0000000..6c11158
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libfontenc_1.0.5.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 font encoding library"
+LICENSE = "BSD-X"
+DEPENDS += "zlib xproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4f0d8191819be9f2bdf9dad49a65e43b"
+SRC_URI[archive.sha256sum] = "7f3cde0331e9ad3da720b1a8255e121673701199df0802b62380436e74222700"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg-lib/libfs_1.0.2.bb b/recipes/obsolete/xorg-lib/libfs_1.0.2.bb
new file mode 100644
index 0000000..d892132
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libfs_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Font Services library"
+DEPENDS += "xproto fontsproto xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ecf2d6a27da053500283e803efa2a808"
+SRC_URI[archive.sha256sum] = "af2a5fe5eaa2b026e10bddb4e3f39976dc13deb5dbdc714abe1f016435ce3049"
+
+XORG_PN = "libFS"
diff --git a/recipes/obsolete/xorg-lib/libice_1.0.6.bb b/recipes/obsolete/xorg-lib/libice_1.0.6.bb
new file mode 100644
index 0000000..1c7f3cb
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libice_1.0.6.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Inter-Client Exchange library"
+DEPENDS += "xproto xtrans"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2d39bc924af24325dae589e9a849180c"
+SRC_URI[archive.sha256sum] = "a8346859505d2aa27ecc4531f1c86d72801936d96c31c5beaeff4587441b568b"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libICE"
diff --git a/recipes/obsolete/xorg-lib/libpciaccess_0.10.9.bb b/recipes/obsolete/xorg-lib/libpciaccess_0.10.9.bb
new file mode 100644
index 0000000..d963c3c
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libpciaccess_0.10.9.bb
@@ -0,0 +1,6 @@
+require xorg-lib-common.inc
+DEPENDS += "xproto virtual/libx11"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "685cb20e7a6165bc010972f1183addbd"
+SRC_URI[archive.sha256sum] = "5ccb9683b8be76edfceab4bf006e1cce9018e0d3dea5e54aa72e82798213fead"
diff --git a/recipes/obsolete/xorg-lib/libsm_1.1.1.bb b/recipes/obsolete/xorg-lib/libsm_1.1.1.bb
new file mode 100644
index 0000000..b87bcdf
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libsm_1.1.1.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Session management library"
+DEPENDS += "libice xproto xtrans util-linux-ng"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6889a455496aaaa65b1fa05fc518d179"
+SRC_URI[archive.sha256sum] = "f50d184d8c6a031b3ff4f0d52efcfd4ffa811b0362b166a9ff9ba4c2e9aa7ce0"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libSM"
diff --git a/recipes/obsolete/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch b/recipes/obsolete/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
new file mode 100644
index 0000000..2e2d475
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
@@ -0,0 +1,33 @@
+From affc2488a7f2660a74dc8354fc3e0bff2c4f879c Mon Sep 17 00:00:00 2001
+From: Dan Nicholson <dbn.lists@gmail.com>
+Date: Sat, 06 Nov 2010 21:58:09 +0000
+Subject: config: Fix architecture check for OS/2 to skip nios2 cpu
+
+The OS/2 platform requires some utility functions as well as having a
+non-32 bit wchar_t. Fix the configure check so that it doesn't also
+affect the nios2 cpu, which wouldn't influence these operating system
+issues.
+
+Signed-off-by: Dan Nicholson <dbn.lists@gmail.com>
+Tested-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Julien Cristau <jcristau@debian.org>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+---
+diff --git a/configure.ac b/configure.ac
+index 1b4a8b7..01f43fb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -246,8 +246,8 @@ dnl AC_PATH_XTRA
+ 
+ # arch specific things
+ WCHAR32="1"
+-case $target_alias in
+-  *os2*) os2="true" ; WCHAR32="0" ;;
++case $target_os in
++  os2*) os2="true" ; WCHAR32="0" ;;
+   *) ;;
+ esac
+ AC_SUBST(WCHAR32)
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg-lib/libx11-1.3.2/dolt-fix.patch b/recipes/obsolete/xorg-lib/libx11-1.3.2/dolt-fix.patch
new file mode 100644
index 0000000..ea1a8bd
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libx11-1.3.2/dolt-fix.patch
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
diff --git a/recipes/obsolete/xorg-lib/libx11-1.3.2/keysymdef_include.patch b/recipes/obsolete/xorg-lib/libx11-1.3.2/keysymdef_include.patch
new file mode 100644
index 0000000..7e725b2
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libx11-1.3.2/keysymdef_include.patch
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
++AC_ARG_WITH(keysymdefdir,
++	AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
++	KEYSYMDEF=$withval/keysymdef.h, KEYSYMDEF="")
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
diff --git a/recipes/obsolete/xorg-lib/libx11-1.3.2/x11_disable_makekeys.patch b/recipes/obsolete/xorg-lib/libx11-1.3.2/x11_disable_makekeys.patch
new file mode 100644
index 0000000..5d0a24c
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libx11-1.3.2/x11_disable_makekeys.patch
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
diff --git a/recipes/obsolete/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch b/recipes/obsolete/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
new file mode 100644
index 0000000..2e2d475
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
@@ -0,0 +1,33 @@
+From affc2488a7f2660a74dc8354fc3e0bff2c4f879c Mon Sep 17 00:00:00 2001
+From: Dan Nicholson <dbn.lists@gmail.com>
+Date: Sat, 06 Nov 2010 21:58:09 +0000
+Subject: config: Fix architecture check for OS/2 to skip nios2 cpu
+
+The OS/2 platform requires some utility functions as well as having a
+non-32 bit wchar_t. Fix the configure check so that it doesn't also
+affect the nios2 cpu, which wouldn't influence these operating system
+issues.
+
+Signed-off-by: Dan Nicholson <dbn.lists@gmail.com>
+Tested-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Julien Cristau <jcristau@debian.org>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+---
+diff --git a/configure.ac b/configure.ac
+index 1b4a8b7..01f43fb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -246,8 +246,8 @@ dnl AC_PATH_XTRA
+ 
+ # arch specific things
+ WCHAR32="1"
+-case $target_alias in
+-  *os2*) os2="true" ; WCHAR32="0" ;;
++case $target_os in
++  os2*) os2="true" ; WCHAR32="0" ;;
+   *) ;;
+ esac
+ AC_SUBST(WCHAR32)
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg-lib/libx11-1.3.6/dolt-fix.patch b/recipes/obsolete/xorg-lib/libx11-1.3.6/dolt-fix.patch
new file mode 100644
index 0000000..7e96075
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libx11-1.3.6/dolt-fix.patch
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
diff --git a/recipes/obsolete/xorg-lib/libx11-1.3.6/keysymdef_include.patch b/recipes/obsolete/xorg-lib/libx11-1.3.6/keysymdef_include.patch
new file mode 100644
index 0000000..1a30e34
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libx11-1.3.6/keysymdef_include.patch
@@ -0,0 +1,19 @@
+diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
+--- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
++++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
+@@ -355,7 +355,14 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysym definitions])
+-KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++AC_ARG_WITH(keysymdefdir,
++        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
++        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
++
++if test x$KEYSYMDEFDIR = x; then
++	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++fi
++
+ FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
+ for i in $FILES; do
+     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/recipes/obsolete/xorg-lib/libx11-1.3.6/x11_disable_makekeys.patch b/recipes/obsolete/xorg-lib/libx11-1.3.6/x11_disable_makekeys.patch
new file mode 100644
index 0000000..9763313
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libx11-1.3.6/x11_disable_makekeys.patch
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
diff --git a/recipes/obsolete/xorg-lib/libx11_1.3.2.bb b/recipes/obsolete/xorg-lib/libx11_1.3.2.bb
new file mode 100644
index 0000000..189d1ff
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libx11_1.3.2.bb
@@ -0,0 +1,11 @@
+require libx11.inc
+PR = "${INC_PR}.3"
+# gcc 4.5 ends up ICEing with thumb and -O1 with -fno-omit-framepointer
+# therefore if we are in thumb mode then we use -Os instead of -O1 for
+# DEBUG_OPTIMIZATION
+
+DEBUG_OPTIMIZATION_thumb_append = " -Os"
+SRC_URI += " file://dolt-fix.patch"
+SRC_URI += " file://configure.ac-nios2.patch"
+SRC_URI[archive.md5sum] = "001d780829f936e34851ef7cd37b4dfd"
+SRC_URI[archive.sha256sum] = "4def4d5c9fce85d690f1f29d675154594acdea3d3fe792d0cb513732c7b4bcb2"
diff --git a/recipes/obsolete/xorg-lib/libx11_1.3.6.bb b/recipes/obsolete/xorg-lib/libx11_1.3.6.bb
new file mode 100644
index 0000000..8d9f343
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libx11_1.3.6.bb
@@ -0,0 +1,7 @@
+require libx11.inc
+PR = "${INC_PR}.1"
+
+SRC_URI += " file://dolt-fix.patch"
+SRC_URI += " file://configure.ac-nios2.patch"
+SRC_URI[archive.md5sum] = "8e0a8a466aa78f66e09fe06cb395319f"
+SRC_URI[archive.sha256sum] = "599826765c59a98b1e58b4f6c4ad50dca69eeb0e7bd78aea736ca815f45bea40"
diff --git a/recipes/obsolete/xorg-lib/libxau_1.0.5.bb b/recipes/obsolete/xorg-lib/libxau_1.0.5.bb
new file mode 100644
index 0000000..3e95f97
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxau_1.0.5.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "A Sample Authorization Protocol for X"
+DEPENDS += " xproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "993b3185c629e4b89401fca072dcb663"
+SRC_URI[archive.sha256sum] = "a503b3e88d29fa9c45cce1b2d1af54106c2ce21491348c394e251a071d8108ee"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXau"
diff --git a/recipes/obsolete/xorg-lib/libxaw_1.0.7.bb b/recipes/obsolete/xorg-lib/libxaw_1.0.7.bb
new file mode 100644
index 0000000..e072411
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxaw_1.0.7.bb
@@ -0,0 +1,25 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Athena Widget Set"
+DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "815e74de989ccda684e2baf8d12cf519"
+SRC_URI[archive.sha256sum] = "740aaee9b09586b1c80f80890381c5ee70ea11efa4b6159f707c0f3684c6f328"
+
+# disable docs as groff detection doesn't work on some hosts while cross compilling
+EXTRA_OECONF += " --disable-docs "
+
+do_install_append () {
+        ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
+        ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
+        ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
+}
+
+PACKAGES =+ "libxaw6 libxaw7 libxaw8"
+
+FILES_libxaw6 = "${libdir}/libXaw*.so.6*"
+FILES_libxaw7 = "${libdir}/libXaw*.so.7*"
+FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
+
+XORG_PN = "libXaw"
diff --git a/recipes/obsolete/xorg-lib/libxcomposite_0.4.1.bb b/recipes/obsolete/xorg-lib/libxcomposite_0.4.1.bb
new file mode 100644
index 0000000..f9460c3
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxcomposite_0.4.1.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Composite extension library."
+LICENSE = "BSD-X"
+DEPENDS += " compositeproto virtual/libx11 libxfixes libxext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0f1367f57fdf5df17a8dd71d0fa68248"
+SRC_URI[archive.sha256sum] = "3715a25565222d8eb0468805db1113b514128ee5e9bc6908400f189f680d7a13"
+
+XORG_PN = "libXcomposite"
diff --git a/recipes/obsolete/xorg-lib/libxcursor_1.1.10.bb b/recipes/obsolete/xorg-lib/libxcursor_1.1.10.bb
new file mode 100644
index 0000000..7f3f0f9
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxcursor_1.1.10.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X cursor management library"
+LICENSE = "BSD-X"
+DEPENDS += "libxrender libxfixes"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7dcdad1c10daea872cb3355af414b2ca"
+SRC_URI[archive.sha256sum] = "b9446df62203f2c3204b6bcc0057dc909d0dc792f0dd97bc491581b08be36cbd"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXcursor"
diff --git a/recipes/obsolete/xorg-lib/libxdamage_1.1.2.bb b/recipes/obsolete/xorg-lib/libxdamage_1.1.2.bb
new file mode 100644
index 0000000..294e514
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxdamage_1.1.2.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 damaged region extension library"
+LICENSE = "BSD-X"
+DEPENDS += "damageproto libxfixes"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b42780bce703ec202a33e5693991c09d"
+SRC_URI[archive.sha256sum] = "a56a10acb34827c4d1a0ee282a338cbb04baa03d7fc7bc69e5690915c8fc7c0a"
+
+XORG_PN = "libXdamage"
diff --git a/recipes/obsolete/xorg-lib/libxdmcp_1.0.3.bb b/recipes/obsolete/xorg-lib/libxdmcp_1.0.3.bb
new file mode 100644
index 0000000..1e38efa
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxdmcp_1.0.3.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Display Manager Control Protocol library"
+DEPENDS += "xproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d60941d471800f41a3f19b24bea855a7"
+SRC_URI[archive.sha256sum] = "d8033a2fae20fed6de4f16b73ad69ca1c511e7da31c88e9bc6e75976187378cb"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXdmcp"
diff --git a/recipes/obsolete/xorg-lib/libxevie_1.0.2.bb b/recipes/obsolete/xorg-lib/libxevie_1.0.2.bb
new file mode 100644
index 0000000..d418768
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxevie_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 EvIE extension library"
+DEPENDS += "libxext evieext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "88e9bf535364e7c821ef4014fb1ca2dd"
+SRC_URI[archive.sha256sum] = "ff70b81ad145932db2d206735cefcb698dadad241001df7ba6b97e8081d174da"
+
+XORG_PN = "libXevie"
diff --git a/recipes/obsolete/xorg-lib/libxext_1.1.1.bb b/recipes/obsolete/xorg-lib/libxext_1.1.1.bb
new file mode 100644
index 0000000..d3d6c66
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxext_1.1.1.bb
@@ -0,0 +1,12 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 miscellaneous extension library"
+DEPENDS += "xproto virtual/libx11 xextproto libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c417c0e8df39a067f90a2a2e7133637d"
+SRC_URI[archive.sha256sum] = "110ce3bc7fb3a86659556994d0801c74bedcbd8ba8d1f90ee33d4c47a91e9bb3"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXext"
diff --git a/recipes/obsolete/xorg-lib/libxfixes_4.0.4.bb b/recipes/obsolete/xorg-lib/libxfixes_4.0.4.bb
new file mode 100644
index 0000000..26ccb96
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxfixes_4.0.4.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Fixes extension library."
+LICENSE = "BSD-X"
+DEPENDS += "virtual/libx11 xproto fixesproto xextproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7f2c40852eb337b237ad944ca5c30d49"
+SRC_URI[archive.sha256sum] = "ba31d7e5c5c1907c30cba50bfd669aa7fe860555287c29f6e786612e4be33b48"
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXfixes"
diff --git a/recipes/obsolete/xorg-lib/libxfont_1.4.1.bb b/recipes/obsolete/xorg-lib/libxfont_1.4.1.bb
new file mode 100644
index 0000000..8d046d1
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxfont_1.4.1.bb
@@ -0,0 +1,16 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 font rasterisation library"
+LICENSE = "BSD-X"
+DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4f2bed2a2be82e90a51a24bb3a22cdf0"
+SRC_URI[archive.sha256sum] = "112bfc30820b98deec4c9914536c5aa2f8b5162bd2b0bdb342343168e06f7679"
+
+# disable docs
+EXTRA_OECONF += " --disable-devel-docs "
+
+BBCLASSEXTEND = "native"
+
+XORG_PN = "libXfont"
diff --git a/recipes/obsolete/xorg-lib/libxft-2.1.14/autotools.patch b/recipes/obsolete/xorg-lib/libxft-2.1.14/autotools.patch
new file mode 100644
index 0000000..62f4442
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxft-2.1.14/autotools.patch
@@ -0,0 +1,54 @@
+Index: libXft-2.1.14/configure.ac
+===================================================================
+--- libXft-2.1.14.orig/configure.ac	2009-10-10 01:44:49.000000000 +0200
++++ libXft-2.1.14/configure.ac	2009-12-23 20:56:25.759695121 +0100
+@@ -37,26 +37,14 @@
+ # Require xorg-macros: XORG_DEFAULT_OPTIONS
+ m4_ifndef([XORG_MACROS_VERSION], [AC_FATAL([must install xorg-macros 1.3 or later before running autoconf/autogen])])
+ XORG_MACROS_VERSION(1.3)
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS([config.h])
++AC_CONFIG_HEADERS([include/X11/Xft/Xft.h])
+ 
+ # checks for progs
+ AC_PROG_CC
+ AC_PROG_LIBTOOL
+ XORG_DEFAULT_OPTIONS
+ 
+-# Set library version for Xft.h from package version set in AC_INIT
+-# copied from PACKAGE_VERSION_* settings in XORG_VERSION
+-AC_CONFIG_HEADERS([include/X11/Xft/Xft.h])
+-AC_DEFINE_UNQUOTED([XFT_MAJOR],
+-                [`echo $PACKAGE_VERSION | cut -d . -f 1`],
+-                [Major version of Xft])
+-AC_DEFINE_UNQUOTED([XFT_MINOR],
+-                [`echo $PACKAGE_VERSION | cut -d . -f 2 | cut -d - -f 1`],
+-                [Minor version of Xft])
+-AC_DEFINE_UNQUOTED([XFT_REVISION],
+-                [`echo $PACKAGE_VERSION | cut -d . -f 3 | cut -d - -f 1`],
+-                [Micro revision of Xft])
+-
+ #
+ # Check for Xrender
+ #
+Index: libXft-2.1.14/include/X11/Xft/Xft.h.in
+===================================================================
+--- libXft-2.1.14.orig/include/X11/Xft/Xft.h.in	2009-10-06 09:36:40.000000000 +0200
++++ libXft-2.1.14/include/X11/Xft/Xft.h.in	2009-12-23 20:55:52.063859518 +0100
+@@ -27,11 +27,12 @@
+  * Current Xft version number, set from version in the Xft configure.ac file.
+  */
+ 
+-#undef XFT_MAJOR	/* Will be substituted by configure */
+-#undef XFT_MINOR	/* Will be substituted by configure */
+-#undef XFT_REVISION	/* Will be substituted by configure */
++/* Will be substituted by configure */
++#undef PACKAGE_VERSION_MAJOR
++#undef PACKAGE_VERSION_MINOR
++#undef PACKAGE_VERSION_PATCHLEVEL
+ 
+-#define XFT_VERSION	((XFT_MAJOR * 10000) + (XFT_MINOR * 100) + (XFT_REVISION))
++#define XFT_VERSION	((PACKAGE_VERSION_MAJOR * 10000) + (PACKAGE_VERSION_MINOR * 100) + (PACKAGE_VERSION_PATCHLEVEL))
+ #define XftVersion	XFT_VERSION
+ 
+ #include <stdarg.h>
diff --git a/recipes/obsolete/xorg-lib/libxft_2.1.14.bb b/recipes/obsolete/xorg-lib/libxft_2.1.14.bb
new file mode 100644
index 0000000..34fadcd
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxft_2.1.14.bb
@@ -0,0 +1,22 @@
+require xorg-lib-common.inc
+DESCRIPTION = "FreeType-based font drawing library for X"
+DEPENDS += "libxrender freetype fontconfig"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://autotools.patch"
+SRC_URI[archive.md5sum] = "254e62a233491e0e1251636536163e20"
+SRC_URI[archive.sha256sum] = "700e9d594b81cad3dfd5fac4a5cfd0c4cf7780c812507ef04eb40139ebf5175e"
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
diff --git a/recipes/obsolete/xorg-lib/libxi_1.3.bb b/recipes/obsolete/xorg-lib/libxi_1.3.bb
new file mode 100644
index 0000000..22ef799
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxi_1.3.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Input extension library"
+DEPENDS += "libxext inputproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8df4ece9bd1efb02c28acb2b6f485e09"
+SRC_URI[archive.sha256sum] = "362b8c0c60386841063bd7e01afa72e37eb87ada6e64e539d960f88c780a944b"
+
+XORG_PN = "libXi"
diff --git a/recipes/obsolete/xorg-lib/libxinerama_1.1.bb b/recipes/obsolete/xorg-lib/libxinerama_1.1.bb
new file mode 100644
index 0000000..4d5f427
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxinerama_1.1.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Xinerama extension library"
+DEPENDS += "libxext xineramaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a2ac01fc0426cdbb713c5d59cf9955ed"
+SRC_URI[archive.sha256sum] = "e0d39e74c2e131b44cc98dd4910165c9b8d937df93be58e6afb7c2a56772bf34"
+
+XORG_PN = "libXinerama"
diff --git a/recipes/obsolete/xorg-lib/libxkbfile_1.0.6.bb b/recipes/obsolete/xorg-lib/libxkbfile_1.0.6.bb
new file mode 100644
index 0000000..a7fc91d
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxkbfile_1.0.6.bb
@@ -0,0 +1,11 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 keyboard file manipulation library"
+LICENSE = "GPL"
+DEPENDS += "virtual/libx11 kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b01156e263eca8177e6b7f10441951c4"
+SRC_URI[archive.sha256sum] = "2ca43c1f6b2782994167a328471aa859d366cd7303c6dcbc8bda951a84a06039"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg-lib/libxmu_1.0.5.bb b/recipes/obsolete/xorg-lib/libxmu_1.0.5.bb
new file mode 100644
index 0000000..5f361ef
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxmu_1.0.5.bb
@@ -0,0 +1,17 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 miscellaneous utility library"
+DEPENDS += "libxt libxext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fc4d66be7a1a1eb474954728415e46d6"
+SRC_URI[archive.sha256sum] = "0692b6b0ec1019cfaa8418020b1127bfb0975f5a579a0b1f9eb7fd8f2f7126d7"
+
+PACKAGES =+ "libxmuu libxmuu-dev"
+
+FILES_libxmuu = "${libdir}/libXmuu.so.*"
+FILES_libxmuu-dev = "${libdir}/libXmuu.so"
+
+LEAD_SONAME = "libXmu"
+
+XORG_PN = "libXmu"
diff --git a/recipes/obsolete/xorg-lib/libxpm_3.5.8.bb b/recipes/obsolete/xorg-lib/libxpm_3.5.8.bb
new file mode 100644
index 0000000..9bb7c8e
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxpm_3.5.8.bb
@@ -0,0 +1,16 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Pixmap library"
+LICENSE = "X-BSD"
+DEPENDS += "libxext libsm libxt"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "38e58e72d476a74298a59052fde185a3"
+SRC_URI[archive.sha256sum] = "02a77aaa32e6e335e1ee04aeb9ad1008045d98274d64ed33bc5fc6c3a3542c4c"
+
+PACKAGES =+ "sxpm cxpm"
+
+FILES_cxpm = "${bindir}/cxpm"
+FILES_sxpm = "${bindir}/sxpm"
+
+XORG_PN = "libXpm"
diff --git a/recipes/obsolete/xorg-lib/libxrandr_1.2.1.bb b/recipes/obsolete/xorg-lib/libxrandr_1.2.1.bb
new file mode 100644
index 0000000..983265d
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxrandr_1.2.1.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Resize and Rotate extension library"
+LICENSE = "BSD-X"
+DEPENDS += "randrproto libxrender libxext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5860360f5b038cc728f388f875ce525d"
+SRC_URI[archive.sha256sum] = "2d2df642eb8e0527936cdf4ed1c096f69df53e9b95e2532c8ed0cabd06a45407"
+
+BBCLASSEXTEND = "nativesdk"
+
+XORG_PN = "libXrandr"
diff --git a/recipes/obsolete/xorg-lib/libxrandr_1.3.0.bb b/recipes/obsolete/xorg-lib/libxrandr_1.3.0.bb
new file mode 100644
index 0000000..6808e08
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxrandr_1.3.0.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Resize and Rotate extension library"
+LICENSE = "BSD-X"
+DEPENDS += "randrproto libxrender libxext"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "68eb59c3b7524db6ffd78746ee893d1d"
+SRC_URI[archive.sha256sum] = "5961ce0f77c5173a8208b3ed669ac01719f2bf4a10517ffa6c33a5e064802e78"
+
+BBCLASSEXTEND = "nativesdk"
+
+XORG_PN = "libXrandr"
diff --git a/recipes/obsolete/xorg-lib/libxrender_0.9.5.bb b/recipes/obsolete/xorg-lib/libxrender_0.9.5.bb
new file mode 100644
index 0000000..047b8d7
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxrender_0.9.5.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Rendering Extension client library"
+LICENSE = "BSD-X"
+DEPENDS += "virtual/libx11 renderproto xproto libxdmcp"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "276dd9e85daf0680616cd9f132b354c9"
+SRC_URI[archive.sha256sum] = "bc0590438a4be2b674cbac6f4ad46e5a89acd02aa94817da0fa8eb3ef05ed5d5"
+
+BBCLASSEXTEND = "native nativesdk"
+
+XORG_PN = "libXrender"
diff --git a/recipes/obsolete/xorg-lib/libxres_1.0.4.bb b/recipes/obsolete/xorg-lib/libxres_1.0.4.bb
new file mode 100644
index 0000000..2049beb
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxres_1.0.4.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Resource extension library"
+DEPENDS += "libxext resourceproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4daf91f93d924e693f6f6ed276791be2"
+SRC_URI[archive.sha256sum] = "457f567a70ef8798cfb32f897ffa52c3f010923b07414b3a42277f56877572df"
+
+XORG_PN = "libXres"
diff --git a/recipes/obsolete/xorg-lib/libxscrnsaver_1.2.0.bb b/recipes/obsolete/xorg-lib/libxscrnsaver_1.2.0.bb
new file mode 100644
index 0000000..f02ff38
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxscrnsaver_1.2.0.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Screen Saver extension library"
+LICENSE = "GPL"
+DEPENDS += "libxext scrnsaverproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "33e54f64b55f22d8bbe822a5b62568cb"
+SRC_URI[archive.sha256sum] = "5b067bec0f2eb6405226bde5f20ca107eb0e5c11f5e5e24b455930c450487f85"
+
+RREPLACES_${PN} = "libxss"
+
+XORG_PN = "libXScrnSaver"
diff --git a/recipes/obsolete/xorg-lib/libxt_1.0.7.bb b/recipes/obsolete/xorg-lib/libxt_1.0.7.bb
new file mode 100644
index 0000000..238ea06
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxt_1.0.7.bb
@@ -0,0 +1,22 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 toolkit intrinsics library"
+DEPENDS += "libsm virtual/libx11 kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "96f3c93434a93186d178b60d4a262496"
+SRC_URI[archive.sha256sum] = "706d5248b061c8455f74ce5269ecc5ef59c27d0f52d22b07138f781928dda9ec"
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
diff --git a/recipes/obsolete/xorg-lib/libxtst_1.1.0.bb b/recipes/obsolete/xorg-lib/libxtst_1.1.0.bb
new file mode 100644
index 0000000..2a0ffbe
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxtst_1.1.0.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Test Extension: client side library"
+DEPENDS += "libxext recordproto inputproto libxi"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "dd6f3e20b87310187121539f9605d977"
+SRC_URI[archive.sha256sum] = "bd440f4779e06957211ba83782a5a1cfbf1d42b14fd3510a6dce440489a4eb26"
+
+XORG_PN = "libXtst"
diff --git a/recipes/obsolete/xorg-lib/libxv_1.0.5.bb b/recipes/obsolete/xorg-lib/libxv_1.0.5.bb
new file mode 100644
index 0000000..7a60af8
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxv_1.0.5.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Video extension library"
+LICENSE = "GPL"
+DEPENDS += "libxext videoproto"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1d97798b1d8bbf8d9085e1b223a0738f"
+SRC_URI[archive.sha256sum] = "d549afdf22feefb97cca85dee12242af9f08c4d2435255dc7c30bd17d1d96010"
+
+XORG_PN = "libXv"
diff --git a/recipes/obsolete/xorg-lib/libxxf86dga_1.1.1.bb b/recipes/obsolete/xorg-lib/libxxf86dga_1.1.1.bb
new file mode 100644
index 0000000..aafe621
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxxf86dga_1.1.1.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Direct Graphics Access extension library"
+DEPENDS += "libxext xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "368837d3d7a4d3b4f70be48383e3544e"
+SRC_URI[archive.sha256sum] = "8d37f8895ecff15cb821a3e77bd505598983a5c6eae546e77e2d3070a8de5616"
+
+XORG_PN = "libXxf86dga"
diff --git a/recipes/obsolete/xorg-lib/libxxf86misc_1.0.2.bb b/recipes/obsolete/xorg-lib/libxxf86misc_1.0.2.bb
new file mode 100644
index 0000000..a44b46f
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxxf86misc_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 XFree86 miscellaneous extension library"
+DEPENDS += "libxext xf86miscproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "51fed53e8de067d4b8666f75a0212400"
+SRC_URI[archive.sha256sum] = "8e64b6b1bf34fcd112b1fd866d77e110b47794e825a996e4492c0ee408957cb3"
+
+XORG_PN = "libXxf86misc"
diff --git a/recipes/obsolete/xorg-lib/libxxf86vm_1.1.0.bb b/recipes/obsolete/xorg-lib/libxxf86vm_1.1.0.bb
new file mode 100644
index 0000000..181f220
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/libxxf86vm_1.1.0.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 XFree86 video mode extension library"
+DEPENDS += "libxext xf86vidmodeproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b431ad7084e1055fef99a9115237edd8"
+SRC_URI[archive.sha256sum] = "7cc5e577b337c5267f4e65741f27229111ada8cb833e24b47713a683e8838de8"
+
+XORG_PN = "libXxf86vm"
diff --git a/recipes/obsolete/xorg-lib/pixman-0.12.0/pixman-arm.patch b/recipes/obsolete/xorg-lib/pixman-0.12.0/pixman-arm.patch
new file mode 100644
index 0000000..91dda03
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.12.0/pixman-arm.patch
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.12.0/pixman-x888-565.patch b/recipes/obsolete/xorg-lib/pixman-0.12.0/pixman-x888-565.patch
new file mode 100644
index 0000000..a3fa331
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.12.0/pixman-x888-565.patch
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.18.4/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/obsolete/xorg-lib/pixman-0.18.4/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
new file mode 100644
index 0000000..b2488de
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.18.4/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
@@ -0,0 +1,114 @@
+From 05875eca09ee23ea04ccb32f87c7c355fd1b88f3 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Tue, 16 Mar 2010 16:55:28 +0100
+Subject: [PATCH 1/7] Generic C implementation of pixman_blt with overlapping support
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.18.4/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/obsolete/xorg-lib/pixman-0.18.4/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
new file mode 100644
index 0000000..ca6a3c5
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.18.4/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
@@ -0,0 +1,91 @@
+From 8aca14948a43f5cfd478e22cef745e55960d68cb Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:47 +0300
+Subject: [PATCH 2/7] Support of overlapping src/dst for pixman_blt_mmx
+
+---
+ pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
+index d51b40c..6e0296b 100644
+--- a/pixman/pixman-mmx.c
++++ b/pixman/pixman-mmx.c
+@@ -2996,34 +2996,43 @@ pixman_blt_mmx (uint32_t *src_bits,
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
+@@ -3033,7 +3042,7 @@ pixman_blt_mmx (uint32_t *src_bits,
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.18.4/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/obsolete/xorg-lib/pixman-0.18.4/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
new file mode 100644
index 0000000..faeb6e6
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.18.4/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
@@ -0,0 +1,91 @@
+From 56c446d6912936eabcc6bdd583f37ee1209eff8c Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:54 +0300
+Subject: [PATCH 3/7] Support of overlapping src/dst for pixman_blt_sse2
+
+---
+ pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
+index d5349d7..aa34012 100644
+--- a/pixman/pixman-sse2.c
++++ b/pixman/pixman-sse2.c
+@@ -5328,34 +5328,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
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
+@@ -5368,7 +5377,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.18.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/obsolete/xorg-lib/pixman-0.18.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
new file mode 100644
index 0000000..d56fd99
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.18.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
@@ -0,0 +1,94 @@
+From 80c1eae677a6ea10d67bb7328230626cd8fce08e Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Wed, 18 Nov 2009 06:08:48 +0200
+Subject: [PATCH 4/7] Support of overlapping src/dst for pixman_blt_neon
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.18.4/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/recipes/obsolete/xorg-lib/pixman-0.18.4/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
new file mode 100644
index 0000000..39eda8b
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.18.4/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
@@ -0,0 +1,169 @@
+From 2f5774db49521e990c5e9f7cac684a06f4e67a43 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 10 Dec 2009 00:51:50 +0200
+Subject: [PATCH 5/7] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.18.4/0006-A-copy-paste-version-of-16bpp-bilinear-scanline-fetc.patch b/recipes/obsolete/xorg-lib/pixman-0.18.4/0006-A-copy-paste-version-of-16bpp-bilinear-scanline-fetc.patch
new file mode 100644
index 0000000..dd0e0f6
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.18.4/0006-A-copy-paste-version-of-16bpp-bilinear-scanline-fetc.patch
@@ -0,0 +1,261 @@
+From fc24a2d8d0039cd10de4175da40bb784e2c3bf49 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Fri, 4 Dec 2009 16:49:19 +0000
+Subject: [PATCH 6/7] A copy-paste version of 16bpp bilinear scanline fetcher
+
+---
+ pixman/pixman-bits-image.c |  228 +++++++++++++++++++++++++++++++++++++++++++-
+ 1 files changed, 223 insertions(+), 5 deletions(-)
+
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
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg-lib/pixman-0.18.4/0007-ARM-added-missing-cache-preload.patch b/recipes/obsolete/xorg-lib/pixman-0.18.4/0007-ARM-added-missing-cache-preload.patch
new file mode 100644
index 0000000..f601d2c
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.18.4/0007-ARM-added-missing-cache-preload.patch
@@ -0,0 +1,32 @@
+From af8a33d3b132c0192d59c47426bb3a201cb64b32 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Fri, 21 May 2010 13:31:03 +0000
+Subject: [PATCH 7/7] ARM: added missing cache preload
+
+---
+ pixman/pixman-arm-neon-asm.S |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index f30869e..dc7fd69 100644
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
+@@ -680,6 +681,7 @@ generate_composite_function_single_scanline \
+     vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
+     vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
+     pixman_composite_over_8888_8888_process_pixblock_head
++    cache_preload 8, 8
+ .endm
+ 
+ .macro pixman_composite_over_n_8888_init
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg-lib/pixman-0.18.4/565-over-neon.patch b/recipes/obsolete/xorg-lib/pixman-0.18.4/565-over-neon.patch
new file mode 100644
index 0000000..c8156c4
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.18.4/565-over-neon.patch
@@ -0,0 +1,23 @@
+From d297443267de0f5fab49ec245df9055a0dddddaf Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Tue, 25 May 2010 17:21:26 +0000
+Subject: ARM: NEON: don't hit general path for r5g6b5 OVER r5g6b5 operation
+
+OVER can't be reduced to SRC because the source image is not
+considered opaque when repeat is set to PIXMAN_REPEAT_NONE.
+An additional fast path table entry solves the problem.
+---
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 64aa908..394dcea 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -246,6 +246,7 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
+     PIXMAN_STD_FAST_PATH (OVER, a8b8g8r8, null,     x8b8g8r8, neon_composite_over_8888_8888),
+     PIXMAN_STD_FAST_PATH (OVER, x8r8g8b8, null,     a8r8g8b8, neon_composite_src_x888_8888),
+     PIXMAN_STD_FAST_PATH (OVER, x8b8g8r8, null,     a8b8g8r8, neon_composite_src_x888_8888),
++    PIXMAN_STD_FAST_PATH (OVER, r5g6b5,   null,     r5g6b5,   neon_composite_src_0565_0565),
+     PIXMAN_STD_FAST_PATH (ADD,  solid,    a8,       a8,       neon_composite_add_n_8_8),
+     PIXMAN_STD_FAST_PATH (ADD,  a8,       a8,       a8,       neon_composite_add_8_8_8),
+     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, a8r8g8b8, a8r8g8b8, neon_composite_add_8888_8888_8888),
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg-lib/pixman-0.18.4/neon-reverse-u.patch b/recipes/obsolete/xorg-lib/pixman-0.18.4/neon-reverse-u.patch
new file mode 100644
index 0000000..76726ce
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.18.4/neon-reverse-u.patch
@@ -0,0 +1,175 @@
+From e0017c2a676b267900e48c6f32a6e973395c83d3 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Mon, 31 May 2010 16:24:43 +0000
+Subject: ARM: 'neon_combine_out_reverse_u' combiner
+
+---
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index f30869e..44fbfce 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -597,7 +597,7 @@ generate_composite_function_single_scanline \
+ 
+ /******************************************************************************/
+ 
+-.macro pixman_composite_over_8888_8888_process_pixblock_head
++.macro pixman_composite_out_reverse_8888_8888_process_pixblock_head
+     vmvn.8      d24, d3  /* get inverted alpha */
+     /* do alpha blending */
+     vmull.u8    q8, d24, d4
+@@ -606,7 +606,7 @@ generate_composite_function_single_scanline \
+     vmull.u8    q11, d24, d7
+ .endm
+ 
+-.macro pixman_composite_over_8888_8888_process_pixblock_tail
++.macro pixman_composite_out_reverse_8888_8888_process_pixblock_tail
+     vrshr.u16   q14, q8, #8
+     vrshr.u16   q15, q9, #8
+     vrshr.u16   q12, q10, #8
+@@ -615,6 +615,56 @@ generate_composite_function_single_scanline \
+     vraddhn.u16 d29, q15, q9
+     vraddhn.u16 d30, q12, q10
+     vraddhn.u16 d31, q13, q11
++.endm
++
++.macro pixman_composite_out_reverse_8888_8888_process_pixblock_tail_head
++    vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
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
++    vld4.8      {d0, d1, d2, d3}, [SRC]!
++                                    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
++    vmvn.8      d22, d3
++                                    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
++        vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
++                                    PF subge PF_X, PF_X, ORIG_W
++    vmull.u8    q8, d22, d4
++                                    PF subges PF_CTL, PF_CTL, #0x10
++    vmull.u8    q9, d22, d5
++                                    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
++    vmull.u8    q10, d22, d6
++                                    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
++    vmull.u8    q11, d22, d7
++.endm
++
++generate_composite_function_single_scanline \
++    pixman_composite_scanline_out_reverse_asm_neon, 32, 0, 32, \
++    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    default_init, \
++    default_cleanup, \
++    pixman_composite_out_reverse_8888_8888_process_pixblock_head, \
++    pixman_composite_out_reverse_8888_8888_process_pixblock_tail, \
++    pixman_composite_out_reverse_8888_8888_process_pixblock_tail_head
++
++/******************************************************************************/
++
++.macro pixman_composite_over_8888_8888_process_pixblock_head
++    pixman_composite_out_reverse_8888_8888_process_pixblock_head
++.endm
++
++.macro pixman_composite_over_8888_8888_process_pixblock_tail
++    pixman_composite_out_reverse_8888_8888_process_pixblock_tail
+     vqadd.u8    q14, q0, q14
+     vqadd.u8    q15, q1, q15
+ .endm
+@@ -1416,7 +1466,7 @@ generate_composite_function_single_scanline \
+ 
+ /******************************************************************************/
+ 
+-.macro pixman_composite_over_8888_n_8888_process_pixblock_head
++.macro pixman_composite_out_reverse_8888_n_8888_process_pixblock_head
+     /* expecting source data in {d0, d1, d2, d3} */
+     /* destination data in {d4, d5, d6, d7} */
+     /* solid mask is in d15 */
+@@ -1442,7 +1492,7 @@ generate_composite_function_single_scanline \
+     vmull.u8    q11, d24, d7
+ .endm
+ 
+-.macro pixman_composite_over_8888_n_8888_process_pixblock_tail
++.macro pixman_composite_out_reverse_8888_n_8888_process_pixblock_tail
+     vrshr.u16   q14, q8, #8
+     vrshr.u16   q15, q9, #8
+     vrshr.u16   q12, q10, #8
+@@ -1451,6 +1501,49 @@ generate_composite_function_single_scanline \
+     vraddhn.u16 d29, q15, q9
+     vraddhn.u16 d30, q12, q10
+     vraddhn.u16 d31, q13, q11
++.endm
++
++.macro pixman_composite_out_reverse_8888_8888_8888_init
++    vpush       {d8-d15}
++.endm
++
++.macro pixman_composite_out_reverse_8888_8888_8888_cleanup
++    vpop        {d8-d15}
++.endm
++
++/* TODO: expand macros and do better instructions scheduling */
++.macro pixman_composite_out_reverse_8888_8888_8888_process_pixblock_tail_head
++    vld4.8     {d4, d5, d6, d7}, [DST_R, :128]!
++    pixman_composite_out_reverse_8888_n_8888_process_pixblock_tail
++    vld4.8     {d0, d1, d2, d3}, [SRC]!
++    cache_preload 8, 8
++    vld4.8     {d12, d13, d14, d15}, [MASK]!
++    pixman_composite_out_reverse_8888_n_8888_process_pixblock_head
++    vst4.8     {d28, d29, d30, d31}, [DST_W, :128]!
++.endm
++
++generate_composite_function_single_scanline \
++    pixman_composite_scanline_out_reverse_mask_asm_neon, 32, 32, 32, \
++    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    pixman_composite_out_reverse_8888_8888_8888_init, \
++    pixman_composite_out_reverse_8888_8888_8888_cleanup, \
++    pixman_composite_out_reverse_8888_n_8888_process_pixblock_head, \
++    pixman_composite_out_reverse_8888_n_8888_process_pixblock_tail, \
++    pixman_composite_out_reverse_8888_8888_8888_process_pixblock_tail_head \
++    28, /* dst_w_basereg */ \
++    4,  /* dst_r_basereg */ \
++    0,  /* src_basereg   */ \
++    12  /* mask_basereg  */
++
++/******************************************************************************/
++
++.macro pixman_composite_over_8888_n_8888_process_pixblock_head
++    pixman_composite_out_reverse_8888_n_8888_process_pixblock_head
++.endm
++
++.macro pixman_composite_over_8888_n_8888_process_pixblock_tail
++    pixman_composite_out_reverse_8888_n_8888_process_pixblock_tail
+     vqadd.u8    q14, q0, q14
+     vqadd.u8    q15, q1, q15
+ .endm
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 394dcea..1be9606 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -335,6 +335,7 @@ neon_combine_##name##_u (pixman_implementation_t *imp,                   \
+ 
+ BIND_COMBINE_U (over)
+ BIND_COMBINE_U (add)
++BIND_COMBINE_U (out_reverse)
+ 
+ void
+ pixman_fetch_scanline_r5g6b5_asm_neon (int             width,
+@@ -382,6 +383,7 @@ _pixman_implementation_create_arm_neon (void)
+ 
+     imp->combine_32[PIXMAN_OP_OVER] = neon_combine_over_u;
+     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
++    imp->combine_32[PIXMAN_OP_OUT_REVERSE] = neon_combine_out_reverse_u;
+ 
+     _pixman_bits_override_accessors (PIXMAN_r5g6b5,
+                                      neon_fetch_scanline_r5g6b5,
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch b/recipes/obsolete/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch
new file mode 100644
index 0000000..43cd442
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch
@@ -0,0 +1,77 @@
+From 38aabb3be87ea68e37f34256c778d07f62680ec6 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 10 Dec 2009 00:51:50 +0200
+Subject: [PATCH 1/9] add _pixman_bits_override_accessors
+
+* from patch ARM: HACK: added NEON optimizations for fetch/store r5g6b5 scanline
+* used in 
+  0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
+  0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
+  0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
+
+
+---
+ pixman/pixman-access.c       |   23 ++++++++++++++++++++++-
+ pixman/pixman-private.h      |    5 +++++
+ 4 files changed, 87 insertions(+), 1 deletions(-)
+
+diff --git a/pixman/pixman-access.c b/pixman/pixman-access.c
+index f1ce0ba..b33da29 100644
+--- a/pixman/pixman-access.c
++++ b/pixman/pixman-access.c
+@@ -2836,7 +2836,7 @@ typedef struct
+ 	    store_scanline_ ## format, store_scanline_generic_64	\
+     }
+ 
+-static const format_info_t accessors[] =
++static format_info_t accessors[] =
+ {
+ /* 32 bpp formats */
+     FORMAT_INFO (a8r8g8b8),
+@@ -2978,6 +2978,27 @@ _pixman_bits_image_setup_accessors (bits_image_t *image)
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
++		info->fetch_scanline_32 = fetch_func;
++	    if (store_func)
++		info->store_scanline_32 = store_func;
++	    return;
++	}
++	info++;
++    }
++}
++
+ #else
+ 
+ void
+diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
+index d85868f..564f8f0 100644
+--- a/pixman/pixman-private.h
++++ b/pixman/pixman-private.h
+@@ -206,6 +206,11 @@ void
+ _pixman_bits_image_setup_accessors (bits_image_t *image);
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/obsolete/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
new file mode 100644
index 0000000..795cce5
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
@@ -0,0 +1,114 @@
+From 97b2bb933455f222b392b5c60a8bde82d7d6329f Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Tue, 16 Mar 2010 16:55:28 +0100
+Subject: [PATCH 1/8] Generic C implementation of pixman_blt with overlapping support
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
+index 4d234a0..c4d2c14 100644
+--- a/pixman/pixman-general.c
++++ b/pixman/pixman-general.c
+@@ -280,9 +280,24 @@ general_blt (pixman_implementation_t *imp,
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
+index c43172b..f980454 100644
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
+@@ -873,4 +874,46 @@ void pixman_timer_register (pixman_timer_t *timer);
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/obsolete/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
new file mode 100644
index 0000000..6e2d492
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
@@ -0,0 +1,91 @@
+From 47b31f936641da07431093ede340465625bfcb3d Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:47 +0300
+Subject: [PATCH 2/8] Support of overlapping src/dst for pixman_blt_mmx
+
+---
+ pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
+index e936c4c..2413197 100644
+--- a/pixman/pixman-mmx.c
++++ b/pixman/pixman-mmx.c
+@@ -2996,34 +2996,43 @@ pixman_blt_mmx (uint32_t *src_bits,
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
+@@ -3033,7 +3042,7 @@ pixman_blt_mmx (uint32_t *src_bits,
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/obsolete/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
new file mode 100644
index 0000000..910f62e
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
@@ -0,0 +1,91 @@
+From 13be027637602fffda3b3cb6e171d8d6a67b3b4b Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 22 Oct 2009 05:45:54 +0300
+Subject: [PATCH 3/8] Support of overlapping src/dst for pixman_blt_sse2
+
+---
+ pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
+ 1 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
+index 5907de0..25015ae 100644
+--- a/pixman/pixman-sse2.c
++++ b/pixman/pixman-sse2.c
+@@ -5027,34 +5027,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
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
+     while (height--)
+@@ -5064,7 +5073,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/obsolete/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
new file mode 100644
index 0000000..f6aa979
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
@@ -0,0 +1,94 @@
+From a913cc05a1a1c5a813cf06d248334edede9caab7 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Wed, 18 Nov 2009 06:08:48 +0200
+Subject: [PATCH 4/8] Support of overlapping src/dst for pixman_blt_neon
+
+---
+ pixman/pixman-arm-neon.c |   62 +++++++++++++++++++++++++++++++++++++--------
+ 1 files changed, 51 insertions(+), 11 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index be5d403..cbfd7cf 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -176,26 +176,66 @@ pixman_blt_neon (uint32_t *src_bits,
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
diff --git a/recipes/obsolete/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/recipes/obsolete/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
new file mode 100644
index 0000000..dbe98b3
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
@@ -0,0 +1,109 @@
+From f75e9d1868e21dd75ff3a2ca3561546d23877ddb Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 10 Dec 2009 00:51:50 +0200
+Subject: [PATCH 5/8] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
+
+---
+ pixman/pixman-arm-neon-asm.S |   20 ++++++++++++++++++++
+ pixman/pixman-arm-neon.c     |   40 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 60 insertions(+), 0 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index e4db5cd..c79ba81 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -459,6 +459,16 @@ generate_composite_function \
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
+@@ -494,6 +504,16 @@ generate_composite_function \
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
+ .macro pixman_composite_add_8_8_process_pixblock_head
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index cbfd7cf..f88c8f8 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -392,6 +392,42 @@ BIND_COMBINE_U (over)
+ BIND_COMBINE_U (add)
+ BIND_COMBINE_U (out_reverse)
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
++                            const uint32_t *mask)
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
+@@ -407,6 +443,10 @@ _pixman_implementation_create_arm_neon (void)
+     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
+     imp->combine_32[PIXMAN_OP_OUT_REVERSE] = neon_combine_out_reverse_u;
+ 
++    _pixman_bits_override_accessors (PIXMAN_r5g6b5,
++                                     neon_fetch_scanline_r5g6b5,
++                                     neon_store_scanline_r5g6b5);
++
+     imp->blt = arm_neon_blt;
+     imp->fill = arm_neon_fill;
+ 
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch b/recipes/obsolete/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
new file mode 100644
index 0000000..d050646
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
@@ -0,0 +1,148 @@
+From a1cd695c5e22f0f4a2b7272fab675a3cc510bacb Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Thu, 23 Sep 2010 21:10:56 +0300
+Subject: [PATCH 6/8] ARM: added NEON optimizations for fetch/store a8 scanline
+
+---
+ pixman/pixman-arm-neon-asm.S |   64 ++++++++++++++++++++++++++++++++++++++++++
+ pixman/pixman-arm-neon.c     |   42 +++++++++++++++++++++++++++
+ 2 files changed, 106 insertions(+), 0 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index c79ba81..ca0825c 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -418,6 +418,70 @@ generate_composite_function \
+ 
+ /******************************************************************************/
+ 
++.macro pixman_composite_src_8_8888_process_pixblock_head
++    /* This is tricky part: we can't set these values just once in 'init' macro
++     * because leading/trailing pixels handling part uses VZIP.8 instructions,
++     * and they operate on values in-place and destroy original registers
++     * content. Think about it like VST4.8 instruction corrupting NEON
++     * registers after write in 'tail_head' macro. Except that 'tail_head'
++     * macro itself actually does not need these extra VMOVs because it uses
++     * real VST4.8 instruction.
++     */
++    vmov.u8     q0, #0
++    vmov.u8     d2, #0
++.endm
++
++.macro pixman_composite_src_8_8888_process_pixblock_tail
++.endm
++
++.macro pixman_composite_src_8_8888_process_pixblock_tail_head
++    vst4.8      {d0, d1, d2, d3}, [DST_W, :128]!
++    vld1.8      {d3}, [SRC]!
++.endm
++
++generate_composite_function_single_scanline \
++    pixman_fetch_scanline_a8_asm_neon, 8, 0, 32, \
++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    default_init, \
++    default_cleanup, \
++    pixman_composite_src_8_8888_process_pixblock_head, \
++    pixman_composite_src_8_8888_process_pixblock_tail, \
++    pixman_composite_src_8_8888_process_pixblock_tail_head, \
++    0,  /* dst_w_basereg */ \
++    0,  /* dst_r_basereg */ \
++    3,  /* src_basereg   */ \
++    0   /* mask_basereg  */
++
++/******************************************************************************/
++
++.macro pixman_composite_src_8888_8_process_pixblock_head
++.endm
++
++.macro pixman_composite_src_8888_8_process_pixblock_tail
++.endm
++
++.macro pixman_composite_src_8888_8_process_pixblock_tail_head
++    vst1.8      {d3}, [DST_W, :64]!
++    vld4.8      {d0, d1, d2, d3}, [SRC]!
++.endm
++
++generate_composite_function_single_scanline \
++    pixman_store_scanline_a8_asm_neon, 32, 0, 8, \
++    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
++    8, /* number of pixels, processed in a single block */ \
++    default_init, \
++    default_cleanup, \
++    pixman_composite_src_8888_8_process_pixblock_head, \
++    pixman_composite_src_8888_8_process_pixblock_tail, \
++    pixman_composite_src_8888_8_process_pixblock_tail_head, \
++    3,  /* dst_w_basereg */ \
++    0,  /* dst_r_basereg */ \
++    0,  /* src_basereg   */ \
++    0   /* mask_basereg  */
++
++/******************************************************************************/
++
+ .macro pixman_composite_src_8888_0565_process_pixblock_head
+     vshll.u8    q8, d1, #8
+     vshll.u8    q14, d2, #8
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index f88c8f8..43091d2 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -428,6 +428,45 @@ neon_store_scanline_r5g6b5 (bits_image_t *  image,
+     pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
+ }
+ 
++void
++pixman_fetch_scanline_a8_asm_neon (int             width,
++                                   uint32_t       *buffer,
++                                   const uint8_t  *pixel);
++
++
++void
++pixman_store_scanline_a8_asm_neon (int             width,
++                                   uint8_t        *pixel,
++                                   const uint32_t *values);
++
++static void
++neon_fetch_scanline_a8 (pixman_image_t *image,
++                        int             x,
++                        int             y,
++                        int             width,
++                        uint32_t *      buffer,
++                        const uint32_t *mask)
++{
++    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
++    const uint8_t *pixel = (const uint8_t *) bits + x;
++
++    pixman_fetch_scanline_a8_asm_neon (width, buffer, pixel);
++}
++
++static void
++neon_store_scanline_a8 (bits_image_t *  image,
++                        int             x,
++                        int             y,
++                        int             width,
++                        const uint32_t *values)
++{
++    uint32_t *bits = image->bits + image->rowstride * y;
++    uint8_t *pixel = (uint8_t *) bits + x;
++
++    pixman_store_scanline_a8_asm_neon (width, pixel, values);
++}
++
++
+ pixman_implementation_t *
+ _pixman_implementation_create_arm_neon (void)
+ {
+@@ -446,6 +485,9 @@ _pixman_implementation_create_arm_neon (void)
+     _pixman_bits_override_accessors (PIXMAN_r5g6b5,
+                                      neon_fetch_scanline_r5g6b5,
+                                      neon_store_scanline_r5g6b5);
++    _pixman_bits_override_accessors (PIXMAN_a8,
++                                     neon_fetch_scanline_a8,
++                                     neon_store_scanline_a8);
+ 
+     imp->blt = arm_neon_blt;
+     imp->fill = arm_neon_fill;
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch b/recipes/obsolete/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
new file mode 100644
index 0000000..7f28f47
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
@@ -0,0 +1,77 @@
+From d6ae7da60cc797900b5eff0786536c4a11ab0f50 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Fri, 24 Sep 2010 18:22:44 +0300
+Subject: [PATCH 7/8] ARM: added NEON optimizations for fetching x8r8g8b8 scanline
+
+---
+ pixman/pixman-arm-neon-asm.S |   14 ++++++++++++++
+ pixman/pixman-arm-neon.c     |   21 +++++++++++++++++++++
+ 2 files changed, 35 insertions(+), 0 deletions(-)
+
+diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
+index ca0825c..ffd0b83 100644
+--- a/pixman/pixman-arm-neon-asm.S
++++ b/pixman/pixman-arm-neon-asm.S
+@@ -1206,6 +1206,20 @@ generate_composite_function \
+     0, /* src_basereg   */ \
+     0  /* mask_basereg  */
+ 
++generate_composite_function_single_scanline \
++    pixman_fetch_scanline_x888_asm_neon, 32, 0, 32, \
++    FLAG_DST_WRITEONLY, \
++    8, /* number of pixels, processed in a single block */ \
++    pixman_composite_src_x888_8888_init, \
++    default_cleanup, \
++    pixman_composite_src_x888_8888_process_pixblock_head, \
++    pixman_composite_src_x888_8888_process_pixblock_tail, \
++    pixman_composite_src_x888_8888_process_pixblock_tail_head, \
++    0,  /* dst_w_basereg */ \
++    0,  /* dst_r_basereg */ \
++    0,  /* src_basereg   */ \
++    0   /* mask_basereg  */
++
+ /******************************************************************************/
+ 
+ .macro pixman_composite_over_n_8_8888_process_pixblock_head
+diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
+index 43091d2..f84b5e6 100644
+--- a/pixman/pixman-arm-neon.c
++++ b/pixman/pixman-arm-neon.c
+@@ -466,6 +466,24 @@ neon_store_scanline_a8 (bits_image_t *  image,
+     pixman_store_scanline_a8_asm_neon (width, pixel, values);
+ }
+ 
++void
++pixman_fetch_scanline_x888_asm_neon (int             width,
++                                     uint32_t       *buffer,
++                                     const uint32_t *pixel);
++
++static void
++neon_fetch_scanline_x888 (pixman_image_t *image,
++                          int             x,
++                          int             y,
++                          int             width,
++                          uint32_t *      buffer,
++                          const uint32_t *mask)
++{
++    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
++    const uint32_t *pixel = (const uint32_t *) bits + x;
++
++    pixman_fetch_scanline_x888_asm_neon (width, buffer, pixel);
++}
+ 
+ pixman_implementation_t *
+ _pixman_implementation_create_arm_neon (void)
+@@ -488,6 +506,9 @@ _pixman_implementation_create_arm_neon (void)
+     _pixman_bits_override_accessors (PIXMAN_a8,
+                                      neon_fetch_scanline_a8,
+                                      neon_store_scanline_a8);
++    _pixman_bits_override_accessors (PIXMAN_x8r8g8b8,
++                                     neon_fetch_scanline_x888,
++                                     NULL);
+ 
+     imp->blt = arm_neon_blt;
+     imp->fill = arm_neon_fill;
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch b/recipes/obsolete/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch
new file mode 100644
index 0000000..6efdb62
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch
@@ -0,0 +1,172 @@
+From e1191ad6563a1fb02a45982b1c4d7fed3c655e97 Mon Sep 17 00:00:00 2001
+From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
+Date: Mon, 4 Oct 2010 01:56:59 +0300
+Subject: [PATCH 8/8] ARM optimization for scaled src_0565_0565 operation with nearest filter
+
+The code actually uses only armv4t instructions.
+
+Benchmark from ARM11:
+
+    == before ==
+    op=1, src_fmt=10020565, dst_fmt=10020565, speed=34.86 MPix/s
+
+    == after ==
+    op=1, src_fmt=10020565, dst_fmt=10020565, speed=36.62 MPix/s
+
+Benchmark from ARM Cortex-A8:
+
+    == before ==
+    op=1, src_fmt=10020565, dst_fmt=10020565, speed=89.55 MPix/s
+
+    == after ==
+    op=1, src_fmt=10020565, dst_fmt=10020565, speed=94.91 MPix/s
+---
+ pixman/pixman-arm-simd-asm.S |   66 ++++++++++++++++++++++++++++++++++++++++++
+ pixman/pixman-arm-simd.c     |   37 +++++++++++++++++++++++
+ 2 files changed, 103 insertions(+), 0 deletions(-)
+
+diff --git a/pixman/pixman-arm-simd-asm.S b/pixman/pixman-arm-simd-asm.S
+index a3d2d40..b6f69db 100644
+--- a/pixman/pixman-arm-simd-asm.S
++++ b/pixman/pixman-arm-simd-asm.S
+@@ -1,5 +1,6 @@
+ /*
+  * Copyright © 2008 Mozilla Corporation
++ * Copyright © 2010 Nokia Corporation
+  *
+  * Permission to use, copy, modify, distribute, and sell this software and its
+  * documentation for any purpose is hereby granted without fee, provided that
+@@ -328,3 +329,68 @@ pixman_asm_function pixman_composite_over_n_8_8888_asm_armv6
+ 	pop	{r4, r5, r6, r7, r8, r9, r10, r11}
+ 	bx	lr
+ .endfunc
++
++/*
++ * Note: This function is actually primarily optimized for ARM Cortex-A8
++ * pipeline. In order to get good performance on ARM9/ARM11 cores (which
++ * don't have efficient write combining), it needs to be changed to use
++ * 16-byte aligned writes using STM instruction.
++ */
++pixman_asm_function pixman_scaled_nearest_scanline_565_565_SRC_asm_armv6
++	DST	.req	r0
++	SRC	.req	r1
++	W	.req	r2
++	VX	.req	r3
++	UNIT_X	.req	r12
++	TMP1	.req	r4
++	TMP2	.req	r5
++	MASK	.req	r6
++	ldr	UNIT_X, [sp]
++	push	{r4, r5, r6, r7}
++	mvn	MASK, #1
++
++	/* define helper macro */
++	.macro	scale_2_pixels
++		ldrh	TMP1, [SRC, TMP1]
++		and	TMP2, MASK, VX, lsr #15
++		add	VX, VX, UNIT_X
++		strh	TMP1, [DST], #2
++
++		ldrh	TMP2, [SRC, TMP2]
++		and	TMP1, MASK, VX, lsr #15
++		add	VX, VX, UNIT_X
++		strh	TMP2, [DST], #2
++	.endm
++
++	/* now do the scaling */
++	and	TMP1, MASK, VX, lsr #15
++	add	VX, VX, UNIT_X
++	subs	W, #4
++	blt	2f
++1: /* main loop, process 4 pixels per iteration */
++	scale_2_pixels
++	scale_2_pixels
++	subs	W, W, #4
++	bge	1b
++2:
++	tst	W, #2
++	beq	2f
++	scale_2_pixels
++2:
++	tst	W, #1
++	ldrneh	TMP1, [SRC, TMP1]
++	strneh	TMP1, [DST], #2
++	/* cleanup helper macro */
++	.purgem	scale_2_pixels
++	.unreq	DST
++	.unreq	SRC
++	.unreq	W
++	.unreq	VX
++	.unreq	UNIT_X
++	.unreq	TMP1
++	.unreq	TMP2
++	.unreq	MASK
++	/* return */
++	pop	{r4, r5, r6, r7}
++	bx	lr
++.endfunc
+diff --git a/pixman/pixman-arm-simd.c b/pixman/pixman-arm-simd.c
+index d466a31..f6f464c 100644
+--- a/pixman/pixman-arm-simd.c
++++ b/pixman/pixman-arm-simd.c
+@@ -29,6 +29,7 @@
+ 
+ #include "pixman-private.h"
+ #include "pixman-arm-common.h"
++#include "pixman-fast-path.h"
+ 
+ #if 0 /* This code was moved to 'pixman-arm-simd-asm.S' */
+ 
+@@ -375,6 +376,35 @@ pixman_composite_over_n_8_8888_asm_armv6 (int32_t   width,
+ 
+ #endif
+ 
++void
++pixman_scaled_nearest_scanline_565_565_SRC_asm_armv6 (uint16_t *      dst,
++						      uint16_t *      src,
++						      int32_t         w,
++						      pixman_fixed_t  vx,
++						      pixman_fixed_t  unit_x);
++
++static force_inline void
++scaled_nearest_scanline_armv6_565_565_SRC (uint16_t *      dst,
++					   uint16_t *      src,
++					   int32_t         w,
++					   pixman_fixed_t  vx,
++					   pixman_fixed_t  unit_x,
++					   pixman_fixed_t  max_vx)
++{
++    pixman_scaled_nearest_scanline_565_565_SRC_asm_armv6 (dst, src, w,
++							  vx, unit_x);
++}
++
++FAST_NEAREST_MAINLOOP (armv6_565_565_cover_SRC,
++		       scaled_nearest_scanline_armv6_565_565_SRC,
++		       uint16_t, uint16_t, COVER);
++FAST_NEAREST_MAINLOOP (armv6_565_565_none_SRC,
++		       scaled_nearest_scanline_armv6_565_565_SRC,
++		       uint16_t, uint16_t, NONE);
++FAST_NEAREST_MAINLOOP (armv6_565_565_pad_SRC,
++		       scaled_nearest_scanline_armv6_565_565_SRC,
++		       uint16_t, uint16_t, PAD);
++
+ PIXMAN_ARM_BIND_FAST_PATH_SRC_DST (armv6, add_8_8,
+                                    uint8_t, 1, uint8_t, 1)
+ PIXMAN_ARM_BIND_FAST_PATH_SRC_DST (armv6, over_8888_8888,
+@@ -404,6 +434,13 @@ static const pixman_fast_path_t arm_simd_fast_paths[] =
+     PIXMAN_STD_FAST_PATH (OVER, solid, a8, a8b8g8r8, armv6_composite_over_n_8_8888),
+     PIXMAN_STD_FAST_PATH (OVER, solid, a8, x8b8g8r8, armv6_composite_over_n_8_8888),
+ 
++    SIMPLE_NEAREST_FAST_PATH_COVER (SRC, r5g6b5, r5g6b5, armv6_565_565),
++    SIMPLE_NEAREST_FAST_PATH_COVER (SRC, b5g6r5, b5g6r5, armv6_565_565),
++    SIMPLE_NEAREST_FAST_PATH_NONE (SRC, r5g6b5, r5g6b5, armv6_565_565),
++    SIMPLE_NEAREST_FAST_PATH_NONE (SRC, b5g6r5, b5g6r5, armv6_565_565),
++    SIMPLE_NEAREST_FAST_PATH_PAD (SRC, r5g6b5, r5g6b5, armv6_565_565),
++    SIMPLE_NEAREST_FAST_PATH_PAD (SRC, b5g6r5, b5g6r5, armv6_565_565),
++
+     { PIXMAN_OP_NONE },
+ };
+ 
+-- 
+1.6.6.1
+
diff --git a/recipes/obsolete/xorg-lib/pixman_0.12.0.bb b/recipes/obsolete/xorg-lib/pixman_0.12.0.bb
new file mode 100644
index 0000000..fcf0c14
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman_0.12.0.bb
@@ -0,0 +1,9 @@
+require pixman.inc
+PR = "${INC_PR}.0"
+
+SRC_URI += " \
+           file://pixman-arm.patch \
+           file://pixman-x888-565.patch \
+          "
+SRC_URI[archive.md5sum] = "09357cc74975b01714e00c5899ea1881"
+SRC_URI[archive.sha256sum] = "2b16516ef147bb604e1cf50c883143a052a7ff92d2930b70e571da0603b7d9ce"
diff --git a/recipes/obsolete/xorg-lib/pixman_0.16.2.bb b/recipes/obsolete/xorg-lib/pixman_0.16.2.bb
new file mode 100644
index 0000000..399bb6a
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman_0.16.2.bb
@@ -0,0 +1,7 @@
+require pixman.inc
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "02bd3669f53c404c19980d5efb6f86fb"
+SRC_URI[archive.sha256sum] = "05f78c2fd3a5f054c0d716e8ba1b67a0c04a7a7e642d6946828ec383b389d185"
+
+EXTRA_OECONF = "--disable-gtk"
diff --git a/recipes/obsolete/xorg-lib/pixman_0.18.4.bb b/recipes/obsolete/xorg-lib/pixman_0.18.4.bb
new file mode 100644
index 0000000..286477a
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman_0.18.4.bb
@@ -0,0 +1,21 @@
+require pixman.inc
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "532db4194e18c108d0b7dd85f20d39b8"
+SRC_URI[archive.sha256sum] = "1484092277c5187f5458229a2b7fd7fbc0cb07e1f220c7f8f9ac65de6dba7989"
+SRC_URI += "\
+           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch\
+           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch\
+           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch\
+           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch\
+           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch\
+           file://0006-A-copy-paste-version-of-16bpp-bilinear-scanline-fetc.patch\
+           file://0007-ARM-added-missing-cache-preload.patch\
+           file://565-over-neon.patch \
+           file://neon-reverse-u.patch \
+"
+
+NEON = " --disable-arm-neon "
+NEON_armv7a = " "
+
+EXTRA_OECONF = "${NEON} --disable-gtk"
diff --git a/recipes/obsolete/xorg-lib/pixman_0.20.0.bb b/recipes/obsolete/xorg-lib/pixman_0.20.0.bb
new file mode 100644
index 0000000..b3fbd4f
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/pixman_0.20.0.bb
@@ -0,0 +1,23 @@
+require pixman.inc
+
+SRC_URI[archive.md5sum] = "c1a31d5cedfa97c5af7148a2d1fd4356"
+SRC_URI[archive.sha256sum] = "9c02c22c6cc3f28f3633d02ef6f0cac130518f621edb011ebbbf08cd1a81251a"
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "\
+           file://0000-Add-pixman_bits_override_accessors.patch \
+           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
+           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
+           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
+           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
+           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
+           file://0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch \
+           file://0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch \
+           file://0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch \
+"
+
+NEON = " --disable-arm-neon "
+NEON_armv7a = " "
+
+EXTRA_OECONF = "${NEON} --disable-gtk"
diff --git a/recipes/obsolete/xorg-lib/xtrans_1.2.5.bb b/recipes/obsolete/xorg-lib/xtrans_1.2.5.bb
new file mode 100644
index 0000000..e6e3714
--- /dev/null
+++ b/recipes/obsolete/xorg-lib/xtrans_1.2.5.bb
@@ -0,0 +1,13 @@
+require xorg-lib-common.inc
+DESCRIPTION = "network API translation layer to insulate X applications and \
+libraries from OS network vageries."
+RDEPENDS_${PN}-dev = ""
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2d1e57e82acc5f21797e92341415af2f"
+SRC_URI[archive.sha256sum] = "cc71a391f4da8176e5daeeac1ddf5137ba5e8d2263cb93a49f9e2a9976b90899"
+
+ALLOW_EMPTY = "1"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes/xorg-lib/libdmx_1.1.0.bb b/recipes/xorg-lib/libdmx_1.1.0.bb
deleted file mode 100644
index 5a806a4..0000000
--- a/recipes/xorg-lib/libdmx_1.1.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Distributed Multihead extension library"
-DEPENDS += "libxext dmxproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a2fcf0382837888d3781b714489a8999"
-SRC_URI[archive.sha256sum] = "1904a8f848cc5d76105cb07707890aca095540a37fb0a63d359f71da51d3e2d5"
diff --git a/recipes/xorg-lib/libfontenc_1.0.5.bb b/recipes/xorg-lib/libfontenc_1.0.5.bb
deleted file mode 100644
index 6c11158..0000000
--- a/recipes/xorg-lib/libfontenc_1.0.5.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 font encoding library"
-LICENSE = "BSD-X"
-DEPENDS += "zlib xproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4f0d8191819be9f2bdf9dad49a65e43b"
-SRC_URI[archive.sha256sum] = "7f3cde0331e9ad3da720b1a8255e121673701199df0802b62380436e74222700"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-lib/libfs_1.0.2.bb b/recipes/xorg-lib/libfs_1.0.2.bb
deleted file mode 100644
index d892132..0000000
--- a/recipes/xorg-lib/libfs_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Font Services library"
-DEPENDS += "xproto fontsproto xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ecf2d6a27da053500283e803efa2a808"
-SRC_URI[archive.sha256sum] = "af2a5fe5eaa2b026e10bddb4e3f39976dc13deb5dbdc714abe1f016435ce3049"
-
-XORG_PN = "libFS"
diff --git a/recipes/xorg-lib/libice_1.0.6.bb b/recipes/xorg-lib/libice_1.0.6.bb
deleted file mode 100644
index 1c7f3cb..0000000
--- a/recipes/xorg-lib/libice_1.0.6.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Inter-Client Exchange library"
-DEPENDS += "xproto xtrans"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2d39bc924af24325dae589e9a849180c"
-SRC_URI[archive.sha256sum] = "a8346859505d2aa27ecc4531f1c86d72801936d96c31c5beaeff4587441b568b"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libICE"
diff --git a/recipes/xorg-lib/libpciaccess_0.10.9.bb b/recipes/xorg-lib/libpciaccess_0.10.9.bb
deleted file mode 100644
index d963c3c..0000000
--- a/recipes/xorg-lib/libpciaccess_0.10.9.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-lib-common.inc
-DEPENDS += "xproto virtual/libx11"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "685cb20e7a6165bc010972f1183addbd"
-SRC_URI[archive.sha256sum] = "5ccb9683b8be76edfceab4bf006e1cce9018e0d3dea5e54aa72e82798213fead"
diff --git a/recipes/xorg-lib/libsm_1.1.1.bb b/recipes/xorg-lib/libsm_1.1.1.bb
deleted file mode 100644
index b87bcdf..0000000
--- a/recipes/xorg-lib/libsm_1.1.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Session management library"
-DEPENDS += "libice xproto xtrans util-linux-ng"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6889a455496aaaa65b1fa05fc518d179"
-SRC_URI[archive.sha256sum] = "f50d184d8c6a031b3ff4f0d52efcfd4ffa811b0362b166a9ff9ba4c2e9aa7ce0"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libSM"
diff --git a/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch b/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
deleted file mode 100644
index 2e2d475..0000000
--- a/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From affc2488a7f2660a74dc8354fc3e0bff2c4f879c Mon Sep 17 00:00:00 2001
-From: Dan Nicholson <dbn.lists@gmail.com>
-Date: Sat, 06 Nov 2010 21:58:09 +0000
-Subject: config: Fix architecture check for OS/2 to skip nios2 cpu
-
-The OS/2 platform requires some utility functions as well as having a
-non-32 bit wchar_t. Fix the configure check so that it doesn't also
-affect the nios2 cpu, which wouldn't influence these operating system
-issues.
-
-Signed-off-by: Dan Nicholson <dbn.lists@gmail.com>
-Tested-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
-Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-Reviewed-by: Julien Cristau <jcristau@debian.org>
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
----
-diff --git a/configure.ac b/configure.ac
-index 1b4a8b7..01f43fb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -246,8 +246,8 @@ dnl AC_PATH_XTRA
- 
- # arch specific things
- WCHAR32="1"
--case $target_alias in
--  *os2*) os2="true" ; WCHAR32="0" ;;
-+case $target_os in
-+  os2*) os2="true" ; WCHAR32="0" ;;
-   *) ;;
- esac
- AC_SUBST(WCHAR32)
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/libx11-1.3.2/dolt-fix.patch b/recipes/xorg-lib/libx11-1.3.2/dolt-fix.patch
deleted file mode 100644
index ea1a8bd..0000000
--- a/recipes/xorg-lib/libx11-1.3.2/dolt-fix.patch
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
diff --git a/recipes/xorg-lib/libx11-1.3.2/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.3.2/keysymdef_include.patch
deleted file mode 100644
index 7e725b2..0000000
--- a/recipes/xorg-lib/libx11-1.3.2/keysymdef_include.patch
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
-+AC_ARG_WITH(keysymdefdir,
-+	AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
-+	KEYSYMDEF=$withval/keysymdef.h, KEYSYMDEF="")
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
diff --git a/recipes/xorg-lib/libx11-1.3.2/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.3.2/x11_disable_makekeys.patch
deleted file mode 100644
index 5d0a24c..0000000
--- a/recipes/xorg-lib/libx11-1.3.2/x11_disable_makekeys.patch
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
diff --git a/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch b/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
deleted file mode 100644
index 2e2d475..0000000
--- a/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From affc2488a7f2660a74dc8354fc3e0bff2c4f879c Mon Sep 17 00:00:00 2001
-From: Dan Nicholson <dbn.lists@gmail.com>
-Date: Sat, 06 Nov 2010 21:58:09 +0000
-Subject: config: Fix architecture check for OS/2 to skip nios2 cpu
-
-The OS/2 platform requires some utility functions as well as having a
-non-32 bit wchar_t. Fix the configure check so that it doesn't also
-affect the nios2 cpu, which wouldn't influence these operating system
-issues.
-
-Signed-off-by: Dan Nicholson <dbn.lists@gmail.com>
-Tested-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
-Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-Reviewed-by: Julien Cristau <jcristau@debian.org>
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
----
-diff --git a/configure.ac b/configure.ac
-index 1b4a8b7..01f43fb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -246,8 +246,8 @@ dnl AC_PATH_XTRA
- 
- # arch specific things
- WCHAR32="1"
--case $target_alias in
--  *os2*) os2="true" ; WCHAR32="0" ;;
-+case $target_os in
-+  os2*) os2="true" ; WCHAR32="0" ;;
-   *) ;;
- esac
- AC_SUBST(WCHAR32)
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/libx11-1.3.6/dolt-fix.patch b/recipes/xorg-lib/libx11-1.3.6/dolt-fix.patch
deleted file mode 100644
index 7e96075..0000000
--- a/recipes/xorg-lib/libx11-1.3.6/dolt-fix.patch
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
diff --git a/recipes/xorg-lib/libx11-1.3.6/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.3.6/keysymdef_include.patch
deleted file mode 100644
index 1a30e34..0000000
--- a/recipes/xorg-lib/libx11-1.3.6/keysymdef_include.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
---- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
-+++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
-@@ -355,7 +355,14 @@
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysym definitions])
--KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+AC_ARG_WITH(keysymdefdir,
-+        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
-+        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
-+
-+if test x$KEYSYMDEFDIR = x; then
-+	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+fi
-+
- FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
- for i in $FILES; do
-     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/recipes/xorg-lib/libx11-1.3.6/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.3.6/x11_disable_makekeys.patch
deleted file mode 100644
index 9763313..0000000
--- a/recipes/xorg-lib/libx11-1.3.6/x11_disable_makekeys.patch
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
diff --git a/recipes/xorg-lib/libx11_1.3.2.bb b/recipes/xorg-lib/libx11_1.3.2.bb
deleted file mode 100644
index 189d1ff..0000000
--- a/recipes/xorg-lib/libx11_1.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require libx11.inc
-PR = "${INC_PR}.3"
-# gcc 4.5 ends up ICEing with thumb and -O1 with -fno-omit-framepointer
-# therefore if we are in thumb mode then we use -Os instead of -O1 for
-# DEBUG_OPTIMIZATION
-
-DEBUG_OPTIMIZATION_thumb_append = " -Os"
-SRC_URI += " file://dolt-fix.patch"
-SRC_URI += " file://configure.ac-nios2.patch"
-SRC_URI[archive.md5sum] = "001d780829f936e34851ef7cd37b4dfd"
-SRC_URI[archive.sha256sum] = "4def4d5c9fce85d690f1f29d675154594acdea3d3fe792d0cb513732c7b4bcb2"
diff --git a/recipes/xorg-lib/libx11_1.3.6.bb b/recipes/xorg-lib/libx11_1.3.6.bb
deleted file mode 100644
index 8d9f343..0000000
--- a/recipes/xorg-lib/libx11_1.3.6.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require libx11.inc
-PR = "${INC_PR}.1"
-
-SRC_URI += " file://dolt-fix.patch"
-SRC_URI += " file://configure.ac-nios2.patch"
-SRC_URI[archive.md5sum] = "8e0a8a466aa78f66e09fe06cb395319f"
-SRC_URI[archive.sha256sum] = "599826765c59a98b1e58b4f6c4ad50dca69eeb0e7bd78aea736ca815f45bea40"
diff --git a/recipes/xorg-lib/libxau_1.0.5.bb b/recipes/xorg-lib/libxau_1.0.5.bb
deleted file mode 100644
index 3e95f97..0000000
--- a/recipes/xorg-lib/libxau_1.0.5.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "A Sample Authorization Protocol for X"
-DEPENDS += " xproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "993b3185c629e4b89401fca072dcb663"
-SRC_URI[archive.sha256sum] = "a503b3e88d29fa9c45cce1b2d1af54106c2ce21491348c394e251a071d8108ee"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXau"
diff --git a/recipes/xorg-lib/libxaw_1.0.7.bb b/recipes/xorg-lib/libxaw_1.0.7.bb
deleted file mode 100644
index e072411..0000000
--- a/recipes/xorg-lib/libxaw_1.0.7.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Athena Widget Set"
-DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "815e74de989ccda684e2baf8d12cf519"
-SRC_URI[archive.sha256sum] = "740aaee9b09586b1c80f80890381c5ee70ea11efa4b6159f707c0f3684c6f328"
-
-# disable docs as groff detection doesn't work on some hosts while cross compilling
-EXTRA_OECONF += " --disable-docs "
-
-do_install_append () {
-        ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-        ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
-        ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
-}
-
-PACKAGES =+ "libxaw6 libxaw7 libxaw8"
-
-FILES_libxaw6 = "${libdir}/libXaw*.so.6*"
-FILES_libxaw7 = "${libdir}/libXaw*.so.7*"
-FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
-
-XORG_PN = "libXaw"
diff --git a/recipes/xorg-lib/libxcomposite_0.4.1.bb b/recipes/xorg-lib/libxcomposite_0.4.1.bb
deleted file mode 100644
index f9460c3..0000000
--- a/recipes/xorg-lib/libxcomposite_0.4.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Composite extension library."
-LICENSE = "BSD-X"
-DEPENDS += " compositeproto virtual/libx11 libxfixes libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0f1367f57fdf5df17a8dd71d0fa68248"
-SRC_URI[archive.sha256sum] = "3715a25565222d8eb0468805db1113b514128ee5e9bc6908400f189f680d7a13"
-
-XORG_PN = "libXcomposite"
diff --git a/recipes/xorg-lib/libxcursor_1.1.10.bb b/recipes/xorg-lib/libxcursor_1.1.10.bb
deleted file mode 100644
index 7f3f0f9..0000000
--- a/recipes/xorg-lib/libxcursor_1.1.10.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X cursor management library"
-LICENSE = "BSD-X"
-DEPENDS += "libxrender libxfixes"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7dcdad1c10daea872cb3355af414b2ca"
-SRC_URI[archive.sha256sum] = "b9446df62203f2c3204b6bcc0057dc909d0dc792f0dd97bc491581b08be36cbd"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXcursor"
diff --git a/recipes/xorg-lib/libxdamage_1.1.2.bb b/recipes/xorg-lib/libxdamage_1.1.2.bb
deleted file mode 100644
index 294e514..0000000
--- a/recipes/xorg-lib/libxdamage_1.1.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 damaged region extension library"
-LICENSE = "BSD-X"
-DEPENDS += "damageproto libxfixes"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b42780bce703ec202a33e5693991c09d"
-SRC_URI[archive.sha256sum] = "a56a10acb34827c4d1a0ee282a338cbb04baa03d7fc7bc69e5690915c8fc7c0a"
-
-XORG_PN = "libXdamage"
diff --git a/recipes/xorg-lib/libxdmcp_1.0.3.bb b/recipes/xorg-lib/libxdmcp_1.0.3.bb
deleted file mode 100644
index 1e38efa..0000000
--- a/recipes/xorg-lib/libxdmcp_1.0.3.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Display Manager Control Protocol library"
-DEPENDS += "xproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d60941d471800f41a3f19b24bea855a7"
-SRC_URI[archive.sha256sum] = "d8033a2fae20fed6de4f16b73ad69ca1c511e7da31c88e9bc6e75976187378cb"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXdmcp"
diff --git a/recipes/xorg-lib/libxevie_1.0.2.bb b/recipes/xorg-lib/libxevie_1.0.2.bb
deleted file mode 100644
index d418768..0000000
--- a/recipes/xorg-lib/libxevie_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 EvIE extension library"
-DEPENDS += "libxext evieext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "88e9bf535364e7c821ef4014fb1ca2dd"
-SRC_URI[archive.sha256sum] = "ff70b81ad145932db2d206735cefcb698dadad241001df7ba6b97e8081d174da"
-
-XORG_PN = "libXevie"
diff --git a/recipes/xorg-lib/libxext_1.1.1.bb b/recipes/xorg-lib/libxext_1.1.1.bb
deleted file mode 100644
index d3d6c66..0000000
--- a/recipes/xorg-lib/libxext_1.1.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 miscellaneous extension library"
-DEPENDS += "xproto virtual/libx11 xextproto libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c417c0e8df39a067f90a2a2e7133637d"
-SRC_URI[archive.sha256sum] = "110ce3bc7fb3a86659556994d0801c74bedcbd8ba8d1f90ee33d4c47a91e9bb3"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXext"
diff --git a/recipes/xorg-lib/libxfixes_4.0.4.bb b/recipes/xorg-lib/libxfixes_4.0.4.bb
deleted file mode 100644
index 26ccb96..0000000
--- a/recipes/xorg-lib/libxfixes_4.0.4.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Fixes extension library."
-LICENSE = "BSD-X"
-DEPENDS += "virtual/libx11 xproto fixesproto xextproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7f2c40852eb337b237ad944ca5c30d49"
-SRC_URI[archive.sha256sum] = "ba31d7e5c5c1907c30cba50bfd669aa7fe860555287c29f6e786612e4be33b48"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXfixes"
diff --git a/recipes/xorg-lib/libxfont_1.4.1.bb b/recipes/xorg-lib/libxfont_1.4.1.bb
deleted file mode 100644
index 8d046d1..0000000
--- a/recipes/xorg-lib/libxfont_1.4.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 font rasterisation library"
-LICENSE = "BSD-X"
-DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4f2bed2a2be82e90a51a24bb3a22cdf0"
-SRC_URI[archive.sha256sum] = "112bfc30820b98deec4c9914536c5aa2f8b5162bd2b0bdb342343168e06f7679"
-
-# disable docs
-EXTRA_OECONF += " --disable-devel-docs "
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXfont"
diff --git a/recipes/xorg-lib/libxft-2.1.14/autotools.patch b/recipes/xorg-lib/libxft-2.1.14/autotools.patch
deleted file mode 100644
index 62f4442..0000000
--- a/recipes/xorg-lib/libxft-2.1.14/autotools.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Index: libXft-2.1.14/configure.ac
-===================================================================
---- libXft-2.1.14.orig/configure.ac	2009-10-10 01:44:49.000000000 +0200
-+++ libXft-2.1.14/configure.ac	2009-12-23 20:56:25.759695121 +0100
-@@ -37,26 +37,14 @@
- # Require xorg-macros: XORG_DEFAULT_OPTIONS
- m4_ifndef([XORG_MACROS_VERSION], [AC_FATAL([must install xorg-macros 1.3 or later before running autoconf/autogen])])
- XORG_MACROS_VERSION(1.3)
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS([config.h])
-+AC_CONFIG_HEADERS([include/X11/Xft/Xft.h])
- 
- # checks for progs
- AC_PROG_CC
- AC_PROG_LIBTOOL
- XORG_DEFAULT_OPTIONS
- 
--# Set library version for Xft.h from package version set in AC_INIT
--# copied from PACKAGE_VERSION_* settings in XORG_VERSION
--AC_CONFIG_HEADERS([include/X11/Xft/Xft.h])
--AC_DEFINE_UNQUOTED([XFT_MAJOR],
--                [`echo $PACKAGE_VERSION | cut -d . -f 1`],
--                [Major version of Xft])
--AC_DEFINE_UNQUOTED([XFT_MINOR],
--                [`echo $PACKAGE_VERSION | cut -d . -f 2 | cut -d - -f 1`],
--                [Minor version of Xft])
--AC_DEFINE_UNQUOTED([XFT_REVISION],
--                [`echo $PACKAGE_VERSION | cut -d . -f 3 | cut -d - -f 1`],
--                [Micro revision of Xft])
--
- #
- # Check for Xrender
- #
-Index: libXft-2.1.14/include/X11/Xft/Xft.h.in
-===================================================================
---- libXft-2.1.14.orig/include/X11/Xft/Xft.h.in	2009-10-06 09:36:40.000000000 +0200
-+++ libXft-2.1.14/include/X11/Xft/Xft.h.in	2009-12-23 20:55:52.063859518 +0100
-@@ -27,11 +27,12 @@
-  * Current Xft version number, set from version in the Xft configure.ac file.
-  */
- 
--#undef XFT_MAJOR	/* Will be substituted by configure */
--#undef XFT_MINOR	/* Will be substituted by configure */
--#undef XFT_REVISION	/* Will be substituted by configure */
-+/* Will be substituted by configure */
-+#undef PACKAGE_VERSION_MAJOR
-+#undef PACKAGE_VERSION_MINOR
-+#undef PACKAGE_VERSION_PATCHLEVEL
- 
--#define XFT_VERSION	((XFT_MAJOR * 10000) + (XFT_MINOR * 100) + (XFT_REVISION))
-+#define XFT_VERSION	((PACKAGE_VERSION_MAJOR * 10000) + (PACKAGE_VERSION_MINOR * 100) + (PACKAGE_VERSION_PATCHLEVEL))
- #define XftVersion	XFT_VERSION
- 
- #include <stdarg.h>
diff --git a/recipes/xorg-lib/libxft_2.1.14.bb b/recipes/xorg-lib/libxft_2.1.14.bb
deleted file mode 100644
index 34fadcd..0000000
--- a/recipes/xorg-lib/libxft_2.1.14.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "FreeType-based font drawing library for X"
-DEPENDS += "libxrender freetype fontconfig"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://autotools.patch"
-SRC_URI[archive.md5sum] = "254e62a233491e0e1251636536163e20"
-SRC_URI[archive.sha256sum] = "700e9d594b81cad3dfd5fac4a5cfd0c4cf7780c812507ef04eb40139ebf5175e"
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
diff --git a/recipes/xorg-lib/libxi_1.3.bb b/recipes/xorg-lib/libxi_1.3.bb
deleted file mode 100644
index 22ef799..0000000
--- a/recipes/xorg-lib/libxi_1.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Input extension library"
-DEPENDS += "libxext inputproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8df4ece9bd1efb02c28acb2b6f485e09"
-SRC_URI[archive.sha256sum] = "362b8c0c60386841063bd7e01afa72e37eb87ada6e64e539d960f88c780a944b"
-
-XORG_PN = "libXi"
diff --git a/recipes/xorg-lib/libxinerama_1.1.bb b/recipes/xorg-lib/libxinerama_1.1.bb
deleted file mode 100644
index 4d5f427..0000000
--- a/recipes/xorg-lib/libxinerama_1.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Xinerama extension library"
-DEPENDS += "libxext xineramaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a2ac01fc0426cdbb713c5d59cf9955ed"
-SRC_URI[archive.sha256sum] = "e0d39e74c2e131b44cc98dd4910165c9b8d937df93be58e6afb7c2a56772bf34"
-
-XORG_PN = "libXinerama"
diff --git a/recipes/xorg-lib/libxkbfile_1.0.6.bb b/recipes/xorg-lib/libxkbfile_1.0.6.bb
deleted file mode 100644
index a7fc91d..0000000
--- a/recipes/xorg-lib/libxkbfile_1.0.6.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 keyboard file manipulation library"
-LICENSE = "GPL"
-DEPENDS += "virtual/libx11 kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b01156e263eca8177e6b7f10441951c4"
-SRC_URI[archive.sha256sum] = "2ca43c1f6b2782994167a328471aa859d366cd7303c6dcbc8bda951a84a06039"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-lib/libxmu_1.0.5.bb b/recipes/xorg-lib/libxmu_1.0.5.bb
deleted file mode 100644
index 5f361ef..0000000
--- a/recipes/xorg-lib/libxmu_1.0.5.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 miscellaneous utility library"
-DEPENDS += "libxt libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fc4d66be7a1a1eb474954728415e46d6"
-SRC_URI[archive.sha256sum] = "0692b6b0ec1019cfaa8418020b1127bfb0975f5a579a0b1f9eb7fd8f2f7126d7"
-
-PACKAGES =+ "libxmuu libxmuu-dev"
-
-FILES_libxmuu = "${libdir}/libXmuu.so.*"
-FILES_libxmuu-dev = "${libdir}/libXmuu.so"
-
-LEAD_SONAME = "libXmu"
-
-XORG_PN = "libXmu"
diff --git a/recipes/xorg-lib/libxpm_3.5.8.bb b/recipes/xorg-lib/libxpm_3.5.8.bb
deleted file mode 100644
index 9bb7c8e..0000000
--- a/recipes/xorg-lib/libxpm_3.5.8.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Pixmap library"
-LICENSE = "X-BSD"
-DEPENDS += "libxext libsm libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "38e58e72d476a74298a59052fde185a3"
-SRC_URI[archive.sha256sum] = "02a77aaa32e6e335e1ee04aeb9ad1008045d98274d64ed33bc5fc6c3a3542c4c"
-
-PACKAGES =+ "sxpm cxpm"
-
-FILES_cxpm = "${bindir}/cxpm"
-FILES_sxpm = "${bindir}/sxpm"
-
-XORG_PN = "libXpm"
diff --git a/recipes/xorg-lib/libxrandr_1.2.1.bb b/recipes/xorg-lib/libxrandr_1.2.1.bb
deleted file mode 100644
index 983265d..0000000
--- a/recipes/xorg-lib/libxrandr_1.2.1.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Resize and Rotate extension library"
-LICENSE = "BSD-X"
-DEPENDS += "randrproto libxrender libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5860360f5b038cc728f388f875ce525d"
-SRC_URI[archive.sha256sum] = "2d2df642eb8e0527936cdf4ed1c096f69df53e9b95e2532c8ed0cabd06a45407"
-
-BBCLASSEXTEND = "nativesdk"
-
-XORG_PN = "libXrandr"
diff --git a/recipes/xorg-lib/libxrandr_1.3.0.bb b/recipes/xorg-lib/libxrandr_1.3.0.bb
deleted file mode 100644
index 6808e08..0000000
--- a/recipes/xorg-lib/libxrandr_1.3.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Resize and Rotate extension library"
-LICENSE = "BSD-X"
-DEPENDS += "randrproto libxrender libxext"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "68eb59c3b7524db6ffd78746ee893d1d"
-SRC_URI[archive.sha256sum] = "5961ce0f77c5173a8208b3ed669ac01719f2bf4a10517ffa6c33a5e064802e78"
-
-BBCLASSEXTEND = "nativesdk"
-
-XORG_PN = "libXrandr"
diff --git a/recipes/xorg-lib/libxrender_0.9.5.bb b/recipes/xorg-lib/libxrender_0.9.5.bb
deleted file mode 100644
index 047b8d7..0000000
--- a/recipes/xorg-lib/libxrender_0.9.5.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Rendering Extension client library"
-LICENSE = "BSD-X"
-DEPENDS += "virtual/libx11 renderproto xproto libxdmcp"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "276dd9e85daf0680616cd9f132b354c9"
-SRC_URI[archive.sha256sum] = "bc0590438a4be2b674cbac6f4ad46e5a89acd02aa94817da0fa8eb3ef05ed5d5"
-
-BBCLASSEXTEND = "native nativesdk"
-
-XORG_PN = "libXrender"
diff --git a/recipes/xorg-lib/libxres_1.0.4.bb b/recipes/xorg-lib/libxres_1.0.4.bb
deleted file mode 100644
index 2049beb..0000000
--- a/recipes/xorg-lib/libxres_1.0.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Resource extension library"
-DEPENDS += "libxext resourceproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4daf91f93d924e693f6f6ed276791be2"
-SRC_URI[archive.sha256sum] = "457f567a70ef8798cfb32f897ffa52c3f010923b07414b3a42277f56877572df"
-
-XORG_PN = "libXres"
diff --git a/recipes/xorg-lib/libxscrnsaver_1.2.0.bb b/recipes/xorg-lib/libxscrnsaver_1.2.0.bb
deleted file mode 100644
index f02ff38..0000000
--- a/recipes/xorg-lib/libxscrnsaver_1.2.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Screen Saver extension library"
-LICENSE = "GPL"
-DEPENDS += "libxext scrnsaverproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "33e54f64b55f22d8bbe822a5b62568cb"
-SRC_URI[archive.sha256sum] = "5b067bec0f2eb6405226bde5f20ca107eb0e5c11f5e5e24b455930c450487f85"
-
-RREPLACES_${PN} = "libxss"
-
-XORG_PN = "libXScrnSaver"
diff --git a/recipes/xorg-lib/libxt_1.0.7.bb b/recipes/xorg-lib/libxt_1.0.7.bb
deleted file mode 100644
index 238ea06..0000000
--- a/recipes/xorg-lib/libxt_1.0.7.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 toolkit intrinsics library"
-DEPENDS += "libsm virtual/libx11 kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "96f3c93434a93186d178b60d4a262496"
-SRC_URI[archive.sha256sum] = "706d5248b061c8455f74ce5269ecc5ef59c27d0f52d22b07138f781928dda9ec"
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
diff --git a/recipes/xorg-lib/libxtst_1.1.0.bb b/recipes/xorg-lib/libxtst_1.1.0.bb
deleted file mode 100644
index 2a0ffbe..0000000
--- a/recipes/xorg-lib/libxtst_1.1.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Test Extension: client side library"
-DEPENDS += "libxext recordproto inputproto libxi"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "dd6f3e20b87310187121539f9605d977"
-SRC_URI[archive.sha256sum] = "bd440f4779e06957211ba83782a5a1cfbf1d42b14fd3510a6dce440489a4eb26"
-
-XORG_PN = "libXtst"
diff --git a/recipes/xorg-lib/libxv_1.0.5.bb b/recipes/xorg-lib/libxv_1.0.5.bb
deleted file mode 100644
index 7a60af8..0000000
--- a/recipes/xorg-lib/libxv_1.0.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Video extension library"
-LICENSE = "GPL"
-DEPENDS += "libxext videoproto"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1d97798b1d8bbf8d9085e1b223a0738f"
-SRC_URI[archive.sha256sum] = "d549afdf22feefb97cca85dee12242af9f08c4d2435255dc7c30bd17d1d96010"
-
-XORG_PN = "libXv"
diff --git a/recipes/xorg-lib/libxxf86dga_1.1.1.bb b/recipes/xorg-lib/libxxf86dga_1.1.1.bb
deleted file mode 100644
index aafe621..0000000
--- a/recipes/xorg-lib/libxxf86dga_1.1.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Direct Graphics Access extension library"
-DEPENDS += "libxext xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "368837d3d7a4d3b4f70be48383e3544e"
-SRC_URI[archive.sha256sum] = "8d37f8895ecff15cb821a3e77bd505598983a5c6eae546e77e2d3070a8de5616"
-
-XORG_PN = "libXxf86dga"
diff --git a/recipes/xorg-lib/libxxf86misc_1.0.2.bb b/recipes/xorg-lib/libxxf86misc_1.0.2.bb
deleted file mode 100644
index a44b46f..0000000
--- a/recipes/xorg-lib/libxxf86misc_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 XFree86 miscellaneous extension library"
-DEPENDS += "libxext xf86miscproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "51fed53e8de067d4b8666f75a0212400"
-SRC_URI[archive.sha256sum] = "8e64b6b1bf34fcd112b1fd866d77e110b47794e825a996e4492c0ee408957cb3"
-
-XORG_PN = "libXxf86misc"
diff --git a/recipes/xorg-lib/libxxf86vm_1.1.0.bb b/recipes/xorg-lib/libxxf86vm_1.1.0.bb
deleted file mode 100644
index 181f220..0000000
--- a/recipes/xorg-lib/libxxf86vm_1.1.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 XFree86 video mode extension library"
-DEPENDS += "libxext xf86vidmodeproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b431ad7084e1055fef99a9115237edd8"
-SRC_URI[archive.sha256sum] = "7cc5e577b337c5267f4e65741f27229111ada8cb833e24b47713a683e8838de8"
-
-XORG_PN = "libXxf86vm"
diff --git a/recipes/xorg-lib/pixman-0.12.0/pixman-arm.patch b/recipes/xorg-lib/pixman-0.12.0/pixman-arm.patch
deleted file mode 100644
index 91dda03..0000000
--- a/recipes/xorg-lib/pixman-0.12.0/pixman-arm.patch
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
diff --git a/recipes/xorg-lib/pixman-0.12.0/pixman-x888-565.patch b/recipes/xorg-lib/pixman-0.12.0/pixman-x888-565.patch
deleted file mode 100644
index a3fa331..0000000
--- a/recipes/xorg-lib/pixman-0.12.0/pixman-x888-565.patch
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
diff --git a/recipes/xorg-lib/pixman-0.18.4/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/xorg-lib/pixman-0.18.4/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
deleted file mode 100644
index b2488de..0000000
--- a/recipes/xorg-lib/pixman-0.18.4/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 05875eca09ee23ea04ccb32f87c7c355fd1b88f3 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Tue, 16 Mar 2010 16:55:28 +0100
-Subject: [PATCH 1/7] Generic C implementation of pixman_blt with overlapping support
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
diff --git a/recipes/xorg-lib/pixman-0.18.4/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/xorg-lib/pixman-0.18.4/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
deleted file mode 100644
index ca6a3c5..0000000
--- a/recipes/xorg-lib/pixman-0.18.4/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 8aca14948a43f5cfd478e22cef745e55960d68cb Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:47 +0300
-Subject: [PATCH 2/7] Support of overlapping src/dst for pixman_blt_mmx
-
----
- pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
-index d51b40c..6e0296b 100644
---- a/pixman/pixman-mmx.c
-+++ b/pixman/pixman-mmx.c
-@@ -2996,34 +2996,43 @@ pixman_blt_mmx (uint32_t *src_bits,
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
-@@ -3033,7 +3042,7 @@ pixman_blt_mmx (uint32_t *src_bits,
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
diff --git a/recipes/xorg-lib/pixman-0.18.4/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/xorg-lib/pixman-0.18.4/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
deleted file mode 100644
index faeb6e6..0000000
--- a/recipes/xorg-lib/pixman-0.18.4/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 56c446d6912936eabcc6bdd583f37ee1209eff8c Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:54 +0300
-Subject: [PATCH 3/7] Support of overlapping src/dst for pixman_blt_sse2
-
----
- pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
-index d5349d7..aa34012 100644
---- a/pixman/pixman-sse2.c
-+++ b/pixman/pixman-sse2.c
-@@ -5328,34 +5328,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
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
-@@ -5368,7 +5377,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
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
diff --git a/recipes/xorg-lib/pixman-0.18.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/xorg-lib/pixman-0.18.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
deleted file mode 100644
index d56fd99..0000000
--- a/recipes/xorg-lib/pixman-0.18.4/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 80c1eae677a6ea10d67bb7328230626cd8fce08e Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Wed, 18 Nov 2009 06:08:48 +0200
-Subject: [PATCH 4/7] Support of overlapping src/dst for pixman_blt_neon
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
diff --git a/recipes/xorg-lib/pixman-0.18.4/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/recipes/xorg-lib/pixman-0.18.4/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
deleted file mode 100644
index 39eda8b..0000000
--- a/recipes/xorg-lib/pixman-0.18.4/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From 2f5774db49521e990c5e9f7cac684a06f4e67a43 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 10 Dec 2009 00:51:50 +0200
-Subject: [PATCH 5/7] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
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
diff --git a/recipes/xorg-lib/pixman-0.18.4/0006-A-copy-paste-version-of-16bpp-bilinear-scanline-fetc.patch b/recipes/xorg-lib/pixman-0.18.4/0006-A-copy-paste-version-of-16bpp-bilinear-scanline-fetc.patch
deleted file mode 100644
index dd0e0f6..0000000
--- a/recipes/xorg-lib/pixman-0.18.4/0006-A-copy-paste-version-of-16bpp-bilinear-scanline-fetc.patch
+++ /dev/null
@@ -1,261 +0,0 @@
-From fc24a2d8d0039cd10de4175da40bb784e2c3bf49 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Fri, 4 Dec 2009 16:49:19 +0000
-Subject: [PATCH 6/7] A copy-paste version of 16bpp bilinear scanline fetcher
-
----
- pixman/pixman-bits-image.c |  228 +++++++++++++++++++++++++++++++++++++++++++-
- 1 files changed, 223 insertions(+), 5 deletions(-)
-
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
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman-0.18.4/0007-ARM-added-missing-cache-preload.patch b/recipes/xorg-lib/pixman-0.18.4/0007-ARM-added-missing-cache-preload.patch
deleted file mode 100644
index f601d2c..0000000
--- a/recipes/xorg-lib/pixman-0.18.4/0007-ARM-added-missing-cache-preload.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From af8a33d3b132c0192d59c47426bb3a201cb64b32 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Fri, 21 May 2010 13:31:03 +0000
-Subject: [PATCH 7/7] ARM: added missing cache preload
-
----
- pixman/pixman-arm-neon-asm.S |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index f30869e..dc7fd69 100644
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
-@@ -680,6 +681,7 @@ generate_composite_function_single_scanline \
-     vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
-     vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
-     pixman_composite_over_8888_8888_process_pixblock_head
-+    cache_preload 8, 8
- .endm
- 
- .macro pixman_composite_over_n_8888_init
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman-0.18.4/565-over-neon.patch b/recipes/xorg-lib/pixman-0.18.4/565-over-neon.patch
deleted file mode 100644
index c8156c4..0000000
--- a/recipes/xorg-lib/pixman-0.18.4/565-over-neon.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From d297443267de0f5fab49ec245df9055a0dddddaf Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Tue, 25 May 2010 17:21:26 +0000
-Subject: ARM: NEON: don't hit general path for r5g6b5 OVER r5g6b5 operation
-
-OVER can't be reduced to SRC because the source image is not
-considered opaque when repeat is set to PIXMAN_REPEAT_NONE.
-An additional fast path table entry solves the problem.
----
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 64aa908..394dcea 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -246,6 +246,7 @@ static const pixman_fast_path_t arm_neon_fast_paths[] =
-     PIXMAN_STD_FAST_PATH (OVER, a8b8g8r8, null,     x8b8g8r8, neon_composite_over_8888_8888),
-     PIXMAN_STD_FAST_PATH (OVER, x8r8g8b8, null,     a8r8g8b8, neon_composite_src_x888_8888),
-     PIXMAN_STD_FAST_PATH (OVER, x8b8g8r8, null,     a8b8g8r8, neon_composite_src_x888_8888),
-+    PIXMAN_STD_FAST_PATH (OVER, r5g6b5,   null,     r5g6b5,   neon_composite_src_0565_0565),
-     PIXMAN_STD_FAST_PATH (ADD,  solid,    a8,       a8,       neon_composite_add_n_8_8),
-     PIXMAN_STD_FAST_PATH (ADD,  a8,       a8,       a8,       neon_composite_add_8_8_8),
-     PIXMAN_STD_FAST_PATH (ADD,  a8r8g8b8, a8r8g8b8, a8r8g8b8, neon_composite_add_8888_8888_8888),
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman-0.18.4/neon-reverse-u.patch b/recipes/xorg-lib/pixman-0.18.4/neon-reverse-u.patch
deleted file mode 100644
index 76726ce..0000000
--- a/recipes/xorg-lib/pixman-0.18.4/neon-reverse-u.patch
+++ /dev/null
@@ -1,175 +0,0 @@
-From e0017c2a676b267900e48c6f32a6e973395c83d3 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Mon, 31 May 2010 16:24:43 +0000
-Subject: ARM: 'neon_combine_out_reverse_u' combiner
-
----
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index f30869e..44fbfce 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -597,7 +597,7 @@ generate_composite_function_single_scanline \
- 
- /******************************************************************************/
- 
--.macro pixman_composite_over_8888_8888_process_pixblock_head
-+.macro pixman_composite_out_reverse_8888_8888_process_pixblock_head
-     vmvn.8      d24, d3  /* get inverted alpha */
-     /* do alpha blending */
-     vmull.u8    q8, d24, d4
-@@ -606,7 +606,7 @@ generate_composite_function_single_scanline \
-     vmull.u8    q11, d24, d7
- .endm
- 
--.macro pixman_composite_over_8888_8888_process_pixblock_tail
-+.macro pixman_composite_out_reverse_8888_8888_process_pixblock_tail
-     vrshr.u16   q14, q8, #8
-     vrshr.u16   q15, q9, #8
-     vrshr.u16   q12, q10, #8
-@@ -615,6 +615,56 @@ generate_composite_function_single_scanline \
-     vraddhn.u16 d29, q15, q9
-     vraddhn.u16 d30, q12, q10
-     vraddhn.u16 d31, q13, q11
-+.endm
-+
-+.macro pixman_composite_out_reverse_8888_8888_process_pixblock_tail_head
-+    vld4.8      {d4, d5, d6, d7}, [DST_R, :128]!
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
-+    vld4.8      {d0, d1, d2, d3}, [SRC]!
-+                                    PF pld, [PF_SRC, PF_X, lsl #src_bpp_shift]
-+    vmvn.8      d22, d3
-+                                    PF pld, [PF_DST, PF_X, lsl #dst_bpp_shift]
-+        vst4.8      {d28, d29, d30, d31}, [DST_W, :128]!
-+                                    PF subge PF_X, PF_X, ORIG_W
-+    vmull.u8    q8, d22, d4
-+                                    PF subges PF_CTL, PF_CTL, #0x10
-+    vmull.u8    q9, d22, d5
-+                                    PF ldrgeb DUMMY, [PF_SRC, SRC_STRIDE, lsl #src_bpp_shift]!
-+    vmull.u8    q10, d22, d6
-+                                    PF ldrgeb DUMMY, [PF_DST, DST_STRIDE, lsl #dst_bpp_shift]!
-+    vmull.u8    q11, d22, d7
-+.endm
-+
-+generate_composite_function_single_scanline \
-+    pixman_composite_scanline_out_reverse_asm_neon, 32, 0, 32, \
-+    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    default_init, \
-+    default_cleanup, \
-+    pixman_composite_out_reverse_8888_8888_process_pixblock_head, \
-+    pixman_composite_out_reverse_8888_8888_process_pixblock_tail, \
-+    pixman_composite_out_reverse_8888_8888_process_pixblock_tail_head
-+
-+/******************************************************************************/
-+
-+.macro pixman_composite_over_8888_8888_process_pixblock_head
-+    pixman_composite_out_reverse_8888_8888_process_pixblock_head
-+.endm
-+
-+.macro pixman_composite_over_8888_8888_process_pixblock_tail
-+    pixman_composite_out_reverse_8888_8888_process_pixblock_tail
-     vqadd.u8    q14, q0, q14
-     vqadd.u8    q15, q1, q15
- .endm
-@@ -1416,7 +1466,7 @@ generate_composite_function_single_scanline \
- 
- /******************************************************************************/
- 
--.macro pixman_composite_over_8888_n_8888_process_pixblock_head
-+.macro pixman_composite_out_reverse_8888_n_8888_process_pixblock_head
-     /* expecting source data in {d0, d1, d2, d3} */
-     /* destination data in {d4, d5, d6, d7} */
-     /* solid mask is in d15 */
-@@ -1442,7 +1492,7 @@ generate_composite_function_single_scanline \
-     vmull.u8    q11, d24, d7
- .endm
- 
--.macro pixman_composite_over_8888_n_8888_process_pixblock_tail
-+.macro pixman_composite_out_reverse_8888_n_8888_process_pixblock_tail
-     vrshr.u16   q14, q8, #8
-     vrshr.u16   q15, q9, #8
-     vrshr.u16   q12, q10, #8
-@@ -1451,6 +1501,49 @@ generate_composite_function_single_scanline \
-     vraddhn.u16 d29, q15, q9
-     vraddhn.u16 d30, q12, q10
-     vraddhn.u16 d31, q13, q11
-+.endm
-+
-+.macro pixman_composite_out_reverse_8888_8888_8888_init
-+    vpush       {d8-d15}
-+.endm
-+
-+.macro pixman_composite_out_reverse_8888_8888_8888_cleanup
-+    vpop        {d8-d15}
-+.endm
-+
-+/* TODO: expand macros and do better instructions scheduling */
-+.macro pixman_composite_out_reverse_8888_8888_8888_process_pixblock_tail_head
-+    vld4.8     {d4, d5, d6, d7}, [DST_R, :128]!
-+    pixman_composite_out_reverse_8888_n_8888_process_pixblock_tail
-+    vld4.8     {d0, d1, d2, d3}, [SRC]!
-+    cache_preload 8, 8
-+    vld4.8     {d12, d13, d14, d15}, [MASK]!
-+    pixman_composite_out_reverse_8888_n_8888_process_pixblock_head
-+    vst4.8     {d28, d29, d30, d31}, [DST_W, :128]!
-+.endm
-+
-+generate_composite_function_single_scanline \
-+    pixman_composite_scanline_out_reverse_mask_asm_neon, 32, 32, 32, \
-+    FLAG_DST_READWRITE | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    pixman_composite_out_reverse_8888_8888_8888_init, \
-+    pixman_composite_out_reverse_8888_8888_8888_cleanup, \
-+    pixman_composite_out_reverse_8888_n_8888_process_pixblock_head, \
-+    pixman_composite_out_reverse_8888_n_8888_process_pixblock_tail, \
-+    pixman_composite_out_reverse_8888_8888_8888_process_pixblock_tail_head \
-+    28, /* dst_w_basereg */ \
-+    4,  /* dst_r_basereg */ \
-+    0,  /* src_basereg   */ \
-+    12  /* mask_basereg  */
-+
-+/******************************************************************************/
-+
-+.macro pixman_composite_over_8888_n_8888_process_pixblock_head
-+    pixman_composite_out_reverse_8888_n_8888_process_pixblock_head
-+.endm
-+
-+.macro pixman_composite_over_8888_n_8888_process_pixblock_tail
-+    pixman_composite_out_reverse_8888_n_8888_process_pixblock_tail
-     vqadd.u8    q14, q0, q14
-     vqadd.u8    q15, q1, q15
- .endm
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 394dcea..1be9606 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -335,6 +335,7 @@ neon_combine_##name##_u (pixman_implementation_t *imp,                   \
- 
- BIND_COMBINE_U (over)
- BIND_COMBINE_U (add)
-+BIND_COMBINE_U (out_reverse)
- 
- void
- pixman_fetch_scanline_r5g6b5_asm_neon (int             width,
-@@ -382,6 +383,7 @@ _pixman_implementation_create_arm_neon (void)
- 
-     imp->combine_32[PIXMAN_OP_OVER] = neon_combine_over_u;
-     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
-+    imp->combine_32[PIXMAN_OP_OUT_REVERSE] = neon_combine_out_reverse_u;
- 
-     _pixman_bits_override_accessors (PIXMAN_r5g6b5,
-                                      neon_fetch_scanline_r5g6b5,
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch b/recipes/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch
deleted file mode 100644
index 43cd442..0000000
--- a/recipes/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 38aabb3be87ea68e37f34256c778d07f62680ec6 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 10 Dec 2009 00:51:50 +0200
-Subject: [PATCH 1/9] add _pixman_bits_override_accessors
-
-* from patch ARM: HACK: added NEON optimizations for fetch/store r5g6b5 scanline
-* used in 
-  0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
-  0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
-  0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
-
-
----
- pixman/pixman-access.c       |   23 ++++++++++++++++++++++-
- pixman/pixman-private.h      |    5 +++++
- 4 files changed, 87 insertions(+), 1 deletions(-)
-
-diff --git a/pixman/pixman-access.c b/pixman/pixman-access.c
-index f1ce0ba..b33da29 100644
---- a/pixman/pixman-access.c
-+++ b/pixman/pixman-access.c
-@@ -2836,7 +2836,7 @@ typedef struct
- 	    store_scanline_ ## format, store_scanline_generic_64	\
-     }
- 
--static const format_info_t accessors[] =
-+static format_info_t accessors[] =
- {
- /* 32 bpp formats */
-     FORMAT_INFO (a8r8g8b8),
-@@ -2978,6 +2978,27 @@ _pixman_bits_image_setup_accessors (bits_image_t *image)
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
-+		info->fetch_scanline_32 = fetch_func;
-+	    if (store_func)
-+		info->store_scanline_32 = store_func;
-+	    return;
-+	}
-+	info++;
-+    }
-+}
-+
- #else
- 
- void
-diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index d85868f..564f8f0 100644
---- a/pixman/pixman-private.h
-+++ b/pixman/pixman-private.h
-@@ -206,6 +206,11 @@ void
- _pixman_bits_image_setup_accessors (bits_image_t *image);
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
diff --git a/recipes/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch b/recipes/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
deleted file mode 100644
index 795cce5..0000000
--- a/recipes/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 97b2bb933455f222b392b5c60a8bde82d7d6329f Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Tue, 16 Mar 2010 16:55:28 +0100
-Subject: [PATCH 1/8] Generic C implementation of pixman_blt with overlapping support
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
-index 4d234a0..c4d2c14 100644
---- a/pixman/pixman-general.c
-+++ b/pixman/pixman-general.c
-@@ -280,9 +280,24 @@ general_blt (pixman_implementation_t *imp,
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
-index c43172b..f980454 100644
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
-@@ -873,4 +874,46 @@ void pixman_timer_register (pixman_timer_t *timer);
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
diff --git a/recipes/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch b/recipes/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
deleted file mode 100644
index 6e2d492..0000000
--- a/recipes/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 47b31f936641da07431093ede340465625bfcb3d Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:47 +0300
-Subject: [PATCH 2/8] Support of overlapping src/dst for pixman_blt_mmx
-
----
- pixman/pixman-mmx.c |   55 +++++++++++++++++++++++++++++---------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-mmx.c b/pixman/pixman-mmx.c
-index e936c4c..2413197 100644
---- a/pixman/pixman-mmx.c
-+++ b/pixman/pixman-mmx.c
-@@ -2996,34 +2996,43 @@ pixman_blt_mmx (uint32_t *src_bits,
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
-@@ -3033,7 +3042,7 @@ pixman_blt_mmx (uint32_t *src_bits,
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
diff --git a/recipes/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch b/recipes/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
deleted file mode 100644
index 910f62e..0000000
--- a/recipes/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 13be027637602fffda3b3cb6e171d8d6a67b3b4b Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 22 Oct 2009 05:45:54 +0300
-Subject: [PATCH 3/8] Support of overlapping src/dst for pixman_blt_sse2
-
----
- pixman/pixman-sse2.c |   55 +++++++++++++++++++++++++++++--------------------
- 1 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/pixman/pixman-sse2.c b/pixman/pixman-sse2.c
-index 5907de0..25015ae 100644
---- a/pixman/pixman-sse2.c
-+++ b/pixman/pixman-sse2.c
-@@ -5027,34 +5027,43 @@ pixman_blt_sse2 (uint32_t *src_bits,
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
-     while (height--)
-@@ -5064,7 +5073,7 @@ pixman_blt_sse2 (uint32_t *src_bits,
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
diff --git a/recipes/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch b/recipes/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
deleted file mode 100644
index f6aa979..0000000
--- a/recipes/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From a913cc05a1a1c5a813cf06d248334edede9caab7 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Wed, 18 Nov 2009 06:08:48 +0200
-Subject: [PATCH 4/8] Support of overlapping src/dst for pixman_blt_neon
-
----
- pixman/pixman-arm-neon.c |   62 +++++++++++++++++++++++++++++++++++++--------
- 1 files changed, 51 insertions(+), 11 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index be5d403..cbfd7cf 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -176,26 +176,66 @@ pixman_blt_neon (uint32_t *src_bits,
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
diff --git a/recipes/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch b/recipes/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
deleted file mode 100644
index dbe98b3..0000000
--- a/recipes/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From f75e9d1868e21dd75ff3a2ca3561546d23877ddb Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 10 Dec 2009 00:51:50 +0200
-Subject: [PATCH 5/8] ARM: added NEON optimizations for fetch/store r5g6b5 scanline
-
----
- pixman/pixman-arm-neon-asm.S |   20 ++++++++++++++++++++
- pixman/pixman-arm-neon.c     |   40 ++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 60 insertions(+), 0 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index e4db5cd..c79ba81 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -459,6 +459,16 @@ generate_composite_function \
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
-@@ -494,6 +504,16 @@ generate_composite_function \
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
- .macro pixman_composite_add_8_8_process_pixblock_head
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index cbfd7cf..f88c8f8 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -392,6 +392,42 @@ BIND_COMBINE_U (over)
- BIND_COMBINE_U (add)
- BIND_COMBINE_U (out_reverse)
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
-+                            const uint32_t *mask)
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
-@@ -407,6 +443,10 @@ _pixman_implementation_create_arm_neon (void)
-     imp->combine_32[PIXMAN_OP_ADD] = neon_combine_add_u;
-     imp->combine_32[PIXMAN_OP_OUT_REVERSE] = neon_combine_out_reverse_u;
- 
-+    _pixman_bits_override_accessors (PIXMAN_r5g6b5,
-+                                     neon_fetch_scanline_r5g6b5,
-+                                     neon_store_scanline_r5g6b5);
-+
-     imp->blt = arm_neon_blt;
-     imp->fill = arm_neon_fill;
- 
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch b/recipes/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
deleted file mode 100644
index d050646..0000000
--- a/recipes/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From a1cd695c5e22f0f4a2b7272fab675a3cc510bacb Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Thu, 23 Sep 2010 21:10:56 +0300
-Subject: [PATCH 6/8] ARM: added NEON optimizations for fetch/store a8 scanline
-
----
- pixman/pixman-arm-neon-asm.S |   64 ++++++++++++++++++++++++++++++++++++++++++
- pixman/pixman-arm-neon.c     |   42 +++++++++++++++++++++++++++
- 2 files changed, 106 insertions(+), 0 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index c79ba81..ca0825c 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -418,6 +418,70 @@ generate_composite_function \
- 
- /******************************************************************************/
- 
-+.macro pixman_composite_src_8_8888_process_pixblock_head
-+    /* This is tricky part: we can't set these values just once in 'init' macro
-+     * because leading/trailing pixels handling part uses VZIP.8 instructions,
-+     * and they operate on values in-place and destroy original registers
-+     * content. Think about it like VST4.8 instruction corrupting NEON
-+     * registers after write in 'tail_head' macro. Except that 'tail_head'
-+     * macro itself actually does not need these extra VMOVs because it uses
-+     * real VST4.8 instruction.
-+     */
-+    vmov.u8     q0, #0
-+    vmov.u8     d2, #0
-+.endm
-+
-+.macro pixman_composite_src_8_8888_process_pixblock_tail
-+.endm
-+
-+.macro pixman_composite_src_8_8888_process_pixblock_tail_head
-+    vst4.8      {d0, d1, d2, d3}, [DST_W, :128]!
-+    vld1.8      {d3}, [SRC]!
-+.endm
-+
-+generate_composite_function_single_scanline \
-+    pixman_fetch_scanline_a8_asm_neon, 8, 0, 32, \
-+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    default_init, \
-+    default_cleanup, \
-+    pixman_composite_src_8_8888_process_pixblock_head, \
-+    pixman_composite_src_8_8888_process_pixblock_tail, \
-+    pixman_composite_src_8_8888_process_pixblock_tail_head, \
-+    0,  /* dst_w_basereg */ \
-+    0,  /* dst_r_basereg */ \
-+    3,  /* src_basereg   */ \
-+    0   /* mask_basereg  */
-+
-+/******************************************************************************/
-+
-+.macro pixman_composite_src_8888_8_process_pixblock_head
-+.endm
-+
-+.macro pixman_composite_src_8888_8_process_pixblock_tail
-+.endm
-+
-+.macro pixman_composite_src_8888_8_process_pixblock_tail_head
-+    vst1.8      {d3}, [DST_W, :64]!
-+    vld4.8      {d0, d1, d2, d3}, [SRC]!
-+.endm
-+
-+generate_composite_function_single_scanline \
-+    pixman_store_scanline_a8_asm_neon, 32, 0, 8, \
-+    FLAG_DST_WRITEONLY | FLAG_DEINTERLEAVE_32BPP, \
-+    8, /* number of pixels, processed in a single block */ \
-+    default_init, \
-+    default_cleanup, \
-+    pixman_composite_src_8888_8_process_pixblock_head, \
-+    pixman_composite_src_8888_8_process_pixblock_tail, \
-+    pixman_composite_src_8888_8_process_pixblock_tail_head, \
-+    3,  /* dst_w_basereg */ \
-+    0,  /* dst_r_basereg */ \
-+    0,  /* src_basereg   */ \
-+    0   /* mask_basereg  */
-+
-+/******************************************************************************/
-+
- .macro pixman_composite_src_8888_0565_process_pixblock_head
-     vshll.u8    q8, d1, #8
-     vshll.u8    q14, d2, #8
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index f88c8f8..43091d2 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -428,6 +428,45 @@ neon_store_scanline_r5g6b5 (bits_image_t *  image,
-     pixman_store_scanline_r5g6b5_asm_neon (width, pixel, values);
- }
- 
-+void
-+pixman_fetch_scanline_a8_asm_neon (int             width,
-+                                   uint32_t       *buffer,
-+                                   const uint8_t  *pixel);
-+
-+
-+void
-+pixman_store_scanline_a8_asm_neon (int             width,
-+                                   uint8_t        *pixel,
-+                                   const uint32_t *values);
-+
-+static void
-+neon_fetch_scanline_a8 (pixman_image_t *image,
-+                        int             x,
-+                        int             y,
-+                        int             width,
-+                        uint32_t *      buffer,
-+                        const uint32_t *mask)
-+{
-+    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
-+    const uint8_t *pixel = (const uint8_t *) bits + x;
-+
-+    pixman_fetch_scanline_a8_asm_neon (width, buffer, pixel);
-+}
-+
-+static void
-+neon_store_scanline_a8 (bits_image_t *  image,
-+                        int             x,
-+                        int             y,
-+                        int             width,
-+                        const uint32_t *values)
-+{
-+    uint32_t *bits = image->bits + image->rowstride * y;
-+    uint8_t *pixel = (uint8_t *) bits + x;
-+
-+    pixman_store_scanline_a8_asm_neon (width, pixel, values);
-+}
-+
-+
- pixman_implementation_t *
- _pixman_implementation_create_arm_neon (void)
- {
-@@ -446,6 +485,9 @@ _pixman_implementation_create_arm_neon (void)
-     _pixman_bits_override_accessors (PIXMAN_r5g6b5,
-                                      neon_fetch_scanline_r5g6b5,
-                                      neon_store_scanline_r5g6b5);
-+    _pixman_bits_override_accessors (PIXMAN_a8,
-+                                     neon_fetch_scanline_a8,
-+                                     neon_store_scanline_a8);
- 
-     imp->blt = arm_neon_blt;
-     imp->fill = arm_neon_fill;
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch b/recipes/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
deleted file mode 100644
index 7f28f47..0000000
--- a/recipes/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From d6ae7da60cc797900b5eff0786536c4a11ab0f50 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Fri, 24 Sep 2010 18:22:44 +0300
-Subject: [PATCH 7/8] ARM: added NEON optimizations for fetching x8r8g8b8 scanline
-
----
- pixman/pixman-arm-neon-asm.S |   14 ++++++++++++++
- pixman/pixman-arm-neon.c     |   21 +++++++++++++++++++++
- 2 files changed, 35 insertions(+), 0 deletions(-)
-
-diff --git a/pixman/pixman-arm-neon-asm.S b/pixman/pixman-arm-neon-asm.S
-index ca0825c..ffd0b83 100644
---- a/pixman/pixman-arm-neon-asm.S
-+++ b/pixman/pixman-arm-neon-asm.S
-@@ -1206,6 +1206,20 @@ generate_composite_function \
-     0, /* src_basereg   */ \
-     0  /* mask_basereg  */
- 
-+generate_composite_function_single_scanline \
-+    pixman_fetch_scanline_x888_asm_neon, 32, 0, 32, \
-+    FLAG_DST_WRITEONLY, \
-+    8, /* number of pixels, processed in a single block */ \
-+    pixman_composite_src_x888_8888_init, \
-+    default_cleanup, \
-+    pixman_composite_src_x888_8888_process_pixblock_head, \
-+    pixman_composite_src_x888_8888_process_pixblock_tail, \
-+    pixman_composite_src_x888_8888_process_pixblock_tail_head, \
-+    0,  /* dst_w_basereg */ \
-+    0,  /* dst_r_basereg */ \
-+    0,  /* src_basereg   */ \
-+    0   /* mask_basereg  */
-+
- /******************************************************************************/
- 
- .macro pixman_composite_over_n_8_8888_process_pixblock_head
-diff --git a/pixman/pixman-arm-neon.c b/pixman/pixman-arm-neon.c
-index 43091d2..f84b5e6 100644
---- a/pixman/pixman-arm-neon.c
-+++ b/pixman/pixman-arm-neon.c
-@@ -466,6 +466,24 @@ neon_store_scanline_a8 (bits_image_t *  image,
-     pixman_store_scanline_a8_asm_neon (width, pixel, values);
- }
- 
-+void
-+pixman_fetch_scanline_x888_asm_neon (int             width,
-+                                     uint32_t       *buffer,
-+                                     const uint32_t *pixel);
-+
-+static void
-+neon_fetch_scanline_x888 (pixman_image_t *image,
-+                          int             x,
-+                          int             y,
-+                          int             width,
-+                          uint32_t *      buffer,
-+                          const uint32_t *mask)
-+{
-+    const uint32_t *bits = image->bits.bits + y * image->bits.rowstride;
-+    const uint32_t *pixel = (const uint32_t *) bits + x;
-+
-+    pixman_fetch_scanline_x888_asm_neon (width, buffer, pixel);
-+}
- 
- pixman_implementation_t *
- _pixman_implementation_create_arm_neon (void)
-@@ -488,6 +506,9 @@ _pixman_implementation_create_arm_neon (void)
-     _pixman_bits_override_accessors (PIXMAN_a8,
-                                      neon_fetch_scanline_a8,
-                                      neon_store_scanline_a8);
-+    _pixman_bits_override_accessors (PIXMAN_x8r8g8b8,
-+                                     neon_fetch_scanline_x888,
-+                                     NULL);
- 
-     imp->blt = arm_neon_blt;
-     imp->fill = arm_neon_fill;
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch b/recipes/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch
deleted file mode 100644
index 6efdb62..0000000
--- a/recipes/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-From e1191ad6563a1fb02a45982b1c4d7fed3c655e97 Mon Sep 17 00:00:00 2001
-From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
-Date: Mon, 4 Oct 2010 01:56:59 +0300
-Subject: [PATCH 8/8] ARM optimization for scaled src_0565_0565 operation with nearest filter
-
-The code actually uses only armv4t instructions.
-
-Benchmark from ARM11:
-
-    == before ==
-    op=1, src_fmt=10020565, dst_fmt=10020565, speed=34.86 MPix/s
-
-    == after ==
-    op=1, src_fmt=10020565, dst_fmt=10020565, speed=36.62 MPix/s
-
-Benchmark from ARM Cortex-A8:
-
-    == before ==
-    op=1, src_fmt=10020565, dst_fmt=10020565, speed=89.55 MPix/s
-
-    == after ==
-    op=1, src_fmt=10020565, dst_fmt=10020565, speed=94.91 MPix/s
----
- pixman/pixman-arm-simd-asm.S |   66 ++++++++++++++++++++++++++++++++++++++++++
- pixman/pixman-arm-simd.c     |   37 +++++++++++++++++++++++
- 2 files changed, 103 insertions(+), 0 deletions(-)
-
-diff --git a/pixman/pixman-arm-simd-asm.S b/pixman/pixman-arm-simd-asm.S
-index a3d2d40..b6f69db 100644
---- a/pixman/pixman-arm-simd-asm.S
-+++ b/pixman/pixman-arm-simd-asm.S
-@@ -1,5 +1,6 @@
- /*
-  * Copyright © 2008 Mozilla Corporation
-+ * Copyright © 2010 Nokia Corporation
-  *
-  * Permission to use, copy, modify, distribute, and sell this software and its
-  * documentation for any purpose is hereby granted without fee, provided that
-@@ -328,3 +329,68 @@ pixman_asm_function pixman_composite_over_n_8_8888_asm_armv6
- 	pop	{r4, r5, r6, r7, r8, r9, r10, r11}
- 	bx	lr
- .endfunc
-+
-+/*
-+ * Note: This function is actually primarily optimized for ARM Cortex-A8
-+ * pipeline. In order to get good performance on ARM9/ARM11 cores (which
-+ * don't have efficient write combining), it needs to be changed to use
-+ * 16-byte aligned writes using STM instruction.
-+ */
-+pixman_asm_function pixman_scaled_nearest_scanline_565_565_SRC_asm_armv6
-+	DST	.req	r0
-+	SRC	.req	r1
-+	W	.req	r2
-+	VX	.req	r3
-+	UNIT_X	.req	r12
-+	TMP1	.req	r4
-+	TMP2	.req	r5
-+	MASK	.req	r6
-+	ldr	UNIT_X, [sp]
-+	push	{r4, r5, r6, r7}
-+	mvn	MASK, #1
-+
-+	/* define helper macro */
-+	.macro	scale_2_pixels
-+		ldrh	TMP1, [SRC, TMP1]
-+		and	TMP2, MASK, VX, lsr #15
-+		add	VX, VX, UNIT_X
-+		strh	TMP1, [DST], #2
-+
-+		ldrh	TMP2, [SRC, TMP2]
-+		and	TMP1, MASK, VX, lsr #15
-+		add	VX, VX, UNIT_X
-+		strh	TMP2, [DST], #2
-+	.endm
-+
-+	/* now do the scaling */
-+	and	TMP1, MASK, VX, lsr #15
-+	add	VX, VX, UNIT_X
-+	subs	W, #4
-+	blt	2f
-+1: /* main loop, process 4 pixels per iteration */
-+	scale_2_pixels
-+	scale_2_pixels
-+	subs	W, W, #4
-+	bge	1b
-+2:
-+	tst	W, #2
-+	beq	2f
-+	scale_2_pixels
-+2:
-+	tst	W, #1
-+	ldrneh	TMP1, [SRC, TMP1]
-+	strneh	TMP1, [DST], #2
-+	/* cleanup helper macro */
-+	.purgem	scale_2_pixels
-+	.unreq	DST
-+	.unreq	SRC
-+	.unreq	W
-+	.unreq	VX
-+	.unreq	UNIT_X
-+	.unreq	TMP1
-+	.unreq	TMP2
-+	.unreq	MASK
-+	/* return */
-+	pop	{r4, r5, r6, r7}
-+	bx	lr
-+.endfunc
-diff --git a/pixman/pixman-arm-simd.c b/pixman/pixman-arm-simd.c
-index d466a31..f6f464c 100644
---- a/pixman/pixman-arm-simd.c
-+++ b/pixman/pixman-arm-simd.c
-@@ -29,6 +29,7 @@
- 
- #include "pixman-private.h"
- #include "pixman-arm-common.h"
-+#include "pixman-fast-path.h"
- 
- #if 0 /* This code was moved to 'pixman-arm-simd-asm.S' */
- 
-@@ -375,6 +376,35 @@ pixman_composite_over_n_8_8888_asm_armv6 (int32_t   width,
- 
- #endif
- 
-+void
-+pixman_scaled_nearest_scanline_565_565_SRC_asm_armv6 (uint16_t *      dst,
-+						      uint16_t *      src,
-+						      int32_t         w,
-+						      pixman_fixed_t  vx,
-+						      pixman_fixed_t  unit_x);
-+
-+static force_inline void
-+scaled_nearest_scanline_armv6_565_565_SRC (uint16_t *      dst,
-+					   uint16_t *      src,
-+					   int32_t         w,
-+					   pixman_fixed_t  vx,
-+					   pixman_fixed_t  unit_x,
-+					   pixman_fixed_t  max_vx)
-+{
-+    pixman_scaled_nearest_scanline_565_565_SRC_asm_armv6 (dst, src, w,
-+							  vx, unit_x);
-+}
-+
-+FAST_NEAREST_MAINLOOP (armv6_565_565_cover_SRC,
-+		       scaled_nearest_scanline_armv6_565_565_SRC,
-+		       uint16_t, uint16_t, COVER);
-+FAST_NEAREST_MAINLOOP (armv6_565_565_none_SRC,
-+		       scaled_nearest_scanline_armv6_565_565_SRC,
-+		       uint16_t, uint16_t, NONE);
-+FAST_NEAREST_MAINLOOP (armv6_565_565_pad_SRC,
-+		       scaled_nearest_scanline_armv6_565_565_SRC,
-+		       uint16_t, uint16_t, PAD);
-+
- PIXMAN_ARM_BIND_FAST_PATH_SRC_DST (armv6, add_8_8,
-                                    uint8_t, 1, uint8_t, 1)
- PIXMAN_ARM_BIND_FAST_PATH_SRC_DST (armv6, over_8888_8888,
-@@ -404,6 +434,13 @@ static const pixman_fast_path_t arm_simd_fast_paths[] =
-     PIXMAN_STD_FAST_PATH (OVER, solid, a8, a8b8g8r8, armv6_composite_over_n_8_8888),
-     PIXMAN_STD_FAST_PATH (OVER, solid, a8, x8b8g8r8, armv6_composite_over_n_8_8888),
- 
-+    SIMPLE_NEAREST_FAST_PATH_COVER (SRC, r5g6b5, r5g6b5, armv6_565_565),
-+    SIMPLE_NEAREST_FAST_PATH_COVER (SRC, b5g6r5, b5g6r5, armv6_565_565),
-+    SIMPLE_NEAREST_FAST_PATH_NONE (SRC, r5g6b5, r5g6b5, armv6_565_565),
-+    SIMPLE_NEAREST_FAST_PATH_NONE (SRC, b5g6r5, b5g6r5, armv6_565_565),
-+    SIMPLE_NEAREST_FAST_PATH_PAD (SRC, r5g6b5, r5g6b5, armv6_565_565),
-+    SIMPLE_NEAREST_FAST_PATH_PAD (SRC, b5g6r5, b5g6r5, armv6_565_565),
-+
-     { PIXMAN_OP_NONE },
- };
- 
--- 
-1.6.6.1
-
diff --git a/recipes/xorg-lib/pixman_0.12.0.bb b/recipes/xorg-lib/pixman_0.12.0.bb
deleted file mode 100644
index fcf0c14..0000000
--- a/recipes/xorg-lib/pixman_0.12.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require pixman.inc
-PR = "${INC_PR}.0"
-
-SRC_URI += " \
-           file://pixman-arm.patch \
-           file://pixman-x888-565.patch \
-          "
-SRC_URI[archive.md5sum] = "09357cc74975b01714e00c5899ea1881"
-SRC_URI[archive.sha256sum] = "2b16516ef147bb604e1cf50c883143a052a7ff92d2930b70e571da0603b7d9ce"
diff --git a/recipes/xorg-lib/pixman_0.16.2.bb b/recipes/xorg-lib/pixman_0.16.2.bb
deleted file mode 100644
index 399bb6a..0000000
--- a/recipes/xorg-lib/pixman_0.16.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require pixman.inc
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "02bd3669f53c404c19980d5efb6f86fb"
-SRC_URI[archive.sha256sum] = "05f78c2fd3a5f054c0d716e8ba1b67a0c04a7a7e642d6946828ec383b389d185"
-
-EXTRA_OECONF = "--disable-gtk"
diff --git a/recipes/xorg-lib/pixman_0.18.4.bb b/recipes/xorg-lib/pixman_0.18.4.bb
deleted file mode 100644
index 286477a..0000000
--- a/recipes/xorg-lib/pixman_0.18.4.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require pixman.inc
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "532db4194e18c108d0b7dd85f20d39b8"
-SRC_URI[archive.sha256sum] = "1484092277c5187f5458229a2b7fd7fbc0cb07e1f220c7f8f9ac65de6dba7989"
-SRC_URI += "\
-           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch\
-           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch\
-           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch\
-           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch\
-           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch\
-           file://0006-A-copy-paste-version-of-16bpp-bilinear-scanline-fetc.patch\
-           file://0007-ARM-added-missing-cache-preload.patch\
-           file://565-over-neon.patch \
-           file://neon-reverse-u.patch \
-"
-
-NEON = " --disable-arm-neon "
-NEON_armv7a = " "
-
-EXTRA_OECONF = "${NEON} --disable-gtk"
diff --git a/recipes/xorg-lib/pixman_0.20.0.bb b/recipes/xorg-lib/pixman_0.20.0.bb
deleted file mode 100644
index b3fbd4f..0000000
--- a/recipes/xorg-lib/pixman_0.20.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require pixman.inc
-
-SRC_URI[archive.md5sum] = "c1a31d5cedfa97c5af7148a2d1fd4356"
-SRC_URI[archive.sha256sum] = "9c02c22c6cc3f28f3633d02ef6f0cac130518f621edb011ebbbf08cd1a81251a"
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "\
-           file://0000-Add-pixman_bits_override_accessors.patch \
-           file://0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
-           file://0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch \
-           file://0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch \
-           file://0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch \
-           file://0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch \
-           file://0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch \
-           file://0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch \
-           file://0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch \
-"
-
-NEON = " --disable-arm-neon "
-NEON_armv7a = " "
-
-EXTRA_OECONF = "${NEON} --disable-gtk"
diff --git a/recipes/xorg-lib/xtrans_1.2.5.bb b/recipes/xorg-lib/xtrans_1.2.5.bb
deleted file mode 100644
index e6e3714..0000000
--- a/recipes/xorg-lib/xtrans_1.2.5.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "network API translation layer to insulate X applications and \
-libraries from OS network vageries."
-RDEPENDS_${PN}-dev = ""
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2d1e57e82acc5f21797e92341415af2f"
-SRC_URI[archive.sha256sum] = "cc71a391f4da8176e5daeeac1ddf5137ba5e8d2263cb93a49f9e2a9976b90899"
-
-ALLOW_EMPTY = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.4.rc1




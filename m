Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1QBlyj-0001qi-IF
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:46:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 8E452A4A58
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 11:44:28 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Ot1Is3yOxb7g
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 11:44:21 +0100 (BST)
Received: from xora-eee (188-220-38-49.zone11.bethere.co.uk [188.220.38.49])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 7727FA4A44
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 11:44:21 +0100 (BST)
Received: by xora-eee (Postfix, from userid 1000)
	id BE63B8017E; Mon, 18 Apr 2011 11:44:21 +0100 (BST)
Date: Mon, 18 Apr 2011 11:44:21 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110418104421.GG2268@xora-eee.xora.org.uk>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 00/13] Pull request #8
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
X-List-Received-Date: Mon, 18 Apr 2011 10:46:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Not an issue with this checkin, but it raises a question for me,

Should xorg stuff be in OE core? Its not really that core in my mind.

Graeme

On Mon, Apr 18, 2011 at 12:32:38PM +0200, Martin Jansa wrote:
> xorg recipes cleanup after some of them were upgraded in oe-core
> more native and nativesdk in BBCLASSEXTEND
> small fixes
> 
> Pull URL: git://gitorious.org/shr/meta-openembedded.git
>   Branch: jama/meta-oe
>   Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-oe
> 
> Thanks,
>     Martin Jansa <Martin.Jansa@gmail.com>
> ---
> 
> 
> Martin Jansa (13):
>   xorg-xserver: upgrade to 1.10.1
>   xserver-common: add fbset to RDEPENDS
>   libxft: add native and nativesdk BBCLASSEXTEND
>   libusb1: add native and nativesdk BBCLASSEXTEND
>   renderproto: it was upgraded in oe-core, keep only .bbappend with
>     BBCLASSEXTEND
>   libxrender:  it was upgraded in oe-core, keep only .bbappend with
>     BBCLASSEXTEND
>   xorg-xserver-common.inc: add virtual/xserver-xf86 to PROVIDES, to be
>     able to blacklist xserver-xf86-lite from oe-core
>   recipes-graphics: remove xorg recipes which were upgraded to same
>     versions in oe-core
>   pixman: drop older version 0.20.0
>   libx11: drop older version 1.4.1
>   xorg-driver-common: depend on virtual/xserver-xf86 as oe-core drivers
>     does
>   libiconv: add LIC_FILES_CHKSUM
>   libdrm: upgrade to 2.4.25
> 
>  .../drm/libdrm-2.4.24/installtests.patch           |   43 -----
>  .../{libdrm-2.4.24 => libdrm-2.4.25}/glamo.patch   |    0
>  .../drm/libdrm-2.4.25/installtests.patch           |   49 ++++++
>  .../drm/{libdrm_2.4.24.bb => libdrm_2.4.25.bb}     |    6 +-
>  .../xorg-driver/xf86-input-keyboard_1.6.0.bb       |   17 --
>  .../xorg-driver/xf86-input-mouse_1.7.0.bb          |   17 --
>  .../xorg-driver/xorg-driver-common.inc             |    2 +-
>  .../xorg-lib/libx11-1.4.1/keysymdef_include.patch  |   19 ---
>  .../libx11-1.4.1/x11_disable_makekeys.patch        |   29 ----
>  meta-oe/recipes-graphics/xorg-lib/libx11_1.4.1.bb  |   12 --
>  meta-oe/recipes-graphics/xorg-lib/libxext_1.2.0.bb |   18 --
>  .../xorg-lib/libxft_2.2.0.bbappend                 |    1 +
>  meta-oe/recipes-graphics/xorg-lib/libxi_1.4.2.bb   |   21 ---
>  .../recipes-graphics/xorg-lib/libxrender_0.9.6.bb  |   17 --
>  .../xorg-lib/libxrender_0.9.6.bbappend             |    1 +
>  meta-oe/recipes-graphics/xorg-lib/libxt_1.1.1.bb   |   37 -----
>  .../0000-Add-pixman_bits_override_accessors.patch  |   77 ---------
>  ...mplementation-of-pixman_blt-with-overlapp.patch |  114 -------------
>  ...of-overlapping-src-dst-for-pixman_blt_mmx.patch |   91 -----------
>  ...f-overlapping-src-dst-for-pixman_blt_sse2.patch |   91 -----------
>  ...f-overlapping-src-dst-for-pixman_blt_neon.patch |   94 -----------
>  ...EON-optimizations-for-fetch-store-r5g6b5-.patch |  109 -------------
>  ...EON-optimizations-for-fetch-store-a8-scan.patch |  148 -----------------
>  ...EON-optimizations-for-fetching-x8r8g8b8-s.patch |   77 ---------
>  ...ation-for-scaled-src_0565_0565-operation-.patch |  172 --------------------
>  meta-oe/recipes-graphics/xorg-lib/pixman_0.20.0.bb |   23 ---
>  .../recipes-graphics/xorg-proto/fixesproto_5.0.bb  |   21 ---
>  .../xorg-proto/renderproto_0.11.1.bb               |   15 --
>  .../xorg-proto/renderproto_0.11.1.bbappend         |    1 +
>  .../recipes-graphics/xorg-proto/xextproto_7.2.0.bb |   19 ---
>  .../xorg-proto/xorg-proto-common.inc               |   19 ---
>  .../recipes-graphics/xorg-proto/xproto_7.0.21.bb   |   16 --
>  .../xorg-xserver/xorg-xserver-common.inc           |    7 +-
>  ...ack-assume-pixman-supports-overlapped-blt.patch |    0
>  .../hack-fbdev-ignore-return-mode.patch            |    0
>  ...r-xorg_1.10.0.902.bb => xserver-xorg_1.10.1.bb} |    4 +-
>  .../xorg-xserver/xserver-xorg_git.bb               |    4 +-
>  .../xserver-common/xserver-common_1.34.bb          |    4 +-
>  .../recipes-support/libiconv/libiconv_1.13.1.bb    |    5 +
>  .../recipes-support/libusb/libusb1_1.0.8.bbappend  |    1 +
>  40 files changed, 73 insertions(+), 1328 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/drm/libdrm-2.4.24/installtests.patch
>  rename meta-oe/recipes-graphics/drm/{libdrm-2.4.24 => libdrm-2.4.25}/glamo.patch (100%)
>  create mode 100644 meta-oe/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
>  rename meta-oe/recipes-graphics/drm/{libdrm_2.4.24.bb => libdrm_2.4.25.bb} (91%)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/keysymdef_include.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11_1.4.1.bb
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxext_1.2.0.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxft_2.2.0.bbappend
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxi_1.4.2.bb
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxt_1.1.1.bb
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0000-Add-pixman_bits_override_accessors.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0001-Generic-C-implementation-of-pixman_blt-with-overlapp.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0002-Support-of-overlapping-src-dst-for-pixman_blt_mmx.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0003-Support-of-overlapping-src-dst-for-pixman_blt_sse2.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0004-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0005-ARM-added-NEON-optimizations-for-fetch-store-r5g6b5-.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0006-ARM-added-NEON-optimizations-for-fetch-store-a8-scan.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0007-ARM-added-NEON-optimizations-for-fetching-x8r8g8b8-s.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.20.0/0008-ARM-optimization-for-scaled-src_0565_0565-operation-.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.20.0.bb
>  delete mode 100644 meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bb
>  delete mode 100644 meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bbappend
>  delete mode 100644 meta-oe/recipes-graphics/xorg-proto/xextproto_7.2.0.bb
>  delete mode 100644 meta-oe/recipes-graphics/xorg-proto/xorg-proto-common.inc
>  delete mode 100644 meta-oe/recipes-graphics/xorg-proto/xproto_7.0.21.bb
>  rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.0.902 => xserver-xorg-1.10.1}/hack-assume-pixman-supports-overlapped-blt.patch (100%)
>  rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.0.902 => xserver-xorg-1.10.1}/hack-fbdev-ignore-return-mode.patch (100%)
>  rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg_1.10.0.902.bb => xserver-xorg_1.10.1.bb} (88%)
>  create mode 100644 meta-oe/recipes-support/libusb/libusb1_1.0.8.bbappend
> 
> -- 
> 1.7.5.rc1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



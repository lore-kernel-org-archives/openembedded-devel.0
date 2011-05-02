Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QH0IY-0007Iv-HQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 23:04:56 +0200
Received: (qmail invoked by alias); 02 May 2011 21:02:16 -0000
Received: from p5B0A1227.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.18.39]
	by mail.gmx.net (mp010) with SMTP; 02 May 2011 23:02:16 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18NuKJel3cNkJt3gPboiOa7kme9mEKDxUtS4eRNIu
	hlJapwoeyES6lO
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 May 2011 23:02:44 +0200
Message-Id: <1304370168-4354-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [PATCH 0/4] Add support for freescale mx28evk board
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
X-List-Received-Date: Mon, 02 May 2011 21:04:56 -0000

Kernel and u-boot are build based on the same sources as shipped with the
latest freescale board support package. It is intended as a replacement for
LTIB (think what you want of that build system). The ROM builtin bootloader
requires so called boot streams (*.sb). These are build for u-boot and kernel
by eltosb-native and stored in deploy folder. Subsequent patches will follow
to have at least the kernel coming from mainline (it looks as if kernel 2.6.39
will have enhanced support for mx28evk).

Andreas Mueller (4):
  mx28evk: Add new machine definition
  elftosb: Add native helper to create boot stream files used by
    freescale iMX SoCs
  u-boot: Add support for freescale iMX28 SoCs
  linux-imx-git: add support for freescale mx28evk

 conf/machine/include/imx28.inc                     |   19 +
 conf/machine/mx28evk.conf                          |   23 +
 .../elftosb/uclibc_and_eglibc_have_no_powf.patch   |   12 +
 recipes/freescale/elftosb_10.12.01.bb              |   20 +
 recipes/linux/linux-imx-git/mx28evk/defconfig      | 2132 ++++++++++++++++++++
 recipes/linux/linux-imx_git.bb                     |   53 +-
 recipes/u-boot/u-boot_git.bb                       |   24 +
 7 files changed, 2268 insertions(+), 15 deletions(-)
 create mode 100644 conf/machine/include/imx28.inc
 create mode 100644 conf/machine/mx28evk.conf
 create mode 100644 recipes/freescale/elftosb/uclibc_and_eglibc_have_no_powf.patch
 create mode 100644 recipes/freescale/elftosb_10.12.01.bb
 create mode 100644 recipes/linux/linux-imx-git/mx28evk/defconfig

-- 
1.7.4.4




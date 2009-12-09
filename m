Received: from compulab.co.il ([67.18.134.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NIGls-0002M0-KL
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 08:15:42 +0100
Received: from [62.90.235.247] (helo=zimbra-mta.compulab.co.il)
	by compulab.site5.com with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NIGkF-0001iY-3H
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 01:13:55 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 851BD9A0366
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 09:13:54 +0200 (IST)
X-Virus-Scanned: amavisd-new at compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
	by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id c2ULlNTxEvsy; Wed,  9 Dec 2009 09:13:50 +0200 (IST)
Received: from droid.compulab.local (droid.compulab.local [10.1.1.77])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 452119A034C;
	Wed,  9 Dec 2009 09:13:50 +0200 (IST)
Received: from droid.compulab.local (localhost [127.0.0.1])
	by droid.compulab.local (8.14.0/8.14.0) with ESMTP id nB97Diqf011573;
	Wed, 9 Dec 2009 09:13:44 +0200
Received: (from mike@localhost)
	by droid.compulab.local (8.14.0/8.14.0/Submit) id nB97Dioc011572;
	Wed, 9 Dec 2009 09:13:44 +0200
X-Authentication-Warning: droid.compulab.local: mike set sender to
	mike@compulab.co.il using -f
From: Mike Rapoport <mike@compulab.co.il>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Dec 2009 09:13:38 +0200
Message-Id: <cover.1260342678.git.mike@compulab.co.il>
X-Mailer: git-send-email 1.6.4.4
X-ACL-Warn: {
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - compulab.site5.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 67.18.134.219
X-SA-Exim-Mail-From: mike@compulab.co.il
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 0/5 v2] Add CM-T35 support
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
X-List-Received-Date: Wed, 09 Dec 2009 07:15:42 -0000

This patchset adds support for CM-T35 system-on-module based on OMAP3 SoC.

Mike Rapoport (5):
  u-boot git: add cm-t35 support
  linux-omap 2.6.32: add cm-t35 support
  cm-t35: add machine configuration
  angstrom-led-config: Add LED setup for the cm-t35 and bump PR.
  xserver-xorg-conf: add cm-t35 support

 conf/machine/cm-t35.conf                           |   46 +
 recipes/angstrom/angstrom-led-config.bb            |    2 +-
 recipes/angstrom/angstrom-led-config/cm-t35/leds   |    2 +
 .../0001-OMAP-DSS2-add-Toppoly-TDO35S-panel.patch  |  159 ++
 ...do24m-ensure-chip-select-changes-between-.patch |   30 +
 ...002-omap3-cm-t35-add-DSS2-display-support.patch |  307 ++++
 ...03-omap3-cm-t35-update-defconfig-for-DSS2.patch |  145 ++
 .../0004-omap3-cm-t35-add-cm-t35-mux-configs.patch |  427 +++++
 .../0006-omap3-cm-t35-update-defconfig.patch       |   87 +
 recipes/linux/linux-omap-2.6.32/cm-t35/defconfig   | 1823 ++++++++++++++++++++
 recipes/linux/linux-omap_2.6.32.bb                 |    9 +-
 recipes/u-boot/u-boot-git/cm-t35/cm-t35.patch      | 1487 ++++++++++++++++
 recipes/u-boot/u-boot_git.bb                       |    2 +
 .../xserver-xorg-conf/cm-t35/xorg.conf             |   29 +
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 15 files changed, 4554 insertions(+), 3 deletions(-)
 create mode 100644 conf/machine/cm-t35.conf
 create mode 100644 recipes/angstrom/angstrom-led-config/cm-t35/leds
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0001-OMAP-DSS2-add-Toppoly-TDO35S-panel.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0001-backlight-tdo24m-ensure-chip-select-changes-between-.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0002-omap3-cm-t35-add-DSS2-display-support.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0003-omap3-cm-t35-update-defconfig-for-DSS2.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0004-omap3-cm-t35-add-cm-t35-mux-configs.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0006-omap3-cm-t35-update-defconfig.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/defconfig
 create mode 100644 recipes/u-boot/u-boot-git/cm-t35/cm-t35.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/cm-t35/xorg.conf




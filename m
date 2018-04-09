Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 00C2472EED
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:03:12 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f125so19483223wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E9CsD2uEiKnKww16jFcDwnowmYGS25IqsYHybUHPQ1Y=;
	b=P9S5g+VmKvPRPMyumKPxI8FsQG1dnZDP4JSRK+dxM1JCHG0/cOfoAKWfCpo8I/UX+L
	59AKGM+qpLLdjC+c321PN9BugklzmIOVBN3vW9SY+ZoYDMF132Mdmztf+FRd7rIjhBJO
	XX2y9oIcITI0ZDCdXqrlKKkZKLnu9QuCzJjtduzVqKbHwtub7A1JUsHXKTp1KZPsFE6b
	zO16eitDICIkf3KQw6PbRIa09/QJHpo9oulXoRdAuM4Ta9un5XN1WX6pq/FgPYVovR8Q
	h4rVw0zqi2qZo1pl8QVb9j9nhGS/LXBTYF6usNgkFPu2WjWYyuDVYpWKGYHTUpJno8Sg
	hXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E9CsD2uEiKnKww16jFcDwnowmYGS25IqsYHybUHPQ1Y=;
	b=I6hLzu0qshfkZRxBGHXf6qNiiyQnBbPg+1MGPeuSQiRek31h14ydCluMcxRNrCDqcl
	LXI+Pc47Rgo1OsFhs8Fkv30+Q4X+7bMdRKNv98bwk20lw2AeHjoMZ5sDbixOz69mP5kr
	pG+M1CqITggKmh8Cjl9EbiNFrZQe6mtW5+SBvbYkkcWc3EKK+1V8bUQ9BIWnNllhO8aC
	l/nRBUFQIafizdbScwJ/rKb23vY/dgD2g03j0vx3LW05qh7gpP4rqD9I2rVb3eiLMotl
	IbDFmzXPBSV67LFQpcs7kbdIuUgBp4TP21Nzw8unJeET8DeGQVOZNQn7wsAOTkIFMehm
	PH7A==
X-Gm-Message-State: ALQs6tAs/EJL4o46OpDBZtf/nMeFAZ3tqpFnGy9CPydlMUVXCLVGtQmx
	raFxESU+gV9Rftq7/lbjf0uV3w==
X-Google-Smtp-Source: AIpwx48/1oeoJVg5qrXLy0QOQIYA5eViXp1YF+HU7AcTV2xAPO5KOxvl6gCGmHuvcBrPqC0IzZcEPQ==
X-Received: by 10.28.93.138 with SMTP id r132mr468wmb.58.1523311392582;
	Mon, 09 Apr 2018 15:03:12 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC14F231E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:4f23:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g185sm650954wmf.40.2018.04.09.15.03.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 15:03:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 00:02:40 +0200
Message-Id: <20180409220249.11796-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 0/9] Fixes and updates for sumo
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
X-List-Received-Date: Mon, 09 Apr 2018 22:03:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

History:

1. networkmanager: fix gobject-introspection/musl and cleanup: This was sent
   already but not applied yet. Now I know why: It introduced a parse error
   for PACKAGECONFIG. I removed this 'fix' - the recipe was perfectly fine. I did
   not notice this error because one of my layers overrided PACKAGECONFIG for
   networkmanager.
2. poppler: Rework patch fixing do_configure: resend
3. poppler: update 0.62.0- > 0.63.0: resend
4. poppler: fix build for TARGET_FPU = "soft": Fix for qemuarm build error on
   autobuilder
5. New - more meta-gnome cleanup
6.-
9. New - build- and run-tested on Raspi3

The following changes since commit fa1913215275899b09c49c0bb5531f26909c5790:

  samba: update to 4.7.6 (2018-04-09 12:32:07 -0400)

are available in the Git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git more-sumo

for you to fetch changes up to b3117108ca0c464638d401602a84b52ff05e0b41:

  thunar: update 1.6.14 -> 1.6.15 (2018-04-09 23:40:27 +0200)

----------------------------------------------------------------
Andreas Müller (9):
      networkmanager: fix gobject-introspection/musl and cleanup
      poppler: Rework patch fixing do_configure
      poppler: update 0.62.0- > 0.63.0
      poppler: fix build for TARGET_FPU = "soft"
      samba: refresh patches
      polkit-gnome: remove
      xfce4-terminal: update 0.8.7.2 -> 0.8.7.3
      xfce4-whiskermenu-plugin: update 2.1.5 -> 2.1.6
      thunar: update 1.6.14 -> 1.6.15

 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch              |  86 ------------------------------------------------------------
 ...05-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch => 0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch} |   0
 .../{0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch => 0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch} |   0
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch          |  30 ---------------------
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch                                        |  39 ---------------------------
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch   |  77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch              |  92 ----------------------------------------------------------------
 meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch                     |  67 -----------------------------------------------
 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch                                        |  53 +++++++++++++++++++++++++++++++++++++
 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch                          |  35 +++++++++++++++++++++++++
 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch                              |  72 ++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch                                 |  62 +++++++++++++++++++++++++++++++++++++++++++
 meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb                                                         |  31 ++++++++++++----------
 meta-networking/recipes-connectivity/samba/samba/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch                     |   5 ++--
 meta-networking/recipes-connectivity/samba/samba/16-do-not-check-xsltproc-manpages.patch                                             |  56 ++++++++++++++++++++++++---------------
 meta-networking/recipes-connectivity/samba/samba/21-add-config-option-without-valgrind.patch                                         |  19 +++++++-------
 meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch                                                                            |  12 ---------
 meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb                                                                                |  28 --------------------
 meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch                                              |  36 +++++++++++++------------
 meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch                              | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-oe/recipes-support/poppler/{poppler_0.62.0.bb => poppler_0.63.0.bb}                                                             |   5 ++--
 meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.2.bb => xfce4-terminal_0.8.7.3.bb}                                       |   4 +--
 meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.5.bb => xfce4-whiskermenu-plugin_2.1.6.bb}                 |   4 +--
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.14.bb => thunar_1.6.15.bb}                                                                 |   4 +--
 24 files changed, 492 insertions(+), 425 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch => 0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch} (100%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch => 0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch} (100%)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-gnome_0.105.bb
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch
 rename meta-oe/recipes-support/poppler/{poppler_0.62.0.bb => poppler_0.63.0.bb} (90%)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.2.bb => xfce4-terminal_0.8.7.3.bb} (68%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.5.bb => xfce4-whiskermenu-plugin_2.1.6.bb} (66%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.14.bb => thunar_1.6.15.bb} (88%)

-- 
2.14.3



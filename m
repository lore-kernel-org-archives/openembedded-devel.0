Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOwNd-0004hW-OW
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 22:07:45 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so6634847wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 12:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=FakRo2OgsUAj1Wn61Jsdca87VRbjW4f4weuFpN1z+Ho=;
	b=MX9F6gPVf+HKFmGShwnr9WmEmicSe9Mr+lu2b7RV4vT6I58lwwMn0exERZ76ZeUMPE
	PHvh9dyIjZEcFK2QJAMMTyyE2MDCOaZhTo0LX4KiIBIWLAmcCcgIC4FBpJsPQgbYY44H
	UmOFYdXi6udp1PT2aAbKbsvUZFmICJ+uajs3p9W6Q0bBWndF6+KVFL6IGp6+8GhrOlEn
	rqdSm1hwIX80eLfUE/NrdX0jpTyGeCnZLAHUfUqmHpvoGyPCB3t0pUqMq07mBUBtDrI0
	PQnuPibvQ6VSlkMjn0qpne7AfzHtLPl8Wf8mBqrvqIsHZodR4MeUnwyU5Xr0uHSdoOPi
	UueA==
Received: by 10.216.195.133 with SMTP id p5mr14260477wen.1.1350590065916;
	Thu, 18 Oct 2012 12:54:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm31188824wiv.11.2012.10.18.12.54.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 12:54:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2012 21:54:28 +0200
Message-Id: <cover.1350589969.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-oe][PATCH 0/5] Small changes #101
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
X-List-Received-Date: Thu, 18 Oct 2012 20:07:45 -0000

The following changes since commit 4cd60deb11a8a6f9134d7f6ec39255a35d921426:

  hiawatha: add initial 8.5 recipe and associated files (2012-10-18 15:12:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (5):
  PACKAGES_DYNAMIC: use regexp not glob
  mcnavi: remove myslq_config include path work around
  ecore: drop libxputil from DEPENDS
  libxaw: drop libxp and printproto from DEPENDS
  mcnavi: move from meta-oe to meta-efl

 meta-efl/recipes-efl/efl/ecore.inc                              | 5 +++--
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc               | 2 +-
 meta-efl/recipes-efl/efl/evas.inc                               | 2 +-
 {meta-oe => meta-efl}/recipes-navigation/mcnavi/mcnavi_0.3.3.bb | 7 +------
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb               | 2 +-
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb          | 2 +-
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb                    | 2 +-
 meta-gnome/recipes-support/goffice/goffice_0.8.17.bb            | 2 +-
 meta-initramfs/recipes-devtools/klibc/klibc-utils.inc           | 2 +-
 meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb        | 2 +-
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc                   | 2 +-
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb               | 2 +-
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb              | 4 ++--
 meta-oe/recipes-multimedia/libav/libav.inc                      | 2 +-
 meta-oe/recipes-support/freerdp/freerdp.inc                     | 2 +-
 meta-oe/recipes-support/openldap/openldap_2.4.23.bb             | 2 +-
 meta-oe/recipes-support/pidgin/pidgin.inc                       | 2 +-
 meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb       | 2 +-
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb        | 2 +-
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb                    | 2 +-
 20 files changed, 23 insertions(+), 27 deletions(-)
 rename {meta-oe => meta-efl}/recipes-navigation/mcnavi/mcnavi_0.3.3.bb (71%)

-- 
1.7.12.4




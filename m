Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 95AF16A619
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:15 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c50so3468109eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=Bj7wh+vL4CgdBjxyp4CEYDVLy9zDEIlAJR/ZIfQXLik=;
	b=dtH+iDqkftf9MnlnAjNFvIKEQsZEfA8cICR90PZ2PJhM8/PsBlsWz1KKe4+pkTlDAq
	2ACzUB4tyB2O3h8PWJRceGtZ8XgZ0NO6FIPlbjULxtPoyi7oqaOAPRCYhfYPez90KAUz
	LP/ngMUoz80OAtZnwU2KeaKPCwQnUIO7AyPLUZSkj8Raxdyqu18LCA5xVpo/b9kmDbFt
	28T3+9fEx2pE9OocDJJU1B1tdvpYI7IX205gjrUAVOggidXSoOhVihL8y6ibd8mMLb5Q
	PhQutXD+K/Vxcu9DYrqPiG1DRrV9+51KfTTQU3pd8tT/xDWwfcfgDux4V4QdPGURy599
	sXng==
X-Received: by 10.14.100.2 with SMTP id y2mr2005313eef.75.1370929035884;
	Mon, 10 Jun 2013 22:37:15 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:21 +0200
Message-Id: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 00/15] updates and fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 05:37:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Additional note: 7+8 are preparations for latest versions of (lib)gnome-keyring
which is currently broken and I am fed up of backporting. Hope to get
gnome-keyring update done soon.

The following changes since commit b57465fc8c023b798b713766ca7d093a6752186b:

  net-snmp: Backport fix for NETSNMP_NO_SYSTEMD typos (2013-06-10 11:18:38 -0400)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git updates-and-fixes

Andreas Müller (15):
      midori: update to 0.5.2
      tumbler: add curl to dependencies to make build deterministic
      tumbler: update to 0.1.29
      poppler: update to 0.22.4
      xfce4-xkb-plugin: update to 0.7.0 tarball
      atkmm: add glibmm to DEPENDS
      p11-kit: initial add 0.19.1
      gcr: initial add 3.8.2
      mozjs: initial add 17.0.0
      polkit: update to 0.111
      networkmanager: rework settings/dependencies for polkit/consolekit
      networkmanager: add group 'network' allowing members to change settings
      lxdm: remove consolekit dependencies in systemd environment and fix build
      xfce4-power-manager: rework polkit/consolekit selection and implement polkit/systemd shutdown
      xarchiver: update to 0.5.3 for various bugfixes

 .../midori/{midori_0.5.0.bb => midori_0.5.2.bb}    |    4 +-
 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb          |   20 +
 .../50-org.freedesktop.NetworkManager.rules        |    8 +
 .../networkmanager/networkmanager_0.9.8.0.bb       |   22 +-
 ...-not-include-RequiredDefines.h-for-depend.patch |   35 +
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   35 +
 ...ession-Set-error-if-we-cannot-find-a-sess.patch |   70 --
 ...ession-Actually-return-TRUE-if-a-session-.patch |   46 --
 .../polkit-0.104/obsolete_automake_macros.patch    |   23 -
 .../{polkit-0.104 => polkit}/polkit-1_pam.patch    |    0
 .../polkit/{polkit_0.104.bb => polkit_0.111.bb}    |   51 +-
 meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb          |    2 +-
 ...heck-only-for-ck-connector-in-case-consol.patch |   48 ++
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    6 +-
 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb  |   18 +
 ...sh.cc-add-cast-to-fix-build-for-enable-fi.patch |   42 --
 .../{poppler_0.22.3.bb => poppler_0.22.4.bb}       |    7 +-
 .../{xarchiver_0.5.2.bb => xarchiver_git.bb}       |   16 +-
 ...xkb-plugin_git.bb => xfce4-xkb-plugin_0.7.0.bb} |   13 +-
 .../{tumbler_0.1.27.bb => tumbler_0.1.29.bb}       |    6 +-
 ...shutdown-reboot-functionality-for-systemd.patch |  677 ++++++++++++++++++++
 .../xfce4-power-manager_1.2.0.bb                   |    9 +-
 22 files changed, 926 insertions(+), 232 deletions(-)
 rename meta-gnome/recipes-connectivity/midori/{midori_0.5.0.bb => midori_0.5.2.bb} (89%)
 create mode 100644 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/50-org.freedesktop.NetworkManager.rules
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch
 rename meta-oe/recipes-extended/polkit/{polkit-0.104 => polkit}/polkit-1_pam.patch (100%)
 rename meta-oe/recipes-extended/polkit/{polkit_0.104.bb => polkit_0.111.bb} (50%)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0002-configure-check-only-for-ck-connector-in-case-consol.patch
 create mode 100644 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch
 rename meta-oe/recipes-support/poppler/{poppler_0.22.3.bb => poppler_0.22.4.bb} (80%)
 rename meta-xfce/recipes-apps/xarchiver/{xarchiver_0.5.2.bb => xarchiver_git.bb} (60%)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_git.bb => xfce4-xkb-plugin_0.7.0.bb} (63%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.27.bb => tumbler_0.1.29.bb} (84%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-Add-shutdown-reboot-functionality-for-systemd.patch

-- 
1.7.6.5



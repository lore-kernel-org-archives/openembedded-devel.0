Return-Path: <superandy@localhost.localdomain>
Received: from localhost.localdomain (p5B0A2F3E.dip0.t-ipconnect.de
	[91.10.47.62])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD516C7AB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2013 10:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.7/8.14.7) with ESMTP id r8LAfheO013426; 
	Sat, 21 Sep 2013 12:41:43 +0200
Received: (from superandy@localhost)
	by localhost.localdomain (8.14.7/8.14.7/Submit) id r8LAffmx013425;
	Sat, 21 Sep 2013 12:41:41 +0200
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Sep 2013 12:41:31 +0200
Message-Id: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 00/10] new recipes / updates / fixes
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
X-List-Received-Date: Sat, 21 Sep 2013 10:41:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit a83a588b4d096e89909e537b765d8988b4ca64b0:

  libao: add version 1.1.0 (2013-09-19 13:56:58 +0200)

are available in the git repository at:

  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

for you to fetch changes up to 65ec21e2e59f2ffbb6c67d4da4d78cac7d73c7cf:

  packagegroup-xfce-extended: add xfce4-taskmanager and xfce4-notes-plugin (2013-09-21 12:27:18 +0200)

----------------------------------------------------------------
Andreas Müller (10):
      libxfce4ui: avoid dragging in gtk3
      xfce4-vala: update to 4.10.3
      xfce4-cpufreq-plugin: update to 1.1.0
      sound-theme-freedesktop: initial add 0.8.0
      libcanberra avoid gtk3 dragged in at gtk2 environments
      libcanberra: move libtool librarties for modules to dev package
      xfce4-settings: add PACKAGECONFIG for sound-settings
      xfce4-taskmanager: inital add git-version
      xfce4-notes-plugin: initial add 1.7.7
      packagegroup-xfce-extended: add xfce4-taskmanager and xfce4-notes-plugin

 meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb                                         |  13 ++++++
 meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch          |  92 +++++++++++++++++++++++++++++++++++++++++
 meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb                                                        |  15 ++++---
 meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch |  29 +++++++++++++
 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb                                              |  22 ++++++++++
 meta-xfce/recipes-bindings/vala/files/0001-align-vapi-dir.patch                                                |  39 -----------------
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.2.bb                                                           |  17 --------
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb                                                           |  14 +++++++
 meta-xfce/recipes-panel-plugins/cpufreq/files/port-to-libxfce4ui.patch                                         | 138 -------------------------------------------------------------
 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb                                          |  11 -----
 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb                                          |  15 +++++++
 meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch                            | 128 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-xfce/recipes-panel-plugins/notes/files/0002-main-status-icon.c-remove-deprecated-g_type_init.patch        |  32 ++++++++++++++
 meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb                                              |  20 +++++++++
 meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac.in-remove-optional-gtk3-support.patch                |  37 +++++++++++++++++
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb                                                         |   1 +
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                             |   2 +
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                                    |   8 +++-
 18 files changed, 421 insertions(+), 212 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
 create mode 100644 meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch
 create mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch
 create mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
 delete mode 100644 meta-xfce/recipes-bindings/vala/files/0001-align-vapi-dir.patch
 delete mode 100644 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.2.bb
 create mode 100644 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
 delete mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/files/port-to-libxfce4ui.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/notes/files/0002-main-status-icon.c-remove-deprecated-g_type_init.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb
 create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac.in-remove-optional-gtk3-support.patch

-- 
1.8.3.1



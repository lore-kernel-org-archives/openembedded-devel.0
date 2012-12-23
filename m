Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlQz-0004bn-5p
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:17:47 +0100
Received: by mail-ea0-f170.google.com with SMTP id d11so2512864eaa.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=INdSQyaKQH1b3TpVJ9FASjo7QjByLKLKgVF5RCOGL3w=;
	b=kj+KBUZgRh/VX80A8EZ/yySIL/rO7u8yi5c9uNrAJ9Ap49ZtUY0H84GJDsFsrwpbmg
	QOrXZMKSTO+6938gpFQ+fbEES2gCgEntnripO+ltSO5JepFcrs4BOB66dthcnEgsuSJ1
	POPn0w+yIDe8Nw4YvNf3TJWKS3ZFRq7UifEABo+DvtYTLTgSMxkQfVLnofQIr/Y8vvj4
	UPACuc1Kq3D2bnaHYQqDh1B3DZHtT3hlYfUkAEcbGsiUBPqgmyYS6pGvgkjykUmp4hYU
	YaLT0T5UXE424ZLGnGNU26fKR4tiQde/SimyYW99WHpbB8b6Y+h+bqhdEPbuPA0t3una
	lhHA==
X-Received: by 10.14.184.134 with SMTP id s6mr47712478eem.43.1356267772611;
	Sun, 23 Dec 2012 05:02:52 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.02.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:02:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:29 +0100
Message-Id: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 00/12] meta-xfce updates
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
X-List-Received-Date: Sun, 23 Dec 2012 13:17:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit a623fd942f6561a425278cf9f114d212d06e5982:

  samba: disable avahi and build without acl (2012-12-21 16:45:28 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

Andreas Müller (12):
      icon-slicer: initial add 0.3
      xcursorgen: initial add 1.0.5
      openzone: Initial add 1.2.3
      xfce4-settings: add garcon to DEPENDS
      xfce4-settings: add a 'Touchscreen pointer' option in mouse settings
      xfce4-settings: Remember the settings manager window size
      xfce4-settings: update to 4.11.0
      xfce4-session: remove gnome-keyring dependency
      xfce4-session: Add shutdown/reboot functionality for systemd
      lxdm: disable keyboard selection
      samba: add new package libwbclient to avoid libsmbclient dragging in samba
      gvfs: reenable gvfs-smb

 .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |    3 +-
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |    5 +-
 meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb        |    2 +-
 meta-oe/recipes-connectivity/samba/samba-basic.inc |    3 +-
 .../files/0001-Makefile.am-no-examples.patch       |   27 +
 .../icon-slicer/icon-slicer_0.3.bb                 |   13 +
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    3 +-
 .../xcursorgen/xcursorgen_1.0.5.bb                 |   12 +
 ...n-reboot-functionality-for-systemd-bug-87.patch |  482 ++++++++
 .../xfce4-session/xfce4-session_4.10.0.bbappend    |    8 +
 .../recipes-art/cursor-themes/openzone_1.2.3.bb    |   29 +
 .../files/0002-Remove-gnome-keyring-remains.patch  |   82 ++
 .../xfce4-session/xfce4-session_4.10.0.bb          |    6 +-
 ...the-settings-manager-window-size-bug-9384.patch |  155 +++
 .../0001-add-cursor-theme-xfce-invisible.patch     |  248 ++++
 ...ngs-dialog-add-touchscreen-pointer-option.patch | 1233 ++++++++++++++++++++
 ...sHelper-gets-a-pointer-to-XfceXSettingsHe.patch |  137 +++
 ...gsHelper-gets-a-property-touchscreen-poin.patch |  249 ++++
 ...tect-a-change-of-pointer-device-used-and-.patch |  582 +++++++++
 .../xfce4-settings/touchscreen/invisible           |  Bin 0 -> 4160 bytes
 .../xfce4-settings/xfce4-settings/touchscreen/wait |  Bin 0 -> 126096 bytes
 .../xfce4-settings/xfce4-settings_4.10.0.bb        |   16 -
 .../xfce4-settings/xfce4-settings_4.11.0.bb        |   31 +
 23 files changed, 3300 insertions(+), 26 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/icon-slicer/files/0001-Makefile.am-no-examples.patch
 create mode 100644 meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
 create mode 100644 meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb
 create mode 100644 meta-systemd/meta-xfce/recipes-xfce/xfce4-session/files/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
 create mode 100644 meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend
 create mode 100644 meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/files/0002-Remove-gnome-keyring-remains.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0003-Remember-the-settings-manager-window-size-bug-9384.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0003-XfcePointersHelper-gets-a-pointer-to-XfceXSettingsHe.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/invisible
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/wait
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb




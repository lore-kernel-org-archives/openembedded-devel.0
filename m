Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 74E7360E7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:04:30 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so1872763eei.35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=FFDwnnQAcxSRGcfxGExYIqNcSYG3VmePBFYMHNPUgFA=;
	b=prqZ0ryIYdwUVmReZwNr36QqZLCS7przGgTD8XeQ527J7Or1o2X1YvlYyKkNJJA2fZ
	R02XLlAtcqf1kMO3/xI2hWCMeota7CL04aEdiAOyZjNIfYUQcMCphXRnA7Sos3lPbqf+
	W1L378GXtUCXGglzW9b0QUVC3HdqC+wFetzmk9G8zHKVnybH0s2ZJqxDvLOH5qjrjlhs
	RJkCO0Sxd4fGlIRyco4uZ/ydLt8N0DfZD6EsJukDqkzUyOo+I67ZkTWSGves8Xd5gzdg
	hsKoFLHuF3X4r5AzbNpnQlKroTqlHFYMrO5giwzj3Ss8tDKSuT4XNV1mKndIK4+Yt/oz
	Q6nw==
X-Received: by 10.14.108.194 with SMTP id q42mr13717eeg.113.1379322271862;
	Mon, 16 Sep 2013 02:04:31 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id f49sm40119433eec.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 02:04:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:04:10 +0200
Message-Id: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 0/9] minor libcanberra cleanup / new xfce stuff
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
X-List-Received-Date: Mon, 16 Sep 2013 09:04:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[1-3] libcanberra: While working on event sounds libcanberra needed some love.
      Sounds still doesn't work properly in gtk2 environment. There will be
      follow ups.
[4-9] Updates + new datetime setter for XFCE

Andreas Müller (9):
  libcanberra: add PACKAGES_DYNAMIC so we use the splitted packages
  libcanberra: remove r0 - it is of no use
  libcanberra: handle alsa and pulsaudio by PACKAGECONFIG - defaults
    based upon DISTRO_FEATURES
  libxfce4ui: update to git head
  xfce4-settings: move to schnitzeltony's git repo to get new datetime
    setter
  xfwm4: move to git repo
  xfce4-weather-plugin: update to 0.8.3
  xfce4-equake-plugin: initial add 1.3.3
  packagegroup-xfce-extended: add xfce4-equake-plugin

 .../libcanberra/libcanberra_0.29.bb                |   12 +-
 .../equake/xfce4-equake-plugin_1.3.3.bb            |   13 +
 .../weather/files/port-to-libxfce4ui.patch         |  104 --
 .../weather/xfce4-weather-plugin_0.7.4.bb          |   23 -
 .../weather/xfce4-weather-plugin_0.8.3.bb          |   11 +
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb   |   17 +-
 .../packagegroups/packagegroup-xfce-extended.bb    |    1 +
 ...the-settings-manager-window-size-bug-9384.patch |  155 ---
 .../0001-add-cursor-theme-xfce-invisible.patch     |    8 +-
 ...ngs-dialog-add-touchscreen-pointer-option.patch | 1083 +-------------------
 ...tect-a-change-of-pointer-device-used-and-.patch |   10 +-
 ...e4-settings_4.11.0.bb => xfce4-settings_git.bb} |   23 +-
 .../xfwm4/{xfwm4_4.10.1.bb => xfwm4_git.bb}        |   17 +-
 13 files changed, 90 insertions(+), 1387 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.3.bb
 delete mode 100644 meta-xfce/recipes-panel-plugins/weather/files/port-to-libxfce4ui.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0003-Remember-the-settings-manager-window-size-bug-9384.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.11.0.bb => xfce4-settings_git.bb} (64%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.10.1.bb => xfwm4_git.bb} (70%)

-- 
1.7.6.5



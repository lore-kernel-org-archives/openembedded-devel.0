Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id C8C467852B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:00 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u40so10746273wrf.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tsN16U16mc5VjLQ4u8gN4k89C1fVMjhtVBb16DghRtE=;
	b=EKuJIbVc2h6nCGuaX9XJBD6FRwmut7ugHF2FPT1zWkU+5wLUHEv+uvAqiJAvHHAQhg
	ez1xjostLLR1wFSmPRqhElQrT58n9+dqI8y16EDYWSO1NBUg1WMO5gWUkT8lYs+Yj1DV
	XF/43MYDe3jn/1uYh039y11lSv24SEXPY48df7hTmZwxd7fktnd7uuVGGDGKQzZ7/NAm
	lmrdfhaGTg3BV3SkkQc8JvNym7qyH7mD2TMu1hFj5MWraP9PtkRefYIDQq2yCxH65kJ4
	qsruyh4ytFiInBp+CB03ztwyq35H1Bu3D9zQv9JwKRUhS4RsDkgcSsncBJ4Y3Qya4jSK
	16Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tsN16U16mc5VjLQ4u8gN4k89C1fVMjhtVBb16DghRtE=;
	b=KEihN4SyRtLc2df4wwirc/Pm4ckFzesoFbPNItlWjGJcjbMAMOrSPUooznnldhC50j
	HIwOVWWIxgzaB8NaD3mIGrvMJTsVOn4ERQk5YTTq8f+JaxWNoLs6nqOFl5YSY6TsX9mE
	sEwYSQdGveJ6m65AAcibl7PRxw5LXt0G41hKyIcoXNtLFIfwkuVOKR6f9+8cDP5gkuNA
	FV1Bmly5BMssEpWGntJUGaTSbmq2vbQv3PbsHIJ9pbPnlgOPsf/IRlHy+jbvYhGCoB4K
	wPZsmGUiLePIIXZGML/DOeESIKoTj65xMi0XhZGeXjMvWkjBYgu/+dtga90U030wAdC2
	YPrg==
X-Gm-Message-State: AJaThX7SroNBoS/Ex1EUbumRjZqhEzrjQEG2o7lfVQvZl88VQR7LO4bg
	QUxIaFu0PihhcXsY9QSN/U/2fg==
X-Google-Smtp-Source: AGs4zMZRABSBa/rc0lXv4G0n9qMCOIY4pz16RaO5sUHYNg3R64Vfh/SUVxb7kW7jL0Ui47thf1laIw==
X-Received: by 10.223.195.203 with SMTP id d11mr3181015wrg.39.1510407000943;
	Sat, 11 Nov 2017 05:30:00 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.29.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:37 +0100
Message-Id: <20171111132950.12570-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
MIME-Version: 1.0
Subject: [PATCH][v2 00/13] recipe fixes and updates
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1-> v2
* Changed my email address to avoid getting spam
* Tumbler fix reworked. Confusion was caused because effect is sporadic
* xfce4-notifyd: Update makes a simple fix possible for images with KDE
  installed in parallel. This bugged me for a very long time.

I know it is a bit late but I would be very happy if the xfce patches
would make their way into rocko. At least the last four patches are
fixing ugly issues and most of them I have in my images for a while
without issues.

The following changes since commit 5d6d21e98ed594809169d2b2f6964e90a3369a96:

  libreport: fix Nothing RPROVIDES 'lib32-python3-libreport' (2017-10-27 16:39:34 +0000)

are available in the git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to f3b40da9b93a34fa688c0951708cd96b310378f9:

  xfce4-notifyd: avoid trouble starting daemon for images with multiple desktops (2017-11-11 14:26:32 +0100)

----------------------------------------------------------------
Andreas Müller (13):
      gparted: update 0.28.1 -> 0.30.0
      libgphoto2: update 2.5.8 -> 2.5.14
      gphoto2: update 2.5.8 -> 2.5.14
      xfce4-settings: update to 4.12.1
      xfce4-pulseaudio-plugin: update 0.2.4 -> 0.3.2
      xfce4-weather-plugin: update 0.8.9 -> 0.8.10
      xfce4-xkb-plugin: update 0.8.0 -> 0.8.1
      xfce4-appfinder: update 4.12.0 -> 4.13.0
      xfdesktop: update 4.12.3 -> 4.12.4
      tumbler: ensure thumbnails work properly
      tumbler: update 0.1.31 to 0.2.0
      xfce4-notifyd: update 0.3.6 -> 0.4.0
      xfce4-notifyd: avoid trouble starting daemon for images with multiple desktops

 meta-gnome/recipes-extended/gparted/{gparted_0.28.1.bb => gparted_0.30.0.bb}                                      |   4 +-
 meta-oe/recipes-graphics/gphoto2/{gphoto2-2.5.8 => gphoto2}/0001-configure.ac-remove-AM_PO_SUBDIRS.patch          |   0
 .../recipes-graphics/gphoto2/{gphoto2-2.5.8 => gphoto2}/0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch   |   0
 meta-oe/recipes-graphics/gphoto2/{gphoto2_2.5.8.bb => gphoto2_2.5.14.bb}                                          |   4 +-
 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0001-scripts-remove-bashisms.patch                              | 149 ----------------------------------------------------------
 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0002-correct-jpeg-memsrcdest-support.patch                      |  54 ---------------------
 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/avoid_using_sprintf.patch                                       | 133 ---------------------------------------------------
 meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/0001-configure.ac-remove-AM_PO_SUBDIRS.patch    |   0
 meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/10-camera-libgphoto2-device.fdi                 |   0
 meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/10-camera-libgphoto2.fdi                        |   0
 meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/40-libgphoto2.rules                             |   0
 meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.8.bb => libgphoto2_2.5.14.bb}                                    |   8 ++--
 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch        | 105 +++++++++++++++++++++++++++++++++++++++++
 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.6.bb                                                       |  23 ---------
 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb                                                       |  36 ++++++++++++++
 meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.2.4.bb => xfce4-pulseaudio-plugin_0.3.2.bb} |   4 +-
 meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.9.bb => xfce4-weather-plugin_0.8.10.bb}         |   4 +-
 meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.0.bb => xfce4-xkb-plugin_0.8.1.bb}                      |   4 +-
 meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.31.bb => tumbler_0.2.0.bb}                                            |  10 +++-
 meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.12.0.bb => xfce4-appfinder_4.13.0.bb}                   |   6 +--
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                                       |   6 +--
 meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.3.bb => xfdesktop_4.12.4.bb}                                     |   4 +-
 22 files changed, 170 insertions(+), 384 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.28.1.bb => gparted_0.30.0.bb} (90%)
 rename meta-oe/recipes-graphics/gphoto2/{gphoto2-2.5.8 => gphoto2}/0001-configure.ac-remove-AM_PO_SUBDIRS.patch (100%)
 rename meta-oe/recipes-graphics/gphoto2/{gphoto2-2.5.8 => gphoto2}/0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch (100%)
 rename meta-oe/recipes-graphics/gphoto2/{gphoto2_2.5.8.bb => gphoto2_2.5.14.bb} (79%)
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0001-scripts-remove-bashisms.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0002-correct-jpeg-memsrcdest-support.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/avoid_using_sprintf.patch
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/0001-configure.ac-remove-AM_PO_SUBDIRS.patch (100%)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/10-camera-libgphoto2-device.fdi (100%)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/10-camera-libgphoto2.fdi (100%)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/40-libgphoto2.rules (100%)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.8.bb => libgphoto2_2.5.14.bb} (85%)
 create mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/files/0001-Add-a-configure-option-to-start-daemon-by-autostart-.patch
 delete mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.6.bb
 create mode 100644 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.0.bb
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.2.4.bb => xfce4-pulseaudio-plugin_0.3.2.bb} (73%)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.9.bb => xfce4-weather-plugin_0.8.10.bb} (72%)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.0.bb => xfce4-xkb-plugin_0.8.1.bb} (75%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.31.bb => tumbler_0.2.0.bb} (74%)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.12.0.bb => xfce4-appfinder_4.13.0.bb} (54%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.3.bb => xfdesktop_4.12.4.bb} (77%)

-- 
2.9.5



Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4D64E60685
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:31:47 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id b9so10293678wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yPanGko7OPokorebcf9EDTm6bEXeju11rEhyamKuVuI=;
	b=dyx+EdgzwpWizw3twmReycId/uf1xRqjj9jL2S+L+D7L8krbrgOJ8qXG6+WASSXb6q
	hVm9abKTg3xFBliiGJUNeD29t0rzCdqFA+XiKtJI/V3YVl7cV3gJIE6hkC+eCJA2AzWj
	90X71E1n8JA3ekaho0oyN0WKFO5E71sxB46vtdLVrEexLb4opXkDxANNaDkwXQ7w8Sbe
	IpHHhuuIZzQFYkjm6S8IvfQNhZmUmt3CceuCxgZzq34aEo17Asr8Y961qAg1kFVjzJ0P
	UHoO4mQP6cCgJN+2nrN6S1F1QXTMIPS7QA0yyxJBfXnKPeWwNpdTEJsJu3KFyG0Q9s5t
	QBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yPanGko7OPokorebcf9EDTm6bEXeju11rEhyamKuVuI=;
	b=bApVCpnyA9Safk2WxQHZyPFj5kzEz1U2+c7ExK5zVrP3qie4D28V2mK5ak01msoNSL
	G807sDH19xH57DjnsDviyoO5CCQZs5/VoqV3QvOt5HJxHyXAPW5ST0XU+VLWogqIrWyL
	P1RXPw/pLk6jhNbbZEzUutjb+50kmFCEKx2A0NF3bld9904SJdk/xS4tbnvbvwW2oXUw
	7yyjSPnq66HPzfu+pjWSFXVuGk3rajkHscF2YOUauehQa+aMBe34FKeMTchnyKipk2wX
	Cx4L0igo6HiuObb6/jHS3RYFhIxe3OrRhVu9esN8U0QYbAKo4gwDxKYS07jR28ubqlUh
	PFJw==
X-Gm-Message-State: AMCzsaU5hFTnRnL5AU0kdLA1ddH3N97FGkzk7mbRNeKPX0M90uE8eLvY
	SQQPBUUcz0gT9NGkcK6QsJHgEQ==
X-Google-Smtp-Source: ABhQp+SecGVdlPdjE6s2oE8t4sd/ATAPM4Ai6yEY/h4vxOFfRFTwpF2K7W0R2p8UDoppYJnCQLXngQ==
X-Received: by 10.28.100.212 with SMTP id y203mr1273293wmb.64.1509618708228;
	Thu, 02 Nov 2017 03:31:48 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	g68sm340440wmc.22.2017.11.02.03.31.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 03:31:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:31:19 +0100
Message-Id: <20171102103129.3703-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
MIME-Version: 1.0
Subject: [PATCH 00/10] Recipe updates
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
X-List-Received-Date: Thu, 02 Nov 2017 10:31:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the xfce part I played around with further updates for libxfce4ui /
libxfce4util / xfce4-panel but XFCE has started to use (and require)
gobject-introspection (sigh) so these updates need further activities.

The following changes since commit 5d6d21e98ed594809169d2b2f6964e90a3369a96:

  libreport: fix Nothing RPROVIDES 'lib32-python3-libreport' (2017-10-27 16:39:34 +0000)

are available in the git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to 880125ddf4686aa1d52061fe04a07353ad04b228:

  gparted: update 0.28.1 -> 0.30.0 (2017-11-02 11:14:54 +0100)

----------------------------------------------------------------
Andreas Müller (10):
      tumbler: make thumbnails work again
      xfce4-settings: update to 4.12.1
      libgphoto2: update 2.5.8 -> 2.5.14
      gphoto2: update 2.5.8 -> 2.5.14
      xfce4-notifyd: update 0.3.6 -> 0.4.0
      xfce4-pulseaudio-plugin: update 0.2.4 -> 0.3.2
      xfce4-weather-plugin: update 0.8.9 -> 0.8.10
      xfce4-xkb-plugin: update 0.8.0 -> 0.8.1
      xfce4-appfinder: update 4.12.0 -> 4.13.0
      gparted: update 0.28.1 -> 0.30.0

 meta-gnome/recipes-extended/gparted/{gparted_0.28.1.bb => gparted_0.30.0.bb}                                        |   4 ++--
 meta-oe/recipes-graphics/gphoto2/{gphoto2-2.5.8 => gphoto2}/0001-configure.ac-remove-AM_PO_SUBDIRS.patch            |   0
 meta-oe/recipes-graphics/gphoto2/{gphoto2-2.5.8 => gphoto2}/0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch |   0
 meta-oe/recipes-graphics/gphoto2/{gphoto2_2.5.8.bb => gphoto2_2.5.14.bb}                                            |   4 ++--
 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0001-scripts-remove-bashisms.patch                                | 149 ----------------------------------------------------------------------------------------------------------------------------------------------------
 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0002-correct-jpeg-memsrcdest-support.patch                        |  54 ------------------------------------------------------
 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/avoid_using_sprintf.patch                                         | 133 ------------------------------------------------------------------------------------------------------------------------------------
 meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/0001-configure.ac-remove-AM_PO_SUBDIRS.patch      |   0
 meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/10-camera-libgphoto2-device.fdi                   |   0
 meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/10-camera-libgphoto2.fdi                          |   0
 meta-oe/recipes-graphics/gphoto2/{libgphoto2-2.5.8 => libgphoto2}/40-libgphoto2.rules                               |   0
 meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.8.bb => libgphoto2_2.5.14.bb}                                      |   8 +++-----
 meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.3.6.bb => xfce4-notifyd_0.4.0.bb}                             |  16 ++++++++++++----
 meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.2.4.bb => xfce4-pulseaudio-plugin_0.3.2.bb}   |   4 ++--
 meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.9.bb => xfce4-weather-plugin_0.8.10.bb}           |   4 ++--
 meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.0.bb => xfce4-xkb-plugin_0.8.1.bb}                        |   4 ++--
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb                                                                    |   4 ++++
 meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.12.0.bb => xfce4-appfinder_4.13.0.bb}                     |   6 +++---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                                         |   6 +++---
 19 files changed, 35 insertions(+), 361 deletions(-)
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
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.3.6.bb => xfce4-notifyd_0.4.0.bb} (58%)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.2.4.bb => xfce4-pulseaudio-plugin_0.3.2.bb} (73%)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.9.bb => xfce4-weather-plugin_0.8.10.bb} (72%)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.0.bb => xfce4-xkb-plugin_0.8.1.bb} (75%)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.12.0.bb => xfce4-appfinder_4.13.0.bb} (54%)

-- 
2.9.5



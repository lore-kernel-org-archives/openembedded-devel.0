Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5A46261B3B
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:38 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id t14so2033433plr.8
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=mqcFSqFA3qSARHj8sSBFc5/GSwAtg/OqvXm3lGYo9C8=;
	b=Gz1XiE24BwHdKKPdCAxHccmDaP8KOW37RGj/QK/bw1O10T71YszgbOogH1WdT5YWS4
	xHTkDTjf6MOPrxrIEcsxmmMX5dWUwyRQjOSTH7y7OcbAmCzIDf89XHBmW4VtHxRWgU5N
	jYx4oPBYAYlkzVkKqyifJA97VHWjX46Gr8E5l3aN1LVCyZjUWhG5Y+lUy16EnTkAhSMu
	18ngRhj/wIi91vZ1Go5KgNXu8OsMWX/b+faFXO73ZoA9h9Y7Jdg71noT3eX3BI9Nko5V
	tBdbgc8PHoyGtANZ2bBeZy1VwplCG7s+05/m/JtQpQ/K4Z9uwFjZHdREJUsa6mbjWslQ
	6Lag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mqcFSqFA3qSARHj8sSBFc5/GSwAtg/OqvXm3lGYo9C8=;
	b=l3N8QNI3q+gwISl1NPGq3bqBBeWOpumTHskZTmGNQ8CVcMHeJ4EwisO584O761m+Uu
	H4iXtXlWL6196AejY+Q294YWjUh6qkBn6vezT7CDXpu1AE3/4rPtRRwdU+zRN6mTBqeQ
	T2Z5Dqzt2NE96GW9Xzy3T6lohVOgWRJVxCL+hZiCEQV67wx12LMkUAM6/rxExSM9dvPW
	YBDHk5BlNR+iyyQowU3Bc8hN2G2CwZiSXIhlBtu8njiPPYg+I2kKFRSjVfo6q8wtMSzG
	NHrENxtWMgRuJGpQEp3tEropT/y+03qh4JJSZES5QQu5FWU49cVRf4pUKyd4JQVvZ77k
	ETuA==
X-Gm-Message-State: ANhLgQ1B9bArj26b3oOmRKKiOYECn2T45PjrTx9fGpueDN1ySPGsD5/W
	ibKSiGHZzEdgVBAPpdQZm8cTZiNk
X-Google-Smtp-Source: ADFU+vtxvYho+IfUllBgN7ye+FYD0W+7RV+/fccyb2qfIj4maYdfaFdmzpoytJfmEE020JfFT67mIQ==
X-Received: by 2002:a17:90b:2390:: with SMTP id
	mr16mr1827123pjb.149.1583981858736; 
	Wed, 11 Mar 2020 19:57:38 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.37
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:19 -0700
Message-Id: <cover.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [zeus 00/13] Patch review
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:38 -0000

Here is the next set for meta-openembedded.
Please have reviews back by Friday.

The following changes since commit bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c:

  fluentbit: Fix packaging in multilib env (2020-01-30 18:38:10 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut

Adrian Bunk (1):
  wireshark: Upgrade 3.0.6 -> 3.0.8

Carlos Rafael Giani (1):
  opencv: Enable pkg-config .pc file generation

Khem Raj (2):
  ade: Fix install paths in multilib builds
  sanlock: Replace cp -a with cp -R --no-dereference

Martin Jansa (1):
  s3c24xx-gpio, s3c64xx-gpio, sjf2410-linux-native, usbpath, wmiconfig:
    use git fetcher instead of svn fetcher

Mike Krupicka (1):
  mosquitto: Use mosquitto.init for daemon init

Paul Barker (1):
  lmsensors: Fix sensord dependencies

Peter Kjellerstedt (2):
  lvm2, libdevmapper: Do not patch configure
  libldb: Do not require the "pam" distro feature to be enabled

Ross Burton (4):
  opencv: don't download during configure
  opencv: also download face alignment data in do_fetch()
  opencv: PACKAGECONFIG for G-API, use system ADE
  opencv: abort configure if we need to download

 .../mosquitto/files/mosquitto.init            |  2 +-
 .../recipes-support/libldb/libldb_1.5.6.bb    |  3 +-
 ...{wireshark_3.0.6.bb => wireshark_3.0.8.bb} |  4 +-
 .../recipes-bsp/lm_sensors/lmsensors_3.5.0.bb |  3 +-
 ...cp-a-with-cp-R-no-dereference-preser.patch | 51 +++++++++++++++++++
 .../recipes-extended/sanlock/sanlock_3.8.0.bb |  4 +-
 ...gure-Fix-setting-of-CLDFLAGS-default.patch | 34 +------------
 ...tallDirs-for-detecting-install-paths.patch | 39 ++++++++++++++
 meta-oe/recipes-support/opencv/ade_0.1.1f.bb  |  1 +
 .../opencv/opencv/download.patch              | 32 ++++++++++++
 .../recipes-support/opencv/opencv_4.1.0.bb    | 32 ++++++++++--
 ...3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb} |  7 ++-
 ...3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb} |  6 +--
 ...ive_svn.bb => sjf2410-linux-native_git.bb} | 11 ++--
 .../{usbpath_svn.bb => usbpath_git.bb}        | 10 ++--
 .../{wmiconfig_svn.bb => wmiconfig_git.bb}    | 13 +++--
 16 files changed, 183 insertions(+), 69 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb => wireshark_3.0.8.bb} (95%)
 create mode 100644 meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch
 create mode 100644 meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/download.patch
 rename meta-oe/recipes-support/samsung-soc-utils/{s3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb} (73%)
 rename meta-oe/recipes-support/samsung-soc-utils/{s3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb} (74%)
 rename meta-oe/recipes-support/samsung-soc-utils/{sjf2410-linux-native_svn.bb => sjf2410-linux-native_git.bb} (72%)
 rename meta-oe/recipes-support/usbpath/{usbpath_svn.bb => usbpath_git.bb} (68%)
 rename meta-oe/recipes-support/wmiconfig/{wmiconfig_svn.bb => wmiconfig_git.bb} (58%)

-- 
2.17.1



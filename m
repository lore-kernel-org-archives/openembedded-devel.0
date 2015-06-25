Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 11E1A601E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 07:35:42 +0000 (UTC)
Received: by wgck11 with SMTP id k11so54975122wgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 00:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=SA2nEPkq/MMZ/pknTwg38cjSuSEydQOnF4bF7/jftak=;
	b=mkUQQcmMgTyt2gRdQAkzNsCyi2igXlR/Sl4zgmBBrjCf/ze+Iv4H2YrG3Pyo/azg4Y
	n7sOKJv+LrbW1FzR5vmi+v4WkuwxV+9Wk/0HFJsp/NTt/HdNE0kda/45fn9h7Y1OVvCB
	wjsgMPKJofHbSSaXlMwxPKjvIHMPAhSWuHFvU4bUxkbG0Ys4Hvb07W9OOkcHFk8c4m8+
	+zeEgaEr9JYoogW15gPFEQxWACKn4Vqnio4hx8Ccerocoqs7p6HRqaqIZoUSadczG+GT
	ogpqtIsUmhNB+7txFwr/nPKwR6iAhP9QZXIAzsupBSFTzMSF30935QV3qCt2zOzfs4X9
	9q4g==
X-Received: by 10.180.88.201 with SMTP id bi9mr3148353wib.58.1435217743261;
	Thu, 25 Jun 2015 00:35:43 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id wx9sm44250156wjb.6.2015.06.25.00.35.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 00:35:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 09:35:11 +0200
Message-Id: <1435217714-20564-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 0/3] networkmanager update
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
X-List-Received-Date: Thu, 25 Jun 2015 07:35:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A similar patch patch was sent but I like this more:

* it loads libndp from release tarball
* networkmanager is not disabled by default / add more packageconfig / cleanup at_console support quirks
* network-manager-applet is updated

I have these patches under test for some time and tested successfully:

* wired DHCP/staticIP
* wireless
* wireless AP

Andreas Müller (3):
  libndp: initial add 1.5
  networkmanager: update to 1.0.2
  network-manager-applet: update to 1.0.2

 ...ort-for-AP-mode-setting-for-wifi-sharing.patch} |  0
 ...ses-and-properties-which-are-not-supporte.patch | 41 ----------------------
 ...or-network-sharing-if-device-supports-it.patch} |  2 +-
 ...0.9.8.10.bb => network-manager-applet_1.0.2.bb} | 16 +++------
 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb  | 10 ++++++
 ...c-Check-only-for-libsystemd-not-libsystem.patch | 30 ----------------
 ...manager_0.9.8.10.bb => networkmanager_1.0.2.bb} | 41 +++++-----------------
 7 files changed, 24 insertions(+), 116 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/files/{0002-Add-support-for-AP-mode-setting-for-wifi-sharing.patch => 0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch} (100%)
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
 rename meta-gnome/recipes-connectivity/network-manager-applet/files/{0003-Use-AP-mode-for-network-sharing-if-device-supports-it.patch => 0002-Use-AP-mode-for-network-sharing-if-device-supports-it.patch} (97%)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_0.9.8.10.bb => network-manager-applet_1.0.2.bb} (67%)
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8.10.bb => networkmanager_1.0.2.bb} (59%)

-- 
1.9.3



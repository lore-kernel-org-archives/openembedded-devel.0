Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id CC0C3605BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 15:17:20 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r10so21168440wrs.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 07:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M9aDQWYxGIoB1gktaXO+hKip16fMuckTEynDUI7lj3Y=;
	b=QUgmuORooat2nXTsUoldXrzTaoC/jhDIP5uD6XhMfq2r3sfJuGUImrn1agFt/TB3bN
	aa4egZcP13KzhYGvcWUaX4Iz0ex1qwMWFT0XX6qTAkj8ou+Fqe5uRanbozO15ZdU6PDF
	eVE6fNnk9y0/jwvG6Ct/UIZm0vQxmuTvAk5gxIEQxEJXjqQDlEjRCntY3qLNcgxXhCJN
	isGf7cBrqSXQj+ezn8U3+Of7vIrLNVd41lasvwWtZDf6Vefe3sgDYcteWiJsEoTJ9WKE
	4tgXGwEvMIXb2keuQgt8FqF5lEvEZpeXcirO2Fo25v/Nc52/eu6c4hMo6k2KGVeH5eo0
	sALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M9aDQWYxGIoB1gktaXO+hKip16fMuckTEynDUI7lj3Y=;
	b=JfEzImkF4ngbWxW/HPPXtiI/XyZACH0jb0ZCSWqhSFFgNe4Se7Cumy54Z79+CuBUgj
	VKWh1CnHi8SvqhIjg0qtWgTVk2b4hkFus0zkxw6vtt2OP5Xfo+e02Z4JusFhChXj0mn6
	Kc+o8eZDWS+q60jkzr6I9xQ0csbFYdzR0Zq72nvXBbgB1OZh8d6vscjsaHY64NZXM9pw
	cFy76UYrKlQvxwy4deEnMcfRueVfE1InqJmnhArzF1x5lCC3mePm+jFMKy1hjkYvHe7h
	YW6YPmDu8JZ0ZDtT+plomNJjyDZMtPbiY4KsEUNGCEqDMKnU5W9jSdJsJ2F9l9NFMuYV
	hwKA==
X-Gm-Message-State: AJcUukc7rY9DS+7/6jokiGB89oN2k8gQRuYN3rz6uHPjkPpP/ebGcmxh
	hlaQnzzfcbD7zK1WKJXxH1eILEK7
X-Google-Smtp-Source: ALg8bN7RhZrjF66VB5j2oWGO0nZw3S+8hi3iup4qcB+U4kTT2P8JfoM4dydQ2DnSxadl6mpuzHLAjg==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr24556355wrr.74.1546010241066; 
	Fri, 28 Dec 2018 07:17:21 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC09E931E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:9e93:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v1sm39228834wrw.90.2018.12.28.07.17.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Dec 2018 07:17:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Dec 2018 16:17:09 +0100
Message-Id: <20181228151713.19266-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [thud][PATCH 0/4] Fixes
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
X-List-Received-Date: Fri, 28 Dec 2018 15:17:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch 2 is an update but necessary to build gvfs with libmtp in PACKAGECONFIG

Andreas Müller (4):
  libxklavier: Fix keyboard layout bug for xfce4-settings
  libmtp: upgrade 1.1.5 -> 1.1.16 and rework
  networkmanager: move udev-rules from /usr/lib -> /lib
  openjpeg: fix build for multilib

 ...xkb.c-Fix-keyboard-layout-settings-f.patch |  39 +
 .../fix-do_installe-failure.patch             |   0
 .../libxklavier/libxklavier_5.4.bb            |   1 +
 .../networkmanager/networkmanager_1.14.4.bb   |   3 +-
 .../libmtp/libmtp-1.1.5/69-libmtp.rules       | 999 ------------------
 .../libmtp/libmtp-1.1.5/glibc-2.20.patch      |  36 -
 .../libmtp/0001-Use-native-mtp-hotplug.patch  |  43 +
 .../libmtp/libmtp_1.1.16.bb                   |  50 +
 .../libmtp/libmtp_1.1.5.bb                    |  58 -
 .../openjpeg/openjpeg_2.3.0.bb                |   3 +
 10 files changed, 138 insertions(+), 1094 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libxklavier/libxklavier/0001-xklavier_config_xkb.c-Fix-keyboard-layout-settings-f.patch
 rename meta-gnome/recipes-gnome/libxklavier/{files => libxklavier}/fix-do_installe-failure.patch (100%)
 delete mode 100644 meta-oe/recipes-connectivity/libmtp/libmtp-1.1.5/69-libmtp.rules
 delete mode 100644 meta-oe/recipes-connectivity/libmtp/libmtp-1.1.5/glibc-2.20.patch
 create mode 100644 meta-oe/recipes-connectivity/libmtp/libmtp/0001-Use-native-mtp-hotplug.patch
 create mode 100644 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb
 delete mode 100644 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb

-- 
2.20.1



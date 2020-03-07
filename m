Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB406021F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2020 15:20:28 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id a132so5542991wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Mar 2020 07:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HimC/hOdopdCAoQN9w+lSfKhz1gSFH23Qiwzcn/OO8w=;
	b=JNRhAWYpGXPsoWyFEtaAAA1nZDjXSXLm1Uqz5UO/UJ/MV9VNQJs8FsV1Bxg/yOid/2
	8kL9DRSGZ5t8oi4X4sa051vh1RkNHVG0pngiLqucInnyDCgvEPYjzVT2OXE3SiPu2mMV
	qje/8OfsoMUAIiSMg28OF50P1Vx2p5KcvUhliJZGLaKFc3ON9V1XO07zPugxHkNMKAoL
	7my8abtqh/SfSBwcaEqTw8vcv4/vVYq0L12sgM7x6rISc/WXHI+17WuyxJlA7flClh3N
	oXNqaHb+GmdGy/ZEahxXDU6euJXhl9R5Qmxz9GRMHdHQ9emmffsh6i+4AYEhuXY+kMQR
	pn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HimC/hOdopdCAoQN9w+lSfKhz1gSFH23Qiwzcn/OO8w=;
	b=CLEMkcRyyKcFs8823lWvc6KyXajodVVsG9B8RO20JWZ7ZT0ZcwA3BlQ9cKmQcadvUs
	8URpNgRBAKvBwf4O+KprFEK/0honOC3oGeTQkumg/xFgqyEw94MLL35YK0HUN3+0E0xC
	GuN3HyJoflIJdi6jKRsDYzRw31/XF8Er/teOppao5v+vCyZTN526Zp3Vgj7yyyvpd7PH
	gtLJkgahu5/W6jhwNqCxXsqPaMR0LYEB830I2sgdE7x35LeYZPqThpQqitwHbnn+5HjW
	nkT1/bQ15roKTT63erFRE5GoYpf/PisfBdohIqD6+/r0t40fwAkn2wfUfrt1N8u/P8TR
	pV6g==
X-Gm-Message-State: ANhLgQ3w4GLnXkoYJXGcV/1BHPOZqcq1y5izbBEyrdNIVYUchhjl8dnq
	nl6OIVZgWEskKCyBRMLyf2SAza9B/USs9Q==
X-Google-Smtp-Source: ADFU+vsV4X38osE6j1Sl+1ZxxG1U/35AMPgg+v8nJGkEwm6XTiJKjuCDUCf6G2Rcz1DE2cAgW2tOHg==
X-Received: by 2002:a1c:456:: with SMTP id 83mr10256135wme.54.1583594429379;
	Sat, 07 Mar 2020 07:20:29 -0800 (PST)
Received: from md2pfrec.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch.
	[82.192.240.69]) by smtp.gmail.com with ESMTPSA id
	z13sm22823165wrw.88.2020.03.07.07.20.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 07:20:28 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Mar 2020 16:20:10 +0100
Message-Id: <20200307152011.3104080-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH v3 0/1] networkmanager: Upgrade 1.18.4 -> 1.22.8
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
X-List-Received-Date: Sat, 07 Mar 2020 15:20:29 -0000
Content-Transfer-Encoding: 8bit

v3 adds two small patches. NetworkManager compiles now also with poky-tiny.
Thank you for the hint.

Adrian Freihofer (1):
  networkmanager: Upgrade 1.18.4 -> 1.22.8

 ...e.ac-Fix-pkgconfig-sysroot-locations.patch |  6 +-
 ...ttings-settings-property-documentati.patch | 23 ++++---
 ...Fix-build-with-musl-systemd-specific.patch | 26 ++++----
 .../musl/0002-Fix-build-with-musl.patch       | 30 +++++----
 ...0003-Fix-build-with-musl-for-n-dhcp4.patch | 61 +++++++++++++++++++
 ...Fix-build-with-musl-systemd-specific.patch | 26 ++++++++
 ...ger_1.18.4.bb => networkmanager_1.22.8.bb} | 44 ++++++++-----
 7 files changed, 159 insertions(+), 57 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-for-n-dhcp4.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-Fix-build-with-musl-systemd-specific.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.4.bb => networkmanager_1.22.8.bb} (76%)

-- 
2.24.1



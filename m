Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id C2CC971984
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 14:57:27 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m1so4913785pgq.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eVCFZPppNrIgqTWrIzCsZuQPcUkQjS5DzueVvfSwqVQ=;
	b=OoyXUyHQ397Wvjo2j0X5fLmDJ8UYm3HSaPTFpMkQB6hXjb+PPugJx5c6esm7qSmT1r
	DS50c18nvtgEyVhj9YJqkuzU6CevL3VSE0W581ssTJlfO7PcgXyp8sdGHrxJI++MyoI/
	frLPqiRRRO/X3ZzeslZOJuHEBCVx2YHoXt99kMCqBlD0CT7I5toqyCeHzy7LUsy1RdaE
	ncdie2FWJVY2fkduVHcb7h8KDwL5956+2y2Vhh+8X/DnhQqDQZ+JDkkY2DCURnbEorfy
	YpfHZeCNdzmEXEs+hISk2TmxAoZAOYKBJFpCMHSJap2mlnESwBMDiVKdnckjiuoCvu/V
	kOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eVCFZPppNrIgqTWrIzCsZuQPcUkQjS5DzueVvfSwqVQ=;
	b=F21l/eftl54HjhcwxLxnguHtXcb6sgO6iTc/BTCZBDRXhfr3wkrSNx+n3XLNn1dA/J
	s2sh3vIN+RvKfetyDAG+eQIvr9UZ6OQzPU5Y7gSekae/cOBTbi+9fijBck3dNOOoZ+5z
	9VAfRUco3QKWTyE6Dniw9dmPzhh5DN30M0GgxoqfshmHRgwZix6d7orZVR2BUJ7l74Od
	TTrIU4N60J4f5CGc1wli/BJBh1SL7XagR3UOxZ1LmwlPPT9FZ91Y9q7WvMd2Rt5Y5T2f
	piyWtVzZRDouRq6V7VDQ8Fl+P172xsV+QHBSaOI0RnqHPk/FJvfDIgPXrF+Dei+L/11A
	bKBQ==
X-Gm-Message-State: AHQUAuaS88da7fK+hGnq7Sbgb3XoJPAMB84I92RiW722gJncgZeeHaor
	a7/YsZHYlWOWceZ1Wd+YYWsNd/md
X-Google-Smtp-Source: AHgI3IaHySJt8ot0sSxi3MrykUkrgG22WpBANKioutrnSBVKNuZkhFhl+mXPpewbwnv6Y9cpFIndpw==
X-Received: by 2002:a63:e950:: with SMTP id q16mr5787085pgj.138.1550242648084; 
	Fri, 15 Feb 2019 06:57:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	g128sm7011823pfb.121.2019.02.15.06.57.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 06:57:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Feb 2019 06:57:20 -0800
Message-Id: <20190215145720.34247-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lcdproc: Disable serialVFD driver on arm/aarch64
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
X-List-Received-Date: Fri, 15 Feb 2019 14:57:28 -0000
Content-Transfer-Encoding: 8bit

This driver uses inb/outb instructions which seems to have trouble on
arm/aarch64 compiler

server/drivers/serialVFD_io.c
:45:
| ../../../git/server/drivers/port.h:344:32: error: invalid output constraint '=a' in asm
|
|         __asm__ volatile ("inb %1,%0":"=a" (value)
|                                       ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/lcdproc/lcdproc_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
index 93a09f28a0..1354997891 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
@@ -19,9 +19,10 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d
 
-COMPATIBLE_HOST_arm_libc-musl = "null"
-
 LCD_DRIVERS ?= "all,!irman,!svga"
+LCD_DRIVERS_append_aarch64 = ",!serialVFD"
+LCD_DRIVERS_append_arm = ",!serialVFD"
+
 LCD_DEFAULT_DRIVER ?= "curses"
 
 PACKAGECONFIG ??= "usb"
-- 
2.20.1



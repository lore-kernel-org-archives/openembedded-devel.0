Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 44EBE6C806
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:39:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id k198so12416153wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WDS7pb/5vQzOS5ZswiC8sSSYPWeK0f5ZcNi/mv/pGLc=;
	b=aINub0lOghOh3kTN+orNEIj2cBf0f+F2IE5+WQAnJe6fZpme5E2cIMQjLEG+PUoyov
	bg1+5YXuKGPY5/V4RwebCIjOtoHVe5q1XH626ZUsCOfz9nKNIM+zdWtLlT9Fx3xye4Kj
	xwQQxq1xp3N0Gpf+4HXPsA04/bqP1x1H/EU+KJt8zUBI1VeilGkWsbf1euE8W+q8S/Um
	p6FsGa0VjB5GWFd0BMQzYqDEY1aviMmVeZk9t9HtAA3aQrDZcDfneD4t5ZOTz6XXRG6M
	b1aSgVI0m5UVtfBn9pTYZABTPid03ZLVtkcQ/5+v4NOvg3FqPfhQdbdv5A7A3Mqau0D8
	xaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WDS7pb/5vQzOS5ZswiC8sSSYPWeK0f5ZcNi/mv/pGLc=;
	b=NbX6f6UgBTjfDY3sndCpVLr0DZdqpXnP/lCnoaQc5z3z/PuFBFqHzn+2Y+3rs2S8S7
	v7UpX/cn23daV/0NVUWYkd/JzwhX2duLrwHIlVJgQSOjWsaCrC1LPGYRm3WS0HiJJs4X
	/1pMzGXxE3HW+ufIEIoQBlSV+JyVlNT+h/OzKJ+SbsRN686xbL8yPF5/p2VNxjonJo6m
	sTpjj5BUGT7nAlWWSj2AmLOC1gew64UVaKppcfRUmuyGCKrVW7x9Z4qf163nksZdeOXc
	dAAQY47a8DJF+R0JEy/zhbPot88cfWpWcYfDdLm3Oy24Ev1oyS+PhF4usXZdc5A8TeXL
	JJyw==
X-Gm-Message-State: AGRZ1gIcy04PV2iCn3c4+sST/GNM3gU3u75ui5JyjQUsDBlfs7ZFo9OZ
	b4UzVr2n9YUfQKHJI2Hb1ihYxJ76dvs=
X-Google-Smtp-Source: AFSGD/VmWeOZtzqzU//Wqf8LQM9WF90dRTjdLQ2tRDLjbYfAXWHciVKvHSRFfDceGUil5L8AqUN1qg==
X-Received: by 2002:a1c:7004:: with SMTP id
	l4-v6mr13268548wmc.93.1542987591619; 
	Fri, 23 Nov 2018 07:39:51 -0800 (PST)
Received: from debian-brgl.home (lfbn-mar-1-609-89.w90-118.abo.wanadoo.fr.
	[90.118.185.89]) by smtp.gmail.com with ESMTPSA id
	u10sm9983953wrr.33.2018.11.23.07.39.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 07:39:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Nov 2018 16:39:39 +0100
Message-Id: <20181123153941.10186-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123153941.10186-1-brgl@bgdev.pl>
References: <20181123153941.10186-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/6] libsigrok: new package
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
X-List-Received-Date: Fri, 23 Nov 2018 15:39:51 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../sigrok/libsigrok_0.5.1.bb                 | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb

diff --git a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
new file mode 100644
index 000000000..b60c64c3b
--- /dev/null
+++ b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "libsigrok is a shared library written in C, which provides the basic hardware access drivers for logic analyzers and other supported devices, as well as input/output file format support."
+HOMEPAGE = "http://sigrok.org/wiki/Main_Page"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "glib-2.0 libzip"
+
+PACKAGECONFIG[serialport] = "--with-libserialport,--without-libserialport,libserialport"
+PACKAGECONFIG[ftdi] = "--with-libftdi,--without-libftdi,libftdi"
+PACKAGECONFIG[usb] = "--with-libusb,--without-libusb,libusb"
+PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx,glibmm doxygen-native"
+
+PACKAGECONFIG ??= "serialport ftdi usb"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://sigrok.org/download/source/libsigrok/libsigrok-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "a3de9e52a660e51d27a6aca025d204a7"
+SRC_URI[sha256sum] = "e40fde7af98d29e922e9d3cbe0a6c0569889153fc31e47b8b1afe4d846292b9c"
+
+FILES_${PN} += "/usr/share/*"
-- 
2.19.1



Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8117B6C5D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:35:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c126so17128276wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 23:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yzuNp3mOCJGjeCpJ6EkcNuyZJOcEQiixhCdbmY0Z2lU=;
	b=y1ZSlYvNXSaWNPd52mmpX7hsHTuu2ivoYiaIZg5VS4QhkQSoAai7x9cK7iFEywY84+
	3IEDoNsXUlGvsxAYVxgaTVjd8sq6OUOUhbQCjr332rI+fLbKe9SyN7eKs/DXvb+aq+gN
	cw8RJW32ie0sBWzDKaA7ZBG1wsEW+wKf9fvZpYn9Zs2Hzd8lpBvCXclLqWnbac8I51bX
	Ugb1RJFAP3NLNQggjrvVuPcKwyHoFiKWkKQQWS7rOJy2Sei4nAehDA8c7Vb0Ns2sDuAB
	Y9DiujsfPsK7PEhJbgxcJby2DvyIDpp2vU3b2Xo+Dw3dbdNs3clF45LeBk+qNoCqkfhr
	PDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yzuNp3mOCJGjeCpJ6EkcNuyZJOcEQiixhCdbmY0Z2lU=;
	b=gCv5XCk172Do/G7cxjzYoUPMxYOS1LEF4udnqxfpRSj0A9aaYme3Mf7w1m6Y2HOm21
	5Wuc9QS+mIbUBVw82f9G/qobkdWJSAKg5t/ArY8btzA6YNWfAYrkzbL9gFOCD3soXJBG
	x6ge4Ci/9a07gqbj/ARGrovjJRpfa1C2pYiL9j3efrwmc8Ar4zkbV6v8aUbQSSqrq47Y
	griXhWksAMxa/BbsRZAq3rocOWYHYXoFcmnaC/6v7R6wS1/QSABLYxGDjoDSwCojdEP4
	wd6RiqM7aBddFbyggdnHXsSiK2b/xYoUw1bWxffnMBa7qDkfvpLLqH9Cks+kmWvOBLqy
	GQdQ==
X-Gm-Message-State: AGRZ1gIyQKJCEKvZmdurkiNQ7WDLm6+ZPPTvmm90G3wJqMHSiVifp1um
	J0rP2EuAgQcVTC6UgJiAjafEWoSE/e8=
X-Google-Smtp-Source: AJdET5c3+H9o/MEcfIGVrNBmZJC0CQ75Mvru5tFN1L+pBIFFBCHl2NUJAJK3ZzSFVxXA6UQ9oVKFsQ==
X-Received: by 2002:a1c:8791:: with SMTP id j139mr21759866wmd.86.1543217728912;
	Sun, 25 Nov 2018 23:35:28 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id g2sm9479986wrw.78.2018.11.25.23.35.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 23:35:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 08:35:18 +0100
Message-Id: <20181126073520.18859-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181126073520.18859-1-brgl@bgdev.pl>
References: <20181126073520.18859-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 4/6] libsigrok: new package
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
X-List-Received-Date: Mon, 26 Nov 2018 07:35:28 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../sigrok/libsigrok_0.5.1.bb                 | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb

diff --git a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
new file mode 100644
index 000000000..8152ca7ca
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
+FILES_${PN} += "${datadir}/*"
-- 
2.19.1



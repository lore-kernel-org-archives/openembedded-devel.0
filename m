Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB4AA7F59D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 09:17:52 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so7732125wrq.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FmjHuliObz/AZdUXuNKTV8kczRew+TwKndz+U1MxjRw=;
	b=scfklRySIv9q4CoulYZYaFTLh+gti4myBsKGNt9u+RLQaGxVLha4BipfNwUQdkhL+E
	mLz1tudKkdPvmJxccwRizfdi55rFcDspHLnUYJu6H1A+H6GDmAZVc47Bt1KdRsmA0Sv4
	uBSUDOSZiGkK4maAT6mohGbQlt/jhSSggMBIt6RPhV1Vt3+2x2VPfuql9AxIfBs4MRKu
	l9gcaIl0pJFmIXpuGaFH9fsCnaKurp+eq6bY8U8CZrhQ1CS2AJUmVylLlStt4Os5Jimz
	o3z6Zw1IGY6lqhxn/sa7Z1phXTbnAdofe1XjWihPUo1hRK48JvTPHWiitBRUhFt012kr
	Wwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FmjHuliObz/AZdUXuNKTV8kczRew+TwKndz+U1MxjRw=;
	b=k9az0BHSCbGcr9C99ZC8egGOxLtWS8scoIYVX5nCGu3eTegrRCwrlxEGLRvzOsMRyx
	QVQ7m0UjkCgDXKZxX6SWrAm/tteul/xxDTHQahDel5Yj/NSN0f6uT39L+NWnfJr+L/KV
	va1GU3s+ngKZTqC60FKHdZabX/8dHMYLUZozyUPEML/VwTD+zRgWiXqtY9Z6VbrH4El0
	k2/tFbvVt1FVtSLq2G0GK5d6cd2wovcf+qvmm12EWv30QsEDNx5nv6L1WWkbm9KnIYws
	fWN6C4X2Kz6GyqfHzfjfAA/I/iSRu3bpS453/CEb9psONCQIYTDY1a+2n9Rh36c/hF/x
	WcZw==
X-Gm-Message-State: APjAAAXwJXIfvmM2tAVPOF2lKlaEaHpppxOyWvtGlpQ4TTKNR+0zusXv
	RXT7D+QBGx2BhByi+eCwcI7zIw==
X-Google-Smtp-Source: APXvYqyjgQI0TBfsIuBfaZTl4EKvP3Cda6rrsD3WhxKHteHvuYcp1laRAVgaQM0lYklVnSnfSsVyTg==
X-Received: by 2002:adf:ebc1:: with SMTP id v1mr16874138wrn.351.1578907073140; 
	Mon, 13 Jan 2020 01:17:53 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id
	n14sm13020880wmi.26.2020.01.13.01.17.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 01:17:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2020 10:17:51 +0100
Message-Id: <20200113091751.7937-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libsigrok: add support for hidapi integration
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
X-List-Received-Date: Mon, 13 Jan 2020 09:17:52 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

libsigrok now supports portable USB HID communication with HIDAPI. Add
a new packageconfig option that enables building of the bluetooth module.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
index 09e56e35c..35e59d6d7 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
@@ -11,6 +11,7 @@ PACKAGECONFIG[ftdi] = "--with-libftdi,--without-libftdi,libftdi"
 PACKAGECONFIG[usb] = "--with-libusb,--without-libusb,libusb"
 PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx,glibmm doxygen-native"
 PACKAGECONFIG[bluez5] = "--with-libbluez,--without-libbluez,bluez5"
+PACKAGECONFIG[hidapi] = "--with-libhidapi,--without-libhidapi,hidapi"
 
 PACKAGECONFIG ??= "serialport ftdi usb"
 
-- 
2.23.0



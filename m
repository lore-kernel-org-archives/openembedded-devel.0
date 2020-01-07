Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4515F607E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 12:20:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so53686869wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jan 2020 04:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o5p8kV/ySULvP5FidD8onDmvmJyLr1spAzMUVfxiHdg=;
	b=NUGigse6bQD+W4aN0+nw7dP1YDJSs1hSqw4n0pfbxJsZ04Zd3zTC+GTy94pS89+8N/
	PI2tDt72StoeXgpGUHC6MpESwq4kIL0tD8f0sZFigF8e6bpSS4CMvZdQzcVm9aIk0Oj3
	Dml/R+sydBZ5pzqU5UlWya4h9eK02oOqNbu8mz9u7d3CSnwdArYrtgD5dQObcg2oh0vA
	HtrJISY0SyiOb2Z2EAVxqfyzWCdc87ibxU+76Ddyzj8gkD1F6wpRy0YpgHKk4Dsus0aI
	dtZRyAgHv9OCqY4W9PrKIsj9zalGGGEer1GUGW4kIdZOQ7nfS6xBcX5p0OjRct5V5T3+
	Cugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o5p8kV/ySULvP5FidD8onDmvmJyLr1spAzMUVfxiHdg=;
	b=tWLkEemVOjhxHsgtpOVKPqtcb0hbJywH7m7zx4vtQqMZO9Sb/AprTMhXdge0tn6uK9
	ctDtV/Ndv1LtFe86wkZsn5r47nh4mIRAGkThfrSKfAFy3AQpnNsuLp9BLkWkpT0XZq9p
	p56qbJbcq6C6Tv34hmeS9/FvSm2xqBaHAYQ+udTNlMZpuUuZFyjVVP1WHYRiF4qGkW2f
	Q5dFBNghcbbOBR/dY9s6vuWhl3/PO6TdWO7V7BmF6s80O8M/OHe/Cq3CYHev+UUdzrF/
	+wMih/SM3bCEEEFoBkk/D5y39aNrJHfJNMeBkXqXjL5wwG3XxWeV2b6gSVIv0Cr59oXz
	iK2w==
X-Gm-Message-State: APjAAAX7WqLFGQgQqdTiAJWJqgfC4qFBchAqfQwMYfhkk3UK2upzJpjs
	iWJk78K6dqLRbubjFnNHwX5Ssw==
X-Google-Smtp-Source: APXvYqzMTu2b7PSk0HY8elSEH70CPKjMtcAVK5+MzzT65THsa4/4IopfQaH0CZ4UZCEcbwzpJdnxNQ==
X-Received: by 2002:adf:b605:: with SMTP id f5mr105658122wre.383.1578399622996;
	Tue, 07 Jan 2020 04:20:22 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id
	f16sm75997779wrm.65.2020.01.07.04.20.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Jan 2020 04:20:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jan 2020 13:20:21 +0100
Message-Id: <20200107122021.19737-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libsigrok: add support for bluetooth integration
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
X-List-Received-Date: Tue, 07 Jan 2020 12:20:22 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

libsigrok now supports bluetooth communication using bluez5. Add a new
packageconfig option that enables building of the bluetooth module.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
index aad8fa56a..09e56e35c 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
@@ -10,6 +10,7 @@ PACKAGECONFIG[serialport] = "--with-libserialport,--without-libserialport,libser
 PACKAGECONFIG[ftdi] = "--with-libftdi,--without-libftdi,libftdi"
 PACKAGECONFIG[usb] = "--with-libusb,--without-libusb,libusb"
 PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx,glibmm doxygen-native"
+PACKAGECONFIG[bluez5] = "--with-libbluez,--without-libbluez,bluez5"
 
 PACKAGECONFIG ??= "serialport ftdi usb"
 
-- 
2.19.1



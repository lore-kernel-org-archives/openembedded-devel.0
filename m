Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1757F7FA30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 16:03:36 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id q9so7692090wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 08:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3TCiUY3tPXvDJPfw13NDgePpC25ENERiJKFXE86309A=;
	b=ElGcrkyt3tQzCGYA4AmidEmmkLkVBMYVNY2N2KZMKz2yroGlDkRHRPgGQDbZf1JEiT
	IO4VOA9ALgW50Vd3hi+dyutlrWIVnFSOSg3PurIb/2y6QZwzW2O5UytDj1Pmdz8i/Y67
	/xJdTDQRQMrx5XEzfFqxFje5q5YJTrnSdJEqS/FPpievfuV6UcaTTbmaG6qFzuj9xDWp
	oJTg3HxXxivxYeFC1omFGSyAOhZuFSkLrI0hqNit2DUyzFhQqURGHVMHwow2yCbW8J+2
	LDfiJW6w7lhbE8Vi/PYy1SNjJ5wZ8D/NVMsQ7H1VDYbt0BKyZT17lICL1tM8c/aIKq96
	BggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3TCiUY3tPXvDJPfw13NDgePpC25ENERiJKFXE86309A=;
	b=TI6s/PBaKOPlsc1sGdi/oocbGo9QieJmxxAHi/jT9DnYEmrZMk+OL1O6TSzzBknwMN
	Q+C8td/LMZacUUnGooVw58BtbyLpYDpMUU4NY+7w3ilK+WN8x7Jsuxa/ZJK2ji6R6QTV
	XUj8V93jPPAlwosM/GJpioxIVcLNIjknHX9RMZlWPIK9QrDtjkS/FdYC14KckHlvW9iq
	GWyqDYimZa3dflH/A9m7fDaYpXiwgUBjlrlWN8O8Ob92NgELgmVAHhNxifPbUkS1DvEF
	aYJGaDudlBxBgu2OLPngYc3/QZyiGpovI9esBpa55pKbaPIOc9aKuiA2PfGCKsrQETB6
	hPnw==
X-Gm-Message-State: APjAAAWCVDnX9g+lvRUZ1pQirpij2OpjUAE6cd2xljI+4r5yBX8x94NV
	L2is+C2RjTy28Yid0c6Ckwap0w==
X-Google-Smtp-Source: APXvYqw1DrWnPZFwLvwLpWFg/AA+4zZTWoHjN2ru4b/E7ydntJ1e9t4OeoFUIImplECyi6txSya3pg==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr611839wml.40.1576080216820;
	Wed, 11 Dec 2019 08:03:36 -0800 (PST)
Received: from localhost.localdomain (lfbn-1-7161-157.w90-116.abo.wanadoo.fr.
	[90.116.92.157])
	by smtp.gmail.com with ESMTPSA id h8sm2855940wrx.63.2019.12.11.08.03.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Dec 2019 08:03:36 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 11 Dec 2019 17:03:32 +0100
Message-Id: <20191211160332.1182-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191211160332.1182-1-brgl@bgdev.pl>
References: <20191211160332.1182-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH 2/2] xdelta3: add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 11 Dec 2019 16:03:36 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Allow to build xdelta natively as it may be used for creating binary
delta patches for OTA updates.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb b/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
index 9bf136391..d100030f9 100644
--- a/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
+++ b/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
@@ -16,3 +16,5 @@ inherit autotools
 # Optional secondary compression
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lzma] = "--with-liblzma,--without-liblzma,xz"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.23.0



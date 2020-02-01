Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2C53A60A89
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2020 16:37:26 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t14so12165605wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Feb 2020 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SY6McZ7o8eOx61XWbqLGmcmqJfo1oiCYO4nRxq56Qj4=;
	b=FzX8g1Va2odQXlKWjdW3Z3l3NZEjQ4PmOtgHzQT1BNrur+sIUkvGBZNrQGFmi5QphX
	r9baSdcPlEOBRtXJCOKwWFXIiwPFBpohJALp0QiUcWXrCzQRX9/lxRzXC8f+ZWlxvs/d
	IFJLpUplHwxDRTQMSm2U1JYh6o3chRVTKcq4++FvamVKKzESGOy8csWKyQU7Bez/jL1q
	YI3GFjHmLcDA2C2Xe0qKA+ut9wMj56DxGdn5f+FKzfelvd5yKvyoiQbOp9KlLR1UaIpG
	NoQsV5qtPr20MuhUBG2SRruHZVZMdCjhzS5opzSgnLFOoH8ZU6Wl5CvlrsszEJ2MfvCT
	cuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SY6McZ7o8eOx61XWbqLGmcmqJfo1oiCYO4nRxq56Qj4=;
	b=Xea2aPsGVJymxERzT93U+zHSuT6aGcAeN2qB4ht21bgEBdFpKsOwMAt7zpkfRfjsQg
	PlH35IvnjorKcB0FCCiabQlj7q0HBTk992T4iNZsoTwdmzmjgc2wSkIfFqhuvHKUnoJb
	4Ou8dbJTALR+JWxLLog5G45HbLA3AFZUoyHk5p+wc7MYwYKCdna/IAm/Odd6zp6JWiMg
	19JRjejVYQYrpia2Qof1skyBZtgE9B3KDBmQSRSW3MpG3IpK+EIrEDLVvnIqAGMtrzVI
	UEbgjRpe2hLCq8VgHpZWhLrPqD352o5s9bZpgaa5gVLTR1HyP6K7g9Q0/6YEsHOacKYZ
	MOag==
X-Gm-Message-State: APjAAAUbhG/+G9GvM5Hi3sTWA4YhEyobPj3Boq5p6DypWk8JwxygaRMi
	NstDDysAbhydjoO+41ZcniY3jjM3
X-Google-Smtp-Source: APXvYqznlseWpkPBgbhk5zEgm+UgWlolo4BmRjzOAdnpv76KVsZCgm3w0RZNPTjiKow6+lwXK3hadg==
X-Received: by 2002:a05:600c:20c6:: with SMTP id
	y6mr18873318wmm.95.1580575046523; 
	Sat, 01 Feb 2020 08:37:26 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F01CE208F5D55732A5FC539.dip0.t-ipconnect.de.
	[2003:f0:7f01:ce20:8f5d:5573:2a5f:c539])
	by smtp.gmail.com with ESMTPSA id s1sm8594117wro.66.2020.02.01.08.37.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Feb 2020 08:37:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2020 17:37:01 +0100
Message-Id: <20200201163703.4264-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200201163703.4264-1-schnitzeltony@gmail.com>
References: <20200201163703.4264-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] poppler: upgrade 0.84.0 -> 0.84.0
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
X-List-Received-Date: Sat, 01 Feb 2020 16:37:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release 0.85.0:
core:
 * Fix case unsensitive search for Deseret and Osage. Issue #853
 * Fix crash in unicodeToAscii7
 * CairoOutputDev: make initialisation thread-safe
 * Fix crash on broken files. Issues #869, #870
 * Internal code improvements

qt5:
 * Fix FormField::name encoding
 * Accept UTF-16 uiNames for form fields
 * Fix search for "complex" characters
 * Allow to load document from QIODevice

utils:
 * pdftoppm/pdftocairo: Fix -e/-o printing the wrong pages. Issue #873
 * pdftohtml: Fix issue with the font size sometimes being huge

glib:
 * make the frontend initialization thread safe.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/{poppler_0.84.0.bb => poppler_0.85.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.84.0.bb => poppler_0.85.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.84.0.bb b/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.84.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.85.0.bb
index 5153868b6..857b67ff9 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.84.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "e14a8aca8809908ad4364c32c17bcb92"
-SRC_URI[sha256sum] = "c7a130da743b38a548f7a21fe5940506fb1949f4ebdd3209f0e5b302fa139731"
+SRC_URI[md5sum] = "5315084523a4d73e9514f51eef78a332"
+SRC_URI[sha256sum] = "2bc875eb323002ae6b287e09980473518e2b2ed6b5b7d2e1089e36a6cd00d94b"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.21.0



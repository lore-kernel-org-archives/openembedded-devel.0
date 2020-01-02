Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id D04537F9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 11:00:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b19so5225483wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 03:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PWwm0yT+LTdrBMX6rSwoKHOHb5mbK0EwlFhLC0Z4AJw=;
	b=FJJaaQQdYqHiAz5/VMve+kQ+SP3r0AZ/0Ncp05TdgUuO1HWBRC91Q99MB5u6CPqvpJ
	HoegLP4mppVm0Gui9zHesxWkZeMjtB3Q7YfxqSFZ8q+tr5fUi+jTzl31gQjm/7KvhQmx
	bLkXXpPODQpFC2e4J7MH3lRTiAmw3l2ytRCUCa8yNAgT28fskDsqc/x8E3aPBcyVsNS1
	Oa8BdGkEXcr9uMA/zlUjhqJL828z+b7mBNT2CS5UZ7OIPk5R6cvsDFNJTsdeydD5PB2E
	TLtVckQpD8Aw6RRiUUemwirKDO+KoIi/2s2XoO3mqI+UjcvMCKeKj/OEhjqZgal+Dm7L
	AC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PWwm0yT+LTdrBMX6rSwoKHOHb5mbK0EwlFhLC0Z4AJw=;
	b=kZf5VC3uzUtgBCDijl2wHLfUCgG5Oakdq5Z5umQqKN/OI/bpKyUou2SjDJp6I8WGjB
	s06NhYetwjPwNtH4UITaDSamPW2ylYtkH109DzvoT94BsCm9qR6B9QbTuFiS6A1WWluS
	IiZJ9Ol2OnIfKQrw5DVkD2eCA0hyRc3OCCekl+42wRBLtBBcvh4bGG6Hw56cBfE/jtDG
	R71QRlEF2dAaNHFbI7x1AZCb4zww74442ktvP6xilSZOQVCJbKMJ75S9Uxs9jQGBOSCa
	XlnwNmZ3tJ16FyB7zXDt7I0f7oJ4xjsgBly/FPS411ZS/TLcUpXs25C2xY4HHUgzD4b8
	q4vw==
X-Gm-Message-State: APjAAAWjXloI0DuNvdKEzmMU8CK/pSS1oxXmFe8kJiSmMYtk819RdsMO
	mlbpAdxrKW33yV8KxHF67DS4HQ==
X-Google-Smtp-Source: APXvYqxywFOrFdVgBUAma4Yt4BscGisTVH2S4OuMmuW/IRPoPbJC7E83U6xXcL2UsJ6tTtq9q1NmOw==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr13503159wml.173.1577962848606;
	Thu, 02 Jan 2020 03:00:48 -0800 (PST)
Received: from localhost.localdomain
	(lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
	by smtp.gmail.com with ESMTPSA id
	q3sm57579765wrn.33.2020.01.02.03.00.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 03:00:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 12:00:40 +0100
Message-Id: <20200102110041.28531-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH 1/2] libsigrok: upgrade v0.5.1 -> v0.5.2
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
X-List-Received-Date: Thu, 02 Jan 2020 11:00:49 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Upgrade libsigrok to the newest release.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../sigrok/{libsigrok_0.5.1.bb => libsigrok_0.5.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/sigrok/{libsigrok_0.5.1.bb => libsigrok_0.5.2.bb} (85%)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
similarity index 85%
rename from meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
rename to meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
index 8152ca7ca..aad8fa56a 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "http://sigrok.org/download/source/libsigrok/libsigrok-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a3de9e52a660e51d27a6aca025d204a7"
-SRC_URI[sha256sum] = "e40fde7af98d29e922e9d3cbe0a6c0569889153fc31e47b8b1afe4d846292b9c"
+SRC_URI[md5sum] = "e258d471b6d5eaa58daf927a0dc3ba67"
+SRC_URI[sha256sum] = "4d341f90b6220d3e8cb251dacf726c41165285612248f2c52d15df4590a1ce3c"
 
 FILES_${PN} += "${datadir}/*"
-- 
2.19.1



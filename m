Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 39B437F331
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 12:00:22 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f17so79707282wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2019 05:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K8GCYl3pnlf3SsPIGqL/xT3jJ2evWbqy+U8POOvKfhc=;
	b=nX3BKBDAJ30XYg4jazN3R2pmvRPG1EyUVQerhwD2moA2e7uA7kZxTdrSFgcx8GSmm0
	exDxeBep64aj0lpMELEN8G77gaRn9NOjJCwBcGRg5kEDL7pHgEv/hWi7tri5VUZ5yEkg
	cFdj2N8+b/8AfRHzofSV9vZi92yy+i3qrH9Bwzvw1rtCzOyThFbfPE0Kqa52kMoQWUDo
	8Trf5pDSk5QAcyQzaKk0C9lIcrSwYWRUUgn9Skx47bMdpX340DbwypjYdhubhRkGj42n
	+wGJ2eRVFDfb3k1Jt3OzsX8pc1WiTFaYbX6a37zjRYEZV8IwiTKyURIblvuwZW7enqt1
	mpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K8GCYl3pnlf3SsPIGqL/xT3jJ2evWbqy+U8POOvKfhc=;
	b=A14RAlUDgSBNrQqAKksxH5O0u3NJ8bFggSTNnZFpu4koZnb94hIr9+zIcoT1+vKPiv
	LPSk1uixUUGTZ4JpwjLzHDoSE302IM2/tobr3a1I3mU6N9FKbFsrEmPu8Eed6Dxt+4QN
	ddPLlwHumMHHoZcrhKNwK6Yn3KTqazMwuoS+ssRbGJToU2LF8BY4ZBrCrnZXmyV3S+7q
	f5Cj/6FI5xAZzVR3VPMneCTnxs1/emqVVE95oZsrKbO3dQRiFOj9CTGVy7uV95OkhhhX
	DHmG8uLwmJLtEL2E0i0r4nn7M6zawyBgmOWSdB0wzBymrZVmz4y2Y+hiKdKLugRReTCr
	61Xw==
X-Gm-Message-State: APjAAAVMX+wctHVpMXdHbs8hi5I0spGnIlLsBa8+6nu9Eiq83OQfJ8de
	IqRD1t9rzOJXIuxjYJleqjU4mw==
X-Google-Smtp-Source: APXvYqz9y08KuInSaDicqZZ5hamKAspfgjfltfEzBMBnQpnT/S7GQ8TH6m7JB++A1ZTOEhRbFlDLZw==
X-Received: by 2002:a1c:6a03:: with SMTP id f3mr4618216wmc.35.1565179222899;
	Wed, 07 Aug 2019 05:00:22 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id
	f134sm3136514wmg.20.2019.08.07.05.00.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 05:00:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Aug 2019 14:00:14 +0200
Message-Id: <20190807120014.25225-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: bump version to v1.4.1
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
X-List-Received-Date: Wed, 07 Aug 2019 12:00:22 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is a bug-fix release addressing the following issues:

- fix GCC8 warnings when building python bindings
- fix a bug in gpioinfo where lines used by the kernel without any
  consumer string were reported as unused
- fix a bug in line::event_get_fd() in C++ bindings where the exception
  wouldn't be thrown in error cases due to a missing 'throw' keyword
- fix a couple issues with the test-suite

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../libgpiod/{libgpiod_1.4.bb => libgpiod_1.4.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.4.bb => libgpiod_1.4.1.bb} (82%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb
similarity index 82%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.4.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb
index 71a45edb9..756b143ef 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.1.bb
@@ -2,8 +2,8 @@ require libgpiod.inc
 
 DEPENDS += "autoconf-archive-native"
 
-SRC_URI[md5sum] = "bd52d764017215a30e2f014d2081dc3e"
-SRC_URI[sha256sum] = "ebde83aaf14be3abd33e7a90faa487a2ee231e242897afe7fdefb765386b3c8b"
+SRC_URI[md5sum] = "585b4bb431f99c4ba9b3ee58b9d494c1"
+SRC_URI[sha256sum] = "21ae8fd1f8dafc2eb2ba50e652390cf533d21351419a7426255895cb52e21b1c"
 
 # enable tools and cxx bindings
 PACKAGECONFIG ?= "cxx tools"
-- 
2.21.0



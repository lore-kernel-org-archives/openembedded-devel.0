Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 78C677ED17
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:19:10 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id s49so7968540edb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aDQHn5c2n00aAa5HLluxVgFo0N1WLJ5IE5OUu3wPCuk=;
	b=dX9EAKPtFOKqxfJMwX2UGZR/0a/LbqPtNbI6tT4O9wXDax0IdE6mLiE6G7Bqk+Y3Ig
	5X//6F4/xYhb7D1uqQoc4haBq8KZt+SK3cSXAaJ5SFfCwDm6XtAyIYdYT+lg0FU0DBBR
	wa+GzKVAh8jpitMHvJUsVGQblUablTtl6WjcQfjDkXD/GeA3lOUHICaz7PL+T67Le+jX
	EVUPFWLvlLIw0WyKzcX5K1ABfwncrhVURcHSdOngjZBM7i64dnbUfiIAJy4LYfdCDKKa
	fKA0AHg+59uWx9PjPqoIDaCJD6ucw0eO/5AvMi8wG5/AqRMwmkqLcrCdcie+uRT2mZx6
	JpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=aDQHn5c2n00aAa5HLluxVgFo0N1WLJ5IE5OUu3wPCuk=;
	b=AUfx+ZRoQr8U5o44JLFEcA3Mucu46Wy3f0xF4ORiduaSqONO7DiDYcobR3OfTGc0Xc
	RY7YaTG32zSsMaBf3tu53uvy40/xI6u/lv1NP2lhSD+fQyZ5cwRTWuV9o5tz8X3+Yp3x
	sUFQQd9yPx0gX9ZjYf9DG2I8J2cL4BNw1nkebbeCSuvhLTvZD8ir9Bxexe2Lng6Ps2Kc
	TLlYuviwoJNUFAQFvYsIYZNHCvuCsQqQZHMVt/Uv+FJw4Ly0K2odRnSUNz5ubJVZA7GO
	BpOTWQa+fvZjBZ5QnKzIxqHuL22J8qvy8WSv6dQRffUJLdmvj7U2USq4ebH+WM28cpnJ
	L7Fg==
X-Gm-Message-State: APjAAAXxIWx1/nugYk6K6UgacT4TEiD9ry77Fx80oxs3wdjMarNoC5Vq
	gemEv2KM4vQeUdGanTKjNGKfIT96LvQ=
X-Google-Smtp-Source: APXvYqymi6MEu8hwWnQTD31buW8HyKo67LT7V4j/tjcWOGQx4iKqp2rJEyqhz0s6xmSXyX6FpBDmbQ==
X-Received: by 2002:aa7:d617:: with SMTP id c23mr3980461edr.54.1562325550926; 
	Fri, 05 Jul 2019 04:19:10 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.19.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:19:09 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:21 +0200
Message-Id: <20190705111824.22255-21-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 20/23] poi: Do not build as all PACKAGE_ARCH
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
X-List-Received-Date: Fri, 05 Jul 2019 11:19:10 -0000
Content-Transfer-Encoding: 8bit

poi DEPENDS on non -native packages, which breaks multiconfig.

Fixes:

ERROR: mc:inteli7:poi-3.0-r0 do_packagedata: Command 'cd /workdir/build/tmp/work/all-poky-linux/poi/3.0-r0/pkgdata; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C /workdir/build/tmp/work/all-poky-linux/poi/3.0-r0/pkgdata -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C /workdir/build/tmp/pkgdata/inteli7' returned non-zero exit status 2
ERROR: mc:inteli7:poi-3.0-r0 do_packagedata: Function failed: sstate_task_postfunc
ERROR: Logfile of failure stored in: /workdir/build/tmp/work/all-poky-linux/poi/3.0-r0/temp/log.do_packagedata.27730
NOTE: recipe poi-3.0-r0: task do_packagedata: Failed
ERROR: Task (multiconfig:inteli7:/workdir/repo/poky/../meta-java/recipes-core/jakarta-libs/poi_3.0.bb:do_packagedata) failed with exit code '1'

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/jakarta-libs/poi_3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/jakarta-libs/poi_3.0.bb b/recipes-core/jakarta-libs/poi_3.0.bb
index f9178f2..e33f2f2 100644
--- a/recipes-core/jakarta-libs/poi_3.0.bb
+++ b/recipes-core/jakarta-libs/poi_3.0.bb
@@ -7,6 +7,8 @@ SRC_URI = "http://archive.apache.org/dist/jakarta/poi/release/src/${BPN}-src-${P
 
 S = "${WORKDIR}/${BPN}-3.0-rc4"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit java-library
 
 DEPENDS = "fastjar-native commons-collections3 commons-logging commons-lang commons-beanutils log4j1.2 xalan-j"
-- 
2.20.1



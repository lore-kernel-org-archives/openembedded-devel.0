Return-Path: <brgl@bgdev.pl>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 08D7D788B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 11:07:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a20so6419634wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cfiWfFLygmi476/9iVy2pgor+ZHm2GLwpOeJNOuilhU=;
	b=Y42ark7eKY1HHzpsAim/F8NhwDvlBaciyc6UVV4qgO087hXyZBrUuSdgeprekf7zWT
	PXBv6aEaF7XuTIHW4EEJXW2Ini4eQrz3Ktu1QopCEDAtBbHm1sPLAHlIiMMXkEWPVxtn
	dvbFw9RF393Xx155UYACrxE+8l5UTeIVMsYvtxRgv0KqTdNJKDZbLaDFqh2i3zq5giR6
	wIjpM8KrlyAl7dMjCStP14BqUGtYFr21dnwPmXxG0IjMjNRUAiZTGfxQ78JaLw7YZgiW
	eK7FmR7UsREXSGb5/qs3B41V/WfxTerFJKtW/swVdPCOtGsmyBYfetzbG+9TSlxt9xj3
	mDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cfiWfFLygmi476/9iVy2pgor+ZHm2GLwpOeJNOuilhU=;
	b=XlUHU4GNqrbhWgOjxjjSnZbsiCuzvAfZdboOvN8Sg2EL/ZSkZt0FpPjs4uVvYXq554
	RNHwfNSyfSHyLEPUPV2dDIPELWmGEAxACjw9b/cr2GasgT01hqvF2b0Muk3y5YW/PN5X
	Zs3oKDzd4bbX+ZRkJYDktohXlThwDEPCW+pv9IPaVM9aqsIfg5pXb2nBIfWqcSpcF7cZ
	I/gpqNwo4K4CyOCKD/DkZgvRCxsWOhZUThtb6b/OyMhS0gmEzYV3EDXS/8s++JCImuN1
	Ek2kGegi1l3SKolz58EJCcB7/K7ATc8VkRb36OjX9m+fMdLU7ZJ5rvUEY7pNZmoNt3x2
	tX2g==
X-Gm-Message-State: AElRT7EQBAuu4Qqe7XhwKiS79J/yx4v8pt8JODgyr19om0Q/FcoG+Umw
	ImkmtaR3sYOsVK2jB8slJZaABg==
X-Google-Smtp-Source: AG47ELueOiJ1zqiMdC0JMQPZEPqS/eNEShs9dDAIzSmXbcHB9U99RyhjpJ9mfhhJgTrqc4p5HxwH3Q==
X-Received: by 10.28.150.14 with SMTP id y14mr8728930wmd.5.1521803249675;
	Fri, 23 Mar 2018 04:07:29 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
	by smtp.gmail.com with ESMTPSA id
	c57sm6184788wrg.84.2018.03.23.04.07.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Mar 2018 04:07:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Mar 2018 12:07:19 +0100
Message-Id: <20180323110719.1010-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180323110719.1010-1-brgl@bgdev.pl>
References: <20180323110719.1010-1-brgl@bgdev.pl>
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] libgpiod: add support for v1.x series
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
X-List-Received-Date: Fri, 23 Mar 2018 11:07:29 -0000

Add a recipe for libgpiod v1.0. It can live next to the one for v0.3.2.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.0.bb | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_1.0.bb

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.0.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.0.bb
new file mode 100644
index 000000000..06d7efeb0
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.0.bb
@@ -0,0 +1,4 @@
+require libgpiod.inc
+
+SRC_URI[md5sum] = "e38a67d01964f727703da9f698bfa53e"
+SRC_URI[sha256sum] = "34c76b3730b9d4a1159bcb14000f78b1e890251b8a3823b794fa930654eabdd0"
-- 
2.16.1



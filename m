Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id BC75A71D31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 06:55:06 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id w64so41054968wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 23:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WmG/eZhkvaloZgcoD7HagGSWB/V9aOYUiF7qnxDA2b4=;
	b=D4b3L4WmaBUqVlPkJ+5qcB3Vlh+7fmL1JBeSPWrHbgi+VxkenbNTdoHH+DjDZZ0Khd
	izMR//7aW1vCDBrz1KLjf47kVwCO7atZmBedIUZ02ih1SwZJQR5/3jPA6YVujFz9JFa2
	wtrd9w9nDvGRnnRtUMijmwhgb5zs2W/UDrvi65B9adMpRSEB5vYKgAbCBvbN7ZQ057w9
	mfj8uiafpeuMm54t5iyg0OtFoUkk0BZ489ILSzbZLeiX4odwV1lXKiDfhce3y5xuJHbb
	C7dMoDXlymaEMhsKnHBXFyFjrsrkItAAeJll5Ek1UMduQq2CuKFUG05CWB3wHISc0jqh
	UdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WmG/eZhkvaloZgcoD7HagGSWB/V9aOYUiF7qnxDA2b4=;
	b=hB6o5QV6uXcF1vnQ0yEX2bjdq+4r3uN4SGjN0TXcg2rPY/QtGSGaOYcZXzSiGe3Q/v
	p50rHIlyxJ39Bgjbcsze61HhYEdTMtcHrVQxXpBSU7f41m5dBcak4rxEU2Mk3r5CyJSV
	r7jKqOr62fMmcwQ7/oqyoNYQ88+JtphqWn9sV2k62d7a+aXSwfvKSEKrjQBzWP/I2e/c
	fflBVvWFJm7t1wTmnSdgGf2TZ7lrYaTWZ0gumeq/jCk16svHjrdz41At5ZHrAbCcNXsd
	4PCb3Myauxm+EjP039SqRyC6xZE+A401uJ/kvjKVfY+Ngx4hVV97YdX4byDyLunGVALs
	dDww==
X-Gm-Message-State: AN3rC/48vZQfaYVZTreH3Jojj9kquMct+2m862u+XCIgm6JAqpbHeFde
	2NELamswl77BbA==
X-Received: by 10.28.111.134 with SMTP id c6mr5005651wmi.128.1492930507236;
	Sat, 22 Apr 2017 23:55:07 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.154])
	by smtp.gmail.com with ESMTPSA id 81sm8059503wmj.9.2017.04.22.23.55.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Apr 2017 23:55:05 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 08:54:51 +0200
Message-Id: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 0/5] Fix some issues of openjdk-8/openjre-8 headful build
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
X-List-Received-Date: Sun, 23 Apr 2017 06:55:07 -0000

From: Ming Liu <liu.ming50@gmail.com>

This patch series fix some issues, so the openjdk-8/openjre-8 now can build
with X11 system (headful).

Ming Liu (5):
  openjdk-8-cross.inc: change a dependency alsa-lib-native to alsa-lib
  openjdk-8-cross.inc: fix wrong sysroot path
  openjdk-8-cross.inc: tweak PACKAGECONFIG default value
  openjdk-8/openjre-8: merge some redundant code
  openjdk-8-cross.inc: fix a libpng build issue

 recipes-core/openjdk/openjdk-8-cross.inc           | 32 +++++++++++++++++++---
 recipes-core/openjdk/openjdk-8_102b14.bb           | 14 ----------
 recipes-core/openjdk/openjre-8_102b14.bb           | 14 ----------
 .../openjdk8-fix-libpng-neon-build.patch           | 29 ++++++++++++++++++++
 4 files changed, 57 insertions(+), 32 deletions(-)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch

-- 
2.7.4



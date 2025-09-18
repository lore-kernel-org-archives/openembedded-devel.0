Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2B8CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 02:58:48 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.5109.1758164324733845532
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 19:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MAb92X02;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2570bf605b1so5819925ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 19:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758164324; x=1758769124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epXxmjp03FuqvO/nBNK5BNw7GRqwMxuP2vps0de+1Ng=;
        b=MAb92X02xp30cBm1H2OSUeHJTcP5Wi/EhH1CKYN25X+A+FFc8//baCHXgg8UuVDlni
         xVTbX8I2VdYL04jiu4Ep/mmCj/F2P0tbGqPYX0Ul2NKWxE8jNfieMLZJElTsChEu9iXU
         PXop6cFfLSZIWxrb7tqZxwCgvtYLOiRRvCaNMwnj94B+WcA+vKYf5geRjnQHTuyWrtkf
         X0kdVihpkJhDbtjEp8wV7FG2aLrPvxf+nrZgd/zzq/dm+fHkCsfpCvKKJgRRW7BC+syo
         vD7d47Yr3wezr8D/jMAt9cymquQLiQEIx8G8dQTB4aBwXLVdc/ZHPouHKWl8TCwP/MZ1
         NoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164324; x=1758769124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epXxmjp03FuqvO/nBNK5BNw7GRqwMxuP2vps0de+1Ng=;
        b=QraSK7uzNA8vpi0VSGuP5JrWS3FByMFgPYPRxG8xt0LwR+yFkKrQIHLOwR9TlcN8Qq
         Yw9neBcGtXqnc4A+vDu+R6coEd1+1ajEYPpdh8nqNOpavbj+XkIgJanaIsp7T2b4jXK3
         SI8D2EeAuz3/+mH853O+gMKHUYGsSWHaCixr0PQZiXPWlH9I4uHj4kJttJ/Ggf0Vv1mK
         Paw6ttAkIF9ey4t6jdl+k7EF+nMdfyztGhmBizGfF3fPP0jFihrfm333BG//0i1Tgjci
         nT5mHyxZeb5FCLKY2wbNLbzWOPQB+MtL1csNXIlYdHuTWWdnnS8MQaeEulHK+mxKooOz
         K2/A==
X-Gm-Message-State: AOJu0YwFrnzlyBW9m81VR4gEqTtevqqtlqT5WmTk7ZvteouL2AkRyTIC
	nbCTv82fSSU1gijCbRAA8IRk0A+2nMmrepyirmK1ONqylWK/RYJOhUZ8YZnb5GcEjF0=
X-Gm-Gg: ASbGnct68TBQDeEZTg5snY0Y8fQydsx2ucRG/xhXXw8gdd0FBhfkQ7LnHNa0SfvpODr
	Tz9lqywMUaPO2EYLQb48se4oQN+UWdJPiQ+ozy7K4ejw5NrIWLqXaN7DfuQ2NGmXr4m1rT6g4xt
	YJ5ozxSb8WPTOWGLS4tEKNHB5x//lda+03gpPL7VbdmfTUc51j9fy0ocxC+qaPpIt5OLoVjmgec
	upOjUW0Rut1vk+Cx4mtuitl3/L7ycfGxUbL+9VpOkbsGlOKKWEUPmyXFmoT7DRwgOuPc7c92OLZ
	2K2xJ6pneTpFAs3otQTu/wgCdXkzdL4h6SG5OX89OHfgMZCkXKmv1l0oQXWGxDI6l/htvvZCPWB
	fL86QshWbzSG5qR2GFItoWte3mxtpOHxZZ+jOBgGeYzsNmoauStJwRteajGBcjz/lNmpYNmNktn
	mR0Qd/OjW983OjahRDbtWsBWkaFSt9jgiQKSOvu++6xVf+MsJf8jftabu6pYw=
X-Google-Smtp-Source: AGHT+IEZiM0lcVeKzoFfDwVGhBK1wMxzbOM8am0gx5ftDSaitbdq27zfewOwo5sb14OewM0Be+ny1g==
X-Received: by 2002:a17:902:eccf:b0:249:2caa:d5b6 with SMTP id d9443c01a7336-26813cea65emr43565145ad.48.1758164323807;
        Wed, 17 Sep 2025 19:58:43 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::4170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980368ef4sm9458795ad.149.2025.09.17.19.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 19:58:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] libtatsu: Add recipe
Date: Wed, 17 Sep 2025 19:58:39 -0700
Message-ID: <20250918025841.2170106-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119503

New dependency needed for idevicerestore package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libimobiledevice/libtatsu_1.0.5.bb                 | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.0.5.bb

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.0.5.bb b/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.0.5.bb
new file mode 100644
index 0000000000..4f6f0c97d3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.0.5.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Library handling the communication with Apple's Tatsu Signing Server (TSS)"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
+
+SRC_URI = "https://github.com/libimobiledevice/libtatsu/releases/download/${PV}/libtatsu-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "536fa228b14f156258e801a7f4d25a3a9dd91bb936bf6344e23171403c57e440"
+
+DEPENDS = "curl libplist"
+
+inherit pkgconfig autotools


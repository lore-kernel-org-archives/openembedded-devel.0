Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03D0C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 13:15:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.21618.1739970927113236957
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Feb 2025 05:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NwDcJORn;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso43226975e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Feb 2025 05:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739970925; x=1740575725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qC8lvD0MMZHdyF7m6G4pVI9/MBQ3LZvwm5bl1Gb/fbE=;
        b=NwDcJORnZewUXtBl9nSy6xhZ5qVsA32sU5z818GZNsoYM/VFDCMq4/SkcRjL6Gk6Ty
         UhjBX12WG6SDMell/pYFxg9wdooSZA0IA9E1yLfHT3OstO1F56g17r7Jqn5A7LDfO6Br
         X/QK2PkHTinjCHXPIy1dIY3+EN1YntCra2OkW3YQ123qLckofyysgSismBJNEbX+4p3K
         t1PY8BSqTfmKQvh/vuYNlYOeAhIy8sFO4lL2s6fGRb/X7ej0EUNUlhCmDYQxnvZL6C0L
         Wrw57nzZf95eqOlsbtwU0OieIP1cMnAFI3NidFhff0LQ08s2D1jiSYU7fjRnDCCkzqRz
         pMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739970925; x=1740575725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qC8lvD0MMZHdyF7m6G4pVI9/MBQ3LZvwm5bl1Gb/fbE=;
        b=AwfW6+Kbsuq/ShrTNGaK67t3nvPQJ0uoZgLplUySlTdXfEajAtx25iszPI9xiKcGS/
         Xqp4iL1TkMFjOspKBlHBQOJ2OOEHwqbqNZvhtdFBQ7EH9fe3V+St4Vw6JykpcM/3lygD
         oJYaV9IC2G9rOdno/TpsP41YC5ER3H9fKkFxvzoqL5aFw5uhmXp5ZfusAwGhHD7KGM4z
         yflNX09OHl6nHfGPW3xTU8RyZzVTXMZ3Q7CkiaTh4cdTHux4ZTRpGd1oO3ig8xao44gh
         Em/0Oces/Ybow6BdMsTQquB+xZ3hJnY5p2YuwPXfC47T63XoYKC1LZcSC/lZamaJDSRU
         u6bg==
X-Gm-Message-State: AOJu0Yxk0o3nkPrjHl4Rbat+K0AGw8nz8vljY8CkJUBHtenhoWce2M/R
	C1svsNTSUy22zC5aiAwJyf1zleEmi/FULDICYw6lDQRRiAb1SS6h2R/EIA==
X-Gm-Gg: ASbGnctqdpg4ql69RhRbwqoTM22HOw9M/SSq/FI5fOeu0gFzVfmkA6EnjKNGOvC6Gxc
	MZkjAlVwcq5SiXmyeFRscn0IyIY38VrKu+UW/gQAZyTv5h+ya8bBTGuOuLqJgBiY8o0DKhkGf9F
	+UxQwP8Wv6opXie9oJ5XMXWlwibQ5m2hCgtTIbPEMiRZh1IOlssnuO6NQXO4Ij3Jq4ERG/92n92
	rm+Hd4IHgX7drt4QYwLunLqvp+vQTccI7qfU+tdG5tqwEBq3CvvmZXVmOB4otL4IyaW9rD+7Jgf
	UxzHs/d63/Z+zpDuDUB8kcmLDRckIxA=
X-Google-Smtp-Source: AGHT+IH0sWzhVsZWMQ+LHvRyNj/QZsc1VvruPHmKGoBUYhsenmJhOosxEW0yu9YRQOidzeX2EfARfQ==
X-Received: by 2002:a05:600c:4f02:b0:439:930a:58aa with SMTP id 5b1f17b1804b1-439930a5aacmr76258635e9.0.1739970924957;
        Wed, 19 Feb 2025 05:15:24 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258fc7ecsm17638850f8f.49.2025.02.19.05.15.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:15:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] i2cdev: fix LICENSE
Date: Wed, 19 Feb 2025 14:15:23 +0100
Message-ID: <20250219131523.2827505-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Feb 2025 13:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115523

Only the library code (libi2cdev.h) is covered by GPL-2.0.
Otherwise the main license is LGPL-2.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
index 57057c9bf5..87a71efbe8 100644
--- a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "\
     utility lsi2c. \
 "
 HOMEPAGE = "https://github.com/costad2/i2cdev"
-LICENSE = "GPL-2.0-or-later"
+LICENSE = "LGPL-2.1-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=768997ba510a952bef1775c50bc22b00 \
     file://include/libi2cdev.h;beginline=12;endline=25;md5=72486a5e192d6ac5c7e55a4a95e380a6 \


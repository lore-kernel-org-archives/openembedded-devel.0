Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18565C83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 22:41:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.46236.1752360099428394486
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 15:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lvJOwSPV;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso33516105e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 15:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752360098; x=1752964898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PKl3geT2HaWw6ohxXUgJrZsRHC14/Z0llozqVRIjweE=;
        b=lvJOwSPVLfBMn7+h1Azwvfgu+NdIqob2wVP05BnqnPmGLRfKw+aQ4npEaC7MQ0vD0L
         3vluAHOl/KXdrud30kRW7VQ9oYPQ4ayT38ELQ3Tgk369WK7qWNmXyPkppYmTUeXesYU9
         sDr3yT0vA3RPVtXma5bvp8QuF9zI08/5edTcSPWewrTZkrcptRq5tC5G5v5KVongH/lZ
         s1EhnC83tqZGEKe821yD7cUuDPXsrqOLZ58IJ1JgvaEbZzO8hAxWUWpqeuQRhaDfuLHW
         Bu50SdLWXyXMGrpPWasVoDlnc9wgpyq97O79caJvfz8RWtIBPdQ7CY9y5cCTc7F8uNMU
         E+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752360098; x=1752964898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKl3geT2HaWw6ohxXUgJrZsRHC14/Z0llozqVRIjweE=;
        b=GGbaZfmpWrHy0z2xzJsjezIbve1yGnmNvWfc+5NGh8xyK7WfWGZORGe7N+amwhKudq
         mA0BMhT3VWtBQplPpuuG9mYiyopZfAudGkXHcNkVB0HMGwG9iv+MovGxhu9Y8U2kuhwp
         nkj27gFzUPjM2Cy5RJVRTrS62Vg2sMtr6i43qgLY9SSAC0rjiU7KgrQGflnlx2C1sNDJ
         iMkiPuEtavyaFTte8C0Mu3dHiP5L2eTK2J9rDeLC1cQ/NwextDd9ZZGIMdMbfClj5MGz
         LHHrtjwqyAx+OD+gTzycAJX+cadIg6soFz5S0LqcK6yl42nwuLts+GttTYllcZyXVteS
         RE7A==
X-Gm-Message-State: AOJu0YyxxukXmqjU6RFcGeHQoak4A52rtyH1x9Zwte4/ZMdMdOUpALwC
	Y3JUESjNxBQv5e7cIw6uYxmbsc/zAJs/e5UkDxHdfGc90MBvhlMjJJgjpa4zHw==
X-Gm-Gg: ASbGncuvgjkLs+uZ824tFZGYRGti8zQlvoWcBM63SVx0u4Sp+3zwpD3X8EGrj07ZHSR
	BFoaVRjSNdmdnXPc7rBD00sr0F8nec6jyamKvk2hqHLqkHqylI4uKwoUG4z/J98nJNJQRT7jQ8o
	xJX3qBvo6O+ynrp/hV+0EijjLrOKOzkP4uVkA9prvwLIxWCzHm0vNEx3PqOxqBKPc6tLmT0YRkI
	EpxAD+fSpeohO2t4i0y24muuV2n/ONCEGMsNRSneNuNzcE/le1SNkdGQll03LvF8u7CEsHaY7uG
	eOoZCnKvfa4X8SP0TFBmCxV3Mw9uIh/dIr4kjUNcJepXnLTczwAg+wc3y+7p+SS6MCdAxM0W+mj
	ylKN1+FO74nB2AeffsY5F+6VZ
X-Google-Smtp-Source: AGHT+IFTR6AoHTZjgUnKsZtxnjKPVP8wQ08nmqZmmfgviWZPYpqE5DvbEhvq7bjbGwKe4t8b6mWHAw==
X-Received: by 2002:a05:600c:46c3:b0:453:8bc7:5cbb with SMTP id 5b1f17b1804b1-454ec281d0amr70821905e9.25.1752360097325;
        Sat, 12 Jul 2025 15:41:37 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d758sm8128311f8f.49.2025.07.12.15.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 15:41:36 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] pstack: require x11 in DISTRO_FEATURES
Date: Sun, 13 Jul 2025 00:41:33 +0200
Message-ID: <20250712224133.3035-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 22:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118493

From: Martin Jansa <martin.jansa@gmail.com>

* for libx11 and libxt
* only 2.10 version seems to use it
* surprisingly there is an .inc file but 2.10 and 2.11 from git don't share it

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/pstack/pstack_2.10.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pstack/pstack_2.10.bb b/meta-oe/recipes-devtools/pstack/pstack_2.10.bb
index bed49b62ba..eb8b2965f1 100644
--- a/meta-oe/recipes-devtools/pstack/pstack_2.10.bb
+++ b/meta-oe/recipes-devtools/pstack/pstack_2.10.bb
@@ -23,7 +23,9 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit binconfig
+inherit binconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SYSROOT_DIRS += "${bindir_crossscripts}"
 


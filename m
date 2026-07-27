Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632AEC53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 07:45:14 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26032.1785138314099148340
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 00:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ekOKSQbL;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceaf8a1265so28516245ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 00:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785138313; x=1785743113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UY/6T2jBKWD1MTxGBRs08ZBnVtWCy87gyVViuYeFSy8=;
        b=ekOKSQbLBPLxbC2L8x9vbreXdTd15HuHkZY+tXvvFTQAPteW50eHOHKTVV4xx7EzH7
         lkT84VMOZncXjoF5ERCVw29hIylGUI3gXVyoUJKylKTVcD3aQEG7IjgRbLxfLXESIdDC
         2NG2nfTFOdgg54FMbCkDt+Y4rHgCxPLYuo97tTBwaSfoKGYGrFrtI/zUw8P6BkC5JrnZ
         zOQjxxRkn7VtQHrUPp+peXp6guxxo1Vmka+i6vUTTnQ7dxsy3yRmYN16QDi1zg8YZKPK
         zLYOZxQa9tsQY3wxtkVZIOTmOKeG8In7fBMfwOgzdqks7oEC3mpfVTqiDWEaJfnavDQ7
         4G/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138313; x=1785743113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UY/6T2jBKWD1MTxGBRs08ZBnVtWCy87gyVViuYeFSy8=;
        b=acH3HPaR3pDPT8olI03hpS6qeZGY0To4COmT8hM91Fe/XQvh3RYYvsrgrCsf8OTRoM
         OrMQurTrB3LxWxw4rqqHomQ9zk+uS3OGVt6uyo50jR4lH1lc9qTZ+8+IM5UO9FKany4Y
         uOoyyVcoZ7S+gQhCkZdnctlo6BhCKzWPUQq3hi2QHfe2falpyncpvCzQ1X6Mvw1/mAZc
         KlBw1/rJac25OUkaHgizfxMvtbWbeJfa06PujXCYxnthnVXVI6nJvgNa0t49ZjtIlkuU
         nlYWjEGbUp5Xu1E3fohZP4sGxnKvPZtQNch8aQlcJtEcuXyIyO9140ogC0NYpkTzUwyr
         K8BA==
X-Gm-Message-State: AOJu0YxkghkmU5ZZ9nIcA79dThW9NF5sEQSfUKHmBg0PpDMHexW0sets
	/K8h8H/wY4qDM/Lgj7HWQMepLEtYk6PhhJggSEnzdHosj0n7L2MAgJEv4uYQOQ==
X-Gm-Gg: AR+sD11/NsyB39W5z9YA1iW8UuHpbi7C5X8HrDIIbGWYwEVMONJ+nAVgAsj+DJlh763
	W7swP3bHI8exStP2E/fPGAN+NDxBji3LXZv6TTqVrHtGCXJWwxo6lCY5Wo16QiM+iaHkXXWR9JJ
	4Gs0yPFqW4lQWFf9masBGSRnj7P1b3ll2C/NmOSwMMQcSxX6CGKM7GJ1rGbHLNJLWxUd1xe3aC7
	4SLMsiSY3D0QlSyhm9oJWzfE1kR4tUDN+pgLNG1Bw70mkn491OtbF9EVVl1sUECp1tetKvIFfcY
	s0554weA3nxl+gx+ElxoDHERbUFfOlFeqb1+M8KKhpz0Qzk8KGJ7aX8cGO2qYGJweNMo7/InZFk
	+kuj/PKOi8PNaRLiv8JCuOmXDBo5UiTtDWgwLRGIiwNnv6x6lREreaDZ/oY64Uf5WI2dpnkdNVa
	NcE9Aqtv01kdHFm4o=
X-Received: by 2002:a17:903:166e:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2cfde7a991fmr68860325ad.21.1785138313440;
        Mon, 27 Jul 2026 00:45:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cffa9243fcsm8648945ad.64.2026.07.27.00.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:45:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/6] netplan: upgrade 1.2.1 -> 1.2.2
Date: Mon, 27 Jul 2026 19:44:58 +1200
Message-ID: <20260727074501.3707659-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727074501.3707659-1-ankur.tyagi85@gmail.com>
References: <20260727074501.3707659-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 07:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128457

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/canonical/netplan/releases/tag/1.2.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../netplan/{netplan_1.2.1.bb => netplan_1.2.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/{netplan_1.2.1.bb => netplan_1.2.2.bb} (97%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.2.bb
similarity index 97%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.2.bb
index 22159dbcab..62e6db9b61 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https
 
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
 
-SRCREV = "f758e3f6415aa68b7cf28991bc5b3e9631297d6d"
+SRCREV = "e9dd90a96727bc6b7264c36526b39d1dacccc00f"
 
 
 DEPENDS = "glib-2.0 libyaml util-linux-libuuid \


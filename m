Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362D4CA600B
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:19 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31566.1768811290709056565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EI8/7Ljn;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a12ed4d205so24064325ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811290; x=1769416090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7nCdUaA/g2Rwq8umeQSv8qZ/APqkeMAOUPT6o9yOk4=;
        b=EI8/7Ljn8/9LcuOSKjmmct7gADVcwN8y4XxVPIbKKnFrjGAowGy4vcsXeWw/MLR8E5
         g5ljGJhC0SfF1IbjePYk2Qmo5nisEeQqOYVEU+FO9oseKeUJZvqFSreAl+f4mDYiBb26
         Ikly+vkcnAEr6Ukjeh5WaYw6AUs1mxgTzY1fif2wwem7Qt6FSSoE87Vo+a6nk4KIyH0p
         Do9lOT+l9Nwvn/kX1kg/mM2GoRp+SHnZp2FghpNrydlhEceXj6Fbe39o90C4E5zn/d/O
         HWZ0gyDIA44IhWCUimobpTTvRz5HmZCOvHoWW4x+DPVw1i1KkIx9Ft6OrLdWkRCpfRb+
         aYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811290; x=1769416090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/7nCdUaA/g2Rwq8umeQSv8qZ/APqkeMAOUPT6o9yOk4=;
        b=CVB43eqHEgPFxwkHYezbCHtodkav4IORcfSkTw92a7K6K8UKdowDJst+WfapMIayEU
         AZPFJvjMbIpQ1h+XNB2uPxYJH8wqQEW1iOxkukfIioovt7eJn5NfLY3xL++XZ34tTfdd
         qJ1/2dPKyPZLZF5r3N/XfIizdOr3vtej74shb82yIDQBBPadGdnvwxavB2k+IeCrOY5i
         58WKV4fuTJB1SJIrK4hDu3uaqQFAasZFyrhtYI+/fu6ZtvtH1Iq2pA/sxoLZTYYV+Le5
         9QJl4YPQewh3lUHpHIwc8qkXuM9pueq/3hC3OzWbTO6R8FwoYG4liBOtQlkxeJLmMYHd
         1/VA==
X-Gm-Message-State: AOJu0Yyd2BhFx8IEga+8qZGdNOB13yqMgR/U+nnQMpX6sMeSqeENE/3O
	6klcs7M4eG3AfE21kW8Bx4DqIcFbil0GRy4j6iyGqqtDWGOU+TjN8Bx5to9eeQ==
X-Gm-Gg: AZuq6aJMdBOv3RNxpV8SHUYGw/EvLZPpdlcbqG3jSR+zCSBVq7HIJedi0hgNTDArgGa
	Y+cOrzhzO/RloQvdvYQmgqZKNSm387QWXmnJVT7LoA1huaMOfHjlyGjTvr28vfPx6kGk3kVxnq4
	jii2bJWpk45AC/uBIviqyz8CbAgAPzQQqRR6EfJKBoxab2yBCudM9lmB374C39Cd4ORffY8TiFN
	Yy+k+/BXtE/DgaWAko5lK6X6k/FeHIFTaG3T5et59LCfZCotJigLW5m8I9aUXmHNbVv+EZVX+CM
	4cQr6cUUUF81UxLYLOkyj+eANX1wTeE04Ny6lQlp/xjCUC7mSh7JprLymR+k4FpJ/+0ufY2FNMF
	3MlsnvOBVbqLXiFlZcaW7ITARUYBb+SInexbZ2a/HyJJvhVpifA78HiECbs/hH1Sj++Szkjy4/c
	F/puknaD166kLUOl8efFlqsOc=
X-Received: by 2002:a17:902:dac9:b0:2a0:9a07:f8be with SMTP id d9443c01a7336-2a718883702mr96168615ad.22.1768811289816;
        Mon, 19 Jan 2026 00:28:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:09 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 04/28] libsdl3: upgrade 3.2.26 -> 3.2.28
Date: Mon, 19 Jan 2026 21:27:26 +1300
Message-ID: <20260119082752.4120991-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123598

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 26e3ef119b00bf1910306a2153891140a3df2389)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libsdl3/{libsdl3_3.2.26.bb => libsdl3_3.2.28.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.26.bb => libsdl3_3.2.28.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.26.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.26.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb
index 47751ed57b..98eebd30e8 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.26.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "dad488474a51a0b01d547cd2834893d6299328d2e30f479a3564088b5476bae2"
+SRC_URI[sha256sum] = "1330671214d146f8aeb1ed399fc3e081873cdb38b5189d1f8bb6ab15bbc04211"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04947CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:04:59 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.720.1778648697713925633
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 22:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cuX5wUp5;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3680540a6efso2235284a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 22:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778648697; x=1779253497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+AiOGT6zXno5jQrFizVIJSv+1R78pGHR1+/sN2UJyE=;
        b=cuX5wUp5vlMe88y6E3Mj3y0NEWjclO9eaeRVcPooclqjkVSs6J5lTVIqOT3NUdj8P+
         f5Zbit88eUIkdXQZ+R8Yc6m/FvwNF0W472IcLF42gqat8QvtwaL6ApcX7buFdnCY73Fh
         b+9B85w7mDfLNdaUR683vST1XZl3Glf1vyZxrPWZRR+OgFxvymIcaGA03kzzpaBxPt4B
         RI41iUmtYnp4pJvWoanIubz6oi9YoA2vmdDIWQX4nBWjURNL1FehfUlphbf3qLz+y2hj
         1lWnMVtuXV24xUcpNff7StRRpZYlKgoz0WERDRF6f39KQHXyyP/srP6D8lgPKXGvAtqs
         foHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648697; x=1779253497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+AiOGT6zXno5jQrFizVIJSv+1R78pGHR1+/sN2UJyE=;
        b=JDqMH/adDgGgIqpwjOnRUbbhqZaqrqyeUyQHHbauXYLv6ro7bZKJPolHQkawlNp3kp
         NX11sjmBvzKuCWgXYeB8IfSKynDYLluIyzSgrGvFX3NRRdJwjxYfaBlOPSb3b669E18Y
         eYbtv4mxp9RNvVg+xsMAIJzrzCZJn3XQ/oNuDGt1kF2V86SVeAoerBcMlxO1+H5P0Qz7
         Yn5Cj4CF5k6eWGBjCdZvFqzrsxmGG+FFixq2NV0VQeqRCfhBKCG2YOrYlr1zKMqdT0Iy
         BoaVHzJFjs8cthf5yEV969E0CeTGSXc0IEll+Ae8L3B/IV+IGPDAIUQpWIX8KJRS9hgq
         OiZw==
X-Gm-Message-State: AOJu0Yy4SHwWjmSz7ZeA8Vimy4cuLQ3tfn/JvDO8ezdsgTJjjoaUlmTq
	L1jSr5ag7GvxsDG56/AZig3r3UNCIeZP5BuccNqXAFE/0s+zzOydsEGZ+sfXM6A/
X-Gm-Gg: Acq92OFSWWpp0Nf5cp529b0PWoXNQ52Vpt/vRpzFSrfOIlPI7GqqLnhQr8hggbSWo2U
	Q8OZQFZEpKOfaCBHgtCOM/Vfl+78Z2i+eD1XhDHO5SgmU9nFlBDmY/4k3GIbsFedMQYSbfez+pg
	LYyTvjLwZSKwpSmwC8hlUWxCDbO4xqw1vLOhmJaWDoavYd6sr7sm7zWv+slmajPGVV7hXBkRkl0
	lZIRFOYbhVBKzzzaKjKR3UNMmR1bmo0O0A25Z63b1yIuzHWxfz4xPOMT0dbQWvugTy16Dv8AFWg
	MIERpEMH4vGzXBs+MNgq5aGVAdY/TcZ9eVgMP9vbz5Gqu719daGAMg4lwZDF4cJPYmOMAEl5e6U
	XHrN0P0NQBMHseT3JVKy13s4hrexCEc070GNiu0klydUwZPVO2zI0K2Y8b/BFjr6CLg+tqCf16m
	qc+xybqKrSyoG3XZDHOiNtoOtWzAJK4QMFtppatvF1wrR2x3o=
X-Received: by 2002:a17:90b:58e4:b0:367:c442:3f24 with SMTP id 98e67ed59e1d1-368f79b61bemr1343637a91.19.1778648696903;
        Tue, 12 May 2026 22:04:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf5c58sm1696900a91.1.2026.05.12.22.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:04:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/8] exiftool: ignore CVE-2026-7580
Date: Wed, 13 May 2026 17:04:42 +1200
Message-ID: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 05:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126944

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

The impacted function mentioned in the nvd[1] was introduced in v12.82[2],
hence we can ignore this CVE.

[1]https://nvd.nist.gov/vuln/detail/CVE-2026-7580
[2]https://github.com/exiftool/exiftool/commit/280a7f0db71b5887be492d57723723cb196ad2f9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/perl/exiftool_12.72.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.72.bb b/meta-oe/recipes-devtools/perl/exiftool_12.72.bb
index f1d17a6799..68e7a79436 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_12.72.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_12.72.bb
@@ -22,3 +22,4 @@ RDEPENDS:${PN} = " \
 "
 
 CVE_STATUS[CVE-2026-3102] = "not-applicable-platform: affects only MacOS"
+CVE_STATUS[CVE-2026-7580] = "cpe-incorrect: The current version (12.72) is not affected."


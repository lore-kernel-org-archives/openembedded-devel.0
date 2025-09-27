Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D29CAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:33:06 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.6890.1758954781982866377
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dSJQOHuc;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-42571b8abbaso27584475ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954781; x=1759559581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0q0xoNm01AuHGXjw9Ae19QeayLBZurRW7Lu+Qw1Uv8=;
        b=dSJQOHucBMt/Je7687z/NXcWG1/3idxKj/L2WD8uQDKu+hDCCwhwFHu/WcKyUfso0p
         /sXhu9OyFG8FgWlRtctAsSfpmrko/6IVfEUX7RMHfamO4CNntvoNdB9dgUJIyYNbiySb
         eGTZNnua2S+NY0GM/Nkvzod7Q+GXZjLzGRGDkEcxdXWcpbQLKLvLudN00vWDHFIqZkCd
         bXTWx5NE+YMI6697IJ2hFLeg89j9RGNwhJ1XZfDjqzStvpE0rjW4OtQ+Lmb/V0TgIgGR
         +dm5HoL0Sqj58giT6dOuL4RIQ2XoQs2Yhe+R6Bi8UC3/k2o5VQcdv4KwWrFAx1zcaU8p
         5Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954781; x=1759559581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0q0xoNm01AuHGXjw9Ae19QeayLBZurRW7Lu+Qw1Uv8=;
        b=UUCuO4CRk9w742JiTuBnK4lcyuDZRuq7gnljzHgmR6VZWojnH+/KXlPHSHUXC76BP0
         0G+27WiJnZzTsINFUo7NRJtkALoVxmbYBj7piqpPK+rauXeIyMuq8yIpeyjgCxZ+q/8e
         2DsyBMz3EjV5bnrrg4ehlMK74fQ8N1yNjVszqPxf7Q64iXT72c5izeADo4nCXBaeFX1q
         cBtxwcG2P8/9qglTSxMDv2xhnA/417alnWLzlWpuCsZ2iVBsu5pldwPc34EYRiaILm0w
         HAvcQiYFrIzjtSDpiXtYoSwsCgMx7Gj8grbRVwq0uckoZJLKUTT8J1LvAG+bj/I7bSk+
         cRYg==
X-Gm-Message-State: AOJu0Yxq3BbbqyVgfqLbdfPIuEAOr3N1iYoeBrDqSS+QzdGtSVJ9pkSB
	/G8IeCirGtfb+592U4ego31VzAfFIw9HAmc1I3XMK6oKzsAsyhxcQbDNiub9kQ==
X-Gm-Gg: ASbGncvZmhqBzPQCVvn99cXjPmU91EvCBTgWiye57lsdUb1/YyAmhLirrfr2jbKQIwM
	X52AugAd74ZlkzrOdPDNUVVgJD5Z4+ZQMUwJ25H1mUEyBvpImZhMss6q2E/U3TiCqNAlJZMTCDd
	iuBFE/J+0WhkLue0XunXNrLK0z5XEUtxAt8I3fbT1UfywuFr4bQd3cEN/B0l0SoDAW4PR1eRNeO
	daBGEjfeeF7Zna11n+MH62bMyPM3vXpFxkEJMCDKj1NGsPkr/WuIszL6kQqpiHrKQIosJFjo3uK
	61bjwv+i7mOcgJPmZkSiiFBFmFzfC1fJgC2nRzmcB30kVYvBVDw+ANvOkful5uVyWiwInFfHMzS
	d/gbf5iqa/14he/ZI00sI11Y+choxPwclGcrKL5kg3GJaHigI1z8P299vwLXv3VyeRRAdWW6E
X-Google-Smtp-Source: AGHT+IGnEClHoKi4Sg29TItPN/lwuUDCGX31ruEGwbuJPtQwfFlNPmg5fvmi/hhNBcChydceDFVqjA==
X-Received: by 2002:a05:6e02:2142:b0:424:8881:5f8c with SMTP id e9e14a558f8ab-4259562e2e6mr78040635ab.24.1758954781011;
        Fri, 26 Sep 2025 23:33:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:33:00 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 14/21] php: ignore CVE-2024-3566
Date: Sat, 27 Sep 2025 18:32:09 +1200
Message-ID: <20250927063216.1865627-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119968

From: Jeroen Hofstee <jhofstee@victronenergy.com>

CVE-2024-3566 only effects Microsoft Windows.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d68c56e1ed2adc8246a18424ed5d9ede5e8254a0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.4.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.10.bb b/meta-oe/recipes-devtools/php/php_8.4.10.bb
index d74552d5e2..ed169742da 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.10.bb
@@ -39,6 +39,7 @@ CVE_STATUS_PHP = " \
     CVE-2007-4596 \
 "
 CVE_STATUS[CVE-2022-4900] = "cpe-incorrect: The current version (8.2.20) is not affected."
+CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
 
 inherit autotools pkgconfig python3native gettext multilib_header multilib_script systemd
 


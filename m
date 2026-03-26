Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B6A10A1E6B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:03:30 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45488.1774523000998886756
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XY2y9uud;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8299f1ca894so426655b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523000; x=1775127800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wf2mGR4zg4TdwjwgkfURNJ0qlyq12GgGAeeLjQtE2E=;
        b=XY2y9uudS8sAm+aI/YaFBGENbcYLIJ4qH9UlEQV9HVtIBU0jt07X3uvHKckxtJyQpF
         p0PMC/zTxW4FUyEchoq5Kpyo7yxfl6q0/Jx+zmMEeKJ/WMHSiS1VAM4s1xMhsUjWz7Em
         7SzybDFJ73cn2UGheTlO1tAZYucdmagRO8eUID/pzLg+HUNOWoyvCE+9FNep5lij9BDK
         Z9DyugEt6bFSH31fa0fW1yBLiSGUNkvxmb2r91pCYgyfGlEj0yRK+UJ5JYNpaYQA5n3R
         Bx2Wra8BAfZv4smhtGnhMU1scoYheaVuIJKpsrSKGGYCyKg7gTSgvnu1E0u+u/PuS2Em
         vthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523000; x=1775127800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wf2mGR4zg4TdwjwgkfURNJ0qlyq12GgGAeeLjQtE2E=;
        b=rN/bckCc2Gzazisi/AJySI1N7MfRp+Sk+hqPVlsmxubbZA78LHypxAPfP2p4ytm8dI
         ARTgef0+tkdMBe72SceikLbWhdg4/i/947zHfloEdyq2fbG9BljG40P8j07t4zFGuk+c
         O9AotZFnquh9zP3dCSVkCfwH41C+hT32NmNjwp3XUA3C6K5zIHdbDS7UrNC/qP929zNg
         8t7nMCko3a9rrYfAb/FBoskjAsvORUKQpj9kYtNKsxA0mMskjbXupuA047w7vLjbWE/r
         jzwaC5R8ZTA5jLFv0tawzGjchaPn3VbAfRw1viJSuUdQE4fQ4SYkvecNfLB0a1gHiFjA
         wLKA==
X-Gm-Message-State: AOJu0YxprEvdpCuA3u9txle532bjPaqx+6l6xKw5+3gsesIkxQM/1mOp
	UzfOLGcIY8So3MibB2Z3wMCuv46FFFqWEjCMd+NcYdrQElzPqRYgX8WVYtT3TUWk
X-Gm-Gg: ATEYQzylE+uwT3ybhKGvBXhV5AKGh4K/3F4dGKiwPMzH7yLR1DbopIBHZd/2qtP/SmI
	hUuE4gQJNlkCM3Gw/89NhgbZYEkM6oR1Nq6gf7/ZLfV4dsrK0KwSx6rpSK5PSewsGgYlv8GSErf
	L1IqS2musKEKz996uV74i4FpJK9j5ftnsb7FhqgZ4jj6I97rkIybU8aOW2HSdwRstO3UTm86htp
	NcipTHkzEiqgf8/zrieNIfKTufx2nKpw2MjrozT0og4PmTosOHOQTMXgDemrEnMKdK7KDkkGOLZ
	a37Uh7FQ5Jqj4nVAyzLnm262PXcgQWwMZb8+4A1b27b8xJnfRNhXZrVznNwKO+zy6ER+WMNTm0K
	o4qbltSDS57wdyRadaJLj+qJAUR6sPVDU966mEze/AdgZmeziYgZyjjcbfzBGc88YvXzL813HbS
	LV+r2v3nH43t/yRCfsEeNOhgLk7v53xe8VyBc=
X-Received: by 2002:a05:6a00:6c8c:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-82c6dfb6788mr7022606b3a.32.1774523000049;
        Thu, 26 Mar 2026 04:03:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 1/13] mpd: upgrade 0.24.6 -> 0.24.9
Date: Fri, 27 Mar 2026 00:02:58 +1300
Message-ID: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125642

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.9/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-multimedia/musicpd/{mpd_0.24.6.bb => mpd_0.24.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.24.6.bb => mpd_0.24.9.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.6.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.6.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
index 0d5a06931e..cb6bd1569f 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.6.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
            "
-SRCREV = "c426749d4709e8d4ec4a6808c004625fae37b60d"
+SRCREV = "7a9afa059e95668c912f779219ee8fe1e44dd2aa"
 
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)} \


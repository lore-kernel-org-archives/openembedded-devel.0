Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.28698.1595770179684947348
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 06:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=g7PvG5L0;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.182, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f182.google.com with SMTP id v4so4730591ljd.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 06:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ZR9AIyCsUm2zyyV1B78ebOGqvo0dHMqcN4D8NTbTq8=;
        b=g7PvG5L0vR5SdLOWG9FYU0044R1VvP/gQkI4QjGzccizg7NhqJhWOSKneDnsCu1una
         Q8sJt6BIayOVeVeg0mgMit6MxUK2V+6fpJTI4NFrnSM48vFFVaUUHct5r7rrY3Yn8l8u
         w2s27ej5gOCxSO/7XMJupO+ysV0GQVz4eVs8O/km331GfFjETjYTFXka9QHdzWYUNu56
         +WcrMgsacgaFi+nBKOJHbKPnbkKrjsDiR1XvoBwEFqiqbDxjPHJGpIb5wrw4UMVfVR5/
         deKtlHtJcFiJI4sXksREv/sODQklv1/yxQDxxpae1ARrutR1rrd06yNz4kf6z8sX9gIu
         XVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ZR9AIyCsUm2zyyV1B78ebOGqvo0dHMqcN4D8NTbTq8=;
        b=K3ABFHTH23rOEO8A+1cnRHQ1XjyWmfA9WNiwddTroDJh6rKGMmTpgvSKmM/Af2LENv
         YMg3vRpKjRhkGoHmZJDeH5usqZxCA+ehMvAiItuoMRBqxdSYMVflR2DpaOdFMpXZN4Hc
         VTtDE2JZmMVNd44oSlTROIo5nvULmoDteljTkyYVPCRjkWV1v50pJSuc1b4MrLGWq3Rm
         RjBHn7Ju2DTLXt0sS4hzq1xWnZINGHKECyTBqsTUfVVgZqP2Ows/Ujdgb8c3xamhySyY
         Xnqb4V2sSK++S6H6n6uv+lJTwTXxNwJljXsTfzH4/4lf+0uQ7uvHPPyECIl894GiUbWc
         6q+g==
X-Gm-Message-State: AOAM532wlGtGZ6H4CzHQmPh6bUlzSPX88gyVfKAr5s/t+4EgQ5yi3XY5
	ewNU09rv4uK52r7gX+yNMgS8wZKdelQ=
X-Google-Smtp-Source: ABdhPJx8e7BNklSfc7Z7Fp48rduDYRDrUwgLd4XDJKwUTdvsgaZ9JXd/aNXePDPGUGpRe6K+eAiDMg==
X-Received: by 2002:a2e:9b92:: with SMTP id z18mr8885930lji.364.1595770177371;
        Sun, 26 Jul 2020 06:29:37 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 193sm2624211lfa.90.2020.07.26.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 06:29:36 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libteam: update to 1.31
Date: Sun, 26 Jul 2020 15:29:35 +0200
Message-Id: <20200726132935.174039-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libteam/{libteam_1.30.bb => libteam_1.31.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libteam/{libteam_1.30.bb => libteam_1.31.bb} (95%)

diff --git a/meta-oe/recipes-support/libteam/libteam_1.30.bb b/meta-oe/recipes-support/libteam/libteam_1.31.bb
similarity index 95%
rename from meta-oe/recipes-support/libteam/libteam_1.30.bb
rename to meta-oe/recipes-support/libteam/libteam_1.31.bb
index 9cd02b0c09..149cfb8d23 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.30.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.31.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/jpirko/libteam \
            file://0001-team_basic_test.py-use-python3-interpreter.patch \
            file://run-ptest \
            "
-SRCREV = "471fb50d206e5a3f2eef9e4247329b51edc5c493"
+SRCREV = "3ee12c6d569977cf1cd30d0da77807a07aa77158"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.2142.1614804124480772185
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 12:42:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZY7/2Y2X;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d8so4304589plg.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 12:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xEQ4Rg9V5Bsn3xxHavUA5Pb71a1FN306P5zeV6IQdjg=;
        b=ZY7/2Y2XiOyy1CvEY0ObJSazK3Gpd30JgBGpC7v+plilQLf8c0CGhKi+F0noVdJJYi
         ft5b5WE9eJuhNCnZEswtnCWY34lMVxDPgPrUNODlXQV6RPM55oFqEDp1Q/4stXFdmSBF
         x/swwlj3gkL0N6TUS+CGzOisP5Ap0a0IyZyldtLV5us8qosXg1r1Z82oT9zj7MBUoIAC
         uMwnINJe2HEmx6H8HMupLowdmmSjqsKjgSJhAt1ITSOI/UUjKNIZzGE2ZYrMhe4j4sJC
         reRAqrT40TG7hKCuPoUMKmaOhqeFh9zLZYUM3isQX6WRxpfUGWyIULHwJqSu8d73DS1y
         sVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xEQ4Rg9V5Bsn3xxHavUA5Pb71a1FN306P5zeV6IQdjg=;
        b=pPTtPueCeOKb4LPdKsRsfO+EgwdE77J+57cCyrB9/LIH/b62jhkC2wWNiKBGCrX/Uq
         RZVBDGK6FPgiHJlaf+E86gOoArQvWYqxuYZjoUH3d+0xLCk8581AJcQ5KH+8IF8eiQMA
         AVDxgGqUPmfxBUlz+ipWy6PZ7Oe9jXz9vidJNk7ylqsfnfzkHFKl/jV+6olE4kRGDGps
         txjcGY9SzBX+Q5cPvEDjixPPrGj7YtTJJd3FWz/1LeG9GGyf72XS/NKk693VEgFMRBPE
         HDRPBQTn4nmZgEvXGxLJgowm3lPHOYyVjP7BZScbs+Ed9kc4L1i+xkiMYHwVcommuSDV
         R20A==
X-Gm-Message-State: AOAM531jtEjK69H7qlAsv7WCP3h2poHpCKfztsav/p4yL8yAdssWqwPq
	mTEOvS42H3MPJ6IA23s9VpXiYlh7YIGyVQ==
X-Google-Smtp-Source: ABdhPJxFCK1L/Smb1aKG/G2ZK/F+9OWalIMQWb+6VnSHruZ07awHngNbPVtSvTM3x5qnoDLaFz57tg==
X-Received: by 2002:a17:90b:3615:: with SMTP id ml21mr896669pjb.72.1614804123499;
        Wed, 03 Mar 2021 12:42:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id g7sm23065304pgb.10.2021.03.03.12.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 12:42:03 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] grpc: Upgrade to 1.36.1
Date: Wed,  3 Mar 2021 12:42:00 -0800
Message-Id: <20210303204200.2864203-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog
https://github.com/grpc/grpc/releases/tag/v1.36.0-pre1
https://github.com/grpc/grpc/releases/tag/v1.36.0
https://github.com/grpc/grpc/releases/tag/v1.36.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/grpc/{grpc_1.35.0.bb => grpc_1.36.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.35.0.bb => grpc_1.36.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
index 363e2b4680..6e2707dae4 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
@@ -11,8 +11,8 @@ DEPENDS_append_class-target = " googletest grpc-native "
 DEPENDS_append_class-nativesdk = " grpc-native "
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "627a22541a1836ce00cdc40a3977aa8928de98bc"
-BRANCH = "v1.35.x"
+SRCREV_grpc = "3b7f86e3516746c5f0db1947e0d65e94159bcb12"
+BRANCH = "v1.36.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
-- 
2.30.1


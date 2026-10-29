Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7744.1793266025574343607
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=t9ev/9z3;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso11731655ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266025; x=1793870825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wloV2N7HqhzOjAFZfX4AF/ebEpneYUlhaJqScnv6OcM=;
        b=t9ev/9z3KwhPgGnJKpbVf91V3QfZmj0yk6fLuvEf5/lj0+zfYkt5Z724kTVzFWCk/O
         BYyjhPEh+4SJgYW5QXh1lvQf6j1LDnJ/Kd4EK5rHn65Z5ce5Rb28u5ih5ih1dP1hUWxQ
         5UO0+i7d2YKI4JZAIV/YbKRwjs+ziRCOmdA1SLMOPMlAyHWC/j7rj9vrlsM7vI+ZA6DB
         os6mN2BChc6+5C5s6VRqjBfGC9kL9xlxSQgeXoNsCjA0zgS2Lp4FGrEXckQHny8L46gl
         yFxwbXTTFS2K+Ee4KRgzfLnnwItEZqxPc5QqfvGkg6lURuHLiKOvnm8nubjmm4l9zKYd
         pkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266025; x=1793870825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wloV2N7HqhzOjAFZfX4AF/ebEpneYUlhaJqScnv6OcM=;
        b=Fh6Cf9JTmTKyM9lyzour1XbhjehCTPiCP0MYN6f+p6WxP9XhY96iQBTsrashNrJDyh
         XojJ0LXWlD+rUCpEnofDaKMG7C8xJGQslZqhJPb4Bk0N6AnP7djtdG/dTh8wpzHaYnEO
         SVJaxltb2A8wJsY5NDgVT+h0TNhNyrOzYqGA9UnNDTPq5/XWHy513f2/CUBxAH+wIglt
         xE1QOo8j4kbRwA+g6Z5i+sGKTW1JQPGJ8gAY8qYgGRfUiLEC3ETUZrmRMDhvFGbP6E16
         0DKyTsjQMNsz/EKfAaepSHCxtdhJcoeuxJKfPhFvmJwGaZxeM9Mow75qFTgOkPbrABtW
         8iFQ==
X-Gm-Message-State: AFq9FYJktSiu46pH/D+4V7LNGEAh0ljbJ+N13eU9pk0XUzw8adRd0ciQ
	sluUsBDvoiJ6BGq5Gzd5YMasMoHmrqjGfkd8rdbSCb6zLkkKuT7KY34NifeL2A==
X-Gm-Gg: AYBFou1H4xK/fpue8jfftZxLQOw2qxHI5J5GzB/l/2hk//MhCtYj83/FhN+8ticoSQZ
	kpqjcVIovEXtndE6InK/MEk5pcLueQ96Aw9hYdxVIno736d2gi9LesM4HZTuGvSkQBijkuGnH0X
	7g/nuFmRxUJTBFqv+SplKbKdktdefSpUD9Qx7VCC8EC7WBIdyBPvvicvJrbmlip21NeamDpq532
	a3ibIHFSUW4GopnjiV+PuPnf3ZjSRNPgwss3YPKKZV+5GREhqmJzr445wBipomid9tC8NbnHAqR
	JPzSZz73I7glUjVEzeri8ADwE3A/sg7q8nvdtK2qdDDnBmV7BXsk/tSz1g0vqxGkfciEXN2/A4y
	rqyZJWkjnFcgHaZ8G57CLyWmDNM56OXyVG7zbrhOJTP1OMP88ZX50oay0o9vL8nEG5Irx6Bqx1W
	GV+LUkAPIiW7Jyq/vce2rNBN7U+Y0crTuZJWETN+2rT4HCdaQwpNZlkuUzLpDf0Cu+ctNSAGJT3
	PvFSp1/u6crwOwNBrp+cfgU9p89laIyLoq5j4x5ZScbir90yP5+kP41hcJqveFym6h7RwUaKuzK
	mj9CkonL+sw6mj+nXmWNkFV75cI2KVBl2KbsW/LmdAbRkUrPKQC9f+YqSlB2HQ8BnK54h0INQNj
	A9E6ddUM=
X-Received: by 2002:a17:90a:e7cd:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3ae580a0206mr3768338a91.36.1793266024855;
        Thu, 29 Oct 2026 02:27:04 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e874bebsm3513079a91.14.2026.10.29.02.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:27:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/7] neatvnc: upgrade 1.0.1 -> 1.0.3
Date: Thu, 29 Oct 2026 22:26:44 +1300
Message-ID: <20261029092646.3634215-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029092646.3634215-1-ankur.tyagi85@gmail.com>
References: <20261029092646.3634215-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131653
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/any1/neatvnc/releases/tag/v1.0.2
https://github.com/any1/neatvnc/releases/tag/v1.0.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../neatvnc/{neatvnc_1.0.1.bb => neatvnc_1.0.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_1.0.1.bb => neatvnc_1.0.3.bb} (95%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.1.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.3.bb
similarity index 95%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.1.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.3.bb
index ab462bcf08..68272dfb07 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.1.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
 SRC_URI = "git://github.com/any1/neatvnc;branch=v1.0;protocol=https;tag=v${PV}"
 
-SRCREV = "4d6d09b544d84b836cf1906735354b4e694a0c1c"
+SRCREV = "783437adc56c2d7ce2cac1ec584acad798594267"
 
 
 DEPENDS = "libdrm pixman aml zlib"

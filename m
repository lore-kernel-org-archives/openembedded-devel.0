Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.611.1614190191983021625
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 10:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=an0fC7JP;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id g4so1999472pgj.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Feb 2021 10:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NvMLTw43KHPh2r6kk9Lg+ccu4LQ+hpu0Cyw9/jhF3FU=;
        b=an0fC7JPvmu8Vx1VsqsSCuOVv9XTyfOT5JL8yPCm0Zz4FhzwyoIdJzt/GP7iFd+TH2
         iaTqFzGTn7sp2OpzT4SoWYdRgS9XDyNQd3X9eU1dQc+uY0Uuy7GEk4ZPlS8nl7Lu6rss
         lKFb4e+WdWU07AvxkWR7z0gTTF6mtKzMfeT3ULKjAnhB8PpwhMZDX5RfMbdZn5HvqPmJ
         7j9YwDkYUIyWcf47T8erp4ZulzS3f6jbgzvX/DmfUsHkSSeDawnzB28cQM3UtmDuiTIS
         7tNKS3/VEAulm9vL5MDnLowSB4uVASQtz/2rYLFyRvNearrdxNBJSL3GVJfZEIXkNbHJ
         zRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NvMLTw43KHPh2r6kk9Lg+ccu4LQ+hpu0Cyw9/jhF3FU=;
        b=BlZWUXtjx/TXpTZ8M1MhiSg5jZlr8XJ5DUQW9WMk7l842ydpKe16G9aGzkkmSF261u
         L6P2uLaGzPIuVi9qv746LAICy2YEAHq7v/CHyaMswGgaOmvlzZhp8VTsZc867W1NDQPo
         cYJlEeMJx6LbZpekfCMCc6/hFGAEgYA7CDlCxYx4bP06W0Xr0gxv+IIPxeu9x3RF7VBa
         DEThfnWNtg/JWVJsxXVle/UWtq+pSqMogg1p9QExZMcUPxCVHyyQjGA+6UfaCyaSReo5
         jQtVeiLoARR2gO3FsOidw2a9lWznztiarkzpG6ivZiWk0d3BGFnUgVAx9atuLuUcVTvG
         1tWQ==
X-Gm-Message-State: AOAM5327K8gpIkGVZWxSNUwhRxe6ELQ3o+ABIAxLaf1sWIqh4WyVQbYn
	tfrEnaqk/SYqLZeVuLdM2nFJb53meUolKg==
X-Google-Smtp-Source: ABdhPJxidqou5EvDhuK7R71FhmmHk4g+lerbmZQuV5jDqVgOjbpMxJgS5H5IOclIgtTxezTuhwDAQQ==
X-Received: by 2002:a63:1c13:: with SMTP id c19mr29062655pgc.359.1614190191069;
        Wed, 24 Feb 2021 10:09:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id w187sm3326169pgb.52.2021.02.24.10.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 10:09:50 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] influxdb: Generate checksums for term module
Date: Wed, 24 Feb 2021 10:09:48 -0800
Message-Id: <20210224180948.620602-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

go 1.16 does no longer regenrate them with go list command
intentionally, Therefore add the replacement repo checksums to
go.sum

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rm-module-for-mips-ispeed-ospeed-termios-abs.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
index 3cb2090d19..6e87b9d91e 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
+++ b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
@@ -18,3 +18,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  )
 +
 +replace github.com/pkg/term => github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627
+--- a/go.sum
++++ b/go.sum
+@@ -215,6 +215,8 @@ github.com/kr/pretty v0.1.0/go.mod h1:dA
+ github.com/kr/pty v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYio2l3bCsQ=
+ github.com/kr/text v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKSTVE=
+ github.com/kr/text v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVham/4vfdArNI=
++github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627 h1:3/XXm86KqrOZEJvEmFlzl3NTFA99n5Pd/cSXl60LmuA=
++github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627/go.mod h1:BYR4E+NOQrH+NhXE71KuBNmyR1lQ+yDvP+O3IIHO5bM=
+ github.com/lib/pq v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9A=
+ github.com/lib/pq v1.0.0/go.mod h1:5WUZQaWbwv1U+lTReE5YruASi9Al49XbQIvNi/34Woo=
+ github.com/mattn/go-colorable v0.0.9 h1:UVL0vNpWh04HeJXV0KLcaT7r06gOH2l4OW6ddYRUIY4=
-- 
2.30.1


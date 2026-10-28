Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36046.1793161475417664561
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZSNmPvLz;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso239729a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161475; x=1793766275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rqa8FwGsvCcdMRqM7gKRjx2sgMO1lEXjf7WI5tBhJ/c=;
        b=ZSNmPvLzTQvpGfFN4yJfFbjnekQXi8oOwoNk5Cew1ZoVwzjImIMTBsnPUV6tIeGjFF
         6FoUQSR9ta9sK4VubFNr2XB1iHA9bbLzNqZCGesKPTi46278UFeE/0GM6rV3MG6fMriH
         XkCatwmwsqf95pXThuvcPv6rww0kaNXg2w86DcM98MlxmmsvEZ73UItiWip203MD1qUz
         s3AAUPFIzNx8j0Mshhj8rIwDYGp/H+8FkCO/El7t5uvFhoW0eD4nNO3mXnOUnZQLW8U9
         FuBHhyhFkCCwknzxJbmZp0muLrWnKHy/c2JZRyyW0XeCjKuViyDow/jH1JKMvKkXNnmC
         QguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161475; x=1793766275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rqa8FwGsvCcdMRqM7gKRjx2sgMO1lEXjf7WI5tBhJ/c=;
        b=HYWWnaye2UGapL/Xyw2pZdsdODu2RJqYy4kkVHWB6lty3+8o04TpaoecCH2AlmuxOy
         6UD/8P0KdkC0ECsgPHqaY5VJ256e0UWijF36pjNCf91kUBv51zmv81fczWD0fEnR+ZKp
         atQTUMIMe0j1x0NyDaUsb6haGuOcJRo6bvXTWJ2Xq2LoSEInDA97Ge/oqaiLlWVh8BTN
         2esDktUIsLXQxIhGtExz3vOEQ+U8q0yge451IMZCh3HUP1XNojgMIVc9Y8TKa8jRJfiT
         bDwLbq0T5LHLifk7m5s3m45W7bi2C4TAzaYoQkJi0jyjqkjpnXp8dyYNNVX/4cQGKtdL
         CpqQ==
X-Gm-Message-State: AFq9FYJHmR6VBNvKb2avOIERxztu8CY8wYbf+JleiDIRhsoa0pI0UBEk
	Tf+NgT1+SaH4jRD0NrWvo7JFhskyrkOQTwcJLkOoM+PSd5Msdw7SNONLxZgmgQ==
X-Gm-Gg: AYBFou35l5oNqmhCEraIXTFoydZzY41g+sv0I//KCoYpXiN1IdjYhdjJ9QWFQdj0j2K
	itimAntYHb6RbExCCMBrqw0P7WW+V7ipW7XIHnHTv9JoKV3m6KRrs0eigw2B7is/yZ6mv6Ni3Vm
	WuxuGWUnV3zfqwendFE0uQeB5P3hBin1WK3/GSynYbEcCOfU+Qs6s8BcgaLGYMgNzBv2Ut8awAm
	XDqLRMKf9tMq7udcYKgQgJMr9G17HLf0EHCxu10NYWrrGk99iiX+2gS/cHiFQDfO6YsMjZO3QLM
	3013iAXTBGXQNoVUoaofKPL4n5Wwk1EOaJBsLL3s8E1LQzi0AVOSkAxgCNkewLV4I9ALiHzdxG7
	XtOSfzuC4Wa1dpX7rKq9vCxAsjGMFmsENxafBimbbbs/2izBXpGbhbEnLrgNRcRBvju0vcqmFOK
	IQAIe4S/2adi87uM3pWKzgxvfI0W6xj8zbXviEe97+ZzPeyh7MIwgaa3O2uzPZflM0WzE339rBf
	OZLLGfCm24BTw93zxcDggGiOAf5Ypj5nx31ych5nxNJRJwVhM30fJINZV7nZFJ4jQdNDK4lWKgT
	0RHhkROtZen/9uf9Xl5cyZgbJtr8mQvt8aTMokRKVIldeIhrPX9CUKvLqMtO75dfZwW3eW4eECM
	z+Y9g4Wo=
X-Received: by 2002:a17:90b:1a86:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3ae580a0233mr928317a91.35.1793161474795;
        Tue, 27 Oct 2026 21:24:34 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 12/60] libxmp: upgrade 4.7.3 -> 4.7.4
Date: Wed, 28 Oct 2026 17:23:10 +1300
Message-ID: <6894d75451212962fcd7d1b35de6d0c35c2f4b38.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131564
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/libxmp/libxmp/releases/tag/libxmp-4.7.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libxmp/{libxmp_4.7.3.bb => libxmp_4.7.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libxmp/{libxmp_4.7.3.bb => libxmp_4.7.4.bb} (85%)

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.4.bb
similarity index 85%
rename from meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb
rename to meta-oe/recipes-multimedia/libxmp/libxmp_4.7.4.bb
index 1600686229..a287124801 100644
--- a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.4.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://README;beginline=59;md5=b25470e2863502c9ac9886f09c21a
 inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master;tag=libxmp-${PV}"
-SRCREV = "1e0812137e4f9e15cc026c0c75af82d71d3cb5ad"
+SRCREV = "5d4f6aa2c7dcdf8e9cd8129fe579d45b36a302da"
 

Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC2CC2A075
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 09:13:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40069.1767517977453943290
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 01:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CiUGwgLJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso83382975e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 01:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767517976; x=1768122776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwsiU1j7CgaclQ917JzFDIFVqDEMQxszaVfa1+c/VVA=;
        b=CiUGwgLJ/3BUYfaV9Vo7RZJHrc2Bt5Zsec0FtwCg0SywEMDPlz5qHOFczPkWEOgQIt
         SeqXo/zacW+dpAjlXS1GrEwG3x9Wg+fsliPe65U/NKwb9HWVEdjxFxKIUz2essjLjZ1Y
         B4Gy+SNZQ8FNUto3QpQxZes/Bh1u0RUCCgny9j96ovRCI2tXja/+SiXiAfWWpBDQF99y
         cyz2KRE4h0lWnctRen+JagwD76y0smIo2E7Cm/8jdUVk6jGgtOHtapwmflBg0+ufd1uQ
         7LYHrKUIx8M6EmWSJxEMLo4JrRpUCviCGsWC502bz6EDdmWQ5jXFf3mesbdrDVJ6+FJ5
         bXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767517976; x=1768122776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JwsiU1j7CgaclQ917JzFDIFVqDEMQxszaVfa1+c/VVA=;
        b=KIxuLLLhMAL+H4ofgk8BK8z9dy2/jWuM9O5W6UctEJFp8dBWEPlgrz0qsZ34BSyQAy
         egEPUkYteYqF5gI+W6zstXv76QFKeyzohsEgl/etkpbpaxfTUGIlkyzakBq8UvnP7otd
         X77UUIiX0Qyuabhvp9/skE4IFOzySw5QfbJ5CR/7c34RPomlxJBA8NI+8rQNA6BWzXfM
         mCiZuB78kna6mGX1cgnfWVMKSPgY9VhwB1pcLO8JHx3Pci8zUAekVmG5UZFGxwEQOW8U
         lQJQw16Yz3s3hs0LiXn6T4a657mhe7A1Lorct3AJu3EI1Yikhx8AXi4yELaM3ssSKV90
         0sqg==
X-Gm-Message-State: AOJu0Yy38rfkiw9ztbmUqeFU8VoKOWDayYgf2WEdjpMwnZsFmgFJ6yPm
	HegzlYl4IaUL+zPv52iRLOv96OLUaGnwSdpVoH1sYKiBGVcf8+viginGjM2Ccw==
X-Gm-Gg: AY/fxX7wp/ypAx+C21ztMyeeDBLB2qvxIldafhxvyEQ1zwpWorUEJKztjc1uRNCIgMr
	rzZLIP8W809u5PUp4SJojnIJ0jAXpUfpeFpTxAADr4C4Ue/Zj0Or6SauwDMhaAuSFWwSr2cVu9l
	xRrbpmwQdGD2dFT8CglcfL8Vvz3TbiOJL71bQtA41xWHNnADos2msrGYRrzieIDHT3QcEu+3quI
	NXiSkv6xMfkWiyZBOIllcppXflX6MDJe8tJ8yle3O13kp3KLsFmylZCFc+yuBPfYuxHuWU7Hxyb
	ZAuyxBzuOCuQkkIOskxfmX6lWyk5FukzJgwdSTHJYQi/KGN5X2CCOAcyh7JKMeVnp/IbmguFYT3
	AfiC3Ro0bLh3UwjX3l1hJlRjkGK2RwI4xY+W5q41R3HYvsLqc6vesHFJis/iz0LfvuyXR2LHVOc
	iE1zBtA+qe
X-Google-Smtp-Source: AGHT+IGgqtYNsXCiOelRi2rSJFR8bi8aqGYX2gKlXl5XcGreZxyNDkEgNeNkITqagM1SKZnNH0PpWg==
X-Received: by 2002:a05:600c:1991:b0:477:7a78:3016 with SMTP id 5b1f17b1804b1-47d1953318bmr555537275e9.8.1767517975694;
        Sun, 04 Jan 2026 01:12:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13e2bdsm84483275e9.3.2026.01.04.01.12.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 01:12:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] tree: upgrade 2.0.2 -> 2.0.4
Date: Sun,  4 Jan 2026 10:12:49 +0100
Message-ID: <20260104091251.2696384-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104091251.2696384-1-skandigraun@gmail.com>
References: <20260104091251.2696384-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 09:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123111

Changelog:
2.0.4:
- Fix missing comma in JSON output.

2.0.3:
- Fix segfault when filelimit is used and tree encounters a directory it
  cannot enter.
- Use += when assigning CFLAGS and LDFLAGS in the Makefile allowing
  them to be modified by environment variables during make. (Ben Brown)
  Possibly assumes GNU make.
- Fixed broken -x option (stops recursing.)
- Fix use after free (causing segfault) for dir/subdir in list.c
- Fixes for .gitignore functionality
  - Fixed * handing in patmatch. Worked almost like ** before, now properly
    stops at /'s.  These issues were the result of forgetting that patmatch()
    was just to match filenames to patterns, not paths.
  - Patterns starting with / are actually relative to the .gitignore file,
    not the root of the filesystem, go figure.
  - Patterns without /'s in .gitignore apply to any file in any directory
    under the .gitignore, not just the .gitignore directory
- Remove "All rights reserved" from copyright statements.  A left-over from
  trees original artistic license.
- Add in --du and --prune to --help output
- Fixed segfault when an unknown directory is given with -X
- Fixed output up for -X and -J options.
- Remove one reference to strnlen which isn't necessary since it may not
  be available on some OS's.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/tree/{tree_2.0.2.bb => tree_2.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.0.2.bb => tree_2.0.4.bb} (87%)

diff --git a/meta-oe/recipes-support/tree/tree_2.0.2.bb b/meta-oe/recipes-support/tree/tree_2.0.4.bb
similarity index 87%
rename from meta-oe/recipes-support/tree/tree_2.0.2.bb
rename to meta-oe/recipes-support/tree/tree_2.0.4.bb
index 08d234acdd..4bb49a377f 100644
--- a/meta-oe/recipes-support/tree/tree_2.0.2.bb
+++ b/meta-oe/recipes-support/tree/tree_2.0.4.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "https://oldmanprogrammer.net/tar/tree/${BP}.tgz"
-SRC_URI[sha256sum] = "7d693a1d88d3c4e70a73e03b8dbbdc12c2945d482647494f2f5bd83a479eeeaf"
+SRC_URI[sha256sum] = "b0ea92197849579a3f09a50dbefc3d4708caf555d304a830e16e20b73b4ffa74"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"


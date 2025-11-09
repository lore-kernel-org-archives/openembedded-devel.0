Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EDECCFA1E
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27202.1762704037538983903
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OSpg7mIz;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so10963555e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704036; x=1763308836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIwk+O4kKBZHFAyBz0bMX6Cu5TJmB9WCSU55IfRNX/g=;
        b=OSpg7mIz8vWF8SHlOu9eP40c+iDfwpnHQOT9QaCH2+NdhfQuWjYz01ueToxt/kmnZ4
         eviiK42VaCe6coFsGxA0g24hbBiKr1FarvtFU5MJW3IDbRNxzAV5RJ8W5dFBuZ+hnhA9
         ax9S2tb6YTQp+iGHELRBTxBDekaPnEI/2F2GMeB45L2ZIdHHymUq3/dQEVWPT+ENTIM2
         q+Ats4MveXvdmy4+P3iUpUIS9V7RVSTxsf9gAoB+ROkrUi2oGcOczEW8ZdrcNNSK8h2k
         P4Y0eEeiOEY9r/PY7FmgM1z87dKGU5T/424GOaM/qTRq/ygLM8bMM7dAtUDxwE+DaDOw
         50cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704036; x=1763308836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qIwk+O4kKBZHFAyBz0bMX6Cu5TJmB9WCSU55IfRNX/g=;
        b=cIhbQRqhou8v3YGeefxGIhqfroY7Lme033qsQVj9r2pRiZYoQSvg8DavkMFbITwo8/
         Uvs28+nFH5id2m5ulIRvUCUKQtW0ww6Z8gNmLNPuZULimThiLKEvxtvSQuzZryWEHq8W
         CqF0wiYTyiTj+bgtlIVljsJ01hbFZUL40dD42wmW38NafdzEZfxnyJJnayJQRoGyi/HW
         X1D6hqm9Bq/bkVAl9cqh0BRN4rpLQG+povavmcaS/nBMfsYVTXSlgMgasu/BlP5AabbE
         kTvbI/jb/zNODOW0qPL0sozrI2JQ/Vj72F56y2dNbBVuVqOsq7zpDfTArncGZOK1L9AP
         kffQ==
X-Gm-Message-State: AOJu0Yx0sj4ikzptoniH/gSe7VTyLjJS4GlcfoX0DWR1b6yYdtGwsydT
	+raF/IpL1WrjH6IIAYK3xWGHbNSqGdOxrhWsST+wqGZDsV+UPbfL8oPkR1Fl/2D3
X-Gm-Gg: ASbGncvpCfH+Cugcqrw40xDuFf5U+H5zCwa0ccp/WaF3jwLXXp8BVBuzd/fxvPDZWfS
	aRY20o17+TbqcpGDI0iDjZaEq4bcXtAO2eN6AePy1LNdcJIGJQio7vd6p+VygzhRrUITYUi8est
	ZzWXhCyB3MDQFupyEy9G6MTSTvgXpxnUiB2aAKgP1GHN8Uqysfx0BhC7XNQgXOOY/x7+UKLDvM4
	iM2tYIbCOiLlNRUZfGME5wOZh9gu+MjXyMn0RVTnycZPrTMOoxQviYO/JywS4l46LBxZQfMw60d
	1yMgAbnRFHB3Ly7YX5OKHgitijUW+9QHuNS7rqmITqpB9y0VVZBxs3ayOGL/YfIn3btFCuuWv+h
	tLTKQxmGNMRGLEhpnAIESH5yoTEQwAFqDgDuBHS1cwbamhGWo3KLGLL3B7nwQ0euwPjyAIFGdVA
	==
X-Google-Smtp-Source: AGHT+IEIwpbAkaId5r1BJtLV0n+yOLJPNAmo2DOUVz52DFQFq4KDTnqZW3JIEj5exdvdReM7qDIBzQ==
X-Received: by 2002:a05:600c:3b0c:b0:477:f1f:5c65 with SMTP id 5b1f17b1804b1-4777328334fmr45563145e9.23.1762704035704;
        Sun, 09 Nov 2025 08:00:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][scarthgap][PATCH 13/27] yaffs2-utils: update SRC_URI
Date: Sun,  9 Nov 2025 17:00:05 +0100
Message-ID: <20251109160020.2522353-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121429

From: Yi Zhao <yi.zhao@windriver.com>

The source repo has been moved to github.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 49c7edb304c010620a8c8f344f9cc4b7c3707480)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index ca5e3302b3..fbb10add68 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -14,8 +14,7 @@ PV = "20221209"
 
 DEPENDS = "mtd-utils"
 
-# Source is the HEAD of master branch at the time of writing this recipe
-SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
+SRC_URI = "git://github.com/Aleph-One-Ltd/yaffs2;protocol=https;branch=master \
            file://makefile-add-ldflags.patch \
            file://0001-define-loff_t-if-not-already-defined.patch \
            file://0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch \


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9294CCD196
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.376.1760475284753829432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DGJpKBDS;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2698384978dso41076855ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475284; x=1761080084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1H/ipdKeGjytMyN0hl/+I6wr3SIrllewKisFWn7BRs=;
        b=DGJpKBDSb2ctpillQr2DUfKACOgVmJXoYcokaYththX1IsZX8vkj78mr6FDBbX2pFf
         EeN9HgpsnfSwDpGoPVNBSfDmmDqK4g8T/irFL4R40nY9cOsa5hSrY2u3KUz9POwT4UXy
         /PucTwp9vGhXkhID6pXXwW5KsW7CX05AUDGpTNRHMNOFSHgEQfCmb+uF0B0oXQjJHKwv
         oKD8Ux//e8wQXyYrM2bN8FVlOzCuYaECPuItI3Mv1kq1qGQ7UBCaql/hRUFGY+zterth
         xwjLHIHqhJg3KRkauNY2jb1L2KpiUMA/s5KltEcDojYdWruJO/RjcctcJ0tLvupi3xIM
         8Uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475284; x=1761080084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1H/ipdKeGjytMyN0hl/+I6wr3SIrllewKisFWn7BRs=;
        b=acz+bJa4TxOzoC6919uyS1bUL5LGiRt6Ldf24pltTCIcxsDi7fgQRyc+As+y5VqJLo
         hR2Q7nGHnPYUkWnaRna/tG3VZ90OzAyFOMz0mjWjRQ7e4GaCRCc8opUVkaBWgcTFq1WF
         HzvvyeNJHGCY43J6MoRtIEMRTOz5aaWyq5tO3j+Up+TZ7estRoHYPLvl/Qy8+TToimIZ
         8P4AjFx2cbN3ip9ZjQ0thhqoqhln0AuZSfGH0Dnthw7P8J1CCvvHZ7uhcKG1pRZ+tSV5
         OR4hZeQHHkHR1R9fwxPvdRvHZnt/Jwb9kSpUM2Komcf4/H/P92tUOC13bGCHzknaBUiV
         C6RA==
X-Gm-Message-State: AOJu0YytND+FbB2rl7Zb68rXEwehWjjQcWp/5v8MO5eQ+GzCdeDQqrOY
	a5yhwd/uw1jQBelzeEJ0RYGW4L9tp8leiQZ/44GeSf107hDZyAJvhA4x/fbgog==
X-Gm-Gg: ASbGncvDEE1mnuEO+TI9wLA4N4OfTGoo7ii7Pul1q4NwjySbUG0InD2GRhmZO+ya3Ax
	z/ls5WMMS6z82IyfD8BTU6mA0hmM/9pvrn9HZLrkBqnS/NMsp4icL+JNUZq/qRFal0BCzwQZpZW
	nWepmm+WQyrbazTEt+XtCO04XhL2MgETJhm+8t+17pzeOm3ps1qj510t+lCbbxYasdsMSHQuCzZ
	YQUAaj9hPvEqsA2kqe9nclGNIzV6u5uFIqEFMgEG7OcsE1FNeSt4zJgxd4Og6ehU6otR3dCMRwu
	saz24oMqEHAjUa8NV0oXK2Gh8H52Wkvn9iZpi6ybUqaHo7/IIouhK5XpfO+U2bKfKasFH3WHRrv
	yRt6Vl7HhZ7viYk2ImaGnVovipjLSoEHOq3SdKB0ZvCJQWCPwstGFpcU=
X-Google-Smtp-Source: AGHT+IGJahdaroHgEGP9KLMXnza0uj/6wd3ro4iXr5Zb8Wws44F45kpNRR2R+Xwv6avAi7E+esiRgQ==
X-Received: by 2002:a17:903:8cd:b0:269:8d85:2249 with SMTP id d9443c01a7336-29027240d03mr281852325ad.22.1760475284023;
        Tue, 14 Oct 2025 13:54:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:43 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 15/18] gattlib: mark CVE-2019-6498 as fixed
Date: Wed, 15 Oct 2025 09:53:58 +1300
Message-ID: <20251014205402.1487867-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120648

From: Peter Marko <peter.marko@siemens.com>

Our hash does not point to exact tag and CVE patch is already in.

We use: 33a8a275928b186381bb0aea0f9778e330e57ec3
Fix: https://github.com/labapart/gattlib/commit/60b813a770e42fdb0e85c1d2da7a55327784b8d6

git describe --tags --match=v0.2 33a8a275928b186381bb0aea0f9778e330e57ec3 60b813a770e42fdb0e85c1d2da7a55327784b8d6
v0.2-262-g33a8a27
v0.2-85-g60b813a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e5a12d52522f10026570a5c48d6662a5359c4887)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 7ad28d594d..0841dc2596 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -17,6 +17,8 @@ SRCREV = "33a8a275928b186381bb0aea0f9778e330e57ec3"
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS[CVE-2019-6498] = "fixed-version: patch is already included in sources"
+
 PACKAGECONFIG[examples] = "-DGATTLIB_BUILD_EXAMPLES=ON,-DGATTLIB_BUILD_EXAMPLES=OFF"
 
 # Set this to force use of DBus API if Bluez version is older than 5.42


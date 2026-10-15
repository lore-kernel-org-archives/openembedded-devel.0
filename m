Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378D0CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:37 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32805.1792043011636701650
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bS45Km03;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2db80fcdf8bso28336965ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043011; x=1792647811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ogtaFee1Dqa18phQLnMc0mQq1Y1XRBGM0jQFbwLfFl8=;
        b=bS45Km03yaoweylV1nZilJ6UV2f5vVAS+ZLlSIzelHCNyClhopu2tocP+BcAZH7aSO
         iCwdK+3np92eIZgyDdH2aRAo1wPxK0Pvb88RbmeNXEiQ16wDO2PRSIzcu7injCHdwT+G
         mBIAnrXDuUBWoAqlQ/g8isR3OeuPxAre69UX4pu2a2px7TESNykVzgHQqbOm9MHI3F40
         FX+LbNsQYmbL+I/zmj6+0Hv23Y0G6RsBnzZrsvV71XvJrE6YmAg+gvfiizJY+XFHLvYW
         IdXzzC29nOT1q20Xy0+6nNctLiEys9WnmBjsQHMsTWzB0aXAA9XiMJxVwYFvrE+dqw5H
         y1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043011; x=1792647811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ogtaFee1Dqa18phQLnMc0mQq1Y1XRBGM0jQFbwLfFl8=;
        b=hV4zgenuO7Q8xb/bjgf7WcBbCbew3hQi1bC1eT5HI9tpLBOnpgrtyzaObs8orwguOj
         ln37QXrAnrAulxE88Fv4NXB9Exe2PuNKAihvpNAGb3gfr+bayp+na/FJZN8JMcrz0eFh
         Oyuh2ECAvyhM5T9nMG0vdX+OwR58ITIXzJ8ynTdEFjL4+6jy9YCfrU46wPpjp9P22I/O
         YCrUHncUvh8LN4xqRZ8r/Y9PtLogmwpqdKVk9uQ1SvLwFnKxsj9lB6M3R+NPHnrJX7QH
         KlVDZpWHoEORt/EDH7eri9y3B9EzoPCKM9wlSU5cyP9kQi+zdUaEE99MFPCAciaW8JYv
         n9sg==
X-Gm-Message-State: AFq9FYIkS3llsxQWYWZbuy8CMkgv+nl4DGxcWpm4iJcNV4vj/C21Skxc
	+6g09VHw+bN8R7gf4ADq0Y/+Uigg9wMBVTOlU1q5SrW9cHXQEt++dYfXYszEtg==
X-Gm-Gg: AYBFou1MO7Qb4m3CVLAYOgAq6HocVya0yD1gTUhs1lidMK9It5f5xBgS7FgjMcZrJa4
	eHbj2k+TUFU/YqRS5fnfSOLfe4/sge1Exx8nu+ngAx+v+LR7yj4Gi2YrWaFJcGoWVZ3puut+l/U
	W+E020hkYEpJehWTubk5W+tXZD6VVpsLAl1HF4ly7gksHrv74sthnGeZhL/+NsPMFQKOJ9l9R8A
	FQ/7FXMYjuhvQjzg5/GBPaEIAOqF/hPzF0rfIje2QT8sV58EGVAJrr++W4keDcxTn/Yi3X17Pp9
	snDwjUk8YDHXlsjrRO/M1WIOP79kPVgKDGzHST31hal/MDE8y+V1hotkGZLUrtcaV4/AJSqFtQA
	7UFgnwlQfvY3uJTpcsBECRD7ZlxN8Jd8D//jnccnEAIIMUYP3hwZY9LqvG/SJpoTUM1YZzc1MQW
	urSwN1K69pSjsb+AQtDQhXtb0qe2ZU6ag+1yt/qqubsgfhshIGiljd7imVVlq1wtwTReduX48SK
	Er+0umbk4p46yUiTq/3Hbg=
X-Received: by 2002:a17:902:dac3:b0:2dd:c100:7cb6 with SMTP id d9443c01a7336-2e842abe6e9mr141974875ad.50.1792043010915;
        Wed, 14 Oct 2026 22:43:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 20/82] gerbera: ignore CVE-2025-23386
Date: Thu, 15 Oct 2026 18:41:08 +1300
Message-ID: <dfc809f9c907a46efc531acea35cc3856cd43a92.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130940

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-23386

This vulnerability is due to openSUSE specific packaging issue.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 369d9629673fd4282cc88fc9b7435de5d1a0ceeb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
index 3d28273f30..ca54cf2315 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
@@ -29,3 +29,5 @@ PACKAGECONFIG[js] = "-DWITH_JS=TRUE,-DWITH_JS=FALSE,duktape"
 PACKAGECONFIG[zip] = "-DWITH_ZIP=TRUE,-DWITH_ZIP=FALSE,libzippp libzip"
 
 SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
+
+CVE_STATUS[CVE-2025-23386] = "not-applicable-platform: The vulnerability is openSUSE specific"


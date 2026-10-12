Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC23CA9ED3
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:23 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3502.1791763815984555937
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PNatTSE/;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab2bf5e75bso621671a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763815; x=1792368615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXETLo7OCgtEZvnkhNWh1tg9VjrtfeNUp4d38wajRg4=;
        b=PNatTSE/TTpK6xxcJm5VcaW7EyBZqeJr1iCS//28/gziL8JxvQRNzE5cW/iIqYz+TJ
         nS1bStDtsPv+m6jCm0cpOe+K/9XU/4Vlz/nUnT1kMZ48fz2QJs3n2Q1MTMDPEVNVsMtq
         EsCQO4ZXPxBnQ90gw+qVRMYgQUm1rfayUeIERa2xKN9UdB/8KlKoj9zQE6Dr0y3hsQDm
         hLAIv/VNhF9c9we5AjbKz6lTjhU4hmgb6FjsTR+2mCNSi4FX4xa0fnUDFN8VplKJLklc
         UcmvaGaG9oplZeGGzkce88PwmbkteDRuj58QPblD1HNiZEqwYQisOuhBlrlkMG1TbxwW
         CQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763815; x=1792368615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXETLo7OCgtEZvnkhNWh1tg9VjrtfeNUp4d38wajRg4=;
        b=ajWxqQ11UVIlJCm+GcjOE8HVJmHovwOED9Vgd7K3PgTYaQQfF4h5GD7JLWWrMzUqQ8
         WpLEyd1M1WlARkJT9xHnOcmrsxxyEWA4J0SUknW4DFnpci6n6CA8UN7+5vy1iiQuezh9
         yQtQBvNE2hC2gbewHGWHA5ia+OueeU/fqCwQfJqR0VL2rvcbe8vVfePNbcOm/Zm5B77Q
         uvEwQnZfS7yNpxPFOcW5nkl2zc4wWjOlrnmJemlT1JXQI8msw3E+T+nWRdk3fDt84xWa
         jP61lOsz5ONAPGxjy3tPqOT4wKvAXsyVqbd54i8bDvPngJLNwLbdtHtnbGZ98rwgOydN
         2u1w==
X-Gm-Message-State: AFq9FYIfdwLVq/t30+q2VMMTwNXIXT/9p3NpZf5AoJcwDcgqkCKB0Wkn
	Z64xcU/sx5ZB+bu0fIrUAeue1a+zTCJBKA+TjwyKCJyPHO8pp42/PTqTcSXCsA==
X-Gm-Gg: AYBFou1uWPtwEfrAgT3rdLly4pmFh+W5/xvhzQYvgcfyVb4wQ3wWw3q7J4CZG9x4eOx
	OPvGhIHyqiSeMJ8HnI3JqQXiSW04KLkS6fx4s7NUX2bKYMCt9UzZZLFlmLJIza6QKtJ0eQWbweU
	cbpXDKXCNWKYE9gk3etk5nhnLlKUkiRdXrjVdkuqsp2fXwu7SIfN5m2qdRiu5FM7BzK9KQYFVN4
	aPf7wBbx7GKNbZq1ZNJdUgC2WohoGmx8i7gRhtEpJWCjQWhgFR+GGk9J/1PLy8hEuwA6i3qNyn+
	Opn0iDMm4eUbeNsRHxHfaHNBVwVKedfdri/bKrwL+OsKg3C1q8RHt2AkhTXY7yh8teCcjusfOaZ
	wuXoV+mXMGPVl1MrICX0PDz0+zh3L0a6BNXkWb4fcfoj9pbOa+m37LIDpL8rwFg7sBIXxUV8OeW
	y7TrfTDPjm4ykLRXqlQrW72mU9OcP9e1TepDKXYGPHmsK9kvnjhuHh8inK5LJLl15zLpfVUM/S9
	aCddQ2jKdSpF0kA9vlgAgriseRMkLglEZrbt43bZDakq/Kp7g==
X-Received: by 2002:a17:90b:2ec4:b0:3a0:cb48:df6b with SMTP id 98e67ed59e1d1-3ab3a955ad2mr6673403a91.34.1791763815222;
        Sun, 11 Oct 2026 17:10:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/28] capnproto: ignore CVE-2026-59704
Date: Mon, 12 Oct 2026 13:09:39 +1300
Message-ID: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130726

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59704

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
index 9909afb0e90..1149913c2b7 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
@@ -41,3 +41,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2026-32239] = "fixed-version: fixed in 1.4.0"
 CVE_STATUS[CVE-2026-32240] = "fixed-version: fixed in 1.4.0"
+CVE_STATUS[CVE-2026-59704] = "cpe-incorrect: this vulnerability is for CapSoftware Cap"


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EC4E9DE51
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:02 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127040.1775718597606306572
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LB5aZnRl;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82cef263bedso295883b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718597; x=1776323397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaFA53NeL6VCnUtNCyk6g5RbE0HHz7d6jRLUI8x43Kc=;
        b=LB5aZnRlyTkDgBDsxVGKoKoBMWdcICQFDIa4IImCU8WX7CMZz53K/1X6A4Je7W95zu
         Y2O+RvPM3kYn8RqXV482Dx58M1p1Z96/0fsfsPJWk6uIiFsoWmuR6SQOeAw7PMEe+6Ea
         hs5L2YYTWCH9ICpw0YB4dTs/r8Z1Sbo10ttMivAwdWhOSwt6YpYl5A1SxBKXEB8Ak6AG
         GW3rWX05q2L7DwHlhG8SFy+x8mhX/f4OFeo7ekK298AfMp08Njv/KAzGUU+sD+oz/jn3
         /X9juksZ1kQcI0UdUZu2x3jJkfQ9xbJ9/fgAtd3zJHgFgxAqzwZYldgKxJ9Y/PaUbLpv
         vwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718597; x=1776323397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jaFA53NeL6VCnUtNCyk6g5RbE0HHz7d6jRLUI8x43Kc=;
        b=BNhyq8twAQT6XgiVLjUrAHQF95HZq/o02Ce/6h1oj7fzjxBQtCH0vC0DxaMFNFO1TU
         JP4Wv4up3eC2eNJzQcpeolKOZLNpSUDT+wfqsrZhG9ywjFHG5pjJHuU4fcWfOUwfuuuP
         phAS5zUtdFcNsVR8FkLeIM8jBLBunjV4zLVsPz2Y0BKynduBzHJQd1jxgkl/ELStRjEH
         ZCawFBOph1lZZKs5bNeSU+v8XPxUIHBRlVyB1WzrBjlx49tS/idHIrorRnwUnPX0jGbH
         YRcJ+gLD4yp7uhOlK7zhXCHlaVds08Lhw4VbQOYdQaZE5t3dQe/zfoI56mhRuVHUfPWZ
         jxPg==
X-Gm-Message-State: AOJu0YxYmhwEVFGEsZ4GtYnTVjN0BKpbQvaFYja2NF9DCQzmM1ogt2Hl
	+R4HD0KJDpV0LG/lxQNDiEP17+1yedgImze19DI+LeTC/+nxgCL2C1JlRP+v2w==
X-Gm-Gg: AeBDietE9dvzYUhFvhTz+eIRckLfjh4U0aMrMATaHYWM+QK0OfxLEUbAXdgO+O8vn0Y
	mXhnnrLDYbn1QkBZMokmuZYM++Ss9fQPyZXMw/m+0JVHZCar8E+unibsj2YsZ1X5dO+VIF3xSmW
	77wmh5rPMvPVv+RyDmFtHvG66nSIXr/aaKl/89kFbTN2MoCmw3aVXzgCEC3hZuLdYF//ZRWC3Lh
	v5811LJxzz828vNSajsgQBESfWZzkl6u7ehSJiDoqQM4X0lAQyOEdm850kzlR0gk2PESCr6kbYk
	8Tb95KnfNmFhbYKqmKBbx4T4DL5I6RwjuROIF1/swVKNDuKeZ+VhRpH5gLq98X7q8oOvuURjm5P
	1yNUfgaCqu3tQZb58qxKgedp0AnPLy/Lx4DFxX28A15a+rhmhLO9MTRGHc3CoaeACQU41xVC9sg
	JS5egCWkW5uCz2oY0qNlaosQHh1aS5WVzO3gQ=
X-Received: by 2002:a05:6a00:10c9:b0:827:2995:3b99 with SMTP id d2e1a72fcca58-82dd8a89b05mr2477208b3a.31.1775718596766;
        Thu, 09 Apr 2026 00:09:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 12/22] freerdp3: fix CVE-2026-24682
Date: Thu,  9 Apr 2026 19:09:09 +1200
Message-ID: <20260409070919.3968586-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126134

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24682

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-24682.patch     | 31 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24682.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24682.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24682.patch
new file mode 100644
index 0000000000..245c3e617c
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24682.patch
@@ -0,0 +1,31 @@
+From 603f5b79dc142626baed8df6b9abb23d390dfc4e Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 10:14:08 +0100
+Subject: [PATCH] [channels,audin] fix audin_server_recv_formats cleanup
+
+(cherry picked from commit 1c5c74223179d425a1ce6dbbb6a3dd2a958b7aee)
+
+CVE: CVE-2026-24682
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/1c5c74223179d425a1ce6dbbb6a3dd2a958b7aee]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/audin/server/audin.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/channels/audin/server/audin.c b/channels/audin/server/audin.c
+index d67937ab7..f0bf96464 100644
+--- a/channels/audin/server/audin.c
++++ b/channels/audin/server/audin.c
+@@ -128,11 +128,7 @@ static UINT audin_server_recv_formats(audin_server_context* context, wStream* s,
+ 		AUDIO_FORMAT* format = &pdu.SoundFormats[i];
+ 
+ 		if (!audio_format_read(s, format))
+-		{
+-			WLog_Print(audin->log, WLOG_ERROR, "Failed to read audio format");
+-			audio_formats_free(pdu.SoundFormats, i + i);
+-			return ERROR_INVALID_DATA;
+-		}
++			goto fail;
+ 
+ 		audio_format_print(audin->log, WLOG_DEBUG, format);
+ 	}
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 43aabf797f..8e53c47103 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-24679.patch \
            file://CVE-2026-24680_CVE-2026-27950.patch \
            file://CVE-2026-24681.patch \
+           file://CVE-2026-24682.patch \
            "
 
 S = "${WORKDIR}/git"


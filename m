Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F44C9833F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 00:39:50 +0000 (UTC)
Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29274.1790469586244353262
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 17:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X4h2H3np;
 spf=pass (domain: gmail.com, ip: 74.125.227.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bcdf41a3so922870a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 17:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469586; x=1791074386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+RNC3o09m2sHgU5jd32fJsbyWzu+VeOOAHJVhuHz+E=;
        b=X4h2H3npVvgg6DSUfO93hnTm1K1lLT8SuDSFLSXrxf3BkyD0ZOLByw1k6SEys/CNEx
         KZiXNtsguL+p2wyOozufm3LMeGzSRC2P7wtsrCIqEnivVQ7LE5utd0rTtec07BVuPkUU
         2gz6ZzveZrkFCWAhi2AkJyT83UeW1NOMq4DhCIPiolgVmHm8iDE3uxICHtsZFRjFFg6u
         TUjlrFyL22GF9DsrK4K+HDfoE4rAyrDAKxd3cBqXfNAHICPwkn2kV/WIboaquorv9Bk5
         1c/3kIQD69UXg9+Cqd4cpUuaIgdwNW3E2YseYdwEWAtLdYJhN40UusgwdMu8ILpzz25U
         FFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469586; x=1791074386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+RNC3o09m2sHgU5jd32fJsbyWzu+VeOOAHJVhuHz+E=;
        b=0RoZnk7l4mB2rzAVbJoNSvmBUrOARWuudCOcFfz38DPuCTHy5TxcRs9PD8ixux25ZZ
         YdC8Iq2+7F5pUg9uZ/AOSPZDtJIyTakBu0NyG42dI3P8mlzuzsCfkK15g2h3Nv+xYqpQ
         UH4HPUztHa9KbzaL+cd+oGZ0dlxc/YkJsRoRtboFYvxCuODzD9N7vhnl8vP6DXFJyRat
         T94t7O2lz8ZXLcs9tzZ7oJ1BBPFM9N6V5+1I5WZDBMHJyy5H0P2/gGfpWhhmxqBJEhXK
         Pe5SvasW1+4/MoNXOQmkf0kESJjz28gEUBpGeM+8/RC0NLildm3nwSFo4lCKjrVW9Nfc
         kDXA==
X-Gm-Message-State: AFq9FYKeJOk4i8sLRwJUTlEnv5Y0W09mfxktPoYbO8eBPgAyPElrCA0R
	E+TMKcB6mcqhF76i4BYiHbsfm0TOEpTX9r+zgZ7rmUWBW+riehn/1QGTj5VDCQ==
X-Gm-Gg: AYBFou3nxxtSX7hugWj62i/BKc9+hP6QPmMTMQLiS7g8qfMZateS/SLAQ5FxPnw3QvS
	mI76IIsOeX4LgLj/lUfELwmkbc3oyMbGkNtlp+dERQdx1VFibHK85he+LvjPqp2v6FsJLhVusIh
	55NKi75qCL/zbP58G5Q2YPFi/fbf7J3cnB8fgaCjIDSryZA2sT1Hgq0YdQ8/KZfs8vKktI3fi3e
	/gLORzlEEU0igCfD+U4eIM/WkT1vOGyqGPyCrOR8HbF7dFJorWyoRGUsriUu+vbkzedu5D0HvQE
	0RRtXFq1ruOvx1jByfSbbY/Yf/MNrTWodZ2afxDpjELQ5W2ND+zJWN20s+jCOENiCW1aHbkpvOw
	We0zrznYsRaZyfDq6ocsoRjJngYFLQvuJjE9Gc0DfylJIexR9nklebZyJGQ0ggutBLdV0o+bKTY
	zK2LZU0z0HP3BaYB7H4fUGfM40igvWvTVnRPTDpjTOnhJ8f3bK7eleaSGPhwKaJduoPNV2EuC3n
	X80n7ryd1z+Ntu3LGXSHEU=
X-Received: by 2002:a17:90b:4b0a:b0:3a0:7cbf:b8d2 with SMTP id 98e67ed59e1d1-3a0986ed05amr8490582a91.10.1790469585489;
        Sat, 26 Sep 2026 17:39:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm2876420a91.1.2026.09.26.17.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:39:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 8/11] freerdp3: patch CVE-2026-85089
Date: Sun, 27 Sep 2026 13:39:18 +1300
Message-ID: <20260927003921.746786-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
References: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 00:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130327

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-85089

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-85089-1.patch   | 28 +++++++++++++++++++
 .../freerdp/freerdp3/CVE-2026-85089-2.patch   | 28 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  2 ++
 3 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-1.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-2.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-1.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-1.patch
new file mode 100644
index 0000000000..78a985642d
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-1.patch
@@ -0,0 +1,28 @@
+From 2ccd047f64930ae10518ea14f476b2f311218814 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Thu, 13 Aug 2026 11:23:46 +0200
+Subject: [PATCH] [core,info] write zero to info data padding
+
+(cherry picked from commit 056cede398d71c1f2540baebc26ec3327a249301)
+
+CVE: CVE-2026-85089
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/056cede398d71c1f2540baebc26ec3327a249301]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/core/info.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libfreerdp/core/info.c b/libfreerdp/core/info.c
+index a11cc12ff..003bec52a 100644
+--- a/libfreerdp/core/info.c
++++ b/libfreerdp/core/info.c
+@@ -1495,7 +1495,7 @@ static BOOL rdp_write_logon_info_plain(wStream* s)
+ 	if (!Stream_EnsureRemainingCapacity(s, 576))
+ 		return FALSE;
+ 
+-	Stream_Seek(s, 576);
++	Stream_Zero(s, 576);
+ 	return TRUE;
+ }
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-2.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-2.patch
new file mode 100644
index 0000000000..90e921dc39
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-2.patch
@@ -0,0 +1,28 @@
+From 1228a148cb3754a78b8c40737e14d0be5030a382 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Thu, 13 Aug 2026 11:24:02 +0200
+Subject: [PATCH] [winpr,utils] initialize wStream buffer with zero
+
+(cherry picked from commit 483c9388119f06bac420d92053cff9ef94e83bea)
+
+CVE: CVE-2026-85089
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/483c9388119f06bac420d92053cff9ef94e83bea]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ winpr/libwinpr/utils/stream.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/winpr/libwinpr/utils/stream.c b/winpr/libwinpr/utils/stream.c
+index c0beba7fc..224459584 100644
+--- a/winpr/libwinpr/utils/stream.c
++++ b/winpr/libwinpr/utils/stream.c
+@@ -98,7 +98,7 @@ wStream* Stream_New(BYTE* buffer, size_t size)
+ 	if (buffer)
+ 		s->buffer = buffer;
+ 	else
+-		s->buffer = (BYTE*)malloc(size);
++		s->buffer = (BYTE*)calloc(size, sizeof(BYTE));
+ 
+ 	if (!s->buffer)
+ 	{
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index edd2fddf94..1c46a8b9ca 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -25,6 +25,8 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-64621.patch \
            file://CVE-2026-66401.patch \
            file://CVE-2026-67288.patch \
+           file://CVE-2026-85089-1.patch \
+           file://CVE-2026-85089-2.patch \
 "
 
 


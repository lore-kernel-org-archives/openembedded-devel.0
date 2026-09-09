Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED634C79FB8
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:15 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7000.1788942731839665490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F4unEO5a;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso5884359a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942731; x=1789547531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKLrWSvqf3a/yL9jG7KC0poyQLiKhFk17C9DrYwoSmQ=;
        b=F4unEO5ayR44iWEiNcyxOa2tZwcNUWS9XofOeOd3l2cr/c/N7UxgOd3RBamCYbW7cC
         KxUuTqZIEO+KExk5e3zv9tf6Wpyl2rsNvAt9WXxvEmR1X4WTvreFMmZeNDoZJ8GojOny
         pyas1FVyVF0NxbhYlJOND/QBIwdbNBjGA5Uhm4QPJg2Vz9+/Yimstg33zEmbl/Y0Ptis
         fIs8k1njJk3YHxAy6KynLDlFt1UrpNXiSNNth3mBj3PjyvYAszDaLRS/b+eHueDwU2MO
         5XSThsPh1fFBr10wVp4mnk+4yfoFVInqJQk6gB11vP16nHGqkPkHqTdYZiD3uSF0i9kJ
         RdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942731; x=1789547531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKLrWSvqf3a/yL9jG7KC0poyQLiKhFk17C9DrYwoSmQ=;
        b=YN+Hkv0FewTAWHLy2lyUzDucURcH8jWa76u/Cpt1zdsI0lJb1M4RIiiSsFScyWTVMN
         32PMc96KGOzqMkbTn5c14oiccm6+He0EImLOYjBotssFgIsgrpQAMFhHITkBIdQy5XDg
         YNZY0r+pwrHFHd1i7FSlhY+glodw8Hzp5jA9MvCaywsa0IqhYjdF+k74Z1bte6CUblKm
         6qekabk7zZqq7ORGEsUN4TwFjqKlWnXUjbiY2oJj+0c9kTDDWnABFhL+lwKLL27V+inO
         mxoKBbkCG2amMNWR3CPD7uKGa9FZDG9k8zeXjKlsxqSYlEgEB1w/i1zn+ITGDtPcCnoD
         2/Sw==
X-Gm-Message-State: AFuF++lUrjrZVbOKUrkkk9IuQZOVJO7GShEyEUoevSlrtRNAnMk0hAYo
	2IVhsGah489zG6DO92CWckmgX1nnYv6UO9pf/XBN2eu2gNHaa5Ii0JDBWGHAUB67
X-Gm-Gg: AYBFou3tTpsb0mxmOdy2WTn1kZPclzbIzabcDN2NqHpJounJgHVfOZIoerQQBHg0b1Z
	+JHJHW8gpMCwI4FXgXsZFQT8+6BtTRMcwz00AuFJPX6DG1P9uRcrlikCJC2DcNA/Z8Mbqa6pzew
	nXudY2+2NzzXZddcVF9Hg1r/URAg+QbC4b92H7HbR8rSHDYhpb1xmZCF8LyvaRhcfIA855tKXXO
	PIWzeLu68bF8GPXmOOBNfoIjXdeHLPFReNRDPQOH9BkKrRfAAm0MEPTHXntbnadLY25iSkISjL4
	lOXWraFnhD94fPk2NXlK5AqigBKerAGYsSMekFJl2vZwa5JV5QrCyO/3SyYrbHEof1tBOjdR/CX
	+77g6IJMOYgDcdoEOs/bCAKcTG5ai8LIzGageCtQtrsgsrMFCRnp0TPJWtkY1oSnM8gsrGMD/up
	CpWSdHd6PmWWo+qDU0YCS6AWasn3/Oqwf/yA5P/XGpe/HJ/qSlPOqptf9qKoQmd1ts3mKw3b7pD
	lMKYM+z6XxUEq54vLooHfQX54c2wJL7KA==
X-Received: by 2002:a17:90a:d646:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39b26214798mr55277183a91.20.1788942730918;
        Wed, 09 Sep 2026 01:32:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 7/15] freerdp3: patch CVE-2026-55648
Date: Wed,  9 Sep 2026 20:31:32 +1200
Message-ID: <20260909083140.2494932-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129878

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55648

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-55648.patch     | 28 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55648.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55648.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55648.patch
new file mode 100644
index 0000000000..ed62b76a94
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55648.patch
@@ -0,0 +1,28 @@
+From dbe40963a661a501a227169690c0b3f413514b07 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Sat, 13 Jun 2026 12:14:26 +0200
+Subject: [PATCH] [codec,color] fix source bounds checks
+
+(cherry picked from commit e4ae473da2926724d9b6329778797a3bdea79eb3)
+
+CVE: CVE-2026-55648
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/e4ae473da2926724d9b6329778797a3bdea79eb3]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/codec/color.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libfreerdp/codec/color.c b/libfreerdp/codec/color.c
+index 5271cf939..47ef77ab0 100644
+--- a/libfreerdp/codec/color.c
++++ b/libfreerdp/codec/color.c
+@@ -451,7 +451,7 @@ BOOL freerdp_image_copy_from_icon_data(BYTE* WINPR_RESTRICT pDstData, UINT32 Dst
+ 	}
+ 
+ 	/* Ensure we have enough source data bytes for image copy. */
+-	if (cbBitsColor < nWidth * nHeight * FreeRDPGetBytesPerPixel(format))
++	if (cbBitsColor / nHeight < FreeRDPGetBytesPerPixel(format) * nWidth)
+ 	{
+ 		WLog_ERR(TAG,
+ 		         "cbBitsColor{%" PRIu32 "} < nWidth{%" PRIu32 "} * nHeight{%" PRIu32
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index 3e891f40d6..4ae18651d4 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-55193.patch \
            file://CVE-2026-55194.patch \
            file://CVE-2026-55564.patch \
+           file://CVE-2026-55648.patch \
 "
 
 


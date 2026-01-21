Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580ECD262B7
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 07:04:49 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6786.1768979083882976811
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 23:04:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BjEHCm/6;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801d21c411so22385875e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 23:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768979082; x=1769583882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rH68EfhPTPynTSo8yMbL8xwfxorC76r0vVtlMg5ssFk=;
        b=BjEHCm/6vFuxDlLVR+MZlnRveqeEjHoN4xmwRD5nX2UvEJeUetL50qZr1ykkcE9/eZ
         7Mm/RuHTEKPGMcDAtsGXZq0JRk9uid3lJTCGJH7bF7tZbvMnZKSb6vladTI8FzEyVFQl
         WR9xeXPiurAR0XWiRegMieWxcVPwQKuusSKhI2VhIdJPFX3IuBlTAQwr7VJrJCdMko4G
         x9eKIDDUPmuWl/9BSSAJLZcLUkPchW/697iKzCs5WMzzZzoLABIix6vPLbdiko78voLn
         Ix9umHslIZdCKe0rjVhr6hXp0X0xJQ6OtVdKJ6M1Xbcz1fvCILvldVgf9thBT3bd6pbI
         Gcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979082; x=1769583882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rH68EfhPTPynTSo8yMbL8xwfxorC76r0vVtlMg5ssFk=;
        b=DzQX+0Ci2U0jHZ0DqykSqknNLDrcCcH6l0hH7jRo1NvvwE/q4tUk7AY3d1RQfN8Opy
         9+zcZnEVJiygiWdK0tLKKB/eMpdEpJwuZxjVicdW1iA4QGaMMXVV2sYLRw1wRmvTvy0j
         cd6ZDazBuDlDEcvMlngccw/BosTwdyiNIq3KCNH+ct3dR8oRK0D4o//haxPnvk3d6bZb
         qt/wj372VK7Cz3MJPYFW7Spvv9dVoWYB5UiuN/GW2fkl5m6DMh/SJHLeYUHJjx6KzbSF
         gYN0k1xnGD7gDKsgpCSENJllvvoXCZYg9TY4pKZ2IVFTZELyugFPneTc361ZK09y5eG7
         O8Jw==
X-Gm-Message-State: AOJu0YwT/xmQufJcvdzkFK2Cp+Is6gHNovrZHQ3WUkuQqKqjjjSXXisu
	2+nO8EF0AmwQLwUu6kLnLW6asEUPytvkfZ73hD6iIHEXIXqeew5L+xFbcu9s3A==
X-Gm-Gg: AZuq6aKu0ibA2aDV1A55F5keOQZC3Rh6Gh1d+r16IrjeNeEo5qdypN9DwQN6bvWgNV5
	SSetTyINXnxZeby19xeFl3pJuW0ARPpXt03MCjfWT+k1KzWmU6j+KdcWtBVQDZ0a8E4q/fI1tya
	B9cSPnXG2s/mvMXKo8FW7Tc+ZAUJRgONO+gWcYnaEVtojcBkVPO/zizbHPCLeCn7Gqyp7CeMC7R
	ztS4kgqSpVfmpBt6KLmPbkftQIXNLHi0HVdo8kVWrg5wyaFd2iOEMsOjMJt0QDEQwYdvPNyIFxN
	ymYjdQrnHmt3nkccxP5DxjzafoiORQGOGuj9d9NZ2RtGDlmO7F7CQhoyCtZ08AudIhnvJf8IrZP
	GjVWVa3AfBOBmQXiqzYW0UFfidlad0l+2UXuyo6MBBrjuL82XvB9WqP/Nv/QnwEgA4ollnqpOiL
	iFvIO1wFec
X-Received: by 2002:a05:600c:34c9:b0:480:25ae:9993 with SMTP id 5b1f17b1804b1-4802ce16557mr158378285e9.20.1768979082155;
        Tue, 20 Jan 2026 23:04:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dadbsm34106880f8f.21.2026.01.20.23.04.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:04:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/5] freerdp: patch CVE-2023-40181
Date: Wed, 21 Jan 2026 08:04:38 +0100
Message-ID: <20260121070439.1632875-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121070439.1632875-1-skandigraun@gmail.com>
References: <20260121070439.1632875-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 07:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123687

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-40181

Pick the patch that was identified[1] by Debian as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2023-40181

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2023-40181.patch      | 33 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40181.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40181.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40181.patch
new file mode 100644
index 0000000000..05af44af09
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40181.patch
@@ -0,0 +1,33 @@
+From de011238a720cf80a7f96ee0d7a43d85fbc0552f Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Mon, 21 Aug 2023 14:30:11 +0200
+Subject: [PATCH] fix cBitsRemaining calculation
+
+fixed out of bound read reported by @pwn2carr
+
+(cherry picked from commit c39c82277a73332e9c1b64db98a34559f424fe20)
+
+CVE: CVE-2023-40181
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/c23cbdc4a5756bd723223c7139654de7439fdcc0]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/zgfx.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/libfreerdp/codec/zgfx.c b/libfreerdp/codec/zgfx.c
+index 04ddeadb2..4489b3798 100644
+--- a/libfreerdp/codec/zgfx.c
++++ b/libfreerdp/codec/zgfx.c
+@@ -259,7 +259,11 @@ static BOOL zgfx_decompress_segment(ZGFX_CONTEXT* zgfx, wStream* stream, size_t
+ 	zgfx->pbInputCurrent = pbSegment;
+ 	zgfx->pbInputEnd = &pbSegment[cbSegment - 1];
+ 	/* NumberOfBitsToDecode = ((NumberOfBytesToDecode - 1) * 8) - ValueOfLastByte */
+-	zgfx->cBitsRemaining = 8 * (cbSegment - 1) - *zgfx->pbInputEnd;
++	const UINT32 bits = 8u * (cbSegment - 1u);
++	if (bits < *zgfx->pbInputEnd)
++		return FALSE;
++
++	zgfx->cBitsRemaining = bits - *zgfx->pbInputEnd;
+ 	zgfx->cBitsCurrent = 0;
+ 	zgfx->BitsCurrent = 0;
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index dd944e450d..b909f88310 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2023-39351.patch \
            file://CVE-2023-39352.patch \
            file://CVE-2023-39353.patch \
+           file://CVE-2023-40181.patch \
            "
 
 S = "${WORKDIR}/git"


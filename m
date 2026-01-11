Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B443FD2502E
	for <webhook@archiver.kernel.org>; Sun, 11 Jan 2026 07:36:24 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6659.1768116983223422020
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 23:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bVdBKFDf;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c2dc870e194so2883056a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 23:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768116982; x=1768721782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrPa0LOYo1MmCmwJZQDT2aJmPZrgzx/9upvVs+3OV8M=;
        b=bVdBKFDfobZVYJzOTC6TrErhEENPqHe2156x4eNpLreBR7VkQ30lMvTiABtKi+lOCJ
         5elbdSTrwgi9EQtz6ONtiqEPPSW30C6/FbfOTKvBi6a1QMfKJt2A8+Nm19RqoHnZsbY/
         vAnVazw//UdcakU/1DvW+kXVOxgurjLLPTVj6+2vs291dcNnXQZM3kwhuGlN8YELqDTv
         AU6ZENH/IogHQNIJJlpxhYy/4ue0sn0ll5t6zpPoyo7qJP0h9e2bx7ljJGqama4z9uU1
         mri4yI1Wl9xrHy+K6j+Ea8GVO5CENvbjmMju5qLRzX3+kI4UjuQArdV0sLdgL3cM0WDd
         CdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768116982; x=1768721782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jrPa0LOYo1MmCmwJZQDT2aJmPZrgzx/9upvVs+3OV8M=;
        b=E3149T53UIfelgKiD53rii+2P/mx1OZKJlKEUoF3o1FD99PYv97pElDaSjwzm3aYPF
         dCLFsF0sUedcm+4Ip7gzOzueHpvV4p8MhAb2XvCzyDgTpZSjAD7vEvCdzJQPQalkX8P4
         U6kTy1dB5rO8TFI97CpMSPdQmzjtaKQrqv7+YeQh8ykVHyOrxK6s/I8U0DhL4kjpl7ac
         9F0R1PBiH0nHcNldyE1TzvdeXgR+i4/dd2L1R5WffB17hN7giW8aMD6DRNAiJzlN457G
         bmKXYqccVJInph9A5PnTspLhqGQzWbG7tNQrwhJM8EvHy+mI6frPEYuPpYKKIJfB55lI
         SH0w==
X-Gm-Message-State: AOJu0YwnsdekyupZxn74R8B9IvzxhqLNdBfscB1Kuif5e201AvYuz38M
	1arFf5EWGXC+VSyru1Z0kGtrD0fRtcTt/LG1DJZqrkNJ6BQ9l3qjpAzbFBgJdg==
X-Gm-Gg: AY/fxX5ze/ADDFVBt/p2MpLJsKBwUCLLQr+fHcfHpxiCwGLZS0XITKTsXdDVgFw0kRm
	d2I4PZKYUx5GPIN8vBNGuD3V1YvaDz2huqKjxQXmrjEivJKplIAKnlTHtD2e5ivk81C242I4xwV
	Dn+YdEjn1lPzawITDA0ZC/iOgYSaxr/iqcNB2Ns0cU5k4m+e1Z+txYco0ntxYzUWjTYRtwmx/eC
	TY4w3HPHGYJF67pcHiA0FqXLLUn9FbynCE9Nzccq211EILTi+eAYT5bZO2/WUXNucwCnnrIjw4W
	nWAAUMV0TU8haOwBzQgDvgm8TOnf/WVQGiktuhwvXKaUF/FR04Ibs7qfTe/gGSdB8yEPZmg+Jqp
	9bnbmfQVk6U+ZGBTdQJCxL4u5dkemaRN7TmsOqDwZHayHSIraaUKfO361V02DV+R24HCz8KWQrr
	2U+aOwYjxDJ2UIaHIR/kvubMs=
X-Google-Smtp-Source: AGHT+IHeYcI607Bvv84hb8qtezKfZgtKeXk9OxqBuzCYYeUK6Q4PPe6vVg6uotoKFsdG+NQ9eATrIw==
X-Received: by 2002:a05:6a21:3384:b0:35e:bfe5:ee7a with SMTP id adf61e73a8af0-3898f93652emr13435409637.32.1768116982323;
        Sat, 10 Jan 2026 23:36:22 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfd27953sm14259545a12.11.2026.01.10.23.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 23:36:21 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/3] id3lib: mark CVE-2007-4460 as fixed
Date: Sun, 11 Jan 2026 20:36:07 +1300
Message-ID: <20260111073607.524248-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260111073607.524248-1-ankur.tyagi85@gmail.com>
References: <20260111073607.524248-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 07:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123342

From: Peter Marko <peter.marko@siemens.com>

This is fixed in id3lib3.8.3_3.8.3-16.2.debian.tar.xz patch included in
SRC_URI.
Version 3.8.3-7 contains patch for this CVE, we use 3.8.3-16.2.
This can be verified by checking the debian/changelog within this patch
or diffing [1] and [2] and verifying that this can be reverse-applied.

[1] https://snapshot.debian.org/archive/debian/20070819T000000Z/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-6.diff.gz
[2] https://snapshot.debian.org/archive/debian/20070819T000000Z/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-7.diff.gz

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9fff0040f1694b09c6c68cf59615f42d801d62f5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index 9e4b516aad..77cd96e91a 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -14,6 +14,8 @@ SRC_URI[archive.sha256sum] = "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b687
 SRC_URI[patch.md5sum] = "3ea90c0aedfcb56a53ac760a94bacb9e"
 SRC_URI[patch.sha256sum] = "6170f085972fdeb5fd69e346860100416707bb0b9f3a73a17a64945dc8b7cfe1"
 
+CVE_STATUS[CVE-2007-4460] = "patched: fix is included in debian patch"
+
 inherit autotools
 
 # Unlike other Debian packages, id3lib*.diff.gz contains another series of


Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A30CA9ED2
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 11:08:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4305.1791889675770780189
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 04:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FaZ2dkwT;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso36598535e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791889674; x=1792494474; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gJK6SIHO4gbsgICoVVEgiPGm6KLYUs38cIqyA8LnqEg=;
        b=FaZ2dkwTHztnZfE7Q+5EiBPRyFX2mSrgEFIX+qwnnA8HpIfkJEGh/mn1Dhckty14tc
         Zhq4CmxALr4jGiU+5RDGs13YWSxLFcRhAVuFPIAGVwh8CbAofOQQsqv6V5tFWUJnY9f9
         Db40v+DrtHIhVWTOpl0Dlp9pzLAXcWOxl2HfO8U/KCUKfOB90n7fsWM+deVNXUdb/hkX
         moiadzaQO1d5mi/HKHC76mVQvgn+v4nXrIjpQEzS9jYksM2t/e9UjrexMCxlasvyOgon
         5wfWscTrp25DMFwpXPgBseJqapjH0YAx36qamuC5Unup7A2+ydIoXr/p0VsdTRpuNvdi
         YV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889674; x=1792494474;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gJK6SIHO4gbsgICoVVEgiPGm6KLYUs38cIqyA8LnqEg=;
        b=i3zmZBGedXqQJRu3VgBqUUNlaeGA52h9NlPf/+ubdq17RTPURC/2nmg7ioDNg0xAbp
         XyyRo9L3oBzqGxrwa93XPRm22Khge1Wa/3TVgfV8wY62WB54mndDCzJFe7GOZEcKM+x7
         toTf0qsRmXV+Pe7B/HtdsS0JSr9rv50UEMJp6pWuzkUenkPAEYX4c+tGhi60oU/jw6z2
         pyWfPvYUwmqdJmfyRbxpVzhiKSBMjmYwW3m4yt+M6ag5hh6gSeWTpyQBKkieZ+HRWb57
         kBCU3fuupdWMJM/nhtlNpF4NCD+d7us4gX+DITrKw404eje6Aw7iEIMBLrWov+1kID7v
         iuIQ==
X-Gm-Message-State: AFq9FYJstd1IP9Ep0SnBJMDNkiGXpThDhNuSnQIs9PQTvzLjGR2zWdww
	i4yDb28ranR5BXJjB3odsMMIHCZVYDZp5Y2qpGj2IuGNrelQ2xu1kClWheMLuw==
X-Gm-Gg: AYBFou300iEi2m6DNyYPAJ8Gnj1PMkKNP9pmy7PHDaI5IQNHNbTLbbFB5ZysRpEXptJ
	yu4gzt1WIPuZbCRwKCGYKUHoYG/CfRvMZY9khh3Q8Fzlw2u9jzQ2Qaxq72Yn3QBsI19Q895wzZO
	2mshxeArKVK3EnAVxLcP7TliqBEyuugfXJAROndoT1jmHJntLkWjlrNlpXIlorzhV3RnKr9YpVK
	zY/Sd9wPnR91jBnTzCsuBFvsy0casM5YX/ER/pbuixi99V/r/gqa239bdLpM4hwuco3YuqZ91Gs
	PujipfsmA8fhtNm8zQJxEZlxe0nfZ5rmaV6AS9Db+IIu1/Ejgjxj+nNqulas4j8PPNMKtAsxcqu
	71TrWgEmMCJABmRFIMi902AMIeg/48n74REeOD+Y8ZO6P+o5LoGoPDW2HBzVX6MkguO0vnrriAw
	MrXY7bY804Vd3j6C4xZMJWTLbuigyeFaQVJE+HaaAbvZFh4UJn091fRbGiMsJZ2i8puiZFV9tl0
	nyhjJvtvIHkrCOH2qxdJ3CscZMvwWbbumVX5sJ8WfHPADBeWujMlfrClUge
X-Received: by 2002:a05:600c:8b78:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a18e4837f2mr227029305e9.5.1791889673769;
        Tue, 13 Oct 2026 04:07:53 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19ba624b3sm243728005e9.2.2026.10.13.04.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:07:52 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 13 Oct 2026 12:07:46 +0100
Subject: [PATCH meta-python] python3-yarl: upgrade 1.24.5 -> 1.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-yarl-1-25-1-v1-1-822d8fe7e491@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAERzmoC/yWM3QrCMAxGX2Xk2kBTf4a+iniRbukW0TnaKo6xd
 zdzNx8cPs6ZIUtSyXCpZkjy0ayvwYB2FTQ9D52gtsbgnT+Roz1OnB5I6I82dR3YcaRzOEQwY0w
 S9fuvXeEphXGcSm/B23bmd7hLU9YeLMsPqUqrJXwAAAA=
X-Change-ID: 20261013-yarl-1-25-1-77ba0af19b4f
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 11:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130862

aiohttp 3.14.4 requires yarl >= 1.25.1 and imports query_to_pairs,
which 1.24.5 does not have, so importing aiohttp.web fails with:

  ImportError: cannot import name 'query_to_pairs' from 'yarl'

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../python/{python3-yarl_1.24.5.bb => python3-yarl_1.25.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.24.5.bb b/meta-python/recipes-devtools/python/python3-yarl_1.25.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-yarl_1.24.5.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.25.1.bb
index 4c99153ed0b1..ef473abc10b1 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.24.5.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.25.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "e81b83143bee16329c23db3c1b2d82b29892fcbcb849186d2f6e98a5abe9a57f"
+SRC_URI[sha256sum] = "03dd38de09bc213e9a8b29761eec33ee1d5318dac0e49d8af36e4d27830e23a7"
 
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta cython

---
base-commit: 9b938c16164e1cdabe3830a35fd09b180b46a317
change-id: 20261013-yarl-1-25-1-77ba0af19b4f

Best regards,
--  
Alex Kiernan <alex.kiernan@gmail.com>



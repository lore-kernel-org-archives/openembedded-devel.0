Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2B0CE7AA3
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 09:47:28 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14617.1763113639062532409
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 01:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EmimDBsl;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29845b06dd2so19061905ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 01:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763113638; x=1763718438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUIqb7j9akIQ9e4dwUJpfQ1Y3xe2sG1Dg2d2AZsYRXA=;
        b=EmimDBslwQjbiWfwjSESLQTeHqbqppb4HoinPSrVUw/N2K+Sokw6Ko+07t/TvIezJl
         krmJNf8adwT6VaPXI8mgs4sDnP0RLe6l5Mwgbw+77iWQxXzvmvCTN/lrM6VXxzk5u5tX
         Qj6lixOiquUOsBB+/+b6x+Gc63C5mBahFPUZRbzPSEamyYwdLC8m0JrDkAe0WTTq4ePp
         KI+JNTBoGrcshmO6lVTqjAlx6CYdOaqIcGD5ofRo66r6qhlVdOhPW67OZMmu1DWR1jxb
         97P0Vy+svPYYw60Yf+VIEO9HsbgQU3qexePPZoKnTaKo0Nq3Tn8A7T0GQp53mPCHSDm8
         jJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113638; x=1763718438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AUIqb7j9akIQ9e4dwUJpfQ1Y3xe2sG1Dg2d2AZsYRXA=;
        b=dPKlV2wM8+Q1BttIIfRBwnAa3OsqbKk96+P9OMxEQ5T3jr+I90cQuKPXMVra/HXEMq
         /DX2x5B5A6V4o5TtaxpdSy0St5ITjvz9C45Glgoquyo7L/hkJ+4+vQwF7XnJ8vrxsm7R
         4QMBjDof39aCoExleVbL7PGl0tdM/A9KDGKlkdOCBQ4LFz3PX86g5sDHW4B9cnaNq779
         +RDjj1gtmaJupDYhh0U8fdQXpqwMA1vS0Ig9MpZmi8PdPyy6QO5qREmmN+7nu8LhVeUP
         mpP0y3sX/c8LNz/LFRT++4tncKoHUh0StvJYTeApkn5QCf8RJuXplrlraQgquwl5aD91
         6l4A==
X-Gm-Message-State: AOJu0Yw1eLeDLBoJf9bqUCb3P6GWKD4XtSRUFtcfSztUMlCIP25wUH3q
	YqInxF6FxwgkMYitieUONnHt/w/6NZo6xUZ84wcS/MFH0o2MpLVSFsfipgMOQQ==
X-Gm-Gg: ASbGnct+oL10XaWSY9BiHtaN+0XW6YE4mnuu+lXC4755NQnUhJDX+bXaxLUxBIRUmYf
	A3nmw8kI/cvs13yus1WCEAi30s/QHjmx57VsPHJB20d+2Dnf82LiL+OeY2k4+QNxORgtkeDDztK
	XLrfDNDsGx0DXCsDncU3YdYWUycX4BYMMWeuBVnkEaLlJdfBpAqSruYwHnluXDQKMNUzn0nGDt+
	qLrjNBao1j7FiYxqP0is/Dnt7mRpzFHTXTH5M1vNprSHewozcS33kyTC5SSmn+ljG6Hxtafo27/
	oFvdvDXaFLkYUk3vWHHivOzedVyFGMlDGUf+2BRPGKwuKeAdFdkB7mvuX4DfTH2YKaN1Q1HHvDh
	7Sv8jVYoyx82bkrxZASmtl+4YezebpepW7bLwpSDQR8h9dwxcj37b877U3rHq9ISK8OAN8ZsG8K
	DV5OA0ImPeouQS
X-Google-Smtp-Source: AGHT+IE5JqLW18B/02IP+Ueo3QJmjmzkeULZHjxPDIwh7E3YQKL7o3ZvpF8cvcSf7p57xe0yclQ5fQ==
X-Received: by 2002:a17:903:3bcb:b0:295:1277:7920 with SMTP id d9443c01a7336-2986a72c34emr27507325ad.28.1763113638227;
        Fri, 14 Nov 2025 01:47:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c103asm49413995ad.96.2025.11.14.01.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:47:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v2 3/5] tbb: upgrade 2022.1.0 -> 2022.3.0
Date: Fri, 14 Nov 2025 22:47:01 +1300
Message-ID: <20251114094703.4091777-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114094703.4091777-1-ankur.tyagi85@gmail.com>
References: <20251114094703.4091777-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 09:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121704

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/uxlfoundation/oneTBB/releases/tag/v2022.2.0
https://github.com/uxlfoundation/oneTBB/releases/tag/v2022.3.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---

changes in v2:
- no change

---
 .../recipes-support/tbb/{tbb_2022.1.0.bb => tbb_2022.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tbb/{tbb_2022.1.0.bb => tbb_2022.3.0.bb} (98%)

diff --git a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
similarity index 98%
rename from meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
index 937cf6a0b9..01115e7e4d 100644
--- a/meta-oe/recipes-support/tbb/tbb_2022.1.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
@@ -13,7 +13,7 @@ DEPENDS:append:class-target = " hwloc"
 PE = "1"
 
 BRANCH = "onetbb_2022"
-SRCREV = "45587e94dfb6dfe00220c5f520020a5bc745e92f"
+SRCREV = "f1862f38f83568d96e814e469ab61f88336cc595"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
           "
 


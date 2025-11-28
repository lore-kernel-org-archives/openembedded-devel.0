Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D61D116F7
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:01 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3258.1764361131924571764
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Me1Q3lYz;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so1382134f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361130; x=1764965930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRxmQUAHQuzKa9gDIUWBYeQT65jZUG2LuYi2bh6vcbQ=;
        b=Me1Q3lYz2sYjd+a9U95gf25jacJ3OX06ezxbEE5Hhuqz+YFKeEiarNYKdZTsekbdkE
         O9xd+9KAJVTVbtMLgSKbJzaI/o63ElUHqme/Eh/HUMHk6y3c4LJjDHTh7V5lXv9aRz/D
         tKzRxeLKcvkAcE7xdp5HJwIVWDNpJYKpmsp/6V4YsN9GSkUV4M81IvHLOxRtkduuxPKO
         6i9au507ZZf6GhLXn8ogAKOz/Eg6BCiszLn8jmwF9kQKy3YscRNtkNxrC/upaqJByNav
         hjclievBtvrxpwbqMJKHRTSXFeatOld5xeqjCUKaDmNEyrJL+QkPSupwz6bVw7S3lKf4
         eRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361130; x=1764965930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qRxmQUAHQuzKa9gDIUWBYeQT65jZUG2LuYi2bh6vcbQ=;
        b=vsujTq65AWnITpZVi/sQw42Mc9KZIVqgu24KSEBnsOKL/RWilUplDAOIGhXMDtcnHV
         NW/kVW5wmzc6RmlOHg7Mk+o6zmafxYhC9EZ5PLGcg+w/wecusqaQMyhYGyvemFrWQE4F
         X8sVvYkECJ944iDzYyfctNjcXTVwfXwL92NtQCBRNuBTLwpCiU4SUC22l99qLpJe/QgR
         dlCw7FXom6br6xmYLwI+hsyYd6WEvRk21whhev3Wx8h/by2cWHjoWYfDKByod/mXRMjZ
         RS767r87w15HCDLat0GqCZxf7CcyOi7T1GyPtXbJ7H5YrJZxt3zfcUqczGtI4UfyOvbd
         uMVQ==
X-Gm-Message-State: AOJu0YxPNpA2oR6eEL2D8DmoLfkU3T5sN7xDs4+YiPr+VtxTru7yTfO0
	AMM3tvtGG8xMG5vBMvcTKo0azyVqSWaxlvFdyzQ5ynbKX+zfNNdBCS3GOPFthQ==
X-Gm-Gg: ASbGnctazTsSxwNWI3koEYlXGjbFTgJSXqaBiqQZv4sFeWxGS1x8T7SRFh0OxjXj14d
	lsABP8GFOFJ3MKJlPwdWA4+HAfrxhGVAVo3YyNOuyBpu2RFu7H3OpRaJx1SX83kfk7HW22jy3Bf
	JRiswARWYzwSmWnU4i/TuV2hvbhZ2YvsGM3yDDEP3ElQHQae6U0FxA65UaHBXVEbsAbbq3VK75U
	8AwWq7PESwe98j36ru3JU7UTUfqxbOptSvMlHfjhTEePEkRwFb52iRQ4+5lAL6Ts0V3+jt7uPgv
	7VB2pcuZwH2U1EdCJfS0sztb57tQYsuWyUJLdXbpYCqyQeGZUcEFYVVimMQDRdSycA0+Sp7/PTW
	743xOXLzqgtg0crGv7P+uC+S+xM+ufwuGZpttyhh1keshHSpFV83IhHLbwSzKWypYYX7pV9ozgb
	06rs703lLq
X-Google-Smtp-Source: AGHT+IFVQcMPi3/q2jJggHmoetCnLqHNIcXh/fZvY1csZD1UR6Y/blIYrLitSgT8AAmKzUFkJZhs4g==
X-Received: by 2002:a5d:584d:0:b0:429:d391:642d with SMTP id ffacd0b85a97d-42cc1ac9a9fmr30672475f8f.5.1764361130233;
        Fri, 28 Nov 2025 12:18:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 07/14] libraw: ignore CVE-2020-35532
Date: Fri, 28 Nov 2025 21:18:38 +0100
Message-ID: <20251128201845.2578315-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122139

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-35532

The fix is already included in the currently used revision.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.20.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
index d87c78f46b..ee64c33d78 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
@@ -11,4 +11,4 @@ inherit autotools pkgconfig
 DEPENDS = "jpeg jasper lcms"
 
 # The fixes are already included in the current versin (0.20.2)
-CVE_CHECK_IGNORE += "CVE-2020-35530 CVE-2020-35531"
+CVE_CHECK_IGNORE += "CVE-2020-35530 CVE-2020-35531 CVE-2020-35532"


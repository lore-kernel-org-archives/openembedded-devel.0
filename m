Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CF5C3DA7F
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:28:19 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.7626.1723303690045617505
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=laD3Isvy;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-690ad83d4d7so28857907b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723303689; x=1723908489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZx0u+YId7SF1A7iUHI0eR+SNcG/iEg7TBssdUR1444=;
        b=laD3IsvyIG2dEu3ZztHcHliRdhFAt+ehyw2Pz9gbYPZpRBOUKZeh+s0s74v6WwsmcY
         hF/bx99uuvKHrP5/El54Y2fRIwG7tPHqoy9MOmNkkRwfhDk6ruJvSW5orEyXvarsTXiR
         KfD/tSTmNVsIVWxcAIb3J0BTqLfI4e7wi/U5TGt0V+dwLgq6aXVbM0oO36Pyp2Fga2sR
         9guEOCt/o7Ldt8kYYt0NiRV4Kv+kOTSxLugR/V4SUaS7vacQHx5WaGpZXkzqn33ChbHi
         uYDUd0eEb3qLj6LHzAwSOYLVOLvfaMEJuVTEFtI/TJGVjXJkTHDf5pa1jyxN7JRi7Z0v
         mX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723303689; x=1723908489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZx0u+YId7SF1A7iUHI0eR+SNcG/iEg7TBssdUR1444=;
        b=G1Bb9VLXqUKgHse2k367+LRkeY0k+bifdGt+gnqMfA2a1rIwNhmwpLBKNXh0heFG3l
         i9Qnk3gIrKET/sZO4Llaa/eb3o0iaAcGQrh/sf5dnEYT+q94PPST031INkA3370DON1M
         H89NaThwdVUQ3zl4INNwi1XX3rRypc4NYCrh1DR1qDJL3zRqIGEQywnK/dn59yndB3kN
         lF3U1lFMSTIK9kYwlZ47H2udd5MwW4vcrHlCD1CxaXaqsaBK/AmYq12zZnb3ENxmcGcd
         bvBfW4Dkcor/8rgmebUrq+u1pMVBro8tmrzCZpBsj0PbdanslJZ/6TWYVPo2tIld9nTm
         7Sog==
X-Gm-Message-State: AOJu0YwIqTQZDmE3Nz0obHWwM6NFLwQVqoeDXr7zEiWAIiJr+bwz4pYV
	3Sh2d3McQwRZvwZMpii1mNVKDcEz/RqfUeKKPWhHmJOX2bze90e9uYvhBA==
X-Google-Smtp-Source: AGHT+IH125Ejx/q/PhbL1Xn2SrCp1jPrHiD548zkIVVNwMJcHHhckgOyq/quCBVG5u1rCHrgsePZUQ==
X-Received: by 2002:a05:690c:4602:b0:687:fd34:2a1a with SMTP id 00721157ae682-69ec8c8e5f9mr54416917b3.42.1723303689045;
        Sat, 10 Aug 2024 08:28:09 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6a0a068cf32sm2848947b3.48.2024.08.10.08.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:28:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 3/7] libjcat: skip buildpaths check
Date: Sat, 10 Aug 2024 11:28:03 -0400
Message-Id: <20240810152807.899873-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810152807.899873-1-akuster808@gmail.com>
References: <20240810152807.899873-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111740

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Test binary has embedded build time paths. Ignore
for now.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e02e22063433adb1b4fbba562f9efd6e68941309)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb
index 2d95e14447..7dc88d7279 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb
@@ -32,3 +32,5 @@ GTKDOC_MESON_OPTION = "gtkdoc"
 RDEPENDS:${PN}:class-target = "\
     ${@bb.utils.contains('PACKAGECONFIG', 'gpg', 'gnupg', '', d)} \
 "
+
+INSANE_SKIP:${PN}-ptest += "buildpaths"
-- 
2.34.1



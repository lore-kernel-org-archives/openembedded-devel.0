Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85831D2B944
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.19639.1730817433317210998
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b5jooZAj;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so4362104276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817432; x=1731422232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMEo5cGySLUmov660JfUaPkeX426mfkuT21l0bviFZM=;
        b=b5jooZAjsLRA+06PXCEQCPj8SCKyIA4oiSgu1h2xiTLYVT1goFKJOzNORrpCH/Lr2h
         SSCkRhpKc1OWw7Wum9iZrSWcWF5DMREm18Gnib0G84TdaOECD905O4GQbdZpxweAc1J5
         8WCzoKCPIYnYkNz5ba0wW9ZEE3xvQUHmdlv4xssnfIXGHLzIvUu1P+kh35fEl05UdXZa
         nGWtNEk4AT0M9HuXuArZg0sG56j2K493S3mxwomU5eg8fqEyvfAH4o20N+oglkPTBdPc
         fyFZPOnTyYWSSYd+x60ZCB72RZ5oR7mE26yJDUzZ86Pi5FbvjpQWyJ4TSkdUerd3yn+V
         rYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817432; x=1731422232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMEo5cGySLUmov660JfUaPkeX426mfkuT21l0bviFZM=;
        b=Ql/zITLIapFaRSjwRhLZ6wH3DF4zIyBrUGwT/+9D10af/Jnvd+5yQlTwGMwhj5ShbH
         Hd1nyV0oybDcOP3wPYnTVazcnmh1TPFyA1yOoKhCZlBfINK6+P7XlsWe5gjOjnIgbjiT
         wXAyxiTbNCpEXv3Qx4M5kbYYi9jDEXViq5PQjCDegkbBF1sdSwbWpVBn2eje3+2VslmZ
         GDkl8HNvzsfeoDFqsIjFvnATDZbyMLAj+ovuVP5GGcCny/jik+b9m+dm9FJ7eXWuKcPa
         q9UaWfsJIh96sr4sJyK6utLRWm9XrGVBv+UFplryKP7J0gJfmhP1L19xWsJBYSZkAS+C
         t9yA==
X-Gm-Message-State: AOJu0YwcpL3I7QAg2sF/w7GeiCDOjd56r72d2lAmBmErZvb+bQINpzrK
	OsIjoSNmKElfqs3ejLV0vm6wWw9c7cgX7xpQ6lx1ieA0THBIRviD6uCGoA==
X-Google-Smtp-Source: AGHT+IHV2+dottt57FOXdn0wR98eBy/ADzkZktwzwAM0xB1Cu476mthgqk6xOAMcl7myWJ9zI/Po1A==
X-Received: by 2002:a05:690c:7013:b0:6e3:34b9:961d with SMTP id 00721157ae682-6ea64c2ed0bmr158465137b3.38.1730817432370;
        Tue, 05 Nov 2024 06:37:12 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 71/90] webkitgtk3: Always use -g1 for debug flags
Date: Tue,  5 Nov 2024 09:35:36 -0500
Message-ID: <20241105143638.2301245-72-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113489

From: Khem Raj <raj.khem@gmail.com>

Ensures that debugging symbols do not explode modeled on oe-core commit [1]

[1] https://git.openembedded.org/openembedded-core/commit/?id=9badf68d78d995f7d5d4cf27e045f029fc6d4044
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c5fb1e0d3d63096f69d818b00b373639e1d0462a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index 9493d86422..0dadf570e2 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -93,9 +93,8 @@ EXTRA_OECMAKE = " \
 	-DENABLE_MINIBROWSER=ON \
 	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
 		"
-# Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
-# debug symbols (4.3GB to 700M at time of writing)
-DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
+# pass -g1 to massively reduce the size of the debug symbols (4.3GB to 700M at time of writing)
+DEBUG_LEVELFLAG = "-g1"
 
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
-- 
2.43.0



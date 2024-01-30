Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92C4C48285
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 10:35:15 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.15205.1706610906150371609
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 02:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l5UXSZ3F;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55eedf5a284so2883596a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 02:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706610904; x=1707215704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtEUG49bl9KkI7Es2PlTJdzpdKl04fybOuqSAU+v/tA=;
        b=l5UXSZ3FWFGDycdhjjUJ26tLdN9IQp9wldenZ0hkI813CrKpjBW4O9ttGx3/p7kJLM
         CJVmNpVv9TRP0R+5ijFyQ/sGSbUPmPwQaSfKkPxfiir8TRjguHZEjsT/CP3Mm7OLGGjq
         FSU9UdfLAygpG7vgKWN4QB/m/n/tYrcT4lNjpIM4tUIoTCmhX9wbRvusT3IOFsiWRNKh
         LZ2Y1q5uFORkFWnJIgzJx2V6+LqcrsdzRFVIE0lJZuLwIpm21k2HCft9CbD9HVhWzy6O
         UTl7/v75PtGQsGba4FXQdk+CT15up1veSXMdYSjLoqVc8p+zY2lfomXAPEmwk57q69fF
         yymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706610904; x=1707215704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtEUG49bl9KkI7Es2PlTJdzpdKl04fybOuqSAU+v/tA=;
        b=WTx2kzc1MFAiFzqWd/1+myuRD6dbUxOTuFwAfC7EOm7rRhyl82D/TyG1ZoWYy9mdyv
         6cCgRSPB3uG82zuSCsM0LpL9q7I1bQDZXpRawUtULYNTwfZCtWD9HEDgG94GUOX9gtrB
         8PMjkOyt8Lp/mbe7yEJOxL+Rz1IctqheRMyiLkqaKnRmfOiowTYDyX4MHFJz4kioYc7a
         ZIPcfLentRXZMv0sZpc9JoqQayGPS8U3RmZrKoGHoa2bqOptHplro02UHCWsvplUDa4Y
         xFFvWx4Zuq1Ngt8V9w0z3zRAgwFrRayosjKtYeTqa6hg7U2uey7o20NbkXqMi4YQ0ZHQ
         l7Lw==
X-Gm-Message-State: AOJu0YwW5JAOQXg3x1GqBRIFnRUrJiKcsvX+42fQytke2KJRVTyj2Q4D
	0gIF7lnCRDTkovak9O35vGPKN4PvbAR1aDIhx/SFgNREMsO1mH74XQjdBqSE
X-Google-Smtp-Source: AGHT+IEYLgU/6G+jKgwqExy8W+uXxa0ngd4RMy+IsBeeSpUUsD7aFGsdYp5szIa3/UATQYipbOI+Mw==
X-Received: by 2002:a05:6402:206e:b0:55f:1a79:7d1a with SMTP id bd14-20020a056402206e00b0055f1a797d1amr2366329edb.27.1706610904346;
        Tue, 30 Jan 2024 02:35:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVwfIl9DBXXYg/uqELmmSl3w2wKOLZ9y9moFe0MpFbcLWC3YB6xJfLW2rIqo9TDBlGW9kLMn3rl6efoQo/UxVk7vMHSOHGU
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id fk1-20020a056402398100b0055d19c9daf2sm4717833edb.15.2024.01.30.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:35:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy@fujitsu.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] libvpx: restore Upstream-Status
Date: Tue, 30 Jan 2024 11:34:58 +0100
Message-ID: <20240130103458.819774-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130103458.819774-1-martin.jansa@gmail.com>
References: <20240130103458.819774-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 10:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108493

* accidentally dropped in:
  https://git.openembedded.org/meta-openembedded/commit/?id=acfdff6e41f860b31faefb4e449239a6d04d7502

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../webm/libvpx/libvpx-configure-support-blank-prefix.patch     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
index 3a1d6832c5..216fab0d84 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
+++ b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Upstream: not yet
 Fix configure to accept "--prefix=" (a blank prefix).
 
 ---
+Upstream-Status: Pending
+
  build/make/configure.sh | 20 ++++++++++++++++----
  1 file changed, 16 insertions(+), 4 deletions(-)
 
-- 
2.43.0



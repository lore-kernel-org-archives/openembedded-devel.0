Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159BBD35E37
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.27820.1730831885853113345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GqPwNimz;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea051d04caso43279217b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831885; x=1731436685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Nvx6srBq9gPUGoaS5FjWQKdjuRiZddi7xEEaf9dLus=;
        b=GqPwNimzxX9nUCmoFkq1J8nrYo8cbfGnDn6sN5oIjpPGq0D/ymaG7uk112J9Q/CalP
         fFmVSieqt40ykNzO/BP//sjwDAw6FSpbkiq90Hc2b9NqFGg+LtV7BHLOtz5/vtKgsiu6
         ZKAcepKRL0ipbcRM46Az8g1o7qnOLDhDYDTAr0yYQTlyEiRWzl6GROnVLsFAtdIgCyNb
         wVau8TUQhRPFCB0MhAAGqL2KO4itS2N4AMlt+0k4lJFCNLkFxr2YKDx7fvd4bOZsut/a
         +wWLmEmGEZlBB6aVSLn1coFHe35eu6Zu97BXfAaDhf/qF4fpnG5BfoGdHq8R5uwruStn
         Wj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831885; x=1731436685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Nvx6srBq9gPUGoaS5FjWQKdjuRiZddi7xEEaf9dLus=;
        b=d/CJi6vQOl9ja4v8U/vMflCuNtX4lNAxAvU7eW70hIEjE3CsIB4dHi+8b9wz5MbUxT
         qdA13OKQpg74hM+SvNrmIBax8ko1F4pXUgKly/NEZlKW4UbzYv1+72K+VydnnnBgLIzL
         vuPMqwP1ubdBfgavYTCyTpIqZkyYZy8E3qOMUavlzmfP2T6s0O5Ex1Y92aH1UtUbCLzB
         2kvm6fMFrHzv048eYlszL+X3MfpQ7o4KPDapAc15suGo5MhU4GuDfT8VWDpcku/ViA+w
         vBYgdDTuypZ9C+8Bbp3EYhO3DVLaz6J5LE/MmnL6Vnfqu5h446pmaKDKVfSgtwZd/PJD
         HcbQ==
X-Gm-Message-State: AOJu0YyaLLyawe2/ffc8D+cXb8KKwun2o7TOyhG1sPfzeA13SAmJ1GG4
	JbYFtrAXqd5ZP1J2AHMLLz8OZ8A/Oqzvi9bgsG/CBjUHRTAfEC1RadDDuE6G
X-Google-Smtp-Source: AGHT+IHqGWmxaLgGXyxrN3ErtiTUkkmBkQPK3DZK26RNhPYYCfqhhsH6IwIB17D0d1EguZJ2egQMXQ==
X-Received: by 2002:a05:690c:6187:b0:6e3:4630:e190 with SMTP id 00721157ae682-6ea64be802fmr180105467b3.42.1730831884492;
        Tue, 05 Nov 2024 10:38:04 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:04 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 009/161] tiobench: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:45 -0500
Message-ID: <20241105183658.34982-11-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113524

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
index 0769715f4..98914836e 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -11,7 +11,6 @@ SRC_URI = "\
     file://0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch \
     file://0001-Specify-printf-formats.patch \
 "
-SRC_URI[md5sum] = "bf485bf820e693c79e6bd2a38702a128"
 SRC_URI[sha256sum] = "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844b0685b7ea9db2bcc"
 
 EXTRA_OEMAKE = "PREFIX=${D}/usr"
-- 
2.43.0



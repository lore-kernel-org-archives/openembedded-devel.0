Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4138C48BC4
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 16:34:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.495.1708187662728330737
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Feb 2024 08:34:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mz8Eypzc;
 spf=pass (domain: linaro.org, ip: 209.85.128.46, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4125f9f2facso1220525e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 08:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708187661; x=1708792461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmOM67PqHNfiZ1xFtEzD7RMrg+nV6V3+ww1ZXo4uTHw=;
        b=mz8Eypzcman6MvlPx5VHTwKC9mLSMS/ULHmeLnUgO8BNvHADE1wYX773ooS5jz9cDA
         uQU3RkS32Il9KQDAe80FdEG3tnxe8N0lq+qjhSy/D4Saskp1VW+5w0SIyvx3acITwCH7
         Vh0uG2N76ypvPVHJmC4ToHZgOJXgD//tCwetP4jxpabzHRD6j1GfbUJ3alql7O6j7VBJ
         AsMKWYBG8HOYbsqWs8lgu1xy5NSxiiBgIwmJ2ilSp+czo3RyXf0X9+kez0EBFT/BYTq+
         arhYo7JgyDMlLTfLcAciV62U1vE7TcD5dCkefxFCHUJwfS6ISQW5gECgqxyWFlINFiy0
         Go8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708187661; x=1708792461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmOM67PqHNfiZ1xFtEzD7RMrg+nV6V3+ww1ZXo4uTHw=;
        b=h7tihPicnOOnfcHQ9Wbw78Wv6ppar2I3H2YaFdortvn5U0A2n65WnHAxgx7ar5tIJT
         t3OhOOBtI/CtnRO75ApvpB8S9dkTJIQVFtjnBlePlulZb7E08nYuwhy/tOD3C2j+SNIC
         I7pf5GYNAqVZTlcrmbCn+8JtFsDH/a9avtnKHxaJJ2BjDRgP7gwTFmLknlyw1BW/hH4j
         IaN8RwC8tdg0p5QzaVDo/u2fzQAkFDREmFJZ/yhy+vv2TBZd6j8jdJQSS6m4a9Ltsu22
         z0nzAwyv20FruK2Reb6X1eMnr0FoefcrX37F3MsC+dLPslcbEkFyQNM+ih9C5iNBHh6A
         qeKQ==
X-Gm-Message-State: AOJu0YyTW+g8f+LkP3och+khV87vKJKr6QGCgT+vh/FBUudj0jlYsqDq
	yJ03cUdcg24JWvG9aOWGq+v3w4fuKfgTEzXyuXR8brlsZ15eAn1RfIMOmoNe8Rg3MqpZ8gTwed1
	h8/A=
X-Google-Smtp-Source: AGHT+IGa1w0HxXsa53yMGpu77+FDF74o+qFvBT6NE1JnqbWjQXK2dovSIjYqssXE3WqVhreckTAhYA==
X-Received: by 2002:a05:600c:1382:b0:410:7897:6bc0 with SMTP id u2-20020a05600c138200b0041078976bc0mr6124313wmf.22.1708187660911;
        Sat, 17 Feb 2024 08:34:20 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4c82000000b0033d07edbaa6sm5277639wrs.110.2024.02.17.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 08:34:20 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-oe][PATCH 2/2] libtinyxml2: allow to build both shared and static libraries
Date: Sat, 17 Feb 2024 17:34:08 +0100
Message-ID: <20240217163408.213929-2-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217163408.213929-1-fathi.boudra@linaro.org>
References: <20240217163408.213929-1-fathi.boudra@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 16:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108834

E.g. if we want to build uuu statically, libtinyxml2 static library is
missing as it builds only the shared library by default.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
index 5039e9ff77..1c94eff246 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
@@ -12,7 +12,10 @@ S = "${WORKDIR}/git"
 
 inherit meson ptest
 
-EXTRA_OEMESON += "${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtests=true', '', d)}"
+EXTRA_OEMESON += " \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtests=true', '', d)} \
+    -Ddefault_library=both \
+"
 
 CXXFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
-- 
2.43.0



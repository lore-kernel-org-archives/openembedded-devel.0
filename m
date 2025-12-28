Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB695E784BE
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 12:11:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23530.1766923876497839938
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Dec 2025 04:11:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cwMKrikM;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47a80d4a065so41510825e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 04:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766923875; x=1767528675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chZ4ssJFP8p2D8E65U39dNKSwOexDBnFYyhhESsF6vs=;
        b=cwMKrikMpYcmKQ64T9guVUc0VzBNlgryTBrNg93Js4QJMxZJB26ZykXXYjEDlYXa6A
         teaWTqRQeFXaInHcUE1maHkBLMZ0RgZ4A7uCQ23Z7ayxJHj01q6Y3tkR8GSRuiDAeCm/
         u6w7CiznqJRT28bMHgMSGhxTzz9cnbg3GWWAF249/7mbieKUmhUlFPmZAJIMqHDlqyEB
         CQlKxmedklKRvX91IDD0bo08sK15+jYTY0Q9kDW7yuICNGPOlP92zabDWl4wa/9s2hPa
         +ghnPkemdnONBf5OPs/tTOfFHHFf8P/K8IJLzuTEIr3ZTKyHJiB/q6VUiYIYgf+ANz2C
         Vv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766923875; x=1767528675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=chZ4ssJFP8p2D8E65U39dNKSwOexDBnFYyhhESsF6vs=;
        b=j+Jw8YLDV2SRwsorZHTLBJGDXEcyT3UfvviSE4uaCEixiqv4yGnf0ufHPmUFzkczco
         DapWY0EBsE/WpvLbHiqiFqVIh2pz4R8tvoWd/vJQ+CrfV7v8Lz7ZruA9SvTE5r3hu59L
         gXTGRgCGu/ikFgBAkiHfuLL5+rl0s7KMCqEEAQMc/zHRNJwbD9PiWOwQAiBWczpWe3dA
         EiRQYRa/4HE9e/R+R/9eYySFbGth7Hy3NLQx8L7ihDZ+jTHbHjBHGujI20HZo5hSlgzk
         ZiX5yEw+yuzVQaQueqVEAcnITOQZza6FMipXPM/kF7aOffrCHlQE50tZ8C1xHGTcmhgU
         UkKQ==
X-Gm-Message-State: AOJu0YxqjKrOq2ic2UnfLzP/YyEXNkX6DzRXkWLJfCz5ot4gksG3E0fL
	inEwrHk0NHFqkz8bAnkHnV5utXALAMciP1eyQigABKCNd266kig6zbB7sW9gPg==
X-Gm-Gg: AY/fxX7Dqy0LUzLr9xufyrnAze/XSg5UUjQdMph+SPkI6O4OaYUBLX8Boub+CTWLvhZ
	RRjayOfQU+hVBA478Be5WmMZWQbVFiDDAgtRL1wxaCXjhBmtzk+0ZwfGYPHVK0ot8WUs5hEhNp4
	xn+xx36eddvoKaCRE486WuT/VdQE5z537/VDap3epR/PWIwDJNAlBOAvY+WQaEbu4dHTTDliQYA
	WHVziOxUDSMFehbIAeTp25ZauqtSfHaRXAyaAQFHfWo2xDHLAxHSCDHPs5v7T0DVc622RuhXqkT
	ox0FL9TtEPheyAFViWs51pIROE+gXu27xxV1YxSwH03mVjj90sBm/vlB6sgRHTqySGw1rQUQHAg
	4l+QuOBLD3cMVi24YJwvG1iI+XExGZsog38HRGPhwF4+tUN7dL7uC5ijWdcI6PnazW7ljFlbYBt
	MEvaqin96d
X-Google-Smtp-Source: AGHT+IElsnB/4afdKNxtomKQcIjeWjUgLHvFsJLt5cRE40yyrP3oSu1YfcNRYZXQEhQ7Wkvj7XVRMw==
X-Received: by 2002:a05:600c:470a:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-47d1958a61fmr309065215e9.31.1766923874768;
        Sun, 28 Dec 2025 04:11:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm546859805e9.6.2025.12.28.04.11.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:11:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/6] softhsm: correct SRC_URI branch
Date: Sun, 28 Dec 2025 13:10:58 +0100
Message-ID: <20251228121059.1810946-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228121059.1810946-1-skandigraun@gmail.com>
References: <20251228121059.1810946-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 12:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122960

The develop branch doesn't exist anymore. The fetched commit is on the main branch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
index b601a7444d..4816fe2a70 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
 
 DEPENDS = "sqlite3"
 
-SRC_URI = "git://github.com/softhsm/SoftHSMv2.git;protocol=https;branch=develop"
+SRC_URI = "git://github.com/softhsm/SoftHSMv2.git;protocol=https;branch=main"
 SRCREV = "7f99bedae002f0dd04ceeb8d86d59fc4a68a69a0"
 S = "${WORKDIR}/git"
 


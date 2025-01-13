Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12640C02184
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 04:46:14 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.10465.1736743569089322601
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jan 2025 20:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oar7wo6A;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso5071431a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jan 2025 20:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736743568; x=1737348368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP1h6RbLra2mBjrtYVCh3VEyNwG/+PGzrHUaDlXzM9k=;
        b=Oar7wo6AYOLIJW6C8L0OfEwj59wk/baqLCjqYv0hsb12RqZOIPks97xeCWYKHNlh26
         Jf9qCS9uVHdwQPEJvdi82fJUeu9v/HAHEjXbyJDXbeDxZ5XiW1yZEAaTDfyEZZ2lSPBQ
         dvP+v/2kvnPnjqAWNJmvg4LscsszNuY5ucg2gt28PsjZj55vDbR9ZNNiatFp5W4lCVhy
         Ez/tgqPzn/XHEhKSlGPl8BEvaRXxyB6UZ5i5G/wLu6XOUSrd89zqcz86eNeUM/7q9/EY
         Kt/ATDeCPcF1HJzsf4/JUjtyhkETaMH8XdxC12sRC4nBwowY5K6I6IBMnrhvM5Bbktc5
         0FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736743568; x=1737348368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VP1h6RbLra2mBjrtYVCh3VEyNwG/+PGzrHUaDlXzM9k=;
        b=gQsFcFL0ZSUif4B3q5y4AixPr8Dd/691eBt29j9gYtSgcoslabMj4vsvOP8Y0L0TEo
         tTufk/L74oKaIxShhFFNh0dN99V5YyQGFSkmzfET8y3PDiqXjnUQiu1YvGCAY5JPAshV
         SBZKWJP1TAnS70gzHVNpOqj5x9vXva3yxLBsMpXDintMGRSCLyMLxuSdmvt0EYk+fHtm
         HSFOGGvee3YutQL09QSBpxtuce76u+i/onIAVXMeulu4yURdZGLQ3ZzJ0rwIkj+YkQ1b
         wuHantC14ON19TrbKgJS7/EG8RFkHl66gyHsvW2HcnvgEZsJuT0rourfuAF2RsYV5hTr
         554g==
X-Gm-Message-State: AOJu0YzWDhFE4DeiLLXsnrcKfTBuu+dXWNdHtHTHkOQknKsXW1JdoKaJ
	gbKp3BiLb1h/W/zQO3QGaPniRPIoJYTeShqarXv73sCQSZa3l/0rEN3WUsxE
X-Gm-Gg: ASbGncv7kCFaoz3iJVawnoT372fYsC0qgsmJ1px3hiP6DAC4cLvVEbe2u+9qvUL5FKC
	ugIk8Bz4pc3dwEAbCd9TJxwbCSFGwX30djqk4se2y4Bvy3hmnw2GeCFgTnbTH9hDacpNg5trVlj
	SC6c+wKSRgQqEP40iJygXC9x/dvIlA2upd25n7BHB25ENpdxc8S3NbrJJ31QHD7sPHzkjpQnLMU
	wedJoWt+BkPmGeEv1haS4yk4C3uHlmEkKWyNjdz+onoxn5v
X-Google-Smtp-Source: AGHT+IHMyYKwtwr2F99EV7Rdz9ld2Zh+WndyXR3wUszmeVSGGKukcQNQbcpjTm3v2vwCx6WKLBHDcw==
X-Received: by 2002:a17:90b:2748:b0:2f1:30c8:6e75 with SMTP id 98e67ed59e1d1-2f5490e89e0mr23915081a91.32.1736743568163;
        Sun, 12 Jan 2025 20:46:08 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::65e9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f559439ae4sm7614921a91.30.2025.01.12.20.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 20:46:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] cpp-netlib: Skip recipe, not buildable with boost >= 1.87
Date: Sun, 12 Jan 2025 20:46:01 -0800
Message-ID: <20250113044603.3467963-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113044603.3467963-1-raj.khem@gmail.com>
References: <20250113044603.3467963-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 04:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114823

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
index bda5177fc4..3cf166bd4a 100644
--- a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
+++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
@@ -28,3 +28,5 @@ do_install:append() {
     sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/cppnetlib/cppnetlibConfig.cmake
     sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/cppnetlib/cppnetlibTargets-noconfig.cmake
 }
+
+SKIP_RECIPE[cpp-netlib] = "Does not work with boost >= 1.87"


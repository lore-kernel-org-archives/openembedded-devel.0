Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFA9C48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 19:26:44 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.80245.1709494002240124469
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 11:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jnenZiUr;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5ce2aada130so3382843a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 11:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709494001; x=1710098801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QqDIWSs1zhwzTsPiWz2kyx/KUG3BCDoIZvAZDeaIP4=;
        b=jnenZiUrd5iEfWn8GD0U8q42OmvZndfg6zFAPNObTwowlBY8YqTAdHk1BC/gRKnMLz
         eCQrnyrdrOX167qZTI2hv+jLPly7ZE0F9/lEX/64N6De597NBKqsCWn7sCvvv8daZAfy
         FV0Nba3vd4IXgSjBDGUj5Vj0UFtwfkimIYSEOhgE7qqRtktXjKpwmSvaHnGT846EIJJD
         nIGpmZ4qoqGS1s0bv+7yIjGZNiP9Fmupnubxw1+8kbjdihYkT6IzhUF6Su44tcL6eHvc
         bBt7CTMBLUPZdTcoDLWpjLH1lnIUgdEK0/IvDgNfBdvIHjEBEnLUDO0G1Yv0XlyEXsY7
         SXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709494001; x=1710098801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QqDIWSs1zhwzTsPiWz2kyx/KUG3BCDoIZvAZDeaIP4=;
        b=VYbY//JY95wUWWAUP6GXjdzKVJEaXOGXdysUer/xJFmgtz3g5HC1WuJfBNlr+yUCP3
         RqTK6DO4bhfmCWotyPY0Hcoq2F0LxGZ74bvvncwduPX/clFmEzJehjDo4Wl+tT3jG8AH
         rLWlHwFnhYuQ5VnqnmVatlJ1c9CnHDNyEU+SfVNYKXshE4dNNO0UGTmPd3umeYO1bO9T
         vcKb9+LdElWkrWVI7p5QhFDwIJ/XaqwlpLNnD8sxMuuAJyHgqzHuSqfrDhShqBWS3ycN
         lmEF37z3J3S/y+bI+FJdPHevMbxrpes4dWKuX/G4/caUea59dM7DxKBy5Ndc2CxZuoF6
         s1Jw==
X-Gm-Message-State: AOJu0YwKfL5IWW2tSYTKy1i30m5BSZtwTAhUR3Wm1FvfIp62BmQJegNh
	PX1Sal8Kxcj/+vjC6Yk59Oy+01eiilFdxrc6L7IYAr4Eh9wmW1wDBWuNgqqE
X-Google-Smtp-Source: AGHT+IHGSO+mzbRaXPgI8AZmWyCJgyc5pC3CXPgu5GAwX54bdW+GTSsCky9L4v1ybuhXgfzx8zLN3A==
X-Received: by 2002:a05:6a20:100a:b0:1a0:ccf2:8f35 with SMTP id gs10-20020a056a20100a00b001a0ccf28f35mr4394877pzc.39.1709494001035;
        Sun, 03 Mar 2024 11:26:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5e7])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090ad48c00b0029aac9c523fsm6360955pju.47.2024.03.03.11.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 11:26:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] crucible: Define GOPROXY
Date: Sun,  3 Mar 2024 11:26:37 -0800
Message-ID: <20240303192638.4154965-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240303192638.4154965-1-raj.khem@gmail.com>
References: <20240303192638.4154965-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 19:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109089

Its needed with go 1.21

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/crucible/crucible_2023.11.02.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
index 339bb35f2d..d53e1a276b 100644
--- a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
@@ -9,8 +9,9 @@ GO_INSTALL = "\
     ${GO_IMPORT}/cmd/crucible \
     ${GO_IMPORT}/cmd/habtool \
 "
-SRCREV = "358b5e7adb7f101f870f2b42fe5371460a3cccb6"
+SRCREV = "dec27cd4e0e0db106c0a21d429c04ca8d36bbdd5"
 
+export GOPROXY = "https://proxy.golang.org,direct"
 # Workaround for network access issue during compile step.
 # This needs to be fixed in the recipes buildsystem so that
 # it can be accomplished during do_fetch task.
-- 
2.44.0



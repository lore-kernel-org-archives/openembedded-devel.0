Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D068E909C4
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:41:57 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15048.1771342909729416017
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=eW1f24i3;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.215.178, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c6e7e3f92adso190606a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 07:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771342909; x=1771947709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXJkYtA9k6wp7b3SeEahzoQo9DxzPAMhvrKpVSviFuw=;
        b=eW1f24i3w/A1ESt3PWnbo0/jZ3tQbeAHzsktCJBuVtZA7TfRq/BI5L+2Yhx1EKPPE0
         BBE21Wl2xOY0kwKA/zAXZjSFWrTwjpiXo4s6Jxqswo6dmMIB87qbPp6BVnVgun+w1kK3
         j2pXExRyLE6Zv2u7q0/htXusamjuqBSqZsD94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342909; x=1771947709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rXJkYtA9k6wp7b3SeEahzoQo9DxzPAMhvrKpVSviFuw=;
        b=lnM2OJIs3y+ozDGu5BDos9idGRIXXAo9i88W8fye2SAm0lVSWpnYskj0xMiPYvj2R8
         OeaydxcU0lyA3tGDe4Eu4xurccrhqhuySB2MfUuxsgKl09QYnvZe54+pDZo3viZibaFb
         Wpmk7BUinHuyXbjvrZdiY1IF170tJfhug5AKEYZ211zhi8uTPTFN1FF0IKkWh06Jao1u
         xzEjkwblN+DaLWMsWQIyE5cxA5Hp2wjGzVU15qw0Gcte5BugwRmGz+07YcuO9VfmbFmb
         le2z6Tl4+yC93Nx2fHGU3n5fi7hD02odQXwTnl/F5X2waDgdPGRh1qjk2bEhWqbn7l+y
         HZTQ==
X-Gm-Message-State: AOJu0Yz/yxuYUs8fecWqdGwxqwM+2Cpos1J+QK8Hd/6Hf80p/sVSfNl3
	gayD1y3K2z36IS2Vvew52Ums2ZsoDnqMwVOp49BHRgdgNqvHbVpFBCDyAaikRg/9PjMCFSVt8Ap
	A9xa0
X-Gm-Gg: AZuq6aID/NaDxVyGqwP7VGQseTUMLejDq6+Z1cZxbB4vg02WxumFWevXTl41eNYuA0/
	JIBzLAZzniWi1oHoSZPnwyADE8AOtN8QZabZgH2AfYulIh5wsUyXyT1hY19BfH9QAgMJvkFCjs3
	Te4WYOkvoozgXmhYYsqm7CXlP9AAGr8j5x2SVAMxNF5aLkvEnrIRd510pxYO0XYnOw8g2KsIFpx
	3GlJOGLqALvh0DBecBO9g/TC35xuei6JzXlG0AJ+dqKWGEp/kKFw+NwG/g2x5aBEAMc6/wEqxyL
	YnvesINSCmcBwIcPeIkdsx0Bpiw9U8HiDd1D97fJyvRoT7hpBtKa+DpBUTDpZstkERThVvYp962
	9q2+kqPssgcUph3Knvlzb0hgqVRLkcnSeyJ5AOHDpHxwCoPCuYdhUJV06di1wWIfkA1b8r/KD8x
	Dw7w/I8ZwQxjlSzz7y4Z5R+R+X/6OS9sH1fkTpAKLP
X-Received: by 2002:a17:90b:5866:b0:354:9b9b:54db with SMTP id 98e67ed59e1d1-356a7a44a05mr11094138a91.3.1771342909060;
        Tue, 17 Feb 2026 07:41:49 -0800 (PST)
Received: from adam.ht.home ([66.164.55.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fcff01sm10415519a12.2.2026.02.17.07.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:41:48 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 2/8] libtoml11/files/0001-Remove-whitespace-in-operator.patch: change upstream-status
Date: Tue, 17 Feb 2026 16:41:38 +0100
Message-ID: <20260217154144.713423-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
References: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124462

Change "Submitted" in 0001-Remove-whitespace-in-operator.patch to "Backport"
with the appropraite link to the relevant commit hash.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../libtoml11/files/0001-Remove-whitespace-in-operator.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch b/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
index c8c9922d55..9516ee5cb1 100644
--- a/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
+++ b/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
@@ -11,7 +11,7 @@ include/toml11/impl/../fwd/literal_fwd.hpp:22:26: error: identifier '_toml' prec
 |       |               ~~~~~~~~~~~^~~~~
 |       |               operator""_toml
 
-Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/285]
+Upstream-Status: Backport [https://github.com/ToruNiina/toml11/commit/dee78f822d8a5b985e565e5c1ef42a59557aa8fc]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  include/toml11/fwd/literal_fwd.hpp   | 2 +-
-- 
2.53.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629E4C5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24377.1786747592290174532
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hQOC84JQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc891373e0so22062805ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747592; x=1787352392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okJdWg9u9DQYLbfr+Cyj7g9sQzkxYFP+mP2OwbnzwFQ=;
        b=hQOC84JQXE26Ev+jsway2+zPgWuigWCHL4CuNVoYJs6/4UiDbTNnnFI6TyL0pxSQZM
         slyJkUV7DxJM/BjTrLyNP4/GCnRPAU/cI9Q1KSg+qQ+dch0mqrGK3dF7Lh9CLgN8iZdg
         PYsAJMGU266bQaEtRE33Wxs/v5pDfNbuw3dhfXNgV0cvxC/A4PfyMBzHSDpnzeF9Ncgl
         VpTXDsG0/PiE3k1QyL9wyDvqgYGM+5FqWt8MIpu9ofS1yzFrkNc9a5Z5bijQGIj8g2JZ
         QjYdJbFx/wsDL7BQh+a5hQhD9nMVWurQc6TnXGVVRUFbnAjtBjoAB2SyjLG3vGB7xDoA
         4ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747592; x=1787352392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=okJdWg9u9DQYLbfr+Cyj7g9sQzkxYFP+mP2OwbnzwFQ=;
        b=WHf69mb5RS4AnNoSNUHdoPfBsOQRLiyXWAe4PNTT87+/8jjcKBuZPr023MHqZzcWFD
         VjfnfJwRpdLfIX+LTrRR7LosQb7FFWkQqSmySL9yDahxSk43onB6NH9M359s35McNGfN
         FtIEHdnC3YFCt9B1ppMpFW/lBVGsP62rwfslVhSdtRBfVHfr9n0rranGxhFNVqw95p9l
         X0i27p1bFlkiF/Ne5bYXRaO4oNdq1X3aWOLEjpGGatrFCPdQAqGdcpm42UP8GHTt0SRX
         2Gm4HuwEmwFlgxVl1Vh68ftd82Evz2k3ROLprrOuEb+6/q4YUEE3hfe9DS0hvO2r9kLk
         tz4Q==
X-Gm-Message-State: AOJu0YxOlkKG+MbRjIRXU9NT4EsAeKi0vHmDl8Y3wKeQS7uor02yN0IY
	UCNME6yarNO+fFKaE3TzZppfQlR2Ak1Ll5ByOPc/Kp9M0Dum5GtWTXor0QBbxw56
X-Gm-Gg: AR+sD13cBzpCODrYEA5W7cU6yN3Br/7SgeP2vpaL++NZ02o8wFyCDvq8oOzRreQ50zZ
	0xNzq9W2ckQA+odFO8GgyT9zwunuzi3S8PfDesbFbD3m9q62UJOxOs9tREel1ZgLJlyGIEdPeSf
	svYv/xgJEAnd2hVT3+ZCLEddEImt6h0qSUypDQLixo8HAU3ww0TfovEKSCUk+oXXF1HzoR7gnLl
	7vkTQm9r1tifohScOaxJkHwkFFfd975LBKvpnpf+5iUnBWyvCnGYmUpHAOajmfSeiaRfKzGFpDl
	78oL46PNsLjjqW7JMN2XAbWnt8XARcjMg8YUJwSpkV3LonWMUbdvJ/AYpZ2AxsunQr1zKOuMuhq
	bXKHXcQ1ub4c7viQCJCUIkT+tQPdBkU7bilxTXlyLxcyJMeeb2/fEunTLWuCOgUAJXDqBtBZcfc
	C6/EhEE6J7u9ni6PsdIuzxiEeElorl7Js1G8gXZE2allVJK+dOONnhnvu5dVsKwsO5JMcNLzNOS
	r5fZdYL2Lt2IqkI0rv3fOYJ7QaTEPGK8bX0RRwOSUZRBt/Xy8M1evq0Au6Yb/vvQVkeIr4HGISW
	3wB1wIVlFHJk8lmLgbDl0CeBM39OpHr996yYGq2yKG5JHlvEhqr6hhpSQ+VTGBW6WP9tstnFUNZ
	stbYwtGZCRxaokXQxxihkF5OmXeWHE6fBOr13lKCoflo/FA==
X-Received: by 2002:a05:6a21:101:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3cc71d54187mr12144157637.7.1786747591695;
        Fri, 14 Aug 2026 15:46:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 044/109] libutempter: upgrade 1.2.2-alt1 -> 1.2.3-alt1
Date: Fri, 14 Aug 2026 15:44:30 -0700
Message-ID: <20260814224539.1523174-44-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129108

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libutempter_1.2.2-alt1.bb => libutempter_1.2.3-alt1.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/libutempter/{libutempter_1.2.2-alt1.bb => libutempter_1.2.3-alt1.bb} (100%)

diff --git a/meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb b/meta-oe/recipes-support/libutempter/libutempter_1.2.3-alt1.bb
similarity index 100%
rename from meta-oe/recipes-support/libutempter/libutempter_1.2.2-alt1.bb
rename to meta-oe/recipes-support/libutempter/libutempter_1.2.3-alt1.bb


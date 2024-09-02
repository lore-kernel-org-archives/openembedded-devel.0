Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA44BCA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 09:34:37 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.34806.1725269676910396086
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Sep 2024 02:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yRrgQbie;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5334c4cc17fso5570095e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 02:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725269675; x=1725874475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0WUnGoQEOVZXAQe+GxOwr2f/hqrt6BXJ5xB7JuPuHQ=;
        b=yRrgQbieafKzO+mR0XPopzSjpmjQDVTY31vWH43IQlmgT9Pq5l5sXbninJ3Y2tDSy8
         H4lKTsouGsu3/5/WTG84QGs7Wlb1PbN5Pz6Vlq1W0M4tItPIIBgLLueHE3Cl5cydEG8Z
         ErySakQpK9WAYOz+sFkFMDvMUvdGlPXPl364xQBIMGiZVj6+S3bVp+lCqQva8gJ+laZk
         p3++gi65dOprNaraSgZ/zievzdpaXliO7gOA1Ku069CQLLIb0kthmw6dVBYXiFZsAgg6
         yXxqHs+j84DU7yIqX+TtxNjHl3T4kPL+ZDik4Afve9NswIQBwlgZFom60974x5MKcWFt
         fLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725269675; x=1725874475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J0WUnGoQEOVZXAQe+GxOwr2f/hqrt6BXJ5xB7JuPuHQ=;
        b=pIA5z4Jvg6H7qkern5WEilWeM0nATx/UL7wuyy/LkRTg/xidHATdUGWtZ8u6ZV3mwY
         x6yVi3m9GqyAaH9ZaY0GhXMhigQhUfWJi/hFP6P2CkM3+hy6gGYIQCgGFLt4fACHAZh8
         GvU9yz6OWYmrHLEmdMKkRzfHzzVCFfdUSwNh/S+Rky+4PcjKalllN1U3iMNM/oeKY8UM
         t7oI6mGBbLsfIFFNz/QqL9HmhSHzMnx0kcTE74XaDsPvqvQI0DH2lCxNCcmVWoR0CUOX
         8i70VzDgMgrjzIFwDICB4eY2Lg3pI6dCD4K4+vdbYNh/HwXzXceZkxJKnMknBQjr7S8v
         jMLA==
X-Gm-Message-State: AOJu0YyvC005A5gOLBPM6fpCk6RHKRaXAyeiRgiKQbA+0Dtslaajzf7g
	So9CMlWnv/B8TQBp+5ADOht2icaJa/sVEh7PTBAGBw4WS2iCxXOdAQl5ZzlOoAGu5fEWmTVS0GC
	Z
X-Google-Smtp-Source: AGHT+IEK2PMvxvYKZzpB11XcRTZjBt5FY8uQsiVknDhlx+Q/bR+QyHuiaMh2U2gwGKfJF2sv5heVfw==
X-Received: by 2002:a05:6512:3d09:b0:52c:e0e1:9ae3 with SMTP id 2adb3069b0e04-53546bb6e7cmr6721718e87.57.1725269673841;
        Mon, 02 Sep 2024 02:34:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407abc0fsm1532974e87.68.2024.09.02.02.34.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:34:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] README.md: discourage use of GitHub pull request system
Date: Mon,  2 Sep 2024 12:34:32 +0300
Message-Id: <20240902093432.2865221-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 09:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112069

Sending patches via GH results in the reviews of a lesser quality.
Discourage its usage and point out that developers should use emails
only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/README.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/README.md b/meta-oe/README.md
index 676a2c89252a..0e9d43c10f91 100644
--- a/meta-oe/README.md
+++ b/meta-oe/README.md
@@ -24,6 +24,10 @@ When sending single patches, please use something like:
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
 
+Note, it is discouraged to send patches via GitHub pull request system. Such
+patches get less attention from developers and can be mishandled or not
+reviewed properly. Please use emails instead.
+
 Other services like GitLab, repo.or.cz or self-hosted setups are of course accepted as well,
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
-- 
2.39.2



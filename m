Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BE7D7788A
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:02:39 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.119.1769187750044508515
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L5Mj7fHi;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso26775415e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769187748; x=1769792548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gOOsdcu51ZCsZU0kL01cADSF0/lo9kCrdLeJiytWF8=;
        b=L5Mj7fHiTxEcXRrxg0AkEZjZT8HDrzABDPf6CMuuUwF4YZjvdsjDbkfrvnDYbBCaGS
         9xLQTVZ5DlV/ZKEXXaB0WR3J5WnHzEWdgFJPrT1dKD7NlQJM3VGkQRblGiD298ny4ut1
         LhceeSZP8hPkzYdV82Elzhdt22Ko/0IA613RLseT6U/cY6IbFDhpXhXugql57S5jK8rN
         vI4B6FW9GY+GaIDzMn8n34F6LvDq2fNPcWBMuyXebdMJ2cpJyRWE04gArLk56Govo74b
         /BQq5mjwApWQvE17fzjEijxCdJMr+AitKiWE75HrnTHtBQH498D5OfnOjjRGm1OWTzwX
         UGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187748; x=1769792548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1gOOsdcu51ZCsZU0kL01cADSF0/lo9kCrdLeJiytWF8=;
        b=q2iWTWupBntCiSvC+5pqZbxOwgovoeXfInJfc7EogqhH9+0X9RfgbxDyxwZIfSUcsy
         82i5YXEbHjIVJE5GYtMxDuA6csSFH89E+9AahJ1DOpauWrFZ5KESmK1il6Tv3+z130ax
         ReLu8PiJtKZQVvi2HWtAQaKwey6nQqQxcm8vMLgfXvleSTPswtk/1ckSh1bnAe1FTihz
         LVO258O6HOZgyIugsuOQ/2MP8G0hUEoWrqS6Ge6nblN7Q/BNQSkIqy3aFxmzSTipQ6y6
         EUaQv2LXfqaXYS6bkcCXc7z8Z+DIUflyzsOqSEKWyD5333ccgRJotmjnfvaaVfrb27wD
         O73A==
X-Gm-Message-State: AOJu0YznqgrXR1QufwmD0T0IBm6JOghNh2ciO//N1Jp9UPXYYs1KjlOL
	3z6wkD5thnnj8LLBSbwqWjHtaUm1Igxlk7tjcpzyNHsQbzC/uIKBh0eGwsQrkQ==
X-Gm-Gg: AZuq6aJiG+DN8gmxQNnDw4yHN6GHUGpkCqYjW1u+qzmkXPtKQb6uSGbZbzFSUpLKSZi
	6DkyOuKa01jpu4SKCO8j/ZIMY52xMF1O7l9zzWKOt/bvtl1EVVpIUtWTfKYQ132RDAZ3mXR9vOB
	p1uXvRPqhLe3qY7hYGokCX7yiReo+nNPneVibW3v4sz0QqAWCMPoRF+QndwlLNsiAGiuKOsDjb+
	TDnnzrRioc5DZTrDR1/msZXtNkW6UP8NJuKvgV2azIWueJi7df4qsNAeDy+7dK+d/mP377ZcOUw
	5GjKmRVXe7Xi1hviNqX7xzCN1PqCatjsd+/XXee+aLedC2LFklJ0zMbfJ6Xoey4BNTT72DMlvXE
	m6SltuxFXkPpXydv3owI/sVfPmX7VSJlgOR361q4BXrG9rS3FNts2NXF0y7pDyRFoD9Ggv1fn/G
	U9vFCEWnHWGpeAzIt0uY0=
X-Received: by 2002:a05:600c:828f:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-4804c9b2333mr64108925e9.17.1769187748138;
        Fri, 23 Jan 2026 09:02:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm25455165e9.17.2026.01.23.09.02.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:02:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 06/10] python3-twitter: mark CVE-2012-5825 patched
Date: Fri, 23 Jan 2026 18:02:17 +0100
Message-ID: <20260123170221.671471-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123170221.671471-1-skandigraun@gmail.com>
References: <20260123170221.671471-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123791

Details: https://nvd.nist.gov/vuln/detail/CVE-2012-5825

The Debian bugtracker[1] indicated that the issue is tracked by
upstream in github[2] (with a difference CVE ID, but same issue),
where the vulnerability was confirmed. Later in the same github issue
the solution is confirmed: the project switched to use the requests
library, which doesn't suffer from this vulnerability.

Due to this mark the CVE as patched.

[1]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=692444
[2]: https://github.com/tweepy/tweepy/issues/279

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3ee544e7591b36a49550a263a0ec4d64b5e490e8)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb
index 23ea996258..2ab6460626 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.14.0.bb
@@ -17,3 +17,5 @@ RDEPENDS:${PN} += "\
     python3-requests-oauthlib \
     python3-six \
 "
+
+CVE_STATUS[CVE-2012-5825] = "fixed-version: The vulnerability has been fixed since v3.1.0"


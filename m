Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32084D35681
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 05:51:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6996.1769579483726733981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 21:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VpyirICo;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee2715254so33271215e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 21:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769579482; x=1770184282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LZFZlYIzx7b+1sSriGAHJ/TGyWtcOcdRoXnP0Ffv8U=;
        b=VpyirICoFHZST7aFjDzwQyOc9389Dq6m9TdkkM9sophWs7JJyWQ8mFu6b78E628jAS
         WRPxDQrTZK5tbUAtejjNgKmh68+zsnX8KzjCT65IPYAF5dt4j9B0fRR5yGaDcPVFIfFs
         cbDKX1JaTsIwP+EjtVe1OZzCgDQYoYRhZs4QD6t/6hzkb7NQSfH2FJ5jXscSr0mW8tZZ
         T4n4a7lvqN5apksmX5OryKmQtrc+2aQ2CF7GYbZVoy+Zi1SaP//HC27PTj1+Tfi/KmWq
         s/oMbax6Xrb+fpkwzsVoqBrSfU0gLx660LfhNoUIs27aBJyQxA7mlka9eXM3XMCDYPBc
         3kAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769579482; x=1770184282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6LZFZlYIzx7b+1sSriGAHJ/TGyWtcOcdRoXnP0Ffv8U=;
        b=F83bVfT3os+4yNkXMhJDbIDmRoPUTewXDxQpM2ui3HbZe8rOtAWKGysbycr8IIguUV
         su4tDvXfAHZUJFqvYk/ppzrZizyBpXP3QiBwqnrdvTcSV/tt5/kp/CiBEa8kV+8WDtOC
         wh7xK+dRzvGiHAQcjR8kZY8i2Awgnv9JUcijx81PcFQjxXeEL+P30gbC1XQfHIrP5cAX
         nEwEVQvIPniNiTNIfHVru7uSLCPFhtbaHPtFGziWZN7a7O75WLDjQkwMDUlglkURd/Mt
         DTdvfckwq6FtyLfK3Br2xXOSEz9GvQQmHOeyOpZx3fuaeC0d82SGOVc+y5+cPCMeBFAu
         sUKQ==
X-Gm-Message-State: AOJu0YwLlgYH5Q4D90WC5E+0AIJOwQZkGDUNaRaaLL1Y5vigl2jE9H16
	U5u3SRvwS2LXB7ZletAQnEhiR2Lg7sh99FzLwmlAzd1eudYct+n03RhpoLXNIg==
X-Gm-Gg: AZuq6aKNWGdg7NxG+bVE+6sMcq9ZRX3pMVTyOpbyNCe2gIIc6x8+Ar4YS8fCuWhzK7j
	OUmoV3FJVgpgIrULvTGGFo6Xu02Sktgp55VqEdYva2Y9Owgm1NdJ7zkw1AxiRJP62LhY2/LlbQZ
	L5g3QtJ3M03/gOwuw9YLthVU4jgij6aer52NA7NvvsfJ1uW3AXAo8u9qT7WSYPIYG1nXm0YP7ML
	K2W2z3EdfxEMHCtjy0peiXwULKHZ2Mn+X01gLT3y4obLL5jwlFoi6tGU5n0p6VInWeoZ5aDWlAS
	o8m9szDpyRiWZkbSy11P/MoSuHk8QVHknqrFThrYT0qSvVDtx0NV4EeTL5rOfDV4VnrCIN5L8gn
	jWCAe7QDGoKjoYpWzQRRcaH4d0vrC5+70zBuRMUVMeUx3/Bv2x8neFs5pWQ/N4bK5DHfJ7EJ6z1
	QBjEl8uCoA
X-Received: by 2002:a05:6000:609:b0:435:9bf5:b32c with SMTP id ffacd0b85a97d-435dd1c0c81mr5796604f8f.29.1769579481959;
        Tue, 27 Jan 2026 21:51:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm4371777f8f.19.2026.01.27.21.51.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 21:51:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] proftpd: ignore CVE-2021-47865
Date: Wed, 28 Jan 2026 06:51:18 +0100
Message-ID: <20260128055118.2011068-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128055118.2011068-1-skandigraun@gmail.com>
References: <20260128055118.2011068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 05:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123968

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-47865

This CVE was opened based on a 5 years old Github issue[1], and has been made
public recently. The CVE wasn't officially disputed (yet?), but based on
the description and the given PoC the application is working as expected.

The vulnerability description and the PoC basically configures proftpd to
accept maximum x connections, and then when the user tries to open x + 1
concurrent connections, it refuses new connections over the configured limit.

See also discussion in the Github issue.

I just put it on the ignore list.

[1]: https://github.com/proftpd/proftpd/issues/1298

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
index b8f2b50f79..7aee6d1281 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -28,6 +28,9 @@ inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 # fixed-version: version 1.2.0rc3 removed affected module
 CVE_CHECK_IGNORE += "CVE-2001-0027"
 
+# the issue is not a vulnerability, works as expected
+CVE_CHECK_IGNORE += "CVE-2021-47865"
+
 PACKAGECONFIG ??= "shadow \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
                    static \


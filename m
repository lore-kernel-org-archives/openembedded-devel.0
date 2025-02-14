Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271B5C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 08:43:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.16779.1739522612194852136
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 00:43:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jwJoZQva;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4395817a7f2so11684605e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 00:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739522610; x=1740127410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1zvQSbCLBKEv90JQFIkdAUBpfWMED09BK4Z9cTbladg=;
        b=jwJoZQvaEprsWXx5E32xxpPhJIzji721appM71QUXUQt4zL/CkGedH6BOeYgXKHFD8
         5pj43k7SVQKDl68DrDq5rA4VY9Lo1UsIdYDkpR83IiR9dCU4x2ttjU+BOuUVHDmZ6tty
         o0L/8yf5QHWliCeo4Ea+V71rAm/TtuCUM8jhePi89wuEfIQqdKueAMJMfhzIjinEuYE9
         Wetqhv9c2JpOr5DmvNyl3hMulPy3trbNhW9u9mp47aP2ywAehztBG6JCOKnN8QyWmunU
         DAUSN7lRfxTXlyKi1T3X12/22HyBa/zIu/IjFOqV0AFBIi3H7oa7x7CpNGS9nDJCCaSX
         p70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739522610; x=1740127410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zvQSbCLBKEv90JQFIkdAUBpfWMED09BK4Z9cTbladg=;
        b=wBrr0yX+eJ0RrQ0QtPUj32Canx3yKLOu8qoiKB26yjEHVyCrOHR7N7NqHTeTIoAAfi
         Vdjq1flZN+xvE33SMBqEiwy1CV/EpIsPT8mKF+BhnNe5rn/7I0aeEf/s8OxJeUtRG0v/
         XOGAOmRwdqDk6KANVMwiYZ8PsDne2Df2iDaeuywZWOESox/mUvKRhUI+Ou/i8SrXjymU
         l69UyyXBdzBwKdtGEKPPS5jru+z3BZ5AInSjOmM2N8RIRHBvRxKTaK9CJ4tFfdwmmAgd
         qFkvam4jrY3CnwFchO8Ci9TvaKuXgJEUj8kYNB6nahTvVlRvlmpQF4uFW7T3ej7l/Pmm
         NSSw==
X-Gm-Message-State: AOJu0Yzt1t3a+HXxyRK3bo6Zz0I8bHcOMxF6VzVDyTeT+AcQkLYHcwBI
	ASWSWTwbmRyW8EIjB340koyPPeQV5IpPNTZ0rbM9TLtSwUtUhXv97ZBqBg==
X-Gm-Gg: ASbGncunIuZQRnwkA+9x/MPjnjFUFbRJu9OMKi/ovfPrkg4e9Jo9jqf7eHZgsmy/XlS
	79DtLrASsjeOWeTNx8XGKYGN4+VJmr1hlwzWe8hoPdLKjR25AdqmmNvrseu9E7mok5a5QEsPo2T
	dxSqCKjouDjGEH4nuX75T8rdjr0lNeEw8znh0mXnpojM4ueWHdZFXVer9aPrq9cH58obHWqM6tV
	stZetNPDVLoEFb03BgXszfpUwISbjD4NWs51bLIli/jIgzlPDcct57FyN9tz+Lwd2nhfnZaK8h4
	JkCDnA6BTwdw+zxooDViELDUo9bwM3c=
X-Google-Smtp-Source: AGHT+IGFGiGZBclhlN5uGVqRKczEw4/opuSZIdPCg14V5BX+j1O6QHrKS8df+oyCmqwfwhal8Xh7Xg==
X-Received: by 2002:a05:600c:3f12:b0:439:5f7a:e259 with SMTP id 5b1f17b1804b1-439601a7602mr81350745e9.23.1739522610105;
        Fri, 14 Feb 2025 00:43:30 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394dc48d9dsm56180335e9.0.2025.02.14.00.43.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 00:43:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pax-utils: fix pyelftools PACKAGECONFIG dependency
Date: Fri, 14 Feb 2025 09:43:29 +0100
Message-ID: <20250214084329.1203473-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 08:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115479

The correct dependency name for pyelftools is "python3-pyelftools".
Set the dependency name accordingly to avoid build failure with
this PACKAGECONFIG.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb b/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb
index d512c85704..4e80ca87ee 100644
--- a/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb
+++ b/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb
@@ -30,6 +30,6 @@ PACKAGECONFIG ??= ""
 
 PACKAGECONFIG[libcap] = "--with-caps, --without-caps, libcap"
 PACKAGECONFIG[libseccomp] = "--with-seccomp, --without-seccomp, libseccomp"
-PACKAGECONFIG[pyelftools] = "--with-python, --without-python,, pyelftools"
+PACKAGECONFIG[pyelftools] = "--with-python, --without-python,, python3-pyelftools"
 
 EXTRA_OECONF += "--enable-largefile"


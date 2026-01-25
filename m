Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4143E63CBA
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 17:06:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42801.1769360789228619831
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 09:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ksRLDGuZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801bbbdb4aso32388935e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 09:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769360787; x=1769965587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXL/nI43Low91f1VnRyMF9anrNhBPbke6ohlPKPfzUM=;
        b=ksRLDGuZq1VNbNRGFOY56mXeC5kRjhS1cRwQQAT2aNY7tfRT/rl4jUdRBkvCGE4NzP
         nsyJsVAsu2GHyzWeXXl9s1Wmb2gxIEA+5MT18BgiiOAy3a9lBEphBcH2ppH1+tGYUSwX
         d/3VQdR+qSVha4mJn6WwazyM15fY0afCQaqGlvWv2gHnoPkjt7tmEclGGLLnHfyyzfJD
         Y+QXr4zEMhIgILY0VfjIaTFva+UbKGoMAqsQn5puj4FHKSUVQBJhbdZmhZhfda18XtO6
         +hnDip8BB/wQroPNti3b0CcpjOyKhCzUL08l9w/izpfJi8P+6Y1dz673ZqAD3Oj5xqu3
         wt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769360787; x=1769965587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kXL/nI43Low91f1VnRyMF9anrNhBPbke6ohlPKPfzUM=;
        b=v68KfNZuW8q18KuTWmpJMlHuwM3RnpiV/zjLdPEf0vObE2UUjD9HGiEThF8Xjltcxt
         W1TCisQcqS+f5Zp5rKwPGs3jEab+j23BD66B4QLZCdN5FGMGwjgzDt2jGXlPcv9sIhim
         39y79J59eZ0lgBVWtMwaVMxiGntItYiR45M3qEwGxBM6+lEMejwdWyCk/bvuGoyVi7Ad
         dRmhlWy2MOQjMQTx7pZD/OEyqw7k+BzLCqD00KTAJwPoBRC4E7fAu5eiBVCYNrXFvWvF
         faSJ+IMjcMQ7IzdvbMjR5ZEAq8QZbBz7wXxmtqIoAaYmqG4xNpi0/bLvP9peXUf2Ttac
         0dYg==
X-Gm-Message-State: AOJu0YzZhp5yMI1HvxvYf6cSVEnGCrziS2KJxWYl42fb4F5GhSo6/BYX
	ABZKT07FWXcM42tyHRByuPWDnYHHp5/VmZfxFoL/EF6cJYZLdfm58arKwvwTdw==
X-Gm-Gg: AZuq6aJ/2YH+6CoL7fsRKR7nlaN6MCVByqP7LZLE1O3STIp2RfPN52DUjOlQMFvXerL
	djVzqMBYbztoCIS5Ty+8eHc16fvAEcTP0BPjY9KDoqCE37ceNvER4AMwO+Rh8MeqQ6k2izUvyrN
	tbPXAcvUVctClwyeVA7F6JDnuqk7KJ0LURD76ABpDVqGyR7ZXYGj9VtS/oYwQxMYpFqcdCGXwAr
	++d97VnM/ABP7Z59OMn/LyPFT5KDMKFwJEmkDnxQ2K4o4FF/jABiZt3B1WFMWknX+JIrQ4nIaP+
	B5e+/zgB4xHgV3SaHqBqfq40vLvOWjQxoWOqcgeHPuNrtnIRy0l1StETz3nkz7MmFmY9fiuZl9c
	uD41UkUwtFFHXRFK2/q9zxRKE5maaXD7qqm1bwmI4xgkUpLVV8rqXNVJPV/cHLtCnvBbkXdpWm0
	LsZM9Zf+wk
X-Received: by 2002:a5d:5849:0:b0:432:84f0:9683 with SMTP id ffacd0b85a97d-435c9d1d050mr3425159f8f.24.1769360787321;
        Sun, 25 Jan 2026 09:06:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1b6e2besm23431414f8f.0.2026.01.25.09.06.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:06:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/6] ttf-vlgothic: fix SRC_URI
Date: Sun, 25 Jan 2026 18:06:21 +0100
Message-ID: <20260125170625.3178555-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125170625.3178555-1-skandigraun@gmail.com>
References: <20260125170625.3178555-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 17:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123841

The old URL is inoperable since a while - switch to Ubuntu's mirror.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
index c7be162b1b..e34770d520 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.en;md5=cc06b20e7a20bdf6c989624405378303 \
                     file://LICENSE_E.mplus;md5=1c4767416f20215f1e61b970f2117db9 \
 "
 
-SRC_URI = "https://osdn.jp/dl/vlgothic/VLGothic-${PV}.tar.xz"
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/fonts-vlgothic/${PV}-1ubuntu1/fonts-vlgothic_${PV}.orig.tar.xz"
 
 SRC_URI[sha256sum] = "297a3813675fbea12c5813b55a78091c9a5946515ecbf9fde8b8102e01c579f4"
 


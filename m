Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2074CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 11:34:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40950.1782128082324282647
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2026 04:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=OqXejRiI;
 spf=pass (domain: snapchat.com, ip: 209.85.128.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4923139e940so24865125e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 04:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1782128080; x=1782732880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IsS3EKdFYMiGcTskOfRfGEyH/x/F++F7/MXYsZLa40=;
        b=OqXejRiI3xD1vONSBp5K36mewaf5FhokES/7QoQJUIH4XKswz0vbex5hDCGgQ1cSzS
         uLYNJZlC0WfuPYZJpBnggU/OQTbemtt9ADtz66cQ91bhmHLJW5ehNugQoKuPZIoZscrS
         qtZGyvlE7rPWJL5BVz3c4rUgTaR0uxXZ6stqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128080; x=1782732880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IsS3EKdFYMiGcTskOfRfGEyH/x/F++F7/MXYsZLa40=;
        b=aosFLtRt6NIWmy899ZgDJ1Q/NccUUv7HNwHeenAg80gHclQ9o5bB2VwKPtMeJvg5XQ
         6bbtCA4YIsM5Mcw/36fj2AoIu7Jlj7DIApmL23hMJDT017uOEcpbnSP6KDpR69cuBuFC
         0trmMK9yP7mev+xcZwe5h3dhUmBfuG1cFo6FswiaRLK2TMy7kCnrZSIlhWgWLq2PecJe
         Z/+27gRATGfI/ILQ8kPdcZKT1nJ/M9isMT7+Spk61IKY+LInFazd/BZ8bAqmysMty4HL
         1avS9+RN3KUuaTT66N5W0CHqkxdfhF2SA4+fe5Ey1/62/qLi7+k1CzlmYnv4Mx8CzErZ
         3bYA==
X-Gm-Message-State: AOJu0YzEkV3Ifq/+pEs2YIC994oJkWY/h2ERODWrLXO+u5uhZQOxeRFM
	j5eiZom8lKRVgktT/+e+WurWsTzD23oE4StEEPtbjrbnJtwsDlm4ZOsdZSdTZyTCxFAkk0Q8G9j
	ngx74iB0=
X-Gm-Gg: AfdE7clkEx/zJm1SClr190y2cCAhwDOETNDhopGcubEt+GxhGCf2Y1dWBvWUQqYzGub
	ig9SZXj8AlWkAZxYqHvR5TKhU6T6/RteKAyyESLFll4P75lZVK+PSGBSLeiQsjD/FjAahPcA50W
	wTdwWYdnxt6PgjCXIvmEljS0DwvLwIFk+kYM2bJsD0z9AgI2eEmbwYaU/JhayckibsuXKa29z92
	X/KI8XDeIlVu5jaO/BUoKZod2TvjzBgVuTyEjGE545sFOlVv3ARGZO/GxdjjnBD70Ue/95nc4Pw
	nZ7hxVloNJB+QQ1aNL9DzeWWcybs/9kFykntbGQi+hDDPlYdElfcKfEOlHLPxX5WbXOCvxbCon4
	OB4EiCGuqLPBpxyPxyvpIiig0+Dh3PMA1MRLZLuflPSpki1XE/0gnht8d+5oC3+SPiFJz+7OjA0
	347lRu2MSff/Ur82yGpin6RXMfYap9Xe+b9XUnUv+wGQvnB9b/MFhLQOGDnUcSQhVmbm4=
X-Received: by 2002:a05:600c:6989:b0:492:3445:ecf8 with SMTP id 5b1f17b1804b1-49242326ca4mr201668745e9.3.1782128080364;
        Mon, 22 Jun 2026 04:34:40 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249207dabsm353304205e9.0.2026.06.22.04.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 04:34:39 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] contrib: oe-stylize: fix warning
Date: Mon, 22 Jun 2026 13:34:28 +0200
Message-ID: <20260622113428.711882-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 11:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127692

From: Etienne Cordonnier <ecordonnier@snap.com>

Fix this warning:
```
meta-openembedded/./contrib/oe-stylize.py:3: SyntaxWarning: invalid escape sequence '\ '
"""\
```

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 contrib/oe-stylize.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 1fb0a5bcc0..e48b4dd5c1 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -15,7 +15,7 @@ TODO:
  - backup the original .bb file
  - make a diff and ask confirmation for patching ?
  - do not use startswith only:
-    /!\ startswith('SOMETHING') is not taken into account due to the previous startswith('S').
+     WARNING: startswith('SOMETHING') is not taken into account due to the previous startswith('S').
  - count rule breaks and displays them in the order frequence
 """
 
-- 
2.43.0



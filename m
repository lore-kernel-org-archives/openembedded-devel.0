Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0F7C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:31:37 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18683.1784626292784316293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fh7bsw7T;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4728c12ba97so5568433f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 02:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784626291; x=1785231091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEj5ill7RfBY9UsIjUfKlnKqGOCG97huEJTmZJvbjwk=;
        b=fh7bsw7T/YPyrII4KX9MdadlZFP9JouAm97VgN+bqiZZpDrpx58dtYYVQgXrRH/hKo
         KuLUZMYhIAm4fmeeP5jUZTrKuagnVf/KV6BZLBBCkGj4L//lUNaO96F8ohySNJh77n9H
         /54QPfCgwZZIrL3UVKqQH3S9sTZhFO0TBBEXKwfb7M2ctuLC1kydWWL+XlPHW4BlN/Ww
         1U6CZ5kEygICwn2kZK7Ciwf9htMa/badJBqSSFbjyIzyqI+iFOgaq28fSy3TegQLtuZn
         Drte6j6D0Oi/LK0aD27K2RGZXrMgHs3T39EKx3XFOJmODmWMHrVkTAxBVuI915xVCRwl
         enoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626291; x=1785231091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wEj5ill7RfBY9UsIjUfKlnKqGOCG97huEJTmZJvbjwk=;
        b=PEYPMWS+ERKpiAhFvNDlh1F+kQyg+z2S7LXVG3nVnKnsRFGTgTToLzEigWL379FBhz
         csvW7q37J3ho32/bX4lDd2bcgXhBEWnSsDHEpwR1BAqIv4cuavruknHForu5ItjelLKw
         or1qId0KalA+zoR9b3g/AB80l7TDjuZfoD+owVWCBHklYNqS9dOz2cwVu2CzOyTW2kyS
         a2m8lvTJUV4JEOQzcVevAQhKwpCz37gIWry2sEjUBcPWTfK/bfwIW2b2NRJ/OUWigqad
         9ERxwTmMI+IPztKGLdP04KYpVOniY2WDNhygi1KkaVcDOEQmTUQEng0Kb1DnzD+/lijn
         fpKQ==
X-Gm-Message-State: AOJu0Ywn3RTph0mYoIZ1sMjkrHWjN6nsY5HT2rXqcBv1MhCw7E1Y+SVn
	lhfLazFJy+SGdLN/V3/M4DT9Qrk+uMR7jSELdjg+A/TSKFIRO8O8siyGhHDHRGRy
X-Gm-Gg: AfdE7cmU9wQDxzHVjURA3rkSxgQJBjNFP2Ff581vDbiX4G385TpvSpTw1gDqAAJPO7F
	fMWr6Hm8xUwHMDCKIcKszMuDItKi46wGuI5MZK+p5I66E9wGlFELItZe7GDcz2cwLiFtv2wSiVd
	8QuIPmtFiTpfAX0DTKF4Ai/gN+eaLjJdEeU4BiiQSpF9VF6ymPY93NqHmrXETMBTHoXB57SpgKo
	4HCHRGMTh0zm9dYNHqLwWlPw3ifxMQisXQzd7wg08pMukW+HCgvNVqjRZ2fmObuD1dtvzTDsu3j
	+W6q7ZUlMcsRyXhDOIlIRi3J03C6JolGwyqE0/Gb3Akj7lxMaOg/kKo+FUp6cz4vpVG4gRAsJmn
	0UEc0E1jpmEhNVfk0wSAo1+9eqOAiCjyA6CGRHgSLIuXUlOpnyzZFHcp17cdn8Pw/U6Uq11b8H9
	8yXqgNmyg7UhSzSSKxfVtn+rjKwPOGvd8W0xPS/JzJtbgoYqm3u7JoGCwIghN/
X-Received: by 2002:a05:600c:b96:b0:493:f6f0:d66b with SMTP id 5b1f17b1804b1-4954a3ec771mr195339025e9.1.1784626290922;
        Tue, 21 Jul 2026 02:31:30 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm40147410f8f.22.2026.07.21.02.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:31:30 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] mimic: update LICENSE format
Date: Tue, 21 Jul 2026 11:30:39 +0200
Message-ID: <20260721093039.2675786-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721093039.2675786-1-martin.jansa@gmail.com>
References: <20260721093039.2675786-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128344

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
WARNING: meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb: mimic: LICENSE is using an old syntax and should be upgraded to: "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND LicenseRef-BellBird AND LicenseRef-CMU-Tex AND LicenseRef-PD AND LicenseRef-Sun AND LicenseRef-flite AND LicenseRef-rateconv"

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-multimedia/mimic/mimic_1.3.0.1.bb | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
index 93c19a1f34..38c615f493 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
@@ -4,17 +4,18 @@ HOMEPAGE = "https://mimic.mycroft.ai/"
 SECTION = "multimedia"
 
 # "Mimic is available under permissive BSD-like licenses"
-LICENSE = "MIT AND \
-           PD AND \
-           CMU-Tex AND \
-           rateconv AND \
-           BSD-2-Clause AND \
-           BSD-3-Clause AND \
-           flite AND \
-           (flite AND Sun) AND \
-           BellBird AND \
-           Apache-2.0 \
-           "
+LICENSE = " \
+    Apache-2.0 AND \
+    BSD-2-Clause AND \
+    BSD-3-Clause AND \
+    MIT AND \
+    LicenseRef-BellBird AND \
+    LicenseRef-CMU-Tex AND \
+    LicenseRef-PD AND \
+    LicenseRef-Sun AND \
+    LicenseRef-flite AND \
+    LicenseRef-rateconv \
+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a2c2c7371b58b9cdeae0dc68846fe9f1"
 
 DEPENDS = "curl-native libpcre2"


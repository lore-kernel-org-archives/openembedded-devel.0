Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4CFEE57E1
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:49 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81868.1767167685799128893
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZxuopbCQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso108773295e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167684; x=1767772484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NkoHMc4R+SK5Wa7Zt5aatuNwuPvl4C0htaaFGVTIcc=;
        b=ZxuopbCQapU2vFSerbd5dDK49ygMtzk+JCTBF3zqspyLlalO7VPe8IXMLit9T545lL
         Nm540F3HExZgGMzaZH3UCHyqZNREoESyB4Ja01QGVZjR3X98hms3dYSK9EFzaEvPF4CO
         IHhQTGZG7ZKCnRb3QSyeWRp/Q6EdHNh6UIFv8ythpyS4W2sgAyoAjjQVh9G/J4r9lh3w
         QZGl+6MrXK8++tmGYKUeQuzOWwkpONI79Kya+hKJ0S/bBfcZ4zcrO3yj34w1339FiVRv
         xrMOcQc7PQOP0j7I1C6HLscPHRV6O7h1OV95N/vuXEw533zAuS82n9mMS5H175jfL3dJ
         HuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167684; x=1767772484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NkoHMc4R+SK5Wa7Zt5aatuNwuPvl4C0htaaFGVTIcc=;
        b=Z7bE2NLajRAwu030lpvA0apOQsTN/9QWf+rl2e62BqRsvorTuLIO7w9vYp7iuvTYkp
         iNXb8vct+U6Xi0lAHTymcug4GeziNHnHZJmwDG2MXG1SzizdqxeanSplpNBEvgdgPTiG
         25l8srcGKINkNDN1UeJHIAuBhM0ZYQUL/DTcRvtreYXP5p+R5tBigHNBnIPD/t4FTxIg
         iVExvnW1K/Sp7y3drw1hM8lvCdk31zv4Yrcbu/cJ6y6VSvUCRLy8cdI3U60SjdirzBAY
         UUGgTa7UHJ+dRJQvDLh2zhgp/n6UW8OmEnbiPnnvsLsFPa7F3HZ81h6pYASEmpuzeG4S
         yMQg==
X-Gm-Message-State: AOJu0Yw7aaoE4e9nzrxx3/HxXKhe8Zu2utsBKHprOZVSubj9ZHrcC/kZ
	5D0QOQera7DqLbRUra1zvbj+nTuxv/XGJ6zDoXoV/21MSa80zc1pPsUKFw/TMA==
X-Gm-Gg: AY/fxX6rLlXbLWEW1fCBWkzK90IUHth1a0PGZdsYai8vdsqc279VVIApPjWdkWP77XJ
	4qvEi7poDk6ocPiVuFiU1WMpDW+7B7lAV0LPd/7e0Mqz3FAcu08bakBgLrca7sOoX00ckIGR5qI
	dVlrBCYN/6gEnv14Btn5e2Oj2SIjrqyqVeSzSG16+MrBG8NSiecPWjwZ3LWG9b4zV4DNJia3HE6
	6M5U4xelWFxVMzMUI+xwA6bOjCzlkSvSyR0jplrH2ppgsjcmVgSGv8RDVO7zRbnIrmpCL4WTfTm
	qWRs7B8/8xsPVMDnBAW1i6XhzkyYts7dV5/dX0ACXX0WDWRKooq18AptLTAdrK30czaytjf6Wci
	s8T9FqBHnis6dMvDE5Ee79YTREkMJiHxPv2XmQoMjqh/umca1j8jJVXUBXNvnuIkw+SWssYQMqA
	zWYeneDvo7
X-Google-Smtp-Source: AGHT+IE4qCLryhVFLeTkrK8hry1GjfJ/lQBNznL2OjsTMKw1Y5sFJQPFnThxTwAFuMHYfPl+Pkdxzg==
X-Received: by 2002:a05:600c:1d29:b0:477:df3:1453 with SMTP id 5b1f17b1804b1-47d195a06abmr422647655e9.28.1767167684181;
        Tue, 30 Dec 2025 23:54:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 10/34] python3-mpmath: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:12 +0100
Message-ID: <20251231075436.771395-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123050

The CVE database tracks relevant CVEs with mpmath:mpmath CPE.
Set the CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like 'mpmath';
CVE-2021-29063|mpmath|mpmath|1.0.0|>=|1.2.1|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb b/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
index 236fbd85bc..21bae9778c 100644
--- a/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mpmath_1.3.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bde3c575382996b75d85702949512751"
 
 SRC_URI[sha256sum] = "7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f"
 
+CVE_PRODUCT = "mpmath"
+
 inherit pypi setuptools3
 
 DEPENDS += "python3-setuptools-scm-native"


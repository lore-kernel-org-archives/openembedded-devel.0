Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D40C43217
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.2781.1633977709887457853
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dAS6h6Dz;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id r18so59213991wrg.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hHIb4QeWsyJU4cOcZ6c/+Xtgk+EQ1xDsSstdPP7zbU8=;
        b=dAS6h6DzoDQhixRpOA3H0v6DS3nRVwZgwFvFLqJe+6msm8WrgWsHSaonjd9WTTdqnT
         Ow9n0oFAIy8CV+DGBAMXtVHX6QJvW7WZxmA64YcWHy590ufQCZVBrEY8wVEXDjva1lfR
         Kcx53OPqbaCg0MILvYWeOnJJ/Dijw+eg45k2DJ8qMtav5x3wLBpwi1h4Z2WvGTe8ofur
         EjDTsylwh7zaxm3HHEQedPmjdr0vIequh0jiGt0DhPnybQPFZvFqXt3SPmpkdASDraWf
         MtvhOJQ/E9wJUaiImioA75TFKvY1JnnrOD0bMO5BPB/Zmw87YuVmv93qvt7OHJhXA0zw
         Nuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hHIb4QeWsyJU4cOcZ6c/+Xtgk+EQ1xDsSstdPP7zbU8=;
        b=Zr1q0EkreBNztrFGJaMtPztsKKaC5ul7CvR2zXJ81k/jjnv9N0b16Yd66n+WIsax1n
         IMEDP56/pyFtORjQM3oVD7IyCIah6tjsRgoZHz0ENSry3dTJ7v1aV8y8KrGvA53Dl1YQ
         ugWJduldwZtqQCl/rmuiP17ju8XjSX1HmM3Rl/mgovAgXA3uD/P+vMvx0w0bJrgLMZ1S
         ti9IZBHQCy0cjcaauH2NoH3Pn5FC1eEEQMI8PKJQeCbHIKbFwOUnrt52dZLJNa48t05/
         AIzCSg0xQdpWvYWbEYKYglADUEom4+tKx4tYADSeX/hyVeOmjHcKfmYMZlg8hEJxSioF
         vqFw==
X-Gm-Message-State: AOAM530pvTtM3a4a26CKQqDawyBqCvDH7JctiCx25X0jE+c2AghfKMSj
	oolbXXZic80WOYe6h+asZ8kTpzcWuicjgA==
X-Google-Smtp-Source: 
 ABdhPJw2qqqc6vdcr/g8YU2X3M/CcxppRMLU7CLQwJQwCzhlY/BPphZ1j7WCjhcKl6k9Yhagyj+0eg==
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr634486wmi.173.1633977708541;
        Mon, 11 Oct 2021 11:41:48 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/24] python3-gmpy2: update 2.0.8 -> 2.1.0rc1
Date: Mon, 11 Oct 2021 20:41:21 +0200
Message-Id: <20211011184140.653609-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93219

This resolves python 3.10 compatilbility issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-gmpy2_2.0.8.bb => python3-gmpy2_2.1.0rc1.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gmpy2_2.0.8.bb => python3-gmpy2_2.1.0rc1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.0rc1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
rename to meta-python/recipes-devtools/python/python3-gmpy2_2.1.0rc1.bb
index 976f57ab2..d3150d665 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.0rc1.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 DEPENDS += "gmp mpfr libmpc"
 
 PYPI_PACKAGE = "gmpy2"
-PYPI_PACKAGE_EXT = "zip"
-SRC_URI[sha256sum] = "dd233e3288b90f21b0bb384bcc7a7e73557bb112ccf0032ad52aa614eb373d3f"
+SRC_URI[sha256sum] = "86cb6d8e5837560c32c706d48d6ed25676be6b3c79e6aa5d245965b9e99231b9"
 
 inherit pypi setuptools3 python3native
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1



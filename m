Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FF3106B51D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21199.1774441274761902017
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DcLGyj4B;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48538c5956bso8149245e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441273; x=1775046073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOF5OEPPp1S76GosmEm1YIvi/fNcKLBhD0Q0M3buX1o=;
        b=DcLGyj4BBzCevAJH2eonIWAjUtuTfu6oLS32+Cjx1ctELmRvMrcPL9VHkB/AMCNHFa
         AQ9BYldHf1yOXhhKgcx6kcwDxeoybaEwg7P8h9Pmnf/AI+8KNS6Q72rcDZQJfCgwByq8
         nQTSce0FmelASCA2TwhLWh5IomhDIb/H7PnIWMcZ4sc57+3ktuxTuE6ZitMZiIib0gR5
         //WLmS1kZOpNAZimwypZkqma3JCwDqNkCExTi+6a/6N35sVAL1uhOTP1OqYmnXMGNmiS
         83Ef3FSf7hp45mJGoxGdqT7/H7VZQUrTbBz1mYAAyfE/5UPKFzMPN/NeYKTJaDMjFZ2p
         2wKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441273; x=1775046073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QOF5OEPPp1S76GosmEm1YIvi/fNcKLBhD0Q0M3buX1o=;
        b=knHvY9YOPILKiEGq9aPlgTc119A4RV4lhO8iA5/3MdENKYVrQd9ePkXaQ29b8BPcx+
         j+oe9Jx1E8wgFFCiBn2yiHMlq9rX8ETduthDYnXssIXiJUBk6MFn310tqJUmrXwoXOpe
         Yh5mBUKdOwsWkpwq3v4H46kQ2DccAIKK5WRvxb5hma6VBoZNCH9As1ZRSAlwZ4uk0mW1
         kIV0QGG/HMU09p27T3KuTpixH+TN2hQ6UASXxjtTTp/t3IUfIJyfe1BKsqyqJN+HP5PO
         XUe8TSj1oT3KbGrHRsWScPgYasZV+6jZxPIedryrZlqZ5CIKeqCrEL8hzPtQO42fpWW6
         FEBg==
X-Gm-Message-State: AOJu0YzwO5lJKp9LeFU/aiW3gIPSJjfBII5fsK6v1f3GXN8HXG9hOyfo
	2tnkrXiCK/g4seUteVzAv5E1/ydOjLoOplLpr9AF6+vllgg2Yni7WF94ZYX2Kw==
X-Gm-Gg: ATEYQzyhc/eUyeVLSYymSMQ3iqnZ8CRXMHSTuPWWs5YuI2XPr8lGMCXz8Gmc4y28Nms
	d4x5yPyMZ0wfLLXLJPJ7t/d+k3Nr8siHtTyVcU0ujbb8dGc3aRPxhneCyFgd4w7JITvVaX08rgU
	VSnBoxGWqwZWCVvP//TPnbehzaN8uvplG8SDdC1v+UXNYiTMU3M4lP6tHuOxN1zCtviNVoD66P7
	5MIomYXcP4ferEOtlb1FNn8uxQV9XDkZt7h63n4qkotxYOBJa4OJzgTC8bRSjFVG4Ur18bpsafY
	YjaPHTiXHSzt3VExrr6EfJRiXK2I81m/Gt3VOMBJGjdfpPFvFADHoic3XXqmoEpQjNqsfKoSFC6
	60hLHUhYyEQAz7y0OEkMqHlGCKldfxOUqWLlwOeCTP0KlgCtWjBYBSwhaqKuwZLFYfW3iZdGjF6
	oGus8IYvHyd1i2UQ==
X-Received: by 2002:a05:600d:8448:b0:485:3f58:da2 with SMTP id 5b1f17b1804b1-487160aae4amr37395395e9.16.1774441272875;
        Wed, 25 Mar 2026 05:21:12 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:11 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 09/15] mraa: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:35 +0100
Message-ID: <20260325122046.1211090-10-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125616

PYTHON_DIR now contains PYTHON_ABI, use it for correct
library path, include and site-packages locations.

TODO: fix building the python module due to:

ModuleNotFoundError: No module named 'distutils'

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/mraa/mraa_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index f9b4122439..549f7a643d 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -24,9 +24,9 @@ inherit cmake setuptools3-base
 DEPENDS += "json-c"
 
 EXTRA_OECMAKE:append = " -DINSTALLTOOLS:BOOL=ON -DFIRMATA=ON -DCMAKE_SKIP_RPATH=ON -DPYTHON2_LIBRARY=OFF \
-                         -DPYTHON3_PACKAGES_PATH:PATH=${baselib}/python${PYTHON_BASEVERSION}/site-packages \
-                         -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
-                         -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
+                         -DPYTHON3_PACKAGES_PATH:PATH=${baselib}/${PYTHON_DIR}/site-packages \
+                         -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}.so \
+                         -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR} \
                        "
 
 # Prepend mraa-utils to make sure bindir ends up in there
-- 
2.53.0



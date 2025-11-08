Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C14CD1292
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:31:48 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6547.1762612306095117955
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lpjDXYRe;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b31c610fcso167172f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 06:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762612304; x=1763217104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgxssg8jwqIC5OMVaKS4vXzZpOXqz69DA8CjyGsQ0yI=;
        b=lpjDXYReh5Xji1sHM9N131tT+ApZqdmnRGZuY44M5vbbE8cnBTgI73A8pw45FxGA+E
         fNajtkEWgQ5T30uddMWzEygEYxFjKihFYzpHBVtTJS1lAJt7DeXU9qDih+1g8+ImgrVa
         fPVUWfEheqvkAKPRVt6gfUR0mNzGBoiFMe3fFEKdCfE9lNLKGcvBgqIJTZkkSUQW2fUo
         Cx/JQkPH1JcqAzkEhfzSnxqIfWTQiMVFfIvgE2O1E7LY24ckDWI9zqmIrsQ7jmOkqW11
         JeeRIldpbZ2XeKGJf75PMFdX6S9+Er450a8cYffUg+k1PHYvh9yPIx8ytkEdDjQRHKrN
         P5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762612304; x=1763217104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tgxssg8jwqIC5OMVaKS4vXzZpOXqz69DA8CjyGsQ0yI=;
        b=g86AOYWP3Z75Z2THcMJkgvifM7rKCmjKlfv10mIwennJJtHZc4s+WAlv6Xi8JROiUS
         wZMP8n4v8BPp8od8wXZmhzC+CjqhMFMwFiBEiVR4MEIBo/+/loqFBOygUqwQjy3vYLbU
         A/ACNtKg2j+djhbOLZI8oQsAJMbIIURJz6i3yjrCoPCK2X4vllMJO8vrKdmdClK0EiJu
         TBLw/538bTnAXf4i/TbEs4jB+VC2g9nLUv/vAKDeuocOIgINST3S1uNC4QSmh4iINeZK
         uYy5xA/pa0vBw31Vz/PR+i6lw9VakP8JW8bTVh696aDszLWy339whbtUTehkRAJ9aZmD
         oBZw==
X-Gm-Message-State: AOJu0YwffCzK/V4VXGAV1T8nIgK5S0oVZYC818qliqWRE8qh3H8BJ3Ql
	4S5mopauXgEwQAxI/R+dOcgy8MfBhwHLqUIB4yEtZQH4ujJ4TWSIDD1YzzCiF4Xt
X-Gm-Gg: ASbGncsfGY7YaqLrgc6x1Efp2YcdM6NhYKMpgmQc7IMb+DOP8nRG6Q+ib+GVKoe20dh
	QsCgnGfT6n9uPImU8SxIFcRxZSTHE5q/ajcrjQfyPHjPxlxruPtLb2hqSwp3W5agyEjECLZN9fb
	taEyPbTgJt32wsuo2SqpK21/woNskugPqCtXCJ/3ptobfOpS5JbgyHvXuzSeNo4W4tGOmyF3uky
	xYmaCucDYHk6xU2xffV+I0IYCHal/pKhtYqeNCDCNnREwbfZYqoI4rhMkgFPEcDOZM37T/edHKj
	Y4MzOzfQ9A21UUTNkaF1OIzmU9PCTfzi2vMsKuqDSIafZIdQzM5utXAETD7OyXM+RL41jipXKep
	c8nU1XmWxV9OoUnpE4zhR0DkslpRf/4nnn/k8eqFk6E0kFOONZmqqUHcKQbvHl9i1hcp0Sg8/5w
	==
X-Google-Smtp-Source: AGHT+IH7kB5rOiFwxC6f6HQRklwHEMTPP6Ln5VZCesHBK92v2xl7NgEKU+vygEw1P/HnMv9uMbngww==
X-Received: by 2002:a5d:5f52:0:b0:429:b4dd:ff64 with SMTP id ffacd0b85a97d-42b2dc942d0mr2009619f8f.47.1762612304363;
        Sat, 08 Nov 2025 06:31:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b322d533dsm1012211f8f.0.2025.11.08.06.31.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 06:31:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/5] wifi-test-suite: correct SRC_URI
Date: Sat,  8 Nov 2025 15:31:40 +0100
Message-ID: <20251108143141.3117797-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108143141.3117797-1-skandigraun@gmail.com>
References: <20251108143141.3117797-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121392

The commit from the recipe got got detached from the master branch - use nobranch to
avoid fetching failure.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../wifi-test-suite/wifi-test-suite_10.10.1.bb                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
index 357789ad88..36a4df5e3e 100644
--- a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
 SECTION = "test"
 
 SRCREV = "12e85fbeca8ca21a632d18e55089a8a7606d64aa"
-SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git;nobranch=1;protocol=https \
 	file://0001-Use-toolchain-from-environment-variables.patch \
 	file://0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch \
 	file://0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch \


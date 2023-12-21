Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874A3C46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 22:46:51 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.6869.1703198804817668044
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 14:46:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-35f418f394dso4679315ab.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 14:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703198803; x=1703803603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAZxKeScaIH+llVc++iBF/nUpin+bCsfWmDBnZ4PewQ=;
        b=Q4feXq57L0WvvJs/gQCQfz/gM8YRAbbhB8dl+fU0F11DJjnFX2WRAH+zIWZmUlzXxC
         wO7b7w6o03Xj/7Dr7denNP+Yp+phViAUu8xYTyrnlU66Ndjf8eoFo8q/3ogRvQH+auqD
         gX7mpV8HVlhnBrPCBMr1IW9GxSJeMbaAsDwYug5iIE76/FLeV48IV81pzcaHr8aIKvZ7
         floeHHssSQY2FXnzOYkZtIUJqBrGJu5f+Ussb8ZkV2e3zPgnQorMpI7b1Qfe6Ee9s6ke
         UNTveZIQpXeEe5iy1Ng2/0wpx0/NRCueT+rzz3g7vc7g64nQR2f9IEHdYofEbA2edOdp
         ab1w==
X-Gm-Message-State: AOJu0Yzv3VL5jsLnGd0qiPRhiBzteqBmy30UBwKXcUivF9VPaOl5t+6f
	NFbj67UX/0B3xJM9RlVL6N4etIOeP08vdQ==
X-Google-Smtp-Source: AGHT+IFCuHpf+Tp94lQS6cxMwCbIN+sV3FSCI6kmlp76DaiJP3/aQOIN0dM6oA87H191wNBrr/na+Q==
X-Received: by 2002:a5e:db0a:0:b0:7ba:9bb5:787c with SMTP id q10-20020a5edb0a000000b007ba9bb5787cmr108536iop.15.1703198803166;
        Thu, 21 Dec 2023 14:46:43 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id z26-20020a6be21a000000b007b3e44dc200sm722527ioc.42.2023.12.21.14.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 14:46:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-flask-jwt-extended: update to version 4.6.0
Date: Thu, 21 Dec 2023 22:46:33 +0000
Message-Id: <20231221224633.3940940-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 22:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107739

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...wt-extended_4.5.3.bb => python3-flask-jwt-extended_4.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-jwt-extended_4.5.3.bb => python3-flask-jwt-extended_4.6.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.3.bb b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.6.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.3.bb
rename to meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.6.0.bb
index d5438f11a..cc07c92f4 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.6.0.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "Flask-JWT-Extended"
 
-SRC_URI[sha256sum] = "061ef3d25ed5743babe4964ab38f36d870e6d2fd8a126bab5d77ddef8a01932b"
+SRC_URI[sha256sum] = "9215d05a9413d3855764bcd67035e75819d23af2fafb6b55197eb5a3313fdfb2"
 
 RDEPENDS:${PN} += "\
     python3-werkzeug \
-- 
2.34.1



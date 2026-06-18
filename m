Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7D9CD98F0
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 21:44:46 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30013.1781819081203616521
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 14:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n5QkaRKL;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7ff3362e35dso8567777b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 14:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781819080; x=1782423880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZBhSvLZPIm+xkMVSHTI4cSmTboQlK95pzzTIr9oN3s=;
        b=n5QkaRKLzD1trCFXyDg3JVWktjcK6KR4fPGs3x0N6B4wkZ0oAf0ZqeeO2/G5O8fYdz
         55P6pG8iDyCM5XqYrHYgrSMmFeLutJQb5rHmfJjPkM4Chtot8PkPiMlu8U1G/8c7DO18
         L09aUrioP9tJShL77peQ8QMtLR3qRH5YYaVBTBD6cjyGqUoekIFigIrlafCriNVImjea
         DoUjtwP+AWvTCJIupgr1q3tSPxk0HB9ac3rErbIpEajfNy4pFY7fU4X+hzRMyXtLkIPs
         NtTu91vqTI8iMCE69t5vUOQSBqCj9jKmTFU9rhDO0SOwN/OzluxHX2Co/4bx7bY2CTB9
         qluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781819080; x=1782423880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZBhSvLZPIm+xkMVSHTI4cSmTboQlK95pzzTIr9oN3s=;
        b=cuhYHrsa8MtO8egYnFb4XXs66VHmptuJqiGSBYF3PwX4OJqctJsL7XOuwktQsHjYnv
         cFu/2TkFcHx4Sy610SSGwnWdVZ2+QOS9CoKQnUPkWTL+Tj1cZTsJ3yqkOaO6mqTaGpzv
         zehDg2Lp6Dlk1n6HAO7xibzk5HDvS97exPMDUZC1r2T40t+i4Qhc4OCoFThqYojkaRpn
         IW9eozFZYI63tMCAz72BrtBsDmv/Ndg2BipLCntS5Mj3ZGl/1JV0YoNkY00loFoyqF9u
         Kzp561wXInIgygfl1GklXCu03jn5duT41rzpaj4vYRwZ+kCx3ntWpQzRMpu2myfn+uAC
         +KKg==
X-Gm-Message-State: AOJu0YzUevfF6C2IaI55N7xSk49CWmsgFiv7SZwHrVaZO5EzkjQ2ZPYr
	Kx342G4IJWyZ40yiqLpLcTZYGTi5SsIapF1OPw73NheDm/Po9QcaDR/BRafcpd+i
X-Gm-Gg: AfdE7ckcBHMbq8CVxiUR7xeegwNiaLQ1vheWeG7Xrp34p3qmn1tcAQ7bBuyUOx3fp2u
	IYrDyZRkSyRex5qGRKq6s7qVx/ERii27A47R8eDqL5xkeSjxhVBbfT0mp9gJAXd7VWq2kINPcz3
	pbOgphgTrDH0HUatlOjM0ShbXFkko3zql96uS7Wj4Zsw+6Hjucl1y21KfyXNaRPCV61WMWxWCDx
	WU3X7N7Ey+11zgKK3s0xdrbuBqnQhaVBCK8pi/DlrufkMbn7iC4sULpq7QK4OK5nB9Jc6cZLhmK
	qdybpat9d2lcs74qt7hl1SFv6mYYsSGlQSWluRf4oUp4UpzttbQwXsmNoOwUXI/Jv841d5XwqpY
	DGNBt+6RKq5PPs+dUyIJjSeK+rPAAoZXom1B86F7iYsCGVJk+x2iai3EoNDc+5aruURRUwWK03D
	flAcNC6akWkgrakoVRrVI+KebX/pdYras/OsRqGxZolxX2AUXLUQDBkSZCamPjooRfNwQfo6kjW
	PnZoE+TU1XuRj+RzInPDQVNfvoK8PE2KBUJs9AF
X-Received: by 2002:a05:690c:e36b:b0:7fe:a3b:e7dd with SMTP id 00721157ae682-80131e8e78emr7898557b3.14.1781819079854;
        Thu, 18 Jun 2026 14:44:39 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8011daf3828sm3823547b3.43.2026.06.18.14.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:44:39 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 24.16.0 -> 24.17.0
Date: Thu, 18 Jun 2026 17:44:23 -0400
Message-ID: <20260618214423.154941-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 21:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127672

This is the June 2026 security release.

https://nodejs.org/en/blog/vulnerability/june-2026-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v24.17.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                                | 0
 ...oe-cache-native_24.16.bb => nodejs-oe-cache-native_24.17.bb} | 0
 .../nodejs/{nodejs_24.16.0.bb => nodejs_24.17.0.bb}             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-24.16 => nodejs-oe-cache-24.17}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_24.16.bb => nodejs-oe-cache-native_24.17.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.16.0.bb => nodejs_24.17.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.16/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.17/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.16/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.17/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.16.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.17.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.16.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.17.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.17.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.17.0.bb
index 89f32f2063..fc79ce9404 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.17.0.bb
@@ -35,7 +35,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "2ff84a6de70b6165290111b0fc656ded1ad207a799816fe720cc7c31232df30f"
+SRC_URI[sha256sum] = "a7ab562ed2369a29c68b72fa00e3103bcdfe37063dff799c6acc8e404e275fcd"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0



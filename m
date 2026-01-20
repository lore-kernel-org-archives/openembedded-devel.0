Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D418CD2ED13
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:03:44 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4937.1768910618320360636
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:03:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aRSFPOOR;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so7254873a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 04:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768910616; x=1769515416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdbQ3JTVrUMk/fZT6b46TgfuSRkb8vPooz7ekEuAVm4=;
        b=aRSFPOORpIFuBuynMPY9bbJ7HdNThwXMlNgWh3sY3F5NA0raN6JIorJgHdqUkX193p
         avzLOT0sFWApLV9q7oOTCSEGkk3MRTOssXQb1OQNvAGdBGMNPku9p+eB2GkGYocncwhG
         MYV0WWve6nTSTrUABByvhXbLMqDG6voC7aBLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910616; x=1769515416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DdbQ3JTVrUMk/fZT6b46TgfuSRkb8vPooz7ekEuAVm4=;
        b=u9uAD2AnYVa/PsKZSUHfUcsD1KU5Z3IEMskYprPVkfuVhFSTUqP1lCqisl90o/EKso
         XBZuTmXr2AJqfJsbvxMj7hNYxWtfjjtFdkRE0rrqInyDPTQlsPRJmrOoH+kJe9ii1Wdt
         x511wvoOQoQTzmcP1KXCF+ZdNItRGBh1TwXwmVLBcDKqlQne7+PUEe5n496XlZr0+lN+
         VINnCkxQ+2wxj+l2bdwFHV7/xmtqA3EybpkDW49a2Kojh06vNDF6ifmVm7jembRCv8AD
         NxEoa5LhwiQXy5jWTpP1B0R3rV1HrzZQAyriorgqLevI2wQma+u0Q7T2WtNafVmZgznQ
         2Xsg==
X-Gm-Message-State: AOJu0YyLLxV8ebnC+oBRYTcnRUO7y9kghYP2lxVe9jsP/2y16D6zkPML
	dqj8grRQKaPFJ4WK42jRHmouaWM47V6qBxwBqh8ANRb/QoT7b8mYEYyIvscgDvvxZTC7xRHrKQX
	LDgjT
X-Gm-Gg: AZuq6aLP1nE1zVoufssyKDD6enP9p7w4cQE2wPCkGFufoGdCVXOTJwAPqpyK18k8H6G
	oKIUjaLAcsOUZ2Uol113+R+N3AGkth9xorUIvvdPZUAzB5RR+/EAC0236Ye4ES+NDSsHCyrl/7J
	KQ8sSwWrKOmqe4bBb42U3KGtkGJpCvfoRShHROmoEtOEILgrk4SJ6GxDbFIYFOjvRvFOv8w1jK9
	vu9Xxm6Q4OYB9uOIQTf7cBvqOsR0dxr0jkduGXGOlhEsM1VqhLMuc+eeffiZz1qEDavTjX3DpGG
	dAwARmicH6JVBzNrJOVzbBJuZG8CprSvL0KCuqjIDj8p4XoIut4ws2T26GNWyyddycevchmZd+y
	PeyuPQO9aoj+aFNUNq827oSrSBImiq8p+7+a/cd2fPtlcmv0DAgIYUmsZdMD7kC1SkK9vJft/ku
	tzhJi6QIvxqh27bMO1Mvo/PLkj
X-Received: by 2002:a17:907:d7cb:b0:b86:eda4:f770 with SMTP id a640c23a62f3a-b8792e0cda9mr1412428366b.21.1768910615905;
        Tue, 20 Jan 2026 04:03:35 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e6d3sm1378721966b.4.2026.01.20.04.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:03:35 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-tomlkit: Upgrade 0.13.3 -> 0.14.0
Date: Tue, 20 Jan 2026 14:03:30 +0200
Message-ID: <20260120120331.2092596-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120120331.2092596-1-leon.anavi@konsulko.com>
References: <20260120120331.2092596-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 12:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123666

Upgrade to release 0.14.0:

- fix: Add DottedKey to a super table gives wrong output
- feat: enhance custom encoders to accept _parent and _sort_keys
  parameters

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tomlkit_0.13.3.bb => python3-tomlkit_0.14.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomlkit_0.13.3.bb => python3-tomlkit_0.14.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.13.3.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.14.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-tomlkit_0.13.3.bb
rename to meta-python/recipes-devtools/python/python3-tomlkit_0.14.0.bb
index 934c624670..b1d05ae9a5 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "430cf247ee57df2b94ee3fbe588e71d362a941ebb545dec29b53961d61add2a1"
+SRC_URI[sha256sum] = "cf00efca415dbd57575befb1f6634c4f42d2d87dbba376128adb42c121b87064"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-- 
2.47.3



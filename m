Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B48CC6B2D
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 01:52:08 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30342.1792029122122151808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 18:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kkFwzLaA;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67992884b02so761136d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 18:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029121; x=1792633921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8gzq/byFczIIL6LYydtoy26fGhPX/Lm6jWXJkAdDPE=;
        b=kkFwzLaARZ5MWi7gWC6Ee5xuh+rNnj/6YNmYrvb9l2LM5eSnQ6+p8+eiS3/rkFZeQ2
         e3eZYscD4tmenYBLJHQnVQGaCB1OfkJfnGNSrzzvs4wKJ76fDCpiRObOMYuwzGDaIECj
         2urYBaNiab0S7nknW9xzIXpxaTeI5ZlzMDf3OfJUseWLBHah4HRjYnBAGUQFHuWhfG2W
         rGJfDyQDlLILczweL188iXGLHDVAOtrP9Xk4GPna9fSHByMdSUwwsznOQ3jnnqnnh7fc
         WST3psPGtiaEIZmvue8JRpjM+ZKzJiHOmOiBY++9DbiAQKTnqkW1sLNAsly/C5Wn3G8h
         /8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029121; x=1792633921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8gzq/byFczIIL6LYydtoy26fGhPX/Lm6jWXJkAdDPE=;
        b=24LQUmiEQCGST4PCQ6ff31Hgo8riKrr+2J480kDxyD//bzU6r+aF26YgrB45kBi12t
         CaZMZGJJ1KRjQTRh8ERbSIUUHqHBQtaS8TGtyne40J0jwaEqeDTexaQl8lZqu8XmtJBv
         jjNPxfPVhnD6Chbkxz1rjw7w+xxJq6x1n7LuKwFlKMlicbUJmo+vJ2xbOChElLjAe37b
         HcaJvsK81AgNS7LWk/Y6aWnmwKvHweRnges/MXixW7fAtnywh00L75gqg5NoDEQ+PX+r
         tSR9WVXVPgEwtwky59CcPJLc5G+tJc44pdNXimWrRIw0y4xaxmtKgCcaVgTEZ0ZO7lRg
         XCXg==
X-Gm-Message-State: AFq9FYJL2izttZq+kMqDRqsaiW0voZUMoFvzUwdmqiiMB66gWG0dPPqH
	fLb6sroRtqQzCsiw1oTlByNaVtNUG4T6gbixfowtPsCNHFJmYCTbkftKvwhafBIU
X-Gm-Gg: AYBFou1ifBv63+JW3nlfa9evumhSsEzxvsQ9mpm07zqRLyjCY0FZxu78yGyJS6EnKVP
	YXcgbi1vYkORWu/VNyBAKxRDNF3yzy8jTRx9W+y3Ri+6icLQSsADt9uiIA6YX2WFrZaEy0q+8Q5
	3lpb3vOe0A8LJ+QJ55l2hTKkStMl51oSHRboqSA8SpqcaCqUgkcpusSgth3S0ynAbQ0bKu8Wshj
	umHJhP3mVh6W8hkigtCy/u1hZc7S8eeKxZ7pQy9MlN30BcrHYHN6jq0eje/s1HNn6sp129aLfYY
	GTbcef8SrGzCEY0LfD1VY4TBmGFHk6NmfGG5n648QgixE8x3pEJw9QMsC6TFYa2jX5ZwtHsGYo7
	FOXVEtdRZF4WxxQhzzbycrXNFXRKy7UP4Ic7WM82UPY+dfWpgQ2SoXBatoCQJv/xbgPCl9he1Ou
	YaMOF/T3tro+WflkUaOiTcblpsw6hqLKTVVG6uZ1uwnQokUrwsrKd6UEUlk8Ub4BFgsSh7Nl6sS
	1ktgDFyjNQRVvIY0BBjK4X0jpc8EcHHgi/4UlbKK8rctfmGSgYquEak7wJyK/YPlioM+e28CYWg
	T4d1sLpa8AU3V+R3v9UWig==
X-Received: by 2002:a05:690c:5886:b0:8ae:c3f4:3da8 with SMTP id 00721157ae682-8b07ee76abfmr41370927b3.85.1792029120955;
        Wed, 14 Oct 2026 18:52:00 -0700 (PDT)
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1b745csm62290377b3.14.2026.10.14.18.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:51:59 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 24.21.0 -> 24.22.0
Date: Wed, 14 Oct 2026 21:51:43 -0400
Message-ID: <20261015015144.504386-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 01:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130907

Changelog: https://github.com/nodejs/node/releases/tag/v24.22.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                                | 0
 ...oe-cache-native_24.21.bb => nodejs-oe-cache-native_24.22.bb} | 0
 .../nodejs/{nodejs_24.21.0.bb => nodejs_24.22.0.bb}             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-24.21 => nodejs-oe-cache-24.22}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_24.21.bb => nodejs-oe-cache-native_24.22.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.21.0.bb => nodejs_24.22.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.21/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.22/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.21/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.22/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.21.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.22.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.21.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.22.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.21.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.21.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.22.0.bb
index 441a920f36..39a8563672 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.21.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.0.bb
@@ -35,7 +35,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "a6f54defb6fd7c84f41dba13d61e78e9b4e0961712cf61f29715c05f5ced94fc"
+SRC_URI[sha256sum] = "41f97cff2c666f1f8293dc5f85c65e8dd605c16b43fd9febd49ede32ee1e0329"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0



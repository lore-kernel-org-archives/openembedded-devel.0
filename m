Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F7AC5AD4E
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 17:18:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12705.1786295875660802848
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2026 10:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hi5HRDVp;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so5550465e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2026 10:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786295874; x=1786900674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hlZyWM3xR6YAI1kbhPj0fxnggAkmNTUJ7nFAfNCOdow=;
        b=Hi5HRDVpVvoR2+AqROfVdZT3x0+veXURISGlAH1fFlHdTmMojXBkW7idUFOKnSrMoO
         Oj4i9XFnawpHomRje1Ji6rp4gH9PKHpk7q8trLN+n/OR7sy/nu8yUgtvAHl6FU/sHXkU
         B2x3bz7++h0gwtvR2i9RuOL8g4i0Eg/h3K4deYUQMb7/ljaugzX+kQMINmoTT68Z9vyq
         8/OOjkGCxvDAhzt5ZncgOGAUB/aJ6d1Ia5InTSQ78C/etFDPwbNolDj4D2eJgyZFdeB4
         gFT3ynr8Ynns3Xv8ICRNJyyxa6j7iPq4Ud+uZrG9L/A+mZ+8SkeaNMixGCOtazhO6yaC
         tRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786295874; x=1786900674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlZyWM3xR6YAI1kbhPj0fxnggAkmNTUJ7nFAfNCOdow=;
        b=is8hTEICi+dMNQl3ekr0mM94Hw82L2pM8Dyus9pQzjhjVit8BCw5MwaEKm80VQaTVt
         w+I2Z35S3zwddAWFF2gN28rVafiN0C0M05c8jA4RDCzUyFjtPV8Ynmtp9cfP+35PHOLy
         0JPGpjiJLTKfDke6h2Of0fwJFSolWk2hCMVj6GcWqTxGFXuCKoUq2jqcD0c1ZveHoN0Q
         PfNDb/moZhsFuO8VDYL2kahmyu9D7PoqlHmg6z2qNu/dN9P9Fl9WTwnj3U4JpEBjhbRu
         xnE+50COhn+8PlZJpYBwSt5wMHjQxHSMedTB2HgsIta5/3AkEuhz0Ll571NJ1eSeq8j+
         mcuw==
X-Gm-Message-State: AOJu0YwKiqvHBk064NfY3DgNQKNrXI+dxg9IX9IRbla0D9nMwUqbbxAh
	ntZx1bEHD38fXm40CQY3+SPhAaJjirb29aa7wa6ArTyKGS8Nk1GfZbBUxDr6ERhF
X-Gm-Gg: AR+sD10oX6rlU1N7nG44uOulS6bkqiTz8BQoR//4NxPcXcv44eUS8LUqIc441ClnMo2
	DpRIxP3fZu+N4A0w8RwFcWlr7FZ516Sz+31HXJFoaPSNFGEjcmHdCbn/mQwyTGb08mtUP4fei8Q
	uHovmczvrpZhPvsZQEZAUnWY5GCGj7zrqZTivkgJ/6PAWrqAA+php50AF5RxgchUK/BreE46wAj
	n3iIaWTTQKreN/6/rhrByVlP64Z0+8apZFK1/Zmno5UTQGSuLqjCt4A+pdj9kCsdOeOGyh0QO1T
	ZE6tjeoFM2cmKIDN78pGMqpLehPRJABm0P65AaBr6INMXXuu6V49fPjKlzi5IGHoMQEMTSFCpAa
	GRDEAMseLFwxfhhuY+g1C+1QNHVH+Ukiordb+pT7yz5DZIhEojIwZJtZpQlkFdqljsG9fxbqLMD
	Mt+O1sdnkv3lZbnWEWRziCoghHUrlii0+8yd07EMf9xnBBGsZDgDEdoxmUVg2k3Q+QRQp/w2HIH
	Kv0bIzSHsm86WxCx192VXhJO/eNrH6avytQvJmjAwKKAeLhtVBoH/7XpjgIKmsRqmCkyMScVjjH
	2sYz8HBBpehGemf/7gGRDUxERmF4V5xm7lTJOt9lKg47Pw==
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr201182745e9.7.1786295873784;
        Sun, 09 Aug 2026 10:17:53 -0700 (PDT)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea3361esm216004625e9.15.2026.08.09.10.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 10:17:53 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-pep8: drop old or wrong checksum on SRC_URI
Date: Sun,  9 Aug 2026 19:17:30 +0200
Message-ID: <20260809171730.5703-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2026 17:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128872

The `SRC_URI[sha256sum]` was twice in the recipe.
Keep the correct one.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
index 6c7fe4df3c..bf707da9cb 100644
--- a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
@@ -4,8 +4,6 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
 
-SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8"
-
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "python3-prettytable \
-- 
2.47.3



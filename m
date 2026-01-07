Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF411CD5826
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:53:03 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2624.1767779577034948448
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=H/aiCZmC;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7355f6ef12so360492566b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 01:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767779575; x=1768384375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3N5QDiKbMvgsgbchdPOlIXy7W/nfibTosY7SzjJHGKg=;
        b=H/aiCZmC+iYG3BamKZj2pjlmMFD7CZ/WUYcZoZGllOaSj9t/GrJs7IAAX1N+h2m6Hd
         zMyvJVrR+D9EU3Xw3Xxf5Bhw9ETQk+uFtp1TPQhY7bTNefqCeqfjUL9TqmbKT4E2Xhu6
         jB6XWfm8rmQv1T7h3rsl8LhnzE/PveCz973II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779575; x=1768384375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N5QDiKbMvgsgbchdPOlIXy7W/nfibTosY7SzjJHGKg=;
        b=tjJzM07mJ1ewsjnCPFHqp0PdHh+0tlXnXBwonVhHxvJ+P8J2r06KndG+sk/93Gpz4f
         EOsuwLc/DgJ/g+OYf4QwPHCYAM8KncHlpZeTBewD+L5Z0+/SGKCzeuHiQvu2a4ZHazhr
         o8XVYH1pCSiIjV8/YiPwbHFQLBE2IbrZEQoxfvg5ejb8+y3sKGqgd0XyGTZJONPeTMhq
         ukLmhrMwZwqGg7i78vP5VEKA/J2q6Vw/mRr4SbzujQeFlzipjGhkcJtn4zHS5Rrr0yeQ
         mdJNdzuOzXcOsWO0tWQM1eX9sI7aKbFvjRaNhl4VSxmXX5ttNBXAjwEEZuJRrI+vkqo+
         IRoQ==
X-Gm-Message-State: AOJu0Yxptr92eit0j9faNvwdGXzNg41Z60E92+PNUbkImCUD5lDPAlGq
	t/ql9pHuyVUsGZE8d5ClLRrODmyaSc8WV11sQvYkVXftvheJ/MWQMa2mor5BFFKqr6ryjHtx+ez
	DTyG4
X-Gm-Gg: AY/fxX6pLG+bM1iOn2+22PfzzRGFde6VlULtShDSVWTGUgv+cBWa3o5PvGAyCIRI5zx
	oubduI9V01tvPJSimQYxPqK/I8TF9d9kHwbhn8NKfG+VHlju+7QGZBjStLIxBBpOg3SjOLRY0FC
	HcBERtC9Y6fXxvhdVlSdQM+BC6XWSnQinKlrEys0MI0P1GtxK9uRGIlm82FXmv8wFqzgVaX1HZu
	V8zOJztLeQoO/QuWE/GiXw2hab83MHx1D+iUlwoYshZXq3wpf7PrQ/l5kx2u6UN79n05MH7KYGr
	dl6GeCPwQy5iHEpyVAePBMsDcuq1bDE8VB2si6WWY4BZ6zQRMA4W/KMEXK+vpkwr4zAHrEcwvsi
	QcHDPGX5jnzi0qhAPgDMWnETxw+MN+5T9djmHpuRoL3Ht/4u2ka/uMumkjguebW16Dd6eV+bq6q
	DxID3Ph/KdS9h6zjpqNMSKAOkr
X-Google-Smtp-Source: AGHT+IF2VMltx3/BvnxZfMB+SuT3khW8CWFLaqXqRV+05dj19vfso2/+gfyPhIgdAVKU0vsQ2h/dxA==
X-Received: by 2002:a17:907:84e:b0:b80:402e:6e77 with SMTP id a640c23a62f3a-b84453ddd9bmr172357066b.54.1767779574356;
        Wed, 07 Jan 2026 01:52:54 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b844e46ee63sm72327666b.15.2026.01.07.01.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:52:54 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-bumble: Upgrade 0.0.220.bb -> 0.0.221
Date: Wed,  7 Jan 2026 11:52:46 +0200
Message-ID: <20260107095252.1351613-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123190

Upgrade to release 0.0.221:

- Cancel l2cap connection result future on abort
- Implement extended advertising emulation
- Rust: Fix cargo-all-features to 1.11.0
- L2CAP Enhanced Retransmission mode
- Add some docs about Android and Hardware
- bump pdl dependencies versions
- android-netsim transport enhancements
- Upgrade GitHub Actions for Node 24 compatibility
- Upgrade GitHub Actions to latest versions
- GATT: fix redefinition of GATT_CONTENT_CONTROL_ID_CHARACTERISTIC
- Remove unused imports
- Fix missing type hints on Device.notify_subscribers()
- L2CAP: Enhanced Credit-based Flow Control Mode
- use ruff for linting and import sorting
- hot fix: remove unused import
- Ruff: Add and fix UP rules
- add support for multiple concurrent broadcasts
- Add EATT Support
- Fix some typos and annotations

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bumble_0.0.220.bb => python3-bumble_0.0.221.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bumble_0.0.220.bb => python3-bumble_0.0.221.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.220.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.221.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bumble_0.0.220.bb
rename to meta-python/recipes-devtools/python/python3-bumble_0.0.221.bb
index 150c342187..87a0b8376b 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.220.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.221.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/bumble"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
 
-SRC_URI[sha256sum] = "3ffb36148e4a558ea21253f7593d23d6250090b0af2920a82fcbfeacc6970fe9"
+SRC_URI[sha256sum] = "44e9ed8aab0aba256491c2acedd3080b48bb070cdb6776017d6d794e035f0dec"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3



Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71946E7BDB3
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 12:30:02 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18398.1771245000594530357
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 04:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ilwNrPCn;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4837907f535so18999025e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 04:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771244998; x=1771849798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5VZMkd+8EPjKHquzTezeFxccpEkfEa/bUyDPwR7wcU=;
        b=ilwNrPCnS6GiC/raorqK0rIxDeok/YoZfTlzrDy4NXJ+2XWfsan5E/ymklC3ZrYsgh
         IkBGCLMGEbiteIzMJlCm5i50ZSmHj6AXV6nEC3HFJZDTIOALkJ+uSFj+oeqSegFhtxnI
         FnHxMrkOwbOoeCJVfJwGZbLSSFV3RasuhuD8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771244998; x=1771849798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o5VZMkd+8EPjKHquzTezeFxccpEkfEa/bUyDPwR7wcU=;
        b=ZCGoVC5w68X2Z5W7YZ+Pa6h9i826AM+J14lx0Jc/HlmOoJD6ni8EbVFF+EcG82Epfo
         9FLtB+bXkVuR22x4A6v/GY6AXS2sMjab32gS2oaOQx7oisIWAcCf513esRf9+zZWsLf8
         TGc+qRRo2uY/ThwSX6jQ+uMsv7VEghEFw2MM66rzGcuyCVdeyru8chBIgeqBw+DcWIx4
         wmOaL1R9ftWIKGlF6GhA/CKFm25Tud2+sfAAqcPBIrO2rTqZLKMpe4JAh1ZJDXnNHpMs
         NoRVXJ3mFLSM1/ddlpGrlXm6nSmrnzOCNjPMPIiI8hycaE0zSUijPUVNn6qiuLLs+3qb
         ileA==
X-Gm-Message-State: AOJu0Yw6/+JJToG0EK256vEC9nwzMqLvA+UI6OgHaoUCDm8GQI3O9uru
	YJTwhlQZUzhBogkdLpTVoDg5XMdQsEO98YFhFZgR/9f0A4RYdumgVfXquG/NUsIBvYxFCAjyyCk
	CN9AK
X-Gm-Gg: AZuq6aIZv6PbNkSzGXAyZObyi0wfYX6m7yWibtBXAKFyacIYiLec7tw80ApAUzoyK/A
	f9ULvf8d/2F3PBaOSdbtyZqDoycoZCZC76qE5CIIWLzJxIPBm8ul8zWtOTYlDGC+vTpVdu11Z5R
	OVtokboHE8lBHL3RubXHasrO8ZUyQCZT+oF0Qc3GQqMFBItJ1WdviVhBk95wIeAzZW5Yt3b8cLz
	at1/4RAf+137gXCd/s5IrXCQYAGP2Iq/XK9+Hc9qEubmqwJjv471wH1RL09RF6ih9Syqx9EpNps
	WMlw4bsicWpO/lZJHkmflnZVCX7cC901EZv6KnbUD1tt0XQBujpQEZoLounKRqxLrISp5A5MDSK
	zzHDe86VmnQyIsCym2tNSLpJe94jD6vTceGDk6SW4YFeFOUmrOB9kAyDP3hHRPCse57+cAhR9Rh
	F5eWL17rLe/VTTY3GEC6duRn8cuR82lh27Z62I
X-Received: by 2002:a05:600c:314c:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-48379b318f6mr114052925e9.0.1771244998364;
        Mon, 16 Feb 2026 04:29:58 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm664423415e9.9.2026.02.16.04.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:29:57 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pyrad: Upgrade 2.5.2 -> 2.5.4
Date: Mon, 16 Feb 2026 14:29:52 +0200
Message-ID: <20260216122955.2642743-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216122955.2642743-1-leon.anavi@konsulko.com>
References: <20260216122955.2642743-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 12:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124419

Upgrade to release 2.5.4:

- Remove python2 leftovers
- Add support for Ascend-Data-Filter "delete" keyword

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyrad_2.5.2.bb => python3-pyrad_2.5.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyrad_2.5.2.bb => python3-pyrad_2.5.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.5.2.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pyrad_2.5.2.bb
rename to meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
index 415a8a8212..404e26381b 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
 PYPI_PACKAGE = "pyrad"
-SRC_URI[sha256sum] = "368e8d3cb7b9e2ca9e4357b343787238bf135edd3f3598cf26ccd65d32506ff9"
+SRC_URI[sha256sum] = "e039c48a026c988d49276bd7c75795f55e0e4c2788f7ddf09419ce0e191a154d"
 
 inherit pypi python_poetry_core
 
-- 
2.47.3



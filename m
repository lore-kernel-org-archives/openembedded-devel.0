Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596FDD4A609
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 07:38:24 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1359.1768549096817247465
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 23:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KrAtzS+N;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee0291921so11996095e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 23:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768549095; x=1769153895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7eZxYgrJcsQrgoCZfDug0v2vk6HK4DvB1m/hKMD7j0=;
        b=KrAtzS+NXHgMltp/pxCzdigxRUmevtAghD82viwYIwgfA63UnEQ94jiv4zh1iQU8G5
         UHEjbdxPSysOsPPP7ylZEG36gFEoxMVioHTVclICiTnQ84rZOG/MvAgQd2UUO6Qnwyru
         65NGhSPnTeR4Ay44QRe7kiFrE/1ZMiY2WUgfxc71++YHD7wzuZmLQ3h7X29u6cJlYr3Z
         1uRbiNzev2JdnlZsGh456kkkrcugmgCAapQ4BJnI2XjsilHALo4QW9KnTIiIGuxjJoVZ
         1b6Jkne8HFdc40NyYTPJiJW6XCvT8uLCMd8lC0fnStELtjTIV8hCZWRaDatHTSKU0vJN
         BPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768549095; x=1769153895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7eZxYgrJcsQrgoCZfDug0v2vk6HK4DvB1m/hKMD7j0=;
        b=tKMAbNfNwftY8MU/fML6AiZpMiN4Ti+5QDJrSSpAbzgT9Acafpg0vT0n47fe7xqEPB
         WkEErCssa4CQGM0YErjWfT8oG29nOyytHmap7OQGighBS7JurBtUxX8YA5MUsFgeDt/o
         uppzKV1J+NgLO6C0VWWpx7YcU63inlKJm4UJB1/fPZ8mDUlZSBAKEZV6gsWULp2JHtRS
         +q05hYHEJuuNnveZewk8Gh3pntus9CCIH+C+b7/0YU+suYE+xVf3uZiqTKXw0jymDHj/
         DwQ2uZRIYEIuFF+Utu1cLmDnCWhoCtmAQGrAwmBn22nA//RqQPMBwopXVc2jZbsmFYqS
         hmlA==
X-Gm-Message-State: AOJu0Yx8LqP64UO8Py6SuYMhLPJ0V3rtH4VkHYrcCVb5XIw+wPxaqosZ
	YnWe1Kj2dM4/CCccUpqDwDUWp996rrcadA/tD29m7yLwsYNPn4thFTKXG1tegA==
X-Gm-Gg: AY/fxX5uABSe4O0Amfmew1qs/0sLzrl3+io5qE+vVnZIarxFbPyCG4gftAiqB45F2m5
	9ZXQHPZF3QWY1hwERwegh0obsJyUs+4OgSBYrUzY1NeMN8LAjkDK379nD16upyqJyv+OAzfQ2Jl
	gDCY3mM5U9Np5QIhg7AJX7FHSz1b2LGt7DCDqwmIjBk+rpdxm3aUnvUWYPzlGMmAWiIfjz2VT7M
	MiVIy9iZeEuP4s+BE8O9x5j6J+G+PmPKaAVkAzZ7pRNzLkMD7R0ucWKsNOYEYZU3r+wjBy7pd0k
	UFfiSC3EE68uUCkUFRuSl8ePAhjcHZ9ULA1RxiENopp+Wt+iciBhahPtb8DpZlUPfH6pLmRyUsr
	Jo+mYQnbCt36DR0OFfsHmytCV8IzyI5ZhoKHkuxwVqKEtijBbPbECeK3NJieQg4tnS5NnlxLcmX
	qv7k75O0/D
X-Received: by 2002:a05:600c:3b8e:b0:47e:de23:dd6f with SMTP id 5b1f17b1804b1-4801eac0a1dmr17606755e9.12.1768549095145;
        Thu, 15 Jan 2026 23:38:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm84992495e9.12.2026.01.15.23.38.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:38:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 3/6] python3-bidict: upgrade 0.22.0 -> 0.22.1
Date: Fri, 16 Jan 2026 08:38:07 +0100
Message-ID: <20260116073810.3290097-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116073810.3290097-1-skandigraun@gmail.com>
References: <20260116073810.3290097-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 07:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123523

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Only include the source code in the source distribution. This reduces the
 size of the source distribution from 200kB to 30kB.
-Fix the return type hint of bidict.inverted() to return an Iterator, rather
 than an Iterable.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-bidict_0.22.0.bb => python3-bidict_0.22.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bidict_0.22.0.bb => python3-bidict_0.22.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bidict_0.22.0.bb b/meta-python/recipes-devtools/python/python3-bidict_0.22.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bidict_0.22.0.bb
rename to meta-python/recipes-devtools/python/python3-bidict_0.22.1.bb
index 088931d148..1ed0af81a1 100644
--- a/meta-python/recipes-devtools/python/python3-bidict_0.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bidict_0.22.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://bidict.readthedocs.io/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=858e74278ef3830d46481172ae03c819"
 
-SRC_URI[sha256sum] = "5c826b3e15e97cc6e615de295756847c282a79b79c5430d3bfc909b1ac9f5bd8"
+SRC_URI[sha256sum] = "1e0f7f74e4860e6d0943a05d4134c63a2fad86f3d4732fb265bd79e4e856d81d"
 
 inherit pypi python_setuptools_build_meta
 


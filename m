Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC641C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 12:32:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.7639.1744893157451753685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 05:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=B6OE55NB;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ede096d73so4868205e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 05:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744893156; x=1745497956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szVvhj40F8s/aSbQNRkW3J3JAoEiN4tkofnvHfyy06Q=;
        b=B6OE55NBkmLXE049FzryiJ3VScSH0FE0HDaoOmuoISVa68U03zhHR+dPZxRZXcFlFS
         JRVMCMbz1BCtOqYsOUeCAyvNwkxzSxSuPAlIHB1X5z/UD6dolUR/Odg0T1O6Qs4mqjg9
         /L/rfme2P4hIGeyToSizECk8aHAqT98I1Fvag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893156; x=1745497956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szVvhj40F8s/aSbQNRkW3J3JAoEiN4tkofnvHfyy06Q=;
        b=jpbZRHCORF6JvThKaHO6SZ2R2OpNAyzj7VgCXRkFAkSlPux9n8/X2WvZIfkxPqijva
         4v0RYwlh7YWrkgrrE6S5szcFEo4ZKm5rmG+kW5x4AryUnod1cCcweaNi7J1TiaEHjWFj
         DeYj+YuP4QNdPonTkF4C18NK9lk4IPiC7kqjk7To23WU5mO80dmIg5jIEXse0h8EEppw
         mDbV4GA4oDnLbgOAK7PVqdC6J1VzGrCxoCuQYpOPRfG6ItVJItLtEyDeQ6exkHVMohN3
         BZ3oSgRGddO/auGahj+ZKGuOtSLj4SyT/mat0MhtB5N681eBRhccJS+b4kMPFFLaQZmy
         JXGg==
X-Gm-Message-State: AOJu0Yz7fxQk8xTSmdtKZQ+r1Mmn7cX2mxZi6EIwTnUYtw4B35NaO79S
	95ai0+fiNfwciwhi3kSgoyQCyWpmY40K1zF+PaFJWrMvQsW8EGC90CodJaM1pPjjkOrQZnJeamN
	3
X-Gm-Gg: ASbGncurzTpoI2Ych+dHqqzLOFCp6GiezWt0Okc33uYFx7ddzRNXCgwN5J7Ow1dOi0E
	biPG0i2a5aIopKnuVK3Qn9Z1sE5qI4K8nKi7/nJrlZ3k09WtkBYxC17r2Jk6e1ralffcoP6xO09
	6H4tGm5rA5Uem/dbzPfB8z3Ffly22TY/jfRup3tLjuZ3+s0u+A+x4VbRllRc++1/QHG8s/OJdM/
	aSJaRcw340XmQ8jjzizTyCRhRycfi/QC2nj3cKHmHZ2qdgUMsjpvQMqDoHgaD+WZ0n/57GiFUGy
	dmEwm3enR21Pfo93FGHvcV0tt2yuD2G3xxK8gCNtaXkWrryk3w8QGr9SOhbPHXuzxA==
X-Google-Smtp-Source: AGHT+IElKLs7638hWcrrxSoyhetxk10pJeSjwc2WA7tMkTizTxMJyV7gpXPqG89wzixNM+AgjjoQug==
X-Received: by 2002:a05:600c:1da5:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-4405d5fae34mr54836315e9.4.1744893155142;
        Thu, 17 Apr 2025 05:32:35 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm20208804f8f.17.2025.04.17.05.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:32:34 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-lazy-object-proxy: Upgrade 1.10.0 -> 1.11.0
Date: Thu, 17 Apr 2025 15:32:27 +0300
Message-Id: <20250417123231.3063208-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417123231.3063208-1-leon.anavi@konsulko.com>
References: <20250417123231.3063208-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116932

Upgrade to release 1.11.0:

- Added Python 3.13 wheels.
- Added support for __format__.
- Dropped support for Python 3.8.

License-Update: Updated copyright years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-proxy_1.10.0.bb => python3-lazy-object-proxy_1.11.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.10.0.bb => python3-lazy-object-proxy_1.11.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.11.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.11.0.bb
index 195f94705b..ebf9f84951 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.11.0.bb
@@ -2,10 +2,12 @@ SUMMARY = "A fast and thorough lazy object proxy"
 HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d606e94f56c21c8e0cdde0b622dcdf57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b44e35194fc96f303ff4302a2a5759dd"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "78247b6d45f43a52ef35c25b5581459e85117225408a4128a3daf8bf9648ac69"
+SRC_URI[sha256sum] = "18874411864c9fbbbaa47f9fc1dd7aea754c86cfde21278ef427639d1dd78e9c"
+
+PYPI_PACKAGE = "lazy_object_proxy"
 
 inherit pypi python_setuptools_build_meta
-- 
2.39.5



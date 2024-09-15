Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F376C3ABA3
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 19:37:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.121155.1726429033483235099
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 12:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mjc5FzRo;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2054e22ce3fso39854775ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726429033; x=1727033833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nk/ZpAYi8xzPFEqpEF9Hcf0UF3+R35YNhHLRtrvN5k=;
        b=mjc5FzRo2BdXy1CBFDlBWPMORSkiMRZj/zbf8CBa9+b5FvG20rdPAkI9S9pMSZEboD
         A3mor39yEpIxyhEfpwi2hFk432Bs5UwXy/b9adeGx2VsceyCdoLIHXWkIaks+ciOlF60
         tsbgXYgZnWi6G8SqMS2fW2V/yAPmLWoz4skfwBLSmb5eG2THevrlVFPv/VMW8w0RXzi5
         PB2a3V2qIrHCGdLQf6GTFrVzk+0YEleM8en/cE2I4pskIiRYF6EBj261rpcvA4ZXRQ82
         yPrRNSSvDwLkRWp6x/apzfaXEmQRzGay3eIVACYmO1paZAumwIygJOwiCB6iQV5VbhIF
         qxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726429033; x=1727033833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nk/ZpAYi8xzPFEqpEF9Hcf0UF3+R35YNhHLRtrvN5k=;
        b=XQrwiT8Y+nyZMkmAbv8I0N5rtkAY7wzXd5bigT/a8ITlIF8iO/JzH5BvNEL3PeXhhX
         cO1GV5jm45zVPKLiaOao1ZnynkT0SCW622rn7CU1RB5oYmEYgRhPWGBcCHZNwxzZxUMH
         /06x8l/cg1vQWsqRTVCregtCKcWMztCtwAs7AIPkII/D50adn37jYKHwt/Bja2rVciV2
         vqzQHZqm7GZUhMYgXVaKToS3FiiCWAHhDFUPy5LVSlkRYBhkqXIFec4MtSXaWzDRt04C
         sxAoTuMuoHuTvvxSn3R8LeQkgZk+pwgOY0O1UkGr5+0tOprUGdKpL99UuqrTYo+Q9zFS
         AIhQ==
X-Gm-Message-State: AOJu0YxHjZBOsT6Y9AUCujFb0LMfsFMb3o+3yL/95mWejkansAIzHTz6
	zOTJXXwwn4FOcXjNWyfttpResDOAnxZcwoqJHbyLNy8jFnioNudYpEtIKeRd
X-Google-Smtp-Source: AGHT+IFW40FuzBgGKmRnVx0WtiOZP9jte0n3gaaexURSL7b66++Ea9IzwUy/3SaDsr0wPJq3SRTI0A==
X-Received: by 2002:a17:902:c405:b0:206:928c:bfda with SMTP id d9443c01a7336-2076e44de6emr187838645ad.56.1726429032641;
        Sun, 15 Sep 2024 12:37:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9c53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207947364d5sm24688795ad.282.2024.09.15.12.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 12:37:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python-ujson: Use python_setuptools_build_meta
Date: Sun, 15 Sep 2024 12:37:07 -0700
Message-ID: <20240915193709.1131399-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915193709.1131399-1-raj.khem@gmail.com>
References: <20240915193709.1131399-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 19:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112312

Drop the patch to disable strip instead set the env variable.
set UJSON_BUILD_NO_STRIP=1 and get rid of one pending patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...up.py-Do-not-strip-debugging-symbols.patch | 37 -------------------
 .../python/python3-ujson_5.10.0.bb            | 10 +++--
 2 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch

diff --git a/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch b/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch
deleted file mode 100644
index 8ba8ada556..0000000000
--- a/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From aec3b64b0aaea0178b44ea65a204d76696e6a45e Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Mon, 10 Jan 2022 14:04:28 +0200
-Subject: [PATCH] setup.py: Do not strip debugging symbols
-
-Do not strip debugging symbols from Linux binaries to avoid
-bitbake build errors related to already-stripped.
-
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
-Upstream-Status: Pending
-
- setup.py | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index b98963b..d42f07a 100644
---- a/setup.py
-+++ b/setup.py
-@@ -19,13 +19,7 @@ if not dconv_libs:
-     dconv_source_files.extend(glob("./deps/double-conversion/double-conversion/*.cc"))
- dconv_source_files.append("./lib/dconv_wrapper.cc")
- 
--if platform.system() == "Linux" and environ.get("UJSON_BUILD_NO_STRIP", "0") not in (
--    "1",
--    "True",
--):
--    strip_flags = ["-Wl,--strip-all"]
--else:
--    strip_flags = []
-+strip_flags = []
- 
- module1 = Extension(
-     "ujson",
--- 
-2.25.1
-
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
index c64c800626..80b5e6207c 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
@@ -6,15 +6,17 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5
 
 SRC_URI[sha256sum] = "b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1"
 
-inherit pypi ptest setuptools3
+inherit pypi ptest python_setuptools_build_meta
+
+# let OE do the strip operation
+export UJSON_BUILD_NO_STRIP = "1"
+
+DEPENDS += "python3-setuptools-scm-native"  
 
 SRC_URI += " \
     file://run-ptest \
-    file://0001-setup.py-Do-not-strip-debugging-symbols.patch \
 "
 
-DEPENDS += "python3-setuptools-scm-native"
-
 RDEPENDS:${PN} += "\
     python3-datetime \
     python3-numbers \


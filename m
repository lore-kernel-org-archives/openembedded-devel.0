Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEB1F31E28
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:25:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.130852.1775738323292468943
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 05:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=t8YqIH4d;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ad135063so7442985e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 05:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1775738321; x=1776343121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noSaXpT+gH6vmIyGMPl3/7NjMM/KUSIrQd3V59d0N0o=;
        b=t8YqIH4dAzQZL6+lkRDnTN8goq8ljHaFMn9MkZIisgF7WWFxUVEovwzQ3cI9C/XWmg
         nCbSIQze7vtEL86SYYQY6kpTMdEhBXdGP/LHXqF45FbzuaiFGWWDqq9yeJ4/NPye8wf0
         +E9+Aqt7r1mh2emaZisYTOj5DzjJiC2/QRc8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775738321; x=1776343121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=noSaXpT+gH6vmIyGMPl3/7NjMM/KUSIrQd3V59d0N0o=;
        b=K1GRQuizCp5FhcfHNMH4A7p1ztKLA5ZSeslu8GmBvWTDN1xe20n33VnSjZ8TG0xRrt
         9rnS0/0aEf+5HKOGaxYsJ4LCdn5KWB32ukYk80Wie7tbQiAYMU/MGu+ONb6RqSrO+0eS
         HpUk9i6vLQ8wcVLKIQK4EjUpil9Lx/FVMSp2MXGeWy2QaEmdtOswHJ6o4+9mvUp8/yz1
         ncF1PH7s8X1R7k7xIMTvmJEplTlZv7TI4OFL/7qf9oUAn9HF6EbFdVxXDk3nnPRKTolQ
         hV9JAtjfdFiYI8rAdE3MsW+yuzcZr7n8hPA+xFaOUXTDjP7S7F3rehj1QtettAK6XQC7
         0x1A==
X-Gm-Message-State: AOJu0YxlEzyxMX5zI4cU3pAyTIPyBaMlYk6gmxHcS2G2pSGqJ+RZA4mH
	Jg7mLEQil/vUNtl/DNp7ttnh21C7qb38O+9gStDivAoq+pQCjcsL5doIHMMKXAxjwmEVNrlgrcd
	lQfln
X-Gm-Gg: AeBDietfxp/JSaomvYHHaCSnUZbimX3axNm5KvPdI9Iv6B0jXB5vKMmhmrK73T/8S4b
	ZqweqcIksbUWarvTfejKb4rihCyGhrjOdcpo5Ac1ntlVUp95U2eSpVOowY67m+XZ/ZUHBHqf6Fp
	BwEKaW1JETkW538lxfftyLyErtYi1WKVTmZxt2ycBnWa1D7fKY5Q8Nz/exRrWl6aeifXYGYuP65
	8OPYUHFiY8n2OGhO5N13nf5K2m3icj72FfwXmfMhxTCt6F71yyi0Orpj4NZ5jAZW45aZi86Ifvk
	01r+3r9OUkKJOUlVnyDzw5y2gosaIW5XhI4A6ahyhzM/2BU6gy3hstvOvoCeupfu7V9qeUHdvhp
	snZDv0KEmCJLoohWYuXP4vDj9acZFvZRoICBB+9sH+d2RekmcFsA5RFpPHYXIbjZT0D6qYFiuR6
	HeJchd9WdYUNsZdWuHOlxJFY7EDesSa0IRRFhltRewxSak/aQ=
X-Received: by 2002:a05:600c:6986:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-488996ecbf3mr329787285e9.8.1775738321132;
        Thu, 09 Apr 2026 05:38:41 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ccfb7912sm47703805e9.0.2026.04.09.05.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 05:38:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-charset-normalizer: Upgrade 3.4.6 -> 3.4.7
Date: Thu,  9 Apr 2026 15:38:36 +0300
Message-ID: <20260409123837.3650532-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409123837.3650532-1-leon.anavi@konsulko.com>
References: <20260409123837.3650532-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 15:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126197

Upgrade to release 3.4.7:

- Pre-built optimized version using mypy[c] v1.20.
- Relax setuptools constraint to setuptools>=68,<82.1.
- Correctly remove SIG remnant in utf-7 decoded string.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...cts-Bump-setuptools-check-to-be-82.x.patch | 25 -------------------
 ...bb => python3-charset-normalizer_3.4.7.bb} |  4 +--
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyprojects-Bump-setuptools-check-to-be-82.x.patch
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.4.6.bb => python3-charset-normalizer_3.4.7.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyprojects-Bump-setuptools-check-to-be-82.x.patch b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyprojects-Bump-setuptools-check-to-be-82.x.patch
deleted file mode 100644
index 571333e44e..0000000000
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyprojects-Bump-setuptools-check-to-be-82.x.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 17bc1de2c08f9303886d654572b1ba64259a8a68 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Fri, 20 Mar 2026 15:06:51 -0700
-Subject: [PATCH] pyprojects: Bump setuptools check to be <= 82.x
-
-This ensures build with 82.0.1 goes on
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index ea1c514..bbc83b7 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools>=68,<=82.0.0"]
-+requires = ["setuptools>=68,<=83.0.0"]
- build-backend = "backend"
- backend-path = ["_mypyc_hook"]
- 
diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.6.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.7.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.6.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.7.bb
index e6056a3512..b9dffb21e4 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.7.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
-SRC_URI += "file://0001-pyprojects-Bump-setuptools-check-to-be-82.x.patch"
-
-SRC_URI[sha256sum] = "1ae6b62897110aa7c79ea2f5dd38d1abca6db663687c0b1ad9aed6f6bae3d9d6"
+SRC_URI[sha256sum] = "ae89db9e5f98a11a4bf50407d4363e7b09b31e55bc117b4f7d80aab97ba009e5"
 
 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
 
-- 
2.47.3



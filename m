Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8729.1792580500984606274
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cmHob6bp;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c434376dbebso117016166b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580499; x=1793185299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJLZjBYQZTkceclvpBovHdgnYthrZbGsXz08RqyVOlw=;
        b=cmHob6bpGis+U2WRbM9bvfZcpffS1SfdlqDzOHLPst+RAFvIhnN9c8ygdIz/6qwAD/
         Jf6gWH8Ec7oeRcuHx5MxaK0z/CUm+Z6F0ViFTvKHdxqq501yrqYutScsQDsPpmefqeFQ
         oQxKW9E5WwBTXjo4AI0VkLpKZPiWqMRw9y+FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580499; x=1793185299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJLZjBYQZTkceclvpBovHdgnYthrZbGsXz08RqyVOlw=;
        b=RYr7ijZtKtMg/AwHCqQ+Oz05OlZC3XaVj5fL7+VzfMHhzomq+kJREzsJkNzkdwPu24
         1KTov+d2/+ig6wP2iFlOUkQgxYNiTRMaDbTBbixNbU5gBR8JfzsVQc9tHRvAWG9vR10e
         sTcdubZxUQ1I1X+kDfKEh89jCFzo/+gIn2VmM14EVzbrR0fmi2wcWiitDmxzA9BSWXSS
         90vk6kiaFyj35smj9rUBLdKS67AhnDgrZDgiF4PljHprVbRR4ylqA6ygwLXRVYxEPzIW
         8hqksAXT8m8+1J8Ce6QmKSdftTAObd25b26mRYP/BcHTrT5IK9lyzk8J4HX2ujDLaND0
         vzkw==
X-Gm-Message-State: AFq9FYI4UBtSAYHcMGFImEt7A7DjoSzfeqr7WkJruekH4bcgdEEXSonH
	02KQ0KoWGHLoJTsWeKdb4DszkzGdUR5qjo8n8CnlcMPyUSwRIZwRqF6nSSMn515XU2E7BH735za
	9Ksp9
X-Gm-Gg: AYBFou3X2VdXrBqRJNU0dTmN2Kj/tPdvcsnN6YRKiMefkWGZwP6OV0ndbxqEfwDZ8NS
	sJO0rFRGlwhPxGBged0Yii+EAbYXgxXBTV8R0BES26kFcf6spOV4+HHfFgopH5a7uSkzu4hik6J
	tVChCROrKcX2suLAkd18tsOGDkojl4gX8oypYtm9N4aKxIFS5MLUvQFdV6gLllkc4XTlXU9x+mf
	yVk0sQ0fQ/YmUSU4dMMBtn/oF72vP4VDfjiDIvJFJQzyzxGOX7eELL/cXlTdEBrcJcarDKuM88M
	gWomyUmAA8ZWtoXP/VaRhOmLjB/dfRXodOxKqQe3yhMboHeaYTggJEOomkdvUHCGnodfWQUGamU
	30vifQJsRvaGHBsvYPKU3BsiNG9I6vgcZwtUPdHf7rHKwuZNJPcCtDPm4uRdriVPKfM5n1LvIjB
	molY9aMGBK1kc9NVuGt91WBHqkHsGKAwjdZ2MDbdGtPtJYPcCFQ5RkSbOBYwD35Y20bsMSc8i6c
	r0TaJW/FCNd9X5U3+iC9xKc3LFGVHI3FoY6tcbDq2YD1uthNo7avMP9GR024nPJHmp7xxmZswAR
	lv8tyyXe5iiUYk94T1WKdpYzJ0xUbHtW5JI4R/DZDhCjClozWz31og6kwYfYH3hdGaokTRaHbi/
	Nhe4w
X-Received: by 2002:a17:907:7215:b0:c41:1781:a2af with SMTP id a640c23a62f3a-c460370aea2mr390244766b.9.1792580497616;
        Wed, 21 Oct 2026 04:01:37 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:37 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 16/36] python3-httptools: Upgrade 0.8.0 -> 0.9.0
Date: Wed, 21 Oct 2026 14:00:40 +0300
Message-ID: <20261021110103.1943456-16-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131275
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.9.0:

- Upgrade llhttp to 9.4.3
- Build CPython 3.15 wheels
- Add RISC-V 64-bit wheels
- Add Windows ARM64 support in CI
- Build PPC64LE wheels
- Modernize test and release workflows

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-pyproject.toml-relax-setuptools-upper-bound.patch    | 4 ++--
 ...{python3-httptools_0.8.0.bb => python3-httptools_0.9.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-httptools_0.8.0.bb => python3-httptools_0.9.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-httptools/0001-pyproject.toml-relax-setuptools-upper-bound.patch b/meta-python/recipes-devtools/python/python3-httptools/0001-pyproject.toml-relax-setuptools-upper-bound.patch
index 16280d7074..161a953ddf 100644
--- a/meta-python/recipes-devtools/python/python3-httptools/0001-pyproject.toml-relax-setuptools-upper-bound.patch
+++ b/meta-python/recipes-devtools/python/python3-httptools/0001-pyproject.toml-relax-setuptools-upper-bound.patch
@@ -1,4 +1,4 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From f200709624ae981ba284885744081e90c5bdc4fa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 8 Jul 2026 00:00:00 +0000
 Subject: [PATCH] pyproject.toml: relax setuptools upper bound
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 1111111..2222222 100644
+index beed202..60e22aa 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,6 +1,6 @@
diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.8.0.bb b/meta-python/recipes-devtools/python/python3-httptools_0.9.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-httptools_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-httptools_0.9.0.bb
index 7a4d567248..6bfd801812 100644
--- a/meta-python/recipes-devtools/python/python3-httptools_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.9.0.bb
@@ -6,4 +6,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI += "file://0001-pyproject.toml-relax-setuptools-upper-bound.patch"
-SRC_URI[sha256sum] = "6b2a32f18d97e16e90827d7a819ffa8dbd8cc245fc4e1fa9d1095b54ef4bd999"
+SRC_URI[sha256sum] = "d484ebb7e3a3f3597b0f645fbd1b85633674ca808c1f5ba11c2caf7c66f5c8b6"
-- 
2.47.3


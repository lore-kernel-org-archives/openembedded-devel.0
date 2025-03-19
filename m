Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB440C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:21:19 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.3015.1742372476686170371
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KOLnaW1D;
 spf=pass (domain: konsulko.com, ip: 209.85.208.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5b56fc863so9231316a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 01:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742372475; x=1742977275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Avco1mnhF9FarW62UJhfl5jniXzuWYsGtS1D9PmPELU=;
        b=KOLnaW1DR03g0zxKw7hl2srcavp2eeUmYHeWXasg7fTeRJAv7wdE5QFF/AOchPZh6r
         PM27uyYHENjMlhLkdoHi9zRtbaznFH+Ze/1k9MQkFD/vM63BwmEPuufCWI+KnbEFubLe
         pjEnsGdeBEhveKOfuRLk0oUwrn64XSZs0v0Ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372475; x=1742977275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Avco1mnhF9FarW62UJhfl5jniXzuWYsGtS1D9PmPELU=;
        b=f9rFM64AvLVdYb7ZfCnGwF9OM9HHqrapE+/M39hAxqRlQOkY34C/4qUIh9ZK9BhWIN
         An6uVbKQIaQIWfOLyhrk3NGOA31bjS1wnssK1GcZg5FuygpNK37BWg6pCRc6Q+Wlp6s/
         dLY+sYh/zHY3NVRLZN+ExO8gHNXxOr6WwDd2ixajLF+9a2Z6ZorYEVeQ5BF+62Uj9AkP
         ep1YotL4UtZrBXbPsf1HB3Ijpe2nZ6JhS9wbVjBTYnBLFI/6TF8fZfkN4QL4WVL/hcbJ
         0/e+MdXPUiiAcKCXecvplb9Pio9DETemP9r2FIyBVzNPtcibZjYr26hmeVMbTINxL3NV
         QzEA==
X-Gm-Message-State: AOJu0YzGiF7Rpl6WPKdwf8Ly30SCAc93JOrXenK2nMzlSQ8KIOFjuihj
	fsWsTtYOWoMYNh4gaISmLKZhim7nTg9EaQLjr1EEOXbB3R/UdxSLouw+dFOvayV8UC7fK6iyrUX
	o
X-Gm-Gg: ASbGncscuFaQkaFCNYEPjeP6z8n2OE/QGuqu+WKFjjgIQlt+MtkScE5WImTGGdx+1j6
	+YW70Ck55y2Cdyt3dA8Fh43frz2A059Iu03PHyXktAQLF0/+oB4YQumHnAQQGuhE3GUL63WiLa3
	doGKhPGoLmhRXLn6qKAZ7OPCgd7aHm58udgSyfIIosmulm9rZyeE5JjB+WsnLkP3TDz63QU7c5E
	K4osejsaL9gUZjrcgZ26Sy4msCml04j4Aqpme5wlORmlI66kBL4dVFsj7CMDtqYrc/ttfyc7HxY
	6hogzp3kFFrxi6t/47bIZHc6CcnEUZPJ/uXRdo4Rs2iiruPYGanXMlROguk=
X-Google-Smtp-Source: AGHT+IGq2SFe8z6IGpbcGcgibFsylVqPkljG133mOzcf/0uImaCOfmanO/jCS9ulVGdTPHd9BGtyMA==
X-Received: by 2002:a05:6402:524e:b0:5de:dd6b:a7b0 with SMTP id 4fb4d7f45d1cf-5eb80cde555mr1708251a12.1.1742372474466;
        Wed, 19 Mar 2025 01:21:14 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b04dasm9035761a12.37.2025.03.19.01.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:21:14 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pychromecast: Upgrade 14.0.5 -> 14.0.6
Date: Wed, 19 Mar 2025 10:21:09 +0200
Message-Id: <20250319082110.2907028-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319082110.2907028-1-leon.anavi@konsulko.com>
References: <20250319082110.2907028-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 08:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116066

Upgrade to release 14.0.6:

- Bump version to 14.0.6
- Fix hostname support
- Advertise typing support
- Fix typos in Plex example
- Add license to project metadata

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ewer-version-of-wheel-and-setuptools.patch | 22 -------------------
 ....0.5.bb => python3-pychromecast_14.0.6.bb} |  7 ++----
 2 files changed, 2 insertions(+), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
 rename meta-python/recipes-devtools/python/{python3-pychromecast_14.0.5.bb => python3-pychromecast_14.0.6.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
deleted file mode 100644
index 3d5d043f17..0000000000
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 41da1605df6d781bdf01c0ecefea88bba7758c21 Mon Sep 17 00:00:00 2001
-From: Tom Geelen <t.f.g.geelen@gmail.com>
-Date: Sun, 7 Apr 2024 22:39:35 +0000
-Subject: [PATCH] Allow newer version of wheel and setuptools
-
-Upstream-Status: Pending
-Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 545297e..84a92c2 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools~=65.6", "wheel~=0.37.1"]
-+requires = ["setuptools>=65.6", "wheel>=0.37.1"]
- build-backend = "setuptools.build_meta"
- 
- [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.5.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.6.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-pychromecast_14.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_14.0.6.bb
index 6c8c093486..fcb40d62bc 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.6.bb
@@ -3,11 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI += "file://0001-Allow-newer-version-of-wheel-and-setuptools.patch"
-SRC_URI[sha256sum] = "a8671ee4ea4a7095e2e0670e2215145ec1e3e0aa0737ff74d648ae4dc268b2b1"
-
-PYPI_PACKAGE = "PyChromecast"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+#SRC_URI += "file://0001-Allow-newer-version-of-wheel-and-setuptools.patch"
+SRC_URI[sha256sum] = "8af91af4fb62d9d6e4df1832c6503dda74afb14c7726ede1ff863e178deb3f9a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5



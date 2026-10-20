Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6335.1792499556785491274
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TdWIRGXH;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso15620275e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499555; x=1793104355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/fSAfUWebOHuAhqdp7OU7DQM9f0pRTP/XkK7kkv8N8=;
        b=TdWIRGXH7NFZ0OmnhV3ETvrniNkZBpJKhvYZLcb2g4Px+1+sI2TxTY8EJZQIvAY/hB
         lM//F0mxHzo79+jo2sI3FNoVODW66qp7ttcEPZfJtzXRbhEw9aqo3d+wvWPl9yCIdpQX
         zipJ2yv/PRagsVXRvCiwc9XAnMp4O/44GVhbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499555; x=1793104355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/fSAfUWebOHuAhqdp7OU7DQM9f0pRTP/XkK7kkv8N8=;
        b=npJYLkIWKvnddHZJl8B6vDquDZu0hhS5xYVolYU5WwAAsiZjVhZI/b8H98oSGB08LR
         kuZqVBk7kWNi2TpaMCZaP8EVViDQz/ady/ENU/xXivKRGJ2kzmiZJjxOorY9iPXeEDXL
         vGZrwz94+JzKAKQB2jnPCz8rZDQrE+pjJUrYYFizyCIoiLRgEnyyvxeIwLoFwRHPJr/l
         OHfxUGX4r8O1HwWMgZwWsVZYq13nctV0v5W6XXvl+d4A1oG0BhMW4sjx1V2jhocsC/df
         qeqH7SB3U7eEm/JoYnAEbxufOi99H7geQtnw+YFBmDviORGoIhRuequpyIwJntwNTdsY
         uHvQ==
X-Gm-Message-State: AFq9FYKA/L91I+UZ8b1oU33s6AbBq0V1blBkckuHLkdmBSDkGFxbKLIl
	CTTtwK1xg/OBsn7koNSMzaWgQ38HWjmWZDGpb4mFYZBZjGJPk9I+ZD2SAhX66fX0degwmCxe9i+
	5cOWa
X-Gm-Gg: AYBFou3dWiWXEC5jy2nq3Yg59EqFDQlDTjrx0FdyUvAu/cLriJnE3tfDgZipPxA1ln7
	DwV87QB0ycwhwkGbvtVvV+vrfKjhQ/Z5ttauAeKod9BiKXEohPvFj6/g0hEVyXojNrYs6sPsa2o
	e9AiqqsfmPSf11XiUGFgnv/to0uDSpIJyW9WN+w8+OO5iUB6Oa8Kv1ESPNnL7MK7A7/n5NQU8W2
	QemHtTpGskaz+Ul7QMN9TVJN/+n7OHaJ3TXSDY8ejU302TG6TqCiwLQ1odzuPzE9dtucWUB6ALn
	0dkZmYJs6AHu6q+KH1myKcQZC/Ngxmuy4qKg8oLgml36mnpkfsFd+AaP2Gqnw7HPwBsii1Bkw+y
	3H/dFg6QgXFdFzRGtWwJbpSE7XFYejTtPHLJgDykeGoPXKi3Po/niBkgIs2PDhKtCFBAwVReMmW
	9CeCFSg13ik2j3OsI5O2yZMiJMtlEB/iOnG9xyBy0+L1IhR/7cgPr+UkfFTD+hlksaKhTlUnRhR
	+jFRjuXWdhaYzJpGrGXE/L21w8mX5XLJxbivGU/CWN7zoid99YNozypoGC+0vmkx4QF6FLeeU0n
	HhwnSNrhH8dffZL4ERP8d4KDSabYHWOThw==
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1d75ab363mr241495135e9.4.1792499554967;
        Tue, 20 Oct 2026 05:32:34 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:34 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/14] python3-zeep: Add recipe
Date: Tue, 20 Oct 2026 15:32:19 +0300
Message-ID: <20261020123226.4033600-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131165
Content-Type: text/plain; charset="utf-8"

Add a recipe for zeep, a Python SOAP client. The changelog for
release 4.3.3 includes:

- Wire up the forbid_external setting (previously defined but unused
  since the move off defusedxml in 4.0). When enabled it refuses to
  transitively fetch http/https resources via xsd:import,
  xsd:include, wsdl:import or lxml entity resolution, raising
  zeep.exceptions.ExternalReferenceForbidden. The user-supplied
  entry-point WSDL/schema URL is still loaded. The default remains
  False to preserve existing behaviour; enable when loading WSDLs
  from untrusted sources to mitigate SSRF via attacker-controlled
  import targets.
- Internal tooling only: migrate dependency/build management to uv
  and replace isort/flake8/black with ruff. No runtime changes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-zeep_4.3.3.bb              | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-zeep_4.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-zeep_4.3.3.bb b/meta-python/recipes-devtools/python/python3-zeep_4.3.3.bb
new file mode 100644
index 0000000000..771c98a154
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zeep_4.3.3.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A Python SOAP client"
+DESCRIPTION = "A Python SOAP client"
+HOMEPAGE = "https://github.com/mvantellingen/python-zeep"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=23356a26b06086844496d9e634f58ae5"
+
+SRC_URI[sha256sum] = "99d5059f92f721020998695fd9c85289ccb03ec5a2398ad49c6dbe43f19cfb94"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-wheel-native"
+
+RDEPENDS:${PN} += "\
+    python3-attrs \
+    python3-lxml \
+    python3-platformdirs \
+    python3-requests \
+    python3-requests-file \
+    python3-requests-toolbelt \
+    python3-isodate \
+"
-- 
2.47.3


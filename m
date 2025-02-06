Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588BCC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 16:40:36 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.45939.1738860035204116400
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 08:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DUyDjart;
 spf=pass (domain: konsulko.com, ip: 209.85.208.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dcd09af4f9so2402414a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738860033; x=1739464833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZSkQ/SsOb+mcp5YPVFaCxWB0YWEbJx0hqJXSlT3rxA=;
        b=DUyDjart5Fpf/s7KTB73WVrkInl2+T6xieH7Q9BAuBIF7AoUtZitDft0yq54QDmThd
         Vy63/F3eLA6tfbG5KWx8iKZhHMvIYGfltJMimrKulmm1n1YWzJiljlsUs/5Tx7F2x9Bp
         WvaZf11Vfgp+7I6dDJC6HhfUZGTLlkxOPgGfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738860033; x=1739464833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZSkQ/SsOb+mcp5YPVFaCxWB0YWEbJx0hqJXSlT3rxA=;
        b=i8o3TVZu/Tw3lps68Tc3/e8pHTTCYVrrJxruMNROuff4vudWv5ZKfOwek08873rN6A
         Ftyh/Kfuf+w1ldoDkNQtiMWK9FF+gak/cTiso47HO/bL4ZiChfC0ypSFyQ/rPRY/+gCG
         FPGS4or7LSAX5ZCyHRCZ2UW0X59wYBfqlcpyLGQlhsCLYD3hzNPLteKjpkbTOqZC8Fo/
         LXhtjnHQR0iHlINk218ECCl5FkP0ZMUbiPJhQhq4PKBNyYjUjXsWU0bPKbuojqWLz+6Z
         H4sQxKrJLuk6nMWdFsmzhRepwbmy2N99+ZC0lzfRTU/84gbWlKFHN3O6qzZmqLe4B1ax
         KZpA==
X-Gm-Message-State: AOJu0YyOWEtuMsWhoZXorRjPhR2TfXkT8hmDOVYeznMXK2KGzuLLdoUH
	TJxw8Ro2ZHqz7jc0urDkD8CSXvVUX1xwmZOJGBftL6hOkor6Rw4qFvZoBBCliQYm5mxxOKjBEGm
	f
X-Gm-Gg: ASbGnctyXl/n+jS5Gd5zouamQUDa5MxTr1gaqLxtE+yXxPjPbHZC9DSlgrtNLAffVY3
	8lySsOvkw6fvQiU9nLSaHCQRLd9UDxiDq1KwpGOO9s/agNawh1Ih87kLufPwq8d6kjA8/h0DQ+y
	XAXJStRwTLQ3WygYoHrnJVJu1diS7CngWFx/sQWTcn680XvZwbrhblLgkcHXMbskdNMoMBokPqK
	w5YVE7WsgEUYLj/G9ja88L1bwbBllAjS5jENrTWQLnzuZ8IsW+chMJDf9SyAT/OOEhhZ96fp8eF
	5xH3p/e2OG/Toe51Yv9xbZAIqKwl+Q==
X-Google-Smtp-Source: AGHT+IEZubu54tLsbGVgA9jHFkdIkzVM09a3WVScIfIxXjGk6U4a38c+RGObfRF2MdNo4oL6cHRPrQ==
X-Received: by 2002:a17:907:7b83:b0:ab7:6d4b:c9c2 with SMTP id a640c23a62f3a-ab76d4bcab4mr546781466b.47.1738860033050;
        Thu, 06 Feb 2025 08:40:33 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77365ca1esm120643966b.180.2025.02.06.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:40:32 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][styhead][PATCH] sip: Upgrade 6.8.3 -> 6.8.6
Date: Thu,  6 Feb 2025 18:40:29 +0200
Message-Id: <20250206164029.2528908-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 16:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115289

After the migration from Mercurial to GitHub the homepage has
changed and SIP has been licensed under the BSD-2-Clause license
since Feb 9, 2024. Upgrade to version 6.8.6:

- Handle single number macOS deployment targets
- Support for architectures where `char` is unsigned
- Support for building from git archives
- Run the tests using the current Python version

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: sip-6.8.6-r0 do_check_backend: QA Issue: inherits
setuptools3 but has pyproject.toml with setuptools.build_meta,
use the correct class [pep517-backend]

Please note SIP version 6.8.6 is present for branch Scarthgap and
it is required for PyQt6 6.8 from layer meta-qt6 (branch 6.8).

The work was sponsored by GOVCERT.LU.

License-Update: SIP is licensed under the BSD-2-Clause license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../sip/{sip_6.8.3.bb => sip_6.8.6.bb}               | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.8.3.bb => sip_6.8.6.bb} (53%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.8.3.bb b/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
similarity index 53%
rename from meta-oe/recipes-devtools/sip/sip_6.8.3.bb
rename to meta-oe/recipes-devtools/sip/sip_6.8.6.bb
index d12130af43..1defe29b08 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.8.3.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
@@ -3,15 +3,17 @@
 
 SUMMARY = "A Python bindings generator for C/C++ libraries"
 
-HOMEPAGE = "https://www.riverbankcomputing.com/software/sip/"
-LICENSE = "GPL-2.0-or-later"
+HOMEPAGE = "https://github.com/Python-SIP/sip"
+LICENSE = "BSD-2-Clause"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1d69a33480ebf4ff8a7a760826d84e"
 
-inherit pypi setuptools3 python3native
+inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "888547b018bb24c36aded519e93d3e513d4c6aa0ba55b7cc1affbd45cf10762c"
+SRC_URI[sha256sum] = "7fc959e48e6ec5d5af8bd026f69f5e24d08b3cb8abb342176f5ab8030cc07d7a"
+
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} = " \
     python3-core \
-- 
2.39.5



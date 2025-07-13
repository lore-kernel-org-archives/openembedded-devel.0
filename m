Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C73C83F17
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 15:10:54 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.58255.1752419453241028168
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 08:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TAOgbbC2;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so7322436a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752419451; x=1753024251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hL/+JgZXdFCPL4+ZLoI47IiJKpQnxfVZU38pbr0sfPE=;
        b=TAOgbbC2GsrmsKDJ0BDQRRIkWAWtySpGqQN2RMR28Eu3nINXBnHIOWPmnCN0LKhoyA
         iE0QBr/2ciVYbQtRHd8yQzKU70IHZNoyodXuBWgNYpg0C5NjIwsPqfGVNjmUe7gxUM93
         2RoYNrQVlyjt7gSPdACrU0kNcB/7hDv5n4a5lWZB6iL2q05pWkIoTQgdSNoe3l6zm6KW
         2QIXgxxE1TjdFEjuuZTiiJtbYB5A+6PGLez49AJ3qXxFNX+75f2dd0i+tTcr0ai9qDmz
         U+qkS5FuSTUkQoykq/VJr19PTWU7mvGI+U2sMIqc+RKap8kOS6ZzBt/s33Xaca/0cF1R
         9z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752419451; x=1753024251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hL/+JgZXdFCPL4+ZLoI47IiJKpQnxfVZU38pbr0sfPE=;
        b=b2R0g8rEbRq6MdgJulQaNl2SQpjlxMG0FwQFFDCkb9NXpTgB9XkuXjuk5md8H+x9Tr
         sMRJ6fwPvgWxcLd9omPis2tR9g4yUtVSTDC3ZNOAR6VRun1hjtK45sAnkDFItD/VPZJc
         Klw2KPUyvtWH1M8AM72H8WdDbTFEyXeEk3Th6jUWvEZKVqp1DA25Mg8tbu2HxO2f4JTY
         ZVmBr74QWGRcC+B3s5vSApiV+tvbE5QwP++8MhXvnUAv/EibaAxaURXgOxf0SQJM9egV
         SfkOPlxUyE5CoBfZqNlEkWR1pLCQ/ZBs2BPHIi875AtIA00HKeyTP5YA/jTp828lwPSG
         kPPA==
X-Gm-Message-State: AOJu0YyL8s+a+f3eroGWh8b3fdB2lq+NfRR2KtcrFLp/4zdM0pPXHs7x
	tCwezozXTfhNjQTXw0pzzcy6/qj3F6DlCD9A2foEDKDljj1Yv2mNeejsHXPXrMwG
X-Gm-Gg: ASbGncvubpcIlC9ZAqIdEBh2egvVgKtokl0mnU7Iz3dZ5SADlYpKQ628gzFUcS4yFMV
	C9nhBfHuXekYGNLOuaVwiqs9DuwC7VunTsVRBCmg8ePox00kDOIFgxYKs/UrzYpTC297GHErKgc
	bqMRHaVIwPN89b57rASp9dNmnWiEbuV/wBHERWDfmpWOtSrdtoVBOg8Po8Uv4BGjH6ei1525ess
	COSIul/si2rRAJbZsAlnwbC9LB2tImRhPuIDalLBGYTLMNIXSJwoq3S0+GWpsMB7s1+VRFw4fma
	o4qZD2mItnXzNoNaUpRhC2BMbnhTIUFQuni0BzMPteA6SfUnfPPlPqokV+7m0r0Fn8fjNwXNNh5
	1GTRmAPM5VbjBYuIKu+QZ7Xa7cgovJ/6Rag9k69ju1BhGucHQf7xcmstSMij1EKVLBQvQid9r3b
	+s
X-Google-Smtp-Source: AGHT+IH5bVS+UnC+IDElXp3Cc5d7hATZ1vKd4x7TRGaEg79U+ccV1p4nw1fmGIqCeBKK/dUD+e8f9Q==
X-Received: by 2002:a17:906:730c:b0:ae1:f1e0:8730 with SMTP id a640c23a62f3a-ae6fcc7a6b8mr1007975366b.57.1752419450983;
        Sun, 13 Jul 2025 08:10:50 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c0asm650493066b.127.2025.07.13.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 08:10:50 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 6/6] python3-pytest-xdist: 3.5.0 -> 3.7.0
Date: Sun, 13 Jul 2025 17:09:44 +0200
Message-ID: <20250713150938.2992477-12-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713150938.2992477-2-t.f.g.geelen@gmail.com>
References: <20250713150938.2992477-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 15:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118513

Update PYPI_PACKAGE as the package naming has changed
Drop obsolete RDEPENDS
Update LIC_FILES_CHECKSUM: license type is unchanged.
---
 ...ytest-xdist_3.5.0.bb => python3-pytest-xdist_3.7.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-xdist_3.5.0.bb => python3-pytest-xdist_3.7.0.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.7.0.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-pytest-xdist_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-xdist_3.7.0.bb
index 89b5039571..17ab67c279 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.7.0.bb
@@ -1,17 +1,17 @@
 SUMMARY = "pytest xdist plugin for distributed testing and loop-on-failing modes"
 HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fbae836e16c18f4b220f7db6564e8f61"
 
-SRC_URI[sha256sum] = "cbb36f3d67e0c478baa57fa4edc8843887e0f6cfc42d677530a36d7472b32d8a"
+SRC_URI[sha256sum] = "f9248c99a7c15b7d2f90715df93610353a485827bc06eefb6566d23f6400f126"
 
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-scm-native"
 
-# Note that the dependency on pytest-forked is scheduled to be dropped in 3.0
 RDEPENDS:${PN} += " \
     python3-execnet \
     python3-pytest \
-    python3-pytest-forked \
 "
+
+PYPI_PACKAGE = "pytest_xdist"
-- 
2.43.0



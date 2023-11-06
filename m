Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F39C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 13:46:30 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.54090.1699278388853058015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 05:46:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YaxdPnyt;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53e07db272cso7652497a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 05:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699278387; x=1699883187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxRHeiYtaJ7yoKlmRJEk7Qq7fFEV9KmR06igXT2eC7g=;
        b=YaxdPnytKqgFVZXbq5ytgyEYU6j35Ia7KU46lMVTsdugBO78GbzWFkwoAZM5GcJEsV
         eEkrX5PBkl3OcwBu/8fsF/i7SW2DwdxutiMjKfCLhArZKDYTNEOZe3pq5yMVyeD5x+Lj
         /C1gQpmKml7xTjw88OyaMTceiadHVb0wVDMtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699278387; x=1699883187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxRHeiYtaJ7yoKlmRJEk7Qq7fFEV9KmR06igXT2eC7g=;
        b=cAoqr75KBkReXSVK1flxxk1jqtM49ChrvNSnxm/JpBOc8I1xlLxTKKMZTPW2dzKNQW
         C4nGWTF4CBAOf3qlfeUEOmF+1dEBtwZEBezsfXX61kXnPje9XxAHFbeYFOXMjosOqR7c
         05BVQeFMmC2W5Oy1XKVaMmsqDu7jvhvMYouAvYchm+SsL6VvacE12y2OKQHCTV7E3nB9
         RjkcWzryXMMbLhhpmE44VVfPY0Behh1seUZP9iaOmagyYoEwtMn4HiQcNjDhMnwlaeEO
         hyxr0MTjy2adTCjgN088ItczS4fvUz0VCHvSgqo0v9mo54rohRSHnfR6STfoqIYex8TJ
         2p7w==
X-Gm-Message-State: AOJu0YwAg8uHcCMbnBUpoiRfjZdDk6efwbCic1Jlex/0eWSGKUQoIaG6
	78g+cXzGB/mgK1QQ8SJhcDwrBFbMiEq00qaoCB8=
X-Google-Smtp-Source: AGHT+IEzR8eMoedvF1gp2QGV7xwepmD03O8dazTXaegI/1yWX3ZgQtmHRKc0kVlmgcEznybnFJ47dw==
X-Received: by 2002:a50:bb0e:0:b0:542:f328:5671 with SMTP id y14-20020a50bb0e000000b00542f3285671mr19201315ede.31.1699278386998;
        Mon, 06 Nov 2023 05:46:26 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ba26-20020a0564021ada00b00533dad8a9c5sm4324013edb.38.2023.11.06.05.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 05:46:26 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pyppmd: add recipe
Date: Mon,  6 Nov 2023 15:46:22 +0200
Message-Id: <20231106134623.11522-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106134623.11522-1-leon.anavi@konsulko.com>
References: <20231106134623.11522-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 13:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106413

Add pyppmd, a PPMd compression/decompression library.
Version 1.1.0 provides:

- Add Python 3.12 support
- Minimum required python to be 3.8
- Export PPMD8_RESTORE_METHOD* constants
- Drop setup.cfg
- Drop github actions workflows
- README: Add SPDX identifier
- CI run on python 3.10, 3.11 and 3.12

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pyppmd_1.1.0.bb            | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyppmd_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyppmd_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyppmd_1.1.0.bb
new file mode 100644
index 000000000..053c9adab
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyppmd_1.1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "PPMd compression/decompression library"
+HOMEPAGE = "https://pyppmd.readthedocs.io/en/latest/"
+LICENSE = "LGPL-2.1-or-later"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "1d38ce2e4b7eb84b53bc8a52380b94f66ba6c39328b8800b30c2b5bf31693973"
+
+DEPENDS += " \
+    ${PYTHON_PN}-setuptools-scm-native \
+    ${PYTHON_PN}-toml-native \
+    ${PYTHON_PN}-wheel-native \
+"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-importlib-metadata \
+"
-- 
2.39.2



Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0683C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:33:58 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.55941.1751880835261073202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rmjHj59w;
 spf=pass (domain: konsulko.com, ip: 209.85.208.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60dffae17f3so4905599a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 02:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1751880833; x=1752485633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qUnwjoocCNkMJJjnjatMmPlp3PvFDPI2g/XSf+JP9E=;
        b=rmjHj59wt4OMYU4mtPbbFnc7aINK2NV34YSKfVzCD2P0p6fEHfB9iywlYnGUB1Slsi
         dVI8QhttLhcxOb0kdWMvtK/t2o0YFq8cXBcvcLw0sUcd1MQ6OVQEqDL3jVNbHrQGDXbC
         LlyHjy2HCUibuGLB6ZdaHFZQs1j0MrCVH/xW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880833; x=1752485633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qUnwjoocCNkMJJjnjatMmPlp3PvFDPI2g/XSf+JP9E=;
        b=LfYHlAB8NP9+Cpsij3o765x753hQTRCkH4Tdowgp9xmkx8AqI8K1KhyCyED8pW4v4F
         QEsmv7ikXxL1J4GN3KNMxSa8JC1Z0q+MsDJqilFSzhy3HCXpK71IHE3i8Tx5m1QNHsDo
         juVtzFPZh4zjNeY5A5tG0kE6L6UyiqlrX9VyLN68HFqeSDgSBYjnIVe+vRKkmy7aGLFq
         wdgaHVZQMlPVU6JBqDk/zThtfr0RCa1sKv+aiBByq/vCwanvL3Y8Mm1Uqy231YchJ9HU
         eGrDBF37c7KBANyx7UhLLREykUWDoZqqDS1tak5qH9aHyJfkuGLLxhYIzNYi0uqeVzC8
         cI0A==
X-Gm-Message-State: AOJu0Ywe2lTQNSe4F+c7xSxYHRCCem8RSMa4y5M7Wljcd+Ky+VuB04Af
	Cuj7rZskhundsfKpdMU+hgfg90UUECUqApQyzAGV9kygT0a469CsJDJonqex/hJFuQHxdr3mLqA
	Dlzux
X-Gm-Gg: ASbGncshShgnACf/Ameq+0lkk0iLAkyDwJFhlCRJw2J1UekVFuApENq1wuy6yTkQWAZ
	zCIOA3r947L7y/DANMayxSu+VcJjPb8CuqE98tPmdySfKsD80/tF4v9oj9qUROS2yl+Tm3doGs/
	NTkZSTwkuK5JBgmbjCzbjCyoDFLfjjdYFjSxwzmQsxbv9yfY722JHWbox0zFBrbabE0pHfUZt0i
	iLqKNebvxsAb9m65ZD/bchJUw4eWmS+A5nDcyf5WvNJcF8JSqczdtaN6asQYwheLA39kn32sMck
	aU/etPF2y0Eak1fMFdjmFnx2aFqjutaqV+AVVeShOah6RYcyhesIfOWQTJDbU1F48MvuIyfNTkf
	f
X-Google-Smtp-Source: AGHT+IHMoaTMLkq5RzoUYGYreMz2i+ExAeuc+GYaLopJzht+1c+bev7aI4cbDgHf4h/TJyq9Idnx7w==
X-Received: by 2002:a05:6402:278a:b0:609:9115:60f8 with SMTP id 4fb4d7f45d1cf-60fd6d50643mr9830847a12.21.1751880833398;
        Mon, 07 Jul 2025 02:33:53 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca69657fsm5262179a12.26.2025.07.07.02.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:33:53 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-txaio: Upgrade 23.1.1 -> 25.6.1
Date: Mon,  7 Jul 2025 12:33:49 +0300
Message-Id: <20250707093349.2451474-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250707093349.2451474-1-leon.anavi@konsulko.com>
References: <20250707093349.2451474-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118283

Upgrade to release 25.6.1:

- new: announcement of upcoming (but not yet effective) new AI
  policy clarifying matter with respect to AI assisted
  contributions
- fix: update license file to include contributors (#188)
- fix: remove obsolete dependency on six (#186)
- fix: update pypy version in CI workflow (#187)
- fix: setupcfg.py:508: SetuptoolsDeprecationWarning: The
  license_file parameter is deprecated, use license_files instead.
- Copyrights transferred from Crossbar.io Technologies GmbH (Germany)
  to typedef int GmbH (Germany)

License-Update: Update license file to include contributors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-txaio_23.1.1.bb  | 12 ------------
 .../recipes-devtools/python/python3-txaio_25.6.1.bb  | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-txaio_25.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb b/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
deleted file mode 100644
index b14e353818..0000000000
--- a/meta-python/recipes-devtools/python/python3-txaio_23.1.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3e2c2c2cc2915edc5321b0e6b1d3f5f8"
-
-SRC_URI[sha256sum] = "f9a9216e976e5e3246dfd112ad7ad55ca915606b60b84a757ac769bd404ff704"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-twisted \
-"
diff --git a/meta-python/recipes-devtools/python/python3-txaio_25.6.1.bb b/meta-python/recipes-devtools/python/python3-txaio_25.6.1.bb
new file mode 100644
index 0000000000..460c0cd0f8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-txaio_25.6.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"
+
+SRC_URI[sha256sum] = "d8c03dca823515c9bca920df33504923ae54f2dabf476cc5a9ed5cc1691ed687"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-twisted \
+"
-- 
2.39.5



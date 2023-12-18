Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D42C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 17:09:26 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.48807.1702919357973522882
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 09:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=m4h5LdyG;
 spf=pass (domain: konsulko.com, ip: 209.85.208.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-54c77e0835bso4128040a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 09:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702919356; x=1703524156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkKudEsJpFv6yCBM4gYkeIuOUozYirB0bLs0ZtNEhDI=;
        b=m4h5LdyGKya1a+RckewQ3WsXTY+sBwHyScQKcsvmoobJ0zu/lfz7oObjkTC+M0A4HN
         YcY0gbHViqkZitzpZJs3P1DB5ztfpRwDtGRioZBOgcnn4Dfm0W9K8srkdeV/s2Sv8lj6
         yCafpnpK5PVfEhgemAnDxQl9Zc/ZGmeno2r00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702919356; x=1703524156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkKudEsJpFv6yCBM4gYkeIuOUozYirB0bLs0ZtNEhDI=;
        b=jvjTlNYiqy5OXO2i+7ngxZjHrEnCffW79q5n9bSbtAqHPVCeYU0bQW0rBS1w1OQhQ7
         m9+URJvmNiIQRVnvO/l3dVZG1j6krMC+T1UEGUokPl0JoOM8mE/IPNdMPKKlUCaesSYW
         vbnQ3V2p+aPn9NLrmmQtUAV/8RVOpOMdget19l9LORN/9iM0RhNheLE++yTI7nnVgBD+
         fUdftEInUZfgXr6c5WQC0/vAMq8fkDHhb0Eza+C7n0Zn13HTXI8fkTEd6gz7l3O8drZI
         fSmy7IBVehU2JNtN2H+jS9uIjYXj6NM0QaJhvxuqa+HyR6dyr18N5SImQJVQH/qAee31
         GBsQ==
X-Gm-Message-State: AOJu0YxwoVCgrujWcN6Ndjs1IP8q9R/YdVoHGwQhKw0bGgX1swGF6b8x
	riN9lxFZ1WkrrVJVYqRVyX/kd+CgbUZOh5YKGXo=
X-Google-Smtp-Source: AGHT+IESquC4ooKdeugD8moPzycBftXPV2RObeQa/1ffVsZgiBuKbROgxRkugPlOkPXgf5wdwwnbKA==
X-Received: by 2002:a50:cc04:0:b0:54a:f1db:c290 with SMTP id m4-20020a50cc04000000b0054af1dbc290mr9545694edi.9.1702919352841;
        Mon, 18 Dec 2023 09:09:12 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d12-20020a056402000c00b0055344b92fb6sm1380419edu.75.2023.12.18.09.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 09:09:12 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-dominate: upgrade 2.8.0 -> 2.9.0
Date: Mon, 18 Dec 2023 19:09:00 +0200
Message-Id: <20231218170901.1378254-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218170901.1378254-1-leon.anavi@konsulko.com>
References: <20231218170901.1378254-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 17:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107547

Upgrade to version 2.9.0:

- Modernize setuptools support to use pyproject.toml
- Remove brittle test

Remove fix-ptests.patch as the issue has been solved upstream.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-dominate/fix-ptests.patch  | 20 -------------------
 ...ate_2.8.0.bb => python3-dominate_2.9.0.bb} |  5 ++---
 2 files changed, 2 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dominate/fix-ptests.patch
 rename meta-python/recipes-devtools/python/{python3-dominate_2.8.0.bb => python3-dominate_2.9.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-dominate/fix-ptests.patch b/meta-python/recipes-devtools/python/python3-dominate/fix-ptests.patch
deleted file mode 100644
index 81211d449..000000000
--- a/meta-python/recipes-devtools/python/python3-dominate/fix-ptests.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fixes test failures on musl
-
-Fixes errors
-ptestresult.python3-dominate.tests/test_dom_tag.py::test___get_thread_context
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-diff --git a/tests/test_dom_tag.py b/tests/test_dom_tag.py
-index 43ffecb..1126e54 100644
---- a/tests/test_dom_tag.py
-+++ b/tests/test_dom_tag.py
-@@ -18,6 +18,7 @@ def test___get_thread_context(monkeypatch):
-     monkeypatch.setattr(sut, 'threading', threading)
- 
-     assert sut._get_thread_context() in [
-+        1692341442, # Python >= 3.9, 32-bit
-         -6805948436281256182, # Python >= 3.9
-         3713141171098444831, # Python < 3.9
-     ]
diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.8.0.bb b/meta-python/recipes-devtools/python/python3-dominate_2.9.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-dominate_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-dominate_2.9.0.bb
index 6b0489e4f..2234e541b 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.9.0.bb
@@ -2,13 +2,12 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRC_URI[sha256sum] = "4c90c3befaf88e612b71f4b39af7bcbef8977acfa855cec957225a8fbf504007"
+SRC_URI[sha256sum] = "b15791ebea432218543a1702d76ae45d2ff95ff994e52014b8686a69dad772fd"
 
-inherit pypi setuptools3 ptest
+inherit pypi ptest python_setuptools_build_meta
 
 SRC_URI += " \
 	file://run-ptest \
-	file://fix-ptests.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.39.2



Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1BBC02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:00:12 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.2746.1737140410253102479
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a9c9f2a569so16992675ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 11:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140409; x=1737745209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaVdBP7k/jbRl52KUwZefqnUoW51PCbAjqq0yu9KvhQ=;
        b=hIfeH5Wexm1GhSNnFocGGsVRY6XuwHC2jHooSW7c5CrTrpnj3MUdc1z6OeAreBm0SI
         /e1+Xvv5nItJpJtcTFQKWu9d4BQdb0ILEvKBhb8JqXpu6WV74+s5QwMVXBKB+gcoo0PR
         uAhbC7cuos6UVnbeE4ojZBdrPFTBAw3VJAbNc1mWUOBOGGXRTzZZrWCAuJuYBOlHfwF9
         rMrZSUzO8K8ZcYjInR9MUSdbH82UiXXT1n7McAZ1OuwCX+eYeLdigL3NLeJzQ2qas40v
         kdm240pziDxUyXF4mggTnzHgwybXPrnKPojkg/e6w6H2whOBuVWGfgP9hSBpYH6Azq0A
         C9Ug==
X-Gm-Message-State: AOJu0YxPh0+uyz5cgxmzUFjBco3VIJ1gzCkQdOU0zwL6X4j2tFZgkmpv
	A9EVravPyrEwA8VrkpxvsFQxmuvDE9KFliHBdos8KiSgGWgQ8bHx3VNhJQ==
X-Gm-Gg: ASbGncv2pko8ge1Lx75hd6snZqq9TzJwpcpT+bLFDoo7DhtsQLWQnNduVY3fZ7wifUi
	0OCjEU3MFD/PyDYqTjoowGsnq3KvaQ3NVPGJC+iqBHwUiimquSJs5d0nLqFOmD+bhghgSy7eMgD
	IdtHKpgIqPQwOVNT5FHzvW/Z+qE1q0TGp1HOo+PKKiNTnipCoNcCDeSYNxUgT83XDHGqWUyXCzh
	h+R+prjPZG92rdf9nhfrQCSVZu6W2WEnXERUJJI1OWJjN3MuhrUixWBzbx0PXdNdMl4MjLRLeq6
	FGREM9S4NDPRStw7nTKlmiUpmw==
X-Google-Smtp-Source: AGHT+IE0Z6IpO1rWvL1yKC2OCra3jRobnikn/iJSebZ3uzAL0vzJwMTKJTBteQuZDKxa/mKPbcKR+w==
X-Received: by 2002:a05:6e02:1c23:b0:3ce:8ed9:ca94 with SMTP id e9e14a558f8ab-3cf744905d8mr26995705ab.14.1737140409048;
        Fri, 17 Jan 2025 11:00:09 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea75495f5dsm761396173.60.2025.01.17.11.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:00:08 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 04/10] python3-requests-file: update recipe to use the ptest-python-pytest class
Date: Fri, 17 Jan 2025 18:59:38 +0000
Message-Id: <20250117185944.3434424-4-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117185944.3434424-1-derek@asterius.io>
References: <20250117185944.3434424-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 19:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114925

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-requests-file/run-ptest       |  3 ---
 .../python/python3-requests-file_2.1.0.bb        | 16 +---------------
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-requests-file/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-requests-file/run-ptest b/meta-python/recipes-devtools/python/python3-requests-file/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-requests-file/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb b/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
index 670a36a64..6e20a10f4 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
@@ -8,24 +8,10 @@ SRC_URI[sha256sum] = "0f549a3f3b0699415ac04d167e9cb39bccfb730cb832b4d20be3d98673
 PYPI_PACKAGE = "requests_file"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-inherit pypi python_setuptools_build_meta ptest
-
-SRC_URI += " \
-        file://run-ptest \
-"
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 DEPENDS += "python3-setuptools-scm-native"
 
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-        install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} += " \
     python3-requests \
 "
-- 
2.34.1



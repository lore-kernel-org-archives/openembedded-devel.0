Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68EDC0218A
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 01:40:07 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.10523.1738287600016919999
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 17:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-71e36b27b53so824321a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 17:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287598; x=1738892398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5iV/xRTrtY7hF1rHKeHvtHyVan3h+hNCoY71GrFZWc=;
        b=URZrkokQGZaj1t1ybImkc2LWEZmmZaV2mRIfAnya3wiArfs6V6+S4TVNF/cbrsuLZt
         5nqYaLrAv+8SI9jQcQdylwxnmhkIt902tj84B4Dn9JwlByBJfgunHUiTXPjftnIXVe2s
         xiXA756elLxYg+kuXG09FFtqzenzJlKR4X2zr4nuUiAq/Mxiwli6kySOwhj522qQRCID
         Ucuzull1qSYIDyV5BOooDPSmY/ufOSDW7jdbmipz9mRse+AtP/7pbm1EK3TOb2mR1tEy
         1u3g8Ov+DNfRNa3wWG1n1OjaVPaNZfdRbdCs81s0ffiVkrDSZeHlMf49oVDu+wTdokO5
         ceOA==
X-Gm-Message-State: AOJu0YwImZ7EFF2J3aKGcdjf6gHBnINLLJxy0OajSFTQmEJHVzG0tUlC
	TeORdmWdM0VVVurAE8MUu6MpNzZBub5n/TCCc20IqJ8AgD9RozWDylfqo3Vl
X-Gm-Gg: ASbGnctQRY3V62jDVFv9hoGECjJ7Hb3K4KU05Hb6z8CjObFMeJIbsUgsFr+KzEr8O9P
	Knm8BWhtm0T3pLURzoOXGtNlNqG1TC2/iEns0WH3fKtP1uqMKHvNWiOybsR0URYq7Xvcti+eXWE
	BGwBgNCWHpu4xCgvP/cOx6CCOOdQ/+eEMXbraKnQf3cgFmacMVED6BFuJq5mG9Ojyn3RTS1xH36
	zJEXtFt8gMmC5dFjD2sM/9NFCd+DQ8QI0qx3tJmO4sljJORwLkPSSHMxfSxAOXVcAcZRDkOuEBO
	DWnYIpUcKzfJ22V3qOaRozLcYGDK37qw3mD3h3GJ5Ln6wTDnCA8XbcVYY7/g
X-Google-Smtp-Source: AGHT+IHfiWLY0lvsw3R+7fS3HLso3LfhU6qmpTyczdtqcywU/l5HIdkjeHEdKIAlN4FOHWye3BI0kw==
X-Received: by 2002:a05:6830:6214:b0:71d:f762:7f97 with SMTP id 46e09a7af769-726568e06femr6123717a34.17.1738287598427;
        Thu, 30 Jan 2025 17:39:58 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f49sm659875a34.54.2025.01.30.17.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:39:57 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 04/11] python3-aspectlib: update recipe to use the ptest-python-pytest class
Date: Fri, 31 Jan 2025 01:39:28 +0000
Message-Id: <20250131013935.3714521-4-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131013935.3714521-1-derek@asterius.io>
References: <20250131013935.3714521-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 01:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115181

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-aspectlib/run-ptest               |  3 ---
 .../python/python3-aspectlib_2.0.0.bb                | 12 +-----------
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-aspectlib/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-aspectlib/run-ptest b/meta-python/recipes-devtools/python/python3-aspectlib/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-aspectlib/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
index 1341513289..854a14441c 100644
--- a/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
@@ -10,21 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=80721ace117fd1f814049ecb81c6be76"
 
 SRC_URI[sha256sum] = "a4b461b9da0b531aebcb93efcde3de808a72c60226dd8d902c467d13faf7ce92"
 
-inherit ptest pypi setuptools3
-
-SRC_URI += "file://run-ptest \
-           "
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
+inherit ptest-python-pytest pypi setuptools3
 
 RDEPENDS:${PN}-ptest += "\
     python3-process-tests \
-    python3-pytest \
     python3-tornado \
-    python3-unittest-automake-output \
 "
 
 RDEPENDS:${PN} += " \
-- 
2.34.1



Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A995AC46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 23:05:11 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.7330.1703199908283039211
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 15:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-35f89f18daeso4743885ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 15:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703199906; x=1703804706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K60aJYAEz8PChk7URFCfLP8QkmKFAzkVLIHSrB8J8O4=;
        b=csGOVTvfLjFqf9oMBeO2mpobdSWufyaZgNrjupSzb25yduDvD+SIJ1YxYzawVZzhLL
         me6n9/tWc+UZPtYCxl6FgT7O12sBFNPCjGTeBPOqs3AbO3xOzfvgUebzdg3fgaD18cE5
         Io7vlphffv4XKrovhJWS7kXtn3fPIBYkStuJXfHylFZvXsb+bUe7KVaUWRFNHw4h1idY
         EHlkJ7cUwJNJYkFv4jpXPcKbxkoou87RNhOG7wiwhC4hQJPYNHrHIw6ND+gk1heeJVmV
         97VQcsp1sLnI00vFwaw5qawJKKa/JKE2H4z8yMUWW8DFYg1CjT/qo/ysrX9cGweMVbgr
         PeCA==
X-Gm-Message-State: AOJu0YyT2U8icvw+0phw7BCv4X5xg7/L/j6J0IbPPEJvBLPvjtHTjsZt
	BkCuMZfwvhCc6uTsg0lTC1N+/iv3hzk5xQ==
X-Google-Smtp-Source: AGHT+IHf8Egn98n/v6V+JxGOk6QGrXou4ZgBy2OshkD5z94YtJo0I4AXqEW+cbeUOi1iO5xTJT+7Gw==
X-Received: by 2002:a05:6602:3f8f:b0:7ba:9772:ad8e with SMTP id fb15-20020a0566023f8f00b007ba9772ad8emr631918iob.35.1703199906460;
        Thu, 21 Dec 2023 15:05:06 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ci15-20020a0566383d8f00b004698223a585sm715622jab.74.2023.12.21.15.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 15:05:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-parse: update to version 1.20.0
Date: Thu, 21 Dec 2023 23:04:57 +0000
Message-Id: <20231221230457.3965350-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 23:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107742

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython3-parse_1.19.1.bb => python3-parse_1.20.0.bb} | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.19.1.bb => python3-parse_1.20.0.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb b/meta-python/recipes-devtools/python/python3-parse_1.20.0.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-parse_1.19.1.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.20.0.bb
index 9dc7f7931..3ca6fbbeb 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.20.0.bb
@@ -3,18 +3,13 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "cc3a47236ff05da377617ddefa867b7ba983819c664e1afe46249e5b469be464"
+SRC_URI[sha256sum] = "bd28bae37714b45d5894d77160a16e2be36b64a3b618c81168b3684676aa498b"
 
 SRC_URI += " \
-    git://github.com/r1chardj0n3s/parse.git;branch=master;protocol=https \
     file://run-ptest \
 "
 
-SRCREV ?= "72776522285d516032faa0f80c4ee6a8964075e8"
-
-S = "${WORKDIR}/git"
-
-inherit python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest
 
 RDEPENDS:${PN} += "\
     python3-datetime \
@@ -27,5 +22,5 @@ RDEPENDS:${PN}-ptest += " \
 "
 
 do_install_ptest() {
-    cp -f ${S}/test_parse.py ${D}${PTEST_PATH}/
+    cp -f ${S}/tests/test*.py ${D}${PTEST_PATH}/
 }
-- 
2.34.1



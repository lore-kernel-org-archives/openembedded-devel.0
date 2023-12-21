Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8442DC46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 22:42:21 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.6903.1703198533271730747
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 14:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7b7fd9e17d8so51141239f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 14:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703198531; x=1703803331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jsogD5aOwwLDV+p/u1zkQNczJNJsvql7oO1OWi50VI=;
        b=dFFkFIznAB4CbszrEhqF+fi3rEwJxebuY3Nf3LCiyHxpgyN30S2FsJ6+oLRvbffFJt
         beLMDwr2dgkwmpwd8NRNMKsIVWFsS7uBCxwovIblQkKVEa43dJTLbT5J87GorQD9fEPl
         +bjViF8WgIuOFrP1WXiB+NzwlTx8M5e/dBXLUhzs5WCGrcSbferEhzt6/C8zmNNvE4eM
         ZwhZaqeKxcN5mEXumQYB6ClMyaOlXWoHT5H4LC9HezSW6otW+GbxFy0+/G59ugEmeHHr
         GXhaNqNwboMDzX5XMdtKaaaGZK5ssW0zOJCN+MN58YtqBbylBXpRTOrCXFTxa8UXBmUE
         LDDw==
X-Gm-Message-State: AOJu0Yw1tgl0AP/aOI3K65t3mak5zGpCTILJHH9GkMG3OUG56rRyh3Co
	QSH3p34Xalq18cTR+0wgwiIoMaJpv1bKoA==
X-Google-Smtp-Source: AGHT+IF2y/OQ5koWCS2pEPnwNhiDCIBAV7vrnoJ/Vg52zWD5UZgIokDAX4iViAcheAhO9H9gjbPvUQ==
X-Received: by 2002:a92:c267:0:b0:35f:9f2f:d67a with SMTP id h7-20020a92c267000000b0035f9f2fd67amr350734ild.44.1703198531306;
        Thu, 21 Dec 2023 14:42:11 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id br7-20020a056e0223c700b0035fd0649a12sm775072ilb.20.2023.12.21.14.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 14:42:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-constantly: update to version 23.10.4
Date: Thu, 21 Dec 2023 22:41:58 +0000
Message-Id: <20231221224158.3936559-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 22:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107737

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...-constantly_15.1.0.bb => python3-constantly_23.10.4.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-constantly_15.1.0.bb => python3-constantly_23.10.4.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb b/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb
rename to meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
index 7f9b0326f..cb6ca0a82 100644
--- a/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
@@ -3,9 +3,10 @@ HOMEPAGE = "https://github.com/twisted/constantly"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e393e4ddd223e3a74982efa784f89fd7"
 
-SRC_URI[md5sum] = "f0762f083d83039758e53f8cf0086eef"
-SRC_URI[sha256sum] = "586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35"
+SRC_URI[sha256sum] = "aa92b70a33e2ac0bb33cd745eb61776594dc48764b06c35e0efd050b7f1c7cbd"
 
-inherit pypi setuptools3
+inherit pypi python_poetry_core 
+
+DEPENDS += "${PYTHON_PN}-versioneer-native"
 
 RDEPENDS:${PN} += "${PYTHON_PN}-json"
-- 
2.34.1



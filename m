Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C215C46CD4
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:52:40 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.1977.1703184754994227200
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-35f519f3ea9so5268105ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703184754; x=1703789554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KZsadPIIbWLQH+BbiAgdIZCkQQFi6VzpcMhLah5Gas=;
        b=i4P9Bb39Xc7XzDQq8IE00KsqZNpo7Iz9Hws39DBuwA330Qvtnq1qzEL5Ct5hSg9jXX
         0eAFcx1d1wzJ0CDiznVh6OJGqU2LS+Uwe8a5wriJA9wQgNJLpja+/Cuzj6mONwDsITmm
         I34PilY1rPvMSBo4wIC/wrDwxDTsLRdV6sMG+1WlQ2pNYXpQ/ANEx99rSNx2mql+NM/W
         xvlHiV3xgjzUqz6A+W/xWyK97ryeMhUl/iGWoFhwB3gUEC9LRSeEmGcTcgxJBnXW7IHe
         WEvGwY7S1BIsEQctUgbUdxQi0qFby9z8y1jTNsLJcfZCeA1YyYHCPaTq+jdqhOZreJXu
         94og==
X-Gm-Message-State: AOJu0Yyc+VxLlLseZpeoehar2LH+yfAN4Gppw2zh8dyFPZ124UNcgEQW
	WDaFKeEmRm9BaMUz58dUEkhtEpM3ZmFiUw==
X-Google-Smtp-Source: AGHT+IFpzXUxT+ZDsl06C4N+h30XNFy7UDWOi30x6Thl4cOrSAfP57Ahx6wb+ZDkek2uMJieLImUFA==
X-Received: by 2002:a05:6e02:1523:b0:35c:e98f:c591 with SMTP id i3-20020a056e02152300b0035ce98fc591mr95045ilu.3.1703184753814;
        Thu, 21 Dec 2023 10:52:33 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ba13-20020a0566383a8d00b0046923a214efsm622600jab.22.2023.12.21.10.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:52:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/2] python3-pytest-html: update to version 4.1.1
Date: Thu, 21 Dec 2023 18:52:25 +0000
Message-Id: <20231221185226.3929207-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 18:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107734

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...test-html_3.2.0.bb => python3-pytest-html_4.1.1.bb} | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-html_3.2.0.bb => python3-pytest-html_4.1.1.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_3.2.0.bb b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-pytest-html_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
index 713a84b41..b9023dfcd 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
@@ -4,13 +4,15 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
-SRC_URI[sha256sum] = "c4e2f4bb0bffc437f51ad2174a8a3e71df81bbc2f6894604e604af18fbe687c3"
+SRC_URI[sha256sum] = "70a01e8ae5800f4a074b56a4cb1025c8f4f9b038bba5fe31e3c98eb996686f07"
 
-PYPI_PACKAGE = "pytest-html"
+PYPI_PACKAGE = "pytest_html"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
 
-DEPENDS += "python3-setuptools-scm-git-archive-native"
+DEPENDS += "\
+    ${PYTHON_PN}-hatch-vcs-native \
+"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-pytest \
-- 
2.34.1



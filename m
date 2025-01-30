Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7FEC02196
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:26 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.6253.1738274298891284445
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3cda56e1dffso4348595ab.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274297; x=1738879097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQ/+x+qOmyd5LhFWc7vl5/sEF3avNMW8RiT38ObJORk=;
        b=snNewkM+C+qwc+9jdlwP+0g71W/4MTz0SlDct5Inw6cxjRlRKrpF4QTB1/FdiA4/0W
         I1Acc/0Xh4xZQb1r8ZdQDgokZNMxvqJO8lAXSMZCrA16htgUu/XzmoR2g0Q4S2EjrUxK
         ov8bCxeoLSk9Y+9dlczghELVEcf6Jdn242WneDTI95+hTXWbyRQRzDcXumxuDJK6GuCp
         42CPJMeQ2braEe8KFxJeJNEN4Uqu9PkGtCIFPW3LmQ/69ALXK+R7GHT02XdgqSaR/gs2
         ni4KQ5pFFfndk31RQ9SP8HKrStIe/hLGC4ZIH7B7EGvIUdtGuHRoEUwGDYSaiIQd2jMZ
         wcYg==
X-Gm-Message-State: AOJu0YzvVcMYqe7pLWWq8MLY6wJjCpheqtV0mhmfi/IR6oMU+QRHTD7O
	pVkRf6jQxMZ4RKACtQTmsyN+cjCV/B6S3dHiHRN3TkEpuFeAwBGdIJDC40R7U38=
X-Gm-Gg: ASbGncv4cZiTw67+fNT1f1EUfwhTQZVSDt4cYA/hI/QGzVgEE7017eZcqBGTwlLs6Vk
	OFF5G3VQSajjPKFmh8SzPfmz4TE6gmn76xtWfOYr7RvjwUY9BtrJMEaZDvrXSBThJ5sap9+oZgo
	suyikje9nqUPYsJ6eFmpuItP3Sf7voN6H1n1nZ0RsNIkukimPWf5AeT4oE/7+ucAS2Gq6UYsNhi
	1KVEkGk+/xLRbra+cIBijjyVem3JJItKRzK7nYBg5qETgieKqeRdDSXZ4r1BX72bCUk5CRUaKLs
	H+peLH3SuCb7mYG/osbG3SQL0JWHxF2Q3yjJD2skIb823lMEV+WwYZNl8Ftt
X-Google-Smtp-Source: AGHT+IFQKkRTvaR38Ht4DOgEvfkH7/9FPnrc7IbMyvmyCSM8+I+eySeNYXFlGKAA/+olrqBXqmjyQw==
X-Received: by 2002:a05:6e02:3789:b0:3d0:124d:99e8 with SMTP id e9e14a558f8ab-3d0124da53emr14454435ab.13.1738274297307;
        Thu, 30 Jan 2025 13:58:17 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:16 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 12/23] python3-intervals: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:27 +0000
Message-Id: <20250130215738.3280576-12-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115166

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-intervals/run-ptest              |  3 ---
 .../python/python3-intervals_1.10.0.bb              | 13 ++-----------
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-intervals/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-intervals/run-ptest b/meta-python/recipes-devtools/python/python3-intervals/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-intervals/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
index 3c5be47806..dd9f88748b 100644
--- a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
@@ -7,18 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 PYPI_PACKAGE := "python-intervals"
 
-SRC_URI += " \
-	file://run-ptest \
-"
+inherit pypi setuptools3 ptest-python-pytest
 
-inherit pypi setuptools3 ptest
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
+do_install_ptest:append () {
 	cp -f ${S}/test_intervals.py ${D}${PTEST_PATH}
 	cp -f ${S}/README.md ${D}${PTEST_PATH}
 }
-- 
2.34.1



Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id EFE9978A46
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 13:07:42 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id t6so24414917qtn.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 05:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eHqQAZl1q5wqy9IpKvR9D/RK9FdMGYEy0Ba0haz6G+g=;
	b=FBiXXK/PN2KK6MZsXKq/9u87UmfKwFakqQOH/0bjgmHCtpmqeTI3yZV5ljiPjcPgiR
	8mmu12ZNv8FintfF+3maPGk+E3ThAPVV2V3YZmZa2mFvxnZTCgw1+cmtKAd+jBex1f+P
	vBOcqZPgQnt/MAZeapdzvsh0FdNLGYPA5pFO5/1I9wS2v/SwC0KCf5uHnuBY0ItLZqs3
	h8GQuS1sst6jWgbg9m1j7Ve0cwjwzOn7CMDfCMvoCo23upzLDrXh+MBxnOsNc1Wzrd+y
	unyIr+dq6P26VPAsYjNNy3/y2drzKGBTmAGGXyTVtEBL/Yab15hylzaT4xhaGaGLzlp0
	HPHg==
X-Gm-Message-State: AElRT7Hh2Z2kkrwZGq2aocoBVeqfvmLGZj8Tozn4QijnQfP43ZIe4Y6B
	b/nHEeEfh53wpoQWw2668AohayR/
X-Google-Smtp-Source: AG47ELvyypx9Btls8ay3GuvqOQRaQ+xPR9hYcMAxmZAbGjqKCZd/1MupIiez5GhgX30femFxFNFwPA==
X-Received: by 10.200.34.165 with SMTP id f34mr24486520qta.155.1520341663690; 
	Tue, 06 Mar 2018 05:07:43 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	d184sm10715179qka.68.2018.03.06.05.07.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 05:07:43 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 08:07:37 -0500
Message-Id: <1520341657-15296-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-behave: update to version 1.2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2018 13:07:43 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-behave_1.2.5.bb => python-behave_1.2.6.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-behave_1.2.5.bb => python-behave_1.2.6.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python-behave_1.2.5.bb b/meta-python/recipes-devtools/python/python-behave_1.2.6.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python-behave_1.2.5.bb
rename to meta-python/recipes-devtools/python/python-behave_1.2.6.bb
index 3db2016..6797302 100644
--- a/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
+++ b/meta-python/recipes-devtools/python/python-behave_1.2.6.bb
@@ -2,8 +2,8 @@ SUMMARY = "A behavior-driven development framework, Python style"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
 
-SRC_URI[md5sum] = "3af4bc2886d2be982e41bfaba61da3bc"
-SRC_URI[sha256sum] = "81b731ac5187e31e4aad2594944fa914943683a9818320846d037c5ebd6d5d0b"
+SRC_URI[md5sum] = "3f05c859a1c45f5ed33e925817ad887d"
+SRC_URI[sha256sum] = "b9662327aa53294c1351b0a9c369093ccec1d21026f050c3bd9b3e5cccf81a86"
 
 RDEPENDS_${PN} += "python-difflib python-setuptools python-pkgutil python-misc python-argparse python-xml python-enum34 python-parse python-parse-type python-six"
 
-- 
2.7.4



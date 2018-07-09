Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id B12B1744C1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 16:45:31 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id a5-v6so1389929qtp.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 09:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M7VmE9ePiRjrY7BfBEI6kr/8+pqjbZh8uN9b8lu5ImU=;
	b=Vra9005I4PtJHB/rWQdyuj+A/wTYvfHX6pHPwSLQE4o8hFz4pC9lSc6qJClhDZDFR4
	RvlwLVF09z+oD9pKN1P4LNpoHyw5tQBUVDz5L3BEFwjkDj4CF3/UWqHq2cDNe2XVDp61
	IkHmnStNDZJ6lgyt5qvQNj2j2HuJmPGKCS9QSBG0I6icQ3grxpomuGDOR0CdaQhQ7LDk
	l/w82IQRZ0d04X2PjtRhcPa8PDKzhTgMft9mv4S4uvihv3phfonVePXRuT2UxPq/y0+A
	YBtVtjyB+f+UcC3SyFkYKDFUANM8KSjZ4Hgm+/yKAskkK+BFzOTCokE7CgYfdLvbsl81
	ohag==
X-Gm-Message-State: APt69E24JBPp/Yo5E8aYQAzl3mkfJfZxGPbWyBNW7V1xppVq+0l3UJ6f
	OKsGmfs9n7cZWq91R951Sa90FgX0
X-Google-Smtp-Source: AAOMgpfnazW32wR66+cmeH2RcBcGBDLWUU59mNafsgfCu6xaKiOpvqXIqJEGzsrglVVOgDjexjSZ+Q==
X-Received: by 2002:ac8:29a4:: with SMTP id
	33-v6mr20381765qts.354.1531154732208; 
	Mon, 09 Jul 2018 09:45:32 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	y21-v6sm2617194qtc.41.2018.07.09.09.45.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 09:45:31 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 12:45:25 -0400
Message-Id: <1531154725-10831-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-psutil: update to version 5.4.6
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
X-List-Received-Date: Mon, 09 Jul 2018 16:45:31 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-psutil.inc                 | 4 ++--
 .../python/{python-psutil_5.4.3.bb => python-psutil_5.4.6.bb}         | 0
 .../python/{python3-psutil_5.4.3.bb => python3-psutil_5.4.6.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.4.3.bb => python-psutil_5.4.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.4.3.bb => python3-psutil_5.4.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index 5d8e61f..67ae118 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "3b291833dbea631db9d271aa602a169a"
-SRC_URI[sha256sum] = "e2467e9312c2fa191687b89ff4bc2ad8843be4af6fb4dc95a7cc5f7d7a327b18"
+SRC_URI[md5sum] = "200e073cdd56cc7a9ba9a06088569200"
+SRC_URI[sha256sum] = "686e5a35fe4c0acc25f3466c32e716f2d498aaae7b7edc03e2305b682226bcf6"
 
 PACKAGES =+ "${PN}-tests"
 
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.4.3.bb b/meta-python/recipes-devtools/python/python-psutil_5.4.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.4.3.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.4.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.4.3.bb b/meta-python/recipes-devtools/python/python3-psutil_5.4.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.4.3.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.4.6.bb
-- 
2.7.4



Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3E60A7854D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 15:37:38 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b85so1624306qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 07:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8oQx/82TvKoXXhkjFR1gD0bp5Zeph2rgeprsE32Qf90=;
	b=mABc9GKcueXMiw0efv0/o5Dg3QyzpjT0PbfJ3ilqeKN1meqeuLMHFVSxoCuntYj3Vk
	95/mKLw2/GfOZhD+y6VS7cwlvwF4w9XjRspvFYKCM13WCcWRSaO82yUC7zzc7GlF0aq2
	x3M4cxHESVydIsNAn7MJs7izS4DmU0q8TAMk9DFFTPdcJpWMV4+AVV/68ehTkS2VHKHk
	UK50oClsMOmEgGur1iC19X7DSvQxeJBIhftV+liLjvAASbGosxVT+wYO7eGGYxWa99SE
	toH8JhI5Z4KWLaoL0AYh0YuM9kIMRpcCXRNdGZf+1i7nL8z7ilMwSGHvRCUz9ZVhHVRn
	L7rw==
X-Gm-Message-State: AJaThX5VrcJ9VgxWzna5ZxCA+jljtZ+JEvDlbLnENcPlTvOcyOG8WoiI
	tPkxc7nccVjfMpmiuaRnpuRqVwxz
X-Google-Smtp-Source: AGs4zMatHv/chnBPRbg+Cdf7YJBsUrYjFAmYcYIbrCCayHIc3p3im1O6Ks9gEbCC6YOG65384FQtTw==
X-Received: by 10.233.216.6 with SMTP id u6mr9482674qkf.357.1510501059794;
	Sun, 12 Nov 2017 07:37:39 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	a72sm5342308qkc.60.2017.11.12.07.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 07:37:39 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 10:37:07 -0500
Message-Id: <1510501027-27807-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-psutil: update to version 5.4.1
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
X-List-Received-Date: Sun, 12 Nov 2017 15:37:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-psutil.inc                 | 4 ++--
 .../python/{python-psutil_5.4.0.bb => python-psutil_5.4.1.bb}         | 0
 .../python/{python3-psutil_5.4.0.bb => python3-psutil_5.4.1.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.4.0.bb => python-psutil_5.4.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.4.0.bb => python3-psutil_5.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index 4170ea4..23f8e07 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "01af6219b1e8fcfd53603023967713bf"
-SRC_URI[sha256sum] = "8e6397ec24a2ec09751447d9f169486b68b37ac7a8d794dca003ace4efaafc6a"
+SRC_URI[md5sum] = "c0aa7823e416b4e2ee908c2d387d2662"
+SRC_URI[sha256sum] = "42e2de159e3c987435cb3b47d6f37035db190a1499f3af714ba7af5c379b6ba2"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.4.0.bb b/meta-python/recipes-devtools/python/python-psutil_5.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.4.0.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.4.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.4.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.4.0.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.4.1.bb
-- 
2.7.4



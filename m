Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.35845.1610378726477472078
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 07:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kyz4P-0006IU-HK; Mon, 11 Jan 2021 17:25:26 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-hyperlink: Upgrade 20.0.1 -> 21.0.0
Date: Mon, 11 Jan 2021 17:25:06 +0200
Message-Id: <20210111152512.23506-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111152512.23506-1-leon.anavi@konsulko.com>
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 21.0.0:

- Update plus sign (+) handling to work with/like HTML form
  encoding (POST) by default, fixes #129, and associated
  roundtripping
- Package IDNA tables
- Long overdue dependency bumps

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-hyperlink_20.0.1.bb => python3-hyperlink_21.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-hyperlink_20.0.1.bb => python3-hyperlink_21.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
rename to meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
index c9e281504..5a8791dfb 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/python-hyper/hyperlink"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6dc5b4bd3d02faedf08461621aa2aeca"
 
-SRC_URI[sha256sum] = "47fcc7cd339c6cb2444463ec3277bdcfe142c8b1daf2160bdd52248deec815af"
-SRC_URI[md5sum] = "d7983e3d2625e5f7dffc8d12da8803ab"
+SRC_URI[sha256sum] = "427af957daa58bc909471c6c40f74c5450fa123dd093fc53efd2e91d2705a56b"
 
 inherit pypi setuptools3
 
-- 
2.17.1


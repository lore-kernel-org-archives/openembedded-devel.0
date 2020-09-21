Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.42364.1600695858294045817
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 06:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37232 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kKM75-0004UL-S2; Mon, 21 Sep 2020 16:44:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-isort: Upgrade 5.5.2 -> 5.5.3
Date: Mon, 21 Sep 2020 16:44:03 +0300
Message-Id: <20200921134405.676-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921134405.676-1-leon.anavi@konsulko.com>
References: <20200921134405.676-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.5.3:

- Bug fix: in rare cases isort can mangle yield from or raise
  from statements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_5.5.2.bb => python3-isort_5.5.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.5.2.bb => python3-isort_5.5.3.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
index 0d04157862..00978ec59d 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "844c49ad1bf16a957b490c27b3b9844f"
-SRC_URI[sha256sum] = "171c5f365791073426b5ed3a156c2081a47f88c329161fd28228ff2da4c97ddb"
+SRC_URI[md5sum] = "5200f5b09a2a648775d0e8dbf0c0d3c8"
+SRC_URI[sha256sum] = "6187a9f1ce8784cbc6d1b88790a43e6083a6302f03e9ae482acc0f232a98c843"
 
 inherit pypi setuptools3
 
-- 
2.17.1


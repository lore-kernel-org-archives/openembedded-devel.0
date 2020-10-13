Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.7580.1602579566445156336
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 01:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSG9V-0002BF-4W; Tue, 13 Oct 2020 11:59:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-isort: Upgrade 5.5.4 -> 5.6.4
Date: Tue, 13 Oct 2020 11:59:12 +0300
Message-Id: <20201013085914.31580-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013085914.31580-1-leon.anavi@konsulko.com>
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.6.4:

- Fix: Empty line added between imports that should be skipped.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_5.5.4.bb => python3-isort_5.6.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.5.4.bb => python3-isort_5.6.4.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb b/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
index 0c5842790f..66a5332be7 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.6.4.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "6b90dd55851a8ccb3a19fe2cb82cb82f"
-SRC_URI[sha256sum] = "ba040c24d20aa302f78f4747df549573ae1eaf8e1084269199154da9c483f07f"
+SRC_URI[md5sum] = "d2dfc32943b1d64311facec6a05c2f98"
+SRC_URI[sha256sum] = "dcaeec1b5f0eca77faea2a35ab790b4f3680ff75590bfcb7145986905aab2f58"
 
 inherit pypi setuptools3
 
-- 
2.17.1


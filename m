Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16005.1593011826124941858
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53538 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jo798-00035d-FL; Wed, 24 Jun 2020 18:17:07 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-wcwidth: Upgrade 0.2.4 -> 0.2.5
Date: Wed, 24 Jun 2020 18:16:28 +0300
Message-Id: <20200624151628.547-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624151628.547-1-leon.anavi@konsulko.com>
References: <20200624151628.547-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.2.5:

- Do not depend on pkg_resources module for list_versions()
  function.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wcwidth_0.2.4.bb => python3-wcwidth_0.2.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wcwidth_0.2.4.bb => python3-wcwidth_0.2.5.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
rename to meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
index 48ff37654..710b35913 100644
--- a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[md5sum] = "5e6cd8cd008a7ad2c2578ac49a9d87a1"
-SRC_URI[sha256sum] = "8c6b5b6ee1360b842645f336d9e5d68c55817c26d3050f46b235ef2bc650e48f"
+SRC_URI[md5sum] = "a07a75f99d316e14838ac760c831ea37"
+SRC_URI[sha256sum] = "c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83"
 
 inherit pypi setuptools3
 
-- 
2.17.1


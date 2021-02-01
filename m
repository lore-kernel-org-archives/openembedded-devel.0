Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.33276.1612183531187713005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 04:45:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33634 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6Ya8-0001Fc-HT; Mon, 01 Feb 2021 14:45:30 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-elementpath: Upgrade 2.1.2 -> 2.1.3
Date: Mon,  1 Feb 2021 14:45:13 +0200
Message-Id: <20210201124516.30135-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210201124516.30135-1-leon.anavi@konsulko.com>
References: <20210201124516.30135-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.3:

- Extend tests for XPath 2.0 with minor fixes
- Fix fn:round-half-to-even

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-elementpath_2.1.2.bb => python3-elementpath_2.1.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.1.2.bb => python3-elementpath_2.1.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
index f47f15222..2cba4fb5c 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[md5sum] = "887f60e9c4fb9b0804a38372b2798101"
-SRC_URI[sha256sum] = "23e1fed8d196d9a6cc4d220ef11fbe7eb8cff3a27848621c447e9d96134b2085"
+SRC_URI[sha256sum] = "b729d9376cc0f76479c9b0cef30cc0d3c9082ccb4507caa0da1a5e4964926960"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.17.1


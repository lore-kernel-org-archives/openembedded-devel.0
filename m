Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5989.1615798065884155023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 01:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lLit6-0004Tf-7c; Mon, 15 Mar 2021 10:47:45 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-luma-core: Upgrade 2.2.0 -> 2.3.1
Date: Mon, 15 Mar 2021 10:47:22 +0200
Message-Id: <20210315084727.26812-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210315084727.26812-1-leon.anavi@konsulko.com>
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.3.1:

- Add Github publish action
- Cleanup only GPIO pins used rather than all

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-luma-core_2.2.0.bb => python3-luma-core_2.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_2.2.0.bb => python3-luma-core_2.3.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
index b181e0986..47efe8a72 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
@@ -2,11 +2,11 @@ SUMMARY = "A component library to support SBC display drivers"
 DESCRIPTION = "A component library to support SBC display drivers"
 HOMEPAGE = "https://github.com/rm-hull/luma.core"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=3b1d500f5911ec7522f1f790d616e0ee"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "62a24518d3aa084d75206a19056eb8aa71b5a3d0c159d2e95b388cb3150a7b1c"
+SRC_URI[sha256sum] = "f293f5fff8946eea62af3a5d5d7da55c37d2b64aac6c9c90180a385da9f7d003"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1


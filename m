Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3881.1617626983110079640
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 05:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55456 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lTOfi-0005yF-DX; Mon, 05 Apr 2021 15:49:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-networkx: Upgrade 2.5 -> 2.5.1
Date: Mon,  5 Apr 2021 15:49:29 +0300
Message-Id: <20210405124933.8920-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 2.5.1:

- pagerank uses scipy by default now
- New source argument to has_eulerian_path to look for path
  starting at source
- prefix_tree now uses a non-recursive algorithm. The original
  recursive algorithm is still available via prefix_tree_recursive

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-networkx_2.5.bb => python3-networkx_2.5.1.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.5.bb => python3-networkx_2.5.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.5.bb b/meta-python/recipes-devtools/python/python3-networkx_2.5.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-networkx_2.5.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.5.1.bb
index 70573828b..0b52cfd7e 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.5.1.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a24ea029adac8935699bf69b2e38c728"
 
-SRC_URI[md5sum] = "21f25be1f4373e19153a9beca63346e7"
-SRC_URI[sha256sum] = "7978955423fbc9639c10498878be59caf99b44dc304c2286162fd24b458c1602"
+SRC_URI[sha256sum] = "109cd585cac41297f71103c3c42ac6ef7379f29788eb54cb751be5a663bb235a"
 
 inherit pypi setuptools3
 
-- 
2.17.1


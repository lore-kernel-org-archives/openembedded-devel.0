Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6006.1614863169578294886
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 05:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34576 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lHng7-0000xG-Ov; Thu, 04 Mar 2021 15:06:08 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-astroid: Upgrade 2.5 -> 2.5.1
Date: Thu,  4 Mar 2021 15:05:52 +0200
Message-Id: <20210304130554.32308-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304130554.32308-1-leon.anavi@konsulko.com>
References: <20210304130554.32308-1-leon.anavi@konsulko.com>
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

- The ``context.path`` is reverted to a set because otherwise it
  leads to false positives for non `numpy` functions.
- Don't transform dataclass ClassVars
- Improve typing.TypedDict inference
- Fix the `Duplicates found in MROs` false positive.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-astroid_2.5.bb => python3-astroid_2.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.5.bb => python3-astroid_2.5.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb
index f69d85015c..84315767d3 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[sha256sum] = "b31c92f545517dcc452f284bc9c044050862fbe6d93d2b3de4a215a6b384bf0d"
+SRC_URI[sha256sum] = "cfc35498ee64017be059ceffab0a25bedf7548ab76f2bea691c5565896e7128d"
 
 inherit pypi setuptools3
 
-- 
2.17.1


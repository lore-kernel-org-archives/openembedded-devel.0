Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.14833.1611077879268321391
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59758 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l1ux4-0001eq-2k; Tue, 19 Jan 2021 19:37:58 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-lxml: Upgrade 4.6.1 -> 4.6.2
Date: Tue, 19 Jan 2021 19:37:42 +0200
Message-Id: <20210119173746.24694-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119173746.24694-1-leon.anavi@konsulko.com>
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.6.2:

- A vulnerability (CVE-2020-27783) was discovered in the HTML
  Cleaner by Yaniv Nizry, which allowed JavaScript to pass
  through. The cleaner now removes more sneaky "style" content.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-lxml_4.6.1.bb => python3-lxml_4.6.2.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.6.1.bb => python3-lxml_4.6.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb
index af012e630..f7aed6d77 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb
@@ -18,8 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "10924ab543397a06cb4cfaf9bdf0b80f"
-SRC_URI[sha256sum] = "c152b2e93b639d1f36ec5a8ca24cde4a8eefb2b6b83668fcd8e83a67badcb367"
+SRC_URI[sha256sum] = "cd11c7e8d21af997ee8079037fff88f16fda188a9776eb4b81c7e4c9c0a7d7fc"
 
 inherit pypi setuptools3
 
-- 
2.17.1


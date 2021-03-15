Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6002.1615798064030831177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 01:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lLit4-0004Tf-4s; Mon, 15 Mar 2021 10:47:43 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-jsonpointer: Upgrade 2.0 -> 2.1
Date: Mon, 15 Mar 2021 10:47:20 +0200
Message-Id: <20210315084727.26812-3-leon.anavi@konsulko.com>
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

Upgrade to release 2.1:

- Support Python 3.8 and 3.9

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpointer_2.0.bb => python3-jsonpointer_2.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpointer_2.0.bb => python3-jsonpointer_2.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb b/meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
rename to meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb
index 68bfe9716..a4cc05c94 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = "741b98d0e693b08b5e44e0a9da5a7bb7"
-SRC_URI[sha256sum] = "c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362"
+SRC_URI[sha256sum] = "5a34b698db1eb79ceac454159d3f7c12a451a91f6334a4f638454327b7a89962"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
-- 
2.17.1


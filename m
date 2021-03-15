Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5988.1615798062882080585
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 01:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lLisx-0004Tf-Tb; Mon, 15 Mar 2021 10:47:42 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-jsonpatch: Upgrade 1.31 -> 1.32
Date: Mon, 15 Mar 2021 10:47:19 +0200
Message-Id: <20210315084727.26812-2-leon.anavi@konsulko.com>
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

Upgrade to release 1.32:

- take_index causing 'move' of incorrect values due to bad
  True==1 comparison

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.31.bb => python3-jsonpatch_1.32.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.31.bb => python3-jsonpatch_1.32.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb
index aa3dc8360..0c8624036 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ae6f3686fc71b53a278a9fdeb91afdc0e523e2f8f8a82cb2f04af90413a8eacb"
+SRC_URI[sha256sum] = "b6ddfe6c3db30d81a96aaeceb6baf916094ffa23d7dd5fa2c13e13f8b6e600c2"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
-- 
2.17.1


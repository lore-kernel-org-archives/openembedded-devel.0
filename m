Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5995.1615798070568961777
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 01:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lLitA-0004Tf-W8; Mon, 15 Mar 2021 10:47:49 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-autobahn: Upgrade 21.2.2 -> 21.3.1
Date: Mon, 15 Mar 2021 10:47:27 +0200
Message-Id: <20210315084727.26812-10-leon.anavi@konsulko.com>
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

Upgrade to release 21.3.1:

- fix: Twisted v21.2.0 breaks Crossbar.io

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-autobahn_21.2.2.bb => python3-autobahn_21.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_21.2.2.bb => python3-autobahn_21.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb
index cc3773fc5..daa66ec1a 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "bf7a9d302a34d0f719d43c57f65ca1f2f5c982dd6ea0c11e1e190ef6f43710fe"
+SRC_URI[sha256sum] = "e126c1f583e872fb59e79d36977cfa1f2d0a8a79f90ae31f406faae7664b8e03"
 
 inherit pypi setuptools3
 
-- 
2.17.1


Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.52080.1629279653873017487
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 02:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57436 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mGI3z-00018Q-Gf; Wed, 18 Aug 2021 12:40:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-langtable: Upgrade 0.0.54 -> 0.0.56
Date: Wed, 18 Aug 2021 12:40:35 +0300
Message-Id: <20210818094038.21474-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818094038.21474-1-leon.anavi@konsulko.com>
References: <20210818094038.21474-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 0.0.56:

- Fallback to translations in “xx” from “xx_Zzzz”
  only if “Zzzz” is the main script of “xx”
- Get translation changes for mt from CLDR

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-langtable_0.0.54.bb => python3-langtable_0.0.56.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.54.bb => python3-langtable_0.0.56.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.56.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.56.bb
index e41cfd5dd5..b8f052ea31 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.56.bb
@@ -6,8 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[md5sum] = "bf2db4302dbed534ff322612f5f5a16e"
-SRC_URI[sha256sum] = "2a6298267586fcade84ce977736fc35102ef95d68975bc90ceaa06117d42d5a6"
+SRC_URI[sha256sum] = "318af0fd616711ce5cd2a7b11a6761183ba9c1ff76a762919e08d85645fc854b"
 
 inherit pypi setuptools3 python3native
 
-- 
2.17.1


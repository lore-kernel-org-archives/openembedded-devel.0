Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.1141.1616603876336912703
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53316 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lP6W1-0008Nt-EG; Wed, 24 Mar 2021 18:37:54 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-colorlog: Upgrade 4.7.2 -> 4.8.0
Date: Wed, 24 Mar 2021 18:37:42 +0200
Message-Id: <20210324163746.19010-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.8.0:

- Reformat code with black

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-colorlog_4.7.2.bb => python3-colorlog_4.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_4.7.2.bb => python3-colorlog_4.8.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.8.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_4.8.0.bb
index c9754ed88..6f9b8d47a 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_4.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_4.8.0.bb
@@ -7,4 +7,4 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "18d05b616438a75762d7d214b9ec3b05d274466c9f3ddd92807e755840c88251"
+SRC_URI[sha256sum] = "59b53160c60902c405cdec28d38356e09d40686659048893e026ecbd589516b1"
-- 
2.17.1


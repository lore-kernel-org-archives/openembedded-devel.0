Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6699.1593076057754355088
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNr4-0005y7-I0; Thu, 25 Jun 2020 12:07:35 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/12] python3-pytun: Consolidate in a single file
Date: Thu, 25 Jun 2020 12:07:08 +0300
Message-Id: <20200625090719.16068-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-1.0
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

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb    | 2 --
 .../python-pytun.inc => python3-pytun/python3-pytun_2.3.0.bb}   | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb
 rename meta-python/recipes-connectivity/{python-pytun/python-pytun.inc => python3-pytun/python3-pytun_2.3.0.bb} (92%)

diff --git a/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb b/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb
deleted file mode 100644
index 938d9d739..000000000
--- a/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pytun.inc
-inherit setuptools3
diff --git a/meta-python/recipes-connectivity/python-pytun/python-pytun.inc b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb
similarity index 92%
rename from meta-python/recipes-connectivity/python-pytun/python-pytun.inc
rename to meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb
index 3991a830f..bc11d705f 100644
--- a/meta-python/recipes-connectivity/python-pytun/python-pytun.inc
+++ b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "5ead86b3391acef239535ebcabeb04d2cdc6b40ab14580d28c6da193c2
 
 PYPI_PACKAGE = "python-pytun"
 
-inherit pypi 
+inherit pypi setuptools3
-- 
2.17.1


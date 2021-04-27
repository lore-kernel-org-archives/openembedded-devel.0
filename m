Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5785.1619514965775190972
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Apr 2021 02:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lbJp4-0008Bm-Jp; Tue, 27 Apr 2021 12:16:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-arpeggio: Upgrade 1.10.1 -> 1.10.2
Date: Tue, 27 Apr 2021 12:15:56 +0300
Message-Id: <20210427091557.17899-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210427091557.17899-1-leon.anavi@konsulko.com>
References: <20210427091557.17899-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.10.2:

- Added EditorConfig configuration
- Fixed parsing of version from setup.py when global encoding
  isn't UTF-8
- Fix repetition termination on a successful empty separator match

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-arpeggio_1.10.1.bb => python3-arpeggio_1.10.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-arpeggio_1.10.1.bb => python3-arpeggio_1.10.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb b/meta-python/recipes-devtools/python/python3-arpeggio_1.10.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb
rename to meta-python/recipes-devtools/python/python3-arpeggio_1.10.2.bb
index 38e26623f5..468e6d5fde 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_1.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_1.10.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/Arpeggio/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb"
 
-SRC_URI[sha256sum] = "920d12cc762edb2eb56daae64a14c93e43dc181b481c88fc79314c0df6ee639e"
+SRC_URI[sha256sum] = "bfe349f252f82f82d84cb886f1d5081d1a31451e6045275e9f90b65d0daa06f1"
 
 PYPI_PACKAGE = "Arpeggio"
 inherit pypi setuptools3
-- 
2.17.1


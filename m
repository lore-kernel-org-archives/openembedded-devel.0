Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11296.1614093753241998365
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56178 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEZWA-00022z-AQ; Tue, 23 Feb 2021 17:22:32 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-typeguard: Upgrade 2.11.0 -> 2.11.1
Date: Tue, 23 Feb 2021 17:22:13 +0200
Message-Id: <20210223152219.32129-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223152219.32129-1-leon.anavi@konsulko.com>
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.11.1:

- Fixed compatibility with Python 3.10

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-typeguard_2.11.0.bb => python3-typeguard_2.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.11.0.bb => python3-typeguard_2.11.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
index 3c9cac86bb..640adf83b7 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "cc3b9c3466823e70b47af7bc43e481ef59ad37112ae71c448f0d3fe773db7567"
+SRC_URI[sha256sum] = "33243c1cbfcb9736a06c6db22dd08876b5f297e6344aa272a2862c0f8e669f64"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1


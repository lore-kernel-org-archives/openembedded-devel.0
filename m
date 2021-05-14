Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.9458.1621002231270528053
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 07:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38054 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhYjF-0005Cr-Im; Fri, 14 May 2021 17:23:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-aiohue: Upgrade 2.3.1 -> 2.4.0
Date: Fri, 14 May 2021 17:23:38 +0300
Message-Id: <20210514142341.22666-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514142341.22666-1-leon.anavi@konsulko.com>
References: <20210514142341.22666-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.0:

- Allow listening for Hue events

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aiohue_2.3.1.bb => python3-aiohue_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_2.3.1.bb => python3-aiohue_2.4.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_2.3.1.bb b/meta-python/recipes-devtools/python/python3-aiohue_2.4.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aiohue_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_2.4.0.bb
index bb6b951b87..600a3f4b49 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_2.4.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "d592a9055b56462312fcfccf46601ed4092698db1be5f3fc30c232ea34c6bbe3"
+SRC_URI[sha256sum] = "59ac159301064d222192f7b58891d39a2f25aab620061ed12e7cfaf1b5d1a6cc"
 
 inherit pypi setuptools3
 
-- 
2.17.1


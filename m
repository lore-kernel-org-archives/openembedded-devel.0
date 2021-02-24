Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5622.1614165923061382986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 03:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56972 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEsIA-000137-FO; Wed, 24 Feb 2021 13:25:19 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-rsa: Upgrade 4.7 -> 4.7.1
Date: Wed, 24 Feb 2021 13:25:08 +0200
Message-Id: <20210224112512.31406-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.7.1:

- Fix threading issue introduced in 4.7

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-rsa_4.7.bb => python3-rsa_4.7.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rsa_4.7.bb => python3-rsa_4.7.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.7.bb b/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-rsa_4.7.bb
rename to meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
index c4c36020f4..43e7ca0854 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
@@ -4,7 +4,7 @@ AUTHOR = "Sybren A. Stuvel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
 
-SRC_URI[sha256sum] = "69805d6b69f56eb05b62daea3a7dbd7aa44324ad1306445e05da8060232d00f4"
+SRC_URI[sha256sum] = "9d74d1ff850745c9802cd6b53382bfeec7f6dbe4e26ee2759241ed1e7b0ecf5d"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.17.1


Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.13367.1614269171085835310
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Feb 2021 08:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54856 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lFJ9S-0004JR-48; Thu, 25 Feb 2021 18:06:10 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-rsa: Upgrade 4.7.1 -> 4.7.2
Date: Thu, 25 Feb 2021 18:05:43 +0200
Message-Id: <20210225160544.8994-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225160544.8994-1-leon.anavi@konsulko.com>
References: <20210225160544.8994-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.7.2:

- Fix picking/unpickling issue introduced in 4.7

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-rsa_4.7.1.bb => python3-rsa_4.7.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rsa_4.7.1.bb => python3-rsa_4.7.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb b/meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
rename to meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb
index 43e7ca0854..dcb42aaa9c 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb
@@ -4,7 +4,7 @@ AUTHOR = "Sybren A. Stuvel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
 
-SRC_URI[sha256sum] = "9d74d1ff850745c9802cd6b53382bfeec7f6dbe4e26ee2759241ed1e7b0ecf5d"
+SRC_URI[sha256sum] = "9d689e6ca1b3038bc82bf8d23e944b6b6037bc02301a574935b2dd946e0353b9"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.17.1


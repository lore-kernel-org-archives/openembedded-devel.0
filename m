Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.38670.1615220302112345724
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 08:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35290 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lJIaL-0005d6-5I; Mon, 08 Mar 2021 18:18:21 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-incremental: Upgrade 17.5.0 -> 21.3.0
Date: Mon,  8 Mar 2021 18:18:10 +0200
Message-Id: <20210308161810.21582-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210308161810.21582-1-leon.anavi@konsulko.com>
References: <20210308161810.21582-1-leon.anavi@konsulko.com>
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

Upgrade to release 21.3.0:

- The output of incremental is now compatible with Black
- Incremental now properly supports PEP 440-compliant dev, rc,
  post suffixes
- Incremental now properly supports PEP 440-compliant post
  releases

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-incremental_17.5.0.bb => python3-incremental_21.3.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-incremental_17.5.0.bb => python3-incremental_21.3.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb b/meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
rename to meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb
index 568ba1989..ff8fab31f 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/twisted/incremental"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15"
 
-SRC_URI[md5sum] = "602746e0d438e075a5a9e0678140bba2"
-SRC_URI[sha256sum] = "7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3"
+SRC_URI[sha256sum] = "02f5de5aff48f6b9f665d99d48bfc7ec03b6e3943210de7cfc88856d755d6f57"
 
 inherit pypi setuptools3
 
-- 
2.17.1


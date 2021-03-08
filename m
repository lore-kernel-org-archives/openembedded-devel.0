Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.38024.1615220305388157974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 08:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35290 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lJIaJ-0005d6-MR; Mon, 08 Mar 2021 18:18:20 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-huey: Upgrade 2.3.0 -> 2.3.1
Date: Mon,  8 Mar 2021 18:18:08 +0200
Message-Id: <20210308161810.21582-3-leon.anavi@konsulko.com>
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

Upgrade to release 2.3.1:

- Add SIGNAL_INTERRUPTED to signal when a task is interrupted when
  a consumer exits abruptly.
- Use the Huey.create_consumer() API within the Django management
  command, to allow Django users to customize the creation of the
  Consumer instance.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-huey_2.3.0.bb => python3-huey_2.3.1.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.3.0.bb => python3-huey_2.3.1.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb b/meta-python/recipes-devtools/python/python3-huey_2.3.1.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.3.1.bb
index f70a349fd..d8141c8e8 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.3.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[md5sum] = "aa9f2a8f54cb68c62690c5e28589f49c"
-SRC_URI[sha256sum] = "76978840a875607cd77c283c4ebf3ea5071b2ec06a1ac428d63be0d88f1e7070"
+SRC_URI[sha256sum] = "de9b6d0fd59794378fe05813d302be68038044ef3b68274b84ca8d285e20f803"
 
 inherit pypi setuptools3
 
-- 
2.17.1


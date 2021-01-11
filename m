Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.35460.1610378728804278702
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 07:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kyz4S-0006IU-69; Mon, 11 Jan 2021 17:25:28 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-ptyprocess: Upgrade 0.6.0 -> 0.7.0
Date: Mon, 11 Jan 2021 17:25:09 +0200
Message-Id: <20210111152512.23506-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111152512.23506-1-leon.anavi@konsulko.com>
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.7.0:

- Add pass_fds parameters
- Switch to Github actions for CI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-ptyprocess_0.6.0.bb => python3-ptyprocess_0.7.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ptyprocess_0.6.0.bb => python3-ptyprocess_0.7.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
index 87911e02e..607c71946 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
 
 SRCNAME = "ptyprocess"
 
-SRC_URI[md5sum] = "37402d69f3b50913d4d483587bffad8f"
-SRC_URI[sha256sum] = "923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0"
+SRC_URI[sha256sum] = "5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347423220"
 
 inherit pypi setuptools3
 
-- 
2.17.1

